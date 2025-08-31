
#2433: Use % and %% for modulo and / and // for division
================================================================================
Issue is open, was reported by PeterWAWood and has 118 comment(s).
[status.reviewed] [type.task.wish]
<https://github.com/red/red/issues/2433>

It is suggested that the symbols ```%``` and ```%%``` be used as infix modulo operators and ```/``` and ```//``` be used as infix division operators.

The ```/``` operator will perform non-integer division of numbers. In general, it will return a ```float!``` number.

The ```//``` operator will perform an integer division, both the dividend and the divisor must be integer, an integer is returned. The result is calculated as the floor of the dividend divided by the divisor.

The calculation of modulo is a complex topic. The paper "The Euclidean Definition of the Functions div and mod" by Raymond T. Boute, University of Nijmegen, ACM Transactions on Programming Languages and Systems, Vol 14, No. 2, April 1992 highlights the complexity.

The abstract of the paper provides a good summary:

 _"The definitions of the functions div and mod in the computer science literature and in programming languages are either similar to the Algol or Pascal definition (which is shown to be an unfortunate choice) or based on division by truncation (T-definition) or division by flooring as defined by Knuth (F-definition). The differences between various definitions that are in common usage are discussed, and an additional one is proposed, which is based on Euclid’s theorem and therefore is called the Euclidean definition (E-definition). Its distinguishing feature is that 0 <= D mod d < abs(d) irrespective of the signs of D and d. It is argued that the E- and F-definitions are superior to all other ones in regularity and useful mathematical properties and hence deserve serious consideration as the standard convention at the applications and language level. It is also shown that these definitions are the most suitable ones for describing number representation systems and the realization of arithmetic operations at the architecture and hardware level."_

An example of the difference between the T-definition and the E-definition is the calculation of -3 mod 5. The T-definition gives -3, whereas the E-definition gives 2.
 
It is suggested that the ```%``` operator uses the E-definition on the basis of compatibility with Rebol2 and the ```%%``` operator uses the T-definition.

Note: Currently % follows the T-definition and // follows the E-definition.



Comments:
--------------------------------------------------------------------------------

On 2017-02-11T09:00:03Z, dockimbel, commented:
<https://github.com/red/red/issues/2433#issuecomment-279131112>

    Agreed, this would provide a clean solution for modulo and integer divide. We will include that change in 0.6.3 release.

--------------------------------------------------------------------------------

