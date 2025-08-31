
#4213: [Draw] Regression: Monospaced typesetting became erratic
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[type.bug] [GUI] [type.task.wish]
<https://github.com/red/red/issues/4213>

Regression was introduced between Oct 01 and Dec 10 somewhere.

**Describe the bug**

This is the result for all builds up to Oct 01:
![](https://i.gyazo.com/51e0ba8ca7e9f626bceec472b65b9590.png)

This is from Oct18 up to Dec 03 (thanks to https://github.com/red/red/issues/4116 obviously - font is not applied at all):
![](https://i.gyazo.com/9f0b7ce6d950c7414a1aefc37bde6e8c.png)

This is Dec 10 and after it:
![](https://i.gyazo.com/7da0bd5c264d77ba1e49d923a58645f8.png)

As you can see the font is supported, the numbers are aligned, but spaces after the numbers become of random size.

**To reproduce**
```
draw': [font font pen magenta
     text 0x10  {                     init-events: "red/object/init-events" [ctx [pointer! [integer!]] idx-s [integer!] loc-s [integer!] idx-d [integer!] loc-d [integer!] return: [pointer! [integer!]]] } 
     text 0x30  {                     get-values: "red/object/get-values" [obj [red-object!] return: [cell!]] }
     text 0x50  {                     path-parent: "red/object/path-parent" [cell!] }
     text 0x110 { 614                 init-events: "red/object/init-events" [ctx [pointer! [integer!]] idx-s [integer!] loc-s [integer!] idx-d [integer!] loc-d [integer!] return: [pointer! [integer!]]] } 
     text 0x130 { 617                 get-values: "red/object/get-values" [obj [red-object!] return: [cell!]] }
     text 0x150 { 620                 path-parent: "red/object/path-parent" [cell!] }
]

font: make font! [name: "ZX Spectrum-7" size: 18]
; font: make font! [name: "FixedsysTTF Monospace" size: 15]
view compose/deep [
	base 800x200 cyan draw [(draw')]
]
```
Observed on two fonts: [ZX Spectrum-7](https://dl.dafont.com/dl/?f=zx_spectrum_7) and [FixedsysTTF](https://www.download-free-fonts.com/download/108271/66742601f3d382f1ed2fbbc41882b2a5)

**Expected behavior**

Lines being properly aligned, proper font applied

**Platform version (please complete the following information)**
W7


Comments:
--------------------------------------------------------------------------------

On 2019-12-31T20:12:36Z, greggirwin, commented:
<https://github.com/red/red/issues/4213#issuecomment-569984198>

    Can't dupe on Win10 with other fixed pitch fonts. I intalled ZX SPectrum 7, but it doesn't render anything on Win10. Could be bad internal font metrics. Something we could note on a GUI related wiki page or FAQ; things we know cause issues.

--------------------------------------------------------------------------------

On 2020-01-01T18:59:48Z, hiiamboris, commented:
<https://github.com/red/red/issues/4213#issuecomment-570075439>

    If you change `cyan` to `#FFFF000F` (to add transparency and turn on GDI+ rendering) in older (Oct 01 and before) builds, the text is not aligned. So it can safely be said that the regression was caused by switching from GDI to GDI+ rendering.
    
    So either (and likely) it's a GDI+ deficiency (no surprise there at all), or a bug in Draw's GDI+ text rendering pipeline. Should it be confirmed to be the former, let's just close the issue and make a note somewhere.

--------------------------------------------------------------------------------

On 2020-01-01T20:33:44Z, greggirwin, commented:
<https://github.com/red/red/issues/4213#issuecomment-570081537>

    Sounds good. I will let @qtxie or @bitbegin confirm.

