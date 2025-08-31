
#4821: [View] CRASH in unview inside on-close
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4821>

**Describe the bug**

Crashes the CLI console only!
`view/no-wait [on-close [unview/all]] do-events` - Crashes when you close the window!
`view [on-close [unview/all]]` - Does not!

```
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/datatypes/object.reds
*** at line: 103
***
***   stack: red/object/get-values 028092E4h
***   stack: red/error/form 028092E4h 028092F4h 028092D4h 0
***   stack: red/actions/form 028092E4h 028092F4h 028092D4h 0
***   stack: red/actions/form* -1
***   stack: red/natives/do-print true true
***   stack: red/natives/print* true
***   stack: ctx||568~launch 02D71D68h
***   stack: ctx||587~launch 02D71804h
```

**Platform version**
```
Red 0.6.4 for Windows built 28-Jan-2021/14:26:17+03:00 commit #bae0c34
```



Comments:
--------------------------------------------------------------------------------

On 2021-02-10T18:35:39Z, greggirwin, commented:
<https://github.com/red/red/issues/4821#issuecomment-776922452>

    Confirmed on Win10.

