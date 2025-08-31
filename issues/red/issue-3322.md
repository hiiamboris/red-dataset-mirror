
#3322: GUI Console is missing quit function on macOs
================================================================================
Issue is closed, was reported by StephaneVeneri and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3322>

### Expected behavior
The GUI Console closes when the 'quit' function is called 

### Actual behavior
```
>> quit
*** Script Error: _terminate-console has no value
*** Where: do
*** Stack: quit 
```

### Steps to reproduce the problem
Just input 'quit' on prompt and valid

### Red and platform version
Red version: 0.6.3
Build: From the latest commit 2b20aee
OS: macOS 10.12.6


