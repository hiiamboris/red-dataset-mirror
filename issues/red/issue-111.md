
#111: Another error message question
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/111>

I forgot to type `func`

```
f: [a]
*** Compiler Internal Error: Script Error : Invalid path value: a
*** Where: get-return-type
*** Near:  [type: select functions/:name/4 return-def
```

I would have expected "wrong datatype", namely block! but apparently block! is used internally.,,,



Comments:
--------------------------------------------------------------------------------

On 2011-06-26T16:21:41Z, dockimbel, commented:
<https://github.com/red/red/issues/111#issuecomment-1441710>

    Goog catch! The error message is now `wrong datatype!` and the block! entry in the expression dispatcher, has been removed (leftover of older compiler versions).

