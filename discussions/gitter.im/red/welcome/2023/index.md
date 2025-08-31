# Archived messages from: [gitter.im/red/red/welcome](/gitter.im/red/red/welcome/) from year: 2023

## Wednesday 11st January, 2023

JoshieOnNFT\_twitter

[06:46](#msg63be5b3aff1fd121b33c7331)GM admin. I'm Joshua, Business Development &amp; Strategic Partnership at Coinstore (Global CEX). May I ask who should I contact for listing?

## Thursday 12nd January, 2023

brk-klymn

[15:24](#msg63c02616ff1fd121b33ffbfe)Hey, I am very intriged by this language, I've tried to learn it a while ago but could'nt find a resource for learning the language, anyone has suggestions?

hiiamboris

[15:28](#msg63c027003b37dd2c11773995)☝ in the topic :)

[15:28](#msg63c0273b410c633d48213095)some people also like http://helpin.red/

[15:31](#msg63c027de3b37dd2c11773bb9)don't be afraid of reading Rebol/Core manual though, it is mostly relevant to Red as well

brk-klymn

[15:32](#msg63c0281b410c633d482132f5)I've tried that a bit, how do you suggest learning red?

hiiamboris

[15:35](#msg63c028befb195421bd7fff04)do you know any other languages?

brk-klymn

[15:36](#msg63c02909be2c3c20c7465b7a)yes

hiiamboris

[15:37](#msg63c02923be2c3c20c7465bab)which ones? just so I know your background

brk-klymn

[15:39](#msg63c029a33b37dd2c11773ed6)oh :) well c,java and python I know the best, other than that I love functional programming, playing with haskell, elixir and ocaml

hiiamboris

[15:39](#msg63c029b37de82d261626272e)ok great :)

[15:40](#msg63c029de63c9fc72d324d60e)In any case I would recommend reading the interesting bits in Rebol manual, to get the idea of how it works (it's the best resource IMO). And keep Rebol console open so you can play with the stuff you read, study it. With your knowledge you will mostly just skim a lot of it.

[15:41](#msg63c02a1bff1fd121b34003f0)As C user, you'll find series in Red and Rebol familiar. Same pointers.

[15:41](#msg63c02a3e378d512c185b8b4d)As a Python user you may also find this page handy: https://github.com/red/red/wiki/A-short-introduction-to-Red-for-Python-programmers

brk-klymn

[15:42](#msg63c02a49378d512c185b8b5f)REBOL console, not Red yes?

hiiamboris

[15:42](#msg63c02a5a40557a3d5c71b4f0)Yes, use Rebol console with Rebol manual :)

[15:43](#msg63c02aac7de82d26162629bd)View subsystem is better learned via Red \[official docs](https://github.com/red/docs/blob/master/en/) (View, VID, reactivity). Different from Rebol.

[15:44](#msg63c02adb8f8df4262aecbb1d)After you get the basics, find yourself an easy task and try to implement it in Red :)

[15:46](#msg63c02b6e8f8df4262aecbc66)Or https://exercism.org/tracks/red/exercises :)

brk-klymn

[16:06](#msg63c02ff08f8df4262aecc709)thank you very much! I actualy just downloaded rebol, I'm using void linux and trying to use it with the terminal it says no such file or directory

[16:06](#msg63c0301340557a3d5c71c0e5)I remember having this problem with red and the I downloaded the multilib for 32bit support but with rebol it didn't help time

hiiamboris

[16:09](#msg63c030bd0cd40c2e89d21dd0)not familiar with this distribution, sorry

brk-klymn

[16:10](#msg63c030dc7de82d2616263658):\\ I'll try some stuff, thanks though

hiiamboris

[16:10](#msg63c031050dba35742371d420)well, there shouldn't be any difference, R2 or Red, both 32-bit GUI consoles

brk-klymn

[16:17](#msg63c032b6ff1fd121b340158d)some 32bit libraries were missing, got it to work now, thank you for all your help!

hiiamboris

[16:21](#msg63c03380c4fec572d6808cf9):+1:

[16:22](#msg63c033d9410c633d482148fb)R2 will also be helpful when you will want to compile your creations ;)

Respectech

[20:21](#msg63c06bae0dba357423724d08)This article may be helpful in getting Rebol to run on Linux: https://ameridroid.com/blogs/ameriblogs/how-to-run-rebol2-scripting-language-on-debian-based-arm-systems

## Friday 13th January, 2023

planetsizecpu

[07:05](#msg63c102a3fb195421bd81a82f)Welcome btw @brk-klymn and @JoshieOnNFT\_twitter

Lc\_1231\_twitter

[15:11](#msg63c174b70dba357423746213)Hello. I'm new here. I've recently discovered Rebol/Red and been enchanted. I develop web apps and have been trying to convert some of my projects into the language. As hard as I have looked for, I haven't found ready solutions for Red. Is there any? But I found Cheyenne for R2 which is wonderful. Unfortunately it seems to lack SSL certificates + I can't get it working with SQLlite becuase of different architectures (Cheyenne running on R2/Core 32-bit, libsqlite3.so being 64-bit). It would be nice to have a Red porting of Cheyenne.

[15:15](#msg63c17579c4fec572d6830e27)I tried connecting to SQLite3 by dobeash (http://www.dobeash.com/sqlite.html) but compatibility issues are the same with any other library.

hiiamboris

[15:23](#msg63c1776a8f8df4262aef4cd7)Welcome @Lc\_1231\_twitter :)  
@rebolek has some minimalistic server, he may tell where it can be found and how it can be used  
for SQLite there's \[this old work](https://github.com/red/code/blob/master/Library/SQLite/SQLite3.reds) but you better ask in https://gitter.im/red/database group

Lc\_1231\_twitter

[15:24](#msg63c177c68f8df4262aef4d88)Great, thank you!

hiiamboris

[15:24](#msg63c177cbd8678973f9af212d)Red is still 32-bit though, so you'll need a 32-bit SQL library

Lc\_1231\_twitter

[15:25](#msg63c177f2410c633d4823e5a1)Ah! Ok.

hiiamboris

[15:28](#msg63c17885c9591d20d39fce35)On Ubuntu the command seems to be `apt install libsqlite3-0:i386`

Lc\_1231\_twitter

[15:30](#msg63c17913ff1fd121b342a1b8)Thanks! I got it through apt-get install libsqlite3-dev.

[15:31](#msg63c179408f8df4262aef506c)Than I found it in /usr/lib/i386-linux-gnu/.

[15:31](#msg63c179438f8df4262aef5071)Then.

## Monday 16th January, 2023

rebolek

[08:10](#msg63c50662c9591d20d3a55e79)@Lc\_1231\_twitter for my \[HUB server](https://gitlab.com/rebolek/castr/) you need the \[IO branch](https://github.com/red/red/tree/IO) of Red.

[08:10](#msg63c506913b37dd2c117f5fd4)But it works with SSL certificates nicely

endo64

[09:38](#msg63c51afcccd5355fcfdfa6a4)You can also use Ashley's munge.r which works with sqlite using sqlite commandline tool. It also has lots of useful features.

## Tuesday 31st January, 2023

lylgithub2021

[02:41](#msg63d87fcf624f3f43303a3c46)Parenthesis in red play two roles.(1)control eval sequence,for example, `if (add 3 5) > 7`,

here parenthesis must be used, or the code will fail to work.(2)codes only in parenthesis be

evaled by `compose`.I'd like to know how to keep code in parenthsis(and its parenthsis) to stay

its condition when using `compose` or `compose/deep` as the followingg example showes:

`compose/deep [[a: (1 + 2) if (a + 1) > 3 [print "OK"]]]` by which I want to get this: `[[a: 3 if (a + 1) > 3 [print "OK"]]]`

ne1uno

[02:49](#msg63d881a349431d6370243d0b)`lylgithub2021, to-paren`

greggirwin

[02:55](#msg63d883237740c84e493e552b)It's a bit ugly to do, but you can also do it this way:

```
compose/deep [
	[a: (1 + 2) if ([(a + 1)]) > 3 [print "OK"]]
]
```

In fact, it's been such a problem for some people that they thought about how to solve it with a new func: https://gist.github.com/greggirwin/29836d25de0c68eaba0e6dbd268a20f5 many links to old material there, and great research by @hiiamboris .

lylgithub2021

[03:00](#msg63d884590c94855213d84527)Many thanks for your solution and info. And why is the inner parenthesis `(a + 1)` not evaled since the refinement /deep is used? @greggirwin

ne1uno

[03:01](#msg63d88487cea93403345aaa5c)sometimes reads a little award but flipping things around can work. `if 3 > add 1 a [print a]`

[03:03](#msg63d8851e7740c84e493e599e)`to-paren [a + 1]`

greggirwin

[03:04](#msg63d8853bc2911455434255cf)`to paren!` is clearer in this case, IMO.

[03:04](#msg63d8854ad00f0d4947343768)It's certainly more clear in the intent.

lylgithub2021

[03:10](#msg63d886ae603e2b638737b6eb)@ne1uno Would you please say more about your note? I still don't quite understand it.

ne1uno

[03:13](#msg63d88769fb5fe8552e57ceb1)you tried `to-paren (a + 1)` try `to-paren [a + 1]`

[03:15](#msg63d887b5434214494d30b953)meta programming is the worst, try multiple things

greggirwin

[03:17](#msg63d8885fcea93403345ab093)The reason it works in my example is because `compose` does not do depth-first evaluation. That is, it sees the paren after `if` and evaluates what is in it, which is a block. That is the result it uses in the output. Because `/only` was \*not* used, the outer brackets of the block are not included, only the values \*inside* the block. In this case that's a single `paren!` value.

ProDimSum

[06:50](#msg63d8ba52624f3f43303aa25d)Hello

[07:04](#msg63d8bd9180dc214e329bc313)need little bit help here with red/system I am trying to figure out how to do kernel and I am following this https://os.phil-opp.com/ to learn bare metal. Also new to programming world.

[07:06](#msg63d8bdeac29114554342b972)any good resource to learn red/system with examples would be nice thanks

[07:08](#msg63d8be618e760b51fd1653d0)one more question how to access files/database over network can not find any examples on google

ldci

[09:22](#msg63d8ddd080dc214e329bff23)@ProDimSum. For Red/system have a look here: https://static.red-lang.org/red-system-specs.html and here: https://github.com/ldci/Red-System. You can also look at https://github.com/ldci/redCV which uses a lot of Red/System code.

hiiamboris

[09:27](#msg63d8defccea93403345b4ea7)@ProDimSum ask around https://gitter.im/red/database on database modules

[09:29](#msg63d8df75fb5fe8552e586fda)@lylgithub2021 with \[reshape](https://codeberg.org/hiiamboris/red-common/src/branch/master/reshape.md) it's straightforward:  
`reshape [[a: !(1 + 2) if (a + 1) > 3 [print "OK"]]]`

[09:31](#msg63d8dffa0c94855213d8e800)though I lately have been looking to replace `!(...)` with `@[...]`

## Thursday 2nd February, 2023

lylgithub2021

[03:34](#msg63db2f41bf77a52432831bbc)

```
Red [needs: view]
view [
;; 1st
d1: drop-down data [] panel[text react[face/text: d1/text]]
return
;; 2nd
panel[text react[face/text: d2/text]] d2: drop-down data []
do [self/selected: d2]
]
```

I think the first line of code and the second line of code in `view` tell the same thing -- the content of the facet `text` changes with the input in the related `drop-down`. But the second does not work as expected. How to make it work under present facets layout.

[03:35](#msg63db2f90ab2bdb2b698f22eb)@hiiamboris many thanks for this new idea(`reshape)`!!

mikeyaunish

[05:08](#msg63db4562ac888c172f4a13a0)@lylgithub2021 try this:

```
panel[text react[face/text: d2/text]] d2: drop-down data []
do [self/selected: d2]
]
```

Looks like it was just a typo.

lylgithub2021

[07:58](#msg63db6d430c93272347087242)Thank you. I don't find the difference between your code and mine's. In my last message, I said `the second does not work as expected`, that means the content of `text` fails to change with the input of `drop-down`(`d2`). So how to make it work under present facets layout.

toomasv

[08:31](#msg63db74fc6db6de624bb437e2)@lylgithub2021 Interesting, it seems to depend on the order of definitions. Not sure if it is intended. This seems to work:

```
view [
   d1: drop-down data [] panel [text react [face/text: d1/text]] 
   return 
   panel [t1: text] d2: drop-down focus data [] 
   do [react [t1/text: d2/text]]
]
```

hiiamboris

[08:34](#msg63db75826376f2625254f1bc)Yes. There's no `d2` at the time that reaction is processed, so I suppose it refers to the face created from a previous attempt.

## Friday 3th February, 2023

lylgithub2021

[01:11](#msg63dc5f5a747c6938e1fcc68d)Thank youu so much @hiiamboris @toomasv !!

[01:16](#msg63dc606af0c41678f3a8c830)

```
view[
r1: radio "r1"return r2: radio "r2" return
text react [face/text: either r1/data ["r1 yes"]["r1 no"]]
text react [face/text: either r2/data ["r2 yes"]["r2 no"]]
]
```

`text` changing with the condition of related `radio` is expected when running the above codes. The result(the content of `text` and the appearance of `radio`) of clicking `r1` and `r2` is however, very strange. Any one could try this code and help me with it?

toomasv

[05:16](#msg63dc98c8480b726318a840f6)@lylgithub2021 I'm not sure what happens there. :( Hopefully @hiiamboris can explain. Meanwhile there is a way to do this for ordinary people:

```
view [
   r1: radio "r1" on-change [t1/text: rejoin ["t1 " face/data]] return 
   r2: radio "r2" on-change [t2/text: rejoin ["t2 " face/data]] return 
   t1: text t2: text
]
```

[05:24](#msg63dc9a9bc841ba597f2703c4)Playing further:

```
view [
   style myradio: radio on-change [
      i: index? find face/parent/pane face 
      ts/pane/:i/text: rejoin ["t" i " " face/data]
   ] 
   panel [origin 0x0 myradio "r1" return myradio "r2"] return 
   ts: panel [origin 0x0 text text]
]
```

[05:55](#msg63dca1ccc841ba597f271153)I guess, this is caused by predefined reactive connection of radio faces, which is broken by explicit `react`.

lylgithub2021

[06:00](#msg63dca2ef480b726318a8526c)Thank you

[06:21](#msg63dca804da007e54476b1f52)@toomasv The reason why I use `react`, not the ordinary way , is：when `r1: radio with [data: true] [t1/text: rejoin ...]`, the text of `t1` is not displayed initially. `r1` has to be clicked to view the text of `t1`. Then I have to `t1: text with [face/text: either r1/data [...][...]`. You see, the text of `r1` which I want to display has to be written twice. Coding once is preferred.

toomasv

[07:11](#msg63dcb392480b726318a8723f)I see.

[08:59](#msg63dccd07f4ead81aa35ac67f)@lylgithub2021 You can reenforce correct behaviour:

```
view [
   style myradio: radio on-up [
      foreach-face face/parent [face/data: false] 
      face/data: true
   ] 
   rs: panel [
      origin 0x0 below 
      myradio "r1" data true 
      myradio "r2" data false
   ] 
   return 
   ts: panel [
      origin 0x0 
      text text
   ] on-created [
      foreach f face/pane [
         react compose [
            i: index? find ts/pane (f) 
            r: rs/pane/:i 
            set in (f) 'text rejoin [r/text " " r/data]
]]]]
```

hiiamboris

[10:46](#msg63dce612f4ead81aa35afc4e)@lylgithub2021 great find!

[10:47](#msg63dce63f480b726318a8d4d6):point\_up: \[February 3, 2023 4:11 AM](https://gitter.im/red/red/welcome?at=63dc5f5a747c6938e1fcc68d) this is something @dockimbel must look at, to better understand how reactivity performs in practice, and how hard it can be to debug

## Sunday 5th February, 2023

ProDimSum

[07:20](#msg63df58b4c841ba597f2c3504)how to compile code for bare metal ?

rebolek

[07:36](#msg63df5c6bf0c41678f3ae5a2b)what do you mean by bare metal?

ProDimSum

[09:29](#msg63df76f9195b0f6482823620)i mean run executable on direct machine

[09:30](#msg63df7733511fff631f67608e)i mean run it without operating system i guess

[09:30](#msg63df774b4ecd45446ec5d2d4)https://os.phil-opp.com/freestanding-rust-binary/

[09:31](#msg63df778aeddd71596c16c009)do we have example of making kernel hello world somewhere?

hiiamboris

[10:55](#msg63df8b2c6fc5ff38e44b8ea0)you need `--no-runtime` flag when compiling

[10:58](#msg63df8bdd9c90f8647b2c4e6b)@dockimbel may advise on what compilation target should be used

ProDimSum

[13:09](#msg63dfaa864a6a184463154f7a)kernel.reds file

[13:09](#msg63dfaa886b829e1a9a7aaeee)code

[13:18](#msg63dfacbc4ecd45446ec630a2)when i use redt -c --no-runtime kernel.red

[13:20](#msg63dfad07f0c41678f3aeeef9)'code' sym: as-integer LoadCursor null sym  
]  
SetWindowLong hWnd wc-offset - 28 sym  
]  
true \[0]  
]  
word: word + 2  
len: len - 2  
]  
]  
]  
OS-redraw: func \[hWnd \[integer!]] [  
InvalidateRect as handle! hWnd null 0  
UpdateWindow as handle! hWnd  
]  
OS-refresh-window: func \[hWnd \[integer!]] \[UpdateWindow as handle! hWnd]  
OS-show-window: func [  
hWnd \[integer!]  
/local  
face \[red-object!]  
] [  
if prev-captured &lt;&gt; null \[ReleaseCapture]  
check-base-capture  
ShowWindow as handle! hWnd 10  
UpdateWindow as handle! hWnd  
unless win8+? [  
update-layered-window as handle! hWnd null null null -1  
]  
SetForegroundWindow as handle! hWnd  
set-selected-focus as handle! hWnd  
]  
OS-make-view: func [  
face \[red-object!]  
parent \[integer!]  
return: \[integer!]  
/local  
values \[red-value!]  
type \[red-word!]  
str \[red-string!]  
offset \[red-pair!]  
size \[red-pair!]  
data \[red-block!]  
menu \[red-block!]  
show? \[red-logic!]  
enabled? \[red-logic!]  
selected \[red-integer!]  
para \[red-object!]  
rate \[red-value!]  
options \[red-block!]  
fl \[red-float!]  
flags \[integer!]  
ws-flags \[integer!]  
bits \[integer!]  
sym \[integer!]  
state \[integer!]  
class \[c-string!]  
caption \[c-string!]  
value \[integer!]  
handle \[handle!]  
hWnd \[handle!]  
p \[ext-class!]  
id \[integer!]  
vertical? \[logic!]  
panel? \[logic!]  
alpha? \[logic!]  
para? \[logic!]  
off-x \[integer!]  
off-y \[integer!]  
rc \[RECT\_STRUCT value]  
si \[tagSCROLLINFO]  
ratio \[float!]  
] [  
stack/mark-native words/\_body  
values: object/get-values face  
type: as red-word! values + FACE\_OBJ\_TYPE  
str: as red-string! values + FACE\_OBJ\_TEXT  
offset: as red-pair! values + FACE\_OBJ\_OFFSET  
size: as red-pair! values + FACE\_OBJ\_SIZE  
show?: as red-logic! values + FACE\_OBJ\_VISIBLE?  
enabled?: as red-logic! values + FACE\_OBJ\_ENABLED?  
data: as red-block! values + FACE\_OBJ\_DATA  
menu: as red-block! values + FACE\_OBJ\_MENU  
selected: as red-integer! values + FACE\_OBJ\_SELECTED  
para: as red-object! values + FACE\_OBJ\_PARA  
rate: values + FACE\_OBJ\_RATE  
options: as red-block! values + FACE\_OBJ\_OPTIONS  
bits: get-flags as red-block! values + FACE\_OBJ\_FLAGS  
flags: 1073741824 or 67108864  
ws-flags: 0  
id: 0  
sym: symbol/resolve type/symbol  
panel?: no  
alpha?: no  
para?: TYPE\_OF (para) = TYPE\_OBJECT

[13:21](#msg63dfad4c62844178f6e64934)I get this kind of output is this normal ??

[13:22](#msg63dfad7df0c41678f3aef025)I don't know how to post whole output chat is chopping it all

hiiamboris

[13:41](#msg63dfb2044a6a184463155ede)https://gist.github.com

[13:43](#msg63dfb2914a6a184463155fb1)Also there's a markdown cheatsheet available at a click to the right of the input line here -&gt;

ProDimSum

[13:44](#msg63dfb2c8c841ba597f2cd9d5)https://gist.githubusercontent.com/ProDimSum/c135634c6267df6bd1e7785ec99d8823/raw/3a568ee6177829753be52e53e6ee753d2a8803ee/error

[13:52](#msg63dfb4af4ecd45446ec64007)`Red/System kernel-entry: func [ main: func [] [ console-puts #"Hello World\n" ] call main ]`

[13:53](#msg63dfb4e5eddd71596c17324f)I can't figure it out

hiiamboris

[13:56](#msg63dfb5919c90f8647b2c9c5c)triple backticks

[13:59](#msg63dfb64c4a6a1844631565da)looks like header `Red/System []` is missing

[14:02](#msg63dfb6e6195b0f648282af3d)multi-megabyte compiler output is certainly not normal :) you can open \[an issue](https://github.com/red/red/issues/new?template=bug\_report.md) with \*minimal* reproducible example

ttamttam

[14:04](#msg63dfb7506b829e1a9a7ac542)No dependency? red-view-28jan23-ec0c31279: error while loading shared libraries: libcurl.so.4: cannot open shared object file: No such file or directory

ProDimSum

[14:07](#msg63dfb82e195b0f648282b0d7)

```
Red/System[]

kernel-entry: func [
    main: func [] [
        console-puts #"Hello World\n"
    ]
    call main
]
```

[14:08](#msg63dfb842f4ead81aa3605c02)it cuts off Red/System\[]

[14:08](#msg63dfb848f4ead81aa3605c08)this line

ttamttam

[14:08](#msg63dfb8506fc5ff38e44bde9b)OK… (\*) For Linux 64-bit distros, you need to install 32-bit supporting libraries.

ProDimSum

[14:11](#msg63dfb9186b829e1a9a7ac96b)@hiiamboris is my code okay ?

[14:11](#msg63dfb9209c90f8647b2ca2a5)i mean correct

[14:12](#msg63dfb966eddd71596c17391f)\** Compilation Error: invalid definition for function kernel-entry: nop

hiiamboris

[14:23](#msg63dfbbf462844178f6e6631c)idk what is `call` and `console-puts`?

[14:24](#msg63dfbc10f0c41678f3af0b38)also your string is in invalid format

[14:25](#msg63dfbc40195b0f648282b856)https://github.com/red/docs/blob/master/en/datatypes/string.adoc#3-literal-syntax

[14:25](#msg63dfbc744ecd45446ec64cfc)also nowhere in Red/System docs is stated that you can nest functions

[14:26](#msg63dfbc83511fff631f67d89c)https://static.red-lang.org/red-system-specs.html

[14:26](#msg63dfbca9eddd71596c173f04)and you're missing type declarations for your locals

ProDimSum

[14:29](#msg63dfbd664a6a70544c89df0e)okay I will do it again let me try it again

[14:30](#msg63dfbd91c841ba597f2cebe0)https://gist.githubusercontent.com/ProDimSum/c135634c6267df6bd1e7785ec99d8823/raw/3a568ee6177829753be52e53e6ee753d2a8803ee/error so this is not bug right?

[14:30](#msg63dfbda3da007e544770f32b)do i need to report it?

hiiamboris

[14:32](#msg63dfbded62844178f6e6661e)as I said above it is: :point\_up: \[February 5, 2023 5:02 PM](https://gitter.im/red/red/welcome?at=63dfb6e6195b0f648282af3d)

ProDimSum

[14:34](#msg63dfbe58195b0f648282bce8)okay

hiiamboris

[14:34](#msg63dfbe82f0c41678f3af0f07)make sure you can reproduce it (I don't see that output with your code)

ProDimSum

[16:24](#msg63dfd8284a6a70544c8a0edb)how to ask for help inside gui console to get proper answer?

[16:25](#msg63dfd86d480b726318ae630f)lets say I want to know about odbc scheme what approach should I do?

[16:26](#msg63dfd8a74ecd45446ec67ffc)? odbc No matching values were found in the global context.

[16:26](#msg63dfd8b5480b726318ae63b7)am i doing it wrong?

hiiamboris

[16:28](#msg63dfd91a4a6a18446315a40c)have you read https://github.com/gurzgri/red/blob/master/environment/schemes/odbc.md ?

[16:28](#msg63dfd93af4ead81aa36094e0)ODBC is not part of the standard Red runtime, it's a work done by @gurzgri

ProDimSum

[16:33](#msg63dfda674a6a70544c8a1313)one more question how red is designed? I mean will red not support connections to database directly and we have to depend on community developed scripts ?

hiiamboris

[16:35](#msg63dfdacd4a6a18446315a72a)it's hard to say at today's (alpha) stage

[16:35](#msg63dfdaeef0c41678f3af4309)I think it's likely that ODBC will be a module, that can be fetched and loaded at runtime, as with Rebol 3

ProDimSum

[16:37](#msg63dfdb459c90f8647b2ce00b)yes i tried rebol before red it works surprisingly.

hiiamboris

[16:39](#msg63dfdbc5747c6938e1033d17)Rebol is a much older and mature tech

ProDimSum

[16:42](#msg63dfdc824a6a70544c8a170f)I watched this video https://www.youtube.com/watch?v=-KqNO\_sDqm4 and it was 7 years old I thought this will be fun to try after rebol so I wanted to try some kernel programming and I started with rust and red rust have nice community and lot of active people

[16:45](#msg63dfdd126fc5ff38e44c245d)in that video developer of red mentioned you can create kernel and driver etc but its been a week no single example can not find anything on git or google. looks like dead end to me.

hiiamboris

[16:45](#msg63dfdd1262844178f6e6a183)sunday is today :)

ProDimSum

[16:46](#msg63dfdd5bf4ead81aa3609cb2)I get it bro

hiiamboris

[16:47](#msg63dfdd9a4a6a18446315aaf1)I have heard someone tried making an OS with Red (@beardpower maybe), but I don't remember ever seeing a link to it

[16:48](#msg63dfddd36b829e1a9a7b0e44)and that's it.. it's not like we're making OSes on daily basis and have a ready hello-world OS :)

ProDimSum

[16:48](#msg63dfddf19c90f8647b2ce496)full os really wow i am not that skilled but would love to get my hands dirty. I am very much new to whole programming and tech stuff.

hiiamboris

[16:50](#msg63dfde4f747c6938e1034252)OS or driver in R/S is a possibility, like it is in C, but you'll be pioneering this field (and seeing that you're a total newbie, it will be a rough ride - be warned ;)

ProDimSum

[16:51](#msg63dfde7d511fff631f68172d)I understand bro but dev was promoting it in that video so I thought lets give it a try.

hiiamboris

[16:53](#msg63dfdef5f4ead81aa3609f1e)https://gitter.im/red/red?at=62616bec090925231883ed37 see this example to have a start

[16:54](#msg63dfdf466b829e1a9a7b10ef)and I should probably recommend reading \[R/S manual](https://static.red-lang.org/red-system-specs.html), but it's aimed at people familiar with the low level stuff, so I don't know how much you will get from it

ProDimSum

[16:58](#msg63dfe019eddd71596c1781eb)red --no-runtime -t linux -r "hw.reds"

[16:58](#msg63dfe021da007e5447713214)why target linux?

[16:58](#msg63dfe02a480b726318ae7334)I will try my best to learn.

[16:58](#msg63dfe03c6fc5ff38e44c2a83)and why in release mode?

hiiamboris

[17:01](#msg63dfe0deda007e5447713383)&gt; why target linux?

I think it was just easier for me to target for that particular script (less code)

[17:01](#msg63dfe105f4ead81aa360a351)&gt; and why in release mode?

it only matters for Red code, not for R/S

ProDimSum

[17:05](#msg63dfe1deeddd71596c1784dc)if you are using #syscall it does need os right ? if so how it can be freestanding ?

hiiamboris

[17:07](#msg63dfe247511fff631f681eb8)true, that example was using kernel call

[17:08](#msg63dfe284747c6938e1034a2a)I cannot advise you how to program a kernel, sorry

[17:09](#msg63dfe2c69c90f8647b2ceded)I only have experience working with video buffer that was relevant in old 16-bit DOS times :)

ProDimSum

[17:12](#msg63dfe36b4a6a18446315b68f)I understand bro don't worry. I will ask developer of red. He might able to help.

hiiamboris

[17:12](#msg63dfe3906fc5ff38e44c3203)you should better ask web https://searx.be/search?q=minimal%20OS%20kernel%20in%20C

[17:13](#msg63dfe3a56fc5ff38e44c3248)then understand what they're doing and translate C code into R/S

ProDimSum

[17:21](#msg63dfe5984a6a18446315b9b7)Okay bro I will do my best. But I will still ask dev of red if they have some code hidden in their computer and they forgot to upload on internet.

hiiamboris

[17:23](#msg63dfe5fc4a6a70544c8a2928)@dockimbel are you hiding the precious Red/OS from us? ;)

ProDimSum

[17:32](#msg63dfe82162844178f6e6b3db)@dockimbel Hello sir, I am new to programming world and specially kernel development. If you have any code of kernel that you might have played in past written in red/system kindly upload somewhere on public git to test for user like me. thanks again for your valuable time.

[17:49](#msg63dfec24f4ead81aa360b700)@hiiamboris 16-bit real mode is still needed for intel old pcs

greggirwin

[21:25](#msg63e01eb34ecd45446ec6ffbc)Yes, it was @BeardPower who did heavy metal work.

## Wednesday 8th February, 2023

lylgithub2021

[02:30](#msg63e30962f0c41678f3b53927)

```
f: func['x][
set x [none none]
compose/deep[radio field react [(:x)/2: face/text]button [probe (:x)/2]]
]
(f test)
```

These codes intends to get a block `[rado field react [test/2: face/text] button [probe test/2]]`, but fail. What's wrong with them?

toomasv

[04:41](#msg63e327dc511fff631f6e47b7)@lylgithub2021

```
f: func ['x][
   set x [none none] 
   compose/deep [
      radio field react [(to set-path! reduce [x 2]) face/text] 
      button [probe (to path! reduce [x 2])]
   ]
]
f test
== [radio field react [test/2: face/text] button [probe test/2]]
```

## Thursday 9th February, 2023

lylgithub2021

[06:21](#msg63e490ee450b707d6f4b148a)@toomasv Thank you so much!!

toomasv

[08:31](#msg63e4af5e5357366b727720e3)You are welcome!

## Friday 10th February, 2023

lylgithub2021

[01:48](#msg63e5a27e84f6b75c6f1dd70d)

```
a: ["b" "" " bb"] ;; three elements in block
remove/key a "" ;; remove blank string ""
```

I think the block `a` will change to \["b" " bb"] after running the above code, but actrually I just get `["b"]`, `" bb"` is lost. Why?

[02:01](#msg63e5a5905357366b7278fece)I also tried `remove -each i a [i = ""]`. Still not the result expected.

greggirwin

[02:01](#msg63e5a597450b707d6f4d29bc)`/key` is for map use, but also works on blocks, though it doesn't treat them strictly as a key-value structure. That is, there is no implied `/skip 2` when `/key` is used on a block arg. Think of it as `find+remove/part 2` removing the key it finds, and the value that follows.

```
>> a: ["b" "my-key" "my-val" "" " bb"]
== ["b" "my-key" "my-val" "" " bb"]
>> remove/key a "my-key"
== ["b" "" " bb"]
```

[02:03](#msg63e5a5efd97eaa59cdff7888)`remove-each` does work as you expect.

```
>> a
== ["b" "" " bb"]
>> remove-each i a [i = ""]
>> a
== ["b" " bb"]
```

lylgithub2021

[02:09](#msg63e5a770b1f15b2e6234c804)@greggirwin OH, many thanks!! I think no examples in `? remove` leads to wrong understanding of this function(and the learning of `Red`).

## Saturday 11st February, 2023

ProDimSum

[16:48](#msg63e7c6eb9798d11e2c631c15)how to do this https://wiki.osdev.org/GCC\_Cross-Compiler with red/system?

[16:50](#msg63e7c75fbc9d0759c1669bb6)@hiiamboris thanks for mini kernel link in C now I know more about asm and bootloader

hiiamboris

[16:51](#msg63e7c7a8a6a7c26b6b3aad17)&gt; how to do this https://wiki.osdev.org/GCC\_Cross-Compiler with red/system?

`-t` command line option

ProDimSum

[16:57](#msg63e7c9107648e47d55d81ae5)that article is about compiling GCC without standard libs and headers. I am asking how can I do that with red/system?

[16:58](#msg63e7c91acd508f5c5ffb5d5f)or -t will do it for me?

hiiamboris

[16:59](#msg63e7c958ee00e6232c11d1fe)`-t` cross compiles to a different platform

[16:59](#msg63e7c96084f6b75c6f21c7b1)`--no-runtime` leaves out standard lib

[16:59](#msg63e7c96f9798d11e2c6320ad)in `--help` you can read all this :)

ProDimSum

[17:02](#msg63e7ca0bbc9d0759c166a16a)so you saying I do not have to go thought that GCC method cool lets try

[17:06](#msg63e7cafff209f721118fcbdd)I am bit confuse with two red version CLI red and redtoolchain

[17:06](#msg63e7cb14a2d58f2e487204cb)@hiiamboris does both include red/system ?

[17:07](#msg63e7cb4be903521e2669cda1)or just toolchain one ?

hiiamboris

[17:07](#msg63e7cb5fb1f15b2e6238ad1c)toolchain is the compiler, it compiles Red and Red/System code

[17:08](#msg63e7cb7684f6b75c6f21cb82)other binaries are compiled interpreter+consoles

[17:08](#msg63e7cb839798d11e2c632400)is it not written on the download page?

[17:08](#msg63e7cb9b5c49112128366dca)see also this file on cross-compiling https://github.com/red/red/blob/master/system/config.r

[17:09](#msg63e7cbaf8e6e0d2338f834f2)basically since you're not targeting an OS, only `target:` option concerns you

[17:09](#msg63e7cbd7450b707d6f5121aa)however I don't think Red has builtin emitter for raw binary (not wrapped into an OS `exe` format)

[17:10](#msg63e7cbf59798d11e2c632452)@dockimbel will have to say if it's possible to hack one quickly

ProDimSum

[17:10](#msg63e7cbfd84f6b75c6f21cca4)so no object file? like c

hiiamboris

[17:11](#msg63e7cc3cf209f721118fcdf4)nope

ProDimSum

[17:13](#msg63e7ccb5e903521e2669d0fb)@hiiamboris what I am doing right now is using .asm file to create bootloader and use nasm

[17:17](#msg63e7cd8fee00e6232c11d94b).bin file too

[17:30](#msg63e7d0a68e6e0d2338f83e8f)lets wait for @dockimbel or @qtxie or anyone who knows how to?

[17:31](#msg63e7d0f184f6b75c6f21d425)I will continue my practice with osdev @hiiamboris thanks for your support.

hiiamboris

[17:32](#msg63e7d11a84f6b75c6f21d48b)you're welcome

## Monday 13th February, 2023

lylgithub2021

[00:51](#msg63e989825357366b727fde84)HI, I wonder if there are methods to consturct a string with given length(6 for example) whose value, "ABC" for example, is in center positon, with white blanks equally spread at left hand and right hand ( ABC ). Or that is to say, how to output half white space in Red?

ne1uno

[00:59](#msg63e98b81ee00e6232c14d63e)`? pad`

lylgithub2021

[01:06](#msg63e98d215c49112128397607)Thank you @ne1uno ! Seems that `pad` only receive integer number. It can not give 1.5 character(for my example).

ne1uno

[01:11](#msg63e98e5eb1f15b2e623bca48)not sure there is a one step answer. pad/left pad s n1 n2, you decide n1 n2 . append/dup copy " " n, then insert s is another way. there are various format experiments that may justify center

[01:16](#msg63e98f635c491121283979d1)`head insert at append/dup copy " " " " 10 5 "ABC"`

[01:18](#msg63e98ff85357366b727fe90e)`head pad/left pad "ABC" 7 12`

lylgithub2021

[01:27](#msg63e991f4bc9d0759c169b508)Thank you for these wonderful solutions! And in my example, the final length of the string is fixed with six. The length of "ABC" is three. If "ABC" put in center positon is expected, then the white space of left hand/right hand of "ABC" should be with a length of 1.5. So, how to get this half of white space in Red(because the final length of the string is fixed)?

ne1uno

[01:32](#msg63e9931aee00e6232c14e252)pad not accepting float or pair a bug &amp; a wish

greggirwin

[02:25](#msg63e99f7f450b707d6f544c2e)You can't pad to half a character. Th choice is where to put the extra space, left or right.

[02:25](#msg63e99f91d97eaa59cd0670e7)

```
set 'align function [
		{Justify the given string to the specified width and direction}
		s  [any-string!]  "The string to justify"
		wd [integer!] "The target width, in characters"
		/left	"Left align the string (default)"
		/center "Center align the string" 
;			{Center justify the string. If the total length of the padding
;			is an odd number of characters, the extra character will be on
;			the right.}
		/right	"Right align the string"
		/with "Fill with something other than space" 
;			{Allows you to specify filler other than space. If you specify a
;			string more than 1 character in length, it will be repeated as
;			many times as necessary.}
			filler [any-string! char!] "The character, or string, to use as filler"
	][
		if 0 >= pad-len: (wd - length? s) [return s]	; Never truncate
		filler: form any [filler space]
		result: head insert/dup make string! wd filler (wd / length? filler)
		; If they gave us a multi-char filler, and it isn't evenly multiplied
		; into the desired width, we have to add some extra chars at the end
		; to make up for the difference.
		if wd > length? result [
			append result copy/part filler (wd - length? result)
		]
		pos: either center [
			add 1 to integer! divide pad-len 2
		][
			either right [add 1 pad-len] [1]
		]
		head change/part at result pos s length? s
	]
	e.g. [
		align "a" 10
		align/center "a" 10
		align/right "a" 10
		align/with "a" 10 #"*"
		align/center/with "a" 10 #"*"
		align/right/with "a" 10 #"*"
		align/with "a" 10 "._"
		align/center/with "a" 10 "._"
		align/right/with "a" 10 "._"
		align/with "a" 10 "+________+"
		align/center/with "a" 10 "+________+"
		align/right/with "a" 10 "+________+"
		template: "+________+"
		align/with "abcd" length? template template
		align/center/with "abcd" length? template template
		align/right/with "abcd" length? template template
	]
```

lylgithub2021

[03:48](#msg63e9b307bc9d0759c169e93c)@greggirwin `align/center "A" 2` seems not at center

toomasv

[04:48](#msg63e9c112a6a7c26b6b3e1491)Use thin space (`^2009`), but mind font too :)

greggirwin

[05:19](#msg63e9c879d97eaa59cd06b678)@lylgithub2021 what result do you expect? There are only two character slots and you give it one character. This is not font rendering we're talking about, but string characters. For rendering, VID has a `center` facet for faces that support it.

qtxie

[07:08](#msg63e9e1d1bc9d0759c16a3b96)&gt; @hiiamboris what I am doing right now is using .asm file to create bootloader and use nasm

You can compile R/S to Intel HEX format. I'm not sure if it's can be used for bootloader. https://github.com/red/red/blob/master/system/formats/Intel-HEX.r
