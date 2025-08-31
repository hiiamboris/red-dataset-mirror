
#4854: CRASH & CORRUPTION in "dynamic" function calls with refinements
================================================================================
Issue is closed, was reported by hiiamboris and has 124 comment(s).
[status.built] [status.tested] [test.written] [type.design]
<https://github.com/red/red/issues/4854>

Related: https://github.com/red/red/issues/4543 https://github.com/red/red/issues/4787

**To reproduce**
```
Red [file: %1.red]

recycle/off

f-call: func [f] [f/x 1 2]

f1: function [/x q w /local a b c] [
	f-call :f2
	DEAD CODE
]
f2: function [/x q w] [
	print 1
	foreach n [1] [
		; a: b: c: d: e: f: none					;) z = none then crash in foreach-next
		; a: b: c: d: e: f: g: none					;) z = none then crash in foreach-next
		a: b: c: d: e: f: g: h: none				;) z = :?? then crash in foreach-next
		; a: b: c: d: e: f: g: h: i: none			;) crash before z in context/set
		; a: b: c: d: e: f: g: h: i: j: none		;) crash before z in context/set
		; a: b: c: d: e: f: g: h: i: j: k: none		;) crash before z in context/set
		; a: b: c: d: e: f: g: h: i: j: k: l: none	;) crash before z in context/set
		z: none
		?? z
	]
	print 2
	r
]

f-call :f1
```
Run this script with any console, it crashes.
Uncomment different lines to see crash variants.

Stack traces involve `foreach/next` (at the end of foreach) and `context/set` (at `z: none` or smth), indicating likely stack corruption.

**Expected behavior**

Working!

**Platform version**
```
Red 0.6.4 for Windows built 2-Mar-2021/15:01:01+03:00 commit #6de9b93
```



Comments:
--------------------------------------------------------------------------------

On 2021-03-13T20:27:27Z, greggirwin, commented:
<https://github.com/red/red/issues/4854#issuecomment-798780559>

    Confirmed.

--------------------------------------------------------------------------------

On 2021-03-13T21:00:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-798784905>

    Even smaller snippet:
    ```
    Red [file: %1.red]
    
    recycle/off
    
    f-call: func [f] [?? f f/x 1 2]
    
    f1: func [/x q w /local a b c] [
    	f-call :f2
    	DEAD CODE
    ]
    f2: func [/local a b c d e f g] [
    	print 1
    	g: g: none
    ]
    
    f-call :f1
    ```
    
    ```
    f: func [/local a b c d e f g][
        print 1
        g: g: none
    ]
    1
    
    *** Runtime Error 1: access violation
    *** in file: /D/devel/red/red-src/red/runtime/datatypes/context.reds
    *** at line: 300
    ***
    ***   stack: red/_context/set 028BBFD4h 028BBFE4h
    ***   stack: red/word/set
    ***   stack: red/interpreter/eval-expression 02CFD058h 02CFD058h false false false
    ***   stack: red/interpreter/eval 02CFCFA0h true
    ***   stack: red/interpreter/eval-function 028BBF54h 02CFCFA0h
    ***   stack: red/_function/call 028BBF54h 0270AC34h
    ***   stack: red/interpreter/eval-code 028BBF44h 02CFCB70h 02CFCB70h true 02CFCB40h 02CFCB88h 028BBF44h
    ***   stack: red/interpreter/eval-path 02CFCB40h 02CFCB50h 02CFCB70h false false false false
    ***   stack: red/interpreter/eval-expression 02CFCB50h 02CFCB70h false false false
    ***   stack: red/interpreter/eval 02CFCAB8h true
    ***   stack: red/interpreter/eval-function 028BBF34h 02CFCAB8h
    ***   stack: red/_function/call 028BBF34h 026F3884h
    ***   stack: red/interpreter/eval-code 029A8628h 02CFCDD0h 02CFCDF0h false 00000000h 00000000h 029A8628h
    ***   stack: red/interpreter/eval-expression 02CFCDC0h 02CFCDF0h false false false
    ***   stack: red/interpreter/eval 02CFCD48h true
    ***   stack: red/interpreter/eval-function 028BBEB4h 02CFCD48h
    ***   stack: red/_function/call 028BBEB4h 0270AC34h
    ***   stack: red/interpreter/eval-code 028BBEA4h 02CFCB70h 02CFCB70h true 02CFCB40h 02CFCB88h 028BBEA4h
    ***   stack: red/interpreter/eval-path 02CFCB40h 02CFCB50h 02CFCB70h false false false false
    ***   stack: red/interpreter/eval-expression 02CFCB50h 02CFCB70h false false false
    ***   stack: red/interpreter/eval 02CFCAB8h true
    ***   stack: red/interpreter/eval-function 028BBE94h 02CFCAB8h
    ***   stack: red/_function/call 028BBE94h 026F3884h
    ***   stack: red/interpreter/eval-code 029A8628h 02CFC588h 02CFC588h false 00000000h 00000000h 029A8628h
    ***   stack: red/interpreter/eval-expression 02CFC578h 02CFC588h false false false
    ***   stack: red/interpreter/eval 028BBE74h true
    ***   stack: red/natives/catch* true 1
    ***   stack: ctx||548~try-do 02711D58h
    ***   stack: ctx||548~launch 02711D58h
    ***   stack: ctx||566~launch 027117F4h
    ```
    First off, it does not error out when `f2` is called with an `/x` refinement absent in it's spec. This should tell something.
    Second, as in the other mentioned issues, 8th local is the key.

