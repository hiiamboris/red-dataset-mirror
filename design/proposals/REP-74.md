
#74: WISH: VID to collect multiple `with [..]` blocks into one instead of overriding
================================================================================
Issue is open, was reported by hiiamboris and has 54 comment(s).
<https://github.com/red/REP/issues/74>

Helpful when generating layouts dynamically (and overriding doesn't make sense anyway).
Use case: https://gitlab.com/hiiamboris/red-elastic-ui/-/blob/05037ffde24c65261c58e0811319c83ee0257b4f/elasticity.red#L68 where I could just add `with [anchors: ...]`, but instead I have to construct a full VID parser that will find out where each face definition starts and ends, find user provided `with [..]` block or decide where to insert a new one, handle custom styles, etc.
In `layout` source it could have been a one-liner.


Comments:
--------------------------------------------------------------------------------

On 2020-05-14T20:08:34Z, greggirwin, commented:
<https://github.com/red/REP/issues/74#issuecomment-628860640>

    I understand this to mean you want, e.g., these two to be equivalent:
    ```
    view [
    	field
    		with [size: 200x30]
    		with [text: "Hey!"]
    ]
    
    view [
    	field with [size: 200x30 text: "Hey!"]
    ]
    ```
    

--------------------------------------------------------------------------------

On 2020-05-14T20:11:10Z, hiiamboris, commented:
<https://github.com/red/REP/issues/74#issuecomment-628861904>

    Yes, thanks for the illustration ;)

--------------------------------------------------------------------------------

On 2020-05-14T20:18:38Z, greggirwin, commented:
<https://github.com/red/REP/issues/74#issuecomment-628865343>

    OK, what should happen with nested series and compound values?
    ```
    view [
    	button extra [a: 1 b: 2] with [extra: [c: 3]]
    ]
    ```
    Are they replaced or extended recursively? I have this same question for myself, from tinkering on `combine/merge` (though simply making `append` work universally also crossed my mind), and whether it needs a `/deep` option.

--------------------------------------------------------------------------------

On 2020-05-14T20:20:42Z, greggirwin, commented:
<https://github.com/red/REP/issues/74#issuecomment-628866293>

    Nothing jumps out at me as being problematic with it, and it is another behavior that we need to think about generally, for declarative dialects. @rebolek might have thoughts, as he's done a lot with styles and such. 

--------------------------------------------------------------------------------

On 2020-05-14T20:30:58Z, greggirwin, commented:
<https://github.com/red/REP/issues/74#issuecomment-628870955>

    `Extra` should probably match the behavior, if it's changed. `Draw`, `font`, and `para`, not sure. `Init`, probably, but `data` ...doesn't make sense for single values, but for something like `table`, yeah. `React` already works this way.
    ```
    view [
    	f-t: text 400 ""
    		react [append face/text f-f1/text]
    		react [append face/text f-f2/text]
    	return
    	f-f1: field "A"
    	f-f2: field "B"
    ]
    ```

--------------------------------------------------------------------------------

On 2020-05-14T20:31:39Z, greggirwin, commented:
<https://github.com/red/REP/issues/74#issuecomment-628871266>

    This definitely ripples out.

--------------------------------------------------------------------------------

On 2020-05-14T20:34:01Z, hiiamboris, commented:
<https://github.com/red/REP/issues/74#issuecomment-628872303>

    > 
    > 
    > OK, what should happen with nested series and compound values?
    > 
    > ```
    > view [
    > 	button extra [a: 1 b: 2] with [extra: [c: 3]]
    > ]
    > ```
    > 
    > Are they replaced or extended recursively? I have this same question for myself, from tinkering on `combine/merge` (though simply making `append` work universally also crossed my mind), and whether it needs a `/deep` option.
    
    Oh that's easy. What happens here?
    ```
    object [
       a: [1 2]
       a: [3 4]
    ]
    ```
    Replacement. Same I expect for `with`: collect the block then evaluate it. If some things replace other things, this is what the coder wanted (otherwise he would have used `append`). Keep it simple approach ;)

--------------------------------------------------------------------------------

On 2020-05-14T20:36:10Z, hiiamboris, commented:
<https://github.com/red/REP/issues/74#issuecomment-628873335>

    > `Extra` should probably match the behavior, if it's changed. `Draw`, `font`, and `para`, not sure. `Init`, probably, but `data` ...doesn't make sense for single values, but for something like `table`, yeah. `React` already works this way.
     
    We don't know what's in `extra`. Maybe a block, maybe an object, maybe a string, maybe an integer. I wouldn't touch it without a solid use case.
    
    `init`, as a block - maybe should be extended as well. I think I agree.

