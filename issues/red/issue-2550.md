
#2550: Problems saving image! as screenshot in windows
================================================================================
Issue is closed, was reported by geekyi and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2550>

Maybe related to https://github.com/red/red/commit/853511714714b680fcf6e8e8adc122c7d0f19681
That commit was originally to fix not properly being able to save screenshots.

However, I'm unable to `save` images anymore. Saving texts work tho:
```
img: make image! [10x10 255.0.0]
save %test-image.png draw img [
    fill-pen black pen off
    circle 10x10 8
]
exists? %test-image.png
```

Works with gui-console-2017-3-26-60790.exe
Doesn't work with gui-console-2017-4-8-27033.exe

---

Here is the original problem:
```red

action: [
    save %mywindow.png to-image main-panel
    ; save %mywindow.png to-image main-panel/parent
    print [either exists? %mywindow.png [""]["Not"] "Saved" what-dir]
    ; scrn-shot: load %mywindow.png
    ; test/image: scrn-shot
]

;; init
scrn-shot: make image! [1x1 #{FFA0A0FF}]
; save %test-image.png scrn-shot
; save/as %test-image.png scrn-shot 'png
; exists? %test-image.png

display: [
    main-panel: tab-panel 200x150 [
        "tab1" [
            button "Click!" [do action]
            ;; init
            ; test: image 10x10 scrn-shot
        ]
    ]
]

view display
```
Pasted in [gui-console-2017-3-26-60790.exe gui-console-2017-1-25-13785.exe]:
![bug](https://cloud.githubusercontent.com/assets/16749930/24828312/8a9ecd90-1c73-11e7-9bdd-8e413fa1b09b.png)
Expected (gui-console-2017-1-8-36312.exe):
![expected](https://cloud.githubusercontent.com/assets/16749930/24828352/65b88614-1c74-11e7-9f8b-cd93bd0ab928.png)





