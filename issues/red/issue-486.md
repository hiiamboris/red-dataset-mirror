
#486: PRINT evaluates path double
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/486>

```
Red []

b: [x]
print b/1
```

**\* Error: word has no value!
unset

Not only the path is evaluated, but also the word it yields.



Comments:
--------------------------------------------------------------------------------

On 2013-06-11T21:52:33Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/486#issuecomment-19294990>

    Both the compiler and the interpreter do this wrong.

