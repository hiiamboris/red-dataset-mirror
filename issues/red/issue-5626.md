
#5626: Out of memory when making images
================================================================================
Issue is open, was reported by hiiamboris and has 14 comment(s).
[type.review]
<https://github.com/red/red/issues/5626>

**Describe the bug**

When running this script, Red doesn't try to run the GC and runs out of memory in 20 secs:
```
Red [needs: view]
forever [
	print stats
	make image! 1920x1080
]
```
Result:
```
2734156
2734260
2734364
2734468
*** Internal Error: not enough memory
*** Where: make
*** Near : make image! 1920x1080
*** Stack:
```

**Expected behavior**

1. Ideally `stats` should report full RAM consumption
2. OS allocations should also serve as triggers for GC

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.6 ahead: 73 date: 18-Jun-2025/9:52:24 commit: #3d9dd1fe542723763562536199caf4f25cad6488 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2025-06-29T19:42:22Z, dockimbel, commented:
<https://github.com/red/red/issues/5626#issuecomment-3017028495>

    > Ideally stats should report full RAM consumption
    
    You have it using `stats/info` (raw data) and in a pretty-printed form using `stats/show`. I think it's more useful to have the Red values allocations returned by default using `stats`, as it makes it easier to track code behavior (isolated from other kind of allocations).
    
    Also, "full RAM" is quite vague, there are many different kind of OS-dependent "memories" in a process.

--------------------------------------------------------------------------------

On 2025-06-29T19:50:04Z, dockimbel, commented:
<https://github.com/red/red/issues/5626#issuecomment-3017032321>

    Red cannot track external allocations as they are, by definition, not under Red's control. So, total OS allocation cannot include such info:
    ```
    >> stats/show
    
    [ Nodes  ] -- Free ----- Used ----- Total --
       1:            0      10000       10000
       2:            0      10000       10000
       3:         1588       8412       10000
       4:         9900        100       10000
       5:         9798        202       10000
       6:         9998          2       10000
      --
      Used     :  28716 nodes
      Allocated:  60000 nodes
    
    [ Series ] -- Free ----- Used ----- Total --
       1:           24    2097128     2097152
       2:      1199496     897656     2097152
      --
      Used     :  2994784 bytes
      Allocated:  4194304 bytes
    
    [ Big    ]
      --
      Allocated:  0 bytes
    --
    Total allocated from OS:   5531384 
    Total allocated on heap:   1096784 
    
    >> make image! 1920x1080
    == make image! [1920x1080 #{
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF...
    >> stats/show
    
    [ Nodes  ] -- Free ----- Used ----- Total --
       1:            0      10000       10000
       2:            0      10000       10000
       3:          502       9498       10000
       4:         9900        100       10000
       5:         9798        202       10000
       6:         9998          2       10000
      --
      Used     :  29802 nodes
      Allocated:  60000 nodes
    
    [ Series ] -- Free ----- Used ----- Total --
       1:           24    2097128     2097152
       2:      1104688     992464     2097152
      --
      Used     :  3089592 bytes
      Allocated:  4194304 bytes
    
    [ Big    ]
      --
      Allocated:  0 bytes
    --
    Total allocated from OS:   5531384      ; <== unchanged
    Total allocated on heap:   1096784      ; <== unchanged 
    ```
    
    So, at first glance, I don't see if/how we could improve that.

--------------------------------------------------------------------------------

On 2025-06-30T05:20:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/5626#issuecomment-3017839314>

    How does task manager show RAM usage of each process?

--------------------------------------------------------------------------------

On 2025-06-30T07:38:56Z, dockimbel, commented:
<https://github.com/red/red/issues/5626#issuecomment-3018119236>

    I don't know, it's closed-source and Windows-only. Even if we could get relevant process memory usage info on all our supported platforms, I don't see how we could define a useful and efficient heuristic for triggering a GC on external references.

--------------------------------------------------------------------------------

On 2025-06-30T08:42:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/5626#issuecomment-3018301964>

    I'll quote one of my old TG posts: 
    
    > I see two optimization vectors here: 
    > - reduce drastic peak allocations (which may lead to app crashes or even bsod, since capitalists have completely forgotten how to write drivers)
    > - reduce long-term consumption so we don't annoy the users
    
    > Obviously there's no limit to how complex we can make our collection strategies, but with diminishing returns. The simplest first approximation for short-term strategy I think is when used memory (including OS resources) grows by a predefined factor over established mean over some past period. For long-term something like once a minute recycling seems simplest.
    
    I'm sure every OS must have a way to query own RAM consumption of a process.

