# Red Reactive : cannot get true value for face data

**Link:**
<https://stackoverflow.com/questions/50836356/red-reactive-cannot-get-true-value-for-face-data>

**Asked:** 2018-06-13 11:42:15 UTC

------------------------------------------------------------------------

From Red-lang book example about reactive programming, I added test
button, weirdly I can get true data value for slider but not for
progress bar: for this latter it\'s always the initial value (20%). How
to get the actual value for this latter ?

            view [
                origin 0x0 space 0x0
                tab-panel 500x100 [
            "Tab 1 " [
                        p: progress 100x20 data 20% react [face/data: s/data]
                        s: slider 100x20 data 20%

                        button "test" [
                            vs: s/data
                            vp: p/data
                            ?? vs
                            ?? vp
                        ]
                    ]
            "Tab 2 " [
                        p: progress 100x20 20%
                        slider 100x20 data 20% [p/data: face/data]
                    ]

                ]
            ]

[![enter image description
here](https://i.sstatic.net/404Xl.png)](https://i.sstatic.net/404Xl.png){rel="nofollow noreferrer"}

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by sqlab

You set **p** twice and the last one is valid.

Therefore your **p** points to your second progress bar in **Tab 2** and
**vp** is always 20% as long as you move only the slider in **Tab 1**.
So either move the slider in **Tab 2** before hitting the button or
better name the progress bar in **Tab 2** with a different word. e.g

            "Tab 2 " [
                    p2: progress 100x20 20%
                    slider 100x20 data 20% [p2/data: face/data]
             ]

------------------------------------------------------------------------

## Comments on question
