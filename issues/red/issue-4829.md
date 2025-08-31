
#4829: `mold` refuses to show operators body
================================================================================
Issue is closed, was reported by hiiamboris and has 18 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/4829>

**Describe the bug**
```
>> source is
IS is an op! value, so source is not available.     ;) why???

>> ?? is
is: make op! [[
    {Defines a reactive relation whose result is assigned to a word} 
    'field [set-word!] {Set-word which will get set to the result of the reaction} 
    reaction [block!] "Reactive relation" 
    /local obj rule item
]]                                                  ;) where's body??? why double brackets around spec??

>> print mold :is
make op! [[
    {Defines a reactive relation whose result is assigned to a word} 
    'field [set-word!] {Set-word which will get set to the result of the reaction} 
    reaction [block!] "Reactive relation" 
    /local obj rule item
]]                                                  ;) same issues

>> probe body-of :is ()                             ;) so this is the only way to reflect on ops?
[
    obj: context? field 
    parse reaction rule: [
        any [
            item: word! (if in obj item/1 [add-relation obj item/1 reaction field]) 
            | any-path! | any-string! 
            | into rule 
            | skip
        ]
    ] 
    react/later/with reaction field 
    set field either block? :reaction/1 [do :reaction/1] [eval reaction]
]
```

**Expected behavior**

Body shown with `??`, name+spec+body with `source`.
By the way, I expect `:is = do load mold :is` to be true.

**Platform version**
```
Red 0.6.4 for Windows built 9-Feb-2021/20:31:32+03:00 commit #18bc5f7
```



Comments:
--------------------------------------------------------------------------------

On 2021-02-12T21:20:38Z, greggirwin, commented:
<https://github.com/red/red/issues/4829#issuecomment-778461456>

    Just need to add handling for ops to `source`, as a special case when they're derived from a func.
    
    `??` just molds the value, so it's up to action!, et al how they want to be viewed. Double brackets @dockimbel has to speak to, if it's intentional. We could add a placeholder for the body. @rebolek did a clever `nsource` func at one point that directed you with a link to a native!s source.

--------------------------------------------------------------------------------

On 2021-02-17T13:31:50Z, 9214, commented:
<https://github.com/red/red/issues/4829#issuecomment-780557801>

    @hiiamboris `??` can show bodies only for `op!`s derived from `function!` or `routine!` (see https://github.com/red/red/issues/4563); IMO it's not a bug per se, just a design decision sided towards consistency.
    
    An alternative would be to propose what `??` *should* show instead of bodies for `native!`s and `action!`s — one particular choice is their internal IDs, the ones that you already can get with `body-of`.

--------------------------------------------------------------------------------

On 2021-02-19T08:12:49Z, hiiamboris, commented:
<https://github.com/red/red/issues/4829#issuecomment-781911050>

    Or incorporate `nsource` logic into Red console.

--------------------------------------------------------------------------------

On 2021-02-20T13:52:31Z, 9214, commented:
<https://github.com/red/red/issues/4829#issuecomment-782668356>

    @hiiamboris that fixes built-in helpers, but not `form` or `mold`.
    ```red
    >> print mold :is
    make op! [[
        {Defines a reactive relation whose result is assigned to a word} 
        'field [set-word!] {Set-word which will get set to the result of the reaction} 
        reaction [block!] "Reactive relation" 
        /local obj rule item
    ]]
    ```

--------------------------------------------------------------------------------

On 2021-02-20T14:34:40Z, hiiamboris, commented:
<https://github.com/red/red/issues/4829#issuecomment-782690910>

    Right. Connecting to the web for `mold` is not an option..
    Maybe at some point compiler will be smart enough to include the source of each native/action like it does for routines.

--------------------------------------------------------------------------------

On 2021-02-20T14:40:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/4829#issuecomment-782691702>

    Anyway, this issue is about `??` not showing source of function-based ops, while natives/actions are out of it's scope and will come in due time. Good point that routine-based ops should be supported too.

--------------------------------------------------------------------------------

On 2021-02-20T15:27:40Z, 9214, commented:
<https://github.com/red/red/issues/4829#issuecomment-782698483>

    @hiiamboris I don't understand why `??` is a concern if `mold` is the culprit. 
    ```red
    >> ?? ??
    ??: func [
        "Prints a word and the value it refers to (molded)" 
        'value [word! path!]
    ][
        prin mold :value 
        prin ": " 
        print either value? :value [mold get/any :value] ["unset!"]
    ]
    ```
    
    Perhaps, at the cost of extra space, compiler can encode Red/System bodies (they are mere `block!`s from Rebol's perspective after all) in Redbin payload and make them accessible somewhere in `system` (e.g. in a block that you can index with native/action IDs).

--------------------------------------------------------------------------------

On 2021-02-20T16:16:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/4829#issuecomment-782707950>

    > I don't understand why `??` is a concern if `mold` is the culprit.
    
    Right. Fixed the description, thanks.

--------------------------------------------------------------------------------

On 2021-08-24T17:40:19Z, dockimbel, commented:
<https://github.com/red/red/issues/4829#issuecomment-904844364>

    Now `mold` on `op!` values will produce a complete output if the source of the operator was a `function!`. 
    
    The double brackets syntax is for specifying an extra argument, like an ID for action/native sources. Though such syntax is not yet supported by `make`.

