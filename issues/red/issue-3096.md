
#3096: WISH: Single pass react triggering
================================================================================
Issue is closed, was reported by ul and has 24 comment(s).
[status.deferred] [type.wish]
<https://github.com/red/red/issues/3096>

### Expected behavior

I expect that chain of interdependent "cells" will propagate only once on source change.

### Actual behavior

Reactive graph leaves are triggered with intermediate values.

### Steps to reproduce the problem

```
>> trace: func [label x][print [label ":" x] x]
== func [label x][print [label ":" x] x]
>> graph: make reactor! [a: 1 b: 2 c: is [a + b] d: is [trace "d" (a + c)] e: is [trace "e" (c + d)]]
d : 4
e : 7
== make object! [
    a: 1
    b: 2
    c: 3
    d: 4
    e: 7
]
>> graph/a: 5
e : 11
d : 12
d : 12
e : 19
== 5
>> 
```
### Red version and build date, operating system with version.

Red 0.6.3 on MacOS 10.13.1



Comments:
--------------------------------------------------------------------------------

On 2017-11-03T21:12:17Z, greggirwin, commented:
<https://github.com/red/red/issues/3096#issuecomment-341828404>

    @ul, the reactive docs say "Reactions are run asynchronously, when a source field’s value is changed." and, in an example, "Each time the x or y values change, total is immediately updated.". So it looks like single triggering is not part of the design right now. Cycles are prevented however.
    
    It's possible this could be changed, but maybe add "WISH:" to the subject title, and change the text to indicate that it's not a bug, but a design change request.

--------------------------------------------------------------------------------

On 2017-11-03T21:16:19Z, ul, commented:
<https://github.com/red/red/issues/3096#issuecomment-341829337>

    @greggirwin Thanks for explanation! I updated issue title.

--------------------------------------------------------------------------------

On 2017-11-03T21:46:52Z, greggirwin, commented:
<https://github.com/red/red/issues/3096#issuecomment-341835335>

    Excellent! Thanks for pointing this out. It will surely come up again and we can use your example as a reference.

--------------------------------------------------------------------------------

On 2017-11-03T21:49:51Z, greggirwin, commented:
<https://github.com/red/red/issues/3096#issuecomment-341835862>

    The entire reactive system is ~300 lines, so you could even poke around in there and see how it might work. The current system, e.g. GUI reactivity, is all based on the current behavior, so we need to make sure that doesn't break. The code is in https://github.com/red/red/blob/master/environment/reactivity.red.

--------------------------------------------------------------------------------

On 2017-11-03T21:58:17Z, ul, commented:
<https://github.com/red/red/issues/3096#issuecomment-341837468>

    It's my second day of Red, so I definitely need to learn more before making changes with confidence =) In Clojure glitch-free implementation takes also about 300 loc https://github.com/ul/carbon.rx/blob/master/src/carbon/rx.cljc (it's >300 to support both Clojure and ClojureScript; single platform implementation is about 250 loc https://github.com/ul/carbon.rx/blob/d35f9935b8075609b8313fa4dfc57cb8de5a5856/src/carbon/rx.cljs)

--------------------------------------------------------------------------------

On 2017-11-03T22:30:48Z, greggirwin, commented:
<https://github.com/red/red/issues/3096#issuecomment-341843013>

    <he he> Diving into reactivity on day 2...go go go!
    
    Thanks for the links.

--------------------------------------------------------------------------------