On 2018-06-05T09:19:14Z, nedzadarek, commented:
<https://github.com/red/red/issues/2433#issuecomment-394641215>

    Wouldn't it be possible to be more descriptive? 
    For example I have found that the Factor uses 3 syntaxes for a division:
    - [/](http://docs.factorcode.org:8080/content/word-__slash__%2Cmath.html)
    - [/f](http://docs.factorcode.org:8080/content/word-__slash__f%2Cmath.html)
    - [/i](http://docs.factorcode.org:8080/content/word-__slash__i%2Cmath.html)

--------------------------------------------------------------------------------

On 2018-06-05T17:39:53Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-394797585>

    @nedzadarek your suggested syntaxes conflict with `refinement!` values and, while different, aren't necessarily more descriptive. Note, also, that @PeterWAWood's comment says "In *general*, it will return a float! number." The ops map to actions for a type, and won't always return a `float!`.

--------------------------------------------------------------------------------

On 2018-06-06T07:10:23Z, endo64, commented:
<https://github.com/red/red/issues/2433#issuecomment-394964435>

    Currently `%%` conflicts with file value: `>> %% ; *** Syntax Error: invalid file! at "%"`

--------------------------------------------------------------------------------

On 2018-06-10T23:12:03Z, nedzadarek, commented:
<https://github.com/red/red/issues/2433#issuecomment-396089495>

    @greggirwin I don't mean to use `/`, `/f` and `/i`. I mean to use something that describe the behaviour. Or rather a difference between the original and the new version. The Factor managed to do this by appending return type to the operator's name (just first letter).    

--------------------------------------------------------------------------------

On 2018-06-12T02:20:51Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-396444513>

    @endo64, the lexer does need to be updated for this change. Good reminder.
    
    @nedzadarek, what syntax do you propose then? The proposed syntax was discussed outside this ticket, and we didn't come up with anything better.

--------------------------------------------------------------------------------

On 2018-06-12T05:56:28Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2433#issuecomment-396474174>

    @dockimbel agreed with my initial wish. If there is a desire for a different syntax, a proposal should be made to @dockimbel.
    
    The actual chance of a clash with the filename %% is very small. The workaround is to use %"%" for the file.
    
    Both lexers will need to be changed.

--------------------------------------------------------------------------------

On 2018-06-17T15:47:36Z, nedzadarek, commented:
<https://github.com/red/red/issues/2433#issuecomment-397887589>

    @greggirwin I don't know.
    `%eucl` or `/eucl`? They clash with file/refinement but it's descriptive enough. 

--------------------------------------------------------------------------------

On 2019-10-04T16:25:30Z, hiiamboris, commented:
<https://github.com/red/red/issues/2433#issuecomment-538468036>

    I'm looking into the issue.
    
    > It is suggested that the % operator uses the E-definition on the basis of compatibility with Rebol2 and the %% operator uses the T-definition.
    
    First, I don't know what compatibility we're talking about here.
    R2:
    ```
    >> 5 % 3
    ** Syntax Error: Invalid file -- %
    ** Near: (line 1) 5 % 3
    ```
    R3:
    ```
    >> ? %
    %"" is a file
    ```
    There's no such operator in Rebol to begin with. In R2 and R3 both there's only the `//` operator, which follows the T-definition. By introducing `%%` and making `//` the division, we're left with no matters to be compatible with.
    
    We can only be compatible WRT `mod`/`modulo`/`remainder` funcs, but their mapping to operators we're free to choose as we wish.
    
    My arguments why `%` should follow the T-definition (as it does today):
    
    **I.** T-def is the direct result of `IDIV` x86 instruction (on integers), and so is the *fastest*.
    
    It also has the *shortest form*. Those who know their operands are unsigned and don't care about negative numbers will tend to use the first op that comes to mind, and since `%` is very widespread, it will be chosen.
    
    It just makes sense to put the simplest operation onto the forefront.
    
    **II.** It's consistent with modern *C/C++.*
    
    Since I believe we should use the same operator names in both Red and R/S, and it makes sense to me to make R/S somewhat compatible in this regard with C, so Red should follow too.
    
    If that's not an argument enough, consider *overall compatibility*: if you sort the [tables at wikipedia](https://en.wikipedia.org/wiki/Modulo_operation) you'll see that *out of 41 langs* that have the well-defined operator named `%`:
    - only one (!!!) follows E-definition (it's Dart)
    - six follow F-definition (Lua 5, Perl, Python, Ruby, Solidity, Tcl) and
    - 34 follow T-definition (these are ActionScript, AWK, bash, bc, C (ISO 1999), C++ (ISO 2011), ColdFusion, C#, Clarion, CoffeeScript, D, F#, GDScript, Go, Haxe, Java, JavaScript, Julia, Kotlin, ksh, Maya Embedded Language, mksh, PHP, PowerShell, Q#, Rust, Scala, SQL (SQL:2012), Swift, Torque, Verilog (2001), VimL, XBase++, PureBasic).
    
    That's 34 to 1 outnumbering ☺

--------------------------------------------------------------------------------

On 2019-10-04T19:58:37Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-538539947>

    Thanks for digging into this @hiiamboris. The table analysis is very helpful. It also highlights that we need to add Red to them, and also have a wiki/doc page that explains the differences in the funcs/ops Red and R/S offer. We can use those tables as a model, and link to the Wikipedia page. 
    
    While this ticket says "modulo", the subtleties here mean we should be clear that `%` currently maps to the `remainder` action.
    
    Since there is no single, correct option, it seems that we can offer alternatives, but those could come later, if deemed important and useful enough. There's a bit of a catch, for example, if we wanted to add `/euclid` or `/floor` refinements to `mod`, because then we can make the `//` `op!` from it directly.
    
    Related question: Is the current `mod/modulo` naming the best approach, or _should_ `mod` use a refinement to clarify the alternate behavior, rather than having a separate `modulo` function? We could keep `modulo` as a wrapper and mark it as deprecated, for a time. Or just tell people to port their code and note it in the wiki.
    
    I'll hazard a guess that most langs stuck with T-definition for the same reason you suggest. Everybody is doing it. And it's not clearly "wrong". As long as we doc what each op does, and keep in mind that this decision is forever, we can do the same. Assuming nobody else has successfully argued a bullet-proof case for E or F as the `%` op. 
    
    - https://stackoverflow.com/questions/12754680/modulo-operator-in-python suggest `fmod` for floats and `%` only for integers.
    - https://stackoverflow.com/questions/4432208/what-is-the-result-of-in-python Notes from Guido on why Python does it the way it does.
    
    On consistency, the most important aspect is between Red and R/S, and that the integer and non-integer versions are easy to reason about relative to each other. Having R/S comfortable for C devs is a bonus, but not if it affects Red users negatively.
    
    Would it help if we mocked up our own table for the sake of discussion, so we can lay out the behaviors and names to make sure we cover all the bases and don't paint ourselves into a corner?

--------------------------------------------------------------------------------

On 2019-10-06T20:57:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/2433#issuecomment-538787348>

    @greggirwin 
    Let me help you with the table ☺
    
    **Here are the functions and their behaviors**
    
    | func | R2 | R3 | Red | R/S
    |--|--|--|--|--
    | mod (function) | E-def, invalid when both args are negative |  E-def, invalid when both args are negative |  E-def, invalid when both args are negative | N/A
    | modulo (function) | E-def^ | E-def^ | E-def^ | N/A
    | remainder (action) | T-def | T-def | T-def | N/A
    | % | undefined | undefined | `make op! :remainder` | T-def
    | // | `make op! :remainder` | `make op! :remainder` | `make op! :modulo` | E-def
    
    ---
    [^] `modulo` also provides a pretty rounding facility (discussed below)
    Also note that `remainder` is an action, it's written in C or R/S. While `mod` and `modulo` wrap it around.
    
    **On the useful properties of each definition**
    
    T-definition, as stated before is the fastest. But it is also symmetric in a sense that in equation `a T-MOD b = c` flipping the sign of either `a` or `b` flips that of `c`. Just like with the usual division or multiplication. It sometimes makes it easy to reason about in composite expressions.
    
    Both E- and F-definitions offer a quality of transitivity. Suppose I want a steady modulus of some time interval against 12 hours. `(dt: t2 - t1) MOD 12:00`. It's all cool while `t2 > t1`. What if I move my reference time `t1` a few days forward, so that `t2 < t1` now for some points? T-def will be symmetric around `t1` which is definitely not what I want. But E- and F- definitions will produce the same result. Great!
    
    I cannot say whether E- or F- def is more useful in practice. E-def is known to be always non-negative. It's good to know, but idk what does that give us? F-def on the other hand is easy to negate by negating the sing of the divisor, just by adding a hyphen in front of it. Tough choice :)
    
    **I would offer the following:**
    1) `modulo` would become a general function, defaulting to E-def, taking refinements `/floor` (for F-def), `/trunc` (for T-def), and `/round` for the pretty rounding.
    2) `mod` would become a synonym for `modulo/round`
    It would be the same approach we're taking with trigonometric functions (`sin` - a special case of `sine`, `atan` - of `arctangent`, etc etc)
    3) `remainder` would stay as it is - in this case a synonym for `modulo/trunc`
    4) Perhaps a `rem` shortcut for `modulo/trunc/round` - same as `remainder` but with pretty rounding ?
    5) `%` would still map to `:remainder` (no rounding, T-def)
    6) `//` would still map to `:modulo` (no rounding, E-def) -- this is the only point we're currently incompatible with Rebol (and if we change `//` to division, we go further down this road)
    
    **On rounding**
    
    `R: modulo A B`
    Current implementation of `modulo` tries adding the `R` to each of the arguments `A` and `B`, and compares the sum (`A + R` or `B + R`) with the `A` and `B` themselves, using `=`, a very loose comparison: `1e-20 = 1e-100` holds true. The rationale seems clear: it's floating point, it's got weird artifacts sometimes. An example, R2:
    ```
    >> mod A: 0.15 - 0.05 - 0.10 0.1
    == -1.38777878078145E-17
    >> A < 0
    == true
    ```
    And the description of `mod` says "non-negative". Too bad...
    If we add `0.1` to that, we're still getting the weird result: `0.09999999999999999`. Although valid this time. Since `A` was negative, it's only natural we got something near the divisor `0.1`.
    So, rounding is here to help mitigate the problem.
    But...
    1) I don't really understand the point of comparing with `A` in the first place. At all. We have a restriction: `0 <= |R| < |B|`. So we should compare R to zero and to B.
    2) Comparison should be done with `==` rather than `=` or we won't be able to work at small scales:
    ```
    >> R: modulo 1.5e-20 1e-20
    == 0
    >> R == 0
    == true
    ```
    While I would expect `R == 5e-21`
    Although, I don't think this whole rounding thing will have any tangible compatibility issues, so it should not affect our choices of `mod` and `modulo` rounding modes.
    
    **OK enough about theory.**
    I've prepared a general `modulo` function **for volunteers to test.** And overview the results. Are they satisfying? Expected? Tell me what you think and how better to shape it into a PR.
    https://gitlab.com/snippets/1901617
    
    A note regarding the case when both arguments are vectors, it's not supported right now since `absolute` func does not accept a vector. And I don't see the point in calling it for each vector element: it will totally lose the performance benefits. Rather we should extend `absolute`.

