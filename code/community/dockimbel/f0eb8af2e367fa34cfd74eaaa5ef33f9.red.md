# Mixes drawing with text in area widget

**Gist ID:** f0eb8af2e367fa34cfd74eaaa5ef33f9
**Created:** 2018-05-18T16:23:58Z
**Last updated:** 2018-05-18T16:24:25Z

## File: `draw-text-area.red`

```Red
Red [
  Note: "from: https://gitter.im/red/red/gui-branch?at=5afc55a05a1d895fae45588e"
]

view [
   area 200x100 focus wrap 
   at 10x10 base 255.255.255.254 200x100 all-over
      draw [line-width 20 pen 200.50.50.200] 
      on-down [repend face/draw ['line event/offset event/offset]] 
      on-over [if event/down? [change back tail face/draw event/offset]]
]
```

## Comments

No comments.
