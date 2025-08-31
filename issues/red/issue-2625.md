
#2625: select <vector> <float> does not work
================================================================================
Issue is open, was reported by meijeru and has 4 comment(s).
[type.bug] [status.reviewed]
<https://github.com/red/red/issues/2625>

```
>> v: make vector! [1 2 3]
== make vector! [1 2 3]
>> select v 1
== 2     ;; this works
>> v: make vector! [1.0 2.0 3.0]
== make vector! [1.0 2.0 3.0]
>> select v 1.0
== none
```
I have also had a crash on this. The implementation inherits from `string!`, and uses `find`.


Comments:
--------------------------------------------------------------------------------

On 2017-04-24T10:35:46Z, meijeru, commented:
<https://github.com/red/red/issues/2625#issuecomment-296612678>

    I have now seen that the case of selecting on floats is excluded; it should always give `none`.  See  `%string.reds` at line 1694 and following. Perhaps the crash was a fluke. But should one want the facility to select on floats?

--------------------------------------------------------------------------------

On 2017-04-27T15:39:43Z, dockimbel, commented:
<https://github.com/red/red/issues/2625#issuecomment-297752518>

    If it is allowed on integers, it should be allowed on all datatypes supported by `vector!`.

