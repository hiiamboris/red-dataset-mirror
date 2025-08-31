
#941: REDUCE not ordering left-to-right
================================================================================
Issue is open, was reported by hostilefork and has 26 comment(s).
[status.built] [type.review] [test.written] [type.design]
<https://github.com/red/red/issues/941>

The Rebol 3 Guide says:

> In general, expressions are evaluated from left to right; however, within each expression evaluation occurs from right to left.

If you write the following in Red:

```
foo: function [a b] [
    c: 10
    d: 20
    return [print "Hello" c print "Cruel" d print "World"]
] 
reduce foo 1 2
```

You'll not get any print output, and you instead get:

```
*** Error: undefined context for word 'c
```

I would have expected it to print "Hello" before the error. For this case Rebol doesn't print anything either, which is weird to me also.

On the other hand, if you write the following in Red:

```
foo: function [a b] [c: 10 d: 20 return [c d]] 
reduce foo 1 2
```

You get this error:

```
*** Error: undefined context for word 'd
```

In Rebol it says **undefined context for word 'c**, which is what I would expect.

It seems REDUCE should run left to right, and report the first error it comes to in that evaluation.  If there is a pre-pass to check that all words are bound, that pre-pass should likely also run left-to-right.  But this would have implications for those who have left-to-right expectations in terms of exception handling.



Comments:
--------------------------------------------------------------------------------

On 2014-09-23T14:26:37Z, dockimbel, commented:
<https://github.com/red/red/issues/941#issuecomment-56527708>

    What happens it that the last printed line gets "eaten" by the error message, so you don't see it. Try with your first example by putting two PRINT calls before `c`. I don't know why we have this, but I suspect  an issue with libC's internal printing buffers not get flushed in time.

--------------------------------------------------------------------------------

On 2014-09-23T14:40:32Z, hostilefork, commented:
<https://github.com/red/red/issues/941#issuecomment-56529994>

    Hmm.  Weird.  But:
    
    ```
    foo: function [] [c: 10 d: 20 e: 30 return [c d e]] 
    reduce foo
    ```
    
    That gives you:
    
    ```
    *** Error: undefined context for word 'd
    ```
    
    How could that be an issue with libc print?  Even if it ate the first line of output before an error...shouldn't the program have stopped and not tried to evaluate 'd?

--------------------------------------------------------------------------------

On 2014-09-26T22:17:00Z, hostilefork, commented:
<https://github.com/red/red/issues/941#issuecomment-57027675>

    This is happening because the infix checking is erroring out.
    
    The interpreter is looking at the "next" symbol to see if it suggests infix handling or not.  An undefined symbol cannot be successfully tested, and so you get an error on that before it has looked at the current element.
    
    Some questions arise about the moment of infix testing.  Consider this code:
    
    ```
    >> (a: :+ 1) a 2
    ```
    
    In Red that currently returns 2.  In Rebol that returns 3, which makes more sense.  This suggests that you shouldn't be doing the testing of whether the next element evaluates as infix until _after_ resolving the current term.
    
    So all tied in with the same issue...nothing to do with flushing streams in this case.  [CHECK_INFIX](https://github.com/red/red/blob/b0755de29e8e24fd3fcee3d231960ab2827d1296/runtime/interpreter.reds#L13) is the culprit.  It seems to be called twice: [here](https://github.com/red/red/blob/b0755de29e8e24fd3fcee3d231960ab2827d1296/runtime/interpreter.reds#L348) and [here](https://github.com/red/red/blob/b0755de29e8e24fd3fcee3d231960ab2827d1296/runtime/interpreter.reds#L666)

--------------------------------------------------------------------------------

On 2014-09-27T05:56:38Z, dockimbel, commented:
<https://github.com/red/red/issues/941#issuecomment-57043551>

    Thanks for the deep analysis. I will see if the checking can let the left operand be evaluated first (needs to be done both for the interpreter and compiler, in order to keep them consistent). I will work on this during the "ticket processing" stage before doing the release (so once `objects` branch will be merged into `master`).

--------------------------------------------------------------------------------

On 2014-09-28T14:27:12Z, hostilefork, commented:
<https://github.com/red/red/issues/941#issuecomment-57087094>

    I've reflected on this a little more and am wondering if it really should be an error instead of having either Rebol or Red's behavior.  Consider a non-erroring case because `c` is unset here (not without a context):
    
    ```
    foo: func [bar] [
        print bar
        c: :+
        1000
    ]
    foo 10 + 20 c 30
    ```
    
    If `c` were infix at the outset of this expression, then it would have been called on 20 and 30. Since it isn't, we call `foo` with 30 (10 + 20). During the course of running foo, `c` becomes infix. We either accept that and give back 1030, or raise an error.
    
    There is a lot of dynamism in the evaluator such that you want to lock down what function FOO is at the time of invocation and operate on that value...such that if some parameter changes what FOO is that suddenly your previous arity evaluation isn't off.  But you can't lock down `c` like that.  It needs to be evaluated when it is taking "its turn".
    
    What I'm uncomfortable about is that if this isn't considered an error, then the _precedence itself_ is shifting in mid-evaluation.  That's dodgy.  It might be a better answer to make a note of whether it was infix, see if it changes during the course of the evaluation...and if it does then throw an error and say you can't do that because it breaks the consistency of precedence.

--------------------------------------------------------------------------------

On 2014-11-30T22:21:19Z, memophen, commented:
<https://github.com/red/red/issues/941#issuecomment-65003081>

    Sorry for this comment arriving so late. I read this issue just a few minutes ago, and I still want to react to hostilefork's remarks of Sep 28. Big chance that nobody will read this anymore...
    
    Rebol or Red seem to be forgiving when just exploring the script for the extent of a function argument by not issuing an error when it finds an unset word, but just concluding that the function argument simply ends there: as long as there's at least something that can be successfully evaluated, everything is okay. Makes sense (if there is a problem ahead with an unset word, it's not the function's business). What happens next is a logical consequence of how functions are evaluated: the specification block first and subsequently the body block.
    
    The first _foo_ call line includes this three steps:
    1. The spec block of _foo_ tries to get a value for _bar_. The evaluation stops at _c_ being unset, so **bar: 10 + 20** giving **30**.
    2. The body block of _foo_ is executed, so **30** is printed, **c: :+** and **1000** is returned.
    3. The entire 'call plus what's left' expression evaluates to **1000 + 30** giving **1030** (that is in Rebol; in Red it evaluates to three values, **1000**, **make op! [...]** and **30** respectively, which doesn't make up a single expression).
    
    A second identical line would go like this:
    1. The spec block of _foo_ finds **bar: 10 + 20 + 30** this time, giving **60**.
    2. The body block of _foo_ prints **60**, sets again **c: :+** and returns **1000**.
    3. The function has eaten all rebvals, so the outcome of the line is simply **1000**.
    
    Not quite what I would expect when programming in Visual Basic, but I know Rebol is a bit more dynamic and I am not surprised at all. It's really straightforward. No need for a 'is someone changing the scenery?' police.
    
    The only alternative I see, is _not_ being so tolerant when fetching function arguments. Then the first round would end in a script error in step 1 simply because _c_ isn't set at that moment. That would be a logical solution too, be it to the detriment of Rebol's dynamic nature.

