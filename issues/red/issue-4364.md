
#4364: Extra indentation spaces in `mold/flat` output
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4364>

**Describe the bug**

```
>> mold/flat object [a: object [b: 1]]
== "make object! [a: make object! [b: 1    ]]"
>> mold/flat object [a: object [b: object [c: 1]]]
== {make object! [a: make object! [b: make object! [c: 1        ]    ]]}
```

**Expected behavior**
```
>> mold/flat object [a: object [b: 1]]
== "make object! [a: make object! [b: 1]]"
>> mold/flat object [a: object [b: object [c: 1]]]
== {make object! [a: make object! [b: make object! [c: 1]]]}
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-Feb-2020/6:07:00+03:00 commit #bf15211
```



