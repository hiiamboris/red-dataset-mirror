# Archived messages from: [gitter.im/red/red/system](/gitter.im/red/red/system/) from year: 2020

## Tuesday 14th January, 2020

amreus

[22:13](#msg5e1e3cf8b990d50d81b31007)Hi. I'm reading the Red/System docs and found this inconsistency and was wondering if it's me, bad docs, or a bug. The docs say for a literal array that the 0 index should return the size of the array. I'm not getting that, but some unusual value:

````
Red/System []

list: [123 456 789]
i: 0
while [i < 4] [
  print [list/i space]
  i: i + 1
]```

And the result:
````

4206728 123 456 789  
\`

[22:19](#msg5e1e3e800e65654fa0e393a2)Oh, using `red-13jan20-938744fc.exe` on Windows 10 Home 64-bit

dockimbel

[23:50](#msg5e1e53d1df9e137d58e47f4e)@amreus We have removed that feature, and updated the doc (https://github.com/red/red/commit/d704d4f9cc49332c7a3622d321bb52e040fe0509), but the new doc version was not deployed yet on the website (we usually do that on new releases). Index 0 does not refer to the size anymore (use `size?` keyword instead). Pointer indexes are 1-based when using the path syntax, so what you are getting with `list/0` is the value before the first value of the array.

[23:53](#msg5e1e545ef72ed51fb4d03ae7)@x8x Could you please deploy the latest R/S docs on the website?

## Wednesday 15th January, 2020

pekr

[05:46](#msg5e1ea74e123d916da23c8520)@dockimbel Any chance R/S gets a first class arrays at some point, so those are easier to use for noobs? :-) I am referring to this remark: "Currently literal arrays allow write access, but there is no bound checking as it is planned to be a feature of a future array! first-class datatype."

dockimbel

[12:19](#msg5e1f034425256256b7f6f6ce)@pekr Not a priority, we are holding back on many features to add to R/S until the toolchain gets ported to Red.

pekr

[12:26](#msg5e1f04f4f72ed51fb4d54f42)The good news is, that there are some features planned. My perception might be wrong anyway. Trying to dig into the small computing boards, I am myself not being able to envision the lowest possible hw support (or any future possibilities in that area) anyway, so no rush ...

[12:28](#msg5e1f055453fd014bb0776cae)One thing is the lowest possible memory / cpu constrained hw environment, Red is able to run upon, the other one is the R/S low level stack, but then I might miss on higher level stuff like ports, parse, etc.

[12:31](#msg5e1f063925256256b7f7087a)Or is, theoretically, parse callable from R/S, as it is implemented in R/S (as I can see parse.reds and `process`func there? Or maybe let's put it other way - once Red is more instrumentable, are we going to be able to achive e.g. something like Rebol/Base? I mean - selecting, what we want to have in?

BeardPower

[12:41](#msg5e1f086a35e7a1190959b944)Well, the lowest possible hw support is what you code it for. R/S can be used to code on bare-metal, so it's up to the developer.

[12:42](#msg5e1f089f8b53f6190ab7f713)You could even target a C64 or some HP calculator with it.

pekr

[12:42](#msg5e1f08a135e7a1190959bb11)Yes, I know. But it is about the balance, what does R/S offers you vs the full runtime.

[12:42](#msg5e1f08c5123d916da23f206c)... and that's also why some R/S improvements as better array support are welcomed :-)

BeardPower

[12:42](#msg5e1f08d025256256b7f71ad2)R/S can be seen as a "C" version of Red. Do your own foot-shooting.

[12:44](#msg5e1f0927df9e137d58e9bce2)The full runtime offers you abstractions, data-types, memory management and all the top-level stuff you are familiar with from other higher-level languages.

[12:45](#msg5e1f094e8b5d766da1abf72b)R/S has a minimal run-time but can also be used with no run-time at all.

[12:47](#msg5e1f09dfbe66165ecbd3d52d)Better array support is nice, yes, but R/S is not for hand-holding and should never be.

[12:49](#msg5e1f0a40be66165ecbd3d76f)If your code crashes the machine you did something wrong in the first place ;-)

greggirwin

[15:27](#msg5e1f2f5884894f56b66491e7)There doesn't have to be just one low level dialect, but it can't get much lower level than R/S. On /base or other "kernels" the question is value vs effort. We want to fight complexity and bloat, but there's a big gap between microcontrollers and tiny SBCs. e.g., a full Red runtime is still tiny on a PiZero with 512M. Where R2/base helped was startup speed for CGIs and such, but Red offers other approaches here, and modern concurrency will be a priority for things like large numbers of tasks.

rebolek

[15:34](#msg5e1f310e51a9c24baf9db1c7)For CGI speedup, FastCGI or SimpleCGI is a much better approach, as it eliminates startup time totally.  
For microdevices, I believe there can be a dialect that's somewhere between R/S and full Red that will provide limited Red functionality without low-level limitations of R/S.

pekr

[15:54](#msg5e1f35b7df9e137d58eb438f)OK, so we probably better forget the microcontroller scenario, whereas small boards like Beagle Bone, RaspberryPi are going to be very OK. I had MicroPython in mind and they claim to work at 128KB space with some 80% of language supported, if my understanding was correct. So I was just wondering, where can we go. As Gregg suggests, we might have several dedicated dialects, if needs arises. Anyway, I am so very glad, R/S layer exists!

x8x

[20:44](#msg5e1f79bf3aeffb654a1d220c)@dockimbel  
&gt; @x8x Could you please deploy the latest R/S docs on the website?

R/S docs updated and automated, will need to fix some paths when you merge lexer branch

dockimbel

[21:18](#msg5e1f819484894f56b6671f04)@x8x Great, thanks!

## Friday 17th January, 2020

amreus

[21:27](#msg5e2226d1000f497899145246)@dockimbel Thanks for the update.

## Wednesday 5th February, 2020

loziniak

[11:04](#msg5e3aa12858f02e3497644a72)Hi! Is there an easy way to print `byte!` in hex form in Red / System?

hiiamboris

[11:08](#msg5e3aa220fe0e6f74e9028515)`prin-2hex`

loziniak

[11:40](#msg5e3aa9ab1594133558592035)thanks

## Thursday 6th February, 2020

Intey

[10:23](#msg5e3be931e8a83835591baacf)Hi. How to convert `c-string!` to `red-string!` from routine?  
I try to `string/load` but it’s unavailable from r/s

hiiamboris

[10:45](#msg5e3bee3e58f02e349767c50f)It should be available. Have you compiled it in release `-r` mode?

Intey

[10:57](#msg5e3bf11f73ddad4acd96e9cb)No, just `red -c test.red`

hiiamboris

[11:06](#msg5e3bf351594a0517c26de8cb)libredrt contains symbols for a specific program only

loziniak

[11:07](#msg5e3bf359d9895b17c3d4d2da)You can also try `-c -u`, and after that `-c` is sufficient and much faster. Just until you use some new R/S runtime function, then `-c -u` can be needed once more.

[11:08](#msg5e3bf3bf73ddad4acd96f2b9)Note: `-c -u` is a little slower than `-r` but when you compile very often, using `-c` many times gives you great benefit.

hiiamboris

[11:10](#msg5e3bf43cf301780b836c71d1)I wonder if there's a way to export \*everything* and never bother to recompile libredrt anymore?

loziniak

[11:12](#msg5e3bf4a273ddad4acd96f6e2)It would be awesome.

Intey

[11:52](#msg5e3bfe07fe0e6f74e90627f4)Ok, I’m just didn’t found `as red-string!` in first time)

dockimbel

[12:20](#msg5e3c04a4f301780b836ca72d)@hiiamboris  
&gt; I wonder if there's a way to export \*everything* and never bother to recompile libredrt anymore?

The only time I tried that, the runtime was crashing badly. Though, I don't remember if I tried to exclude `typed` and `variadic` functions from exportation.

hiiamboris

[12:38](#msg5e3c08d06f9d3d3498248a1c)I see.

## Friday 28th February, 2020

loziniak

[09:02](#msg5e58d7337fef7f2e898d4ec6)hi, is it possible to get pointer to a function in context? like `_rnd: :_random/rand`?

rebolek

[09:03](#msg5e58d777ff6f6d2e8874139f)I haven't been working with R/S for some time, so I don't remember exact detail, but as I remember, you need to convert to integer to get function pointer.

loziniak

[09:50](#msg5e58e253ec7f8746aaa09b8d)Ok, but wher to get this integer from?

[09:51](#msg5e58e2a6ff6f6d2e8874343a)I thought something like this would work:

```
Red/System []

a: context [
	f: func [return: [integer!]] [
		print "f"
		return 10
	]
]

print :a/f
```

but it prints only:

```
f10
```

so it simply runs the function instead getting its pointer.

[10:01](#msg5e58e50ccb91b5224ffd14d6)I thought maybe `with` will be useful, but this does not compile:

```
Red/System []

b: declare function!

a: context [
	f: func [return: [integer!]] [
		print "f"
		return 10
	]
]

with a [
	b: as function! :f
]

b
```

hiiamboris

[11:39](#msg5e58fbe353fa513e285b5af4)`as int-ptr! :_random/rand`

loziniak

[11:40](#msg5e58fc223ca0375cb38d59df)and how do i run this function afterwards?

hiiamboris

[11:44](#msg5e58fd25ec7f8746aaa0f9a1)I think you're right, it's buggy and should be reported

[11:45](#msg5e58fd4f4eefc06dcf23b0b3)

```
a: context [
    f: func [x [integer!]][probe x]
    probe as int-ptr! :f
]
probe as int-ptr! :a/f 123
```

Output:

```
004021E7
123
0040310A
```

Not only the address is wrong, but it indeed calls the function

[12:06](#msg5e59024c53fa513e285b6c91)As a workaround I would save function pointer within the context as `f-ptr: as int-ptr! :f` and then use it as `a/f-ptr`

loziniak

[12:16](#msg5e59049390a8295824f43117)This indeed answers my question. But to generate more problems, I'd like to call `f-ptr` in another context :-)

[12:16](#msg5e5904a0376d882250be678a)Like in:

```
_random: context [
	rand: func [
		return: [integer!]
	]
	rand-secure: func [
		return: [integer!]
	]
]

series: context [
	random: func [
		s [red-series!]
		secure? [logic!]
		/local
			_rnd [function! [return: [integer!]]]
	] [
		_rnd: either secure? [:_random/rand-secure] [:_random/rand]
		; do something with multiple calls to _rnd
	]
]
```

hiiamboris

[12:32](#msg5e590874ec7f8746aaa11f94)So call it. Calls are documented https://static.red-lang.org/red-system-specs.html#section-6.6

loziniak

[12:35](#msg5e59090b2e398f46abccc66c)I assumed, that I cannot call `int-ptr!`s.

[12:39](#msg5e590a09cb91b5224ffd92a3)But I'll try. For now I've just duplicated code as a workaround.

[12:47](#msg5e590bc8b873303e276bd37c)Another thing. This gives me strange results:

```
Red/System []

f2: func [
	x [integer!]
	return: [integer!]
] [10]

print (either true [12] [13])
print lf
print ((either true [12] [13]) % (f2 5))
print lf
print ((either true [12] [13]) % (f2 3))
print lf
print (either true [12] [13]) % 10
print lf
```

Instead `12 2 2 2`, its `12 1 1 2`:

```
12
1
1
2
```

Can anybody reproduce this?

hiiamboris

[12:50](#msg5e590c7d376d882250be80af)Either is known to be buggy. The only expression you should use it in is `result: either ...`.

[12:51](#msg5e590cbcca2f5a558d55b977)Even that I try to avoid and write `either .. [.. result: ..][.. result: ..]` instead

loziniak

[12:51](#msg5e590cd5d045e2582502ff99)what a minefield :-)

## Saturday 29th February, 2020

greggirwin

[20:13](#msg5e5ac5e34eefc06dcf27e10d)If we haven't doc'd these things in the wiki, please do. Save others from stepping on the same mines (which magically reset in everyone's personal context).

loziniak

[23:04](#msg5e5aede3a157485cb4669dd5)I've actually did it \[in my PR](https://github.com/red/red/pull/4309/commits/a4eecca5961bbdb7edde5cdefa45a39c2ed9655d#diff-8316ff52a282f6aed8d89ec772af20c2R2150)

[23:04](#msg5e5aee08ec379e558e9992d3)Should I move it to the wiki?

greggirwin

[23:08](#msg5e5aeedf8e04426dd0150113)Thanks. Wiki is good IMO.

loziniak

[23:08](#msg5e5aeefa2e398f46abd13912)You mean "better"?

greggirwin

[23:20](#msg5e5af1c890a8295824f8e20a)"Different" and "clearly more doc oriented if people go looking for answers". :^)

loziniak

[23:22](#msg5e5af219b873303e2770387c)I meant "better in this particular situation", which leads to an answer for my question "should I move it" :-)

greggirwin

[23:27](#msg5e5af3788e04426dd0150944)Yes, please. :^)

## Tuesday 3th March, 2020

loziniak

[11:44](#msg5e5e431a376d882250cabd6d)Hi! In `libc.reds` there is `log` function imported and called `log-2`. I think this can be misleading, because libc's `log` is a \*base e* logarithm (natural), not \*base 2\*. Is that intentional? Why is it like that?

[12:36](#msg5e5e4f532e398f46abd8ed3d)https://github.com/red/red/blob/master/system/runtime/libc.reds#L138

hiiamboris

[12:58](#msg5e5e5478cb91b5224f09f139)Looks like a typo

[12:59](#msg5e5e54968e04426dd01d017f)Gives `2.772588722239781` for `log-2 16.0` ☻

loziniak

[13:21](#msg5e5e59d053fa513e2867d73c)Ok, I'll fix it then.

hiiamboris

[13:23](#msg5e5e5a6dff6f6d2e888137d7):+1:

loziniak

[16:16](#msg5e5e82d1ec7f8746aaae16c0)fixed in #4309

hiiamboris

[16:38](#msg5e5e8822ec379e558ea2263e)There's also `log-b` btw :)

## Thursday 19th March, 2020

loziniak

[11:44](#msg5e735b20949f6d2d8e59d1a9)Hi! Is it possible to get a `red-object!` given it's ctx node? I mean something opposite to `o/ctx`

[12:04](#msg5e735fbba2e37e3a03462646)or opposite to `GET_CTX(o)`, I'm not sure which is correct.

[12:12](#msg5e7361a254f26e12b529db35)Anyway, I'd like to call `object/loc-fire-on-set*` but have only `octx` in my function, which is a context pointer, like `ctx||516` when compiled to red/system.

[12:35](#msg5e7367027945b756c423f747)Haha, again asking questions is the best way to answer them :-) It seems answer lies at the end of `object/init-push`:

```
s: as series! octx/value
obj: s/offset + 1
```

hiiamboris

[13:02](#msg5e736d5093b5ff12b4674363):+1:

greggirwin

[18:32](#msg5e73bab854f26e12b52b1d0a)\[This](https://github.com/red/red/wiki/%5BNOTES%5D-Red-System-Notes) is probably a good place to note that.

## Sunday 3th May, 2020

TheHowdy\_gitlab

[12:15](#msg5eaeb5da7a24ff01b0fba0d1)I'm planning to do a small experiment with the LLVM in R/S, but I need a binding for it. The LLVM API has huge header files, so I'm not very eager to write a binding by hand. Instead, I'd use a generator to do it for me. I saw quite a few bindings out there with a comment that says that they were generated, e.g. (https://github.com/red/code/blob/master/Library/Vulkan/vulkan.reds). Is there any such "generator" available in a repository? Because apparently they already have been written.

Of course I could just port the functions I need... but meh, they are quite a few too.

hiiamboris

[12:23](#msg5eaeb7d47975db7ebfdfd4fe)I remember an "RGB" project somewhere. And also there was another one I think. Hard part is finding the links :/

[12:28](#msg5eaeb8fc14b48f0698a82deb)Yes! https://github.com/Pebaz/RGB here's one

dockimbel

[14:08](#msg5eaed04d9f0c955d7da00485)@TheHowdy\_gitlab You can ask @Oldes for his generator scripts.

TheHowdy\_gitlab

[16:56](#msg5eaef7af7975db7ebfe06779)Great, thank you both.

## Monday 4th May, 2020

Oldes

[16:01](#msg5eb03c6322f9c45c2a6bd15f)@TheHowdy\_gitlab I was using just hackish (ugly) Rebol scripts to generate the files... no real C/H parser. Here is for example \[parse-vulkan.r](https://gist.github.com/Oldes/69dfe24089655446547678d721b6bdc9) or \[parse-sqlite.r](https://gist.github.com/Oldes/ee2e82a3485815d7e85a4b5d3d475e9f). These scripts were used to make a version, which was manually tuned, if I remember well.

[16:12](#msg5eb03eee7975db7ebfe34ab7)Actually the method was, that I've run the script, review logged errors and generated file, modified the parser and or definitions and run it again, until I was quite satisfied with the result.

[16:13](#msg5eb03f339f0c955d7da339ed)I think that the biggest problem is with yet missing internal types, like 64bit or 16bit integers... with these one must do \[ugly hacks in Red](https://github.com/red/code/blob/02d4263ff117fc8a75341d90e168d74babf81c9c/Library/os/definitions.reds#L27-L44). But only @dockimbel is able to add support for these.

## Sunday 10th May, 2020

ushakovs\_gitlab

[21:59](#msg5eb8793a5cd4fe50a301074f)How to develop Android app in pure C. No VMT, no Java. https://github.com/cnlohr/rawdrawandroid  
It may be interesting.

## Monday 11st May, 2020

greggirwin

[01:37](#msg5eb8ac6497338850a2fde21e)Nice. App store deployment is likely a no-go, but this could still have good info in it. @bitbegin :point\_up:

bitbegin

[01:55](#msg5eb8b09a3d58de7a3809c39e)@greggirwin @ wrong person...

greggirwin

[02:17](#msg5eb8b5cdadb0ec5c2bf9d43c)Ah, sorry, I thought you knew Android internals.

## Friday 29th May, 2020

bubnenkoff

[12:55](#msg5ed1062db101510b20255232)"Red/System is able to load external shared libraries "  
If read allow to import shared libs does it mean that I can call postgresql driver written on pure C?

dockimbel

[13:04](#msg5ed108707da67d06fadc5d75)@bubnenkoff R/S is able to load external shared libraries written in C.

ldci

[17:01](#msg5ed13ffd2280c80cbfd82419)@dockimbel Is there a way to access to object address as a pointer?

hiiamboris

[17:50](#msg5ed14b57f0b8a2053ac03a2e)@ldci what do you mean?

ldci

[21:44](#msg5ed1822089941d051a2f971c)@dockimbel When you create a structure, you'll get an address as an integer ( a pointer). I want get the same when creating a Red object.

hiiamboris

[21:58](#msg5ed185722280c80cbfd8eafc)Doesn't `obj/ctx` work for you?

ldci

[22:24](#msg5ed18b87778fad0b13355b12)@hiiamboris Thanks I'll test

## Saturday 30th May, 2020

ldci

[10:02](#msg5ed22f45225dc25f54b5dfeb)@hiiamboris Thanks for the suggestion. I was looking for a simple way to access objects with Red/system routines.  
This is an object sample  
`rect: copy featureRect rect/x: 4 rect/y: 7 rect/width: 20 rect/height: 30 rect/weight: 0.00567`  
and now the routine

`getRectObject: routine [ rObj [object!] /local size [integer!] s [red-value!] p [int-ptr!] pf [float-ptr!] ][ size: object/get-size rObj s: object/get-values rObj print [ "Size: " size lf] p: as int-ptr! s ;s is a red-value! -> skip header p: p + 2 print ["x: " p/value lf] p: p + 4 print ["y: " p/value lf] p: p + 4 print ["width: " p/value lf] p: p + 4 print ["height: " p/value lf] pf: as float-ptr! p + 4 print ["weight: " pf/value lf] ]`  
Red is really great !

hiiamboris

[10:08](#msg5ed230a4225dc25f54b5e315)Better to use triple-backticks for formatting code

ldci

[10:09](#msg5ed230f2a91f120a6cd1395e)Yes, really sorry. A formatted code.

```
object!
rect: copy featureRect
rect/x: 4
rect/y: 7
rect/width: 20
rect/height: 30
rect/weight: 0.00567

routine!

getRectObject: routine [
	rObj	[object!]
	/local
	size	[integer!]
	s 		[red-value!]
	p		[int-ptr!] 
	pf		[float-ptr!]
][
	size: object/get-size rObj
	s: object/get-values rObj
	print [ "Size:   " size lf]
	p: as int-ptr! s
	;s is a red-value! -> skip header
	p: p + 2
	print ["x:      " p/value lf]
	p: p + 4
	print ["y:      " p/value lf]
	p: p + 4
	print ["width:  " p/value lf]
	p: p + 4
	print ["height: " p/value lf]
	pf: as float-ptr! p + 4
	print ["weight: " pf/value lf]
]
```

hiiamboris

[10:12](#msg5ed23173549761730b68e1ff)Ah. At first I thought you need a unique pointer for something ;)  
Yes, routines give you a lot of flexibility.

[10:13](#msg5ed231d9f0b8a2053ac24c63)What are you using this for, by the way? @ldci

[10:16](#msg5ed23273b101510b20281b9e)I have the same structure, rectangle + weight (0 to 1 - how reliably it was detected) in View Test system

ldci

[10:21](#msg5ed2338c4c9b0f060d32c84c)@hiiamboris redCV is now able to find faces in image with a basic implementation of Viola-Jones algorithm which is stump-based (!\[alt] (https://twitter.com/fjephe/status/1259400320762986498/photo/1). I'm improving the code with an implementation of a tree-based algorithm and I'm testing objects vs. structures for speed.

hiiamboris

[10:23](#msg5ed23408778fad0b1336b52a)Nice ☻

ldci

[10:24](#msg5ed2345d225dc25f54b5eb9f)@hiiamboris Thanks

pekr

[10:35](#msg5ed2370cf0b8a2053ac25a96)So you want to have Red level objects being accessible from R/S?

[10:37](#msg5ed23751a91f120a6cd14837)In R2 library interface I do remember some trick of how to get a pointer to some stuff via a parse marker. IIRC Ladislav has written something like address-of function, but I might be wrong too ...

ldci

[11:06](#msg5ed23e1d778fad0b1336cde1)@pekr Exactly. high-level Red objects are very convenient for storing Haar cascade filters for face recognition but since nodes are huge , I need to process with Red/System routines. In progress...

pekr

[11:16](#msg5ed24095ff7a920a721f78d6)Hmm, I wonder if struct would be sufficient. Isn't there planned the structs support for the Red level too? https://trello.com/c/MR6HCDxV/186-red-core

ldci

[11:59](#msg5ed24abca91f120a6cd17508)@pekr In the first version of Viola-Jones Haar cascades, I used arrays of vectors which were adapted for a stump-based (linear) organisation of nodes. To get more cascades efficient, I need to adopt a binary-tree approach which is a little bit more sophisticated and I'm currently testing the best way (Objects or Red/S structures). Structures are quite easy to understand since basically there are pointers. Objects can be also considered as pointers, but access to pointed values is more complicated since objects can mix values of different datatypes non present in Red/System.

```
; Binary tree nodes
node: make object! [
	featureRects:	[]		;--list of feature rectangles
	isTilted: 		0		;--tilt not used 
	threshold: 		0.0		;--Threshold for determining what to select  or where to go on binary tree 
	leftVal: 		0.0		;--left value
	rightVal: 		0.0		;--right value
	hasLeftNode:	0		;--Does this node have a left node? (false)
	leftNode:		0.0		;--left node. If current node does not have a left node, this will be null
	hasRightNode:	0		;--Does this node have a right node? (false)
	rightNode:		0.0		;--Right node. If current node does not have a right node, this will be null
]
```

[12:01](#msg5ed24b314412600ccd7951b6)@pekr Thanks for links

hiiamboris

[12:06](#msg5ed24c3dff7a920a721f922b)I think there should also be a danger that GC will simply free all your objects (if you're creating them from R/S) ;)

[12:07](#msg5ed24c6e89941d051a313468)Plus if you are creating \*a lot* of objects, you're putting more pressure on GC and it will become the bottleneck.

[12:08](#msg5ed24caa549761730b6922b2)\[Here's also a table](https://github.com/red/red/wiki/\[PROP]-Node!-datatype#now-all-looks-fine-until-we-consider-the-ram-requirements) of average RAM requirement for Red values, including objects

ldci

[13:18](#msg5ed25d0827513a72fbc1a714)@hiiamboris You're right for GC. In my first version with arrays and pointers to arrays, I had to deactivate GC with recycle/off. Unless pointer were freed by GC. For face recognition, I use around 3000 nodes.

## Monday 1st June, 2020

bubnenkoff

[16:05](#msg5ed5275cf0b8a2053ac920a5)I have very low experience with C but I decided to call libpg from r/s. I placed libpg.dll near app.red and got error `0xc000007b` at run. How to understand the reason of the error? It's did not found proper function in dll or there is maybe another problem? What steps I should to do to understand what wrong?

dander

[16:16](#msg5ed529e0a91f120a6cd81310)\[This tool](https://www.microsoft.com/en-us/download/details.aspx?id=100432) is pretty handy for looking up common error codes

Oldes

[20:29](#msg5ed56533d13751370433709d)@bubnenkoff you really cannot expect any meaningful answer on question like that. Without showing code which you try to use.

## Tuesday 2nd June, 2020

bubnenkoff

[07:46](#msg5ed603e1b101510b20310706)I found issue, it was not enough single libpg it required also few another lib like libcrypto-1\_1

## Wednesday 3th June, 2020

ldci

[18:13](#msg5ed7e8642c49c45f5abe64e7)redCV: improvement for face detection: https://twitter.com/fjephe/status/1268244010709192704

greggirwin

[18:28](#msg5ed7ebcf4c9b0f060d411f3e)Wow! Super cool.

[18:29](#msg5ed7ec157da67d06faed6a92)2s is impressive, as someone who doesn't live in that space or understand the least bit of how it works.

## Thursday 4th June, 2020

ldci

[05:57](#msg5ed88d40a91f120a6ce0e1aa)@greggirwin  
Haar Cascade is a machine learning object detection algorithm used to identify objects in an image or video and based on the concept of Haar features proposed by Paul Viola and Michael Jones. A cascade function is first trained from a lot of positive and negative images and then used to detect objects in other images. You'll find a clear explanation \[here] (http://www.willberger.org/cascade-haar-explained/)  
Red/System is efficient for such computation. Some comparaison with OpenCV C++ using the same parameters. For a simple image including a single face, openCV requires 20 ms for identifying face and Red 40 ms. OpenCV is faster than Red, but sometimes fails to correctly identify all faces in image. With correct parameters for the cascade function Red find all faces without trouble.

rebolek

[06:37](#msg5ed896b6f0b8a2053ad22a78)@ldci that's amazing! 20ms vs 40ms is better than I expected.

ldci

[08:14](#msg5ed8ad51778fad0b1346db12)@rebolek Red/System is rather fast and redCV allows a fine tuning of cascade parameters. I think my code could be improved by replacing all Red functions by Red/System routines for accelerating all process.

rebolek

[08:28](#msg5ed8b0929da05a060a4e541a)@ldci IIRC @dockimbel said that R/S is 2-5x slower than C as there are no optimizations so I would expect OpenCV to be more than 2x faster. So your algorithms must be very efficient :-)

hiiamboris

[08:43](#msg5ed8b42289941d051a40fd23)Don't forget that R/S uses libc for many tasks

rebolek

[08:44](#msg5ed8b475daf4cf366edebf8b)True, but I expect that such detection would be mostly math.

[08:45](#msg5ed8b4bc3ffa6106f1f3ab86)BTW, it would be nice if R/S could use musl beside libc :-)

hiiamboris

[08:47](#msg5ed8b52322dd444224fa0956)If it supported dynamic linking?

[08:48](#msg5ed8b54422dd444224fa09ab)Or otherwise it would be an extra dependency, no?

rebolek

[08:49](#msg5ed8b5947da67d06faef4f21)As a separate compilation target in `%system/config.r`

[08:49](#msg5ed8b5a7a3a1b13679c7b9c6)But currently, file I/O doesn't work under musl

ldci

[11:31](#msg5ed8db9e22dd444224fa6b72)@rebolek Some elements. I don't use OpenCV cascade xml files , but simple text files which populate a lot of vector! type arrays. Vector is better than a simple block for computation. Then, when possible, I use integer values rather than float values for basic classifier files. Probably this feature will be extended for all classifiers. All functions which are time consuming are written as routines. Lastly these good performances are observed for basic stump-based classifiers. When using tree-based classifiers, we need a lot of branching tests which increase the duration of the whole process.

greggirwin

[13:16](#msg5ed8f4369da05a060a4f19a9)Thanks @ldci! Great info. Looks like we need to build you some profiling tools.

ldci

[14:49](#msg5ed909fd7da67d06faf03702)@greggirwin Thanks a lot for the proposition.

bubnenkoff

[15:53](#msg5ed918ec9da05a060a4f8f5f)I am trying to use C PG driver from R/S. The docs show next code:  
`PGconn *conn; /* Connection Object */`

Am I right that in R/S this code will be:

`conn: declare pointer! [PGconn!]`

hiiamboris

[15:55](#msg5ed919839da05a060a4f90fb)depends on what PGconn is

[15:55](#msg5ed9198f778fad0b13480a07)if it's a struct, R/S uses it as pointer already

bubnenkoff

[15:59](#msg5ed91a6189941d051a4221e3)And `charconninfo[] = "hostaddr = '127.0.0.1' port='5432' dbname = 'testdb'"` it's c-string? or struct?

[16:07](#msg5ed91c3cdaf4cf366edfe9c1)If I need pass `null` to function what is correct data-type it should be? All Red data types are end with `!` so I should pass `null` or `null!`?

rebolek

[16:12](#msg5ed91d5ddaf4cf366edfec58)You are in Red/System, you can pass 0.

meijeru

[16:59](#msg5ed92882daf4cf366ee00c83)We are supposing that `null` is in fact zero. For 8-bits zero, you can use `null-byte`. If you need 32-bits zero you just pass integer `0`.

bubnenkoff

[19:45](#msg5ed94f3f22dd444224fbcc25)What's wrong with defenition of `n`?

```
Compilation Error: invalid definition for function conn: [
    n [null]
```

?

```
#import [
   "libpq.dll" stdcall [
       conn: "PGSetdb" [
		   n [null]
           conninfo    [c-string!]
           return: [integer!]
       ]
   ]
]
print conn null ""
```

hiiamboris

[19:54](#msg5ed9518d89941d051a42c759)there's no type `null`

bubnenkoff

[19:56](#msg5ed951da2c49c45f5ac207e2)but how to pass it if I need it to call lib function?

hiiamboris

[19:56](#msg5ed952049da05a060a5049e8)do you understand the difference between type and value?

bubnenkoff

[19:58](#msg5ed9524e7f08394226c884f7)Yes I do

hiiamboris

[19:59](#msg5ed9529722dd444224fbd902)define the function with proper types, then pass null value

bubnenkoff

[20:02](#msg5ed95365b101510b203a16ca)I do not see how to declare null type in docs...

hiiamboris

[20:03](#msg5ed95394ff7a920a72312635)there is no null type

[20:03](#msg5ed953987f08394226c88967)null is a value

[20:04](#msg5ed953be7da67d06faf10c97)do you also expect to have `1` type and `2` type and `1310472` type and so on?

bubnenkoff

[20:04](#msg5ed953dd3ffa6106f1f58026)no of course)

hiiamboris

[20:05](#msg5ed953ef7f08394226c88a36)good ☻

bubnenkoff

[20:05](#msg5ed9540bdaf4cf366ee08b9d)But in C null is type or it's value %)?

hiiamboris

[20:05](#msg5ed9541e4c9b0f060d44c481)a value of course

bubnenkoff

[20:17](#msg5ed956d7778fad0b1348bce2)Oh! I understood! So if I need to call C-function I need at start describe (it's args) it's calling in Red, and then simply call it'a as it was Red function?

hiiamboris

[20:18](#msg5ed95708a3a1b13679c992ff)yeah

bubnenkoff

[20:33](#msg5ed95a86daf4cf366ee09ed1)If lib return type `PGconn` I should describe it before I can use it as return type like:

```
"libpq.dll" stdcall [
       conn: "PGSetdb" [
		   n [c-string!]
		   n2 [c-string!]
		   n3 [c-string!]
		   n4 [c-string!]
           conninfo    [c-string!]
           return: [PGconn!]
       ]
   ]
```

?

hiiamboris

[20:41](#msg5ed95c67a91f120a6ce32382)if you wanna use this pgconn inside your code, yes

[20:41](#msg5ed95c8bff7a920a72314253)if it's an opaque pointer for you, then you can replace it with `integer!` or whatever

## Friday 5th June, 2020

bubnenkoff

[10:37](#msg5eda204ca3a1b13679cb8cf8)A lot of code is using PGconn. I am trying to understand how to describe it, but can't find it's signature in docs. I looked at source code and all that I found things like https://github.com/postgres/postgres/blob/e78b93094518b1e262cba8115470f252dde6f446/src/interfaces/libpq/libpq-fe.h#L143

hiiamboris

[10:43](#msg5eda21d0f0b8a2053ad64827)https://github.com/postgres/postgres/search?q=pg\_conn&amp;unscoped\_q=pg\_conn

bubnenkoff

[12:28](#msg5eda3a53b101510b203c528a)Thanks! If it very complex struct with nested elements should I try to find minimal working subset that will work or I should to port all data structures?  
p.s. I have never wrote bindings

hiiamboris

[12:30](#msg5eda3aecb101510b203c5485):point\_up: \[June 4, 2020 11:41 PM](https://gitter.im/red/red/system?at=5ed95c67a91f120a6ce32382)

bubnenkoff

[12:33](#msg5eda3bb1225dc25f54c9fb4e)&gt; if it's an opaque pointer for you, then you can replace it with `integer!` or whatever

```
dbname: "PQdb" [
; if it's assept PGconn what kind of data I should accept here? Just poiner?
return: [c-string!]
	   ]
```

hiiamboris

[12:34](#msg5eda3bd73ffa6106f1f7c0c7)any 32-bit value really

[12:34](#msg5eda3be422dd444224fe1cc7)if you don't care about the contents of the data pointer refers to

bubnenkoff

[12:35](#msg5eda3c2d4c9b0f060d470d58)`integer!` is fine?

hiiamboris

[12:36](#msg5eda3c34daf4cf366ee2cf05)sure

bubnenkoff

[12:38](#msg5eda3cbda3a1b13679cbd77c)I am not fully understand how it's work? Why any type will work? When function return pointer it does not matter what type, need only pointer size be same?

[12:39](#msg5eda3cf122dd444224fe1f4c)WOW! it's working!

[12:39](#msg5eda3d0a225dc25f54c9fe1a)

```
conninfo: "hostaddr = '127.0.0.1' port='5432' dbname = 'testdb'"

#import [
   "libpq.dll" stdcall [
       conn: "PQconnectdb" [
           conninfo    [c-string!]
           return: [integer!]
       ]   
	   dbname: "PQdb" [
		PGconn [integer!]
		return: [c-string!]
	   ]
	   
   ]
]

