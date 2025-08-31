
#5316: Collector strongly needs a vacation when loading data
================================================================================
Issue is closed, was reported by hiiamboris and has 12 comment(s).
[status.built] [status.tested] [type.bug] [type.design]
<https://github.com/red/red/issues/5316>

**Describe the bug**

The following script writes a block of data and then just loads it multiple times, nothing fishy. At some point GC interference becomes 60 times bigger than the load time!

There aren't that many series to cause any serious GC pressure (about 500), but setting `m` (block length) to a low value proves that `load` function body and the other code is not to blame.
```
Red []

k: 10 n: 50 m: 10000
block: append/dup make [] m 0 m
save name: %test.redbin block
block2: make [] k * n * m
recycle
repeat i k [clock [repeat j n [append/only block2 load name]]]   ;; with GC on
clock [recycle]
recycle/off
repeat i k [clock [repeat j n [append/only block2 load name]]]   ;; with GC off
loop 5 [clock [recycle]]
```
Output:
```
63.6 ms [repeat j n [append/only block2 load name]]
176 ms  [repeat j n [append/only block2 load name]]
239 ms  [repeat j n [append/only block2 load name]]
317 ms  [repeat j n [append/only block2 load name]]
448 ms  [repeat j n [append/only block2 load name]]
401 ms  [repeat j n [append/only block2 load name]]
580 ms  [repeat j n [append/only block2 load name]]
582 ms  [repeat j n [append/only block2 load name]]
627 ms  [repeat j n [append/only block2 load name]]
674 ms  [repeat j n [append/only block2 load name]]
48.9 ms [recycle]
13.3 ms [repeat j n [append/only block2 load name]]
14.5 ms [repeat j n [append/only block2 load name]]
15.3 ms [repeat j n [append/only block2 load name]]
12.6 ms [repeat j n [append/only block2 load name]]
18.1 ms [repeat j n [append/only block2 load name]]
14.0 ms [repeat j n [append/only block2 load name]]
13.8 ms [repeat j n [append/only block2 load name]]
12.5 ms [repeat j n [append/only block2 load name]]
13.0 ms [repeat j n [append/only block2 load name]]
12.0 ms [repeat j n [append/only block2 load name]]
115 ms  [recycle]
83.9 ms [recycle]
79.0 ms [recycle]
81.7 ms [recycle]
82.9 ms [recycle]
```
Note the `recycle` call time at the end: just 240MB of RAM used takes ~100ms to scan. With 1.7GB RAM used it takes ~1sec which is quite a disruption to any program.

**Expected behavior**

GC not noticeably affecting load times.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4667 date: 9-Apr-2023/3:24:34 commit: #d36108eeffeafbf14839b5a9cadc9a0acd87f34a ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-05-13T18:23:15Z, hiiamboris, commented:
<https://github.com/red/red/issues/5316#issuecomment-1546725057>

    Another GC performance issue https://github.com/red/red/issues/4837

--------------------------------------------------------------------------------

On 2023-05-14T17:05:51Z, dockimbel, commented:
<https://github.com/red/red/issues/5316#issuecomment-1546948691>

    Move the I/O out of the way and you'll get the expected performances:
    
    ```
    k: 10 n: 50 m: 10000
    block: append/dup make [] m 0 m
    save name: %test.redbin block
    block2: make [] k * n * m
    recycle
    data: read/binary name
    repeat i k [clock [repeat j n [append/only block2 load/as data 'redbin]]]   ;; with GC on
    clock [recycle]
    recycle/off
    repeat i k [clock [repeat j n [append/only block2 load/as data 'redbin]]]   ;; with GC off
    ```
    
    will give:
    ```
    5.00 ms	[repeat j n [append/only block2 load/as data 'redbin]]
    4.99 ms	[repeat j n [append/only block2 load/as data 'redbin]]
    5.00 ms	[repeat j n [append/only block2 load/as data 'redbin]]
    4.99 ms	[repeat j n [append/only block2 load/as data 'redbin]]
    4.00 ms	[repeat j n [append/only block2 load/as data 'redbin]]
    4.99 ms	[repeat j n [append/only block2 load/as data 'redbin]]
    5.00 ms	[repeat j n [append/only block2 load/as data 'redbin]]
    4.99 ms	[repeat j n [append/only block2 load/as data 'redbin]]
    5.02 ms	[repeat j n [append/only block2 load/as data 'redbin]]
    4.99 ms	[repeat j n [append/only block2 load/as data 'redbin]]
    21.5 ms	[recycle]
    5.99 ms	[repeat j n [append/only block2 load/as data 'redbin]]
    5.00 ms	[repeat j n [append/only block2 load/as data 'redbin]]
    4.00 ms	[repeat j n [append/only block2 load/as data 'redbin]]
    6.17 ms	[repeat j n [append/only block2 load/as data 'redbin]]
    4.99 ms	[repeat j n [append/only block2 load/as data 'redbin]]
    5.00 ms	[repeat j n [append/only block2 load/as data 'redbin]]
    5.99 ms	[repeat j n [append/only block2 load/as data 'redbin]]
    4.99 ms	[repeat j n [append/only block2 load/as data 'redbin]]
    7.00 ms	[repeat j n [append/only block2 load/as data 'redbin]]
    5.84 ms	[repeat j n [append/only block2 load/as data 'redbin]]
    42.0 ms	[recycle]
    32.5 ms	[recycle]
    32.9 ms	[recycle]
    33.0 ms	[recycle]
    34.9 ms	[recycle]
    == 243140928
    ```
    The issue is related to I/O buffers management. @qtxie does this issue happen in IO branch?

