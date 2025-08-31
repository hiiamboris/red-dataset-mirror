
#642: LOAD doesn't allow word! with colon
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/642>

red>> load "a:b"
== [a: b]

REBOL:

> > load "a:b"
> > == a:b



Comments:
--------------------------------------------------------------------------------

On 2014-01-04T03:47:17Z, PeterWAWood, commented:
<https://github.com/red/red/issues/642#issuecomment-31570607>

    : is not a valid character in a Red word according to the Red lexer (line 56)
    
    ```
    not-word-char:  charset {/\^^,'[](){}"#%$@:;}
    ```
    
    This is the same as REBOL. REBOL treats a:b as a url! not a word!
    
    ```
    >> type? load "a:b"
    == url!
    ```
    
    I feel it is premature to consider this a bug in the circumstances.

--------------------------------------------------------------------------------

On 2014-02-06T22:38:58Z, dockimbel, commented:
<https://github.com/red/red/issues/642#issuecomment-34382990>

    `load "a:b"` produces a `url!` datatype not a word, Red will not load it as a word also (maybe a url! as in Rebol, but that is not certain yet).

