
#53: Rename view/options to view/with
================================================================================
Issue is open, was reported by ushakov-s and has 16 comment(s).
<https://github.com/red/REP/issues/53>

In view's refinements some inconsistent exist.
refinement /flags - set view's facet "flags".
But refinement /options isn't set view's facet "options".
Instead it sets any view's facet, including "flags" and "options".
Is it worth to rename refinement /options to /with or /details to eliminate this confusion?


Comments:
--------------------------------------------------------------------------------

On 2019-10-12T04:52:07Z, 9214, commented:
<https://github.com/red/REP/issues/53#issuecomment-541284876>

    Why is this in REP repository? Please use our community chat for discussing design questions of such kind.

--------------------------------------------------------------------------------

On 2019-10-12T07:09:17Z, hiiamboris, commented:
<https://github.com/red/REP/issues/53#issuecomment-541294719>

    @9214 I pointed him here, and I support the idea.
    (:point_up: [October 9, 2019 9:48 PM](https://gitter.im/red/red?at=5d9e2b8d97358746732517dc))

--------------------------------------------------------------------------------

On 2019-10-12T07:56:38Z, 9214, commented:
<https://github.com/red/REP/issues/53#issuecomment-541298362>

    > I support the idea
    
    Well, I do not. `/options` should stay and modify `options` facet only, just like `/flags` modifies only flags (talking about consistency and single responsibility principle). Proposed `/with` eliminates the need for `/flags` altogether, and is much more broad and error-prone solution (as you can modify any facet with it).
    
    `view` refinements handle window's facets, and should not be mixed up with VID keywords. Moreso, VID is, theoretically, one of the many possble dialects that can be used to generate virtual tree of faces and interact with View engine - one more reason to not intermix abstraction layers.
    
    @hiiamboris for any such fine-grained wish / proposal, consider to involve more community / team members into discussion on Gitter, and wait for consensus to be reached (kinda like what's happening right now with `mold` vs. `mold/all` vs. `form`) prior to opening tickets.
    
    After that, polishing and musings can be carried out in issue comments, otherwise we'll get flooded by all kinds of feature requests, some of which might not even be deemed worthy.
    
    (but that's just IMO; whole process should be documented and formalized by someone other than me, ditto for bug confirmation and reporting).

--------------------------------------------------------------------------------

On 2019-10-12T08:20:03Z, hiiamboris, commented:
<https://github.com/red/REP/issues/53#issuecomment-541300318>

    @9214 you've just put another bit of worth into this proposal (unwittingly). `/options` refinement confuses everyone with it's name. I'll show you:
    ```
    view/options [base 200x200 ] [
       flags: 'resize
       options: [drag-on: 'down]
       color: red
       actors: object [on-created: func [f e][f/text: "sets title!"]]
    ]
    ```
    How is it "options" if I have to add another "options:" to modify *the* options? ☻

--------------------------------------------------------------------------------

On 2019-10-12T08:23:01Z, 9214, commented:
<https://github.com/red/REP/issues/53#issuecomment-541300596>

    @hiiamboris I said that `/options` _should_ modify options facet only, not that it _does_ so (like your example demonstrates). You propose to change the name to match functionality, I propose to tuck away functionality so that it's consistent with the name.
    
    OTOH, the only option is `drag-on`, so it might not be worth it. But then again, with current `/options` it's almost the same as `view layout [... pane: layout/only [base 200x200] ...]` or `view [base 200x200 do [...]]`.

--------------------------------------------------------------------------------

On 2019-10-12T08:28:54Z, hiiamboris, commented:
<https://github.com/red/REP/issues/53#issuecomment-541301204>

    OK. Well, I find the functionality useful. I've been using it to change `actors` and `text` facets regularly. Sometimes `offset` too.

--------------------------------------------------------------------------------

On 2019-10-13T22:38:07Z, greggirwin, commented:
<https://github.com/red/REP/issues/53#issuecomment-541466518>

    To @hiiamboris's comment, if we have `options/options`, they would be things like `merge` or `override`. This could definitely use some cleaning up at the design level.

--------------------------------------------------------------------------------

On 2020-01-03T19:44:33Z, hiiamboris, commented:
<https://github.com/red/REP/issues/53#issuecomment-570677842>

    Another idea appeared here: https://github.com/red/red/issues/1580#issuecomment-179014879
    `view/facets`

