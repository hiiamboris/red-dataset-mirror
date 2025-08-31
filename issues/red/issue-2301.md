
#2301: FUNCTION leaks LOCAL
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2301>

I had my suspicion, so I tested it and yes:

```
red>> f: function [][local: "leak"]
== func [][local: "leak"]
red>> f
== "leak"
red>> local
== "leak"
```


Comments:
--------------------------------------------------------------------------------

On 2017-02-16T15:11:57Z, dockimbel, commented:
<https://github.com/red/red/issues/2301#issuecomment-280357190>

    Setting `local` word in the body is not allowed when using `function` constructor in the compiler. Now the interpreter implements the same rule, so the above code would trigger an error now.

