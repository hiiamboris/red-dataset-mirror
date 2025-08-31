
#885: Lenient Returns
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/885>

Both the interpreter and compiler unquestionably print both lines from the following:

```
Red []
f: function [anArg return: [integer!]] [anArg]
print f 42
print f "hi"
```

Should an error be thrown because `"hi"` is not an integer, or is that just in Red/System?



Comments:
--------------------------------------------------------------------------------

On 2014-07-14T13:56:00Z, dockimbel, commented:
<https://github.com/red/red/issues/885#issuecomment-48902237>

    The error sub-system is not implemented yet in Red, so no argument type-checking either yet. So for now, you need to use correct code as far as possible.

