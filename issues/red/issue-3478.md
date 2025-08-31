
#3478: non-idiomatic behavior of `parse` failure rules
================================================================================
Issue is open, was reported by hiiamboris and has 44 comment(s).
[type.design]
<https://github.com/red/red/issues/3478>

### Expected behavior
Rules in question: FAIL, BREAK, REJECT
I'll quote all the sources on parse I could find:

http://www.rebol.com/r3/docs/concepts/parsing-summary.html
> fail  -  force current rule to fail, *backtrack*

> break -  break out of a match loop (such as **any, some, while**), always indicating *success*.

> reject -  similar to break: break out of a match loop (such as **any, some, while**), but indicate *failure*.

https://en.wikibooks.org/wiki/REBOL_Programming/Language_Features/Parse/Parse_expressions
> fail (a nonterminal that always fails) - idiom: [end skip]

> `reject` - new keyword for R3 parse, stops the matching loop and indicates failure of loop matching

https://www.red-lang.org/2013/11/041-introducing-parse.html
> fail : force current rule to fail and backtrack.

> break : break out of a matching loop, returning success.

> reject :  break out of a matching loop, returning failure.



I find it important that match loop is produced by only 3 keywords, not just any block encountered. Otherwise break/reject won't make much sense and often won't allow to leave the loop, since the rules inside the loop usually contain many blocks, and blocks are most often used to provide a group of alternatives.

Taking the description into account, the following output is expected:
```
; fail should backtrack - triggering the next alternative after `|`, once per token (1, 2)
>> parse [1 2] [any [fail | (print "A") skip] (print "B") | (print "C")]
A
A
B
== true

; same here, `[fail]` is a failed rule
>> parse [1 2] [any [[fail] | (print "A") skip] (print "B") | (print "C")]
A
A
B
== true

; break should get out of "any", triggering B
>> parse [1 2] [any [break | (print "A") skip] (print "B") | (print "C")]
B
== false

; same, break should get out of: any, some, while
>> parse [1 2] [any [[break] | (print "A") skip] (print "B") | (print "C")]
B
== false

; reject should get out of "any", but since "any" accepts zero successful matches - goes into B
; *** EDIT *** disregard the previous statement; if reject is supposed to put *failure* in place of `any`, "B" should not be reached, "C" should be
>> parse [1 2] [any [reject | (print "A") skip] (print "B") | (print "C")]
B
; *** EDIT ***  -- should be C
== false

; same, reject should get out of: any, some, while
>> parse [1 2] [any [[reject] | (print "A") skip] (print "B") | (print "C")]
B
; *** EDIT *** -- same as above, should be C
== false

; "some" should not accept zero successful matches, backtracking to C
>> parse [1 2] [some [reject | (print "A") skip] (print "B") | (print "C")]
C
== false

; same
>> parse [1 2] [some [[reject] | (print "A") skip] (print "B") | (print "C")]
C
== false
```

### Actual behavior
```
; wrong
>> parse [1 2] [any [fail | (print "A") skip] (print "B") | (print "C")]
B
== false

; correct
>> parse [1 2] [any [[fail] | (print "A") skip] (print "B") | (print "C")]
A
A
B
== true

; correct
>> parse [1 2] [any [break | (print "A") skip] (print "B") | (print "C")]
B
== false

; correct
>> parse [1 2] [any [[break] | (print "A") skip] (print "B") | (print "C")]
B
== false

; correct
; *** EDIT *** wrong, should be C
>> parse [1 2] [any [reject | (print "A") skip] (print "B") | (print "C")]
B
== false

; wrong
>> parse [1 2] [any [[reject] | (print "A") skip] (print "B") | (print "C")]
A
B
== false

; correct
>> parse [1 2] [some [reject | (print "A") skip] (print "B") | (print "C")]
C
== false

; wrong
>> parse [1 2] [some [[reject] | (print "A") skip] (print "B") | (print "C")]
A
B
== false
```

To summarize: `break` is idiomatic (better than in R3 (and R2?)), `fail`/`reject` are not, and as such are pretty useless.

### Steps to reproduce the problem
The test:
```
parse [1 2] [any [fail | (print "A") skip] (print "B") | (print "C")]
parse [1 2] [any [[fail] | (print "A") skip] (print "B") | (print "C")]
parse [1 2] [any [break | (print "A") skip] (print "B") | (print "C")]
parse [1 2] [any [[break] | (print "A") skip] (print "B") | (print "C")]
parse [1 2] [any [reject | (print "A") skip] (print "B") | (print "C")]
parse [1 2] [any [[reject] | (print "A") skip] (print "B") | (print "C")]
parse [1 2] [some [reject | (print "A") skip] (print "B") | (print "C")]
parse [1 2] [some [[reject] | (print "A") skip] (print "B") | (print "C")]
```
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 779 date: 5-Jul-2018/15:38:08 commit: #963ec55a6bab860f8b259246f794bde6ea0172be ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-07-19T13:05:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/3478#issuecomment-406269350>

    Note also https://github.com/revault/rebol-wiki/wiki/Parse-Project#break-only-from-loops
    I totally support the argument:
    > Right now you can't put a BREAK in a nested block or a referred-to rule. This limits its usefulness by quite a bit. It would be helpful if PARSE's BREAK acted like the BREAK function and escaped from the closest loop, no matter how far it is nested in grouping blocks. 
    
    Which for some reason was rejected there. Probably laziness. But then everyone will have to implement this on their own, effectively crippling `parse` power.

--------------------------------------------------------------------------------

