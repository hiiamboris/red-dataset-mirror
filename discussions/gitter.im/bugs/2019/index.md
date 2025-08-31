# Archived messages from: [gitter.im/red/bugs](/gitter.im/red/bugs/) from year: 2019

## Friday 4th January, 2019

hiiamboris

[21:24](#msg5c2fcf02bd592b2e6e528a44)

```
>> view [base on-created [probe event]]
none
>> view [base on-create [probe event]]
none
```

it's a bug, right?

endo64

[21:30](#msg5c2fd07882a6c30b90863ace)@hiiamboris Nope, it is not. See 11.3. Actors section of https://doc.red-lang.org/en/view.html#\_events

[21:30](#msg5c2fd083bd592b2e6e5291e9)&gt; Unlike other actors, on-create has only one argument, face.

hiiamboris

[22:13](#msg5c2fda7d26d86e4d56280572)what about `on-createD` ?

[22:14](#msg5c2fdab826d86e4d562806f1)well, no wonder now these events are not caught by insert-event-func...

[23:28](#msg5c2fec1382a6c30b9086ee80)also, how about this?

```
view [p: panel [f: field] do [selected: f]]
```

sets focus to `f` although `f` is not a part of window's pane

and what seems to be the proper way:

```
view [p: panel [f: field] with [selected: f] do [selected: p]]
```

loses focus totally

[23:33](#msg5c2fed3026d86e4d56287e35)what's more surprising, is that `set-focus` actually places the focus properly but does not follow the face hierarchy:

```
>> view [p: panel [f: field] do [set-focus f ? selected/type ? f/parent/type]]
SELECTED/TYPE is a word! value: field
F/PARENT/TYPE is a word! value: panel
```

although it should by the look of it:

```
>> ?? set-focus
set-focus: 
func ["Sets the focus on the argument face" 
    face [object!] 
    /local p
][
    p: face/parent 
    while [p/type <> 'window] [p: p/parent] 
    p/selected: face]
```

[23:36](#msg5c2fedfe57c6883f9b645d7e)nvm, I got the whole idea wrong it seems...  
so there is only one `selected` facet that matters, and it's the one of `window` face, others are only taking memory

## Saturday 5th January, 2019

dockimbel

[02:02](#msg5c30101a57c6883f9b651a8f)@hiiamboris A window can only have one selected face at a time.

hiiamboris

[02:25](#msg5c30158073360b4d55bd3159)Technically yes, but for some reason I thought of `selected` as of an abstraction.. Idk, it just seemed natural to me? Like imagine you have a tab-panel with a few pages, on each page you would have a selected face, and then by selecting a tab you could physically activate a face on that tab that was previously focused. This way you would go all the way down the panes of selected faces to determine which window has focus.

dockimbel

[02:35](#msg5c3017eb12db9607e73abf64)@hiiamboris Makes sense, that's a feature that could be easily implemented, just `set-focus` to selected face in a tab-panel when shown.

## Sunday 6th January, 2019

GiuseppeChillemi

[22:09](#msg5c327c901948ad07e8fc23e7)Hi, I am writing some code for URI to internal-path conversion and while coding a function (I am in the early stages) I have found I lose a word value inside a function and I don't realize the reason:

```
level: 0
current: copy []
internal-path: copy ""

decode-path: function 
[
	path-value
]
[
	path-word: copy ""
	print ["Path: " path-value]

	foreach [character] path-value 
	[
		character: to-string character
		print ["Character: " character type? character]
		either ((character = ":") or (character = "/")) 
			[
				print ["Level"  level "SHOULD BE A NUMBER!"]
				level: level + 1
				append-to-internal-path path-word 
				print ["Path Word: " path-word]
				path-word: copy ""
			]
			[
				append path-word character 
				print ["Value of PATH-WORD: " path-word]]
	]
]

print ["Level (Before Function)"  level ]

mypath: "server:database/tables/field"

decode-path mypath
```

OUTPUT:

```
Level (Before Function) 0
Path:  server:database/tables/field
Character:  s string
Value of PATH-WORD:  s
Character:  e string
Value of PATH-WORD:  se
Character:  r string
Value of PATH-WORD:  ser
Character:  v string
Value of PATH-WORD:  serv
Character:  e string
Value of PATH-WORD:  serve
Character:  r string
Value of PATH-WORD:  server
Character:  : string
Level none SHOULD BE A NUMBER!
*** Script Error: + does not allow none! for its value1 argument
*** Where: +
*** Stack: decode-path 
>>
```

LEVEL is NONE inside a function while it shoudn't

9214

[22:19](#msg5c327eeb73360b4d55cb7ae6)&gt; I don't realize the reason

The reason is that you use `function` without understanding how it works. `function` gather all `set-word!`s inside body as locals, and your usage of `level:` prompted it to collect that word. Formal parameters of refinements (`/local` is a refinement too) are set to `none` by default.

```
>> find spec-of :decode-path 'local
== [/local path-word character level]
```

And please use a \[dedicated room](https://gitter.im/red/help) if you have troubles with your code.

GiuseppeChillemi

[22:34](#msg5c3282925ec8fe5a85114fa1)@9214 , thought it was a BUG, moving to /help

## Monday 7th January, 2019

hiiamboris

[00:31](#msg5c329dec1948ad07e8fcdddf)@dockimbel regarding :point\_up: \[January 6, 2019 1:06 PM](https://gitter.im/red/red?at=5c31d3371948ad07e8f8151e)  
Does it always fail for you? If so, maybe @qtxie can tell what assertions fail there and why?  
I've installed this monstrous W10 in a VM, but couldn't reproduce it.  
!\[](https://i.gyazo.com/50d914e4e36f9fccaadbcf80a771d0b3.png)

[00:41](#msg5c32a04e4ed18278776ddd4c)But, if it was just a sudden glitch, don't bother. Decreasing rate https://github.com/red/red/blob/master/tests/source/view/base-self-test.red#L51 from 2 to 1 should fix it then.

qtxie

[02:21](#msg5c32b79a5ec8fe5a85128a7d)@hiiamboris I'm using W7 and all the tests are passed. I'll give a try on W10 today.

dockimbel

[02:30](#msg5c32b9ca357dd7655d2b16db)@hiiamboris It consistently fails on my main development box running W10. My screen resolution is uncommon (3000x2000), so I'm wondering it that would be a possible cause? I will try again with that decreased rate.

[02:32](#msg5c32ba314ed18278776e735d)I'm no fan of W10 either, but W7 does not handle properly very high resolutions.

hiiamboris

[04:24](#msg5c32d4876370df0b91a04ea2)When it fails, does it show you the actual screenshot and what it expected and what it gets? (it should for 5 secs, defined here https://github.com/red/red/blob/master/tests/source/view/base-self-test.red#L46)

dockimbel

[04:28](#msg5c32d5841948ad07e8fe19d4)Even with the different setting, the two same tests are still failing:

```
~~~started test~~~ base-self-test
===group=== to-image check
--test-- tic-1 size adequacy FAILED**************
--test-- tic-3 capture of color blending FAILED**************
~~~finished test~~~  base-self-test
  Number of Tests Performed:      71
  Number of Assertions Performed: 320
  Number of Assertions Passed:    318
  Number of Assertions Failed:    2
****************TEST FAILURES****************
```

[04:29](#msg5c32d5c28b6399655e1c76af)@hiiamboris I haven't noticed, it opens/closes a lot of windows and the whole process takes a long time (seems like 5-10mn, but haven't measured).

[04:30](#msg5c32d5fa1491b27876d1c9be)I can retry with a longer delay for the failed images.

hiiamboris

[04:59](#msg5c32dcc46370df0b91a08188)Hmm, curious. Well, these 2 tests come before the "lots of windows" part. Just comment everything that comes after.

dockimbel

[06:38](#msg5c32f3cf26d86e4d563a1487)\[!\[image.png](https://files.gitter.im/red/bugs/iL7R/thumb/image.png)](https://files.gitter.im/red/bugs/iL7R/image.png)

[06:39](#msg5c32f4265ec8fe5a8513dda5)So, it's the 200% scaling in my W10 display settings that makes it fail.

hiiamboris

[07:13](#msg5c32fc1373360b4d55ce3a16)@dockimbel can you tell your `system/view/metrics/dpi` value?

[07:14](#msg5c32fc5e12db9607e74b9dbd)if you have 200% scaling it should be = 192

[07:14](#msg5c32fc674ed18278776ff3c2)so I guess we're onto something here...

[07:15](#msg5c32fc9f57c6883f9b762043)I have

```
>> system/view/metrics/dpi
== 120
```

for 125% scaling

dockimbel

[07:30](#msg5c3300238b6399655e1d7073)@hiiamboris `192` confirmed.

hiiamboris

[07:33](#msg5c3300c63cf6c35a84a2dd93)even weirder then!  
Apparently 192 never gets to this line https://github.com/red/red/blob/master/tests/source/view/base-self-test.red#L1028

[07:33](#msg5c3300d95ec8fe5a85142973)Either something overrides it, or it's wrong when the test runs

dockimbel

[07:36](#msg5c33018d8b6399655e1d7929)Let me try to probe it in the test to see what's happening...

[07:43](#msg5c330329aac7082e6fe7ca3a)

```
lisp
	--test-- "tic-1 size adequacy"
		bst-im: shoot [base 100x100]
probe system/view/metrics/dpi
		bst-sz: 100x100 * system/view/metrics/dpi / 96.0
		--assert test-size-match? bst-im bst-sz
```

gives me `96`...

hiiamboris

[07:45](#msg5c33037d12db9607e74bc7cf)I'll leave it up to you to find out why :)  
Can't really test anything on that W10. It just constantly keeps torturing my HDD for no reason, takes 10 minutes to login.

dockimbel

[07:46](#msg5c3303de6370df0b91a15b60)I think the View engine is not initialized yet when that code is running, because `view` hasn't been called once. See: https://github.com/red/red/blob/master/modules/view/view.red#L835

hiiamboris

[07:47](#msg5c3304281948ad07e8ff24d8)I have a proper `dpi` value even in CLI-console.

dockimbel

[07:48](#msg5c3304351d1c2c3f9cd46a05)So the DPI is not set yet and falls back to the default 96 value.

[07:48](#msg5c3304411948ad07e8ff2556)Odd...

[07:50](#msg5c3304c457c6883f9b765392)@hiiamboris  
&gt; I have a proper `dpi` value even in CLI-console.

How is that possible? It's only set when `view` is called the first time...

hiiamboris

[07:52](#msg5c330523357dd7655d2cc8eb)How would I know? I just run `red --cli` or the console compiled with `needs: view` and there's my proper DPI

[07:57](#msg5c3306721491b27876d2eb30)To eliminate consoles:

```
rebol --do "do/args %red.r {-c -t MSDOS 1.red} quit"
```

1.red: `Red [] probe system/view/metrics/dpi`

```
D:\devel\red\red-src\red>1.exe
120
```

[07:58](#msg5c33069a357dd7655d2cd1ea)Interesting though, `-r` gives

```
*** Runtime Error 1: access violation
*** at: 00436005h
```

[08:03](#msg5c3307bc1948ad07e8ff3a96)Should I raise a new issue regarding this crash?

dockimbel

[08:03](#msg5c3307ca1948ad07e8ff3aaf)@hiiamboris What is in `1.red`?

hiiamboris

[08:03](#msg5c3307d782a6c30b9099607b)`Red [] probe system/view/metrics/dpi`

dockimbel

[08:05](#msg5c3308601948ad07e8ff3eef)Yes, you can open a new issue.

[08:06](#msg5c33087912db9607e74be601)

```
lisp
C:\Dev\Red>red --cli
Compiling compression library...
Compiling Red console...
--== Red 0.6.4 ==--
Type HELP for starting information.

>> system/view/metrics/dpi
== 192
```

That's odd...

hiiamboris

[08:07](#msg5c3308d282a6c30b9099673a)Just compiled with `-d`:

```
D:\devel\red\red-src\red>1.exe
root size: 2154, root max: 4126, cycles: 0
root size: 2154, root max: 4126, cycles: 1
root size: 2154, root max: 4126, cycles: 2

*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/datatypes/object.reds
*** at line: 97
***
***   stack: red/object/rs-select 0283D264h 0324C930h
***   stack: red/error/reduce 0283D284h 0283D264h
***   stack: red/error/form 0283D264h 0283D274h 0283D254h -18
***   stack: red/actions/form 0283D264h 0283D274h 0283D254h 0
***   stack: red/actions/form* -1
***   stack: red/natives/prin* false
***   stack: red/natives/print* false
***   stack: red/stack/throw-error 0283D284h
***   stack: red/fire 0 0018FEFCh
***   stack: red/actions/get-action-ptr-path 029BF6D8h 7 0049DB14h
***   stack: red/actions/eval-path 029BF6D8h 02835204h 00000000h 00000000h false
***   stack: red/eval-path 029BF6D8h 02835204h
```

So it looks like indeed the View wasn't initialized with `-r`. Seems to me, `view` isn't the only trigger that inits it.

dockimbel

[08:14](#msg5c330a6582a6c30b90996ddd)@hiiamboris Can you change the scaling on your W7 and see if the tests are still passing?

hiiamboris

[08:16](#msg5c330aef12db9607e74bf7f5)I have 125% by default (dpi=120), and they are passing.

[08:19](#msg5c330b8e3cf6c35a84a322b8)I bet they will pass if you add `Needs: View` into the header of `base-self-test.red`. But I didn't want to do that because otherwise it'll be impossible to include that script into Linux tests suite (even though it will do nothing useful there, it may be inconvenient to include or exclude it based on the platform).

dockimbel

[08:34](#msg5c330f044ed1827877705d5b)@hiiamboris  
&gt; I have 125% by default (dpi=120), and they are passing.

I mean change it from your default setting, to see if you can reproduce the issue.

hiiamboris

[08:34](#msg5c330f1d357dd7655d2d090a)Default is 100%, dpi=96

[08:34](#msg5c330f2a26d86e4d563abdac)You mean to 200%?

dockimbel

[08:34](#msg5c330f321491b27876d321f8)On Qingtian's W10, it works fine with 125% too and starts reporting errors if that scaling is changed to anything else.

hiiamboris

[08:35](#msg5c330f481d1c2c3f9cd4be31)I was also thinking. The 2nd test fails again on `test-size-match` so then `dpi` is still wrong after a few `view` calls. Consequently, something else triggered it's initialization and it was wrong from the very start.

[08:37](#msg5c330fcd357dd7655d2d0e1a)I have 200% on my W8, and I tested that on it as well before I made a PR.

[08:49](#msg5c33128e73360b4d55cec89d)Just tried again, with `run-test.r` and `tests/run-all.r`, both work with 200% on W8.1.

PeterWAWood

[08:53](#msg5c33137b4ed1827877707444)Wouldn’t it be sensible to use the test-backend to both confirm the tests work and so that they can be run by the CI?

hiiamboris

[08:56](#msg5c33142c3cf6c35a84a35cb9)Nope. Test backend tests itself, not the \*real* backend. Pointless for this task.

dockimbel

[09:18](#msg5c3319801491b27876d36326)@hiiamboris  
&gt; Just tried again, with `run-test.r` and `tests/run-all.r`, both work with 200% on W8.1.

Thanks, we'll investigate further the surprising DPI init issue.

mikeparr

[15:55](#msg5c33767626d86e4d563d57f0)@greggirwin - unique suggestion - got it - thanks.

## Wednesday 9th January, 2019

Dobeash

[21:46](#msg5c366ba1783a5553d80b00b6)&gt; Trim now supports binary! values. By default, only null values are removed.

```
>> trim/with #{00} null
== #{}
```

works.

```
>> trim #{00}
```

hangs console.

## Thursday 10th January, 2019

greggirwin

[00:21](#msg5c368ff9a57b501bcfdcd642)Confirmed and commented with more info on the ticket.

hiiamboris

[11:26](#msg5c372be18db70e46c4e3e19b)I have such a wonderful crash.. that happens only on GUI console compiled with `-t Windows` (I can't see the output), and even if I change the script name (add/remove 3-4 random letters, or specify not the whole script path but only it's file name) it stops crashing...

[12:56](#msg5c3740ea2e25e453d75ce320)Also reactions disappearing for reasons unknown (not affected by the GC)... ☺

[13:17](#msg5c3746039289cc7aa74fcb88)@dockimbel The last line is a bug, yes? `/window` field should always return a window?

```
system/view/VID/styles/bomb: [
	template: [
		type: 'base
		size: 50x50
		actors: [
			on-created: func [f] [
				f/color: random white
				print ["Created!"]
			]
		]
	]
]

view [
	bomb with [
		actors: make actors [
			on-down: func [f e] [? e/window/type]
		]
	]
]
```

```
Created!
E/WINDOW/TYPE is a word! value: base
```

Oldes

[23:04](#msg5c37cf6fa57b501bcfe4e57c)@dockimbel I was just playing with image creation and found this:

```
>> i: make image! 2x2
== make image! [2x2 #{FFFFFFFFFFFFFFFFFFFFFFFF}]
>> i/1x1
*** Syntax Error: invalid integer! at "i/1x1"
*** Where: do
*** Stack: load 
>> i/(1x1)
== 255.255.255.0
>> i/(2x2)
== 255.255.255.0
>> i/(0x0)
== none
>> i/(1x1): 0.0.0
== 0.0.0
>> i
== make image! [2x2 #{000000FFFFFFFFFFFFFFFFFF}]
```

1\. I suppose lexer should recognize `i/1x1` like it recognize `i/(1x1)`, right?  
2\. Is it by design that the access using pair is \_one based\_? In Rebol it was \_zero based\_.

[23:17](#msg5c37d278b35a0877666124ec)I'm inclined to believe it is good decision as it works with possible `pair!` argument for `repeat` as requested by @rgchris years ago: https://github.com/rebol/rebol-issues/issues/1995. But still would like to know other opinions.

[23:30](#msg5c37d593a57b501bcfe50e95)This is what I would like to have:

```
img: make image! size: 100x100
repeat p size [
	img/:p: random 255.255.255
]
```

[23:40](#msg5c37d7e98db70e46c4e8806e)(and I know that I could do above more efficiently using `integer` accessor)

[23:49](#msg5c37da17317e2407cd112a94)Another reason why the Red behaviour is probably better is, that `random PAIR` is giving 1-based values.

## Friday 11st January, 2019

hiiamboris

[01:15](#msg5c37ee1854d8bb07cccecc42)@Oldes https://github.com/red/red/issues/2500  
I reported that too a month ago.

[01:18](#msg5c37eed3ef78da1bcee04c69)Regarding 0x0 vs 1x1, if you want my opinion, I'm \*always* against 1-based indexing. Also here https://github.com/red/red/wiki/\[PROP]-Image-coordinate-systems-reboot-idea (see 1.) I posted some criticism about it.

greggirwin

[05:32](#msg5c382a6466f3433023abdda6)@dockimbel @qtxie, be sure to read @hiiamboris 's article, if you haven't already.

qtxie

[05:50](#msg5c382e932e25e453d762ed26)I think the CS-2 is not necessary. The cordinate system in View and Draw is not pixel based.

dockimbel

[06:36](#msg5c38395d5aa04d46c590c190)@hiiamboris Thanks for the in-depth analysis! I love the drawings. ;-) Few quick comments:  
\* The 0 vs 1-based indexing is a deep topic. If `image/0x0` gives you the first pixel, and `pick image 1` (== `first image`) the first pixel also, we fail at consistency.  
\* The underlying image and 2D vector library can also impose some constraints (I remember some off-by-one issues between GDI and GDI+), a new "reboot" has to take them into account.

[07:11](#msg5c3841878db70e46c4eaf8c8)@Oldes  
&gt; 1) I suppose lexer should recognize `i/1x1` like it recognize `i/(1x1)`, right?

No, those are different lexical constructs, parens are allowed in paths (for now), so anything that fits in a paren will pass. If you remove the parens, then you are branching in a different branch of the lexer. Adding pairs support in paths needs a good supporting use-case. Paths have strong lexical constraints, they are not as flexible as lists types. Here is an example of the kind of problem it can create in R3:

```
>> [i/1x1:]
** Syntax error: invalid "time" -- "1x1:"
** Near: (line 1) [i/1x1:]
```

&gt; 2) Is it by design that the access using pair is \_one based\_? In Rebol it was \_zero based\_.

It is. In Rebol, you get `image/0x0 = image/1`, which is inconsistent and confusing for newcomers. Though, a case could be made for it as in "pair indexes are 0-based, while integer indexes are 1-based". That would create an extra obstacle for people learning how to use images in Red. Though, the discussion is open on this, as it's a tight trade-off...

greggirwin

[17:08](#msg5c38cd8d83c7e37765532c4e)And also where explanatory docs will go a long way.

## Monday 14th January, 2019

Oldes

[11:51](#msg5c3c77b335350772cf2c4a31)Using integer to set image's pixel color is producing invalid result:

```
>> i: make image! 2x2
== make image! [2x2 #{FFFFFFFFFFFFFFFFFFFFFFFF}]
>> i/1: 0
== 0
>> i/2: 255
== 255
>> i
== make image! [2x2 #{050000050000FFFFFFFFFFFF}]
```

In `Rebol2` when integer was used, it changed image's alpha value... question is, if it would not be better to use it as a gray color instead? In `R3-alpha` it was throwing an (improper) error.

hiiamboris

[11:55](#msg5c3c78cd95e17b45254c8913)@Oldes you should update. We've fixed it some time ago.

Oldes

[11:56](#msg5c3c78ed8318994524e95052)grr... again too late:) And so what is the result now?

hiiamboris

[11:56](#msg5c3c78f4dab15872ce914ddd)An error.

Oldes

[11:56](#msg5c3c79080999400604ebd6a0)Hm. Why not the gray color?

hiiamboris

[11:58](#msg5c3c79580999400604ebd8a6)Idk. To me it doesn't look like this use case is worth supporting it.

[12:02](#msg5c3c7a5bdab15872ce915cb6)@Oldes there was no code that handles special cases. It accepted any spam and produced totally invalid results. I just added a check for supported types, that's all. If you think gray color is worth it, let's discuss it. But personally I'd rather convert the integer to a 4-byte tuple (like `i/1: to-tuple to-binary 1`).

[12:03](#msg5c3c7a82f780a1521f0ac38b)https://github.com/hiiamboris/red/commit/d0bd8b52ca73e1886462893b4406aa0e93343ee9

endo64

[12:05](#msg5c3c7b271cb70a372ad80d3a)It would better keep the alpha value.

Oldes

[12:06](#msg5c3c7b4eba5936605bb9fe40)@endo64 so to maintain Rebol2 compatibility? That would be better than error indeed.

hiiamboris

[12:11](#msg5c3c7c57dab15872ce9168fe)`i/2: 1.1.1 * 200` is your gray

[12:11](#msg5c3c7c6935350772cf2c6f98)`i/2/4: alpha` isn't working unfortunately

Oldes

[12:12](#msg5c3c7c9b39596c372bdcd1e6)I think it should work like in R2 as it is the cheapest way to change the alpha channel per pixel.

hiiamboris

[12:13](#msg5c3c7d00f780a1521f0ad7fd)Are there many use cases where you specifically want to change the alpha value of many pixels?

Oldes

[12:16](#msg5c3c7d8220b78635b61fca94)I think that not much, but there can be. And this is easy to implement and avoids ugly and not efficient code like you provided above with double conversion.

[12:16](#msg5c3c7dbb8318994524e97d5f)Which is wrong as it changes also the color and not just alpha.

hiiamboris

[12:18](#msg5c3c7e2395e17b45254cb94a)But that code sets the whole `argb` of a pixel. Not sure about it's portability though. I used it to hold a 2D array of integers in an image. I mean, it was \*meant* to change everything, not just alpha ☺

Oldes

[12:22](#msg5c3c7eef8318994524e98754)Yes.. your code is wrong as it sets the whole `argb`, but user may want to change just the alpha. How you would do it now?

hiiamboris

[12:23](#msg5c3c7f30ba355012a438936d)And I may want to change whole `argb` ☻  
If I want just alpha, then `x: i/2 x/4: alpha i/2: x` or `i/2: i/2 * 1.1.1 + (0.0.0.1 * alpha)`

Oldes

[12:24](#msg5c3c7f718318994524e98aa3)Right... as I said.. ugly and not efficient... in `rebol2` it was just `i/2: alpha`

hiiamboris

[12:24](#msg5c3c7f9b95e17b45254cc14d)Why alpha then? Why not blue channel? Or green?

[12:26](#msg5c3c7fdc39596c372bdcec8e)Anyway, I'm not against it. Just never had a use case, so I'm not gonna bother myself.

Oldes

[12:26](#msg5c3c7fef20b78635b61fe338)Sorry... I end now... this question is a nonsense for me. I just say, that `Red`has another easy to fix in-compatibility with `Rebol2`

meijeru

[13:56](#msg5c3c951b20b78635b6207853)@hiiamboris @Oldes In contrast to you, I consider this a serious issue and will make a ticket.

[15:18](#msg5c3ca85aba355012a439b71d)#3729

Oldes

[19:09](#msg5c3cde77dab15872ce941b39)One more image related question... should not `pair` selector respect image `size`?

```
>> i: make image! 4x4
== make image! [4x4 #{
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFF
>> i/(6x1)
== 255.255.255.0 ;<- should not it be none?
```

endo64

[19:13](#msg5c3cdf5d95e17b45254f5fe6)It is `none` for me:

```
>> i: make image! 4x4
>> i/(6x1)
== none
```

[19:13](#msg5c3cdf76c45b986d115e2fbc)On Win10 (`Red 0.6.4 for Windows built 11-Jan-2019/5:18:27+03:00 commit #5e37a10`)

Oldes

[19:14](#msg5c3cdfa532a8370605cf72be)Grr.. I'm again in wrong (old) folder

Dobeash

[21:14](#msg5c3cfbca8318994524ed09f5)I see that `cause-error` has been mentioned a few times, but has (or should) a bug be raised to make its basic behaviour conform to that of R2/R3? It seems a bit strange having to wrap simple strings in a redundant block:

```
cause-error 'user 'message ["blah"]
```

endo64

[21:55](#msg5c3d055c39596c372be0b3c6)@Dobeash I think yes, for R2/R3 compatibility you can raise a ticket, or you can directly make that change and send a pull request.

greggirwin

[22:24](#msg5c3d0c0335350772cf3038a3)We can probably just switch to `compose` from `reduce` and change the spec.

```
cause-error: func [
    {Causes an immediate error throw, with the provided information} 
    err-type [word!] 
    err-id [word!] 
    args [block! string!] 
][
    args: compose [(:args )]
    do make error! [
        type: err-type 
        id: err-id 
        arg1: first args 
        arg2: second args 
        arg3: third args
    ]
]
```

endo64

[22:25](#msg5c3d0c4595e17b4525508ce0)Yep, exactly.

## Tuesday 15th January, 2019

Oldes

[10:59](#msg5c3dbd1a95e17b452554e309)It looks that initialization of `vector` from `binary` is not working as expected. There should be an error or preferably valid initialization (using the raw data):

```
>> make vector! [integer! 16 2 #{00010002}]
== make vector! [integer! 16 [0 0]] ;<- I would prefer: make vector! [integer! 16 [1 2]]
```

[11:02](#msg5c3dbdaf0721b912a5829daf)Or maybe there could be some flag which could specify which endianness to use (which could be used also when converting vector back to binary)?

meijeru

[11:06](#msg5c3dbeb98318994524f1c1c9)@Oldes The use of binary values for initialization is not implemented. I agree there should be an error. If you really need the facility, you could make a wish.

Oldes

[11:08](#msg5c3dbf3cf780a1521f130608)I would rather like to know if this is something what anybody else like (because I think that `vector` &lt;-&gt; `binary` conversion is a key feature of `vector` type). And if so, if we should take care of the endianness or keep it on user.

[11:21](#msg5c3dc25020b78635b628212f)Current `vector` initialization DSL simply ignores anything following the length info:

```
>> make vector! [integer! 16 2 blabla]
== make vector! [integer! 16 [0 0]]
```

hiiamboris

[11:29](#msg5c3dc4318318994524f1e86b)I'd like to see vectors filled with a given init value. Especially, of non-integer type.

greggirwin

[19:58](#msg5c3e3b5aba5936605bc5c150)It would be good to start a design chat for that, either in the main Red room, with someone keeping notes in a doc, or in a wiki page, or have someone champion it in a REP. You can't use `to` on vectors, or convert them to binary values. We could start by having @gltewalt begin work on a doc page for vectors, so we know what is expected today.

rebolek

[20:25](#msg5c3e41a120b78635b62ba31a)There's https://gitter.im/red/red/vector-datatype room for it.

Dobeash

[21:06](#msg5c3e4b701cb70a372ae45b7e)Is this a known issue?

```
; R2/R3
>> to time! "1:00PM"  
== 13:00
; Red
>> to time! "1:00PM"
== 1:00:00
```

greggirwin

[21:22](#msg5c3e4f1ff780a1521f16e6d8)Thanks @rebolek.

endo64

[21:49](#msg5c3e557d95e17b4525591ae2)@Dobeash I don't think so. Would it be a wish ticket instead of a bug (compatibility) report.  
We can note that in https://github.com/red/red/wiki/%5BDOC%5D-Differences-between-Red-and-Rebol  
Also

```
>> to time! "13:00PM"
== none ; R2
== 13:00 ;Red
== Error ;R3
```

greggirwin

[21:52](#msg5c3e5616c45b986d1167f216)

```
>> load "13:00PM"
== [13:00:00 PM]
```

[21:53](#msg5c3e566332a8370605d93efa)So you can see how it is currently lexed. Meridian designations are not part of the `time!` form, as spec'd: https://doc.red-lang.org/en/datatypes/time.html#\_literal\_syntax

[21:55](#msg5c3e56d78ce4bb25b8b945b2)+1 for noting it in differences.

[21:59](#msg5c3e57bd8ce4bb25b8b94a48)Note, also that any time value past 12:59, with PM attached, returns `none` in Rebol if `to` is used. It lexes as an error there. Same in reverse, for 13:00 to 24:00 with AM attached.

endo64

[21:59](#msg5c3e57cd32a8370605d945ff)Noted https://github.com/red/red/wiki/%5BDOC%5D-Differences-between-Red-and-Rebol#to-time

greggirwin

[22:12](#msg5c3e5ae1f780a1521f172f42)This is one of those things that seems really nice to support, at a glance, but hits limits pretty quickly. The normal form for times won't use it, and you can't trust users to get it right, to just load data, so it's value only comes if Reducers are writing the values directly, which doesn't seem enough to justify supporting it. We could start with some helpers, and see what forms people think are most useful.

## Wednesday 16th January, 2019

gltewalt

[04:20](#msg5c3eb1220999400604fad3ea)Vector is next up.

hiiamboris

[10:07](#msg5c3f026dba5936605bca8bfe)@dockimbel can you take a look at https://github.com/red/red/issues/3739 ?

dockimbel

[10:28](#msg5c3f07461cb70a372ae8fd5b)@hiiamboris Sure. I'm glad to see more people looking and playing with the reactive framework as it is a really new approach in the Redbol world. I am wondering also if we should have a debug function that will pretty-print the whole graph in text or graphic mode, as it would be really helpful. The current `dump-reactions` function is too limited.

[10:49](#msg5c3f0c22c45b986d116c80f8)@hiiamboris Gave you a quick workaround and review in the ticket.

hiiamboris

[10:54](#msg5c3f0d82f780a1521f1ba793)@dockimbel Thank you. React is currently quite unreliable because of this. I hope you can fix it. Graph visualization idea is great indeed! I might take on it sometime later...

[11:02](#msg5c3f0f5ac45b986d116c9929)`system/reactivity/debug?: yes` - not so helpful. Could be better if it also shown the memory address of the function relation being called, and that of the object that triggered it. Although I suspect GC can relocate those, so there needs to be another entity identification method...

dockimbel

[11:35](#msg5c3f171a35350772cf3d54e8)@hiiamboris Memory address? It's all at Red level, not at R/S level. A series buffer address in memory wouldn't be helpful.

hiiamboris

[11:44](#msg5c3f191395e17b45255df24f)I see. Well, then there's no tool like the old-fashioned print ☺

nedzadarek

[11:46](#msg5c3f19a0dab15872cea25c2a)@hiiamboris Graph visualization would be \*\*HUGE\** help for understanding reactivity.

rebolek

[11:48](#msg5c3f1a0f8ce4bb25b8be1f93)is it something that can be done in userspace?

dockimbel

[11:49](#msg5c3f1a5035350772cf3d6861)@rebolek The whole reactive engine is ~300 lines of pure Red code. It relies on object's events to detect changes.

[11:50](#msg5c3f1a7a20b78635b6313082)https://github.com/red/red/blob/master/environment/reactivity.red

rebolek

[11:52](#msg5c3f1af495e17b45255dfe62)So it could be, I guess. And it could help me to get more familiar with the reactivity in Red.

hiiamboris

[11:53](#msg5c3f1b468318994524fae80b)Okay. Maybe we could even hook to it to make live step by step overview of events as they happen.

rebolek

[11:54](#msg5c3f1b638ce4bb25b8be2837)Hmm.

hiiamboris

[11:55](#msg5c3f1ba520b78635b6313ae6)I mean, on a graph. In a separate window probably.

dockimbel

[11:55](#msg5c3f1bb08ce4bb25b8be2adb)@hiiamboris  
&gt; Okay. Maybe we could even hook to it to make live step by step overview of events as they happen.

That is what `system/reactivity/debug?: yes` gives you already (just a object event level view though). If you hook to it, remember that existing Red functions have been compiled in the environment provided by the runtime library, so you can't directly change such code, you have to reconstruct the functions from their spec + body blocks.

[11:59](#msg5c3f1c86cb47ec3000511dd2)@hiiamboris  
&gt; I mean, on a graph. In a separate window probably.

That would be really helpful, and a good candidate for a console plugin app (once we get that plugin API out).

xqlab

[13:52](#msg5c3f370920b78635b631fb7d)

```
-== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> about
Red 0.6.4 for Linux built 11-Jan-2019/3:18:27+01:00 commit #5e37a10

>> parse "" [any x:]
== true
>> parse " " [any x:]

*** Runtime Error 1: access violation
*** at: 08067E63h
```

same on windows and with some

hiiamboris

[13:59](#msg5c3f38adcb47ec300051eeae)Confirmed

```
*** Runtime Error 98: assertion failed
*** in file: /D/devel/red/red-src/red/runtime/parse.reds
*** at line: 563
***
***   stack: red/parser/loop-token 00000062h 00465616h 1328 1637192 00000001h 16 7
***   stack: red/parser/loop-token 02A30C90h 02C67714h 0 -1 0018FBC0h 0 0
***   stack: red/parser/process 02A30C90h 028304A4h 0 0 02830484h
***   stack: red/natives/parse* false -1 0 -1
***   stack: red/interpreter/eval-arguments 02A105C4h 02C66FA4h 02C66FA4h 00000000h 00000000h
***   stack: red/interpreter/eval-code 02A105C4h 02C66F84h 02C66FA4h false 00000000h 00000000h 02A105C4h
***   stack: red/interpreter/eval-expression 02C66F84h 02C66FA4h false false false
***   stack: red/interpreter/eval 02830464h true
***   stack: red/natives/catch* true 1
***   stack: ctx473~try-do 00B61C8Ch
***   stack: ctx473~do-command 00B61C8Ch
***   stack: ctx473~eval-command 00B61C8Ch
***   stack: ctx473~run 00B61C8Ch
***   stack: ctx473~launch 00B61C8Ch
```

nedzadarek

[15:45](#msg5c3f517c0999400604fee689)@xqlab @hiiamboris

```
parse " " [any x:]
; == false
```

`Red 0.6.4 for Windows built 22-Nov-2018/1:40:38+01:00 commit #755eb94` and `Red 0.6.4 for Windows built 22-Nov-2018/1:40:38+01:00 commit #755eb94` work.  
`red-26dec18-7369fa2e`, `gui-console-2019-1-11-8330` and `gui-console-2019-1-1-51753` doesn't work.

## Thursday 17th January, 2019

dockimbel

[01:13](#msg5c3fd6cdf780a1521f2109c3)@nedzadarek Good finding! Please add it to the ticket.

lepinekong\_twitter

[10:53](#msg5c405eb18318994524034845)Don't know if it is a bug but it's really annoying: when creating a folder, it is locked if we are in that folder for renaming it in vscode for example.

nedzadarek

[11:09](#msg5c40624dba355012a451eee4)@dockimbel \[done](https://github.com/red/red/issues/3740#issuecomment-455133906)

hiiamboris

[13:16](#msg5c40804995e17b452566f180)I've been looking at the definition of `is~` function...  
1\) It collects `word!`-s of the same reactor, but ignores `get-word!`s. So `[x: 1 y: is [x * 2]]` will work but `[x: 1 y: is [:x * 2]]` won't. Is it by design?  
2\) It ignores set-paths, likely letting react deal with those, but will create (useless) reactions from any other path type:

```
>> a: make reactor! [x: 1]
>> b: make reactor! [x: 1 y: is [a/x * 2]]
```

creates 2 reactions: one from `react` (that actually sets 'y') and one from `is` (that's just a dead weight). It would've made sense to create a reaction for `a/:x`(doesn't happen) but not for `a/x`(does happen).  
3\) This is an intended backdoor to force the initial value?

```
>> a: make reactor! [x: 1]
>> b: make reactor! [y: is [[3] 2 * a/x]]
== make object! [
    y: 3
]
```

toomasv

[13:32](#msg5c4083e6f780a1521f252d69)Seems to be scroller bug for panel with vertical scroller (W10). It shows `event/key` names for horizontal bar while clicking on vertical:

```
view [panel with [flags: 'scrollable] on-scroll [probe event/key]]
```

hiiamboris

[13:54](#msg5c40890f95e17b4525672d34)Hmm. Is scrollable even working? On W7 it seemingly only harms the GUI console.

endo64

[14:26](#msg5c409091f780a1521f2582f1)Also `? or`, `? not` etc. works but `? is` doesn't `*** Script Error: is operator is missing an argument`

hiiamboris

[14:42](#msg5c409443f780a1521f259ac5)It's because `is` takes its left operand literally.

endo64

[14:44](#msg5c4094eb8ce4bb25b8c7cfaa)`>> ? +` also works.

nedzadarek

[15:18](#msg5c409caec45b986d1176c21f)@hiiamboris  
:+1:

```
>> f: make op! func ['a b] [42]
== make op! [['a b]]
>> ? f
*** Script Error: f operator is missing an argument
```

Oldes

[15:44](#msg5c40a2e5ba355012a453a08f)@dockimbel should not be possible to use \_accessors_ (which are defined in `system/catalog/accessors`) also as a `field` argument of `reflect` action? Or what are your future plans for `reflect`?

toomasv

[16:05](#msg5c40a7e2f780a1521f2625cd)@hiiamboris `scrollable` works nicely with some other faces I have tried, e.g. `rich-text` and `base`.

Oldes

[22:00](#msg5c40faefc45b986d11795ba0)Is this expected behavior:

```
>> make-dir %test
== %test/
>> read %test/
== []
>> read %test
*** Access Error: cannot open: %test
*** Where: read
*** Stack:
```

Strange is, that it is different to:

```
>> read %./
== [%.appveyor.yml %.editorconfig %.git/ %.github/ %.gitignore-sample %.travis.yml %.vs/ %boot.red %bridges/...
>> read %.
== [%.appveyor.yml %.editorconfig %.git/ %.github/ %.gitignore-sample %.travis.yml %.vs/ %boot.red %bridges/...
```

dander

[22:35](#msg5c41033ccb47ec30005dca2c)@Oldes that is interesting. It seems like one difference to them is that `%.` or `%..` would only be able to refer to a directory (I don't think files with those names would be allowed at least), but this behavior seems inconsistent with the above example

```
>> dir? %.
== false
>> dir? %./
== true
>>
```

Oldes

[22:37](#msg5c4103999bfa375aab19e695)`dir?` is just checking for `/` char at tail, not if it really is existing directory:

```
dir?: func [{Returns TRUE if the value looks like a directory spec} file [file! url!]][#"/" = last file]
```

dander

[22:39](#msg5c410417dab15872ceaefade)I just mean if `read` has a special case for `%.`, then `dir?` should as well (or vise versa)

Oldes

[22:40](#msg5c41045327611d4204be58fa)The `dir?` is fine... but `read %test` should be same like `read %test/` if the directory exists.

[22:41](#msg5c410490f780a1521f28a8b3)Strange is, that it works for `%..` and `%.`. Probably because (as you say) it must be directory.

dander

[22:48](#msg5c41064f1cb70a372af63801)I guess you are right that `dir?` behavior can be different because it doesn't perform any access to check

## Friday 18th January, 2019

greggirwin

[01:54](#msg5c4131c10721b912a59939f5)@hiiamboris more good research. Please add notes to https://github.com/red/red/wiki/%5BDOC%5D-Reactivity so we can track, and @dockimbel has a single reference source for what we know.

[01:57](#msg5c4132a7831899452408e113)Consistency makes sense for `dir?` and special cases. It can easily check for those.

&gt; but read %test should be same like read %test/ if the directory exists.

@Oldes why should it do that? And should it only work if a %test file doesn't also exist? %. and %.. are special cases, which \*look* like filenames, but are widely standardized as directory names.

hiiamboris

[04:57](#msg5c415cb2831899452409d6a9)%test file cannot \*also* exist where %test/ directory exists

greggirwin

[06:33](#msg5c417342ba355012a458c4cf)I thought some OSs allowed it. If not, my mistake.

[06:34](#msg5c41736235350772cf4cb317)May be a case sensitive thing as well.

hiiamboris

[08:22](#msg5c418cacdab15872ceb21521)@greggirwin where did your \[get-word PR](https://github.com/red/red/pull/3148) go? Last change to `is` is dated 3 years ago https://github.com/red/red/blame/master/environment/reactivity.red. Same for the tests https://github.com/red/red/blame/master/tests/source/units/reactivity-test.red

[08:48](#msg5c4192c88ce4bb25b8ce18e1)Regarding https://github.com/red/red/wiki/\[DOC]-Reactivity#issue-with-panels-as-reactive-sources  
I don't understand why you put bugs into wiki, not into the issue tracker? @greggirwin @toomasv

[13:39](#msg5c41d6ff9bfa375aab1f29e1)@dockimbel in addition to \[`is` questions](https://gitter.im/red/bugs?at=5c40804995e17b452566f180), some `react` questions:  
4\) \[Here](https://github.com/red/red/blob/5e37a10f19f9a4f27d0fdc34e8c58797a0763824/environment/reactivity.red#L270) and \[here](https://github.com/red/red/blob/5e37a10f19f9a4f27d0fdc34e8c58797a0763824/environment/reactivity.red#L322) `react` initially evaluates every reaction (block or function) \*\*once for every input of it\*\*. It's rather inefficient, no? If there's a justification for this, let's document it. If it's an oversight, let's fix it.  
5\) It looks like `react` when used with a block \[supports deeply nested paths](https://github.com/red/red/blob/5e37a10f19f9a4f27d0fdc34e8c58797a0763824/environment/reactivity.red#L325). I suppose it is for constructs like `a/(b/x)/y`. Shouldn't `react/link` branch support it too?

Oldes

[15:13](#msg5c41ecfe35350772cf4fa900)@dockimbel Is there any reason why `refinement!` is not part of `any-word!` or is it just oversight?  
In `Rebol`s:

```
>> any-word? /ref
== true
```

In `Red` it is `false`.

[15:16](#msg5c41edbf9bfa375aab1fc88c)Also it looks that `issue!` cannot be used as a key of `map!`:

```
>> make map! [a 1 b: 2 :c 3 'd 4 "a" 7 <b> 8 9 9 %f 10]
== #(
    a: 1
    b: 2
    c: 3
    d: 4
    "a" 7
    <b> 8
    9 9
    %f 10
)
```

While with issue:

```
>> make map! [#is 11]
*** Script Error: issue! type is not allowed here
*** Where: make
*** Stack:
```

9214

[19:39](#msg5c422b69dab15872ceb640e1)Red:

```
>> [/:a]
== [/: a]
```

Rebol:

```
>> [/:a]
== [/ :a]
```

[19:57](#msg5c422fc5c45b986d1180fed8)Worth to note as a difference between the two (@endo64). In the grand scheme of things, however, these "rules of sticky-ness" should be formalized, including cases where ommiting space separators between tokens is acceptable, e.g. `a[]` or `(){}` (@meijeru).

endo64

[23:05](#msg5c425ba69bfa375aab22c875)@9214 Added to the diff wiki, not sure if it should be treated as lexer difference. Please correct it if it's incorrect.  
https://github.com/red/red/wiki/%5BDOC%5D-Differences-between-Red-and-Rebol#lexer

9214

[23:06](#msg5c425be40721b912a5a0d442)Thanks.

## Saturday 19th January, 2019

lepinekong\_twitter

[13:52](#msg5c432baf7a0f4d5b19d413a5)do-thru regression between 6.0.3 gui-console-2018-6-18-47628.exe and latest 6.0.3 gui-console-2017-8-3-49893.exe, though it generally works, I don't know why it fails with this url https://codeops.red/get-latest-version.red see screencopy below  
https://i.imgur.com/JKS71Qb.png

endo64

[19:03](#msg5c43749ddab15872cebe1247)@lepinekong\_twitter What do you mean by `latest 6.0.3 gui console`?  
Latest version is 0.6.4, I tested it with `Red 0.6.4 for Windows built 11-Jan-2019/5:18:27+03:00 commit #5e37a10` and it works.  
Sorry imgur.com doesn't work here so couldn't see the screenshot.

lepinekong\_twitter

[19:07](#msg5c4375899bfa375aab2977c8)@endo64 this one https://static.red-lang.org/dl/win/red-063.exe

[19:09](#msg5c4375fb20b78635b64d5c3d)@endo64 I can't use 0.6.4 with some of my programs at the moment, it crashes with 0.6.4 so I need to find why and refactor, that's why I'm using 0.6.3. It is probable it's the same behavior in 0.6.4 I haven't tested yet.

endo64

[19:13](#msg5c4376d9ba355012a4658fa1)I tested the URL with red-063.exe, worked for me.

greggirwin

[22:50](#msg5c43a9bf746d4a677add0c0b)@Oldes Red has `all-word!`, which includes `refinement!` and `issue!`. It's possible the word typeset names could change, but we need a good one for the base word types then.

[22:51](#msg5c43a9f48ce4bb25b8db2255)@hiiamboris on wiki vs tickets, it may have been that notes were made when the reactive system was new, not stress tested as you are doing now, and it seemed like the best idea at the time.

## Sunday 20th January, 2019

hiiamboris

[09:36](#msg5c444111ba355012a46a3320)I see... Anyway, I'll remove those snippets from the wiki when I get myself to cover reactivity in more depth, since it's not a reactivity bug but a coding mistake.

## Monday 21st January, 2019

hiiamboris

[06:11](#msg5c45628035350772cf64ae7c)@dockimbel before I forget, I have 2 more general questions to add to :point\_up: \[January 18, 2019 4:39 PM](https://gitter.im/red/bugs?at=5c41d6ff9bfa375aab1f29e1):  
6\) what was your rationale at that time, for choosing \*\*async\** reactivity model?  
7\) and that behind fixing the reaction source, not letting it to be changed?

[13:44](#msg5c45ccc5f780a1521f463913)\*\*An announcement, sort of, for all of you contributors.\** ☻

Once while I was digging deeper into Red I found out that I'm constantly asking myself, "what does thing do?", "where is it defined?", "how is it supposed to be used?", "what parts depend on it?" and so on... I was constantly searching through the source code for stuff, only to forget what I've found just a minute ago and go search again. And GitHub's search is even more boring and useless.

So I decided to automate this process a little bit for me and wrote \[this little program](https://gitlab.com/hiiamboris/red-codex/tree/master). I find it a big help already. I however hope that you too will find it useful. Please let me know if there's anything I can do to make it work for each one of you!

rebolek

[13:45](#msg5c45cd011cb70a372a139296):+1:

[13:46](#msg5c45cd28c45b986d1196fcb3)Your choice of font and colors is ... interesting :smirk:

hiiamboris

[13:48](#msg5c45cda9746d4a677aea006b)(: Thanks.  
It should blend to native colors by default, but you can enable the (displayed) vaporwave skin in the script if you install the \[ZX Spectrum-7 font](https://www.dafont.com/zx-spectrum-7.font).

toomasv

[14:57](#msg5c45ddd61cb70a372a140639)@hiiamboris It indexed everything, but no interface appeared after that.

hiiamboris

[15:08](#msg5c45e0598ce4bb25b8e8907b)@toomasv did it report some error or just quitted silently?

toomasv

[15:08](#msg5c45e07fdab15872ceccb3c9)@hiiamboris No error. Just silence.

hiiamboris

[15:09](#msg5c45e0998ce4bb25b8e892f6)Lemme try on W8.1

[15:12](#msg5c45e15e7a0f4d5b19e4adb3)True. You've just found another crash on W8+ ☺

[15:15](#msg5c45e20b9bfa375aab38694a)

```
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/modules/view/backends/windows/gui.reds
*** at line: 143
***
***   stack: gui/get-node-facet 00000000h 0
***   stack: gui/get-facet 0050AD3Ch 0
***   stack: gui/process-command-event 003B003Ah 273 16777216 14484762
***   stack: gui/WndProc 003B003Ah 273 16777216 14484762
```

[15:38](#msg5c45e78c7a0f4d5b19e4da7d)https://github.com/red/red/issues/3753  
@toomasv you can comment \[line 287](https://gitlab.com/hiiamboris/red-codex/blob/master/redcodex.red#L287) as a temporary workaround until the bug is fixed

[15:42](#msg5c45e87e0a491251e330e27e)I've found ~20 bugs while I was writing that. Feels like being a sapper ☺

meijeru

[15:43](#msg5c45e8b30721b912a5b64d25)@hiiamboris Nice! It looks much more interactive than my \_red-concordance_ published \[here](https://gist.github.com/meijeru/ce66cfaf6c4ef8add2ab2065541449a1). Also, apparently you work with parse, whereas I did a simple recursive descent. For simple text searches -- not at all interactive -- I use my own version of \_grep_ , published \[here](https://gist.github.com/meijeru/badcc5184f312aedf51a010b4718a148). I have more or less the same needs as you, but I got by with these two tools until now. I will try to use yours and see if it is more effective.

toomasv

[15:45](#msg5c45e92fdab15872ceccf24f)@hiiamboris Thanks! Interface opened, but only left panel works. Right-panel stays empty while clicking on file-names on left.

hiiamboris

[15:49](#msg5c45ea26f780a1521f470953)@toomasv you right-click on em?

toomasv

[15:50](#msg5c45ea53ba355012a474db6f)Aah. Sorry, right-click works. Thanks!

hiiamboris

[15:51](#msg5c45ea721cb70a372a146307)Yeah, I may have a little strange UX ideas :)

meijeru

[15:57](#msg5c45ebe61cb70a372a146d4b)Found an interpreter bug (I think):

```
foreach f fs pick [
		[index-file f]
		[unless find f "tests/" [index-file f]]
	] config/include-tests?
```

(%red-codex.red line 176-179) give the following error message:

```
*** Compilation Error: expected a block for FOREACH-BODY instead of word! value 
*** in file: C:\Users\Eigenaar\Projects\Red\IDEs\code-viewer\red-codex.red
*** near: [pick [
        [index-file f] 
        [unless find f "tests/" [index-file f]]
    ] config/include-tests?]
> Terminated with exit code 1.
```

[15:58](#msg5c45ec210a491251e330fb0f)It has happened before that the toolchain expected a literal block where a "computed block"would have been useful.

hiiamboris

[16:00](#msg5c45eca0746d4a677aeadc64)Oh! You can forget about compiling it without `-e`. It's hopeless :) Even if you succeed it will just do nothing or crash. I'm using `red -r -e redcodex.red` to compile it. I also did a little benchmark to compare source code parsing speed with `-r` and `-r -e` and the former is only like 12% faster, so I abandoned that idea.

[16:04](#msg5c45ed8b20b78635b65cb2b1)@meijeru With concordance I'm stuck at preparing the lexer...

meijeru

[16:06](#msg5c45edf19bfa375aab38c064)Sorry! Not an interpreter bug obviously, but a compiler one. The interpreter works fine. But has that particular compiler bug been reported already?

hiiamboris

[16:08](#msg5c45ee6f7a0f4d5b19e50cc3)I think not. I think I had a similar issue with `loop` - I fed it with a dynamic block, and @dockimbel said it's a known limitation not worth the trouble reporting it.

meijeru

[16:14](#msg5c45efcc831899452425f5a9)What difficulty exactly do you experience with the lexer adaptation? Is \[this one](https://gist.github.com/meijeru/202c25f124e075ff5be85dff1beeda15) not good? I ran it just now and it works for me...

hiiamboris

[16:18](#msg5c45f0c40721b912a5b68531)Yes this one works @meijeru ! I like how thorough your `analyze` func is.

meijeru

[16:44](#msg5c45f6d00721b912a5b6af53)@hiiamboris Accepting the limitation of the compiler for the moment, the code explorer should work in interpreter mode, shouldn't it? For me, it shows a console briefly and then quits. W10 64 bits, using commit 5e37a10f1 (one but last).

hiiamboris

[16:46](#msg5c45f749c45b986d1198354c)@meijeru I can't test on W10 unfortunately. Have you commented the line 287? And do you run it from the directory where `red.r` is located, with also `glob.red` being present there?

[17:02](#msg5c45fb12f780a1521f478170)@meijeru https://gitlab.com/hiiamboris/red-codex/tree/w8tempfix I made changes to both source &amp; binary for W8+, it works on my W8.1 and apparently on @toomasv's W10. By the way, I'm compiling it with my modified reactivity engine (https://github.com/red/red/pull/3748), so the exe should behave a little better than the source in terms of GUI event handling.

toomasv

[18:47](#msg5c4613b4c45b986d1199021f)@hiiamboris @meijeru Yes, it works with W10, although it's somewhat brittle, crashing now and then :). Nevertheless, it is of great help!

hiiamboris

[18:54](#msg5c4615558ce4bb25b8ea01d6)@toomasv Glad you like it. Actually it never crashed on W7. Does it do that often enough to reproduce and isolate the crash?

toomasv

[19:07](#msg5c4618857a0f4d5b19e640bc)@hiiamboris It sometimes crashes just when I enter the search word after initialization. Sometimes not. If it stays on its feet after entering the search word then it can crash after I right-click, but it has greater chances of survival if I first left-click. Don't have yet clear regularities.

hiiamboris

[19:15](#msg5c461a38cb47ec30007d5f24)I've encountered myself two irregular bugs there:  
\- sometimes focus is just lost from every face, totally  
\- sometimes a press of Enter inserts a newline into an area created in result of that key press

Couldn't see a pattern yet. But then these are just tiny annoyances. Crash has bigger priority ☺

[19:18](#msg5c461b020a491251e3324557)@toomasv you can add `needs: view` to https://github.com/red/red/blob/master/environment/console/CLI/console.red and save it as `console-view.red`, then compile it in debug mode: `rebol -qws --do "do/args %red.r {-r -d %environment/console/CLI/console-view.red} quit"` and then run the script as `cmd /k console-view redcodex.red` so when it crashes it at least will leave you a hint - why

endo64

[21:29](#msg5c4639a20721b912a5b87a35)It looks great, but couldn't make it work :(  
First downloaded the executable, it crashed immediately.  
Then downloaded the source file, couldn't compile: `*** Compilation Error: expected a block for FOREACH-BODY instead of word! value`  
Then encapped with `-e`, nothing happened when executed (no output at all)

[21:29](#msg5c4639b5746d4a677aed0484)I'm on Win10 x64.

## Tuesday 22nd January, 2019

hiiamboris

[07:07](#msg5c46c1367a0f4d5b19ea4c56)You can level up Red's Win10 support then by diagnosing the crashes. I believe in you all! ☺

gltewalt

[09:13](#msg5c46deccdab15872ced308c4)Only have Win7

meijeru

[13:21](#msg5c4718df746d4a677af25e11)On the problem of literal body blocks being required for almost all control flow constructs, see \[REP 41](https://github.com/red/REP/issues/41). I made this just not to forget the matter.

hiiamboris

[13:55](#msg5c4720da7a0f4d5b19eccbfb):+1:

ericguedespinto

[14:04](#msg5c4722d4c45b986d119fb09c)I noticed that ‘allocate’ in R/S works differently in Win7 (it works as malloc) than in macOS (where it works as calloc). This meant an illegal memory access crash in win when it worked fine in macOS. Is this intencional?

hiiamboris

[14:14](#msg5c472528ba355012a47cba74)@ericguedespinto `calloc` isn't even imported by Red runtime. Do you mean MacOS zero-fills the RAM requested by `malloc`?

[14:20](#msg5c4726b79bfa375aab40b001)I see, you mean the MAP\_ANONYMOUS flag in `mmap` does that...

ericguedespinto

[14:25](#msg5c4727d220b78635b664bddc)@hiiamboris yes! I used it to check if a given structure field had been allocated or not. It worked on mac but not on win. Solved it by implicitly initialising it to 0.

hiiamboris

[14:38](#msg5c472aca20b78635b664d23c)@ericguedespinto It seems to me that on Windows it should use VirtualAlloc which also zero-fills the region.

[14:38](#msg5c472afb8ce4bb25b8f0e39a)Do you have any snippet that can show the difference between W7 and Mac?

[14:44](#msg5c472c4483189945242e10ea)`allocate` itself is an imported `malloc`. So if you used it and got zero memory you might just have been lucky that's all ;)

ericguedespinto

[15:00](#msg5c47300cba355012a47d0729)@hiiamboris This is the code that I have been playing with. It is an implementation of a graph:

```
Red/System [
    	title: {graph datatype}
    ]
    property!: alias struct! [
    	propKey		[ c-string! ]
    	propValue	[ c-string! ]
    	type		[ byte! ]
    	nextPropId	[ property! ]
    ]
    
    relationship!: alias struct! [
    	firstNode	[ struct! [
    					nextRelId	[ relationship! ]
    					lastRelId	[ relationship! ]
    					nextPropId	[ property! ]
    					lastPropId	[ property! ]
    					extra		[ byte! ]	
    				] ]
    	secondNode	[ struct! [
    					nextRelId	[ relationship! ]
    					lastRelId	[ relationship! ]
    					nextPropId	[ property! ]
    					lastPropId	[ property! ]
    					extra		[ byte! ]	
    				] ]
    	firstPrevRelId		[ relationship! ]
    	firstNextRelId		[ relationship! ]
    	secondPrevRelId		[ relationship! ]
    	secondNextRelId		[ relationship! ]
    	nextPropId          [ property! ]
        lastPropId          [ property! ]
        directed            [ logic! ]
    ]
    
    node!: alias struct! [
    	nextRelId	[ relationship! ]
        lastRelId   [ relationship! ]
    	nextPropId	[ property! ]
    	lastPropId	[ property! ]
    	extra		[ byte! ]	
    ]
    
    graph: context [
        add-property-to-node: func [ n [ node! ] propKey [ c-string! ] propValue [ c-string! ] type [ byte! ] return: [ property! ] /local lp ][
            lp: as property! allocate size? property!
            lp/propKey: propKey
            lp/propValue: propValue
            lp/type: type
            if (as integer! n/lastPropId) <> 0 [                    ; there is already a previous property in the node
                n/lastPropId/nextPropId: lp
                n/lastPropId: lp
            ] 
            if (as integer! n/nextPropId) = 0 [                     ; there is no previous property in the node
                n/nextPropId: lp
                n/lastPropId: lp
            ] 
            lp
        ]
    	new-node: func [ return: [ node! ] /local n p ] [
    		n: as node! allocate size? node!
		n/nextRelId: as relationship! 0
		n/lastRelId: as relationship! 0
		n/nextPropId: as property! 0
		n/lastPropId: as property! 0
            n
    	]	
        add-property-to-relationship: func [ r [ relationship! ] propKey [ c-string! ] propValue [ c-string! ] type [ byte! ] return: [ property! ] /local lp ][
            lp: as property! allocate size? property!
            lp/propKey: propKey
            lp/propValue: propValue
            lp/type: type
            if (as integer! r/lastPropId) <> 0 [                    ; there is already a previous property in the relationship
                r/lastPropId/nextPropId: lp
                r/lastPropId: as property! lp
            ] 
            if (as integer! r/nextPropId) = 0 [                     ; there is no previous property in the relationship
                r/nextPropId: lp
                r/lastPropId: lp
            ] 
            lp
        ]    
    	new-relationship: func [ firstNode [ node! ] secondNode [ node! ] directed [ logic! ] return: [ relationship! ] /local r ] [
    		r: as relationship! allocate size? relationship!
            r/firstNode: firstNode
            r/secondNode: secondNode
            r/directed: directed
            if (as integer! firstNode/lastRelId) <> 0 [             ; there is already a previous relationship in the first node
                r/firstPrevRelId: firstNode/lastRelId
                firstNode/lastRelId/firstNextRelId: r
                firstNode/lastRelId: r
            ]
            if (as integer! firstNode/nextRelId) = 0 [              ; there is no previous relationship in the first node
                firstNode/nextRelId: r
                firstNode/lastRelId: r
            ]
            if (as integer! secondNode/lastRelId) <> 0 [             ; there is already a previous relationship in the second node
                r/secondPrevRelId: secondNode/lastRelId
                secondNode/lastRelId/secondNextRelId: r
                secondNode/lastRelId: r
            ]
            if (as integer! secondNode/nextRelId) = 0 [              ; there is no previous relationship in the second node7
                secondNode/nextRelId: r
                secondNode/lastRelId: r
            ]
            r
    	]
        delete-node: func [ n [ node! ] ][
            ; delete each property from the node
            ; delete each relation to/from the node
        ]
        delete-relationship: func [ r [ relationship! ] n1 [ node! ] n2 [ node! ] ][
            ; delete each property from the relationship
            free as byte-ptr! r
        ]
        delete-property: func [ p [ property! ] n [ node! ] ][
            ; delete the property 'p' and redirect the previous property's nextPropId and the node's lastPropId
            free as byte-ptr! p
        ]
        probe-node: func [ n [ node! ] /local p r outgoing incoming ][
            p: n/nextPropId
            print [ "node: " n lf "properties: " lf ]
            while [ (as integer! p) <> 0 ][
                print [ p " > " p/propKey " : " p/propValue " : " as integer! p/type lf ]
                if p = n/lastPropId [ break ]
                p: p/nextPropId
            ]
            r: n/nextRelId
            if (as integer! r) <> 0 [
                while [ true ][
                    if n = r/firstNode [
                        print [ lf " -> outgoing relationship: " r lf "1st node: " r/firstNode " 2nd node: " r/secondNode " directed: " r/directed lf
                                "1st PrevRel:  " r/firstPrevRelId  " 1st NextRel:  " r/firstNextRelId lf
                                "2nd PrevRel: " r/secondPrevRelId " 2nd NextRel: " r/secondNextRelId lf 
                                "properties: " r/nextPropId lf
                        ]
                        p: r/nextPropId
                        while [ true ][
                            print [ p " > " p/propKey " : " p/propValue " : " as integer! p/type lf ]
                            if p = r/lastPropId [ break ]
                            p: p/nextPropId
                        ]
                    ]
                    if r/firstNode/lastRelId = r [ break ]
                    if (as integer! r/firstNextRelId) = 0 [ break ]
                    r: r/firstNextRelId
                ]
                r: n/nextRelId
                while [ true ][
                    if n = r/secondNode [
                        print [ lf " <- incoming relationship: " r lf "1st node: " r/firstNode " 2nd node: " r/secondNode " directed: " r/directed lf
                                "1st PrevRel:  " r/firstPrevRelId  " 1st NextRel:  " r/firstNextRelId lf
                                "2nd PrevRel: " r/secondPrevRelId " 2nd NextRel: " r/secondNextRelId lf 
                                "properties: " r/nextPropId lf
                        ]
                        p: r/nextPropId
                        while [ true ][
                            print [ p " > " p/propKey " : " p/propValue " : " as integer! p/type lf ]
                            if p = r/lastPropId [ break ]
                            p: p/nextPropId
                        ]
                    ]
                    if r/secondNode/lastRelId = r [ break ]
                    if (as integer! r/secondNextRelId) = 0 [ break ]
                    r: r/secondNextRelId
                ]
            ]
        ]	        
    ]
    
    n1: graph/new-node
    graph/add-property-to-node n1 "name" "starting node" as-byte 1
    graph/add-property-to-node n1 "second property" "pp" as-byte 12

    n2: graph/new-node
    graph/add-property-to-node n2 "name" "ending node" as-byte 4
    graph/add-property-to-node n2 "second property" "qq" as-byte 52
    
    r1: graph/new-relationship n1 n2 no
    graph/add-property-to-relationship r1 "number" "1" as-byte 2
    graph/add-property-to-relationship r1 "number" "2" as-byte 2

    r2: graph/new-relationship n2 n1 yes
    graph/add-property-to-relationship r2 "number" "3" as-byte 2
    graph/add-property-to-relationship r2 "number" "4" as-byte 2

    r3: graph/new-relationship n2 n1 no
    graph/add-property-to-relationship r3 "number" "5" as-byte 2
    graph/add-property-to-relationship r3 "number" "6" as-byte 2


    print [ lf "---" lf lf ]
    graph/probe-node n1
    print [ lf "---" lf lf ]
    graph/probe-node n2

    print [ lf "---" lf "n1/nextRel/firstNextRelId/firstNode" lf lf ]
    graph/probe-node n1/nextRelId/firstNextRelId/firstNode
    
    free as byte-ptr! n1
    free as byte-ptr! n2
    free as byte-ptr! r1
    free as byte-ptr! r2
    free as byte-ptr! r3
```

On the graph/new-node function I had to add the initializing bit to zero out the structure fields.  
I have been playing with this for a week on macOS and so far it has not failed, but in Win it failed straight away.  
In any case, it should behave similarly on both systems...

9214

[15:05](#msg5c4731267a0f4d5b19ed45b0)@ericguedespinto can you try to narrow it down to something more minimal?

hiiamboris

[15:06](#msg5c47315b0a491251e3391715)He uses `allocate` indeed... Well, if you're curious @ericguedespinto you can allocate a big chunk of RAM and scan it for non-zero bytes, to determine if you were lucky or MacOS' malloc is really special. If not, you can just use `zerofill` func or `allocate-virtual` from R/S runtime to ensure it's zero filled.

ericguedespinto

[15:14](#msg5c4733709bfa375aab410b87)I narrowed it down so that it only uses nodes and properties (no relationships).  
I am on Win now so I cannot test it under macOS.

```
Red/System [
    	title: {graph datatype}
    ]
    
    property!: alias struct! [
    	propKey		[ c-string! ]
    	propValue	[ c-string! ]
    	nextPropId	[ property! ]
    ]
    
    node!: alias struct! [
    	nextPropId	[ property! ]
    	lastPropId	[ property! ]
    ]
    
    graph: context [
        add-property-to-node: func [ n [ node! ] propKey [ c-string! ] propValue [ c-string! ] return: [ property! ] /local lp ][
            lp: as property! allocate size? property!
            lp/propKey: propKey
            lp/propValue: propValue
            if (as integer! n/lastPropId) <> 0 [                    ; there is already a previous property in the node
                n/lastPropId/nextPropId: lp
                n/lastPropId: lp
            ] 
            if (as integer! n/nextPropId) = 0 [                     ; there is no previous property in the node
                n/nextPropId: lp
                n/lastPropId: lp
            ] 
            lp
        ]
    	new-node: func [ return: [ node! ] /local n p ] [
    		n: as node! allocate size? node!
		;n/nextPropId: as property! 0                                              ; add it to work on Win
		;n/lastPropId: as property! 0
            n
    	]	
 
        probe-node: func [ n [ node! ] /local p r outgoing incoming ][
            p: n/nextPropId
            print [ "node: " n lf "properties: " lf ]
            while [ (as integer! p) <> 0 ][
                print [ p " > " p/propKey " : " p/propValue lf ]
                if p = n/lastPropId [ break ]
                p: p/nextPropId
            ]
        ]	        
    ]
    
    n1: graph/new-node
    graph/add-property-to-node n1 "name" "starting node" 
    graph/add-property-to-node n1 "second property" "pp" 

    print [ lf "---" lf lf ]
    graph/probe-node n1

    free as byte-ptr! n1
```

As it is it gives and \*\** Runtime error on Win but works fine on macOS.  
If you uncomment the 2 lines in graph/new-node, than it works fine on both.  
My concern is the dual behavior, not the extra keystrokes to initialize the memory...

hiiamboris

[15:20](#msg5c4734da35350772cf709d91)&gt; My concern is the dual behavior, not the extra keystrokes to initialize the memory..

As you can see here https://github.com/red/red/blob/master/system/runtime/libc.reds#L15 `allocate` is `malloc` so it wasn't designed to zero-fill the chunk. So it's totally expected for your code to fail ☺

9214

[15:20](#msg5c4734dbcb47ec3000845a84)For me this 2 lines are expected, and macOS' (lucky) behavior sounds odd.

ericguedespinto

[15:32](#msg5c4737a91cb70a372a1cf10c)@hiiamboris I tried allocate-virtual and zerofill and those give me an 'undefined symbol' error.  
I cannot find them on the R/S language specification.  
How do I use them?

hiiamboris

[15:39](#msg5c47394d35350772cf70bbe0)Yeah, good question. Better to address it to @qtxie or @dockimbel.

ericguedespinto

[15:40](#msg5c4739707a0f4d5b19ed8b84)Thanks

9214

[15:42](#msg5c4739ceba355012a47d523c)@hiiamboris prove me wrong, but `allocate-virtual` and `zerofill` belong to Red memory allocator, not to R/S runtime.

ericguedespinto

[15:54](#msg5c473cbbcb47ec300084926f)I couldn't find any R/S allocate-virtual or zerofill but I found the equivalent in set-memory

```
as node! set-memory allocate size? node! as byte! 0 size? node!
```

Not too pretty... but it works

meijeru

[15:55](#msg5c473cf28ce4bb25b8f167e6)`allocate-virtual` and `zerofill` are functions in `%runtime/allocator.reds`. `allocate-virtual` is only called from within `%runtime/allocator.reds`; `zerofill` is not called from within the toolchain (?)  
Information obtained through my `red-concordance` and `grep` utilities.

hiiamboris

[15:58](#msg5c473d9e83189945242e8abf)@9214 is totally correct. I'm misleading you @ericguedespinto, these work from Red only. In R/S you should use set-memory (memset) or just import calloc yourself. I think it should be faster than zerofill anyway, as these are written in asm.

ericguedespinto

[15:59](#msg5c473dfd7a0f4d5b19edae29)Thank you all  
living and learning...

9214

[16:01](#msg5c473e46c45b986d11a07513)@meijeru can your tool check if `fill 0` is used instead?

hiiamboris

[16:09](#msg5c47402835350772cf70fd57)`fill` is used in hashtable, binary and vector. `zerofill` is never used.

greggirwin

[23:08](#msg5c47a2740a491251e33c4374)@hiiamboris I get the access violation from redcodex as well, on Win10. Will try to make time to play with it soon. :+1:

## Wednesday 23th January, 2019

greggirwin

[02:53](#msg5c47d733ba355012a481671c)In other news, I made a simple PR for the `cause-error` change ticket, which resulted in CI failures and access violation errors. Odd. Backed out changes. Same errors. Thinking I was somehow forked up, I did a fresh clone of red/red and get a different fault.

`do %tests/run-all.r` (from Rebol, obviously) fail with an access violation in `run-all-interp` at test 2077:

```
--test-- "#2077"
		; NOTE: shouldn't override the `sum` func, or next tests using it may fail
		sum2077: function [list [block!]] [
			total: 0
			foreach i list [total: i + total]
			total
		]
		r2077: make reactor! [l: [3 4 5 6] total: is [sum2077 l]]
		r2077/l: append copy r2077/l 5
		--assert not error? try [append r2077/l 5]
		unset [sum2077 r2077]
```

@hiiamboris since you've been into reactor code recently, and @dockimbel made a change there a couple weeks ago, does this sound familiar at all? @qtxie doesn't see the error.

[02:54](#msg5c47d7689bfa375aab456ef8)BTW, @hiiamboris, thanks for the `qt-verbose` flag. :^)

hiiamboris

[08:17](#msg5c482304c45b986d11a675e5)@greggirwin I answered in the PR.

greggirwin

[21:50](#msg5c48e193831899452439a534):+1:

## Thursday 24th January, 2019

Dobeash

[11:35](#msg5c49a2f41cb70a372a2cabfc)Is this a known issue?

```
>> make map! reduce ['a 1]
== #(
    a: 1
)
```

rebolek

[11:36](#msg5c49a33b0a491251e3493102)@Dobeash all `word!`-based keys are treated as equals in `map!`

[11:37](#msg5c49a3718ce4bb25b80129dc)

```
>> m: make map! reduce ['a 1]
== #(
    a: 1
)
>> select m 'a
== 1
>> select m quote :a
== 1
```

BeardPower

[11:38](#msg5c49a3cfba355012a48d4315)@Dobeash What did you expect it to be?

Oldes

[12:02](#msg5c49a96c0721b912a5ced2ae)@BeardPower in `R3-alpha` it was not normalized:

```
>> m: make map! [a 1 b: 2 :c 3 'd 4 #e 5 /f 6 "a" 7 <b> 8 9 9 #"c" 10]
== make map! [
    a 1
    b: 2
    :c 3
    'd 4
    #e 5
    /f 6
    "a" 7
    <b> 8
    9 9
    #"c" 10
]
```

although still treated like same:

```
>> m/(quote a)
== 1

>> m/(quote 'a)
== 1

>> m/(quote :a)
== 1
```

rebolek

[12:03](#msg5c49a9979bfa375aab513675)Red's version makes more sense IMO.

Oldes

[12:06](#msg5c49aa361cb70a372a2ce593)@BeardPower one may expect `Ren-C`'s todays behaviour:

```
>> m: make map! [a: 1 :a 2]
== make map! [
    a: 1
    :a 2
]
```

although I'm not sure if it is useful enough

BeardPower

[12:07](#msg5c49aa95ba355012a48d7477)@Oldes I don't see any advantage of having keys like :a, /f or #e.

[12:08](#msg5c49aadadab15872cee539f0)Having a key like a get-word could make thinks even more troublesome.

Oldes

[12:09](#msg5c49aae295e17b4525a1392a)Me either.

rebolek

[12:09](#msg5c49ab050721b912a5cedf52)Having `issue!` as key makes sense, not sure why it's not allowed, unlike `get-word!`

[12:10](#msg5c49ab2495e17b4525a13c7b)

```
>> make map! [#a 1]
*** Script Error: issue! type is not allowed here
*** Where: make
*** Stack:  

>> make map! [:a 1]
== #(
    a: 1
)
```

BeardPower

[12:10](#msg5c49ab3ef780a1521f5f59b2)No, issue! is not allowed.

rebolek

[12:10](#msg5c49ab4e8ce4bb25b8016085)I know, I just don't understand why.

Oldes

[12:10](#msg5c49ab4ff780a1521f5f59e9)`/f` and `#e` are of `word!` type.. don't know, why they are treated differently in `Red`

BeardPower

[12:11](#msg5c49ab64dab15872cee53c43)@rebolek Where do you see an advantage of having issue! as a key?

nedzadarek

[12:11](#msg5c49ab778ce4bb25b8016247)@rebolek My guess is that `any-word!` is converted to the `word!`.

Oldes

[12:11](#msg5c49ab7b20b78635b6755691)@BeardPower can you explain me this?

```
>> all-word? #aa
== true
>> any-word? #aa
== false
```

rebolek

[12:12](#msg5c49abacc45b986d11b077a5)@BeardPower Saving one conversion. Explain to me, why `get-word!`is fine and `issue!` is not.

BeardPower

[12:14](#msg5c49ac3735350772cf80cb36)@Oldes

```
any-word!:	make typeset! [word! set-word! get-word! lit-word!] ;-- any bindable word
all-word!:	union any-word! make typeset! [refinement! issue!] ;-- all types of word nature
```

Oldes

[12:14](#msg5c49ac3f0a491251e3497523)@BeardPower having `issue!` as a key is useful in dialects... if you want fast lookup of preprocessed action for example (not that I would do that, but I can imagine that).

rebolek

[12:15](#msg5c49ac5920b78635b6755d68)@BeardPower but why...map values are not bound.

BeardPower

[12:15](#msg5c49ac6ddab15872cee5436d)@rebolek I'm not the designer of Red ;-)

Oldes

[12:16](#msg5c49ac83cb47ec300094b8ef)Personally I think, that its just overlook that issue and refinement are not allowed.

rebolek

[12:16](#msg5c49aca0dab15872cee543c4)Yeah, I think too.

BeardPower

[12:16](#msg5c49acad1cb70a372a2cf684)@Oldes Is issue! bindable?

[12:17](#msg5c49acc0746d4a677a032503)If it is, it should be in any-word!.

Oldes

[12:17](#msg5c49acc4f780a1521f5f64a8)Is `string!` bindable?

nedzadarek

[12:17](#msg5c49acc9c45b986d11b07e0a)\*\** Script Error: bind does not allow issue! for its word argument

BeardPower

[12:17](#msg5c49acd6dab15872cee544f4)@nedzadarek There we have it ;-)

[12:17](#msg5c49acf2dab15872cee545de)issue! is not bindable so it's not in any-word!.

nedzadarek

[12:18](#msg5c49ad170a491251e3497ab9)But, still, issue as key make sense.

Oldes

[12:18](#msg5c49ad1935350772cf80d12d)@BeardPower do you still remember, that we were talking about `map!` keys?

```
>> make map! [#aa 1]
*** Script Error: issue! type is not allowed here
*** Where: make
*** Stack:  

>> make map! ["aa" 1]
== #(
    "aa" 1
)
```

BeardPower

[12:18](#msg5c49ad28f780a1521f5f6745)@rebolek The question is, if it's good design using issue! as a key in the first place.

rebolek

[12:19](#msg5c49ad6283189945243e8cc1)@BeardPower As @Oldes wrote, it may come from dialect for example and in such case you need to do `to word! issue` before using it as key. But why.

BeardPower

[12:19](#msg5c49ad6edab15872cee54779)@nedzadarek But bind is only taking any-word and block, so it's obvious that it does not allow issue ;-)

[12:20](#msg5c49ad93ba355012a48d8af1)@Oldes Yes, I do. The question is what was the idea about keys?

rebolek

[12:20](#msg5c49ad941cb70a372a2cfc3f)But `bind`makes no sense in case of `map!`

nedzadarek

[12:21](#msg5c49adca0a491251e3497ff0)@BeardPower yes, it's obvious when you read doc :D

BeardPower

[12:21](#msg5c49adcb35350772cf80d620)@rebolek What is the idea of keys? Having any type? A specific type?

rebolek

[12:22](#msg5c49adf00a491251e34980a1)@BeardPower certainly no, if it can be any-word.

BeardPower

[12:22](#msg5c49adf1f780a1521f5f6b7a)@nedzadarek What I meant is that bind takes any-type and issue is not part of any-type so it's a chicken-egg issue.

rebolek

[12:22](#msg5c49ae16dab15872cee54cc9)Yes, the question is, why it takes any-word and not all-word

nedzadarek

[12:23](#msg5c49ae2883189945243e9273)`bind` takes `any-word!`/`block!` not `any-type!`.

[12:24](#msg5c49ae63c45b986d11b08a3a)^^ well, maybe we should move to the `/help` room? It's more suggestion than bug.

BeardPower

[12:24](#msg5c49ae9b0721b912a5cefae3)@rebolek It's just a design decision. E.g. PHP only allows integer and strings. Optimization? Resource usage? KISS?

[12:26](#msg5c49aefbba355012a48d9392)Only @dockimbel can answer the idea behind it.

rebolek

[12:27](#msg5c49af22f780a1521f5f72de)I understand. But I agree with @Oldes that it can and should be changed.

BeardPower

[12:27](#msg5c49af2cf780a1521f5f7374)Maybe because of REBOL compatibility?

[12:27](#msg5c49af30c45b986d11b08ee8);-- warning: following typeset definitions are processed by the compiler, do not change them  
;-- unless you know what you are doing!

[12:27](#msg5c49af43746d4a677a033a72)Or compiler limitations?

rebolek

[12:28](#msg5c49af5aba355012a48d95d7)I don't want to change typeset, just allow all-word, instead of any-word as key

BeardPower

[12:28](#msg5c49af6f8ce4bb25b801834a)To do that you need to change the type-set.

[12:29](#msg5c49af9ff780a1521f5f76ac)any-word and all-word are type-sets.

Oldes

[12:29](#msg5c49afb983189945243ea027)@one can just add 2 words into this block: https://github.com/red/red/blob/master/runtime/datatypes/map.reds#L700-L704

hiiamboris

[12:29](#msg5c49afbaf780a1521f5f7703)There are a lot of limitations to current map implementation. I wanted today to use blocks and objects as keys, but it won't allow me. R/S hashtable allows both, but map interface won't accept any of these. I think Doc was undecided on how best to support these types so it was best not to implement their support just yet.

rebolek

[12:29](#msg5c49afc28ce4bb25b80184bc)I meant that I don't want to change members of any given typeset.

BeardPower

[12:30](#msg5c49aff9746d4a677a033ecc)@rebolek Yeah, my bad. You suggested to change the type of the param.

rebolek

[12:31](#msg5c49b0069bfa375aab516410)yes

BeardPower

[12:31](#msg5c49b01435350772cf80e574)The question is, if it would break something.

[12:31](#msg5c49b02edab15872cee55d59)Hard to tell without knowing about the design decision.

[12:33](#msg5c49b0831cb70a372a2d1184)@hiiamboris R/S are only supporting basic types and we are not getting into the realm of red-types.

hiiamboris

[12:33](#msg5c49b0b39bfa375aab516938)@BeardPower I mean R/S basis on which the `map!` type rests already has the code for both Red objects and Red blocks as keys

[12:35](#msg5c49b11d20b78635b67580f6)Take a look https://github.com/red/red/blob/90c8e83ab8244d752e5a3df1bd41f9f52c342f5b/runtime/hashtable.reds#L224

BeardPower

[12:36](#msg5c49b13a0a491251e3499902)@hiiamboris Yeah, maybe it's just not implemented yet. It would just need to serialize the additional types:

```
preprocess-key: func [
		key		[red-value!]
	][
		switch TYPE_OF(key) [
			TYPE_WORD
			TYPE_GET_WORD
			TYPE_SET_WORD
			TYPE_LIT_WORD [key/header: TYPE_SET_WORD]		;-- convert any-word! to set-word!
			TYPE_BINARY
			TYPE_STRING
			TYPE_FILE
			TYPE_URL
			TYPE_TAG
			TYPE_EMAIL	 [_series/copy as red-series! key as red-series! key null yes null]
			TYPE_INTEGER TYPE_CHAR TYPE_FLOAT TYPE_DATE
			TYPE_PERCENT TYPE_TUPLE TYPE_PAIR TYPE_TIME [0]
			default		[fire [TO_ERROR(script invalid-type) datatype/push TYPE_OF(key)]]
		]
]
```

hiiamboris

[12:37](#msg5c49b18d0721b912a5cf0fae)Would it? I wanted to use it's current implementation where the contents doesn't matter (hash of an object is it's internal node address, hash of a block is it's head+node)

BeardPower

[12:37](#msg5c49b19a83189945243eaf0c)Yes. it's just a matter of pre-processing and serialization of the key.

[12:38](#msg5c49b1b70721b912a5cf10b2)@hiiamboris Sure. Code is data is code, right?

hiiamboris

[12:39](#msg5c49b21220b78635b67587d4)Well, as long as it does not hash the contents, I'm happy.

BeardPower

[12:40](#msg5c49b23c7a0f4d5b19fdc121)There is no limitation, as every type is a red-value. You just need to handle the specific red-value correctly.

[12:42](#msg5c49b2aaf780a1521f5f8dd3)@hiiamboris Why would it hash the content? If it does, you implemented it to do so ;-)

hiiamboris

[12:44](#msg5c49b3158ce4bb25b8019ba7)I mean it's a solid design question - to hash the address or the contents. Can be pros and cons to both, but no way back ;)

BeardPower

[12:48](#msg5c49b40e7a0f4d5b19fdccf4)What's the advantage of hashing the content? Content is something you want to "read" and work with. Hashing would lock the content to be not-readable any more.

hiiamboris

[12:48](#msg5c49b4307a0f4d5b19fdcefd)You have it for all the strings already.

[12:49](#msg5c49b441f780a1521f5f9bed)Hash is buggy btw, vulnerable to brute force:

```
>> h: make hash! reduce [make object! [] 123 make object! [] 234 make object! [] 345]
>> select h object []
== none
>> select h object []
== 123
>> select h object []
== none
>> select h object []
== none
>> select h object []
== none
>> select h object []
== none
>> select h object []
== 123
>> select h object []
== none
>> select h object []
== none
>> select h object []
== none
>> select h object []
== none
>> select h object []
== 345
>> select h object []
== 345
```

[12:49](#msg5c49b46735350772cf81042d)It's safe to assume hash is always buggy in Red :)

BeardPower

[12:50](#msg5c49b4a47a0f4d5b19fdd143)&gt;You have it for all the strings already.

What do you mean? The string value being hashed?

hiiamboris

[12:51](#msg5c49b4c4746d4a677a036390)@BeardPower yes indeed: https://github.com/red/red/blob/90c8e83ab8244d752e5a3df1bd41f9f52c342f5b/runtime/hashtable.reds#L237

BeardPower

[12:51](#msg5c49b4cc9bfa375aab5186a0)Ah, you meant the content of the key. I though that you meant the value.

[12:51](#msg5c49b4e27a0f4d5b19fdd2b1)That's hashing the key, not the value.

rebolek

[12:51](#msg5c49b4efc45b986d11b0bb5e) @hiiamboris what build are you using? I can't reproduce it.

BeardPower

[12:52](#msg5c49b4f09bfa375aab5186d1)key : value

hiiamboris

[12:52](#msg5c49b505f780a1521f5fa236)@BeardPower So someone may want to hash the contents of the block-key

[12:52](#msg5c49b520746d4a677a036698)@rebolek Red 0.6.4 for Windows built 11-Jan-2019/5:18:27+03:00 commit #5e37a10

rebolek

[12:53](#msg5c49b5387a0f4d5b19fdd772)I've got older build, let me check on newer one

BeardPower

[12:53](#msg5c49b53ff780a1521f5fa2fd)@hiiamboris I don't have the problem either.

[12:53](#msg5c49b5569bfa375aab518a91)Red 0.6.4 for Windows built 13-Dec-2018/13:19:16+01:00

hiiamboris

[12:54](#msg5c49b570dab15872cee58300)So it's a either recent thing, or Windows thing. No, just recent thing.

BeardPower

[12:54](#msg5c49b5a27a0f4d5b19fddb60)@hiiamboris I think that would need to be discussed; Pros/Cons.

rebolek

[12:55](#msg5c49b5b7746d4a677a036d96)Pulled latest sources and still no problem.

[12:55](#msg5c49b5dc8ce4bb25b801aca2)Tested with

```
>> probe about
Red 0.6.4 for Linux built 17-Dec-2018/9:23:46+01:00
```

and

```
>> probe about
Red 0.6.4 for Linux built 24-Jan-2019/13:53:52+01:00
```

[12:56](#msg5c49b5faba355012a48dcba9)Actually...

```
>> probe about
Red 0.6.4 for Linux built 24-Jan-2019/13:53:52+01:00

unset
```

hiiamboris

[12:56](#msg5c49b604f780a1521f5fa7bc)Tried repeating that select a lot of times with Up+Enter?

rebolek

[12:56](#msg5c49b613f780a1521f5fa817)@hiiamboris about 20-30 times

[12:57](#msg5c49b6330a491251e349bbba)Ha, after doing some other stuff in console, I get this:

BeardPower

[12:57](#msg5c49b63bf780a1521f5fa95c)Red 0.6.4 for Windows built 23-Jan-2019/15:42:51+01:00 commit #eb0d85a

also working.

rebolek

[12:57](#msg5c49b63f95e17b4525a18a37)

```
>> select h object []
== 123
>> select h object []
== none
>> select h object []
== 345
>> select h object []
== 234
>> select h object []
== 123
>> select h object []
== none
>> select h object []
== 345
>> select h object []
== 234
```

hiiamboris

[12:57](#msg5c49b655c45b986d11b0c434)Yes that's it! It doesn't always appear.

BeardPower

[12:58](#msg5c49b66083189945243ecf98)@rebolek What "other" stuff?

hiiamboris

[12:58](#msg5c49b680ba355012a48dcf08)For me it enough to retry the initial `h: ...` string a few times, wait a few secs, and hope :)

rebolek

[12:58](#msg5c49b6818ce4bb25b801b1c6) `probe about`, `print "Asdf"`, `?? about`

[12:58](#msg5c49b69120b78635b675a8b7)and `h`

BeardPower

[12:59](#msg5c49b6a71cb70a372a2d3ca5)No issue here.

hiiamboris

[12:59](#msg5c49b6c0cb47ec300094ffa7)I'll report it

rebolek

[13:02](#msg5c49b76295e17b4525a19138)Hm, triggering it is really non-trivial.

BeardPower

[13:02](#msg5c49b76f7a0f4d5b19fde6cd)Try it in a loop.

[13:02](#msg5c49b77c7a0f4d5b19fde707)It always reports none for me.

rebolek

[13:04](#msg5c49b7cbc45b986d11b0ce57)

```
➜  red git:(master) ✗ red
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>>  h: make hash! reduce [make object! [] 123 make object! [] 234 make object! [] 345]
== make hash! [make object! [] 123 make object! [] 234 make object! [] 345]
>> loop 100 [prin [select h object [] space] h]
none  none  123  none  none  none  234  none  none  none  345  none  none  none  none  none  none  none  123  none  none  none  234  none  none  none  345  none  none  none  none  none  none  none  123  none  none  none  234  none  none  none  345  none  none  none  none  none  none  none  123  none  none  none  234  none  none  none  345  none  none  none  none  none  none  none  123  none  none  none  234  none  none  none  345  none  none  none  none  none  none  none  123  none  none  none  234  none  none  none  345  none  none  none  none  none  none  none  123  none  == make hash! [make object! [] 123 make object! [] 234 make object! [] 345]
```

[13:05](#msg5c49b81af780a1521f5fb670)@BeardPower can you try this? ^^

hiiamboris

[13:06](#msg5c49b83c0721b912a5cf3a1a)`none` is also a bug, right? without `/same` refinement the result should be `123`

BeardPower

[13:06](#msg5c49b85edab15872cee5988b)@rebolek

```
>> loop 100 [prin [select h object [] space] h]
none  none  none  none  none  none  123  none  none  none  234  none  none  none  345  none  none  none  none  none  none  none  123  none  none  none  234  none  none  none  345  none  none  none  none  none  none  none  123  none  none  none  234  none  none  none  345  none  none  none  none  none  none  none  123  none  none  none  234  none  none  none  345  none  none  none  none  none  none  none  123  none  none  none  234  none  none  none  345  none  none  none  none  none  none  none  123  none  none  none  234  none  none  none  345  none  none  none  none  none  == make hash! [make object! [] 123 make object! [] 234 make object! [] 345]
```

rebolek

[13:06](#msg5c49b8739bfa375aab519efd)So reproduced.

BeardPower

[13:07](#msg5c49b8761cb70a372a2d4b90)No.

rebolek

[13:07](#msg5c49b87adab15872cee5995e)?

hiiamboris

[13:07](#msg5c49b87d746d4a677a038088):D :D

BeardPower

[13:07](#msg5c49b87f83189945243edd85)Try this:

```
loop 200 [either [select h [] = none][][print "strange"]]
```

rebolek

[13:07](#msg5c49b89d0a491251e349c9d1)that prints nothing

BeardPower

[13:07](#msg5c49b89f746d4a677a038156)Not a single output of strange ;-)

[13:07](#msg5c49b8aef780a1521f5fbb27)Because it returned none all the time.

[13:08](#msg5c49b8ccba355012a48ddbc4)So why is the first loop not returning none all the time but the second?

rebolek

[13:08](#msg5c49b8e0746d4a677a03827f)`[] = none`

[13:09](#msg5c49b8fd95e17b4525a19a91)I don't know, it's a strange bug :)

BeardPower

[13:09](#msg5c49b91fba355012a48ddee9)It's the same as:

```
loop 200 [either [(select h []) = none][][print "strange"]]
```

hiiamboris

[13:09](#msg5c49b922c45b986d11b0d80e)Because `print` is slow.

rebolek

[13:11](#msg5c49b96bba355012a48de0d0)@BeardPower `loop 200 [either none = x: select h object [][print x][print "strange"]]`

BeardPower

[13:11](#msg5c49b98435350772cf812a46)

```
loop 200 [either (select h []) = none [][print "strange"]]
```

[13:12](#msg5c49b9a8dab15872cee5a25b)Very strange.

rebolek

[13:12](#msg5c49b9a98ce4bb25b801c980)it's not `select h []` but `select h object []`

[13:12](#msg5c49b9b7f780a1521f5fc308)you have objects, not blocks in `h`

BeardPower

[13:12](#msg5c49b9cedab15872cee5a3aa)Oops, my bad ;-)

rebolek

[13:13](#msg5c49b9e78ce4bb25b801cc89)So it looks like you need to `print` it to trigger the bug

[13:14](#msg5c49ba2320b78635b675c0d3)

```
>> loop 200 [either none = x: select h object [][probe x][print "strange"]]
none
strange
strange
none
none
none
none
strange
strange
(...)
```

hiiamboris

[13:15](#msg5c49ba8bcb47ec3000951593)

```
>> loop 1000 [if (v: select h object []) [print v]]
234
345
123
345
```

[13:17](#msg5c49baef95e17b4525a1a3f4)https://github.com/red/red/issues/3756

BeardPower

[13:19](#msg5c49bb5295e17b4525a1a50a)This is very weird!

```
>> loop 200 [either (select h object []) = none [][print "strange"]]
strange
strange
strange
strange
strange
[..]
strange
strange
strange
strange
strange
>> h
== make hash! [make object! [] 123 make object! [] 234 make object! [] 345]
>> loop 200 [either (select h object []) = none [][print "strange"]]
>>
```

[13:20](#msg5c49bbaa95e17b4525a1a7c0)

```
>> loop 1000 [if (v: select h object []) [print v]]
== none
```

[13:20](#msg5c49bbb9f780a1521f5fd1f0)What the heck is going on?

hiiamboris

[13:21](#msg5c49bbbdba355012a48df384)Add another zero ;)

BeardPower

[13:21](#msg5c49bbd220b78635b675cb79)

```
>> h
== make hash! [make object! [] 123 make object! [] 234 make object! [] 345]
>> loop 1000 [if (v: select h object []) [print v]]
123
234
== none
>>
```

[13:22](#msg5c49bbf87a0f4d5b19fe08e9)Something is fucked up, that's for sure.

[13:23](#msg5c49bc6820b78635b675d0d4)@hiiamboris Yeah, loop 10000 produces the "buggy" result :-)

[13:24](#msg5c49bc98cb47ec300095251d)Sometimes it has zero errors.

[13:25](#msg5c49bcc795e17b4525a1afaa)The number of "buggy" outputs is also very different at each call.

[13:25](#msg5c49bcdd7a0f4d5b19fe0ec2)Seems random as well.

[13:26](#msg5c49bce8cb47ec30009526ea)Good find @hiiamboris !

[13:26](#msg5c49bd0683189945243ef8d5)I think we need to adapt the tests to catch errors like this.

hiiamboris

[13:27](#msg5c49bd2f1cb70a372a2d696d)It's a GC bug. After `recycle/off` it fails only once and then it's always none.

rebolek

[13:27](#msg5c49bd4220b78635b675d860)@hiiamboris :clap:

BeardPower

[13:28](#msg5c49bd8f20b78635b675dac6)@hiiamboris I fear not.

```
>> recycle/off
>> loop 2000 [if (v: select h object []) [print v]]
345
345
123
345
345
123
234
123
234
== none
>> loop 2000 [if (v: select h object []) [print v]]
234
234
345
345
234
234
123
345
345
345
234
== none
>> loop 2000 [if (v: select h object []) [print v]]
345
123
345
234
345
123
345
== none
```

hiiamboris

[13:30](#msg5c49bde7746d4a677a03a661)

```
>> loop 100000 [if (v: select h object []) [print v]]
== none
>> loop 100000 [if (v: select h object []) [print v]]
== none
>> loop 100000 [if (v: select h object []) [print v]]
== none
>> loop 1000000 [if (v: select h object []) [print v]]
== none
```

(I've got a whole screen of these)

BeardPower

[13:30](#msg5c49be1135350772cf8151e5)

```
>> recycle/off
>> recycle/off
>> recycle/off
>> loop 2000 [if (v: select h object []) [print v]]
== none
>> loop 2000 [if (v: select h object []) [print v]]
== none
>> loop 2000 [if (v: select h object []) [print v]]
== none
>> loop 2000 [if (v: select h object []) [print v]]
== none
>> loop 2000 [if (v: select h object []) [print v]]
== none
>> loop 2000 [if (v: select h object []) [print v]]
== none
>> loop 2000 [if (v: select h object []) [print v]]
== none
```

```
>> recycle/off
>> recycle/off
>> recycle/off
>> loop 2000 [if (v: select h object []) [print v]]
234
234
345
123
123
123
234
123
123
== none
>> loop 2000 [if (v: select h object []) [print v]]
123
234
123
345
345
== none
>> loop 2000 [if (v: select h object []) [print v]]
234
123
345
== none
>> loop 2000 [if (v: select h object []) [print v]]
234
123
== none
>> loop 2000 [if (v: select h object []) [print v]]
== none
>> loop 2000 [if (v: select h object []) [print v]]
== none
>>
```

[13:31](#msg5c49be380a491251e349f413)It needs multiply recycle/off calls for me to work.

[13:33](#msg5c49beaa7a0f4d5b19fe1e48)If only one call, it takes a lot longer to work:

```
>> recycle/off
>> loop 2000 [if (v: select h object []) [print v]]
234
123
234
234
123
345
== none
>> loop 2000 [if (v: select h object []) [print v]]
345
345
234
234
345
123
345
234
345
== none
>> loop 2000 [if (v: select h object []) [print v]]
234
234
234
123
123
234
234
234
345
234
345
345
== none
>> loop 2000 [if (v: select h object []) [print v]]
123
345
123
234
123
234
234
345
345
234
== none
>> loop 2000 [if (v: select h object []) [print v]]
234
123
345
345
345
234
234
234
345
345
== none
>> loop 2000 [if (v: select h object []) [print v]]
123
345
123
345
345
== none
>> loop 2000 [if (v: select h object []) [print v]]
345
345
234
234
345
123
234
== none
>> loop 2000 [if (v: select h object []) [print v]]
123
234
== none
>> loop 2000 [if (v: select h object []) [print v]]
123
234
== none
>> loop 2000 [if (v: select h object []) [print v]]
234
123
== none
>> loop 2000 [if (v: select h object []) [print v]]
345
123
== none
>> loop 2000 [if (v: select h object []) [print v]]
234
123
234
== none
>> loop 2000 [if (v: select h object []) [print v]]
123
123
123
234
== none
>> loop 2000 [if (v: select h object []) [print v]]
345
123
== none
>> loop 2000 [if (v: select h object []) [print v]]
345
== none
>> loop 2000 [if (v: select h object []) [print v]]
== none
>> loop 2000 [if (v: select h object []) [print v]]
123
123
== none
>> loop 2000 [if (v: select h object []) [print v]]
== none
>> loop 2000 [if (v: select h object []) [print v]]
== none
>> loop 2000 [if (v: select h object []) [print v]]
123
== none
>> loop 2000 [if (v: select h object []) [print v]]
== none
>> loop 2000 [if (v: select h object []) [print v]]
== none
>> loop 2000 [if (v: select h object []) [print v]]
345
234
== none
>> loop 2000 [if (v: select h object []) [print v]]
== none
>> loop 2000 [if (v: select h object []) [print v]]
== none
>> loop 2000 [if (v: select h object []) [print v]]
== none
>> loop 2000 [if (v: select h object []) [print v]]
== none
>> loop 2000 [if (v: select h object []) [print v]]
== none
>> loop 2000 [if (v: select h object []) [print v]]
== none
>> loop 2000 [if (v: select h object []) [print v]]
== none
>> loop 2000 [if (v: select h object []) [print v]]
== none
>>
```

[13:34](#msg5c49bf0095e17b4525a1c107)Definitely a GC bug @hiiamboris :+1:

hiiamboris

[13:35](#msg5c49bf1b8ce4bb25b801f067)And then I typed:

```
>> recycle/on
>> loop 10000 [if (v: select h object []) [print v]]
```

And waited about a \*whole minute* for it to output me a few strings. Looks like GC needs some optimization too...

BeardPower

[13:39](#msg5c49c0281cb70a372a2d7f4c)Only 5 secs for me.

[13:40](#msg5c49c049f780a1521f5ff06a)But that could be because of CPU/RAM of course.

hiiamboris

[13:51](#msg5c49c2e2c45b986d11b12418)Or because I created millions of objects before :)

BeardPower

[13:55](#msg5c49c3b67a0f4d5b19fe448f)Probably :-)

## Friday 25th January, 2019

gltewalt

[05:08](#msg5c4a99d37a0f4d5b1903da40)It always prints `none` in CLI console on Win7

[05:08](#msg5c4a99e135350772cf86e7e1)GUI console is erratic

hiiamboris

[10:35](#msg5c4ae67195e17b4525a95fa3)Does anybody else having problems reading ANY page from GitLab in Red?

```
>> read https://gitlab.com/help
*** Access Error: cannot connect: https://gitlab.com/help reason: timeout
*** Where: read
*** Stack:
```

dsunanda

[10:49](#msg5c4ae9ccc45b986d11b889f4) Reading gitlab works fine from where I am:

```
length? read https://gitlab.com/help
== 70734
```

hiiamboris

[10:51](#msg5c4aea2af780a1521f677a7a)@dsunanda what platform? I'm on W7

dsunanda

[10:51](#msg5c4aea39746d4a677a0b4f08)Win10

hiiamboris

[10:51](#msg5c4aea4bcb47ec30009ce0c9)I see. Thank you.

Phryxe

[11:49](#msg5c4af7e420b78635b67dc94d)F-secure have problems with latest red exe (https://github.com/red/red/issues/3757).

hiiamboris

[11:55](#msg5c4af9398ce4bb25b809d90a)@Phryxe you should report that to F-Secure developers instead

Phryxe

[12:05](#msg5c4afb7cf780a1521f67f68a)@hiiamboris Have you read the issue? So you mean we should never report this kind of issues here?

rebolek

[12:07](#msg5c4afbf07a0f4d5b19063dc9)There's nothing Red team can do about bad heuristics.

hiiamboris

[12:07](#msg5c4afc0095e17b4525a9f5f1)Yes. We can't influence all the A/V vendors out there to not blacklist Red. Only you the end users can do that.

Phryxe

[12:08](#msg5c4afc22f780a1521f67fb1b)OK, I'll never report these again :tongue:

hiiamboris

[12:22](#msg5c4aff8f0721b912a5d7b4cf)@Phryxe BTW I also believe that \*bad heuristics* is intentional in most cases, both to get a cut from the better financed project leaders and to make an appearance of the safest A/V out there.

rebolek

[12:24](#msg5c4affef7a0f4d5b190657d6)Hm, so there's an opportunity to make some money with the safest AV software using `print "Warning: Virus detected"` :smirk:

hiiamboris

[12:26](#msg5c4b00719bfa375aab59f191)Sure, as long as you are trusted ;)

amreus

[12:47](#msg5c4b05581cb70a372a35d465)I no longer get any virus warnings on Windows. I do not know exactly why, but here is what I did: Prior to the release of version 0.6.4 I had turned off "Cloud-delivered protection" in Windows Defender. I had the Cloud option off for about 1 month. That alone stopped the warnings and quarantines for the 0.6.3 releases. When 0.6.4 was released but before I downloaded it, I turned the Cloud option back on. Defender has been silent ever since. I install the most recent updates as they become available and nothing from Defender.

[13:04](#msg5c4b094a35350772cf89af42)`to-local-file/full` crashes the gui console for me.

[13:04](#msg5c4b094b7a0f4d5b190691c0)

[13:05](#msg5c4b099d95e17b4525aa4abe)\[!\[00563.png](https://files.gitter.im/red/bugs/rcQk/thumb/00563.png)](https://files.gitter.im/red/bugs/rcQk/00563.png)

[13:06](#msg5c4b09dc0a491251e35297ed)

```
>> about
Red 0.6.4 for Windows built 24-Jan-2019/22:49:24-05:00 commit #702ec38
```

hiiamboris

[13:27](#msg5c4b0eb2f780a1521f687ccd)can't reproduce on W7 built Jan 11

[13:56](#msg5c4b158bc45b986d11b9ba85)@toomasv @meijeru @endo64 @greggirwin I've updated the code explorer in accord with all your feedback so far. Thanks again for taking the time to test it! More user-friendly now, single branch for everyone, and you have a precompiled version with GC disabled as I've seen it cause a lot of crashes. https://gitlab.com/hiiamboris/red-codex/tree/master

endo64

[15:21](#msg5c4b29897a0f4d5b19076eca)@hiiamboris Thanks! I'll update and test the latest version in a few hours.

[15:22](#msg5c4b29c120b78635b67f1661)&gt; Does anybody else having problems reading ANY page from GitLab in Red?

It works for me (Win10 x64)

toomasv

[15:54](#msg5c4b31188318994524488bf2)@hiiamboris Thanks! It's a major help and works like a charm! A little misalignement with font:

\[!\[image.png](https://files.gitter.im/red/bugs/0vXw/thumb/image.png)](https://files.gitter.im/red/bugs/0vXw/image.png)

hiiamboris

[16:02](#msg5c4b32f8cb47ec30009ec773)@toomasv It's intentional ;) Otherwise you wouldn't see it at all...

toomasv

[16:02](#msg5c4b33067a0f4d5b1907baf8)

## Saturday 26th January, 2019

greggirwin

[01:14](#msg5c4bb46a975714406b41548c)I can also read from gitlab fine on Win10 @hiiamboris.

[01:18](#msg5c4bb55d454aad4df7a249ab)`to-local-file/full` problem reproduced on Win10. Would be good to see what in the system needs that to be native (R/S). It uses `to-local-path` in `file!`.

[01:19](#msg5c4bb59af04ef0064488c566)Will check out the new code explorer when I get a chance.

meijeru

[13:25](#msg5c4c5fd67b68f941021ff64a)@hiiamboris I have tried your latest code-explorer and it works fine. I had long wanted to make a similar one of my own (after my experience with the concordance), also to try out some GUI features. So I went ahead, inspired by your efforts and those of @toomasv, but not based on your source. The result is \[here](https://gist.github.com/meijeru/2665add5f9e72378c7ffdb3fda3adddf): "word-finder".

hiiamboris

[13:47](#msg5c4c64fe7b68f9410220196a)@meijeru :+1: a big step ahead from concordance in my opinion ☺

meijeru

[15:27](#msg5c4c7c4b1b62f12650521ec3)I have now also compiled it, but for that I had to take the function `store` out of the function `analyze` since the compiler -- unlike the interpreter -- cannot cope with nested functions. I will now update the gist.

toomasv

[16:39](#msg5c4c8d4ac2dba5382e908373)@meijeru Great!

endo64

[23:10](#msg5c4ce8f3975714406b48b868)Is this a known bug?

```
>> view [text "one^/two^/three" 200 red]
>> view [text "one^/two^/three" 200 red white]
```

Textbox auto expands vertically in the first example, but it doesn't in the second one. (at least on Win10 x64 - `Red 0.6.4 for Windows built 11-Jan-2019/5:18:27+03:00 commit #5e37a10`)

## Sunday 27th January, 2019

toomasv

[07:03](#msg5c4d57d8f46373406a0936b0)@endo64 May be connected to #3336. It seems that size is miscalculated for changed font in \[system/view/platform/size-text](https://github.com/red/red/blob/master/modules/view/backends/platform.red#L541)

hiiamboris

[09:00](#msg5c4d7313f46373406a09c8f7)I don't think it was reported before, @endo64 . Confirmed on W7.

meijeru

[09:40](#msg5c4d7c75f04ef00644937f9d)@toomasv I am now trying your syntax-highlighter. One small remark: the resizing does not react to the "full screen" button, in the sense that the canvas remains the size it had, inside the full-screen window.

[09:40](#msg5c4d7c86975714406b4bfc8d)I am on W10 4 bits.

endo64

[09:48](#msg5c4d7e74454aad4df7ad0c64)@meijeru It is the reason that your windows is 4 bits :) (sorry couldn't resist)

meijeru

[10:08](#msg5c4d830241775971a08f661d)4 -&gt; 64 (I should watch what I type :smirk: )

toomasv

[11:05](#msg5c4d9065ca428b06450ce68b)@meijeru Yes, not done yet. Thanks!

endo64

[21:11](#msg5c4e1e8bf04ef0064497883d)&gt; I don't think it was reported before, @endo64 . Confirmed on W7.

Could be related to these issues: #3336 , #2503 , #2757  
I raised a new issue any way, if you think it is duplicate, I can close it.

hiiamboris

[21:18](#msg5c4e20408aa5ca5abf4022da)@endo64 It must be something to do with face not being fully ready at the time of size-text call (no `state` facet yet). This function's logic is a labyrinth right now ☺

endo64

[22:23](#msg5c4e2f52ceb5a2264f4f1730)Should block values also raise `invalid function definition` error when used in function spec.

I see that `TYPE_BLOCK` is accepted in spec checking function (`validate`), see this line:  
https://github.com/red/red/blob/e7c460382877e749bf7120f8ed77158cec3e4c9c/runtime/datatypes/function.reds#L795

```
>> f: function [5] [a: 1 b: 2]  
*** Script Error: invalid function definition: 5  ;<--- expected behavior 

>> f: function [[x y]] [a: 1 b: 2]  
== func [[x y] /local a b][a: 1 b: 2]
>> ? f
Func spec couldn't be parsed, may be malformed.
func [[x y] /local a b][a: 1 b: 2]
```

gltewalt

[22:58](#msg5c4e3778975714406b50b6ba)Not exactly because it is block values that hold the types. `function [x y [string!]]`

[22:59](#msg5c4e37c841775971a093cbbc)If there’s a block value that doesn’t contain daratype words, then error?

[23:06](#msg5c4e398e7b68f941022b6f15)`func [[string!]][]` is allowed

## Monday 28th January, 2019

toomasv

[13:20](#msg5c4f01821b62f1265061b75a)@meijeru Full-screen done, some navigation quirks corrected.

gltewalt

[19:59](#msg5c4f5f0e13a2814df6e0ab9a)

```
>> x: make vector! [1 2 3 4 5]
== make vector! [1 2 3 4 5]

>> y: make vector! [6 7 8 9 10]
== make vector! [6 7 8 9 10]

>> x // y
*** Script Error: absolute does not allow vector! for its value argument
*** Where: absolute
*** Stack: mod
```

[20:00](#msg5c4f5f6dc2dba5382ea23f91)`Red 0.6.4 for Windows built 27-Jan-2019/3:20:41-07:00 commit #e7c4603`

[20:02](#msg5c4f5fb9ca428b064518d7d4)`//` accepts vector

[20:06](#msg5c4f60e2f04ef006449fe235)`mod` accepts vector, but uses `absolute` in it's body

hiiamboris

[20:22](#msg5c4f646c454aad4df7b9348a)`mod` and `modulo` are a total mess that requires a rewrite from scratch, but it wasn't done because the plan is more than that: https://github.com/red/red/issues/2433  
`vector` is even more of a mess because it's practically a gun armed with bullets firing backwards... like can you guess the result of `v: make vector! [5 5 5] 1 - v * v - 1` without running it in console?

gltewalt

[20:23](#msg5c4f64c078e1ed4103a4a39c)8 8 8 ?

hiiamboris

[20:23](#msg5c4f64dd41775971a09b9c94)nope...

gltewalt

[20:26](#msg5c4f6590c2dba5382ea2658a)and it modifies the vector(s)

Oldes

[20:27](#msg5c4f65a71b62f1265064987b)For me it is required that vector is modified.

[20:27](#msg5c4f65b99221b9382dd8928d)and this should be error and not what it is:

```
>> 1 - make vector! [16 16 16]
== make vector! [15 15 15]
```

gltewalt

[20:29](#msg5c4f663a78e1ed4103a4adff)Once made, they aren't modified by `+ - * / %`

Oldes

[20:30](#msg5c4f664f1b62f12650649de4)?

gltewalt

[20:30](#msg5c4f66659221b9382dd898ec)A new vector with the result is returned

hiiamboris

[20:31](#msg5c4f668a78e1ed4103a4affe)@Oldes An obvious solution is to make a `shoot-me-in-the-foot` DSL, preferably in R/S, totally isolated from the main language. Nobody expects `1 - x` and `x - 1` to give the same result. Every function out there might test it's input on conditions like `a - 1 < b` and will be broken by such math rules misuse.

gltewalt

[20:32](#msg5c4f66c9454aad4df7b94749)

```
>>  v: make vector! [5 5 5]
== make vector! [5 5 5]

>> v
== make vector! [5 5 5]

>> 1 - v * v - 1
== make vector! [15 15 15]

>> v
== make vector! [4 4 4]
```

[20:32](#msg5c4f66d98aa5ca5abf48653a)Modified in place

Oldes

[20:34](#msg5c4f67567b68f94102334b8a)Yes... and I'm fine with it... except, that `1 - v` part. But the problem is, that I look at vector as highly optimized LARGE array of numbers and when I do operation on it, I don't want to copy of the array on each op.

gltewalt

[20:34](#msg5c4f67587b68f94102334b8c)modified in place with `v - 1`, but not with `v * v`. That will probably confuse folks

hiiamboris

[20:35](#msg5c4f67ae975714406b588d77)@Oldes don't you also want `a - b` to be done in place (modifying `a`)? or a way to fill the vector with a given constant value?

Oldes

[20:36](#msg5c4f67d5ca428b0645190fd0)On the other side, I can imagine `matrix!` or other vector type variant, which will copy itself before modifying.

gltewalt

[20:36](#msg5c4f67e17b68f94102334eb0)That makes sense

Oldes

[20:41](#msg5c4f690113a2814df6e0f6d7)True is, that if `v * v` creates a new vector and `v - 1` modifies, than it is inconsistency. But I think that `vector` is deep down in the `todo` list.

[20:46](#msg5c4f6a27454aad4df7b959d7)One should bring real life examples... I don't think that using math like `1 - v * v - 1` makes any sense.

[20:48](#msg5c4f6a948aa5ca5abf4880fb)And it is nice to write:

```
>> v * 10
== make vector! [40 40 40]
```

instead of:

```
>> forall v [v/1: v/1 * 10] v
== make vector! [40 40 40]
```

[20:49](#msg5c4f6ace13a2814df6e10800)One can always use `copy` manually:

```
>> v: make vector! [4 4 4]
== make vector! [4 4 4]
>> w: 10 * copy v
== make vector! [40 40 40]
>> v
== make vector! [4 4 4]
```

hiiamboris

[21:12](#msg5c4f703378e1ed4103a4fafa)`1 - v * v - 1` is just a simplistic joke of course. In real life you'll probably have a longer expression, and will probably want to apply fast functions like `sin` or `log` in place as well.

[21:13](#msg5c4f70648aa5ca5abf48a99c)Are there any objections against DSL approach though?

meijeru

[21:15](#msg5c4f70e98aa5ca5abf48ab71)Issue #2216 is relevant to this discussion.

rebolek

[21:55](#msg5c4f7a6c54f21a71a1bfad03)\*... fast functions like sin or log...*

well...

hiiamboris

[22:04](#msg5c4f7c59f04ef00644a09664):D compared to one token processing of Red I mean

## Tuesday 29th January, 2019

gltewalt

[00:20](#msg5c4f9c601b62f12650660706)Sort of cross posting, but since behavior was being discussed, comments are welcome:  
https://github.com/red/docs/pull/125

greggirwin

[08:37](#msg5c5010b9c2dba5382ea684f0)@meijeru, fantastic work! We need to start a tools page.

[08:42](#msg5c501200ca428b06451d34c8)Since I knew that vectors modified in place, I successfully predicted the result from @hiiamboris's example. That's not an endorsement of the current behavior, just that it can make sense to at least one person, given that they know the ground rules.

Oldes

[10:01](#msg5c502491ceb5a2264f5c1c07)@greggirwin I would really like to hear explanation for this:

```
>> 1 - make vector! [16 16 16]
== make vector! [15 15 15]
```

[10:04](#msg5c50252f8aa5ca5abf4d0da9)It is like saying, that `1 - 16 == 15`

meijeru

[13:22](#msg5c5053898aa5ca5abf4e53e1)That definitely looks like a bug!

greggirwin

[20:48](#msg5c50bc199221b9382de1a1be)@Oldes, Ah! I got the answer, but misinterpreted the intermediate result. I thought it would be `[-4 -4 -4]`, from Boris's example, which still gives the same end result.

Yes, that's just a bad result.

Oldes

[20:50](#msg5c50bc82f04ef00644a918a4)The question is, if it should be supported.. I would prefer error in this case.

greggirwin

[20:52](#msg5c50bd141b62f126506da60e)Agreed.

toomasv

[20:56](#msg5c50be0e9221b9382de1b14d)@greggirwin Did you also guess correctly the final value of `v` not only the expression?

greggirwin

[20:58](#msg5c50be8393fe7d5ac00f6fc6)No, I got that one wrong too!

toomasv

[21:01](#msg5c50bf43ca428b064521d5b0)I was quite confused, but now I understand (/guess) only first op modyfies v, multiplication by another vector produces new vector, and subtracting from the new one doesn't modify `v`. This is corroborated by:

```
>> v: make vector! [5 5 5] 1 - v v: v * v - 1
== make vector! [15 15 15]
>> v
== make vector! [15 15 15]
```

## Friday 1st February, 2019

Oldes

[15:38](#msg5c5467d87b68f9410254bded)Is it ok, that it is possible to unset a word using `set` with `block`?

```
>> b: 1 set [A B] reduce [4 ()]
== [4 unset]
>> b
*** Script Error: b has no value
*** Where: catch
*** Stack:
```

While it is not possible when using with `word` directly?

```
>> b: 1 set 'b ()
*** Script Error: b needs a value
*** Where: set
*** Stack:  

>> b
== 1
```

[15:40](#msg5c54685d8aa5ca5abf69d3f0)What if it would just ignore setting the value `b` in the first case (without throwing an error)?

[15:41](#msg5c5468adca428b06453a66d4)Although that could be if `set/some` is used.

nedzadarek

[15:45](#msg5c54697fca428b06453a6c2c)@Oldes Yes, there is `/any` refinement that should set `unset` values.

Oldes

[15:45](#msg5c5469b2f04ef00644c1bd3d)Ok... so it is a bug... as it should unset `b` only with `/any`, right?

nedzadarek

[15:46](#msg5c5469f1ceb5a2264f78e949)@Oldes I think so.

Oldes

[15:56](#msg5c546c3a8aa5ca5abf69ef54)https://github.com/red/red/issues/3766

greggirwin

[22:12](#msg5c54c45613a2814df604c875)On vectors, consistency, so we can reason about behavior, seems like a key criteria.

[22:18](#msg5c54c5b49221b9382dfccbf8)`Set/any` is interesting. Clearly good for Rebol compatibility, and also to catch unintentional unsets. The easiest change is probably to have `set*` also check if block args contain any `unset!` values. Otherwise it will have a ripple effect to `object/set-many` and `set-many` internally. I don't think handling it at the `set` entry point will be too limiting, and will make it an easy fix.

Good ticket @Oldes.

gltewalt

[22:40](#msg5c54cae741775971a0c00d9a)

## Saturday 2nd February, 2019

endo64

[15:27](#msg5c55b6e054f21a71a1e84e42)

```
Red> sort/all/compare [1 2 3 4 5 6] func [a b] [5] ; == [1 2 3 4 5 6]   ; integer 5 treated as false
Red> sort/all/compare [1 2 3 4 5 6] func [a b] [5.4] ; == [1 2 3 4 5 6] ; float also treated as false
```

Positive numbers (float! &amp; integer!) are treated as true in R3 (in R2 the result for integer is strange `[2 3 4 5 6 1]`)

R2 doesn't accept return values other than integer! and logic! for the compare function.  
R3 accepts all return values and treats them all (word!, money!, tuple!, issue) as true (only negative numbers are treated as false, with an exception of money! which is always treated as true even for $-12 or -$12)  
Red also accepts all return values, but positive numbers are false, negative numbers are true, which is strange.

hiiamboris

[15:35](#msg5c55b8a8f46373406a3f9cad)@endo64 Yes, weird...  
Red &amp; R2:

```
>> sort/all/compare [1 4 6 3 2 5] func [a b] [a - b]
== [1 2 3 4 5 6]
```

R3:

```
>> sort/all/compare [1 4 6 3 2 5] func [a b] [a - b]
== [6 5 4 3 2 1]
```

[15:38](#msg5c55b9718aa5ca5abf7235bd)I'd say R3 is the only one who has got it right.

endo64

[15:38](#msg5c55b98641775971a0c5e634)I think so too, raising an issue.

hiiamboris

[15:39](#msg5c55b99713a2814df60ac9fa)`a > b` &lt;=&gt; `a - b > 0` &lt;=&gt; `a - b`

endo64

[15:40](#msg5c55b9ea454aad4df7e2fb3a)No need `/all` tough, `sort/compare [1 2 3 4 5 6] func [a b] [5]` is enough to show the issue.

hiiamboris

[15:41](#msg5c55ba1ef46373406a3fa6ab)Yes, `/all` only matters with `/skip`

endo64

[15:48](#msg5c55bbc1ca428b064542df11)#3768

hiiamboris

[16:00](#msg5c55be93c2dba5382ecc70a3)@endo64 there's smth with the wording of your issue though

endo64

[20:08](#msg5c55f8b4ceb5a2264f831851)Feel free to change it if you can, or send me the correct wording so I can change it.

[20:11](#msg5c55f96dc2dba5382ece0104)@hiiamboris Ah I saw it now and fixed, thanks!

hiiamboris

[20:13](#msg5c55f9fcceb5a2264f83214a)☻ :+1:

## Wednesday 6th February, 2019

TheHowdy\_gitlab

[22:10](#msg5c5b5b64975714406ba783dd)Today I came across \[this StackOverflow](https://stackoverflow.com/questions/50883367/red-language-changing-button-image-doesnt-work) question, and it seems like that person just discovered a bug: in the stable &amp; nightly versions, neither does this code change the displayed image

```
view [button "Text" %head.png [face/image: %tail.png]]
```

nor does this code remove the displayed image

```
view [button "Text" %head.png [face/image: none]]
```

Note that the face's image property does change, as seen by adding `probe face/image`, but it doesn't display it. Also had no luck with defered updating.

[22:12](#msg5c5b5bc21b62f12650b42a91)Just realised u have to `load` the image first... but that doesn't work either:

```
view [button "Text" %head.png [face/image: load/as %tail.png 'png]]
```

nedzadarek

[22:19](#msg5c5b5d6441775971a0eafa87)@TheHowdy\_gitlab Works with `base` instead of `button`. I think I have seen this.

## Thursday 7th February, 2019

TheHowdy\_gitlab

[11:49](#msg5c5c1b66f46373406a69ed60)But it should work with `button` too, right? If so, shall I open an issue?

hiiamboris

[13:17](#msg5c5c2ffe8790df062073fe72)@TheHowdy\_gitlab yes

endo64

[15:17](#msg5c5c4bfbf46373406a6b54c5)Still it's known issue and image support added to button recently and still it not complete, as it requires custom drawn button (on Windows at least) as normal buttons doesn't support images as background.

## Saturday 9th February, 2019

gltewalt

[07:11](#msg5c5e7d2c7502282258cfa131)Access Violation after compiling with console functions and then running the .exe

```
Red []

#include %environment/console/CLI/input.red

binary-url: https://static.red-lang.org/dl/auto/win/red-latest.exe

binary-name: does [to-file append ask "Enter your prefered Red executable name: " ".exe"]

update-binary: func [name url][
    if exists? name [call/shell form reduce ["rename" name append name ".old"]]
    write/binary name read/binary url
]
compile-consoles: does [
    call/console {red}
    call/console {red --cli}
]

update-binary binary-name binary-url
compile-consoles
```

[07:12](#msg5c5e7d76604f233ab6dbe688)

```
C:\Users\Old Man>rbu

*** Runtime Error 1: access violation
*** at: 0041F72Ch
```

## Sunday 10th February, 2019

gltewalt

[21:38](#msg5c6099d980df6804a181d5ee)Sorry for the clutter.

## Thursday 14th February, 2019

9214

[17:24](#msg5c65a46328c89123cbcb9939)@hiiamboris WRT your recent (and excessive) comments on closed tickets. All crashes follow the similar pattern, and end up with `object/rs-select`. I suspect that it has something to do with hashtable, as it's used for symbol searching in contexts.

Could be \[this](https://github.com/red/red/commit/4f4f328731367dfb13dbc6b6c57fee125184e1b3#diff-0459b171dadd9590aea44d8311edbd58R1015)? Happened earlier than 7 Dec though.

hiiamboris

[17:29](#msg5c65a565604f233ab60d3889)@9214 Can't tell yet. Needs testing with that specific commit and before it.

[17:29](#msg5c65a58c253c2b5ea3113585)gimme half an hour ;)

9214

[17:30](#msg5c65a5bd4bafd97ca3f09318)The clock is ticking!

hiiamboris

[17:32](#msg5c65a649126af75deba763fa):D

[17:42](#msg5c65a8715095f6660cf3d721)@9214 no that's not it. That commit works OK.

[17:43](#msg5c65a8b528c89123cbcbb627)Look between 6 dec and 18 dec commits.

9214

[17:44](#msg5c65a910126af75deba778c4)Try to sprinkle `object/rs-select` with debugging `print`s and see where it goes south. Most of it are typecasts with asserts, and the only suspicious \[line](https://github.com/red/red/blob/master/runtime/datatypes/object.reds#L98) is the one where symbol lookup happens.

hiiamboris

[18:14](#msg5c65b013ef98455ea4370662)@9214 pinpointed it: https://github.com/red/red/commit/4414d6473cfea80aecf32c6b8aa5ee99b161715d

9214

[18:17](#msg5c65b0d5dc3f0523ccb658ae)@hiiamboris nice job. So my guess about hashtable was totally baseless.

## Saturday 16th February, 2019

greggirwin

[17:29](#msg5c68487c4003460b2d602d3e)I was wondering what all the ticket comments were (that I need to catch up on ;^).

## Monday 18th February, 2019

viayuve

[22:51](#msg5c6b36fa9e430b30868be928)issue - red console stops working after some time and it does interrupt - restart and shutdown sequence because of "not responding" situation "force quit" does not work either. On mac only solution is to shut it down using power button. Also kill &lt;pid&gt; in terminal does not work. On windows whole thing works with all the triggers on mac it does not.

[22:52](#msg5c6b372db6c74f1e2e73cb79)

```
Date/Time:       2019-02-19 03:29:08 +0530
End time:        2019-02-19 03:29:10 +0530
OS Version:      Mac OS X 10.14.3 (Build 18D109)
Architecture:    x86_64h
Report Version:  27

Data Source:     Stackshots
Shared Cache:    0x1f672000 E4B3A94D-55C0-393C-A126-2603E9F8FC4E
Shared Cache:    0 0822F2B8-73B6-3640-8E91-04395E27F608

Command:         console-2019-2-4-67544
Path:            /usr/lib/dyld
Version:         ??? (???)
PID:             609

Event:           hang
Duration:        1.70s
Steps:           17 (100ms sampling interval)

Hardware model:  MacBookPro14,3
Active cpus:     8

Time Awake Since Boot: 24000s
Time Since Wake: 13000s

Fan speed:       2155 rpm
```

[22:52](#msg5c6b3732c776985d8f16396d)event log

9214

[22:58](#msg5c6b388a9e430b30868bf2e8)How much time does it take for the console to hang? Does it happen if the console is idle? Have you tried to turn GC off (`recycle/off`)?

## Tuesday 19th February, 2019

rebolek

[06:23](#msg5c6ba0db5df86a45685b1992)I've encountered this problem on macOS earlier, it was well before GC, so it's caused by something else. You don't have to do anything - just leave the console open and after some time (tens of minutes at least, IIRC) it hangs. But I believe I was able to kill it somehow.

9214

[06:38](#msg5c6ba454c776985d8f18c255)@rebolek thanks. My session usually runs in the background for days, and I haven't encountered this issue (W10). Worth a ticket if others can reproduce it (@x8x?).

rebolek

[06:38](#msg5c6ba47d35c7a50422767636)I haven't seen this issue on Win nor Linux, it's macOS only AFAIK.

9214

[06:39](#msg5c6ba48b1f14630421e48ee5)Does it happen with GUI console only?

rebolek

[06:40](#msg5c6ba4c47667931e2fc5ced6)It happened with CLI console.

toomasv

[06:56](#msg5c6ba88ae5eeec0d9b8dab12)It happened earlier on W10 too, not any more.

9214

[07:01](#msg5c6ba9b8e5eeec0d9b8db573)@toomasv that was a memory leak in the new console engine, been fixed since a while.

gltewalt

[07:46](#msg5c6bb45c85b7eb4569f6bae1)`kill -9` should blow up any process. Kill by itself only sends an interrupt IIRC. -9 sends kill.

But... that doesn’t fix the problem.

9214

[08:03](#msg5c6bb86bb6c74f1e2e76d254)Might be a buggy library call.

x8x

[09:56](#msg5c6bd2bf02b4803c9ec6f532)@9214 "console hang" don't remember having that issue, not seen in a long time.

9214

[09:57](#msg5c6bd2ecab952d308556f404)@x8x can you check the latest release on your Mac?

rebolek

[09:57](#msg5c6bd30ac82c68509eff4dde)It's hard to reproduce, there are no exact steps. It just sometimes happens.

9214

[10:12](#msg5c6bd68ac776985d8f1a0dcf)Shouldn't be terribly hard to run idle console in the background.

PeterWAWood

[10:25](#msg5c6bd982c776985d8f1a1fac)I thought that there was already an issue about GUI console stability on macOS but I can't locate it.

x8x

[10:38](#msg5c6bdca5d60053128ed876b7)@9214 Started a fresh CLI console, let see what happen :smiling\_imp:

rebolek

[11:11](#msg5c6be4759e430b3086901fec)@9214 I'm not sure if it does not require some activity. It's really hard to reproduce.

PeterWAWood

[11:47](#msg5c6bece6c4da4a11f57e4910)`until [print now wait 300 false]` seems to cause the macOS GUI console to lock up.

rebolek

[11:48](#msg5c6bed159e430b3086905df4)@PeterWAWood I'll try to test it in the evening

PeterWAWood

[11:48](#msg5c6bed199e430b3086905e68)Though I am able to `Force Quit` the instance

[12:03](#msg5c6bf085c82c68509e001789)@rebolek This also seems to lock the GUI console - `repeat i 200 [ print i wait i ]`

rebolek

[12:03](#msg5c6bf0a4a7d733509d8fbf3f)@PeterWAWood and no problem in CLI console?

PeterWAWood

[13:50](#msg5c6c09b285b7eb4569f9022f) @rebolek No problem in CLI console.

hiiamboris

[14:23](#msg5c6c11451f14630421e76e20)but `wait 300` is 5 minutes of wait! in a single threaded application that's the very definition of lock up

rebolek

[14:24](#msg5c6c118735c7a50422796d9b)the problem probably is that it doesn't return to console after 5 minutes

hiiamboris

[14:29](#msg5c6c12c39e430b3086915b13)not that anyone will know unless there will be a `do-events/no-wait` call inbetween

rebolek

[14:30](#msg5c6c12fa85b7eb4569f94134)Ah, you're probably right.

moliad

[14:33](#msg5c6c13bb9155d45d903e18b2)I've stopped using the gui console on windows. too many interference with view code. I just added 'view as a needs for the shell console and can now run view apps from dos prompt. it works very well.

rebolek

[14:35](#msg5c6c1434b6c74f1e2e7934c4)anyway, the mac problem was present in CLI console too, so it's not GUI-console related

hiiamboris

[14:38](#msg5c6c14e835c7a50422798a80)@moliad yeah, everyone's using it this way :)

## Wednesday 20th February, 2019

Oldes

[10:29](#msg5c6d2c245df86a4568653a44)@dockimbel Not actually bug, but I noticed, that `bitset!` is using zero-based indexing, is it by design?

```
>> b: make bitset! 2#{10000001}
== make bitset! #{81}
>> b/1
== false
>> b/0
== true
>> b/7
== true
```

9214

[12:49](#msg5c6d4ce61f14630421ef79ae)@Oldes yes.

Oldes

[12:50](#msg5c6d4cfab6c74f1e2e8128ae)Reason?

9214

[12:55](#msg5c6d4e311f14630421ef81d6)@Oldes the same as in Rebol I believe.

[12:55](#msg5c6d4e43c4da4a11f58765e0)&gt; Unlike other series datatypes, bitsets are zero-based. This allows the NULL character to be included in the bitset and tested.

x8x

[13:30](#msg5c6d5672f7fc3c4daff6a9c8)@9214 CLI console idle and no issues. I had problems months ago with the event loop on macOS CLI console when running/stopping View code but Qingtian fixed those.

9214

[13:38](#msg5c6d584ec4da4a11f587add5)@x8x thanks!

## Thursday 21st February, 2019

hiiamboris

[18:49](#msg5c6ef2c2b6c74f1e2e8c2c23)Can anybody tell me what kinds of curves are these:  
!\[](https://i.gyazo.com/133db64e38a483832984dfe6ddc7ea7c.png)

```
curves: [line curv curve qcurv qcurve]
view probe collect [
	foreach ctype curves [
		keep compose/deep [
			base 250x250 draw [
				scale 10 10 pen linear cyan purple
				shape [(ctype) 5x5 20x5 20x20 5x20]
			]
		]
	]
]
```

[18:50](#msg5c6ef2f4ddaa310c89cafa8b)Or rather, is it me nuts or Draw?

toomasv

[19:37](#msg5c6efe1000aa630d9aece27f)You :smile:

[19:41](#msg5c6efed0a7d733509da3ddb6)

```
curves: [line curv curve qcurv qcurve]
view probe collect [
    foreach ctype curves [
        keep compose/deep [
            base 250x250 draw [
                scale 10 10 pen linear cyan purple
                shape [move 5x5 (ctype) 20x5 20x20 5x20]
            ]
        ]
    ]
]
```

[19:46](#msg5c6f0020a7d733509da3e81d)\[!\[image.png](https://files.gitter.im/red/bugs/EObF/thumb/image.png)](https://files.gitter.im/red/bugs/EObF/image.png)

hiiamboris

[19:51](#msg5c6f0136c4da4a11f592d10c)@toomasv :D  
OK so, contrary to `line` they always start from 0x0 it seems  
Shouldn't they be all symmetric though? And how come they have straight &amp; acute (unsmoothed) angles (4th, qcurv, is the killer really)? Or what role does the point 5x20 play in `curv` and `qcurve`?

toomasv

[20:01](#msg5c6f03a9c4da4a11f592e0bc)@hiiamboris Yeah, seems to have regressed.

hiiamboris

[20:13](#msg5c6f0671c4da4a11f592f0dd)Interesting that R2 gives the same output, with the exception of `curv` and `qcurv` missing (unsupported probably, can't even find the docs for R2 shape dialect)

greggirwin

[20:30](#msg5c6f0a6000aa630d9aed3f15)@hiiamboris http://www.rebol.com/docs/draw-ref.html

[20:31](#msg5c6f0aa1c776985d8f2f2c49)There is a "SHAPE commands" section in there.

hiiamboris

[20:44](#msg5c6f0da1a378ef11f61a2d44)@greggirwin Is it R2 doc though? I can't make heads or tails of how to properly use these 4 curves in R2.

[21:25](#msg5c6f175d85b7eb45690cf739)figured:  
!\[](https://i.gyazo.com/d857254fdb53e11821a4385f37df35d9.png)

## Friday 22nd February, 2019

ne1uno

[02:22](#msg5c6f5cefe5eeec0d9ba65208)`\tests\shape-test.red`

[02:24](#msg5c6f5d6785b7eb45690f21fb)you have to use `qcurve` before `qcurv` or some other shape?

toomasv

[04:14](#msg5c6f770ae5eeec0d9ba6e72e)Recalled:

```
view [box 650x250 draw [translate 10x100 shape [curve 100x100 200x100 300x0 curv 500x-100 600x0 move 0x0]]]
```

[04:14](#msg5c6f771000aa630d9af0636b)\[!\[image.png](https://files.gitter.im/red/bugs/RqsF/thumb/image.png)](https://files.gitter.im/red/bugs/RqsF/image.png)

[04:16](#msg5c6f7792e5eeec0d9ba6ea6f)

```
view [box 650x250 draw [translate 10x100 shape [qcurve 100x100 200x0 qcurv 400x0 move 0x0]]]
```

[04:16](#msg5c6f7796c82c68509e17936d)\[!\[image.png](https://files.gitter.im/red/bugs/rGbL/thumb/image.png)](https://files.gitter.im/red/bugs/rGbL/image.png)

[04:30](#msg5c6f7af29e430b3086a7e1ea)Old examples still working:  
\[Quadratic](https://gist.github.com/toomasv/6176114cf830390bc46bca29ba2b029f)  
\[!\[quadratic-bezier](https://toomasv.red/images/Animations/quadratic-bezier.gif)](https://toomasv.red/images/Animations/quadratic-bezier.gif)

\[Cubic](https://gist.github.com/toomasv/8d297d6b65613c181be41fcf693e3655)  
\[!\[cubic-bezier](https://toomasv.red/images/Animations/cubic-bezier1.gif)](https://toomasv.red/images/Animations/cubic-bezier1.gif)

## Saturday 23th February, 2019

rebolek

[07:44](#msg5c70f9e9c4da4a11f59f9b48)I’ve just compiled gui-console on Mac from latest sources and it crashes. Can anyone confirm this?

rcqls

[07:45](#msg5c70fa35a7d733509db0bc5f)I never managed to have gui-console on Mac working. I’ll give a try...

[07:52](#msg5c70fbdab6c74f1e2e99567a)@rebolek It works for me compiled in release mode with the latest red?

[07:57](#msg5c70fcd17667931e2fe8bf04)Note that I am still on mac Sierra 10.12.6

rebolek

[08:54](#msg5c710a44c4da4a11f5a000a7)@rcqls thanks. Then you are on cutting edge, I’m still on 10.11.6 :)

[08:55](#msg5c710a93a7d733509db11dd1)Here’s log https://pastebin.com/rdKBczf7

[08:58](#msg5c710b28b6c74f1e2e99aae2)But usually I get just access violation.

[09:02](#msg5c710c127667931e2fe9187b)Hm, but my automated build works. Good thing I made that service :smile:

[09:02](#msg5c710c331f14630421083f92)It’s throwing some strange error on start, but otherwise it’s fine:

```
*** Access Error: cannot open: %-psn_0_430185
*** Where: read
*** Stack: 
--== Red 0.6.4 ==-- 
Type HELP for starting information.
```

rcqls

[09:04](#msg5c710c969155d45d905e601a)Weird indeed!

rebolek

[09:05](#msg5c710cc2c82c68509e21863c)@rcqls can you please check the automated build for that error message?

rcqls

[09:10](#msg5c710e14c776985d8f3c0e8b)Confirmed

```
*** Access Error: cannot open: %-psn_0_2032112
*** Where: read
*** Stack: 
--== Red 0.6.4 ==-- 
Type HELP for starting information.
```

rebolek

[09:11](#msg5c710e375df86a45687e99cc)Hm, you have different number there.

[09:11](#msg5c710e4c9155d45d905e6ae5)I’ve tried macos-gui-190222.app.tar.gz

rcqls

[09:12](#msg5c710e629e430b3086b1e807)me too! What is psn?

rebolek

[09:13](#msg5c710ea47667931e2fe926da)I have no idea.

rcqls

[09:14](#msg5c710f12ddaa310c89d8ee7f)some temporary file built when creation of red binary. The filename is weird, it is incomplete ?

rebolek

[09:16](#msg5c710f6685b7eb456919cb5f)On second run I get no error.

rcqls

[09:17](#msg5c710f8ca7d733509db13e3f)Confirmed!

rebolek

[09:18](#msg5c710ff800aa630d9afa8ae8)What I don’t understand is why we have different name.

endo64

[23:06](#msg5c71d2007667931e2fedec23)A temporary file or folder? Just wild guessing..

## Sunday 24th February, 2019

gltewalt

[00:06](#msg5c71dfeac4da4a11f5a548a1)psn is a process serial number that macOS assigns

[00:06](#msg5c71e023a378ef11f62c76f3)I think it assigns one when an app is open by GUI

rcqls

[15:32](#msg5c72b921e5eeec0d9bbb70af)Is it on purpose? In a slightly modified example of rich-text from the doc, the size of the rtd-layout is fixed to 150x150 and does not fit with the size of the rich-text:

```
view compose/deep [
    rich-text 400x200 draw [
        text 10x10 (rt: rtd-layout [i/blue ["Hello " red/b [font 24 "Red " /font] "World! Lalalalala"]])
        line-width 5 pen gold
        line ; Let's draw line under words using a pair of above helper functions
			(as-pair 10 h: 10 + rich-text/line-height? rt 1) ; Starting-point y -> 10 + line-height
			(as-pair 10 + pick size-text rt 1 h) ; End-point x -> 10 + length-of-text-size
    ]
]
```

[15:33](#msg5c72b944c776985d8f462435)\[!\[Capture d’écran 2019-02-24 à 16.33.01.png](https://files.gitter.im/red/bugs/rPbg/thumb/Capture-d\_ecran-2019-02-24-a-16.33.01.png)](https://files.gitter.im/red/bugs/rPbg/Capture-d\_ecran-2019-02-24-a-16.33.01.png)

toomasv

[16:37](#msg5c72c8639e430b3086bc48ad)@rcqls `rtd-layout` creates a face with default size. You may have to adjust it before using, e.g.:

```
rt: rtd-layout [i/blue ["Hello " red/b [font 24 "Red " /font] "World! Lalalalala"]]
rt/size/x: 380
view compose/deep [
    rich-text 400x200 draw [
        text 10x10 (rt)
        line-width 5 pen gold
        line ; Let's draw line under words using a pair of above helper functions
            (as-pair 10 h: 10 + rich-text/line-height? rt 1) ; Starting-point y -> 10 + line-height
            (as-pair 10 + pick size-text rt 1 h) ; End-point x -> 10 + length-of-text-size
    ]
]
```

[16:39](#msg5c72c8ca7667931e2ff38db2)\[!\[image.png](https://files.gitter.im/red/bugs/sfdB/thumb/image.png)](https://files.gitter.im/red/bugs/sfdB/image.png)

rcqls

[16:42](#msg5c72c978a7d733509dbbbaa7)@toomasv Thanks for the fix. But It is weird that rtd-layout does not offer the possibility to directly fix the size instead of use the prefixed size 150x150 which is completely arbitrary. I mean it is not in the red spirit… BTW, I spent a lot of time tdealing with this kind of example where rtd is used before the visualization of the rich text widget. The layout manager in gtk exists properly only when the rich-text is drawn.

toomasv

[16:47](#msg5c72caa09155d45d9068d3f2)@rcqls Where there is a need there is a way (sometimes :smile: ):

```
view compose/deep [
    rich-text 400x200 draw [
        text 10x10 (rt: first layout/only [rich-text 380x180 data [i/blue ["Hello " red/b [font 24 "Red " /font] "World! Lalalalala"]]])
        line-width 5 pen gold
        line ; Let's draw line under words using a pair of above helper functions
            (as-pair 10 h: 10 + rich-text/line-height? rt 1) ; Starting-point y -> 10 + line-height
            (as-pair 10 + pick size-text rt 1 h) ; End-point x -> 10 + length-of-text-size
    ]
]
```

rcqls

[16:49](#msg5c72cb08b6c74f1e2ea44565)@toomasv You are a champion of the red language!

toomasv

[16:49](#msg5c72cb2fc776985d8f469605) :relaxed:

rcqls

[18:04](#msg5c72dcbae5eeec0d9bbc5201)Better and better! \[!\[Capture d’écran 2019-02-24 à 19.02.59.png](https://files.gitter.im/red/bugs/v2WT/thumb/Capture-d\_ecran-2019-02-24-a-19.02.59.png)](https://files.gitter.im/red/bugs/v2WT/Capture-d\_ecran-2019-02-24-a-19.02.59.png)

toomasv

[18:09](#msg5c72dddeab952d30858473c7) :relieved:

## Monday 25th February, 2019

endo64

[22:29](#msg5c746c5cd98a4d50760a31b8)Shouldn't `s` be `" 2"`?

```
>> s: "1 2"
>> load/next/trap s 's
>> s
== [[1] " 2" none]
```

hiiamboris

[23:07](#msg5c74752d4e758e79a3983c98)I find these 4 results unexpected. What do you guys think?

```
>> save s: #{} 'junk
*** Script Error: suffix? does not allow binary! for its path argument
*** Where: suffix?
*** Stack: save suffix?  

>> save s: "" 'junk
== "#{6A756E6B}"

>> save %tmpfil none  type? load %tmpfil
== word!

>> save %tmpfil [1]  load %tmpfil
== 1
```

[23:14](#msg5c7476c60bd37b4835caa623)@endo64 I think you're right there

greggirwin

[23:42](#msg5c747d4bbdb9b83f18f88919)@endo64 looks like we need clarifications on the designed interaction of `/next` and `/trap`. `Load` is a mezz, but a use-case document would be great, as this is a powerful tool in our arsenal. Maybe @toomasv or others who have done some step-tracing tools can weigh in.

hiiamboris

[23:42](#msg5c747d81b54299599d7b086c)5th:

```
>> type? load mold none
== word!
```

greggirwin

[23:44](#msg5c747dcad0bfe95811a67cb1)@hiiamboris loading "none" \*should* result in a word.

hiiamboris

[23:44](#msg5c747de7b54299599d7b0c91)indeed, but should saving/molding `none` not result in `"#[none]"`?

greggirwin

[23:45](#msg5c747e1cbdb9b83f18f88f64)That's what `mold/all` is for.

hiiamboris

[23:46](#msg5c747e404d8904118cea723e)what's even the point of saving something that won't be loaded properly anyway?

greggirwin

[23:46](#msg5c747e4b0bd37b4835cade81)Forming and molding are design gray areas for some types, to be sure.

[23:47](#msg5c747eaeb54299599d7b10c7)That's exactly what `/all` is for. We have both `save` and `write` as well. `Mold` doesn't know how you're going to use its result.

[23:48](#msg5c747ecb0bd37b4835cae1ca)I think the `save` `suffix?` issue is a known one.

hiiamboris

[23:48](#msg5c747eda4e758e79a39878e5)I see. So there's a certain asymmetry in meaning of /all for load and for save/mold.

greggirwin

[23:49](#msg5c747efc55d9a05812437ed0)Yes. No perfect solutions there.

hiiamboris

[23:50](#msg5c747f4e6d148f48344f478b)What about the other two:

```
>> save %tmpfil [1]  load %tmpfil
== 1    ; in R2 = [1]

>> save s: "" 'junk
== "#{6A756E6B}"     ; why on earth a binary is put into a string??
```

greggirwin

[23:58](#msg5c748111ed21832d370d88b5)Loading single values in R2 was a source of some pain, so Red added the common shortcut, which is also not a perfect solution, depending on how you use it. It's intentional though. @dockimbel will have to give his use case reasoning.

The binary issue may be unintentional. `Save` is a mezz, so we can easily analyze. The value is molded, then converted to binary. Rebol couldn't save in to a string, and there's another wrinkle. Saving to files or urls overwrites prior content, but appends to string and binary values.

## Tuesday 26th February, 2019

hiiamboris

[00:13](#msg5c7484a666e2b3118b1a7d19)`save` could've had an `/only` refinement for symmetry with `mold/only`  
Otherwise I see no reliable way to balance save with load:

```
>> save/all %tmpfil [1]  load %tmpfil
== 1    ; no /all = wrong on blocks
>> save/all %tmpfil 1  load/all %tmpfil
== [1]    ; with /all = wrong on values
```

toomasv

[08:16](#msg5c74f5e15015f21e19601bf5)@endo64 `/trap` can be made to work with `/next`, but it seems mostly to be useful without it, as it overrides `/next` refinement's usual semantics. I don't think it was meant to be used with `/next`. To trap errors with `/next` without overriding its semantics something like this can be used:

```
>> s: "1 2 3bad"
== "1 2 3bad"
>> either error? n: try [load/next s 's]['error][n]
== 1
>> either error? n: try [load/next s 's]['error][n]
== 2
>> either error? n: try [load/next s 's]['error][n]
== error
>> to-block n
== [make error! [
    code: 200
    type: 'syntax
    id: 'invalid
    arg1: integer!
    arg2: "3bad"...
```

To use `/next` with `/trap`, something like following can be used:

```
>> s: "1 2 3bad"
== "1 2 3bad"
>> s: second load/next/trap s 'n either error? n/3 ['error][n/1/1]
== 1
>> s: second load/next/trap s 'n either error? n/3 ['error][n/1/1]
== 2
>> s: second load/next/trap s 'n either error? n/3 ['error][n/1/1]
== error
>> to-block n/3
== [make error! [
    code: 200
    type: 'syntax...
```

rcqls

[11:03](#msg5c751cf6c1cab53d6f3f5c1c)@dockimbel @qtxie I am trying to use `offset-to-caret` function (in platform.red) for area widget as used by @toomasv in its wonderful editor.red. `offset-to-caret` function uses directly `text-box-metrics` which seems irrelevant for area widget. This is working for Windows since I guess the API should be the same for both RedBase and RedArea classes. Of course I can intercept the type of widget and insert the right code inside `OS-text-box-metrics` (it is what I’ll do to make things working) but I think that, as `get-size-text` does, this should be redirected directly in `offset-to-caret` function which can deal with specific Windows case.

[11:15](#msg5c751febc1cab53d6f3f6fc5)BTW, editor.red of @toomasv does not work (for me) at all on macOS… Weird!

hiiamboris

[11:58](#msg5c7529ce5015f21e19617af9)@rcqls FYI \*on Windows* all these functions are only valid for rich-text currently. For area and other widgets they will give improper results most of the time.

rcqls

[12:15](#msg5c752de4e1446a6ebe4b1a71)@hiiamboris I know these functions are supposed to be only valid for richtext and it was the purpose of my comment. So maybe @toomasv you should not use this function on your editor.red since there is no rich-text widget. Thanks @hiiamboris!

[12:53](#msg5c7536ace1446a6ebe4b52a3)@hiiamboris I understand why this is working in the example of @toomasv. In fact this function works properly because a (richtext) layout is recreated in order to have the proper info. @toomasv is so clever to notice that. So it is an indirect way to get the cursor position of an area since I don’t think there is a direct way to get it for an area widget. But I think it should be offered the functionnality to get directly the current index for area directly. BTW, `menu-x` and `menu-y` (or something related which are doing the trick to get `event/offset` on EVT\_MENU) are only introduced in Windows and are missing on macOS.

hiiamboris

[13:23](#msg5c753dd9608c6f3736286374)@rcqls let me show you how it really works for area on editor.red example:  
!\[](https://i.gyazo.com/075bff612d18a78abf292a11c270f287.gif)

[13:25](#msg5c753e5d212d0c1e1a9bc215)Although the final hangup was probably not due to the caret-to-offset code...

rcqls

[13:43](#msg5c75428365ffa019ea52b32e)@hiiamboris I guess it is your code? The editor.red of @toomasv is to execute block code inside area. Is there somewhere I can download to try it? Nice butterfly for the pointer. I was considering cursor on GTK yesterday.

[13:45](#msg5c7542fae8ea1437377abb67)Oups by growing the side of the image I see that @toomasv is the author???

toomasv

[14:18](#msg5c754aab47276019e98125ca)It works on W10 as long as you don't scroll the text. Have to reconsider this.

hiiamboris

[14:29](#msg5c754d5ee1446a6ebe4be909)@rcqls no it's https://github.com/toomasv/editor/blob/master/editor.red

[14:30](#msg5c754d7b212d0c1e1a9c2c16)it there another editor.red?

rcqls

[14:32](#msg5c754de235c01307533ffa3f)@hiiamboris That’s the one @toomasv challenges me to make it working on linux… But your beautiful background let me believe it was a different one.

hiiamboris

[14:32](#msg5c754df453efa912037c392f)Oh I see ☻

[14:33](#msg5c754e3fe8ea1437377b07d5)I agree that caret/offset funcs should be implemented for other (native) controls if (hopefully) the OS supports it. But we're not there yet, not even for Windows backend

rcqls

[14:36](#msg5c754ee853efa912037c4179)This is not too difficult… As I said get-text-size is redirected in platform.red depending on richtext or not. So it is possible to provide it for the other text-box-metrics tools in the same way. I could actually propose the PR but I am really busy and above all I am not a red designer.

greggirwin

[19:20](#msg5c759190d2d62067b70f15c2)@toomasv, would you please add your above notes on `load/next/trap` to https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations ? Thanks.

[19:22](#msg5c759207e8ea1437377ce365)@hiiamboris the first step in proposing changes for `mold`, `load`, and `save` is to document how things work today, considering `write` and `form` also. That way we can point to the exact issues and see if proposals can address them without introducing new ones.

[19:23](#msg5c75921f4a65f7547330316d)And if we decide not to change things, then we at least have the current behavior clearly documented, to guide people in their use.

hiiamboris

[19:33](#msg5c7594942ca5ec547444e63a)red/REP?

toomasv

[19:46](#msg5c75977cd2d62067b70f44ec)@greggirwin \[Done](https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#using-load-with-next-and-trap)

greggirwin

[19:57](#msg5c759a1bc1cab53d6f42b526)@toomasv :+1:

@hiiamboris, yes, I think so.

## Wednesday 27th February, 2019

hiiamboris

[00:09](#msg5c75d53935c013075343a0f5)@greggirwin https://github.com/red/REP/issues/44

greggirwin

[21:17](#msg5c76fe63e8ea143737865880):+1:

## Thursday 28th February, 2019

bitbegin

[02:01](#msg5c7740ddc1cab53d6f4d92b5)

```
Red []

a: func t: [x y][print x + y]
b: func t [print x + y]

a 1 2
b 3 4
```

[02:02](#msg5c77413a0966d91204f9107d)the compiled result is nothing printed, but the console result is "3 7".

[02:02](#msg5c774151e8ea14373787fcc2)Is it a bug for compiler?

PeterWAWood

[05:13](#msg5c776e0f47276019e98f18af)@bitbegin I don't think this is a bug. After evaluating an expression, the console displays the last value in the console. The compiler does not.

bitbegin

[07:14](#msg5c778a6d5015f21e1970f373)how to explain why the compiler's result is empty

PeterWAWood

[08:08](#msg5c7796ee65ffa019ea620fce)The compilers result is not empty, it has been discarded by the programmer.

Red evaluates the expression`a 1 2` to 3. The console takes that value and displays it in the console. The program ignores the result of the evaluation.

[08:08](#msg5c7797055015f21e1971433a)Try this in the console:

```
Red []

a: func t: [x y][print x + y]
b: func t [print x + y]

do [
    a 1 2
    b 3 4
    ""
]
```

bitbegin

[08:11](#msg5c7797a48a7def0752ec7c94)the function `a`/`b`'s body have `print`

[08:11](#msg5c7797b45015f21e19714a22)do you noticed?

PeterWAWood

[08:12](#msg5c7797d865ffa019ea6216a4)Sorry I didn't.

[10:39](#msg5c77ba698a7def0752ed6396)@bitbegin Yes, it does look like a bug though I'm not sure if the compiler is able to handle such code yet. @greggirwin or @Qxtie should know.

9214

[10:46](#msg5c77bbfb2ca5ec547452f16f)It's a compiler limitation, from what I recall.

xqlab

[12:43](#msg5c77d77a65ffa019ea63c701)Since when does the specification of a function no longer allow a comment after \*\*return:\** ?

```
>> f: func [return: [integer!] "descr" ]  []
*** Script Error: invalid function definition: return:
*** Where: func
*** Stack: f
```

9214

[12:50](#msg5c77d92be1446a6ebe5cb5a2)\[Since a while](https://github.com/red/REP/issues/24#issuecomment-421125411).

xqlab

[12:55](#msg5c77da5ce8ea1437378be793)Will it be possible again?

9214

[13:01](#msg5c77dbc1b1503b3d70585df2)As soon as function's spec design is settled.  
https://github.com/red/red/issues/3595

hiiamboris

[13:08](#msg5c77dd6335c0130753511010)A little remark: it is still supported by the compiler.

greggirwin

[21:08](#msg5c784de4e1446a6ebe5ff847)Printing from the compiler may not have been addressed yet, as Full I/O is in progress, and may affect STDOUT, etc.

## Saturday 2nd March, 2019

Oldes

[20:02](#msg5c7ae145e1446a6ebe708ba2)@qtxie maybe it's just a detail, but \[you are closing theme](https://github.com/red/red/blob/202bfb031a4e7f2ffe8c25d7f1e273f06c825144/modules/view/backends/windows/gui.reds#L692) only when \[GetThemeSysCall](https://github.com/red/red/blob/202bfb031a4e7f2ffe8c25d7f1e273f06c825144/modules/view/backends/windows/gui.reds#L666) was without error. It would be safer to put the line out of \[this block](https://github.com/red/red/blob/202bfb031a4e7f2ffe8c25d7f1e273f06c825144/modules/view/backends/windows/gui.reds#L674-L693)

## Monday 4th March, 2019

ne1uno

[20:27](#msg5c7d8a4c65ffa019ea893de9)something change for reactor code? \*\** Script Error: add-relation does not allow object! for its targets argument

[20:28](#msg5c7d8a892ca5ec5474788efb)I lifted some timer code from `retris.red`

hiiamboris

[20:53](#msg5c7d9030d2d62067b74387b2)Blame me @ne1uno. An oversight.

[20:57](#msg5c7d912bd2d62067b743903a)https://github.com/red/red/pull/3798

greggirwin

[21:10](#msg5c7d9433e1446a6ebe81df5a)Merged. We should add a test for that.

[21:10](#msg5c7d943b0966d91204226d86)Thanks for the quick response @hiiamboris.

## Tuesday 5th March, 2019

ralfwenske

[00:03](#msg5c7dbcc047276019e9b805a6)Following code seems to work on W7. Crashes on Mac. Image size seems to not matter, even though memory gets eaten up according to image size.

```
Red [Needs:	View] 
makegradientimage: func [gradientcolors][
  cmd: compose [
    fill-pen linear ( gradientcolors) 0x0 0x800
    box 0x0 1200x800
  ]
  draw 1200x800 cmd
]
img1: makegradientimage [yellow red]
img2: makegradientimage [red yellow]
img3: makegradientimage [blue green]
images: [img1 img2 img3]
count: 0
forever [ 
  forall images [
    view/no-wait compose [ image (images/1)] wait 0.1 unview
    count: count + 1 print count
  ]
]
```

results in:

```
32
33

*** Runtime Error 1: access violation
*** at: 000C9F01h
>> about
Red 0.6.4 for macOS built 5-Mar-2019/7:09:36+10:00 commit #53b5b37
```

[00:10](#msg5c7dbe874a65f7547365845a)However, as suggested by @9214 I inserted `recycle/off`: app does not crash anymore (at least until available memory is exhausted).

hiiamboris

[00:26](#msg5c7dc246e1446a6ebe830980)@ralfwenske we have an issue tracker ☻ https://github.com/red/red/issues/new/choose  
You may also save Qingtian some work by reducing this snippet to a single empty image I believe.

ralfwenske

[04:19](#msg5c7df8df65ffa019ea8bef7c)@hiiamboris #3801

hiiamboris

[11:02](#msg5c7e57498a7def075218753e)@ralfwenske :+1: nice job

qtxie

[14:59](#msg5c7e8ecf47276019e9bd5280)@Oldes Yes. You're right.

hiiamboris

[19:48](#msg5c7ed2a20966d912042ae839)I'm not sure what to make of this:

```
o: object [
	i: 1
	on-change*: func [w o n] [print [w "changed" o ">" n]]
]
o/i: o/i + 1
set in o 'i o/i + 1
do bind [i: i + 1] o
? o/i
```

Outputs me:

```
i changed 1 > 2
O/I is an integer! value: 4
```

I think it's a serious bug, but I'm open to opinions

9214

[20:11](#msg5c7ed7f9c1cab53d6f7ecaf9)@hiiamboris seems like a limitation of ownership model to me. Reaction is triggered only with `set-path!` usage.

[20:12](#msg5c7ed831e8ea143737b9a9b0)Worth to note it in a ticket or some wiki page, as object ownership implementation is not finalized yet.

hiiamboris

[20:14](#msg5c7ed88f2ca5ec547481556d)@9214 ok thanks

## Friday 8th March, 2019

PeterWAWood

[05:55](#msg5c8203ccb4b6ef7bc874b564)Re: #3209  
Changing line 194 of `parse.reds` from  
`if any [type = TYPE_LIT_WORD type = TYPE_LIT_PATH][`  
to  
`if type = TYPE_LIT_PATH [`  
will fix the immediate problem. As I don't know the code, it is hard to say whether this would introduce issues elsewhere.

[06:09](#msg5c820709e527821f0a222b8b)These two tests fail when the line 194 of parse.reds is changed:

```
--test-- "replace/case/deep-1"	--assert [x A x B [x A x B]] = replace/case/deep/all [a A b B [a A b B]] ['a | 'b] 'x
	--test-- "replace/case/deep-2"	--assert (quote (x A x B (x A x B))) = replace/case/deep/all quote (a A b B (a A b B)) ['a | 'b] 'x
```

## Tuesday 12nd March, 2019

amreus

[08:13](#msg5c876a23293ac75db592a7b7)I am trying to use `read` on a file in order to parse some numbers out of it. I am getting the following error:

```
>> read %out
*** Access Error: invalid UTF-8 encoding: #{B7207477}
*** Where: read
*** Stack:  

>>
```

I have tracked the "bad" character in the file to the dot in this string: `one · two`

I can read the file as binary, but then using `to-string` also gives the same error.

Is this a bug? Is there a work-around? Thanks.

9214

[09:58](#msg5c8782c725e4e24c07577e5a)@amreus "bad" character is `U+00B7` and shouldn't cause any trouble. That is, assuming that your file uses UTF-8 encoding.

```
>> to binary! probe #"^(00B7)"
#"·"
== #{C2B7}
>> to binary! probe "one ^(B7) two"
"one · two"
== #{6F 6E 65 20 C2B7 20 74 77 6F} ; spaced out code units by hand
```

hiiamboris

[10:16](#msg5c8786fc25e4e24c07579b10)looks like he's reading an iso8859-1-encoded file

amreus

[20:03](#msg5c88107925e4e24c075b8128)Ah saving the file as UTF-8 worked. I've run into encoding issues before although not in Red. It all seems like a problem that should have been solved already. Thanks for the help.

## Thursday 14th March, 2019

9214

[21:10](#msg5c8ac353ac408e11925e41a2)Can any :penguin: people here reproduce https://github.com/red/red/issues/3811 ?

## Friday 15th March, 2019

BeardPower

[11:27](#msg5c8b8c21f5841318cdf33952)I experience a crash with RTD:

```
>> view [rich-text 100x100 draw [text 10x10 "hello"]]
```

```
>> about
Red 0.6.4 for Windows built 14-Mar-2019/18:49:29+01:00 commit #43b2683

>> about/debug
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 193 date: 14-Mar-2019/17:49:29 commit: #43b26838b4a39cd20e06a9b6c2f5c2b873e058b7 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
--------------------------------------------
>>
```

[11:29](#msg5c8b8ca9f8066c18ce5083e0)I noticed also that

```
ahead
```

says 193. Why is that? It's at the most recent commit.

[11:30](#msg5c8b8cf0f5841318cdf33f90)&gt; Can any :penguin: people here reproduce https://github.com/red/red/issues/3811 ?

No. I had the most recent console version open for 8h straight without any crash.

rebolek

[12:00](#msg5c8b93eac25d677f842c4c7f)I haven’ seen such problem yet too.

toomasv

[12:48](#msg5c8b9f2e3519ca08c7b0d653)@BeardPower Correct way is

```
view compose/deep [rich-text 100x100 draw [text 10x10 (rtd-layout ["hello"])]]
```

But crash should be an issue, no?

9214

[12:53](#msg5c8ba045f8066c18ce51067f)@BeardPower https://github.com/red/red/issues/3459 ?

endo64

[13:57](#msg5c8baf2cc25d677f842d0cdf)Should we reopen that ticket with a comment? qtxie's last comment is `It will throw an error now.`

toomasv

[14:13](#msg5c8bb31e2b6075296bcdd5e5)@endo64 It was different... `image!` creation with `draw`.

BeardPower

[14:47](#msg5c8bbb05f5841318cdf49e47) @toomasv The doc says that text can take a rich-text object or just text.

[14:48](#msg5c8bbb3f2b6075296bce0d74)@9214 Does not crash but results in an error:

```
>> (draw 100x100 compose [text 50x50 (rtd-layout [b "test" /b])])
*** Script Error: invalid Draw dialect input at: [make object! [type: 'rich-text offset: none size: 150x150 text: "test" image: none color: 255.255.255 menu: none data: [1x4 bold] enabled?: true visible?: true selected: none flags: none options: none parent: none pane: none state: none rate: none edge: none para: none font: none actors: none extra: none draw: none tabs: none line-spacing: 'default handles: [handle! handle! handle! "test" true]]]
*** Where: draw-image
*** Stack: draw
```

[14:51](#msg5c8bbc0eb1a04977607dbeb2)

```
Draw extension

text <pos> <text>

<pos>  : a pair! value indicating the upper left corner of the text-box.
<text> : a string, or a rich-text face object with a rich-text description in single-box
```

[14:52](#msg5c8bbc24c627612ffda09788)According to the doc my example should be valid.

[14:53](#msg5c8bbc4c85ba5b30a11df544)a string OR a rich-text face.

toomasv

[15:00](#msg5c8bbe0785ba5b30a11e058d)@BeardPower Ah, you are right.

[17:22](#msg5c8bdf72a28d73296cf0f56b)@BeardPower Is \[here](https://github.com/red/red/blob/master/modules/view/backends/windows/draw-d2d.reds#L256) the reason? If so, doc is ahead the time.

BeardPower

[19:24](#msg5c8bfc02c627612ffda26132)@toomasv I did not look into the source and what the rtd draw extension is calling.

## Saturday 16th March, 2019

dockimbel

[13:16](#msg5c8cf7170d71905057147503)@BeardPower It is meant to be a feature, if the Draw dialect is missing support for it, you can send a PR to allow it.

hiiamboris

[14:45](#msg5c8d0c078aa66959b61dd954)Can somebody try to run this snippet on Windows please https://gitlab.com/snippets/1836128  
It's one of the most reproducible heisenbugs I encounter almost every day. This one at least is unaffected by comments.  
I can reproduce it only with (the default, set up by red.exe) CLI console: `red --cli bug11.red`, and only with builds since (and including) March 4. The previous build I have is from January 30 - it does not appear there, most likely because it's RAM layout is a little bit different.  
In 80% runs or so, I get an error (this is what I'm trying to hunt here):

```
*** Script Error: PARSE - matching by datatype not supported for any-string! input
*** Where: parse                                                                  
*** Stack: view show show do-safe react
```

Removing some unused code or changing the number of items in `d` and `d2` lists makes the bug go away.

[15:03](#msg5c8d103d6a3d2e230dd48985)I've run it 200 times for `d2` lengths 1..200 and my results so far are:  
\- parse error on lengths 71, 100, 108 (hello, magic number)  
\- crash on 110 items  
After that it goes steady again

rcqls

[15:19](#msg5c8d140f8aa66959b61e1387)VSCode extension 0.3.0 update makes syntax highlighting for red/system not working. Is it the same for other people? I fortunately was able to install extension 0.2.2 which works as before. I can’t live without red/system highlighting….

toomasv

[15:21](#msg5c8d146efa5b721a1f9c496c)@hiiamboris I run it few times without error with 14march build (W10). When wheeling, I get error `*** Script Error: cannot access wheel-outside? in path fa/wheel-outside?`.

hiiamboris

[15:25](#msg5c8d155c6a3d2e230dd4aaf8)Ok. So the OS-specific code affects it a lot too. Thanks @toomasv

rcqls

[15:26](#msg5c8d15ac8126720abcf1cf7c)VSCode seems to install automatically the updated extension 0.3.0 (at least on macOS) …. and things go wrong for me for syntax highlighting for red/system again….

toomasv

[16:20](#msg5c8d22319d9cc8114acec16d)@hiiamboris :+1:

BeardPower

[16:53](#msg5c8d2a178126720abcf260c3)@dockimbel Will do.

## Sunday 17th March, 2019

bitbegin

[03:19](#msg5c8dbcb9dfc69a1454a83c00)@rcqls update a minor version to support `red/system` syntax highlighting

rcqls

[05:57](#msg5c8de1b4a21ce51a2073244a)@bitbegin Excellent! It’s a bit weird that syntax file for `red/system` needs to be created since `source.reds`scope seems to be the same then `source.red` scope. Thanks for your fix, it works perfectly…

## Tuesday 19th March, 2019

ralfwenske

[10:08](#msg5c90bfa7f3dbbd230c7ef750)Is this a bug (in style width works, height doesn’t)?  
!\[alt](https://ralfwenske.net/Screen%20Shot%202019-03-19%20at%207.32.52%20pm.png)  
Red 0.6.4 for macOS built 19-Mar-2019/2:56:13+10:00 commit #bec4e2e

```
Red [needs 'view]
view [
  style styledf1: field 150x30 font [size: 14]
  style styledf2: field 200x30 font [size: 14]
  below
  f1: field 150x30 "f1" font [size: 14]
  f2: field 150x30 "f2" font [size: 14]
  f3: styledf1 "f3"
  f4: styledf1 "f4"
  f5: styledf2 "f5"
  f6: styledf2 "f6"
]
```

rebolek

[10:31](#msg5c90c50edfc69a1454bbd68e)This looks like a bug to me

ralfwenske

[11:30](#msg5c90d2d13dd817114916e211)Thanks @rebolek will file tomorrow

rebolek

[12:29](#msg5c90e0c06a3d2e230deceb3e)@ralfwenske btw, I can't reproduce it on Linux. Can someone try it on Windows?

rcqls

[12:32](#msg5c90e17b2fb6800d8045f80f)@rebolek I was about to joke about that on linux/GTK…

rebolek

[12:33](#msg5c90e191fcaf7b5f73dcb6f7):)

hiiamboris

[12:55](#msg5c90e6b1fcaf7b5f73dcdb3d)@rebolek I tried it on W7 and can confirm.

[12:56](#msg5c90e712fcaf7b5f73dcdd8c)!\[](https://i.gyazo.com/1439583da96ea0739d4a0101919c4daa.png)

[12:58](#msg5c90e770fa5b721a1fb4d6bf)And I think there should be a separate issue for Mac that field height is incorrectly inferred automatically from font height.

rcqls

[13:00](#msg5c90e7f22fb6800d804626b0)Maybe on linux/GTK, field sizes are often chosen by GTK itself when the sizes don’t fit well. This can explain why it works on linux whenever there is a bug in VID styles. But I am not sure ….

toomasv

[13:10](#msg5c90ea5afcaf7b5f73dcf735)On W10 it is OK

[13:10](#msg5c90ea63fa5b721a1fb4e97f)\[!\[image.png](https://files.gitter.im/red/bugs/OFJA/thumb/image.png)](https://files.gitter.im/red/bugs/OFJA/image.png)

rcqls

[13:12](#msg5c90eab7dfc69a1454bcdc26)Great !

endo64

[14:08](#msg5c90f7cd49fdaa0d81de3d19)Works on my Win10 too.

greggirwin

[20:24](#msg5c914fff2fb6800d80491be3)So it looks like Red is \*trying* to set it, as it works in some places, but maybe the platform specific APIs need to be used differently. Seems odd, but...

Since I can't dupe it on Win10, can someone try a couple variations:

```
view [
  style styledf1: field 150x30 font [size: 14]
  style styledf2: field 200x30 font [size: 14]
  below
  f1: field 150x30 "f1" font [size: 14]
  f2: field 150x30 "f2" font [size: 14]
  f3: styledf1 150 "f3"      ; override width
  f4: styledf1 150x30 "f4"   ; override size
  f5: styledf2 "f5"
  f6: styledf2 "f6"
]
```

hiiamboris

[20:36](#msg5c9152e1f3dbbd230c832368)W7 - f3 doesn't get height from style, f4 overridden successfully  
!\[](https://i.gyazo.com/b487f37770d561f9770697928b14e8ce.png)

endo64

[21:36](#msg5c9160f73dd81711491af5ee)Here is the screenshot on my Win10

[21:36](#msg5c9160fb8126720abc0df61a)\[!\[image.png](https://files.gitter.im/red/bugs/bx5i/thumb/image.png)](https://files.gitter.im/red/bugs/bx5i/image.png)

## Wednesday 20th March, 2019

greggirwin

[00:54](#msg5c918f553dd81711491c1b60)Thanks guys.

ralfwenske

[01:03](#msg5c91916b3dd81711491c25a8)@greggirwin modified version on my mac:  
!\[alt](https://ralfwenske.net/Screen%20Shot%202019-03-20%20at%2010.59.34%20am.png)

greggirwin

[03:30](#msg5c91b3bbfa5b721a1fba58d8)Now we know only an explicit override of the height works. Thanks!

gltewalt

[18:42](#msg5c928990f3dbbd230c8b4d69)Seems to be an issue with `q`. Things like `print q` kills the GUI Console, and exits the CLI console.

[18:42](#msg5c9289b2f3dbbd230c8b4ecc)Should error?

rebolek

[18:43](#msg5c9289c9a21ce51a20923fdf)`print` evaluates, so it's expected

gltewalt

[18:46](#msg5c928a76dfc69a1454c83c98)`what q`

[18:46](#msg5c928aa049fdaa0d81e93585)I don't think `q` should fire off if it is supplied to a function

9214

[18:47](#msg5c928ab2fcaf7b5f73e80191)@gltewalt `what` is a 0-arity function.

rebolek

[18:47](#msg5c928ad552c7a91455c91574)`q: "tralala, I'm safe now"` and it's solved

gltewalt

[18:49](#msg5c928b313dd817114922f27d)`what` errors when giving an argument except for `q`.

rebolek

[18:50](#msg5c928b652fb6800d80517bdc)it's certainly not `what` what errors, it what follows

[18:50](#msg5c928b7f3dd817114922f2dc)`what q` is like `none q`

9214

[18:51](#msg5c928b992f6ded0abb163347)@gltewalt again, `what` is a 0-arity function. It doesn't accept any arguments.

[18:51](#msg5c928ba39d9cc8114af2991f)So `what q` first calls `what`, then calls `q`.

gltewalt

[18:53](#msg5c928c15dfc69a1454c847cc)You don't see an issue with q evaluating when it isn't on a line by itself?

rebolek

[18:53](#msg5c928c32d0133e21e5e8845a)no, Red's not Python

[18:53](#msg5c928c420d7190505739246f)you can have whole program on one line

9214

[18:54](#msg5c928c4a52c7a91455c91e79)@gltewalt Red evaluates by expressions, not by lines. `what` and `q` are two separate expressions.

[18:54](#msg5c928c6ef3dbbd230c8b622c)You can write

```
what
q
```

If you really want to, but the effect will be the same.

gltewalt

[18:56](#msg5c928cfb8126720abc15cc48)`if q ["bye"]` &lt;--- I don't like

9214

[18:57](#msg5c928d2f8126720abc15ce47)@gltewalt I don't follow what you're trying to say.

gltewalt

[19:00](#msg5c928dc02fb6800d80518e17)I'm saying that I don't think people will expect the program to quit if they happen to use a line like `if q [do stuff]`. A bit unrealistic example, but chances for unpleasant surprise is there.

9214

[19:01](#msg5c928e1b0d71905057393433)People should expect the program to quit if they explicitly call function that, according to its docstring, `"Stops evaluation and exits the program"`.

gltewalt

[19:01](#msg5c928e1e0d7190505739344c)And I should have posted this in the /help room, I guess, for discussion sake

moliad

[19:02](#msg5c928e4fa21ce51a20926057)the real problem here is that there should not be any standard funtion called 'Q

[19:02](#msg5c928e568aa66959b6423653)'QUIT is short enough.

9214

[19:02](#msg5c928e622fb6800d805192f6)@moliad agreed, we need either a shell-like dialect or a dedicated module for such functions.

moliad

[19:03](#msg5c928e70a21ce51a209260aa)the console could have some shortcuts, but nothing beyond that

gltewalt

[19:03](#msg5c928e73d0133e21e5e892de)So they should expect `help q` to quit the program?

moliad

[19:03](#msg5c928e93fcaf7b5f73e81f45)help q will give the definition of 'Q

9214

[19:03](#msg5c928e95dfc69a1454c858be)@gltewalt `help q` doesn't quit the program.

gltewalt

[19:04](#msg5c928eb12fb6800d80519634)I know, but you said that they should expect to quit if `q` is encountered.

9214

[19:04](#msg5c928ec052c7a91455c92c83)As a separate expression, gee.

[19:04](#msg5c928ecefcaf7b5f73e820ed)Following your logic, even `[q]` should halt the console.

gltewalt

[19:05](#msg5c928efaa21ce51a20926585)That's not my logic.

9214

[19:05](#msg5c928f05f3dbbd230c8b73e3)in `if q [...]` `q` is evaluated as an argument to `if`, so there's no surprise in that.

[19:06](#msg5c928f31a21ce51a20926654)in `help q` `help` soft-quotes its argument and suppresses its evaluation.

gltewalt

[19:06](#msg5c928f369d9cc8114af2b845)I guess I'm saying "no q evaluation if it is an argument to another function"

9214

[19:06](#msg5c928f44fa5b721a1fc05f3a)So `q` is passed as-is, as a `word!` value.

gltewalt

[19:07](#msg5c928f572f6ded0abb164f37)Or dispense with `q` and only have `quit` as stated earlier

9214

[19:07](#msg5c928f6b52c7a91455c93112)`unset 'q`.

[19:07](#msg5c928f762fb6800d80519dfc)`if :q [...]`, whatever.

[19:08](#msg5c928fa3dfc69a1454c86210)Anyway, this belongs to `/help` room.

gltewalt

[19:08](#msg5c928fa6fcaf7b5f73e826df)Of course we can change it, but it might be better to not exist pre-defined?

[19:08](#msg5c928fb22f6ded0abb165332)Yes sir. Sorry.

9214

[19:10](#msg5c9290302f6ded0abb165749)I agree that it shouldn't be pre-defined, but we don't have modules in place, and language design isn't casted in stone, so you should stick to what you have.

rebolek

[19:13](#msg5c9290f38126720abc15eae6)i like `q`

Oldes

[19:20](#msg5c929285d0133e21e5e8af17)me too... and I like `?` too... although one may say, that I can write `help` instead.

## Thursday 21st March, 2019

Oldes

[09:51](#msg5c935eb99d9cc8114af7e47c)This piece of code crashes Red:

```
third write/info/binary http://google.com [GET [Accept-Charset: 'utf-8] ""]
```

rebolek

[09:52](#msg5c935ee3f3dbbd230c90b8f8)Header values must be strings, this is not going to be fixed until new IO is ready.

endo64

[09:52](#msg5c935ef5fcaf7b5f73ed4b96)`write/info/binary http://google.com [GET [Accept-Charset: "utf-8"] ""]` work (string instead of word)

rebolek

[09:53](#msg5c935f1afa5b721a1fc599f3)That's why I autoconvert everything to string in `send-request`: https://github.com/rebolek/red-tools/blob/f2e4cba2d2c2a19caa4b952054d1e88c1d6cdb01/http-tools.red#L224

Oldes

[09:54](#msg5c935f39fa5b721a1fc59ad3)I know... but it should not crash.

endo64

[09:54](#msg5c935f47dfc69a1454cd9196)But it should not crash for sure, there was a ticket for that I think.

rebolek

[09:55](#msg5c935f7452c7a91455ce8a78)IIRC it's not going to be fixed, because that code will be rewritten, so it makes no sense spending time on it.

endo64

[10:10](#msg5c936322fcaf7b5f73ed685d)Another issue about face flags, it looks like the first used flag takes the priority and the rest doesn't get in account:

```
>> view [fld: field no-border all-over on-over [print "."]] ? fld/flags
FLD/FLAGS is a word! value: no-border
```

It should be `[no-border all-over]`  
It looks easy to fix but before I make a PR better to ask here.

rebolek

[11:06](#msg5c93703bd0133e21e5ee66f0)&gt; easy to fix

it should, if you understand how `layout` works. :smile:

[11:31](#msg5c93761edfc69a1454ce4231)@endo64 are there any tests for stuff like this? (styling)

endo64

[12:52](#msg5c93890c8aa66959b648a23e)@rebolek Not that I know.

dockimbel

[15:49](#msg5c93b271d0133e21e5f04e63)About the `q` discussion above, `q` is predefined only when running code from the console. It's an handy shortcut that exists in Rebol console too.

## Friday 22nd March, 2019

gltewalt

[20:46](#msg5c95499681b15c5e4b6d8d0a)Ok, I wasn’t aware that it was only predefined in a console session

## Saturday 23th March, 2019

vazub

[19:00](#msg5c9682580d7190505753638c)Not sure if this is a bug or expected behavior, but multi-line comments inside `parse` rule block seem to be failing. Example:

```
parse "" [
    ; test comment
    (print "one-line comment passed")
    comment {}
    (print "multi-line comment passed")
    thru end
]
```

[19:05](#msg5c9683809d9cc8114a0cf799)The first `print` command succeeds, yet the second doesn't, and parse returns `false`, without ever getting to the end.

9214

[19:21](#msg5c968720d0133e21e50313d0)@vazub `comment` is just a function that simply eats its argument, and has no place in Parse.

```
>> :comment
== func ["Consume but don't evaluate the next value" 'value][]
```

[19:27](#msg5c9688b29d9cc8114a0d194f)In fact, any word in Parse rule that refers to a function is used to match that function in input series:

```
>> parse reduce ['a 'b :comment 'c][2 word! comment 'c]
== true
>> parse reduce [:add :add :divide][2 add divide]
== true
```

vazub

[20:44](#msg5c969aa649fdaa0d810476e0)I see, thanks for clarification. My initial assumption was for multi-line comments to work similarly to other languages, although I missed the fact that `comment` is a word on its own here.

## Sunday 24th March, 2019

greggirwin

[18:28](#msg5c97cc3f2fb6800d80744840)@vazub correct. Red has no multiline comment syntax, though in regular Red evaluation, you can just use a multiline string and it's evaluation will be ignored. Not a great solution, which is why `comment` exists.

9214

[18:48](#msg5c97d0f581b15c5e4b7d4bdd)@vazub you can use this dirty hack as a workaround:

```
#macro comment: func [v][[]]
```

## Monday 25th March, 2019

vazub

[11:31](#msg5c98bc1f6a3d2e230d20f5db)Thanks @greggirwin and @9214 ! It's not that I can't live without having multi-line comments within parse rule block. It's just a bit of a "gotcha" coming from other languages and adjusting one's mindset to different ideas. And technically, I could still do multi-line with `comment`, although using parens around it. Not as intuitive as having multi-line built-in, but will get the job done anyway.

greggirwin

[18:39](#msg5c9920742fb6800d807d41cc)It is kind of a gotcha, because dialects in Red are so invisible.

## Tuesday 26th March, 2019

dockimbel

[15:18](#msg5c9a42b45636de703de5028d)@vazub Red has much more built-in literal forms than other mainstream languages, so finding a multi-line comment syntax that does not collide with an existing syntax \_and_ is readable/friendly/non-esoteric is quite a challenge.

vazub

[21:22](#msg5c9a981bcf786a56c7824711)@dockimbel The more I get to know Red, the more I understand that! It is a fabulous language, yet everything comes with it's price, for sure. Although since you already mentioned that, did you guys consider something of sorts using semicolon and curly braces together to do multi-line? Like this:

```
;{ ignored 
text 
here }
```

Please, forgive me if this sounds like a horrible layman's idea for lots of reasons I might not be aware of - just something that popped into my mind right away. And sorry for bringing it up here, I know this is probably a wrong room for such discussions.

## Thursday 28th March, 2019

Oldes

[20:32](#msg5c9d2f69a100047111d5f036)Is it by design, that there are `/timezone` and `/zone` date accessors where the first one modifies time and the second not?

```
>> d: now
== 28-Mar-2019/21:32:16+01:00
>> d/timezone: 2 d
== 28-Mar-2019/22:32:16+02:00
>> d/zone: 3 d
== 28-Mar-2019/22:32:16+03:00
```

hiiamboris

[20:52](#msg5c9d33f9e2245b5109cb2bb7)@Oldes makes sense to me: one is for UTC time value modification, another for translating it into another TZ. I'd work on names though - very confusing...

Oldes

[20:53](#msg5c9d34528df8b02f047797b9)Do you have any idea for better names?

hiiamboris

[20:54](#msg5c9d3477aee5b449f3ad35cc)not yet ☺

Oldes

[21:30](#msg5c9d3d0f08f8e7361a63a862)Another thing... in `Red` setting a zone to date without time adds zero time, is it ok or someone would prefer an error instead?

```
>> d: 28-Mar-2019
== 28-Mar-2019
>> d/zone: 1 d
== 28-Mar-2019/0:00:00+01:00
```

greggirwin

[21:33](#msg5c9d3d961f98a87112b81f19)@Oldes, yes, it's by design. From an old blog entry: "/timezone: changes the zone and adjusts time accordingly (UTC-invariant)". It's in the standard docs as well: https://doc.red-lang.org/en/datatypes/date.html#\_\_zone

Oldes

[21:34](#msg5c9d3dd85349305a4c865515)@greggirwin Thanks for confirmation... what about the second question?

[21:35](#msg5c9d3e0751353e5a4daf7813)I believe that it is by design too as it is used in `to-utc-date` function.

greggirwin

[21:35](#msg5c9d3e380b3b8749f4dbd9c2)You have to have a time value if there's a zone. Otherwise it's not a valid `date!` (lexically).

Oldes

[21:35](#msg5c9d3e3eb7e27d2f059c2f5e)Btw... I wonder if it would not be more \_rebolious_ to have `to-date/utc` instead.

[21:37](#msg5c9d3e7c8df8b02f0477e26f)@greggirwin I know I need the time... question is, if one would not rather have an error, because don't want date-time value, but only date.

greggirwin

[21:49](#msg5c9d4177b7e27d2f059c457d)Giving it some brief thought, and scanning some code, I think it's best the way it is now. You can't have a date-only value with a zone, but you might want to set the zone before setting the time value. Of course, we can tell users that you have to set them in a certain order, but imagine a UI where the user can select zone and time values. Do we want to enforce the order there, or require the use of temp vars?

Let me ask the other question. What is the harm in not throwing an error?

Oldes

[21:51](#msg5c9d41dce2245b5109cb8d4c)No harm... in my opinion... I just wanted to be sure. I prefer this behaviour.

greggirwin

[21:52](#msg5c9d4205b6711251984447a2)`to-date/utc` raises an old question, because all `to-funcs` are generated automatically. Do we want to customize each one or keep them as basic convenience funcs?

[21:53](#msg5c9d4245e422d151992c7306)@gltewalt, when you have a chance, maybe add a note to the date docs that if you set a zone for a date, and there is no time value already set for the date, it will default to 0:0:0. Thanks.

Oldes

[22:10](#msg5c9d466fe2245b5109cbab28)@greggirwin I'm for customization when appropriate instead of having bunch of `to-*-*` functions.

greggirwin

[22:19](#msg5c9d488a5349305a4c86a044)The question then is how many extra to-* funcs do we think we'll need? They haven't proliferated since R2. UTC and local are a special case for dates. Would we also want `to-file/red to-file/local`? I say no, because the latter produces a string for platform interaction. I don't know of any others, but if you can list some, we can go from there.

Oldes

[22:22](#msg5c9d49230b3b8749f4dc20e8)I don't have strong opinion on that. Maybe you are right.

[22:25](#msg5c9d49e47160b422852f0408)I just know, that I tried to avoid use `to-*` functions as I know, that they are just a syntax sugar. And so it's a shame that these are not more clever in some situations.

[22:28](#msg5c9d4a8308f8e7361a6401a8)For example:

```
>> to-string/from #{9AE96D} 'cp1252
== "šém"
```

although internally it could be implemented as:

```
>> iconv #{9AE96D} 'cp1252
== "šém"
```

the difference is, that a newbie can use `help to-string` and see some information without knowing, that there is also `iconv` native or codecs for such a conversion.

[22:31](#msg5c9d4b31dfcacf510ab76c40)But maybe it is just nonsense... sorry.. just brainstorming now.

greggirwin

[22:43](#msg5c9d4e250b3b8749f4dc433c)I think Carl once questioned the value of the to- funcs, but explained that they were created because the `to` syntax put people off early on. I think we could live without them, but they're good for rebol compatibility and don't cost much to include, being automatically generated.

Oldes

[22:47](#msg5c9d4f0db671125198449b13)Yes. I don't want to remove them.

hiiamboris

[22:57](#msg5c9d5158aee5b449f3ae045b)I always thought `to-` funcs are for the functional future ☺ Like `map :to-string [1 'two @three]`

## Friday 29th March, 2019

greggirwin

[00:19](#msg5c9d649e08f8e7361a64b985)They're handy for those to @hiiamboris.

temperfugit

[00:25](#msg5c9d65f86a9761361b1be030)

```
Red [needs: View]
view [  
	canvas: base 540x540 draw []
	on-down [print event/offset]
	on-wheel [print event/offset]
	on-created [set-focus canvas]
]
```

Is it supposed to be the case that `on-wheel` returns different coordinates than `on-down`?

greggirwin

[00:49](#msg5c9d6b83b7e27d2f059d57a6)It's by design AFAIK, that the screen offset is used for wheel events. @hiiamboris has this in his wheelhouse I'm sure, and @qtxie is the source of record. But we should confirm on MacOS and now GTK (@rcqls ?).

temperfugit

[03:12](#msg5c9d8d126a9761361b1cdaa4)Okay, thanks @greggirwin, that makes sense.

rcqls

[07:01](#msg5c9dc2d208f8e7361a672fb8)@greggirwin Not yet implemented in GTK but now I have some help to implement it.

PeterWAWood

[07:18](#msg5c9dc6bd5349305a4c89a4c9)@greggirwin These are the results on macOS when I move the mouse-wheel though the mouse pointer is static:

```
>> view [
[    canvas: base 540x540 draw []
[    on-down [print ["on-down" event/offset]]
[    on-wheel [print ["on-wheel" event/offset]]
[    on-created [set-focus canvas]
[    ]
on-down 242x70
on-wheel 259x74
on-wheel -10x550
on-wheel -2147483648x550
on-wheel -2147483648x550
on-wheel -2147483648x550
on-wheel -10x-2147483648
on-wheel -10x550
on-wheel -10x550
on-wheel -10x550
on-wheel -10x550
on-wheel -10x-2147483648
on-wheel -10x-2147483648
...
```

[07:21](#msg5c9dc77db67112519847a90a)The behaviour seems correct on windows:

```
>> view [
[    canvas: base 540x540 draw []
[    on-down [print ["on-down" event/offset]]
[    on-wheel [print ["on-wheel" event/offset]]
[    on-created [set-focus canvas]
[    ]
on-down 152x140
on-wheel 894x195
on-wheel 893x195
on-wheel 893x194
on-wheel 897x196
on-wheel 897x196
on-wheel 897x196
on-wheel 897x196
on-wheel 897x196
on-wheel 897x196
on-wheel 897x196
on-wheel 897x196
on-wheel 897x196
```

The small difference in the values reported are due to me moving the mouse when "wheeling".

hiiamboris

[09:50](#msg5c9dea68e422d1519930f5bd)@greggirwin I think I never made this into an issue. Just converted the coordinates. But I don't see the point of having wheel offset relative to the screen, so it looks like a bug to me. Offsets are there for comparison with some face corners, and what are you going to do with a screen-relative offset? Compare it with what? The only face that is in screen coordinates is the top-level window, but why would anyone match the top window geometry from a child face's actor?

greggirwin

[17:35](#msg5c9e574508f8e7361a6b79ac)It looks like they aren't useful at all on MacOS, so time for @qtxie to weigh in.

@hiiamboris my first instinct was that it worked that way because, at least on Windows10, you have the option of getting wheel messages sent to a non-focused window. Let's you move the mouse around and scroll different windows without changing focus. But only one window gets the message. That is, you don't get the message in any way, which makes sense, if you have focus, unless the mouse is over you. So my thought that you could use it for windowing tricks doesn't pan out.

The likely cause is that the params are just being sent up the event chain, without Red processing them in any way. We can use them either way, but I agree that it would be more consistent to have them as face-local values. I don't remember ever using the offset in R2, but you could.

gltewalt

[22:58](#msg5c9ea31ee422d15199361f65)@greggirwin Done

## Saturday 30th March, 2019

greggirwin

[00:06](#msg5c9eb3101f98a87112c2516c)Commented. :^)

gltewalt

[00:14](#msg5c9eb4f40b3b8749f4e6117c)How about now?

greggirwin

[19:21](#msg5c9fc1a60aad635019fe8e49)Merged.

## Sunday 31st March, 2019

dander

[00:55](#msg5ca01014a0790b29c935b91e)this demo doesn't seem to be loading for some reason

```
>> about
Red 0.6.4 for Windows built 29-Mar-2019/13:23:41-07:00 commit #fee17b2

>> do https://raw.githubusercontent.com/red/red/master/environment/reactivity.red
*** Script Error: invalid function definition: return:
*** Where: do
*** Stack: do-file
```

greggirwin

[03:17](#msg5ca031330aad635019015658)That core file isn't a demo. Here's the issue: https://github.com/red/red/issues/3595

dander

[03:55](#msg5ca03a2bf851ee043d36b480)okay, thanks for the clarification

## Saturday 13th April, 2019

bitbegin

[08:58](#msg5cb1a4ac1f6e900d5e265768)

```
PS D:\red\red> ./red.exe --cli
Compiling Red console...
*** Compilation Error: exec/gui/get-text-size is missing an argument
*** in file: %/C/ProgramData/Red/CLI/gui-console.red
*** in function: exec/ctx373~size-text
*** at line: 2548
*** near: [pair]
PS D:\red\red>
```

[08:59](#msg5cb1a4e0c55bd14d35d9118a)latest version can't produce `console` file

greggirwin

[16:20](#msg5cb20c360aad63501979c0ac)@bitbegin I just pulled the latest and it builds fine here on Win10.

## Tuesday 16th April, 2019

9214

[16:33](#msg5cb603d2b4700e023d815108)Can anyone paste `view [field on-key [probe event/window]]` in console and confirm that field ceases to function as expected?

ne1uno

[16:47](#msg5cb6072f1cd0b8307d214460)probe after each key, `win7 RED: [ branch: "master" tag: #v0.6.4 ahead: 197 date: 22-Mar-2019/21:33:44 commit: #a76753122`

toomasv

[16:54](#msg5cb608aa990feb4518b138e0)@9214 Confirmed on W10.

9214

[16:55](#msg5cb608e86a84d76ed8a37bdb)@toomasv thanks.

toomasv

[16:55](#msg5cb608f897dcb371d8c23c80):+1:

ne1uno

[16:56](#msg5cb609502e2caa1aa66af03f)win7 too, not echoing characters, forgot I was using old gui

9214

[16:57](#msg5cb609882e2caa1aa66af167)@ne1uno OK, thanks.

gurzgri

[17:00](#msg5cb60a188790b0307eafb79a)@9214 Field ceases to work only when run in Red Console, works fine when run in --cli mode with Red 0.6.4 for Windows built 13-Apr-2019/8:27:16+02:00 commit #fb18d4e

9214

[17:03](#msg5cb60ae7e416b845198ca099)@gurzgri well, yes, that's why I specifically asked to check it from console.

gurzgri

[17:04](#msg5cb60b30b4700e023d8180a9)@9214 Sorry for the noise

9214

[17:05](#msg5cb60b468446a6023e2712f9)@gurzgri no problem at all, thanks for reporting anyway!

[17:05](#msg5cb60b662e2caa1aa66afb59)macOS users, anyone? @rcqls can you check the above on your branch?

rcqls

[17:15](#msg5cb60d958790b0307eafd2ba)@9214 `probe event/window` does nothing in my branch compared with macos where none is printed.

9214

[17:15](#msg5cb60dca2e2caa1aa66b0c6c)@rcqls and field isn't updated either?

rcqls

[17:17](#msg5cb60e235b3f941aa53fffba)@9214 Sorry, what do you mean by updated? Typed keys are shown as expected….

9214

[17:18](#msg5cb60e6eba1e556869df68b8)@rcqls yes, that's what I mean. On Windows field ignores everything you type, but `probe` returns window's `object!`, not `none`.

rcqls

[17:19](#msg5cb60eac375bac7470b4e806)@9214 Ok but I don’t have window's object returned….

9214

[20:57](#msg5cb6419fb4700e023d8309a3):suspect:

```
>> /.0.
== /.0.
>> last 'wtf/.0.
== .0.
>> type? last 'wtf/.0.
== word!
```

[21:01](#msg5cb642ae990feb4518b2e083)OTOH, it's indeed a valid `word!`, albeit the one that lexer recognizes as invalid `float!`.

```
>> .0.
*** Syntax Error: invalid float! at ".0."
*** Where: do
*** Stack: load
```

rebolek

[21:02](#msg5cb642eaa4ef097471ad2186)I thought Red abandoned `.1` syntax. In that case, `.0.` would be valid word.

## Wednesday 17th April, 2019

greggirwin

[06:14](#msg5cb6c4493d78aa6c03481205)@9214 something about cycle handling perhaps. It's the `parent` facet that's the problem it seems.

[17:04](#msg5cb75c9b3b6cb0686a0b2ecc)`view [field on-key [probe face/parent]]` does it too, but not general object cycles it seems.

9214

[17:05](#msg5cb75cd2990feb4518ba3c78)@greggirwin so, how should I name a ticket?

[17:05](#msg5cb75ce91cd0b8307d2a74e9)This also affects `area`.

[17:06](#msg5cb75d1e2e2caa1aa674480a)BTW, is it expected that `field` and `area` react to input in deferred mode?

[17:10](#msg5cb75e0db4700e023d8a5940)e.g.

```
>> system/view/auto-sync?: no
== false
>> view [field area]
```

Also, see this

```
view [t: text "" field on-key [append t/text event/key]]
```

greggirwin

[17:23](#msg5cb76112e416b84519960c42)I believe auto-sync only affects non-interactive updates for native widgets. That is, events are processed by the OS if we don't override them individually.

[17:31](#msg5cb762d897dcb371d8cb915f)

```
view [field on-key [p: face/parent p/parent: none  probe p]] ; OK
view [field on-key [p: face/parent probe p]] ; Not OK
```

For a ticket description, how about: `Probe face/parent` interrupts field/area event handling.

From there we can add more details as we find out if other styles are affected.

[17:31](#msg5cb7630c990feb4518ba6d0c)And `print mold` does the same thing, so it's not returning the value, as `probe` does which causes the problem.

9214

[17:46](#msg5cb7668c6a84d76ed8acf683)https://github.com/red/red/issues/3848

What about event-eating `text`? Can anyone confirm that?

```
view [t: text "" field on-key [append t/text event/key]]
```

hiiamboris

[18:16](#msg5cb76d8aa4ef097471b52298)@9214 Yes, on W7.

toomasv

[19:26](#msg5cb77dec6a84d76ed8ada829)@9214 With `on-key-up` it kind of works, but uppercases.

greggirwin

[19:31](#msg5cb77ef63b6cb0686a0c34e0)What's the event-eating issue with `text`? Seems OK here on Win10. Or I'm not caffeinated enough to see what I'm missing.

hiiamboris

[19:37](#msg5cb7807a990feb4518bb4ab5)@greggirwin !\[](https://i.gyazo.com/0f7edc6cf2f0e6f53772bb08d871f1c7.gif)

greggirwin

[20:02](#msg5cb78644375bac7470bf0d47)Ah! Duh. I was watching just the text, thinking that was the problem. :^\\

## Thursday 18th April, 2019

rcqls

[01:05](#msg5cb7cd6b97dcb371d8ce517b)`view [t: text "" field on-key [append t/text event/key]]` is working properly on linux/GTK after some fix but not related to the event-eating.

dockimbel

[13:42](#msg5cb87eadb489bb6ed784ad31)@rebolek We abandoned `1.` syntax, `.1` is still valid.

[13:43](#msg5cb87ee98446a6023e37b508)@hiiamboris I can't reproduce that issue, it shows the characters properly here on my W10.

rebolek

[13:47](#msg5cb87fe4b4700e023d91d3c9)@dockimbel ah, thanks for clarification

dockimbel

[13:58](#msg5cb8829f990feb4518c1e0fa)@vazub Thanks for your kind words about Red. Indeed, it's all about trade-offs, can't have everything. About your `;{...}` lexical proposition :point\_up: \[March 26, 2019 10:22 PM](https://gitter.im/red/bugs?at=5c9a981bcf786a56c7824711) for multiline comments (I guess it's for comments?), at first look, it seems like that could work. The idea of combining the meaning of `;` with multiline string notation makes sense. What are others thinking about it?

[14:01](#msg5cb88327e416b845199da0c2)@Oldes  
&gt; Do you have any idea for better names?

Better names for differentiating `/time` and `/timezone` are welcome.

Oldes

[14:37](#msg5cb88bae375bac7470c5d752)Welcome back @dockimbel ! I'm not good in inventing new names. Especially in english.

[14:41](#msg5cb88ca7e416b845199de492)Regarding `;{...}` as a new comment, I'm not sure if I like it... I would rather used `/*...*/` as it is already common syntax in other languages and I believe that lexer should not have problems with it.

vazub

[14:54](#msg5cb88f9f3d78aa6c03547d2a)@dockimbel Correct, that idea was for multi-line comments.  
@Oldes One of the reasons why this specific syntax seemed logical to me - was that it is supposed to be based on current Red's foundation for denoting comments. `/*...*/` is common, that is true, however it correlates with the use of `//` for single-line comment in the same subset of languages, which in turn also leverages the notion of likeness. The idea of `;` and `;{...}` follows the same logic.

Oldes

[14:57](#msg5cb89063375bac7470c5f8ba)Main problem with `;{...}` is, that `}` is quite common char and the lexer would have more work to find, where it ends... on the other side, you probably will not find any `/*` or `*/` combinations in current scripts and so finding the end of comment would be cheaper.

9214

[14:59](#msg5cb890c53b6cb0686a133877)How `;{...}` would handle this?

```
;{
{}
```

Is this a one-line comment followed by an empty string or a multi-line comment with `{` in it? In the latter case you'll need to escape `{`, which is at odds with the very definition of multiline comment.

hiiamboris

[15:00](#msg5cb891018790b0307ec0c619)I'm thinking like @Oldes and @9214. The problem of `;{..}` is that it has to parse the `{..}` part using string rules, not just skip until it finds a `}`. More lexer load than a bunch of `;`-s. But I also dislike `/**/` syntax for `/*` can be a refinement.

moliad

[15:00](#msg5cb891264b4cb471d91966a3)nope. ;{ ... } bad idea... even the syntax agrees.... ; {

[15:01](#msg5cb891603d78aa6c03548d32)comment \[ ] already works, just specify a shorter statement and make it clear that its a LOAD concept.

9214

[15:02](#msg5cb89172375bac7470c5fe96)Red as a very tight lexical space. Instead of squeezing multiline comment syntax in it, I'd rather took a step back and considered something like reader macros.

moliad

[15:03](#msg5cb891aca4ef097471bce133)I was thinking of adding a generalized form for code hiding in LOAD by using ##ANY-KEY-YOU-WANT \[ ... ]

[15:03](#msg5cb891c5b4700e023d924786)data in the block gets eaten and doesn't traverse the LOAD.

9214

[15:03](#msg5cb891c88446a6023e383d30)@moliad problem with `comment` is that it's not truly invisible, and also returns `unset`. Something like

```
#macro comment: func [v][[]]
```

Is IMO more to the point, but too ad-hoc-ish.

moliad

[15:04](#msg5cb891f36a84d76ed8b4ff63)which is why `COMMENT` should be managed inside of LOAD... its very easy to add.

hiiamboris

[15:04](#msg5cb8920c97dcb371d8d36740)`#comment` will be better at hinting that it's a preprocessor stuff.

moliad

[15:04](#msg5cb8920d6a84d76ed8b50068)(if it's not already done this way)

9214

[15:05](#msg5cb89228e416b845199e11ce)And, more importantly, `;{` looks like a sad drunken cat.

dockimbel

[15:05](#msg5cb8922ea4ef097471bce49f)@Oldes Both `/*` and `*/` are valid `any-word!` values, so it would be painful to support, as that would introduce exceptions in words lexical space...

moliad

[15:05](#msg5cb892492e2caa1aa67c463f)@9214 that's what I meant by even the syntax disagrees with the idea ;-)

dockimbel

[15:05](#msg5cb8924e1cd0b8307d3281df)@9214  
&gt; How `;{...}` would handle this?

Good point, it needs to differentiate enough with line comments to avoid ambiguity.

[15:11](#msg5cb8938b97dcb371d8d3708d)@hiiamboris That's an option. Though the processing is done after `load`, it would be better if we can find a specific syntax that is part of the lexical rules.

nedzadarek

[15:11](#msg5cb893afa4ef097471bcf1df)What if `;{}` behaves like `comment {}`?

dockimbel

[15:13](#msg5cb89422990feb4518c263f6)@nedzadarek `comment` is a function, so it's processed at run-time. We want a way to identify multiline comments at the lexer time, so they can be safely removed without causing any kind of side-effect.

nedzadarek

[15:14](#msg5cb8943a3b6cb0686a134f7b)I see

9214

[15:14](#msg5cb8944e6a84d76ed8b50fc5)In Forth, for instance, `\` is a word that plunges into token stream and ignores everything up to the end of line. If you don't like `\` you just redefine it :wink:

moliad

[15:14](#msg5cb8946e4b4cb471d91985f6)`comment` should not be a function it should be a statement within load.

Oldes

[15:17](#msg5cb894ef990feb4518c26899)I guess, that `comment` is fine, just it is not handled in dialects... like:

```
>> view [base 400x400 comment {why?}]
*** Script Error: VID - invalid syntax at: [comment "why?"]
*** Where: do
*** Stack: view layout cause-error
```

[15:17](#msg5cb894fe2e2caa1aa67c5a1b)But that is easy to fix.

vazub

[15:17](#msg5cb89501375bac7470c61a12)How about `;-- ... --` then? Probably easier to parse, and already partially used as a style convention in Red.

9214

[15:18](#msg5cb89538375bac7470c61ace)@vazub same problem

```
;--
--
```

Is it a one-line comment followed by `--` (a valid word, FYI), or a multi-line comment?

Oldes

[15:18](#msg5cb895462e2caa1aa67c5b8c)The problem is that for example I use the char after `;` in syntax highlighting.

vazub

[15:19](#msg5cb8958a2e2caa1aa67c5d7e)@9214 How do C-like languages treat it for `/*`?

```
/*
*
```

Oldes

[15:19](#msg5cb8958ba4ef097471bcfcea)\[!\[image.png](https://files.gitter.im/red/bugs/Uymh/thumb/image.png)](https://files.gitter.im/red/bugs/Uymh/image.png)

moliad

[15:19](#msg5cb8958c3b6cb0686a135864)just don't use `;` for multi-lines :-) unicode has thousands of characters. we can use this to our advantage

Oldes

[15:20](#msg5cb895c497dcb371d8d38374)@vazub it simply goes to the first `*/` sequence.

moliad

[15:20](#msg5cb895cd375bac7470c61e9a)a VERY limited number of people use mutli-line comments. they always end up being more hassle than they're worth

vazub

[15:20](#msg5cb895d9e416b845199e2a52)@moliad The convenience factor? I would assume not many keyboard layouts allow you to use any Unicode character aside of typical ones.

moliad

[15:21](#msg5cb895fdb4700e023d926b10)yep, then again, single line comments have become the norm on all projects and IDEs I see.

Oldes

[15:23](#msg5cb89667a4ef097471bd01ee)I still believe, that we could just not have `/*` as an valid refinement. `*/` is also not valid path.

9214

[15:24](#msg5cb896902e2caa1aa67c6556)@vazub lexer will simply yell at you because of unmatched `/*`

```
$ echo "/**" > test.c && gcc test.c
test.c:1:1: error: unterminated comment
 /**
 ^
```

vazub

[15:24](#msg5cb896a08446a6023e386772)@Oldes so maybe ending with a semicolon would do the same trick? `;- ... -;`, `;{...};`

Oldes

[15:25](#msg5cb896d0990feb4518c27462)`;{...};` could work.

9214

[15:25](#msg5cb897062e2caa1aa67c6781)At this point I think this discussion should move either to `/sandbox` or `/chit-chat`.

[15:27](#msg5cb897668446a6023e386bc8)

```
text
;{
{};
```

A one-line comment followed by an empty string and another one-line comment, or a multi-line comment?

Oldes

[15:28](#msg5cb897934b4cb471d91997c2)multi-line comment.

vazub

[15:28](#msg5cb897964b4cb471d91997c5)Multi

[15:29](#msg5cb897cdb489bb6ed78569e2)Parser should check for next char after `;` and if it finds `{` - it treats it as multiline. Like a single token `;{`

9214

[15:29](#msg5cb897f1e416b845199e3786)An \*ambigious* multiline comment is even worse that absence of multiline comments in the first place.

moliad

[15:52](#msg5cb89d273d78aa6c0354e5dc)one hurdle to adding this is the amount of code that already exists in the wild. all the given examples of using `;` to start a multiline comment would break some of my code. we have been using `;` as a single line comment for so long that we all have built some of our own standards for characters following it.

[15:53](#msg5cb89d7b2e2caa1aa67c9695)(Like Oldes shows above)

[15:54](#msg5cb89dba375bac7470c65e44)I use `;-` a lot in various ways. I've also used `;` for some stuff

vazub

[15:55](#msg5cb89defa4ef097471bd38ef)@moliad although I do understand the concern, the argument might not hold true, as Red continues to evolve - it is not even 1.0 yet, so there might be lots of things breaking someone's code along the way.

moliad

[15:56](#msg5cb89e43990feb4518c2ae17)yep. which is why I am builidng R2-backwards.Red in one project ;-)

[15:57](#msg5cb89e698790b0307ec12ac6)but \*\*don't touch my comment marker \** :smirk:

[15:58](#msg5cb89eb3b4700e023d92b069)(as emotive a reaction as is possible ;-)

nedzadarek

[19:46](#msg5cb8d41d375bac7470c7e8b7)@moliad  
&gt; just don't use `;` for multi-lines :-) unicode has thousands of characters. we can use this to our advantage

I prefer easy to type ASCII

endo64

[21:14](#msg5cb8e8c1b4700e023d94b59d)&gt; And, more importantly, `;{` looks like a sad drunken cat.

I laughed =)

## Friday 19th April, 2019

hiiamboris

[17:49](#msg5cba0a138790b0307eca9b04)wow interesting...  
confirm somebody plz in the GUI console:  
\- set `gui-console-ctx/terminal/color?: yes`  
\- then type `'/` and everything disappears and starts spamming

```
*** Script Error: cannot MAKE/TO word! from: 0
*** Where: to
*** Stack: ask do-events do-actor do-safe to-word
```

9214

[17:57](#msg5cba0c262e2caa1aa6864092)@hiiamboris yep.

hiiamboris

[17:58](#msg5cba0c485b3f941aa55ac576)thanks ☺

greggirwin

[21:58](#msg5cba44791cd0b8307d3dd8f0)We can move the comment chat to red/red. It's fine for general language design.

## Saturday 20th April, 2019

endo64

[06:57](#msg5cbac2e73b6cb0686a2158df)@hiiamboris Same for `'%`

greggirwin

[17:29](#msg5cbb57068446a6023e4a32a4)@qtxie's fix seemed to take care of that too @endo64.

ne1uno

[17:40](#msg5cbb59788790b0307ed2f0fe)old gui is crashing now

greggirwin

[18:15](#msg5cbb61a497dcb371d8e59422)@ne1uno can you be more specific?

ne1uno

[18:30](#msg5cbb6528b489bb6ed797cb6d)run crash

[18:32](#msg5cbb65d8e416b84519b0b66f)some code changed outside of `red-master\environment\` so I have no clue

greggirwin

[18:36](#msg5cbb66c78446a6023e4aa697)"run crash" is no more helpful than "old gui crashing". I just pulled and built recent source, and all runs fine here. What exactly are you running, how are you running it, and what OS?

ne1uno

[18:48](#msg5cbb69938446a6023e4abb1c)thanks, maybe it doesn't like something in cfg. too many consoles sharing the same one. `win7`. run old-gui, crash. not sure what else can be said

[19:02](#msg5cbb6cdeb4700e023da4fd0e)I rebuild a few times a week from batch file, not sure if anything changed here. previous builds still work

greggirwin

[19:30](#msg5cbb73475b3f941aa563e433)What is the difference between "previous builds" which still work, and "old GUI"? Now I'm pretty sure you mean GUI console, not a GUI app of yours. A new build, and changes, should not affect old console builds.

ne1uno

[19:40](#msg5cbb75a01cd0b8307d456606)old-gui crashes when it is started w/nothing on commandline. I never used cfg setting, maybe can point to empty cfg to test that is the problem?

[20:08](#msg5cbb7c561cd0b8307d45916c)still crashing for me with deleted or new \`c/programdata/red/console.cfg.red.

[20:25](#msg5cbb8035e416b84519b166ed)built with `rebview276` same as `rebol-view-278`

greggirwin

[21:06](#msg5cbb89df990feb4518d59d1e)Does the automated build work for you?

ne1uno

[21:25](#msg5cbb8e2d5b3f941aa56499d2)red gui &amp; cli are fine

[22:11](#msg5cbb98f5375bac7470d9e209)old gui, isn't in the automated builds, probably doesn't get tested. `red-master\environment\console\GUI\old\gui-console.red`

[22:13](#msg5cbb99933d78aa6c0368b68a)but it has worked in previous builds, till today. it has a different way of buffering output and doesn't mess with focus like the new gui.

greggirwin

[22:30](#msg5cbb9d6a6a84d76ed8c8f22a)Ah, %GUI/old/* is what you're talking about. One small change in %highlight.red there. @qtxie ?

## Sunday 21st April, 2019

qtxie

[08:07](#msg5cbc24bd3d78aa6c036bff56)@ne1uno I pushed a fix for it.

ne1uno

[08:07](#msg5cbc24d73b6cb0686a2a2838)ty!

[08:09](#msg5cbc252b2e2caa1aa6937d13)I get a few crashers with new gui too, but couldn't isolate it. will retest

[09:23](#msg5cbc36968446a6023e4f9fb4)👌

## Monday 22nd April, 2019

9214

[14:13](#msg5cbdcc0e1cd0b8307d53f366)Can anyone check out how `modal` flag works on macOS?  
https://gitter.im/red/help?at=5cb9edc34b4cb471d922a96f

## Tuesday 23th April, 2019

9214

[18:46](#msg5cbf5d6d1cd0b8307d5e858b)@9214 Bueller?

## Friday 26th April, 2019

9214

[19:39](#msg5cc35e653d78aa6c039d9a09)@rcqls any news on libRed crashing issue? Is it time to file a ticket?

rcqls

[19:40](#msg5cc35ec81cd0b8307d7a551c)@9214 sorry, you can indeed file a ticket ...

## Sunday 28th April, 2019

rcqls

[18:53](#msg5cc5f69497dcb371d82bfa08)@9214 I I tested the crash already observed with libRed on macOS Sierra but on macOS Mojave and Linux with View/GTK activated. I added comment just below the issue you submitted. On Mojave, i386 is deprecated and on Linux the crash is the same only when View is activated.

9214

[18:54](#msg5cc5f6dc6a84d76ed80eb83b)@rcqls thanks a lot!

rcqls

[18:54](#msg5cc5f6fa3d78aa6c03aea932)@9214 You’re welcome!

hiiamboris

[19:04](#msg5cc5f957990feb45181ad13e)This seems strange:

```
Red []
x: [1]
if single? x [print "TRUE"]
```

I can't compile this with `-c` and `-r` (unless I also provide `-e`), and see this error:

```
Compiling D:\devel\red\red-av\1.red ...                                   
*** Compilation Error: expected a block for IF-BODY instead of word! value
*** in file: D:\devel\red\red-av\1.red                                    
*** near: [x [print "TRUE"]]
```

Same goes for `unless` instead of `if`. I can however compile it with `empty?` or some other function in place of `single?`.

greggirwin

[21:51](#msg5cc620678790b0307e1a564d)Confirmed. Strange indeed.

[21:52](#msg5cc6209f8446a6023e91b9e1)Good catch.

hiiamboris

[23:45](#msg5cc63b0d3d78aa6c03b07d55)@greggirwin do you think it's worth a place on the tracker or on compiler limitations wiki page (and if so, what's the nature of the limitation...)?

## Monday 29th April, 2019

greggirwin

[00:30](#msg5cc645b12e2caa1aa6d6d90c)It's something for @dockimbel to comment on, but you can make a ticket for it, so he can comment there, and then decide if it's an easy fix or a limitation we should note.

hiiamboris

[18:48](#msg5cc7470497dcb371d834e456)Ok! #3862

9214

[22:30](#msg5cc77aefa4ef0974711fec17):suspect:

```
>> do reduce [func [:a :b :c][1] '+ '- '*]
*** Script Error: object!: needs a value
*** Where: object!
*** Stack:  

>> do reduce [func [:a :b][1] '+ '-]
*** Script Error: + does not allow none! for its value2 argument
*** Where: +
*** Stack:  

>> do reduce [func [:a][1] '+]
*** Script Error: + operator is missing an argument
*** Where: do
*** Stack:
```

[22:33](#msg5cc77bd03b6cb0686a7664fc)But

```
>> foo: func [:a :b][1] foo + -
== 1
>> etc...
```

hiiamboris

[22:43](#msg5cc77e07e416b8451901b8ad)Even better:

```
>> f: func [:a :b] [1]
== func [:a :b][1]
>> do reduce [:f '+ '-]
root size: 3487, root max: 4899, cycles: 0

*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/datatypes/string.reds
*** at line: 1045
***
***   stack: red/string/concatenate-literal-part 02B403F4h 00779000h 6320358
***   stack: red/datatype/mold 02E8A248h 02B403F4h false false true 00000000h 0 0
***   stack: red/actions/mold 02E8A248h 02B403F4h false false true 00000000h 0 0
***   stack: red/error/reduce 02B403D4h 02C608CCh
***   stack: red/error/form 02C608CCh 02B403C4h 02B403A4h -18
***   stack: red/actions/form 02C608CCh 02B403C4h 02B403A4h 0
***   stack: red/block/form 02B403B4h 02B403C4h 02B403A4h 0
***   stack: red/actions/form 02B403B4h 02B403C4h 02B403A4h 0
***   stack: red/actions/form* -1
***   stack: red/natives/prin* true
***   stack: red/natives/print* true
***   stack: ctx475~do-command 003F1BC0h
***   stack: ctx475~eval-command 003F1BC0h
***   stack: ctx475~run 003F1BC0h
***   stack: ctx475~launch 003F1BC0h
```

9214

[23:08](#msg5cc783e5b4700e023df4ff51)\[Oh my...](https://www.youtube.com/watch?v=U6MlaIe1ljs)

## Wednesday 1st May, 2019

dockimbel

[12:03](#msg5cc98af76a84d76ed8278ca1)@hiiamboris  
&gt; This seems strange:  
&gt;

```
> Red []
> x: [1]
> if single? x [print "TRUE"]
>
```

&gt; I can't compile this with `-c` and `-r` (unless I also provide `-e`), and see this error:  
&gt;

```
> Compiling D:\devel\red\red-av\1.red ...                                   
> *** Compilation Error: expected a block for IF-BODY instead of word! value
> *** in file: D:\devel\red\red-av\1.red                                    
> *** near: [x [print "TRUE"]]                                              
>
```

&gt; Same goes for `unless` instead of `if`. I can however compile it with `empty?` or some other function in place of `single?`.

The way the `single?` function is defined is not compatible with the compiler:

```
single?: last?: func [
```

[12:05](#msg5cc98b6da4ef0974712e32bc)The compiler processes those runtime source files specifically to extract function definitions. Currently, the compiler only recognizes `name: func` and `name: :other-name` patterns for defining functions.

meijeru

[12:10](#msg5cc98cbd5b3f941aa5c21259)The quickest way to remedy this seems to redefine `last?: func [ ] [ ]` and `single?: :last?`.

hiiamboris

[12:11](#msg5cc98ce63b6cb0686a847538)@dockimbel I tried to reverse the order in functions.red: `last?: single?: func [` but it didn't help. Still complains about `single?` but not `last?` when I invoke `red.r` on that file.

dockimbel

[12:54](#msg5cc996ed5b3f941aa5c25fdb)

hiiamboris

[13:40](#msg5cc9a1d897dcb371d8454bde)@endo64 would you like to write a fix for https://github.com/red/red/issues/3862 ? ☺

endo64

[14:26](#msg5cc9acb197dcb371d845985e)@hiiamboris Sure I will do it, I remember I saw that pattern somewhere in the source codes hence I did it the same way.

[14:56](#msg5cc9b3a81cd0b8307da4e9d0)Fixed, https://github.com/red/red/pull/3865

hiiamboris

[17:35](#msg5cc9d8c4e416b84519120e7c):+1:

greggirwin

[18:53](#msg5cc9eb1ba4ef09747130eee2)&gt; I remember I saw that pattern somewhere in the source codes hence I did it the same way.

It's certainly an old Rebol pattern. If you can find it in other parts of the Red source, we should fix those as well.

[18:54](#msg5cc9eb6c4b4cb471d98e054f)Who wants to whip up a Red Source parse tool for finding patterns? :^) Could be a fun auto-refactoring experiment.

hiiamboris

[19:09](#msg5cc9ef07990feb45183624f8)Quite a task if done properly I think...

greggirwin

[19:16](#msg5cc9f07597dcb371d847afe1)Starting simple shouldn't be too bad. In this case, you're looking for `set-word! set-word! ['func | ... ]`, right?

meijeru

[19:18](#msg5cc9f1154b4cb471d98e2d40)A simple `grep` on all source files will do. My own (fairly primitive) `grep` found just the one `single?: last?:` instance.

hiiamboris

[19:19](#msg5cc9f14697dcb371d847b608)@greggirwin Yeah I just wonder how far your idea of "auto-refactoring" goes. Compression algorithms? Machine learning? Man, a whole career can be built on that topic :)

greggirwin

[19:20](#msg5cc9f171e416b8451912c478)But you have to know the names in that case @meijeru, or regex it. ;^\\

[19:21](#msg5cc9f1ae5b3f941aa5c516a3)@hiiamboris, I always try to start small. Nowhere near big stuff for this. I propose ideas that seem either too limited or too hard. :^)

[19:22](#msg5cc9f1e8375bac74703af198)So think of it as a linter first.

meijeru

[19:24](#msg5cc9f261e416b8451912caa4)Of course, my `grep` does a `regexp`.

[19:26](#msg5cc9f2d42e2caa1aa6f03c36)The most surefire is to include all allowed word characters in the regular expression, but I gambled, in first instance, that the function names used in the Red source would be lowercase, containing at most `?` `*` and `-` .

## Thursday 2nd May, 2019

dockimbel

[10:04](#msg5ccac0b2375bac7470404a2d)&gt; It's certainly an old Rebol pattern. If you can find it in other parts of the Red source, we should fix those as well.

[10:06](#msg5ccac113e416b845191840bf)No need to do that, the issue is only with those specific files in %environment/ folder that are specifically processed by the compiler to extract some definitions.

greggirwin

[22:45](#msg5ccb73175b3f941aa5cfea0b)Good to know.

## Friday 3th May, 2019

gltewalt

[21:11](#msg5cccae953b6cb0686a9ad848)Should this be?

```
>> #"g" + 1
== #"h"
>> 1 + #"g"
== 104
```

[21:12](#msg5cccaeba3d78aa6c03ddaab8)Result cast to the type of the first arg?

endo64

[21:21](#msg5cccb0c3a4ef097471449a4d)First one uses the `add` native from `char` datatype, second one uses `add` from `integer` datatype.

gltewalt

[21:22](#msg5cccb12697dcb371d85b1662)Should we note that in the `char!` doc under `arithmetic`?

endo64

[21:23](#msg5cccb1378446a6023ebf9495)`runtime\datatypes\char.reds` and `runtime\datatypes\integer.reds`, probably they handle parameter types differently.

[21:27](#msg5cccb251b489bb6ed70e70a5)&gt; Should we note that in the `char!` doc under `arithmetic`?

I think yes, only in `char!` doc. As `Result cast to the type of the first arg` is not exactly correct for `integer! + other-types`

[21:28](#msg5cccb27d8446a6023ebf9c03)`1 + 1:2:3` will return `time!`, `1 + 2x3` returns `pair!`.

gltewalt

[21:29](#msg5cccb2af1cd0b8307dba184a)Interesting.

endo64

[21:30](#msg5cccb30b1cd0b8307dba1b94)It is a feature of `char!` datatype, how it implements `+` action. And other `op!`s as well:

```
>> #"b" / 2
== #"1"
>> #"b" % 2
== #"^@"
```

greggirwin

[23:06](#msg5cccc95bb4700e023d19df38)This is where a little Lab utility would be great. One of my old ones might be close.

## Saturday 4th May, 2019

rebolek

[10:21](#msg5ccd679bb4700e023d1da6c9)Prompt doesn’t like newline very much:

```
>> system/console/prompt: "...^/>>"
== "...^/>>"
...
   >>
...
   >>
...
   >>
```

## Sunday 5th May, 2019

dockimbel

[11:00](#msg5ccec25c5b3f941aa5e5df9b)@endo64  
&gt; `1 + 1:2:3` will return `time!`, `1 + 2x3` returns `pair!`.

Multi-dimensional types take precedence other scalar types, as conversion to scalar values makes little sense in those cases.

## Wednesday 8th May, 2019

rebolek

[06:51](#msg5cd27c66f251e60ffa44cbc3)Should this be allowed?

```
>> foreach [x x] [1 2 3 4][print x]
2
4
```

endo64

[10:51](#msg5cd2b4988fcdb05d479c6321)I see no good reason to not allow.

rebolek

[10:51](#msg5cd2b4bf0824230a77fba270)so what is it good for?

endo64

[10:56](#msg5cd2b5d7da34620ff906061c)Same question is for not allowing. It is not a definition, not something like `f: func [a a] [] ;*** Script Error: duplicate variable specified: a`, so restricting doesn't have any value, even it is useless.

[11:05](#msg5cd2b7fa5d48a24fd09065c9)And what about if both `x` are bound to different contexts.

[11:05](#msg5cd2b8098fcdb05d479c7b0e)

```
b: []
append b in o: context [x: 1] 'x
append b in p: context [x: 2] 'x
;b == [x x]

foreach :b [3 4] []
>> o
== make object! [
    x: 3
]
>> p
== make object! [
    x: 4
]
```

rebolek

[11:06](#msg5cd2b84ef52a237516f6fe20)interesting :)

endo64

[11:11](#msg5cd2b9465a887e1cd9b0593c)This is one of the biggest difference between Red and Rebol for me, `foreach` doesn't bind the word to the block it iterates. It doesn't change the object's values in Rebol for the above example.

[11:12](#msg5cd2b9860f381d0a767d45f8)Also note that, R2's output is different.

```
>> foreach [x x] [1 2 3 4] [print x]
1
3
```

R3's output is same as Red.

## Thursday 9th May, 2019

greggirwin

[00:58](#msg5cd37b4ebdc3b64fcf138090)The binding example there is a good one @endo64. That's going to send a number of brains down rabbit holes. ;^)

## Thursday 16th May, 2019

gltewalt

[05:11](#msg5cdcf119ad024978c6d34f14)`rejoin` seems to eat leading `/` characters in urls

[05:16](#msg5cdcf2427c363c75a7e9b812)Oh, `/` is illegal character in ASCII subset for word!

[05:19](#msg5cdcf2ee6366992a94c6a3c0)Disregard, I guess

[05:21](#msg5cdcf348ad024978c6d35bbd)

```
>> rejoin [http://one/two /three]
== http://one/twothree
>> rejoin [http://one/two '/ 'three]
== http://one/two/three
```

endo64

[06:10](#msg5cdcfef19404bf2aed540b92)It's the `refinement!`,

```
>> append ""  /three
== "three"
>> to "" /three
== "three"
>> print /three
three
>> append a@b.com  /three
== a@b.comthree
;but!
>> append []  /three
== [/three]
```

gltewalt

[06:21](#msg5cdd01757c363c75a7ea1a2a)Yes

[06:26](#msg5cdd02a463dea422b48e2f5d)Interesting

endo64

[06:30](#msg5cdd0394509b1035c757687a)I just compiled the latest version and CLI doesn't work correctly on Win10.

[06:30](#msg5cdd039a83ae782aee76ece5)\[!\[image.png](https://files.gitter.im/red/bugs/V7y0/thumb/image.png)](https://files.gitter.im/red/bugs/V7y0/image.png)

[06:31](#msg5cdd03aad522695bba4f6f08)Can anyone confirm please.

[06:32](#msg5cdd03ff509b1035c7576b50)GUI console seems to work ok.

gltewalt

[06:34](#msg5cdd045d5b63ea22b3b368fd)I’m still running Win7.  
Nightly build or Stable?

endo64

[06:34](#msg5cdd04876366992a94c71a6e)Nightly build, just fetched now.

[06:36](#msg5cdd04d1509b1035c757701a)One of these commits should be:

```
1dc4661e (HEAD -> master, origin/master, origin/HEAD) FIX: extra fix for issue #3864.
a379f8fb Merge pull request #3878 from hiiamboris/call-shell-fix
f24e4a07 FIX: patch for commit #8e99d131 (PR #3877)
3711bf1a Merge pull request #3877 from hiiamboris/call-shell-fix
8e99d131 FIX: issue #3869 (Internal usage of `call/shell` does not conform to `cmd.exe` specs on Windows)
c63d111c FIX: issue #3873 (Trim does not work as expected for binary! argument)
47fc6a9b FEAT: adds memory usage before/after a GC cycle in debug output.
a7b79d8f TESTS: adds base 2 binary syntax tests (#3855)
98148ee9 FIX: issue #3855 (Syntax Error: invalid binary!)
```

[06:36](#msg5cdd04dc6366992a94c71c0d)If it's not my PC only.

[06:38](#msg5cdd055b63dea422b48e3eb4)

```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 259 date: 15-May-2019/22:02:20 commit: #1dc4661ef7a7040455351d96e428f418e256e518 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
--------------------------------------------
```

gltewalt

[06:40](#msg5cdd05c5ef853135c8ca89ca)Win7 seems to be behaving normally

endo64

[06:42](#msg5cdd064a63dea422b48e45b2)Thanks for testing, waiting for someone to test on Win10 before raising a ticket.

[07:12](#msg5cdd0d517c363c75a7ea6aff)There is more, after updating the latest version, my below batch script that I use to start Red/CLI console:

```
@echo off
d:
cd D:\Projects\Red\red\build\bin\
red.exe --cli --catch user.red
```

gives a strange error now:

```
d:\Projects\Red\red\build\bin>rc
*** Driver Internal Error: Script Error : offset? expected series2 argument of type: series
*** Where: form-args
*** Near:  [all [
pos2: find system/options/args flag: "--catch"
positive? offset? pos2 pos
insert insert args flag #" "
]
args
]
```

so I should dig to find what is causing this error in my `user.red` file.

hiiamboris

[07:49](#msg5cdd161d6366992a94c79186)@endo64 looks like my overlook somewhere...

[07:54](#msg5cdd17435b63ea22b3b3e91c)you can remove `--catch` before it's fixed

[07:55](#msg5cdd1782d22ba766a2a596c1)you shouldn't be needing it with a script anyway

[08:21](#msg5cdd1d840ec37966a1799301)FYI `--catch` is some historical remnant that should only hide the banner when run with `--cli`, but that doesn't work since 061 or before

[08:22](#msg5cdd1daa7c363c75a7eadb05)the only info about it I can find says: `catch?: no ;-- YES: force script to fallback into the console` so it was probably originally meant for something else

dander

[08:31](#msg5cdd1fca63dea422b48ef3bc)@endo64 I am experiencing the same as you on Win 10

hiiamboris

[08:43](#msg5cdd22a683ae782aee77c329)wait, now I get what it does! just no idea why it works ☺

endo64

[08:49](#msg5cdd24326366992a94c7f37e)What I want by `red.exe --cli --catch user.red` is to execute `user.red` and then fall into Red/CLI console, so I have all my predefined functions. So I cannot remove `--catch`.

hiiamboris

[08:51](#msg5cdd247683ae782aee77d307)Yeah I see it now ;)

[12:14](#msg5cdd54189404bf2aed568cad)@endo64 for the catch issue I've opened a PR https://github.com/red/red/pull/3879 so we'll just wait for Gregg to pull it. Thanks for noticing the bug :)

[12:15](#msg5cdd545c8265145bbb1da4bc)For the newline issue, it's probably trim-related? I didn't change anything in that part. And on W7 and linux it does not appear.

[12:22](#msg5cdd55fbd522695bba51b7a9)I'm still very \*\*very\** curious about one thing. @qtxie maybe you can tell?  
The only place where `--catch` option appears is in \[`console/read-argument`](https://github.com/red/red/blob/1dc4661ef7a7040455351d96e428f418e256e518/environment/console/engine.red#L46) and there it sets the `system/console/catch?` flag to true  
the `catch?` flag is only used in \[`console/launch`](https://github.com/red/red/blob/master/environment/console/engine.red#L271) and only affects if `/no-banner` refinement will be provided to `console/run`  
In `console/run` this refinement \[only affects the header output](https://github.com/red/red/blob/1dc4661ef7a7040455351d96e428f418e256e518/environment/console/engine.red#L224) but nothing else  
So how come that with `--catch` console does not quit after the script execution???  
Magick? :fireworks:

9214

[12:56](#msg5cdd5de463dea422b490eb59)@hiiamboris `--catch` flag is specifically created for that - fall thru to console instead of closing it after script finished running.

hiiamboris

[12:56](#msg5cdd5e17509b1035c75a2061)but how does it work? :)

[12:59](#msg5cdd5e9b8265145bbb1dfada)I mean I absolutely don't see how can it affect the closing of the console. Yet it does. Somehow.

9214

[13:18](#msg5cdd6337509b1035c75a4fce)You haven't checked \[command-line front-end](https://github.com/red/red/blob/master/red.r). See where `run-console` is called and how `--catch` affects it.

hiiamboris

[13:23](#msg5cdd6456879f4478c78b86fa)@9214 it just passes the `--catch` flag to the console command line (inserts it before the script name)

dockimbel

[14:22](#msg5cdd7242ef853135c8cde9ac)@hiiamboris See \[this line](https://github.com/red/red/blob/master/environment/console/engine.red#L271), no catch flag -&gt; no call to `run` -&gt; no console -&gt; exit.

hiiamboris

[14:59](#msg5cdd7ad263dea422b491de27)@dockimbel Right! thank you :) for some reason I thought there'll be just `run` otherwise. I see now.

endo64

[15:39](#msg5cdd84408265145bbb1f3359)Any idea why latest build of CLI console behaves weird?

greggirwin

[17:21](#msg5cdd9c338265145bbb1ff85b)I've merged @hiiamboris's fix, but still see the problem in the CLI console.

[20:02](#msg5cddc1cbef853135c8d06616)Let's hope @qtxie or @hiiamboris chime in with more thoughts or ideas. They'll be the quickest at figuring it out I think.

## Monday 20th May, 2019

luce80

[17:36](#msg5ce2e5ae9404bf2aed7d333d)shouldn't `remove-each` return the modified `series!` ?

```
>> probe remove-each item [a 1 2 b 3] [integer? item]
unset
>> about
Red 0.6.4 for Windows built 25-Dec-2018/13:56:39+02:00 commit #67a6bff
```

toomasv

[17:43](#msg5ce2e754879f4478c7b17ff9)@luce80 Nope

```
>> remove-each item bl: [a 1 2 b 3] [integer? item]
>> bl
== [a b]
```

It's like `foreach`. Altough I agree, that it would be nice to return modified block.

luce80

[17:49](#msg5ce2e896879f4478c7b18b62)@toomasv you are "probing" the instatiated modified block, not the function itself. By returning modified block we could "cascade" it like `remove-each ... remove-each ...`

toomasv

[17:50](#msg5ce2e8ef13e9854e333966b1)Yes, because you showed already that function returns `unset`. :) And as I said, it would be nice to have modified block returned.

greggirwin

[17:58](#msg5ce2eadf83ae782aee9fd241)It's an open question. An alternative is to return the number of items removed (which is more work to figure out). Until a winner emerges, it doesn't return anything so we don't break code when it changes.

toomasv

[18:03](#msg5ce2ebdf9404bf2aed7d611a)@greggirwin Or maybe removed items collected on request? :eyes: (Which would make it essentially a partition)

luce80

[18:12](#msg5ce2edf8ad024978c6fcd448)@greggirwin Or maybe as Rebol2 does . (Which makes it essentially a filter) (forgive me if I am argumentative)

greggirwin

[18:59](#msg5ce2f91613e9854e3339dfe0)`remove-each` \*is* a less ambiguously named `filter`. :^)

[19:00](#msg5ce2f946d22ba766a2cec001)BUT, there's one big difference. It modifies the series in place, and so is much more efficient.

hiiamboris

[19:19](#msg5ce2fdaa7c363c75a7146690)&gt; so is much more efficient.

I wouldn't count on that ☺ A lot of removes from the series head may be slower than a lot of appends to a newly allocated buffer.

greggirwin

[19:54](#msg5ce306039404bf2aed7e2a69)Good point. Time to profile. Under R2 I think it did a bulk shrink after all removals, but Red does not.

## Tuesday 21st May, 2019

endo64

[07:21](#msg5ce3a70f0ac9852a95145911)`remove-each/into` could be interesting, but it is unclear that it will append the items removed or the rest.

toomasv

[08:21](#msg5ce3b5078f019114ae8e3ea0)@endo64 Yes, with help-string "Removed items are collected into provided block" or something like.

greggirwin

[18:28](#msg5ce4433cecdf942b4c209690)We can write `take-each` for that.

toomasv

[19:45](#msg5ce4554a6366992a94fa8ff7):+1:

## Wednesday 22nd May, 2019

Oldes

[14:02](#msg5ce55658ecdf942b4c27a6f2)

```
>> checksum "12345678901234567890123456789012345678901234567890123456789012345678901234567890" 'adler32

*** Runtime Error 1: access violation
*** in file: /X/GIT/Siskin-framework/Public/Red/red/runtime/crypto.reds
*** at line: 345
***
***   stack: red/crypto/adler32 0298C248h 80
***   stack: red/natives/checksum* false -1
***   stack: red/interpreter/eval-arguments 0278FA34h 0298C118h 0298C118h 00000000h 00000000h
***   stack: red/interpreter/eval-code 0278FA34h 0298C0F8h 0298C118h false 00000000h 00000000h 0278FA34h
***   stack: red/interpreter/eval-expression 0298C0F8h 0298C118h false false false
***   stack: red/interpreter/eval 0268E964h true
***   stack: red/natives/catch* true 1
***   stack: ctx373~try-do 00C9B694h
***   stack: ctx373~do-command 00C9B694h
***   stack: ctx373~eval-command 00C9B694h
***   stack: ctx373~run 00C9B694h
***   stack: ctx373~launch 00C9B694h
```

[14:02](#msg5ce556829d64e537bcf0f052)This is still not fully fixed: https://github.com/red/red/issues/3631

hiiamboris

[14:02](#msg5ce556899d64e537bcf0f07c)confirmed

GiuseppeChillemi

[14:35](#msg5ce55e4becdf942b4c27e810)I am using extensively my RED note management software and I am suffering sudden crashes with no error output at all (it should pass at least 1 ohur or more). It simply closes and GUI disappear when interacting with it. Even moving the mouse from the inside to the outside of the main window, or clicking on a text area could let it crash. Any clue on how to have some debug info for you ? RED 0.6.4 here.

hiiamboris

[15:48](#msg5ce56f3e6366992a9401f691)@GiuseppeChillemi build a GUI console from the sources

[15:50](#msg5ce56fd7ef853135c804c011)@GiuseppeChillemi or even better, add `needs: view` to the CLI console `environment\console\CLI\console.red` header, save it as `console-view.red` and build it with `rebol -s --do "do/args %red.r {-r -d environment/console/CLI/console-view.red} quit"` command

[15:51](#msg5ce56ff663dea422b4c84722)Unfortunately most of the random bugs stop from happening when you do that ☺

dockimbel

[16:51](#msg5ce57e15ecdf942b4c28d95d)@GiuseppeChillemi Is your app compiled or interpreted from the console?

1\. Disable the GC using `recycle/off`. If you can't reproduce the crash, it's the GC's fault. Turn GC on and proceed with 2. whatever the outcome of 1.  
2\. Compile your app using `-r -d` options and run it from DOS shell, instead of clicking on it. When it crashes, you'll get a call stack dump that you can report here.

GiuseppeChillemi

[21:47](#msg5ce5c36c75d9a575a629593b)@dockimbel compiled using: `red.exe -c -e -r -t windows`

dockimbel

[23:01](#msg5ce5d4c663dea422b4caff46)@GiuseppeChillemi `-c` and `-r` are mutually exclusive.

## Thursday 23th May, 2019

ne1uno

[22:54](#msg5ce7249a13e9854e3356caef)`view [ text 30x600 react [ face/text: tarea/text ] tarea: area 300x400 ""]`

[22:54](#msg5ce7249aef853135c810efcb)\*\** Script Error: cannot access area in path system/view/metrics/colors/(face/type)

[22:54](#msg5ce7249a63dea422b4d46aab)area or any other face type. not sure if it's related to react, this is just the smallest example so far

[22:54](#msg5ce7249ab313d723141983f3)RED: \[ branch: "master" tag: #v0.6.4 ahead: 283 date: 23-May-2019/14:03:51 commit: #986ecc30b] Win7

endo64

[23:11](#msg5ce728a80ac9852a952cd139)

```
>> view [area]
*** Script Error: cannot access area in path system/view/metrics/colors/(face/type)
>> about/debug
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.3 ahead: 1411 date: 23-May-2019/21:22:44 commit: #f7d3a96c8e403e24c97113223eb416171e94e238 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
```

[23:13](#msg5ce7292f83ae782aeebd2eec)Same for `field`, `button`, `check` and `radio` faces. Probably a regression of latest commits about maps.

greggirwin

[23:33](#msg5ce72dca63dea422b4d4ad72)Yes, though I think maps should have parity with blocks in path access on missing keys, rather than changing the view system. This is a tough call, and it was decided to match object behavior, but maps are more dynamic, by nature.

[23:34](#msg5ce72def75d9a575a63367e1)To determine a key's existence, then, you need to use `find`, as with blocks.

## Friday 24th May, 2019

koba-yu

[06:24](#msg5ce78e04ecdf942b4c376d1f)Hi, I updated Red binary today and VS code extension stops showing intellisense and mouse over popups.  
Should I raise a ticket for it?  
I get the issue Windows 7 and 10.

greggirwin

[06:28](#msg5ce78f158f019114aea8fc60)@koba-yu let's see if someone can confirm it first.

koba-yu

[06:29](#msg5ce78f330ac9852a952f50fb)@greggirwin I see, thank you for your response

Oldes

[14:58](#msg5ce806a48f019114aeac40b7)In Rebol2 was possible to write this:

```
>> x: 10
== 10
>> - x
== -10
```

but its not supported in Rebol3:

```
>> - x
** Script error: - operator is missing an argument
```

neigher in Red:

```
>> - x
*** Script Error: - operator is missing an argument
*** Where: catch
*** Stack:
```

@dockimbel is this by design?

[14:59](#msg5ce806cc75d9a575a6393b41)(note that I know I can use `negate x`)

rebolek

[14:59](#msg5ce806d69404bf2aeda0ba33)@Oldes I believe so. It's basically abuse of `op!`.

[15:02](#msg5ce807699404bf2aeda0bdc5)AFAIK, Red wants to properly honor arg arity, so `- 10` is invalid expression.

greggirwin

[16:09](#msg5ce8174983ae782aeec3880b)It is by design.

dockimbel

[17:01](#msg5ce82354ecdf942b4c3bbaa3)@Oldes By design. See to what mess it leads in R2:

```
>> + 10 4
== 14
>> - 10 4
== 4
```

Oldes

[17:02](#msg5ce823927c363c75a737f307)Interesting... I never noticed this. Thanks. Makes sense now.

## Monday 27th May, 2019

bitbegin

[01:39](#msg5ceb3fe78f019114aec1345d)

```
>> a: make map! [b: 1]
== #(
    b: 1
)
>> find a 'b
== b
>> a
== #(
    b 1
)
>>
```

[01:40](#msg5ceb400d9d64e537bc18e27c)found an issue about map! on daily version

greggirwin

[02:39](#msg5ceb4df775d9a575a64e86b0)Confirmed. Good catch.

[02:41](#msg5ceb4e52d22ba766a206c30e)

```
>>  a: make map! [b 1]
== #(
    b: 1
)
>>  find a first [b:]
== b
>> a
== #(
    b 1
)
>>  find a first [b:]
== none
```

dockimbel

[14:21](#msg5cebf24e8f019114aec61c3f)@qtxie ^---

Tovim

[15:46](#msg5cec066b83ae782aeedd9a90)Hi, my Windows 10, Red 25-May-19 returns `true`:

```
>>  a: make map! [b 1]
==  #(b: 1)

>>  find a 'b                         ;  or
>>  find a first [b:]             ;  returns
==true
```

ne1uno

[15:59](#msg5cec095e83ae782aeeddb185)you don't have `remove/key` too? that date seems wrong

qtxie

[16:01](#msg5cec09eb7c363c75a751ea53) @bitbegin @dockimbel Pushed a fix.

## Tuesday 28th May, 2019

endo64

[11:08](#msg5ced16c78f019114aece268b)Below script crashes when compiled:

```
Red []
index? none
```

```
D:\Projects\Red\red\build\bin>test.exe
*** Runtime Error 1: access violation

;Red 0.6.4 for Windows built 27-May-2019/19:00:46+03:00 commit #3dbcad2
```

Can someone confirm please?

[11:09](#msg5ced16edef853135c8390f08)I tested on Win10 with latest nightly build.

hiiamboris

[11:13](#msg5ced17c175d9a575a65ae933)@endo64 Don't bother filing it. It's a known bug. There's a PR https://github.com/red/red/pull/3894 to fix it but it'll likely take some time before it gets noticed and accepted.

endo64

[13:45](#msg5ced3b869d64e537bc26a6af)@hiiamboris Thank you

## Wednesday 29th May, 2019

temperfugit

[02:57](#msg5cedf5205de053468bd70557)

```
>> a: #("one" 2 "three" four)
== #(
    "one" 2
    "three" four
)
>> select a "one"
== 2
>> remove/key a "one"
== #(
    "three" four
)
>> select a "one"
```

That last line causes my GUI console to close on Windows 8.1.

greggirwin

[03:07](#msg5cedf77f82c2dc79a514557f)Confirmed @temperfugit. Please file a ticket, and note that `a/("one")` doesn't cause the problem, only `select` does.

temperfugit

[03:22](#msg5cedfb03cea8295279b773c7)Submitted! https://github.com/red/red/issues/3903

GiuseppeChillemi

[11:30](#msg5cee6d65cea8295279ba6462)If you have a GUI with different AREAs and text inside, could you try to rapidilly scroll UP and DOWN with the mouse wheel ? In my program this causes RED to crash after some time.

[11:31](#msg5cee6d7b9b50f63935499f74)Maybe tomorrow I could submit to you some code.

rebolek

[11:31](#msg5cee6d91cea8295279ba65fc)Having code to test it would really help.

GiuseppeChillemi

[12:51](#msg5cee8038481ef4167b97526b)Try this

```
txt: "" loop 1000 [insert txt rejoin ["Scroll me with mouse wheel up and down continuously" lf]]
view [area txt 600x300]
```

hiiamboris

[12:55](#msg5cee8124702b7e5e76f55dd6)@GiuseppeChillemi does it take long before it crashes?

GiuseppeChillemi

[13:04](#msg5cee835f6fc5846bab29e1f6)max 10 seconds here

[13:04](#msg5cee8370cea8295279baf66e)5 seconds usually

rebolek

[13:04](#msg5cee8375bf4cbd167cf7a35a)can't repro it on Linux.

GiuseppeChillemi

[13:08](#msg5cee8435ff3f016baa6e6a34)@rebolek @hiiamboris  
I forgot to add something:  
mouse wheel should act as thrid mouse button too: you have to click it/unclick randomly while scrolling

[13:08](#msg5cee845ebf4cbd167cf7aa6a)Here: Windows Server 2012 and 2008r2

[13:09](#msg5cee8493702b7e5e76f5768e)RED 31/03/2019: 49225468

rebolek

[13:10](#msg5cee84b06fc5846bab29eaf8)31.3.2019? Maybe you should update your build, it could be fixed already.

hiiamboris

[13:11](#msg5cee8516702b7e5e76f5794e)No crashes on W7, built May 20

toomasv

[13:17](#msg5cee8675faac6439340755db)No problem on W10 (built 21-May)

GiuseppeChillemi

[13:18](#msg5cee86b87c1dab468c681159)Confirmed on 27 may 2019 build, windows 10

[13:24](#msg5cee880bbf4cbd167cf7c02d)Latest build crashes everywhere too. The bug triggers when the mouse wheel is kept pressed (third mouse button) and scrolled.

[13:24](#msg5cee8823cea8295279bb1e0a)(no need to click/unclick)

[13:28](#msg5cee89187c1dab468c68278b)On server version it takes less than 4 seconds. On Windows 10 it takes even 20 or 30 seconds. Note: windows versions are accessed via terminal server, windows 10 is a regular desktop. You have to be constant scrolling and moving mouse pointer too. On windows 10 it seem you need to click unclick but it is not a 100% thing.

greggirwin

[13:55](#msg5cee8f44702b7e5e76f5c00c)@GiuseppeChillemi keep trying to find a reproducible case. I can't dupe it on win10 either, using your instructions. I admit it's hard to scroll, press the mouse wheel, \*and* move the mouse around all at the same time, so maybe just not doing enough.

Oldes

[15:00](#msg5cee9eab65392c3b608699f2)@GiuseppeChillemi it was already mentioned, you should make a debug build and run it from console, so one can see, where exactly the crash is.

GiuseppeChillemi

[16:59](#msg5ceeba6bfaac64393408c276)@Oldes

```
*** Runtime Error 13: integer divide by zero
*** in file: /C/Users/*****************/Desktop/bug/m
odules/view/backends/windows/events.reds
*** at line: 1499
***
***   stack: gui/process 0000000Dh
***   stack: win32-startup-ctx/exception-filter 0017FA24h
```

Oldes

[17:00](#msg5ceebaa3481ef4167b98edce)Fine... now you should report it in the bug issue, if there is any ;-)

hiiamboris

[17:00](#msg5ceebac36fc5846bab2b7a89)Is this all the stack trace? Just two entries?

GiuseppeChillemi

[17:04](#msg5ceebb81e41fe15e75dbccc8)Compiled using `-r` `-d`. Yes that's all.

hiiamboris

[17:07](#msg5ceebc36f3a60a79a41e8bd8)@GiuseppeChillemi please raise an issue on the tracker with the provided snippet, stack trace and a link to this chat. It's at least something one can work with in an attempt to reproduce it.

[17:10](#msg5ceebd206f530d3b6102b062)Although I can't help but notice that it's a curious issue here. \[Line 1499](https://github.com/red/red/blob/073d19179c7b20d96a405e915bf8a2572e83b870/modules/view/backends/windows/events.reds#L1499) is just:  
`default [EVT_DISPATCH]`  
(where EVT\_DISPATCH = 1). I don't see a zero division there. Could be an R/S bug or some corrupt pointer overwriting the code with junk?

GiuseppeChillemi

[17:14](#msg5ceebdec6f530d3b6102b93c)My first bug report is here:

https://github.com/red/red/issues/3906

[17:15](#msg5ceebe1ccea8295279bca411)If anything is missing please tell me I will provide the needed info.

hiiamboris

[17:16](#msg5ceebe6b702b7e5e76f71dc7)I think R/S would benefit a lot from some boundary checking mechanisms in debug mode. Although the hard nut is how to find out what the boundaries are, as it's struct and array access is anything but declarative.

[17:18](#msg5ceebef1481ef4167b9909cb)@GiuseppeChillemi FYI you can use the same formatting there as you do here on gitter

GiuseppeChillemi

[17:30](#msg5ceec1b7481ef4167b991dce)Thanks, being here with you is having constant lessons and improvements.

qtxie

[21:04](#msg5ceef3cd702b7e5e76f88e81)@hiiamboris Maybe the `divide by zero` is in here: https://github.com/red/red/blob/073d19179c7b20d96a405e915bf8a2572e83b870/modules/view/backends/windows/events.reds#L1445

[21:05](#msg5ceef415ff3f016baa717f09)But I cannot reproduce the crashes on Win10 1903.

hiiamboris

[21:11](#msg5ceef586bf4cbd167cfae6c6)@qtxie Yeah maybe. I guess it's worth patching that `x / y` for zero case anyway. And then we'll see if @GiuseppeChillemi can still crash it.

[21:11](#msg5ceef59b6f530d3b61044072)BTW, I tried on a W10 VM (super slow) - no luck ☺

GiuseppeChillemi

[22:13](#msg5cef041eff3f016baa71e633)Ok, my psichyartist told me I have imagined everything again! 😔😄

hiiamboris

[22:22](#msg5cef061e9b50f639354ddefa):D

[22:24](#msg5cef06bbb76eac527a6f2754)@GiuseppeChillemi since you were already able to compile the debug console, maybe you could do it again after adding an `assert y <> 0` before \[this line](https://github.com/red/red/blob/073d19179c7b20d96a405e915bf8a2572e83b870/modules/view/backends/windows/events.reds#L1445) and see if the zero divide error changes into an assertion error?

## Thursday 30th May, 2019

GiuseppeChillemi

[05:20](#msg5cef680efaac6439340d3479)Have I to download the whole source repository?

endo64

[05:21](#msg5cef68746fc5846bab2fd7f1)@GiuseppeChillemi Yes, you can clone or download it from GitHub.

Oldes

[15:26](#msg5ceff6277c1dab468c71955b)`system/options/boot` is `string!` and not `file!`, is it by design?

greggirwin

[16:42](#msg5cf007f7e41fe15e75e480b4)I think it should, and if it's by design from an earlier stage of Red, we need to understand the use case. Should be easy to add to `extract-boot-args`.

endo64

[20:20](#msg5cf03af0702b7e5e7600ffb8)There is a check for `none` in the beginning of the `extract-boot-args` function `unless args: system/script/args [exit]`, but `system/script/args` is empty string instead of `none` if there is no args to the script. Should it be fixed?

greggirwin

[20:29](#msg5cf03d3782c2dc79a5234d60)If it can never be true, yes. In R2 it was none, so maybe a change somewhere else in the boot process was made.

[20:30](#msg5cf03d4c702b7e5e760110fb)Worth asking "why?" a couple times there.

hiiamboris

[21:03](#msg5cf0451a6f530d3b610d0830)&gt; If it can never be true

Sure? What about DLLs/drivers?

GiuseppeChillemi

[22:01](#msg5cf052c5f3a60a79a428e9d0)I have tried compiling RED with:

```
do/args %red.r "-r -t Windows %environment/console/GUI/gui-console.red"
```

I get:

```
Script: "Red command-line front-end" (none)
** Access Error: Cannot open /*/_Drives/**********/********/Svi/red-master/system/utils/encap-fs.r
** Near: do %system/utils/encap-fs.r
>>
```

dockimbel

[22:07](#msg5cf054386f530d3b610d7348)@GiuseppeChillemi Are you running the command from Red's root folder?

GiuseppeChillemi

[22:13](#msg5cf05574702b7e5e7601ac5b)@dockimbel Dropbox locked a directory while moving files for some strange reason. I have just moved the /system dir in the right place and I am compiling RED for the first time in my life.

[22:21](#msg5cf05755ff3f016baa7a8ff7)I get an error "can't find get entry point -getgestureinfo- in dynamic library user32.dll"

[22:21](#msg5cf05763bf4cbd167c04021b)(Translated from italian)

[22:21](#msg5cf05773b76eac527a77bfc1)This happen when I run the executable

[22:22](#msg5cf0578f65392c3b6092013c)Then it crashes

dockimbel

[22:34](#msg5cf05a7d5de053468be6cae0)@GiuseppeChillemi Are you on Windows XP?

GiuseppeChillemi

[22:46](#msg5cf05d3d65392c3b609222c8)Windows 2008R2

[22:49](#msg5cf05de5cea8295279c71583)@dockimbel compiled on win 10, executed on 2008 r2

dockimbel

[22:49](#msg5cf05de6e41fe15e75e6d459)Try by compiling using `-t WindowsXP`. That removes the dependency on the gesture API.

GiuseppeChillemi

[22:50](#msg5cf05e36ff3f016baa7ab8a0)-t WindowsXP on REBOL, isn't it?

dockimbel

[22:52](#msg5cf05e91f3a60a79a429309b)`do/args %red.r "-r -t WindowsXP %environment/console/GUI/gui-console.red"`

GiuseppeChillemi

[22:56](#msg5cf05fa6ff3f016baa7abfef)Thanks, I'll try it tomorrow morning as I have relocated into my bed to sleep!

## Friday 31st May, 2019

GiuseppeChillemi

[06:08](#msg5cf0c4f76fc5846bab38d057)@dockimbel Done, the compiled RED hangs at startup on the target machine. (Not my program, RED itself)

hiiamboris

[08:27](#msg5cf0e572cea8295279ca8494)@GiuseppeChillemi what about the WS2012 machine?

dockimbel

[10:04](#msg5cf0fc409b50f639355a84d0)@GiuseppeChillemi What do you mean by "RED itself"? The `gui-console` executable?

GiuseppeChillemi

[13:58](#msg5cf1330df3a60a79a42e85a9)@dockimbel yes.

[16:44](#msg5cf15a019b50f639355d0285)@hiiamboris on the WS2012 it works. On WS2008R2 it hangs and consumes 1.2GB of ram.

hiiamboris

[16:56](#msg5cf15ca1bf4cbd167c0a9f80)@GiuseppeChillemi what about the assertion you added? does it crash on assert or on divide error? (on WS2012)

GiuseppeChillemi

[18:20](#msg5cf1708165392c3b6099548c)@hiiamboris

I know I am doing something terribly stupid here but I don't know what it is !

```
CMD:> gui-console.exe -r -d -t MSDOS buggy.r
```

```
*** Access Error: cannot open: %-r
*** Where: read
*** Stack: 
--== Red 0.6.4 ==-- 
Type HELP for starting information. 
>>
```

[18:21](#msg5cf170bb6f530d3b6114a386)Is gui-console.exe = RED.exe

9214

[18:28](#msg5cf172697c1dab468c7b81d3)Console is not a toolchain.

hiiamboris

[18:52](#msg5cf177ee5de053468bee1802)@GiuseppeChillemi Just `gui-console buggy.red` (it's .red is it not?)

GiuseppeChillemi

[18:54](#msg5cf178595de053468bee1a2d)It's .r even if RED.

hiiamboris

[18:56](#msg5cf178c4cea8295279ce7791)Okay, extension doesn't really matter

GiuseppeChillemi

[19:22](#msg5cf17efdcea8295279cea11e)I have run it, it crashed moving the mouse wheel but no debug info on the consolle. Compiled CONSOLE with -d option

hiiamboris

[19:24](#msg5cf17f7abf4cbd167c0b8aae)@GiuseppeChillemi did you run it from command line?

GiuseppeChillemi

[19:45](#msg5cf184606fc5846bab3dfac3)yes

[19:45](#msg5cf184656f530d3b61152cb2)no

[19:45](#msg5cf1847265392c3b6099d101)Let me see

[19:47](#msg5cf184e77c1dab468c7beed9)@hiiamboris I compiled the command line using this command in REBOL: `do/args %red.r "-r -d -t WindowsXP %environment/console/GUI/gui-console.red"`

[19:48](#msg5cf1850a702b7e5e760992f5)Then I run gui-console.red from dos command prompt

hiiamboris

[19:48](#msg5cf1851c702b7e5e76099313)@GiuseppeChillemi what output do you get in dos command prompt?

GiuseppeChillemi

[19:48](#msg5cf185256f530d3b61153013)And executed buggy.r from gui-console.red

[19:49](#msg5cf1854cb76eac527a7f79df)No output at all

hiiamboris

[19:50](#msg5cf18574481ef4167bab4f0b)well, that's strange because when I compile the console with `-d` flag, all console output is mirrored into the dos prompt window, so even when the console closes I still see it

GiuseppeChillemi

[19:52](#msg5cf185eae41fe15e75ee6d53)I am looking again at the whole process

hiiamboris

[19:52](#msg5cf18601ff3f016baa82489b)I can only suggest you either repeat your actions or use my advice from \[May 22, 2019 6:48 PM](https://gitter.im/red/bugs?at=5ce56f3e6366992a9401f691)

[19:54](#msg5cf18681481ef4167bab578d)or, using the same command line you can compile your script (instead of the console) directly

GiuseppeChillemi

[19:58](#msg5cf187487c1dab468c7bff58)Compiling just now

[20:02](#msg5cf1883e82c2dc79a52bfd3b)@hiiamboris, yes we have a result from executing "buggy.r" !

(Windows 2012R2 here), with added `assert`

```
*** Runtime Error 98: assertion failed
*** in file: /C/Users/Administrator/Dropbox/Svi/red-master/modules/view/backends
/windows/events.reds
*** at line: 1500
***
***   stack: gui/process 00000062h
***   stack: gui/process 0018F9F4h
***   stack: gui/do-events false
***   stack: ctx408~do-event-loop false
***   stack: do-events
***   stack: view
***   stack: red/_function/call 02500CA4h 00883884h
***   stack: red/interpreter/eval-code 02500CA4h 02885B6Ch 02885B6Ch false 00000
000h 00000000h 02600FE4h
***   stack: red/interpreter/eval-expression 02885B5Ch 02885B6Ch false false fal
se
***   stack: red/interpreter/eval 02500C94h true
***   stack: red/natives/try* true 0
***   stack: do-file
***   stack: red/natives/do* false -1 -1 -1
***   stack: red/interpreter/eval-arguments 02600414h 02885560h 02885560h 000000
00h 00000000h
***   stack: red/interpreter/eval-code 02600414h 02885550h 02885560h false 00000
000h 00000000h 02600414h
***   stack: red/interpreter/eval-expression 02885550h 02885560h false false fal
se
***   stack: red/interpreter/eval 02500BE4h true
***   stack: red/natives/catch* true 1
***   stack: ctx510~try-do 008A1450h
***   stack: ctx510~do-command 008A1450h
***   stack: ctx510~eval-command 008A1450h
***   stack: ctx510~run 008A1450h
***   stack: ctx510~launch 008A1450h
```

hiiamboris

[20:02](#msg5cf1885765392c3b6099eb8e)Finally! :clap: ☻

GiuseppeChillemi

[20:03](#msg5cf18881ff3f016baa82593f)Thanks, I am feeling a deep emotion now.

hiiamboris

[20:04](#msg5cf188b5b76eac527a7f8f51)Now you're pro. You have modified the Red sources and located a bug ☻

[20:04](#msg5cf188ddf3a60a79a430dca1)@qtxie so now we know it's that `x / y` line. I suppose some drivers \*do* report a zero wheel offset after all.

GiuseppeChillemi

[20:06](#msg5cf18945cea8295279ceea61)@hiiamboris  
Yes, I am a pro like when I was a child an my dad let me drive the car on his legs pushing the pedals and let me move the sterring wheel with him leaving his hands from time to time ! ;-)

9214

[20:07](#msg5cf1898abf4cbd167c0bcb2a)@hiiamboris can you add this info to the related ticket?

hiiamboris

[20:07](#msg5cf189996fc5846bab3e1e69)was there a ticket?

GiuseppeChillemi

[20:08](#msg5cf189a09b50f639355e4844)Yes

hiiamboris

[20:08](#msg5cf189a7faac6439341b4ac2)right! :)

9214

[20:08](#msg5cf189c0e41fe15e75ee8483)#3906 IIRC.

GiuseppeChillemi

[20:15](#msg5cf18b707c1dab468c7c1b00)What are those ex numbers in stack output ? What do they rapresent to you ?

```
red/interpreter/eval-arguments 02600414h 02885560h 02885560h 000000
00h 00000000h
```

[20:16](#msg5cf18bb49b50f639355e5563)In other words: how do you read stack output ?

hiiamboris

[20:17](#msg5cf18bd1ff3f016baa8271c6)it's the arguments to `eval-arguments` function (memory addresses)

[20:17](#msg5cf18bdeb76eac527a7fa441)but in your case what was important is `*** Runtime Error 98: assertion failed`

GiuseppeChillemi

[20:20](#msg5cf18c81b76eac527a7fa69d)I have read it.  
Do those addresses contain data/code slots ?

hiiamboris

[20:20](#msg5cf18ca8b76eac527a7fa75b)Pointers to Red structures usually (so-called nodes).

GiuseppeChillemi

[20:24](#msg5cf18d746fc5846bab3e3a15)This is why they repeat. I can seed them as being like blocks, data, passed as arguments and handed to functions. But... just my imagination !

greggirwin

[20:59](#msg5cf195af9b50f639355e9c8e)&gt; Yes, I am a pro like when I was a child an my dad let me drive the car on his legs pushing the pedals and let me move the sterring wheel with him leaving his hands from time to time ! ;-)

:^) I love that.

Good work team! Thanks for the time to find it @GiuseppeChillemi and to @hiiamboris and others for helping him get there.

GiuseppeChillemi

[21:45](#msg5cf1a0905de053468bef3f83)@greggirwin the time spent one RED is always well invested.

## Thursday 6th June, 2019

Oldes

[15:47](#msg5cf9357fe41fe15e7521c671)I guess we have an issue when constructing \_urls_ with already url-encoded values..  
In Rebol2:

```
>> append http://foo? "%20b"
== http://foo?%20b
```

While in Rebol3 and Red:

```
>> append http://foo? "%20b"
== http://foo?%2520b
```

I bet, that Rebol2 is more correct. Or am I wrong?

[15:50](#msg5cf9365c3dcdab4003fdf4ff)I guess, that Rebol3 and Red are trying to be user friendly, which may work in above example, as one can do simply:

```
>> append http://foo? " b"
== http://foo?%20b
```

But the problem is, that R3 and Red does not handle other chars, which should be url-encoded, like:

```
>> append http://foo? " \b"
== http://foo?%20\b  ;<---- should be http://foo?%20%5Cb
```

greggirwin

[16:23](#msg5cf93e11b76eac527ab32348)The question is how Red can know what you want. It isn't right vs wrong, but a choice. In R2 how do you get around the behavior. In Red you can use `dehex` before appending. But `\` is not a special char in URLs, so that's not a bug. Here are the general delims and sub-delims, which shows some are escaped, but not all:

```
>> append http://foo? ":/?#[]@"
== http://foo?:/?#%5B%5D@
>> append http://foo? "!$&'()*+,;="
== http://foo?!$&'%28%29*+,%3B=
```

Needs a good analysis and proposal for changes.

Oldes

[16:45](#msg5cf9433c65392c3b60ce1969)@greggirwin according \[this](https://stackoverflow.com/a/1547940/494472) `\` should be escaped. I agree that it is difficult topic.

greggirwin

[16:53](#msg5cf9450c4dfb4240048e0900)Escaping the unsafe/unwise characters doesn't hurt anything. The question is whether they will cause problems if unescaped. For example, what are you using `\` for?

Oldes

[16:54](#msg5cf945409b50f6393591dd0a)I'm not using it.. it was just a randomly picked char which I was expecting to be escaped

[16:58](#msg5cf9462de41fe15e75224ff3)It looks that Red is escaping just chars, which are supposed to be invalid in its lexer (delimiters)

[17:26](#msg5cf94caf9b50f639359218a0)Ok... I take it back... looks like Red and Rebol3 are not bad as I thought... it is the result from mold, which is confusing... this results looks logical now:

[17:26](#msg5cf94cb6bf4cbd167c3fbfc9)

```
>> mold append http:// {%28}
== "http://%2528"

>> form append http:// {%28}
== "http://%28"

>> dehex form append http:// {%28}
== "http://("

>> dehex mold append http:// {%28}
== "http://%28"
```

greggirwin

[17:43](#msg5cf950b06fc5846bab7281db)Good info for a `url!` wiki page.

## Friday 7th June, 2019

raimundasa

[10:51](#msg5cfa41beff3f016baabcf7f4)After updating my Gentoo Linux system I cannot run Red. All versions, two different computers.

$ red

\*\** Runtime Error 32: segmentation fault  
\*\** at: B7E54C48h

$ ldd /usr/local/bin/red

linux-gate.so.1 (0xb7f48000)  
libm.so.6 =&gt; /lib/libm.so.6 (0xb7e5d000)  
libdl.so.2 =&gt; /lib/libdl.so.2 (0xb7e57000)  
libc.so.6 =&gt; /lib/libc.so.6 (0xb7c7b000)  
/lib/ld-linux.so.2 (0xb7f49000)  
12 $ ldd --version  
13  
14 ldd (Gentoo 2.29-r2 p3) 2.29

## Wednesday 12nd June, 2019

endo64

[06:57](#msg5d00a25ec5386926f6d517e1)`make-face/spec 'base [red]` hangs the CLI &amp; GUI console. Tested on Win10.

dockimbel

[09:28](#msg5d00c5c1c2e5ba268ce310d6)@endo64 I'm opening a ticket for it, as I stumbled upon similar problem yesterday.

[09:49](#msg5d00ca93ee9dda04629a7133)@raimundasa Did you find the change that make it crash?

## Tuesday 18th June, 2019

Re-git

[20:51](#msg5d094ee1d100e447fc47aeab)Intelisense, auto completion and hover to view function definitins does not work using VScode Red extension. I'm on a freshly installed windows 10 and i'm using the most recent daily build of Red. Syntax coloring and Interpret as well as compile shortcuts work without problem.

dockimbel

[21:00](#msg5d0950ed26477710bbe0b556)@vejitatoja Thanks for the report. Can someone else on W10 confirm that? If confirmed, please open a ticket in https://github.com/red/VScode-extension repo.

## Wednesday 19th June, 2019

koba-yu

[03:19](#msg5d09a9d4d100e447fc4b1f5a)@dockimbel @vejitatoja  
:point\_up: \[May 24, 2019 3:24 PM](https://gitter.im/red/bugs?at=5ce78e04ecdf942b4c376d1f)  
On my PC(Win 10 and 7), with 2019-3-19's red binary, VS Code Extension works. However after some day of May, it does not work.

endo64

[05:15](#msg5d09c5018e050f62aa51b888)On my Win10, syntax coloring,

[05:17](#msg5d09c54c950f1062a9a4f371)and intellisense works. autocomplete of functions, go to def. and hover doesn't work.

bitbegin

[07:52](#msg5d09e9bafbcc305cc4a70038)@vejitatoja @koba-yu @endo64 @dockimbel published a new version to resoled this issue, please update it

dockimbel

[11:56](#msg5d0a22e4bb789747fb3ecc4f)@bitbegin Thank you for the quick fix!

koba-yu

[13:05](#msg5d0a331f4e8f972d375757e2)@bitbegin I have just tried the new version and it works on my Win 10. Thank you for your fix!

Re-git

[15:39](#msg5d0a574ebc56c731f8f76b29)Thank you for fixing it so fast! Everything works again.

[15:50](#msg5d0a59da4e8f972d3758bc59)I have noticed that image! datatype is not being garbage collected and that makes my script crash after some time. Is there a way to manually clear something from memory?

dander

[16:56](#msg5d0a6948a8d9871b32c5fe7a)Thanks @bitbegin! The plugin is really fantastic. Thanks so much for your work on it!

greggirwin

[18:02](#msg5d0a78c48e050f62aa57b515)@vejitatoja, unfortunately, no. Nothing you can do manually.

dockimbel

[21:32](#msg5d0aaa024e8f972d375b9fa5)@vejitatoja Garbage collecting image! values is on our short-term todo list (should be done this month), we discussed about it earlier today in the core team. In the meantime, it should be possible to write a routine to release the system resources allocated by the image, but it's low-level code and OS-specific. Also, it would preclude your script from running from the console, it would need to be compiled every time.  
@qtxie anything to add to that?

Re-git

[22:05](#msg5d0ab195f5cf1f10bcafbb00)@dockimbel I'm happy to know that it is being worked on.

## Saturday 22nd June, 2019

qtxie

[09:22](#msg5d0df366bc834f76a4c007cc)@vejitatoja @dockimbel I pushed a PR for garbage collecting image!. We can also give action `delete` the ability to delete an image.

[09:30](#msg5d0df532d1aaa16964ea48cf)Also we need some strategies to trigger the GC, as the image memory is allocate by the OS, we don't know how much it has been used.

## Tuesday 25th June, 2019

GiuseppeChillemi

[07:51](#msg5d11d29a260d3b49815bad2b)Before I install it. Is VScode be able a build/show a list of user defined function using that extension?

bitbegin

[08:23](#msg5d11da0e260d3b49815bf0bd)@GiuseppeChillemi yes

endo64

[11:11](#msg5d12014b492f010bcab9cd3c)`attempt` with `exit` and without `safer` refinement breaks `attempt` function:

```
>> attempt [1 / 0]
== none
>> attempt [a: 10 exit]
*** Script Error: invalid argument: [a: 10 exit]
>> attempt [1 / 0]
== [1 / 0]
```

dockimbel

[13:55](#msg5d1227c9ec8b5d01bd81938e)@endo64 `exit` and `return` are throwing specific exceptions, so they are not caught by a simple `attempt` (using `try` internally), it needs the `/safer` option. Though, the error there is odd...

[13:57](#msg5d1228497c83cf48c374ac20)

```
lisp
>> attempt [a: 10 exit]
*** Script Error: invalid argument: [a: 10 exit]
*** Where: catch
*** Stack:  

>> probe :attempt
console
== console
```

Seems like it's corrupting the environment, so worth a ticket.

endo64

[15:36](#msg5d123f96ede27801bc8e5762)Done. #3924

meijeru

[21:19](#msg5d128fd0e9a49c3dabf88b88)But see also #3362 !

GiuseppeChillemi

[22:06](#msg5d129aecec8b5d01bd85bbc3)@bitbegin when I insert my path to the red toolchan all the `\` disappear and path elements are joined.

[22:08](#msg5d129b42527a392800c1a234)my path is...  
`E:\_Drives\_DropBox Giuseppe Chillemi\Dropbox\Svi\prj-LearnRED`  
It is translated to

[22:09](#msg5d129ba487ca0b48c498da84)`E:DrivesDropBox Giuseppe Chillemiropboxvirj-LearnRED`

dander

[22:24](#msg5d129f19d1f90916619a5cff)@GiuseppeChillemi if you are editing the settings.json directly, you need to use `\\`

dockimbel

[22:30](#msg5d12a08ed1f90916619a696a)@meijeru Looks like the same bug.

GiuseppeChillemi

[22:44](#msg5d12a3e6ede27801bc91f93b)@dander "The active file is not a Red or Red/System source file" when hitting F6

[22:46](#msg5d12a446ede27801bc91fc6a)

```
Red [

]

myprint: func [arg] [print arg]
myprint arg
```

Filename is `VSCodeTry.r`

[22:47](#msg5d12a48b5ca4702801d948c8)Settings.json is:

```
{
    "red.redPath": "E\\_Drives\\_DropBox Giuseppe Chillemi\\Dropbox\\Svi\\prj-LearnRED",
    "red.buildDir": "E:\\_Drives\\_DropBox Giuseppe Chillemi\\Dropbox\\Svi\\prj-LearnRED"
}
```

endo64

[23:37](#msg5d12b02a714a6e08cf2336b5)@meijeru Thanks!

## Wednesday 26th June, 2019

bitbegin

[01:51](#msg5d12cfa1fbf4a92f91fa8e56)@GiuseppeChillemi the file with extension `*.red` will be treated as Red file, if you want `*.r` as Red file, please `select language mode` to Red

dander

[03:17](#msg5d12e3d4b3f22a4b2a37f78b)@GiuseppeChillemi I think `redPath` also should include the red.exe, and it looks like you are missing the colon on the drive letter

GiuseppeChillemi

[09:00](#msg5d133427f040bc5fb6c87d3a)@bitbegin saved as `*.red` , no results. also added red.exe, still no results.

bitbegin

[09:35](#msg5d133c49dbd46e037d7fef63)\[!\[image.png](https://files.gitter.im/red/bugs/1LKy/thumb/image.png)](https://files.gitter.im/red/bugs/1LKy/image.png)

[09:35](#msg5d133c564e13324f8b8f1a61)\[!\[image.png](https://files.gitter.im/red/bugs/jELL/thumb/image.png)](https://files.gitter.im/red/bugs/jELL/image.png)

[09:35](#msg5d133c5b6e07c20470639841)@GiuseppeChillemi

GiuseppeChillemi

[11:03](#msg5d1350ee6fb02f5f69340aec)@bitbegin  
Here is the actual config file (note, the system inserts uses --cli by itself)

```
{
    "red.redPath": "E:\\_Drives\\_DropBox Giuseppe Chillemi\\Dropbox\\Svi\\prj-LearnRED\\Red.exe",
    "red.buildDir": "E:\\_Drives\\_DropBox Giuseppe Chillemi\\Dropbox\\Svi\\prj-LearnRED\\"
}
```

Here is the consolle output

```
Windows PowerShell
Copyright (C) Microsoft Corporation. Tutti i diritti sono riservati.

PS C:\Users\myname> E:\_Drives\_DropBox Giuseppe Chillemi\Dropbox\Svi\prj-LearnRED\Red.exe --cli e:\_Drives\_DropBox Giuseppe Chillemi\Dropbox\Svi\prj-LearnRED\VSCodeTry.red
E:\_Drives\_DropBox : Termine 'E:\_Drives\_DropBox' non riconosciuto come nome di 
cmdlet, funzione, programma eseguibile o file script. Controllare l'ortografia del 
nome o verificare che il percorso sia incluso e corretto, quindi riprovare.
In riga:1 car:1
+ E:\_Drives\_DropBox Giuseppe Chillemi\Dropbox\Svi\prj-LearnRED\Red.ex ...
+ ~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: (E:\_Drives\_DropBox:String) [], Comma 
   ndNotFoundException
    + FullyQualifiedErrorId : CommandNotFoundException
```

Please look at this:

`ObjectNotFound: (E:\_Drives\_DropBox:String)`

The path has been truncated at the first space.

rebolek

[11:04](#msg5d1351596e07c204706464e6)@GiuseppeChillemi don't you need to escape spaces as well?

bitbegin

[11:06](#msg5d1351a9b3f22a4b2a3be72f)@GiuseppeChillemi you can change the "\\\\\\\\" to "/"

rebolek

[11:07](#msg5d1351e70a60964f8a8e84eb)try something like `E:\\_Drives\\_DropBox\ Giuseppe\ Chillemi\\Dropbox\\Svi\\prj-LearnRED\\Red.exe` or how does the escaping work there.

GiuseppeChillemi

[11:09](#msg5d135264850b87037c60a3a1)@rebolek I do not know how to escape them in this situation as I supposed standard DOS rules were in place.

[11:10](#msg5d13529911ba925f6a28c8cd)Also it seems I have to close and reopen VSStudio to accept corrections when there were errors.

rebolek

[11:12](#msg5d135335850b87037c60abfe)@GiuseppeChillemi so try `\`and see what happens

GiuseppeChillemi

[11:17](#msg5d13545c38c2bf757dbcab2b)`E:\_Drives\_DropBoxspace>Giuseppespace>Chillemi\Dropbox\Svi\prj-LearnRED\`

[11:18](#msg5d13546daacbfb5fb7ce3a1d)GiuseppeSpace, my new internet alias !

rebolek

[11:19](#msg5d1354abd92cb54b297a2f69):D I meant backslash followed by space instead of just a space and certainly not , it's just that Gitter strips space from code

[11:19](#msg5d1354bc38c2bf757dbcaf83)see my first example

GiuseppeChillemi

[11:19](#msg5d1354dddbd46e037d80e106)MEGALOL !!!!!

bitbegin

[11:21](#msg5d13554611ba925f6a28e34d)`E:/_Drives/_DropBox Giuseppe Chillemi/Dropbox/Svi/prj-LearnRED` should be ok

GiuseppeChillemi

[11:22](#msg5d13557111ba925f6a28e56c)I have already tried backslash followed by space so I thought `\` was another solution !

rebolek

[11:23](#msg5d1355a8aacbfb5fb7ce45a5)Ah, I see :)

9214

[11:26](#msg5d13564d850b87037c60c967)

```
text
E:\\_Drives\\_DropBox%20Giuseppe%20Chillemi\\Dropbox\\Svi\\prj-LearnRED\\Red.exe
```

GiuseppeChillemi

[11:26](#msg5d135666dbd46e037d80f26f)@bitbegin It didn't work

[11:26](#msg5d13566baacbfb5fb7ce502c)@9214 trying

[11:38](#msg5d13591de6ae0b757c6612b5)@9214

```
{
    "red.redPath": "E:\\_Drives\\_DropBox%20Giuseppe%20Chillemi\\Dropbox\\Svi\\prj-LearnRED\\Red.exe",
    "red.buildDir": "E:\\_Drives\\_DropBox%20Giuseppe%20Chillemi\\Dropbox\\Svi\\prj-LearnRED\\"
}
```

Command not recognized as cmdlet...

```
PS C:\Users\myname> E:\_Drives\_DropBox%20Giuseppe%20Chillemi\Dropbox\Svi\prj-LearnRED\Red.exe --cli e:\_Drives\_DropBox Giuseppe Chillemi\Dropbox\Svi\prj-LearnRED\VSCodeTry.red
E:\_Drives\_DropBox%20Giuseppe%20Chillemi\Dropbox\Svi\prj-LearnRED\Red.exe : Termine 
'E:\_Drives\_DropBox%20Giuseppe%20Chillemi\Dropbox\Svi\prj-LearnRED\Red.exe' non 
riconosciuto come nome di cmdlet, funzione, programma eseguibile o file script. 
Controllare l'ortografia del nome o verificare che il percorso sia incluso e 
corretto, quindi riprovare.
In riga:1 car:1
+ E:\_Drives\_DropBox%20Giuseppe%20Chillemi\Dropbox\Svi\prj-LearnRED\Re ...
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: (E:\_Drives\_Dro...earnRED\Red.exe:Str 
   ing) [], CommandNotFoundException
    + FullyQualifiedErrorId : CommandNotFoundException
```

rebolek

[11:39](#msg5d13596211ba925f6a290a27)Windows ¯\\\\\_(ツ)\_\_/¯

GiuseppeChillemi

[11:39](#msg5d13596738c2bf757dbcdf7a)It has been much easier the first time I built the console from sources !

[11:39](#msg5d13598daacbfb5fb7ce6e50)@rebolek your modifications made a nice animation here !

rebolek

[11:40](#msg5d135995aacbfb5fb7ce6e74):)

GiuseppeChillemi

[11:49](#msg5d135bc1b3f22a4b2a3c4bdf)Just a note: if you edit the JSON config the path is above the toolchain, in the GUI it is below. Moving back and forth confuses the mind which expect to see it on the just used position.

[11:51](#msg5d135c4b501ea60f124a4fb0)Ok, forget about my message

[11:51](#msg5d135c51aacbfb5fb7ce8927)It's not fixed.

[11:52](#msg5d135c6df040bc5fb6ca0004)I can revert and nothing changes the order (but I will close and oopen VSTudio to be sure)

9214

[11:56](#msg5d135d5ed65dae046f9073aa)People who use spaces in file paths usually ask for trouble.

[11:59](#msg5d135e3ab3f22a4b2a3c6370)

```
text
'E:\\_Drives\\_DropBox Giuseppe Chillemi\\Dropbox\\Svi\\prj-LearnRED\\Red.exe'
```

Or try the same but with double quotes, or use backtick for escaping.

```
E:\\_Drives\\_DropBox` Giuseppe` Chillemi\\Dropbox\\Svi\\prj-LearnRED\\Red.exe
```

GiuseppeChillemi

[12:01](#msg5d135e83e6ae0b757c664458)@9214 It's 2019 not 1989, we can't ask people to not use spaces in paths. It's better we are discovering this problem right now that when we will have wider audience

rebolek

[12:01](#msg5d135eab6fb02f5f69349584)@GiuseppeChillemi this has nothing to do with Red.

GiuseppeChillemi

[12:02](#msg5d135ec96e07c2047064eada)@rebolek I supposed there were some problem with the extension...

[12:02](#msg5d135ed16e07c2047064eafb)That was my subject and not Red itself

9214

[12:02](#msg5d135eeef040bc5fb6ca1944)@GiuseppeChillemi this is solely your problem, not Red's or VSCode plugin. Why you're using `/bugs` room to solve it is beyond my understanding.

rebolek

[12:03](#msg5d135ef6b3f22a4b2a3c6a2c)Ok. But the extension itself depends on VS Code, Windows and so on on path handling.

GiuseppeChillemi

[12:06](#msg5d135fdfb3f22a4b2a3c7290)@9214 beacuse we are analyzing a problem and later qualify it to be a bug or not. A thing which has always been done here in this manner.

rebolek

[12:07](#msg5d13601338c2bf757dbd1d85)@GiuseppeChillemi He means that this room is for Red bugs and not for VSCode problems with spaces in paths.

[12:08](#msg5d136039b3f22a4b2a3c76a8)Which is unrelated to Red and I expect other extensions to have same problem.

GiuseppeChillemi

[12:17](#msg5d136243501ea60f124a8d92)@rebolek I know but I have seen a discussion about a BUG in VSCode red extension just before mine.. It triggered my curiosity for such work to have a better coding enviromnent.. so I downloaded it and discovered the extension was not able correctly handle paths (and you think it is the extension because the bug happen under the configuration file you think the extension controls)... so I am back to the room where I have seen discussing a bug about the VSCode red extension !  
Feel free to point me the proper discussion room and I'll move there.

rebolek

[12:19](#msg5d1362d6d92cb54b297ab98b)@GiuseppeChillemi Such is room is certainly not on Red's Gitter. I'm not sure where VSCode discussions are taking place, sorry.

GiuseppeChillemi

[12:34](#msg5d13665438c2bf757dbd59e3)@rebolek Just a question before leaving: if main RED site talks about the Extension, you see "Full Stack Technology" signature on it, you open the config file from the inside of the extension and you have just seen people talking about a potential VSCode extension problem here. Don't you think that anyone would do the same ?  
Ok, Now I can move.

rebolek

[12:37](#msg5d13670111ba925f6a2992eb)@GiuseppeChillemi There may (and probably are) bugs in Red VSC extension. It's certainly right place to discuss them here. However how should be path with spaces properly escaped on Windows version VSC using PowerShell is different problem.

[12:39](#msg5d1367966e07c204706546a8)If I copy Red to directory with spaces on Linux and then not properly escape them, so I can't run Red exe, is it Red problem? I believe it itsn't.

```
[~] mkdir dir\ with\ spaces
[~] cp /usr/local/bin/red dir\ with\ spaces
[~] dir with spaces/red
dir: cannot access 'with': No such file or directory
dir: cannot access 'spaces/red': No such file or directory
```

bitbegin

[12:42](#msg5d136824501ea60f124ac5ae)i will have some time to fix it

GiuseppeChillemi

[12:49](#msg5d1369cee6ae0b757c66b9d4)@rebolek We are discussing about mind mechanism here and I should answer with another question: I have associated the config file under direct control of the extension. Why it happened ?  
(Why don't we continue to chit-chat , I have pleasure to introduce some psychological topics that could be really interesting !)

rebolek

[12:49](#msg5d1369f2f040bc5fb6ca8a46)Let's move there, we are off-topic, right.

GiuseppeChillemi

[13:13](#msg5d136f6fd65dae046f912b50)@bitbegin thanks, I have opened an issue here: https://github.com/red/VScode-extension/issues/35

## Thursday 27th June, 2019

endo64

[11:46](#msg5d14aca3850b87037c6d18be)@rebolek @hiiamboris  
I raised an issue #3927 as for the discussion here https://gitter.im/red/parse?at=5d1485adf040bc5fb6d4750e

rebolek

[12:06](#msg5d14b137501ea60f1256891a)@endo64 thanks

## Thursday 11st July, 2019

abdllhygt

[21:17](#msg5d27a7644d750532412be768)hey

[21:17](#msg5d27a776e190903936cb59e8)

```
Red
>> "i" = "ı"
== true
>> "o" = "ö"
== false
```

is it a bug?

greggirwin

[22:07](#msg5d27b30ed14e297762b5ac56)@PeterWAWood is our unicode comparison expert, but maybe someone else can chime in with information. Or search for the subject in general, on the net, and post your findings.

abdllhygt

[22:41](#msg5d27bb0f096dec3f0197cd95)maybe it's about Turkish;  
Turkish `i` `İ`,`ı` `I`  
English `i` `I`

## Friday 12nd July, 2019

PeterWAWood

[00:22](#msg5d27d2bc096dec3f01986884)@abdllhygt Red's Unicode support does yet not include locale processing so cannot correctly compare the Turkish i characters.. At the moment, Red's unicode support is basic. I wrote a paper on Unicode support. It was in the wiki but it seems to have been removed. It explained the major features needed for proper Unicode support (rather than support of Unicode-encoded text). There was the intent to either include better Unicode support in Red or in a standard module. That was a few years back and I'm not sure if Unicode support is still planned.

[01:34](#msg5d27e38e570ac36f8d0b3152)I found the wiki page - https://github.com/red/red/wiki/%5BPROP%5D-Unicode-Issues-with-Proposed-Resolutions

It was written well before @dockimbel requested the Red Enhancement Process. Ideally somebody would convert it to a Red Enhancement Proposal (REP).

[01:35](#msg5d27e3f8e190903936cce2ba)The "Unicode Out-of-the-Box Tests" are no longer actively maintained. If somebody does convert the wiki page to a REP, it would probably be best to remove the reference to them.

[01:39](#msg5d27e4d8d14e297762b6f4ce)As the paper is more than 5 years old, it really should be reviewed against changes in the Unicode standards themselves.

abdllhygt

[11:04](#msg5d28694cf4fe943971f48312)@PeterWAWood thank you

endo64

[14:23](#msg5d2897d6570ac36f8d101780)

```
>> uppercase "ı"
== "I"
>> uppercase "i"
== "I"
>> uppercase "o"
== "O"
>> uppercase "ö"
== "Ö"
```

greggirwin

[17:21](#msg5d28c1b34d750532413388d4)Thanks Peter!

## Saturday 13th July, 2019

toomasv

[11:33](#msg5d29c17c202bb93f00967176)`on-wheel` actor's event info has changed. `event/picked` returns float now instead of integer, which may be intended change. But also, `event/ctrl?` returns `true` on wheeling down without ctrl pressed, and `false` while wheeling up. When ctrl is pressed, returned value for `event/picked` is 2236963.133333333 while wheeling up:

Without ctrl:

```
view [base on-wheel [print [event/ctrl? event/picked]]]
true -1.0   ;down
false 1.0   ;up
```

With ctrl:

```
true -1.0    ;down
true 2236963.133333333   ;up
```

Tried with latest build on W10. Does anyone confirm?

[11:43](#msg5d29c3feeab6cd77635ef8ed)Also, `on-over` actor returns `false` for `event/ctrl?` on `away` event, while ctrl is actually pressed:

```
>> view [base on-over [print [event/ctrl? event/away?]]]
false false  ;w/o ctrl, into
false true  ;w/o ctrl, away
true false  ;ctrl, into
false true  ;ctrl, away
```

[14:48](#msg5d29ef4c202bb93f0097be15)More:

```
view [base on-wheel [print [event/ctrl? event/shift? event/picked]]]
true true -1.0   ;w/o ctrl/shift, down
false false 1.0   ;w/o ctrl/shift, up
true true -1.0   ;ctrl, down
true false 2236963.133333333   ;ctrl, up
true true -1.0    ;shift, down
false true 4473925.266666667   ;shift, up
true true -1.0   ;ctrl/shift, down
true true 6710887.4   ;ctrl/shift, up
```

## Sunday 14th July, 2019

qtxie

[08:00](#msg5d2ae114096dec3f01ad6e7f)@toomasv A regression? Does it work before?

toomasv

[08:04](#msg5d2ae204e190903936e168e7)@qtxie Yes, here are results from May 21 build:

```
>> view [base on-wheel [print [event/ctrl? event/shift? event/picked]]]
false false -1   ;w/o ctrl/shift, down
false false 1   ;w/o ctrl/shift, up
true false -1  ;ctrl, down
true false 1  ;ctrl, up
false true -1   ;shift, down
false true 1   ;shift, up
true true -1   ;ctrl/shift, down
true true 1   ;ctrl/shift, up
>> about
Red 0.6.4 for Windows built 21-May-2019/3:23:06+03:00 commit #c80ba51
```

But `on-over` acted the same way as now.

## Tuesday 16th July, 2019

toomasv

[05:38](#msg5d2d62dd5fa7895c430c6410)@qtxie Thanks! Everything OK now.

qtxie

[13:19](#msg5d2dcee3d14e297762e04ac1)@toomasv You're welcome. :smile:

## Thursday 18th July, 2019

Softknobs

[21:00](#msg5d30dde7570ac36f8d4ad28c)Hi, I am compiling the same code for both Windows and MacOS and the #call statement is only working in the windows version. This looks like a bug to me but I might be wrong.  
I have created a gist with a simple example I can't get to work on MacOS: https://gist.github.com/Softknobs/0c3b2c144db014b12dcd84f73ec9d3fb  
Thanks

## Friday 19th July, 2019

dockimbel

[09:49](#msg5d3192438285d81daa20c656)@qtxie ^---

qtxie

[10:15](#msg5d3198485ea6e644ecdffc9f)@Softknobs Please use `-t Darwin` instead of `-t macOS` when you need to output to the terminal.

greggirwin

[15:58](#msg5d31e8c2c898801347284b12)Do we have that noted somewhere?

endo64

[21:10](#msg5d3231cfec5abe7bbc1379aa)It is on `red --help`

```
Cross-compilation targets:

    MSDOS        : Windows, x86, console (+ GUI) applications
    Windows      : Windows, x86, GUI applications
    ...
    Darwin       : macOS Intel, console or GUI applications
    macOS        : macOS Intel, GUI-only, applications bundles
```

[21:14](#msg5d3232ca437a3a13481e4ff7)Though it might be better to put a note "use console targets when you need to output to the terminal" on https://github.com/dockimbel/Red/blob/master/README.md file.

greggirwin

[22:32](#msg5d3244e58fe53b671da16490):+1:

## Saturday 20th July, 2019

Softknobs

[22:07](#msg5d33909fd1cceb1a8d92011d)@qtxie Thanks for pointing this out. However, this behaviour still looks like a bug or at least inconsistent. `print` works with `-t macOS`except in this particular case where red code is triggered with #call. This inconsitency made me think the #call was not working. Moreover, this is working with `-t Windows`. This makes it even more inconsistent as I don't have to use `-t MSDOS` have the `print` working on Windows with #call. Remember, `print` is amongst the few tools available to debug Red programs. I would have expected a "write once, run everywhere" behaviour when targeting equivalent platforms (ie Windows and macOS).

## Sunday 21st July, 2019

qtxie

[05:18](#msg5d33f59998514166873e88a4)@Softknobs If it works with `-t Windows`, then there is a bug on Windows. No terminal will be showed if you use `-t Windows`, so you cannot see the output of print. Unless you include a gui-console in your app.

Softknobs

[14:37](#msg5d3478b7437a3a13482d8251)@qtxie I can't seem to reproduce the behaviour on Windows, maybe I messed up at some point and used the default MSDOS behaviour. Running a GUI macOS application from inside the app bundle shows a terminal window even if it's a GUI only application. Messages written to the console are written there for application done in other languages (ex: Java). This is handy for debugging and it can be misleading when not all `print`commands are shown. That's just my opinion.

[14:58](#msg5d347d9635e05c0993771b18)@qtxie Still, the `print` behaviour is not the real problem I had with my GUI application. I got misleaded because nothing was happening with my #call: print showed nothing (explained above) and UI "area" was not updated. With the `-t Darwin` I could pinpoint the problem in my program. I don't know if it is a bug or an intended behaviour: my application receives data from an external library through a callback. The data is then sent from R/S to Red and put in an `area` view field. In this particular case only, the `area` content is not updated until I hover it with the mouse. Note that there are no actions done with the UI to update the `area` data, everything is triggered internally with a callback.

qtxie

[18:41](#msg5d34b1cbb2db751daba5059b)@Softknobs Did you set the `area` field in R/S? If so, you need to refresh the area manually.

## Monday 22nd July, 2019

Softknobs

[20:40](#msg5d361f4cd1cceb1a8da395f0)@qtxie I can't acces the field in R/S, however some R/S code (callback) triggers Red code to update the area. How do I refresh the area manually, I can't see this possibility in the area documentation

qtxie

[21:18](#msg5d36280c1dc6332966f70a24)@Softknobs Try `show area-face`.

## Tuesday 23th July, 2019

endo64

[11:37](#msg5d36f17f808425671cd33988)When I close a modal windows, the main window lost the focus:  
`view [button "Open Modal" 200 [view/flags [button 200 "Close Modal" [unview]] [modal] ] ]`  
Can someone test &amp; confirm please? I tested on Win10 x64, `Red 0.6.4 for Windows built 16-Jul-2019/18:28:15+03:00 commit #66ba8c8`

toomasv

[11:47](#msg5d36f3cfd6188741642256be)@endo64 Confirmed, on closing the modal, main window is lost beind other windows. My build is from July 15th.

endo64

[13:12](#msg5d3707bcbe916e76e221cd31)Thanks @toomasv  
@qtxie Worth a ticket?

toomasv

[13:20](#msg5d370996d1cceb1a8da9da14)@endo64 You are welcome! Work-around is to set focus explicitly, e.g.

```
view [button "Open Modal" 200 [view/flags [button 200 "Close Modal" [unview]] [modal]  set-focus face] ]
```

endo64

[13:45](#msg5d370f811dc6332966fd3cfb)Thanks @toomasv , interesting that was the first thing I tried but didn't work for me.

[13:50](#msg5d37109e8fe53b671dc227c7)Your workaround works, I think there was another problem on my test. But it wasn't like this before, right?

qtxie

[13:54](#msg5d37118e8fe53b671dc231b7)@endo64 Yes, please open a ticket.

toomasv

[14:03](#msg5d3713ae5ea6e644ec063d18)@endo64 Yes, I tried with build from May 21st, and there was no such problem.

endo64

[14:14](#msg5d371631a0351b1a8c842c02)@toomasv @qtxie Thanks, issue raised, https://github.com/red/red/issues/3942

qtxie

[14:22](#msg5d371820be916e76e2224b20)@endo64 Thanks! :ok\_hand:

## Saturday 27th July, 2019

hiiamboris

[11:11](#msg5d3c316c8aab922429ccc272)Hi! I notice that simple macros do not work anymore:

```
Red []
#macro [path!] function [s e] [print ["ATE" s/1] []]
invalid/path
```

Gives me (with --cli option):  
`*** Script Error: invalid has no value`  
Instead of:  
`ATE invalid/path`

[11:12](#msg5d3c3195071bb025dffcc904)Was there some change in macro system or do you think this has been broken by the parse modifications?

[11:12](#msg5d3c31ac071bb025dffcca13)Red 0.6.4 for Windows built 23-Jul-2019/22:51:39+03:00 commit #613d71c

greggirwin

[13:45](#msg5d3c557a2136933a87fe0eac)Seems OK here.

```
Compiling D:\Red\temp\bad-macro.red ...
...using libRedRT built on 27-Jul-2019/13:40:20
ATE invalid/path
...compilation time : 17 ms

Target: MSDOS
```

Same for release compile.

[13:48](#msg5d3c563f3e51d77b1b7a3d17)Just did a pull, and still OK.

## Sunday 28th July, 2019

hiiamboris

[12:08](#msg5d3d904b84536e27e0624cc4)no, don't compile, just run the script, or \*do* it

[12:09](#msg5d3d9060f0ff3e2bba814186)same error on Red 0.6.4 for Windows built 27-Jul-2019/1:58:18+03:00 commit #6890912

abdllhygt

[13:11](#msg5d3d9f1a840e2871805eb457)

```
>> a: [adjective: false]
== [adjective: false]
>> a/adjective
== false
>> if a/adjective [print 1]
1
```

[13:12](#msg5d3d9f33d254cf27df92ebfe)is this a bug?

nedzadarek

[13:16](#msg5d3da02decf3bf7b1a50aa39)@abdllhygt no, because `false` is a `word!` not a `logic!` (`true`/`false`) value.

```
a: compose [adjective: (false)] ; == [adjective: false]
if a/adjective [print 1] ; == none
```

abdllhygt

[13:19](#msg5d3da0e9bdfdb22bbb5d0ec5)@nedzadarek thank you again

endo64

[13:40](#msg5d3da5dba9200c242811a817)@abdllhygt Or you can use the literal form of the logic values:

```
>> b: [x: #[false]]
== [x: false]
>> type? b/x
== logic!
```

abdllhygt

[13:43](#msg5d3da68b7e00fc4ace64435c)@endo64 thanks

greggirwin

[17:06](#msg5d3dd60c840e287180603246)@hiiamboris I did that first, but get the same result with console going back a year, so I don't think anything has changed. Do you have a specific build that shows the behavior you expect?

hiiamboris

[18:32](#msg5d3dea42c356af25e044c75e)@greggirwin yes, builds from June 1st and earlier are OK

[18:35](#msg5d3deadc8aab922429d89e09)(I don't have any builds between June 1st and July 23)

[18:38](#msg5d3debadce271b4acd227668)@nedzadarek you're on W8 too, right? can you test :point\_up: \[July 27, 2019 2:11 PM](https://gitter.im/red/bugs?at=5d3c316c8aab922429ccc272) ?

greggirwin

[18:40](#msg5d3dec0df0ff3e2bba83b489)I'm on Win10.

nedzadarek

[18:41](#msg5d3dec73b2f4075cb81ab871)@hiiamboris I'm on win 8.1 but let me check download/compile the newer Red.

greggirwin

[18:43](#msg5d3decc23e51d77b1b85139d)Ah, I was pasting into old consoles, duh. Duped here now.

hiiamboris

[18:44](#msg5d3ded04bdfdb22bbb5f1ab4)Ok, I'll report it

greggirwin

[18:48](#msg5d3dedf6f0ff3e2bba83c148)OK for me through 01-Jul, but fails on 22-Jul build.

hiiamboris

[18:54](#msg5d3def56bdfdb22bbb5f2a3c)Thanks. Reported it https://github.com/red/red/issues/3951

nedzadarek

[19:11](#msg5d3df3733e51d77b1b853aab)@hiiamboris seems fine:

```
Compiling libRedRT...
...compilation time : 8110 ms

Compiling to native code...
...compilation time : 209145 ms
...linking time     : 5183 ms
...output file size : 1089536 bytes
...output file      : Path\to\Desktop\mmacro\libRedRT.dll

ATE invalid/path
...compilation time : 306 ms

Target: MSDOS

Compiling to native code...
...compilation time : 8731 ms
...linking time     : 329 ms
...output file size : 75264 bytes
...output file      : Path\to\Desktop\mmacro\macro.exe
```

`Red 0.6.4 for Windows built 27-Jul-2019/0:58:18+02:00 commit #6890912`

hiiamboris

[19:12](#msg5d3df3adbdfdb22bbb5f4af6)it compiles fine for me too

[19:13](#msg5d3df3be840e28718061016c)8731 ms - that's some incredible CPU :)

nedzadarek

[19:13](#msg5d3df3c6d254cf27df954aa5)@hiiamboris was I suppose to run with `-c`?

hiiamboris

[19:13](#msg5d3df3dbf0ff3e2bba83e98a)@nedzadarek no, just `red --cli script.red`

nedzadarek

[19:17](#msg5d3df4c17e00fc4ace66643f)@hiiamboris low end laptop... but it seems run some basic things too slow - I wonder why.

```
*** Script Error: invalid has no value
*** Where: catch
*** Stack:
```

then I can confirm

hiiamboris

[19:19](#msg5d3df52fbdfdb22bbb5f5648)@nedzadarek thanks

nedzadarek

[19:19](#msg5d3df54c3e51d77b1b8549c9):+1:

## Monday 29th July, 2019

ralfwenske

[05:04](#msg5d3e7e50f0ff3e2bba87ac27)On OSX the following makes the progessbar jump to 100% at the end of the repeat loop:

```
Red [needs: view]
r-src: make reactor! [num: 0]
process: func [][
    repeat i 100 [
        wait 0.1
        r-src/num: to-percent ((to-float i) / 100)
 ;       loop 3 [do-events/no-wait]
        print r-src/num
    ]
]
view [size 200x200
    below
    progress 100x20 20% react [face/data: s/data]
    s: slider 100x20 20%
    progress 100x20 20% react [face/data: r-src/num]
    button "start process" [process]
]
```

It works when uncommenting the loop statement

[05:15](#msg5d3e810f7e00fc4ace6a1ca7)As @rcqls pointed out: `loop 3` is not necessary

## Tuesday 30th July, 2019

toomasv

[07:32](#msg5d3ff278c356af25e0537dd4)On recent builds `event/ctrl?` and `event/shift?` are not set on `down` event (neither on `alt-down` and `mid-down`). Neither are `ctrl` and `shift` set in `event/flags`. They were still set in May 21 build (I don't have more recent builds to check). Regression? (W10)

hiiamboris

[08:12](#msg5d3ffbd6840e2871806f7988)I disagree with @bitbegin closing #2503 and #3336. Please reopen these.

bitbegin

[08:14](#msg5d3ffc51ecf3bf7b1a619931)\[!\[image.png](https://files.gitter.im/red/bugs/Wwxg/thumb/image.png)](https://files.gitter.im/red/bugs/Wwxg/image.png)

[08:14](#msg5d3ffc65ecf3bf7b1a6199d2)\[!\[image.png](https://files.gitter.im/red/bugs/91yV/thumb/image.png)](https://files.gitter.im/red/bugs/91yV/image.png)

hiiamboris

[08:16](#msg5d3ffcc5840e2871806f8139)Oh come on man, read the description and comments :) By closing an issue you do not solve it.

Softknobs

[20:17](#msg5d40a5e2ce271b4acd3629fa)I have this problem that looks like a bug in the following script:  
https://gist.github.com/Softknobs/7b4c48fc16705e5dad2d2c6e297465ff  
Depending on how the script is run, the first "obj1/inputs/1/open" is not run and thus the message "Open" is not printed nor the file written to disk.  
\- do &lt;script name&gt; will print "Open" once and then everytime the button "open" is clicked  
\- running the script from the console does the same  
\- compiling the script with -c un running the executable does not show the first "Open" message. Only when the button "Open" is clicked.  
Am I missing something? Thanks.

greggirwin

[20:37](#msg5d40aaa03e05746cc894637c)@Softknobs see if you can find an existing ticket for this behavior. It has to do with the function being in a nested object. There are known issues there. A global function works, `o/oo/fn` does nothing it seems, and (I think this is the known issue) `o/fn` crashes.

You can work around this by compiling in encap mode (`-e`) or using `do [obj1/inputs/1/open]`.

[23:29](#msg5d40d2c0b0bf183ea36f4e3e)Can someone confirm @toomasv's :point\_up: \[July 30, 2019 1:32 AM](https://gitter.im/red/bugs?at=5d3ff278c356af25e0537dd4) note, and make sure @qtxie knows, creating a ticket if necessary.

[23:58](#msg5d40d99f3e05746cc895c66d)@Softknobs maybe https://github.com/red/red/issues/2975

## Wednesday 31st July, 2019

dander

[00:11](#msg5d40dcc7771bca3ea4da75a1)@greggirwin I see `shift?` and `control?` set for all arrow directions, but no events when I'm pressing `alt` (maybe a Windows thing?)

[00:12](#msg5d40dcd65367476cc980bc1c)using https://gitter.im/red/help?at=5b57253ff477e4664abba883

ralfwenske

[00:39](#msg5d40e352e2802b67909d52d6)@dander On OSX I see it under flags when it’s down: `flags: alt`and key shows eg .`d` or `∂`

toomasv

[03:16](#msg5d4107f9e2802b67909e55ec)This is what I get with any combination of `ctrl` and `shift` on pressing left button:

```
>> view [base on-down [print [event/ctrl? event/shift?]]]
false false   ;ctrl down
false false   ;shift down
false false   ;both down
>> about
Red 0.6.4 for Windows built 30-Jul-2019/9:19:01+03:00 commit #3f14bf4
```

ralfwenske

[03:20](#msg5d41091702abe16c6487ac7c)OSX:

```
>> view [base on-down [print [event/ctrl? event/shift?]]]
true false
false true
true true
```

toomasv

[03:23](#msg5d4109c35a72fc7ba4c9ce0f)Thanks, @ralfwenske, so it is W only, or may be W10 only, or may be me only...

greggirwin

[03:26](#msg5d410a565a72fc7ba4c9d114)I get the same results on Win10 @toomasv.

[03:26](#msg5d410a5f3e05746cc8971b42)Seems worth a ticket.

ralfwenske

[03:31](#msg5d410b917bcc41678f01c812)As @dander asked for arrow key I checked arrow down and all combinations show correctly:

```
view [base on-key [print [event/key event/ctrl? event/shift? event/flags]]]
down false false 
down true false control
down false true shift
down false false alt
down true true control shift
down false true shift alt
```

toomasv

[03:35](#msg5d410c7a771bca3ea4dbba59)https://github.com/red/red/issues/3955

[03:44](#msg5d410eb85a72fc7ba4c9eb8c)Right! Neither do any `on-key` events work.

ralfwenske

[04:14](#msg5d4115a920f75e7ba5583443)Pasting following into console:

```
Red []
#macro dynh: func [height][
    rejoin ["panel react [face/size: as-pair face/parent/size/x " height "  ]"]
]
print [ dynh 300 ]
```

results in:

```
>> Red []
== []
>> #macro dynh: func [height][
[        rejoin ["panel react [face/size: as-pair face/parent/size/x " height "  ]"]
[    ]
== func [height][rejoin [{panel react [face/size: as-pair face/parent/size/x } height "  ]"]]
>> print [ dynh 300 ]
panel react [face/size: as-pair face/parent/size/x 300  ]
>>
```

strangely when I `Run Current Script` in Visual Studio (OSX) I get

```
*** Script Error: dynh has no value
*** Where: print
*** Stack:
```

is this a bug?

[04:25](#msg5d411856b0bf183ea37129b7)In console:

```
>> do %test.red
panel react [face/size: as-pair face/parent/size/x 300  ]
>> about
Red 0.6.4 for macOS built 24-Jul-2019/5:51:39+10:00 commit #613d71c
```

in Visual Studio terminal:

```
>> do %test.red
*** Script Error: dynh has no value
*** Where: do
*** Stack: do-file  

>> about
Red 0.6.4 for macOS built 24-Jul-2019/5:51:39+10:00 commit #613d71c
```

Restarting VS makes no difference.  
Compiling in VS is possible and the executable works as expected.

[05:41](#msg5d4129ee9a02440b032d98b9)I read a bit more about the preprocessor and now think that it’s not a bug and more related to how the preprocessor is designed to work. I need to play with it more to gather better understanding...

greggirwin

[05:48](#msg5d412bc29a02440b032da58d)Macros can be tricky beasts, and should be a last resort IMO. What is the ultimate goal?

ralfwenske

[06:17](#msg5d41327d02abe16c6488b289)Nostalgie? :) Nearly 50 years ago I developed a high level language based on 370 Assembler macros which increased productivity in that department dramatically ….those were the days.  
I come to realise macros in Red are a bit different - and as Nenad pointed out we have so many other options.  
I am experimenting with generating views as the guinea pigs.

endo64

[07:23](#msg5d4141ea1dc3324670d8d669)Is there a regression?

```
d:\red.exe -e test.red
>> *** Access Error: cannot open: %-e
```

Same for `-s`, `-v`, `-d` but `-c`, `-r` works.

[07:24](#msg5d414224e2802b67909fe0e7)I'm on Win10.

9214

[08:34](#msg5d41529d5a72fc7ba4cbc848)@ralfwenske you don't need macros for that.

[08:57](#msg5d4157fa4ba6af0b026177eb)@endo64 these flags are supposed to be used either with `-c` or `-r`.

## Friday 9th August, 2019

nulldatamap

[07:42](#msg5d4d23d8029a51607f6116b7)Hey, I'm encountering an access violation on MacOS for the following code (I've reduced it as much as I could):

```
Red []

view [
	panel on-down [
		layout/parent compose [
			text "A: " text "B"
		] crash-box none
	]
    crash-box: group-box []
]
; *** Runtime Error 1: access violation
; *** at: A6C1CF13h
```

[07:44](#msg5d4d245bc87a0963e73bfc22)(Clicking on the panel results in the crash)

9214

[11:11](#msg5d4d54d990bba62a1245d17b)@nulldatamap can you please check it with \[latest build](https://static.red-lang.org/dl/auto/mac/red-latest)?

nulldatamap

[13:00](#msg5d4d6e815178a72476592aea)@9214 I get the exact same error on both master and the build you linked

9214

[13:10](#msg5d4d70c95178a72476593cd2):point\_up: can anyone else confirm that?

rcqls

[13:45](#msg5d4d78e81dadc42a113e1699)@9214 @nulldatamap Confirmed! (And not on Linux/GTK)

9214

[13:46](#msg5d4d793a9507182477aaedca)@rcqls thanks. In such case it warrants a ticket.

nulldatamap

[13:47](#msg5d4d7964d03a7c63e6f96752)@9214 I'll file one then

9214

[14:01](#msg5d4d7cbabfd2887f53bb453c)@nulldatamap good job!

dsunanda

[20:39](#msg5d4dd9edc87a0963e7416e14)REMOVE-EACH not consistent with REMOVE - or with R2's behavior. Bug, oversight, or careful design decision?

[20:39](#msg5d4dda0abeba830fff6499dd)

```
length?  remove-each str "ABC" [str = #"B"]
     R2:    == 2
     Red:   == Script Error: length? does not allow unset! for its series argument

; Compare that with FOR for consistency:
            length?  remove "ABC"
    R2&Red: == 2
```

meijeru

[20:44](#msg5d4ddb2e53490e334dc3413a)This was noted and discussed already (see issues #2126 and #2366).

9214

[21:00](#msg5d4ddef9beba830fff64bab0)Some iterators return `unset` because a final design decision on their return values hasn't been made yet.

dsunanda

[21:27](#msg5d4de5327d56bc60802632f4)Thanks guys - I did look for it on Github, but obviously ineffectively. I'd support Gregg's comments on #2126 - the R2 way is more consistent, and allows operations to be chained.

I found the problem when trying to debug this error: "split does not allow unset! for its series argument. Where: split" in some R2 code I was trying to convert to Red.  
Given the code had around 50 PARSE/ALL converted to SPLIT, the offending line of code took a while to track down:

```
split remove-each str "A B C" [str = #"B"] " "
```

## Saturday 10th August, 2019

greggirwin

[01:38](#msg5d4e201d1db76d0ffea5f407)There's another option we could try as well. Return both the modified series \*and* the removed count. We do want to be careful about heading down that slippery slope, but then you only need to know how it behaves, and use it consistently with `set [series count] remove-each ...` if you need the results.

In the bigger scheme of things, that might affect the overall HOF design from a consistency standpoint.

[01:47](#msg5d4e22211db76d0ffea6007a)The series itself is the much more useful value, if we pick just one. For those who really need the functionality I just posted, it's a simple mezz.

```
remove-each-and-count: function [
	"Like remove-each, but returns both modified series and count of removed items." 
    'word [word! block!] "Word or block of words to set each time" 
    data [series!] "The series to traverse (modified)" 
    body [block!] "Block to evaluate (return TRUE to remove)"
][
	orig-ct: length? data
	remove-each :word data body
	reduce [data  orig-ct - length? data]
]
remove-each-and-count v [1 2 3 4 5] [odd? v]
remove-each-and-count v [1 2 3 4 5 6 7 8 9 10] [odd? v]
```

[01:50](#msg5d4e22db53490e334dc52136)Comments added to ticket.

[01:52](#msg5d4e2379029a51607f686d6c)It's always a balancing act, between \*potentially* useful things, and \*commonly* useful things, weighed against adding too much stuff, making everything harder to use correctly. Include enough rich functionality that you don't \*need* a lot of external bits, as with JS, but not so many that the built-in features are overwhelming and confusing.

## Thursday 15th August, 2019

planetsizecpu

[18:04](#msg5d559eab4e17537f523971db)Hi folks, last days I found the Red console to crash if `break` is evaluated on `foreach-face` loop as :

`l: layout [a: area 100x100 red b: box 100x100 green c: field 100x100 blue] foreach-face l [if face/size/x = 100 [break]]`

Did it deserve a ticket?

greggirwin

[18:09](#msg5d559fe3bfd2887f53f46427)@planetsizecpu duped here on Win10. Yes, please file a ticket.

planetsizecpu

[18:11](#msg5d55a06d5178a72476933958)@greggirwin Ok thx!

## Friday 16th August, 2019

endo64

[12:54](#msg5d56a7a3bfd2887f53fbea98)I remember I already provided a solution to this issue (using `throw`) but Doc said we need a proper function attributes.

## Sunday 18th August, 2019

hiiamboris

[21:03](#msg5d59bd3e7d56bc60807c60dd)@dockimbel I believe https://github.com/red/red/issues/3805 deserves some more of your attention :)

## Tuesday 20th August, 2019

corona-nova

[03:48](#msg5d5b6d82d03a7c63e6610e95)red does not take into account \[sRGB](https://en.wikipedia.org/wiki/SRGB#The\_sRGB\_transfer\_function\_(%22gamma%22))'s nonlinearity @ \[libred-and-macros](https://www.red-lang.org/2017/03/062-libred-and-macros.html)

should i file an issue?, it affects color gradients and anti-aliasing and transparency,

it basically means that (1.0/2)≠0.5 when @ sRGB thus maths that don't compensate for that don't work as intended

[04:07](#msg5d5b71f64e17537f5266fcf3)\[!\[complex-pen.gif.1.png](https://files.gitter.im/red/bugs/1zKs/thumb/complex-pen.gif.1.png)](https://files.gitter.im/red/bugs/1zKs/complex-pen.gif.1.png)

[04:09](#msg5d5b7276bfd2887f53226f45)above: math done in gamma-space (not compensating for gamma)  
below: mockup interpreting as linear RGB and changing it to sRGB

[04:09](#msg5d5b727dbeba830fffc967e6)\[!\[0001.png](https://files.gitter.im/red/bugs/RU7o/thumb/0001.png)](https://files.gitter.im/red/bugs/RU7o/0001.png)  
gamma-corrected (done in linear space)

[04:10](#msg5d5b72bd1db76d0ffe089bb7)notice that lines at diagonal points are darker if  
it does not compensate for this

[04:10](#msg5d5b72cfd03a7c63e6613567)\[!\[complex-pen.gif.4.png](https://files.gitter.im/red/bugs/avlo/thumb/complex-pen.gif.4.png)](https://files.gitter.im/red/bugs/avlo/complex-pen.gif.4.png)

[04:12](#msg5d5b734ad03a7c63e66139cb)color gradients look bad if not dealt with;  
is this easy to implement, is the slight slowdown too much,  
it affects aesthetics, should this \[option] be default

affects image up/down-scaling, text-rendering also

[04:13](#msg5d5b735290bba62a12899b36)\[!\[0004.png](https://files.gitter.im/red/bugs/5uv9/thumb/0004.png)](https://files.gitter.im/red/bugs/5uv9/0004.png)  
color gradients looks more natural esp the yellows here

[04:16](#msg5d5b74064e17537f52670cc9)those are only mockups, when implemented, it should apply inverse also on the other side of whatever math operation to keep color-endpoints the same

greggirwin

[05:32](#msg5d5b8604d03a7c63e661c145)@qtxie :point\_up:

loziniak

[11:25](#msg5d5bd89c53490e334d2ba95c)`copy/part` built-in docs state that `pair!` argument is possible. but I get error when using pair!:

```
>> copy/part "abcdef" 2x4
*** Script Error: invalid /part argument: 2x4
*** Where: copy
*** Stack:
```

9214

[13:36](#msg5d5bf76fbfd2887f5326c8d1)@loziniak this applies to `image!` values only.

loziniak

[15:08](#msg5d5c0d027d56bc60808f6672)Not a word about it in documentation...

greggirwin

[16:33](#msg5d5c20cf7e160727e07b7c4b)@gltewalt :point\_up:. Though, as will be the case with many things, because documentation is hard, especially as things change, people need to apply some common sense when things don't work as they expect. This is a general rule that we need to encourage, while bodies of knowledge develop over time, for details like this.

In the grand scheme, the question is whether we can and should lock everything down in these early releases. If we leave things open a bit, as we have to with doc strings, it gives us room to change things. That is, if it isn't written down as a final behavior for the language somewhere, it could change. Being up front about that is no different than for any other language.

qtxie

[17:14](#msg5d5c2a71c8a85a44c234f9a9)@corona-nova You mean the color of the gradient is not correct? Does the web browser draw it correctly? Red just uses the OS API to draw the gradients, I don't think it's easy to change it. You can open an issue on github with the code to reproduce it.

loziniak

[20:03](#msg5d5c5225fa99e74f6a61cfaa)@greggirwin It reminds me a little a programming environment of Windows, with lots of undocumented behaviors, which, when used by developers, locks a language in some way anyway. Not to mention the problems it brings to projects like Wine, where people struggle to mimic these behaviors by trial and error to make software work on their platform.

[20:07](#msg5d5c5303c508da44c3521425)Changing doc strings along the code is not that hard I think. And even when some missing behavior is left in docs, this situation is not worse than being confused by undocumented quirks. What changes is just a source of confusion :-)

9214

[20:44](#msg5d5c5bb77e160727e07d0f36)@loziniak Red's design is based on highly polymorphic functions, in which number of all possible argument combinations is fairly large (not to mention that concrete datatypes are abstracted away by typesets); so, documenting each of them case-by-case in docstrings is a flawed approach, which narrows our design space and pollutes function's spec. I second @greggirwin's response WRT common sense - it's rather easy to apply, since language is built on top of orthogonal features, which work consistently across the board.

You can help @gltewalt by extending \[`image!`](https://doc.red-lang.org/en/datatypes/image.html) documentation with missing details, although I'm not sure if it's is the best place to keep such info.

loziniak

[22:27](#msg5d5c73c979229b63d990f429)@9214 thanks, I thought about it. The fact that `image!` is a series and can be manipulated by series functions by using `pair!`s is worth documenting. It's not so obvious and can generate questions like \*is 2x1 before 1x2 in image series?\*. I thought `pair!` can be used to denote start and end indexes of `copy/part` done on `string!` or `block!`, perhaps I'm not the only one.

greggirwin

[23:55](#msg5d5c8864b059db27dfb0e782)And this is where an example is worth a thousand words.

## Wednesday 21st August, 2019

nulldatamap

[13:06](#msg5d5d41f08e8dde63d811028c)Looks like there's a buffer overflow bug in at least `decompress/zlib`:

```
>> decompress/zlib #{78DA636060F8CFC4C0CA08C40C8C0CFC0C409A8551351044B302311323C35A109B1988D918557C1918D597310000597203BB} 52 ; Correct size
== #{
000000FF020005010200050001000F0002000504012551000200050502000502
0100AD00020005030200050601244D000127A600
}
>> decompress/zlib #{78DA636060F8CFC4C0CA08C40C8C0CFC0C409A8551351044B302311323C35A109B1988D918557C1918D597310000597203BB} 128 ; Bigger size
== #{
000000FF020005010200050001000F0002000504012551000200050502000502
0100AD00020005030200050601244D000127A600
}
>> decompress/zlib #{78DA636060F8CFC4C0CA08C40C8C0CFC0C409A8551351044B302311323C35A109B1988D918557C1918D597310000597203BB} 4 ; Too small size
== #{
000000FF020005010200050001000F00010000200000000010000000ACDFD801
BCDFD801237B0A30303030303046463032303030
} ; Notice initial data is correct, but the rest is garbage
```

[13:07](#msg5d5d422279229b63d9962a8f)With `red-09aug19-8a9920e6` on MacOS X

9214

[13:08](#msg5d5d42585ba4a84f6965bc1c)\[`decompress` native](https://github.com/red/red/blob/master/runtime/natives.reds#L2621) and \[`zlib-uncompress` implementation](https://github.com/red/red/blob/master/runtime/inflate.reds#L762), for the reference.

nulldatamap

[13:13](#msg5d5d4386b059db27dfb5c7cc)Same behavior on `master (ccfff52)`

qtxie

[17:53](#msg5d5d8514c508da44c359eb89)@nulldatamap IIRC. You need to provide the exact size of the uncompressed data when use the /zlib refinement.

9214

[18:06](#msg5d5d8816c8a85a44c23e4194)@qtxie which is at times not trivial at all, and requires passing of size together with compressed `binary!` data. I haven't found any ways to approximate or infer uncompressed data size from input itself (only compression level in zlib magic header).

greggirwin

[18:08](#msg5d5d88ad8e8dde63d812fc8e)If it has to be exact, and can cause a buffer overflow, that's a problem. The wrapper should either ensure no buffer overflow occurs, based on `dst` size, or this feature should not be available for general use.

9214

[18:10](#msg5d5d890a79229b63d9982632)@greggirwin agreed, current interface goes against the grain of Red's user-friendliness.

greggirwin

[18:11](#msg5d5d895979229b63d9982775)@9214 if we trigger an error rather than overflowing, it should work with your multishot suggestion from red/welcome.

[18:12](#msg5d5d89a08e8dde63d81302e8)From what @nulldatamap says they're doing, it sounds like this feature is genuinely needed in some cases. And having a PDF parser will be \*very* cool. We might even be able to sponsor some of that work.

9214

[18:13](#msg5d5d89cc86c1a96ad50f6378)@greggirwin yes, but that's not an optimal solution. Perhaps we can pre-allocate sufficiently large (but how much is enough, exactly?) buffer for decompression, but yet again it's a memory penalty.

greggirwin

[18:13](#msg5d5d89e1b059db27dfb7d6ba)The trouble with not knowing is... ;^\\

[18:14](#msg5d5d89fb5ba4a84f6967c36b)That is, if there are unknowns, it can't be optimal. ;^)

9214

[18:15](#msg5d5d8a3a2cdb146ad613afdd)OTOH, I'm pretty sure PDF should embed metainfo about compressed stream size, or chunk data into fixed-size blocks.

greggirwin

[18:15](#msg5d5d8a59d45f7c26fa0d84a6)You would think. Because \*they* want it to be optimal too.

qtxie

[20:40](#msg5d5dac2786c1a96ad51055f2)I'm not familiar with the code, but it should be not difficult to add some checking code and throw an error. It's not intended to be used alone. That is, the compressed data usually come from some well-defined data. PNG, PDF, for example. In that case, you know the size of the uncompressed data.

greggirwin

[23:18](#msg5d5dd13a8e8dde63d814f87e)@nulldatamap is the uncompressed size stored in the PDF?

## Thursday 22nd August, 2019

nulldatamap

[07:35](#msg5d5e45cf86c1a96ad5144aef)@greggirwin It is not, it's not mandated by spec, and there isn't a field for specifying it defined in the spec (PDF 1.7, 7.4.4.3: https://www.adobe.com/content/dam/acom/en/devnet/pdf/pdfs/PDF32000\_2008.pdf#G6.1709041), so no

[07:43](#msg5d5e47be67969726f942faae)Looking at PDFs in the wild I can't find any uncompressed size hints either

[07:55](#msg5d5e4a692cdb146ad618c3fd)Here's a compressed object stream from a PDF generated by pdflatex for example:

[07:55](#msg5d5e4a87c508da44c35f0c4d)

```
5 0 obj
<<
/Type /ObjStm
/N 7
/First 40
/Length 489       
/Filter /FlateDecode
>>
stream
... 489 bytes of compressed data ...
endstream
endobj
```

[08:00](#msg5d5e4baf25764a3642db5ee0)`/Length` is the compressed length

qtxie

[11:45](#msg5d5e80645ba4a84f696e5e4c)@nulldatamap Do you know why the PDF generator use zlib format instead of gzip format which contains data's original size? They both use deflate algorithm, just that more meta info in the gzip format.

nulldatamap

[14:20](#msg5d5ea4ac67969726f94581ca)@qtxie I don't know why the spec doesn't use gzip, but it only supplies the `FlateDecode` filter which is zlib/deflate but no gzip alternative

## Sunday 25th August, 2019

Oldes

[19:23](#msg5d62e03e07d1ff39f8813788)I guess that the reason is that it was designed for streaming where the size of all uncompressed data is not important.

rgchris

[22:05](#msg5d63062af2821072aa1351fc)Red seems to want to output `"^[[6n"` on every session—is this a bug? I have a Red script:

```
Red [] prin <hello>
```

When I call it from Rebol, I get the following:

```
>> call/wait/output "red script.red" out: ""
>> probe out
== "^[[6n<hello>"
```

[22:05](#msg5d630645e403470ab6d735a2)

```
lisp
>> about
Red 0.6.4 for macOS built 25-Aug-2019/16:43:49-04:00 commit #a87243c
```

## Monday 26th August, 2019

Oldes

[09:44](#msg5d63a9e0c8228962acc7fde4)`^[[6n` means in `VT100` terminal `Get cursor position`. I don't know, why it is there. @rgchris, is it in CLI or GUI console or both? If only in GUI, I would say it is a bug.

[09:47](#msg5d63aabf07d1ff39f886768d)I was asking for better ANSI escape sequences support years ago :) Function for removing these from string would be one of them.

rgchris

[13:16](#msg5d63db9249ac051923b415b4)@Oldes I don't generally use consoles, have never used the GUI console. I usually run as shell scripts.

greggirwin

[21:56](#msg5d6455759b381b084ffd03a2)@bitbegin @qtxie ? :point\_up:

## Tuesday 27th August, 2019

bitbegin

[03:16](#msg5d64a0a9a080d70ab589a65e)I can reproduce it

greggirwin

[03:57](#msg5d64aa1449ac051923b9df74)Great! Thanks @bitbegin.

qtxie

[04:16](#msg5d64ae88022dba538e695200)It's an old issue on non-windows system. I remember there is a ticket about it.

greggirwin

[05:51](#msg5d64c4f368406739f98da6d1)So is it a bug or a design issue to review?

qtxie

[06:48](#msg5d64d234e403470ab6e39ef9)It's a bug. https://github.com/red/red/issues/1186

bitbegin

[06:57](#msg5d64d4603c1aba311bdb7889)https://github.com/red/red/pull/4009

## Sunday 1st September, 2019

GiuseppeChillemi

[06:00](#msg5d6b5e8e7b263a4c9c8e6a55)I have issue the following command in the console:

`probe read http://www.repubblica.it`

After its output the consolle starts running very slowly. Try typing some characters and you will discover what I say. It happens always.

[06:23](#msg5d6b63d97b263a4c9c8e8cac)\*issued

Softknobs

[09:10](#msg5d6b8b077b263a4c9c8f9586)Hi, is this a bug? When I embed #system code in a Red function I get compilation error on non declared values (here cpt):

```
Red []

red-fun: function [][
	#system [		

		f: function [][		
			print-line "doing something"
		]		
		cpt: 0		
		f
	]
]
```

I get the error:

```
*** Compilation Error: variable cpt not declared
*** in file: %/C/ProgramData/Red/test-guard.red
*** in function: exec/f_red-fun
```

The same code works outside the red-fun function.

9214

[10:20](#msg5d6b9b73d3fda15e74475149)@Softknobs that's expected IIRC, `#system` should be declared at top level. Use `routine!`s instead.

Softknobs

[10:41](#msg5d6ba056b156cd5e75be6e6b)@9214 Thanks. If that is the case, in my opinion, the compiler should tell that #system is used incorrectly. Because if I remove the cpt declaration, the code compiles and works if I run red-fun function. This kind of "partial support" is misleading.

dockimbel

[14:14](#msg5d6bd262b596011df4e3d26c)@Softknobs You can embed `#system` directive deep in code, but you need to understand what you are doing exactly. In this case, you are inlining a R/S function into another R/S function (Red compiles Red functions down to R/S functions). Your code is then equivalent to:

```
Red/System []

red-fun: function [][       
	f: function [][        
		print-line "doing something"
	]        
	cpt: 0        
	f
]
```

So, the compiler complaining about `cpt` not being declared is legit. Moreover, the R/S compiler will let you declare and run the nested function, though it is not an officially supported feature, so we might deprecate it for 1.0.

If you move the `f` function and `cpt`variable declarations out of the `red-fun`, into a root `#system` directive, then your inner `#system` code will compile and work fine.

Softknobs

[14:45](#msg5d6bd9a00d4b1f5d889853fa)I didn't realise the #system was converted to a function... Given that, adding one level of nesting solves (well, not in a elegant way) the problem:

```
Red []

red-fun: function [][
    #system [        

		f1: function [/local cpt][
			f: function [][        
				print-line "doing something"			
			]        
			cpt: 0        
			f
		]
		
		f1
    ]
]

red-fun
```

To be honest, doing this code was not my initial intent: I was trying to reproduce another problem moving different code parts (with more Red code around it) in my script in order to reproduce another problem. I stumbled upon this peculiarity and thought it was worth mentionning it here... Thank you Nenad for taking the time to explain the behaviour.

greggirwin

[18:12](#msg5d6c0a0b7b263a4c9c931828)@Softknobs would you be so kind as to extract those few messages, including Nenad's and your solution, and add them to https://github.com/red/red/wiki/%5BNOTES%5D-Red-System-Notes? Thanks!

dockimbel

[20:59](#msg5d6c3144b4d8294074b47267)@Softknobs  
&gt; I didn't realise the #system was converted to a function...

That is not what I said. I said: `In this case, you are inlining a R/S function into another R/S function (Red compiles Red functions down to R/S functions).`

`#system` directive simply inlines its argument block at the current position of the output of Red compiler (which is R/S code). The block you are passing contains a R/S function declaration, so that declaration will be inlined there (see my equivalent R/S code above).

[21:03](#msg5d6c322dfda04e4c9d570f17)The proper way to write that code would be:

```
Red []

#system [
	f: function [][
		print-line "doing something"
	]
	cpt: 0
]
red-fun: function [][
    #system [f]
]
```

Softknobs

[22:35](#msg5d6c4799375cc34fdefad592)@greggirwin Added the discussion to the \[Red System Notes](https://github.com/red/red/wiki/%5BNOTES%5D-Red-System-Notes) wiki page  
@dockimbel My bad, thanks for the clarification and the example.

greggirwin

[23:20](#msg5d6c523e5c4d6813a5443dc5):+1:

## Monday 2nd September, 2019

Softknobs

[21:38](#msg5d6d8bdc8066a340733ba3e1)Hi, I am getting the following error:  
\*\** Runtime Error 21: guard page  
\*\** at: 0FAEBCFBh  
\[In this script](https://gist.github.com/Softknobs/7c738f01e8a01463c5acf9467524333b)  
Has anyone already experienced such error? I give the code as example but I don't know if the script is of any help since it requires external hardware to work.  
Basically it does the following:  
\* defines a R/S `midi-in-callback` function triggered by an external dll (the process starts when triggering hardware externally and sends around 500 messages sequentially)  
\* `midi-in-callback` transforms received data to string! and binary! then calls a red function `new-message`with `#call [new-message red-port-name red-message]`  
The problem then occurs in the `new-message` function after several calls of this to string conversion code:

```
string-message: copy ""
foreach byte message [append string-message form to-hex/size byte 2]
```

However, there is no crash if I replace the above code with:  
`append model/binary-midi-messages message`

What is weird is that the number of processed messages before crash is not the same depending on the operations done in `new-message`. This let's me think that I am reaching some kind of limit when processing serveral messages with this code. What is interesting though is I can process all the values if I store all the values and then apply the string conversion (ie after all calls, not at each call)  
This looks like a bug to me, anyway any workaround would be appreciated.  
Sorry if my description of the problem is not clear but what I am trying to achieve is not trivial either... Thanks.

## Tuesday 3th September, 2019

9214

[09:12](#msg5d6e2e98fda04e4c9d64f5f3)@Softknobs can you check your script with garbage collector turned off (put `recycle/off` at the very beginning)?

[09:14](#msg5d6e2f1029dba2421cf62b6f)To get more details, compile script in debug mode (`-r -d` flags). And, of course, make sure you check all of that with latest build.

dockimbel

[11:12](#msg5d6e4ab70d4b1f5d88a9890c)@Softknobs A stack trace would be helpful to identify the cause. @rebolek could you have a look at that code if you have time?

rebolek

[11:15](#msg5d6e4b39d3fda15e745a1b3a)@dockimbel @Softknobs no problem, will do. It looks very interesting!

Softknobs

[20:53](#msg5d6ed2baf41fa32b46e47680)@9214 Thanks for the hints.  
I tried `recycle/off`, same error.  
I also tried the 31.08.2019 build two days ago with a slightly different version of the script, and the error also occurred.  
With the `-r -d` I get this more detailed error:

```
root size: 3120, root max: 4638, cycles: 0

*** Runtime Error 21: guard page
*** in file: /C/ProgramData/Red/collector.reds
*** at line: 61
***
***   stack: red/collector/mark-stack-nodes
***   stack: win32-startup-ctx/exception-filter 050FF5A8h
```

@dockimbel Is the above text the stack trace you were talking about? I am used to Java stack traces so it looks small to me...  
@rebolek Thanks, it is nice to know you find it interesting :)

9214

[23:48](#msg5d6efbb01a16fc38873e8bb8)@Softknobs thanks! :+1:

## Wednesday 4th September, 2019

DVL333

[10:57](#msg5d6f9884de5cf1793b1ec230)Hi there!  
Is it a known bug? `to-image` or `to image!` doesn't convert the layout to the image:

```
lay: layout [button "Hi there!"]
to image! lay
```

Oldes

[11:11](#msg5d6f9be09237925978aef9f4)@DVL333 the face must be visible to be convertable to image. This works:

```
view/no-wait lay
img: to image! lay
unview lay
img ;== make image! [198x110 #{...
```

[11:13](#msg5d6f9c5b75940034a262b8b2)It's not a bug... with `layout` you create just the \_virtual structure\_, which is converted to native widgets when you \_view_ it. (if my english is understandable)

DVL333

[11:15](#msg5d6f9cd28ab9652541b6deb5)@Oldes Ok, i see, thanks.

Oldes

[11:15](#msg5d6f9ce6d72013254236bd69)You may want to place position of the window out of the user visible area to avoid being it visible for the short moment when it's being converted.

9214

[11:47](#msg5d6fa44ade5cf1793b1f268e)@Oldes IIRC there was/is a wish for taking screenshots of faces without rendering them, since R2 has that feature (if memory serves me well).

[11:48](#msg5d6fa47fb207005977134a14)Rendering them on the screen, that is.

Oldes

[12:53](#msg5d6fb3b2dc5bb2549de4f289)@9214 but R2 is not using native widgets.

9214

[13:00](#msg5d6fb55d133c545a5379f052)@Oldes indeed.

xqlab

[13:20](#msg5d6fba13d72013254237a348)You can set the field visible? of your lay object to false before viewing

Oldes

[15:04](#msg5d6fd273dc5bb2549de5ef15)@xqlab If you do so, you will not get the proper content as a result as invisible content is not rendered.

[15:07](#msg5d6fd335dc5bb2549de5f6de)Better is to do: `lay/offset: negate lay/size` when you want to view it just to make an image from it.

## Thursday 5th September, 2019

xqlab

[05:45](#msg5d70a0dfb9abfa4bd351629b)True, I did not check the rendered image

## Tuesday 17th September, 2019

rebolek

[11:04](#msg5d80bdc8ba12e064488759fe)I probably shouldn't see this error, when compiling pure Red (no R/S) code, right?

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
```

9214

[11:39](#msg5d80c60ea6f48964491e6b94)@rebolek looks like you found a missing `as red-value!` somewhere in runtime internals.

rebolek

[11:40](#msg5d80c644ba12e06448879b93)Yeah, somewhere...now to strip it down to a simple example :-)

GiuseppeChillemi

[18:06](#msg5d8120b305fd371695415bda)On Window SERVER 2008R2 if I load a text in a view AREA the thumbnail which which rapresent the windows content retains the old aspect with empty text. I have to iconify and reopen to have the aspect updated. Still not tried on other platforms.

greggirwin

[20:10](#msg5d813dacd3283306ba5c3221)Red can't control when Windows updates its thumbnail.

dockimbel

[20:49](#msg5d8146cbd5c523462f9e39fa)@rebolek That's an uncommon error, looks like an edge case in Red compiler, missing a type casting or passing a wrong argument. You can try to get some clue about which code part caused that by inserting a `probe skip pc -40` before \[this line](https://github.com/red/red/blob/master/system/compiler.r#L1468). Try backtracking further in the code is `-40` is not satisfying.

## Wednesday 18th September, 2019

rebolek

[05:50](#msg5d81c594c82c2e0d7ef54b0b)@dockimbel thanks, I'll try that

## Saturday 21st September, 2019

meijeru

[16:39](#msg5d865233b9f8210ed5c73c65)The following is not a bug \_per se\_, but shows the pitfalls of using `lit-word!` arguments. It is inspired by my naive use of @greggirwin 's `debug-obj` function that he just published in `red/red`.

```
>> f: function ['obj [word!]][
[    o: get obj
[    foreach w words-of o [probe o/:w]
[    ]
== func ['obj [word!] /local o w][o: get obj 
    foreach w words-of o [probe o/:w]
]
>> f object [a: 1]
*** Script Error: o has no refinement called :w
*** Where: o
*** Stack: f words-of probe
```

The error is to supply an \_expression_ as argument to `f` rather than a \_word\_. The function uses the first word (`object`) as argument, which is a function itself, not an object, hence the protest about a non-existing refinement. What to do to have a better error message? Probably insert `assert object? o` in the body.

9214

[16:44](#msg5d8653845d24375b3ef6c778)I would think of extending spec dialect, so as to allow specify word's binding information (e.g. `[word! (object!)]` or somesuch.

meijeru

[17:25](#msg5d865d0b5ab93616943216c4)It would not be too difficult to preprocess your syntactic proposal into assertions...

[17:26](#msg5d865d4304053c5b3d9a2564)On a related subject: this still gives an error while I thought it had been solved.

```
>> f: func ['w [integer!]][probe w]
== func ['w [integer!]][probe w]
>> f 1 + 2
1
*** Script Error: + operator is missing an argument
*** Where: catch
*** Stack:
```

[17:26](#msg5d865d5204053c5b3d9a2579)It should give 3 in my opinion.

9214

[17:31](#msg5d865e8d5d24375b3ef71620)@meijeru see dependent types and @rebolek's \[blog post](http://red.qyz.cz/dependent-types.html).

&gt; this still gives an error while I thought it had been solved

What error are we talking about? Functions with quoted arguments, by their nature, take precedence over operators in such cases.

meijeru

[17:41](#msg5d8660e18521b34d91687bcd)Yes but then `f 1 + 2` should equal `(f 1) + 2` or `3` shouldn't it, and not an error? I put `probe` on purpose because that gives a result (`print` yields `unset`).

9214

[17:44](#msg5d86618be45b6d473231c97d)&gt; Yes but then f 1 + 2 should equal (f 1) + 2 or 3 shouldn't it, and not an error

That's not how evaluation semantics works. `f` eats `1` and `+` if left with dangling left side, which error message clearly indicates.

[17:52](#msg5d866370c7ec2e2208c961b9)Operators take value on the left and expression on the right. What you propose is that operators seek their left argument either on the left side or on evaluation stack.

greggirwin

[18:25](#msg5d866b0db9f8210ed5c7e88a)@9214 do you mean that `[word! (object!)]` should pass the value of the word bound to a specific object, like a shortcut to using `in`, or that a lit-word arg is checked for the type it refers to? I assume the latter, but safer to ask.

[18:26](#msg5d866b4ebe709e39d16b62e0)Lit-word args are a double-edged sword, to be sure.

9214

[18:26](#msg5d866b5042a6b945202da350)@greggirwin "pass only words which are bound to an `object!` value".

[18:27](#msg5d866b83e45b6d47323210dd)And further down the line you can describe precisely which `object!` you want to accept (class id, presence of specific fields, etc).

greggirwin

[18:32](#msg5d866ca5a7a5cc473330bbb8)Got it. Thanks.

## Monday 23th September, 2019

loziniak

[12:19](#msg5d88b84d42a6b945203da67d)Is there any reason why it's better to pass word to the functions like these instead of word's value?

9214

[12:36](#msg5d88bc465d24375b3e07169b)@loziniak that way you can modify word's value in place, e.g. `forall` increments series' index so that you can iterate over it:

```
>> block: [a b c d]
== [a b c d]
>> forall block [print [block/-1 block/1 block/2]]
none a b
a b c
b c d
c d none
```

and hypothetical `increment` would be:

```
>> increment: func ['word][set word 1 + get word]
== func ['word][set word 1 + get word]
>> x: 0
== 0
>> increment x
== 1
>> increment x
== 2
>> x
== 2
```

[12:37](#msg5d88bca7a7a5cc473340cd5e)Other than that it's just a syntactic sugar:

```
>> increment: func [word][set word 1 + get word]
== func [word][set word 1 + get word]
>> x: 0
== 0
>> increment 'x
== 1
>> increment 'x
== 2
>> x
== 2
```

loziniak

[15:55](#msg5d88eaf0e45b6d473243186b)Thanks!

greggirwin

[18:52](#msg5d89148a56677e767a472e96)@loziniak in this case, for an object inspector, I wanted to include the name reference. Using the word let me do it with one param, but you could also pass the name and value as separate args.

[18:54](#msg5d8914f2a7a5cc4733434a92)Using @9214's example, where the user has to know to pass a lit-word, is another way. If you then add typeset support for both words and objects (in my example case), you can do both.

## Tuesday 24th September, 2019

Oldes

[19:25](#msg5d8a6db3ab4244767bfb0657)`mold/flat` does not removes line breaks when used with `binary!` value:

```
>> mold/flat #{FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
== {#{^/FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF^/FFFF^/}}
```

## Wednesday 25th September, 2019

Oldes

[14:45](#msg5d8b7da514635d6b37ea76fc)@dockimbel regarding the comparison of two pairs, is this really the best result?

```
>> 1x6 < 2x2
== true
```

[15:29](#msg5d8b87f6edbce86c91bf6717)Hm... I guess, that the recent change in pair comparison was to get this:

```
>> sort [1x2 1x1 2x1 2x2]
== [1x1 1x2 2x1 2x2]
```

Instead of this in Rebol:

```
>> sort [1x2 1x1 2x1 2x2]
== [1x1 2x1 1x2 2x2]
```

meijeru

[18:44](#msg5d8bb5aa63b06968fbeaa257)Yes it is now lexicographic: first on x, then on y.

greggirwin

[21:03](#msg5d8bd61063b06968fbebb0e3)@Oldes :point\_up: \[September 24, 2019 1:25 PM](https://gitter.im/red/bugs?at=5d8a6db3ab4244767bfb0657) it looks like it matches R2, and the doc string for flat does only say "indentation". I have an old `single-line-mold` mezz that I used a \*lot\*, for blocks, not binary. We can easily use `trim/all` on the result of mold, and the current behavior may be useful once `system/options/binary-base` is in effect, where base-64 output can be created by `mold`. It overlaps functionality with `enbase/base`, and I almost always used the latter instead in R2.

My gut reaction was that `mold/flat` should remove lines, but thinking a bit changed my mind.

I don't want to hijaak your question, but should `trim/lines` on a block remove `new-line` markers? That seems useful to me.

[21:05](#msg5d8bd6ae86eddb6ea0d48791)That may be confusing, if it also removes `none` values. So we can just stick with `new-line/all ... off`.

## Thursday 26th September, 2019

hiiamboris

[07:08](#msg5d8c63d091f8b71cd913d2a3)I have modified the \[code from the help room](https://gitter.im/red/help?at=5d8becfcbae2907f6c396669) a bit:

```
foo: function [][do [continue]]
forever [
    print "foo"
    foo
]
```

It compiles but gives this:

```
root size: 2393, root max: 4271, cycles: 0, before: 1090052, after: 1051316
root size: 2393, root max: 4271, cycles: 1, before: 1087708, after: 1087708
foo

*** Runtime Error 95: no CATCH for THROW
*** in file: common.reds
*** at line: 260
***
***   stack: ***-uncaught-exception
***   stack: ***-uncaught-exception
```

Worth a ticket? I get it that `forever` is compiled while `continue` is not. Still, weird error. In the lines of "magic bad" :)

endo64

[07:23](#msg5d8c676db38cc849bf13d69b)There is a small issue on `prin` function only on GUI console (`print` is ok)

```
>> prin "one^/two^/three"  ; no newline at the end
                    <--- extra newline IF the string contains newline anywhere
one
twothree  <--- incorrect output
>> prin "one^/two^/three^/"
                    <--- extra newline IF the string contains newline anywhere
one
two
three         <--- Correct output
```

Can someone test &amp; confirm? I'm on Win10. Latest build `Red 0.6.4 for Windows built 25-Sep-2019/22:36:30+03:00 commit #f753e25`

hiiamboris

[07:27](#msg5d8c6872512efb2e0f061a7b)

```
>> prin "one^/two^/three"

one
twothree
>> prin "one^/two^/three^/"

one
two
three
```

W7. I recall seeing this issue when I was fixing the recursive print. It's a glitch in the GUI console code. Related to multi-line editing IIRC.

endo64

[07:31](#msg5d8c695091f8b71cd913fa0d)Thanks for testing. I'll check if any related issue on Github. Extra newline in the beginning is not a big deal but the other issue could be annoying if you output to a file for example.

greggirwin

[16:30](#msg5d8ce7aceb1eff63d62b2e3a)@hiiamboris worth a ticket, because the explanation may be helpful for other behavior.

hiiamboris

[16:52](#msg5d8cecdc086a72719e68ce9c)okay

## Friday 27th September, 2019

avitkauskas

[11:27](#msg5d8df23d73dd29627ebf07bf)`transform` with negative `scale-y` does not work on Mac OS:

```
view [box 100x100 draw [transform 0 1 -1 0x100 line 0x0 50x20]]
```

gives a blank screen, but that works:

```
view [box 100x100 draw [translate 0x100 scale 1 -1 line 0x0 50x20]]
```

qtxie

[16:50](#msg5d8e3dd2462ada51230a3fb2)@avitkauskas Fixed in the latest build.

greggirwin

[16:52](#msg5d8e3e39d97d8e3549c1d386)Looks like @hiiamboris did some testing on this, and we need to confirm if there are regressions.

hiiamboris

[17:03](#msg5d8e40c5290b8c354ae74029)Let me try it again...

[17:22](#msg5d8e455847de0a719d1f5cad)@qtxie doesn't seem to work: https://travis-ci.org/red/red/builds/590511277?utm\_source=github\_status&amp;utm\_medium=notification (but maybe it's a different issue)

qtxie

[17:44](#msg5d8e4a73d97d8e3549c235db)@hiiamboris Yes. It's different issue.

## Saturday 28th September, 2019

avitkauskas

[20:20](#msg5d8fc0730e829f60474329c8)@qtxie Yes, `transform` with negative `scale-y` works on Mac OS in the latest build. Thanks!

## Tuesday 1st October, 2019

ralfwenske

[09:35](#msg5d931dd3290b8c354a09723e)MacOS: hitting `return` several times in terminal ( or worse: holding it down a few seconds ) causes long delay until `>>` shows again.

[09:35](#msg5d931dd7bf625112c0116777)Red 0.6.4 for macOS built 28-Sep-2019/2:46:20+10:00 commit #d0e6692

avitkauskas

[09:38](#msg5d931e9966c8b451224badda)It also happens if you just keep Red console open for a few minutes without doing anything.

hiiamboris

[09:50](#msg5d93217a47de0a719d4189ea)@qtxie ^

qtxie

[09:56](#msg5d9322e69d4cf173604c9458)Please open a ticket on Github, so we don't forget it.

ralfwenske

[10:03](#msg5d932482eb1eff63d657ea49)#4058

## Wednesday 2nd October, 2019

rebolek

[12:51](#msg5d949d6c24509b6046979f48)`copy/deep` doesn't work on `map!`s?

```
>> a: #(b: #(c: 1))
== #(
    b: #(
        c: 1
    )
)
>> x: copy/deep a
== #(
    b: #(
        c: 1
    )
)
>> a/b/c: 2
== 2
>> x
== #(
    b: #(
        c: 2
    )
)
```

[13:03](#msg5d94a01066c8b45122566a42)Hm, doesn't https://github.com/red/red/issues/2167

hiiamboris

[13:30](#msg5d94a687d97d8e3549eee5a1)@rebolek see also https://github.com/red/red/issues/2254

## Thursday 3th October, 2019

hiiamboris

[15:46](#msg5d9617e83220922ffb2100cb)Is this worth reporting?

```
>> load probe mold/all %"c:\file"
"%c:\file"
*** Syntax Error: invalid value at ":\file"
*** Where: do
*** Stack: load
```

[15:47](#msg5d9618060459254672e92bbd)(considering that `mold/all` is with a permanent TBD flag)

greggirwin

[15:56](#msg5d961a1eeac5612d22aa82a6)@hiiamboris what do you expect it to produce? `%c:\file` isn't valid.

9214

[16:00](#msg5d961b08eac5612d22aa8ac9)@hiiamboris `mold` eats inner quotes for some reason.

hiiamboris

[16:10](#msg5d961d5b9735874673ecef3b)@greggirwin it was valid until I molded it ☻

9214

[16:15](#msg5d961eb192920c36a105fea7)Worth a ticket, since `mold` \[doesn't](https://github.com/red/red/blob/master/runtime/datatypes/file.reds#L163) handle quotations in any way.

greggirwin

[16:20](#msg5d961fe6464b432fc1b2cb3a)Ah, I see what you mean. R2 has the same limitation.

tpburke\_twitter

[16:27](#msg5d96216b9735874673ed0c18)Hello all,

[16:29](#msg5d9621e392920c36a1061d8f)Oops. I noticed this today:

&gt;&gt; about  
Red 0.6.4 for Windows built 1-Oct-2019/18:41:56+02:00 commit #2976655  
&gt;&gt; sort/compare \[1 4 3 7] func \[a b]\[a &lt; b]  
\== \[7 4 3 1]  
&gt;&gt; sort/compare \[1 4 3 7] func \[a b]\[a &gt; b]  
\== \[1 3 4 7]  
&gt;&gt;

Unless I really have been here too long, this is reversed.

hiiamboris

[16:30](#msg5d9622217aa5602ffc61bd5e)@tpburke\_twitter interestingly, this issue popped up just yesterday I think. It was fixed, although not on the master branch.

9214

[16:30](#msg5d96222aeac5612d22aabda7)@tpburke\_twitter https://github.com/red/red/issues/3768#issuecomment-537559253

tpburke\_twitter

[16:33](#msg5d9622ca0459254672e97caf)@hiiamboris Thanks. I'll pick up the latest release.

9214

[16:34](#msg5d962318eac5612d22aac57e)@tpburke\_twitter consider to re-read what we just posted for you - this fix is not on the master branch.

[16:35](#msg5d962362b385bf2cc6690c36)Though, perhaps it should be cherry-picked (@dockimbel?)

dander

[16:36](#msg5d96239849c7720aaf5bf996)Weird, I never knew you could quote a Windows-style path like that in a `file!`. I'm curious about the design rational behind that, because we have `to-red-file` and `to-local-file`. It seems like it kind of muddies the water for me.  
Is this the same thing too? Does the console just print the `mold`ed value when it evaluates it?

```
>> %"c:\file"
== %c:\file
```

greggirwin

[16:37](#msg5d9623c30459254672e98644)@hiiamboris @9214, let's think about the file issue. Quotes let you put anything in there, but Red knows it's a file and wants to make it loadable. Since you can create file values that aren't loadable, should Red work as is and normalize things in a simple way, or should it allow you to abuse files in this manner?

[16:39](#msg5d9624350e67130aae0a6608)It's very nice that it silently works for local files, but if you're going to serialize them, should we carry that over? My gut says No.

9214

[16:40](#msg5d96247149c7720aaf5bff5e)&gt; Since you can create file values that aren't loadable

Example? For what it's worth, it counters all the garbage I put in with URL-style `%` normalization.

greggirwin

[16:40](#msg5d9624940e67130aae0a69f8)`%"::::::::::::"`

[16:42](#msg5d9625083220922ffb2161c0)Note that R2 does not support local filenames directly in `read`.

9214

[16:43](#msg5d96253a0e67130aae0a6ff7)I think the reason why `%"..."` exists in the first place is notational convenience - you can write system-specific path instead of sticking to Rebol convention. As for lexical abusage - I believe most of `any-string!` values suffer from that, one way or another - doesn't mean we can't leverage it (dialecting comes to mind), like e.g. `email!` with missing user part turns into `@greggirwin` `ref!`-like value.

greggirwin

[16:48](#msg5d96264937073b36a0645734)Email should not do that, and will change I expect. The user/host result is backwards.

[16:51](#msg5d9627159735874673ed3608)\*Should* Red support this notational convenience though? That's my question. We have a `file!` form, and the convenience part is not for locality, but for special characters like spaces. Making users type `%20` is not human friendly.

9214

[16:55](#msg5d962800e8de6f3ca032a34f)Functionally, `%"..."` is a shortcut for `to-red-file "..."`, so...

```
>> %: :to-red-file ()
>> %"c:/file"
== %c:/file
>> % "c:/file"
== %/c/file
```

greggirwin

[16:58](#msg5d9628bb0e67130aae0a87ec)I don't know that it's a shortcut by design.

9214

[16:59](#msg5d9628e6fcf7602cc525ea90)The question is if `file!` values in such lexical form bear any weight. That's definitely not what you want to keep in your data, as it's non-portable. OTOH, you can keep them for unintentional purposes (dialects) not related to files at all.

greggirwin

[16:59](#msg5d9628f4eac5612d22aaf22d)We need more info in https://doc.red-lang.org/en/datatypes/file.html, and can ping @gltewalt about doing that. http://www.rebol.com/r3/docs/datatypes/file.html can be a starting reference from an historical perspective.

9214

[17:01](#msg5d9629515173c33ca160b75b)And lexically `%"..."` is the same as `to file! "..."`.

hiiamboris

[17:11](#msg5d962bbe9735874673ed5a63)My opinion is that `mold/all` should be able to encode \*anything* that exists in the interpreter memory. What's it worth if you can't save and load the state as is?

[17:12](#msg5d962c0037073b36a0648343)And since `%""` notation isn't likely to go anywhere, it should be supported by `mold/all` as well.

greggirwin

[17:15](#msg5d962cb70e67130aae0aac9d)Constraints are not a bad thing. Datatypes exist to provide constraints in meaning and understanding. Some are more flexible than others. At this moment, I think we benefit more from constraining `file!` than making it more flexible.

@hiiamboris, are you saying \*all* file values should be quoted, rather than normalized? e.g. this would change?

```
>> %"/c/file"
== %/c/file
```

[17:16](#msg5d962ce59735874673ed6146)Or that mold should sniff `file!` values and quote them accordingly when molded?

hiiamboris

[17:39](#msg5d96323c92920c36a1069fb7)@greggirwin \*sniff* right ☺. Quote when it's unloadable otherwise.

greggirwin

[22:12](#msg5d967263464b432fc1b5197f)Being able to save and load all state requires construction syntax or a binary equivalent.

To @9214's point about dialects, you can still abuse files this way, with a few characters being exceptions. e.g. `:`

```
>> %1x?_-+=~`!#$&*|,.<>
== %1x?_-+=~`!#$&*|,.%3C%3E
>> load mold/all to file! " 1x?_-+=~`!#$%&*()|,.<>"
== %%201x?_-+=~`!#$%25&*%28%29|,.%3C%3E
```

`:` and local Windows format gets special treatment currently, which is likely why colons aren't percent encoded.

&gt; Functionally, %"..." is a shortcut for to-red-file "..."

I disagree @9214. The quoted format is part of the lexical form, and only the current behavior for some `file!` actions provides automagic assistance WRT local file names.

```
>> change-dir to-red-file %"c:\dev"
== %/c/dev/
>> change-dir %"c:\dev"
*** Access Error: cannot open: %/C/dev/gi/red/build/bin/c:\dev/
*** Where: do
*** Stack: change-dir cause-error
```

@hiiamboris' problem is that we can't round-trip `file!`s relying on the blessed/special Windows format. If we defer the "save/load all state" issue, there are still choices for `file!`'s molded form:

1\. Do \*not* sniff and always returns quoted format, not percent encoding  
2\. Sniff for Windows colon format and return quoted form `{%"c:\file"}`; otherwise use percent encoding  
3\. Sniff for \*any* non-supported characters (currently defined by URL compatibility) and return quoted format, not percent encoding  
4\. Incorporate `to-red-file` logic to always produce `%/c/file`, with percent encoding  
5\. Incorporate `to-red-file` logic \*and* sniff for any non-supported characters and return quoted format, not percent encoding

Quoted form is cleaner, clearer, and simpler than percent encoding \*IF* you have special chars. We still need percent encoding for URLs, and Red could still load them, for Redbol compatibility, but that doesn't mean it has to produce them.

## Friday 4th October, 2019

hiiamboris

[09:21](#msg5d970f14eac5612d22b124c8)Wow I got these curious warnings "VIEW: WARNING: free null window handle!" and a silent crash afterwards. Gonna try to localize the issue...

[09:59](#msg5d97181f0459254672f023c7)Can you guys try to paste this script into the console:

```
view [
    index: text-list 300x460
    on-alt-down [
        view/options
            [ text-list data ["a" "b"] ]
            [ actors: object [on-unfocus: func [f e] [unview/only f]] ]
    ]
]
```

On W7: After I \*right-click* on the window, there appears another window. When I then \*left-click* the main window to trigger an unfocus event, the event loop just stops, returning me to the console prompt. If your console is compiled with `-d` option, it will also show a `VIEW: WARNING: free null window handle!` line.

toomasv

[13:27](#msg5d9748df0e67130aae127780)On somewhat dated (built 14-Sep-2019) console this doesn't happen on W10.

hiiamboris

[13:34](#msg5d974a7937073b36a06c3c8b)@toomasv thanks ☻

avitkauskas

[14:11](#msg5d9752f73220922ffb299a2b)On Mac OS I see no errors. But it opens new small pop-up window every time you right-click. And when you close the main window, you have to close all small windows stacked on each other.

## Saturday 5th October, 2019

endo64

[13:35](#msg5d989c1037073b36a075764c)No issue on Win10, but right click opens a window only for once, no stacked windows as @avitkauskas reported. It might be MacOS issue that `on-unfoucs` might not be triggered.

hiiamboris

[15:43](#msg5d98ba230e67130aae1c8f1b)@endo64 no issue on W10 on the current build?

endo64

[22:58](#msg5d9920300459254672fe4374)@hiiamboris Nope, no issue on latest build on Win10, just tested on CLI and GUI console.

[23:00](#msg5d99208c92920c36a11af852)I didn't compile, just pasted onto console. it returns me to console prompt when I click on the small window, not the mail window.

[23:06](#msg5d9922003220922ffb36002a)Shouldn't last two raise error?

```
>> load "4x"
*** Syntax Error: invalid pair! at "4x"

>> load "4a"
*** Syntax Error: invalid integer! at "4a"

>> load ".4a"
*** Syntax Error: invalid float! at ".4a"

>> load "1.0x.0"
*** Syntax Error: invalid pair! at "1.0x.0"

>> load ".4x"
== [0.4 x]

>> load ".0x.0"
== [0.0 x.0]
```

9214

[23:09](#msg5d9922b8e8de6f3ca0477249)@endo64 R2 and R3 choke with "invalid decimal / pair" error, respectively.

endo64

[23:11](#msg5d99233b973587467301ef7a)@9214 It's different for me, on R3 last one loads, `Invalid tuple -- .0x.0` on R2.

```
R3> load ".0x.0"
== 0x0

R3> load ".1x.3"
== 0.10000000149011612x0.30000001192092896
```

9214

[23:12](#msg5d9923747aa5602ffc76e0c8)@endo64 try `load ".4x"`.

endo64

[23:13](#msg5d9923a737073b36a079246b)For that one, yes, I get `invalid decimal / pair error`

greggirwin

[23:15](#msg5d992418940b4c2fc0805dc4)Things like this could be good to stuff in a quick list on a wiki page. With the fast lexer coming, we want to make sure we know of changes, which may not be testing against expected value formats.

endo64

[23:42](#msg5d992a4a49c7720aaf7110d0)@greggirwin I've created a page: https://github.com/red/red/wiki/%5BNOTES%5D-Lexer-Notes

greggirwin

[23:43](#msg5d992abd874aeb2d23f5ecb4):+1: Thanks!

## Sunday 6th October, 2019

hiiamboris

[06:04](#msg5d9983e2045925467200c8d9)@endo64 Yes, when I click on the small window it throws me into the console too. Well, that's exactly the problem - the event loop gets interrupted. Plus, I don't think it should trigger on-unfocus when you're clicking on the active window. Thanks for testing (:

P.S. Oh well, maybe it should... focus the text-list and unfocus the main window? What do you guys think? Is it reasonable that the main window stays active but gets an unfocus event?

DVL333

[16:05](#msg5d9a10e204592546720488af)Hi there!  
Is it a bug?

```
obj: make reactor! [a: 3 b: 5 sum: is [a + b]]
set-quiet 'obj/a 5
```

Get an error `set-quiet does not allow word! for its word argument`.

hiiamboris

[16:24](#msg5d9a15570e67130aae25b836)@DVL333 `set-quiet in obj 'a 5`

[16:25](#msg5d9a158f7aa5602ffc7d355c)The error message could have been better, I agree :)

DVL333

[16:30](#msg5d9a16bf7aa5602ffc7d40d2)ok, thanks. :)

[16:35](#msg5d9a17c5eac5612d22c630a5)But, in any case, it's very strange, because a construction `set 'obj/a 5` works as expected.

[16:37](#msg5d9a185537073b36a07fae37)Why these similar functions work so different? The result is confusing.

hiiamboris

[16:50](#msg5d9a1b4537073b36a07fc484)Well, `set` is a beast on which a lot of things hang. While `set-quiet` serves only the reactivity and View code in a few places. A tiny thing ;)

[16:52](#msg5d9a1be297358746730874e6)Question is, should `set-quiet` support all the features that `set` supports? If that was the plan, I guess we'd have a refinement `/quiet` for `set`, rather than a separate routine.

greggirwin

[18:42](#msg5d9a357c464b432fc1cf1c9e)The first thing we should do is add doc strings and type checks to `-set-quiet`.

## Monday 7th October, 2019

meijeru

[11:38](#msg5d9b239c5173c33ca18310f1)

```
USAGE:
     SET-QUIET word value

DESCRIPTION: 
     Set an object's field to a value without triggering object's events. 
     SET-QUIET is a routine! value.

ARGUMENTS:
     word         [any-type!] 
     value        [any-type!]
```

Doc string and types are in place, I think. Though, the type spec of `word` is perhaps too broad?

hiiamboris

[12:43](#msg5d9b32ee92920c36a128d777)

```
>> remainder 10 11.22.33
== 1.2.3
>> remainder 10 11x22
== 1x2
>> remainder 10 make vector! [11 22 33]
== make vector! [1 2 3]
```

This is an intentional result, judging from the code. Do you find it wrong too? (I expected 10.10.10, 10x10, vector \[10 10 10])

[12:48](#msg5d9b3412fcf7602cc548f5be)Perhaps the code was written for commutative operations only...

[12:50](#msg5d9b349c7aa5602ffc84fe04)Same:

```
>> divide 10 make vector! [11.0 22.0 33.0]
== make vector! [1.1 2.2 3.3]
```

9214

[12:52](#msg5d9b34fa9735874673102523)As if the order of arguments is ignored.

hiiamboris

[12:57](#msg5d9b36450e67130aae2d8af0)Yep. `float/do-math` and `integer/do-math` just swap the args, regardless of commutativity.

[12:57](#msg5d9b36545173c33ca1839681)https://github.com/red/red/blob/master/runtime/datatypes/integer.reds#L237

ushakovs\_gitlab

[16:54](#msg5d9b6de3940b4c2fc0902995)I run this script:

```
f: view/options/no-wait [
    t: h5 red 80x20 "Not frozen more" 
] [options: [drag-on: 'down] flags: ['no-title]]
```

When it run there are error messages in the console appears:  
\*\** Script Error: + does not allow logic! for its value2 argument  
\*\** Where: +  
\*\** Stack: ask do-events do-safe  
\*\** Script Error: + does not allow logic! for its value2 argument  
\*\** Where: +  
\*\** Stack: ask do-events do-safe

But all other works properly.  
Is it bug?

hiiamboris

[17:10](#msg5d9b719b37073b36a08928dc)Yes. You should report it on the \[issue tracker](https://github.com/red/red/issues/) ☺

[17:11](#msg5d9b71d65173c33ca1854231)I'm seeing the same error messages as you do. On W7.

toomasv

[17:19](#msg5d9b73b4fcf7602cc54acd40)On W10 the error message is

```
*** Script Error: path face/state/4 is not valid for none! type
*** Where: drag-offset
*** Stack: view show do-safe
```

But normal way works:

```
f: view/options/flags/no-wait [
        t: h5 red 80x20 "Not frozen more" 
] [drag-on: 'down] 'no-title
```

ushakovs\_gitlab

[17:25](#msg5d9b751304592546720e34d0)\[drag-on: 'down] doesn't set options/drag-on to 'down  
So window became unmovable.  
As one say to me - right way to set options is \[options: \[drag-on: 'down]] and this is really works! But show errors...

greggirwin

[18:34](#msg5d9b853be8de6f3ca058011c)@meijeru compare doc strings and types for `set` and `set-quiet`. The latter is even more restrictive, and should be noted IMO.

Softknobs

[22:12](#msg5d9bb85e7aa5602ffc88998d)I am getting the following error in one script:

```
*** Runtime Error 21: guard page
*** in file: /C/dev/red/libmicrohttpd/collector.reds
*** at line: 61
***
***   stack: red/collector/mark-stack-nodes
***   stack: red/collector/do-mark-sweep
***   stack: red/collector/do-cycle
***   stack: red/alloc-series-buffer 15681 1 0
***   stack: red/alloc-series 15681 1 0
***   stack: red/alloc-bytes 15681
***   stack: red/binary/make-at 0283EDE4h 15681
***   stack: red/binary/load-in 028D8ADFh 15681 00000000h
***   stack: red/binary/load 028D8ADFh 15681
***   stack: handler-callback 004F1C00h 42828768 028D8825h 028D8820h 028D8827h 028D8ADFh 02F39E5Ch 028D8404h
```

This is the second time I get this error in on of my scripts (both involve library bindings and callback usage).  
The script can be found here and the problem is explained in the "Scenario 2" comment https://gist.github.com/Softknobs/6b7e70f84bb7a34a6f553b8a3b11bdec  
It could also have to do with the way I write my scripts but it looks like a bug to me (or a not very explicit error message).  
Thanks

## Tuesday 8th October, 2019

endo64

[07:50](#msg5d9c3fb93220922ffb4b8969)Did you try with `recycle/off`?

Oldes

[08:02](#msg5d9c4279464b432fc1dd4991)I wonder if there is already a way in Red to guard series from being GCed when used in R/S binding too. Only @qtxie or @dockimbel can answer this.

meijeru

[08:06](#msg5d9c439c940b4c2fc095d637)@greggirwin It is the type spec for `set` which is the more restrictive one, rather; for `set-quiet` I would recommend taking over the one for the `word` argument.

Softknobs

[17:57](#msg5d9cce1737073b36a092b39b)@endo64 The guard page error is present even with `recycle/off`

endo64

[18:07](#msg5d9cd05a045925467217de62)Where can I download `libmicrohttpd-12.dll` for Windows (x64)? I've downloaded the latest version but it crashed.

9214

[18:10](#msg5d9cd100940b4c2fc099ef9a)@endo64 https://github.com/Softknobs/RedLibmicrohttpdPoC

endo64

[18:13](#msg5d9cd1ce5173c33ca18f1f32)@9214 Thanks!

[18:23](#msg5d9cd40c5173c33ca18f3211)@Softknobs I reproduced the issue without `recycle/off`, it happened even for 1 MB file.  
But with `recycle/off` I tested to upload 1, 3, 6, and 17 MB file without an issue.

Softknobs

[20:39](#msg5d9cf3fc92920c36a135856e)@endo64 Yes you're right, I did the test a bit quickly and used a different version of the script by mistake. That said, the error should not happen with recycle/on, no?

## Wednesday 9th October, 2019

9214

[02:51](#msg5d9d4b44874aeb2d2312d578)&gt; I wonder if there is already a way in Red to guard series from being GCed

https://github.com/red/red/blob/master/runtime/allocator.reds#L51

GiuseppeChillemi

[11:15](#msg5d9dc146874aeb2d2316102a)does `read http://www.slashdot.org` fails to you too ?

rebolek

[11:16](#msg5d9dc190874aeb2d231612d0)

```
>> s: read http://slashdot.org
== {<!-- html-header type=current begin -->^/^-^/^-<!DOCTYPE html>^/^-^/^-^/^-<html lang="en">^/^-<head>^/^-<!-- Render IE9 -->^/^-<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">^/^/^-..,
```

hiiamboris

[11:41](#msg5d9dc75004592546721e9f4e)@GiuseppeChillemi what error do you get?

GiuseppeChillemi

[12:32](#msg5d9dd35b874aeb2d23169c87)

```
sites: [
	http://www.repubblica.it
	http://www.virgilio.it/
	http://www.slashdot.org
]


forall sites [
	counter: 0
	until [
		counter: counter + 1
		page: first sites	
		page-text: attempt [read page]
		either not none? page-text [success: true] [success: false]
		print ["page: " page " counter: " counter " Success: " success]
;		probe page-text
		counter > 1
	]
]
```

The last 2 should be true

```
>> do %prj-vari/dload.r
page:  http://www.repubblica.it  counter:  1  Success:  true
page:  http://www.repubblica.it  counter:  2  Success:  true
page:  http://www.virgilio.it/  counter:  1  Success:  true

page:  http://www.virgilio.it/  counter:  2  Success:  true
page:  https://www.slashdot.org  counter:  1  Success:  false
page:  https://www.slashdot.org  counter:  2  Success:  false
*** Throw Error: no catch for throw: halt-request
*** Where: do
*** Stack: do-file  

>>
```

hiiamboris

[12:34](#msg5d9dd3ce874aeb2d23169e87)W7?

rebolek

[12:45](#msg5d9dd671e8de6f3ca0684af2)

```
page:  http://www.repubblica.it  counter:  1  Success:  false
page:  http://www.repubblica.it  counter:  2  Success:  false
page:  http://www.virgilio.it/  counter:  1  Success:  false
page:  http://www.virgilio.it/  counter:  2  Success:  true
page:  http://www.slashdot.org  counter:  1  Success:  true
page:  http://www.slashdot.org  counter:  2  Success:  true
```

toomasv

[12:55](#msg5d9dd8ca940b4c2fc0a1514c)Same here. (W10)

Phryxe

[13:50](#msg5d9de5c17aa5602ffc980cab)Win7 - I get a timeout on `read http://www.slashdot.org`, so `false`.

hiiamboris

[13:53](#msg5d9de64804592546721f8567)You guys should also add the OS versions. `read` relies on the OS API.

[13:57](#msg5d9de755fcf7602cc55c39d1)@Phryxe Same on my W7, for a lot of httpS sites. I think it all started with TLS 1.3 invention. Though I never update it as I'm afraid it'll break more stuff than it will fix. @qtxie doesn't have this error on his W7.

[13:58](#msg5d9de78afcf7602cc55c3d09)In any case the timeout on W7 is not a Red bug, but Windows' one (although it's not a timeout, Red just reports every http API failure as a timeout). @rebolek's results are interesting though.

rebolek

[14:03](#msg5d9de8973220922ffb579e2d)Unsuccessful reads for first two pages are because `invalid UTF-8 encoding`

hiiamboris

[14:09](#msg5d9dea0f464b432fc1e95b55)On Linux?

rebolek

[14:09](#msg5d9dea327aa5602ffc982db9)Yes, but I guess it doesn't matter. This problem is usually caused by page's encoding.

hiiamboris

[14:10](#msg5d9dea485173c33ca196cf2f)But how come it reads it successfully on the 2nd attempt

rebolek

[14:12](#msg5d9deac092920c36a13c3d06)This must be something caused by their server:

```
>> read http://www.virgilio.it/
*** Access Error: invalid UTF-8 encoding: #{A04C40ED}
*** Where: read
*** Stack:  

>> read http://www.virgilio.it/
== {<!DOCTYPE html>^/<html class="" lang="it-IT">^/<head>^/    <meta charset="utf-8">^/...
>> read http://www.virgilio.it/
*** Access Error: invalid UTF-8 encoding: #{F7000000}
*** Where: read
*** Stack:  

>> read http://www.virgilio.it/
== {<!DOCTYPE html>^/<html class="" lang="it-IT">^/<head>^/    <meta charset="utf-8">^/...
```

SuperAuguste

[15:10](#msg5d9df87a37073b36a09aff83)Hi!

[15:11](#msg5d9df89097358746732391a8)I've found a bug when attempting to open a TCP server

[15:11](#msg5d9df8b904592546722015ce)`open tcp://:8001` throws an error;

```
*** Access Error: scheme is unknown: make object! [scheme: 'tcp user-info: none host: "" port: 8001 path: none target: none query: none fragment: none ref: tcp://:8001]
*** Where: open
*** Stack:
```

[15:12](#msg5d9df8db37073b36a09b01ee)Has TCP been implemented yet?

9214

[15:15](#msg5d9df9887aa5602ffc989a03)@SuperAuguste ports are not in place yet, you should wait for the official announcement and 0.7.0 release.

SuperAuguste

[15:16](#msg5d9df9bb92920c36a13caec8)Thanks!

[15:16](#msg5d9df9c904592546722020a1)Approximately when will 0.7.0 be released?

9214

[15:18](#msg5d9dfa2a3220922ffb5825de)No ETA.

GiuseppeChillemi

[16:08](#msg5d9e060837073b36a09b6262)Strange enough you had statistically opposite results than me. The first 2 sites are Italian language sites being accessed from an italian language Windows 10 machine and the connection was ok. While slashdot is a english language site being accessed from an italian Windows 10 machine. You had the first 2 sites failing 3 over 4 connection attempts and 2 successes on slashdot.

qtxie

[16:57](#msg5d9e116b92920c36a13d5e0e)You may need to enable TLS 1.2 support on Windows 7. https://github.com/red/red/wiki/%5BNOTES%5D-Enable-TLS-1.1-and-TLS-1.2-on-Windows-7

[16:58](#msg5d9e11a692920c36a13d6087)Some sites force TLS 1.2, even TLS 1.1 is not enough.

hiiamboris

[17:14](#msg5d9e157b940b4c2fc0a32d40)I did that. It doesn't help :)

[17:18](#msg5d9e165e92920c36a13d84aa)Hmm maybe the update failed to install. That explains it.

GiuseppeChillemi

[17:35](#msg5d9e1a49874aeb2d2318b333)@qtxie Should I activate it too ? Windows 10 here and it is not mentioned in your link

qtxie

[17:36](#msg5d9e1a8b7aa5602ffc999274)@GiuseppeChillemi No need for Win10.

GiuseppeChillemi

[22:03](#msg5d9e5938464b432fc1ec8b3e)If it is confirmed I propose to open a ticket

[22:04](#msg5d9e5957e8de6f3ca06c1bcb)Could I?

## Thursday 10th October, 2019

Oldes

[18:06](#msg5d9f731304592546722a867d)@GiuseppeChillemi have you tried to use `Accept-charset: utf-8` in the http request?

GiuseppeChillemi

[18:29](#msg5d9f789b97358746732e4612)@Oldes How should do ? It's a simple `read`

Oldes

[20:21](#msg5d9f92e404592546722b75b6)@GiuseppeChillemi like: `write http://www.virgilio.it/ [GET [Accept-charset: "utf-8"]]`

[20:26](#msg5d9f9408eac5612d22ed76ef)You may also want to use something like:

```
set [code header data] write/binary/info http://www.virgilio.it/ [GET [Accept-charset: "utf-8"]]
```

and check header if content type is `charset=UTF-8` before converting data to string

[20:28](#msg5d9f947d464b432fc1f541b4)@qtxie is it known issue, that when using not string in the header value, Red crashes?

```
>> write http://www.virgilio.it [GET [Accept-charset: utf-8]]

*** Runtime Error 1: access violation
*** in file: /X/GIT/Red/red/runtime/unicode.reds
*** at line: 737
***
***   stack: red/unicode/to-utf16-len 03788A74h 0019FAD4h true
***   stack: red/unicode/to-utf16 03788A74h
***   stack: red/simple-io/request-http 122 02831B14h 03788420h 00000000h false false false
***   stack: red/url/write 02831B14h 00000000h false false false false 02831B04h 02831B04h 02831B04h 02831B04h
***   stack: red/actions/write 02831B14h 02831B24h false false false false 02831B04h 02831B04h 02831B04h 02831B04h
***   stack: red/actions/write* -1 -1 -1 -1 -1 -1 -1 -1
***   stack: red/interpreter/eval-arguments 0292FD24h 037882F0h 037882F0h 00000000h 00000000h
***   stack: red/interpreter/eval-code 0292FD24h 037882D0h 037882F0h false 00000000h 00000000h 0292FD24h
***   stack: red/interpreter/eval-expression 037882D0h 037882F0h false false false
***   stack: red/interpreter/eval 02831AE4h true
***   stack: red/natives/catch* true 1
***   stack: ctx||543~try-do 00EC08E0h
***   stack: ctx||543~do-command 00EC08E0h
***   stack: ctx||543~eval-command 00EC08E0h
***   stack: ctx||543~run 00EC08E0h
***   stack: ctx||543~launch 00EC08E0h
```

## Friday 11st October, 2019

nearlydaniel\_twitter

[04:36](#msg5da006c439e2ef28adbff914)\[!\[Screen Shot 2019-10-10 at 9.29.37 PM.png](https://files.gitter.im/red/bugs/CZ3N/thumb/Screen-Shot-2019-10-10-at-9.29.37-PM.png)](https://files.gitter.im/red/bugs/CZ3N/Screen-Shot-2019-10-10-at-9.29.37-PM.png)

[04:36](#msg5da006d465dd8569a0b7b480)downloaded macOS binary, seems to just not work

[04:36](#msg5da006e8dbf67667343c09b1)

```
Darwin Daniels-MBP.local 19.0.0 Darwin Kernel Version 19.0.0: Wed Sep 25 20:18:50 PDT 2019; root:xnu-6153.11.26~2/RELEASE_X86_64 x86_64
```

rebolek

[05:08](#msg5da00e3880e62056e4e38f6e)@Oldes yes, that's a known limitation of simple io

qtxie

[05:39](#msg5da0159e894dee56e5219f82)@nearlydaniel\_twitter Red doesn't support 64bit yet. We're working on it.

[05:41](#msg5da015fb809de9699f196d0c)@Oldes Yes. We can rewrite the http port once TCP and TLS ports are released.

## Monday 14th October, 2019

hiiamboris

[15:25](#msg5da4937dc87a1d28acab8fab)Worth an issue?

```
>> v: make vector! [1 2 3 4]
>> insert/part  v  v 2
*** Script Error: invalid argument: make vector! [1 2 3 4]
*** Where: insert
*** Stack:
```

[15:48](#msg5da498dd158cfd67352d477a)And this (it forms values when series is a string, right? R2 definitely does):

```
>> replace "1234" "2" "5"
== "1534"
>> replace "1234" 2 5
== "1234"
```

endo64

[18:26](#msg5da4bdef809de9699f394f22)@hiiamboris About vector, no need to fill an issue, I asked similar questions before, like "why vectors don't support all series action, should do they?" but currently there is no final decision about it.  
See this issue also: https://github.com/red/red/issues/3711

hiiamboris

[18:28](#msg5da4be6b57c2517c6a0a678f)Well, it works without the `/part` that's why I ask:

```
>> v: make vector! [1 2 3 4]
== make vector! [1 2 3 4]
>> insert v 0
== make vector! [1 2 3 4]
>> v
== make vector! [0 1 2 3 4]
```

endo64

[18:33](#msg5da4bf61f1c89c0758eb2b3b)Ah, right, I misunderstood.  
`part` with integer works, should check with series.

```
>> v: make vector! [1 2 3 4]
== make vector! [1 2 3 4]
>> insert/part v [5 6 7 8] 2
== make vector! [1 2 3 4]
>> v
== make vector! [5 6 1 2 3 4]
```

hiiamboris

[18:33](#msg5da4bf94f88b526fb93ae90c)Looks like it only doesn't work when `value` is of `vector!` type. Disregard what I said about `/part` :)

[18:35](#msg5da4bfe5809de9699f395da2)

```
>> insert v make vector! [1]
*** Script Error: invalid argument: make vector! [1]
*** Where: insert
*** Stack:
```

[18:45](#msg5da4c24989acff6ff5f65c69)must be an ez fix btw:  
https://github.com/red/red/blob/a4ee537c4b7dd40594db5e5809be8918deef38bd/runtime/datatypes/vector.reds#L1001  
just alter the typecheck and pray :)

endo64

[18:46](#msg5da4c28d65dd8569a0d851fe):)) I was just on that line in VS Code :)

hiiamboris

[18:46](#msg5da4c298809de9699f396e42):D

endo64

[19:16](#msg5da4c98e39e2ef28ade0f970)@hiiamboris About `replace`, changing this line https://github.com/red/red/blob/master/environment/functions.red#L236  
from  
`if system/words/all [any [char? :pattern tag? :pattern] any-string? series] [`  
to  
`if system/words/all [any [not any-string? :pattern tag? :pattern] any-string? series] [`  
looks enough.

[19:19](#msg5da4ca3789acff6ff5f6994b)Hmm, nope, some tests fail, if `pattern` is a block.

hiiamboris

[19:23](#msg5da4cb26894dee56e5423d05)So I take it as you agree that it's a bug ☺ I'll make an issue so I don't forget. Thanks for looking into it

endo64

[19:27](#msg5da4cc06870fa33a4df17d82)With below change all tests are passed.  
`if system/words/all [not block? :pattern any [not any-string? :pattern tag? :pattern] any-string? series] [`

hiiamboris

[19:30](#msg5da4ccbfc87a1d28acad4820):+1:

[19:30](#msg5da4ccef4afd703a4edd5aa9)Since you fixed it, wanna make the PR?

endo64

[19:32](#msg5da4cd4839e2ef28ade119a5)Sure, just need to add tests.

hiiamboris

[19:34](#msg5da4cdae57c2517c6a0ae293)https://github.com/red/red/issues/4079 will be the issue

endo64

[20:13](#msg5da4d703870fa33a4df1cecc)@hiiamboris What do you think this side effect?

```
>> replace "a bc" quote (a: b) "x"
== "xc"
```

hiiamboris

[20:16](#msg5da4d78689acff6ff5f6fb5b)makes sense

[20:16](#msg5da4d78d89acff6ff5f6fbdd)also, R2:

```
>> replace "a bc" quote (a: b) "x"
== "xc"
```

endo64

[20:17](#msg5da4d7cc870fa33a4df1d35e)Ok then, https://github.com/red/red/pull/4081

hiiamboris

[20:20](#msg5da4d89480e62056e404fe89)Add "Fixes #4079" magic words to the description :)

endo64

[20:30](#msg5da4daccf88b526fb93bb0e6)It starts as `FIX: #4079`.  
But 1 test failed: https://ci.appveyor.com/project/red/red/builds/28104237

hiiamboris

[20:33](#msg5da4dbae80e62056e4050fe3)Those magic words are recognized by GH and close the issue automagically ☺

## Tuesday 15th October, 2019

toomasv

[13:16](#msg5da5c6b665dd8569a0df8452)Bug in `parse/trace`?

```
>> parse [a a a] [1 5 word!]
== true
>> parse/trace [a a a] [1 5 word!] func [e m? r i s][]
== false
>> parse/trace [a a] [1 5 word!] func [e m? r i s][]
== true
```

hiiamboris

[13:34](#msg5da5cad4870fa33a4df86e74)It is by the look of it... I've encountered at times that `parse-trace` is different from `parse`. Must be some stack problems as usual.

[13:34](#msg5da5cb01dbf676673463fe29)There's also a return value. If you return `no` or `none` from trace func, the result of parse is always `yes` regardless of the input

endo64

[15:49](#msg5da5ea6d39e2ef28ade922d1)@toomasv What happens when you `probe` the parameters? What fails?

[23:44](#msg5da659cf4afd703a4ee866cd)@toomasv I think we should file an issue for `parse/trace`.  
See also the output of this:  
`parse/trace [a a a] [1 3 word!] func [e m r i s][print ["event:" e newline "match:" m newline "rule:" mold r newline "input:" mold i newline "stack:" mold s newline] true]`

In the output, last `input` should be empty, but it is not (is it `input: [a]` so it fails)

## Wednesday 16th October, 2019

toomasv

[04:20](#msg5da69a8bdbf676673469b519)@hiiamboris @endo64 Thanks! #4084

## Thursday 17th October, 2019

meijeru

[16:47](#msg5da89b0e894dee56e55d90ca)I just found out that the `/file` argument to `request-file`, which may be a directory, is not "normalized" by the function `request-file`. As a consequence, `request-file/file %.`, which to me means "start looking in the current directory" is not honored - one has to do `request-file/file normalize-dir %.` The usual question: \_bug or feature\_?

hiiamboris

[16:59](#msg5da89dee8e2e9a7c6b15904f)Likely just an oversight :) Nobody thought about a special case for `%.` and `%..`. Easier to add a slash than make a special case in R/S for adding a slash, right?

meijeru

[17:15](#msg5da8a1952d59854e7f1df525)For uniformity, `ls` and `dir` \_do_ accept `%.` as a directory, as does `change-dir` or `cd`. Then why not `request-file`???

hiiamboris

[17:18](#msg5da8a27257c2517c6a266380)Those \*always* `dirize` the argument. While `request-file` uses the part after the last slash as a suggested file name. It only doesn't makes sense for the two special cases above.

greggirwin

[18:17](#msg5da8b01d8e2e9a7c6b161afb)For me, on Win10, if I use %. or %.., I get no requestor at all, which is an issue. Can someone dupe?

The easiest thing is to tell people to use %./ and %../ for those special cases. We should test this across platforms, so we know if it's the same everywhere. e.g. if we "fix" it one place, to add a trailing slash, and that confuses other system OS deep code, that's bad. We want it to be consistent, and I hope that doesn't mean more R/S work for each platform. That is, if using a trailing slash solves it everywhere, we just tell people to do that.

[18:17](#msg5da8b0452d59854e7f1e61e9)I can justify this thinking, because some funcs are dir oriented, but this refinement arg is ambiguous, so we can ask people to be explicit.

hiiamboris

[18:21](#msg5da8b12f39e2ef28adfcd86a)&gt; Can someone dupe?

Yes. W7.

greggirwin

[18:23](#msg5da8b1a565dd8569a0f489e3)Ticket time.

dander

[19:55](#msg5da8c7288e2e9a7c6b16ccb1)Suppose `request-file` calls `clean-path` on its `/file` argument... would that break anything? It seems like it would resolve the `%.` and `%..` cases at least.

greggirwin

[22:01](#msg5da8e4a82d59854e7f1fe64b)Good question, and good idea.

[22:02](#msg5da8e4fc2d59854e7f1fe863)Doesn't work as I'd expect here.

[22:03](#msg5da8e53d65dd8569a0f5f874)That is, the file part of the cleaned `/file` arg ends up in the filename box at the bottom, rather than going into that dir.

## Friday 18th October, 2019

dander

[05:59](#msg5da954d7f88b526fb95b9092)Hmm, that sort of sounds like a separate issue, since it should probably be the same as if you were explicitly using a full path

greggirwin

[15:53](#msg5da9e0003e33a9652af06cf4)If you use %. with `clean-path`, it's not `dirize`d. This is the ripple effect of design. :^\\

[15:55](#msg5da9e0800fdc4b65070ea0a7)`Clean-path` is due for a design check anyway: https://github.com/red/red/issues/3571

## Saturday 19th October, 2019

iNode

[13:32](#msg5dab1054714b8b05381f40a1)Hello.

It seems like `red` binary executes `console` for actual code evaluation but does not handle exit code properly, as resullt `quit` and `quit-return` does not affect actual return code of `red` binary.

Is this a known issue? Is there any workarounds besides lookup the latest compiled `console` and execute `console` directly?

hiiamboris

[13:43](#msg5dab13094bc69e6b6601b19e)@iNode I can see that `red` always exits with an explicit `0`: https://github.com/red/red/blob/15b13004d3263ad0a9182be6bcb851b77346f653/red.r#L510

[13:43](#msg5dab131cfa637359fca80d96)Looks intentional to me, although quite strange indeed.

[13:46](#msg5dab139dea0d6159fd91480a)Worth a ticket IMO

iNode

[14:30](#msg5dab1e17a28cd16529c5437a)@hiiamboris Thanks for the feedback. Indeed stange behavior.

[14:31](#msg5dab1e27dd688b6b67f974de)Ticket was created https://github.com/red/red/issues/4095. Please let me know if any additional information is needed.

hiiamboris

[14:40](#msg5dab2064fa637359fca869ce):+1:

## Tuesday 22nd October, 2019

ushakovs\_gitlab

[16:36](#msg5daf3009a03ae1584fecb04b)

```
request-file/filter ["MD files" *.md]
```

crashes console without any notifications or error messages. Windows 7.

hiiamboris

[16:49](#msg5daf332a10bd4128a1409b92)Make an issue on the tracker, I'll fix it. It's exactly in the area I'm working on currently.

## Sunday 27th October, 2019

9214

[14:43](#msg5db5ad11e469ef435874b7e5)Typing something and pressing backspace in GUI console build with debug mode leads to an instant crash. Can anyone reproduce?

```
*** Runtime Error 98: assertion failed
*** in file: .../runtime/ownership.reds
*** at line: 226
***
***   stack: red/ownership/check 00000062h 00433F22h 0000000Ah 51725288 46280020
***   stack: red/ownership/check 02C22D54h 02C0DAF4h 00000000h 0 0
***   stack: red/string/take 02C22D54h 02C22D34h false false
***   stack: red/actions/take 02C22D44h 02C22D34h false false
***   stack: red/actions/take* -1 -1 -1
***   stack: ctx||563~delete-text 00BAF5CCh
***   stack: ctx||563~press-key 00BAF5CCh
***   stack: ctx||543~on-key 00BAF7ACh
***   stack: red/_function/call 02C22C44h 00BAF7ACh
***   stack: red/interpreter/eval-code 02C22C44h 03072540h 03072540h false 00000000h 00000000h 02C22BA4h
***   stack: red/interpreter/eval-expression 03072520h 03072540h false false false
***   stack: red/interpreter/eval 02C22C34h true
***   stack: red/natives/do* false -1 -1 -1
***   stack: red/interpreter/eval-arguments 02DA04B4h 030724FCh 030724FCh 00000000h 00000000h
***   stack: red/interpreter/eval-code 02DA04B4h 030724ECh 030724FCh false 00000000h 00000000h 02DA04B4h
***   stack: red/interpreter/eval-expression 030724ECh 030724FCh false false false
***   stack: red/interpreter/eval 02C22C14h true
***   stack: red/natives/try* true 0
***   stack: do-safe
***   stack: do-actor
***   stack: ctx||403~awake 00BB2D00h
***   stack: gui/make-event 0019FDD4h 0 13
***   stack: gui/process 0019FDD4h
***   stack: gui/do-events false
***   stack: ctx||411~do-event-loop false
***   stack: do-events
***   stack: ask
***   stack: ctx||503~run 00BB053Ch
***   stack: ctx||503~launch 00BB053Ch
***   stack: ctx||535~launch 00BAF7F8h
```

[14:45](#msg5db5ada59c3982150994611f)Ah, \[makes sense](https://github.com/red/red/commit/62ca5aa9647eeba9ea8fc64ab83f14dc27408c49). Bummer.

endo64

[17:38](#msg5db5d628e886fb5aa206f932)@hiiamboris warned about this change :)

## Friday 1st November, 2019

ne1uno

[19:03](#msg5dbc8198e886fb5aa237832a)fast-lexer silent exit/crash with `rcalc.red` on commandline. built from source yesterday. can anyone confirm?

[19:03](#msg5dbc8199a3f0b17849cca39b)if comment out buttons M+ M- no crash. also no crash if paste source directly in console. https://gist.github.com/guaracy/a7529831dba08a0fa9c522630a24a425

greggirwin

[19:08](#msg5dbc82a2e469ef4358a5ed65)I haven't seen that fast-lexer is ready for public consumption, but that's a good catch if you can dupe the crash with just those lines. We'll make sure @dockimbel sees it.

ne1uno

[19:10](#msg5dbc833314d55a3785b82525)wasn't able to simplify it more. but it must be an odd case, only 2 other more complicated scripts crashed so far

greggirwin

[19:12](#msg5dbc8399ef84ab3786dae7eb)Does it still crash if you add spaces around brackets in `[attempt[m: m + math to block! load v/text]]`?

[19:13](#msg5dbc83c2f26ea4729d381e9f)`[attempt[m:` being what caught my eye first.

ne1uno

[19:29](#msg5dbc87afa3f0b17849ccd22f)it doesn't crash on a different computer with a few commits newer source. and, a space did fix yesterdays version.

greggirwin

[19:52](#msg5dbc8cfae886fb5aa237d99a)Good to know. Thanks!

## Saturday 2nd November, 2019

meijeru

[19:26](#msg5dbdd878e469ef4358af6d17)For the spec document, I was reformulating the rules for how expressions are constituted (see discussion in `/help`room). I think I found out an asymmetry between infix and prefix functions:

```
>> fns: reduce [:add :subtract]
== [make action! [["Returns the sum of the two values" ...
>> type? pick fns 1
== action!
>> fns/1 2 3
== 5
>> ops: reduce [:+ :-]
== [make op! [["Returns the sum of the two values" ...
>> type? pick ops 1
== op!
>> 2 ops/1 3
== 3  ;; not 2 + 3 i.e. 5
```

In other words, whereas a function application can be based on an \_expression_ that yields a function, an operator application (infix) cannopt be based on an expression yielding an operator (`op!` value). Apparently, the compiler and interpreter require a `word!` that is bound to the `op!` value. If this, as I suspect, is a feature, not a bug, it needs to be pointed out somewhere.

9214

[19:39](#msg5dbddb822f8a034357240677)https://github.com/red/red/issues/3482

meijeru

[21:25](#msg5dbdf44e2f8a03435724ae8f)You are right, this feature is well known since more than a year. I tried now to find other ways of producing an `op!` value that could be applied. Making a function that yields an `op!` value does not work, but neither does making a function that yields an `action!` value -- only words and paths seem to work for `actions!` etc., and paths do not work for `op!` values. Which other expressions could one invent that yield an `action!` etc. or an `op!` that could then be applied? Or are we stuck with bound words only? Admittedly computing the action/op to be applied from an expression does not enhance readability...

hiiamboris

[21:48](#msg5dbdf9c6ef84ab3786e50f17)You mean that ops and actions that appear \*literally* aren't working? Like `[3 make op! .. 4]`

## Sunday 3th November, 2019

meijeru

[09:09](#msg5dbe99399825bd6bac1a772b)Just try it in the REPL and you will see.

## Monday 4th November, 2019

greggirwin

[19:26](#msg5dc07b51e886fb5aa253b3fa)@nd600, did you ever finish the work on that to make a PR?

[19:41](#msg5dc07ee37477946bad2b311f)Right now, I am absolutely OK with saying this is a current limitation, and "don't do that." It shouldn't be a showstopper for anyone.

9214

[20:48](#msg5dc08e9de886fb5aa2543c0b)@nd9600 :point\_up:

## Tuesday 5th November, 2019

temperfugit

[16:27](#msg5dc1a2f8e886fb5aa25bdb18)

```
Red [needs: 'view]

new-font: make font! [size: 60]

view [
base 500x500 white
draw [font new-font pen black text 2x2 "Hello World!"] 
]
```

On Windows 10 with the most recent 11/2 build, Red doesn't seem to be drawing new-font's larger font size. I have an older build, "Red 0.6.4 for Windows built 20-Aug-2019/10:02:36-06:00 commit #b24f49e" that does seem to be drawing it correctly. Did the font/draw procedure change or is this a bug?

9214

[16:28](#msg5dc1a335e469ef4358cabb9e)https://github.com/red/red/issues/4116

temperfugit

[16:34](#msg5dc1a4917477946bad336484)@9214 Thank you! The linked thread was helpful, glad there is a workaround for it.

## Thursday 7th November, 2019

rebolek

[12:34](#msg5dc40f4de886fb5aa26d0462)Long time no see!

```
*** Runtime Error 100: no value matched in CASE
*** at: 080E5F7Dh
```

loziniak

[13:39](#msg5dc41ea3fb4dab784a7df992)Hi. Got this error when compiling a script with `-c` on Windows 7 and `red-02nov19-1d32938a.exe`:

```
-=== Red Compiler 0.6.4 ===- 

Compiling Z:\wallet2.red ...
...using libRedRT built on 7-Nov-2019/12:36:23
...compilation time : 7799 ms

Target: MSDOS 

Compiling to native code...
*** Compilation Error: undefined symbol: red/file/to-OS-path 
*** in file: %/Z/runtime/platform/image-gdiplus.reds 
*** in function: exec/gui/OS-image/load-image
*** at line: 459 
*** near: [file/to-OS-path src :handle if not 0 = res]
```

[13:50](#msg5dc421209825bd6bac424339)The minimal script is:

```
Red [Needs: 'View]
probe load %img/arrow-left.png
```

hiiamboris

[14:06](#msg5dc424f4e469ef4358dcac1c)Works for me on an older build.

[14:07](#msg5dc42510e886fb5aa26d9fd0)You tried deleting `libRed*.*` before compiling, right?

loziniak

[14:08](#msg5dc425652f8a03435751206e)Oh, that could be it... I always forget about it.

[14:12](#msg5dc4265d9c39821509fcbaf4)Maybe there could be a mechanism for a red binary to check if libRedRT is up to date.

hiiamboris

[14:15](#msg5dc427023d669b28a0503fea)Right, I'd like that too...

loziniak

[14:16](#msg5dc42736f26ea4729d6eef15)Indeed, after recompilation of libRedRT it works. Sorry for false alarm.

9214

[14:22](#msg5dc428ab196ffb4db9227a50)&gt; Maybe there could be a mechanism for a red binary to check if libRedRT is up to date.

It's called `-u` flag.

hiiamboris

[14:24](#msg5dc42936e1c5e915084d71cd)But it will unconditionally rebuild the lib, no?

loziniak

[14:26](#msg5dc4299014d55a3785ef3edf)The problem with `-u` is that it compiles longer, just like `-r`. I thought about some indicator inside libRedRT, that a Red compiler could check. Git commit perhaps. Nevermind, just need to remember about that. It's just a plain convenience.

[14:31](#msg5dc42accef84ab378611d24a)Perhaps `-u` would be useless, when `-c` could check libRedRT version and recompile if it's not in the needed version .

9214

[15:15](#msg5dc4351914d55a3785ef97c6)There seems to be some severe misunderstanding of how libRed works.

With `-c`, toolchain takes a \[list](https://github.com/red/red/blob/master/system/utils/libRedRT-exports.r) of exported runtime functions, then quickly \[skims](https://github.com/red/red/blob/master/system/utils/libRedRT.r) thru R/S compiler output, looking for user-specific runtime calls, then compiles a runtime library which \_specifically_ includes all the above functions.

If after library compilation you introduce runtime call not previously seen, like e.g. `file/to-OS-path`, then toolchain will rightfully complain, because your (now outdated) runtime library has no exported symbol with such name, which means that you need to `--update-libRedRT` it.

`-u` is the slowest compilation version because it does a triple job: analyze user-specific needs, rebuild the library, and then compile a binary.

So, magical "mechanism for a red binary to check if libRedRT is up to date" makes no sense - up-to-date with \_what\_, exactly?  
\* Default exports? The toolchain is already aware of them, and if they happen to be outdated, this means that your toolchain is outdated - go grab a fresh build.  
\* User-specific runtime calls maybe? But for that it needs to analyze your source code and do recompilation, with `-u`.

Each libRedRT file is \_project-specific\_, there's no "version" slapped on it. It either contains symbols \_your_ project needs (which means it's up-to-date with \_the project's state\_) or it's not.

hiiamboris

[15:21](#msg5dc436879c39821509fd2f93)@9214 How does this explain that a single once-built libRedRT works later for every Red program I compile (`-c`) against it? (until I download a new build)

loziniak

[15:21](#msg5dc43693196ffb4db922ea76)So, when I just change my code, and not toolchain, there is a possibility that libRedRT has to be recompiled?

[15:26](#msg5dc43798196ffb4db922f123)@9214 this explanation is a fantastic content for a Wiki article!

## Friday 8th November, 2019

meijeru

[13:35](#msg5dc56f0568ad1c4a0f8d4631)After tinkering with the GUI console (added menu items) I suddenly got an error on `about` -- turns out that `system/platform` is a function whose body is Red/System, and the interpreter refuses that, as it should. But with a clean GUI console I can do `about` without any problem -- how come?

hiiamboris

[13:39](#msg5dc57027ca778c1fbfc7f5fc)Compile it.

meijeru

[13:40](#msg5dc5704c5a979223c3978de9)My point is that with a clean console there is no error, whereas if one reads the interpreter code, there SHOULD be an error!

hiiamboris

[13:41](#msg5dc5707368ad1c4a0f8d507a)But it (`system/platform`) was a \*compiled* function, in the clean GUI console.

meijeru

[13:41](#msg5dc5707552b73c7cb2dfb9d5)`system/platform` should not be passing in the interpreter.

[13:42](#msg5dc570d0eeb63e1a8379078c)I did not change the compiled console, only added some menu items and actors to the console face. Would that cause a switch from compiled to interpreted code?

hiiamboris

[13:45](#msg5dc5717f52b73c7cb2dfc186)Maybe you re-imported `system/platform`, and so it switched

[13:46](#msg5dc5719bfd6fe41fc049e7fc)IDK really, just compile it and that's it ;)

meijeru

[13:49](#msg5dc57286eeb63e1a837912d4)Yes, I did `system: make system []` so that must explain it. Thanks for thinking with me.

hiiamboris

[13:52](#msg5dc573385a979223c397a232):+1:

dockimbel

[13:54](#msg5dc57397c26e8923c4eadbd3)@meijeru You should not do that, there are many `#get system/...` references in the Red runtime library, so recreating the system object would lead to odd side-effects at best, resulting in crashes most probably at some point.

And to answer your probably next question: we'll lock such core words in 0.8.0 from being changed by the user once we get modules and values protection.

9214

[13:56](#msg5dc5742bfd6fe41fc049fb86)@loziniak

&gt; So, when I just change my code, and not toolchain, there is a possibility that libRedRT has to be recompiled?

If you use embedded Red/System with runtime calls, yes.

&gt; this explanation is a fantastic content for a Wiki article!

It's already explained at great length in \[this](https://www.red-lang.org/2017/03/062-libred-and-macros.html) blog post. After a re-read, I realized that it does not apply to your code written in pure Red.

meijeru

[14:43](#msg5dc57f2ab95ae413dca03286)@dockimbel I understand the implications. But, ... would `extend system []`, once it will be implemented, not lead to "recreating" the object??

dockimbel

[15:47](#msg5dc58e2dca778c1fbfc8dd3a)@meijeru Yes, it would, but only internally (reallocating the symbols and values structures). It should be transparent for `#get` or other indirect ways to access the object (like from object's context node). The only reason `extend` is not implemented on objects yet, is that people will abuse it to create dynamic objects everywhere, and I need first to study the implications of such misuses. ;-)

meijeru

[16:02](#msg5dc5918fb95ae413dca0be3b)@dockimbel My direct needs would be covered by the official addition of a field `user` to the `system` object, in analogy with Rebol 2. The information would be used to program a `send-mail` function (which itself would depend on the implementation of `ports`) but I believe it would be generally useful to have `system/user` information, which could be persistent by storing it in AppData (i.e. `system/options/cache` more generally), just as console configuration info is now stored. I will make a REP for this.

dockimbel

[16:58](#msg5dc59e9d6ba2347d2d5a77a0)@meijeru What would `user` refer to? Email? Any personal information is rather sensitive to handle lightly these days...

greggirwin

[19:25](#msg5dc5c13550010612b283394d)@meijeru why does `user` need to be in `system`?

meijeru

[20:12](#msg5dc5cc18c26e8923c4ed7576)Look at Rebol 2. It has to be somewhere, do you have another suggestion?

[20:12](#msg5dc5cc3f5a979223c39a30ec)Please study the Rebol 2 function `send` which does send mail.

greggirwin

[21:33](#msg5dc5df0c6ba2347d2d5c5646)Responded in red/red.

## Wednesday 13th November, 2019

ralfwenske

[03:43](#msg5dcb7bc5eeb63e1a83a2f8ed)I am wondering if anyone may have observed what feels like a bug in `save`. On MacOS I have observed for several weeks:  
An app uses `save afile anobject` and `anobject: do load afile`.  
The `anobject` contains amongst some fields a map as last item. This map can contain 1000s of entries.  
Most of the time it works - however every now and then the `load` fails like here:

```
*** Syntax Error: missing #"]" at "^B]"
*** Where: do
*** Stack: show-price load
```

the last 2 chars should be `)]`  
when the error occurs I then edit these last two chars by manually retyping then (in an editor of course).  
After that my code loads the file as expected. So every now and then the `save` seems to insert a wild character at the end. Any suggestions?

[04:02](#msg5dcb8040fd6fe41fc074e35c)I forgot to mention that - instead of replacing those chars - I sometimes just rerun the (unmodified) saving code and the load works afterwards.

greggirwin

[05:10](#msg5dcb9061c26e8923c415f090)@ralfwenske can you post a small example that reproduces the problem? Then others, and the team, can run it to check.

ralfwenske

[05:41](#msg5dcb97986ba2347d2d844808)@greggirwin mmmh - I don’t think I can as it is a rather complex thing: a master object contains some structure for fields and a host of (database type) functions. Then an object inheriting the functionality contains its individual field-descriptions and respectively a map which then holds all the data (records).

I’ll append the function that saves (which is where I think the last char(s) is occasionally being corrupted).

```
;SAVE-O ------------------------------------------------------------------------------- 
    save-o: function [
        "save all object values to file %name.obj (creates dir if necessary)"
        path [file!]
    ][
        save-obj: context [
            last-id: 0
            formatting: none
            extra: none
            data: none
        ]
        save-obj/formatting: self/formatting
        save-obj/extra: self/extra
        save-obj/last-id: self/last-id
        save-obj/data: self/data
        unless (last path) = #"/" [
            append path #"/"
        ]
        f: rejoin [path name ".obj"]
        unless exists? first split-path f [
            create-dir first split-path f
        ]
        save f save-obj
    ]; save-o
```

greggirwin

[06:39](#msg5dcba530091dd14a0eaef166)`^B` is char 2, so maybe that's something @qtxie can use to narrow the possibilities.

[06:44](#msg5dcba669ca778c1fbff3a4f0)Is there anything unusual about the data in the record maps?

[06:46](#msg5dcba6d0add5717a88fb7d3e)Another thing to try is `mold` the object to a temp string, and if you see that the file is corrupted, see if the string has the same problem.

ralfwenske

[06:58](#msg5dcba9a1eeb63e1a83a43ebb)It’s hard to debug as it occurs only occasionally. Also the foreign character varies - always some special glyph though. The data varies but just normal date, strings and number types- in the last case (^B) it was ending like this:

```
2388 [12-Nov-2019 12687.173928273272 13385.326649706762 13025.322960122394 12674.443657478358 12993.409953822376 14025.119190805652 13419.106064414165]
        2389 [13-Nov-2019 12863.003231554487 13302.571699813932 13073.38083829998 12689.637829467767 12952.15845130321 13993.343448125132 13445.488164615113]
)]
```

greggirwin

[07:03](#msg5dcbaad8ca778c1fbff3c59f)That's good info too then.

ralfwenske

[07:11](#msg5dcbac9752b73c7cb20bb572)And if I remember right when running the app that saves again it was saved correctly then. To be sure I will keep an eye on it and verify when it happens again.

[08:48](#msg5dcbc361ca778c1fbff46d84)

```
2389 [13-Nov-2019 12863.003231554487 13302.571699813932 13073.38083829998 12689.637829467767 12952.15845130321 13993.343448125132 13445.488164615113]
    )ú]
```

…in case this rings some bell...

[09:39](#msg5dcbcf6835889012b1fd4672)I can confirm that when a defective file was saved and I run the unmodified program again the saved file is loadable. So it seems to occur randomly. btw. the files are around 300KB in size. (…and on MacOS)

hiiamboris

[11:51](#msg5dcbee47c26e8923c418a2c0)There were a few GC-related fixes recently - https://github.com/red/red/pull/4093 and https://github.com/red/red/commit/0d25e8d63b0c24c719221d5530e71de619c7cc61 on the master, https://github.com/red/red/commit/fa22cd7f3709f06bb620803e433b1348c5f2976f on fast-lexer

Plus there's a PR https://github.com/red/red/pull/4097 waiting, that fixes some memory corruption cases in series operations

It would be interesting to see if that bug appears after all these fixes are in the master build

ralfwenske

[12:23](#msg5dcbf5dc5eb2e813db182245)Thanks @hiiamboris I will keep an eye on it when using the new builds.

## Friday 15th November, 2019

meijeru

[10:31](#msg5dce7e8ae75b2d5a19d7e37a)Bug or feature: `dehex` does not accept hex values greater than `7F`. In Rebol2 `dehex "%E9"` is e acute (`é`), whereas in Red, it remains `"%E9"`.

[10:32](#msg5dce7ed8c26e8923c42b8c6f)In Rebol 3, it is transformed into the two-character equivalent of the UTF-8 pair `C3A9`, which is even stranger...

hiiamboris

[10:40](#msg5dce809968ad1c4a0fcde2a3)looks like it wants hexed UTF-8 input?

Oldes

[11:23](#msg5dce8ac5fd6fe41fc08b201e)@meijeru here is R3's related issue https://github.com/rebol/rebol-issues/issues/1986

toomasv

[12:01](#msg5dce937c091dd14a0ec42b84)Convoluted workaround:

```
de-hex: func [hex][
    to-char to-integer load rejoin [
        "#" head insert next "{}" pad/left/with copy next hex 8 #"0"
]]
de-hex "%E9"
;== #"é"
```

[12:41](#msg5dce9cef52b73c7cb221256f)Improved:

```
de-hex: func [hex /low][
    hex: copy next hex 
    if any [low 2 = len: length? hex] [
        hex: pad/with/left hex 8 #"0"
    ] 
    hex: load rejoin ["#" head insert next "{}" hex] 
    to-char either any [low len = 2] [to-integer hex][hex]
]

>> de-hex "%E9"
== #"é"
>> de-hex "%C3A9"
== #"é"
>> de-hex/low "%C3A9"
== #"쎩"
```

meijeru

[13:33](#msg5dcea92aadd5717a8811d670)I encountered this in the frame of Q-encoding (quoted printable), which is used by e-mail transmission, and where non-printable and non-ASCII characters are encoded as `=XX`. I found the same workarounds.

toomasv

[13:39](#msg5dceaa8150010612b2c26c9e)Instead of `load rejoin ["#" head insert next "{}" hex]` there should be `debase/base hex 16` of course. :flushed:

## Sunday 17th November, 2019

ralfwenske

[02:51](#msg5dd0b5abfd6fe41fc09a566a)@hiiamboris regarding :point\_up: \[November 13, 2019 1:43 PM](https://gitter.im/red/bugs?at=5dcb7bc5eeb63e1a83a2f8ed)  
I just tested with latest red - unfortunately the issue is still there:  
`)Ò]` was in one of two saved files (same code, just different data).  
After deleting the `Ò` character (using an editor) both files could be loaded again.  
`Red 0.6.4 for macOS built 17-Nov-2019/2:22:27+10:00 commit #88b3ff0`  
Let’s hope for red/red#4097 .

## Wednesday 20th November, 2019

BenStigsen

[21:45](#msg5dd5b403167c4f62b78b96cd)Hi, I'm not sure how or if it's even possible (although, I'm guessing it is), how do I compile my Red script / application without the console opening after?

[21:45](#msg5dd5b4100bb46a64a5f3d7dd)Currently after compilation, when I click the .exe file, the console also opens

greggirwin

[21:46](#msg5dd5b41eefffeb3b8a12b612)Add `-t windows`.

BenStigsen

[21:47](#msg5dd5b484bc163f62b635dced)Oh, yep, that fixed it! Thanks :D

greggirwin

[21:50](#msg5dd5b51ae7cce550f591d7e5):+1:

## Tuesday 26th November, 2019

Oldes

[12:39](#msg5ddd1cf31659720ca8ad0bfc)@dockimbel which result is the correct one?  
`Rebol3`:

```
>> parse "aabb" [some [#"a" reject] copy rest to end] rest
== "abb"
```

`Red`:

```
>> parse "aabb" [some [#"a" reject] copy rest to end] rest
== "bb"
```

toomasv

[13:15](#msg5ddd258255066245981bd73a)@Oldes , did you use fresh console?

```
>> parse "aabb" [some [#"a" reject] copy rest to end] rest
*** Script Error: rest has no value
*** Where: catch
*** Stack:
```

Which makes sense as `rest` should never be set.

Oldes

[13:16](#msg5ddd25a66a85195b9eab8d03)Looks like I'm not:)

[13:19](#msg5ddd265855066245981bdb7a)@toomasv so `parse "aa" [some [#"a"] reject]` should be `false`, right?

toomasv

[13:19](#msg5ddd266d6a85195b9eab9323)Yes

## Sunday 1st December, 2019

Oldes

[16:09](#msg5de3e5b9c3d6795b9f049e71)I'm still not sure if I get the `reject` key word correctly... what is difference between `reject` and `fail`?

[16:16](#msg5de3e76c9319bb5190c3db61)Is this correct result?:

```
>> parse "ab" [some ["a" fail "b" p: (probe p)]]
""
== true
```

hiiamboris

[16:28](#msg5de3ea1b05eec2433db55748)It's a mess. See https://github.com/red/red/issues/3478.

[16:29](#msg5de3ea4f5ac7f22fb5410817)There's a whole lot of parse-related issues there waiting, in fact.

Oldes

[16:55](#msg5de3f07332df1245cbc515b3)Hm.. I would need more time to meditate over it ;-)

hiiamboris

[17:02](#msg5de3f21d6a85195b9edc4ee9)In current implementation `fail` set a flag that after leaving `[]` block it should stop. But when it reached that, `"b"` was already processed and it returned true because the input is at the `end`.

[17:03](#msg5de3f2795ac7f22fb5414640)Or something like that... ;)

Oldes

[18:17](#msg5de403bd55066245984ce86a)I was somehow naturally expecting, that `fail` will stop parsing not matter how deep inside the rule is and simply return false.

hiiamboris

[18:30](#msg5de406bf55066245984d0008)Well, you're not the only one ;)

## Monday 2nd December, 2019

LFReD

[16:20](#msg5de539bd6a85195b9ee57cd5) ... continuing from red/red

I have two issues now.  
1\. When saving a hash! of 75,000 strings using save/all in Red, it doesn't work (yet). So I convert the hash to a block! and save that;

```
saveit: does [

    dbsave: to-block db
    save %db.txt dbsave
    dbsave: copy [] 
    ]
```

2\. When I use that function, it only writes the first 512 kb of the db block and stops.

Oldes

[16:30](#msg5de53c2026eeb8518f568bb5)I cannot reproduce it.

LFReD

[16:30](#msg5de53c2732df1245cbce4916)@Oldes

This function works fine the first time it's called, but only saves 512kb of data the second time

[16:30](#msg5de53c2a08d0c961b7d9d5ec)saveit

[16:30](#msg5de53c2c08d0c961b7d9d5ef)saveit

Oldes

[16:31](#msg5de53c4b6a85195b9ee590a9)

```
>> saveit
>> saveit
>> length? db2: load %/a/db.txt
== 75000
>> db2
== ["user1" "pred1" "val1" "user2" "pred2" "val2" "user3" "pred3" "val3" "user4" "pred4" "val4" "user5" "pred5" "val...
>> db
== ["user1" "pred1" "val1" "user2" "pred2" "val2" "user3" "pred3" "val3" "user4" "pred4" "val4" "user5" "pred5" "val...
>>
```

LFReD

[16:31](#msg5de53c6b46397c721c737daa)yeah, the block in memory is fine, it's the %db.txt file that has the issue.

hiiamboris

[16:32](#msg5de53c8d6a85195b9ee59444)What build are you using?

[16:32](#msg5de53c9732df1245cbce4c72)`>> about`

LFReD

[16:32](#msg5de53ca0550662459855adab)stable

Oldes

[16:32](#msg5de53ca7d75ad3721d3eaa42)

```
>> last db
== "val25000"
>> last db2
== "val25000"
```

hiiamboris

[16:32](#msg5de53ca71659720ca8e71805)That explains it ;)

LFReD

[16:38](#msg5de53e0126eeb8518f5698a1)Red 0.6.4 for Windows built 21-Nov-2018/16:40:38-08:00 commit #755eb94

hiiamboris

[16:40](#msg5de53e641659720ca8e727ce)You should update. A whole year has passed.

LFReD

[16:55](#msg5de54214b065c6433c25a43a)So, i f the binary is buggier than the latest build, maybe time to update the binary?

hiiamboris

[16:56](#msg5de542239319bb5190cda894)It's always buggier ;)

LFReD

[17:11](#msg5de545ddc3d6795b9f0e5f42)Maybe it should be less buggier if you're introducing Red to noobs like me ;)

[17:13](#msg5de54626c3d6795b9f0e61be)I'm an end user.. programming languages are tools to me, like a hammer. Oh, my hammer isn't working? Time for a new hammer!

[17:15](#msg5de546b5f65fec1c8eac9f71)Which is how I found Rebol.. now there's a hammer!

hiiamboris

[17:18](#msg5de5475808d0c961b7da3374)It's a long way ahead of Red. We can't just exorcise the bugs away ;)  
I agree that calling the old build "stable" is somewhat off. I don't know from where this practice came, but here we usually fix bugs, not introduce new ones, so every new build is better, and "stable/nightly" naming doesn't make much sense.

LFReD

[17:19](#msg5de5478ac3d6795b9f0e6e20)I understand it's alpha, and there is really no 'stable' version.

henrikmk

[17:20](#msg5de547d055066245985608f7)there can always be bugs. the importance is whether the bugs are fixed.

LFReD

[18:00](#msg5de55138c3d6795b9f0eb911)Ok.. that was the issue! Using current build and the problem magically disappeared.

greggirwin

[19:03](#msg5de5600126eeb8518f579fde)We'll try to improve this situation.

## Wednesday 4th December, 2019

dockimbel

[19:02](#msg5de802e11659720ca8fb89c6)@hiiamboris  
&gt; I agree that calling the old build "stable" is somewhat off.

So you are advocating for having only auto-builds? So we drop milestones and version number? I'm sure followers will find that very helpful.

&gt; I don't know from where this practice came, but here we usually fix bugs, not introduce new ones, so every new build is better, and "stable/nightly" naming doesn't make much sense.

Can you explain what you mean by "here"?

hiiamboris

[19:48](#msg5de80d7205eec2433dd3d8c0)No I mean maybe change the name to "milestone builds" or "historical builds" or something. "stable" doesn't fit, does it? But what those stable builds are for, anyway? If there's a point in keeping them, maybe we should explain it on the download page and make a note that "nightly" builds are likely more robust. People outside do not know this, and those who look for less bugs choose to use a build with more bugs. It's not the first time I notice it ☻

[19:53](#msg5de80ed39319bb5190e08fd8)I imagine "stable/nightly" makes sense if you have a mature project and you fix features at some point and do extensive beta testing, then call that build "stable", while continuing to work on a nightly one.

dockimbel

[20:55](#msg5de81d3fd75ad3721d546969)&gt; I imagine "stable/nightly" makes sense if you have a mature project and you fix features at some point and do extensive beta testing, then call that build "stable", while continuing to work on a nightly one.

That is exactly what we are doing (though in an alpha software context). We do a huge testing effort for stables, including a lot of manual regression testing on many View demo scripts from red/code and /tests folder that cannot be automated. By definition, stables are more trustable than automated builds, as they go through intense testing, plus we try to squeeze in as many bug fixes from the tracker as possible given the available time. We go through a freezing period where we stop adding any new feature, then go through full testing. If we find any new bug or regression, we fix and do the full testing again. Once we are satisfied with the result, we do the release.  
The stable releases are meant for newcomers, to ensure that they can run the demo and test scripts without any bad surprise. The automated builds are of random quality, especially on View parts, as that requires manual testing for regressions.

[20:57](#msg5de81db11659720ca8fc4d94)So in a nutshell, stables are builds of much higher quality than automated ones, in the sense that they can be trusted to be more stable overall.

[21:03](#msg5de81f12c3d6795b9f23468d)So, stable builds are expensive to do for us, if we could avoid making them, that would save significant time and energy, but I really don't see how it would be better for newcomers.

[21:06](#msg5de81fe5d64a052fb6b73f9a)That said we haven't made a new one since a year. We usually tie a new release with a new big/significant feature. For 0.6.5, the plan was to focus on the Red console, by adding a plugin API and separate console builds for direct download. Given that we have spent a lot of time on other tasks, we'll probably just keep the direct download part and release it as soon as we can merge the current main dev branches to master (mainly `fast-lexer`).

hiiamboris

[21:07](#msg5de8202bb065c6433c3ae75f)I see. Good to know ;) Do you think we could also somehow automatically cherry-pick bugfixes into stable builds from the nightly branch? At least those that `git` can manage without manual intervention?

dockimbel

[21:11](#msg5de821075ac7f22fb55fb0cc)Doable, but that would require a lot of manual testing for regressions after merging those commits. I think it would be tricky to select the right ones without creating issues. There's currently 1123 commits on master since 0.6.4 release.

hiiamboris

[21:13](#msg5de821846a85195b9efb1cd7)Yeah makes sense. That's why I wanted to build a fully automated View testing tool ;) Gregg told me to wait for your approval ☻

dockimbel

[21:14](#msg5de821b19319bb5190e105f1)You can give it a try if you want. If all scripts in /tests, red/code/scripts and red/code/showcase can run without problem, then we can re-release 0.6.4 with the added fixes and make a nice blog entry about it. ;-)

hiiamboris

[21:14](#msg5de821c51659720ca8fc65ae)Here's what I was thinking of: :point\_up: \[November 3, 2019 1:07 AM](https://gitter.im/red/GTK?at=5dbdfe3a9c39821509d079fd)

[21:16](#msg5de8222e46397c721c88f2d5)It's a big effort. And though I don't think we can escape building such a tool, but only you know when is the right moment for it :)

dockimbel

[21:20](#msg5de82321c3d6795b9f236735)&gt; That's why I wanted to build a fully automated View testing tool ;)

That would be nice, but with native widgets, it's difficult to make a test suite that can work reliably on different machines with different flavors of the same OS, or just different user settings. We would need an additional cross-platform widget-set for that (we have that in our plans).  
Though, there's already the so-called \_test_ backend, that provides a null backend for testing purpose only. It's experimental but should be usable for writing tests for most of VID features and mezz parts of View engine.

hiiamboris

[21:24](#msg5de823fb08d0c961b7ef7ddd)I don't see a problem there. There should be a per-OS set of adjustments indeed, but the point is if it's a `field`, it's a field on any platform, so it can be tested.

`test` backend on the other hand will test itself, not the real behavior of other backends, so I do not consider it perspective.

dockimbel

[21:24](#msg5de8240008d0c961b7ef7dea)&gt; It should be able to  
&gt; simulate keyboard &amp; mouse (and one day - touch) events  
&gt; analyze the actually displayed face contents and compare it's properties with facets data

&gt; Mostly it boils down to checking these conditions:  
&gt; actors being triggered as expected  
&gt; events data is filled as expected  
&gt; facets being changed as expected

The \_test_ backend should be able to do that already, you should give it a try if you haven't yet. Feel free to extend it to cover more features, it's there for that.

hiiamboris

[21:27](#msg5de824bef65fec1c8ec1ecc5)As an example, how can you test for regression \[of this bug](https://github.com/red/red/issues/4162) on a test backend? It only appears on W7 where layered windows are used.

dockimbel

[21:28](#msg5de824f7d64a052fb6b761db)&gt; test backend on the other hand will test itself, not the real behavior of other backends, so I do not consider it perspective.

Right, but there is value in being able to test the backend-independent parts like VID on a headless server. ;-) Then maybe a "T" pipe is needed, to mirror all inputs and changes done on a real backend to the test backend (just thinking loud). So we could use the same tests to run on a headless server (test backend) and the real backends.

hiiamboris

[21:29](#msg5de8252fd64a052fb6b763e9)Also a purely behavioral example: https://github.com/red/red/issues/3563

[21:30](#msg5de8257808d0c961b7ef8a57)So one of the questions then is, what should I not include into the real View testing tool, that a test backend can handle better.

dockimbel

[21:33](#msg5de8261432df1245cbe3d18b)I think it's very expensive and complex to test for regressions on such cases. Maybe have a look at what other GUI frameworks based on native widgets do for testing? I don't remember seeing any notable testing framework for native GUIs, but maybe there are some to study?

[21:33](#msg5de8263b26eeb8518f6a2213)&gt; So one of the questions then is, what should I not include into the real View testing tool, that a test backend can handle better.

Anything that is not directly dependent on the platform and that is slow to test. The test backend can be way faster to use than real ones.

hiiamboris

[21:36](#msg5de826ced75ad3721d54aace)What's so expensive about simulating a few real mouse events and running screenshot analysis on a set of rules?

[21:38](#msg5de82759c3d6795b9f238257)There can be even a recording mode that will record all input actions, but I'm not sure if that will worth it. Probably simpler to just write events by hand.

dockimbel

[21:38](#msg5de8276e1659720ca8fc8b9d)I doubt the robustness of the screenshot approach across the many variations of Windows instances (to name the worst case for such testing). Even simple common variation like changing the default scaling factor would be a show-stopper for such an approach, wouldn't it?

hiiamboris

[21:39](#msg5de827a3f65fec1c8ec20320)Not at all. It didn't stop my `base-self-test`, did it? And it was fairly simple :)

dockimbel

[21:40](#msg5de827e0d64a052fb6b774b6)I think we had some issues with those tests at the office on some of our W7 instances, though I'm not sure what was the cause. ;-)

[21:43](#msg5de828856a85195b9efb4a80)@qtxie Do you remember the kind of issues we had with `base-self-test` tests at the office?

hiiamboris

[21:43](#msg5de8288e9319bb5190e12f2e)Hehe :) Well, that's solved by the idea of computing a compliance score. A rule can match very strictly, or to some extent... or not match at all...

[21:44](#msg5de828bd32df1245cbe3e84d)I remember you've had some improperly reported dpi on W10 with scaling factor 200%. And that was a Red issue :)

dockimbel

[21:45](#msg5de828dc6a85195b9efb4d40)Possible yes, I remember something along those lines.

hiiamboris

[21:47](#msg5de82978d75ad3721d54c05e)Anyway, think about it and let me know :) I'd love to do this tool.  
The general idea is - if I, human, can verify a rule, then my code can do that too. So, I don't see any show stoppers there ;)

dockimbel

[21:48](#msg5de8299ed64a052fb6b77fb8)If you think that the screenshot approach could work well enough on different Windows instances, then go for it. Having to do manually regression testing on View is slowing down the work on View significantly. Could such testing framework be created only at mezz level or would it need some invasive surgery in View backends?

hiiamboris

[21:49](#msg5de829e632df1245cbe3f0b1)No surgery, but at some point I'm sure I'll have to make routines of image analysis functions, to speed it up.

dockimbel

[21:50](#msg5de82a0cd64a052fb6b781c0)As long it's not invasive in View, not problem with extra R/S code.

hiiamboris

[21:50](#msg5de82a23d64a052fb6b7829b)Indeed. Thanks for your thoughts and approval ;)

dockimbel

[21:53](#msg5de82acc46397c721c8932ad)Well, if your testing framework is as good as you think it would be, then it's me who should be thanking you. ;-)

hiiamboris

[21:54](#msg5de82b22d75ad3721d54cb7f)☻  
Do you think the new D2D draw branch will help us get rid of layered windows? Or it's irrelevant?

dockimbel

[22:01](#msg5de82cbe05eec2433dd4b59b)@qtxie is the expert on D2D and layered windows. They should not be related. We needed layered windows on W7 to simulate transparency (at high cost), and IIRC, we don't need them in W10 which has proper transparency support. The work on D2D is to replace GDI/GDI+ as Draw backend.

[22:03](#msg5de82d1605eec2433dd4b919)OTOH, we also plan to use the D2D backend to create some "virtual faces" (not OS window-based) in a new "canvas" widget, for fast and smooth hardware-accelerated animations.

henrikmk

[22:05](#msg5de82d916a85195b9efb6fe1)that last bit with virtual faces sounds good, @dockimbel

[22:06](#msg5de82de55ac7f22fb560138c)I'm noticing that lots of people post pictures of rendering differences between GDI and D2D, so I suppose one shouldn't just rely on cross-API pixel consistency, if GDI will continue to be supported.

dockimbel

[22:09](#msg5de82e858e906a1c8d6dd0ef)@henrikmk I thought Pekr would be the first one to jump on that. ;-)

henrikmk

[22:10](#msg5de82ed7c3d6795b9f23b8ef)@dockimbel with the GDI/D2D bit?

dockimbel

[22:10](#msg5de82eecc3d6795b9f23b9e7)Virtual faces/canvas part. ;-)

endo64

[22:11](#msg5de82f18c3d6795b9f23bb74)"virtual faces" are like DDraw surfaces?

dockimbel

[22:13](#msg5de82f84d75ad3721d54eed4)I am not aware of the particular rendering differences. I just know that the early tests we did showed that we can get stable 60 fps glitch-free animation on D2D and not on GDI. As I said above, @qtxie spent quite some time studying that, so he could better answer the related questions.

henrikmk

[22:18](#msg5de830afd64a052fb6b7b20e)@dockimbel oh, ok. :-) I guess I just really want a good, hardware accelerated REBOL/View clone without any ties to underlying UI kits. that's IMHO the correct way to build a powerful graphics platform that is quick to develop GUI engines on top of.

Recently, I've been prototyping a vertex constraint based UI in REBOL only using DRAW, to see whether it makes sense to do resizing that way (and I think it does). For that, it was necessary to write a very small mini-View, which simply presented faces as boxes of overlapping regions. But with more work, you could get a full-blown View clone.

dockimbel

[22:18](#msg5de830af6a85195b9efb8454)@endo64 Surfaces should correspond to "canvas" in the View jargon, and the "virtual faces" I mentioned are purely View constructs, so virtual sub-areas in a surface, a bit like gobs in R3.

[22:19](#msg5de830f81659720ca8fccf4b)We can have both classic native GUIs \_and_ GPU-powered GUIs.

## Thursday 5th December, 2019

endo64

[00:24](#msg5de84e306a85195b9efc589d)\[!\[red-console.gif](https://files.gitter.im/red/bugs/CvsY/thumb/red-console.gif)](https://files.gitter.im/red/bugs/CvsY/red-console.gif)

[00:25](#msg5de84e90d64a052fb6b8847a)Can someone confirm above bug? I'm on Win10 / CLI, escape key doesn't clear the refinement that is completed by tab key.

[00:26](#msg5de84ea955066245986c3eee)No issue on GUI console.

greggirwin

[00:29](#msg5de84f515ac7f22fb560ecce)Confirmed.

## Friday 6th December, 2019

GiuseppeChillemi

[05:44](#msg5de9ead0b065c6433c47f34f)I am reading you about automated gui test. This let me think about having a window mirrored remotely with or without user interaction possible or a window opened remotely and not locally. Is something like this possible/planned?

## Friday 13th December, 2019

henrikmk

[19:31](#msg5df3e6fbe7265623013b9159)I'm trying out the D2D branch, but build.r hanged (ed: hang solved) during the call to the encapper, and I have to force quit, which for me is the classical CALL stability issue with REBOL/View, which requires some workarounds.

Turns out, I had not saved the changes to the encap-paths.r with other than default paths, but this then strands encap inside the CALL, and you can't see any error messages, so a new user might not understand what's going on, as you are not told what happens, if the encap-paths.r file is wrong.

I've found that changing:

```
call/wait reform [encapper "precap.r -o" bin/:red]
```

to:

```
o: make string! ""
call/wait/output reform ["cmd&" encapper "precap.r -o" bin/:red] o
```

with both /output and "cmd&amp;" being required.

helps for me. However, different REBOL versions might require different fixes, so I'm not sure if it should go in there, or if this issue should be mentioned in the readme? I.e., "if encapper hangs, please check that your encap-paths.r is correct", or something.

hiiamboris

[19:38](#msg5df3e89dac14cc652c7ab031)You make it sound like there's a lot of people with Rebol SDK ;)

dander

[19:59](#msg5df3edacce2b2e652bce8854)A while back there was talk about \[opening up the SDK](https://www.red-lang.org/2018/03/red-rebol-carl.html) anyone know what happened with that?

GiuseppeChillemi

[22:02](#msg5df40a580dc628523e2f1007)Bo has tried to talk with Carl but I don't know how it ended.

greggirwin

[22:07](#msg5df40ba7c6ce6027ebb7b9e7)Thanks @henrikmk. There aren't many who use the SDK, but it's good to note. Not sure if it's in a wiki page on building already or not.

## Monday 16th December, 2019

endo64

[22:47](#msg5df80988578ecf4b1fb6e16c)I'm using the SDK to compile Red every few days, `call` issue didn't appear after this commit https://github.com/red/red/commit/6aa92f6afe50772f82586e8e58e53e458841a9b3

henrikmk

[22:52](#msg5df80a900616d6515e4fc3fe)@endo64 interesting fix. never considered that.

endo64

[22:53](#msg5df80af942784416abfcd5bd)@henrikmk That was the only fix worked for me (on 2.7.8.3.1), I put `call/show ""` almost all my R2 scripts because eventually I use `call`.

henrikmk

[23:07](#msg5df80e35c6ce6027ebd3b3aa)@endo64 yeah, ok. I have some other fixes, because CALL is genuinely unstable for me and one of them is to precede the call string with "cmd&amp;"

greggirwin

[23:51](#msg5df8188255d939230022b534)I use basically the same trick as @endo64, with a wrapper, and a `prime-call-console` func that initiates it that way once if `call` is used. Some of those scripts can be called a \*lot\*, and this avoids the overhead and flashing window if it ends up not being used.

## Wednesday 18th December, 2019

Oldes

[08:58](#msg5df9ea200cb24d1d44dd4c90)Given the discussion in the /help room, I believe, that `copy/part` could work with negative pairs too, to be consistent with negative integers. Now:

```
>> i: make image! 4x4  copy/part tail i -2x-2
== make image! [0x0 #{}]
```

while I think it could easily give image with 4 pixels (bottom right corner of the original image).

loziniak

[09:00](#msg5df9eab18dfce538b5c8aca1)Just cross-posting, because I've spotted a bug, and it's not GTK-related, as I thought initially:  
https://gitter.im/red/GTK?at=5df8f859ac14cc652c9d64db

hiiamboris

[09:56](#msg5df9f7bc49314a1d459b2033)On W7, after `-r`, it crashes when I: start it, click the button, close it.  
`*** Runtime Error 1: access violation` (and the same error dump as reported, with `-d`)

loziniak

[14:02](#msg5dfa318d0cb24d1d44df332a)ok, bugs reported :-)

hiiamboris

[14:03](#msg5dfa31c80cb24d1d44df3409):+1:

greggirwin

[20:09](#msg5dfa8790b1701e50ca48e558):point\_up: \[December 18, 2019 1:58 AM](https://gitter.im/red/bugs?at=5df9ea200cb24d1d44dd4c90) @oldes, that should just be a small change to `image!` `copy` action, yes? I don't see a reason not to do that. e.g. imagine selection/cropping features in drawing GUIs. Easy enough to use `sort` as well, if we find there are issues with this.

## Thursday 19th December, 2019

Oldes

[10:28](#msg5dfb50db44e1fb33f6f179d8)I've created a wish for it: https://github.com/red/REP/issues/59 .. but I completely understand it is not a priority for now.

[11:12](#msg5dfb5b1a44e1fb33f6f1c5d8)`func` native does not copy the spec block like `function` native does:

```
>> s1: [a b] s2: [a b] f1: func s1 [] f2: function s2 [] append s1 'c append s2 'c
== [a b c]
>> :f1
== func [a b c][]
>> :f2
== func [a b][]
```

[11:17](#msg5dfb5c3dc0c8ef301bdae356)This is related issue: https://github.com/red/red/issues/3171

## Friday 20th December, 2019

cdokolas

[09:32](#msg5dfc9520cf771f7708fcd77a)Hi! Got a (probably) false-positive on `gui-console-2017-8-3-49893.exe` from Windows Security scan just now. Want the details?

hiiamboris

[09:33](#msg5dfc955b49314a1d45acfdf1)your version seems 2 years old

cdokolas

[09:33](#msg5dfc9578e0131f50c97638e3)That sounds right. How to upgrade?

hiiamboris

[09:34](#msg5dfc95a70cb24d1d44ef803f)https://www.red-lang.org/p/download.html , "automated" builds

cdokolas

[09:39](#msg5dfc96e7090f1379681f27da)Ok. New gui-console executable generated (nice icon) and passed the Windows Defender scan. Old executable remains. Just delete?

hiiamboris

[09:42](#msg5dfc977b44e1fb33f6fa4122)Yep

cdokolas

[10:18](#msg5dfca00de0131f50c9767f18)thanks!

## Sunday 22nd December, 2019

GiuseppeChillemi

[23:26](#msg5dfffbaf44e1fb33f610693a)`find`, `replace` and `change` have no `return:` defined. Is it correct ?

## Monday 23th December, 2019

greggirwin

[03:13](#msg5e0030ce44e1fb33f611ad43)We can add them, but it's not critical right now. They are only used by `help` at this time.

GiuseppeChillemi

[05:35](#msg5e005219b1701e50ca6f474e)I don't need them, I am just reporting what I have spotted while analizing Red function spec blocks.

## Friday 27th December, 2019

hiiamboris

[13:46](#msg5e060b2389701b511d1cfeef)My `Red 0.6.4 for Windows built 20-Dec-2019/19:03:46+03:00 commit #544a6e1` GUI console crashed twice during 2 days on totally normal code. It's left idle for hours then I come, copy+paste some snippet and it closes. I'll switch to debug builds in hopes that the bug will produce some output.

Meanwhile, has anybody encountered instabilities in recent builds as well?

toomasv

[15:49](#msg5e06282407a1a67d1d6b0e18)Yes, my 18-Dec build tends to crash too if left unattended for some time.

greggirwin

[20:15](#msg5e066658d5a7f357e690aa21)There was an issue with that long ago. Sounds like a regression.

## Tuesday 31st December, 2019

ne1uno

[14:19](#msg5e0b58f6fd580457e7a0bbe3)fast-lexer-2019-12-30 d7958d8

[14:19](#msg5e0b58f66ff7ae03fc79c642)`either false [prints words-of system/words][print none]`

[14:19](#msg5e0b58f604a1900497df1714)&gt;\** Syntax Error: (line 1) invalid path at ]\[print none]

[14:19](#msg5e0b58f6d5a7f357e6b01c7f)&gt;\** Where: transcode

greggirwin

[20:08](#msg5e0baad4833c373f4d8a9d94)Thanks @ne1uno, likely work in progress that will be fixed by @dockimbel shortly.
