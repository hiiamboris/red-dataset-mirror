
#1774: Wrong error when interpreting code which tries to access an invalid path (in an object).
================================================================================
Issue is closed, was reported by ghost and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1774>

`test.red`

```
Red []
probe system/options/        ; or print system/options/
```

`red test.red` gives -
`*** Error: not a Red program!`

vs in Rebol2 -
`test.r`

```
Rebol []

probe system/options/
halt
```

`r2v test.r` gives -

```
** Syntax Error: Invalid path -- options/
** Near: (line 3) probe system/options/
```

P.S. - Typing the code in the red console gives the correct error.



