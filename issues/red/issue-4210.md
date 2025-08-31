
#4210: TRIM ignores /tail and /head on blocks and assumes /all
================================================================================
Issue is open, was reported by hiiamboris and has 8 comment(s).
[type.task.wish]
<https://github.com/red/red/issues/4210>

**Describe the bug**

```
>> trim reduce [none 2 none 3 none]
== [2 3]
>> trim/tail reduce [none 2 3 none]
== [2 3]
>> trim/head reduce [none 2 3 none]
== [2 3]
>> trim reduce [none 2 3 none]
== [2 3]
```

**Expected behavior**
```
== [2 none 3]
== [none 2 3]
== [2 3 none]
== [2 3]
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 20-Dec-2019/19:03:46+03:00 commit #544a6e1
```



Comments:
--------------------------------------------------------------------------------

On 2019-12-28T17:28:53Z, greggirwin, commented:
<https://github.com/red/red/issues/4210#issuecomment-569436156>

    Was just going to report the `/all` part, and then saw you updated it here.

--------------------------------------------------------------------------------

On 2019-12-31T10:28:51Z, endo64, commented:
<https://github.com/red/red/issues/4210#issuecomment-569905322>

    Some relevant issues:
    https://github.com/red/REP/issues/52
    https://github.com/red/red/issues/3663

--------------------------------------------------------------------------------

On 2019-12-31T19:47:54Z, greggirwin, commented:
<https://github.com/red/red/issues/4210#issuecomment-569981230>

    Thanks @endo64! :+1:

--------------------------------------------------------------------------------

On 2020-05-13T06:08:26Z, qtxie, commented:
<https://github.com/red/red/issues/4210#issuecomment-627767154>

    Just check the code, for trimming block!, no refinements implemented at all.

