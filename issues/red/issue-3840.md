
#3840: help tries to evaluate is function
================================================================================
Issue is closed, was reported by PeterWAWood and has 54 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3840>

**Describe the bug**
The help function tries to evaluate the is function instead of displaying is help text.
```text
>> ? is
*** Script Error: is operator is missing an argument
*** Where: catch
*** Stack:  

>> help is
*** Script Error: is operator is missing an argument
*** Where: catch
*** Stack:
```

**To reproduce**
1. Enter `? is` or `help is` in a Red console

**Expected behavior**
The `is` function help text should be displayed in the console.

**Platform version (please complete the following information)**
```
>> about
Red 0.6.4 for macOS built 27-Mar-2019/6:31:51+08:00
```



Comments:
--------------------------------------------------------------------------------

On 2019-04-07T19:23:31Z, greggirwin, commented:
<https://github.com/red/red/issues/3840#issuecomment-480621325>

    Good find. I wonder what makes `is` special, compared to other ops. Its first arg is a lit-word, but it's the evaluation of `is` itself that's the problem. Accessing it as a get-word from the lit-word arg evaluates it.
    
    Related tickets:
    https://github.com/red/red/issues/3585
    https://github.com/red/red/issues/3344
    
    `h: func ['word][:word]` 

--------------------------------------------------------------------------------

On 2019-04-07T19:36:06Z, hiiamboris, commented:
<https://github.com/red/red/issues/3840#issuecomment-480622248>

    Operators take precedence over functions. Lit-args take precedence over normal args. But everyone rediscovers this once in a while, so it pops up again.
    I don't see any problem with the current behavior and consider /rep branch a better place for this wish.

--------------------------------------------------------------------------------

On 2019-04-07T19:45:08Z, endo64, commented:
<https://github.com/red/red/issues/3840#issuecomment-480622948>

    > I don't see any problem with the current behavior and consider /rep branch a better place for this wish.
    
    I don't agree, `?` should work for functions with `lit-word!` arguments as well.

--------------------------------------------------------------------------------

On 2019-04-07T19:57:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/3840#issuecomment-480623868>

    `is` is an operator, not a function

--------------------------------------------------------------------------------

On 2019-04-07T20:31:13Z, greggirwin, commented:
<https://github.com/red/red/issues/3840#issuecomment-480626676>

    It would be nice if this worked, but it's not a show-stopper.

--------------------------------------------------------------------------------

On 2019-04-07T20:33:35Z, 9214, commented:
<https://github.com/red/red/issues/3840#issuecomment-480626929>

    A workaround would be `help ('is)`.

--------------------------------------------------------------------------------

On 2019-04-07T23:36:06Z, greggirwin, commented:
<https://github.com/red/red/issues/3840#issuecomment-480642695>

    Very nice @9214.

--------------------------------------------------------------------------------

On 2019-04-16T09:27:52Z, meijeru, commented:
<https://github.com/red/red/issues/3840#issuecomment-483583517>

    The general problem is:
    ```
    >> o: make op! func ['arg1 arg2][]
    == make op! [['arg1 arg2]]
    >> help o
    *** Script Error: o operator is missing an argument
    ```
    None of the built-in ops (except `is`) have a literal first argument. Thus a warning + workaround may suffice. BTW the simplest workaround is:
    ```
    >> help :is
    make op! [[{Defines a reactive relation whose result is assigned to a word} 
        'field [set-word!] {Set-word which will get set to the result of the reaction} 
        reaction [block!] "Reactive relation" 
        /local words obj rule item
    ]]
    ```

--------------------------------------------------------------------------------

