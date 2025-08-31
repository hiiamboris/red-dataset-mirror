
#2470: Write url will change data block on Linux
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2470>

Unfortunately I cannot isolate this bug, when I tried, it goes away. To see the problem do this:
```
>> do read https://gist.githubusercontent.com/rebolek/ce2aa5aa00276e836029f8d0fcf7f7a2/raw/7fb020a731847883d77b5fb17fe10988f8bc18f9/gitter-api.red
```

Here is output on Windows:
```
[GET [Accept: "application/json"
    Authorization: "Bearer 1234"
]]
[GET [Accept: "application/json"
    Authorization: "Bearer 1234"
]]
```

and here the same code on Linux:
```
[GET [Accept: "application/json"
    Authorization: "Bearer 1234"
]]
[GET [Accept: application/json: "application/json"
    Authorization: Bearer 1234: "Bearer 1234"
]]
```

I am not able to test it on macOS because of #2469.



Comments:
--------------------------------------------------------------------------------

On 2017-03-08T07:51:36Z, dockimbel, commented:
<https://github.com/red/red/issues/2470#issuecomment-284971453>

    I can reproduce the issue.

