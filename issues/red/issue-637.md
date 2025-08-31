
#637: `%` word in a routine body crashes the compiler
================================================================================
Issue is closed, was reported by iArnold and has 12 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/637>

Using the latest build red-02jan14-4733cb2.exe of red on Win 7 this issue appeared not to be fixed:
Red []

remain?: routine [
    m       [integer!]
    n       [integer!]
    return: [integer!]
][ 
    m % n
]

remain-value: remain? 12 5
print [ "remainder of division of over 5 is: " remain-value ]

C:>red -c routine.red

-=== Red Compiler 0.4.1 ===-

Compiling /C/routine.red ...
**\* Syntax Error: Missing matching ]
**\* line: 8
**\* at: {[ ^M
^-m % n^M
]^M
^M
remain-value: remain? 1}



Comments:
--------------------------------------------------------------------------------

On 2014-01-02T11:46:48Z, qtxie, commented:
<https://github.com/red/red/issues/637#issuecomment-31448330>

    @iArnold Yes, the fix for issue #626 only fix name conflict problem. To support `%` need more changes to Red's lexer, convert `%` to `///`, just like Red/System does.

--------------------------------------------------------------------------------

On 2014-01-02T12:15:52Z, qtxie, commented:
<https://github.com/red/red/issues/637#issuecomment-31449465>

    To fully support this feature, the Red's lexer need to support all the stuff that you can use in a Red/System function, like `>>>`, `literal hexadecimal`, `conditional compilation`, etc. 
    @dockimbel Can we reuse the `expand-string` function in Red/System's loader?

--------------------------------------------------------------------------------

On 2014-01-02T12:22:28Z, iArnold, commented:
<https://github.com/red/red/issues/637#issuecomment-31449722>

    If I am not mistaken, I checked this on my Macbook and it seemed to work. Now on this Windows today it is not.
    
    Changing % to /// results in 
    C:>red -c routine.red
    
    -=== Red Compiler 0.4.1 ===-
    
    Compiling /C/routine.red ...
    ...compilation time:     141 ms
    
    Compiling to native code...
    **\* Compilation Error: missing argument
    **\* in file: %/C/cursuspb/routine.red
    **\* in function: exec/remain?
    **\* at line: 1
    **\* near: [n]

--------------------------------------------------------------------------------

On 2014-01-03T07:19:14Z, iArnold, commented:
<https://github.com/red/red/issues/637#issuecomment-31508700>

    These errors also occur on the previous version on the Mac. So the main issue was not fixed.

--------------------------------------------------------------------------------

On 2014-02-13T11:37:38Z, dockimbel, commented:
<https://github.com/red/red/issues/637#issuecomment-34970542>

    @qtxie _Can we reuse the expand-string function in Red/System's loader?_
    
    No we can't, because it would destroy some valid datatypes, like literal file! values or `>>>` used as a word!. The best way is to extend the %lexer.r parsing rules for what we need to support at Red level.
    
    Though, the idea of reusing that Red/System code is interesting for the line numbering feature, but I would prefer we find a different way to remember the line numbers, as the Red/System approach is too complex and leads to lot of small issues.

--------------------------------------------------------------------------------

On 2014-02-13T11:39:19Z, dockimbel, commented:
<https://github.com/red/red/issues/637#issuecomment-34970634>

    Issue fixed by commit [74054402](https://github.com/red/red/commit/74054402cb744b51aa5d6cefa812e1f3927ebdb4).

