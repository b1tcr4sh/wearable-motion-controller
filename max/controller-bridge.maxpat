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
                    "id": "obj-61",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 932.3810718655586, 232.0, 203.0, 22.0 ],
                    "text": "udpsend 192.168.4.1 10000 CNMAT"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "id": "obj-81",
                    "linecount": 4,
                    "maxclass": "o.display",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1157.1430054306984, 232.0, 150.0, 72.0 ],
                    "text": "/led/set/state : {\n  /led/1 : [200, 200, 200]\n}"
                }
            },
            {
                "box": {
                    "id": "obj-66",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "FullPacket" ],
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
                        "rect": [ 34.0, 77.0, 1113.0, 713.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "fontsize": 18.0,
                                    "id": "obj-250",
                                    "linecount": 12,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 26.5625, 101.5625, 705.0, 255.0 ],
                                    "text": "receives led values as [ i i i ] on each led-n-buf where n is the led index (0-29)\n\nvalues are held in a buffer until a bang is sent to *led-SCL-pulse* to send them out of the outlet. This will format the values such that:\n\n/led/set/state = {\n  /led/1 = [R, G, B],\n  ...,\n  /led/n = [R, G, B]\n}\n\nWhere /led/set/state contains a bundle of values, each /led/n containing 3 ints R, G, B"
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
                                    "patching_rect": [ 148.7179675102234, 1005.1283321380615, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-246",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 43.5897490978241, 884.6154963970184, 92.0, 22.0 ],
                                    "text": "r led-SCL-pulse"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-245",
                                    "linecount": 8,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 26.5625, 373.4375, 150.0, 117.0 ],
                                    "text": "2 ways of this working...\n\n1. bang every buffer to force them all to send at once\n\n2. only bang to output, so only updated leds are sent"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-216",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1141.0257852077484, 820.5129241943359, 70.0, 22.0 ],
                                    "text": "r led-30-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-218",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1051.282184123993, 820.5129241943359, 70.0, 22.0 ],
                                    "text": "r led-29-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-220",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 961.5385830402374, 820.5129241943359, 70.0, 22.0 ],
                                    "text": "r led-28-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-222",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 871.7949819564819, 820.5129241943359, 70.0, 22.0 ],
                                    "text": "r led-27-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-224",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 782.0513808727264, 820.5129241943359, 70.0, 22.0 ],
                                    "text": "r led-26-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-226",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 692.307779788971, 820.5129241943359, 70.0, 22.0 ],
                                    "text": "r led-25-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-228",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 602.5641787052155, 820.5129241943359, 70.0, 22.0 ],
                                    "text": "r led-24-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-230",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 512.82057762146, 820.5129241943359, 70.0, 22.0 ],
                                    "text": "r led-23-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-232",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 423.07697653770447, 820.5129241943359, 70.0, 22.0 ],
                                    "text": "r led-22-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-234",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 333.333375453949, 820.5129241943359, 70.0, 22.0 ],
                                    "text": "r led-21-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-196",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1141.0257852077484, 684.615471124649, 70.0, 22.0 ],
                                    "text": "r led-20-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-198",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1051.282184123993, 684.615471124649, 70.0, 22.0 ],
                                    "text": "r led-19-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-200",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 961.5385830402374, 684.615471124649, 70.0, 22.0 ],
                                    "text": "r led-18-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-202",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 871.7949819564819, 684.615471124649, 70.0, 22.0 ],
                                    "text": "r led-17-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-204",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 782.0513808727264, 684.615471124649, 70.0, 22.0 ],
                                    "text": "r led-16-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-206",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 692.307779788971, 684.615471124649, 70.0, 22.0 ],
                                    "text": "r led-15-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-208",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 602.5641787052155, 684.615471124649, 70.0, 22.0 ],
                                    "text": "r led-14-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-210",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 512.82057762146, 684.615471124649, 70.0, 22.0 ],
                                    "text": "r led-13-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-212",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 423.07697653770447, 684.615471124649, 70.0, 22.0 ],
                                    "text": "r led-12-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-214",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 333.333375453949, 684.615471124649, 69.0, 22.0 ],
                                    "text": "r led-11-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-194",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1141.0257852077484, 571.7949440479279, 70.0, 22.0 ],
                                    "text": "r led-10-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-192",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1051.282184123993, 571.7949440479279, 63.0, 22.0 ],
                                    "text": "r led-9-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-190",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 961.5385830402374, 571.7949440479279, 63.0, 22.0 ],
                                    "text": "r led-8-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-188",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 871.7949819564819, 571.7949440479279, 63.0, 22.0 ],
                                    "text": "r led-7-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-186",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 782.0513808727264, 571.7949440479279, 63.0, 22.0 ],
                                    "text": "r led-6-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-184",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 692.307779788971, 571.7949440479279, 63.0, 22.0 ],
                                    "text": "r led-5-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-182",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 602.5641787052155, 571.7949440479279, 63.0, 22.0 ],
                                    "text": "r led-4-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-180",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 512.82057762146, 571.7949440479279, 63.0, 22.0 ],
                                    "text": "r led-3-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-178",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 423.07697653770447, 571.7949440479279, 63.0, 22.0 ],
                                    "text": "r led-2-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-177",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 333.333375453949, 571.7949440479279, 63.0, 22.0 ],
                                    "text": "r led-1-buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-168",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 148.7179675102234, 976.9232003688812, 115.0, 22.0 ],
                                    "text": "o.pack /led/set/state"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-158",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 1141.0257852077484, 884.6154963970184, 83.0, 22.0 ],
                                    "text": "o.pack /led/30"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-159",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 1051.282184123993, 884.6154963970184, 83.0, 22.0 ],
                                    "text": "o.pack /led/29"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-160",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 961.5385830402374, 884.6154963970184, 83.0, 22.0 ],
                                    "text": "o.pack /led/28"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-161",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 871.7949819564819, 884.6154963970184, 83.0, 22.0 ],
                                    "text": "o.pack /led/27"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-162",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 782.0513808727264, 884.6154963970184, 83.0, 22.0 ],
                                    "text": "o.pack /led/26"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-163",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 692.307779788971, 884.6154963970184, 83.0, 22.0 ],
                                    "text": "o.pack /led/25"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-164",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 602.5641787052155, 884.6154963970184, 83.0, 22.0 ],
                                    "text": "o.pack /led/24"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-165",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 512.82057762146, 884.6154963970184, 83.0, 22.0 ],
                                    "text": "o.pack /led/23"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-166",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 423.07697653770447, 884.6154963970184, 83.0, 22.0 ],
                                    "text": "o.pack /led/22"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-167",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 333.333375453949, 884.6154963970184, 83.0, 22.0 ],
                                    "text": "o.pack /led/21"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-148",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 1141.0257852077484, 746.1539404392242, 83.0, 22.0 ],
                                    "text": "o.pack /led/20"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-149",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 1051.282184123993, 746.1539404392242, 83.0, 22.0 ],
                                    "text": "o.pack /led/19"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-150",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 961.5385830402374, 746.1539404392242, 83.0, 22.0 ],
                                    "text": "o.pack /led/18"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-151",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 871.7949819564819, 746.1539404392242, 83.0, 22.0 ],
                                    "text": "o.pack /led/17"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-152",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 782.0513808727264, 746.1539404392242, 83.0, 22.0 ],
                                    "text": "o.pack /led/16"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-153",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 692.307779788971, 746.1539404392242, 83.0, 22.0 ],
                                    "text": "o.pack /led/15"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-154",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 602.5641787052155, 746.1539404392242, 83.0, 22.0 ],
                                    "text": "o.pack /led/14"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-155",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 512.82057762146, 746.1539404392242, 83.0, 22.0 ],
                                    "text": "o.pack /led/13"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-156",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 423.07697653770447, 746.1539404392242, 83.0, 22.0 ],
                                    "text": "o.pack /led/12"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-157",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 333.333375453949, 746.1539404392242, 82.0, 22.0 ],
                                    "text": "o.pack /led/11"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-117",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 1141.0257852077484, 635.8975162506104, 83.0, 22.0 ],
                                    "text": "o.pack /led/10"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-116",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 1051.282184123993, 635.8975162506104, 77.0, 22.0 ],
                                    "text": "o.pack /led/9"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-115",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 961.5385830402374, 635.8975162506104, 77.0, 22.0 ],
                                    "text": "o.pack /led/8"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-114",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 871.7949819564819, 635.8975162506104, 77.0, 22.0 ],
                                    "text": "o.pack /led/7"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-113",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 782.0513808727264, 635.8975162506104, 77.0, 22.0 ],
                                    "text": "o.pack /led/6"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-112",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 692.307779788971, 635.8975162506104, 77.0, 22.0 ],
                                    "text": "o.pack /led/5"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-111",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 602.5641787052155, 635.8975162506104, 77.0, 22.0 ],
                                    "text": "o.pack /led/4"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-110",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 512.82057762146, 635.8975162506104, 77.0, 22.0 ],
                                    "text": "o.pack /led/3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-91",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 423.07697653770447, 635.8975162506104, 77.0, 22.0 ],
                                    "text": "o.pack /led/2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-90",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "FullPacket" ],
                                    "patching_rect": [ 333.333375453949, 635.8975162506104, 77.0, 22.0 ],
                                    "text": "o.pack /led/1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-77",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 148.7179675102234, 941.025759935379, 53.0, 22.0 ],
                                    "text": "o.collect"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-22",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 0,
                                    "patching_rect": [ 26.5625, 50.0, 92.0, 22.0 ],
                                    "text": "o.expr.overview"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 522.32057762146, 672.2792438566685, 158.2179675102234, 672.2792438566685 ],
                                    "source": [ "obj-110", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 612.0641787052155, 672.7701514363289, 158.2179675102234, 672.7701514363289 ],
                                    "source": [ "obj-111", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 701.807779788971, 672.7317325472832, 158.2179675102234, 672.7317325472832 ],
                                    "source": [ "obj-112", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 791.5513808727264, 672.6933136582375, 158.2179675102234, 672.6933136582375 ],
                                    "source": [ "obj-113", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 881.2949819564819, 672.3176627457142, 158.2179675102234, 672.3176627457142 ],
                                    "source": [ "obj-114", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 971.0385830402374, 672.2792438566685, 158.2179675102234, 672.2792438566685 ],
                                    "source": [ "obj-115", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 1060.782184123993, 672.1094824671745, 158.2179675102234, 672.1094824671745 ],
                                    "source": [ "obj-116", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 1150.5257852077484, 672.6967550516129, 158.2179675102234, 672.6967550516129 ],
                                    "source": [ "obj-117", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 1150.5257852077484, 804.828262925148, 158.2179675102234, 804.828262925148 ],
                                    "source": [ "obj-148", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 1060.782184123993, 803.7644331455231, 158.2179675102234, 803.7644331455231 ],
                                    "source": [ "obj-149", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 971.0385830402374, 803.7644331455231, 158.2179675102234, 803.7644331455231 ],
                                    "source": [ "obj-150", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 881.2949819564819, 803.7644331455231, 158.2179675102234, 803.7644331455231 ],
                                    "source": [ "obj-151", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 791.5513808727264, 803.7644331455231, 158.2179675102234, 803.7644331455231 ],
                                    "source": [ "obj-152", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 701.807779788971, 802.7006033658981, 158.2179675102234, 802.7006033658981 ],
                                    "source": [ "obj-153", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 612.0641787052155, 804.828262925148, 158.2179675102234, 804.828262925148 ],
                                    "source": [ "obj-154", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 522.32057762146, 804.828262925148, 158.2179675102234, 804.828262925148 ],
                                    "source": [ "obj-155", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 432.57697653770447, 804.828262925148, 158.2179675102234, 804.828262925148 ],
                                    "source": [ "obj-156", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 342.833375453949, 803.7644331455231, 158.2179675102234, 803.7644331455231 ],
                                    "source": [ "obj-157", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 1150.5257852077484, 911.3769096136093, 158.2179675102234, 911.3769096136093 ],
                                    "source": [ "obj-158", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 1060.782184123993, 913.0542363524437, 158.2179675102234, 913.0542363524437 ],
                                    "source": [ "obj-159", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 971.0385830402374, 912.2775752544403, 158.2179675102234, 912.2775752544403 ],
                                    "source": [ "obj-160", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 881.2949819564819, 912.6039035320282, 158.2179675102234, 912.6039035320282 ],
                                    "source": [ "obj-161", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 791.5513808727264, 914.157225728035, 158.2179675102234, 914.157225728035 ],
                                    "source": [ "obj-162", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 701.807779788971, 914.157225728035, 158.2179675102234, 914.157225728035 ],
                                    "source": [ "obj-163", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 612.0641787052155, 912.0295661687851, 158.2179675102234, 912.0295661687851 ],
                                    "source": [ "obj-164", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 522.32057762146, 913.09339594841, 158.2179675102234, 913.09339594841 ],
                                    "source": [ "obj-165", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 432.57697653770447, 911.9904065728188, 158.2179675102234, 911.9904065728188 ],
                                    "source": [ "obj-166", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 342.833375453949, 911.8272424340248, 158.2179675102234, 911.8272424340248 ],
                                    "source": [ "obj-167", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-248", 0 ],
                                    "source": [ "obj-168", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-90", 0 ],
                                    "source": [ "obj-177", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-91", 0 ],
                                    "source": [ "obj-178", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-110", 0 ],
                                    "source": [ "obj-180", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-111", 0 ],
                                    "source": [ "obj-182", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-112", 0 ],
                                    "source": [ "obj-184", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-113", 0 ],
                                    "source": [ "obj-186", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-114", 0 ],
                                    "source": [ "obj-188", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-115", 0 ],
                                    "source": [ "obj-190", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-116", 0 ],
                                    "source": [ "obj-192", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-117", 0 ],
                                    "source": [ "obj-194", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-148", 0 ],
                                    "source": [ "obj-196", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-149", 0 ],
                                    "source": [ "obj-198", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-150", 0 ],
                                    "source": [ "obj-200", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-151", 0 ],
                                    "source": [ "obj-202", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-152", 0 ],
                                    "source": [ "obj-204", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-153", 0 ],
                                    "source": [ "obj-206", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-154", 0 ],
                                    "source": [ "obj-208", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-155", 0 ],
                                    "source": [ "obj-210", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-156", 0 ],
                                    "source": [ "obj-212", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-157", 0 ],
                                    "source": [ "obj-214", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-158", 0 ],
                                    "source": [ "obj-216", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-159", 0 ],
                                    "source": [ "obj-218", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-160", 0 ],
                                    "source": [ "obj-220", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-161", 0 ],
                                    "source": [ "obj-222", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-162", 0 ],
                                    "source": [ "obj-224", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-163", 0 ],
                                    "source": [ "obj-226", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-164", 0 ],
                                    "source": [ "obj-228", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-165", 0 ],
                                    "source": [ "obj-230", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-166", 0 ],
                                    "source": [ "obj-232", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-167", 0 ],
                                    "source": [ "obj-234", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "source": [ "obj-246", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-168", 0 ],
                                    "source": [ "obj-77", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 342.833375453949, 672.0188496112823, 158.2179675102234, 672.0188496112823 ],
                                    "source": [ "obj-90", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "midpoints": [ 432.57697653770447, 672.3176627457142, 158.2179675102234, 672.3176627457142 ],
                                    "source": [ "obj-91", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 932.3810718655586, 192.3809770345688, 61.0, 22.0 ],
                    "text": "p raw-osc"
                }
            },
            {
                "box": {
                    "id": "obj-57",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 746.710519194603, 29.978723883628845, 150.0, 20.0 ],
                    "text": "rgb 0-255"
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 746.710519194603, 168.61702007055283, 93.0, 22.0 ],
                    "text": "/led/all $1 $2 $5"
                }
            },
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 746.710519194603, 61.361702382564545, 48.0, 22.0 ],
                    "text": "r led-all"
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "float", "float", "float", "float", "float", "float" ],
                    "patching_rect": [ 222.0, 328.6549564599991, 87.0, 22.0 ],
                    "text": "unpack f f f f f f"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 222.0, 298.83039635419846, 89.0, 22.0 ],
                    "text": "route /imu/data"
                }
            },
            {
                "box": {
                    "id": "obj-62",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 681.1428875923157, 395.4128110408783, 45.0, 22.0 ],
                    "text": "int 100"
                }
            },
            {
                "box": {
                    "id": "obj-54",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 758.1080574989319, 398.1651043891907, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-44",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 758.1080574989319, 322.93575286865234, 150.0, 20.0 ],
                    "text": "smoothing time ms"
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-22",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 758.1080574989319, 346.7889618873596, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 681.1428875923157, 350.7889618873596, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-36",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 558.6972196102142, 536.6972029209137, 83.0, 22.0 ],
                    "text": "scalensmooth"
                }
            },
            {
                "box": {
                    "id": "obj-40",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 491.72474813461304, 501.8348205089569, 83.0, 22.0 ],
                    "text": "scalensmooth"
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 423.8348455429077, 465.13757586479187, 83.0, 22.0 ],
                    "text": "scalensmooth"
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 356.8623740673065, 536.6972029209137, 83.0, 22.0 ],
                    "text": "scalensmooth"
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 289.8899025917053, 501.8348205089569, 83.0, 22.0 ],
                    "text": "scalensmooth"
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 222.0, 465.13757586479187, 83.0, 22.0 ],
                    "text": "scalensmooth"
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 667.0212718248367, 95.93617022037506, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 667.0212718248367, 61.361702382564545, 49.0, 22.0 ],
                    "text": "r led-off"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 667.0212718248367, 168.61702007055283, 44.0, 22.0 ],
                    "text": "/led/off"
                }
            },
            {
                "box": {
                    "id": "obj-60",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 578.0, 61.361702382564545, 66.0, 22.0 ],
                    "text": "r led-bright"
                }
            },
            {
                "box": {
                    "id": "obj-59",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "int", "int", "int", "int" ],
                    "patching_rect": [ 497.42168602347374, 97.0, 71.0, 22.0 ],
                    "text": "unpack i i i i"
                }
            },
            {
                "box": {
                    "id": "obj-58",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 497.42168602347374, 61.361702382564545, 52.0, 22.0 ],
                    "text": "r led-set"
                }
            },
            {
                "box": {
                    "id": "obj-56",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 578.0, 29.978723883628845, 105.42169064283371, 20.0 ],
                    "text": "brightness 0-100"
                }
            },
            {
                "box": {
                    "id": "obj-45",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 495.82594135403633, 29.978723883628845, 65.46391385793686, 20.0 ],
                    "text": "index rgb"
                }
            },
            {
                "box": {
                    "id": "obj-38",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 578.0, 97.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 497.42168602347374, 136.84210395812988, 61.0, 22.0 ],
                    "text": "pak i i i i i"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 497.3684163093567, 171.92982292175293, 131.0, 22.0 ],
                    "text": "/led/set $1 $2 $3 $4 $5"
                }
            },
            {
                "box": {
                    "id": "obj-39",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 116.513751745224, 396.4128110408783, 49.0, 20.0 ],
                    "text": "accel"
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 32.11008906364441, 396.4128110408783, 35.0, 20.0 ],
                    "text": "gyro"
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 116.513751745224, 451.45867800712585, 48.0, 22.0 ],
                    "text": "pak f f f"
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 25.688071250915527, 451.45867800712585, 48.0, 22.0 ],
                    "text": "pak f f f"
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 380.70175075531006, 96.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 222.0, 96.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "" ],
                    "patching_rect": [ 222.0, 139.0, 44.0, 22.0 ],
                    "text": "sel 1 0"
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-12",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 116.513751745224, 484.4861981868744, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-11",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 25.688071250915527, 484.4861981868744, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 380.70175075531006, 29.82456111907959, 97.36842012405396, 20.0 ],
                    "text": "calibrate (bang)"
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-6",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 380.70175075531006, 57.01754331588745, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 221.92982244491577, 30.0, 111.40350770950317, 20.0 ],
                    "text": "start/stop (toggle)"
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-3",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 222.0, 52.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-74",
                    "linecount": 8,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 53.0, 30.0, 150.0, 117.0 ],
                    "text": "sends to /imu/start to trigger esp begin send\n\nsend to /imu/stop to trigger esp halt send\n\nsend to /imu/calibrate to trigger calibration"
                }
            },
            {
                "box": {
                    "id": "obj-72",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 53.0, 183.0, 150.0, 48.0 ],
                    "text": "receives on:\ngyro-x gyro-y gyro-z\naccel-x accel-y accel-z"
                }
            },
            {
                "box": {
                    "id": "obj-51",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 558.6972196102142, 660.5504035949707, 56.0, 22.0 ],
                    "text": "s accel-z"
                }
            },
            {
                "box": {
                    "id": "obj-50",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 491.72474813461304, 660.5504035949707, 56.0, 22.0 ],
                    "text": "s accel-y"
                }
            },
            {
                "box": {
                    "id": "obj-49",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 423.8348455429077, 660.5504035949707, 56.0, 22.0 ],
                    "text": "s accel-x"
                }
            },
            {
                "box": {
                    "id": "obj-48",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 356.8623740673065, 660.5504035949707, 51.0, 22.0 ],
                    "text": "s gyro-z"
                }
            },
            {
                "box": {
                    "id": "obj-47",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 289.8899025917053, 660.5504035949707, 51.0, 22.0 ],
                    "text": "s gyro-y"
                }
            },
            {
                "box": {
                    "id": "obj-46",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 222.0, 660.5504035949707, 51.0, 22.0 ],
                    "text": "s gyro-x"
                }
            },
            {
                "box": {
                    "id": "obj-31",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 380.70175075531006, 172.0, 90.0, 22.0 ],
                    "text": "/esp/calibrate 1"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-27",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 556.862357378006, 395.4128110408783, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-28",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 490.8073170185089, 395.4128110408783, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-29",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 423.8348455429077, 395.4128110408783, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-23",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 356.8623740673065, 395.4128110408783, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-21",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 289.8899025917053, 395.4128110408783, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-20",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 222.0, 395.4128110408783, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 292.0, 172.0, 67.0, 22.0 ],
                    "text": "/imu/stop 1"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 222.0, 172.0, 68.0, 22.0 ],
                    "text": "/imu/start 1"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 222.0, 232.0, 158.0, 22.0 ],
                    "text": "udpsend 192.168.4.1 10000"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 222.0, 266.05502367019653, 104.0, 22.0 ],
                    "text": "udpreceive 12000"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "midpoints": [ 676.5212718248367, 214.8148077726364, 231.5, 214.8148077726364 ],
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "source": [ "obj-14", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-31", 0 ],
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "order": 0,
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 0 ],
                    "midpoints": [ 231.5, 445.05502367019653, 35.18807125091553, 445.05502367019653 ],
                    "order": 1,
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 0 ],
                    "order": 0,
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 1 ],
                    "midpoints": [ 299.3899025917053, 443.05502367019653, 49.68807125091553, 443.05502367019653 ],
                    "order": 1,
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-54", 0 ],
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 2 ],
                    "midpoints": [ 366.3623740673065, 443.05502367019653, 64.18807125091553, 443.05502367019653 ],
                    "order": 1,
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 0 ],
                    "order": 0,
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 0 ],
                    "source": [ "obj-25", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "midpoints": [ 245.1, 371.34501308202744, 299.3899025917053, 371.34501308202744 ],
                    "source": [ "obj-25", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "midpoints": [ 258.7, 371.34501308202744, 366.3623740673065, 371.34501308202744 ],
                    "source": [ "obj-25", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-27", 0 ],
                    "midpoints": [ 299.5, 371.34501308202744, 566.362357378006, 371.34501308202744 ],
                    "source": [ "obj-25", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "midpoints": [ 285.9, 370.76021778583527, 500.3073170185089, 370.76021778583527 ],
                    "source": [ "obj-25", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 0 ],
                    "midpoints": [ 272.3, 371.34501308202744, 433.3348455429077, 371.34501308202744 ],
                    "source": [ "obj-25", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 0 ],
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 2 ],
                    "midpoints": [ 566.362357378006, 443.05502367019653, 155.013751745224, 443.05502367019653 ],
                    "order": 1,
                    "source": [ "obj-27", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "order": 0,
                    "source": [ "obj-27", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 1 ],
                    "midpoints": [ 500.3073170185089, 441.05502367019653, 140.513751745224, 441.05502367019653 ],
                    "order": 1,
                    "source": [ "obj-28", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 0 ],
                    "order": 0,
                    "source": [ "obj-28", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "midpoints": [ 433.3348455429077, 444.05502367019653, 126.013751745224, 444.05502367019653 ],
                    "order": 1,
                    "source": [ "obj-29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "order": 0,
                    "source": [ "obj-29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-53", 0 ],
                    "source": [ "obj-30", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "midpoints": [ 390.20175075531006, 214.18440163135529, 231.5, 214.18440163135529 ],
                    "source": [ "obj-31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-51", 0 ],
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 4 ],
                    "midpoints": [ 587.5, 130.31589114665985, 548.9216860234737, 130.31589114665985 ],
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "source": [ "obj-42", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-62", 0 ],
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "midpoints": [ 756.210519194603, 213.81578743457794, 231.5, 213.81578743457794 ],
                    "source": [ "obj-53", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-62", 0 ],
                    "midpoints": [ 767.6080574989319, 427.42859053611755, 736.0000329017639, 427.42859053611755, 736.0000329017639, 384.5714457631111, 690.6428875923157, 384.5714457631111 ],
                    "source": [ "obj-54", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-59", 0 ],
                    "source": [ "obj-58", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 3 ],
                    "source": [ "obj-59", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 2 ],
                    "source": [ "obj-59", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 1 ],
                    "source": [ "obj-59", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 0 ],
                    "source": [ "obj-59", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-19", 0 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "source": [ "obj-60", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 1 ],
                    "midpoints": [ 690.6428875923157, 450.85716301202774, 295.5, 450.85716301202774 ],
                    "order": 5,
                    "source": [ "obj-62", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 1 ],
                    "midpoints": [ 690.6428875923157, 448.57144862413406, 363.3899025917053, 448.57144862413406 ],
                    "order": 4,
                    "source": [ "obj-62", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 1 ],
                    "midpoints": [ 690.6428875923157, 450.2857344150543, 430.3623740673065, 450.2857344150543 ],
                    "order": 3,
                    "source": [ "obj-62", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 1 ],
                    "midpoints": [ 690.6428875923157, 447.4285914301872, 632.1972196102142, 447.4285914301872 ],
                    "order": 0,
                    "source": [ "obj-62", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 1 ],
                    "midpoints": [ 690.6428875923157, 448.00002002716064, 565.224748134613, 448.00002002716064 ],
                    "order": 1,
                    "source": [ "obj-62", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 1 ],
                    "midpoints": [ 690.6428875923157, 449.1428772211075, 497.3348455429077, 449.1428772211075 ],
                    "order": 2,
                    "source": [ "obj-62", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 0 ],
                    "order": 1,
                    "source": [ "obj-66", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-81", 0 ],
                    "order": 0,
                    "source": [ "obj-66", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "midpoints": [ 506.8684163093567, 214.0350856781006, 231.5, 214.0350856781006 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "source": [ "obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "midpoints": [ 301.5, 213.47518175840378, 231.5, 213.47518175840378 ],
                    "source": [ "obj-9", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}