--------------------------------------------------------------------------------

On 2021-03-13T22:19:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-798794371>

    At least right now, this looks like a problem to me (or one of):
    https://github.com/red/red/blob/c4d9b0a6c349f259ba79799fdf592fc953a96ada/runtime/datatypes/structures.reds#L72
    
    Since the same literal path is used to call different funcs.

--------------------------------------------------------------------------------

On 2021-03-13T22:53:52Z, dockimbel, commented:
<https://github.com/red/red/issues/4854#issuecomment-798798181>

    For a simple function call, the arguments cache array is stored in the `function!` value itself, while for a function call with refinements, it's a specific occurence that is then stored in the `path!` value itself. In a dynamic path call, the cache will not get refreshed, causing a mismatch with the function's spec and resulting in a memory corruption or crash. 
    
    If the cache would get refreshed on every call, it would work, but have a pretty significant overhead on that specific call. I will look in cache handling improvements for calls with refinements, in order to avoid storing the `args` node into the `path!` slot.

--------------------------------------------------------------------------------

On 2021-03-13T23:58:47Z, greggirwin, commented:
<https://github.com/red/red/issues/4854#issuecomment-798804331>

    Extra overhead seems vastly preferable to a crash. :^) We could profile up to the crash point @hiiamboris identified, make the change, then profile again. 

--------------------------------------------------------------------------------

On 2021-03-14T00:04:37Z, greggirwin, commented:
<https://github.com/red/red/issues/4854#issuecomment-798805008>

    That is, profile with the current version of Red, post those results, add the refresh on dynamic calls, and post those numbers. Then it's a matter of what we tell users. 
    
    A) All dynamic calls are slower. Here's what constitutes a dynamic call...
    
    B) Dynamic calls are limited to 7 locals. More than that and you'll crash. You've been warned.
    
    C) Dynamic calls with up to 7 locals are fine, and fast. More than 7 locals and the calls will be slower but at least it's smart and doesn't crash. Oh, and if you do really tricky stuff like @hiiamboris does, you can trip up the local counter whereupon you will be struck by lightning.

--------------------------------------------------------------------------------

On 2021-03-14T10:31:27Z, dockimbel, commented:
<https://github.com/red/red/issues/4854#issuecomment-798883431>

    @greggirwin It's not dependent on locals specifically, it's about using a function A spec to fetch the arguments and set locals for a function B. This only happens in interpreter (compiler is using a very different approach) and when calling a function with refinements and having the path refer to more than one function (that's the "dynamic" part).
    
    The overhead is the cost of building up a new cache, which involves deep analysis of the spec block (including a O(n^2) algorithm to resolve out-of-order refinements). This means there are also extra internal block! allocations. If the function is called only a few times, that would not be a significant overhead. If the function is called in a tight loop, that would easily end up becoming a huge overhead.

--------------------------------------------------------------------------------

On 2021-03-14T10:53:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-798886095>

    Can't we just stash the link to function body somewhere, and when cached body link is not the same as body we're about to invoke, then that means the spec might be wrong too and we should rebuild the cache?

--------------------------------------------------------------------------------

On 2021-03-14T10:58:27Z, dockimbel, commented:
<https://github.com/red/red/issues/4854#issuecomment-798886660>

    It should be enough to link the cache array to the function's context node pointer. Though the issue is where to store the cache array node for a given path call. The main reason for the arguments cache existence is the out-of-order refinements case, to avoid a linear search in the spec block for every refinement on every call. Though, that naive approach would result in a much simpler implementation for calling functions and remove hundreds of R/S lines of code. The other advantage of the cache is precalculated bitsets for arguments type requirement. That would also require a linear search for every argument across their corresponding type block.

--------------------------------------------------------------------------------

On 2021-03-14T11:40:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-798892292>

    I don't know how current cache is structured, but just a few points that seem sane to me given my current perspective:
    
    1. We could organize refinements cache as smth like this:
    ```
    bytes 0-26 = offsets for first chars of refinements: A to Z, then 27th for every other char
    offset 27: list of refinements starting with letter A (as word ids) and their indices in the function spec (1 byte?)
    27 + length of A-list: list for B
    ...
    ```
    Worst function I know - `find` - has only two refinements starting with the same letter:
    ```
    >> print mold/flat sort keep-type spec-of :find refinement!
    [/any /case /last /match /only /part /reverse /same /skip /tail /with]
    ```
    So that makes `/same` and `/skip` lookups bounded by 2 iterations, and other refinements - by 1 iteration.
    We would store this cache *with the function* so when we interpret the path we would know what refinements are supported and their offsets. Thus eliminating the need for path cache.
    If someone writes a function with 10 refinements and all of them start with the same letter, we fight back with documentation ;)
    
    2. Bitset cache should also be stored with the function, so should be irrelevant to paths.
    3. We could dynamically build or free such caches depending on how often a function is called (to keep functions lighter). E.g. we could introduce some global timer that increases by 1 once per second. Then a function would store the time of last invocation and some counter. And if time is a few seconds away it would free it's cache. But if time is the same and counter gets to 5+, function would build it's cache to make further calls faster. The same timer then could be used to control other dynamic caches in the future.

