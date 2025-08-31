
#575: REDUCE fails to evaluate function reference
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
<https://github.com/red/red/issues/575>

```
Red []

do*: :do
probe reduce [do* ""]
```

[make native! [[{Evaluates a value, returning the last evaluation result.} value [any-type!]]] ""]

This seems to be a regression since fixing #556.



Comments:
--------------------------------------------------------------------------------

On 2013-11-24T11:04:27Z, dockimbel, commented:
<https://github.com/red/red/issues/575#issuecomment-29153103>

    This is not related to REDUCE. The current Red compiler is just not smart enough to handle language keywords redefinition (DO is one of them). You can exhibit the same odd result with just `probe do* ""`.
    
    I expect that the compiler will be able to handle such construction once objects will be compilable, as they will bring the static analysis capabilities to the compiler required to handle also such cases.

--------------------------------------------------------------------------------

On 2013-11-24T17:38:40Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/575#issuecomment-29160791>

    I thought REDUCE was handled by the interpreter? The point is that this worked before #556. I'm using it in my overloaded DO and my consoles, which are now broken.

--------------------------------------------------------------------------------

On 2013-11-24T17:43:45Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/575#issuecomment-29160909>

    Never mind, I suddenly realised why there was an excess set in my code that I removed. It was to force the block passed to REDUCE to be dynamic.

