
#523: Compiler doesn't resolve get-words
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/523>

red>> unset? :x
== true

```
Red []

unset? :x
```

-= Red Compiler =- 
**\* Compilation Error: undefined word x 
**\* near: [:x
]

Would it be prudent to resolve get-words? It seems to me that when you use a get-word, like a set-word, you probably reckon with the possibility that it is unset, so it doesn't fall under the wish to warn for unset words.



Comments:
--------------------------------------------------------------------------------

On 2013-08-30T11:10:36Z, dockimbel, commented:
<https://github.com/red/red/issues/523#issuecomment-23554444>

    Ths is related to some extent to #485.
    
    The interpreter here should be raising an error (which will be added when we'll have proper error handling implemented).
    
    A get-word! usage implies that the word has already been set somehow before, else we really want an error raised to catch common user typo mistakes.
    
    What you really want is: 
    
    ```
    Red []
    
    probe unset? get/any 'x
    ```
    
    But a minor compiler bug is preventing this form to be correctly compiled atm.

--------------------------------------------------------------------------------

On 2013-08-30T11:18:35Z, dockimbel, commented:
<https://github.com/red/red/issues/523#issuecomment-23554771>

    Ok, now `get/any` can be properly used as shown above.

--------------------------------------------------------------------------------

On 2013-08-30T15:51:06Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/523#issuecomment-23570629>

    Thanks, but note that R3 doesn't generate an error on the short form.

--------------------------------------------------------------------------------

On 2013-08-30T17:07:44Z, dockimbel, commented:
<https://github.com/red/red/issues/523#issuecomment-23575673>

    Noticed it, but R3 doesn't feature a compiler. ;-)

