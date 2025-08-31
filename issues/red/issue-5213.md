
#5213: Hash performance is completely inadequate
================================================================================
Issue is closed, was reported by hiiamboris and has 32 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5213>

**Describe the bug**

Simple modification benchmark:
```
Red []

pos: list: make block! n: 1e6
clock/times [append list random 99999] n
pos2: skip tail pos -1000
clock/times [pos: change pos 'new] n
clock/times [remove list] 1000
clock/times [insert list 'new] 1000
clock/times [remove pos2] 1000
clock/times [insert pos2 'new] 1000

print ""
pos: list: make hash!  n: 1e5
clock/times [append list random 99999] n
pos2: skip tail pos -1000
clock/times [pos: change pos 'new] 100
clock/times [remove list] 1
clock/times [insert list 'new] 100
clock/times [remove pos2] 1000
clock/times [insert pos2 'new] 100
```
Result:
```
0.50 μs [append list random 99999]
0.39 μs [pos: change pos 'new]
1.28 ms [remove list]
2.12 ms [insert list 'new]
1.02 μs [remove pos2]
0.77 μs [insert pos2 'new]

0.71 μs [append list random 99999]
12.7 ms [pos: change pos 'new]       ;) 32500 times slower than block!!
1110 ms [remove list]                ;) 867 times slower than block! - that's one second per removal!!!
12.4 ms [insert list 'new]
144 μs  [remove pos2]               ;) 140 times slower than block!
12.8 ms [insert pos2 'new]          ;) 16600 times slower than block!!
```
Note that block is 1M in size while hash is only 100k, so insert/remove times for hash appear much less than they are. Benchmarking block with 100k items is fruitless, while benchmarking hash with 1M requires too much patience :D

**Expected behavior**

One order of magnitude slowdown should be acceptable I assume, *for the same 1M length*.
I mostly care about append and change, rest is for completeness.

**Platform version**

