
#3755: The flaw of `error? try` approach
================================================================================
Issue is open, was reported by hiiamboris and has 52 comment(s).
[type.design]
<https://github.com/red/red/issues/3755>

**Describe the bug**

For a known piece of code it is totally normal to write `if error? try [some static code] [do something]`.
However there are situations where the code piece is not known to the caller of `try`:
```
>> attempt [make error! "x"]
== none                          ;-- attempt thought that the code failed
```
```
r: make reactor! [a: "abc" b: is [make error! a]]
>> r/a: "bcd"
*** User Error: "bcd"
*** Where: ???
*** Near: [make error! a]        ;-- react printed an error message as if the code failed
== "bcd"
>> r
== make object! [
    a: "bcd"
    b: none                      ;-- b value didn't get the reaction result
]
```
In both situations the code executes without an exception raised, it just happens that the result of it is an error object. As in Red error is a legal object that can be tossed around, this limits the applicability of reactivity engine and attempt function.

A simple fix to this would be to make `try` to support a refinement that will make it return a block `[success? [logic!] result [any-type!]]`. Then the 1st item can be used as an error check and the 2nd as either an error to display or a result to pass through.

**Expected behavior**

A few solutions for **try** are presented [here](https://gitlab.com/snippets/1995418)
The one I chose is **implemented [here](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/catchers.red)** under a different name - `trap` (because while it's backward compatible by design, in reality it's not - because it traps return & exit).
Interestingly, it turns out that unknowingly I came to the same design that was used in **R3** (even improved it) - [`try/except`](https://gitter.im/red/bugs?at=6097c3ef2cc8c84d851c4f72).

For **catch** the design is [here](https://gitlab.com/snippets/1995436) and down in this issue log, with two selected working solutions implemented and documented [here](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/catchers.red).

The main issue with `catch` design is that it's built like "greedily catch everything then attempt to use crutches to fix that". While what we want is to *only catch the thing we know and care about*. Implemented solutions do that, although /name is not supported due to https://github.com/red/red/issues/4416 and IMO /name is not needed at all, and instead we should throw `block!`s where we need to pass 2+ values up.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 11-Jan-2019/5:18:27+03:00 commit #5e37a10
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-26T16:55:50Z, meijeru, commented:
<https://github.com/red/red/issues/3755#issuecomment-457846609>

    Looks like a wish to me...

--------------------------------------------------------------------------------

On 2019-01-26T21:19:20Z, greggirwin, commented:
<https://github.com/red/red/issues/3755#issuecomment-457866904>

    @hiiamboris so your `success?` is really "an error!` was the result of evaluation", correct? From your example it looks like the reverse, where the result being an error has `true` in the block. But I don't see how that can work, without also passing a spec as to what's expected.
    
    This is an important detail, but maybe one that is solved with a different pattern, and warnings about using `attempt` with reactivity, rather than modifying `try`.

--------------------------------------------------------------------------------

On 2019-01-27T08:50:09Z, hiiamboris, commented:
<https://github.com/red/red/issues/3755#issuecomment-457900182>

    @greggirwin it's either
    - a `success?` flag that is `true` when no exception was thrown
    - a `failure?` flag that is `true` when an exception was thrown
    
    I don't really care which one it will be. More so, the whole wish part of the issue (where I propose a solution) is just an example. Propose a better one if you like. Regardless of the nature of the fix, what I want is **to be able to distinguish an error object from a failure in evaluation** (latter at the `try` level is done by an R/S exception being thrown and caught). I don't understand why you would need a spec for that, and can implement this change myself if the team agrees.

--------------------------------------------------------------------------------

On 2019-01-27T22:44:20Z, greggirwin, commented:
<https://github.com/red/red/issues/3755#issuecomment-457961482>

    In your example above, you have
    ```
    >> x: try/any [make error! "qwe"]
    == [true make error! [
    ```
    which doesn't seem to match your latest description. I feel like I'm missing something though. As I understand it, you want to do this:
    ```
    set [ok? val] try/any [make error! "qwe"]
    either ok? [...][...]
    ```
    instead of this, correct?
    ```
    set 'res try [make error! "qwe"]
    either error? res [...][...]
    ```
    While that lets us do things in a slightly different way, I don't see the big win, versus keeping a single model and offering advice on how to use it effectively.
    
    Another way to look at it is to ask if it lets us do something we simply *can't* do today. e.g., in the reactivity system, which brought this problem to light, what would the solutions look like under the current design, and with your proposal?

--------------------------------------------------------------------------------

On 2019-01-28T22:09:56Z, endo64, commented:
<https://github.com/red/red/issues/3755#issuecomment-458321816>

    What about making `is` to accept `error!` values with a refinement like `is/any`
    
    ```
    r: make reactor! [a: "abc" b: is/any [make error! a]]
    r/a: "test"
    >> r
    == make object! [
        a: "bcd"
        b: make error! [
          code: 800
          type: 'user
          id: 'message
          arg1: "test"
        ...
    ```
    
    As error values already work with objects:
    
    ```
    >> o: object [e: make error! "test"] ; no error raised
    >> o
    == make object! [
        e: make error! [
            code: 800
            type: 'user
            id: 'message
            arg1: "test"
            ...
    ```

--------------------------------------------------------------------------------

On 2019-01-28T22:48:41Z, greggirwin, commented:
<https://github.com/red/red/issues/3755#issuecomment-458333601>

    @hiiamboris has his head in this much more than I do, so can correct me here, but the current reactivity code is designed to work as his first message says. i.e., it's not a bug. `reactor!/eval` can work in two ways, and when `eval-reaction` calls it, it uses the `/safe` refinement intentionally. That's where the `none` result comes from. 
    
    My current feeling is that this isn't an issue for `try`, but for the reactivity design. It raises a couple other, bigger, design questions though. 
    
    1) JS can print to the console, as the browser supports that for just this kind of thing. We don't have that for desktop apps, and we know it's useful at times. We don't want to scare the user, but it's nice to get info if these things happen, even for ourselves. No console dumps for production desktop apps though. 
    
    2) The idiom of returning 2 values (`success?` and `result`). It's not standard Red, though Go uses it, and some promise systems I believe. HTTP as well of course. I'm not saying it's a slippery slope to use it, just that sometimes a need has broader application than we think, and maybe there's a better way to provide that approach, generally, in Red.

--------------------------------------------------------------------------------

On 2019-01-28T22:51:09Z, greggirwin, commented:
<https://github.com/red/red/issues/3755#issuecomment-458334370>

    Think also of common reactivity use cases, and the model it came from. In spreadsheets, you may see #ERR results in cells, and not know anything more about the problem. We can look at symbolic computing as a model as well, and how things propagate. For a general purpose language, like Red, it may be good to have options. 

--------------------------------------------------------------------------------

On 2019-01-29T10:25:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/3755#issuecomment-458487484>

    A few answers:
    - `error? try` comes from Rebol, where `make error! ...` throws an exception - so there it's totally correct. Not applicable to Red though, where an error! is just a sort of object, and no exception until you `do` it.
    - `is/any` is not required: as it internally uses `try`, `try/any` is enough to make `is` also versatile
    - what `try/any` aims to allow is to distinguish a real exception from an error object, which is still possible (but ugly!) in the current design by wrapping code in a block and then unwrapping it (both `is` and `attempt` can be modified like this):
    ```
    >> foreach code [[1 + 2 * 3] [make error! "123"] [abracadabra]] [
        either error? r: try [reduce [do code]] [
            print "result: an exception!"
        ][
            print ["result:" mold/flat r/1]
        ]]
    result: 9
    result: make error! [code: 800 type: 'user id: 'message arg1: "123" arg2: none arg3: none near: none where: none stack: none]
    result: an exception!
    ```
    - my main point is not about what is possible and what is not, but that both attempt and is should not IMO treat an error object as a failure, and that modifying try just looks to me as a simplest way to achieve that (compared to fighting `try` in `is` and `attempt`)
    - look at `load`: it returns a single result most of the time, but a block of a few values with `load/trap` refinement. Just an example of multiple-return idiom at the very core of Red.

--------------------------------------------------------------------------------

On 2019-05-15T09:50:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/3755#issuecomment-492586852>

    I have recently realized that `catch` on arbitrary code suffers from the same problem even more: whatever return value I'm checking against, it may have been returned normally by the user code.
    The model forces me to work around it like (a variant of the `reduce` trick above):
    ```
    r: ()
    unless 'ok = flag: catch/name [set/any 'r do code  'ok] 'some-name [
        ;) now flag is definitely a result of throw, provided my own throws don't throw 'ok
        ...process flag...
    ]
    :r
    ```

--------------------------------------------------------------------------------

On 2019-05-31T15:23:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/3755#issuecomment-497749592>

    I've made a few experimental `try` and `catch` variants that look like this:
    ```
    set/any [ok? result] catch2/name/any expr 'grenade
    ;) deal with ok? & result
    
    set/any 'result catch3/state/name expr ok? 'grenade
    ;) deal with ok? & result
    
    either ok?: catch-set/name result: expr 'grenade [
    	;) deal with normal case
    ][
    	;) deal with throw case
    ]
    
    set/any 'result catch4/name/handler expr 'grenade [
    	print ["OH NOES! caught some" mold :thrown]
    	"take this result instead"
    ]
    ;) use the result
    ```
    The source and test is here: https://gitlab.com/snippets/1862451. As you can see from the source, the workaround always looks ugly (well, plus the lack of `apply` function).
    
    I tend to prefer variants `catch2`/`try2` (the originally proposed) and `catch4`/`try4` (with /handler).

--------------------------------------------------------------------------------

On 2020-07-10T17:11:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/3755#issuecomment-656786218>

    Red runtime is all through vulnerable for this.
    
    **(1) `attempt` and (2) reactivity problems were mentioned.**
    
    To further illustrate the problem:
    
    **(3) Here's how I can trick the console:**
    ```
    >> 'halt-request
    (halted)
    ```
    
    **Here's `do` on files:**
    - `1.red` listing: `Red [] make error! "some error"`
    - `2.red` listing: `Red [] x: do %1.red`
    
    **(4) `red 2.red` throws the error instead of assigning it to `x`:** 
    ```
    *** User Error: some error
    *** Where: do             
    *** Stack: do-file        
    ```
    
    **(5) But `red 1.red` is even worse ;)**
    ```
    *** User Error: some error
    *** Where: ???            
    ```
    
    **(6) VID's `do`:**
    ```
    >> view [do [x: make error! "some error"] base]
    *** User Error: some error
    *** Where: ???
    ```
    
    **(7) ALL of View actors:**
    ```
    >> view [base rate 3 on-time [make error! "some error"]]
    *** User Error: some error
    *** Where: ???
    *** User Error: some error
    *** Where: ???
    (spams you with these messages)
    ```
    
    **(8) Event functions:**
    `insert-event-func func [f e] [make error! "kild ya!!"]` - GUI console deadlocks after this
    
    **More bugs will pop up** after `error!` gets a serialized form and `load` becomes able to return error objects.

