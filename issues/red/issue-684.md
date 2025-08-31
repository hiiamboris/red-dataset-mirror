
#684: Unmatched bracket error with correct number of brackets
================================================================================
Issue is closed, was reported by kealist and has 6 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/684>

I've reduced this to the most minimal example I can, but getting a strange unmatched bracket error with the following code:

```
Red []

#system-global [
    mbt-parent: declare pointer! [ byte! ] 
    bot-speed mbt-parent 4.0 8.0
]
```

Tried with the current master as well as with encapped stable binaries with the same result:

```
-=== Red Compiler 0.4.1 ===-

Compiling /C/Users/kealist/Documents/GitHub/ClassNET/BotServer/botserver.red ...
*** Syntax Error: Missing matching ]
*** line: 14
*** at: {[^M
^M
^-mbt-parent: declare pointer! [byte}
```

Seem the lexer is corrupting at some point?  the string should not end there.



Comments:
--------------------------------------------------------------------------------

On 2014-02-16T18:15:55Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/684#issuecomment-35205563>

    Red doesn't have floating point numbers and can't parse them.

--------------------------------------------------------------------------------

On 2014-02-17T03:58:43Z, kealist, commented:
<https://github.com/red/red/issues/684#issuecomment-35227297>

    Thank you for the explanation.  Not sure what response Doc will have about this as an unimplemented feature, but with the encapped red, this is a unhandled hard crash to the Rebol/Pro window (This is an example of what I mean by hard crash: http://imgur.com/Bgcd9KQ)

--------------------------------------------------------------------------------

On 2014-04-20T15:56:26Z, dockimbel, commented:
<https://github.com/red/red/issues/684#issuecomment-40897869>

    Right, Red lexer can't yet parse floating point number from Red/System parts. Once floats will be supported by Red lexer, such code would compile with no error. The curious error you get right now is caused by the Red lexer not knowing how to parse floats.

