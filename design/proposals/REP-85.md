
#85: WISH: new semantics for ANY and ALL natives.
================================================================================
Issue is open, was reported by 9214 and has 20 comment(s).
<https://github.com/red/REP/issues/85>

`any` and `all` are [short-circuit evaluation](https://en.wikipedia.org/wiki/Short-circuit_evaluation) primitives with well-defined semantics:

* `any` evaluates expressions one-by-one and returns the first logically True value, if any, else the last logically False value; absence of expressions defaults to logical False;
* `all` evaluates expressions one-by-one and returns the first logically False value, if any, else the last logically True value; absence of expressions defaults to logical True.

Red follows the same semantics, with an exception of default values:

```red
>> all []
== none
>> any []
== none
```

By contrast, in other languages (inexhaustive list):

**Rebol2 & Rebol3:**
```rebol
>> all []
== true
>> any []
== none
```

**Scheme:**
```racket
> (and)
#t
> (or)
#f  
```

**Common Lisp:**
```common-lisp
> (and)
T
> (or)
NIL
```

**R:**
```r
> all()
[1] TRUE
> any()
[1] FALSE
```

**J:**
```j
   *./>a:
1
   +./>a:
0
```

**Julia:**
```julia
> all([])
true
> any([])
false
```

**Python:**
```python
> all([])
True
> any([])
False
```

**Javascript:**
```javascript
> [].every(function(){})
true
> [].some(function(){})
false
```

I propose that Red should follow the same behavior as listed above.

---

In Red, truthy values are all values except for `logic!` `false` and `none`. In other words, `any` and `all` return the truthy value as-is, without coercing it to `logic!` `true`:
```red
>> all [1]
== 1
>> any [1]
== 1
```

By contrast, falsy values (i.e. `false` and `none`) are always coerced to `none`:
```red
>> all [false]
== none
>> any [false]
== none
```

This might be considered an inconsistency, and so I additionally propose that `any` and `all` should not coerce falsy values to `none`, but rather return them as-is.

The partially implemented proof-of-concept for this wish can be found in https://github.com/red/red/pull/4484.


Comments:
--------------------------------------------------------------------------------

On 2020-10-09T20:49:30Z, greggirwin, commented:
<https://github.com/red/REP/issues/85#issuecomment-706396371>

    @9214 there was a previous discussion on this, but not in the ref'd tickets, wasn't there? The comparison to other langs stands out clearly in my mind, but I can't find the other chat at the moment.

--------------------------------------------------------------------------------

On 2020-10-09T21:00:12Z, 9214, commented:
<https://github.com/red/REP/issues/85#issuecomment-706400210>

    @greggirwin yes: https://github.com/red/red/issues/4469 and perhaps https://github.com/red/red/issues/4482 are related.

--------------------------------------------------------------------------------

On 2021-06-30T11:54:00Z, hiiamboris, commented:
<https://github.com/red/REP/issues/85#issuecomment-871337971>

    > This might be considered an inconsistency, and so I additionally propose that any and all should not coerce falsy values to none, but rather return them as-is.
    
    An argument against keeping `false` is this is a breaking change. Someone might rely on failure results being always `none`. I might as well. Will be hard to find all such cases in code.

--------------------------------------------------------------------------------

On 2021-06-30T14:05:04Z, hiiamboris, commented:
<https://github.com/red/REP/issues/85#issuecomment-871435013>

    In support of this proposal as a whole, here's another way to think of it.
    
    We have in Red a different logical syntax, used in Parse: `[rule1 | rule2 rule3 | ...]`. I was implementing a similar thing for my sift/locate experiment to reduce nesting level and increase readability, and ofc at some point I've come to deal with empty expressions.
    
    Here's how Parse-like rule can be rewritten in basic Red:\
    `a b | c |` -> `any [all [a b] all [c] all []]`
    
    Note that we consider empty rule a success: `[rule |]` is the same as `opt rule` and `[]` and `[|]` always succeed. So naturally, to ease programmatic construction of any/all decision trees and for consistency with how we think of Parse rules, we should **let `all []` be a truthy expression**.
    
    However, let's look at it in more detail...
    
    Suppose I have this skeleton tree: `any [all []]`. And I've constructed an empty expression I want to add into `all`.
    I can:
    - add it as is (tree does not get modified, but I need to infer expression arity if I'm generally going this way)
    - wrap it into parens (resulting in `any [all [ () ]]`)
    - `do` it and add the result (getting `any [all [ unset ]]`).
    
    In the 1st case I get `true` as the result, in the others - `unset`.
    Obviously my tree becomes sensitive to this special case and I need to think how to handle that, which adds complexity to my code and my coding routine.
    
    So I would alter the original proposal, **letting `all []`** be symmetric with `()` and `do []` and **return `unset`**. Which is still truthy and aligns with it's logic, just simplifies code construction.
    

--------------------------------------------------------------------------------

On 2021-06-30T16:18:14Z, greggirwin, commented:
<https://github.com/red/REP/issues/85#issuecomment-871542638>

    Good alternate view @hiiamboris. :+1:

--------------------------------------------------------------------------------

On 2021-06-30T16:37:55Z, greggirwin, commented:
<https://github.com/red/REP/issues/85#issuecomment-871560862>

    A question this raises is should `[rule |]` be the same as `opt rule`. It's a dangling alternate, which should be a bug. It's an incomplete expression. In this sense it's like an empty `all` block. We choose to allow these, but from the past chat on this, I don't think we had any kind of consensus, from pure logic or philosophical standpoints about the results. We can look deeper into those views, or take the most pragmatic, consistent stance.
    
    Pragmatically, empty blocks for `any/all` are mistakes if written manually. They have no clear meaning. So the only real application for them is as skeletons for generated code. Reducing the propagation of unset values is a good goal, but generated code is a different story in a sense, where we want as much leverage as possible. The problem is that those extra leaking unsets may end up in results humans have to deal with.

--------------------------------------------------------------------------------

On 2021-06-30T20:51:25Z, hiiamboris, commented:
<https://github.com/red/REP/issues/85#issuecomment-871718838>

    > A question this raises is should `[rule |]` be the same as `opt rule`
    
    It results from empty rule being always a success (in `[rule |]` empty rule is to the right). Why empty rule should succeed? I'd draw an analogy with mathematical zero: adding zero to any other value we get the same value. Thus, adding empty rule to any rule we should get the same rule. 
    
    And empty rule translated from Parse syntax into Red syntax is `any [all []]` so this construct should be truthy as a whole. And that is satisfied by truthy `all []`.
    
    Also *pragmatically* I can say that least complex is the system that has least number of special cases. System is a set of rules. Every exception is a rule as well. Knowing every rule you still have to consider how every rule affects every other rule, resulting in `n!` cognitive load. Yes ;) This is also why I hate path syntax on files and `find typeset!`, but that's another topic...
    
    Since there's no clear meaning for `any []`/`all []` choice I say we should choose the least complex solution, which this REP presents well. Right now `none = all []` stands as an exception from the otherwise solid ruleset we take for granted in Parse ☺
    
    As for unset propagation, yes, thought about that before, and still presented the above solution as my choice. Though tiny impact of this `true` vs `unset` result makes it unlikely worth discussing it.

--------------------------------------------------------------------------------

On 2021-07-01T10:24:41Z, toomasv, commented:
<https://github.com/red/REP/issues/85#issuecomment-872119754>

    > A question this raises is should `[rule |]` be the same as `opt rule`
    
    Another consideration why empty rule should be truthy: 
    Parse rules can be considered as guards before actions, as in e.g. `['a (print "a") | 'b (print "b")]`.
    When we add action without rule, it should be evaluated if parse reaches it, e.g. `['a (print "a") | (print "nothing")]`.
    Latter case may be considered as action without guard, which should be the default action when all previous ones fail.
    Like `case [a [print "a"] true [print "nothing"]]`.
    If there is no default action, missing rule represents just empty default case (which for `case` and `switch` evaluates to `unset!`)

--------------------------------------------------------------------------------

On 2021-07-01T13:02:11Z, Oldes, commented:
<https://github.com/red/REP/issues/85#issuecomment-872227388>

    @9214 regarding yours...
    
    > falsy values (i.e. false and none) are always coerced to none:
    ```
    >> all [false]
    == none
    >> any [false]
    == none
    ```
    is the mentioned inconsistency change worth the slow down? I mean... `none` is faster to check than `logic!`, because with logic you must test also it's value, while `none` is always false. 

--------------------------------------------------------------------------------

On 2024-01-21T21:17:47Z, Oldes, commented:
<https://github.com/red/REP/issues/85#issuecomment-1902766330>

    These are results which I would probably expect finally (unset values ignored in `any` and `all`):
    ```rebol
    any []     ;== none
    any [()]   ;== none
    any [() 1] ;== 1
    all [() 1] ;== 1
    all [1 ()] ;== 1
    all []     ;== #[unset!] - consistent with: do []
    all [()]   ;== #[unset!] - consistent with: do [()]
    ```

