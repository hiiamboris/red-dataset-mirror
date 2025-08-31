
#1169: RETURN/EXIT from interpreted code not caught by compiled function
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1169>

This is an hairy one: compiled functions do not wrap their body code with a `catch` statement (because of issues with nested `catch` handling and general performance impact, as it would need to be done for every function compiled). So, a `return` or `exit` statement from interpreted code will not be stopped by the wrapping function by will go throug the whole stack and generate a _THROW without CATCH_ runtime error.

Example code:

```
foo: does [parse "1" [(return 123)]]
probe foo
```



Comments:
--------------------------------------------------------------------------------

On 2015-05-13T11:04:01Z, dockimbel, commented:
<https://github.com/red/red/issues/1169#issuecomment-101629072>

    Still crashing in interpreter.

