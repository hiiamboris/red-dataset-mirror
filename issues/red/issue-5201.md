
#5201: No catch for throw: silent
================================================================================
Issue is closed, was reported by luce80 and has 4 comment(s).
[status.built] [status.tested] [type.review] [GUI]
<https://github.com/red/red/issues/5201>

**Describe the bug**
A strange error appears when `system/view/silent?: yes` is used and VID block contains a `paren!`

**To reproduce**
```
>> system/view/silent?: yes
== true
>> view [base (error)]
*** Throw Error: no catch for throw: silent
*** Where: either
*** Near : no
*** Stack:
```
**Expected behavior**
A different error should appear because compose is not used or no error if that is an error that /silent? should avoid.

**Platform version**
```
>> about
Red 0.6.4 for Windows built 4-Sep-2022/12:59:01+02:00  commit #d85b2ef
```



Comments:
--------------------------------------------------------------------------------

On 2022-09-06T17:58:02Z, dockimbel, commented:
<https://github.com/red/red/issues/5201#issuecomment-1238480819>

    It's intended, you need to provide a `catch` for it, see: https://github.com/red/red/blob/master/modules/view/VID.red#L73
    
    Though, the documentation does not match the feature, so a change is needed anyway.
    

--------------------------------------------------------------------------------

On 2022-09-15T11:22:10Z, dockimbel, commented:
<https://github.com/red/red/issues/5201#issuecomment-1247966282>

    A default `catch` is now built-in VID for silencing those exceptions.

