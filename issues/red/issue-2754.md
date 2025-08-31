
#2754: Unknown directive compiler error is not thrown in .red file
================================================================================
Issue is closed, was reported by Oldes and has 16 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/2754>

Using misspelled code like:
```
#sustem [
	test: func[][print-line "test"]
]
```
throws error in Red/System file:
```
Compiling to native code...
*** Compilation Error: unknown directive sustem 
```
but not if used in `.red` file, which may lead to hard to find errors and also crash if used with routines.


Comments:
--------------------------------------------------------------------------------

On 2017-06-05T12:35:44Z, dockimbel, commented:
<https://github.com/red/red/issues/2754#issuecomment-306176909>

    Could you please elaborate more on the *but not if used in .red file* part? An example would help.
    Also please provide code to reproduce *crash if used with routines.*

--------------------------------------------------------------------------------

On 2017-06-05T12:42:06Z, Oldes, commented:
<https://github.com/red/red/issues/2754#issuecomment-306177991>

    It is easy... when above code is used in Red source file.. it compiles without getting compiler error as expected. When used in Red/System, you get error showing you that you are using unknown directive as expected.
    
    I guess that reason of it would be that Red code can be compiled and also interpreted. It makes in the interpreter to have any issue type, but compiler could give you at least warning.
    

--------------------------------------------------------------------------------

On 2017-06-05T12:44:25Z, dockimbel, commented:
<https://github.com/red/red/issues/2754#issuecomment-306178421>

    *it compiles without getting compiler error as expected.* Yes, it compiles because it is valid Red code. Did you forget that Red has an `issue!` datatype?

--------------------------------------------------------------------------------

On 2017-06-05T13:18:34Z, Oldes, commented:
<https://github.com/red/red/issues/2754#issuecomment-306185136>

    As there are special `issue!` words used by compiler, it does not make sense to have other to be just like data values (at least in code which you compile). But as you wish.
    
    I'm now not able to provide crash, but I had this real situation, when I used `#sustem` instead of `#system`, which silently passed the compilation. It was a few days ago.

--------------------------------------------------------------------------------

On 2017-06-05T13:26:41Z, dockimbel, commented:
<https://github.com/red/red/issues/2754#issuecomment-306186864>

    Some issue! values are processed by the Red's preprocessor (so both in compiled and interpreted code), the same way they are processed by Rebol's SDK preprocessor. In case of Red, you can disable such processing locally, when you want to use them as data in your code, so I really don't see the problem with such approach.

--------------------------------------------------------------------------------

On 2017-06-05T13:48:08Z, Oldes, commented:
<https://github.com/red/red/issues/2754#issuecomment-306191696>

    I have nothing against this approach. I'm just missing a compiler's safety warning or error, if I use misspelled preprocessor word and I don't disabled the processing locally. But you can close it if you think we don't need it... but my user experience is, that the single typo forced me to look, what is going on without any visible reason.

--------------------------------------------------------------------------------

On 2017-06-05T13:48:48Z, Oldes, commented:
<https://github.com/red/red/issues/2754#issuecomment-306191855>

    btw... I don't know how to disable preprocessing ;-) But I don't need it and I think that hardly will ever need it in compiled code.

--------------------------------------------------------------------------------

On 2017-06-19T06:56:58Z, dockimbel, commented:
<https://github.com/red/red/issues/2754#issuecomment-309354651>

    I think you are missing the main point anyway, issue! values are valid values in Red, like their are in Rebol, regardless of how the code is run (compiled or interpreted). It's not possible to distinguish between a typo in an issue! that could be used by the preprocessor and a valid issue! value. In R/S, there's no issue! datatype in the language, therefore all issue! values are used by preprocessor, so it can easily detect invalid ones.

