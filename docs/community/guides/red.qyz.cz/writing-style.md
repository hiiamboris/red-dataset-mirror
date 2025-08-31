Original URL: <https://red.qyz.cz/writing-style.html>

# writing-style

* * *

Writing styles is easy in Draw. New styles are derived from old styles using `style` keyword in VID. Let's try some simple style:

```
view [
    style my-button: base 100x24

    my-button
]
```

When we run this code, we will see gray rectangle, that's the `base` style. It's not very button-like, so will add some Draw command to make a button from it:

```
view [
    style my-button: base 100x24 draw [
        line-width 4
        pen black
        fill-pen white
        box 0x0 100x24
    ]

    my-button
]
```

It looks nicer, but maybe we want our button bigger. Now there is small problem. Our Draw block is static with predefined size. So we need to write function that would draw the button according to its size. But where will we put this function? Into `extra` facet, that's where we will put all our stuff:

```
view [
    style my-button: base 100x24 extra context [
        redraw: func [face][
            face/draw: compose [
                line-width 4
                pen black
                fill-pen white
                box 0x0 (face/size)
            ]
        ]
    ]

    my-button
]
```

So now we have function `redraw`, that takes `face` as argument and draws our button as result. This function needs to be called somewhere. We will do it in `on-create` actor that is called when face is created:

```
view [
    style my-button: base 100x24 extra context [
        redraw: func [face][
            face/draw: compose [
                line-width 4
                pen black
                fill-pen white
                box 0x0 (face/size)
            ]
        ]
    ] on-create [
        face/extra: make face/extra []
        face/extra/redraw face
    ]

    my-button
    my-button 200x50
]
```

As you can see, we also clone `extra` object, so it's not shared across multiple instances, because that could potentially lead to some problems. Now we are able to draw buttons of arbitrary sizes. Nice!

But button should have some text, so it can describe its action, so we need to add it. We won't try to center the text, we will put it to left top corner, because that's the easiest thing to do and I would like to keep this tutorial simple. So how to do it?

When we add text to VID code, it's stored in the `text` facet. So in `redraw` function we will simply read it from there and draw it:

```
view [
    style my-button: base 100x24 extra context [
        redraw: func [face][
            face/draw: compose [
                line-width 4
                pen black
                fill-pen white
                box 0x0 (face/size)
                text 6x6 (face/text)
            ]
        ]
    ] on-create [
        face/extra: make face/extra []
        face/extra/redraw face
    ]

    my-button "Hello"
    my-button 200x50 "world"
]
```

That was easy. Now it would be nice if active button, where mouse is, was highlighted somehow. So we need to add `on-over` actor to handle it:

```
view [
    style my-button: base 100x24 extra context [
        redraw: func [face][
            face/draw: compose [
                line-width 4
                pen black
                fill-pen white
                box 0x0 (face/size)
                pen black
                text 6x6 (face/text)
            ]
        ]
    ] on-create [
        face/extra: make face/extra []
        face/extra/redraw face
    ] on-over [
        face/draw/4: either event/away? [black][255.180.180]
    ]

    my-button "Hello"
    my-button 200x50 "world"
]
```

`event/away?` is `false` when we are above button and `true` when we are away. If you count values in the draw block, you will see that on fourth position is color `black`, so we switch the color according to `away?` state. And it works. Similarily, we can change button's collor to indicate clicking, using `on-down` and `on-up`:

```
view [
    style my-button: base 100x24 extra context [
        redraw: func [face][
            face/draw: compose [
                line-width 4
                pen black
                fill-pen white
                box 0x0 (face/size)
                pen black
                text 6x6 (face/text)
            ]
        ]
    ] on-create [
        face/extra: make face/extra []
        face/extra/redraw face
    ] on-over [
        face/draw/4: either event/away? [black][255.180.180]
    ] on-down [
        face/draw/6: 180.255.255
    ] on-up [
        face/draw/6: white
    ]

    my-button "Hello"
    my-button 200x50 "world"
]
```

And that's basically all you need to know to write some simple style.
