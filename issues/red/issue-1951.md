
#1951: Click event not triggered on text face
================================================================================
Issue is closed, was reported by endo64 and has 4 comment(s).
[status.deferred]
<https://github.com/red/red/issues/1951>

Below code prints clicked only double clicked on the text face:
`
red>> view [text "click" [print "clicked"]]
`



Comments:
--------------------------------------------------------------------------------

On 2016-06-11T04:11:46Z, ghost, commented:
<https://github.com/red/red/issues/1951#issuecomment-225335610>

    @endo64 Is this a wish??? or a bug???
    I think that the default for text might be on-dbl-click.
    This works for your use case -
    
    ```
    view [text "click" on-click [print "clicked"]]
    ```

--------------------------------------------------------------------------------

On 2016-06-17T09:58:33Z, dockimbel, commented:
<https://github.com/red/red/issues/1951#issuecomment-226730248>

    Click event is currently produces only for buttons, we need to make a custom implementation for this event in order to use it on other widgets. In the meantime, you can use `down` or `up` events for left mouse button clicks.