--------------------------------------------------------------------------------

On 2019-10-06T23:49:27Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-538801138>

    Wow. Fantastic work and thinking. The example and graphs earn you 5 stars out of a possible 3. 
    
    - +1 for thinking about vectors.
    - Floats, oh floats. 
    - +1 for `|r|` notation, though I admit having to read the `|r|+|b|` bit a few times. :^)
    - +2 for alt type tests (tuple, time, pair)
    - +0 for `make error! "Wrong"` ;^)
    - Good point on E vs F and negation workaround
    - Good thoughts also on relation to trig funcs
    - Should `/trunc` be `/down` to match `round`?
    
    I get `0.0` for your non-negative `mod` problem example in Red. R2 gives me what you posted though:
    ```
    >> mod A: 0.15 - 0.05 - 0.10 0.1
    == 0.0
    >> mod A: 0.15 - 0.05 + 0.10 0.1
    == 0.0
    ```
    Agreed on lack of tangible effects.
    
    @dockimbel is deep in the cave right now. But maybe @qtxie and @9214 can lure him to the entrance long enough for a snack and their opinions on this.

--------------------------------------------------------------------------------

On 2019-10-07T06:44:06Z, hiiamboris, commented:
<https://github.com/red/red/issues/2433#issuecomment-538860896>

    >     * Should `/trunc` be `/down` to match `round`?
    
    @greggirwin no, here it means *T-definition*, or *gimme a remainder from a division where quotient is defined by truncation `q=trunc(A), R=A-q`*. But we discard the quotient on the assembly level, and deal with the remainder only. So the point is `/trunc` has something in it's name that hints on the algorithm used. It'll ring a bell to those familiar with the wiki page. `/down` will not, so I'd rather not replace the word.
    
    > I get `0.0` for your non-negative `mod` problem example in Red. R2 gives me what you posted though:
    > 
    > ```
    > >> mod A: 0.15 - 0.05 - 0.10 0.1
    > == 0.0
    > >> mod A: 0.15 - 0.05 + 0.10 0.1
    > == 0.0
    > ```
    
    It's the problem of `mold`. The result is the same as in R2 currently:
    ```
    >> R: mod A: 0.15 - 0.05 - 0.10 0.1
    == 0.0
    >> R < 0
    == true
    >> R == -1.3877787807814457E-17
    == true
    ```
    That's the reason I added `>0` `=0` `<0` flags to the test output. Should I raise an issue for `mold` maybe?

