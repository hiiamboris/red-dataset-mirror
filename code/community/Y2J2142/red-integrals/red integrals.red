Red[needs: view]



view[
    across
    text "Function:" t: field
    return
    text "a:" a: field
    return
    text "b:" b: field
    return
    calc: button "Calculate"  [
    finish: max (to float! a/text) (to float! b/text)
    x: min (to float! a/text) (to float! b/text)
    total: 0.0
    h: (finish - x) / 100
    repeat i 100
    [
        x: x + h
        func-val: absolute (to float! ( do t/text ))
        total: total + (func-val * h)
    ]
        w/data: total

    ]
    return
    text "Integral value" w: field
]