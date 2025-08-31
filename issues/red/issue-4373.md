
#4373: [View, CRASH] When copying fonts (GC is unable to release)
================================================================================
Issue is closed, was reported by hiiamboris and has 26 comment(s).
[status.built] [status.tested] [type.bug] [GUI] [type.GC] [type.design]
<https://github.com/red/red/issues/4373>

**Describe the bug**

This says it all:
![](https://i.gyazo.com/1900ec61e75c1efe15a104660c17f90b.jpg)

Run the provided script
First, some of the bases lose their text (matter of 3-5 seconds)
Second, window stops updating (try to move it around!)
Third, if you wait long enough, OS will hardly be able to draw Task Manager window (turn GC on so it doesn't run out of memory for that)

**To reproduce**

Be ready to kill the console in the process list
```
Red [needs: view]

recycle/off

view/options collect [
	keep [backdrop magenta space 2x2]
	repeat i 450 [
		keep compose [base 40x40 (random white)]
		if i % 30 = 0 [keep 'return]
	]
][
	rate: 20
	actors: object [
		on-time: function [fa ev] [
			foreach base fa/pane [
				base/draw: compose [font (make font! [size: 20]) text 0x0 "ABC"]
			]
		]
	]
]
```

**Expected behavior**

Should reallocate fonts without issues. It works fine with static fonts.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 30-Mar-2020/20:23:44+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-03-30T18:27:24Z, greggirwin, commented:
<https://github.com/red/red/issues/4373#issuecomment-606165250>

    This is good to know about, especially if it happens with less faces and slower updates. If that's not the case, allocating 9'000 fonts per second isn't likely to happen in the real world. Offering a Best Practice may be enough.

--------------------------------------------------------------------------------

On 2020-03-30T18:30:50Z, greggirwin, commented:
<https://github.com/red/red/issues/4373#issuecomment-606167065>

    Works fine here on Win10, so maybe a Win7 issue. I let it run until it used ~2GB, then stopped it. A manual `recycle` is taking quite a while. Maybe due to so many small allocations being handled separately.

--------------------------------------------------------------------------------

On 2020-03-30T18:50:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/4373#issuecomment-606177241>

    It crashes my test system UI in ~15 seconds simply because I was lazy to define a static font for it. Talk about real world applications ;)

--------------------------------------------------------------------------------

On 2020-03-30T19:26:19Z, greggirwin, commented:
<https://github.com/red/red/issues/4373#issuecomment-606197649>

    Hmmm, what does the app do?

--------------------------------------------------------------------------------

On 2020-03-30T19:27:46Z, greggirwin, commented:
<https://github.com/red/red/issues/4373#issuecomment-606198340>

    I will say that this _kind_ of thing is important if we brute force small spreadsheets.

--------------------------------------------------------------------------------

On 2020-03-30T19:37:55Z, greggirwin, commented:
<https://github.com/red/red/issues/4373#issuecomment-606203256>

    Ah, your elastic GUI is probably where it came from. 

--------------------------------------------------------------------------------

On 2020-03-30T19:40:42Z, greggirwin, commented:
<https://github.com/red/red/issues/4373#issuecomment-606204599>

    Funny, I just mentioned to Maarten that a constraint based layout system like Cassowary has come up in the past.

--------------------------------------------------------------------------------

On 2020-03-30T19:41:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/4373#issuecomment-606204975>

    > Hmmm, what does the app do?
    
    Just updates it's state 3 times a sec (and it has ~100 base faces). Nothing more.
    Consider this. Test is simple. There aren't many points of failure there. But the real world app's complexity is orders of magnitude more, and all that complexity is potential points of failure, and as a result it is affected greatly. I wouldn't advise to dismiss the issue lightly without [first running it, running all the tests, and seeing how low Red's stability is - as it will most likely crash during the run, even though I disabled fonts recreation (otherwise it would be unusable)](https://github.com/hiiamboris/red/tree/view-test-system) 

--------------------------------------------------------------------------------

On 2020-03-30T19:44:18Z, hiiamboris, commented:
<https://github.com/red/red/issues/4373#issuecomment-606206270>

    > Ah, your elastic GUI is probably where it came from.
    
    Not exactly. Elastic UI just handles a few widgets, while I'm arranging all issues into tiles and using custom arrangement algorithm for that (I think it's too uncommon to provide in a general purpose UI lib)

--------------------------------------------------------------------------------

On 2020-03-30T19:51:01Z, greggirwin, commented:
<https://github.com/red/red/issues/4373#issuecomment-606209655>

    Sure. I hope @qtxie can make time to look into your test system soon. You've turned up a lot of important issues.

--------------------------------------------------------------------------------

On 2020-03-31T11:18:03Z, qtxie, commented:
<https://github.com/red/red/issues/4373#issuecomment-606564296>

    The GC cannot release OS resources currently. Image! has the same issue.

--------------------------------------------------------------------------------

On 2020-12-25T17:00:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/4373#issuecomment-751271733>

    Crash scenario:
    ```
    Red [needs: view]
    
    font: make font! [name: "Antiqua"]
    loop 5000 [       ;) if it doesn't crash for you - increase the count
    	lt: rtd-layout ["text"]
    	lt/font: copy font
    	size-text lt
    ]
    view [text "visible"]
    ```
    
    I was profiling some code where temporary rich-text faces were generated to draw text on a layout. 50 faces * 100 times (for profiling reliability) makes for 5000 fonts, unfortunately. After that I either see a blank console (without letters) or a crash:
    ```
    *** Runtime Error 1: access violation
    *** Cannot determine source file/line info.
    ***
    ```

--------------------------------------------------------------------------------

On 2024-12-04T21:41:30Z, dockimbel, commented:
<https://github.com/red/red/issues/4373#issuecomment-2518618211>

    I'm closing the ticket as the main issue reported is now fixed.
    
    For the "Crash scenario:", I don't get any crash, though, the window does not display. Most probably Windows is running out of graphic handles, so it's an OS limitation. If you think something is wrong with Red there, feel free to open a new ticket to examine it again.

