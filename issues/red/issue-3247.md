
#3247: VID: unexpected override of system default colors with black on white
================================================================================
Issue is closed, was reported by hiiamboris and has 16 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3247>

### Expected behavior
left part of the screenshot
![](https://i.gyazo.com/7bdd02120998cdfcafb652a71f7ef847.png)
### Actual behavior
right part of the screenshot
### Steps to reproduce the problem
any specification of font-related properties seems to produce the behavior, like in this snippet:
```
Red [Needs: 'View]

view [
	field
	field font-size 10
	return
	area
	area font [size: 20 name: "Courier New"]
]
```
### Red version and build date, operating system with version.
Red for Windows version 0.6.3 built 7-Mar-2018/21:17:02+03:00 (nightly)
Red for Windows version 0.6.3 built 3-Mar-2018/0:44:14+03:00 (stable)


Comments:
--------------------------------------------------------------------------------

On 2018-03-08T18:47:57Z, greggirwin, commented:
<https://github.com/red/red/issues/3247#issuecomment-371584566>

    What OS version and default settings?

--------------------------------------------------------------------------------

On 2018-03-08T20:43:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/3247#issuecomment-371618038>

    w7 x64 v6.1.7601, system locale ruRU
    idk what default settings do you mean?
    it's in GDI mode (not Aero)
    I can upload the theme, here: https://pastebin.com/1RSqgALC
    (based on Classical theme, just spelled in RU)

--------------------------------------------------------------------------------

On 2018-03-08T21:06:15Z, hiiamboris, commented:
<https://github.com/red/red/issues/3247#issuecomment-371624253>

    just tested it on w8 x64 v6.3.9600 enUS
    same behavior as on w7
    theme: https://pastebin.com/pvmFYUjm
    (based on high contrast, though it's aero now since theres no GDI mode in w8)

--------------------------------------------------------------------------------

On 2018-03-09T04:27:09Z, dockimbel, commented:
<https://github.com/red/red/issues/3247#issuecomment-371710071>

    @qtxie This looks like a leaking system font handle that is re-used to create a user custom font.

--------------------------------------------------------------------------------

On 2018-03-11T09:52:16Z, qtxie, commented:
<https://github.com/red/red/issues/3247#issuecomment-372102687>

    ```
    layout [t: field font-size 10]
    t/font/color
    ```
    The font color is 0.0.0 (black).  That means VID should set the font color to system default font color or just `none`, if the user didn't specify it.

--------------------------------------------------------------------------------

On 2020-03-12T20:06:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/3247#issuecomment-598389217>

    I'm experiencing some other overrides.
    ![](https://i.gyazo.com/953e9d3d4efaaa74d05549976aad6591.png)
    ```
    view [
    	field 100
    	field 100 font-color blue
    	field 100 font-color blue with [color: none]
    	return
    	area 100
    	area 100 font-color blue
    	area 100 font-color blue with [color: none]
    ]
    ```
    Is this by design?

--------------------------------------------------------------------------------

On 2020-03-12T21:09:45Z, greggirwin, commented:
<https://github.com/red/red/issues/3247#issuecomment-598419538>

    Maybe a Win7 issue. Here's what I get on Win10, so not by design I think.
    ![image](https://user-images.githubusercontent.com/460079/76566850-44697500-6473-11ea-968d-2e5b56f17fac.png)

--------------------------------------------------------------------------------

On 2020-03-12T21:16:01Z, greggirwin, commented:
<https://github.com/red/red/issues/3247#issuecomment-598421803>

    I do love having native interfaces, but I imagine @qtxie shakes his fist at various APIs quite a lot.

