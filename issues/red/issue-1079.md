
#1079: Hex integer literals crash REPL
================================================================================
Issue is closed, was reported by PeterWAWood and has 34 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1079>

Entering a hexadecimal integer literal causes the red console to crash:

```
red>> i: 01h
*** Script error: invalid function definition: comparator
*** Where: make-hexa
mbp:Red peter$ ./test-console
--== Red 0.5.1 ==-- 
Type HELP for starting information. 

red>> i: 00h
*** Script error: invalid function definition: comparator
*** Where: make-hexa
mbp:Red peter$ ./test-console
--== Red 0.5.1 ==-- 
Type HELP for starting information. 

red>> 0001h
*** Script error: invalid function definition: comparator
*** Where: make-hexa
mbp:Red peter$ ./test-console
--== Red 0.5.1 ==-- 
Type HELP for starting information. 

red>> i: FFFFFFFFh
*** Script error: invalid function definition: comparator
*** Where: make-hexa
mbp:Red peter$ ./test-console
--== Red 0.5.1 ==-- 
Type HELP for starting information. 

red>> i: 12345678h
*** Script error: invalid function definition: comparator
*** Where: make-hexa
mbp:Red peter$ 

```

The compiler also crashes:

```
mbp:Red peter$ rebol -qs %quick-test/run-test.r tests/source/environment/lexer-test.red
Quick-Test v0.12.0
Running under REBOL 2.7.8.2.5
signify failure
~~~started test~~~ lexer
*** Script error: invalid function definition: comparator
*** Where: make-hexa
*** Stack: --assert = transcode unless either parse store make-hexa
```



Comments:
--------------------------------------------------------------------------------

On 2015-03-30T15:31:52Z, dockimbel, commented:
<https://github.com/red/red/issues/1079#issuecomment-87724031>

    The current hexadecimal format is problematic and it cannot be parsed unambiguously (can collide with words). So support for it has not been fully implemented in the runtime lexer.
    
    Maybe this is the right time to change that syntax and introduce a new clean one. My idea since a while is to use the `&` sigil for that as a prefix (or suffix) for integers specified in a base different than base 10:
    
    ```
    16&FFFF
    8&755
    2&11010111
    ```
    
    If not specified, the base would be 16, so that hex numbers could be simply written like:
    
    ```
    &01
    &00E5
    &FFFFFFFF
    ```
    
    As you can see `&` does not always read clearly.
    
    Alternative option could be to use `_` to denote a subscript part:
    
    ```
    FFFF_16
    755_8
    11010111_2
    
    Omitting the base unit, it defaults to hexadecimal:
    01_
    00E5_
    FFFFFFFF_
    
    It could be used also to denote different integer sizes:
    12345_l        ;-- long integer (64-bit)
    1234_s         ;-- short integer (16-bit)
    123_b          ;-- byte (8-bit)
    ```
    
    Clean and clear, but probably a bit too esoteric for practical use...
    
    Though, I have made no final decision on that. Feedbacks and alternative propositions are welcome.

--------------------------------------------------------------------------------

On 2015-03-30T16:19:07Z, rebolek, commented:
<https://github.com/red/red/issues/1079#issuecomment-87740444>

    Doesn't `_` have same problem as `h`? - `FF_` is valid **word!**.

--------------------------------------------------------------------------------

On 2015-03-30T16:24:19Z, greggirwin, commented:
<https://github.com/red/red/issues/1079#issuecomment-87741588>

    I like the idea of a prefix sigil, rather than suffix. It tells you what it coming, rather than reading it, seeing a sigil at the end, and having  to read it again in that context.
    
    Coming from BASICs, I was used to &H as a prefix, not 0x as used in C, so & looks OK to me. 
    
    BUT (all caps intentional) is that the best use for &, which we haven't leveraged yet. We already have N#{...} for binary values in REBOL. Would it be a problem to support other radixes using that form without the braces? e.g. 16#FFFF. I know it means to MUST specify a radix to avoid collision with issue! values, which may be a bigger design issue than I see at the moment.
    
    And, as much as I like shorthand notations for certain things, I think I would rather see a real dialect for very specific value definitions, where the number of bits is critical. Also, 12345_l may appear ambiguous to humans depending on the font. 

