# Archived messages from: [gitter.im/red/help](/gitter.im/red/help/) from year: 2023

## Monday 2nd January, 2023

cosacam1

[00:07](#msg63b22050c9591d20d381f413)Happy New Year, Reducers! Question: Is it possible to define a global style so it can be used in different layouts?

greggirwin

[01:43](#msg63b236c9c4fec572d6653935)No, not yet. @rebolek or @Oldes had a `stylize` port, but it was never merged and it likely very out of date now.

cosacam1

[02:12](#msg63b23d76ff1fd121b32516e6)Rebol had stilyze, IIRC. And what about using a function? Something like `view [style f: field-style-func] ...`

[02:48](#msg63b245f9c4fec572d6655277)No, Rebol's stylize is not what I need

toomasv

[09:47](#msg63b2a8483b37dd2c115ccd49)@cosacam1 You can define your style directly in `system/view/VID/styles`, and then use it in different layouts.

ldci

[09:53](#msg63b2a99a51d2482e91ea7812)@toomasv @cosacam1. Yes use `extend system/view/VID/styles`

[10:01](#msg63b2ab5c8f8df4262ad278f3)@cosacam1. A sample:

```
Red[
	needs: 	 view
]

extend system/view/VID/styles [
	iosBtn: [
		default-actor: on-down
		template: [
			type: 'base
			size: 48x25 
			color: red
			data: 0
			actors: [
				on-create: func [face][
                	face/extra: object [
                      	fColor:  snow
            			bColor:  face/color
            			bSize:   face/size
            			radius:  to-integer bSize/y / 2
						lCenter: as-pair radius radius				
						rCenter: as-pair bSize/x - radius radius
						;--make default image (off)
						blk: compose [
							pen gray
                			line-join round 
                			fill-pen fColor box 0x0 (bSize) (radius)
                			fill-pen fColor circle (lCenter) (radius - 1)
                		]
                		bDraw: draw bSize blk ;--call draw method
                		bClick: func [face][     
                   			either face/data = 0 [
                    			face/data: 1 blk/6: bColor blk/14: rCenter
                    			][face/data: 0 blk/6: fColor blk/14: lCenter]
                    		;--update face image with draw
                			bDraw: draw bSize blk
            				face/image: face/extra/bDraw
                		]
                    ];--end of object
				];--end of create function
				;--update face to off after creation
				on-created: func [face][
					face/color: face/extra/fColor
        			face/data: 0
        			face/image: face/extra/bDraw
        		]
			];--end of actors
		];--end of template
	];--end of style
];--end of extend

;--for tests
comment [
view [
	iosBtn red 	 48x24 [face/extra/bclick face]
	iosBtn green 48x24 [face/extra/bclick face]
	iosBtn blue  48x24 [face/extra/bclick face]
]
]
```

## Wednesday 4th January, 2023

luce80

[10:49](#msg63b559d2378d512c1846179a)@ldci Nice! I have saved it.

[10:50](#msg63b559f18f8df4262ad78838)How can I retrive a previously defined reaction ?

hiiamboris

[10:57](#msg63b55b8c3b37dd2c1161e6df)You can stash it somewhere yourself. But what are you trying to achieve?

ldci

[11:01](#msg63b55c908f8df4262ad78e74)@luce80. Add events in actor block `on-down: function[face event] [ print 'default-on-down ]`

luce80

[11:02](#msg63b55cddc9591d20d388139b)When I use my `%stretchy.red` if I move a `loose` face and then resize the window it will re-assume its previous offset and size. How can I avoid this ?

hiiamboris

[11:19](#msg63b560df40557a3d5c5c68ac)You could check if last assigned (by reactions) size/offset changed since or not.

[11:21](#msg63b5612463c9fc72d30f9c0e)And for this case, `react?` may help you retrieve relation block.

luce80

[17:10](#msg63b5b2f3ff1fd121b32bb054)@hiiamboris @ldci thanks, I have updated my %stretchy.red to "pseudo"-support `loose`

## Thursday 5th January, 2023

cosacam1

[17:49](#msg63b70daf40557a3d5c5fba02)Hi. Thanks for your help about common styles (styles to be defined once and used in different views).  
I searched a little and found a Toomas solution to a similar question (I can't remember where) but basically it is like this:

[17:49](#msg63b70dc63b37dd2c116553f2)

```
common-style: [
    ; define your style or styles here
]

layout1: [
    ; blah blah
]

layout2: [
    ; whatever
]

insert layout1 common-style
insert layout2 common-style

; ...

either some-condition [
    view layout layout1
][view layout layout2]
```

[18:40](#msg63b719a9c4fec572d66e978c)Can I use MySQL or PosgreSQL with Red?

hiiamboris

[18:49](#msg63b71bbbff1fd121b32e66c4)https://gitter.im/red/database

toomasv

[18:55](#msg63b71d19378d512c1849a827)@cosacam1 it is a possibility, yes. But it would probably be more idiomatic to do it like this:

```
system/view/VID/styles/new-style: [template: [type: 'base size: 100x25 color: blue]]
layout1: [base beige new-style]
layout2: [new-style base beige]
show: func [cond][view either cond [layout1][layout2]]
show true
show false
```

hiiamboris

[18:59](#msg63b71e16ff1fd121b32e6c0c)better not to override `show` though

toomasv

[19:00](#msg63b71e3d0dba3574235fdc90)Ah, yes, sorry.

cosacam1

[19:39](#msg63b7278d0dba3574235fee45)Thanks both. BTW, in case one overrides some function name, is there a way to reassign it back?

hiiamboris

[19:52](#msg63b72a7140557a3d5c5ff336)only if you stashed the original value

cosacam1

[20:00](#msg63b72c5d63c9fc72d31324f5)I thought so.

## Friday 6th January, 2023

toomasv

[04:21](#msg63b7a1ba3b37dd2c1166649b)@cosacam1 In addition to what @hiiamboris said, and which goes about the global context, in local contexts (in objects and functions) you can refer to original values of words by refering to the original context (usually global). E.g. `system/words/show`if `show` was redefined in some local context.

cosacam1

[13:44](#msg63b825bfbe2c3c20c7368b67)in local context... but if I change show (for instance) in global context I loose the original (unless I stash it previously), right?

hiiamboris

[13:52](#msg63b8279d410c633d481157ad)yes

cosacam1

[13:59](#msg63b82934378d512c184b9c15)so we better don't mess with Red :D

[14:07](#msg63b82b06be2c3c20c73694b4)yesterday I visited a cousin of mine. He said excited "I wanna show you something". Then he asked ChatGPT3 to make a web application for selling goods in Red language (and he asked that in Spanish) . The AI did it and the answer started with `Red [needs 'web]` Is it possible? I tried but it didn't work. Is there some library that I don't know of?

Oldes

[14:09](#msg63b82ba2410c633d48115f99)No.. it is just that the ChatGPT3 knows nothing about Red but pretends that it does.

[14:10](#msg63b82be77de82d26161673a5)The correct syntax for `needs` in the header is for example: `Red [needs: 'view]`

cosacam1

[14:21](#msg63b82e60c4fec572d6708b12)ok. Anyway AI are learning Red, not only Python :) That's a good point. Since the very moment I saw homoiconicity in Rebol I realized it was a very good language for AI. Just imagine it creating `[new code]` from experience and `do` ing it when needed. That's autonomy, I guess.

hiiamboris

[14:29](#msg63b8305b8f8df4262add042d)or silicon madness ;)

cosacam1

[14:35](#msg63b831a7410c633d48116c24)haha

[14:40](#msg63b832f40dba35742361e336)well, it would be nice to have a WID (web interface dialect) in Red, as easy as VID. I wish I had time, knowledge and talent to enhance Red with things like ports, Android and... WID. C'mon Cosme, wake up!

hiiamboris

[14:49](#msg63b834e63b37dd2c11677e27)&gt; time, knowledge and talent

These three ship with a bonus package: responsibility ;)

cosacam1

[14:50](#msg63b83547410c633d4811736a)Sure!

ne1uno

[15:00](#msg63b837a50dba35742361ee1d)chatGPT may have been trained on private repo?

[15:04](#msg63b8386863c9fc72d3152729)maybe we should start worrying when it knows how to write correct tests for the code soup it emits

hiiamboris

[15:42](#msg63b8415c40557a3d5c62062f)@qtxie we don't have any way to list available font faces, do we?

zentrog:matrix.org

[17:37](#msg63b85c4040557a3d5c623ccc)I heard someone refer to ChatGPT as being like an undergraduate bullshit expert who didn't read the book. It's incredibly good at stringing together things that look like they go together, but it doesn't understand anything, and just makes stuff up. It probably put `'web` in there because the prompt asked for a web app

cosacam1

[17:38](#msg63b85caf3b37dd2c1167d81d)how can I populate a text-list data with files and folder names in some directory? I tried this

[17:39](#msg63b85cdd8f8df4262add63e6)

```
view [t: text-list data [] button [t/data: ll]]
```

[17:43](#msg63b85db1410c633d4811cda7)using also dir and list-dir instead of ll. They all print to the console. I also tried `... [t/data: load ll]` load dir and load list-dir with no avail.

dsunanda

[17:45](#msg63b85e570cd40c2e89c2ac7e)This will populate with everything in my current directory:

```
view [t: text-list data [] button [t/data: read %.]]
```

cosacam1

[17:48](#msg63b85efaff1fd121b330c8bd)Easy. Thanks

dsunanda

[17:56](#msg63b860b7fb195421bd70b17d)In programming, most problems are either trivial or impossible. With some problems, it can take some days to find out which it is.

cosacam1

[18:10](#msg63b86411c9591d20d38e11c4)better trivial than impossible

## Monday 9th January, 2023

bubnenkoff

[13:47](#msg63bc1affff1fd121b3381c19)I need generate complex map with some condition inside.  
I started with creation object

```
a: [1]
message: object [
	foo: 1
	flag: either (not empty? a) [true] [ false] ; some complex condition
]

to-json message
```

`But I for passing it to function I need to convert it to`map!`:`  
&gt;&gt; to-map object \[a: 1]  
\*\** Script Error: cannot MAKE/TO map! from: make object! \[]  
\`

hiiamboris

[13:51](#msg63bc1bf2d8678973f9a47770)convert to block first

[14:00](#msg63bc1e05d8678973f9a47c06)funny, I was sure there's a REP about map to object conversion but I can't find it :(

## Tuesday 10th January, 2023

bubnenkoff

[08:43](#msg63bd253c51d2482e91fed75c)@rebolek I can't understand how to use new `make-request` syntax.  
https://gitlab.com/rebolek/castr/-/blob/master/client-tools.red#L340

```
set 'make-request func [
		"Frontend for SEND-REQUEST using new format"
		data	[block! object!] "Dialect block or request object"
	][
		if block? data [data: to-request data]
		send-request/data/with/verbose ; verbose is for testing
			data/url
			data/method
			data/data
			data/headers
	]
```

If I right understand it should be like:

```
make-request/url/data to-url some_url 'POST message
```

but it do not works

rebolek

[09:27](#msg63bd2f69be2c3c20c7406b71)@bubnenkoff `make-request` is a front-end for `send-request` that uses dialect instead of ~10 refinements. So the correct syntax is:

```
make-request [POST http://some.url data]
```

bubnenkoff

[09:28](#msg63bd2fd0410c633d481b41d4)thanks!

rebolek

[09:35](#msg63bd31798f8df4262ae6cfff)@bubnenkoff anyway, I guess it's not going to work, there's something missing, let me fix it.

[09:58](#msg63bd36ca0dba3574236bd99f)@bubnenkoff I fixed some bugs in `%client-tools.red` so both `make-request` and `send-request` show work now. It's mostly abandonware as I was focusing on HTTP scheme for the IO branch which is superior to the `send-request`, however, IO branch is still not merged into master and I really don't know if my HTTP scheme is going to be used or not.

[09:59](#msg63bd36ecc4fec572d67a8ca4)Anyway, let me know if you have some troubles with `make/send-request`, so I can fix it.

bubnenkoff

[11:08](#msg63bd4745378d512c1855c9c3)thanks!

Kazzum

[19:37](#msg63bdbe8e40557a3d5c6ceeba)I got my first script working thanks to the help I got in this chat. Thank you to all involved.

hiiamboris

[19:47](#msg63bdc0cc410c633d481c7580)you're welcome

## Wednesday 11st January, 2023

bubnenkoff

[15:45](#msg63bed9b18f8df4262aea132d)is it possible to use foreach inside `collect`/`keep` like:

```
data: [
    aaa: [
        foo: [test] 
        customers: [] 

    ]

    bbb: [
        bar: [some-text] 
        bar2: [] 
    ] 

    ccc: [
        baz: [] 
    ]
]


gen-ui: function [] [
    ui-items: collect [   
        foreach [key value] data [
            keep compose/deep [
                    group-box (to-string key) [
                        ; I want to iterate value with foreach here and add it to UI (with keep)
                    ]
            ]             

        ]
    ]

    append ppp/pane layout/only ui-items
        
]

view [
    size 800x600
    ppp: panel  700x500 [below]
    do [
        gen-ui
    ]
]
```

hiiamboris

[15:47](#msg63beda298f8df4262aea141b)if you want foreach inside compose, add it there, possibly as an inner collect

## Thursday 12nd January, 2023

toomasv

[06:33](#msg63bfa9cefb195421bd7efec1)@bubnenkoff `below` in `ppp` VID is useless, as it is wasted already before layout is added to panel. Better maybe get rid of `do`and `gen-ui`, collect your items in (global) `ui-items`, insert `below` and set it directly as panel VID. Alternatively keep it as it is and insert `below` in `gen-ui` into `ui-items` before appending. Also you might consider using `compose/only` instead of `compose/deep`.

## Friday 13th January, 2023

bubnenkoff

[09:22](#msg63c122ebd8678973f9ae6f4d)Thanks for tips! But I still can't get any nested foreach. I tried to wrap it `collect` but it's also do not work:

```
ui-items: collect [   
    foreach [key value] data [
        keep compose [
                    group-box (to-string key) 100x100 [
                        ; foreach a [] [ ] ; 
                    ]
        ]   
        keep 'return          

    ]
]

view [
    size 900x600
    ppp: panel ui-items

]
```

toomasv

[09:45](#msg63c1284eff1fd121b341f4e4)@bubnenkoff E.g.:

```
ui-items: collect [   
	foreach [key value] data [
		keep compose/only [
				group-box (to-string key) (
					collect [
						foreach [k v] value [
							keep 'text keep form k 
							keep 'text keep mold v 
							keep 'return
						]
					]
				)
		]             

	]
]

insert ui-items 'below
```

[12:00](#msg63c147f8410c633d48237613)@bubnenkoff Innermost might rather be `keep compose [text (form k) text (mold v) return]`

bubnenkoff

[16:02](#msg63c180abd8678973f9af343a)Thanks!

toomasv

[16:12](#msg63c1830851d2482e91079cde)You are welcome!

## Saturday 14th January, 2023

luce80

[10:56](#msg63c28a790dba357423759e7e)from red/red  
@hiiamboris  
&gt;so you mean Red GUI console then  
&gt;easy.. just check `index?` of `system/view/screens/1/pane`, or `system/console/gui?`  
&gt;but generally if you don't want to quit, just don't use `quit`, use `unview`

Perhaps I badly explained myself  
`system/console/gui?` is always `true`, `system/view/screens/1/pane` does not seem "bullet-proof".  
My situation is this:  
I run a script "A" that runs script "B" ; if "B" fails a check, it should quit itself but also "A" but without closing Red GUI console if "A" was started from it. Or "B" could return \*something* (how ?) and then "A" should quit but without closing Red GUI console that "A" was started from.

[10:58](#msg63c28ad563c9fc72d328af8a)Perhaps `unview/all` ?

[10:59](#msg63c28b14be2c3c20c74a2561)But if "B" does not open any window ?

hiiamboris

[11:04](#msg63c28c3a378d512c185f6dcc)`do` returns the last evaluation result from the script, you can check it

[11:08](#msg63c28d3d3b37dd2c117b192c)or let B throw an error, catch it in A

luce80

[11:16](#msg63c28ef5d8678973f9b061fc)How can I early return from a script and with a result ?  
&gt;let B throw an error, catch it in A

Seems "ugly" anything better ?  
Still there is the problem of quitting without exiting the console ?

hiiamboris

[11:17](#msg63c28f62c9591d20d3a1094b)&gt; How can I early return from a script and with a result ?

e.g. `either early ['bad-result][do some code... 'good-result]`

[11:18](#msg63c28f967de82d26162a03bb)your script is just a block of code, you can do there anything you can in any other block

luce80

[13:12](#msg63c2aa4063c9fc72d328e982)So I must wrap all of it in a block whose last evaluation is passed as a result ? With "early" I mean something like `break` , `return` , `halt` , `quit` etc. that skips everything and exits.

hiiamboris

[13:15](#msg63c2aae1fb195421bd8420cc)since you don't care about leaking words, just leak another one, e.g. `result: ...`

[13:16](#msg63c2ab10ff1fd121b3440cba)but normally you have to define a wrapping `context` for data you don't export

[13:16](#msg63c2ab307de82d26162a3609)`context` supports `return` btw

luce80

[13:54](#msg63c2b40351d2482e9108fe1b)Ok, I like wrapping `context`s :) so the problem is now on "A". How can it distinguish if it was started from Red GUI console PROMPT and use `halt` or if not and use `quit` ?

hiiamboris

[14:19](#msg63c2b9e8ff1fd121b3442a91)in my opinion `halt` and `quit` should only ever be used in the program logic

[14:19](#msg63c2ba067de82d26162a4edb)if your script is not a standalone program, but a component, it should not use these

luce80

[14:37](#msg63c2be28410c633d48257a6a)B is a component but A is a standalone program that uses B. So how do you solve the problem ?  
B is also a required component so contributes to the program logic but that is not important. So how do you solve the problem ?

hiiamboris

[14:42](#msg63c2bf454bbc000f09409dc1)but if it's a program, why doesn't it know how it was run?

luce80

[14:48](#msg63c2c0c57de82d26162a5b2d)Please forgive my big ignorance and too old brain :) . How can my program know how it was run ? Or do you mean that a script started from the console prompt is not a program ?

hiiamboris

[14:53](#msg63c2c1f763c9fc72d32913b6)I mean, if you are using `quit` or `halt` then it must be a binary, or you must be the sole user of this script, otherwise you're creating headache for whoever runs it

[14:54](#msg63c2c226410c633d48258147)Even if you knew it was started from the GUI console, how do you know if user wants to quit or not?

[14:55](#msg63c2c277fb195421bd844bca)Or why should it use `halt`, primarily a debugging function? What are you even trying to achieve?

ne1uno

[14:56](#msg63c2c2af4bbc000f0940a40d)`attempt [unset? get 'system/view/VID]`

[14:58](#msg63c2c310c9591d20d3a16b5c)there are different behaviors running script, sendTO, pasting in console

[15:01](#msg63c2c3ccff1fd121b3443cf8)also interpreted encap compiled. there may not be a grand unified solution?

luce80

[15:02](#msg63c2c40f3b37dd2c117b7ebd) @hiiamboris I do not mind the user ;) . As I said the script must quit because it is not posssible to go on because of a failure, think of a division by 0 or segment fault or inexistent file or whatever.  
@ne1uno thanks, nice try, but `system/view/VID`is not `unset`whether I run my script from the `>>` prompt or from gui-console.exe

ne1uno

[15:02](#msg63c2c418c9591d20d3a16d83)not to mention /no-wait

hiiamboris

[15:07](#msg63c2c538410c633d4825875c)what you're describing doesn't warrant any special handling - if it's an error, let it be thrown

luce80

[15:11](#msg63c2c638378d512c185fd5e9)So if my program does 3D rendering and it can not load OpenGL or can not find a graphics hardware let it throw an error ? And THEN ? Should it render in ASCII art ;) ? And this is obviously only an example. What do to AFTER the FATAL error has occurred ?

hiiamboris

[15:13](#msg63c2c690ccd5355fcfdb9ed9)always `quit`

[15:14](#msg63c2c6b8c9591d20d3a1719a)if your program renders OpenGL, it doesn't have a GUI console attached

[15:15](#msg63c2c713378d512c185fd7cf)see that's why I asked what are you trying to achieve?

[15:15](#msg63c2c72ac4fec572d684bcc6)you being secretive and inventing various theoretical cases only wastes our time

luce80

[15:23](#msg63c2c909fb195421bd84576c)Here you are. If I `quit` a script started from the GUI console prompt it quits also the GUI console.  
&gt;if your program renders OpenGL, it doesn't have a GUI console attached

Really ? even if I used gui-console.exe to run it?

&gt;you being secretive and inventing various theoretical cases only wastes our time

Sorry for wasting your time. I do not mind being secretive , I simply tried to explain a scenario that is happening to me, not a theoretical case. I am trying to use my own script that you know of like `area-plus` but have trouble with this situation. That said I think that even "inventing various theoretical cases" could be quite useful since you do not know what will happen in the future.

P.S. I am not tring to use OpenGL...perhaps in the future I hope...

hiiamboris

[15:33](#msg63c2cb3851d2482e91092692)I still don't see why you would need `quit` then. Or what's stopping you from leaving your script using normal control flow like `if/either/unview/etc` or using exceptions like `catch/throw`.

[15:33](#msg63c2cb640dba357423761664)I mean sure you can hackishly figure out that GUI console is running. But it's not a good design.

luce80

[15:35](#msg63c2cbd73b37dd2c117b8c73)Please, can you tell me how can I hackishly figure out that GUI console is running and I was started from it? Since I do not want to be secretive this is the "guilty" code:

```
if system/build/date < 26-11-2022 [alert "A more recent version of Red is required !" quit ]
```

hiiamboris

[15:40](#msg63c2ccd3d8678973f9b0d5d5)which you could have rewritten instead as:

```
either system/build/date < 26-11-2022 [alert "A more recent version of Red is required !"] [
    normal execution...
]
```

luce80

[15:45](#msg63c2ce21378d512c185fe794)Ok, and then I will have an `error!` because of the missing feature or whatever the case, and then ? I can catch the error and then ?

hiiamboris

[15:47](#msg63c2ce88410c633d48259995)what error? your `alert` when closed resumes evaluation in the console

luce80

[15:48](#msg63c2cec17de82d26162a75d9);) which console? I was not started from console...or did I ?

hiiamboris

[15:48](#msg63c2ced451d2482e91092cc3)then it normally quits

luce80

[15:49](#msg63c2cf08ccd5355fcfdbaeb1)And quits also the console if I was started from it and that is quite annoying ;)

hiiamboris

[15:49](#msg63c2cf1a51d2482e91092d36)no, try `alert "abc"` in console

[15:49](#msg63c2cf22fb195421bd84629b)it doesn't quit

[15:51](#msg63c2cf700cd40c2e89d66c39)but if you insist on shooting yourself in the foot, GUI console initializes `gui-console-ctx/terminal` context when it's shown, so you can compare it between GUI console run and shell run, and find values there that would hint you that it's running

[15:52](#msg63c2cfa3378d512c185fead9)that ofc is internals and may change at any moment

luce80

[15:57](#msg63c2d0d24bbc000f0940bfaa)Ok, so I have to encapsulate all possibly failing code in conditional statements and let the program end on its own and return control to wherever it was started from...  
&gt;if you insist...`gui-console-ctx/terminal`

I insist :) .That is what I am trying to do since a few hours to no avail. Let's see if someone else has incurred in the same situation.

hiiamboris

[16:00](#msg63c2d18663c9fc72d329300e)you ever tried to use `throw` and `catch`?

[16:00](#msg63c2d1b13b37dd2c117b964e)or looked into `?? halt` ?

[16:01](#msg63c2d1e4fb195421bd84683f)again, you're only creating problems for yourself by fighting the language, when all the proper tools are right before you

luce80

[17:41](#msg63c2e947be2c3c20c74ad335)I think I succeded somehow ! :

```
write %scriptA.red {
Red []
if unset? do %scriptB.red [halt]
; anything else here...
}
write %scriptB.red {
Red []
if system/build/date < 26-11-2024 [
  alert "A more recent version of Red is required !" either system/options/script [quit][halt]
]
; anything else here...
}
do %scriptA.red
```

Still there is that annoying `if` but I could hide it inside a function.  
This will not kill your GUI console if you run it from there and will normally quit if run directly from gui-console.exe.

hiiamboris

[17:45](#msg63c2ea204bbc000f0940ee37)this won't work if you run scriptA with `--catch` (an explicit intent \*not* to close the console)

[17:45](#msg63c2ea2e410c633d4825cc71)but if you call that a success, okay, I won't try to bring you to your senses anymore :)

[17:46](#msg63c2ea8afb195421bd8493c5)in my console:

```
>> ? system/options/script
SYSTEM/OPTIONS/SCRIPT is a file! value: %/d/devel/red/init.red
```

ne1uno

[17:52](#msg63c2ebcec4fec572d684fd39)trying to catch the several ways to close is another can of worms besides loss of work from a crash.

luce80

[17:54](#msg63c2ec3bd8678973f9b11212)Ok, still waiting for a better solution.

hiiamboris

[18:01](#msg63c2ee13ccd5355fcfdbe58d)I already told you 2 times that `catch` and `throw` is by design solution to handle non local control flow ;)

[18:02](#msg63c2ee27be2c3c20c74adc3a)how hard can it be?

[18:02](#msg63c2ee3dccd5355fcfdbe5f7)`catch [if 'error [alert "message" throw 'oops]]`

luce80

[18:21](#msg63c2f2b163c9fc72d3296835)We are trapped in a loop and we cannot \*\*gracefully\** quit ;) !

hiiamboris

[18:22](#msg63c2f2e851d2482e91096b35)(:

## Monday 16th January, 2023

akbarnes

[03:41](#msg63c4c768378d512c186343f8)I've been playing with graphics following Daniel Schiffman's YouTube videos. I can export a canvas object to a PNG file with the following code

```
button "Export" [
        f: request-file/file %Tree.png 
        img: to-image canvas
        save f img
    ]
```

[03:42](#msg63c4c7ba63c9fc72d32c91ad)However, I'm limited to the resolution of the canvas object, which doesn't look good on paper.

[03:47](#msg63c4c8cdd8678973f9b43d7f)Is there some way around this? Maybe creating an invisible `base` object to paint on?

ldci

[08:36](#msg63c50c8763c9fc72d32d0ab3)Do you generate your drawing by yourself?

hiiamboris

[08:54](#msg63c510c1fb195421bd88488c)try `img: draw canvas/size * 10 compose/only [scale 10.0 10.0 (canvas/draw)]]`

bubnenkoff

[09:12](#msg63c514fc0dba3574237a1807)Is it possible to fill `data` during generation?  
I understand that `face` not exists at this moment, but do not how to access to it (if possible):

```
ui-items: collect [   
        keep 'drop-down []
        (
           foreach el [aa bb cc] [
                append face/data mold el
            ]          
        )
]

view [
    size 1200x600
    ppp: panel ui-items
 
]
```

hiiamboris

[09:18](#msg63c51669ccd5355fcfdf9d5a)VID has a \[data facet](https://github.com/red/docs/blob/master/en/vid.adoc#data)

bubnenkoff

[09:20](#msg63c516f44bbc000f0944bc33)Do not understand idea how to use it

hiiamboris

[09:21](#msg63c5172b63c9fc72d32d1edc)`view [drop-down data [stuff...]]`

bubnenkoff

[09:23](#msg63c5179e51d2482e910d2361)yes, but how to add data there on my case?  
`Script Error: face is unset in path face/data`

hiiamboris

[09:26](#msg63c51834410c633d482988c3)there's no `face` in my example

bubnenkoff

[09:32](#msg63c519ba410c633d48298b82)Am I right understand that you are suggesting me to run some code inside data block to get data there?

```
ui-items: collect [   
        keep  'drop-down data compose [ ( "sdf" ) ]
]
view [
    size 1200x600
    ppp: panel ui-items
   
]
```

hiiamboris

[09:42](#msg63c51c1b410c633d482990ac)just create the block and prefix it with `data`

bubnenkoff

[09:45](#msg63c51ca27de82d26162e7005)But where to place logic for it's filling?

hiiamboris

[09:45](#msg63c51cc6d8678973f9b4db2d)does it matter? place where it's convenient for you

bubnenkoff

[09:48](#msg63c51d5f3b37dd2c117f8973)Still can't understand idea...  
I know that I can fill it's by lavel like: `my-drop-down:`  
But I think you are meaning another....

hiiamboris

[09:52](#msg63c51e4a3b37dd2c117f8ad7)`ui-items` is just a block

[09:52](#msg63c51e5fc9591d20d3a58c34)you don't need labels to put block into a block

## Tuesday 17th January, 2023

fergus4

[15:51](#msg63c6c407adcb246d05973c2a)How do I get the unicode# for a character. I guess the oposite of "&gt;&gt; to-char 99  
\== #"c""

hiiamboris

[15:55](#msg63c6c50bfce37f655ff41a05)`to integer! #"c"`

fergus4

[16:00](#msg63c6c61133b1480548779af5)Thanks

## Wednesday 18th January, 2023

bubnenkoff

[09:13](#msg63c7b82dcdadaf23c4490d49)Still can't understand how to get code work(

```
ui-items: collect [   
    foreach key keys-of #(aaa: 1 bbb: 2 ccc: 3) [
        keep compose/deep [
                text (to-string key) return
                pad 0x-10
                (to set-word! rejoin ['ppp1- key]) panel (first random [red green olive blue]) [
                  (
                        foreach k [foo bar baz] [
                          keep button (to-string k)
                        ]
                      )
                
                ] 
        ]   
        keep 'return          

    ]
]


view [
    size 900x600
    ppp: panel ui-items
   
]
```

Issue with nested foreach

Oldes

[09:28](#msg63c7bbd22eb56c7441e9bf8c)Issue is not with `foreach`, but you not understanding how works `compose/deep`.

[09:38](#msg63c7be1fadcb246d05999194)You probably also do not understand, how `collect` works... maybe you should build your data using classic `append` first. But to fix your code, in the last paren in the `compose/deep` block, use this instead:

```
collect [
    foreach k [foo bar baz] [
        keep reduce ['button to string! k]
    ]
]
```

hiiamboris

[09:38](#msg63c7be2e0c80f05e1929c8c2)@bubnenkoff how the produced result is different from what you expect?

bubnenkoff

[09:42](#msg63c7bf134f767f65596d797c)@Oldes thanks! Looking at example...  
@hiiamboris it's simply not work with an error: `button has no value`

Oldes

[09:45](#msg63c7bfd41bc10223d55f3f8c)@bubnenkoff

```
ui-items: collect [   
    foreach key keys-of #(aaa: 1 bbb: 2 ccc: 3) [
        keep compose [
                text (to string! key) return
                pad 0x-10
                (to set-word! rejoin ['ppp1- key]) panel (first random [red green olive blue])
        ]
        ;; now build (collect) the panel's block and keep it...
        keep/only collect [
            foreach k [foo bar baz] [
                keep compose [button (to string! k)]
            ]
        ]
        keep 'return
    ]
]
```

bubnenkoff

[09:49](#msg63c7c0b133b148054879f47c)Thanks for explanation... trying to understand your explanation

ne1uno

[09:50](#msg63c7c103378e2f74498c58e6)'probe' will show you what it's doing

bubnenkoff

[10:02](#msg63c7c3a4fce37f655ff6776c)@Oldes oh... it seems that I understood how it's works! Never mind that it possible to do in this way

[10:36](#msg63c7cba4726b415e594a00e0)@Oldes I tried to add `field` and it's very strange that button change text, but `field` not. It's look like it's binded with last value:

```
ui-items: collect [   
    foreach key keys-of #(aaa: 1 bbb: 2 ccc: 3) [
        keep compose [
                text (to string! key) return
                pad 0x-10
                (to set-word! rejoin ['ppp1- key]) panel (first random [red green olive blue])
        ]
        ;; now build (collect) the panel's block and keep it...
        keep/only collect [
            foreach k [foo bar baz] [
               keep reduce ['button to string! k]
               keep reduce ['field 'with [text: to-string k ]] ; here
            ]
        ]
        keep 'return
    ]
]


view [
    size 900x600
    ppp: panel ui-items
   
]
```

it's print `baz` in every field.

Possible `with` should be used in another way...

Oldes

[10:42](#msg63c7cd1021f77a334d9721cd)@bubnenkoff when you don't want to use `probe` as it was recommended above, maybe you should use `? ui-items` and see, what code you have!

hiiamboris

[10:42](#msg63c7cd3121f77a334d972207)he won't see that the block wasn't copied though

Oldes

[10:43](#msg63c7cd6fc98ea74762a6e08d)@bubnenkoff use:

```
keep compose/deep [field with [text: (to-string k) ]]
```

instead of:

```
keep reduce ['field 'with [text: to-string k ]] ; here
```

hiiamboris

[10:44](#msg63c7cd9cd86fd34ee55eeff8)or copy/deep the whole `ui-items` when it's complete

Oldes

[10:46](#msg63c7ce02b1f383475e0a106e)Btw... if `k` from the `foreach` was local to the `foreach` code block, how it is in Rebol, he would not be so surprised.

hiiamboris

[10:47](#msg63c7ce2ac3f9cd24a95a77c7)yeah

bubnenkoff

[11:22](#msg63c7d65b0110ad104dd80cc9)heh... the next my question is how to do two-way binding with data?  
Let's assume that `[foo bar baz]` placed outside in word and I need way to modify their from `field`.

[11:25](#msg63c7d72cb1f383475e0a20fd)So `copy` here is break link to original data

hiiamboris

[11:31](#msg63c7d8a07bcbfb74311b30f3)but `field` cannot modify a block, only text

bubnenkoff

[12:03](#msg63c7e0147bcbfb74311b4232)So there is no way to do it's easy? And I need to write iterator that will collect all changed values back?

hiiamboris

[12:10](#msg63c7e1a6c98ea74762a706da)you can build your iterator upon `foreach-face`

[12:11](#msg63c7e1d6c3f9cd24a95a9cc0)&gt; So there is no way to do it's easy?

I suppose you could use field's `on-change` to backpropagate changes

[12:12](#msg63c7e248d86fd34ee55f16a3)but loaded data won't be bound, make sure to consider that

hilary888

[23:53](#msg63c886877bcbfb74311c8398)On Linux, when print the args passed to a red script , each word is quoted in a single quote  
assuming the args passed are `hey there`,

```
probe system/script/args
"'hey' 'there'"
```

On Windows, this doesn't happen.

```
probe system/script/args
"hey there"
```

The windows result is what I expected would happen on Linux.  
Is there something I'm missing?

## Thursday 19th January, 2023

rebolek

[08:33](#msg63c9006dc47d581062995802)Yes, you're missing properly working `system/script/args` and `system/script/options`. But don't worry, you're not alone, we all miss it! Red is still in alpha, it's just 12 years old language, so this will work eventually.

hiiamboris

[09:11](#msg63c9092ac47d5810629966a7)@hilary888 Linux doesn't pass the command line to Red process. Only an array of separated arguments. Red is simply being conservative when it reconstructs it.

Oldes

[09:52](#msg63c912e4c3f9cd24a95ce087)Actually there is just an array of arguments on Windows as well... Red is inconsistent when dealing with it.

hiiamboris

[09:54](#msg63c9135cc98ea74762a94cbd)You're wrong. On Windows Red gets the command line https://learn.microsoft.com/en-us/windows/win32/api/processenv/nf-processenv-getcommandlinew

[09:56](#msg63c913b5c3f9cd24a95ce299)https://github.com/red/red/blob/master/runtime/utils.reds#L20

[09:59](#msg63c914943031eb33618672c3)What you get in C's `main` was preprocessed for you by C runtime (which is inconsistent with Windows' own command line processing by the way).

[11:07](#msg63c9246a7bcbfb74311d9ca3)If anyone wishes to parse the arguments and unquote some of them, open a REP. Provide rationale and rules.

bubnenkoff

[11:10](#msg63c92531c3f9cd24a95d0061)How to inverse selection (unselect on second click)?

```
view [radio on-change [face/data: not face/data] ]
```

do not work...

[11:14](#msg63c92632726b415e594c8847)Also do not work

```
view [radio on-change [ if (face/data = true) [face/data: false ] ] ]
```

hiiamboris

[11:19](#msg63c9275b3031eb3361869977)A global event handler interferes with your code here. I would suggest not inventing a surprising UX and use checkbox instead of a radio button.

[11:26](#msg63c928e6b1f383475e0ca2b4)Or like this:  
!\[](https://i.gyazo.com/2e171b825d3f9311e98e69fe51672d4e.png)

## Friday 20th January, 2023

hilary888

[00:05](#msg63c9dabaec2bfc6286638dcb)thanks guys. I found that `system/options/args` works like I expected so I went with that instead

## Sunday 22nd January, 2023

bubnenkoff

[12:09](#msg63cd27748e760b51fd013b9d)It's seems that I do something wrong... why `face/text` is `none`?

```
ui-items: collect [   
		keep 'button "foo" keep/only [print face/text]
	 ]

view [
	panel: panel ui-items
]
```

[12:11](#msg63cd27f8fb5fe8552e430198)Same with:

```
ui-items: collect [   
		keep 'button "foo"  keep 'extra [ section: "My Foo" ] keep/only [print face/extra/section]
	 ]

view [
	panel: panel ui-items
]
```

hiiamboris

[12:17](#msg63cd295cfb5fe8552e43047a)use `probe` man

bubnenkoff

[12:19](#msg63cd29ee603e2b638722fe49)I tried probe face, the field `text` there is empty

hiiamboris

[12:23](#msg63cd2ac67740c84e4929a4e8)`probe ui-items`

bubnenkoff

[12:25](#msg63cd2b2c603e2b63872300be)yes, I see there is only block with words

[12:29](#msg63cd2c3bfb5fe8552e4309ca)`[button [probe face]]`

[12:34](#msg63cd2d52c2911455432db9a1)I have not ideas... For me it's right code

hiiamboris

[12:35](#msg63cd2da3603e2b6387230594)forgot `keep` :)

bubnenkoff

[12:41](#msg63cd2efb0c94855213c370f6)@hiiamboris I really do not understand where `keep` should be? `keep 'button "foo" keep/only [print face/text]`

[12:45](#msg63cd2ff6624f3f4330259265)oh...

[12:46](#msg63cd300f0c94855213c373e3)I understood)

```
ui-items: collect [   
		keep 'button keep "foo" keep/only [probe  face/text]
	 ]

view [
	panel: panel ui-items
]
```

hiiamboris

[12:53](#msg63cd31e38e760b51fd014ee0):+1:

## Monday 23th January, 2023

akbarnes

[03:32](#msg63cdffbf603e2b638724719a)Hi, is there a way to access help for commands in the view dielect?

[03:33](#msg63ce000c0c94855213c4dfd2)I’ve tried the obvious of help view/button but that doesn’t work

greggirwin

[03:43](#msg63ce0256ec2bfc62866af689)There has been chat over the years about how to support `help` for dialects. No conclusions, and few experiments. For now, the docs are your best bet:  
\- https://github.com/red/docs/blob/master/en/gui.adoc  
\- https://github.com/red/docs/blob/master/en/vid.adoc  
\- https://github.com/red/docs/blob/master/en/view.adoc  
\- https://github.com/red/docs/blob/master/en/draw.adoc

akbarnes

[03:43](#msg63ce0273d00f0d49472115ba)Gotcha

[03:43](#msg63ce027849431d6370110e3d)Thanks

bubnenkoff

[08:26](#msg63ce44a3cea934033447cbf7)I continue to experiments with `collect`. New problem. Can't understand how to attach `extra` to panel:

```
ui-items: collect [   
        keep 'panel keep 'red []  keep 'extra [ section: "My Foo" ] 
     ]

view [
    panel: panel ui-items
]   

probe ui-items
```

Also possible it should be like (but also do not work)

```
ui-items: collect [   
        keep 'panel keep 'red []  keep/only collect [ keep 'extra [ section: "My Foo" ] ] 
     ]

view [
    panel: panel ui-items
]   

probe ui-items
```

rebolek

[08:31](#msg63ce45de0c94855213c554bc)You don't `keep` the blocks:

[08:31](#msg63ce45e10c94855213c554c1)

```
>> ui-items: collect [   
[            keep 'panel keep 'red []  keep 'extra [ section: "My Foo" ] 
[         ]
== [panel red extra]
```

[08:32](#msg63ce462ccea934033447cebe)compare with this:

```
>> ui-items: collect [keep 'panel keep 'red keep/only [] keep 'extra keep/only [section: "My Foo"]]
== [panel red [] extra [section: "My Foo"]]
```

(not that it's the approach I would use, but whatever)

bubnenkoff

[08:34](#msg63ce467880dc214e32889754)Thanks! But what approach is better?

rebolek

[08:36](#msg63ce4703fb5fe8552e44ee91)

```
>> ui-items: collect [keep [panel red [] extra [section: "My Foo"]]]
== [panel red [] extra [section: "My Foo"]]
```

if there's something in the block you want to change, then use for example `compose`:

```
>> ui-items: collect [keep compose/deep [panel (color) [] extra [section: (name)]]]
== [panel red [] extra [section: "My Foo"]]
```

[08:37](#msg63ce472ffc90af03489acbe5)no need to `keep` each value separately

bubnenkoff

[14:55](#msg63ce9fe149431d6370123447)Could anybody test? Possible it's a bug. The follow code cause console hanging:

```
call-grow-rules-settings-ui: function [] [
    grow-rules-settings-ui: collect [   
        foreach key keys-of #(a: 1 b: 2) [
            keep compose [ ;
                    h5 (to-string key) return
            ]   

        ]
    ]

    append grow-rules-settings-ui-panel/pane grow-rules-settings-ui

]

view [
    size 900x600
    grow-rules-settings-ui-panel: panel []
    button "add" [ call-grow-rules-settings-ui ]

]
```

after press "add" button impossible to close console

rebolek

[14:58](#msg63cea09d21cada4343a50cf2)confirmed on Linux, it throws this error in a loop:

```
(redview:297882): GLib-GObject-CRITICAL **: 15:58:04.951: g_object_set_qdata: assertion 'G_IS_OBJECT (object)' failed
```

bubnenkoff

[15:00](#msg63cea12ad00f0d49472243b0)Heh. I forgot: `layout/only`  
Should be:

```
append  grow-rules-settings-ui-panel/pane  layout/only grow-rules-settings-ui
```

But strange that impossible to close console

hiiamboris

[15:25](#msg63cea6e57740c84e492c3d44)reported https://github.com/red/red/issues/5271

[18:20](#msg63cecfda624f3f4330287be3)How would you call a Red function, that given an algebraic non-decreasing function F (defined as a sequence of points on the XY plane), and argument X, returns Y=F(X)?

greggirwin

[19:06](#msg63cedab4b5e8a462767f9767)So it's monotonically increasing? If so, and it's not global, maybe `increase` is enough. If it's global that may not be precise enough.

hiiamboris

[19:21](#msg63cede2cfc90af03489c03c3)Global yes. Not always increasing, may have multiple Y for single X point (for that I plan /high or /up to return upper Y, and lower by default). Never descreasing.

[19:22](#msg63cede68cea9340334490390)`increase` reads as something that is modifying some value to me.

greggirwin

[20:33](#msg63ceef2e434214494d1f5578)Right, so never decreasing is the monotonic part. `Incr` (which I still want) could mod or not, based on the arg being literal or not. Same for `increase`.

## Tuesday 24th January, 2023

koba-yu

[09:07](#msg63cf9fdbfc90af03489d58fb)Hi, unfortunately I have been not quite active in gitter for a while again, but I keep using Red in my daily jobs.  
Today I am working with some WEB API. With Python, I can call the API correctly and it seems Python sends post data like below,

```
{'args': {},
 'data': '',
 'files': {'upload_image': 'data:application/octet-stream;base64, **base64 string here**},
 'headers': {'Accept': '*/*',
             'Content-Length': '9781',
             'Content-Type': 'multipart/form-data; '
                             'boundary=xxxxxx,
 }
```

Therefore the API requires the 'files' parameter. I tried Red's write/info to post data like above but any patterns I tried do not put the data to 'files'. One onf the code I tried like below;

```
; img is enbased image data
r: write/info http://httpbin.org/post compose/deep [
	post [
		Content-Type: "multipart/form-data"		
	]
	(rejoin ["{" {"files": } "{" {"upload_image": "data:octet-stream;base64,} img {"} "}}"])
]
```

Could anyone help me to make a post request with 'files' parameter?

hiiamboris

[10:05](#msg63cfad797740c84e492e2309)`>> r: write/info http://httpbin.org/post [POST [Content-Type: "multipart/form-data; boundary=CUT"] {^/^/--CUT^/Content-Disposition: form-data; name="file1"; filename="file1"^/^/text1^/^/--CUT^/Content-Disposition: form-data; name="file2"; filename="file2"^/^/text2^/--CUT--^/}]`

```
== [200 #(
    Connection: "keep-alive"
    Date: "Tue, 24 Jan 2023 10:05:16 GMT"
 ...
>> probe load-json last r ()
#(
    args: #()
    data: ""
    files: #(
        file1: "text1^/"
        file2: "text2"
    )
    form: #()
    headers: #(
        Accept: "*/*"
        Content-Length: "163"
        Content-Type: "multipart/form-data; boundary=CUT; Charset=UTF-8"
        Host: "httpbin.org"
        User-Agent: {Mozilla/4.0 (compatible; Win32; WinHttp.WinHttpRequest.5)}
        X-Amzn-Trace-Id: "Root=1-63cfad5c-1644b1c82ceeb6d36615a9c2"
    )
    json: none
    origin: "157.230.123.237"
    url: "http://httpbin.org/post"
)
```

[10:06](#msg63cfad9821cada4343a7028a)https://stackoverflow.com/a/23517227

koba-yu

[10:12](#msg63cfaf158e760b51fd05c801)Thank you. I’ll check when I come back home!

bubnenkoff

[15:07](#msg63cff4277740c84e492eb30c)How to make scroller take all panel height and allow to scroll all content if I do not know it's full size?

```
ui-items: collect [   
        foreach key [aa bb cc dd ee ff gg hh] [
    
            keep compose [ 
                   panel (first random [red green olive blue brown]) 400x300
            ]   

            keep/only collect [  
       			keep 'h5 keep mold key
            ] 

            keep 'return          

        ]
    ]

view [
	size 500x420
	panel [
    		scroller 16x400 [
                face/data: min .75 face/data
                ui-panel/offset/y: to integer! negate 800 * face/data
            ]  
        on-created [face/selected: 25%]
		ui-panel: panel ui-items
	]
]
```

(code base on scroll example that was posted few moth ago)

hiiamboris

[15:11](#msg63cff53eb5e8a46276819232)why you don't know it's full size? it's last face's offset + size

[15:17](#msg63cff68ad00f0d494724b752)!\[](https://i.gyazo.com/edc3fc3dbb61c20696f57972f64717be.gif)

bubnenkoff

[15:18](#msg63cff6b149431d637014baad)please show code...

hiiamboris

[15:18](#msg63cff6bd603e2b63872820b2)https://codeberg.org/hiiamboris/red-common/src/branch/master/scrollpanel.red

bubnenkoff

[15:21](#msg63cff78921cada4343a78ffa)is it possible to do same without external packages?

hiiamboris

[15:23](#msg63cff7f149431d637014bd8f)of course, by rewriting it on a small scale :)

bubnenkoff

[15:31](#msg63cff9c6fc90af03489e079e)I tried to use `with` for `scroller`  
first question why `0.6` of face size make it 90% of blue panel? I expected that 0.9 scale should make 90%

```
view [
    size 500x420
    panel blue [
            scroller [
                face/data: min .75 face/data
                ui-panel/offset/y: to integer! negate 800 * face/data
            ]  with [react/later [size: to-pair compose [ 20 (parent/size/x * 0.6)   ]  ]]
        on-created [face/selected: 25%]
        ui-panel: panel ui-items
    ]
]
```

hiiamboris

[15:34](#msg63cffa7eec2bfc62866eae94)looks like 60% to me (maybe you meant size/y?):  
!\[](https://i.gyazo.com/1dbafd9518d7357eed2e5bb7613d17f0.png)

[15:34](#msg63cffa8d434214494d21468d)anyway you can simplify my implementation if:  
\- your faces do not change their sizes and offsets  
\- you don't need horizontal scroller  
\- you know that last base is the lowest one  
\- your panel contains no subpanels  
\- you don't care if set-focus focuses a hidden face  
\- you don't need wheel support

bubnenkoff

[15:57](#msg63d00004fc90af03489e1334)&gt; !\[](https://i.gyazo.com/edc3fc3dbb61c20696f57972f64717be.gif)

Could you show how did you get my code work?

```
ui-items: collect [   
        foreach key [aa bb cc dd ee ff gg hh] [

            keep compose [ 
                   panel (first random [red green olive blue brown]) 400x300
            ]   

            keep/only collect [  
                   keep 'h5 keep mold key
            ] 

            keep 'return          

        ]
    ]

view [
    size 500x420
    scrollpanel blue [

        ui-panel: panel ui-items
    ]
]
```

This code do not work as you show

hiiamboris

[15:58](#msg63d0002d21cada4343a7a2d3)my code is right in the image

[15:59](#msg63d000590c94855213c897cc)(plus your `ui-items` of course)

bubnenkoff

[16:09](#msg63d002bd624f3f43302ab11a)Could you test next code?

```
foo: function [] [

	ui-items: collect [   
	        foreach key [aa bb cc dd ee ff gg hh] [

	            keep compose [ 
	                   panel (first random [red green olive blue brown]) 400x300
	            ]   

	            keep/only collect [  
	                   keep 'h5 keep mold key
	            ] 

	            keep 'return          

	        ]
	    ]

	    clear ppp/pane
	    append ppp/pane ui-items ; ?
]



view [
    size 500x420
    button "load" [foo]
   	ppp: scrollpanel []


]
```

Red app hang for me. Can't switch back to console

hiiamboris

[16:10](#msg63d002faec2bfc62866ebf66)forgot layout again?

bubnenkoff

[16:12](#msg63d00357c29114554332e04a)oh...

[16:16](#msg63d0047721cada4343a7acbc)

```
>> view [
[        size 500x420
[        button "load" [foo]
[       	ppp: scrollpanel ; also I tried scrollpanel  []
[    
[    
[    ]
*** Script Error: move does not allow none! for its origin argument
*** Where: /
*** Near : move find/same pane hsc tail pane
*** Stack: view do-events do-actor do-safe error? foo on-face-deep-change* check-pane 
*** Near: [[panel/pane] check-pane panel]
*** Script Error: move does not allow none! for its origin argument
*** Where: move
*** Near : move find/same pane hsc tail pane
*** Stack: view do-events do-actor do-safe error? foo on-face-deep-change* check-pane 
*** Near: [[panel/pane] check-pane panel]
*** Script Error: move does not allow none! for its origin argument
*** Where: move
*** Near : move find/same pane hsc tail pane
*** Stack: view do-events do-actor do-safe error? foo on-face-deep-change* check-pane 
*** Near: [[panel/pane] check-pane panel]
*** Script Error: none! type is not allowed here
```

Do not work...

hiiamboris

[16:17](#msg63d004a580dc214e328bea25)let me check

bubnenkoff

[16:17](#msg63d004ae80dc214e328bea30)full code:

```
foo: function [] [

	ui-items: collect [   
	        foreach key [aa bb cc dd ee ff gg hh] [

	            keep compose [ 
	                   panel (first random [red green olive blue brown]) 400x300
	            ]   

	            keep/only collect [  
	                   keep 'h5 keep mold key
	            ] 

	            keep 'return          

	        ]
	    ]

	    clear ppp/pane
	    append ppp/pane layout/only ui-items ; 
]



view [
    size 500x420
    button "load" [foo]
   	ppp: scrollpanel []
]
```

hiiamboris

[16:19](#msg63d0050b603e2b638728413a)lol it keeps spamming errors after closing the window :)

[17:00](#msg63d00e928e760b51fd068971)I've pushed a few fixes @bubnenkoff

[17:00](#msg63d00eb980dc214e328bfd16)let me know if it works now

bubnenkoff

[17:13](#msg63d011d5fb5fe8552e485cef)does this code work for you?

```
foo: function [] [

	ui-items: collect [   
	        foreach key [aa bb cc dd ee ff gg hh] [

	            keep compose [ 
	                   panel (first random [red green olive blue brown]) 400x300
	            ]   

	            keep/only collect [  
	                   keep 'h5 keep mold key
	            ] 

	            keep 'return          

	        ]
	    ]

	    clear ppp/pane
	    append ppp/pane layout/only ui-items ; 
]

view [
  ;  size 500x420
    button "load" [foo]
   	ppp: scrollpanel []
]
```

[17:17](#msg63d012c3b5e8a4627681d12d)I am getting console hang with very starge errors:

```
*** Script Error: f2s: needs a value
*** Where: f2s
*** Near : f2s: :face-to-screen ofs: f2s ev/offset 
*** Stack: ask ask do-events do-safe 
*** Script Error: f2s: needs a value
*** Where: f2s
*** Near : f2s: :face-to-screen ofs: f2s ev/offset 
*** Stack: ask ask do-events do-safe 
*** Script Error: f2s: needs a value
```

[17:18](#msg63d012fa49431d637014f7b0)but I will be able to check more detail tomorrow

hiiamboris

[18:29](#msg63d023748e760b51fd06b428)yeah works

[18:29](#msg63d0238580dc214e328c27e9)but I just pushed another fix, could be the reason

[18:30](#msg63d023bb7740c84e492f1492)!\[](https://i.gyazo.com/614e9bf06888d11a8ce87647d4fe9618.gif)

[18:30](#msg63d023c9603e2b6387288299)although the error more looks like an include problem

[18:31](#msg63d023e57740c84e492f150e)those functions are from `%relativity.red`

## Wednesday 25th January, 2023

bubnenkoff

[08:00](#msg63d0e18d80dc214e328d6df7)

```
>> 
>> foo: function [] [
[    
[    	ui-items: collect [   
[    	        foreach key [aa bb cc dd ee ff gg hh] [
[    
[    	            keep compose [ 
[    	                   panel (first random [red green olive blue brown]) 400x300
[    	            ]   
[    
[    	            keep/only collect [  
[    	                   keep 'h5 keep mold key
[    	            ] 
[    
[    	            keep 'return          
[    
[    	        ]
[    	    ]
[    
[    	    clear ppp/pane
[    	    append ppp/pane layout/only ui-items ; 
[    ]
== func [/local ui-items key][
    ui-items: collect [
        foreach key [aa bb cc dd ee ff gg hh] [
...
>> 
>> 
>> 
>> view [
[      ;  size 500x420
[        button "load" [foo]
[       	ppp: scrollpanel 
[    
[    
[    ]
*** Script Error: quietly has no value
*** Where: +
*** Near : 
*** Stack: view layout context react update-total  

>> 
*** Script Error: none! type is not allowed here
*** Where: op
*** Near : xy: xy op fa/offset fa: fa/parent #assert 
*** Stack: ask ask do-events do-safe within? translate 
*** Script Error: none! type is not allowed here
*** Where: op
```

on latest scrollpanel

[08:02](#msg63d0e23049431d6370165ed9)I just did `do load app/source/scrollpanel.red` before pasting code to console (maybe I should run other imports explicitly?)

[08:27](#msg63d0e7edd00f0d4947266679)

```
do load %/d/code/app/source/scrollpanel.red
do load %/d/code/app/source/shallow-trace.red
do load %/d/code/app/source/do-atomic.red
do load %/d/code/app/source/do-unseen.red
do load %/d/code/app/source/relativity.red
do load %/d/code/app/source/setters.red
do load %/d/code/app/source/show-trace.red


foo: function [] [

	ui-items: collect [   
	        foreach key [aa bb cc dd ee ff gg hh] [

	            keep compose [ 
	                   panel (first random [red green olive blue brown]) 400x300
	            ]   

	            keep/only collect [  
	                   keep 'h5 keep mold key
	            ] 

	            keep 'return          

	        ]
	    ]

	    clear ppp/pane
	    append ppp/pane layout/only ui-items ; 
]



view [
  ;  size 500x420
    button "load" [foo]
   	ppp: scrollpanel []


]
```

same error

hiiamboris

[09:23](#msg63d0f5067740c84e49307d36)Don't load, just `do`

bubnenkoff

[09:50](#msg63d0fb61cea93403344cd202)with `do` only:

```
Script Error: quietly has no value
```

hiiamboris

[09:56](#msg63d0fcb9cea93403344cd482)I guess you've removed #includes from the %scrollpanel.red

[09:56](#msg63d0fcded00f0d4947268b71)%setters.red have to be included first so it expands `quietly` macro

[09:57](#msg63d0fcfdd00f0d4947268b95)or you can manually rewrite `quietly a/b/c: value` as `set-quiet in a/b 'c value`

[09:58](#msg63d0fd3480dc214e328da27b)if you don't mind the ugliness of it :)

bubnenkoff

[10:15](#msg63d1015f0c94855213ca6bf0)Strange, I just cloned new version (but downloading zip and placing it's content to new folder).  
Also fresh copy of red and same error

hiiamboris

[10:19](#msg63d10235fc90af03489fe0f7)

```
Red []
do %scrollpanel.red
view [scrollpanel 100x100 [base 200x200]]
```

this works for me

[10:20](#msg63d10282cea93403344cdf0d)does it work for you in the new folder?

bubnenkoff

[10:31](#msg63d10512fb5fe8552e4a0314)Yes, this works... one moment I will check maybe I should not do all imports.

[10:34](#msg63d105a1ec2bfc6286708ca0)

```
cd %/d/red-common/
do  %/d/red-common/scrollpanel.red

view [scrollpanel 100x100 [base 200x200]]
```

works. It seems that it can't load other modules without setting  
`cd`

[10:35](#msg63d105ee21cada4343a977bf)yes, there issue with it. Need `cd` and loading only one `scrollpanel.red`

[10:36](#msg63d10648b5e8a46276838452)Could you try import all modules like I did? Will you get same error?

hiiamboris

[10:37](#msg63d10687624f3f43302c7cc1)include is buggy as hell, so it's expected

## Thursday 26th January, 2023

bubnenkoff

[07:17](#msg63d228fd603e2b63872c1d3c)to get it work correctly it's enough to do only two imports:

```
#include %/d/code/app/source/do-atomic.red
#include %/d/code/app/source/scrollpanel.red

view [scrollpanel 100x100 [base 200x200]]
```

[08:32](#msg63d23a9b7740c84e4932cc96)Could you test next code?

[08:32](#msg63d23aa38e760b51fd0a799c)

```
pos: 0x0
view [
	ppp: scrollpanel green []
	 button "add" [
	 	append ppp/pane layout/only [
	 		at (pos: pos + 0x30) button "test"
	 		]
	 	]
	]
```

scrolls do not appears

hiiamboris

[09:34](#msg63d2491a434214494d25794a)thanks, I'll look into it

[16:17](#msg63d2a78f0c94855213cd8824)damn reactivity is nearly impossible to debug

[16:22](#msg63d2a8bf603e2b63872d1875)I've pushed a workaround @bubnenkoff

[16:23](#msg63d2a8f7434214494d263668)core problem is that relations there are cyclic, and I don't see an acceptable fix for it

[16:25](#msg63d2a991434214494d263862)also as stated in the header, it doesn't support margins, so if you add first face at any offset other than 0x0, it will make it 0x0

[16:48](#msg63d2aece80dc214e3290e004)if you need margin or if you see reactions not working again you can just put another panel into scrollpanel:

```
Red []

do %scrollpanel.red
pos: 20x0
view [
    scrollpanel green [
		ppp: panel cyan [] react [
			all [
				f1: first face/pane
				f2: last  face/pane
				face/size: f1/offset + f2/offset + f2/size
			]
		]
	]
     button "add" focus [
         append ppp/pane layout/only [
             at (pos: pos + 0x30) button "test"
             ]
         ]
    ]
```

[16:50](#msg63d2af4949431d637019bf53)(drawback is that you have to update the panel's size yourself)

greggirwin

[18:57](#msg63d2cd1bfc90af0348a35362)Lots of into to add to an FAQ for `scrollpanel`.

hiiamboris

[18:59](#msg63d2cd9cb5e8a4627686d8f1)it's a kludge for not working internal scrollers, so why bother

greggirwin

[19:05](#msg63d2cee57740c84e4933f55e)If a question comes up once, it's likely to come up again.

## Friday 27th January, 2023

bubnenkoff

[07:06](#msg63d377e3603e2b63872e8957)@hiiamboris thanks! I will test it's a little bit later. Also it would be very cool to get at least a little bit improved version of native scroller

[12:31](#msg63d3c40dec2bfc6286759e56)

```
>> do %/d/123/app.red
```

works fine.

But after compilation with:

```
do/args %red.r "-c -e %/d/123/app.red"
```

I and running (click on button) I am getting error:

```
*** Script Error: updates has no value
*** Where: in
*** Near : set-quiet in panel updates 0
*** Stack: view do-events do-actor do-safe error? on-face-deep-change* check-pane update-total
*** Near: [[panel/pane] check-pane panel]
*** Script Error: updates has no value
*** Where: in
*** Near :
*** Stack: view do-events do-actor do-safe error? on-face-deep-change* update-total
*** Near: [[panel/updates] update-total panel]
```

code:

```
Red []

#include %/d/123/do-atomic.red
#include %/d/123/scrollpanel.red
#include %/d/123/do-unseen.red
#include %/d/123/relativity.red
#include %/d/123/setters.red

pos: 0x0
view [
	ppp: scrollpanel green []
	 button "add" [
	 	append ppp/pane layout/only [
	 		at (pos: pos + 0x30) button "test"
	 		]
	 	]
	]
```

hiiamboris

[12:41](#msg63d3c687d00f0d49472ba93d)pushed a fix

[12:45](#msg63d3c75a49431d63701bb58c)with Red it's too easy to forget how treacherous R2 was :)

## Saturday 28th January, 2023

lylgithub2021

[02:28](#msg63d488550c94855213d0fda1)

```
Red [needs 'view]

f: function['way][
compose/deep[
radio[(to-set-word way) 1]
gg: field "field"
]
]

view f myway
```

I construct a block for "view" by a function "f", but this code fails to work for the reason of name "gg" for "field". Why and how to make it work?

greggirwin

[02:49](#msg63d48d31624f3f4330330e66)Because `gg` gets collected by `function`.

```
Red [needs 'view]

f: function['way /extern gg][
	compose/deep[
		radio[(to-set-word way) 1]
		gg: field "field"
	]
]

view f myway
```

lylgithub2021

[03:08](#msg63d491a90c94855213d10edc)@greggirwin Oh, I see! Thank you so much!!

bubnenkoff

[07:40](#msg63d4d17d80dc214e3294a910)@hiiamboris eght... on real project I am getting multiple errors or access violate

```
*** Script Error: func [panel face][[face/offset face/size] if panel =? select face 'parent [panel
*** Where: try
*** Near : func [panel face][[face/offset face/size] ]
*** Stack: open-project do-events do-actor do-safe error? add-new-section-to-data-templates save-new-sections-struct-and-content add-data-template-or-stat-sections-to-panel on-face-deep-change*
*** Near: [func [panel face][[face/offset face/size] if panel =? select face 'parent [pane
*** Script Error: func [panel face][[face/offset face/size] if panel =? select face 'parent [panel
*** Where: try
*** Near : func [panel face][[face/offset face/size] ]
*** Stack: open-project do-events do-actor do-safe error? add-new-section-to-data-templates save-new-sections-struct-and-content add-data-template-or-stat-sections-to-panel on-face-deep-change*
*** Near: [func [panel face][[face/offset face/size] if panel =? select face 'parent [pane
*** Script Error: func [panel face][[face/offset face/size] if panel =? select face 'parent [panel
*** Where: try
*** Near : func [panel face][[face/offset face/size] ]
*** Stack: open-project do-events do-actor do-safe error? add-new-section-to-data-templates save-new-sections-struct-and-content add-data-template-or-stat-sections-to-panel on-face-deep-change*
*** Near: [func [panel face][[face/offset face/size] if panel =? select face 'parent [pane
*** Script Error: func [panel face][[face/offset face/size] if panel =? select face 'parent [panel
*** Where: try
```

Will try to create minimal example of error

[09:00](#msg63d4e42ed00f0d49472da46b)&gt;

```
> >> do %/d/123/app.red
>
```

&gt; works fine.  
&gt;  
&gt; But after compilation with:  
&gt;

```
> do/args %red.r "-c -e %/d/123/app.red"
>
```

&gt; I and running (click on button) I am getting error:  
&gt;

```
> *** Script Error: updates has no value
> *** Where: in
> *** Near : set-quiet in panel updates 0
> *** Stack: view do-events do-actor do-safe error? on-face-deep-change* check-pane update-total
> *** Near: [[panel/pane] check-pane panel]
> *** Script Error: updates has no value
> *** Where: in
> *** Near :
> *** Stack: view do-events do-actor do-safe error? on-face-deep-change* update-total
> *** Near: [[panel/updates] update-total panel]
> 
>
```

&gt;  
&gt; code:  
&gt;

```
> Red []
> 
> #include %/d/123/do-atomic.red
> #include %/d/123/scrollpanel.red
> #include %/d/123/do-unseen.red
> #include %/d/123/relativity.red
> #include %/d/123/setters.red
> 
> pos: 0x0
> view [
> 	ppp: scrollpanel green []
> 	 button "add" [
> 	 	append ppp/pane layout/only [
> 	 		at (pos: pos + 0x30) button "test"
> 	 		]
> 	 	]
> 	]
>
```

&gt;

strange I am getting:

```
*** Script Error: quietly has no value
*** Where: update-total
*** Near : quietly panel/updates: 0
*** Stack: view do-events do-actor do-safe error? on-face-deep-change* check-pane update-total
*** Near: [[panel/pane] check-pane panel]
*** Script Error: quietly has no value
*** Where: update-total
*** Near :
*** Stack: view do-events do-actor do-safe error? on-face-deep-change* update-total
*** Near: [[panel/updates] update-total panel]
```

Compiling mode:

```
do/args %red.r "-c -e %/d/123/app.red"
```

hiiamboris

[09:22](#msg63d4e962603e2b6387312556)As I said previously you have to import % setters.red before %scrollpanel.red for macro to get expanded.

[09:23](#msg63d4e9a18e760b51fd0f5f5d)But also there's a chance that expansion won't work at all. I add explicit `do/expand` in these cases.

bubnenkoff

[09:43](#msg63d4ee55b5e8a462768aa477)On real project after opening project second time (same or another) I am getting crush:

```
*** Stack: open-project do-events do-actor do-safe error? view do-events do-actor do-safe error? open-project call-db-uniq-keys-rules on-face-deep-change*
*** Near: [func [panel face][[face/offset face/size] if panel =? select face 'parent [pane
Connection to database...
redefine-config-by-cmd-args
No args passed. Use "-proj=name -job=1" for project name

*** Runtime Error 1: access violation
*** at: 68277D31h
```

Every project fill it's own panel with items)

[09:44](#msg63d4ee7780dc214e3294dc2a)The first opening is work fine

[09:46](#msg63d4eee3603e2b6387312fba)Yes. Please try to push button two times

```
pos: 0x0

foo: func [] [
	clear ppp/pane
	foreach el [aa bb cc dd] [
	 	append ppp/pane layout/only [
	 		at (pos: pos + 0x30) button "test1"
	 		]
	 	]

	]
	

view [
	panel [
 	   ppp: scrollpanel green []

	]
    button [foo]
 ]
```

[09:47](#msg63d4ef14fc90af0348a72c10)\[!\[изображение.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/c4lM/thumb/izobrazhenie.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/c4lM/izobrazhenie.png)

hiiamboris

[10:08](#msg63d4f40cec2bfc628677bab9)this snippet doesn't crash but it causes a View error

[10:08](#msg63d4f41e0c94855213d1bd0d)I'll try to isolate and report it, thanks

luce80

[11:16](#msg63d503fd49431d63701de434)Nice snippets @bubnenkoff thanks ! I have tested and fixed ;) also my version.

hiiamboris

[12:14](#msg63d511b3fb5fe8552e517d31)pushed a workaround @bubnenkoff

[12:55](#msg63d51b27603e2b63873180e8)also reported https://github.com/red/red/issues/5273 https://github.com/red/red/issues/5274

## Sunday 29th January, 2023

bubnenkoff

[12:38](#msg63d668de21cada4343b32bc9)@hiiamboris perfect! Big thanks! No more `access violate` crush! (on real project)

cloutiy

[23:05](#msg63d6fba3b5e8a462768e3f1a)Is it possible for functions to have variable number of arguments, or optional args?

greggirwin

[23:24](#msg63d7001fec2bfc62867b5d63)Use refinements for optional args. For variable arity, use a block argument.

## Monday 30th January, 2023

cloutiy

[19:06](#msg63d81525fc90af0348acef2a)Thanks gregg

## Tuesday 31st January, 2023

bubnenkoff

[09:49](#msg63d8e43080dc214e329c0ac6)Sometimes I am getting Runtime Error 1: access violation on scrollpanel... still cant create reproducible sample

hiiamboris

[09:54](#msg63d8e5670c94855213d8f1f4)And if you replace it with normal `panel` no crashes?

bubnenkoff

[10:21](#msg63d8eba00c94855213d8fe57)Yes, with panel all works

hiiamboris

[10:27](#msg63d8ed1f624f3f43303b06cc)well, weakest points of scrollpanel are:  
\- it changes /offset of faces a lot  
\- it has to put scrollers back into itself every time you `clear` them out  
\- a lot of reactions

[10:28](#msg63d8ed36fb5fe8552e588a52)try this and see if it crashes :point\_up: \[January 26, 2023 7:48 PM](https://gitter.im/red/help?at=63d2aece80dc214e3290e004)

[10:28](#msg63d8ed4f49431d63702504f9)the more you load the View the more likely it's gonna trigger a crash

bubnenkoff

[10:36](#msg63d8ef138e760b51fd16acff)&gt; try this and see if it crashes :point\_up: \[January 26, 2023 7:48 PM](https://gitter.im/red/help?at=63d2aece80dc214e3290e004)

Yes, nesting helped. I got crush only one time after random clicking on button for adding new data. In second time I was not able to reproduce crush.

hammer-x86-64

[15:20](#msg63d931c649431d6370258569)Can i create a TCP server in Red? if so how?

hiiamboris

[15:23](#msg63d932688e760b51fd1730e9)You'll need the (experimental) IO branch https://github.com/red/red/tree/IO

[15:24](#msg63d93299cea93403345bf51f)Building instructions are there in the readme, or you can use \[my build tool](https://gitlab.com/hiiamboris/red-cli/-/tree/master/mockups/redbuild)

[15:26](#msg63d933110c94855213d9865d)Server itself should I think just be a few lines of code as described here: http://www.rebol.com/docs/core23/rebolcore-13.html#section-14

[15:26](#msg63d9332fcea93403345bf684)Or here: http://www.rebol.net/cookbook/recipes/0028.html

hammer-x86-64

[15:29](#msg63d933ce434214494d31faed)Thanks!

[15:49](#msg63d9387ffc90af0348af0d3a)red: symbol lookup error: red: undefined symbol: \_\_res\_nmkquery; i get this after i have built it?

[15:49](#msg63d93892fb5fe8552e591a0e)im simply running `red`

hiiamboris

[15:50](#msg63d938cacea93403345c00a6)what OS?

hammer-x86-64

[15:50](#msg63d938e049431d637025933e)linux, running arch linux in a strange setup

hiiamboris

[15:51](#msg63d938f6603e2b6387390882)let me build it for linux, a moment plz

[15:56](#msg63d93a3e603e2b6387390abd)works fine on ubuntu (GLIBC 2.31-0ubuntu9.1)

[15:57](#msg63d93a50cea93403345c048a)for some reason your glibc is missing `res_nmkquery`

[15:57](#msg63d93a6ffc90af0348af124c)I've never heard of this issue yet

hammer-x86-64

[15:59](#msg63d93ae080dc214e329cb815)what should i do

hiiamboris

[16:00](#msg63d93b0eec2bfc62867f887b)try updating/reinstalling glibc maybe? idk, sorry :)

[16:01](#msg63d93b60cea93403345c0697)Red uses 32-bit libs, maybe it's part of your issue

[16:04](#msg63d93bfffb5fe8552e59213e)@loziniak may have some ideas if he drops by

cosacam1

[16:12](#msg63d93ddb8e760b51fd174914)Hi everyone. I've been reading your posts in a daily basis but I'm writing this huge system in my job (besides other tasks) so I haven't had time to chat. I know I'll eventually need to connect different modules via web pages or tcp servers so my question to @hiiamboris - Can I used those examples in rebol you gave as is (with only minor changes) or are they only a guide and they must be "translated" to Red? I must say I've never programmed neither for web nor servers at all. All my programs have always been used locally, sorry.

hiiamboris

[16:13](#msg63d93e318e760b51fd174980)per my understanding they should work as is

[16:14](#msg63d93e4bfc90af0348af19f1)@rebolek may confirm if I'm correct or not, as he built a couple servers

cosacam1

[16:15](#msg63d93ea0d00f0d4947358cea)ok thanks, I already saved them to study later, when the time comes

rebolek

[17:17](#msg63d94d21624f3f43303bc3d1)@cosacam1 @hiiamboris Hm, I think that the examples are only partially compatible. Some of them might work but some of them definitely wouldn't. Refinements like `open/lines` or `open/direct` aren't supported in Red.  
@cosacam1 but if you're interested in running some TCP server/client, have look at the `%tests/IO` directory, there's a lot of very simple examples.

hammer-x86-64

[18:07](#msg63d958d8d00f0d494735c5ad)&gt; red: symbol lookup error: red: undefined symbol: \_\_res\_nmkquery; i get this after i have built it?  
&gt;

i have now tried it in a few distros (fedora, arch, void) all of them give the same

rebolek

[18:13](#msg63d95a5a7740c84e493feaf4)@hammer-x86-64 I know this error and have a fix for it, let me find it...

[18:15](#msg63d95addec2bfc62867fc385)OK, IIRC, in `runtime/platform/definitions/POSIX.reds`, you need to change `__res_nmkquery` to `res_nmkquery`. Some distros need one version, some need the other.

hammer-x86-64

[18:32](#msg63d95ed80c94855213d9daa0)alright

[18:39](#msg63d96047cea93403345c5093)i think it worked

cosacam1

[18:47](#msg63d9623a21cada4343b8cde2)@bubnenkoff I see. Thanks

hammer-x86-64

[18:53](#msg63d963a2d00f0d494735da47)i cant seem to compile with the red i built myself? it just runs it; yes i have passed -c but it says `Access Error: cannot open: %-c`

[18:53](#msg63d963b3ec2bfc62867fd575)i also renamed it to redc

hiiamboris

[19:32](#msg63d96cbb624f3f43303c052e)Console itself cannot compile anything. Do the steps you did to compile the console, with your script.

Oldes

[19:32](#msg63d96cc2b5e8a4627692eb76)Red is using Rebol2 to compile itself.

## Wednesday 1st February, 2023

tangentstorm

[00:26](#msg63d9b1bb49431d6370267739)okay, i'm trying to generate some xml:

```
q: [
  [base table: "default.test.solar"]
  [sel value: "orbits='Sun'"]
  [link [whatever]]
  [sort col: "dist"]]

xml-attrs: function [elem [block!]] [
  collect compose [ o: next head elem
      while [set-word? o/1] [keep rejoin [" " o/1 "=" mold to-string o/2]
      o: next next o] ]]

xml-tail: function [el [block!]] [
    end: last el
    either (block! = type? end)
      [rejoin [">" (to-xml end) "</" el/1 ">"]]
      ["/>"]]

to-xml: function [ops [block!]] [
  rejoin collect [foreach op ops [
    keep rejoin ["<" (op/1) (xml-attrs op) (xml-tail op)]]]]
```

everything works fine if i remove the recursive call to `to-xml end` in `xml-tail` except i don't get any child elements... but with that call, previously-working references to `op/1` and such suddenly break. I know `op` isn't exactly a variable, and the `to-xml` function doesn't exactly have a "scope"... but I don't know how to fix this. What am I missing? :D

rgchris

[03:53](#msg63d9e249c29114554344e56b)@tangentstorm You don't repeat your format for XML representation for your child elements, so instead of `[block! block! ... etc]` your recursive call gets `[word!]` instead. Try changing `[link [whatever]]` to `[link [[whatever]]]`

tangentstorm

[06:11](#msg63da02a77740c84e49411b6c)@rgchris aha! Now I get it. :) That was exactly what the error message was telling me, but I didn't understand it. Thanks!

hiiamboris

[10:48](#msg63da4381e1fcfd1a7d7de9a0)@tangentstorm there's a complete codec https://github.com/red/red/pull/5026 if you'd rather use one

tangentstorm

[17:35](#msg63daa2ecab2bdb2b698e1dd5)@hiiamboris that sounds promising... but i don't understand what to do with this information. from the merge date, it looks like this should be part of red for about a year. I'm running `Red 0.6.4 for Windows built 18-Jan-2023/13:38:47-05:00 commit #ced7dc0` ... But I don't see anything about xml when I try `probe system/codecs` ... Also, I don't know what to do with the codecs I do see. :)

hiiamboris

[17:42](#msg63daa47b84f08f6727fc92e4)It's not part of Red. Just grab the files and #include xml.red.

[17:43](#msg63daa4caac888c172f48f2de)%xml-test.red has a lot of usage examples

[17:44](#msg63daa4f6bf77a52432821a2d)hopefully it didn't regress...

[17:46](#msg63daa58889339e0bf0c12fd3)docs are also mentioned in the PR

tangentstorm

[17:52](#msg63daa6ede1fcfd1a7d7eb3a5)so it was merged and then un-merged sometime later?

hiiamboris

[17:52](#msg63daa6f28bbe41172a6d49a0)yep

## Thursday 2nd February, 2023

rebred

[00:25](#msg63db02dcbf77a5243282ce0f)On linux running shell commands:

```
str: {touch /home/test.txt}
call/output str data: ""
```

this above works and creates a file

```
str: {date > /home/test.txt}
call/output str data: ""
```

this above doesn't work

```
str: {echo 'test' > /home/test.txt}
call/output str data: ""
```

this above also doesn't work:

```
str: {mv /home/test.txt /home/test2.txt}
call/output str data: ""
```

this above works

bubnenkoff

[07:41](#msg63db690fac888c172f4a5252)I need to do `wait` before repeating some operation. Am I right that `wait` is blocking operation?  
I tried it in console and console is freeze even before first print:

```
f: function [] [
	print "hello"
	wait 10
	print "world"
]

f
```

is there any better not blocking alternative?

hiiamboris

[08:45](#msg63db78371bbc096730b9f759)@rebred there's a refinement for calling shell commands. See `? call`.

[08:46](#msg63db7858bf77a52432839d71)@bubnenkoff on-time event.

bubnenkoff

[09:18](#msg63db7fe3ab2bdb2b698fb773)@hiiamboris did not catch idea about shell ...

hiiamboris

[09:53](#msg63db880fe1fcfd1a7d805b8c)it was for the other question

bubnenkoff

[10:12](#msg63db8c90f9b0de0be96b3e00)on-time? Explain idea please ...

hiiamboris

[10:13](#msg63db8cdba24223243864189c)`view [base rate 0:0:10 on-time [print "10 sec elapsed"]]`

rebred

[14:38](#msg63dbcaf96db6de624bb4e5fa)@hiiamboris it worked by doing

```
call/shell {echo 'hello' > /home/test.txt}
```

thanks a lot!!

hiiamboris

[15:42](#msg63dbd9ef58c7fc1a839bbadf):+1:

## Friday 3th February, 2023

tangentstorm

[03:36](#msg63dc81366b829e1a9a74c279)@hiiamboris so, why was your xml codec dropped? and if i wanted to submit a patch, where would i do that? (it doesn't currently support doctypes or comments before the root element)

[03:38](#msg63dc81d14ecd45446ec05178)( `load-xml find the-xml " works around the problem for now, but i'm willing to contribute if you'd like )`

`greggirwin 04:05@rebolek wrote the XML codec, which was dropped because it didn't meet @dockimbel's standards. The plan was to move it to the red/code repo, but I don't think that has happened yet. rebolek 05:51IIRC it was dropped not because of standards but because Doc wondered if such stuff should be part of the main distro, or should be on red/code. pekr 06:09I do remember it identically to Rebolek. XML was found not being mainstream, so supposed to move to the external distro. JSON on the other hand, was supposed to stay. tangentstorm 06:18well, it would be nice to have it *somewhere* :) rebolek 06:20@tangentstorm it's available in the pull request https://github.com/red/red/pull/5026 . I have an older version in my red-tools repo, I'll backport this one there. tangentstorm 06:22Thanks! I don't know how to "check out" a pull request from a git client. AFAIK, pull requests aren't part of git, but of github. (So I wound up just copying and pasting from the "changed files" view in the pull request). Having it in a repo (any repo - red-tools is fine) would be a great improvement. pekr 06:34I use Github desktop on Windows, nice tool, syncs to folder, you can watch changes, update. And I never used it to submit PR, so just for checking out, it is ideal .... for me .... hiiamboris 09:24Pull request is being made from the author's clone of the repository. So I usually just add this cloned repository to git config and pull the relevant branch from there. Though with 4 files it's really easier to grab them one by one :) bubnenkoff 09:31Why block loses leading zero? >> [040] == [40] toomasv 09:43@bubnenkoff There are no leading-zero numbers in Red, unless 0 or fractions of 1 of course. Even if in block, number is still loaded and typed. As [documentation](https://github.com/red/docs/blob/master/en/datatypes/integer.adoc) states: > Leading zeros are ignored. dockimbel 13:52XML (and other PR with lots of mezz code): too heavy code for inclusion in the Core, as compiled mezz code tends to generate big payloads which take a lot of time to compile. Given that the work on Core easily requires dozens (or even hundreds if counting the tests suite) of compilation jobs daily, big mezz code inclusion would have a heavy negative impact on the development process. Moving those libs to red/code until we get a module system is fine. hiiamboris 13:57Can it just be wrapped in a do block for the time being? dockimbel 14:01It would still generate a quite big payload due to Redbin encoding. A better option would be to include it in compressed string format and uncompress+load on first invocation. Though, for the XML PR, I remember, among other issues, heavy memory allocations just on load (like ~1MB) and codec API being bypassed.`

`Saturday 4th February, 2023 rebolek 11:56It's true that the first version of XML codec was memory hungry because of bitsets that have to match Unicode chars, however, that was changed in subsequent versions and itsets were created on demand, when XML was first used, so the memory requirements are in tens of kBs (~30kB, IIRC). Re: codec API being bypassed - as there are no guidelines, I modeled the codec after Gabriele's JSON (to-* and load-* functions), which was the first codec included in Red, so it served as a prototype for other work. Codec API wasn't exactly bypased, it's just that it used these functions which are also exposed to user. And because codec API has no support for options (there was a discussion to add it, but it went nowhere), it makes sense to have these functions exposed as they allow finer control over import and export. DanKokenge_twitter 15:45Where can I find documentation on opening and working with SQLite. What is the perfered way? hiiamboris 15:58https://github.com/red/code/tree/master/Library/SQLite 15:59see tests there, probably the only documentation :) DanKokenge_twitter 17:40Thanks for the help on SQLite 17:40I'm a complete newbie. So be kind. Not much luck with SQLite. Got errors with their test program.. Maybe there is documentation somewhere for RED and mySQL. Maybe RED is not the language for business applications. Should I be looking at REBOL. I think REBOL can do SQLite. Thanks for the help. hiiamboris 18:30it's out of date a bit 18:31you should ask around https://gitter.im/red/database 18:32though last I checked they're using a heavier solution 18:39@oldes is there a more recent SQLite binding? Oldes 18:40Not for Red. hiiamboris 18:41R3? Oldes 18:59[Yes](https://github.com/Siskin-framework/Rebol-SQLite), but the true is, that I was not working on it from the initial version, if I don't count recent update to the latest SQLite version. hiiamboris 19:03at a glance seems to work: >> sqlite: import 'sqlite [REBOL] Downloading: https://github.com/Siskin-framework/Rebol-SQLite/releases/download/3.38.5.0/sqlite-windows-x64.rebx [REBOL] Importing extension: /D/gear/rebol/sqlite-windows-x64.rebx >> ? sqlite SQLITE is a module of value: lib-base handle! #[handle! extension] lib-file file! %/D/gear/rebol/sqlite-windows-x64.rebx lib-local object! [] words block! length: 0 [] info command! Returns info about SQLite extension library open command! Opens a new database connection exec command! Runs zero or more semicolon-separate SQL statements finalize command! Deletes prepared statement trace command! Traces debug output prepare command! Prepares SQL statement reset command! Resets prepared statement step command! Executes prepared statement close command! Closes a database connection initialize command! Initializes the SQLite library shutdown command! Deallocate any resources that were allocated >> sqlite/initialize == true 19:04@DanKokenge_twitter try it in https://github.com/Oldes/Rebol3/releases/tag/3.10.2 19:04no GUI in R3 probably though :) Sunday 5th February, 2023 WayneCui 02:56 --== Red 0.6.4 ==-- Type HELP for starting information. >> parse "🍩🕳️" [set hole ahead [2 skip] set donut [to end] (probe hole probe donut)] none #"🍩" == true >> 02:57Hello, anyone can explain to me how to use ahead in PARSE? why hole is none? 02:58red-28jan23-ec0c31279 MacOS 03:01My problem is: How to pick chars in a serial! one by one, and if it meets some value, change it to another luce80 07:54Use replace/all ? or something like [this](https://www.red-lang.org/2016/06/061-reactive-programming.html#:~:text=Syntax%20for%20change%20command) ? rebolek 07:59or parse WayneCui 09:22How can I make it with PARSE and ahead? luce80 09:30Do you really need ahead ? Isn't it enough to do as in the examples provided in the link above ? WayneCui 09:46Good , it seems work for me.I will try. Thanks a lot :-) @luce80 Monday 6th February, 2023 WayneCui 05:38 ; surrogate-pair code points scp: charset [#"^(010000)" - #"^(10ffff)"] parse data [ some [ to scp a-char: scp change a-char (encode-to-surrogate-pair a-char)] ] 05:38Make it! Thank a lot @luce80 06:01still a lot of pearls to discover Tuesday 7th February, 2023 cosacam1 19:14Hi guys. I've made this layout and I want to txt face fills itself with some value from a function whenever the layout is view (not only on created). I know there's no on-show. How can I do it? Thanks 19:14 >> f: does [return "some text"] == func [][return "some text"] >> lyo: [txt: h5 on-show [face/text: f]] == [txt: h5 on-show [face/text: f]] >> view lyo *** Script Error: VID - invalid syntax at: [on-show [face/text: f]] *** Where: do *** Near : throw-error spec *** Stack: view layout throw-error cause-error 19:25 == func [][return random/only ["ana" "beth" "carl"]] lyo: [txt: h5 do [txt/text: f]] == [txt: h5 do [txt/text: f]] >> view lyo >> view lyo 19:27I found the solution, using do. I thought do worked only the first time the layout is viewed, but it works every time. Thanks anyway luce80 19:37Nice ! But the on-created works in this case where I do not re-layout every time >> lyo: layout [txt: h5 on-created [txt/text: f]] ;... >> view lyo >> view lyo cosacam1 19:43I see. So, any time we close the view it is destroyed and the next time we view it again, it is re-created, right? hiiamboris 20:06> I found the solution, using do. I thought do worked only the first time the layout is viewed, but it works every time. you're confusing layout result (window) and a block (your lyo) 20:09> I see. So, any time we close the view it is destroyed and the next time we view it again, it is re-created, right? window face! is linked to an OS window when you view (show) it, and that OS window is freed once you close it cosacam1 21:21however, if I make a layout like this lyo: layout [f: field] then I show it with view lyo and type some info in the field then close the window, then show it again it still has the info in the field! I guess OS frees the window but not destroy it. Am I right? hiiamboris 21:25OS window gets destroyed, but face! object lyo still exists together with it's data cosacam1 21:32ok, thanks both. Wednesday 8th February, 2023 piotrbajdek 08:40Hello everyone! I have provided my code below. Currently, when the button is clicked, "ã" is added to the end of the text in the edit box. How can I modify this code to insert "ã" at the current cursor position instead? I believe the caret function may be the solution, but I'm new to Red and unsure of how to use it. Here's my code: Red [ needs: View ] view [ title "Title" input: area font [name: "Gentium Plus" size: 14] 725x650 "" below button "ã" font [color: black name: "Gentium Plus" size: 12] [ append input/text "ã" ] ] hiiamboris 09:11there's a markdown cheatsheet a button click away at the right of the input line 09:14working with caret is not implemented for area face, so you can do that only using WinAPI and other OS API piotrbajdek 09:21Working with caret has not been implemented yet for area or will it not be implemented? hiiamboris 09:21eventually will be but I wouldn't wait for it :) piotrbajdek 09:25I'd try to rewrite this in Rebol but I REALLY need a compiled executable... :-/ Thanks for help, anyway! hiiamboris 09:27well https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-setcaretpos piotrbajdek 09:27I'm on Linux. :D hiiamboris 09:28ah, then some GTK magic :) piotrbajdek 09:35Honestly, too complicated for me. I need to target all platforms, a simple executable ideally with no dependencies would be perfect. Red seemed just perfect...! And I'm writing this on Linux. I'd better try one of those magic tools transcribing Python into C, or something. 09:40Or, I'll wait for the implementation of caret. hiiamboris 09:44if you can wait, in a month I might finish area for [Spaces](https://codeberg.org/hiiamboris/red-spaces/) 09:45although no promise that GTK backend will be able to handle it without glitches :) piotrbajdek 09:54It's just a kind of a text editor for the Tikuna Language spoken in the Amazon. It's a hobby project and I can wait a couple of months or a year... but there are already some users waiting for this program as I've promised I would write it. Seriously, Red would be a perfect language for this project. hiiamboris 10:00what you can probably do now is add your own caret on rich-text face 10:01hard thing is not the caret there, but supporting all keys, including up/down/tab, selection, copy/cut/paste, etc. 10:02but you can probably grab smth from https://github.com/toomasv/syntax-highlighter piotrbajdek 10:11OK. I'll play a little bit with the rich-tex dialect and see... But I'm afraid I'm too new to Red to do hard things of any kind... I'd rather release an alpha version of my program with 'lots of little bugs' now and wait for the implementation of caret for area. If it's just a matter of some months, I'm not in a hurry. hiiamboris 10:11:+1: 10:14well I guess you can do it the truly hackish way https://util.unicode.org/UnicodeJsps/confusables.jsp?a=%C7%80&r=None 10:14using the ǀ char for the caret, then find text "ǀ" will give it's position :) 10:15or even ￨ char piotrbajdek 10:17But the user must insert | hiiamboris 10:17yeah, and that doesn't solve the complexity of keys support rebolek 10:18I did text-area in Draw with custom caret. But it was limited to fixed fonts only (not a problem for it's purpose, code editor). piotrbajdek 10:19And how did you do it? hiiamboris 10:20another hackish idea: track all on-key events in the field face, calculate offset based on that (normal char +1, backspace -1, arrow keys ..., on ctrl+v +length of clipboard) rebolek 10:22With fixed font, all you have is just a grid, so it's very easy to convert mouse position to text position. I tracked on-key for input and on-mouse-* for mouse actions,basically you just divide mouse position by font size to get text position. 10:23The code is somewhere on my GitHub, I believe. piotrbajdek 10:23You folks are talking with a COMPLETE newbie to Red. :D Yes, I'll use a fixed font size and type. ne1uno 10:25selected text can be found easily as another option rebolek 10:25highlighting is bit trickier, but still simple enough. You have three areas - start of block, block body and end of block. Start of block is for start of the selection to the end of the line, end of block is from start of the ending line to the end of selection and block body are lines between.Then you also need a special case when start of block and end of block are on the same line, but that's not that hard to handle. piotrbajdek 10:26But what if the mouse position differs from that of the cursor in the edit box? rebolek 10:27You take care of them separately. Cursor is where you type and mouse can be used for selection. piotrbajdek 10:29I'm not sure I understand. I need to track the cursor's position because I will insert special characters clicking buttons. rebolek 10:30Of course. You need to track it. As I wrote, it's not dependable on mouse position. 10:31Let's say you have some simple text, like: abcd efgh ijkg lmno then the cursor position can be from 0x1 to 4x4 (0 means before the first letter) 10:32So you need to store that value and update it when you press cursor key/delete/insert some char... piotrbajdek 10:32I'm looking for that code on your GitHub... rebolek 10:33but if you have a fixed font, it's easy to convert that value to screen coordinates toomasv 10:39:point_up: [February 8, 2023 12:00 PM](https://gitter.im/red/help?at=63e372d2480b726318b52cda) @piotrbajdek Better place to look for rich-text approach might be https://github.com/toomasv/learning/blob/master/snippets/rich-text/rtbox.red 10:44For caret manipulation in compiled layout with area[this](https://gist.github.com/toomasv/0085fd7c61e53dc9cedb45ae98f777e9) might be of use. piotrbajdek 10:45@toomasv, this code is indeed interesting, thanks! toomasv 10:46You are welcome! piotrbajdek 10:52Basically, your program @toomasv is very similar to what I was going to write--I just need to add lots of buttons with special characters specific to the Tikuna Language, and a few buttons for transcribing the text between several orthographic conventions. 10:54Your code lacks a license.... rebolek 10:55that's normal :D toomasv 10:59@piotrbajdek Not sure which one you liked. Added license to both. piotrbajdek 11:03The first one, the complete editor--I will possibly build my program on this, so thanks for adding the license! :-) toomasv 11:07:+1: piotrbajdek 11:27But it only works interpreted... :'D [piotr@fedora-37 Tikueditor]$ redc -r rtbox.red -=== Red Compiler 0.6.4 ===- Compiling /var/home/piotr/Documents/programs/Tikueditor/rtbox.red ... Compiling compression library... *** Compilation Error: undefined word help-string *** in file: /var/home/piotr/Documents/programs/Tikueditor/rtbox.red *** near: [help-string tuple! 2 [glass] context [transparent: #~000000FE] pallette: [ title "Select color" origin 1x1 space 1x1 style clr: base 15x15 on-down [dn?: true] on-up [ if dn? [env/color: face/extra unview] ] ] ] 11:28Never mind... hiiamboris 11:29help system is part of the console piotrbajdek 11:40It appears to work fine in the console but there are multiple issues trying to compile it... I'll wait for the implementation of caret for area or perhaps give a try another programming language. :'( 11:42I can't expect the users to install the Red interpreter on their systems. hiiamboris 11:44these are easy fixes if you dared :) piotrbajdek 11:55Maybe. If I had sufficient Red knowledge... I really like the concepts behind Red but to be honest, although Rust is infamously 'complex', I've never in my life had a problem compiling Rust code--I can copy-paste virtually anything and it will work. Red is 'easy' but I struggle to make things work... Python is perhaps in the middle between these two in terms of complexity and reliability but it's interpreted. hiiamboris 12:00Red is at alpha stage of development so that all is expected 12:01if you like the language itself, you'll use the arising problems as a grounds to learn the language :) 12:02and we're here to help of course piotrbajdek 12:07Yeah, my first impression is that the Red's community is friendly and helpful. :-) I just want a easy to learn COMPILED programming language for the development of uncomplicated GUI apps. For CLI development, I'll stick for life with Rust. hiiamboris 12:08there's a -e option in compiler 12:10also you might wanna look around https://gitlab.com/hiiamboris/red-cli to see how Red CLI apps compare to Rust ;) piotrbajdek 12:12It compiled with -e but there's an execution error of the compiled program: *** Script Error: help-string has no value *** Where: load *** Near : bind colors: exclude sort extract load help-string *** Stack: context extract load hiiamboris 12:12like I said previously help system is part of the console 12:13but what I didn't say is that I want you to figure out what that line is doing and see how can you work around it 12:14there's Red console you can play in, as well as help ? ?? probe debugging functions toomasv 12:32@piotrbajdek Simplified pallette colors, and it compiles here with -c option. With -r it still gives error: *** Compilation Error: undefined word caret-to-offset @hiiamboris Can you suggest something? piotrbajdek 12:44 button "ã" font [color: black name: "Gentium Plus" size: 12] [ replace/all input/text "|" "ã" ] Here's my caret! :-P 13:04 view [ title "Title" input: area font [name: "Gentium Plus" size: 14] 725x650 "/" button "ã" font [color: black name: "Gentium Plus" size: 12] [ replace input/text "/" "ã/" ] hiiamboris 13:11> > *** Compilation Error: undefined word caret-to-offset > > @hiiamboris Can you suggest something? @toomasv needs: view :) toomasv 13:12:) Amazing! It works. piotrbajdek 13:44Thinking of it, I don't need the caret. I can make something like this and say this is an 'opinionated design choice'. While the caret is just one in the edit box, the edition of text can be faster if you can make multiple inserts at once and it is much simpler if you handle this all with a just single button: button "convert" font [color: black name: "Gentium Plus" size: 12] [ replace/all input/text "a1" "ã" replace/all input/text "a2" "a̰" replace/all input/text "a3" "ã̰" ] No need for multiple insert buttons and a caret support! No need for the use of a mouse; hands on the keyboard the whole time. hiiamboris 13:45:+1: 13:45that's the spirit cosacam1 15:45I wrote this function for my Bible project. It might be useful to Piotr or someone else. It allows the user to type accented vowels, the opening question and exclamation marks and the ñ and ü letters, all used in Spanish. Note that the function is called every time the user types in the field and the whole text in the face is scanned (find ...) so it could be slow for areas with long texts but it's suitable for fields. 15:50here it is 15:53 acentos-etc: func [face /local ndx] [ ; v-r pairs, v is what the user types in, r is the replacement foreach [v r]["a'" "á" "e'" "é" "i'" "í" "o'" "ó" "u'" "ú" "??" "¿" "!!" "¡" "n~" "ñ" "n'" "ñ" {u"} "ü" {u:} "ü"][ if find face/text v [ replace face/text v r ndx: 1 + length? face/text face/selected: as-pair ndx ndx break ] ] ] view [field on-change [acentos-etc face]] Oldes 15:54You should use parse instead, where you could do all changes in one pass. 15:55You way is very unefficient and should not be advertised. 15:56*your... sorry.. I am on mobile only and so no details. 16:03Or you should at least use, that find returns a position, where the needle was located.. your replace now repeats the job from start.. imho.. you can just use replace without the find. hiiamboris 16:04I would guess the most inefficient part by far is setting face/selected multiple times ;) as well as changes done directly to the text facet, every one of which triggers a lot of View code 16:05but I agree with Oldes that there are more interesting ways to write this function 16:05(and a good exercise :) cosacam1 16:07well, I've just read Red by example - Parse and tried this with no avail 16:08 st: parse {??Quie'n me librara' de la vergu:enza y la muerte? Cada man~ana alabare' al Sen'or. !!Aleluya!} [some [string! | change "a'" "á" | change "e'" "é" | change "i'" "í" | change "o'" "ó" | change "u'" "ú" | change "n'" "ñ" | change "n~" "ñ" | change "u:" "ü" | change {u"} "ü" | change "??" "¿" | change "!!" "¡" ]] 16:08here's the error 16:09 *** Script Error: PARSE - matching by datatype not supported for any-string! input *** Where: parse *** Near : st: parse {??Quie'n me librara' de la ver} *** Stack: hiiamboris 16:09do you get what the error says? cosacam1 16:09yeap hiiamboris 16:12here's the manual btw: https://www.red-lang.org/2013/11/041-introducing-parse.html cosacam1 16:20@Oldes I know it's not efficient. The ndx: 1 + length? face/text face/selected: as-pair ndx ndx part is to force the caret to the end of the line (where the user is probably typing) because replace... was moving it to the beggining IIRC. The problem is when the user is editing what he/she already typed, and the caret is in the middle of the line, for example. I know it is not good enough but I give it so anyone can improve it. 16:30@hiiamboris Indeed, it's a good exercise... but I failed though I don't see where. Do you? The input is just a string inside curly braces. I don't see anything wrong there. Wait... if I replace the {} by [] (so now the input is a block) it gives me no error but it returns false. What I expect in st is the string with the replacements... let me see.... (my boss gonna kill me hahaha) hiiamboris 16:35:D 16:35you can match datatypes in blocks and binary only, but I don't think that's what you want cosacam1 16:57almost done. Not to replace the {} by [] but to enclose the {} with [], that is to put the string inside the block. Parse is returning true... but where did the modified string go?!!! I guess I must copy it to some variable. Oldes 17:01@cosacam1 something like this? st: "??Que? a'!!" parse st [ any [ change "??" #"¿" | change "a'" #"á" | change "!!" #"¡" | skip ] ] ? st ;== ST is a string! value: "¿Que? á¡" cosacam1 17:10absolutely yes! Still learning. Thank you very much! Oldes 17:11Or a little bit longer: skip-ch: complement charset "?a!" changes: #( "??" #"¿" "a'" #"á" "!!" #"¡" ) parse st [ any [ s: copy x [ "??" | "a'" | "!!" ] e: ( print ["Replacing:" x] e: change/part s changes/:x e ) :e | thru skip-ch ] ] 17:15But probably the best is a combination of these two: skip-ch: complement charset "?a!" ;; ignored characters parse st [ any [ change "??" #"¿" | change "a'" #"á" | change "!!" #"¡" | thru skip-ch ;; finds next ?, a or ! char ] ] cosacam1 17:15C'mon Oldes! I'm 60, man! :D 17:17Yes, I understand complement but the ignored chars would be the whole alphabet A - Z a - z, so the first solution is the best Oldes 17:20Sorry, don't understand you now... in your code above, you have just a few more chars, which are imoportant, like e, i, o, u.. 17:20You really should not use the first code where is just skip, else you will force the code to do a lot of useless checks 17:23And the second version may be simplified to: skip-ch: complement charset "?a!" parse st [ any [ s: [ "??" (n: #"¿") | "a'" (n: #"á") | "!!" (n: #"!") ] e: ( print ["Replacing:" copy/part s e "to:" n] e: change/part s n e ) :e | some skip-ch ] ] (to avoid the lookup for the new value) hiiamboris 17:24you probably meant some skip-ch not thru skip-ch Oldes 17:25It is the same, isn't it? 17:25ah.. it isn't, you are right! some skips all skipable chars, while thru would skip just one. hiiamboris 17:31I guess you also still need trailing | skip backup, in case it's e.g. ? but not ?? Oldes 17:32Only if you care, that parse returns true hiiamboris 17:32but it may stuck otherwise Oldes 17:33But probably yes.. it should be there in case that there would be a combination of not skipable chars at the end needed to be replaced. hiiamboris 17:33try e.g. st: "? ??Que? a'!!" cosacam1 17:38I see your point. You put in skip-ch whatever char that can be skipped with 'thru' but the other chars (in my case aeioun?!) must be checked if they are followed by '~: etc, that's why you check those cases first... but what if the a (for instance) is not followed by those symbols? how parse does not return false in that case? 17:40 >> skip-ch: complement charset "aeioun?!" == make bitset! [not #{000000004000000100000000444304}] >> st: {??Quie'n me librara' de la vergu:enza y la muerte? Cada man~ana alabare' al Sen'or. !!Aleluya!} == {??Quie'n me librara' de la vergu:enza y la muerte? Cada man~ana alabare' al Sen'or. !!Aleluya!} >> parse st [any [change "a'" #"á" | change "e'" #"é" | change "i'" #"í" | change "o'" #"ó" | change "u'" #"ú" | change "??" #"¿" | change "!!" #"¡" | change "u:" #"ü" | change {u"} #"ü" | change "n'" #"ñ" | change "n~" #"ñ" | thru skip-ch]] == false >> st == {¿Quie'n me librará de la vergüenza y la muerte? Cada man~ana alabaré al Sen'or. ¡Aleluya!} >> Oldes 17:40You probably really have to use just the simple skip from the first version. cosacam1 17:40it's returning false and st is not being changed. 17:42nope. The first version returns true but it doesn't modify the string 17:43 >> st == {¿Quie'n me librará de la vergüenza y la muerte? Cada man~ana alabaré al Sen'or. ¡Aleluya!} >> parse st [ [ any [ [ change "??" #"¿" [ | change "a'" #"á" [ | change "!!" #"¡" [ | skip [ ] [ ] == true >> st == {¿Quie'n me librará de la vergüenza y la muerte? Cada man~ana alabaré al Sen'or. ¡Aleluya!} >> hiiamboris 17:43it's already modified :) cosacam1 17:44oh, sorry, I must include more symbols 17:44just copy paste your example 17:47It works now 17:48 >> st: {??Quie'n me librara' de la vergu:enza y la muerte? Cada man~ana alabare' al Sen'or. !!Aleluya!} == {??Quie'n me librara' de la vergu:enza y la muerte? Cada man~ana alabare' al Sen'or. !!Aleluya!} >>>> parse st [ [ any [ [ change "??" #"¿" [ | change "!!" #"¡" [ | change "a'" #"á" [ | change "e'" #"é" [ | change "i'" #"í" [ | change "o'" #"ó" [ | change "u'" #"ú" [ | change "u:" #"ü" [ | change {u"} #"ü" [ | change "n'" #"ñ" [ | change "n~" #"ñ" [ | skip [ ] [ ] == true >> st == {¿Quién me librará de la vergüenza y la muerte? Cada mañana alabaré al Señor. ¡Aleluya!} >> 17:49Thank you very much hiiamboris 17:51I wonder doesn't your OS do this substitution for you? 17:522023... people still need to reinvent the wheel of entering letters of their alphabet cosacam1 17:58Well, in MS Word you can type Ctrl ' a and it shows á, but elsewhere you must type Alt 160. It has been always this way in Windows and MS-DOS, I guess hiiamboris 18:00https://superuser.com/questions/110605/how-do-i-type-accented-characters-in-windows/642335#642335 18:01skipping the first two completely moronic solutions, it should be as easy as changing the input language Oldes 18:01What if you want to enter normal double quotes? Like: x: "you"... now you will get x: "yoü ne1uno 18:06right click menu could be another way 18:07w/keyboard shortcuts cosacam1 18:08@hiiamboris Thanks. yes, i've used Charmap for "weird" chars like those in Windings font when I've needed to. I only use US language however users some times use Spanish language with a US keyboard. just imagine! 18:09I don't have this problem because most I write is programs in plain English hiiamboris 18:12maybe you should just include a "how to add spanish language to windows?" manual :) 18:13for the users cosacam1 18:13@oldes, well, that function I wrote was for users to change some words in the Bible and there are no symbols there other than ? ! hippens commas etc. at least in the Reina-Valera 1960 version, which I included in my program. Remember, I just posted my function as a help for Piotr in the first place, nothing else, but this chatting has been very useful for me. Thanks again 18:16Guys, I must leave now, I get work to do. It's been nice to talk to you all, as always. Bye Oldes 18:16@cosacam1 here is another version: start-ch: charset "?!aeioun" parse st [ any [ to start-ch [ ;; skip any char that does not start replaceable combination change "??" #"¿" | change "!!" #"¡" | change "a'" #"á" | change "e'" #"é" | change "i'" #"í" | change "o'" #"ó" | change "u'" #"ú" | change "u:" #"ü" | change {u"} #"ü" | change "n'" #"ñ" | change "n~" #"ñ" | skip ;; no variation above, so just skip this char ] | to end ;; just to have true from parse ] ] gurzgri 23:15[![quickaccent.gif](https://files.gitter.im/5780ef02c2f0db084a2231b0/Uyue/thumb/quickaccent.gif)](https://files.gitter.im/5780ef02c2f0db084a2231b0/Uyue/quickaccent.gif) 23:15@cosacam1 Certainly not a solution for all of your customers/users, but if you personally often have to deal typing characters with accents and/or diacritics, well, then maybe "Quick Accent" from Microsoft's ["PowerToys"](https://learn.microsoft.com/en-us/windows/powertoys/quick-accent) is for you: If you want "ñ", press and hold "n" + press the activation key <space> and/or <left>/<right> — an overlay to select the desired accented character between multiple characters will appear. piotrbajdek 23:41Thanks, @Oldes , this is amazing! :-O I'll see if I can implemented it... BTW, this is a pure Rust but you might be interested in [lngcnv](https://github.com/piotrbajdek/lngcnv)--see for example this [module for Spanish](https://github.com/piotrbajdek/lngcnv/blob/main/src/lang/modspa.rs). In Red, is there any difference in performance between and change and replace methods? 23:56Sorry, I was going to mention @cosacam1 ;-) 23:57But the responses from all of you are helpful... Thursday 9th February, 2023 piotrbajdek 01:17I've got some issues with the implementation of the automatic conversion of characters from the @cosacam1 's first example because the text in the area gets suddenly scrolled down each time the characters are converted... I'd rather use it for small fields just like you say. But, my primitive solution with a simple on-click button works just fine.. :-) button "Conv. carácteres" font [name: "Gentium Plus" size: 13] [ replace/all input/text "a1" "ã" replace/all input/text "a2" "a̰" replace/all input/text "a3" "ã̰" ] Oldes 08:25@piotrbajdek change modifies series at its current position (index), while replace goes thru the series and modifies first found needle (if not used with /all). >> change s: "abcd" "X" :s == "Xbcd" >> replace s: "abcd" "b" "X" :s == "aXcd" 08:26Also... as find returns position of the needle, replace can be replaced with: >> s: "abcd" change find s "b" "X" :s == "aXcd" 09:22@cosacam1 it looks that parse itself is not fast as I fought... for the best results you would probably want to collect results in a new series instead of modifying the input... using-replace: func[str][ replace/all str "??" #"¿" replace/all str "!!" #"¡" replace/all str "a'" #"á" replace/all str "e'" #"é" replace/all str "i'" #"í" replace/all str "o'" #"ó" replace/all str "u'" #"ú" replace/all str "u:" #"ü" replace/all str {u"} #"ü" replace/all str "n'" #"ñ" replace/all str "n~" #"ñ" str ] start-ch: charset "?!aeioun" using-parse-collect: func[str /local out][ out: make string! length? str parse str [ collect into out any [ keep to start-ch [ "??" keep (#"¿") | "!!" keep (#"¡") | "a'" keep (#"á") | "e'" keep (#"é") | "i'" keep (#"í") | "o'" keep (#"ó") | "u'" keep (#"ú") | "u:" keep (#"ü") | {u"} keep (#"ü") | "n'" keep (#"ñ") | "n~" keep (#"ñ") | keep 1 skip ] keep to end ] ] out ] ;; With some longer input data... st: {??Quie'n me librara' de la vergu:enza y la muerte? Cada man~ana alabare' al Sen'or. !!Aleluya!} st1000: make string! 1000 * length? st insert/dup st1000 st 1000 dt [using-replace copy st1000] ;== 0:00:00.815511 dt [using-parse-collect st1000] ;; no need to use copy, as it makes new series itself ;== 0:00:00.508658 09:25Btw... the same code on Rebol3: >> dt [using-replace copy st1000] == 0:00:00.051885 >> dt [using-parse-collect st1000] == 0:00:00.013872 greggirwin 17:30Profiling for the win. :^) hiiamboris 17:3940x difference :D 17:57about 100x difference on my laptop 17:59I wonder what part of Red is so badly optimized here 18:02actually, dt contributes a lot too 18:02 >> profile/times [[using-parse-collect st1000]] 500 Running 1 code blocks 500 times. ------------------------------------------------------------------------------------------- Time | Evals | S.made | S.expa | Memory | Code 1.0x (26μs) | 27 | 3 | 1 | 356352 | [using-parse-collect st1000] ------------------------------------------------------------------------------------------- 18:03 >> clock/times [using-parse-collect st1000] 500 5.49 ms [using-parse-collect st1000] 18:03 >> 5.49 / 0.026 == 211.1538461538462 Oldes 18:05The difference is probably because I am on M1 mac and so have Red only inside a Docker. hiiamboris 18:06but I'm not, and still get 200x difference 18:08this also makes me wonder why R3 on M1 mac is 500x slower than R3 on i7 18:09smth is fishy Oldes 18:10The Red's clock is using another measure. hiiamboris 18:11milliseconds, I accounted for it 18:125.49 ms Red vs 26 us R3 18:12and 13.9 ms R3 M1 vs 26 us R3 i7 18:13how to explain this? Oldes 18:15I don't think you can compare profile with clock... The profile is using loop, but the result is divided by the loop count, where clock is reporting the time of the whole loop. hiiamboris 18:16no, it acts the same 18:16see ?? clock Oldes 18:20Also it probably depends, if the notebook is connected on power or just on battery hiiamboris 18:23I ran both tests in performance mode, and repeated them enough times to ensure deviation is negligible cosacam1 18:25Hi again. First, @piotrbajdek I appreciate your comments about my little contribution. Thanks. Glad to help. Second, @Oldes thanks for your many versions on parse variation of my code. About it's efficiency (well, not the best, I realize) take into account that it is run every time the user changes his/her input in the field but, thanks to the if find... and the break, it is a litlle less inefficient. And last but not least, I never though that this would bring so much scrutiny about Red itself compared to Rebol. I hope it contributes to improve Red. My recognition for both Carl and Nenad, and all you guys who keep alive this piece of art called Rebol/Red. 18:34afaik you Red developers earn no money for doing this job, so you must make a living doing something else. It's a pitty, because Red has being in alpha state for so long. I think there are some little details (like this of caret in fields and areas) that should be solved in order to make the language more robust. I make Red propaganda to every programmer I meet. afaik I'm the only one in my country programming in Red... and I don't even work for a software company! Just imagine how I feel about it. best wishes, Reducers! Now, back to work. hiiamboris 18:36:+1: 18:36thanks dude cosacam1 18:38@Oldes you were right. I already removed the {u"} possibility from my program. I only left "u:". Thanks. 18:39@hiiamboris you're welcome hiiamboris 18:39meanwhile I have put the script into a file to ensure it's no copy/paste error anywhere, results were correct (and weird): D:\devel\red\spaces>red "1.red" 143 ms [using-replace copy st1000] 7.81 ms [using-parse-collect st1000] D:\devel\red\spaces>r3 1.red Running 1 code blocks 100 times. ------------------------------------------------------------------------------------------- Time | Evals | S.made | S.expa | Memory | Code 1.0x (21ms) | 112575 | 2 | 0 | 282624 | [using-replace copy st1000] ------------------------------------------------------------------------------------------- Running 1 code blocks 1000 times. ------------------------------------------------------------------------------------------- Time | Evals | S.made | S.expa | Memory | Code 1.0x (23μs) | 27 | 3 | 1 | 356352 | [using-parse-collect st1000] ------------------------------------------------------------------------------------------- 18:43https://gist.github.com/hiiamboris/c29f1d4f315a760a103b4bb46b48c183 18:43if anyone wishes to test as well greggirwin 18:45Red 102 ms [using-replace copy st1000] 4.41 ms [using-parse-collect st1000] I don't have R3 set up here, other than a very old one. 18:52In general, remember that replace is meant to be easy to use, not fast. Especially for interactive use on smaller data, as long as it's faster than a human cares about, we each have to weigh dev time and potential bugs. For cases like this, rather than suggesting hand-rolling parse solutions, what we may really want is a transliterate function, to replace a table of values. Higher level, declarative, and only @hiiamboris and @Oldes have to spend time getting it right. :^) hiiamboris 18:58I agree :) this is not about particular implementation, but about how it is handled by R3/intel R3/mac and Red/intel 19:00Perhaps C compiler exploits some intel-only feature greggirwin 19:08Compiler optimizations can be huge, even if pigeon-holed. Oldes 19:52On my M1 machine I have for using-parse-collect 8μs on ARM64 build and 18μs on x64 build under Rosetta emulation. So I don't see any problem with it. hiiamboris 19:58so this was a glitch? >> dt [using-parse-collect st1000] == 0:00:00.013872 Oldes 20:17Probably 20:18delta-time is not precise enough. Friday 10th February, 2023 cosacam1 10:15How to get LDAP username with Red? 13:47I already found a unit for Delphi7. I'm studying now. hiiamboris 15:52seems like Red Parse is far from optimized (test on 100k zero-char string): >> nonzero: complement zero: charset "^@" == make bitset! [not bits #{80}] ;; R3 could use some work too: >> profile/times [[parse s [some zero]] [parse s [to nonzero]] [parse s [some #"^@"]]] 1000 Running 3 code blocks 1000 times. -------------------------------------------------------------------------------------------- Time | Evals | S.made | S.expa | Memory | Code 1.0x (814μs) | 4 | 0 | 0 | 0 | [parse s [to nonzero]] 1.17x (950μs) | 5 | 0 | 0 | 0 | [parse s [some #"^@"]] 1.86x (2ms) | 5 | 0 | 0 | 0 | [parse s [some zero]] -------------------------------------------------------------------------------------------- ;; Red, esp. surprising is the TO vs SOME difference: >> clock/times [parse s [to nonzero]] 100 8.74 ms [parse s [to nonzero]] >> clock/times [parse s [some #"^@"]] 1000 6.21 ms [parse s [some #"^@"]] >> clock/times [parse s [some zero]] 1000 654 μs [parse s [some zero]] cosacam1 17:16Nenad's ldap protcol in Rebol might work in Red? https://github.com/gchiu/Rebol2/blob/master/Protocols/ldap-protocol.r I know nothing about LDAP. Just my boss demands that username can be checked hiiamboris 17:20I don't think so 17:21in my opinion best shot for now is to plug some LDAP C lib with R/S 17:21or find a CLI tool if it exists and call it 17:24GPT answer FWIW: > Yes, there are several CLI tools that can be used to check a username with LDAP. Some popular examples include ldapsearch, ldapadd, ldapmodify, and ldapdelete. cosacam1 17:44[![image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/rNUp/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/rNUp/image.png) 17:44in Windows? 17:45[![image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/Vx2u/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/Vx2u/image.png) 17:45 Microsoft Windows [Version 10.0.19043.962] (c) Microsoft Corporation. All rights reserved. C:\Users\cosacam>ldapsearch 'ldapsearch' is not recognized as an internal or external command, operable program or batch file. C:\Users\cosacam> hiiamboris 17:47https://searx.be/search?q=ldapsearch+download cosacam1 18:01it seems that my AV don't like the ldapsearch setup 18:02I'll keep on moving with something else in my program. thanks anyway Sunday 12nd February, 2023 TimeSlip 05:58I've got a binding I'm trying to get working and the struct has an "unsigned short". Should I be using integer! ? hiiamboris 09:59You'll have to extract the short (2 shorts likely) from an integer, and encode them back from it manually. TimeSlip 15:30@hiiamboris Thanks. That makes some sense because what I am getting back looks like a combination of what appears to be two fields. Appreciate your help. 17:49 switch mytype [ 1 [v: (val and FFFFh)] ;vendor id 2 [v: ((val >>> 16) and FFFFh)] ;product id ] 17:49Works! Thanks @hiiamboris hiiamboris 18:01:+1: 18:01and FFFFh is not needed btw for product id TimeSlip 18:05So right! That's how much I know about this stuff. I have to ask, how do I printf a carriage return? \n does not work in R/S. I end up using a probe "". hiiamboris 18:06\#"^/" or lf TimeSlip 18:08I can't believe I didn't try that! Thanks again. hiiamboris 18:09:) TimeSlip 23:29So my R/S function returns a struct. Is there a way to pass that to red? Or do I have to return each part separately? If I'm not mistaken I'm dealing in two different worlds here. haizetan:matrix.org 23:53is there a way to use command line arguments when running a script with red?`
