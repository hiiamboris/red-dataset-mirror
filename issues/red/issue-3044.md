
#3044: new-line does not accept head of string or chars as true
================================================================================
Issue is closed, was reported by xqlab and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3044>

```
s: "yyyyyy"
>>  new-line/all [ 1 2 3] s
== [1 2 3]
>>  new-line/all [ 1 2 3] s/4
== [1 2 3]
>>  new-line/all [ 1 2 3] next s
== [
    1 
    2 
    3
]

>>  new-line/all [ 1 2 3] s
== [1 2 3]
>> s2: at s 2
== "yyyyy"
>>  new-line/all [ 1 2 3] s2
== [
    1 
    2 
    3
]
```

Similar behavior with blocks
```
>>  new-line/all [ 1 2 3] next [1 2]
== [
    1 
    2 
    3
]
>>  new-line/all [ 1 2 3]  [1 2]
== [1 2 3]
```


Comments:
--------------------------------------------------------------------------------

On 2017-09-18T12:28:36Z, dockimbel, commented:
<https://github.com/red/red/issues/3044#issuecomment-330204493>

    The implementation of `new-line` expects a `logic!` value, but the type is not enforced in the spec block.