--------------------------------------------------------------------------------

On 2020-07-10T17:33:40Z, hiiamboris, commented:
<https://github.com/red/red/issues/3755#issuecomment-656796036>

    **For `try` I have another idea.** I like it, but it's partly breaking R2 compatibility. Still, considering that R2 design doesn't fit Red, it may be worth breaking it. It's not gonna work for `catch` though.
    
    If we're using the result of `try`, it doesn't matter where we put the assignment - inside or outside of `try` block. What's the difference for us to write `result: try [some.. code.. last expr]` or `try [some.. code.. result: last expr]`?
    
    What if `try` returned just `true` (or `'ok`) on success (instead of the last result) and an error object when it *catches* it:
    ```
    if error? err: try [..code..] [ ;) no need for set/any as we expect only errors and true
        error branch                ;) prints the error or whatever
    ]
    ```
    To use the result, we would assign it explicitly:
    `try [result: do code]` or `try [some.. code.. result: last expr]`
    
    Or if code is not known and may return unset, and we only need to return it later:
    `try [set/any 'result do code]`
    
    Or simpler:
    `try [return do code]`
    
    E.g.:
    ```
    if error? err: try [return do code] [
        ...error handling...
    ]
    ```
    This is so less ugly and less error-prone, no?
    
    The problem with this one is it makes harder to use `try` in line:
    ```
    all [
        yes = try [:value =? :cell/data/1]
        ...
    ]
    ```
    which should become any of:
    `yes = attempt [:value =? :cell/data/1]`
    `(try [r: :value =? :cell/data/1] r = yes)`

