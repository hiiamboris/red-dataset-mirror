
#5437: Refinements are a red flag for Redbin
================================================================================
Issue is open, was reported by hiiamboris and has 14 comment(s).
[type.bug]
<https://github.com/red/red/issues/5437>

**Describe the bug**

Redbin's still giving me headaches related to https://github.com/red/REP/issues/155 :/ 
To find what exactly it doesn't like this time I had to squeeze every deep value in the data through a filter that attempts to save it.

Turns out it hates refinements:
```
>> f: func [/x] [system/codecs/redbin/encode /x none] f
*** Access Error: cannot decode or encode (no codec): routine ["Internal Use Only"][bool: as red-logic! stack/arguments bool/header: T
*** Where: encode
*** Near : system/codecs/redbin/encode /x none
*** Stack: f 
```

Note: in the original code, bug is not so simple as `system` word appearing in the function. `/local` refinement in a Parse rule grabs the function, function grabs the context where it's defined, and context grabs other functions in it, which have references to `system` (as `system/script` usually, but never referring to `system` itself or `system/words`).

**Expected behavior**

Saved and loaded successfully.

**Platform version**
```
Red 0.6.4 for Windows built 22-Nov-2023/17:24:25+03:00  commit #34f26df
```


Comments:
--------------------------------------------------------------------------------

On 2023-11-30T17:18:36Z, hiiamboris, commented:
<https://github.com/red/red/issues/5437#issuecomment-1834202332>

    It probably treats refinements as part of https://github.com/red/red/issues/5406 but since they don't have an exposed binding this just causes it to fail for no practical reason.

--------------------------------------------------------------------------------

On 2023-11-30T17:20:49Z, hiiamboris, commented:
<https://github.com/red/red/issues/5437#issuecomment-1834206349>

    Workaround is double conversion: 
    ```
    >> f: func [/x] [system/codecs/redbin/encode to refinement! bind to word! /x system/words none] f
    == #{
    52454442494E0204010000000C00000001000000080000000000000078000000
    0000000013000002000000006C010000
    }
    ```

--------------------------------------------------------------------------------

On 2023-11-30T17:25:46Z, hiiamboris, commented:
<https://github.com/red/red/issues/5437#issuecomment-1834217988>

    Interestingly, no problem with issues (`#x`)

--------------------------------------------------------------------------------

On 2024-03-29T17:37:11Z, 9214, commented:
<https://github.com/red/red/issues/5437#issuecomment-2027532657>

    > Interestingly, no problem with issues (`#x`)
    
    I dimly recall some changes in the way `refinement!` and `issue!` handle their bindings, which happened somewhere in parallel with Redbin codec implementation: probably https://github.com/red/red/pull/4674 or something related. So that might be a de-sync between datatype semantics and their encoding.
    
    On a quick glance, it seems that `/x` is bound to global context, and, because of that, encoder tries to pull the entire environment with it when serializing the value.

--------------------------------------------------------------------------------

On 2024-03-30T10:09:31Z, 9214, commented:
<https://github.com/red/red/issues/5437#issuecomment-2028001260>

    > On a quick glance, it seems that /x is bound to global context, and, because of that, encoder tries to pull the entire environment with it when serializing the value.
    
    The problem is rather in `/x` being bound to `f` itself, which contains `system/words` within its body, _which_, by definition, pulls the entire environment with it.
    
    ```red
    f: func [/x][system/words save/as #{} /x 'redbin] f
    *** Access Error: cannot decode or encode (no codec): routine ["Internal Use Only"][bool: as red-logic! stack/arguments bool/header: T
    *** Where: encode
    *** Near : dst
    *** Stack: f save  
    ```
    
    > Workaround is double conversion
    
    Yes, and it works precisely because Redbin skips fully encoding globally bound words, treating them purely as symbols instead. From the [spec](https://github.com/red/docs/blob/master/en/redbin.adoc#6314-word-):
    
    > If `set?` flag is set, then word is bound to a global context and index field is followed by a value record to which word needs to be set; <...> In the current implementation, enabled `set?` flag indicates that word is bound to a global context, **but value record is omitted.**
    
    ---
    
    So, two problems:
    
    1. `refinement!`s don't get the same treatment as `issue!`s during encoding, as they should, but are rather encoded the way words do, with binding information and such.
    
    This is the slipped thru `all-word!` vs `any-word!` de-sync I've mentioned. And it's a trivial fix:
    
    ```red
    >> difference all-word! any-word!
    == make typeset! [refinement! issue!]
    ```
    
    https://github.com/red/red/blob/b301d7b3bf833ff08b786746405d1c0b95a491e7/runtime/redbin.reds#L577
    
    https://github.com/red/red/blob/b301d7b3bf833ff08b786746405d1c0b95a491e7/runtime/redbin.reds#L612
    
    Redbin's [spec](https://github.com/red/docs/blob/master/en/redbin.adoc#refinement) needs a brush up, too.
    
    2. Symbolic values have a nasty tendency to recursively pull everything they touch with them. 
    
    Conceptually this is alright, as far as Redbin's "lossless encoding" goal goes. Practically though, since not all of the datatypes can be encoded (e.g. `routine!` in the original example), this leads into dead-ends: any `any-word!` can potentially, directly or indirectly, touch such datatype, rendering the entire encoding process futile.
    
    This one you have to live with, feeling Galactus' [pain](https://www.youtube.com/watch?v=y8OnoxKotPQ), until the new iterations of Redbin, or entirely new encoding formats, improve the situation.
    
    ```red
    >> f: func[/local x][system/words save/as #{} 'x 'redbin] f
    *** Access Error: cannot decode or encode (no codec): routine ["Internal Use Only"][bool: as red-logic! stack/arguments bool/header: T
    *** Where: encode
    *** Near : dst
    *** Stack: f save
    >> ? routine! ; the first routine codec encounters
        last-lf?        => Internal Use Only.
        ...
    ```

--------------------------------------------------------------------------------

On 2024-03-30T19:11:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/5437#issuecomment-2028445663>

    I wish it would at least have an option to skip unsupported values, rather than throwing an error. Would save me the effort of recursively rebuilding all the data, and would probably allow me to apply Redbin save-load cycle to where I need a deep data copy.

--------------------------------------------------------------------------------

On 2024-03-30T19:53:06Z, 9214, commented:
<https://github.com/red/red/issues/5437#issuecomment-2028454746>

    The problem with Redbin codec specifically is that compilation and runtime booting are dependant on it. Any changes that destabilize or slow it down are a no-go, as far as I understand. Hiding user-facing codec details (hardened validation, callbacks for manual processing etc) behind boolean flags is an option, but it will bloat and clutter the existing code.
    
    So, if there are any improvements worth doing, IMO the first step would be to pinpoint the existing codec and fork the implementation for upgrading and experimenting. @hiiamboris already gave some valuable feedback to drive that process, and has practical examples to back it up. This is also something that can inform codec design an runtime instrumentation in general.
    
    Unfortunately I'm not up for this task right now, but can say a thing or two about what's what, as time permits.
    
    The initial endeavor with Redbin v2 was to push it as far as possible to completion without breaking everything and note the resulting benefits with limitations. The next step is to learn from them and to act upon them.