print dbname conn conninfo
```

```
> app.exe
> testdb
```

hiiamboris

[12:40](#msg5eda3d2ca3a1b13679cbd84f)the other lib does not know anything about your types, it only receives and sends bits ;)

bubnenkoff

[12:49](#msg5eda3f57225dc25f54ca0455)And what is the cases when I need to wrap all data-types?

hiiamboris

[12:50](#msg5eda3f7db101510b203c5e4d)not sure what you mean

bubnenkoff

[12:56](#msg5eda40ea89941d051a4522ad)For example what is the case when I need to port full structure of C lib to red? to map every type from C to red analog

hiiamboris

[12:57](#msg5eda4137225dc25f54ca08cd)if you wish to use that structure in your Red code, I mean each value of it

bubnenkoff

[13:16](#msg5eda45b03ffa6106f1f7db2d)If return type is `ConnStatusType` and it's enum, how to print it result?  
the simple print cause `*** Runtime Error 1: access violation`  
`print conn_status conn conninfo`

[13:16](#msg5eda45c3f0b8a2053ad6ab5a)

```
#import [
   "libpq.dll" stdcall [
       conn: "PQconnectdb" [
           conninfo    [c-string!]
           return: [integer!]
       ]   
	   dbname: "PQdb" [
		PGconn [integer!]
		return: [c-string!]
	   ]
	   
	   conn_status: "PQstatus" [
		PGconn [integer!]
		return: [c-string!]
	   ]	   
	   
   ]
]