--------------------------------------------------------------------------------

On 2020-04-10T19:04:23Z, dockimbel, commented:
<https://github.com/red/red/issues/2433#issuecomment-612173542>

    I have started implementing the changes for this wish ticket, but I've stumbled upon a realization: `//` operator (and underlying function) is just a shortcut to `to-integer divide`. 
    
    So, given how rare are the use-cases for this code pattern, why are we giving it an operator form at all? Why do we even need to wrap such expression in a function?
    
    If we drop that change, then `//` can stay defined as it is, and there is no need for introducing `%%` then. The only change we need to do is make integer division return a float result when needed.

--------------------------------------------------------------------------------

On 2020-04-10T20:01:40Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-612194030>

    I'm fine with dropping integer divide functionality. It can always be added later.
    
    I will see your stakes and raise you one. `%` is only used a couple places in the code base. `//` in a half dozen. We can't say how much user code applies them. How valuable are they? `%` is a lot shorter than `remainder`, to be sure, and intuitively I guessed would be used more. `//` is more specialized. It is used very little in my old 2012 Rebol func counts, and would be an easy search and replace when porting code. I thought `%` would be in more langs than `mod`, but it seems to be a roughly even split.
    
    My argument against keeping `//` as is comes from it looking like a division operator, which is technically is, but being directly aligned with `%` behavior while looking very different. The question is how much value it adds. I doubt anyone has stats on how widely these ops are used across langs, and in what contexts, to weigh their worth.
    
    Side effects of removing `%` and `//`:
    - Simplifies the lexer a tiny bit, and frees up lexical space.
    - One less special char in ops (side note: can we removed `=?` and just use `same?`. I get zero hits for it in Red; not even a single test.)
    - `%` is already used with files and percents. Less potential confusion.

--------------------------------------------------------------------------------