--------------------------------------------------------------------------------

On 2021-03-14T12:19:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-798897414>

    > That is, profile with the current version of Red, post those results, add the refresh on dynamic calls, and post those numbers. Then it's a matter of what we tell users.
    
    Some naive profiling result with and without cache (https://github.com/red/red/blob/master/runtime/interpreter.reds#L510 replaced with `either true [`):
    
    ```
    Red []
    
    do https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/clock.red
    
    f: func [/x /y /z] []
    
    recycle/off
    s: stats
    clock/times [f]       1000000
    clock/times [f/x]     1000000
    clock/times [f/x/y/z] 1000000
    clock/times [f/z/y/x] 1000000
    print ["Allocated" stats - s / 1e6 "MB"]
    ```
    
    With cache:
    ```
    0.19 μs [f]
    0.21 μs [f/x]
    0.20 μs [f/x/y/z]
    0.22 μs [f/z/y/x]
    Allocated 0.007672 MB
    ```
    Without cache (or more precisely - rebuilds cache every time, idk how to tell it not to):
    ```
    0.22 μs [f]
    0.39 μs [f/x]
    0.47 μs [f/x/y/z]
    0.56 μs [f/z/y/x]
    Allocated 528.010096 MB
    ```

--------------------------------------------------------------------------------

On 2021-03-14T13:46:07Z, dockimbel, commented:
<https://github.com/red/red/issues/4854#issuecomment-798909538>

    > 1. We could organize refinements cache as smth like this: [...]
    
    That's an interesting idea, though treating words as character arrays is not convenient nor the most elegant option. A solution relying on word's symbol IDs is preferable.
    
    > 3. We could dynamically build or free such caches depending on [...]
    
    The total amount of memory used by function caches is not worth such extra layer of complexity. I'm more and more inclined on removing some code and simplifying algorithms when the gains are not worth it.

--------------------------------------------------------------------------------

On 2021-03-14T20:24:21Z, greggirwin, commented:
<https://github.com/red/red/issues/4854#issuecomment-798973490>

    Thanks for the explanation @dockimbel. Simplifying sounds good. The time overhead is negligible in @hiiamboris' tests, but the space is brutal.

--------------------------------------------------------------------------------

On 2021-03-14T23:14:37Z, dockimbel, commented:
<https://github.com/red/red/issues/4854#issuecomment-798998324>

    Here is a quick description of the spec block precalculated cache format:
    
    ```
    <fun-slot>/more/args [node!]
    ```
    `args` is an array of key/value in a `block!` for encoding every argument and refinement from a function spec (also used for all native variants).
    ```
    args: [
    	<arg-name1> <typeset1>
    	<arg-name2> <typeset2>
    	...
    	<arg-nameN> <typesetN>
    
    	#ooo	    <opt-offsetsF>		; optional arguments offsets array for function!
    	<ref-name1> <state1>
            <arg-ref1>  <typesetR1>			; refinement argument(s)
            ...
    	<ref-name2> <state2>
    	...
    	<ref-nameN> <state3>
    	...
    	return:     <typesetR>			; optional
    	none	    <opt-offsetsNF>		; optional arguments offsets array for non-function!
    ]
    
    <arg-name>    : word! | get-word! | lit-word!
    <typeset>     : typeset!
    <ref-name>    : refinement!
    <state>       : logic!				; true: refinement is used
    <opt-offsets> : vector! [integer!]              ; optional arguments encoding with out-of-order support
    ```
    
    When a function is called, it will use such cache list to properly fetch all the arguments, including optional ones (setting them on the stack in canonical order using the <bit-array> offsets). `/local` and other refinements values are also fetched from that cache list.
    
    The two offset vectors have different internal encodings:
    
    - The function! version is a list of offsets in the cache block to point to specific optional arguments name/typeset entries.
    - The native!/action!/routine! version contains a list of evaluation stack offsets where to find optional argument slots.

--------------------------------------------------------------------------------

On 2021-03-15T00:05:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-799007342>

    > setting them on the stack in canonical order using the <bit-array> offsets
    
    And offsets are currently held in path cache, correct?
    
    > That's an interesting idea, though treating words as character arrays is not convenient nor the most elegant option. A solution relying on word's symbol IDs is preferable
    
    Ok, so revising previous idea, instead of 0..26 as first char, we could use `word-id % 40` or smth. Poor man's hash table, but simple, fast, and it will just work because we know that word ids are distributed uniformly, and as long as we keep the period a few times bigger than the maximum number of refinements, chances of collisions are going to be slim.

--------------------------------------------------------------------------------

On 2021-03-15T00:14:53Z, dockimbel, commented:
<https://github.com/red/red/issues/4854#issuecomment-799009298>

    > And offsets are currently held in path cache, correct?
    
    No, the path is just where the `args` node is stored for a call with refinements. The offsets are in the the `<opt-offsets>` vector.
    
    > Ok, so revising previous idea, instead of 0..26 as first char, we could use word-id % 40 or smth. Poor man's hash table, but simple, fast, and it will just work because we know that word ids are distributed uniformly, and as long as we keep the period a few times bigger than the maximum number of refinements, chances of collisions are going to be slim.
    
    I was thinking about a simple hashing also, though that would require to reserve a block of size 40 at least... a bit oversized in most cases. The fact that the word IDs are unique among a function spec is something we could leverage. Though, I still believe there is a simpler solution to discover. 

--------------------------------------------------------------------------------

On 2021-03-15T09:37:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-799270563>

    Do we need a block? A vector should be enough I think

--------------------------------------------------------------------------------

On 2021-03-15T10:16:09Z, dockimbel, commented:
<https://github.com/red/red/issues/4854#issuecomment-799298205>

    Depends on what you want to store. Currently, it needs to store typesets, argument names (for error reports), argument name type (for different type of fetching, lit-word!, get-word!,...). So for argument names it could boil down to just the symbol ID, for the name type, 2 bits are enough for encoding it, but for the typeset, it needs the 96-bit of the payload.

--------------------------------------------------------------------------------

On 2021-03-15T10:27:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-799305345>

    Instead of 40 buckets we could size the hash table depending on the number of refinements:
    
    | # of refinements | # of buckets |
    | --- | --- |
    | 0 | 0 |
    | 1 | 1 |
    | N=2+ | 3 * N |
    
    In most cases it will be much smaller than the arg-name/typeset part of the cache.

--------------------------------------------------------------------------------

On 2021-03-15T20:15:57Z, greggirwin, commented:
<https://github.com/red/red/issues/4854#issuecomment-799721591>

    What about "memoizing" caches, i.e. making the cache a key-val struct with the unique path being the key? In the case where every possible path for a func is used, it blows up, so we can't use it for permutation testing of refinements. :^) But maybe we could limit the number of caches, making it an LRU list (oldest pushed out). `Find` and `select` are the first that come to mind as problems, but we could group funcs by refinement count to see how many have more than 3. It may still blow things up; I haven't thought it through in depth.

--------------------------------------------------------------------------------

On 2021-03-15T20:23:38Z, greggirwin, commented:
<https://github.com/red/red/issues/4854#issuecomment-799726273>

    So you have a cache for each call pattern, speeding repeated calls up like a JIT. You pay to check if that call pattern is cached, to prune the cache if needed, and with extra space for each cache. e.g. `append` may have 6 caches instead of one. But if we can stem the required args (no refinements used), those don't have to be repeated in every cache. So you have a base cache and then the path cache that contains only refinement args.

--------------------------------------------------------------------------------

On 2021-03-15T20:26:36Z, greggirwin, commented:
<https://github.com/red/red/issues/4854#issuecomment-799727956>

    I haven't looked at the code, so I'm brainstorming from the outside. Even `find` and `select` only have 3 refinements each that take args.

--------------------------------------------------------------------------------

On 2021-03-15T20:27:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-799728394>

    It's already like that: unique path is the "key" (rather contains a link to the cache). And this is the issue, because the same path may refer to many things. We're trying to find a best way to move cache from path into function.

--------------------------------------------------------------------------------

On 2021-03-15T20:32:30Z, greggirwin, commented:
<https://github.com/red/red/issues/4854#issuecomment-799731699>

    Ah, right. I spaced on the dynamic part when the idea came to me. :^\ Rather, the level of the dynamic part.

--------------------------------------------------------------------------------

On 2021-03-15T20:38:14Z, greggirwin, commented:
<https://github.com/red/red/issues/4854#issuecomment-799735025>

    Which comes back to your "stash a link to the body" comment. But we still, correct me if *this* is wrong, have the issue of every path call being dynamic, and having to rebuild the cache at every call (to fix this bug). So if we can identify the target, we might still benefit by having a pool of caches.

--------------------------------------------------------------------------------

On 2021-03-15T20:39:56Z, greggirwin, commented:
<https://github.com/red/red/issues/4854#issuecomment-799736020>

    And, yes, I know that's the goal you're trying to achieve with a small hash table. I'm just thinking from a "what would this look like when debugging" view.

--------------------------------------------------------------------------------

On 2021-03-15T20:49:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-799742188>

    > But we still, correct me if this is wrong, have the issue of every path call being dynamic, and having to rebuild the cache at every call (to fix this bug)
    
    Dynamic as in `my-fun/ref-1/ref-2/ref-3` is not a problem if all refinements resolve in O(1) time with reasonably small cache size. And there will be no need to rebuild the cache if it's a part of the function, not the path (function is a constant). There's still an issue to find the function inside the path e.g. `obj1/obj2/obj3/my-fun`, but we can't cache it, can we? `obj1/2/3` may refer to anything, so we *have* to walk thru and check. If I'm not missing anything ;)

