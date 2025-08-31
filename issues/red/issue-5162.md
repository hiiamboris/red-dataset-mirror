
#5162: [View] Screen font assignment is EXTREMELY slow
================================================================================
Issue is closed, was reported by hiiamboris and has 44 comment(s).
[status.dismissed] [GUI]
<https://github.com/red/red/issues/5162>

**Describe the bug**

I was trying to use `screen` face to measure text size with particular fonts.
`screen/font:` takes 500+ms per single assignment!

**To reproduce**

Run this test & resize the window:
```
Red [needs: view]
		
big-font: make font! [size: 20] 
screen: system/view/screens/1
check: function [size] [
	probe dt [screen/font: big-font]
]
view/flags [box "RESIZE ME" react [check face/parent/size]] 'resize
```
Observe the output:
```
0:00:00.001789
0:00:00.14907
0:00:00.161332
0:00:00.513947
0:00:00.63332
0:00:00.616829
0:00:00.56504
0:00:00.632194
0:00:00.595341
0:00:00.634261
0:00:00.589991
```

**Expected behavior**

Reasonable amount of time. ~1ms or less.

**Platform version**
```
Red 0.6.4 for Windows built 27-Jun-2022/11:51:28+03:00  commit #ed73e33
```



Comments:
--------------------------------------------------------------------------------

On 2022-07-21T02:51:59Z, qtxie, commented:
<https://github.com/red/red/issues/5162#issuecomment-1190978734>

    It takes 100+ms on my laptop.
    ```
    0:00:00.013002
    0:00:00.125856
    0:00:00.134539
    0:00:00.132538
    0:00:00.136788
    0:00:00.128999
    0:00:00.126908
    ```
    Assigning the font to other faces instead of `screen` takes less time, but still more than 80ms.

--------------------------------------------------------------------------------

On 2022-07-21T08:17:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/5162#issuecomment-1191186477>

    On my sometimes too. But it highly varies from run to run, esp in battery friendly mode.

--------------------------------------------------------------------------------

On 2022-08-08T14:01:21Z, dockimbel, commented:
<https://github.com/red/red/issues/5162#issuecomment-1208170799>

    > Reasonable amount of time. ~1ms or less.
    
    @hiiamboris Do you have any source that confirms that such speed should be the norm on Win10?

--------------------------------------------------------------------------------

On 2022-08-08T14:13:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/5162#issuecomment-1208185459>

    No. Just the common sense.

--------------------------------------------------------------------------------

On 2022-08-08T15:49:30Z, dockimbel, commented:
<https://github.com/red/red/issues/5162#issuecomment-1208300282>

    Then we should close the ticket, as there's nothing to work on there.

--------------------------------------------------------------------------------

On 2022-08-08T15:58:25Z, hiiamboris, commented:
<https://github.com/red/red/issues/5162#issuecomment-1208310261>

    Come on, really? Half second freeze on font assignment you deem acceptable?

--------------------------------------------------------------------------------

On 2022-08-08T16:11:36Z, hiiamboris, commented:
<https://github.com/red/red/issues/5162#issuecomment-1208324941>

    Why don't you just run the provided snippet first? It's over a second sometimes:
    ```
    0:00:00.129803
    0:00:00.78249
    0:00:01.28014
    0:00:01.32646
    0:00:00.995062
    0:00:01.0329
    0:00:01.26378
    0:00:01.09571
    ```
    If that's the UX we deem OK in Red, I have no further questions.

--------------------------------------------------------------------------------

On 2022-08-08T16:19:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/5162#issuecomment-1208333983>

    By the way, it has nothing to do with W10:
    ```
    Red [needs: view]
    
    #include %/d/devel/red/common/clock.red
    		
    big-font: make font! [size: 30] 
    screen: system/view/screens/1
    probe size-text/with screen "abcd"
    clock/times [set-quiet in screen 'font big-font] 1000
    probe size-text/with screen "abcd"
    clock [screen/font: big-font]
    probe size-text/with screen "abcd"
    ```
    Output:
    ```
    30x18
    0.17 μs	[set-quiet in screen 'font big-font]
    98x59
    144 ms	[screen/font: big-font]
    98x59
    ```

