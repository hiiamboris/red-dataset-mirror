
#1144: Problem with evaluation's order in compiled script
================================================================================
Issue is open, was reported by x8x and has 2 comment(s).
[status.deferred] [type.review]
<https://github.com/red/red/issues/1144>

Interpreter happily returns `"12"` for following example:

``` rebol
a: function [][
  op: :form
  probe append op 1 2
]
a
```

While the compiled version:

``` rebol
Red []

a: function [][
  op: :form
  probe append op 1 2
]
a
```

returns:

```
*** Script error: append does not allow action for its series argument
*** Where: append
*** Stack: a probe append
```



Comments:
--------------------------------------------------------------------------------

On 2017-03-02T17:28:22Z, dockimbel, commented:
<https://github.com/red/red/issues/1144#issuecomment-283720966>

    The compiler cannot currently guess properly that `op` is a function call in `append op 1 2`. This will only be possible when the work on the dynamic stack branch will be completed.

