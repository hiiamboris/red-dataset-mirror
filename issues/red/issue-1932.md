
#1932: Antialiased DRAW text on transparent background is more bold than same text rendered by system
================================================================================
Issue is closed, was reported by rebolek and has 4 comment(s).
[status.built] [status.tested] [status.reviewed] [GUI]
<https://github.com/red/red/issues/1932>

Following code:

```
f: make font! [name: "Segoe UI" size: 9 anti-alias?: on]
view [image 200x50 draw [font f text 10x0 "Red: untitled"]]
```

produces this result.

![font-alias](https://cloud.githubusercontent.com/assets/660267/15533407/cdfda520-2264-11e6-80ba-2a35e41fe9e6.png)

As confirmed by @dockimbel it doesn’t happen when the background is not transparent (it is by default).



Comments:
--------------------------------------------------------------------------------

On 2020-07-17T15:58:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/1932#issuecomment-660187534>

    ![](https://i.gyazo.com/dd92237aec6a22d2c7923313919e527d.png)
    ```
    f: make font! [name: "Arial" style: 'bold size: 9 anti-alias?: on]
    view [image 200x50 draw [font f text 10x0 "Red: untitled"]]
    ```
    So on W7, it's the opposite: system-rendered text is more spaced.
    
    This is not a bug though. GDI and GDI+ have different rasterizer implementations. ATM, all text in draw uses GDI+, even with opaque background (the only way to make text transform-able). GDI+ has a ClearType rasterizer (which may be closer to the GDI one), but we're not using it because it's buggy. We may switch to D2D draw sometime later, but we'll still have different rasterizers: [see here how vastly different they are](https://gitter.im/red/red/system?at=5c3b116ac45b986d1152c05d).
    
    So I propose we close this for (1) not being a bug, (2) not being in our reach to fix.

--------------------------------------------------------------------------------

On 2022-09-30T07:32:07Z, qtxie, commented:
<https://github.com/red/red/issues/1932#issuecomment-1263213348>

    It's fixed in the latest version.