--------------------------------------------------------------------------------

On 2022-08-08T16:36:11Z, dockimbel, commented:
<https://github.com/red/red/issues/5162#issuecomment-1208352089>

    Here are the timings on my desktop PC under W10:
    ```
    0:00:00.0010008
    0:00:00.0390366
    0:00:00.0420375
    0:00:00.0380357
    0:00:00.0380353
    0:00:00.0251676
    0:00:00.0434031
    0:00:00.0406677
    0:00:00.0420378
    0:00:00.041037
    0:00:00.0400358
    0:00:00.0430391
    0:00:00.0400364
    0:00:00.0430386
    0:00:00.0420382
    0:00:00.0410355
    0:00:00.0420389
    0:00:00.0410371
    0:00:00.0410382
    0:00:00.0430392
    0:00:00.0410373
    0:00:00.0430388
    0:00:00.0420382
    0:00:00.0430397
    0:00:00.0440399
    0:00:00.0420376
    0:00:00.0410377
    0:00:00.0420381
    0:00:00.0440406
    0:00:00.0420383
    0:00:00.0410371
    ```

--------------------------------------------------------------------------------

On 2022-08-08T16:37:57Z, dockimbel, commented:
<https://github.com/red/red/issues/5162#issuecomment-1208353852>

    > By the way, it has nothing to do with W10:
    
    Next time, start with something like that rather than the highly subjective "common sense" and benchmarks done "in battery friendly mode."

--------------------------------------------------------------------------------

On 2022-08-08T16:45:24Z, dockimbel, commented:
<https://github.com/red/red/issues/5162#issuecomment-1208361369>

    Compiling and running the following script:
    ```
    Red [Needs: View]
    
    big-font: make font! [size: 30] 
    screen: system/view/screens/1
    probe size-text/with screen "abcd"
    probe dt [loop 1000 [set-quiet in screen 'font big-font]]
    probe size-text/with screen "abcd"
    probe dt [screen/font: big-font]
    probe size-text/with screen "abcd"
    ```
    I get: 
    ```
    30x18
    0:00:00
    98x59
    0:00:00
    98x59
    ```
    It so quick that `dt` can't measure it!
    
    The following variant, looping also 1000 times on the direct font assignment:
    ```
    big-font: make font! [size: 30] 
    screen: system/view/screens/1
    probe size-text/with screen "abcd"
    probe dt [loop 1000 [set-quiet in screen 'font big-font]]
    probe size-text/with screen "abcd"
    probe dt [loop 1000 [screen/font: big-font]]
    probe size-text/with screen "abcd"
    ```
    gives:
    ```
    30x18
    0:00:00.0010009
    98x59
    0:00:01.00892
    98x59
    ```
    If I disable the faces auto-showing at the beginning of the last script using:
    ```
    system/view/auto-sync?: off
    ```
    I get back similar timings for both ways:
    ```
    30x18
    0:00:00.0010014
    98x59
    0:00:00.0080067
    98x59
    ```
    
    I've also tried by disabling the reactivity [extra check](https://github.com/red/red/blob/master/modules/view/view.red#L370) in font updates, but without any impact on the timings.
    
    By default, `screen/font: big-font` triggers a `show` on the whole screen (so at least a WM_PAINT message sent to the whole desktop) which execution times depends entirely on your hardware performances (my desktop PC is a high-end machine) and the current load on your Windows desktop.

--------------------------------------------------------------------------------

On 2022-08-08T16:53:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/5162#issuecomment-1208368691>

    Interesting. I wonder how compiling helps here...

--------------------------------------------------------------------------------

On 2022-08-08T16:59:31Z, dockimbel, commented:
<https://github.com/red/red/issues/5162#issuecomment-1208375328>

    > Interesting. I wonder how compiling helps here...
    
    I use it to isolate the code to be benchmarked, as the GUI console can always interfere (negatively) in such benchmarks. Compilation itself should not have any impact on the tested code performance.

