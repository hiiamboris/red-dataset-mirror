
#1136: Interpreter returns error about missing paren instead of bad lit-word
================================================================================
Issue is closed, was reported by x8x and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1136>

In the following code there is no missing paren but a bad lit-word:

``` rebol
red>> a: func [][set 'b: 1]
*** Syntax error: missing ] at [][set'b:1]
*** Where: do
```

also notice that in some cases like above error report trims all spaces from code



