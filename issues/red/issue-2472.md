
#2472: `call` support `hide` function
================================================================================
Issue is closed, was reported by bitbegin and has 2 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/2472>

On windows platform, `call` will show(flash) a black console. 
My wishes:
Can it be run background, then return immediately. Then i can check the return pid, to know if the call is finished, also i can get output from pid



Comments:
--------------------------------------------------------------------------------

On 2017-03-10T08:33:53Z, dockimbel, commented:
<https://github.com/red/red/issues/2472#issuecomment-285609081>

    Now by default, the DOS window will be hidden. It can be shown if the /SHOW refinement is used.
    
    For the rest of the wishes, we can only support blocking IO operations for now, until 0.7.0 (we need port! support and an IO event loop for async support).

