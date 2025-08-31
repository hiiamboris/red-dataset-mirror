
#77: Of predefined functions, only size? merits keyword treatment
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/77>

I observed that `size?`  and `not` are both predefined (`inline`) functions but of them, `not` can be freely redefined.

```
not: 5 print form not
```

The binary operators can in principle be redefined, but if this does not founder on the REBOL lexical scan, it does so on the fact that operator analysis is apparently hard coded (looked up in the fnction table immediately, instead of the variable table). It would perhaps be better to include them in the list of words whose redefinition gives a compilation error early in the game.

```
and: 5 print form and
*** Compilation Error: argument type mismatch on calling: print
*** expected: [c-string!], found: [integer!]
*** in file: %tests/mytest.reds
*** at:  [and form]
```



Comments:
--------------------------------------------------------------------------------

On 2011-06-06T18:59:28Z, dockimbel, commented:
<https://github.com/red/red/issues/77#issuecomment-1311073>

    These rules are changing, in the next specification draft, the binary operators and all functions built in the compiler will be protected from redefinition. I should add the corresponding checks in the compiler by tomorrow.

--------------------------------------------------------------------------------

On 2011-06-07T21:23:41Z, dockimbel, commented:
<https://github.com/red/red/issues/77#issuecomment-1322691>

    Tested OK. A compilation error is returned in both redefinition cases from above code (`not: 5 and and: 5`)

