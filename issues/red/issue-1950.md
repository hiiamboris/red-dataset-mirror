
#1950: Mouse action "on-up" unexpected behavior.
================================================================================
Issue is closed, was reported by ghost and has 2 comment(s).
[type.review]
<https://github.com/red/red/issues/1950>

It appears that on-up behaves like on-click.
When I use on-up and:
- click a button
- keep mousebutton pressed
- move off the button
  on-up still fires, which it shouldnt'..

Example.:

```
Red []
view [
    mytext: text 100x25 yello font-size 14 "Default"
    button "Click Me" on-up [mytext/text: "Changed"]
]
```



Comments:
--------------------------------------------------------------------------------

On 2016-06-17T10:33:53Z, dockimbel, commented:
<https://github.com/red/red/issues/1950#issuecomment-226736886>

    `up` is a low-level event, while `click` is a higher-level one. `up` will always be triggered when you release the left mouse button regardless of the mouse position.
    
    For the `click` event, we should improve it in the future, so we might support cancellation too.

