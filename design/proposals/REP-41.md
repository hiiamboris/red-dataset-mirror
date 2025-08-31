
#41: WISH: computed block should be allowed for all control constructs
================================================================================
Issue is open, was reported by meijeru and has 0 comment(s).
<https://github.com/red/REP/issues/41>

I previously had a wish to abolish the requirement that the block argument to `switch` should be a _literal_  block (#2418). This was granted at the time, with the remark: "_The fallback to the interpreter for (non-statically analyzable) switch (and several other control flow function) has not been implemented yet in the compiler. It is supposed to be implemented at a later stage, when we can figure out the most efficient way to support it. Though, for now, I will just add a simple fallback to the interpreter in the compiler code._"
This is a reminder that this most efficient implementation is yet to be made, for the following control flow functions: `if unless either case switch forever while until loop repeat foreach forall remove-each`.
All of these (except `switch` as noted) give the following error message:
```
*** Compilation Error: expected a block for <...>-BODY instead of <type> value 
```
To be noted that `forever` speaks about a `WHILE-BODY` which suggests that `forever` is "simulated" by
`while [true]`.


