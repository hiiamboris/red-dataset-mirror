
#5234: [D2D, Draw] Undefined `arc` behavior with some parameter values
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5234>

**Describe the bug**

Sweep is real weird outside 0-360:
<img width=300 src=https://i.gyazo.com/bb8a19c801eb88e30488f18a11ddd3e9.gif>

If sweep is a multiple of 360, but not zero, we've got turbulence:
<img width=300 src=https://i.gyazo.com/bae230130e1281526a61279959eac23f.gif>


**To reproduce**
```
view [
    below
    panel tight [text 60 "start:"  s: slider 400 data 0.3 st: text 40 react [face/data: to 1 s/data * 1200 - 420]]
    panel tight [text 60 "length:" e: slider 400 data 0.6 et: text 40 react [face/data: to 1 e/data * 1200 - 420]]
    base cyan 500x300 react [face/draw: compose [
        line-width 50
        arc 130x130 100x100 (st/data) (et/data)
    ]]
]
```

**Expected behavior**

I think GTK backend has it all correct:
<img width=300 src=https://i.gyazo.com/d3a2725add307d991d9c98cc25712ec4.gif>

**Platform version**

```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4557 date: 26-Oct-2022/7:37:35 commit: #998220b8405a536d14bb282afcbb279f0e75facb ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2022-10-30T18:40:27Z, greggirwin, commented:
<https://github.com/red/red/issues/5234#issuecomment-1296323877>

    Really nice viz/test app @hiiamboris. :+1:

