# Archived messages from: [gitter.im/red/tests](/gitter.im/red/tests/) from year: 2018

## Monday 14th May, 2018

SteeveGit

[16:41](#msg5af9bc4be0b50c2d05bfb69f)hello, since I plan to do my comeback very soon, I first made a local clone and then compiled the console (it's Ok) but the test suite is returning this:  
&gt;&gt;&gt; do %run-all.r  
\** Script Error: Feature not available in this REBOL  
\** Where: context  
\** Near: SECURITY\_ATTRIBUTES: make struct! [  
nLength \[integer!]  
lpSecurityDescriptor \[integer!]  
bInheritHandle [int...  
&gt;&gt; pwd  
\== %/Z/red/utils/

what am I doing wrong ?

[17:04](#msg5af9c1bb1cfca775e10a4607)it builds the 0.6.1 console by default, from the master branch

9214

[17:06](#msg5af9c1fe8c24fe61eae433de)@SteeveGit current Red version in master branch is `0.6.3`.

SteeveGit

[17:07](#msg5af9c243a2d95136333bfbdd)so, I fucked up something that early ;)

[17:11](#msg5af9c339d332ee5fad19af2b)seems that I'm linked to an old clone of mine

[19:32](#msg5af9e4309ad18967b9e57a1f)Ok , I got the `-=== Red Compiler 0.6.3 ===-` now, but still the same error with `do %run-all.red`  
&gt;\** Script Error: Feature not available in this REBOL

[19:33](#msg5af9e48b5a1d895fae3c98b0)if it says so... time to work on my project

greggirwin

[19:50](#msg5af9e89a2df44c2d06291d9b)Nice to see you again @SteeveGit! What version of Rebol do you have installed? And is it %run-all.red or %run-all.r you're running?

[19:52](#msg5af9e913bd10f34a68006da0)With Rebol 2.7.8, running %run-all.r with it, all should be good.

SteeveGit

[20:11](#msg5af9ed5e41f54f22e22be08f)Hi @greggirwin, I run `do %run-all.r` as stated in the readme

9214

[20:12](#msg5af9edca9ad18967b9e5a24e)But you said you run `%run-all.red`?

SteeveGit

[20:14](#msg5af9ee1f52194a4a67e4ecd2)really ? ah yes a typo !  
Besides I run it with `rebol-core-278-3-1.exe`

greggirwin

[20:15](#msg5af9ee61a2d95136333caa54)So, OK then, or still an error with the right filename? Running here fine, in a Rebol 2.7.8 console, so must be something amiss.

SteeveGit

[20:17](#msg5af9eeeed245fe2eb7adc2f2)I'll try again

## Tuesday 15th May, 2018

SteeveGit

[09:47](#msg5afaacc1d245fe2eb7b01082)Hello, I tried again to run the test suite using the original source files (not from my fork).

&gt;-=== Red Compiler 0.6.3 ===-  
Compiling D:\\red-master\\environment\\console\\CLI\\console.red ...  
...compilation time : 1001 ms  
Compiling to native code...  
Script: "Red/System PE/COFF format emitter" (none)  
...compilation time : 26513 ms  
...linking time : 829 ms  
...output file size : 1032192 bytes  
...output file : D:\\red-master\\console.exe  
&gt;&gt; do %run-all.r  
Script: "Builds and Runs All Red and Red/System Tests" (none)  
\** Script Error: Feature not available in this REBOL  
\** Where: context  
\** Near: SECURITY\_ATTRIBUTES: make struct! [  
nLength \[integer!]  
lpSecurityDescriptor \[integer!]  
bInheritHandle [int...

[09:49](#msg5afaad10e0b50c2d05c2bfcd)same errors

[10:02](#msg5afab02dd245fe2eb7b01994)I didn't mention I use Winows 10 x64

[10:03](#msg5afab071d332ee5fad1ca573)shoud I try ubuntu ?

9214

[12:48](#msg5afad7151cfca775e10ddd1f)@SteeveGit try to use \[Rebol/View console](http://www.rebol.com/download-view.html), not Rebol/Core.

SteeveGit

[12:56](#msg5afad8e35a1d895fae3fb38f)whaaaat !!! don't tell me ?

[12:57](#msg5afad956d332ee5fad1d485d)what a fool T\_T

[12:59](#msg5afad9952df44c2d062c356f)it's running now, thanks @9214

9214

[13:01](#msg5afada42d245fe2eb7b0baa9)Comeback with a style. :wink:

SteeveGit

[13:05](#msg5afadb03f04ce53632dba386)Can't believe I didn't see it coming :-1:

## Wednesday 16th May, 2018

greggirwin

[04:13](#msg5afbafe4e1cf621dba222093)Whew!

## Wednesday 23th May, 2018

SteeveGit

[08:51](#msg5b052b9baaafa25932ac001c)I keep getting crashes using the `face/para/scroll` field.  
Does anyone know how to use it ?

```
view [text left "line1^/line2^/line3" with [para/scroll: 4x10]]
```

## Friday 1st June, 2018

SteeveGit

[07:56](#msg5b10fc38352b9e1a4b4cff94)Wondering why `load/next` seems to not catch errors, what am I doing wrong ?

```
>> load/trap ",," 
== [[] ",," make error! [
    code: 200
    type: 'syntax
    id: 'i...
>> load/trap/next ",," 'err 
== [[] ",," none]
>> ?? err
err: [[] ",," none]
```

9214

[08:00](#msg5b10fd30361a950a66315916)@SteeveGit there's no `load`able value in your example, so `/next` does nothing.

[08:01](#msg5b10fd40160c567d16f4816f)And how is it related to tests?

SteeveGit

[08:05](#msg5b10fe3499fa7f4c0637222c)@9214 because that's not my point, I try to catch errors without the need to load a full loadable script.  
And if it's a bug, I'm in the right place, it seems.... no ?

9214

[08:05](#msg5b10fe5cc712f561254c93dc)https://gitter.im/red/bugs

SteeveGit

[08:07](#msg5b10fea64eaffb692d71a8a6)ok I'll try to do better next time, Though I still don't know if it's a bug or a feature :smile:

greggirwin

[17:01](#msg5b117bfb160c567d16f67353)@SteeveGit, I think `/trap` and `/next` are mutually exclusive, as the doc string for `/trap` says it loads all values. It works as expected, and doesn't error out, but returns the information about errors to you.

```
>> load/trap ",," 
== [[] ",," make error! [
    code: 200
    type: 'syntax
    id: 'invalid
    arg1: 'value
    arg2: ",,"
    arg3: none
    nea...
>> load ",," 
*** Syntax Error: invalid value at ",,"
*** Where: do
*** Stack: load
```

[17:02](#msg5b117c36c712f561254ea25a)

```
>> print mold load/trap "1 a [] ,, 2 b ()" 
[[1 a []] ",, 2 b ()" make error! [
    code: 200
    type: 'syntax
    id: 'invalid
    arg1: 'value
    arg2: ",, 2 b ()"
    arg3: none
    near: none
    where: 'do
    stack: 77957712
]]
```

[17:03](#msg5b117c6d93dc78791ca30e79)

```
>> print mold load/trap "1 a [] 2 b ()" 
[[1 a [] 2 b ()] ")" none]
```

[17:05](#msg5b117cf5b6eece791dcfd11f)So `load/trap` is an \*alternative* to `load/next`, where you get 0 or more loaded values, the position to continue from, and whether there was an error or not, to know if you need to continue.

The trailing ")" in the successful load above might be worth investigating, to see why it's not the tail of the input.

## Saturday 2nd June, 2018

SteeveGit

[07:55](#msg5b124d63e26c847ac8aee264)I beg to differ @greggirwin  
I still hope I’m missing something important in the design but I don’t understand why you are justifying the injustifiable (to me).  
1/ `load/next` allows the loading of a string bit by bit but never throws back errors if any. So, we can’t track the position of a syntax error in the string.  
In fact, we can. Even if it’s not throwing back catchable errors, `load/next` does not advance the string position in the case of a syntax error (clearly a bug or a missing feature).  
2/ `Load/trap` loads a complete string (like a script) and emits only one syntax error as an object if any (the first encountered one).  
Again, What am I missing ? because what you are advocating Gregg, makes no sense to me. An "alternative" to what ? Good day :smile:

greggirwin

[17:27](#msg5b12d39352e35117cd00b013)@SteeveGit moving to red/help.

## Saturday 9th June, 2018

PeterWAWood

[00:41](#msg5b1b2242d7b4f6288cb89be9)I have consolidated all currently failing tests in red/tests/failing-tests.red as they get forgotten with the current practice of commenting out failing tests.

[00:42](#msg5b1b2262d7b4f6288cb89ca1)In the process of consolidating them I found a number of commented out tests that now work.

greggirwin

[04:49](#msg5b1b5c590b75bc7d5af5f074)Thanks Peter!

## Monday 9th July, 2018

greggirwin

[23:31](#msg5b43f04863042f2df364433b)@PeterWAWood, I have some new tests, where the compiler (correctly) can't compile a bad func spec (under test), so I use `do` to test the interpreter: `--assert error? try do [...]`

When those tests are enabled, I get a "signify error" output, and the tests don't run. Is that expected?

PeterWAWood

[23:37](#msg5b43f1c6e534eb69a5d600cc)@greggirwin No, it is not expected. "Signify error" will be shown when the test fails to compile.

greggirwin

[23:39](#msg5b43f22481816669a43e3710)Ah, I think it's me. Hang on.

[23:40](#msg5b43f2763572e970c183e4e3)Yes, that was my fault. False alarm.

[23:42](#msg5b43f2ea33b0282df40df5d4)Still not getting the error as expected though.

PeterWAWood

[23:47](#msg5b43f3f4f166440661275206)What is the function code?

greggirwin

[23:47](#msg5b43f40d89db5e701caf8c55)Just a sec. I cleared runnable and am recompiling.

[23:48](#msg5b43f445a99e1e52b7240913)Seems to be hung again.

[23:49](#msg5b43f48d70efc60660baa239)Woohoo! Works now.

PeterWAWood

[23:58](#msg5b43f6ab81816669a43e3fbf):+1:

## Tuesday 10th July, 2018

greggirwin

[00:20](#msg5b43fbd43d8f71623d6a4474)So close. Locally testing is fine:

```
>> do/args %run-test.r to-rebol-file "C:\dev\greggirwin\red\tests\source\units\function-test.red"
Script: "Builds and Runs a single Red/System Tests" (none)
Script: {Simple testing framework for Red and Red/System programs} (none)
Script: "Untitled" (none)
Quick-Test v0.12.0
Running under REBOL 2.7.8.3.1
~~~started test~~~ function
~~~finished test~~~  function
  Number of Tests Performed:      115
  Number of Assertions Performed: 138
  Number of Assertions Passed:    138
  Number of Assertions Failed:    0
```

But doing %run-all.r I get

```
signify failure
~~~started test~~~ run-all-interp
1
*** Script Error: invalid function definition: return:
*** Where: func
*** Stack:
```

PeterWAWood

[00:45](#msg5b4401a69b82c6701bb046f7)Can you drop `function-test.red` in a gist? I can then take a look

[00:45](#msg5b4401bce534eb69a5d61ab5)Or just post the failing test here:

greggirwin

[00:46](#msg5b4401d633b0282df40e10a1)Yes. Just commented the intentionally bad tests out, to see if that clears it.

[00:46](#msg5b4401fa7e23133ecb3f9c8e)

```
===start-group=== "function spec validation"
	--test-- "fsv1"
        --assert function? func [][]
	--test-- "fsv2"
        --assert function? func [a [integer!] "doc a" b [string!] "doc b" /c d [block!] "doc d" e return: [integer!]][]
	--test-- "fsv3"
        --assert function? func [a [integer!] "doc a" b [string!] "doc b" /c d [block!] "doc d" e][]
	--test-- "fsv4"
        --assert function? func [a [integer!] "doc a" b [string!] "doc b" /c d [block!] "doc d"][]
	--test-- "fsv5"
        --assert function? func [a [integer!] "doc a" b [string!] "doc b" /c d [block!]][]
	--test-- "fsv6"
        --assert function? func [a [integer!] "doc a" b [string!] "doc b" /c d][]
	--test-- "fsv7"
        --assert function? func [a [integer!] "doc a" b "doc b"][]
	--test-- "fsv8"
        --assert function? func [a [integer!] "doc a" b [string!]][]
	--test-- "fsv9"
        --assert function? func [a [integer!]][]
	--test-- "fsv10"
        --assert function? func [a "doc a"][]

	; DO is used here, because the compiler will correctly catch errors the interpreter doesn't.
;	--test-- "fsv11"
;        --assert error? try [do [func [a [integer!] returns: [integer!]][]]]
;	--test-- "fsv12"
;        --assert error? try [do [func [a [integer!] return:][]]]
;	--test-- "fsv13"
;        --assert error? try [do [func [a return: [integer!] b][]]]
;	--test-- "fsv14"
;        --assert error? try [do [func [a return: [integer!] /c][]]]
;	--test-- "fsv15"
;        --assert error? try [do [func [a return: b][]]]


===end-group===
```

[00:48](#msg5b440246bd92d80782a1e00f)Hmmm, does it not like the fsv2 test I wonder? Still failed.

PeterWAWood

[00:57](#msg5b44046ef166440661276c25)If I compile and run this short program, it runs:

```
Red[]
print error? try [do [func [a [integer!] returns: [integer!]][]]]
```

greggirwin

[00:57](#msg5b4404877b811a6d63ddb544)Even with that test commented out, I still get the error.

PeterWAWood

[00:57](#msg5b44049063042f2df3646298)and prints "false"

greggirwin

[00:58](#msg5b4404b17b811a6d63ddb664)Because you don't have my fix to %function.reds I think.

[00:58](#msg5b4404c2bd92d80782a1e4a1)My fix makes that an error.

PeterWAWood

[00:59](#msg5b4404d733b0282df40e1665)Well at least you know the tests are correct :-)

greggirwin

[01:31](#msg5b440c547e23133ecb3fac87)Here's what it seems not to like. I added a check to make sure `return: [...]` was the last thing in the spec.

```
TYPE_SET_WORD [
					w: as red-word! value
					if words/return* <> symbol/resolve w/symbol [
						fire [TO_ERROR(script bad-func-def)	w]
					]
					next: value + 1
					next2: next + 1
					unless all [
						next < end
						TYPE_OF(next) = TYPE_BLOCK
						next2 = end   ;**** This makes it unhappy ****
					][
						fire [TO_ERROR(script bad-func-def) value]
					]
					value: next
				]
```

[01:31](#msg5b440c7d7e23133ecb3facad)I also added the check on the symbol, which doesn't cause a problem.

[01:40](#msg5b440e8a3572e970c18412cb)Ah, a misunderstanding on my part. Not enough brain it seems. `/local` can follow the return.

[01:40](#msg5b440ea09b82c6701bb05b9a)Good thing we have all these tests.

PeterWAWood

[01:40](#msg5b440ea97e23133ecb3fb086):-)

[01:41](#msg5b440eba9b82c6701bb05bbd)You either need a break or a coffee or both.

greggirwin

[01:41](#msg5b440ed79b82c6701bb05bf3)Yeah. First need to see if I can fix this.

PeterWAWood

[01:49](#msg5b4410b163042f2df36475d2)From a quick look at `function.reds`, it might be easier to add the check that `return:` follows the other parameters in `calc-arity` which is already ignoring anything after it comes across a `set-word`.

greggirwin

[01:51](#msg5b441108e534eb69a5d630d1)The problem is #3454. You shouldn't have any other words after `return:`

PeterWAWood

[01:51](#msg5b44110a70efc60660bad17a)Though it really wouldn't be good practice from a `single responsibility` perspective.

greggirwin

[01:51](#msg5b4411373d8f71623d6a6ad6)So if it just stops, like `calc-arity`, it won't catch that. Just need to learn how to check the symbol match as `/local`.

PeterWAWood

[01:52](#msg5b44115aa99e1e52b7243c4c)Can't any refinement come after `return:`?

greggirwin

[01:53](#msg5b4411923572e970c1841896)I wouldn't think so. But I guess we don't have a hard func spec yet. Seems like return should be final or penultimate.

[01:53](#msg5b44119ba99e1e52b7243c79)i.e. only locals to follow.

PeterWAWood

[02:01](#msg5b44137760c38707836bc89f)You can specify `/refinements` after `return:` at the moment.

[02:01](#msg5b44139581816669a43e6e05)

```
text
>> f: func [a return: [integer!] /b c] [either b [print c] [print a] ]
== func [a return: [integer!] /b c][either b [print c] [print a]]
>> f 1
1
>> f/b 1 3
3
```

greggirwin

[02:02](#msg5b4413b463042f2df3647b72)By design you think?

[02:02](#msg5b4413ba3c5abf52b649d843)Seems ugly to me.

PeterWAWood

[02:02](#msg5b4413c37b811a6d63ddd08d)The code in`function.reds` suggests so to me ... but I could be wrong.

[02:05](#msg5b441461f1664406612784f9)It may look ugly but it will be helpful when people start asking to alter the return type for specific refinements ;-)

greggirwin

[02:06](#msg5b4414b433b0282df40e2e16)Ooooooh.

PeterWAWood

[02:06](#msg5b4414be9b82c6701bb06534)Like this :

```
3
>> f: func [a return: [integer!] /b c return: [float!]] [either b [print c] [pri== func [a return: [integer!] /b c return: [float!]][either b [print ...
>> f 1
1
>> f/b 1 3.0
3.0
>> f/b 1 3
3
```

greggirwin

[02:06](#msg5b4414c33d8f71623d6a70e4)I'll leave the check at refinement then.

PeterWAWood

[02:07](#msg5b4414edf1664406612785a9)I was being very tongue-in-cheek !!

greggirwin

[02:08](#msg5b4415057b811a6d63ddd298)Scary, but reasonable. :^\\

PeterWAWood

[02:08](#msg5b4415239b82c6701bb0658d)That said, the pendulum is clearly swinging towards strict type checking in this decade. Luckily the next decade will start in a couple of years.

greggirwin

[02:16](#msg5b4416f9f166440661278924)Nope, compiler doesn't seem to like that kind of spec.

PeterWAWood

[02:21](#msg5b44183333b0282df40e3420)There is a difference between the compiler and the interpreter. I used this "horror":

```
Red[]

f: func [
	/int
		i		[integer!]
		return:	[integer!]
	/flt
		f		[float!]
		return:	[float!]
] [
	if int [ return i ]
	if flt   [ return f ]
]

print f/int 1
print f/flt 2.0
```

greggirwin

[02:22](#msg5b44185d7e23133ecb3fbd78)Does that compile for you?

PeterWAWood

[02:23](#msg5b441885bd92d80782a200c1)No

```
*** Compilation Error: invalid function spec block: [
    return: [float!]
]
```

[02:24](#msg5b4418cba99e1e52b7244757)And the interpreter is happy when you define the function but does not actually build the second refinement:

```
== func [
    /int 
    i [integer!] return: [integer!] /flt 
    f [...
>> f/int 1
== 1
>> f/flt 3.0
*** Script Error: f has no refinement called flt
*** Where: f
*** Stack: f
```

greggirwin

[02:24](#msg5b4418d0a99e1e52b724475d)Same here with a similar spec.

[02:24](#msg5b4418df3d8f71623d6a774e)So I'm pushing my fix that just checks for refinements after return, allowing them.

[02:24](#msg5b4418ef9b82c6701bb06b5d)That seems to pass %run-all.

PeterWAWood

[02:25](#msg5b44190481816669a43e7519)Sounds good.

greggirwin

[02:25](#msg5b441933f166440661278d38)PR out now, builds in progress.

PeterWAWood

[02:32](#msg5b441aa370efc60660badf6c)macOS and Linux builds passed

greggirwin

[02:32](#msg5b441abc9b82c6701bb06d1f)All good this time. Yay!

[02:33](#msg5b441adc89db5e701cafc7f6)Care to merge me?

PeterWAWood

[02:34](#msg5b441b1fbd92d80782a20575)My pleasure.

greggirwin

[02:35](#msg5b441b719b82c6701bb06e5a)Thanks! 1 down, 339 to go. ;^)

[02:36](#msg5b441bc73572e970c18425cc)338 Forgot my PR covered 2.

PeterWAWood

[02:41](#msg5b441cd0f16644066127930c)All looks good with the merged PR.

meijeru

[18:19](#msg5b44f8b3f16644066129baf9)Who will publish the definitive syntax of the function specs? I have put up my own take of this, which is overly strict, in `red/specs`. Are we going towards completely free form, i.e. arguments, refinements and return spec may occur in any order??

greggirwin

[18:21](#msg5b44f91d60c38707836e07bb)I don't think it can be completely free-form. Nenad has the final say, but we can start with your spec and draft an RFC to nail it down.