On 2018-07-19T15:28:19Z, 9214, commented:
<https://github.com/red/red/issues/3478#issuecomment-406317317>

    ## TL;DR 
    At least one of us doesn't understand what he's talking about. Regardless of @hiiamboris changes in the initial ticket, my arguments below still hold.
    
    ---
    ## 1
    ```red
    ; wrong
    >> parse [1 2] [any [fail | (print "A") skip] (print "B") | (print "C")]
    B
    == false
    ```
    **Actually this one is correct.**
    * `any` repeats a given rule _zero_ or more times, returning success.
    * `fail` forces `[fail | (print "A") skip]` rule to fail and backtrack (but there're no alternate rules to backtrack), i.e. it matched *zero* times, ergo top-level `any` returns success and paren expression is triggered.
    * But in the process no input was consumed, hense `parse` bails out with `false`.
    ```red
    >> parse [abracadabra][any ["ANY matches this rule ZERO times and returns success"] (print "see?")]
    see?
    == false
    ```
    
    If you'd use `some`, the logic would be different:
    ```red
    >> parse [1 2][some [fail | (print "A") skip] (print "B") | (print "C")]
    C
    == false
    ````
    * `fail` forces `[fail | (print "A") skip] ` to fail.
    * `some` should match a given rule *at least once* to return success. But because of `fail` it matched *zero* times, and return failure, backtracking to `(print "C")`. Again, no input consumed, `parse` is upset and returns `false`.
    
    ## 2
    ```red
    ; correct
    >> parse [1 2] [any [[fail] | (print "A") skip] (print "B") | (print "C")]
    A
    A
    B
    == true
    ```
    * `fail` forces `[fail]` to fail and backtrack to `(print "A") skip`. `skip` eats one token, advancing the input.
    * because of `any`, `[[fail] | (print "A") skip]` rule is repeated more than zero times until the input is exhausted by `skip`. After that, `any` returns success and paren expression is triggered. Input is exhausted, we are at the `end`, ergo `parse` returns `true`.
    
    ## 3
    ```red
    ; correct
    >> parse [1 2] [any [break | (print "A") skip] (print "B") | (print "C")]
    B
    == false
    ```
    _Assuming "matching loop" means `any`, `some`, or `while`._
    
    * `break` forces `any` to return success, paren expression is triggered, no input was consumed, hense `parse` returns `false`, end of story.
    ## 4
    ```red
    ; correct
    >> parse [1 2] [any [[break] | (print "A") skip] (print "B") | (print "C")]
    B
    == false
    ```
    Same as in **3**.
    
    ## 5
    ```red
    ; correct
    >> parse [1 2] [any [reject | (print "A") skip] (print "B") | (print "C")]
    B
    == false
    ```
    * `reject` breaks `any` and forces `[reject | (print "A") skip]` to fail, but `any` already matched given rule *zero* times, hence `"B"` is printed. The rest is the same.
    
    ## 6
    ```red
    ; wrong
    >> parse [1 2] [any [[reject] | (print "A") skip] (print "B") | (print "C")]
    A
    B
    == false
    ```
    **Nope, it's correct.**
    * `reject` forces `[reject]` to fail, because of that we're backtracking to `(print "A") skip`. `skip` consumes a token.  
    * But `reject` also broke `any` (matching loop), which stops to advance the input. But because `any` matched a given rule *more than zero* times, it returns success and triggers a paren expression. No more rules left, input cannot advance, we've stucked at `[2]` input, `parse` returns `false`.
    
    ## 7
    ```red
    ; correct
    >> parse [1 2] [some [reject | (print "A") skip] (print "B") | (print "C")]
    C
    == false
    ```
    * `reject` breaks `some`, which haven't even consumed anything and returns failure, backtracking to `(print "C")`.
    
    ## 8
    ```red
    ; wrong
    >> parse [1 2] [some [[reject] | (print "A") skip] (print "B") | (print "C")]
    A
    B
    == false
    ```
    **And this one is correct too.**
    
    * `reject` fails `[reject]` and backtracks to `(print "A") skip`, but also breaks `some`. However, `skip` consumes one token from the input, making `some` to return success and to trigger a paren expression. 
    * The rest is the same as in  **6**.
    ---
    | Term | Explanation |
    |:------:|:-------------:|
    | matching loop | any of the `any`, `some` or `while` constructs |
    | to backtrack | to reset the input index and use the next alternate rule (if any) |
    | current rule | block where a given keyword resides |
    
    | Keyword | Explanation |
    |:----------:|:-------------:|
    | `none` | returns success without consuming the input ("catch-all rule") |
    | `fail` | fails current rule and backtracks |
    | `break` | breaks matching loop + makes current rule to act like `none` |
    | `reject` | breaks matching loop + acts like `fail` |
    
    Everything looks idiomatic and flexible enough to close this ticket.

--------------------------------------------------------------------------------

On 2018-07-19T21:10:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/3478#issuecomment-406415376>

    @9214 Great answer! Together with you we can disassemble the whole thing to bits and pieces ☺
    
    But let me first make a few statements that I'm sure we all can agree on:
    1. Our common aim is to simplify our tools
    2. Simpler rules are easier to follow and design and reason about
    3. If rules can be easily "executed" by us in our minds then they will be less prone to bugs and save us a lot of headache in the end
    
    This ticket is a direct consequence of these statements as I'll try to show. So don't be so quick to defend the current implementation and try thinking in terms of "what design will better serve us, Reducers".
    
    I'm glad we agree on most of the examples :)
    Let's discuss on the questionable ones.
    
    ## 1
    
    > `>> parse [1 2] [any [fail | (print "A") skip] (print "B") | (print "C")]`
    
    This is the most interesting example I think.
    Let's talk about the *rule* term. What is a rule? How I see it:
    `"a"` is a rule
    `"a" "b"` is a rule
    `2 "a"` is a rule too
    `if` is not a rule
    `if (condition)` is a rule
    `any` is not a rule, but a predicate
    `any "a"` is a rule
    `any ["a" | "b"]` is a single rule
    `["a" | "b"]` is a single rule again, but:
    `"a" | "b"` is not a rule but two rules
    
    This simply makes sense, but is also supported by some documentation and by our knowledge of parse token precedence rules. For example ( https://www.red-lang.org/2013/11/041-introducing-parse.html ): 
    > ahead *rule*  :  look-ahead rule, match the rule, but do not advance input.
    
    How parse treats `ahead "a" | "b"` expression? It composes the *rule* "a" with the predicate *ahead* into a new rule `ahead "a"` and then another `"b"` rule, result being equivalent to `[[ahead "a"] | "b"]`. Right?
    
    I'll also quote https://en.wikibooks.org/wiki/REBOL_Programming/Language_Features/Parse/Parse_expressions#Parse_idioms again. `fail` has 2 idioms, more or less equivalent:
    - `some "a" "a"` which fails because some consumes all "a"-s
    - and `end skip` which fails because `skip` after `end` is hopeless
    
    Let's transform my example using `end skip` idiom:
    `parse [1 2] [any [fail | (print "A") skip] (print "B") | (print "C")]` into:
    `parse [1 2] [any [end skip | (print "A") skip] (print "B") | (print "C")]`
    How do you suppose this will work? Even if `end` succeeds, `skip` fails, then alt-rule `(print "A") skip` is used. Correct?
    
    From `fail` definition: *"force current rule to fail and backtrack"*
    - current rule is `fail` including any thing before it (like `"a" fail`)
    - it should fail (do not advance any more) and backtrack (backtracking point is `|` as we know)
    
    Actually I'm having a very hard time imagining any real world use cases for both `none` and `fail`. Maybe it's meant mainly for parse rule generators or something. If you have anything on your mind, let's discuss it. Where is it used and how?
    It is not unlikely that the issue might be of poor documentation of `fail` intent. But documented as it is I expect it to work as I state in the ticket.
    Also, if we allow `fail` to break `any` it will be same as `reject` of R3 and thus what was the point of having 2 keywords for the same goal in R3? It makes no sense, yes?.
    
    ## 6
    
    > `>> parse [1 2] [any [[reject] | (print "A") skip] (print "B") | (print "C")]`
    
    It is everywhere in the docs that `break` and `reject` are documented as equivalents save for their return value. Double check if you don't believe me.
    
    So it makes sense that if `break` gets from any number of sub-rules and immediately finishes the any/some/while loop, then `reject` should do the same. Right?
    
    Honestly, I don't get your idea of how `reject` is supposedly works. It "breaks" the loop but somehow works like "hey, let's just stay for a little longer and see if there's any more extra rules we can do for free"? :D
    It's like if I had this code:
    ```
    forever [
      break/return none
      print "hmm what is there else in this loop's body..."
      print "just a glance..."
    ]
    ```
    and it actually printed the string before returning? I don't see how that's useful or transparent or easy to reason about. Not to mention it's totally different from what `break` does.
    
    Apparently in R3 it was considered too much of a headache to implement a stack of loop positions to support `break` from nested rules inside `any/some/while` and `break` became simply useless in those cases. Else what would be the point of `break`-ing from a simple group of alt-rules? `["a" | break | "b"]`? What? :)
    
    I attribute the current behavior to the fact that in R3 `break` didn't get out of the subrules, so did reject. I imagine it was obvious to a lot of people that the most common use of `[]` is to group a few alternatives, and the current `parse` implementation made `break`/`reject` very hard to use, so they sought to improve the situation. That's probably why we have `[while [[[break]]] ]` actually getting out of the loop. `reject` seemingly escaped this destiny, but since the mechanisms are already there, it shouldn't be hard to fix. In this sense `reject`, `[reject]`, `[[reject]]` and so on, should be all equivalent.
    
    ## 8
    
    > `>> parse [1 2] [some [[reject] | (print "A") skip] (print "B") | (print "C")]`
    
    In addition to the 6, let's again look at the documentation:
    > break	: break out of a matching loop, returning success.
    > reject	: break out of a matching loop, returning failure.
    
    Matching loop is `some` here instead of `any`. I think *success* means that the rule may be continued, like `some [char! opt if (something) break] (print "A")` should output "A":
    - `break` forces `some` to return success
    - the FSM continues on `success` and goes into `(print "A")`
    
    But if the description states that `reject` returns *failure* it should return *failure*. To return *failure* from the loop means to me that the whole rule containing that loop should fail - and thus *backtrack*:
    - `break` forces `some` to return failure
    - the FSM detects a failed rule (the loop) and backtracks, looking for an alt-rule or failing a parent rule
    
    Otherwise what's the difference of returning success or failure? I could replace `reject` with `break if (false)` or `break fail` and do not bother with introducing a new keyword. What's the point? More rarely used keywords = more complexity.
    
    Thanks to your insight now I almost understand how it prints "A". It fails the rule, but marks the loop to stop after the current iteration. But is it supposed to be like this? Why `[reject]` is different from `reject`? Why is this not clarified in the docs? And do we really want it to behave so cryptically?
    
    So again :) Think of how it *should* work so as not to shoot yourself in the foot at every step! Am I making sense? ☻
    
    
    

--------------------------------------------------------------------------------

On 2018-07-19T22:01:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/3478#issuecomment-406428136>

    Also note: R3 follows it's own documentation of `reject`, returning *failure* from *the loop*:
    ```
    >> parse [1 2] [any [reject | (print "A") skip] (print "B") | (print "C")]
    C
    == false
    ```
    So I might have been to quick to mark test 5 as "correct", while it outputs "B". If `reject` makes the loop (`any`) return failure, it shouldn't reach "B" in the first place.

--------------------------------------------------------------------------------

On 2018-07-19T22:58:37Z, 9214, commented:
<https://github.com/red/red/issues/3478#issuecomment-406439319>

    Moved [here](https://www.reddit.com/r/redlang/comments/90amsj/parse_failure_rules_fail_break_reject/). And if you came here to make proposals instead of pointing out actual bugs (by "actual" I mean those confirmed by core developers), then [REP](https://github.com/red/REP/issues) is a better fit for this ticket.

--------------------------------------------------------------------------------

On 2018-07-20T17:39:54Z, giesse, commented:
<https://github.com/red/red/issues/3478#issuecomment-406674031>

    On a first glance, I agree with @hiiamboris initial observations. I'm not sure what @9214 is disagreeing with here - `fail` is supposed to be the same thing as `end skip` (in fact, it was introduced because everybody was using `end skip` to fail rules and that's not really readable).
    
    If I had to guess, the fact that `fail` doesn't work while `[fail]` does suggests that this is a simple bug.

--------------------------------------------------------------------------------

On 2018-07-20T18:45:55Z, 9214, commented:
<https://github.com/red/red/issues/3478#issuecomment-406693457>

    @giesse mmkay, then:
    * `[fail | b | c]` - useless, same as `[b | c]`;
    * `[a | fail | c]` - useless, same as `[a | c]`;
    * `[a | b | fail]` - useless, same as `[a | b]`, and we already have the same behavior.
    
    That's the point? A change for the sake of change?

--------------------------------------------------------------------------------

On 2018-07-20T18:48:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/3478#issuecomment-406694344>

    A change in `fail` was apparently caused by a matter irrelevant (and was working as documented in the stable release): https://github.com/red/red/commit/e7f726f159d6073f0a488a34c6cf30c6eb675282#diff-1887889cb99ae2e2424362bd4bb1d136
    I think it just should raise an error when it encounters `to fail` or `thru fail`. These are "invalid" rules for a reason.
    
    @9214 won't `[a | b | fail]` be the same as `[a | b]` ?

--------------------------------------------------------------------------------

On 2018-07-20T19:02:22Z, giesse, commented:
<https://github.com/red/red/issues/3478#issuecomment-406698090>

    @9214 of course it's useless in those cases, that's not what it's for. Again, it's a more readable version of `end skip` as far as I know. Perhaps `reject` should do what you want, but then again I understand the concept of it being tied to the "nearest" loop like `break`. I don't think I've had the chance to use even `break` in practice, so I can't say too much about which one would be more useful.
    
    Do you have practical examples to point out as a reference?

--------------------------------------------------------------------------------

On 2018-07-20T19:34:47Z, 9214, commented:
<https://github.com/red/red/issues/3478#issuecomment-406705466>

    @giesse and what `end skip` is for then?
    
    Okay, going back to `break` and `reject`: 
    * `break` stops loop from iterating, without backtracking
        1. either because it itself returns success (as a keyword) 
        1. or because it makes the current rule block (or entire loop construct) to return success. 
    
    Either way it looks the same to me, so I don't see the point of any change (except for perfomance reasons).
    
    * `reject` stops loop from iterating further and 
        1. backtracks in case if it (as a keyword) evaluates to failure
        1. makes rule block to fail and backtrack
        1. forces entire loop construct to return failure and backtrack
    
    (3) is achievable with (2), (1) and (2) are interchangeable (`reject` keyword is the same as `[reject]` block, but the latter is more flexible). Hense I vote either for (2) to stay as it is now or for (1) to take its place. `reject` (1) looks nicer, and I can't really come up with a practical use-case for `reject` (2), excepts that it offers different levels of granularity for Parse rules.
    
    Loops itself are `any`, `some` and `while`, and apparently integer repetitions. 
    * I guess everyone will agree that with current `while` implementation the usage of either `fail`, `reject` or `break` is implied, and that it doesn't mattter how they behave, because `while` will always evaluate to success.
    * I would also argue that `any` should behave the same way as `while`, i.e. always evaluate to success, regardless of any `break`, `fail` or `reject` usage. Why? Because semantics of `any` states that it needs to consume **zero** tokens to return success. To rephrase, no matter what can possibly happen, `any` **always** consumes **at least zero** tokens, and is doomed for success as soon as Parse enters the loop. Hense, I see examined R3 behavior as a buggy one.
    * `some` is open for debate. Either we have nicely looking, but a bit limited `reject` (1), or flexible but occasionally ugly `reject` (2). Pros/cons were already listed.
    * Integer repititions, ideally, should mimick the constructs above.
    
    In my little experience, I've used some of this constructs (`reject` I believe) to experiment with error recovery and reporting in parsers. `fail` as an alias for `end skip` doesn't make any personal sense to me. Everyone seems to argee on `break`.

--------------------------------------------------------------------------------

On 2018-07-20T21:20:59Z, giesse, commented:
<https://github.com/red/red/issues/3478#issuecomment-406730027>

    @9214 to cause a rule to fail... If you search REBOL scripts you'll find plenty of examples. http://www.rebol.org/search.r?find=end+skip&form=yes
    
    I'm not sure that there is any point to `reject` if it can't force `any` to fail. I think that the focus on consuming input is misguided. The only issue with consuming no input at all is that it is an obvious infinite loop, but it doesn't necessarily mean a success or a failure. But, I would be quick to change my mind if I was shown real examples. At the time I was writing tons of `parse` code `reject` and `break` didn't exist.

--------------------------------------------------------------------------------

On 2018-07-21T08:51:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/3478#issuecomment-406781733>

    Regarding `fail` and `none`. I think if someone has any of these in a static block of parse rules, chances are he's doing something silly. I can just remove all `none`s from any rule without affecting it. Similarly I can remove all rules containing `fail` altogether (from the alternatives list I mean). There's a case though when these rules contain side effects: `a | (drop the bomb) fail | b` (test `a`, if it fails `drop the bomb` and test `b`), but then why not just rewrite it as `a | (drop the bomb) b`.
    
    "end skip" is easy to google for, and a quick look indicates that it was used in dynamic rule generators. Like if you have a huge rule and want to enable/disable some of the inner ones depending on a condition, say, refinement to you function.
    In Red I can define any of:
    ```
    success: [ none ]
    success: []
    success: [ () ]
    success: [ if (yes) ]
    failure: [ fail ]
    failure: [ not [] ]
    failure: [ not () ]
    failure: [ if (no) ]
    cond-rule: either (condition) [success][failure]
    ```
    and so on... then those instead of `none`/`fail`, and use `cond-rule` inside my block as a fork. And (hopefully) it will work all the same.
    
    But if fork is what I need, I also can write it directly as:
    ```
    flag: (condition)   ; evaluated into a logic!
    cond-rule: [if (flag)]
    ```
    and it will be even cleaner.
    
    I figure in R2 there was only `none` and there was [no `if` or `not`](http://www.rebol.com/docs/core23/rebolcore-15.html#section-10). So one was unable to express it in any of the above variants, which led to the appearance of `end skip` artifact.
    
    There may be some performance advantage of native `none`/`fail` over the alternatives I mentioned. To me it remains questionable though if this advantage is worth the effort of supporting these. In any case some tests should be added to prevent accidental changes in their behavior in the future.

--------------------------------------------------------------------------------

On 2018-07-21T09:59:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/3478#issuecomment-406784976>

    `break` investigation ☻ A funny one in fact...
    
    ```
    >> parse [1 2] [any [ [ break (print "A") | (print "A0") ] (print "A1") skip p: | (print "A2") ] (print "B") | (print "C")]
    A1
    B
    == false
    >> ? p
    P is a block! value.  length: 1 index: 2 [2]
    ```
    So it appears break currently:
    1. skips all the following rules and alternatives in the block where it appears ("A", "A0")
    2. yields true as the block result
    3. does not skip the rules that follow the block where break occurred ("A1")
    4. marks the loop for quit after the current iteration is finished (no further "A1" or "A2" printed)
    
    This is a very complex logic... let's investigate more.
    Does the loop succeed because break told it to, or because the rules inside it returned success?
    ```
    >> parse [1 2] [some [ [ break (print "A") | (print "A0") ] (print "A1") | (print "A2") ] (print "B") | (print "C")]
    A1
    B
    == false
    
    >> parse [1 2] [some [ [ break (print "A") | (print "A0") ] (print "A1") fail | (print "A2") ] (print "B") | (print "C")]
    A1
    C
    == false
    ```
    `some` succeeded only in the 1st case, supporting the claim that break does not directly affect the loop's return value.
    Even more unexpected though is that in the 2nd line, "A2" wasn't printed but "A1" was. I thought `fail` would backtrack the `break` rule and skip to "A2" but it didn't. Let's note it:
    5. `break` also skips the alternatives that follow the rule where appears a block inside which `break` occurred. OMG :) I can't barely spell this, not to mention keep it in my feeble mind. 
    
    Will it also skip the outer block alternatives?
    ```
    parse [1 2] [some [ (print "IN") [ [ break (print "A") | (print "A0") ] (print "A1") fail | (print "A2") ] | (print "A3") ] (print "B") | (print "C")]
    IN
    A1
    A3
    B
    == false
    ```
    No, it doesn't! (also the "IN" check tells us that `some` made only one attempt at it). Another note:
    6. The note (5) only applies to the block where the break-containing block resides, but not any further outer blocks.
    
    But it's not the end yet... does `break` have to be in a block to quit the nearest loop? Or it will skip to the outer loop?
    ```
    >> parse [1 2] [any [skip (print "IN") any break (print "A") | (print "B")] (print "C") | (print "D")]
    IN
    IN
    C
    == true
    ```
    Okay! it breaks the inner `any` even though it's not been provided a block to.
    
    ```
    >> parse [1 2] [any break (print "A") | (print "C")]
    == false
    >> parse [1 2] [any break | (print "C")]
    C
    == false
    ```
    .... can't explain this yet, sorry ):
    7. `break` might appear as argument to the loop without being bracketed. The result is undefined :)
    
    After all this, I swear if `break` continues to behave like this I'm not ever going to use it in my rules. Design constraints or not.
    But just imagine - how simple and predictable it would have been if it just worked like `break/return yes` of our usual code?

--------------------------------------------------------------------------------

On 2018-07-21T14:30:59Z, 9214, commented:
<https://github.com/red/red/issues/3478#issuecomment-406800318>

    > Regarding `fail` and `none`
    
    In my view, `none` is an equivalent of ε (empty string) rule from formal language theory, and as such can be used as a starting symbol for language generation:
    ```red
    >> get also 'x parse x: [][change none [in the beginning was the word]]
    == [in the beginning was the word]
    ```
    or for generation of context-free/sensitive grammars:
    ```red
    >> ; change B which left context is A and right context is C
    >> get also 'block parse block: [a b c][some ['a change ['b ahead 'c](quote x) | skip]]
    == [a x c]
    >> ; nope
    >> get also 'block parse block: [_ b c][some ['a change ['b ahead 'c](quote x) | skip]]
    == [_ b c]
    >> ; change B with C in the right context
    >> get also 'block parse block: [_ b c][some [none change ['b ahead 'c](quote x) | skip]]
    == [_ x c]
    >> ; change any B (context-free)
    >> get also 'block parse block: [c b c a a b c a c c][some [none change ['b ahead none](quote x) | skip]]
    == [c x c a a x c a c c]
    ```
    
    `fail` as it works now can be used for error recovery. `fail` as an "always failing terminal" doesn't make any sense to me, though, it can be a counterpart of `none`, which is plausible from design perspective.
    
    > I think if someone has any of these in a static block of parse rules, chances are he's doing something silly
    
    To rephrase in a less arrogant way: "I wouldn't use `none` and `fail` in my grammars".
    
    > So it appears `break` currently
    
    ... behaves exactly as I described in my very first response, but it seems that you don't want to listen.
    
    Quick recap:
    
    | Term | Explanation |
    |:------:|:-------------:|
    | matching loop | any of the `any`, `some` or `while` constructs |
    | to backtrack | to reset the input index and use the next alternate rule (if any) |
    | current rule | block where a given keyword resides |
    
    | Keyword | Explanation |
    |:----------:|:-------------:|
    | `none` | returns success without consuming the input ("catch-all rule") |
    | `fail` | fails current rule and backtracks |
    | `break` | breaks matching loop + makes current rule to act like `none` |
    | `reject` | breaks matching loop + acts like `fail` |
    
    ---
    
    # A
    
    ```red
    >> parse [1 2] [any [[break (print "A") | (print "A0")] (print "A1") skip p: | (print "A2")] (print "B") | (print "C")]
    A1
    B
    == false
    ```
    * `break` breaks matching loop and makes current rule (block where `break` keyword resides) to act like `none`
    * "current rule" is `[break (print "A") | (print "A0")]`, it returns success and triggers `(print "A1")`, continuing to `skip p:`
    * `skip` consumed a token, `p:` marked position, everything is great, and `any` finishes this iteration
    * however, loop is already broken, and `any [...]` returns success, triggering `(print "B")`
    * nothing else can be done, we are stuck at `[2]` position, `parse` returns `false.
    
    > This is a very complex logic...
    
    ... hense I should demand a PhD for figuring it out in 10 minutes yesterday, just by following a simple set of rules, or what? You absolutely love to throw emotionally colored words around when it comes to bashing existing design, don't you?
    
    # B
    
    ```red
    >> parse [1 2] [some [[break (print "A") | (print "A0")] (print "A1") fail | (print "A2") ] (print "B") | (print "C")]
    A1
    C
    == false
    ```
    
    * `break` makes `[break (print "A") | (print "A0")]` to return success, breaks `some`, triggers `(print "A1")`, continues to `fail`
    * `fail` makes current rule to fail and backtrack, current rule is `[break (print "A") | (print "A0")] (print "A1") fail | (print "A2")]`
    * `some` haven't consumed any tokens, because of that `(print "B")` isn't triggered, and we're backtracking to `(print "C")`
    * `parse`, as expected, returns `false`, because input wasn't advanced and there's nothing can be done
    
    > OMG :) I can't barely spell this, not to mention keep it in my feeble mind
    
    And whose problem is that?
    
    # C
    
    ```red
    >> parse [1 2] [some [(print "IN") [[break (print "A") | (print "A0")] (print "A1") fail | (print "A2")] | (print "A3")] (print "B") | (print "C")]
    IN
    A1
    A3
    B
    == false
    ```
    
    * `(print "IN")` is triggered as soon as `some` enters the loop
    * `break` breaks the loop and makes `[break (print "A") | (print "A0")]` to returns success, triggering `(print "A1")` and continuing to `fail`
    * `fail` makes `[[break (print "A") | (print "A0")] (print "A1") fail | (print "A2")]` to fail and backtrack
    * we're backtracking to `(print "A3")`, which is triggered. Empty alternate rule itself returns success (another subtle detail to brag about I presume?)
    * oddly enough (`some` should consume at least one token to return success), `some [...]` returns success and triggers `(print "B")`; empty alternate rule is another topic to muse over
    ```red
    >> parse [1 2][some [|] 2 integer!]
    == true
    ```
    
    # D
    
    ```red
    >> parse [1 2] [any [skip (print "IN") any break (print "A") | (print "B")] (print "C") | (print "D")]
    IN
    IN
    C
    == true
    ```
    
    * On entering `any`, `skip` immidiately eats one token and triggers `(print "IN")`
    * `break` does two things, as was already explained:
        * it breaks the closest loop
        * it makes current rule to behave like `none`
    * closest loop is `any`, current rule is `[skip (print "IN") any break (print "A") | (print "B")]`. `break` breaks `any` and forces `[skip (print "IN") any break (print "A") | (print "B")]` to return success, because of that iteration continues
    
    # E
    
    > .... can't explain this yet, sorry ):
    
    Oh, but I can, just by following the rules of the game:
    
    ```red
    >> parse [1 2] [any break (print "A") | (print "C")]
    == false
    ```
    
    * `break` breaks `any` and forces `[any break (print "A") | (print "C")]` to return success. No input were consumed, `parse` returns `false`.
    
    ```red
    >> parse [1 2] [any break () | (print "C")]
    == false
    >> parse [1 2] [any break | (print "C")]
    C
    == false
    ```
    
    And this one deviates.
    
    ---
    
    So, what do we have? Out of 7 examples, ~~only the last one looks like a deviation from examined rules. Remaining 6 are expected.~~ Sorry, 2 look like deviation: the last one and an "emtpy altern rule" case from **C**.
    
    @hiiamboris 
    * If you want to be a drama queen, issue tracker is not the right place for that. We have plenty of community platforms to satisfy your need for attention though.
    * if you want to report bugs confirmed by core developers - this issue tracker is the right place, but out of all your snipets only the last one looks suspicious, the rest is unsubstantiated "this a GRAVE DESIN FLAW, very bad, not hot, everyone who uses that is a silly person and should be deeply ashamed of himself, what a mess...". I don't see any tags confirming that it's a bug either.
    * if you don't want to report bugs confirmed by core developers, but want to propose a design change - this issue tracker is not the right place, but [REP](https://github.com/red/REP/issues) is, as I already said. We already generated enough material to create a well-organized ticket there.
    
    I don't plan to continue this discussion until language designers chime in, as we're just running in circles, lacking any concrete use-cases and schematas. 
    
    R3 and Red Parse engines have completely different implementations (the former relies on recursive calls, the latter is finite-state machine) and completely different sets of constrains. What can be implemented in one cannot be done in the other, and idiomatic behavior in R3 may be not directly translatable to Red. With shallow understanding of parsing theory and `parse` implementation, I don't view myself as the one who can push for any design change without supervision. And you?
    

