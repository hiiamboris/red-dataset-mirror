
#4126: #[type!] support is quite narrow
================================================================================
Issue is closed, was reported by hiiamboris and has 56 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/4126>

**Describe the bug**

Direct loading of datatype! values is only supported for a few types:
```
>> foreach type to block! any-type! [x: attempt [load rejoin [ "#[" type "]" ]] print [pad type 15 "=>" mold x]]
datatype!       => none
unset!          => none
none!           => none!
logic!          => logic!
block!          => block!
paren!          => paren!
string!         => string!
file!           => none
url!            => none
char!           => char!
integer!        => integer!
float!          => none
word!           => word!
set-word!       => set-word!
lit-word!       => lit-word!
get-word!       => get-word!
refinement!     => refinement!
issue!          => issue!
native!         => native!
action!         => action!
op!             => op!
function!       => function!
path!           => path!
lit-path!       => lit-path!
set-path!       => set-path!
get-path!       => get-path!
routine!        => routine!
bitset!         => bitset!
object!         => none
typeset!        => none
error!          => none
vector!         => none
hash!           => none
pair!           => none
percent!        => none
tuple!          => none
map!            => none
binary!         => none
time!           => none
tag!            => none
email!          => none
handle!         => none
date!           => none
port!           => none
image!          => none
event!          => none
```

**Expected behavior**

Every known datatype supported.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 18-Oct-2019/15:33:41+03:00 commit #ed913ef
```



Comments:
--------------------------------------------------------------------------------

On 2019-11-07T21:03:02Z, 9214, commented:
<https://github.com/red/red/issues/4126#issuecomment-551262446>

    This is expected, since construction syntax is far from being complete.

--------------------------------------------------------------------------------

On 2019-11-08T13:39:24Z, meijeru, commented:
<https://github.com/red/red/issues/4126#issuecomment-551808852>

    See #652 and #3666. At the time of #652 (back in 2014) this was squarely dismissed. I think some patience is required.

--------------------------------------------------------------------------------

On 2019-11-08T13:59:06Z, hiiamboris, commented:
<https://github.com/red/red/issues/4126#issuecomment-551837634>

    This doesn't look like a big deal to me. Just add stuff to `escaped-rule` of lexers. It shouldn't take 5 years to do so.

--------------------------------------------------------------------------------

On 2019-11-08T14:46:51Z, meijeru, commented:
<https://github.com/red/red/issues/4126#issuecomment-551855521>

    Frankly, compared to the FULL implementation of value constructors (`#[<type> <spec>]`), this is indeed a minor thing. It is that full implementation that is going to bring real benefits, also in connection to `mold (/all)`. A small example from Rebol 2 & 3:
    >> b: [1 2 3 4]
    == [1 2 3 4]
    >> mold next b
    == "[2 3 4]"
    >> mold/all next b
    == "#[block! [1 2 3 4] 2]"

--------------------------------------------------------------------------------

On 2019-11-08T18:09:30Z, greggirwin, commented:
<https://github.com/red/red/issues/4126#issuecomment-551932700>

    I don't imagine a PR for handling all datatypes will be rejected, but it's _possible_. As noted, it's easy and doesn't require any design work. The reason it likely hasn't been done is that it hasn't been needed, and won't really be important until we have the general solution defined. There was a time, before `map!` syntax was decided on, that changing construction syntax was an open design question, and may still be. 
    
    If it helps _us_ now, let's do it. If it's for completeness, let's see if it's time to nail down construction syntax once and for all, so it's not wasted effort if that's going to change.

--------------------------------------------------------------------------------

On 2019-11-08T18:27:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/4126#issuecomment-551938924>

    > If it helps us now
    
    Nah, I just suddenly discovered I can do a `#[string!]` but not `#[file!]`, so raised this for completeness as you say ☺

--------------------------------------------------------------------------------

