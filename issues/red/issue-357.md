
#357: Issue #342 has  returned
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/357>

The original fix was later removed in a further update, but apparently it is (sometimes?) needed still 

```
switch 1 [1 []]
-= Red Compiler =-
Compiling red/tests/mytest.red ...
[
    stack/mark-native ~select
    block/push blk131
    integer/push 1
    integer/push 2
    actions/select* -1 -1 -1 -1 -1 2 -1 -1
    stack/unwind
    switch integer/get-any* [1 [
            stack/reset
        ] default [0]]
    stack/reset
    ------------| "switch 1"
    block/push blk132
    ------------| "[1 []]"
]
```



Comments:
--------------------------------------------------------------------------------

On 2012-12-31T12:05:44Z, dockimbel, commented:
<https://github.com/red/red/issues/357#issuecomment-11776467>

    I cannot reproduce it, I get the correct code generated here:
    
    ```
    [
        stack/mark-native ~select
        block/push blk131
        integer/push 1
        integer/push 2
        actions/select* -1 -1 -1 -1 -1 2 -1 -1
        stack/unwind
        switch integer/get-any* [1 [
                stack/reset
                unset/push-last
            ] default [0]]
        stack/reset
        ------------| "switch 1 [1 []]"
    ```
    
    Could you check if your local repo is not corrupted in any way? (Maybe try from a freshly cloned repo)

--------------------------------------------------------------------------------

On 2012-12-31T15:41:37Z, meijeru, commented:
<https://github.com/red/red/issues/357#issuecomment-11779094>

    Even with the latest version of today, I still get this behaviour

--------------------------------------------------------------------------------

On 2013-01-04T21:55:56Z, dockimbel, commented:
<https://github.com/red/red/issues/357#issuecomment-11901569>

    The issue was occuring only when the `switch` expression was the last one in a block of code.

