
#4661: WISH: add string! in draw dialect and simply ignore them
================================================================================
Issue is open, was reported by luce80 and has 28 comment(s).
[type.wish] [status.reviewed]
<https://github.com/red/red/issues/4661>

I wish `strings!`s be added to `draw` dialect and simply be ignored when parsing them. This way they can act as comments and also as placeholders and could be placed everywhere. This is already implemented in Rebol2 and let you do something like:
```
draw [pen red line 0x0 "end" 0x0]
...
face/effect/draw/("end"): event/offset
```
Note that `get-words!` in current draw implementation do not behave like this.


Comments:
--------------------------------------------------------------------------------

On 2020-10-01T13:59:45Z, dockimbel, commented:
<https://github.com/red/red/issues/4661#issuecomment-702155776>

    Strings are not the right types to be used as markers. Draw dialect already allows set-words to be used for that:
    ```
    draw [pen red line 0x0 end: 0x0]
    ...
    face/effect/draw/end: event/offset
    ```
    
    If comments are needed, why not simply use regular comments which are way cheaper than strings?

--------------------------------------------------------------------------------

On 2020-10-03T17:54:55Z, luce80, commented:
<https://github.com/red/red/issues/4661#issuecomment-703140615>

    It is true that strings are not the right types to be used as markers, but they are unharmful, they could be used as "permanent" comments that do not get erased by a `load mold` and IMHO adding them is simple, useful and backward compatible.

--------------------------------------------------------------------------------

On 2020-10-08T15:27:45Z, dockimbel, commented:
<https://github.com/red/red/issues/4661#issuecomment-705646835>

    Strings are heavy to store and process in memory compared to words or real comments. The concept of "permanent comment" is vague, and nobody ever seemed to need that so far. If you want to introduce such concept into the language or one of the dialect, you need to write down a sound rationale for it. I see no good reason to support them in this case.
    
    @greggirwin What do you think about that?

--------------------------------------------------------------------------------

On 2020-10-12T04:36:39Z, endo64, commented:
<https://github.com/red/red/issues/4661#issuecomment-706853889>

    @dockimbel `set-word!`s _in between_ doesn't seem to work:
    
    ```
    i: make image! 100x100
    ;these two works
    draw i [pen red line 0x0 0x0 here:]
    draw i [pen red here: line 0x0 0x0]
    
    ;these two don't work
    draw i [pen red line 0x0 here: 0x0]
    draw i [pen red line here: 0x0 0x0]
    ```
    
    I'm not sure if it was working before?

--------------------------------------------------------------------------------

On 2020-10-12T09:43:37Z, 9214, commented:
<https://github.com/red/red/issues/4661#issuecomment-707009722>

    @endo64 in-between Draw commands, not their elements.

--------------------------------------------------------------------------------

On 2020-10-14T21:32:17Z, greggirwin, commented:
<https://github.com/red/red/issues/4661#issuecomment-708671786>

    I agree with @dockimbel that strings are not the right choice here. If you have large draw blocks to comment, comments are probably a good choice. Strings already have a mean, as data for text commands. If you use them for comments, then you have to be aware of what command is in effect, and adjust their position. e.g. you can't use them as a leading comment for large text.
    ```
    view [
        base draw [
            text 10x10 "big text coming" {hello! and welcome...
            to the new draw example
            }
        ]
    ]
    ```

--------------------------------------------------------------------------------

On 2020-10-14T21:49:10Z, 9214, commented:
<https://github.com/red/red/issues/4661#issuecomment-708679035>

    I think @luce80's original wish is more concerned with ability to access sections of Draw block on a fine-grained level and to name the elements. IMO `set-word!`s serve this purpose just fine, albeit they can only be placed between commands, which should be relaxed.
    
    The question is: how Draw should process them? Should it simply ignore them, or should it set them to the remainder of the series? In the latter case, should the words itself be removed from a Draw block, or should they stay?

--------------------------------------------------------------------------------

