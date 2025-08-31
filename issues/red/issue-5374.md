
#5374: Word lookups in `hash!` are linear when path syntax is used
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5374>

**Describe the bug**

```
>> h: make hash! append append/dup [] 0 10000 ["x" 'x #x x]
>> clock/times [h/"x"] 1e6
0.33 μs	[h/"x"]
== 'x
>> clock/times [h/#x] 1e6
0.25 μs	[h/#x]
== x
>> clock/times [h/(quote 'x)] 1e6
0.40 μs	[h/(quote 'x)]
== #x
>> clock/times [h/(quote x)] 1e4
30.8 μs	[h/(quote x)]
== #x
>> clock/times [h/x] 1e4
31.8 μs	[h/x]
== #x
>> clock/times [select h quote x] 1e6
0.53 μs	[select h quote x]
== #x
```
Note the timings.

**To reproduce**

```
h: make hash! append append/dup [] 0 10000 ["x" 'x #x x]
clock/times [h/"x"] 1e6
clock/times [h/#x] 1e6
clock/times [h/(quote 'x)] 1e6
clock/times [h/(quote x)] 1e4
clock/times [h/x] 1e4
clock/times [select h quote x] 1e6
```

**Expected behavior**

O(1) lookup times for `h/x`

**Platform version**
```
Red 0.6.4 for Windows built 25-Aug-2023/4:07:38+03:00  commit #10f54d6
```


Comments:
--------------------------------------------------------------------------------

On 2023-09-01T15:18:33Z, dockimbel, commented:
<https://github.com/red/red/issues/5374#issuecomment-1702920186>

    The internal routing for `eval-path` action in such case results in using a linear search instead of a hashtable lookup.

