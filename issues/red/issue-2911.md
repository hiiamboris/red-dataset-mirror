
#2911: `if`/`case` breaks compilation if inside one of its conditions used function defined in another context
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2911>

```Red
ctx: context [
    ctx*: context [
        ok?: func [x][yes]
    ]

    foo: func [thing][
        case [
            not ctx*/ok? thing [return "UNACCEPTABLE!"]
        ]
    ]
]
```
Results in:
```Red
...using libRedRT built on 22-Jul-2017/7:13:40+5:00
*** Compilation Error: CASE is missing a value
*** in file: <snip>
*** near: []
``` 
Alternatively:
```Red
ctx: context [
    ctx*: context [
        ok?: func [x][yes]
    ]

    foo: func [thing][
        if not ctx*/ok? thing [return "UNNACEPTABLE!"]
    ]
]
```
```Red
...using libRedRT built on 22-Jul-2017/7:13:40+5:00
*** Compilation Error: expected a block for IF-BODY instead of word! value
*** in file: <snip>
*** near: [thing [return "UNNACEPTABLE!"]]
```

With `ok?` moved out of inner context everything works fine. Moreover, If I'll redefine `ok?` either as a constant value (`yes`) or as function w/o arguments (i.e. `does [yes]`), it will work too.


Comments:
--------------------------------------------------------------------------------

On 2017-07-26T11:50:02Z, dockimbel, commented:
<https://github.com/red/red/issues/2911#issuecomment-318030432>

    Fixed by commit [f9d46b48](https://github.com/red/red/commit/ce7dc0b49bf7e71b16cb54f471e0af58f9d46b48).

