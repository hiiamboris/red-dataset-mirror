
#972: iterating word not local to foreach
================================================================================
Issue is closed, was reported by WiseGenius and has 28 comment(s).
[status.deferred] [type.review]
<https://github.com/red/red/issues/972>

Consider the following code:

```
foreach i [1 2 3] [
    prin i
    prin " "
    foreach i [4 5 6] [
        prin i
    ]
    prin " "
    print i
]
```

Both Rebol 2 and Rebol 3 give:

```
1 456 1
2 456 2
3 456 3
```

(They have the same behaviour when using `for i 1 3 1`, etc.)

When both interpreted and compiled, Red gives:

```
1 456 6
2 456 6
3 456 6
```

Is this difference from Rebol desired?



Comments:
--------------------------------------------------------------------------------

On 2014-11-02T17:35:46Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/972#issuecomment-61415487>

    I think it was chosen to be more efficient.

--------------------------------------------------------------------------------

On 2014-11-15T14:09:11Z, iArnold, commented:
<https://github.com/red/red/issues/972#issuecomment-63173532>

    Repeat has a similar difference:
    repeat i 3 [
       prin i
        prin " "
        repeat i 3 [
            prin i
        ]
        prin " "
        print i
    ]
    gives
    1 123 3
    2 123 3
    3 123 3
    Versus both Rebols:
    1 123 1
    2 123 2
    3 123 3

--------------------------------------------------------------------------------

On 2016-05-10T15:35:42Z, dockimbel, commented:
<https://github.com/red/red/issues/972#issuecomment-218196380>

    In Red, iterators do not create any local context, as such feature is very expensive in terms of memory resources and performances. In Rebol, the body block is re-bound to the local context on each call, depending on the body block size and depth, this can significantly affect the performances.
    
    That said, Red could maybe implement a light versio of the iterator context for Red, but this needs further studies and experimentation.

--------------------------------------------------------------------------------

On 2020-06-28T19:59:58Z, 9214, commented:
<https://github.com/red/red/issues/972#issuecomment-650814221>

    That was an interesting one to track down:
    ```red
    thing: deep-reactor [model: ["AB" "CD"] view: is [foreach entry model [none]]]
    ; around 50 LOC between ↑ and ↓
    entry: thing/model/1
    entry/1: #"X"
    ; whoopsies
    entry/2: #"Y"
    thing/model ; expected ["XY" "CD"]
    ```
    
    Not a bug per-se, but an argument in favor of iterator's words having a local context. OTOH I recall the cases where having them exposed into a global context was handy, particularly when you need to know the last value that was iterated over.

--------------------------------------------------------------------------------

On 2020-06-28T20:14:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/972#issuecomment-650815807>

    Another argument would be custom loops. `function` contains special cases for `repeat` and `foreach`, but every time one creates own loop construct, one has to be very careful not to leak it's words out (leads to very hard to find bugs).
    
    If there was an agreement that all Red loops should keep their words local, one could just follow it by creating a temporary context and binding iterator words to it.
    
    Last value can be brought out by `break/return` or explicit `last-x: x` when such need exists (sometimes).

--------------------------------------------------------------------------------

On 2020-07-09T18:13:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/972#issuecomment-656276009>

    One point of confusion in this idea is `forall`.
    
    If it follows the other loops and makes it's argument local to it's body, there's a win: no risk of not resetting the head to it's original state by mistake/bug.
    
    However, `forall s [uses s...]` both reads original `s` and has it's own local `s` inside the body, so we have 2 different `s` words here, which is a gotcha for everyone.
    
    Though I never saw `forall` as a good design anyway. Extended `foreach` may replace it and also play nicely with local words: `foreach [s: ...] s [uses s...]` - from this construct, if we agree to local words, we would naturally expect to use the value of original `s` and also set it's body-local spec words to intermediate values, without affecting the original.

--------------------------------------------------------------------------------

On 2021-05-31T13:03:10Z, hiiamboris, commented:
<https://github.com/red/red/issues/972#issuecomment-851476989>

    Some notes from @dockimbel :
    > \[rationale for current design is\] Cost of rebinding (or even deep copying) the loop body each time the loop is initiated. The reason is possible sharing of code blocks within the loop body with other contexts.
    \
    IIRC, R3 did some changes in the loop context implementation towards more correct behavior, by doing the rebinding. Though, someone would need to confirm that in the R3 source code, as I can't clearly remember.
    \
    So it can be worth reconsidering that design decision if the rebinding cost can be kept non-significant. One step in that direction in Red is the systematic use of hashtables for context symbols lookup since last year, lowering the cost of binding quite a lot.
    \
    Another drawback of that approach is that loops used only once or a few times will keep their context forever, they'll never be GCed as long as that code is referenced somewhere in memory.
    \
    Also note that you would lose then the ability to access the loop words after exiting, which is quite convenient sometimes, to retrieve the values used in last iteration on a premature exit.
    \
    There are pros/cons either way, so adding inner contexts is not clear win. There are many aspects to consider. If it makes it easier for end users, that's a strong incentive (unless the need is just because of users habits/familiarities with other languages).

