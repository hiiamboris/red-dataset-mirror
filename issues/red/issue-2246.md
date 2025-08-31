
#2246: Compiler shows wrong error message for invalid path!
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2246>

#2195 has been fixed in interpreter:

```
red>> system/options/
*** Syntax Error: invalid path! at "system/options/"
*** Where: do
```

However compiler returns wrong error message:

```
*** Syntax Error: Invalid integer! value
*** line: 2
*** at: "system/options/"
```

OTOH, technically it really is invalid integer ;)