--------------------------------------------------------------------------------

On 2020-07-13T14:21:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/3755#issuecomment-657590298>

    [**In hopes to move this issue forward, I wrote a side by side comparison for you**](https://gitlab.com/snippets/1995418)

--------------------------------------------------------------------------------

On 2020-07-13T15:32:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/3755#issuecomment-657630177>

    [**For `catch` I have a better idea**](https://gitlab.com/snippets/1995436)

--------------------------------------------------------------------------------

On 2020-07-14T00:08:32Z, greggirwin, commented:
<https://github.com/red/red/issues/3755#issuecomment-657892057>

    Having read through everything once, here's my gut reaction: all the options are different, but not better. The reason being that this problem really can't be solved. Rather, there is no best solution. The various alternatives push logic and responsibilities around, but a) some of them make things more complicated as I read through them, and b) unless we have only a single way for people to do things, which we can strictly enforce, there will always be a mix of things that cause unexpected results. And since we can never strictly enforce anything, being Red(ucers), the less details we can get wrong, the better. Here I'm referring to "sometimes you need to put things inside the block you're trying, and sometimes you don't."
    
    It's important to separate `attempt/try/throw/catch` from the code that uses them (e.g. the console, reactive system, actors, and callers of `do`). It's a structural problem that changing single functions can't address. That is, we can't fix it in `try`. At every level, code has to decide whether to return a result or cause an error. It has no idea who is calling it or how they're going to deal with either situation. On the flip side, a caller needs to know if an error can occur, and decide what to do if that happens. If there are improvements we can make in those callers today, for cited problems, we should do that.
    
    As @hiiamboris has shown, what's in place today (correct me if I'm wrong) allows other approaches to be built. But we have 2 options today, which I _think_ give us enough flexibility. We can `make` an error, which is informative, or we can `cause` an error, how a caller, including `attempt` deals with those two cases is a choice, but it's not right or wrong.
    
    What I don't want to do is complicate things for the simple, common use cases. More advanced cases can and should be handled by a smaller number of more advanced developers. All this research can (and should) go into an article.
    

