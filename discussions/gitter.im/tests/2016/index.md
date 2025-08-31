# Archived messages from: [gitter.im/red/tests](/gitter.im/red/tests/) from year: 2016

## Friday 3th June, 2016

greggirwin

[23:03](#msg57520cb1813c217c21da03bd)It's not a showstopper, by any means, but if I have a test name (in quick-test) that is non-printable, nothing shows up in the output for it. e.g. `"^A"`. I don't have a great solution, since MOLDing would make the output for normal names less readable, so maybe just something to note in the docs.

[23:03](#msg57520cd3e96484d0692f71cc)Why would I do that, you ask? I just took the test input and mapped it over directly.

PeterWAWood

[23:08](#msg57520dd8e8163f872c4dd627)@greggirwin The main purposes of the test name are firstly to break up the code so that it is clear where each test starts. Secondly, it is so that you can search for the name of a failing test in your editor so that you don't have to scroll up and down a long file searching for it. (Even if you choose to do the latter, having a readable name is a help).

greggirwin

[23:09](#msg57520e19e96484d0692f7218)Also, for porting purposes, from Rebol, we should note somewhere that the #"^~" literal isn't in Red.

[23:10](#msg57520e7d1097267921302cc6)Right, so if nothing shows up in the test name, I can't easily search for it. e.g.

```
===group=== CRC32 tests
--test--  FAILED**************
--test--  FAILED**************
--test--  FAILED**************
--test-- ^~ FAILED**************
```

PeterWAWood

[23:12](#msg57520ee8e8163f872c4dd657)Exactly. It's not so bad when you've written the tests yourself but when a test fails a few years down the line it makes it difficult for the person who has to fix it.

greggirwin

[23:16](#msg57520fdb9be9c5b637f04c57)Is the standard way to test for expected errors `error? try [...]`?

PeterWAWood

[23:18](#msg57521040813c217c21da0483)I don't think we have a standard yet ... I think that's good.

greggirwin

[23:20](#msg575210aae8163f872c4dd6b4)OK, thanks.

## Tuesday 14th June, 2016

iArnold

[15:36](#msg5760246352352c840281ee7c)In tests/source/units/debase-test.red there is a multi-line string using \\n as newline character, but newline is #"^/" in Rebol and Red? As I see the multiline string used now it is just a string with the characters #"\\" and #"n" put in this sequence. Is this correct?

greggirwin

[16:42](#msg576033fcf191398330a05de3)I think it's an error Arnold. Good catch. I had a couple formatting things in checksum tests as well, when pulling standard test vectors.

## Wednesday 15th June, 2016

PeterWAWood

[01:22](#msg5760adb97a851b587e6ed119)@iArnold The tests in debase-test.red are correct. The binary string to "debase" was created in Ruby which uses \\n for newline. The content of the string may appear misleading though.

## Tuesday 21st June, 2016

greggirwin

[05:15](#msg5768cd853881bc405b6f6144)Peter, for tests that fail because something isn't supported in Red yet, is the correct thing to include them, knowing they'll choke the test (not just fail the assertion)?

[05:19](#msg5768ce5d3881bc405b6f616c)And do lexing tests have to be done as they are for the lexer itself? e.g.  
`--assert error? try [tb-e1-t: -1:-1:-0]` won't compile because it's a syntax error now, so it seems you have to test for loadabilty.

[06:18](#msg5768dc22bd67400679db901f)Do you like the `compose` approach better here Steeve?  
https://gist.github.com/greggirwin/95a74f7e9cc8ab62f9e5db7183ba38e3

PeterWAWood

[06:28](#msg5768de9cbd67400679db90ae)@greggirwin The current process for both failing and crashing tests where the require added functionality or a very time-consuming change is:  
1\. Comment out the test  
2\. Raise an issue if appropriate (i.e. not requiring functionality that is planned in a future release).  
3\. Add an entry to the \[Trello commented tests card](https://trello.com/c/Y6fAZobh/136-commented-tests).

[06:35](#msg5768e01cfeaf6cd222ad9a50)@greggirwin The approach that I have taken to "lexer" tests is to have all the "error" cases in a single file using

```
error? try[]
```

. I'm not sure that this is the correct approach but it is practical. Most of the Red tests were written before Red had any error handling. (Each error check needed a separate compile which wasn't practical so most Red tests have no error checking.]

The lexer tests are in load-test.red as it is easier to test the lexer via load than it is directly.

[06:36](#msg5768e05afeaf6cd222ad9a61)@greggirwin I think you may have posted your bubbles in the wrong channel.

dockimbel

[07:25](#msg5768ebe72a4cd63745eb76c6)@PeterWAWood Using `try` and putting all the lexer tests in the same file is the best option.

[07:26](#msg5768ec1bf0528c4c5bbb13db)\*The lexer tests are in load-test.red as it is easier to test the lexer via load than it is directly.* Remember that there are 2 lexers, one for the compiler, one for the runtime, both need to pass the same tests.

PeterWAWood

[09:30](#msg57690930a82a6b0079a7b110)I had two lexer tests, one for the Rebol lexer and one for the Red lexer. The one for the Red lexer only had a few tests and wasn't included in

```
run-all
```

.

Once the comparison and to matrices are completed, I'll re-do the lexer tests in a way that we have one set of tests rather than two.

[09:37](#msg57690af14227fdc922992085)@dockimbel I think we are getting pretty close to the stage when quick-test can be re-written in Red. It would be good if the tests could be run by people without them having to install Rebol. (For example, generating the auto-tests on ARM gives different expected results than on Intel).

[09:44](#msg57690c6b2a4cd63745eb830a)There are two issues with a Rebol free quick-test:  
1\. The current auto-test mechanism will need to be changed: there is no value in generating expected values in Red. I think we will need to generate such tests outside of the test run and store them in the repo.  
2\. There are some remaining Rebol test scripts. What I suggest here is that we create another script that is run separately from

```
run-all
```

that the team and travis (and people with Rebol installed) can run,

dockimbel

[09:45](#msg57690cbbbd67400679dba01e)Agree on your two point. But we still need first a proper CALL support for Windows in Red before rewritting QT, don't you think so?

PeterWAWood

[09:46](#msg57690cef6577f032450d3727)Yes but I'm hoping that will be included in Red 0.7.0.

[09:46](#msg57690d0b6577f032450d3736)(I'm not thinking of starting tomorrow :-) }.

[09:49](#msg57690da34227fdc9229921b4)A further thing to consider about generated tests is that when we come to bigint! , bignum!, hashes, encryption,etc. it is not really possible to generate expected results in Rebol. Which languages would you be happy for me to use to generate expected results in those cases?

dockimbel

[09:52](#msg57690e4c6577f032450d37b7)Maybe we can just query Wolfram Alpha for those math-oriented tests, so we don't need to install any other toolchain.

PeterWAWood

[09:56](#msg57690f3ffeaf6cd222adab23)I can give that a try

greggirwin

[14:02](#msg576948e980f1c6a5257d552c)Thanks Peter. For time! expected lex errors, I'll leave them commented out for now.

[14:57](#msg576955f5c417e36c69e4bf30)"Raise an issue if appropriate (i.e. not requiring functionality that is planned in a future release)."

For things like `first` not working on `time!` yet, should I leave those in and raise issues, or put `try` around them so they don't crash?

dockimbel

[14:59](#msg57695641fac963084de1d74e)Just comment them and open a ticket. I forgot that PICK was working on time! values too.

greggirwin

[14:59](#msg576956626c39b965695f06d0)OK.

dockimbel

[14:59](#msg576956662c45709c2d2085b5)From R3:

```
>> help "time!"
Found these related words:
   abs             action!   Returns the absolute value.
   absolute        action!   Returns the absolute value.
   even?           action!   Returns TRUE if the number is even.
   lib             object!   [end! unset! none! logic! integer! decimal! p...
   mod             function! Compute a nonnegative remainder of A divided ...
   modulo          function! Wrapper for MOD that handles errors like REMA...
   negate          action!   Changes the sign of a number.
   negative?       native!   Returns TRUE if the number is negative.
   odd?            action!   Returns TRUE if the number is odd.
   pick            action!   Returns the value at the specified position.
   positive?       native!   Returns TRUE if the value is positive.
   round           action!   Rounds a numeric value; halves round up (away...
   sign?           function! Returns sign of number as 1, 0, or -1 (to use...
   time!           datatype! time of day or duration
   to-time         function! Converts to time! value.
   wait            native!   Waits for a duration, port, or both.
```

[15:00](#msg576956a2648385b8074c32f5)So, we need: abs, absolute, even?, mod, modulo, negate, negative?, odd?, pick, positive?, round, sign?. ROUND should be supported already, for the others, most of them are still missing.

greggirwin

[15:02](#msg576956ed5ba3ccaa25b631b6)I have tests for a lot of those in there, just haven't gotten the others out of the way to see them fail.

[15:02](#msg57695709c7594b5f0dd12d73)We don't have `abs` at all yet.

[15:03](#msg5769574d6c39b965695f0754)`zero?` needed too.

[15:04](#msg576957782554bbe049ba16e0)And `min/max`

dockimbel

[15:04](#msg576957843b4cb66870349ee5)Isn't `abs` just an alias on `absolute`?

greggirwin

[15:05](#msg576957a9c7594b5f0dd12dc7)Yes, but it isn't there today.

dockimbel

[15:06](#msg576958073b4cb66870349ef2)If it's just an alias, then no need to test it, just use `absolute`.

greggirwin

[15:08](#msg5769585480f1c6a5257d5e01)I posted some `sign?` versions in the mezz group some time back. Did you want that at the mezz level, or native?

dockimbel

[15:26](#msg57695ca22c45709c2d208627)I would prefer math-oriented functions to be native in general.

## Wednesday 22nd June, 2016

greggirwin

[06:11](#msg576a2c056c39b965695f50b2)Well, I got a native `sign?` func working, but I really have \*\*no\** idea what I'm doing in /System. :pensive: I know others are doing stuff, and I did somehow get `checksum` done, but I just cast about (no pun intended) without any real idea of how it all ties together. Is there a secret primer somewhere? For example, I had no idea there was an `init` at the end of %natives.reds, not sure where order is important in lists or not.

My fear is that I'll create latent issues out of ignorance, and cost you more time in reviewing than I save in writing the code. Mezzanines? I'm all over those. :^)

[06:22](#msg576a2e9dc7594b5f0dd178ab)Also, `zero?` is a mezzanine right now. Just FYI.

dockimbel

[07:49](#msg576a43112554bbe049ba6672)`zero?` should be moved to a native at some point.

[07:51](#msg576a438ac7061d590d529e07)@greggirwin Order matters in those tables (all datatypes are also using them). I wish I could find time to write an introductory documentation to the Red runtime API...

SteeveGit

[08:37](#msg576a4e56fac963084de1de24)About native ones. `within?` would also be a good candidate, since I use it extensilvely in my text-area widget. Notice, there is nothing urgent, perfs are good as they are in interpreted mode (nothing is compiled), and a lot of things are not optimized in my code currently.

[08:45](#msg576a502ffac963084de1de27)At some point, I will write it myself if not already done by another contributor ;-)

iArnold

[08:48](#msg576a50d12554bbe049ba6b27)&gt; Well, I got a native `sign?` func working, but I really have \*\*no\** idea what I'm doing in /System. :pensive: I know others are doing stuff, and I did somehow get `checksum` done, but I just cast about (no pun intended) without any real idea of how it all ties together. Is there a secret primer somewhere? For example, I had no idea there was an `init` at the end of %natives.reds, not sure where order is important in lists or not.

That is why I posted my DETAB adventure on the ML.. https://mail.google.com/mail/u/0/#label/Red-Script/1552fdcd66966955

[11:09](#msg576a71e780f1c6a5257dbd0d)And why I started https://github.com/iArnold/reddevdoc

greggirwin

[15:43](#msg576ab2065ba3ccaa25b6b35f)@dockimbel I was hoping some other Redster had learned the hard way and would save me. I know you're beyond busy.

dockimbel

[15:55](#msg576ab50e3b4cb6687034a89a)There are some who learned it pretty well, just from the sources and from the commits history.

greggirwin

[15:56](#msg576ab52d0ede04dc4903cf8a)In the meantime, even for things that should eventually be natives, is it better to provide mezz versions now, to be replaced, or just leave them to be done natively?

dockimbel

[15:58](#msg576ab59c3b4cb6687034a89f)The internal API is also not in its final state, so that's another reason I'm reluctant to invest time to document it. Though, 0.6.2 should bring a first cleaned up version, so I guess I will document a bit some of the core functions. Also things like the Red stack usage and API will probably change once the `dyn-stack` branch will be completed.

greggirwin

[15:59](#msg576ab5ed6c39b965695f8d39)All makes sense.

dockimbel

[16:00](#msg576ab602648385b8074c3cba)Mezz vs natives: depends, it's a case by case weightening between code footprint (mezz have a bigger footprint than natives usually once compiled), performance requirements, easy maintenance, etc...

greggirwin

[16:01](#msg576ab6670ede04dc4903d040)I just mean to get the functionality in there quickly and easily. It looks like `sign?` is ~10x faster as a native when compiled, so will be worth it eventually. Depends, too, on whether you think they'll be called in tight loops.

dockimbel

[16:02](#msg576ab67bfac963084de1e102)Once 0.6.2 will be done, adding much more code to the Red standard lib (mezz or natives) will be less of a burden for the compiler (will be compiled only once at first use).

greggirwin

[16:03](#msg576ab6b4c7061d590d52d53f)`Sign?` could be, but you have to get to 100K iterations before the difference would start to show. Even at 1M, it would be plenty for interactive. Not game engine speed of course. :^)

dockimbel

[16:04](#msg576ab6f3648385b8074c3cc6)Math-related functions are usually very good candidates for natives because they often have hardwired counterparts or CPU features that can make them magnitudes faster.

greggirwin

[16:06](#msg576ab7812554bbe049ba9de2)Agreed. Just looking at how I can add the most value, safely. e.g., maybe one of the folks who has learned /System can look at https://gist.github.com/greggirwin/55312e55b3f879ae6c3f4f00a7597b51 and tell me how it \*should* be done.

dockimbel

[16:08](#msg576ab7e6648385b8074c3cca)@greggirwin (Sorry can't resist to give it a look) First thing: time is internally a float, so you can collapse the 2 cases into one.

greggirwin

[16:08](#msg576ab7eec7061d590d52d5f0)And since things will be changing, my time may be better spent on tests, demos, and mezz stuff.

[16:09](#msg576ab843c7594b5f0dd1b573)See, I didn't even know if I could do that (this was my first working version). And if `switch` cases return their result, I can just box that directly, right?

dockimbel

[16:10](#msg576ab85afac963084de1e111)Line 11 is dead code. You can replace `res` in the later type castings with `stack/arguments`.

greggirwin

[16:11](#msg576ab89980f1c6a5257de287)But I don't even know how boxing works internally. :pensive: But I don't want to eat your time teaching me, because I won't provide enough value at this level right now.

dockimbel

[16:13](#msg576ab9113b4cb6687034a8ba)You could box `switch` result, though, you need to know that R/S makes a difference between statements and expressions, and in the early days, they were strictly separated (`switch` or `either` were pure statements). Since then, that was relaxed a little, but the compiler still has some issues sometimes generating the right code. So as a rule of thumb, you can safely assign the returned value, but don't pass those statements as arguments to function calls.

greggirwin

[16:13](#msg576ab91c2554bbe049ba9ed4)I cobble things from other bits, then have to see where they fail and learn as I go. The compiler is \*wonderful* at telling me though. :^)

[16:14](#msg576ab94f0ede04dc4903d1e2)I had some issues using `case` as an expression, so went this way.

dockimbel

[16:14](#msg576ab95cfac963084de1e11d)The code is fine, though, you could avoid the inner `case` by manipulating the negative bit directly from the integer or float values.

greggirwin

[16:15](#msg576ab9a4c417e36c69e54815)OK, maybe I'll clean it up and make a PR. Thanks so much for your time!

dockimbel

[16:15](#msg576ab9a7648385b8074c3cd3)R/S compiler is pretty good and, even if we can still find some bugs in some specific cases, it's pretty much battle-tested (Red runtime is about ~65k LOCs of R/S code).

[16:18](#msg576aba703b4cb6687034a8c4)Boxing is the way to transform primitive R/S values into Red values, which are stored in 128-bit slots (same as in Rebol). The %runtime/datatype/structure.reds file gives you the slot layout for every Red datatype.

greggirwin

[16:20](#msg576abae82554bbe049ba9fca)Ah, thanks. I did mix up integer! and red-integer! at one point and got the struct mismatch. Much fun learning.

dockimbel

[16:21](#msg576abb203b4cb6687034a8ce)Every datatype has a way to "box" a primitive value into the higher-level type. The "/box" functions, which are present in some datatypes (but not all) give you a simple way to achieve it. Other types are using `/make-in` or `/make-at`, but they are lower-level as they require you to provide the destination slot pointer as argument. There are also the `/push` functions (mostly used by the compiler), which are handy, but they will pile up the boxed value on the stack, while the `/box` functions will store it at `stack/arguments`, which represents the first stack entry of the current function call frame. That slot is also used for the returned value, so you'll see it used extensively pretty much everywhere in the Red runtime code.

greggirwin

[16:26](#msg576abc45c7061d590d52d87b)Guru Meditations updated with boxing info.

dockimbel

[16:27](#msg576abc5bfac963084de1e13e)Saw that in the activity right panel of red/red room. ;-)

greggirwin

[16:28](#msg576abc9cc7594b5f0dd1b80f)Ah, doesn't show while in this room. :^\\

## Thursday 23th June, 2016

greggirwin

[00:05](#msg576b27e12554bbe049bacffd)I poked at `sign?` some more, but can't see a performance win from a few different approaches. They all time out virtually the same (~.25s-.27s fro 10M calls):

A) CASE version  
B) (as integer! (i/value &gt; 0)) - (as integer! (i/value &lt; 0))  
C) log: as logic! i/value (i/value &gt;&gt; 31) or as integer! log  
D) EITHER &gt; 0 \[ 1 ]\[EITHER &lt; 0 \[ -1 ]\[ 0 ]]

Though I could be missing something better for C. Couldn't get the 2's complement `not` approach working that I found for C (the language). Missing some detail.

[00:08](#msg576b28666c39b965695fc0a3)Unless a better bit-twiddling solution is faster, I think `case` is the most readable, even if it takes more vertical space. It's virtually impossible to misunderstand, even at a glance.

[00:10](#msg576b291380f1c6a5257e1455)Ah, forgot this was in 'tests.

dockimbel

[03:23](#msg576b561c648385b8074c428e)@greggirwin For benchmarking `sign?`, you should use something like `loop 10M [sign? -123 sign? 0 sign? 123]` and compile it (to minimize the overhead of unrelated parts, like the interpreter). Anyway, it doesn't matter much for now, as we'll take the time to optimize the runtime library before 1.0.

greggirwin

[04:13](#msg576b61ddc417e36c69e58c9f)It is compiled and I had separate loop tests for each of +-0 to check branching overhead.

meijeru

[08:25](#msg576b9cf32554bbe049bb0a42)@dockimbel I quote &gt; you need to know that R/S makes a difference between statements and expressions, and in the early days, they were strictly separated (`switch` or `either` were pure statements). Since then, that was relaxed a little, but the compiler still has some issues sometimes generating the right code.

[08:29](#msg576b9de85ba3ccaa25b724ae)This has a bearing on unused locals, as follows: the documentation says that an "expression can be used stand alone". Thus even a function call which returns a value could be used stand alone, e.g. for the sake of its side effects. If that is the case, such an expression would not need to be assigned to a "dummy" variable. I spotted some of those, even with names like `unused`, in the latest source. Could you elucidate?

dockimbel

[08:40](#msg576ba0706c39b965695ffe94)@meijeru The couple of `unused` local variables are used in specific code patterns for float! values, to workaround issues with Intel x87 FPU (namely, the terrible stack management required by x87). This will be removed once we add support for SSE units.

meijeru

[10:59](#msg576bc10cc7061d590d5363f1)@dockimbel Thank you! I remain curious about your reaction concerning the other unused locals that I signalled in my last e-mail... But please don't feel pressured!

greggirwin

[16:46](#msg576c127a80f1c6a5257eb37f) @PeterWAWood I escaped out of a couple %run-all.r jobs, but it should clean up when I start a new one, right? It seems stuck again, but on a different test this time. Maybe I'm just impatient. Is there any way to know that the test is actually progressing behind the scenes? The R2 console is normally not responsive while tests run (at times), so I can't tell if it's hung.

dockimbel

[16:55](#msg576c149ac29eb500034668cc)@greggirwin If you interrupt the testing framework before end, you need to manually kill the remaining tasks before starting it again.

[16:56](#msg576c14bec29eb500034668d2)I'll take your PR and do the tests here.

greggirwin

[16:57](#msg576c14ed5ba3ccaa25b788da)Ahhhh. Thanks. Looks like a bunch of enpros hanging out there. I'll clean up later and test. Off to watch a talk by Andy Hunt (the PragProg) right now.

[16:58](#msg576c1546c7061d590d53af3c)You focus on important things, I'll do this. :^)

dockimbel

[16:59](#msg576c156289c0b3b310de9eed)Okay. :)

## Friday 24th June, 2016

PeterWAWood

[02:49](#msg576c9fb92554bbe049bba477)@greggirwin There is no visible progress indicator during the tests as the vast majority of the time taken is consumed by the compiler. We aggregate the tests into as few compiles as possible. This allowed us to reduce the time of the tests from other 32 minutes to less than 10. The cost is no evidence of progress (apart from watching the CPU usage).

greggirwin

[04:12](#msg576cb33ac7594b5f0dd2caae)OK, knowing 2.7.8 and hanging processes are issues, I at least know it's not my simple code changes making everything hang. :^)

PeterWAWood

[04:59](#msg576cbe46c417e36c69e657f7)@gregg I use Rebol 2.7.8 on Windows 7 and haven't had the tests hang, only on Windows 10. So I'm a bit puzzled.

## Sunday 10th July, 2016

PeterWAWood

[00:00](#msg5781902059cfbd4c5e627ce1)@dockimbel @Gregg 18 of the time tests are failing under both the compiler and the interpreter. It looks as though the behaviour is different in the console than the compiler and the run-time interpreter.

I ran this compiled and ran this code and also "did" from the console and got different results.

Code:

```
Red []

tb3-t: 2147483645:59:59
print [tb3-t/hour]
print [tb3-t/minute]
print [tb3-t/second]
```

Compiled:

````
Compiling /Users/peter/VMShare/Code/Red/test.red ...
...compilation time : 591 ms
...output file      : /Users/peter/VMShare/Red/red/test 

./test
-3
-1
-1.0```

In the console:
````

text  
$ ./test-console ~/VMShare/Code/Red/test.red  
2147483645  
59  
59.0  
\`

greggirwin

[03:36](#msg5781c2dbb79455146f7f57a9)That Gregg isn't me. There were some known failing time tests IIRC.

PeterWAWood

[04:36](#msg5781d0b91ca34a944edae11f)@greggirwin

[04:36](#msg5781d0e01ca34a944edae15c)Oops

[04:37](#msg5781d1087aeb080527957851)I suspect there could be a difference between how the two levers

[04:37](#msg5781d127064f828707fc7c78)Levers handle the time value.

[04:39](#msg5781d1867aeb080527957b57) I've started on put together a set of tests that can be run against both levers.

[09:48](#msg578219e8c9b49c1d6ff2ef20)@dockimbel @qtxie @greggirwin I've added a generator to create tests for both lexer.r and lexer.red from a single file - red/tests/source/units/lexer.tests

The tests are written in the format that is needed by lexer.red. The generator adds headers, etc. and reformats the tests for lexer.r

[09:49](#msg57821a441ca34a944edd3a09)I have only converted a few tests from red/source/compiler/lexer-test.r so far. Once I have time to convert them all, I remove the old lexer-test.r from run-all

## Wednesday 17th August, 2016

PeterWAWood

[23:46](#msg57b4f76b1a7d020756886eb6)@dockimbel The FreeBSDFoundation have prepared a distribution of FreeBSD for RaspberryPi and RaspberryPi2. I haven't been able to get a FreeBSD VM running under VirtualBox so we haven't tested Red on FreeBSD for ages.

Would installing FreeBSD on a Raspberry Pi be an option for testing or do we need to test on an Intel processor?

[23:53](#msg57b4f9041a7d0207568871bb)I decided to have another try at building a FreeBSD VM and now remember the problem - I can never get the ISO image download to complete.

[23:53](#msg57b4f90e4f819cfa3da92985)I'm trying again today.

## Thursday 18th August, 2016

PeterWAWood

[00:52](#msg57b506e27ce08cec69e32e22)No luck so far. After one hour -

"The Finder can’t complete the operation because some data in “FreeBSD-10.3-RELEASE-amd64-disc1.iso” can’t be read or written.  
(Error code -36)"

[02:48](#msg57b521f86a2fa2ff3d94ce3e)Probably a good job that I got the error. That was the 64-bit version. I've successfully downloaded the 32-bit ISO distribution.

[03:25](#msg57b52aa2d65128415f9ff5b4)Now all I have left to do is to install in a way that I can access files shared between my VMs.

dockimbel

[08:34](#msg57b573074f819cfa3daa46ce)You need to add a new target in config.r file, just copy the Freebsd target, change the cpu to ARM and turn on hard-floats support.

[08:35](#msg57b5733bbe8025f1694ca574)Would be better to test it on Intel, but supporting it on ARM is welcome.

PeterWAWood

[10:10](#msg57b5897f5a4ad61056859251)I'll work on getting the tests running on Intel first.

## Friday 19th August, 2016

PeterWAWood

[04:11](#msg57b686feb64a3a016f4ac75d)I've put getting testing on FreeBSD on the back burner as it was taking too much time to get file sharing working under VirtualBox.
