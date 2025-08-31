
#3869: Internal usage of `call/shell` does not conform to `cmd.exe` specs on Windows
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
<https://github.com/red/red/issues/3869>

**Describe the bug**

Having a `prog ram.exe` (with a space in it's name) I tried to `call` it with some arguments:
```
>> call/wait/console {"prog ram" "" 1 "2 3"}          ;) this is totally OK
[prog ram] ["" 1 "2 3"]
    -> [] [1] [2 3]
== 0

>> call/wait/console {prog ram "" 1 "2 3"}            ;) NO idea why this works - it should run `prog`
[prog ram] ["" 1 "2 3"]
    -> [] [1] [2 3]
== 0

>> call/wait/shell/console {"prog ram" "" 1 "2 3"}    ;) adding /shell breaks everything
"prog" is not recognized as an internal or external command, operable program or batch file.
== 1
```

**To reproduce**

The problem with the 3rd call is that `/shell` simply [prepends the command line with `cmd /c`](https://github.com/red/red/blob/8d712e4ba1b16e1b7a339006d1154aebc9cb7ce4/runtime/call.reds#L331). Which is wrong. Look:
```
>cmd /c "prog ram.exe" "" 1 "2 3"
"prog" is not recognized as an internal or external command, operable program or batch file.

>cmd /s /c ""prog ram.exe" "" 1 "2 3""
[prog ram.exe] ["" 1 "2 3"]
    -> [] [1] [2 3]
```
The latter example is a proper way to provide a command line to the shell - see https://superuser.com/questions/1213094/how-to-escape-in-cmd-exe-c-parameters
TL;DR (with /S flag):
> first character is
    a quote character and if so, strip the leading character and
    remove the last quote character on the command line, preserving
    any text after the last quote character.

I didn't look into the 2nd call issue though.

**Expected behavior**

2nd call should fail, 3rd should not


**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 22-Apr-2019/19:40:30+03:00 commit #9ac4430
```

**`prog ram` source:**
```
Red []
print rejoin ["[" system/options/boot "] [" system/script/args "]"]
prin "    ->" foreach arg system/options/args [prin rejoin [" [" arg "]"]]  prin lf
```


Comments:
--------------------------------------------------------------------------------

On 2019-05-14T12:33:45Z, dockimbel, commented:
<https://github.com/red/red/issues/3869#issuecomment-492218031>

    @hiiamboris If the fix is as trivial as adding a `/s` in the prepended string, please send a PR with the fix.

--------------------------------------------------------------------------------

On 2019-05-14T22:45:20Z, greggirwin, commented:
<https://github.com/red/red/issues/3869#issuecomment-492438311>

    +1 for making that change. And `cmd` has the longest help text I've ever seen. :^)

