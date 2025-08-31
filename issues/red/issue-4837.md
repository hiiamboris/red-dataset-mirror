
#4837: GC releases memory very slowly and does not return allocated memory.
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 56 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/4837>

**Describe the bug**

The garbage collector releases memory very slowly and does not return allocated memory.

**To reproduce**

Open the console, red interpreter starts using 8MB of system memory.

Run the following script:

```
recycle/off
loopnum: 0
loop 6 [
    loopnum: loopnum + 1
    prin ["generate array NO-COPY: cycle #" loopnum " Time: "] 
    probe dt [
      j: [] repeat i 2000000 [append j rejoin ["aoofhoahohd" i]]
    ]
]
j: copy []
```

Open the task manager and look at memory consumption:
  - Running this script the memory allocation goes up to 3.000MB

Then start `recycle` manually, keeping a look at Red task memory usage, you will see memory released at only 2MB per second

When the process will end, about 800MB of memory remains allocated

**Platform version**
Windows 10 64 Bit
```
Red 0.6.4 for Windows built 25-Feb-2021/1:27:54+01:00 commit #0645c80
```



Comments:
--------------------------------------------------------------------------------

On 2021-02-27T17:01:36Z, hiiamboris, commented:
<https://github.com/red/red/issues/4837#issuecomment-787102759>

    It moves at about 5MB per minute so I expect it will take another 7 hours minimum. That's way bigger than my patience.
    However I can confirm the same bug with recycle/on:
    ```
    generate array NO-COPY: cycle # 1  Time: 0:00:19.5768
    generate array NO-COPY: cycle # 2  Time: 0:00:39.8754
    generate array NO-COPY: cycle # 3  Time: 0:01:49.5257
    generate array NO-COPY: cycle # 4  Time: 0:02:30.0521
    generate array NO-COPY: cycle # 5  Time: 0:02:02.97724
    generate array NO-COPY: cycle # 6  Time: 0:02:33.261
    1164332864
    0:00:00.791279
    1163437848
    ```
    Using script:
    ```
    repeat k 6 [
      prin ["generate array NO-COPY: cycle #" k " Time: "] 
        probe dt [
          j: [] repeat i 2000000 [append j rejoin ["aoofhoahohd" i]]
        ]
    ]
    j: copy []
    probe stats
    probe dt [recycle]
    probe stats
    ```
    So even with GC on, there's 1.1GB left allocated after getting rid of `j`.
    
    We should probably hire a younger garbage collector or we risk the Great Garbage Avalanche much sooner than in 2505 at this rate ;)

--------------------------------------------------------------------------------

On 2021-02-28T09:20:16Z, qtxie, commented:
<https://github.com/red/red/issues/4837#issuecomment-787421840>

    I think that's expected. To collect a series-frame, the algorithm's run time is: 
    
    ~~O(MxN)~~
    ~~M: number of series-buffers in each series-frame~~
    ~~N: number of node-frames~~
    
    The node-frames will not be freed, that's why there are some memory remains allocated.
    

--------------------------------------------------------------------------------

On 2021-02-28T10:57:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/4837#issuecomment-787433433>

    800-1100 MB after recycle is no good. If node-frames cannot be freed within current preliminary GC design I suggest we mark this ticket as `deferred`, but sooner or later it must be fixed.

--------------------------------------------------------------------------------

On 2021-02-28T13:32:52Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/4837#issuecomment-787452841>

    I agree: it's not good to take 3GB and then releasing 5MB per second and keeping 1GB for itself. We advertise Red as a fast and resource savvy language, having a 1MB executable.
    
    
    
    
    
    
    

--------------------------------------------------------------------------------

On 2022-06-08T16:30:43Z, dockimbel, commented:
<https://github.com/red/red/issues/4837#issuecomment-1150138474>

    Can't reproduce the issue with latest Red:
    
    ```
    generate array NO-COPY: cycle # 1  Time: 0:00:06.43293
    generate array NO-COPY: cycle # 2  Time: 0:00:21.193
    generate array NO-COPY: cycle # 3  Time: 0:00:47.7786
    generate array NO-COPY: cycle # 4  Time: 0:00:57.3876
    generate array NO-COPY: cycle # 5  Time: 0:01:18.7713
    generate array NO-COPY: cycle # 6  Time: 0:01:29.794
    == 0:01:29.794
    >> j: copy []
    == []
    >> stats
    == 1165900592
    >> dt [recycle]
    == 0:01:31.084
    >> stats
    == 2744628
    ```