On 2017-11-06T11:46:04Z, dockimbel, commented:
<https://github.com/red/red/issues/3096#issuecomment-342125418>

    The reactive engine is about 80 LOC starting from [here](https://github.com/red/red/blob/master/environment/reactivity.red#L49), the rest is just the user API for creating and managing reactions. For avoiding several triggerings of the same reaction during chain reactions, a more sophisticated algorithm is required. Though, that does not change the end result, it is just an optimization (though, very desirable in case of complex graphs).
    
    I will give it a quick look now to see if there is a cheap way to achieve it using the current implementation or if it requires a new implementation (in that latter case, it will be postponed).

--------------------------------------------------------------------------------

On 2017-11-08T07:06:09Z, dockimbel, commented:
<https://github.com/red/red/issues/3096#issuecomment-342729198>

    After having a deeper look into the current reactive engine inner working, the multiple-triggering is mandatory, as the dependency graph of reactive nodes never exists in memory as a data-structure, it is constructed and walked on, one branch at a time during chain reactions. Each new branch results from a node triggering. If the nodes are triggered only once, then it will not propagate on all possible branches, resulting in a wrong final state. The current approach does not require the user to explicitly define sources and targets using a specific API, sources are inferred from the reaction code, and targets are implicit (they will trigger a new reaction if the target themselves are reactive). It is a flexible and very simple way to build a reactive graph, though optimizations can then hardly be achieved. 
    
    Your above case is a special case where all the reactions have a single and clearly defined target (created using `is`), so for such case, it should be possible to do a in-depth graph construction on first node activation, then having multiple passes to optimize the triggering. Though, that is a special case, most reactions are defined using `react` function and in such case, accurately identifying all the targets ahead of time is not possible (as generic Red/Rebol code cannot be statically analyzed).
    
    A different reactive engine could be built though, relying on a explicit graph, in addition to the default simple one, for more sophisticated or more complex use-cases. This would be low-priority for now for the Red team, though contributions for that, in form of external libraries are more than welcome.

--------------------------------------------------------------------------------

On 2019-09-11T16:41:36Z, dockimbel, commented:
<https://github.com/red/red/issues/3096#issuecomment-530463904>

    @hiiamboris 
    
    1) Since your changes in the reactive engine, the triggering changed too, I now get:
    ```
    >> graph/a: 5
    e : 11
    d : 12
    e : 19
    d : 12
    e : 19
    == 5
    ```
    Can you check if this is the expected propagation?
    
    2) You might be interested in prototyping an alternative version of the reactive framework with single pass triggering (using an explicit graph instead of just a relations table).
    
    I will close this ticket, as we don't have in the core team the resources until 1.0 to work on an alternative engine.

--------------------------------------------------------------------------------

On 2019-09-11T18:23:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/3096#issuecomment-530504713>

    @dockimbel
    1. Using the `graph: make reactor! [a: 1 b: 2 c: is [trace "c" (a + b)] d: is [trace "d" (a + c)] e: is [trace "e" (c + d)]]` code I'm getting:
    ```
    c : 7
    e : 11
    d : 12
    e : 19
    d : 12
    e : 19
    ```
    I can confirm this is by design:
    Relations are: `a -> c`, `a -> d`, `c -> d`, `c -> e`, `d -> e`.
    Combined:
    ```
    a -> c -> d -> e
         c -> e
    a -> d -> e
    ```
    The outer reactivity loop triggered by a change in `a` cycles forward thru relations: `a -> c` then `a -> d`. While newly queued (as a result of a reaction) relations work like a LIFO stack, so `c -> e` appearing after `c -> d` will be executed first (this way I can use the queue as a history of previously triggered reactions and avoid deadlocks). So we get `a -> c -> e; c -> d -> e; a -> d -> e` order which we see in the result as `c e d e d e`.
    
    2. Yes I thought about that too. I'll mark it on my roadmap then. The obvious issue, as you've stated, will be that sources to reactions will have to be declared explicitly. Although that opens up yet another variant: a fully synchronous reactivity system. IIRC @moliad has a WIP of something like that so let's first wait and see what he will present.

--------------------------------------------------------------------------------

On 2019-09-11T19:13:57Z, dockimbel, commented:
<https://github.com/red/red/issues/3096#issuecomment-530524547>

    @hiiamboris The current reactive framework allows us to put all the sources in a block as the first element of the reaction block, so they can be identified in a deterministic way. A different way could be to use some specific datatype for annotating the sources within the reaction block.

--------------------------------------------------------------------------------

On 2019-09-11T20:05:28Z, hiiamboris, commented:
<https://github.com/red/red/issues/3096#issuecomment-530543791>

    @dockimbel Right. Sorry for messy wording :)
    I meant those reactive sources that are changed by reactive code (and become reactive targets). Consider the code `react [f src/x]`. It has a source we know from static code analysis. But what targets `f` will change? And if I add another relation `react [f src2/y]`, maybe `f` will have a branch that decides what to change based on the value it receives. Thus best we can do is execute a relation and track at runtime which targets it affects. And that may depend on the input (data or user actions). So we can't build the graph beforehand, but only from those relations that have been already executed (and then again, their code might not have been 100% covered yet). Then how can we make it in a single pass?
    
    The only way out I see is to declare reactive targets before triggering a reaction. And if something gets modified unexpectedly (without a proper declaration) we can deal with it by ignoring the change or issuing a warning.
    
    The problems I foresee is that:
    - reactive code becomes more verbose and harder to maintain
    - runtime graph population and optimization (at the time of each reaction execution) may slow the whole system down so much that it'll be not worth using it
    
    Let me know if I'm getting it wrong :)

