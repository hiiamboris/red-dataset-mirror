
#3603: Access violation on BLOCK! probing
================================================================================
Issue is closed, was reported by 9214 and has 6 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/3603>

**Describe the bug**

Seemingly harmless one-liner leads to an unexpected crash.

**To reproduce**

```red
probe back change block: [] do/next block 'rest
```
```
*** Runtime Error 1: access violation
*** at: 0042FCDBh
```

On further inspection, `mold` revealed that block contains a null byte:
```red
>> mold back change block: [] do/next block 'rest
== "[^@]"
```

**Expected behavior**

`[unset]`

**Platform version (please complete the following information):**
```
Red 0.6.4 for Windows built 22-Nov-2018/0:36:02+05:00 commit #5f63e4a
```


Comments:
--------------------------------------------------------------------------------

On 2018-11-22T07:48:47Z, qtxie, commented:
<https://github.com/red/red/issues/3603#issuecomment-440941552>

    Seems only crashes when the block is empty.
    ```
    >> probe back change block: [1] do/next block 'rest
    [1]
    ```

--------------------------------------------------------------------------------

On 2018-11-22T07:57:58Z, endo64, commented:
<https://github.com/red/red/issues/3603#issuecomment-440943548>

    @9214 `mold` shows only one null byte but there is more actually;
    
    ```
    >> change block: [] do/next block 'rest
    == []
    >> block
    == [´I¸ý]
    >> mold block
    == "[Ä^LE^LÉÂ^H]"
    ```

--------------------------------------------------------------------------------

On 2018-11-22T08:27:52Z, 9214, commented:
<https://github.com/red/red/issues/3603#issuecomment-440950483>

    @endo64 good catch.

