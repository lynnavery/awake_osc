// clockrecovery.js
//
// Builds a jitter-smoothed local clock from a steady /awake/clock/tick
// stream and schedules /awake/note playback against that predicted
// clock instead of the raw, jittery arrival time of each OSC packet.
// This is a minimal digital phase-locked loop (DPLL): the same
// technique used for MIDI clock smoothing / word clock recovery.
//
// inlet 0: tick period in ms (float), from route's /awake/clock/tick outlet
// inlet 1: note list [note, freq, vel, dur_ms], from route's /awake/note outlet
//
// outlet 0: note-on -- [note, freq, vel], scheduled against the
//           recovered clock, not against arrival time
// outlet 1: note-off -- [note], dur_ms after the scheduled note-on
//
// optional creation arguments: [js clockrecovery.js <period_alpha> <phase_alpha>]
//   period_alpha (default 0.15): how much each new reported period
//     nudges the smoothed period estimate. Higher = tracks tempo
//     changes faster but passes more jitter through.
//   phase_alpha (default 0.25): how much each tick's arrival error
//     nudges the predicted next-tick time. Higher = corrects drift
//     faster but passes more jitter through.
// if hiccups persist, try lowering these; if it feels sluggish to
// follow real tempo changes, raise them.

inlets = 2;
outlets = 2;

var periodAlpha = (jsarguments.length > 1) ? Number(jsarguments[1]) : 0.15;
var phaseAlpha = (jsarguments.length > 2) ? Number(jsarguments[2]) : 0.25;

var estPeriod = null; // smoothed step period, ms
var nextExpected = null; // predicted Date.now()-domain time of next tick

var pendingOnTask = null;
var pendingOffTask = null;

function tick(periodReported) {
	var now = Date.now();

	if (estPeriod === null) {
		estPeriod = periodReported;
		nextExpected = now + estPeriod;
		return;
	}

	estPeriod = estPeriod * (1 - periodAlpha) + periodReported * periodAlpha;

	// how far off was 'now' from where we predicted this tick would land
	var error = now - nextExpected;

	// gently correct the phase prediction rather than snapping to it --
	// this is what actually absorbs jitter instead of just passing it through
	nextExpected = now + estPeriod - error * phaseAlpha;
}

function scheduleNote(note, freq, vel, dur) {
	var now = Date.now();
	var target = (nextExpected === null) ? now : nextExpected;
	var delay = target - now;
	if (delay < 0) {
		delay = 0;
	}

	if (pendingOnTask) {
		pendingOnTask.cancel();
	}
	pendingOnTask = new Task(fireNoteOn, this, [note, freq, vel, dur]);
	pendingOnTask.schedule(delay);
}

function fireNoteOn(args) {
	var note = args[0];
	var freq = args[1];
	var vel = args[2];
	var dur = args[3];

	outlet(0, note, freq, vel);

	if (pendingOffTask) {
		pendingOffTask.cancel();
	}
	pendingOffTask = new Task(fireNoteOff, this, note);
	pendingOffTask.schedule(dur);
}

function fireNoteOff(note) {
	outlet(1, note);
}

function msg_float(v) {
	if (inlet === 0) {
		tick(v);
	}
}

function list() {
	var a = arrayfromargs(arguments);
	if (inlet === 0 && a.length >= 1) {
		tick(a[0]);
	} else if (inlet === 1 && a.length >= 4) {
		scheduleNote(a[0], a[1], a[2], a[3]);
	}
}

function anything() {
	if (messagename === "clear") {
		if (pendingOnTask) {
			pendingOnTask.cancel();
		}
		if (pendingOffTask) {
			pendingOffTask.cancel();
		}
		estPeriod = null;
		nextExpected = null;
	}
}