```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4457 date: 11-Sep-2022/8:20:11 commit: #85fa7e7830ce1083bc56bee5e2b3db1d9b8d9489 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2022-09-20T15:13:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/5213#issuecomment-1252508300>

    For comparison, times in `red-25may22-f656458f7.exe`, before the hash crash fixes:
    ```
    0.42 μs [append list random 99999]
    0.34 μs [pos: change pos 'new]
    1.21 ms [remove list]
    1.98 ms [insert list 'new]
    0.99 μs [remove pos2]
    2.00 μs [insert pos2 'new]
    
    0.71 μs [append list random 99999]
    0.63 μs [pos: change pos 'new]
    1.24 ms [remove list]
    1.35 ms [insert list 'new]
    239 μs  [remove pos2]
    124 μs  [insert pos2 'new]
    ```
    Seems almost on par (0-2μs times are below resolution for 1000 iterations, these don't count).
    
    Iteration count was adjusted as follows:
    ```
    Red []
    
    #include %/d/devel/red/common/clock.red
    
    pos: list: make block! n: 1e6
    clock/times [append list random 99999] n
    pos2: skip tail pos -1000
    clock/times [pos: change pos 'new] n
    clock/times [remove list] 1000
    clock/times [insert list 'new] 1000
    clock/times [remove pos2] 1000
    clock/times [insert pos2 'new] 1000
    
    print ""
    pos: list: make hash!  n: 1e5
    clock/times [append list random 99999] n
    pos2: skip tail pos -1000
    clock/times [pos: change pos 'new] n
    clock/times [remove list] 1000
    clock/times [insert list 'new] 1000
    clock/times [remove pos2] 1000
    clock/times [insert pos2 'new] 1000
    ```

--------------------------------------------------------------------------------

On 2022-09-20T15:45:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/5213#issuecomment-1252549611>

    Using more advanced (but slower and less precise) profiler on block and hash of *equal 1M length*:
    ```
    <1000000>18%      .00091ms           0 B [append list random 99999]
    <1000000>18%      .0009 ms           0 B [pos: change pos 'new]
    <1000>  24%     1.23   ms           0 B [remove list]
    <1000>  40%     2      ms           0 B [insert list 'new]
    <1000>   0%      .00099ms           0 B [remove pos2]
    <1000>   0%      .0029 ms           0 B [insert pos2 'new]
    
    <1000000> 2%      .00148ms          17 B [append list random 99999]
    <5>      3%   374      ms  25'020'346 B [pos: change pos 'new]    ;) 410'000 times slower than block....
    <1>     89%  61'211    ms   1'048'948 B [remove list]         ;) that's 1 minute for single removal !!!
    <5>      3%   376      ms  33'020'346 B [insert list 'new]    ;) allocated size is per single insertion !!!
    <1000>   1%      .36   ms       5'600 B [remove pos2]
    <5>      3%   377      ms  25'004'176 B [insert pos2 'new]
    ```
    Source:
    ```
    Red []
    
    ;#include %/d/devel/red/common/profiling.red 
    do https://codeberg.org/hiiamboris/red-common/raw/branch/master/profiling.red
    recycle/off
    
    pos: list: make block! n: 1e6
    prof/each/times/quiet [append list random 99999] n
    pos2: skip tail pos -1000
    prof/each/times/quiet [pos: change pos 'new] n
    prof/each/times/quiet [remove list] 1000
    prof/each/times/quiet [insert list 'new] 1000
    prof/each/times/quiet [remove pos2] 1000
    prof/each/times/quiet [insert pos2 'new] 1000
    prof/show
    
    print ""
    prof/reset
    pos: list: make hash!  n: 1e6
    prof/each/times/quiet [append list random 99999] n
    pos2: skip tail pos -1000
    prof/each/times/quiet [pos: change pos 'new] 5
    prof/each/times/quiet [remove list] 1
    prof/each/times/quiet [insert list 'new] 5
    prof/each/times/quiet [remove pos2] 1000
    prof/each/times/quiet [insert pos2 'new] 5
    prof/show
    ```

--------------------------------------------------------------------------------

On 2022-09-20T18:12:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/5213#issuecomment-1252728666>

    I am thinking here.. while performance issue can be solved for unique keys case, it will suck wildly when most keys will be identical, and without b-trees I don't know how we could solve that.
    
    For example if hash consists of 1M integer zeroes, they all fall into the same bucket, and if we wish to change zero at index 500k to one, do we crawl through half of the bucket (which is a linked list IIUC) until we find that particular 500k-th zero? Or maybe each item has a link to it's entry in the bucket?

--------------------------------------------------------------------------------

On 2022-09-20T20:01:52Z, greggirwin, commented:
<https://github.com/red/red/issues/5213#issuecomment-1252843839>

    Isn't that the nature of hashes and bucket sizes? All tradeoffs. Even Judy Arrays have their limits.

--------------------------------------------------------------------------------

On 2022-09-20T21:27:18Z, qtxie, commented:
<https://github.com/red/red/issues/5213#issuecomment-1252932455>

    @hiiamboris  The hard part of modifying the hash is that we need to update the `index` of the moved items. It used some complicated code to update them (only the moved items) before the hash crash fixes. But it's buggy. It's fast because it didn't work correctly. 😅  After the fixes, it updates all the items in the hashtable. That's why it's much slower in your benchmark.
    
    For example, we have a hash.
    
    ```
    [1 2 3 4 5 6 7 8]
    ```
    
    when we removed 6 or insert before 7, only 7 and 8 need to be updated as their `index` changed. It's complicated to handle it correctly in current implementation.
    
    Does the current hash cause big issue in your real projects? Can you use map! instead?
    
    @greggirwin Yes. And also tradeoff with the complexity of the implementation. Judy Arrays are very sophisticated.

--------------------------------------------------------------------------------

On 2022-09-20T21:35:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/5213#issuecomment-1252939904>

    But can you at least fix `change`? Without it, I don't see much use in hash table :)
    It becomes faster to convert it to block, modify, and then convert back to hash than to change a single item :)
    
    Can't use a map since my keys are objects (using /same lookup).
    
    Basically I wanted for my cache smth like (simplified): `object ... pair data pair data pair data ... other object ... pair data ...` so I could both lookup by object and then within the same hash find the `pair` I needed. But now I think it will be much faster to put pairs into a separate block ☻

--------------------------------------------------------------------------------

On 2022-09-20T21:46:21Z, qtxie, commented:
<https://github.com/red/red/issues/5213#issuecomment-1252948361>

    > But can you at least fix change?
    
    I can optimize cases where no items index changed.

--------------------------------------------------------------------------------

On 2022-09-20T21:49:07Z, dockimbel, commented:
<https://github.com/red/red/issues/5213#issuecomment-1252950273>

    > I can optimize cases where no items index changed.
    
    Yes, please do.

--------------------------------------------------------------------------------

On 2022-09-21T10:13:11Z, dockimbel, commented:
<https://github.com/red/red/issues/5213#issuecomment-1253494824>

    After commit https://github.com/red/red/commit/7144ae76c5c9ff6958b35fd1cddbad66ec44f1e8
    ```
    >> clock/times [pos: change pos 'new] 100
    0.0 μs	[pos: change pos 'new]
    ```
    
    For the other measures, those are expected as `hash!` is only optimized for contant time lookups. Inserting/removing implies rebuilding the hashtable partially each time, so slower than block results are expected.
    
    We will introduce in the future more series datatypes with more balanced trade-offs.

--------------------------------------------------------------------------------

On 2022-09-21T10:33:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/5213#issuecomment-1253515309>

    > For the other measures, those are expected
    
    I disagree with the "expected" part, it's an implementation's fault. But append & change are enough for me for the time being. Let's just make sure we redesign this for the 1.0.
    
    To prove that it's a bug will be enough to compare:
    ```
    list: make hash!  n: 1e6
    loop n [append list random 99999]
    clock [remove list]
    clock/times [make hash! remove to block! list] 100
    ```
    ```
    59291 ms        [remove list]
    485 ms  [make hash! remove to block! list]
    ```

--------------------------------------------------------------------------------

On 2022-09-21T12:42:25Z, dockimbel, commented:
<https://github.com/red/red/issues/5213#issuecomment-1253654476>

    @qtxie ^--- There's a serious flaw there!

--------------------------------------------------------------------------------

On 2022-09-21T20:50:09Z, qtxie, commented:
<https://github.com/red/red/issues/5213#issuecomment-1254213704>

    Yes. The current implementation is quite naive and... slow.  I want to see if it really causes an issue in real projects. Most of them are small projects as the current Red is not ready for big serious projects.
    
    @hiiamboris Do you have the test cases to make it crashing before the crashes fixes? I'll see if I can optimize more cases. IIRC, there are too many edge cases to handle which makes the code complicated and hard to change. That's why I switch to a naive implementation.

--------------------------------------------------------------------------------

On 2022-09-21T20:55:18Z, hiiamboris, commented:
<https://github.com/red/red/issues/5213#issuecomment-1254218196>

    > Do you have the test cases to make it crashing before the crashes fixes?
    
    Only those I reported in issues... Crashes in real code were quite erratic.

--------------------------------------------------------------------------------

On 2022-09-22T08:46:00Z, dockimbel, commented:
<https://github.com/red/red/issues/5213#issuecomment-1254716373>

    @qtxie
    ```
    59291 ms    [remove list]
    485 ms      [make hash! remove to block! list]
    ```
    For a hash of 1M elements, removing one item takes almost 60 seconds. Converting that hash to a block, removing the item, converting the whole block back to hash, takes only ~0.5 seconds, so more than 100 times faster. 
    
    That means that beyond a threshold of `hash!` series size (or maybe always), you should just rebuild the whole hashtable on any insertion/removal.

--------------------------------------------------------------------------------

On 2022-09-22T21:43:59Z, qtxie, commented:
<https://github.com/red/red/issues/5213#issuecomment-1255586078>

    @dockimbel Yes. `remove`, I overlooked it. It still uses the old buggy code. I'll fix it.

--------------------------------------------------------------------------------

On 2022-09-24T20:18:51Z, dockimbel, commented:
<https://github.com/red/red/issues/5213#issuecomment-1257058290>

    Now:
    ```
    372 ms	[remove list]
    538 ms	[make hash! remove to block! list]
    ```
    👍 

