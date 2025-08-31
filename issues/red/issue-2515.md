
#2515: Parse 'TO' stopping before end
================================================================================
Issue is closed, was reported by asampal and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/2515>

Red
```Red
>> parse "this one is" ["this" to "is" "is"]
== false
```

Rebol2/3
```Rebol
>> parse "this one is" ["this"  to "is" "is"]
== true
```

`TO` seems to have this problem with block parsing as well.


Comments:
--------------------------------------------------------------------------------

On 2017-03-30T01:51:33Z, dockimbel, commented:
<https://github.com/red/red/issues/2515#issuecomment-290278472>

    Good catch, thank you!