On 2019-04-16T09:34:44Z, 9214, commented:
<https://github.com/red/red/issues/3840#issuecomment-483586093>

    @meijeru your example doesn't print any helping info at all (compare `help :is` and `help ('is)`).

--------------------------------------------------------------------------------

On 2019-04-16T09:41:50Z, meijeru, commented:
<https://github.com/red/red/issues/3840#issuecomment-483588448>

    Further to the above: unfortunately, both `source is` and `source :is` give an error, the first one because of the same evaluation precedence problem, the second one since the argument to source MUST be a word. Would it be be useful to relax this restriction?
    
    @9214: in THIS particular case, all that `help ('is)` does is reformat the same information that is shown by `probe :is`. So a general tip could be: if `help op` does not work, try `help ('op)` or `probe :op` 

--------------------------------------------------------------------------------

On 2019-04-18T20:50:26Z, dockimbel, commented:
<https://github.com/red/red/issues/3840#issuecomment-484685270>

    This is an interesting design issue to solve. Propositions are welcome.

--------------------------------------------------------------------------------

On 2019-04-19T01:17:51Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3840#issuecomment-484737952>

    From a design perspective, I have two comments:
    
    1. The first is a question. Is it reasonable to expect a Red user to know the type of the value before being able to successfully use `help`? (Personally, I think not, especially for beginners.)
    
    2. The Red `help` function should be consistent in how it handles types. It is not at the moment:
    
    ```text
    >> type? :+
    == op!
    >> type? :is
    == op!
    >> help +
    USAGE:
         value1 + value2
    
    DESCRIPTION: 
         Returns the sum of the two values. 
         + is an op! value.
    
    ARGUMENTS:
         value1       [number! char! pair! tuple! vector! time! date!] 
         value2       [number! char! pair! tuple! vector! time! date!] 
    
    RETURNS:
         [number! char! pair! tuple! vector! time! date!]
    
    >> help is
    *** Script Error: is operator is missing an argument
    *** Where: catch
    *** Stack:  
    ``` 

--------------------------------------------------------------------------------

On 2019-04-19T17:02:37Z, greggirwin, commented:
<https://github.com/red/red/issues/3840#issuecomment-484957742>

    As @dockimbel, proposals are welcome. The problem is not with `help`, which I think we all agree should behave consistently. It's a deep issue, and related to Red's flexibility with ops and arg types. And the reason for `is` using the syntax it does is because that makes using the `op!` syntax very clear.
    
    `Is`, linguistically, is closely related to `has` and `does`, and is a good word. Can we just use it as a function, rather than an `op!`? Not without special evaluation rules. We can just use `react`, but `is` is a wonderful bit of syntactic sugar. 
    
    `Help` is interactive, so we can explain it when it comes up, but it may come up a *lot*, as reactivity is something that will see heavy use. It's also an issue in any reflective tooling that may use `help-string`.
    
    We could make it a macro, but we still have the big issue to address. If we disallow ops with lit-args, the problem goes away and we give up some syntax options (which could be nice in other dialects, but that's hypothesizing). If we support it, people will use it (even when they don't need to), and that will ripple out to other funcs and tools. Smart IDEs will help people a lot, but we don't want to make their authors suffer unnecessarily.
    

--------------------------------------------------------------------------------

On 2019-04-25T22:27:44Z, gltewalt, commented:
<https://github.com/red/red/issues/3840#issuecomment-486860228>

    Can you not put a check into `help` that tests for a lit-arg in the first position?

--------------------------------------------------------------------------------

On 2019-04-25T22:31:51Z, 9214, commented:
<https://github.com/red/red/issues/3840#issuecomment-486861198>

    @gltewalt that doesn't really solve anything, since `is` takes precedence over `help`.

--------------------------------------------------------------------------------

On 2019-05-14T00:38:19Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3840#issuecomment-492035248>

    It shouldn't be difficult to find a solution to this as `help` works on other operators:
    ```text
    >> help +
    USAGE:
         value1 + value2
    
    DESCRIPTION: 
         Returns the sum of the two values. 
         + is an op! value.
    
    ARGUMENTS:
         value1       [number! char! pair! tuple! vector! time! date!] 
         value2       [number! char! pair! tuple! vector! time! date!] 
    
    RETURNS:
         [number! char! pair! tuple! vector! time! date!]
    
    >> help is
    *** Script Error: is operator is missing an argument
    *** Where: catch
    *** Stack:  
    ```

--------------------------------------------------------------------------------

On 2019-05-14T02:24:11Z, greggirwin, commented:
<https://github.com/red/red/issues/3840#issuecomment-492053820>

    The problem isn't with `help` @PeterWAWood. It's evaluation order of ops with literal first args. That, I think, is not an easy change. What may fix it for `help` may have side effects that make things much worse overall.

--------------------------------------------------------------------------------

On 2019-05-14T05:02:54Z, 9214, commented:
<https://github.com/red/red/issues/3840#issuecomment-492079690>

    Problem isn't in `help`, as others try to imply, it's in `is`. And I think the solution is obvious if you look at the common pattern of `op!` application:
    
    ```text
    operand1 operator operand2
    ```
    But in `help is` case it's rather:
    ```text
    operand1 operator
    ```
    
    Red follows applicative order of evaluation: `operand1`, then `operand2`, then `operator` itself:
    ```text
    ➀ ➂ ➁
    ```
    
    If `➁` is absent, `op!` application will fail in any case. But `➁` **may** be absent (as an operand) if `➂` happens to be quoted by `➀`.
    
    In our example, `is` behaves too hastily and _assumes_ that there is rightmost `➁`, while in fact it's pressed to the wall.
    ```text
    (... help is)
    (... ➀    ➂)
    ```
    
    The goal is, then, to:
    
    1. communicate to `➂` that without `➁` it will fail and that resistance is futile (i.e. there's no point in trying to evaluate `➀`)
    1. and prompt it to do a "speculative evaluation" of its leftmost `➀` operand, to see if it will in turn quote `➂` and resolve this tangled bottleneck.
    
    This is trivially achieved from the interpreter:
    1. first and foremost, ensure that `➂` has a quoted first (i.e. left) argument;
    1. if (1) is true, then do an extra check that examines `➂`'s position. _If it is at the `tail`, then it gives up the normal pattern of evaluation, since there's no rightmost `➁`_. e.g. `(operand1 operator)`;
    1. from (1) it follows that "speculative evaluation" of `➀` won't do any harm because it's a _quoted_ argument - that is, we do not evaluate any _expression_, we just peek at the leftmost _value_. `¹`
    1. Leftmost `➀` may, in turn, be a 1-arity function that quotes its argument (e.g. `help is`).
    
    To restate this as a some kind of axiom:
    
    If operator quotes its leftmost argument **and** resides at the tail, then it "speculatively" gives up and leftmost argument takes its evaluation turn. In any other case evaluation proceeds as usual.
    
    Once again, the basic premise is that for _any_ `op!` application there need to be **3** elements:
    ```text
    ➀        ➂       ➁
    operand1 operator operand2
    ```
    
    If, however, `operator` quotes `operand1` **and** there's no `operand2`,
    ```text
    ➀       '➂
    operand1 operator
    ```
    
    then it follows that `operator` application will fail in any case, since required `operand2` is absent. **But**, this situation can be resolved **if** `operator` gives `operand1` a chance to quote it, thus eliminating `operator` application (the root of this problem) itself. `²`
    
    ---
    **Footnotes:**
    
    1. However, specific care should be taken to address quoted arguments in `op!`s, since `paren!`, `get-path!` and `get-word!` **will** be evaluated (see [here](https://github.com/red/red/wiki/[DOC]-Guru-Meditations#literal-arguments-and-get-arguments) for details).
    1. I cannot test and elaborate this proposal until https://github.com/red/red/issues/3585, https://github.com/red/red/issues/3344 and https://github.com/red/red/issues/3864 are fixed, and until quoted argument in `op!` are fully implemented. Cases with multiple-arity functions and operators that quote to the right need to be meditated upon, so as functions with refinements and `object/function` paths.

--------------------------------------------------------------------------------

On 2019-05-14T10:01:34Z, endo64, commented:
<https://github.com/red/red/issues/3840#issuecomment-492172797>

    We thought that it is the issue of `help` in the beginning, 
    
    Thanks for the detailed explanations @9214 , now its crystal clear.
    
    ```
    >> quote is
    *** Script Error: is operator is missing an argument
    ```

--------------------------------------------------------------------------------

On 2019-05-14T10:06:42Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3840#issuecomment-492174544>

    So what is different between the operators `+` and `is`? 
    
    `help +` works as expected.

--------------------------------------------------------------------------------

On 2019-05-14T14:18:49Z, 9214, commented:
<https://github.com/red/red/issues/3840#issuecomment-492257516>

    @PeterWAWood `is` is by far the only operator that quotes its left argument:
    ```text
    ARGUMENTS:
         'field       [set-word!] {Set-word which will get set to the result of the reaction.}
         reaction     [block!] "Reactive relation."
    ````
    So in `help is`:
    * `is` is an `op!` and takes precedence over `function!`;
    * it quotes its leftmost argument `help`;
    * it then tries to grab its rightmost argument and fails.

