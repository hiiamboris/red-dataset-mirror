
#2558: [gui][wine][bug] Wine doesn't show draw until color is changed
================================================================================
Issue is open, was reported by maximvl and has 2 comment(s).
[GUI]
<https://github.com/red/red/issues/2558>

```
win: make face! [
   type: 'window
   size: 500x500
   pane: reduce [ make face! [ type: 'base size: 500x500 draw: [fill-pen black line-width 2 circle 50x50 10]] ]
]
show win
```

This code on Wine-2.1 results in:

![](http://imgur.com/cw5rEdh.png)

And on Windows:

![](http://imgur.com/xou15AK.png)

While adding `color: white` to `face!` works:

![](http://imgur.com/UYPZcU3.png)


Comments:
--------------------------------------------------------------------------------

On 2020-07-17T11:11:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/2558#issuecomment-660047724>

    Is this a Wine issue or Red issue?