--------------------------------------------------------------------------------

On 2021-03-15T20:57:13Z, greggirwin, commented:
<https://github.com/red/red/issues/4854#issuecomment-799746743>

    Oy, indeed. :^\

--------------------------------------------------------------------------------

On 2021-03-15T21:23:22Z, dockimbel, commented:
<https://github.com/red/red/issues/4854#issuecomment-799761783>

    > There's still an issue to find the function inside the path e.g. obj1/obj2/obj3/my-fun, but we can't cache it, can we? obj1/2/3 may refer to anything, so we have to walk thru and check. If I'm not missing anything ;)
    
    Detection of functions returned from partial or full path evaluation is done by [this code](https://github.com/red/red/blob/master/runtime/interpreter.reds#L715) in the interpreter.

--------------------------------------------------------------------------------

On 2021-03-18T13:03:34Z, dockimbel, commented:
<https://github.com/red/red/issues/4854#issuecomment-801909680>

    I have edited the cache description to correct the vectors description.
    
    Here is what I propose for solving this:
    - As the cache block is basically a copy of the function's context, __bind__ the refinement to the calling function's context, so we get the refinement! `/index` field set. That field can then be used to easily calculate the position of the corresponding refinement and eventual optional arguments entries in the cache block.
    - __store__ the function's context node into the calling path's `/args` field. That node is then used on each call, to check if the path is still referring to the same function or not. If it's a different one, then the remain part of the path is bound again to the new context. The binding process for each refinement is a hash lookup, so it's O(1) for this worst-case scenario.
    - eventually, __switch__ to a `vector!` array for the cache if the memory gain is big enough and the processing code does not increase significantly.
    
    So the binding is done only once if the path keeps referring to the same function, and the `/index` field then gives an offset to retrieve the proper info in the cache at low cost. 
    
    One aspect from this solution that I don't like is having the path refer to the function's context (for checking if it's the same function or not on each call), which will prevent the function from being fully garbage-collected if the path is still alive. Though, I think that's a minor price to pay.
    
    In addition to that, the whole cache should be built and stored in the function! slot at function construction, in order to avoid some inconsistencies that the current code exhibits:
    ```
    >> foo: func [a b][a + b]
    == func [a b][a + b]
    >> foo 2 2
    == 4
    >> remove spec-of :foo     ;-- remove the argument after the cache has been built
    == [b]
    >> foo 2 2
    == 4                       ;-- spec block has not mutated
    
    >> foo: func [a b][a + b]
    == func [a b][a + b]
    >> remove spec-of :foo     ;-- remove the argument before the cache has been built
    == [b]
    >> foo 2 2
    == 2                       ;-- spec block has mutated
    ```
    
    The cache makes the function specification de-facto immutable, even if the spec block itself is altered. For now, this is a good default behavior. We could provide in the future a way to refresh the cache once the spec block is changed to avoid a full reconstruction. Though, those use-cases are very rare, so I am not even sure it is worth it. We'll see.

--------------------------------------------------------------------------------

On 2021-03-18T15:07:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-802004651>

    Sounds like a plan :)
    I don't think this will win any performance over simplest hashtable, but we'll save a bit of RAM.
    At some point we can make a special case for the GC to not mark function words inside paths.

--------------------------------------------------------------------------------

On 2021-03-18T16:02:31Z, dockimbel, commented:
<https://github.com/red/red/issues/4854#issuecomment-802048258>

    @hiiamboris About your hashing proposition, do you have a good solution for building up something as close to a perfect hash as possible? If you do and it takes very little storage space, maybe that would be better than relying on binding, as binding relies on Murmur3, which is a pretty heavy hashing algorithm.

--------------------------------------------------------------------------------

On 2021-03-18T17:09:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-802128115>

    I'll mock up some Red code...

--------------------------------------------------------------------------------

On 2021-03-18T17:16:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-802138053>

    @dockimbel Can you explain btw why binding requires murmur3? Or what is `red-symbol!` to begin with and how is it different from words? ;)
    I'm asking because maybe I miss some things in how Red works, but common sense tells me that symbol table should be only used in `load`, and after that each word should have it's integer id and require no string hashing, ever.

