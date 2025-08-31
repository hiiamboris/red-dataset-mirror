Original URL: <https://redprogramming.com/Short Red Code Examples.html>

# Short Red Code Examples

* * *

Basic Widgets:

```
Red [title: "Basic Red GUI Widgets" needs: 'view]
view [
    below
    t: text "Some text"
    text 400x30 bold italic blue font-size 16 "Text with properties"
    button "Click Me" [t/text: "Changed!"]
    field 400 "Type something into this text entry field"
    area 400x200
    image %test.png   ; be sure to have image there, or GUI will crash
]
```

![](https://redprogramming.com/gui1.png)

List widgets:

```
Red [title: "List Widgets" needs: 'view]
view [
    below
    t: text 80x20 "Waiting..."
    drop-down "D" data ["A" "B" "C"] [
        t/text: mold face/text
    ]
    text-list 90x160 data [
        "Monday" "Tuesday" "Wednesday" "Thursday"
        "Friday" "Saturday" "Sunday"
    ] [t/text: pick face/data face/selected]
]
```

![](https://redprogramming.com/gui2.png)

Origin, tab panels, slider, progress bar, and base widgets:

```
Red [title: "Origin, tab panel, slider, progress, base" needs: 'view]
view [
    origin 0x0 space 0x0
    tab-panel 500x500 [
        "Tab 1    " [
            progress 100x20 data 20% react [face/data: s/data]
            s: slider 100x20 data 20%
        ]
        "Tab 2    " [
            base 400x400 draw [
                pen red 
                circle 75x100 30
            ]
        ]
    ]
]
```

![](https://redprogramming.com/gui4.png)

![](https://redprogramming.com/gui4b.png)

Menus:

```
Red [title: "Menus" needs: 'view]
g: layout [area 400x400]
g/menu: [
    "No Submenus" [
        "Print" prnt
        ---
        "Quit" kwit
    ]
    "Sub-menus" [
        "Sub-menus" [
            "Submenu1" s1
            "Submenu2" s2
            "Submenu3" [
                "Submenu4" s4
            ]
        ]
    ]
]
g/actors: make object! [
    on-menu: func [face [object!] event [event!]][
        if event/picked = 'kwit [unview/all]
        if event/picked = 'prnt [print "print menu selected"]
        if event/picked = 's4 [print "submenu4 selected"]
    ]
]
view g
```

![](https://redprogramming.com/gui5.png)

![](https://redprogramming.com/gui5b.png)

Panel, group-box, radio buttons, and check box:

```
Red [title: "panel, group-box, radio, check" needs: 'view]
view [
    below
    t: text "Waiting..."
    check 160x24 data false [
        t/text: either face/data ["true"]["false"]
    ]
    panel 240x40 [across radio "1" radio "2" radio "3"]
    group-box "More Radios" 200x100 [
        across
        radio 40x40 "A" radio 40x40 "B" radio 40x40 "C"
    ]
]
```

![](https://redprogramming.com/gui3.png)

Dinner tip calculator:

```
Red [needs: 'view]
view [
    title "Tip Calculator"
    below
    f: field "9"
    t: field ".2" 
    button "Calculate" [
        append clear x/text (to float! f/text) * (1 + (to float! t/text))
    ]
    x: field "tip"
]
```

![](https://redprogramming.com/tip-calculator.png)

Tiny tile game:

```
Red [needs: 'view] 
view [ 
     title "Tile Game"
     backdrop silver
     style t: button 100x100 [
         x: face/offset
         face/offset: e/offset 
         e/offset: x
     ] 
     t "8"  t "7"  t "6"  return 
     t "5"  t "4"  t "3"  return 
     t "2"  t" 1"  e: base silver
]
```

![](https://redprogramming.com/tile-game.png)

Generic GUI calculator:

```
Red [needs: 'view]
view [
     title "Calculator"
     f: field 230x50 font-size 25 ""  return 
     style b: button 50x50 [append f/text face/text]
     b "1"  b "2"  b "3"  b " + "  return 
     b "4"  b "5"  b "6"  b " - "  return 
     b "7"  b "8"  b "9"  b " * "  return 
     b "0"  b "."  b " / "  b "=" [attempt [
             calculation: form do f/text 
             append clear f/text calculation
     ]] 
]
```

![](https://redprogramming.com/calculator.png)

Coin flip:

```
Red [needs: 'view]
h: load http://re-bol.com/heads.jpg
t: load http://re-bol.com/tails.jpg
view [
    title: "Coin Flip"
    below
    i: image h
    f: field
    button "Flip" [
        f/text: first random ["Heads" "Tails"]
        either f/text = "Heads" [i/image: h] [i/image: t] 
    ]
]
```

![](https://redprogramming.com/coin-flip.png)

Math test:

```
Red [needs: 'view]
x: func [] [append append form random 10 " + " form random 20]
view [
    title "Math Test"
    f1: field 
    f2: field "Answer_here..."
    button "Check Answer" [
        print either f2/text = form do f1/text ["Yes!"]["No"]
        f1/text: x
        f2/text: ""
    ]
    do [f1/text: x]
]
```

![](https://redprogramming.com/math-test.png)

Compliment generator:

```
Red [needs: 'view]
xx: form x: ["brilliant" "rare" "unique" "talented" "exceptional"]
yy: form y: ["genius" "champion" "winner" "success" "achiever"]
view [
    title "Compliment Generator"
    below
    area xx
    area yy
    button "Compliment" [
        print [
            "You're a"
            first random x
            first random y "!"
        ]
    ] 
]
```

![](https://redprogramming.com/compliment-generator.png)

![](https://redprogramming.com/compliment-generator2.png)
