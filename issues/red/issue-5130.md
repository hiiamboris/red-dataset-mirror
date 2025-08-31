
#5130: Ownership slows down Draw as it leaks memory
================================================================================
Issue is closed, was reported by hiiamboris and has 32 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/5130>

**Describe the bug**

The following test (ripped from Spaces' `grid-test6`) shows that:
- Draw leaks memory that is not recycled (recycle/on or /off doesn't seem to affect it)
- It slows down ~10 times as it approaches the size of the currently allocated memory segment
- It then resets back to it's original drawing speed
- Reset often (not always) coincides with the moment of memory segment expansion
<img width=200 src=https://i.gyazo.com/069d43cfc341779dc59f8c41bd3f524b.gif></img>
[draw-stress-test.red.7z.zip](https://github.com/red/red/files/8566608/draw-stress-test.red.7z.zip)

**To reproduce**

Download & extract & run the linked file.
Output looks like this (don't mind the error, it's because 1st Draw call is delayed):
```
0:00:00.246354 82810960
*** Script Error: scale is unset in path scale/3:
*** Where: set-path
*** Near : r
*** Stack: view do-events do-actor do-safe 
0:00:00.204678 82814232
0:00:00.371997 82814392
0:00:00.433118 82814552
0:00:00.503133 115582736    <- expansion, no speedup
0:00:00.478226 115582896
0:00:00.479816 115583056
0:00:00.570561 115583216
0:00:00.679417 115583376
0:00:00.824752 115583536
0:00:00.93454 115583696
0:00:00.977556 115583856
0:00:01.14586 115584016
0:00:01.27284 115584176
0:00:01.39978 115584336
0:00:01.74311 115584496
0:00:01.623 115715756     <- critical slowdown
0:00:00.210024 115715916    <- 8x speedup, expansion
0:00:00.416783 181252100
0:00:00.419102 181252260
0:00:00.488242 181252420
0:00:00.533482 181252580
0:00:00.532643 181252740
0:00:00.653493 181252900
0:00:00.724567 181253060
0:00:00.835315 181253220
0:00:00.962908 181253380
0:00:01.06382 181253540
0:00:01.21955 181253700
0:00:01.19262 181253860
0:00:01.4192 181254020
0:00:01.71895 181254180
0:00:01.68473 181385440    <- critical slowdown
0:00:00.193709 181385600     <- 8x speedup, no expansion
0:00:00.375816 181385760
0:00:00.416964 181385920
0:00:00.466732 181386080
0:00:00.765007 181386240
```

**Expected behavior**

1. No leaks, especially those that can't be recycled
2. No slowdown
3. Faster `clip` command if possible. It takes 30% of time in the presented block, ~50us per single `clip`, while other commands take ~1us.

**Platform version**
```
Red 0.6.4 for Windows built 15-Apr-2022/11:42:52+03:00  commit #502097e
```

tags: view draw GUI


Comments:
--------------------------------------------------------------------------------

On 2022-04-28T09:56:35Z, qtxie, commented:
<https://github.com/red/red/issues/5130#issuecomment-1111996958>

    Looks like even a simple `on-time` event keeps using memory.
    ```
    view [
    	base 500x300 rate 99 on-time [
    		probe stats
    	]
    ]
    ```

--------------------------------------------------------------------------------

On 2022-04-28T16:00:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/5130#issuecomment-1112383841>

    Yes but just a bit, and if you add `recycle`, it's stable.

--------------------------------------------------------------------------------

On 2022-04-28T18:13:44Z, greggirwin, commented:
<https://github.com/red/red/issues/5130#issuecomment-1112516677>

    Thanks for the deep research on this @hiiamboris. :+1:

--------------------------------------------------------------------------------

On 2022-04-30T09:33:15Z, qtxie, commented:
<https://github.com/red/red/issues/5130#issuecomment-1113957621>

    > Yes but just a bit, and if you add `recycle`, it's stable.
    
    Yes. But you have to do `recycle` manually, it should be triggered automatically.

--------------------------------------------------------------------------------

On 2022-04-30T09:40:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/5130#issuecomment-1113958479>

    I think it doesn't get triggered because the memory footprint is small.

--------------------------------------------------------------------------------

On 2022-04-30T09:43:55Z, qtxie, commented:
<https://github.com/red/red/issues/5130#issuecomment-1113958908>

    It doesn't get triggered even waiting a few hours. But it's another small issue. I fixed the big memory jump issue. Pushing it now.

--------------------------------------------------------------------------------

On 2022-04-30T09:49:54Z, qtxie, commented:
<https://github.com/red/red/issues/5130#issuecomment-1113959656>

    It still has an issue which the execution time keep increasing until the GC get triggered. It because the algorithm used in the hashtable does not suit well with the ownership system. We need to write a dedicated hashtable for it.

--------------------------------------------------------------------------------

On 2022-04-30T09:53:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/5130#issuecomment-1113960184>

    Oh. So it's not draw, but change of ownership in the `draw:` assignment that's slowing it down?

--------------------------------------------------------------------------------

On 2022-04-30T09:53:44Z, qtxie, commented:
<https://github.com/red/red/issues/5130#issuecomment-1113960190>

    The drawing is slow because the ownership system takes too much time. When doing `face/draw: drawn`, all the values in the `face/draw` block will be deleted from the ownership system, then all the values in the `drawn` block will be added into it. So if `drawn` block is very big, it will take lots of time.

--------------------------------------------------------------------------------

On 2022-04-30T09:58:45Z, qtxie, commented:
<https://github.com/red/red/issues/5130#issuecomment-1113960803>

    @hiiamboris Yes. I commented the draw code in the backend. It still takes almost the same amount of time to execute.

--------------------------------------------------------------------------------

On 2022-04-30T10:00:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/5130#issuecomment-1113961057>

    What in the hashtable implementation makes it suboptimal in this use case?

--------------------------------------------------------------------------------

On 2022-05-07T16:35:18Z, hiiamboris, commented:
<https://github.com/red/red/issues/5130#issuecomment-1120237835>

    I also found out that my [spiral-test demo](https://codeberg.org/hiiamboris/red-spaces/src/branch/master/tests/spiral-test.red) takes ~100ms to create the draw block, but 400-600ms(!) to perform `face/draw: block` operation. Veeery laggy :)

--------------------------------------------------------------------------------

On 2022-05-10T11:44:18Z, hiiamboris, commented:
<https://github.com/red/red/issues/5130#issuecomment-1122281519>

    If the actual code of `draw-stress-test.red` is modified like this (to exclude ownership):
    ```
    recycle/off
    t0: now/utc/precise
    view [
    	image 500x300 rate 99 on-time [
    		print [dt [draw face/image drawn] stats]
    		elapsed: to float! difference now/utc/precise t0
    		scale/2: scale/3: exp (1 * elapsed) // 1.6713133161521878
    	]
    ]
    ```
    Then memory creep constitutes only 100 bytes per draw, and drawing speed is constant. So this is indeed ownership problem.

--------------------------------------------------------------------------------

On 2022-05-11T07:58:34Z, qtxie, commented:
<https://github.com/red/red/issues/5130#issuecomment-1123315131>

    Improve it by commit https://github.com/red/red/commit/788634d1542e9fccbe95fa2e705d21657496cb4c.

--------------------------------------------------------------------------------

On 2022-05-11T10:04:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/5130#issuecomment-1123493976>

    If I make a `change/only` inside the owned block, swapping one inner block to another, will it still be able to both "own" the new block and "forget" the old one? Even then, how can it know if blocks *inside* the old one must all be forgotten? Maybe they appear in other blocks within the same Draw block?
    
    I mean, it's a good temporary measure, but whole ownership system needs deeper design thought IMO.

--------------------------------------------------------------------------------

On 2022-09-03T17:41:40Z, dockimbel, commented:
<https://github.com/red/red/issues/5130#issuecomment-1236170385>

    The test script ouputs now constant times, so I'll close this ticket.
    ```
    0:00:00.446835 160589176
    *** Script Error: scale is unset in path scale/3:
    *** Where: set-path
    *** Near : r
    *** Stack: do-file view do-events do-actor do-safe 
    0:00:00 160593576
    0:00:00.0009993 160594428
    0:00:00 160595464
    0:00:00 160595840
    0:00:00 160596996
    0:00:00.0009703 160597372
    0:00:00 160598648
    0:00:00 160599024
    0:00:00 160600420
    0:00:00 160600796
    0:00:00 160602312
    0:00:00 160602688
    0:00:00 160604324
    0:00:00 160604700
    0:00:00 160606456
    0:00:00 160606832
    0:00:00 160608708
    0:00:00 160609084
    0:00:00 160611080
    0:00:00 160611456
    0:00:00 160613572
    0:00:00 160613948
    0:00:00 160616184
    0:00:00 160616560
    0:00:00 160618916
    0:00:00 160619292
    0:00:00 160621768
    ```

