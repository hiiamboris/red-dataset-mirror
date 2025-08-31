
#2504: Using `either` as an expression + typecasting is not reliable in Red/System.
================================================================================
Issue is closed, was reported by Oldes and has 2 comment(s).
<https://github.com/red/red/issues/2504>

```
Red/System []
i: declare integer!
i: either true [as integer! 2.0][ 3 ] ;== -2147483648
```


Comments:
--------------------------------------------------------------------------------

On 2017-03-27T15:59:17Z, Oldes, commented:
<https://github.com/red/red/issues/2504#issuecomment-289498916>

    From chat:
    _The issue is that either was never meant to be used as an expression, but statement only. Later, I relaxed it a bit, but the compiler cannot handle it properly anyway, so it will generate wrong code for that (especially on ARM). It's about the registers allocation handling, so it is not something that can be fixed simply, it would need a re-design of the whole code emitter, so that's for R/S 2.0. In the meantime, avoid typecastings on returned value from either._

