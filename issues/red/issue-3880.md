
#3880: sort works in O(N^2) when the array is already sorted
================================================================================
Issue is closed, was reported by alex65536 and has 22 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3880>

```
a: copy []
repeat i 100000 [ append a i ]
sort a
```

will keep sorting for a very long time. 

Using `sort/stable` or shuffling the elements before sorting completes in less than one second.

After playing with comparators, I noticed that in the case above (the elements are already sorted), `sort` makes N^2/2 comparisons.



Comments:
--------------------------------------------------------------------------------

On 2019-05-16T13:33:13Z, qtxie, commented:
<https://github.com/red/red/issues/3880#issuecomment-493069202>

    `Sort` uses a classic quick-sort algorithm by default. We need a better algorithm in order to fix this issue.

--------------------------------------------------------------------------------

On 2019-07-09T10:07:35Z, qtxie, commented:
<https://github.com/red/red/issues/3880#issuecomment-509580575>

    Maybe we should choice a sort algorithm which has better worst-case performance as the default one.

--------------------------------------------------------------------------------

On 2019-07-10T00:45:24Z, greggirwin, commented:
<https://github.com/red/red/issues/3880#issuecomment-509862858>

    We can look at what other langs do, but this can also be addressed in docs, as a known edge case. I don't think we need to change the implementation because of it.

--------------------------------------------------------------------------------

On 2019-07-10T07:49:23Z, endo64, commented:
<https://github.com/red/red/issues/3880#issuecomment-509950761>

    What about adding `/with` refinement to make user able to select which algorithm to use, **if he knows about his data**.

--------------------------------------------------------------------------------

On 2019-07-10T16:06:37Z, greggirwin, commented:
<https://github.com/red/red/issues/3880#issuecomment-510125940>

    What would the `/with` refinement take as an arg? That is, how would it work versus `/compare` or `/stable`?

--------------------------------------------------------------------------------

On 2019-07-12T08:38:18Z, qtxie, commented:
<https://github.com/red/red/issues/3880#issuecomment-510802957>

    Usually the default `sort` function in other high-level languages work well in any cases. I was thinking use the `stable sort` as the default one, then change refinement `/stable` to `/quick`.
    
    If we have a good `sort` implementation, like the `Timsort` used in python. We don't even need any refinement.

--------------------------------------------------------------------------------

On 2019-07-13T22:31:05Z, endo64, commented:
<https://github.com/red/red/issues/3880#issuecomment-511158390>

    @greggirwin with `with` refinement we could select the sorting algorithm to use, like quick sort, merge sort, radix sort, insertion sort etc. and raise error if `/stable` used and the algorithm doesn't support stable sorting. That way user can choose a better algorithm for his (known) semi-sorted block, or a slower but less memory using algorithm.

--------------------------------------------------------------------------------

On 2019-07-14T08:02:37Z, alex65536, commented:
<https://github.com/red/red/issues/3880#issuecomment-511182174>

    Some high-level languages implement IntroSort. The idea is to apply HeapSort when QuickSort reaches some recursion depth, for example, 4*log(n). This can solve the issue and not hard to implement.

--------------------------------------------------------------------------------

On 2019-07-15T18:38:10Z, greggirwin, commented:
<https://github.com/red/red/issues/3880#issuecomment-511520409>

    @alex65536 thanks for that idea. I haven't used IntroSort. It could be an easy adaptation to what we have now, and fit with `/stable` as an option.
    
    @endo64 I don't think we want to include too many options, because that becomes more confusing for users, and also offers up the potential for them to use a sort that isn't appropriate, simply out of ignorance.  And once we go down that path, where do we stop with what algorithms to support? 
    
    Even `/stable` is a somewhat advanced concept, if we're talking about very high level (business) developers. A different doc string would help with that, but isn't critical at this point.
    
    MergeSort is a great sort, with the only downside being memory use. That's where BlockSort would be an improvement, and would be a great experiment for someone to implement and compare against. I don't see TimSort as a big win, just different tradeoffs.
    
    If we have only _one_ sort, it's best for it to be stable, predictable, and not pathological. Using less memory is a nice to have, but if you are using `sort` on such large datasets that you hit memory issues today, you should be able to code your way around it, or use one already written, which just isn't the standard `sort`. To me, that means Merge Sort should be standard, and there probably isn't even a reason to offer  a `/quick` option. If Block Sort proves itself in experimentation, it seems that the only tradeoff is best case performance. 

--------------------------------------------------------------------------------

On 2019-09-12T20:38:52Z, qtxie, commented:
<https://github.com/red/red/issues/3880#issuecomment-530996669>

    @alex65536 Sorry I overlooked it. It should be a bug in the sort function.

--------------------------------------------------------------------------------

On 2019-09-12T21:59:34Z, qtxie, commented:
<https://github.com/red/red/issues/3880#issuecomment-531023509>

    It's fast now.