--------------------------------------------------------------------------------

On 2022-08-08T17:02:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/5162#issuecomment-1208378092>

    I get 160ms (CLI) and 400ms (GUI console) in max performance mode. It's an i7 laptop, but with intel iGPU (must be one of the sources of the slowdown).

--------------------------------------------------------------------------------

On 2022-08-08T17:05:00Z, dockimbel, commented:
<https://github.com/red/red/issues/5162#issuecomment-1208380575>

    Try updating your graphic drivers.
    
    > 400ms (GUI console) 
    
    That's expected, as your code will trigger a `screen` refresh and the GUI console window is its child, so will get entirely refreshed. Don't use the GUI console to benchmark, unless your code does not interact in any way with it (that means not even printing anything in the GUI console!).

--------------------------------------------------------------------------------

On 2022-08-08T17:05:19Z, greggirwin, commented:
<https://github.com/red/red/issues/5162#issuecomment-1208380874>

    Boris' original test on my system (run in GUI console):
    ```
    0:00:00.0594132
    0:00:00.373635
    0:00:00.348881
    0:00:00.364543
    0:00:00.354311
    0:00:00.381364
    0:00:00.356964
    0:00:00.374684
    ```
    Nenad's latest, also run in console:
    ```
    64x38
    0:00:00.0010119
    98x59
    0:00:00.0627057
    98x59
    
    98x59
    0:00:00
    98x59
    0:00:00.0629379
    98x59
    ```
    The 1'000 loop gives:
    ```
    98x59
    0:00:00
    98x59
    0:01:02.42245
    98x59
    ```
    And also locks my entire system, with other windows' menus disappearing and black redraw areas appearing. The non-loop versions cause a quick flicker, but the loop version brutalizes the entire system. All monitors affected.

--------------------------------------------------------------------------------

On 2022-08-08T17:07:44Z, greggirwin, commented:
<https://github.com/red/red/issues/5162#issuecomment-1208383393>

    > By default, screen/font: big-font triggers a show on the whole screen (so at least a WM_PAINT message sent to the whole desktop) 
    
    This is the true culprit then.

--------------------------------------------------------------------------------

On 2022-08-08T17:11:25Z, dockimbel, commented:
<https://github.com/red/red/issues/5162#issuecomment-1208387194>

    As it is established now that such timings depends on Windows + hardware tested on, as you force a full desktop refresh, there's no issue in Red to fix there, so I'll close this ticket. 

--------------------------------------------------------------------------------

On 2022-08-08T17:12:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/5162#issuecomment-1208387881>

    So it waits for *all* processes to finish processing WM_PAINT? Omg. I thought since WDM introduction in W8 it should be able to cache the other windows.

--------------------------------------------------------------------------------

On 2022-08-08T17:13:55Z, dockimbel, commented:
<https://github.com/red/red/issues/5162#issuecomment-1208389661>

    > So it waits for all processes to finish processing WM_PAINT? 
    
    IIRC, we do a synchronous call when sending WM_PAINT, so yes...
    
    > I thought since WDM introduction in W8 it should be able to cache the other windows.
    
    Might depend on the gfx card drivers too. On my GTX 1660 Super, 1000 full desktop refreshes take 1s and it does not even flicker, just a very short freeze.

--------------------------------------------------------------------------------

On 2022-08-08T17:19:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/5162#issuecomment-1208394926>

    OK thanks for investigating this deeper :+1:

--------------------------------------------------------------------------------

On 2022-08-08T20:31:55Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5162#issuecomment-1208581395>

    @hiiamboris   I have done some research. Similar problems affect both Windows an MacOs and they are related to GDI and font smoothing (antialiasing), true type, and high DPI system. Try disable font smoothing, and use smaller size fonts.
    
    Here is a [link](https://social.msdn.microsoft.com/Forums/SECURITY/en-US/e7e87d2d-1d2f-4757-953f-de991551e5d9/gdi-text-renders-slowly-in-large-point-sizes-under-the-win-10-creators-update?forum=vcgeneral) to a developer that has had a similar problem with his music notation software.
    
    
    

