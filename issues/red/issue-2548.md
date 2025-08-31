
#2548: Parse with negative skip behavior not defined?
================================================================================
Issue is closed, was reported by greggirwin and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2548>

```
>> parse "1234" [-2 skip]
== false
>> parse "1234" [-1 skip]
== true
>> parse tail "1234" [-1 skip]
== true
>> parse tail "1234" [-6 skip]
== true
>> parse tail "1234" [mark: -3 skip]
== true
>> mark
== ""

>> parse "1234" [collect keep -1 skip]
== ["1234"]
>> parse [a b c d] [collect keep -1 skip]
== [[a b c d]]
```


Comments:
--------------------------------------------------------------------------------

On 2017-04-13T03:19:51Z, dockimbel, commented:
<https://github.com/red/red/issues/2548#issuecomment-293768066>

    Negative integers in Parse rules should throw an error, as they denote iteration count of the next rule.

