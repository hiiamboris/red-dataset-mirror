
#387: type? issue! broken in interpreter
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/387>

red>> type? #9
== unset!



Comments:
--------------------------------------------------------------------------------

On 2013-01-22T23:11:16Z, dockimbel, commented:
<https://github.com/red/red/issues/387#issuecomment-12572372>

    Actually, the interpreter is evaluating it fine:
    
    ```
    Red []
    do [probe type? #9]
    
    == issue!
    ```
    
    The limitation is coming from the current tokenizer which supports only a few literal datatypes, see [this](https://github.com/dockimbel/Red/commit/744bcb072e8f850bd7b9f1e778fe172446f29416) commit log

