
#179: Characters not allowed in Red words: some others suggested
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/179>

The current lexer forbids the following characters: `/ , ' [ ] ( ) { } " # % $ @ :` . I suggest that the following should at least be added: `; < > ^` and possibly also back-slash `\` which is not allowed in Red/System, for compatibility. Admittedly, `;` will pop-up automatically when the treatment of end-of-line comments is added.

Another question is the treatment of special words that function as operators: `<= < <> < >= >> > + - * // /` These need probably to be screened separately, although (by analogy with REBOL) they have the datatype `word!`.



Comments:
--------------------------------------------------------------------------------

On 2011-10-12T11:01:22Z, dockimbel, commented:
<https://github.com/red/red/issues/179#issuecomment-2377972>

    Agreed for `;^\`. For `<` and `>`, I would like to allow them in words (for example to make "arrow-like" words: `->`, `<-`). This means that inputs like `a<b>c` would be parsed as word! which should be fine as long as typos are caught at compile-time.
    
    For math and comparison operators, I am not sure for the exact reasons why they are treated as keyword in REBOL. I guess it is for catching user typos more easily and maybe allowing some faster pre-processing on infix expressions. In Red, those cases will be processed at compile-time (rather than run-time like in REBOL), so I think that the lexer can treat them just as simple words.

--------------------------------------------------------------------------------

On 2011-10-12T11:05:39Z, meijeru, commented:
<https://github.com/red/red/issues/179#issuecomment-2377994>

    I agree that the lexer should treat them as type `word!` but currently e.g. a single `/` is not recognized -- that is what I mean by treated separately.

--------------------------------------------------------------------------------

On 2011-10-12T11:56:38Z, dockimbel, commented:
<https://github.com/red/red/issues/179#issuecomment-2378362>

    Good point, `/` and `//` will need a special rule to parse them as valid words.