--------------------------------------------------------------------------------

On 2023-05-16T01:54:04Z, qtxie, commented:
<https://github.com/red/red/issues/5316#issuecomment-1548851434>

    Run in debug mode with `k: 2` to reduce output.
    1. For the original `load name` version:
    ```
    > .\console .\test.red
    root: 3767/6554, runs: 0, mem: 2164660 => 1889428, mark: 4.0ms, sweep: 0.0ms
    root: 3767/6554, runs: 1, mem: 17889688 => 17889688, mark: 2.0ms, sweep: 0.0ms
    root: 3767/6554, runs: 2, mem: 19175224 => 18772448, mark: 3.0ms, sweep: 0.0ms
    root: 3767/6554, runs: 3, mem: 19173280 => 19012400, mark: 1.1ms, sweep: 0.0ms
    root: 3767/6554, runs: 4, mem: 19092504 => 19092504, mark: 0.0ms, sweep: 0.0ms
    root: 3767/6554, runs: 5, mem: 21256716 => 20532756, mark: 0.0ms, sweep: 0.0ms
    root: 3767/6554, runs: 6, mem: 21254160 => 21012840, mark: 3.7ms, sweep: 0.0ms
    root: 3767/6554, runs: 7, mem: 21253308 => 21172868, mark: 3.0ms, sweep: 0.0ms
    root: 3767/6554, runs: 8, mem: 23337080 => 22613120, mark: 5.0ms, sweep: 0.0ms
    root: 3767/6554, runs: 9, mem: 23334524 => 23093204, mark: 4.0ms, sweep: 0.0ms
    root: 3767/6554, runs: 10, mem: 23333672 => 23253232, mark: 4.0ms, sweep: 1.0ms
    root: 3767/6554, runs: 11, mem: 25417444 => 24693484, mark: 6.0ms, sweep: 0.0ms
    root: 3767/6554, runs: 12, mem: 25414888 => 25173568, mark: 6.5ms, sweep: 0.0ms
    root: 3767/6554, runs: 13, mem: 25414036 => 25333596, mark: 0.0ms, sweep: 9.0ms
    94.4 ms [repeat j n [append/only block2 load name]]
    root: 3767/6554, runs: 14, mem: 27498480 => 26774184, mark: 6.0ms, sweep: 0.0ms
    root: 3767/6554, runs: 15, mem: 27495588 => 27254268, mark: 7.7ms, sweep: 0.0ms
    root: 3767/6554, runs: 16, mem: 27494736 => 27414296, mark: 6.0ms, sweep: 0.0ms
    root: 3767/6554, runs: 17, mem: 29578508 => 28854548, mark: 6.0ms, sweep: 1.0ms
    root: 3767/6554, runs: 18, mem: 29575952 => 29334632, mark: 8.0ms, sweep: 0.0ms
    root: 3767/6554, runs: 19, mem: 29575100 => 29494660, mark: 8.0ms, sweep: 0.0ms
    root: 3767/6554, runs: 20, mem: 31658872 => 30934912, mark: 7.0ms, sweep: 1.0ms
    root: 3767/6554, runs: 21, mem: 31656316 => 31414996, mark: 7.5ms, sweep: 0.0ms
    root: 3767/6554, runs: 22, mem: 31655464 => 31575024, mark: 5.1ms, sweep: 0.0ms
    root: 3767/6554, runs: 23, mem: 33739236 => 33015276, mark: 16.0ms, sweep: 1.0ms
    root: 3767/6554, runs: 24, mem: 33736680 => 33495360, mark: 8.0ms, sweep: 0.0ms
    root: 3767/6554, runs: 25, mem: 33735828 => 33655388, mark: 10.0ms, sweep: 0.0ms
    139 ms  [repeat j n [append/only block2 load name]]
    root: 3767/6554, runs: 26, mem: 34056252 => 33895060, mark: 9.0ms, sweep: 2.0ms
    13.9 ms [recycle]
    15.0 ms [repeat j n [append/only block2 load name]]
    15.0 ms [repeat j n [append/only block2 load name]]
    root: 3767/6554, runs: 27, mem: 57943312 => 49898320, mark: 19.5ms, sweep: 9.0ms
    29.6 ms [recycle]
    root: 3767/6554, runs: 28, mem: 49898580 => 49898320, mark: 18.1ms, sweep: 1.0ms
    22.0 ms [recycle]
    root: 3767/6554, runs: 29, mem: 49898580 => 49898320, mark: 17.0ms, sweep: 1.0ms
    20.0 ms [recycle]
    root: 3767/6554, runs: 30, mem: 49898580 => 49898320, mark: 16.1ms, sweep: 1.0ms
    19.0 ms [recycle]
    root: 3767/6554, runs: 31, mem: 49898580 => 49898320, mark: 10.6ms, sweep: 0.0ms
    10.5 ms [recycle]
    ```
    
    2. For `load/as data 'redbin` version:
    ```
    root: 3767/6554, runs: 0, mem: 2164784 => 1889552, mark: 5.0ms, sweep: 0.0ms
    root: 3767/6554, runs: 1, mem: 17889812 => 17889812, mark: 2.0ms, sweep: 1.0ms
    root: 3767/6554, runs: 2, mem: 19094540 => 19093584, mark: 3.0ms, sweep: 0.0ms
    root: 3767/6554, runs: 3, mem: 21174520 => 21173948, mark: 3.0ms, sweep: 1.0ms
    root: 3767/6554, runs: 4, mem: 23254884 => 23254312, mark: 5.0ms, sweep: 1.0ms
    root: 3767/6554, runs: 5, mem: 25335248 => 25334676, mark: 6.0ms, sweep: 0.0ms
    35.8 ms [repeat j n [append/only block2 load/as data 'redbin]]
    root: 3767/6554, runs: 6, mem: 27416436 => 27415376, mark: 7.0ms, sweep: 0.0ms
    root: 3767/6554, runs: 7, mem: 29496312 => 29495740, mark: 7.9ms, sweep: 0.0ms
    root: 3767/6554, runs: 8, mem: 31576676 => 31576104, mark: 7.0ms, sweep: 0.0ms
    root: 3767/6554, runs: 9, mem: 33657040 => 33656468, mark: 18.1ms, sweep: 1.0ms
    56.9 ms [repeat j n [append/only block2 load/as data 'redbin]]
    root: 3767/6554, runs: 10, mem: 33976952 => 33976368, mark: 9.0ms, sweep: 1.0ms
    13.9 ms [recycle]
    8.99 ms [repeat j n [append/only block2 load/as data 'redbin]]
    9.03 ms [repeat j n [append/only block2 load/as data 'redbin]]
    ```
    
    As we can see, `load name` triggers GC more frequently than `load/as data 'redbin`. That's expected as `load name` calls `read/binary` which may triggers GC.
    
    > Note the recycle call time at the end: just 240MB of RAM used takes ~100ms to scan.
    
    The GC time depends on the number of series in RAM, not the size of used RAM. The simple GC also do a linear traversal of all the series each time, that's why it's slow when there are lots of series in the runtime.
    
    I think no bugs in this issue.

