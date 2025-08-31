
#4421: [Core] FOREACH is bugged on images & paths
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written] [GUI]
<https://github.com/red/red/issues/4421>

**Describe the bug**

```
>> i: make image! [2x2 #{111111 222222 333333 444444}]
>> foreach c i [?? c]           ;) this is the only variant working
c: 17.17.17.0
c: 34.34.34.0
c: 51.51.51.0
c: 68.68.68.0
>> foreach [c] i [?? c]
c: 34.34.34.0
c: 34.34.34.0
c: 34.34.34.0
c: 34.34.34.0
>> foreach [a b] i [?? a ?? b]
a: 34.34.34.0
b: 51.51.51.0
a: 34.34.34.0
b: 51.51.51.0

>> i: make image! [1x1 #{111111}]
>> foreach [x y] i [?? x ?? y]
x: 230.210.136.250              ;) looks like total junk!
y: 230.210.136.250

>> foreach x 'a/b/c [?? x]      ;) correct!
x: a
x: b
x: c
>> foreach [x] 'a/b/c [?? x]
x: a/b/c
x: b/c
x: c
>> foreach [x y] 'a/b/c [?? x ?? y]
x: a/b/c
y: a/b/c
x: c
y: c
```

**To reproduce**
```
i: make image! [2x2 #{111111 222222 333333 444444}]
foreach c i [?? c]
foreach [c] i [?? c]
foreach [a b] i [?? a ?? b]
i: make image! [1x1 #{111111}]
foreach [x y] i [?? x ?? y]
foreach x 'a/b/c [?? x]
foreach [x] 'a/b/c [?? x]
foreach [x y] 'a/b/c [?? x ?? y]
```

**Expected behavior**
```
>> foreach c i [?? c]
c: 17.17.17.0
c: 34.34.34.0
c: 51.51.51.0
c: 68.68.68.0
>> foreach [c] i [?? c]
c: 17.17.17.0
c: 34.34.34.0
c: 51.51.51.0
c: 68.68.68.0
>> foreach [a b] i [?? a ?? b]
a: 17.17.17.0
b: 34.34.34.0
a: 51.51.51.0
b: 68.68.68.0

>> i: make image! [1x1 #{111111}]
>> foreach [x y] i [?? x ?? y]
x: 17.17.17.0
y: none

>> foreach x 'a/b/c [?? x]
x: a
x: b
x: c
>> foreach [x] 'a/b/c [?? x]
x: a
x: b
x: c
>> foreach [x y] 'a/b/c [?? x ?? y]
x: a
y: b
x: c
y: none
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 4-Apr-2020/0:17:39+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2022-03-10T14:55:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/4421#issuecomment-1064149568>

    The fix was partial
    ```
    >> paths: [a/b/c 'a/b/c :a/b/c a/b/c:]
    == [a/b/c 'a/b/c :a/b/c a/b/c:]
    >> foreach path paths [foreach [x y] path [print [x y]]]
    a b
    c none
    'a/b/c 'a/b/c
    'c 'c
    :a/b/c :a/b/c
    :c :c
    a/b/c: a/b/c:
    c: c:
    ```

