
#1964: Refinement order in function call not respected
================================================================================
Issue is closed, was reported by ghost and has 4 comment(s).
[status.duplicate]
<https://github.com/red/red/issues/1964>

Red []
add-up: function [/c cval /d dval] [
    temp: 0
    if c [
        temp: temp + cval
    ]
    if d [
        temp: temp - dval
    ]
    return temp
]
print add-up/c/d 3 4
print add-up/d/c 3 4



Comments:
--------------------------------------------------------------------------------

On 2016-06-03T08:19:37Z, ghost, commented:
<https://github.com/red/red/issues/1964#issuecomment-223519237>

    @Arie-vw Same as https://github.com/red/red/issues/1154

--------------------------------------------------------------------------------

On 2016-06-04T05:52:03Z, dockimbel, commented:
<https://github.com/red/red/issues/1964#issuecomment-223738460>

    Closing it as duplicate.

