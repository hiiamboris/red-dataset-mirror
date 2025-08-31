
#2505: Using DO twice, in some case results in an error.
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2505>

For reproducing the error:
```
>> do %/c/dev/red.code/Scripts/bubbles.red
== true
>> do %/c/dev/red.code/Scripts/clock.red
*** Access Error: cannot open: %/c/dev/red.code/Scripts/clock.red/
*** Where: do
```


Comments:
--------------------------------------------------------------------------------

On 2017-03-27T16:28:34Z, dockimbel, commented:
<https://github.com/red/red/issues/2505#issuecomment-289507541>

    This error revealed a Parse issue, caused by an old code refactoring, leading to a missing top frame in the Parse internal stack, resulting in silent buffer overflows, which in deep recursion calls, could corrupt user data.

