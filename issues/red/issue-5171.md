
#5171: Unexpected behavior when inserting into series
================================================================================
Issue is open, was reported by dsunanda and has 6 comment(s).
[type.bug] [status.reviewed]
<https://github.com/red/red/issues/5171>


**Describe the bug**
Copying the last two values in a block to its head produces unintuitive result (that also differs from R2 and R3).

**To reproduce**
```
    blk: copy [1 2 3 4 5 6]
    insert blk skip blk -2 + length? blk
    probe head blk
    == [3 4 1 2 3 4 5 6]
```
**Expected behavior**
R2 and R3 produce:
```
    == [5 6 1 2 3 4 5 6]
```

**Platform version**
Please specify the operating system, Red version, and build date with Git commit.
```
Red 0.6.4 for Windows built 29-Jul-2022/15:33:53
```



Comments:
--------------------------------------------------------------------------------

On 2022-08-04T17:15:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/5171#issuecomment-1205543509>

    somewhat connected to https://github.com/red/red/issues/4099

--------------------------------------------------------------------------------

On 2024-05-01T22:51:40Z, bgrossot, commented:
<https://github.com/red/red/issues/5171#issuecomment-2089255473>

    not reproduced with 0.6.5

--------------------------------------------------------------------------------

On 2024-05-02T20:33:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/5171#issuecomment-2091507032>

    > not reproduced with 0.6.5
    ```
    >> about
    Red 0.6.5 for Windows built 7-Mar-2024/2:20:18+03:00  commit #5a39a7a
    >> blk: copy [1 2 3 4 5 6]
    == [1 2 3 4 5 6]
    >>     insert blk skip blk -2 + length? blk
    == [1 2 3 4 5 6]
    >>     probe head blk
    [3 4 1 2 3 4 5 6]
    == [3 4 1 2 3 4 5 6]
    ```