--------------------------------------------------------------------------------

On 2022-05-09T17:06:23Z, hiiamboris, commented:
<https://github.com/red/red/issues/972#issuecomment-1121355069>

    Another case against loop-local words:
    
    <img src=https://i.gyazo.com/254b2121979d47971f720a8458efdaab.png width=400></img>
    `adjust-radius` is a block that modifies some of the words used by two different loops. If I was using `foreach` with local words, I would be unable to reference these words from that block.

--------------------------------------------------------------------------------

On 2022-05-09T20:46:36Z, greggirwin, commented:
<https://github.com/red/red/issues/972#issuecomment-1121565650>

    > [rationale for current design is] Cost of rebinding (or even deep copying) the loop body each time the loop is initiated. The reason is possible sharing of code blocks within the loop body with other contexts.
    
    Does "initiated" here mean "initialized" or "iterated"? If it's on initialization, only inner loops are a concern. If it's on iteration, large loops are the concern. Key here is _possible_ sharing of code blocks. Not the common case, but not _entirely_ unheard of. Loop bodies are trickier to share than other things, and maybe best avoided in any case. Use templates, generate them, etc. Rare cases will get a lot of leverage, but I can only think of a few times I've done that. This is where functions come in. They hide those details so you're not inlining a bunch of loops and optimizing the wrong things.
    
    Most important here is hard numbers. Quick hacking says we're 3x slower than R2, which I think we knew. e.g. ~0.2s for 1M loops here. How does that compare to Python/Ruby/JS/Swift? 
    
    > Another drawback of that approach is that loops used only once or a few times will keep their context forever, they'll never be GCed as long as that code is referenced somewhere in memory.
    
    It seems like this will be a very small hit in the grand scheme of things. ~1K of these dead loops will hold ~260K of memory. Seems big to us, but in the future there could be a special GC aspect to clean them up if desired. Just means they'd be reinitialized if called again. 
    
    > Also note that you would lose then the ability to access the loop words after exiting, which is quite convenient sometimes, to retrieve the values used in last iteration on a premature exit.
    
    Keyword here is _sometimes_. As @hi noted:
    
    > Last value can be brought out by break/return or explicit last-x: x when such need exists.
    
    That's an edge case, not the common one by far.
    
    We want user friendliness. But we can trade that off if our design is defensible. If it's our rationale is "to support edge cases performance suffers for all loops, which leads to bugs and surprises for users." that's not great. We can _tell_ people not to use the same iterator words, but the bigger problem comes when assembling code written by others. If we have bugs and surprises there, it's a killer.

--------------------------------------------------------------------------------

On 2022-05-10T00:18:32Z, WiseGenius, commented:
<https://github.com/red/red/issues/972#issuecomment-1121707264>

    Is it worth `foreach`, `for`, `repeat`, etc. each having a refinement (eg. `local`) so that the desired behaviour can be chosen depending on the use case?

--------------------------------------------------------------------------------

On 2022-05-10T17:15:42Z, greggirwin, commented:
<https://github.com/red/red/issues/972#issuecomment-1122662822>

    @WiseGenius I don't think so.

--------------------------------------------------------------------------------

On 2022-11-09T12:50:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/972#issuecomment-1308703488>

    There's a huge drawback in loops localizing their spec words: if I'm adding some code to the loop body, but spec words are not under my control (as is the case in sift/locate designs), there's a risk that words I'm using (if, any, result, etc) will be rebound to spec words and that will break my loop code. To workaround I will have to create an ugly named function (so it's unlikely to appear in user-provided spec) and put all my code into it.

--------------------------------------------------------------------------------

On 2022-11-09T18:01:44Z, greggirwin, commented:
<https://github.com/red/red/issues/972#issuecomment-1309146972>

    @hiiamboris that's giving up friendliness (and protection) in the common case for advanced cases. For those advanced cases, there are workarounds. `Foreach` is a very commonly used loop construct, and we want it to be as easy to understand and use as possible.

--------------------------------------------------------------------------------

On 2023-01-08T17:09:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/972#issuecomment-1374883076>

    Another gotcha in this case: if spec is only known at loop run time, function cannot know:
    ```
    >> f: function [] [spec: [x] foreach (spec) []]
    == func [/local spec][spec: [x] foreach (spec) []]     ;) `x` is global
    ```
    I suppose it can't be used as an argument for either choice, since we may both forget to list word in locals manually, or we may actually desire the global (or any other context) word to be set. Not making the word local is more permissive here though.