print conn_status conn conninfo
```

hiiamboris

[13:18](#msg5eda462eb101510b203c722c)use an integer

bubnenkoff

[13:19](#msg5eda465a3ffa6106f1f7de2c)Could you explain why?

[13:20](#msg5eda46b12c49c45f5ac47009)it's return `1` even if I specifying wrong db name

hiiamboris

[13:21](#msg5eda46c2a3a1b13679cbf339)because enum is an integer

bubnenkoff

[13:22](#msg5eda471e778fad0b134b1742)In C example they are use names instead of codes? Should I wrap enum as struct to be able use names?

hiiamboris

[13:24](#msg5eda4775778fad0b134b1849)there are enums in R/S

bubnenkoff

[13:28](#msg5eda489189941d051a4537e3)So if it's return 1 that it's return first enum field from here?  
https://github.com/postgres/postgres/blob/e78b93094518b1e262cba8115470f252dde6f446/src/interfaces/libpq/libpq-fe.h#L47

hiiamboris

[13:36](#msg5eda4a53b101510b203c7f1a)yes

bubnenkoff

[14:18](#msg5eda5429f0b8a2053ad6d679)I have added enums, but code still return `1`:

```
conninfo: "hostaddr = '127.0.0.1' port='5432' dbname = 'testdb'"

#enum ConnStatusType! [
	CONNECTION_OK
	CONNECTION_BAD
	CONNECTION_STARTED
	CONNECTION_MADE		
	CONNECTION_AWAITING_RESPONSE
									
	CONNECTION_AUTH_OK
								 
	CONNECTION_SETENV			
	CONNECTION_SSL_STARTUP
	CONNECTION_NEEDED	
	CONNECTION_CHECK_WRITABLE
								 
	CONNECTION_CONSUME	
								
	CONNECTION_GSS_STARTUP
	CONNECTION_CHECK_TARGET		
]

#import [
   "libpq.dll" stdcall [
       conn: "PQconnectdb" [
           conninfo    [c-string!]
           return: [integer!]
       ]   
	   dbname: "PQdb" [
		PGconn [integer!]
		return: [c-string!]
	   ]
   
	   conn_status: "PQstatus" [
		PGconn [integer!]
		return: [ConnStatusType!]
	   ]	   
	   
   ]
]

print conn_status conn conninfo
```

```
> app.exe
1
```

hiiamboris

[14:18](#msg5eda54533ffa6106f1f80b28)what did you expect it to return?

bubnenkoff

[14:19](#msg5eda548df0b8a2053ad6d735)At last of wrong connection credentials something another from 1.  
But I except enum as name like: `CONNECTION_OK`

hiiamboris

[14:20](#msg5eda54b689941d051a4562aa)"CONNECTION\_OK" is a string that only exists in the source code file, not in the compiled binary

bubnenkoff

[14:23](#msg5eda5561f0b8a2053ad6da08)ok! Do you have any ideas why it always return 1?

hiiamboris

[14:24](#msg5eda55982c49c45f5ac49c00)maybe because connection is OK?

bubnenkoff

[14:27](#msg5eda565c9da05a060a52eddf)even on not existent port?

hiiamboris

[14:28](#msg5eda56784c9b0f060d47584b)`¯\_(ツ)_/¯`

[14:29](#msg5eda56ce3ffa6106f1f812d5)maybe C enums start with zero?

[14:29](#msg5eda56d3778fad0b134b43e7)and it's connection\_BAD?

bubnenkoff

[14:30](#msg5eda570e89941d051a4567a7)oh!

[14:46](#msg5eda5ada89941d051a45733a)Am I correctly mapped this C string to red?  
`conninfo[] = "hostaddr = '127.0.0.1' port='5432' dbname = 'testdb'"`  
`conninfo: "hostaddr = '127.0.0.1' port='5432' dbname = 'testdb'"`  
?

hiiamboris

[14:58](#msg5eda5d8e2c49c45f5ac4b172)I believe so

[14:59](#msg5eda5dbe2c49c45f5ac4b1e1)shouldn't you be using `cdecl` for C libs instead of `stdcall`?

[15:00](#msg5eda5e04b101510b203cba64)thought it depends on the export settings of the lib

bubnenkoff

[15:07](#msg5eda5fb9a3a1b13679cc3f6f)how to check what I should use?

hiiamboris

[15:08](#msg5eda5fecf0b8a2053ad6fafb)try to find someone else's (working) import declaration maybe

bubnenkoff

[15:10](#msg5eda60759da05a060a530b99)but `dbname` call is seams to work with `cdecl` and `stdcall`

[15:24](#msg5eda63b622dd444224fe9201)I missed user name in connection string

hiiamboris

[16:09](#msg5eda6e572c49c45f5ac4e782)it's somewhat sad that in the 21st century we're using trial and error and stack juggling to connect code libs together

bubnenkoff

[16:20](#msg5eda70eb4c9b0f060d47aaec)would webassembly helpful here?

## Saturday 6th June, 2020

bubnenkoff

[12:32](#msg5edb8cc57da67d06faf684e6)Could you give me any advices about naming. I am playing with wrapping postgres. The follow code is working. Is it's good to name any actions (functions) as `get-`? I do not want to stay original C naming because it's look not native to Red.

```
Red/System []

connString: "hostaddr = '127.0.0.1' port='5432' dbname = 'testdb' user=postgres"

#enum ConnStatusType! [
	CONNECTION_OK
	CONNECTION_BAD
	CONNECTION_STARTED
	CONNECTION_MADE		
	CONNECTION_AWAITING_RESPONSE
									
	CONNECTION_AUTH_OK
								 
	CONNECTION_SETENV			
	CONNECTION_SSL_STARTUP
	CONNECTION_NEEDED	
	CONNECTION_CHECK_WRITABLE
								 
	CONNECTION_CONSUME	
								
	CONNECTION_GSS_STARTUP
	CONNECTION_CHECK_TARGET		
]

#import [
   "libpq.dll" cdecl [
       conn: "PQconnectdb" [
           connString    [c-string!]
           return: [integer!]
       ]   
	   dbname: "PQdb" [
		PGconn [integer!]
		return: [c-string!]
	   ]
	   
	   get-connect-status: "PQstatus" [
		PGconn [integer!]
		return: [ConnStatusType!]
	   ]

	   get-if-connection-need-pass: "PQconnectionNeedsPassword" [
		PGconn [integer!]
		return: [ConnStatusType!]
	   ]	    
	   
   ]
]

conn-obj: conn connString
connect-status: get-connect-status conn-obj
either not connect-status = CONNECTION_OK
[
	print "Can't connect"
]
[
	print "Connected"
]