--------------------------------------------------------------------------------

On 2018-07-21T15:17:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/3478#issuecomment-406803237>

    @9214 
    
    ```
    >> get also 'x parse x: [][change none [in the beginning was the word]]
    >> get also 'block parse block: [_ b c][some [none change ['b ahead 'c](quote x) | skip]]
    >> get also 'block parse block: [c b c a a b c a c c][some [none change ['b ahead none](quote x) | skip]]
    ```
    can be rewritten as:
    ```
    >> get also 'x parse x: [][insert [in the beginning was the word]]
    >> get also 'block parse block: [_ b c][some [change ['b ahead 'c](quote x) | skip]]
    >> get also 'block parse block: [c b c a a b c a c c][some [change ['b](quote x) | skip]]
    ```
    
    > B, C
    
    Right! I totally forgot that `fail` was broken and used it as if it wasn't :) Shame on me!
    > D, E
    
    Great thinking! It never occurred to me that what you call a "current rule" might also contain the loop itself.
    ```
    >> parse [1 2] [any [(print "IN") skip any break if (no)] ]
    IN
    IN
    == true
    >> parse [1 2] [any [(print "IN") skip [any break] if (no)] ]
    IN
    == false
    ```
    
    Go figure why this is happening though:
    ```
    >> parse [1 2] [any [(print "IN") skip any break end skip] ]
    IN
    == true
    >> parse [1 2] [any [(print "IN") skip any break [end skip]] ]
    IN
    IN
    == true
    ```