--------------------------------------------------------------------------------

On 2023-05-16T10:09:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/5316#issuecomment-1549379066>

    > The GC time depends on the number of series in RAM, not the size of used RAM
    
    It does depend on (actually) used RAM:
    ```
    >> b: make [] 1e8 clock [recycle]
    2.01 ms [recycle]
    == 1602434952
    >> b: none clock [recycle]
    2.39 ms [recycle]
    == 2435404
    >> b: append/dup make [] 1e8 0 100'000'000 clock [recycle]
    706 ms  [recycle]
    == 1602436348
    >> b: none clock [recycle]
    135 ms  [recycle]
    == 2435916
    >> b: none clock [recycle]
    3.06 ms [recycle]
    == 2435992
    ```
    
    > `load name` triggers GC more frequently than `load/as data 'redbin`
    
    Indeed! 162 cycles with `load name` vs 46 cycles with `load/as data 'redbin`. Latter also shows slowdowns when run in a fresh console:
    ```
    24.0 ms [repeat j n [append/only block2 load/as data 'redbin]]
    41.4 ms [repeat j n [append/only block2 load/as data 'redbin]]
    52.8 ms [repeat j n [append/only block2 load/as data 'redbin]]
    73.5 ms [repeat j n [append/only block2 load/as data 'redbin]]
    62.0 ms [repeat j n [append/only block2 load/as data 'redbin]]
    101 ms  [repeat j n [append/only block2 load/as data 'redbin]]
    109 ms  [repeat j n [append/only block2 load/as data 'redbin]]
    127 ms  [repeat j n [append/only block2 load/as data 'redbin]]
    145 ms  [repeat j n [append/only block2 load/as data 'redbin]]
    166 ms  [repeat j n [append/only block2 load/as data 'redbin]]
    ```
    
    > I think no bugs in this issue.
    
    So it is just a side effect of GC implementation being slow in general. 
    
    Then what the official solution would be? To turn off GC during load? Or even switch to manual GC runs when over 200 MB of RAM is used in the program?

