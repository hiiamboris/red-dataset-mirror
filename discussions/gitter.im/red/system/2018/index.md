# Archived messages from: [gitter.im/red/red/system](/gitter.im/red/red/system/) from year: 2018

## Tuesday 2nd January, 2018

cwt8805

[08:40](#msg5a4b4585b48e8c35668e0660)@greggirwin I want to write a socket client with a view, while waiting for socket message, I can interact with GUI

greggirwin

[08:42](#msg5a4b45de03838b2f2a5ef2d4)@cwt8805, that would happen at the Red level, not Red/System, but you'll need to wait for 0.7.0 and Full I/O.

cwt8805

[08:59](#msg5a4b49db5355812e5740aafe)@greggirwin thank you for replying. if i want to try Red/System for this goal, would you find a solution for me? for socket part, I find this https://github.com/Oldes/code/tree/master/Library/Sockets, and it works.

greggirwin

[09:04](#msg5a4b4b270163b02810a19ee4)@cwt8805, maybe @Oldes will join us and give some advice. I haven't tried using his socket lib, so I can't help at the moment.

rebolek

[09:04](#msg5a4b4b2803838b2f2a5f09df)@cwt8805 I guess you should ask @Oldes , he may give you some guidance as author.

[09:05](#msg5a4b4b4768d092bb62143038)@greggirwin see, you were faster :speedboat:

greggirwin

[09:05](#msg5a4b4b5868d092bb62143098)Yes, but no code involved. :^)

rebolek

[09:05](#msg5a4b4b7103838b2f2a5f0aab):)

greggirwin

[09:06](#msg5a4b4b8368d092bb6214317c)I'm \*really* fast when telling people I can't help them.

rebolek

[09:07](#msg5a4b4bd80163b02810a1a15d):D

toomasv

[10:00](#msg5a4b583329ec6ac311aba723)@meijeru Great document on \[R/S BNF](http://static.red-lang.org/A\_BNF\_grammar\_of\_Red\_System.pdf) :+1:

meijeru

[11:26](#msg5a4b6c6684fb74b9402ac0d0)@toomasv Thanks, but it is in need of updating... Red/System has evolved since 2012, although not as much as Red :wink:

are1000

[12:40](#msg5a4b7da868d092bb62152c23)Folks, I have compiled this simple c code as an `dll` using Cygwin's `gcc version 6.4.0`. I'm trying to import it in `Red/System` code, but after compilation it silently fails.

[12:40](#msg5a4b7dc10163b02810a29f86)

```
#include <stdio.h>

int hello () {
  printf("Hello world\n");
}
```

[12:40](#msg5a4b7dcf232e79134db83929)

```
Red/System []

#import [
  "test.dll" cdecl [
    hello: "hello" []
  ]
]

print "hello world"

hello
```

[12:41](#msg5a4b7e01edd223081102afb0)Why isn't it working?

greggirwin

[19:05](#msg5a4bd805ba39a53f1acaa62e)@are1000, having not tried it, my guess is that `printf` doesn't know where the Red console is, as an output device. Can you successfully call a func from a DLL that just returns data to Red?

## Wednesday 3th January, 2018

PeterWAWood

[00:09](#msg5a4c1f2884fb74b9402e7a04)@are1000 I noticed that you declared the C function "hello" to return an integer but when you declared the function signature in the Red/System program you omitted the return value.

[00:11](#msg5a4c1fa35355812e5745016a)Perhaps you could try again with the return value specified:

```
hello: "hello" [
                                 return:  [integer!]
                        ]
```

Oldes

[20:00](#msg5a4d36530163b02810ab4f26)@cwt8805 I don't know what you exactly need... I was playing with Sockets to educate myself... @dockimbel was not interested in it when I was pushing it into official red/code repository: https://github.com/red/code/pull/77 so I stopped. I'm quite busy now with not Red or Rebol related project anyway.

## Thursday 4th January, 2018

endo64

[07:07](#msg5a4dd2ad29ec6ac311b828f5)@Oldes Your stuff is quite nice for who wants to dive into Red/System development, it is complete and working.

are1000

[12:20](#msg5a4e1c1bedd22308110fc526)how to compile a Red/System script to exe? I'm confused

[12:20](#msg5a4e1c27ba39a53f1ad5d2c8)https://github.com/red/red/wiki/Red-System-tutorial-for-newcomers-English-version this is not working unfortunately

PeterWAWood

[12:22](#msg5a4e1c795355812e574ed459)@are1000 Which operating system are you using?

are1000

[12:22](#msg5a4e1c80232e79134dc57ec0)Windows

PeterWAWood

[12:22](#msg5a4e1c9ab48e8c35669c3d3d)Do you use the pre-built "encapped" red.exe

are1000

[12:23](#msg5a4e1cb029ec6ac311b9b6e3)I have both sources (with rebol) and prebuild red.exe

[12:27](#msg5a4e1db703838b2f2a6d080e)This is my output in rebol:

[12:27](#msg5a4e1dbab48e8c35669c42f5)

```
>> do/args %../source/system/rsc.r "%../redpm/main.red"
Script: "Red/System compiler wrapper" (none)
Script: "Red/System compiler" (none)
** Script Error: do-cache has no value
** Near: do-cache %system/utils/profiler.r
profiler/active?: no
do-cache
```

ghost~5680c5f416b6c7089cc058a5

[12:28](#msg5a4e1dd8ba39a53f1ad5db34)Compiling red/system source is done the same way as compiling red scripts.

[12:28](#msg5a4e1de4ba39a53f1ad5db9f)Which rebol version are you using?

PeterWAWood

[12:28](#msg5a4e1df4edd22308110fcfce)Here is how I did it using PowerShell:

```
PS E:\Red\red> rebol -qs red.r ../../Code/Red-System/test.reds
PS E:\Red\red> ./test
0.0016849578929099
```

ghost~5680c5f416b6c7089cc058a5

[12:29](#msg5a4e1e19ba39a53f1ad5dcde)Instead of `do/args %../source/system/rsc.r "%../redpm/main.red"`  
It is better to do

```
do %red.r
rc "-r %location/of/file"
```

[12:29](#msg5a4e1e2d03838b2f2a6d0a85)`-r` is for compiling in release mode

are1000

[12:32](#msg5a4e1ed00163b02810afa9d2)Ok, got it, thanks @nc-x and @PeterWAWood !

[12:32](#msg5a4e1eeb03838b2f2a6d0fbf)Also, my imported DLL still doesn't work @greggirwin and @PeterWAWood

[12:32](#msg5a4e1ef4ba39a53f1ad5e0f9)

```
#include <stdio.h>

int hello () {
  return 42;
}
```

[12:32](#msg5a4e1ef903838b2f2a6d1007)

```
Red/System []

#import [
  "test.dll" cdecl [
    hello: "hello" [
      return: [integer!]
    ]
  ]
]

print hello
```

[12:33](#msg5a4e1f14ce68c3bc7479ccf1)It doesn't throw, it doesn't output anything

PeterWAWood

[12:44](#msg5a4e219968d092bb62224428)@are1000 I am not a C expert but I think that you need to export the hello function so that it can be accessed in the dll.

rebolek

[12:46](#msg5a4e2235ce68c3bc7479dde3)@are1000 do you have proper header file for your C source?

[12:47](#msg5a4e22560163b02810afbcb3)Something like

```
extern int hello ();
```

are1000

[12:52](#msg5a4e2375232e79134dc5a892)

```
__declspec(dllexport) int __cdecl add(int a, int b) {
  return (a + b);
}
```

[12:53](#msg5a4e23cc29ec6ac311b9de73)

```
Red/System []

#import [
  "test.dll" cdecl [
    hello: "add" [
      a [integer!]
      b [integer!]
      return: [integer!]
    ]
  ]
]

print hello 2 3
```

meijeru

[12:57](#msg5a4e24b3232e79134dc5b15d)I am reviewing my formal Red/System write-up that is published \[here](http://static.red-lang.org/A\_BNF\_grammar\_of\_Red\_System.pdf). I have a problem understanding what the use of the `stdcall` attribute is. I quote from the reference document:  
\*  
(6.3.2)  
The stdcall attribute is also accepted (it is already the default calling convention in Red/System), but will have no effect for internal functions. Imported functions with such attribute will be compiled as callbacks, but in such case, the more explicit callback attribute should be used.  
6.3.3 Callback  
The purpose of the callback attribute is to manually force a callback compilation mode for a function that the compiler failed to infer as a callback. It can be used as a more meaningful replacement for stdcall when used on Windows.  
The compiler can correctly infer callbacks when a function pointer is passed as a get-word to an imported function call. Other cases of passing a Red/System function pointer cannot be properly detected as external callbacks.  
For example, if Red/System function pointers are passed to an external API in an indirect way (filling an array or a structure), and those functions will be later called by the external code (OS or a library), the callback attribute \*must* be used in order for correct code to be generated. Moreover, if the external caller is using C calling convention, then the additional cdecl is required.  
\*  
My conclusion: `stdcall` may be abolished. It serves no purpose. Am I overlooking something??

ghost~5680c5f416b6c7089cc058a5

[13:06](#msg5a4e26ed03838b2f2a6d3c16)@are1000 Were you able to run your code? because your last code worked for me.

PeterWAWood

[13:13](#msg5a4e2893ba39a53f1ad614fb)@meijeru I believe `stdcall` is the default for Windows. Perhaps this \[wikipedia page](https://en.wikipedia.org/wiki/X86\_calling\_conventions) will help.

meijeru

[13:18](#msg5a4e29935355812e574f1719)Right, but it says that `stdcall` will not have effect on internal functions. So what is the point?

are1000

[13:18](#msg5a4e29b1232e79134dc5ca06)@nc-x what commands did you use? It didn't work for me, maybe wrong arguments?

ghost~5680c5f416b6c7089cc058a5

[13:22](#msg5a4e2a8468d092bb62227629)@are1000 are you using 64-bit c compiler?  
Currently red is 32-bit only and cannot load 64 bit dlls.

are1000

[13:22](#msg5a4e2a97ce68c3bc747a0c8c)Oh, that certainly must be the case

[13:22](#msg5a4e2aad29ec6ac311ba047b)But it would be really great if it could throw some error

ghost~5680c5f416b6c7089cc058a5

[13:25](#msg5a4e2b4e232e79134dc5d206)\[!\[Screenshot (111).png](https://files.gitter.im/red/red/system/gla8/thumb/Screenshot-\_111\_.png)](https://files.gitter.im/red/red/system/gla8/Screenshot-\_111\_.png)

[13:25](#msg5a4e2b57edd223081110189f)I do get an error (though it says nothing about the issue.)

are1000

[13:25](#msg5a4e2b6703838b2f2a6d5325)I get that error if I doubleclick the exe

[13:26](#msg5a4e2b7429ec6ac311ba09de)If i run it through cygwin, I get nothing

ghost~5680c5f416b6c7089cc058a5

[13:27](#msg5a4e2bb0edd2230811101ad5)BTW the commands I used -

File saved as `tdll.c`  
Compiled using

```
gcc -c -o tdll.o tdll.c
gcc  -o tdll.dll -shared tdll.o
```

And the R/S file compiled using -

```
red -c -r t.reds
```

where `t.reds` file contains the source code.

are1000

[13:27](#msg5a4e2bcbb48e8c35669c8846)Will try to reproduce your steps

ghost~5680c5f416b6c7089cc058a5

[13:28](#msg5a4e2bf8edd2230811101c51)@are1000  
&gt; If i run it through cygwin, I get nothing

I use msys2 with mingw\_w64, maybe the compilation commands are different for `cygwin` than what I used. Not sure. Try it and report if any issues arise.

are1000

[13:33](#msg5a4e2d165355812e574f2a9c)OK, it worked through mingw's gcc

[13:33](#msg5a4e2d22232e79134dc5dda5)Thank you for your help @nc-x !

ghost~5680c5f416b6c7089cc058a5

[13:34](#msg5a4e2d60b48e8c35669c8f81)You are welcome :smile:

are1000

[13:57](#msg5a4e32ad68d092bb62229fdd)Has anyone tried to compile a DLL for Red using Rust?

ghost~5680c5f416b6c7089cc058a5

[14:01](#msg5a4e339e232e79134dc60265)You mean compile a dll in Rust and load it in Red? It should be pretty straightforward.

are1000

[14:01](#msg5a4e33baba39a53f1ad650af)Yeah, I'm going to try that, since C is alien to me and I thought about giving Rust a shot

ghost~5680c5f416b6c7089cc058a5

[14:03](#msg5a4e34475355812e574f5767)I think this is the required section in Rust docs - https://doc.rust-lang.org/book/first-edition/ffi.html#calling-rust-code-from-c

[14:04](#msg5a4e34840163b02810b0226a)You need to turn off name mangling and use `extern` and then you should be able to load it in Red.

[14:05](#msg5a4e349103838b2f2a6d88c7)The only thing to note is that Rust should be 32 bit

are1000

[14:22](#msg5a4e38bcce68c3bc747a5d90)It works!

[14:22](#msg5a4e38c368d092bb6222c136)Really straightforward actually!

PeterWAWood

[22:46](#msg5a4eaed40163b02810b2db1f)@meijeru Importing functions from Windows DLLs

meijeru

[23:02](#msg5a4eb28203838b2f2a706b51)@PeterWAWood The doc says: `Imported functions with such attribute will be compiled as callbacks, but in such case, the more explicit callback attribute should be used.`

[23:03](#msg5a4eb2b8ba39a53f1ad92042)See also @dockimbel 's comment on #3186

PeterWAWood

[23:33](#msg5a4eb9cc0163b02810b31281)@meijeru Sorry I didn't see that.

## Wednesday 10th January, 2018

9214

[14:14](#msg5a561fc9ba39a53f1afbcf4c)@Oldes do you, by any chance, plan to write some tutorials on Red/System? :)

Oldes

[14:15](#msg5a561fe6b48e8c3566c2ffe5)I don't think so.

rebolek

[14:15](#msg5a561ff56117191e614bc5b7):)

9214

[14:15](#msg5a562001ba39a53f1afbd099):^\\

greggirwin

[17:12](#msg5a564991290a1f456171ac74)@9214, hey, that's my line!

## Monday 22nd January, 2018

gltewalt

[19:02](#msg5a6635600ad3e04b1b5516bd)So in context.reds, in `set` it calls `set-in` with `event?` check set to true, but in `set-in` it never enters the `if event?` block

[19:04](#msg5a6635c2ce68c3bc74ed79f8)

```
either ON_STACK?(ctx) [
	probe "** in 'either ON_STACK?' - It's on the stack **"
			copy-cell value (as red-value! ctx/values) + word/index
		][
			values: as series! ctx/values/value
			slot: values/offset + word/index
			
			if event? [
		probe "** In the 'event?' if branch in 'set-in' **"	
				s: as series! ctx/self/value
				obj: as red-object! s/offset + 1
				if all [TYPE_OF(obj) = TYPE_OBJECT obj/on-set <> null][
					probe "in if all [TYPE_OF(obj) = TYPE_OBJECT obj/on-set <> null]"
					old: stack/push slot
					probe "old is -"
					?? old
					word: as red-word! word
					probe "word is -"
					?? word
					copy-cell value slot
					object/fire-on-set obj word old value
					stack/top: old - 1
					return slot
				]
			]
```

[19:10](#msg5a663728d9f895c360491131)Is it supposed to be "If it's on stack OR if it's on stack and an Object"?

[19:13](#msg5a6637c2e0141226507a102b)Is it for objects that have reactors?

9214

[19:13](#msg5a6637ea6117191e619b6c86)@gltewalt why won't you check with reactors?

gltewalt

[19:14](#msg5a6637ffd9f895c360491521)Uhh... cuz I don't know how. I've never used one.

9214

[19:14](#msg5a66381d517037a212dd2739)

```
text
r: make reactor! [x: 1 y: is [x + 1]]
r/x: 1336
```

[19:15](#msg5a663865ae53c159031e95a6)`object/fire-on-set` makes me think that it's indeed has something to do with reactors

gltewalt

[19:16](#msg5a663879d9f895c360491865)Yep, it is

9214

[19:16](#msg5a663896d9f895c3604918d6)and `obj/on-set <> null`

[19:16](#msg5a6638a10ad3e04b1b552af1)looks like a check if object is a reactive one

[19:17](#msg5a6638c2ce68c3bc74ed8e27)and `probe "word is -"` lines - is it your debugging?

gltewalt

[19:17](#msg5a6638d05a9ebe4f75be1876)Yes

[19:18](#msg5a66390a98927d5745213dfb)Are functions not considered Object events?

[19:18](#msg5a66391e6117191e619b73cf)`;-- TRUE: trigger object events`

greggirwin

[19:19](#msg5a66392d0ad3e04b1b552db2)In the `set-in` header:

&gt; event? \[logic!] ;-- TRUE: trigger object events

So I'll guess you're on track with this.

gltewalt

[19:19](#msg5a66393fd9f895c360491c58)Yeah

greggirwin

[19:19](#msg5a663940517037a212dd2f42)I'm slow again. :^(

[19:19](#msg5a66395a5ade18be39abfbc3)&gt; Are functions not considered Object events?

No. If I understand the question.

9214

[19:20](#msg5a663999517037a212dd3255)same crash with reactive object btw

greggirwin

[19:22](#msg5a6639e2517037a212dd33d0)Interesting, in %structures.reds, `on-set` in object holds the same spot as `self` in context. And says it's ";-- on-set callback info"

9214

[19:30](#msg5a663be7d9f895c360492cc2)maybe it contains an index of a word that triggered that event?

greggirwin

[19:33](#msg5a663c72517037a212dd446d)@gltewalt, do you need to probe the `word/symbol`. I haven't probed from R/S, so don't know how it handles structs.

9214

[19:33](#msg5a663c735a9ebe4f75be2e28)can anyone in a good will draw a graph of how Red's codebase is organized?

[19:33](#msg5a663c9bce68c3bc74eda5e3)I mean, how one file/directory relates to another and what's the hierarchy between all elements

[19:35](#msg5a663cf55ade18be39ac11d9)uh-huh! https://github.com/red/red/blob/master/runtime/debug-tools.reds

[19:36](#msg5a663d45517037a212dd4806)does the crash happens in compiled code too?

greggirwin

[19:36](#msg5a663d59d9f895c36049340d)OOohhh, if I weren't so far behind in other things @9214...

9214

[19:37](#msg5a663d880ad3e04b1b554531)@greggirwin :question:

greggirwin

[19:38](#msg5a663db1ae53c159031eb483)I mean digging into the debugging stuff. I get excited by new things.

gltewalt

[19:38](#msg5a663dbe517037a212dd4a56)Trying it

greggirwin

[19:38](#msg5a663dc9e0141226507a3355)On the graph, I could maybe do some, but time is very short this week.

9214

[19:40](#msg5a663e2a5ade18be39ac1c53)@greggirwin just some explanation of how everything organized, because even if I want to contribute I don't even get where to start looking for bugs and stuff

gltewalt

[19:42](#msg5a663eb30ad3e04b1b554a99)probe node/sybol gives `*** Compilation Error: undefined pointer index variable`

[19:42](#msg5a663eba5ade18be39ac2021)err, node/symbol

[19:44](#msg5a663f0eae53c159031ebc93)trying `node/word`

[19:44](#msg5a663f2c6117191e619b993a)Nope. `*** Compilation Error: attempt to use pointer indexing with a non-integer! variable`

[19:50](#msg5a66407fe0141226507a46cd)Look at `get-in` vs `set-in`. Why are the checks so different?

9214

[19:51](#msg5a6640c898927d5745216a6a)these 3 lines look suspicious:  
\* https://github.com/red/red/blob/master/runtime/interpreter.reds#L644  
\* https://github.com/red/red/blob/master/runtime/interpreter.reds#L696 (the cause of all trouble)  
\* https://github.com/red/red/blob/master/runtime/interpreter.reds#L706

gltewalt

[19:55](#msg5a6641a65a9ebe4f75be4fb1)Also, there appears to be TYPE\_OBJECT and TYPE\_CONTEXT. I assumed they were equivalent.

[19:55](#msg5a6641c35ade18be39ac325c)`set-in` only uses TYPE\_OBJECT

9214

[19:55](#msg5a6641cece68c3bc74edc66d)IIRC there's low-level (hidden) `context!` datatype

gltewalt

[19:57](#msg5a66421d5a9ebe4f75be51f5)I should have gone ahead and went through the Red/System doc a long time ago. I thought I should learn parse and all the high level stuff first, though, but I still haven't managed all of it

9214

[19:57](#msg5a664234ce68c3bc74edc7f2)idk, we can continue to speculate on this and build different theories, or give up on our lives and start to grok Red codebase (and to grow our beards :neckbeard: )

[19:58](#msg5a6642525a9ebe4f75be53cc)or just give up and wait for Doc to come back and save his flock :sheep:

gltewalt

[19:58](#msg5a66425a0ad3e04b1b55620f)I know I'm not doing it the smart way, but I woke up today and couldn't help it. I had to poke around

9214

[19:59](#msg5a6642b2517037a212dd66b4)all I can say from looking at the `interpreter.reds` is that this issue only related to path notation in which last element is a function

gltewalt

[20:02](#msg5a66434d0ad3e04b1b5569d5)I know `node: word/ctx` goes to all zeros right before crash but I don't know why. That's about it :smile:

9214

[20:02](#msg5a66436b5ade18be39ac3b48)@gltewalt I'd compared behaviors of fresh buggy console and the older stable build

gltewalt

[20:03](#msg5a66437dce68c3bc74edcfb8)I'm not sure how to get and build old one

9214

[20:03](#msg5a66438b98927d5745217b1f)https://static.red-lang.org/dl/win/red-063.exe

gltewalt

[20:04](#msg5a6643b9ae53c159031edbc9)I mean, source of last known good

[20:05](#msg5a6643f70ad3e04b1b556ed2)I feel like a little kid sometimes - so much I still don't know

9214

[20:08](#msg5a6644c6d9f895c360496077)@gltewalt you can just comment out the line

[20:08](#msg5a6644d798927d5745218505)https://github.com/red/red/blob/master/runtime/interpreter.reds#L696

[20:09](#msg5a664517ae53c159031ee565)then recompile and check your zero node thing

gltewalt

[20:12](#msg5a664591ae53c159031ee86f)Yup

[20:12](#msg5a6645aa6117191e619bc0b8)Comment out `stack/set-last stack/top` and no crash

9214

[20:13](#msg5a6645d35ade18be39ac4c82)and `node: word/ctx` goes to zero?

gltewalt

[20:13](#msg5a6645dbce68c3bc74eddec6)No

9214

[20:13](#msg5a6645f3ae53c159031eeac8)well, then maybe you're onto something

gltewalt

[20:15](#msg5a66464798927d5745218eda)Your example on #3156 also works with that commented out

[20:15](#msg5a6646795ade18be39ac5130)with `stack set-last stack/top` commented out

9214

[20:16](#msg5a6646a25ade18be39ac5265)since `node` goes down (decrements)...

[20:16](#msg5a6646afae53c159031eee4e)this is the only thing that decrements in `eval-path`  
https://github.com/red/red/blob/master/runtime/interpreter.reds#L679

[20:17](#msg5a6646bc5ade18be39ac52c3)and it's also related to `stack/top`

[20:17](#msg5a6646e9ce68c3bc74ede450)ah, no, my bad, not the only one

[20:18](#msg5a6647160ad3e04b1b5581ff)@gltewalt and what's the step of decrementing?

gltewalt

[20:19](#msg5a664766d9f895c3604972cf)https://i.imgur.com/T50Ah28.jpg

[20:21](#msg5a6647af5ade18be39ac58cd)That's with line commented out

[20:22](#msg5a6647eee0141226507a7774)This is "blows up version" with @rebolek example  
https://i.imgur.com/ljmGqng.jpg

[20:23](#msg5a66482498927d5745219d84)I seperated TO\_CTX(node) into a different variable `ctx`

9214

[20:23](#msg5a6648445a9ebe4f75be7b89)so it starts to spam with context's creation and causes a segfault

[20:24](#msg5a66486298927d5745219f39)or something like that

gltewalt

[20:28](#msg5a66498998927d574521a63f)Reboleks example with only `node` variable. With `stack/set-last stack/top` in play  
https://i.imgur.com/R6YzGbw.jpg

9214

[20:35](#msg5a664afb0ad3e04b1b559a58)@9214 scratches his beard

## Tuesday 23th January, 2018

gltewalt

[01:51](#msg5a66950c5ade18be39adedda)`node` gets to a `0000000` and then `TO_CTX(node)` blows it up

[01:51](#msg5a66953b5ade18be39adeec6)`TO_CTX(node)` is a macro in macros.reds  
`#define TO_CTX(node) (as red-context! ((as series! node/value) + 1))`

[01:53](#msg5a6695845ade18be39adef7c)`stack/set-last stack/top` is the problem, but not sure what it is doing

[04:25](#msg5a66b921e0141226507cbfde)I think I have a fix, but `%run-all.r` has some failed tests. Anyone else care to try the change and run tests?

[08:28](#msg5a66f223ae53c15903223efb)Needs `stack/push` I believe instead of `stack/set-last`

[08:28](#msg5a66f240ae53c15903223fa5)`unless sub? [stack/push stack/top]`

rebolek

[08:29](#msg5a66f260ae53c1590322402c)Hmm, could you make a pull request that I can pull locally and test?

9214

[08:48](#msg5a66f6d55a9ebe4f75c1ce58)@gltewalt does it work as expected with your fix? https://github.com/red/red/issues/3098

Oldes

[10:41](#msg5a6711765ade18be39b03513)Does anybody know how to initialize in Red/System a new object with some key and a value?

gltewalt

[15:29](#msg5a6754e2ae53c1590324add4)Just waking up

9214

[15:32](#msg5a67557ece68c3bc74f38046)@Oldes sorry m8, we're not that proficient in R/S :(

gltewalt

[16:11](#msg5a675e9d0ad3e04b1b5b4a14)@9214 Nope. Doesn't fix that one.

9214

[16:12](#msg5a675efcc95f22546dd58418)then, if it causes some tests to fail and doesn't fix the issue (which caused the current regression), but fixes the crash... I don't think it's a fix, since you can just comment out added line and at least make all tests pass

[16:12](#msg5a675f0aae53c1590324f628)not to mention that you may introduce another regression somewhere

gltewalt

[16:13](#msg5a675f2ad9f895c3604f5325)All tests dont pass even if I comment out the line

9214

[16:13](#msg5a675f34d9f895c3604f5357)hmm

[16:14](#msg5a675f54d9f895c3604f53bb)then maybe something is wrong with quicktest or your local build?

gltewalt

[16:15](#msg5a675f8ce014122650807e04)more likely my local, but hard to tell unless someone runs `%run-all` on a clean `git pull`

9214

[16:15](#msg5a675fb7c95f22546dd588e4)I don't think there's a need in that, since you can see the status of current build in readme

[16:16](#msg5a675fc1e014122650807f4c)if it passes all automatic checks, then everything is fine

gltewalt

[16:16](#msg5a675fe6e01412265080808c)are they using the redbol quicktest?

9214

[16:17](#msg5a676016ce68c3bc74f3caae)yes, you can even check the logs

[16:17](#msg5a67602f517037a212e38aff)https://ci.appveyor.com/project/red/red/branch/master

gltewalt

[16:17](#msg5a676030d9f895c3604f58f8)must be my local

[16:29](#msg5a6762ce6117191e61a1a46b)This fixes #3098, #3156, #3128

```
either sub? [stack/push stack/top][stack/set-last stack/top]
```

9214

[16:29](#msg5a6762ebce68c3bc74f3de58)and all tests pass?

gltewalt

[16:30](#msg5a67633b517037a212e3a781)except @toomasv will have to type `foreach y (n2/asc) [probe y/l]`

9214

[16:31](#msg5a67637eae53c15903251677)I'd consider this as a regression

gltewalt

[16:33](#msg5a6763eb6117191e61a1af40)Try it out

[16:35](#msg5a67646898927d5745279b29)I gotta get off and running for the day

[16:36](#msg5a676485517037a212e3afea)Someone else can see if the tests pass for them, and if so they can do the PR

[16:48](#msg5a676752517037a212e3c157)I can’t get tests to pass even with new git pull, so I’m hamstring. For now

## Friday 26th January, 2018

mydoghasworms

[10:15](#msg5a6affb66117191e61b548a1)I have been thinking lately a lot of interop with C libraries. Has anybody done any research or work into writing a parser (in Red, of course) for C code that would emit Red/System code? Is this feasible or even possible?

In a related vein, until there is FFI support built into Red, has anyone thought of (or maybe done) writing a parser for .h files to produce Red/System code to consume functions of a C library?

I am neither a C or Red/System expert, so perhaps I am a little naïve in thinking such things are practical or doable.

[10:26](#msg5a6b026a6117191e61b5572f)Would there be any value in porting/translating C libraries to Red/System? Some features for which you need libraries in C (like &lt;math.h&gt;) are presumably all baked into Red, but what about things like networking (which I suppose will eventually have better support in Red anyway) or what about something like SQLite or OpenCV, for example? Would it be of any advantage to have those libraries translated into Red/System over just consuming the functions from the compiled C libraries?

9214

[11:15](#msg5a6b0dea98927d57453b54e0)@mydoghasworms is that what you're looking for?  
https://github.com/iceflow19/c2reds  
https://github.com/rebolek/parse-c-header

mydoghasworms

[11:20](#msg5a6b0efd0ad3e04b1b6f03b6)@9214 Well, from the description it certainly looks like it. Do both of these generate bindings for consuming libraries from C header files? At least I see the second one does. What does the first one do?

9214

[11:21](#msg5a6b0f2c4a6b0dd32b4d3b5d)ask authors? @iceflow19 @rebolek

mydoghasworms

[11:21](#msg5a6b0f3a5a9ebe4f75d8e391):+1:

[11:21](#msg5a6b0f3ece68c3bc74076f9d)Thank you!

9214

[11:21](#msg5a6b0f434a6b0dd32b4d3c35)you're welcome

rebolek

[11:24](#msg5a6b0fde4a6b0dd32b4d3ef2)@mydoghasworms it's code I haven't touched in 5+ years. ;)

mydoghasworms

[11:25](#msg5a6b1023ce68c3bc740774d3)@rebolek Have you used it with any success to create bindings for some libraries?

rebolek

[11:38](#msg5a6b13434a6b0dd32b4d4f57)@mydoghasworms AFAIK there is something missing to fully work. I may try to convert it to Red and see what it does.

mydoghasworms

[11:40](#msg5a6b13b76117191e61b5b83b)@rebolek What interests me more is the question I posed earlier: Is there any value in \*translating* entire C libaries to Red/System code (i.e. not just generating bindings) and is this even possible?

rebolek

[11:42](#msg5a6b1423ce68c3bc74078d26)Is it possible? Certainly yes. But is it worth it? I doubt it.

mydoghasworms

[11:46](#msg5a6b150c4a6b0dd32b4d5ac5)I dream of a world where Red/System replaces C for writing everything. Then I only have to worry about learning reds, and not C :-)

rebolek

[11:46](#msg5a6b151f4a6b0dd32b4d5b32):smile:

[11:58](#msg5a6b17e5494bd0f530294d1c)@mydoghasworms so it partially works, but does choke on macros (that would actually need full C-&gt;R/S translator)

mydoghasworms

[12:00](#msg5a6b185bae53c1590339763d)And also, I imagine you could run into trouble with other preprocessor directives that exist in C but not R/S, like #undef, is that right?

rebolek

[12:03](#msg5a6b18f76117191e61b5d3b4)Hm, I think you're right.

[12:03](#msg5a6b190e4a6b0dd32b4d6f6f)As I said, I haven't checked the code for 5+ years until today :)

gltewalt

[19:01](#msg5a6b7aef6117191e61b85001)Should TYPE\_OF(val) return a different number for `block` and `context`?

[19:01](#msg5a6b7b180ad3e04b1b71a1e1)`get-action-ptr-from TYPE_OF(value) ACT_REFLECT`

9214

[19:04](#msg5a6b7bd5c95f22546dec4c70)@gltewalt if you think that culprit is `body-of`, why `insert body-of ...` worked?

[19:07](#msg5a6b7c55ae53c159033be544)https://github.com/red/red/blob/master/runtime/macros.reds#L306

[19:07](#msg5a6b7c84494bd0f5302bca78)basically yes, numbers should be different  
https://github.com/red/red/blob/master/runtime/macros.reds#L13

[19:08](#msg5a6b7cac98927d57453dfc6c)block = 5, object = 32

gltewalt

[19:08](#msg5a6b7cb040259f1a33af96d8)They both return 32

[19:08](#msg5a6b7cbf40259f1a33af9729)words-of and body-of, that is

[19:09](#msg5a6b7cd35a9ebe4f75dba870)One works, the other doesn't

9214

[19:09](#msg5a6b7cf80ad3e04b1b71aa74)in case of `words-of` new block of words is created, in case of `body-of`, I think, the block that is returned is actual object's body

gltewalt

[19:09](#msg5a6b7cfa0ad3e04b1b71aa7b)With latest console `append words-of context [][ack]` works

[19:10](#msg5a6b7d0bae53c159033be9ed)Ah, ok

9214

[19:12](#msg5a6b7db9494bd0f5302bd079)@gltewalt and if you try, say, `body-of #(a 1)`?

gltewalt

[19:13](#msg5a6b7de45a9ebe4f75dbae1c)

```
>> body-of #(a 1)
== [a: 1]
```

9214

[19:14](#msg5a6b7dfe494bd0f5302bd1b1)@gltewalt no, I meant, what number `TYPE_OF` returns?

gltewalt

[19:14](#msg5a6b7e1398927d57453e05cd)I'll have to compile a script with that, hold on

9214

[19:18](#msg5a6b7ef098927d57453e0b72)https://github.com/red/red/blob/master/runtime/macros.reds#L293 :smile:

gltewalt

[19:19](#msg5a6b7f2ece68c3bc740a32ff)40

9214

[19:19](#msg5a6b7f5598927d57453e0d8d)this means that in `get-action-ptr-from TYPE_OF(value) ACT_REFLECT` datatype of argument is returned, not of the result

[19:19](#msg5a6b7f5dce68c3bc740a33b4)40 is `map!`, 32 is `object!`

gltewalt

[19:56](#msg5a6b87d7494bd0f5302c0c3c)I don't know. I thought I had a tiny trail that was leading me somewhere last night, but it's gone today. The only difference between `append*` and `insert` is that `append*` calls `insert` with the append? check set to `yes`.

```
>> insert body-of context [][ack]
== []
```

9214

[19:57](#msg5a6b8824c95f22546dec8e3c)it's probably something to do with how object's body is represented internally

[20:19](#msg5a6b8d6c0ad3e04b1b721150)since `append block item` is just `head insert tail block item`

iceflow19

[22:43](#msg5a6baf2f5a9ebe4f75dcccdf)@mydoghasworms Like @rebolek with his repo, I haven't touched c2reds in a while. Swamped over the past year with starting a new company. c2reds was the beginning of a port of c2rebol which hooks into the clang compiler (effectively using its code analyzer) to generate bindings. While in concept that seems like a decent approach, I cringe at having such a large dependency as Clang. @rebolek was writing a parser in Red itself, but that can be daunting too.

[22:49](#msg5a6bb0604a6b0dd32b50fe8b)@9214 @gltewalt Objects should be immutable in Red for reasons of static compilation, I thought. I think it was mentioned a long time ago on the blog, back when the datatype was first being implemented. It was one of the known divergences between Red and R3.

9214

[22:50](#msg5a6bb09c0ad3e04b1b72d7f6)@iceflow19 IIRC only R2 allowed to extend objects

pekr

[22:50](#msg5a6bb0b25a9ebe4f75dcd64e)No, only R3.

9214

[22:50](#msg5a6bb0be40259f1a33b0c744)@pekr ah, so it's the other way around, thanks!

[22:51](#msg5a6bb0f04a6b0dd32b5101b1)would JIT compilation allow to bypass this limitation?

iceflow19

[22:52](#msg5a6bb1116117191e61b97b21)I would think potentially.

[22:53](#msg5a6bb15a4a6b0dd32b5103bb)But it all depends on how things are implemented in the Runtime I think. @dockimbel would be able to answer that kind of question.

9214

[22:54](#msg5a6bb1b80ad3e04b1b72e098)let them drink some SassenWine in SF first ;)

gltewalt

[23:06](#msg5a6bb48740259f1a33b0dab9)I see now that context doesn’t use INHERIT\_ACTION for append or insert, but null

9214

[23:08](#msg5a6bb4dc494bd0f5302d0d45)context or object?

[23:09](#msg5a6bb514494bd0f5302d0e1f)

```
text
>> append copy body-of object [] 'boom
== [boom]
```

[23:09](#msg5a6bb53898927d57453f31c0)it's not about object itself, it's a block that is referenced by an object as its body

[23:12](#msg5a6bb5ccae53c159033d338c)`INHERIT_ACTION` is null because you can't apply `append` or `insert` `action!`s to an `object!`

gltewalt

[23:13](#msg5a6bb60940259f1a33b0e1ec)Yeah. And object and context aren’t the same if you diff the two files. I always thought that they were the same thing

9214

[23:14](#msg5a6bb638ae53c159033d3598)@gltewalt `object!` is a context, but context is not an `object!`

[23:14](#msg5a6bb66198927d57453f3740)`function!` with local words provides context too

gltewalt

[23:14](#msg5a6bb66fce68c3bc740b6651)Aha!

9214

[23:15](#msg5a6bb67bce68c3bc740b6676)perhaps not `function!` but `any-function!`

[23:15](#msg5a6bb68ec95f22546ded91fb)and not `object!` but `any-object!`

gltewalt

[23:19](#msg5a6bb78398927d57453f3ca8)What happens if you append paren?

9214

[23:19](#msg5a6bb79f494bd0f5302d1a94)@gltewalt quoted one?

gltewalt

[23:20](#msg5a6bb7b3ce68c3bc740b6c37)Either

[23:20](#msg5a6bb7b74a6b0dd32b512738)Or both

9214

[23:20](#msg5a6bb7c140259f1a33b0e969)with empty one it's okay

```
>> append body-of object [] quote ()
== []
```

[23:21](#msg5a6bb815c95f22546ded979c)

```
text
append body-of object []()             ; crash
append body-of object [](1 2 3)        ; crash
append body-of object [] quote (1 2 3) ; crash
```

gltewalt

[23:25](#msg5a6bb9040ad3e04b1b730273)I see that paren datatype inherits append but not insert. That’s weird.

[23:26](#msg5a6bb92d5a9ebe4f75dd052a)Errr that’s backward

9214

[23:26](#msg5a6bb9400ad3e04b1b730330)

```
text
>> x: quote (1 2 3)
== (1 2 3)
>> insert x 4
== (1 2 3)
>> x
== (4 1 2 3)
>> append x 0
== (4 1 2 3 0)
```

gltewalt

[23:26](#msg5a6bb9415a9ebe4f75dd0651)Inherits insert, but no append

[23:28](#msg5a6bb99d5a9ebe4f75dd0905)https://github.com/red/red/blob/master/runtime/datatypes/paren.reds

9214

[23:29](#msg5a6bb9de4a6b0dd32b513115)uhm

[23:29](#msg5a6bb9ec494bd0f5302d2531)https://github.com/red/red/blob/master/runtime/datatypes/paren.reds#L96  
https://github.com/red/red/blob/master/runtime/datatypes/paren.reds#L106

[23:30](#msg5a6bba064a6b0dd32b5131c6)ah, I see

gltewalt

[23:43](#msg5a6bbd160ad3e04b1b731653)Gah... I have a long way to go with understanding Red/System

9214

[23:43](#msg5a6bbd375a9ebe4f75dd19f3)well, it's more about Red's internals than R/S I'd say

## Saturday 27th January, 2018

9214

[00:18](#msg5a6bc55bc95f22546dedcdc8)@gltewalt https://github.com/red/red/blob/master/runtime/datatypes/object.reds#L1008

[00:23](#msg5a6bc69fae53c159033d78e6)probably `blk: block/clone blk no no` is missing somewhere

[00:26](#msg5a6bc71e6117191e61b9de0c)maybe after https://github.com/red/red/blob/master/runtime/datatypes/object.reds#L1010 ?

[00:35](#msg5a6bc93a494bd0f5302d6474):tada:

gltewalt

[02:14](#msg5a6be07c0ad3e04b1b73ac6d)Or alloc-cells is the culprit.  
Adding `blk: block/clone bkk no no` is an easy a/b test

## Monday 29th January, 2018

mydoghasworms

[06:22](#msg5a6ebdb86117191e61c62487)@iceflow19 Thanks for the feedback. It seems like a very daunting task and, while there are other approaches to generate bindings, like SWIG, ideally you want something written in Red.

## Saturday 10th February, 2018

ldci

[20:25](#msg5a7f5533e217167e2c6a3bbe)redCV can red tiff files now. See https://github.com/ldci/redCV

## Sunday 11st February, 2018

meijeru

[15:17](#msg5a805e9e18f388e6268cd9f6)On `append`: this action is handled \*outside* the normal inheritance system. See \[here](https://github.com/red/red/blob/master/runtime/actions.reds#L785)

gltewalt

[21:45](#msg5a80b9977084124a3464ec55)I thought it was weird and maybe needed to be redone, but I couldn’t articulate it.  
And I don’t know - maybe they have a good reason for it

## Monday 19th February, 2018

loziniak

[22:52](#msg5a8b5518a2194eb80d87c0c8)hello. is there a n unsigned int in red/system?

greggirwin

[23:24](#msg5a8b5caf888332ee3aa6ad06)Not at this time.

## Tuesday 20th February, 2018

PeterWAWood

[01:16](#msg5a8b76ff8f1c77ef3a2c955c)@loziniak You can use a pointer! \[integer!] as a pseudo unsigned integer.

[01:22](#msg5a8b783b6f8b4b9946975763)The following code:

```
Red/System []
u: as int-ptr! FFFFFFFFh
if u > as int-ptr! 0 [ print ["u is greater than zero" lf] ]
```

outputs

```
u is greater than zero
```

loziniak

[10:08](#msg5a8bf3ab888332ee3aa96640)Thanks, my idea was `uint!: alias struct! [ b1: [byte!] b2: [byte!]]`

[10:11](#msg5a8bf43c8f1c77ef3a2ed434)And is there mayba a documentation of how argument types are converted between Red and Red/System?

[10:11](#msg5a8bf4460202dc012e5ce57a)maybe*

[10:12](#msg5a8bf4736f8b4b9946999a8f)fix: `uint!: alias struct! [b1: [byte!] b2: [byte!] b3: [byte!] b4: [byte!]]` :-)

[10:14](#msg5a8bf516888332ee3aa96f0a)And is something like `uint!: alias int-ptr!` available? According to documentation \*alias* is reserved to \*struct!\*.

PeterWAWood

[10:46](#msg5a8bfc8ec3c5f8b90dde6540)@loziniak There isn't any documentation of how values can be converted between Red and Red/System yet. If I remember correctly integer! and logic! are automatically converted between the two.

The others have to be looked up in red/runtime/datatypes and converted with a function call. @Oldes and @rebolek are probably familiar with most usual datatype conversions.

[10:48](#msg5a8bfd03a2194eb80d8adfaa)You could try `#define uint! int-ptr!`

[10:53](#msg5a8bfe126f8b4b994699cad2)An example of using a runtime function would be the to-utf8 function in unicode.reds:

```
to-utf8: func [
		str		 [red-string!]
		len		 [int-ptr!]			;-- len/value = -1 convert all chars
		return:  [c-string!]
	][
		io-to-utf8 str len no
	]
```

[10:54](#msg5a8bfe58e4ff28713aa0af8e)this is how I call that function:

```
rs-phrase: unicode/to-utf8 phrase pointer-to-minus-one
```

phrase being a Red string! and rs-phrase a Red/System c-string!

[10:56](#msg5a8bfec853c1dbb743518993)If a program calls functions in the Red runtime, you will need to compile it with the `-r` option.

## Wednesday 21st February, 2018

loziniak

[11:50](#msg5a8d5cfec3c5f8b90de6757e)Thanks, it was very helpful! I've got another question: is it possible to call red functions from red/system code?

rebolek

[11:54](#msg5a8d5df5e4ff28713aa8951d)yes

loziniak

[11:54](#msg5a8d5e12a2194eb80d92f520)can you point me to any code example?

rebolek

[11:56](#msg5a8d5e578f1c77ef3a36dac4)I was looking for the example...see here http://static.red-lang.org/red-system-specs.html#section-16.8

9214

[11:56](#msg5a8d5e5d0202dc012e65263d)@loziniak https://github.com/red/red/wiki/Guru-Meditations#calling-red-from-redsystem

loziniak

[11:59](#msg5a8d5f240202dc012e652aef)fantastic. thanks for patiently telling me stuff that is already in documentation :-)

rebolek

[12:00](#msg5a8d5f4f0202dc012e652b90)no problem :)

greggirwin

[18:01](#msg5a8db40b8f1c77ef3a39335e)@loziniak we plan to organize docs more, so right now we get things written down \*somewhere* and then it becomes a cultural tradition to pass their hidden locations on to the next generation.

## Wednesday 28th February, 2018

hyzwhu

[09:16](#msg5a96736a6f8b4b9946d0827d)hello, if i want to achieve a type like the C's handle with R/S , what should i do?

Oldes

[09:54](#msg5a967c606fba1a703aaef9f7)@k50661184 it depends what exactly you want to do... \[this code](https://github.com/red/code/blob/master/Library/SQLite/SQLite3.red#L170-L175) for example sets value into handle! type with some additional info stored in \[yet not used red-handle! fields](https://github.com/red/red/blob/master/runtime/datatypes/structures.reds#L327-L332) - which is unsafe as these fields will be (probably) needed for 64bit `red-handle!` version one day.

[09:56](#msg5a967cc835dd17022e03b1f1)Just to clarify... it sets the value like in this code:

```
SQLite/do [db1: open %test.db]
```

where the `db1` will hold the handle to the opened db.

hyzwhu

[11:35](#msg5a9693f80202dc012e95b7a9)@Oldes thanks

## Sunday 11st March, 2018

lepinekong\_twitter

[14:40](#msg5aa53ff98f1c77ef3aaa4f35)I want to use curl in Red according to https://github.com/kealist/RS-fossil-mirror/blob/master/cURL/cURL.reds I must #include %../C-library/ANSI.reds but I can't find it.

9214

[14:47](#msg5aa54169f3f6d24c68611907)@lepinekong\_twitter  
https://www.youtube.com/watch?v=231ZkIe6PjI

[14:47](#msg5aa5416d6f8b4b9946144338)https://github.com/kealist/RS-fossil-mirror/tree/master/C-library

lepinekong\_twitter

[14:58](#msg5aa5440b8f1c77ef3aaa6145)@9214 I searched on google instead :smile:

## Tuesday 13th March, 2018

Zamlox

[20:28](#msg5aa83463e4ff28713a2b4346)@dockimbel Is

```
rect
```

local variable initialized correctly at this location https://github.com/red/red/blob/master/modules/view/backends/windows/draw.reds#LC1591 ? It is initialized with the address of local variable

```
x
```

which is of type

```
integer!
```

but the struct type is 4 times bigger. When fields of

```
rect
```

are set it should overwrite the memory starting with address of

```
x
```

but the declaration of

```
rect
```

should not allocate memory because the type is an

```
alias
```

, according to documentation. What memory area is reserved for fields of

```
rect
```

?

## Thursday 15th March, 2018

Zamlox

[15:20](#msg5aaa8f568f1c77ef3ac4256a)@dockimbel some unexpected results when using casting in math expressions:

```
a: as float32! 2
a: a - as float32! 1
print ["a: " a lf]
```

gives result

```
a: 2.0
```

```
a: a - as float32! 1 - as float32! 1
print ["a: " a lf]
```

gives result

```
a: -2.0
```

Same for

```
float!
```

type

## Saturday 17th March, 2018

9214

[13:25](#msg5aad174a27c509a7747289bd)In my attempts to learn Red/System I've stuck with double-linked list implementation.  
https://gist.github.com/9214/51a3232dff187b29b23c07408f60f74a  
The problems are:  
\* I'm not sure if `declare node!` is the right way to create new nodes.  
\* Creating `16 - 23 - 42` list results in `42 - 23 - 42`

Can anyone tell me what am I doing wrong? Little to no C experience :(

[14:15](#msg5aad231ec3c5f8b90d81ca83)Okay, by looking at @Oldes examples I figured out that line 21 should be

```
new: as node! allocate size? node!
```

[14:19](#msg5aad23d9458cbde55745d9d1)Still, in R/S specification there no information about memory management primitives (`allocate` and `free` I assume?).

dockimbel

[14:38](#msg5aad287e5f188ccc15c78616)@Zamlox Indeed, that looks like a nasty bug, please open a ticket for it, so we don't miss it. @qtxie will fix it asap.

[14:39](#msg5aad28b435dd17022e6d986a)@Zamlox Please open a ticket for those float expression issues too.

[14:42](#msg5aad2940bb1018b37af54921)@9214 The R/S spec is only for the language. Those functions are part of the R/S runtime library, which was planned to have its own doc, probably produced by a tool scanning the source code, and extracting the docstrings + incorporating some extra info. IIRC, a long time ago, someone worked on such tool, but we never completed the work, as we were drawn to other higher priority tasks. I think it might have been @PeterWAWood, but I'm unsure.

9214

[14:46](#msg5aad2a42e4d1c636040e4ca6)@dockimbel I see, thanks Doc!

dockimbel

[14:48](#msg5aad2ad8e4ff28713a429615)@gltewalt  
&gt; I see that paren datatype inherits append but not insert. That’s weird.  
&gt; Errr that’s backward

Internally, `append` action is planned to be removed (on next big codebase cleanup), because `insert` action handles appending already. That's why there's no datatype currently implementing `append` action.

`set-path` action is also planned for removal, as `eval-path` handles setting in addition to getting.

## Sunday 18th March, 2018

qtxie

[00:50](#msg5aadb7da27c509a77474fa84)&gt; Is

```
rect
```

local variable initialized correctly at this location https://github.com/red/red/blob/master/modules/view/backends/windows/draw.reds#LC1591 ?

@Zamlox Yes. It's a trick to declare a `rect value` on stack, as we don't have struct value support at that time. So `x`, `y`, `sz` and `w` is the memory area used for `rect`.

dockimbel

[03:58](#msg5aade3fce4d1c6360410e5f8)@qtxie Right, missed it. Could we use a struct `value` here rather?

Zamlox

[06:43](#msg5aae0aa6fa066c5325419723)@qtxie that makes sense, thanks.

[06:44](#msg5aae0abb27c509a77475ec31)@dockimbel I will file an issue related to casting values

[07:01](#msg5aae0ed1f3f6d24c68893cd8)@dockimbel issue filed: #3265

## Wednesday 18th April, 2018

JacobGood1

[16:56](#msg5ad778ae5d7286b43a418407)@JacobGood1  
Is there some example code where I want to pass a red system string to a red function, have it processed by red, then have it converted back to a red system string, here is some code that gives me a massive error message, I left out the code above it:

```
#system-global [
    extract-asm: func [asm [c-string!] return: [c-string!]] [
        #call [extract-assembly as red-string! asm]
        ret: as c-string! stack/arguements
        ret
    ]

    #export cdecl [extract-asm]
]
```

I don't think as red-string exists, it is just an example of what I am trying to accomplish

dockimbel

[17:54](#msg5ad786735f188ccc157b8637)@JacobGood1 A `c-string` and `red-string!` are very different data structures (unboxed vs boxed), so you need to convert from one to the other explicitly. There might be some examples for such conversions in the wiki, in routines examples. I'm writing from my phone, so can't give you a code example.

9214

[17:57](#msg5ad787251130fe3d36ef63f3)@JacobGood1 \[here](https://github.com/red/red/wiki/Red-System-tutorial-for-newcomers-English-version), specifically

[17:58](#msg5ad787406d7e07082b0ad661)

```
text
; note the conversion from string to c-string : 
; as c-string! string/rs-head txt

alert: routine [
			txt [string!] 
			return: [integer!]][
		MessageBox 0 as c-string! string/rs-head txt "alert" 48 
]
```

JacobGood1

[18:01](#msg5ad788135d7286b43a41d962)thanks, I just need to find an example that shows how to convert from a c-string! to a red-string now

## Thursday 19th April, 2018

greggirwin

[17:03](#msg5ad8cbcf5d7286b43a478b94)@JacobGood1, once you have it working, could you please add a quick note to the wiki, to help others? Thanks!

JacobGood1

[17:12](#msg5ad8cdea270d7d3708e4a6e6)I am trying to compile a simple test file for a dll, however I am getting this error:

```
Compilation Error: undefined context red
```

9214

[17:12](#msg5ad8ce0a15c9b03114142ac6)@JacobGood1 perhaps you should use `#system` instead of `#system-global`?

JacobGood1

[17:13](#msg5ad8ce335d7286b43a479786)

```
Red [
    Author: "Joshua Shireman"
    Title: "Simple Red flavored DLL"
    File: "dll.red"
]

hello: does [print "hello"]
#system-global [
    hello-system: does [
        #call [hello]
    ]
    #export cdecl [hello-system]
]
```

[17:15](#msg5ad8ceb727c509a7742c9583)@9214 taking global out had no effect

[17:15](#msg5ad8cec6270d7d3708e4abee)in other words, same error

[17:16](#msg5ad8cedb109bb04332dce955)@greggirwin sure

9214

[17:25](#msg5ad8d11f6bbe1d273903d33d)@JacobGood1 I don't think you can use `#call` like that, it's a compiler directive, not something you can call at run-time.

[17:26](#msg5ad8d14c5d7286b43a47a5fd)Is there specific reason why you need Red function here?

JacobGood1

[17:27](#msg5ad8d19e270d7d3708e4b877)I was simply following this: http://learningred.com/news/2014/02/making-a-dll-with-red-functions

9214

[17:28](#msg5ad8d1ca15c9b03114143fdb)First time I ever see this blog btw.

JacobGood1

[17:29](#msg5ad8d1ef6bbe1d273903d750)@9214 my reasons are a little complicated, I do not have enough time to lay them out for now

9214

[17:31](#msg5ad8d25c15c9b03114144250)Trying to build this example as dynamic library I get a wall of compiler errors.

JacobGood1

[17:31](#msg5ad8d26615c9b03114144292)so do I

greggirwin

[23:00](#msg5ad91f892b9dfdbc3aab73b1)The error is just one error (missing context for red, yes?), with lots of output. You need to compile DLLs in release mode (`-r`) now AFAIK. If I do that, @JacobGood1 's last example compiles fine for me, as a DLL.

## Sunday 22nd April, 2018

JacobGood1

[16:03](#msg5adcb26415c9b0311422d228)@greggirwin thanks, that works with the example. I have not given up on this I am simply unable to mess around with it again until Monday. I am still planning on adding the solution if I am successful.

## Monday 23th April, 2018

JacobGood1

[18:24](#msg5ade24c062316e0505efd3c8)ok I had some time to fiddle with this, I have not really gotten anywhere:

```
extract-asm: func [asm [c-string!] return: [c-string!] /local temp] [
        ;convert asm to red-string! I do not know what the heck i am doing here!!!
        temp: declare struct! [
            header  [integer!]              ;-- cell header
            head    [integer!]              ;-- string's head index (zero-based)
            node    [pointer! [integer!]]   ;-- series node pointer
            cache   [c-string!]             ;-- (experimental)
        ]
        temp/head: 0
        temp/cache: asm

        #call [extract-assembly temp]
        
        ret: as c-string! string/rs-head stack/arguments
        ret
    ]
```

## Tuesday 24th April, 2018

tmpbci

[21:05](#msg5adf9c285d7286b43a63d07a)say I want to code some OSC server in red/system.buffer-bytes: 512  
buffer: allocate buffer-bytes

[21:05](#msg5adf9c2e5d7286b43a63d081)grr

[21:06](#msg5adf9c3b109bb04332f91709)if I use buffer-bytes: 512

[21:06](#msg5adf9c43270d7d370800d69f)buffer: allocate buffer-bytes

[21:06](#msg5adf9c652b9dfdbc3ac5ebf4)then I want to print buffer/xxx in hexadecimal

[21:07](#msg5adf9c7a2b9dfdbc3ac5ec88)I tried print as integer! buffer/zz

[21:07](#msg5adf9c86109bb04332f9187c)but obviously it's decimal

[21:07](#msg5adf9ca95f188ccc159d78ac)what's the to-hex in red/system

PeterWAWood

[21:49](#msg5adfa67f27c509a774491206)There is a `prin-hex-chars`function in `red/system/runtime/debug.reds`

tmpbci

[21:53](#msg5adfa7431130fe3d3611dac2)thx

## Sunday 29th April, 2018

meijeru

[11:51](#msg5ae5b1c95d7286b43a7d23c6)Probably not the best place for this, but here is a suggestion to update the Guru Meditations:  
since rev. 50 of the Red/System docs it is possible to do what this Guru Meditation says you can't do:

```
How do I get the address of a struct! member as a pointer! type?
Red/System doesn't have that feature yet. Currently, you need to do manual pointer arithmetic to get the address.
```

greggirwin

[20:05](#msg5ae6258d1130fe3d362d938a)Are you willing to make that change @meijeru, since you can state it correctly?

meijeru

[20:24](#msg5ae62a197c3a01610d33aae8)I would propose to leave it out altogether, because the naive user would just try `:struct/field` and since that compiles, he would not have the question anymore. BTW, this particular meditation does not have its own entry in the table of contents -- it is sandwiched between the 23rd and 24th item. Also, while we are on the subject of the Wiki, your latest changes to the Home page have led to a proliferation of the Quick Navigation blocks -- something went awry there.

greggirwin

[20:56](#msg5ae631995d7286b43a7ef730)Fine to remove it @meijeru.

[20:57](#msg5ae631a47c3a01610d33c57a)Yes, we're tinkering with the wiki right now.

[20:57](#msg5ae631c81388b2df211023fc)Comparing alternatives directly. @gltewalt should push an update shortly to clean it all up.

## Sunday 8th July, 2018

raton3062015

[10:09](#msg5b41e2e53c5abf52b64552b9)

```
str: "abdef" 
str2: str
print [str tab str2 ]
>> abdef    abdef
str2/1: #"A"
print [str tab str2]
>> Abdef    Abdef
```

how can i copy string (by value not by reference)

PeterWAWood

[10:19](#msg5b41e52733b0282df4099abb)Are you asking about how to copy strings by value in Red/System or in Red?

raton3062015

[10:19](#msg5b41e53163042f2df35fc282)Red/System

PeterWAWood

[10:33](#msg5b41e86189db5e701cab3a89)Here is a very basic way of copying a string by value in Red/System:

```
Red/System []

s1: "abcdef"
s2: as c-string! allocate size? s1
si: 0
until [
	s2/si: s1/si
	si: si + 1
	si > length? s1
]

s1/1: #"z"
print [s1 "   " s2 lf]
```

raton3062015

[10:46](#msg5b41eb9863042f2df35fcc46)allocate? how many built in functions Red/system have

PeterWAWood

[11:26](#msg5b41f4d83c5abf52b64572cf)There are a handful of functions defined in the runtime. There isn't any documentation yet so it is a case of looking in the source.

[11:27](#msg5b41f52e63042f2df35fdc7e)Most of the useful imported functions are in red/system/runtime/libc.reds

[11:29](#msg5b41f5ae7b811a6d63d95b07)There are a lot of useful #defs in red/system/runtime/common.reds

[11:31](#msg5b41f5f9e534eb69a5d1c858)red/system/runtime/util.reds also has a few useful functions.

## Wednesday 8th August, 2018

endo64

[23:45](#msg5b6b80afa6af14730b0c8d87)I have added a `test` native to Red, which accepts a block! and returns a float!,  
I tried many variations but whatever I try it returns the passed block as return value:

```
test: func [return: [red-value!]] [as red-value! as red-float! 1.1]
	test: func [return: [float!]] [1.1]
	test: func [return: [red-float!]] [as red-float! 1.1]
	test: func [] [1.1]
	...
```

Any idea what am I missing?

## Thursday 9th August, 2018

meijeru

[17:40](#msg5b6c7cab5ec2bc174fd74840)First, are these Red/System functions or Red functions? And you say "passed block" but I see no input argument.

[17:43](#msg5b6c7d292a8e6c60839f40f0)Also, you call `test` a native, but it is defined as a simple Red or Red/System function, so it is not of `native!` type.

endo64

[19:03](#msg5b6c901c2a8e6c60839fb579)@meijeru I skip some parts I've done so far to keep the message short.  
Here is the full story;  
I've added `environment/runtime/natives.red`

```
test: make native! [[
		"Test native"
		body  [block!]
		return: [float!]   ;tested with red-float! as well
	]
	#get-definition NAT_TEST
]
```

added `runtime/macros.reds:`

```
#enum natives! [
	...
	NAT_TEST
]
```

and last added `runtime/natives.reds` file above test function.

[19:06](#msg5b6c90cb5ec2bc174fd7cc1e)Then I encapped Red binary and compiled REPL. My `test` native works, if I put `print-line` somewhere inside the function it prints (like length of the given block, local float values etc.) but can't return a float value:

```
>> test [1 2 3]
== [1 2 3]
```

gltewalt

[23:03](#msg5b6cc835a6af14730b13e7eb)Did you try `as red-float! stack/arguments`

[23:07](#msg5b6cc93b637ee66082cbeb77)It has been a long time since I played with R/S

## Wednesday 12nd September, 2018

NjinN

[02:30](#msg5b987a507189ae6fddb03f5c)I try to turn a string!(in Chinese) to c-stirng!, but just get a unintelligible text. How should i deal with it?

PeterWAWood

[05:55](#msg5b98aa497ce5f5314f9c3057)c-strings are utf-8 encoded. Can the console you are running the program display utf-8 text?

NjinN

[12:00](#msg5b98ffc9e481f854a6a8f80d)@PeterWAWood Which console you mean, cmd.exe or the red-console. I have turned my cmd.exe to utf8 encoding, but nothing changed.

PeterWAWood

[12:58](#msg5b990d69e481f854a6a9555d)I didn’t know Windows cmd.exe supported utf-8, I thought it only supported Windows 8-bit codepages or utf-16. Which version of Windows are you using?

NjinN

[13:18](#msg5b99120a51a02e2a261c806c)@PeterWAWood Win10

PeterWAWood

[14:07](#msg5b991da8a04db554a7157d4b)I will try and find some time to test tomorrow.

endo64

[20:19](#msg5b9974e17dca306503f055b2)cmd supports UTF-8 (codepage 65001), see this https://stackoverflow.com/questions/388490/how-to-use-unicode-characters-in-windows-command-line#

PeterWAWood

[23:09](#msg5b999ca8d655361f76ef0c63)Thanks Endo

## Thursday 13th September, 2018

PeterWAWood

[04:38](#msg5b99e9d9b9531f2dfa5c2de1)@NjinN I think the problem is most likely the font your are using in Windows cmd.exe.

I compiled this simple program:

```
Red/System []

print [ "Hello, world!" lf ]
print [ "Χαῖρε, κόσμε!" lf ]
print [ "你好, 世界" lf ]
print [ "Dobrý den světe" lf ]
```

Here are the results using the NSimSum font:

[04:40](#msg5b99ea4cb9531f2dfa5c303c)\[!\[Windows Console Session.png](https://files.gitter.im/red/red/system/Q5js/thumb/Windows-Console-Session.png)](https://files.gitter.im/red/red/system/Q5js/Windows-Console-Session.png)

NjinN

[04:53](#msg5b99ed4ee5c2cc56ad80b5e1)\[!\[C(\_HXE{MZZ{40~0S(E$2\[K3.png](https://files.gitter.im/red/red/system/hNMn/thumb/C\_\_HXE\_MZZ\_40\_0S\_E\_2\_K3.png)](https://files.gitter.im/red/red/system/hNMn/C\_\_HXE\_MZZ\_40\_0S\_E\_2\_K3.png)

PeterWAWood

[04:56](#msg5b99edf4f08bc22dfb4c9671)@NjinN Which font is the Windows CLI using?

NjinN

[04:56](#msg5b99ee01be4f3006268796f9)I have tried some fonts

PeterWAWood

[04:57](#msg5b99ee356feaa65c9678779f)Have you checked that the fonts that you are using can display Chinese characters?

[04:57](#msg5b99ee4abe4f3006268797d5)Specifically, did you use the NSimSum font?

NjinN

[04:59](#msg5b99eea9f4bd1056ac560d91)Is the NSimSum means New-Simsum?

[05:00](#msg5b99eeeaa56b215c972e0a8f)\[!\[2~X@G@89PMJ2\[N\`]7H)ER02.png](https://files.gitter.im/red/red/system/2IV2/thumb/2\_X\_G\_89PMJ2\_N\_\_7H\_ER02.png)](https://files.gitter.im/red/red/system/2IV2/2\_X\_G\_89PMJ2\_N\_\_7H\_ER02.png)

PeterWAWood

[05:02](#msg5b99ef76e5c2cc56ad80c07e)This one:

[05:03](#msg5b99ef8a7dca306503f2f28b)\[!\[Font Picker.png](https://files.gitter.im/red/red/system/y7iH/thumb/Font-Picker.png)](https://files.gitter.im/red/red/system/y7iH/Font-Picker.png)

NjinN

[05:09](#msg5b99f11b0cfe7f30f18844b1)As you see, my cmd display Chinese characters well. So, maybe the font isn't the reason for unintelligible text on my computer.

PeterWAWood

[05:16](#msg5b99f2b2b9531f2dfa5c5bcb)I am clear that there is no problem with the Red/System compiler or runtime. A compiled program can clearly display Chinese characters in a Windows CLI.

I sorry I don't have time to help you debug the problem with your program. Perhaps somebody else can help you?

Oldes

[06:07](#msg5b99fea9e5c2cc56ad811030)@NjinN maybe you could ask in this room: https://gitter.im/red/red/Chinese

NjinN

[07:53](#msg5b9a1761f08bc22dfb4d8d1e)@PeterWAWood Thanks a lot.

## Saturday 15th September, 2018

NjinN

[07:09](#msg5b9cb03e7dca306503037650)@PeterWAWood I try it aging on another computer, and get a correct result. So, it just the problem of my computer.

## Wednesday 19th September, 2018

haolloyin

[09:55](#msg5ba21d13b9531f2dfa8bdc98)Hello, I've confused by this `Red/System` code:

```
Red/System []

#import [
	LIBC-file cdecl [
        log10: "log10" [
            x   [float!]
            return: [float!]
        ]
    ]
]

log2: func [
    x [integer!]
    /local
        i [integer!]
        f [float!]
][
    i: as-integer ( (log10 as-float x) / (log10 as-float 2) )
    f: (log10 as-float x) / (log10 as-float 2)

    printf ["log2/%d^/  -> %d^/  -> %f (%d)^/^/" x i f (as-integer f)]
]

probe log10 as-float 2      ;--> 0.3010299956639812
probe log10 as-float 4      ;--> 0.6020599913279624     twice of above
probe log10 as-float 8      ;--> 0.9030899869919435

log2 2      ;--> 1
log2 4      ;--> 2
log2 8      ;--> 2 or 3
log2 16     ;--> 4
log2 32     ;--> 5
```

Outputs:

```
0.3010299956639812
0.6020599913279624    ;-- twice of above
0.9030899869919435

log2/2            
  -> 1            
  -> 1.000000 (1) 
                  
log2/4            
  -> 2            
  -> 2.000000 (2) 
                  
log2/8            
  -> 2            ;-- Should be 3 !!!
  -> 3.000000 (3) 
                  
log2/16           
  -> 4            
  -> 4.000000 (4) 
                  
log2/32           
  -> 5            
  -> 5.000000 (5)
```

[11:15](#msg5ba22fe7d655361f7620e0ca)I don't know why these two lines produce different result:

```
i: as-integer ( (log10 as-float 8) / (log10 as-float 2) )    --> `i` is 2
    f: (log10 as-float 8) / (log10 as-float 2)    --> `f` is 3.00000
```

9214

[11:16](#msg5ba2300dfcba1254fadb0ae3)@haolloyin and `as integer! f` correctly produces `3`?

haolloyin

[11:16](#msg5ba2302bf7e1580625f32dcb)Yeah, you are right.

9214

[11:17](#msg5ba2304cbe4f300626b7d6e5)If so, it could be that R/S cannot handle nested expressions. I recall there was some limitation being mentioned not so recently, :point\_up: @BeardPower?

[11:18](#msg5ba230a1e6046343f384e40d)Ah, here it is, though, it's concerned with `either` construct.  
&gt; `either` is limited for now, better avoid using it nested (assigning its return value to a variable is safe). The limitation comes from an early version of R/S where `either` could not be nested at all, so the code emitter is not capable to handle that properly across the various target architectures.

[11:19](#msg5ba230d0d655361f7620e7ad)@haolloyin if you can file an issue with a minimal reproducible example for the core team to investigate later, that would be great.

haolloyin

[11:22](#msg5ba23177f4bd1056ac8632f4)@9214 Got it. Thank you very much!  
Finally I did this trick `as-float f` to make it correct.  
OK, tonight I will write an issue. :)

BeardPower

[11:33](#msg5ba234278909f71f75f8128b)@9214 Yes. This issue can give you real headaches. Its better to cache an intermediary value and use that for the expression instead of nesting.

[11:36](#msg5ba234d3a56b215c975ea746)as-&lt;data-type&gt; is just an alias for as &lt;data-type&gt;!, which is the new syntax, which should be preferred, as its reflecting the type.

haolloyin

[18:04](#msg5ba28fc21ee2ca65023e05d8)@9214 @BeardPower  
I created an new issue here: https://github.com/red/red/issues/3537

9214

[18:05](#msg5ba28fd2b4990c30eedc3038)Thanks @haolloyin !

BeardPower

[18:26](#msg5ba294bd8909f71f75fa9bd6)@haolloyin :thumbsup:

## Friday 21st September, 2018

loziniak

[19:24](#msg5ba545577dca30650335e4a5)Hi guys. Still working on Red/System &lt;-&gt; Red callbacks. I have a code like this (details in comments):

```
Red []

a: function [
	num [integer!]
] [
	print ["num:" num]
]

b: function [
	cb [function!]
] [
	cb_aux: function [ ;-- we have to provide a name for #call directive. argument's name won't do.
		arg [integer!]
	] [
		cb arg ;-- this callback requires -e compiler flag
	]
	#system [
		#call [cb_aux 12] ;-- but we have error here (invalid #call function name: cb_aux) with -e flag
	]
]

b :a
```

Does anybody have an idea how to make it work?

9214

[19:41](#msg5ba5496d1043315947c6e382)I don't recall (pun intended) anything on `#call` support in encapping mode.

[19:43](#msg5ba549f61ee2ca65024e819e)

```
text
inc: routine [n [integer!] return: [integer!]][n + 1]

apply: func [
    r [routine!]
][
    r 41
]

print apply :inc
```

loziniak

[19:43](#msg5ba549fb1043315947c6e5d4)Apparently. It seems like the `#system` call is pulled out of a function:

```
Compiling /mnt/share/prj/red/github/f.red ...
...using libRedRT built on 20-Sep-2018/12:15:09
*** Compilation Error: invalid #call function name: cb_aux 
*** in file: /mnt/share/prj/red/github/f.red
*** near: [
    #system [
        #call [cb_aux 12]
    ] 
    do [
        a: function [
            num [integer!]
        ] [
            print ["num:" num]
        ] 
        b: function [
            cb [function!]
        ] [
            cb_aux: function [arg [integer!]] [cb arg]
        ] 
        b :a
    ]
]
```

9214

[19:44](#msg5ba54a3bd655361f7633fb81)https://github.com/red/red/commit/3ccd217b7ca62ec38619db8a0a2cb6743ee3e794

[19:45](#msg5ba54a61b9531f2dfa9f9c52)Well, description I gave you was pretty clear: `#system` is supported as long as it has no local effect.

[19:46](#msg5ba54a825df5194734f3a04e)All `#system` and `#system-global` directives are collected into prolog and are inserted at the head of the script, which itself is wrapped in `do [...]`, to force interpretation.

loziniak

[19:47](#msg5ba54ab57dca3065033604d9)I was hoping I understood it wrong :-)

[19:54](#msg5ba54c8a7dca3065033612c8)Another solution I see is explicitly creating a `cb_aux` word inside `#system` block instead of creating a function outside of it. Then there would be no need for `-e` flag. Does this seem possible to you?

9214

[19:56](#msg5ba54ce81ee2ca65024e94e5)@loziniak I don't quite get why you need this callback mumbo-jumbo at all. Why not to use routines, as in my example above? \[What problem are you trying to solve](http://xyproblem.info/), specifically?

loziniak

[19:57](#msg5ba54d2e7dca3065033615c8)I want to use external library with callbacks

[19:58](#msg5ba54d4e33da0f649e33e415)https://github.com/loziniak/safenet.red/blob/master/safe.red

9214

[20:01](#msg5ba54e025df5194734f3b56f)And you would like to pass Red functions to this library?

loziniak

[20:02](#msg5ba54e5c5df5194734f3b6ae)Yes, the library is asynchronous and uses callbacks (the one function I have now is the only one without callback) to return values.

[20:04](#msg5ba54ecd913ba7799b24e255)Now a fundamental question came to my mind - is async possible in Red at all?

9214

[20:04](#msg5ba54ee6913ba7799b24e338)I'd suggest to work on R/S level and pass either routines or Red/System function themselves (not sure if there's any difference between them though). Otherwise you'll mostly go against the grain of the current compiler.

[20:05](#msg5ba54f18b9531f2dfa9fb4d8)&gt; Now a fundamental question came to my mind - is async possible in Red at all?

Only after 0.7.0 I believe.

loziniak

[20:29](#msg5ba554adb4990c30eeecf701)I could consider making it synchronous, something like:

```
external-lib-call: function [
	arg
] [
	ret: 0
	#system [
		cb: function [
			ret-arg
		] [
			ret: ret-arg ;-- I know it's not possible but I wanted to stay short and it's more a pseudocode here
		]
		external_lib_call arg cb
	]
	return ret
]
```

greggirwin

[21:04](#msg5ba55cc7f4bd1056ac99a33c)There is no async support in Red yet.

## Monday 24th September, 2018

loziniak

[12:22](#msg5ba8d71af7e1580625196136)Hi, how do I return a block from routine? By returning struct pointer?

BeardPower

[12:31](#msg5ba8d90bb4990c30eeffef0a)You can return structs by value or reference.

loziniak

[12:33](#msg5ba8d9b30cfe7f30f1def247)Isn't it that in R/S I only work on pointers / references?

BeardPower

[12:34](#msg5ba8d9e9be4f300626de74de)No, parameters are passed by value.

[12:34](#msg5ba8d9eb1ee2ca65026225a3)In the current implementation, pointer!, integer!, byte!, float!, float32! and logic! arguments are passed by value, while c-string! and struct! arguments are passed by reference. Adding the `value` keyword after a struct! type specification, allows it to be passed by value (works also for returned value).

loziniak

[12:51](#msg5ba8ddd1f4bd1056acacb7c8)Ok, I've tested it by myself, turns out that I just return a pointer, as suspected:

```
Red []

next-char: routine [
	c [char!]
	return: [char!]
] [
	c/value: c/value + 1
	return c
]

print #"a"           ; a
print next-char #"a" ; b
```

BeardPower

[12:56](#msg5ba8deeabe4f300626de9135)Yes, because you are returning the input param.

[12:56](#msg5ba8deffb4990c30ee001377)But this is Red, not Red/System.

[12:57](#msg5ba8df2cf4bd1056acacc09b)You are returning the value.

loziniak

[12:57](#msg5ba8df39e5c2cc56add77f69)... which is a struct! pointer according to https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#code-routine-code-type ?

[12:58](#msg5ba8df611043315947da7c6a)One moment - inside a routine we are in R/S not Red, right?

BeardPower

[12:58](#msg5ba8df827dca306503495ee5)Yes, you are calling an R/S function/routine from inside Red.

loziniak

[12:58](#msg5ba8df927dca306503495f44)and `c` is a pointer to a `red-char!` struct

BeardPower

[12:59](#msg5ba8dfb11ee2ca6502624afd)All types in Red are structs, yes.

loziniak

[13:00](#msg5ba8dfefb4990c30ee0017e0)Ok, I think I'm getting it. Perhaps I can't describe what I want to, given my lack of experience :-)

BeardPower

[13:02](#msg5ba8e0511043315947da8177)Don't mix char! with red-char!.

[13:02](#msg5ba8e080be4f300626de9969)red-char! is a struct:

```
red-char!: alias struct! [
	header 	[integer!]								;-- cell header
	_pad1	[integer!]
	value	[integer!]								;-- UCS-4 codepoint
	_pad2	[integer!]	
]
```

char! is not.

loziniak

[13:08](#msg5ba8e1b3e5c2cc56add78f68)Is routine's char! argument converted to red-char! pointer? Or treated similar to integer! ?

BeardPower

[13:08](#msg5ba8e1bae5c2cc56add78fcc)char! is the type in Red/System but Red has it's own types like red-char, red-integer etc. which are structs.

[13:08](#msg5ba8e1de1ee2ca65026258db)&gt; Is routine's char! argument converted to red-char! pointer? Or treated similar to integer! ?

No. R/S does not know about the Red types.

[13:09](#msg5ba8e204f4bd1056acacd4c5)https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#code-routine-code-type is about the Red spec, not the R/S spec.

[13:09](#msg5ba8e217f4bd1056acacd542)This is the R/S spec:  
https://static.red-lang.org/red-system-specs.html#section-4

loziniak

[13:11](#msg5ba8e2650cfe7f30f1df2d47)But `routine!` is a part of Red spec, right?

BeardPower

[13:11](#msg5ba8e268913ba7799b38496c)char! is just a byte! in R/S.

[13:11](#msg5ba8e27fb4990c30ee002816)&gt; But `routine!` is a part of Red spec, right?

Yes.

[13:11](#msg5ba8e28c913ba7799b384a54)It's for calling into R/S code.

[13:13](#msg5ba8e2e55df5194734074527)Your routine is passing a byte! and you increment the byte by a byte.

[13:14](#msg5ba8e3410cfe7f30f1df310d)

```
#"a" = 97
You add 1 to 97: 98
Printing 98 outputs #"b"
```

loziniak

[13:14](#msg5ba8e34af7e158062519acfd)I'm not sure, because In my code there is `c/value` so doesn't it show that `c` is a struct?

[13:15](#msg5ba8e38cbe4f300626deab1e)Wouldn't I get an error if `c` was a byte?

BeardPower

[13:16](#msg5ba8e3a9be4f300626deac66)

```
>> c: char! 1
== 1
>> c
== char!
>> c/value
*** Script Error: path c/value is not valid for datatype! type
*** Where: catch
*** Stack:
```

9214

[13:17](#msg5ba8e3d533da0f649e4763be)@BeardPower the hell are you doing, purple face? :joy:

BeardPower

[13:17](#msg5ba8e3e3913ba7799b385584)@9214 What you told me ;-)

9214

[13:17](#msg5ba8e3ede5c2cc56add79d4f)@loziniak routine accepts Red datatype as a boxed value, i.e. a struct.

[13:18](#msg5ba8e4335df5194734074d3d)So, in your example, `c` is a pointer to a \[`red-char!`](https://github.com/red/red/blob/master/runtime/datatypes/structures.reds#L200) struct.

BeardPower

[13:18](#msg5ba8e43f0cfe7f30f1df3708)@9214 We did not talk about accepting. It was a question about implicit conversion of a Red type to a R/S type.

loziniak

[13:19](#msg5ba8e444b4990c30ee003287)Ok, clear

[13:19](#msg5ba8e4517dca306503497eb2)Thanks @9214

9214

[13:19](#msg5ba8e45533da0f649e476556)And then you access its field with `c/value`.

[13:19](#msg5ba8e475e6046343f3abafe4)@BeardPower `c: char! 1`, what kind of nonsence is this?

BeardPower

[13:20](#msg5ba8e4a8be4f300626deb2f7)@9214 It was to show the difference between a Red char! (red-char!) and a R/S char! (which does not exist, hence there is byte!).

9214

[13:21](#msg5ba8e4cf7dca30650349812b)@BeardPower but there's no char in your example. You assigned `c` to `datatype!` value.

[13:21](#msg5ba8e4e633da0f649e4769ee)And then tried to access `value` as if it was an aggregate structure, like block or map.

BeardPower

[13:22](#msg5ba8e52a8909f71f751ec877)@9214 Exactly! There is no char! in R/S but only byte! in Red. "Misusing" the code, I tried to show the difference between Red and R/S types, as they are different.

9214

[13:23](#msg5ba8e54ebe4f300626deb6c1):confused:

BeardPower

[13:23](#msg5ba8e56933da0f649e476d0b)What is integer! in R/S?

9214

[13:24](#msg5ba8e5907dca30650349872d)4 bytes, in Red it's a boxed structure, just like any other Red value.

BeardPower

[13:24](#msg5ba8e59cd655361f7647c005)Exactly!

[13:25](#msg5ba8e5aef4bd1056acacea86)Can you do integer/value in R/S?

9214

[13:25](#msg5ba8e5ba7dca306503498781)I can do `red-integer/value`.

loziniak

[13:25](#msg5ba8e5bdbe4f300626deb9a1)I think now I understand everything. Next level is to create Red values from inside R/S code. `word/load` and the rest of mysterious adventures. Thank you, guys! :-)

BeardPower

[13:25](#msg5ba8e5cb33da0f649e476fc4)&gt; I can do `red-integer/value`.

In R/S?

9214

[13:26](#msg5ba8e5edb9531f2dfab30770)@BeardPower assuming that `red-integer` is a boxed `red-integer!` struct, yes.

BeardPower

[13:26](#msg5ba8e5f18909f71f751ecc70)&gt; I think now I understand everything. Next level is to create Red values from inside R/S code. `word/load` and the rest of mysterious adventures. Thank you, guys! :-)

Sorry, if I confused you. I just wanted to try to lead you to some understanding ;-)

[13:26](#msg5ba8e60ef4bd1056acaceb4e)&gt; @BeardPower assuming that `red-integer` is a boxed `red-integer!` struct, yes.

I'm not talking about calling a routine from Red. I'm talking about pure R/S.

[13:26](#msg5ba8e620e6046343f3abbab8)In R/S there is not even a char! type ;-)

9214

[13:27](#msg5ba8e6481ee2ca650262787c)Okay, putting aside Red values, I can't do `integer/value` on R/S integer, because it's not a pointer.

[13:27](#msg5ba8e6558909f71f751eceb9)And I can't dereference something that is not a pointer.

BeardPower

[13:27](#msg5ba8e65fbe4f300626debe58)&gt; Okay, putting aside Red values, I can't do `integer/value` on R/S integer, because it's not a pointer.

AHA! NOW we are taking.

[13:28](#msg5ba8e67af7e158062519c349)&gt; Okay, putting aside Red values, I can't do `integer/value` on R/S integer, because it's not a pointer.

Exactly.

loziniak

[13:28](#msg5ba8e683b4990c30ee0040b9)I think we all know the basics, for me the topic is over :-)

BeardPower

[13:29](#msg5ba8e6afb4990c30ee0041f4)I will discuss with @9214 privately and need to work on "anti-spoonfeeding" techniques.

PeterWAWood

[13:44](#msg5ba8ea41f7e158062519db44)@BeardPower  
&gt; char! is the type in Red/System but Red has it's own types like red-char, red-integer etc. which are structs.

I don't think that Red/System has a char! datatype only byte!

BeardPower

[13:45](#msg5ba8ea8b1ee2ca65026294d0)@PeterWAWood Yes, my bad. I was mentioning that.

PeterWAWood

[13:47](#msg5ba8eae3b4990c30ee005f94)If I remember correctly integer! and logic! values are automatically "unboxed".

BeardPower

[13:48](#msg5ba8eb307dca30650349ac43)Yes, @9214 was also writing me that.

9214

[13:49](#msg5ba8eb6ff7e158062519e368)Automatically boxed (R/S -&gt; Red), not unboxed (Red -&gt; R/S).

BeardPower

[13:50](#msg5ba8eb9a1ee2ca6502629ae3)The issue I wanted to point out is that coding a routine is not what you might expect when coding pure R/S:  
char! works in a routine, but not in R/S.  
integer/value works in a routine but not in Red and not in R/S etc.

[13:55](#msg5ba8ecb633da0f649e4796f8)&gt; Automatically boxed (R/S -&gt; Red), not unboxed (Red -&gt; R/S).

Yes and the question is, why are they are not unboxed?

[13:56](#msg5ba8ecfa913ba7799b388fed)If they are boxed from R/S to Red, the behavior should be symmetrical: unboxing from Red to R/S.

[14:01](#msg5ba8ee1ef4bd1056acad1c53)&gt;The arguments should be passed as pointers to Red values of the expected type, except for integer! and logic! datatypes, that can be passed inlined, without requiring any boxing. When required, for pointer arguments, a simple type casting is allowed.

9214

[14:01](#msg5ba8ee537dca30650349c261)@BeardPower with automatic unboxing you loose info contained in a slot header.

[14:02](#msg5ba8ee5a1ee2ca650262ac73)E.g. new line flag.

BeardPower

[14:03](#msg5ba8ee9a1043315947dad445)That's a point.

## Tuesday 25th September, 2018

loziniak

[12:34](#msg5baa2b5901fb5f4ae11d9648)Hello, again! May I ask for a code-review? Especially Red runtime calls done from `app_account_info` routine and lines commented with `;?`. Thanks in advance!  
https://github.com/loziniak/safenet.red/blob/master/safe.red

[12:35](#msg5baa2ba7fea6137094136d6b)Sadly, the code is not working. I thought I'd ask before spending more days digging rutime code. Maybe there is a simple answer.

[12:37](#msg5baa2bf6691dc567db9ef22d)You can comment specific lines here, on the commit page: https://github.com/loziniak/safenet.red/commit/d2fb68ba8a3bcbcbb553f656a31bcaba9b123e6b

greggirwin

[18:06](#msg5baa79132d11987093491e3a)@loziniak I hope someone can jump in. The core team is slammed on all fronts at the moment.

## Wednesday 26th September, 2018

loziniak

[10:13](#msg5bab5be498245f4ae086dba3)I hope too. I'm a little stuck, so I'll just have to wait patiently for help :-)

Oldes

[16:02](#msg5babad9c7bd81c5b9db91ecf)@loziniak maybe you will have to summon real masters to help you: @qtxie and @dockimbel

9214

[16:03](#msg5babadcd56877c463a89b0dc)@Oldes have you read what @greggirwin said?

Oldes

[16:09](#msg5babaf538196693171bb0eef)@9214 yes... and so what? I never did runtime calls so I cannot help and I don't think there is anybody else who could. Can you help?

qtxie

[17:44](#msg5babc571691dc567dba98655)@loziniak I'm not sure if it's possible to define a function inside a routine. And for `_function/call`, it expects two arguments.

## Thursday 27th September, 2018

loziniak

[13:37](#msg5bacdd0856877c463a9187d1)Thanks, everybody, especially qtxie and @Oldes for mentioning him :-)  
@qtxie, I fixed what you said. Does it look ok now? I'm especially not sure about two lines:  
\- `stack/pop 1` at the end of callback (copied it from `block/compare-call` code, but I'm not sure how should I tidy-up after a function call)  
\- `cb-ctx: cb/ctx` at the beginning (which context should I pass to function call?)

## Friday 28th September, 2018

haolloyin

[18:52](#msg5bae7852a9be136b94c7f9a1)Hello. I am trying to use a C standard function `sscanf`(see https://en.cppreference.com/w/c/io/sscanf):

```
int sscanf(const char *buffer, const char*format, ... );
```

Here is my `Red/System` code:

```
Red/System []

#import [
    LIBC-file cdecl [
        sscanf: "sscanf" [
            [variadic]
            return: [integer!]
        ]
    ]
]

s: declare c-string!
sscanf ["test 123" "test %s" s]
print-line ["s:" s]     ;==> s:123

i: declare integer!
sscanf ["test 123" "test %d" i] ;==> Runtime Error 1: access violation
print-line ["i:" i]     ;==> should be i:123
```

I can't figure out why `%d` would occur a runtime error.  
Any body could help me? Thanks!

## Saturday 29th September, 2018

9214

[01:41](#msg5baed83cc08b8b3067a51eff)@haolloyin are you sure that `declare integer!` is a correct construct?

bitbegin

[01:57](#msg5baedbf3435c2a518e238c16)i: 0 will be enough

haolloyin

[03:20](#msg5baeef6d640179275b6b52a1)@bitbegin @9214  
I've tried `i: 0`, the same runtime error when calling `sscanf`.

9214

[03:30](#msg5baef1c0435c2a518e23fc58)From where `123` result comes? I don't see this value in your snippet.

bitbegin

[03:43](#msg5baef4ea3844923661b898d3)sscanf \["test 123" "test %d" :i]

haolloyin

[04:14](#msg5baefc1c5331811c2e20c9a4)&gt; sscanf \["test 123" "test %d" :i]  
This works.  
I know, `sscanf` accepts ADDRESSs as its third parameters when `%d`(when `%s`, the `c-string!` is an ADDRESS itself).  
Thanks @bitbegin and @9214 !

## Sunday 30th September, 2018

amreus

[22:25](#msg5bb14d69ef4afc4f28fc9e2c)Hello. Is there an example of creating and returning a `block!` of strings from a `routine`? I've seen mention that conversions need to be made between Red types and Red/System types but found no documentation on the subject. I did find some examples for passing strings from Red to Red/System using `string/rs-head` but nothing about if blocks are possible in Red/System.

## Monday 1st October, 2018

9214

[07:18](#msg5bb1ca4f600c5f642336ec87)@amreus this conversion is possible, unfortunately working with runtime library is an arcane art in an of itself, which only a few have mastered. And this few is quite busy right now.

amreus

[20:22](#msg5bb2820c600c5f64233b9776)@9214 Thanks - I'll continue searching the source code of Red along with related repositories for hints.

## Friday 5th October, 2018

loziniak

[00:30](#msg5bb6b0b45331811c2e4f61fa)@amreus do you know that you can compile Red to Red/System? There is a lot to learn from that: https://github.com/red/red/wiki/%5Bzh-hans%5D-Compile-Red-code-to-Red-System-and-learn-something

9214

[04:32](#msg5bb6e9406e5a401c2d1bed60)@loziniak are you telling us that this is a big news that Red can be compiled to R/S..?

loziniak

[06:29](#msg5bb704c33844923661e8a5f6)@9214 yes, proven :-)

9214

[08:05](#msg5bb71b461e23486b938f6bda)Turns out people don't read documentation and readmes at all.

rebolek

[08:06](#msg5bb71b9aef4afc4f28202cc6)I can't read Chinese :(

loziniak

[13:50](#msg5bb76c3abbdc0b2505ee2f0f)Here's a translation done by Google Translate: https://translate.googleusercontent.com/translate\_c?act=url&amp;depth=1&amp;hl=en&amp;ie=UTF8&amp;prev=\_t&amp;rurl=translate.google.com&amp;sl=zh-CN&amp;sp=nmt4&amp;tl=en&amp;u=https://github.com/red/red/wiki/%255Bzh-hans%255D-Compile-Red-code-to-Red-System-and-learn-something&amp;xid=17259,15700023,15700124,15700149,15700186,15700191,15700201,15700214&amp;usg=ALkJrhiudFdEMNL8Rwl6EEs8OAqwHvLM4g

moliad

[20:35](#msg5bb7caff6e5a401c2d21804a)@BeardPower got a problem trying to add two datatypes at a time. I found no clue as to why it happens, but once the second datatype is added (using the same procedure, basically replicating the exact same changes, but using a new name, just after) I get a memory access error from Red on boot-up of the console and it quits immediately.

[20:35](#msg5bb7cb29435c2a518e597bc1)we tried a few things, but a part from changing the memory address printed, nothing beyond removing one of the two types changed anything.

[20:36](#msg5bb7cb3ac08b8b3067dac18e)any ideas?

amreus

[23:29](#msg5bb7f3cf435c2a518e5a6d27)Thanks @dockimbel for this: https://gist.github.com/dockimbel/8f42bf7e8f01f21950ea41d6c6cbd253

## Saturday 6th October, 2018

moliad

[00:17](#msg5bb7ff01ef4afc4f2825e87c)that's cool

loziniak

[13:52](#msg5bb8be271e23486b9399481d)@moliad perhaps a sample of your code will help to understand a problem.

## Sunday 7th October, 2018

BeardPower

[00:03](#msg5bb94d69271506518dca51a3)@moliad Make sure you change the maximum number of datatypes. Currently it's hard coded for 50 types. Adding two new types would cause a segfault.

[00:08](#msg5bb94e6982893a2f3baeb231)https://github.com/red/red/blob/dafc8286e472926dc57d1788c3e069d2950f16b8/runtime/datatypes/datatype.reds#L51

amreus

[19:15](#msg5bba5b56bbdc0b2505ff0b43)I'm getting this error when attempting to compile this previously mentioned \[gist](https://gist.github.com/dockimbel/8f42bf7e8f01f21950ea41d6c6cbd253). Do I need a different `red` than `red-latest.exe`?

```
Compiling to native code...
*** Compilation Error: undefined symbol: red/stack/ctop
*** in file: %/C/Users/Amreus/Code/Red/red-lang-sandbox/get-arguments.red
*** in function: exec/get-arguments
*** at line: 332
*** near: [stack/ctop 3
    s: top/prev
    t: stack/arguments
    list: block/push-only*
]
```

[19:24](#msg5bba5d74ae7be94016178d6e)Oh it compiles using `-r` switch. I usually just use `-c`

## Tuesday 9th October, 2018

moliad

[00:18](#msg5bbbf3c1c08b8b3067f01258)@BeardPower thanks for that I was looking exactly for that line of code... though I was yet to go hunting specifically for it.

[00:21](#msg5bbbf4905331811c2e6fec80)might have to setup an auto-increment setup of macros... I usually add a XXXXXX\_TOP value in any static sized list enums, so I can compare it later.

BeardPower

[00:38](#msg5bbbf8a23844923661074eeb)@moliad The code will be changed in the future to have it set automatically.

moliad

[00:39](#msg5bbbf8dac7bf7c3662da052f)why not propose the change to change it right away ;-)

[00:40](#msg5bbbf90c1c100a4f2951b2c2)(I mean, I'll try to fix it this week, and if so will do a pull request)

BeardPower

[00:40](#msg5bbbf90c6e5a401c2d3af090)IIRC future changes involve more than this change.

moliad

[00:41](#msg5bbbf925ae7be9401622fc4c)baby steps ;-)

BeardPower

[00:42](#msg5bbbf95e6e5a401c2d3af38a)A lot of these steps get trashed with Red 2.x.

moliad

[00:42](#msg5bbbf971ae7be9401622fd7b)yeah... but where a long way from there :-)

BeardPower

[00:43](#msg5bbbf9c75331811c2e700dc1)But yes, some things can be fixed anyway. We should give @dockimbel a heads-up.

## Thursday 11st October, 2018

moliad

[15:27](#msg5bbf6be7435c2a518e8c4567)yay! my datatype counter code was merged-in :smile:

BeardPower

[16:09](#msg5bbf75c0384492366120dbbf)@moliad Nice!

## Friday 12nd October, 2018

Rebolforces

[01:22](#msg5bbff76564cfc273f9bd14d0)Is the Money! datatype from Rebol2 going to make it in? Converting some of my old scripts and realise how commonly I was using it.

PeterWAWood

[01:59](#msg5bbffffa384492366124c0df)There will be some equivalent to money! in Red but it will use a decimal floating point arithmetic not binary floating point arithmetic. It is unlikely that it will have an integral currency code. It is equally unlikely that Red/System will have an equivalent to money!

Rebolforces

[04:14](#msg5bc01fba82893a2f3bce3a56)thanks Peter. One of the advantages to it for me was that the majority of business reports I used to automate consisted of currency code formated money columns just like Rebol read in so easily. avoided a lot of string conversions.

moliad

[14:31](#msg5bc0b04d1c100a4f29743e3e)note that you can now add a datatype for your needs, if its something that is essential to your codebase

## Saturday 13th October, 2018

greggirwin

[04:57](#msg5bc17b34e65a634336cdbd69)@BeardPower has been working on an experimental implementation of `money!`, which is currently range limited to ~$8M, which we'll talk about soon.

## Thursday 18th October, 2018

loziniak

[19:48](#msg5bc8e37c069fca52a558cff0)Hello, I have a code like this:

```
Red/System []

#define app_ptr! byte-ptr!

ffi_result!: alias struct! [
; https://github.com/maidsafe/ffi_utils/blob/master/src/lib.rs
	error_code [integer!]
	error_description [c-string!]
]

#import [
	"libsafe_app.so" cdecl [

		safe_test_create_app: "test_create_app" [
; https://github.com/maidsafe/safe_client_libs/blob/master/safe_app/src/ffi/test_utils.rs
			app_id [c-string!]
			user_data [byte-ptr!]
			cb [integer!]
		]
	]
]
cb2: func [
	[cdecl]
	user_data [byte-ptr!]
	result [ffi_result!]
	app_ptr [app_ptr!]
] [
	print " error_code: "
	print result/error_code
	print " error_description: "
	print result/error_description
]

safe_test_create_app  "abcdef"  as byte-ptr! 0  as integer! :cb2
```

And I get a segfault. But when instead of `"abcdef"` in last line I write `as c-string! 0`, there is no segfault and imported library returns an error result as expected. How should I properly pass a string argument to `test_create_app` external function?

## Saturday 20th October, 2018

loziniak

[12:09](#msg5bcb1af21e23486b93ec5390)Or maybe someone could help me to debug this?

9214

[12:21](#msg5bcb1dda1c100a4f29b685ff)@loziniak from what I see, you need to pass a constant pointer to a C-string. I'm not sure if that's the case in your example.

loziniak

[12:27](#msg5bcb1f33069fca52a5669333)Thanks! I've tried that already and no success. But now I managed to \[compile](https://forum.safedev.org/t/safe-client-libs-compilation-problem-rust-openssl/2128) an updated version of the library. This led me to another error. Only after a few minutes I realised that the previous error has gone. Outdated lib was the problem.

9214

[12:29](#msg5bcb1f9abbdc0b25056f6f3c):+1:

loziniak

[12:41](#msg5bcb227d6e5a401c2da05d51)Finally I've made a \[successful \_async_ call](https://github.com/loziniak/safenet.red/blob/master/safe\_simple.reds) from Red/System. Now it's time to convert that to Red routine :-)

x8x

[16:31](#msg5bcb586ce4b1d87dc792ad70):thumbsup: @loziniak are you going to rewrite https://github.com/loziniak/cinx in Red?

## Sunday 21st October, 2018

loziniak

[21:23](#msg5bccee341c100a4f29c19022)Probably not. Would you like me to? :-) I'd rather try to run/distribute Red apps through SAFENet, something in the spirit of \[Rebol IOS](http://www.rebol.com/index-ios.html). But more realistic, just learn something interesting :-)

## Sunday 4th November, 2018

moliad

[16:32](#msg5bdf1f2a538a1c197171ef3a)@dockimbel @qtxie trying to work on view rendering and in the face? function (within view.red file) there is a function being used called `class-of`. That string of text is nowhere else in the whole codebase. I tried two different folder search apps and neither found any other reference to this string of text... can you give me a clue as to where this comes from? I'm really curious!!

rebolek

[18:19](#msg5bdf381c995818347ba1d1dd)Interesting.

meijeru

[18:58](#msg5bdf4144d3442e19728bc7ab)Sorry, on phone. The function class-off is short for reflect ... 'class. I think all -of functions are generated, that's why you don't see them in the code base.

[19:04](#msg5bdf42ca995818347ba218c1)See environment/functions.red

moliad

[19:22](#msg5bdf47085760a73eb43ab1fd)thanks I'll look into it !

9214

[22:50](#msg5bdf77a1cd2a6b5bdc979638)`class-of` gives class ID (an integer) of an object, that's all I know.

[22:50](#msg5bdf77bba9c55b2574aa0915)Instances of the same prototype have same IDs IIRC.

endo64

[23:31](#msg5bdf816026be6b59796c5273)Correct,

```
>> class-of o: object [a: 1]
1000004
>> class-of make o []
1000004
>> class-of make o [b: 2]
1000005
```

## Monday 5th November, 2018

moliad

[02:41](#msg5bdfadca5905a91955559b89)interesting feature.

dockimbel

[12:04](#msg5be031c36ab3f85bdd09881d)That feature is just experimental, use at your own risk. ;-)

BeardPower

[12:36](#msg5be039574775f53eb3447869)Is this Red's introspection?

## Tuesday 6th November, 2018

moliad

[01:26](#msg5be0edd5aa56280c9710eb35)is there a way to flush the GUI console's buffer in the view. I'm having a hard time debugging anything, it crashes before anything is printed in the console.

[01:27](#msg5be0edf37c6c9e5df2130ee8)(and is it possible to run the console from the shell, instead of the gui console?, I'm on windows)

gltewalt

[01:27](#msg5be0ee0d7c6c9e5df2131067)`red --cli` to run command line console

[01:27](#msg5be0ee1b1f2bb1676b5dbb1a)From cmd.exe

[01:33](#msg5be0ef717660cf07ca75a38d)https://github.com/red/red/wiki/%5BDOC%5D-Debugging

[01:40](#msg5be0f1039c65e607e7067e82)`clear system/console/buffer`

moliad

[01:41](#msg5be0f15d6200995df141c079)aha thanks!

## Saturday 17th November, 2018

ldci

[18:01](#msg5bf057664720c11e0e807983)Neural network with Red language here: http://redlcv.blogspot.com/2018/

greggirwin

[18:42](#msg5bf060fbddad8777ef7c9c19):+1:

## Saturday 24th November, 2018

hiiamboris

[20:17](#msg5bf9b1e9a115c91ef788911e)Is there any R/S level info out there for contributors about Red's internals? Like how data is represented, how the allocator works, how it uses stack when it calls something, what common functions are available to work with Red stuff, the overview of the design of the whole thing and modules, etc.

9214

[20:45](#msg5bf9b87cb6c070105280aca0)@hiiamboris short answer is: nope.

hiiamboris

[20:47](#msg5bf9b8d197a8982b9a5b8898)thought so ☺

9214

[20:53](#msg5bf9ba4dcfa682348d7b1c0f)@hiiamboris though, I can more-or-less answer some of your questions.

hiiamboris

[21:06](#msg5bf9bd3fed6bcf1ef854faf9)@9214 I don't have a specific question, really. Just that I feel that I have a vague idea of how everything connects and works, and extraction of ideas from code requires some effort. But thanks anyway :)

9214

[21:06](#msg5bf9bd69ced7003fe17d888f)@hiiamboris yeah, I'm kinda in the same boat.

## Sunday 25th November, 2018

BeardPower

[02:40](#msg5bfa0b866621313894139358)Is there a place left in your boat? :smile:

gltewalt

[03:33](#msg5bfa17ffced7003fe17fa980)I saved a screenshot of this for the “one day” that I get enough time to dive back into red/system

[03:35](#msg5bfa1896ed6bcf1ef8571d99)https://imgur.com/a/09KDvnn

hiiamboris

[09:44](#msg5bfa6ef897a8982b9a5fa409)Thanks @gltewalt !

## Tuesday 27th November, 2018

greggirwin

[17:50](#msg5bfd83daf59704348e1280b8)There's a big push on doc planning right now, and R/S docs are part of that. One caveat is that Nenad may not want to spend too much core dev time on it, as things may change. If we have a champion, maybe Nenad can answer questions and confirm things, because I think it will be good for a while, and help others ramp up on the system side, which is where we need the most help.

9214

[18:11](#msg5bfd88e6f849b222e0b24930)Tinkering with Red runtime would be great, but not very practical in prospect (everything will be disposed after 1.0). Nenad's availability and response time will be major bottlenecks in this process.

BeardPower

[18:23](#msg5bfd8bb5baf43f2b9b82891e)That is the issue. How is self-hosting addressed? Should it just be a port of the Red compiler? What will be dropped? What are the lessons learned? Are you considering to create a scanner and parser out of the EBNF to ease the development of the new compiler?

[18:24](#msg5bfd8bd9958fc53895fb8dfd)Not to mention the Apple 64-bit/ARM issue.

[18:25](#msg5bfd8c21662131389429cdb9)Is it even feasible for others to take on those tasks without Nenad?

[18:26](#msg5bfd8c42a115c91ef7a0f550)Design docs incoming?

[18:27](#msg5bfd8c95958fc53895fb9260)@9214 Everything will be disposed? You mean everything actually implemented in REBOL, right?

9214

[18:28](#msg5bfd8cbaed6bcf1ef86cdc5b)@BeardPower yes, I meant total rewrite after bootstrapping phase is complete.

BeardPower

[18:29](#msg5bfd8cfff849b222e0b26625)@9214 Now all we need is an ETA on that one ;-)

PeterWAWood

[23:09](#msg5bfdce8fed6bcf1ef86e8ed4)&gt; Tinkering with Red runtime would be great, but not very practical in prospect (everything will be disposed after 1.0). Nenad's availability and response time will be major bottlenecks in this process.

Why will everything be disposed of after Red 1.0? The compiler written in Rebol will be replaced by one written in Red for Red 1.0. It is not necessary or practical to rewrite the Red runtime to be able to write a compiler in Red.

## Wednesday 28th November, 2018

BeardPower

[00:32](#msg5bfde227e25cc2740553e34d)@PeterWAWood @dockimbel mentioned some time ago, that he want's to change how some things work (IIRC about the stack) and from the lessons learned.

greggirwin

[01:57](#msg5bfdf600cfa682348d9602e1)That's for 2.0, AFAIK.

## Tuesday 4th December, 2018

moliad

[20:28](#msg5c06e373500e8e37285dd8a2)There are a few big things missing in the compiler's design, mainly optimization phase and better retargeting at different levels (like compiling Red to C instead of R/S, targeting different back-ends natively like llvm or C# for Some parts of the compilation, etc.)

BeardPower

[22:00](#msg5c06f9148fa4333e393d4da2)@moliad Engage the compiler compiler ;-)

[22:02](#msg5c06f98599ad1556db08b190)Missing stuff: better error reporting and synchronization points.

moliad

[22:40](#msg5c07026799ad1556db08e911) note that I am not implying we drop R/S, only that it may be useful for some parts of the process to target C because it it ubiquitous and will run on all H/W by default.

BeardPower

[23:33](#msg5c070eb2f992693c7a21cfa7)Same goes for other languages ;-)

[23:33](#msg5c070ed6e4787d16e346dd42)Yes, you could build a compiler for implementing a compiler to get Red self-hosted.

## Wednesday 5th December, 2018

greggirwin

[00:44](#msg5c071f7c4808192b03e7225d)@moliad it's tradeoffs, as you know. How much optimization do most people need, versus the cost of being dependent on C. LLVM has been actively discussed, and is likely the leading target for the needs you outline.

## Thursday 6th December, 2018

ericguedespinto

[21:21](#msg5c0992c48d4f3a2a7c7ff24c)Hello everybody, I have 2 questions:  
1\. Does one need to do memory management in Red/System?  
2\. How would one work with arrays, like modify or append to them? Are arrays mutable?

greggirwin

[21:31](#msg5c09954033d9e119919076df)@ericguedespinto

1\) Yes, just as in C.  
2\) Have you read https://static.red-lang.org/red-system-specs.html ? (https://static.red-lang.org/red-system-specs.html#section-4.8.6 specifically talks about arrays). Think like C.

ericguedespinto

[21:44](#msg5c09983033d9e1199190873c)Thanks will do

## Friday 7th December, 2018

olivier\_lp\_twitter

[21:04](#msg5c0ae0693de4e816e226d99d)Will it be possible to use libraries directly in a script through the console or only when compiled ?

9214

[21:05](#msg5c0ae083f4880a60a2423a4d)Depends on what you mean by "libraries".

endo64

[22:05](#msg5c0aeeab8d4f3a2a7c88752d)@olivier\_lp\_twitter Dynamically loading libraries is not yet available.

greggirwin

[23:00](#msg5c0afb7df4880a60a242e09a)@olivier\_lp\_twitter, we do want to support that feature, eventually.

## Saturday 8th December, 2018

olivier\_lp\_twitter

[10:55](#msg5c0ba32028907a3c7be8c075)@greggirwin ok, i do too, it can be usefull for the one who are using script a lot to admin or automate. @endo64 thanx for your answer, i was asking for future as I saw it was not available

[13:20](#msg5c0bc5358b656e2b04e0d96a)Are the object oriented dynamic libraries are usable or as in rebol only C like ones ?

greggirwin

[18:04](#msg5c0c07ab8b656e2b04e28a05)Not sure what you mean by OO libs. Red supports both cdecl and stdcall conventions, but can't handle C++ name-mangled interfaces.

olivier\_lp\_twitter

[19:21](#msg5c0c19c64808192b0306cd19)@greggirwin by OO lubs I mean a lib witgin there is not direct functions to be called but methods organized in object as

[19:24](#msg5c0c1a7411bb5b250483a7f8)Microsoft.Lync.Model.DLL where the getclient api is called by lynckclient : : getclient. Maybe it s what you said with no C++ managed

gltewalt

[19:56](#msg5c0c21f326de6f0822a345ec)I think he means - like using References in VBA

## Sunday 9th December, 2018

Oldes

[12:34](#msg5c0d0bd811bb5b2504890474)@qtxie @dockimbel There was some change with struct definitions? I was just now trying to build one my script in code repository and it fails at these lines: https://github.com/red/code/blob/master/Library/os/definitions.reds#L28-L53

```
*** Compilation Error: invalid struct syntax: [value [int64! value]] 
*** in file: %/X/GIT/Red-code/Library/os/definitions.reds 
*** at line: 53 
*** near: [alias struct! [value [int64! value]] 
    float32-ptr-ptr!: alias struct! [value [pointer! [float32!]]]
]
```

Any idea why? It was working fine some time ago.

greggirwin

[21:24](#msg5c0d881b80986419d5663bdd)@olivier\_lp\_twitter If they are COM DLLs, there was some experimental work done on a .net bridge, but no direct support for COM DLLs AFAIK.

## Tuesday 18th December, 2018

dockimbel

[13:13](#msg5c18f2819f431114185d1645)@Oldes Do you still have issues with structs?

Oldes

[13:14](#msg5c18f2a034c6c32cc834005a)I was not trying it.. was there something changed recently?

dockimbel

[13:15](#msg5c18f2ec9c82bd024032cadc)I don't remember any change on that, but I haven't watch all the commits made in last couple of months.

Oldes

[13:19](#msg5c18f3e3b4ef82024850c82c)I will check it... it's possible that I'm using some old Red version :-/

[13:22](#msg5c18f4a9b4ef82024850cfb3)Sorry... it was really some misconfiguration on my side. So my scripts in Red/Code should be still compile-able.

[13:23](#msg5c18f4d0f4043314192cecf4)Btw... it would be nice to add support for the missing integer types so one would not need to do such a tricks.

dockimbel

[13:34](#msg5c18f76a34a2755a1d2d9e97)@Oldes There's no single week that passes where I don't wonder when I could find some spare time to implement both 16 and 64-bit support...

Oldes

[13:35](#msg5c18f79f41637902414b72a8)I know:/ I will enter into \_silent_ mode and not ask for every single detail, which consumes your time.

dockimbel

[13:49](#msg5c18faf09c82bd024032fef0)@Oldes Haha, I didn't imply that. Questions are always welcome. ;-)

## Friday 21st December, 2018

dockimbel

[11:40](#msg5c1cd1113c4093612c3dafec)Answering R/S questions from red/bugs group: :point\_up: \[December 21, 2018 6:42 PM](https://gitter.im/red/bugs?at=5c1cc3b093cce97d3b76082a)

@hiiamboris The static nature of structs produced by `declare` is not described in the docs (I thought it was). I will improve that.

&gt; It looks like it does something, occurring in the midst of code, while in reality it only tells the compiler to leave some zeroes at some place when it generates that code.

It's a static struct declaration, it's not supposed to do anything other than ensures that the struct has some static memory pre-allocated for it.

&gt; 1) how do I zero fill the struct properly? I can = 0 2 members, but if there's more it becomes annoying. And memset seems like an overkill for the task. No?

That's up to you (the programmer) to figure that out depending on your use-case. `memset()` is the default go-to, or you can use `fill` function if your struct size is a multiple of 4 bytes, or `zerofill` which is basically `memset()` but in R/S (so no extra imports needed). That two functions are defined in `%runtime/allocator.reds`.

&gt; 2) I take it /local x \[s! value] stores that struct data in the code segment before the function, right? Where /local x \[s!] (accessed by reference) stores the data?

No, `declare` allocates space from the data segment. `/local x [s!]` does not allocate any memory space for the structs, as it's a struct reference declaration, so it just reserve space for the struct pointer on the stack. If you add `value` at the end of that type spec, the struct space gets reserved on the stack (but it's not zero-filled, for sake of performance).

&gt; 3) what's even the point of declare? isn't /local x \[s!] a declaration in it's own right?

No, as explained in answer. `declare` is mostly used for static allocations in global context (that was its original purpose). Though, it's convenient to use it in function contexts also for static structs. But in general, in a function context, you mostly use on-stack structs, or you manipulate struct pointers. Cases where you need a static struct are rare.

hiiamboris

[12:39](#msg5c1cdef692cf4d2242d20b10)@dockimbel thank you! So one more thing: when does `declare` do it's job? at the program launch, before every other code?

dockimbel

[12:40](#msg5c1cdf383c4093612c3e0b26)@hiiamboris At compilation time. The related storage space is reserved in the data segment of the executable.

hiiamboris

[12:42](#msg5c1cdf9f3c4093612c3e0dc3)Aha. Now I get it. Still I would prefer it stood out from the rest of the code due it being compilation-time action ;)

[12:47](#msg5c1ce0d6cac5bc2241c6f312)&gt; The static nature of structs produced by declare is not described in the docs (I thought it was). I will improve that.

Yeah, definitely deserves mentioning. As this is totally different from how C++ and D initialize structs and variables.

dockimbel

[12:48](#msg5c1ce11c93cce97d3b76bc03)@hiiamboris It's the same in C, when you use `static` prefix in front of a variable declaration. The difference is just that we only allow structs, pointers and literal arrays to be static. What's missing in R/S is literal structs (so you can declare+initialize at the same time). That could be added if we can figure out a proper syntax.

greggirwin

[18:14](#msg5c1d2d84cac5bc2241c8e67e)@hiiamboris, could you add this info to a wiki page?  
\- https://github.com/red/red/wiki/%5BNOTES%5D-Red-System-Notes seems best, but we also have  
\- https://github.com/red/red/wiki/%5BDOC%5D-Red-System-tutorial-for-newcomers-English-version  
\- https://github.com/red/red/wiki/%5BNOTE%5D-Porting-C-code-to-Red-System

hiiamboris

[19:10](#msg5c1d3ab493cce97d3b791853)I think Nenad will add it to the R/S reference.

[19:15](#msg5c1d3bdd23323d58bd04f625)I'm knee deep in those size-text/to-image/GDI+ issues right now anyway, but I'm keeping track of them questions too, so you need not worry - no info will be lost :)

## Saturday 22nd December, 2018

greggirwin

[02:33](#msg5c1da26c0b7fc97caa7e6e4d):+1:

## Sunday 30th December, 2018

luce80

[18:39](#msg5c2910ee2863d8612bb2573a)Which is fastest (when compiled) ?  
many `if`s :

```
if a = 1 [...
if a = 5 [...
if a = 12 [...
...
```

case :

```
case [
 a = 1 [...
 a = 5 [...
 a = 12 [...
...
]
```

or switch ?

```
switch a [
 1 [...
 5 [...
 12 [...
...
]
```

9214

[22:21](#msg5c2945068dafa715c7197728)You want us to profile this for you? There's nothing in your question that you cannot answer by yourself.

## Monday 31st December, 2018

dockimbel

[04:04](#msg5c29953df6166a3027968233)@luce80 `switch` should be a bit faster. Your `ifs` and `case/switch` examples are not equivalent, as there is no fall-through like in C.

meijeru

[09:57](#msg5c29e81d0b7fc97caac7c257)Am I right in saying that `case` is equivalent to nested `eithers` (gets ugly very soon when many tests).

9214

[10:02](#msg5c29e93992cf4d224220022e)@meijeru semantically, yes. Emitted code might be different.
