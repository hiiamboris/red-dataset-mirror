# Archived messages from: [gitter.im/red/red/system](/gitter.im/red/red/system/) from year: 2016

## Friday 8th January, 2016

Oldes

[09:37](#msg568f835bd739f50a360268ff)@dockimbel what happen, when in one file I do

```
#import ["kernel32.dll" stdcall [ GlobalAlloc: "GlobalAlloc" [..]] ]
```

and in other file I do the same import again?

qtxie

[09:56](#msg568f87b9d578ec9101d0ca0c)@Oldes `GlobalAlloc` Will be import twice.

dockimbel

[10:24](#msg568f8e487668d00a4ab46161)@Oldes We are missing a check for such case in the compiler. I'm not sure which behavior would be more useful: erroring out or letting the linker filter out the duplicates?

Oldes

[10:25](#msg568f8e878fdd3c0c382d74f0)I would prefer to filter out duplicates, if it's possible.

dockimbel

[10:26](#msg568f8eded739f50a36026a70)It shouldn't be difficult to achieve. However, if the spec blocks differ in any way, then it should error out. You should open a ticket about it, so we don't forget it.

## Wednesday 1st June, 2016

meijeru

[18:41](#msg574f2c73da3f93da6f227429)@dockimbel Question: how do you test in Red/System for a value of type `int-ptr!` being negative? I am actually decoding the `action-table` to see which datatype/action combinations are defined/inherited/undefined but I can't seem to find the INHERITED\_ACTION entries.

[20:23](#msg574f445e80352f204df44873)Also, it seems that the `event!` entry in the `name-table` is corrupted...

PeterWAWood

[22:26](#msg574f6127ec10ddbb09dce79f)@meijeru Isn't

```
int-ptr!
```

an unsigned 32-bit integer?  
Try this:

```
Red/System []

i: declare int-ptr!
z: declare int-ptr!

i: as int-ptr! FFFFFFFFh
z: as int-ptr! 00000000h


if i >  z [print ["i is not-negative" lf]]
```

## Thursday 2nd June, 2016

dockimbel

[03:30](#msg574fa85e286eebef035ae22a)@meijeru Pointers are unsigned, cast them to integer! to test for the sign bit or just use a `and 80000000h` for checking the sign bit (bit 31). What is corrupted in event! entry? Can you show me a memory dump for event!?

meijeru

[05:48](#msg574fc8b810f0fed86f4a7eae)The pointer problem is solved (my misunderstanding). However, look at `%red.reds`, there seems to be missing a call to `event/init` and the `name-table` and `action-table` entries are possibly not filled in. Or is this done elsewhere?

dockimbel

[06:16](#msg574fcf27a66904962ebbd1c8)It's currently done in View \[module](https://github.com/red/red/blob/master/modules/view/view.red#L15), as `event!` is gui-only for now.

meijeru

[09:00](#msg574ff5c4f44fde236e52b61c)That is why I got an error when I compiled without `Needs: 'View`. Everything solved now.

## Monday 11st July, 2016

JenniferLee520

[11:33](#msg5783840e3eaf66535e73c3e8)

[11:34](#msg578384507aeb080527a73456)

## Tuesday 12nd July, 2016

Zamlox

[05:24](#msg57847efe064f8287071aba62)where can I find the body of an action! in Red source ? How does #get-definition work ?

greggirwin

[06:11](#msg57848a0bb79455146f9d82b9)Action bodies are in the datatype defs.

Zamlox

[06:48](#msg578492d77aeb080527b4033f)@greggirwin I was looking for source code of

```
head
```

and I found:

```
head: make action! [[
		"Returns a series at its first index"
		series	 [series!]
		return:  [series!]
	]
	#get-definition ACT_HEAD
]
```

Then I found that

```
#get-definition
```

is used in 'compiler.r' where is used to emit values into a buffer, and then I got lost. Is

```
#get-definition
```

somehow related to datatype defs (red/runtime/datatypes) ?

meijeru

[07:27](#msg57849bd359cfbd4c5e8439e5)The actual implementation of `head` is potentially different for each datatype, and is to be found in `runtime/datatypes/.reds`. Inside each such file, look for the `init` function at the end. This fills in a dispatching table (types x actions). If the entry for `head` is INHERIT\_ACTION, then look for the file for the "parent type". This parent type is the second argument of the call to`datatype/register` which figures in the `init` function. In your case, you will find the actual implementation of `head` in `series.reds`. Hope this helps.

[07:29](#msg57849c7259cfbd4c5e843bab)The dispatching mechanism itself, which involves `#get-definition` and a lot more, is in fact not important for understanding how each action works.

SteeveGit

[07:32](#msg57849cf7680d66be0e82ea4c)Ah, @meijeru was faster, anyway I'll post my walkthrough:  
Yes, code of actions comes from red/runtime/datatype.  
To find the location of the invoqued function, you must use the datatype of the first argument.  
If it's a block!, then it's located in \*\*red/system/block.reds\**  
Then, go to the \*\*init\** function (at the end of the source)  
You'll see:  
&gt;&gt; init: does [  
datatype/register [  
TYPE\_BLOCK  
\*\*TYPE\_SERIES\**  
"block!"  
;-- General actions --  
:make  
INHERIT\_ACTION ;random  
INHERIT\_ACTION ;reflect  
null ;to  
...  
:copy  
:find  
\*\*INHERIT\_ACTION ;head\**  
INHERIT\_ACTION ;head?  
INHERIT\_ACTION ;index?  
...

Ah, that means the \*\*head\*\*function used by block datatype comes from \*\*red/runtime/series.reds\**  
So again, Looking at \*\*init\** function in \*\*series.reds\*\*:  
&gt;&gt;...  
:copy  
null ;find  
\*\*:head\**  
:head?  
...

Now, you can get the \*\*head\** function definition in series.reds, which is:

```
head: func [
		return:	[red-value!]
		/local
			ser	[red-series!]
	][
		#if debug? = yes [if verbose > 0 [print-line "series/head"]]

		ser: as red-series! stack/arguments
		ser/head: 0
		as red-value! ser
	]
```

meijeru

[07:33](#msg57849d4d3eaf66535e818dee)Glad to note that @Steeve and I said more or less the same thing :-)

SteeveGit

[07:36](#msg57849e0c85418bf56db7b2c0):+1:

JenniferLee520

[11:29](#msg5784d494c9b49c1d6f12ba37)

[11:37](#msg5784d68859cfbd4c5e86d3d7)In my Red/System code, I need to call "symbol/resolve", which takes a symbol ID as its parameter. How can I get the symbol Id from a c-string!, such as "MD5"? Thanks. @dockimbel

SteeveGit

[11:53](#msg5784da51f729c0a5330a9c83)\*\*symbol/make\** seems to have the needed interface:

```
make: func [
		s 		[c-string!]								;-- input c-string!
		return:	[integer!]
      ]
```

But it will create the symbol if not found.  
So, you can use \*\*symbol/search\** as an alternative, but you need to pass a red-string! instead.  
Or you can copy/paste the beginning code of the \*\*symbol/make\** function.

JenniferLee520

[12:03](#msg5784dca3b79455146fa1335a)OK, the "symbol/make" function will do well in my case. Thanks.

Zamlox

[12:12](#msg5784deb959cfbd4c5e875775)@meijeru @SteeveGit thanks guys for explanation.

keesse

[20:30](#msg57855377064f828707263336)Is there an example of how to write a function in red/system and call in in a Red program?  
Do I have to compile the red/system as a dynamic library ?

qtxie

[21:50](#msg57856635b79455146fa8fa9d)@keesse No need. You can use `routine!`, see the example: https://github.com/red/code/blob/master/Scripts/perlin.red

## Wednesday 13th July, 2016

keesse

[07:35](#msg5785ef4f3eaf66535e922187)@qtxie Thanks, that looks good!

## Wednesday 20th July, 2016

JenniferLee520

[06:39](#msg578f1c85ac85f2507ad6f0e5)I have some macro constants defined in Red/System. How can I reuse them in Red without redefined them again in Red? Thanks.

dockimbel

[06:50](#msg578f1f3a0720fd587aa65a82)You can't re-use the macros, they disappear after the compilation process, as they get inlined. Though, maybe with some clever code, you could create a literal array where you would write all your macros constants, then have a function converting it on start, to a red-block! that you could expose to Red. Though, you would still need to write and maintain that literal array of macros manually (but you could put them close to your macros definitions in R/S).

JenniferLee520

[07:27](#msg578f27d916487c5e515f4730)OK. Got it. Thanks.

## Friday 22nd July, 2016

JenniferLee520

[02:50](#msg579189fe2efeede810bceeac)I can use `string/load` and `binary/load` to build `red-string!` and `red-binary!` ,respectively. Is there a similar function which can help me build a `red-bitset!` from `byte-ptr!`? Thanks.

[06:19](#msg5791baf680f77536494ee3b3)OK. I will use `binary/load` to generate a `binary!`, then change its header value to `TYPE_BITSET`.

dockimbel

[10:49](#msg5791fa2c80f7753649518845)@JenniferLee520 No such function for creating bitsets.

[10:51](#msg5791fa9498d0f0a54a6cb224)@JenniferLee520 That could work, see `bitset/make`.

## Saturday 23th July, 2016

jouborg\_twitter

[23:46](#msg579401e89d9e974a7f72ace5)hello

[23:46](#msg579401ef959ee82b3e490b80)what does the #system directive do?  
I'm reading through https://github.com/red/red/blob/23a63d20ac73bd30419791ca58bc696f3aeac7be/environment/console/input.red and trying to understand the code better  
Looking online, the only reference I see to the #system directive is in the section http://static.red-lang.org/red-system-specs-light.html#section-16.8  
but doesn't explain what #system actually does

## Sunday 24th July, 2016

PeterWAWood

[00:32](#msg57940cad67c448730ef1d353)It allows you to include Red/System code in a Red program. The code will be compiled and will be run after the preceding Red statement has run. One use of the

```
#system
```

directive is to import external functions and define functions that are called later from a

```
routine!
```

jouborg\_twitter

[16:11](#msg5794e8a032bd01d843b80920)@PeterWAWood cool. I see ansi.reds imports `fflush` from libc as `flush-file` (https://github.com/red/red/blob/f01232402ce9a45b137930024488670cc49425f9/system/library/ansi.reds#L81). How do I call it from my code? I've tried wrapping it in a #system \[ ... ]

PeterWAWood

[22:14](#msg57953db21b9de56c0ee1051e)@jouborg\_twitter I think that you have worked out how to call Red/System code from Red from what you have posted in other rooms. However, here is a Hello World example:

```
Red []
#system [
	print-hello: func[] [print ["Hello World" lf]]
]
hello: routine [] [
	print-hello
]
hello
```

jouborg\_twitter

[23:58](#msg5795563bbc636a263eed68d6)yeah, if figured it out :-)

[23:58](#msg5795563c32bd01d843bb9834)thanks

## Thursday 28th July, 2016

jouborg\_twitter

[14:26](#msg579a162537c95e2446bd7239)I'm experimenting with adding some I/O routines to simple-io.reds and have a question about surfacing functions into the runtime environment. I looked at `request-file` as an example and want to confirm that my understanding is accurate and also to understand one piece that eludes me:

[14:27](#msg579a1651ad8f331f4e4fd713)a) The \*implementation* of `request-file` is defined in simple-io.reds (varying by platform)

[14:29](#msg579a16bb3383eb62214add68)b) When Red is compiled, simple-io.reds, and hence the definition for the function is #`import`ed

[14:31](#msg579a174600c8ebdd0e2b68b9)c) natives.red includes `request-file` in its enumeration of functions that must be compiled to native code

[14:32](#msg579a176c93148c6b21e5c897)d) compiler.r compiles `native!`s like `request-file` to native code

[14:32](#msg579a178b37c95e2446bd77bc)If the above is accurate, I have the following questions:

[14:33](#msg579a17c293148c6b21e5c971)1. I don't see explicit #export of `request-file`. Do the `native!`s get exported \*automatically\*?

[14:34](#msg579a17d83383eb62214ae063)(I couldn't see that in compiler.r)

[14:35](#msg579a18417c9324e20e05e0fb)2. If the answer to (1) is NO, then how is `request-file` getting exported &amp; surfaced into the runtime? I ask because other functions in `simple-io.reds` are NOT available at runtime, e.g. `request-http` (because `help request-http` returns: "Script error: request-http has no value")

[14:36](#msg579a1851d155b0294e118843)That's it. Thanks for any explanation.

dockimbel

[16:14](#msg579a2f5f8fb4820a466c0cc4)1. `#export` is used to \[export](http://static.red-lang.org/red-system-specs-light.html#section-16.9) symbols when compiling a shared library. The Red runtime code is not a shared library, it is statically linked to your program (actually, it is even merged with it). So the answer is no.  
2\. You answered it yourself in c), see this \[code](https://github.com/red/red/blob/master/runtime/natives.reds#L2020) in `natives.reds`. ;-)

## Friday 29th July, 2016

jouborg\_twitter

[12:56](#msg579b52873eb00fbd15227d3b)@dockimbel ah, and what is available to my code is what's in the \[`init` of natives.reds](https://github.com/red/red/blob/master/runtime/natives.reds#L2753)? Here I see `request-file*`, but not an equivalent for `request-http`.

dockimbel

[13:57](#msg579b60d2e56d253804189b95)@jouborg\_twitter The low-level `request-http` is exposed through the \[`url/read`](https://github.com/red/red/blob/master/runtime/datatypes/url.reds#L185) and \[`url/write`](https://github.com/red/red/blob/master/runtime/datatypes/url.reds#L234) actions.

## Monday 19th September, 2016

fergus4

[19:46](#msg57e0407caabc89857fb64b54)Is red/system mature enough to communicate with blue tooth devices?

## Tuesday 20th September, 2016

dockimbel

[05:33](#msg57e0ca4018291e104886ef94)@fergus4 Red/System is a system programming language. So like C, accessing peripherals is done through 3rd-party API (usually OS API). So, to answer your question, the only thing you need in Red/System for bluetooth support is ability to call C-level APIs, which it can do since its first release in 2011.

## Friday 7th October, 2016

Zamlox

[20:32](#msg57f80672dfe82a365b07f1a7)if I add a

```
float!
```

with

```
x
```

or

```
y
```

of

```
red-pair!
```

, I get

```
-1.#IND
```

:

```
p2-x: p1-x + start/x
```

where

```
p2-x
```

,

```
p1-x
```

are

```
float!
```

and

```
start
```

is

```
red-pair!
```

The result of operation is ok if the second operand is a literal

```
integer!
```

[20:33](#msg57f8069b0aa72e3c5be2e96a)It works if I cast

```
start/x
```

to

```
float!
```

:

```
p2-x: p1-x + as float! start/x
```

## Saturday 8th October, 2016

dockimbel

[05:30](#msg57f8846b0aa72e3c5be43072)@Zamlox Mixed integer/float types in math expressions is not supported. The compiler does not report any error as it is still unsure if we'll implement it or not. So, for now, you need to put the type casting manually.

Zamlox

[05:32](#msg57f884fb84f1db061491535c)@dockimbel all right. I'll keep that in mind.

## Monday 10th October, 2016

7hi4g0

[13:48](#msg57fb9c4aa7c618cd26fbc867)In the docs for Red/System it says that to convert from integer! to float! I need to do `to float! 5` but it says that `to` does not exist.  
I used `as float! 5` instead and it worked. Is the doc outdated?

[13:49](#msg57fb9c7b68f560d80cf1f82b)Also, how should I run Red/System programs? Do I have to compile or can I run as a script?

dockimbel

[13:56](#msg57fb9e0284f1db061499f9f5)@7hi4g0 `to float!` in the casting matrix expresses a conceptual transformation, as described under the table by: `to : indicates that a possible data modification can occur.`. Same for `true»#"^(01)"` expression, there is no `»` operator in R/S. I will improve that to avoid any confusion.

7hi4g0

[13:58](#msg57fb9e8f68f560d80cf20277)@dockimbel I got the impression that `to` was a function.

[14:01](#msg57fb9f4f4fde72031424f4a6)I think it would be useful in some cases to cast an `integer!` to `float!` without data modification, that's why I thought there were to ways to cast: one with data modification and one without.

dockimbel

[14:08](#msg57fba0cf68f560d80cf20b7c)@7hi4g0 That was our initial plan, but we thought users would be too confused about when to use `as` vs `to` in practice.

7hi4g0

[14:09](#msg57fba122d6251fd126a86077)@dockimbel That's true. It would be confusing.

dockimbel

[14:11](#msg57fba194d6251fd126a8643f)Though, I agree that in some (rare) cases, you would want to have a type casting while preserving the bits. We need to find a new syntax to support that.

[14:13](#msg57fba1f570fcb5db0c44c9f8)@7hi4g0 About your R/S question: you need to compile R/S code, it can't be interpreted and the JIT compiler is not there yet. R/S code can be in a R/S standalone file, or embedded into Red scripts (you need to compile the Red scripts in such case).

[14:16](#msg57fba2cbd6251fd126a867bc)As a workaround, such bit-preserving conversion could be done right now by wrapping the values in two `struct`, each with a different type for the nested 32-bit slot, then just use struct type casting.

7hi4g0

[14:20](#msg57fba39484f1db06149a1038)@dockimbel About embedding: How do I do it? I tried but it didn't work. I guess it has something to do with `#system` directive, but I'm not sure.

dockimbel

[14:27](#msg57fba53970fcb5db0c44d800)You have several ways to embed R/S code in Red scripts:  
1\. `#system [...]` directive, allows you to inline R/S code anywhere in Red code.  
2\. Routines: declare them as an alternative to functions in Red, spec block in Red, body block is R/S. Compatible primitive types are auto-converted. See an example \[here](https://github.com/red/code/blob/0.6.2/Scripts/mandelbrot-fast.red).

[14:29](#msg57fba5df0aa72e3c5bed201b)Routines arguments require a (single) type.

7hi4g0

[14:31](#msg57fba65ea7c618cd26fbfe4e)@dockimbel Cool. Thanks!

[14:34](#msg57fba6e484f1db06149a1f47)About the docs. I saw you made a commit to replace `to float!` by `as float!`, but there are other mentions to `to` on the docs, specially on that casting table.

[15:04](#msg57fbae0cd6251fd126a89eb1)Nevermind. You removed all mentions on the table. I only saw the first lines of the commit and didn't realize there was a scrollbar. :confounded:

dockimbel

[15:33](#msg57fbb4e270fcb5db0c4528d3)No problem. ;-)

## Tuesday 11st October, 2016

DideC

[15:33](#msg57fd065584f1db06149f3acd)@dockimbel I have a compilation error with last-build on `integer/to-float` in R\\S code. I saw that there were some changes, but what should I put in the code instead of this call ?

dockimbel

[17:42](#msg57fd247e68f560d80cf7e8dd)@DideC Just `as float!`. Those converting functions were removed and replaced by simple type castings (floating point conversions are now handled by the FPU directly).

## Wednesday 12nd October, 2016

DideC

[13:16](#msg57fe379a68f560d80cfb97d8)Ok Thanks, it works now.

## Wednesday 26th October, 2016

7hi4g0

[15:06](#msg5810c66b482c168b22ba77ab)What's the difference between `val/symbol` and `symbol/resolve val/symbol`?

## Thursday 27th October, 2016

qtxie

[03:11](#msg5811706ac3569a036e2274fe)@7hi4g0 We know that `word!` in Red is case insensitive. The `word/symbol` is the `unique ID` of a word, and calling`symbol/resolve word/symbol` we get the `alias ID`(or original ID) of a word. For example,

1\. We create a new word `abc`, then it gets an ID, let's say `1000`. Here `abc/symbol = 1000`.

2\. Then we create another word `ABC`, it will also gets an ID, maybe `1001`. So `ABC/symbol = 1001`. As it's an alias of word `abc`, `symbol/resolve val/symbol` will get the `alias ID` which is `1000`.

If you don't want to do `strict comparison`, use `symbol/resolve val/symbol`.

7hi4g0

[04:56](#msg5811891b8ed1c0ff5c32737d)Hum. Thanks @qtxie

[04:57](#msg58118952806316005dc4f4c2)There are places in view that one is used and places that the other form is used.

dockimbel

[08:35](#msg5811bc36c3569a036e2387cb)@7hi4g0 Words comparisons should use `symbol/resolve` by default, unless the same casing is expected. You can report here the ones that are missing it in View module.

meijeru

[16:11](#msg581227447b15d16e55b575cc)@dockimbel In the `draw`dialect, is the `text` item always displayed horizontally? Is there a way to get it displayed under an angle (to be specified) or perhaps just with the choice horizontally or vertically?

dockimbel

[16:35](#msg58122cc6482c168b22c0a5bc)@meijeru I'm not sure that the font rendering engines provided by all modern OS can handle that. I let @qtxie give the final word on that.

7hi4g0

[17:02](#msg58123332482c168b22c0c664)@dockimbel I've seen both with `symbol/resolve` and without for comparing `face/type`, but as I understand the symbols are always the same, since `face/type` is set by `VID`.

## Friday 28th October, 2016

dockimbel

[04:40](#msg5812d6ab806316005dcab279)@7hi4g0 Actually, `face/type` can be set by user \[also](https://github.com/red/red/blob/master/tests/view-test.red#L99), so it would be safer to use `symbol/resolve` in those cases too. PR to improve that are welcome. ;-)

7hi4g0

[04:45](#msg5812d8005a1cfa016e5526f5)@dockimbel Ok. I'll replace everywhere I see it on the GTK backend. Will have a look on the other files too.

qtxie

[09:20](#msg58131855cff50e6c558f892a)@meijeru We can add those features for drawing text.

DideC

[09:37](#msg58131c74806316005dcbc55c)@qtxie There is an `angle` property in the `font` object!. For what purpose is it there?  
And `translate`, `scale` and `rotate` does not have any effect on `text` command, is this normal?

qtxie

[09:48](#msg58131ee5cff50e6c558f89f6)@DideC I think the `angle` is used for the case that you want to have a custom `Italic` font.

[09:53](#msg58131ffce236ecba1966dcf7)We does not support transformation on text for now and we will support it.

DideC

[10:05](#msg581322f7806316005dcbdeda)Thanks.

meijeru

[10:19](#msg58132626c3569a036e29da35)@qtxie Thanks. I will make a wish ticket (low priority) for it.

## Saturday 29th October, 2016

7hi4g0

[03:03](#msg5814117cc3569a036e2e3586)Pango, the font rendering engine for GTK, supports the angle property, allowing to render text diagonally.

[03:04](#msg581411bec3569a036e2e366a)I thought that the angle property in `font!` was to do just that. Render text diagonally or vertically, etc.

## Sunday 30th October, 2016

smartmic

[20:56](#msg58165e80482c168b22d190bb)Hi there, I want to connect from Red/System to a function of a shared library which was compiled from Fortran source code. The input arguments are two floats and one array of length 21, also floats. I managed to write an `#import` statement using 23 single `[pointer! [float!]]` lines. Is there a more elegant way to declare array datatypes in the `#import` code?

## Monday 31st October, 2016

dockimbel

[09:09](#msg58170a2e7b15d16e55c8dafd)@smartmic If the array is passed on stack, currently no other way. We are working on some improvements to Red/System imports, so we will add some new syntax to cover that need.

## Wednesday 2nd November, 2016

yykav

[07:24](#msg581994b0806316005dea09ac)Hi! Is there a way to pass the structure (interface part of c-library binding) from Red/Sytem to Red? Is it possible over vector! or binary!?

## Saturday 5th November, 2016

Zamlox

[00:09](#msg581d233a6cb72076303974e6)@dockimbel I looked into

```
libRedRT
```

generation code and I don't know why some functions declarations are prefixed with

```
exec/
```

in

```
libRedRT-include.red
```

and how are they added. For those prefixed with

```
red/
```

I assume they are added through

```
libRedRT-exports.red
```

dockimbel

[06:39](#msg581d7e9ceed0c3125f3b874f)@Zamlox Those are captured by the compiler and added to libRedRT. The `exec/` prefix is for accessing encapsulated compiled Red code.

Zamlox

[06:55](#msg581d825fe097df757571e8d1)@dockimbel all right, thanks.

dockimbel

[07:01](#msg581d83bbe462097a300ebc92)@Zamlox The code for adding them to libRedRT is there: https://github.com/red/red/blob/master/system/utils/libRedRT.r#L88

Zamlox

[07:03](#msg581d8425eed0c3125f3b979e)@dockimbel right, but what I don't know is how functions are prefixed with

```
exec/
```

, I mean where is the location in source where they receive that prefix.

dockimbel

[07:04](#msg581d8475e462097a300ebf12)@Zamlox See `prefix-exec` function in %red/compiler.r.

Zamlox

[07:05](#msg581d84d6eed0c3125f3b9ad6)@dockimbel all right, thank you. I will continue my self study from that point ;)

dockimbel

[07:07](#msg581d85456cb72076303ad47c)Feel free to ask any question about it if it's not clear.

Zamlox

[07:07](#msg581d854fe097df757571f333)ok

## Sunday 27th November, 2016

meijeru

[13:07](#msg583adaaa16207f7b0eaf0eca)@dockimbel Just curious, in `process-typecheck-directive` in the compiler, certain built-ins are protected from macro replacement: `unless, forever, does, prin, positive?, negative?, max, min`. Why just these?

dockimbel

[16:52](#msg583b0f6b73abd79c55a1dba2)@meijeru Because the compiler needs them untouched in order to identify the function's name. Though, now that I'm looking back at that, I guess the R/S compiler should know what the function's name is, and pass it through the `#typecheck` directive.

meijeru

[16:56](#msg583b10338d65e3830ea7b06c)Isn't that the case for all built-ins?

dockimbel

[16:58](#msg583b10998d65e3830ea7b219)Only `native!` functions are using `#typecheck` directives. And among those, only the few above are colliding with existing macros.

meijeru

[17:12](#msg583b140f1dec193f14f79830)I see. Thank you :smile:

## Monday 28th November, 2016

ifgem

[15:58](#msg583c543816207f7b0eb6535d)How can I use wchar, LPCWSTR in Red/System?:)

dockimbel

[17:42](#msg583c6c8e89d179bf4dd6448a)@ifgem Roughtly:  
\* encoding a `red-string!` to UTF16:

```
unicode/to-utf16 <str>
```

\* converting an external UTF-16 string to `red-string!`:

```
str: string/load as-c-string <utf16-buffer> <number of codepoints> UTF-16LE
```

[17:45](#msg583c6d3073abd79c55a8cc7a)If you need to encode a literal string from R/S in UTF-16, use the `#u16` directive as prefix:

```
#u16 "hello"
```

## Tuesday 29th November, 2016

ifgem

[08:59](#msg583d4371381827c24d948572)@dockimbel thank you!!!

[09:45](#msg583d4e468d65e3830eb37306)@dockimbel how can I import/include unicode.reds?:)

dockimbel

[09:47](#msg583d4ecc8255fe6b76e03823)@ifgem It's already in the runtime, you don't need to include it as long as you compile a Red script and not a R/S one.

ifgem

[10:04](#msg583d52c48255fe6b76e04ef6)@dockimbel I see:) How can I play with my routines in REPL?:)

dockimbel

[10:23](#msg583d57078d65e3830eb3a872)You can call them directly, but you can't change them or create new ones from the REPL. That will be possible when we'll have a JIT-compiler.

ifgem

[12:18](#msg583d722089d179bf4ddbb777)@dockimbel

```
Compiling to native code...
*** Compilation Error: undefined symbol: red/unicode/to-utf16
*** in file: %/c/Users/Їшчшъ1/Desktop/auto-red/autoit.red
*** in function: exec/press
*** at line: 326
*** near: [
    unicode/to-utf16 str
]
```

[12:20](#msg583d727389d179bf4ddbb8d6)@dockimbel btw, is it correct way to interact with Red?

```
mouse-pos: routine [
    /local
    pair [red-pair!]
] [
    pair: as red-pair! stack/arguments

    autoit/mouse-get-pos autoit/mouse-pos

    pair/x: autoit/mouse-pos/x
    pair/y: autoit/mouse-pos/y
    pair/header: TYPE_PAIR
]
```

dockimbel

[12:29](#msg583d749d8d65e3830eb4517c)@ifgem Your routine code looks correct. For the above error, I can't say anything about it until you show me the source code that produced it. Is `press` a routine? Also are you using libRedRT? If so, you might want to force a custom version using the `-u` compilation option each time you add new Red runtime API calls to your code.

ifgem

[12:39](#msg583d77028255fe6b76e11750)@dockimbel

```
press: routine [
    str [string!]
] [
    autoit/send as byte-ptr! unicode/to-utf16 str 0
]
```

dockimbel

[13:00](#msg583d7be48d65e3830eb47e45)Most probably related to unfit libRedRT version then.

ifgem

[13:05](#msg583d7d10444b3778766dd6e9)@dockimbel I've deleted libRedRt files, but it's still not working:)

dockimbel

[13:15](#msg583d7f738d65e3830eb490bb)You need to use the `-u` option at least once, else it will never work in dev mode. That option will create a specific libRedRT version for your source code, exporting the functions required by your routines and R/S code.

ifgem

[13:19](#msg583d804916207f7b0ebcfb97)@dockimbel with -u option:

```
Compiling to native code...
*** libRedRT Error: definition not found for red
```

dockimbel

[13:22](#msg583d8112381827c24d95def7)Does it work in release mode (using `-r`)?

ifgem

[13:23](#msg583d8141444b3778766dece6)@dockimbel yes, I've just tested it:))

dockimbel

[13:24](#msg583d8178381827c24d95e17a)You might want to open a ticket then about it, with minimal code to reproduce the issue.

ifgem

[13:24](#msg583d819973abd79c55ae951d)@dockimbel ok:)

dockimbel

[13:25](#msg583d81d8444b3778766deffc)We haven't much tested `-u` option so far, so it might still be buggy.

ifgem

[13:33](#msg583d83a68255fe6b76e16411)@dockimbel done. I hope it will help you.

ghost~5680c5f416b6c7089cc058a5

[13:34](#msg583d83f0381827c24d95ef35)@dockimbel Instead of `-u` compiler switch, can't the compiler detect r/s code and automatically rebuild libRedRT the first time the code is compiled?

dockimbel

[14:30](#msg583d90f68d65e3830eb4fba4)@nc-x If it just "detects" R/S code, then it will rebuild libRedRT every time, which defeat its purpose. The `-u` option does a deep analysis of the "needs" of your code and builds a custom libRedRT version.

[14:39](#msg583d93158d65e3830eb509ce)@ifgem Thanks. Will have a look at it right now.

[15:06](#msg583d99808255fe6b76e1e920)@ifgem I've pushed a fix, give it a try. If it fails (let me know), try doing a `red clear`, then try again. Thanks for reporting it. ;-)

ifgem

[15:44](#msg583da25a73abd79c55af75ab)@dockimbel it works:))

## Sunday 4th December, 2016

ifgem

[07:08](#msg5843c0ecbc32453c2889a392)@dockimbel how can I use this function in Red/System?  
RegisterHotKey https://msdn.microsoft.com/ru-ru/library/windows/desktop/ms646309(v=vs.85).aspx

dockimbel

[09:48](#msg5843e66690f847041bf6e974)@ifgem The View event loop does not have a handler for WM\_HOTKEY messages, so you would need to modify the View source code for that. Once we have ports and full I/O, we'll have a way to handle that from Red level. But why would you need that in the first place when you can define global key handlers in View?

ifgem

[11:53](#msg584403d0bc32453c288ac957)@dockimbel sorry, but I don't understand how I can handle system-wide hotkey using view. Could you please give me an example?:)

dockimbel

[12:39](#msg58440e8744f3e83528d734b4)@ifgem System-wide, you can't with the existing code. I thought you wanted an application-wide shortcut.
