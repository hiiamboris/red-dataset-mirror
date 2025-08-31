
#3727: [View] `size-text` not working with some fonts
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3727>

**Describe the bug**

`size-text` returns 0x0 for all bitmap fonts (.fon) and opentype (.otf). As a result control (e.g. `field`) sizes cannot be automatically inferred.
![](https://i.gyazo.com/62b341a4c718cfef1cc748465a810651.png)
See also related https://github.com/red/red/issues/3726

**To reproduce**

[OpenType font "Rex Light" can be found on the web](https://fonts2u.com/rexlight.font)
Other fonts are bitmaps.
```
s: "123456789-123456789-123456789-"
f1: make font! [name: "Script" size: 14]
f2: make font! [name: "Rex Light" size: 14]
f3: make font! [name: "MS Serif" size: 14]
view compose/deep [
	backdrop purple below
	box purple 300x20 draw [font f1 text 0x0 (s)]
	box purple 300x20 draw [font f2 text 0x0 (s)]
	box purple 300x20 draw [font f3 text 0x0 (s)]
	box purple 300x20 font f1 s
	box purple 300x20 font f2 s
	box purple 300x20 font f3 s
	rich-text 300x20 purple font f1 s
	rich-text 300x20 purple font f2 s
	rich-text 300x20 purple font f3 s
	field font f1 s
	field font f2 s on-created [print size-text face]
	field font f3 s
]
```
Outputs: `0x0`

**Expected behavior**

Would be nice to have a full non-truetype font support.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 9-Jan-2019/5:46:16+03:00 commit #acf3492
W7
```



Comments:
--------------------------------------------------------------------------------

On 2019-07-30T07:58:58Z, bitbegin, commented:
<https://github.com/red/red/issues/3727#issuecomment-516309786>

    Duplicate of #3760 

--------------------------------------------------------------------------------

On 2019-07-30T08:04:45Z, bitbegin, commented:
<https://github.com/red/red/issues/3727#issuecomment-516311783>

    i can't found `script` and `MS Serif` font.
    use the latest `Red` will show this:
    
    ![image](https://user-images.githubusercontent.com/4469745/62111693-bc6b9c00-b2e3-11e9-9d03-26f2e9cf5706.png)

--------------------------------------------------------------------------------

On 2020-03-04T16:00:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/3727#issuecomment-594626762>

    Red 0.6.4 for Windows built 27-Feb-2020/6:07:00+03:00 commit #bf15211 on W7 with 125% scaling:
    ![](https://i.gyazo.com/9c0b160bdd55fa4ae3e91493267db167.png)
    
    `print` outputs 1x1 rather than 0x0 now. `box` doesn't display these fonts anymore because it has been moved to GDI+ tech.
    
    `rich-text` works with OTF fonts if I change the font name from `Rex Light` to `Rex` (as suspected by @qtxie :
    ![](https://i.gyazo.com/b9b8ce3245656ece783f9524ac8e54cd.png)

--------------------------------------------------------------------------------

On 2022-09-28T21:46:32Z, dockimbel, commented:
<https://github.com/red/red/issues/3727#issuecomment-1261498046>

    Returns `306x21` now.