--------------------------------------------------------------------------------

On 2020-07-14T07:52:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/3755#issuecomment-658029717>

    @greggirwin the whole point and the conclusion of that research is that the proposed solutions (namely `try/catch` and pattern-matching `catch/handler`):
    - do *not* complicate simple, common use cases (and in case of `try` - fully backward compatible)
    - prevent Reducers to make the same mistakes over and over
    - remove ugly boilerplate code required to fix the current design that makes it esoterically unreadable
    
    If that's not "better", then what is? ;)
    
    > But we have 2 options today, which I think give us enough flexibility. We can `make` an error, which is informative, or we can `cause` an error, how a caller, including `attempt` deals with those two cases is a choice, but it's not right or wrong.
    
    I don't follow you here.
    

--------------------------------------------------------------------------------

On 2020-07-14T14:20:01Z, greggirwin, commented:
<https://github.com/red/red/issues/3755#issuecomment-658208205>

    I will have to revisit then. Maybe just the sheer volume of options overloaded my brain in trying to fit it in yesterday. `Try/catch` and `catch/handler` struck me as much more traditional exception handling models which come with a different set of tradeoffs. I'll need to read back on resource cleanup there, and what feels like more mixing of `catch/throw` as part of exception handling, rather than other non-local flow control. We don't ahve function attributes yet, but they will come.
    
    What I mean with the last comment is that `make error!` is an informative failure result, while `cause-error` is an exception mechanism. One issue I see is that we don't have a single model to follow, and mixing the two can, ironically, lead to trickier errors.

