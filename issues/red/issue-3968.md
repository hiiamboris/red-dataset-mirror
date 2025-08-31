
#3968: WISH: Add new-lines automatically when converting map to block
================================================================================
Issue is closed, was reported by greggirwin and has 0 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/3968>

When converting a map to a block, apply `new-line/skip ... on 2` automatically.

Today:
```
>> results
== #(
    word!: 51
    block!: 21
    set-word!: 10
    string!: 6
    refinement!: 1
    integer!: 3
    path!: 5
    get...
>> to block! results
== [word!: 51 block!: 21 set-word!: 10 string!: 6 refinement!: 1 integer!: 3 path!: 5 get-word!: 1 set-path!: 2 map!: 1 fil...
```

With this change:
```
>> to block! results
== [
    word!: 51 
    block!: 21 
    set-word!: 10 
    string!: 6 
    refinement!: 1 
    integer!: 3 
    path!: 5 
 ...
```