--------------------------------------------------------------------------------

On 2021-03-18T20:57:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-802293243>

    Some results from my attempt:
    
    |Parameter|Multiplier=1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|
    |---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
    |max # iterations                          |16    | 9| 7| 4|4 | 3|4 |3 | 2|2 |4 |3 |2 |3 |3 |2 |2 |2 |5 |3 |
    |mean # iterations                        |0.77 | 0.56| 0.41 |0.39 |0.36 |0.38 |0.36 |0.36 |0.35 |0.35 |0.34 |0.35 |0.34 |0.34 |0.34 |0.34 |0.33 |0.34 |0.36 |0.34|
    |total # iterations for 441 funcs | 342 | 250 | 185 | 172 | 163 | 169 | 161 | 161 | 155 | 155 | 154 | 155 | 152 | 153 | 154 | 152 | 149 | 151 | 160 | 151 |
    |# iterations for the extreme case of 133 refinements |511|378|245|112|34|77|102|37|36|3|8|7|20|4|1|1|1|1|1|1|
    |mean cache size per func, bytes                |6.2 |8.6 |11.2|14.2|17.3|20.5|23.6|26.8|29.9|33.1|36.3|39.5|42.6|45.8|49.0|52.1|55.3|58.5|61.7|64.8|
    |total cache size for 441 funcs, kB | 2.7| 3.8| 4.9| 6.2| 7.6| 9.0|10.4|11.8|13.2|14.6|16.0|17.4|18.8|20.2|21.6|23.0|24.3|25.8|27.2|28.6|
    
    `max # iter` shows that occasional spikes of 3-5 extra iterations are a property of the method and we can't do anything about it
    `mean # iter` shows that after 3x multiplier we don't win anything anymore
    `cache size` rows show that refinement cache can be compact up to quite high level of redundancy
    
    `# iter for the extreme case` (I collected unique refinements from all functions into a single spec) was measured separately. It shows how it works in the case of abuse. I do not think it's worth spending more RAM to support esoteric cases, instead we could cap the limit of iterations e.g. at 1000 or 10000 and after that mark the function as non-cacheable (e.g. `cache = [-1]`) and use `find` instead of cache. Or just throw an error when someone tries to create such function? That would be simpler..

