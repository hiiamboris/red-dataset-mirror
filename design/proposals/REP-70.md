
#70: WISH: allow `power` and `**` on pairs
================================================================================
Issue is open, was reported by hiiamboris and has 12 comment(s).
<https://github.com/red/REP/issues/70>

```
>> power 2x3 2
*** Script Error: power does not allow pair! for its number argument
*** Where: power
*** Stack:  

>> 64x81 ** 0.5
*** Script Error: ** does not allow pair! for its number argument
*** Where: **
*** Stack:
```
This is sometimes helpful, and will be more helpful once we see floating-point pairs.


Comments:
--------------------------------------------------------------------------------

On 2020-03-27T22:14:33Z, greggirwin, commented:
<https://github.com/red/REP/issues/70#issuecomment-605337330>

    What are the use cases where it's helpful? e.g., GUI related or wider math dialect use?

--------------------------------------------------------------------------------

On 2020-03-27T22:42:10Z, hiiamboris, commented:
<https://github.com/red/REP/issues/70#issuecomment-605344834>

    Distance or length computations, e.g. I have to write:
    ```
    		xy1: xy1 - xy2
    		xy1: xy1 * xy1
    		xy1/x + xy1/y ** 0.5
    ```
    Instead of:
    ```
    		xy1: xy1 - xy2 ** 2
    		xy1/x + xy1/y ** 0.5
    ```

--------------------------------------------------------------------------------

On 2020-03-27T23:07:27Z, greggirwin, commented:
<https://github.com/red/REP/issues/70#issuecomment-605350568>

    Excellent use case. Is `Distance?` not enough?

--------------------------------------------------------------------------------

On 2020-03-27T23:35:48Z, hiiamboris, commented:
<https://github.com/red/REP/issues/70#issuecomment-605357110>

    `distance?` only supports faces, and it's too complicated :(
    
    Another use case I had calculated multiple squares of distance (`xy: xy * xy  sq: xy/x + xy/y`) then sorted them and chose the shortest. Only this shortest value was used as distance then (`min-sq ** 0.5`). Again, intermediate word `xy:` is required, while with `power` one could do without it.

--------------------------------------------------------------------------------

On 2020-03-27T23:40:37Z, hiiamboris, commented:
<https://github.com/red/REP/issues/70#issuecomment-605358043>

    Arguably, `length?` (as vector length) will be more useful on pairs than `distance?` (if supported them), as sometimes you don't have `xy1` and `xy2` both but only their difference: `dxy: xy1 - xy2`.
    Compare:
    ```
    distance? xy1 xy2
    distance? 0x0 dxy
    ```
    vs
    ```
    length? xy1 - xy2
    length? dxy
    ```

--------------------------------------------------------------------------------

On 2020-03-28T00:54:11Z, greggirwin, commented:
<https://github.com/red/REP/issues/70#issuecomment-605370870>

    Side note: Looks like we need to fix `pair!` docs, as actions/natives are not correct there. 
    
    `Length?` seems too overloaded if pressed into service for pairs.
    
    `Distance?` can easily be updated to support pairs.
    
    I don't have a strong argument not to add `power` support though. @dockimbel @qtxie?

