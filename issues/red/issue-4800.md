
#4800: [View] Inconsistent on-over events
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[GUI]
<https://github.com/red/red/issues/4800>

**Describe the bug**

On-over events are generated erratically:
```
Red []

hover: function [face event] [print ["over" face/extra]]
hup:   function [face event] [
	print ["up>" face/extra]
	move find/same p: face/parent/pane face head p
	print ["<up" face/extra]
]

view p: layout [
	at 10x10 box 200x200 draw [translate 100x100            fill-pen #FF000030 circle 0x-40 50] extra 'R on-over :hover on-up :hup
	at 10x10 box 200x200 draw [translate 100x100 rotate 120 fill-pen #00FF0030 circle 0x-40 50] extra 'G on-over :hover on-up :hup
	at 10x10 box 200x200 draw [translate 100x100 rotate 240 fill-pen #0000FF30 circle 0x-40 50] extra 'B on-over :hover on-up :hup
]
```

Click on the center of the window a few times. Output looks like:
```
up> B
<up B
over B
over G      ;) sometimes 2 events
up> G
<up G
over G      ;) sometimes one
up> B
<up B
over B      ;) sometimes on the face where you click
up> R
<up R
over B      ;) sometimes on another face
...
```

**Expected behavior**

I expect always to have 2 over events in exact order:
1. Pointer left the face where it was in
2. Pointer entered a new face where it is now

**Platform version**
```
Red 0.6.4 for Windows built 20-Dec-2020/21:04:56+03:00 commit #7a6d9a9
```



Comments:
--------------------------------------------------------------------------------

On 2021-01-17T18:56:56Z, greggirwin, commented:
<https://github.com/red/red/issues/4800#issuecomment-761861699>

    Reproduced here. It's an interesting case, which may be OS specific. It would be good to test on older MacOS and GTK to see if they do the same. The fact that it's inconsistent makes me think we're at the mercy of OS events, unless we do some kind of event filtering ourselves, which may not be practical. But it may also be a design issue, per the crash ticket you note.

