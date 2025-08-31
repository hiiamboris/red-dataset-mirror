
#2500: image pixel can be selected by pair value, but only when pair is in ( )  
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
<https://github.com/red/red/issues/2500>

Compare:
```
i: make image! 20x20
== ...
>> i/3x4
*** Syntax Error: invalid integer! at "i/3x4"
*** Where: do
>> i/(3x4)
== 255.255.255.0
```
It would be nice if the lexer could handle the pair directly.
BTW this is part of a more general restriction on path elements



Comments:
--------------------------------------------------------------------------------

On 2019-01-05T21:01:30Z, meijeru, commented:
<https://github.com/red/red/issues/2500#issuecomment-451690024>

    I accept the current restrictions and close this issue.

