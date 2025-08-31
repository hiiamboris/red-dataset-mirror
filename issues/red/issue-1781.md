
#1781: REPL: commented braces get still considered
================================================================================
Issue is closed, was reported by x8x and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1781>

Let's paste this valid code in the REPL:

``` rebol
[
    1
    ;[
    2
    ;]
]
```

here is the output:

``` rebol
  [
[     1
[     ;[
[     2
[     ;]
*** Script error: get does not allow integer! for its word argument
*** Where: get
  ]
```

pretty annoying when trying code 8-)



Comments:
--------------------------------------------------------------------------------

On 2016-04-04T14:12:17Z, ghost, commented:
<https://github.com/red/red/issues/1781#issuecomment-205312221>

    @x8x https://github.com/red/red/issues/1715

