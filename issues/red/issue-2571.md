
#2571: or with empty bitset! and zero causes crash
================================================================================
Issue is closed, was reported by dander and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2571>

```
>> system/options/boot
== "C:\ProgramData\Red\console-2017-4-13-34680.exe"
>> b: make bitset! []
== make bitset! #{00}
>> b or 0

*** Runtime Error 1: access violation
*** at: 0043A4DEh
```


Comments:
--------------------------------------------------------------------------------

On 2017-04-13T09:57:38Z, meijeru, commented:
<https://github.com/red/red/issues/2571#issuecomment-293846053>

    I suspect that *all* bitset operations with number as second argument will crash