On 2019-11-23T14:56:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/4126#issuecomment-557804476>

    Deserves a special mention (https://github.com/red/red/issues/3409#issuecomment-557267592), that `unset!` values are molded (with `mold` or `mold/all`) as "unset". And "unset" is a function.

--------------------------------------------------------------------------------

On 2020-02-02T19:43:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/4126#issuecomment-581169555>

    Another issue I'm having is that `mold/all` on a face produces expression `#[handle! <integer>]` which is not `load`-able at all.

--------------------------------------------------------------------------------

On 2020-02-02T21:32:18Z, meijeru, commented:
<https://github.com/red/red/issues/4126#issuecomment-581179600>

    quote: `mold/all` on a face produces expression `#[handle! <integer>]` unquote
    I cannot reproduce this -- which build does this?

--------------------------------------------------------------------------------

On 2020-02-02T21:37:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/4126#issuecomment-581180069>

    All builds since 0.6.2 (in 0.6.1 it was an integer). The value of `face/state/1` (provided the face was ever created) is a handle:
    ```
    >> view/no-wait [b: base]
    >> mold/all b/state
    == "[#[handle! 002E110Eh] 0 none false]"
    ```

--------------------------------------------------------------------------------

On 2020-02-02T21:50:59Z, meijeru, commented:
<https://github.com/red/red/issues/4126#issuecomment-581181344>

    I see now, I was confused by your omitting that it was the `state` facet of a face instead of the face itself.

--------------------------------------------------------------------------------

On 2020-07-21T12:02:20Z, Oldes, commented:
<https://github.com/red/red/issues/4126#issuecomment-661813858>

    I think that this is invalid result:
    ```
    >> type? load {#[file!]}
    == datatype!
    ```
    It should be empty file or error, but not datatype.
    In Rebol to get a construction syntax for a datatype value, one must use: `#[datatype! file!]`

--------------------------------------------------------------------------------

On 2021-05-17T20:19:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/4126#issuecomment-842604977>

    things seems to have changed since
    ```
    datatype!       => datatype!
    unset!          => unset!
    none!           => none!
    logic!          => logic!
    block!          => block!
    paren!          => paren!
    string!         => string!
    file!           => file!
    url!            => url!
    char!           => char!
    integer!        => integer!
    float!          => float!
    word!           => word!
    set-word!       => set-word!
    lit-word!       => lit-word!
    get-word!       => get-word!
    refinement!     => refinement!
    issue!          => issue!
    native!         => native!
    action!         => action!
    op!             => op!
    function!       => function!
    path!           => path!
    lit-path!       => lit-path!
    set-path!       => set-path!
    get-path!       => get-path!
    routine!        => routine!
    bitset!         => bitset!
    object!         => object!
    typeset!        => typeset!
    error!          => error!
    vector!         => vector!
    hash!           => hash!
    pair!           => pair!
    percent!        => percent!
    tuple!          => tuple!
    map!            => map!
    binary!         => binary!
    time!           => time!
    tag!            => tag!
    email!          => email!
    handle!         => handle!
    date!           => date!
    port!           => port!
    money!          => money!
    ref!            => ref!
    image!          => image!
    event!          => event!
    ```
    is there any WIP on construction syntax or this is just a temporary artifact of new-lexer implementation?

--------------------------------------------------------------------------------

On 2021-05-17T20:23:22Z, greggirwin, commented:
<https://github.com/red/red/issues/4126#issuecomment-842612119>

    New lexer artifact AFAIK. I would still like @dockimbel to confirm that we want to keep `#(...)` for maps, because `#[...]` is really a better fit. The reason it wasn't done before was Rebol compatibility. To me it's backwards to use parens for a non-evaluated data structure.

--------------------------------------------------------------------------------

On 2021-08-18T16:27:35Z, dockimbel, commented:
<https://github.com/red/red/issues/4126#issuecomment-901254922>

    > is there any WIP on construction syntax or this is just a temporary artifact of new-lexer implementation?
    
    The latter. ;-) No decision made so far on what we should be supporting from construction syntax. One reason is that we might not need any advanced construction syntax in Red (besides the basic rules already supported) because we have the far superior Redbin format that supersedes it. Redbin is not readable directly, but a simple `print load/as ... 'redbin` can take care of that.
    
    > I would still like @dockimbel to confirm that we want to keep #(...) for maps, because #[...] is really a better fit.
    
    So you want to swap map! and construction syntaxes? I have nothing against that.

--------------------------------------------------------------------------------

On 2021-08-18T16:40:03Z, Oldes, commented:
<https://github.com/red/red/issues/4126#issuecomment-901263197>

    I still have a strong feeling that a construction syntax should be used in all cases where molding is producing `make ... []` pattern now.

--------------------------------------------------------------------------------

