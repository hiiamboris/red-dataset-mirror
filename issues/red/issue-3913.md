
#3913: `make-face/spec` does not process correctly /spec argument
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3913>

`make-face/spec` only processes first argument. When the `/spec` block argument contains a single value, it freezes execution (infinite loop):
````
make-face/spec 'base [red]
````



