
#5345: Design fault of LOADing DATEs
================================================================================
Issue is closed, was reported by endo64 and has 10 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5345>

**Describe the bug**
`LOAD`ing date values has a design fault and makes it untrustable.

> year and day fields are interchangeable, but only for low year values.

[Link](https://github.com/red/docs/blob/master/en/datatypes/date.adoc#22-runtime-creation)

Conversations on [Gitter](https://matrix.to/#/!mjbZGzLqlsqlDLaQVP:gitter.im/$OpVjizYTvUwbLDcyEcYnQfC5jhDBG_RzzFVfhb3jjr0?via=gitter.im&via=matrix.org&via=tchncs.de)

**To reproduce**

```red
>> 11-nov-13
== 11-Nov-2013
>> 12-nov-13
== 12-Nov-2013
>> 13-nov-13
== 13-Nov-2013
>> 14-nov-13
== 13-Nov-2014
>> 15-nov-13
== 13-Nov-2015
```

**Expected behavior**
Consistent use of argument positions.

**Platform version**
Red 0.6.4 for Windows built 20-Feb-2023/10:53:57-04:00  commit #bd5bc29


Comments:
--------------------------------------------------------------------------------

On 2023-07-11T11:44:36Z, dockimbel, commented:
<https://github.com/red/red/issues/5345#issuecomment-1630673347>

    It's a bug, expected results are:
    
    ```
    >> 14-nov-13
    == 14-Nov-2013
    >> 15-nov-13
    == 15-Nov-2013
    ```

--------------------------------------------------------------------------------

On 2023-07-12T11:57:48Z, dockimbel, commented:
<https://github.com/red/red/issues/5345#issuecomment-1632396981>

    The related documentation was fixed also accordingly.

--------------------------------------------------------------------------------

On 2023-07-12T12:14:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/5345#issuecomment-1632421285>

    What about 
    > year and day fields are interchangeable, but only for low year values.
    
    Did you mean "for *high* year values" instead?

--------------------------------------------------------------------------------

On 2023-07-13T09:23:10Z, dockimbel, commented:
<https://github.com/red/red/issues/5345#issuecomment-1633881953>

    Forgot it, it's fixed now, thanks.

--------------------------------------------------------------------------------

On 2023-07-13T16:03:30Z, endo64, commented:
<https://github.com/red/red/issues/5345#issuecomment-1634509370>

    Please see the further comment on [gitter](https://matrix.to/#/!mjbZGzLqlsqlDLaQVP:gitter.im/$uzlFNOJM5Deqg1wDOFp0YaOaaXDhCKiyRXasyDvYCY8?via=gitter.im&via=matrix.org&via=tchncs.de)

