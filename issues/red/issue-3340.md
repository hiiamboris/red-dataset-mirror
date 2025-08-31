
#3340: `repend` vs `append reduce` differences and regression
================================================================================
Issue is closed, was reported by hiiamboris and has 48 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/3340>

Originated from this discussion:
:point_up: [April 19, 2018 8:50 PM](https://gitter.im/red/bugs?at=5ad8d6db7c3a01610dfce0f4)
and also previously here:
:point_up: [April 19, 2018 7:46 PM](https://gitter.im/red/red?at=5ad8c7eb6d7e07082b109762)

`repend b x` and `append b reduce x` are intended to be **equivalents**, while they are currently not.

### Minimal test snippet
```
repend b: [] ["<" (append b "x"  "o") ">"]       
```
note the block `b` is modified by `append` in between the actions performed by `repend`

### Expected behavior
replacing `repend` with `append reduce` leads to:
```
>> append b: [] reduce ["<" (append b "x"  "o") ">"]
== ["x" "<" "o" ">"]
```

### Actual behavior
#### 0.6.3 stable
note: here the arguments fed to `repend` ("<", "o", ">") at least appear _subsequent_ in the result:
```
>> repend b: [] ["<" (append b "x"  "o") ">"]
== ["<" "o" ">" "x"]
```
#### 0.6.3 nightly
note the *regression* - now the arguments fed are _interspersed_ with "x":
```
>> repend b: [] ["<" (append b "x"  "o") ">"]
== ["<" "x" "o" ">"]
```

### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 633 date: 12-Apr-2018/10:39:17 commit: #f56b72e152d47fea33ba9e38937077cb9356d04d ]
PLATFORM: [ name: "Windows 7" OS: 'Windows arch: 'x86-64 version: 6.1.0 build: 7601 ]
--------------------------------------------
```

### A more complex test example - a self-specializing factorial
Being recursive this example shows the order of modifications made to the switch block by displaying it's contents before the recursive invocation and upon returning from it
```
fac: function [n] [
  switch/default n a: [ 0 [1]  1 [1] ] [
    do also b: body-of context? 'b
    n: also n
    also repend a [n to-block n * (n: n - 1  print ["into" mold a]  do b)]
    print ["out of" mold a]
  ]
]

probe fac 5
? :fac
```
in stable 0.6.3 it works correctly thanks to the preservation of argument order (note how in the output the block `a` is first filled with the values for `n` and only then with the answers):
```
into [0 [1] 1 [1] 5]                                                                            
into [0 [1] 1 [1] 5 4]                                                                          
into [0 [1] 1 [1] 5 4 3]                                                                        
into [0 [1] 1 [1] 5 4 3 2]                                                                      
out of [0 [1] 1 [1] 5 4 3 2 [2]]                                                                
out of [0 [1] 1 [1] 5 4 3 [6] 2 [2]]                                                            
out of [0 [1] 1 [1] 5 4 [24] 3 [6] 2 [2]]                                                       
out of [0 [1] 1 [1] 5 [120] 4 [24] 3 [6] 2 [2]]                                                 
120                                                                                             
func [n /local a b][switch/default n a: [0 [1] 1 [1] 5 [120] 4 [24] 3 [6] 2 [2]] [              
    do also b: body-of context? 'b                                                              
    n: also n                                                                                   
    also repend a [n to-block n * (n: n - 1 print ["into" mold a] do b)]
    print ["out of" mold a]
]]                                                                                              
```



Comments:
--------------------------------------------------------------------------------

On 2018-04-22T21:51:59Z, greggirwin, commented:
<https://github.com/red/red/issues/3340#issuecomment-383415220>

    From @dockimbel:
    
    > They are supposed to be equivalent. I don't think that it can be achieved now without adding a new refinement to reduce, like /after, to ensure that all resulting values are appended. The current /into refinement only inserts from current position.

--------------------------------------------------------------------------------

On 2018-08-28T15:05:34Z, giesse, commented:
<https://github.com/red/red/issues/3340#issuecomment-416622099>

    There's a more significant problem, please let me know if I should open a separate issue.
    
    ```
    >> p: make path! [a b]
    == a/b
    >> append p 1
    == a/b/1
    >> append p [2 3]
    == a/b/1/2/3
    >> repend p [2 3]
    == a/b/1/2/3/[2 3]
    ```
    
    Is there any good reason for the `not block? series` check in `repend`?

--------------------------------------------------------------------------------

On 2018-12-26T05:09:28Z, dockimbel, commented:
<https://github.com/red/red/issues/3340#issuecomment-449904790>

    > Is there any good reason for the not block? series check in repend?
    
    No, I don't see any. I will open a separate issue for it.

--------------------------------------------------------------------------------

On 2018-12-26T05:50:40Z, dockimbel, commented:
<https://github.com/red/red/issues/3340#issuecomment-449908908>

    `repend` in Rebol is just a shortcut for the common `append ... reduce` pattern. This means that you still incur the cost of an extra block produced by `reduce` before `append`.
    
    In Red, `repend` is the _fusion_ of the `append ... reduce` pattern, so that no intermediary block is created (thanks to the efficient `reduce/into` call). This means that values are reduced and appended _one by one_ in this case. It will behave the same way as `append ... reduce`, unless you rely on side-effects, like above modifying the accumulating series while reducing. In such cases, just fall back on `append ... reduce` in order to separate fully the reduction from the appending actions.
    
    So:
    ```
    >> repend b: [] ["<" (append b "x"  "o") ">"]
    == ["<" "x" "o" ">"]
    ```
    is the correct expected result, as expressions are reduced/appended one by one.

--------------------------------------------------------------------------------

On 2018-12-26T07:27:03Z, endo64, commented:
<https://github.com/red/red/issues/3340#issuecomment-449920238>

    Noted on [Differences between Red and Rebol](https://github.com/red/red/wiki/%5BDOC%5D-Differences-between-Red-and-Rebol#repend) wiki page.

--------------------------------------------------------------------------------

On 2019-10-29T14:05:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/3340#issuecomment-547436501>

    @dockimbel 
    > In Red, `repend` is the _fusion_ of the `append ... reduce` pattern, so that no intermediary block is created (thanks to the efficient `reduce/into` call). This means that values are reduced and appended _one by one_ in this case.
    
    I don't know anything about this efficient call ☻:
    ```
    Block: []                                                                                                               
    0:00:00.0360021 [append b reduce ['a 'b]]                                                                               
    0:00:00.0400023 [repend b ['a 'b]]                                                                                      
    0:00:04.838277 [reduce/into ['a 'b] b]                                                                                  
    ```
    Besides, if `reduce/into` adds values one by one (as it does), then to insert ten values you need to move the rest of the block ten times! Talk about efficiency :)
    
    Maybe the whole idea wasn't bad at first look, but in practice it turned out to be.
    
    No. If `reduce/into` is to give any, if negligible, speedup, it will have to prefill the slots with `unset` and then rewrite them one by one. Then only a single move-memory operation will be used. But then you'll have to know how many slots you need, and for that you need to calculate the arity of each subexpression. To that end, I highly doubt `reduce/into` will ever speed anything up.
    
    Why don't we force `reduce/into` to APPEND items instead? `repend` still won't be an equivalent of `append reduce` , but at least it will not be *that* inefficient.
    
    By the way, `reduce/into` is not the only thing that inserts values one by one. I've noticed this pattern in string! actions: `change-range` and `insert`. They *form* each value then insert it, each time shifting the rest of the block. For efficiency I suggest they should first form everything, then insert everything at once.
    
    For the reference, the benchmarking snippet I used:
    ```
    Red []
    
    clock: func [code /local t1 t2] [
    	t1: now/precise/time
    	loop 40000 code
    	t2: now/precise/time
    	print [(t2 - t1) mold/flat code]
    ]
    
    b': []
    b: copy b'
    print ["Block:" mold b]
    clock [ append b reduce ['a 'b] ]
    
    b: copy b'
    clock [ repend b ['a 'b] ]
    
    b: copy b'
    clock [ reduce/into ['a 'b] b ]
    ```
    
    

--------------------------------------------------------------------------------

On 2019-10-29T19:28:40Z, giesse, commented:
<https://github.com/red/red/issues/3340#issuecomment-547591170>

    @hiiamboris I think the point of `reduce/into` is to be more efficient when inserting at the tail, also allowing the user to pre-allocate the block when that makes sense. Perhaps it should, internally, do something different when not at the tail - for eg. most of the time you'd be adding 10 or less items, and that can still be made more efficient than `insert ... reduce`.

--------------------------------------------------------------------------------

On 2019-12-09T10:42:41Z, Oldes, commented:
<https://github.com/red/red/issues/3340#issuecomment-563174420>

    @hiiamboris your `reduce/into` is inserting from head! So it is not same like `repend`
    ```
    clock: func [code /local t1 t2] [
        t1: now/precise/time
        loop 40000 code
        t2: now/precise/time
        print [(t2 - t1) mold/flat code]
    ]
    
    b': make block! 80000
    b: copy b'
    print ["Block:" mold b]
    clock [ append b reduce ['a 'b] ]
    
    b: copy b'
    clock [ repend b ['a 'b] ]
    
    b: copy b'
    clock [ reduce/into ['a 'b] tail b ]
    ```
    ```
    0:00:00.0329358 [append b reduce ['a 'b]]
    0:00:00.0359031 [repend b ['a 'b]]
    0:00:00.0259436 [reduce/into ['a 'b] tail b]
    ```

--------------------------------------------------------------------------------

On 2019-12-09T10:56:44Z, hiiamboris, commented:
<https://github.com/red/red/issues/3340#issuecomment-563181115>

    I know. It's intentional. With that, I wanted to show that current `repend` is both inefficient and leads to obscure results (as in the original post).
    
    Even with `reduce/into [code] tail b` you don't know if `code` will append 1000 items to `b` and you won't be adding to tail anymore (paying the huge speed penalty as it has to shift the rest of the series *every time* it inserts a new item).
    
    That's why I propose it should append new items, which is guaranteed to be fast, and is somewhat more predictable. Otherwise, considering that the intention is to add to the tail, and that the design doesn't provide that automatically, it appears to me that every usage of reduce/into fights it's design.

--------------------------------------------------------------------------------

On 2019-12-10T01:07:45Z, greggirwin, commented:
<https://github.com/red/red/issues/3340#issuecomment-563512944>

    TL;DR Remove `/into` everywhere in Red.
    
    1) If `reduce/into` only ever appends, the name loses meaning.
    
    2) If it doesn't always append, it's harder to reason about (as with `insert`). Maybe much harder, as we have this whole ticket discussing it. And it's not always faster, which was the whole idea.
    
    3)  `collect/into` is perhaps the best case for pre-allocating. But if you *think* your result is going to be large, you can avoid `collect` altogether. It's a convenience for the 99% of cases that don't care. If you need to optimize a large collection, you're going to take another hit because it uses `do body`, right? The CSV codec does use it today, but that's easy to change.
    
    4) `Reduce/into` is not widely used in the Red codebase, and likely used less by anyone outside the core team. It's mainly used in the GUI %core.red, with selections and `undo`. For the former, as a concrete example, which of these seems clearest:
    ```
    reduce/into [1 1 length? nlines 1 + length? head line] clear selects
    
    append clear selects reduce [1 1 length? nlines 1 + length? head line]
    
    clear selects 
    append selects reduce [1 1 length? nlines 1 + length? head line]
    
    repend clear selects [1 1 length? nlines 1 + length? head line]
    ```
    For the undo stack cases, now I have to know where `undo-stack`'s index is, to understand if it's LIFO or FIFO. The `undo` func itself is quite opaque at a glance. Had to find the calls to see that the undo and redo stacks are simply reversed in calls to it. My point is not to be critical of this code, but to look at the use case, and whether `reduce/into` adds value and meaning there. (and maybe suggest comments and more meaningful arg namesin `undo` ;^)
    
    I know there have been arguments in the past about `repend` in general. Not to go OT, but for an artificial compound word it can help IMO. It works because the common use case of appending and reducing are no longer separated, and you end up with just the target series and the value to understand. Not always a win, but it is nicer when you clear a series inline, as above.
    
    5) Is `/into` a good idea at all, anywhere? I vote No. It came about in R3, and I think was championed by Brian Hawley. I'm biased, as I never liked it (Brian I like fine, just not `/into`). AFAIK, it has never been a proven win. It's an unnecessary complication.
    
    @dockimbel please weigh in.

--------------------------------------------------------------------------------

On 2019-12-10T15:48:56Z, Oldes, commented:
<https://github.com/red/red/issues/3340#issuecomment-564096472>

    I would keep `/into` refinements.. @greggirwin as you can see from my numbers above, it is still the fastest way if you know what you are doing. And I believe, that even inserting in the middle of the series may be optimized, like using static internal series value or stack to hold the intermediate result. But I think there are still better things to do.

--------------------------------------------------------------------------------

On 2019-12-10T15:52:51Z, Oldes, commented:
<https://github.com/red/red/issues/3340#issuecomment-564098253>

    Btw... `/into` was more important in R3 where functions like `repend` are not natives and so the time difference is much bigger. These are times in my R3 for comparison:
    ```
    0:00:00.025 [append b reduce ['a 'b]]
    0:00:00.046 [repend b ['a 'b]]
    0:00:00.021 [reduce/into ['a 'b] tail b]
    ```

--------------------------------------------------------------------------------

On 2019-12-10T15:54:49Z, Oldes, commented:
<https://github.com/red/red/issues/3340#issuecomment-564099234>

    Also it is probably good to remind, that all these `/into` usage was in Red before GC was implemented, so not creating new series was more important.

--------------------------------------------------------------------------------

On 2019-12-10T18:44:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/3340#issuecomment-564175015>

    More benchmarking for you ☻:
    
    **100k empty blocks, inserting 2 items**
    ```
    0:00:00.0340019 [append b/:i reduce ['z 'x]]
    0:00:00.035002 [insert b/:i reduce ['z 'x]]
    0:00:00.0200011 [insert b/:i [z x]]
    0:00:00.0260015 [reduce/into ['z 'x] b/:i]
    ```
    `reduce/into` beats append-reduce by 24%! So it **makes sense to reduce into the tail**
    
    ---
    **100k blocks with 1 item each, inserting 2 items at head**
    ```
    0:00:00.0370021 [append b/:i reduce what]
    0:00:00.0370021 [insert b/:i reduce what]
    0:00:00.0230013 [insert b/:i what]
    0:00:00.0340019 [reduce/into what b/:i]
    ```
    I wouldn't call this a noticeable win, but reduce/into beats insert-reduce by 9% on a most trivial example ever: move 1 item and insert 2 items
    
    ---
    **100k blocks with 1 item each, inserting 8 items at head**
    ```
    0:00:00.0660038 [append b/:i reduce what]
    0:00:00.0560032 [insert b/:i reduce what]
    0:00:00.0250014 [insert b/:i what]
    0:00:00.0670038 [reduce/into what b/:i]
    ```
    As you can see, `reduce/into` loses any advantage here, staying behind insert-reduce by 8%. **It doesn't make sense to use `reduce/into` on blocks of 3 and more items.**
    
    ---
    **100k blocks with 23 item each, inserting 2 items at head**
    ```
    0:00:00.0380022 [append b/:i reduce what]
    0:00:00.0410024 [insert b/:i reduce what]
    0:00:00.0260015 [insert b/:i what]
    0:00:00.0370022 [reduce/into what b/:i]
    ```
    Almost even here - just 2 items and it already makes no difference. **It doesn't make sense to use reduce/into at all if there are 20+ items ahead**
    
    ---
    **100k blocks with 23 item each, inserting 8 items**
    ```
    0:00:00.0600035 [append b/:i reduce what]
    0:00:00.0620036 [insert b/:i reduce what]
    0:00:00.0320018 [insert b/:i what]
    0:00:00.0820046 [reduce/into what b/:i]
    ```
    Obviously it **only get worse** if we combine the factors, as it's O(n*m), where n=number of items ahead, and m=number of items to insert.
    
    ---
    I should also point out that:
    > And I believe, that even inserting in the middle of the series may be optimized, like using static internal series value or stack to hold the intermediate result
    
    **Statics won't work**, because `reduce` can call another `reduce` while reducing ;) It can be recursive, so static data will be occupied by the 1st call.
    **Stack - possible**, but dangerous: suppose it eats half of the stack and meets (during reduction) a recursive function there (like parse). This recursive function will have it's maximum recursion depth halved! The stack is pretty small in Red, for whatever reason.
    
    ---
    Test script I used:
    ```
    Red []
    
    recycle/off   ;) this is important
    clock: func [code /local t1 t2 i] [
    	t1: now/precise/time
    	repeat i 40000 bind code 'i
    	t2: now/precise/time
    	print [(t2 - t1) mold/flat code]
    ]
    
    b': [] repeat i 100000 [append/only b' make block! 50]
    
    print "^/100k empty blocks, inserting 1 item"
    
    b: copy/deep b'  clock [ append b/:i reduce ['z] ]
    b: copy/deep b'  clock [ insert b/:i reduce ['z] ]
    b: copy/deep b'  clock [ insert b/:i [z] ]
    b: copy/deep b'  clock [ insert b/:i 'z ]
    b: copy/deep b'  clock [ reduce/into ['z] b/:i ]
    
    print "^/100k empty blocks, inserting 2 items"
    
    b: copy/deep b'  clock [ append b/:i reduce ['z 'x] ]
    b: copy/deep b'  clock [ insert b/:i reduce ['z 'x] ]
    b: copy/deep b'  clock [ insert b/:i [z x] ]
    b: copy/deep b'  clock [ reduce/into ['z 'x] b/:i ]
    
    b': b
    
    print "^/100k blocks with 1 item each, inserting 2 items"
    
    what: ['a 'b]
    b: copy/deep b'  clock [ append b/:i reduce what ]
    b: copy/deep b'  clock [ insert b/:i reduce what ]
    b: copy/deep b'  clock [ insert b/:i what ]
    b: copy/deep b'  clock [ reduce/into what b/:i ]
    
    print "^/100k blocks with 1 item each, inserting 8 items"
    
    what: ['a 'b 'c 'd 'e 'f 'g 'h]
    b: copy/deep b'  clock [ append b/:i reduce what ]
    b: copy/deep b'  clock [ insert b/:i reduce what ]
    b: copy/deep b'  clock [ insert b/:i what ]
    b: copy/deep b'  clock [ reduce/into what b/:i ]
    
    what: ['a 'b 'c 'd 'e 'f 'g 'h 'i 'j 'k 'l 'm 'n 'o 'p 'q 'r 's 't 'u 'v]
    loop 100000 [append b/:i what]
    b': b
    
    print "^/100k blocks with 23 item each, inserting 2 items"
    
    what: ['a 'b]
    b: copy/deep b'  clock [ append b/:i reduce what ]
    b: copy/deep b'  clock [ insert b/:i reduce what ]
    b: copy/deep b'  clock [ insert b/:i what ]
    b: copy/deep b'  clock [ reduce/into what b/:i ]
    
    print "^/100k blocks with 23 item each, inserting 8 items"
    
    what: ['a 'b 'c 'd 'e 'f 'g 'h]
    b: copy/deep b'  clock [ append b/:i reduce what ]
    b: copy/deep b'  clock [ insert b/:i reduce what ]
    b: copy/deep b'  clock [ insert b/:i what ]
    b: copy/deep b'  clock [ reduce/into what b/:i ]
    
    ```

--------------------------------------------------------------------------------

On 2019-12-10T21:43:34Z, greggirwin, commented:
<https://github.com/red/red/issues/3340#issuecomment-564272453>

    > it is still the fastest way if you know what to you are doing.
    
    @oldes, the key here is "if you know what you're doing." That's a big _IF_ IMO. And the performance win evaporates as soon as there's any data in the blocks. (thanks for the numbers @hiiamboris)
    
    If you want to defend it, please address the other points I made, and provide any real-world code that uses it, where it's a win. 

--------------------------------------------------------------------------------

On 2019-12-13T16:21:12Z, dockimbel, commented:
<https://github.com/red/red/issues/3340#issuecomment-565504993>

    The main purpose of `/into` is not speed, but manual memory control on natives that are creating new series, thus relieving the GC from extra work (often useless work, as those new series are often very short-lived). The eventual speed gain comes from avoiding those extra memory management actions.
    
    `/into` is a very useful option for optimizing the memory usage in some critical pieces of code. Usually, GCed languages don't give you an option to switch back to manual memory management. But with `/into`, we can provide a pretty simple and consistent interface to address such needs without forcing users to go down to R/S code. This is just another ace in our sleeves. Domains like arcade game engines and server-side engines (like a web or application server) can benefit a lot from that approach to improve their resource usage significantly with minimal effort. My plan since the beginning is to spread `/into` refinement over all the natives that create new series (starting with `form` and `mold` actions). It's cheap to add, optional and can help a lot for critical code parts. This is not a feature for average users, but rather for the "library writers" category.
    
    About `/into` semantics:
    
    @hiiamboris I don't get the point of your benchmarks, as they just boil down to `insert` vs `append` performance difference, which is common knowledge for everyone here. Some use-cases of inserting at head and middle could be optimized internally, but that would not be a helpful way to spend our limited resources for now.
    
    Historically, I have implemented the first `/into` occurrences as appending into the target series, then some users (mostly Kaj) rightfully complained that it was less flexible than in R3, as they couldn't choose to insert if they wanted to. I remember a long discussion with Kaj about that (can't find it in tickets, so it's probably in the early AltMe Red group) and I finally agreed to relax `/into` to adopt insertion semantics for greater user control. I personally haven't encountered cases requiring insertion at head or middle rather than appending.
    
    So, about `repend` not behaving the same way when the collecting series is modified during reduction, I propose we just switch back to the default implementation using `insert... reduce...` pattern and let people use `reduce/into` for the cases that need optimization.
    
    About `/into`, I think it is a useful asset and we should keep it. For its semantics, I wouldn't mind setting it back to appending only and drop inserting, if that can help some users sleep better, but we would then lose some flexibility.
    
    @greggirwin
    
    1. Well, `/into` is pretty short, and I don't have any better name proposition. Maybe `/in`?
    
    2. It's not any harder than `insert` vs `append`. This ticket is describing a self-modifying case that is far from common usage. Memory pressure reduction is the main goal.
    
    3. Fair point for `collect`, we could drop it there. Mezz functions don't have a strong need for `/into`, as you can easily rewrite them. But for most natives, you have no workaround.
    
    4. I personally don't use `reduce/into` much because the intended gain is provided by `repend`. Now that we'll drop it from `repend`, I will probably use it much more often in Red core parts. We don't have many big third-party frameworks and big libraries in Red so far, but I expect their authors to use it in critical code parts.
    
    5. I think we would lose a valuable asset that other GCed languages would envy.

--------------------------------------------------------------------------------

On 2019-12-13T16:39:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/3340#issuecomment-565511767>

    > @hiiamboris I don't get the point of your benchmarks, as they just boil down to insert vs append performance difference, which is common knowledge for everyone here. Some use-cases of inserting at head and middle could be optimized internally, but that would not be a helpful way to spend our limited resources for now.
    
    Well.. ☻ If you look past the 2nd line of each results block, **you'll find `reduce/into`** in those benchmarks, which you can compare to insert/append. My **point** is outlined **after every benchmark result**, and I show these benchmarks **only to provide** you with the **background behind my proposal** above:
    > That's why I propose it **should append** new items, which is guaranteed to be **fast,** and is somewhat more predictable. Otherwise, considering that the **intention is to add to the tail**, and that the design doesn't provide that automatically, it appears to me that every **usage of reduce/into fights it's design**.
    
    I suppose a **compromise** may be reached by allocating a temporary buffer from R/S and then freeing it before `reduce` returns. Then:
    - we'll still have an **inserting** `reduce/into`
    - that is not O(n\*m) but **O(n+m)**
    - is more predictable when argument modifies the input
    
    But:
    - will it really be **faster than letting GC** do that? Is this something Red cannot optimize by itself?
    - I haven't seen a single **justified use of `reduce/into`** not into tail. Is there any? And are supporting these cases **worth the cost** of having everyone else to type `tail` every time?

--------------------------------------------------------------------------------

On 2019-12-13T19:07:28Z, giesse, commented:
<https://github.com/red/red/issues/3340#issuecomment-565568881>

    @hiiamboris I think you missed the point of what @dockimbel was saying above - it's not about being most efficient (in other words, who cares that it's O(n*m), it's such a rare case that people can just write their code differently and it's guaranteed to be more efficient than whatever compromise Red ends up using), it's about having the option of manual memory control.

--------------------------------------------------------------------------------

On 2019-12-14T03:32:08Z, greggirwin, commented:
<https://github.com/red/red/issues/3340#issuecomment-565677959>

    TL;DR would a native `repend` suffice? While I understand that there may be use cases, even the core team has not leveraged this feature in building Red. It's currently a solution looking for a (specific) problem. Removing it now is easy, and it can be added back if a real need and use case is identified.
    
    `/into` as a name is fine. No better suggestion. My naming comment was about `reduce` not being a great name if it's always appending. The difference being that `insert` and `append` are two different names, each having their own meaning, while `reduce` conflates them, and you don't know which it's doing. It's another case of a func, e.g,  `append`, being easier to reason about, because it's more constrained.
    
    Streaming thoughts:
    
    These are hard choices, because we can't predict how successfully it will be used. It's like people saying C/C++ is more efficient...when written by experts, but a good string type in an HLL's runtime will beat the pants off an average C dev's one-off version. My guess is that `/into` will be used a lot where not necessary, making code harder to reason about (unless it only appends), or having non-obvious performance hits *sometimes* if it also inserts. e.g. write a func your lib that uses it, and you can't guarantee performance, only memory pressure. So it's a very specific optimization to reduce allocations, which is kind of contrary to the reason for using HLLs. Narrowing it further, you have to know if any of the things you're reducing cause allocations, which may lead to a trickle-out spread of `/into` even where it's not needed. 
    
    It has to be supported in multiple datatype actions, across all types, correct? Potential funcs/actions affected (to be corrected) `[to copy insert change append reverse sort trim form mold]` actions and `[reduce compose collect <set ops> enbase/debase compress/decompress to-local-file]`. 
    
    Change to `form-value` interaction which allocates buffers for `form`.
    
    What about `/only` and `/part` support?
    
    Funcs like `[take remove pick select]` or ordinals? Completely different collection model.
    
    It feels odd to me, having not used it, because series funcs target always comes first, while making it a refinement reverses that. Not a show-stopper of course. But it leads to a different line of thinking. e.g., rather than `repend`, what if we had `append/reduce`? Soooo subtly different from `append reduce`. But what if there was a `native! repend` that existed for only that purpose? Here's the funny thing. `reduce/into` is an optimization in `repend`, which already takes an allocated series as an argument. Of course, having `reduce/into` do it at the native level is much faster than in `repend` at the mezz level.
    
    I tried some other names `[into buffer reinsert reduce-into]`, but didn't like them. Thought about a dialected func as well, but we probably want generality in the body/value.
    
    @dockimbel what would be the downsides of a native `repend`? 

--------------------------------------------------------------------------------

On 2019-12-14T09:16:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/3340#issuecomment-565699846>

    > What about `/only` and `/part` support?
    
    A bit off-topic, but I was thinking here, in lines of the streams idea in HOFs chat... We could have a **`part` (or `limit`) function** that would turn any series or port into another port that would exhaust after a given number of items read. At the very least it gives you a **free `/part` refinement** for every **read-only** series function (most notably `foreach`, `map-each` and other readonly HOFs, but also all aggregators, all vector arithmetic, set operations, reduce/compose/compress etc.).
    
    Perhaps (I'm not very familiar with ports) it is also possible to design it in such a way that it could work for **modifying** funcs? The primary need is in `map-each/self`, but other beneficiaries are `forall`, `bind`, `trim`, `random`, `replace`, `complement`, `alter`.

--------------------------------------------------------------------------------

On 2019-12-14T19:46:15Z, greggirwin, commented:
<https://github.com/red/red/issues/3340#issuecomment-565747047>

    Interesting. I have an old `part` func, for dealing with fixed size records in sereis: `part series size index`
    
    While some of the funcs I mentioned (`append reverse sort trim`) don't create new blocks, as I thought about that in the middle of the night, HOFs came to mind and it occurred to me that `reduce/repend` is `collect` where the iterator is `do/next` (`eval-each`).

--------------------------------------------------------------------------------

On 2019-12-14T19:51:15Z, greggirwin, commented:
<https://github.com/red/red/issues/3340#issuecomment-565747531>

    Series slices came up every once in a while in Rebol, but never with any great solutions. They open up a lot of questions. The biggest benefit comes from large slices, or lots of them. The problem in justifying them, and the questions they raise, is that it's not hard to write libs to deal with it.

--------------------------------------------------------------------------------

On 2022-01-20T13:06:07Z, dockimbel, commented:
<https://github.com/red/red/issues/3340#issuecomment-1017487143>

    > It has to be supported in multiple datatype actions, across all types, correct? Potential funcs/actions affected (to be corrected) [to copy insert change append reverse sort trim form mold] actions and [reduce compose collect <set ops> enbase/debase compress/decompress to-local-file].
    
    `/into` is needed only when a new short-lived series is created. `form` and `mold` are prime examples of that as they are almost always used to produce strings that will be immediatly inserted/appended or sent through I/O. `to` when producing a series is also a candidate, though the use-cases for it look rare to me. For the rest `reduce`, `compose` and `collect`, yes. For <set ops>, I don't see where new allocations occur there. For `enbase/debase`, yes. For `compress/decompress`, I would only add it to `compress`, for the cases where a payload need to be compressed then appended to a buffer before sending through I/O.
    
    > what would be the downsides of a native repend?
    
    I don't see any.

--------------------------------------------------------------------------------

On 2022-01-22T14:02:29Z, dockimbel, commented:
<https://github.com/red/red/issues/3340#issuecomment-1019275486>

    After reviewing this whole past discussion, I think the only sane option is to make `/into` always append.

