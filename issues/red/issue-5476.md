
#5476: Set operations welcome optimizations
================================================================================
Issue is open, was reported by hiiamboris and has 8 comment(s).
[type.review]
<https://github.com/red/red/issues/5476>

**Describe the bug**

Some of set operations are using very suboptimal logic, as demonstrated by the following script:
```
Red []

h10k: to hash! repeat i 10000 [append [] i]
h10:  to hash! repeat i 10 [append [] i]
h1:   to hash! [100]
h0:   to hash! []

clock/times [unique h10k] 1e3
print ""
clock/times [intersect h10 h10k] 1e5
clock/times [intersect h10k h10] 1e3
clock/times [intersect h10k h1] 1e3
clock/times [intersect h10k h0] 1e3
print ""
clock/times [union h10 h10k] 1e3
clock/times [union h1 h10k] 1e3
clock/times [union h0 h10k] 1e3
clock/times [union h10k h10] 1e3
clock/times [union h10k h1] 1e3
clock/times [union h10k h0] 1e3
print ""
clock/times [exclude h10 h10k] 1e5
clock/times [exclude h10k h10] 1e3
clock/times [exclude h10k h1] 1e3
clock/times [exclude h10k h0] 1e3
print ""
clock/times [difference h10 h10k] 1e3
clock/times [difference h1 h10k] 1e3
clock/times [difference h0 h10k] 1e3
clock/times [difference h10k h10] 1e3
clock/times [difference h10k h1] 1e3
clock/times [difference h10k h0] 1e3
print ""
b100k: append/dup [] h10k 10
h100k: make hash! b100k
clock/times [exclude h10 h10k] 1e5
clock/times [exclude h10 h100k] 1e5
clock/times [exclude h10 unique h100k] 1e2
clock/times [exclude h10 b100k] 1e2
clock/times [exclude h10 make hash! b100k] 1e2
```
Result is:
```
1.37 ms [unique h10k]

2.60 μs [intersect h10 h10k]    <- symmetric operation hugely depends on argument order
989 μs  [intersect h10k h10]
549 μs  [intersect h10k h1]    <- so much time spent on single value?
485 μs  [intersect h10k h0]    <- so much time spent on empty set?

1.43 ms [union h10 h10k]    <- clearly union is dominated by inner unique call
1.41 ms [union h1 h10k]    <- so much time spent on single value?
1.35 ms [union h0 h10k]    <- so much time spent on empty set?
1.40 ms [union h10k h10]
1.44 ms [union h10k h1]    <- so much time spent on single value?
1.38 ms [union h10k h0]    <- so much time spent on empty set?

1.67 μs [exclude h10 h10k]
2.13 ms [exclude h10k h10]
1.66 ms [exclude h10k h1]    <- so much time spent on single value?
1.64 ms [exclude h10k h0]    <- so much time spent on empty set?

3.24 ms [difference h10 h10k]    <- symmetric operation somewhat depends on argument order
2.98 ms [difference h1 h10k]    <- so much time spent on single value?
2.95 ms [difference h0 h10k]    <- so much time spent on empty set?
2.31 ms [difference h10k h10]
1.67 ms [difference h10k h1]    <- so much time spent on single value?
1.60 ms [difference h10k h0]    <- so much time spent on empty set?

2.27 μs [exclude h10 h10k]
5.22 μs [exclude h10 h100k]   <- this is fine
17.4 ms [exclude h10 unique h100k]
10.7 ms [exclude h10 b100k]   <- dominated by internal hash construction?
32.0 ms [exclude h10 make hash! b100k]   <- can't explain this! why 3x slower than b100k? 
```

**Expected behavior**

Ideally:
- near zero timing on empty and small sets
- symmetric operations using the fastest route

I understand set-ops require inner `unique` call for correctness. So I propose a flag that would let set-op assume that first argument is already unique (e.g. if it comes from another set-op), so it could save time on that call.

`exclude` when 2nd argument << 1st argument could go over 2nd argument and in some way mark equal items in the 1st argument, then copy only those that are not marked. Exact conditions when to switch to such logic should be determined empirically.

**Platform version**
```
Red 0.6.4 for Windows built 4-Feb-2024/4:57:33+03:00  commit #9b8169f
```


Comments:
--------------------------------------------------------------------------------

On 2024-02-07T18:21:50Z, dockimbel, commented:
<https://github.com/red/red/issues/5476#issuecomment-1932624477>

    > 32.0 ms [exclude h10 make hash! b100k]   <- can't explain this! why 3x slower than b100k? 
    
    You've included the `make hash!` part in the measured code, that's why...
    ```
    3.54 ms	[exclude h10 b100k]
    9.79 ms	[exclude h10 make hash! b100k]
    7.08 ms	[make hash! b100k]
    ```

--------------------------------------------------------------------------------

On 2024-02-07T18:26:09Z, hiiamboris, commented:
<https://github.com/red/red/issues/5476#issuecomment-1932630815>

    I know. But `exclude` is supposed to convert block into hash anyway, so why manual conversion is so much slower - that I can't explain.

--------------------------------------------------------------------------------

On 2024-02-07T18:28:11Z, dockimbel, commented:
<https://github.com/red/red/issues/5476#issuecomment-1932634031>

    > So I propose a flag that would let set-op assume that first argument is already unique (e.g. if it comes from another set-op), so it could save time on that call.
    
    That is something we discussed with @qtxie when implementing those set operations. I'm not sure it would be safe to allow that, though I would need to dive into those set-ops code to refresh my mind about the algorithms we used.

--------------------------------------------------------------------------------

On 2024-02-07T18:30:24Z, dockimbel, commented:
<https://github.com/red/red/issues/5476#issuecomment-1932637398>

    > I know. But exclude is supposed to convert block into hash anyway, so why manual conversion is so much slower - that I can't explain.
    
    I guess that the internal hashtable created by `exclude` is significantly cheaper than the one created with `make hash!` (which requires to make a copy of the spec series among other needs).