--------------------------------------------------------------------------------

On 2020-05-14T20:51:45Z, greggirwin, commented:
<https://github.com/red/REP/issues/74#issuecomment-628880268>

    The current behavior matches your `object` example. :^) That makes things consistent and easy to reason about, even if it makes your use case a bit more painful. 

--------------------------------------------------------------------------------

On 2020-05-14T20:52:54Z, hiiamboris, commented:
<https://github.com/red/REP/issues/74#issuecomment-628880750>

    But I can't write `append with [..]` inside VID block ;)

--------------------------------------------------------------------------------

On 2020-05-14T20:54:26Z, greggirwin, commented:
<https://github.com/red/REP/issues/74#issuecomment-628881459>

    First, can we agree that (`react` aside), it's consistent with other things in Red?

--------------------------------------------------------------------------------

On 2020-05-14T20:57:41Z, greggirwin, commented:
<https://github.com/red/REP/issues/74#issuecomment-628882940>

    Next, is modifying the VID spec best, given that it's designed for humans and has a lot of flexibility? Is it possible to work against the rendered face tree instead, where things are more regular?

--------------------------------------------------------------------------------

On 2020-05-14T20:59:44Z, greggirwin, commented:
<https://github.com/red/REP/issues/74#issuecomment-628883847>

    Then the call becomes `view elastic layout`, which is nice.

--------------------------------------------------------------------------------

On 2020-05-14T21:00:06Z, greggirwin, commented:
<https://github.com/red/REP/issues/74#issuecomment-628884009>

    Just thinking in real time.

--------------------------------------------------------------------------------

On 2020-05-14T21:02:43Z, hiiamboris, commented:
<https://github.com/red/REP/issues/74#issuecomment-628885173>

    I'm just offering even more flexibility, and simply because the current behavior holds no value anyway ;)
    Like, react isn't the only thing. VID also collects face's actors from all around (from style template, from view/options and /with). I will need to check the code to tell all the cases.

--------------------------------------------------------------------------------

On 2020-05-14T21:07:28Z, hiiamboris, commented:
<https://github.com/red/REP/issues/74#issuecomment-628887213>

    > Is it possible to work against the rendered face tree instead, where things are more regular?
    
    In some cases sure. I can make `elastic` call `layout` internally and use `foreach-face`. But that reduces the flexibility of it, no? What if this VID block is to be combined with other one? Or passed to another process (e.g. a worker in my View test system)?

--------------------------------------------------------------------------------

On 2020-05-14T21:10:24Z, greggirwin, commented:
<https://github.com/red/REP/issues/74#issuecomment-628888393>

    I mean to use the result of `layout`, always. If the user wants to combine VID blocks, do that first. Processors like `elastic` all come later. Otherwise, as you say, they all need to understand VID, rather than just a tree of faces.

--------------------------------------------------------------------------------

On 2020-05-14T21:13:58Z, hiiamboris, commented:
<https://github.com/red/REP/issues/74#issuecomment-628890028>

    But the layout processor creates faces in the current process. I can't pass this tree over. Not that I want, but I'm simply showing that it's a limited approach.

--------------------------------------------------------------------------------

On 2020-05-14T21:16:52Z, greggirwin, commented:
<https://github.com/red/REP/issues/74#issuecomment-628891227>

    > But the layout processor creates faces in the current process. I can't pass this tree over.
    
    I don't know what you mean there.

--------------------------------------------------------------------------------

On 2020-05-14T21:22:30Z, hiiamboris, commented:
<https://github.com/red/REP/issues/74#issuecomment-628893740>

    ```
    >> layout [a: base]
    == make object! [
        type: 'window
        offset: none
        size: 100x100
        text: none
      ...
    >> ? a
    A is an object! with the following words and values:
         type             word!         base
         offset           pair!         10x10
         size             pair!         80x80
         text             none!         none
         image            none!         none
         color            tuple!        128.128.128
         menu             none!         none
         data             none!         none
         enabled?         logic!        true
         visible?         logic!        true
         selected         none!         none
         flags            none!         none
         options          block!        length: 6  [style: base vid-align: top at-offset: none]
         parent           object!       [type offset size text image color menu data enabled? visib...
         pane             none!         none
         state            none!         none
         rate             none!         none
         edge             none!         none
         para             none!         none
         font             none!         none
         actors           none!         none
         extra            none!         none
         draw             none!         none
         on-change*       function!     [word old new /local srs same-pane? f saved]
         on-deep-change*  function!     [owner word target action new index part]
    ```
    Faces are created, set words are set locally in the current interpreter. Can't mold it and pass over anymore after a call to `layout` ;)

