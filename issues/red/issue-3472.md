
#3472: Help text sometimes overflows to the next line
================================================================================
Issue is closed, was reported by dander and has 30 comment(s).
<https://github.com/red/red/issues/3472>

### Expected behavior
There should be a single line for each entry in the help text.
### Actual behavior
The descriptions that are too long to fit are trimmed with ellipsis, but not trimmed quite short enough.
![image](https://user-images.githubusercontent.com/1302979/42801786-a06348a4-8955-11e8-998d-62ab3417c418.png)
The Gui console seems to wrap a little more aggressively because it wraps at word boundaries.
![image](https://user-images.githubusercontent.com/1302979/42801718-63dd8368-8955-11e8-9f43-2926130f7084.png)

I spent some time looking at the code, and I thought the reason was because the width calculated for the descriptive text is based on the other column widths, but doesn't seem to take into account extra spaces between columns (the `_print` method using `form reduce`). I had trouble verifying that, however.
### Steps to reproduce the problem
Run `? "series"` in gui or cli console. I experience the issue in both, but several people do not have it. See the discussion from here: https://gitter.im/red/bugs?at=5b4c36611c0f906b145a253a

### Red and platform version
```
RED: [ branch: "master" tag: #v0.6.3 ahead: 791 date: 15-Jul-2018/2:03:36 commit: #8b2db6bb9417d65f5fea3a70c5acdd1fcea3f8dd ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
```


Comments:
--------------------------------------------------------------------------------

On 2018-07-17T07:13:40Z, dander, commented:
<https://github.com/red/red/issues/3472#issuecomment-405483317>

    Maybe related to #3336?

--------------------------------------------------------------------------------

On 2018-07-29T20:21:25Z, greggirwin, commented:
<https://github.com/red/red/issues/3472#issuecomment-408703220>

    @dander, there is a help-ctx/RT_MARGIN value. If you play with that, can you find a value where this behavior goes away. It was derived empirically, and is set to 5 right now. For me, 7 works for CLI, while 4 is OK for GUI.

--------------------------------------------------------------------------------

On 2018-07-29T20:22:18Z, greggirwin, commented:
<https://github.com/red/red/issues/3472#issuecomment-408703280>

    This may very well be affected by font choices as well, which makes it tricky.

--------------------------------------------------------------------------------

On 2018-07-30T17:04:40Z, dander, commented:
<https://github.com/red/red/issues/3472#issuecomment-408937266>

    If the font affects it, that would imply that the calculation of `system/console/size` is incorrect, right? That seems like it would be a separate issue to me. @greggirwin do you think it would be useful to have a more general purpose text column formatter? That would be more work, but could come in handy for other things...
    Increasing the margin value would work, but just seems a little hard to understand when looking at the code. I sort of left out this part of my explanation, but the reason I highlighted the section in the GUI console screenshot was to point out that this area is a bit larger than expected:
    `HELP_TYPE_COL_SIZE: 12	; Minimum size of the datatype output column. 12 = "refinement!" + 1` (was a longer datatype added?).

--------------------------------------------------------------------------------

On 2018-07-30T17:37:50Z, greggirwin, commented:
<https://github.com/red/red/issues/3472#issuecomment-408947795>

    Agreed on fonts. I haven't tested to see. 
    
    @toomasv has done some nice column formatting work, and it will be great to have. @giesse also added some to his new profiling work. The `format` module will certainly include something like that.
    
    The type col width issue, which seems to be off by one, is because there's a definition separator between the columns (DEF_SEP), so `print` gives us an extra space there. Took me a minute to suss that out as well. :^) `Help` is deceiving, at least it was to me, because it seems like it should be simple and consistent, but you can see from the code that trying to produce the most useful output for the various results means a lot of specialized code.

--------------------------------------------------------------------------------

On 2018-07-30T17:39:54Z, greggirwin, commented:
<https://github.com/red/red/issues/3472#issuecomment-408948444>

    One of the nice things is that we can play with the config values in `help-ctx` to experiment, and see if we can produce better results.

--------------------------------------------------------------------------------

On 2018-08-15T23:21:19Z, greggirwin, commented:
<https://github.com/red/red/issues/3472#issuecomment-413370179>

    Any further thoughts here @dander?

--------------------------------------------------------------------------------

On 2018-08-16T04:10:19Z, toomasv, commented:
<https://github.com/red/red/issues/3472#issuecomment-413419710>

    @greggirwin I see you mentioned my column formatting thing. How can I help here?

--------------------------------------------------------------------------------

On 2018-08-16T16:05:53Z, dander, commented:
<https://github.com/red/red/issues/3472#issuecomment-413598341>

    I attempted to respond last night, but fell asleep in my chair. I will regroup and try again tonight!

--------------------------------------------------------------------------------

On 2018-08-16T18:29:29Z, greggirwin, commented:
<https://github.com/red/red/issues/3472#issuecomment-413641658>

    @toomasv that was in response to @dander  saying:
    
    > do you think it would be useful to have a more general purpose text column formatter? 
    
    I don't think we want to roll that into `help` right now though. 

--------------------------------------------------------------------------------

On 2018-08-17T07:47:11Z, dander, commented:
<https://github.com/red/red/issues/3472#issuecomment-413786297>

    @greggirwin it seems like increasing the `help-ctx/RT_MARGIN` by a bit works fine, and is the simplest fix. Out of curiosity, what about changing the part of `_print` method which inserts the extra spaces?
    
    ```
    	_print: func [value][
    		_prin value
    		append output-buffer newline
    	]
    	_prin: func [value][
    		append output-buffer case [
    			string? :value [value]
    			block?  :value [form reduce value]
    			char?   :value [form value]
    			'else [mold :value]
    		]
    	]
    ```
    
    `block?  :value [form reduce value]` could be changed to `block?  :value [rejoin value]`. That would get rid of some extra spaces, but would that break other stuff?

--------------------------------------------------------------------------------

On 2018-08-19T17:13:20Z, greggirwin, commented:
<https://github.com/red/red/issues/3472#issuecomment-414141680>

    It wouldn't break things, but it would make columns butt up against each other. The spaces are there for readability.

--------------------------------------------------------------------------------

On 2018-08-20T00:06:52Z, greggirwin, commented:
<https://github.com/red/red/issues/3472#issuecomment-414165791>

    @dander, what value was "a bit" that worked for you?

--------------------------------------------------------------------------------

On 2018-08-20T05:23:52Z, dander, commented:
<https://github.com/red/red/issues/3472#issuecomment-414200536>

    @greggirwin, when I wrote that, I had changed it from 5 to 7, but playing around with it just now, it seems that 6 works fine for me as well. Though the ellipses but right up to the edge of the window then. Having one extra space along the border is kind of nice, but could go either way. It looks like it works in both cli and gui for me.

--------------------------------------------------------------------------------

On 2018-08-20T17:48:45Z, greggirwin, commented:
<https://github.com/red/red/issues/3472#issuecomment-414404348>

    Great, thanks.

