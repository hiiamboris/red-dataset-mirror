
#4650: SAVE on BLOCK! with one value saves just the value
================================================================================
Issue is open, was reported by rebolek and has 4 comment(s).
[type.review]
<https://github.com/red/red/issues/4650>

```
>> save %delme [1]
>> block: load %delme
== 1
>> type? block
== integer!
```

Saving block with one value strips the block and saves just the first value. This is different from Rebol that doesn't try to be smart and if you save a block, it saves a block.

This is problematc when LOADing the value back as you need special logic for handling single value and handling blocks.

**Expected behavior**
I expect Red to do the same thing that Rebol does - if I save block, block is saved, not just first value.

**Platform version (please complete the following information)**
```
>> about
Red 0.6.4 for macOS built 15-Sep-2020/7:16:14
; same on Linux
```



Comments:
--------------------------------------------------------------------------------

On 2020-09-16T04:39:07Z, guaracy, commented:
<https://github.com/red/red/issues/4650#issuecomment-693164903>

    If strings are always saved enclosed with double quotes why not use the same behaviour for blocks? 
    Saving all blocks enclosed with brackets, avoid special cases. And load deals fine with them.
    
    ```
    >> load "[1 2 3 4 5 6]"
    == [1 2 3 4 5 6]
    >> load "[1]"
    == [1]
    ```

--------------------------------------------------------------------------------

On 2020-10-08T17:22:52Z, 9214, commented:
<https://github.com/red/red/issues/4650#issuecomment-705713079>

    Links to relevant design discussions on Gitter, for posterity: [1](https://gitter.im/red/bugs?at=5f4fa13ad4f0f55ebbf970db), [2](https://gitter.im/red/bugs?at=5f6ab9f86e85e0058c4c7c22).

