
#242: Rename #enum to ENUMERATE
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 18 comment(s).
[type.wish] [status.reviewed] [Red/System]
<https://github.com/red/red/issues/242>

Is #enum really a preprocessor construct?



Comments:
--------------------------------------------------------------------------------

On 2012-08-24T20:32:05Z, dockimbel, commented:
<https://github.com/red/red/issues/242#issuecomment-8013990>

    That is a question I have asked myself too recently as I moved some `#enum` processing code from loader to compiler. So far, my conclusion has been that enumerations are very close to macros, they define symbols that get replaced in source code by values (integer! values only for enumerations), so, from that perspective, it should fall in the same category as #define.
    
    So, for example, the following declarations are pre-processed in the same way, from user POV:
    
    ```
    #define no 0
    #define yes 1
    ```
    
    ```
    #enum answer! [no yes]
    ```
    
    Enumerations are a bit more sophisticated, as you can use the name as a pseudo-type, but it is also pre-processed and replaced by |integer!] wherever it is used as a type. Also, macros are processed during loading phase, while enumerations are processed during compilation (they get replaced by their values as early as possible in the compilation process). Enumerations would have been pre-processed in loader if they weren't sensible to scoping.

--------------------------------------------------------------------------------

On 2012-08-24T23:58:48Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/242#issuecomment-8018079>

    My earlier wish to have anonymous enumerations could be added by equalising ENUMERATE with ALIAS:
    
      enumerate [no yes]
      type!: enumerate [a b c]

--------------------------------------------------------------------------------

On 2012-08-25T13:29:39Z, dockimbel, commented:
<https://github.com/red/red/issues/242#issuecomment-8023276>

    I like the syntax, it shouldn't be a big change if we're changing only the enumeration declaration syntax.
    
    I would like to hear from Oldes about that first, he's the one who brought us that feature afterall.

--------------------------------------------------------------------------------

On 2012-08-26T09:35:47Z, Oldes, commented:
<https://github.com/red/red/issues/242#issuecomment-8031646>

    It's a little bit longer, but why not, if you think it's more logical and worth the change.

--------------------------------------------------------------------------------

On 2012-08-26T12:03:47Z, PeterWAWood, commented:
<https://github.com/red/red/issues/242#issuecomment-8032583>

    Could it not just be changed to enum ?

--------------------------------------------------------------------------------

On 2012-08-26T16:36:48Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/242#issuecomment-8034596>

    That would be quite un-REBOL-like.

--------------------------------------------------------------------------------

On 2012-08-27T01:53:33Z, PeterWAWood, commented:
<https://github.com/red/red/issues/242#issuecomment-8045513>

    My suggestion was to cover both the verb enumerate and the vowel enumeration. I hope that we can avoid the grammatical nonsense of Python's enumerate object!
    
    I'd be happy with:
    
    ``` rebol
    traffic-light: declare enumeration! [red amber green]
    
    traffic-light: enumerate [red amber green]
    ```

--------------------------------------------------------------------------------

On 2012-08-27T13:58:45Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/242#issuecomment-8056476>

    I considered something like that; I'd be okay with that.

--------------------------------------------------------------------------------

On 2013-05-05T12:25:35Z, PeterWAWood, commented:
<https://github.com/red/red/issues/242#issuecomment-17450978>

    Wish moved to v2 wish list on wiki.

