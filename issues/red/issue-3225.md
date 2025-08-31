
#3225: TEXT in DRAW does not honour TRANSLATE command
================================================================================
Issue is closed, was reported by rebolek and has 28 comment(s).
[type.bug] [status.reviewed] [GUI]
<https://github.com/red/red/issues/3225>

See this code:

```
view [
    base 300x100 draw [
        push [translate 50x20 
            fill-pen 230.145.190 circle 10x10 10 
            text 20x0 "Text" 
        ]
    ]
]
```

### Expected behavior

Expected is to have both circle and text moved by 50x20.

### Actual behavior

![](https://files.gitter.im/red/red/gui-branch/0977/image.png)

### Steps to reproduce the problem

Run the above code.

### Red version and build date, operating system with version.

Win 10 with system/build/date: 18-Jan-2018/11:35:36+01:00
Wine, Red for Windows version 0.6.3 built 25-Jan-2018/23:52:32+05:00


Comments:
--------------------------------------------------------------------------------

On 2018-02-15T20:09:32Z, StephaneVeneri, commented:
<https://github.com/red/red/issues/3225#issuecomment-366046647>

    Seems to be working properly on macOs 10.12.6.
    With Red for macOS version 0.6.3 built 20-Jan-2018/23:49:34+01:00
    
    ![test](https://user-images.githubusercontent.com/10183753/36278489-430e21a2-1294-11e8-9c1e-106a94adb043.jpeg)

--------------------------------------------------------------------------------

On 2018-02-16T04:38:06Z, toomasv, commented:
<https://github.com/red/red/issues/3225#issuecomment-366142249>

    On W10 `text` is put always on its provided coordinates unregarding transformations:
    ```
    view [base 300x100 draw [matrix [1 0 0 1 50 20] text 0x0 "Text" box 0x0 30x20]]
    view [base 300x100 draw [translate 50x20 text 0x0 "Text" box 0x0 30x20]]
    view [base 300x100 draw [transform 0x0 0 1 1 50x20 text 0x0 "Text" box 0x0 30x20]]
    ```
    All these result in
    ![try2](https://user-images.githubusercontent.com/11960635/36293637-dc8122d6-12e3-11e8-8e1a-cd2bca88bf53.png)

--------------------------------------------------------------------------------

On 2018-02-21T14:22:32Z, Zamlox, commented:
<https://github.com/red/red/issues/3225#issuecomment-367341443>

    @qtxie perhaps replacing ```ExtTextOut``` with ```GdipDrawString``` ? 

--------------------------------------------------------------------------------

On 2018-02-23T02:56:43Z, qtxie, commented:
<https://github.com/red/red/issues/3225#issuecomment-367894980>

    @Zamlox Yes. We can try that.

--------------------------------------------------------------------------------

On 2018-02-23T16:54:55Z, Zamlox, commented:
<https://github.com/red/red/issues/3225#issuecomment-368068606>

    @qtxie An alternative solution would be to replace 
    ```either ctx/on-image?``` with ```either any [ctx/on-image? ctx/other/GDI+?]``` 
    in ```OS-draw-text```, because when text is drawn, flag ```ctx/other/GDI+?``` is set to ```yes```. Currently the false branch of that either is selected which is not ok. 
    To work properly this change will require following additions in ```draw-begin```
       - a call to ```update-gdiplus-font-color```
       - selecting ```default-font``` in device context (```GdipCreateFontFromDC``` will work only if a font is selected in device context). Also currently the font is not same if text is drawn on image or window (run command in gui console: ```view compose/deep [base 100x100 draw [image (draw 40x30 [text 10x10 "Hello"]) text 10x40 "Hello" ]]```). 
    
    If you agree with this fix I can push a PR
    
    

--------------------------------------------------------------------------------

On 2018-02-23T20:10:21Z, Zamlox, commented:
<https://github.com/red/red/issues/3225#issuecomment-368125358>

    @qtxie Do you remember what was the reason do combine GDI/GDI+ ? Can we remove code based on GDI ?

--------------------------------------------------------------------------------

On 2018-02-23T21:21:32Z, rebolek, commented:
<https://github.com/red/red/issues/3225#issuecomment-368141998>

    @Zamlox could be because of XP support?

--------------------------------------------------------------------------------

On 2018-02-23T23:02:17Z, Zamlox, commented:
<https://github.com/red/red/issues/3225#issuecomment-368163514>

    @rebolek Windows XP has support for GDI+. Maybe for older version of Windows.
    But there are features implemented taking into consideration only GDI+. For example ```anti-alias``` draw command is using GDI+ functions regardless of the value set ```on/off```. 
    An alternative would be to have different layers for these technologies: GDI/GDI+/Direct2D and not to mix them. A detection can be done at startup to choose the right layer. The disadvantage would be more lines of code to be written.

--------------------------------------------------------------------------------

On 2018-02-24T03:17:49Z, rebolek, commented:
<https://github.com/red/red/issues/3225#issuecomment-368194599>

    @Zamlox 
    > Windows XP has support for GDI+. 
    
    Thanks, I'm no expert on this, so it was just a wild guess.
    
    > Maybe for older version of Windows.
    
    Windows XP is the oldest version supported.
    
    > An alternative would be to have different layers for these technologies
    
    This seems reasonable to me.

--------------------------------------------------------------------------------

On 2018-02-25T02:40:44Z, qtxie, commented:
<https://github.com/red/red/issues/3225#issuecomment-368278144>

    @Zamlox 
    > Do you remember what was the reason do combine GDI/GDI+ ?
    
    I think for [performance reason](http://forums.codeguru.com/showthread.php?306662-GDI-versus-GDI-and-the-winner-iiiiiiIIIS).
    
    > Can we remove code based on GDI ?
    
    Yes, I think we should. Mix GDI and GDI+ causes too many problems. One big issue which is not solved is matrix transformation switch between GDI and GDI+, though nobody reported this issue yet. :sweat_smile:
    
    > An alternative would be to have different layers for these technologies
    
    I agree with you. 

--------------------------------------------------------------------------------

On 2018-03-11T13:32:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/3225#issuecomment-372115854>

    For a more complete overview, text is unaffected by all matrix transformations and by clipping (w7 x64, red 2018-2-26-30151 and 2017-8-3-49893):
    ![](https://i.gyazo.com/06380406291be017fec016f9dbbab123.png)
    source:
    ```
    Red [Needs: 'View]
    
    view [
    	below
    	base 200x100 draw [
    		fill-pen blue
    		box 0x0 100x20
    		text 0x0 "quick browne bear"
    	]
    	base 200x100 draw [
    		translate 50x10
    		fill-pen blue
    		box 0x0 100x20
    		text 0x0 "quick browne bear"
    	]
    	base 200x100 draw [
    		clip 10x0 30x30 replace [
    			fill-pen blue
    			box 0x0 100x20
    			text 0x0 "quick browne bear"
    		]
    	]
    	base 200x100 draw [
    		scale 3 3 [
    			fill-pen blue
    			box 0x0 100x20
    			text 0x0 "quick browne bear"
    		]
    	]
    	base 200x100 draw [
    		skew 10 30 [
    			fill-pen blue
    			box 0x0 100x20
    			text 0x0 "quick browne bear"
    		]
    	]
    	base 200x100 draw [
    		rotate 30 0x0 [
    			fill-pen blue
    			box 0x0 100x20
    			text 0x0 "quick browne bear"
    		]
    	]
    ]
    ```

--------------------------------------------------------------------------------

On 2018-11-30T14:39:10Z, moliad, commented:
<https://github.com/red/red/issues/3225#issuecomment-443222926>

    Implementing a node graph editor, the text is still not following the matrix transformations (quite a few releases have gone by).
    
    this brings back Rebol2 memories which had similar problems (painful memories).

--------------------------------------------------------------------------------

On 2018-11-30T15:07:36Z, rebolek, commented:
<https://github.com/red/red/issues/3225#issuecomment-443231793>

    At least Red is not closed source, like Rebol2 was.

--------------------------------------------------------------------------------

On 2019-09-04T15:08:13Z, toomasv, commented:
<https://github.com/red/red/issues/3225#issuecomment-527944664>

    Workaround: Text will move (on W10) if face has transparent/no color, e.g. `box`:
    ```
    view [
        box 300x100 draw [ ; or `base glass` or `base 128.128.128.1`
            push [translate 50x20 
                fill-pen 230.145.190 circle 10x10 10 
                text 20x0 "Text" 
            ]
        ]
    ]
    ```
    matrix-transformations work also in this way. Background can be set e.g. with `backdrop` or panel.

