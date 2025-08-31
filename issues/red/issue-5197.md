
#5197: Words received by `on-change*` aren't always bound to the object
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/5197>

:point_up: [September 3, 2022 6:38 PM](https://gitter.im/red/bugs?at=631374f7458f823ce0660146)

**Describe the bug**

Normally, binding is correct:
```
>> o: object [x: 1 on-change*: func [w o n] [print ["Word" mold w "bound to" mold/part context? w 100]]]
>> o/x: 2
Word x bound to make object! [
    x: 2
]
== 2
>> o/('x): 3
Word x bound to make object! [
    x: 3
]
== 3
>> set bind [x:] o 4
Word x: bound to make object! [
    x: 4
]
== 4
```
But not with `set-many`:
```
>> set o 6
Word x bound to make object! [
    datatype!: datatype!
    unset!: unset!
    none!: none!
    logic!: logic!
    b
== 6
>> set o p: make o [x: 7]
Word x: bound to make object! [
    x: 7
]
Word x bound to make object! [
    datatype!: datatype!
    unset!: unset!
    none!: none!
    logic!: logic!
    b
== make object! [
    x: 7
]
>> set o [8]
Word x bound to make object! [
    datatype!: datatype!
    unset!: unset!
    none!: none!
    logic!: logic!
    b
== [8]
```
All these report word to be bound to `system/words` and require an extra `bind`.

**To reproduce**
```
o: object [x: 1 on-change*: func [w o n] [print ["Word" mold w "bound to" mold/part context? w 100]]]
set o 6
set o p: make o [x: 7]
set o [8]
```

**Expected behavior**

Words bound to the object

**Platform version**
```
Red 0.6.4 for Windows built 3-Sep-2022/17:53:01+03:00  commit #cb83eca
```



Comments:
--------------------------------------------------------------------------------

On 2022-09-03T17:04:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/5197#issuecomment-1236165071>

    Related: there's also unwanted `word` argument polymorphism https://github.com/red/REP/issues/115

