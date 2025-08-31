
#4974: Invalid map! makes console quit
================================================================================
Issue is closed, was reported by loziniak and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4974>

When I enter a malformed `map!`, I get kicked out of console, instead just error message.
```
>> #(x: 44)
== #(
    x: 44
)
>> #(x: 44 'test)
*** Script Error: invalid argument: (x: 44 'test)
*** Where: transcode
*** Stack: 
[maciek@laptop ~]$
```

@ Manjaro Linux
```
Red 0.6.4 for Linux built 29-Aug-2021/4:45:25+02:00  commit #19a74de
```