--------------------------------------------------------------------------------

On 2023-05-16T10:40:43Z, dockimbel, commented:
<https://github.com/red/red/issues/5316#issuecomment-1549420823>

    > It does depend on (actually) used RAM:
    
    No, it depends on used `any-block!`, `any-object!`, `function!` and `map!`. Those types are deep-inspected during marking phase to reach out all referenced series. Other values and series datatypes will not have such time cost.
    
    ```
    >> clock [recycle]
    1.00 ms	[recycle]
    == 2917584
    >> b: append/dup make string! 1e8 #"0" 100'000'000 clock [recycle]
    0.0 μs	[recycle]
    == 102920516
    >> clock [recycle]
    1.00 ms	[recycle]
    == 102920356
    >> clock [recycle]
    1.00 ms	[recycle]
    == 102920536
    ```
    
    Note: the recycling time just after the `append/dup` varies from 0.0us to < 10ms, depending on the regions layout in the memory frames. Sometimes it is very favorable (like here), sometimes it is less (end of memory frame producing extra GC runs and longer compacting).

--------------------------------------------------------------------------------

On 2024-12-04T21:28:19Z, dockimbel, commented:
<https://github.com/red/red/issues/5316#issuecomment-2518597770>

    From the soon-to-be-merged `nodes-gc` branch:
    
    ```
    >> repeat i k [clock [repeat j n [append/only block2 load name]]]   ;; with GC on
    25.1 ms	[repeat j n [append/only block2 load name]]
    48.5 ms	[repeat j n [append/only block2 load name]]
    62.1 ms	[repeat j n [append/only block2 load name]]
    87.7 ms	[repeat j n [append/only block2 load name]]
    109 ms	[repeat j n [append/only block2 load name]]
    142 ms	[repeat j n [append/only block2 load name]]
    149 ms	[repeat j n [append/only block2 load name]]
    155 ms	[repeat j n [append/only block2 load name]]
    177 ms	[repeat j n [append/only block2 load name]]
    204 ms	[repeat j n [append/only block2 load name]]
    == [[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
    >> clock [recycle]
    23.4 ms	[recycle]
    == 163220272
    >> recycle/off
    >> repeat i k [clock [repeat j n [append/only block2 load name]]]   ;; with GC off
    5.94 ms	[repeat j n [append/only block2 load name]]
    5.92 ms	[repeat j n [append/only block2 load name]]
    6.94 ms	[repeat j n [append/only block2 load name]]
    5.41 ms	[repeat j n [append/only block2 load name]]
    6.60 ms	[repeat j n [append/only block2 load name]]
    7.19 ms	[repeat j n [append/only block2 load name]]
    5.99 ms	[repeat j n [append/only block2 load name]]
    6.49 ms	[repeat j n [append/only block2 load name]]
    6.00 ms	[repeat j n [append/only block2 load name]]
    6.41 ms	[repeat j n [append/only block2 load name]]
    == [[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
    >> loop 5 [clock [recycle]]
    41.9 ms	[recycle]
    35.5 ms	[recycle]
    33.0 ms	[recycle]
    37.0 ms	[recycle]
    40.5 ms	[recycle]
    == 243236560
    ```
    
    I'll close this issue as resolved, as the main issue has been fixed.

