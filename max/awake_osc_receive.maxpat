{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 5,
			"revision" : 0,
			"architecture" : "x64",
			"modernui" : 1
		},
		"classnamespace" : "box",
		"rect" : [ 85.0, 100.0, 700.0, 440.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [
			{
				"box" : 				{
					"id" : "comment-title",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 40.0, 20.0, 620.0, 20.0 ],
					"text" : "awake_osc receiver — recovers a smoothed local clock from /clock/tick, schedules notes against it"
				}
			},
			{
				"box" : 				{
					"id" : "obj-udpreceive",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 40.0, 60.0, 140.0, 22.0 ],
					"text" : "udpreceive 10111"
				}
			},
			{
				"box" : 				{
					"id" : "obj-route",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 40.0, 105.0, 300.0, 22.0 ],
					"text" : "route /awake/clock/tick /awake/note"
				}
			},
			{
				"box" : 				{
					"id" : "obj-js",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 40.0, 160.0, 160.0, 22.0 ],
					"text" : "js clockrecovery.js"
				}
			},
			{
				"box" : 				{
					"id" : "comment-js",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 215.0, 160.0, 420.0, 34.0 ],
					"text" : "in 0 = tick period, in 1 = note; out 0 = note-on [note freq vel], out 1 = note-off [note]. optional args: [js clockrecovery.js period_alpha phase_alpha] to tune smoothing (lower = smoother but slower to track tempo changes)"
				}
			},
			{
				"box" : 				{
					"id" : "obj-unpack-on",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "float", "float", "float" ],
					"patching_rect" : [ 40.0, 220.0, 110.0, 22.0 ],
					"text" : "unpack f f f"
				}
			},
			{
				"box" : 				{
					"id" : "flonum-note",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 40.0, 270.0, 70.0, 22.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "flonum-freq",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 125.0, 270.0, 70.0, 22.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "flonum-vel",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 210.0, 270.0, 70.0, 22.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "flonum-noteoff",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 330.0, 270.0, 70.0, 22.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "comment-note",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 40.0, 300.0, 70.0, 18.0 ],
					"text" : "note"
				}
			},
			{
				"box" : 				{
					"id" : "comment-freq",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 125.0, 300.0, 70.0, 18.0 ],
					"text" : "freq (hz)"
				}
			},
			{
				"box" : 				{
					"id" : "comment-vel",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 210.0, 300.0, 70.0, 18.0 ],
					"text" : "velocity"
				}
			},
			{
				"box" : 				{
					"id" : "comment-noteoff",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 330.0, 300.0, 70.0, 18.0 ],
					"text" : "note off"
				}
			},
			{
				"box" : 				{
					"id" : "comment-announce",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 470.0, 20.0, 190.0, 34.0 ],
					"text" : "edit the IP below, click connect, then click announce so awake_osc auto-discovers this computer"
				}
			},
			{
				"box" : 				{
					"id" : "msg-connect",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 470.0, 65.0, 190.0, 22.0 ],
					"text" : "connect 192.168.1.185 10111"
				}
			},
			{
				"box" : 				{
					"id" : "obj-udpsend",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 470.0, 105.0, 100.0, 22.0 ],
					"text" : "udpsend"
				}
			},
			{
				"box" : 				{
					"id" : "msg-hello",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 470.0, 145.0, 100.0, 22.0 ],
					"text" : "/awake/hello"
				}
			}
		],
		"lines" : [
			{
				"patchline" : 				{
					"source" : [ "obj-udpreceive", 0 ],
					"destination" : [ "obj-route", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-route", 0 ],
					"destination" : [ "obj-js", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-route", 1 ],
					"destination" : [ "obj-js", 1 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-js", 0 ],
					"destination" : [ "obj-unpack-on", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-unpack-on", 0 ],
					"destination" : [ "flonum-note", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-unpack-on", 1 ],
					"destination" : [ "flonum-freq", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-unpack-on", 2 ],
					"destination" : [ "flonum-vel", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-js", 1 ],
					"destination" : [ "flonum-noteoff", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "msg-connect", 0 ],
					"destination" : [ "obj-udpsend", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "msg-hello", 0 ],
					"destination" : [ "obj-udpsend", 0 ]
				}
			}
		]
	}
}
