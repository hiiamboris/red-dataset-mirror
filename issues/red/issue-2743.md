
#2743: [DRAW] The cap edge of a ellipse ARC with thick line-width will not tangent to the center of the ellipse.
================================================================================
Issue is open, was reported by JenniferLee520 and has 12 comment(s).
[GUI] [type.design]
<https://github.com/red/red/issues/2743>

See for yourself.
```Red
view [ box white 100x100 draw [ line-width 15 fill-pen yellow pen gray circle 50x50 40 20 pen black arc 50x50 40x20 0 45] ]
```
Both in Windows and Mac.



Comments:
--------------------------------------------------------------------------------

On 2017-06-03T10:43:57Z, dockimbel, commented:
<https://github.com/red/red/issues/2743#issuecomment-305967150>

    ![image](https://cloud.githubusercontent.com/assets/411393/26752889/9355e8f2-488c-11e7-874e-f088c0a8acce.png)
    
    The right focal point is used in both Rebol and Red, I think that's correct. Though, the arc in Red is bigger than the Rebol's one, it needs checking to see which one correctly covers the 45° angle.

--------------------------------------------------------------------------------

On 2017-06-19T07:11:57Z, qtxie, commented:
<https://github.com/red/red/issues/2743#issuecomment-309357408>

    See the use following code:
    ```
    view layout [
    	box white 100x100 effect [draw [
    		line-width 1 fill-pen yellow pen gray
    		circle 50x50 40 20 pen black arc 50x50 40x20 0 45 closed
    		pen red arc 50x50 40x40 0 45]
    	]
    ]
    ```
    ![_20170619150901](https://user-images.githubusercontent.com/1673525/27273425-94e32cee-5501-11e7-99d3-27fc9a48f9b3.png) ![_20170619151045](https://user-images.githubusercontent.com/1673525/27273427-961bc800-5501-11e7-8271-d5ff0b6a257a.png)
    Seems Red is correct.

--------------------------------------------------------------------------------

On 2017-06-19T18:17:51Z, greggirwin, commented:
<https://github.com/red/red/issues/2743#issuecomment-309522977>

    Red code for the above example:
    ```
    view layout [
    	box white 100x100 draw [
    		line-width 1 fill-pen yellow pen gray
    		circle 50x50 40 20 pen black arc 50x50 40x20 0 45 closed
    		pen red arc 50x50 40x40 0 45
    	]
    ]
    ```

--------------------------------------------------------------------------------

On 2019-10-07T14:35:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/2743#issuecomment-539042599>

    An interesting issue. REBOL measures degrees in ellipse's (arc's) coordinates, while Red measures these in XY plane. I would probably prefer the REBOL version, although both are correct in a way:
    `view [ box white 200x200 draw [ scale 2 2 line-width 2 line 0x0 100x100 box 10x30 90x70 fill-pen yellow pen gray circle 50x50 40 20 pen black arc 50x50 40x20 0 45] ]`
    ![](https://i.gyazo.com/9d63cd0d36556e80ba855c9835400dbd.png)

--------------------------------------------------------------------------------

On 2019-10-07T18:01:42Z, greggirwin, commented:
<https://github.com/red/red/issues/2743#issuecomment-539133218>

    I do so love added visualizations. :^) A big part of that is how Red helps us see what it's doing.

--------------------------------------------------------------------------------

On 2019-10-07T18:11:15Z, hiiamboris, commented:
<https://github.com/red/red/issues/2743#issuecomment-539136999>

    As for the original edge alignment problem. I believe the line caps are orthogonal to the line where they appear. And it's unlikely under our control anyway. @qtxie will know for sure.