--------------------------------------------------------------------------------

On 2022-06-08T17:39:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/4837#issuecomment-1150206967>

    On `Red 0.6.4 for Windows built 1-Jun-2022/7:18:47+03:00  commit #c619918`, original snippet still eats 3GB then releases at 2MB/sec rate. My snippet with GC on so slowly creeps that I can't wait for it to finish anymore. Even first cycle didn't end in ~10 minutes or so.

--------------------------------------------------------------------------------

On 2022-08-04T07:55:14Z, dockimbel, commented:
<https://github.com/red/red/issues/4837#issuecomment-1204898861>

    @hiiamboris
    I suspect something is wrong with the implementation, it should only take a fraction of that time to free the memory. After doing some tests in debug mode (to see the GC debug log), the GC runs fast enough (~100ms for 1.5M small series occupying 150MB), the issue is that it triggers way too often in the kind of extreme pressure scenario used in the above code.
    
    @qtxie 
    > the algorithm's run time is: O(MxN)
    
    Which algorithm is that and where in the code? The compacting algorithm should not depend on the number of nodes.

--------------------------------------------------------------------------------

On 2022-08-04T09:33:51Z, qtxie, commented:
<https://github.com/red/red/issues/4837#issuecomment-1205006864>

    @dockimbel Sorry, `N` is number of `series-frame`. `O(MxN)` is not correct. It's linear to the number of series-buffers. So it should be `O(n)`, which `n` is the number of series-buffers. We need to `update-series` if we moved it, then it's `O(2n)`. 
    
    I tested it with different loop number `x`, the time is as follows.
    
    1. x = 1, mark: 3.0ms, sweep: 22652.0ms
    2. x = 2, mark: 3.0ms, sweep: 92928.9ms
    3. x = 3, mark: 5.0ms, sweep: 254130.5ms
    
    So it seems it's `O(n^2)`. Either something is wrong with the implementation or I missed something in the code.
    
    ```
    recycle/off
    loopnum: 0
    loop x [
        loopnum: loopnum + 1
        prin ["generate array NO-COPY: cycle #" loopnum " Time: "] 
        probe dt [
          j: [] repeat i 2000000 [append j rejoin ["aoofhoahohd" i]]
        ]
    ]
    j: copy []
    ```

--------------------------------------------------------------------------------

On 2022-08-04T12:30:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/4837#issuecomment-1205190975>

    Let me broaden the issue a bit. Not about fixing this GC, but about what we'll have in 1.0.
    
    GC sweep time is proportional to the amount of used RAM (more precisely, only blocks). This will be even more of a problem with time as we move towards 64 bits and RAM modules grow.
    
    Have you considered a copying GC? I suspect that `memcpy` is a highly optimized function, and will win by far over whatever R/S heap scanning code we can write. Copying GC is also as complex as the size of the *reachable* memory, not *total allocated*.
    
    An interesting alternative to mark&sweep called [mark&split](https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.605.7816&rep=rep1&type=pdf) which also claims to have reachable-memory complexity:
    > Instead of first marking live objects and then sweeping the heap to find free areas, we optimistically assume that the entire heap will be free after collection and we then let the mark phase repair the free list by rescuing the memory of live objects.
    
    What about generational GC designs? Found this [paper with benchmarks on JVM](https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.5.7042&rep=rep1&type=pdf).
    
    How is GC connected to ownership? It looks to me like ownership system (which we'll have to enhance to support reacitivity more reliably) does a similar thing to what GC is doing, and could be leveraged (depending on it's design).

--------------------------------------------------------------------------------

