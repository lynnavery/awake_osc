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
					"patching_rect" : [ 40.0, 20.0, 600.0, 20.0 ],
					"text" : "awake_osc receiver — jitter buffer smooths out UDP delivery timing"
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
					"text" : "udpreceive 10101"
				}
			},
			{
				"box" : 				{
					"id" : "obj-route",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 40.0, 105.0, 320.0, 22.0 ],
					"text" : "route /awake/note_on /awake/note_off"
				}
			},
			{
				"box" : 				{
					"id" : "obj-unpack-on",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "float", "float", "float" ],
					"patching_rect" : [ 40.0, 155.0, 110.0, 22.0 ],
					"text" : "unpack f f f"
				}
			},
			{
				"box" : 				{
					"id" : "obj-unpack-off",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 380.0, 155.0, 70.0, 22.0 ],
					"text" : "unpack f"
				}
			},
			{
				"box" : 				{
					"id" : "obj-pipe-on",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "float", "float", "float" ],
					"patching_rect" : [ 40.0, 210.0, 110.0, 22.0 ],
					"text" : "pipe 20 20 20"
				}
			},
			{
				"box" : 				{
					"id" : "obj-pipe-off",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 380.0, 210.0, 70.0, 22.0 ],
					"text" : "pipe 20"
				}
			},
			{
				"box" : 				{
					"id" : "comment-tune",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 170.0, 210.0, 250.0, 34.0 ],
					"text" : "increase the ms args on both pipes together if hiccups persist; this is a fixed latency/smoothness tradeoff"
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
					"patching_rect" : [ 40.0, 265.0, 70.0, 22.0 ]
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
					"patching_rect" : [ 125.0, 265.0, 70.0, 22.0 ]
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
					"patching_rect" : [ 210.0, 265.0, 70.0, 22.0 ]
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
					"patching_rect" : [ 380.0, 265.0, 70.0, 22.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "comment-note",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 40.0, 295.0, 70.0, 18.0 ],
					"text" : "note"
				}
			},
			{
				"box" : 				{
					"id" : "comment-freq",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 125.0, 295.0, 70.0, 18.0 ],
					"text" : "freq (hz)"
				}
			},
			{
				"box" : 				{
					"id" : "comment-vel",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 210.0, 295.0, 70.0, 18.0 ],
					"text" : "velocity"
				}
			},
			{
				"box" : 				{
					"id" : "comment-noteoff",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 380.0, 295.0, 70.0, 18.0 ],
					"text" : "note off"
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
					"destination" : [ "obj-unpack-on", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-route", 1 ],
					"destination" : [ "obj-unpack-off", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-unpack-on", 0 ],
					"destination" : [ "obj-pipe-on", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-unpack-on", 1 ],
					"destination" : [ "obj-pipe-on", 1 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-unpack-on", 2 ],
					"destination" : [ "obj-pipe-on", 2 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-unpack-off", 0 ],
					"destination" : [ "obj-pipe-off", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-pipe-on", 0 ],
					"destination" : [ "flonum-note", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-pipe-on", 1 ],
					"destination" : [ "flonum-freq", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-pipe-on", 2 ],
					"destination" : [ "flonum-vel", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-pipe-off", 0 ],
					"destination" : [ "flonum-noteoff", 0 ]
				}
			}
		]
	}
}
