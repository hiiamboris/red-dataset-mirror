
#2493: compile-time and run-time lexer differ in acceptance of email values
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/2493>

`lexer.red` accepts email values starting with `@`, whereas `lexer.r` does not.

In order to free `@` as an initial character for values of a new type, the compile-time rule should probably win out

BTW both lexers accept email values ending in `@`, i.e. with an empty "host"


Comments:
--------------------------------------------------------------------------------

On 2019-08-20T13:59:45Z, dockimbel, commented:
<https://github.com/red/red/issues/2493#issuecomment-523028270>

    > BTW both lexers accept email values ending in @, i.e. with an empty "host"
    
    This is done on purpose to support such lexical form for dialecting without having to create a new type.
    
    For the starting `@`, the new `ref!` type will use it, so those lexer rules will be changed anyway.