On 2022-08-04T23:00:18Z, qtxie, commented:
<https://github.com/red/red/issues/4837#issuecomment-1205853016>

    @hiiamboris We'll definitely need a better GC. This is a [Simple GC](https://www.red-lang.org/2018/12/064-simple-gc-and-pure-red-gui-console.html). It's even no mechanism to recycle external resources (image!, face!, port!, etc.)
    
    I think it fulfills its purpose as a simple gc. Regarding this extreme case, most probably there is a bug. 
    
    BTW, I ran this test in Rebol2, seems the `recycle` does nothing, no memory usage reduced.

--------------------------------------------------------------------------------

On 2022-08-05T04:05:19Z, qtxie, commented:
<https://github.com/red/red/issues/4837#issuecomment-1206018359>

    @dockimbel Ok. I did miss the `free-node` calling in `compact-series-frame` and `compact-series-frame`. It iterates over all the `node-frame` each time a node is freed. So the execution time of those `compact` functions is `O(MxN)`.
    
    I changed the `nodes-per-frame` to 1 million to reduce the number of `node-frame`s, the `sweep` time reduced greatly. 
    
    Running the same test in previous post, the time is as follows.
    
    1. x = 1, mark: 1.0ms, sweep: 262.0ms
    2. x = 2, mark: 1.7ms, sweep: 727.0ms
    3. x = 3, mark: 2.0ms, sweep: 1414.0ms

--------------------------------------------------------------------------------

