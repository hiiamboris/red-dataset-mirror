
#2547: extract -- Runtime Error and Internal Error with negative integer as width
================================================================================
Issue is closed, was reported by gltewalt and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2547>

;-- Red 0.6.2 - 2-Apr-2017/21:42:30-6:00
extract [] -3   ;--  No error with empty block
extract [1] -3  ;-- Internal Error: not enough memory   Where: append
extract [1 2 3 4 5] -2  ;-- Runtime Error 1: access violation   at: 7674980Ah 


Comments:
--------------------------------------------------------------------------------

On 2017-04-07T06:36:02Z, dockimbel, commented:
<https://github.com/red/red/issues/2547#issuecomment-292453915>

    Good catch! Thank you.