--------------------------------------------------------------------------------

On 2014-12-01T00:00:59Z, hostilefork, commented:
<https://github.com/red/red/issues/941#issuecomment-65006745>

    Still reading, although admittedly a bit distant in terms of having things drawing my attention more than this
    
    One remark is that a parallel issue was considered a closed case by @BrianH here as "not a bug":
    
    http://curecode.org/rebol3/ticket.rsp?id=2173
    
    Sometimes I fee like the people who get irate at disproving perpetual motion machines, and they get grumpy and say _"the burden of proof is on YOU to prove your machine is perpetual"_.  I feel I've identified a hole in the system which is about typing and infix, and when that judgment is made.  And that judgment is made in a moment, and can change during an evaluation which may affect the infixness of the evaluation...
    
    So to me, the burden is to prove how these conditions and tests work within the system.  I'm always a fan of the edge cases, not the common ones.

--------------------------------------------------------------------------------

On 2014-12-01T10:42:38Z, memophen, commented:
<https://github.com/red/red/issues/941#issuecomment-65047189>

    Despite my claim that it's all so logical, I have to admit my mental model needs a revision. Did so today in [red-lang group](https://groups.google.com/forum/#!topic/red-lang/fBFcgty3Ox4). Hope you can find it amidst the other posts.

--------------------------------------------------------------------------------

On 2020-07-18T19:08:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/941#issuecomment-660527527>

    Related to https://github.com/red/red/issues/4458 

--------------------------------------------------------------------------------

On 2020-07-18T20:01:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/941#issuecomment-660534655>

    Currently `foo 10 + 20 c 30` evaluating to `1030` doesn't work because `(foo 10 + 20) c 30` doesn't work:
    ```
    >> (foo 10 + 20) c 30
    30
    *** Script Error: c operator is missing an argument
    *** Where: catch
    *** Stack:  
    ```
    To me it looks like some stack problem we can and should fix.
    E.g. it works with ops:
    ```
    >> c: 1
    >> a: make op! func [x y] [c: :* x + y]
    >> 2 a 3 c 4
    == 20
    ```
    (2 + 3 * 4 = 20)
    
    There is another problem though. It looks like current interpreter looks up `c` twice - 1st time to determine the end of expression, second time during evaluation. I wonder how much performance this costs for the whole interpreter? To support an esoteric edge case?

--------------------------------------------------------------------------------

On 2022-08-29T11:36:42Z, dockimbel, commented:
<https://github.com/red/red/issues/941#issuecomment-1230166769>

    > E.g. it works with ops:
    
    The fact that it works in your expression above is not related to op! usage, but because the left operand is an expression with multiple values vs a single-value operand. That triggers a different code path for processing chained infix expressions, which makes your above code work. See:
    ```
    c: 1
    a: make op! func [x y] [c: :* x + y]
    (2 a 3) c 4
    ```
    still errors out:
    ```
    *** Script Error: c operator is missing an argument
    *** Where: catch
    *** Near : c 4
    *** Stack:  
    ```

--------------------------------------------------------------------------------

On 2023-11-29T16:28:06Z, dockimbel, commented:
<https://github.com/red/red/issues/941#issuecomment-1832275293>

    Seems to work as expected now (since the rewrite of the infix handling in the interpreter a few months ago):
    ```
    foo: function [a b] [
          c: 10
          d: 20
          return [print "Hello" c print "Cruel" d print "World"]
     ] 
    ```
    gives:
    ```
    >> reduce foo 1 2
    Hello
    *** Script Error: context for c is not available
    *** Where: either
    *** Near : return [print "Hello" c print "Cruel" d ]
    *** Stack:  
    ```
    And:
    ```
    foo: function [a b] [c: 10 d: 20 return [c d]] 
    ```
    gives:
    ```
    >> reduce foo 1 2
    *** Script Error: context for c is not available
    *** Where: reduce
    *** Near : return [c d]
    *** Stack: 
    ```

--------------------------------------------------------------------------------

On 2023-11-29T16:40:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/941#issuecomment-1832307537>

    What about mid-evaluation precedence change case? We okay with that?

