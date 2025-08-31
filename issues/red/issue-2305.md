
#2305: macro error: parse rule works differently inside of macro
================================================================================
Issue is closed, was reported by JacobGood1 and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2305>

The following code works fine outside of a macro:
```
parse mold [there] rule: [
    copy code-captured-b4-newline thru [newline | "]"] (load code-captured-b4-newline) rule
    | end
]

when placed in a macro like so:

expand-directives [
    #macro ~>: func [data code] [
        parse mold code rule: [  
            copy code-captured-b4-newline thru [newline | "]"] (load code-captured-b4-newline) rule
            | end
        ] 
    ]
    ~> hi [there]
]
```
The following error is produced:
*** Script Error: PARSE - matching by datatype not supported for any-string! input
*** Where: parse

This error does not exist when parsing outside of the macro.
The macro uses load, could this be the issue?



Comments:
--------------------------------------------------------------------------------

On 2016-11-08T12:20:30Z, dockimbel, commented:
<https://github.com/red/red/issues/2305#issuecomment-259122568>

    The bug is caused by an unbalance Parse rules stack saving/restoring.

