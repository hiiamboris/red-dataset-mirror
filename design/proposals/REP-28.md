
#28: WISH: Support SKIP refinement for REVERSE
================================================================================
Issue is closed, was reported by rebolek and has 6 comment(s).
<https://github.com/red/REP/issues/28>

Some `action!`s (i.e. `find`, `sort`, ...) can treat series as fixed size records with `/skip` refinement. It would be useful if `reverse` was one of them, so it would be possible to do:

```
>> reverse/skip [a 1 b 2 c 3] 2
== [c 3 b 2 a 1]
```


Comments:
--------------------------------------------------------------------------------

On 2018-08-25T21:58:19Z, endo64, commented:
<https://github.com/red/REP/issues/28#issuecomment-415999169>

    This looks like a very rare case (I didn't need even once)
    
    Here is the all functions which has `skip` refinement, they all have strong cases:
    
    ```
    difference
    exclude
    find
    intersect
    new-line
    select
    skip
    sort
    union
    unique
    ```
    
    OTOH it should be very easy to add such functionality.

--------------------------------------------------------------------------------

On 2018-08-29T08:18:09Z, rebolek, commented:
<https://github.com/red/REP/issues/28#issuecomment-416867013>

    It may be rare, but when you need it, you certainly would appreciate it :smile: 
    It should be easy to implement and would make actions more consistent.
    If I find some time, I may try looking into it and make a merge request.

--------------------------------------------------------------------------------

On 2018-09-01T13:27:18Z, 9214, commented:
<https://github.com/red/REP/issues/28#issuecomment-417859696>

    https://github.com/red/red/issues/3004

