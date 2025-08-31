
#393: Callback function can't be determined conditionally
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/393>

```
Red/System []

d: does [
]
x: either yes [:d] [:d]
print-line x
```

-= Red/System Compiler =-
**\* Compilation Error: undefined symbol: x
**\* at line: 6
**\* near: [x
]



Comments:
--------------------------------------------------------------------------------

On 2013-01-24T19:29:17Z, dockimbel, commented:
<https://github.com/red/red/issues/393#issuecomment-12668611>

    In order for your code example to compile after the fix, you need to provide a return declaration/value from `d` or use `print-line :x`.

