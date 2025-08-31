
#1592: Regression: group-box's pane set to none when compiled
================================================================================
Issue is closed, was reported by WiseGenius and has 14 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/1592>

```
Red [
    Needs:      'View
]

g: none
t: none

view [
    g: group-box [
        t: text "When compiled, I don't exist."
        return
        field "Neither do I."
    ]
]

?? g
?? t
```

When interpreted, the above file works, but when compiled, the group-box's `pane` is set to `none`:
![blank group-box](https://cloud.githubusercontent.com/assets/7657453/12823417/9ee0eada-cbb7-11e5-8f9e-e7d2be5d29e6.png)

This is the output when compiled:

```
g: make object! [
    type: 'group-box
    offset: 10x10
    size: 200x200
    text: none
    image: none
    color: none
    menu: none
    data: none
    enable?: true
    visible?: true
    selected: none
    flags: none
    options: none
    parent: make object! [
        type: 'window
        offset: 530x402
        size: 220x220
        text: "Red: untitled"
        image: none
        color: none
        menu: none
        data: none
        enable?: true
        visible?: true
        selected: none
        flags: none
        options: none
        parent: none
        pane: [make object! [...]]
        state: none
        edge: none
        para: none
        font: none
        actors: none
        extra: none
        draw: none
                    ]
    pane: none
    state: none
    edge: none
    para: none
    font: none
    actors: none
    extra: none
    draw: none
        ]
t: make object! [
    type: 'text
    offset: 10x10
    size: 146x24
    text: "When compiled, I don't exist."
    image: none
    color: none
    menu: none
    data: none
    enable?: true
    visible?: true
    selected: none
    flags: none
    options: none
    parent: none
    pane: none
    state: none
    edge: none
    para: none
    font: none
    actors: none
    extra: none
    draw: none
        ]
```

This is the output when interpreted:

```
g: make object! [
    type: 'group-box
    offset: 10x10
    size: 166x78
    text: none
    image: none
    color: none
    menu: none
    data: none
    enable?: true
    visible?: true
    selected: none
    flags: none
    options: none
    parent: make object! [
        type: 'window
        offset: 547x463
        size: 186x98
        text: "Red: untitled"
        image: none
        color: none
        menu: none
        data: none
        enable?: true
        visible?: true
        selected: none
        flags: none
        options: none
        parent: none
        pane: [make object! [...]]
        state: none
        edge: none
        para: none
        font: none
        actors: none
        extra: none
        draw: none
                    ]
    pane: [make object! [
        type: 'text
        offset: 10x10
        size: 146x24
        text: "When compiled, I don't exist."
        image: none
        color: none
        menu: none
        data: none
        enable?: true
        visible?: true
        selected: none
        flags: none
        options: none
        parent: make object! [...]
        pane: none
        state: none
        edge: none
        para: none
        font: none
        actors: none
        extra: none
        draw: none
                    ] make object! [
        type: 'field
        offset: 10x44
        size: 80x24
        text: "Neither do I."
        image: none
        color: none
        menu: none
        data: none
        enable?: true
        visible?: true
        selected: none
        flags: none
        options: none
        parent: make object! [...]
        pane: none
        state: none
        edge: none
        para: none
        font: none
        actors: none
        extra: none
        draw: none
                    ]]
    state: none
    edge: none
    para: none
    font: none
    actors: none
    extra: none
    draw: none
        ]
t: make object! [
    type: 'text
    offset: 10x10
    size: 146x24
    text: "When compiled, I don't exist."
    image: none
    color: none
    menu: none
    data: none
    enable?: true
    visible?: true
    selected: none
    flags: none
    options: none
    parent: make object! [
        type: 'group-box
        offset: 10x10
        size: 166x78
        text: none
        image: none
        color: none
        menu: none
        data: none
        enable?: true
        visible?: true
        selected: none
        flags: none
        options: none
        parent: make object! [
            type: 'window
            offset: 547x463
            size: 186x98
            text: "Red: untitled"
            image: none
            color: none
            menu: none
            data: none
            enable?: true
            visible?: true
            selected: none
            flags: none
            options: none
            parent: none
            pane: [make object! [...]]
            state: none
            edge: none
            para: none
            font: none
            actors: none
            extra: none
            draw: none
                                ]
        pane: [make object! [...] make object! [
            type: 'field
            offset: 10x44
            size: 80x24
            text: "Neither do I."
            image: none
            color: none
            menu: none
            data: none
            enable?: true
            visible?: true
            selected: none
            flags: none
            options: none
            parent: make object! [...]
            pane: none
            state: none
            edge: none
            para: none
            font: none
            actors: none
            extra: none
            draw: none
                                ]]
        state: none
        edge: none
        para: none
        font: none
        actors: none
        extra: none
        draw: none
                    ]
    pane: none
    state: none
    edge: none
    para: none
    font: none
    actors: none
    extra: none
    draw: none
        ]
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-04T17:29:58Z, WiseGenius, commented:
<https://github.com/red/red/issues/1592#issuecomment-179957652>

    In both Windows XP and Windows 7.

--------------------------------------------------------------------------------

On 2016-02-06T17:36:38Z, WiseGenius, commented:
<https://github.com/red/red/issues/1592#issuecomment-180817041>

    Now, the group-box's `pane` is set to `none` both when the code is interpreted and when compiled, on both Windows XP and Windows 7.

--------------------------------------------------------------------------------

On 2016-02-06T17:38:08Z, dockimbel, commented:
<https://github.com/red/red/issues/1592#issuecomment-180817622>

    Consistency is an improvement. ;-)

--------------------------------------------------------------------------------

On 2016-02-10T06:28:19Z, dockimbel, commented:
<https://github.com/red/red/issues/1592#issuecomment-182221490>

    Works fine now both interpreted and compiled (tested on Win7 only). 
    
    Please confirm it works fine on XP too, before we close it.

--------------------------------------------------------------------------------

On 2016-02-10T06:34:29Z, WiseGenius, commented:
<https://github.com/red/red/issues/1592#issuecomment-182225432>

    It works fine on Windows XP too, both interpreted and compiled.

--------------------------------------------------------------------------------

On 2016-02-10T07:02:06Z, WiseGenius, commented:
<https://github.com/red/red/issues/1592#issuecomment-182231475>

    It also works fine here on Windows 7 both interpreted and compiled.

--------------------------------------------------------------------------------

On 2016-02-10T09:39:39Z, dockimbel, commented:
<https://github.com/red/red/issues/1592#issuecomment-182279340>

    Thank you.

