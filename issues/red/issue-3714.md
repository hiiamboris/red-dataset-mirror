
#3714: [Crash] on `system/view` access from compiled code
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[type.bug]
<https://github.com/red/red/issues/3714>

:point_up: [January 7, 2019 10:57 AM](https://gitter.im/red/bugs?at=5c3306721491b27876d2eb30)

**Describe the bug**

Access to `system/view` object from a script compiled with `-r` flag crashes it (seemingly due to View not being initialized yet until a call to `view` function).

Same scripts work just fine with `-c` or from `red --cli` or from the CLI console compiled with `Needs: View` option.

**To reproduce**

1.red:
```
Red [] probe system/view/metrics/dpi
```
or
```
Red [] probe system/view/screens/1/size
```

```
> red -r -d -t MSDOS 1.red
> 1.exe
D:\devel\red\red-src\red>1.exe
root size: 2154, root max: 4126, cycles: 0
root size: 2154, root max: 4126, cycles: 1
root size: 2154, root max: 4126, cycles: 2

*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/datatypes/object.reds
*** at line: 97
***
***   stack: red/object/rs-select 026BD264h 030CC930h
***   stack: red/error/reduce 026BD284h 026BD264h
***   stack: red/error/form 026BD264h 026BD274h 026BD254h -18
***   stack: red/actions/form 026BD264h 026BD274h 026BD254h 0
***   stack: red/actions/form* -1
***   stack: red/natives/prin* false
***   stack: red/natives/print* false
***   stack: red/stack/throw-error 026BD284h
***   stack: red/fire 0 0018FEFCh
***   stack: red/actions/get-action-ptr-path 0283F6D8h 7 0049DB14h
***   stack: red/actions/eval-path 0283F6D8h 026B5204h 00000000h 00000000h false
***   stack: red/eval-path 0283F6D8h 026B5204h
```

This however works:
```
Red [Needs: View] probe system/view/screens/1/size
```

```
> 1.exe
1536x864
```

**Expected behavior**

Either it should init the View subsystem on demand or report a (compile-time?) error that it's unavailable.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 5-Jan-2019/4:37:59+03:00 commit #1c0642e
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-07T13:07:49Z, toomasv, commented:
<https://github.com/red/red/issues/3714#issuecomment-451929062>

    I tried it on W10 and it opened console with `96` (scaling 100%).
    No `access violation`.
    Second try with scaling 175%: opened console with `168`.
    
    Third try with second example (resolution):
    Opened console with `1097x617` (scaling 175%).
    Fourth try: `1920x1080` (scaling 100%).
    
    Without problems.
    
    ```
    Red 0.6.4 for Windows built 5-Jan-2019/3:37:59+02:00 commit #1c0642e
    ```

--------------------------------------------------------------------------------

On 2019-05-20T18:53:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/3714#issuecomment-494108565>

    Same crash for `system/console`:
    2.red:
    ```
    Red []
    print mold/flat/part system/console 100
    print mold/flat/part system/console/size 100
    ```
    Output:
    ```
    root size: 2181, root max: 4145, cycles: 0, before: 1089280, after: 1053932
    root size: 2181, root max: 4145, cycles: 1, before: 1086840, after: 1084540
    root size: 2181, root max: 4145, cycles: 2, before: 1086932, after: 1086932
    none                 ;) <--- console is none so every further access attempt to it fails
    
    *** Runtime Error 1: access violation
    *** in file: /D/devel/red/red-src/red/datatypes/object.reds
    *** at line: 97
    ***
    ***   stack: red/object/rs-select 0270D394h 0351DC00h
    ***   stack: red/error/reduce 0270D3B4h 0270D394h
    ***   stack: red/error/form 0270D394h 0270D3A4h 0270D384h -18
    ***   stack: red/actions/form 0270D394h 0270D3A4h 0270D384h 0
    ***   stack: red/actions/form* -1
    ***   stack: red/natives/do-print false true
    ***   stack: red/natives/print* false
    ***   stack: red/stack/throw-error 0270D3B4h
    ***   stack: red/fire 0 0018FF00h
    ***   stack: red/actions/get-action-ptr-path 0288F560h 7 0049EC10h
    ***   stack: red/actions/eval-path 0288F560h 027049D4h 00000000h 00000000h false
    ***   stack: red/eval-path* 0288F560h 027049D4h
    ```

