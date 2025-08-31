
#141: either as a value cannot be used everywhere
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.resolved] [Red/System]
<https://github.com/red/red/issues/141>

Since `either` can be used in value context, the following is e.g. allowed:

```
x + either <cond> [0][1]
```

However, the following, which intuitively should also be allowed, gives an error:

```
either <cond> [0][1] + x
```

This is because after a block, + is interpreted as prefix, and it will generate an error: missing second argument.



Comments:
--------------------------------------------------------------------------------

On 2011-08-01T15:35:34Z, dockimbel, commented:
<https://github.com/red/red/issues/141#issuecomment-1701268>

    The `either` sub-expression needs to be enclosed in parentheses in such case to be accepted by the compiler:
    
    ```
    (either <cond> [0][1]) + x
    ```
    
    Infix operators processing in Red/System follows the same approach as in REBOL. Infix operators can be used as prefix operators too. So they are pre-fetched during code parsing and the compiler needs to decide, based on the surrounding values, if it will treat it as infix or prefix operation. A block! value is a hint to the compiler that prefix mode is intended. Doing a much deeper static analysis of the source code to figure out the real programmer intention is possible, but currently out of the scope of Red/System. Maybe supported in a future version of Red/System.

