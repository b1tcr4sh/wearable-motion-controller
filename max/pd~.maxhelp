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
        "rect": [ 127.0, 128.0, 877.0, 631.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 50.92592507600784, 633.333322763443, 35.0, 22.0 ],
                    "text": "dac~"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-64",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 144.0, 294.0, 116.0, 20.0 ],
                    "text": "Open this sub-patch "
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-63",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 66.0, 254.5, 244.0, 20.0 ],
                    "text": "Select the folder where Pd is installed."
                }
            },
            {
                "box": {
                    "id": "obj-62",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 36.0, 254.5, 18.0, 18.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-57",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
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
                        "rect": [ 371.0, 146.0, 731.0, 574.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-14",
                                    "maxclass": "button",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 521.0, 342.0, 18.0, 18.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-12",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "bang" ],
                                    "patching_rect": [ 495.0, 403.5, 32.0, 22.0 ],
                                    "text": "t b b"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-11",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 173.0, 341.0, 343.0, 20.0 ],
                                    "text": "You can also set Pd directory and start sub-process like this:"
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 11.600006,
                                    "id": "obj-9",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 169.0, 482.0, 324.0, 22.0 ],
                                    "text": "pd~ start \"C:/Program Files/Pd/extra/pd~/pd~-subprocess.pd\""
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 11.600006,
                                    "id": "obj-7",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 169.0, 430.0, 192.0, 22.0 ],
                                    "text": "pd~ pddir \"C:/Program Files/Pd/bin\""
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-5",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 155.5, 381.5, 389.0, 20.0 ],
                                    "text": "You need \"quotation\" if the path/name contains \"white space\""
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 11.600006,
                                    "id": "obj-3",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 239.0, 221.5, 244.0, 33.0 ],
                                    "text": "This example is in \"Pd/extra\" folder. This folder is included in Pd's search path. "
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-2",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 65.0, 503.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-15",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 52.0, 83.5, 31.0, 22.0 ],
                                    "text": "t b s"
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 11.600006,
                                    "id": "obj-37",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 165.5, 51.5, 237.0, 33.0 ],
                                    "text": "(note: you don't have to use an open dialog; that is just for this help window to work.)"
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 11.600006,
                                    "id": "obj-18",
                                    "linecount": 3,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 132.0, 255.0, 436.0, 47.0 ],
                                    "text": "pd~ start - start up the sub-process.  Arguments are added to Pd's command line so you can specify a patch to open here and/or specify flags like \"-nogui\" which will run Pd without its windows visible."
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 11.600006,
                                    "id": "obj-19",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 169.0, 158.5, 386.0, 33.0 ],
                                    "text": "pd~ pddir -- set directory containing Pd binary, for example: \n\"C:/Program Files/Pd/bin\""
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 11.600006,
                                    "id": "obj-20",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 151.5, 135.0, 244.0, 20.0 ],
                                    "text": "pd~ message controls the sub-process:"
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 11.600006,
                                    "id": "obj-27",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 72.0, 164.0, 92.0, 22.0 ],
                                    "text": "pd~ pddir $1/bin"
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 11.600006,
                                    "id": "obj-28",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "patching_rect": [ 52.0, 57.0, 98.0, 22.0 ],
                                    "text": "opendialog folder"
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 11.600006,
                                    "id": "obj-31",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 51.0, 227.0, 179.0, 22.0 ],
                                    "text": "pd~ start pd~/pd~-subprocess.pd"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-1",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 52.0, 10.0, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-28", 0 ],
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 0 ],
                                    "source": [ "obj-12", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "source": [ "obj-12", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-12", 0 ],
                                    "source": [ "obj-14", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-27", 0 ],
                                    "source": [ "obj-15", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-31", 0 ],
                                    "source": [ "obj-15", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-2", 0 ],
                                    "source": [ "obj-27", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-15", 0 ],
                                    "source": [ "obj-28", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-2", 0 ],
                                    "source": [ "obj-31", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-2", 0 ],
                                    "source": [ "obj-7", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-2", 0 ],
                                    "source": [ "obj-9", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 36.0, 292.0, 103.0, 22.0 ],
                    "text": "p Pd-on-Windows"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-42",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 444.0, 566.5, 272.0, 20.0 ],
                    "text": "-ascii: use human-readable streams for debugging"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-29",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 368.0, 598.0, 359.0, 20.0 ],
                    "text": "Pd~ version 0.5.  Max/MSP port by Miller Puckette and Ted Apel"
                }
            },
            {
                "box": {
                    "fontface": 3,
                    "fontname": "Arial",
                    "fontsize": 20.871338,
                    "id": "obj-40",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 5.0, 4.0, 485.0, 30.0 ],
                    "text": "pd~",
                    "textcolor": [ 0.2, 0.2, 0.2, 1.0 ],
                    "varname": "autohelp_top_title"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.754705,
                    "id": "obj-41",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 5.0, 31.0, 485.0, 21.0 ],
                    "text": "Run Pd within Max/MSP",
                    "textcolor": [ 0.2, 0.2, 0.2, 1.0 ],
                    "varname": "autohelp_top_digest"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 368.0, 624.0, 383.0, 20.0 ],
                    "text": "Available from msp.ucsd.edu. Open source with BSD license."
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-2",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 218.0, 550.0, 154.0, 33.0 ],
                    "text": "messages sent to Pd's stdout object appear here"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 34.0, 581.0, 208.0, 20.0 ],
                    "text": "dac~ outputs from Pd appear here"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 164.0, 436.0, 348.0, 20.0 ],
                    "text": "audio signals appear as \"adc 1\" and \"adc 2' in sub-process"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 444.0, 545.5, 272.0, 20.0 ],
                    "text": "-scheddir <#>: override dir for Pd scheduler"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-6",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 444.0, 528.5, 264.0, 20.0 ],
                    "text": "-pddir <#>: as in pd~ pddir message"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 444.0, 510.5, 263.0, 20.0 ],
                    "text": "-sr <#>: sample rate Pd thinks it runs at"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-8",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 444.0, 493.5, 283.0, 20.0 ],
                    "text": "-fifo <#>: number of 64-sampe ticks in fifo (default 5)"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-9",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 444.0, 475.5, 235.0, 20.0 ],
                    "text": "-noutsig <#>: number of signal outputs"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-10",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 444.0, 458.5, 218.0, 20.0 ],
                    "text": "-ninsig <#>: number of signal inputs"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-11",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 242.0, 501.0, 167.0, 20.0 ],
                    "text": "creation args set options:"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 184.5, 475.0, 15.0, 15.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-13",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 143.0, 472.0, 33.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.941176, 0.941176, 0.941176, 1.0 ],
                    "coolcolor": [ 0.705882, 0.823529, 0.392157, 1.0 ],
                    "hotcolor": [ 0.862745, 0.392157, 0.392157, 1.0 ],
                    "id": "obj-14",
                    "markercolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "markers": [ 12, 6, 0, -6, -12, -24, -36, -48 ],
                    "markersused": 8,
                    "maxclass": "levelmeter~",
                    "needlecolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 36.0, 535.0, 65.0, 32.5 ],
                    "warmcolor": [ 0.862745, 0.588235, 0.313726, 1.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-16",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 164.0, 409.0, 435.0, 20.0 ],
                    "text": "Any message besides \"pd~\" is sent to the Pd sub-process"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-17",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 168.0, 381.0, 433.0, 20.0 ],
                    "text": "pd~ stop - end the Pd sub-process"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.941176, 0.941176, 0.941176, 1.0 ],
                    "coolcolor": [ 0.705882, 0.823529, 0.392157, 1.0 ],
                    "hotcolor": [ 0.862745, 0.392157, 0.392157, 1.0 ],
                    "id": "obj-21",
                    "markercolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "markers": [ 12, 6, 0, -6, -12, -24, -36, -48 ],
                    "markersused": 8,
                    "maxclass": "levelmeter~",
                    "needlecolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 127.0, 534.0, 65.0, 32.5 ],
                    "warmcolor": [ 0.862745, 0.588235, 0.313726, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 122.0, 475.0, 15.0, 15.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-23",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 78.0, 471.0, 33.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-25",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 141.0, 180.0, 102.0, 20.0 ],
                    "text": "First start DSP.."
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-26",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 5.0, 128.0, 390.0, 33.0 ],
                    "text": "To use pd~ you must have Pd version 0.48-0 or later installed.  You can then start the Pd process as shown:"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-30",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 79.0, 381.0, 60.0, 22.0 ],
                    "text": "pd~ stop"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-32",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 218.0, 531.0, 90.0, 22.0 ],
                    "text": "print outlet-1"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-33",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 79.0, 409.0, 76.0, 22.0 ],
                    "text": "foo bar baz"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-34",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 78.0, 435.0, 76.0, 22.0 ],
                    "text": "cycle~ 440"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-35",
                    "linecount": 2,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 77.0, 176.0, 60.0, 35.0 ],
                    "text": ";\r\ndsp start"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-36",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "outlettype": [ "signal", "signal", "" ],
                    "patching_rect": [ 36.0, 501.0, 131.0, 22.0 ],
                    "text": "pd~ -ninsig 2 -noutsig 2"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.600006,
                    "id": "obj-38",
                    "linecount": 5,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 5.0, 54.0, 396.0, 73.0 ],
                    "text": "The pd~ object run a Pure Data sub-process within your Max patch.  Dac~ and adc~ objects in Pd go to inlets and outlets on the object in Max, and messages can be sent back and forth. Everything in Pd is tied to Max's audio computation - so, for instance, if DSP is turned off in Max, Pd freezes."
                }
            },
            {
                "box": {
                    "angle": 0.0,
                    "background": 1,
                    "grad1": [ 1.0, 0.819608, 0.8, 1.0 ],
                    "grad2": [ 0.976471, 0.972549, 0.972549, 1.0 ],
                    "id": "obj-43",
                    "maxclass": "panel",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 3.0, 3.0, 495.683014, 50.633972 ],
                    "proportion": 0.39,
                    "varname": "autohelp_top_panel"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-13", 1 ],
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 1 ],
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 1 ],
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "midpoints": [ 88.5, 402.0, 45.5, 402.0 ],
                    "source": [ "obj-30", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "midpoints": [ 88.5, 432.0, 45.5, 432.0 ],
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "order": 0,
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "order": 1,
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "order": 1,
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 1 ],
                    "order": 1,
                    "source": [ "obj-36", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "order": 0,
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "order": 0,
                    "source": [ "obj-36", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 0 ],
                    "source": [ "obj-36", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "source": [ "obj-57", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-57", 0 ],
                    "source": [ "obj-62", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}