--------------------------------------------------------------------------------

On 2015-03-30T16:38:22Z, hostilefork, commented:
<https://github.com/red/red/issues/1079#issuecomment-87744466>

    From note on [CC#2197](http://curecode.org/rebol3/ticket.rsp?id=2197)
    
    ```
    foo: hex>AE 
    bar: bin>11110000 
    baz: oct>707070
    ```
    
    Prerequisite is at least a variant of Ladislav's [CC#2094](http://curecode.org/rebol3/ticket.rsp?id=2094) (current leading thought says exactly four exceptions would be made for `][`, `)(`, `](` and `)[` a.k.a. _"Plan Minus Four From Outer Space"_) .
    
    This is a good example of usage of notational space opened up by that.  Hence the usefulness of:
    
    ```
    10<foo bar>{baz}
    ```
    
    ...being interpreted as `integer! tag! string!` is considered to be outweighed by opening the symbolic space.
    
    It is not contentious with [CC#2206](http://curecode.org/rebol3/ticket.rsp?id=2206) that proposes allowing internal > and < non-alphabetic tag-like things. That proposal opens up the likes of `>>=`, `~~>`, `|>`, `>*`, `<-` etc.  `xxx> yyy` would be illegal for alphabetic/numeric xxx.  Same with `xxx >yyy`.  Then  `xxx > yyy` would be clearly a comparison.
    
    Not the only option opened by Plan Minus Four; just one I thought of.  There may well be better.

--------------------------------------------------------------------------------

On 2015-03-30T21:51:10Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1079#issuecomment-87842470>

    An alternative could be to adapt the literal form used for hex characters, swapping the () for {}:
    
    ^{01}
    ^{FFFFFFFF}
    
    The binary! style of specifying a base could be accommodated with:
    
    2^{00000000000000000000000000000001}
    10^{12345}
    16^{FFFFFFFF}

--------------------------------------------------------------------------------

On 2015-03-31T01:09:07Z, dockimbel, commented:
<https://github.com/red/red/issues/1079#issuecomment-87891530>

    @rebolek Right, `_` is not working for hex numbers. I shouldn't write propositions when it's past midnight. ;-)

--------------------------------------------------------------------------------

On 2016-06-17T16:39:54Z, dockimbel, commented:
<https://github.com/red/red/issues/1079#issuecomment-226819039>

    Crash fixed. I've opened a card on Trello about the literal format for hexadecimals: https://trello.com/c/mI0MnhvD/151-find-a-better-literal-form-for-hexadecimals-see-1079

--------------------------------------------------------------------------------

On 2016-06-17T23:13:34Z, qtxie, commented:
<https://github.com/red/red/issues/1079#issuecomment-226902512>

    Sum up here:
    
    literal from for different base:
    
    ```
    16&FFFF                           16^FFFF
    8&755                or           8^755
    2&11010111                        2^11010111
    ```
    
    If not specified, the base would be 16, so that hex numbers could be simply written like:
    
    ```
    &01                               ^01
    &00E5                or           ^00E5
    &FFFFFFFF                         ^FFFFFFFF
    ```
    
    combine with types:
    
    ```
    16&FFFFu8                 16&FFFF_u8                    ; unsigned 8 bits
    8&755u16                  8&755_u16                     ; unsigned 16 bits
    2&11010111i32             2&11010111_i32                ; signed 32 bits
    
    or
    
    16^FFFFu8                 16^FFFF_u8                    ; unsigned 8 bits
    8^755u16                  8^755_u16                     ; unsigned 16 bits
    2^11010111i32             2^11010111_i32                ; signed 32 bits
    ```
    
    For float numbers:
    
    ```
    1f32                      1_f32
    1.2f32                    1.2_f32
    1.2e3f32                  1.2e3_f32
    1.2e3f64                  1.2e3_f64
    ```

--------------------------------------------------------------------------------

On 2016-06-18T19:29:21Z, iArnold, commented:
<https://github.com/red/red/issues/1079#issuecomment-226960721>

    2^10 looks like the power of. Or the escape characters like #"^M".
    2&10 looks a bit like 2 && 10, but different enough.
    But anything is better than curly braces though.
    
    & has my slight preference.

--------------------------------------------------------------------------------

On 2016-06-19T04:02:19Z, greggirwin, commented:
<https://github.com/red/red/issues/1079#issuecomment-226978170>

    TL;DR
    
    Dialected or path notation type?
    
    ```
    16#[FFFF] #[1.2e3 F64] 2#[11010111 i32]
    16/FFFF/i/32 8/755 2/11110000/u/8
    ```
    
    Thoughts:
    - This will probably be used more in Red/System, especially types, but the syntax must be valid in Red.
    - If we include decimals and type info, we have 4 fields:
      `[base/radix int opt [.frac] opt [type opt [width]]]`
    - & hurts readability with curly digits:
      `8&000 16&8888 8&333 16&6886 16&9898 2&00110101`
    - Our target bases are all somewhat curly
    - ^ Looks like POWER to me.
    - Without a sep before the type...`8&755u16 2^11010111i32` are not things I really want to read.
      Writing them is fine, because you know what you're doing when you write it. :)
    
    Questions:
    - Should it be a new lexical space (^, _, &)?
    - Could it be a dialect (`16#[FFFF] #[1.2e3 F64] 2#[11010111 i32]`)?
    - Or a special tag form, as above (`#<1.2e3 F64>`)?
    - Could it be a numeric path, where each part is a refinement?
      (`16/FFFF/i/32 8/755 2/11110000/u/8`)
      This is similar to the serial:// scheme format in R2.
    - Am I worrying too much about odd cases?
    - What is the benefit of it being a new numerical format, rather than a dialect?
      As soon as you include type info, you have to maintain it, right? That is, you
      can't just convert the base right there and make an integer! out of it. Or you
      have to treat it as an atomic value you can parse later.
    
    Deep breath:
    
    If we step way back, are these `quantities`?
    
      `quantity: [magnitude/unit | number/unit]`
    
    Not that they would have to be path notation. I think block notation is probably better. This is, I know, way out of scope, but I think it's important to ask how we expect people to represent quantities in
    Red, in the future. The answer may be _"Use blocks, and here are a few guidelines so some people can mostly do it sort of consistently."_ (hedging intentional :). I'm not saying we have to be Wolfram Alpha.

--------------------------------------------------------------------------------

On 2016-06-19T05:28:14Z, dockimbel, commented:
<https://github.com/red/red/issues/1079#issuecomment-226980417>

    Remember that such syntax (especially for hexadecimals) needs to be very short, currently in Red, it's only one extra character, in C and most other languages, it's just two (`0xFF00`).
    
    Actually, the best option I came up with was in another ticket (I think it has the best trade-off between readability and shortness, and the added benefit to accept a close to the `0x...` syntax):
    
    ```
    0#FF00   (default to base 16)
    16#FF00
    8#660
    2#1111000
    ```
    
    That's for the base, for the unit, I haven't found yet a fine syntactic sugar, so as a fallback, we still have the type casting option: `as u16! 0#FF00`.
    
    @greggirwin A general syntax for quantities would be nice, though, it really needs to be as close as possible to common human notation.

--------------------------------------------------------------------------------

On 2016-06-19T07:13:12Z, greggirwin, commented:
<https://github.com/red/red/issues/1079#issuecomment-226983277>

    I'm OK with that syntax. It's earlier in this thread too. I understand the need for short, since it will be used a lot in lower level code, but maybe it could start with requiring 16# instead of 0#. That makes things much clearer, since # doesn't carry the same phonetic connection to hex as x.

--------------------------------------------------------------------------------

On 2016-06-19T10:47:21Z, iArnold, commented:
<https://github.com/red/red/issues/1079#issuecomment-226990685>

    Agreed, # is better than &, that has lot of association with pointers in C, so it not a lucky choice either. ( @greggirwin the # is a fence, which is 'hek' in Dutch and sounds like 'hex' without the 's' sound at the end. ) 

--------------------------------------------------------------------------------

On 2016-06-19T12:46:49Z, WiseGenius, commented:
<https://github.com/red/red/issues/1079#issuecomment-226995556>

    I also don't like `^` and `&` for mostly the same reasons mentioned by @iArnold and @greggirwin.
    Some might argue that `#` is already overused, but I think the best time to overuse something is when it already fits well with where it's being used already: One reason [I've suggested this syntax before](https://gitter.im/red/red?at=5666c132b692dc8f48f4e98f) (as @greggirwin and @dockimbel have), is that it fits neatly with the way this syntax already works for `binary!`:
    `2#10010000 = 16#90` just as `2#{10010000} = 16#{90}`.
    Anyway, I think the fewer extra symbols needed, the better. Besides, we might want to use `&` for something else later.
    
    In addition to this, I've suggested the option to use a single digit before the `#` to specify each base:
    
    ```
      2#10010000
    = 8#220
    = A#144 = 10#144
    = C#100 = 12#100
    = G#90  = 16#90  = 0#90
    = W#4G  = 32#4G  ; (triacontakaidecimal)
    ```
    
    This is so as not to be necessarily biassed by base 10. Until it's totally ruled out, I'll still gently carry a torch for this idea since I don't expect anyone else to. I understand that it would make Red unique (as far as I know) and that non-mathematically minded people probably wouldn't see the point.
    Of course, I would also want this to work for `binary!` (eg. G#{90} = 16#{90}). However the allowed bases for `binary!` should probably only be `2`, `4`, and `G` (or `16`).
    
    @greggirwin, Rather than necessarily being equivalent to `16#` I hope that `0#` simply represents the default radix used in this syntax. `binary!` represents its default radix (also 16) by having no digits preceding the `#`, but as you've already pointed out, number types (such as `integer!` and `float!`) can't do this because that syntax is reserved for `issue!`. So we use `0`, which is available because base 0 is useless as a positional number system. I hope then, that `0#{90} = #{90}` for `binary!` also.
    This implies that one would be able to change the default base which `0#` represents for numbers using a variable in `system/options/` (as can be done for `binary!` in `system/options/binary-base`), as long as it's understood that this does not affect numbers when they don't use this syntax (eg. `144`).
    The default for this default base should be 16 for numbers in this syntax, just as it is for `binary!`. 10 wouldn't be an efficient choice because numbers can already be represented in base 10 when this syntax isn't used at all.
    
    However, if the sole reason for `0#` being equivalent to `16#` were to save a single character when writing in hexadecimal, this is also achieved with `G#` without it changing meaning when the default meaning of `0#` is changed... if my idea were implemented.
    
    Keep in mind that once a number type (such as `integer!` or `float!`) is stored in memory, any specification of the radix is immediately lost. Conversely, I hope that the upcoming `bignum!` will preserve the radix, assuming that its use and implementation will be what I'm thinking of. Perhaps this will be a use for the `8&220` syntax after all, but I can think of other ways to do it.
    
    I think careful thought needs to be put into how things like the syntax of all these future types will fit together, so that Red doesn't get bloated by just tacking ideas on.
    
    Sorry to add so much off-topic opinion to an already closed issue. Should this discussion be continued elsewhere?

--------------------------------------------------------------------------------

On 2016-06-19T16:03:12Z, greggirwin, commented:
<https://github.com/red/red/issues/1079#issuecomment-227005063>

    Good point about moving the chat, since this issue is closed. Still, better to have notes somewhere than nowhere. 
    
    If we want to parallel binary!, 64# support should be there, which doesn't work for your letter-as-base syntax. That doesn't grab me right off anyway,because you have to convert the base notation in your head first, then apply it. I also have armloads of torches I carry, and lighting more all the time. :^) OTOH, 64# is never used for numbers that I've seen, so should just not be allowed.
    
    One concern I have with overloading # this way is that we need to make it _very_ clear in the docs that the automagic issue! handling of string versus word mapping (under discussion) and based-integers (they need a name, too) are **completely** different beasts, where the former maintain the characters in the symbol and the latter convert them to a fixed size integer value.

--------------------------------------------------------------------------------

On 2016-06-20T06:23:44Z, dockimbel, commented:
<https://github.com/red/red/issues/1079#issuecomment-227059198>

    It is fine to discuss it here, as we linked an item in our Trello todo list to this ticket for reference.

--------------------------------------------------------------------------------

On 2018-11-25T15:50:07Z, meijeru, commented:
<https://github.com/red/red/issues/1079#issuecomment-441450244>

    Isn't all of this now superseded by the new lexical form for the `hex!` literals?

