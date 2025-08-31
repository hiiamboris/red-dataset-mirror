
#5066: Memory LEAK in `take` action
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [type.bug] [test.written]
<https://github.com/red/red/issues/5066>

**Describe the bug**
```
>> s: append/dup "" "x" 1000000
== {xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx...
>> recycle recycle/off
>> s1: stats loop 1000000 [take/last s] stats - s1
== 44000168

>> s: append/dup "" "x" 1000000
== {xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx...
>> s1: stats loop 1000000 [take s] stats - s1
== 44000000

>> s: append/dup [] 1 1000000
== [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ...
>> s1: stats loop 1000000 [take/last s] stats - s1
== 44000168
```

**To reproduce**
```
s: append/dup "" "x" 1000000
recycle recycle/off
s1: stats loop 1000000 [take/last s] stats - s1

s: append/dup [] 1 1000000
s1: stats loop 1000000 [take/last s] stats - s1
```

**Expected behavior**

No leak

**Platform version**
```
Red 0.6.4 for Windows built 25-Jan-2022/14:48:41+03:00  commit #dbbe6e0
```



Comments:
--------------------------------------------------------------------------------

On 2022-10-26T07:40:13Z, qtxie, commented:
<https://github.com/red/red/issues/5066#issuecomment-1291625569>

    It still takes some memory after the fix.
    ```
    s: append/dup "" "x" 1000001
    loop 1 [take/last s]
    recycle recycle/off
    s1: stats loop 1000000 [take/last s] stats - s1
    
    == 168
    ```

--------------------------------------------------------------------------------

On 2022-10-26T10:30:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/5066#issuecomment-1291827219>

    path cache:
    ```
    s: append/dup "" "x" 1000001
    loop 1 b: [take/last s]
    recycle recycle/off
    s1: stats loop 1000000 b stats - s1
    
    == 0
    ```

--------------------------------------------------------------------------------

On 2022-10-27T23:41:42Z, qtxie, commented:
<https://github.com/red/red/issues/5066#issuecomment-1294237463>

    > path cache:
    > 
    > ```
    > s: append/dup "" "x" 1000001
    > loop 1 b: [take/last s]
    > recycle recycle/off
    > s1: stats loop 1000000 b stats - s1
    > 
    > == 0
    > ```
    
    BTW, this code cannot be compiled.

