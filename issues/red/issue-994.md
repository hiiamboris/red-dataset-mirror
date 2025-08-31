
#994: Complex compiler crash
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 12 comment(s).
[status.deferred] [type.bug]
<https://github.com/red/red/issues/994>

```
Red []

f: func [
    s
][
    yes
]

does [
    if yes [
        if yes [
            if yes [
                if yes [
                    if yes [
                        while [yes] [
                            case [
                                yes [
                                ]
                                yes [
                                ]
                                yes
                                    yes
                                yes [
                                ]
                                (
                                )[
                                ]
                                any [
                                ][
                                ]
                                yes
                                    if yes [
                                        x: yes

                                        append append
                                        append append
                                        append
                                        append clear ""
                                            ""
                                            case [
                                                "" = ""
                                                    ""
                                                f "" [
                                                    x: yes
                                                    ""
                                                ]
                                                yes ""
                                            ]
                                            ""
                                            f ""
                                            "" ""
                                    ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
    ]
]
```

Compiling to native code...
**\* Red/System Compiler Internal Error: Script Error : Cannot use path on none! value 
**\* Where: branch 
**\* Near:  [ptr/1: ptr/1 + size]



Comments:
--------------------------------------------------------------------------------

On 2014-11-25T07:30:11Z, qtxie, commented:
<https://github.com/red/red/issues/994#issuecomment-64320115>

    Looks like the red compiler could compile some illegal `case` expression without throw an error.
    This one will cause compliation error:
    
    ```
    Red []
    
    case [
        yes
        yes []
    ]
    ```
    
    But this one will not:
    
    ```
    Red []
    
    case [
        yes
        yes
        yes []
    ]
    ```

--------------------------------------------------------------------------------

On 2014-11-25T08:01:30Z, dockimbel, commented:
<https://github.com/red/red/issues/994#issuecomment-64322531>

    @qtxie That is because the compiler processes the CASE body content by pairing expressions: one conditional expression, one body expression. So if the compiler identifies an even number of expressions, it's fine, if an odd number is found, then it cannot make the last pair and will error out.
    
    About the compiler error above, the issue is the Rebol2 memory corruption occuring with very deep expressions (probably an internal Rebol2 stack issue when the stack is a filled or almost filled). Some elements in the compiler toolchain code might help trigger this memory corruption issue, like using the buggy hash! type. I will investigate again to see if it's possible to limit the effects of such internal issues, but as said before in another ticket, the current compiler running on Rebol2 cannot support arbitrary deep expressions. We can find ways to push away the threshold, but cannot fix it, until we either move the toolchain to Rebol3 or reach selfhost Red 2.0. 

--------------------------------------------------------------------------------

On 2015-03-11T16:43:23Z, dockimbel, commented:
<https://github.com/red/red/issues/994#issuecomment-78302719>

    For the record, Carl has fixed the GC bug that was causing that issue in Rebol2, but we are still waiting for the release of that newer version.

--------------------------------------------------------------------------------

On 2020-03-21T17:30:26Z, 9214, commented:
<https://github.com/red/red/issues/994#issuecomment-602076295>

    > we are still waiting for the release of that newer version
    
    5 years (and 10 days) as of now. @dockimbel should we close this and perhaps collect all known Rebol2-caused issues in a reference page?
    
    ---
    
    https://github.com/red/red/issues/1925 https://github.com/red/red/issues/2102 https://github.com/red/red/issues/2870 https://github.com/red/red/issues/3408 https://github.com/red/red/issues/3637 https://github.com/red/red/issues/3956

--------------------------------------------------------------------------------

On 2020-03-22T01:46:51Z, greggirwin, commented:
<https://github.com/red/red/issues/994#issuecomment-602134503>

    I'm all for creating a page that notes compiler limitations. Those are important, even at this stage. And if the interpreter works, we can tell people to use encap mode, so the effect is minimal. Whether to close tickets is a harder question.

--------------------------------------------------------------------------------

On 2021-09-18T16:35:37Z, dockimbel, commented:
<https://github.com/red/red/issues/994#issuecomment-922336885>

    I'm closing this ticket, as there's nothing we can do until we move away from Rebol usage in the toolchain.