if (get-if-connection-need-pass conn-obj) = 1
[
	print "password required"
]
```

hiiamboris

[12:37](#msg5edb8def22dd4442240152c4)yes, that's more Redbol-like

bubnenkoff

[14:23](#msg5edba6d322dd4442240190d9)If `print function-name` print `0` does it mean that function return null and r/s is display it as 0?

hiiamboris

[14:23](#msg5edba6f87f08394226ce433c)sounds right

[14:24](#msg5edba702ff7a920a7236e1ae)if you defined `return:` as integer

bubnenkoff

[15:16](#msg5edbb3629da05a060a563159)`Oid *paramTypes`  
is it correct to declare it as:  
`paramTypes [integer!]`

I looked at github, but there is too much `Oid` is search so I did not find it type ( https://github.com/postgres/postgres/blob/e78b93094518b1e262cba8115470f252dde6f446/src/interfaces/libpq/libpq-fe.h#L54 )

hiiamboris

[15:18](#msg5edbb3b72c49c45f5ac7e18d)clone the repo and search locally

bubnenkoff

[17:48](#msg5edbd6df225dc25f54cde2b2)If I need to create array should I use struct for it?

[17:48](#msg5edbd6ee778fad0b134ef1fe)I need represent data from row

ldci

[18:00](#msg5edbd9a5f0b8a2053ada74a7)redCV supports a lot of classifiers for identifying body parts in image. Only 20 ms to find eyes (https://twitter.com/fjephe/status/1269327755105177606).

hiiamboris

[18:04](#msg5edbda9e778fad0b134ef9e4)cool :+1:

[18:07](#msg5edbdb4589941d051a4918f4)how reliable is the detection? will it work for blurry camera images in low light?

ldci

[19:16](#msg5edbeb96ff7a920a7237893e)@hiiamboris To be tested. I'm working on infra-red images for test :)

hiiamboris

[19:17](#msg5edbebb04c9b0f060d4b2443):D

ldci

[20:01](#msg5edbf6069da05a060a56cc80)Red is fantastic! Better performances: https://twitter.com/fjephe/status/1269358389777371137/photo/1

hiiamboris

[20:02](#msg5edbf6573ffa6106f1fbfba6):clap:

pekr

[20:06](#msg5edbf75af0b8a2053adaba3a)@ldci there was some comparison to OpenCV, can't find it now. It was something like 20 vs 40ms. Now you are down from 2s to cca 1.2, can it be compared to OpenCV?

ldci

[20:08](#msg5edbf7ae778fad0b134f3c04)@pekr Yes! and with less false-positive candidates. Red is great:)

pekr

[20:09](#msg5edbf7eb7da67d06faf781c0)So what's the number for OpenCV for the same image? Would like to propagate your work on FB group .... again :-)

ldci

[20:09](#msg5edbf81689941d051a495c83)@hiiamboris For low light images, we can use a canny detector prior to face processing.

[20:11](#msg5edbf85ff0b8a2053adabc06)@pekr OpenCV 3.4.5. What is FB group?

pekr

[20:12](#msg5edbf89ca91f120a6ce99d48)https://www.facebook.com/groups/redlanguage/

ldci

[20:13](#msg5edbf8ed7da67d06faf78433)@pekr Oups I'm not user of FB, but please you can diffuse :)

[20:15](#msg5edbf95a3ffa6106f1fc01f2)@pekr I've stopped the support of OpenCV 4.0 branch since now all code is C++ and difficult to bing to Red/System.

[20:25](#msg5edbfbbeff7a920a7237afb3)to bind

## Sunday 7th June, 2020

toomasv

[03:46](#msg5edc6308a3a1b13679d0d5f9)@ldci Fantastic! :+1:

pekr

[08:29](#msg5edca57122dd44422403b112)Have read a bit about OpenCV this morning and it really seems C interface is being deprecated and in some areas even removed. Then I have wondered, how Python does it, and they use some SWIG system for interfacing. SWIG should be a tool, which generates wrappers, or something like that? Has anyone heard about that? http://www.swig.org/

[08:31](#msg5edca5c9f0b8a2053adc163c)@ldci so how much slower is the face detection function in comparison to OpenCV? We know, in theory, that R/S should be somewhere in the 2-5x slower than native code. IIRC you have mentioned 20ms vs 40ms comparison, but then you made it faster?

ldci

[09:14](#msg5edcafe8ff7a920a72390fbf)@pekr Yes Red/S is 2-5x slower than C. For basic image with one frontal face C is 2x faster than Red/S (20 ms vs. 40 ms). Same story for eye detection. For larger image with 7 faces, C is around 5x faster than Red/S (80 ms vs 400 ms). The pretty good performance of Red/S can be explain by the fact that my detectObject routine can be finely tuned by a lot of parameters. As usual in image processing, we have to adapt to the quality of image for fast processing. Last point, pre-processing of image with a Canny filter is not yet included in object detection library.

pekr

[09:18](#msg5edcb0d689941d051a4adcd6)Awesome 😀

[09:20](#msg5edcb17489941d051a4adde4)My understanding is, that OpenCV includes many things. Are you after the complete port, ir do you concentrate upon certain features? Object recognition and tracking, connected to AI seems to be popular nowadays....

ldci

[13:11](#msg5edce7659da05a060a58ccd2)@pekr You're right fo AI use. This the next step for redCV, but classifiers are a form of AI (supervised learning). For my scientific business, I'm often using Red in association with dLib (http://dlib.net) which is a fabulous and open source C++ library. See for example https://twitter.com/fjephe/status/1087394756915810304.

bubnenkoff

[16:04](#msg5edd0ff84c9b0f060d4da9ad)what data type I should use for return row result from DB?

[16:24](#msg5edd14bc89941d051a4bcb78)How to call function declared in R/S:

```
Red []
view [button "ok" [f]]

#system [
	f: func[] [print "hello"]
]
```

`Script Error: f has no value`

hiiamboris

[16:36](#msg5edd178f2c49c45f5acaf4b0)use routines

bubnenkoff

[16:46](#msg5edd19fb4c9b0f060d4dc558)It's r/s future? I see only one mention in r/s docs...

[16:47](#msg5edd1a34225dc25f54d0a9ed)https://static.red-lang.org/red-system-specs.html

hiiamboris

[16:48](#msg5edd1a5622dd44422404c12f)https://doc.red-lang.org/en/datatypes/routine.html

pekr

[18:05](#msg5edd2c4df0b8a2053add5b96)@bubnenkoff routines are means to interface to R/S code from the Red layer itself ....

## Monday 8th June, 2020

bubnenkoff

[12:37](#msg5ede3127daf4cf366eec06d9)What it next code doing?

```
as red-value! logic/box true
```

`true` should be turned into C true/false style?

rebolek

[12:39](#msg5ede316c4c9b0f060d5056da)`true/false` C style is zero for false and one for true. There's no boolean type in C.

bubnenkoff

[12:49](#msg5ede33c07f08394226d415fa)Does R/S have `block`? I am reading sources of R/S and there is next code:

```
block/make-at as red-block! _set-word-value 8
```

p.s. I am still looking for a way to return multiple values from R/S function

hiiamboris

[13:05](#msg5ede3785778fad0b135461f1)&gt; a way to return multiple values from R/S function

pass pointers, or return a struct

bubnenkoff

[13:10](#msg5ede38c5ff7a920a723caaaa)what is more safe to prevent memory leaks?

hiiamboris

[14:18](#msg5ede48c1a3a1b13679d54906)understanding what you're doing

bubnenkoff

[15:32](#msg5ede59f6daf4cf366eec844e)

```
#system [	
	sqlite: context [
			query: func [
				sql-query [c-string!]
			]	
			[
				print "System here"
				print sql-query	
			]
	]
]


sqlite: context [
	query: routine [
	][
		; query: func [
		; 	sql-query [c-string!]
		; ]
		; [
			print "do!!!"
			sql-query: {INSERT INTO "humans" ( "id", "age", "name") VALUES (15, 20, 'Mike');}
			sqlite/query sql-query
		; ]
	]
]


view [button "Insert" [sqlite/query] button "Select" []]
```

The problem in code that this version do not compile with error: `Compilation Error: variable sql-query not declared`  
If I uncomment commented code it's compile, but button even do not calls.

hiiamboris

[16:26](#msg5ede66a5225dc25f54d3dae2)declare it as /local

## Tuesday 9th June, 2020

bubnenkoff

[14:12](#msg5edf98eb7b6da9126a83ce46)Thanks!  
I am trying to return value from R/S to Red:

```
foo: func [return: [integer!]]
    [
       1
    ]
```

```
foo: routine [
        /local
        x [integer!]
    ]
    [
        x: foo
    ]
```

The error: `Compilation Error: attempt to change type of variable: x`

rebolek

[14:17](#msg5edf9a0749260560aa4d4d54)I wouldn¨t call noth function and routine the same.

bubnenkoff

[14:25](#msg5edf9be0035dfa12610cf463)what is right variant of naming? underscore or what?

rebolek

[14:28](#msg5edf9c7b7c64f31f114d3b3d)see the style guide http://www.rebol.com/docs/core23/rebolcore-5.html#section-5.2 but you're free to use your own syntax if you prefer

bubnenkoff

[14:29](#msg5edf9cc4013105125a2411eb)maybe I misunderstand you. You mean that function from R/S and from Red should have different names?

rebolek

[14:36](#msg5edf9e85ee693d6eb3b31f1f)see this code of yours:

```
foo: routine [
        /local
        x [integer!]
    ]
    [
        x: foo
    ]
```

[14:37](#msg5edf9e9530401c1f24463107)how could this work?

hiiamboris

[14:44](#msg5edfa045035dfa12610d00e1)why not? routine body belongs to R/S name space

rebolek

[14:47](#msg5edfa0f049260560aa4d6015)I would be careful anyway :-)

hiiamboris

[15:06](#msg5edfa5831e099b0388b660ca)well, apparently routines declare R/S funcs with the same name, so it's not gonna work anyway ;)

## Wednesday 10th June, 2020

bubnenkoff

[09:50](#msg5ee0acf149260560aa50be39)No. It's work if it wrapped in same context! At start I even thought that it was meant to be.

[09:51](#msg5ee0ad2c7c64f31f11509dbc)I faced with problem only with passing args in both sides

[10:02](#msg5ee0afa9013105125a277e16)Look at follow code:

```
Red []

#system [	
    data: declare int-ptr!
	sqlite: context [
			query: func [
				sql-query [c-string!]
			]	
			[
				print "System here"
				print sql-query	
			]

            foo: func [return: [integer!]]
            [
                return 123
            ]
	]
]

sqlite: context [
	query: routine [
        /local
        sql-query [c-string!]
	][
		sql-query: {INSERT INTO "humans" ( "id", "age", "name") VALUES (15, 20, 'Mike');}
		sqlite/query sql-query
	]
    ;; problem is here
    foo: routine [
        /local
        x [integer!]
    ]
    [
        x: foo
    ]
    ;; ^^^^ problem is here
    ;; Compilation Error: attempt to change type of variable: x

]

view [button "Insert" [sqlite/query] button "Select" []]
```

function `query` is placed in same context in R/S and in Red. It's save same name there. It works fine. The passing args from Red to R/S works fine.

The problem only when I am trying to pass data from R/S to Red. See error in `foo` function

pekr

[10:07](#msg5ee0b0d2ee693d6eb3b68d4a)What is the purpose of assigning `foo`to `x`in your code?

bubnenkoff

[10:10](#msg5ee0b17eee693d6eb3b68f0b)I want to return value from postgres driver and display it in view. The driver part is dropped here

hiiamboris

[10:11](#msg5ee0b1bbee693d6eb3b68f68)as @rebolek told you, don't use the same name

pekr

[10:13](#msg5ee0b2391e099b0388b99788)I would strip out contexts and start with just some simple example ...

[10:24](#msg5ee0b4c92cf2f36eae4ea49e)Hmm, can't access official docs page - it resolves, but is empty, with a minimal source code ....

hiiamboris

[10:28](#msg5ee0b5d27b6da9126a876023)Yeah. I'm getting used to that :/

bubnenkoff

[10:37](#msg5ee0b7eca85de30394054279)Both cases are works:

```
#system [	
    data: declare int-ptr!
        _query: func [
            sql-query [c-string!]
        ]	
        [
            print "System here"
            print sql-query	
        ]

        _foo: func [return: [integer!]]
        [
            return 123
        ]
]

	query: routine [
        /local
        sql-query [c-string!]
	][

		sql-query: {INSERT INTO "humans" ( "id", "age", "name") VALUES (15, 20, 'Mike');}
		_query sql-query
	]
    
    foo: routine [
        /local
        x [integer!]
    ]
    [
        x: _foo
        print x
    ]


view [button "Insert" [query] button "Select" [foo]]
```

and with context:

```
#system [	
    data: declare int-ptr!
    sqlite: context
    [
        _query: func [
            sql-query [c-string!]
        ]	
        [
            print "System here"
            print sql-query	
        ]

        _foo: func [return: [integer!]]
        [
            return 123
        ]
    ]
]

	query: routine [
        /local
        sql-query [c-string!]
	][

		sql-query: {INSERT INTO "humans" ( "id", "age", "name") VALUES (15, 20, 'Mike');}
		sqlite/_query sql-query
	]
    
    foo: routine [
        /local
        x [integer!]
    ]
    [
        x: sqlite/_foo
        print x
    ]