--------------------------------------------------------------------------------

On 2021-03-18T21:13:09Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-802303558>

    What I did is roughly this:
    1. let's use the simplest function to map any integer uniformly to our cache size: `%`: `word-id % period`
    2. then for N refinements we need minimum period of N (provided all `word-id % period` are unique for all refinements) 
    3. if they're not unique, increase the period by 1 and repeat
    
    As a result, I create a hash table with at most 1 item per bucket, thus I need no buckets at all, just the array of size `period`.
    This assumes that function creation complexity is >> than cache creation complexity and that we create functions rarely but call them often. So it pays to spend some time to find optimal cache size (period) to speed up calls and minimize the RAM footprint of such cache.
    It also assumes that cache is readonly - we're not adding refinements to a function at runtime ;) If we do, we must re-create it.
    
    I've uploaded the Red mockup here: https://gist.github.com/hiiamboris/4502f5213b8f2afffdb865b098fa8db5
    
    Commented extensively, should be readable. Feel free to play with the initial constants.
    Starting multiplier is how big the cache is initially (1 -> N integers, 2 -> 2*N, ...).
    I would choose the 3x starting multiplier as I propose initially (or 4x). But back then it was an educated guess, now it's statistical fact ;)

--------------------------------------------------------------------------------

On 2021-03-18T21:22:25Z, dockimbel, commented:
<https://github.com/red/red/issues/4854#issuecomment-802309792>

    How do you handle collisions in that hashtable?

--------------------------------------------------------------------------------

On 2021-03-18T21:27:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-802313011>

    For refinements that are present - there are no collisions. Other (not present in the function) refinements may collide but this is detected later by comparing provided refinement word-id with that of the refinement found in the spec.

--------------------------------------------------------------------------------

On 2021-03-18T21:34:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-802317637>

    See also the output I just provided in the snippet link. It helps I hope.

--------------------------------------------------------------------------------

On 2021-03-18T22:07:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-802338547>

    I ugh.. forgot to make a special case for functions with single refinement (where cache of 1 slot is always enough, and it's always 1 iteration to create). Let's not forget it if we choose to use this approach in R/S code. Most likely case - `/local` :)

--------------------------------------------------------------------------------

On 2021-03-18T22:41:55Z, dockimbel, commented:
<https://github.com/red/red/issues/4854#issuecomment-802359058>

    > Can you explain btw why binding requires murmur3? 
    
    Because that's the hashing algorithm we use for the symbol table and contexts binding. A few months ago, we extended all contexts to add a hashtable, using our general hashtable implementation. That implementation uses [murmur3](https://github.com/red/red/blob/master/runtime/hashtable.reds#L262).
    
    > Or what is red-symbol! to begin with and how is it different from words? ;)
    
    It's the value slot for the internal `symbol!` datatype (not user-accessible). It connects a symbol ID to its `string!` representation. It is only used in the internal symbol table block (which is reflected at user-level through `system/words`) and should be used later in modules (as each module should have its own symbol table). The symbol table also handles different spellings for same words through the `alias` field. A word is a user-level structure that represents a symbol ID bound to a context (word = symbol ID + context pointer).
    
    > I'm asking because maybe I miss some things in how Red works, but common sense tells me that symbol table should be only used in load, and after that each word should have it's integer id and require no string hashing, ever.
    
    Right, new symbols can only be created by `load` at Red level. Once loaded and stored, symbol are referred through their symbol ID mostly. Some actions still need to read the symbol table for accessing the string representation (like for `mold`, `form`, comparison natives, ...).

