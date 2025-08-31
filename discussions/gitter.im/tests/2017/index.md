# Archived messages from: [gitter.im/red/tests](/gitter.im/red/tests/) from year: 2017

## Sunday 16th April, 2017

greggirwin

[17:57](#msg58f3b06fbdf4acc11265f7db)I'm adding a suite for percent tests, derived from %float-test.red. Since there are a lot of magic numbers in there, should we expect results to be the same (accounting for scale), or are there different limits and special cases we need to put in place?

[17:59](#msg58f3b0fcf22385553d48934d)As an example, `1.#INF` comparisons fail, but match in the console. e.g.

```
>> strict-equal? 1.#INF 1.7976931348623157e+308% - -1.7976931348623157e+308%
== false
>> equal? 1.#INF 1.7976931348623157e+308% - -1.7976931348623157e+308%
== false
>> equal? 1.#INF 1.7976931348623157e+310% - -1.7976931348623157e+310%
== true
>> strict-equal? 1.#INF 1.7976931348623157e+310% - -1.7976931348623157e+310%
== false
>> 1.7976931348623157e+310% - -1.7976931348623157e+310%
== 1.#INF
>> 1.7976931348623157e+308% - -1.7976931348623157e+308%
== 1.#INF
```

E+308 was in float tests.

Or should we not tie tests to percent being a float in its current incarnation?

[18:08](#msg58f3b31f8fcce56b200a0190)If I know what to do with 1.7976931348623157e+308 and 2.2250738585072014e-308, and if that solves the INF issues, the number of failed tests should drop dramatically.

[18:13](#msg58f3b42e8e4b63533dd4a7e2)5.562684646268003e-309 is another one.

## Monday 17th April, 2017

PeterWAWood

[00:38](#msg58f40e99f22385553d49dd92)@greggirwin I think it would be better not to duplicate the float tests as percent tests. The float tests will test the underlying implementation. I think it is only necessary to test the scaling by a 100 and a single test of each arithmetic operator. I believe it is safe to assume that arithmetic operators will perform correctly in all cases if one test succeeds.

[00:40](#msg58f40eec4cb8d0917398dc88)@dockimbel @greggirwin Personally I feel that scientific notation should not be allowed for

```
percent!
```

values. It seems unnatural, I've never seen a percent written using scientific notation.

dockimbel

[08:02](#msg58f4769c881b89e1015a380f)@PeterWAWood Agreed, but what's the alternative?

PeterWAWood

[08:38](#msg58f47ef8f22385553d4b32c7)In everyday use percentages have a very limited value range and precision. I believe they are used as a presentation aid rather than to express numbers accurately. Most typically, the maximum percents used are hundreds. Two decimal places is common, three used on occasion, percents with four decimal places are real rarity.

[08:42](#msg58f47fedd32c6f2f091288f0)I know that will mean a little extra processing but you could consider it the price that the programmer pays for not having to multiply by 100. 😀

greggirwin

[16:15](#msg58f4ea078e4b63533dd8e1f0)I agree that percents are usually a much more limited range, and also never use E notation. Money values have a much larger normal range, but should also never use E notation when formed (when that time comes). Percents can still support a fairly wide range, and artificial limitations lifted if a need is shown. I'm OK with the current implementation for some time though.

[16:17](#msg58f4eaab0ed3020c382586c6)A mentor of mine (Tom at iBEAM, Peter) would often say "Can we fix it with language?" when talking about a product feature. I think we can here, for now. We just say percents are valid from M to N (limits), and will be auto rounded to 4 decimal places (currently solves the E issue in forming). Values outside the supported range are undefined in their behavior (or we throw an error when trying to create them).

[16:19](#msg58f4eafb8bb56c2d11b74e99)The only downside I can think of is if you want to press them into service in a dialect, where you want full float/decimal range support, but differentiated. I'm OK with that constraint as well though. Constraints are powerful things, and very helpful.

## Tuesday 18th April, 2017

dockimbel

[07:02](#msg58f5b9f1d32c6f2f09174efd)Two remarks on that topic:  
\* Adding constraints when not strictly necessary means more code branches, more tests, and more rules to remember for the users (us including).  
\* As @greggirwin pointed out, we often allow broader usage for many datatypes than their original intended purpose, in order to cover more grounds for dialects (though, for the percent specific case, it's probably harder to repurpose it in a dialect, as it's a divide by 100 number).

[07:03](#msg58f5ba45ad849bcf42953925)Though, excluding scientific notation for percents at lexer level would be quite simple, but for serialization, I don't see how we can restrict is without restricting the percent range itself.

greggirwin

[08:06](#msg58f5c90408c00c092a8f7429)I'm not saying we should put any constraints in the code, only in the user's mind.

## Tuesday 2nd May, 2017

greggirwin

[14:57](#msg59089e5cedf919574a6cd69d)Adding tests for new `even?/odd?` on time values (PR fixed), we have `tb4-t: -1:-0:-0` in the tests, but that seems to be invalid syntax now. Invalid integer thrown. Should we remove that, or is it a regression?

[18:56](#msg5908d653f22385553d9a300c)I also don't know if this is a regression:

```
>> tb3-t: 2147483645:59:59
== 2147483645:59:58.9997406
```

[18:56](#msg5908d67bedf919574a6dff1d)A number of Rudolph's time tests are failing as well.

[19:04](#msg5908d834881b89e101a8eef5)Looks like I need to fix my `even?/odd?` PR for negative times too.

[20:03](#msg5908e6148e4b63533d267d8e)Thought I'd just use `round`, but trying that real quick I'm missing something fundamental in R/S:

```
even?: func [
		tm		[red-time!]
		return: [logic!]
		/local
			t [float!]
	][
		tm: round tm 1.0 no yes no no no no		; yes is down? slot
		t: tm/time
		not as-logic (as integer! GET_SECONDS(t)) and 1
	]
```

produces:

```
*** Compilation Error: argument type mismatch on calling: red/time/round
*** expected: [struct! [
        header [integer!]
        padding [integer!]
        value [float!]
    ]], found: [float!]
```

## Wednesday 3th May, 2017

meijeru

[06:26](#msg590978208bb56c2d1106b730)The second argument to `round` should be a `red-float!` not a `float!`

[06:27](#msg590978365e61bd94342a43ce)so you have to pack `1.0` into a `struct!`

greggirwin

[16:51](#msg590a0a828e4b63533d2b3c73)Ahhh, just couldn't see it. Thanks Rudolf. I got it stuck in my head that it was my time struct.

[16:51](#msg590a0a8dedf919574a731e1e)Now the question is whether that's the better way to do it.

## Thursday 4th May, 2017

geekyi

[08:04](#msg590ae082edf919574a764b2e)Ah, I get it, semantics. When in Rome.. ah `Red/System` use `Red/System` data structures? Unless it requires (un)boxing or other conversions

## Monday 18th September, 2017

mahengyang

[06:56](#msg59bf6e191081499f1f45641e) @greggirwin I made this issue last week #3034 , it’s strange that when run `power-test.red`

```
$ red interp-power-test.red
```

output:

```
~~~started test~~~ interp-power
~~~finished test~~~  interp-power
  Number of Tests Performed:      10
  Number of Assertions Performed: 12
  Number of Assertions Passed:    12
  Number of Assertions Failed:    0
```

but when run `rebol -qws run-all.r —batch`, two error in quik-test.log

```
===group=== power error
 --test-- power-error-2 FAILED**************
 --test-- power-error-2 FAILED**************
```

PeterWAWood

[07:57](#msg59bf7c5e614889d4750ff7d7)@mahengyang See #3039 and take a look at the comments on #3034.

mahengyang

[07:59](#msg59bf7cf0cfeed2eb6521bf98)OK, I know, So I need wait #3039 fixed, then make a new PR?

## Tuesday 19th September, 2017

PeterWAWood

[07:34](#msg59c0c898210ac269204b88b3)@mahengyang #3039 is fixed :-)

[07:35](#msg59c0c8a51081499f1f4c068d)It would be great if you could make a new PR.

mahengyang

[07:35](#msg59c0c8b57b7d98d30d11e3d5)ok,

[09:50](#msg59c0e84fcfeed2eb6528cce3)@PeterWAWood I saw a card named `Write tests for functions in environment/function.red` in trello test board, there has no test code for `environment/function.red`, I plan to do this, is that ok?

PeterWAWood

[11:09](#msg59c0fad91081499f1f4cf870)@mahengyang I think that would be good. There is a chance that environment/function.red could be moved or changed when Red 0.8.0 is released, but that is some way off.

The file should be red/tests/source/environment/function-test.red.

## Wednesday 20th September, 2017

PeterWAWood

[01:54](#msg59c1ca4c7b7d98d30d170fc5)@mahengyang If you can, would you mind rebasing #3034?

mahengyang

[01:54](#msg59c1ca5b614889d4751b856b)ok

## Saturday 23th September, 2017

maximvl

[11:27](#msg59c6450c177fb9fe7ef441cf)something strange here:

```
--test-- "series-find-76"  
		hs-fd-1: make hash! [2 3 5 test #"A" a/b 5 "tesT"]
		append hs-fd-1 datatype!
		--assert 3 = index? find hs-fd-1 5
```

[11:27](#msg59c64524b59d55b8232bee1d)some cryptic append which doesn't affect anything

## Monday 25th September, 2017

dockimbel

[16:11](#msg59c92abcbc4647297473a0d8)@maximvl Indeed. You can use `git blame` to retrieve the author of this test.

## Tuesday 26th September, 2017

mahengyang

[08:47](#msg59ca1421177fb9fe7e03072b)I’m write test for `functions.red`, how to write test for `quit` func

```
quit: func [
	"Stops evaluation and exits the program"
	/return status	[integer!] "Return an exit status"
][
	#if config/OS <> 'Windows [
		if system/console [system/console/terminate]
	]
	quit-return any [status 0]
]
```

and `??` func

```
??: func [
	"Prints a word and the value it refers to (molded)"
	'value [word! path!]
][
	prin mold :value
	prin ": "
	print either value? :value [mold get/any :value]["unset!"]
]
```

[08:48](#msg59ca144bf7299e8f537285f4)seems need to get `stander output`

PeterWAWood

[10:11](#msg59ca27ba210ac26920722bea)@mahengyang To test the `quit` you need to "stub out" `quit-return`. Something like this:

```
--test "quit-1"
    save-quit-return: :quit-return
    quit-return: func [/return status][any [status 0]
    --assert 0 = quit
    quit-return: :save-quit-return
```

It doesn't test quit-return but it is better than no tests.

mahengyang

[10:13](#msg59ca283532fc8b7e403f7938)ok, I try `call/output “red [] quit 2” out`, seems no use

PeterWAWood

[10:15](#msg59ca28c9cfeed2eb654f92e9)You can use a similar technique to check standard out though it is a little more complicated:

```
--test "??-1"
    save-print: \:print
    save-prin: \:prin 
    ??output: copy ""
    print: function[val][append ??output reduce value]
    ??-1-a: 1
    ?? ??-1-a
    --assert none <> find ??output "??-1-a: 1"
   print: \:save-print
   prin: \:save-prin
```

dockimbel

[10:18](#msg59ca2990bc4647297478019b)@PeterWAWood Typing on a phone? :-)

PeterWAWood

[10:23](#msg59ca2abcbc464729747805cd)No just using some not so intelligent HTML5 editor that converts : p r i n t into :p

It makes you wonder about the people who write such code. It's the same with VS Code. It continuously requests to be updated because the author didn't think that people would run it on a non-admin account. It's quite pathetic.

I don't know how people come to the conclusion that native apps are dead.

[10:26](#msg59ca2b3d177fb9fe7e0371e3)@mahengyang It is possible to check sysout if you write the tests in Rebol. Once we are able to remove the Rebol dependancy in the tests, I should be able to provide so better features to interrogate sysout.

## Wednesday 27th September, 2017

mahengyang

[06:05](#msg59cb3fb2bac826f054038958)@PeterWAWood but my computer is mac, this code

```
#if config/OS <> 'Windows [
        if system/console [system/console/terminate]
    ]
```

makes effect

PeterWAWood

[08:35](#msg59cb62c1177fb9fe7e0a1dd4)@mahengyang Don't worry about that code. Writing a test of `quit` will be difficult at this stage.

We can come up with some tests for `call` later.

mahengyang

[08:36](#msg59cb6312bac826f054044181)OK, I skip it write other func test

## Thursday 28th September, 2017

mahengyang

[07:57](#msg59ccab6a177fb9fe7e112905)`context: func [spec [block!]][make object! spec]`

[07:57](#msg59ccab74b59d55b823487dea)how to test this func?

[07:58](#msg59ccabb5f7299e8f53806eff)where is it usage?

PeterWAWood

[08:09](#msg59ccae1d7b7d98d30d47441f)It is simply shorthand for `make object!` so `o: context [a: 1 b: 2]` is the same as `o: make object! [a: 1 b: 2]`.

mahengyang

[08:10](#msg59ccae5d614889d4754ba482)ok

PeterWAWood

[08:12](#msg59ccaeeb32fc8b7e404ce8da)All that is needed is one test to check that `context` correctly makes an object. Something like this:

```
--test-- "context-1"
    c1-c: context [a: 1 b: "345" f: function []["Okay"]]
    --assert c1-c/a = 1
    --assert c1-c/b = "345"
    --assert "Okay" = c1-c/f
    --assert Object! = type? c1-c
```

mahengyang

[08:13](#msg59ccaf17614889d4754ba7e8)thks

## Friday 13th October, 2017

mahengyang

[09:06](#msg59e081f9e44c43700a29dbf0)@PeterWAWood tests for `envrionment/functions.red` has already completed, but I do not know how to run it, I add `../environment/functions-test.red` into `tests/source/units/all-tests.txt`, then run command `$ rebol -s run-all.r`, got some error:

```
** Access Error: Cannot open /Users/ma/puffin/red.git/tests/source/units/auto-tests/interp-../environment/functions-test.red
** Where: write-test-header
** Near: write file-out tests
```

there is no file names `tests/source/units/auto-tests/functions-test.red`,

[09:10](#msg59e0831ee44c43700a29e285)I have read `run-all.r`, found real action in `tests/source/units/run-all-init.r`

```
;; make auto files if needed
do %make-red-auto-tests.r
do %make-interpreter-auto-tests.r

;; build run-all-comp.red and run-all-interp.red
do %make-run-all-red.r

;; build the each test runners
do %make-run-each-runner.r
```

this file:`make-interpreter-auto-tests.r`, seems generate lots of files under the directory `auto-tests`

PeterWAWood

[10:08](#msg59e0908b177fb9fe7e72aa2f)`make-interpreter-auto-tests.r` can currently only handle files in \`tests/source/units' or sub-directory of it. I will need to take a look at it to work out how to handle files in other dirs.

[10:09](#msg59e090ccbbbf9f1a38571437)I don't have time to do that at the moment. I will try to make time on Monday or Tuesday next week.

## Monday 16th October, 2017

mahengyang

[03:37](#msg59e429865c40c1ba79a61f26)

```
...using libRedRT built on 13-Oct-2017/16:05:50+8:00
*** Compilation Error: a routine must have a name
*** near: [routine [1] [2]]
```

test code:

```
rt-1: try [routine [1] [2]]
	--assert error? rt-1
```

I got this error when do unit test, any body knows how to use routine

[03:39](#msg59e42a00e44c43700a39cc46)source code for routine

```
routine: func [spec [block!] body [block!]][
	cause-error 'internal 'routines []
]
```

seems just throw an error?

[03:41](#msg59e42a575c40c1ba79a62211)@PeterWAWood I had solved the problem about `../environment/functions-test.red`in `all-tests.txt`

[03:43](#msg59e42af4f7299e8f53f0b23d)by alter `make-interpreter-auto-tests.r` and `make-run-all-red.r`, they generate so many files in `auto-tests` and `auto-tests/run-all` folders, a little complex

[09:09](#msg59e4773701110b7231bfdc8b)routine already had a test named `routine-test.red`, so I just delete routine test in my `functions-test.red`

greggirwin

[17:31](#msg59e4ed055c40c1ba79aa769e)What happens if you do it this way?

```
try [rt-1: routine [1] [2]]
```

[17:38](#msg59e4ee8a614889d475c0c8c7)`Try` seems to be the issue, though your spec block isn't valid either. If you put the `try` around it (`try [rt-1: routine [a] [a]]`), you get:

```
...using libRedRT built on 16-Oct-2017/11:33:11-6:00

*** Compilation Error: declaring a function at this level is not allowed 
*** near: [
    rt-1: func [a] [a] 
    stack/mark-native ~set 
    word/push ~rt-1
]
```

[17:39](#msg59e4eedb614889d475c0ca27)I'll let @PeterWAWood comment on how best to catch compiler errors in the test suite, since `try` will hide the actual error here.

## Tuesday 17th October, 2017

mahengyang

[08:49](#msg59e5c43401110b7231c6df07)

```
===group=== fifth tests
--test-- fifth-3 FAILED**************
~~~finished test~~~  run-all-interp
  Number of Tests Performed:      5531
  Number of Assertions Performed: 9633
  Number of Assertions Passed:    9632
  Number of Assertions Failed:    1
****************TEST FAILURES****************
```

but the test code is very simple `--test-- "fifth-3" --assert 5 = fifth 1.2.3.4.5`

[08:55](#msg59e5c58f210ac26920f72312)by the way, what is the difference between `run-all-comp1` and `run-all-interp`?  
the `fifth-3` test successed in `run-all-comp1`, but failed when run `run-all-interp`

PeterWAWood

[23:39](#msg59e694c5210ac26920fbeebf)Sorry I am very busy at the moment and don't have much spare time.

[23:45](#msg59e69602b20c64242916261f)"what is the difference between run-all-comp1 and run-all-interp?"

`run-all-comp1` and `run-all-comp2` contain all the compiled tests.  
`run-all-interp` contains all the tests compiled but to run using the interpreter rather than compiled code.

The purpose is to test both the compiler and the interpreter.

Some tests will not run under the compiler, some will not run under the interpreter. (These tests need to be identified and protected either by using the pre-processor or checking at runtime whether the code is being interpreted or not.)

[23:52](#msg59e697a9614889d475c9e1a4)`--test-- "fifth-3" --assert 5 = fifth 1.2.3.4.5` - I checked against the latest master and this should work. The most likely reason for this failing is that `fifth` has been set in another test.

[23:56](#msg59e698aae44c43700a4735c9)The current compiler (written in Rebol) stops when it encounters an error. This means we would need to have a separate compilation for every compiler error. If we did that the tests would take far too long to run. As a result, we don't have any tests that the compiler correctly reports errors.

[23:58](#msg59e699315c40c1ba79b393fb)I still need to look at running tests from the tests/source/environment directory. In addition to making them work in `run-all.r`, we need them to work in `build-arm-tests.r`.

## Wednesday 18th October, 2017

PeterWAWood

[00:02](#msg59e69a0332e080696ef2ad80)The current structure of the tests and the scripts to run them is very messy. This is mainly due to the way they have evolved over time. Thankfully `quick-test.red` and `quick-test.reds` seem to work very well. We need to completely overhaul "test running" though.

[00:04](#msg59e69a80f7299e8f53fdebd6)We will write the new test runners in Red rather than Rebol. I hope that we can a new test runner can be included in the 0.7.0 release.
