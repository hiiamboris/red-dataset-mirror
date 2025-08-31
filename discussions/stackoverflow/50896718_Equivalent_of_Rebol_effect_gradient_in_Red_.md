# Equivalent of Rebol effect \[gradient\] in Red?

**Link:**
<https://stackoverflow.com/questions/50896718/equivalent-of-rebol-effect-gradient-in-red>

**Asked:** 2018-06-17 12:34:57 UTC

------------------------------------------------------------------------

I searched on Google but can\'t find any example in Red equivalent to
this in Rebol:
[http://www.rebol.com/view/demos/gradient.r](http://www.rebol.com/view/demos/gradient.r){rel="nofollow noreferrer"}

    view layout [
        style box box 64x64
        across backdrop 0.50.0
        vh1 "Gradient Examples"
        below guide
        box effect [gradient]
        box yellow effect [gradient]
        box effect [gradient 200.0.0]
        box yellow effect [gradient 200.0.0]
        box effect [gradient 200.0.0 0.0.200]
        return
        box effect [gradient 1x0]
        box yellow effect [gradient 1x0]
        box effect [gradient 1x0 200.0.0]
        box yellow effect [gradient 1x0 200.0.0]
        box effect [gradient 1x0 200.0.0 0.0.200]
        return
        box effect [gradient -1x0]
        box yellow effect [gradient -1x0]
        box effect [gradient -1x0 200.0.0]
        box yellow effect [gradient -1x0 200.0.0]
        box effect [gradient -1x0 200.0.0 0.0.200]
        return
        box effect [gradient 0x1]
        box yellow effect [gradient 0x1]
        box effect [gradient 0x1 200.0.0]
        box yellow effect [gradient 0x1 200.0.0]
        box effect [gradient 0x1 200.0.0 0.0.200]
        return
        box effect [gradient 0x-1]
        box yellow effect [gradient 0x-1]
        box effect [gradient 0x-1 200.0.0]
        box yellow effect [gradient 0x-1 200.0.0]
        box effect [gradient 0x-1 200.0.0 0.0.200]
        return
        box effect [gradient 1x1]
        box yellow effect [gradient 1x1]
        box effect [gradient 1x1 200.0.0]
        box yellow effect [gradient 1x1 200.0.0]
        box effect [gradient 1x1 200.0.0 0.0.200]
        return
        box effect [gradient -1x1]
        box yellow effect [gradient -1x1]
        box effect [gradient -1x1 200.0.0]
        box yellow effect [gradient -1x1 200.0.0]
        box effect [gradient -1x1 200.0.0 0.0.200]
        return
        box effect [gradient 1x-1]
        box yellow effect [gradient 1x-1]
        box effect [gradient 1x-1 200.0.0]
        box yellow effect [gradient 1x-1 200.0.0]
        box effect [gradient 1x-1 200.0.0 0.0.200]
        return
        box effect [gradient -1x-1]
        box yellow effect [gradient -1x-1]
        box effect [gradient -1x-1 200.0.0]
        box yellow effect [gradient -1x-1 200.0.0]
        box effect [gradient -1x-1 200.0.0 0.0.200]
    ]

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by rebolek

Red\'s View doesn\'t support effect pipe yet, but you can set gradients
in Draw:

    view [base 100x100 draw [fill-pen linear 0.0.0 255.255.255 0x0 100x100 box 0x0 100x100]]

(I\'m on Linux, so I can\'t test it, but it should work IMO).

See
[https://doc.red-lang.org/en/draw.html#\_linear_gradient_fill](https://doc.red-lang.org/en/draw.html#_linear_gradient_fill){rel="nofollow noreferrer"}
for more information.

------------------------------------------------------------------------

## Comments on question
