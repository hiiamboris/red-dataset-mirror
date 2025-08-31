
#488: Complex compiler crash
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 14 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/488>

```
Red []

f: function [
    /a
    /r
    /b /c /d
][
]

b: []
x: 0

if yes [
    if yes [
        if yes [
            while [yes] [
                if yes [
                    if yes [
                        switch/default x [
                            x [
                                if yes [
                                    if yes [
                                        if yes [
                                            if yes [
                                                if yes [
                                                    if yes [
                                                        prin ""  prin ""  print ""
                                                        poke b  index? next find b x  x - 1
                                                        b/r: f
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ][
                        ]
                    ]
                ]
            ]
        ]
    ]
]
```

Compiling to native code... 

**\* Compilation Error: datatype not allowed 
**\* at line: 126 
**\* near: [none]

Changing any arbitrary thing in this source makes it compile.

Note that the error line is wrong, too.



Comments:
--------------------------------------------------------------------------------

On 2013-07-08T13:42:38Z, dockimbel, commented:
<https://github.com/red/red/issues/488#issuecomment-20605813>

    I can't reproduce it...compiles fine here.

--------------------------------------------------------------------------------

On 2013-07-08T18:24:43Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/488#issuecomment-20625689>

    It's one of those Heisenbugs that changes when the code changes, so the changes in Red may have shifted it, but it will reappear in the same or similar code.

--------------------------------------------------------------------------------

On 2013-07-08T18:32:35Z, dockimbel, commented:
<https://github.com/red/red/issues/488#issuecomment-20626192>

    Does it appear only in 2.7.8 or also in 2.7.6?

--------------------------------------------------------------------------------

On 2013-07-08T18:51:14Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/488#issuecomment-20627421>

    2.7.8; I don't know about 2.7.6. I guess I won't be able to reproduce it anymore, either, now that Red has changed.

--------------------------------------------------------------------------------

On 2013-07-10T00:17:56Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/488#issuecomment-20714488>

    This form now compiles with the current Red, but the bug now appears in my real program in a slightly different form.

--------------------------------------------------------------------------------

On 2013-07-26T20:03:43Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/488#issuecomment-21644877>

    This is another case of R2 2.7.6 versus other versions. It doesn't happen in 2.7.6. Is there a SELECT in the code again?

--------------------------------------------------------------------------------

On 2013-07-26T20:34:35Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/488#issuecomment-21646502>

    Hm, 2.7.6 solves only some constructs, not all.

