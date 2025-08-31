
#4293: SAVE doesn't save an empty image
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4293>

**Describe the bug**

```
save/as %testimg.bmp make image! 0x0 'bmp
save/as %testimg.gif make image! 0x0 'gif
save/as %testimg.jpg make image! 0x0 'jpeg
save/as %testimg.png make image! 0x0 'png
```
All these commands produce a file of 0 bytes.

**Expected behavior**

I expect the result of such `save` to be loadable as `make image! 0x0`.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 31-Jan-2020/17:12:41+03:00 commit #414cdb3
```



Comments:
--------------------------------------------------------------------------------

On 2020-02-10T17:05:41Z, meijeru, commented:
<https://github.com/red/red/issues/4293#issuecomment-584226860>

    Of course `load/as` on an empty file could itself produce a `0x0` image as well.

--------------------------------------------------------------------------------

On 2020-02-10T17:39:32Z, hiiamboris, commented:
<https://github.com/red/red/issues/4293#issuecomment-584242933>

    I'd prefer normal `load` to work too, but currently even `load/as` is failing:
    ```
    >> read/binary %1
    == #{}
    >> load/as %1 'png
    *** Access Error: cannot open: %1
    *** Where: decode
    *** Stack: load 
    ```

--------------------------------------------------------------------------------

On 2020-02-10T18:03:55Z, meijeru, commented:
<https://github.com/red/red/issues/4293#issuecomment-584253528>

    The two issues may be connected, but even if they are not, they deserve to be resolved together, I would say.

--------------------------------------------------------------------------------

On 2020-02-13T09:20:38Z, qtxie, commented:
<https://github.com/red/red/issues/4293#issuecomment-585629438>

    > I'd prefer normal `load` to work too, but currently even `load/as` is failing:
    > 
    > ```
    > >> read/binary %1
    > == #{}
    > >> load/as %1 'png
    > *** Access Error: cannot open: %1
    > *** Where: decode
    > *** Stack: load 
    > ```
    
    This is expected as the file is empty. It should at least include a PNG header otherwise the decode cannot recognize it.

