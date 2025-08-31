
#2366: <remove-each> doesn't return anything
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.duplicate]
<https://github.com/red/red/issues/2366>

in **Rebol2** `remove-each` should return changed series:
```
>> remove-each i [1 2 3 4] [even? i]
== [1 3]
```
in **Rebol3** it should return a count of the number of elements removed:
```
>> remove-each i [1 2 3 4] [even? i]
== 2
```
but in **Red** it doesn't return anything:
```
red>> remove-each i [1 2 3 4] [even? i]
red>>
```


Comments:
--------------------------------------------------------------------------------

On 2016-12-13T04:36:26Z, dockimbel, commented:
<https://github.com/red/red/issues/2366#issuecomment-266638599>

    Closing as duplicate of #2126.

