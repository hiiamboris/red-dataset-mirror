
#2931: Parse error then trying to build a macro from function defined in other file
================================================================================
Issue is closed, was reported by 9214 and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2931>

```Red
Red [File: %my-code.red]

#macro my-macro: func [][do %my-func.red]
probe [my-macro]
```
```Red
Red [File: %my-func.red]

func [][42]
```
This mumbo-jumbo results in
```
*** Script Error: PARSE - get-word refers to a different series! :s
*** Where: parse
*** Stack: expand-directives expand
```


Comments:
--------------------------------------------------------------------------------

On 2017-07-26T08:00:16Z, dockimbel, commented:
<https://github.com/red/red/issues/2931#issuecomment-317979092>

    That code does not compile here, as macros in compiled code are run by Rebol and not Red, so the `do` fails as it takes a Red file instead of a Rebol one.
    
    I can reproduce the error when running it from the interpreter.

--------------------------------------------------------------------------------

On 2017-07-26T09:48:15Z, dockimbel, commented:
<https://github.com/red/red/issues/2931#issuecomment-318005563>

    The bug is fixed, but there is also an issue with your code example (beyond the compiler vs interpreter difference). You are using `do` which results in creating a `function!` value that your macro is inserting in the source code. While the interpreter can handle such value, the compiler will probably never be able to handle that, as a `function!` value is a run-time construction.