On 2020-04-10T20:27:49Z, hiiamboris, commented:
<https://github.com/red/red/issues/2433#issuecomment-612202878>

    Originally (floored, defined only on integers):
    > The `//` operator will perform an integer division, both the dividend and the divisor must be integer, an integer is returned. The result is calculated as the **floor** of the dividend divided by the divisor.
    
    @dockimbel proposal (truncated, widely defined):
    > `//` operator (and underlying function) is just a shortcut to **`to-integer divide`**.
    
    Another option (adaptable):
    Let `//` with floats to float division, with integers - do integer division (like current `/`)
    
    Are we defining `//` as a divide operation *that always produces an integer* (float // float = int; int // float and float // int too) or a divide operation that does not promote the operands when they are both integers (only int // int)? (what will make more sense?)
    
    And as truncated or floored? (I think truncated)
    
    Are we changing `divide` behavior to align with new `/` or not? (I think we do)
    
    Let's not limit ourselves to just integers though. There's a plan to extend pairs to floats, right? Pretty obvious that integer pairs have a lot of use, and so `pair // divisor` makes sense in this scenario. What about vectors? You can't get away with `to integer! vector`, it has to be `round` of some flavor, with vector support.
    
    @greggirwin I'm using `=?` in 4 places ;) Main reason - operators are 2x faster.

--------------------------------------------------------------------------------

On 2020-04-10T20:45:18Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-612209071>

    > Are we changing divide behavior to align with new / or not? (I think we do)
    
    Great point. Yes.
    
    > I'm using `=?` in 4 places 
    
    I need to remember to say "Ignoring what Boris might be doing..." ;^) That said, how much time do they save (view testing engine, or something else)?
    
    > so pair // divisor makes sense in this scenario
    
    If `//` is `modulo` or integer divide? Floating pairs raises new questions. :^\

--------------------------------------------------------------------------------

On 2020-04-10T21:01:12Z, 9214, commented:
<https://github.com/red/red/issues/2433#issuecomment-612215945>

    I think the most sensible change would be for `/` and `%` to promote the result to `float!` (with fractional part) for `integer!` argument(s), because that's what usually hits people the most; if you need only integral part after that, then you use `to-integer`.
    
    But then it would make e.g. `divide make vector! [1 2 3] 0.2` an exception, since the type of vector elements cannot change (?). Same for `pair!`s and other compound datatypes — should their `integer!` components be promoted to `float!` on division?

--------------------------------------------------------------------------------

On 2020-04-10T21:05:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/2433#issuecomment-612217431>

    > > Are we changing divide behavior to align with new / or not? (I think we do)
    > > I'm using `=?` in 4 places
    >
    > I need to remember to say "Ignoring what Boris might be doing..." ;^) That said, how much time do they save (view testing engine, or something else)?
    
    :D 
    Not a lot, and I could just write `=?: make op! :same?` myself, but then I need a context for that (as doing it every time in a function is meaningless)
    But let me ask the opposite - how much Red wins from *not* having this one-liner alias built in? ;)
    Think also of modules, scripts, gists and snippets we share in the Gitter, i.e. the ability to share your code.
    
    > > so pair // divisor makes sense in this scenario
    >
    > If `//` is `modulo` or integer divide? Floating pairs raises new questions. :^\
    
    I mean the new, divide, behavior will be useful for pair division (pair // number, pair // pair), along with float division.
    
    

--------------------------------------------------------------------------------

On 2020-04-10T21:13:59Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-612220592>

    > But let me ask the opposite - how much Red wins from not having this one-liner alias built in? ;)
    
    Trick question. All the Red that _doesn't_ use it. :^) It's just another of the million little choices we make about what's worth including. It's hard to resist keeping and adding things, or justifying bigger things while pressing to remove tiny bits. Only history will tell where we guess right.

--------------------------------------------------------------------------------

On 2020-04-11T06:46:28Z, toomasv, commented:
<https://github.com/red/red/issues/2433#issuecomment-612347315>

    I may have missed the discussion of it but if `/` is changed into float division and `//` is not changed into integer division, then ~all the code that currently uses `/` on integers (also pairs) needs to be changed `to integer! divide ...`, yes? Thinking of my own coding patterns, this would affect (worse readability) lot of it... especially `repeat`-s and `loop`-s.
    
    Probably too late to come out with proposal to keep `/` as it is and change `//` into float division? (`%` as is and `%%` as current `//`) 

--------------------------------------------------------------------------------

On 2020-04-11T09:46:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/2433#issuecomment-612380626>

    `/` for floats is proposed because that's what people *expect* of it

--------------------------------------------------------------------------------

