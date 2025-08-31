
#4840: Parse rule execution time is exponential and not proportional as expected
================================================================================
Issue is open, was reported by GiuseppeChillemi and has 20 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/4840>

**Describe the bug**
As string size increase, parse increases its rule execution time exponentially:

**To reproduce**
Download [this dataset:](https://drive.google.com/file/d/11eqFwcWZE_iQxE4WtGmLSZjIbw0s1P65/view?usp=sharing)

Unpack it and run this script:

```
source-file: %bookmars-giuseppe-randomized-utf-ok.txt
s: read source-file
recycle/off

anon: func [val][
    	xx: random val
    	change/part st xx en
]

rule3: [
	some 
     [
       {"} [{guid} | {name} | {url}] {": "}
        st: copy tmp to {"} en: (
        
        ;--- Printout the match near content
        ;probe copy/part skip st -20 skip st 20 
        
        ;Does not anonymize empty strings
        if (index? st) < (index? en) [anon tmp]
        
        ) skip
        | skip
    ]
]

lengths-to-scan: [1000 10000 100000 500000 1000000 2000000 3000000 4000000 5000000]
length-source: length? s

foreach to-scan lengths-to-scan [
	ss: copy/part s to-scan
	prin ["Source-size: " length-source "Characters to-scan: " to-scan "time: "] 
	probe dt [parse ss rule3]
]
```

**Expected behavior**

Here is the result on Red:

```
Source-size:  91286172 Characters to-scan:  1000 time: 0:00:00.0009994
Source-size:  91286172 Characters to-scan:  10000 time: 0:00:00.0069983
Source-size:  91286172 Characters to-scan:  100000 time: 0:00:00.0899521
Source-size:  91286172 Characters to-scan:  500000 time: 0:00:00.801539
Source-size:  91286172 Characters to-scan:  1000000 time: 0:00:03.52299
Source-size:  91286172 Characters to-scan:  2000000 time: 0:00:15.9169
Source-size:  91286172 Characters to-scan:  3000000 time: 0:00:38.9338
Source-size:  91286172 Characters to-scan:  4000000 time: 0:00:57.1153
Source-size:  91286172 Characters to-scan:  5000000 time: 0:01:39.7059
```

I have tested the script also on Rebol (change `parse` to `parse/all`), the time increases proportionally with the processed parsed block size

```
Source-size:  91331302 Characters to-scan:  1000 time: 0:00
Source-size:  91331302 Characters to-scan:  10000 time: 0:00:00.003
Source-size:  91331302 Characters to-scan:  100000 time: 0:00:00.013
Source-size:  91331302 Characters to-scan:  500000 time: 0:00:00.079
Source-size:  91331302 Characters to-scan:  1000000 time: 0:00:00.154
Source-size:  91331302 Characters to-scan:  2000000 time: 0:00:00.292
Source-size:  91331302 Characters to-scan:  3000000 time: 0:00:00.432
Source-size:  91331302 Characters to-scan:  4000000 time: 0:00:00.56
Source-size:  91331302 Characters to-scan:  5000000 time: 0:00:00.579
``` 


**Platform version**

```
Red 0.6.4 for Windows built 25-Feb-2021/1:27:54+01:00 commit #0645c80
```



Comments:
--------------------------------------------------------------------------------

On 2021-02-27T20:08:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/4840#issuecomment-787128288>

    What a mess. I feel like this has nothing to do with Parse.
    ```
    Red []
    
    do https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/clock.red
    
    s1: append/dup "" "x" 10000
    s2: append/dup "" "x" 100000
    s3: append/dup "" "x" 1000000
    
    clock/times [change s1 "abc"] 1000000
    clock/times [change s2 "abc"] 1000000
    clock/times [change s3 "abc"] 1000000
    
    clock/times [change/part s1 "abc" 3] 1000000
    clock/times [change/part s2 "abc" 3] 300000
    clock/times [change/part s3 "abc" 3] 50000
    ```
    Output:
    ```
    0.25 μs [change s1 "abc"]
    0.25 μs [change s2 "abc"]
    0.33 μs [change s3 "abc"]
    1.14 μs [change/part s1 "abc" 3]
    8.15 μs [change/part s2 "abc" 3]
    96.5 μs [change/part s3 "abc" 3]
    ```
    
    What's funny is that on #4097 build the time is also exponential. Though I clearly recall making a special case for `change` when length does not change. So the issue may not be in `change` itself but in some other function involved.

--------------------------------------------------------------------------------

On 2021-02-27T20:21:28Z, greggirwin, commented:
<https://github.com/red/red/issues/4840#issuecomment-787129819>

    Timing results are the same for `binary!` vs `string!`, so doesn't seem to be encoding related either.

--------------------------------------------------------------------------------

On 2021-02-27T21:28:34Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/4840#issuecomment-787150402>

    I have tested on Red 0.6.3, I have done the calculations by hand as there is no `DT`
    
    Source-size:  91286172 Characters to-scan:  1000 time: 22:02:34-22:02:34 - <1s
    Source-size:  91286172 Characters to-scan:  10000 time: 22:02:34-22:02:34 - <1s
    Source-size:  91286172 Characters to-scan:  100000 time: 22:02:34-22:02:34 - <1s
    Source-size:  91286172 Characters to-scan:  500000 time: 22:02:34-22:02:35 - 1s
    Source-size:  91286172 Characters to-scan:  1000000 time: 22:02:35-22:02:38 - 3s
    Source-size:  91286172 Characters to-scan:  2000000 time: 22:02:38-22:02:50 - 12s
    Source-size:  91286172 Characters to-scan:  3000000 time: 22:02:50-22:03:25 - 35s
    Source-size:  91286172 Characters to-scan:  4000000 time: 22:03:25-22:04:20 - 55s
    Source-size:  91286172 Characters to-scan:  5000000 time: 22:04:20-22:05:41 - 81s
    
    So, it is something which has been always here.
    
    

--------------------------------------------------------------------------------

On 2021-02-28T00:04:49Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/4840#issuecomment-787207191>

    I have created [this GIST](https://gist.github.com/GiuseppeChillemi/0f67922e5b5c76cff445c3c38b103987) to test `parse` replaced by `find` and with or without `change`:
    
    ```
    Start Time: 28-Feb-2021/0:53:17+01:00
    "-- start read file--"
    Source-size:  91286172 Characters to-scan:  1000 time: 0:00:00
    "-- start read file--"
    Source-size:  91286172 Characters to-scan:  10000 time: 0:00:00.0040002
    "-- start read file--"
    Source-size:  91286172 Characters to-scan:  100000 time: 0:00:00.0569658
    "-- start read file--"
    Source-size:  91286172 Characters to-scan:  500000 time: 0:00:00.652625
    "-- start read file--"
    Source-size:  91286172 Characters to-scan:  1000000 time: 0:00:02.78241
    "-- start read file--"
    Source-size:  91286172 Characters to-scan:  2000000 time: 0:00:12.8716
    "-- start read file--"
    Source-size:  91286172 Characters to-scan:  3000000 time: 0:00:26.5528
    "-- start read file--"
    Source-size:  91286172 Characters to-scan:  4000000 time: 0:00:52.8567
    "-- start read file--"
    Source-size:  91286172 Characters to-scan:  5000000 time: 0:01:25.6609
    (halted)
    ```
    
    With `change` active, it has comparable results to `parse` with `change`, just 15% faster
    

--------------------------------------------------------------------------------

On 2021-09-13T07:49:18Z, dockimbel, commented:
<https://github.com/red/red/issues/4840#issuecomment-917931151>

    @hiiamboris 
    
    > What's funny is that on #4097 build the time is also exponential. Though I clearly recall making a special case for change when length does not change. So the issue may not be in change itself but in some other function involved.
    
    That does not work. When length does not change, the `part?` flag is still set to `true` in `_series/change` and `string/change-range` leading to several calls to `move-memory`. The issue is in `change` implementation.

--------------------------------------------------------------------------------

On 2021-09-14T10:32:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/4840#issuecomment-919026213>

    Right. Case of source type = destination type is completely forgotten there, and it dispatches into `change-range`...

--------------------------------------------------------------------------------

On 2021-09-14T10:47:42Z, dockimbel, commented:
<https://github.com/red/red/issues/4840#issuecomment-919035869>

    I'll let you fix this ticket then. ;-)

--------------------------------------------------------------------------------

On 2021-09-14T10:53:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/4840#issuecomment-919039411>

    I hope you review the https://github.com/red/red/pull/4097 then as this issue is only a tiny fragment in the bulk of series problems ;)

--------------------------------------------------------------------------------

On 2021-09-14T11:02:59Z, dockimbel, commented:
<https://github.com/red/red/issues/4840#issuecomment-919045226>

    @hiiamboris I'll find time to review it in depth. Series lack an accurate description of their behavior in all possible edge cases, so your implementation in that PR might be premature until a decision is formed about what is the best model to follow. Also, the shoehorning of a specific framework for many functions in the runtime library in the same PR, without prior examination of all the different ways that such need could be addressed, makes it much harder for me to process.
    
    Anyway, a strict language specification for Red is something we should be working on in a not-so-distant future. ;-)

--------------------------------------------------------------------------------

On 2021-09-14T11:20:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/4840#issuecomment-919057364>

    Agreed. That PR has a few parts (which are not hard to split):
    
    1. Fundamentally, how do we make add design-by-contract principles into R/S
       Most important point there is that R/S cannot know our intent and we have to tell it if we want to restrict writes to a specific region(s). Macros were simple for me but ultimately it has to be a part of the language. E.g. pointer write access should not require a macro prior it telling that "hey I'm gonna write that pointer-size bytes", or maybe at least we should be able to *easily* mark such accesses as boundary-checked
    2. The series model (see https://github.com/red/red/wiki/[PROP]-Series-evolution):
       - over-the-tail/before-the-head handling & option of having free index (I assumed the current behavior in the PR, but worth discussing the options)
       - invariants that we want to have (tradeoffs here, between specialization, R2 compatibiliy, and uniformity)
       - part generalization https://github.com/red/REP/issues/97
    3. (missing in the PR) unification and externalization of common logic behaviors of series functions where possible instead of repeating ourselves over and over, and what tools R/S can provide for it
    4. Fixing the issues found so far along the way, which sometimes requires full rewrite of certain functions
    5. (missing in the PR, but somewhat relevant) ownership model (https://github.com/red/red/issues/4524) how we want it to be in the end
    
    Once you set up a course, I can rewrite the PR ;)