On 2021-08-18T17:28:27Z, greggirwin, commented:
<https://github.com/red/red/issues/4126#issuecomment-901296250>

    On redbin, if you have a lot of data that doesn't require construction syntax, but a few values that do, you lose the ability to see _any_ data without extra steps. And once you load it, you still wouldn't see the detail as in a non-head block reference scenario. It's a tough call because there is a lot of overlap in use cases, but it's not 100%.
    
    In thinking about the criteria for what uses construction syntax, @Oldes hit on the main one. We can start a wiki page and outline the formal spec for it by type. @meijeru do you have construction syntax detailed in your spec doc?
    
    On the bracketing syntax itself, it will hurt a bit to change it, but better now than later. For those with data that needs to be adapted, we should be able to write a converter without too much effort. We can do a survey, but it's really a fundamental design choice about the feel of the language. Much as I hate breaking changes, I would probably vote for this change if I take the long view.

--------------------------------------------------------------------------------

On 2021-08-18T19:47:26Z, meijeru, commented:
<https://github.com/red/red/issues/4126#issuecomment-901383917>

    @greggirwin No, I have no spec for something that is not there. I could develop a spec, but that would come down to making a design. Anyhow, for consistency, I would say we EITHER have only `#[<word>]` for the pre-defined bound words (none true false and all the datatypes) OR we have a complete `#[<type> <spec>]` design which may be inspired a lot by `make`, in which case all datatypes should be `#[datatype! <word>]` . As for the lexical question of which brackets to use, `#( )` or `#[ ]`, I am open, though I think the argument about unevaluated parentheses has some merit.

--------------------------------------------------------------------------------

On 2021-08-18T20:52:17Z, greggirwin, commented:
<https://github.com/red/red/issues/4126#issuecomment-901422382>

    Thanks @meijeru.
    
    Off the top of my head, we have a number of types where you can't create an invalid literal form via trickery (numeric types, pair, tuple, dates, times, logic, none, unset, char). We also have some types that have _no_ literal form, and require either evaluation or construction syntax (images, vectors, bitsets, typesets, objects, functions). Those are black and white. After that, things get fuzzy. 
    
    We've talked about extra series data, to include an offset. A `slice!` type has been discussed for general inclusion for Red, as have bounds/range and quantities. Slices likely fall under the series umbrella, and ranges under numerics et al. (again, riffing quickly here, so all comments are important). Other values may be special and be non-portable, even if we can serialize them. `handle!` is the poster child here. They may still hold useful information, but until we have an OS abstraction layer ala Smalltalk, they aren't directly usable somewhere else.
    
    This leaves us with string and word types, which we can muck about with, and which _may_ require construction syntax. That is, you can create values whose molded form matches another type's lexical form. e.g.
    ```
    >> to url! "abcdefg"
    == abcdefg
    >> to word! "abcdefg"
    == abcdefg
    ```
    
    Once we have a decimal! type, we have a conflict with floats as well, unless we do something like a leading `~` sigil for floats, as I've suggested in the past. For many, if not most, use cases, numeric values can be thought of as "number" and left at that for the purposes of text serialization. And numbers may exist in _large_ quantities. If we use construction syntax for every number (this comes back to the `save/all` hammer that hits everything in sight), the data will explode in size and be less meaningful to boot.
    
    Ultimately, the serialized form _must_ be correct and unambiguous in all cases. I can see this coming back to clarifying the specs for each type, and possibly even narrowing what coercions you can perform at runtime. _Ideally_, it could be smart enough to only use construction syntax when necessary, though that may be a lot more work (or overhead if you mold it, transcode, and check the type to see if construction syntax is needed; here the superfast lexer may save our butts). 

--------------------------------------------------------------------------------

On 2021-08-19T12:10:01Z, dockimbel, commented:
<https://github.com/red/red/issues/4126#issuecomment-901862003>

    >  And once you load it, you still wouldn't see the detail as in a non-head block reference scenario.
    
    I don't get that part. I don't see what you wouldn't see in loaded Redbin that you would in loaded regular MOLDed code?
    
    > I still have a strong feeling that a construction syntax should be used in all cases where molding is producing make ... [] pattern now.
    
    I totally disagree. We need MOLD to produce serialized forms that are the same as the code you type, so that you can convert code from memory in a human-friendly textual form that matches the way we write code in code editors. OTOH, MOLD/ALL was meant to produce a serialized version of the code suited for data exchange between running sessions (using a transportation medium like a disk, network, ...). That use-case is now much better covered by Redbin. Readability in such cases is only for debugging purposes, for which a trivial mezz function can be provided if needed.
    
    ```
    >> make object! [a: none b: next "hello"]
    == make object! [
        a: none
        b: "ello"
    ]
    ```
    vs 
    ```
    >> make object! [a: none b: next "hello"]
    == #[object! [
        a: #[datatype! none!]
        b: #[string! "hello" 2]
    ]
    ```
    No way!

--------------------------------------------------------------------------------

