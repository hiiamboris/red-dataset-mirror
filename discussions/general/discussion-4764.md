URL: <https://github.com/red/red/discussions/4764>
Date created: 2020-12-14T08:28:03Z

# Direct2D DRAW Backend

We're trying to replace the current GDI/GDI+ DRAW backend with Direct2D on Windows. 
Source code: https://github.com/red/red/tree/Direct2D
Prebuilt binary for testing: 
 ~~[gui-console-d2d.zip](https://github.com/red/red/files/5687415/gui-console-d2d.zip)~~
 [gui-console-d2d-6256a4771b46c974cd1b51069bc00260a83443ee.zip](https://github.com/red/red/files/5720644/gui-console-d2d-6256a4771b46c974cd1b51069bc00260a83443ee.zip)


Report any 🐛 in here are very welcome. 😎 

_NOTE:_ Minimum supported client: Platform Update for Windows 7.

## Comments

### planetsizecpu commented at 2020-12-14T09:45:30Z:

I tested the prebuilt binary with my game and works as normal, althought I don't use draw.

### pekr commented at 2020-12-14T11:39:00Z:

Here goes, just a very bried test:

- opens black console behind the gui window
- Particles dome is faster by some 7-10 fps, but it draws correctly only one particle, the rest are some kind of gradient balls


### hiiamboris commented at 2020-12-15T18:04:01Z:

Here's how D2D compares to master on W10:
![](https://i.gyazo.com/77a61282e80ee96bc66174c4a616bc7d.png)
As you can see there are 6 regressions. #4554 can be ignored I think, probably a fluke caused by me using debug build of D2D and release build of master. I'll add more info when I get there.


### greggirwin commented at 2020-12-16T02:21:17Z:

As always, the details, graphs, and example pics are enormously helpful @hiiamboris. 

### qtxie commented at 2020-12-16T04:12:24Z:

@hiiamboris Thanks a lot. 👍 Regressions, even new bugs are expected.

> Are we still using GDI+ for box "text" thing? Can we change it to D2D?

Yes. We can change it to D2D. But it has some overheads. Creating the DX swapchain and buffer to just draw a few texts is expensive. Even worse, if it's a box face (layered window), we have to copy the content in the swapchain into the DC. Using GDI+ we just need to draw on the existing DC.

### qtxie commented at 2020-12-16T09:20:31Z:

In #3789, fixed the curve issue. The gradient issue is caused by `GetBounds` returns an infinite big bound. I'm not sure if I misused the API or it's the correct bound.

### ne1uno commented at 2020-12-18T19:28:32Z:

I couldn't run the prebuilt on win7 on an old laptop, but runs ok win 10 slightly newer laptop
```
*** Runtime Error 98: assertion failed
*** in file: /D/EE/QW/red/modules/view/backends/windows/direct2d.reds
*** at line: 1679
***
***   stack: gui/create-render-target 00000062h 005101D8h
***   stack: gui/create-render-target 01310A90h 021A6028h
***   stack: gui/get-hwnd-render-target 01310A90h false
***   stack: gui/OS-text-box-layout 0213D774h 00000000h 0 false
***   stack: ctx||469~text-box-metrics 0213D774h 0213D784h 3
***   stack: size-text
***   stack: ctx||631~update-cfg 00340FBCh
***   stack: ctx||600~apply-cfg 003412DCh
***   stack: ctx||600~load-cfg 003412DCh
***   stack: ctx||600~launch 003412DCh

w/prebuilt L512 i5  win7-64 onboard intel GPU probably openGL 2?
E530 i7 win10 onboard intel GPU probably openGL 3 runs ok
both old lenovo laptops >6 years old
```

### hiiamboris commented at 2021-01-06T19:51:22Z:

Some pen madness here:
```
cmds: [
    pen cyan fill-pen magenta line-width 4
    ; clip 0x0 200x200 [
        push [
            pen pattern 4x4 [line-width 0 fill-pen white box 0x0 2x2 box 2x2 4x4] 
            line-width 4
            box 0x0 200x20
        ]
        box 0x60 50x80
    ; ]
    box 0x30 100x50
]

view [base 300x200 draw cmds]
```
Yields expected result:
![](https://i.gyazo.com/29ca6e3e2bafd974d97ec5b6ccb13397.png)

Enable `clip` and the 2nd box disappears:
```
cmds: [
    pen cyan fill-pen magenta line-width 4
    clip 0x0 200x200 [
        push [
            pen pattern 4x4 [line-width 0 fill-pen white box 0x0 2x2 box 2x2 4x4] 
            line-width 4
            box 0x0 200x20
        ]
        box 0x60 50x80
    ]
    box 0x30 100x50
]

view [base 300x200 draw cmds]
```
![](https://i.gyazo.com/4d8b984b1ac10b864dbe4bf07870be4e.png)

Remove duplicated line-width and all lines disappear:
```
cmds: [
    pen cyan fill-pen magenta line-width 4
    clip 0x0 200x200 [
        push [
            pen pattern 4x4 [line-width 0 fill-pen white box 0x0 2x2 box 2x2 4x4] 
            box 0x0 200x20
        ]
        box 0x60 50x80
    ]
    box 0x30 100x50
]

view [base 300x200 draw cmds]
```
![](https://i.gyazo.com/671739265441106caa2096d70c3eda56.png)

