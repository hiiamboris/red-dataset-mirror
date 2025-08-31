
#3089: Draw Dialect - Shapes are automatically closed - Is there a way to disable this?
================================================================================
Issue is open, was reported by BrianOtto and has 12 comment(s).
[GUI]
<https://github.com/red/red/issues/3089>

I am currently working on a library that parses SVG files, but I am running into a problem with one of my test cases. When I parse the SVG example located here ...

https://www.w3.org/TR/SVG11/paths.html#PathDataEllipticalArcCommands
`<path d="M600,350 l 50,-25 a25,25 -30 0,1 50,-25 l 50,-25 a25,50 -30 0,1 50,-25 l 50,-25 a25,75 -30 0,1 50,-25 l 50,-25 a25,100 -30 0,1 50,-25 l 50,-25" fill="none" stroke="red" stroke-width="5"  />`

It produces the following Red code ...
```
view [
    base 1200x400 255.255.255
    draw [
        fill-pen off
        pen 255.0.0
        line-width 5
        shape [
            move 600x350
            'arc 50x-25 25 25 -30 sweep
            'line 50x-25
            'arc 50x-25 25 50 -30 sweep
            'line 50x-25
            'arc 50x-25 25 75 -30 sweep
            'line 50x-25
            'arc 50x-25 25 100 -30 sweep
            'line 50x-25
        ]
    ]
]
```
This appears to be an accurate representation, but Red closes the arcs in the rendered drawing. I am pretty sure this is happening because "[shapes are automatically closed](https://doc.red-lang.org/en/draw.html#_shape_commands)". It is drawing a line from the last arc back down to the first arc to close the shape.

Is there a way to disable this behavior, when needed? This path does not end with a "z" command, and so this means the path should not be closed... but it looks like this may not be supported in Draw shapes.

### Expected behavior
![arc-bug-expected](https://user-images.githubusercontent.com/3478333/32041746-2389f480-b9ea-11e7-8f5b-72043c323083.png)

### Actual behavior
![arc-bug-actual](https://user-images.githubusercontent.com/3478333/32041745-23715736-b9ea-11e7-808a-d96938cb2854.png)

### Red version and build date, operating system with version.
red 0.6.3 on Windows 7 Pro SP1 (build date = a few weeks ago)



Comments:
--------------------------------------------------------------------------------

On 2017-10-26T09:08:50Z, qtxie, commented:
<https://github.com/red/red/issues/3089#issuecomment-339601958>

    @BrianOtto Yes, you can.  Add `move 0x0` at the end will make it work. [Here](https://github.com/red/red/blob/master/tests/shape-test.red#L31) is an example.

--------------------------------------------------------------------------------

On 2017-10-26T09:11:41Z, qtxie, commented:
<https://github.com/red/red/issues/3089#issuecomment-339602723>

    The following code works as expected.
    ```
    view [
        base 1200x400 255.255.255
        draw [
            fill-pen off
            pen 255.0.0
            line-width 5
            shape [
                move 600x350
                'line 50x-25
                'arc 50x-25 25 25 -30 sweep
                'line 50x-25
                'arc 50x-25 25 50 -30 sweep
                'line 50x-25
                'arc 50x-25 25 75 -30 sweep
                'line 50x-25
                'arc 50x-25 25 100 -30 sweep
                'line 50x-25
                move 0x0
            ]
        ]
    ]
    ```

--------------------------------------------------------------------------------

On 2017-10-26T16:43:34Z, greggirwin, commented:
<https://github.com/red/red/issues/3089#issuecomment-339727030>

    @qtxie, should I add that to the docs as the definitive answer, or do think you'll add keywords (open, don't-close) to do this? 

--------------------------------------------------------------------------------

On 2017-10-27T00:50:04Z, qtxie, commented:
<https://github.com/red/red/issues/3089#issuecomment-339841523>

    I'm not sure why we need to use `move 0x0`. It's should be open by default as we have `close` keyword in shape. Maybe for compatible with Rebol. I'll think more about it.

--------------------------------------------------------------------------------

On 2017-10-27T05:10:40Z, BrianOtto, commented:
<https://github.com/red/red/issues/3089#issuecomment-339874250>

    @qtxie, awesome, that worked perfectly! Thank you :)
    
    You guys are always so quick to respond and provide a solution. Thank you for all you do!
    
    I'll keep an eye on the ticket in case the convention changes.

--------------------------------------------------------------------------------

On 2019-10-07T18:38:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/3089#issuecomment-539148096>

    From what I can see, `move` command sets a `close?` flag to `no`: https://github.com/red/red/blob/27b18e2ddba7726066068818eef280d88af5bf10/modules/view/draw.red#L594-L598
    While all the other shape keywords set it to `yes`. So currently, any `move` command at the end leaves the shape open. The logic of that should be rethinked.
    
    The main question is this. We have a `closed` keyword that may close every part of the shape (line, arc, whatever). But we don't have keywords that control the closing behavior for the shape *as a whole*. Just the `move` trick.
    The docs say:
    > shapes are automatically closed (no need to draw the last stroke back to start position).
    
    So the closing is by design. Perhaps the idea was that if we encounter a single (not necessarily the last) `move` command in the shape block, we do not close it automatically? Like, it's not a *single* shape anymore...
    
    In any case, `shape` could accept an optional flag: `shape open [lines.. rainbows.. unicorns..]` that would override the behavior.