--------------------------------------------------------------------------------

On 2020-07-14T17:49:13Z, 9214, commented:
<https://github.com/red/red/issues/3755#issuecomment-658320999>

    @hiiamboris do you have any thoughts on extending the `error!` datatype itself?
    
    I mused over the lack of intentionality in errors a few times in the past: i.e. you cannot differentiate if the error was an accidental mistake or "by design" message. `error!` lacks contextual info on which the error handling code can dispatch and potentially resume the evaluation (think of self-healing and self-protecting code), and what it has now is purely descriptive (this is what happened), but not prescriptive (this is how it can be fixed).
    
    @maximvl's [experiments](https://gist.github.com/maximvl/dcb8c4e9ef5d4db91f7a6b52da9b9cee) with porting CL condition/restart system to Red also come to mind. The `set [ok? result] try [...]` patterns look like Go's idiomatic error handling.
    
    WRT pattern-matching, I had an idea way back when `money!` design was discussed. If someone adamantly wants underflowing `money!` literals to coerce to `$0` rather than throwing an error, they can install what I call a _guard_, which is a predicate bound to `error!` encountered at runtime coupled with `block!` callback that returns a value to substitute for that error (should be probably bound to `error!` too). Roughly speaking:
    ```red
    trap [all [type = 'math id = 'underflow money! = transcode/prescan where]] [$0]
    ```

--------------------------------------------------------------------------------

On 2020-07-14T19:28:08Z, greggirwin, commented:
<https://github.com/red/red/issues/3755#issuecomment-658369265>

    @maximvl's examples were very cool, and show what can be done with what we have today, as do @hiiamboris'. 
    
    Go is a little different, I think, as you get `[result [none | error!]]`, and you check the error to see if it's not `nil` (in Go terms). It gives you the same ability to return a value in addition to the error, but that's not what I think you mean to use it for when you talk about prescriptive information.
    
    On the `money!` thought, do dependent types have an agreed best-practice approach in other langs, whether they clamp silently, warn, or error?
    
    @hiiamboris on your last `catch` idea, did you consider and rule out a more structured pattern matching (i.e. pattern-action) design, so a single `catch` can handle multiple patterns?

--------------------------------------------------------------------------------

