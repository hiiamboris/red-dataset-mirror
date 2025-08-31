
#47: WISH: `local` keyword in VID for actors and reactions
================================================================================
Issue is open, was reported by hiiamboris and has 8 comment(s).
<https://github.com/red/REP/issues/47>

### The problem.

Often when writing small Red scripts I find a need to **use some intermediary values** inside VID **actors** or **reactions**.

Problem is, all **set-words become global** and I've encountered a few times a situation like this:
`face1 on-something [x: 1 ... face2/text: "A" ... use-somehow x ...]`
`face2 react [x: 2 ... face/text ...]`
In this scenario an actor sets `x` to some value and uses it later. However a reaction kicks in in the middle and sets the same global `x` to some other value. A **bug** like this produces results so unpredictable that hunting it is a **challenge**.

Another scenario is when an actor calls a function that shows another window, where again, `x` is used for something and becomes invalid upon return.

So naturally I would like to declare some actors/reactions with a **`function`** constructor, but VID currently does not support that directly.

### Workarounds.

**... for actors** are either to declare the actor fully in the **`with` facet**:
`face with [actors: object [on-something: function [x] [...]]]`
or to make a global actor and use a **get-word syntax** to refer to it inside VID.

Needless to say both options aren't very expressive.

R2 has had the support of **function constructors** inside the `layout`, but since the argument list is pretty much known, it's not the apex of expressiveness either.

**For reactions** the workaround is even messier. `react` always defines it's words as global, so one has to either link the face to itself as
`face with [react/link function [face _] [...actual code...] [face face]]`
or reconstruct the function at runtime again and again:
`face react [do reduce [function [] [...]]]`

**Macros** are a way I'm using, but they are only convenient outside of the console and have some **other quirks** that do not make them a better option.

### Solution.

To stop myself and others from fighting the language, I'd like to see a **`local` keyword** that can be added **after the `on-...` or `react`** keywords and just **before the code** block:
`on-change local [x: 1 ...]`
`react local [x: 2 ...]`
For the **default actor**, `local [...]` construct may be supported... or not, doesn't matter much to me.

An **alternative** is to make all set-words local by default, but this will:
1) hurt some really tiny scripts that hold all their words as global
2) prevent one from manually binding all actors set-words to the face (I have an experiment like this that binds all (not just set-) words - it works great for me so far - and this REP is written with the experience of using both approaches at once)

So I'm opposed to this alternative.

### Bonus.

There is a beneficial effect that this change brings to the code. While writing reactions that span multiple lines I often prefer to list all the reactive sources above the actual code:
```
react [
   x: some-parent-object/some-inner-object/some-source-word
   ;) there can be a lot of these sources
   ... here goes the code that uses x ...
]
```
This spares me repeating the usually long paths and lets me immediately tell what the reactive sources are (which are otherwise hard to find among the other paths - object functions calls for example).
Adding `local` to this construct allows one to do this trick without the risk of messing the leaked words.


Comments:
--------------------------------------------------------------------------------

On 2019-04-08T20:24:54Z, 9214, commented:
<https://github.com/red/REP/issues/47#issuecomment-480993523>

    Call me crazy, but another (rather exotic) option would be for `[...]` to denote "all global" and `(...)` "all local" when used as actor's bodies.
    
    It's also worth noting that proposed solution (I mean `local` keyword) is an all-or-nothing one, and doesn't provide enough granularity — what if I want _some_ words to be local and _some_ to be exposed?  

--------------------------------------------------------------------------------

On 2019-04-08T20:38:23Z, hiiamboris, commented:
<https://github.com/red/REP/issues/47#issuecomment-480998427>

    @9214 `(...)` won't work gracefully along `compose`.
    
    As for some/some problem, I agree. Nothing is perfect ☻ I'm just documenting what worked for me and letting you guys consider and criticize it. Maybe you'll find a better solution ;)
    
    I find in my experience that the need to externalize some words is easily worked around by prepending their object name. What I do find useful is to stop `react` from adding some paths to the reaction sources list, but it's a whole another topic...

--------------------------------------------------------------------------------

On 2019-04-12T17:22:35Z, meijeru, commented:
<https://github.com/red/REP/issues/47#issuecomment-482655398>

    If memory serves, Rebol had a standard local called `var` in each actor. That may not be enough...

--------------------------------------------------------------------------------

On 2019-05-15T08:33:57Z, rebolek, commented:
<https://github.com/red/REP/issues/47#issuecomment-492560597>

    @meijeru it may be enough, if you set it to `object!` that will hold all your local vars.