On 2020-04-11T18:23:45Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-612483292>

    @toomasv this is a big, horrible, wish-we-didn't-have-to breaking change. But better now than later. It should be possible to write a refactoring script, though those are always dangerous to some extent, with a language as flexible as Red. Finding the insertion point for `to integer!` will surely trip over some people's constructs.
    
    A workaround, if we officially drop integer divide, would be for people who need to fix scripts to temporarily patch in their own.
    
    I remember that some original `round` design arguments were based on returning an integer rather than a float, for the exact cases you mention @toomasv, looping and repeating.

--------------------------------------------------------------------------------

On 2020-04-12T06:25:23Z, toomasv, commented:
<https://github.com/red/red/issues/2433#issuecomment-612570804>

    > because that's what people *expect*
    
    If that's the main argument then there should be looots of breaking changes ahead :) 
    
    @greggirwin How about allowing truncated floats for loop-limits?

--------------------------------------------------------------------------------

On 2020-04-12T07:46:52Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-612577672>

    R3 allows `number!` for loop counts, but I don't know if anyone has views on whether it's helped or not. 
    
    Intuitive expectations (often based on other languages) and PoLS (Principle of Least Surprise) fight a constant battle with consistency and correctness. And probably will until the end of time. Worth making a list of the big ones, if we don't already have it. This one just happens to be huge, running up against people's understanding of basic math.

--------------------------------------------------------------------------------

On 2020-04-12T07:49:31Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-612577969>

    I'm saving my bullets for the fight to put `float!`  in the shadows and have an accurate decimal type for more than just money. Even with basic math on my side, it will be bloody.  :^)

--------------------------------------------------------------------------------

On 2020-04-12T08:07:24Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2433#issuecomment-612579645>

    I suspect you'd stand a better chance if you were proposing IEE-754 Decimal64
    ```
    Dec64
    The coefficient is in the range -36028797018963968 .. 36028797018963967. The exponent is in the range -127 .. 127.
    
    IEEE-754 Decimal64
    Decimal64 supports 16 decimal digits of significand and an exponent range of −383 to +384, i.e. ±0.000000000000000×e−383 to ±9.999999999999999×e38
    ```
    
    It is far more likely to get hardware support though it is still extremely unlikely unless IBM build a new processor for their Z-series.
    
    The real problem will be that Float! will still be required to link to many, many external libs and to read files and databases.

--------------------------------------------------------------------------------

On 2020-04-12T14:54:54Z, dockimbel, commented:
<https://github.com/red/red/issues/2433#issuecomment-612628740>

    @toomasv 
    > I may have missed the discussion of it but if / is changed into float division and // is not changed into integer division, then ~all the code that currently uses / on integers (also pairs) needs to be changed to integer! divide ..., yes?
    
    The change will result in `/` returning a `float!` on non-exact divisions between integers (and an `integer!` on exact divisions). Could you please check your scripts to see how many really require strict integer division?

--------------------------------------------------------------------------------

On 2020-04-12T18:32:26Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-612657667>

    @PeterWAWood I'm not saying to remove float entirely, but to make `decimal!` the standard, and use a new notation for literal floats, by adding a leading `~` sigil to them.

--------------------------------------------------------------------------------

On 2020-04-13T08:26:39Z, dockimbel, commented:
<https://github.com/red/red/issues/2433#issuecomment-612805214>

    @greggirwin 
    > I'm saving my bullets for the fight to put `float!` in the shadows and have an accurate decimal type for more than just money. Even with basic math on my side, it will be bloody. :^)
    
    You don't have to. The `decimal!` type name has been reserved for that since the beginning. The hard decisions are about the implementation model and the issues posed by having many number types (maybe a meta type would be needed).

--------------------------------------------------------------------------------

On 2020-04-13T09:57:09Z, bitbegin, commented:
<https://github.com/red/red/issues/2433#issuecomment-612835535>

    https://en.wikipedia.org/wiki/Rounding
    do we need to add rounding-mode for `divide` for `remainder`?

--------------------------------------------------------------------------------

On 2020-04-13T09:59:05Z, bitbegin, commented:
<https://github.com/red/red/issues/2433#issuecomment-612836144>

    `%` for remainder (related to rounding mode), `%%` for modulo (which method to use?)
    `/` for division (related to rounding mode)
    
    well, i just considered integer! cases

--------------------------------------------------------------------------------

On 2020-04-13T18:39:52Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-613034212>

    > You don't have to. The `decimal!` type name has been reserved for that since the beginning. The hard decisions are about the implementation model and the issues posed by having many number types (maybe a meta type would be needed).
    
    That's why I hope we can _try_ Dec64. It may not work out, but it was designed with that specific goal in mind. Ideally, we'd be able to inline Crockford's compiled ASM version. I believe he has it for ARM64 as well now.
    
    OK, back on topic and off to test scripts for integer behavior in a bit.

