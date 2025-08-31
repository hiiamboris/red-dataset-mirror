
#5244: Dragging get stuck when offset is a big negative number
================================================================================
Issue is closed, was reported by cosacam1 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5244>

Description
I have noticed that when you drag a larger face (a panel or base, for instance) inside a smaller one (another panel or a view) it get stuck before you reach the end and you can't drag it back either. I have tried only with vertical dragging, I don't know if it happens the same horizontally.

To reproduce
Here is a hiiamboris example (shorter than mine)
view [
    panel 300x300 [
        ; if you comment the next line you may drag the cyan base up until you get stuck
        ; if you uncomment it, you can't drag it at all
        at 0x-1000 
        base 300x2100 "DRAG ME" cyan loose
        on-drag [?? event/offset]
    ]
]

Expected behavior
To drag freely, after all is a loose face.

Platform version
Win 10
system/build/date 12-Nov-2022/17:58:23



