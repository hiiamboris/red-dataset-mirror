
#2277: Defining `dot` breaks lexer
================================================================================
Issue is closed, was reported by greggirwin and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2277>

```
red>> dot: does []
== func [][]
red>> 0:00:00.089000001 - 0:00:00.007000001
*** Script Error: .089000001 has no value
*** Where: -
red>> 0.089000001 - 0.007000001
*** Syntax Error: invalid integer! at "0.089000001 - 0.007000001"
*** Where: do

red>> dot: #"."
== #"."
red>> 0:00:00.089000001 - 0:00:00.007000001
== 0:00:00.082000001
red>> 0.089000001 - 0.007000001
== 0.082
```



Comments:
--------------------------------------------------------------------------------

On 2017-02-20T11:45:54Z, dockimbel, commented:
<https://github.com/red/red/issues/2277#issuecomment-281058938>

    Lexer's dependency on named `char!` values has been reduced.

