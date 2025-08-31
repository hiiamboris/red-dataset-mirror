
#2210: none! value followed by block! triggers strange error in console
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
<https://github.com/red/red/issues/2210>

This shouldn’t throw any error, just return the block:

```
red>> none [a b c]
*** Script Error: head? does not allow none! for its series argument
*** Where: head?
```



Comments:
--------------------------------------------------------------------------------

On 2016-09-05T11:19:48Z, rebolek, commented:
<https://github.com/red/red/issues/2210#issuecomment-244723390>

    This is OK in fresh console, must be caused by something else, I will try to investigate it more.