--------------------------------------------------------------------------------

On 2025-06-30T11:12:20Z, dockimbel, commented:
<https://github.com/red/red/issues/5626#issuecomment-3018750500>

    > reduce drastic peak allocations
    
    Allocations are the result of user code evaluation, how could the memory manager reduce user-created peaks?
    
    > reduce long-term consumption so we don't annoy the users
    
    ??
    
    > The simplest first approximation...
    
    That's already significantly more complex than what we already do...
    
    > by a predefined factor over established mean over some past period
    
    That's vague. The relevant "past period" duration varies with apps use-cases. If it's the same for all apps, it will render the heuristic ineffective. How to determine a proper "factor" that would work for different types of memory allocation pressures without making it much more complex? 
    
    I can imagine simple allocation scenarios that would defeat such "growth over mean" approach, like creating thousands of various sized images over a longer period of time (slow but continuous growth), storing them in a preallocated list, then suddenly clearing that list, will result in no GC triggering.
    
    > For long-term something like once a minute recycling seems simplest.
    
    If the GC hasn't triggered itself during a minute, then there's most probably no need to trigger it. It's like shooting at a target with closed eyes, hoping bullets will hit it from time to time. Also, those 60 seconds are arbitrary, they could help or not at all depending on the app (even cause problematic uncontrolled pauses in some use-cases, like fast animations).
    
    > I'm sure every OS must have a way to query own RAM consumption of a process.
    
    Sure, they do. Though, it's not as straightforward as you imply. Take the Windows case, using [GetProcessMemoryInfo()](https://learn.microsoft.com/en-us/windows/win32/api/psapi/nf-psapi-getprocessmemoryinfo), look at the returned values [in the struct](https://learn.microsoft.com/en-us/windows/win32/api/psapi/ns-psapi-process_memory_counters). Which one do you think represent a value we can work with? `WorkingSetSize`? What about the virtualized memory? Shouldn't we take that one rather or is it too far away? Have a look at the "Working Set" value in TaskManager, for a freshly started Red GUI console: ~40MB, that's nothing close to the total amount allocated by Red. That could contain some OS caches or GPU-related allocations, we just don't know and can't control those values, so we cannot infer from that a reliable mean.
    
    
    Another aspect to also consider, such API could be inefficient to call at high rate. 

--------------------------------------------------------------------------------

