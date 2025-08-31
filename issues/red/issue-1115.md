
#1115: Console stuck in a block! definition
================================================================================
Issue is closed, was reported by x8x and has 12 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1115>

``` rebol
red>> ["^"
[    ]
[    ]
[    ]
[    
```

neither esc nor `]` break out of multiline



Comments:
--------------------------------------------------------------------------------

On 2015-04-25T23:22:26Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1115#issuecomment-96293105>

    This is due to you not closing the string. ^ is used as an "escape" character in Red. The ^ character needs to be escaped inside a string.
    
    ```
    red>> ["^""
    [    ]
    == [{"}]
    red>> ["^^"
    [    ]
    == ["^^"]
    ```
    
    That said strings contained within "" are single line strings and there could be a case for the console automatically closing an unclosed string automatically at the end of a line (if it is possible). 

--------------------------------------------------------------------------------

On 2015-04-26T00:52:01Z, x8x, commented:
<https://github.com/red/red/issues/1115#issuecomment-96299508>

    Still, esc or `]` should work or I have no choice but to restart the console.
    This is properly reported as error:
    
    ``` rebol
    red>>  "^"
    *** Syntax Error: invalid Red value at: "^"
    ```

--------------------------------------------------------------------------------

On 2015-04-26T01:24:17Z, qtxie, commented:
<https://github.com/red/red/issues/1115#issuecomment-96300242>

    On Windows, it works fine.

--------------------------------------------------------------------------------

On 2015-04-26T01:40:48Z, x8x, commented:
<https://github.com/red/red/issues/1115#issuecomment-96304562>

    osx here

--------------------------------------------------------------------------------

On 2015-04-27T11:11:39Z, dockimbel, commented:
<https://github.com/red/red/issues/1115#issuecomment-96611336>

    New fix for this problem, now ESC key will let you go back to prompt.

--------------------------------------------------------------------------------

On 2015-04-30T20:10:15Z, x8x, commented:
<https://github.com/red/red/issues/1115#issuecomment-97952730>

    ## Console
    
    Thought, `ESC` key will let me go back to prompt, in the future this should have a proper fix.
    
    Here the string! value is properly reported as invalid:
    
    ``` rebol
    red>> "^"
    *** Syntax error: invalid value at "^"
    
    *** Where: do
    ```
    
    Here the interpreter should report same above error and NOT enter multi-line mode, as unterminated string! value can not be set in multi-line mode when using quotation marks.
    
    ``` rebol
    red>> ["^"]
    [    ]
    [    
    (escape)
    ```
    
    Same example in rebol2 returns proper error:
    
    ``` rebol
    rebol>>  ["^"]
    ** Syntax Error: Missing " at ["^"]
    ```
    
    Not sure about this case:
    
    ``` rebol
    red>> print [{^
    [    /}]
    
    /
    red>> 
    ```
    
    ## Compiler
    
    Compiling below code:
    
    ``` rebol
    Red []
    print ["^"]
    ```
    
    will report:
    
    ```
    Compiling /red/test.red ...
    *** Syntax Error: Missing matching ]
    *** line: 2
    *** at: {["^^"]
    }
    ```
    
    Compiling:
    
    ``` rebol
    Red []
    [{^{]
    ```
    
    will report:
    
    ```
    Compiling /Users/alpha/.red/test.red ...
    *** Syntax Error: Missing matching ]
    *** line: 3
    *** at: "[{^^{]^/"
    ```
    
    Both above compiled examples should return error about bad string! value instead of missing matching square brace.
    
    **NB:** These are corner cases, so very low priority should be assigned, noted for correctness.