On 2022-08-06T19:51:51Z, dockimbel, commented:
<https://github.com/red/red/issues/4837#issuecomment-1207273757>

    > BTW, I ran this test in Rebol2, seems the recycle does nothing, no memory usage reduced.
    
    Me too, same result, Rebol2 does not release the memory. R3 does a better job for the same case.
    
    > This is a [Simple GC](https://www.red-lang.org/2018/12/064-simple-gc-and-pure-red-gui-console.html). It's even no mechanism to recycle external resources (image!, face!, port!, etc.)
    
    The GC deals with internal memory that are allocated with the internal memory manager, it cannot deal with externally allocated resources. For that, we need to define a global model (and not an OS-specific, resource-specific solution like in this [PR](https://github.com/red/red/pull/4662)). The GC at best, can just signal to that external resources manager that a clean-up is needed. 
    
    @qtxie Thanks for the investigation and additional tests. That's good news, the running time is back to normal. Also, the planned changes for unifying the node frames will bring back the compaction to O(n). Moreover, the GC is still triggering way too often, so we'll need to add some checks to reduce such firing when the GC is invoked too often per second. That should make those above timing drop to unnoticeable durations.

--------------------------------------------------------------------------------

On 2022-08-06T20:31:00Z, dockimbel, commented:
<https://github.com/red/red/issues/4837#issuecomment-1207278603>

    > Let me broaden the issue a bit. Not about fixing this GC, but about what we'll have in 1.0.
    
    We'll have the current GC, with some extra fixes and added heuristics for dealing with edge cases. Its performances are satisfying so far and we managed to keep it simple enough.
    
    > GC sweep time is proportional to the amount of used RAM (more precisely, only blocks). This will be even more of a problem with time as we move towards 64 bits and RAM modules grow.
    
    It's proportional to the number of series allocated in the series frame only (not including big series frames, nor what is allocated using `allocate`). So it can be much less than the "used RAM". No, that won't be a problem for 64-bit and bigger datasets, because big allocation are managed using big series (with a constant-time freeing). If you are thinking about dealing with millions or billions of smaller series, then that would require an incremental approach and would be very time/memory-consuming anyway.
    
    > Have you considered a copying GC? I suspect that memcpy is a highly optimized function, and will win by far over whatever R/S heap scanning code we can write. Copying GC is also as complex as the size of the reachable memory, not total allocated.
    
    I've went through all the GC literature I could find online, so, yes I've considered all the options. A copying GC _doubles_ the amount of allocated memory... `memcpy()` cannot be "faster" than the heap scanning we do, as we jump from one series head to the next one, so on each loop we jump at least by 20+16 bytes (for an empty series with a default single cell allocation). Rather than a [basic copying GC](https://en.wikipedia.org/wiki/Cheney%27s_algorithm) , a generational approach would be wasting less space and allow for separating the GC passes into major/minor ones, depending on the allocating pressure and allocated chunk sizes.
    
    > An interesting alternative to mark&sweep called [mark&split](https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.605.7816&rep=rep1&type=pdf) which also claims to have reachable-memory complexity:
    
    Never heard about that one. Dynamic storage management is an active field of study in CS. It's a NP-hard problem. There's no optimal solution, only sets of trade-offs. Each programming language needs to define one suitable for its particular goals and use-cases.
    
    In our case, my goal is to have a flexible GC, which behavior can be dynamically changed depending on the application needs. Practically, that means a GC that can work incrementally for real-time apps (e.g. arcade gaming) or work in a stop-the-world way to ensure lowest memory usage at all time (at the cost of pauses, but that does not matter for e.g., server-side code). There is no single algorithm for that, so we'll probably end up having several GC and the Red runtime would be switching dynamically from one to another. Though that's the end goal and we won't get there in one step. Each GC model has drawbacks to deal with. First step is a simple GC, that covers basic needs and allow us to study the allocation models used by Red apps (v1.0). Then we'll be able to integrate incremental strategies (with probably some amount of generational segregation of memory frames) and see how efficient there are. Another aspect is also parallelization of GC using one or multiple threads (if our memory model supports it).
    
    > What about generational GC designs? Found this [paper with benchmarks on JVM](https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.5.7042&rep=rep1&type=pdf).
    
    IIRC, the JVM was the first mainstream language with a generational GC. In practice, the JVM is notoriously a memory hog, so its allocation and GC strategies are not particularily appealing to me.
    
    > How is GC connected to ownership? It looks to me like ownership system (which we'll have to enhance to support reacitivity more reliably) does a similar thing to what GC is doing, and could be leveraged (depending on it's design).
    
    They don't live in the same realms. The GC deals with memory frames, series buffers and series nodes. The ownership model is a Red datatype-level relationship, so far above low-level memory organization concerns. Reactivity is reliable AFAICT. What you mean I guess is extending its features, like allowing multiple observers, but that's not the ownership model anymore. Anyway, that's OT.

--------------------------------------------------------------------------------

On 2022-08-06T21:20:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/4837#issuecomment-1207284389>

    Thanks for the detailed comment @dockimbel :+1:
    
    > It's proportional to the number of series allocated in the series frame only (not including big series frames, nor what is allocated using allocate). So it can be much less than the "used RAM". No, that won't be a problem for 64-bit and bigger datasets, because big allocation are managed using big series (with a constant-time freeing).
    
    We'll still have to scan the whole "big series" to mark series that appear in it, no? It has to depend on the size of the series too, not just their number. What `mark-values` is currently doing IIUC.
    
    > What you mean I guess is extending its features, like allowing multiple observers, but that's not the ownership model anymore.
    
    Right, not "ownership". What I mean is (for context on design challenges of (deep) reactivity: https://github.com/red/red/issues/4524) if we manage to get that working, we'll know for each series what are it's parents. We could then repeat that and trace each series to the root block and tell if it's live or not. So heap scanning (marking) won't be needed at all.

--------------------------------------------------------------------------------

On 2022-08-07T09:02:35Z, dockimbel, commented:
<https://github.com/red/red/issues/4837#issuecomment-1207362465>

    > We'll still have to scan the whole "big series" to mark series that appear in it, no? It has to depend on the size of the series too, not just their number. What mark-values is currently doing IIUC.
    
    Correct, but that's unavoidable in any approach, you always have to mark somehow reachable objects.
    
    > We could then repeat that and trace each series to the root block and tell if it's live or not.
    
    So if they are not connected to the root block, you just wasted time...
    
    >  So heap scanning (marking) won't be needed at all.
    
    You seem to have a wrong picture there. All series are in the heap. Currently the GC starts from the root block and the Red stack to identify references to live series and then recurse into them to mark all the dependent series. There is no "heap scanning" as in scanning entirely memory frame buffers. Only live series are marked and no "dead" series is ever touched during marking phase, so it's much better than what you proposed just above.
    
    The full heap scanning (which is just hopping from one series to another linearly) is only used during sweep phase, for doing the compaction.
    
    We'll document the memory model and current GC in detail (both algorithm and implementation) once we start working on some improvements and optimizations.

--------------------------------------------------------------------------------

On 2022-08-07T11:12:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/4837#issuecomment-1207384156>

    I understand. In this proposal I'm making an assumption that the number of series is insignificant compared to their size. E.g. if I allocate a 1TB series, GC won't ever need to scan it. Maybe it's just integers anyway? In my opinion, while this approach may be slower on a small scale (like operating within 100MB of RAM), it is not likely to become pathological when working with big data. Scenario with billions of single-cell series linking to each other will be a hell for this idea. But I don't see where in practice it might occur. Anyway, just something to keep in mind while designing.

--------------------------------------------------------------------------------

On 2022-08-07T12:38:19Z, dockimbel, commented:
<https://github.com/red/red/issues/4837#issuecomment-1207399250>

    > E.g. if I allocate a 1TB series, GC won't ever need to scan it. Maybe it's just integers anyway? 
    
    Maybe I've missed something in your proposals, but how do you expect to find "live" series if you don't scan all existing value-holding series?

--------------------------------------------------------------------------------

On 2022-08-07T14:37:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/4837#issuecomment-1207422558>

    I was thinking something like maintaining a tight low-level map `node -> [hashed list of parent nodes...]` (or just per-series hashed list of parents - specific structure doesn't matter much). Updated on insertion/removal from any-list. At least I don't immediately see another way of deep tracking of series changes that would let one series to be tracked by multiple observers.

--------------------------------------------------------------------------------

On 2022-08-07T21:05:25Z, dockimbel, commented:
<https://github.com/red/red/issues/4837#issuecomment-1207485222>

    Seems too expensive and not scalable. A series can have an unlimited number of references. Having one hashtable for each node and tracking all the changes would have a significative performance overhead and an explosive memory usage. 
    
    Also "Updated on insertion/removal from any-list" that would not be enough, it would need to track all the slots changes in all contexts (they are dual series), so every direct or indirect word setting...
    
    And in the end, you would have a big graph that you would still have to visit node by node to mark every live series and have a way to collect the dead ones...

--------------------------------------------------------------------------------

On 2022-08-08T08:52:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/4837#issuecomment-1207847786>

    > Having one hashtable for each node and tracking all the changes would have a significative performance overhead and an explosive memory usage.
    
    I doubt this (R/S) overhead really be noticeable above the interpreter's baseline speed for normal code.
    Memory usage:
    - it could be simple array of parents for all series that have, let's say, up to 10 immediate parents - that's 2 CPU words per link (parent node + index)
    - then after 10 parents (rare case already), it could promote itself into a hash of let's say 3 buckets per slot - that's 6 CPU words per link
    - for a pathological case of N series each containing links to the same N series this would incur +150% RAM penalty indeed, maybe even more (need to think then: is this case realistic? how can we work around it?)
    - for the same pathological case, insertion/removal at the head of one of these series will require updates to all subsequent indexes of child series in their tables, that will slow down this (already inefficient) operation at least a few times more
    
    > And in the end, you would have a big graph that you would still have to visit node by node to mark every live series and have a way to collect the dead ones...
    
    Yes, with asymptotic complexity O(number of series) vs O(amount of live RAM). But again, this is *also* about improving reactive changes tracking model.
    
    If we only cared about GC, not reactivity, then a better model would be to just add a hashed list of `series!` children to every big enough series (let's say over 1000 items and up to 10% of it's items are `series!`), then mark this children list instead of the whole series.

--------------------------------------------------------------------------------

On 2022-08-08T12:38:30Z, dockimbel, commented:
<https://github.com/red/red/issues/4837#issuecomment-1208074241>

    Seems over-complicated...
    
    "O(number of series) vs O(amount of live RAM)." I don't understand how you differentiate those two?

--------------------------------------------------------------------------------

On 2022-08-08T15:56:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/4837#issuecomment-1208308437>

    Not sure I understand the question.
    
    On a graph of `N` nodes (1 node = 1 series) with a branching factor `F` (F parents per series on average) I estimate we'll have `~aNF` node visits, where `a` is some constant (e.g. to account for cycle resolution). That's O(N=number of series). Most of the complexity shifted to the reactivity system.
    
    With scanning we have `N` nodes (series) by average length `M`, resulting in O(MN=amount of live RAM) scanning coverage.

--------------------------------------------------------------------------------

On 2022-08-08T16:24:58Z, dockimbel, commented:
<https://github.com/red/red/issues/4837#issuecomment-1208339396>

    > With scanning we have N nodes (series) by average length M, resulting in O(MN=amount of live RAM) scanning coverage.
    
    We don't scan every byte in a series, so it's never O(amount of live RAM), we scan only the headers.

--------------------------------------------------------------------------------

On 2022-09-21T09:40:40Z, hiiamboris, commented:
<https://github.com/red/red/issues/4837#issuecomment-1253458688>

    > We don't scan every byte in a series, so it's never O(amount of live RAM), we scan only the headers.
    
    @dockimbel found an interesting article (1st example is related): http://igoro.com/archive/gallery-of-processor-cache-effects/

--------------------------------------------------------------------------------

On 2022-10-13T17:31:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/4837#issuecomment-1277950822>

    In my current Spaces tree initialization benchmark GC is responsible for +60% slowdown. I get 66 GC runs over 10 seconds, where 4 seconds are eaten by GC alone. And it's not really doing anything valuable as most of that memory is still in use (it should be). Example output:
    ```
    root: 5036/7727, runs: 64, mem: 141674652 => 140960852, mark: 54.0ms, sweep: 28.0ms
    root: 5036/7727, runs: 65, mem: 143828044 => 143119364, mark: 55.0ms, sweep: 30.0ms
    root: 5036/7727, runs: 66, mem: 145983376 => 145272880, mark: 52.0ms, sweep: 29.0ms
    ```
    (I'm not wasteful and only allocate when necessary - mostly to make unique Draw blocks for 11111 spaces and their child panes)

--------------------------------------------------------------------------------

On 2024-03-14T12:27:36Z, dockimbel, commented:
<https://github.com/red/red/issues/4837#issuecomment-1997337806>

    Just a possible workaround (until we get a smarter GC that triggers less often): disable the automatic GC calls and call the GC manually from an `on-time` handler with a wait time of 1s (or less) depending on your needs.

--------------------------------------------------------------------------------

On 2024-05-16T23:08:45Z, dockimbel, commented:
<https://github.com/red/red/issues/4837#issuecomment-2116341721>

    From the `nodes` branch:
    
    ```
    --== Red 0.6.5 ==-- 
    Type HELP for starting information. 
    
    >> recycle/off
    >> loopnum: 0
    == 0
    >> loop 6 [
    [        loopnum: loopnum + 1
    [        prin ["generate array NO-COPY: cycle #" loopnum " Time: "] 
    [        probe dt [
    [          j: [] repeat i 2000000 [append j rejoin ["aoofhoahohd" i]]
    [        ]
    [    ]
    generate array NO-COPY: cycle # 1  Time: 0:00:02.0724
    generate array NO-COPY: cycle # 2  Time: 0:00:02.08295
    generate array NO-COPY: cycle # 3  Time: 0:00:02.11378
    generate array NO-COPY: cycle # 4  Time: 0:00:02.10908
    generate array NO-COPY: cycle # 5  Time: 0:00:02.17755
    generate array NO-COPY: cycle # 6  Time: 0:00:02.24068
    == 0:00:02.24068
    >> j: copy []
    == []
    >> stats
    == 3136752940.0
    >> recycle
    == 2995184
    >> stats
    == 3007364
    ```
    
    I will mark that ticket as fixed, but leave it open until that branch gets merged into master.

--------------------------------------------------------------------------------

On 2024-05-17T14:32:37Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/4837#issuecomment-2117743541>

    Great!!!
    