On 2020-10-14T22:21:57Z, greggirwin, commented:
<https://github.com/red/red/issues/4661#issuecomment-708691498>

    Use cases will help. I know I've used markers quite a bit at times, but you run into issues of draw blocks that are "chunks" of repeating sections, and what do you do about references there, where a single name makes sense for one chunk, but needs to numbered (or processed by sub-block) in an entire draw block. And how much of this do we put into `draw` versus how much we build at the mezz level with pre-processing.

--------------------------------------------------------------------------------

On 2020-10-15T12:18:34Z, 9214, commented:
<https://github.com/red/red/issues/4661#issuecomment-709270436>

    One idea is to make naming relative rather than absolute, by aliasing integer indices with symbols. Roughly speaking:
    ```red
    set [center radius][2 3]
    
    circle: [circle 50x50 100]
    circle/:radius: 30
    circle/:center: 10x10
    ```
    IIRC @dockimbel had some ideas in this regard, but I am a bit fuzzy on details at this point.

--------------------------------------------------------------------------------

On 2020-10-15T17:55:18Z, greggirwin, commented:
<https://github.com/red/red/issues/4661#issuecomment-709492151>

    I did something like that, at the mezz level, in a couple things. Resize-image and Bubbles. 

--------------------------------------------------------------------------------

On 2020-10-17T16:41:14Z, luce80, commented:
<https://github.com/red/red/issues/4661#issuecomment-711042785>

    My use case in R2 is http://www.rebol.org/view-script.r?script=color-requester.r . But even without this use case, IMHO adding them is simple (simply ignore them (apart for text !!)), unharmful, useful and **backward compatible**. Any other similar enhancement is also welcome of course, I am not fixed on string!s.

--------------------------------------------------------------------------------

On 2020-10-18T20:06:42Z, greggirwin, commented:
<https://github.com/red/red/issues/4661#issuecomment-711414871>

    Thanks @luce80. That's helpful.
    
    If we want more general markers, we can either relax the rules as @9214 noted, or use another type. The only other word types are issue! and refinement!, and issues are used for hex colors as well, so that leaves refinements. It's a _little_ odd to use them this way. Where it gets ugly is incorporating them into paths. e.g.
    ```
    >> blk: [a b /c [d e /f [g h] ff] cc]
    == [a b /c [d e /f [g h] ff] cc]
    >> blk/c
    == none
    >> blk/(/c)
    == [d e /f [g h] ff]
    >> blk/(/c)/(/f)
    == [g h]
    ; Or with indirection
    >> key-c: /c
    == /c
    >> blk/:key-c/(/f)
    == [g h]
    ```
    
    @dockimbel @9214 @endo64 what are the impacts of relaxing set-word! use, and would a possible middle-ground be to extend their support to sub-blocks that follow them?

--------------------------------------------------------------------------------

On 2020-10-18T21:02:44Z, 9214, commented:
<https://github.com/red/red/issues/4661#issuecomment-711422914>

    The way Draw is implemented ATM, `set-word!`s need to be preprocessed and set to series' index, otherwise the core loop needs to be rewritten and include `TYPE_SET_WORD` branch for every case, which is quite costly.
    
    Restricting their usage to sub-blocks would require to keep the context: "if it's a block and it was preceded by `set-word!`", or "if it's a `set-word!` followed by a `block!`".
    
    The main design question IMO is if such markers should be internal (e.g. abovementioned `refinement!`) or external (e.g. integer/symbol aliases) to the Draw block: the latter seems more general and not dialect-specific, but requires a new language feature.

--------------------------------------------------------------------------------

On 2020-10-19T04:10:18Z, greggirwin, commented:
<https://github.com/red/red/issues/4661#issuecomment-711512405>

    Thanks @9214. Sounds to heavy to change the use of set-words. As `draw` use grows, and is leveraged by more people, we have to keep performance in mind. e.g. charting stuff Bolek and Harald are working on.
    
    On refinements, is there any other use case we can think of where they might be added to the `draw` dialect as a new feature? If not, the two issues are the ugliness of accessing them and breaking code that uses them as ad-hoc keys if we do fine a use case for them. Symbol aliases also seem too heavy a change for this, and more maintenance going forward. And how do we avoid naming conflicts while keeping symbols precise? It's a bit of worrying about a problem we don't have yet, but if `draw` just ignores refinements, it's more of an "it's all just data" view.

