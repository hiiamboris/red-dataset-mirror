
#2690: normalize-dir does not invoke clean-path if argument starts with /
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/2690>

```
>> what-dir
== %/C/Projects/Red/programs/
>> normalize-dir %../test
== %/C/Projects/Red/test/
>> normalize-dir %/../test
== %/../test/
```
It would perhaps be useful to re-define normalize-dir as clean-path/dir...


Comments:
--------------------------------------------------------------------------------

On 2017-07-29T09:24:57Z, dockimbel, commented:
<https://github.com/red/red/issues/2690#issuecomment-318816421>

    I don't see the point. `normalize-dir` is just a helper function used by other functions and it does what it is meant for. If the user passes a file path which could be not resolved, that needs to be handled by the caller to `normalize-dir`.