view [button "Insert" [query] button "Select" [foo]]
```

What I should to prefer? When I should use context?

hiiamboris

[10:39](#msg5ee0b8685782a31278ee97af)when you can't remember anymore what function relates to what task

bubnenkoff

[10:40](#msg5ee0b883ef5c1c28f01479a5)Thanks!

[11:06](#msg5ee0beacef5c1c28f0149290)&gt; as @rebolek told you, don't use the same name

But if I place them is it ok? It should be ok, I asked because Red is own specific)

hiiamboris

[11:08](#msg5ee0bf3f7c64f31f1150da85)if it works, it's good enough ;)

bubnenkoff

[13:20](#msg5ee0de105782a31278ef2787)is it possible to create struct at runtime? I do not know the number of fields and their type that will be returned

[14:24](#msg5ee0ed2f30401c1f244a8b8e)What is this string do: `blk: as red-block! _set-word-value` ? it's create new data type named `red-block!` ?

hiiamboris

[14:31](#msg5ee0eed42cf2f36eae4f7748)red-block is defined by Red runtime

meijeru

[15:20](#msg5ee0fa21ee693d6eb3b78f27)So `red-block!` is an expression in Red/System, not in Red.

[15:21](#msg5ee0fa72ee693d6eb3b78ff1)It is an `alias` for a `structure`; what these terms mean, you can find in \[this document](static.red-lang.org/red-system-specs-light.html).

## Saturday 13th June, 2020

ldci

[15:37](#msg5ee4f2b5ee693d6eb3c12db2)redCV: real-time face recognition is now possible with camera and video.

toomasv

[15:56](#msg5ee4f74829d8bc28f9f44db2)Red-goggles soon! :+1:

greggirwin

[17:35](#msg5ee50e477b6da9126a924f72)Wow. Nice @ldci. :+1:

ldci

[18:55](#msg5ee5211729d8bc28f9f4a6d2)@greggirwin only 80 ms for face identification with Red camera. Not so bad :)

greggirwin

[18:59](#msg5ee5220449260560aa5bcf08)I've been playing with Anthropics software recently, which uses tensorflow. I can imagine building a scriptable, semantic image editor/paint program, where we have an internal convolving kernel for the core effects pipeline, but then easy access to redCV for heavy lifting.

## Sunday 14th June, 2020

ldci

[09:24](#msg5ee5ecd8013105125a3444cd)@greggirwin Thanks for the suggestion. Tensorflow is impressive.

pekr

[09:30](#msg5ee5ee45ef5c1c28f0210920)@greggirwin We have used Portrait Pro from Anthropics, but never learned it is scriptable?

bubnenkoff

[14:51](#msg5ee6398e49260560aa5e0423)If I am return `struct!` from R/S what type I should reclare in Red? afaik Red do not have `struct!` only R/S

hiiamboris

[15:11](#msg5ee63e1f7b6da9126a94b84a)You're right, there is not struct in Red so far.

[15:12](#msg5ee63e591e099b0388c6f660)So you either convert it to a block or to an object.

pekr

[15:37](#msg5ee6444fee693d6eb3c3f5a3)Struct support in Red was planned for 0.6.5 IIRC, but the plans might have changed.

bubnenkoff

[16:38](#msg5ee65277035dfa12611e0db6)

```
#system [	
        data: declare struct! [
            a   [integer!]
            b   [c-string!]
        ]      

        _foo: func [return: [data]]
        [
       
            return data
        ]
]
```

`Compilation Error: invalid definition for function exec/_foo: [return: [data]]`

hiiamboris

[16:48](#msg5ee654d924a3382d5d67f27e)`declare` is not a type definition, it's an allocation

bubnenkoff

[16:49](#msg5ee6552b5782a31278fc188b)And what will be definition? `alias`?

hiiamboris

[16:50](#msg5ee6554849260560aa5e4b02)Yep

## Monday 15th June, 2020

ldci

[07:31](#msg5ee723e27b6da9126a96a3e2)@bubnenkoff From structure to Object example/  
`featureRect!: alias struct! [ x [integer!] ;--x coordinate y [integer!] ;--y coordinate width [integer!] ;--width height [integer!] ;--height weight [float!] ;--threshold ] featureRect: make object! [ x: 0 ;--x coordinate y: 0 ;--y coordinate width: 0 ;--width height: 0 ;--height weight: 0.0 ;--threshold ]`

[07:35](#msg5ee724d97a7f8d2d6336f5f8)Formatted code. Sorry

[07:36](#msg5ee724e61e099b0388c8dabc)

```
featureRect!: alias struct! [
	x			[integer!]	;--x coordinate
	y 			[integer!]	;--y coordinate
	width 		[integer!]	;--width
	height 		[integer!]	;--height
	weight 		[float!]	;--threshold
]

featureRect: make object! [
	x: 0					;--x coordinate
	y: 0					;--y coordinate
	width: 0 				;--width
	height: 0				;--height
	weight: 0.0				;--threshold
]
```

bubnenkoff

[10:31](#msg5ee74e095dcbb760b6ee8f50)thanks for example! is there any way to put in structure variadic number of elements?  
I do not know how many columns will be returned from DB, so I need to create struct dynamically

[14:17](#msg5ee782dc2cf2f36eae5ee618)

```
#system [	
        data!: alias struct! [
            a   [integer!]
            b   [c-string!]
        ]      

        _foo: func [return: [data!]]
        [
            data!/a: 123
            ; return data
        ]
]
```

`Compilation Error: unknown path root variable: exec/data!`

hiiamboris

[14:20](#msg5ee783917c64f31f116103d8)You're trying to modify a type.

[14:20](#msg5ee7839849260560aa60ee41)Good luck

meijeru

[14:45](#msg5ee789707b6da9126a97abaf)@bubnenkoff The line `data!/a: 123` is wrong because `data!` is the name of a \_type_ rather than a \_variable\_. Correct would be `some-var: declare data!` followed by `some-var/a: 123` and `return some-var`.

bubnenkoff

[14:53](#msg5ee78b7fee693d6eb3c6e442)@meijeru thanks, but what type I should specify here: `_foo: func [return: .... ]`?

hiiamboris

[15:00](#msg5ee78d155dcbb760b6ef353f)Here: `data!/a: 123`

[15:01](#msg5ee78d3d1e099b0388c9e49c)Does the same work for `integer!/a:` for you?

bubnenkoff

[15:02](#msg5ee78d91ef5c1c28f024b57f)One moment. I am trying to understand.  
datatypes by standard (agreement) ends with `!`  
the data is just a word, right?

[15:06](#msg5ee78e5e49260560aa610d21)So I should to create type (`some-word!`) and variable with type of `some-word!`?

ldci

[15:07](#msg5ee78eac2cf2f36eae5f0766)From Red/System documentation: An alias is not a value, it doesn't take any space in memory, it can be seen as a virtual datatype. So, by convention, alias names should end with an exclamation mark, in order to distinguish them more easily from variables in the source code.

bubnenkoff

[15:08](#msg5ee78ed330401c1f245a5368)Yes, I had read it

ldci

[15:08](#msg5ee78ef724a3382d5d6ac66c)For dynamically structures, I'm generally using a pointer.

bubnenkoff

[15:09](#msg5ee78f28035dfa126120e335)what do you mean by dynamically?

ldci

[15:13](#msg5ee78ffe24a3382d5d6acaec)When I don't know the exact number of returned values.

bubnenkoff

[15:13](#msg5ee79012ee693d6eb3c6f47d)Could you give an example please

ldci

[15:13](#msg5ee790245dcbb760b6ef4021)Yes I'm looking for :)

bubnenkoff

[15:14](#msg5ee7903eee693d6eb3c6f5b7)and please show the code how you are extract values from it

ldci

[15:16](#msg5ee790b95dcbb760b6ef4178)Example from my binding to OpenCV:

```
cvGetDims: "cvGetDims" [
        "Retrieves number of an array dimensions and optionally sizes of the dimensions"
            arr			[CvArr!]
            sizes		[int-ptr!] ;CV_DEFAULT(NULL)  int [CV_MAX_DIM]
            return:		[integer!]   
        ]
```

bubnenkoff

[15:16](#msg5ee790e31e099b0388c9ef1e)this works!

```
data!: alias struct! [
            a   [integer!]
            b   [c-string!]
        ] 

        data: declare data!

        _foo: func [return: [data!]]
        [
            data/a: 123
            return data
        ]
```

@ldci thanks! I am reading

ldci

[15:24](#msg5ee792c75dcbb760b6ef46d5)@bubnenkoff You're welcome

bubnenkoff

[15:25](#msg5ee792ea013105125a380133)But could you show part that extract values from this pointer?

ldci

[15:29](#msg5ee793d97a7f8d2d63381555)Yes an example

```
faces: cvHaarDetectObjects pyrImg cascade storage sFactor minNB flag minS/x minS/y maxS/x maxS/y
	nFaces: faces/total ; for faceCount routine
	if faces/total > 0 [
		c: 0
		until [
			faceRect: cvGetSeqElem faces c ; faceRect is a byte-ptr!
			ptr: as int-ptr! faceRect ; we cast to an int-ptr! since we have 4 integers to get here
			; * 2 due to original image pyrdown
			x: ptr/1 * 2 
			y: ptr/2 * 2 
			wd: (ptr/1 + ptr/3) * 2 
			hg:  (ptr/2 + ptr/4) * 2
			roi: cvRect x y wd hg
			cvRectangle img roi/x roi/y roi/width roi/height 0.0 255.0 0.0 0.0 2 CV_AA 0
			c: c + 1
			c = faces/total
		]
	]
```

face is a structure with the number of identified faces and a byte-ptr to a memory address of each identified faces. Since there are integer! values, we just need to cast to an int-ptr! to get the correct values.

[15:34](#msg5ee7951a7b6da9126a97cfac)@bubnenkoff to complete the sample.

[15:36](#msg5ee7957930401c1f245a650c)cvHaarDetectObjects returns a cvSeq! structure:

```
CvSeq!: alias struct! [
        flags                   [integer!]    ;micsellaneous flags    
        header_size             [integer!]    ;size of sequence header 
        h_prev                  [int-ptr!]    ;struct previous sequence     
        h_next                  [int-ptr!]    ;struct next sequence
        v_prev                  [int-ptr!]    ;struct 2nd previous sequence 
        v_next                  [int-ptr!]    ;struct 2nd next sequence
        total                   [integer!]    ;total number of elements
        elem_size               [integer!]    ;size of sequence element in bytes 
        block_max               [byte-ptr!]   ;maximal bound of the last block
        ptr                     [byte-ptr!]   ;current write pointer
        delta_elems             [integer!]    ;how many elements allocated when the seq grows
        storage                 [int-ptr!]    ;where the seq is stored
        free_blocks             [int-ptr!]    ;free blocks list 
        _first                  [int-ptr!]    ;pointer to the first sequence block 
]
```

bubnenkoff

[15:43](#msg5ee7972a035dfa126120fd94)&gt;

```
> featureRect!: alias struct! [
> 	x			[integer!]	;--x coordinate
> 	y 			[integer!]	;--y coordinate
> 	width 		[integer!]	;--width
> 	height 		[integer!]	;--height
> 	weight 		[float!]	;--threshold
> ]
> 
> featureRect: make object! [
> 	x: 0					;--x coordinate
> 	y: 0					;--y coordinate
> 	width: 0 				;--width
> 	height: 0				;--height
> 	weight: 0.0				;--threshold
> ]
>
```

&gt;

```
Red []

#system [	
        data!: alias struct! [
            a   [integer!]
            b   [c-string!]
        ] 

        data: declare data!

        _foo: func [return: [data!]]
        [
            data/a: 123
            data/b: "Hello"
            return data
        ]

    
]

sqlite: context [
    
    o: make object! [a: 0 b: none] ; same struct with data!

    foo: routine [
        /local
        x [...] ; what should be here?
    ]
    [
        x: _foo
        print x
    ]
]

view [ button "Select" [sqlite/foo]]
```

ldci

[15:44](#msg5ee797585dcbb760b6ef52e4)@bubnenkoff Have a look here: https://github.com/ldci/OpenCV3-red

[15:48](#msg5ee79857035dfa12612100cb)@bubnenkoff If you use structures it's easy to get values with red Routines. But if you mix structures and objects it's more complicated.

bubnenkoff

[15:49](#msg5ee7988aef5c1c28f024d794)The attempt to mix only because I have not enough knowlages

ldci

[15:52](#msg5ee799267c64f31f1161416e)Basically if you want to access any C lib or dll, you have to use Red/System structures and functions for fast and complete access.

## Tuesday 16th June, 2020

bubnenkoff

[09:28](#msg5ee890c4013105125a3a792b)I still need help with code example above. I do not understand what (how?) I should accept data from R/S

[09:39](#msg5ee8934024a3382d5d6d4767)This work:

```
foo: routine [
        /local
        x [data!]
    ]
    [
        x: _foo
        print x/a
    ]
```

But how? The types declared in R/S available from Red?!

meijeru

[12:11](#msg5ee8b6fb29d8bc28f9fcfbde)There is no Red code in this routine! The body of a routine consists of Red/System code.

[12:12](#msg5ee8b713a85de303941873a4)`print` is not only a Red function, but also a Red/System one.

bubnenkoff

[12:40](#msg5ee8bdb824a3382d5d6db1ea)But type declared in system section:

```
Red []

#system [	
    data!: alias struct! [
        a   [integer!]
        b   [c-string!]
    ] 

    data: declare data!

    _foo: func [return: [data!]]
    [
        data/a: 123
        data/b: "Hello World"
        return data
    ]

    
]

sqlite: context
 [
    foo: routine [
        /local
        x [data!] ; this data type is declared in R/S
    ]
    [
        x: _foo
        print x/b
    ]
 ]