On 2020-07-14T19:36:10Z, hiiamboris, commented:
<https://github.com/red/red/issues/3755#issuecomment-658372955>

    @9214 in the near term I'd like to see errors [at least being rethrowable](https://github.com/red/red/issues/4538) :D 
    Even better I'd like to be able to rethrow `return`s `exit`s and `break`s and maybe `throw`s as they are, not as errors, [but I can't do even the latter](https://github.com/red/red/issues/4416)
    Also, errors do not let you modify them without hacks, and when you do, you still can't control which fields will be printed (e.g. "*** Near:" field - maybe there's a way but I haven't found it yet).
    
    But let me clarify a few bits:
    - what do you mean by "by design" errors? if we just want to restart something, `throw` + `catch` is the way rather than `do make error!`
    - by "prescriptive" you mean error messages? I'd like to see an example
    
    There's a lot errors are missing, but maybe there will be just better tools for that than errors? I like to start from use cases. Like, Maxim's experiment looks overcomplicated to me, but perhaps if I saw how it's used in real code that would have convinced me. Or perhaps I would have came with a better idea ;)
    
    So far I identified the following use cases for error trapping:
    - unit tests
    - resource management
    - input validation
    - I/O error wrappers
    - lazy programmer doesn't wanna go too verbose, esp. with checking path items existence
    - limiting the error propagation, so that whatever happens during some action doesn't stop the program, lets it evaluate some self-assessment and info collection and either propose an alternative or display an exhaustive description of the problem and handle it's resolution to the user
    
    What other use cases do we have and what control flow model do we want for that? How common are those use cases and can we do away with little mezzanines or do we have to dig into R/S or macros?

--------------------------------------------------------------------------------

On 2020-07-14T19:52:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/3755#issuecomment-658380082>

    > @hiiamboris on your last `catch` idea, did you consider and rule out a more structured pattern matching (i.e. pattern-action) design, so a single `catch` can handle multiple patterns?
    
    like this?
    ```
    filter: [
        case [
            not block? :thrown [no]              ;) not our kind of throw - pass it thru
            :thrown/1 = 'wow-baaad ['wow]        ;) must be an emergency! return truthy value
            all [:thrown/1 = 'post-eval block? :thrown/2] [:thrown/2]         ;) post-correction of results?
        ]                                        ;) returns none by default and passes the throw thru
    ]
    result: catch/handler filter code [
        either 'wow = code: do filter [print "...woah this is baad"] [do code]
    ]
    ```
    don't wanna reinvent the wheel we have ;)

--------------------------------------------------------------------------------

On 2020-07-14T19:53:33Z, greggirwin, commented:
<https://github.com/red/red/issues/3755#issuecomment-658380569>

    Input validation should never throw errors, should it?
    
    Limit and handle errors when propagated. This is really important because _every single program needs it._ It also ties to prescriptive information, because there's nothing worse than having a program crash and not be able to get it to run again because it left something in a bad state.

--------------------------------------------------------------------------------

On 2020-07-14T19:57:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/3755#issuecomment-658382529>

    > Input validation should never throw errors, should it?
    
    Depends. E.g. my CLI will react by `throw`ing messages into the `catch` handler. But I'm more talking about that validation should *trap* errors (e.g. the common `try [load s]` use case)

--------------------------------------------------------------------------------

On 2020-07-14T20:01:21Z, greggirwin, commented:
<https://github.com/red/red/issues/3755#issuecomment-658384175>

    Direct pattern action is what I meant:
    ```
    result: catch code [
        :thrown/1 = 'wow-baaad [print "...woah this is baad"]        ;) Emergency!
        all [:thrown/1 = 'post-eval block? :thrown/2] [do :thrown/2] ;) post-correction of results?
        ;not block? :thrown []              ;) not our kind of throw - pass it thru
    ]
    ```
    
    Validation, got it. I was thinking user input validation, e.g. via `parse`. 

--------------------------------------------------------------------------------

On 2020-07-14T20:19:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/3755#issuecomment-658392562>

    @greggirwin I'm open to this alternative, if we find some way it would tell `catch` when to rethrow the `throw` or not, because the whole point of `filter` was not to rethrow it manually every time. But here's a catch (pun intended): if we reserve a value, we won't be able to pass it from the handler into the `result`. How can we solve it? Now that I think of it, we could expose some `rethrow` native available only inside the handler, e.g. `if not what-we're-looking-for [rethrow]`. That would be much better than `[either name [throw/name :thrown name][throw :thrown]]`.

--------------------------------------------------------------------------------

On 2021-04-01T16:27:25Z, hiiamboris, commented:
<https://github.com/red/red/issues/3755#issuecomment-812023447>

    Updated issue text with the link to https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/catchers.red