--------------------------------------------------------------------------------

On 2020-04-13T18:49:54Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-613038621>

    @bitbegin, if I understand your question, there won't be any rounding issues, because you'll now get a float for `int / int`, and `int % int` will still produce an int. The plan is still to leave `%%` out for now.

--------------------------------------------------------------------------------

On 2020-04-13T19:08:18Z, hiiamboris, commented:
<https://github.com/red/red/issues/2433#issuecomment-613046904>

    > The plan is still to leave `%%` out for now.
    
    And use `//` for modulo?

--------------------------------------------------------------------------------

On 2020-04-13T19:20:32Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-613052296>

    @dockimbel 's call. I don't think we'll be hurt by removing both `%` and `//`. We can always add them back in later, but if they're there for a couple more years, it will be more painful to remove them.

--------------------------------------------------------------------------------

On 2020-04-14T14:57:31Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-613492648>

    I've run about a dozen old demos and examples. The only problem I've seen so far is in my requestors experiment, where `draw` is used for alert glyphs, and a couple of them have the font element offset incorrectly. I haven't run that in a long time, so it might not be related to this. It was a hack anyway, as I recall. My math-lab script works fine.

--------------------------------------------------------------------------------

On 2020-04-17T08:44:01Z, nedzadarek, commented:
<https://github.com/red/red/issues/2433#issuecomment-615123549>

    @toomasv What about some one liner that set your `/` into float or integer division?
    ```
    /: :float-division
    ```
    where
    ```
    float-division: make op! function [a b] [(to-float a) / b]
    ```
    You would have to set it once per script and it wouldn't affect other scripts.
    @greggirwin Is it doable? I'm not to date with the Red.

--------------------------------------------------------------------------------

On 2020-04-17T16:23:35Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-615339516>

    @nedzadarek that could be done, but better to fix things in this case, rather than patching around them.

--------------------------------------------------------------------------------

On 2020-04-17T16:42:43Z, 9214, commented:
<https://github.com/red/red/issues/2433#issuecomment-615348889>

    @greggirwin that cannot be done, because it presupposes that all divisible values can be converted to `float!`.

--------------------------------------------------------------------------------

On 2020-04-17T17:39:54Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-615376108>

    I understood it to mean as a patch for existing scripts, which may need time to port for this change. Not as a general rule.

--------------------------------------------------------------------------------

On 2020-04-20T08:21:58Z, nedzadarek, commented:
<https://github.com/red/red/issues/2433#issuecomment-616390312>

    @greggirwin Sadly, I meant it as general rule. 
    @9214 I am sorry that I confused you. I have omitted details because I would probably make mistakes (and that would confuse people even more). 
    I mean that one-liner would set some default behaviours. 

--------------------------------------------------------------------------------

On 2020-04-23T19:39:05Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-618619821>

    @dockimbel any final thoughts on `%` and `//`?

--------------------------------------------------------------------------------

On 2020-04-23T19:55:07Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-618629403>

    Going back to the early Oct messages here, the naming, as with trig funcs, is something we should note for future reference once we decide. The differences are subtle, and knowing when and why each applies will be far from obvious given that we have 3 funcs doing roughly the same thing.

--------------------------------------------------------------------------------

On 2020-04-28T19:47:49Z, 9214, commented:
<https://github.com/red/red/issues/2433#issuecomment-620817606>

    `base-self-test` started to fail after the change.

--------------------------------------------------------------------------------

On 2020-05-14T06:16:18Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-628411812>

    I hope we can wrap this up and put it to bed in 0.6.5.

--------------------------------------------------------------------------------

On 2020-05-14T07:46:06Z, hiiamboris, commented:
<https://github.com/red/red/issues/2433#issuecomment-628455713>

    And what about `modulo` (which is as buggy as it can get and appears under 3 different names)? Is there a plan to fix it?

--------------------------------------------------------------------------------