--------------------------------------------------------------------------------

On 2021-03-18T22:56:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-802366448>

    OK. But are you sure murmur3 is actually used in bind? Because as I understand bind takes a word (symbol id, integer) and must match it to an index in context (integer). And hashtable when looks up words does not access or hash symbols (strings): https://github.com/red/red/blob/73d9bd24d5bb240a7e3816f07a98890c0e50fe5b/runtime/hashtable.reds#L441 but takes the id directly. Not saying we should use hashtable.reds when we can do away with much faster/simpler solution, just trying to figure out how it really works ;)

--------------------------------------------------------------------------------

On 2021-03-18T23:13:23Z, dockimbel, commented:
<https://github.com/red/red/issues/4854#issuecomment-802375034>

    The `/index` field in words is an offset to the corresponding entry in the context table. That index is [determined](https://github.com/red/red/blob/master/runtime/datatypes/context.reds#L254) when the word is bound (creation or rebinding) using a [lookup](https://github.com/red/red/blob/master/runtime/datatypes/context.reds#L16) in the context using the [attached hashtable](https://github.com/red/red/blob/master/runtime/datatypes/context.reds#L413). Once `/index` is set, it is used as an offset in the context table for direct and fast access.

--------------------------------------------------------------------------------

On 2021-03-19T09:19:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-802679496>

    But `bind` is using `find-word`:
    https://github.com/red/red/blob/7316b75f3454a13bbe9ec5f112b6bc53bdb96cbd/runtime/natives.reds#L1132
    And `find-word` passes the call to `get-ctx-symbol`:
    https://github.com/red/red/blob/7316b75f3454a13bbe9ec5f112b6bc53bdb96cbd/runtime/datatypes/context.reds#L22
    The latter works with integer symbol ids only:
    https://github.com/red/red/blob/7316b75f3454a13bbe9ec5f112b6bc53bdb96cbd/runtime/hashtable.reds#L1739
    https://github.com/red/red/blob/7316b75f3454a13bbe9ec5f112b6bc53bdb96cbd/runtime/hashtable.reds#L1749
    
    I don't see how murmur3 can be involved during bind :/

--------------------------------------------------------------------------------

On 2021-03-19T14:21:27Z, dockimbel, commented:
<https://github.com/red/red/issues/4854#issuecomment-802868652>

    > The latter works with integer symbol ids only:
    
    There's something odd there. I remember that @qtxie said he needed to use a loop in order to check the different spellings in the hashtable, but reading the code, it looks like a linear search in the hashtable, no hashing is done... @qtxie Could you please shed some light on how the index is looked up from the symbol ID?

--------------------------------------------------------------------------------

On 2021-03-19T14:25:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-802871435>

    He chooses the bucket as `hash and mask` (like I do `id % period`, but suitable for 2^N bucket count only), then linearly searches within the bucket until he finds the id.

--------------------------------------------------------------------------------

On 2021-03-20T01:43:16Z, qtxie, commented:
<https://github.com/red/red/issues/4854#issuecomment-803220057>

    For integer key, as our bucket size is `2^N`, we can just use `key and (2^N - 1)` to uniformly map it to the buckets. No special hash function is needed.
    
    Even we use a hash function, different integers may still map to the same bucket. Unless our bucket size is the same or larger than the largest symbol ID, then each symbol ID can be mapped to a unique bucket.

--------------------------------------------------------------------------------

On 2021-03-20T08:20:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-803270972>

    I agree with the choice for words. The purpose of the hashing function is to smash any distribution into uniform one (across any hash table size). But words are already uniform, so it's not needed. 
    
    For objects though, it's a bit wrong. As I can see, all node pointers are 32-bit aligned, so by using 2^N buckets, every 3 of 4 will remain empty, while 1/4 will have higher collision chance. I would change objects hash to `(node / 4)`.
    
    For `integer!`s we don't know at all how they will be distributed. What if I create a `hash!` with integers 1024, 2048, 3072, 4096 and so on? They will most likely land all to the same bucket, making lookups linear. I think we need murmur for `red-integer!` case.

--------------------------------------------------------------------------------

On 2021-03-20T09:06:12Z, qtxie, commented:
<https://github.com/red/red/issues/4854#issuecomment-803276026>

    @hiiamboris Thanks. I agree with your proposal for hashing objects and integers. I'm not sure if `murmur` is too heavy for integer!, maybe a simple [Fibonacci Hashing](https://probablydance.com/2018/06/16/fibonacci-hashing-the-optimization-that-the-world-forgot-or-a-better-alternative-to-integer-modulo/) is enough.

--------------------------------------------------------------------------------

On 2021-03-20T10:42:11Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-803288558>

    Good read. Thank you. Should be enough I think, until someone creates a `hash!` with fibonacci numbers only ;)