On 2021-08-19T21:40:55Z, greggirwin, commented:
<https://github.com/red/red/issues/4126#issuecomment-902267006>

    I thought @Oldes meant `mold/all` in his comment. He can clarify. I agree that plain `mold` needs to be for humans, but loadable.
    
    I don't know if redbin, per my comment above, is the only serialization hammer we need. Any old Reboler has probably felt the pain of saving data to config files and loading it back. Plain line-oriented `key: value` files are best for users, but depending on how you store config info in your app, it's a bit painful to deal with. We have maps now, and `body-of` helps (I have lots of config notes but haven't tinkered up new stuff yet to find the holes). In any case, config files (almost always) need to be declarative, without any evaluation occurring; and why we have `construct`. They also need to be human readable and editable, so `redbin` is out for that.
    
    We have a few special cases today, with `none` and `logic!` values. Logic values don't support the alternate words in construction form though, which is something to consider.
    
    - `Mold` is lossy, `mold/all` and `redbin` are not.
    - `Mold` and `mold/all` are human readable. `Redbin` is not. 
    - `Redbin` is only available via `save` today, unless we add `mold/redbin`. Mixing `mold` and `save` is going to get ugly for users if they want granular control when serializing vales (config example). And if you have mixed molded and redbin values in a file, how do you load that file?
    
    We need all three IMO. 

--------------------------------------------------------------------------------

On 2021-08-19T21:49:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/4126#issuecomment-902272184>

    `mold/all` will also simplify an IDE editing any data live, because everything can be represented as text, modified with any editor, even automated ones, then loaded back. While `redbin` will require separate GUI editor widget for every datatype. Whether it's a worthy goal is another story though.

--------------------------------------------------------------------------------

On 2021-08-19T21:58:23Z, hiiamboris, commented:
<https://github.com/red/red/issues/4126#issuecomment-902277113>

    I should also mention again that unloadable handles complicate this task *a lot*.

--------------------------------------------------------------------------------

On 2021-08-19T22:05:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/4126#issuecomment-902281364>

    OTOH such live editing is quite a challenge and is not addressed even by Redbin currently:
    ```
    >> a: reduce [b: []]
    == [[]]
    >> c: load/as save/as #{} a 'redbin 'redbin
    == [[]]
    >> c/1 =? a/1
    == false
    ```
    Saved one block, loaded another, with new series buffer. This will break the live system if I try to edit it.
    
    To save/load such intimate details as series buffer address, I think we'll need:
    - a 64-bit counter, incremented with each new allocated memory chunk; this counter uniquely identifies each buffer within the running interpreter and has to be either attached to the series, or better - held in a separate hashtable along with addresses
    - an UUID generated upon interpreter startup and saved within Redbin
    
    So when we load the data we know that if UUID of the current interpreter is different then all pointers are invalid and we just replace them with new ones. If UUID is the same, we compare the counter - if such buffer still exists, we refer to it; if not - we create a new one. 
    
    P.S. For `mold/all` to work with this model, every result of it should be wrapped into UUID-containing block.
    
    P.P.S. Think as well of a future debugger tool, which should be capable of inspecting and modifying any run-time value at breakpoint. All references to that value and it's inner values should remain intact after we edit it and load back. And that value can be a View face, which can't be loaded right now because we don't load handles, discarding any data with them with no regard whether they're actually invalid or not.

--------------------------------------------------------------------------------

On 2022-09-28T21:42:27Z, dockimbel, commented:
<https://github.com/red/red/issues/4126#issuecomment-1261495143>

    The original issue (incomplete construction syntax for datatypes) being implemented, I'll close this ticket as done.

--------------------------------------------------------------------------------

On 2023-12-22T18:07:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/4126#issuecomment-1867950574>

    This one has weird error:
    ```
    >> load "#[unset]"
    *** Script Error: out needs a value
    *** Where: set
    *** Near : load "#[unset]"
    *** Stack: load 
    ```

--------------------------------------------------------------------------------

On 2023-12-22T21:33:51Z, dockimbel, commented:
<https://github.com/red/red/issues/4126#issuecomment-1868082738>

    Probably needs a `set/any 'out ...` to handle the created `unset!` value.

--------------------------------------------------------------------------------

On 2023-12-30T14:15:53Z, dockimbel, commented:
<https://github.com/red/red/issues/4126#issuecomment-1872535953>

    You should have opened a new ticket for this one, as it was closed more than a year ago. It could very easily be skipped or forgotten if it does not have its own ticket, as we use the ticketing system also for task tracking.

