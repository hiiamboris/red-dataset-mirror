
#651: Lexer does not accept integer directly followed by block, paren etc. 
================================================================================
Issue is closed, was reported by meijeru and has 14 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/651>

While `[]1` is correctly scanned by the compiler/lexer, `1[]` is not. The interpreter takes a broader view and allows both.



Comments:
--------------------------------------------------------------------------------

On 2014-01-30T15:44:08Z, iArnold, commented:
<https://github.com/red/red/issues/651#issuecomment-33699640>

    My best guess is that this is caused by line 64 of lexer.r
    That line does not state "[" to be one of the end-of-integer characters.
    I changed this line into 
        integer-end:    charset {^{^}"[]();}
    After which my regressiontest do %run-all.r succeeded.
    Do you have example code for me to test? (I don't see what you were trying to do here exactly)
    
    Imho integer-end I expect to be all chars except the digits and "'" (single quote). 
    
    So perhaps it should become:
    ; all characters except digits and the single quote.
        integer-end: charset [not "0123456789'"]

--------------------------------------------------------------------------------

On 2014-01-30T15:48:07Z, iArnold, commented:
<https://github.com/red/red/issues/651#issuecomment-33700107>

    After the double-quote in the first integer-end definition I had an additional "[]()" 
    ( I'l write it out before it disappears again: block-open block-close paren-open paren-close)

--------------------------------------------------------------------------------

On 2014-01-30T15:49:17Z, iArnold, commented:
<https://github.com/red/red/issues/651#issuecomment-33700230>

    It did disappear again, the great github magic show.

--------------------------------------------------------------------------------

On 2014-01-31T08:49:05Z, meijeru, commented:
<https://github.com/red/red/issues/651#issuecomment-33769813>

    I do not have a specific example, it is just that traditionally (i.e. in R2 and R3) [ and ] have a "separating effect". Such text would occur in a lookup table, e.g. a block like [1 [a] 2 [b]] where for compactness one would leave out the spaces.

--------------------------------------------------------------------------------

On 2014-01-31T09:48:44Z, iArnold, commented:
<https://github.com/red/red/issues/651#issuecomment-33773090>

    Thank you Rudolf, I will try to put something together, crashing the old situation and working correct in my changed version.
    The magic show explained: I coded an empty link in this markdown document.

--------------------------------------------------------------------------------

On 2014-01-31T14:46:27Z, iArnold, commented:
<https://github.com/red/red/issues/651#issuecomment-33799334>

    Created an ugly testscript:
    Red []
    
    print "Is this a problem?"
    out: [1[a]2[b]] 
    fi: out/1
    print fi
    print "No problem here"
    
    Tested on the 'original source"
    
    > > do/args %red.r "-c %../script/blo.red"
    
    -=== Red Compiler 0.4.1 ===-
    
    Compiling /C/..../project/script/blo.red ...
    **\* Syntax Error: Missing matching ]
    **\* line: 4
    **\* at: {[1[a]2[b]] ^M
    fi: out/1^M
    print fi^M
    print }
    
    On the changed sources:
    C:....\project\redma>blo.exe
    Is this a problem?
    1
    No problem here
    
    C:...\project\redma>
    
    My say is this makes a difference.

--------------------------------------------------------------------------------

On 2014-02-13T11:27:29Z, dockimbel, commented:
<https://github.com/red/red/issues/651#issuecomment-34969966>

    @iArnold Yes, the `[` character was missing from the `integer-end` charset definition. But no, we do not want to include all non-digits in such charset. A conservative approach is probably more future-proof in that case, especially if we need some form of post-processing later.

