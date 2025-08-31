
#4983: CRASH Linux read-clipboard
================================================================================
Issue is closed, was reported by gltewalt and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4983>

Access Violation on a new console session when no data has previously been copied to, or written to, the clipboard.

```red
gt@lappy:~$ ./red
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> read-clipboard

*** Runtime Error 1: access violation
*** at: F7DAE6BAh
```


**Expected behavior**
Return `""` or `none`, or the attempted default value.


**Platform version**

```
Red 0.6.4 for Linux built 7-Oct-2021/5:56:13-06:00  commit #7218fb4
```


Comments:
--------------------------------------------------------------------------------

On 2021-10-18T11:51:31Z, endo64, commented:
<https://github.com/red/red/issues/4983#issuecomment-945686421>

    Might be a related issue https://github.com/red/red/issues/4331 

