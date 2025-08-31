
#5151: `round/to` should be able to handle two pairs/tuples
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.wish] [test.written]
<https://github.com/red/red/issues/5151>

**Describe the bug**
```
>> round/to 22x33 10x20
*** Script Error: round/to does not allow pair! for its scale argument
*** Where: round
*** Near : 10x20
*** Stack:  

```

**Expected behavior**

```
>> round/to 22x33 10x20
== 20x40
```

Tuple could be supported too, maybe a bit less useful.

**Platform version**
```
Red 0.6.4 for Windows built 1-Jun-2022/7:18:47+03:00  commit #c619918
```



Comments:
--------------------------------------------------------------------------------

On 2022-06-11T16:53:53Z, greggirwin, commented:
<https://github.com/red/red/issues/5151#issuecomment-1152963644>

    Tuple seems much less useful, I agree.

--------------------------------------------------------------------------------

On 2022-06-17T16:15:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/5151#issuecomment-1159031455>

    We're walking in circles: https://github.com/red/REP/issues/10 https://github.com/red/red/issues/1263

