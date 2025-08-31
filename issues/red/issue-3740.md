
#3740: Parse crashes on `any <set-word!>`
================================================================================
Issue is closed, was reported by xqlab and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3740>

**Describe the bug**
parse crashes the interpreter


**To reproduce**
```
>> parse " " [any x:]

*** Runtime Error 1: access violation
*** at: 08067E63h
```
same with some or 
`parse " " [`any x: skip]

**Expected behavior**

similar to
```
>> parse "" [any x:]
== true
```
or at least an error message.  


**Platform version (please complete the following information)**
```
Platform version (please complete the following information)
>> about
Red 0.6.4 for Windows built 11-Jan-2019/3:18:27+01:00 commit #5e37a10
or
Red 0.6.4 for Linux built 11-Jan-2019/3:18:27+01:00 commit #5e37a10

```



Comments:
--------------------------------------------------------------------------------

On 2019-01-17T11:08:35Z, nedzadarek, commented:
<https://github.com/red/red/issues/3740#issuecomment-455133906>

    [source](https://gitter.im/red/bugs?at=5c3f517c0999400604fee689):
    ```
    parse " " [any x:]
    ; == false
    ```
    `Red 0.6.4 for Windows built 22-Nov-2018/1:40:38+01:00 commit #755eb94` and `Red 0.6.4 for Windows built 22-Nov-2018/1:40:38+01:00 commit #755eb94` work.
    `red-26dec18-7369fa2e, gui-console-2019-1-11-8330` and `gui-console-2019-1-1-51753` doesn't work.
    
    ps. Windows 8.1 x64

--------------------------------------------------------------------------------

On 2019-03-18T16:02:28Z, dockimbel, commented:
<https://github.com/red/red/issues/3740#issuecomment-473977115>

    > Expected behavior
    > similar to
    
    >> parse "" [any x:]
    == true
    
    This sample is not equivalent to the one causing the crash, so the expected behavior will not be the same. `any x:` is expected to match nothing, so to return `true` on an empty input, and `false` on a non-empty one.

