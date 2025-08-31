
#4211: Deep reactor works improperly with dynamically created faces
================================================================================
Issue is closed, was reported by DVL333 and has 42 comment(s).
<https://github.com/red/red/issues/4211>

Execute this code:
```
o1: deep-reactor [a: [1]]
lay: [
    button "Press" [o1/a/1: o1/a/1 + 1]
    text react [face/text: form o1/a/1]
]
repeat i 2 [
    append lay [
        text react [face/text: form o1/a/1]
    ]
]
view lay
```
Pressing on the button will change the first and the third text faces, but not the second -  the text on all of the text faces must be changed.
BTW, if execute `view copy/deep lay` it works fine.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-Dec-2019/15:17:11+03:00 commit #28ee555
```


Comments:
--------------------------------------------------------------------------------

On 2019-12-30T11:14:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/4211#issuecomment-569649547>

    This is not a bug. It happens because you do not copy your `[face/text: form o1/a/1]` block while appending. As a result, first `react` binds it to face-2, second `react` binds it (the same block!) to face-3, so in the end you don't have a piece of code that would modify face-2 and a mess in reactivity.
    
    Fix it by `append lay copy/deep [..]`

--------------------------------------------------------------------------------

On 2019-12-30T13:15:26Z, 9214, commented:
<https://github.com/red/red/issues/4211#issuecomment-569675649>

    @DVL333 consider confirming alleged bugs on Gitter before reporting them. See [here](https://github.com/red/red/wiki/%5BDOC%5D-Why-you-have-to-copy-series-values) and [here](https://github.com/red/red/wiki/%5BDOC%5D-Reactivity) on why copying reactive expression is necessary in your case.

--------------------------------------------------------------------------------

On 2019-12-30T14:04:22Z, DVL333, commented:
<https://github.com/red/red/issues/4211#issuecomment-569687250>

    Ok. Then more complicated example (originally, I just tried to simplify - and did it unsuccesful):
    ```
    o1: deep-reactor [a: [1 2]]
    lay: [
        button "Press" [o1/a/1: o1/a/1 + 1 o1/a/2: o1/a/2 + 1]
    ]
    repeat i 2 [
        append lay compose/deep [
            text react [ii: (i) face/text: form o1/a/:ii]
        ]
    ]
    view lay
    ```
    The behavior is the same. But I'm not sure that in this case `react` blocks are the same also - they have different contend after performing `compose`.

--------------------------------------------------------------------------------

On 2019-12-30T14:21:07Z, 9214, commented:
<https://github.com/red/red/issues/4211#issuecomment-569691529>

    @DVL333 have you read @hiiamboris's explanation and links I gave to you? It's the exact same issue. Paths inside reactive expression still refer to the same reactive sources, so you need to use `copy/deep`.

--------------------------------------------------------------------------------

On 2019-12-30T14:25:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/4211#issuecomment-569692805>

    I think he's right this time. Compose/deep copies. Code is valid.
    Modified example (just added probe):
    ```
    o1: deep-reactor [a: [1 2]]
    lay: [
        button "Press" [o1/a/1: o1/a/1 + 1 o1/a/2: o1/a/2 + 1]
    ]
    repeat i 2 [
        append lay compose/deep [
            text react [ii: (i) probe face/text: form o1/a/:ii]
        ]
    ]
    view lay
    ```
    shows that reactivity is working as expected (two facets are updated twice). But first face is not updated automatically for some reason.
    
    It's a View bug IMO.
    For whatever reason, `FACE/PARENT is a none! value: none` sometimes:
    ```
    o1: deep-reactor [a: [1 2]]
    lay: [
        button "Press" [o1/a/1: o1/a/1 + 1 o1/a/2: o1/a/2 + 1]
    ]
    repeat i 2 [
        append lay compose/deep [
            text react [ii: (i) probe face/text: form o1/a/:ii ? face/parent]
        ]
    ]
    view lay
    ```
    This needs an investigation :)

--------------------------------------------------------------------------------

On 2019-12-30T14:36:14Z, 9214, commented:
<https://github.com/red/red/issues/4211#issuecomment-569695476>

    @hiiamboris you're jumping to conclusions. `compose` (with or without `/deep`) ignores paths.
    ```red
    >> foo: 'a/b/c
    == a/b/c
    >> bar: reduce [foo]
    == [a/b/c]
    >> reverse first compose/deep bar
    == c/b/a
    >> foo
    == c/b/a
    
    >> foo: [a b c]
    == [a b c]
    >> bar: reduce [foo]
    == [[a b c]]
    >> reverse first compose/deep bar
    == [c b a]
    >> foo
    == [a b c]
    ```
    
    So, like I said:
    ```red
    o1: deep-reactor [a: [1 2]]
    lay: [
        button "Press" [o1/a/1: o1/a/1 + 1 o1/a/2: o1/a/2 + 1]
    ]
    repeat i 2 [
        append lay compose/deep [
            text react [ii: (i) probe face/text: form o1/a/:ii]
        ]
    ]
    view copy/deep lay
    ```
    
    Or `copy/deep compose/deep`, both will do.

--------------------------------------------------------------------------------

On 2019-12-30T14:50:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/4211#issuecomment-569699340>

    You're right bro :)
    `face` in both `face/text` expressions is bound to the 2nd face object.

--------------------------------------------------------------------------------

On 2019-12-30T15:39:58Z, DVL333, commented:
<https://github.com/red/red/issues/4211#issuecomment-569713330>

    @hiiamboris 
    The question is, is it correct, that both `face/text` expressions is bound to the 2nd face object? Or issue? 
    As i wrote previously, if we don't use `copy/deep` in process of construction, BUT use `view copy/deep lay` for visualisation, it works as expected (by me). It seems strange that copying of a seria (i mean `lay` in example) change its behaviour.

--------------------------------------------------------------------------------

On 2019-12-30T16:02:05Z, 9214, commented:
<https://github.com/red/red/issues/4211#issuecomment-569718694>

    @DVL333 I'm repeating myself twice here - have you _read_ the wiki pages I gave to you? Using `copy/deep` in either place ensures that reactive formula is not shared and is unique on each iteration, and [this](https://github.com/red/red/wiki/%5BDOC%5D-Reactivity#making-reactors) section covers that specific case.

--------------------------------------------------------------------------------

On 2019-12-30T16:46:33Z, DVL333, commented:
<https://github.com/red/red/issues/4211#issuecomment-569730505>

    Vladimir, it seems that you don't read what i write or don't want to understand.
    The problem is not in reactive links and paths, but in `face` -  @hiiamboris is right. Your article doesn't cover this case, because it mentions only about `copy/deep` in context of MAKING reactor.
    And second.
    ```
    o1: deep-reactor [a: [1 2]]
    lay: [
        button "Press" [o1/a/1: o1/a/1 + 1 o1/a/2: o1/a/2 + 1]
    ]
    repeat i 2 [
        append lay compose/deep [
            text react [ii: (i) face/text: form o1/a/:ii]
        ]
    ]
    view copy/deep lay
    ```
    works properly (I said it since begining). And it looks rather strange, because in this case `lay` is not equal `copy/deep lay` in terms of its properties and behavior. It's only I wanted to say in my previous post.

--------------------------------------------------------------------------------

On 2019-12-30T19:57:41Z, 9214, commented:
<https://github.com/red/red/issues/4211#issuecomment-569779588>

    @DVL333 it seems that _you_ don't read what we write or don't want to understand.
    
    `face` refers to the last face because the path that contains it (`face/text`) is **not copied**, but reused on each iteration (re-read [@hiiamboris' message](https://github.com/red/red/issues/4211#issuecomment-569649547)). `copy/deep` ensures that each path in each formula is unique, doesn't matter where you put it as long as it deeply copies the reactive formula - that's what I said, thrice at this point. `compose/deep` plays no role here, because it doesn't copy paths at all, only blocks and parens. 
    
    > I don't know, cover you article this case or not, because it's not obvious from it
    
    I'm literally quoting from the wiki page and adding emphasis:
    
    > ... If you have the same spec, but it appears multiple times as literal data, each is unique. If you use a word to refer to the same spec block _(or reuse the same block again and again)_, **that same data is used. This is important in the reactivity subsystem.**
    
    > ... the way to produce the behavior from the first example is **to use `copy/deep` on shared specs** you use to make reactors. 
    
    ---
    
    > And it looks rather strange
    
    How can it be strange if that's the expected behavior? If you `copy/deep` a series, you get a series different from the one that you copied, with all sub-series inside it (including paths) being unique.

--------------------------------------------------------------------------------

On 2019-12-30T20:50:20Z, DVL333, commented:
<https://github.com/red/red/issues/4211#issuecomment-569792758>

    @9214 
    1)  @hiiamboris' message was about **block**, not about path. Re-read. It's why I wrote the second example.
    2) Your article not contain any information about copying or not copying paths - it almost doesn't contain this word. This is absolutely new information from you.
    3) Your quoting  from the wiki page is about **blocks**, not about paths. 
    > If you use a word to refer to the same **spec block (or reuse the same block again and again)**, that same data is used. This is important in the reactivity subsystem.
    
    And about making reactors, but not targets.
    > ... the way to produce the behavior from the first example is to use copy/deep on shared specs you use **to make reactors**.
    4) It looks strange, because `copy/deep` seems like improving original block - original paths weren't independent between each other, but become after copying.
    
    So it's the reason to improve wiki article and add your information instead of accusing your opponent of not being able to read. 
    
    BTW, it's good example that confirm your exclusive information about paths (it works as expected):
    ```
    o1: deep-reactor [a: [1 2]]
    lay: [
        button "Press" [o1/a/1: o1/a/1 + 1 o1/a/2: o1/a/2 + 1]
    ]
    repeat i 2 [
        append lay compose/deep [
            text react [ii: (i) set in face 'text form o1/a/:ii]
        ]
    ]
    view lay
    ```

--------------------------------------------------------------------------------

On 2019-12-30T21:25:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/4211#issuecomment-569800754>

    @DVL333 Paths are a tricky subject ☻ You have to copy them as well (unless you know exactly what you're doing), because internally paths are blocks. We all forget that once in a while, but it's a fair price for Red's expressiveness ;)

--------------------------------------------------------------------------------

On 2019-12-30T21:29:59Z, greggirwin, commented:
<https://github.com/red/red/issues/4211#issuecomment-569801826>

    First, thanks to all for working through this.
    
    Second, everyone please try to refrain from presuming others don't read what you wrote, or are being willfully problematic. These things generally boil down to misunderstanding.
    
    Finally, if any additional info could be added to the reactivity wiki page, to help others, that would be great. e.g. notes about `compose` vs `copy/deep` and remembering that paths are a type of block.

--------------------------------------------------------------------------------

On 2019-12-30T21:40:33Z, 9214, commented:
<https://github.com/red/red/issues/4211#issuecomment-569804251>

    @hiiamboris it's not about paths or blocks, or even reactivity, it's a basic misunderstanding of how `copy/deep` works, what _is_ a series, and what series _is_.
    
    The formula is a series (doesn't matter of what datatype), so when you append it X number of times to another block, you get X time _the same_ series. If you want them to be unique, then you need to copy. Wiki page explicitly warns about shared specs/formulas and mentions the usage of `copy/deep`, also linking to a wiki page with related concepts.
    
    > Finally, if any additional info could be added to the reactivity wiki page, to help others, that would be great. e.g. notes about compose vs copy/deep and remembering that paths are a type of block.
    
    That's completely unrelated to reactivity.

--------------------------------------------------------------------------------

On 2019-12-30T21:53:32Z, hiiamboris, commented:
<https://github.com/red/red/issues/4211#issuecomment-569807124>

    Let's add an small example with paths to the reactivity page? Maybe with a link to https://github.com/red/red/wiki/[DOC]-Path!-notes for more details. I don't think it will ever be obvious to beginners that they have to copy paths, and even then it's a topic worth reminding of.

--------------------------------------------------------------------------------

On 2019-12-30T22:08:51Z, 9214, commented:
<https://github.com/red/red/issues/4211#issuecomment-569810610>

    @hiiamboris IMO that's an implementation detail not worth mentioning. **(1)** Paths are series, and basic series concepts apply to them in full force, that's it.
    
    I'd rather add a link to [official docs](https://doc.red-lang.org/en/reactivity.html) and do a quick recap of the basic terminology ([Glossary](https://doc.red-lang.org/en/reactivity.html#_glossary)), reminding that path values are _reactive sources_, _reactive expression_ is that which contains at least one reactive source, and that _reactor_ is referenced by a word at the head of the path, which, again, is a series.
    
    If **(1)** is well understood, then the fact that you need to copy reactive source/expression in order to "distribute" it across different relations is a given.

--------------------------------------------------------------------------------

On 2019-12-30T22:38:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/4211#issuecomment-569816919>

    Well I get the OP's point too.
    What concerns me here is that `react` is not symmetric with actors, which do copy/deep their definition:
    ```
    lay: []
    repeat i 3 [
        append lay [button "0" [face/text: form 1 + load face/text]]
    ]
    view lay
    ```
    See, in VID `react [..]` and `on-click [..]` look the same. So it's natural to expect them to follow the same rules. Which makes me think if it's worth making VID's `react` keyword do a copy/deep before calling `react` function. That way we both make VID a bit more user-friendly and still remain able to shoot ourselves in the foot.

--------------------------------------------------------------------------------

On 2019-12-30T23:14:01Z, 9214, commented:
<https://github.com/red/red/issues/4211#issuecomment-569823616>

    @hiiamboris well, they are deeply copied because functions do a deep copy of their bodies on creation, and actors are just function bodies.
    
    ```red
    >> body: [append [] 'bump]
    == [append [] 'bump]
    >> foo: does body bar: does body
    == func [][append [] 'bump]
    >> loop 2 [foo] loop 2 [bar]
    == [bump bump]
    >> same? body-of :foo body-of :bar
    == false
    ```

--------------------------------------------------------------------------------

On 2019-12-30T23:19:13Z, greggirwin, commented:
<https://github.com/red/red/issues/4211#issuecomment-569824594>

    > ...it's natural to expect them to follow the same rules. Which makes me think if it's worth making VID's react keyword do a copy/deep before calling react function. 
    
    This makes sense to me, but @dockimbel needs to make that call. I don't see a downside at the moment.

--------------------------------------------------------------------------------

On 2019-12-31T06:59:08Z, dockimbel, commented:
<https://github.com/red/red/issues/4211#issuecomment-569877021>

    As the `react` block argument is rebound during [VID processing](https://github.com/red/red/blob/master/modules/view/VID.red#L84), it seems more robust to `copy/deep` it internally as suggested by @hiiamboris.

