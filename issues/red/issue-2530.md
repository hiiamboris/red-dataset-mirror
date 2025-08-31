
#2530: Getting unset word from system/words
================================================================================
Issue is closed, was reported by maximvl and has 2 comment(s).
[status.resolved]
<https://github.com/red/red/issues/2530>

I suggest that `system/words/x` should also throw error in this case:

```
>> load "x"
== x
>> system/words/x
>> x
*** Script Error: x has no value
*** Where: catch
```


Comments:
--------------------------------------------------------------------------------

On 2017-07-28T16:48:51Z, dockimbel, commented:
<https://github.com/red/red/issues/2530#issuecomment-318704954>

    Seems to be the case now:
    ```
    >> load "x"
    == x
    >> system/words/x
    *** Script Error: system/words/x has no value
    *** Where: catch
    *** Stack: 
    ```

