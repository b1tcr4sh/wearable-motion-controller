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
        "rect": [ 34.0, 77.0, 1104.0, 713.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-74",
                    "linecount": 8,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 725.92591381073, 103.70370197296143, 150.0, 117.0 ],
                    "text": "sends to /esp/start to trigger esp begin send\n\nsend to /esp/stop to trigger esp halt send\n\nsend to /esp/calibrate to trigger calibration"
                }
            },
            {
                "box": {
                    "id": "obj-72",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 725.92591381073, 256.976734995842, 150.0, 48.0 ],
                    "text": "receives on:\ngyro-x gyro-y gyro-z\naccel-x accel-y accel-z"
                }
            },
            {
                "box": {
                    "id": "obj-67",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 470.7692756652832, 118.46154975891113, 18.705036640167236, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 850.4347547292709, 126.79088699817657, 18.705036640167236, 20.0 ],
                    "text": "z"
                }
            },
            {
                "box": {
                    "id": "obj-68",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 416.92311668395996, 118.46154975891113, 18.705036640167236, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 796.5217130184174, 126.79088699817657, 18.705036640167236, 20.0 ],
                    "text": "y"
                }
            },
            {
                "box": {
                    "id": "obj-69",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 363.0769577026367, 118.46154975891113, 18.705036640167236, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 742.6086713075638, 126.79088699817657, 18.705036640167236, 20.0 ],
                    "text": "x"
                }
            },
            {
                "box": {
                    "id": "obj-70",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 363.0769577026367, 96.92308616638184, 150.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 742.6086713075638, 105.0517572760582, 150.0, 20.0 ],
                    "text": "accel"
                }
            },
            {
                "box": {
                    "id": "obj-66",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 470.7692756652832, 52.30769729614258, 18.705036640167236, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 850.4347547292709, 59.83436745405197, 18.705036640167236, 20.0 ],
                    "text": "z"
                }
            },
            {
                "box": {
                    "id": "obj-65",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 416.92311668395996, 52.30769729614258, 18.705036640167236, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 796.5217130184174, 59.83436745405197, 18.705036640167236, 20.0 ],
                    "text": "y"
                }
            },
            {
                "box": {
                    "id": "obj-64",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 363.0769577026367, 52.30769729614258, 18.705036640167236, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 742.6086713075638, 59.83436745405197, 18.705036640167236, 20.0 ],
                    "text": "x"
                }
            },
            {
                "box": {
                    "id": "obj-62",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 363.0769577026367, 30.76923370361328, 150.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 742.6086713075638, 38.095237731933594, 150.0, 20.0 ],
                    "text": "gyro"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-58",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 363.0769577026367, 138.46155166625977, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 742.6086713075638, 145.92132115364075, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-59",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 416.92311668395996, 138.46155166625977, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 796.5217130184174, 145.92132115364075, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-60",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 470.7692756652832, 138.46155166625977, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 850.4347547292709, 145.92132115364075, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-57",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 363.0769577026367, 72.30769920349121, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 742.6086713075638, 79.83436679840088, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-56",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 416.92311668395996, 72.30769920349121, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 796.5217130184174, 79.83436679840088, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-55",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 470.7692756652832, 72.30769920349121, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 850.4347547292709, 79.83436679840088, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-51",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 458.4615821838379, 672.3077564239502, 56.0, 22.0 ],
                    "text": "s accel-x"
                }
            },
            {
                "box": {
                    "id": "obj-50",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 390.7692680358887, 672.3077564239502, 56.0, 22.0 ],
                    "text": "s accel-x"
                }
            },
            {
                "box": {
                    "id": "obj-49",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 324.6154155731201, 672.3077564239502, 56.0, 22.0 ],
                    "text": "s accel-x"
                }
            },
            {
                "box": {
                    "id": "obj-48",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 258.46156311035156, 672.3077564239502, 51.0, 22.0 ],
                    "text": "s gyro-z"
                }
            },
            {
                "box": {
                    "id": "obj-47",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 190.76924896240234, 672.3077564239502, 51.0, 22.0 ],
                    "text": "s gyro-y"
                }
            },
            {
                "box": {
                    "id": "obj-46",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 123.07693481445312, 672.3077564239502, 51.0, 22.0 ],
                    "text": "s gyro-x"
                }
            },
            {
                "box": {
                    "id": "obj-45",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 292.3077201843262, 138.46155166625977, 63.265305519104004, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 672.7038486003876, 146.89791578054428, 63.265305519104004, 20.0 ],
                    "text": "calibrate"
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 258.46156311035156, 126.15385818481445, 33.08496135473251, 33.08496135473251 ],
                    "presentation": 1,
                    "presentation_rect": [ 637.7826544940472, 133.81295442581177, 33.08496135473251, 33.08496135473251 ]
                }
            },
            {
                "box": {
                    "id": "obj-39",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 292.3077201843262, 89.23077774047852, 42.85714244842529, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 672.7038486003876, 97.24906122684479, 42.85714244842529, 20.0 ],
                    "text": "stop"
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 256.9231014251709, 75.38462257385254, 33.7958208322525, 33.7958208322525 ],
                    "presentation": 1,
                    "presentation_rect": [ 637.4272247552872, 83.45324039459229, 33.7958208322525, 33.7958208322525 ]
                }
            },
            {
                "box": {
                    "id": "obj-35",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 292.3077201843262, 44.61538887023926, 42.85714244842529, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 672.7038486003876, 52.66187310218811, 42.85714244842529, 20.0 ],
                    "text": "start"
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 255.38463973999023, 30.76923370361328, 34.56663537025452, 34.56663537025452 ],
                    "presentation": 1,
                    "presentation_rect": [ 635.971245765686, 38.095237731933594, 34.56663537025452, 34.56663537025452 ]
                }
            },
            {
                "box": {
                    "id": "obj-31",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 418.4615783691406, 332.30772399902344, 90.0, 22.0 ],
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
                    "patching_rect": [ 458.4615821838379, 601.5385189056396, 50.0, 22.0 ]
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
                    "patching_rect": [ 392.30772972106934, 601.5385189056396, 50.0, 22.0 ]
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
                    "patching_rect": [ 324.6154155731201, 601.5385189056396, 50.0, 22.0 ]
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
                    "patching_rect": [ 258.46156311035156, 601.5385189056396, 50.0, 22.0 ]
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
                    "patching_rect": [ 190.76924896240234, 601.5385189056396, 50.0, 22.0 ]
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
                    "patching_rect": [ 123.07693481445312, 601.5385189056396, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "newobj",
                    "numinlets": 7,
                    "numoutlets": 7,
                    "outlettype": [ "", "", "", "", "", "", "" ],
                    "patching_rect": [ 123.07693481445312, 510.76927947998047, 422.0, 22.0 ],
                    "text": "route /esp/gyro/x /esp/gyro/y /esp/gyro/z /esp/accel/x /esp/accel/y /esp/accel/z"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 338.4615707397461, 332.30772399902344, 67.0, 22.0 ],
                    "text": "/esp/stop 1"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 267.69233322143555, 332.30772399902344, 68.0, 22.0 ],
                    "text": "/esp/start 1"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 267.69233322143555, 392.30772972106934, 158.0, 22.0 ],
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
                    "patching_rect": [ 123.07693481445312, 381.5384979248047, 104.0, 22.0 ],
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
                    "destination": [ "obj-20", 0 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "source": [ "obj-17", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "source": [ "obj-17", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-27", 0 ],
                    "source": [ "obj-17", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "source": [ "obj-17", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 0 ],
                    "source": [ "obj-17", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "order": 1,
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-57", 0 ],
                    "midpoints": [ 132.57693481445312, 647.5127103328705, 571.2747448086739, 647.5127103328705, 571.2747448086739, 14.528302431106567, 372.5769577026367, 14.528302431106567 ],
                    "order": 0,
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 0 ],
                    "order": 1,
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 0 ],
                    "midpoints": [ 200.26924896240234, 645.0933554768562, 570.4682931900024, 645.0933554768562, 570.4682931900024, 16.867544531822205, 426.42311668395996, 16.867544531822205 ],
                    "order": 0,
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "order": 1,
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 0 ],
                    "midpoints": [ 267.96156311035156, 644.2869038581848, 568.8553899526596, 644.2869038581848, 568.8553899526596, 17.673996150493622, 480.2692756652832, 17.673996150493622 ],
                    "order": 0,
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-51", 0 ],
                    "order": 1,
                    "source": [ "obj-27", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "midpoints": [ 467.9615821838379, 641.8675490021706, 570.4682931900024, 641.8675490021706, 570.4682931900024, 182.99657797813416, 480.2692756652832, 182.99657797813416 ],
                    "order": 0,
                    "source": [ "obj-27", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "order": 1,
                    "source": [ "obj-28", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-59", 0 ],
                    "midpoints": [ 401.80772972106934, 642.674000620842, 566.4360350966454, 642.674000620842, 566.4360350966454, 182.19012635946274, 426.42311668395996, 182.19012635946274 ],
                    "order": 0,
                    "source": [ "obj-28", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "order": 1,
                    "source": [ "obj-29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 0 ],
                    "midpoints": [ 334.1154155731201, 646.7062587141991, 568.0489383339882, 646.7062587141991, 568.0489383339882, 182.19012635946274, 372.5769577026367, 182.19012635946274 ],
                    "order": 0,
                    "source": [ "obj-29", 0 ]
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
                    "destination": [ "obj-8", 0 ],
                    "midpoints": [ 264.88463973999023, 72.53011393547058, 250.68413627147675, 72.53011393547058, 250.68413627147675, 302.02652502059937, 277.19233322143555, 302.02652502059937 ],
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "midpoints": [ 266.4231014251709, 107.06248927116394, 251.40356075763702, 107.06248927116394, 251.40356075763702, 296.27112913131714, 347.9615707397461, 296.27112913131714 ],
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-31", 0 ],
                    "midpoints": [ 267.96156311035156, 155.98335433006287, 251.40356075763702, 155.98335433006287, 251.40356075763702, 291.95458221435547, 427.9615783691406, 291.95458221435547 ],
                    "source": [ "obj-43", 0 ]
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
                    "source": [ "obj-9", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}