--------------------------------------------------------------------------------

On 2018-07-21T21:13:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/3478#issuecomment-406823879>

    @9214 You're not following the gitter so I'll brief you: @dockimbel said that `break`, `reject`, `fail` rules need more design work and the best we can help is reach a consensus. Hopefully more people will join as we're too few. And that `then` rule is flawed and a candidate for either removal or redesign.
    
    Regarding `then`. `a THEN b | c | d`
    The idiom was: [`[a (x: b) | (x: c)] x | d`](https://github.com/revault/rebol-wiki/wiki/Parse-Project#THEN)
    I conjured a script for testing: https://gist.github.com/hiiamboris/cb357a315e646044ef361f7109b9928c
    Script accounts for both input advancement and side effects.
    
    It can be shown that the current implementation does not follow the idiom:
    ```
    a b c d 	[input advanced by] [side effects produced by] ...
    n n n n 	impl> [] [a c d]        idiom> [] [a c d]
    n n n y 	impl> [d] [a c d]       idiom> [d] [a c d]
    n n y n 	impl> [c] [a c]         idiom> [c] [a c]
    n n y y 	impl> [c] [a c]         idiom> [c] [a c]
    n y n n 	impl> [] [a c d]        idiom> [] [a c d]
    n y n y 	impl> [d] [a c d]       idiom> [d] [a c d]
    n y y n 	impl> [c] [a c]         idiom> [c] [a c]
    n y y y 	impl> [c] [a c]         idiom> [c] [a c]
    y n n n 	impl> [] [a b c d]      idiom> [] [a b d]
    y n n y 	impl> [d] [a b c d]     idiom> [d] [a b d]
    y n y n 	impl> [c] [a b c]       idiom> [] [a b d]
    y n y y 	impl> [c] [a b c]       idiom> [d] [a b d]
    y y n n 	impl> [a b] [a b]       idiom> [a b] [a b]
    y y n y 	impl> [a b] [a b]       idiom> [a b] [a b]
    y y y n 	impl> [a b] [a b]       idiom> [a b] [a b]
    y y y y 	impl> [a b] [a b]       idiom> [a b] [a b]
    ```
    
    Same way it can also be shown that the currently `a then b | c | d` is the exact equivalent of `a b | c | d` thus `then` itself is useless.
    
    A few variants of *proper* expression I came up with.
    Total equivalents:
    ```
    [ (f: yes) a (f: no) b | if (f) c | d ]   ; requires a flag
    [ p: a [b | :p d |] | c | d ]   ; requires `d` duplication (and all the rules following d)
    ```
    
    Equivalents only if `a` does not produce a side effect:
    ```
    [ a b | not a c | d ]
    [ not a c | a b | d ]
    ```
    These also require `a` to be tested twice, depending on `a` they may be faster/slower than the idiom.
    
    In my opinion the idiom is way easier to follow than the `then` variant and the equivalents that I mentioned. These look clean to me though:
    `either a b c | d`
    `a then b else c | d`
    
    I would just remove the rule for good. In case someone really needs it he can write the idiom. If it is agreed that the rule is important, `either` variant ([also proposed here](https://github.com/revault/rebol-wiki/wiki/Parse-Project#EITHER)) looks way simpler and visually resembles the logic of Red `either` keyword, which helps both reading the rules and learning parse.

--------------------------------------------------------------------------------

On 2018-07-21T23:04:56Z, greggirwin, commented:
<https://github.com/red/red/issues/3478#issuecomment-406828933>

    There's a lot of great information and research here. As @giesse says, concrete examples are best. I don't have time to dig into it myself right now, but the examples and notes about behavior, which we can use to document the intended use of rules, and how they may be misapplied, as well as guidelines for their most effective use, are helpful.
    
    I'm also going to remind everyone to be civil. If you sense someone escalating things, take a breath and ignore the hyperbole. Focus on the technical aspects.

--------------------------------------------------------------------------------

On 2018-07-22T17:46:17Z, 9214, commented:
<https://github.com/red/red/issues/3478#issuecomment-406884362>

    Some ideas.
    
    # fail
    
    `fail` is either an always failing terminal or a keyword which makes rule block to fail and backtrack. Here I'm using the former semantics.
    
    # break
    
    `break` breaks the loop and returns success by itself (as a keyword). Expression is triggered according to loop semantics. Should trigger an error message when used outside the loop.
    
    # reject
    
    `reject` breaks the loop, alterns loop semantics and forces it to return failure and backtrack as a whole no matter what, thus bypassing any `paren!` expressions. `reject` itself returns success, just like `break`. Should trigger an error message when used outside the loop.
    
    ---
    
    I want to break a loop ASAP and trigger a paren expression:
    ```
    loop [break | altern | altern] (expression)
    ```
    
    I want to break a loop, to trigger an expression, but also would like to make a final sweep on altern rules:
    ```
    loop [break fail | altern | altern] (expression)
    ```
    
    I want to break a loop and don't want to trigger paren expression:
    ```
    loop [reject | altern | altern] (expression)
    ```
    
    I want to break a loop, don't want to trigger paren expression, and want to make a final sweep:
    ```
    loop [reject fail | altern | altern] (expression)
    ```
    
    ---
    
    I'm parsing something and I'd like to recover on error:
    ```
    some [token | reject] | recover
    ```
    That way we backtrack to the place where loop started to iterate in the first place, as opposed to
    ```
    some [token | recover]
    ```
    Where we backtrack to the place where malformed token is. 
    
    Or, say, I'm searching for a needle in the haystack, and don't want to waste resources once I've found it:
    ```
    parse haystack [some [needle break | skip]]
    ```
    It can be rewritten as:
    ```
    parse haystack [to needle to end]
    ```
    But assume that there's no `end` (maybe we're parsing continious stream of data).
    
    I'm emitting something, I'd like to recover on error, but if input is malformed I don't want to do anything with it, as it can be potentially dangerous:
    ```
    some [token | reject] (emit) | recover
    ```
    By canceling `some [...]` as a whole (with `reject`), we're effectively skipping `(emit)`, going straight to `recover`.
    
    But assume I want to trigger this expression (say, I want to investigate and report partially emitted output or something like that):
    ```
    some [token | ???] (emit) | recover
    ```
    Tricky. I want to trigger `(emit)` as if `some [...]` returned success, but then I want to backtrack to `recover` as if `some [...]` returned failure. If we'd altered `fail` semantics as "force rule block where `fail` resides to fail and backtrack", when this:
    ```
    some [token | break fail] (emit) | recover
    ```
    would work? Not sure though.
    

--------------------------------------------------------------------------------

On 2018-07-22T18:17:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/3478#issuecomment-406886234>

    @9214 I just love this proposition! **Dead simple and expressive**!
    I only didn't get what you mean that "reject alterns loop semantics" (if you could clarify?).
    
    One thing I'd wish to add to this model is a `now` keyword:
    ```
    while [
        many [
            rule [
                levels [
                    "and here I discovered I wanna stop the loop asap"
                    "so I write:"
                    break now
                    (and further rules)
                ] | (alternatives)
            ] (...)
        ] (everything should be skipped) 
    ]
    ```
    `break now` and `reject now` as ways for an *emergency* escape.
    
    P.S. `now` can probably be generalized as a command that jumps to the end of the loop iteration, thus independent from `break`/`reject` and then under a better name ofc (`continue`?). But I'm not sure if there will be a use for it apart from `break` & `reject`?

--------------------------------------------------------------------------------

On 2018-07-22T18:38:50Z, 9214, commented:
<https://github.com/red/red/issues/3478#issuecomment-406887489>

    @hiiamboris If `some` ate at least 1 token it returns success. `any` and `while` will return success regardless of input consumed. With `reject`, however, they all will return failure, no matter what.
    
    In my view, `reject` should cancel looping process as a whole ("this was a bad idea since the beginning"), while `break` is more fine-grained and should cancel particular iteration ("I've found what I was looking for" / "oh snap that's the wrong neighborhood"). `break` backtracks to the beginning of iteration, `reject` backtrack to the beginning of the loop.
    
    Your `reject now` ("what's it, I'm bailing out") and `break now` ("what's it, I'm bailing out, `(print "goodbye Iowa")`") sound interesting.
    
    Another question: should there be a keyword to restore a broken loop?

--------------------------------------------------------------------------------

On 2018-07-22T18:54:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/3478#issuecomment-406888466>

    > In my view, reject should cancel looping process as a whole ("this was a bad idea since the beginning"), while break is more fine grained and should cancel particular iteration ("I've found what I was looking for" / "oh snap that's the wrong neighborhood").
    
    Yes looks sane.
    
    > some [token | break fail] (emit) | recover
    
    This one case is probably not worth a native support. Just make a flag: 
    `(good: yes) some [token | break (good: no)] (emit) if (good) | recover`
    This way you get output in any case but backtrack if it's not desirable.
    
    An afterthought. `also` keyword has proven itself irreplaceable over and over. *If* there will be a demand for the rule above, why not reuse the `also`:
    `also a b`:
    - eval `a`
    - eval `b`, regardless of what `a` returned
    - discard the result of `b`, yield that of `a`
    
    Then the rule becomes:
    `also some [token | reject] (emit) | recover`

--------------------------------------------------------------------------------

On 2019-12-21T13:05:01Z, 9214, commented:
<https://github.com/red/red/issues/3478#issuecomment-568179820>

    It appears to me that `fail` and `reject` in Red are one and the same (except for #4193), so `fail` indeed is supposed to be an always failing keyword.
    
    `reject` as a term comes from [backtracking](https://en.wikipedia.org/wiki/Backtracking): if `block!` rule is a partial candidate, then `reject` simply says that it's not worth completing (matching) any further. "Loop breaking" is implied in this situation, since `reject` always forces enclosing block to fail, and all looping constructs in Parse stop if a rule has failed.
    
    `break`, on the other hand, is more interesting, because it always _succeeds_ but forces the loop to stop, even though e.g. `while` stop only if a rule has _failed_. Since `break` by itself is a match, it follows that in:
    ```red
    any / while / some / 1 / 2 [break]
    ```
    * `any` and `while` will succeed, because they don't really care if it matched or not.
    * `some` will succeed because `break` matched _once_ and that's enough;
    * Ditto for `1`;
    * But `2` will fail because `break` allowed only a single iteration.

