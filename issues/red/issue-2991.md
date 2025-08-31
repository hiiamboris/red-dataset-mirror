
#2991: [wish] Add negative indexes support to series!
================================================================================
Issue is closed, was reported by maximvl and has 2 comment(s).
<https://github.com/red/red/issues/2991>

The purpose is to enable indexes from the tail of series eg:

```
a: [1 2 3]
a/-1 ; => 3
a/-2 ; => 2
```


Comments:
--------------------------------------------------------------------------------

On 2017-08-20T22:24:13Z, greggirwin, commented:
<https://github.com/red/red/issues/2991#issuecomment-323615920>

    Negative indexes already work, just not that way.
    
    ```
    >> a: [1 2 3]
    == [1 2 3]
    >> a/-1
    == none
    >> a: tail [1 2 3]
    == []
    >> a/-1
    == 3
    ```

