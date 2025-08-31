
#3336: regression: size-text result is incorrect with fixed-size fonts
================================================================================
Issue is open, was reported by hiiamboris and has 30 comment(s).
[status.waiting] [GUI]
<https://github.com/red/red/issues/3336>

### Steps to reproduce the problem
Test script:
```
Red [needs: 'view]

s: "0123456789 123456789 123456789 123456789"		; 40 chars
f: make font! [name: "Courier New"  size: 12]
view/no-wait [a: area font f]

probe length? s
box: as-pair length? s 1
probe box * size-text/with a "o"
probe box * (size-text/with a "xx") / 2x1
probe box * (size-text/with a "WWWW") / 4x1
probe size-text/with a s
```
### Expected behavior
With a font of fixed width the math should be as follows: `num chars * char size = text size`. So one would expect four displayed pair!s to be equal.
As was in the versions prior to March 30:
```
40
480x22
480x22
480x22
480x22
```
### Actual behavior
```
40
360x17
380x17
380x17
384x17
```
Total miss.
Try also "Lucida Console" and "Consolas" and what have you.. always different results, that tend to improve on bigger fonts (as expected).

### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 633 date: 12-Apr-2018/10:39:17 commit: #f56b72e152d47fea33ba9e38937077cb9356d04d ]
PLATFORM: [ name: "Windows 7" OS: 'Windows arch: 'x86-64 version: 6.1.0 build: 7601 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-04-25T07:29:54Z, qtxie, commented:
<https://github.com/red/red/issues/3336#issuecomment-384187642>

    I cannot reproduce it with the latest version. I got the output below:
    ```
    40
    400x18
    400x18
    400x18
    400x18
    ```

--------------------------------------------------------------------------------

On 2018-04-25T07:42:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/3336#issuecomment-384190788>

    The output from the latest automated build I'm getting:
    ```
    40
    360x17
    380x17
    380x17
    384x17
    ```
    ```
    -----------RED & PLATFORM VERSION----------- 
    RED: [ branch: "master" tag: #v0.6.3 ahead: 657 date: 25-Apr-2018/2:03:29 commit: #e80f0759eaef05e18d65426cf25b7e5727a6737e ]
    PLATFORM: [ name: "Windows 7" OS: 'Windows arch: 'x86-64 version: 6.1.0 build: 7601 ]
    --------------------------------------------
    ```
    @qtxie  Are you testing that on W7 and with any of the mentioned fonts?

--------------------------------------------------------------------------------

On 2018-04-25T07:56:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/3336#issuecomment-384194624>

    Same build, on W8 x64:
    ```
    40
    360x18
    380x18
    380x18
    380x18
    ```
    (note the 1st line is different, and they're all incorrect: the real glyph size is 12px wide for Courier New, so should be 480)

--------------------------------------------------------------------------------

On 2018-04-25T08:08:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/3336#issuecomment-384198168>

    Actually I just caught yet another regression... Replaced the `area` with `area size 960x480` and look:
    (white is stable 0.6.3 and black is nightly)
    Supposed to be the same size (stable is correct)
    ![](https://i.gyazo.com/6e3a72538870c8fd26af18a9d027d82f.png)
    

--------------------------------------------------------------------------------

On 2018-04-25T08:49:10Z, qtxie, commented:
<https://github.com/red/red/issues/3336#issuecomment-384211121>

    @hiiamboris Thanks. Are you using "High Constrast" Theme?

--------------------------------------------------------------------------------

On 2018-04-25T09:22:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/3336#issuecomment-384221457>

    @qtxie in W8 - yes, in W7 - no (it's based on Classic theme)
    I uploaded the themes [here](https://github.com/red/red/issues/3247), the links are still intact

--------------------------------------------------------------------------------

On 2018-06-21T22:32:15Z, hiiamboris, commented:
<https://github.com/red/red/issues/3336#issuecomment-399263899>

    @qtxie I just thought about it.. 
    There's a font scale option in Windows:
    ![](https://images.techhive.com/images/article/2015/10/1102-win8-1-100622069-large.jpg)
    I have this setting set to 125%. Can you try it? Maybe it's the key in reproducing the issue.

--------------------------------------------------------------------------------

On 2018-12-01T13:41:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/3336#issuecomment-443427188>

    So it seems that [here](https://github.com/red/red/commit/b3da143e621e8b254c8e9e8a7a9b4652dfc30d04) @qtxie made the whole View DPI-aware. All pairs from there on are expressed not in pixels but in some logical units. Even the view/screens/1/size reports not your real display resolution anymore.
    Windows uses the mentioned Text size setting to affect the DPI reported.
    
    The idea itself is fine by me, but it gives rise to another problem: these logical units do not align with pixels. The issue here was because GetTextExtentPoint32 would return the size in pixels, 12x22, which would then be scaled down by 125%, resulting in 9.6x17.6, truncated to 9x17.
    
    So now there's no reliable solution to determine the glyph size of a fixed-size font, not until we fix https://github.com/red/red/issues/3548. And even then it would require to build an array of 100x100 chars and measure it's size with size-text, then use the floating point division to derive the glyph size.

--------------------------------------------------------------------------------

On 2018-12-03T02:01:47Z, greggirwin, commented:
<https://github.com/red/red/issues/3336#issuecomment-443566654>

    GetTextExtentPoint32 says it returns logical units. But if the scaling at the OS level isn't accounted for, the problem will persist it seems. I don't know how it relates to DrawText, and which APIs we're set on for Windows now. It sounds like you've already looked at https://docs.microsoft.com/en-us/windows/desktop/gdi/drawing-text-from-different-fonts-on-the-same-line and determined it isn't just the font overhang issue mentioned there.
    
    Seems some R&D on reference systems that get this right may be in order.

--------------------------------------------------------------------------------

On 2018-12-03T02:02:10Z, greggirwin, commented:
<https://github.com/red/red/issues/3336#issuecomment-443566707>

    Unless your ceil-text PR addresses it adequately.

--------------------------------------------------------------------------------

On 2018-12-03T10:17:36Z, hiiamboris, commented:
<https://github.com/red/red/issues/3336#issuecomment-443658283>

    @greggirwin I'm not ready to say when OS' logical units are different from pixels. On my PC they are the same. Currently all conversion between OS' units and Red units is done inside R/S code via multiplying/dividing pairs by `dpi-factor` value, so OS has no idea we have any scaling. With one exception: the Draw context, where a scaling matrix is applied explicitly.
    
    But that all is not the point. Point is: _we cannot express 9.6x17.6 with the pair! datatype_ (until float-pair something is implemented), nor can the [SIZE structure](https://docs.microsoft.com/en-us/previous-versions//dd145106%28v=vs.85%29). We can only round it either way. To get these 9.6 and 17.6 values one has to make a big array of text, which dimensions won't be rounded for sure. 100x100 is the most reliable array size as `dpi-factor` is chosen to represent an integer fraction of 100, so each `100` will be divided by another `100` and the result will be exact.

--------------------------------------------------------------------------------

On 2019-01-12T11:16:38Z, dockimbel, commented:
<https://github.com/red/red/issues/3336#issuecomment-453739422>

    > Even the view/screens/1/size reports not your real display resolution anymore.
    
    That's a very annoying regression.

--------------------------------------------------------------------------------

On 2019-01-12T12:11:30Z, hiiamboris, commented:
<https://github.com/red/red/issues/3336#issuecomment-453742632>

    @dockimbel but it fits the whole picture. If you for instance want your window to occupy 1/4 of the screen space, you set window's size to `screen/size / 2` and don't bother with DPI yourself.
    
    For the record, some points about low-level vs high-level size-text: :point_up: [January 12, 2019 1:59 PM](https://gitter.im/red/red/system?at=5c39c87c1cb70a372ac78f2b)
    And about the differences of GDI vs GDI+ vs D2D text metrics: :point_up: [January 12, 2019 4:24 PM](https://gitter.im/red/red/system?at=5c39ea9b95e17b45253d197a) :point_up: [January 13, 2019 1:22 PM](https://gitter.im/red/red/system?at=5c3b116ac45b986d1152c05d)

--------------------------------------------------------------------------------

On 2019-07-30T06:27:53Z, bitbegin, commented:
<https://github.com/red/red/issues/3336#issuecomment-516282172>

    Duplicate of #3760

--------------------------------------------------------------------------------

On 2019-07-30T07:39:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/3336#issuecomment-516303671>

    @bitbegin no it's not a duplicate. Please get into the issue before closing it. The issue here lies in rounding of pairs, that accumulates. Until size-text is made to return floating point result, it is unfixable IMO. 

