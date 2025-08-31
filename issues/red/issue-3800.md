
#3800: `set` on [deep-]reactor is kinda off
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.review]
<https://github.com/red/red/issues/3800>

**Describe the bug**

`set` is useful to initialize an object:
```
>> set o: object [a: b: c: 1] [2 3 4]  o
== make object! [
    a: 2
    b: 3
    c: 4
]
```

But isn't applicable to reactors:
```
>> set r: make reactor! [a: b: c: 1] [2 3 4]  r
== make object! [
    a: 3
    b: 4
    c: none
]
>> set r: make deep-reactor! [a: b: c: 1] [2 3 4]  r
== make object! [
    a: 4
    b: none
    c: none
]
```

**Expected behavior**

I understand that `on-change*` and `on-deep-change*` take precedence here, however I see no use for resetting these hidden functions with `set`. Moreso, `set` doesn't touch their values:
```
>> type? :r/on-deep-change*
== function!
>> type? :r/on-change*
== function!
```
It would be great if `set` ignored these.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 5-Mar-2019/0:09:36+03:00 commit #53b5b37
```



Comments:
--------------------------------------------------------------------------------

On 2019-03-12T19:23:33Z, dockimbel, commented:
<https://github.com/red/red/issues/3800#issuecomment-472146027>

    On first look, I tend to agree with your expected behavior. Though, this need deeper analysis.

