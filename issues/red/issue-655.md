
#655: Lexer chokes on #[none!]
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/655>

This is because #[none] is recognized by the parse rules BEFORE #[none!]



Comments:
--------------------------------------------------------------------------------

On 2014-01-30T20:13:18Z, iArnold, commented:
<https://github.com/red/red/issues/655#issuecomment-33728049>

    In lexer.r
    
    ```
        escaped-rule: [
            "#[" any-ws [
                "none"    (value: none)
                | "true"  (value: true)
                | "false" (value: false)
                | s: [
                    "none!" | "logic!" | "block!" | "integer!" | "word!" 
                    | "set-word!" | "get-word!" | "lit-word!" | "refinement!"
                    | "binary!" | "string!" | "char!" | "bitset!" | "path!"
                    | "set-path!" | "lit-path!" | "native!" | "action!"
                    | "issue!" | "paren!" | "function!"
                ] e: (value: get to word! copy/part s e)
            ]  any-ws #"]"
        ]
    ```
    
    should be changed to
    
    ```
        escaped-rule: [
            "#[" any-ws [
                 "true"  (value: true)
                | "false" (value: false)
                | s: [
                    "none!" | "logic!" | "block!" | "integer!" | "word!" 
                    | "set-word!" | "get-word!" | "lit-word!" | "refinement!"
                    | "binary!" | "string!" | "char!" | "bitset!" | "path!"
                    | "set-path!" | "lit-path!" | "native!" | "action!"
                    | "issue!" | "paren!" | "function!"
                ] e: (value: get to word! copy/part s e)
                |"none"       (value: none)
            ]  any-ws #"]"
        ]
    ```
    
     and this should fix this.

--------------------------------------------------------------------------------

On 2014-01-30T20:14:43Z, iArnold, commented:
<https://github.com/red/red/issues/655#issuecomment-33728178>

    So glad that all of the carefully outlined whitespaces were removed by github :P 

--------------------------------------------------------------------------------

On 2014-01-31T04:43:07Z, earl, commented:
<https://github.com/red/red/issues/655#issuecomment-33761426>

    @iArnold You may want to read Github's guide for [Mastering Markdown](http://guides.github.com/overviews/mastering-markdown/). That should help with your formatting desires.

--------------------------------------------------------------------------------

On 2014-01-31T09:15:17Z, iArnold, commented:
<https://github.com/red/red/issues/655#issuecomment-33771176>

    Hahaha I think I accidentally coded an empty link, and it depends on the browser I use to view these pages too. Thanks for the tip Andreas!

--------------------------------------------------------------------------------

On 2014-02-08T10:24:58Z, dockimbel, commented:
<https://github.com/red/red/issues/655#issuecomment-34540445>

    Good catch!

