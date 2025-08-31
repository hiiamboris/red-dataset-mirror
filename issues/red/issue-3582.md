
#3582: integer to image pixel assignment is buggy
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[type.bug]
<https://github.com/red/red/issues/3582>

**Describe the bug**

```
>> i: make image! [1x1 0.0.0.0]
== make image! [1x1 #{000000}]
>> i/(1x1)
== 0.0.0.0
>> i/(1x1): 1
== 1
```
```
>> i/(1x1)
== 9.0.0.0
```
Logic tells this should be 0.0.0.1

```
>> i/(1x1): 10000
== 10000
```
And this should be 0.0.39.16 (2710h = 10000)

```
>> poke i 1x1 10000
== 10000
>> pick i 1x1
== 11.0.0.0
```
Ditto

**Platform version(please complete the following information):**
```
>> about
Red 0.6.3 for Windows built 30-Oct-2018/9:30:29+03:00 commit #a5dc0e1
```

:point_up: [November 7, 2018 4:51 PM](https://gitter.im/red/bugs?at=5be2edd547217e07ffe5ef4e)


