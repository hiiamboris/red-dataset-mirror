
#2787: [VID] DISABLED and ALL-OVER together
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2787>

When DISABLED and ALL-OVER are used in the same face, the face still gets the 'OVER events.
```Red
view [
    size 500x500 
    obj1: base 450x300 red ALL-OVER DISABLED
    on-over [
        obj2/text: to-string event/offset 
    ]
    return
    obj2: text 100x50 
]
```
If you move mouse over the red area, you can still see the events. 


Comments:
--------------------------------------------------------------------------------

On 2017-06-12T00:32:50Z, JenniferLee520, commented:
<https://github.com/red/red/issues/2787#issuecomment-307667351>

    Also see #2737 

