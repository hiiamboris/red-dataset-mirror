
#98: Curious error on redefinition of comment
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/98>

I compiled

```
comment: 5 printf comment
```

and got this: 

```
*** Compilation Error: undefined symbol: comment
```

I would submit that comment is NOT undefined.



Comments:
--------------------------------------------------------------------------------

On 2011-06-15T16:01:22Z, meijeru, commented:
<https://github.com/red/red/issues/98#issuecomment-1374707>

    This is because in REBOL `'comment = first [comment:]`, in other words, the test (which is in similar form in `compiler.r`) ignores the difference word/set-word.

--------------------------------------------------------------------------------

On 2011-06-16T16:27:16Z, dockimbel, commented:
<https://github.com/red/red/issues/98#issuecomment-1382343>

    Now a compilation error is raised on attempt to redefine 'comment word.
    
    Tested OK.

