
#2386: [vid] image is drawn two times under Wine
================================================================================
Issue is closed, was reported by maximvl and has 2 comment(s).
<https://github.com/red/red/issues/2386>

I don't know if this issue is in Wine or Red, but I think worth to report.
Following code:

```
image: make image! 200x200
view compose [ image (image) ]
```

Creates window with white square, but also draws white square in top left corner:
![111](https://cloud.githubusercontent.com/assets/949890/21553366/fcfbffc4-ce18-11e6-8e78-0c882879a9f8.png)



Comments:
--------------------------------------------------------------------------------

On 2016-12-29T20:22:33Z, maximvl, commented:
<https://github.com/red/red/issues/2386#issuecomment-269687894>

    I see, `image` itself draws an image, so I was drawing it two times actually.

