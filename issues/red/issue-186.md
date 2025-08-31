
#186: lexer - error linecount out by 1
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/186>

When reporting a syntax error the line number quoted appears to be one greater than the line with the error:

``` REBOL

>> lexer/run {Red/System[]
{    a: 1}
*** Syntax Error: Invalid Red data
*** line: 2
*** at: "/System[]^/a: 1"
```



Comments:
--------------------------------------------------------------------------------

On 2011-10-26T22:06:12Z, dockimbel, commented:
<https://github.com/red/red/issues/186#issuecomment-2537206>

    Your Red source code version is lagging behind. This error message does not exist anymore. Compiling this program, I get:
    
    ```
    *** Syntax Error: Invalid Red program
    *** line: 1
    *** at: "/System[]^/    a: 1"
    ```
    
    So both the error message and the error line number are correct.

