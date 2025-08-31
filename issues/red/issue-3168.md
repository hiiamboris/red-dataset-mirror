
#3168: Tab key is lost when Shift key is pressed on macOS
================================================================================
Issue is closed, was reported by StephaneVeneri and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3168>

### Expected behavior
The value of the Tab key must be preserved when the Shift key is pressed.

### Actual behavior
The value of the Tab key is lost when the Shift key is pressed.
Works fine on Windows 10 but not on macOS.

### Steps to reproduce the problem
An example script:
```
Red [Needs: 'View]
view [
    field focus on-key [print ["key:" event/key "shift:" event/shift? "ctrl:" event/ctrl?]]
]
```
Result:
**Tab pressed**
```
key:    shift: false ctrl: false
```
**Tab+Shift pressed**
```
key:  shift: true ctrl: false
```
**Tab+Ctrl pressed**
```
key: 	shift: false ctrl: true
```
**w+Shift pressed**
```
key: W shift: true ctrl: false
```

### Red version and build date, operating system with version.
Red version: 0.6.3
Build: red-23dec17-8af8bb8
OS: macOS 10.12.6