On 2025-06-30T14:08:11Z, hiiamboris, commented:
<https://github.com/red/red/issues/5626#issuecomment-3019310873>

    > Which one do you think represent a value we can work with? `WorkingSetSize`? 
    
    I think `PrivateWorkingSetSize` from [this structure](https://learn.microsoft.com/en-us/windows/win32/api/psapi/ns-psapi-process_memory_counters_ex2) should be a preferred metric, then `WorkingSetSize` after it (it includes loaded shared DLLs), then `CommitSize` (but it is more like theoretically used memory, e.g. `malloc` until it is filled with data will be there). Ideally we should care about VRAM as well, but not at this stage.
    
    > we just don't know and can't control those values, so we cannot infer from that a reliable mean.
    
    I think we do control the `WorkingSet` size. I guess not the `CommitSize`, as I suppose it may be affected by the OS swapping and allocation strategies. 
    
    > > reduce drastic peak allocations
    > 
    > Allocations are the result of user code evaluation, how could the memory manager reduce user-created peaks?
    
    Yes, but we should assume the user to be lazy (and allow that). Think of series of allocations, e.g. during data loading and processing or image processing. We could allocate: 1GB + 1GB + 1GB + 1GB then later free them all. Or we could allocate 1GB then free it, then repeat that 3 more times. Peak usage of 4GB can well trip the OS into oblivion, while peak 1GB is much less likely to. Clever enough garbage collection triggering logic can make a difference here.
    
    > > reduce long-term consumption so we don't annoy the users
    > 
    > ??
    
    Well, if a long running Red app allocates 2GB which then almost immediately becomes unused, but there's no trigger for the GC so it stays at 2GB for days, that's annoying and even quite dumb, don't you think? With just a tiny bit of allocator's awareness about its RAM usage profile we could solve cases like this.
    
    > > The simplest first approximation...
    > 
    > That's already significantly more complex than what we already do...
    > 
    > > by a predefined factor over established mean over some past period
    > 
    > That's vague. The relevant "past period" duration varies with apps use-cases. If it's the same for all apps, it will render the heuristic ineffective. How to determine a proper "factor" that would work for different types of memory allocation pressures without making it much more complex?
    
    Let's see. Say my app uses 1GB of RAM, and allocates another 10MB, that's 1% more. Is 1% significant in terms of peak usage reduction? Clearly not. But if it allocates another 1GB, is that significant? Clearly yes. Now let my app use only 100MB. Is another 100MB still significant? I would say it is. So we know the meaningful ratio lies within the 1-100% range. 
    
    The obvious cost of having a smaller value is having extra GC runs that may not free anything. The obvious downside of having a larger value is we may allow a big allocation slip through unnoticed. I'd say 10-30% threshold ratio is a good starting point.
    
    What about time period for mean estimation? Does 1-second mean RAM usage make sense? Not likely, as resource usage bursts can often be longer than that. Does 1-hour mean make sense? Also seems far-fetched. 
    
    The main cost of having a smaller mean period I think is the impact on performance. E.g. for 1-second mean let's say we need 10 points - a reading every 100ms, which (if the API call is slow) will noticeably affect us. Another downside is allocation bursts will offset the mean too easily. A downside of too slow mean is we will be unable to adjust to changes in the program's behavior. Where I would start is 10-60 second interval.
    
    > I can imagine simple allocation scenarios that would defeat such "growth over mean" approach, like creating thousands of various sized images over a longer period of time (slow but continuous growth), storing them in a preallocated list, then suddenly clearing that list, will result in no GC triggering.
    
    That's where the long-term strategy should help :)
    You grow your list over a long period of time (let's say an hour), and for an extra period (let's say a minute) this goes undetected. Not too much difference for the user then if it was for 60 or 61 minutes the RAM was allocated.
    
    > > For long-term something like once a minute recycling seems simplest.
    > 
    > If the GC hasn't triggered itself during a minute, then there's most probably no need to trigger it. It's like shooting at a target with closed eyes, hoping bullets will hit it from time to time. Also, those 60 seconds are arbitrary, they could help or not at all depending on the app (even cause problematic uncontrolled pauses in some use-cases, like fast animations).
    
    As my image allocation demo above shows, there is a need. We can't put a GC trigger on data becoming inaccessible, and we shouldn't put such a trigger on micro-allocations which happen all the time because of the performance impact. Besides, the whole logic even seems backwards to me: why are we trying to free something when we were commanded to allocate something? Oh, we're hoping that something has been freed since the last big allocation! Which has happened when? Minutes? Hours ago? We don't even know... If anything, periodic check logic seems less blind to me than the currently used one, as it puts the moment of GC check more likely after the tasks for which we allocated the memory are complete.
    
    Is 60 seconds arbitrary? Indeed. Let's find the interval then. Does every second collection make sense? No, because collection itself may be slower than that. Does every hour collection make sense? No, because the user may rage-kill an app that takes a few gigabytes for an hour. So we have the interval of 1-3600 seconds, with 60 seconds being a reasonable best guess.
    
    Can we make a better guess? Maybe. It will depend on GC time. We can set a performance impact limit of e.g. 1% and keep track of how long last GC runs were. If they took 5 seconds each, we'll have to abstain from GCing for the next 500 seconds.
    
    Can we randomize intervals around the 60 seconds value (e.g. in 30-90 seconds range), to eliminate any kind of interplay with the periodic logic of the program? Sure we can.
    
    Can we track the efficiency of our GC measures and adjust the optimum values on the fly? No one can stop us :)
    
    I'm sure we can have a lot of improvements over the basic logic. But anything we do will be just arbitrary guesses in an attempt to find an optimum that covers more and more use cases.
    
    If the basic logic covers it for 99% of real world programs, is it good enough to implement it?
    
    > even cause problematic uncontrolled pauses in some use-cases, like fast animations
    
    Those use cases should disable GC completely or restrain their memory consumption to a value where GC impact is acceptable. Let's face it: GC triggers are already unpredictable. So it's a weak argument IMO.
    
    > Another aspect to also consider, such API could be inefficient to call at high rate.
    
    Indeed. Implementation of the above proposal would require measuring these API calls time before optimum threshold and period values can be found. Also the optimum values for fast and slow strategies are tied together, as you rightfully point with your example of slowly allocating images over a long time period. And the biggest implementation issue right now is the lack of timers in the runtime, which would be separate from the View module. The basic logic propose is itself very simple, it's the scaffolding that we lack at the moment.

