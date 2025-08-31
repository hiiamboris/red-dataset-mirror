
#3069: usage of COLLECT/KEEP keywords in compiler's macro doesn't result in error
================================================================================
Issue is closed, was reported by 9214 and has 10 comment(s).
[type.review]
<https://github.com/red/red/issues/3069>

Here's a script:
```Red
Red [Needs: View]

#macro [quote |preprocess| block!] func [s e][
    reduce [parse s/2 [collect some [tag! keep integer!]]]
]

table: |preprocess| [
    <1> DEADBEEFh
    <2> BADFACEh
]

view compose/only [text data (table)]
```

And the problem with it is twofold:
* First, I can't compile it without explicitly wrapping in `do/expand` block. For some time, I wasn't able to interpret it without wrapping either, but now this issue magically resolved.
```Red
isheh@sam ~/dev/red $ ./red-063 -c -t WindowsXP ./scratchpad.red

-=== Red Compiler 0.6.3 ===- 

Compiling /home/isheh/dev/red/scratchpad.red ...
*** Compilation Error: undefined word |preprocess| 
*** in file: /home/isheh/dev/red/scratchpad.red
*** near: [|preprocess| [

```
Okay, so let's wrap it:
```Red
Red [Needs: View]

do/expand [
    #macro [quote |preprocess| block!] func [s e][
        reduce [parse s/2 [collect some [tag! keep integer!]]]
    ]

    table: |preprocess| [
        <1> DEADBEEFh
        <2> BADFACEh
    ]

    view compose/only [text data (table)]
]
```
Good. Now, this is what I see after script interpretation (expected):

![screenshot_2017-10-04_15-38-50](https://user-images.githubusercontent.com/15716466/31172991-38c9214e-a91f-11e7-9f13-4f13fff7d89f.png)

And this window is what I expect to see if I launch compiled executable. However:
```Red
isheh@sam ~/dev/red $ ./red-063 -c -t WindowsXP ./scratchpad.red

-=== Red Compiler 0.6.3 ===- 

Compiling /home/isheh/dev/red/scratchpad.red ...
...compilation time : 1650 ms

Target: WindowsXP 

Compiling to native code...
...compilation time : 45883 ms
...linking time     : 407 ms
...output file size : 903168 bytes
...output file      : /home/isheh/dev/red/scratchpad.exe 


isheh@sam ~/dev/red $ wine scratchpad.exe 
fixme:dwmapi:DwmIsCompositionEnabled 0x33fdc0

*** Runtime Error err:seh:raise_exception Unhandled exception code c0000005 flags 0 addr 0x416246
```
* As you can see, compiled exe is bugged. And the reason seems to be the usage of `collect/keep` keywords inside macro - R2 `parse` implementation doesn't support them. But then I'd expect to get compiler internal error during compilation.

* If I replace pattern-matching macro with named macro like that:
```Red
Red [Needs: View]

do/expand [
    #macro |preprocess|: func [table][
        reduce [parse table [collect some [tag! collect [keep some integer!]]]]
    ]

    table: |preprocess| [
        <1> DEADBEEFh
        <2> BADFACEh
    ]

    view compose/only [text data (table)]
]
```
This is what I get instead:

![screenshot_2017-10-04_16-23-24](https://user-images.githubusercontent.com/15716466/31173291-600f5100-a920-11e7-8692-228ebc914873.png)
But then again I'd expect to see compiler error.


Comments:
--------------------------------------------------------------------------------

On 2017-10-11T08:32:12Z, dockimbel, commented:
<https://github.com/red/red/issues/3069#issuecomment-335733197>

    For the initial problem, `quote` word is defined in Rebol2.7.8, as a function, therefore, `parse` will try to match it when used in the pattern-matching rule for the macro, and always fail (it will try to match a `function!`  value). I don't see how the Red compiler could do anything about it, even redefining words like `quote` or `collect` would hardly help, as the parser will try to match whatever value they are set to.
    
    For the second part of the issue, I cannot reproduce it on Win7, trying compilation in both in development and release modes, it compiles fine and when ran, it outputs the error:
    ```
    *** Script Error: |preprocess| has no value
    *** Where: table
    *** Stack:
    ```
    which is logical as the `#macro` definition is consumed by the compiler, not the interpreter. In order to obtain what you want, you need to avoid the macros to be processed by the compiler. That can be achieved using two different ways:
    
    1. Use `#process` directive to locally disable the compiler preprocessing:
    ```
    #process off
    do/expand [...]
    #process on
    ```
    
    2.  Enclose the code in string instead of a block:
    ```
    do/expand {...}
    ```

--------------------------------------------------------------------------------

On 2017-10-11T09:34:21Z, 9214, commented:
<https://github.com/red/red/issues/3069#issuecomment-335753287>

    @dockimbel so I can force macro to be interpreted (and not compiled) either with `#process ...` or `do/expand {...}` trick?

--------------------------------------------------------------------------------

On 2017-10-11T10:46:21Z, dockimbel, commented:
<https://github.com/red/red/issues/3069#issuecomment-335770859>

    Correct.

--------------------------------------------------------------------------------

On 2017-10-11T11:40:02Z, 9214, commented:
<https://github.com/red/red/issues/3069#issuecomment-335782222>

    😈 [oh yeah](https://www.youtube.com/watch?v=_BRv9wGf5pk)

--------------------------------------------------------------------------------

On 2017-10-11T11:42:15Z, dockimbel, commented:
<https://github.com/red/red/issues/3069#issuecomment-335782739>

    :see_no_evil:

