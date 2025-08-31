
#5406: Redbin substitutes function-local words with some routine
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.deferred] [type.wish] [type.design]
<https://github.com/red/red/issues/5406>

**Describe the bug**

I need to save function-local parse rules so that the words in the rules (blocks) are still connected to the (other) rules (blocks). But it's not cooperating:
```
enc: function [] [
	b: [1 2 3]
	probe system/codecs/redbin/encode probe reduce ['b b] none
]
dec: system/codecs/redbin/decode enc none
?? dec
probe get dec/1
```
It doesn't get past `encode`. Output:
```
[b [1 2 3]]
*** Access Error: cannot decode or encode (no codec): routine ["Internal Use Only"][bool: as red-logic! stack/arguments bool/header: T
*** Where: encode
*** Near : probe system/codecs/redbin/encode probe
*** Stack: enc probe
```
The routine it's trying to encode seems to be `last-lf?`:
```
>> ?? last-lf?
last-lf?: routine ["Internal Use Only"][
    bool: as red-logic! stack/arguments 
    bool/header: TYPE_LOGIC 
    bool/value: natives/last-lf?
]
```

**To reproduce**

Run the snippet above.

**Expected behavior**

I'd like word to be connected to the block once decoded. 
Is it technically out of function's context? Maybe. But the block *is* saved, so the word can refer to it. I think Redbin should be able to capture context structure at the time of saving, so once loaded it's still all accessible.

**Platform version**
```
Red 0.6.4 for Windows built 16-Oct-2023/10:48:01+03:00  commit #6a055f5
```


Comments:
--------------------------------------------------------------------------------

On 2023-10-16T16:52:23Z, hiiamboris, commented:
<https://github.com/red/red/issues/5406#issuecomment-1764887596>

    Current workaround seems to be to replace every `any-word!` with its equivalent in an anonymous context, deeply in all `any-block!`s, both literal and referred to by `any-word!`s. But it's bound to break rules if they ever test themselves for sameness.

--------------------------------------------------------------------------------

On 2023-10-17T11:48:49Z, dockimbel, commented:
<https://github.com/red/red/issues/5406#issuecomment-1766255969>

    The error shows that the passed data is linked to global context (system object), so that the Redbin encoder then tries to encode the whole global context, reaching at some point routine values (`last-lf?` being the first one) and then giving up.
    
    Here's the Redbin encoding trace:
    ```
    << type: 5					; [b [1 2 3]]
        << type: 15					; b
        << type: context!				; b's context
        << type: 5					; spec-of 'enc function
            << type: 19				; /local
            << type: 15				; b
        << type: 5					; body-of 'enc function
            << type: 16				; b:
            << type: 5				; [1 2 3]
                << type: 11				; 1
                << type: 11				; 2
                << type: 11				; 3
            << type: 15				; probe
            << type: 25				; system/codecs/redbin/encode
                << type: 15				; system
                << type: 15
                    << type: context!		; :system (object!)
                    << type: 39
                    << type: 32
                        << type: context!
                        << type: 47
                        << type: 32
                            << type: context!
                            << type: 7
                            << type: 20
                            << type: 11
                            << type: 47
                            << type: 20
                            << type: 7
                        << type: 32
                            << type: context!
                            << type: 15
    [...]
                        << type: 29			; :last-lf? (routine!)
    *** Access Error: cannot decode or encode (no codec): routine ["Internal Use Only"][bool: as red-logic! stack/arguments bool/header: T
    *** Where: encode
    *** Near : probe system/codecs/redbin/encode probe 
    *** Stack: probe enc probe 
    ```
    
    So the test code can be modified to avoid pulling the whole system object:
    ```
    enc': :system/codecs/redbin/encode
    enc: function [] [
        b: [1 2 3]
        enc' probe reduce ['b b] none
    ]
    dec: system/codecs/redbin/decode probe enc none
    ?? dec
    probe get dec/1
    ```
    which will output:
    ```
    [b [1 2 3]]
    #{
    52454442494E0204010000003801000006000000300000000000000008000000
    1000000018000000200000002800000062000000000000006C6F63616C000000
    656E63270000000070726F626500000072656475636500006E6F6E6500000000
    0500000000000000020000000F00000000000000010000001800000002000000
    070000000E000024020000000100000000000000050000000000000002000000
    1300000201000000000000000F00000200000000E60100000500000000000000
    07000000100008800000000001000000FF000000020000000000000000000000
    0500000000000000030000000B000000010000000B000000020000000B000000
    030000000F00008202000000EB0500000F00000203000000ED0500000F000002
    0400000033010000050000000000000002000000110008000000000001000000
    FF0000000200000000000000000000000F0008000000000001000000FF000000
    0200000000000000000000000F000002050000000F0200000500080000000000
    FF0000000400000000000000000000000100000001000000
    }
    dec: [b [1 2 3]]
    *** Script Error: context for b is not available
    *** Where: get
    *** Near : probe get dec/1
    *** Stack: probe
    ```
    
    So that output is correct and the error is relevant.
    
    > Is it technically out of function's context? Maybe. But the block is saved, so the word can refer to it. I think Redbin should be able to capture context structure at the time of saving, so once loaded it's still all accessible.
    
    The function's context is by nature volatile with its context values stored on stack. Even if we could capture that stack frame, we wouldn't have a destination where to decode it to. We could create a hidden object on decoding to hold such values, but a) I'm not sure that would be fully compatible with the language semantics and the implementation, b) the Redbin roundtripping rule would not be respected (a function would partially decode to an object).
    
    So I think this question about encoding entire function's stack frame pertains to a wider discussion about values serialization and intepreter states capturing. So I'll close this ticket as "deferred" and add a "design" flag to it.

--------------------------------------------------------------------------------

On 2023-10-21T18:37:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/5406#issuecomment-1773889373>

    Another problem to note is that Redbin ignores global words, most likely by design, but that requires a workaround when I want to save those words' values.
    
    If I use this script to save the data:
    ```
    Red []
    block: [1 2 3]
    saved: [block]
    save %test.redbin saved
    ```
    I then can't load it using this script:
    ```
    Red []
    probe loaded: load %test.redbin
    probe reduce loaded
    ```
    Output:
    ```
    [block]
    *** Script Error: block has no value
    *** Where: reduce
    *** Near : probe reduce block2
    *** Stack: probe
    ```

