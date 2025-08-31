
#671: Runtime error provoked by recurring function
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/671>

The example program is not very useful (it recurs 100 times, using two functions), but it managed to provoke an access violation. A version without the internal function g works alright.

```
f: func [i [integer!] /local g][
    g: func[][either i = 0 [1][f i - 1]]
    g
]
```

print f 100

**\* Runtime Error 1: access violation
**\* at: 0041A46Ah



Comments:
--------------------------------------------------------------------------------

On 2014-02-12T12:29:46Z, dockimbel, commented:
<https://github.com/red/red/issues/671#issuecomment-34864042>

    The current Red compiler is not yet able to generate the code for runtime function creation. Support for it is not scheduled, but will be added before 1.0.
    
    Notice that the interpreter will handle it just fine though.

