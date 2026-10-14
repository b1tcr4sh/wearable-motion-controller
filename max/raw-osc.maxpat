{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 5,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 34.0, 77.0, 1468.0, 713.0 ],
        "boxes": [
            {
                "box": {
                    "fontsize": 18.0,
                    "id": "obj-250",
                    "linecount": 8,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 506.36361825466156, 32.72727155685425, 705.0, 172.0 ],
                    "presentation_linecount": 8,
                    "text": "receives led values as [ i i i ] on each led-n-buf where n is the led index (1-30)\n\nvalues are held in a buffer until a bang is sent to *led-SCL-pulse* to send them out of the outlet. This will format the values such that:\n\n/led/set/state [ R, G, B, .... ]\n\nWhere /led/set/state contains a blob of 90 bytes (R, G, B for each led)"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 316.0, 71.0, 140.0, 22.0 ],
                    "text": "poly~ led-buffers-poly 30"
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 227.0, 385.0, 42.0, 22.0 ],
                    "text": "o.print"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 141.0, 154.0, 57.0, 22.0 ],
                    "text": "r led-vals"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 137.0, 104.0, 80.0, 22.0 ],
                    "text": "s get-led-vals"
                }
            },
            {
                "box": {
                    "id": "obj-240",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 63.0, 28.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 98.0, 71.0, 32.0, 22.0 ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "FullPacket" ],
                    "patching_rect": [ 98.0, 320.0, 92.0, 22.0 ],
                    "text": "o.route /dummy"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "id": "obj-1",
                    "linecount": 5,
                    "maxclass": "o.expr.codebox",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "FullPacket", "FullPacket" ],
                    "patching_rect": [ 98.0, 229.0, 403.0, 83.0 ],
                    "text": "/dummy/led/set/state = blob([/led/1, /led/2, /led/3, /led/4, /led/5, /led/6, /led/7, /led/8, /led/9, /led/10, /led/11, /led/12, /led/13, /led/14, /led/15, /led/16, /led/17, /led/18, /led/19, /led/20, /led/21, /led/22, /led/23, /led/24, /led/25, /led/26, /led/27, /led/28, /led/29, /led/30])"
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-248",
                    "index": 1,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 98.0, 364.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-246",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 98.0, 29.0, 92.0, 22.0 ],
                    "text": "r led-SCL-pulse"
                }
            },
            {
                "box": {
                    "id": "obj-77",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 98.0, 194.0, 53.0, 22.0 ],
                    "text": "o.collect"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "order": 0,
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-248", 0 ],
                    "order": 1,
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 0 ],
                    "source": [ "obj-240", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 0 ],
                    "source": [ "obj-246", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "source": [ "obj-29", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-77", 0 ],
                    "source": [ "obj-29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-77", 0 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-77", 0 ]
                }
            }
        ]
    }
}