
#3213: Image! outside re-opened window
================================================================================
Issue is closed, was reported by luce80 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3213>

### Expected behavior
https://files.gitter.im/red/red/gui-branch/oOLv/t.gif as on Win10
It works ok also if run from red console.
### Actual behavior
https://files.gitter.im/red/red/gui-branch/PkSM/Peek-2018-01-27-18-28.gif on Win7
### Steps to reproduce the problem
Save and run the script below (do NOT run in red console )
```
Red []

lay: layout [canvas: image 100x100]
view/no-wait lay
unview/only lay
view/options lay [offset: 50x50]
```
### Red version and build date, operating system with version.
```
>> about
Red for Windows version 0.6.3 built 27-Jan-2018/15:00:13+01:00
```
on Win7


