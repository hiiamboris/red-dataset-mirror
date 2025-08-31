
#3630: About dialog of Red console is odd
================================================================================
Issue is closed, was reported by saulery and has 30 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/3630>

The about dialog of Red console it odd. It seems the labels have a grey / white color on a black background.

Tested with red-03dec18-31c0a32a.exe on Windows 7 64 bits.


Comments:
--------------------------------------------------------------------------------

On 2018-12-03T18:16:07Z, greggirwin, commented:
<https://github.com/red/red/issues/3630#issuecomment-443811677>

    Is it the same on older builds? Any special display settings? Can you post a screenshot?

--------------------------------------------------------------------------------

On 2018-12-04T15:24:02Z, endo64, commented:
<https://github.com/red/red/issues/3630#issuecomment-444138995>

    Looks normal on W10.

--------------------------------------------------------------------------------

On 2018-12-09T19:23:36Z, greggirwin, commented:
<https://github.com/red/red/issues/3630#issuecomment-445563887>

    Failing any new comments from @lkppo, I'm planning  to close this ticket.

--------------------------------------------------------------------------------

On 2018-12-09T19:49:28Z, saulery, commented:
<https://github.com/red/red/issues/3630#issuecomment-445565755>

    Hi Gregg. It's working on Windows 10, good, but on Windows 7 it's not working. What to add? I can't post an image because my browser version is to old for github. I will post it on the list.

--------------------------------------------------------------------------------

On 2018-12-09T19:55:54Z, saulery, commented:
<https://github.com/red/red/issues/3630#issuecomment-445566212>

    Le 09/12/2018 à 20:23, Gregg Irwin a écrit :
    > Failing any new comments from @lkppo <https://github.com/lkppo>, I'm 
    > planning to close this ticket.
    
    Here is what to illustrate the bug #3630.
    
    -- 
    Stéphane Aulery

--------------------------------------------------------------------------------

On 2018-12-09T20:17:33Z, greggirwin, commented:
<https://github.com/red/red/issues/3630#issuecomment-445567848>

    Starting with the following, assuming it shows the problem for you, tweak it and see if you can make the problem go away, e.g., change style colors, include alpha value, eliminate styles. What is the most basic thing that shows the problem.
    ```
    	view [
    		title "About"
    		backdrop 58.58.60
    
    		style text:  text 360 center 58.58.60
    		style txt:   text font-color white
    		style small: txt  font [size: 9 color: white]
    
    		below
    		txt bold "Red Programming Language" font [size: 15 color: white]
    		small 360x20 "Copyright 2011-2018 - Red Foundation"
    		button "Close" [unview]
    	]
    ```

--------------------------------------------------------------------------------

On 2018-12-09T21:31:15Z, saulery, commented:
<https://github.com/red/red/issues/3630#issuecomment-445573530>

    Your code shows the bug. I will try debug it. Thanks.
    
    -- 
    Stéphane Aulery

--------------------------------------------------------------------------------

On 2018-12-12T14:12:56Z, saulery, commented:
<https://github.com/red/red/issues/3630#issuecomment-446601253>

    Le 09/12/2018 à 21:17, Gregg Irwin a écrit :
    > Starting with the following, assuming it shows the problem for you, 
    > tweak it and see if you can make the problem go away, e.g., change style 
    > colors, include alpha value, eliminate styles. What is the most basic 
    > thing that shows the problem.
    > 
    > |view [ title "About" backdrop 58.58.60 style text: text 360 center 
    > 58.58.60 style txt: text font-color white style small: txt font [size: 9 
    > color: white] below txt bold "Red Programming Language" font [size: 15 
    > color: white] small 360x20 "Copyright 2011-2018 - Red Foundation" button 
    > "Close" [unview] ] |
    
    If "backdrop 58.58.60" is commented, the background is consistent.
    
    Changing alphp do nothing.
    
    It seems "style text:  text 360 center 58.58.60" doesn't change the 
    background color. "style text:  text 360 center" give the same output.
    
    So I did "style text:  field 360 center 58.58.60 no-border" and it's worked:
    
    view [
    	title "About"
    	backdrop 58.58.60
    
    	style text:  field 360 center 58.58.60 no-border
    	style txt:   text font-color white
    	style small: txt  font [size: 9 color: white]
    
    	below
    	txt bold "Red Programming Language" font [size: 15 color: white]
    	small 360x20 "Copyright 2011-2018 - Red Foundation"
    	button "Close" [unview]
    ]
    
    Can text face have a background?
    
    -- 
    Stéphane Aulery

--------------------------------------------------------------------------------

On 2018-12-12T20:20:51Z, greggirwin, commented:
<https://github.com/red/red/issues/3630#issuecomment-446730085>

    @endo64 can you follow up on this, to make sure @qtxie has what he needs to comment or fix?

--------------------------------------------------------------------------------

On 2018-12-13T11:56:55Z, qtxie, commented:
<https://github.com/red/red/issues/3630#issuecomment-446943151>

    @lkppo Yes. `Text` face has a background. Does it work for you? The background of the "def" should be red.
    ```
    view [style text2: text 222.0.0 text "abc" text2 "def"]
    ```

--------------------------------------------------------------------------------

On 2018-12-13T21:13:38Z, saulery, commented:
<https://github.com/red/red/issues/3630#issuecomment-447122654>

    Le 13/12/2018 à 12:57, Qingtian a écrit :
    > @lkppo <https://github.com/lkppo> Yes. |Text| face has a background. 
    > Does it work for you? The background of the "def" should be red.
    > 
    > |view [style text2: text 222.0.0 text "abc" text2 "def"] |
    
    It's not working. I see black texts on the default background color (grey).
    
    -- 
    Stéphane Aulery

--------------------------------------------------------------------------------

On 2018-12-14T23:36:24Z, endo64, commented:
<https://github.com/red/red/issues/3630#issuecomment-447510434>

    @qtxie @lkppo I see red background on Win10, I have no Win7 installed so cannot test on it.

--------------------------------------------------------------------------------

On 2018-12-15T00:12:18Z, qtxie, commented:
<https://github.com/red/red/issues/3630#issuecomment-447515890>

    @lkppo Are you using the default Aero theme on Win7?

--------------------------------------------------------------------------------

On 2018-12-15T01:13:00Z, saulery, commented:
<https://github.com/red/red/issues/3630#issuecomment-447523593>

    Le 15/12/2018 à 01:12, Qingtian a écrit :
    > @lkppo <https://github.com/lkppo> Are you using the default Aero theme 
    > on Win7?
    
    No, I switched to defaults (Aero) and It's not working better.
    
    -- 
    Stéphane Aulery

--------------------------------------------------------------------------------

On 2018-12-15T05:45:24Z, saulery, commented:
<https://github.com/red/red/issues/3630#issuecomment-447539734>

    New phenomenon.
    
    I just downloaded the latest version (red-14dec18-25777f5e.exe) and at 
    the end of compilation the console is displayed. I immediately opened 
    the dialog and it was correct.
    
    I closed the console, then I reopened it. The dialog was yet false.
    
    Looking more closely I realize that if I run a version 0.6.3 there is an 
    error, while the 0.6.4 is correct.
    
    In fact I run the console with an icon pinned to the task bar. He did 
    not pin the downloaded version but the compiled version which explains 
    the inconsistency.
    
    I think I made you look for nothing. Sorry.
    
    -- 
    Stéphane Aulery

