
#2870: Preprocessor error while providing `char!` argument to function in execution context
================================================================================
Issue is closed, was reported by 9214 and has 4 comment(s).
[status.deferred]
<https://github.com/red/red/issues/2870>

Following simple macro:
```Red
#do [
    goedelize: func [x [char!]][to integer! x]
]

probe #do keep [goedelize #"A"]
```
Interpreted:
```Red
65
```
Compiled:
```Red
*** Preprocessor Error in #do
*** Script Error : goedelize expected x argument of type: char
*** Where: [#do]
*** Near:  [goedelize #'00000041]
```

In my understanding it has something to do with `#` in `char!` argument, because this one works:
```Red
#do [
    goedelize: func [x [char!]][to integer! x]
]

probe #do keep [goedelize to char! "A"]
```
And this one too:
```Red
#do [
    goedelize: func ['x][to integer! to char! form x]
]

probe #do keep [goedelize A]
```


Comments:
--------------------------------------------------------------------------------

On 2017-07-27T11:04:13Z, dockimbel, commented:
<https://github.com/red/red/issues/2870#issuecomment-318331001>

    That's a limitation of the compiler, as it runs on Rebol2, and Rebol2 not having Unicode support, char values need to be encoded in a special way by the lexer before being compiled. As the compiler macros will run just after lexer stage, it clashes with this intermediary encoding.

--------------------------------------------------------------------------------

On 2021-09-11T12:00:01Z, dockimbel, commented:
<https://github.com/red/red/issues/2870#issuecomment-917395183>

    This issue will not get fixed until the toolchain is rewritten in Red itself.