--------------------------------------------------------------------------------

On 2021-03-20T23:02:49Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-803475816>

    @qtxie turns out fibonacci hashing has other problems than just inability to memoize fibonacci sequence elements: https://stackoverflow.com/questions/664014/what-integer-hash-function-are-good-that-accepts-an-integer-hash-key/665545#665545 (see the comments too)
    And in the next answer hashing practicioners propose a different but simple enough implementation, and a link that gives even better solutions: https://github.com/skeeto/hash-prospector
    As a bonus this solution is reversible so we could get the integer back knowing only it's hash, although I don't know yet where we would use it, I think that this property may save us RAM in some cases.
    [Murmur3 finalizers](https://gist.github.com/zeux/25b490b07b4873efc08bd37c843777a4) are used for fast int32 hashing, but I see claims that they are a bit worse in quality than the solutions above.

--------------------------------------------------------------------------------

On 2021-03-20T23:10:02Z, qtxie, commented:
<https://github.com/red/red/issues/4854#issuecomment-803476455>

    Anyway, as it's not a perfect hashtable, you can always find a series of numbers map to the same slot for any hashing function.

--------------------------------------------------------------------------------

On 2021-03-23T08:35:59Z, qtxie, commented:
<https://github.com/red/red/issues/4854#issuecomment-804719736>

    @hiiamboris I added the code to use murmur3 finalizers for integers and pointers for now. It should be good enough. It's a baseline, once we have benchmarks we can test the functions in hash-prospector. Anyway, it's not related to this issue.

--------------------------------------------------------------------------------

On 2022-02-22T10:14:11Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-1047635122>

    @dockimbel any chance of this getting solved soon so I can start porting [`apply`](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/new-apply.red) to R/S?

--------------------------------------------------------------------------------

On 2022-02-23T17:06:44Z, dockimbel, commented:
<https://github.com/red/red/issues/4854#issuecomment-1049006661>

    @hiiamboris 
    
    1. It's a big and complex refactoring work. I'll put it back on my short-term todo-list.
    2. I don't think you need such fix if you work at R/S level, where you should be able to workaround it.
    3. Why convert such high-level and complex `apply` version to R/S? You won't get much speed improvement from that and the resulting code will be really big.
    4. I'll add my comment about your `apply` proposal asap, before it really goes in a wrong direction. ;-)

--------------------------------------------------------------------------------

On 2022-02-23T17:36:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-1049036155>

    How is it complex? Why big code?
    Anyway, I need this solved because whatever you do with this issue will most likely require a rewrite of `apply` implementation, so I'd like to write it once, not twice :)
    
    Also, ideally we need O(1) resolution of symbols into refinement and argument indexes. E.g. given source function context and target function value, to be able to set all target parameters from source context in one go. I don't think current O(n) will be significant, but if it's possible to optimize it, that would be great.

--------------------------------------------------------------------------------

On 2022-02-25T18:38:13Z, dockimbel, commented:
<https://github.com/red/red/issues/4854#issuecomment-1051099670>

    > How is it complex? Why big code?
    
    The `apply` mezz-level implementation you've pointed at above directly translated to R/S will be big and complex, by the Red runtime code standard.

--------------------------------------------------------------------------------

On 2022-02-25T18:41:32Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-1051101857>

    Any reason why it will be complex?

--------------------------------------------------------------------------------

On 2022-02-25T18:43:35Z, dockimbel, commented:
<https://github.com/red/red/issues/4854#issuecomment-1051103143>

    The code in Red is not easy to understand and follow for an average user, so I expect the R/S port (which will result in several times bigger code) to be even harder to follow.

--------------------------------------------------------------------------------

On 2022-02-25T18:50:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-1051107676>

    Ah, ok. Don't worry about it. I have Gregg and you to help me simplify it if I accidentally make it too complex :) And we'll profile it to be sure it's on the good side of performance.
    
    That Red code looks complex because trivial things in R/S require workarounds in Red, and also because it's written in imperative style with future porting to R/S in mind.

--------------------------------------------------------------------------------

On 2022-02-25T18:56:33Z, dockimbel, commented:
<https://github.com/red/red/issues/4854#issuecomment-1051111501>

    I still think the speed gain will be not be very significant compared to the compiled mezz version.
    
    Please wait until I publish my comments about `apply` before starting to make such port. 
    BTW, we are totally OT in this ticket.

--------------------------------------------------------------------------------

On 2022-02-25T19:05:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/4854#issuecomment-1051117618>

    I'm not starting before you give it a green light. 
    I've opened https://github.com/greggirwin/red-hof/issues/1 for design discussion to not derail this issue further. Most important is if you have comments on the interface. Implementation is temporary anyway, to be able to test it.

