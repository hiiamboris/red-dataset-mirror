
#3311: GUI console locks up after unview is evaluated in a GUI action
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3311>

### Expected behavior
Evaluating `unview` in an action of a script launched from the Red GUI console should return control to the Red console.
### Actual behavior
The console is locked after the GUI is closed.
### Steps to reproduce the problem
Run this code:
`view [ button "quit" [ unview ] ]`
### Version (run `about` in the Red Console and paste the result here) also add OS version.
>> about
Red 0.6.3 for macOS built 2-Apr-2018/23:21:48