view [button "Insert" [sqlite/query] button "Select" [sqlite/foo]]
```

meijeru

[13:00](#msg5ee8c262ef5c1c28f027b0b8)It is as I said: routines and system sections contain Red/System code. So they have access to each other. Only `foo`is defined in Red, so `sqlite/foo` is an expression in Red code. The rest is all Red/System.

[13:05](#msg5ee8c3b5a85de30394189553)See also \[this explanation](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#routine-type)

bubnenkoff

[13:39](#msg5ee8cb9029d8bc28f9fd2f1f)ok! I understood it's intermediate layer. But how to pass value from routine body to Red?  
for example I have:

```
sqlite: context
 [
	myblock: []
    foo: routine [
```

How to pass `x/b` to it from `foo`?

hiiamboris

[13:58](#msg5ee8cfea7b6da9126a9af1ed)routines can return values (surprise!☻)

bubnenkoff

[14:00](#msg5ee8d07230401c1f245d8fd4)But `myblock` is not available inside routine?

hiiamboris

[14:09](#msg5ee8d2962cf2f36eae623ae1)That's why you can also pass arguments to routine.

bubnenkoff

[14:11](#msg5ee8d3185782a31278020a9a)you are suggesting to pass myblock there as args, fill it inside and then return?

hiiamboris

[14:12](#msg5ee8d34f24a3382d5d6df045)Yep.

bubnenkoff

[14:23](#msg5ee8d5c729d8bc28f9fd4abf)

```
Red []

#system [	
    data!: alias struct! [
        a   [integer!]
        b   [c-string!]
    ] 

    data: declare data!

    _foo: func [return: [data!]]
    [
        data/a: 123
        data/b: "Hello World"
        return data
    ]

]

sqlite: context
 [
    my-red-block: ["some text"] ; some predefined text

    foo: routine [
        blk
        /local
        x [data!]
    ]
    [
        x: _foo
        print x/b
        print blk ; attempt to print value that already in passed block
    ]

    bar: func [] 
    [
        foo my-red-block
    ]
 ]

view [button "Select" [sqlite/bar]]
```

something like this?  
btw I am getting printing: `Hello World0297D6D4`

hiiamboris

[14:31](#msg5ee8d7ba30401c1f245da8af)Good!

[14:32](#msg5ee8d7e91e099b0388cd270e)You can use `probe` in R/S code instead of `print` to automatically add a new-line

bubnenkoff

[14:32](#msg5ee8d7ea2cf2f36eae624760)But I expect at last some text instead of digits (it's memory address?)

hiiamboris

[14:32](#msg5ee8d7f1a85de3039418cb10)It is.

[14:33](#msg5ee8d81c49260560aa644722)Now you can manage this block with functions from here: https://github.com/red/red/blob/master/runtime/datatypes/block.reds

[14:33](#msg5ee8d8555782a312780217a5)E.g. `probe block/rs-length? blk`

bubnenkoff

[14:36](#msg5ee8d8da2cf2f36eae6249eb)`probe block/rs-length? blk`  
`Compilation Error: argument type mismatch on calling: red/block/rs-length?`

hiiamboris

[14:37](#msg5ee8d932035dfa12612419e0)Perhaps you must define the type of `blk`

[14:38](#msg5ee8d96a7b6da9126a9b151d)It probably defaults to `red-value!` (not sure), while the func expects `red-block!`

bubnenkoff

[14:38](#msg5ee8d9747b6da9126a9b1534)`probe block/rs-length? as red-block! blk` like this?

hiiamboris

[14:39](#msg5ee8d9862cf2f36eae624ba1)Yeah, like this, or in the routine spec.

bubnenkoff

[14:40](#msg5ee8d9caef5c1c28f027f5ac)Oh! it's compiled! I really even can't imagine that it should be do this way.

[14:40](#msg5ee8d9d31e099b0388cd2c38)it's like some magic

[14:41](#msg5ee8da1c29d8bc28f9fd572e)Am i right understand that inside system routine we are now calling Red context?

hiiamboris

[14:41](#msg5ee8da1c29d8bc28f9fd5730):D

[14:41](#msg5ee8da377b6da9126a9b173a)We're calling the runtime that works behind all Red.

[14:42](#msg5ee8da44a85de3039418d2cf)And yes, low level programming is always like magic.

bubnenkoff

[14:43](#msg5ee8da80ee693d6eb3ca2f7f)What asterisk is meaning here? https://github.com/red/red/blob/master/runtime/datatypes/block.reds#L281

hiiamboris

[14:46](#msg5ee8db2e5dcbb760b6f26cfe)Usually names of Red actions end in asterisk in R/S. This `block/append*` is what gets called by `append` from Red.

bubnenkoff

[14:48](#msg5ee8dbb0035dfa12612420bf)thanks! But I still can't understand how to print value. Does `print` have two context R/S and Red?  
I tried mold: but get error:  
`probe block/mold as red-block! blk`  
`Compilation Error: undefined symbol: red/block/mold`

hiiamboris

[14:49](#msg5ee8dbdfa85de3039418d691)&gt; Does print have two context R/S and Red?

Yes, like @meijeru \[said before](https://gitter.im/red/red/system?at=5ee8b6fb29d8bc28f9fcfbde)

[14:51](#msg5ee8dc6024a3382d5d6e07dd)`mold` is actually \[defined for block](https://github.com/red/red/blob/7509ffd29769d1254dc8a9787d3972b5e4b34e85/runtime/datatypes/block.reds#L707) but either you're doing something wrong or it's just not exported by libRedRT and you need to compile it with `-c -u` or `-r`...

[14:53](#msg5ee8dceb7b6da9126a9b1ea1)I think there's a `#call` macro that can be used to call Red's `mold` from R/S, but I don't remember how it's used.

[14:58](#msg5ee8ddfe5782a31278022669)`"some value"` is `c-string!`, not `red-value!`

bubnenkoff

[14:58](#msg5ee8de0b2cf2f36eae625740)sorry! I mentioned it and delete post before you comment

hiiamboris

[14:58](#msg5ee8de18ef5c1c28f02801b6):+1:

bubnenkoff

[15:00](#msg5ee8de8149260560aa645ba0)

```
Red []

#system [	
    data!: alias struct! [
        a   [integer!]
        b   [c-string!]
    ] 

    data: declare data!

    _foo: func [return: [data!]]
    [
        data/a: 123
        data/b: "Hello World"
        return data
    ]
]

sqlite: context
 [
        my-red-block: ["some text"] ; 

    foo: routine [
        blk
        /local
        x [data!]
    ]
    [
        x: _foo
        print x/b
        probe block/rs-append as red-block! blk as red-value! "new text"

    ]

    bar: func [] 
    [
        foo my-red-block
        print my-red-block
    ]
 ]

view [button "Select" [sqlite/bar]]
```

```
Hello World02D747D8

*** Runtime Error 1: access violation
```

Something is wrong again

hiiamboris

[15:00](#msg5ee8dea430401c1f245dbca0)That's not how you create a `red-value!` from a `c-string!`

[15:01](#msg5ee8ded65782a312780228a6)Use the tools that `string.reds` provides you

[15:02](#msg5ee8df0749260560aa645d9f)And also `unicode.reds` probably...

bubnenkoff

[15:04](#msg5ee8df6e7a7f8d2d633b6bb6)would you mind explaining that?

hiiamboris

[15:04](#msg5ee8df8449260560aa645f10)https://github.com/red/red/blob/master/runtime/datatypes/string.reds

[15:05](#msg5ee8dfc0ef5c1c28f02807c9)https://github.com/red/red/blob/7509ffd29769d1254dc8a9787d3972b5e4b34e85/runtime/datatypes/string.reds#L196

bubnenkoff

[15:05](#msg5ee8dfc21e099b0388cd3b6f)What is the reason of the problem?

hiiamboris

[15:06](#msg5ee8dfefef5c1c28f02808b3)`"new text"` is a pointer to bytes `[n e w _ t e x t]`. You just told it that it points to a `red-value!` while it doesn't really. So it crashed.

bubnenkoff

[15:07](#msg5ee8e0195dcbb760b6f278a5)`probe block/rs-append as red-block! blk string/rs-load as red-value! "new text"`  
`undefined symbol: red/string/rs-load`

hiiamboris

[15:07](#msg5ee8e03aee693d6eb3ca3e50)Try `-r`?

bubnenkoff

[15:07](#msg5ee8e03ea85de3039418e484)%)

[15:08](#msg5ee8e05a30401c1f245dc2cd)one second

[15:08](#msg5ee8e07c7c64f31f11646728)`red/string/rs-load is missing an argument`

[15:09](#msg5ee8e09bee693d6eb3ca3f8a)`probe block/rs-append as red-block! blk as red-value! string/rs-load "new text"`  
one moment I will try this

hiiamboris

[15:09](#msg5ee8e0b049260560aa6461bb)it expects 3 arguments

bubnenkoff

[15:10](#msg5ee8e0e124a3382d5d6e134f)`probe block/rs-append as red-block! blk string/rs-load as red-value! "new text" size? "new text"` ?

hiiamboris

[15:11](#msg5ee8e12c49260560aa6462f6)And the encoding apparently

[15:11](#msg5ee8e13330401c1f245dc573)Gotta go. Good luck there

bubnenkoff

[15:12](#msg5ee8e1497a7f8d2d633b716b)thanks!!!

[15:21](#msg5ee8e387013105125a3b59a8)`unicode/load-utf8` is seems to be more suitable for my case. But I am still getting error:

`probe block/rs-append as red-block! blk as red-value! unicode/load-utf8 "new text" size? "new text"`

```
Hello World02E64958
some text 0.0
Hello World02E649F0

*** Runtime Error 1: access violation
*** at: 630EB4DFh
```

hiiamboris

[16:04](#msg5ee8ed8a013105125a3b788e)remove `probe` maybe

[16:05](#msg5ee8edb5013105125a3b7986)anyway, use `-d` flag to see tha stack trace

greggirwin

[18:49](#msg5ee9142e5dcbb760b6f30c22)@bubnenkoff as you work through things, please make notes. We have https://github.com/red/red/wiki/%5BNOTES%5D-Red-System-Notes, but I suggest starting a new wiki page as your journal, which you can refer to later, linking to important comments here, and then summarize your learning to help others.

bubnenkoff

[19:12](#msg5ee91988ee693d6eb3cae15f)Thanks for advices! But maybe it's better to ask on SO? Because it's much easier to googling?

greggirwin

[19:29](#msg5ee91d911e099b0388cde654)SO is for very specific Question &lt;- Answer though, isn't it?

bubnenkoff

[19:35](#msg5ee91efc013105125a3c0282)yes, but I asked a lot of questions here, that may be helpful from a lot of other newcomers

greggirwin

[19:37](#msg5ee91f767c64f31f1165181c)You could use the wiki to list your questions, so they are clear and specific. e.g. How do I call a Red/System routine from Red? How do I create a struct that handles a variable number of items? et.c

[19:38](#msg5ee91fc149260560aa6517ca)How do I get a data item from a pointer? How do I print output in Red/System?

## Wednesday 17th June, 2020

bubnenkoff

[09:17](#msg5ee9dfaa0c34bc5cccb0a929)I have new question. What `node` mean here?  
https://github.com/red/red/blob/master/runtime/datatypes/context.reds#L36

hiiamboris

[09:21](#msg5ee9e0966ec4a26deaad684f)Node is an indirect pointer to series buffer. Red memory manager may relocate the buffer, and all previous references to it will become invalid. But the node stays in place, and can be used to obtain a new address after the relocation.

bubnenkoff

[09:23](#msg5ee9e105539e566fc93e2326)if I right understand `symbol/make "my-red-block"` is return symbol ID right?

hiiamboris

[09:24](#msg5ee9e1453ca1e1625e852e99)Yeah.

bubnenkoff

[09:25](#msg5ee9e19669879026ce0d21cc)With great help by @9214 I got yesterday code work with block placed in global context. But I can't understand how to get `block` placed in some another context?  
`blk: as red-block! _context/get-any symbol/make "my-red-block"`  
I do not understand what should be here instead of

hiiamboris

[09:30](#msg5ee9e2c90c34bc5cccb0b14d)https://github.com/red/red/blob/master/runtime/datatypes/structures.reds#L188

[09:31](#msg5ee9e2e67c62240ad2b90a13)If you have a `red-object!` in your function, just use `/ctx` field of it

bubnenkoff

[09:52](#msg5ee9e7dcd7c1da0adc940cde)@hiiamboris I am doing something wrong. I tried several approaches:

```
Red []

sqlite: context [
    my-red-block: ["some text"] ; some already existen data in block
]
foo: routine [
    blk 
    /local
    str [c-string!]
]
[
    str: "Hello"
    blk: as red-block! _context/get-any blk/ctx symbol/make "my-red-block" ;  also do not work
    string/load-in str length? str blk UTF-8
]

foo my-red-block

print my-red-block
```

hiiamboris

[09:53](#msg5ee9e811d7c1da0adc940d56)Yes. Meditate on the last link I gave you ;)

[09:53](#msg5ee9e81c0c34bc5cccb0bed5)What you're doing is totally random

[09:59](#msg5ee9e974d7c1da0adc9411d7)Even better, take a step back and ask yourself - why you even need a context?

bubnenkoff

[10:04](#msg5ee9eac85833b0624bd4f15d)I want to learn how to use it right now. Maybe it's not needed, but I have not enough experience. Should I pass all context to `foo` or I can pass there only `block` and it will be still bind to it's context?

[10:13](#msg5ee9ecb53316c66e00d409b5)Here is block have context: `foo sqlite/my-red-block`  
So after passing it to `foo` this block will have name `blk` but it's context still will be `sqlite`?

hiiamboris

[10:13](#msg5ee9ecd63ca1e1625e854b76)Block doesn't have context.

bubnenkoff

[10:14](#msg5ee9ed11b9b43009958574ce)Why?!

hiiamboris

[10:15](#msg5ee9ed26539e566fc93e429b)Why would it? Only words have context.

bubnenkoff

[10:18](#msg5ee9edf190cd6426c8113646)Sorry, I mean here "word that point to block" is placed in context.

hiiamboris

[10:23](#msg5ee9ef24a28e7a6fb281e140)Do you need the word for your task? Or just the block?

bubnenkoff

[10:26](#msg5ee9efbc2f05280988c975f7)if work is point to block I can fill the block and than print the word. My question is raised from https://stackoverflow.com/questions/62410275/how-to-pass-value-from-red-system-to-red

I just need to understand how to pass block (word that point to block) placed in context

hiiamboris

[10:43](#msg5ee9f3b47ad97a062caa31e0)So what you want is pass a word, not a block.

bubnenkoff

[10:46](#msg5ee9f49f7e7f055cb4c918e6)m... yes

[10:48](#msg5ee9f4e55833b0624bd514f9)but block is linked with word, so I do not see any difference

[10:49](#msg5ee9f54b7c62240ad2b93cf0)or passing block unlink work from block?

hiiamboris

[10:51](#msg5ee9f59f0c34bc5cccb0dfee)&gt; but block is linked with word, so I do not see any difference

but it's not linked

[10:51](#msg5ee9f5ae90cd6426c81150eb)word points to it, but block doesn't know anything about that

bubnenkoff

[10:52](#msg5ee9f5dd69879026ce0d5a77)ok, I understood

[10:55](#msg5ee9f68d3ca1e1625e8565aa)So here I am passing word or block `foo sqlite/my-red-block` ?

hiiamboris

[11:01](#msg5ee9f8036ec4a26deaada8d9)The block.

bubnenkoff

[11:03](#msg5ee9f89a7ad97a062caa3e61)So passing word should look like: `'sqlite/my-red-block` but I have never seen such code

[11:08](#msg5ee9f9ca3316c66e00d42d6c)Am I thinking in right way?

```
Red []

sqlite: context [
    my-red-block: ["some text"] ; some already existen data in block
]
foo: routine [
    blk 
    /local
    str [c-string!]
]
[
    str: "Hello"
    blk: as red-block! _context/get-any blk/ctx symbol/make "my-red-block" ; still do not work
    string/load-in str length? str blk UTF-8
]

foo 'sqlite/my-red-block

print my-red-block
```

hiiamboris

[11:13](#msg5ee9fac20c34bc5cccb0ed94)`'sqlite/my-red-block` is not a word though, it's a path

bubnenkoff

[11:37](#msg5eea0070539e566fc93e7b82)please prompts me how to pass word instead of block

hiiamboris

[11:48](#msg5eea032a7e7f055cb4c940bb)using `in` or `bind`

bubnenkoff

[11:55](#msg5eea04c7539e566fc93e8727)Oh... I event can't find docs https://doc.red-lang.org/en/ where it's described?

hiiamboris

[11:56](#msg5eea04fe5833b0624bd54118)Tried `? in`?

bubnenkoff

[11:59](#msg5eea05aca28e7a6fb2821ec7)so now it's correct: `foo in mycontext/list ; passing word to foo` ?

hiiamboris

[12:00](#msg5eea05f3a28e7a6fb2821fb7)Don't be afraid to play &amp; experiment.

bubnenkoff

[12:23](#msg5eea0b42d7c1da0adc947142)this should be correct: `foo in mycontext 'list`

hiiamboris

[12:45](#msg5eea106190cd6426c811a0e4)Yes.

bubnenkoff

[13:10](#msg5eea1655384f9b064c1183dc)when we are passing block to routine it save previous binding with context?  
I mean we are working with it in routine using another word. So it's two words is point to same block?

hiiamboris

[14:07](#msg5eea2399b9b4300995860f4f)Yes, words are copied, like other scalars.

bubnenkoff

[14:13](#msg5eea250d7c62240ad2b9c7da)is there any way to pass it as ref?

hiiamboris

[14:29](#msg5eea28bb0c34bc5cccb1711f)Why?

bubnenkoff

[15:01](#msg5eea305c7ad97a062caadf97)to pass it to function that will modify it

hiiamboris

[15:02](#msg5eea30972f05280988ca3534)modify the word?

bubnenkoff

[15:17](#msg5eea33ed6ec4a26deaae5c1e)block that linked to

[15:18](#msg5eea3447384f9b064c11d9a8)

```
query: routine [
		/local
		row-as-block [red-block!] ; it's initialized, or I am wrong?
	][

		string/load-in "foo" length? "foo" row-as-block UTF-8

		probe row-as-block
	]
```

Why I am getting error on follow code: `Compilation Error: local variable row-as-block used before being initialized!` ?

hiiamboris

[15:55](#msg5eea3d0b7c62240ad2ba0a45)It's declared, not initialized.

[15:56](#msg5eea3d16d7c1da0adc950346)You initialize thing by giving it a value.

[15:56](#msg5eea3d2c384f9b064c11f02f)Otherwise it will contain random trash from the stack.

[15:57](#msg5eea3d677e7f055cb4c9ed9d)R/S doesn't know that `load-in` takes `row-as-block` as \*output* argument. It thinks you're passing it's value.

[15:57](#msg5eea3d7ed7c1da0adc950463)So to work around this error just assign anything to `row-as-block` first.

[15:58](#msg5eea3db65833b0624bd5d837)E.g. `row-as-block: declare red-block!` or something

## Thursday 18th June, 2020

bubnenkoff

[11:38](#msg5eeb523c6c06cd1bf43d721d)is it possible to return from function two values?

Oldes

[12:46](#msg5eeb621b613d3b3394f3f484)Yes.. as a block.. or pair if these are integers.

bubnenkoff

[15:12](#msg5eeb844fc4bdd83475f0003f)How to get number elements in structure?

## Friday 19th June, 2020

ldci

[04:33](#msg5eec40163a0d3931fa9f1940)@bubnenkoff : "Implementation note: Struct! values members are padded in memory in order to preserve optimal alignment for each target (for example, it is aligned to 4 bytes for IA32 target). Size? function will return the size of the struct! value in memory including the padding bytes."  
So, dividing by 4 gives you the number of elements in the structure.

bubnenkoff

[09:33](#msg5eec86873a0d3931fa9fb8fe)&gt; Yes.. as a block.. or pair if these are integers.

How should look return block if I need return this two values?

```
return [all-row-data number-of-fields]
```

```
return: [all-row-data! integer!]
```

?

hiiamboris

[09:43](#msg5eec88bf613d3b3394f6acae)R/S doesn't support polymorphic arguments. No low level language does.

meijeru

[10:36](#msg5eec9521e6668d35db0b16b1)The type of your return value is `block!` so the spec is `return: [block!]`. This corresponds, in Red/System, to a `struct!` value of type (alias) `red-block!`. Please be aware that block components may be of any type. Also, to construct the return value you need to call the right Red/System functions.

## Friday 10th July, 2020

theSherwood

[21:07](#msg5f08d8a36e1b8050c3e7d456)I don't know much of anything about low-level programming; so pardon the naive question. What makes R/S able to interact with stuff written in C?

hiiamboris

[21:12](#msg5f08d9abbd3edf666fc17469)Everything can interface with C ;)  
OS loads libs for you. You only need to ensure you put stuff on the stack in the format C expects.

theSherwood

[21:15](#msg5f08da5dbd3edf666fc17627)The format C expects? The R/S c-string for example?

hiiamboris

[21:17](#msg5f08dacd3c217837fd8ec8b0)Yes. But I mostly mean how values like integer are pushed to the stack (in which order).

[21:17](#msg5f08dafc46c75b1e5e391ad6)`c-string` is just a sequence of non-zero bytes that ends with a zero byte. That's all there is to it.

theSherwood

[21:19](#msg5f08db783c217837fd8ecb00)Okay. I'm trying to wrap my head around this. So that means that R/S would not be able to interop with Rust because while R/S and C model strings and integers in the same way, Rust may not?

hiiamboris

[21:20](#msg5f08dbadbd3edf666fc17894)It depends, if the library written in Rust is meant to interface with C (and as such compatible with R/S).

[21:21](#msg5f08dbe164ef9d04b2a65be0)Of note, R/S is able to interface with Java (Android) and Objective-C (Mac), but I haven't digged into the magic.

[21:24](#msg5f08dc8edbf01050ab689df0)If Rust has it's own string format, just make a converter to that format ;)

theSherwood

[21:25](#msg5f08dcdd46c75b1e5e392067)Oooh. Bizarre. I'm learning a lot right now.

[21:27](#msg5f08dd4ddbf01050ab689fe4)So you could use the Rust library but any time you used that library to do something with a string, you would convert it to the format Rust expects, and if the library returns some data to your R/S code you need to convert it back into R/S compatible format. Is that right?

hiiamboris

[21:30](#msg5f08ddde86ccb45b599a9c65)Yes.

[21:30](#msg5f08de0a3c217837fd8ed0c9)More trouble you should expect from language's memory manager.

theSherwood

[21:31](#msg5f08de286e1b8050c3e7e3b1)Oh?

[21:31](#msg5f08de49a5ab931e4f7b3bba)Would the R/S memory allocator and the Rust memory allocator interfere with each other?

hiiamboris

[21:32](#msg5f08de66bd3edf666fc181de)R/S is dumb in this regard, just as C: they do nothing unless told (to allocate or free).

[21:32](#msg5f08de78dbf01050ab68a35d)But Rust may be smarter and you'll have to find a way to play nice with it.

[21:33](#msg5f08de908342f46274097b21)It should be explained in a C interface guide though, for Rust ;)

theSherwood

[21:33](#msg5f08debbc7d15f7d0f851595)That is good to know.

[21:35](#msg5f08df0746c75b1e5e3925ea)So that is essentially a solved problem insofar as c interfacing with Rust is a solved problem.

hiiamboris

[21:38](#msg5f08dfd93c217837fd8ed604)Yes. Though I hate how this binary interface came from the stone ages and still causes so many bugs in programs.

theSherwood

[21:39](#msg5f08e0183c217837fd8ed71f)Oh? The binary interface of C in particular?

hiiamboris

[21:50](#msg5f08e2a0a5ab931e4f7b4791)It's not just C. It's a mess rooted deeply into history. Can't say where it began, really.. :/

[21:50](#msg5f08e2c33c217837fd8ede1a)C is old but not as old as Fortran or even Pascal.

[21:51](#msg5f08e2e47a4e99049e01cdbf)And there must have been binary interfaces even predating these two.

theSherwood

[21:51](#msg5f08e2e5c7d15f7d0f852095)Interesting. What alternative is there to the current binary interface?

hiiamboris

[21:52](#msg5f08e3293e4a827d19b9f3cb)I didn't google if there is an alternative ;) There must be, as the problem is clear to everyone.

theSherwood

[21:53](#msg5f08e360bd3edf666fc18f9e)Haha. Not me. What is the problem?

hiiamboris

[21:56](#msg5f08e3fb8b72655b55648163)Well, @bubnenkoff has the talent of illustrating it. He loads a function but makes a mistake in it's definition - it crashes. He fixes it by long trial and error cycle. Then passes a value to it - it returns an error code. He has to write a lot of extra code just to find out what the hell the error was. And so on...

[21:58](#msg5f08e473c7d15f7d0f8524d7)I mean, come on. We're in 21th century and yet interrogating our programs by more low level code.

theSherwood

[21:59](#msg5f08e4b446c75b1e5e393552)Gotcha. So the problem is a lack of transparency in what the program is actually doing?

hiiamboris

[22:01](#msg5f08e52b64ef9d04b2a675fe)Yeah. If it's meant to be interfaced with, it should be made for humans ;)

theSherwood

[22:01](#msg5f08e54a6e1b8050c3e7f5ff):thumbsup:

greggirwin

[22:17](#msg5f08e9088b72655b55648d65)On strings, in R/S you can deal with anything. e.g. some systems use length-prefixed strings, where an int of some size tells you how long the following string is, so it's 2 pieces of data of fixed and variable lengths. Generally you create a struct that matches it, but in some cases you may just get a pointer, if it's contiguous, if the second value is direct data and not a pointer to it.

On why...sigh. Because 1% of software needs to be highly optimized but we write like 99% of it needs to be. So we spend too much time writing low level code, and \*still* making everything too slow. I gripe about this a lot. ;^)

theSherwood

[22:22](#msg5f08ea4286ccb45b599abbf3)And R/S will interpret either of those formats as a string? Or does it need to be converted to an R/S string?

greggirwin

[22:39](#msg5f08ee1164ef9d04b2a68dfe)R/S knows nothing beyond what you tell it. If you interface with .NET and it uses BSTRs, you need to write routines in R/S that know how to deal with them when you make those API calls. If Rust uses something different, same deal. So if you need to work with C, Rust, .NET, Java, and something else, you may have 5 sets of string handling interfaces, all with different rules about null terminators, structures, dereferencing, and memory control.

[22:39](#msg5f08ee20bd3edf666fc1abf8)Truly, Hell on Earth.

theSherwood

[22:40](#msg5f08ee403c217837fd8efd00)Haha. Sounds less than ideal to be sure.

greggirwin

[22:43](#msg5f08eefb8b72655b55649c31)The best part is, at these low levels, the slightest mistake means crashing, resource exhaustion, and even BSODs if you're writing drivers and do it right.

theSherwood

[22:46](#msg5f08efc87455046699ef98e7)Haha. You're really selling it!

## Sunday 12nd July, 2020

henrikmk

[11:22](#msg5f0af26a64ef9d04b2ab8589)Is there a comparison between R/S and C somewhere?

9214

[16:20](#msg5f0b38683e4a827d19bfb3d0)@henrikmk see \[here](https://github.com/red/red/wiki/%5BNOTE%5D-Porting-C-code-to-Red-System).

henrikmk

[18:38](#msg5f0b5889bd3edf666fc7a79a)Thanks very much.

## Monday 13th July, 2020

bubnenkoff

[09:04](#msg5f0c23a2f6b74162842fedc4)&gt; I mean, come on. We're in 21th century and yet interrogating our programs by more low level code.

Would WASM help to simplify interoperability?

greggirwin

[13:49](#msg5f0c66597a4e99049e0a9463)No. It's even lower level than C, hence the name. It's SharedArrayBuffer memory feature was (someone please correct me if this is wrong), was used by the Spectre exploit.

## Friday 17th July, 2020

BeardPower

[21:08](#msg5f12135ba874ff08d28134ba)Would this scenario post any issues?  
The compiler is not able to compile some piece of Red code. There is also some R/S code used in Red through routine! As this is only possible with compiled code, it's a catch-22. Would it work out to use -e?

greggirwin

[21:28](#msg5f1218138e9a3a6ef09b3a1f)The more granular approach is to wrap the dynamic parts in `do`, so the compiler doesn't process them.

BeardPower

[21:34](#msg5f12194efd3832489b1696ca)That sounds more of a hack than a solution.

[21:40](#msg5f121ad4f8b05b39f950ee07)The error does not really help me to track down the issue:

```
*** Compilation Error: argument type mismatch on calling: red/eval-path*
*** expected: [struct! [
        header [integer!]
        data1 [integer!]
        data2 [integer!]
        data3 [integer!]
    ]], found: [struct! [
        header [integer!]
        ctx [pointer! [integer!]]
        symbol [integer!]
        index [integer!]
    ]]
*** in file: %/C/Users/haral/Development/crypto/dashboard/table.red
*** in function: exec/f_<anon1242>
*** at line: 1
*** near: [
    stack/unwind
    stack/mark-native ~eval-path
    eval-path* ~b ~offset
    stack/unwind
    natives/equal?*
]
```

9214

[21:47](#msg5f121c63724012319bb27b3e)@BeardPower the issue is a struct typecast somewhere in your code or in the code that compiler emits. `eval-path*` expects `red-value!` but is given something that looks like a `red-word!`.

BeardPower

[21:49](#msg5f121ccf4a9e2578a0a6042b)@9214 Thank! That's like searching for the needle in the haystack as I include some third-party Red code.

9214

[21:50](#msg5f121d1f5ed1d5377468a437)@BeardPower if you can track down the culprit and narrow it to a few lines of code, that would be helpful.

BeardPower

[21:50](#msg5f121d3ea874ff08d281508f)@9214 I will try when I have more time.

greggirwin

[21:55](#msg5f121e518a9a0a08cba55d59)Not sure how it counts as a hack. It's controlled compilation, just like controlled evaluation.

BeardPower

[22:04](#msg5f122089724012319bb287a2)It's a hack because I need to do it to bypass some issues with the compiler. I don't want to think about wrapping some code in do blocks.

greggirwin

[22:06](#msg5f1220c8564e6b39f562bf8f)Then make the compiler handle every case intelligently. :^)

[22:06](#msg5f1220d3f8b05b39f950fdc8)Or don't write code it can't handle.

BeardPower

[22:06](#msg5f1220eb4a9e2578a0a60f52)Well, sometimes it is not my code.

greggirwin

[22:07](#msg5f1221084a9e2578a0a60fa0)Guess you have to work on the compiler then. :^)

BeardPower

[22:07](#msg5f12211a564e6b39f562c057)First I need to find the culprit haha

9214

[22:13](#msg5f1222a15ed1d5377468b39c)@BeardPower well, let's say that it's a hack by design :wink:

AOT compiler uses a pre-defined set of heuristics to determine what is "code" and what is "data", and fixes this decision once and for all. The code is unrolled into a chain of calls to Red runtime, and the data is stored in Redbin payload. The heuristics that compiler uses are not always accurate and actually support only a statically compile-able subset of the language, hence the multitude of compiler issues: Red is too dynamic for AOT, and \[suckers with static approach get rolled and smoked like a joint](https://www.youtube.com/watch?v=L56XgA36m5E).

Encap mode treats everything as data and stores the whole content of your script in Redbin payload, that guarantees the same behavior as in interpreted code, but you miss the ability to use routines, since they require compilation down to machine code.

Wrapping in `do` is a middle way, since `do`, by design, is a gateway to Red interpreter, and compiler stores `do` blocks in Redbin payload. You can think of Encap mode as a handy way to wrap everything in a giant `do` block, in fact, I \[used](https://gist.github.com/9214/d57e50617ddd690c6f958ce81182a5a7) this trick before it was implemented.

[22:15](#msg5f1223024a9e2578a0a61436)Error messages could be a tad bit more informative indeed. Pointing to failed-to-compile Red code rather than to emitted Red/System code would be a reasonable first step.

greggirwin

[22:15](#msg5f12230b4a9e2578a0a61457)@9214, put that somewhere safe. :+1:

[22:16](#msg5f12232782ccdc78adce08cb)@BeardPower you have other alternatives too, though. Build a custom Red runtime with all your routines, and encap your main app.

BeardPower

[22:49](#msg5f122adc8a9a0a08cba57f3f)@9214 So let's put it into that bag then hehe

[22:49](#msg5f122b0764b6213da144f1bd)@greggirwin Isn't that an upcoming feature? Loading compiled modules so Red can use it in the interpreter?

[22:55](#msg5f122c66724012319bb2a30d)I tracked down the non-compilable code:

```
fields: []

sort-db: func [
    db      [block!]
    field   [word!]
    
    /local 
        result [block!]
        offset [integer!]
] [
    offset: find fields field
    either offset [offset: index? offset][
        print ["ERROR:" field "does not exist"]
        halt
    ]
    db: copy db
    sort/compare db func [a b] [
        if a/:offset = b/:offset [return 0]
        either a/:offset > b/:offset [1][-1]
    ]
    db
]
```

9214

[22:57](#msg5f122cd8775d59377cfcd09b)@BeardPower `= b/:offset` part.

BeardPower

[22:57](#msg5f122ce7b2dad248b6c2283f)Yep.

[22:58](#msg5f122d13f8b05b39f9511f26)Will it ever be able to compile that?

[22:59](#msg5f122d69775d59377cfcd325)I got rid of the :

9214

[23:01](#msg5f122daf775d59377cfcd3b2)@BeardPower as I understand you have a block of records that you want to sort by some field?

BeardPower

[23:01](#msg5f122ddafd3832489b16cc81)Yes. It's a REBOL example for implementing a simple db.

[23:01](#msg5f122de6b2dad248b6c22a11)using a/offset will compile.

9214

[23:02](#msg5f122df3a28d973192dfcb5c)I will, but that's not what you want.

BeardPower

[23:03](#msg5f122e28b2dad248b6c22aac)If offset is an integer : and no : will have the same outcome.

9214

[23:03](#msg5f122e2e724012319bb2a791)I'd rather use something like this. Records 2 values in width, sorted by 2nd column.

```
>> sort/skip/compare [a 3 b 1 c 2] 2 2
== [b 1 c 2 a 3]
```

BeardPower

[23:04](#msg5f122e6f8a9a0a08cba5869e)Why I won't want getting rid of the :?

[23:04](#msg5f122e808a9a0a08cba586b6)Thanks. Yeah, that looks nice.

9214

[23:05](#msg5f122e9c00ae3b3d99f8cea8)@BeardPower `a/offset` uses `offset` literally as a key. `a/:offset` uses whatever `offset` is set to as a key or index, in your case it's an integer index.

BeardPower

[23:05](#msg5f122ebba874ff08d2817b4f)Yes, so it will work as the offset will never be something different than an integer.

9214

[23:07](#msg5f122f1782ccdc78adce2a16)@BeardPower

```
>> block: [database record at offset 123]
== [database record at offset 123]
>> offset: 2
== 2
>> block/offset ; offset is a key that selects 123
== 123
>> block/:offset ; offset is set to 2 that is used to fetch 2nd value
== record
```

greggirwin

[23:07](#msg5f122f2364b6213da144fde2)@BeardPower but Red doesn't know that, because variables aren't typed.

[23:08](#msg5f122f70564e6b39f562e8a6)Technically, with enough effort, yes, the compiler could see that the only values a word might refer to in a given scenario are of a given type, and optimize based on that, or compile at all.

BeardPower

[23:08](#msg5f122f77a28d973192dfce9f)@greggirwin But index? will return an integer. So wouldn't it work all the time?

[23:09](#msg5f122fa482ccdc78adce2bd8)So using /offset would always work and it would always compile.

9214

[23:10](#msg5f122ff4b2dad248b6c22e84)@BeardPower take a look at my example. It will compile, but won't work as you want.

greggirwin

[23:11](#msg5f1230325ed1d5377468d81a)Only if the compiler examines everything to see that you have thrown in a `offset: 'gotcha!` line in the middle of the func. Or anything else that could \*potentially* return a non-int.

BeardPower

[23:14](#msg5f1230d9775d59377cfcda0e)@9214 Yes, but index? will always return an integer so it will always be exactly what I want: the key, in which my case is an integer.

9214

[23:16](#msg5f12315fb2dad248b6c231fa)@BeardPower if you use `:offset` that does not compile. If you use `offset` that compiles then the key will always be `offset`, regardless of what `index?` returns.

BeardPower

[23:19](#msg5f1232028e9a3a6ef09b7c13)Yes, and it will be an integer:

```
offset: find fields field
```

[23:19](#msg5f12320db2dad248b6c23365)As find will return an integer.

[23:20](#msg5f1232378a9a0a08cba58e7e)And index?

[23:21](#msg5f12325d5ed1d5377468dc8f)offset is set by index?, so why would it be offset regardless of what index? returns?

9214

[23:22](#msg5f1232bc775d59377cfcde1b)\[I give up](https://www.youtube.com/watch?v=5FssJ1x-XsU).

BeardPower

[23:22](#msg5f1232be8e9a3a6ef09b7d42)Ah, now I get it. You mean that it will refer to the key inside the block.

9214

[23:22](#msg5f1232c5b2dad248b6c2353d)@BeardPower precisely.

BeardPower

[23:23](#msg5f1232da4a9e2578a0a63cef)Thanks!

[23:23](#msg5f1232e8564e6b39f562f279)Sorry, it's a little late and time for some sleep hehe

9214

[23:23](#msg5f1232f3a28d973192dfd5c1)So, try `do [a/:offset = b/:offset]` instead.

BeardPower

[23:23](#msg5f1232fd564e6b39f562f2ec)Will do.

[23:25](#msg5f12337efd3832489b16dc88)That did it hehe

## Thursday 8th October, 2020

XANOZOID

[06:52](#msg5f7eb7318f2e9b6ac22187f8)I saw that a community member recently added #4656 . . . I saw that #3488 was closed with a comment. So what kind of discussion has there been on WASM thus far? One of the #/1 targets I'd like to see for Red is definitely going to have to be WASM. Anyone else actually interested in this target? I haven't seen any other WASM related posts on the Red Github page -- but I'm willing to take a look into the possibility of implementing, or starting the effort of implementing, a WASM target.

[07:01](#msg5f7eb95b00f5b82075bf233b)However, I'm hoping this is actually reasonable. How much of Red is separated from Rebol, and to what point are they able to be separated? Also, does Red currently compile to other platforms by actually understanding how to translate itself (well R/S I suppose) to each architectures/target's machine code? Or are there intermediate steps? I don't imagine Red "assembles itself" for any target, but really only needs to understand how to create the necessary machine code per target. Well, I'm thinking that is of course unless some "assembly" happens to be the "target" for any reason.

rebolek

[07:01](#msg5f7eb964eb6dbd77f909b4d9)Adding NetBSD is \*much* easier than WASM, look at the changeset, it basically adds NetBSD to list of systems and few support functions. Adding WASM means adding whole new "cpu" architecture.  
There certainly are people interested in WASM version of Red but no one hasn't started any work on it AFAIK. It is usualy discouraged as current compiler will be thrown away but I believe that once new compiler is in place, lot of old code could be reused.  
So if you are interested in doing it and aren't afraid rewriting it once the currenten compiler is abandoned, go for it! :-)

[07:03](#msg5f7eb9badfe47e4d575525d4)Regarding the separation, Red is translated to Red/System (this step is done in Red) and the Red/System is compiled to machine code (compiler is written in Rebol).  
So adding new architecture (WASM) means extending the compiler so it can compile Red/System to WASM.

XANOZOID

[07:03](#msg5f7eb9c2ed7be16b3cc4eff5)@rebolek Ahh okay . . . I'm very much interested in doing something like this. Perhaps I could just make a "tech-demo" in my spare time under a limited dialect of my own . . . but creating the "red runtime" might not be a possibility for me at this point haha

[07:04](#msg5f7eba0817377c6b5de6571c)@rebolek Thank you!! Well, I'm definitely interested. No problem in the compiler being "thrown" away if my efforts make future "wasm" efforts much more streamlined! And of course there's always the fact that the old version may be useful until newer versions support wasm again :)

rebolek

[07:04](#msg5f7eba0c2bd48753094086b7)The tech demo would be something like `print "hello world"` in Red/System. You don't have to cover Red runtime at all - once you can compile Red/System, you get Red for free :-)

XANOZOID

[07:04](#msg5f7eba143d3d0d749a380e63)I'm at least \_interested_ to say the least 😊

rebolek

[07:05](#msg5f7eba20ed7be16b3cc4f10d):-)

Respectech

[14:31](#msg5f7f22ab8f2e9b6ac222b459)I am also interested in WASM as a target.

## Saturday 10th October, 2020

XANOZOID

[00:56](#msg5f8106a83775d02b5afe750c)One issue I'm having on deciding where I'll put this effort is the fact some important things about the WASM target don't have a full standard yet. Specifically, modules (dynamic libs) are still a work in progress. So any effort made to try to make a Red module interface with LLVM/C++ generated WASM might not be very stable. However, LLVM related WASM efforts are apparently being done in parallel with C/C++ efforts for WASM compilation. . . If that's the case, what's the talk around in the Red community about LLVM? It might make more sense, in terms of covering more ground with less initial work, to target LLVM assembly or bitcode instead of WASM code. Again . . . Thoughts? This talk is about my own efforts vs where the limited resources of the official Red team/community goes btw. Until I get something off the ground in the future of course 😄

Oldes

[06:58](#msg5f815b7d99e1ab4dd1edcfe2)If you don't know what to do with your available time.. than making LLVM target is better investement than direct wasm code.

[07:00](#msg5f815c2102e81701b0118715)Btw.. for example Adove was using LLVM to crosscompile its ActionScript into iOS native code.

greggirwin

[16:30](#msg5f81e1be78d7f20c9f9f85f3)@XANOZOID we plan to have an LLVM back end at some point. While our primary goal is to rely on externals as little as possible (i.e. just the OS), LLVM has enough value in platforms and optimizations that we feel it's worth it. It's a big task, so looking at how Red's compiler emits target code, and starting with `hello world` as was noted, is a good first step.

XANOZOID

[19:01](#msg5f820503aacbfa2248ccc56f)Awesome, I'll keep all of this in mind going forward 🙂. LLVM is probably what I'll really dig into - but if not WASM is not out of the picture.

## Sunday 29th November, 2020

GiuseppeChillemi

[19:53](#msg5fc3fc283cd97915c1a90851)I am reading R/S doc, I have not understood if a pointer can be declared to a `struct!` and the math can act accordingly, so +1 adds `SIZE` bytes of the `struct` to the pointer

## Wednesday 2nd December, 2020

hiiamboris

[20:50](#msg5fc7fdfcf2a33f3163af8e1d)that's exactly how it works

## Thursday 3th December, 2020

vazub

[17:08](#msg5fc91b913d46ef481c66138d)@greggirwin are there any preliminary discussions to have freestanding compile target at some point?

greggirwin

[18:55](#msg5fc934bc5a3e9845cd6defbb)What does "freestanding compile target" mean? You can compile EXEs with no dependencies today.

vazub\_gitlab

[19:10](#msg5fc93831cdb54d716ee5427a)I mean flat binaries and bare-metal target

[19:12](#msg5fc938937707e845d508315a)Assuming I want to go really low-level and do some arcane OS or even BIOS-level development (don't ask why :D)

greggirwin

[19:27](#msg5fc93c34657e0c48225c6eab)@BeardPower has already done some of that. Until someone goes down that road a bit, we won't know what features are missing, or most helpful.

GiuseppeChillemi

[21:38](#msg5fc95ae7ff927f50824ba60f)@hiiamboris thank you, the dialect is nice. Finally I am there.

## Sunday 6th December, 2020

vazub\_gitlab

[11:10](#msg5fccbc3a3b3e7e2a2fa0691d)&gt; What does "freestanding compile target" mean? You can compile EXEs with no dependencies today.

I might be mistaken, but I believe there is an inherent dependency on C library by default, at least for POSIX targets that I looked into. Would be interested to learn more whether Red/System actually allows to omit this dependency.

## Monday 7th December, 2020

vazub\_gitlab

[21:08](#msg5fce99dac980287e36800248)Answering my own question above - apparently specifying the `--no-runtime` compiler option does the trick - the executable gets produced with no lib or system dependencies whatsoever. Will dig deeper then)

greggirwin

[21:13](#msg5fce9b1767bf4438e12ee7d8):+1: Sorry nobody else was able to jump in, but glad you figured it out.

## Thursday 10th December, 2020

DanKokenge\_twitter

[08:56](#msg5fd1e2ae03da931ac2429269)Ok! Being new to RED, does this mean I could put a exe on a cloud disk. Users could then run the exe. It would basically do what what you normally do with html and client/server. That would be amazing.

vazub\_gitlab

[14:03](#msg5fd22ac791e8cb3e8cf1d860)`put a exe on a cloud disk. Users could then run the exe`  
Not sure what exactly you mean here. Cloud storage is not an executable environment - it doesn't have the facilities to run files.

pekr

[14:15](#msg5fd22d763646a85814deb72a)Exactly - such user will be most probably able to download such file, but some protective measures (antivirus protection) might step-in and prevent this. The cloud storage would have to be remotely mounted as a local/network drive, which might be possible e.g. using WebDav, but not sure ...

DanKokenge\_twitter

[15:07](#msg5fd239b655c9c37b30592eec)You'll have to forgive me, I just started reading about RED/REBOL. What I'm trying to do is bypass the client/server type web app. Instead of the client clicking on some link on a home page and getting served up html/js, I keep trying to to come up with some way they can run programs direct on their computer from exe's or interpreted source code served to them from the server. This may be a stupid idea, but if Rebol could somehow get loaded to the user, it could do what JS does on the client side. They then load only source code from the server to be executed. If it could be done, it would make writing client/ server apps as if they were local and reduce development time. Maybe RED has a small engine that interprets code? -- Just exploring ideas?? Thanks for the help..

pekr

[15:21](#msg5fd23cf967034a3e90fd581a)With Red/Rebol, of course you can run remote scripts using `do http://my-domain.com/my-script.red`, but not executables directly. You can eventually download the executable using Red, stored it locally and launch it using `call`. But really beware the security ...

greggirwin

[18:50](#msg5fd26de13646a85814df5eb4)@DanKokenge\_twitter I think I mentioned this somewhere recently. You need an environment of some kind, just as with any EXE you can get from the net. In Red's case, you can build standalone EXEs, but you're going to run into the same limitations you would with apps built in any other tool. The other thing you can do is write a launcher that let's people select the remote Red content and executes it locally.

[18:52](#msg5fd26e6c3646a85814df5fee)e.g. look at \[this](https://github.com/greggirwin/7guis/tree/master/Red/launcher.red)

[18:54](#msg5fd26ec92a954a51a9c2a51d)You can also do it so the remote content runs outside the context of your launcher.
