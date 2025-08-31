
#2151: Red console is crashing when started on MacOs 10.7.5
================================================================================
Issue is closed, was reported by ifgem and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2151>

Error:

> dyld: Library not loaded: /System/Library/Frameworks/CFNetwork.framework/CFNetwork
>   Referenced from: /Users/Qwerty/.red/console-2016-8-4-31595
>   Reason: image not found



Comments:
--------------------------------------------------------------------------------

On 2016-08-04T15:18:16Z, dockimbel, commented:
<https://github.com/red/red/issues/2151#issuecomment-237585853>

    Fixed by commit https://github.com/red/red/commit/e19f63a0dd1fd73b3e606b57de13cb7bd91e1d03.

