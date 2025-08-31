
#4448: GET does not support get-paths/set-paths
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/4448>

:point_up: [May 16, 2020 9:36 PM](https://gitter.im/red/bugs?at=5ec032c890f6db31beee53b5)

**Describe the bug**

Get should work not only for paths but also for get-/set-/lit-paths (as otherwise one always has to do extra checks and coerce the path)
```
>> get quote :system/script
*** Script Error: get does not allow get-path! for its word argument
*** Where: get
*** Stack:  

>> get quote system/script:
*** Script Error: get does not allow set-path! for its word argument
*** Where: get
*** Stack:  

>> get quote 'system/script
*** Script Error: get does not allow lit-path! for its word argument
*** Where: get
*** Stack:  
```

**Expected behavior**

Same as
```
>> get 'system/script
== make object! [
    title: none
    header: none
    parent: none
    path: none
    a...
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 16-May-2020/14:49:13+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-05-16T18:55:57Z, 9214, commented:
<https://github.com/red/red/issues/4448#issuecomment-629691245>

    https://github.com/red/red/pull/4129#issue-339014686

