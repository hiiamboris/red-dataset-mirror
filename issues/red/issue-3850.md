
#3850: Can't reset "transparent" or "glass" or 0.0.0.255 color
================================================================================
Issue is closed, was reported by schwarzbox and has 4 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3850>

**Describe the bug**
Error when try to reset "transparent" or "glass" or 0.0.0.255 color for some faces.

2019-04-19 16:42:37.030 console-2018-11-22-8164[18810:3533979] -[RedSlider setDrawsBackground:]: unrecognized selector sent to instance 0x615f20
2019-04-19 16:42:37.031 console-2018-11-22-8164[18810:3533979] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[RedSlider setDrawsBackground:]: unrecognized selector sent to instance 0x615f20'
*** Call stack at first throw:
(
    0   CoreFoundation                      0x938e806b __raiseError + 484
    1   libobjc.A.dylib                     0xa6ca4c23 objc_exception_throw + 273
    2   CoreFoundation                      0x938ee508 -[NSObject(NSObject) doesNotRecognizeSelector:] + 138
    3   CoreFoundation                      0x9381916a ___forwarding___ + 1321
    4   CoreFoundation                      0x93818c1e _CF_forwarding_prep_0 + 14
    5   console-2018-11-22-8164             0x000c9b67 console-2018-11-22-8164 + 822119
)

*** Runtime Error 17: illegal instruction
*** at: 938E8310h

**To reproduce**
Steps to reproduce the behavior:
```
Red[ Needs: View ]

View[
    below
    p: panel red [
        below
        bs: base 128x20 "Default gray"
        bx: box 128x20 "Default transparent"
        im: image 128x20 "Default white"

        b: button "Default white"
        sl: slider "Default transparent"
    ]
    gb: group-box "Set"[
        below
        button "Set panel transparent" [p/color: transparent]
        button "Set base transparent" [bs/color: transparent]
        button "Set box transparent" [bx/color: transparent]
        button "Set image transparent" [im/color: transparent]
        button "Set button transparent" [b/color: transparent]
        button "Set slider transparent" [sl/color: transparent]

    ]
    button "Set group-box transparent" [gb/color: glass]
]
```
**Expected behavior**
Set "transparent" or "glass" or 0.0.0.255 color to the face.
**Screenshots**
<img width="329" alt="Screen Shot 2019-04-19 at 4 49 52 PM" src="https://user-images.githubusercontent.com/31594850/56427078-32af3a00-62c3-11e9-925e-f409a017daa5.png">

**Platform version (please complete the following information)**
```
Red 0.6.4 for macOS built 22-Nov-2018/3:40:38+03:00 commit #755eb94
```


Comments:
--------------------------------------------------------------------------------

On 2019-04-19T14:00:28Z, qtxie, commented:
<https://github.com/red/red/issues/3850#issuecomment-484904693>

    `transparent` background is not supported by all the native controls. The only one is supported cross-platform is `base` face.
    The view engine should not crash anyway.

--------------------------------------------------------------------------------

On 2019-04-20T18:51:17Z, schwarzbox, commented:
<https://github.com/red/red/issues/3850#issuecomment-485150691>

    **Describe the bug**
    I found very strange behavior. 
    If you set color for "base" using button you get runtime error (transparent, glass or 0.0.0.255).
    
    2019-04-20 21:44:15.842 console-2018-11-22-8164[769:46077] -[RedBase setDrawsBackground:]: unrecognized selector sent to instance 0x70ccd0
    2019-04-20 21:44:15.843 console-2018-11-22-8164[769:46077] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[RedBase setDrawsBackground:]: unrecognized selector sent to instance 0x70ccd0'
    *** Call stack at first throw:
    (
        0   CoreFoundation                      0x938e806b __raiseError + 484
        1   libobjc.A.dylib                     0xa6ca4c23 objc_exception_throw + 273
        2   CoreFoundation                      0x938ee508 -[NSObject(NSObject) doesNotRecognizeSelector:] + 138
        3   CoreFoundation                      0x9381916a ___forwarding___ + 1321
        4   CoreFoundation                      0x93818c1e _CF_forwarding_prep_0 + 14
        5   console-2018-11-22-8164             0x000c9b67 console-2018-11-22-8164 + 822119
    )
    *** Runtime Error 17: illegal instruction
    *** at: 938E8310h
    
    **To reproduce**
    1. Run code
    2. Press "Set base transparent"
    ```
    Red[Needs: View]
    
    View [
        b: base "transparent" transparent on-create [face/color: transparent]
        do[b/color: transparent]
    
        button "Set base transparent" [b/color: transparent]
    ]
    ```
    **Expected behavior**
    Set "transparent" or "glass" or 0.0.0.255 color to the "base" face.
    
    **Platform version (please complete the following information)**
    Red 0.6.4 for macOS built 22-Nov-2018/3:40:38+03:00 commit #755eb94

