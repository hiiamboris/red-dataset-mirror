
#649: Single character in #" " may not be control character, but string may contain control characters
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/649>

E.g. the current lexer refuses a tab character (U+0009) enclosed in #" ", but accepts it when enclosed in " ".

The interdiction for single characters is U+0000 - U+001F, but this ignores the control characters U+0080 - U+009F. The two sets of control characters are both forbidden in symbols (i.e. words etc., refinements and issues).



Comments:
--------------------------------------------------------------------------------

On 2014-02-07T15:51:25Z, dockimbel, commented:
<https://github.com/red/red/issues/649#issuecomment-34454373>

    There are two lexers (compiler's lexer and runtime lexer), which one are your referring to?
    
    If you're referring to the hexadecimal escaped encoding for characters, there are not implemented in the current runtime lexer, and will not be until the full rewrite of the runtime lexer.

--------------------------------------------------------------------------------

On 2014-02-07T16:07:24Z, meijeru, commented:
<https://github.com/red/red/issues/649#issuecomment-34457913>

    This is the case with the compiler lexer only. I am not referring to the hexadecimal excapes, but to real tabs, input from the keyboard. The compiler lexer says:
    
    > "C:\Program Files\Red\red.exe" -c -v 1 --red-only E:\Projects\Red\programs\test.red
    
    -=== Red Compiler 0.4.1 ===- 
    
    Compiling /E/Projects/Red/programs/test.red ...
    **\* Syntax Error: Invalid char! value
    **\* line: 15
    **\* at: {#"^-"^M
    }