--------------------------------------------------------------------------------

On 2019-05-14T14:34:02Z, dockimbel, commented:
<https://github.com/red/red/issues/3840#issuecomment-492263826>

    ```
    >> quote +
    == +
    >> quote is
    *** Script Error: is operator is missing an argument
    *** Where: catch
    *** Stack:  
    ```
    
    They should behave consistently, so there is a bug to fix in ops passed as lit arguments.

--------------------------------------------------------------------------------

On 2019-05-14T14:46:50Z, 9214, commented:
<https://github.com/red/red/issues/3840#issuecomment-492269445>

    @dockimbel I don't follow, should they both fail or should they both be consistently quoted? There's no bug per se, just an edge-case behavior.
    
    `quote +` behaves as expected, but `quote is` is different, because `is` takes precedence, quotes `quote` and tries to grab its (absent) rightmost argument. See my proposal above on how to resolve this.

--------------------------------------------------------------------------------

On 2019-05-14T14:50:08Z, dockimbel, commented:
<https://github.com/red/red/issues/3840#issuecomment-492270893>

    I forgot that `is` also takes a lit-word as first argument, so `quote` has no way to make the argument passive.
    
    Reading your proposal...yes, if we disable the precedence for infix ops with a lit left operand when there's no right operand, that would solve the `quote` and `help` issue...

--------------------------------------------------------------------------------

On 2019-05-14T14:51:15Z, 9214, commented:
<https://github.com/red/red/issues/3840#issuecomment-492271396>

    @dockimbel correct.

--------------------------------------------------------------------------------

On 2019-05-16T06:39:25Z, endo64, commented:
<https://github.com/red/red/issues/3840#issuecomment-492938210>

    Would be nice to have some tests for this issue.

--------------------------------------------------------------------------------

On 2019-05-16T10:37:25Z, 9214, commented:
<https://github.com/red/red/issues/3840#issuecomment-493014787>

    @endo64 #3344 should be fixed first.