On 2020-05-14T18:47:02Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-628821306>

    @dockimbel, I come back to your message (https://github.com/red/red/issues/2433#issuecomment-612173542) and mine that follows it. 
    
    @hiiamboris without reading back in more detail, did you have a proposal for fixing `modulo`? I agree that having 3 funcs and 2 ops in this little space, without clear behavior indications, is highly non-optimal.

--------------------------------------------------------------------------------

On 2020-05-14T18:57:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/2433#issuecomment-628827035>

    > @hiiamboris without reading back in more detail, did you have a proposal for fixing `modulo`? I agree that having 3 funcs and 2 ops in this little space, without clear behavior indications, is highly non-optimal.
    
    You even reviewed it https://github.com/red/red/issues/2433#issuecomment-538801138 ;)

--------------------------------------------------------------------------------

On 2020-05-14T19:16:28Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-628836539>

    Thanks. 

--------------------------------------------------------------------------------

On 2020-07-16T21:38:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/2433#issuecomment-659688896>

    [Working implementation is now here](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/modulo.red)

--------------------------------------------------------------------------------

On 2020-07-17T23:51:57Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-660384583>

    :+1: Suggest `/down`  instead of `/trunc` to match `round`.
    
    @dockimbel, thoughts on comments here since April and Boris' version?

--------------------------------------------------------------------------------

On 2020-07-18T09:38:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/2433#issuecomment-660457092>

    > Suggest /down instead of /trunc to match round.
    
    I'd rather change `round` here, as in my mind /down reads as "something less than", thus as /floor, which makes /down confusing as the docstring also says it's truncation: `     /down        => Round toward zero, ignoring discarded digits. (truncate).`
    
    [Moreover, Wikipedia says "rounding down" is synonymous with "flooring](https://en.wikipedia.org/wiki/Rounding#Rounding_down):
    ![](https://i.gyazo.com/abb46b54f7db955b4ee68cb435ae23c4.png)
    
    Excel is probably the source of confusion, as it's ROUNDDOWN function rounds *towards zero* instead.
    
    But personally I stand with mathematicians here and Wikipedia ;)

--------------------------------------------------------------------------------

On 2020-07-18T22:28:00Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-660551441>

    I will hazard a guess that the vast majority of non-mathematicians will think of `down/up` as `toward/away-from` zero. If you ask a mathematician, at least some may ask in return what you mean more specifically. ;^) Do most people think in terms relative to infinity or zero?
    
    Given that there are names for `truncate/ceiling/floor`, but not "away from zero" (ignoring Buzz Lightyear jokes), and that the latter is the default, let's look at two formulations:
    
    What we have now:
    ```
    DESCRIPTION: 
         Returns the nearest integer. Halves round up (away from zero) by default. 
    
    REFINEMENTS:
         /to          => Return the nearest multiple of the scale parameter.
            scale        [number! money! time!] "Must be a non-zero value."
         /even        => Halves round toward even results.
         /down        => Round toward zero, ignoring discarded digits. (truncate).
         /half-down   => Halves round toward zero.
         /floor       => Round in negative direction.
         /ceiling     => Round in positive direction.
         /half-ceiling => Halves round in positive direction.
    ```
    
    And if we go the mathematical direction:
    ```
    DESCRIPTION: 
         Returns the nearest integer. Halves round toward infinity by default. 
    
    REFINEMENTS:
         /to          => Return the nearest multiple of the scale parameter.
            scale        [number! money! time!] "Must be a non-zero value."
         /even        => Halves round toward even results.
         /trunc       => Round away from infinity, ignoring discarded digits.
         /half-trunc  => Halves round away from infinity.
         /floor       => Round toward negative infinity.
         /ceiling     => Round toward positive infinity.
         /half-ceiling => Halves round toward positive infinity.
    ```
    
    A) `up means away from zero, down is the opposite of up, and if you need ceiling or floor you know what you're doing.`
    
    B) `up means toward positive infinity, floor is the opposite of up, trunc means toward zero, and the default is the opposite of trunc.`
    
    I vote for A.

--------------------------------------------------------------------------------

On 2020-07-19T09:27:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/2433#issuecomment-660615695>

    `/zero       => Truncate (round toward zero)`
    `/half-zero  => Halves round toward zero.`
    ?
    
    > the default is the opposite of trunc.
    
    Not true. Default is the opposite of `/half-down`.

--------------------------------------------------------------------------------

On 2020-07-19T14:43:34Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-660655692>

    OK, but it would be "Default is the opposite of `/half-trunc`." if we change `down` to `trunc`.

--------------------------------------------------------------------------------

On 2021-09-27T21:29:24Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-928298920>

    @dockimbel ping. I'd love for this ticket to get closed once and for all.

--------------------------------------------------------------------------------

On 2021-09-28T04:20:24Z, toomasv, commented:
<https://github.com/red/red/issues/2433#issuecomment-928769884>

    Nitpicking: strictly speaking, you can't go "away from infinity" on number line; always towards infinity.
    I support existing solution.

--------------------------------------------------------------------------------

On 2022-05-15T18:41:44Z, greggirwin, commented:
<https://github.com/red/red/issues/2433#issuecomment-1126994152>

    @dockimbel ping.

