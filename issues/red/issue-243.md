
#243: WITH gives #enum values from CONTEXT precedence over closer declarations
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/243>

```
c: context [
    #enum e! [x]
]

with c [
    f: function [
        p [float!]
    ][
    ]

    x: 0.0
    f x
]
```

**\* Compilation Error: argument type mismatch on calling: f 
**\* expected: [float!], found: [integer!] 
**\* in file: %/users/administrator/Red/Red-SQLite/examples/test.reds 
**\* at line: 14 
**\* near: [0]



Comments:
--------------------------------------------------------------------------------

On 2012-08-24T20:06:35Z, dockimbel, commented:
<https://github.com/red/red/issues/243#issuecomment-8013305>

    This is the intended behavior, `with` automatically prefixes all symbols in the body block that are defined in the mentioned contexts. There is no "close declaration" concept in Red/System, in this example, the source code in `with` body block is global code, but with `c` context precedence. If you need to reference the `x` from global context, you need to use `system/words/x` or, avoid using `with` in such cases.

--------------------------------------------------------------------------------

On 2012-08-24T20:45:38Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/243#issuecomment-8014337>

    I have to say this is quite surprising, but I follow your reasoning. In that case, I think the real error is that the compiler accepted the assignment
    
      x: 0.0
    
    It should detect it as an attempt to change the type of x. That would have pointed me in the right direction.

--------------------------------------------------------------------------------

On 2012-08-24T20:47:22Z, dockimbel, commented:
<https://github.com/red/red/issues/243#issuecomment-8014384>

    Good point, this assignment should have thrown an error...I am looking into it.

