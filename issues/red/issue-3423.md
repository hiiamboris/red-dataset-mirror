
#3423: first, second etc. not defined on date! values
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
<https://github.com/red/red/issues/3423>

### Expected behavior

>>d: now
>>first d ;-- should be equivalent to d/1

### Actual behavior

>>d: now
>>first d
*** Script Error: first does not allow date! for its s argument

### Steps to reproduce the problem
Execute above code
### Red and platform version
```
all
```
As usual: consistency requirement (first etc. work on `time! tuple!` and `pair!` values).


Comments:
--------------------------------------------------------------------------------

On 2018-06-22T03:23:03Z, greggirwin, commented:
<https://github.com/red/red/issues/3423#issuecomment-399309212>

    See: https://github.com/greggirwin/red/commit/13f890b0095f37e8dcaf95e35f2778b1c6b03b95