--------------------------------------------------------------------------------

On 2020-05-14T21:29:09Z, hiiamboris, commented:
<https://github.com/red/REP/issues/74#issuecomment-628896506>

    I thought a bit more and decided I can't work on faces tree anyway. I have anchors in the VID block and I could remove them and then add them to the created faces, but to know which anchor in VID corresponds to which face in the tree I will need something more than just a VID layout parser. No idea how to do that.

--------------------------------------------------------------------------------

On 2020-05-14T21:33:15Z, greggirwin, commented:
<https://github.com/red/REP/issues/74#issuecomment-628898214>

    Indeed, this is a case where dealing with VID seems necessary. It may be possible to do it with the faces, but will likely be a lot less elegant.
    
    Maybe @dockimbel or @qtxie will weigh in. The extra work in `elastic` doesn't seem toooooo onerous, but then I didn't have to figure it out. :^)

--------------------------------------------------------------------------------

On 2020-05-14T21:54:26Z, hiiamboris, commented:
<https://github.com/red/REP/issues/74#issuecomment-628906610>

    It's not the line count, it's the thought count that matters ;)

--------------------------------------------------------------------------------

On 2020-05-15T00:03:19Z, greggirwin, commented:
<https://github.com/red/REP/issues/74#issuecomment-628948485>

    > I'm just offering even more flexibility, and simply because the current behavior holds no value anyway ;) Like, react isn't the only thing. VID also collects face's actors from all around
    
    Consistency is a value, but I get what you mean. Default actions don't append but, as you note, other actors are combined into the `actors` object.
    ```
    >> view [button [print 1] [print 2]]
    2
    ```
    Coming back to generality, how do users know, in cases like this, when values are replaced and when they are collected. That's a good thing to think about.

--------------------------------------------------------------------------------

On 2020-05-24T11:09:05Z, hiiamboris, commented:
<https://github.com/red/REP/issues/74#issuecomment-633214646>

    > The extra work in elastic doesn't seem toooooo onerous, but then I didn't have to figure it out. :^)
    
    FYI I already fixed 2-3 bugs in there. And who knows how many more are to come? 

--------------------------------------------------------------------------------

On 2020-07-07T19:59:21Z, nedzadarek, commented:
<https://github.com/red/REP/issues/74#issuecomment-655094793>

    > OK, what should happen with nested series and compound values?
    > 
    > ```
    > view [
    > 	button extra [a: 1 b: 2] with [extra: [c: 3]]
    > ]
    > ```
    > 
    > Are they replaced or extended recursively? I have this same question for myself, from tinkering on `combine/merge` (though simply making `append` work universally also crossed my mind), and whether it needs a `/deep` option.
    
    Ok, but is this created dynamically (e.g. by some program) or did someone write this instead of simple `extra [a: 1 b: 2 c: 3]`?
    In the 2nd case I would say it is bad writing style and should be discouraged (not sure whenever or not it would be allowed).
    In the 1st case I can see its usages. Let's say  I made a style that use extra for example `extra [a: 1 b: 2]` then user pass me `extra [ b: 42]`. I don't want `a` to be deleted. 
    
    I think blocks should be just appended and maps/objects should be merged (e.g. `#(a: 1 b: 2) + #(b: 4 c: 6) => #(a: 1 b: 4 c: 6)`). blocks & maps/objects on the other hand - I don't know.
    Maybe with extra keyword, something like [this](https://github.com/nedzadarek/extra_put_red/blob/master/extra_put.red)(I've made it 2 years ago).

--------------------------------------------------------------------------------

On 2020-07-08T23:44:40Z, greggirwin, commented:
<https://github.com/red/REP/issues/74#issuecomment-655813884>

    It's always nice when there's a way to extend and work around something, even if not elegantly. In Red, you can almost always do this, but higher level dialects, libs, and modules may be specifically constrained on purpose. It's also a really good point to think about human versus computer generated inputs. Making it easy to generate code never hurts, but we don't want to add confusion at the human (more common) level, when a generator can more easily handle getting all the details right, even if it's more work for the author.
    
    As we design and redesign, strive for consistency...right after usability. That means in Red itself (append/extend/combine/merge, series/maps/objects), and modules or dialects. Minimize cognitive load when possible.

