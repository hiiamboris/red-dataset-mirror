
#1502: draw's transparency switches
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1502>

In the following `draw` code, an opacity of `0` behaves as `255`, and `255` behaves as `0` while everything in between seems fine:

```
img: draw make image! [100x10 255.0.0] [
    pen 0.0.255
    fill-pen 255.255.255.0 box 0x0 10x10
    fill-pen 255.255.255.1 box 10x0 20x10
    fill-pen 255.255.255.64 box 20x0 30x10
    fill-pen 255.255.255.100 box 30x0 40x10
    fill-pen 255.255.255.128 box 40x0 50x10
    fill-pen 255.255.255.160 box 50x0 60x10
    fill-pen 255.255.255.200 box 60x0 70x10
    fill-pen 255.255.255.224 box 70x0 80x10
    fill-pen 255.255.255.254 box 80x0 90x10
    fill-pen 255.255.255.255 box 90x0 100x10
]

save/as %test.png img 'png
```

Result:
![test](https://cloud.githubusercontent.com/assets/7657453/11738435/6b5b5aec-a02e-11e5-87ab-72023d544051.png)

Using the same `draw` block on a base face behaves even more strangely:

```
view make face! [
    type: 'window text: "Test" size: 100x10
    pane: reduce [
        make face! [
            type: 'base offset: 0x0 size: 100x10 color: red
            draw: [
                pen 0.0.255
                fill-pen 255.255.255.0 box 0x0 10x10
                fill-pen 255.255.255.1 box 10x0 20x10
                fill-pen 255.255.255.64 box 20x0 30x10
                fill-pen 255.255.255.100 box 30x0 40x10
                fill-pen 255.255.255.128 box 40x0 50x10
                fill-pen 255.255.255.160 box 50x0 60x10
                fill-pen 255.255.255.200 box 60x0 70x10
                fill-pen 255.255.255.224 box 70x0 80x10
                fill-pen 255.255.255.254 box 80x0 90x10
                fill-pen 255.255.255.255 box 90x0 100x10
            ]
        ]
    ]
]
```

Result:
![xp](https://cloud.githubusercontent.com/assets/7657453/11738438/74121784-a02e-11e5-9fb5-9f7d410b76e0.png)



Comments:
--------------------------------------------------------------------------------

On 2015-12-17T10:19:31Z, qtxie, commented:
<https://github.com/red/red/issues/1502#issuecomment-165408721>

    Fix it in PR: https://github.com/red/red/pull/1511

