
#2157: Dividing -2147483648 by -1 crashes the runtime
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/2157>

Dividing -2147483648 by -1 crashes the runtime instead of throwing an integer overflow script error.

```
red>> error? try [-2147483648 / -1]

*** Runtime Error 13: integer divide by zero
*** at: 00025371h
```

There is a test of this in integer-test.red, it is currently commented out.



Comments:
--------------------------------------------------------------------------------

On 2016-08-06T01:15:02Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2157#issuecomment-237997725>

    This bug can also be seen with `remainder`:
    
    ```
    red>> -2147483648 % -1
    
    *** Runtime Error 13: integer divide by zero
    *** at: 00025323h
    mbp:red peter$ ./test-console
    --== Red 0.6.1 ==-- 
    Type HELP for starting information. 
    
    red>> remainder -2147483648 -1
    
    *** Runtime Error 13: integer divide by zero
    *** at: 00025323h
    ```

--------------------------------------------------------------------------------

On 2016-08-06T05:07:33Z, dockimbel, commented:
<https://github.com/red/red/issues/2157#issuecomment-238006303>

    Those cases are now generating a trappable error. In Red/System, it will produce an "integer overflow" runtime error.

