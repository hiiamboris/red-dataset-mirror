
#3065: WISH: [View] Merge 'image and 'draw facets
================================================================================
Issue is open, was reported by rgchris and has 14 comment(s).
[status.reviewed] [GUI] [type.task.wish]
<https://github.com/red/red/issues/3065>

Having a DRAW facet separate from the IMAGE is superfluous and in some ways counterintuitive and complex. The Draw dialect essentially describes an image. The cumulative, composited approach taken to build an image can reasonably reproduce any functionality currently dependent on both facets.

I propose therefore that if the IMAGE facet is set to an IMAGE! then handling remains as is, whereas if it is set to a block, then the Draw dialect is implied.


Comments:
--------------------------------------------------------------------------------

On 2017-10-21T17:47:34Z, toomasv, commented:
<https://github.com/red/red/issues/3065#issuecomment-338420159>

    What about drawing on image when image is not local? Currently it seems not possible in Draw-only.

--------------------------------------------------------------------------------

On 2017-10-23T21:39:09Z, rgchris, commented:
<https://github.com/red/red/issues/3065#issuecomment-338804702>

    @toomasv Not sure what you mean—I presume you can include a remote image in the draw spec the same way Red currently resolves a remote image for FACE/IMAGE.
    
    ```
    >> view lyt: layout [image http://ross-gill.com/images/red-outlined.png]
    >> lyt/pane/1/image
    == make image! [240x240 #{
        000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000
    ```
    
    Only difference is that at the moment, it is not automatically resolved within Draw:
    
    ```
    >> img: load http://ross-gill.com/images/red-outlined.png
    == make image! [240x240 #{
        000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000
    >> view compose [box (img/size) draw [image img]]
    ```

--------------------------------------------------------------------------------

On 2017-11-07T10:45:15Z, pekr, commented:
<https://github.com/red/red/issues/3065#issuecomment-342444437>

    Could not the same be said for the 'text facet? You can have your text in terms of Draw too, no?

--------------------------------------------------------------------------------

On 2017-12-05T22:24:40Z, rgchris, commented:
<https://github.com/red/red/issues/3065#issuecomment-349462119>

    @pekr I think that's a good parallel—though would more likely be assumed a rich text dialect:
    `face/text: [<b> "Note:" </b> " this is rich text"]`

--------------------------------------------------------------------------------

On 2017-12-06T07:13:41Z, dockimbel, commented:
<https://github.com/red/red/issues/3065#issuecomment-349555302>

    That's a good option to consider, but I would rather remove the `image` facet, and let `draw` facet either take a Draw dialect block or an `image!` value.

--------------------------------------------------------------------------------

On 2017-12-06T09:00:40Z, DideC, commented:
<https://github.com/red/red/issues/3065#issuecomment-349576340>

    What about effects?
    In R2 'effect facet is very usefull (especially the `fit or `aspect effect) and powerfull and worked with 'image facet.
    
    I don't think we can do this in Draw dialect actually and it will be far more verbose.
    I'm sure Doc have things in mind regarding the work done by LDCI on image treatment.
    
    So we need to paint and keep the big picture in mind.

--------------------------------------------------------------------------------

On 2017-12-06T15:19:24Z, dockimbel, commented:
<https://github.com/red/red/issues/3065#issuecomment-349670837>

    @DideC Yes, good point, I was discussing it with Qingtian yesterday. We will not decide on this ticket until the image effect pipeline will be implemented. It should be very quick to do, as most of the code for it is already into RedCV codebase.

