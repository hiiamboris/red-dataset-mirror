
#342: SWITCH compilation generates odd result
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/342>

I compiled `switch i [1 [] 2 3 []]` just to see what the code looks like. I understand all of it except the last line. Why is there a `block/push` needed?

```
stack/mark-native ~select
block/push blk129
word/get ~i
integer/push 2
actions/select* -1 -1 -1 -1 -1 3 -1 -1
stack/unwind
switch integer/get* [1 [
        stack/reset
    ] 2 [
        stack/reset
    ] default [0]]
stack/reset
------------| "switch i"
block/push blk130
------------| "[1 [] 2 3 []]"
```



Comments:
--------------------------------------------------------------------------------

On 2012-12-18T11:04:50Z, dockimbel, commented:
<https://github.com/red/red/issues/342#issuecomment-11481859>

    You have found a bug. The source pointer seems to end the `switch` expression too early, so the block is treated as a literal value.

