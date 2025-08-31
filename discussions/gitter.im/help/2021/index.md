# Archived messages from: [gitter.im/red/help](/gitter.im/red/help/) from year: 2021

## Saturday 2nd January, 2021

Rebol2Red

[19:28](#msg5ff0c9404eba353cdf13a507)How to sort on column 3 and at the same time on column 1?  
(I don't know if I express this correctly, maybe some sort of group sorting?)  
But here is an example:

```
serie-to-sort: [
	"c" "5" "a"
	"b" "4" "z"
	"b" "2" "r"
	"a" "7" "w"
	"b" "9" "h"
	"a" "3" "h"
	"c" "2" "g"
]
```

After trying many things i get this to work

```
x: sort/skip/compare serie-to-sort 3 3 1
probe sort/skip x 3
== [
	"a" "7" "w"
	"a" "3" "h"
	"b" "9" "h"
	"b" "2" "r"
	"b" "4" "z"
	"c" "5" "a"
	"c" "2" "g"
]
```

But can this be done in one go?

And how about sorting this to get the 'same' result as above?

```
serie-to-sort: [
	["c" "5" "a"]
	["b" "4" "z"]
	["b" "2" "r"]
	["a" "7" "w"]
	["b" "9" "h"]
	["a" "3" "h"]
	["c" "2" "g"]
]
```

I admit I don't understand how compare works, what is compared to what?  
I have searched many sites for an explanation of this but did not find it.

hiiamboris

[19:45](#msg5ff0cd43aa6bb528c38833fd)

```
>> probe sort/skip/compare/all serie-to-sort 3 func [a b][any [a/1 < b/1 all [a/1 = b/1 a/3 <= b/3]]]
[
    "a" "3" "h" 
    "a" "7" "w" 
    "b" "9" "h" 
    "b" "2" "r" 
    "b" "4" "z" 
    "c" "5" "a" 
    "c" "2" "g"
]
```

[19:45](#msg5ff0cd63e7f693041f481cb5)/compare just specifies column number for comparison, or a function

[19:46](#msg5ff0cd972084ee4b78892980)if it's a function, /all exposes series to it as arguments (otherwise it gets items only)

## Sunday 3th January, 2021

Rebol2Red

[01:22](#msg5ff11c6597312f4b6b05e147)@hiiamboris Thanks  
Oeps, Facepalm. There is a brief explanation on the red-lang site.

To answer my question how to sort this:

```
serie-to-sort: [
	["c" "5" "a"]
	["b" "4" "z"]
	["b" "2" "r"]
	["a" "7" "w"]
	["b" "9" "h"]
	["a" "3" "h"]
	["c" "2" "g"]
]
probe sort/compare serie-to-sort func [a b][any [a/1 < b/1 all [a/1 = b/1 a/3 <= b/3]]]
```

To understand how this works i do this:

```
serie-to-sort: [
	["c" "5" "a"]
	["b" "4" "z"]
	["b" "2" "r"]
	["a" "7" "w"]
	["b" "9" "h"]
	["a" "3" "h"]
	["c" "2" "g"]
]

probe sort/compare serie-to-sort func [a b][
	print [a/1 b/1 a/3 b/3] 
]
== [
	a b w z
	a c w g
	a a w h
	a b w h
	a c w a
	a b w r
	a b w z
	b a z w
	b a r w
	b b r z
	c a a w
	c b a z
	c b a r
	b a h w
	b b h z
	b b h r
	b c h a
	a a h w
	a b h z
	a b h r
	a c h a
	a b h h
	c a g w
	c b g z
	c b g r
	c c g a
	c b g h
	c a g h
]
```

I do not know how to interpret this.  
Where does the order comes from?

greggirwin

[02:03](#msg5ff125fddbb17f28c5b61199)The order comes from the sorting algorithm `sort` uses internally.

[02:06](#msg5ff126b1dbb17f28c5b612da)Don't depend on that for anything, as it could change.

We could use some more detailed docs on this, since it's a powerful and important feature, including the stable sorting option.

Rebol2Red

[02:55](#msg5ff1322f8bb73474696de053)Aha But even if i don't understand this fully i am very happy with the output of my sorted database (dutch)  
Here is a part of it:

```
No  Author                                          Title
--------------------------------------------------------------------------------------
033 Anita Notaro                                 -  Achter de schermen
043 Arianna Stassinopoulus                       -  Maria Callas een biografie
089 Arthur Graaf, Roland Jonkers & Fokke Wierda  -  gezinsencyclopedie
030 Astrid Harrewijn                             -  Ja kun je krijgen
056 Avery Corman                                 -  Kramer versus Kramer
106 B.G. van Wijckmade                           -  Wipneus en Pim bij de knuppelmannetjes 
108 B.G. van Wijckmade                           -  Wipneus en Pim bij de rovers
103 B.G. van Wijckmade                           -  Wipneus en Pim en de gestolen kroon
107 B.G. van Wijckmade                           -  Wipneus en Pim en de oude paraplu
104 B.G. van Wijckmade                           -  Wipneus en Pim en het plaagmannetje
105 B.G. van Wijckmade                           -  Wipneus en Pim op muggeneiland
066 Bernlef                                      -  De pianoman
061 Cathy Kelly                                  -  Echt verliefd!
036 Chantal van Gastel                           -  Zwaar Beproefd!
037 Chantal van Gastel                           -  Zwaar verliefd!
080 Charles Williams / Nancy Price               -  Windstil / Fatale ontmoeting
068 Cheryl Strayed                               -  Wild
072 Chr. van Abkoude                             -  Kruimeltje
100 Chris van Abkoude                            -  De vlegeljaren van Pietje bell
102 Chris van Abkoude                            -  De zonen van pietje bell
097 Chris van Abkoude                            -  Nieuwe avonturen van Pietje bell
095 Chris van Abkoude                            -  Pietje bell
099 Chris van Abkoude                            -  Pietje bell gaat vliegen
096 Chris van Abkoude                            -  Pietje Bell Goocheltoeren
101 Chris van Abkoude                            -  Pietje bell in Amerika
098 Chris van Abkoude                            -  Pietje bell is weer aan de gang
064 Christine Nöstlinger                         -  Het huis in Niemandsland
092 Ciara Geraghty                               -  Verdronken in jou / Trouw aan mij
060 Colleen McCullough                           -  De Doornvogels
055 Danielle Steel                               -  Prijs der Liefde
026 Daphne Deckers                               -  Alles is zoals het zou moeten zijn
081 David Alderton                               -  Hamsters en Gerbils
084 David Barnouw & Gerold van der Stroom        -  De dagboeken van Anne Frank
111 Dijkstra's Uitgeverij Zeist N.V.             -  Ikke pikke porretje
110 Dijkstra's Uitgeverij Zeist N.V.             -  Olleke bolleke
113 Dijkstra's Uitgeverij Zeist N.V.             -  Op weg door de wereld 5
109 Dijkstra's Uitgeverij Zeist N.V.             -  Piep zei de muis
112 Dijkstra's Uitgeverij Zeist N.V.             -  Wie woont er in dat huis
091 Diverse Auteurs                              -  De grote VARA atlas
090 Diverse Auteurs                              -  De kleine bosatlas
076 Diverse Auteurs                              -  En dat van ónze centen!
082 Diverse auteurs                              -  Lef
083 Diverse auteurs                              -  Onverwachte liefde - Een nieuw begin - Geluk bij een ongeluk
094 Donna Tartt                                  -  De kleine vriend
016 E.L. James                                   -  Vijftig tinten donkerder
015 E.L. James                                   -  Vijftig tinten grijs
017 E.L. James                                   -  Vijftig tinten vrij
...
```

Nicely sorted as groups and sorted within the groups

greggirwin

[03:13](#msg5ff13674e7f693041f490c23):+1:

[03:14](#msg5ff1369893af5216fc7afe9d)Another way to do this is to create blocks containing the values you want to sort on, in order, and use those compound values as the sort key.

## Monday 4th January, 2021

Rebol2Red

[12:03](#msg5ff3040ddbb17f28c5ba727e)Yes that was my first try.  
But i wanted to read a plain text file (read/lines), put the data into a block and inside this block the records as subblocks), sort it and then write it back to the plain text file.  
In case of a plain text file it would be easy to append, delete, change and searching with the help of an editor and there is no need for enclosing " around the data.  
The code for this is ofcourse a bit more complicated than using blocks.

Contents of booksdatabase.txt (Recordlayout: Author, Genre, Title, Remark, Pages)

```
Sophie Kinsella
Roman
Slapeloze nachten & Dubbel feest
2x
560

Jill Mansell
Roman
De prins op het verkeerde paard
Misschien heeft Mady iets met Kerr McKinnon...
335

Tina Turner & Kurt Loder
Biografie
Ik, Tina
Nu schitterend verfilmd als 'What's love got to do with it.'
265

...
```

greggirwin

[19:47](#msg5ff370cc63fe034496399e76):+1:

[19:48](#msg5ff3710b2084ee4b788f9e47)I love things that work with data we already have.

## Monday 11st January, 2021

tinulac-leinad

[13:05](#msg5ffc4d145562a61e9a9b60ef)HI,  
I try to load an image in a panel with fixed size. I can probe my img/size , img/size/x but I can't modify then. I try to see some sample like resize-image but I cant figure how to do that.  
Thanks for help  
Daniel

ldci

[13:11](#msg5ffc4e9003529b296be29b32)@tinulac-leinad :The way I use in redCV

```
rcvResizeImage: routine [
"Resizes image"
	src 	[image!] 
	iSize 	[pair!] 
	return: [image!]
][
	as red-image! stack/set-last as cell! image/resize src iSize/x iSize/y
]
```

hiiamboris

[13:15](#msg5ffc4f6ecd31da3d9aa61f0b)`panel/image: my-image` doesn't work for you?

ldci

[13:17](#msg5ffc4fe014cec811ec8feb1c)@tinulac-leinad . You can also used Draw DSL for resizing images.

greggirwin

[20:29](#msg5ffcb538d5f4bf2965ddd6dc)Here are some gists you can play with as well:  
\- https://gist.github.com/greggirwin/7107b80258dfec1fde514c3469429ac6  
\- https://gist.github.com/greggirwin/a1d132b31f15553a9181394ff7a25423  
\- https://gist.github.com/greggirwin/4b3c9962dc682c12821f55583d702a8e

All variations on the same theme.

tinulac-leinad

[21:47](#msg5ffcc763fb85d46e04d6f877)@ldci @greggirwin Thanks for the informations and links . For me the links will probably help later ... I have to read this .... slowly ;)  
@hiiamboris I dont see any information about panel/image ?  
Finaly I found a simple solution to my problem in the "Reol - a Progammer Guide" from Oliver Auverlot : this code in the book :

```
myimage: load %tuxrebol3.gif
new-size: make pair! reduce [
(make integer! (myimage/size/x / 100) * 50)
(make integer! (myimage/size/y / 100) * 50)
]
view layout [ image new-size myimage ]
```

just adapt the sizing for my need and it works... I have just to put the code in a function and use it for load and resize my image when a drop down list element is selected.  
Again thanks,  
Daniel

GiuseppeChillemi

[23:39](#msg5ffce1c414cec811ec919140)A "stupid" question: how do I check if 2 objects are "equal" in content but not in context ID: I mean they have the same elements and values.

[23:40](#msg5ffce1f391e9b71badce2721)Is there `OBJ-A = OBJ-B` like way?

gltewalt

[23:44](#msg5ffce2c4fb85d46e04d74a3b)`equal? a b` I think

[23:47](#msg5ffce38b14cec811ec919534)or `strict-equal?`

## Tuesday 12nd January, 2021

gltewalt

[05:59](#msg5ffd3ab691e9b71badcef430)what about checking if objects are equal in content with nested objects?

greggirwin

[16:47](#msg5ffdd295fe007479e4093f6a)@gltewalt have you tried it?

```
>> o-1: object [a: 1 b: 2]
== ...
>> o-2: object [a: 1 b: 2]
== ...
>> o-1 = o-2
== true
>> o-3: object [a: 1 b: 2 c: object [d: "3" e: @4]]
== ...
>> o-4: object [a: 1 b: 2 c: object [d: "3" e: @4]]
== ...
>> o-3 = o-4
== true
>> o-5: object [a: 1 b: 2 c: object [d: "Ummm" e: @4]]
== ...
>> o-3 = o-5
== false
```

It's always good to play. You learn by seeing things in action and exploring. And you can always post here with "I didn't know if...so I played in the console and here's what I learned." This room doesn't have to always be for asking questions, but also for offering unsolicited help. :^)

gltewalt

[18:28](#msg5ffdea6599549911fc19f4ff)

```

```

&gt;&gt; a: object \[x: 1 b: object \[x: 1]]  
\== make object! [  
x: 1  
b: make object! [  
x: 1  
]  
]  
&gt;&gt; equal? values-of a values-of a/b  
\== false

\`

[18:31](#msg5ffdeb1a9632f63d87120ec3)values-of a includes the make object! stuff, so it can't be equal

greggirwin

[18:52](#msg5ffdefe35562a61e9a9fb2fc)`a/b` doesn't have a `b` field at all.

gltewalt:matrix.org

[19:25](#msg5ffdf79414cec811ec9453a5)Nested objects will be like that

Oldes

[19:30](#msg5ffdf8e65562a61e9a9fca5c)?

[19:31](#msg5ffdf92991e9b71badd0f74e)@gltewalt:matrix.org are you saying that you expect `[1]` to be queal to `[1 2]`?

gltewalt:matrix.org

[19:44](#msg5ffdfc3514cec811ec945fb5)No, \[1] to \[1]

[19:48](#msg5ffdfd1d03529b296be71140)No 2 in my example

greggirwin

[19:59](#msg5ffdff94fb85d46e04da15ed)Ah, do you mean nested like recursive, where the objects are all the same type, and contain references to each other in a graph?

Oldes

[20:13](#msg5ffe02cc787d8f79c8fa17b0)

```
>> o: object [a: 1 b: 2] o/b: o
== make object! [
    a: 1
    b: make object! [...]
]
>> o = o/b
== true
```

gltewalt

[20:47](#msg5ffe0ae25562a61e9a9ffaa1)@greggirwin yes, recursive

GiuseppeChillemi

[21:09](#msg5ffe1000787d8f79c8fa39bb)@greggirwin we have another entry for \[this page](https://github.com/red/red/wiki/%5BDOC%5D-Differences-between-Red-and-Rebol)

\*\*Rebol\**

```
>> o-1: make object! [a: 1 b: 2]
>> o-2: make object! [a: 1 b: 2]
>> o-1 = o-2
== false
>>
```

\*\*Red\**

```
>>  o-1: make object! [a: 1 b: 2]
>>  o-2: make object! [a: 1 b: 2]
>>  o-1 = o-2
== true
```

(I have not tried the REPL as I have assumed that not being on that page the working was the same)

Oldes

[21:16](#msg5ffe11b1e578cf1e95e4169c)@GiuseppeChillemi there is more Rebol versions! `o-1 = o-2` is `true` in Rebol3.

endo64

[21:20](#msg5ffe12a2fb85d46e04da48db)But also:

```
o1: object [a: 1 b: "x"]
o2: object [b: "x" a: 1]
o1 = o2
; false
```

GiuseppeChillemi

[21:27](#msg5ffe14385562a61e9aa014c9)Yes... there is more! Have you some other notes about this topic, so we add them to the differences page?

Oldes

[21:27](#msg5ffe1449dc2e4809aa1ae96d)

```
all [(sort keys-of o1) = (sort keys-of o2) (sort values-of o1) = (sort values-of o2)]
; == true
```

[21:28](#msg5ffe147981c55b09c703d3c8)Do you really need it?

[21:29](#msg5ffe14bc81c55b09c703d473)I have a feeling that there is still someone who wants to do OOP in Red.

[21:33](#msg5ffe15b814cec811ec94a738)Also I think that `o1` is not same like `o2` in the same way like `[1 a]` is not same like `[a 1]`

[21:35](#msg5ffe161dd5f4bf2965e17062)And if we were technically speaking about OOP, than `o1` should not be same like `o2`, because in OOP the order have a meaning.

greggirwin

[22:06](#msg5ffe1d48dc2e4809aa1b0015)It's always good to note these things.

[22:07](#msg5ffe1d8b787d8f79c8fa5f31)I don't think it will affect much code being ported, but knowing how things are compared, and when to use, e.g. `same?` is helpful.

GiuseppeChillemi

[22:33](#msg5ffe23b814cec811ec94c946)Other notes for porting applications from Rebol to Red

```
REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM
>> M: 22
== 22
>> reduce m
== 22
>> reduce [m]
== [22]
>> reduce first [m]
== m
>>
```

```
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> M: 22
== 22
>> reduce m
== 22
>> reduce [m]
== [22]
>> reduce first [m]
== 22
>>
```

Rebol, for a reason unknow to me, does not reduce the `M` returned by `FIRST`

Oldes

[23:11](#msg5ffe2cac91e9b71badd18411)It is more clear when you do just: `m: 1 reduce 'm`

[23:13](#msg5ffe2d0914cec811ec94df8b)Question is, if it is by design that Red reduces lit-word.. or by accident? It can be replaced in Rebol using `get first [m]`

GiuseppeChillemi

[23:19](#msg5ffe2e9e14cec811ec94e40c)@Oldes I think `first [m]` is `word!`, why you say that it is `lit-word?` If I perform on Rebol:

```
>> type? first [m]
== word!
```

I get `word!`!

Oldes

[23:21](#msg5ffe2f11252c0a6ded07e751)ok.. so it's `word!`, question is same... the doc string for `reduce` is: `{Returns a copy of a block, evaluating all expressions}`

[23:24](#msg5ffe2faffb85d46e04da92b2)Rebol simply reduces only block... but let's pass any other value thru it without error.

[23:37](#msg5ffe32c1d5f4bf2965e1b87a)\[Carl said](https://www.curecode.org/rebol3/ticket.rsp?id=506): \_Anyway, the reason it's important is that REDUCE is a primary, high-frequency native, so I like to keep them lean and fast._

[23:39](#msg5ffe331ee578cf1e95e469e4)It's easy to make it compatible with Red in this case... question is if it's really worth to. Especially when one can use `get` in such a situation, which is more clear to me.

GiuseppeChillemi

[23:41](#msg5ffe33adfb85d46e04da9d2e)I prefer Red behavior as it is what you expect from this sequence:

```
M: 1
FIRST [M] -> M
REDUCE M
== 1
```

[23:43](#msg5ffe343cd5f4bf2965e1bd10)However Rebol has an interesting feature that I have not noticed during the past 2 decades:

```
/only -- Only evaluate words and paths, not functions
 words -- Optional words that are not evaluated (keywords) (Type: block none)
```

Oldes

[23:43](#msg5ffe343c252c0a6ded07f344)Also related https://www.curecode.org/rebol3/ticket.rsp?id=2060

[23:46](#msg5ffe34bf81c55b09c704266b)Instead of `REDUCE M` in your sequence above you can write just `M` and you will get 1 too.

[23:48](#msg5ffe355a252c0a6ded07f62c)

```
>> reduce probe m
1
== 1
```

GiuseppeChillemi

[23:49](#msg5ffe359003529b296be7aa7e)It's not a REPL sequence but a mental sequence.

Oldes

[23:52](#msg5ffe3651dc2e4809aa1b4337)You should ask yourself how many times you will use `reduce first blk` (I never used it) and if it's really worth to add at least 2 datatype checks with evaluation branches (don't know how it's done in Red, but that is what would be needed to do in R3).. into frequently used function.

[23:53](#msg5ffe368ffb85d46e04daa360)But I agree, it's worth to be documented ;-) Going to sleep.

## Wednesday 13th January, 2021

Oldes

[00:00](#msg5ffe380c252c0a6ded07fc8b)Btw... you can also use:

```
do/next [m] 'n
== 1
```

[00:01](#msg5ffe387791e9b71badd19f08)

```
b: [m m + 1] m: 1
do/next b 'b
;== 1
do/next b 'b
;== 2
```

[00:02](#msg5ffe3891e578cf1e95e476c2)which is more reasonable than doing `reduce first b` (at least for my tired mental sequence)

greggirwin

[18:02](#msg5fff35cf787d8f79c8fd318a)Definitely add all that to the Rebol/Red differences wiki page.

## Thursday 14th January, 2021

JohnBlood\_gitlab

[03:45](#msg5fffbe6fd5f4bf2965e59fc4)So, I'm trying to learn Red. I used VSCode to compile hello-gui.red. When I ran the .exe, it flashed and disappeared. I'm not sure if it worked correctly. Is there a way to keep the window up until I close it?

greggirwin

[04:36](#msg5fffca554498e01bbfa7b8ce)I haven't used VSCode in a long time, but I can fire it up if nobody else chimes in. You should be able to capture the compiler output and see it in VSCode. Most editors support this anyway. Unless you mean %hello-gui.exe disappears when you run it, in which case running it from a terminal might provide a clue. Then also let us know what version of Red you're using, and if you used `-c` or `-r`. If you aren't already, use `-r` (or -u\`) to make sure it's not a runtime issue with an old build, and also use the automated build rather than the (very old) stable build of Red.

[04:38](#msg5fffcaaafe007479e40e53f5)Also let us know if the Red GUI console works on your system.

gltewalt

[06:36](#msg5fffe66a252c0a6ded0c3360)quarantined? If you have an antivirus, it's probably munching it.  
I have a distant, hazy memory of trying to run an .exe and having it flash and disappear... and I want to say that it was the AV

bubnenkoff

[13:04](#msg6000417b9632f63d871804a8)How to get current process PID from itself?

[13:25](#msg60004661e578cf1e95e9ad70)

```
>> process-id?
*** Script Error: process-id? has no value
```

rebolek

[13:47](#msg60004b5a14cec811ec9a43ae)Interesting question. I don't think it's possible currently, but I would expect it to be part of `system` object. You probably should make a wish.

bubnenkoff

[14:35](#msg600056b3787d8f79c8000459)hot to get access to `system`?

pekr

[14:39](#msg6000578bfe007479e40fc6ca)`help system`, `help system/view`, etc.

[14:39](#msg600057b591e9b71badd7121a)It's just an object structure imo, imagine Windows registry without an unnecessary mess :-)

rebolek

[14:45](#msg6000591ecd31da3d9ab0ae8a)Yes, it's an object with a lot of useful info, like `/proc/` dir on Linux.

zwortex

[15:19](#msg600060f203529b296bed4103)Hi everyone, happy new year also.

A question related to the gui.

In the following code, I display a matrix of buttons with one particular button being twice as high as the others, followed by two full width text fields.

```
lay: layout [
    origin 10x10
    space 1x1
    style b: button 72x38 font-size 12
    ; default space of 1 turns as 3 pixels high in my display
    b "1" b "2" b "3" b "4" return
    ; twice high is 38*2 + 3 = 
    b "5" b "6" b "7" b "8" 72x79 return
    ; (1) this row should be shifted to the top from 38 + 3 (button height + space height)
    pad 0x-41 b "1" b "2" b "3" return
    ; lets add a full width field - width is 72*4 + 3*3 = 297
    ; (2) correct field row that is one pixel to the left compared with buttons
    pad 1x0 field 297x38 orange font-size 16 "F1" return
    ; (3) correct further gap between field widget and text widget that is 2 pixels high and not 3
    pad 1x1 text 297x38 green "F2" return
]
view/no-wait lay

; for a dump of the window
; img: to-image lay
; save/as %layout.png img 'png
```

Firstly, I understand the need for padding the third row of buttons to account for the higher button (1), but I don't get it why the text fields and buttons are not aligned on the left (2). I don't get it either why field and text widgets are not 3 pixels apart like the buttons, or the buttons and the field (3).

Secondly, I suspect that all this hard work will be useless in a different environment (other resolution and other system). My environment is Windows 10 / x64 / 1920x1080. How can I enforce this layout in all situations ? Cheers.

hiiamboris

[15:31](#msg600063d49632f63d87186a16)Rounding error.

[15:31](#msg600063ee81c55b09c709bf66)I get 4px gap some places from your layout.

[15:33](#msg6000645999549911fc206abf)(2) due to OS decoration differences of each face (View corrects for that to some extent)

[15:34](#msg6000648a252c0a6ded0d95a8)(3) each pair in the layout gets normalized to current DPI setting in the OS, and since pairs are integer-only (so are OS widget positions), there's a slight inaccuracy

bubnenkoff

[16:06](#msg60006bf9d5f4bf2965e76536)&gt; Yes, it's an object with a lot of useful info, like `/proc/` dir on Linux.

On Windows I do not see nothing related with PID. Which section I should to check?

Oldes

[16:08](#msg60006c88cd31da3d9ab0e64b)@bubnenkoff write a routine using \[GetCurrentProcessId](https://docs.microsoft.com/en-us/windows/win32/api/processthreadsapi/nf-processthreadsapi-getcurrentprocessid) from `Kernel32.dll` on Windows.

bubnenkoff

[16:09](#msg60006caecd31da3d9ab0e6e3)&gt; @bubnenkoff write a routine using \[GetCurrentProcessId](https://docs.microsoft.com/en-us/windows/win32/api/processthreadsapi/nf-processthreadsapi-getcurrentprocessid) from `Kernel32.dll` on Windows.

it's only way?

Oldes

[16:10](#msg60006d0281c55b09c709daf0)Yes. But it cannot be easier. It's just a function which returns a number.

[16:11](#msg60006d1f252c0a6ded0daed5)@rebolek any idea in which system object section it should be?

[16:13](#msg60006db7787d8f79c800484f)@bubnenkoff it's already \[used internally](https://github.com/red/red/blob/db2c060604f3e6a35c4d49cd5911b43cc197b30e/modules/view/backends/windows/win32.reds#L1028-L1030) as a part of View... it's just not accessible from Red.

[16:20](#msg60006f37dc2e4809aa20fd86)@bubnenkoff it's even mentioned \[in the Red/System document](https://static.red-lang.org/red-system-specs.html#section-15.1).

bubnenkoff

[16:28](#msg6000712491e9b71badd75b82)I tried to compile example:

```
Red []

#import [
   "kernel32.dll" stdcall [
       process-id?: "GetCurrentProcessId" [
           return: [integer!]
       ]
       get-env: "GetEnvironmentVariableA" [
           name    [c-string!]
           buffer  [c-string!]
           size    [integer!]
           return: [integer!]
       ]
   ]
]

pid: process-id?
```

and got error: `undefined word process-id?`  
It's error in example oк I forget how to interact with r/s code?

Oldes

[16:29](#msg6000716e252c0a6ded0dbc97)The example is for Red/System code... you must learn how to make a routine!

bubnenkoff

[16:30](#msg600071a0787d8f79c8005303)Oh! Your are right!

[17:19](#msg60007d184498e01bbfa9a0f6)I did it! Not sure that it best way, but it work:

```
Red []
#system [
	#import [
		   "kernel32.dll" stdcall [
			   process-id?: "GetCurrentProcessId" [
				   return: [integer!]
			   ]
		] 
	]
	_pid: func[return: [integer!]] [return process-id?]
]

get-pid: routine [/local pid [integer!] ] [
        pid: _pid
        print pid
    ]
	
get-pid
```

hiiamboris

[17:43](#msg600082d59632f63d8718d208):clap:

bubnenkoff

[19:22](#msg600099dddc2e4809aa21817d)Link to working solution if anybody world search here https://gitter.im/red/red/system?at=6000993a14cec811ec9b261a

## Friday 15th January, 2021

JohnBlood\_gitlab

[03:21](#msg60010a30252c0a6ded0f53f1)&gt; I haven't used VSCode in a long time, but I can fire it up if nobody else chimes in.

@greggirwin Turns out that I put a colon after `text` and it was causing an error.

zwortex

[23:21](#msg60022394fe007479e4149244)As mentioned in red/bugs. How do you create parse rule with dynamic values ?

I tried using compose to mix a static rule with some dynamic values, like with view. However as parenthesis are useful in parse dialect, it quickly becomes messy. I ended up using to-paren all the times which makes the rules hard to read.

Maybe there is another way ? Compose with a different delimiter ?

```
keys: #(
    k1: ['k1 'Key1]
    k2: ['k2 'Key2]
)
rule: compose [
   (keys/k1/1) keep ( to-paren keys/k1/2 )
   | (keys/k2/1) keep ( to-paren keys/k2/2 )
]
s: copy []
parse [k1 k1 k2] [collect into s [any rule]]
probe s
```

I also tried generating the rule dynamically :

```
keys: #(
    k1: ['k1 'Key1]
    k2: ['k2 'Key2]
)
rule: do [
    b: copy []
    foreach v values-of keys [
        append b reduce [v/1 'keep to-paren v/2 '| ]
    ]
    take/last b
    b
]
s: copy []
parse [k1 k1 k2] [collect into s [any rule]]
probe s
```

Though it is fine for creating a rule with multiple alternate, it is not that useful for twisting a bunch of static rules with few dynamic values.

Then I thought I could do some sort of meta parsing and twist the rules before using them. I was tempted to use !tag datatype for implementing delimiters for values to replace.

```
keys: #(
    k1: ['k1 'Key1]
    k2: ['k2 'Key2]
)
rule: [
   <keys/k1/1> keep ( <keys/k1/2> ) | 
   <keys/k2/1> keep ( <keys/k2/2> )
]
; meta-parse the rule
meta: [ any [ item ] ]
item: [ s: tag! ( change s reduce load to-string s/1 ) | ahead [ block! | paren! ] into meta |  skip ]
parse rule [ meta ]
probe rule
; parse
s: copy []
parse [k1 k1 k2] [collect into s [any rule]]
probe s
```

Are there any other strategies to consider for injecting dynamism into parse rules ?

## Saturday 16th January, 2021

hiiamboris

[09:31](#msg6002b260252c0a6ded137297)https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/reshape.md

[09:31](#msg6002b26603529b296bf31224)this is what I'm using

[09:31](#msg6002b27e99549911fc262b54)parse rules is a great use case btw

## Monday 18th January, 2021

zwortex

[11:06](#msg60056bba91e9b71bade376b0)Hi @hiiamboris, thanks for the link. As I understand, at a certain point, when Red toolkit runs out, you should create your own tools... Quick question regarding reshape : your tool is newline aware. Is it not a limitation ? I mean when transferring code, you might want to compress it (like the minify javascript) and get rid of the spaces and newlines. This would break your code. Is it frequent that newlines matter in Red (apart from the multi-lines string).

hiiamboris

[12:03](#msg6005790fcd31da3d9abd36f2)Well if your compression is not lossless it's your problem ;)

[12:03](#msg6005791f4498e01bbfb5c4ad)And what will happen with any Red code if you remove spaces?

zwortex

[13:36](#msg60058ef7fe007479e41c7b1e)I guess you keep what needs to be kept, and get rid of what is useless. Note that I was not aware that load keeps newlines (and spaces as it appears), though they are not apparent directly in the resulting block. However, mold/flat would be a good start for a lossless red code minifying. To extend my question then : is there any other situation (apart from multi-lines string, possible here doc. types) where newlines matter in Red language ?

As for the compression, it was merely an example. I have another one as it happens : I just copy pasted some code from the reshape page and guess what : all was flattened :

```
form reshape [   !(pname) !(ver) @(desc)   "by"    /if author   @(author) #"^/"]
```

This happens all the time when you jump from one system to another. You may say : make sure to do this, or that etc...

hiiamboris

[13:45](#msg60059103252c0a6ded1a29d6)Well, you don't have to use line-aware abilities of `reshape`. And it should be invariant towards new-lines in this case.

[13:45](#msg6005911403529b296bf9ca4a)If you do use them then take care as you would in many other languages.

[13:49](#msg600591cd4498e01bbfb6070f)Regarding new-lines role in Red, Red is new-line agnostic, but anyone can make a new-line aware dialect, and I think I saw some.. but can't recall right now ☺

zwortex

[14:26](#msg60059a7a787d8f79c80ce48e)I agree with you. Not a matter of concern in my particular case as I have only simple replacements to perform. New line or not new line is not the question there.

greggirwin

[20:25](#msg6005eeb68816425540d5a584)Red doesn't care about newlines, though it knows about them so you can use them for formatting even at the Red level (not just strings). But Red cares deeply about spaces, to the extent that `a + b` is an "expression" with 3 values, while `a+b` is a word.

[20:26](#msg6005ef0897132e2480eba77e)@zwortex check out the `new-line` and `new-line?` functions, if you haven't already.

zwortex

[22:25](#msg60060ad53855dd07fd62c4d6) @greggirwin, thanks for the tip. Yes I had : I did after realising that newlines were still around, after loading a block : visible in the print but not apparent when navigating the block.

## Tuesday 19th January, 2021

loziniak

[13:49](#msg6006e3666b20cf7730c437e7)Hello. During project compilation I've just ran into:

```
*** Red/System Compiler Internal Error: Internal Error : No more global variable space
```

Only workaround, that I can think of is wrapping some code in `do`s. Are there any other ways to help with this problem? Or perhaps my code is poorly written, are there any practices that especially lead to this error? I think I don't have anywhere in my code what @hiiamboris did in #4361 :-)

hiiamboris

[14:16](#msg6006e9da753011449b025419)Who could tell if not the code author ;)

loziniak

[14:17](#msg6006ea08410c2214400c2c00)Definitely another code author!

hiiamboris

[14:18](#msg6006ea34cf8b8277343e70bd)I haven't encountered this error anymore

toomasv

[14:32](#msg6006ed786244ee14509b53b8)@loziniak You probably can still compile from sources with

```
do/args %path-to-source/red/red.r "-c %<your top file here>.red"
```

in REBOL console.

We had same probem, and we can do this with e.g. REBOL/View 2.7.8.3.1.

loziniak

[14:39](#msg6006ef11004fab47414fdedd)I have `REBOL/Core 2.7.8.4.3`. Do you have any explanation for that, or you just tried random solutions? Do you think it will work with rebol fired from commandline like `echo 'Rebol [] .... ' | rebol +q -s`?

toomasv

[14:40](#msg6006ef61dfdbc1437f9b77b3)@qtxie proposed this when we ran into it. I launch it from file regularily (with `REBOL [] ...`). And release mode too.

Oldes

[16:18](#msg6007063a2cb18a437c2ac3ba)Explanation is that Rebol2 has a limit for number of used words.. your code with Red compiler's code exceeds this limit.

[16:24](#msg600707b5d8bdab47394718be)You can test this in Rebol2 console:

```
>> repeat i 100000 [if error? try [to word! join "w" i][ print i break ]]
29530 ;<--- this number depends on number of already defined words
>> length? words-of system/words
== 32893
```

## Tuesday 26th January, 2021

bubnenkoff

[12:02](#msg601004b8cae490555f6b9de6)I have piece of code that use R/S. Is there any way to detect and exclude from run when I am in script mode?

[12:02](#msg601004cdcf8b82773455af0f)Now I need to comment it every time

toomasv

[13:15](#msg60101603ac653a0802e2c320)@bubnenkoff One possibility is to use preprocessor to check if you are compiling or in console. E.g. following file is printing "console" with `do %tmp.red` in console, and it prints "compiled" if called on OS after compilation.

```
write %tmp.red {Red []
#either get in system 'state [print "console"][print "compiled"]
}
```

```
>> do %tmp.red
console
>> call/output "tmp" out: "" out
== "compiled^/"
```

bubnenkoff

[13:22](#msg601017846244ee1450b2e949)@toomasv thanks! But is there any way to repeat command every minute?

toomasv

[13:24](#msg601017f8dfdbc1437fb2f6f0)Please explain in more detail, I have long wires :).

bubnenkoff

[13:27](#msg601018bf36db01248aa219c7)I need to run app and repeat some action every 1 minutes

[14:19](#msg601024ea36db01248aa23cf0)\[!\[изображение.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/4kU9/thumb/izobrazhenie.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/4kU9/izobrazhenie.png)

[14:19](#msg601025063855dd07fd7c9f93)@toomasv about `system 'state`

loziniak

[14:41](#msg60102a316b20cf7730dc17d1)@bubnenkoff  
&gt; Is there any way to detect and exclude from run when I am in script mode?

This is my way:

```
#do [compiled: to logic! rebol]
#either compiled [
	#include %compiled.red
] [
	#include %not-compiled.red
]
```

[14:43](#msg60102a7936db01248aa24e7d)&gt; I need to run app and repeat some action every 1 minutes

But it's probably enough to check compiled/interpreted state only once?

toomasv

[15:20](#msg60103341d8bdab47395ec51d):point\_up: \[January 26, 2021 4:19 PM](https://gitter.im/red/help?at=601024ea36db01248aa23cf0) @bubnenkoff  
`#either` needs 2 blocks, I see only one there. And if you use `get in system 'state` then first block is for interpreter, second for compiler. But if you use `to logic! rebol` then \*vice versa\*.

## Wednesday 27th January, 2021

mikeparr

[11:57](#msg6011554484e66b7f7eb35686)trac language

greggirwin

[19:26](#msg6011be79a0246860dc143a8c)@mikeparr what about it?

## Thursday 28th January, 2021

gltewalt

[02:44](#msg6012252424cd6b60d8001562)Why does `find` return `true` for typesets?

[02:45](#msg6012253884e66b7f7eb597b1)

```
>> find any-function! native!
== true

>> b: [one two three]
== [one two three]
>> find b 'two
== [two three]
```

[02:46](#msg6012256984e66b7f7eb59814)

```
DESCRIPTION: 
     Returns the series where a value is found, or NONE. 
     FIND is an action! value.
```

greggirwin

[03:04](#msg601229d9a0246860dc154aac)Similar reason as for bitsets, though typesets are unordered. They are not series.

gltewalt

[03:08](#msg60122a9e0eed905f187634fb)It's actually more helpful for me that it returns true, but help doesn't say this

greggirwin

[03:45](#msg601233559fa6765ef8dfdbd0)Suggestions are welcome. Doc strings have to be kept short, and there both non-series (bitset!, typeset!) and map! results to consider in addition to series.

[03:49](#msg6012343124cd6b60d80039ac)Adding examples to https://www.red-by-example.org/#find would be great too. The repo for that is here now: https://github.com/red-by-example/red-by-example

mikeparr

[09:29](#msg601283e40eed905f187711d3)@greggirwin - thanks for noting the Red By Example link.

bubnenkoff

[16:00](#msg6012df8a428d9727dd3cdb54)How to get access to title and change it:

```
>> view [t: title "hello" size 600x333 button [append t/text " world"]]
*** Script Error: VID - invalid syntax at: [title "hello" size]
```

hiiamboris

[16:05](#msg6012e0e7a0246860dc173a62)`view/options [..] [text: "hello"]`

bubnenkoff

[16:10](#msg6012e1fc32e01b4f715c691c)But is there any way to change it during user action?

hiiamboris

[16:15](#msg6012e3099fa6765ef8e1b81a)Window is a face too. Change it.

bubnenkoff

[16:33](#msg6012e74c1ed88c58d805e98b)@hiiamboris but why code above do not work?

toomasv

[16:34](#msg6012e77e9d5c644f6635ae83)@bubnenkoff

```
view/flags [
    title "Hi" 
    button "Change title" [
        view/flags [
            title "Change window title" 
            below text "New title:" 
            title: field 150 focus 
            across button "OK" [system/view/screens/1/pane/1/text: title/text unview] 
            button "Cancel" [unview]
        ] 'no-buttons
    ]
][no-min no-max]
```

bubnenkoff

[16:34](#msg6012e78d0eed905f1878326d)or even:

```
view [size 500x400 button [faced/title: "test"]]
```

toomasv

[16:34](#msg6012e7b29fa6765ef8e1c6c2)`faced`?

bubnenkoff

[16:36](#msg6012e7f2428d9727dd3cf4c1)@toomasv I thought that faced/foo is access to parent widget

toomasv

[16:36](#msg6012e8114f7d1b68e5164a80)Why did you think so?

[16:37](#msg6012e847ae4b9b27c183b22e)

```
view [size 500x400 button [face/parent/text: "test"]]
```

bubnenkoff

[16:38](#msg6012e89f9d5c644f6635b1e7)Oh! AS usually big thanks! Yes you are right `face` now `faced`

toomasv

[16:40](#msg6012e90c55359c58bf079c28)And not `title` but `text`, if you access it programmatically. `title` is dialected marker for window's `text` facet.

greggirwin

[18:37](#msg60130480aa6a6f319dec8a22)@bubnenkoff your original code doesn't work because `title` is special, and not a face in the layout that you can reference. So you can't have a set-word before it in VID. But you could do it this way, in addition to @toomasv's example:

```
t: "Hello" view [title t size 600x333 button [append t " world"]]
```

[18:41](#msg6013054da0246860dc17a8ed)@mikeparr RBE is a great resource, and I hope someone takes up the mantle of keeping it up. The format is not the standard markdown we're used to, but the \[user guide](https://github.com/red-by-example/red-by-example/blob/master/readme-user-guide.txt) spells it all out very clearly.

## Friday 29th January, 2021

temperfugit

[02:28](#msg601372c3a0246860dc18d687)Here's something that's got me stumped. Can Red download and save an animated gif? (example: https://bestanimations.com/Nature/Water/wave-ocean-animated-gif-14.gif) Using `load` and `save` I can get a static image saved, the first frame maybe, but not the whole animation. I'm calling curl as a workaround, but I'm curious if there's a way using only Red.

gltewalt

[03:48](#msg6013858784e66b7f7eb965ad)

```
> my-gif: read/binary https://bestanimations.com/Nature/Water/wave-ocean-animated-gif-14.gif
== #{
4749463839619301E300F7FF00124559296577A3AAAD65727A77A9B536778777
95991A6F...
>> write/binary %purty my-gif
```

temperfugit

[05:08](#msg6013985b063b6c68d524ed4e)Cool, thank you! I did try read/binary but I was hung up on trying to get it to work with save/as.

## Sunday 31st January, 2021

Rebol2Red

[20:24](#msg601711e50eed905f1882e207)@gltewalt You need to give the resulting gif the extension

```
my-gif: read/binary https://bestanimations.com/Nature/Water/wave-ocean-animated-gif-14.gif
write/binary %purty.gif my-gif ; <----
```

gltewalt:matrix.org

[20:26](#msg6017127aae4b9b27c18e6365)It still works without giving it extension

[20:26](#msg601712845500a97f82d95b02)At least on linux

temperfugit

[22:07](#msg60172a249238c531ad169ec7)I just used `suffix?` on the link and rejoined it to the name my script wanted to save the image as. I was playing around with an idea for an offline rss reader, and that would require handling many different image types. But my script is too complicated and doesn't handle edge cases well. Yesterday I saw an example of an xml parser in Rebol using `parse` so now I'm studying `parse` before I start over again. :)

## Tuesday 2nd February, 2021

snotbubble

[11:09](#msg601932e055359c58bf17fff2)Are there any reference examples for making/changing ui items in a loop?

have tried the following with no luck, doesn't know what button is...

```
Red [ needs 'view ]
h: ["one" "two" "three"]
c: []
repeat x length? h [ 
	append c [ button 180x30 h/:x [ either face/color = papaya [ face/color: gray ] [ face/color: papaya ] ] return ]
]
view [ panel [ do c ] ]
```

Oldes

[11:23](#msg60193644aa6a6f319dfcaba3)@snotbubble it depends what should be as a result... I think that you should first start with something like:

```
text: ["one" "two" "three"]
code: []
foreach label text [ 
    append code compose [
    	button 180x30 (label) [print face/text]
    	return
    ]
]
view code
```

[11:28](#msg6019375faa6a6f319dfcae8f)I'm not sure if it's possible to change color of the native buttons (on Windows).

snotbubble

[11:35](#msg601938fd9fa6765ef8f215e0)@Oldes Got it thanks, works now:

```
Red [ needs 'view ]
h: ["one" "two" "three"]
c: []
repeat x length? h [ 
    append c compose [ button 180x30 (h/:x) [ either face/color = papaya [ face/color: gray ] [ face/color: papaya ] ] return ]
]
view [ panel [ ] c ]
```

[11:41](#msg60193a711ed88c58d8165c9a)next question: is there a way to change the properties of multiple ui items created in this way? For example make non-selected items a different color?

Oldes

[11:50](#msg60193c6da0246860dc279cb0)You may use something like:

```
win: layout code
foreach face win/pane [
	if face/type = 'button [ face/enabled?: false ]
]
view win
```

But I'm not much familiar with View.

[11:57](#msg60193e1832e01b4f716ce042) You can use something like:

```
on-button: func[face][
	face/selected: not to logic! face/selected
	either face/selected [
	  uppercase face/text
	][lowercase face/text]
]

foreach label text [ 
    append code compose [
        button 180x30 (label) [on-button face]   	
        return
    ]
]
view code
```

snotbubble

[12:04](#msg60193fe89238c531ad1c32f4)@Oldes win has no value, is this Windows specific?

Oldes

[12:05](#msg6019400b0eed905f1888b06c)`win: layout code`

[12:06](#msg6019403a9fa6765ef8f2280f)

```
red
>> layout [button "aha"]
== make object! [
    type: 'window
    offset: none
    size: 82x47
    text: none
    image: none
    color: none
  ...
```

[12:07](#msg6019406c063b6c68d533903d)`layout` is responsible for conversion of the DSL into tree of faces, which you can view using `view`

[12:09](#msg601940dc24cd6b60d812b61c)You can build the tree yourself... like:

```
win: make face! [type: 'window size: 600x600 text: "My application"]
btn: make face! [type: 'button size: 180x20 text: "Some button" offset: 10x10]
win/pane: reduce [btn]
view win
```

snotbubble

[12:22](#msg601944215500a97f82df3e54)ok so no can't look at ui after-the-fact, have to pre-build it, correct?

Oldes

[12:24](#msg6019449232e01b4f716cf193)Sorry.. I don't understand what you are asking for :/

snotbubble

[12:41](#msg6019485eae4b9b27c1945506)something like this, where everything in view is prefab (win)

```
Red [ needs 'view ]
h: ["one" "two" "three"]
c: []

win: make face! [type: 'window size: 400x400 text: "win"]

repeat x length? h [
	append c compose/deep [
		make face! [type: 'base size: 80x30 color: gray text:(h/:x) on-up: btoggle]
	]
]
probe c
win/pane: reduce c

btoggle: function [] [
	foreach face win/pane [
		probe face
		if face/type = 'base [ face/color: gray ]
	]
]

view win
```

[12:41](#msg6019486724cd6b60d812ca28)as opposed to just making stuff in view and changing it after the fact.

Oldes

[14:33](#msg601962cb32e01b4f716d4953)@snotbubble

```
labels: ["one" "two" "three"]
btn-actors: object [
	; shared for all buttons
	on-up: function [face event] [
		probe face/text
		face/color: random 255.255.255
	]
]
win: make face! [
	type: 'window
	text: "win"
	pane: copy []
]
pos: 10x10
foreach txt labels [
    append win/pane make face! [
    	type:  'base
    	size:   100x30
    	offset: pos
    	color:  gray
    	text:   txt
    	actors: btn-actors
    ]
    pos/y: pos/y + 40
]
win/size: as-pair 120 pos/y
view win
```

greggirwin

[19:50](#msg6019ad15428d9727dd4ebdab)Just a note that there is also `foreach-face` which can be a very handy iterator.

[19:51](#msg6019ad4355359c58bf19664b)I have a couple examples \[here](https://gist.github.com/greggirwin/01bd4ea16fcc9458f531352cfdf6100f) but others may have better ones.

[19:55](#msg6019ae3124cd6b60d813f788)https://www.red-by-example.org/#0foreach-face could use something small there.

[19:59](#msg6019af3f24cd6b60d813fa80)And `foreach-face` is a mezzanine, so you can use `source` on it to see how it works.

## Wednesday 3th February, 2021

snotbubble

[00:19](#msg6019ebf7a0246860dc2993e4)@greggirwin `foreach-face` does it thanks!

```
Red [ needs 'view ]
h: ["one" "two" "three"]
c: []

repeat x length? h [ 
	append c  compose/deep [ base 180x30 (h/:x) [ foreach-face v [ if face/type = 'base [ face/color: gray ] ] face/color:papaya ] return ]
]

v: layout [ panel [ ] c ]
view v
```

Oldes

[02:02](#msg601a04285500a97f82e15d59)@snotbubble this one is much more efficient:

```
labels: ["one" "two" "three"]
code: []
selected: none
on-button: func[face][
    if selected [selected/color: gray]
    face/color: red
    selected: face
]

foreach label labels [ 
    append code compose [  base 180x30 (label) :on-button   return ]
]
view code
```

[02:03](#msg601a04695500a97f82e15dd9)And please don't repeat `repeat x length? h` and use `foreach` instead!

[02:14](#msg601a0717428d9727dd4fba42)Or maybe:

```
text: ["one" "two" "three"]
code: []
selected: none
on-button: func[face event][
	either event/type = 'down [
		face/color: pink
	][
	    if selected [selected/color: gray]
	    face/color: red
	    selected: face
	]
]

foreach label text [ 
    append code compose [
        base 180x30 (label)
        on-up   :on-button
        on-down :on-button
        return
    ]
]
view code
```

planetsizecpu

[12:49](#msg601a9bd09d5c644f664995cd)Welcome! @snotbubble

greggirwin

[19:22](#msg601af7df063b6c68d53847cc)&gt; And please don't repeat `repeat x length? h` and use `foreach` instead!

While `foreach` is better in this case, there are certainly times where `repeat` is a better choice.

[19:22](#msg601af808a0246860dc2c5336)As we don't (yet) have a `foreach` that iterates over multiple series in parallel.

rgchris

[19:35](#msg601afae79fa6765ef8f6ea9c)I'm trying to build a \[variant of the Red executable](https://gist.github.com/rgchris/9b50e9508d534383617d0e6ed29cc104#gistcomment-3618947) that fits a little better into my workflow. I'd like to look at how \*\*red-latest\** is put together in order to adapt and experiment, but it's not clear where this is specified (it appears to work differently from the prescribed \*\*console.red\*\*). Comments under the Gist would be useful so I can reference them as I make changes

## Thursday 4th February, 2021

bubnenkoff

[12:55](#msg601beec2063b6c68d53ae011)Remember me please, why settings a words from `function` placed in context/object are working, but words in system content not. I expected that I would not be able to change object from `function`. It's bug or future?

```
x: none
a: [
     y: none
	]
		
f: function[] [		
	a/y: "foo"
	x: "bar"
	]
f

probe a ; was setted 
probe x ; still none
```

toomasv

[13:00](#msg601bf00684e66b7f7ecf9331)`function` collects set-words (but not set-paths) in its body and makes these local by default (unless `/extern` refinement is used for any of these). Use `func`, then only args and words declared `/local` are made local.

bubnenkoff

[13:01](#msg601bf04732e01b4f7174312f)Great thanks for explanation, Toomas!

toomasv

[13:02](#msg601bf051a0246860dc2efc1b)You are welcome!

bubnenkoff

[14:03](#msg601bfebc84e66b7f7ecfbdf7)@rebolek Am I right sending headers?

```
response: try [send-request/data/with middleware-url-full 'POST parser-status [#("Content-Type" "application/json")]  ]
```

docs says that:

```
/with 		"Headers to send with request"
			args	[block! map!]
```

fergus4

[14:05](#msg601bff2b9238c531ad23a4e1)Call/output does not seem to work if there is any delay from the callback (waiting for a called app to complete process). Does this have to do with 'wait' not working properly? Same call/output works in rebol.

rebolek

[14:07](#msg601bffaf55359c58bf1f9b52)@bubnenkoff You can use either `map!` or `block!`:

```
#("Content-Type" "application/json")
or
["Content-Type" "application/json"]
```

However, if `parser-status` is a `map!` or an `object!`, it gets converted into JSON and `Content-Type` is set automatically, so you do not set headers manually.

hiiamboris

[15:08](#msg601c0e090eed905f18904125)@fergus4 `call/wait/output` you mean?

fergus4

[16:31](#msg601c217f063b6c68d53b7f21)I just tried call/wait/output but that does not work either. What I was referring to is when you use 'wait' and a 'print' in a loop and there is no output until the loop completes.

dsunanda

[17:03](#msg601c28ea9fa6765ef8fa2ba6)@fergus4 &gt; 'wait' and a 'print' in a loop and there is no output until the loop completes.  
That is an extremely annoying restriction in the Red console, and it makes debugging a pain.  
One work-around is to replace PRINT with writing to a text file, eg:

```
write/append %debug-log.txt "debug message"
```

With the right text editor, you can view the debug file while the script runs.

greggirwin

[17:06](#msg601c298d9d5c644f664dfef2)@fergus4 it should work with the CLI console. Only the GUI console has this issue. It's on our list.

hiiamboris

[17:27](#msg601c2e77063b6c68d53bb759)or just `print*: :print print: func [x][print* :x do-events/no-wait]`

[17:29](#msg601c2f0caa6a6f319d04f7d5)though redefining that `print` used in `call/output` will be harder I guess

[17:52](#msg601c344aae4b9b27c19c8b62)btw why `call/output` instead of `call/console`?

## Friday 5th February, 2021

bubnenkoff

[09:23](#msg601d0e861ed88c58d821304b)I have string: `"[1,2,3,4]"`  
I need to create block like: \[1 2 3 4]  
I have tried something like (but it do not work):

```
arr: []
foreach el split "[1,2,3,4]" "," [append arr el]
```

hiiamboris

[09:34](#msg601d110d9d5c644f6650e21b)what about using `replace` and `load`?

bubnenkoff

[09:38](#msg601d11ff32e01b4f7177dfdb)Oh! I just realized it myself!

```
load replace/all "[1,2,3,4]" "," " "
```

hiiamboris

[10:12](#msg601d19feaa6a6f319d07f598):+1:

bubnenkoff

[10:45](#msg601d21c69fa6765ef8fd5011)When I should use catch with try? Does this code is fine?

```
either error? response: try [send-request/data middleware-url-full 'POST parser-status ] [
		print "baaaad"
	] [
		print "gooood"
	]
```

Can it be rewrited with catch?

[10:46](#msg601d2223a0246860dc32da60)I am confused that here first block is mean error. Maybe it can be fixed with `not error?` but I am not sure that it's good idea

hiiamboris

[10:48](#msg601d227432e01b4f71780f55)`catch` catches user-defined `throw`s only

bubnenkoff

[10:51](#msg601d23159fa6765ef8fd553f)@hiiamboris not fully understand. For example `throw` inside lib it's user-defined?

toomasv

[10:51](#msg601d2327063b6c68d53eb8d0)

```
>> catch [if error? try [send-request/data middleware-url-full 'POST parser-status] [throw 'baaad] ]
== baaad
```

bubnenkoff

[10:51](#msg601d234f5500a97f82ea728a)And when I need to use `attempt` ? Is it suitable for it?

[10:52](#msg601d238224cd6b60d81de8a2)@toomasv error object also can be `throw`n?

toomasv

[10:52](#msg601d23854f7d1b68e5321b4d)`attempt` returns `none` on most errors

bubnenkoff

[10:53](#msg601d23b6a0246860dc32de3e)@toomasv so my code more or less idiomatic?

hiiamboris

[10:55](#msg601d24309fa6765ef8fd5855)it is, don't worry ;)

toomasv

[11:00](#msg601d25544f7d1b68e5322065)@bubnenkoff You can throw/catch attributes of `error!`, e.g.

```
>> catch [if error? err: try [send-request/data middleware-url-full 'POST parser-status] [throw err/code] ]
== 300
```

bubnenkoff

[12:32](#msg601d3ac95500a97f82eaaec6)What is the best practice to distinguish words and VID face names?  
I am usually names faces like: `text-someting` or `button-count`  
to not miss it with other words

[17:51](#msg601d858624cd6b60d81f0156)I have strange error in my real project. I did small example that illustrate it:

```
view [	
	do [ 
		print "Start"
		return 1
		print "End"	
	]
]
```

Output is printing twice:

```
Start
Start
```

In real project there is not pure `return 1`, but there is some function that return value

hiiamboris

[17:52](#msg601d85c9a0246860dc33fd9d)update your Red

bubnenkoff

[17:52](#msg601d85de428d9727dd59def8)it's already fixed??

hiiamboris

[17:52](#msg601d85e255359c58bf248c74)yep

bubnenkoff

[17:53](#msg601d8633428d9727dd59dfce)Oh! Cool! I spend few days before able to make this snipped))

[17:54](#msg601d86440eed905f1894d788)As usually I thought that it's my bug

hiiamboris

[17:55](#msg601d869e5500a97f82eb86c6)(;

dsunanda

[19:07](#msg601d97595500a97f82ebb7d2)How can I find the (default) font size for a field? The code below does not have a face/font block:

```
view/no-wait [t: text "hello"]
t/font/size
*** Script Error: path t/font/size is not valid for none! type
```

hiiamboris

[19:11](#msg601d986a55359c58bf24c737)`? system/view/fonts`

dsunanda

[20:10](#msg601da61c428d9727dd5a38e1)@hiiamboris Thanks - close, but not guaranteed....I can change the apparent default font size without it having any affect on a subsequent face , eg:

```
system/view/fonts/size: 20
view/no-wait [t: text "A"]   ;; rendered as 9-point
t/font     ;; No value
system/view/fonts/size       ;; misleadingly says 20
```

hiiamboris

[20:13](#msg601da6df0eed905f18953ad7)you didn't say you wanna change it, you said you wanna find it

[20:13](#msg601da6e424cd6b60d81f669f)found it now (;

[20:14](#msg601da7094f7d1b68e5339573)don't like it - simply write your own style

[20:16](#msg601da78124cd6b60d81f684c)the root of this thing is what OS defaults to

[20:16](#msg601da78daa6a6f319d0982e3)we can ask what it is but can't affect it

dsunanda

[21:23](#msg601db7389238c531ad28ed3f)@hiiamboris :) Thanks - I meant I want to know what it was when the face was created.  
Looks like it is basically hardwired, so I need to grab system/view/fonts/size early in a run, just in case my future self decides to overwrite it :)

## Tuesday 9th February, 2021

loziniak

[13:25](#msg60228d45063b6c68d54be8b1)Hi! I'm going to revive an initiative of launching Red track at \[Exercism](http://exercism.io/):

https://github.com/exercism/request-new-language-track/issues/45

[14:18](#msg602299b6aa6a6f319d158067)Feedback most welcome! :-)

greggirwin

[18:46](#msg6022d8880eed905f18a1cf33)Cool. We'll do what we can to help support this.

[18:57](#msg6022db359d5c644f665f3987)And I hope we can learn from them as well.

loziniak

[22:39](#msg60230f3032e01b4f7186b6b5)I'd certainly need help with this, not only from Red programmers better than me, but from everyone willing to help. There is a lot of work with mentoring students, preparing introductions to language concepts, writing good educational excercises, testing, \[and lots more](https://exercism.io/contribute).

greggirwin

[22:48](#msg6023113b4f7d1b68e540c7af)Having a champion, leader, and guide is critical to starting. Then we need to make it easy for people to contribute. Also, I hope we can build exercises that aren't exclusive to Exercism, but can be leveraged elsewhere.

[23:03](#msg602314ab32e01b4f7186c44f)@loziniak since we're starting from zero, you being our expert, one of the most valuable things to me would be a short list of what you think the best tracks are to emulate and learn from. Or a few to check out that you think are particularly good exercises. And if there are transcripts of mentoring sessions, that would be great too. Otherwise I'll need to join a track in mentored mode and see how it works as a live user.

[23:07](#msg602315b49fa6765ef80be393)Selecting Clojure, I see that they note it uses leiningen for tests, so another important step is what we, as an organization and team, can set up to make it as easy as possible for people to use Red with Exercism. e.g. should we point people to a prebuilt console, do we want a simple test runner, etc. I will try to go through their setup so I know more of what the experience is like.

[23:50](#msg60231fde4f7d1b68e540ec1a)I should have chosen something other than Clojure. I don't have time for the installation pain.

The Exercism CLI itself was easy enough to set up. Maybe I should try Go.

loziniak

[23:51](#msg602320031ed88c58d830115d)Exercism guys point to C# and Elixir tracks as the most maintained and complete ones.

## Wednesday 10th February, 2021

gltewalt

[00:20](#msg602326bd24cd6b60d82cc787)rust should be easy to install

greggirwin

[00:40](#msg60232b91a0246860dc41e2f9)Go was easy to install, as expected, but their docs are out of date about where the MSI installer puts in, and my env doesn't see it yet. Thanks for the note on C# and Elixir.

gltewalt:matrix.org

[01:38](#msg60233928a0246860dc420355)The Go docs are, or the docs the have on exercism?

greggirwin

[01:45](#msg60233aa59238c531ad3657e2)Go docs.

loziniak

[22:43](#msg6024619355359c58bf358c48)Probably using separate communication channel would be good for the Excercism thing. I wonder which one would be the best: gitter channel like red/exercism? A gitter channel exercism/red could probably also be created for us. Or Exercism's Slack, where channels for Red have also been created and I think they are meant just for this.

greggirwin

[23:03](#msg6024664532e01b4f718a3389)I'd rather not add Slack to the mix. I have a couple things I joined it for, and almost always just avoid it. We could do a general red/advocacy or red/training, so we can pose various ideas and figure out how and where to put them.

loziniak

[23:05](#msg602466cc24cd6b60d8301071)Suits me. I'll be a connection between Red team and Exercism team then, through the nasty Slack (I also try to avoid it where possible). Also, there's always \[GitHub's exercism/red repo](https://github.com/exercism/red) with issues and comments.

greggirwin

[23:06](#msg602466fc32e01b4f718a35b8)We'll set up a room and adjust as we find what works best.

[23:08](#msg6024675b9d5c644f66634c36)https://gitter.im/red/training

## Thursday 11st February, 2021

GiuseppeChillemi

[00:01](#msg602473c684e66b7f7ee5c5d8) @greggirwin While the "open a room" thing is open, could I ask for https://gitter.im/red/porting ?

[00:01](#msg602473ed84e66b7f7ee5c624)There is the whole Rebol world of scripts to port (rebol.org, github..) and projects written in other languages!

greggirwin

[00:05](#msg602474ba4f7d1b68e5446a77)I was going to say "open a new room is not a thing", but that's a good enough idea that I can't say it. :^)

[00:07](#msg6024752d32e01b4f718a5a8c)https://gitter.im/red/porting

GiuseppeChillemi

[01:11](#msg60248435aa6a6f319d1a94af)Be ready to say "open a new room is not a thing " soon because there are 2 more rooms I am ready to ask for when it will be the right time. One starts with "A" and the other with "N". (guess their name!)

OneITI37

[05:29](#msg6024c0b3ae4b9b27c1b295c5)Hi. I use zsh on macOS Catalina (10.15.7) on an Intel MacBook Pro. When I download a Red binary from the download page and open the Red executable, it displays "zsh: bad CPU type in executable". Is it because I use the old Intel CPU architecture? Or is it just a bug?

Respectech

[06:16](#msg6024cbaf55359c58bf36847a)@OneITI37 Catalina will only run 64 bit programs. Red is not 64 bit yet. You have to run in an emulator on Catalina for now.

## Monday 15th February, 2021

snotbubble

[03:32](#msg6029eb3d9ba13e72e42df7ec)quick question: how to set the tab-width in area? I'm getting 8, need 4.

toomasv

[05:13](#msg602a02df726a881d4f75fc04)@snotbubble Hmm... My tab-width in area is 4 but I have not adjusted it, so it seems to depend on environment.

snotbubble

[05:34](#msg602a07dbe634904e609eabfe)yep looks like its a gtk setting: `gtk_text_view_set_tabs` \[gtk-docs](https://developer.gnome.org/gtk3/stable/GtkTextView.html#gtk-text-view-set-tabs)

rebred

[06:51](#msg602a19e047585464db7c2a6e)

```
str: {ok * just some   str *  yes*ok! test*ok}
rule: [ not "*" keep to ["*" | " " | end] skip
		| thru "*" keep to "*" skip] 
probe result: parse str [collect[any rule]]
```

I'd like to separate characters by space and when they are included in asterisks

I get:

```
but I'd like:
```

== \["ok" " just some str " "yes" "ok! test" "ok"]\`

toomasv

[07:43](#msg602a260d9ba13e72e42e7c37)@rebred With your rule I get

```
["ok" " just some   str " "yes" "ok!" "test" "ok"]
```

instead (triple space in `"just some str"`).

Don't know if I got you intention correctly, but here is one possibility:

```
str: {ok * just some   str *  yes*ok! test*ok}
rule: [ not asx keep to asx asx]
asx: [any " " "*" any " " | end]
result: parse str [collect[any rule]]
;== ["ok" "just some   str" "yes" "ok! test" "ok"]
```

rebred

[07:44](#msg602a265f6825b964d60debec)@toomasv that's great thanks a lot!!!

toomasv

[07:45](#msg602a2683a8c6a778480e24ed)You are welcome!

rebred

[07:49](#msg602a279c9403f11bb583cb68)@toomasv I think it's missing one space before

```
just
```

and one space after

```
str
```

[07:54](#msg602a28b44c79215749e94139)the goal is to get the strings between asterisks with the included spaces

[07:57](#msg602a297e4c79215749e9426e)and string outside asterisks without spaces

[07:59](#msg602a29ef9ba13e72e42e85a3)something like

```
;== ["ok" " just some   str " "yes" "ok! test" "ok"]
```

toomasv

[08:32](#msg602a31a693539e234377b83a)@rebred Complicated :) I can get components you want, but I don't know if this is generally what you expect:

```
str: {ok * just some   str *  yes*ok! test*ok}
rule: [ "*" keep to ["*" | end] e: opt [if (e/2 = #" ") skip]
      | keep to ["*" | " " | end] e: opt [if (e/1 = #" ") skip]] 
result: parse str [collect [any rule]]
;= ["ok" " just some   str " "yes" "ok! test" "ok"]
```

rebred

[08:37](#msg602a32ca9403f11bb583eea4)

```
str: { ok* just some   str *  yes*ok! test*ok ok }
rule: [ "*" keep to ["*" | end] e: opt [if (e/2 = #" ") skip]
      | keep to ["*" | " " | end] e: opt [if (e/1 = #" ") skip]] 
result: parse str [collect [any rule]]
== ["ok" " just some   str " "yes" "ok! test" "ok ok "]
```

[08:38](#msg602a32f693539e234377baf6)the last

```
ok
```

```
ok
```

is not separated!

toomasv

[08:45](#msg602a34b59403f11bb583f27d)Ok, I think I finally understood what you want. You were pretty close to it initially:

```
str: {ok * just some   str *  yes*ok! test*ok ok}
rule: [ "*" keep to "*" skip
      | keep to ["*" | " " | end] e: opt [if (e/1 = #" ") skip]]
result: parse str [collect [any rule]]
;== ["ok" " just some   str " "yes" "ok! test" "ok" "ok"]
```

rebred

[08:46](#msg602a34cfa7fc4b573bd637a6)@toomasv amazing thanks a lot!!!!!

toomasv

[08:47](#msg602a3529726a881d4f766b84):smile:

snotbubble

[10:05](#msg602a475d726a881d4f7699d2)Is there a way to allow events and layout to share data?  
in this case menu event can see `a`, but the button can't see `b` after its set in the event. It seems like anything set in the event is a copy.

```
Red [ needs 'view ]
a: "aye"
b: "bee"
v: layout [
	panel 400x70 [
		f: field 180x30 a
		button 180x30 "check b" [ f/text: b ]
	]
]
view/options v [
	menu: [
		"change it" [
			"change b" changeit
			"change back to a" changeitback
		]
	]
	actors: object [
		on-menu: function [face event] [
			switch event/picked [
				changeit [ b: "buh" f/text: b ]
				changeitback [ f/text: a ]
			]
		]
	]
]
```

[10:12](#msg602a49288031c8234be13ecb)nvm my bad: `func` not `function`...

mikeyaunish

[20:24](#msg602ad87d8031c8234be2baa9)Because my program only works properly with the most recent builds is there a way to specify which build is required in the header of the Red program?

greggirwin

[20:32](#msg602ada559337c51bc68b5d6d)@mikeyaunish not at this time.

ne1uno

[20:38](#msg602adbd58031c8234be2c2e0)you can check for something like `sum` missing in very old builds, `if unset? get/any 'sum [...]` might check how `transcode` worked differently in older builds

greggirwin

[20:39](#msg602adc16dc108172e77bf573)You can see how `about` introspects for build information.

ne1uno

[20:40](#msg602adc407ba8124e54694b87)custom builds may not have version numbers

greggirwin

[20:40](#msg602adc56a7fc4b573bd7ef7f)Just checking `system/build/date` should be enough.

## Thursday 25th February, 2021

bubnenkoff

[11:43](#msg60378d63b13524529aad3216)

```
f: func[] [print "hello"]
view [
	do [f]
]
```

is there any way to call `f` infinity times every 5 seconds?

9214

[11:51](#msg60378f392a9d4f27f131f081)@bubnenkoff

```
view [base transparent rate 0:0:5 on-time [print "hello"]]
```

bubnenkoff

[12:00](#msg603791610045466209524e20)Thanks! If I am doing some processing (CPU bound) can I use it without any problem? Or it have any limitations (for example block any internal interpritator state)?

[12:05](#msg603792a14821572018fd1f87)Is there any way to do it without `view`?

toomasv

[12:11](#msg603793fab1837054051740c6)In cli-terminal `forever [wait 5 print "hello"]`

bubnenkoff

[12:18](#msg60379587cdbfc0620c29926c)Heh. I mixed tham and Red is hang:

```
f: func[] [forever [wait 5 print "hello"]]
view [
	do [f]
]
```

toomasv

[12:20](#msg60379617e0d7284c7359d6af)`wait` does not work currently in gui-console

[12:22](#msg60379693cdbfc0620c299620)Another possibility with `view`:

```
view/options [on-time [print "hello"]][rate: 0:0:5]
```

GiuseppeChillemi

[22:34](#msg603825e74821572018ff2521)I remember @henrikmk or @giesse talking about passing arguments via blocks, using set-words followed by its value; I remember also the advice that "it is better using named arguments when they are more than... n...". I can't find this thread and such an argument passing style has been implemented somewhere. Does anyone remember this thread or implementation?

## Friday 26th February, 2021

hiiamboris

[09:54](#msg6038c54dd74bbe49e0bcc50b)Implemented in Topaz

[09:54](#msg6038c557a3a2f04f1fbc32cc)http://www.colellachiara.com/soft/topaz/try-topaz.html

snotbubble

[14:56](#msg60390c3be8267a46f2dab1eb)is there a way to instance a field from a context to a view?

```
Red [ needs 'view ]
node: context [
	name: "one"
	ui: [ panel 120x50 50.50.55 loose [ t: field 60x30 name ] ]
]
n: []	;; nodes
nl: []	;; instances of node ui to display
view [
	below
	p: panel 40.40.45 [ ]
	button "make node" [ 
		append n copy node
		append nl n/(length? n)/ui	;; this seems to copy ui not instance it
		p/pane: layout/only nl 
	]
	button "change text" [ probe n/1/ui n/1/name: "two" ]
]
```

create a node, hit the 'change text' button. Was hoping the displayed field would change to "two".

toomasv

[16:04](#msg60391c27823b6654d26d3448)@snotbubble You replace the text with new string, but you need to change the same string to see it, e.g.

```
button "change text" [ probe n/1/ui append clear n/1/name "two" ]
```

or

```
button "change text" [ probe n/1/ui change/part n/1/name "two" 3]
```

GiuseppeChillemi

[22:27](#msg603975c8823b6654d26e465a)How can I convert this time value to a number to be used in calculations?  
`0:00:00.0129937`  
If I try to-integer I get 0

greggirwin

[22:28](#msg60397627d1aee44e2daf72d1)`to float!`. Seconds are the integer part, so less than that truncates when converted.

## Saturday 27th February, 2021

snotbubble

[02:13](#msg6039aacfe8267a46f2dc76d1)@toomasv here's a simpler example:

```
Red [ needs 'view ]
node: context [ name: "one" ]
view [ 
	field options [text: node/name] on-change [ probe node/name ]
	button "change node name" [ node/name: "two" probe node/name ]
]
```

how to make a two-way binding between field/text and node/name ?

greggirwin

[02:53](#msg6039b42fa3a2f04f1fbecfde)@snotbubble see https://github.com/red/docs/blob/master/en/view.adoc#two-way-binding

```
node: reactor [name: "one"]
view [ 
    field with [text: node/name] react [face/text: node/name]
    button "change node name" [node/name: "two" probe node/name]
]
```

`Options` doesn't work the way you think it does. See https://github.com/red/docs/blob/master/en/view.adoc#options-facet

snotbubble

[03:35](#msg6039bde5a3a2f04f1fbee879)@greggirwin Got it thanks, this is working now:

```
Red [ needs 'view ]
node: reactor [ 
	name: "one"
	idx: "100"
]
view [ 
	field with [ text: node/name ] on-change [ print [ "node/name after name on-change: " node/name ] ] react [ face/text: node/name print [ "node/name after name react: " node/name ] ]
	field with [ text: node/idx ] on-change [ print [ "node/idx after idx on-change: " node/idx ] ] react [ face/text: node/idx print [ "node/idx after idx react: " node/idx ] ]
	button "reset" [ node/name: "one" print [ "reset: " node/name ] node/idx: "100" print [ "reset: " node/idx ]  ]
]
```

will I run into trouble if there's hundreds of these reactor &lt;-&gt; react bindings ?

greggirwin

[05:10](#msg6039d45da3a2f04f1fbf2035)Define "trouble". :^) @hiiamboris has stress tested that more than anyone, but the best thing to do is try it and report back. Easy enough to write a generator that spits out varying stress levels.

[05:14](#msg6039d52244f5a454a440d0b7)There are some open tickets related to reactivity, so check those and let us know if you hit one.

snotbubble

[05:28](#msg6039d86c44f5a454a440da6d)how to convert (length? n) to its value?

```
Red [ ]
n: [ "one""two" ]
u: compose [ n/(length? n) ]
probe u
```

u remains \[n/(length? n)], but need it to be \[n/2]

toomasv

[05:40](#msg6039db63d2619a4f2e0de295)In this form parens are part of path notation and are not reduced by `compose`. Try instead reducing, or put parens around `n/(...)`.

[05:43](#msg6039dc17120cd84f78dfe0f6)Ah, sorry, you want `n/2`, i.e. intermediate result. You need to use `to path!`. (Can’t try, on phone.)

ldci

[08:21](#msg603a00efe8267a46f2dd3ccf)L: length? n u: l/:n &gt;&gt; Two

toomasv

[10:12](#msg603a1af0e8267a46f2dd8256)@snotbubble Here's what I meant:

```
n: ["one" "two"]
u: reduce [to-path reduce ['n length? n]]
;== [n/2]
get first u
;== "two"
```

snotbubble

[10:47](#msg603a234c457d6b4a948f6066)@toomasv awesome thanks Toomas

toomasv

[11:13](#msg603a296dd1aee44e2db12ccc)@snotbubble You are welcome!

## Sunday 28th February, 2021

gltewalt

[21:41](#msg603c0df1d74bbe49e0c587a3)Can I compile with an image, without have a giant image data block in the code?

[21:42](#msg603c0e36823b6654d2750920)

```
pic: make image! [94x178 #{
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF..... goes on forever
```

hiiamboris

[21:42](#msg603c0e39e8267a46f2e2c765)`#include` the giant block ;)

[21:42](#msg603c0e5795e23446e403482b)also use `png` format to make it smaller

gltewalt

[21:44](#msg603c0eb8b5131f4f28e31eb2)It's a png, but still "giant block"

hiiamboris

[21:45](#msg603c0ee95d0bfb4e587a7106)ok nevermind

gltewalt

[21:47](#msg603c0f62457d6b4a9494874c)Totally forgot all about #include. I'll do that later.

hiiamboris

[21:56](#msg603c118122a5ce4a912507d8)one-line embedding:  
`img: load/as #do keep [read/binary %/file/path] 'png`

gltewalt:matrix.org

[22:00](#msg603c127a457d6b4a94948fd5)If that works, do I owe you 100 rubles?

hiiamboris

[22:00](#msg603c1283d74bbe49e0c59471)lol

[22:10](#msg603c14d7d1aee44e2db64119)macro approach:

```
#macro [#embed-image file!] func [s e] [compose [load/as (read/binary s/2) (select [%.jpeg 'jpeg %.jpg 'jpeg %.png 'png %.gif 'gif] suffix? s/2)]]

img: #embed-image %/file/path.ext
```

gltewalt

[23:27](#msg603c26cce8267a46f2e30691)The one-line example worked fine

snotbubble

[23:46](#msg603c2b72a3a2f04f1fc55e60)have another question on reactors: how to use when the reactor field and view widget are of different types?

```
Red [ needs 'view ]
node: reactor [ color: 50.50.50 name: "one" ]
view [
	below
	field 200x30 with [ text: node/name ] on-change [ print [ "is text>text changing node?" node/name ] ] react [ face/text: node/name ]
	c: base 200x200 with [ color: node/color ] react [ face/color: node/color print [ "basecolor reacts to change in node: " node/color ] ]
	across
	slider 140x30 with [ data: node/color/1 / 255.0 ] on-change [ print [ "is float>tuple-component changing node?" node/color ]  ] react [ face/data: node/color/1 / 255.0 ]
	field 50x30 with [ text: to-string node/color/1 ] on-change [ print [ "is text>tuple-component changing node?" node/color ] ] react [ face/text: to-string node/color/1 ]
]
```

in the above reacting text&lt;-&gt;text works, but not for to-int-float&lt;-&gt;tuple-component, or to-int-text&lt;-&gt;tuple-component.

## Monday 1st March, 2021

greggirwin

[02:48](#msg603c55ec457d6b4a9495343e)@snotbubble I'm not sure what you're asking. Nothing in your code changes `node/color` so I don't know what reactions you expect. https://www.red-lang.org/2016/06/061-reactive-programming.html has a slider example. Here I just added a timer to change the node color, and you can see the other faces update as it does.

```
Red [ needs 'view ]
node: reactor [ color: 50.50.50 name: "one" ]
view [
	below
	field 200x30
		with [ text: node/name ]
		on-change [print [ "is text>text changing node?" node/name ]]
		react [ face/text: node/name]
	c: base 200x200 rate 0:0:2
		with [ color: node/color ]
		react [ face/color: node/color print [ "basecolor reacts to change in node: " node/color ] ]
		on-time [node/color: random 255.255.255]
	across
	slider 140x30
		with [ data: node/color/1 / 255.0 ]
		on-change [ print [ "is float>tuple-component changing node?" node/color ]  ]
		react [ face/data: node/color/1 / 255.0 ]
	field 50x30
		with [ text: to-string node/color/1 ]
		on-change [ print [ "is text>tuple-component changing node?" node/color ] ]
		react [ face/text: to-string node/color/1 ]
]
```

snotbubble

[03:33](#msg603c607422a5ce4a9125bdf6)@greggirwin have a look at this example, nothing explicitly tells node to change its field values (the on-change event just prints), but they are bound to the fields anyway:

```
Red [ needs 'view ]
node: reactor [ 
    name: "one"
    idx: "100"
]
view [ 
    field with [ text: node/name ] on-change [ print [ "node/name after name on-change:^/" node ] ] react [ face/text: node/name print [ "node/name after name react: " node/name ] ]
    field with [ text: node/idx ] on-change [ print [ "node/idx after idx on-change:^/" node ] ] react [ face/text: node/idx print [ "node/idx after idx react: " node/idx ] ]
    button "reset" [ node/name: "one" print [ "reset: " node/name ] node/idx: "100" print [ "reset: " node/idx ]  ]
]
```

The data types are the same, so I suspect that's why its working. I'm trying to do the same thing using widgets that have different data types to what's stored in node, binding color/1 to a float slide or text field for example.

greggirwin

[03:46](#msg603c63a5b5131f4f28e3e5ef)Ah, maybe what you're running up against is that not all datatypes are deeply reactive, the way series values are. That is, the reactive system doesn't see the change \*inside* a tuple.

[03:47](#msg603c63ecb5131f4f28e3e67c)The workaround there would be to use a block and convert to a tuple as needed.

snotbubble

[03:57](#msg603c6627a3a2f04f1fc5e83f)still no effect with a block:

```
Red [ needs 'view ]
node: reactor [ color: [80 50 50] name: "one" ]
view [
	below
	field 200x30 with [ text: node/name ] on-change [ print [ "is text>text changing node?" node/name ] ] react [ face/text: node/name ]
	c: base 200x200 with [ color: to-tuple node/color ] react [ face/color: to-tuple node/color print [ "basecolor reacts to change in node: " node/color ] ]
	across
	slider 140x30 with [ data: node/color/1 / 255.0 ] on-change [ print [ "is float>tuple-component changing node?" node/color ]  ] react [ face/data: node/color/1 / 255.0 ]
	field 50x30 with [ text: to-string node/color/1 ] on-change [ print [ "is text>tuple-component changing node?" node/color ] ] react [ face/text: to-string node/color/1 ]
]
```

greggirwin

[04:27](#msg603c6d39a3a2f04f1fc5f86a)My brain must be mud right now. I still can't see what you're trying to do, or expecting. My best guess is that you see the field edits changing the node, which you want, but the slider ref'ing `node/color/1` doesn't, and confusing changes to a series vs a non-series value. That is `text` is a series, and the `field` refs the same string series as the `name` in `node`. But when you say `data: node/color/1` you are \*not* ref'ing `node/color` (the block), but the single integer value. And that won't trigger reactions. You need to do something like `node/color/1: to integer! 255 * face/data` in slider `on-change`.

toomasv

[08:08](#msg603ca116457d6b4a9495f21b)@snotbubble Does this do what you expect?

```
clear-reactions
node: deep-reactor [ color: 80.50.50 name: "one" ]
view [
    below
    field 200x30 with [text: node/name] 
        on-enter [ print [ "is text>text changing node?" node/name ] ] 
    c: base 200x200 
        react [ print [ "basecolor reacts to change in node: " face/color: node/color ] ]
    across
    slider 140x30 on-change [ 
        node/color/1: to-integer face/data * 255 
        print [ "is float>tuple-component changing node?" node/color] 
    ] react [ face/data: node/color/1 / 255.0 ]
    field 50x30 on-enter [ 
        node/color/1: face/data 
        print [ "is text>tuple-component changing node?" node/color ]
    ] react [ face/text: to-string node/color/1 ]
]
```

snotbubble

[09:35](#msg603cb56be562cf54ac8f0355)@toomasv Got it. If not ~~the same type~~ changing a series, use on-change.  
Its doing a lot of work however, just changing the last field triggers this:  
`basecolor reacts to change in node: 200.50.50 (base reaction)`  
`is float>tuple-component changing node? 200.50.50 (slider on-change)`  
`slider reacts to node change: 200.50.50 (slider reaction)`  
`number field reacts to node change: 200.50.50 (field reaction)`  
`basecolor reacts to change in node: 200.50.50 (base reaction, again)`  
`number field reacts to node change: 200.50.50 (field reaction, again)`  
`is text>tuple-component changing node? 200.50.50 (field on-change)`

toomasv

[10:23](#msg603cc0a5d2619a4f2e158a10)On W10 GUI it is not so convoluted. On entering it runs

```
basecolor reacts to change in node:  80.50.50
```

And on changing last field, only the following is reported:

```
basecolor reacts to change in node:  180.50.50
is text>tuple-component changing node? 180.50.50
```

[10:24](#msg603cc0f45d0bfb4e587c3f25)Hmm, it doesn't report slider change.

[13:34](#msg603ced65b5131f4f28e56c2b)Ah, of course it doesn't report, as it is not instructed to report on reaction.  
With reporting on reaction added to slider and last field, change of last field results in:

```
basecolor reacts to change in node:  180.50.50
Slider reacted
Field2 reacted
is text>tuple-component changing node? 180.50.50
```

gunn

[20:58](#msg603d5574d1aee44e2db9d0bd)Hey is there a good way to make a simple http server with a REST api in Red?

greggirwin

[21:01](#msg603d563e457d6b4a9498140f)Not at this time. Ports are getting close :tm: to being released. When they are, you'll be able to.

pekr

[21:16](#msg603d59c795e23446e406fd5c)Nice :-)

## Tuesday 2nd March, 2021

gltewalt

[02:18](#msg603da059e5f1d949d472b4a4)Another thing I'm probably being a dunce about... why is `transcode/scan` not catching `\` in this app?

Code:

```
scan: func [fld][
		either error! = transcode/scan fld/text [fetch-txt/data: "doh!"][fetch-txt/data: copy ""]
	]
```

[02:18](#msg603da089d74bbe49e0c9fd92)Gif  
https://imgur.com/a/3uukx6c

[02:24](#msg603da1f9d71b6554cd165ead)it catches `,` `/` `$` `%`

[02:30](#msg603da337b5131f4f28e78583)However, at the start of the line, it catches...  
https://imgur.com/a/y9547xe

[02:39](#msg603da550823b6654d27979d8)

```
>> transcode/scan "ask]"
== word!
```

[02:41](#msg603da5f05d0bfb4e587ed68b)transcode/scan "]ask" == error!

[03:38](#msg603db333d2619a4f2e1854b2)Maybe close enough.  
https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#word

[04:03](#msg603db928d2619a4f2e186349)One final issue (I think). Is there a way to refresh the input field here when the input is changed with parse?  
https://imgur.com/a/eIIzfqx

toomasv

[08:54](#msg603dfd59d1aee44e2dbb7fbf)Something like this? (Keep pressing enter while in second field):

```
view [
    below 
    f1: field 200 "Very long string" 
    f2: field 200 focus 
        data [change "Very" ("Not so") | change "Not so" ("Very")] 
        on-enter [parse f1/text face/data]
]
```

gltewalt

[18:02](#msg603e7dafe562cf54ac940c96)Came down to `face/text: head input` in the `match` event of parse/trace

[18:02](#msg603e7db4e8267a46f2e97192)https://imgur.com/a/pTCXGOz

GiuseppeChillemi

[21:29](#msg603eae21e562cf54ac9499fd)As Red Read does not work for me, is there a Curl implementation?

## Wednesday 3th March, 2021

gltewalt

[01:53](#msg603eec3422a5ce4a912ccd1d)Read for what?

[02:03](#msg603eee7fe8267a46f2eaadff)If you're referring to my thing, you can just comment out that part. You won't get the picture of the golf clubs guy, but everything else will work.

GiuseppeChillemi

[05:58](#msg603f25a344f5a454a44f056b)@gltewalt I am talking about networking. Red gives me an error on reading web pages.

rebolek

[06:13](#msg603f29265d0bfb4e5882e593)I really wonder why as it uses just standard OS networking.

gltewalt:matrix.org

[06:17](#msg603f2a1044f5a454a44f0f68)Error on http or only on https ?

GiuseppeChillemi

[06:58](#msg603f338fd1aee44e2dbee2f2)HTTPS, Http is OK. Hiiamboris has written that the code returns timeout error for any error. If we don't have a precise error code it would be difficult do find the cause. If someone is interested into debugging the cause, I have already installed Wireshark and I may spend some time on a debug version of Red. Here is the issue on this topic. https://github.com/red/red/issues/4791

zwortex

[12:08](#msg603f7c52d2619a4f2e1d2d0e)Hi everybody. Hope you're fine. I was wondering if it's possible to trigger the contextual menu of a face and how to do so. For instance, I have here a view with a button that has a contextual menu setup and I would like to open it when I click on the button as well as when I right click on it. If you could point me towards the proper documentation that would help or share an example with me, I'd be delighted. Cheers.

```
view [
    button "Menu" with [ menu: ["Test" test]]
        [
            ;; trigger menu ?
        ]
        on-menu [
            if event/picked = 'test [
                print "Test"
            ]
        ]
]
```

hiiamboris

[12:18](#msg603f7e81120cd84f78ef1f23)That's quite non-standard thing to do. I don't remember ever seeing a context menu that would open when you left-click on it.

[12:18](#msg603f7eb0457d6b4a949dc3d9)I think you'll have to call OS API directly, using R/S.

zwortex

[12:47](#msg603f857ca3a2f04f1fce80cd)Hi @hiiamboris. Let's not get off the beaten tracks for the time being. Is there no way to re-send and re-purpose the click event into a right click event ?

hiiamboris

[13:07](#msg603f89fb120cd84f78ef3c96)No

[13:07](#msg603f8a2bb5131f4f28eca286)It's not Red who shows the context menu, it's the OS

[13:11](#msg603f8b1fe562cf54ac96dfef)You can plug \[this](https://gitlab.com/hiiamboris/red-view-test-system/-/blob/master/input.red#L136) in to simulate right click on Windows though

## Thursday 4th March, 2021

zwortex

[09:03](#msg6040a245d71b6554cd1e992e)@hiiamboris, thanks for the link. I understand I can produce an event using the OS API. Anyhow, I'll try and figure out a more standard approach.

## Friday 5th March, 2021

temperfugit

[06:51](#msg6041d4e4d2619a4f2e23cb15)Does anybody have some general advice for improving the performance of a Red script? Paths seem to be generally slower than more direct variables, and paths/(with)/variables in them are even slower. What other guidelines are there? Are some iterators faster than others?

hiiamboris

[08:19](#msg6041e9975d0bfb4e588aa3de)1) do benchmarks https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/clock-each.red

[08:19](#msg6041e9a2a3a2f04f1fd54f75)2) write routines

greggirwin

[18:37](#msg60427a8444f5a454a4586438)@hiiamboris +1. It's hard to make recommendations without knowing what the script is doing. Micro-optimizations tend to have very, very small effects in real world situations. The first thing is to know where time is spent, which we'll be improving in Red. Then, and what we need to note when we have numbers, is what evaluation patterns or funcs are especially \*slow\*. It's easier to tell people to avoid `X` and `Y`, which are slow, than to use `[A B V D E ...]` in order of performance. This is a \*great* topic for a wiki page, because we can collect information and easily annotate and update it as people explore.

## Saturday 6th March, 2021

temperfugit

[01:24](#msg6042d9c1b5131f4f28f5f38a)@hiiamboris That benchmarking tool looks very cool! I've messed with routines a little bit, but I need to dig a little deeper and learn how to return multiple values from a routine as a c string.

[01:55](#msg6042e0fb44f5a454a4597d66)@greggirwin I'm working on a script that finds the point(s) where bezier curves intersect each other. Because it involves mostly two tasks (polygonal collision detection and bezier subdivision) repeated over and over again it has me thinking about optimization more than I normally would be, tbh.

greggirwin

[02:46](#msg6042ed2395e23446e4163f1b)@temperfugit good info, that helps a lot. @toomasv has done some cool stuff in that area, so he might have some hints.

[02:48](#msg6042ed67120cd84f78f8bd18)https://gist.github.com/toomasv/36b2cad5ae9c438557fb7ed0d27cb64f

toomasv

[04:47](#msg6043097695e23446e4168478)I haven't tried to do this with bezier curves, only stright lines, so it is probably of little help, sorry.

## Tuesday 9th March, 2021

gltewalt

[01:57](#msg6046d607d74bbe49e0e00bbb)Any advice for a safer way for parse rules to be loaded and evaluated? `do load face/text` means any text is a live wire.

[02:03](#msg6046d77ca3a2f04f1fe20401)Or just leave it as "User beware, and be careful"?

greggirwin

[05:37](#msg6047099d120cd84f78031539)`Do` is unsafe with untrusted data, but if you need to evaluate any legal Red, then you have no choice. The alternative is to write a dialect and make sure it conforms to that (limited and safe) content.

[05:38](#msg604709bad74bbe49e0e080da)Given that this is a local dev tool, warning people is probably the way to go.

GiuseppeChillemi

[20:00](#msg6047d3f795e23446e422e0fe)Is there any script to manage XML via Red?

hiiamboris

[20:07](#msg6047d56fe562cf54acad0b25)https://github.com/rebolek/red-tools/blob/master/codecs/xml.red

## Wednesday 10th March, 2021

rgchris

[01:06](#msg60481b8695e23446e423a921)An experimental version of \[AltXML](https://ross-gill.com/page/XML\_and\_Rebol): \[%altxml.red](https://github.com/rgchris/Scripts/blob/master/experimental/altxml.red)

gltewalt

[02:33](#msg60483008e5f1d949d48c11d3)`#include %caddy.png`

[02:33](#msg60483016823b6654d2959f4c)

```

```

-=== Red Compiler 0.6.4 ===-

Compiling /home/gt/Desktop/tppt/caddy.red ...  
\*\** Syntax Error: Invalid Red program  
\*\** in file: /home/gt/Desktop/tppt/caddy.red  
\*\** line: 1  
\*\** at: {�PNG  
^Z  
^@^@^@  
IHDR^@^@^@^^^@^@^@�^H^F^@^@^@�Tx�^@^@^@^DsBIT}  
\`

[02:34](#msg60483038d1aee44e2dd6d807)Anyone experience this?

hiiamboris

[09:21](#msg60488fb195e23446e424e65b)What did you expect?

Oldes

[09:46](#msg60489564823b6654d296b4f3)@gltewalt you are supposed to include a Red source code file, not an image.

greggirwin

[09:49](#msg60489627457d6b4a94b6184a)Ladislav's R2 `include` had a binary option, which would be nice. Even nicer would be a smart include, since we have codecs that \*do* understand image files. For some reason I thought that might work.

The question, though, is what pattern we suggest for this use case.

hiiamboris

[09:54](#msg6048973fd1aee44e2dd7ef20):point\_up: \[March 1, 2021 12:56 AM](https://gitter.im/red/help?at=603c118122a5ce4a912507d8) this one

[09:55](#msg60489782120cd84f78078023)@rgchris your code reminds me that Red actions are not fit for tree-like data structure and there's still no general purpose helpers for this.

rebolek

[10:00](#msg604898d0b5131f4f28050432)If `include` worked with codecs, it would turn relatively small PNG into a huge uncompressed bitmap which is not desirable IMO.

Oldes

[10:06](#msg60489a0ee8267a46f20489bc)@greggirwin I'm not sure, if Ladislav would like, that you are using \_past tense_ with his \[include](https://github.com/saphirion/include) function.

hiiamboris

[10:10](#msg60489b04457d6b4a94b62599)&gt; If `include` worked with codecs, it would turn relatively small PNG into a huge uncompressed bitmap which is not desirable IMO.

And we would have to wait for Red to become self-hosted, as R2 does not decode PNGs out of the box.

Oldes

[10:24](#msg60489e52d2619a4f2e35c0e3)@hiiamboris it does.. but with a little afford... `to-image read/binary ...`, but I agree with rebolek, that it is not a good idea.

hiiamboris

[10:29](#msg60489f9ad71b6554cd33daa2)@Oldes I just tried that with jpg and png and I'm getting arbitrary rectangle full of random pixels

Oldes

[10:31](#msg60489ffbd1aee44e2dd804f2)Ah... you are right.. it is just `load` in R2...

```
>> load  %/r/t/48.png
== make image! [48x48 #{
```

[10:32](#msg6048a050d1aee44e2dd805ce)(it's a long time since I used R2 for something else than Red compilation;)

hiiamboris

[10:34](#msg6048a0a1e8267a46f20499ed)Oh great. It can even load jpegs. But can it save jpegs? I don't see `save/jpeg` there

Oldes

[11:17](#msg6048aac544f5a454a4685535)no.. R2 cannot save jpegs.

gltewalt

[12:18](#msg6048b92c823b6654d2971cef)@Oldes I was including a red source file. It was asked if just including .png would work, so I tried it

[12:26](#msg6048baffe562cf54acaf836b)@hiiamboris your one line way only works if png is in the same dir that im running Red from. For me.

[12:27](#msg6048bb4244f5a454a46881e2)Including a Red filw with image data works best so far

[12:27](#msg6048bb4dd2619a4f2e3611ca)File

[12:31](#msg6048bc34d74bbe49e0e4ec5a)Works after compiling, that is

loza:matrix.org

[12:33](#msg6048bca75d0bfb4e589c9da4)looks like there's need for #resource directive 😃

hiiamboris

[13:02](#msg6048c36e457d6b4a94b6946a)&gt; @hiiamboris your one line way only works if png is in the same dir that im running Red from. For me.

try specifying absolute paths

rgchris

[13:45](#msg6048cd5ed71b6554cd345c03)&gt; @rgchris your code reminds me that Red actions are not fit for tree-like data structure and there's still no general purpose helpers for this.

I used a different approach for for my \[markup](https://github.com/rgchris/Scripts/blob/master/experimental/markup.reb#L1951) parser. I don't know if it's that approach or the parser, but it's not the quickest (though speed wasn't a major factor in this iteration).

hiiamboris

[14:03](#msg6048d1a644f5a454a468c8fa)Interesting. Basically https://github.com/red/REP/issues/57 with extra data and first/last shortcuts.

rgchris

[15:58](#msg6048ec95a3a2f04f1fe80420)I'll have to take your word for that on first read. Effectively every node has five relations (which can obvs be \*none* if not applicable).

hiiamboris

[16:00](#msg6048ed2bd74bbe49e0e570c9)Do you actually need `parent` in the node?

[16:01](#msg6048ed6ce8267a46f2058ae1)You could have modeled doubly linked list with 2 \*empty* nodes, between which \*data* nodes would be placed. Then to prepend/append a node, you would do so between the empty node and first/last data node.

rgchris

[16:06](#msg6048ee725d0bfb4e589d49ee)I'd have to go back and review the code 'cause it's messy, but if an operation on a given node depends on the disposition of its parent, then isn't it a long trip to locate it otherwise?

hiiamboris

[16:08](#msg6048eee0a3a2f04f1fe80d6d)it depends.. if while traversing you keep the full path from root to the current node then that path tells you enough

rgchris

[16:10](#msg6048ef5ed1aee44e2dd90342)So then you're only retaining the parental relationship \*if* you happen to need that node

[16:11](#msg6048efbd823b6654d297d71a)Though not having a parental relationship will tell you if a given node (could have been stored at some other point) is detached (or root)

hiiamboris

[16:13](#msg6048f018e5f1d949d48e0272)yeah

[16:14](#msg6048f05fe562cf54acb041fe)idk if you actually need to "ask" node if it's \*in* the particular tree or not

[16:14](#msg6048f07ad2619a4f2e36cb42)I mean there will be use cases, but for XML representation? not sure

rgchris

[16:17](#msg6048f126120cd84f78088a6e)It depends—a consideration of mine was manipulation of XML/ML trees, previously a pain with nested blocks

[16:20](#msg6048f1e3d71b6554cd34ce96)At least approximating DOM-like manipulation

hiiamboris

[16:22](#msg6048f243120cd84f78088ea2)REP#57's `node` is like a transistor, you can model everything with it in theory. Node has 3 connections. Join 2 nodes and you get 4 connections. Join 3 and you get 5, etc.

A tree of arbitrary degree, like XML could e.g. be modeled using 2 kinds of nodes:  
1\. List node -&gt; left-node, data-node, right-node  
2\. Data node -&gt; head-list-node, data-payload, tail-list-node

If parents are needed, graph could be further complicated with another node type. Or, nodes could point to blocks of extra data (not necessarily more compact solution). E.g. `data-payload` would have a link to parent node.

GiuseppeChillemi

[16:28](#msg6048f3a7b5131f4f2806235c)Do we have a makedoc/makedocpro to GITHUB MARKUP or ASCIIDOC, or any format understood by pandoc? This question is either for RED and REBOL

rgchris

[16:37](#msg6048f5bd823b6654d297f1df)&gt; XML could e.g. be modeled using 2 kinds of nodes

I can see that being enough. My concern would be that it gets a little less concise—instead of node/parent, you'd say node/data/parent (which isn't only less concise, it's less accurate—it's not data's parent, it's node's), and given the data node, how would you get back to the list node? Apologies if this is perhaps misunderstanding the actual usage.

Anyways, I feel this may be branching OT—will have another look over the proposal when I get a chance.

[16:44](#msg6048f753a3a2f04f1fe8260d)nb. The most complex part of markup.reb is the \[adoption agency algorithm](https://github.com/rgchris/Scripts/blob/master/experimental/markup.reb#L2557), which iirc handles `'Some`

**`text'` situations. I'd speculate that any solution would need to scan well within such a function (as it stands, I have trouble unpicking my code there which is why it's still in the experimental bucket)**

**hiiamboris**

**[16:44](#msg6048f76ce8267a46f205ada6)&gt; gets a little less concise—instead of node/parent, you'd say node/data/parent (which isn't only less concise, it's less accurate—it's not data's parent, it's node's)**

**I agree with you. It may be a bit of a challenge to keep the code readable.**  
**Objects are of course more readable. But `object [a: b: c:]` = 470 bytes vs node = 16 bytes (probably 32 if we embrace the 64-bit addressing everyone is so obsessed with).**  
**And if we are to provide any tree helpers, we will need a standard structure to work on.**

**gltewalt**

**[16:52](#msg6048f932d74bbe49e0e596b8)@hiiamboris pretty sure I tried absolute path.**

**hiiamboris**

**[16:52](#msg6048f953d2619a4f2e36e925)try again ;)**

**gltewalt**

**[16:54](#msg6048f9a995e23446e426410d)Go for it**

**[17:05](#msg6048fc3eb5131f4f280644ea)It has to be relative because it's unknown where the .png is going to be, relative to the script or app directory. Or am I high?**

**[17:05](#msg6048fc5c120cd84f7808ac1d)Dont know where the user is going to stick stuff**

**hiiamboris**

**[17:09](#msg6048fd485d0bfb4e589d7a86)tricky indeed**

**gltewalt**

**[17:13](#msg6048fe39d2619a4f2e36f963)I sense sarcasm lol**

**hiiamboris**

**[17:14](#msg6048fe74e8267a46f205c38b)no.. I don't know how to solve this :D**  
**(with reasonable effort for the task)**

**[17:15](#msg6048fe9895e23446e426508f)I don't think R2 has the script path, except full path name as an argument in system/options/args**

**[17:17](#msg6048ff13d2619a4f2e36fb97)how about.. we add script path only when interpreted?**

**pekr**

**[17:18](#msg6048ff725d0bfb4e589d8081)@hiiamboris Can't find the REP #57 ...**

**gltewalt**

**[17:18](#msg6048ff75120cd84f7808b816)possibly**

**hiiamboris**

**[17:24](#msg604900c2d2619a4f2e37047f)try this one:**  
**`#macro [#embed-image file!] func [s e] [ compose [ load/as (read/binary either rebol [s/2][system/options/path/(s/2)]) (select [%.jpeg 'jpeg %.jpg 'jpeg %.png 'png %.gif 'gif] suffix? s/2) ] ] img: #embed-image %file.ext`**

**[17:41](#msg604904dc44f5a454a4697e43)nvm, I managed to bend R2:**  
**`#macro [#embed-image file!] func [s e /local p x] [ p: s/2 if #"/" <> p/1 [insert p either rebol [first split-path to-rebol-file last system/options/args][system/options/path]] x: select [%.jpeg 'jpeg %.jpg 'jpeg %.png 'png %.gif 'gif] suffix? s/2 compose [load/as (read/binary p) (:x)] ]`**

**[18:07](#msg60490afb95e23446e4267ab4)@gltewalt thanks for your reports, it's grown enough to be uploaded ;)**  
**Hosted here from now on: https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/embed-image.red**

**[18:08](#msg60490b25a3a2f04f1fe86b27)@pekr REPs are here: https://github.com/red/REP/issues**

**gltewalt**

**[18:19](#msg60490d9be8267a46f205f237):thumbsup:**

**greggirwin**

**[18:27](#msg60490f76d74bbe49e0e5d47b)Apologies to Ladislav for my late night helping verb faux pas. :^)**

**`#resource` is an interesting idea @loza:matrix.org.**

**@hiiamboris @gltewalt :+1:**

****Thursday 11st March, 2021****

**GiuseppeChillemi**

**[09:50](#msg6049e7e35d0bfb4e58a0049a)About the MakeDoc to Markdown, FYI I have found the following Makedoc2ASCIIDOC script: https://github.com/gchiu/Rebol2/blob/master/Scripts/mdp2asciidoc.r**  
**I don't know if others exist.**

**luce80**

**[18:40](#msg604a6438e562cf54acb46db4)@hiiamboris (I don't think R2 has the script path, except full path name as an argument in system/options/args) . R2 has system/options/script , system/options/path , system/script/path . ALL are useful, the more you have the better it is.**

**hiiamboris**

**[18:41](#msg604a6459e8267a46f209dc31)nope, sorry, I checked all those**

**[18:43](#msg604a64bd457d6b4a94bb7e45)they refer to the current working dir (of R2), not to the dir where .red script resides**

**[18:43](#msg604a64eb457d6b4a94bb7e7e)and system/options/script is none**

**luce80**

**[18:51](#msg604a66b7e8267a46f209e3f0)@hiiamboris Perhaps you mean the way Red does it , but R2 does it another way Or I am missing something or the R2 script I just tried says not the truth.**

**hiiamboris**

**[18:56](#msg604a67c0d1aee44e2ddd62db)we use R2 in Red to compile the script, so of course it's interplay between R2 and red.r in particular**

**[18:56](#msg604a67cf120cd84f780cbfb9)try to compile `Red [] #do [? system/options ? system/script]`**

**[19:01](#msg604a68f4823b6654d29c40f6)btw I guess `system/options/script` is `none` just because red.r boots up from a virtual FS**

****Friday 12nd March, 2021****

**snotbubble**

**[08:13](#msg604b2295e562cf54acb68907)having trouble changing a font in draw, not sure if I'm doing it wrong or if its another GTK issue...**  
**`Red [ needs 'view ] aa: make font! [ name: "consolas" color: 30.30.40 size: 12 style: 'bold ] bb: make font! [ name: "consolas" color: 255.180.80 size: 10 style: 'bold ] m: 10x10 label: compose/deep [text (m) "title" font (aa)] redraw: func [] [ n/draw: label probe label ] view [ below n: base 300x100 draw [] button "change font" [ label/font: bb redraw ] do [ redraw ] ]`**

**ldci**

**[08:46](#msg604b2a4dd74bbe49e0eb417a)@snotbubble : why do you create a font object? Font properties can be easily modified without using draw**  
**`#! /usr/local/bin/red Red [ Needs: 'View ;' ] txt: {A key problem of software development today is software bloat, where huge toolchains and development environments are needed in software coding and deployment. Red significantly reduces this bloat by offering a minimalist but complete toolchain. This is the first introductory book about it, and it will get you up and running with Red as quickly as possible (Ivo Balbaert).} win: layout [title "System Fonts" button "Fonts"[ ft: request-font ar/font/name: ft/name ar/font/size: ft/size ar/font/style: ft/style sb/text: ft/name f/text: form ft/size sl/data: to-percent (ft/size / 100.0) ] text 40 "Size" sl: slider 70 [sz: to-integer 1 + (face/data * 99) f/text: form sz ar/font/size: sz ] f: field 40 drop-list 70 data ["black" "blue" "green" "yellow" "red"] react [ar/font/color: reduce to-word pick face/data any [face/selected 1]] select 1 button "Quit" [Quit] return ar: area white 400x400 txt font [name: "Arial" size: 12 color: black] return sb: base 400x20 white "Arial" do [sl/data: 0.12 f/text: "12"] ] view win`**

**hiiamboris**

**[08:51](#msg604b2b7a823b6654d29e63ef)@snotbubble hardly surprising as you set the font after you've already drawn the text.**

**snotbubble**

**[09:23](#msg604b331c5d0bfb4e58a3e4d9)@ldci thanks for that demo! will study it. @hiiamboris that fixed it. Had no idea the order was important. Hardly use draw so expecting many more of these mistakes...**

****Monday 15th March, 2021****

**bubnenkoff**

**[14:23](#msg604f6de5e8267a46f21788a4)Is there any short way to return all but last? I remember Toomas example with `tail` but it need so specify size**  
**`>> stack: [a b с d] == [a b с d] >> skip tail stack -2`**

**But I need simply to return all but last without knowing size of series and modification of iriginal**

**hiiamboris**

**[14:25](#msg604f6e50457d6b4a94c924e5)not currently possible**

**[14:26](#msg604f6e7895e23446e4381736)just pass the start and end offset of the slice**

**[14:26](#msg604f6e8f120cd84f781a5d42)or copy**

**toomasv**

**[14:31](#msg604f6fd9d2619a4f2e48b196)@bubnenkoff Is this short enough?**  
**`all-but-last: func [series][head clear back tail copy stack]`**

**bubnenkoff**

**[14:32](#msg604f6febd74bbe49e0f6b6fa)Great! Thanks!**

**toomasv**

**[14:44](#msg604f72e35d0bfb4e58af5d79)Um.. `copy series` ^**

**GalenIvanov**

**[15:15](#msg604f7a10823b6654d2aa111f)Can't we `take/last` from a copy of the series?**

**[15:15](#msg604f7a1b44f5a454a47b40c7)and return the copy?**

**[15:18](#msg604f7ac1e562cf54acc2311f)**  
**`all-but-last: function[series][new-s: copy series take/last new-s new-s]`**

**hiiamboris**

**[15:28](#msg604f7d1b5d0bfb4e58af8075)we can, or if you like funny solutions:**  
**`all-but-last: func [s] [copy/part back tail s -99999999]`**

**gltewalt**

**[16:14](#msg604f87d9e8267a46f217e0ff)`init: func [blk][unless empty? blk [difference blk to-block last blk]]`**

**greggirwin**

**[17:07](#msg604f9454d74bbe49e0f7349d)@gltewalt but `difference` is a set operation, so you'll lose any duplicate values.**

**gltewalt:matrix.org**

**[17:09](#msg604f94e4457d6b4a94c9b218)Yeah if he might have duplicate values**

**GalenIvanov**

**[17:12](#msg604f958bd71b6554cd475013)My `Parse` version:**

**[17:12](#msg604f9592e562cf54acc28a5f)**  
**`all-but-last: func[series][parse series[copy s to[skip end]]s]`**

**greggirwin**

**[17:29](#msg604f9970b5131f4f2818bf9f)And the winner is...**  
**`tv-all-but-last: func [series][head clear back tail copy series] gi-all-but-last: function[series][new-s: copy series take/last new-s new-s] bm-all-but-last: func [s] [copy/part back tail s -99999999] gt-all-but-last: func[series][parse series[copy s to[skip end]]s] tv: [tv-all-but-last blk-1 tv-all-but-last blk-2] gi: [gi-all-but-last blk-1 gi-all-but-last blk-2] bm: [bm-all-but-last blk-1 bm-all-but-last blk-2] gt: [gt-all-but-last blk-1 gt-all-but-last blk-2] blk-1: [1 2 3 4 5 6 7 8 9 10] blk-2: head insert/dup copy [] 0 1'000 profile/count/show [tv gi bm gt] 1'000`**

**[17:33](#msg604f9a6095e23446e438a885)**  
**`Time | Time (Per) | Memory | Code 0:00:00.006 | 0:00:00 | 16304608 | gi 0:00:00.007 | 0:00:00 | 16184856 | bm 0:00:00.008 | 0:00:00 | 16216596 | tv 0:00:00.168 | 0:00:00 | 16184440 | gt`**

**[17:38](#msg604f9b8dd74bbe49e0f74c30)All but `parse` stay constant as the series size grows, as expected. `Parse` slows down, but is the most straightforward to read. `to [skip end]` may take a second to understand, it's nice and concise.**

**GalenIvanov**

**[17:41](#msg604f9c5ab5131f4f2818c996)@greggirwin Thanks for your analysis!**

**giesse**

**[17:57](#msg604f9ff2e562cf54acc2abf7)what's wrong with**  
**`>> all-but-last: func [series] [copy/part series back tail series] == func [series][copy/part series back tail series] >> all-but-last [1 2 3 4 5 6] == [1 2 3 4 5]`**

**greggirwin**

**[18:12](#msg604fa394e5f1d949d4a00ff5)Nothing. :^)**

**[18:12](#msg604fa3a522a5ce4a915a330b)Also very clear.**

**[18:12](#msg604fa3abe8267a46f2184123)Let me find my old one.**

**[18:14](#msg604fa3f3e5f1d949d4a01104)**  
**`but-last: func [ser [series!] /part n][ copy/part ser skip tail ser negate any [n 1] ]`**

**hiiamboris**

**[18:15](#msg604fa457e562cf54acc2bc38)also `func [s] [reverse remove reverse copy s]` (recalled an old Toomas' trick ;)**

**greggirwin**

**[18:17](#msg604fa4bc823b6654d2aaa754)Let's not start an obfuscation contest...yet. :^)**

**hiiamboris**

**[18:17](#msg604fa4c7457d6b4a94c9e8ed):D**

****Tuesday 16th March, 2021****

**snotbubble**

**[04:27](#msg605033ce5d0bfb4e58b1b557)is there a way to escape parentheses from compose?**

**I need to do this while keeping `(to-integer a/2)` intact**  
**`a: [ "1" "2" "3" ] b: compose [ (to-integer a/2) + 1 ] do b`**

**toomasv**

**[05:57](#msg605048b8d2619a4f2e4b4050)@snotbubble Use `quote`:**  
**`b: compose [ (quote (to-integer a/2)) + 1 ]`**

**hiiamboris**

**[07:53](#msg605063f9d74bbe49e0f997a3)https://gitter.im/red/parse?at=604b4926d2619a4f2e3d9179**

**bubnenkoff**

**[09:31](#msg60507adad71b6554cd49e073)I want to make next structure: `list: [lots: []]`**  
**`list: [] stack: [lots] append list reduce [to-set-path stack [] ] probe list [lots: []]`**

**why follow code return none instead of block? I suspect that result is block. But how to make what I want**  
**`>> list/lots == none`**

**hiiamboris**

**[09:37](#msg60507c55e8267a46f21aa8f4)because path notation looks for `any-word!` not `any-path!`**

**[09:37](#msg60507c7644f5a454a47e4541)for the same reason why `list/1 = 'lots` is false**

**bubnenkoff**

**[09:38](#msg60507c99d71b6554cd49e5b7)&gt; because path notation looks for `any-word!` not `any-path!`**

**Could you explain. Do not understand**

**hiiamboris**

**[09:39](#msg60507ccee5f1d949d4a27ba7)you understand the difference between a word and a path?**

**[09:39](#msg60507ce4e562cf54acc52e5a)**  
**`>> 'w = to path! 'w == false >> 'w == w >> to path! 'w == w`**

**[09:40](#msg60507d22d74bbe49e0f9da8c)`list/lots` is path notation, where `lots` is a word**

**[09:41](#msg60507d33d74bbe49e0f9dad1)you're matching this word to a path**

**snotbubble**

**[09:42](#msg60507d81457d6b4a94cc6f76)@toomasv got it thanks!**

**bubnenkoff**

**[09:52](#msg60507feae5f1d949d4a284d3)**  
**`>> probe list [lots: []] == [lots: []] >> >> type? list/1 == set-path! >> >> list/1 == lots:`**

**So I have path here, but should have word, right?**  
**So here I need create set-word:**  
**`append list reduce [to-set-path stack [] ] ---------------------------^`**

**hiiamboris**

**[10:03](#msg60508288a3a2f04f1ffd686b)Yes**

**snotbubble**

**[11:44](#msg60509a2595e23446e43b8a39)is there a quick way to wrap widgets to fit within a panel ?**

**toomasv**

**[12:05](#msg60509f16d74bbe49e0fa4292)Do you mean flowing layout or what? Otherwise panel is automatically resized to enclose its faces when VID is digested by `layout`. If flowing, @hiiamboris has worked on it. My old little experiments are \[here](https://github.com/toomasv/learning/tree/master/styles).**

**hiiamboris**

**[15:02](#msg6050c87dd71b6554cd4acde8)table layout may help, depending on your needs: `panel 2 [button button field field]`**

**bubnenkoff**

**[18:45](#msg6050fcac22a5ce4a915e3553)I am doing some appending in loop. I can't figure out how to make block with copy.**  
**I need to get `value: copy []`**  
**I tried:**  
**`>> d: [] >> append d compose [values: (copy []) ] == [values:] >> append d reduce [values: copy [] ] == [[]]`**

**hiiamboris**

**[18:51](#msg6050fe48e562cf54acc6bf8a)`? compose`**

**[18:53](#msg6050fe9595e23446e43cceaa)although I fail to see why you need compose or reduce**

**bubnenkoff**

**[18:59](#msg6050fffeb5131f4f281d0037)because I am getting:**  
**`>> list: [] == [] >> >> append reduce to-path compose [list] [values: copy [] ] == [values: copy []] >> list == [values: copy []]`**  
**and I can't append to list/values because it's value not a block**

**hiiamboris**

**[19:00](#msg60510032823b6654d2aec7ae)ok**

**rebolek**

**[19:00](#msg6051003de8267a46f21c5926)wow, there's so much going on for nothing :)**

**hiiamboris**

**[19:01](#msg60510078d74bbe49e0fb8435):D**

**bubnenkoff**

**[19:02](#msg605100d4a3a2f04f1ffef884)One moment, the tiny example work:**  
**`>> append reduce to-path compose [list] [values: [] ] == [values: [] values: []] >> append list/values 'aa == [aa] >> >> list == [values: [aa] values: []]`**

**But code in real project cause some bug**

**hiiamboris**

**[19:03](#msg60510118e5f1d949d4a42b0a)you're right that you need a `copy`**

**[19:04](#msg60510122e562cf54acc6c732)but study `? compose` syntax**

**[19:04](#msg6051013ba3a2f04f1ffefa85)it certainly can do what you want ;)**

**rebolek**

**[19:04](#msg6051013fe8267a46f21c5e7f)ok, let's split the code a bit.**  
**`>> compose [list] == [list]`**  
**You don't need `compose` here. There's no `paren!` so `compose` has no job here. Just slows things down a bit.**

**bubnenkoff**

**[19:06](#msg605101b1d74bbe49e0fb8796)the real code is use next string, so compose is needed:**  
**`append reduce to-path compose [list (word-parent-name)] [values: [] ]`**

**[19:06](#msg605101d15d0bfb4e58b41fc7)And on it I am getting bug with copy:**  
**`>> list == [lots: [values: [] columns: []] lot: [values: [] columns: []] ob: [values: [] columns: []]] >> >> list/lots == [values: [] columns: []] >> >> append list/lots/values 'aaa == [aaa] >> >> list == [lots: [values: [aaa] columns: []] lot: [values: [aaa] columns: []] ob: [values: [aaa] columns: []]]`**

**rebolek**

**[19:07](#msg6051020422a5ce4a915e4724)you're copying a block in a block, so you need `copy/deep`**

**bubnenkoff**

**[19:08](#msg6051023be8267a46f21c60f2)But what correct syntax?**  
**It's seems that problem is here:**  
**`[values: [] ]`**

**rebolek**

**[19:09](#msg60510251457d6b4a94ce186f)try `copy/deep [values: []]`**

**bubnenkoff**

**[19:10](#msg60510288d71b6554cd4b8f8c)thanks! Works!**

**rebolek**

**[19:11](#msg605102ff95e23446e43cdf27)cool**

**greggirwin**

**[21:19](#msg605120e3d71b6554cd4bf223)Red can make things so easy that you think it can't be that easy. :^) But it does require some new thinking at times. One of the keys is that everything is data, just as you see it. I still fall into "code" thinking at times.**

****Wednesday 17th March, 2021****

**bubnenkoff**

**[07:19](#msg6051ad8ead83ec3d7d3518d1)I need to generate (append in loop) data-structure (string at result) that need to have round brackets at :**  
**`("aa", "bb", "cc", "aa")`**  
**Should I use block and then replace brackets type, or there is any more suitable data-type?**

**rebolek**

**[07:29](#msg6051aff52beb1e1da3b01674)Do you want commas as separator in your string?**

**bubnenkoff**

**[07:52](#msg6051b5392beb1e1da3b02629)Yes, I need them**

**rebolek**

**[08:15](#msg6051baa43b9278255bb4b9d0)Then you would need some `join`-like function. As it's not still part of Red, you need to write one yourself. Here's one example:**  
**`join: function [series delimiter][collect/into [keep first series foreach value next series [keep delimiter keep value]] copy ""]`**

**[08:16](#msg6051bac6c1e10242c5a45e22)**  
**`>> string: join ["a" "b" "c"] ", " == "a, b, c"`**

**[08:16](#msg6051bae73b9278255bb4ba6b)Adding parens is easy:**  
**`>> insert string #"(" == "a, b, c" >> append string #")" == "(a, b, c)"`**

**[08:16](#msg6051bafb3a9448256c0f2c99)of course you can extend the `join` function to add parens automatically**

**GalenIvanov**

**[08:19](#msg6051bb7aa7dfe1372edb50a8)Or**

**[08:19](#msg6051bb8133346c1627595382)**  
**`string: head insert next copy "()" string`**

**rebolek**

**[08:19](#msg6051bb9433346c16275953a6)that's very nice solution!**

**GalenIvanov**

**[08:20](#msg6051bbbbac0fd631ca721099):smile:**

**bubnenkoff**

**[08:30](#msg6051be34a7dfe1372edb593d)Big thanks!**

**toomasv**

**[11:31](#msg6051e87eef43061daa7b40b8)Without a loop it would be even simpler:**  
**`>> replace/all mold to-paren ["aa" "bb" "cc"] " " ", " == {("aa", "bb", "cc")}`**

**GalenIvanov**

**[11:33](#msg6051e8ffad83ec3d7d35c81e)@toomasv Nice! I thought of `to-paren` too.**

**rebolek**

**[11:39](#msg6051ea6b3b9278255bb5401e)@toomasv Nice, but what about different data like`["a a" "b b" "c c"]`? :-D**

**bubnenkoff**

**[11:40](#msg6051eabe33346c162759da47)&gt; @toomasv Nice, but what about different data like`["a a" "b b" "c c"]`? :-D**

**You read this question from my head))) I just wanted to ask it)**

**rebolek**

**[11:42](#msg6051eb20bc554b42d60675a3)I can come up with even simpler solution ;)**  
**`convert: func [][{("aa", "bb", "cc")}]`**

**hiiamboris**

**[11:54](#msg6051ee023b9278255bb54aed):D**

**toomasv**

**[11:58](#msg6051eecd563232374c25fd7d):) No problem:**  
**`>> replace/all mold to-paren ["a a" "b b" "c c"] {" "} {", "} == {("a a", "b b", "c c")}`**

**rebolek**

**[12:22](#msg6051f49e3a9448256c0fd58d):)**

**[12:25](#msg6051f526563232374c260f5e)**  
**`replace/all mold to-paren ["a a" "but this text will confuse your solution again, so what now?" "c c"] {" "} {", "}`**

**toomasv**

**[12:37](#msg6051f7efc1e10242c5a51aba)Keep going:**  
**`rule: [["}" | {"}] " " ["{" | {"}]] replace/all mold to-paren ["a a" "but this text will confuse your solution again, so what now?" "c c"] rule {", "} == {("a a", "but this text will confuse your solution again, so what now?", "c c")}`**

**rebolek**

**[12:37](#msg6051f8183a9448256c0fe043):D**

**toomasv**

**[12:39](#msg6051f87883533831b4e6bf40)I know, next step will break it :)**

**rebolek**

**[12:39](#msg6051f88c3b9278255bb5674c)here you go :)**  
**`>> replace/all mold to-paren ["a a" {boom, "boom", "boom"} "c c"] rule {", "} == {("a a", "boom, "boom", "boom"", "c c")}`**

**toomasv**

**[13:03](#msg6051fe3bbc554b42d606b163)Giving way but still struggling desperately: :cold\_sweat:**  
**`rule: [collect any [s: skip keep (mold s/1) [end | keep (", ")]]] head insert next "()" rejoin parse ["a a" {boom, "boom", "boom"} "c c"] rule == {("a a", {boom, "boom", "boom"}, "c c")}`**

**rebolek**

**[13:22](#msg605202843b9278255bb583e0)hm, collect, keep, where I've seen this before... ;-)**

**bubnenkoff**

**[13:27](#msg605203af563232374c263d13)&gt; here you go :)**  
**&gt;**  
**`> >> replace/all mold to-paren ["a a" {boom, "boom", "boom"} "c c"] rule {", "} > == {("a a", "boom, "boom", "boom"", "c c")} >`**

**Does it work for you??**

**`>> replace/all mold to-paren ["a a" {boom, "boom", "boom"} "c c"] rule {", "} *** Script Error: rule has no value *** Where: replace *** Stack: replace`**

**rebolek**

**[13:28](#msg605203e0bc554b42d606c3e9)you need to use `rule` defined above**

**toomasv**

**[13:36](#msg605205ef563232374c26443f)&gt; hm, collect, keep, where I've seen this before... ;-)**

**I haven't slightest idea :no\_mouth:**

**gltewalt**

**[16:10](#msg605229ff28e6153d7225d933)&gt; And the winner is...**  
**&gt;**  
**`> tv-all-but-last: func [series][head clear back tail copy series] > gi-all-but-last: function[series][new-s: copy series take/last new-s new-s] > bm-all-but-last: func [s] [copy/part back tail s -99999999] > gt-all-but-last: func[series][parse series[copy s to[skip end]]s] > > tv: [tv-all-but-last blk-1 tv-all-but-last blk-2] > gi: [gi-all-but-last blk-1 gi-all-but-last blk-2] > bm: [bm-all-but-last blk-1 bm-all-but-last blk-2] > gt: [gt-all-but-last blk-1 gt-all-but-last blk-2] > > blk-1: [1 2 3 4 5 6 7 8 9 10] > blk-2: head insert/dup copy [] 0 1'000 > profile/count/show [tv gi bm gt] 1'000 > >`**

**`init: func [blk][reverse next reverse copy blk]`**

**greggirwin**

**[17:51](#msg6052418828e6153d72262a18)@gltewalt that's a spin on one @hiiamboris posted, but it has a problem.**  
**`>> res: init [1 2 3 4 5] == [1 2 3 4] >> head res == [5 1 2 3 4]`**

**gltewalt**

**[18:24](#msg60524941ac0fd631ca73c319)Foiled again**

**[18:27](#msg60524a27bc554b42d607a434)Brings up a side question though - why is reverse destructive?**

**hiiamboris**

**[18:29](#msg60524a88ef43061daa7c8369)Because it can have uses for in-place reversal?**

**gltewalt**

**[18:33](#msg60524b75f07ffa1eb549cf4a)There are uses for most anything, but isnt non destructive generally better?**

**hiiamboris**

**[18:34](#msg60524bc99ebdfd16407e2da3)No. If you don't have destructive, you can't make it. If you have it - you can turn it into non-destructive with `copy`.**

**gltewalt:matrix.org**

**[18:36](#msg60524c283a9448256c10ef02)What do you mean you can't make it?, it could return a copy modified**

**hiiamboris**

**[18:36](#msg60524c3fad83ec3d7d370448)But not the original modified in place.**

**[18:37](#msg60524c6f9ebdfd16407e2f86)OK. Redefine `remove` to `remove: func [s] [copy next s]` and try to work with it.**

**gltewalt:matrix.org**

**[18:38](#msg60524cbd3b9278255bb67130)Isn't there a whole paradigm against modifying in place?**

**hiiamboris**

**[18:39](#msg60524ce13b9278255bb671a8)In \*compiled* langs like Haskell.**

**[18:40](#msg60524d382beb1e1da3b2081c)Basically you're telling the language to do crazy stuff that will blow your PC. But compiler refuses, and.. your code works. We don't have such luxury as Red is a data format.**

**gltewalt:matrix.org**

**[18:43](#msg60524db8bc554b42d607addb)I like blowing up PC.**

**greggirwin**

**[20:28](#msg605266853b9278255bb6c991)@gltewalt:matrix.org as @hiiamboris noted, if you have mutability, you can build immutability on top of it, but not the other way around. With Red you have choices; you are in control. While you'll see me push back against optimizations (that I feel aren't necessary or important in a particular case), having these options means we can `copy` even when not needed, to be safe from mutations, then remove them as @giesse noted. From there you can look at things like `/into` or using `clear` instead of `copy` for local series in func that may benefit. Preallocating a series can make a \*huge* difference. I don't know what other langs let you do that if they're based on immutability.**

**There's a reason we don't have one true language for building software. Different mechanisms are useful in different contexts.**

**Rebol2Red**

**[23:45](#msg605294a1bc554b42d60884b1)I have this block:**  
**`block: ["comedy" "romance" "romantic comedy"]`**  
**I want to get this string**  
**`res: {Comedy - Romance - Romantic comedy}`**  
**I came up with this:**  
**`res: copy "" block: ["comedy" "romance" "romantic comedy"] repeat i length? block [ either i <> length? block [ append res rejoin [uppercase/part block/(i) 1 { - }] ][ append res rejoin [uppercase/part block/(i) 1] ] ] probe res`**  
**How would you do this?**

****Thursday 18th March, 2021****

**greggirwin**

**[00:07](#msg605299c13b9278255bb75f87)Here's one way. Once you have `map-each` it's useful other places.**  
**`map-each: function [ "Evaluates body for each value(s) in a series, returning all results." 'word [word! block!] "Word, or words, to set on each iteration" data [series! map!] body [block!] ] [ collect [ foreach :word data [ if not unset? set/any 'tmp do body [keep/only :tmp] ] ] ] block: ["comedy" "romance" "romantic comedy"] block: map-each str block [uppercase/part str 1] res: first block collect/into [ foreach val next block [ keep " - " keep val ] ] res`**  
**Now you can wrap this into a func that takes your series, a modifying func (the `uppercase` part), and a delimiter, and you have a generic modifier+combiner.**

**Rebol2Red**

**[00:10](#msg60529a7fc1e10242c5a72e7b)@greggirwin Nice, Thanks**

**greggirwin**

**[00:11](#msg60529a9c88edaa1eb8c2f153)I have an old `delimit` func for R2 that did one step, so then you could `rejoin` or `reform` your block easily. But it used `forskip` which we don't have in Red. `Forskip` was handy, but not heavily used, so we have to decide if it's worth including in Red.**

**[00:13](#msg60529b1a9ebdfd16407f1807)There are some tweaks you could make to your original too, making it more idiomatically Red. e.g.**  
**`res: copy "" block: ["comedy" "romance" "romantic comedy"] repeat i length? block [ append res rejoin either i <> length? block [ [uppercase/part block/(i) 1 { - }] ][ [uppercase/part block/(i) 1] ] ] probe res`**

**[00:14](#msg60529b483b9278255bb7627c)Then I'd look at how `uppercase/part block/(i)` is repeated, and try to eliminate that duplication.**

**[00:16](#msg60529be4c1e10242c5a7323f)**  
**`res: copy "" block: ["comedy" "romance" "romantic comedy"] repeat i length? block [ append res uppercase/part block/(i) 1 if i < length? block [append res { - }] ] probe res`**  
**But you're trading now for two `append res` calls. It eliminates `rejoin` though, which is a win because now you're not allocating a block and throwing it away every time.**

**[00:19](#msg60529c7988edaa1eb8c2f67e)So then I'd see that it's doing the `res: ... append res` dance and see if `collect` is a good fit.**  
**`block: ["comedy" "romance" "romantic comedy"] res: collect/into [ repeat i length? block [ keep uppercase/part block/(i) 1 if i < length? block [keep { - }] ] ] copy "" probe res`**  
**Now `append res` is just `keep` so not as bad when used more than once.**

**[00:23](#msg60529d82a7dfe1372ede19a8)Now you can compare the different versions and see which you like. There's nothing wrong with your original. Straightforward and obvious code is a good thing, and if you don't need to optimize it, great. Think about what will be clearest to a future reader, and easy to maintain or repurpose.**

**Rebol2Red**

**[01:02](#msg6052a6a73b9278255bb77caa)@greggirwin Thank you for the explanation!**

**toomasv**

**[05:20](#msg6052e318ad83ec3d7d38a5f8)Or with parse:**  
**`rejoin parse block [collect some [set s skip keep (change s uppercase s/1 s) [end | keep (" - ")]]] == "Comedy - Romance - Romantic comedy"`**

**Rebol2Red**

**[10:02](#msg6053253028e6153d72289629) Nice. As always. Thanks. One question though. How would i call a function with does this? I thought of Block-to-Separatedstring (Gregg) and Block-to-Separatedstring-Parsed (Toomas) but do not like this. I find this naming often the most difficult task of coding.**

**[10:37](#msg60532d7ba7dfe1372edf896e)Finding this on the internet: "it's a best practice to actually tell what the function is doing by giving the function name a verb as prefix." I agree this is best practice. So the naming should start with seperate... or ...?**  
**Btw Now i have to name about 300 functionnames in my function library...**  
**Which i'm not going to do. Maybe some.**

**rebolek**

**[10:54](#msg6053316b28e6153d7228b6b6)I call such a function `join`. It's different than `join` in Rebol, but that one wasn't very useful.**

**toomasv**

**[10:57](#msg605332219ebdfd164080a6c2)@Rebol2Red This func alone would be too specific IMO. This is kind of join as @rebolek said. May be something like**  
**`altjoin: function [block delim /alter fn][ rejoin parse block [collect some [set s skip keep (if :fn [s: fn s] s) [end | keep (delim)]]] ] altjoin/alter ["comedy" "romance" "romantic comedy"] " - " :uppercase ;== "COMEDY - ROMANCE - ROMANTIC COMEDY" altjoin/alter ["comedy" "romance" "romantic comedy"] " - " func [s][change s uppercase s/1 s] ;== "Comedy - Romance - Romantic comedy" altjoin/alter [<comedy> "romance" %romantic-comedy] " - " func [s [any-string!]][change s uppercase first s s] ;== <Comedy - Romance - Romantic-comedy>`**

**Rebol2Red**

**[11:16](#msg60533678f07ffa1eb54c55e6)@toomasv I suppose altjoin stands for alternative join not for alter join. Added this function to my function library. Thank you very much!**

**toomasv**

**[11:35](#msg60533b1183533831b4ea713e):+1:**

**bubnenkoff**

**[15:08](#msg60536cfeac0fd631ca770110)How to correctly check type inside `if`**  
**`>> a: "text" == "text" >> >> if (type? a = block!) [print "a is block"] a is block`**  
**it seems that it work so because content of `()` are evaluated to true not depend of it's type**

**hiiamboris**

**[15:10](#msg60536d7fef43061daa7fa8e2)What do you think is evaluated first, `type?` or `=`?**

**[15:11](#msg60536d9d3a9448256c14223c)Also, type `? "?"` in console.**

**bubnenkoff**

**[15:22](#msg6053702b2beb1e1da3b53953)&gt; What do you think is evaluated first, `type?` or `=`?**

**You are right!**

**Rebol2Red**

**[16:21](#msg60537e1f88edaa1eb8c566d8)Do we have to use wait after writing a big file and before opening and reading it in the same program?**  
**Maybe not, but I think the OS needs time to write to a file so this probably could lead to errors. Please correct me if I'm wrong!**

**Respectech**

**[16:29](#msg60537fe983533831b4eb5248)1: `res: copy block/1 foreach item next block [append res rejoin [" - " item]]`**

**[16:32](#msg605380a088edaa1eb8c56f80)2: `copy/part mark: skip replace/all mold block {" "} { - } 2 skip tail mark -2`**

**[16:34](#msg605381323a9448256c1463eb)3: `form load replace/all mold block {" "} { - }`**

**[16:36](#msg605381a7c1e10242c5a9bbca)^^^ I think this is the smallest that I can get it, although it may not be suitable for all cases.**

**Rebol2Red**

**[16:38](#msg605381fc88edaa1eb8c572f0)@Respectech A oneliner. Nice, well done!**

**Respectech**

**[16:38](#msg60538223ad83ec3d7d3a8266)Thanks! Technically, three one liners. ;-p**

**Rebol2Red**

**[16:39](#msg605382519ebdfd164081ab35)Sorry you are right. I was fixed on the shortest and latest version :)**

**Respectech**

**[16:46](#msg605383fbac0fd631ca774a49)No worries. I like the challenge.**

**dsunanda**

**[16:49](#msg6053849ac1e10242c5a9c7a1)@bubnenkoff There is a shorter way to check a word's type:**  
**`if block? a [print "a is block"]`**

**Rebol2Red**

**[16:57](#msg6053868833346c16275e9f43)Like a challenge which I can't solve? How about writing dynamic loops to use for permutations.**  
**`;----------------------------------------------------------------------- ; PERMUTATIONS (No duplicates per group. The groups are 1234 1234 1234) ;----------------------------------------------------------------------- permutationsblock: copy [] permutations: 0 repeat a 4 [ repeat b 4 [if (a = b) [continue] repeat c 4 [if (c = b) or (c = a) [continue] repeat d 4 [if (d = c) or (d = b) or (d = a) [continue] repeat e 4 [ repeat f 4 [if (f = e) [continue] repeat g 4 [if (g = f) or (g = e) [continue] repeat h 4 [if (h = g) or (h = f) or (h = e) [continue] repeat i 4 [ repeat j 4 [if (j = i) [continue] repeat k 4 [if (k = j) or (k = i) [continue] repeat l 4 [if (l = k) or (l = j) or (l = i) [continue] rec: copy "" append rec reduce [a b c d e f g h i j k l] append/only permutationsblock rec ;probe permutationsblock ; DO NOT USE THIS! BECAUSE OF PRINTING THIS LASTS FOREVER! permutations: permutations + 1 ]]]] ]]]] ]]]] ;----------------------------------------------------------------------- ; print ["Permutations - no repetitions:" permutations] ;----------------------------------------------------------------------- write/lines %permutations-no-repetitions-4x3.txt permutationsblock ;----------------------------------------------------------------------- ; wait 3 ; is this needed? (because i think that a slower systems needs time to write a file ;----------------------------------------------------------------------- call "start notepad permutations-no-repetitions-4x3.txt"`**  
**I need dynamic loops or optimisation.**  
**Note: The number of permutations is: 13824**

**[17:11](#msg605389bf563232374c2aba86)Update: I need dynamic loops and/or optimisation.**  
**`The number of permutations is: (4*3*2*1) * (4*3*2*1) * (4*3*2*1) = 13824`**

**hiiamboris**

**[17:21](#msg60538c0ff07ffa1eb54d6fc7)that's one funny permutation func :D**

**Rebol2Red**

**[17:23](#msg60538c74ef43061daa801410)Do you have a better one? :P**  
**Watch carefully I need permutations without repetitions per group.**  
**Run the program and see the permutations.**

**hiiamboris**

**[17:24](#msg60538cdea7dfe1372ee0bd13)I recently posted 2 on https://gitter.im/red/red ;)**

**Rebol2Red**

**[17:26](#msg60538d5da7dfe1372ee0be7b)@hiiamboris Huh, Then I must have missed that. I can't see them when using your link.**

**hiiamboris**

**[17:27](#msg60538d642beb1e1da3b59cc1)By the way, you don't need `wait`. OS does everything for you.**

**Rebol2Red**

**[17:27](#msg60538d9528e6153d7229ecd3)@hiiamboris Just what I needed to hear. Thanks**

**hiiamboris**

**[17:28](#msg60538da8f07ffa1eb54d7524)Scroll up there. There was a permutation challenge just 1-2 days ago. You missed it?**

**Rebol2Red**

**[17:29](#msg60538ddf2beb1e1da3b59e80)No i haven't but this is not what i need. Permutations without repetitions per group.**

**hiiamboris**

**[17:29](#msg60538e013a9448256c148ba1)That's exactly what our versions were doing.**

**[17:33](#msg60538ee428e6153d7229f1d3)You'll have to make a permutation of 1 group. That's 24 strings. Then compute a \[cartesian product](https://en.wikipedia.org/wiki/Cartesian\_product) for 3 groups (Gregg has a mezz, but it's easy to write yourself) - thats 24\*\*3 strings.**

**Rebol2Red**

**[17:40](#msg605390aa563232374c2ad49a)I get it up to the point of compute the cartesian product. How? Can you point me to the right direction or tell me where can i find the mezz of Gregg?**

**hiiamboris**

**[17:47](#msg60539219ef43061daa8024fe)Does the image on wikipedia make sense to you?**

**[17:48](#msg60539268ac0fd631ca7778a3)In your case A = B = list of 24 permutations. You compute A x A x A = (A x A) x A, i.e.:**  
**`product A product A A`, just instead of making 2-tuples `(A,1)` you concat values into a string ;)**

**Rebol2Red**

**[17:50](#msg605392e1ef43061daa802725)It makes sense but that does not mean i can program it :P**

**hiiamboris**

**[17:50](#msg605392f03a9448256c149c33):D**

**[17:51](#msg605393139ebdfd164081e632)All the more reason for you to try! ;)**

**Rebol2Red**

**[18:22](#msg60539a4b2beb1e1da3b5c5da)@hiiamboris I am not a student so i do'nt ask you to do my homework. I am 61. I just need you to feed me code. I'm hungry :P**

**hiiamboris**

**[18:30](#msg60539c3533346c16275ee889)I'm feeding you a little puzzle instead. Brain needs games to keep itself intact ;)**

**rseger**

**[18:49](#msg6053a0b4a7dfe1372ee0fc95)apologies for the newbie question but I can't seem to hunt this down myself. I want to initialize a key in a map if it doesn't exist. As an example, in python that could look something like `if key not in my-map: my-map[key] = []`**

**I've tried a lot of variations of `if not select my-map key [ extend my-map [key []]]` but I can not seem to get the code to evaluate `key`. Instead the map ends up with a key that is literally `key` (I believe as a symbol?).**

**I can't imagine this is complicated but I.. yeah. Help, please?**

**hiiamboris**

**[18:53](#msg6053a1b62beb1e1da3b5dfc9)`not select` isn't the way: `not find` is:**  
**`>> m: #(key #[none]) == #( key: none ) >> not select m 'key == true >> not find m 'key == false`**

**[18:54](#msg6053a1e0ac0fd631ca77adaa)`my-map/:key: []` is your assignment**

**[18:55](#msg6053a20cf07ffa1eb54db360)or `my-map/(key): []`**

**[18:55](#msg6053a2223b9278255bba5be8)or `put my-map key []`**

**rseger**

**[18:57](#msg6053a2a3f07ffa1eb54db4fe)all of those appear to work in isolation but I can't seem to get them to work in the middle of that if block**

**hiiamboris**

**[18:59](#msg6053a2f533346c16275efc94);)**

**[18:59](#msg6053a31783533831b4ebc220)don't give up so easily, use `probe` to check intermediate results**

**Rebol2Red**

**[19:01](#msg6053a37933346c16275efe5b)**  
**`ith-perm: function [a i] [ also a: copy a forall a [ swap a skip a i // n: length? a i: to 1 i / n ] ] fac: function [n][m: #(0 1) any [m/:n m/:n: n * fac n - 1]] all-perms: function [a] [ also r: make [] n: fac length? a repeat i n [append/only r ith-perm a i - 1] ] a: all-perms [1 2 3 4] b: all-perms [1 2 3 4] c: all-perms [1 2 3 4] permutations: 0 res: copy [] forall c [ forall b [ forall a [ append/only res rejoin [to-string c/1 to-string b/1 to-string a/1] permutations: permutations + 1 ] ] ] print ["Permutations:" permutations] repeat i permutations [ print res/(i) do-events/no-wait ]`**

**hiiamboris**

**[19:02](#msg6053a3af83533831b4ebc404):clap:**

**[19:02](#msg6053a3baad83ec3d7d3aeef4)`rejoin [c/1 b/1 a/1]` should be enough though (or maybe `rejoin ["" c/1 b/1 a/1]`?)**

**rseger**

**[19:02](#msg6053a3c79ebdfd164082166e)**  
**`record: function [mbytes exts] [ print ["magic-bytes" mbytes length? mbytes] print ["extensions" exts length? exts] foreach ext exts [ print ext if not find extensions-map ext [ extend extensions-map [ext []]] foreach mbyte mbytes [ print mbyte print extensions-map append select extensions-map ext mbyte ] ] ]`**  
**(hopefully that's formatted correctly)**  
**I'm trying to parse the wikipedia page for extensions, just to learn parse. mbytes and exts are both simple arrays. The error I'm getting is**  
**`*** Script Error: append does not allow none! for its series argument *** Where: append *** Stack: record`**  
**and the extensions-map ends up with a key of `ext`. I tried replacing extend with some of those ideas, and pulled out `select` but. I'm messing something up**

**[19:02](#msg6053a3dd28e6153d722a387b)ugh. That's horrible formatting**

**[19:03](#msg6053a40033346c16275f008f)guess I need help with two things :/**

**hiiamboris**

**[19:03](#msg6053a40b2beb1e1da3b5e7c0)formatting: use 3 backticks**

**rseger**

**[19:03](#msg6053a418563232374c2b1338)they need to be on separate lines I take it?**

**hiiamboris**

**[19:03](#msg6053a41cad83ec3d7d3af01c)yep**

**[19:04](#msg6053a43788edaa1eb8c5e0de)that does it!**

**rseger**

**[19:04](#msg6053a438bc554b42d60b9735)hey look at that - one problem down!**

**hiiamboris**

**[19:05](#msg6053a48188edaa1eb8c5e17c)like I told you above, extend is not what you need here, but any of the 3 proposed variants**

**[19:06](#msg6053a49fac0fd631ca77b731)otherwise it's expected that `select` returns none when it does not find the key**

**rseger**

**[19:07](#msg6053a4f1563232374c2b1624)sweet! The put worked (I apologize I hadn't tried that one)**

**[19:08](#msg6053a52328e6153d722a3d97)so I can better understand the mechanics, why does the ext variable not get evaluated when you use `extend`?**

**Rebol2Red**

**[19:09](#msg6053a55e33346c16275f062e)@hiiamboris But it would be nice to have dynamical loops depending on the \*number* of the groups. That's the reason why i want to see greggs cartesion product mezz.**

**hiiamboris**

**[19:09](#msg6053a587ad83ec3d7d3af537)@rseger as a general rule: functions that expect \*code* - evaluate it, functions that expect \*data* - do not (and you can use `extend reduce [..]` to evaluate it manually but in your case it's an overkill)**

**rseger**

**[19:10](#msg6053a5a2ef43061daa806568)my clear doesn't seem to be working from inside parse either but I haven't played with that one yet. Lots to learn!**

**[19:10](#msg6053a5a59ebdfd1640821ca2)and thank you!**

**hiiamboris**

**[19:10](#msg6053a5b2ac0fd631ca77bc6e)@Rebol2Red you're about to use recursion then! ;)**

**[19:11](#msg6053a5d03b9278255bba696c)@rseger you're welcome**

**greggirwin**

**[19:55](#msg6053b024ad83ec3d7d3b18bc)@Rebol2Red I called my old func for "block to delimited string" `make-dlm-str`. Not very creative.**

**Thanks for the permutation code. Always fun to see different approaches.**

**Do tinker a bit on cartesian product, but if you need it:**

**`recombine: cartesian-product: function [ "Returns the cartesian product of all sub-block combinations" blocks [block!] "Block of sub-blocks whose values you want to combine" /into "Collect into output accumulator" start [block!] "Output accumulator" /only "Keep block types as single values" ][ if not parse blocks [any block!][print "Not a spec block" halt] if none? start [start: copy []] collect [ either tail? blocks [keep/only start] [ foreach val first blocks [ either only [ keep recombine/into/only next blocks append/only copy start val ][ keep recombine/into next blocks append copy start val ] ] ] ] ]`**

**[20:12](#msg6053b4483a9448256c150443)Welcome @rseger! You may want to check out \[map! docs](https://w.red-lang.org/en/datatypes/map/#abstract) as there are a number of details that may be important to you.**

**[20:18](#msg6053b5a23a9448256c150923)You'll find a number of things in Red that may stall your brain for a bit. That's natural. :^) For example, you have a lot more control over evaluation, which is a key element. Where other langs evaluate everything because it's code, in Red everything is data until it's evaluated. That lets you pass things around, bulid up structures for later evaluation, etc., but also leads to things like \[this](https://github.com/red/red/wiki/%5BDOC%5D-Why-you-have-to-copy-series-values). It can be an adjustment, but if Red clicks for you, you'll find that it all feels very natural after a short time.**

**[20:19](#msg6053b5eef07ffa1eb54def87)The most important thing, which you already seem to be doing, is to play. Use the console (REPL) and explore. Try things and post here when something is confusing.**

**Rebol2Red**

**[20:21](#msg6053b6669ebdfd164082542e)Does anyone know or have read about CSP (Constrained Satisfaction Problem)?**

**https://opensource.com/article/19/9/constraint-programming-example**

**After reading this:**

**"Thus, any change in the value of one variable affects the whole system (i.e., all other variables), and to satisfy defined constraints, it leads to recomputing the other values."**

**I wonder if the Pythagoras' theorem: a² + b² = c² as mentioned in the link above can be done with a reactor?**  
**And has someone functions to do CSP?**  
**I have done a program with CSP but it is only usable in that program.**

**To read more about CSP:**  
**https://en.wikipedia.org/wiki/Constraint\_satisfaction\_problem**

**greggirwin**

**[20:56](#msg6053be6028e6153d722a8dd9)It's a cool domain, at a glance. I haven't seen it done in Redbol. I did some old financial funcs, ported to learn Rebol from texts, that did bracketing, but it's not the same.**

**toomasv**

**[21:03](#msg6053c008563232374c2b6a2d)@Rebol2Red My early dabbling in constraint programming: \[cryptarithm](https://gist.github.com/toomasv/c63e49e26d2cfb6032db9d0428029e3d)**  
**At least some examples there seem to still work.**

**Rebol2Red**

**[21:03](#msg6053c02ff07ffa1eb54e0ee5)I have translated the CSP for Pythagoras' theorem to Red from that link (could be done better i know) but it is specific. I want functions to make it usable for more CSP problems like mentioned over here: https://web.stanford.edu/class/cs227/Lectures/lec14.pdf**  
**`pythagoras: function [ "Computes a side of a right triangle" a b c ; variables with each has a domain ][ ; Validate (counts how many none's there are) x: 0 if (a = none) [x: x + 1] if (b = none) [x: x + 1] if (c = none) [x: x + 1] either 1 <> x [ "ERROR: you need to define any of two non-negative variables" ][ ; Compute case [ a = none [ square-root ((c ** 2) - (b ** 2)) ; DOMAIN OF A ] b = none [ square-root ((c ** 2) - (a ** 2)) ; DOMAIN OF B ] c = none [ square-root ((a ** 2) + (b ** 2)) ; DOMAIN OF C ] ] ] ] print pythagoras 3 none none ; ERROR print pythagoras none none none ; ERROR print pythagoras none none 5 ; ERROR print pythagoras none 4 none ; ERROR print pythagoras 3 4 none ; 5.0 print pythagoras none 4 5 ; 3.0 print pythagoras 3 none 5 ; 4.0`**  
**Maybe it is clearer now what I meant by "could this be done with a reactor"**

**[21:18](#msg6053c3a833346c16275f6437)@toomasv Nice! But can this program do other CSP problems ex. color-mapping https://www.cs.colostate.edu/~cs440/fall14/slides/09\_csp.pdf with a minimum of adjustments? Maybe you can answer this question right away?**

**rseger**

**[21:34](#msg6053c759f07ffa1eb54e237d)thank you @greggirwin! I'm a polyglot in search of a home. The data &lt;-&gt; code interchange is something I value a great deal. I was looking for something like `,` from lisp when I should have been focused on what the specific functions were expecting and actually doing with their operands. Subtle differences but obviously important! Thus far I'm enjoying Red, though I'm pretty sure parse and I are destined for a love hate relationship.**

**hiiamboris**

**[21:36](#msg6053c7e128e6153d722aad19)The Red pill is addictive. There is no turning back ;)**

**greggirwin**

**[21:51](#msg6053cb5a3b9278255bbae2b7)Once you go `parse` you never go back. :^)**

**[21:51](#msg6053cb6eef43061daa80d9cb)...er `backtrack`.**

**[21:53](#msg6053cbf433346c16275f7ff1)With Red, the paradigm takes a backseat. The One True Way is to see that there is no One True Way.**

**gltewalt:matrix.org**

**[22:29](#msg6053d43fef43061daa80f3fb)The true way, I can't keep in my head most of the time. Language and Data Format - or programmable data format**

**gltewalt**

**[22:33](#msg6053d55528e6153d722ad996)blocks with compose - similar to lisp defmacro, from what i remember of defmacro**

**[22:41](#msg6053d713ac0fd631ca785135)But inverted.**

**Rebol2Red**

**[22:52](#msg6053d9a1f07ffa1eb54e5d2c)@toomasv I know you love ai so have a look at:**

**Solving the General Two Water Jugs Problem via an Algorithmic Approach**  
**http://www.iaeng.org/publication/IMECS2015/IMECS2015\_pp138-140.pdf**

**I have programmed the two algorithms already so have a look at it:**  
**https://gist.github.com/Rebol2Red/feeda6a715d4ffd623b5bafbd6519c81**

**The problem is that I don't know how to show the pouring sets**  
**Maybe you can run my gist and comment on it?**

**I will really appreciate it. btw. Take your time on this, no hurry needed.**  
**And if somebody else is interrested in this too - do not hesitate to comment on my gist.**  
**Thank you**

**hiiamboris**

**[22:58](#msg6053db0d2beb1e1da3b698cc)man you \*love* long verbose functions :D**

**[22:58](#msg6053db29ac0fd631ca785cd4)like this one**  
**`solvable: func [ mx my ][ either ((gcd mx my) = 1) [ return true ][ return false ] ]`**

**Rebol2Red**

**[23:03](#msg6053dc5d3a9448256c158375)Ah well, I programmed this a long time ago just after leaving freebasic.**  
**If you mean I divide it into a lot of lines is because it's clear and readable after a long time. It's mostly for my personal use. Not to show to others and yes I like it :P**

**Respectech**

**[23:06](#msg6053dceaac0fd631ca786258)**  
**`solvable: func [mx my][1 = gcd mx my]`**  
**Does the same thing. :-)**

**Rebol2Red**

**[23:07](#msg6053dd3cac0fd631ca7862fa)Yep, but a bit cryptic. I like code which is directly understandable. Sometimes I see code which only the writer understands. What's so great about that?**

**greggirwin**

**[23:10](#msg6053ddf533346c16275fb56f)The great thing about Red is that we \*can* do things how they make sense to us. If you're writing for people coming from many imperative languages @Rebol2Red's version would make them very comfortable, and give them a feel for Red syntax at the same time.**

**Respectech**

**[23:11](#msg6053de292beb1e1da3b6a17a)I admit, I get lost looking at my code sometimes...**

**[23:12](#msg6053de613b9278255bbb1ba0)Carl used to say that code should be self-documenting. I'm still stuck on saving keystrokes / bytes.**

**Rebol2Red**

**[23:17](#msg6053dfa7ac0fd631ca786aed)@greggirwin You have a point. The Red way can or will never come in time but Red can do things which makes sense to the programmer. That's one of the strong points of it. If this was not the case I would stick with freebasic which is sometimes &gt;1000x faster than Red (It is almost as fast as c when compiled)**  
**I can program anything I can imagine in Red (if I have the time and knowledge).**

**[23:32](#msg6053e2f2a7dfe1372ee1c823)@greggirwin Another great point is that when you have programmed 100 lines of code the day after thinking about the code you change a bit and can delete 10 lines. The day after that you change a bit and you can delete 10 lines and so on... After a while you only have 5 lines which does the same as 100!!!**  
**I wonder if Red programmers has experienced the same?**

**Respectech**

**[23:37](#msg6053e42f28e6153d722b0948)@Rebol2Red All the time. My code often starts large and usually becomes distilled and condensed. The biggest challenge over time is error handling.**

****Friday 19th March, 2021****

**Rebol2Red**

**[00:10](#msg6053ebedc1e10242c5ab04fd)@Respectech Yep that's a problem. But coding in Red is still a lot of fun for me after many years :) Take a look at http://rensvanschie.atwebpages.com/filmsoptv.html**  
**Programmed entirely with the help of Red. Hopefully it will not attract too many people because the data comes from a site with a lot of ads https://www.filmtotaal.nl/films-op-tv and other subpages. I do'nt know if it is legal to parse data from a site and use it on my site. But hey it's in dutch and the programs are on dutch television.**  
**Ps chrome will tell the site is not safe because of the http. I can assure you there is nothing wrong with my site. I only don't want to pay for a certificate.**

**Just a few notes:**  
**The frames are shown right on a tablet maybe not on your pc.**  
**The color Red is to emphasize romantic movies (wife) and blue for scifi (me)**  
**The only downside is that I have to run my program at least after 7 days. It is not possible to do this automatically because of various reasons which is too long to explain over here. Happy coding.**

**greggirwin**

**[04:45](#msg60542c6f9ebdfd1640839c9b)@Rebol2Red we absolutely experience the reduction over time, which sometimes lead to being away from the condensed version long enough that you wonder how you got there. I have definitely had smart days in the past, and wonder if my brain has melted since then.**

**toomasv**

**[05:13](#msg60543302bc554b42d60d2c9b) @Rebol2Red :point\_up: \[March 18, 2021 11:18 PM](https://gitter.im/red/help?at=6053c3a833346c16275f6437) I don't think this can be easily adapted for different kind of tasks. And unfortunately I can't delve now into this.**

**Thanks for the links! Bookmarked and will look soon.**

**snotbubble**

**[12:49](#msg60549de3ad83ec3d7d3dc007)is there a way to emulate `dirty-file` without having to split &amp; reconstruct an absolute path?**  
**have two-step process, want one:**  
**`absfile: %/home/user/path/to/this/script/test.txt sp: split-path absfile relativefile: to-file rejoin [ "./" sp/2 ]`**

**hiiamboris**

**[13:06](#msg6054a1ed88edaa1eb8c8ad2a)you could replace the `t` in `script` to `.` and move the index there**

**planetsizecpu**

**[16:52](#msg6054d6b8ad83ec3d7d3e7988)Welcome @rseger hope you enjoy Red as us!**

****Saturday 20th March, 2021****

**Rebol2Red**

**[11:26](#msg6055dbf833346c1627652808)Dynamic-nested-loops to find combinations**

**According to https://stackoverflow.com/questions/9347503/dynamic-nested-loop the following code in Python works.**  
**I don't know enough of Python to translate this from Python to Red. Maybe someone with knowledge of Python and Red can help me with this?**

**What means 'tt=\[]' in the function definition?**  
**'tt.append(sol\[:])" is equal to 'append/only tt sol' ?**  
**'del sol\[-1]' is equal to 'take/last sol' ?**

**Is this recursion possible in Red?**  
**`def findcombinations(array,n,sol,tt=[]): if (n== 0): tt.append(sol[:]) return for x in array: sol.append(x) findcombinations(array,n-1,sol,tt) del sol[-1] ; remove last item of a list? return tt To call the function use print(findcombinations([1,2],3,[]))`**  
**The output is \[\[1, 1, 1], \[1, 1, 2], \[1, 2, 1], \[1, 2, 2], \[2, 1, 1], \[2, 1, 2], \[2, 2, 1], \[2, 2, 2]]**

**toomasv**

**[13:54](#msg6055feaf563232374c31a1db)@Rebol2Red I think this does the thing:**  
**`findcombinations: function [array n sol /with tt][ tt: any [tt []] either n = 0 [ append/only tt copy sol ][ foreach x array [ append sol x findcombinations/with array n - 1 sol tt clear back tail sol ] tt ] ] findcombinations [1 2] 3 [] ;== [[1 1 1] [1 1 2] [1 2 1] [1 2 2] [2 1 1] [2 1 2] [2 2 1] [2 2 2]]`**

**hiiamboris**

**[13:57](#msg6055ff483a9448256c1b3d3d)`tt=[]` is the default value when `tt` is not explicitly provided**

**Rebol2Red**

**[14:03](#msg605600c9ef43061daa86df91)@toomasv Study material :)**  
**@hiiamboris Aha. Is this valid?**  
**`findcombinations: func [array n sol] [ .... ] tt: copy [] findcombinations [1 2] 3 []`**

**hiiamboris**

**[14:06](#msg60560160c1e10242c5b0b7dd)`[:]` is `copy` (slice with both start and end undefined) but I can't say at a glance why copying, if they're appending anyway**

**toomasv**

**[14:07](#msg6056018e563232374c31a817)Correction ^ `tt: any [tt copy []]`**  
**Otherwise will grow on subsequent calls.**

**Rebol2Red**

**[14:15](#msg60560372f07ffa1eb5544030)Just translated c++ source for generating Dynamically Nested Loops**  
**Only translated, so not very 'Reddish' but it seems to work fine.**

**https://www.codeproject.com/Tips/759707/Generating-dynamically-nested-loops**  
**Nice article by the way**  
**`maxrows: 3 maxvalues: 3 display: ["1" "2" "3" "4" "5" "6" "7" "8" "9"] arrs: copy [] status: false repeat r maxrows [append arrs [1]] while [not status] [ total: 0 repeat r maxrows [total: total + arrs/(r)] if (total = (maxvalues * maxrows)) [status: true] repeat r maxrows[prin arrs/(r)] print [] ; printing change: true r: maxrows while [change and (r >= 1)] [ arrs/(r): arrs/(r) + 1 either (arrs/(r) > maxvalues ) [arrs/(r): 1 change: true][change: false] ; We can perform any inner loop calculation here arrs[r] r: r - 1 ] ]`**  
**While looking at the code above I get a few rounded grey rectangles under some of the text!? Is it only on this pc?**

**hiiamboris**

**[14:24](#msg605605aead83ec3d7d418e15)nasty trick**

**Rebol2Red**

**[14:26](#msg6056062033346c16276588b8)@hiiamboris Huh... Explain please.**

**hiiamboris**

**[14:28](#msg6056068cc1e10242c5b0c2ac)I mean that approach to reimplement recursion using array as a stack ;)**

**[14:28](#msg6056069e563232374c31b403)should win an obfuscation contest easily**

**Rebol2Red**

**[14:30](#msg60560718ac0fd631ca7e3809)@hiiamboris Sometimes it is usefull to use a stack instead of the function stack to avoid out of memory issues. It is a way to make iterative code out of recursive code**

**hiiamboris**

**[14:32](#msg605607913a9448256c1b4f24)yeah I did smth like that in `glob`**

**[14:34](#msg605607e8bc554b42d612178c)windows allows up to 16383 items in the path, so.. easy to overflow the stack**

**Rebol2Red**

**[14:36](#msg60560860ad83ec3d7d4191e3)Right! Can you tell me please if you see the gray (or is it grey) rounded boxes and the white text too? At total: change: and r:**  
**And my whole post is pink too?!**

**hiiamboris**

**[14:39](#msg60560919a7dfe1372ee7a4f1)when I enable colors, I do**

**Rebol2Red**

**[14:41](#msg6056097dad83ec3d7d41944a)Can you explain this enabling of colors. Have I changed something by accident?**

**hiiamboris**

**[14:41](#msg60560999ef43061daa86effe)no pink here**

**Rebol2Red**

**[14:43](#msg60560a0b28e6153d7230f464)Yep now it is gone. But the rounded boxes are still there!?**

**hiiamboris**

**[14:43](#msg60560a253a9448256c1b537c)"toggle page colors" addon on PM (FF should have many of those under different names)**  
**&gt; Can you explain this enabling of colors. Have I changed something by accident?**

**Rebol2Red**

**[14:52](#msg60560c47563232374c31c023)I had one extension and my adblocker on in my browser which is Slimjet. Maybe this avoids the pink but the rounded boxes are still there. Well, never mind i can live with that.**

**hiiamboris**

**[14:57](#msg60560d45563232374c31c252)wow never heard of Slimjet.. what do you like about it?**

**Rebol2Red**

**[15:03](#msg60560ec73a9448256c1b6232)Well, I like the adblocker (never ads on youtube) the easy handling and never loosing my bookmarks(&gt; 4000). Easy importing and exporting bookmarks. Screen shots, video of tabs, casting to tv, superfast downloading, pdf making, when it has crashed you do not loose bookmarks and you can choose to open the last seen pages, still usable under XP. I can go on but see for yourself. You gonna like it:P**

**What I don't like is that you ca'nt disable the adblocker entirely even when is is not marked. Some pages wo'nt work because of that. That is about the only thing. So I have another browser for that reason.**

**hiiamboris**

**[15:11](#msg605610bd28e6153d723106d4)I personally found that uBlock is superior (in a way that it blocks more annoying junk) to adblockers embedded into Vivaldi and Brave.**

**Rebol2Red**

**[15:15](#msg6056117f9ebdfd164088cc19)Ublock is an extension. I am not fond of extensions because I don't really know about my privacy when using. Sometimes I use one if there is no other way. Slimjet does a really good job on blocking ads on its own. Just try it, it can't harm you :)**  
**And...you can use extensions made for chrome right away!**

**hiiamboris**

**[15:27](#msg60561454c1e10242c5b0e6a6)Extensions provide a lot of things that browsers won't do out of the box. Gestures (ok Opera has that), custom keymap, chrome styling, JS blocking, and more.**

**Rebol2Red**

**[15:32](#msg60561586ac0fd631ca7e575f)I agree that sometimes extensions are needed but I think Slimjet's policy is to make a browser which does the most things out of the box. Maybe we must continue or start this kind of conversation on red/chit-chat?**

**hiiamboris**

**[15:41](#msg605617b328e6153d723116e8)If you have anything to add :)**

****Sunday 21st March, 2021****

**litew**

**[01:15](#msg60569e29bc554b42d6136dc1)How can I continuously append input data (stdin) to process which was called by `call/input`?**

**Example:**

**Run `nc -4kl 127.0.0.1 1212` on console 1 to listen to incoming connections.**

**Run following code in console 2:**

**`cmd_input: "FIRST line of input^/" call/input "nc 127.0.0.1 1212" cmd_input cmd_input: "SECOND line of input^/"`**

**On console 1 I see string `FIRST line of input` has appeared, but string `SECOND line of input` never appears. Is there any way to feed input string after call to executable was made?**

**As I understand, `call` function exits immediately after execution so second `cmd_input` won't be ever passed to executable. `call/wait` doesn't work either - it just blocks red script execution for some time and then `call` returns zero exit code.**

**hiiamboris**

**[08:41](#msg605706b53b9278255bc30cb0)Options:**

**[08:41](#msg605706c483533831b4f48a80)1. Wait for ports**

**[08:41](#msg605706ce3b9278255bc30d50)2. Use file i/o.**

**snotbubble**

**[10:29](#msg60572006563232374c34030a)stuck on parse vs html lists:**  
**`a: {a list:^/* one^/* two^/* three^/end of * list^/another list^/* AAA^/* BBB^/end of the other list} parse a [ any [ to "^/* " change "^/* " "^/<li>" pre: [ to "^/" change "^/" "</li>^/" | to end change end "</li>" end ] :pre ] ] parse a [ any [ to "^/<li>" not "</li>^/<li>" change "^/<li>" "<ul>^/<li>" ] ]`**  
**s are allgood, but 2nd rule stops after 1st occurrence**  
**`a list:<ul> <-------- allgood, found the ^/<li> <li>one</li> <li>two</li> <li>three</li> end of * list another list <------- but missing <ul> here <li>AAA</li> <li>BBB</li> end of the other list`**  
**does the 2nd parse require a position change?**

**hiiamboris**

**[10:35](#msg6057215abc554b42d6147dfa)you can debug parse rules by inserting code like: `p: (?? p)` into places where you think it fails**

**[10:36](#msg605721c388edaa1eb8ced6a8)and @gltewalt has a helper utility FWIW https://github.com/gltewalt/parse-caddy**

**[10:39](#msg6057224cad83ec3d7d43e91a)another approach to try is download https://www.redlake-tech.com/products/diagrammar-for-windows/ and input your rule there and look at it visually: does it look like it's doing what you think it's doing?**

**[11:33](#msg60572f17c1e10242c5b33350)@toomasv could be cool if DG could tell that e.g. `not "^/``"` always succeeds (or highlight rules that always fail)**

**snotbubble**

**[12:19](#msg605739b983533831b4f4ecde)@hiiamboris am using linux, plus there's no demo of diagrammar, so don't know if it'll be useful. The task can be brute-forced by other means so not that important.**

**toomasv**

**[12:27](#msg60573ba4a7dfe1372eea3371)@hiiamboris Good suggestion, thanks!**

**gltewalt**

**[17:13](#msg60577ed4563232374c34cd0c)There's a demo of diagrammar**

**[17:34](#msg605783a0563232374c34da5e)@snotbubble I got this with your data:**

**`a list:<ul> <li>one</li><ul> <li>two</li><ul> <li>three</li> end of * list another list<ul> <li>AAA</li><ul> <li>BBB</li> end of the other list`**

**greggirwin**

**[19:29](#msg60579e8a28e6153d7234697c)&gt; could be cool if DG could tell that e.g. not "&lt;/li&gt;^/&lt;li&gt;" always succeeds (or highlight rules that always fail)**

**:+1:**

**rseger**

**[19:44](#msg6057a2043b9278255bc46848)hey all. I've done some research and I believe parse is always greedy. I can't prove the option to change that doesn't exist somewhere though. Does it? Is it possible to tell parse not to be greedy?**

**hiiamboris**

**[19:46](#msg6057a2ac88edaa1eb8cff5e6)it works unlike regex, so "greedy" is just inapplicable to Parse**

**rseger**

**[19:49](#msg6057a34368921b62f479087c)so it is impossible to change that behavior, check and check. Have to figure something else out then :)**

**hiiamboris**

**[19:50](#msg6057a373c1e10242c5b440b0)what's the actual problem you're trying to solve?**

**rseger**

**[19:51](#msg6057a3ce563232374c352caa)I want to ignore everything to a close tag but ensure that I haven't passed a newline while doing so.**

**[19:52](#msg6057a3f733346c1627690b52)I'm sure it's possible, can't be even close to a unique requirement, just haven't figured it out yet**

**hiiamboris**

**[19:52](#msg6057a40a28e6153d7234766d)step one: don't use `to` &amp; `thru` ;)**

**rseger**

**[19:52](#msg6057a41b68921b62f4790a4c)but, but :sob:**

**hiiamboris**

**[19:53](#msg6057a435bc554b42d6159ef6)don't worry, it's simpler without them! :D**

**greggirwin**

**[20:01](#msg6057a62aa7dfe1372eeb30d2)`Parse` is like PEG. Put your longest rules first.**

**[20:08](#msg6057a7ac3b9278255bc4784c)When I did some studying of regex engines, years and years ago, one of the key points that has stuck with me is that without too much difficulty you can hit pathological cases where time explodes on you. Not saying you can't also do with with `parse`, but it will be less frequent and more predictable.**

**hiiamboris**

**[20:09](#msg6057a80668921b62f4791535)I guess that's why regex is line-oriented ;)**

**greggirwin**

**[20:10](#msg6057a839a7dfe1372eeb3675)Friedl's book is the ultimate reference on regexes. I don't see it on my shelf, so it's either in a box or I gifted it because I realized regexes were not for me. :^)**

**rseger**

**[20:14](#msg6057a93cad83ec3d7d4514bf)parse gives me some really powerful things "out of the box" which I'm enjoying but I fear I have too much experience with regexes. Really grokking parse isn't going to be easy**

**[20:16](#msg6057a98088edaa1eb8d00986)so used to a "ignore everything until" mentality, doesn't transfer very well**

**greggirwin**

**[20:23](#msg6057ab41ad83ec3d7d451a1f)Cut yourself slack as you learn `parse`. You'll get there. With many things in Red it is easier, and helps, to think through it like a human. e.g. you tell it `to` and it dutifully and happily says "Got it". Then you say "but if you passed a newline, forget what I just told you and do this instead." "Whaaa. But I..."**

**So while it seems tedious, and from looking at code I often think "this has to be so much slower!" your not-too-bright computer assistant is really happy when you say "OK, you found &lt;li&gt;, now move forward and if you see a newline (stop and tell me). If you see &lt;/li&gt; (do this). Otherwise keep going like that. (i.e. `skip`)"**

**gltewalt**

**[20:40](#msg6057af33f07ffa1eb557d91d)@rseger `ahead` sounds like your pal**

**rseger**

**[20:50](#msg6057b1883b9278255bc48e95)oof, unit tests - you're killing me. Seems like my naive algorithm beginning with `to X` fails if the real match is the second+ `X` in the file**

**greggirwin**

**[20:52](#msg6057b1fc8478e061b94f3b02)You may also want to peek at https://github.com/toomasv/regex**

**gltewalt**

**[21:00](#msg6057b3e18478e061b94f3f66)Also, there's a `red/parse` room were gurus can chime in.**

**greggirwin**

**[21:03](#msg6057b487bc554b42d615ca0c)Yes, good note @gltewalt.**

**rseger**

**[21:14](#msg6057b72628e6153d7234a837)gurus indeed - even the questions are over my head lol.**

**gltewalt**

**[21:40](#msg6057bd409ebdfd16408c8406) Break the problem down to smaller chunks. Work on a rule for each chunk. I'm a beginner too, but gurus are valuable to get feedback from.**

****Monday 22nd March, 2021****

**wallysilva**

**[02:57](#msg605807b7bc554b42d6168cad)@hiiamboris and @gltewalt Thank you for pointing out that DiaGrammar is available for trial, I was not aware of that!**

**gltewalt:matrix.org**

**[03:59](#msg6058160ebc554b42d616af2e)Yeah, download link just happens to be at the bottom of the page**

**rseger**

**[04:12](#msg60581919bc554b42d616b628)`copy/part skip my-series index size` is the right way to extract a subset of length `size` starting at offset `index` from `my-series`, true?**

**greggirwin**

**[04:23](#msg60581ba5a7dfe1372eec43bb)It's fine. `Skip` vs `at` is often the question, which comes down to what intent you want to convey, based on how your index is used.**  
**`>> blk: [1 2 3 4 5] == [1 2 3 4 5] >> skip blk 1 == [2 3 4 5] >> at blk 1 == [1 2 3 4 5]`**

**rseger**

**[04:27](#msg60581cc228e6153d72359878)so `at` is actually what I wanted. Skip eats a number of entries, meaning you need to skip 1 less than the index you want to start at. Subtle difference that would have taken me forever to figure out - thank you!**

**greggirwin**

**[04:37](#msg60581f03ac0fd631ca82ee72)You're very welcome.**

**gltewalt**

**[04:39](#msg60581f6c33346c16276a3059)Any idears on this? Right now the value doesn't update in the text/data until another space (or entry) is made in the Rule field.**

**https://imgur.com/a/5DV6XzC**

**https://imgur.com/a/1s1EOjC**

**greggirwin**

**[04:42](#msg6058203cbc554b42d616c845)@gltewalt I don't comment on code images much, because I can't touch and tinker. Just reading a picture of code and trying to find a problem is much more time and brain consuming for me. I know it's hard to extract when it's a larger app. In those cases, linking to specific lines or areas can help people narrow down what to look at in a code base.**

**gltewalt**

**[04:43](#msg605820813a9448256c1ff87c)I could post a gist, but this particular snag isn't in the rpo yet**

**[04:43](#msg6058208288edaa1eb8d11bc0)repo**

**greggirwin**

**[04:57](#msg605823c89ebdfd16408d7919)gists are good.**

**gltewalt**

**[04:59](#msg605824339ebdfd16408d7a2d)Or can I be hacky and just sendkey `space` to the rule field after the end of input is reached, to get it to work?**

**ne1uno**

**[05:01](#msg605824bc3b9278255bc59681)trigger any `on-changed` action from the other fields/controls too**

**gltewalt**

**[05:03](#msg6058250988edaa1eb8d125b0)https://gist.github.com/gltewalt/2282f84ce8b84acc48979a91caf516df**

**[05:03](#msg6058253488edaa1eb8d125ed)Lines:**

**https://gist.github.com/gltewalt/2282f84ce8b84acc48979a91caf516df#file-pc-red-L9**

**https://gist.github.com/gltewalt/2282f84ce8b84acc48979a91caf516df#file-pc-red-L17**

**https://gist.github.com/gltewalt/2282f84ce8b84acc48979a91caf516df#file-pc-red-L76**

**ne1uno**

**[05:03](#msg6058253e68921b62f47a3393)could add `parse` button for the time `on-change` isn't naturally triggered**

**gltewalt**

**[05:04](#msg6058257ac1e10242c5b576a6)I think it's because on-change needs one more bump, but I'm not sure why... the End Of Input value is there**

**[05:05](#msg605825adbc554b42d616d46d)I think... kind of like a pre vs post loop issue**

**litew**

**[12:16](#msg60588a8ac1e10242c5b68d2b)&gt; 2. Use file i/o.**

**@hiiamboris I'll try to tinker with file i/o, thank you.**

**rseger**

**[15:54](#msg6058bdd068921b62f47bdcc3)is `reverse my-series remove my-series reverse my-series` the right way to remove the last item from `my-series`?**

**rebolek**

**[15:55](#msg6058be08ad83ec3d7d47d919)that, or you can try `take/last series` :)**

**rseger**

**[15:56](#msg6058be30563232374c3814e3)I knew there was a better way! Thank you :)**

**toomasv**

**[15:59](#msg6058bed38478e061b951f22b)or `remove back tail` or `clear back tail` and use `head` if you want to return modified series.**

****Tuesday 23th March, 2021****

**gltewalt**

**[01:26](#msg605943bfad83ec3d7d495dd7)&gt; Any idears on this? Right now the value doesn't update in the text/data until another space (or entry) is made in the Rule field.**  
**&gt;**  
**&gt; https://imgur.com/a/5DV6XzC**  
**&gt;**  
**&gt; https://imgur.com/a/1s1EOjC**

**I got it worked out.**

**greggirwin**

**[01:34](#msg60594588f07ffa1eb55c2ab9)What was the issue?**

**gltewalt**

**[01:41](#msg60594731c1e10242c5b8c328)I'm not sure why setting to a temp word (variable) doesn't update until another change is made to the field (space)... assigning directly to another `text` areas `data` updates right away.**  
**`result-txt/data: mold parse/trace ... etc`**

**[01:42](#msg60594791563232374c39a96a)I don't know if it's advisable to do it in the same action as the parse/trace check, but it works without negatively affecting the results**

**bubnenkoff**

**[12:56](#msg6059e56da7dfe1372ef1092d)&gt; Giving way but still struggling desperately: :cold\_sweat:**  
**&gt;**  
**`> rule: [collect any [s: skip keep (mold s/1) [end | keep (", ")]]] > head insert next "()" rejoin parse ["a a" {boom, "boom", "boom"} "c c"] rule > == {("a a", {boom, "boom", "boom"}, "c c")} >`**

**I am back to this code. I can't find moment where issue with `copy` happens: Look:**  
**`f: function[str-blk] [ rule: [collect any [s: skip keep (mold s/1) [end | keep (", ")]]] str: head insert next "()" rejoin parse str-blk rule ] f [a b c] f [a b c]`**  
**output:**  
**`== "(a, b, ca, b, c)"`**

**GalenIvanov**

**[13:14](#msg6059e99c68921b62f47ef6ee)@bubnenkoff Maybe this:**

**[13:14](#msg6059e9a0f07ffa1eb55db95f)**  
**`f: function[str-blk] [ rule: [collect any [s: skip keep (mold s/1) [end | keep (", ")]]] str: head insert next copy "()" rejoin parse str-blk rule ]`**

**[13:14](#msg6059e9b433346c16276f161c)Just a `copy` before `"()"`**

**bubnenkoff**

**[15:30](#msg605a09899ebdfd164092ac07)Yes, you are right. Is there any good way to change quote marks from double to single? I see only way - use parse because replace will break data that can be quoted inside.**  
**`parse ["aa" "bb" "cc"] [collect keep [some [ change {"} "'" | skip ] ] ]`**  
**This code not work, and I am not sure that it's good idea**

**rebolek**

**[15:33](#msg605a0a3228e6153d723adda1)of course it doesn’t work, as there are no quote marks in your strings**

**[15:33](#msg605a0a4cad83ec3d7d4b6403)so parse can’t change anything**

**bubnenkoff**

**[15:46](#msg605a0d3d2beb1e1da3c65d91)Can this function be modified to return single-quoted result?**  
**`f: function[str-blk] [ str: none rule: [collect any [s: skip keep (mold s/1) [end | keep (", ")]]] str: head insert next copy "()" rejoin parse str-blk rule ] f ["11.22.22" "some text here" "1.00" none]`**

**rseger**

**[16:16](#msg605a1445c1e10242c5bae57e)the double quotes aren't actually part of the data, they're just how Red is showing you that those are strings. Single quotes would need to be part of the data (or added afterwards) in order to show up as a component of the actual results. You'd see that as `"'data here'"` when you displayed it in the repl.**

**bubnenkoff**

**[16:19](#msg605a14fb88edaa1eb8d68bf2)So the only way to parse string representation and change quotes in it?**

**rebolek**

**[16:22](#msg605a15a8bc554b42d61c1608)you can't change something that isn't there :-)**

**[16:25](#msg605a1675ac0fd631ca8858a9)for example:**  
**`>> data: ["aa" "bb" "cc"] == ["aa" "bb" "cc"] >> collect/into [keep "('" keep first data foreach value next data [keep "', '" keep value] keep "')"] copy "" == "('aa', 'bb', 'cc')"`**

**bubnenkoff**

**[16:26](#msg605a169dc1e10242c5baecda)wow! Thanks!**

****Wednesday 24th March, 2021****

**snotbubble**

**[05:12](#msg605aca25563232374c3d988a)is there a way to read the height of tab-panel tabs?**

**greggirwin**

**[05:17](#msg605acb4e3a9448256c2735f7)I don't see anything in `system/view/metrics` that looks like it.**

**[05:26](#msg605acda23a9448256c273c72)I don't see any APIs declared for accessing it either.**

**[05:30](#msg605ace79bc554b42d61e08c8)What is it you're trying to accomplish?**

**snotbubble**

**[05:32](#msg605acedbac0fd631ca8a3cc5)keep a horizontal divider pegged to its position relative to the widow on resize, where the divider is nested a few panels deep in the ui**

**greggirwin**

**[05:40](#msg605ad0d3ac0fd631ca8a417c)Hmmmm. No quick ideas OTTOMH. Do you want it relative to the main window or the tab pane?**

**[05:47](#msg605ad27d68921b62f48162c9)Maybe @hiiamboris or @dsunanda will have a mechanism in their resizing systems that will do what you want.**

**snotbubble**

**[06:30](#msg605adc8ca7dfe1372ef3a215)with the tab-panel height this would be as simple as:**  
**`hdiv/offset/y: (tabpanel/size/y - lowerpanel/offset/y) - (hdiv/height + tabpanel/tabheight)`**  
**tab height scales with font, but doesn't seem to be linear, or linear + pad.. whole new rabbithole.**

**will use `39` for now**

**GiuseppeChillemi**

**[09:12](#msg605b027c28e6153d723d7923)Is there any way to `load` a script maintaining comments? I would like to access them while the script is a loaded Red block.**

**hiiamboris**

**[09:46](#msg605b0a70ac0fd631ca8ae88c)https://github.com/red/docs/blob/master/en/lexer.adoc#transcodetrace see transcode/trace**

**greggirwin**

**[16:16](#msg605b65ec3b9278255bce88eb)The other way to do it is to use a special marker followed by a string, which you can then parse for.**

**ldci**

**[16:48](#msg605b6d7aad83ec3d7d4f40f3)Help! This function was fine but not now**  
**‘’'**  
**makeRange: func [**  
**a \[number!]**  
**b \[number!]**  
**step \[number!]][**  
**collect \[i: a - step until \[keep i: i + step i: b]]**  
**]**  
**\`**

**[16:49](#msg605b6db5a7dfe1372ef542e3)oups**

**[16:50](#msg605b6dc433346c1627733a52)**  
**`makeRange: func [ a [number!] b [number!] step [number!]][ collect [i: a - step until [keep i: i + step i: b]] ]`**

**[16:56](#msg605b6f4abc554b42d61fd502)Don’t act i = b**

**[16:56](#msg605b6f513a9448256c2906de)Sorry :)**

**hiiamboris**

**[16:57](#msg605b6f7868921b62f4832dfd);)**

**rseger**

**[20:42](#msg605ba43aa7dfe1372ef5e92f)it took me an amusingly long time to figure out how to get a directory listing into a variable (`dir` works great for just peeking). I finally found it in the rebol quickstart `read %directory/` &lt;- it's so direct and simple I just didn't even think to look there.**

**greggirwin**

**[20:54](#msg605ba7113b9278255bcf4d30)That happens a lot. There was a video a few months back where a person new to Red spent a lot of time trying to figure out how to read a url, not thinking of `read http://...`. It's the dictionary problem. If you don't know how to spell a word, how do you find it? If you only think of `import net-lib` and `make request ...` you can't see the road for the fog.**

**[21:01](#msg605ba89968921b62f483dc5d)Over time you'll start to think in terms of types and how actions applied to them work naturally. If you do `help action!` you get a list, which is not organized if you don't know what to look for. But look at the code for a datatype and you'll see them broken out roughly by category: `[general scalar bitwise series I/O]`. https://github.com/red/docs/blob/master/en/actions.adoc lists them by category.**

**[21:02](#msg605ba8e4ad83ec3d7d4ff572)As more people come to Red, I'm sure we'll get "How do you load a JSON file?" a lot. Because `load %my-file.json` is hiding in plain sight.**

**rseger**

**[21:03](#msg605ba933bc554b42d62089b0)yeah, that would have taken me some time to figure out too! lol**

**GiuseppeChillemi**

**[21:06](#msg605ba9bd3b9278255bcf552c)&gt; it took me an amusingly long time to figure out how to get a directory listing into a variable (`dir` works great for just peeking). I finally found it in the rebol quickstart `read %directory/` &lt;- it's so direct and simple I just didn't even think to look there.**

**You have made me laugh so loud my neighbours have heard me!**

**greggirwin**

**[21:06](#msg605ba9c13a9448256c29b15c)Preemptive strike on my part @rseger. :^)**

**[21:07](#msg605baa14c1e10242c5bf5928)Don't feel bad about asking what seem like simple questions here. It helps everyone watching.**

**rseger**

**[21:08](#msg605baa3333346c162773edc5)thank you for the link. Little hard to parse in one shot but I'm confident it'll be crazy useful going forward. Are there efforts underway to create kind of a "transition" document for people like me? I'd be interesting in helping out with that kind of thing, if that would be at all useful**

**greggirwin**

**[21:08](#msg605baa5af07ffa1eb562a410)Funny you should ask. We have someone starting on one for Python now. What lang(s) do you know and would like to work on?**

**[21:09](#msg605baa6c88edaa1eb8db0291)You can help lay the foundation.**

**rseger**

**[21:10](#msg605baaac9ebdfd1640974b75)python is probably my strongest but I've got an unhealthy smattering of experience all over the spectrum**

**greggirwin**

**[21:10](#msg605baababc554b42d6208de8)red-by-example.org may help as well, as the ref docs are pretty dry.**

**[21:11](#msg605bab00f07ffa1eb562a540)Excellent. @GalenIvanov, you have a lieutenant! The only thing worse than doing thankless docs is doing them alone. Feel free to use red/docs for chat as you brainstorm and experiment.**

**rseger**

**[21:11](#msg605bab0728e6153d723f6b21)I've been looking for a language that "just fits" for a long time. Too early to say for certain about Red being that for me but I haven't enjoyed the frustration of learning a language this much in years!**

**greggirwin**

**[21:12](#msg605bab3733346c162773efc7)LOL! Many of us know that feeling. Wait until you start tripping over the really fun stuff. :^)**

**[21:15](#msg605babf5563232374c40292f)Invest in a good helmet. 1) when you see simple answers to things you were stuck on, you'll beat your head on the desk. 2) periodically your brain will explode with new insights, ideas, or seeing a gurus answer that looks like it can't possibly work.**

**I've been through at least a dozen helmets myself.**

**rseger**

**[21:16](#msg605bac36ac0fd631ca8cb934)you've terrified my poor rubber duck lol**

**greggirwin**

**[21:17](#msg605bac5b9ebdfd1640974fe5)I have an old design folder labeled `OGL (One Good Language)` . I stopped designing it when I found Rebol. Doesn't mean Red is your fit, but it will give you new tools for thinking no matter what.**

**rseger**

**[21:33](#msg605bb02488edaa1eb8db1220)I looked but I couldn't find it, is there an equally direct way to write an object as json to a file?**

**[21:36](#msg605bb0f868921b62f483f3ec)this might be an oddity of my perception but so far Red and I are getting along well because it gives me all of the code &lt;-&gt; data flexibility of a lisp or smalltalk without the feeling that a developer's productivity is secondary to the language's purity**

**hiiamboris**

**[21:37](#msg605bb10cbc554b42d6209f43)`save %file.json obj`**

**rseger**

**[21:37](#msg605bb12b3a9448256c29c3c6)`save` of course - I just.. love it :)**

**[21:38](#msg605bb1669ebdfd1640975dd1)I was so fixated on `write`.. we really do need a transition doc for we poor souls lol**

**hiiamboris**

**[21:38](#msg605bb17068921b62f483f6a3)(:**

**loza:matrix.org**

**[21:43](#msg605bb29768921b62f483f938)@greggirwin isn't it `load-json %my-file.json` ?**

**rseger**

**[21:45](#msg605bb2e3ac0fd631ca8cc8e1)`help` doesn't have anything for json out of the box, maybe that's in a package?**

**hiiamboris**

**[21:47](#msg605bb35933346c162774079e)`? save` - note `/as` refinement (which is also inferred from extension)**

**[21:47](#msg605bb37288edaa1eb8db1a32)`? "json"` and `?? save` for deeper insights**

**[21:48](#msg605bb3b788edaa1eb8db1af5)@greggirwin maybe `? save` needs an update to list JSON among codecs?**

**[21:48](#msg605bb3be563232374c403d83)only images so far**

**[21:50](#msg605bb4173b9278255bcf7265)we have added much more since the docstring was written**  
**`>> extract system/codecs 2 == [png jpeg bmp gif json csv redbin]`**

**rseger**

**[21:50](#msg605bb44088edaa1eb8db1cd3)**  
**`>> save/as %test.json #(this: 2 that: 3) 'json *** Script Error: invalid /as argument: json *** Where: do *** Stack: save cause-error`**

**loziniak**

**[21:50](#msg605bb4428478e061b95a3601)wow, I didn't know `save` applies right codec based on file extensions.**

**hiiamboris**

**[21:51](#msg605bb465563232374c403fd8)@rseger `about` output pls?**

**rseger**

**[21:51](#msg605bb46c88edaa1eb8db1d2d)does `??` really give you the source code?!**

**hiiamboris**

**[21:51](#msg605bb4743a9448256c29cc92)yep**

**rseger**

**[21:51](#msg605bb4793b9278255bcf7338)`Red 0.6.4 for Windows built 21-Nov-2018/18:40:38-06:00 commit #755eb94`**

**[21:52](#msg605bb487c1e10242c5bf744c)was just the download from the site**

**hiiamboris**

**[21:52](#msg605bb487a7dfe1372ef61184)as I thought.. 2 years old build**

**[21:52](#msg605bb49bac0fd631ca8ccc11)grab the nightly bro ;)**

**[21:53](#msg605bb4d72beb1e1da3cb0355)everyone falls into this trap, and nobody fixes it**

**rseger**

**[21:53](#msg605bb4ed9ebdfd16409768f6)lol**

**[21:53](#msg605bb4f23a9448256c29ceb1)well, good to know now at least! :)**

**[21:57](#msg605bb5b988edaa1eb8db2147)as promised, works perfectly**

**greggirwin**

**[22:10](#msg605bb8e6ad83ec3d7d501c63)@loza:matrix.org did you try what I posted? :^) `load` works, via the magic of codecs, but you can use `load-json` as well if you prefer. Note that it works on strings, so you need to `read` the file first to use it.**

**[22:11](#msg605bb90933346c162774148f)Yes, we should update the doc string to note CSV, JSON, and redbin.**

**loza:matrix.org**

**[22:44](#msg605bc0cd8478e061b95a56f5)indeed, didn't even try, assumed it's too magical to be true 😃**

**rseger**

**[22:45](#msg605bc0f29ebdfd1640978937)I'm trying to grab a copy of arguments passed in via the command line. It seems like `system/args-list` would do this. First, is there a better way? Second, I can't seem to get that command to work. `*** Script Error: cannot access args-list in path system/args-list` what am I messing up?**

**greggirwin**

**[22:58](#msg605bc41d3b9278255bcf9cc7)@rseger you're looking for `system/options/args` (loaded) or `system/script/args` (string).**

**You can poke in the console, e.g. `print mold words-of system` or try \[this](https://gist.github.com/greggirwin/91dc1c3971998e0babeedba9f7e60bc5) for exploring.**

**[22:59](#msg605bc43ea7dfe1372ef63b66)And if you just do `? system`, you'll get a nice overview.**

**rseger**

**[23:00](#msg605bc489ad83ec3d7d5038fb)I was so close! Thank you again :)**

**greggirwin**

**[23:11](#msg605bc73cad83ec3d7d504007)Note that if you're running interpreted, rather than compiled, you can call a script with `do/args` and you need to use `system/script/args` in that scenario, which will then be just what you pass, string or block.**

****Thursday 25th March, 2021****

**rseger**

**[02:24](#msg605bf46c28e6153d72402102)I'm attempting to run `.\red.exe --no-console .\test.red testing this thing` with test.red of**  
**`Red [] print "why?" write %test.opt system/options/args`**

**[02:25](#msg605bf48828e6153d7240214a)I'm not seeing the "why?" nor is the file being written**

**[02:26](#msg605bf4d288edaa1eb8dbc355)obviously missing something but, yeah**

**gltewalt**

**[03:22](#msg605c01e09ebdfd1640982bbf)Why are you using `--no-console`?**

**[03:23](#msg605c022f33346c162774d3ee)That flag is so the repl wont launch after compiling the console**

**rseger**

**[03:24](#msg605c028bad83ec3d7d50d14a)ultimately I'm hoping to create a simple cli tool like, `ls` or similar. For this particular guy I simply noticed that it was dropping me into a console and the `why?` was appearing there. I mistakenly assumed the console was consuming args somehow. It didn't end up mattering but there's my story :)**

**gltewalt**

**[03:28](#msg605c03712beb1e1da3cbc1b2)Is your test.red compiled?**

**[03:30](#msg605c03e688edaa1eb8dbe980)With interpreted `.\red.exe test.red some different args` should work fine without ending up in a repl**

**[03:32](#msg605c044d33346c162774d90a)Maybe I'm just confused. You don't want `why?` to appear in the console?**

**rseger**

**[03:32](#msg605c045d563232374c41063b)I haven't compiled anything though will give that a whirl in just a sec. Calling it without `--no-console` always drops me in a repl though**

**gltewalt**

**[03:33](#msg605c04888478e061b95afc58)Hmm... well, I'm not on windows, so maybe I should wait for someone else to chime in**

**rseger**

**[03:33](#msg605c048c563232374c41068d)no, I was thinking it might work like `printf` or similar and just dump it to stdout - I was trying to debug why the file wasn't getting created**

**gltewalt**

**[03:34](#msg605c04ad8478e061b95afcb1)Nothing happens on my end either if I throw in --no-console**

**greggirwin**

**[03:34](#msg605c04b288edaa1eb8dbebb3)I don't know OTTOMH, but can dupe it here.**

**gltewalt**

**[03:35](#msg605c0501563232374c410763)weird**

**greggirwin**

**[03:35](#msg605c0503a7dfe1372ef6daca)Doesn't matter if the `write` comes first. @qtxie, do you know what's happening inside with `--no-console`? That is, why it doesn't write the file.**

**rseger**

**[03:38](#msg605c059c3a9448256c2a9220)I can confirm that it functions "properly" (the way I guessed) if you compile it. Specifically it prints to stdout, writes the file, and doesn't open a console window.**

**[03:38](#msg605c05c428e6153d72404c3f)(thank you for the suggestion!) Immediate blocker down but I would love to know what was actually going sideways under the hood while running it as a script**

**greggirwin**

**[03:39](#msg605c05f588edaa1eb8dbeec6)It should also work if you use `--cli` interpreted, but if you haven't built the CLI console previously it will do that the first time.**

**rseger**

**[03:41](#msg605c06833b9278255bd04221)woot! That'll help with the write test cycle for sure**

**greggirwin**

**[03:43](#msg605c06ebf07ffa1eb56386e2)Also be sure to try both `-c` and `-r`. If you're not changing the runtime, `-c` is fast because it doesn't have to recompile all that, only your script. `-e` is also faster, and is useful with dynamic code that makes the compiler unhappy.**

**[03:45](#msg605c074e563232374c410d31)Thanks for confirming things @gltewalt.**

**gltewalt**

**[03:49](#msg605c082c9ebdfd1640983ae7)Ah, of course. .\\red.exe --cli for windows**

**rseger**

**[04:53](#msg605c1737563232374c413533)how would one find all of the different encodings `read/as` supports? Specifically I have a file which violates the utf-8 spec, intentionally, and I'd really like to tell Red "just treat it like ascii and don't worry about it".**

**greggirwin**

**[04:59](#msg605c18bd28e6153d72407afe)If it's not UTF-8, you can't read it as a string today, but you can use `read/binary` and then convert each byte to a `char!`.**

**[05:01](#msg605c19302beb1e1da3cbf8da)Right now Red's I/O is simple, and `/as` is not implemented for `read` on files.**

**[05:02](#msg605c195988edaa1eb8dc1dda)That doc string should have TBD in it, if anyone wants to make a PR.**

**GalenIvanov**

**[07:48](#msg605c4066563232374c41a9e0)@rseger I started recently a page \[Coming to Red from Python](https://github.com/red/red/wiki/Coming-to-Red-from-Python) in the \[wiki](https://github.com/red/red/wiki) . It will take time before it's somewhat complete, but I'll appreciate if you visit it occasionally and share your thoughts/comments and advice. As @greggirwin suggested, your feedback can be very useful.**

**rseger**

**[15:37](#msg605cae51a7dfe1372ef8b688)I'm looking forward to reading it later this afternoon @GalenIvanov. As a wiki should I add things directly assuming you'd remove anything that didn't jive or did you want to limit things simply to comments and such?**

**[15:38](#msg605cae90ad83ec3d7d52b638)with regards to the reading of non-utf8, the real goal is to run it through my parse rules. I couldn't tell if that was possible/would work from the reading I did last night but it's where I'll be starting in later today :)**

**hiiamboris**

**[15:48](#msg605cb0b73a9448256c2c721d)parse works on binary better than on strings currently**

**rseger**

**[17:49](#msg605ccd29bc554b42d623a588)would I need to make the rules in a special way or will my "match me" style strings and such "just work"?**

**hiiamboris**

**[17:54](#msg605cce5e88edaa1eb8de2642)should just work, but be careful, theres no case-insensitive mode for binary**

**greggirwin**

**[18:02](#msg605cd03ef07ffa1eb565d2ab)@GalenIvanov @rseger on wikis, I generally encourage people to get content out there, which can be cleaned up later. Since this is a new area, and we're laying groundwork, maybe have 2 sections at the bottom for a draft outline and content snippets/notes as they occur to you. Put things there, discuss in chat, and coordinate with each other. @GalenIvanov is the lead, but I imagine others will chime in with thoughts as well.**

**[18:03](#msg605cd08788edaa1eb8de2c63)Having areas that are clearly for discussion and hacking can reduce bigger changes and reorgs in the main body.**

**GalenIvanov**

**[18:57](#msg605cdd3233346c16277744a7)@greggirwin Your suggestions make sence, I'll add such sections.**  
**@rseger Please add whatever you think is interesting in the Notes section that I'll create.**

**rseger**

**[19:07](#msg605cdf559ebdfd16409ab4cc)I see `difference` for series, very cool, but I'm wondering: is there a `diff` like variation? These lines of this file are in this other file, these lines aren't, kind of thing? It would be great not to have to rely on diff itself, if possible.**

**hiiamboris**

**[19:11](#msg605ce0643b9278255bd2c517)AFAIK nobody did that yet**

**[19:12](#msg605ce09f68921b62f4874833)though `difference` might just do as strings are hashed by content**

**greggirwin**

**[19:23](#msg605ce33588edaa1eb8de6769)`Difference` is a set operation. I did an LCS diffing+patch system long ago, and I think @toomasv has done one as well. It's not a quick or easy op, like sets, dynamic with high space complexity. But what I really got stuck on was performance (in R2) and then wanting to do more than strings. Same issue I have for AWK and such. I want to be able to work against blocks and structures. Diffing lines in Red is not nearly as powerful as diffing values could be.**

**hiiamboris**

**[19:31](#msg605ce52aad83ec3d7d5366ee)right, duplicate strings..**

**greggirwin**

**[19:34](#msg605ce5c688edaa1eb8de6ed1)Seems I did the first one in 2002, so performance issues were on a P900.**

**Set ops don't guarantee ordering, but once you have non-matching lines, you could `find` those in many cases. Interesting idea if diffing by lines is enough. Once you span lines all bets are off though.**

**hiiamboris**

**[19:37](#msg605ce675bc554b42d623f7d2)I think they should guarantee the order of the 1st operand (they do today)**

**greggirwin**

**[19:44](#msg605ce8263a9448256c2d2525)Take that up with Nenad. As soon as you guarantee something it's forever.**

**hiiamboris**

**[19:47](#msg605ce8b933346c16277768b0)Since set ops accept only ordered data (hash, block, string, bit/typesets), why would they not guarantee the order? it's either removal of an item from 1st operand or append to it.**

**greggirwin**

**[19:53](#msg605cea38563232374c43ae1d)I haven't looked at the R/S code, but that's roughly how I did it in a mezz before they were built in. Buildup up a new result entirely though, not removing. But I don't know set-up algos and whether guaranteeing order may preclude optimizations there.**

**hiiamboris**

**[20:00](#msg605cebcc8478e061b95d9d39)Series is converted into a hashtable. Then it's less than 2\*(N1+N2) hash lookups just boringly iterating item by item (doubled because we want to exclude duplicates from both operands).**

**rseger**

**[20:59](#msg605cf9b588edaa1eb8dea78e)`parse` appears to modify in place in the repl, is that not the case all the time? I have a while loop iterating over all of the parser rules I've made but when I print `dirty-file` later there hasn't been a change (a couple parse rules do hit, proven by the print statement)**  
**`foreach cleaner cleaners [ while [parse dirty-file do cleaner] [print cleaner] ]`**

**hiiamboris**

**[21:16](#msg605cfd9368921b62f487a145)we won't know if you won't show us the code ;)**

**[21:16](#msg605cfda69ebdfd16409b0ee0)apparently the problem is in cleaner**

**rseger**

**[21:19](#msg605cfe56ad83ec3d7d53b195)I removed all but one of the cleaners from the array of them just to be concise. They're all tested in the repl so they do execute and, in the ideal scenario at least, work.**  
**`split-shell: [to [begin-first: "error_reporting(0)" thru ; find the first error_reporting call where, "create_" thru "function';" end-first: ; both create_ and function follow to "$" begin-second: copy execute-var to equal-sign ; with the next variable thru "lave" thru [execute-var "();"] end-second: ; being executed after the string lave appears (change/part begin-first "" end-first) ; remove the first chunk (change/part begin-second "" end-second)] any skip] ; remove the second chunk cleaners: [... split-shell] clean-file: func [filename] [ dirty-file: read/binary to-file filename print [length? cleaners "cleaners loaded."] foreach cleaner cleaners [ while [parse dirty-file do cleaner] [print cleaner] ] dirty-file ]`**

**hiiamboris**

**[21:20](#msg605cfeb3ad83ec3d7d53b255)use parse's `change` command**

**rseger**

**[21:20](#msg605cfeb58478e061b95dd3ab)the idea behind the clean-file function is to open a file, execute every cleaner against its data, and return the minty fresh remains after parse**

**hiiamboris**

**[21:21](#msg605cfed72beb1e1da3cea72c)parse won't be able to handle arbitrary tampering with the input from outside**

**[21:21](#msg605cfeec33346c162777ab49)and `(change/part ...)` from parse's POV is "outside"**

**[21:22](#msg605cff272beb1e1da3cea858)just an idea though, maybe it's not the culprit since you're doing that at the end of the rule**

**rseger**

**[21:23](#msg605cff452beb1e1da3cea8be)didn't know there was an internal way to do it (copied that from somewhere). At the very least, it does work when done in isolation. I'll looking into parse's `change` and see if that helps**

**hiiamboris**

**[21:25](#msg605cffdf2beb1e1da3ceab47)also in this case `remove`, not `change` is the best command**

**[21:26](#msg605d001a3a9448256c2d6a74)if doesn't help, debug your rule with `p: (?? p)` to see how far it gets**

**[21:30](#msg605d00dcbc554b42d6244375)looks strange, if you say it prints the cleaner but does not change the input..**

**[21:32](#msg605d0159c1e10242c5c32268)you sure you didn't forget to use the result returned by clean-file func?**

**rseger**

**[21:40](#msg605d033b8478e061b95ddf13)the calling code is**  
**`cleaned-file: clean-file rejoin [base-dir filename] print to-string cleaned-file`**  
**if that helps?**

**[21:54](#msg605d06a7c1e10242c5c333de)wouldn't `remove` need to be called during parsing? Before knowing where the beginning and end were?**

**hiiamboris**

**[22:03](#msg605d08c6bc554b42d6245f01)I don't see a problem in the code you posted on a closer look.**

**[22:04](#msg605d08fa33346c162777c9a5)but of course `parse [.. remove rule..]` will be cleaner to look at**

**[22:06](#msg605d0967ad83ec3d7d53d373)if you could give us shorter code to reproduce the issue on our end, would be great**

**rseger**

**[23:15](#msg605d19ab3a9448256c2db365)new wrinkle, calling `clean-file` via a different function doesn't dereference the different cleaners. I can insert typos/invalid parse and it doesn't even blink. If I call `clean-file` directly, things barf as expected.**

**gltewalt**

**[23:31](#msg605d1d632beb1e1da3cefdd8)Make private gist of the code**

****Friday 26th March, 2021****

**rseger**

**[05:16](#msg605d6e24ad83ec3d7d54dbf9)I pushed them into a single file, removed some redundancy, and it's working. I have no idea what dark voodoo gods I irritated but they appear to be appeased for now.**

**[05:18](#msg605d6eab3a9448256c2e89c9)I've run into an interesting quirk though. As a test I'm running 41 parsers across 4 files. When I load the script and execute the sweep, the repl hangs for a good 3-5 seconds. Inefficient code on my part, no doubt. But, if I just execute the sweep again, without reloading the script, the execution is instantaneous. Any ideas on why that would be?**

**hiiamboris**

**[08:38](#msg605d9d6b3a9448256c2f059b)No idea. Though in the morning another problem in your code is crystal clear: during the first 'change' you're moving the rest of the series and second 'change' will miss.**

**GalenIvanov**

**[08:55](#msg605da17a3b9278255bd4cd2f)@rseger Thank you for the notes, I added them to the "Why..." section and cleared the "Notes".**

**Respectech**

**[17:59](#msg605e20ec563232374c472ea4)@rseger Regarding the instantaneous code execution on the second run, could it be due to CPU caching? I've noticed that if the CPU cache is large enough to hold the results of a previous run, and nothing has replaced the cached data before the second run, it is much quicker. But it only works for certain code patterns.**

**rseger**

**[19:33](#msg605e370cbc554b42d627adff)that's the best guess I could come up with. It's not true with larger, or more, files so caching of some flavor is almost certainly behind it all. It would be really cool to better understand so maybe I could use it but, the mysteries of silicon are beyond me.**

****Sunday 28th March, 2021****

**rseger**

**[01:45](#msg605fdfa633346c16277f35c7)`if true and parse "yes" ["yes"] [print "works"]` but,**  
**`>> if parse "yes" ["yes"] and true [print "does not"] *** Script Error: and does not allow block! for its value1 argument *** Where: and *** Stack:`**

**gltewalt**

**[01:55](#msg605fe20e9ebdfd1640a2a4e8)`if (parse "yes" ["yes"]) and true [print "does"]`**

**rseger**

**[02:03](#msg605fe40068921b62f48f4aa2)`and` gets pulled out early during lexical parsing , I guess? Interesting piece of trivial :)**

**gltewalt**

**[02:04](#msg605fe4442beb1e1da3d62b7d)op! has a higher precedence**

**[02:05](#msg605fe45c33346c16277f40ab)`help and`**

**[02:06](#msg605fe4bb9ebdfd1640a2ab35)`and` goes first. He looks and sees \["yes"] and says, "I can't have a block as my first argument"**

**[02:07](#msg605fe4ed3b9278255bdab609)Putting a paren around that expression, it sees `true`**

**rseger**

**[02:08](#msg605fe5003a9448256c34e717)interesting. My naive read of precedence was "left to right, forth-style or bust"**

**gltewalt**

**[02:08](#msg605fe521a7dfe1372e015e18)Mostly. `op!` has a higher precendence, though**

**rseger**

**[02:09](#msg605fe567c1e10242c5cac6ec)happen to know the trivia behind why?**

**gltewalt**

**[02:09](#msg605fe57128e6153d724ad23e)I'll see if I can find some writings on that**

**9214**

**[02:10](#msg605fe5b02beb1e1da3d62ed2)@rseger operators take 3 things:**  
*** Value on the left.**  
*** Expression on the right.**  
*** Precedence over functions.**

**Which means that `add 1 2 * 3` is `add 1 (2 * 3)`, not `(add 1 2) * 3`.**

**rseger**

**[02:15](#msg605fe6a4a7dfe1372e01625e)makes sense, now that I know what to look out for it won't likely trip me up again. More a curiosity about how it happened that way. The cool thing about computer programming languages, to me anyway, is that they are designed. That makes exceptions to "rules" super interesting**

**gltewalt**

**[02:27](#msg605fe9869ebdfd1640a2b551)prefix `if and~ parse "yes" ["yes"] true [print "does"]`**

**[02:28](#msg605fe9d4ac0fd631ca97f995)it's an `action!` so different precedence**

**9214**

**[02:29](#msg605fe9ef8478e061b96580c2)@rseger, Red follows applicative order, i.e. it evaluates arguments first, and then applies the function. In the example above, `1` is an expression that evaluates to itself (so-called self-evaluating form, borrowing the terminology from Lisp), and `2 * 3` is a composite expression that evaluates to `6`, and the net result is `7`. That's quite straightforward.**

**The scenario where `add 1 2 * 3` evaluates to `9` would violate applicative order, because, in such a case, the interpreter would only consider `2` as a sub-expression, disregarding `2 * 3` to which it belongs. There are some \[evaluation modes](https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#literal-arguments-and-get-arguments) that functions support though. However, neither Rebol nor Red leverages them as much as they could.**

**`>> add*: func [x :y][add x y] == func [x :y][add x y] >> add* 1 2 * 3 ; could be 9 *** Script Error: * operator is missing an argument *** Where: catch *** Stack:`**

**With operators it's even worse https://github.com/red/red/issues/3344.**

**gltewalt**

**[02:29](#msg605fe9fc2beb1e1da3d63894)`and` vs `~and`**

**gltewalt:matrix.org**

**[02:38](#msg605fec3828e6153d724ae2a7)Errrr, and~**

**rseger**

**[02:58](#msg605ff0eb563232374c4bb289)ooo, prefix options. I can totally get into trouble with those.**

**I just want to make sure it's known, I'm not advocating for any changes to Red. That said, left-to-right strict applicative order as the sole determining factor for precedence would have had that equal to 9. Infix notation itself already undermined the purist left-to-right evaluation though. I simply thought "only math stuff" was the exception. Not because I read that anywhere, just 'cause that's where my head was.**

**greggirwin**

**[04:29](#msg6060063df07ffa1eb56e2d0c)@rseger it is another hurdle you've now passed. :^) But just like modifying the series you're parsing, playing with ops in creative ways, or using literal args with them (as @9214 and @hiiamboris can tell you) can lead to fun experiments where you here a loud boom and your hair is smoking, but you still find a smile in your face and want to try it again.**

**gltewalt**

**[05:54](#msg60601a2ef07ffa1eb56e59b3)I decided not to directly assign to `results-txt/data` in my little tool, and this delayed updating is driving me absolutely nuts...**

**[05:54](#msg60601a2f28e6153d724b4d75)https://imgur.com/a/L7V7SKD**

**[05:56](#msg60601a8588edaa1eb8e6c332)The value is already true, but will not update the text until another entry is made in the rule field**

**ne1uno**

**[06:00](#msg60601b7733346c16277fb85e)try `react`?**

**gltewalt**

**[06:01](#msg60601b9d3a9448256c355e4c)I didn't want to have to go there. That might be the answer**

**[06:02](#msg60601bdf3a9448256c355eb2)comment out the `#include` line and someone who wants to share my pain can run what I have right now.**  
**https://gist.github.com/gltewalt/ae85c7973124b7c18da72b127f078430**

**[06:04](#msg60601c74563232374c4c1845)I... just don't understand the delay.**  
**(I don't understand a bunch of things, but this in particular. It's probably something obvious to someone else, and it's just my usual boneheaded self)**

**hiiamboris**

**[07:48](#msg606034c73a9448256c359762)There's a great approach to debugging such issues: continuously remove stuff from your script until the issue disappears. After that it usually becomes clear as day ;)**

**gltewalt**

**[09:03](#msg6060465d68921b62f49034ee)I gave up for now.**  
**Went back to `result-txt/data: append copy "Parse result: " mold parse/trace ... yadda yadda...`**

**Rebol2Red**

**[14:54](#msg606098bf88edaa1eb8e7f864)Maybe a silly question. Can someone explains what --cli does? I know cli stands for command line interpreter. But what does it really do? Only reading the code from a file and interpret them or compiling in memory or ...?**

**hiiamboris**

**[15:04](#msg60609ae8ac0fd631ca99b09c)try `red --cli` vs just `red`**

**Rebol2Red**

**[15:07](#msg60609bbec1e10242c5cc90ea)I see red interprete and --cli compiles but what is doing the compilation? What is needed for this etc..?**

**hiiamboris**

**[15:09](#msg60609c13ac0fd631ca99b43b)nothing needed, Red extracts the console sources and builds the console**

**Rebol2Red**

**[15:11](#msg60609cabbc554b42d62d96d9)You mean there are two ways to compile: red-console and red-gui-console (Red \[needs: View] and these are made by Red.exe according to the source? Correct me if i'm wrong. And when are dll's needed? Like to see some documentation (schematics) on this.**

**9214**

**[15:17](#msg60609df5563232374c4d62ca)@Rebol2Red From \[here](https://github.com/red/red/wiki/\[NOTE]-Anti-virus-false-positives).**

**As of `0.6.4`, on the first launch toolchain acts as an installer by doing the following:**

**1. Compilation of dynamic compression library which is then used to pack RedBin data; this happens because Red compiler depends on Rebol2 SDK during the bootstrapping phase, which can interact with native code only via `load/library` FFI.**  
**1. Compilation of Red console, which serves as a gateway to Red interpreter; this happens because Red strives to provide a go-to solution and cover all programming needs, from high-level scripting to low-level coding.**

**The above is done transparently to the user, with a dynamic library and console executable being placed in the `%AppData%` folder.**

**---**

**Besides, all toolchain flags are documented (see `red --help` output).**

**Rebol2Red**

**[15:23](#msg60609f5b88edaa1eb8e8088c)This does not make it very clear to me what's going on. :P. Rather see some if...then....**  
**Like: If your source contains Red \[needs: View] then a gui-console is made by Red.exe blah blah blah... Never mind. I can use it without the background information :)**  
**for ex. --dlib Generate a shared library from the source file.**  
**Is this compatible with C or Pascal?**  
**--encap ???**

**9214**

**[15:27](#msg6060a07d88edaa1eb8e80af8)&gt; If your source contains Red \[needs: View] then a gui-console is made by Red.exe**

**These are completely unrelated.**

**Rebol2Red**

**[15:30](#msg6060a1113a9448256c36a666)Maybe but if things are not clear you make your own assumptions.**

**hiiamboris**

**[15:36](#msg6060a27cf07ffa1eb56faecc)Things are clear if you know what the terms mean ;)**

**Rebol2Red**

**[15:38](#msg6060a2f668921b62f491299f)What if I say I don't know what the terms mean? Am I stupid then?**

**hiiamboris**

**[15:38](#msg6060a3133a9448256c36ad49)Then you can ask Google :)**

**[15:39](#msg6060a31f3b9278255bdc8bac)or us :D**

**Rebol2Red**

**[15:39](#msg6060a3482beb1e1da3d801ca)No. You always make things overcomplicated. Why the hell? Afraid you are not the only one who know things?**

**hiiamboris**

**[15:43](#msg6060a42033346c1627811b82)No need to feel offended. I'm just seeing merit in the design. It does not seem complicated at all to me.**

**Rebol2Red**

**[15:48](#msg6060a53028e6153d724ca5f8)Glad you can understand this. Maybe they can do some restrictions over here for people with a certain IQ? Say above 200 will be fine? But hey I don't feel like this anymore. I hope that Google translated this in a right way.**

**hiiamboris**

**[16:05](#msg6060a9552beb1e1da3d811a2)Look at this from our perspective too. You're asking questions (like `--cli`) when you didn't even try it out yourself. Nor did you obviously try to read the `--help` output which states the purpose pretty clearly: `Run the command-line REPL instead of the graphical console.` I don't even know what to add to that phrase, it's so precisely written. I'm trying to direct you into more experimentation, because that's how people learn. And that just offends you instead. @9214 gave you an extensive answer, and you didn't bother to make the effort to understand it. That's not productive. Don't be afraid to ask, but have enough respect to do your own research first, and to consider what info we're offering instead of just dismissing it as too complex.**

**gltewalt**

**[16:37](#msg6060b0dd28e6153d724cc4a0)From what I remember of Windows, two consoles get created to act as hosts to the Red interpreter. If you download a fresh version and run it with `.\red.exe`, it will compile the GUI console. If you quit that new console, and type `.\red.exe --cli`, it will compile the CLI console. From that point forward, the default console for the REPL for Windows is the GUI console. Interpreter will run through the CLI console with `.\red --cli`**

**[16:40](#msg6060b1678478e061b967697b)The `--cli` option has no bearing on programs that you compile after the two consoles are built.**

**Rebol2Red**

**[17:04](#msg6060b71ac1e10242c5ccd748)@hiiamboris I have never run a program as --CLI and never looked at --help**  
**REPL = Read Eval Print Loop - in case you didn't know that.**

**@gltewalt Thanks, Clear. This is something I can understand.**

**greggirwin**

**[19:10](#msg6060d4b83a9448256c373258)Thanks @hiiamboris @9214 and @gltewalt for helping. Communication is hard @Rebol2Red, and we will quite often ask people to try thing on their own because seeing things in action makes things clear in many cases. If people make suggestions, assume they are trying to be helpful. We all think differently and have different backgrounds. Ultimately this is a good thing, but it can be hard at times too.**

**Rebol2Red**

**[21:01](#msg6060ee9d28e6153d724d63a8)"I have never run a program as --CLI and never looked at --help" This was meant to be sarcastic. I try a lot of things on my own. More and more after the experiences I have after asking questions over here. I am not going to ask or post things anymore.**

**greggirwin**

**[21:12](#msg6060f13a28e6153d724d6ae8)I didn't pick up on the sarcasm, and language and culture differences come into play. It's also hard to remember sometimes who tries things and who doesn't. We all just have to assume good will and exercise patience at times.**

**Rebol2Red**

**[21:17](#msg6060f280ac0fd631ca9a97be)Ha, Did you assume that was true? That is wat bothers me the most. Belittling and arrogance.**

**hiiamboris**

**[21:31](#msg6060f595679f465566a97da9)One good acquaintance of mine once wrote in his book that if you choose someone who bothers you the most and write his worst qualities down like "he is this and he is that ..." (or "they are"), and then if you replace "he is" with "I am" and read it back, you'll get a clearest depiction of yourself.**

**greggirwin**

**[21:32](#msg6060f5ebf8add214d8ff7c49)You said it, I didn't know it was sarcastic, so I did assume it was an honest statement. I don't know how that's being arrogant or belittling anyone. But then, I could be arguing on my own time. ;^) Now I don't know if I can even safely make that reference without offense. :^/**

**[21:32](#msg6060f60914188a5edfcee4b6)@hiiamboris is very clever, trying to get me to be less verbose with that message. ;^)**

**hiiamboris**

**[21:33](#msg6060f62fc1c67842a3f42ee2)You see me through, damn ;)**

**greggirwin**

**[21:33](#msg6060f642f8add214d8ff7c9e)Because you are very clever, if I may so compliment myself.**

**rseger**

**[21:34](#msg6060f6828ebd6869504f2984)if you don't mind my asking, which book is that?**

**hiiamboris**

**[21:35](#msg6060f6a956debe325c495301)@greggirwin OK, I'll leave you to it and watch some anime instead.**  
**@rseger it's in Russian, so probably no point in linking it..**

**rseger**

**[21:36](#msg6060f6d90613c4694923083e)sad times. I think I would have enjoyed it**

**greggirwin**

**[21:37](#msg6060f71f6831fa2647cfceae)I've seen similar phrases before. Very hard to be original. I think the Greeks pretty much covered everything. The Dale Carnegie book is a classic of course, and an easier read than Aristotle.**

****Monday 29th March, 2021****

**gltewalt**

**[00:24](#msg60611e52af65792631b1331b)Speaking for myself, I make myself accept the occasional period of discomfort or embarrassment if I ask questions or ask for help. More often than not, Im the source of my own discomfort, 'but', not every person is equal in their kindness or equal in their diplomacy. And there are natural language barriers here (to a degree) amplified by text based communication.**

**[00:25](#msg60611e936831fa2647d028c9)My desire to solve a problem or to learn something takes precedence over my ego. Most of the time.**

**[00:30](#msg60611f91f8add214d8ffd295)I think it's better not to assume knowledge level, even if the person has been a user for some time, and just offer a clear description if we can. (I forget things frequently)**

**greggirwin**

**[02:11](#msg6061373447b0403241a5d3c5)+1**

**Oldes**

**[09:01](#msg6061976beb800601df071aa5)@Rebol2Red the difference is that CLI console is using default system terminal (CMD on Windows), while GUI console is actually a \_window_ application. As you seem to have Rebol background... R2 is GUI based console while R3 has CLI type of console. Both have its pluses and minuses.**

**Which console is used in compilation is done \[at these lines](https://github.com/red/red/blob/4e862926946d6a8385b1c5ecd5ce2e15bb59bad1/red.r#L444-L455) of the Red compiler. Sources are \[there](https://github.com/red/red/tree/master/environment/console).**

****Tuesday 30th March, 2021****

**snotbubble**

**[05:54](#msg6062bd108ebd68695053ed0f)what does `*** stack smashing detected ***` mean?**

**hiiamboris**

**[07:35](#msg6062d4db1049fe429b8b5b14)Please try to isolate the code that produces this message and report it.**

**[07:36](#msg6062d4ec1049fe429b8b5b27)Looks like you've found a bug.**

**[08:01](#msg6062daf3679f465566ae8834)Also ensure you're running a nightly build.**

**stmungo**

**[13:58](#msg60632e8014188a5edfd4d89b)May I ask which hosting companies are recommended by the Red community, so that I can experiment generating webpages with Red, please? I have seen some suggestions before but could not find them again. Thanks.**

**[14:12](#msg606331b6c1c67842a3fa2036)Is there any facility for me to sponsor an expert Red programmer to write some mezzanine higher-order functions for functions for Red, and if so how would I go about this? I want to program in a purely functional composition style.**

**hiiamboris**

**[14:29](#msg606335e114188a5edfd4f203)If you have a design for such functions, nobody will write them better than yourself.**  
**I did some experiment in the field some time ago: https://github.com/hiiamboris/red-pure-fun**  
**But that was for fun, and I wasn't an expert back then, and I never used it because it's much slower. IIRC the biggest problem was that I had to change the evaluation rules, and that means writing an interpreter within an interpreter. And that isn't going to be fast ;)**

**9214**

**[14:32](#msg6063368b8ebd686950553ef4)@snotbubble it's a GCC error, not a Red-generated one. It happens when there's a buffer overflow and native stack content gets overwritten. Likely comes from one of the low-level `libc` bindings.**

**hiiamboris**

**[14:33](#msg606336adaf65792631b6eaff)HOF work is underway, but as you might expect we're writing HOFs that are more idiomatic for Red than just copying the design from Haskell. Most useful HOF for me is `map-each`, you can find it \[here](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/map-each.red) along with some other experiments.**

**stmungo**

**[15:21](#msg606342093bc21d01dd536974)@hiiamboris thanks for the links to your experiments. I will code up my specs for the HOFs I desire as you suggest.**

**rebolek**

**[16:04](#msg60634c1dc1c67842a3fa706d)@stmungo re: generating web pages with Red: You can use whatever hosting that lets you use CGI. I personally use just VPS, install some Linux on it and Run either lighttpd (or apache, but I prefer the former) or, with the new IO branch, Red native webserver. If you have any questions, feel free to ask.**

**stmungo**

**[16:44](#msg6063558614188a5edfd54fbd)@rebolek Thank you for your recommendation which I will pursue. I understand (now) that a VPS service is widely available but wondered if you recall the internet hosting company which was mentioned one or more years ago which was Red friendly, or else recommend one, please?**

**9214**

**[16:49](#msg606356a30613c4694929635b)WRT CGI, there's also \[this](https://github.com/red/red/wiki/%5BDOC%5D-Using-Red-as-CGI).**

**rebolek**

**[17:00](#msg60635939679f465566afef88)@stmungo if there was some Red friendly webhosting, I don’t remember it, sorry. But for VPS, every provider is Red friendly :) I use Linode, but just because I’m used to it, other providers should be good as well.**

**rseger**

**[17:59](#msg606366f51049fe429b8cf843)is there a way to flush the buffer that `print` uses while executing? I've noticed that when executing from the repl, nothing will be printed until control is returned to the repl :(**

**9214**

**[18:03](#msg606367f3af65792631b7832e)@rseger that's not `print`-related, see https://github.com/red/red/issues/2627. Try CLI console instead.**

**rseger**

**[18:04](#msg606368220613c46949299906)that's the workaround I'm currently using - good to know it's currently the option :)**

**hiiamboris**

**[18:08](#msg6063692a14188a5edfd58e59)**  
**`native-print: :print print: func [value [any-type!]] [native-print :value do-events/no-wait ()]`**  
**(dangerous if you have a `print` in the timer event)**

**[18:09](#msg60636970af65792631b786c2)One more way is build a debug (`-d`) version of GUI console that prints both to the terminal and to it's GUI window.**

**ne1uno**

**[18:15](#msg60636aab0613c4694929a0d1)you can build old gui console, is non blocking, has a few minor bugs on exit**

**hiiamboris**

**[18:21](#msg60636c29679f465566b029bc)hmm.. how does it achieve non-blocking output if it's the same process that runs the code?**

**[18:28](#msg60636dbf56debe325c500ad1)I just checked - it does block.**

**ne1uno**

**[18:31](#msg60636e7acfd0b814ebaf0c0e)new gui you need to click to focus before anything prints.**

**[18:31](#msg60636e7aeb800601df0c569f)another option, adding `needs: view` then building cli console was described in red/bugs awhile ago**

**[18:33](#msg60636f0514188a5edfd59ddc)it is probably more non blocking in the cji console**

**hiiamboris**

**[18:34](#msg60636f1d0613c4694929ab21)&gt; new gui you need to click to focus before anything prints.**

**is this XP bug? I've never seen it**

**ne1uno**

**[18:52](#msg60637353c1c67842a3fae93b)new gui grabs focus now? I've only used win7 or win10 and usually use old console.**

**[18:52](#msg606373531049fe429b8d1c39)recently new gui console may not even show if there is no printing and exits on `no-wait` the behavior has improved in some ways**

**hiiamboris**

**[18:53](#msg606373c056debe325c5019d4)it doesn't grab focus but renders the text when it returns from user code into it's own `do-events` loop**

**rseger**

**[18:53](#msg606373c4940f1d555e2b055b)I was speaking to the use case of having the repl up and just running the code in it, rather than executing red and the repl popping up afterward. The --cli option works perfectly, you just don't get the GUI with it is all. Not a significant problem, I just thought the issue might be on my end and not understanding `print` well enough.**

**ne1uno**

**[18:55](#msg60637428940f1d555e2b0653)I think many 'live inside the console' don't use red like many others do, just to run scripts.**

**rseger**

**[18:58](#msg606374c5cfd0b814ebaf20af)just handy for debugging/learning, for me anyway. I've gotten so used to repls I now loathe having to use languages without them**

**greggirwin**

**[18:59](#msg606374f947b0403241ac0832)We all want it fixed, but it isn't quick and easy, while the workarounds aren't too painful. It's another good topic for people new to Red we can wikify.**  
**- For console output heavy uses, `--cli` is your friend.**  
**- GUI console has this limitation but can still work in many cases. e.g. debug output for GUI apps.**  
**- Work around by hacking `print` with known caveats.**

**[19:00](#msg6063754756debe325c501ee7)This is also something for us to consider from a design standpoint in IDEs and other tools. There are a lot of approaches and different tradeoffs.**

**gltewalt:matrix.org**

**[19:00](#msg606375680613c4694929bcbf)What is to consider?**

**greggirwin**

**[19:03](#msg6063761447b0403241ac0b9c)- Prioritizing output versus slowing other parts of an app.**  
**- Filtering output mechanism(s).**  
**- Hooking event loops or a cooperative tasking system.**  
**- Queueing system.**  
**- Alignment/overlap with logging.**  
**- Output rendering options.**  
**- More I'm sure.**

**ne1uno**

**[19:04](#msg606376490613c4694929c156)spinners**

**[19:05](#msg6063767156debe325c50221f)I just aged myself**

**gltewalt:matrix.org**

**[19:05](#msg6063767eaf65792631b7b0a1)Start with non blocking IO?**

**[19:07](#msg606376dd47b0403241ac0d4a)Little running dog graphics for like the old fetch ftp app?**

**hiiamboris**

**[19:08](#msg606377151049fe429b8d2674)GUI console drawing code should be in a separate process. Two Red interpreters - one running user code, another - console itself. Communicate via pipes.**  
**It's actually doable today with some hacking, even without ports. Just using file I/O.**

**greggirwin**

**[19:09](#msg6063778556debe325c502561)As @hiiamboris noted, we have a lot of HOF experiments, but want to think about the big picture. What can we nail down that we feel secure about, and what are the unknown unknowns. My own HOF tinkerings (idiomatic, functional, FRP/streams, observers, visitors, aggregates) are very old, but I only recently thought of another possible design view: Flow Based.**

**@ne1uno :^)**

**Yes, IPC and async are other major architectural possibilities.**

**[19:12](#msg60637827c1c67842a3faf73b)@hiiamboris I've used file-based IPC a lot in the past, and also file-based DB systems. When you have a lot of small fields and a few big ones (e.g. images), it can work well to manage the small stuff yourself and let the OS handle the big stuff.**

**gltewalt:matrix.org**

**[19:13](#msg6063783f1049fe429b8d28fd)You want a copy of a haskell book pdf or two?**

**greggirwin**

**[19:13](#msg606378508ebd686950561749)Nooooooo! ;^)**

**rseger**

**[19:13](#msg60637857af65792631b7b47c)lol**

**gltewalt:matrix.org**

**[19:13](#msg606378686831fa2647d6a6f4)HoF, you know**

**[19:14](#msg606378ac6b7b535ee1e87986)I got about half way learned in it, the came back here and Red takes all my attention**

**[19:15](#msg606378b9940f1d555e2b13d1)\*then**

**greggirwin**

**[19:15](#msg606378cd0613c4694929c80c)Oh, I know. Whenever I feel masochistic I look at Haskell again. Not an insult to the language, but it hurts my head.**

**rseger**

**[19:20](#msg606379f76831fa2647d6abb1)glad I'm not the only one :)**

**Respectech**

**[19:42](#msg60637f2c679f465566b06346)Me also.**

**stmungo**

**[20:34](#msg60638b72af65792631b7ed3f)@greggirwin I echo your comments about Haskell. When I look at a programming language one of the questions I ask myself is what would it be like to teach it, not to computer science university students but rather interested persons like liberal studies students, or managers. Needless to say I would much rather present Red. Imho I suspect the problem set where Haskell shines is not congruent with most programmers' needs but I may be wrong. I also note your comment about the idea of flow-based design view. I hope to impliment a flow-based programming language design using Red. If I succeed, I will inherit the USPs of Red at a stroke. As you may imagine, I wish the Red project well, as I have seen nothing that approaches it in power and eloquence!**

**[20:40](#msg60638ca1f8add214d806698c)@rebolek Thank you for the suggestion of Linode.**

**ne1uno**

**[20:53](#msg60638fc96b7b535ee1e8bbac)https://wiki.haskell.org/Humor/LearningCurve I found the learning curve exponential, maybe I never found the proper docs? it is a fun language to stop learning**

**greggirwin**

**[23:16](#msg6063b1460613c469492a5ec9)@ne1uno that's pretty funny. I like Crockford's Monad and Gonads talk, where he says the curse of the monad is that once you understand it you lose the ability to explain it to anyone else.**

**[23:18](#msg6063b1af14188a5edfd6560d)@stmungo the teaching aspect is one we don't think about enough. What I hope people will see more as Red spreads is that we're not trying to be the \*only* language, but that we need a lot of languages and it's good for exploring them. Also, critically, just because your languages are different, it doesn't mean that your alphabet has to be.**

**dukereg\_gitlab**

**[23:29](#msg6063b44c6b7b535ee1e91818)Hi there. I am inclined to do all my programming on my phone. Is there a native Android or mobile-browser-compatible implementation of Red?**

**greggirwin**

**[23:30](#msg6063b4b3c1c67842a3fb9910)Our Android branch got a lot of updates not long ago, but is still out of date. Others may have more specific details of what version you can try, but it will be stale by daily build standards.**

****Wednesday 31st March, 2021****

**snotbubble**

**[01:46](#msg6063d486af65792631b89e59)@9214 @hiiamboris got it thanks. hasn't happened again, so can't send offending code yet.**

****Thursday 1st April, 2021****

**rseger**

**[04:13](#msg6065484cdb595f5599ca323d)I'm thinking this already exists and I just couldn't find it but I wrote a recursive directory traversal (depth first) with a callback. Effectively allowing you to map a function across the (generated) list of filenames in that tree. I'd love a pointer to anything more idiomatic, and any feedback about where my ignorance is showing in the code :)**  
**`dir-map: func [base-dir callback] [ foreach filename read to-file base-dir [ if ((back tail filename) = "/") [ dir-map rejoin [base-dir filename] :callback ] callback rejoin [base-dir filename] ] ]`**

**toomasv**

**[04:46](#msg6065500956ddab18d720ea6d)May be this:**  
**`dir-map: func [base-dir [file!] callback [any-function!]] [ foreach filename read base-dir [ file: rejoin [base-dir filename] if dir? file [ dir-map file :callback ] callback file ] ]`**

**[04:48](#msg6065508e15cd52559d71894c)My early \[dabbling](https://gist.github.com/toomasv/f2bcf320800ca340379457c1c4036338) in similar area.**

**hiiamboris**

**[08:33](#msg60658547657d022d5a56221b)see also https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/glob.red but no mapping there, just listing (that you can later "map" with foreach)**

**[08:34](#msg606585ab3153ce63a3b155a4)readme here: https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/glob.md**

**rseger**

**[15:45](#msg6065eaae156d1f51d8c58d40)is the `[file!]` after the first arg a type requirement @toomasv?**

**[15:48](#msg6065eb5b156d1f51d8c58eda)also, I didn't see dir? in the help when I looked for it in the repl. Is there a rule of thumb there I'm missing or just a loose end in the docs?**

**hiiamboris**

**[16:24](#msg6065f3cb3153ce63a3b2883c)try `? "dir"`**

**rseger**

**[16:28](#msg6065f4c192a3431fd66bd173)same as `help dir` unfortunately,**  
**`>> ? dir USAGE: DIR 'dir DESCRIPTION: Display a directory listing, for the current dir if none is given. DIR is a function! value. ARGUMENTS: 'dir [any-type!]`**

**hiiamboris**

**[16:29](#msg6065f4eb63fb5651c1e4761b)missed the quotes obviously**

**rseger**

**[16:29](#msg6065f4fe0508990a25ca6a92)ooooooh**

**[16:30](#msg6065f519db595f5599cc0e25)that's what I thought vanilla `help` was doing**

**[16:30](#msg6065f5260508990a25ca6ac3)wow, that's going to help a lot**

**[16:30](#msg6065f5299ecc541fc8ceaffe)thank you!**

**hiiamboris**

**[16:30](#msg6065f53189446618e97d54ff)you're welcome (:**

**rseger**

**[16:31](#msg6065f56392a3431fd66bd445)for posterity, might I recommend updating `help help` to include a note about that?**

**hiiamboris**

**[16:31](#msg6065f57215cd52559d734dac)if you just type `help` it tells you that you can do that**

**[16:33](#msg6065f5cc9ecc541fc8ceb1a6)simplest things are so hidden in plain sight ;)**

**rseger**

**[16:33](#msg6065f5f015cd52559d734fe9)yep, there it is. Recommendation stands - obviously some subset of newbies won't realize there would be a difference between `help` and `help help`**

**hiiamboris**

**[16:34](#msg6065f618d765936399ca6c54)where does `help help` even come from? I never ever had the idea to type that in**

**rseger**

**[16:36](#msg6065f67692a3431fd66bd74a)`help 'word` gives me information about how to use that word. I wanted to know how to use `help` so I asked for information about how to use that word. Not the expected thought process but seems a legitimate, and likely common enough to address, one**

**[16:37](#msg6065f6b50147fb05c5ce7090)by my way of thinking `help` would be about the system generally, not the specific command. Would be like `print` without arguments showing `help print`**

**[16:38](#msg6065f702156d1f51d8c5b100)I don't have any complaint with `help` being an exception to the separation of command and help about it, it's obviously something people think differently about, but it is an oddity that way**

**toomasv**

**[16:39](#msg6065f74f9ecc541fc8ceb6af)@rseger**

**&gt; is the \[file!] after the first arg a type requirement**

**Yes. Here is grammar of function's spec:**  
**`function-spec: [into [opt legend any variable any refinement opt return opt locals-and-externs]] variable: [var opt type opt legend] var: [word! | lit-word! | get-word!] type: [ahead block! [into [ 'function! function-spec | some datatype-or-typeset ]]] datatype-or-typeset: [set typ word! if (find [datatype! typeset!] type?/word get typ)] legend: [string!] refinement: [not [quote /local | quote /extern] refinement! opt legend any variable] return: [quote return: type opt legend] locals-and-externs: [locals opt externs | externs opt locals] locals: [quote /local opt legend any variable] externs: [quote /extern opt legend any variable]`**

**hiiamboris**

**[16:45](#msg6065f894156d1f51d8c5b5b3)`return` doesn't have to come in that order does it?**

**rseger**

**[16:47](#msg6065f9160508990a25ca74b9)I appreciate it. That will be most helpful for trying to learn the right vocabulary, always a really good thing, but it's opaque to me with regards to what any of those things actually mean/does**

**hiiamboris**

**[16:49](#msg6065f98f15cd52559d7359bd)Maybe @toomasv just wanted to teach you some Parse ;)**

**rseger**

**[16:50](#msg6065f9dd1dbd860a232644b7)I'm really glad for the experience I've had over the past couple weeks - I feel like I can read and understand the majority of that. Silly to be excited about probably but it was a nice "look at me, all learned" moment :)**

**hiiamboris**

**[16:50](#msg6065f9f2ed315705c2905146):)**

**[16:51](#msg6065fa2563fb5651c1e48422)In general, for the function spec: `any-word!` is the argument/local name, `"string"` is for `help` output of it, `[typeset! datatype!..]` is what value types the argument accepts (defaults to `default!` typeset).**

**rseger**

**[17:01](#msg6065fc5adb595f5599cc22cd)I believe my read is right in that you can not have multiple allowed data types. So `[string! | file!]` would not work, nor `[string! file!]`. That said, I wanted to check: can you specify multiple allowable data types or is it a one vs everything choice?**

**hiiamboris**

**[17:03](#msg6065fcd192a3431fd66be98e)you can always try it yourself and see - that's what console is for ;)**

**[17:03](#msg6065fcf13153ce63a3b2a0e7)`[string! | file!]` is a Parse syntax though, not for the function spec**

**toomasv**

**[17:06](#msg6065fd9b458fc52d5f246131)@hiiamboris**

**&gt; return doesn't have to come in that order does it?**

**I don't remember now where did I get the order. At least it is kind of standard. I haven't met any function yet where it is different.**  
**@rseger You can try it out by pasting this grammar to console (please edit the `function-spec: [opt legend any variable any refinement opt return opt locals-and-externs]` - I copy-pasted it from DiaGrammar and forgot to edit)**  
**Then do e.g.**  
**`spec: spec-of :find parse spec function-spec`**  
**I chose `find` because it has long spec.**  
**Then try to edit different rules and see what happens :)**

**[17:09](#msg6065fe3eed315705c2905c2d)About datatypes and typesets \[this](https://github.com/toomasv/red-type-hierarchy/blob/master/Red%20type%20hierarchy3.png) may be of help too.**

**hiiamboris**

**[17:11](#msg6065fed892a3431fd66bf074)&gt; I don't remember now where did I get the order. At least it is kind of standard. I haven't met any function yet where it is different.**

**https://github.com/red/red/pull/4347#issuecomment-697303029 ?**

**toomasv**

**[17:17](#msg6066001b3153ce63a3b2a9f4)Ok, thanks.**

**GalenIvanov**

**[18:05](#msg60660b5f156d1f51d8c5ed46)@rseger About `?` / `help` - do you know that pressing `Tab` in the GUI console while you type gives you a list of all words starting with what you have typed? `? di` `Tab` would give you `difference dir dir? dirize distance? divide` - that way you wouldn't have missed `dir?`**

**[18:07](#msg60660be589446618e97d967b)@toomasv Thank you for the grammar of function's spec. (I expected to see a diagram though :smile: )**

**toomasv**

**[18:08](#msg60660c399ecc541fc8cef5e7)@GalenIvanov Here you go**

**[18:09](#msg60660c56156d1f51d8c5efd4)\[!\[image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/66Fh/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/66Fh/image.png)**

**GalenIvanov**

**[18:10](#msg60660c82db595f5599cc5159)@toomasv Tank you for the prompt reply!**

**toomasv**

**[18:11](#msg60660cc3156d1f51d8c5f0af):)**

**rseger**

**[18:11](#msg60660cdf1dbd860a23267ace)I was not aware of that @GalenIvanov I knew it did auto complete, wasn't aware that would transition to search. For insight into my way of thinking, that kind of thing would be in the naked `help` notes :)**

**regardless - thank you!**

**GalenIvanov**

**[18:12](#msg60660d2192a3431fd66c1aeb)@rseger You're welcome!**

**greggirwin**

**[18:24](#msg60660ff2657d022d5a57a72e)The autocomplete behavior is part of the console, not `help` itself. We could add real help to the GUI console menu as an option. That doesn't help the CLI console, but you can use one to learn for the other. We could also dump some top-line intro material on startup, but I think most people want a clean console after a very short time. That leads to things like `--quiet` options, but that's more work for everyone after their bootstrap phase.**

**We can think in another way too, keeping in mind that with an command approach it's always hidden until you know the word you're looking for. If we add a `console` function, it could have a help command, wrap the context, and let you do a few other things. Then the Help menu just calls `console help` which dumps output; no fancy help dialog needed. Or we call the func `console-help` so partial `help` searches can find it for either word.**

**rseger**

**[19:09](#msg60661a8663fb5651c1e4e20b)just taking `dir?` as an example from one random newbie, knowing the difference between `help dir` and `help "dir"` would have been completely sufficient. In my opinion, how to use `help` is probably the single most important piece of information you could convey to a new user. Having that presented in one form or another at all places a new user might look seems like the ideal way.**

**a quick blurb on startup of the repl "Type HELP for starting information" is great - I knew the command existed which was the first hurdle. In `help` as a component of information about how the repl itself works (or even just the sole piece of information), as that was something I ran very early in my use. I took it to mean "use `help 'word` for all your needs" but clearly not everyone does. And in `help help` as (for some at least) that was also a natural place to look.**

**[19:10](#msg60661abf3153ce63a3b2f121)everything else can be stitched together via the `help` command as makes sense, imo. Just have to make sure to a) get the user there b) teach them how to use it**

**greggirwin**

**[19:15](#msg60661bd163fb5651c1e4e680)I think `help help` just pushes the problem around, and also becomes an exception to the behavior.**

**rseger**

**[19:17](#msg60661c4a89446618e97dc604)I'm missing how it would be considered the exception. Regardless though, we can know with certainty that some subset of new users do in fact try to learn about help there. The cost of simply copying the `help` command seems fairly small.**

**greggirwin**

**[19:20](#msg60661ce5d765936399cadcb2)`Help` on any function shows the interface for that function, nothing more. If `help help` reflects to show more usage information, that's an exception. If we do that, how do you see the spec for `help`?**

**[19:22](#msg60661d6b0508990a25cae0a6)Admittedly, if someone cries Help! it catches your ear, and the more they say it, the more urgent the need, so we could extend this like @rebolek's fun play on escalating error messages. :^)**

**What we \*could* do is add a hint to the doc string, maybe even for the word arg to keep the main one shorter.**

**[19:23](#msg60661dad657d022d5a57cd25)e.g.**  
**`>> ? help USAGE: HELP 'word DESCRIPTION: Displays information about functions, values, objects, and datatypes. HELP is a function! value. ARGUMENTS: 'word [any-type!] "Omit the word arg for HELP usage."`**

**rseger**

**[19:24](#msg60661dfd156d1f51d8c620c8)I can see what you mean (thank you). You have to assume that a user who is executing help does not understand anything. As an example, until just now I didn't realize that was the purpose of `help 'word` at all. I thought it was "here is everything we think you should know about `'word`"**

**hiiamboris**

**[19:30](#msg60661f54657d022d5a57d1b7)(I'm the dumb user)**  
**(starting console)**  
**Saw: `Type HELP for starting information.`**  
**Typed: `help` ENTER**  
**(shows me how to use `help "string"` and `help "word"`)**

**What could possibly go wrong?.. Oh yeah, with humans the answer is - everything! :D**

**greggirwin**

**[19:35](#msg60662091d765936399cae7b2)Well, it's not the user's fault. When you don't know what you don't know you can't know what not to try.**

**[19:37](#msg6066210363fb5651c1e4f645)Hence the suggestion to add a Help menu entry as an affordance. With that and the extra doc string, it would at least be better. Other suggestions are welcome, but those seem easy. We can expand the `help` usage content as well, also easy.**

**rseger**

**[19:38](#msg6066211d63fb5651c1e4f6ba)I know this doesn't align with how you think about the system but I promise my assumptions are built on years of experience learning languages. If you have it installed, you can see how python's system works. If you type `help()` it will show you a blurb about the repl and the help command (technically it drops you into a whole system and when you exit gives you the blurb about help). If you type `help("a")` afterward, you'll see a short blurb helpfully indicating that you probably want `help(str)`. When you run that you get a blurb about what it is, all the methods, usage information, etc.**

**in Red, `help string` offers what appears to be a list of functions which have `string` in them. That's not the case but it was the assumption I took away when applying my experience with other help systems to what I initially experienced with Red's.**

**[19:38](#msg6066215015cd52559d73d03d)Red's system isn't wrong, nor should it be identical to other systems, but it does need to recognize the baggage new users are coming in with and (hopefully) accommodate some of it**

**greggirwin**

**[19:41](#msg606621f60147fb05c5ceed5c)Here's the great thing about `help`: it's a mezzanine. You can see all the source, play, and create alternatives.**

**[19:45](#msg606622d90147fb05c5ceef51)It's always a hard call, balancing what helps people familiar with other systems and what carries forward legacy weight with less value in Red. This is where people familiar with other systems can write tools to help their compatriots find a way out of the cave.**

**I'm also very keen on interrogative interfaces.**

**rseger**

**[19:46](#msg606623253153ce63a3b308a0)`help` is great, I don't see any need to change it. I simply wanted to advocate for a different perspective and a tweak in how one might stumble on proper usage based on pre-existing assumptions coming from other languages. I'm a newbie - one of the only things I can offer is a fresh perspective :)**

**greggirwin**

**[19:47](#msg6066234789446618e97dd86f)Which has enormous value.**

**[19:48](#msg6066238f15cd52559d73d71a)If others agree that the doc string change is good, we've made a small improvement. Next, adding a console Help menu option that shows console tips, or links to a doc page for it, makes sense.**

**hiiamboris**

**[20:14](#msg6066298f657d022d5a57eee0)doc string change +1**

**gltewalt:matrix.org**

**[22:44](#msg60664cca89446618e97e4ada)What change?**

**greggirwin**

**[23:01](#msg606650b00147fb05c5cf6ab2):point\_up: https://gitter.im/red/help?at=60661ce5d765936399cadcb2**

**[23:01](#msg606650b5458fc52d5f254873)I PRd it.**

****Friday 2nd April, 2021****

**snotbubble**

**[00:03](#msg60665f3689446618e97e72c4)is there a way to probe a function without running it?**

**I'm trying to put the code of a function into a text area**

**gltewalt:matrix.org**

**[00:04](#msg60665f88ed315705c2917748):function-name**

**[00:04](#msg60665faa156d1f51d8c6da17)?**

**snotbubble**

**[00:08](#msg60666097657d022d5a587778)@gltewalt:matrix.org got it thanks**

**greggirwin**

**[00:09](#msg6066609d156d1f51d8c6dcee)Adding to what @gltewalt:matrix.org said, use `mold`. e.g. `mold :rejoin`**

**gltewalt**

**[00:09](#msg606660d115cd52559d7472dc)If its a 'function!' Maybe `source`**

**greggirwin**

**[00:10](#msg606660f10508990a25cb91fa)`Source` doesn't return it for further use. It just prints it.**

**gltewalt**

**[00:11](#msg60666133458fc52d5f256d31)Yeah, good old unset**

**[00:12](#msg6066616d89446618e97e7714)`source source` 😉**

**[00:19](#msg6066632089446618e97e79d0)`your-text/data: mold get/any 'function-name` ?**

**[00:20](#msg6066633692a3431fd66cfe4e)Or is that unnecessary?**

**greggirwin**

**[01:13](#msg60666fc50147fb05c5cfb4ab)It's more to read and write, if you're passing function \*refererences* around as words, then that's the way to go. Otherwise get-word syntax is clear and concise `view compose [area (mold :rejoin)]`**

**snotbubble**

**[03:56](#msg606695ee15cd52559d74e019)how to get at contents of objects in a series? this fails:**  
**`a: [ b: context [ bb: "one" ] c: context [ cc: "two" ] ] probe a/1/bb`**  
**also : is there a way to do foreach for objects? similar to foreach-face for layouts**

**Oldes**

**[03:59](#msg606696b43153ce63a3b40ff3)In your case.. a is just a block with no objects inside. You must use `compose` or `reduce` to get a block with constructed objects**

**gltewalt:matrix.org**

**[04:05](#msg606697f2657d022d5a58f0f7)You can iterate `words-of`, `body-of`, `values-of`**

**snotbubble**

**[04:08](#msg606698cc657d022d5a58f2be)@Oldes got it thanks**  
**`b: context [ bb: "one" ] c: context [ cc: "two" ] a: compose [ (b) (c) ] probe a/1/bb`**

**[04:16](#msg60669aa963fb5651c1e61848)@gltewalt:matrix.org awesome this works thanks!**  
**`a: context [ b: context [ mm: "one" ] c: context [ mm: "two" ] ] foreach n values-of a [ probe n/mm ]`**

**GalenIvanov**

**[06:34](#msg6066bad892a3431fd66dc7fd)I wrongly connected the autocomplete feature with `help` - I just wanted to indicate that it's useful with `help` too. I'm sorry if I've confused anyone.**

**Oldes**

**[08:50](#msg6066dab863fb5651c1e6b012)@snotbubble `compose [ (b) (c) ]` is same like `reduce [ b c ]`. Use `compose` if you need to evaluate only some expressions or nested expressions (`compose/deep`)**

**rseger**

**[16:00](#msg60673fa3458fc52d5f277c80)I'm messing something up but I can't figure out what :/**  
**`>> a: #{} == #{} >> set a/this 1 *** Script Error: word! type is not allowed here *** Where: set *** Stack: >> put a "this" 1 *** Script Error: put does not allow binary! for its series argument *** Where: put *** Stack:`**  
**I thought I'd pulled those directly from https://w.red-lang.org/en/datatypes/map/#abstract but I've obviously missed something. Help?**

**[16:01](#msg60673ff215cd52559d7684f5)wait, I think I have it `#{}` is the issue, right? Should be `#()` - going to verify**

**[16:02](#msg6067401c3153ce63a3b5ba3a)hmm, set still errors but at least I can put**

**hiiamboris**

**[16:02](#msg606740269ecc541fc8d1f438)`type? #{}` is your friend**

**rseger**

**[16:03](#msg606740669ecc541fc8d1f539)excellent. Any idea why `set a/this 1` would still be failing even though it's (now) a proper map?**

**[16:04](#msg6067408d63fb5651c1e7c22e)`a/this` also doesn't work, returns none when "this" is set to 1**

**hiiamboris**

**[16:04](#msg6067409115cd52559d76867b)does it not tell you in the error message?**

**rseger**

**[16:04](#msg606740a856ddab18d725e7ce)yes, but it's opaque to me :(**  
**`Script Error: set does not allow none! for its word argument`**

**hiiamboris**

**[16:06](#msg606740ec89446618e98091c9)`set` native has arguments, one of em is called "word"**

**[16:06](#msg6067410115cd52559d7687cc)**  
**`>> ? set USAGE: SET word value ...`**

**[16:06](#msg6067411fed315705c2939493)happens that you're passing `none` to it, while it's typeset does not accept that**

**rseger**

**[16:07](#msg60674140db595f5599cf547c)makes sense, but "this" is a key in the map**

**[16:07](#msg6067415689446618e98092e4)a/this does return none, set isn't lying about that - I'm confused about why though**

**hiiamboris**

**[16:08](#msg6067416ded315705c293954c)because it's not in the map yet?**

**[16:11](#msg606742201dbd860a23298164)you do get that when you write `set a/this ..` it evaluates `a/this` before calling `set`, yes?**

**rseger**

**[16:16](#msg6067435f92a3431fd66f2707)I'm pretty confident that is the case. But "this" is part of the map**  
**`>> a == #( "this" 1 )`**

**[16:16](#msg6067437a1dbd860a2329845f)I used `put` to get it in there**

**hiiamboris**

**[16:17](#msg6067439492a3431fd66f2775)confusing a word with a string? ;)**

**[16:19](#msg606743ff1dbd860a2329850d)**  
**`>> 'this = "this" == false`**

**rseger**

**[16:19](#msg606744193153ce63a3b5c293)alright, progress - that's the first derp for sure**  
**`>> a/this == 2 >> a == #( "this" 1 this: 2 ) >> a/this == 2 >> set a/this 2 *** Script Error: set does not allow integer! for its word argument *** Where: set *** Stack:`**  
**it feels like I am misunderstanding path notation?**

**hiiamboris**

**[16:20](#msg6067443592a3431fd66f28f7)wait I have a treat for you**

**rseger**

**[16:26](#msg606745be156d1f51d8c904ef)it's amusing how much more I know about parse than red.. such a simple thing to be tripping up on but I've now got a malware linter that's at 100% in our regression tests lol**

**gltewalt**

**[16:26](#msg606745c70147fb05c5d1c4b6)set 'a/this 2**

**rseger**

**[16:28](#msg6067461915cd52559d7693f3)the same thing, twice - I'm really good at this, lol**

**gltewalt**

**[16:32](#msg6067472e0508990a25cdc60a)`a/this` is evaluated, so `set a/this 2` was equivalent to `set 2 2`**

**rseger**

**[16:36](#msg6067480a89446618e980a2df)embarrassingly obvious in retrospect :)**

**gltewalt**

**[16:36](#msg6067482389446618e980a2f9)It's not obvious if you dont know the particulars**

**rseger**

**[16:36](#msg6067482756ddab18d725fa93)on the plus side, I'll likely not forget it!**

**hiiamboris**

**[16:48](#msg60674ac0458fc52d5f279767)you can use this function https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/show-deep-trace.red to visualize the evaluation order:**  
**`>> show-deep-trace [set a/this 2] a/this => 2 set 2 2 => *** Script Error: set does not allow integer! for its word argument *** Where: set *** Stack: show-deep-trace trace-deep rewrite rewrite-next`**

**[16:49](#msg60674afd458fc52d5f27980a)(it has a dependency file though)**

**rseger**

**[16:50](#msg60674b3889446618e980aa5d)oh, I found an answer to a question you'd asked "where did `help help` come from?" it's the newbie docs! https://github.com/red/red/wiki/Beginner's-FAQ**  
**("Try typing help help to see how help itself operates.")**

**^ of no matter, just ran into it trying to figure scoping out**

**[16:50](#msg60674b45db595f5599cf6c9d)I love everything about show-deep-trace - thank you!**

**hiiamboris**

**[16:52](#msg60674bdb1dbd860a23299817)&gt; ("Try typing help help to see how help itself operates.")**

**My mind is a bit like that too.. picking random stuff out of everywhere :)**

**rseger**

**[16:56](#msg60674cb089446618e980ae35)alas I have failed in my quest re: scoping.**  
**is there a special something that I need to do in order to assign a global variable to a new value from a function? The behavior I'm seeing right now appears as though I'm shadowing the global, rather than updating it.**

**hiiamboris**

**[16:58](#msg60674d1a63fb5651c1e7dedf)let me guess.. you have `global: "something"` and you're writing `global: "other thing"` within a `function` body?**

**rseger**

**[16:59](#msg60674d8792a3431fd66f4036)maybe.. :)**

**hiiamboris**

**[17:00](#msg60674dba458fc52d5f279fa5)if so, does `? func` vs `? function` give you any clues?**

**rseger**

**[17:06](#msg60674f3015cd52559d76ad73)booyah! It did (I think).**  
**does `function/extern` remove the scoping affect of the `function` declaration? Effectively making all references to variables, to include creations?, global in scope?**  
**^ that appears to be true based on my tests but I want to make sure I really understand**

**hiiamboris**

**[17:08](#msg60674f96458fc52d5f27a3c1)after you've defined your `my-fun: function [..]` type `? my-fun` and inspect it's spec**

**[17:09](#msg60674fcc56ddab18d7260e6f)`func` is the core function constructor, `function` is only a handy wrapper**

**rseger**

**[17:11](#msg6067503292a3431fd66f4765)I didn't know you could do the ? on your own functions - that's cool. I only see `usage`, `description`, and `arguments` for both `/extern` and "normal" functions though**

**hiiamboris**

**[17:11](#msg6067505ced315705c293b881)my bad, I meant `??` (or `source`)**

**rseger**

**[17:15](#msg60675136657d022d5a5aa92a)woah, that spec is a lot different than in my source. Includes every variable I use (I think), and one `/local`.**

**the `/local` comes right after the name of the argument I'm passing in. So that's a special case and everything else is global scope?**

**hiiamboris**

**[17:16](#msg606751893153ce63a3b5e2d6)yes, if word is not listed in the function spec, it's global (or belongs to some other context)**

**[17:18](#msg606751f756ddab18d726142e)now that you know that `function` collects set-words, there's another way to set global words (without writing set-words and then listing them in /extern) - can you guess what way is that? ;)**

**rseger**

**[17:19](#msg6067520adb595f5599cf7dba)so reading from a variable just silently walks scope, as you'd expect. You have to use the `/extern` refinement explicitly to enable writing to external scopes.**

**[17:21](#msg60675294d765936399cde082)I'm going to try to test in a second but, possibly the inverse? You can use an unrefined `function` definition and include `/extern` after the specific variable you want to enable global scope for?**

**[17:22](#msg606752d315cd52559d76b7d6)hmm.. that did not affect the `??` source as I expected**

**hiiamboris**

**[17:23](#msg6067532d156d1f51d8c925ff)take your time to figure it out ;)**

**rseger**

**[17:28](#msg60675435156d1f51d8c9279e)so, I put the `/extern` refinement \*in front* of the variable in a normal function definition. The `??` source didn't list it as a variable at all (all of the other variables, which read from global scope, were still listed). But it appears to have acted exactly as I expected: writing to it from the function did in fact affect the global scope variable.**

**am I right? Is the `/extern` refinement essentially a toggle saying "most variables are local or extern - I'll let you know the specific exceptions"?**

**hiiamboris**

**[17:31](#msg606754f3db595f5599cf84b1)if by \*normal function definition* you mean `func`, then `/extern` is just a refinement of your function (it only has a special meaning for `function` native)**

**rseger**

**[17:34](#msg6067558a156d1f51d8c92ad7)I meant `function` vs `function/extern` (sorry)**

**gltewalt:matrix.org**

**[17:35](#msg606755ce657d022d5a5ab3f6)`function` words have local scope unless they follow /extern. `func` words have global scope unless they follow /local**

**rseger**

**[17:35](#msg606755ed3153ce63a3b5ee06)^ perfect - a clear way to say what I thought was true**

**[17:36](#msg606756023153ce63a3b5ee1c)a good day for learning thus far**

**greggirwin**

**[20:05](#msg606778f50147fb05c5d2473e)Removed `help help` from wiki. It wasn't 100% clear.**

**[20:42](#msg606781c9db595f5599cff7a6)But there are a couple things to note @rseger. @hiiamboris' treasure hunt will lead you to look for other ways around capturing local words. `Function`'s doc string gives you a clue, along with your earlier evaluation learning.**

**&gt; ...reading from a variable just silently walks scope**

**No. Are you sitting down? Good.**

**In Red, there is no "scope".**

**You will see the terms `scope` and `variable` for comfort at times, and Rebol calls it "definitional scoping". What you have are words that refer to values in some context.**

**"We never free a mind once it's reached a certain age." ...not entirely true**

**https://gist.github.com/9214/cf24ff767f6167ab16203b77b06e2a82**

**You need to run it as a script, not just paste it into the console.**

**hiiamboris**

**[20:54](#msg606784950147fb05c5d262f1)wow you have no pity for them rookies @greggirwin**

**rseger**

**[20:55](#msg606784d8156d1f51d8c9a71f)just glancing through that I learned something - you can force arbitrary words in your function definition. `func ['forced var]` the immediate next question is whether you can make that that 'forced word optional or not?**

**I'll definitely be studying this later tonight. Questions coming. You've been warned ;)**

**greggirwin**

**[21:15](#msg60678989156d1f51d8c9b370)If we're gonna scare 'em off... :^) I'm guessing @rseger will focus on their active work, but now the seed is planted.**

**[21:16](#msg606789bf3153ce63a3b6730b)@rseger to make them optional, make your func dialected, so it takes a block of commands, and you just parse that.**

**rseger**

**[21:31](#msg60678d22458fc52d5f283d15)scoping actually messed me up a couple more times before I got what I was working on functional. I was able to get it working, thank you for the lessons, but it definitely doesn't work the way I've been assuming. I'm not yet sure how 'scope' differs from 'values in some context' but I will definitely need to grok that at some level soon - hacking around guessing at how something that doesn't exist works? That's not really sustainable**

****Saturday 3th April, 2021****

**toomasv**

**[13:44](#msg6068714a92a3431fd671d1c2)Another nice \[spoon-bending/binding exercise](https://gitter.im/red/red?at=5a048866d6c36fca31f7f1e0)**

**loza:matrix.org**

**[13:56](#msg606873fb1dbd860a232c302d)@rseger can you give an example of code that surprised you in the subject of scope/context? I could use it in Exercism concept exercise.**

**greggirwin**

**[15:07](#msg6068849563fb5651c1ea944e)Nice catch @toomasv. Maybe @9214 can fill a shelf with spoon examples.**

**rseger**

**[17:30](#msg6068a63756ddab18d7291bed)(I don't fully understand this, really at all, yet)**  
**(and it's edited for brevity)**  
**`global1: [] data: "a" a: func [data] [ global1: [] data: "b" ] b: func [tmp] [ append tmp "just one thing" print global1 a data ] b global1 b global1 b global1 b global1`**  
**those 4 `b global1` calls result in that `print` statement displaying first, two "just one things", then \*one* "just one things", then two, then three.**

**[17:34](#msg6068a73215cd52559d79bc63)oh, at the end, `data` is "a"**

**hiiamboris**

**[17:38](#msg6068a828657d022d5a5db356)seen this? https://github.com/red/red/wiki/\[DOC]-Why-you-have-to-copy-series-values**

**[17:56](#msg6068ac62ed315705c296d575)also what do you think `data: "b"` statement is doing?**

**rseger**

**[21:48](#msg6068e2c563fb5651c1eb6e27)I feel like that both helped and hurt @hiiamboris. lol. Prior to reading that I would have said that `data` was initialized as a pointer to a block of memory wherein the string "b" was stored. Re-executing that command would either create a new string and change the pointer value or no-op depending on efficiency implementation behind the scenes. So, `data: "a"` would absolutely result in a new string and a pointer update to `data` for that new string.**

**Now? Now I'm wondering if the whole thing is basically just one big string and that command is just injecting itself into the string.. At the same time that seems completely wrong. This rabbit hole is \*deep\***

**hiiamboris**

**[22:02](#msg6068e5dd458fc52d5f2b3938)thing is, there's no magical special case here**  
**if you write `if condition [code]` or `do [code]` or `word: [data]` or `word: "data"`, all the series here are treated equally, no exceptions**  
**since there is no separation of code from data, there's no way to know what to copy and what not to (you wouldn't wanna copy the `[code]` block above every time it evaluates obviously, so it applies to what you consider "data" as well)**

**[22:21](#msg6068ea80657d022d5a5e4ef7)Red is no different in static data handling from C and languages inspired by C, by the way. It's strange that people find it so hard to grasp, whereas `char* s = "static data"` looks fine to most.**

**rseger**

**[23:11](#msg6068f6300508990a25d195e3)it's the left hand turn when you start talking about changing data where I'm falling off.**

**x86 assembly was my first programming language. I couldn't wrap my head around BASIC, and didn't have any knowledge/access to C, but for some reason registers/stacks/memory blocks, execution/data pointers - it clicked. I understood the machine, what I was asking it to do, and how it was going to accomplish what I asked.**

**That need to know "how it was going to accomplish what I asked" faded over time. I have absolutely no idea how say sbcl or python's runtime really work under the hood. But I can see in both the limitations and reality of the underlying machine and I use those as the foundation on which to build a more robust understanding.**

**What's been challenging about Red, and this is a fantastic example of it, is that I'll feel as though I've got ahold of one of those pillars, close enough to start building around, and then things won't quite work the way "they should". The foundation still eludes me.**

**gltewalt**

**[23:46](#msg6068fe4356ddab18d729dd84)This could use some volunteers. Last touched in January.**

**[23:46](#msg6068fe491dbd860a232d6cc8)https://github.com/red/red/wiki/%5BHOWTO%5D-How-Do-I-Do-X-with-Red%3F**

****Sunday 4th April, 2021****

**rseger**

**[02:25](#msg6069239115cd52559d7ac7b3)ok, I'm going to try to put the 9214 spoon adventure into my own words. Hopefully not too many but I'd love a gut check if anyone is so inclined.**

**`meditate` is just fun syntactic candy around displaying an object.**  
**`contexts:` creates what might be called namespaces in other languages. The concept is immediately stretched thin as the "namespaces" are literally stored in a block and bound to `contexts`. In each, `'spoon` has been bound to a different string.**  
**`shelf-with-spoon:` is a block of words. Each word assuming the current (global at this point) context and, as yet, entirely unbound.**

**`repeat i ...` is bonkers. A "namespace", context, is selected and forced onto a variable. A word, an unevaluated set of characters in a block, happen to have meaning in these different namespaces. When the word is evaluated, it is done so inside its (newly) assigned context.**

**??? - does a context, set at the beginning of a block, define the context for the rest of the block, unless there is another context switch defined in that block? The first time the above context forcing happens, all of the `spoon` words are evaluated in that initial context? When the second gets its own context, the third is evaluated in it?**

**`append shelf-with-spoons [comma spoon]` global context spoon joined the gang but took his context with him. Except not quite because**

**`set 'spoon bind 'spoon copy third contexts` changes the context of the global spoon to be the third context. That context switch clobbers context for all references to the global spoon?**

**`bind back ...` is bonkers squared. This line is pulling apart the script itself, finding the binding, on line 57, to spoon in the global context, and binding that \*context* to the last word in shelf-with-spoons?**

**`repeat i ...` binds, in each of their now independent contexts, a new meaning to each instance of the word spoon \*and comma\*. So now, in the.. third? context `comma` is no longer `,` but instead `RED`.**

**greggirwin**

**[02:50](#msg6069297e156d1f51d8cd3ada)@rseger coming back to your earlier example, I don't know if this will help or make things worse. It seems like explanations should be easy, but when they're not (not your fault), sometimes we try different things.**  
**`; red' is a block of values, nothing more red': [ global1: [] ; global1 (red'/1) refers to red'/2 data: "a" ; data (red'/3) refers to red'/4 "A:" ; just a marker for output ( a: func [data] [ global1: [] ; global1 refers to this block after func a is evaluated. data: "b" ; data in this function is local, because it's an arg ; It doesn't change what red'/3 refers to ] ) "B:" ; just a marker for output ( b: func [tmp] [ append tmp "just one thing" print global1 a data ] ) probe reduce ["same? global1 red'/2 ?" same? global1 red'/2] b global1 probe reduce ["same? global1 red'/2 ?" same? global1 red'/2] b global1 b global1 b global1 ] print mold red' do red' print mold red' print mold :a`**  
**This isn't perfect, but maybe this approach can be a starting point for someone to improve.**

**Paste it into a console to try it.**

**[02:51](#msg606929ce0508990a25d1f8d1)You've already walked off the ledge in the shallows and are being pulled to the depths. Don't panic. :^)**

**[02:54](#msg60692a50156d1f51d8cd3c5c)Too late for me to tackle spoons right now. Looks like a good writeup at a glance. Someone will review soon I'm sure.**

**[02:57](#msg60692b17db595f5599d39fa3)Note that my marker strings for A/B aren't needed now. I used `compose` on my first pass and thought they might help there. Same for the parens; not needed now.**

**[02:59](#msg60692b9fd765936399d1ea7c)As a side note, @rseger, you managed to create an example that made me feel your pain. :^)**

**snotbubble**

**[10:34](#msg60699648db595f5599d4783c)more trouble with getting at source:**  
**`z: context [ b: true a: compose/deep [ d: (unless none? b [if b [ 'bold ]]) ] ] mold z`**  
**returns:**  
**`{make object! [^/ b: true^/ a: [d: bold]^/]}`**  
**but need the data to be exactly as it was written/generated:**  
**`{z: context [ b: true a: compose/deep [ d: (unless none? b [if b [ 'bold ]]) ] ]}`**

**hiiamboris**

**[10:43](#msg6069985a63fb5651c1ecd410)you're evaluating the code and want to get back the from evaluated result to the source that produced it?**

**snotbubble**

**[10:44](#msg6069989d9ecc541fc8d72af8)yep**

**hiiamboris**

**[10:44](#msg606998a30147fb05c5d6e701)it's up to you to do so, as programming languages I know of never work that way ;)**

**[10:45](#msg606998cb156d1f51d8ce218e)mold it first, evaluate later**

**Oldes**

**[11:21](#msg6069a147d765936399d2d322)@snotbubble something like this:**  
**`>> code: mold [ b: true a: compose/deep [ d: (unless none? b [if b [ 'bold ]]) ] ] == {[b: true a: compose/deep [d: (unless none? b [if b ['bold]])]]} >> z: context load code == make object! [ b: true a: [d: bold] ]`**

**[11:22](#msg6069a18e1dbd860a232ebaa4)(note that `context` is evaluating)**

**[11:24](#msg6069a1d663fb5651c1ece72d)As Boris said.. once evaluated, you are not able to get back the source of the evaluation.**

**snotbubble**

**[11:32](#msg6069a3ea89446618e985d585)@Oldes perfect thanks!**

**Oldes**

**[11:38](#msg6069a51d3153ce63a3bb0b5a)But you should be also aware, that mold/load is not perfect solution for complex code... there is a `redbin` codec in Red, which should be more precise... but I have not tested it yet.**

**[11:40](#msg6069a5ba1dbd860a232ec30f)**  
**`red >> save/as bin: #{} code 'redbin == #{ 52454442494E020401000000D80000000A000000500000000000000008000000 100000001800000020000000280000003000000038000000400... >> load/as bin 'redbin == [b: true a: compose/deep [d: (unless none? b [if b ['bold]])]]`**

**[11:45](#msg6069a6dc15cd52559d7bdd0a)**  
**`red >> code: reduce ['true true] == [true true] >> parse code [word! logic!] == true >> code2: load mold code == [true true] >> parse code2 [word! logic!] == false ;<--- because both are words! >> save/as bin: #{} code 'redbin == #{ 52454442494E0204010000002000000001000000080000000000000074727565 000000000500000000000000020000000F00000200000000D00... >> code3: load/as bin 'redbin == [true true] >> parse code3 [word! logic!] == true`**

**[11:46](#msg6069a70815cd52559d7bdd26)You can use `mold/all` to prevent above.. but it's not fully implemented in Red yet.. and fails in cases like:**  
**`>> mold/all next "aha" == {"ha"} ;<--- should be {#[string! "aha" 2]}`**

**[11:49](#msg6069a7c3db595f5599d49c61)But again... redbin solves it:**  
**`>> code: next "aha" == "ha" >> save/as bin: #{} code 'redbin == #{ 52454442494E0200010000001000000007010000010000000300000061686100 } >> code4: load/as bin 'redbin == "ha" >> head code4 == "aha"`**

****Monday 5th April, 2021****

**gltewalt:matrix.org**

**[11:48](#msg606af90956ddab18d72e391e)Anyone going to review @rseger summary of spoony ?**

**greggirwin**

**[15:05](#msg606b272b0508990a25d661e0)I will try to make time, but it won't be today.**

**9214**

**[15:10](#msg606b2872ed315705c29c3d51)@rseger, see the diagram in https://github.com/red/red/issues/4552 and \[this](https://gitter.im/red/help?at=5dc6026e4adf071a84f6afb7).**

**[15:12](#msg606b28f063fb5651c1f05f07)Context is a namespace. A namespace is a mapping between a symbol and its associated value. A scope is an ordered chain of namespaces. There are no scopes in Red because there's no ordering or relation between namespaces, they are all separate from one another, and provided to you by "proxy" values, such as `object!`, `error!` or `function!`.**

**[15:15](#msg606b29ab56ddab18d72eb6a6)Scope almost always implies lexical scoping, which makes people think that Red has lexical scoping delineated by lexical blocks with `[` and `]` instead of curly braces. This in turn makes them think that words are variables. And at this point, the learning curve turns into a roller coaster, and leads to an unsalvageable conceptual trainwreck.**

**greggirwin**

**[15:22](#msg606b2b249ecc541fc8dab973)Thanks @9214. If not you, someone should extract that into a wiki page or gist with proper attribution.**

**rseger**

**[16:27](#msg606b3a6d3153ce63a3be92f5)I would caution against implying that contexts are namespaces. While a core concept of them, symbol:value, is shared between the two, there's a massive deviation in at least two fundamental ways that I've uncovered. Either of which should warrant new vocabulary, imo. Context works well for that, again imo.**

**The first fundamental deviation is that variables are inexorably bound, at creation, to their respective namepaces. A shorthand way to think about this is that you can't create a variable without the language tacking on `namespace1-yourvariablename` as it's explicit identifier. A variable can not exist without a namespace, nor can a variable exist in multiple namespaces. Shadowed variables are a result of compiler/interpreter's inability to guess which variable the programmer is referring to "by shorthand" ie - by what they think of as the variable's identifier. A context is not inexorably bound. It is, rather loosely, associated with a symbol.**

**My current mental model for the above is a nested map. `Contexts[particular-context][symbol-name] : value`. `particular-context` being looked up for `symbol-name` on every use (no model yet for how).**

**The second fundamental deviation is that namespaces provide boundaries. In any namespace you can only affect that, and parent, namespaces. Sister/cousin/etc namespaces can only be affected by effectively hacking the underlying implementation mechanisms "under" the language. Contexts provide no such boundaries.**

**My current mental model for this is that any piece of code, executing with symbols in any context, can modify the `particular-context` of any symbol in the system. As part of the language proper - no hacking needed.**

**9214**

**[21:43](#msg606b849889446618e98a4112)@rseger**

**&gt; While a core concept of them, symbol:value, is shared between the two**

**That's all there is to a concept of a \[namespace](https://en.wikipedia.org/wiki/Namespace): a set of objects with unique identifiers tied to them. The rest is you spotting differences between name resolution schemes in Red and other, mainstream languages.**

**&gt; Contexts provide no such boundaries.**

**I don't understand what that means. I already said that there's no hierarchy between contexts, no relation: they have a list of symbols, a list of values, and a back-pointer to a buffer in which they exist alongside their proxies and are accessed thru them. There's no need for boundaries because there are no relations to bound, no global registry of contexts, and no associations between them.**

**Words contain indexes into a context to which they are linked, an offset to symbol/value entry in that context. This effectively makes name resolution's complexity O(1). This link to a context is called a binding, and can be changed at any point in runtime, either by you or by language constructs, like `func` for example.**

**rseger**

**[22:24](#msg606b8e2ced315705c29d4ccb)good to know about the implementation/lookup details. I was assuming something similar but assumptions have been getting me down a lot of dead ends.**

**fair enough re: namespace definition. I suppose all I can really say is that this is the first time I've ever run across the concept of a namespace without those components and (obviously) had no idea they weren't definitional requirements. I am uneducated but also embarrassingly common in that. So I would still caution against an unqualified use of namespace here.**

**I didn't mean to imply that contexts, or Red, needed to provide boundaries of any kind. That there are none is interesting and unique, so far as I am aware.**

**greggirwin**

**[22:31](#msg606b8fc856ddab18d72fc3e5)Words are our hardest problem to solve. In other langs, namespaces are strictly hierarchical and fixed once created. In Red, the "definitional" part makes it look like that, because it's familiar by design. That's a big help. But there are places where space-time bends enough to create wormholes, and suddenly you see the universe not as trees of namespaces, but as a mesh network over which you can impose that view. It's the holographic dataverse.**

**[22:38](#msg606b918392a3431fd678d527)A little more seriously, if you think of everything as one big block of values, where some of them (words) are special in that they can refer to other values, the rest is in how you organize things. It's scary because it seems like that foundation should lead to disaster and chaos. But it's OK, because not everybody needs to worry or even know about it. We can put all kinds of facades over things, but in Red itself, you may still do things that pull you into Wonderland.**

****Tuesday 6th April, 2021****

**gltewalt**

**[01:07](#msg606bb4623153ce63a3bfbf1b)Authorship indicated on both sections.**  
**https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#contexts-and-binding**

**greggirwin**

**[01:18](#msg606bb6e33153ce63a3bfc3be)Thanks @gltewalt !**

**snotbubble**

**[04:43](#msg606be6f0156d1f51d8d3780c)having trouble with redbin where its causing a context func to read data from another context. Bug or feature?**  
**`Red [] dat: context [ cdx: 1 lst: [ "a" "list" "goes" "here" ] fnc: function [ ] [ print [ "my list is: " lst ] foreach l lst [ print [ "listitem =" l ] ] ] ] s: copy [] append s copy dat append s copy dat s/2/lst: [ "another" "list" "goes" "here" ] s/2/cdx: 2 foreach w s [ print [ "verifying original data"w/cdx":^/" w "^/" ] ] foreach w s [ print [ "verifying original func"w/cdx":" ] w/fnc print "^/" ] save/as bdat: #{} s 'redbin backwash: load/as bdat 'redbin foreach w backwash [ print [ "verifying restored data."w/cdx":^/" w "^/" ] ] foreach w backwash [ print [ "verifying resstored func"w/cdx":" ] w/fnc print "^/" ]`**

**hiiamboris**

**[08:11](#msg606c17b0657d022d5a65781e)well, it's a bug**

**[08:13](#msg606c18120147fb05c5dcb539)please minimize the snippet and \[report it](https://github.com/red/red/issues/new?template=bug\_report.md)**

**[08:14](#msg606c1868ed315705c29e8370)@9214 is an expert on Redbin, he can probably say what's happening ;)**

**GiuseppeChillemi**

**[22:30](#msg606ce1010508990a25dad6a9)I need to send HTML emails with attachments. What should I use?**

****Wednesday 7th April, 2021****

**greggirwin**

**[02:22](#msg606d175156ddab18d7339875)Unfortunately, R2's \[E]SMTP protocol is so out of date that it doesn't work for many servers now. You may want to look into a commercial service.**

**gltewalt**

**[03:30](#msg606d275aed315705c2a1473e)Look in @Oldes repos, he might have something**

**Oldes**

**[08:29](#msg606d6d75040a74046995e8e5)There is this Graham's \[smtp script](https://gist.github.com/gchiu/5288312), but hard to say for which Rebol version it was done... I was not \_mailing_ from any script several years, so I don't have anything ready to use. I think that most SMTP servers now accept only TLS connection, so that would be the main blocker.**

**[08:35](#msg606d6edc59b86b2df900d689)\[This version is newer](https://github.com/gchiu/Rebol3/blob/master/protocols/prot-smtp.reb) but you will have hard time to find a Rebol version compatible with it.**

**[08:42](#msg606d706d309a8672cc072502)As there is quite a lot \[TLS test scripts in Red's IO branch](https://github.com/red/red/tree/IO/tests/IO), one could, with some afford, port the Graham's script (as SMTP is quite simple).**

**gltewalt:matrix.org**

**[12:01](#msg606d9f23e00d5172bc82ab6a)You could try to script it through telnet. Send a sample through an email app so you can copy the mime formatting - mix in some read binary and rejoin with the mime format. If you're feeling wild.**

****Thursday 8th April, 2021****

**bubnenkoff**

**[11:12](#msg606ee51d2e5574669b239df3)I have got text data-struct.**  
**`data: [ id: none lots: [ bar: none lot: [ name: none obj: [ price: none ] ] ] ]`**

**Can I get access to it's element in one step in next way?**  
**`data/(to-path [lots lot])`**  
**?**

**toomasv**

**[11:52](#msg606eee68b9e6de24d6215e8e)**  
**`>> get to-path [data lots lot] == [ name: none obj: [price: none] ]`**

**[11:54](#msg606eeeec06e2e024e83e8a3d)**  
**`>> select select data 'lots 'lot == [ name: none obj: [price: none] ]`**

**bubnenkoff**

**[11:57](#msg606eefa7b9e6de24d62161c9)Yes, I tried this. But I am getting block ( `[lots lot]` ) from outside and I want to prevent it from pollution. I tried also:**  
**`stack: [ lots lot] to-path insert copy stack 'data`**

**[12:00](#msg606ef0652e5574669b23b81e) insert do not add noting:**  
**`>> probe to-path insert copy stack 'data lots/lot ; no data :(`**

**toomasv**

**[12:23](#msg606ef5a5969f8b38ee66aecb)**  
**`>> get to-path head insert copy stack 'data == [ name: none obj: [price: none] ]`**

**[12:24](#msg606ef5f0b6a4714a29b0667b)`insert` returns after insertion point. You have to use `head` to get whole thing when inserting.**

**bubnenkoff**

**[12:28](#msg606ef6f2a9dd556843c67c9c)Thanks! Exactly what I needed!**

**hiiamboris**

**[13:57](#msg606f0bbddc24646812ab7a7e)I'm often using compose for that**

**[13:58](#msg606f0beab6a4714a29b0aa50)`as path! compose [data (stack)]`**

**xqlab**

**[15:16](#msg606f1e4606e2e024e83f0f5a)or just**  
**`>> data/(stack/1)/(stack/2) == [ name: none obj: [price: none] ]`**

****Sunday 11st April, 2021****

**bubnenkoff**

**[08:44](#msg6072b6f31f84d71853ad9edd)Remember me please syntax of find any. I need to check if string have any values from block:**  
**`find ["aabbccddee"] ["gg" "ee"]`**  
**this should be `true`**

**hiiamboris**

**[08:59](#msg6072ba6fd7953918614eee99)`find/any` was never implemented in Red, and it's for a different use case**

**[08:59](#msg6072ba7ab9e6de24d62a6280)just use a loop**

**greggirwin**

**[20:53](#msg607361d6a9dd556843d0d9c3)`Find/any` isn't the right solution anyway, as you're looking for multiple values, not wildcards.**

****Monday 12nd April, 2021****

**toomasv**

**[03:50](#msg6073c3841f84d71853b00175)Why not use `parse`? Difference from `find` in loop is that with `parse` you'll get whichever comes first, with `find` the first one found, which might not be the same.**

**greggirwin**

**[16:42](#msg60747858dc24646812b85367)I thought the same thing.**

**rebred**

**[18:01](#msg60748b0355d78266a63e3783)I can read HTML form field posts in a web page by doing:**

**`I can read HTML headers in the REPL by doing:`a: read/info http://rebol.com\`**

**how do I read the HTML header of a web site in a web page ?**

**gltewalt**

**[18:10](#msg60748d0097cf5067465a4cfe)Huh?**

**rebred**

**[18:13](#msg60748dd655d78266a63e4049)@gltewalt I have a Red script inside a web page - how do I read the header of the request when the page is loaded ?**

**greggirwin**

**[20:10](#msg6074a943ae90f36840785ed2)Red doesn't know anything about the browser environment, so you would have to pass that information to it.**

**rebred**

**[20:12](#msg6074a9ae97cf5067465aa039)@greggirwin with**  
**`mold input` I am able to read the fields of a POST submission**

**[20:13](#msg6074a9cc1f84d71853b26d57)@greggirwin and with**  
**`a: read/info http://rebol.com` I can read the header**

**greggirwin**

**[20:14](#msg6074aa22a9dd556843d40c3c)Maybe @rebolek or @Oldes have a trick. Look at Bolek's HTTP Tools for clues. And if you post \*how* you're calling Red from your web page, others can experiment.**

**rebred**

**[20:14](#msg6074aa2f97cf5067465aa127)@greggirwin when putting the Red script inside the page (that resides on the web server) the header is being passed to the page I just would need some kind of variation of**  
**`read/info` for reading the header**

**[20:16](#msg6074aa8bae90f368407862a4)@greggirwin I calling Red using CGI**

**greggirwin**

**[20:21](#msg6074abbd97cf5067465aa4a3)I understand (I think), and should have said "server environment" in my first response. Bolek's tools are \[here](https://github.com/rebolek/red-tools/blob/master/http-tools.red). Maybe he has a trick in there. I haven't done it, so can't help much.**

**rebred**

**[20:24](#msg6074ac7aa2ac0d38e7b0b041)@greggirwin yes it must be some kind of**  
**`read/local/info` to read the beginning of the text of the page**

**[20:25](#msg6074acb355d78266a63e9846)@greggirwin @rebolek will surely know it**

**[22:23](#msg6074c84a969f8b38ee74cfbe)@greggirwin I found it!!!!! thank you**  
**`call/wait/output "printenv" o: "" print o`**

**greggirwin**

**[22:27](#msg6074c94381866c680c1cb94a)Great! Would you please add a note about it to https://github.com/red/red/wiki/%5BDOC%5D-Using-Red-as-CGI ?**

**rebred**

**[23:04](#msg6074d20281866c680c1cce1d)**  
**`a: { HTTP_REFERER=http://192.168.1.6/test.red HTTP_ACCEPT=text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8 REMOTE_ADDR=192.168.1.251 }`**  
**`z: load a`**

**[23:07](#msg6074d2b8dc24646812b93f2d)I am getting this error**

**[23:07](#msg6074d2bab9e6de24d62f89c8)**  
**`>> z: load a *** Syntax Error: (line 3) invalid word at html,application/xhtml+xml,app *** Where: catch *** Stack: load`**

**greggirwin**

**[23:08](#msg6074d302b9e6de24d62f8a71)As I expect you would. That's not loadable Red data.**

****Tuesday 13th April, 2021****

**greggirwin**

**[00:20](#msg6074e3cfdc24646812b96788)You can play with \[this](https://gist.githubusercontent.com/greggirwin/91dc025b1c25b9efc24996af0207bde2/raw/2a7782b9fe1af14920631b39e6bcf8d98d52c7bb/load-trap-red) on your data.**

**gltewalt:matrix.org**

**[01:26](#msg6074f33e2e5574669b3215f4)https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#how-to-make-http-requests**

**greggirwin**

**[01:34](#msg6074f50ea9dd556843d4c051)I don't think that is what @rebred was asking about.**

**rebolek**

**[05:57](#msg607532b3ae90f3684079abfe)@rebred : @greggirwin is right, I have something for it :-) See this script https://gitlab.com/rebolek/castr/-/blob/master/server-tools.red**  
**There is a function `get-headers` that will set global object `http-headers` with parsed headers. It works both on POSIX (Linux, macos) and Windows. There are also other functions for working with Red as CGI, like `process-input` that will parse both GET and POST data and convert them to Rebol values based on MIME type. And there are also functions for making response to the request you’ve received. If you look into the CASTR repository, there are other scripts, like \[Mustache](https://mustache.github.io/) templating system and others.**

**[06:01](#msg607533a7c60826673b9ebfab)What’s missing yet in the repo is cookie handling, both client and server side (it’s partially done, but not enabled) and rewrite of Red’s HTTP caching. Current Red caching ignores all HTTP caching rules and needs to be replaced with something that follows standards.**

**greggirwin**

**[07:41](#msg60754b47b9e6de24d630a93c)Thanks @rebolek !**

**rebolek**

**[09:25](#msg60756397b9e6de24d630e816)And if you’re feeling adventurous, there’s also Red web server :-)**

**rebred**

**[22:03](#msg607615252e5574669b3528c8)I am trying to assign the value of the second item in the block as a string to the first**  
**`"blah.blah"` to**  
**`str`**  
**`a: ["str" "blah.blah"] do rejoin [:a/1 {: } mold a/2] print str ==blah.blah`**  
**is there a better way to do this ?**

**Respectech**

**[22:14](#msg607617dfb6a4714a29c1d781)`set load a/1 a/2`**

**rebred**

**[22:16](#msg6076183746a93d4a19c4b2e9)@Respectech amazing thak you!!!**

**greggirwin**

**[22:17](#msg60761884c60826673ba13035)Or use `to word!` in place of `load`, depending on how much you trust the first value being a good word. And if you don't need it to be a string, even better, e.g. `a: [str "blah.blah"]`**

**rebred**

**[22:24](#msg60761a1655d78266a64247c1)**  
**`a: "test-123" b: split "test-123" "-" probe b == ["test" "123"]`**

**is there a way to split a directly in iteself (turning it into a block) instead of assinging to another word**

**[22:27](#msg60761ab755d78266a6424945)@greggirwin thank you!**

**greggirwin**

**[22:30](#msg60761b9106e2e024e85000ff)Reassigning to `a` is as close as you can get. Even if you use a space as your delimiter and `load/to-block` instead of `split`.**

**[22:31](#msg60761bc5d795391861577977)Depending on what kind of values you have and what you want them to be in the resulting block.**

**rebred**

**[23:14](#msg607625c197cf5067465e8df0)@greggirwin**  
**`set to-word a1 a2`was very useful thank you!!**

****Wednesday 14th April, 2021****

**lylgithub2021**

**[05:38](#msg60767fc5b9e6de24d633e278)**  
**`>> f: func ['x [any-type!]][probe :x] == func ['x [any-type!]][probe :x] >> f unset >>`**  
**what's the meaning of `unset` here? As I know, `unset` is `native!`. Why here return a `native!`? And Why not return `unset!`?**

**hiiamboris**

**[06:55](#msg607691ec2e5574669b364922)"unset" is how mold represents a value of type unset!. Which is a known bug.**

****Thursday 15th April, 2021****

**GalenIvanov**

**[19:13](#msg6078905ddc24646812c300bc)I was thinking about examples showing how to use `remove-each` and came up with this prime-sieve function:**

**[19:13](#msg6078906c97cf50674664d7f3)**  
**``Red [ Title: "Prime-sieve using `remove-each`" Author: "Galen Ivanov" Date: 15-04-2021 Note: "Slow, impractical for real use, serves only as a demonstration of `remove-each`" ] prime-sieve: function [ "Finds the prime numbers less then or equal to n" n [integer!] "upper limit" ][ primes: make block! n / log-e n append primes 2 i: 1 odd-n: collect/into [ while [n >= i: i + 2] [keep i] ] make block! n / 2 while [not empty? odd-n] [ append primes prime: take odd-n remove-each odd odd-n [zero? odd % prime] ] primes ]``**

**[19:14](#msg60789088dc24646812c3017c)**  
**`>> prime-sieve 50 == [2 3 5 7 11 13 17 19 23 29 31 37 41 43 47]`**

**[19:17](#msg60789163ae90f3684082a5ba)Where is the right place to collect such short examples? Maybe in \[Examples](https://github.com/red/red/wiki/Examples) but where exactly? Should we add a new page there or use the existing \[Scripts collection](https://github.com/red/red/wiki/%5BLINKS%5D-Scripts-collection)?**

**toomasv**

**[19:29](#msg60789429a2ac0d38e7bad787)@GalenIvanov Nice example!**

**GalenIvanov**

**[19:38](#msg6078961ed7953918615dddee)@toomasv Thanks! :smile:**

**greggirwin**

**[19:49](#msg607898c9ae90f3684082b9c5)Certainly add it to the scripts collection, though being sorted by user makes things harder to find there. That gets your name in the list. :^) But let's add %algorithms/ to https://github.com/red/community and put it there.**

**GiuseppeChillemi**

**[23:07](#msg6078c737ae90f36840832fcb)If I have a function with refinements, how could I get how many arguments it will need if one or more refinements are provided and they need args?**

**ne1uno**

**[23:29](#msg6078cc5a1f84d71853bd4785)`arity-of` https://gist.github.com/greggirwin/53ce7d1228422076e142fa5a061e7649 you can find quite a few versions packaged in various projects or in gist.**

****Friday 16th April, 2021****

**ne1uno**

**[03:37](#msg6079069255d78266a649e3e1)@rebolek has`arity-spec`which will loop through any refinements as well. https://github.com/rebolek/red-tools/blob/master/func-tools.red**

**toomasv**

**[06:03](#msg607928c7dc24646812c4629c)\[info.red](https://gist.github.com/toomasv/eaac3829ac5e745f43121aa60b555d68) gives also thorough info about function, including arity of runtime args.**

**GalenIvanov**

**[06:43](#msg60793225a9dd556843dfd71a)Here's mine approach on function arity, from couple of days ago - \[funcs.red](https://github.com/GalenIvanov/Program-Structure/blob/main/funcs.red)**

**hiiamboris**

**[07:38](#msg60793eef81866c680c283d50)Guys, /extern will never occur in the spec unless it's used as a refinement, and /local is a refinement like any other.**

**[07:39](#msg60793f1edc24646812c49f2e)**  
**`>> f: func [/local x /extern y /other z] [print [x y z]] == func [/local x /extern y /other z][print [x y z]] >> f/local/extern/other 1 2 3 1 2 3`**

**GalenIvanov**

**[07:45](#msg6079409cae90f368408448d2)@hiiamboris Thanks for the clarification! What about such a `function`:**

**[07:45](#msg607940a155d78266a64a7141)**  
**`f: function [/local x /extern y /other z] [a: 10 print [x y z a]]`**

**[07:45](#msg607940b055d78266a64a717d)**  
**`>> spec-of :f == [/local x a]`**

**hiiamboris**

**[07:46](#msg607940e3c60826673ba92f56)that's how `function` native treats /extern - externalizing everything after it**

**[07:47](#msg607941202e5574669b3d49ad)my point stands: there's no `/extern` in the spec, and you can use `/local` as a refinement**

**GalenIvanov**

**[07:54](#msg607942b9dc24646812c4aa54)OK, I undersand. Thank you once again!**

**greggirwin**

**[19:48](#msg6079ea0c46a93d4a19ce9b45)Should we add an "Advanced" section to https://github.com/red/red/wiki/%5BDOC%5D-Function-Evaluation with these notes?**

**GiuseppeChillemi**

**[22:15](#msg607a0c9fb6a4714a29cc237b)Thank you all, I will use them on Red and try to adapt one version to Rebol**

**[22:26](#msg607a0f0ac60826673bab5233)I remember a pseudo standard for custom types exists, something like:**  
**`[#MYTYPE DATA]` but I don't find anything about it. Is there such pseudo notation?**

****Monday 19th April, 2021****

**bferris413**

**[15:01](#msg607d9b4b2e5574669b4792d3)How can I see what functions or refinements are available on a given type? For example:**  
**`>> start: now >> ? start START is a date! value: 19-Apr-2021/10:59:23-04:00 >> start/year 2021`**  
**I'd like to see what other refinements are supported from the REPL**

**[15:06](#msg607d9c6846a93d4a19d71831)I'm aware that I can use `? now` to get them, but I'm wondering if it's possible to get them from the variable**

**hiiamboris**

**[15:12](#msg607d9dfaa9dd556843ea2957)@GiuseppeChillemi I only recall this page https://github.com/red/red/wiki/%5BPROP%5D-User-defined-types-(UDT)-and-dependent-types)**

**[15:13](#msg607d9e1cb9e6de24d64550f7)@bferris413 `system/catalog/accessors/date!`**

**bferris413**

**[15:19](#msg607d9f9997cf50674670bd0a)Thanks**

****Tuesday 20th April, 2021****

**rebred**

**[16:47](#msg607f05a981866c680c363b61)**  
**`a: "test" append a "test2"`**

**in there a way to initialize**  
**`a` inline ?**

**hiiamboris**

**[16:56](#msg607f07a6dc24646812d2aa30)`a: "testtest2"`? :)**

**rebred**

**[17:25](#msg607f0e82d7953918616d62fc)@hiiamboris i am sorry - i meant:**  
**`a: "" append a "test2"`**

**hiiamboris**

**[17:29](#msg607f0f8955d78266a65877b6)hmmm.. how would you like it to inline?**

**rebred**

**[17:33](#msg607f105481866c680c365d8b)@hiiamboris like something**  
**`append a: "" "test2"`**

**[17:33](#msg607f106c46a93d4a19daed74)something where I initialize a on the same line**

**hiiamboris**

**[17:47](#msg607f13c546a93d4a19daf6ba)does it work?**

**rebred**

**[17:50](#msg607f145555d78266a65885b2)@hiiamboris not**

**hiiamboris**

**[17:50](#msg607f147d46a93d4a19daf8c3)what result do you expect?**

**rebred**

**[17:52](#msg607f14c306e2e024e8662976)I would like to set a word inline (not assigning on a separate line)**

**[17:53](#msg607f1535a2ac0d38e7ca72c5)initialize on the spot**

**hiiamboris**

**[18:27](#msg607f1d061f84d71853cc826f)why `append a: "" "test2"` doesn't work for you?**

**rebred**

**[18:34](#msg607f1ea2b6a4714a29d81297)@hiiamboris you are right...it works!**

**[18:34](#msg607f1eab969f8b38ee8e8e75)is there any better way to do it**

**gltewalt:matrix.org**

**[18:44](#msg607f2106b6a4714a29d817b6)Have a line of code that includes an example of how you want to "initialize inline"?**  
**append a: "" "test2" is not a great example, because it's the same as a: "test2". But wasteful**

**ingvast**

**[20:41](#msg607f3c86969f8b38ee8ede01)You can convert a block to pair by `to-pair`. But what is the reverse? a pair to a block? `to-block` does not give what I want.**

**hiiamboris**

**[20:42](#msg607f3cb297cf506746747388)no direct way**

**[20:42](#msg607f3cca2e5574669b4bd845)`reduce [pair/x pair/y]`**

****Wednesday 21st April, 2021****

**GiuseppeChillemi**

**[00:00](#msg607f6b32dc24646812d3a684)@greggirwin**

**From https://gitter.im/red/red**  
**:point\_up: \[21 aprile 2021 01:13](https://gitter.im/red/red?at=607f6007a9dd556843eeccba)**

**&gt; Functions designed to output to the console often return unset, to keep things cleaner.**

**Yes, but if I want to set a variable with the result of a `DO` on code block, I get error on functions like `print`**

**`code: [print "x"] x: do code`**

**Here is a mini loop that executes the commands:**

**This works:**

**`>> code: [a: 2 + 2 b: 2 + 5] until [probe x: do/next code 'code tail? code] 4 7 == true`**

**But if it encounters a `print` like function**

**`>> code: [a: 2 + 2 print "done"] until [probe x: do/next code 'code tail? code] 4 done *** Script Error: x: needs a value *** Where: x *** Stack: probe`**

**So, I could I set `X` to any returned value by the evaluation including `unset!`?**

**greggirwin**

**[00:18](#msg607f6f73b6a4714a29d8e347)Use `set/any` in that case.**

**GiuseppeChillemi**

**[00:32](#msg607f728f1f84d71853cd5d63)Now I have discovered the purpose of `set/any` too**

**rebred**

**[01:44](#msg607f8388b6a4714a29d90ecb)**  
**`>> a: make image! [2x2 #{D2417AFC71F15BA4FFFBB950}] == make image! [2x2 #{D2417AFC71F15BA4FFFBB950}] >> size? a *** Script Error: size? does not allow image! for its file argument *** Where: size? *** Stack:`**  
**how do I find out the size in bytes of this image ?**

**ne1uno**

**[01:51](#msg607f852d55d78266a659a2ad)`a/size`**

**rebred**

**[01:52](#msg607f8554c60826673bb7a648)@ne1uno this is the x and y pixel size**

**ne1uno**

**[01:53](#msg607f858155d78266a659a345)in the console you can use `?? a`**

**[01:53](#msg607f859506e2e024e86744a6)or `? a` to view**

**rebred**

**[02:01](#msg607f876ea9dd556843ef2385)@ne1uno i am looking for the size in bytes**

**ne1uno**

**[02:06](#msg607f88bf97cf506746751a85)can you calculate it from pixels? `length? a`**

**rebred**

**[02:08](#msg607f892c969f8b38ee8f91aa)@ne1uno i am not sure - some pixels have lots of colors...then I wil need to calculate the bits as well and compute it all**

**ne1uno**

**[02:10](#msg607f89992e5574669b4c9299)not sure how you know about alpha channel. or is it always 4 bytes per pixel**

**greggirwin**

**[02:10](#msg607f89b1b9e6de24d64a439b)`length? a/argb` if you want alpha included, `length? a/rgb` if not.**

**rebred**

**[02:11](#msg607f89caa2ac0d38e7cb98ec)@greggirwin I am looking to get the size in bytes**

**greggirwin**

**[02:11](#msg607f89d72e5574669b4c9318)That's what you'll get.**

**[02:12](#msg607f8a0055d78266a659ae02)You can also do `length? a/alpha` if you want \*only* that channel.**

**rebred**

**[02:14](#msg607f8a8fa9dd556843ef29bc)if I save it as a file and I do**  
**`size? to-file a.png` I get 79 bytes**

**[02:15](#msg607f8ab7c60826673bb7b0ff)but how do I calculate it from the word directly ?**

**greggirwin**

**[02:16](#msg607f8ae655d78266a659b00e)Because PNG files have extra data beyond the raw image. What I posted will give you the raw image data sizes for an `image!`.**

**rebred**

**[02:16](#msg607f8b16dc24646812d3ed06)thank you! @greggirwin**

**[02:17](#msg607f8b2446a93d4a19dc1b6b)thank you! @ne1uno**

**[03:01](#msg607f958206e2e024e8676848)**  
**`a: "01245678901234567890123456789" parse reverse reverse a [any [ 2 skip insert "," skip ]] print a ==01,245,678,901,234,567,890,123,456,789,`**  
**I am trying to put a comma every 3 digit so the number can be read easily**  
**is there a better way then this?**

**greggirwin**

**[03:48](#msg607fa0ab06e2e024e867828f)That's fine. If you need to account for decimals it's a bit more work. I have experimental `format` work \[here](https://github.com/greggirwin/red-formatting). The func for what you want is this:**  
**`set 'form-num-with-group-seps function [ "Insert group separators into a numeric string" num [number! any-string!] /with sep [string! char!] /every ct [integer!] ; /skip may be a better name, but conflicts with system/words/skip ][ num: form num ; Form strings, too, so they're not modified sep: any [sep #","] ct: negate abs any [ct 3] num: skip any [ find num deci-char num ; start at the decimal point, if there is one find/last/tail num digit ; or at the last digit (support, e.g., "123rd") tail num ; or at the end of the string ] ct while [not head? num] [ ; We want to catch cases where the preceding char is not a digit, ; and *not* insert a sep if that's the case. if find digit pick num -1 [ insert num sep ] num: skip num ct ] num ]`**  
**`digit` is `digit: charset "0123456789"`**  
**`deci-char` is unfortunately more involved, as it sniffs for the char. You can simply use the known chars (`.,`) directly though.**

**ingvast**

**[05:58](#msg607fbef9d7953918616f18b2)@hiiamboris That's what I've been using. Thanks for verification. On the wish list I ask to change the behavior of to-block to do just than. I cannot really see the use of creating a block with single value, buy maybe I forget some cases.**

**hiiamboris**

**[07:41](#msg607fd741969f8b38ee905bac)`to block!` is often used for that - to get a block with a single value. It's by design.**

**[07:43](#msg607fd79906e2e024e8680779)Unboxing tuples and pairs is a use case I agree, but less important. I think there should be a routine for that.**

**[07:44](#msg607fd7cd81866c680c3851a2)Though I only remember wanting this once, and don't even remember where ;)**

**[07:45](#msg607fd82dc60826673bb860a9)@rebred funny, I used the same trick as you - `parse reverse`.**

**bubnenkoff**

**[11:00](#msg608005ddb6a4714a29da4bf0)**  
**`o: object [ name: 'foo ] data: [ id: 123 foo: [ bar: "hello" ] ] data/(o/name)`**  
**will output:**  
**`== [bar: "hello"]`**  
**But what if I want to simple get path (and not print values)**

**I want to evaluate this:**  
**`data/(o/name)`**  
**to path (as path):**  
**`data/foo`**  
**I tried `to-path` but I am getting wrong result**

**rebolek**

**[11:06](#msg60800732a2ac0d38e7ccca6f)You probably haven’t `reduce`d:**  
**`>> p: to path! reduce ['data o/name] == data/foo >> p == data/foo >> get p == [bar: "hello"]`**

**bubnenkoff**

**[11:19](#msg60800a2f81866c680c38d27a)&gt; You probably haven’t `reduce`d:**  
**&gt;**  
**`> >> p: to path! reduce ['data o/name] > == data/foo > >> p > == data/foo > >> get p > == [bar: "hello"] >`**

**Thanks! But I can't get it work on more complex example:**  
**`parser-status: [ current-section: 'test ] data-templates: [ template-section-name: [ test: [ ; test section id: none lots: [ bar: none baz: none lot: [ name: none obj: [ price: none ] ] ] ;--------------------------------- ] ] ] p: to-path reduce [ 'data-templates data-templates/template-section-name/(:parser-status/current-section) ]`**

**loziniak**

**[11:23](#msg60800b2346a93d4a19dd510a)maybe try `p: to-path reduce [ 'data-templates 'template-section-name parser-status/current-section ]`**

**bubnenkoff**

**[17:35](#msg6080626681866c680c39d041)I want to make `data-templates` point to data in `data-templates2/template-section-name/'test_section_name/test_subsection`.**  
**But I can't figure out how to do it.**  
**Last string is create correct path, but I can't to `reduce` it to get data to word from `path`.**  
**Or there is another way to point to `data-templates` to needed path?**  
**`parser-status: [ current-section: 'test_section_name ] sub_section_name: to-word 'test_subsection data-templates2: [ template-section-name: #( test_section_name: #( test_subsection: [ ; for test id: none lots: [ bar: none baz: none lot: [ name: none obj: [ price: none ] ] ] ;--------------------------------- ] ) ) ] data-templates: to-path compose [ data-templates2/template-section-name (parser-status/current-section) (sub_section_name) ] data-templates`**

**greggirwin**

**[17:43](#msg60806442dc24646812d628f0)I'm not clear on what you need, but did you try `do` or `get` with the path you've created?**

**bubnenkoff**

**[17:44](#msg60806488969f8b38ee91e838)I need `data-templates` point to data placed inside `test_subsection` (that start from `; for test`)**

**[17:46](#msg6080650e46a93d4a19de54be)Yes, I tried `do` same error as with `reduce`**

**greggirwin**

**[17:51](#msg6080660906e2e024e869a292)Works here.**  
**`>> do-clip == data-templates2/template-section-name/test_section_name/test_subsection >> data-templates data-templates2 >> do data-templates == [ id: none lots: [ bar: none baz: none lot: [ name: none ob... >> get data-templates == [ id: none lots: [ bar: none baz: none lot: [ name: none ob...`**

**bubnenkoff**

**[17:53](#msg60806684d79539186170f14d)**  
**`>> data-templates: do to-path compose [ data-templates2/template-section-name (parser-status/current-section) (sub_section_name) ] *** Script Error: path must start with a word: data-templates2/template-section-name/'test_section_name/test_subsection`**

**[17:55](#msg60806711dc24646812d631bc)same with `get` instead `do`**

**greggirwin**

**[17:55](#msg608067171f84d71853cfeb35)I'm pasting your code from above, so something is screwy. What version of Red are you running?**

**bubnenkoff**

**[17:56](#msg608067341f84d71853cfeb8f)**  
**`>> about Red 0.6.4 for Windows built 5-Feb-2021/3:06:04+03:00 commit #6440af5`**

**[17:59](#msg60806813c60826673bb9b48e)I checked latest build. Works identical**

**greggirwin**

**[18:00](#msg60806846a9dd556843f194fd)Latest stable or automated? I get the error you do with an early Feb build too.**

**bubnenkoff**

**[18:01](#msg6080687ab6a4714a29db6c39)automated**

**[18:01](#msg6080688446a93d4a19de5d59)`red-14apr21-42d9d6a76`**

**greggirwin**

**[18:02](#msg608068b6b6a4714a29db6d06)Same here. Hang on, I bet I know what it is.**

**[18:04](#msg6080691806e2e024e869aafc)I have an old, experimental `to-path` in my local setup.**  
**`to-path: func [spec][ ; LOAD FORM is used to clean up specs that have refinements ; in them. Refinement values get their sigil doubled, which ; FORM removes, so they are sanitized. More overhead, but we ; could make that optional if this func lives on. load form append clear '_/_ spec ]`**

**[18:06](#msg608069b181866c680c39e38d)I don't know why you have `to-word` here: `sub_section_name: to-word 'test_subsection` but the lit-word in the path may be tripping things up. No time to dig in here, but if you can confirm that it would be great.**

**[18:09](#msg60806a68dc24646812d63aec)Be aware, because my `to-path` uses `clear` as an optimization, if you probe it, you'll see the last value in that `'_/_` slot. e.g.**  
**`>> ?? to-path to-path: func [spec][ load form append clear 'data-templates2/template-section-name/'test_section_name/test_subsection spec ]`**  
**While `clear` is a neat trick, this kind of thing can be \*very* confusing to see, so I will probably change that.**

**bubnenkoff**

**[18:09](#msg60806a6fae90f3684095e450)Yes! It seems that it work!**  
**`data-templates: do to-path compose [ data-templates2/template-section-name (parser-status/current-section) (sub_section_name) ]`**  
**put data in word**

**[18:14](#msg60806b6981866c680c39e9d3)If I want to set word to another word what I should to use insetead?**  
**`sub_section_name: to-word 'test_subsection`**  
**?**

**greggirwin**

**[18:15](#msg60806bd781866c680c39eadc)Just use the word itself. `to-word` isn't doing anything there.**  
**`>> sub_section_name: to-word 'test_subsection == test_subsection >> sub_section_name: 'test_subsection == test_subsection`**

**bubnenkoff**

**[18:21](#msg60806d33d7953918617103cd)So what data-type should I use to prevent this confuse?**  
**`parser-status: [ current-section: 'test_section_name ] sub_section_name: 'test_subsection data-templates2: [ template-section-name: #( test_section_name: #( test_subsection: [ ; for test id: none lots: [ bar: none baz: none lot: [ name: none obj: [ price: none ] ] ] ;--------------------------------- ] ) ) ] data-templates: do to-path compose [ data-templates2/template-section-name (parser-status/current-section) (sub_section_name) ] data-templates`**  
**Yes your `to-path` working, but I am afraid that later I will forget what problem it solve?**

**Is there any another ways? And is it a bug?**

**greggirwin**

**[18:26](#msg60806e5d06e2e024e869bae7)The other way is not to use `to-path` at all, but you need to write more code to do that, so it's just a tradeoff. `to-*` funcs are meant to be simple wrappers, so the behavior is consistent with the `to` action for a type. If it is the lit-word value also causing a problem, here's what you can do to help us all. Document the types that cause issues with `to path!` today. Then we can look at whether paths should be smarter about them, or if handling it at the mezzanine level is best.**

**GiuseppeChillemi**

**[22:06](#msg6080a1d597cf506746779eba)@greggirwin Learning:**

**Rebol:**  
**`>> f: func [][print "hi"] >> set/any 'r f hi >> type? :r ** Script Error: r has no value ** Where: halt-view ** Near: type? :r >> type? 'r == word! >> type? r ** Script Error: r has no value ** Where: halt-view ** Near: type? r`**

**Red:**

**`>> f: func [][print "hi"] == func [][print "hi"] >> set/any 'r f hi >> type? :r == unset! >> type? 'r == word! >> type? r *** Script Error: r has no value *** Where: type? *** Stack:`**

**In Rebol, the only way to have check for unset seems `value?` while the other option returns error. Red works better .**

**[22:08](#msg6080a26055d78266a65c96cb)I have a question: how do I explicity return `UNSET!` from a function? I mean something like `if true []`. Is there a way to say `if true [unset!]` as the latter returns the datatype.**

**[22:22](#msg6080a5921f84d71853d098e4)The question which arises is: how do you represent `UNSET!` as value? Let's say you want to transmit remotely the results of some functions, how do you send "there result of this function is `no-result`/`unset`"?**

**zentrog:matrix.org**

**[22:23](#msg6080a5f51f84d71853d09a19)I think the easiest way is `()`**

**[22:24](#msg6080a61d2e5574669b4f91cb)This also works `make unset! []`**

**[22:27](#msg6080a6b4ae90f36840968683)If you are thinking of passing `unset!` into a function as a value, I would try to consider whether there is a better way, as it's a pretty volatile type**

**rebred**

**[22:43](#msg6080aa89a9dd556843f24b3f)**  
**`a: read %/hd/loca/desktop`**  
**is there a way to get the dir files with a relative path instead of having to type the absolute path**

**greggirwin**

**[22:58](#msg6080adfcb6a4714a29dc2495)@GiuseppeChillemi you can use an empty block as well as an empty paren as @zentrog:matrix.org noted.**  
**`>> () >> if true [] >> either false ['yes!][]`**  
**He's also correct that you don't want to use it. Use `none` instead.**

**[22:58](#msg6080ae28c60826673bba57e1)I don't understand what you want @rebred.**

**rebred**

**[23:06](#msg6080afdf55d78266a65cb974)@greggirwin I figured it out thank you**  
**`f: read %./`**

****Thursday 22nd April, 2021****

**rebred**

**[00:53](#msg6080c8f3dc24646812d73bca)if it's a image I have to use**  
**`load`**  
**````if it's a text file I have to use ```read``` ````txt: read %./test.txt\`**

**is there a way to find out what kind on file it is before loading/reading it ?**  
**since if I try to 'read' an image or 'load' a text file I get an error**

**ne1uno**

**[01:02](#msg6080cb2fb6a4714a29dc636a)https://blog.netspi.com/magic-bytes-identifying-common-file-formats-at-a-glance/**

**[01:02](#msg6080cb2fc60826673bba95e0)not sure if anyone can tell for sure, but usually the first few bytes gives you a guess**

**rebred**

**[01:04](#msg6080cbbbdc24646812d7413d)thank you!! @ne1uno**

**greggirwin**

**[01:35](#msg6080d2f806e2e024e86abc0e)It's also common to use file extensions as a guide, trapping errors as necessary. What is your use case @rebred?**

**rebred**

**[12:53](#msg608171e0b6a4714a29ddf391)@greggirwin I am reading mixed files from a folder and need to separate them by type - the issue is that sometimes images are saved without extension**

**[13:27](#msg608179c746a93d4a19e110c7)**  
**`a: reverse "123456789012345678901234567890" parse a [any[3 skip insert ","]] print reverse a`**  
**how do I tell:**  
**if it's the end and the last char is**  
**`,` then remove it**

**[13:31](#msg60817ace81866c680c3c8fa8)**  
**`a: reverse "123456789012345678901234567890" parse a [any[3 skip if not end (insert ",")]] print reverse a`**  
**or something like this**

**GalenIvanov**

**[14:03](#msg6081822a1f84d71853d2b3fc)@rebred Does this work for you?**

**[14:03](#msg60818231ae90f3684098a162)**  
**`parse a [any[3 skip p: if (not tail? p) insert ","]]`**

**rebred**

**[14:05](#msg608182b2b9e6de24d64f6506)@GalenIvanov amazing thank you!!!**

**GalenIvanov**

**[14:06](#msg608182d306e2e024e86c737d)@rebred :smile:**

**rebred**

**[14:15](#msg60818502a2ac0d38e7d0b3fe)**  
**`a: reverse "123456789012345678901234567890" z: parse a [collect [any[copy a1 3 skip keep (a1) (append a1 ",") ]]] total: reverse rejoin z print total`**  
**I have this other one...**

**GalenIvanov**

**[14:26](#msg608187b081866c680c3cb487)**  
**`z: parse a [collect [any[p: (d: min 3 length? p)copy a1 d skip e: (if not tail? e[append a1 ","]) keep (a1)]]]`**

**[14:27](#msg608187deb9e6de24d64f730d)I think it works, but I'm not proud with my code - most probably it could be done much more elegant**

**rebred**

**[14:40](#msg60818aeb97cf506746798a65)@GalenIvanov it's great too thank you!!**

**[14:41](#msg60818b0c55d78266a65ec493)@GalenIvanov**  
**`a: reverse "123456789012345678901234567890" z: parse a [collect [any[copy a1 3 skip keep (a1) e: (if not tail? e[append a1 ","]) ]]] total: reverse rejoin z print total`**

**toomasv**

**[14:41](#msg60818b32a9dd556843f47810)One more possibility:**  
**`a: reverse "123456789012345678901234567890" reverse rejoin parse a [collect any [keep 0 3 skip e: opt [if (not tail? e) keep (",")]]]`**

**rebred**

**[14:42](#msg60818b661f84d71853d2cef6)@toomasv great!!! thank you!!!!**

**toomasv**

**[14:44](#msg60818bbbd79539186173dac1)One more**  
**`reverse rejoin parse a [collect any [keep 0 3 skip [end | keep (",")]]]`**

**rebred**

**[14:45](#msg60818bf7a9dd556843f479c7)wow!!! thank you! @toomasv**

**toomasv**

**[14:45](#msg60818c0edc24646812d91bc0):)**

**GalenIvanov**

**[14:46](#msg60818c2cae90f3684098be39)@toomasv Great!**

**rebred**

**[14:46](#msg60818c2dd79539186173dc9e)@toomasv this last one is GREAT**

**[14:50](#msg60818d362e5574669b51ca75)@toomasv what does the**  
**`0` after**  
**`keep` do ?**

**toomasv**

**[14:53](#msg60818ddc97cf506746799032)It allows pieces of length less than 3. E.g. try without it:**  
**`a: reverse "12345" reverse rejoin parse a [collect any [keep 3 skip [end | keep (",")]]] ;== ",345"`**

**rebred**

**[14:56](#msg60818e8546a93d4a19e14bab)@toomasv so something like: skip 3 but if you can't find 3 try to skip 2 1 or 0 (don't skip at all ?)**

**toomasv**

**[14:57](#msg60818ed206e2e024e86c935d)Yes, it means "skip up to 3 characters"**

**rebred**

**[14:57](#msg60818ee6d79539186173e4fb)@toomasv great thanks!!**

**GalenIvanov**

**[14:58](#msg60818efcd79539186173e542)A more convoluted version:**

**[14:58](#msg60818f001f84d71853d2dd69)**  
**`rejoin parse a[ collect [ (n: (d: length? a) / 3 - pick[1 0]d % 3 = 0) n [keep 3 skip keep (",")] keep to end ] ]`**

**hiiamboris**

**[15:02](#msg60818fe81f84d71853d2df18)`n: (length? a) - 1 / 3`?**

**toomasv**

**[15:09](#msg608191acc60826673bbc3552)**  
**`thousands: func [num [number! string!] /local int frac][ set [int frac] split form num dot parse reverse int [any [3 skip [end | insert ","]]] num: reverse int if frac [repend num [dot frac]] num ]`**

**[15:20](#msg6081943fa9dd556843f49219)Or maybe**  
**`thousands: func [num][ parse reverse num: form num [opt thru "%" opt [thru dot] any [3 skip [end | insert ","]]] reverse num ]`**

**GalenIvanov**

**[15:23](#msg608194e2c60826673bbc3b68)@hiiamboris Of coursw**

**[15:24](#msg6081953381866c680c3cd8d0)Sorry, Ion the**

**[15:24](#msg608195482e5574669b51e550)On the phone**

**rebred**

**[16:49](#msg6081a910a9dd556843f4cbe0)@toomasv what does**  
**`opt thru "%"` do ?**

**toomasv**

**[16:53](#msg6081aa20b9e6de24d64fca6d)In case `num` happens to be percent...**

**hiiamboris**

**[16:53](#msg6081aa21969f8b38ee950e08)it's for `percent!` type**

**[16:54](#msg6081aa2ab6a4714a29de93ba):turtle:**

**toomasv**

**[16:54](#msg6081aa35a2ac0d38e7d120ac):mouse:**

**greggirwin**

**[17:12](#msg6081ae91a2ac0d38e7d12baf)&gt; I am reading mixed files from a folder and need to separate them by type - the issue is that sometimes images are saved without extension**

**@rebred then sniffing and testing is what you'll need to do.**

**[17:16](#msg6081af6006e2e024e86cf080)Someone should RosettaCode one of these. So many variants!**

**hiiamboris**

**[17:29](#msg6081b276b6a4714a29deaa81)I think we should finish &amp; merge format first. So we can boast high level features on RC, not low level parse juggling.**

**greggirwin**

**[17:46](#msg6081b66adc24646812d98d47)Of course I agree, but there can be more than one entry there.**

**hiiamboris**

**[17:52](#msg6081b7e9b9e6de24d64fef27)Sure, but IMO it's better to avoid posting snippets where we're not ready to outplay the competition. By posting low level code we create a wrong image of Red. Index trickery, not declarativity. And something tells me we won't have format in the next few years at this rate ;)**

**greggirwin**

**[17:55](#msg6081b88281866c680c3d3c6f)So is it better to have something sooner, or wait for something better later? What about when you don't know when later will be?**

**hiiamboris**

**[17:56](#msg6081b8b955d78266a65f40af)\*\*I\** would post it when it's ready ;)**

**greggirwin**

**[17:56](#msg6081b8e846a93d4a19e1be27)You're no help at all. :^)**

**ne1uno**

**[17:57](#msg6081b8ecb6a4714a29debd58)https://rosettacode.org/wiki/RC\_POP.OUT**

**[17:57](#msg6081b8ec81866c680c3d3dec)rank: 127 (149 entries) REBOL**

**[17:57](#msg6081b8edb6a4714a29debd5b) rank: 143 \[tied] (115 entries) RED**

**hiiamboris**

**[17:57](#msg6081b8ed46a93d4a19e1be42):D**

**greggirwin**

**[17:58](#msg6081b950ae90f36840993423)I \*thnk* I"ve heard of Phix, but can't remember anything about it. It's all about being N+1.**

**ne1uno**

**[18:02](#msg6081ba40a9dd556843f4f9b4)phix is kind of a vanity fork of euphoria, but gaining since euphoria dev hit a wall. I no longer follow it much though**

**greggirwin**

**[18:05](#msg6081baf5c60826673bbc7f63)Ah, Euphoria was a nice language. It almost hooked me, but then I found Rebol.**

**hiiamboris**

**[18:27](#msg6081c02db6a4714a29ded202)Should this be so?**  
**`>> round/to 0 0 *** Math Error: math or number overflow *** Where: round *** Stack:`**

**[18:42](#msg6081c3b055d78266a65f5e2a)also**  
**`>> round/to 0 1.#inf *** Math Error: math or number overflow *** Where: round *** Stack: >> round/to 0 -1.#inf *** Math Error: math or number overflow *** Where: round *** Stack: >> round/to 0 -1.#nan *** Math Error: math or number overflow *** Where: round *** Stack:`**

**GalenIvanov**

**[18:51](#msg6081c5bac60826673bbc924d)My imperative solution to the `thousands`problem:**  
**`thousands: func[num][ res: copy "" while [(length? num) > 3][insert res rejoin ["," take/last/part num 3]] head insert res num ]`**

**[18:51](#msg6081c5c5a9dd556843f5186a)**  
**`>> thousands "123456789012345678901234567890" == "123,456,789,012,345,678,901,234,567,890" >> thousands "12345678901234567890123456789" == "12,345,678,901,234,567,890,123,456,789" >> thousands "1984" == "1,984" >> thousands "959" == "959" >> thousands "42" == "42"`**

**greggirwin**

**[18:58](#msg6081c74fa9dd556843f51d10)I was thinking an imperative solution would be a nice contrast. :^)**

**GalenIvanov**

**[18:59](#msg6081c78aa2ac0d38e7d16646)no `reverse` at least :)**

**greggirwin**

**[18:59](#msg6081c79455d78266a65f6880)@hiiamboris what would be a better alternative?**

**hiiamboris**

**[19:02](#msg6081c84ab9e6de24d6501c87)well, `round/to x 0` could return `x`, `round/to x inf or nan` - always nan**

**[19:03](#msg6081c8821f84d71853d373ee)`round/to x 0` I encountered when formatting a number, so it's not a made up case**

**[19:04](#msg6081c8d355d78266a65f6b2c)although `form` forms everything under `0.0001` in exponential mode, so I had to limit the rounding precision at that anyway**

**[19:06](#msg6081c94597cf5067467a022a)&gt; well, `round/to x 0` could return `x`, `round/to x inf or nan` - always nan**

**hmm.. now that I think of it, `round/to inf inf` may also return `inf`... :/**

**greggirwin**

**[19:07](#msg6081c95a2e5574669b526b24)`NaN` makes sense to return `NaN`.**

**`Inf/-Inf` \*could* return their respective values as pass-thru. What is the multiple of infinity?**

**[19:07](#msg6081c974a9dd556843f52428)So those 3 cases all pass thru.**

**hiiamboris**

**[19:07](#msg6081c984dc24646812d9c0ca)yeah right.. but `round/to non-inf-nan inf` should be nan, because we don't know which infinity is closer**

**greggirwin**

**[19:09](#msg6081c9cfd795391861748775)That's not much better than an error, is it? We're still just abdicating.**

**hiiamboris**

**[19:09](#msg6081c9dda9dd556843f524ca)https://stackoverflow.com/questions/10788486/ieee-754-rounding-to-positive-infinity**

**[19:09](#msg6081c9e655d78266a65f6dee)(reading)**  
**&gt; Round towards positive infinity means the result of the rounding is never smaller than the argument.**

**&gt; Round towards negative infinity means the result of the rounding is never larger than the argument.**

**Funny, so `round/to x +inf` = `+inf`, `round/to x -inf` = `-inf` by IEEE, if x is not nan**

**greggirwin**

**[19:10](#msg6081ca2706e2e024e86d37b3)If we take the doc string as a guide, which is accurate, `round/to x 0` should return `0`, shouldn't it?**

**[19:12](#msg6081ca8eae90f368409963d3)If it returns `x`, then a scale of 0 or 1 are equal. Also, the arg doc string says it must be a non-zero value. So they (you in this case) have at least been warned.**

**hiiamboris**

**[19:13](#msg6081cadc969f8b38ee95671e)**  
**`/to => Return the nearest multiple of the scale parameter. scale [number! money! time!] "Must be a non-zero value."`**  
**well, idk, I'd say result is undefined right now**

**greggirwin**

**[19:13](#msg6081cae3a9dd556843f52894)Sometimes I get lucky. The IEEE and intuitive results don't always go together.**

**hiiamboris**

**[19:13](#msg6081caf281866c680c3d70f7):D**

**greggirwin**

**[19:14](#msg6081cb0281866c680c3d7105)The definition is that you get an error. :^)**

**hiiamboris**

**[19:14](#msg6081cb1a55d78266a65f729a)which makes me write code to avoid it ;)**

**greggirwin**

**[19:15](#msg6081cb37b9e6de24d6502772)We want to keep you employed.**

**hiiamboris**

**[19:15](#msg6081cb43b6a4714a29def0ba)mkay ;)**

**greggirwin**

**[19:15](#msg6081cb6181866c680c3d7270)Would 0 be a useful result in your current use case? Because that makes more sense than `x` to me right now.**

**hiiamboris**

**[19:19](#msg6081cc481f84d71853d37def)suppose my number is 1e-322**  
**I want 3 significant digits, so I round it to 1e-325, which is outside of FP 64bit range and is == 0.0**  
**so I get overflow**

**[19:20](#msg6081cc73b9e6de24d6502a8e)while the machine could be smart enough to just return the number if it can't round it due to hardware limitations**

**[19:20](#msg6081cc98b9e6de24d6502aef)but I hit that in simpler scenario...**

**[19:21](#msg6081ccd2dc24646812d9ca32)I pass `0` as input -&gt; `log-10 0 = -inf`, so `round/to 0 10 ** (-3 + to 1 log-10 0)` is same as `round/to 0 0`... overflow**

**greggirwin**

**[19:32](#msg6081cf41a2ac0d38e7d17d85)You're right that a scale of 0 should return `x`. Time for me to make coffee.**

**[19:35](#msg6081cfeda9dd556843f53693)Assuming Nenad agrees. It's a justifiable result IMO, having not had coffee yet.**

**hiiamboris**

**[19:35](#msg6081cfffb9e6de24d6503546):D**

**gltewalt:matrix.org**

**[19:45](#msg6081d23cb6a4714a29df03d4)Release before it's "ready". Break early, change early.**  
**Things seem to die after version 2.0 when it's finally decided that a bunch of stuff needs to be better**

**greggirwin**

**[19:46](#msg6081d289b6a4714a29df04ae)This is docs we're talking about, and if the examples are core Red, they should still work and just be supplanted by more modern, higher level, examples when those are available.**

**gltewalt:matrix.org**

**[19:46](#msg6081d297969f8b38ee957e46)Red isn't targeting life support systems and the like, so I see issues along the way as ok - as long as everything is easy to get up and running and easy to use**

**[19:47](#msg6081d2deae90f36840997b7b)Docs can be just as much wip**

**greggirwin**

**[19:48](#msg6081d2f706e2e024e86d4f8f)That's the pain we're used to, so it seems normal. We move more at an evolutionary pace, hoping to ease that pain.**

**gltewalt:matrix.org**

**[19:49](#msg6081d343ae90f36840997bff)Kind of have a choice of designing a brilliant cathedral, and waiting, or ..**

**greggirwin**

**[19:52](#msg6081d4041f84d71853d38f8a)Things do have to evolve, agreed. But are we a cathedral/bazaar project, or are we a "how do we talk about building cathedrals, bazaars, La Sagrada Familia, mini-malls, skyscrapers, and kiosks" project?**

**gltewalt:matrix.org**

**[19:53](#msg6081d435969f8b38ee95836e)That depends. Do we have benevolent dictators, or no?**

**hiiamboris**

**[19:55](#msg6081d49b46a93d4a19e20af4)that's all sublime philosophy and all, but my experience is when I see one-liner I stop and examine it, when I see 30 LOC with for loops I skip it without looking and feel pity for the language users**

**gltewalt:matrix.org**

**[19:55](#msg6081d49fae90f36840998250)Sticking to the vision of one ruler (or a few) gives evolution a direction**

**greggirwin**

**[19:59](#msg6081d5aa46a93d4a19e20e2c)For better or worse, we're all different, and will have different tastes when it comes to how solutions are expressed. But if we try to guide people with empathy and respect, maybe our tribes at least won't go to war.**

**[20:02](#msg6081d667a9dd556843f54833)I don't have an answer for your last rounding problem @hiiamboris.**

**&gt; while the machine could be smart enough to just return the number if it can't round it due to hardware limitations**

**Always choices. How can the machine know if that rounding op \*must* be done or fail loudly?**

**hiiamboris**

**[20:08](#msg6081d7cadc24646812d9ed59)What would be the point of it failing loudly?**

**greggirwin**

**[20:16](#msg6081d99855d78266a65f9b0b)Same as for precondition concepts in general. If we impose constraints on the caller, we can provide postcondition guarantees. Of course, we can also word it that "out of bounds values clamp at limits", but sometimes it can help to know when wacky values are going through a system and default to a known value of your choosing.**

**[20:20](#msg6081da7306e2e024e86d5fd9)In this case, your issue goes away if a scale of zero returns `x`, correct?**

**hiiamboris**

**[20:21](#msg6081dab381866c680c3d9572)yes**

**greggirwin**

**[20:24](#msg6081db7ad79539186174b483)Then I think we can make %float.reds line 917 just do the same as line 919, returning the value rather than throwing an error. The intuitive idea being that the closer you get to a scale of zero, the closer you get the original value. We can document this, and people can avoid `round` if needed. If Nenad still wants it to throw an error, with a good reason behind that choice, it's just a bit more work to check that case when we know it's possible because the scale is calculated.**

**hiiamboris**

**[20:25](#msg6081dbbea2ac0d38e7d19f17)should I make a REP?**

**[20:26](#msg6081dc00a9dd556843f5566d)no clue if they ever look into REP repo though :D**

**greggirwin**

**[20:28](#msg6081dc74ae90f368409996e5)I have only looked at %float.reds, so asking first will save PR'ing changes to other types in case @dockimbel disagrees. The changes should be pretty easy though, so whichever you prefer.**

**[20:30](#msg6081dcd906e2e024e86d64dc)Integer and money seem clear, and pair uses integer rounding. Time uses float, so should be easy all around.**

**GiuseppeChillemi**

**[21:16](#msg6081e7bc969f8b38ee95b612)&gt; @GiuseppeChillemi you can use an empty block as well as an empty paren as @zentrog:matrix.org noted.**  
**&gt;**  
**`> >> () > >> if true [] > >> either false ['yes!][] >`**  
**&gt; He's also correct that you don't want to use it. Use `none` instead.**

**Imagine you want to transmit the result of a series of functions and one returns unset:**  
**`[ func1 none func2 1 func3 unset! ;Its a datatype! func4 "" func5 () ;It's empty parens func6 [] ;it's empty block ]`**

**The is actually symbol to map unset to, as "unset!" is a datatype. Unset has not a symbol, so you cannot rapresent it.**

**Also `mold/all` -&gt;`load do` does not return UNSET as value but as word:**

**`probe load mold/all ()`**

**My observation was that you simply can't rapresent and transmit `unset` as value.**

**[21:22](#msg6081e904b6a4714a29df402b)While `none` could be molded and later loaded, this is not possible for `unset`.**

**`>> mold/all none == "#[none]" >> mold/all () == "unset" >>`**

**Unset seems more an event than a datatype as it has no symbol representing it, so it's (the only) value you can't send.**

**[21:22](#msg6081e92946a93d4a19e23dd8)Its a paradox: it is a value but it has not a value.**

**hiiamboris**

**[21:25](#msg6081e9aeb6a4714a29df41a0)a lot of values are lost during load/mold cycle**

**[21:25](#msg6081e9b146a93d4a19e23fcf)use redbin**

**specifically, your issue is https://github.com/red/red/issues/4126#issuecomment-557804476**

**greggirwin**

**[21:25](#msg6081e9c297cf5067467a3cae)**  
**`>> save/as b: #{} () 'redbin == #{52454442494E0200010000000400000002000000} >> load/as b 'redbin`**

**GiuseppeChillemi**

**[21:26](#msg6081e9fc969f8b38ee95bc29)Yes Hiiamboris, I know this but it was an observation related to receiving values in a human readable way through a result string.**

**greggirwin**

**[21:26](#msg6081ea10b6a4714a29df41fe)Eventually, it is very likely that `unset!` will have construction syntax, so `mold/all` will support it.**

**[21:28](#msg6081ea8846a93d4a19e242da)But we also have to accept that not all values will have literal forms. Just as you have to handle objects or vectors when serializing today.**

**GiuseppeChillemi**

**[21:33](#msg6081ebc3dc24646812da2222)I can't comment further. I was working on a remote command server in Rebol and I have found myself unable to represent the "unset" value returned from `print`.**

**[21:34](#msg6081ebf597cf5067467a3fb2)So I have tried it in Red and this has generated my post here, to share this experience with you.**

**hiiamboris**

**[21:40](#msg6081ed30a9dd556843f5812c)I don't like unset either. But it plays a role in the console.**

**[21:40](#msg6081ed6281866c680c3dc380)I don't see any positive value in error (`x: ()`) and `set/any` though.**

**[21:41](#msg6081ed851f84d71853d3cf3c)maybe veterans will shed some light**

**Oldes**

**[22:18](#msg6081f633b6a4714a29df5e12)@hiiamboris `(x: ())` is actually same as `x:` so the error makes sense.**

**[22:22](#msg6081f728b9e6de24d650981f)Of course... we could set `x` to hold `#[unset!]`, but than one day you will make in some huge code a bug, which could be simplified as `f: does [x:] f` and without error you may end with several nice hours of debugging.**

**gltewalt**

**[23:22](#msg60820529ae90f3684099f7e1)Are there any docs for `port` other than `gpio`?**

**[23:38](#msg60820905a9dd556843f5bebc)I see a `system/ports` and a `system/schemes`, I see that I can make port!, and I see a `register-scheme` - but I'm not aware of any writings on ports**

****Friday 23th April, 2021****

**greggirwin**

**[03:02](#msg608238afb9e6de24d6511eb6)Not yet @gltewalt.**

**hiiamboris**

**[07:16](#msg608274621f84d71853d4f03d)@Oldes no, that's not a serious argument. I do forget to return a value once in a while, and usually that buggy function will return the last result of loop evaluation or something. It's a general problem, which having erroring unset doesn't help at all. And certainly some hypothetical mistake case I don't recall occurring doesn't justify all the pain of handling unset when I have to.**

**[07:19](#msg608274eba2ac0d38e7d2efa2)In fact, `[x: y: z:]` is even useful at object creation.**

**[07:19](#msg608274f9b9e6de24d651a4ad)(no need to add none)**

**toomasv**

**[07:51](#msg60827c7581866c680c3eec3d)Does this difference indicate bug?**  
**Here series is copied:**  
**`>> b: copy/deep a: #(a: [1 2]) == #( a: [1 2] ) >> append a/a 3 == [1 2 3] >> b == #( a: [1 2] )`**  
**But here series is not copied:**  
**`>> b: copy/deep a: #(a: "12") == #( a: "12" ) >> append a/a "3" == "123" >> b == #( a: "123" )`**

**[07:57](#msg60827dd2dc24646812db6bb5)Sorry, this was meant for bugs-room**

**qtxie**

**[07:59](#msg60827e7ec60826673bbde65f)I think it's a bug. all the series should be copied.**

**hiiamboris**

**[08:15](#msg60828205ae90f368409b0b34)maps are very problematic https://github.com/red/red/issues/2167#issuecomment-801358034**

**toomasv**

**[08:56](#msg60828bd1b6a4714a29e0a331)Ah, good, it is known already.**

**bubnenkoff**

**[12:51](#msg6082c2ba06e2e024e86f71d7)I know about `forall`, but why foreach do not set values?**  
**`data: [ aa: none bb: none ] foreach [k v] data [ set 'v 123 ] probe data`**

**GalenIvanov**

**[14:10](#msg6082d564c60826673bbe9dc9)@bubnenkoff You just set a word `v` in the global context to refer to the value `123`**

**[14:10](#msg6082d56d46a93d4a19e46726)**  
**`>> v == 123`**

**[14:11](#msg6082d57e55d78266a661e075)Maybe you need something like this:**

**[14:11](#msg6082d58a46a93d4a19e46751)**  
**`>> foreach [k v] data [ data/:k: 123 ] == 123 >> data == [ aa: 123 bb: 123 ]`**

**zwortex**

**[16:51](#msg6082fb1897cf5067467c58ff)Hi everyone.Got a quick question regarding parse and keep. Cheers.**

**`; Keep used outside parse merges results as per default collect [ keep [x x] keep [y y] ] ; => [x x y y] ; With keep/only, elements are concatenated collect [ keep/only [x x] keep/only [y y] ] ; => [[x x][y y]] ; When used in parse dialect, it works like keep/only a: [x y] r: [ collect [ some [ copy v word! keep ( reduce [ v/1 v/1 ] ) ] ] ] parse a r ; => [[x x][y y]] ; Is there a way to have it merge elements instead ?`**

**hiiamboris**

**[16:58](#msg6082fcce81866c680c403974)nope, but you can `keep (v/1) keep (v/1)` for that**

**zwortex**

**[17:23](#msg6083028655d78266a662582f)Hi @hiiamboris, thank you !**

**Ok for repeating keep multiple times, but I may need to repeat it an unknown number of times, like in the following.**

**`a: [x 3] r: [ collect [ copy tag word! copy nb integer! keep ( res: copy [] append/dup res tag/1 nb/1 ) ] ] parse a r`**

**The only workaround I found is to avoid keep for this particular types of rules, and append directly into the collection block. Is it safe to do so however ?**  
**`a: [x 3] b: copy [] r: [ collect into b [ copy tag word! copy nb integer! ( res: copy [] append/dup res tag/1 nb/1 append b res ) ]] parse a r probe b`**

**toomasv**

**[17:25](#msg6083030246a93d4a19e4ea93)I have wished that `keep pick` would do that.**

**hiiamboris**

**[17:27](#msg60830389ae90f368409c554a)Safe. And no need in collect.**

**zwortex**

**[17:32](#msg608304bdb9e6de24d65320c5)Ok thanks - collect/keep is used with other rules, that is why I need it anyhow.**

**hiiamboris**

**[17:50](#msg608308daa9dd556843f8266a)It's best not to mix keep of parse with other series funcs**

**[17:51](#msg60830913b6a4714a29e1ee7e)https://github.com/red/red/issues/2189**

**zwortex**

**[18:24](#msg608310d4ae90f368409c796e)Could not understand anything to the related bug. Hopefully I am not streching things that far ! I'll test and see how it goes.**

**greggirwin**

**[18:53](#msg608317b7b9e6de24d65356ac)@toomasv et al, I wrote deep notes to @dockimbel about `make/copy`. Waiting for his thoughts.**

**hiiamboris**

**[18:56](#msg6083184da2ac0d38e7d496e7):+1:**

**greggirwin**

**[19:04](#msg60831a45c60826673bbf34ab)Carl's public statement on `unset!`: http://www.rebol.net/r3blogs/0318.html**

**rebred**

**[19:07](#msg60831aedb9e6de24d6535eb7)**  
**`str: {dir:=/local~name:=/office.cvs~drawers:=/left-isle} print parse str [collect [some[copy a any to {:=} 2 skip copy b any to [{~} | end] skip keep (a) keep (b)]to end]] ==dir /local name /office.cvs`**  
**I am not able to get last couple of records**  
**`drawers` and**  
**`left-isle`**

**GalenIvanov**

**[19:20](#msg60831df455d78266a662a303)@rebred What about this:**

**[19:20](#msg60831e0b46a93d4a19e53139)**  
**`print parse str[collect[some[keep to ":=" 2 skip keep to ["~" | end] skip]]] dir /local name /office.cvs drawers /left-isle`**

**rebred**

**[19:26](#msg60831f6997cf5067467cad72)@GalenIvanov thaat's great thanks!!!**

**GalenIvanov**

**[19:33](#msg6083210eae90f368409ca081):+1:**

**rebred**

**[19:42](#msg6083230b46a93d4a19e53dbe)@GalenIvanov**  
**`str: {test:=123~atest:=545~testz:=098} parse str[collect[some[copy a to ":=" 2 skip copy b to ["~" | end] (set to-word a b) skip] ]] == test: 123 atest: 545 testz: 098`**  
**is this good?**

**[19:44](#msg60832385ae90f368409ca651)in order to collect the values into words**

**toomasv**

**[19:44](#msg6083239cae90f368409ca6bb)Trying it:**  
**`>> mark: [":=" | "~"] print parse str [collect any [keep to mark mark | keep to end]] dir /local name /office.cvs drawers /left-isle`**

**rebred**

**[19:45](#msg608323e8c60826673bbf4a0c)@toomasv amazing thanks!!!!**

**[19:46](#msg60832414b6a4714a29e23c5c)I didn't even think it was possible to write anything like this !**

**GalenIvanov**

**[19:47](#msg6083243755d78266a662b324)@toomasv This is elegant!**

**toomasv**

**[19:48](#msg6083249ac60826673bbf4bcc):)**

**rebred**

**[19:49](#msg608324dcdc24646812dd14fb)**  
**`case [ suffix = "txt" [ print "TXT" ] suffix = "csv" [ print "CSV" ] suffix = "html" [ print "HTML" ] suffix = ".DS_Store" [ print "SKIP IT..."] find name {/} [ print "DIR..." ] true [ print "unknown!!!"] ]`**  
**is this faster or using**  
**`any` is better ?**

**greggirwin**

**[20:10](#msg608329a2d79539186177e11d)`case` is a good choice there.**

**rebred**

**[20:10](#msg608329b7a9dd556843f880ae)@greggirwin thank you!**

**[20:22](#msg60832ca3969f8b38ee98d3e6)@toomasv**  
**`query_string: {test1:=ok1~test2:=ok2~test33:=yes} mark: [":=" | "~"] print parse query_string [collect any [copy a to mark mark | copy b to end] (set to-word (a b) ]`**  
**I am trying to assign each parsed value to words like:**  
**`test1: "ok" test2: "ok2" test33: "yes"`**

**greggirwin**

**[20:28](#msg60832dd7969f8b38ee98d69d)Once you have your block of results, just use `set`.**

**hiiamboris**

**[20:32](#msg60832ee281866c680c40c287)&gt; Carl's public statement on `unset!`: http://www.rebol.net/r3blogs/0318.html**

**Thanks @greggirwin . Carl says "We want that to happen" and "usage of uninitialized variables" but it looks like this idea was never supplemented with real examples.**

**rebred**

**[20:34](#msg60832f4681866c680c40c3dc)@greggirwin set to-word \["test" "123" "test2" "abc"] ?**

**hiiamboris**

**[20:34](#msg60832f58a9dd556843f88ed4)`set [a: b: c:] [1 2 3]`**

**rebred**

**[20:35](#msg60832f9f81866c680c40c49b)@hiiamboris so I will have to create 2 blocks when using parse**

**hiiamboris**

**[20:36](#msg60832fdbb6a4714a29e25cd3)hmm.. you could have used parse to transform that query into a loadable string... and loaded it**

**Oldes**

**[20:37](#msg60833017d79539186177f26f)@hiiamboris do you have a real example how it should work than?**

**hiiamboris**

**[20:39](#msg60833079d79539186177f34a)Unset you mean? I would make it a valid value and remove set/any and get/any.**

**[20:44](#msg6083319506e2e024e870ab5d)Typesets are gonna catch it anyway, so I'm totally not afraid of it propagating far, just as `none` doesn't**

**Oldes**

**[20:45](#msg60833202ae90f368409cd3b1)What is your motivation?**

**hiiamboris**

**[20:47](#msg6083327697cf5067467cd882)To reduce the code and more importantly, cognitive overhead of writing it.**  
**https://gitlab.com/search?utf8=%E2%9C%93&amp;search=set%2Fany&amp;group\_id=&amp;project\_id=18539768&amp;scope=&amp;search\_code=true&amp;snippets=false&amp;repository\_ref=master&amp;nav\_source=navbar**

**[20:51](#msg60833354ae90f368409cd775)and god forgive me but I'll mention R2-compatible way of using unset:**  
**https://github.com/red/red/blob/6efcbb5e92127c319e748c41291b26b40f9b3aec/utils/preprocessor.r#L145**

**[20:52](#msg608333a897cf5067467cdba5)https://github.com/red/red/blob/6efcbb5e92127c319e748c41291b26b40f9b3aec/utils/preprocessor.r#L172**

**Oldes**

**[21:00](#msg6083356da2ac0d38e7d4e6fd)So it's all about something like this?**  
**`>> x: print now 23-Apr-2021/22:58:57+2:00 >> x ** Script error: x has no value`**  
**And no need to write `set/any` where you expect that `#[unset!]` may appear?**

**hiiamboris**

**[21:10](#msg608337bb2e5574669b55f82f)yeah**

**[21:11](#msg60833809b6a4714a29e27159)but also consistency**

**[21:11](#msg60833815c60826673bbf7404)`foreach` gladly sets anything to unset**

**[21:12](#msg60833822b6a4714a29e27169)maps get and set unset transparently**

**[21:12](#msg6083383797cf5067467ce5a6)and maybe something I don't recall right now**

**[21:16](#msg608339411f84d71853d6f155)**  
**`>> x ** Script error: x has no value`**  
**here I would prefer no error though from `x` which is `get 'x`**

**[21:18](#msg6083399955d78266a662eb52)i.e. I care about `get` behavior, not console behavior**

**Oldes**

**[21:30](#msg60833c8d46a93d4a19e5828b)&gt; `foreach` gladly sets anything to unset**

**what do you mean? I see `none`**  
**`>> foreach [a b c][1][reduce [a b c]] == [1 none none]`**

**[21:32](#msg60833cd855d78266a662f519)Ah... you mean that it should be `unset` instead of `none`, right?**

**[21:40](#msg60833eb6b9e6de24d653b8d6)@hiiamboris if there would not be error in the `>> x` case, than you could write in the console whatever without such an error.**

**[21:41](#msg60833ef2a9dd556843f8b747)(which is probably the main reason why it is how it is)**

**hiiamboris**

**[21:43](#msg60833f8746a93d4a19e588b7)**  
**`>> foreach x reduce [()] [print type? :x] unset`**

**[21:43](#msg60833f9c46a93d4a19e588e6)I mean `foreach` does not throw an error**

**[21:44](#msg60833fb546a93d4a19e5897b)**  
**`>> foreach [x y z] reduce [() () ()] [break] >> type? :x == unset!`**

**[21:44](#msg60833fd1969f8b38ee98ff10)but set does in the same scenario:**  
**`>> set [x y z] reduce [() () ()] *** Script Error: x needs a value`**

**[21:45](#msg60833ff91f84d71853d70252)&gt; @hiiamboris if there would not be error in the `>> x` case, than you could write in the console whatever without such an error.**

**that's likely the reason, right**  
**but what benefit does it provide?**

**[21:45](#msg60834015c60826673bbf8884)**  
**`>> () >> :x >> x *** Script Error: x has no value`**  
**How is last line more helpful?**

**[21:48](#msg608340c5d795391861781b06)And if it is helpful, can't we solve console issues in console itself?**

**Oldes**

**[21:53](#msg608341c01f84d71853d70659)I'm not sure if it can be solved in console... console does not know if the `unset` is result from function like `print` or from a word which has no value.**

**[21:53](#msg608341d71f84d71853d706b5)I agree, that the `foreach` vs `set` inconsistency is bad.**

**greggirwin**

**[21:53](#msg608341da81866c680c40f3ef)I don't have the bandwidth to comment on `unset!` in depth (which I'm sure you're all grateful for ;^), but it's an important design point to address clearly. I say this specifically with HOFs in mind.**

**Quick thoughts:**

**- `None!` propagates pretty far today IMO. It's confusing at times because it \*is* a valid value.**

**- You may have to handle unset if you're dealing with unknown code ( @hiiamboris' many examples). We can view things in two ways. a) The calling code has to handle it, because it might get it as a value. b) Make it clear that returning `unset!` is dangerous if you don't know how it will be handled higher in the call chain.**

**- `Unset!` is Red's NULL. How do people feel about NULL? We know what Hoare thinks.**

**hiiamboris**

**[21:54](#msg6083422897cf5067467cfca1)`NULL` does not throw an error**

**[21:56](#msg608342a781866c680c40f635)&gt; I'm not sure if it can be solved in console... console does not know if the `unset` is result from function like `print` or from a word which has no value.**

**maybe.. or maybe it could `do/next` expressions in the input line and have a special case if it's last expression is `word`**

**[21:58](#msg6083430ab6a4714a29e28bb1)&gt; None! propagates pretty far today IMO. It's confusing at times because it is a valid value.**

**Example? ;)**  
**(let's not forget `none` is in `default!` typeset, but not `unset`)**

**rebred**

**[22:09](#msg60834586ae90f368409d0153)does the**  
**`rename` file work ?**

**greggirwin**

**[22:09](#msg608345acdc24646812dd655a)@rebred have you tried it? If it doesn't work, have you searched for tickets about it?**

**rebred**

**[22:12](#msg6083466a55d78266a6630b60)first I tried to use it and I kept converting from file to string to binary to anything - then I started searching and I found on gitter examples from 2017 and 2019 - so I have been searching for a couple of hours**

**greggirwin**

**[22:13](#msg6083467546a93d4a19e598d6)&gt; `NULL` does not throw an error**

**Neither does `unset!`. It's code that doesn't handle it which throws the error.**

**Examples would be the series funcs `none!` support was added to, as a convenience, because of things like `select/find` and ordinals returning it rather than throwing an error as in R2. But in general, `none!` is everywhere (which is OK, because that's part of its purpose). If we bless `unset!` as equally valid, we don't know how widely it will end up being used, and for what purposes.**

**rebred**

**[22:15](#msg608346eb969f8b38ee990e61)@greggirwin the command**  
**`rename` exists - I guess it doesn't actually work ?**

**Oldes**

**[22:17](#msg60834760a9dd556843f8cccd)@rebred yes.. it looks it does not work on Windows.**

**rebred**

**[22:17](#msg6083476d97cf5067467d0825)@Oldes i am on the mac**

**[22:17](#msg6083478781866c680c4102f2)**  
**`>> rename %38.gif %39.gif *** Script Error: rename does not allow file! for its from argument *** Where: rename *** Stack:`**

**Oldes**

**[22:17](#msg60834792a9dd556843f8cd07)https://github.com/red/red/issues/4307**

**greggirwin**

**[22:18](#msg6083479e969f8b38ee990fa7)We should put TBD in the doc string or stub that in as an error result. The action placeholder is there, but not implemented in the supported types yet.**

**hiiamboris**

**[22:20](#msg6083483fb9e6de24d653cfe4)'null' equivalent is 'none' as I recall from a discussion about making maps accept it as value.**

**greggirwin**

**[22:24](#msg60834926ae90f368409d09a0)That's only for JSON.**

**[22:28](#msg60834a2546a93d4a19e5a06f)It's possible that it's the best mapping for other foreign "nothing" values as well. None is a real value, a thing you can touch. Unset/Null is "something doesn't exist". None is also context sensitive, in that you can't tell "hasn't been set yet" from "the user said NONE" just by looking at the value. Unset is really an implementation detail that continually tries to escape into userspace.**

**[22:38](#msg60834c77c60826673bbfa691)Unset ties to error handling as well, and brings up again the importance of nailing down patterns for writing robust code. I don't think there will be a one-size pattern that works for everything, and I want to see this addressed at the R/S level as well.**

**GiuseppeChillemi**

**[23:37](#msg60835a3ab9e6de24d653f68e)About `UNSET`, here is a previous blog entry: http://www.rebol.net/cgi-bin/r3blog.r?view=0207**

**greggirwin**

**[23:41](#msg60835b2f97cf5067467d33c7)Thanks @GiuseppeChillemi.**

**[23:46](#msg60835c44a9dd556843f8fd27)That brings up the big, related point of why `unset!` is truthy.**

****Saturday 24th April, 2021****

**rebred**

**[01:44](#msg60837807dc24646812ddd08f)**  
**`str: {te-st:=123~a-test-:=545~testz:=0-98} print parse str[collect[some[keep to ":=" 2 skip keep to ["~" | end] skip]]]`**  
**how can I skip the `-` char in the entire string?**

**toomasv**

**[04:36](#msg6083a03aae90f368409db70d)Use `replace/all`?**

**GalenIvanov**

**[08:15](#msg6083d3a8b9e6de24d654e77c)@rebred What is the expected result ?**

**ldci**

**[08:17](#msg6083d42aae90f368409e2efc)\[!\[image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/8ez8/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/8ez8/image.png)**

**[08:18](#msg6083d4511f84d71853d83196)An efficient thermal image segmentation without NN: just redCV tools**

**hiiamboris**

**[08:41](#msg6083d9d081866c680c42345d)what if it guessed the threshold from the histogram?**

**ldci**

**[08:51](#msg6083dbffc60826673bc0cab7)@hiiamboris Sorry not the good room. In ths sample I keep only the Red channel from original image and apply a zero function to Green and Blue channels. No needs for histogram : a simple thresholding to make a mask image with 0 or 255 values according to threholding value. Then just add orginal and mask image to get the result segmented image. Very fast.**

**GalenIvanov**

**[08:53](#msg6083dc8b97cf5067467e3c11)@ldci Thank you for sharing and for the explanation!**

**ldci**

**[08:54](#msg6083dcbe1f84d71853d84708)@GalenIvanov You’re welcome**

**hiiamboris**

**[09:01](#msg6083de5255d78266a6644333)But you're still setting the threshold manually.**

**ldci**

**[09:01](#msg6083de87a9dd556843fa0993)@hiiamboris Yes**

**hiiamboris**

**[09:02](#msg6083dea91f84d71853d84bf0)nvm :) great job! I'm just exploring the possibilities..**

**ldci**

**[09:07](#msg6083dfeea9dd556843fa0cf3)@hiiamboris : I see what you mean . I’ll explore statistical approach for an automatic thresholding. For complicated images (with important noise), the way I adopted is a semantic segmentation with C-NN network. But it’s longer.**

**hiiamboris**

**[11:52](#msg60840673b6a4714a29e4227d)&gt; About `UNSET`, here is a previous blog entry: http://www.rebol.net/cgi-bin/r3blog.r?view=0207**

**Thanks @GiuseppeChillemi , good discussion.**

**Also, @Oldes provided a great example to me yesterday:**  
**`>> there must be the error 1 == 1`**  
**We expect an error here, no objections.**  
**Which also made me think of the following cases:**  
**- some global function gets renamed during refactoring and we forget to change the name somewhere**  
**- some global function gets misspelled (e.g. `value` instead of `value?`)**

**Unlike `x: print y` these are the cases I'm encountering for real, and they're helping debug the program enormously.**

**I also recalled I'm relying myself on throwing unset in the `ERROR` macro, which simply expands to `do make error! #composite`. Due to numerous #include bugs, macro may not get expanded, so I'm intentionally not naming it `#ERROR` as I would name any other macro, but omit the shard. The issue `#ERROR` will be silently skipped and I will never notice an error before it propagates very far where it's hard to deduce it's origin. While word `ERROR` will tell me that it's undefined right away.**

**That however justifies only errors during evaluation of words, nothing else.**  
**E.g. we could let `get 'x` be silent (instead of `get/any 'x`), but `x` - throwing.**  
**Though `get/any 'x` isn't a big issue, because we have `:x` form, and `get/any` in Red should only be used when we pass the word to a function as lit-arg or get-arg.**

**Same, I don't see any reason why `set` should throw other than to catch unset coming as a function result during assignment. However what are the chances of one of us:**  
**1) writing the code that assigns to `x:` a result of a function returning unset? (`print` and `??` are well-known, and there are only a few such functions)**  
**2) not getting `x` after that (which shows the error), but letting it propagate further somehow? (`:x` would let it propagate but makes little sense when dealing with known data)**

****Sunday 25th April, 2021****

**rebred**

**[10:20](#msg6085428397cf5067468135d0)@toomasv @GalenIvanov thank you, I though I could do the skipping in parse - I'll use search**  
**`replace/all` then**

**toomasv**

**[11:01](#msg60854c21b9e6de24d6581101)@rebred You can do it in parse too, but it will unnecessarily complicate the rule.**

**rebred**

**[11:33](#msg60855398a2ac0d38e7d95c70)i see thanks! @toomasv**

****Monday 26th April, 2021****

**rebred**

**[01:46](#msg60861b5cc60826673bc59f5c)**  
**`case [ suf = ["gif" | "jpeg" | "jpg" | "png" | "svg" | "bmp" | "webp" | "heif"] [print "img"] suf = "txt" [ print "txt" ] suf = "css" [ print "css" ] suf = "csv" [ print "csv" ] suf = "js" [ print "js" ] ]`**  
**is there a way to make this work ?**

**GiuseppeChillemi**

**[01:51](#msg60861cbd06e2e024e876ef3d)The first line should be:**

**`find ["gif" "jpeg" "jpg" "png" "svg" "bmp" "webp" "heif"] suf [print "img"]`**

**gltewalt:matrix.org**

**[01:52](#msg60861ce0a9dd556843feed7f)Use `any` ?**

**[01:53](#msg60861d37c60826673bc5a30c)`suf = any ["gif" "jpeg" "jpg" "png"][print "img"]`**

**Off the top of my memory. Not at computer at the moment.**

**GiuseppeChillemi**

**[01:56](#msg60861dce55d78266a6692335)or**  
**`parse suf [any ["gif" | "jpeg" | "jpg" | "png" | "svg" | "bmp" | "webp" | "heif"]] [print "img"]`**

**rebred**

**[02:40](#msg6086282846a93d4a19ebb0e9)@GiuseppeChillemi @gltewalt:matrix.org thank you!!!!**

**toomasv**

**[05:13](#msg60864bdf969f8b38ee9f72c1)@rebred How about this?**  
**`types: clear #() total: 0 foreach file read %./ [ total: total + 1 suf: suffix? file case [ dir? file [types/dir: 1 + any [types/dir 0]] all [suf find ["gif" "jpeg" "jpg" "png" "svg" "bmp" "webp" "heif"] suf: form next suf] [types/img: 1 + any [types/img 0]] suf [t: to-word suf types/:t: 1 + any [types/:t 0]] 'else [types/none: 1 + any [types/none 0]] ] ] print types print ["TOTAL:" total]`**

**lylgithub2021**

**[06:56](#msg60866421a9dd556843ff8b9d)`view [f: field button [f/text: "123" set-focus f]]`. Action of the button make `field f` show "123" as expected. Then I input "4" from keyboard, which make the field show "4123", not "1234". This is because the cursor is at the beginning of the former string in field, not at the ending. So how can I get "1234" in my case? Or, how to control the position of cursor in `field`?**

**hiiamboris**

**[07:04](#msg608665ec97cf50674683ada6)At the moment, only by selecting part of the text then deselecting. Or writing routines packed with WINAPI calls.**

**GalenIvanov**

**[07:09](#msg60866718d7953918617ec14b)@toomasv Thank you for sharing this code. Apparently I missed this method for initialization/update of a map.**

**toomasv**

**[07:12](#msg608667e0b9e6de24d65a79f3)@GalenIvanov You are welcome! Er.. where did you miss it?**

**GalenIvanov**

**[07:14](#msg6086686055d78266a669c7be)In some codegolf answers :smile:**

**[07:16](#msg608668b946a93d4a19ec3ef3)I've always used the long `either key[update key value][initialize key valye]`**

**lylgithub2021**

**[08:36](#msg60867b701f84d71853ddf10d)@hiiamboris Would you give more details, please?**

**hiiamboris**

**[08:51](#msg60867f1bdc24646812e459b2)Unfortunately I can't recall how to hack it with the `selected` facet. So routines only.**

**[08:53](#msg60867f72a9dd556843ffd251)See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-setcaretpos**

**[08:53](#msg60867f83a9dd556843ffd268)But IMO it's too early for you to dig into Red/System.**

**GalenIvanov**

**[09:04](#msg6086823406e2e024e877d309)@lylgithub2021 I experimented with a silly idea; it's not practical but it partially works:**

**[09:04](#msg60868237ae90f36840a404e2)**  
**`txt: copy "" view [ f: field on-key[txt: rejoin [f/text do pick[event/key ""]char? event/key]] on-key-up[clear f/text f/text: txt] button [f/text: "123" set-focus f] ]`**

**[09:12](#msg608683f3d7953918617f0c50)The problem is that it always appends the new characters at the end, even you place the cursor in the middle :smile:**

**rebred**

**[09:40](#msg60868a75ae90f36840a416f7)@toomasv thank you!!!**

**[10:06](#msg608690bf1f84d71853de24a0)@gltewalt:matrix.org thank you!!**

**hiiamboris**

**[15:34](#msg6086dd76a9dd55684300d17c)remove-each**

**rebred**

**[15:34](#msg6086dd9397cf50674684ddfc)thank you! @hiiamboris**

**hiiamboris**

**[15:36](#msg6086ddfdb6a4714a29ea6311)or `exclude a [%.test]`**

**rebred**

**[15:43](#msg6086df8ab6a4714a29ea6753)cool!!! thank you!! @hiiamboris**

**[19:12](#msg608710b5ae90f36840a585be)i have a file named**  
**`0! @#ok.png` in a directory called**  
**`testdir`**

**if I drag this file into a browser I get**  
**`0!%20%20@%23ok.png`**

**with Red I am reading this directory with**  
**`file_names: read to-file {./testdir/}`**

**Red gives this result**  
**`0!%20%20@#ok.png`**

**how can I make Red give me the result the browser gives me**

**hiiamboris**

**[19:17](#msg608711ba2e5574669b5e8ff6)how do you get that result? for me it is:**  
**`>> to file! "0! @#ok.png" == %"0! @#ok.png"`**

**[19:19](#msg6087123ea2ac0d38e7dd8a40)using 2-year old stable version?**

**gltewalt**

**[19:22](#msg608712ea06e2e024e8795def)`enhex`**

**[19:24](#msg6087135446a93d4a19ee0a73)browser should say `0%21%2520%2520%40%23ok.png`, though. I think. Anyway that's what `enhex` should give**

**[19:26](#msg608713e8969f8b38eea17f79)ahh..**  
**`>> to file! enhex "0! @#ok.png" == %"0%21%20%20%40%23ok.png"`**

**rebred**

**[19:28](#msg60871458a9dd556843016f77)@gltewalt that is amazing thanks a lot!!!!**

**gltewalt**

**[19:29](#msg608714ab06e2e024e8796167)No problem**

**[19:32](#msg6087155955d78266a66b9531)How about adding an example to the wiki for the "How Do I Do X with Red?"**

**[19:32](#msg6087155bae90f36840a593c7)https://github.com/red/red/wiki/%5BHOWTO%5D-How-Do-I-Do-X-with-Red%3F**

**rebred**

**[20:16](#msg60871f9081866c680c499c3f)@gltewalt added!**

**[20:36](#msg60872457d79539186180bcc9)@gltewalt so there is no way to read it directly 'enhexed....I gues I should do a**

**`to file! enhex dehex "0!%20%20@#ok.png"`**

**gltewalt:matrix.org**

**[21:09](#msg60872c23a05f8b582a0bb2ee)I dont know. Not sure what you're goal is**

****Tuesday 27th April, 2021****

**lylgithub2021**

**[00:23](#msg60875999bdc0bc32e61dee9c)@GalenIvanov an interesting idea, thank you!**

**GalenIvanov**

**[03:42](#msg60878829be35363915919a17)@lylgithub2021 :+1:**

**Oldes**

**[09:56](#msg6087dfd8da3e853b33d6e31a)@rebred :point\_up: \[April 26, 2021 3:46 AM](https://gitter.im/red/help?at=60861b5cc60826673bc59f5c)**  
**`switch/default suf [ "gif" "jpeg" "jpg" "png" [print "img"] "txt" [print "text"] ][ print suf ]`**

**stmungo**

**[10:37](#msg6087e95c2c5b9d392f3628eb)How do I remove a key/value pair from a map! datatype, please?**

**hiiamboris**

**[10:38](#msg6087e9b9471bee582e194e57)remove/key**

**GalenIvanov**

**[10:39](#msg6087e9c4bdc0bc32e61f46fa)@stmungo**

**[10:39](#msg6087e9c8a05f8b582a0d7c5a)**  
**`>> m: #(a 10 b 30) == #( a: 10 b: 30 ) >> remove/key m 'a == #( b: 30 ) >> m == #( b: 30 )`**

**[10:39](#msg6087e9e30dd2e30b30eed864)as @hiiamboris said :smile:**

**stmungo**

**[10:39](#msg6087e9fe6258d04c53062214)Thank you, both.**

**GalenIvanov**

**[10:45](#msg6087eb54471bee582e195387)@stmungo :+1:**

**stmungo**

**[10:45](#msg6087eb5da05f8b582a0d7f9f)I have just noticed that I made an typing error when I tried "m/a: none" before I asked for help, so it did not appear to work.**

**GalenIvanov**

**[10:47](#msg6087ebc4b38a713b2fb0c646)What didn't appear to work?**

**stmungo**

**[10:55](#msg6087edb7c1a9210b3c2358fc)**  
**`>> m1 == #( a: 10 c: 30 ) >> m1/a: none == none >> m1 == #( c: 30 ) >> I typed "m1/2" instead of "m1/a" in the above little experment`**

**GalenIvanov**

**[11:29](#msg6087f59569231732f4c3978e)hmm, it doesn't work for me.**

**[11:29](#msg6087f5abbe3536391592b834)(removing a key by setting it to `none`)**

**stmungo**

**[11:32](#msg6087f643471bee582e196fce)I have just noticed that you can have "none" as a value in the map literal and extend second argument. Is this intensional?**

**&gt;&gt; probe extend #(a: 10 b: 20 c: none) \[b: none d: none]**  
**#(**  
**a: 10**  
**b: none**  
**c: none**  
**d: none**  
**)**  
**== #(**  
**a: 10**  
**b: none**  
**c: none**  
**d: none**  
**)**

**hiiamboris**

**[11:43](#msg6087f8d8bdc0bc32e61f6efd)`none` in map is the equivalent of `null` in JSON dictionary**

**stmungo**

**[12:11](#msg6087ff7d69231732f4c3b140)@hiiamboris So "none" is a legitimate value which is not assigned by the setter assignment but rather used to denote a remove operation instead?**

**hiiamboris**

**[12:34](#msg608804ccbdc0bc32e61f8fb6)legitimate but nothing to do with remove**

**GalenIvanov**

**[12:50](#msg60880881e2b4072e55f501ce)I continue with unorthodox (and slow) experiments with Red functions. Today, while thinking of examples `forall`, I ended up with a function for generating a list of the powers of 2 :smile:**

**[12:51](#msg608808c6bdc0bc32e61f99cd)**  
**`powers-of-2: func[n][ c: next b: 1 + make vector! n + 1 forall c[c * 2] b ]`**

**[12:51](#msg608808e5c1a9210b3c23a44c)**  
**`>> print powers-of-2 20 1 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384 32768 65536 131072 262144 524288 1048576`**

**hiiamboris**

**[12:52](#msg608808f569231732f4c3c9b1):D**

**GalenIvanov**

**[12:52](#msg6088090bc1a9210b3c23a51e)It's silly, I know**

**hiiamboris**

**[12:53](#msg60880930da3e853b33d7534e)I still have a little hope that vector design will be revised ;)**

**GalenIvanov**

**[12:53](#msg60880942c29ca4049cd9df9d):+1:**

**toomasv**

**[16:34](#msg60883d28da3e853b33d7e93b)@GalenIvanov But it is twice as fast as this:**  
**`powers-of-2b: func[n][ b: 2 + make vector! n + 1 forall b [b/1: b/1 ** ((index? b) - 1)] b ]`**

**zwortex**

**[16:45](#msg60883f9f0e19524c642b3e91)I was wondering : is there a strategy for localizing a script written in red language ? For instance, I have an application that displays a view currently in english, that I would like translated in spanish. How can I do that ? Also, I noticed that numbers are displayed with a period as decimal separator. How can I have them displayed with a comma instead. Cheers.**

**hiiamboris**

**[16:53](#msg6088419fda3e853b33d7f5c0)well, `replace formed-number #"." #","` ?**

**[16:56](#msg608842456258d04c53071119)On L10N - I'm not aware of any official plans towards it, but I can tell it's not there yet.**

**[16:56](#msg60884254da3e853b33d7f7e6)If you have anything to add to https://github.com/red/red/issues/2852 - you're welcome to**

**[16:58](#msg608842aa9b27712e507c6b83)Also my advice - if you know you're going to localize your program later, learn to use \[#composite](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/composite.md). A macro to substitute strings from the language file will be easy to write. You'll be able to do that yourself.**

**[17:03](#msg608843cf69231732f4c46724)Also more involved number formatters can be found \[here](https://github.com/greggirwin/red-formatting/blob/master/formatting-functions.adoc).. if you really need them.**

**zwortex**

**[17:16](#msg608846e2c29ca4049cda8926)Thanks for all these answers. I'll have a look to that in detail. I think nowadays internalization is important. I would say mandatory and therefore it should be at the core of the language, as much as possible. For instance, a string that is meant to be displayed to the user should be collected automatically in a language pack that could be translated in various target languages without modifying the code in any way. More complex scenarios should be taken into account as well like various formatting strings - sprintf like format that is easier to handle...**

**btiffin**

**[17:48](#msg60884e57e2b4072e55f5c929)Why can I find some discussion about the motivation to drop counted `for` loops?**

**GalenIvanov**

**[17:53](#msg60884f87c29ca4049cdaa129)@toomasv Oh, I'm glad to hear that!**

**btiffin**

**[18:47](#msg60885c24b38a713b2fb20767)Why = where, doh**

**gltewalt:matrix.org**

**[19:41](#msg608868ee0dd2e30b30f03475)You might search in the Wiki**

**[19:42](#msg6088691fbe3536391593f157)Sometimes discussions are saved and a page is made there to preserve**

****Wednesday 28th April, 2021****

**rebred**

**[00:30](#msg6088acba9b27712e507d7621)i installed Red 0.6.4 on Ubuntu 20.04.2 LTS in the /usr/local/bin folder**

**I can run it by typing**  
**`red` in the terminal and I get:**

**`--== Red 0.6.4 ==-- Type HELP for starting information. >>`**  
**I can run a file with red test.red and it works fine**

**but when I try to compile like**  
**`red -c test.red`**

**I get**  
**`*** Access Error: cannot open: %-c *** Where: read *** Stack: --== Red 0.6.4 ==-- Type HELP for starting information. >>`**

**gltewalt**

**[00:54](#msg6088b24fda3e853b33d91113)Did you compile it from rebol, or download it?**

**[00:55](#msg6088b2850dd2e30b30f0e327)Last Stable doesn't have the issue**

**[00:56](#msg6088b2b1a05f8b582a0f7c00)https://static.red-lang.org/dl/linux/red-064**

**[01:03](#msg6088b44fbe3536391594a411)err, compile from source or download it?**

**rebred**

**[01:05](#msg6088b4bd0dd2e30b30f0e9b9)@gltewalt thatk you I just tried the stable release and it works fine**

**gltewalt:matrix.org**

**[01:06](#msg6088b50ed24b29049789e237)Mention it in red/bugs**

**rebred**

**[13:32](#msg608963e5d24b2904978b90f9)**  
**`red-064` last stable as**  
**`root` on**  
**`Ubuntu 20.04.2 LTS`**  
**I put it in**  
**`/usr/local/bin` and give**  
**`chmod 755`**  
**I installed**  
**`Nginx` and**  
**`fcgiwrap`**  
**Nginx properly runs CGI scripts in Perl and Bash inside the**  
**`cgi-bin` folder**  
**Nginx properly runs compiled Red script that are inside**  
**`/usr/local/bin`**  
**but when it tries to run Red to execute a test file I get a 502 bad gateway**  
**Nginx runs as user**  
**`www-data`**

**In the terminal logged as**  
**`root` I can run Red but when**  
**I'm' logged as**  
**`www-data` and I try this**  
**`www-data@ubuntu-nginx:~$ red *** Script Error: cause-error does not allow file! for its args argument *** Where: cause-error *** Stack: make-dir cause-error`**  
**logged as a**  
**`www-data` with the stable version of Red I get**  
**`www-data@ubuntu-nginx:~$ red-064 *** Driver Internal Error: Access Error : Cannot make directory /var/www/.red/ *** Where: throw-on-error *** Near: [make-dir temp-dir]`**  
**&gt;**

**[13:34](#msg6089646ba05f8b582a112768)does anyone know what permission should I set to be able to run Red as**  
**`www-data`**

**loziniak**

**[14:39](#msg60897397a05f8b582a114f53)Hi! I'm a little supprised with this:**  
**`>> unset 'c b: func [/local c] [do "c: 15"] b c == 15`**

**hiiamboris**

**[14:49](#msg608975ffc1a9210b3c275263)No surprise. `do` calls `load` on strings, `load` produces a block bound to `system/words`. Your `c` is global there. `bind` it if you want it local.**

**[14:58](#msg608977fc471bee582e1d4b94)@rebred check if you have write access to `/var/www/` under that account maybe.**

**Oldes**

**[15:01](#msg608978bb471bee582e1d4d9a)@loziniak**  
**`unset 'c b: func [/local c] [probe c do bind load "c: 15" 'c probe c ] b unset? :c`**

**rebred**

**[15:58](#msg6089861fd24b2904978bf56a)**  
**`www-data@ubuntu-nginx:~$ cd /var/www/ www-data@ubuntu-nginx:~$ touch test touch: cannot touch 'test': Permission denied www-data@ubuntu-nginx:~$`**  
**@hiiamboris I don't have write access to**  
**`/var/www/`**

**is it normal that Red tries to create a dir in**  
**`/var/www/` when launched ?**

**hiiamboris**

**[16:04](#msg6089878c6258d04c530a4544)what does `echo $HOME` say?**

**rebred**

**[16:05](#msg608987d5be3536391596bc83)**  
**`www-data@ubuntu-nginx:/usr/local/bin$ echo $HOME /var/www`**

**hiiamboris**

**[16:06](#msg608987f9c29ca4049cddacf9)Thought so.**

**rebred**

**[16:07](#msg60898824d24b2904978bfacd)no matter where I am, where I try to run Red I get that error**

**hiiamboris**

**[16:07](#msg6089885a0dd2e30b30f302e5)Well, why don't you just copy the `console` executable that it installed into `/home/root/.red` somewhere and use it instead of R2 launcher? Unlikely you need to compile anything in your CGI anyway.**

**rebred**

**[16:11](#msg608989200e19524c642e82f2)**  
**`root@ubuntu-nginx:/home# ls libRedRT-defs.r libRedRT-include.red libRedRT.so test4.red root@ubuntu-nginx:/home#`**

**hiiamboris**

**[16:11](#msg608989426258d04c530a4a37)right, sorry, just `/root/.red` or `~/.red` since you're under root**

**rebred**

**[16:37](#msg60898f3969231732f4c7ac93)@hiiamboris I changed the group permission for**  
**`/var/www/` and now it works ! thanks a lot!!**

**hiiamboris**

**[16:46](#msg6089914a2c5b9d392f3a674c):+1:**

**gltewalt**

**[17:34](#msg60899cb00dd2e30b30f3373a)Should a description be added to `Other useful functions:` in the `help` output?**

**[17:43](#msg60899ecbc29ca4049cdde587)Or mention it in -**

**`Use HELP or ? to view built-in docs for functions, values for contexts, or all values of a given datatype: help append ? system ? function!`**

**loziniak**

**[20:19](#msg6089c361d24b2904978c9eda)@hiiamboris @Oldes thanks. What are benefits of having `load` and `do` always use global context instead of local?**

**hiiamboris**

**[20:38](#msg6089c7a8b38a713b2fb5a8ee)`load` has no idea about the context you invoke it in**

**[20:38](#msg6089c7ae2c5b9d392f3af9c4)it has no means to know**

**GiuseppeChillemi**

**[23:02](#msg6089e96d0dd2e30b30f400c6)How could I check if a word is defined in a context function from the inside of it?**

**[23:03](#msg6089e9d5c1a9210b3c287773)**  
**`>> x: func [/s][probe in context? 's to-word 's] == func [/s][probe in context? 's to-word 's] >> x *** Script Error: in does not allow function! for its object argument *** Where: in *** Stack: x probe`**

**[23:08](#msg6089eaf26258d04c530b4be4)Also, I think that `context?` should accept refinements as argument**  
**`>> x: func [/s][probe in context? /s to-word 's] == func [/s][probe in context? /s to-word 's] >> x *** Script Error: context? does not allow refinement! for its word argument *** Where: context? *** Stack: x probe`**

****Thursday 29th April, 2021****

**toomasv**

**[04:25](#msg608a3557471bee582e1f259c)@GiuseppeChillemi Do you mean something like this?**  
**`x: func [w /s r][print to-logic find/case spec-of context? 'w w]() x /s ;true x 's ;false x 'w ;true x 'r ;true x 'q ;false`**

**[05:27](#msg608a43ddc29ca4049cdf69f6)Generalized:**  
**`in-func?: func [f [any-function!] w [all-word!] /case][to-logic either case [find/case spec-of :f w][find spec-of :f w]]() in-func? :find 'only ;== true in-func?/case :find 'only ;== false in-func?/case :find /only ;== true in-func? :in-func? 'w ;== true in-func? :in-func? /w ;== true in-func?/case :in-func? /w ;== false`**  
**Then your case above could be solved as:**  
**`x: func [/s][print in-func? :x 's]() x ;true x: func [/s][print in-func? :x /s]() x ;true x: func [/s][print in-func?/case :x 's]() x ;false x: func [/s][print in-func?/case :x /s]() x ;true`**

**bubnenkoff**

**[10:45](#msg608a8e47e2b4072e55fb5d08)I need to create JSON array to pass it to app in another language. So it should look like:**  
**`[""" Hello, "Mike" """]`**  
**How I can do such string from Red string?**  
**`[{ Hello, "Mike" }]`**

**hiiamboris**

**[10:50](#msg608a8f5de2b4072e55fb5f88)Read https://w.red-lang.org/en/datatypes/string "3. Literal syntax"**

**bubnenkoff**

**[10:52](#msg608a8ff2d24b2904978e7606)Yes I understand that `{}` is only red string representation. Is the only way to make it text and then replace with `"""` ?**

**rebolek**

**[10:54](#msg608a9054e2b4072e55fb61ea)`{` is NOT part of the text, so you can’t replace it**

**[10:54](#msg608a907dd24b2904978e778f)you can do for example `rejoin [{"""} { Hello, "Mike" } {"""}]`**

**loza:matrix.org**

**[11:04](#msg608a92dabe353639159959c4)although this does not look like correct JSON array.**

**rebolek**

**[11:12](#msg608a94afb38a713b2fb77e6b)it looks like Python**

**[11:13](#msg608a94d6a05f8b582a14169e)you can make JSON with simple `to-json`**

**bubnenkoff**

**[12:45](#msg608aaa7369231732f4ca52be)yes, you are right**

**rebred**

**[21:52](#msg608b2aba471bee582e21ae43)**  
**`str: {a1|a2|432|test|last|} p: parse str[collect[some[keep to "|" skip]]]`**  
**is there a way to avoid collecting the last item**  
**like**  
**`["a1" "a2" "432" "test"]`**

****Friday 30th April, 2021****

**toomasv**

**[04:21](#msg608b85cd93ac573bba75a0e3)@rebred You could probably avoid the last by using `ahead` and counting items (bars) ahead ... but it is waistful. Better use helper:**  
**`chop: func [series [series!]][head remove back tail series] p: chop parse str[collect[some[keep to "|" skip]]] == ["a1" "a2" "432" "test"]`**  
**There is drawback to this method -- if there is no bar in the end, then "last" is not collected, and instead "test" is chopped.**  
**Alternatively split it, then remove trash and last:**  
**`p: split str #"|" while ["" = last p][chop p] chop p ;== ["a1" "a2" "432" "test"] str: {a1|a2|432|test|last} p: split str #"|" while ["" = last p][chop p] chop p ;== ["a1" "a2" "432" "test"] str: {a1|a2|432|test|last|||} p: split str #"|" while ["" = last p][chop p] chop p ;== ["a1" "a2" "432" "test"]`**

**rebolek**

**[05:25](#msg608b94c9d261cc4d749bb786)@rebred as @toomasv said, you can achieve it using `ahead`, no counting is actually needed:**  
**`p: parse str[collect[some[keep [to "|" not [#"|" end]] skip]]]`**

**toomasv**

**[05:30](#msg608b95f9d261cc4d749bba72)Indeed! It could even be**  
**`p: parse str[collect[some[keep [to ["|" not end]]] skip]]]`**  
**But it would still suffer from multiple bars in the end of `str`.**

**[05:34](#msg608b96ccd964ec55387e9922)Ha, multiple bars problem can be avoided with `to [some "|" ...]`.**

**rebolek**

**[06:01](#msg608b9d27d261cc4d749bcac7)Easier and nicer! I wouldn’t bother about multiple bars as we don’t know if the input data could contain them.**

**toomasv**

**[06:43](#msg608ba72c0845c416dcb5ce2c)True.**

**rebred**

**[13:23](#msg608c04c275aeb43be71ba1ce)thank you @toomasv @rebolek**

**toomasv**

**[15:41](#msg608c25284d0065337e45d74a):+1:**

****Sunday 2nd May, 2021****

**Rapid-GTR\_gitlab**

**[15:49](#msg608ec9f220d4f026319a053b)Hello, hope someone can help with a syntax problem that I just can't find an answer to:**

**[15:49](#msg608eca11ff705616c76a8ce2)Red \[]**  
**x: 101**  
**y: 201**  
**print type? x ;as i got some error message about not accepting an integer**  
**print x ;as I got a message saying x not defined**  
**if x&gt;= 100 and y&gt;= 200 \[print "Hurray!"]**

**So no Hurray! I am used to writing if else endif etc., nut I need to put in two values, and if they are both correct, then I can go further. i suppose that the case syntax will be similar, but I have tried all sorts of different connotations (hence print x and print type) but they all give me errors.**

**Could you please tell me how do I do this simple logic???**

**hiiamboris**

**[15:57](#msg608ecbdcd5e2793379ea2012)1) `x>=` is a single word in Red. Spaces are important**  
**2) Red has no operators precedence. So `a >= b and c >= d` is the same as `((a >= b) and c) >= d)`**

**[15:58](#msg608ecc3dd261cc4d74a30a0c)I strongly suggest reading http://www.rebol.com/docs/core23/rebolcore-3.html first**

**Rapid-GTR\_gitlab**

**[16:03](#msg608ecd5ed261cc4d74a30c86)Thanks. I have searched through as much Red literature as I can find, but I have not come across an "if" statement containing more than one value argument. Perhaps that doesn't exist in Red. If one can put in more than one value argument, then do you know how to to do that?**

**ldci**

**[16:20](#msg608ed15b20d4f026319a17ae)If all \[x &gt; = 100 y &gt; = 200] \[print « Hurray!"]**

**toomasv**

**[16:25](#msg608ed27f75aeb43be72203a5)Also:**  
**`if and~ x >= 100 y >= 200 [print "Hurray!"] if (x >= 100) and (y >= 200) [print "Hurray!"] if not any [x < 100 y < 200] [print "Hurray!"] if not (x < 100) or (y < 200) [print "Hurray!"] if not or~ x < 100 y < 200 [print "Hurray!"]`**

**Rapid-GTR\_gitlab**

**[16:53](#msg608ed907d964ec5538860c7b)Thanks very much, et merci Francois (clavier GB) - ca marche. And Toomas - I tried and~ but obviously in the wrong position! Thank you. I tried brackets too, but curly ones! And " not any" is a good idea. "Not" and "not or~" is a good idea too. I can use that. Just syntax problems it seems.**

**[17:37](#msg608ee367963923553adc966b)@toomasv @ldci Thanks again.**

**toomasv**

**[17:53](#msg608ee70e20d4f026319a49a7)@Rapid-GTR\_gitlab You are welcome!**

**Rapid-GTR\_gitlab**

**[18:58](#msg608ef64d98ee821821a5a99d)@toomasv 👍 Been to Lithuania and Latvia in 2009, before they were any McDonalds, and Finland about 45 years ago, but missed your neck of the woods, unfortunately!**

**Oldes**

**[20:01](#msg608f051a4d0065337e4c517a)@Rapid-GTR\_gitlab Also:**  
**`unless any [x < 100 y < 200] [print "Hurray!"]`**

**Rapid-GTR\_gitlab**

**[20:53](#msg608f116475aeb43be7229587)Very good! Thanks! @Oldes**

****Monday 3th May, 2021****

**Rapid-GTR\_gitlab**

**[15:36](#msg60901889c651cb6a000d261b)I use Red-Ride as a text editor...**

**planetsizecpu**

**[15:37](#msg609018c32cc8c84d8509e8cb)@Rapid-GTR\_gitlab There is also**  
**`either x < 100 [true block][false block]` that may afford your specs.**

**[15:37](#msg609018d575aeb43be724de09)Welcome by the way**

**[15:38](#msg609018e80056b2262c27c96d)😀**

**Rapid-GTR\_gitlab**

**[15:41](#msg609019b0f7e4221825b55921)@planetsizecpu ¡Gracias!**

**planetsizecpu**

**[15:42](#msg609019d10845c416dcc0094b)😉**

**hiiamboris**

**[15:51](#msg60901be90056b2262c27d318)Uses what in .red file?**

**Rapid-GTR\_gitlab**

**[16:03](#msg60901eb5d261cc4d74a60a39)&gt; Uses what in .red file?**

**Is this a reference to my post. Boris? If so, "what" would be the contents of the last entry in the clipboard (obviously copied Red code as I wrote above). If not, sorry for interrupting your chain of thought!**

**hiiamboris**

**[16:05](#msg60901f50f7e4221825b5679c)This is how I see it:**  
**!\[](https://i.gyazo.com/3f529e3f14fc77bfe112970373e5f751.png)**

**Rapid-GTR\_gitlab**

**[16:08](#msg6090200d98ee821821a84971)I am obviously not very good at using these forums! I edited the text to read: "I don't know whether anyone uses the following in a .red file. I have only just started learning the language, and I came across "read-clipboard". So I created a .red file with the code " Red\[] do read-clipboard " and copied the code I wanted to run into the clipboard, and then ran the file in the interpreter. It seems to work, anyway in Windows 10 running ditto.", but try as I might, the little tick doesn't want to play ball and save my text! I see that it is still in the edit mode. If you can solvd this for me, please let me know how to do that.**

**hiiamboris**

**[16:12](#msg609020db98ee821821a84b32)&gt; I am obviously not very good at using these forums!**

**Ah. Gittard problems. Sometimes it eats my messages, esp. when my connection glitches. This editing glitch is new for me ;)**

**[16:14](#msg6090214b31d2306a0e8b5cfb)Glad to see you're adapting to Red ;)**  
**What I'm using is a function: `dorc: does [do read-clipboard]`. Since I'm running a Red console day and night, I just enter `dorc` in the console when I need to test copied text (:**

**Rapid-GTR\_gitlab**

**[16:19](#msg609022a9963923553adf69ae)Thanks for the sympathy, Boris. I would attach a screenshot if I knew how to do that. I thought that you experts might use it, but I looked for any reference to this, but couldn't find one. It is yet another facet of Red that I find saves time. Very interesting language. I will post it again. Hopefully...**

**[16:21](#msg6090230f963923553adf6aaf) I don't know whether anyone uses the following in a .red file. I have only just started learning the language, and I came across "read-clipboard". So I created a .red file with the code " Red\[] do read-clipboard " and copied the code I wanted to run into the clipboard, and then ran the file in the interpreter. It seems to work, anyway in Windows 10 running ditto. @hiiamboris has another version above.**

**greggirwin**

**[17:30](#msg6090333f98ee821821a87a81)@Rapid-GTR\_gitlab some of us have launch shortcuts set up so Red `do`es a file on startup, so we have local environments with things we use commonly in the console.**

**rapid-gtr**

**[17:46](#msg609036e80056b2262c2820a8)Boris too, Gregg! I just thought it would be handy to add this to the help for people who are just starting out, to learn a bit more quickly. Do you have other shortcuts which might be helpful?**

**greggirwin**

**[18:22](#msg60903f82d5e2793379ed74a1)I load quite a lot, but here are the clipboard related shortcuts I use:**  
**`do-clip: does [do read-clipboard] load-clip: does [load read-clipboard] cc: func [value][write-clipboard mold value]`**

**planetsizecpu**

**[19:22](#msg60904d6fd261cc4d74a68626)I used to load the**  
**`more` command on my repo, but not lately.**

****Tuesday 4th May, 2021****

**rapid-gtr**

**[13:24](#msg60914b1275aeb43be727c614)Is there a limit to the number of charaters that Red can handle? I have a "string" of numbers (about 2000 of them, no spaces between them) from a QR code), which I tried to count. Then tried to reverse. Then tried... Anyway, Red seemed to give up after reading in about 30 numbers, or I did something wrongly. I can paste the numbers in a post, but I suppose that would not be necessary.**

**hiiamboris**

**[13:31](#msg60914ccb2cc8c84d850cd2d1)No limit.**

**rapid-gtr**

**[13:39](#msg60914e904d0065337e5198aa)@hiiamboris OK, good! So what am I doing wrongly that I can't count the input and can't reverse the string? I get "Syntax Error: invalid value at {: ^{"870286471674522280928613331456437653}" on trying to print out the length of a, where a is the string. I have tried enclosing the string in inverted commas, brackets, curly brackets, normal brckets, and any combination of those.**

**hiiamboris**

**[13:48](#msg609150b375aeb43be727d599)I've no idea without seeing the code, but your string looks totally invalid to me**

**rapid-gtr**

**[13:56](#msg6091528320d4f02631a01450)I found one problem, Boris. I had a :, and changed that to a:. which made a difference. After the string, I use :**  
**print integer? a**  
**print float? a**  
**TO-STRING a**  
**print string? a**

**length? a**  
**print a**

**[13:56](#msg609152a7ff705616c7709800)and I get**  
**false**  
**false**  
**false**  
**8.702864716745223e85 4.171372412363803e86 5.633845363972335e86 6.734540358322535e86 2.21120115438457e85 2.703072733312331e86 5.626770335276563e86 6.852536761356663e86 9.094339456440662e86 6.210693700542166e86 5.461770605685855e85 7.000602423625728e86 1.280771313741593e86 2.27539455911455e86 2.103665100931703e86 7.369550745703823e86 6.765767422143771e86 2.143507757057761e86 3.313245236771746e86 3.644685821543628e29**  
**&gt;&gt;**

**[13:58](#msg60915307963923553ae255ae)and length? a returns 20**

**[14:05](#msg609154b2f7e4221825b84d87)Curly brackets!!! That works! Hurray! I just wish I knew when to use them! I now have the reversed string. That's marvellous!**

**hiiamboris**

**[15:23](#msg609166e8c651cb6a00105180)That's why I ask you again to read http://www.rebol.com/docs/core23/rebolcore-3.html first**

**rapid-gtr**

**[15:47](#msg60916c81c651cb6a00105fb2)Thanks. Must have missed "Multiline format strings are enclosed in braces." I read that for comments, but not for code. Thanks.**

****Wednesday 5th May, 2021****

**greggirwin**

**[18:48](#msg6092e87131d2306a0e92024c)@rapid-gtr you'll find that much of Red's power comes from its rich set of datatypes, and learning their lexical forms (their syntax) is key to making your life easier. There are a few hurdles you'll trip over as you learn Red, which is part of the process. We'll help you dust yourself off when you do.**

****Thursday 6th May, 2021****

**rebred**

**[10:10](#msg6093c0a62cc8c84d8512da87)in the terminal on a mac I am able to send email using the following command:**

**`but when I use this it doesn't work`call/output {echo "test body" | mail -s "test!" "test@test.com"} a: ""\`**

**hiiamboris**

**[10:13](#msg6093c12d75aeb43be72dd4b5)`/shell`**

**[10:14](#msg6093c1720056b2262c30bc7e)`|` token is not a program argument, it's a shell's operator**

**rebred**

**[10:14](#msg6093c18f963923553ae836fa)great thanks!!! @hiiamboris**

**zwortex**

**[16:57](#msg609420120845c416dcc9d839)When you dump an object hierarchy, especially with cycles (like parent object), it is quickly impossible to read. See for instance probing a face tree.**

**That leads me to two questions :**  
**- is there a clever probe ? that prints out a tree from top to bottom or just limits its self to a certain depthness**  
**- is there a way of printing the reference to an object, not the object itself (i.e. an object id - a memory slot whatever that identifies the object without the need of dumping it).**

**I understand you can have your own printing function.**

**hiiamboris**

**[17:42](#msg60942a7d20d4f02631a72c9f)&gt; - is there a clever probe ? that prints out a tree from top to bottom or just limits its self to a certain depthness**

**No. I tried to make one for Draw blocks but that didn't work out well. With faces it'll be easier though.**

**&gt; - is there a way of printing the reference to an object, not the object itself (i.e. an object id - a memory slot whatever that identifies the object without the need of dumping it).**

**Only by writing a routine.**

**zwortex**

**[18:25](#msg6094347cc651cb6a001724d6)@hiiamboris, thanks.**

**[19:24](#msg6094427793ac573bba8a5b4e)How to unselect within a text list ?**

**`view [ text-list data [ "1" "2" ] ]`**

**As I can select without coding, I would expect to be able to un-select as well. However not. Once a selection is made, it can only be unmade by coding. And even so, I could not find a proper way to do it. In the following, on-down event is used to set the selected facet to none. It works somehow but not nicely : sometimes a single click is enough to unselect, but most often you need to double click.**

**`view/no-wait [ text-list data [ "1" "2" ] on-down [ print [ "Down" "face/selected:" face/selected "event/picked:" event/picked ] if face/selected == event/picked [ face/selected: none ] ] on-select [ print [ "Select" "face/selected:" face/selected "event/picked:" event/picked ] ] on-change [ print [ "Change" "face/selected:" face/selected "event/picked:" event/picked ] ] on-dbl-click [ print [ "Dbl click" "face/selected:" face/selected "event/picked:" event/picked ] ] on-focus [ print "Focus" ] on-unfocus [ print "Unfocus" ] ]`**

**I used a workaround, adding an extra line. Is there a better way ?**  
**`view/no-wait [ text-list data [ "1" "2" ""] ]`**

**hiiamboris**

**[19:31](#msg6094442c93ac573bba8a6057)`face/selected: none` should work**

**zwortex**

**[19:32](#msg60944435963923553ae99c0e)Also there is a strange unfocus event when the list does acquire the focus.**

**hiiamboris**

**[19:32](#msg6094443620d4f02631a77325)I see it doesn't if I click on the 2nd item**

**[19:32](#msg60944453ff705616c777ebb2)please raise an issue about `selected: none` not working**

**[19:33](#msg6094448a93ac573bba8a6143)and a separate one about `unfocus` event**

**[19:34](#msg609444b00845c416dcca41a7)View events pipeline is a mess, the more issues you raise the more chances are they'll revise it ;)**

**zwortex**

**[20:15](#msg60944e53f7e4221825bfc54b)Ok, For the focus: https://github.com/red/red/issues/4891**  
**For the unselection: https://github.com/red/red/issues/4892**

**hiiamboris**

**[20:23](#msg6094503d93ac573bba8a8041)thanks!**

**zwortex**

**[20:47](#msg609455f34d0065337e5915f8)Probe does not distinguish none and #\[none]. Should it not ?**  
**`; none a: [#[none] none] probe a ;= [none none] ;the same with true and probable other values b: [#[true] true] probe b ; [ true true ] ;it is especially important when using reduce/compose. For instance, c: compose [ a: none b: (none) ] probe c`**

**hiiamboris**

**[20:52](#msg609456fcd5e2793379f77755)use `print mold/all`**

**[20:53](#msg60945738f7e4221825bfd8f6)it is by design, probe is for the reader, and reader doesn't want to see the unnecessary noise**

**zwortex**

**[20:54](#msg6094577931d2306a0e959473)but I am the reader trying to find bugs !**

**hiiamboris**

**[20:55](#msg609457a531d2306a0e959531)(:**

**dsunanda**

**[21:23](#msg60945e590056b2262c326897)@zwortex &gt; See for instance probing a face tree.**  
**It's not perfect but `dump-face` goes some way toward what you want. It's source might inspire you to do better :)**  
**`v: view/no-wait [box box panel [box box panel [box] box]] dump-face v`**

**zwortex**

**[21:51](#msg609464c7c651cb6a0017a0f4)@dsunanda, thanks for the hint**

**[22:02](#msg6094677b31d2306a0e95bbd0)Quick question. You have copy/part, insert/part, append/part, remove/part. You would expect to have foreach/part. But it is nowhere to be seen ! How come ? You might even consider forall/part, even if it looks crazy.**

**greggirwin**

**[22:48](#msg609472412cc8c84d8514ada3)If it looks crazy, that counts as -1 to start. :^) Ultimately it's about balance and what seems best subjectively. Syntactic sugar tastes good, but too much isn't good for you. @hiiamboris has a different idea, a `part` function that complements other series functions. We also still haven't ruled out `slice`. Fortunately, it's easy to prototype ideas at the mezz level to see how we like them, which you could do with a `foreach-part`.**

**zwortex**

**[23:35](#msg60947d3c93ac573bba8aed5c)Thanks @greggirwin. I will experiment as you suggest.**

****Friday 7th May, 2021****

**zwortex**

**[00:27](#msg609489654d0065337e598950)In the wish list also...**

**I wish there was a parent or preferably outer keyword similar to self but referring to the context outside of the object.**

**In fact, that would not be a "pointer" to that context but merely a means to prevent a word being rebound. You may then write something like this :**

**a: make object! [**  
**s: copy \[]**  
**empty?: function \[] [**  
**outer/empty? s**  
**]**  
**]**

**hiiamboris**

**[06:50](#msg6094e318f7e4221825c114dc)that doesn't align with the language design though, at all ;)**

**zwortex**

**[08:36](#msg6094fc1fff705616c77996e5)Why would it not be so ? The keyword would be ignored by load and only taken into account by make object. I guess self is treated in a similar way at the function level anyway.**

**rebolek**

**[08:41](#msg6094fd57d5e2793379f8ede8)because there is no parent.**

**hiiamboris**

**[08:42](#msg6094fd65d5e2793379f8ee14)1. `outer/empty?` likely refers to a function inside the `a` object, not to `system/words/empty?`**  
**2. making exceptions to `bind` weakens the design and \*will* lead to horrible bugs and gotchas**  
**3. there is no "context outside of object" as you can put this object into different other objects or none at all**

**[08:43](#msg6094fda120d4f02631a92475)I suggest you implement your idea first on mezz level or using system/lexer/pre-load, see how it helps you and then present it to us ;)**

**[08:45](#msg6094fe23f7e4221825c1588a)And there is no exception made for `self`.**

**zwortex**

**[09:24](#msg6095075098ee821821b472f3)@rebolek, @hiiamboris**  
**I understand there is no parent to an object (unless explicitly defined as with faces). I understand that an object has a context, and therefore anything defined outside of it can be viewed as its outer context (this is the same difference that exists within a function between local and extern words). I understand also that in practice, unless you mess around with make object!, the knowledge of the world that has an object results from the successive binds its code was subject. Such a keyword (outer similar to extern) can selectively prevents the rebound of certains words, without the need for a global path. It is both handy and consistent with the language design as far as I understand it.**  
**1- in my example, outer/empty? does indeed refer to system/words/empty?. However it is redefined by the object itself for those using this particular context.**  
**2- this is a general comment, often proven true, but in this particular case, I don't see why it would be such a risk. It would need to be tested anyway as you further suggest**  
**3- already answered**  
**4- as for self, I don't know. But it could : not be treated as a regular path but just a means to prevent the word being rebound when a function is built : make object! would rebind these words, make function! would not.**

**hiiamboris**

**[09:36](#msg60950a14c651cb6a001926a6)make function! does not bind `self`, make object! does**

**[09:36](#msg60950a2d75aeb43be7310b3f)for `outer` you would need the parent object to bind it (and even that will be tricky as you wish to refer to different contexts with it) but the inner one to not**

**zwortex**

**[10:17](#msg609513d2ff705616c779d432)Need to think it further but basically the idea would be to delay the binding for words prefixed with the path outer. A regular word is bound in descendant order ( i.e. an enclosing context bind a word before the enclosed context has a chance to do it), a word prefixed with outer would be bound the other way round, in ascendant order, or more probably be bound normally in descendant order (as a regular path) and rebound in ascendant order when the entire hierarchy of enclosed contexts is known.**

**[14:36](#msg609550584d0065337e5b6f30)This is a trap ! How is it possible to allow such things ?**

**a: 0**  
**either \[ a &lt;&gt; 0 ] [**  
**print "Yes"**  
**][**  
**print "No"**  
**]**

**hiiamboris**

**[14:55](#msg609554dd0056b2262c34ba57)Once you get familiar with Red you never make such errors.**

**zwortex**

**[15:07](#msg609557bfd964ec553895db75)I guess so. Still why not reduce a condition that is block !**

**hiiamboris**

**[15:15](#msg60955977ff705616c77a9463)because block is a valid truthy value by design**

**[15:43](#msg60956028c651cb6a001a1695)make your own `either` that accepts only `logic!` if that's a problem for you**

**zwortex**

**[15:59](#msg609563d731d2306a0e982492)or the other way round, for those case when you need to test a different value, use to-logic**

**[15:59](#msg609563f0f7e4221825c26b35)you have while with a block, if / either without**

**[16:00](#msg60956402f7e4221825c26b6e)two ways - and possible bugs for one or the other**

**ne1uno**

**[16:46](#msg60956ec898ee821821b58b73)https://finance.yahoo.com/news/teslas-elon-musk-cryptocurrency-promising-113332062.html**

**[16:48](#msg60956f5cd261cc4d74b333a1)woops, lagged taskbar blocking nicks. wrong window**

****Saturday 8th May, 2021****

**rapid-gtr**

**[10:46](#msg60966c1c98ee821821b7cf2b)a: 0**  
**either \[ a &lt;&gt; 0 ] [**  
**print "Yes"**  
**][**  
**print "No"**  
**]**

**[10:48](#msg60966c61f7e4221825c4bb05)Why is this code an "error" ?**

**ldci**

**[10:51](#msg60966d1f98ee821821b7d101)@rapid-gtr either a &lt;&gt; 0**

**GalenIvanov**

**[11:56](#msg60967c73d261cc4d74b59e38)@rapid-gtr `[ a <> 0 ]` is a `block!` and is a truthy value**

**rapid-gtr**

**[11:58](#msg60967ce5d261cc4d74b59ee1)Thanks to you both. I understand now.**

**dsunanda**

**[11:58](#msg60967ce70056b2262c376dc8)From the perspective of 'if`'either` etc almost anything is a "true" value if it is not explicictly a logic! value of false, eg:**  
**`foreach thing [ "" [] () ] [if thing [print "yes"]] yes yes yes`**

**toomasv**

**[16:00](#msg6096b589963923553aef6e10)... or `none`.**

**stmungo**

**[22:12](#msg60970cbdd5e2793379fdd041)I have looked at the Rich Text DSL to see if there is a superscript/subscript feature but saw none. Am I correct and if s**

**[22:13](#msg60970cee98ee821821b94553)so will the feature be provided in the future?**

****Sunday 9th May, 2021****

**GiuseppeChillemi**

**[09:30](#msg6097ab9c75aeb43be736f25e)I am experimenting into building a library of functions grouped by contexts. I need to have one container context and many sub contexts but I have discovered that words in subcontexts are not visible to other contexts:**

**`o: make object! [ o1: make object! [a: 22] o2: make object! [f: does [probe a]] ] >> probe o/o2/f *** Script Error: a has no value *** Where: probe *** Stack: probe f probe`**

**hiiamboris**

**[09:40](#msg6097ae25d964ec55389b2c4a)did that surprise you?**

**GiuseppeChillemi**

**[09:43](#msg6097aeb920d4f02631af66a0)No but I have application fields that needs this functionality: think about an Enterprise Management System, you have functions to manage customers (add, modify, query..) and functions to manage the products, but you have also function to make documents that needs to access data and execute functions from the former contexts. A mechanism to bind words defined in other contexts of the same object in highly needed in such scenery.**

**hiiamboris**

**[09:45](#msg6097af4cf7e4221825c7858d)by writing `make object!` you're sort of saying "let's isolate these words", and then you're asking "what? I don't want to isolate these words"**

**[09:46](#msg6097af58d5e2793379ff2566)so do you want subcontexts?**

**GiuseppeChillemi**

**[09:49](#msg6097b04220d4f02631af6a0b)I know but if you have different names of such words, you can bind the other context words that are not defined in the current one, so you have a global set of functions/words available to every function under the main context unbrella.**

**[09:51](#msg6097b0a831d2306a0e9d4c7f)I don't want sub contexts, just to bind a sub context block to all the other sub contexts.**

**hiiamboris**

**[09:52](#msg6097b0c50056b2262c3a14d6)I don't know layout of your system, but `customer/add` is just as good as `add-customer`, etc. Then you don't need sub contexts at all.**

**ldci**

**[09:52](#msg6097b0cf0845c416dcd21963)@GiuseppeChillemi**  
**`;--Each pandore file uses at least this 36 bytes general header poHeader: object [ magic: "" ;--The magic number (12 bytes) @ref PO_MAGIC ptype: "" ;--The object type (4 bytes) ident: "" ;--The autor name (9 bytes + 1 complement) date: "" ;--The creation date (10 bytes) unused: "" ;--Unused (1 complement) ] ;--The common attributes structure ;--gathered all properties for any Pandore objects pobjectProps: object [ nbands: 0 ;--The number of bands nrow: 0 ;--The number of columns ncol: 0 ;--The number of rows ndep: 0 ;--The number of planes (depth) colorspace: 0 ;--The color space nlabels: 0 ;--The number of labels in a region map size: 0 ;--The number of nodes in a graph directed: 0 ;--if the graph is directed or undirected ] ;--Create a generic pandore object pobject: object [ potype: copy poHeader ;--Header poprop: copy pobjectProps ;--Properties data: copy #{} ;--Image values split: false ;--Flag ]`**

**[09:54](#msg6097b1380056b2262c3a15ae)included objects in pobject can be accessed without problems**

**GiuseppeChillemi**

**[09:55](#msg6097b18cff705616c77fd7bb)@hiiamboris I know, `add-customer` is the actual way to have this but I am investigating into having this as sub contexts because they let me isolate functions groups. Also, a mechanism to selectively bind only some words via a rule would be nice. This is to fine tune the building of a global common vocabulary for a context and its elements.**

**hiiamboris**

**[10:05](#msg6097b3e593ac573bba925209)write your selective bind with parse**

**GiuseppeChillemi**

**[10:06](#msg6097b40fc651cb6a001f467b)@ldci I have tried with no luck:**  
**`o1: make object! [a: 22] o2: make object! [f: does [probe a]] o: make object! [ x1: copy o1 x2: copy o2 ] >> probe first a *** Script Error: a has no value *** Where: first *** Stack: probe first probe o/x2/f`**

**[10:07](#msg6097b46dc651cb6a001f46db)@hiiamboris**  
**&gt; write your selective bind with parse**

**Yes, It is near to one year that I have planned it but had not the skill, now I am ready, I have just to start writing it.**

**[10:09](#msg6097b4cec651cb6a001f47d2)....But I am remembering a technique Toomas has show me 2 years ago to work on objects blocks, just give me a couple of minutes.**

**[10:22](#msg6097b7fb20d4f02631af7b9d)I have expected this cross-binding to work but it didn't:**

**`o1: make object! bo1: [a: 22] o2: make object! bo2: [f: func [] [probe a]] bind bo1 o2 bind bo2 o1 o: make object! [ x1: o1 x2: o2 ] >> probe o/x2/f *** Script Error: a has no value *** Where: probe *** Stack: probe f probe`**

**[10:23](#msg6097b82998ee821821baac46):-(**

**hiiamboris**

**[10:28](#msg6097b96b75aeb43be737118d)You need to bind bodies of functions inside the (already created) context instead.**

**loziniak**

**[10:30](#msg6097b9def7e4221825c79b76)@GiuseppeChillemi you want something, that would be to `context`, what `does` is to `function`?**

**hiiamboris**

**[10:31](#msg6097b9ebff705616c77fe887)Or `bind body-of o2 o1` etc.**

**GiuseppeChillemi**

**[10:36](#msg6097bb322cc8c84d851c3b2e)@loziniak**  
**&gt; @GiuseppeChillemi you want something, that would be to `context`, what `does` is to `function`?**

**I don't know the difference, could you explain?**

**loziniak**

**[10:37](#msg6097bb792cc8c84d851c3c46)`function` treats all set-words like local, and `does` sets them as global.**

**[10:39](#msg6097bbfad964ec55389b4cb6)I meant it less in technical terms, and more like a general conceptual relation.**

**hiiamboris**

**[10:44](#msg6097bd0e20d4f02631af86e6)Right, custom object constructor is another way.**

**GiuseppeChillemi**

**[10:50](#msg6097be8a93ac573bba926b96)@hiiamboris**  
**I have also made a little experiment that has raised a question:**

**`o1: make object! bo1: [a: 22 pf: func [] [f]] bo2: [f: func [] [probe a]] bind bo2 o1 o2: make object! bo2 o: make object! [ x1: o1 x2: o2 ] o/x2/f () >> 22`**  
**Why this works and this...**  
**`o1: make object! bo1: [a: 22] o2: make object! bo2: [f: func [] [probe a]] bind bo2 o1 >> o2/f *** Script Error: a has no value *** Where: probe *** Stack: f probe`**  
**..does not? I remember Toomas having shown me this example and also I logically think `Bind` should do its work on the proto block but it doesn't. It seems a separate entity.**

**loza:matrix.org**

**[11:05](#msg6097c1e60845c416dcd241ae)in first example you bind first, then create object, and in second you bind after creating object.**

**hiiamboris**

**[11:06](#msg6097c253d5e2793379ff4ded)@GiuseppeChillemi because `func` copies the body on creation:**  
**`>> f: does b: [] == func [][] >> b =? body-of :f == false`**

**GiuseppeChillemi**

**[11:07](#msg6097c27bd964ec55389b5bf0)@hiiamboris Yes, you can't simply`bind body-of o2 o1` it does not work.**

**You have to:**  
**`o: make object! [ o1: make object! [a: 22] o2: make object! [f: does [probe a]] ] bind body-of o/o1 o/o2 bind body-of o/o2 o/o1 bind body-of :o/o2/f o/o1 o/o2/f >> 22`**

**This really complicates things too much when building cross-bound objects.**

**loziniak**

**[11:08](#msg6097c29375aeb43be7372584)**  
**`>> o1: make object! [a: 22] == make object! [ a: 22 ] >> o2: make object! bind [f: func [] [probe a]] o1 == make object! [ f: func [][probe a] ] >> o2/f 22 == 22`**

**hiiamboris**

**[11:10](#msg6097c3410056b2262c3a3d19)&gt; @hiiamboris Yes, you can't simply`bind body-of o2 o1` it does not work.**

**Right...**

**[11:11](#msg6097c35520d4f02631af91de)That's what happens when you work against the design ;)**

**[11:12](#msg6097c38cd5e2793379ff5096)But `foreach` is still at your disposal, so doable.**

**GiuseppeChillemi**

**[11:12](#msg6097c3acd5e2793379ff50b4)@loziniak If you have 4 sub-contexts in a container object, with each one having tens of functions this would not work. Also, while you can bind O2 functions to O1 you can't do the opposite easily.**

**hiiamboris**

**[11:14](#msg6097c40598ee821821bac48c)One quirk of your scenario is that you have to finish filling the outer context with inner ones before doing any binding.**

**GiuseppeChillemi**

**[11:15](#msg6097c459d5e2793379ff5251)@hiiamboris or just have a `make/fcopy object! proto` option to bind fuction bodies.**

**[11:16](#msg6097c49fff705616c77fff27)(EDITED)**

**[11:33](#msg6097c89331d2306a0e9d843d)No, still it is not what I want to say. I meant there should be a way to bind functions in objects deep in their bodies when making objects.**

**hiiamboris**

**[11:37](#msg6097c9930845c416dcd25343)But it won't work for you. How can you bind their bodies to objects you have not created yet?**

**[11:42](#msg6097cab193ac573bba9285f5)I think with this cross-binding you'll create a ton of bugs though ☻ Good luck**

**GiuseppeChillemi**

**[12:24](#msg6097d497d964ec55389b829c)The main danger I see is when you have general words like `add`, `next` because you loose the context relativeness information of them which is given by `mag/add`, `customers/add` or `mag-add`, `customers-add`. But if you adopt the second style, where words do not overlaps, you could create container objects with their functions cross-bound and working data private. So you have a very powerful and flexible vocabulary technology and It would be even more powerful if you add selective binding of words.**

**greggirwin**

**[20:13](#msg6098426a4d0065337e620ea7)&gt; so you have a global set of functions/words available to every function under the main context unbrella.**

**@GiuseppeChillemi, it would be interesting to see how it works out for you, but consider an approach like this:**  
**`o: make object! [ a: none o1: make object! [set 'a 22] o2: make object! [f: does [probe a]] ] probe o/o2/f`**  
**It avoids complications and gives you control. Your sub contexts can still have private members that aren't intended to be shared, and you also get documentation about what functions are available without scanning all the code. This is sort of how modules work, where you declare what's exported and what isn't. And if you want to generate this kind of code from a dialect of your own, that shouldn't be too hard either. No need to change anything in Red itself.**

****Monday 10th May, 2021****

**GiuseppeChillemi**

**[12:10](#msg609922a62cc8c84d851f5b8e)It is interesting but you have to declare all the exported words (which I mostly see as positive). It creates a global context, intended as the umbrella object, as for requirements and you do this in an explicit way. I will further investigate on a cross-binding dialect and selective binding as I have encountered this topic multiple times during my researches on Redbol.**

****Thursday 13th May, 2021****

**zwortex**

**[16:02](#msg609d4d8d9f2c352db109513b)In the following I would expect unset, instead of none. Why is it none ?**  
**`a: 2 b: case [ a == 1 [ "1" ] [] ] probe b ;= none`**

**hiiamboris**

**[16:03](#msg609d4dcdd523ee3d3e2e4396)Because no case succeeded**

**[16:03](#msg609d4dd0c12aec4aa2c256a2)**  
**`>> case [] == none`**

**[16:04](#msg609d4e0d2ee2b13d95a8160b)I guess an error could be thrown as well**

**zwortex**

**[16:04](#msg609d4e112ee2b13d95a81614)don't get it**

**[16:04](#msg609d4e21233397424dbe1f9d)\[] is true then it should evaluates what follows that is missing**

**[16:04](#msg609d4e249f2c352db1095371)so unset**

**hiiamboris**

**[16:05](#msg609d4e38416d8734b943382d)what follows \*must be* a block but there is no block**

**zwortex**

**[16:05](#msg609d4e43c60a604255b8ed15)that is why unset**

**[16:05](#msg609d4e60d3b89834a73b177e)I got a bug because of that. I would have seen it earlier have the case returned unset**

**[16:05](#msg609d4e67b10fc85b5693b475)had the case...**

**hiiamboris**

**[16:06](#msg609d4e75b10fc85b5693b4d9)I think it just looks ahead: if length &lt; 2 it bails out**

**zwortex**

**[16:06](#msg609d4e919f2c352db10954e1)silent bug**

**hiiamboris**

**[16:08](#msg609d4ef1617459308f700a4a)let's ask @greggirwin what he thinks**

**zwortex**

**[16:11](#msg609d4f9a6a950f3d46e202ab)a syntax error would probably do as well**

**[16:11](#msg609d4fa5416d8734b9433bc7)even better**

**greggirwin**

**[17:09](#msg609d5d6317d35f3d9fc51591)`case []` matches R2/R3, which is likely the original design reasoning. But in @zwortex's example, Rebol sets `b` to `true`, where Red sets it to `none`. However, Rebol returns `none` for `switch` when nothing matches. Here, Red and Rebol match. I think Red is an improvement over Rebol here, by not assuming that a missing value means true. I prefer sins of omission in general.**

**But this made me remember a \[related topic](https://github.com/red/red/issues/4482) which links to \[this](https://github.com/red/red/issues/4469) and a \[REP](https://github.com/red/REP/issues/85).**

**I feel like I almost escaped from that black hole, relaxed, and got caught by it again.**

**We have https://github.com/red/red/wiki/%5BNOTES%5D-Unset-Notes, where we can add comments, but maybe we should start a `conditionals` page as well.**

**With the current design (which \*appears* to be by design from glancing at `case`'s code), we have consistency with `any/all` but not `if/unless` (which error in the case of a missing argument).**

**It makes sense to have these cases throw an error, which should be a small change in `case`, and just a bit more involved for `switch`. Step 1) create a `Conditionals` wiki page and note some of this. Step 2) create a ticket so Nenad can weigh in, and link to this chat.**

**[17:10](#msg609d5d8917d35f3d9fc51687)If anyone can see why these \*shouldn't* throw an error in this case, please speak up.**

**hiiamboris**

**[17:26](#msg609d615c17d35f3d9fc521a6)@zwortex would you like to take on making a wiki page and issue report?**

**zwortex**

**[17:29](#msg609d621617d35f3d9fc523ac)I can try and do that. Later in the day though.**

**hiiamboris**

**[17:30](#msg609d6220e263442db826becc)thanks!**

**zwortex**

**[18:10](#msg609d6b8eb10fc85b56940860)@greggirwin, just to understand the request, what is the wiki page supposed to be as compared with an issue created in REP project ? that I could complement by adding a note with what you've summarized ?**

**greggirwin**

**[18:46](#msg609d74076a950f3d46e26ee1)If you go to https://github.com/red/red/ and select `issues`, you can create a new issue there (a template will guide you), and include a link to your first message on the topic here.**

**In the wiki, create a new page called `Conditionals` and start by including examples for `case, any, all, if, unless, switch` with empty and missing conditions, so people can see the different behavior. You could also link to the other tickets, so it's clear that design considerations are at play.**

**[18:46](#msg609d7409b10fc85b56941e90)Thanks!**

****Friday 14th May, 2021****

**snotbubble**

**[04:59](#msg609e039bb10fc85b5695670f)Having a problem with `Internal Error: not enough memory` when saving a large block as redbin. Peak (total) memory use was only 5G of 62G. The block was loaded from a 180mb file.**

**Is there a way to increase the memory available to Red?**

**rebolek**

**[06:15](#msg609e157a233397424dc009e4)@snotbubble Red is unfortunately 32bit so there’s 4GB memory limitation.**

**snotbubble**

**[06:42](#msg609e1bf1233397424dc0173e)@rebolek 4G should be enough to save the block... is there a way to see why save/as is using so much memory?**

**hiiamboris**

**[07:01](#msg609e203317d35f3d9fc6dc4a)Before you save, what does `stats` return?**

**snotbubble**

**[07:02](#msg609e209301edef5b5043d842)@hiiamboris `1457976860`**

**hiiamboris**

**[07:06](#msg609e216d5fff1f4a98d695b7)OK suspicious then for `save` to eat another 2.5GB**

**[07:11](#msg609e2292233397424dc026de)It saves a 2GB block for me easily**

**[07:11](#msg609e22a6d523ee3d3e303c41)What types of data are there in the block? And what's the Red version?**

**[07:13](#msg609e230bd3b89834a73d0dcf)OK, if I put strings there it doesn't save**

**snotbubble**

**[07:14](#msg609e2348617459308f7206c2)@hiiamboris yep all strings, latest red (today)**

**hiiamboris**

**[07:16](#msg609e23e1c12aec4aa2c451c6)I think that's because (I saved 40M strings), it has to create an internal hashtable and put every string into it. Since all strings are unique, hashtable gets really big, bigger than data.**

**snotbubble**

**[07:18](#msg609e2439617459308f720ad3)@hiiamboris got it, so stick to plaintext for string data.**

**hiiamboris**

**[07:18](#msg609e2453b10fc85b5695afd1)Or try splitting it into 2 chunks**

**[07:31](#msg609e273a9f2c352db10b530f)Hmm still suspicious. My tests show that hash only takes 34 bytes per item, while string itself - 78 bytes.**

**rebolek**

**[08:10](#msg609e307c5fff1f4a98d6bb09)When using lot of strings, the memory usage grows very fast.**

**zwortex**

**[09:06](#msg609e3d9bb10fc85b5695e830)@greggirwin , @hiiamboris I created the issue https://github.com/red/red/issues/4899 on the case case, and also a wiki page with snippet on conditionnals, missing condition or action https://github.com/red/red/wiki/%5BNOTES%5D-Conditionals**

**hiiamboris**

**[09:25](#msg609e41fd9f2c352db10b9215):+1: great work!**

**XxTheAlexGamerxX**

**[12:42](#msg609e70375fff1f4a98d752e9)Is there a way to perform http requests? Couldn't find it**

**Oldes**

**[12:55](#msg609e732ec12aec4aa2c51550)@XxTheAlexGamerxX**  
**`>> read http://google.com == {<!doctype html><html itemscop...`**

**XxTheAlexGamerxX**

**[14:39](#msg609e8b93c60a604255bbe5e5)ohhh**

**[14:39](#msg609e8b98233397424dc12f5d)Thanks!**

**[15:15](#msg609e93fc17d35f3d9fc80b2b)So i basically meant like a request with headers for an api**

**[15:15](#msg609e9401c12aec4aa2c56bb4)is that possible?**

**hiiamboris**

**[15:21](#msg609e956501edef5b5044f919)@rebolek can help :)**

**XxTheAlexGamerxX**

**[15:23](#msg609e95f9e263442db82996f2)That would be amazing, thanks!**

**hiiamboris**

**[15:30](#msg609e977cd523ee3d3e315781)Basically this is your function https://gitlab.com/rebolek/castr/-/blob/master/client-tools.red#L262 but idk if there's any documentation**

**XxTheAlexGamerxX**

**[15:37](#msg609e99295fff1f4a98d7c1c8)Thanks!**

**rebolek**

**[18:46](#msg609ec574233397424dc1c682)@hiiamboris there is, in the docs folder :) https://gitlab.com/rebolek/castr/-/blob/master/docs/send-request.md**

**zwortex**

**[18:49](#msg609ec61e2ee2b13d95aba428)Sorry. Different subject. I have a script that runs fine when interpreted. But its compilation crashes with the following error. Where shall I go from there ? Cheers.**  
**`Compiling d:\test\script.red ... ...using libRedRT built on 14-May-2021/18:12:06 *** Red Compiler Internal Error: Script Error : Out of range or past end *** Where: percent-value? *** Near: [forall blk [ if multi-line? [nl?: new-line? blk] item: blk/1 either any-block? :item [ either with [ emit-block/sub/with :item main-ctx ] [ emit-block/sub :item ...`**

**hiiamboris**

**[19:02](#msg609ec95901edef5b50457bc0)minimize the code until the error goes away then raise an issue**

**zwortex**

**[19:13](#msg609ecbf2c12aec4aa2c5fee0)supposedly we've passed the time of penance...**

**greggirwin**

**[19:28](#msg609ecf4ad523ee3d3e31f32f)@zwortex, excellent. Thanks so much!**

**[19:30](#msg609ecfd6b10fc85b5697731d)@zwortex you can compile with `-e` to force interpretation, or wrap dynamic parts in `do [...]` so they won't be compiled. For the real problem, do you have functions defined inside functions perchance? The compiler doesn't like those yet.**

**[19:31](#msg609ed026e263442db82a2e6a)That it's an out of range error is interesting. If it's not huge, and not secret, post it in a gist and others can chew on it.**

**hiiamboris**

**[19:42](#msg609ed2b7416d8734b946f29c)yeah takes me hours sometimes to narrow down the error ;)**

**[19:43](#msg609ed2e4416d8734b946f2d8)on the other hand, someone else (or I myself later again) may fall into the same trap**

**greggirwin**

**[19:48](#msg609ed42a5fff1f4a98d86170)We do want to know the cause, of course, but also don't want things like this to stop people from using Red.**

**zwortex**

**[19:59](#msg609ed688416d8734b946fbc8)Is there a restriction on input characters ? I have some extended UTF8 characters around.**

**greggirwin**

**[20:00](#msg609ed6d617d35f3d9fc8b2f7)There shouldn't be.**

****Saturday 15th May, 2021****

**GiuseppeChillemi**

**[20:29](#msg60a02f3a416d8734b949ff5e)Is there a build in command to search for elements in a block in an unordered way? I have already made my command but I wish to know if there is one which is Red native.**  
**Example:**

**`all? [a b c d e f] [a f] >> true`**

**greggirwin**

**[20:33](#msg60a030379f2c352db1102e4a)There is no `find-all` built in.**

**GiuseppeChillemi**

**[20:38](#msg60a0314c5ca66330b0458e7f)Thanks**

**hiiamboris**

**[21:01](#msg60a036bb2ee2b13d95aee2d4)`empty? exclude [a f] [a b c d e f]`**

**greggirwin**

**[21:02](#msg60a036f5233397424dc518df)Yes, I was just thinking that.**  
**`subset?: func [ "Returns true if A is a subset of B; false otherwise." a [series! bitset!] b [series! bitset!] ][ empty? exclude a b ] superset?: func [ "Returns true if A is a superset of B; false otherwise." a [series! bitset!] b [series! bitset!] ][ subset? b a ]`**

**hiiamboris**

**[21:04](#msg60a03751c12aec4aa2c926b7)these would read better in op-form**

**[21:04](#msg60a0377001edef5b5048b655)`subset-of: make op! :subset?`**

**greggirwin**

**[21:06](#msg60a037b92ee2b13d95aee4cc)They would read \*differently\*, but I'd keep the `?` in the name because of the logic result in any case.**

**[21:06](#msg60a037f2c12aec4aa2c927f4)My preference is to minimize ops, especially with words as names, because it makes scanning code much more difficult.**

**hiiamboris**

**[21:07](#msg60a03816233397424dc51b9c)well, if these were functions I would have to \*always* check their docstrings in the console before usage**

**[21:07](#msg60a0382d9f2c352db1104084)even `offset?` gives me trouble often**

**[21:08](#msg60a0384fc12aec4aa2c92892)not to mention `within?` (I always check this one)**

**[21:08](#msg60a03863d523ee3d3e352869)I'd prefer to have less of such functions :)**

**greggirwin**

**[21:09](#msg60a0387ac12aec4aa2c928de)Logic! vs `?` convention is a different topic.**

**hiiamboris**

**[21:10](#msg60a038b517d35f3d9fcbc695)yes, I'm about non-obvious argument order**

**GiuseppeChillemi**

**[21:21](#msg60a03b5c5ca66330b045a236)&gt; `empty? exclude [a f] [a b c d e f]`**

**Nice solution!**

****Sunday 16th May, 2021****

**bubnenkoff**

**[14:32](#msg60a12d08c60a604255c1e249)@rebolek could you please test follow code. I am**  
**&gt; The other way is not to use `to-path` at all, but you need to write more code to do that, so it's just a tradeoff. `to-*` funcs are meant to be simple wrappers, so the behavior is consistent with the `to` action for a type. If it is the lit-word value also causing a problem, here's what you can do to help us all. Document the types that cause issues with `to path!` today. Then we can look at whether paths should be smarter about them, or if handling it at the mezzanine level is best.**

**Sorry for long timeout. All this time I remembered about is but was very busy.Should I file issue, or where I can add mention about it?**

**rebolek**

**[18:20](#msg60a1626dd523ee3d3e37ccd0)@bubnenkoff sorry, I'm not sure what this issue was about. Can you please whom me the code again?**

****Monday 17th May, 2021****

**bubnenkoff**

**[06:28](#msg60a20d052ee2b13d95b2e365)@rebolek oh sorry, it's a lag. Yes, I wrote you, but than deleted message and copy-past and got corrupted message.**  
**This question is for Gregg https://gitter.im/red/help?at=60806a68dc24646812d63aec**

**rebolek**

**[06:30](#msg60a20d9a5ca66330b049924a)ok**

**greggirwin**

**[17:12](#msg60a2a414233397424dca9d5e)@bubnenkoff, not worth an issue yet. Please add a section, notes taken from here, and examples of what causes issues in this case to the \[Path! Notes wiki page](https://github.com/red/red/wiki/%5BDOC%5D-Path!-notes). Then others can use that as a basis for discussion, and deciding if a ticket is warranted. At least then it's documented so we can point others to it.**

****Tuesday 18th May, 2021****

**zwortex**

**[10:57](#msg60a39d7c233397424dcd1404)The following code works fine when interpreted :**

**`Red [ needs: 'View ] f: function [return: [object!]][ context [ c: none ] ] a: make object! [ window: layout [ title "test" button "click-me" [ print "Hello" unview ] ] window/actors: context [ on-key: function [face [object!] event [event!]][ print ["Typed: " event/key] 'done ] ] ] view a/window`**

**When compiled however, the following error is triggered:**  
**`*** Red Compiler Internal Error: Script Error : Invalid path value: ctx||560 *** Where: get-prefix-func *** Near: [objects/a/ctx||560]`**

**Rather cryptic. Who is a/ctx ?**

**If compiled with -e option, or using a do block around the windows/actors assignation, it goes through.**

**`Red [ needs: 'View ] f: function [return: [object!]][ context [ c: none ] ] a: make object! [ window: layout [ title "test" button "click-me" [ print "Hello" unview ] ] do [ window/actors: context [ on-key: function [face [object!] event [event!]][ print ["Typed: " event/key] 'done ] ] ] ] view a/window`**

**Here comes the question. Why the compilation is failing ? And how to prevent it without resorting to interpreted code ? Cheers.**

**hiiamboris**

**[11:10](#msg60a3a09a5ca66330b04dab5b)what `f` has to do with the rest of the code?**

**[11:11](#msg60a3a0e92ee2b13d95b6f325)use `make object!` in place of `context` to not compile the context**

**[11:13](#msg60a3a143617459308f7efcca)&gt; Why the compilation is failing ?**

**supposedly because compiler is unable to assign a compiled context to a path referring to an object that will only be available when interpreter creates it**

**zwortex**

**[11:23](#msg60a3a3a2d3b89834a74a1b2d)f : nothing to do (rest of another test)**  
**make object! in place of context to not compile is a new thing for me. Is there a link somewhere that explains the difference ?**

**hiiamboris**

**[11:38](#msg60a3a734233397424dcd29de)you've probably no idea yet how many such surprises are hidden in the compiler :)**

**[11:39](#msg60a3a764416d8734b952181d)anyway https://github.com/red/red/issues/4463**

**zwortex**

**[11:53](#msg60a3aa9f5ca66330b04dc5e5)if I understand it right : if the compiler sees object or context, it works on it greedily. But if it is a make object! then it leaves it to the execution stage. Is that so ?**

**hiiamboris**

**[11:54](#msg60a3aae4c12aec4aa2d15bac)yes I think so**

**GalenIvanov**

**[11:54](#msg60a3ab0a233397424dcd33f5)`image!`s are still not garbage collected, no?**

**hiiamboris**

**[11:56](#msg60a3ab72d3b89834a74a2ed2)unfortunately**

**zwortex**

**[12:25](#msg60a3b2445ca66330b04dda49)@hiiamboris, I am dwelling on the object / make object!. In the following code, what is being compiled ? Are the two objects compiled but the assignation only delayed ? Or is the internal object, not compiled at all and resolved at execution time only ?**  
**`Red [ needs: 'View ] a: object [ window: layout [ title "test" button "click-me" [ print "Hello" unview ] ] do [ window/actors: object [ on-key: function [face [object!] event [event!]][ print ["Typed: " event/key] 'done ] ] ] ] view a/window`**

**GalenIvanov**

**[12:28](#msg60a3b30901edef5b5050dfa4)@hiiamboris OK. I have a related question - I'm trying to combine Draw with raster operations. Fisrt I fetch the image bitmap data with `bin: img/rgb`, do something with the binary data and then update the image with `img/rgb: bin`. So far so good. But when I use `draw` function on the image, RAM is starting to leak (looking at the Windows Task Manager). Here's an example:**

**[12:29](#msg60a3b3145fff1f4a98e3d016)**  
**`Red[needs: view] W: 500 H: 500 bin: #{00} loop W * H * 4[append bin 150 + random 105] img: make image! compose [(as-pair W H) 0.0.0] img/rgb: bin update-img: does[ bin: img/rgb ; do something with the image data (in R/S. let's say blur) ... img/rgb: bin draw img compose[circle 250x250 200] ] view compose/deep[ base (as-pair W H) draw[image (img)] rate 10 on-time [update-img] ]`**

**zwortex**

**[12:31](#msg60a3b3b7d3b89834a74a43d1)@hiiamboris, hopefully you will not feel overwhelmed. Mine is not priority.**

**hiiamboris**

**[12:44](#msg60a3b6c4c60a604255c80914)@zwortex what's within `do` is never compiled**

**[12:58](#msg60a3ba115fff1f4a98e3e5b0)@GalenIvanov yeah that's quite a leak...**

**[12:59](#msg60a3ba23c60a604255c815dd)minify your snippet and raise an issue please**

**GalenIvanov**

**[13:04](#msg60a3bb72617459308f7f4262)@hiiamboris OK, I'll try to do it**

**zwortex**

**[13:22](#msg60a3bf925ca66330b04dfba2)@hiiamboris, ok I trimed down the compilation error with object make object! to the following :**  
**`Red [] f: function [] [ object [ x: none ] ] a: object [ ;y: object [ x: none ] y: f y/x: object [ g: function [] [ print "Hello" ] ;z: 1 ] ] probe a`**  
**A function f returns an object in a slot y, to which you subsequently assign another object to one of its slot. If the object, assigned to y/x, has no function it works (comment g, uncomment z). If the object assigned to y/x is not returned by a function, but created within a, it works also (uncomment y: object ... comment y:f). It fails if the object is returned by a function and assigned an object that has a function.**

**hiiamboris**

**[13:29](#msg60a3c11cd523ee3d3e3d9e73)found any relevant open issues?**

**zwortex**

**[13:34](#msg60a3c24b01edef5b50510ba1)Do you mean ? An issue I should complain about. This is the core of the issue I had, and the one you were referring in red/red#4463. That is all.**

**hiiamboris**

**[13:41](#msg60a3c422233397424dcd7715)do a search, it looks somewhat suspiciously familiar, but maybe am wrong**

**zwortex**

**[13:52](#msg60a3c680c12aec4aa2d1ad4c)I haven't found any apart the one you mentioned that looks the exact replica.**

**hiiamboris**

**[13:59](#msg60a3c827c12aec4aa2d1b195)hmm ok then add this case to 4463 please**

**[13:59](#msg60a3c838d523ee3d3e3db624)it's really a weird one**

**zwortex**

**[15:00](#msg60a3d6a4617459308f7f8c0b)Sorry, I was not in the proper room. As I was saying I found out that return types were not checked. There is this issue red/issues/2589 the feature is not implemented yet. Is it still the current status, return types being for documentation only ?**

**hiiamboris**

**[15:09](#msg60a3d891617459308f7f9188)yes**

**zwortex**

**[15:11](#msg60a3d9305fff1f4a98e43ddd)@hiiamboris - thanks for all your answers. I wish you a nice day. Cheers.**

**greggirwin**

**[17:19](#msg60a3f72dc60a604255c8c280)Good find @GalenIvanov.**

**[17:20](#msg60a3f77b01edef5b50519ea5)Thanks for digging into the other issue as well @zwortex and @hiiamboris.**

**GalenIvanov**

**[18:24](#msg60a4066f233397424dce3678)@greggirwin I thought it was my fault, because I was doing the raster operations in Red/System (even with no additoinal memory allocations). Eliminating the R/S code did not solve the problem though.**

**hiiamboris**

**[18:35](#msg60a408e16a950f3d46f21176)will you share your blur code?**

**greggirwin**

**[18:47](#msg60a40bc5e263442db8369fbe)When we add an effect pipeline, I hope we can include \[convolve](http://www.rebol.com/article/0236.html)**

**[18:49](#msg60a40c449f2c352db1195c08)Imagine what @ldci could do then! ;^)**

**GalenIvanov**

**[18:55](#msg60a40d972ee2b13d95b82774)@hiiamboris Maybe tomorrow - because I don't have it here (it's on my computer at work). It's a simple two-pass (horizontal and vertical) blur**

**hiiamboris**

**[19:04](#msg60a40fa99f2c352db119668d)hmm, if it's two-pass then it's not symmetric right?**

**GalenIvanov**

**[19:27](#msg60a41505c12aec4aa2d284cd)https://en.m.wikipedia.org/wiki/Separable\_filter**

**hiiamboris**

**[19:38](#msg60a417c7d523ee3d3e3e92e0)makes sense**

**[20:40](#msg60a4265a6a950f3d46f26724)you gave me an idea how to fix 5x5 blur easily in pure Red ☺**  
**`i: draw 100x100 [pen blue line-width 1 circle 50x50 40] blur: function [i] [ i50: copy i i50/alpha: 127 ix: draw i/size [image i -1x0 image i50 1x0] ix2: draw i/size [image i -2x0 image i50 2x0] ix2/alpha: 85 draw ix [image ix2] i50/alpha: 127 draw ix [image i50] draw i50 [image ix] i50/alpha: 127 draw ix [matrix [0 1 1 0 0 0] image i50] ] ? (blur blur blur i)`**

**[20:41](#msg60a42677416d8734b9537a76)although 255 is not divisible by 2 and 3, so a very little bit imprecise**

****Wednesday 19th May, 2021****

**GalenIvanov**

**[07:27](#msg60a4bded4e4b874d642b3ea2)**  
**@hiiamboris Nice try! It's fast (but still eats RAM on my machine). Too bad you impose symmetry with `matrix` :smile: &gt;**

**hiiamboris**

**[07:56](#msg60a4c492308dd91a93bf70bd)Yeah right, I'll fix it (at the cost of more RAM :)**

**[07:56](#msg60a4c49e5623c55ed41249d3)Also it occurred to me at night that this kernel is far from radial symmetry (and those in your link also are), and we need to use different weights here.**

**GalenIvanov**

**[07:57](#msg60a4c4ff11fe9c1aa470ec75)I suppose it is box filter (not Gaussian one)**

**hiiamboris**

**[07:58](#msg60a4c50a5fcfdb5ebd74fc4b)yeah**

**[09:37](#msg60a4dc42aefc5d044af7da2b)RAM killer: 9-4-3 kernel (gaussian, rad=1.34) ☺**  
**`i: draw 100x100 [pen blue line-width 1 circle 50x50 40 30] blur: function [i] [ split: func [ofs] [ ix: draw ix compose [image i (-1x0 * ofs) image i50 (1x0 * ofs)] iy: draw iy compose [image i (0x-1 * ofs) image i50 (0x1 * ofs)] ] join: func [tgt src alpha] [ src/alpha: alpha draw tgt [image src] ] i50: copy i i50/alpha: 128 ix: iy: i/size split 1 i1: join copy ix iy 128 split 2 i2: join copy ix iy 128 join i1 i2 109 join copy i i1 112 ] ? (blur blur blur i)`**

**GalenIvanov**

**[10:21](#msg60a4e6a5c180a769be743a29)@hiiamboris Great!**

**[10:49](#msg60a4ed4286a4ae5efea90056)@hiiamboris Here's my R/S `blur` - a simple 3x3 box filter, implemented as a horizontal pass, followed by a vertical pass. Uses an intermediate buffer to store the result of the horizontal pass. Modifies the source in place. The wrap around the edges costs a modulo for each color component.**

**[10:49](#msg60a4ed49aefc5d044af8027c)**  
**`#system[ rsblur: func[ buf [red-binary!] w [integer!] h [integer!] tbuf [red-binary!] /local s src d dst offs offs- offs+ idx w3 x y ][ s: GET_BUFFER(buf) src: (as byte-ptr! s/offset) d: GET_BUFFER(tbuf) dst: (as byte-ptr! d/offset) w3: w * 3 loop h [ idx: 1 loop w3[ offs-: idx - 3 // w3 offs+: idx + 3 // w3 dst/1: as byte!((as integer! src/idx)+(as integer! src/offs-)+(as integer! src/offs+) / 3) idx: idx + 1 dst: dst + 1 ] src: src + (3 * w) ] src: (as byte-ptr! s/offset) dst: (as byte-ptr! d/offset) y: 0 offs: 1 loop h [ x: 1 loop w3[ offs-: y - 1 // h * w3 + x offs+: y + 1 // h * w3 + x src/1: as byte!((as integer! dst/offs)+(as integer! dst/offs-)+(as integer! dst/offs+) / 3) x: x + 1 offs: offs + 1 src: src + 1 ] y: y + 1 ] ] ]`**

**[10:59](#msg60a4efa8c180a769be7450a4)I pass to it the `/rgb` binary data of an image**

**hiiamboris**

**[11:11](#msg60a4f24a5fcfdb5ebd7568bb)treats image like a tile then.. okay (though modulo is a slow operation)**

**[11:11](#msg60a4f26e40194369b6ddb1b0)I suppose you make a temporary copy of `buf` as `tbuf` as well**

**GalenIvanov**

**[11:12](#msg60a4f2972b8ca545d3aeea50)I provide a separate buffer, allocated previously**

**[11:15](#msg60a4f33fee77a74d685e8c62)Edges can be treated separately in order to avoid using modulo. BTW it's speed is sufficient for my needs at the moment.**

**hiiamboris**

**[11:16](#msg60a4f39bd770155f10f4826a)of course, thanks!**

**GalenIvanov**

**[11:18](#msg60a4f3e85623c55ed412be15):+1:**

**zwortex**

**[11:45](#msg60a4fa4147884a0443f1d045)Is there the equivalent of cast to help the compiler know that an object is of a particular prototype ? I have a function that returns an object, but on the other side apparently the function does not know what it is handling, so it uses eval-path that mixes a function call with refinement for something else apparently. I am willing to help the fellow but how can I do that ? Cheers.**

**hiiamboris**

**[12:20](#msg60a502845fcfdb5ebd759025)no such thing**

**zwortex**

**[12:23](#msg60a503252b8ca545d3af19ad)I guess it would be too much asking for that...**

**[12:23](#msg60a5035f5623c55ed412e4ae)Anyway, is there an output of the compilation that tells what parts of the code are compiled, and which parts were left to the interpretation ?**

**[12:26](#msg60a503f1fcb66d74d9d08727)I am using --red-only and probably the information is all there (like the calls to eval-path in lieu of proper functions calls). But is there something of a higher level ?**

**[12:29](#msg60a504c3308dd91a93c00e63)Also is there a documentation entry for the code produced that I could read. For instance, refs to stack/reset stack/unwind word/get etc.**

**rebolek**

**[12:29](#msg60a504c45623c55ed412e823)@zwortex you can get that info when running the code, I’m not sure if it’s in compiler output. Try higher verbose level.**

**zwortex**

**[12:33](#msg60a505a2fcb66d74d9d08c79)@rebolek I haven't try verbose, I will try. Thanks for the hint.**

**hiiamboris**

**[12:43](#msg60a507d7e7faf945c8542036)source code is the only documentation for all that**

**zwortex**

**[12:54](#msg60a50a7bfcb66d74d9d09c8f)@hiiamboris, ok**

**XxTheAlexGamerxX**

**[14:43](#msg60a523f586a4ae5efea995d4)Fancy question: Is there a way to play a sound file?**

**hiiamboris**

**[14:59](#msg60a527b70b07f074d09616d0)see this project for example: https://github.com/NjinN/Recode/tree/master/Red/flappyBird**

**XxTheAlexGamerxX**

**[15:05](#msg60a5291c11fe9c1aa471ebeb)Interesting**

**[15:05](#msg60a5291f5623c55ed413520a)Thanks!**

**zwortex**

**[16:17](#msg60a539fefcb66d74d9d121fd)Can you confirm that the following is as expected ?**  
**`Red [] a: make object! [ f: function [] [ print "Hello" ] ] print "Initil - OK" a/f b: copy a print "Copy - NOK" b/f ; nothing when compiled - b is viewed as data c: make a [] print "Make - OK" c/f ; this one works`**  
**Which means that all factory pattern are irrelevant when compiled, even using copy ?**

**Oldes**

**[16:25](#msg60a53c0b308dd91a93c0ab11)@XxTheAlexGamerxX years ago I made several experiments with multiple sound libraries which you can found here: https://github.com/red/code/tree/master/Library**

**[16:27](#msg60a53c700b07f074d096508f)For example \[Bass Audio](http://www.un4seen.com/) https://github.com/red/code/blob/master/Library/Bass/bass-test.red**

**hiiamboris**

**[16:32](#msg60a53db986a4ae5efea9e195)@zwortex no of course not, but it's one of the limitations of compiler**

**zwortex**

**[16:37](#msg60a53ee75fcfdb5ebd7632ee)That is sad. a big limitation as far as I am concerned. The return type that is lost.**

**[16:45](#msg60a5409daefc5d044af8e79e)If I understand properly, I should replace a call like new-o: obj/clone by something like new-o: make obj \[] followed by new-o/init (if some specific internal copies are required). Is that so ?**

**ne1uno**

**[16:55](#msg60a5430e308dd91a93c0bda1)https://blog.google/technology/health/ai-dermatology-preview-io-2021/ jury still out, still being certified but ongoing research for 3 years. was rolled up into a bunch of other OS announcements**

**hiiamboris**

**[16:59](#msg60a543fad770155f10f55dc8)@zwortex https://github.com/red/red/issues/3284 https://github.com/red/red/issues/4201 https://github.com/red/red/issues/4598 https://github.com/red/red/issues/924**

**[17:00](#msg60a54428d770155f10f55df2)I'd just advise you to stop that quest to compile everything, but I think you won't listen anyway ;)**

**zwortex**

**[17:24](#msg60a549ce0b07f074d096757d)I went through this https://github.com/red/red/wiki/%5BNOTES%5D-Compiler-Limitations already. I'll take on the others you gave me. I understand your warning. I am not trying to compile everything. Merely to better understand what compilation offers. In particular, I'd like to understand what is being compiled, what is not, what could be compiled with a minor change in the code. One of the thing that I find hard to understand is this : you would expect compilation to work or be required by the code on a given portion of the code. Let's say a highly used functions (like a jit compiler would do) while keeping the rest of the code interpreted. Here as I understand it, it works the other way round, the compiler tries to compile everything, and just give up whenever it is to hard or impossible for it to decipher. As a result, compilation turns out to be more like an enhanced code checker, that can detect part of the code that would break, like the break statement that had nothing to do in the absence of loop, than a means to achieve highly efficient code. Especially as you never know for sure what is being compiled from what is not, and you don't have the ability to require that a certain portion of code be compiled. In my particular case, the major benefice is the extended language checks the compilation provides.**

**hiiamboris**

**[17:40](#msg60a54d90c180a769be75518f)These checks only look useful to you because your mind still thinks in strict OOP-like categories. Your usage of Red looks like trying to hammer a nail with a smartphone. Until you at least start seeing coding patterns you were previously missing, no matter how many code you are going to write, Red will remain a mystery to you. As an example that `break` message you saw earlier will prevent that function to break an outer loop it could be used in. So compiler error is the glitch, not the interpreter's "let it be".**

**[17:42](#msg60a54debaefc5d044af90ee4)For starters, before declaring "Let's say a highly used functions (like a jit compiler would do) while keeping the rest of the code interpreted" why don't you just think on how would you do that? How would you know ahead of time what function will be used "highly"?**

**[17:42](#msg60a54e1bfcb66d74d9d15c4a)And ask the same question to all of your questions, it will become obvious.**

**[17:45](#msg60a54ea35fcfdb5ebd76603d)Also please stop treating compiler as if it was a finished v1.0 product. Compiler is a throwaway implementation used mainly to build libRedRT. As such, only things that were a priority were implemented, and the implementation is limited.**

**zwortex**

**[18:07](#msg60a553f0fcb66d74d9d16b43)Regarding break, if it breaches the boundaries of a function, I would not regard that as a good feature (be it interpreted or compiled). For that throwables are better suited. As for the jit compiler, I don't understand your remark : if it is a jit compiler, it does it iself while interpreting, and more so if certain part of the code is highly used. But I was merely thinking of the coder specifying what portion of the code should be compiled. Once again it is a very pratical remark - I am trying to make things compile. For instance, when I ask if there is cast type operator it is only because I find out that the compiler does not make proper assumptions. However as the coder I could easily provide that information to the compiler. I am not asking the compiler to be very much intelligent, only to take advantage of whatever hints I could provide. Don't worry I am not treating the compiler as a finished product. Like I said, I just want to know what I can expect of it and what I shouldn't. That is all. There is this tension between compiled code and interpreted code, code and data and the boudaries are not entirely clear - sometimes you wish so, when you compile you don't. On the contrary you want it to be clear what is compiled, what is not, what is to be compiled, what will never be. It is a good way to better understand Red, especially for somebody using a smartphone in lieu of a hammer...**

**hiiamboris**

**[18:12](#msg60a555012b8ca545d3b000e6)I wish that level of control as well.**

**greggirwin**

**[18:56](#msg60a55f5b5623c55ed413eb1b)&gt; ...the coder specifying what portion of the code should be compiled.**

**We can, to some extent, by using R/S. It's not the same of course, but if you're working at the Red level, you're already paying the price of convenience.**

**WRT `break` and related problematic players, it's a balance of exceptions in behavior. We can reify certain words to be special, or we can say "If you write code that takes a thunk (other code) as an argument, use `break, return, ...` in the thunk at your own risk. Here there by Tygers." For my part, I don't think there's a perfect answer that solves it, because some people will always expect it to do the other thing. My biggest concern with "unreasonable" behaviors is security risk.**

****Friday 21st May, 2021****

**XxTheAlexGamerxX**

**[17:05](#msg60a7e83dfec22b4786d229bf)Guys what kind of IDE/Editor do you use?**

**[17:05](#msg60a7e84684a2f633a76539f7)What's the best in your opinion**

**hiiamboris**

**[17:17](#msg60a7eb16a10461235d8f3a0b)depends.. what qualities of editor are important to you?**

**[17:27](#msg60a7ed9943fc4a24c5b9c215)am using ST3 because it is half-tolerable out of the box and I didn't want to spend time configuring it (takes me months sometimes), and Oldes had a syntax highlight for it, and because it has good enough feedback speed compared to Electron crap**

**[17:29](#msg60a7edfbd0f55b33baff3501)however it would be easier to write a new editor from scratch than to configure this one properly**

**rebolek**

**[18:37](#msg60a7fdcd801b07264e5ff7d1)I use Vim. It runs everywhere, there’s Red syntax highlighting for it and I almost figured out how to quit it.**

****Saturday 22nd May, 2021****

**ldci**

**[01:55](#msg60a86495801b07264e60ef7d)I use TextWrangler under macOS. Simple and efficient.**

**planetsizecpu**

**[07:53](#msg60a8b86c0ff6de262b20fe1b)I use notepad++ with @Ungaretti syntax highlight, fast &amp; easy. Now testing vscode with Red plugin but not so much convinced with behavior.**

**rapid-gtr**

**[18:02](#msg60a9471984a2f633a76850fa)I have found ride.exe very good, although it doesn't have all the bells and whistles of some other IDEs.**

****Sunday 23th May, 2021****

**greggirwin**

**[15:39](#msg60aa7740688a2624b8a95add)UltraEdit Studio.**

**As you can see @XxTheAlexGamerxX, there is no consensus...until we write our own. :^)**

**cloutiy**

**[21:01](#msg60aac2a5df5c362d4be8e812)@greggirwin great suggestion thanks!**

****Monday 24th May, 2021****

**Respectech**

**[17:24](#msg60abe1610ff6de262b27dcde)I also use Notepad++ on Windows, and vim on Linux. I'm running 100% on Linux at work now (no more Windows).**

**hiiamboris**

**[18:32](#msg60abf13ffec22b4786db20cf)@greggirwin is there a Red syntax for UltraEdit? Rebol one they provide natively is worthless, it even doesn't understand line comments.**

**GiuseppeChillemi**

**[19:25](#msg60abfdc584a2f633a76e0670)I have one, it is Rebol based but it works. It has some problems but you can try it.**

**hiiamboris**

**[19:45](#msg60ac0256688a2624b8acdc94)Sure, upload it somewhere?**

**GiuseppeChillemi**

**[19:58](#msg60ac056b14d9cd234a573b66)I will upload it on my github account. Give me some minutes, I am on the couch after one day of work and I need some time to resurrect.**

**greggirwin**

**[20:05](#msg60ac070445c2185a5ee99363)\[red.uew](https://files.gitter.im/5780ef02c2f0db084a2231b0/EWoD/red.uew)**

**[20:05](#msg60ac071afec22b4786db5ad8)@hiiamboris I hacked my old Rebol highlighter, but not much.**

**hiiamboris**

**[20:12](#msg60ac08a784a2f633a76e2108)thanks**

**GiuseppeChillemi**

**[20:22](#msg60ac0af0df5c362d4bebb60a)@hiiamboris Here is mine \[Rebol Ultra Edit Wordfile](https://github.com/GiuseppeChillemi/WordFiles/blob/master/rebol.uew)**

**hiiamboris**

**[20:27](#msg60ac0c1b9d18fe1998235d06)thanks as well!**

**GiuseppeChillemi**

**[20:49](#msg60ac115e3d43a15a65c3d20b)@greggirwin Could I put your wordfile in my "WordFiles" repository?**

**greggirwin**

**[21:00](#msg60ac13ecd0f55b33ba081a49)@GiuseppeChillemi yes.**

**GiuseppeChillemi**

**[21:28](#msg60ac1a60801b07264e68f997)@greggirwin Ok, thank you.**

**[21:36](#msg60ac1c60fec22b4786db91a6)Is there a way to `unbind` the words of a block?**

**[21:51](#msg60ac1feca10461235d98a40c)Question #2: other than a `word` or a `set-word`, which is the fastest and easily usable datatype to be used as KEY in a `block`? (unquoted and where, at least, you can use the same character set of a word)**

**greggirwin**

**[23:47](#msg60ac3b2b801b07264e693e4a)`refinement!` and `issue!` are both word types.**

**[23:48](#msg60ac3b4c9d18fe199823c7e7)Why do you want to unbind words @GiuseppeChillemi? Words have no meaning out of context, except as symbols.**

**[23:49](#msg60ac3b92801b07264e693ecb)If you need to know whether they are bound where you want them, you could use an "unbound" context and bind them to that, then check if they are bound there.**

**GiuseppeChillemi**

**[23:53](#msg60ac3c8245c2185a5eea165c)Yes, I am already using them. Are they as fast as words?**

**[23:57](#msg60ac3d6f3d43a15a65c43953)About unbound words, when I use words coming from a `words-of`command, I want to neutralize the contextid (no context) for block reusing and maximum security. Actually, I have to create a new anonymous context with all words set to none and bind the block to it, which is quite slow.**

**[23:58](#msg60ac3d92bdecf719a079628e)(like you have proposed)**

**[23:58](#msg60ac3dad78e1d6477d625e4d)Unbound words let me feel safer**

****Tuesday 25th May, 2021****

**hiiamboris**

**[07:38](#msg60aca97884a2f633a76f5c51)Why is it slow?**

**Oldes**

**[09:13](#msg60acbfa484a2f633a76f8c12)There was `unbind` native in Rebol.**

**meijeru**

**[13:02](#msg60acf55a850bfa2d3be1c598)I am sure this question has been answered before, but I can't easily find the answer: does `call` work under Windows/GUI, and how? I get -1 (error) on `call .doc` when the file does exist. Do I need to specify any refinements?**

**hiiamboris**

**[13:03](#msg60acf59e688a2624b8af15fa)try `start`?**

**meijeru**

**[13:07](#msg60acf692688a2624b8af191a)There is no refinement `start` and there is no built-in function `start` as far as I can see. So what do you refer to?**

**hiiamboris**

**[13:08](#msg60acf6cc84a2f633a7701261)**  
**`C:\>start /? Starts a separate window to run a specified program or command. START ["title"] [/D path] [/I] [/MIN] [/MAX] [/SEPARATE | /SHARED] [/LOW | /NORMAL | /HIGH | /REALTIME | /ABOVENORMAL | /BELOWNORMAL] [/NODE <NUMA node>] [/AFFINITY <hex affinity mask>] [/WAIT] [/B] [command/program] [parameters]`**

**GalenIvanov**

**[13:11](#msg60acf77ed0f55b33ba0a0026)**  
**`call {start winword.exe "filename.doc" }`**

**hiiamboris**

**[13:21](#msg60acf9f678e1d6477d641f2d)winword shouldn't be needed**

**[13:22](#msg60acfa2b801b07264e6ae7a0)nor it is a good idea to assume a default file association**

**GalenIvanov**

**[13:23](#msg60acfa3645c2185a5eebdfad)I don't know, it doesn't work for me without `winword`**

**hiiamboris**

**[13:25](#msg60acfac7fec22b4786dd9034)what about `call {start "" "filename.doc"}`?**

**GalenIvanov**

**[13:25](#msg60acfae5850bfa2d3be1d403)yes, it works!**

**meijeru**

**[13:32](#msg60acfc5afec22b4786dd94e6)Works for me too! Thanks guys :+1:**

**greggirwin**

**[19:42](#msg60ad534043fc4a24c5c618e9)Would someone add a note about that behavior to https://github.com/red/red/wiki/%5BDOC%5D-Reference-Call ? Thanks.**

**hiiamboris**

**[19:45](#msg60ad53db84a2f633a770f420)But this has nothing to do with Red**

**greggirwin**

**[19:48](#msg60ad547e84a2f633a770f4ee)Doesn't `call {start "" "filename.doc"}` answer a question though?**

**[19:48](#msg60ad54a514d9cd234a5a7d56)That is, @meijeru had a problem, he got an answer, why not write it down?**

**hiiamboris**

**[19:49](#msg60ad54c2d0f55b33ba0ae9fd)Then I think SO is a better place for that than Red wiki ☻**

**greggirwin**

**[19:50](#msg60ad550878e1d6477d65152c)So there should be only one? I'm all for someone \*also* adding it to SO, but that seems like more work right now.**

**[19:52](#msg60ad558378e1d6477d651704)They are two different models. SO means you have a specific question, and can find one worded such that your search matches it. The wiki is work-in-progress detailed docs on a topic, e.g. `call`, where if you have a question about it you can go there, search for keywords, and learn more about that topic.**

**hiiamboris**

**[19:57](#msg60ad568f45c2185a5eece2c7)Too much data is as bad as not enough. Makes it harder to extract information from data.**

**[19:57](#msg60ad56c29d18fe19982688db)This is why we still point people to R2 manual. It has good signal to noise ratio.**

**[19:59](#msg60ad5739850bfa2d3be2b6a5)And why I don't usually read books :D**

**greggirwin**

**[19:59](#msg60ad573fd0f55b33ba0aef19)The R2 manual (User Guide) is a different beast yet again. I agreed on too much vs not enough, but it's also about organization and sprawl. Mainly for what we can manage now. We don't have an SO presence, so that's added effort right now IMO.**

**GiuseppeChillemi**

**[20:40](#msg60ad60cc43fc4a24c5c63d82)@hiiamboris**  
**&gt; Why is it slow?**

**`Unbind` would be a single operation, while the other involves: extracting the words; creating a prototype block with those words set to none; then you should bind it, which means: creating an object and searching in it for the corresponding word and for each word of the block you want to change binding and make the binding. I suppose the whole process is much slower than a single `unbind` operation.**

**hiiamboris**

**[20:47](#msg60ad624c3d43a15a65c71e90)bind the whole block at once**

**[20:47](#msg60ad626284a2f633a771150e)i.e. not word by word**

**GiuseppeChillemi**

**[21:13](#msg60ad685cdf5c362d4beeda4b)That's not what I mean, I have probably expressed in a bad way:**

**Whey `bind` binds a block, I suppose it traverses the block all, and foreach word it would scan the context to bind the block to for a corresponding word. This operation seems is to my eyes slower than removing the binding from any word, as the former involves a search, while the latter just a single set.**

**hiiamboris**

**[21:22](#msg60ad6a7fa10461235d9bdbbb)`bind` is somewhat slow but will be way faster than extraction of words**

**[21:23](#msg60ad6ad09d18fe199826b8e6)and then, profile it \[one](https://gist.github.com/giesse/1232d7f71a15a3a8417ec6f091398811/raw/d0081ea01b595af67debdf9fb27d7141f0fb8784/profile.red) \[two](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/profiling.red)**

**greggirwin**

**[23:09](#msg60ad839d0ff6de262b2b9b4f)@GiuseppeChillemi don't use your eyes, or rather your hypothesis, to determine what is slow. :^)**

****Monday 31st May, 2021****

**GiuseppeChillemi**

**[10:08](#msg60b4b5a9fec22b4786eefd7e)Is there a command to convert between currencies like EUR$20,00 to USD$20,00 (I mean changing the value)**

**rebolek**

**[10:29](#msg60b4ba9ebdecf719a08cd236)@GiuseppeChillemi do you mean to change the denomination or convert according to the current rate?**

**abdllhygt**

**[10:42](#msg60b4bd9cd0f55b33ba1b3c9a)hello!**

**[10:42](#msg60b4bda40ff6de262b3b46ea)how are you?**

**[10:43](#msg60b4bdc3a10461235dac5e94)how can i change:**  
**`[1 2 3]`**  
**to:**  
**`[1 | 2 | 3]`**

**toomasv**

**[10:57](#msg60b4c1149d18fe1998371004)Hi @abdllhygt**  
**`blk: [1 2 3] forall blk [if not last? blk [blk: next blk insert blk '|]] blk == [1 | 2 | 3]`**

**abdllhygt**

**[10:58](#msg60b4c142a10461235dac658d)@toomasv thank you!**

**toomasv**

**[10:58](#msg60b4c14b3d43a15a65d75358):+1:**

**GalenIvanov**

**[10:58](#msg60b4c16014d9cd234a6b3960)@abdllhygt Here's my `parse` attempt:**

**[10:58](#msg60b4c166df5c362d4bff3252)**  
**`>> b: [a b c d 1 2 3] == [a b c d 1 2 3] >> parse b [any[skip ahead skip insert (to word! '|)]] == false >> b == [a | b | c | d | 1 | 2 | 3]`**

**abdllhygt**

**[10:59](#msg60b4c17f45c2185a5efd4c2d)@GalenIvanov thank you too!**

**[10:59](#msg60b4c18b14d9cd234a6b39a7)which one is faster?**

**GalenIvanov**

**[11:00](#msg60b4c1e9a10461235dac66cd)I don't know :smile:**

**abdllhygt**

**[11:03](#msg60b4c26fdf5c362d4bff344b)ok )**

**[11:04](#msg60b4c2a99d18fe1998371440)what is `ahead`? and does `insert` change value of `b`? @GalenIvanov**

**[11:04](#msg60b4c2bf45c2185a5efd4f6c)@toomasv really? thanks**

**toomasv**

**[11:05](#msg60b4c2f143fc4a24c5d6b83d)Sorry, my fault in comparison, `parse` is ~1.5 time faster:**

**[11:05](#msg60b4c30445c2185a5efd4fe6)**  
**`profile/show/count [[blk: copy [a b c d 1 2 3] forall blk [if not last? blk [blk: next blk insert blk '|]]] [blk: copy [a b c d 1 2 3] parse blk [any[skip ahead skip insert (to word! '|)]]]] 10000 Count: 10000 Time | Time (Per) | Memory | Code 0:00:00.063 | 0:00:00 | 4200284 | [blk: copy [a b c d 1 2 3] parse blk [any [skip ahead skip insert (to word! '|)]]] 0:00:00.093 | 0:00:00 | 4200440 | [blk: copy [a b c d 1 2 3] forall blk [if not last? blk [blk: next blk insert blk '|]]]`**

**abdllhygt**

**[11:06](#msg60b4c35114d9cd234a6b3da1)@toomasv thank you!**

**GalenIvanov**

**[11:12](#msg60b4c49878e1d6477d75a85c)My tests with a block of 100000 integers didn't show any practical difference:**

**[11:12](#msg60b4c49a78e1d6477d75a861)**  
**`>> b: collect[loop 100000 [keep random 100]] == [71 76 52 6 4 92 92 43 3 59 82 61 9 76 30 13 34 82 78 72 42 57 76 51 29 14 53 74 50 11 8 59 83 81 99 99 59 99 27 94 53 93 5 63 ... >> blk: copy b == [71 76 52 6 4 92 92 43 3 59 82 61 9 76 30 13 34 82 78 72 42 57 76 51 29 14 53 74 50 11 8 59 83 81 99 99 59 99 27 94 53 93 5 63 ... >> t1: now/time/precise == 14:11:15.1611 >> forall blk [if not last? blk [blk: next blk insert blk '|]] == none >> t2: now/time/precise - t1 == 0:00:06.889 >> t1: now/time/precise == 14:11:22.0611 >> parse b [any[skip ahead skip insert (to word! '|)]] == false >> t2: now/time/precise - t1 == 0:00:06.75085`**

**toomasv**

**[11:14](#msg60b4c50c14d9cd234a6b4315)Also**  
**`blk: [a b c d 1 2 3] parse blk [any [skip [end | insert ('|)]]] blk ;== [a | b | c | d | 1 | 2 | 3]`**

**GalenIvanov**

**[11:16](#msg60b4c5aadf5c362d4bff3c0f)@toomasv Yes, indeed! I tried to move `end` before the insertion, but apparently did it wrong and didn't continue that way. Also `('|)` is better!**

**[11:20](#msg60b4c675688a2624b8c0b3b7)@abdllhygt `ahead rule`matches the input against `rule` but doesn't advance the input. And yes, `insert` changes the series in place.**

**abdllhygt**

**[11:22](#msg60b4c6d99d18fe1998371df8)thank you**

**GiuseppeChillemi**

**[16:38](#msg60b510ecfec22b4786efd4ef)@rebolek Changing denomination. Conversion at current rate is important only if there is an official conversion rate storage in Red, so I should know about it. Otherwise I can do the calculation by myself.**

**greggirwin**

**[18:41](#msg60b52de3df5c362d4b002c38)Red can't store conversion rates, that has to be external.**

**[18:51](#msg60b5301e850bfa2d3bf43b53)\[delimit](https://gist.github.com/greggirwin/323ae43a738134fc4300fcc709a83d0b) is something I think Red should have as standard. I haven't pressed (or updated the old gist) because we don't have `forskip` (@dockimbel doesn't love it) and \[incr](https://gist.github.com/greggirwin/4dd6deb56dcba704bf6d418aff244373) is an idea that I haven't pressed for input on. I still like it, but we all like our own ideas. :^)**

**abdllhygt**

**[19:00](#msg60b53256801b07264e7cec71)can i ask about `git` here? about my project with `Red`**

**greggirwin**

**[19:03](#msg60b5331d43fc4a24c5d7c4c6)If it's Red related, of course.**

**abdllhygt**

**[19:05](#msg60b5336f0ff6de262b3c5ef2)it is about git/hub**

**[19:05](#msg60b5337845c2185a5efe5441)let me ask in chit-chat room**

**greggirwin**

**[19:07](#msg60b533e4fec22b4786f02327):+1:**

**GiuseppeChillemi**

**[23:43](#msg60b5749d43fc4a24c5d84756)I don't understand how to use the following types as index in `PICK`**

**`[... any-string! any-word! block! logic! time!]`**

**[23:44](#msg60b574cfbdecf719a08e6dd8)How could be a string an index for a block?**

**[23:44](#msg60b574d99d18fe199838a305)(And so the others)**

****Tuesday 1st June, 2021****

**rebolek**

**[05:20](#msg60b5c3863d43a15a65d97044)@GiuseppeChillemi by design you can’t change `money!` denomination**

**GalenIvanov**

**[07:53](#msg60b5e795801b07264e7e6517)@GiuseppeChillemi When using `logic!` as index for`pick`, its `true` value selects the first value in the series; the `false` one - the second:**

**[07:54](#msg60b5e79c0ff6de262b3dd48e)**  
**`>> color: red == 255.0.0 >> pick [Red Green] color/1 = 255 == Red`**

**[07:56](#msg60b5e8299d18fe1998399264)As far as I undesrood, `char!`, `string!` and `block!` as an `index` of `pick` are used with bitsets:**

**[07:58](#msg60b5e8a8a10461235daf06cf)**  
**`>> lang: charset "Red-lang" == make bitset! #{0000000000040000000020004D0A} >> pick lang #"a" == true >> pick lang #"b" == false >> pick lang "Red" == true >> pick lang "Re-g" == true >> pick lang [#"R" #"-" "ang"] == true >> pick lang [#"R" #"e" #"b" #"o" #"l"] == false`**

**[08:03](#msg60b5e9bd850bfa2d3bf5bba4)Since `bitset!` value is an array of bits that stores boolean values, picking a `char!` just checks if the respective bit is set, thus returning `true` or `false`. A `string!` index means that all the bits corresponing to the srting characters must be set; a `block!` of chars and strings works the same way.**

**GiuseppeChillemi**

**[08:29](#msg60b5efe4d0f55b33ba1e06c2)@rebolek**

**&gt; @GiuseppeChillemi by design you can’t change `money!` denomination**

**So, this is the only possible conversion:**

**`as-money 'USD to-float as-money 'eur 1`**

**[08:32](#msg60b5f0b63d43a15a65d9e2d0)@GalenIvanov More than `Pick` this part of its working is a `found-all?` function.**

**rebolek**

**[08:35](#msg60b5f13584a2f633a783fdda)@GiuseppeChillemi there are of course other soultions:**  
**`>> usd: USD$20 == USD$20.00 >> eur: make money! reduce ['EUR to float! usd/amount] == EUR$20.00`**

**GiuseppeChillemi**

**[08:36](#msg60b5f1a884a2f633a783ff7e)It is not picking and returning a value located in a position but searching for it, it's another function that would deserve its own name and interface! But that is just mine opinion.**

**[08:37](#msg60b5f1d445c2185a5effd460)@rebolek Thank you!**

**hiiamboris**

**[08:39](#msg60b5f24f9d18fe199839aa27)**  
**`>> m: USD$10 == USD$10.00 >> EUR$0 + m/amount == EUR$10.00`**

**GiuseppeChillemi**

**[08:41](#msg60b5f29ea10461235daf1e06)@hiiamboris That is interesting, expecially for this: `m/amount` , so words can have refinements based on the datatype? Wow!**

**hiiamboris**

**[08:42](#msg60b5f3020ff6de262b3deed1)I'm sure you have used `pair/x` and `time/seconds` by now :)**

**rebolek**

**[08:45](#msg60b5f3910ff6de262b3df096)You can use TAB in console to get list of possible accessors:**  
**`>> t: now == 1-Jun-2021/8:44:05 >> t/<TAB> == date day hour isoweek julian minute month second time timezone week weekday year yearday zone`**

**[08:46](#msg60b5f3c8688a2624b8c36459)Or take a look at the whole list:**  
**`>> probe system/catalog/accessors [ date! [ date year month day zone time hour minute second weekday yearday timezone week isoweek julian ] email! [user host] event! [ type face window offset key picked flags away? down? mid-down? alt-down? aux-down? ctrl? shift? ] image! [size argb rgb alpha] pair! [x y] time! [hour minute second] money! [code amount] ]`**

**[08:48](#msg60b5f45584a2f633a7840548)Hm, I see there are accessors for `email!`, it would be nice to have them for `url!` also instead of using `decode-url`.**

**GalenIvanov**

**[08:55](#msg60b5f5e70ff6de262b3df6a5)It seems to me that `money!` accessors are read-only. Is it by design?**

**hiiamboris**

**[08:55](#msg60b5f605a10461235daf25eb)https://github.com/red/red/issues/4908**

**GalenIvanov**

**[08:56](#msg60b5f630d0f55b33ba1e1474)@hiiamboris Oh, thanks!**

**greggirwin**

**[15:43](#msg60b655a7d0f55b33ba1f0c15)On money, there was likely chat, though I can't find notes right now, about writability for the `code`. One argument being that changing the code doesn't convert via an exchange rate, so what's the validity without also changing the `amount`? But these are simply data values, and there may very well be cases where using the `code` as a tag is useful during processing.**

**hiiamboris**

**[15:57](#msg60b65907fec22b4786f29ef3)In the same way I can ask "what's the validity of $2 after I change /amount to 1"? Like you said, it's data value and one should be able to trust oneself to modify it without hacks.**

**greggirwin**

**[16:12](#msg60b65c88801b07264e7f8221)@rebolek, for urls the encode/decode process is heavy, and external to the type itself. `Email!` currently just uses `@` as a delimiter to support the two parts. This works well in practice, but isn't 100% correct, as email addresses can \*technically* use quoted strings in the local-part which may contain @ symbols. So the current model is convenient and relatively safe. From a quick search, it's used in networking bits, Rugby, Uniserve, and mail protocols in ports. I doubt it's used much in user code. We could probably remove those email accessors, but let's leave them until we write mail protocols to decide.**

**GiuseppeChillemi**

**[22:10](#msg60b6b038fec22b4786f37aba)@hiiamboris**  
**&gt; In the same way I can ask "what's the validity of $2 after I change /amount to 1"? Like you said, it's data value and one should be able to trust oneself to modify it without hacks.**

**This is also my opinion. I am working on my MiniPos application, the user may hit `"1"` and then `"USD"` button to change to that currency to `EUR$1,00` without conversion or, otherwise, hit the `"convert"` button and then select the currency to make a calculated conversion using an exchange rate.**

**[22:45](#msg60b6b87543fc4a24c5db43ef)There is something It is very difficult for me to implement:**  
**I need to build multi column sorting in data arranged as a block of block:**  
**`[ ["ax" "bx" "cc"] ["ab" "66" "XC"] ["xb" "Y3" "S1"] .... ]`**

**Do we have instruments to sort this block of block data by columns 1 and 3 or 3 and 2 and so on?**  
**In case the answer is negative, which algorithms should I implement? Do you have a pointer or a name for simple ones?**

****Wednesday 2nd June, 2021****

**greggirwin**

**[00:14](#msg60b6cd6fa10461235db14b2b)It's not built in. An easy way is to extract the columns you want to sort on, building a new block using those along with the original data, and `sort/skip ... 2` that whole ting. I have old code somewhere, which will need porting to Red. Will look.**

**If you want to roll your own, my favorite sorting algorithm is the `combsort`.**

**[00:15](#msg60b6cdae43fc4a24c5db6fed)@hiiamboris may have something up his sleeve as well.**

**rebolek**

**[03:39](#msg60b6fd7c14d9cd234a7073e0)There is actually an easier way, just use `sort/compare` with a comparatur function:**  
**`sort/compare block func [this that] [all [this/1 > that/1 this/2 > that/2]]`**

**[03:42](#msg60b6fe2745c2185a5e024c2e)Of course you would need to improve the comaparator function, this is just an example how to do it.**

**[03:50](#msg60b7000bfec22b4786f42699)**  
**`>> block: collect [loop 15 [keep/only reduce [random 9 random 9 random 9]]] == [[3 5 1] [7 8 5] [4 7 3] [5 7 4] [2 3 3] [7 6 4] [6 4 7] [3 6 5] [9 7 1] [3 7 1] [6 4 9] [2 4 3] [6 9 5] [7 2 8] [2 4 9]] >> sort/compare block func [this that] [any [this/1 < that/1 this/2 < that/2]] == [[2 3 3] [2 4 9] [2 4 3] [3 5 1] [3 6 5] [3 7 1] [4 7 3] [5 7 4] [6 4 7] [6 4 9] [6 9 5] [7 2 8] [7 6 4] [7 8 5] [9 7 1]]`**

**hiiamboris**

**[06:09](#msg60b720a043fc4a24c5dc1f72)In the comparator: use sort!**

**GalenIvanov**

**[07:37](#msg60b7352d45c2185a5e02cac2)Will `block` in `/compare => Comparator offset, block (TBD) or function.` serve this function - to specify the priority of the fields when sorting?**

**GiuseppeChillemi**

**[11:09](#msg60b766f00ff6de262b416b9c)I have looked at \[sort.r](https://github.com/red/red/blob/master/runtime/sort.reds) source code and it is really cryptic: no comments and one or 2 letters argument names. I was trying to understand of the comparer function works. @rebolek: you have built a function with two arguments but what is one argument and what is the other? How the whole sorting process works?**

**[11:10](#msg60b7672184a2f633a7878c58)@hiiamboris Why and how should be used `sort` in the comparator?**

**[11:12](#msg60b7678a9d18fe19983d2c07)Also, I see this refinement `/all => Compare all fields (used with /skip)` which seems near to what is needed. In place of All fields it could compare just few.**

**GalenIvanov**

**[11:14](#msg60b7680f45c2185a5e034495)@GiuseppeChillemi the anonymous function takes two arguments - each two values that `sort` compares in order to place at their respective places in the sorted list.**

**hiiamboris**

**[11:16](#msg60b7688c14d9cd234a716a9e)&gt; @hiiamboris Why and how should be used `sort` in the comparator?**

**I'll leave that for you as an exercise ☻**

**[11:17](#msg60b768bc45c2185a5e034622)Tip: `sort` does not error out if things are not "comparable"**

**GiuseppeChillemi**

**[11:29](#msg60b76bb443fc4a24c5dcd5f7)@GalenIvanov Thanks, so the whole process consists into scanning the first and next element and running the comparator function. I imagine it does it into multiple steps and creating intermediary blocks until it reaches the "SORTED" condition.**

**[11:31](#msg60b76c203d43a15a65dd6df6)@hiiamboris I need to know more about the sorting process as a whole, otherwise, you know myself, I will end-up considering every possible scenario, even the most complicated.**

**GalenIvanov**

**[11:37](#msg60b76d80df5c362d4b0549f0)@GiuseppeChillemi Yes, in principle. I haven't looked at the source and don't know the details - the sorting might be in place.**

**hiiamboris**

**[11:40](#msg60b76e4a850bfa2d3bf94775)Of course it's in-place.**

**GalenIvanov**

**[11:41](#msg60b76e5d84a2f633a7879dbd):+1:**

**GiuseppeChillemi**

**[11:42](#msg60b76e990ff6de262b417e0f)What you mean as "in place"? On the source block with no temporary intermediate blocks?**

**greggirwin**

**[17:44](#msg60b7c37345c2185a5e04314a)@rebolek, of course! Do you know if using a comparator honors `/stable`. I remember issues under R2 at some point, but confess I haven't tried it in Red.**

**rebolek**

**[17:49](#msg60b7c4b884a2f633a78887ef)@greggirwin I’m not sure. I know two things:**

**1) this comparison is not stable, sometimes it needs three passes to produce the right result, and doing the fourth pass produces the wrong result again (but sometimes it’s just two so it’s not predictable).**

**2) with `/stable` it’s even more unstable as I got hard crash that I wasn’t able to reproduce later, unfortunately, otherwise I would fill a bug.**

**greggirwin**

**[17:52](#msg60b7c556801b07264e82e9a4)Thanks. Under R2 I believe it did finally honor results of `[-1 0 1]` for stable sorting.**

**hiiamboris**

**[17:56](#msg60b7c65e850bfa2d3bfa2d15)https://github.com/red/red/issues/4489**

**greggirwin**

**[17:59](#msg60b7c6f4688a2624b8c7d53d)Almost a year to the day! I know @qtxie is busy, but `sort` is important.**

**hiiamboris**

**[18:00](#msg60b7c73678e1d6477d7c9103)Issues got neglected after the decision to not do stable releases :)**

**[18:01](#msg60b7c77ddf5c362d4b0636b3)(or may be because I've found way too many..)**

**[18:28](#msg60b7cdbdfec22b4786f613f2)@greggirwin By the way, in your FOR design: do you allow user to modify the index and then continue from that modified index, or do you replace the index no matter what user does with it?**

**[18:28](#msg60b7cdcf84a2f633a7889ddf)Something to consider.**

**[18:29](#msg60b7cdf93d43a15a65de6562)Right now only `forall` allows to alter it's offset at iteration time.**

**greggirwin**

**[20:03](#msg60b7e4043d43a15a65de97ef)It's TBD. Some cases do and others don't, but not by design...yet. This comes from delegating some loops down to `loop`, `repeat`, or `foreach` internally, but if there's no internal func to do it, the final logic goes through Ladislav's old `cfor` (`for` how C does it), which gives you total control.**

**hiiamboris**

**[20:04](#msg60b7e45dfec22b4786f64e8c)I'm in favor of total control too. The only cases where I modify the index in `repeat` are when I'm using it with an offset, in place of missing `for`. (so if we had `for`, I'd vote for `repeat` to support reading index back between iterations)**

**[20:07](#msg60b7e4e6d0f55b33ba230845)It becomes a bit trickier though when iterating over a range of pairs..**  
**Ideally, let user be dumb and add `1x0` even if it goes over the current line, then skip the extra number of pixels on the next line.**

**greggirwin**

**[20:07](#msg60b7e507fec22b4786f64fb2)The design problem is consistency. We want to leverage natives, but having \*some* calls allow it, and others not, is bad for users. If everything goes through `cfor`, \*every* loop is slower.**

**[20:10](#msg60b7e5c8d0f55b33ba230a9b)I'd like for most loops to be safe, as long as there is one way you can be in control.**

**hiiamboris**

**[20:11](#msg60b7e5eb688a2624b8c828b1)Meaning?**

**greggirwin**

**[20:13](#msg60b7e65043fc4a24c5de1baf)Basic iteration (count or series end-test) can never spinlock, as long as you have something like `while` that puts you in control of the end-test.**

**hiiamboris**

**[20:14](#msg60b7e6b1688a2624b8c82b0a)Not sure how this relates to `for` :)**

**greggirwin**

**[20:19](#msg60b7e7d89d18fe19983e8263)`for [i 1 to 10 step 2][...]` doesn't let you change `i` and potentially spinlock.**

**`while` or `for [[i: 1] [i <= 10] [i: i + 2]] [...]` gives you all the rope you need to shoot yourself in the foot.**

**hiiamboris**

**[20:20](#msg60b7e82584a2f633a788e089)So you'd rather not let to change `i` because of spinlock danger?**

**[20:21](#msg60b7e83fdf5c362d4b068398)Clearly, `for` will have to be consistent about it.**

**greggirwin**

**[20:21](#msg60b7e852a10461235db3ef86)Currently the first example "compiles down" to the second example, except when delegating to natives.**

**[20:23](#msg60b7e8b3df5c362d4b06843c)I'd like to help the user, and their users.**

**hiiamboris**

**[20:29](#msg60b7ea263d43a15a65dea71e)Help can take different forms :)**

**greggirwin**

**[20:30](#msg60b7ea539d18fe19983e8763)I didn't say I wanted to help \*you\*. ;^)**

**hiiamboris**

**[20:30](#msg60b7ea62850bfa2d3bfa8445)Haha OK :)**

**greggirwin**

**[20:31](#msg60b7ea8684a2f633a788e70f)But we agree that consistency is a must.**

**hiiamboris**

**[20:32](#msg60b7eac23d43a15a65dea88e)I asked because I thought I'm going to allow that in `foreach`. Because that's a powerful feature of `forall` to skip 1 or more items, and even zero. I'm using it a lot, and I would hate to throw away `foreach` and fall back to `forall` when I need that.**

**[20:32](#msg60b7eae445c2185a5e049079)But these 2 are positional iterators, not numeric. So consistency with `for` is less important.**

**greggirwin**

**[20:34](#msg60b7eb623d43a15a65dea9f9)It is powerful, like `goto` is powerful. Constraints are a pain sometimes but they also provide a lot of value. In this case, the ability to reason about iteration logic without having to read every line of the body.**

**hiiamboris**

**[20:34](#msg60b7eb723d43a15a65deaa82)Good argument.**

**greggirwin**

**[20:35](#msg60b7eb8afec22b4786f65ee0)If only there was one right answer. :^\\**

**hiiamboris**

**[20:35](#msg60b7eb900ff6de262b42c30a)Indeed..**

**GiuseppeChillemi**

**[20:55](#msg60b7f027a10461235db4026b)So, what is tho `/stable` sorting?**

**[20:55](#msg60b7f02d3d43a15a65deb51f)This**

**[20:55](#msg60b7f04378e1d6477d7cf8cb)Is there an unstable one?**

**hiiamboris**

**[20:58](#msg60b7f0e7a10461235db4043d)https://en.wikipedia.org/wiki/Stable\_sort#Stability**

**GiuseppeChillemi**

**[21:20](#msg60b7f629fec22b4786f67902)Thank you, I have understood.**

****Thursday 3th June, 2021****

**abdllhygt**

**[21:24](#msg60b9488884a2f633a78c4669)hello**

**[21:38](#msg60b94bdc14d9cd234a761e3b)**  
**`myWords: ["hello" | "name" | "abdulllah"] sentence: "hello, my name is not Abdullah..."`**

**[21:40](#msg60b94c4314d9cd234a761ee7)how can i catch the words and markers from `sentence` which not exist in `myWords`?**

**[21:41](#msg60b94ca214d9cd234a761fc3)**  
**`newWords: ["my" "is not"] ; not ["my" "is" "not"] and side spaces are deleted newMarkers: ["," "..."] ; even there is no space`**

**[21:46](#msg60b94d9b801b07264e8693bc)i want to get this result**

****Friday 4th June, 2021****

**rebolek**

**[05:54](#msg60b9c002a557f76fa779fa62)For example:**  
**`>> letters: charset [#"a" - #"z" #"A" - #"Z"] == make bitset! #{00000000000000007FFFFFE07FFFFFE0} >> new-words: [] new-markers: [] == [] >> parse/case sentence [some [space | my-words | copy value some letters (append new-words value) | copy value some [not letters skip] (append new-markers value)]]`**

**abdllhygt**

**[12:47](#msg60ba20eaa557f76fa77adcf2)@rebolek thank you**

**[13:17](#msg60ba27e6d48a45476011d4e8)hi again**  
**how to compile `ask`? i forgot that too.**

**qtxie**

**[13:18](#msg60ba282ac409b1272e77fa22)&gt; Almost a year to the day! I know @qtxie is busy, but `sort` is important.**

**:sweat\_smile: Fix pushed.**

**abdllhygt**

**[16:38](#msg60ba56f4a557f76fa77b6e0e)i compiled my program, when my program quit, it appears an error:**  
**`*** Script Error: _save-cfg has no value *** Where: do *** Stack: tara tara kapat quit`**

**[16:38](#msg60ba5713a2dc6c47557f5af0)i dont have a code which contains `_save-cfg`**

**[16:39](#msg60ba5728a2dc6c47557f5b2a)i included `input.red` from source of red-master**

**hiiamboris**

**[17:33](#msg60ba63ccd48a454760126ff4)Try deleting your console.cfg file.**

**abdllhygt**

**[18:28](#msg60ba70e0f3496d67b661c087)i dont have a file as that**

**[18:33](#msg60ba71e73c544b55fd928879)i added this code to my file:**  
**`_save-cfg: ""`**  
**there is no problem now, @hiiamboris thank you!**

**[21:44](#msg60ba9ea4b772022e937d51b1)hello again!**

**[21:45](#msg60ba9f0dd42bbf67bbb46485)**  
**`-=== Red Compiler 0.6.4 ===- Compiling Z:\home\abdllh\Desktop\cozkaynak\coz.red ... *** Compilation Error: include file not found: bo┼ƒluk.red *** in file: Z:\home\abdllh\Desktop\cozkaynak\coz.red *** near: [ #include %bo┼ƒluk.red #include %isim.red #include %i┼ƒaret.red #include %i┼ƒlev.red ]`**  
**how can resolve this problem? i can compile on linux but windows version can't compile with turkish chars like `ş, ç, ğ`**

**[22:38](#msg60baab4c20e86942d243d5b9)is this about utf-8?**

****Saturday 5th June, 2021****

**hiiamboris**

**[07:42](#msg60bb2aef1e6aa460c0105349)Compiler is written in Rebol, and Rebol knows nothing about unicode.**

**abdllhygt**

**[10:34](#msg60bb534693dd264ef4bbfbf4)is unicode problem about not-crossplatform?**

**GiuseppeChillemi**

**[11:25](#msg60bb5f3b1e6aa460c010cf14)@abdllhygt Unicode is not supported by Rebol which is used during for compiling. It simply can't read Unicode characters. You have to wait until Rebol will be replaced and change your file name to English language. (LATIN-1)**

**abdllhygt**

**[11:39](#msg60bb627581b45810b8875f14)So, when i compile my files with turkish chars, the compiler change turkish chars to english chars?**

**[12:03](#msg60bb680393dd264ef4bc2ac9)i think you already replied this if i understand**

**GiuseppeChillemi**

**[15:41](#msg60bb9b1084c2f15b796268f5)@abdllhygt The compiler is not able to handle filenames with Turkish chars, so it does not find them. When Red will remove Rebol from compilation, using its own compiler, this problem will disappear. Until then you need to user english chars.**

**pekr**

**[16:05](#msg60bba0c51e6aa460c0115de7)I think it is a least of a problem- just keep your files in english, or strip the special chars. Your app in Red can actually support Unicode, so why to complicate the situation with the infrastructure itself?**

**GiuseppeChillemi**

**[20:23](#msg60bbdd3f0f247f448e9d6df3)I have seen fixings in `sort/stable`, thank you.**

****Sunday 6th June, 2021****

**abdllhygt**

**[10:28](#msg60bca35e19b46c60b1703ba5)by the way this problem doesn't apper on linux**

**GiuseppeChillemi**

**[22:57](#msg60bd52c31477ff6954a4cdb6)Is there a way to have partial binding? I mean binding only one or more words of a context to a block.**

****Monday 7th June, 2021****

**hiiamboris**

**[08:18](#msg60bdd6655bf7ed10d3e7e039)https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/bind-only.red**

****Sunday 13th June, 2021****

**luis-rj**

**[02:33](#msg60c56e6f5e8dfc4f117acb59)Hello, with lastest build, draw on panel shows all panel black:**

**`view [canvas: panel 150x150 draw [line 10x0 160x50]]`**  
**No problem on 08jan21 build**

**toomasv**

**[04:11](#msg60c58574b31731135428ac2e)Which platform? On W10 this problem doesn't appear (build June 6).**

**luis-rj**

**[04:42](#msg60c58cbbd161a54f0511b478)W10 Home...**

**toomasv**

**[04:51](#msg60c58ed987848634af1970f9)Hmm, W10 Pro here.**

**luis-rj**

**[05:23](#msg60c5963c184fef617ae53319)Tested en another W10 Home and W10 Pro without problem.**  
**Perhaps need an clean install.**

**hiiamboris**

**[08:20](#msg60c5bfe65e8dfc4f117b5f8b)Could be your theme.**

**luis-rj**

**[16:44](#msg60c635e68681550d4eea6d4f)Nop, different themes same result.**

**[16:54](#msg60c63845184fef617ae670cb)What are the instructions for get a fresh installation?**

**hiiamboris**

**[17:17](#msg60c63da456df183c2311a943)of Red? download &amp; run**

**[17:17](#msg60c63dc18681550d4eea7d70)use nightly build, as the stale one had some bugs with colors**

**luis-rj**

**[18:15](#msg60c64b3887848634af1adf2a)Ok, but .red files remain associated to old versions.**

**[18:24](#msg60c64d77747a772d99f06e43)Perhaps the problem are new Red versions and the Notebook hardware.... Someone has W10 with AMD Ryzen7 CPU chips ?**

**hiiamboris**

**[19:21](#msg60c65ab4b346e9618bccbc46)Red does not change file associations, so you're in full control of that.**

**luis-rj**

**[19:32](#msg60c65d4b4fc7ad136acb9f18)Ok, the problem persists with the today Red version.**

**ne1uno**

**[19:34](#msg60c65db8d20143617e42a203)would running a debug version of red show an error maybe?**

**hiiamboris**

**[19:35](#msg60c65e1c56df183c2311e70f)unlikely, as panel is a native control**

**[19:36](#msg60c65e57b346e9618bccc3ee)@luis-rj what is the red version? (that is, output of `about` - to exclude a possibility of your mistake) and what does `system/view/metrics/colors/panel` tell?**

**ne1uno**

**[19:43](#msg60c65ff2747a772d99f0953d)update graphic drivers? might be a d2d ryzen bug?**

**luis-rj**

**[23:48](#msg60c6993d8681550d4eeb2de3)@ne1uno Hi**  
**-c -d compile with no output errors**  
**About Build shows 13-Jun-2021**  
**system/view/metrics/colors/panel tell: 240.240.240**  
**Driver are updated and Lenovo diagnostics no report problems**

**[23:54](#msg60c69ac4c705e53c1c8dd847)Build 8-Jan-2021: NO problem**  
**Build 23-feb-2021: black panel problem.**

****Monday 14th June, 2021****

**luis-rj**

**[00:15](#msg60c69f8cd855766185d6c89f)Black panel problem appear related to Draw on panel.**

**[00:16](#msg60c69ffba5d5740d6122f166)If not set draw shows ok.**

**hiiamboris**

**[09:18](#msg60c71ee33169e234986562f8)well, dates suggest it's D2D-related**

**[09:18](#msg60c71eefa5d5740d6123f115)please open an issue https://github.com/red/red/issues/new?template=bug\_report.md**

**[09:19](#msg60c71f06b3173113542bcb51)hopefully @qtxie will be able to guess what the problem is**

**fvanzeveren**

**[18:47](#msg60c7a44c8681550d4eed8a1d)Hello, it has already been probably noted in the past, but I want to know if it is normal behaviour that `repend` and `append reduce` do not behave the same?**  
**`c1: context [ h: make hash! [] repend h ['obj1 make object! [a: 1 b: 2 c: 3]] repend h ['obj2 make object! [a: 4 b: 5 c: 6]] ] c2: context [ h: make hash! [] append h reduce ['obj1 make object! [a: 1 b: 2 c: 3]] append h reduce ['obj2 make object! [a: 4 b: 5 c: 6]] ] print mold c1/h/obj1 print mold c2/h/obj1 print mold select c1/h 'obj1 print mold select c2/h 'obj1`**  
**The `select` statement returns `none` on the `repend` version.**  
**Note that with Rebol, `repend` and `append reduce`behave the same**

**greggirwin**

**[19:13](#msg60c7aa47c705e53c1c903d21)What build of Red are you running? I get the same results here. There is a general ticket related to \[/into](https://github.com/red/red/issues/4109), but that's not in play here.**

**fvanzeveren**

**[19:17](#msg60c7ab663169e2349866bfb2)red-064**

**[19:18](#msg60c7ab7b56df183c2314b80d)Maybe I should try the nightly build.**

**greggirwin**

**[19:18](#msg60c7ab8156df183c2314b815)Please use `about/debug` in the console to show the details.**

**[19:18](#msg60c7ab96c705e53c1c904028)Always best to use the nightly builds. We're moving to a new release model soon, so those will be the default.**

**fvanzeveren**

**[19:20](#msg60c7ac17a5d5740d61254db0)-----------RED &amp; PLATFORM VERSION-----------**  
**RED: \[ branch: "HEAD" tag: #v0.6.4 ahead: 0 date: 22-Nov-2018/0:40:38 commit: #755eb943ccea9e78c2cab0f20b313a52404355cb ]**  
**PLATFORM: \[ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19042 ]**  
**--------------------------------------------**

**greggirwin**

**[19:21](#msg60c7ac42c705e53c1c9041d3)Yeah, that's \*really* old. :^)**

**[19:22](#msg60c7ac82d20143617e458cf0)I can confirm that the behavior is different in that old build.**

**fvanzeveren**

**[19:22](#msg60c7ac93d161a54f05162b2f)indeed... but I am back to rebol/red after a break of 2 years almost... I learned Python... but it does not simply come close to red/rebol :)**

**[19:25](#msg60c7ad47d855766185d92d73)Just tried the nighly build... and this is working as expected... Thank you!**

**[19:28](#msg60c7adf18681550d4eeda355)And `divide` is behaving properly now :) On the old version, `divide 5 2` returned `2` and it was necessary to `to-float`one of the operands...**

**greggirwin**

**[19:29](#msg60c7ae28d20143617e459131)Yes, integer divide was a big discussion, with `modulo` changes still to come. :^)**

****Tuesday 15th June, 2021****

**qtxie**

**[03:08](#msg60c81996b3173113542e18c7)&gt; well, dates suggest it's D2D-related**

**@hiiamboris Yes. Very likely. We have to interop with window's DC when drawing on panel, seems it's not supported very well on some drivers.**

**[03:09](#msg60c819ce87848634af1ed73f)&gt; Hello, with lastest build, draw on panel shows all panel black:**  
**&gt;**  
**&gt;**  
**`> view [canvas: panel 150x150 draw [line 10x0 160x50]] >`**  
**&gt; No problem on 08jan21 build**  
**&gt;**

**@luis-rj It's better to draw on a `base` face if possible. Only use `panel` as a container of the other faces.**

**GiuseppeChillemi**

**[22:48](#msg60c92e3bbed13a2dba86e1c0)Is there in Red a function of this (Rebol):**  
**`>> o: make object! [a: 22 b: 33 c: 'a] >> third o == [a: 22 b: 33 c: a]`**

**Red `to-block` returns the `C` value as `'a` instead of `a`:**

**`o: make object! [a: 22 b: 33 c: 'a] >> to block! o == [ a: 22 b: 33 c: 'a ]`**

**greggirwin**

**[22:55](#msg60c92fd9c705e53c1c93d6ac)`body-of`**

**[22:56](#msg60c93002d20143617e4925cc)It has the same behavior though, because R2 was lossy in returning the body, Red is correct.**

****Wednesday 16th June, 2021****

**GiuseppeChillemi**

**[04:48](#msg60c982835e8dfc4f1183bb30)Thank you, I alway forget about `body-of`**

**Oldes**

**[10:35](#msg60c9d3eab317311354322d87)&gt; It has the same behavior though, because R2 was lossy in returning the body, Red is correct.**

**To be honest, I'm not sure if it's correct in Red. I think Red's behavior is inconsistent.**

**[10:38](#msg60c9d4b25e8dfc4f11847dd4)I believe that these 3 results should not be same:**  
**`>> body-of make object! [a: 1 + 1 c: to lit-word! 'a] == [ a: 2 c: 'a ] >> body-of make object! [a: 1 + 1 c: 'a] == [ a: 2 c: 'a ] >> body-of make object! [a: 1 + 1 c: to word! 'a] == [ a: 2 c: 'a ]`**

**GiuseppeChillemi**

**[17:31](#msg60ca35543169e234986cba5b)@Oldes I think also. There is no function that returns the block with its values, just the one which is needed for `Make Object!` to create the context.**

**[17:32](#msg60ca35b6184fef617aef97d3)Wait, I am not in front my PC. Have you tried `TO-BLOCK`?**

**hiiamboris**

**[17:39](#msg60ca375056df183c231ad322)same behavior**

**[17:41](#msg60ca37bcb346e9618bd5a2db)I don't find this special case elegant myself. But I think the reason it was done so is not to support `make object!` (which will fail in numerous other cases), but so it will be molded into something that looks to us - readers - as part of our code.**

**giesse**

**[17:55](#msg60ca3b1d5e8dfc4f11857dfc)actually, at least in R2, it was done to support `make object!` (because that's what `mold` used to do before `/all`) - it just didn't really work as you say, so eventually we got `mold/all` as the solution...**

**hiiamboris**

**[18:04](#msg60ca3d2b8681550d4ef3c0e4)all the more reason to fix it..**

**GiuseppeChillemi**

**[20:31](#msg60ca5fb8d161a54f051c86c6)@giesse In fact, I am using in Rebol to create an object using another context block as prototype.**

**greggirwin**

**[23:11](#msg60ca8534bed13a2dba89fed2)If somebody wants to write it up in detail, that would be great.**

**[23:13](#msg60ca85b8a5d5740d612bff6b)@Oldes how do your first two differ? And would the third resolve `a` when the object is made? Or what is the use case for 3?**

****Thursday 17th June, 2021****

**GiuseppeChillemi**

**[08:17](#msg60cb051cb346e9618bd74a28)@greggirwin**  
**In the past I have encountered 2 needings:**  
**1) To have each set word and its value split in a block**  
**2) To have the maker block of an object to be used to create another one.**

**For the first usage:**

**`>> body-of make object! [a: 1 + 1 c: to lit-word! 'a] >> body-of make object! [a: 1 + 1 c: 'a] >> body-of make object! [a: 1 + 1 c: to word! 'a]`**  
**We need a function which returns this**

**`== [ a: 2 c: a ]`**  
**For the second usage, we need a function which returns this:**

**`== [ a: 2 c: to lit-word! 'a ]`**  
**or the equivalent**

**`== [ a: 2 c: quote 'a ]`**

**[08:19](#msg60cb057c87848634af258b94)We have to choose which function should return the split `word` - `values` version and which one the maker block version, and in which form.**

**hiiamboris**

**[08:24](#msg60cb06c587848634af258f92)(2) is solved simply by `copy obj`, and (1) - what is that block used for?**

**GiuseppeChillemi**

**[08:30](#msg60cb0820d855766185e0d492)(2) Yes, it is solved for the usage case of `copy obj` as a whole because Red can copy it, while Rebol can't. But if you want to move around this block like sending it remotely, you need the maker version...**

**[08:36](#msg60cb099ca5d5740d612d0c12)(1): it is needed for conversion from Objects to Maps**

**`>> a: make object! [b: 22 c: 'z] == make object! [ b: 22 c: 'z ]`**  
**Now you can't**  
**`>> x: to-map compose [(body-of a)] == #( b: 22 c: 'z )`**  
**Because `c: 'z` should be `c: z`**

**hiiamboris**

**[08:43](#msg60cb0b45b31731135434e4dc)Would you open a \[wish ticket](https://github.com/red/REP/issues)?**

**[08:45](#msg60cb0bb45e8dfc4f1187388b)Basically we want object to map and back conversion. Which also links to https://github.com/red/REP/issues/100**

**[08:46](#msg60cb0be28681550d4ef56bd3)And on the way we could fix the block representation because it doesn't seem good for anything. Though question is, what can it be good for?**

**GiuseppeChillemi**

**[09:04](#msg60cb10263169e234986e8b72)I remember also my first confusion when I have issued a ``body-of , having seen words becoming lit-words. Gregg then explained me the reason in red/bugs. The same could happen when you create an object and you see on the console: >> make object! [b: 22 c: 'z] == make object! [ b: 22 c: 'z ] Where >> make object! [b: 22 c: 'z] == make object! [ b: 22 c: z ] is INHO, more natural. Yes, I will later write a ticket. 09:08Or also something like: >> make object! [b: 22 c: 'z] == context! [ b: 22 c: z ] So we can split the make representation from the content representation. What your think about this? hiiamboris 10:04theres no context! type GiuseppeChillemi 11:16I mean a different representation of the output rather than its creation instrunctions. 23:44@hiiamboris Gregg @greggirwin has referenced this chat in https://github.com/red/REP/issues/100 , so I don't think I should open a wish. Friday 18th June, 2021 hiiamboris 07:31100 is about construct behavior. You can comment there, but I still think it is worth a separate wish since we started from the opposite thing: how to deconstruct an object and possibly pass it as a block to Rebol or convert into a map. greggirwin 17:53Coming back here from /bugs. A key point, to me, is that object specs are evaluated while blocks and maps are not. So what makes sense for one may not make sense for the other. What I care about is how painful it is to change from one to the other, if there are changes in behavior that trip you up, but less so about whether their serialized forms look the same. We can start by comparing maps and blocks, then reduced blocks with objects, etc. Wednesday 30th June, 2021 bubnenkoff 09:29Hi all! Remember me please how to update vamp value? I need to set every map value in list to 0: list: [#(customers: 2) #(foo: 4)] foreach el list [ ; set el 0 ] probe list rebolek 09:30something like foreach el list [foreach [key value] el [el/:key: 0]] bubnenkoff 09:31oh thanks! Saturday 3th July, 2021 rapid-gtr 06:56Missed you though. hiiamboris 07:13:+1: koba-yu 14:00Hi, I want to call some WEB APIs with image binary. The code below is a sample image code I tried, but the API returns the message "the binary is not a correct image". r: write/info http://test/example.com compose/deep [ post [ upload_file: ( read/binary %"/C/sample.png" ) ] ] Does anyone know how to post image binary, or any debuging advices for me? (I have confirmed the API requires binary, not base64 string, by trying different C# code and geting correct response) hiiamboris 14:24tried adding Content-Type: "application/octet-stream"? (or "image/png") koba-yu 14:44@hiiamboris not works, but thank you! ldci 15:47@koba-yu You can try Img: load % your file bin: img/argb hiiamboris 16:06Unlikely the server doesn't support second most common image format.. 16:06@rebolek might think of something. greggirwin 16:49@koba-yu is it a public API you can share that we could try? gltewalt 18:14write/binary ? Sunday 4th July, 2021 koba-yu 01:26@ldci @hiiamboris @gltewalt Thank you everyone. I am trying your advices. @greggirwin > @koba-yu is it a public API you can share that we could try? unfortunately, no. The API is built by the 3rd party vendor for a project I am working. Probably I should consider try other public well-known API with image binary parameter first, to reveal whether the trouble occurs inside API side or inside Red side. gtzip 02:26Good idea ldci 09:21A redression for macOS Compiling to native code... *** Compilation Error: undefined symbol: ~b||566 *** in file: %/Users/fjouen/Programmation/Red/RedCV/samples/image_haar/faceDetection.red *** in function: exec/f_loadClassifier *** at line: 1 *** near: [~b||566 stack/mark-func ~rcvReadTextClassifier exec/ctx||503 word/get ~classifierFile word/get ~nParameters ] hiiamboris 09:23you'll have to isolate it and file an issue, otherwise tells nothing ;) ldci 09:35@hiiamboris You’re right. I’m tracking the error :) 13:41@hiiamboris : found. Conflict in redCV libs with a block not correctly initiated. Thanks. Tuesday 6th July, 2021 tmphei:matrix.org 08:45Hey guys! Is there a way to run Red on the latest macOS? rebolek 08:46@tmphei:matrix.org Hi, I'm running Red on macOS using Docker, there are multiple solutions https://github.com/red/red/wiki/%5BLINKS%5D-Unofficial-Red-images tmphei:matrix.org 08:56Got it! Maybe stupid question but what needs to happen to create 64bit version? rebolek 08:57Well, a lot :) tmphei:matrix.org 08:59So I guess it’s not “automatically recompile to 64bit target” kinda thing 😂 rebolek 08:59Because Red has its own compiler, the whole compiler needs to be adjusted for 64 bits. greggirwin 17:31Deep design decisions to make as well. e.g. because Red values are high level, carrying extra info with them, do we widen those "cells" for other and future uses, or do we try to pack things tightly to reduce memory use? There are often multiple tradeoffs, where "wasting" space will allow things to align in memory more efficiently. GiuseppeChillemi 22:00As refinement! can't carry a context, which other types (apart lit-word!) can carry one? Wednesday 7th July, 2021 rebolek 03:58words (not lit-words) carry context hiiamboris 06:35any-word carries it, all-word doesn't GiuseppeChillemi 18:11Any word has: word! set-word! lit-word! get-word!, so all shoud have a context greggirwin 18:20What he means is that refinement! and issue! don't support it today (though they do use the same structure internally and could in the future). They are the added word types in all-word!. GiuseppeChillemi 19:14If he = hiiamboris, I was answering to Boleslav. 19:16I have already tried setting lit-word with success: >> x: first bind ['hello] make object! [hello: true] >> probe reduce reduce x true gltewalt 23:24Yep, should be just refinement! and issue! that do not. For now. Thursday 8th July, 2021 ldci 07:48Hi everybody . Could someone help me to translate this python function into Red function def do_timestep(u0, u): # Propagate with forward-difference in time, central-difference in space u[1:-1, 1:-1] = u0[1:-1, 1:-1] + D * dt * ( (u0[2:, 1:-1] - 2*u0[1:-1, 1:-1] + u0[:-2, 1:-1])/dx2 + (u0[1:-1, 2:] - 2*u0[1:-1, 1:-1] + u0[1:-1, :-2])/dy2 ) u0 = u.copy() return u0, u GalenIvanov 09:03@ldci It Apparently this uses NumPy's multidimensional arrays with slicing. 09:04Is [this](https://scipython.com/book/chapter-7-matplotlib/examples/the-two-dimensional-diffusion-equation/) the source? ldci 09:06@GalenIvanov Yes you’re right, but slicing is a little bit complicated comparatively to Red approach. I’m just looking. for a simple way to wite an equivalent function with Red:) GalenIvanov 09:09@ldci Yes, I understand. I don't know NumPy but as it seems it works directly with vectors/tables. We'll need a lot of foreach loops, or some of @hiiamboris *each menagerie :smile: ldci 09:23@GalenIvanov Numpy is fast since compiled. I made some test with iterating boucles: not very efficient. timestep: does [ v1: u0/1/1 + (D * dt) v8: 0.0 repeat j ny [ repeat i nx [ u/:i/:j: u0/:i/:j if all [j > 1 j < ny i > 1 i < nx][ v1: u0/:i/:j + (D * dt) if all [j > 1 j < ny i > 1 i <= nx][ v2: u0/:i/:j - (2.0 * u0/:i/:j) ] if all [j < (ny - 2) i > 1 i < nx] [ v3: u0/:i/:j ] v4: (v2 + v3) / dx2 if all [j > 1 j < ny i > 1 i <= nx] [ v5: u0/:i/:j - (2.0 * u0/:i/:j) ] if all [j > 1 j < ny i < (nx - 2)] [ v6: u0/:i/:j ] v7: (v5 + v6) / dy2 v8: v1 * (v4 + v7) print [v1 v2 v3 v4 v5 v6 v7 v8] ] u/:i/:j: v8 ] ] u0: copy u ] hiiamboris 10:13For that, an array/matrix/tensor DSL is needed. With solid support on R/S side eventually. Nobody even sketched it so far, except my adhoc idea in https://github.com/red/REP/issues/43. But it's probably best to just think bigger and copy ideas from Q lang, then gradually bring in optimizations. 10:15Having slices in Red natively will also help I think. GalenIvanov 10:19I agree with @hiiamboris 10:21@ldci Your code reminds me of a vertex shader - executed for each pixel :smile: ldci 12:57@GalenIvanov @hiiamboris Thanks for comments. BTW with Toomas. we included in redCV a matrix object. Have a look here: https://github.com/ldci/redCV/tree/master/libs/matrix. I’ve to add slicing now based on matrix/split function. Regards. GalenIvanov 13:14@ldci :+1: ldci 14:43@GalenIvanov @hiiamboris : matrix/slice implemented: Float matrix Mat Order : 4x4 as Red pair! Mat header: 3 64 4 4 Mat values: [ 1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0 11.0 12.0 13.0 14.0 15.0 16.0 ] Slice 2 3 2 3 [ 6.0 7.0 10.0 11.0 ] Done 14:46This is equivalent to [1:-1, 1:-1]in Numpy GalenIvanov 15:38@ldci Great! greggirwin 16:59Nice work @ldci. ldci 17:31@greggirwin matrix lib should be improved and integrated in Red:) greggirwin 17:45I'll bring it up for discussion. GalenIvanov 18:21@ldci I wonder if it would be convenient for a slice in a matrix to be specified by two pairs: XxY for top-left corner and WxH for width/height. greggirwin 18:29That's the bigger generalization question. Matrices up to 3D could be supported with integers, pairs, and (eventually) points. We haven't nailed down point! syntax, but general matrix design shouldn't be too contentious (unlike other areas where questions just lead to more questions). GalenIvanov 19:07@greggirwin I agree. I confess I was thinking of matrixin @ldci's case as strictly 2d :smile: Sunday 11st July, 2021 planetsizecpu 07:28Great job @ldci ldci 09:35@planetsizecpu You can congratulate Toomas for his help in designing first version of matrix-object :) planetsizecpu 10:25@ldci IIRC I did at the time, but anyway my congrats @toomasv 🙂 good team work. toomasv 13:31:) Monday 12nd July, 2021 GalenIvanov 18:56Hi everyone! I just completed the [Coming to Red from Python](https://github.com/red/red/wiki/Coming-to-Red-from-Python) section in the wiki and I would like to ask you for your feedback. Please feel free to make any eventual minor fixes in place, or fill in the Notes sections with longer questions, comments and suggestions. Thank you in advance! greggirwin 19:09:clap: :clap: Also, if you know any Pythonistas who can tell us how useful it is, that would be great. Thanks @GalenIvanov! I'm very excited about this. GalenIvanov 19:15Thank you @greggirwin ! hiiamboris 19:54added a note for the "why?"-inclined toomasv 19:55@GalenIvanov Great work! Also I don’t know much Python, it looks impressive. May be I’ll pythonize a bit starting from it. hiiamboris 20:07good way to learn how bad it is :) greggirwin 20:14On reading the intro again, I'd like to make it less pointedly critical of Python. The first paragraph changed in March, and I may have missed that bit in later reviews, focused on the big new content @GalenIvanov has added. The reason for this is multifold: 1) Picking fights is not constructive. I personally don't want to be argumentative, and have deep respect for others' work. 2) We're liable to turn people away from looking at Red by being critical of a tool that has served them well. 3) People may share our criticisms elsewhere, more public forums, and others may come back to point out *our* weaknesses. GalenIvanov 20:15Thanks @hiiamboris and @toomasv ! greggirwin 20:19I'll tinker on it, and we can go from there. hiiamboris 20:24Don't slam Gregg. He's already slammed enough ☻ gltewalt:matrix.org 20:34I recommend grammarly, or the like, for those who regularly write content 20:41Reason: it's a timesink to go back several times to fix typos or spelling greggirwin 20:41Wiki updated. I'm almost clear to catch up with @hiiamboris now. ;^) 20:43I would have caught up already, but it seems the example on https://github.com/red/docs/blob/master/en/ownership.adoc doesn't work anymore (even after adding append to the action check). Need to see if it's related to an open ownership ticket. 20:46Also, @gltewalt:matrix.org the i18n issue is only on detailed blog pages, which is probably why it hadn't caught my eye before. Should be easy enough to fix...once I stop being a bottleneck for @hiiamboris. ;^) gltewalt:matrix.org 22:40The only thing boris should be doing, is the whole C3 thing by next Monday Tuesday 13th July, 2021 hiiamboris 18:21I thought you aimed at red/red :) Thanks for the praise of my paragraph though ☻ greggirwin 18:22I was *sure* was aimed at red/red. When we write OpenME we need a move feature. 18:22I thought it was you, but wasn't sure. hiiamboris 18:24You have doubled paragraph there 18:24in red/red greggirwin 18:25Thanks, fixed. Wednesday 14th July, 2021 bubnenkoff 08:56Hi! I have got working code that doing some http requests. After around one hour I am getting error: *** Script Error: scan does not allow block! for its buffer argument *** Where: scan *** Stack: view layout layout do-safe parser-init start-stop-processing get-files-for-processing-from-http get-files-for-processing-from-http get-files-for-processing-from-http scan What operation can be reason of this error? The function code https://gist.github.com/bubnenkoff/3fa6216ae1371deed90bb9acc2a9d996 I do not see any place with potential problem hiiamboris 09:46What's scan? 09:59Since you have events processed there, I suppose you have a View window running. I can see that scan (lexer function) is used by it to [convert text and field's /text facet into /data](https://github.com/red/red/blob/master/modules/view/view.red#L461). So it's possible your code sets /text to a block somewhere. bubnenkoff 10:02Yes, there is some places where I am setting /text. So What does this error mean. That function trying to set block to /text somewhere? hiiamboris 10:04I think so. 10:05Put checks before every /text: assignment. Maybe log these values into a file for later review. Thursday 15th July, 2021 yelizarovd 11:08Hi everyone, I have a question about using the progress face in VID. I have a list of urls pointing to images that I want to load. I loop through each url, load the image, and set the progress bar's /data to the total number of images loaded so far. However, the progress bar doesn't update until the loop has finished running, so it always jumps from 0% to 100%. How can I make sure that the progress bar is updated after each loop iteration? Full code here: https://gist.github.com/yelizarovd/3e12b0eab06058de976870f83f989310 GalenIvanov 11:18@yelizarovd You can try to declare the progress bar as follows: 11:19 loading-bar: progress 0% react [loading-bar/data: percent-done] 11:19and remove the line 11:19 loading-bar/data: percent-done 11:21You'll need something more yelizarovd 11:21Interesting. I just tried it, but it doesn't seem to work. Also, "show loading-bar" at the end of the loop doesn't work either. GalenIvanov 11:26Create a reactor: prog-react: make reactor! [percent: 0] Create a progress bar loading-bar: progress 0% react [loading-bar/data: prog-react/percent] Update the reactor's percent value prog-react/percent: make percent! processed-count / total 11:38@yelizarovd Please tell me if this works for you: 11:39 Red [Needs: 'View] image-urls: [ https://i.ytimg.com/vi/1Ne1hqOXKKI/maxresdefault.jpg https://ichef.bbci.co.uk/news/976/cpsprodpb/12A9B/production/_111434467_gettyimages-1143489763.jpg ] processed-count: make float! 0 total: make float! length? image-urls images: [] prog-react: make reactor! [percent: 0] view [ size 600x600 below h1 "Image Viewer Test" loading-bar: progress 0% react [loading-bar/data: prog-react/percent] across button "Start loading" [ foreach url image-urls [ append images load url processed-count: processed-count + 1 prog-react/percent: make percent! processed-count / total print prog-react/percent ] my-image/image: first images ] return my-image: image 300x300 return button "Previous" [ images: back images my-image/image: first images ] button "Next" [ images: next images my-image/image: first images ] ] yelizarovd 11:57Unfortunately it still doesn't work. I should have mentioned earlier -- I'm running on OSX GalenIvanov 11:58I'm on Win 10 11:58:smile: yelizarovd 12:17Ah, that's probably it. It looks like OSX support is at 98% -- I'll need to check back in a little while. hiiamboris 14:26@yelizarovd Try adding do-events/no-wait after changing progress-bar data facet. 14:27Red is single-threaded now, so when you program loads the file, it cannot at the same time draw graphics for you. 14:29If there's a lot of queued GUI updates, better call that function in a loop, as in [do-queued-events](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/do-queued-events.red) yelizarovd 16:31@hiiamboris It works! Thanks for the tip. hiiamboris 17:32You're welcome. Sunday 25th July, 2021 bubnenkoff 13:24HI! I need to iterate next blocks by pairs: blk: [ [OKPD_code OKPD_name quantity isMedicalProduct] ["25.22.11" "aa aaa aaaaa" "1.00" none] ] for each element from the first block print a pair from the second block OKPD_code "25.22.11" and so on. What is the best approach for it? 13:29Is it's good solution? foreach el blk/1 [ foreach el2 blk/2 [ print [el el2 ] ] ] hiiamboris 13:40> Is it's good solution? Does it work? bubnenkoff 13:42yes 14:50Sorry, no, it does not work: OKPD_code 25.22.11 OKPD_code aa aaa aaaaa OKPD_code 1.00 OKPD_code none OKPD_name 25.22.11 OKPD_name aa aaa aaaaa OKPD_name 1.00 OKPD_name none quantity 25.22.11 quantity aa aaa aaaaa quantity 1.00 quantity none isMedicalProduct 25.22.11 isMedicalProduct aa aaa aaaaa isMedicalProduct 1.00 isMedicalProduct none 14:52 foreach key blk/1 [ val: none foreach value blk/2 [ val: value ] print [key val] ] this work greggirwin 16:08Rather than using 2 loops, it's common to use repeat, based on the length of one series, and then the index counter to access items in other series. Oldes 16:55@bubnenkoff repeat i length? blk/1 [print [blk/1/:i tab mold blk/2/:i]] bubnenkoff 17:34thanks! toomasv 18:37May-be something like: zip: function [b1 b2 /with fn][ out: clear [] len: min length? b1 length? b2 repeat i len [ either with [ fn b1/:i b2/:i ][ repend out [b1/:i b2/:i] ] ] unless with [out] ] blk: [ [OKPD_code OKPD_name quantity isMedicalProduct] ["25.22.11" "aa aaa aaaaa" "1.00" none] ] zip blk/1 blk/2 ;== [OKPD_code "25.22.11" OKPD_name "aa aaa aaaaa" quantity "1.00" isMedicalProduct none] zip/with blk/1 blk/2 func [a b][print [a b]] ;OKPD_code 25.22.11 ;OKPD_name aa aaa aaaaa ;quantity 1.00 ;isMedicalProduct none bubnenkoff 18:38hah! Look cool! Monday 26th July, 2021 toomasv 05:27Oops! Can't use clear here :flushed:. First two lines better len: min length? b1 length? b2 unless with [out: make block! 2 * len] bubnenkoff 07:17How to remove exclamation point from data? data: [ aa: "foo" !bb: "bar" dd: "baz" ] I tried to do it with foreach but it do not work. I am understanding why it do not work, but I can't figure out how to do it righ: foreach [k v] data [ if find to-string k "!" [ data/:k: to-set-word replace to-string k "!" "" ] ] probe data rebolek 07:21data/:k uses k as a key so it's accessing it's value v, you need to change directly the value you want. Here's one approach: forall data [if find to string! data/1 #"!" [change data to set-word! next form data/1]] bubnenkoff 07:26thanks! Thursday 29th July, 2021 bubnenkoff 09:26How to get false? >> to-logic "false" == true >> >> to-logic reduce "false" == true 09:34I see only one variant: >> to-logic reduce to-word "false" == false toomasv 10:01@bubnenkoff to-word is superfluous here. 10:25Sorry, I meant to-logic! bubnenkoff 10:25thanks! 10:51I am getting some action as block. How I can evaluate it: x: [to-integer] reduce x "1" xqlab 11:39 >> do append copy x "2.5" == 2 dsunanda 12:56Another way (There's almost always other ways in Red): do reduce [ x/1 "12.3"] == 12 toomasv 13:51Also: fn: get x/1 fn "2.5" == 2 greggirwin 16:27@bubnenkoff on logic, see [this wiki page](https://github.com/red/red/wiki/%5BDOC%5D-%60to%60-vs-%60make%60). gltewalt 19:23do rejoin [x "1"] Friday 30th July, 2021 TimeSlip 22:20Trying to solve a problem in either Red/system and/or Red. I have a system routine that returns an int-ptr! . It points to a set of data that I can access individually. For example, by looping through with probe as-c-string row/idx This is all happening on the /system side. What I want to do is either store those strings in a block and return the block (to Red) OR somehow deal with the int-ptr! in Red. Does that make sense? I seem to be caught in between the two worlds of /system and "normal" Red. Thank you as always. Saturday 31st July, 2021 hiiamboris 06:00Wrap them as integers into a Red vector? TimeSlip 06:14@hiiamboris Thank you. I'll look into that. I've been studying Francois' [OpenCV]( https://github.com/ldci/OpenCV3-red/blob/master/manual/Red%20and%20OpenCV%C2%A0.pdf ) manual and it talks about the differences. I'll just have to figure out what I can do. What's the difference between a block! and a vector! ? 06:16@hiiamboris BTW, thanks for your help. Together with Francois, I've been able to work with C structs and pointers enough to get to the point I'm stuck at now :-) That's still progress. hiiamboris 06:17Vector is tightly packed, while in block you currently waste 128 bits for every 32 bit integer 06:19If you'd prefer blocks, you can use handle! type then as more idiomatic for pointers. TimeSlip 06:55@hiiamboris I see. My problem is being able to add items to a block in /System. For me, there's a lot of mystery that goes on there. Well, thanks again. I let you know if I ever figure it out. hiiamboris 07:03block/rs-append blk integer/push 12345 ? have you taken a look at https://github.com/red/red/blob/master/runtime/datatypes/block.reds ? pekr 07:03I wished for R/S having some higher level concepts as blocks or arrays, but then where to draw a boundary between Red and R/S? We've got a literal array support though, with the following remark: "Currently literal arrays allow write access, but there is no bound checking as it is planned to be a feature of a future array! first-class datatype." .... and in the 19.8. section of the R/S docs, we can read: "Array!: this datatype would allow declaring arrays of values that could be accessed with an integer index (similar to C arrays). Redundancy with c-string! datatype would need to be considered. Here is a draft os possible syntax and usage:" ---- C ------ --------- Red/System ---------- int p[20] = 0; p: array [20 integer!] p[4] = 123; p/4: 123 p[i] = 123; p/i: 123 @TimeSlip would that be what you are eventually looking for? TimeSlip 07:27@hiiamboris Thank you. No, I have never seen that file. @pekr Thank you. That would be nice for me right now. I thought what I could do at this point is save the pointer, get the # of items in the array that is being returned and one-by-one have them returned to a Red block where I can work with them. right now I can see them by probing an indexed array but for the life of me I can't seem to pass them back. Well, thanks for the input. I'll keep trying. ldci 10:27@TimeSlip: Hello have a look here: https://github.com/ldci/redCV/blob/master/libs/objdetect/rcvHaarCascade.red. You’ll find a way to communicate between Red/S and Red and sharing blocks or vectors. TimeSlip 23:33@ldci Oh thank you. I just noticed that I had to be careful about the values being passed back to Red. I didn't notice before but they we not the same and that was at least part of the problem. GIGO. Sunday 1st August, 2021 TimeSlip 02:42@ldci , I know this is supposed to be simple but going from Red/S to Red, saving strings that I am reading in an Red/s routine and I want to access in Red. In your rcvHaarCascade code I see how it is supposed to work with integers but I wondering if strings are different. If anyone knows what a red-value! is supposed to look like, I can cross that off my list. I though that maybe I could use block/rs-append-block but when compiling I get *** Compilation Error: undefined symbol: red/block/rs-append-block Don't know why block/rs-append is there and it's in the block.reds file. gltewalt 02:57Might be quicker if you pasted your code somewhere TimeSlip 05:45@gltewalt Good idea. I'm going to isolate the parts that I'm having trouble with and post that. bubnenkoff 09:48Is there any principal difference between: do append copy x "2.5" and do reduce [ x/1 "12.3"] For example memory allocations etc? hiiamboris 10:24 >> recycle/off >> x: [length?] == [length?] >> prof/each/times [ [ do append copy x "2.5" [ do reduce [ x/1 "2.5"] [ ] 100000 <100000>53% .00137ms 100 B [do append copy x "2.5"] <100000>47% .0012 ms 60 B [do reduce [x/1 "2.5"]] 10:25I suppose append copy triggers reallocation of the copied buffer sometimes. zwortex 10:28Thanks... No offense to anybody but I was still struggling to understand the question... hiiamboris 10:29☻ 10:29It's a long discussion, x is buried somewhere far above. zwortex 10:31Must rewind the tape... Cheers. 10:59Move does not feel consistent to me when it operates on the same serie. ; When moving the first element of a serie to its second position, I would expect this to work : a: [ 1 2 3 4 ] move/part (at a 1) (at a 3) 1 a ;= [ 2 3 1 4 ] - 1 inserted after 3 ; But it does not, as the insertion takes place after and not before the insertion point. Therefore I have to write instead a: [ 1 2 3 4] move/part (at a 1) (at a 2) 1 a ;= [ 2 1 3 4 ] - 1 after 2 ; Move appears to work as if it was a removal followed by an insertion : a: [ 1 2 3 4 ] b: take/part (at a 1) 1 insert (at a 2) b a ;= [ 2 1 3 4 ] ; When you perform the move the other way round, moving a higher indexed element towards the beginning of the serie, or between two different series, indexes are not modified by the first removal and therefore insertion takes place as expected, before the insertion point a: [ 1 2 3 4 ] move/part (at a 4) (at a 3) 1 a ;= [ 1 2 4 3 ] - 4 before 3 a: [ 1 2 3 4 ] b: [ 1 2 3 4 ] move/part (at a 1) (at b 3) 1 b ;= [ 1 2 1 3 4 ] - 1 before 3 If this is the desired effect, my opinion is that it should be at least documented, as it appears counter-intuitive - to me but maybe others as well. hiiamboris 11:03See https://github.com/red/red/issues/3527 11:03TL;DR: I agree zwortex 11:31Sorry. I haven't done my home work properly and I missed that issue though it is spot on (especially your own comment). Which leads to the following remark : move on the same serie is not trustable, as it is, until this particular defect is closed... which should be marked not as bug but as design issue... and to the related question : is there a list of similar functions, like move, for which the behaviour might be altered and that are subject to design decisions that are still pending ? hiiamboris 11:39No such list. zwortex 12:36Another question. Maybe a controversial one. How to get multiline comments in vid ? This does not work... view [ title "Test" comment { field "Hello" } field "Bye" ] Returns: *** Script Error: VID - invalid syntax at: [comment {^/field "Hello"^/} field] *** Where: do *** Stack: do-file view layout cause-error Whereas, this works a: 1 comment { b: 2 } c: 3 And as I am on it, is there any intention to get delimited comments in Red that are at the lexical level ? I have seen there is an issue on the subject ( #724 ), however on a different context and some while ago, In my opinion there is the need for such comments that are removed at lexical level. This is particularly handy for inline comments, or to turn on and off some parts of the code while debugging or code that is pending, in which case I want to be able to modify the code as little as possible and certainly not be forced to add new things to it that may be relevant at the syntactic level ! hiiamboris 12:49what's the problem with using single-line comments? ![](https://i.gyazo.com/ed885399d261cd944846dbf052d5dd4b.gif) zwortex 13:33Single-line comment, especially when the comment happen to be at the end of the line, is great ! And if that feature was missing, I would be among the firsts to call for its implementation ! But as it happens, I was merely talking of multi-line comments, and more generally of delimited comments. The language provide them with comment {} at the language level. But not at the lexer level. For sure, there are ides around you may use to automatically mark, unmark a block of lines as being commented. This works and it is great. You're just asking the application level to supplement features that are handy and missing at the language level. But it does not work with inline comments, is not handy when the block is big, and furthermore, sometimes, it is desirable to have a different means of commenting the code that is easy to spot, and to segregate from single lines comments. For somebody writing his own code, that may not look that important as he knows, in general, why such code and such code was commented. However, when you don't master the code you're editing, and you just want to debug or test it, turning on and off some code with as little interaction as possible is a highly desirable capability. Given that it is not a feature that is hard to achieve, as it is merely telling the lexer to discard whatever characters is between two delimiters, in the same way as it does already discard whatever is between a semi-colon and an end-of-line, I'd rather have it implemented than dismissed. hiiamboris 13:48It does work well with inline comments and I don't see a real use case in your writeup. Why this or that code was commented should be explained in the comment, and is irrelevant to the comment form. 13:49You can abuse system/lexer/pre-load though if this feature is so tempting. 13:50https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#modifying-data-before-loading-it-lisp-reader-macros 13:52What syntax would you use? Oldes 14:53@zwortex I think that nobody figured out a good syntax for multiline comments yet. zwortex 14:56@Oldes at the end a wikipedia page with various syntaxes in different languages @hiiamboris Thanks for the link regarding the pre-processor. But this is not a solution to my quest, that is a multi-line comment or better put the support of a delimited comment at the lexical level. As mentioned, when you are well versed in the code you're editing, you will probably don't care for that much. But in a lot of scenarios, people do not master the code they are editing, or they are new to the languages. And the best strategy I know to find out what is the purpose of a piece of code, is to turn it off. A delimited comment is the less intrusive strategy for that : opening a comment at the start, ending it at the end of the code you want to get rid of. Do I have a bug in a certain region of the code and I suspect the code not to be that well balanced : no problem - just turn it off and see I can compile at least. The code might be quite big to comment it line by line, even with an ide : no problem - just open the comment and close it where you want. The code being edited might rely on well-formed end of lines, especially if formatting is involved : no problem - I don't add any new lines. The part of code is within a data structure, a parse rule, a vid template : wherever. Just put that chunk of code away. This may not be nice. This may not be the end product. But this is a good way for coding, or troubleshooting code that is not your own. And it doesn't prevent others from coding otherwise. As for the syntax, whatever pleases : /\* \*/ is a widely used convention, but you might follow the trend of other languages : some lisp variants use #| |#. personally I would favour a mix of ; and {} to keep consistent : either ;{ }; or preferably {; ;} for such comment. https://en.wikipedia.org/wiki/Comparison_of_programming_languages_(syntax)#Comments hiiamboris 16:28What makes you think it's not a solution? zwortex 16:51I knew you would answer that ! I will investigate the preprocessor. However let me return as a quick answer, that I would not like to abuse the preprocessor ! Furthermore, if I need to help somebody over the phone, I don't want to start by saying : do you know about preprocessor... until the point I can tell him : ok now, turn off that part of code, adding that particular symbol here, and that other one there... gltewalt 17:58Use compose 18:01view compose [title "Test" (comment { field "blah blah" }) field "Ok"] 18:12? hiiamboris 18:15Teaching to code over phone must be a challenge... zwortex 18:18@gltewalt - Just tested. I wouldn't have thought doing that. But it works like a charm. Compose performing the cleaning ! view compose [ text "Hello" (comment { bold }) gray (comment { button "Btn1" button "Btn2" }) button "Btn3" ] TimeSlip 18:48Oh, this mark-up! 18:48I'll try again. zwortex 18:51@hiiamboris Or merely trying to understand why my code works well in my own environment and not anymore when ran by somebody else. Until I remember : hoops ! If forgot about my own personal settings of my pre-processor rules that handle for me delimited comments... Silly me ! Must be careful next time. Like I said delimited comments are pretty handy, and not much of a deal to implement. Don't understand why this is such an issue. There are many design decisions that are heavy to implement and very restricting as for the present and future of the language. This one ? hiiamboris 18:54Red lexical space is a precious resource to waste. gltewalt:matrix.org 18:59@TimeSlip if you're on github, make a gist and then paste the link in here TimeSlip 18:59[Link to my Red/System to Red Code](https://github.com/TimeSlip/RS2Red) So I created a file that specifically let's me test what I have been talking about (sharing strings from Red/System to Red). I'm able to do that with integers but strings. 18:59@gltewalt:matrix.org Was just doing that. :-) zwortex 19:08@hiiamboris I have the perfect workaround for that : use the preprocessor to turn off those fancy rules that conflict with your own personal requirements. If you don't care, need, or want delimited comments : you may just disable them. hiiamboris 19:09If it's included into lexer, it's standard and can't be messed with. 19:10Using the preprocessor is a great personal solution without the issues. Well, most of the time ;) greggirwin 21:44https://github.com/red/red/wiki/%5BDOC%5D-Red-Should...-(Feature-Wars)#block-comments 21:49We should probably add a note in the intro to that page about anecdotal evidence for features. Monday 2nd August, 2021 pekr 03:00I have a slight problem with the word "anectodal" and interesting, how those words might have various connotations in different languages. E.g. in Czech "anekdota" means mostly a "joke". So - marking somoene's request as being "anectodal" sounds almost as an insult to me - man, you are a joke, don't even try to submit that feature request :-) gltewalt:matrix.org 04:21I'm sure he means anecdotal as in anecdotal evidence. "evidence in the form of stories that people tell about what has happened to them" hiiamboris 06:59I would object against /* */ syntax as I'm using it in [bulk](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/bulk.red) as word in the path. And because it automatically disables all refinements and words starting with *. E.g. my-block: [*marker: value] we can't address as my-block/*marker anymore. gltewalt:matrix.org 08:27These already a variation of ; used internally by some sort of convention that could be a candidate. Something like ;-- --; hiiamboris 08:28...And those ending with * as well. E.g. my-block/marker*/3 zwortex 09:56@greggirwin you've given a somehow distorded account of my anecdote. My initial request was for a punctuation marker to punch out some code, in the same way that the semi-colon gets rid of the end of the line. These comments don't need to survive the lexer stage ( as I guess semi-coloned comments don't either ). For that purpose, I don't need nested comments. I'd rather not in fact, especially if I am trying to sort out an un-balanced code, as I just want to get rid of whatever is between the opening marker and the first ending marker encountered. Now, if you're thinking of a syntax for some kind of annotations in a workable code. Let's say something equivalent to a dash — — in a regular text. This is a different story : a new datatype or a subtype that will coil up into the regular data flow. An exciting tale, but not mine. 11:46Going through a bunch of questions I have in my sack, I came up with a simple strategy (once again, just involving the lexer) : * **;** => comment until end of line - like now * **;;** => comment within a line until the next **;;** or end-of line (probably used in existing code, avoid regression) * **;;;** => comment until the next **;;;** or end of document (unlikely to be used in existing code, or rarely) You might go further with **;;;;** **;;;;;** etc. Basically, each comment level is un-nested : one level is terminated by the same marker. But you might nest lower-degree comments in a higher-degree one : comments of level 2 (**;;**) would not bother comments of level 3 (**;;;**). And if you're pissed of by a comment of level 3, you might go to the next level 4 or more as need be. hiiamboris 11:58:+1: 12:16looks like you're not the first to propose that: https://github.com/red/red/issues/724#issuecomment-41608703 12:18when I comment the same line multiple times it looks like ; ; ; ... not as ;;;... but some people have it the other way it seems zwortex 12:44Should have read the #724 thread entirely ! I will join my quest with this Pierre (@pchg) then. And as for the particular critic, you push : does not feel very strong to me. If ;;; triggers a multi-line comment, people will quickly adjust to it - I would expected the multi-line commenting functions in IDEs to implement it straight away. Anyhow, you might decipher other markers : * ; for level one * for level 2 : **;2** - **;_** or whatever extra character is unlikely to enter in conflict with other syntaxes encountered in a regular comment or code being commented * for level 3 : **;3** - **;__** etc. In my opinion, the initial proposition of doubling or tripling the semi-colon is simple enough. In particular, as for the readability, I'd be enchanted to encounter somebody coding without syntax highlighting. So when mixing a double semi-colon for a triple one, the effect is immediate in the code you're reading. hiiamboris 14:08> people will quickly adjust to it Yeah, likely. And I'm not objecting against this syntax, it seems non-breaking to me. I just have no need of multiline comments at all. gltewalt 20:29Can someone help @TimeSlip ? hiiamboris 20:44Strings must be UTF8-encoded. https://github.com/red/red/wiki/[DOC]-Guru-Meditations#convert-c-string-to-red-string greggirwin 20:45Yes, anecdotal evidence. Thanks for pointing out the different meaning @pekr. I will try to keep that in mind in the future. Great point on /* ... */ in paths @hiiamboris. @zwortex my hope in writing that entry was to generalize your request, and address open questions. Now I know *you* don't need nested block comments, but that doesn't answer whether anyone else does. Your idea is clever, but not compatible with Red. If any code has comments starting with ;;, for extra visibility, it breaks. gltewalt 20:49The entry has well presented points Oldes 21:26I personaly like @zwortex 's proposition.. the first one. zwortex 22:42@greggirwin (@gltewalt), I know that you were generalising the point. For my part, I was insisting on the limited impact of my own request that is to enhance the end-of-line comment as it already exists. It was meant to allow delimited comments in whatever dialect that may come up, vid included. The proposition of using compose and comment is a nice one but a bit rich you may admit, when advocating conciseness of the language : would not work with a long hash table, from which you want to dismiss a couple of values or try alternates. Back to your last remark though, I don't understand why it would break anything in Red if comments have ;; for extra visibility. It will only do so if your block-comment feature prepends commented lines with a single **;**. However as @hiiamboris mentioned, his own ide prepends them with **"; "**, and the same with mine. Another situation that might break existing code is if people use comments that have multiple ;;;;; - let's say for formatting purposes - personally I use ;----------. And a third one would be situations where people have commented twice the same line, using twice a double semi-colon, in which case the end of the line, that was part of the initial comment, may become relevant. I'm not denying there may not be such situations, but I'd be surprised if they were that frequent. greggirwin 23:29Quick (and wildly imperfect, since I'm not counting single ";" instances and some files are dupes) searching for ";;" gives me these results (rounded): - Red codebase: 570 occurrences in 330KLOC, half in test code. - Local Red code on my system (not including github repos): 650 occurrences in 185KLOC - Old Rebol code¹: 93K occurrences in 7.3MLOC (¹ This number is whacked because a lot of them are in REBOL.org scripts, and I I have multiple backups of those that were counted) Good thing a Red code analyzer is on our to-do list. :^) 23:39We now have some input, suggestions, and a few WAGgy numbers. If someone wants to pursue this, make it a formal proposal, aligned with the introduction to the Red Should... wiki page. gltewalt 23:45These symbols aren't options, but this is the extent of the rust comment system. I know it's a different universe of programming language - this is just an example of the types of comments you might want Regular comments which are ignored by the compiler: // Line comments which go to the end of the line. /* Block comments which go to the closing delimiter. */ Doc comments which are parsed into HTML library documentation: /// Generate library docs for the following item. //! Generate library docs for the enclosing item. greggirwin 23:45I just realized we should move to red/red for general chat on this. gltewalt 23:45It might get disorienting if you have 4 levels of ; 23:46oops, me too ^ Tuesday 3th August, 2021 zwortex 00:44@greggirwin, I don't get your numbers for Red repos. Mine are: - lines where ;;; (at least) are used find . \( -name "*.red" -o -name "*.reds" \) -exec grep -H -e ";;;" {} \; | wc -l ==> 2 - lines where ;; is used at the start of a line find . \( -name "*.red" -o -name "*.reds" \) -exec grep -H -e "^[[:space:]]*;;" {} \; | wc -l ==> 234 and these account for that number of different files find . \( -name "*.red" -o -name "*.reds" \) -exec grep -l -e "^[[:space:]]*;;" {} \; | wc -l ===> 46 out of find . \( -name "*.red" -o -name "*.reds" \) | wc -l ===> 406 - lines where ;; is used two times in the same line find . \( -name "*.red" -o -name "*.reds" \) -exec grep -H -e ";;.\+;;" {} \; | wc -l ==> 16 and these are all comments of the type ;; <comment> ;; <spaces> <end of line> that would not be impacted find . \( -name "*.red" -o -name "*.reds" \) -exec grep -H -e ";;[^;]\+;;[[:space:]]*$" {} \; | wc -l ==> 16 - lines where ; is used at the start of a line then followed by ;; in the same line find . \( -name "*.red" -o -name "*.reds" \) -exec grep -H -e "^[[:space:]]*;[^;]\+;;[^;]" {} \; | wc -l ==> 6 There are the 2 cases with ;;; to sort out. The rest - 234 cases with ;; and 6 cases with ; and ;; in the comment - may raise a problem but only when edited and if you happen to block-comment those lines with an IDE that does not use "; " to prepend those lines. greggirwin 00:45Move to red/red. ldci 17:01@TimeSlip. Some tests for you Red/System [ Title: "Pointers" Author: "ldci" ] print ["Let's play with structures and pointers" lf] print ["Create structure and pointer" lf] ;--First we create a structure as an alias (no memory allocation) union: alias struct! [ f [float!] i [integer!] str [c-string!] ] ;--then a pointer to the structure p-struct!: declare struct! [ptr [union]] ;--memory allocation ;--now we have to allocate the structure un: declare union un/f: pi un/i: 255 un/str: "Hello Red world" ;--and to create a pointer to the structure p-struct!/ptr: un ; on fait pointer sur ;--verify structure initialization print ["Structure address: " un lf] print ["Pointer value: " p-struct! lf] print ["Nice, we are pointing to the structure!" lf] print [p-struct!/ptr/f " " p-struct!/ptr/i " " p-struct!/ptr/str lf] print ["Now, let's modify the pointer values" lf] p-struct!/ptr/f: 0.0 p-struct!/ptr/i: 0 p-struct!/ptr/str: "Bye bye crual world!" print ["Pointer values are changed" lf] print [p-struct!/ptr/f " " p-struct!/ptr/i " " p-struct!/ptr/str lf] print ["And the structure too! " lf] print [un/f " " un/i " " un/str lf] 17:05@TimeSlip. The result : Let's play with structures and pointers Create structure and pointer Structure address: 000030D0 Pointer value: 000030C4 Nice, we are pointing to the structure! 3.141592653589793 255 Hello Red world Now, let's modify the pointer values Pointer values are changed 0.0 0 Bye bye crual world! And the structure too! 0.0 0 Bye bye crual world! greggirwin 17:54Thanks for that @ldci! Would someone like to add that to an appropriate wiki page? TimeSlip 20:49@ldci Thank you sooooo much. Merci Beaucoup x 1000! ldci 23:49@TimeSlip You’re welcome. Wednesday 4th August, 2021 gltewalt 00:08https://github.com/red/red/wiki/%5BDOC%5D-Red-System---Using-structures-and-pointers greggirwin 00:22:+1: ldci 01:01@gltewalt Thanks! @TimeSlip : new samples for playing with strings Red [ Title: "Strings" Author: "ldci" ] ;--the way to share global Red words with Red/System code s: "Hello Red" ;--string variable b: #{48656C6C6F20526564} ;--same string as binary ;--Red/System routines getString: routine [return: [string!]][ as red-string! #get 's ] getBinary: routine [return: [binary!]][ as red-binary! #get 'b ] ;--Red code print ["Test String: " getString] append s " is amazing" print ["Test String: " getString] print ["Test Binary: " getBinary] Test String: Hello Red Test String: Hello Red is amazing Test Binary: #{48656C6C6F20526564} 01:03@TimeSlip This also works with blocks and vectors (arrays) Red [ Title: "Arrays" Author: "ldci" ] ;-- Basic Red Code arr1: [1 2 3 4 5 6 7 8 9 10] arr2: [512.0 255.0 127.0 64.0 32.0 16.0 8.0 4.0 2.0 1.0] Print "Red Array" n: length? arr1 i: 1 while [i <= n][ print [i ": " arr1/:i] i: i + 1 ] ;--Now with routines for integer array readIntegerArray: routine [ array [block!] /local i [integer!] int [ red-integer!] value tail [red-value!] ][ print ["size: " block/rs-length? array lf] value: block/rs-head array tail: block/rs-tail array print ["value: " value lf] print ["Tail : " tail lf] i: 1 while [value < tail][ int: as red-integer! value print [i ": " int " " int/value lf] value: value + 1 i: i + 1 ] ] ;--and float array readFArray: routine [ array [block!] /local i [integer!] f [red-float!] value tail [red-value!] ][ print ["size: " block/rs-length? array lf] value: block/rs-head array tail: block/rs-tail array print ["value: " value lf] print ["Tail : " tail lf] i: 1 while [value < tail][ f: as red-float! value print [i ": " f " " f/value lf] value: value + 1 i: i + 1 ] ] print newline print ["Integer array"] readIntegerArray arr1 print newline print ["Float array"] readFArray arr2 Red Array 1 : 1 2 : 2 3 : 3 4 : 4 5 : 5 6 : 6 7 : 7 8 : 8 9 : 9 10 : 10 Integer array size: 10 value: 023EFD20 Tail : 023EFDC0 1: 023EFD20 1 2: 023EFD30 2 3: 023EFD40 3 4: 023EFD50 4 5: 023EFD60 5 6: 023EFD70 6 7: 023EFD80 7 8: 023EFD90 8 9: 023EFDA0 9 10: 023EFDB0 10 Float array size: 10 value: 023EFDD8 Tail : 023EFE78 1: 023EFDD8 512 2: 023EFDE8 255 3: 023EFDF8 127 4: 023EFE08 64 5: 023EFE18 32 6: 023EFE28 16 7: 023EFE38 8 8: 023EFE48 4 9: 023EFE58 2 10: 023EFE68 1 ` 01:07Oups:) 01:43@gltewalt Thanks a lot for updating wiki :) gltewalt:matrix.org 01:44You're welcome, I hope I got that last hilighting correct ldci 01:45@gltewalt Perfect 03:16@gltewalt. Last sample: Red [ Title: "Call" Author: "ldci" ] ;--How to use R/S #call with Red print ["Red Version : " system/version] print ["Compiled : " system/build/config/OS system/build/config/OS-version] print "Random Tests" random/seed now/time/precise ;--generate Random/seed rand: function [n [integer!]][random n] ;--returns an integer ;--first solution with #system #system [ v: 1000 ;--Red/S word to be used with routines #call [rand v] int: as red-integer! stack/arguments print ["System Call : " int/value lf] ] ;--Second solution with Red routine alea: routine [][ #call [rand v] ;--Use Red/S variable int: as red-integer! stack/arguments int/value ] v: 1000 ;--this a Red word, not the Red/S word ;--Classical Red Function print ["Red Function: " rand v] print ["Red Function: " rand v] print ["Red Function: " rand v] ;--Red Routine which calls Red Function print ["Red Routine : " alea] print ["Red Routine : " alea] print ["Red Routine : " alea] 03:17and the result: Red Version : 0.6.4 Compiled : macOS 10.14 Random Tests System Call : 332 Red Function: 824 Red Function: 778 Red Function: 676 Red Routine : 222 Red Routine : 7 Red Routine : 948 gltewalt:matrix.org 03:45New link https://github.com/red/red/wiki/%5BDOC%5D-Red-System:-Fran%C3%A7ois-Jouens-'How-to-use-pointers,-strings,-vectors,-call' bubnenkoff 08:32@rebolek I said half year ago, that your http-tool do not support settings timeouts. If I right remember you said that it's because Red do not have support of (?) timers or smth. Is it possible to change some constants inside Red to change default timeout value? rebolek 08:35@bubnenkoff I guess if you dig deep enough, you may be able to change it, but I don't know the internals that well to be sure. Also, it would be a wasted effort as the current implementation is going to be replaced with new IO anyway. 08:35Better question is for @qtxie if it's possible to set timeout in the new IO. bubnenkoff 09:53That good to hear about new IO, but for now I would be happy to get any hack to increase timeouts greggirwin 16:04@gltewalt:matrix.org your latest wiki link doesn't work for me. 16:06Does [this](https://github.com/red/red/wiki/%5BDOC%5D-Red-System:-Fran%C3%A7ois-Jouens-'How-to-use-pointers,-strings,-vectors,-call') work? 16:08It does. Seems it's something about Gitter's rendering of the direct link. ldci 16:54@gltewalt:matrix.org The link works fine:) gltewalt 18:53> Does [this](https://github.com/red/red/wiki/%5BDOC%5D-Red-System:-Fran%C3%A7ois-Jouens-'How-to-use-pointers,-strings,-vectors,-call') work? Yep. Works. Thursday 5th August, 2021 qtxie 03:23> Better question is for @qtxie if it's possible to set timeout in the new IO. Yes. Setting timeout is supported. bubnenkoff 07:11@qtxie is is possible to recompile Red now and change timeout constant for now? As temporal solution. qtxie 08:15@bubnenkoff No timeout constant in current implementation. You'll need to call the corresponding API in each platform. For example, we use libcurl on Linux. You can call the curl API to set the timeout. https://stackoverflow.com/questions/13835644/default-timeout-of-curl-call-using-libcurl-in-c GalenIvanov 08:45@ldci Thank you for your R/S samples! ldci 08:48@GalenIvanov : Thanks you and more to come! GalenIvanov 08:54:+1: bubnenkoff 10:53> @bubnenkoff No timeout constant in current implementation. You'll need to call the corresponding API in each platform. For example, we use libcurl on Linux. You can call the curl API to set the timeout. > https://stackoverflow.com/questions/13835644/default-timeout-of-curl-call-using-libcurl-in-c Thanks! So what are you using on Windows. Just interesting. hiiamboris 11:00WinAPI abdllhygt 13:53hello 13:55how can i sort items by price? [ [ name: "deneme" price: 0.55 ] [ name: "ne" price: -0.22 ] ] hiiamboris 14:00https://www.red-by-example.org/#sort abdllhygt 14:12thanks! @hiiamboris zwortex 14:50Why compose does not work within a path ? I was expecting that it would, and be consistent with a regular evaluation ! Can it not be so ? toto: object [ a: 1 ] titi: 'a compose [ toto/(titi) ] ; get **toto/(titi)** when expecting **toto/a** toto/(titi) ;= returns 1 as expected gltewalt:matrix.org 14:54Tried compose/deep ? zwortex 14:54tried but maybe made a mistake. Will try again. 14:56No it doesn't seem to work. Unless I made a mistake. gltewalt:matrix.org 15:04It should work, but im away from computer and trying to rely on my memory. Sorry 15:04There is a way unless something has changed recently 15:07Someone will chime in soon zwortex 15:12no urgency - I am just running through some old remarks of mine. cheers. hiiamboris 16:24It never descended into paths. I think by design. greggirwin 16:57@zwortex Red matches Rebol in this regard. It's an interesting idea, but we would need a way to tell it *not* to do that as well. i.e. to exclude paths in blocks. Then also change the spec to allow other block types (paths and hashes). That makes parens an odd man out. gltewalt:matrix.org 16:58I'm miss remembering a trick that makes it work? greggirwin 17:04It gets ugly pretty fast: to path! compose to block! quote toto/(titi) 17:04Off the top of my head. gltewalt:matrix.org 17:16Off the top of my head is how I got into this mess. 😉 ldci 17:22Another sample for communication between Red and Red/System. Red [ Title: "Red variables" Author: "ldci" ] ;--3 Red programming rules: Readability, Reliability and Reusability. ;--the way to access and modify global Red variables i: 100 ;--integer! f: 0.0 ;--float! s: "Hello Red" ;--string! getInt: routine [/local int][ int: as red-integer! #get 'i int/value: int/value + 100 int/value ] getFloat: routine [/local fl][ fl: as red-float! #get 'f fl/value: fl/value + pi fl/value ] ;--Some Red scalars can use boxing to return a Red value getIntBoxing: routine [/local int][ int: as red-integer! #get 'i integer/box int/value + 250 ] getFloatBoxing: routine [/local fl][ fl: as red-float! #get 'f float/box fl/value + pi / 2.0 ] getString: routine [/local st ptr][ st: as red-string! #get 's ptr: " and Red/System" ;--just a c-string! considered as pointer string/concatenate-literal st ptr ;--append ptr values to string as c-string! string/rs-head st ] print ["Red words values: " i f s] print ["Routines can modify Red words values"] print ["Test Integer:" getInt] print ["Test Boxing: " getIntBoxing] print ["Test Float: " getFloat] print ["Test Boxing: " getFloatBoxing] print ["Test String: " getString] 17:23The result: Red words values: 100 0.0 Hello Red Routines can modify Red words values Test Integer: 200 Test Boxing: 350 Test Float: 3.141592653589793 Test Boxing: 1.570796326794897 Test String: Hello Red and Red/System zwortex 17:27@greggirwin, @gltewalt:matrix.org, @hiiamboris - I wouldn't like anybody to get hurt. I understand that path syntax is subject to a lot of debate already. As for compose, it gets tiring as soon as you start feeding it with stuffs not even that complex. This is probably something that would need to be tried out in a mezzanine function anyway... 17:49Quick question. Is there a join function, not the join/rejoin working on series but the join common to other languages that allows concatenating multiple values into a single string with a particular separator, string or character, in between. Maybe a refinement to form, prin, print or something else off the shelf to that purpose ? a: [ "x" "y" "z" "e" ] print [ join a ] ;= "x y z e" print [ join/with a #"-" ] ;- "x-y-z-e" greggirwin 17:57The most common suggestion is adding a /with refinement to rejoin for that. My old approach was a separate delimit function, because it's also useful on blocks. Then you can chain with rejoin. 18:00Compose is certainly nice up to a point. Alternative experiments: - [inject](https://gist.github.com/greggirwin/29836d25de0c68eaba0e6dbd268a20f5) - [reshape](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/reshape.md) 18:02We didn't carry join over from Rebol, but I've toyed with behavior on [join/combine](https://gist.github.com/greggirwin/24c022cb5dde5771531a8939309ccb43) 18:06Here's an experimental [delimit](https://gist.github.com/greggirwin/323ae43a738134fc4300fcc709a83d0b). We haven't decided if forskip is worth including, so there's an experimental version there as well. I understand the reasoning behind forall being native in Red, but liked how they were implemented in R2. Admittedly, forskip is not a *great* name, but some new HOF ideas should fill some of these gaps. pekr 18:08What is the status of for? Was it decided it is not a good fit for the Redbol languages? I do remember some REP in the past, possibly using dialected aproach. Maybe it was even from you, @greggirwin :-) hiiamboris 18:10@zwortex among already implemented solutions, you can use [map-each](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/foreach-design.md#separation): >> a: [ "x" "y" "z" "e" ] == ["x" "y" "z" "e"] >> form a == "x y z e" >> rejoin map-each/eval [x | _] a [[x "-"]] == "x-y-z-e" greggirwin 18:14@pekr that REP is still out there. The better name is loop (and can be interface compatible, delegating to the current loop native when possible), but it also overlaps with some new HOF ideas from @hiiamboris. zwortex 18:47@greggirwin, @hiiamboris - thanks for your answers. Need a bit of time to digest it all. But it makes me think. Is there any guide for those coming from other languages, some old beasts like Perl, wild and untamed, that would map their functions with Red functions, or whatever snippet is more appropriate ? A sort of dictionnary, or these cheat sheets you often find to get quickly up and running with a new language. hiiamboris 18:53There's a Python guide from @galenivanov GalenIvanov 18:53@zwortex There is [Coming to Red from Python](https://github.com/red/red/wiki/Coming-to-Red-from-Python) wiki, and a part of it is [Red functions for Python-programmers](https://github.com/red/red/wiki/Red-functions-for-Python-programmers) 18:53:smile: zwortex 18:55@hiiamboris, @GalenIvanov - python is also an old beast... definitely ! I'll have a look into it. Thanks. GalenIvanov 18:55Another alternative to the great examples given by @greggirwin and @hiiamboris : 18:56 accumulate: function [ "Applies fn cumulatively to acc and each value in series, updating acc" series [series!] fn [any-function!] "A function of two arguments" acc ][ foreach item series [acc: fn acc item] ] >> accumulate next a: [ "x" "y" "z" "e" ] func [a b][rejoin[a "-" b]] first a == "x-y-z-e" gltewalt 19:30> It gets ugly pretty fast: to path! compose to block! quote toto/(titi) or >> to-path compose to-block first [toto/(titi)] == toto/a 19:39 >> form ["x" "y" "z" "e"] == "x y z e" >> replace/all form ["x" "y" "z" "e"] space "-" == "x-y-z-e" toomasv 20:14Also [concat](https://gist.github.com/toomasv/fd651f24e18d7bc85d05204cc5f828d2): >> concat ["x" "y" "z" "e"] #"-" == "x-y-z-e" gltewalt 20:31:cat2: zwortex 20:47@GalenIvanov, @gltewalt, @toomasv thanks for all your suggestions. I buy them all : * @GalenIvanov : accumulator that can be used as well for more general purposes * @gltewalt : straight and turse (unless your original strings contain spaces themselves) * @toomasv : the lost join of my dreams. Friday 6th August, 2021 zwortex 11:31@hiiamboris, I am attempting to test your snippet but do not manage to make it work. I have retrieved map-each.red from your repo, and the web of dependencies that I have come across when loading it : localize-macro.red, assert.red, expect.red, trace-deep.red, error-macro.red, composite.red, catchers.red, with.red, for-each.red, bind-only.red. Now I am getting : >> a: [ "x" "y" "z" "e" ] == ["x" "y" "z" "e"] >> rejoin map-each/eval [x | _] a [[x "-"]] == "x-e-" hiiamboris 11:33new-each.red is the proper include file, you're using an outdated and experimental design zwortex 11:35Beware ! like Newcastle, we might end-up with a primitive called neweach. hiiamboris 11:36:D greggirwin 19:12# neweach☠ 19:12I just with the darn emojis weren't so small. hiiamboris 19:18# ☠ greggirwin 19:20Format trick? hiiamboris 19:20heading ;) 19:20but letters will become big too 19:21right greggirwin 19:21Yowza! 19:21That *really* gets your attention. hiiamboris 19:21:D greggirwin 19:21New rules for syntax highlighting. Sunday 8th August, 2021 zemja 18:03Hi, I'm trying to learn Red, and I can't figure out something with VID. Specifically how to make a re-usable "control". Suppose I want a slider with a label next to it with the value. I might do something like this: view [ text "Value:" sli: slider text react [face/text: form round sli/data] ] All good so far. Suppose I want many of these. I am trying to do this: cool-slider: function [prompt [string!]] [ compose/deep [ panel [ text (prompt) sli: slider text react [face/text: form round sli/data] ] ] ] view compose [ below (cool-slider "First value:") (cool-slider "Second value:") ] Only I end up with: "sli: word is not bound to a context". This makes sense, but I don't how to make something I can re-use, but where the parts interact with each other. What's the right way of doing this? gltewalt:matrix.org 18:05Try func zemja 18:09Thanks, that almost works, only the second slider works (presumably the names sli conflict). greggirwin 18:40Correct. You'll need to generate unique names to refer the faces. 18:43[ren-type-survey.r](https://files.gitter.im/5780ef02c2f0db084a2231b0/Gyk6/ren-type-survey.r) 18:43An old example of a data driven UI generator. 18:44[ren-type-survey.red](https://files.gitter.im/5780ef02c2f0db084a2231b0/pKL7/ren-type-survey.red) 18:44Oops. Grabbed the wrong one. Second one is the Red version. gltewalt 18:56https://github.com/red/red/blob/349f42de59cd21873a72ed6ce49c5316e8eb706a/environment/functions.red Has cool way to generate names 18:59A little more advanced 19:02https://github.com/red/red/blob/349f42de59cd21873a72ed6ce49c5316e8eb706a/environment/functions.red#L138 greggirwin 19:35It wasn't too long ago we had some chat about this. I tinkered up a new version of gensym from that. gen-sym: func [/with 'word /reset /no-count /local count] [ count: [0] count/1: add 1 either reset [0] [count/1] ; Using codepoints here because my editor doesn't like the characters. ; Editing alignment goes wonky for the insertion point. to word! rejoin [ #"^(2989)" ; #"⦉" left binding bracket any [word #"^(1F70)"] ; #"🜀" aether :^) either no-count [][count/1] #"^(298A)" ; #"⦊" right binding bracket ] ] proxy-sym: func [word][gen-sym/with/no-count :word] loop 3 [print gen-sym] loop 3 [print gen-sym/with #"^(FFFC)"] print proxy-sym 'a print proxy-sym 's hiiamboris 19:52what's the point of decorations around? or what is the primary purpose of this func? zemja 19:57Thanks a lot for your help guys. Are you talking to me @hiiamboris? hiiamboris 20:06no, to Gregg :) greggirwin 20:27The original gensym was just this. gensym: func [/with 'word /reset /local count] [ count: [0] count/1: add 1 either reset [0] [count/1] to word! append to string! any [word "g"] count/1 ] which came from Lisp, and is perfectly useful. IIRC, the chat was around the time of playful :skull: and :warning: decorator ideas. I remember searching for symbols, and wondered if the binding symbols would add meaning and distinguish generated symbols further. 20:29Not likely someone would use 🜀 directly, but you never know in today's world. 20:32The purpose of gensym is to generate unique symbols, but it doesn't tell you that without a doc string. :^\ I'll fix that. hiiamboris 20:46I see 20:50unique maybe, but output I'm getting isn't quite great, esp. if those symbols will be molded eventually: ![](https://i.gyazo.com/956a8383cad105598edde79770258113.png) Monday 9th August, 2021 greggirwin 16:25Consider it an idea. In reality, if we generate symbols, they may persist and be seen if we have portable system images ala Smalltalk. But maybe a more general func that works for internal symbols (word! compatible), DB record IDs, etc. is useful. We also want a data generation dialect for test purposes, which adds a lot more depth and control. giesse 18:29@zemja not tested: cool-slider: func [prompt [string!] /local ctx] [ ; normally you'd need a copy/deep here, but compose/deep will do that ctx: context [ sli: none code: [ panel [ text (prompt) sli: slider text react [face/text: form round sli/data] ] ] ] compose/deep ctx/code ] view compose [ below (cool-slider "First value:") (cool-slider "Second value:") ] zemja 20:14Hey, it works! Thank you. Now just to figure out why. (I had to change it to compose/deep copy/deep ctx/code though.) hiiamboris 20:46this example makes me wonder as well... 20:47my PR fails here too for some reason... 21:34@zemja there are at least two fatal mistakes there. >> a: context s: [b: copy [1] p: 'b/1] >> b: context s >> b/b/1: 2 >> mold/flat a == "make object! [b: [1] p: b/1]" >> mold/flat b == "make object! [b: [2] p: b/1]" >> get a/p == 2 >> get b/p == 2 >> a/p =? b/p == true 1. During context creation paths were not copied, so at least one of them is bound to the wrong object 2. Compose/deep also does not copy paths, so react just can't work properly 21:43Why my PR doesn't work however is because we have yet another bug in hashtables... Tuesday 10th August, 2021 hiiamboris 07:44no bug, just forgot to include the patch required for that PR giesse 18:21Ah, I tested compose/deep but didn't test with a path. The double copy kind of hurts. :( GiuseppeChillemi 18:37@hiiamboris > > people will quickly adjust to it > > Yeah, likely. And I'm not objecting against this syntax, it seems non-breaking to me. I just have no need of multiline comments at all. Multiline comments are important to create code regions transparent to the compiler, so they could be used to include other data. hiiamboris 18:38so can be single-line comments GiuseppeChillemi 18:39Yes Hiiamboris but they are not so nice to view. hiiamboris 18:40how so? GiuseppeChillemi 18:40What you mean? hiiamboris 18:40I find them perfectly looking GiuseppeChillemi 18:47Pardon, I have meant something else and written badly. Code regions do not need the programmer to write ";" at each line start, so disturbing the main topic he is working on. Also, extracting and working with the region content is simpler having one single start/end instead of having to stript ";" from each line. start hiiamboris 18:58Sounds as if you're doing it manually (adding/stripping ;). GiuseppeChillemi 19:06Inside UltraEdit I do it manually because I don't like the colorization of the block as comment but as code I would like a lot to write parse [thru ";;;" copy body to ";;;"]. instead of something more complex ;) 19:07Also, the content could be parsed from something other than Red, which could be more complicated than using parse. hiiamboris 19:10parse [thru ";;;" copy body to ";;;"] this rule will fail even to parse itself (body will be " copy body to ") 19:10I also fail to see how manual commenting reflects on colorization.. GiuseppeChillemi 19:15Because UltraEdit changes the color of text when the line is commented and I don't like having comments of the same color of code regions. 19:17> parse [thru ";;;" copy body to ";;;"] this rule will fail even to parse itself (body will be " copy body to ") Yes, you have to escape comment charactes but I am writing too quickly, please pardon me! hiiamboris 19:26> Because UltraEdit changes the color of text when the line is commented and I don't like having comments of the same color of code regions. And when you let UE do the commenting for you, it doesn't change the color? Wednesday 11st August, 2021 GiuseppeChillemi 01:28I have not understood the question 01:31Does anyone know an engine like WordPress I can mostly use headless to upload articles, reply to comments and manage it? I would like to work offiline using Red and then uploading content Friday 13th August, 2021 ldci 09:14Hello. You’ll find here https://github.com/ldci/Red-System some documentation about. Red/System programming. Regards. toomasv 10:29@ldci Great, thanks! 10:29... But, everything before page 12 is blank. May be it's only me? ldci 10:31@toomasv : No problem for me. I’ll send you a private copy:) toomasv 10:34Please do, thanks! PS. On different trials text starts from different places (e.g. 15th or 7th page). After downloading, Acrobat doesn't open it. ldci 10:35@toomasv : Done toomasv 10:36It opens ok, thank you! :+1: ldci 10:36@toomasv You’re welcome . GalenIvanov 11:51@ldci Great work, thanks for sharing! planetsizecpu 13:48Well done @ldci ldci 16:46@planetsizecpu @GalenIvanov @toomasv : Thanks for comments. Saturday 14th August, 2021 zwortex 10:01@ldci, haven't tried yet to dig into red/system, but it's likely to come soon enough. So thank you. 10:15As a gradient of "Red does, or does not" requests", is there an xml parser and a svg to draw dialect converter ? Are these planed to be part of the language, though not yet ? hiiamboris 10:20@rebolek has xml on his gitlab 10:21svg to draw (or the other way around) rings a bell, but can't point you 10:22Tiger demo was definitely converted from svg zwortex 10:51Thanks for @rebolek ref. I've also found an xml parser in Rebol3 by @oldes, though written in Rebol, it should be possible to translate it in Red. As for svg, that would be a nice feature to have indeed, as probably 99.9% of all vectorial drawings are available in that format. ldci 10:51@zwortex Red/System. is really fantastic :) greggirwin 18:09@zwortex we absolutely will have a markup codec, likely more than one (e.g. HTML, XML). The hard part isn't actually the parsing code but the design decisions and other things it ties to. e.g. when you have both nodes and attributes, and there is no clear standard on how to treat them in a tree, how should we deal with them? There are pros and cons no matter what, which makes it a real pain. :^) For what they tie to (and this applies to JSON as well, but it doesn't suffer the attribute problem), a big one is HOFs. People tend to think of HOFs in terms of flat lists, but they can work against structures as well (think DSSSL, CSS, FLWOR, etc.), so we're looking at aspects from both sides. @hiiamboris has done some really amazing work in this area, but instead of making my life easier, it has shaken my world view so I have to reconsider a lot of my old ideas. Another piece these both tie to is formatting. If we can dovetail them all together it will be wonderful. hiiamboris 21:27☻ Sunday 15th August, 2021 q60 17:14how to use refinement args? i want to load/as some file gltewalt 17:28Like this? >> load/as %apple-touch-icon.png 'png == make image! [180x180 #{ 4C69714C69714C69714C69714C69714C69714C69714C69714C... 17:30load/as <file-name> '<type> 17:30help load in the console q60 18:46thanks Oldes 19:18You can use just load without any refinement if you are loading file with known extension. 19:19The /as is useful.. when you are loading raw binary data. q60 20:04is there a way to use escape sequences in Red? Monday 16th August, 2021 gltewalt 01:25ANSI escaping sequences? yep 01:29like resetting screen in the console - print "^[[2J" q60 06:18thanks! 09:04Red has unexpected behavior while using from makefile 09:05 sh ë λ make ~/Drafts/Red/mursa red -o build/mursa -r src/main.red ** Script Error: Invalid compressed data - problem: -3 ** Near: script: decapsulate if none? script build/mursa make: build/mursa: No such file or directory make: *** [Makefile:12: test] Error 127 like this 09:06while not with makefile: ʕ λ red -o build/mursa -r src/main.red ~/Drafts/Red/mursa -=== Red Compiler 0.6.4 ===- Compiling /home/v/Drafts/Red/mursa/src/main.red ... ...compilation time : 795 ms Target: Linux Compiling to native code... 09:16it works if using quotes around paths 09:25take a look at my code https://github.com/q60/mursa let me know how to make it better via fork&pull request, because i am very new to this language and i don't used to use Red'ish/Rebol'ish approach. i would really appreciate any help, thanks in advance hiiamboris 09:36Good job for your 1st script ☺ q60 09:37thanks! that was a bit hard, cuz i'm more into functional/concatenative approach rather than anything else hiiamboris 09:39In Red you'll find that there is no single right way to do anything, but alternatives. Like same word-wrapping could have been done using Parse. Or instead of splitting into words you could have looked for the nearest space before the wrapping margin. Not necessarily better, but it is quite interesting to look at the possibilities. It's like a game ;) 09:41Eventually we'll probably have something out of the box for that ;) q60 09:42i'd like to look at wrapping using parse hiiamboris 09:42Start here: https://www.red-lang.org/2013/11/041-introducing-parse.html GalenIvanov 10:47@q60 Nice first script! 10:47There are some things you don't need: 10:50foreach word (split string #" ") [ -> foreach word split string #" " [ (no parens necessary) return trim/head to-string result -> trim/head to-string result(the last value in a function is implicitly returned) q60 10:53i know about parens, added them for readability, but thanks for the thing about return GalenIvanov 10:56OK, I thought this may be the case :smile: 10:58Are you interested in seeing a small edit of your function? (It's good enough already) q60 11:08sure, as i said, feel free to open pull requests and modify my code GalenIvanov 11:11I'll post it here for now: 11:12 wrap: func [string max-len] [ acc: 0 trim/head form collect [ foreach word (split string #" ") [ either acc >= max-len [ sep: "^/ " offs: 0 ] [ sep: #" " offs: acc ] acc: offs + length? word keep reduce [sep word] ] ] ] q60 11:14 "Those who are blessed with the most talent don't necessarily outperform everyone else. It's the people with follow-through who excel." GalenIvanov 11:15Quite appropriate :smile: q60 11:17there is 3 spaces between words GalenIvanov 11:17Aha, ok 11:19I get simiular result with your code: 11:19 "[94m[1mYour mind will answer most questions if you learn to relax and wait for the answer.[0m" 11:25You can initialize your result to an empty string and avoid the casting to string later: result: copy "" q60 11:26thank you 11:27and what about removing parens around some string "(Thomas Edison)" -> "Thomas Edison"? what's the best way to do this? GalenIvanov 11:28A version that uses pick with a logic! index instead of either expression (but many will find it harder to read): wrap: func [string max-len] [ acc: 0 trim/head to-string collect [ foreach word (split string #" ") [ set [sep offs] reduce pick [["^/" 0]["" acc]] acc >= max-len acc: offs + length? word keep rejoin [sep word] ] ] ] 11:31@q60 Not the best, but possible way: 11:31 trim/all/with "(Thomas Edison)" "()" 11:32provided that there are no more () in the string itself q60 11:39and what is the best way to concat multiple strings if a string can be variable too hiiamboris 11:46rejoin? GalenIvanov 11:46rejoin [str1 "-" str2 "..." str3] q60 12:01mursa 0.1.1 is out :flushed: 12:02umm there's an issue w/ vscode Red extension - the language server doesn't start greggirwin 18:13Welcome @q60, and thanks for sharing your first script. :+1: @qtxie may know what the LSP issue is for VSCode, but when @bitbegin took a new job we lost our VSCode lead. If anyone wants to champion that, we'll sponsor the work. 18:15Is it just me or did Gitter change their font? hiiamboris 18:16Refresh the page? greggirwin 19:13Refreshing didn't help. Either it changed or my eyes got worse while I was offline. If I zoom to 110% the size is more correct, but then the size in the edit window is much larger. I think the font itself is also different, not just the size. q60 19:29isn't newline crossplatform? greggirwin 19:57It's just an alias for lf (linefeed). 20:01Red normalizes to LF. e.g. >> text: "abc^M^/def" == "abc^M^/def" >> write %__abc.txt text >> read %__abc.txt == "abc^/^/def" q60 20:05cuz i've found this in LSP code write-newline: does [ #either config/OS = 'Windows [ write-stdout "^/" ][ write-stdout "^M^/" ] ] greggirwin 20:34That's the downside to being cross platform. Sometimes a platform really cares about something and we have to make data fit its needs. q60 20:35so this workaround is necessary? newline won't expand to ^M^/ while under Windows? greggirwin 20:50Red *should* normalize it on writing. It does for files, so the question (maybe @qtxie can answer) is if stdout has special behavior under the current simple-IO system. >> text: "abc^/^/def" == "abc^/^/def" >> write %__abc.txt text >> read/binary %__abc.txt == #{6162630D0A0D0A646566} >> to string! read/binary %__abc.txt == "abc^M^/^M^/def" >> read %__abc.txt == "abc^/^/def" q60 21:01i did some research. Red LS yields console not support 'input-stdin' from this part of code: unless value? 'input-stdin [ write-log "console not support `input-stdin`" do red-version-error exit ] i have the latest red binary built from master branch of **Red** and it has input-stdin, i also assume, that the server also don't see load-json word. that thing makes me frustrated greggirwin 21:14I hope @qtxie or someone else can chime in on this, as I'm not familiar with the code at all. q60 21:16i really would like to resolve this issue and help with Red at least somehow. i'll continue researching and trying different ways to make LS works tomorrow, because it's a bit late right now, so i am planning to go sleep greggirwin 21:27Thanks! qtxie 23:19@q60 Just tests on Windows, it works fine. > i have the latest red binary built from master branch of Red How did you let the VSCode use your custom build red binary? gltewalt 23:35> cuz i've found this in LSP code > red > write-newline: does [ > #either config/OS = 'Windows [ > write-stdout "^/" > ][ > write-stdout "^M^/" > ] > ] > not sure why don't just use crlf. That covers any differences. 23:36 >> cr == #"^M" >> lf == #"^/" >> newline == #"^/" >> crlf == "^M^/" 23:40> and what about removing parens around some string "(Thomas Edison)" -> "Thomas Edison"? what's the best way to do this? ? trim/with "(Thomas Edison)" "()" Tuesday 17th August, 2021 qtxie 00:52> cuz i've found this in LSP code > red > write-newline: does [ > #either config/OS = 'Windows [ > write-stdout "^/" > ][ > write-stdout "^M^/" > ] > ] > > so this workaround is necessary? newline won't expand to ^M^/ while under Windows? newline (^/) will be converted to ^M^/ when writing to file/stdout under Windows. greggirwin 00:53So that code is there because LSP requires the CR in all cases, and non-windows OS's won't get it otherwise? qtxie 00:54Yes. VSCode expects ^M^/ in all cases. greggirwin 00:55:+1: Thanks @qtxie. There's your answer @q60. gltewalt 01:36> > trim/all/with "(Thomas Edison)" "()" > If each entry is a single line: trim/lines trim/with "(Thomas Edison )" "()" q60 06:26> @q60 Just tests on Windows, it works fine. > > > i have the latest red binary built from master branch of Red > > How did you let the VSCode use your custom build red binary? don't Red extension use Red from $PATH? qtxie 07:02No. IIRC it searches the red console in ~/.Red. q60 07:18ok, i've got Red LSP working 07:18[![image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/g0b9/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/g0b9/image.png) 07:18but i need more research greggirwin 15:16:+1: Wednesday 18th August, 2021 zwortex 17:06In the documentation, path! elements are restricted to word!, get-word! integer! or paren!. Still, and the documentation cautions against it, it is possible to create a path! with other types. For instance, the following creates paths with tag!, issue!, even block! and you can navigate through them. a: to-path <b> type? a ; path! type? a/1 ; tag! a: to-path [<b> <c>] type? a; path! type? a/2 ; tag! a: to-path [#b #c] type? a; path! type? a/1 ; issue! type? a/2 ; issue! a: to-path [[b c] d] type? a ; path! type? a/1 ; block! probe pick a/1 1 ; b Of course if you happen to evaluate such paths, you get into trouble. However, is it alright to work with such paths, as long as you avoid evaluating them directly ? hiiamboris 17:12Yes. Consider it just another block! flavor. zwortex 17:13cheers hiiamboris 17:13And avoid mold until mold/all is done. 17:15This will likely continue to work as well: >> i: make image! 2x2 >> i/1x1 == 255.255.255.0 greggirwin 17:39Paths are tricky beasts. One the one hand, thinking of them as evaluated expressions gives us limits. But we still run into the issue of key types in nested structures. Thinking of them as data, i.e. as blocks but with a hierarchical intent, says they could contain anything. It gets hard to understand them beyond a certain point, or with complex constructs. Just as rambling sentences with indirection elements can be hard to understand in natural language. Even allowing parens has been argued against. I think we will still see path! rules evolve, but keeping the literal forms simple and providing helpers for data and domain specific use are ways to experiment. Friday 20th August, 2021 giesse 18:23There's a question on Reddit: https://www.reddit.com/r/redlang/comments/p85g8t/extra_droplist_data_values/ hiiamboris 18:36Hm. Previously he was educating himself here.. greggirwin 19:09Thanks @giesse. I replied. Tuesday 24th August, 2021 rebred 17:47 size? correctly displays the bytes of a 100MB file but -225209311 when the file is 4GB 4,069,757,985 bytes hiiamboris 17:48This is expected. Red is 32-bits only. rebred 17:50@hiiamboris any workaround ? hiiamboris 17:52Add 2 ** 32 to it rebred 17:55@hiiamboris but at what number should I add this ? up to a point size works correctly greggirwin 17:55Check if it's negative. rebred 17:56@hiiamboris @greggirwin great thanks! 19:12on linux if the file is 5GB size? gives none hiiamboris 19:52you're in a territory where only Red/System can help you 19:53what are you trying to do anyway? rebred 20:52read a dir and display file size of each file hiiamboris 21:09why not use ls (shell command)? Wednesday 25th August, 2021 gltewalt 02:36something simple like foo: func [dir-value /local result][ result: sort read dir-value forall result [ unless dir? first result [ print [first result size? first result] ] ] ] rebred 23:34@gltewalt yes but when the file is bigger then 5GB on linux size? gives none Thursday 26th August, 2021 rebred 00:31i am using the command du in linux to find out the file size and I want to remove the second part of the string that is the file path this works: call/output {du -b 1.png} size: "" print size this doesn't: call/output {du -b 1.png | cut -f -1} data: "" print size giesse 18:39Add /shell 18:39call/shell/output {du -b 1.png | cut -f -1} size: "" 18:40You can also use first split size tab, or use parse etc. 18:42 >> digits: charset [#"0" - #"9"] == make bitset! #{000000000000FFC0} >> parse "1234 other stuff" [copy size some digits] == false >> size == "1234" Friday 27th August, 2021 rebred 03:03@giesse great thank you!!! ldci 13:01Hello Code sample added : https://github.com/ldci/Red-System GalenIvanov 18:30@ldci Thank you! ldci 19:18@GalenIvanov You’re welcome Monday 30th August, 2021 rebred 01:13i am trying to read files without extension some are binary and some are text files bin_file: read/binary random_file txt_file: read random_file how do know what file it is without getting an error ? gltewalt 01:54Wrap read in an attempt block, and then test if it's none or not 01:55 foo: func [val][ either none? attempt [read to file! val]["It's a binary file"]["Not a binary file"] ] gltewalt:matrix.org 01:58That's if you know the files are there rebred 02:00thank you!! @gltewalt gltewalt:matrix.org 02:03You can mute errors by using attempt. It returns none if there's an error rebred 02:04thanks a lot @gltewalt including when trying to read a file that doesn't exist ? gltewalt:matrix.org 02:06I assume so, but you can test that real quick rebred 02:08@gltewalt:matrix.org thank you! 02:08 >> attempt [read %tex2t.txt] == none gltewalt:matrix.org 02:12In a scenario where some files are not there, you won't be able to tell if it's a binary file or if the file doesn't exist. Because attempt returns none for both. Keep that in mind gltewalt 02:18you can use exists? %tex2t.txt rebred 02:49great thanks!! @gltewalt KenSingleton 08:58view [ tl: text-list data [] [print pick face/data face/selected probe face/data] button "Add Data" [append tl/data random "abcdef"]] --- any idea why this gives weird results but this doesn't: view [ tl: text-list data [] [print pick face/data face/selected probe face/data] button "Add Data" [append tl/data form random "abcdef"]] hiiamboris 17:34https://github.com/red/red/wiki/[DOC]-Why-you-have-to-copy-series-values greggirwin 18:25@KenSingleton just as a note, "weird results" is vague. Be as specific as you can when reporting issues, to help us help you. Also, check out the markdown syntax in Gitter for posting code snippets. Tuesday 31st August, 2021 gltewalt 00:42@rebred Glad to point you in a direction that you can use zwortex 11:17Find/match used to return the tail of the match when matched. Not anymore in latest build. I guess the intention is to use tail along with match ? Is that so ? The help has not been updated however. a: "12345" find/match a "12" ; "12345" find/match/tail a "12"; "345" hiiamboris 11:21https://github.com/red/red/commit/183b01a5a9d9e8ade79f9246a0b494609046d83e zwortex 11:28Thanks. Still help should be updated. hiiamboris 11:50Agreed. 11:50Wanna PR it? zwortex 12:12Sure. What is a PR? hiiamboris 12:46Pull request. zwortex 13:13I guess I need to clone the repo. Find where the find function is. Modify the description for /match refinement. Compile and test. Make sure all looks well. Eventually, try and find how to do a pull request, and do it. Is that so ? hiiamboris 13:25Ideally, yes. 13:26But testing is done automatically and it's not like you will affect it by documentation. 13:27If git isn't your thing, there must be some user-friendly clients.. I can't advise here. 13:28I can tell git commands to execute though ;) zwortex 13:29I will skydive into that later. hiiamboris 13:32https://github.com/red/red/edit/master/environment/actions.red there's also web interface FWIW 13:35See also clause 5 of https://github.com/red/red/wiki/%5BDOC%5D-Contributor-Guidelines#general-contribution-guidelines greggirwin 16:03I thought the help had been updated. Good catch. zwortex 22:44I have stumbled in the fog and done this : https://github.com/red/red/pull/4951. Wednesday 1st September, 2021 hitesman:matrix.org 19:59I must have missed something, which is likely since I have a bit of a tendency to try and run before walking, usually tripping, but what is this sorcery? Reading REBOL and copying a quick piece of code ( alert "Hello" ) and it just worked when I hit enter, a GUI window popped up instantly. My laptop isn't fast, its a Surface Pro 2, and Visual Studio will bring this thing to it's knees, worse when I try to compile even a terminal program. The quickest program I have run for a window was in Pelles C and even that took a couple seconds. This didn't. I must know these secrets. 20:00Any recommendation on learning the fundamentals of language development? I'm a bit stunned here. hiiamboris 20:06Red is an interpreted language, it doesn't compile things unless you tell it explicitly. hitesman:matrix.org 20:08Many thanks. This is good hiiamboris 20:16And the goal is to reduce complexity, while the goal of big corps is to increase it as much as possible. That's why VStudio and XCode are monstrosities. greggirwin 20:56@hitesman:matrix.org when you *do* compile, note that there are many options. If you use -c it builds an external runtime so future compiles are fast if you don't change anything there. That way only your first build is slow. If you use -r (release mode) the entire runtime is compiled into the EXE which may take a minute. The readme shows all the options. 21:00"fundamentals of language development" is a big subject. :^) To narrow it down, consider that Red is draws from Lisp, Forth, and Logo as primary influences. A basic Lisp evaluator is fundamentally very simple (Logo is just Lisp in sheep's clothing). Forth uses a threaded interpreter model, which can be very efficient (and also quite simple). Those are good places to start. Red adds a *lot* on top of the basic ideas those start with of course. As you play more, you'll find parse is your friend for building languages/dialects, and you'll learn a lot by doing that. Start simple and have fun. 21:13I should correct the "sheep's clothing" statement. Logo is actually naked Lisp (no parens). hitesman:matrix.org 23:25Wasn't able to get VS Code running, brought up server connection issues, but I was able to get Atom going as a text editor, with it's add-on. Oddly, I ran into a snag trying to get my files to run but I found a weird workaround where I use the Red Console as the program to open the files for the time being. Shooting from the hip a bit, but it's coming along. Saturday 4th September, 2021 gltewalt 20:28The fundamentals of Reds development? I suppose you could read the source code. greggirwin 20:30The code won't tell you about the design though. We don't have an architecture document, which will come when we rewrite the parts we don't reuse in the future. gltewalt 20:32Did carl ever do a paper on rebol design? greggirwin 20:33No. Monday 6th September, 2021 zwortex 11:56I was looking for a type to implement symbolic values. Words are cumbersome as they decay when reduced. I thought of having them pointing to themselves, so as they keep them afloat, even when reduced, but that is not practical if you're not the one that creates such symbols. I found out that issue! was a king of word (all-word!), however they cannot be used as key values in map! or hash!, which is a strange limitation for symbols. So what is currently the best type to use as symbol values ? A sort of word, immutable, that can be a hash key. 12:03I can put an issue! into a hash!, using regular insert, append but not using put. Is it hashed then and is select using the hash path ? 12:08According to https://github.com/red/red/wiki/[DOC]-Comparison-of-aggregate-values-(block!-vector!-object!-hash!-map!) - it can - all-word! => hashable. 12:10I guess issue! is the one then. Sorry for this monologue... 12:11Put should probably accept all hashable types as keys ! RayMPerry 12:15 USAGE: PUT series key value DESCRIPTION: Replaces the value following a key, and returns the new value. PUT is an action! value. ARGUMENTS: series [series! port! map! object!] key [scalar! any-string! any-word! binary!] value [any-type!] REFINEMENTS: /case => Perform a case-sensitive search. RETURNS: [series! port! map! object!] ? 12:16Looks like it already does? zwortex 12:17no any-word! <> all-word! RayMPerry 12:18Oh, wow. I thought it was just a typo. TIL. 12:22Although I would wonder... couldn't you just convert it to a string and use it like that? Is there something you're doing that leverages that additional information an issue! would have vs. just converting it later? 12:22But, I suppose it's a consistency thing. 12:29You could raise an issue about it! zwortex 12:30The initial question was related to the type to use as symbol. Issue! looks being meant for that very purpose : something immutable that may be passed around as reference. If so, it should be usable as a key in a dictionnary or hash table. hiiamboris 12:34Why are words cumbersome? I didn't get your point about their evaluation. Don't evaluate them. 12:35I also agree map should support issues and refinements as keys. 12:36I would like it to support even objects as keys :) Although that pushes their design into gray area. zwortex 12:45For word, if I use it in the evalution part of a compose block, then I need to add to-lit-word, to make sure it keeps being a word. That is what I call cumbersome. If I want a symbolic value, I want an immutable value, that stays so, and that is fast to compare, not an instable value that keeps decaying from one evalution to another. hiiamboris 12:54Why not use strings or tags in the meantime? 12:56Feel free to open a request ticket for all-word! key type btw. 12:58Even more, it's a bug in put: >> m: #() == #() >> m/(#a): 1 == 1 >> m/(#a) == 1 >> m == #( #a 1 ) >> select m #a == 1 >> put m #a 2 *** Script Error: put does not allow issue! for its key argument *** Where: put *** Stack: >> extend m [#b 3] == #( #a 1 #b 3 ) RayMPerry 12:59Is the fix just as easy as s/any-word!/all-word! in wherever put is defined? hiiamboris 13:00probably ☻ RayMPerry 13:00Well, if zwortex won't take it, I will 13:00It will be a good first issue. hiiamboris 13:01:+1: zwortex 13:02@RayMPerry, be my guest ! RayMPerry 13:02Cheers. 13:51And PR made. hiiamboris 13:57Tested the fix locally? 13:59Nvm I see you did 13:59Good job! 14:00One note on commit naming: team uses "FIX: issue #number (title in parens)", so it's best to keep it this way not to break their parsing scripts ;) RayMPerry 14:11Whoops! Fixing. 15:34There it is. Sorry for the wait! greggirwin 18:01Thanks for the PR @RayMPerry. @zwortex issue! can certainly be used as symbols, but for a bit of background, they were strings in Rebol. We have had a *lot* of discussions about this, and there is a *possibility* that they could end up as a hybrid. Sometimes a string, sometimes an word, based on their content. e.g. if they start with a digit, they would be a string, so they could be used for UUIDs, serial numbers, record IDs, etc., without symbol table limitations. There is a huge dark side to this IMO, but the details would be hidden in all but code that leverages them, like you want to. I used them heavily as strings, in R2, so tend to be biased in that direction. Now we do have ref! values though. stmungo 19:34Would someone point me in the direction of the allowed values of <point> in the draw dialect please? hiiamboris 19:37just pair! values stmungo 19:44Thank you @hiiamboris. I should have been precise and asked what are the alowed value of the components of pair datatype. The pair datatype refers to values and gives positive integer examples. I seem to remember a comment about coordinates with decimal places or is this a false memory? hiiamboris 20:00Discussed but never implemented. stmungo 20:02Thank you @hiiamboris hiiamboris 20:03you're welcome greggirwin 20:31The values do not have to be positive though. Negative values are fine in pairs. RayMPerry 21:36Why doesn't split "test" "" return a block of characters? 21:39I find myself wanting something like .comb in Perl/Raku. hiiamboris 21:42Well, technically this can never advance as "" matches everything. And in find a special case is made to return none to (my guess) avoid endless loops. But I guess if there is a use case, a special case for split makes sense. 21:44parse "text" [collect any keep skip] a workaround parse "text" [collect keep pick to end] another one greggirwin 21:451) What is your use case @RayMPerry? Will foreach ch str [...] work for you? 2) The new split func will support something close, in split 1, but you'd still get strings for each element, not chars. RayMPerry 21:46Oh, well that's fine. Yeah, both approaches work. I don't specifically need the chars. 21:47Just thought it would be nice to split series "" and union to check for duplicate characters greggirwin 21:47In addition to @hiiamboris approach, you can do collect [foreach ch "test" [keep ch]]. 21:47unique "test" to filter dupes. ne1uno 21:52this was a problem on day one for me. I found explode somewhere and @rebolek join/with some of the discussions about split have been going on for decades. RayMPerry 21:52> unique "test" to filter dupes. oh, that would do it, haha greggirwin 21:56@ne1uno you can look at split in R3 for the direction Red's new split will take. RayMPerry 22:44I keep being pleasantly surprised by Red and REBOL. It's not as terse as Raku but, by God, they're more than capable of providing some sort of solution. gltewalt 23:08I used to call it explode 23:09 explode: func [ "Explodes a string into a block of separate characters" str [string!] ][ collect [foreach i str [keep i]] ] 23:15Also, since split is a function!, you can do source split to see how it does things right now. Can roll your own split off of that. ne1uno 23:17ty, it was your comment on a request for enhancement for split #2655. the other thing I use another split for is to chunk into same size pieces. seems like elemental things are more difficult than they might be. 23:19the answers are out there if you look. it's a small obstacle some won't ever get over gltewalt 23:26Totally forgot that I did that 23:27 >> extract/into "test" 1 [] == [#"t" #"e" #"s" #"t"] RayMPerry 23:47Oh, wow. 23:48I didn't know both that and the fact that split just parses. 23:48Very interesting. gltewalt 23:48Yep for now, it's parse based 23:49I completely forgot about extract RayMPerry 23:49Wait... 23:49 >> extract/into "test" 1 [] == [#"t" #"e" #"s" #"t"] >> extract "test" 1 == "test" 23:50This seems... strange. 23:50Or perhaps I'm thinking about it wrong? gltewalt 23:59Looks like only if /into is there does it take the series element (char!) and appends it to a new series. 23:59source extract Tuesday 7th September, 2021 RayMPerry 00:00Hmm. gltewalt 00:03Obviously, since I've only just remembered it, I'm not sure of the decisions that went into it. Others will be along to chime in. 02:26How about an explode that works on any-string! values? 02:26https://gist.github.com/gltewalt/6859a53394d6d4dbdb71780b168f70dd greggirwin 03:57[This gist](https://gist.github.com/greggirwin/66d7c6892fc310097cd91ab354189542) has a few failures, but may be an interim solution for those who want it now. Fixes welcome, and I'll start talking about the new one sometime soon. 03:59Extract uses the same series type as the input, if you don't use /into. >> extract "testing" 2 == "tsig" 04:01The new one I'm working on adds some nice features (IMO), but feedback will determine what others think. 04:04Good impetus for me to get back to it. ne1uno 04:28@ne1uno hands @greggirwin Red [] RayMPerry 12:19Hmm. Is Red able to access a script's header? 12:19system/script/header is constantly returning none for me. 12:23UPDATE: [It probably can.](https://github.com/greggirwin/red-hof/blob/e2a646489cf4a911f61f126d77d43721ec26cfbf/code-analysis/foreach/foreach-bulk.red#L199) So, the question becomes, "Why is system/script/header none for me?" hiiamboris 12:25No it can't. Not implemented. 12:26That piece of code was taken from the R2 script library. RayMPerry 12:26Oh. rebolek 12:26If you load your script instead of doing it, you can access the header: script: load %script.red header: script/2 12:27Then you can safely do script. RayMPerry 12:28Nice! Thanks. 12:30I would imagine this is a side effect of being hosted through R2 and will come into play when Red is fully self-hosted? rebolek 12:30No, it’s just because no one has added code for it ;-) 12:31It should be trivial addition. RayMPerry 12:33Oh! I can do it. 12:33Should I make an issue for it? rebolek 12:34Why not? So it can be tracked when you make a PR later ;-) RayMPerry 12:50Hmm. What is the difference between system/standard/header and system/script/header? 12:54Is it standard like "template" or "rubric"? rebolek 13:13Yes, system/standard/header is a template and is meant when you want to create a script programmatically. system/script/header should hold the header of the actual script. RayMPerry 13:17Okay. And I'm noticing parent and path in the header. Should I be traversing through files and adding the parent and path? On that same note, should system/script/header contain the header of the script that was originally called? Or the header of the currently-visited script? hiiamboris 13:27> On that same note, should system/script/header contain the header of the script that was originally called? Or the header of the currently-visited script? Great question. We usually want to access header of the called script (the app) rather than utility files it may include (and share with other apps). However, there's value of header *during* script loading phase (#include, do), and after it's loaded and accessed from other functions. IDK what R2 did, but I think if code is evaluated during load phase we may let it access the header of the file that code is read from. But after it's loaded, header may return to that of the calling script. This then will also work if we do a file from console itself. During do the header is changed, and then reverted after it returns. 13:28Example: Red [title: "utility function"] print ["including" system/script/header/title] ;) shows "utility function" show-title: does [alert system/script/header/title] ;) shows title of the program that calls it 13:29We don't have module design yet, but this should be considered in modules context ultimately. rebolek 14:48So there probably should be a stack of headers. It’s not going to be that trivial :-) greggirwin 17:01Great topic. When I saw the ticket, my first thought was "This needs some design work." We don't have modules yet, but will, so have to plan for that. Maybe we start with breaking from R2's singleton model and consider naming. e.g. do we want script as the primary term for accessing headers, and if we're building a structure of them, do we just call it system/headers? Or do we still want an intervening word for clarity, to distinguish it from the Red system itself, like system/app/headers. 17:05A topic I've mentioned to a couple people is configs, which may pull values from a number of places, applied and merged from a hierarchy of locations. I started calling them "hierarchcial environments", and that may be considered here in a couple conceptual ways. Include may pull from different locations, which works for files today, but will apply to modules and packages in the future. When all is said and done, you don't have a tree of files, but their content merged. We may want that for headers as well, but certainly not for everything. e.g. you want a single name and version for the app, which is not overridden. 17:10We also want to look at it from the tooling side. One of the ideas I've talked about is that modules can be combined into packages, which may compose them under a unified interface it exposes, or for maintenance purposes. The main reasons may be trust and creating sub-system assemblies. People can be compensated for this work, which may turn out to be a very valuable organizational layer. rebolek 17:21> you don't have a tree of files, but their content merged true, but you probably still want to know where you merged that content from to avoid situations like the infamous NPM’s left-pad fiasco. greggirwin 17:28Yes, what I meant was that we'll probably want both...somehow. planetsizecpu 18:31"Hierarchical environments" sounds to me like contexts 😄 greggirwin 18:48The important aspect is how they are combined, and defining an interface that makes it clear and consistent. They can be objects, blocks, or maps, doesn't matter. 19:00It also ties to more formal vetting of specs/schemas. Wednesday 8th September, 2021 JLCyclo 14:51Hello everybody, I try to decompress/deflate zlib data. I use decompress with the refinement deflate, but it crashes. Is there a sample to use decompress ? hiiamboris 16:49red version? data size? greggirwin 17:47Also knowing if another reader can decompress it, and how it was created can help. Then, if it turns out to be a bug on our side, maybe you can create test data for us with the encoder in question. zentrog:matrix.org 19:07If it's really a crash, that is definitely some sort of bug, even if it's a broken package greggirwin 19:36Yes. JLCyclo 21:04@hiiamboris red version Red 0.6.4, data size to decompress is 326 bytes, decompressed data size would be 338 bytes. hiiamboris 21:060.6.4 tells me nothing, type about in the console please JLCyclo 21:07Red 0.6.4 for Linux built 22-Nov-2018/2:40:38+02:00 commit #755eb94 21:09help decompress informs that refinement deflate needs a size as a parameter. I do not understand this parameter hiiamboris 21:10so you probably noticed the date yourself 21:10time to update ;) JLCyclo 21:23I try again with 'Red 0.6.4 for Linux built 8-Sep-2021/19:08:56+02:00 commit #90a1982', there is a error message when I call decompress '''>> decompress/deflate b1 0 *** Script Error: data not in correct format: none *** Where: decompress *** Stack: >> decompress/zlib b1 0 *** Script Error: data not in correct format: none *** Where: decompress *** Stack: ''' hiiamboris 21:35perhaps your data is not in the correct format then? 21:36I think there are zlib bindings somewhere 21:38https://github.com/ldci/redCV/tree/master/libs/ZLib JLCyclo 21:40my data are in the correct format for the linux command zlib-flate -uncompress but the Red command decompress generates an error greggirwin 21:44Can other tools read it? Standards are wonderful, but sometimes producers still break rules here and there, which trip up certain consumers. This format should be very clearly spec'd, and deflate/uncompress is all in R/S, so we should be able to debug it. Another test would be to take the same input data, compress it with Red, and see if the binary output matches the one from zlib-flate. hiiamboris 21:46compressed output doesn't have to match I think, due to dictionary choice algorithms greggirwin 21:51...as we all look for the deflate algo rules. 21:53Could try larger content from zlib-flate, as a quick test, to make sure it's not a short-data exception (static Huffman). 22:11@bitbegin wrote %deflate.reds. Since he's on to new adventures, @qtxie may be the next best one to look at it. JLCyclo 22:13The Red command compress/zlib/deflate generates compressed data and the linux command zlib-flate -uncompress succeeds to decompressed these generated data. The Red generated compressed data are not exactly the same data that I try to decompress with Red (Red compressed data size is 333 bytes and others are 326 bytes, about the first 12*16 bytes are the same except the 2nd byte...) The Red command decompress/zlib/deflate succeeds to decompress the generated compressed data greggirwin 22:16Thanks for checking that. Can you post the actual data for us to test with? JLCyclo 22:24Red succeeds to decompress 333 bytes (the 1rst two bytes are 0x78 01) but generates a format error to decompress 326 bytes (the 1rst two bytes are 0x78 0xDA); the 2 compressed data correspond to the same decompressed data. greggirwin 22:28The actual data will help most. I'd have to dig in more to see what bits mean, to know if, for example, STATE-STORED in the decoder is seeing an incorrect length, and if that aligns with static Huffman use. Only able to guess at a glance, since the code lacks comments. :^\ JLCyclo 22:29how to post data (326 bytes for error and 333 bytes for no error) ? 22:32the 326 bytes (error generation) : 000000 78 da bb d4 e2 bb 88 51 8d c5 a3 fa d9 d1 72 1d >x......Q......r.< 000010 23 55 c6 05 11 3f 97 30 26 b9 05 b1 49 25 ea ac >#U...?.0&...I%..< 000020 d5 64 91 4a 49 59 b6 d2 92 91 79 21 e3 92 e4 b2 >.d.JIY....y!....< 000030 d4 a2 54 43 3d 63 3d 83 e4 bc c4 dc 25 49 69 79 >..TC=c=.....%Iiy< 000040 e9 be ae 91 41 9e 8e 3e c9 69 79 25 30 76 52 7a >....A..>.iy%0vRz< 000050 5e 96 97 ab a3 9f 82 8f 7f a8 67 70 72 7a 5e 09 >^.........gprz^.< 000060 98 6b 03 e1 a6 e4 27 65 19 5a 9a 19 eb 1a 58 e8 >.k....'e.Z....X.< 000070 1a 59 26 96 34 ae 4c 2a 49 cf b4 30 31 30 35 b6 >.Y&.4.L*I..0105.< 000080 34 30 30 4b 2a 29 c9 f2 09 30 32 34 37 b4 b4 d0 >400K*)...0247...< 000090 35 4e ca 4d 4c 75 0c 0d 09 72 4d 2a 4e ae 90 34 >5N.MLu...rM*N..4< 0000a0 32 30 32 04 69 33 36 08 31 34 b4 32 35 b7 32 30 >202.i36.14.25.20< 0000b0 d0 36 30 02 92 49 25 45 99 46 66 06 26 86 a6 06 >.60..I%E.Ff.&...< 0000c0 20 4e 72 9a 5b 90 a3 9f b3 6b 52 72 3e d0 1b 49 > Nr.[....kRr>..I< 0000d0 99 c5 29 8e 01 1e 01 49 c9 99 15 0a a1 41 7e 56 >..)....I.....A~V< 0000e0 a1 61 ce 9e 56 06 86 56 6e 41 56 1e 46 16 e6 96 >.a..V..VnAV.F...< 0000f0 51 1e 9e 46 7e ae e6 8e 01 5e ca 01 11 0e e7 dc >Q..F~....^......< 000100 63 db 4f 4e f9 ff 26 e8 40 79 ed 84 f8 65 21 ff >c.ON..&.@y...e!.< 000110 3e c8 db 16 f9 5f be d5 f3 33 d5 a5 91 63 79 e7 >>...._...3...cy.< 000120 6a e9 03 8c 2a b2 e7 18 cd 4e dd b8 77 f3 e2 f6 >j...*....N..w...< 000130 49 81 11 37 e6 1b 4b c9 ec be 51 63 13 e4 b5 85 >I..7..K...Qc....< 000140 71 09 5b b3 73 c9 >q.[.s.< 000146 greggirwin 23:06You should be able to drag and drop it as a file in chat here. Thursday 9th September, 2021 ne1uno 03:26@greggirwin, the last character gets clipped in a few of the split tests in that gist. works in a red console from early 2017 03:28@toomasv has a split with options in his solver. JLCyclo 08:14[tmp.bin](https://files.gitter.im/5780ef02c2f0db084a2231b0/okRY/tmp.bin) 08:14The 326 bytes file tmp.bin that generates an error for decompress/zlib/deflate ldci 08:29@JLCyclo, FYI redCV uses both Bruno Anselme’s zlib binding and red tools for compressing and uncompressing. Images without problem. hiiamboris 09:47 >> length? decompress/zlib b: read/binary %tmp.bin 0 == 334 Oldes 09:47/zlib and /deflate are incompatible refines. Or at least it should be. hiiamboris 09:47Somehow I get 334 not 333 bytes 09:49Also tested on Ubuntu. Can't reproduce the issue. 09:50Red 0.6.4 for Windows built 2-Sep-2021/15:40:47+03:00 commit #579b9d3 Red 0.6.4 for Linux built 11-May-2021/6:20:25+03:00 commit #81d0416 RayMPerry 14:36QQ: What is an actor and where can I play around with them? 14:37Bonus round: Why is money! unwieldy to work with? I imagine it's being exposed from R2 but I'm having trouble getting it to USD$ like R2. hiiamboris 14:39 >> USD$0 + 12.34 == USD$12.34 RayMPerry 14:39Wha...? 14:39Lemme check again. hiiamboris 14:40No actors in Red (yet). 14:41But you may mean View actors. Those are simply event handlers. on-click etc RayMPerry 14:41Ah, I see what I was confused on. USD$10'000.00 Shouldn't this be USD$10,000.00? 14:42> But you may mean View actors. Those are simply event handlers. on-click etc Ah, I didn't know View actors weren't "real" actors. hiiamboris 14:43No, what you propose is localized format. Red uses a more common and unambiguous number formatting. Comma and dot are usually interchangeable. RayMPerry 14:43Okay, that makes sense. hiiamboris 14:44For talking to outside world, we have [formatting](https://github.com/greggirwin/red-formatting/) initiative. RayMPerry 16:46 >> file-port: open %scraper.red *** Script Error: open does not allow file! for its port argument *** Where: open *** Stack: >> ? open USAGE: OPEN port DESCRIPTION: Opens a port; makes a new port from a specification if necessary. OPEN is an action! value. ARGUMENTS: port [port! file! url! block!] REFINEMENTS: /new => Create new file - if it exists, deletes it. /read => Open for read access. /write => Open for write access. /seek => Optimize for random access. /allow => Specificies right access attributes. access [block!] 16:46What am I missing here? 16:47Or, wait... this is a port. I recall seeing something about this on the roadmap. Is this still in development? 16:50(Side note: cool typo on the spec.) hiiamboris 16:52yeah RayMPerry 16:53Drat 20:19I was thinking about doing something akin to sequences 20:20Raku has an operator ... which is used to return a lazy sequence of whatever given 20:20So, in this case, the Fibonacci sequence is: 0, 1, * + * ... * 20:21At this point, you can store that and do: say $fibonacci[^10] to get the first 10 numbers in the sequence 20:23In Red, I imagine this to be something like: sequence [1 1] <function!> ; function has to match arity And this would ideally return a port! or some sort of stream structure 20:24Is this something that would be interesting to people? JLCyclo 21:16@hiiamboris The result of linux command zlib-flate -uncompress gives 338 bytes length 21:29[Red-lang](https://www.red-lang.org/p/download.html) has only a stable Red binary (0.6.4 from 2018) and an automated build from yesterday. Are there other version-date Red binaries anywhere ? RayMPerry 21:32I would imagine you'd just build from source if you need some other version 21:32It's not terribly hard if even I can do it :P greggirwin 22:04@rebolek kept some up for a while, but had server issues so they may not be available right now. I think someone else picked up the torch, maybe @loziniak? The main question is what you want them for, as many of us will have local builds. Friday 10th September, 2021 GalenIvanov 07:24@RayMPerry Yes, I'm interested in this. Btw I've never felt like learning Perl, but after seeing a lot of elegant Raku solutions of problems in StackExchanges' Code Golf and Coding challenges, I started to like Raku. zwortex 11:07I have a function that generates functions using compose. Why (1) or (2) do not work and I need to use (3). Is there a terser syntax I might use that do not require using a word setting ? f: function [x] [ function [ y ] compose/deep [ print [ (x) y ] ] ] f "Hello" "you" ; (1) this does not work ( f "Hello" ) "you" ; (2) this neither h: f "Hello" h "you" ; (3) this does rebolek 11:15(3) works? It doesn’t return error context for x is not available? zwortex 11:17I use compose 11:17it's not a lambda hiiamboris 11:39This is by design, to limit interpreter's complexity and forbid variable-arity calls. zwortex 11:58As for (1) I get your point. But (2) ? hiiamboris 12:20Same point. 12:23https://github.com/red/red/issues/3553#issuecomment-429476014 12:27I understand you want to bend Red here ;) But there is a cost. Function vs operator precedence is already complex enough that a lot of debate was around it. If you want a deeper view: https://github.com/red/red/issues/941 12:30TL;DR: you can define new functions and operators during evaluation, and the more dynamism we allow in the interpreter, the more we rely on implementation details. Think of a b c d e expression, where any of a,b,c,d,e may be function calls that define some of these words to functions or operators. Then add arg/lit-arg/get-arg syntax on top of that, both for operators and for functions and you'll look into an abyss. 12:34Also related: https://github.com/red/red/issues/3179 zwortex 15:20Thanks for the various links. Looks being a big subject. Still I am not convinced. Parens should be enough to warn the evaluation that this is not a dead meat but an active value that should be accounted for right away in the evaluation : if you have a function or object, it should be treated immediately as such. The evaluator makes a lot of effort to account for infix operators (though they might be dropped altogether compared to that). greggirwin 15:33@zwortex, what is the real world use case where you want to inline generated func calls? And is it for compactness, generality, or purposes of reasoning? 15:35@RayMPerry @GalenIvanov, @toomasv and I have both played with emulating closures for laziness. Doing it with a port would also be an interesting experiment. toomasv 15:40@zwortex >> do reduce [f "Hello" "you"] Hello you 15:51 >> reduce reduce reduce [:f "Hello" "you"] Hello you == [unset] zwortex 15:53@greggirwin, in that particular case, I am evaluating a string request into primitives that are generated themselves based on the string request. But you might just consider a case where you have a dictionnary of functions that you want to apply on a value : (dict/key) value. The syntax using an intermediate word (or the one with do reduce) works of course, but that is not as neat to be forced into using a word to put back a returned value into the game. 15:59@toomasv, thanks for these two other options 16:03the evaluator is like a dumb fellow that does eval ; throw away - eval ; throw away, without noticing that it gets sometimes fruits that still have juice into them. 16:05the same goes with all returned values by functions - they are dead, whereas in object oriented languages they are alive. toomasv 16:57Toy apply: apply: func [fn [any-function!] data [any-type!]][either block? data [do head insert data :fn][fn data]] apply f "Hello" "you" ;Hello you apply :append ["Hello " "you"] ;== "Hello you" Still playing: o: reactor [f: func [x][func [y] compose/deep [print [(x) y]]] a: "Hello" d: is [f a]] o/d "you" ;Hello you o/a: "Hey" o/d "you" ;Hey you hiiamboris 17:21> the evaluator is like a dumb fellow that does eval ; throw away - eval ; throw away, without noticing that it gets sometimes fruits that still have juice into them. If that wasn't the case, f: does [:f] f would deadlock. 17:22And you would have no option not to evaluate the returned values. zwortex 17:24Like I said : a dumb fellow that is not recognizing when it has entered an infinite loop. 17:48@toomasv thanks for those suggestions. giesse 18:33@zwortex how would then one return a function without it being evaluated? for example, how would the function function possibly work? zwortex 19:15I don't know how settings are handled (i.e. hidden litteral arguments ?). But I was not even considering this with option 2, using parenthesis. Let's say you have a function A that returns a function B. A returns :B that is not evaluated - no problem for your case. But (A) returns :B that is evaluated immediately. greggirwin 19:34A key aspect of Red is knowing when things are evaluated, and controlling it as necessary. The catch phrase we use is "everything is data until it's evaluated." @hiiamboris and @giesse both point out other issues, which we face in different features when designing them: how do you *not* do something if it's done by default. e.g. copy is easy to apply, but hard to work around if Red applied it automatically. zwortex 20:04I was not debatting that. I don't think so anyway. greggirwin 20:17It sounds like you want it to do the other thing. Or I'm misunderstanding you. zwortex 20:21I was not : as I was arguing that parenthesis could be used to distinguish those two situations. 20:52Different subject. I find out that function makes a deep copy of the body block. Is there a way to have a shallow copy only ? greggirwin 20:57You can use make function! directly. hiiamboris 20:59That doesn't seem to work. But anyway, it's a bad idea to use a shallow copy, as that will make all paths invalid after you create function one more time from the same body block. zwortex 21:05It is not for reuse but to embed a value in it : a series that I cannot test for sameness as it is being copied when the function is built. 21:06I guess the only other option then is to have floating objects with functions that rely on its contexts. 21:09or I can change the body afterwards ! 21:14 a: [ [1] ] b: func [ value ][ same? here value ] c: body-of :b probe :b c/2: a/1 probe :b b a/1 21:14ok it works - cheers hiiamboris 21:16b: context [ here: [1] return func [value] [same? here value] ] 21:17or yes, change it post-construction, make your own function constructor zwortex 21:21yes Saturday 11st September, 2021 giesse 18:50> I was not : as I was arguing that parenthesis could be used to distinguish those two situations. that's what every other language does. Carl decided that he did not want any function evaluation *syntax*. IMHO I'd rather use apply in your case (sadly, we don't have it in Red yet). I honestly find it hard to imagine real use cases where it's important. Sunday 12nd September, 2021 zwortex 11:38@giesse, this is an interesting matter, I need to reflect on. RayMPerry 15:38Just tried out Red/System again. I think a big pain point that I couldn't articulate before was Red/System *looks* like Red but it's its own dialect. Obviously, this is by design but I was hoping a few idioms from Red had crossed over so it was easier to do things in. For example, literal blocks aren't really blocks; they're arrays (which makes sense) so I can't traverse over them like I would in Red. Yes, different structure, but it would be nice if friction like this was a bit less, if possible 15:42Unsure if that makes the most sense but I've been looking for a language that successfully does that "script/prototype with high-level constructs" and "tune performance with low-level constructs when needed" without having to treat it like a new language. 15:42Red and D are neck-and-neck, I've found 15:55"can't traverse over them with FOREACH/FORALL" * hiiamboris 16:26R/S is a C-level language with all consequences. 16:27Also, it's minimalistic until Red becomes self-hosted. 16:28D is much higher level than R/S. RayMPerry 16:28> Also, it's minimalistic until Red becomes self-hosted. Oh? That's interesting. I didn't know its minimalism was a side-effect of not being self-hosted. hiiamboris 16:29Yes, throwaway R2 implementation of the compiler is one of the factors limiting R/S design. 16:33> Foreach https://static.red-lang.org/red-system-specs.html#section-19.4 16:34As in every big project, non-critical features get stuck in a TODO list ;) greggirwin 17:41One of my hopes is that as the community grows, we'll see more experiments with dialects at different levels. There will still be a core R/S, but finding the features that add the most value, and exploring newer ideas (like the borrow checker in Rust), along with focusing on tooling to analyze code so we have data to learn from, should be easier in Red than in almost any other language. Monday 13th September, 2021 ldci 08:32@RayMPerry Some samples here: https://github.com/ldci/Red-System bferris413 15:43Is there a way to spawn and monitor processes? 15:44From Red, not R/S hiiamboris 16:02Currently only using call, forwarding output to a file and monitoring that file. bferris413 16:11Ok, thanks bubnenkoff 17:47Hi all! Is there any news about next red version? hiiamboris 17:54Hi. Use automatic builds. bubnenkoff 18:00I thought that it would be big merge with ports support or they are still WIP? pekr 18:06Noone knows. Judging by a public activity, ports did not get any love for 1-2 months. But audio support appeared recently :-) 18:08Maybe while waiting for the ports, we can play some music to get some amusement :-) As for me though, I always loved any multimedia ideas in Redbol langs. And if I am not mistaken, R3 e.g. did not provide sound port at all. bubnenkoff 18:37@rebolek cold you please check you http-tool with latest version of Red. After migration to latest build my app stopped working (begin return weird code). I checked it and red console and got: >> send-request/data to-url "http://10.201.1.35:5001/" 'POST [] *** Script Error: value out of range: 1 *** Where: set-path *** Stack: send-request 18:42this code is worked fine on build from ~may/june JLCyclo 19:11About decompress/zlib/deflate: I made a mistake; Red 0.6.4 for Linux built 22-Nov-2018/2:40:38+02:00 commit #755eb94 does not generate an error to decompress the 2 files (333 bytes and 326 bytes)... but it generates 4 extra bytes compared with the linux command zlib-flate -uncompress. PS decompress/zlib and decompress/zlib/deflate output the same result. greggirwin 19:33@qtxie :point_up: hiiamboris 20:32Well it's 3 years old. Forget about it greggirwin 20:41Ah, sorry, I misread and thought he meant the automated build did that. Tuesday 14th September, 2021 Oldes 08:09@JLCyclo decompress/zlib/deflate should not be allowed, there is only decompress/zlib OR decompress/deflate! 08:12When you use decompress/zlib/deflate, the zlib is used. https://github.com/red/red/blob/9aea165d97bdbf4c3c368a1a5c34fdc40272a133/runtime/natives.reds#L2723-L2739 JLCyclo 12:06@Oldes decompress/deflate generates an error Error: data not in correct format >> decompress/zlib/deflate bin 0 0 == #{ D2844DA2012604487BE6C5772C322501A058F9A401624652061A612CAD29041... >> decompress/zlib bin 0 == #{ D2844DA2012604487BE6C5772C322501A058F9A401624652061A612CAD29041... >> decompress/deflate bin 0 *** Script Error: data not in correct format: none *** Where: decompress *** Stack: >> decompress/_deflate bin 0 *** Script Error: decompress has no refinement called _deflate *** Where: decompress *** Stack: >> Oldes 12:07Because data are in zlib format, not deflate. 12:10What I wanted to say is, that decompress is able to use only one compression method from zlib, deflate and gzip. It should throw an error if multiple refinements is used, because it is confusing, that it silently chooses one of them. hitesman:matrix.org 16:17May well be a dumb question, but in regards to Red rendering graphics, I would assume this is being done via software rendering? 16:18Same as REBOL, to add with this. 16:22Not to be round about in my question, what I am curious about is that with learning REBOL and , overall, Red, what my goal is that I want to implement my own software renderer as an extension of the language, to include 3D functionality. To be able to achieve this, optimizing the code was usually achieved via ASM, but into C programs. Red/System may well allow for this level of optimization? hiiamboris 16:25For graphics Red uses Direct2D backend on Windows, GTK on Linux, Cocoa on Mac. 16:27R/S allows you insert binary opcodes directly into the program, so no problem with optimizations, although of course it's not as portable as just writing asm instructions. hitesman:matrix.org 16:27Ah, interesting. Thank you for this info. greggirwin 16:40>> [decompress] It should throw an error if multiple refinements is used, because it is confusing, that it silently chooses one of them. Agreed. Please open a ticket for this. rebred 18:09 >> a: "575^/" == "575^/" >> at tail a -2 == "5^/" shoudn't Red remove the chars ^/ ? greggirwin 18:11^/ is the newline character. 18:11^ is the escape character in Red. Use help char! to see all the standard char values Red includes by default. rebred 18:15@greggirwin >> a: "^/^/575^/^/^/^/" == {^/^/575^/^/^/^/} how do I remove the last two newline greggirwin 18:51There are many ways. Here's one: >> a: "^/^/575^/^/^/^/" == {^/^/575^/^/^/^/} >> take/last/part a 2 == "^/^/" >> a == {^/^/575^/^/} 18:55Another way: chop: func [ "Removes the last value in a series; returns series head." series [series!] "(modified)" /part "Specify the number of values to remove." length [integer!] ][ head remove skip tail series negate absolute any [length 1] ] >> a: "^/^/575^/^/^/^/" == {^/^/575^/^/^/^/} >> chop/part a 2 == {^/^/575^/^/^/} 18:56That's a really long expression to untangle, but it's good practice. :^) rebred 19:28@greggirwin thanks a lot! Wednesday 15th September, 2021 bubnenkoff 10:11Has the behavior of do changed in last few month? is the past I was able to do do %file.red but now getting error: Access Error: cannot open and need to do do load %file.red hiiamboris 10:22That's rather weird. Can we reproduce the issue? bubnenkoff 10:30Hm... this error only with file loaded from internet: >> change-dir %/D/test == %/D/test/ >> >> do %test.red Hello World >> >> do %client-tools.red *** Access Error: cannot open: %common-tools.red *** Where: read *** Stack: do-file but: >> >> do load %client-tools.red == make object! [ value: none result: none content-type: none multipart: none boundary: none url... >> 10:32Problem with this file https://gitlab.com/rebolek/castr/-/blob/master/client-tools.red 10:33I tried copy-past it's content to another file and got Access Error 10:33Oh my bad, It's trying to access to %common-tools.red inside hiiamboris 10:36do file descends into the directory of that file, but do load file does not. So it may not find the other included file. 10:36I'll let @rebolek handle this ;) Oldes 11:17@hitesman:matrix.org if you are interested in software renderers, I recomend you to check https://blend2d.com/ if you don't know it yet. rebolek 11:23I’ll probably make some distro version that will be just one file. Monday 20th September, 2021 GiuseppeChillemi 20:55Do you have a script to extract the list all the functions of a file without loading it but just reading it? Also it would be good to have a way to read each function specs. greggirwin 21:22If you want to deal with types, and you know it's Red data already, loading it is the way to go. GiuseppeChillemi 21:45I just want to lidt 21:45I just want to list all the functions in a file 21:46But without loading it greggirwin 21:46You can easily write a parser for the standard forms set-word! ['func | function | ...], but why don't you want to load it? GiuseppeChillemi 21:50Because I want to read Rebol files too, and they are not fully compatible with Red Load I suppose. greggirwin 21:52The parse is the way to go. GiuseppeChillemi 22:00Greeg, this time I am lazy. Is there something good to start from? I have made a little scripts browser and I would like to add a text list with functions with very low coding O:-) hiiamboris 22:21Why should Red not be able to load Rebol scripts? GiuseppeChillemi 22:29If Red elements are a superset of Rebol ones it won't be a problem. greggirwin 22:39The basic idea. alpha-num: charset [#"A" - #"Z" #"a" - #"z" #"0" - #"9" ] other-ch: charset "-_?." word-ch: union alpha-num other-ch ws: charset " ^-^/" ws*: [any [ws]] =set-word: none =word: none set-word=: [some word-ch #":"] word=: [some word-ch] fn-word: ["function" | "func" | "does" | "has"] abc: func [][] def: function [][] ghi: does [] set 'jkl has [][] get-funcs: function [input [string!]][ parse input [ collect [ some [ s: set-word= e: ws* fn-word keep (copy/part s e) | "set '" ws* s: word= e: ws* fn-word keep (copy/part s e) | skip ] ] ] ] Run it against its own source to test. hiiamboris 22:42funct also 22:44Text parsing will be very tricky to get right. Because of string formats (you want to ignore "func" in strings), of global vs local definitions, etc. 22:44I would parse loaded stuff instead. ne1uno 22:44comments too hiiamboris 22:45Yeah. Seems simple, but go figure if ; is inside string or it's a comment. greggirwin 22:46And UTF, etc. It's not easy if you want it to be complete. Tuesday 21st September, 2021 greggirwin 05:24And if you only base it on text, unless you do a *lot* more work, you'll miss aliases. GiuseppeChillemi 08:17Thanks Gregg, I will try it and also the Load Approach. Wednesday 22nd September, 2021 abdllhygt 17:52hi 17:53i have a problem with field 17:53after i changed text of field, writing line is coming to start 17:54before i change: some text| after i change: |new text 17:54i want: new text| hiiamboris 19:04well, that's a known issue: https://github.com/red/REP/issues/5 abdllhygt 19:14@hiiamboris thank you! 19:14i fixed 19:29can you give me an example change in parse? 19:30i want to know its structure hiiamboris 19:33https://w.red-lang.org/en/parse/#change abdllhygt 19:44thank you @hiiamboris GiuseppeChillemi 20:18However, it would be nice to have a way to load a script maintaining comments, so I can pick them as they are a normal Red element. In this way, I can get them and parse their content for extrapolating documentation. abdllhygt 20:26i didn't find the way how to do this: input: shao3 i want: shâo hiiamboris 20:40what have you tried? abdllhygt 20:42an example deneme: ask ">>" parse deneme [ "sh" change c: ["a" b: ["o" | "oq"]] (rejoin ["â" c/b]) ] print deneme 20:42i guess i didn't understand change's logic 20:45this is what i want to do: deneme: ask ">>" parse deneme [ "sh" change *"a" ["o" | "oq"] "2" *"â" ] print deneme 20:46changing first * to second * 20:48or this: 20:48 deneme: ask ">>" parse deneme [ "sh" w: "a" ["o" | "oq"] "2" (w: "â") ] print deneme Oldes 21:04@abdllhygt first of all, you don't understand, what c: and b: in parse dialect means! 21:05 red >> parse x: "shao" ["sh" change [#"a" set b [#"o" | "oq"]] (rejoin [#"â" b])] x == "shâo" >> parse x: "shaoq" ["sh" change [#"a" set b [#"o" | "oq"]] (rejoin [#"â" b])] x == "shâoq" abdllhygt 21:07i understood what they mean, i wrote like this for you understand what i mean 21:07@Oldes thank you Oldes 21:10 >> parse x: "shao" ["sh" pos: "a" ["o" | "oq"] (? pos pos/1: #"â")] x POS is a string of value: "ao" == "shâo" abdllhygt 21:12wait, why pos includes "a" ["o" | "oq"] instead of just "a"? Oldes 21:13Because as I said you don't understand parse dialect. The set-word inside the dialect holds current position. (or better say the input at current position of the parse processing) abdllhygt 21:15if this part of parse dialect, yes i noticed i didn't understand. if in general, i made a programming language with Red's parse dialect. 21:16so what does variable: really hold? Oldes 21:17 >> parse "abcd" [pos: (? pos) 2 skip pos: (? pos) to end] POS is a string of value: "abcd" POS is a string of value: "cd" abdllhygt 21:18so it holds till end? Oldes 21:18Sorry, but this is really the basic of the parsing! You should read the documentation and play a little bit with above examples. 21:20 >> parse "abcd" [pos: (print index? pos) 2 skip pos: (print index? pos) 1 skip pos: (print index? pos) to end] 1 3 4 abdllhygt 21:22wow, it holds from its position to end, i got it 21:23it can be the basic, but i didn't need it till now even i played a lot of parse 21:23thank you Oldes 21:24 >> parse inp: "hello" [pos: (print (pos = inp)) 1 skip pos: (print (pos = next inp)) to end] true true abdllhygt 21:26what does that next inp do? Oldes 21:27 >> inp: "ab" == "ab" >> pos: next inp == "b" >> head pos == "ab" 21:28Again.. it is basic of redbol languages. Traversing in series. 21:29parse inp [2 skip pos:] is same like pos: skip inp 2 abdllhygt 21:30thank you, i guess i understood var: in parse 21:33even it is not so important about parsing greggirwin 22:08@GiuseppeChillemi see https://github.com/red/REP/issues/107 for @zwortex's ideas here. Friday 24th September, 2021 gltewalt 01:54How come ellipsize-at is destructive? greggirwin 02:33Just a choice made at the time. It reads nicely at call sites, given the context of altering something for display. Feel free to mock up a non-destructive version, including the call site in _print, and see what people think. gltewalt:matrix.org 02:35Haven't looked at _print hiiamboris 18:35How would you name a rule, x that is similar to to x but if doesn't find x it consumes input until the end? greggirwin 18:39opt-to? 18:39Not great for the to end part though. 18:42finally-opt? toomasv 19:25to [x | end] = to-end x :? ne1uno 19:31end-too greggirwin 20:03end-or, to-end-or? ne1uno 20:06end-else hiiamboris 20:10I was considering all-or x & except x but both don't really nail it ;) planetsizecpu 20:13on-each & on-all ? ne1uno 22:33end-if-no gltewalt:matrix.org 23:57eto, either-to Saturday 25th September, 2021 GiuseppeChillemi 12:08I want to create a program which recognizes which program has opened a window on Windows and adds a button to the top bar or attach its VID gui to the side bar of the window. Do you think it would be possible in Red or R\S? Any hints where to start? hiiamboris 12:15With R/S definitely possible. Start by googling how to overlay your button over other program's title bar ;) abdllhygt 12:30hi 12:30what does it mean? *** Script Error: integer! overflow/underflow *** Where: to *** Stack: to-integer hiiamboris 12:35https://simple.wikipedia.org/wiki/Integer_overflow abdllhygt 12:38thanks @hiiamboris Monday 27th September, 2021 snotbubble 01:43@hiiamboris eat x Tuesday 28th September, 2021 fergus4 17:26Do we have an xml parser? besides Boleslav's (xml.red found on his repository)? his is choking on some 'invalid characters' where rebol xml parsers worked. I thought I saw mention of an xml-lite which seemed to work differently from xml.red but I can not find it. greggirwin 17:31I don't think @rgchris has ported his to Red, but @zwortex *just* posted about his SAX model parser in red/codecs. Check it out. 17:31https://gitter.im/red/codecs?at=614f02ac5739ab2df811a501 fergus4 17:34Thanks Gregg, I was using @rgchris for rebol and I thought he had a port but that was for Json. rgchris 19:46@fergus4 I do have a parser under my *experimental* grouping ([altxml.red](https://github.com/rgchris/Scripts/blob/master/experimental/altxml.red)). Experimental because I probably won't pursue that style of loading going forward, but it's well tested with my [SVG](https://gist.github.com/rgchris/6b33462e6894f431d8e09c349565aee5) bits and pieces. Wednesday 29th September, 2021 GiuseppeChillemi 07:03Is the extension of the Consolle feature documented somewhere? pekr 09:36Use the code, Luke 🙂 fergus4 16:39@rgchris Chris, altXML.red works great. Thanks again! greggirwin 18:09@GiuseppeChillemi I don't think so. @qtxie would have to say. @toomasv has hacked some against it, IIRC. Thursday 30th September, 2021 qtxie 01:08> I want to create a program which recognizes which program has opened a window on Windows You have to use R/S, binding to some OS APIs to do it. e.g. [EnumWindows](https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-enumwindows) GiuseppeChillemi 07:26@greggirwin I have made a little toolkit in Rebol I would like to port on Red Console. Hope bot @qtxie and @toomasv could help with some docs and entry points. 07:27(and code, if it exists) toomasv 07:43@GiuseppeChillemi I used [red-object-browser](https://gist.github.com/greggirwin/91dc1c3971998e0babeedba9f7e60bc5) to investigate console bowels... but it was quite complicated. Can't remember much now. If this is of any help you can look at [console tools](https://github.com/toomasv/console-tools) we played with last year (but Red has moved on and not all of it works any more). qtxie 07:45@GiuseppeChillemi What features of the Rebol console you used? Maybe they are missing in the Red console. rebolek 08:36I doubt that, Rebol console is not that powerful. GiuseppeChillemi 17:15@qtxie Rebol is not so flexible as Red so I have not extedend the console, I have made a gui with some tools like one for viewing every function of the scripts of a directory; a panel with a table list with a filtrable collection of links to red resources; a red/rebol github codebase navigator. Now I want to port it in Red and I need: a way to add a menu to the console; a way to open a panel and download scripts from it; know if it possible to move the cursor inside the console onto a particular line and get its text; know how to draw on the console (ToomasV has already some scripts)... 17:17@toomasv they are a starting point but as far as I understand we have no documentation. 17:19I may later ask here. My only problem is the SSL bug in Red Read which forbids me to download a web page on red. toomasv 17:44I don't think there is any documentation, but all these tasks are possible. You just have to dig in ... pekr 18:23What I remember, was Rebol console being able to position a cursor, like on an Amiga. It allows for the console anitmations and I even remember textual based Tetris game :-) abdllhygt 19:25can i make a key listener with Red? listen and replace program rgchris 22:22@pekr I seem to recall that was dependent on regular terminal codes, see also: [TUI Dialect](http://rebol.info/forces/articles/tui-dialect/) Sunday 3th October, 2021 gltewalt 04:13@GiuseppeChillemi I think Oldes has a curses library. You can do fancy things with curses, but it's not GUI console. GiuseppeChillemi 20:34@Oldes do you have it? gltewalt:matrix.org 21:17https://github.com/red/code/tree/master/Library/Curses 21:18It's old by internet standards, so it might need some tweaks Oldes 21:50@GiuseppeChillemi I don't have anything else than what is in the link above. I actually never used it in real. I was trying to do the ANSI code emulation (for windows, ale posix handle it in terminal normally) instead, but I lost my track as there was lack of interest to support it in the GUI console years ago. Tuesday 5th October, 2021 bubnenkoff 17:59Is there any chance to get http support in nearest few months? I really need support of http-timeouts greggirwin 18:15Yes, there's a chance. :^) We're making a new roadmap now and it's one of the top items on our list. bubnenkoff 18:29Great! JacobGood1 20:09@greggirwin will this roadmap be public? greggirwin 21:46Yes, we're hashing out details internally first. Wednesday 6th October, 2021 GaryMiller 01:17Roadmap is great way to get people excited and attract more followers! Try to get a Red.js roadmap too! cloutiy 18:27Yes! Would love to try making a web framework in red! Thursday 7th October, 2021 fergus4 17:51I'm trying to draw boxes in a canvas from some data extracted from an xml file. Example data : x: 2.54 y: 1.049 width: 0.547 height: 0.492 . I see that drawing a box or polygon requires pair!. How do I handle these floats to maintain precision? Any ideas? greggirwin 17:55What units are your floats in? You should just need to translate those to pixels (integers) and make pairs from them. fergus4 17:58the XML data represents a pdf (locations/sizes of text/image objects)(converted in openOffice). I guess I can multiply them to create integers and convert back later. 17:58But that is a big canvas... 18:00Ultimately I want to use a computer vision tool to detect structure patterns to detect tables, lists, captions that are handled differently from regular text in the doc. GalenIvanov 18:04@fergus4 You can multiple the values in order to make them integers and use scale 0.2 0.2 (or what works for you, so that the box fits your canvas) greggirwin 18:05To make it easy to explore, with different docs, put a slider in your UI to adjust the scale and show the value. That way you'll be able to play and see if the same value can be used for all your docs. 18:06Or if your number of docs is limited, pull up each one manually and set the scale. I wonder why the exporter didn't include any metadata though. Or maybe the original PDF didn't have it. Oldes 18:48@fergus4 what @GalenIvanov recommends is actually how it was handled in Flash player... it was internally using [twips](http://www.flagstonesoftware.com/cookbook/what_twip.html) Friday 8th October, 2021 fergus4 14:55I know red Draw is a subset of SVG. Does it do SVG Paths? If so I assume there is some conversion necessary.? greggirwin 16:06Draw can do beziers, but I don't know what SVG paths use. Maybe @rgchris can say. fergus4 17:43I think I can translate it to shape. Just have to parse out info....Thanks. rgchris 18:49@fergus4 It's more or less equivalent. I don't have a draw-path-to-path function in my [SVG Tools](https://gist.github.com/rgchris/6b33462e6894f431d8e09c349565aee5) if that's the way you're going, but shouldn't be too difficult to do. 18:52If you're going from SVG to Draw then you can take the d="..." attribute and convert it to shape parameters like so: svg/vid/to-draw-path svg/parse-path "M100,100l100,00" greggirwin 18:56Thanks for the assist @rgchris! @fergus4 if you get it working, let us know. An SVG codec would be great to have, after a general markup codec. fergus4 19:42I was able to parse out the path and create a draw block using shape but it does not seem to auto close the path. I saw an example and it suggested that it should close the path but does not seem to work in latest red. Has anything changed? view [canvas: base 200x200 white draw compose [[line-width 5 shape [ line 0x0 90x30 30x90 ]]]] ne1uno 19:45@fergus4, add closing point to line it did close in earlier versions 19:47^ or use close fergus4 19:51From the docs: 'shapes are automatically closed (no need to draw the last stroke back to start position)." 19:52I guess I can just use polygon if the svg path has the close tag (z) greggirwin 20:01Check the red/gui-branch group. I remember chat about close but don't remember the resulting design decision. fergus4 20:03Yes I found an example and it works. greggirwin 20:05:+1: Seems we need to update the docs. fergus4 20:06@rgchris Chris I used your SVGtools func and it parsed it perfectly. Thanks 20:16Is it possible to turn layout into an image file like in rebol? Does not seem to work. ne1uno 20:21to-image ? fergus4 20:25I saw a reference in gitter that you have to have the layout displayed (i tested and it works) unlike rebol where you can just to-image layout. Any work around? Don't want to display layout... hiiamboris 20:29? draw fergus4 20:33Work around...view the layout convert it and close layout. I'll deal with the screen flashing layout for a fraction of a second..... lay: layout [p: panel [box 20x20]] view/no-wait lay img1: to-image lay unview lay greggirwin 20:40You can set the offset for the window off screen. I thought we had a more direct way to do this, but it's not in my head right now. Sunday 10th October, 2021 luis-rj 19:40Is it possible to programmatically move the mouse cursor ? (on Windows ) hiiamboris 20:03https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-mouse_event luis-rj 20:16I guess it's a job for Red/System... hiiamboris 20:19yep :) luis-rj 20:20Do you know any examples that can help me? hiiamboris 20:21https://github.com/red/red/issues/4380 20:21you can rip it from there luis-rj 20:21Thanks ! Monday 11st October, 2021 fergus4 01:34Trying to decode a base64 encoded image file . I can do it in rebol but it seems to to hang on debase step in Red. Rebol p: load %pic.txt == {iVBORw0KGgoAAAANSUhEUgAAANsAAACnCAIAAAA a: debase p == 64#{ iVBORw0KGgoAAAANSUhEUgAAANsAAACnCAIAAAA x: load a == make image! [219x167 #{ FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF Red p: load %pic.txt == {iVBORw0KGgoAAAANSUhEUgAAANsAAACnCAIAAAAXAb6tAABoYElEQV a: debase p == #{ 89504E470D0A1A0A0000000D49484452000000DB000000A7080 x: load a *** Access Error: invalid UTF-8 encoding: #{89504E47} greggirwin 01:51Did you try ? load to see /as? fergus4 01:51Yes just found it greggirwin 01:54Does it work foryou? fergus4 01:55 z: load/as a 'png == make image! [219x167 #{ FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF 01:55Thanks greggirwin 01:55:+1: Wednesday 13th October, 2021 abdllhygt 11:34hi! 11:35 link: function [link-block [block!] /local result] [ result: "" append result rejoin [{<a href="} (to-string link-block/link) {">} link-block/title {</a>}] append result rejoin [{<br><b>} link-block/site {</b> }] append result rejoin [{<span>} link-block/info {</span><br><br>}] return result ] when I use my this func several times, it replace more, I think result is not local here, do I have to use copy for local variable? hiiamboris 11:39https://github.com/red/red/wiki/[DOC]-Why-you-have-to-copy-series-values abdllhygt 11:44so, why do we use /local? 11:47It seems /local makes a word for in block, when we use same function, it can replace itself hiiamboris 12:05result is a word, which can be local or not 12:06"" is a string, and you have to copy the string if you don't want to modify in place abdllhygt 12:06@hiiamboris thank you greggirwin 18:49@abdllhygt if you don't use /local, which is easy to test, you will end up with result being a global word, which may conflict with others in unintended ways. It can be useful at times, especially in small scripts, but you can also use function to capture local set-words and then use /extern to expose only those you want. Thursday 14th October, 2021 abdllhygt 09:07@greggirwin thank you Friday 15th October, 2021 bubnenkoff 18:45What is the Red-way to remove extra spaces from string: "hello world foo" to get: hello world foo Respectech 18:49Here's a brute-force way: while [find str { }][replace/all str { } { }] 18:50It's hard to see, but the first two { } should be two spaces and the third { } should be one space. hiiamboris 18:52> What is the Red-way to remove extra spaces from string: > > "hello world foo" > > to get: > > hello world foo > >> trim/lines "hello world foo" == "hello world foo" 18:54name is really inconspicuous though ;) 18:54it should be trim/extra or trim/flatten smth 18:55well at least the behavior is in docstring Respectech 19:49Well, that is much easier. Saturday 16th October, 2021 pekr 07:24My experiment using parse- flattens spaces to just one, uses trim to remove from head/tail: >> despace: func [string][to-string parse trim/head/tail copy string [collect any [some #" " keep (#" ") | keep skip]]] >> despace " This is a test. " == "This is a test." GalenIvanov 07:29My parse solution: 07:30 text: "hello world foo" parse text [any [change some sp sp | skip]] text == "hello world foo" pekr 07:33Ah, never used changemuch in my parse history, as it messes with the original string, ditto for remove, as I liked to use markers and my brain was just too busy, when backtracking was needed :-) 07:33Btw - how to easily solve the case, when there is a space in front of the dot or a comma? E.g. "This is a test ." 07:34I never got myself in those R3 parse enhancements, doing some ahead stuff .... time to learn ... 07:35Btw - your example does not work for the spaces at the head or a tail of the string .... GalenIvanov 07:36Ok, I'll take a look at it pekr 07:37It's just an excercise, not a real request, so keep relaxed, if you are pressed for the time :-) GalenIvanov 07:39If you meant that a single space remains at the head or tail of the text - yes, this is the current behavior. But it's not indicated in the question :smile: pekr 07:40You can use preceeding trim/head/tail, as I did, before sending to parse :-) GalenIvanov 07:41Yes, of course! 07:47Here's the extended version: 07:47 text: " hello world foo " fix-spaces: [ remove any sp any [ remove [any sp end] | change some sp sp | skip ] ] parse text fix-spaces >> text == "hello world foo" pekr 07:57Nice :-) GalenIvanov 08:01I'm sure there is more elegant ways to do it :smile: toomasv 09:04Yet another: rejoin parse " hello world foo " [collect [any sp any [some sp not [sp | end] keep (sp) | any sp end | keep skip]]] ;== "hello world foo" GalenIvanov 09:19:+1: Sunday 17th October, 2021 bubnenkoff 17:22Remember me please how to call function that placed in such block: foo: [action: function [value] [ first value]] >> foo/action == function >> do foo/1 "sdf" *** Script Error: action: needs a value But how to call action? P.S. thanks for solutions with spaces! toomasv 17:27 do foo action "sdf" ;== #"s" fn: do foo fn "sdf" ;== #"s" bubnenkoff 17:28oh thanks! toomasv 17:29 fn2: reduce foo fn2/1 "sdf" ;== #"s" o: object foo o/action "sdf" ;== #"s" 17:53:) do append append clear [] select o 'action "sdf" ;== #"s" do append reduce foo "sdf" ;== #"s" do reduce head insert ["sdf"] foo ;== #"s" endo64 23:40For removing spaces with parse: text: " hello world foo " parse trim text [any [remove some space insert " " | skip]] ; == "hello world foo" Monday 18th October, 2021 GalenIvanov 07:16:+1: Oldes 09:21@endo64 why not just change? parse trim text [any [change some space " " | skip]] Still trim/all is 10x faster. endo64 09:26trim/all removes all whitespaces, doesn't keep one space between words. change already mentioned, I just want to show a different way. Oldes 09:27Ah... ok... I'm reading backwards:) Tuesday 19th October, 2021 ldci 01:54Hi Reducers. This code does not work with the lastest Red version. I don’t understand why. Any idea? #! /usr/local/bin/red Red [ Title: "Thread tests " Author: "Francois Jouen" File: %thread.red Needs: View ] ; code must be compiled with -e option (encap option) ??? ; e.g. red -r -e thread.red random/seed now/time/precise img: make image! reduce [640x480 black] plot: [line-width 1 pen green line 0x240] x: y: 0 height: 400 t1: t2: none scheduler: make object! [ threadCount: 0 threadList: [] delay: 0.0 appendThread: func [ athread [object!] ][ append threadList athread threadCount: threadCount + 1 ] startMessageLoop: func [] [ i: 1 while [i <= threadCount] [ cthread: threadList/:i cthread/tTrigger: cthread/tCount % cthread/tPriority cthread/tExecute cthread/tCount: cthread/tCount + 1 i: i + 1 ] ] ] rThread: make object! [ tNumber: 0 ; thread number tPriority: 1 ; thread priority [1 to N (high to low)] tCount: 0 ; thread calls counter tTrigger: 0 ; trigger for special events such as data visualization tExecute: none ; func as code pointer ] clearScreen: does [ x: 0 canvas/image/rgb: 0.0.0 clear plot compose/into [line-width 1 pen green line 0x240] plot ] showImage: does [ x: x + 1 if x > 640 [clearScreen] y: 40 + multiply height / 2 1 + sin 0.05 * x append plot as-pair x y ;show points according to the thread priority if t1/tTrigger = 0 [canvas/image: draw img plot do-events/no-wait] ] showTime: does [ ct: now/time if t2/tTrigger = 0 [fT2/text: form ct do-events/no-wait] ] initThreads: does [ ; create threads 1 and 2 (make required) t1: make rThread [tNumber: 1 tPriority: 10 tExecute: :showImage] t2: make rThread [tNumber: 2 tPriority: 30 tExecute: :showTime] ;register threads scheduler/AppendThread t1 scheduler/AppendThread t2 ] ;************ test program ***************** view win: layout [ title "Threads Demo" base 640x1 blue return canvas: base 640x480 img return base 640x1 blue return ft2: field 100 center f: field 30 "10" text 30 "High" sl: slider 120 [ v: 1 + to-integer (sl/data * 19) t1/TPriority: 21 - v f/text: form v ] text 30 "Low" button "Clear" [clearScreen] button "Start" [ stop: false until [scheduler/StartMessageLoop stop] ] button "Stop" [stop: true] button "Quit" [quit] do [initThreads sl/data: 50%] ] toomasv 04:22Compiles on W10. 06:43Er.. and works too :) ldci 07:34@toomasv but not on macOS 10:11@toomasv : tested on W10 and Linux. Problem specific to macOS. I don’t know why. greggirwin 15:45Do you get any error messages @ldci? My first guess is something related to assigning canvas rgb or image, as the underlying subsystems there will be quite distinct per OS. Could also be something with the event handler, depending on what behavior you're seeing. ldci 15:55@greggirwin Both threads are correctly executed, but it’s impossible to stop the scheduler/StartMessageloop. I’ve a version compiled with 09/2019 red version whichs correctly runs. It seems related to a change in the event handler. Btw, I get also problems with cvWaitKey in the binding of openCV with recent Red version. greggirwin 15:58Any thoughts @qtxie? I don't have a mac available here, so can't test. hiiamboris 16:11@ldci tried changing startMessageLoop: func [] to startMessageLoop: function [] ? ldci 16:14@hiiamboris Yes with the same result Wednesday 20th October, 2021 qtxie 02:56I think do-events/no-wait omits some events in this case. ldci 05:34@qtxie OK, a solution? qtxie 07:35@ldci Pushed a fix. :smile_cat: 07:41I found this tool to run a macOS VM. Much faster than on VMWare. Though I have to run it inside a Linux VM. Windows -> WSL -> macOS. ;-) https://github.com/wimpysworld/quickemu hiiamboris 07:59:D 08:01thanks, I will try it qtxie 08:06@hiiamboris I tried it on W11 only and it's not perfect when installing the macOS. The opened QEMU GUI window becomes frozen when the VM reboot. 08:07I have to close it forcely and run the VM again. 08:10Also it cannot get the right PUBLIC folder on WSL Ubuntu, I change the source code to use a hard-coded path. https://github.com/wimpysworld/quickemu/blob/master/quickemu#L954 hiiamboris 08:12can it be used somehow with an existing macos drive image (from vmware)? qtxie 08:13I don't think so. Can qemu use vmware's image? hiiamboris 08:14KVM should be able to 08:14https://foswiki.org/Support/HowToRunVirtualMachineImageOnKvmQemu 08:18ok I probably won't be able to try it as my provider throttles ubuntu mirrors access to 2kB/sec :D qtxie 08:25:sweat_smile: Why they set this limitation? The macOS image is also huge, several Gigabytes. hiiamboris 08:34haha why, I guess because linux uses bandwidth in a most wasteful way and linux junkies slow down the whole mobile network :) 08:37if I could somehow run all WSL traffic through Tor... but I haven't found an easy solution bubnenkoff 17:46I have got follow data structure: data: [ lots: [ foo: none ] ] Is there any way to determinate if path real exists, or not? For example this path exists but foo evaluate to none print data/lots/foo But what with path: print data/lots/fake it's also none. I found only one way -- to check type? for latest path element greggirwin 17:54There's not built-in function for that. You need to use find on the keys through the path. If your structures are strictly key-value, use find/skip 2. Also note that you can get errors if interim keys don't refer to series or maps. e.g. >> data/lost/foo *** Script Error: path data/lost/foo is not valid for none! type *** Where: catch *** Stack: ldci 19:10@qtxie Thanks a lot :) 19:17@qtxie You’re the best. It works:) greggirwin 23:45:clap: :+1: Thursday 21st October, 2021 ldci 08:22@qtxie Your fix also works with OpenCV :) qtxie 12:08> @qtxie Your fix also works with OpenCV :) Great! So bad that new macOS cannot run 32bit Apps. Friday 22nd October, 2021 bubnenkoff 15:52Why error flat-path: data/lots/lot/KBKCode *** Script Error: context for data is not available can happens? probe data is printing it to console, so data is exists 15:54[![изображение.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/a1pG/thumb/izobrazhenie.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/a1pG/izobrazhenie.png) hiiamboris 15:58I presume that data word in flat-path is bound to a function that exited bubnenkoff 16:06@hiiamboris find-path-to-tag: function[data wrd] [ print "find-path-to-tag" wrd: to-word wrd list: copy [] walk: function [data] [ foreach [k v] data [ if (k = wrd) [append list to-word k break] if block? v [ append list to-word k walk v ] ] ] walk data to-path compose [data (list)] ; so it can be bug here? (I need to return ever path started with data) ] 16:09yes. it's seems that it is. But how to prevent it from bounding with data context to make it simple data as path element? hiiamboris 16:12there is no "simple" data, there's data word bound to find-path-to-tag func, and data word bound to some outer context whatever it is 16:13bind it appropriately where it's more convenient for you, or pass original data word as argument toomasv 18:03@bubnenkoff E.g.: find-path-to-tag: function [data wrd] [ ;print "find-path-to-tag" wrd: to-word wrd list: copy [] walk: function [data] [ foreach [k v] data [ case [ k = wrd [append list to-word k break] block? v [ append list to-word k walk v ]]]] walk data to-path bind compose [data (list)] system/words ] data: [foo: [bar: none baz: none]] set 'data/foo/baz "123" find-path-to-tag data 'baz ;== data/foo/baz get find-path-to-tag data 'baz ;== "123" Saturday 23th October, 2021 bubnenkoff 07:31@toomasv thanks! toomasv 08:09Although to define function inside function is generally not a good idea IMO. greggirwin 20:02Funcs in funcs are a current compiler limitation. Interpreted or encapped is fine. Friday 29th October, 2021 bubnenkoff 14:59I need to move object on top level to get from: data: [ aaa: "aaa" lots: [ object: [ bar: "bbb" ] ] ] this: data: [ aaa: "aaa" object: [ bar: "bbb" ] lots: [ ] ] What is the best approuch for it? Using parser? Or it's better without it? 15:33small clarification: data: [ aaa: none ; one or more tags could be on this level lots: [ bbb: none ; one or more tags could be on this level object: [ bar: "bbb" ] ] ] hiiamboris 15:54using move? bubnenkoff 16:04Wow, I did not thought that red have such word. I looked as docs, but is there any example? 16:09 data: [ aaa: "aaa" lots: [ bbb: none object: [ bar: "bbb" ] ] ] move/part data/lots/object data 2 probe data == [ bar: "bbb" aaa: "aaa" lots: [ bbb: none object: [] ] ] Remotely similar, but not the same hiiamboris 16:19remove object after that bubnenkoff 16:46But this code is loosing object and move only it content toomasv 17:04@bubnenkoff >> data: [ [ aaa: "aaa" [ lots: [ [ bbb: none [ object: [ [ bar: "bbb" [ ] [ [ ] [ ]() >> move/part at data/lots 3 data 2 data == [ object: [ bar: "bbb" ] aaa: "aaa" lots: [ bbb: none ] ] bubnenkoff 17:13Big thanks!! toomasv 17:27You are welcome! prapro 20:09Kinda of OT here, but does anyone knoW how to run REBOL 2 on the Raspberry Pi? I got one system here I got it working on, but I can't recall how I did it. Respectech 20:20I wrote this blog article: https://ameridroid.com/blogs/ameriblogs/how-to-run-rebol2-scripting-language-on-debian-based-arm-systems prapro 20:24Thanks Bo! I better just follow your blog from now on! cloutiy 20:37@Respectech ameridroid is your business? prapro 20:37Great post, but unfortunately no cure. I am getting a segmentation fault. Respectech 20:44@cloutiy yes. 20:45@prapro what OS are you running on the RPi? prapro 21:07Small clue: Rebol/View gives Segmentation fault while Rebol/Core just freezes after "NNTP protocol loaded" 21:42The libraries being loaded are exactly the same checksum as those on the working system. 23:55Now everything works but the debugging console. It seems at least one of Bo's suggestions requires a reboot. Thanks Bo! Curiously Cgi mode (-c) works and nowindow mode (-w) works too. And console programs work fine using -w. rebred 23:57 a: 12 b: 76 test: #(n1: a n2: b) print test/n1 == a print test/n2 == b how do I get 12 and 76 as results ? Saturday 30th October, 2021 Respectech 00:26Oh yeah, reboots are a must. 00:27That's the part where I wrote: "On our test system, Rebol was able to be started at this point. If you encounter a problem starting it at this point, a reboot is probably required." 00:27I never tried the debugging console. Not sure that Carl ever tested that on his ARM build. gltewalt 00:39get test/n1 rebred 01:27@gltewalt thanks a lot!! prapro 02:15I probably need to read at brain input speed. Console definitely works fine on my other system. I should be able to figure it out from here. I'll let you know what I find. pekr 04:41@Respectech how far are you from running Red on RPi, instead of an old Rebol? For networking, callto Curl might be used? bubnenkoff 07:13@toomasv move/part (at data/lots 3) data 2 data Could you explain what the last data word mean? (at data/lots 3) find position of object with it's block 2 is size of moving part (word and it's block) which the last one refers last data? hiiamboris 07:30Just displays to the result. toomasv 16:26Yes, show. But here comes version with @hiiamboris' latest childe: data: [aaa: "aaa" lots: [bbb: none object: [bar: "bbb"]]] == [aaa: "aaa" lots: [bbb: none object: [bar: "bbb"]]] >> data: morph data ['a 'b 'c ['d 'e 'f ['g 'h]]][a b f [g h] c [d e]] == [aaa: "aaa" object: [bar: "bbb"] lots: [bbb: none]] 17:28@hiiamboris Should f work here?: data: [aaa: "aaa" lots: [bbb: none object: [bar: "bbb"]]] () morph data ['a 'b 'c ['d 'e f: [quote object: block!]]][a b f c [d e]] ;== [aaa: "aaa" object: lots: [bbb: none]] hiiamboris 18:10I get assertion failure 18:10it should work, must be another bug :D 18:10well, f should not work but 'f should 18:10so, not a bug 18:11but it's an interesting question 18:12I can **not** set f because it might have been defined like this: f: [quote object: block!] morph data ['a 'b 'c ['d 'e f]][a b f c [d e]] 18:12by setting it I would override the rule 18:12but it may be so that there's a workaround I don't quite see yet... 18:14so only lit-word sets the word's value right now 18:15it also pushes it to the tree 18:16but to clarify: in emitter, word does not take anything from the tree: in your example it works because those words were each set only once 18:18and putting this into a loop is a good way to hang Red, e.g. try morph [1 2 3] ['x 'x 'x] [x ...] at your own peril ;) 18:19to illustrate how word fetches just value and emits it: >> morph [1 2 3] ['x 'x 'x] [x] == [3] yet lit-word takes an item from the tree's branch named x: >> morph [1 2 3] ['x 'x 'x] ['x ...] == [1 2 3] >> morph [1 2 3] ['x 'x 'x] ['x] == [1] 18:20so it knows the order and when items are exhausted gltewalt:matrix.org 18:36Would it matter if all rules set to a word were implicitly copied? hiiamboris 18:39probably won't help, as I would have anyway to replace words in your contexts, destroying those contexts for later use toomasv 18:41 Ok, thanks for explanation! Lit-word works, yes. Sunday 31st October, 2021 toomasv 07:12Another, more general: morph data [ahead [set-word! block!] 'w [f: [quote object: block!] | 'x ...] | 'y ...][('y ...) 'f 'w ['x ...]] == [aaa: "aaa" object: [bar: "bbb"] lots: [bbb: none]] hiiamboris 12:26I'm getting outsmarted by Red smarts: >> unset 'x >> either :x [1][0] *** Script Error: block did not return a value *** Where: either *** Stack: >> case [:x [1] 'else [0]] *** Script Error: block did not return a value *** Where: case *** Stack: 12:27Have to uglify my code: >> either if :x [yes] [1][0] == 1 12:28Better solutions anyone? 12:30x is unknown, sometimes unset endo64 17:04value? 'x ? hiiamboris 17:12that doesn't help distinguish false/true toomasv 17:18either all [not unset? :x :x] [1][0] hiiamboris 17:22what I want is either any [unset? :x :x] [1][0], and I agree explicit variant is probably the most readable 17:22I just don't like that unset sometimes works as truthy, sometimes doesn't 17:25how do you write either condition to get unset *by mistake*? 17:26I presume it's the reason for the error 17:32R2 allows unset for all/any, but not for if/either/case R3 allows it for if, either, all/any, but not for case Red allows it for if, all/any but not for either/case 17:32seems pretty random to me bubnenkoff 17:42Is it's possible without parse (half year I did some similar) to understand if we go deep in recursion of we are in the same level? In simple words I want to write function that return pass to section: data: [ aaa: "aaa" lots: [ bbb: none boo: [ name: "sf" ] object: [ bar: "bbb" ] customer: [ baz: "ccc" ] ] ] remove-last: function [blk] [ head clear back tail copy blk ] find-path-to-tag: function[xdata wrd] [ wrd: to-word wrd list: copy [] walk: function [xdata] [ index: 0 ; in?: false foreach [k v] xdata [ index: index + 2 if (k = wrd) [ ; append list index - 1 break ] if block? v [ append list to-word k walk v ] ; list: remove-last list ] ] walk xdata to-path compose [data (list)] ] find-path-to-tag data 'object return: == data/lots/boo/object/customer But I need to get: == data/lots/object I don't understand at what point do I have to check if I'm going in or if I'm on the same level toomasv 19:00@bubnenkoff Something like this should do: context [ ok: no list: copy [] walk: func [data wrd /local k v] [ foreach [k v] data [ case [ wrd = k [append list to-word k ok: yes break] block? v [ append list to-word k walk v wrd list either ok [break][take/last list] ] ] ] ] set 'find-path-to-tag func ['data wrd] [ ok: no clear list walk get data wrd list to-path head insert list data ] ] find-path-to-tag data 'object bubnenkoff 19:04Thanks! One year ago it was long discussion how to remove last element. take/last is do so. Was it introduces recently or everyone had forgotten about him at the time toomasv 19:07It is old; difference from clear back tail is that it returns the last element that is often not needed (neither is it needed here, but shorter). BTW Notice that I changed the code a bit to make it more general (see lit-word in func spec) - you don't have to always feed it data named "data" :) bubnenkoff 19:09Why you are using case here? It's seems that there is not reason in it toomasv 19:10Just adapted your walk. bubnenkoff 19:10 if wrd = k [ ; ... ] gltewalt:matrix.org 19:19Shouldn't unset always be true? toomasv 19:23@bubnenkoff Better line: ok: wrd = k [append list to-word k break] Monday 1st November, 2021 Respectech 16:12@pekr Gregg has two PinePhones - If he can get Red running on those, then it should also work on Raspberry Pi and all the other ARM SBCs. 16:12I'll be happy to write up a blog article when we get Red running on ARM Linux! pekr 16:24@Respectech on the following page https://beta.red-lang.org/roadmap/ , I can see an attempt to have an AVR backend? It would be cool to get subset of Red onto some MCUs, as e.g. a MicroPython. I would be grateful even for a barebones Red/System, because I would be more fluent with that, than with C or ASM. Of course, in such a case, I would like to see a c-string and array support in R/S, as those are planned for the future anyway :-) rebolek 16:33@pekr c-string! is there from the beginning ;-) pekr 16:57Sorry, looked into a wrong section of docs .... Respectech 17:28Someone could also make an FPGA implementation of Red so we could run Red directly on hardware. :-) ldci 18:43Hi guys. I’m playing with Rosetta code samples for magic squares with success for odd and doubly even order:). This code is incorrect. Thanks for help :) #!/usr/local/bin/red Red [ ] ;--A magic square of singly even order has a size that is a multiple of 4 plus 2 ;--(e.g. 6, 10, 14). ;--the sum of each row and column, and both diagonals must be equal to the "magic number" ;--based on FreeBasic Rosetta code sample magicSquare: function [n [integer!] ][ if any [n < 6 (mod n - 2 4) <> 0] [print "Error: incorrect order value!" exit] ;--we make a block of blocks to simulate a matrix array: copy [] v: make vector! n repeat y n [append/only array to-block v] magicNumber: n * (n ** 2 + 1) / 2 n2: n / 2 q2: n2 ** 2 l: n - 2 / 4 x: to-integer n2 / 2 + 1 y: nr: 1 until [ if array/:x/:y = 0 [ array/:x/:y: nr ;--A array/(x + n2)/(y + n2): nr + q2 ;--B array/(x + n2)/(y): nr + q2 * 2 ;--C array/(x)/(y + n2): nr + q2 * 3 ;--D either (mod nr n2) = 0 [y: y + 1] [x: x + 1 y: y - 1] nr: nr + 1 ] if x > n2 [ x: 1 while [array/:x/:y <> 0] [x: x + 1] ] if y < 1 [ y: n2 while [array/:x/:y <> 0] [y: y - 1] ] nr > q2 ] ;--swap left side repeat y n2 [ repeat x l [ array/:x/:y: array/(x)/(y + n2) ] ] ;--make indent y: to-integer round (n2 / 2) + 1 array/1/:y: array/1/(y + n2) array/(l + 1)/(y): array/(l + 1)/(y + n2) ;--swap right side repeat y n2 [ x: n - l + 2 while [x <= n] [ array/:x/:y: array/(x)/(y + n2) ] ] ;--check columms and rows repeat y n [ nr: l: 0 repeat x n [ nr: nr + array/:x/:y l: l + array/:y/:x ] if any [nr <> magicNumber q <> magicNumber][print "Error : value <> magicNumber" ] ] ;--check diagonals nr: l: 0 repeat x n [ nr: nr + array/:x/:x l: l + array/(n - x + 1)/(n - x + 1) ] if any [nr <> magicNumber q <> magicNumber][print "Error : value <> magic_sum" ] ;--results print ["Single even magic square size: " n "*" n] print ["The magic number: " magicNumber] print ["Square matrix:"] repeat y n [ line: copy " " repeat x n [append line pad array/:x/:y 4] ;--pad for aligment print line ] print "Done" ] magicSquare 6 greggirwin 18:57@hiiamboris unset! is tricky, because it's a ghost value and is also truthy, which seems counterintuitive at times. We can reason about it, but also want to keep it in the shadows as much as possible. I'm torn about whether if should error or either should not, but they should be consistent with each other no matter what. With case I'm not so sure. Having it explicit in the expressions you write may be better. The reason I'm conflicted is that, on the one hand, we want less errors. On the other hand, truthy clauses more often lead to action which may be the last thing you want if something is undefined. You may just get an error in your next piece of logic that didn't expect unset!. Right now, I'd say change if. We don't want to encourage using unset! as a feature. If a few advanced pieces of code are a tiny bit uglier, so be it. giesse 19:08I don't like any of this: >> x *** Script Error: x has no value *** Where: catch *** Stack: >> :x >> if :x ['huh?] == huh? >> not :x == false 19:08if unset! exists to catch typos then :x *must* cause an error. hiiamboris 19:10how do you not cause an error then? greggirwin 19:11:x in the console is a special case IMO. giesse 19:11> how do you not cause an error then? >> get/any 'x hiiamboris 19:12by uglifying the code ;) giesse 19:12but, as you know, I think that unset! should not exist, so I'm not the best person to talk about this topic :) 19:12> by uglifying the code ;) unset! is ugly by definition and it must stand out as much as possible so you guys will finally see the light :P hiiamboris 19:13:D gltewalt:matrix.org 19:13Agree. Unset should not exist giesse 19:13but, seriously, :x not catching typos really makes no sense. greggirwin 19:13Unset is an unfortunate implementation byproduct, and should be kept in the shadows. So if we ever *can* eliminate it, as little code as possible is broken. giesse 19:13if it doesn't matter for :x then it doesn't matter for x either hiiamboris 19:13any reason to use :x over x when you want to catch errors? giesse 19:14you need to use :x for functions and other word-active values (which in red maybe is only functions? i don't recall) hiiamboris 19:15consider unset one of such active values ;) giesse 19:15again, no, because the *only* purpose of unset! is to catch typos. 19:16(and then it's been abused for other things, and everyone shall suffer because of that) hiiamboris 19:16the nonbelievers shall burn ☻ 19:17idk, I don't see any harm in unset being around giesse 19:17*shrug* hiiamboris 19:18the only place where it effectively catches typos is plain word!s 19:18which is likely function names greggirwin 19:34Things would be simpler without it, with the question being whether there is *enough* value in knowing something hasn't been assigned a value. i.e. why not just use none!. As it stands we have outdone 3 value logic, but balanced it on the side of truth(y). hiiamboris 19:37none doesn't work for errors catching greggirwin 19:50Which is the value question. Tuesday 2nd November, 2021 greggirwin 19:48@ldci here is my very, very old R2 magic square code. 19:48[magic-square.r](https://files.gitter.im/5780ef02c2f0db084a2231b0/iQHp/magic-square.r) 19:49When you say your code is incorrect, can you be more specific? 20:01I haven't tackled single even, but http://www.1728.org/magicsq3.htm has a nice explanation that some Reducers can probably apply in clever ways. ldci 20:39@greggirwin Thanks for your code. With Toomas’s help, all is perfect now:) greggirwin 20:49:+1: Wednesday 3th November, 2021 ldci 00:43@greggirwin My idea is to write/collect Red samples for Rosetta database in order to promote Red such as: ;--Recursive memoized with map! datatype fib: function [n] [ m: #(0 0 1 1 2 1) any [m/:n m/:n: (fib n - 1) + (fib n - 2)] ] gltewalt 03:17This is one of the most amusing: https://rosettacode.org/wiki/MAC_Vendor_Lookup#Red toomasv 04:35Oh, boy! [Not implemented in Red](https://rosettacode.org/wiki/Reports:Tasks_not_implemented_in_Red) ldci 08:24@toomasv Yes, a lot of work to do GalenIvanov 08:26Maybe we need red/rosetta-code room? hiiamboris 08:31Indeed ldci 08:34Good idea hiiamboris 08:37Still, we would draw more attention on RC if we had HOFs in the runtime. GalenIvanov 08:38You are right, I completely agree! hiiamboris 08:41Because exposing index juggling, like i: i + 1, that kind of thing, presents the language as some remnant of the past. pekr 09:54I don't know, if the effort is worth the fuss. I have never ever met an IT friend, who would judge a programming language selection upon the Rosetta. Maybe a wrong social bubble here, but from mine contacts, 99% of ppl are fully ignorant of anything Rosetta included :-D GaryMiller 11:20I'm probably one of that 1% but for years now I head to Rosetta when I hear about a new languages to see how the code compares to other languages. I've been in IT for 40 years now. I may not use Rosetta to pass final judgement though if a language is missing or only solves half the examples there. I look at how many contributors it has. How many GIT Stars it has and whether i has a Wikipedia entry yet. gltewalt:matrix.org 11:31Programming language should be judged purely on quality of mascot, and 99 Bottles solution. 😉 GalenIvanov 11:32I thought it was FizzBuzz.. :smile: greggirwin 15:33We can set up an advocacy room, to go with https://github.com/red/red/wiki/Advocacy Respectech 18:35Is there a webserver written in Red? I'm looking to write a Christmas light show program in Red, so I need a webserver that can easily launch Red scripts. 18:35I seem to remember that someone wrote it. Also, does it require a specific build of Red? greggirwin 18:37Check out @rebolek's notes in https://gitter.im/red/codecs which point to his CASTR repo. Respectech 19:48I don't see anything related to a webserver there... hiiamboris 20:08the link is hidden in the secret wiki page he mentions Thursday 4th November, 2021 rebolek 06:07@hiiamboris why do you call it secret wiki page? It’s easily accessible from the repo. Also, i added a link directly into the readme. hiiamboris 06:10Exactly. Because there were no links to it, and general wiki has no links either ;) Friday 5th November, 2021 GiuseppeChillemi 20:09How do store the output of help? hiiamboris 20:24help-string prapro 20:30@Respectech Update on that R2 issue on arm -- seems to have been some freak install glitch. Everything works perfectly now. 20:31After a complete reinstall that is. Respectech 20:34R2-ARM wasn't tested terribly well. Carl just compiled it for personal use and then made it available on the site. So there are a number of bugs, but it is useful for some things. Tuesday 16th November, 2021 gchiu 18:22How do you get the header/title to show in a Red Window - even the main window? greggirwin 18:25https://github.com/red/docs/blob/master/en/vid.adoc#container-settings e.g., view [size 800x600 title "Testing"] gchiu 18:29Ah, it doesn't use the script header 18:30I am seeing very slow behaviour from a text-list on-down vs the default on-change .. is this known? greggirwin 18:33Doesn't sound familiar. Need an example. e.g. how many items and how slow? Random data is fine. gchiu 19:10This is what I'm seeing 19:10https://youtu.be/xz-kmmgREDc hiiamboris 19:16RED in the url! gchiu 19:18@hiiamboris by intention! hiiamboris 19:20we'll need an example *we* can reproduce on our end gchiu 19:22Sure .. so it's not a known behaviour then? hiiamboris 19:23nope gchiu 19:25Ok, when I have some time hiiamboris 19:25:+1: gchiu 19:31I think what's happening is that the on-down event is being processed before the text-list face is being updated. So, when I used the on-down to look at face/selected, it gets the wrong result 19:32it then completes the processing of my action in the on-down, and then finally it updates the text-list face 19:33That's why when there's no selected entry, I get a -1 for face/selected zentrog:matrix.org 19:36I know I can set multiple values like so >> set [a b] [3 4] == [3 4] Is there a way to do it with paths? >> info: [a: 1 b: 2] == [a: 1 b: 2] >> set [info/a info/b] [3 4] *** Script Error: invalid argument: info/a *** Where: set hiiamboris 19:41nope 19:41but you can do set bind [a b] info [3 4] if it's an object zentrog:matrix.org 19:45thanks! greggirwin 19:47@gchiu on-down triggers before the text-list has updated itself, so you do want to use on-change or on-select. 19:47https://github.com/red/docs/blob/master/en/view.adoc#text-list 19:51This shows that the selection doesn't change until your actor has finished. Mouse down and hold the button down until it updates to see it in action. view [text-list data ["A" "B" "C" "D"] on-down [print 'down wait 2]] 19:51So your display-data interrupts the flow in human time, because it takes a while to run. gchiu 19:51Ah, good Wednesday 17th November, 2021 gchiu 05:32Seeing similar issues with on-select greggirwin 19:09It's going to be an issue with all native widgets and events that don't have a separate UI thread for rendering, which has its own issues, and ends up leading to a fully async model like JS. 19:12A common way around this is to set flags on the event, then have a timer running which checks flags and triggers the long running processes. It's not a perfect solution, because as long as the processes can block everything, there's still a delay. It just moves it from where the user sees it most. You can also use "Loading..." messages, disable the list while loading to prevent extra triggers, etc. Thursday 18th November, 2021 gchiu 09:53Can i do my http read which fetches the data asynchronously? I think that's how r3gui worked. Or is read blocking only? rebolek 09:56in the IO branch, you can do it asynchronously, in master branch it’s blocking gchiu 20:32> in the IO branch, you can do it asynchronously, in master branch it’s blocking Got an example of asyn HTTP read? Friday 19th November, 2021 qtxie 02:05@gchiu No HTTP support in the IO branch for now. Only TCP, UDP, TLS and DNS are available. rebolek 06:46@gchiu [Here](https://gitlab.com/rebolek/castr/-/blob/open-url/open-url.red) is HTTP client for the IO branch, I haven’t tested it with GUI yet, but I guess it should work. abdllhygt 13:59hi! 13:59can I compile without using libcurl? rebolek:matrix.org 15:38I guess IO branch should not require libcurl, but I haven't checked, so I may be wrong. abdllhygt 21:04@rebolek:matrix.org thank you Saturday 20th November, 2021 gchiu 19:05What's happening here? 19:05>> load "5-12-2001" == 5-Dec-2001 >> to date! "5-12-2001" *** Script Error: cannot MAKE/TO date! from: "5-12-2001" *** Where: to *** Stack: rebolek 19:07The behaviour of load and to is different, there is a table in the Wiki, I try to find it. That doesn't mean it's definite and can't be changed. gchiu 19:07I see 19:08I can work around these things if it's by design rebolek 19:09There's this https://github.com/red/red/wiki/%5BDOC%5D-%60to%60-vs-%60make%60 but there'đ also a table with documented behavior I believe. RayMPerry 21:15Howdy. 21:17I was slapping [this](https://github.com/RayMPerry/kitchen-sink/blob/master/red/photo-booth.red) together last night and I'm having an issue where the countdown/visible?: false is not taking effect in time. Would anyone know of a way to force this update to happen or perhaps a better way to structure this code so, I don't have to break the event loop flow? greggirwin 23:58to does not always fall back to load from strings. In the case of date, the main conversion is used for [epoch times](https://github.com/red/docs/blob/master/en/datatypes/date.adoc#conversions). Sunday 21st November, 2021 hiiamboris 07:48@RayMPerry it's not even clear what's happening or what do you expect 07:48I get number 1 imprinted on Ubuntu, but not on W10 and also most of the pictures are empty on W10 07:52both are bugs obviously, worth reporting, because you're taking snapshot of the camera face, so you should expect a photo without other faces 07:54actually, we already have 2 reports about blank photos: https://github.com/red/red/issues/3839 https://github.com/red/red/issues/3176 but not about faces imprinted onto photo GiuseppeChillemi 12:28Now I am starting to have a large project. How should I write a set of tests to see if everything is working after my changes? hiiamboris 13:20This is how [I do it](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/new-each.red#L578) greggirwin 17:53@GiuseppeChillemi sometimes, like @hiiamboris, I will include a test suite directly in a library of functions. But in larger systems I have separate test scripts. If you're only testing (pure-ish) functions and their results, the first approach works fine. If there is any state involved, or setup and teardown of resources, having all that in one script ensures that one test doesn't affect another. Monday 22nd November, 2021 Respectech 16:42I've just installed Mint 20.2 on my Lenovo tower, but I can't get Red to run on it. Any ideas? bo@Bo-Legion-i7:~/Downloads$ ./red-064 /home/bo/.red/console-2018-11-22-8164: error while loading shared libraries: libcurl.so.4: cannot open shared object file: No such file or directory bo@Bo-Legion-i7:~/Downloads$ sudo apt install libcurl4 Reading package lists... Done Building dependency tree Reading state information... Done libcurl4 is already the newest version (7.68.0-1ubuntu2.7). hiiamboris 16:44you need 32-bit version 16:45instructions [here](https://www.red-lang.org/p/download.html) Respectech 16:51Sometimes I just need to read a little. It says so right below the download section. Thanks for getting back to me so quickly. hiiamboris 17:11☻ gltewalt:matrix.org 19:38Mint has been hiccup free for me. No desire to return to windows. Respectech 20:05I'm using Mint on a few systems for the past year or two. It seems really solid. rebolek:matrix.org 20:24I installed Mint for my dad instead of Windows and now I need to do almost zero maintenance for him instead of like once a week. Wednesday 24th November, 2021 rebred 07:21 test: "testing^/" take/last/part test 1 is this the best way to remove a newline at the end of a string ? hiiamboris 07:26take/last? 07:27trim/tail/with test lf? rebolek 07:27also trim/tail rebred 07:28@rebolek @hiiamboris thank you!! planetsizecpu 09:35@rebred also alter test "^/" Sunday 5th December, 2021 abdllhygt 19:27hi again! @rebolek I tried IO branch for compiling without curl, but it seems it still requires it, do you have another idea? Monday 6th December, 2021 qtxie 01:10@abdllhygt It still uses libcurl for HTTP on IO branch for now. Sunday 12nd December, 2021 abdllhygt 14:10@qtxie thank you Monday 13th December, 2021 Moppy_gitlab 11:09 Red [Title:Prime Finder] max: ask "give an integer: " numbs: [] repeat i (load max) [ numbs: append numbs i ] i: 2 while [i < (length? numbs)] [ j: (i + 1) while [j <= (length? numbs)] [ if (pick numbs j % pick numbs i = 0) [ print [pick numbs j " " pick numbs i] remove numbs j] j: j + 1 ] i: i + 1 ] 11:11this program doesn't work. Numbers like 2 and 3 get removed for seemingly no reason. Also, if I write numbs/j and numbs/i, instead of using pick, I get none! errors GalenIvanov 11:11Hi @Moppy_gitlab and welcome! Moppy_gitlab 11:12hi GalenIvanov 11:12your last questin first: use numbs/:i 11:13if you want to use some expression as an index, you can put it in parens: numbs/(i + j) (as well as numbs/(i)) hiiamboris 11:16if you type ? remove in console you'll see it's not accepting your j argument 11:17? at may help you here Moppy_gitlab 11:17so, how do I remove a specific element from an array? GalenIvanov 11:17The parentheses in your code are unnecessary. They are use primarily to specigy the evaluation order 11:18remove takes only one argument hiiamboris 11:18if ? at is not immediately clear to you, I suggest skimming thru http://www.rebol.com/docs/core23/rebolcore-6.html Moppy_gitlab 11:19rebol has a for loop, while red doesn't seem to, so I don't know how accurate rebol documentation would be hiiamboris 11:20language model is the same, even core functions are *mostly* similar Moppy_gitlab 11:20my interpreter accepts remove as I've written it, so I don't know what you mean by it not accepting it. hiiamboris 11:21 >> add 1 2 3 4 5 6 7 == 7 does it look like add accepted 7 arguments? Moppy_gitlab 11:21it didn't return an error... hiiamboris 11:22indeed :) 11:23Redbol langs use fixed arity, because this way they don't need any evaluation syntax, like add (1, 2), just add 1 2 is enough 11:23drawback of that is if you don't use a value, it gets lost, and that's it, no error about it Moppy_gitlab 11:24is that for performance reasons? hiiamboris 11:25mostly for readability I think (compare to Lisp and it's braces) Moppy_gitlab 11:26I actually have some experience with lisp hiiamboris 11:26good Moppy_gitlab 11:26http://www.rebol.com/docs/core23/rebolcore-6.html#section-2 11:27I don't see anything about numerical index removal GalenIvanov 11:27Maybe you need to master navigating series first hiiamboris 11:28@Moppy_gitlab clause 1.6 there GalenIvanov 11:29reduce takes only one argument - a series and removes the value at the same index hiiamboris 11:29in any case, R2 core manual is a **strongly** recommended reading, because it will save you a lot of time in the long term Moppy_gitlab 11:31I don't get the concept of navigation. GalenIvanov 11:32how you move in a series Moppy_gitlab 11:34so instead of the variable referencing the entire series, it references a specific position in the series, and I have to move where it references GalenIvanov 11:37something like that 11:38as @hiiamboris pointed out, you need to read the R2 docs carefully. [Traversing a Series](http://www.rebol.com/docs/core23/rebolcore-6.html#section-1.1) 11:48@Moppy_gitlab do you want me to show you an example how to remove a value from a series? Moppy_gitlab 11:48I think this could work 11:49 [remove (skip numbs j) head numbs] GalenIvanov 11:49have you tested it? Moppy_gitlab 11:50yes 11:50I think the problem is after removal j and i lose their intended meaning 11:51this might be the worst way to find prime numbers in Red come to think of it GalenIvanov 11:52ok. You don't need the parentheses. And be careful when choosing between skip and at - they are similar, but not equivalent Moppy_gitlab 11:53I like the parentheses tbh. That's why I added them GalenIvanov 11:59did you change pick? Moppy_gitlab 11:59yes 12:00also, first and next don't seem to be working in the console. First doesn't change after I use next. 12:00 >> first list == 2 >> next list == [3 4 5] >> first list == 2 GalenIvanov 12:01next just returns the series at the next index and doesn't sets it. 12:01list: next list Moppy_gitlab 12:02I see 12:02I think this can help me 12:02with the index issue GalenIvanov 12:04I think it's more convenient to use reduce at series index (instead of skip) 12:05 >> a: [1 2 3 4 5 6 7 8] == [1 2 3 4 5 6 7 8] >> head remove skip a 3 == [1 2 3 5 6 7 8] 12:06skip uses offset and that's why 1 more than when using index 12:06 >> a: [1 2 3 4 5 6 7 8] == [1 2 3 4 5 6 7 8] >> head remove at a 3 == [1 2 4 5 6 7 8] 12:07Maybe you already know that Red uses 1-based indexing? Moppy_gitlab 12:07yeah, I thought that was strange 12:11Here's my loop so far, I'm getting a % does not allow a block as first value error 12:11 i: 2 while [i < (length? numbs)] [ numbs: at numbs (i + 1) while [(tail? numbs) = false] [ if (first numbs % numbs/:i = 0) [remove numbs numbs: head numbs] ] i: i + 1 ] hiiamboris 12:13well, insert more parens until you find time to figure out evaluation order :) Moppy_gitlab 12:16I don't know why first numbs is considered a block... GalenIvanov 12:20op!- infix functions of two arguments like %are evaluated before functions, so Red tries to find numbs % numbs/:i first and numbs is a block! value Moppy_gitlab 12:36okay. So now % returns a none! error. I think I'm making progress though 12:36 i: 2 while [i < (length? numbs)] [ numbs: at numbs (i + 1) while [(tail? numbs) = false] [ print (first numbs) either ((first numbs) % numbs/:i = 0) [ remove numbs ] [ numbs: next numbs ] ] numbs: head numbs i: i + 1 ] 12:39maybe, the length of numbs isn't reevaluated every loop hiiamboris 12:43 4 print 4 => unset numbs => [4 5] first numbs => 4 numbs/:i => 5 % 4 numbs/:i => 4 4 = 0 => false numbs => [4 5] numbs: next numbs => [5] either false [remove => [5] numbs => [5] tail? numbs => false = false false => true numbs => [5] first numbs => 5 5 print 5 => unset numbs => [5] first numbs => 5 numbs/:i => none % 5 numbs/:i => make error! [code: 310 type: 'script id: *** Script Error: none! type is not allowed here *** Where: % *** Stack: show-deep-trace trace-deep also 12:44this is the trail of your loop evaluation (with max=5) Moppy_gitlab 12:46shouldn't first numbs always be larger than numbs/:i 12:47or rather higher up the list 12:49wait, I guess numbs/: is also relative to the current position hiiamboris 12:50yep Moppy_gitlab 12:59at this point I'm considering making a second array GalenIvanov 12:59@hiiamboris nice trace! Moppy_gitlab 13:00I don't know how you guys live without absolute position 13:06Wiat 13:06I got it 13:07 Red [Title:Prime Finder] max: ask "give an integer: " numbs: [] repeat i (load max) [ numbs: append numbs i ] i: 2 while [not numbs/:i = none] [ comp: numbs/:i numbs: at numbs (i + 1) while [(tail? numbs) = false] [ either ((first numbs) % comp = 0) [ ;i is also relative to the current position remove numbs ] [ numbs: next numbs ] ] numbs: head numbs i: i + 1 ] print numbs 13:07it works 13:08A night of sleep well used. hiiamboris 13:11@GalenIvanov thanks :) it's a WIP so far, trying to adapt my show-deep-trace for the new instrumentation (which is a bit buggy still) GalenIvanov 13:12:+1: 13:31@Moppy_gitlab I wrote this prime-sieve function some months ago when trying to make an example of remove-each: 13:31 prime-sieve: function [ "Finds the prime numbers less then or equal to n" n [integer!] "upper limit" ][ primes: make block! n / log-e n append primes 2 i: 1 odd-n: collect/into [ while [n >= i: i + 2] [keep i] ] make block! n / 2 while [not empty? odd-n] [ append primes prime: take odd-n remove-each odd odd-n [zero? odd % prime] ] primes ] 13:31 >> print prime-sieve 200 2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103 107 109 113 127 131 137 139 149 151 157 163 167 173 179 181 191 193 197 199 Moppy_gitlab 14:18huh, there's a lot of syntax in there I'm not familiar with. I've pretty much only read part of http://redprogramming.com/Getting%20Started.html 14:19I wish its explanation of arrays was more robust GalenIvanov 14:21Maybe [A short introduction to Red for Python programmers](https://github.com/red/red/wiki/A-short-introduction-to-Red-for-Python-programmers) will help you? hiiamboris 14:27@GalenIvanov idk about "short" ☻ GalenIvanov 14:28The road to hell is paved with good intentions :smile: Moppy_gitlab 14:33Well, it certainly looks in depth, and it was edited recently. Thanks. GalenIvanov 14:45I need to rename it "A not so short introduction..." :smile: hiiamboris 14:47:D planetsizecpu 15:23Welcome btw @Moppy_gitlab Moppy_gitlab 21:30Thank @planetsizecpu 21:31Added this line to make it more efficient if (comp > (sqrt (last numbs))) [break] 21:31My program works, but I'm guessing the way I did it isn't considered good practice. greggirwin 22:34Welcome @Moppy_gitlab. > I don't know how you guys live without absolute position Red is quite different in many respects. Coming from a background in other languages means letting go of how they work in many cases. As pieces click into place, you'll probably find that Red works very naturally. As you transition, you can also easily write wrappers that are comfortable for you. e.g. >> blk: [a b c d e f g] == [a b c d e f g] >> remove-at-index: func [series [series!] index [integer!]][head remove at series index] == func [series [series!] index [integer!]][head remove at series index] >> remove-at-index blk 3 == [a b d e f g] >> remove-at-index blk 5 == [a b d e g] 22:35It's also quite fun and instructive to write tasks like your sieve out in natural language or pseudo-code, then figure out how to express each aspect. 22:35Thanks for your trace experiments and helping debug interpreter events @hiiamboris. :+1: 22:36Nice sieve @GalenIvanov. :+1: Moppy_gitlab 22:50@greggirwin I'm assuming wrappers can be passed blocks, and blocks can be other functions. I can see how that would be more elegant than passing lambdas to a function in a lisp. greggirwin 22:52When you start passing blocks (look at remove-each for example, other factors (like binding) come into play, but yes it works. Not to overload you. :^) Ultimately it comes down to the fact that blocks are *not* evaluated by default, so you *can* pass them around like thunks. 22:55The important thing is to be patient with yourself as you learn Red's rules, and have fun. Moppy_gitlab 23:35I've been trying to do this for a while. The result is nothing happening or a "index-print is missing its index argument" error. I'm not sure if I need to use some refinement of do or what for: func [current [integer!] end [integer!] process [block!]] [ if (not current = end) [ do process current for current + 1 end process ] ] index-print: func [index [integer!]] [print index] for 0 10 [index-print] 23:40do process /args current didn't work either greggirwin 23:48How do you think index-print is getting its arg? By writing control flow funcs, you're diving right into the deep end. :^) Moppy_gitlab 23:51So I have to take into account how arguments are being passed, and can't just do it whenever? greggirwin 23:53Red may *seem* like magic at times, but it's not. :^) In your example, where do you *think* index-print would get its arg? Try do [index-print] and see what happens. 23:54Or just index-print in the console, as that's the same thing. Moppy_gitlab 23:56I thought do "unpacked" the block, and then let it be passed arguments, since it has an /args refinement. Guess not. 23:57maybe probe would work? greggirwin 23:58do simply evaluates the block. What is in the block is evaluated. Blocks are simply data, and don't have arguments. 23:59Understanding values, blocks, words, and evaluation are the foundations of Red. 23:59I can tell you're anxious, but start with the basics. Tuesday 14th December, 2021 Moppy_gitlab 00:37I've figured it out for: func [current [integer!] endv [integer!] process [block!]] [ if (not current = endv) [ inner: func process/1 process/2 inner current for current + 1 endv process ] ] index-print: [[index [integer!]] [print index]] for 0 10 index-print greggirwin 00:48It's a bit convoluted ;^), but you will start to see how flexible Red is as you progress. I'm sure people will chime in with other versions. 00:55You've absolutely go the idea that you can use blocks as data to make funcs, which is great. Here's a slight variation, based on R2's for. for: function [ 'word [word!] start [integer!] end [integer!] body [block!] ][ do-body: func reduce [word] body index: start while [index <= end][ do-body index index: index + 1 ] ] index-print: func [index [integer!]] [print index] for i 0 10 [index-print i] Moppy_gitlab 01:42the purpose of [word] in func reduce [word] body confuses me a bit. I'm guessing it's like a placeholder parameter for body? Rebol's reduce documentation doesn't mention anything like this http://rebol.com/docs/words/wreduce.html 01:44I guess the word documentation covers that 02:07Okay, looking at it some more, I see that body has a value passed to it that's equivalent to 'word and is like an encapsulated function call. 02:13This still seems dependent on a mysterious property of reduce I can't find anything on. Putting ['word] before reduce doesn't work. gltewalt:matrix.org 02:25Why would it work? Reduce works on the inert data in a block. gltewalt 02:34'the' block greggirwin 02:39@Moppy_gitlab some of this comes back to you trying to run before you know how to walk. :^) Play with do and reduce in the console. Play with words and lit-words. Note the special lit-arg (literal word as an argument) in my for. It shouldn't take long before things start to make sense. Moppy_gitlab 02:45alright gltewalt:matrix.org 05:01I still walk funny ldci 17:57@GalenIvanov Very nice prime-sieve function :) GalenIvanov 19:05@ldci Thanks! :smile: Wednesday 15th December, 2021 Moppy_gitlab 04:39Just to be clear reduce [1 + 2] [3 + 5] reduces both blocks, right? 04:40actually, I think it only reduces the first one 04:46I think I get how d: func [in [integer!]] [print in] ;function body t: func reduce ['in [integer!]] [d in] is evaluated now. 04:48the arguments in t's function are evaluated by reduce, which sets the in value. The body is a call to d with in passed to it. 05:07 for: func [current [integer!] endv [integer!] process [block!]] [ if (not current > endv) [ inner: func reduce ['i [integer!]] process inner current for current + 1 endv process ] ] index-print: func [index [integer!]] [print index] for 0 10 [index-print i] 05:10It's nice how you can put anything in a block and Red doesn't mind. Like it doesn't care than i in the for's call isn't defined because i is in a block. 05:22I see the [integer!] in ['i [integer!]] is unnecessary ldci 08:17@Moppy_gitlab Based on Gregg' sample: for: function [ 'word [word!] ;--iteration counter; not local to loop start [integer!] ;--starting index end [integer!] ;--ending index step [integer!] ;--index step, default 1 body [block!] ;--data block to be executed ][ do-body: func reduce [word] body index: start while [index <= end][ do-body index index: index + step ] ] ;--test for i -10 10 5 [print i] Moppy_gitlab 15:11@ldci this actually works d: func [in [integer!]] [print in] t: func ['i] [d i] t 10 so why is reduce necessary in the for function, but not the above context? hiiamboris 15:16http://www.rebol.com/docs/core23/rebolcore-9.html#section-3.2 15:18don't read the 3.3 clause though - doesn't apply to Red 15:21idk if we have any docs on this 15:21in other words: - i evaluates next expression - 'i does not evaluate words and paths only - :i never evaluates next token whatever it may be rebred 15:57we have a string str: {test24|test432|test9454|test011^/test342|test8745|test4|test637^/test1|test2|test3|test4^/} right now we are doing test: parse str [collect [any [keep any to newline skip]]] b: [] repeat x length? test [ append/only b split test/:x "|" ] probe b to get b: [["test24" "test432" "test9454" "test011"] ["test342" "test8745" "test4" "test637"] ["test1" "test2" "test3" "test4"]] is there a way to do everything in parse? hiiamboris 16:04hopefully soon enough everything will be possible in split :) 16:05why do you want to use parse instead of another split here? rebred 16:06@hiiamboris is it split faster then parse ? hiiamboris 16:06no, but it's easier to use 16:08for instance, why you wrote keep any to newline and not keep to newline? 16:09any to cannot possibly match more than once rebred 16:12@hiiamboris it's working this way but thanks for simplifying it ! now do you know how to add the "|" to parse ? hiiamboris 16:13certainly, you just need another, outer any loop with another keep collect [..] inside it rebred 16:15@hiiamboris thank you Moppy_gitlab 16:16@hiiamboris yeah https://github.com/red/red/wiki/A-short-introduction-to-Red-for-Python-programmers#words doesn't mention literal words hiiamboris 16:17it's a tutorial, not a reference :) 16:20I think https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#741-function-type 7.4.1.2a explains it 16:21but this info should be available in some less wordy document as well 16:22found also https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#literal-arguments-and-get-arguments (which was probably the source of 7.4.1.2a info above) toomasv 16:46@rebred With split it might be either str: {test24|test432|test9454|test011^/test342|test8745|test4|test637^/test1|test2|test3|test4^/} split str [first by lf then by "|"] == [["test24" "test432" "test9454" "test011"] ["test342" "test8745" "test4" "test637"] ["test1" "test2" "test3" "test4"] [""]] or split/group str ["|" lf] == [["test24" "test432" "test9454" "test011"] ["test342" "test8745" "test4" "test637"] ["test1" "test2" "test3" "test4"]] Which one would you prefer and why? rebred 17:07@toomasv with split str [first by lf then by "|"] I get *** Script Error: split does not allow block! for its dlm argument *** Where: split *** Stack: split and with split/group str ["|" lf] I get *** Script Error: split has no refinement called group *** Where: split *** Stack: split it may because I am on linux and using red version 0.6.4 17:11@toomasv I am on linux version 0.6.4 because I am using a VPS and the new Red doesn't work on headless servers - complains about the lack of video output - the other reason is that when you first launch Red as a CGI it takes 1 minute to compile - so someone compiled it for me without the graphic part and without the need to be compiled at first launch 17:13@toomasv I just was curious how could have it been done with parse that's all ! toomasv 17:40@rebred It is not available yet as design is not final. But it would be good to see what people prefer an why. Moppy_gitlab 18:11so what does reduce ['literal] actually do? 18:15my guess, is that reduce is necessary in for because current hasn't yet been given a value 18:18and because I'm calling a function within a function, I have to specify that whatever the inner function is passed needs to be evaluated first hiiamboris 18:31how can you verify your guess? Moppy_gitlab 18:50I removed the inner function call, and there was no error 18:50even when I removed reduce 18:51nothing happened though, since there was no function call anymore 18:54If I were to do this d: func [in [integer!]] [print in] t: func ['i] [d i] t current I would get an error since current hasn't been defined. hiiamboris 19:08you can use probe, ? and ?? to inspect any value 19:08and playing in console with your code is the best way to learn gchiu 22:19What's the current status of the json modules? 22:19I tried json.red and 22:19>> load-json to-json [a: 1 b: [c: 3]] *** Script Error: insert/only does not allow none! for its series argument *** Where: insert *** Stack: load-json emit 22:20can't seem to round trip Moppy_gitlab 22:59So after lots of trial and error, I've realized reduce ['literal] is only necessary because of strong typing. This actually works zentrog:matrix.org 23:00@gchiu: It basically works for me, but the output is a bit different... >> load-json to-json [a: 1 b: [c: 3]] == ["a:" 1 "b:" ["c:" 3]] Though I guess it is expecting map! for key/value pairs, instead of block!. >> load-json to-json #(a: 1 b: #(c: 3)) == #( a: 1 b: #( c: 3 ) ) Moppy_gitlab 23:00 for: func [current endv [integer!] process [block!]] [ if (not current > endv) [ inner: func [i] process inner current for current + 1 endv process ] ] index-print: func [index] [print index] for 0 load ask "give integer: " [index-print i] 23:01I still don't know why strong typing has this effect though. Oldes 23:14@Moppy_gitlab does this make it clear? >> f: func['a b][?? a ?? b] x: 1 y: 2 f x y a: x b: 2 Moppy_gitlab 23:15@Oldes so, when the argument is literal, it gets passed a reference, not a value. To get the value, you need to reduce the reference. Oldes 23:16yes zentrog:matrix.org 23:16@Moppy_gitlab: Since you are using func, inner is being defined globally. You can do ?? inner to see what it was defined as. Moppy_gitlab 23:17That makes me wonder why'd you ever want to pass a reference instead of a value... 23:18Thank you very much for helping me see that @Oldes gchiu 23:24> @gchiu: It basically works for me, but the output is a bit different... > > >> load-json to-json [a: 1 b: [c: 3]] > == ["a:" 1 "b:" ["c:" 3]] > > Though I guess it is expecting map! for key/value pairs, instead of block!. > > >> load-json to-json #(a: 1 b: #(c: 3)) > == #( > a: 1 > b: #( > c: 3 > ) > ) > which version of json.red are you using? I used https://raw.githubusercontent.com/greggirwin/red-json/master/json.red Thursday 16th December, 2021 rebred 00:04 data: {test24|test432|test9454|test011^/test342|test8745|test4|test637^/test1|test2|test3|test4^/} data1: parse data [collect [any [keep to newline skip]]] data2: [] repeat x length? data1 [ append/only data2 parse data1/:x [collect [any [keep to ["|" | end] skip ]]] ] probe data2 is there a way to combine these two parse scripts in one? 00:17I may have figured it out... data1: parse data [collect [any [copy a1 to newline keep (parse a1 [collect [any [keep to ["|" | end] skip ]]]) skip]]] can it be made faster then this ? Moppy_gitlab 01:58why does next next next block4 return [], and not [[1 [1]] 1]]] ? >> block4: [[1] 1 [[1] [1 [1]] 1]] >> next block4 == [1 [[1] [1 [1]] 1]] >> next next block4 == [[[1] [1 [1]] 1]] >> next next next block4 == [] >> next next next next block4 == [] >> 02:01hmm, I think the third element is connected wrong. 02:01so I wrote it wrong. I see there's only three elements. 02:14I wrote a block depth finder block1: [1 1 1 1 1 1 1 1] block2: [[1] 1] block3a: [[[1]]] block3: [[[1]] 1 [1 [1]]] block3b: [[1] 1 [[1]]] block4: [[1] 1 [[1] [1 [1]] 1]] finder: function [ block /continue deepest ][ either continue [current: deepest] [current: 1] ;allows default value for argument if (tail? block) [return deepest] either (block? first block) ;if the first element is a block [either (finder/continue first block do current + 1) > ;if I go into the first block (finder/continue next block current) ;if I continue [finder/continue first block do current + 1] [finder/continue next block current]] [finder/continue next block current] ] 04:21another use of reduce and references grid2: [ ['.' '.' '.' '.' '.' '.'] ['.' 'O' 'O' '.' '.' '.'] ['O' 'O' 'O' 'O' '.' '.'] ['O' 'O' 'O' 'O' 'O' '.'] ['.' 'O' 'O' 'O' 'O' 'O'] ['O' 'O' 'O' 'O' 'O' '.'] ['O' 'O' 'O' 'O' '.' '.'] ['.' 'O' 'O' '.' '.' '.'] ['.' '.' '.' '.' '.' '.'] ] repeat x length? grid2/1 [ print repeat y length? grid2 [ prin grid2/(reduce y)/(reduce x) ] ] 04:26I don't know why repeat i 6 [i + 1] doesn't return an error, repeat doesn't automatically reduce any instance of its iterator word since grid2/y doesn't work toomasv 05:10grid2/:y or grid2/(y) Moppy_gitlab 05:17huh, I guess path words not being evaluated is why i: what-dir i append /filename works 05:23so there's situations where allowing for symbolic arguments is desirable toomasv 05:31Right, lots of, actually most, I think. 05:34In paths, I mean. In funcs, seldom. Moppy_gitlab 06:24So in this case, I'm basically going from a reference to a symbol, to the symbol itself w: function ['reference [word!]] [in: func reduce [reference] [print i] in 5] w i toomasv 06:44Yes, reference wil refer to i, i will refer to 5. But it is not the usual variable/value thing. Oldes 07:47@Moppy_gitlab it was already mentioned above, but this is also good to know: >> f: func['a][?? a ?? :a] x: 1 f x a: x x: 1 (no need to do reduce a) - although if you need a block with the value like in your _func_ case, you cannot avoid the reduce call. Moppy_gitlab 17:54I want to put any generic value at the beginning of a series. Insert seems like a good candidate for this, however it only returns the original series while setting the original series to the inserted version. This doesn't work in functions though. block: [1 2 3 4 5] feeder: function [inblock] [ duplicate: inblock insert copy/part duplicate (length? inblock) - 1 last inblock print duplicate ] ] feeder block This print 1 2 3 4 5, instead of 5 1 2 3 4. Additionally, functions in red return their last result by default, but this is hidden. Is there anyway to change this behavior, so called functions will always return their last result? hiiamboris 18:00I don't understand what do you want returned. Also you're copying stuff and then discarding the modified copy. Oldes 18:02insert blk take last blk 18:02Ech.. shoild be take/last toomasv 18:03@Moppy_gitlab insert returns series after inserted part. Use head insert... to get the head. Oldes 18:03I should not be posting from a phone:/ 18:06Your duplicate is not a duplicate. You should do blk: copy inblk Moppy_gitlab 18:09Yeah, this works insert inblock take/last inblock print head inblock 18:11@hiiamboris the last thing feeder computes is a modified inblock. To see the modified inblock, I have to write print head inblock. If I were to use recursion, I'd like to see only the last thing computed without every iteration printing the result. 18:12Basically, I'm looking for the same printing behavior you'd see in a lisp hiiamboris 18:14why not put print outside the func then? Moppy_gitlab 18:21hmm, that seems to work. When I tried doing that before in the case of one function calling another, it printed none, but I guess that was because my second function returned that last... 18:56this is odd http://www.rebol.com/docs/core23/rebolcore-16.html#section-2.8 > Inserting into a list modifies its reference to just after the point of insertion. Removing the element currently referenced in a list causes the reference to reset to the tail of the list 18:58Red is modeled on rebol 2, but modifies its reference to after the point of insertion like lists in rebol 2 18:59 >> ?? list! list!: unset! >> f: [1 2] == [1 2] >> any-list? f == true >> hiiamboris 19:09> causes the reference to reset to the tail of the list this is what I find odd :) looks like R2 docs are not infallible Moppy_gitlab 19:21none? and tail? have interesting behavior >> none? first [] == true >> tail? [none] == false 19:25in racket it's like > (empty? '()) #t > (empty? empty) #t > (empty? (first '())) ; first: contract violation ; expected: (and/c list? (not/c empty?)) ; given: '() gurzgri 19:26in REBOL first on an empty list throws an error, in Red it returns none, which is why none? probe first probe [] is the same as none? none which of course is true. In the second example, the block [none] isn't positioned at it's tail (after the last value), but tail? probe next probe [none] is. Moppy_gitlab 19:30@gurzgri interesting. Is there an advantage to first on an empty list returning none? gurzgri 19:37The rational afaik is "throwing less errors where reasonable results can be supplied". In REBOL pick [] 1 yields none but first [] gives an error, in Red both expressions evaluate to none. So Red is essentially more consistent here, I'd say. 19:41Another example of that same principle is https://github.com/red/red/wiki/%5BDOC%5D-Differences-between-Red-and-Rebol#invalid-block-selector-returns-none 19:47Normally, dealing with potential none values allows for cleaner, easier to read code than protecting against errors thrown or verbose handling of edge cases. 20:01probe btw is probably one of the most valueable words when exploring Red as you can put in between expressions virtually anywhere without introducing side effects when learning, understanding and debugging Red code. Moppy_gitlab 20:08The next thing I'll try to do it recreating this program in Red, to find every combination of elements in a starting block. I don't know yet how I'll go about it, but I want the basic approach to be the same. 20:08https://pastebin.com/LdfUvG43 20:10now that I know how first [] works, maybe I can naively copy it 1:1, but Red doesn't have a cons-like function Oldes 20:15@gurzgri You should differentiate Rebol2 from Rebol3. gltewalt:matrix.org 20:18insert or make for cons gurzgri 20:18@Oldes Indeed! Moppy_gitlab 20:20 block: [1 2 3 4 5] starter: func [inblock [block!]] [ either none? first inblock [ [] ][ insert starter copy next inblock first head inblock ] ] Oldes 20:26You should replace none? first inblock with empty? inblock 20:29What the starter is supposed to do? 20:33I don't know if it is supported in Red (I'm now on mac, so no Red), but in Red there is also swap action: >> ? swap USAGE: SWAP series1 series2 DESCRIPTION: Swaps elements between two series or the same series. SWAP is an action! value. ARGUMENTS: series1 [series! gob!] At position (modified). series2 [series! gob!] At position (modified). >> b: [1 2 3] swap b back tail b == [3 2 1] greggirwin 20:43@Moppy_gitlab it doesn't look like anyone mentioned it, but I don't know what datatype you expect the values in grid2 to be, or their exact contents, in your message [here](https://gitter.im/red/help?at=61babec54024f534f2c068b7). Single quoting, as other langs use for strings, isn't used in Red. >> grid2/1 == ['.' '.' '.' '.' '.' '.'] >> grid2/1/1 == '.' >> type? grid2/1/1 == lit-word! >> print grid2/1/1 .' Moppy_gitlab 21:20@greggirwin I just copied that same array I used in a python program >> ? 'g' 'g' is a lit-word! value. I see now that Red thinks it's a literal world. 21:25@Oldes that works nicely >> empty? [] == true >> empty? none == true >> empty? first [] == true 21:28The starter function is supposed to return a block that is the reverse of the one first given to it Oldes 21:30You mean this? >> reverse [1 2 3 4] == [4 3 2 1] Moppy_gitlab 21:30@Oldes yeah, but I want to do it recursively for its own sake Friday 17th December, 2021 gchiu 02:14I updated my red client to webserver so that the webserver just returns json, which the client now reads. Just needed to know json was baked in. So R is done, just need to concentrate on U and maybe D. Moppy_gitlab 06:19Yeah, it's not working out so great. Red [Desc:find every combination of elements in a block] block: [1 2 3 4 5] starter: function [inblock [block!]] [ either empty? inblock [ [] ][ packer first head inblock reduce [starter copy next inblock] ] ] packer: function [f r [block!]] [ either empty? r [ none ] [ append reduce [orderer f first r] reduce [packer f copy next r] ] ] orderer: function [f r] [ either empty? r [ reduce [f] ] [ append reduce [f r] inserter reduce [first r] reduce [orderer f copy next r] ] ] inserter: function [f r] [ either empty? r [ none ] [ append reduce [f first r] reduce [inserter f copy next r] ] ] probe starter block [[1 [[2 [[3 [[4 [[5] none] [[5]] [4 [none] [none] [4] none] none] none] [[4 [[5] none] [[5]] [4 [none] [none] [4] none] none]] [3 [none] [none] [3] none] none] none] [[3 [[4 [[5] none] [[5]] [4 [none] [none] [4] none] none] none] [[4 [[5] none] [[5]] [4 [none] [none] [4] none] none]] [3 [none] [none] [3] none] none]] [2 [none] [none] [2] none] none] none] [[2 [[3 [[4 [[5] none] [[5]] [4 [none] [none] [4] none] none] none] [[4 [[5] none] [[5]] [4 [none] [none] [4] none] none]] [3 [none] [none] [3] none] none] none] [[3 [[4 [[5] none] [[5]] [4 [none] [none] [4] none] none] none] [[4 [[5] none] [[5]] [4 [none] [none] [4] none] none]] [3 [none] [none] [3] none] none]] [2 [none] [none] [2] none] none]] [1 [none] [none] [1] none] none] none] 06:32Even if I managed to get it to work with the right combination of append, insert and reduce, it would be really far from elegant. Another approach to this problem better suited for Red would be preferable. hiiamboris 09:04What exactly is the output? Oldes 09:32I was going to ask the same... could you provide examples, what are your functions supposed to do? I'm having problems to read your code. hiiamboris 09:54from the description, it should be smth like this: https://gitter.im/red/red?at=6051dc673a9448256c0f8f78 Moppy_gitlab 10:00@hiiamboris I put the output right below my code. Honestly, I'm not 100% sure what each function is supposed to do, but the general idea is putting every element in every place. starter receives the block and feeds its first element and itself to packer. packer, puts every permutation in a block. orderer puts f before the rest and after by calling inserter. inserter puts f before rest. I know this is very confusing, but the racket code works. 10:04which is here https://pastebin.com/LdfUvG43 hiiamboris 10:05so what is none doing there if there was no none in the original? Moppy_gitlab 10:05there was empty in the original, and none is closest analog in Red I think 17:20 >> mold/only [] == "" greggirwin 17:23@Moppy_gitlab Note that in your header, you should have a space after the colon, and use quotes around the text to make it a string. Red [Desc:find every combination of elements in a block] Red [Desc: "Find every combination of elements in a block"] But, for fun, you could analyze yours and see what values it contains. Moppy_gitlab 17:31 probe system/script/header doesn't return anything. It returns none if I add a space greggirwin 17:36Just paste the block in a console and play. >> blk: [Desc:find every combination of elements in a block] == [Desc:find every combination of elements in a block] mikeyaunish 17:51Has there been any discussion about dealing with function refinements when they conflict with the global name space. IE. I can't use a /delete refinement because it will disable the 'delete function within my function. Moppy_gitlab 17:57In Red, is it possible to actually access the header and read its data from within a script? 17:57I'm trying to use system/script/header, and it only returns none 18:04 Red [ Title: "title" ] probe system/script/header probe system/script/header/Title 18:05 gchiu 18:24@Moppy_gitlab always a bit of a red flag to have a block sitting there by itself .. normally one needs to copy them. Moppy_gitlab 18:26 probe copy system/script/header copy does not allow none! type 18:37okay, this works 18:38 Red [ Title: "title" ] h: load/header %currentfile.red probe h/Red/Title 18:38I wonder if there's an easier way for a script to reference itself hiiamboris 18:39there supposed to be a way, but it's not implemented yet 18:39https://github.com/red/red/issues/4992 Moppy_gitlab 18:40does Rebol have something like that in system/script ? hiiamboris 18:40yes ne1uno 18:42find system/options/script "script.red" 18:42? system/options 18:44have to hardwire script name but it works Moppy_gitlab 18:44system/options is what the operating system gives Red. I guess it makes sense the OS would also give Red the path 18:45 h: load/header system/options/script probe h/Red/Title ne1uno 18:47header changes if you include other files Moppy_gitlab 18:52hmm, does that matter? h: load/header system/options/script probe h/Red/Title #include %prime.red probe h/Red/Title doesn't raise any issues 18:52maybe h wont be able to reference what was added though... gurzgri 19:00@mikeyaunish You can use system/words/deletein your function to refer to the global delete, as in: test: func [/print] [system/words/print ['called pick [with without] print mold to refinement! 'print]] test/print ;-- called with /print test ;-- called without /print gltewalt:matrix.org 19:17What do lperm, mperm, operm, and bperm stans for? 19:17Stand for Moppy_gitlab 19:24@gltewalt:matrix.org lperm: list permutations, mperm: make permutations, operm: order permutations, bperm: beginning permutation 19:25I think the biggest issue is the difference in how Red binds things. Racket has "deep binding" 19:26Red has no binding gltewalt:matrix.org 19:28Well bind in Red is a bit sorcery Moppy_gitlab 19:30Here is the trace of the Racket program 19:30https://pastebin.com/Y2fSdTNZ 19:35It would be cool if Red had a trace function which would print a function's every input and output in a nicely formatted way like that. While print may be able to replicate that behavior, it would be messier. 19:37I think @hiiamboris is working on something like that? greggirwin 19:45Yes, being built on the new [interpreter events](https://github.com/red/docs/blob/master/en/interp-events.adoc) feature. mikeyaunish 19:47@gurzgri Thanks - that's a good work around. I'll keep it in mind. gurzgri 21:24@Moppy_gitlab Probably as close as it gets: Red [title: "Permutations"] lperm: func [inlist] [ either empty? inlist [[[]]] [mperm first inlist lperm next inlist] ] mperm: func [plett sletts] [ either empty? sletts [[]] [append operm plett first sletts mperm plett next sletts] ] operm: func [plett sletts] [ compose/deep either empty? sletts [[[(plett)]]] [[[(plett) (sletts)] (bperm first sletts operm plett next sletts)]] ] bperm: func [plett sletts] [ either empty? sletts [[]] [compose/deep [[(plett) (first sletts)] (bperm plett next sletts)]] ] lperm [a b c] ;== [[a b c] [b a c] [b c a] [a c b] [c a b] [c b a]] Moppy_gitlab 21:28@gurzgri that's very impressive. I've tried making a more readable version based on this. 21:28https://www.baeldung.com/wp-content/ql-cache/quicklatex.com-33b4a8152b7c47614d52fa5008eca4b7_l3.svg 21:28 Red [Purpose: "find every permutation of a given block"] ;simple recursion block: [1 2 3] permuter: function [ remaining [block!] /cont generated [block!] current [block!] ] [ if not cont [ generated: [] current: [] ] either not empty? remaining [ foreach e remaining [ append current e remaining: copy next remaining permuter/cont remaining generated current ] ] [ probe append generated current ] ] probe permuter block 21:29it doesn't quite work though [1 2 3] [1 2 3 1 2 3 3] [1 2 3 1 2 3 3 1 2 3 3 2 3] [1 2 3 1 2 3 3 1 2 3 3 2 3 1 2 3 3 2 3 3] [1 2 3 1 2 3 3 1 2 3 3 2 3 1 2 3 3 2 3 3] greggirwin 21:35help append. :^) 21:35Except the permuting is off too. One step at a time. Moppy_gitlab 21:46I see append/only generated current puts every permutation in a separate block... 22:48So, I think the problem is that remaining isn't preserved properly probe reduce [current remaining] either not empty? remaining [ foreach e remaining [ nextp: append copy current e remaining: next copy remaining permuter/cont remaining generated nextp [[] [1 2 3]] [[1] [2 3]] [[1 2] [3]] [[1 2 3] []] [[1 3] []] [[2] [3]] [[2 3] []] [[3] []] [[1 2 3] [1 3] [2 3] [3]] 22:51instead of next remove, I should only remove e from remaining maybe... 23:13slightly closer. The only thing I changed was renaming a variable passed to permuter to remaine probe reduce [current remaining] either not empty? remaining [ foreach e remaining [ nextp: append copy current e remaine: next copy remaining permuter/cont remaine generated nextp == [[1 2 3] [1 3 3] [2 2 3] [2 3 3] [3 2 3] [3 3 3]] greggirwin 23:17@Moppy_gitlab once you get it working, feel free to add it [here](https://github.com/red/red/wiki/Great-Red-Optimizer-Challenge:-Permutations) Saturday 18th December, 2021 Moppy_gitlab 02:20This works a little better, but it's still not quite there. probe reduce [current] either not empty? remaining [ foreach e remaining [ probe reduce [e remaining remaine] if (length? remaine) = 1 [swap remaining next remaining] nextp: append copy current e remaine: next copy remaining permuter/cont remaine generated nextp ... [[1 2 3]] [3 [2 3] [3]] [[1 3]] [2 [2] none] [[1 3 2]] [2 [1 2 3] [3 2]] [[2]] [2 [2 3] none] ... 02:26maybe I should explicitly define remaine as remaining without e 02:34it works 02:35 either not empty? remaining [ foreach e remaining [ nextp: append copy current e remaine: copy remaining remove-each ii remaine [ii = e] permuter/cont remaine generated nextp [[1 2 3] [1 3 2] [2 1 3] [2 3 1] [3 1 2] [3 2 1]] gchiu 04:46view layout [text "&&"] - need 2& to see a single &. Is this a special character for any particular reason? hiiamboris 08:26It's an accelerator char in the OS. Moppy_gitlab 08:32when I compile my permutation program, it only returns []. It doesn't give me any errors, but the output is obviously wrong. hiiamboris 09:29add -e option Moppy_gitlab 09:47that worked 09:47Is there a list of every compiler option? hiiamboris 10:04try --help Moppy_gitlab 18:57I've seen people mentioning Red's FLI before. Is that something done through parse, or what exactly? hiiamboris 18:58what's FLI? Moppy_gitlab 18:58foreign language interface 18:59I want to try using go's input instead of Red's ask. 18:59But have the input processed by Red hiiamboris 19:00https://w.red-lang.org/en/libred/ does this help? Moppy_gitlab 19:02I think so 20:32As a side note, this documentation https://w.red-lang.org/en/ looks a lot nicer than the github one, yet the homepage's documentation page directs to the latter. 20:46@hiiamboris Looking at it closer, this seems to be about how you can use Red in other languages, not the other way around. All of the code examples are in c. hiiamboris 21:06The other way around you write Red/System code to access other language's API. Moppy_gitlab 21:07So, this bit from Rebol's docs wouldn't work? http://www.rebol.com/docs/library.html#section-6 21:10load has no refinement called library in Red... 21:11 >> ? library! No matching values were found in the global context. I'm guessing this is a consequence of Red being written in Rebol 2 instead of c. hiiamboris 21:17no it won't work Moppy_gitlab 21:21So, this section 21:21https://static.red-lang.org/red-system-specs.html#section-15 hiiamboris 21:41yeah, you can find plenty of examples in the runtime itself Moppy_gitlab 22:53Is the c-string type a pointer? 22:54"A c-string variable holds the memory address of the first byte of the c-string, so it can be viewed as an implicit pointer to a variable of the byte! datatype." gurzgri 23:02Yes it is. Moppy_gitlab 23:19does the local path in Red/System not start with % as it does in Red? gltewalt:matrix.org 23:26https://github.com/red/docs/blob/master/en/libred.adoc Moppy_gitlab 23:32Here is what I've written. The executable doesn't return any errors, but it also doesn't do anything. Red/System [] #import [ "ask.so" cdecl [ goask: "goask" [ return: [c-string!] ] ] ] probe goask and in case anyone here knows go, my go source package main import ( "C" "fmt" ) //export goask func goask() *C.char { var input string fmt.Scanln(&input) return C.CString(input) } func main() { a := goask() fmt.Println(a) } gltewalt:matrix.org 23:34Use print ? Moppy_gitlab 23:35that's what I tried first and it made no difference Sunday 19th December, 2021 Moppy_gitlab 00:54I could probably use call to vastly simplify what I'm trying to do gltewalt:matrix.org 01:01Haven't done it. But why do you want to use Go ask ? Moppy_gitlab 01:02@gltewalt:matrix.org you can't compile Red programs that use ask without jumping through a lot of hoops. I (falsely)thought using go to receive the input would be simpler. Now I'm trying to do it for its own sake. 01:02Also, call doesn't return the output directly. 01:02So I'd have to use call/output, and load the file I just made ne1uno 01:03clipboard? gltewalt:matrix.org 01:04This? https://github.com/red/red/wiki/%5BNOTES%5D-Compiling-with-console-functions---input,-ask Moppy_gitlab 01:05@gltewalt:matrix.org yeah, I know you can do it that way, but I want to try a way around that 01:05@ne1uno how could I use the clipboard in this situation? gltewalt:matrix.org 01:05Does Go require the main function in this case? ne1uno 01:06have either side read/write clipboard. maybe no different than file really Moppy_gitlab 01:07@gltewalt:matrix.org maybe? 01:07@ne1uno having go write to the clipboard is a good idea 01:12yeah, go wont build a C-shared object with the main function gltewalt:matrix.org 01:21Did you compile the red script in release mode? Moppy_gitlab 01:21yes 01:46alright, this solution works, but it's pretty far from ideal I guess Red [Purpose: "using call, a go program, and the clipboard to replace ask"] prior: read-clipboard call/wait "go run ask.go" temp: read-clipboard print temp write-clipboard prior 01:48I've got to say, this website has been pretty much indispensable 01:48https://www.red-by-example.org gltewalt 01:57There are people here that would know, I'm just not one who has used Red/System much Moppy_gitlab 02:03Above doesn't quite work on linux, but that could probably be blamed on the go module I used. 02:06or it could be because I'm trying on wsl Nomarian 02:43so, not a red question, I'm trying to build ren/c and fail, however there is no Issues tab on github Moppy_gitlab 04:02This method of making a file to read from also doesn't work on linux. goask works fine, so I suspect call/wait doesn't work on linux, at least when compiled. Red [Purpose: "replace ask with go writing a file and red reading it"] call/wait "sudo ./goask" input: load read %input delete %input probe input 04:03basically, it just instantly returns [] 04:09On windows, it works nicely though. Preferable to the clipboard solution imo. hiiamboris 08:50in your initial R/S attempt I would try to get Go to print something to tell it gets there 08:50and maybe inspect the state of stdin 08:54@Nomarian havent figured how to compile it myself either, but there are some stale binaries of it somewhere for download 08:59Brian's stance on it: if GCC doesn't build it that's "because you're not good at tools" and "not thinking hard enough" :) Moppy_gitlab 09:43@hiiamboris no, it doesn't print anything when I try hiiamboris 09:49in that case you should probably research how to declare a Go function so it uses cdecl calling convention 09:50even better, look for an example of calling Go function from C 09:51if it works with C but not with R/S then we have something gchiu 14:27@hiiamboris binaries have been kept for the last couple of years. If you can't compile you can always download the latest artifacts from http://hostilefork.com/media/shared/replpad-js/ 14:28Type 'latest-of 0.3.40' eg for windows 64. Use the appropriate tuple for the os you want. 14:29I host all the artifacts on my S3 account. hiiamboris 14:36 >> latest-of 0.3.40 ** Error: TypeError: NetworkError when attempting to fetch resource. ** Where: js-head-helper js-head info? latest-of main ** Near: [*** return js-head-helper source **] ** File: **'>http://hostilefork.com/media/shared/replpad-js/js-css-interop.reb ** Line: 225 14:36nvm, I just needed to enable another cloudfront server 14:39@gchiu thanks! would never in my life have guessed this way to download binaries :) gchiu 14:43I got tired of updating the static html page! So, wrote a consult script to find it amongst all the 1000s of binaries! 14:44You can't host cgi on s3 based websites hiiamboris 14:45can't you symlink latest builds to the same names again and again? gchiu 14:50Dunno. Each build has a different name. How would i do that? Not that Brian would approve. 14:52Github actions could build using same name each time, but the aim of the exercise is to make it as difficult as possible for the uninitiated, lol hiiamboris 14:54:D Moppy_gitlab 14:54https://stackoverflow.com/questions/15735439/why-does-gos-compiler-gc-use-a-different-calling-convention-than-c gchiu 14:54Anyway, that's how it is. You can get the latest mac, Linux, android, windows and wasm binaries this way Moppy_gitlab 14:55>Because there's no advantage in having the same calling convention. Go code and C code cannot call each other directly even when the calling convention would be the same because Go uses split stacks. Nomarian 14:55@hiiamboris Unfortunately I'm on a pi4, looking at the binaries, it seems they use prebuild versions of a ren/c to build ren/c, because atronix's build of r3 does not work. 14:57I think, maybe they do use normal r3. but r3 itself is giving me too many troubles to be usable 15:01the only thing that occurs to me is to cross compile, and if I can't even compile normally, I wouldn't know how to cross compile hiiamboris 15:03yeah looks like there are no rpi binaries there Moppy_gitlab 15:16Okay, so the simplest way of compiling cross platform programs that use ask is putting input.red and its included files in the same folder, editing input.red to look for auto-complete.red in the same directory, and putting an include statement to input.red in what you're trying to compile. 15:17that works on both windows and linux gchiu 15:19http://rebolbinaries.0pt.pw/linux-armhf/r3-7e8edcf0-debug for an old arm build 17:25> so, not a red question, I'm trying to build ren/c and fail, however there is no Issues tab on github I see that you're looking at the wrong repository. Try this one https://github.com/metaeducation/ren-c 17:27Is there a way to simulate testing of the Red GUI? I'm doing it manually which is a bit painful hiiamboris 17:29you can chop things off https://gitlab.com/hiiamboris/red-view-test-system/ 17:30no easy task though... ...or you add your stuff to the issues.red there and remove the rest Moppy_gitlab 17:31@hiiamboris Instead of having a bunch of files, can I combine all of them into a single dependency which other scripts can use? gchiu 17:33> you can chop things off https://gitlab.com/hiiamboris/red-view-test-system/ Cool hiiamboris 17:33@Moppy_gitlab sure you can just read each .red file and build a single one out of them 17:34that's what I have to do when I need to compile something 17:36@gchiu I haven't run it since.. last winter I guess.. so it may have regressed Moppy_gitlab 17:36by read, do you mean literally, or using the read function? gchiu 17:36> @gchiu I haven't run it since.. last winter I guess.. so it may have regressed sounds like an infinite regress about to happen hiiamboris 17:36using read function @moppy_gitlab 17:39@Moppy_gitlab smth like this: include: function [filename] [ set [path: name:] split-path filename dir: clean-path what-dir change-dir path src: load/all name while [p: find src to issue! 'include] [ include p/2 remove/part p 2 ] append heap src change-dir dir heap ] heap: [] save %outfile.red append [Red []] include %filename.red 17:44> sounds like an infinite regress about to happen @gchiu yeah, things are in movement :) e.g. forall was broken a month ago or so gchiu 18:18I'm using GitHub Actions and it seems to catch most regressions for me 18:26I do miss things like clear [ block of faces], set-text and other VID functions Tuesday 21st December, 2021 bubnenkoff 16:21What is the shortest way to increase last element in block to one? list: [1 2 3] to get: [1 2 4] 16:22is it's possible to do with last list smth ? 16:27I have only one idea, but it's not short: list/(length? list): list/(length? list) + 1 ldci 16:40This also works append list (take/last list) + 1 rebolek 16:55or this: change back tail list 1 + last list hiiamboris 16:55t: tail list t/-1: t/-1 + 1 16:55IMO handling of the last item is something very annoying in Red 16:57But also the increment. 16:57So, this example brings out the worst :) 16:58A general incr function could accept series for this matter. incr back tail list 17:01Or with an experimental << operator: incr list << 1 17:01Source: >>: make op! function [ "Return series at an offset or shifts bits to the right" data [series! integer!] offset [integer!] ][ if integer? data [return shift-right data offset] skip head data offset ] <<: make op! function [ "Return series at an offset from tail or shifts bits to the left" data [series! integer!] offset [integer!] ][ if integer? data [return shift-left data offset] skip tail data negate offset ] 17:02We are really wasting operators, limiting them to integers only :) gltewalt:matrix.org 17:29We are? You want code that reads like smalltalk? 17:30Isn't the last item last ? Moppy_gitlab 17:35 python >>> f = "hi" >>> f += "hi" >>> f "hihi" java > String f = "hi" > f += "hi" > f f ==> "hihi" 17:40a function could probably be used instead though, so no need for a built in one? 17:44 python f = [1,2,3] f[-1] += 1 f [1,2,4] ldci 17:45try f: "hi" append f f Moppy_gitlab 17:46I wonder about doing the same thing with an infix operator ne1uno 17:48javascript: 1 + "1" -> "11" Moppy_gitlab 17:49I don't know js, so that's pretty horrifying hiiamboris 17:51@gltewalt:matrix.org between change back back tail list 1 + pick tail list -2 and Python's list[-2] += 1 you can guess what I would choose *any day* ne1uno 17:51 +=: make op! func [a b][append copy "" rejoin [to-string a to-string b]] 1 += "1" Moppy_gitlab 17:52negative indices would be a cool feature gltewalt:matrix.org 17:52Just enable negative skips 17:53Or negative indices 17:54The also use index, negative index pairs for subsections 17:55"Slice" they call it hiiamboris 17:55Need real slices in Red first. Copy is of little use. gltewalt:matrix.org 17:57extract list 3x-6 hiiamboris 17:57Already have this one. 17:57 //: make op! function [ "Pick an item or get a slice (copy) from series, or return modulo of a scalar" data [series! number! money! char! pair! tuple! vector! time!] offset [number! money! char! pair! tuple! vector! time!] "Negative indexes are tail-relative in series" ][ unless series? data [return modulo data offset] either integer? offset [ pick either offset >= 0 [data][tail data] offset ][ copy/part skip either 0 <= i: offset/1 [data][tail data] i skip either 0 < i: offset/2 [data][tail data] i ] ] gltewalt:matrix.org 17:59Wouldn't extract be a good candidate to add to? hiiamboris 17:59For a copy? Probably. For a slice I'd call it just slice 18:00But then again, we have ambiguity here. Negative indices usually mean back from current offset. To support both that and from tail is quite hard to fit into a single design. gltewalt:matrix.org 18:04I thought negative index was always from tail in python, but it has been years 18:05@GalenIvanov: would know hiiamboris 18:06In python I think so, yes. gltewalt:matrix.org 18:12DSL ? Moppy_gitlab 18:14Is there any way to return a reference to a series index? 18:14instead of the value gltewalt:matrix.org 18:15the position? Moppy_gitlab 18:15I guess gltewalt:matrix.org 18:15imdex? 18:17index? my-list 18:18These ideas might be of use for slicing, since is kind of lispy ? https://quickref.common-lisp.net/cl-slice.html Moppy_gitlab 18:28are paths a refinement of words? How exactly is / defined in the context of paths? hiiamboris 18:30 >> as [] 'a/b/c/d == [a b c d] Moppy_gitlab 18:33I guess better question is could I define -, so that f-2 does the same thing as f/2 hiiamboris 18:37no, but you can transform your source before it's loaded Moppy_gitlab 18:40maybe going backwards from the tail could be implemented with a different character than forward slash? >> f: [1 2 3] >> f\1 3 hiiamboris 18:42maybe.. Moppy_gitlab 18:42back slash isn't used for anything and it would be logically consistent 18:46 >> f: [1 2 3] >> f/1: f/1 + 1 >> f [2 2 3] >> f\1 : f\1 + 1 >> f [2 2 4] hiiamboris 18:51what if the item is not integer? f\a or smth, how to define the meaning of backslash there? Moppy_gitlab 18:52starting from tail, look for word a 18:53 >> f: [a: 1 a: 2] == [a: 1 a: 2] >> f\a 2 Oldes 19:09@Moppy_gitlab interesting idea... but I think that there are more important things to do first. But you may want to [make a wish](https://github.com/red/rep) and wait, if something happens. Moppy_gitlab 19:13@Oldes will do. I have no idea how difficult implementing what I've proposed would be. 19:30Okay, I'm not sure how good my formatting is... 19:30https://github.com/red/REP/issues/110 hiiamboris 20:05thanks Moppy_gitlab 20:52thank you for adding context greggirwin 21:03https://github.com/red/REP/issues/110#issuecomment-999091797 21:14As many of you know, I'm not a big fan of new and clever ops for the core language. I like words, and I like them for a reason. They have more meaning in a general context. For DSLs, the rules are different, and that's a great place to leverage specialized notations. Overloading can be powerful, but can also make things harder to reason about when reading code. Finding the line before we cross it is one of our main jobs as language designers. Could we make + mean append for series values? Sure. *Should* we? Could we make - mean clear at ... for series? You bet. Should we? 21:16@gltewalt:matrix.org mentioned a DSL solution. I have some old series related DSLs and that's a possibility. As I noted in my issue comment, let's start with the goal, make sure we know *why* we're doing it and that the design achieves its goal. Weigh how general this need is, and what the easiest solution is. hiiamboris 21:28I can tell that modification of last items is general enough to have been bothering me for a while. greggirwin 21:47I agree that the last item bit is key. Reverse access in general is less of an issue. Moppy_gitlab 21:57@greggirwin I didn't catch where @gltewalt:matrix.org mentioned a DSL solution. 22:12I guess this is already possible? >> f: [1 2 3 4] >> f: tail f == [] >> f/-1 == 4 >> f/-2 == 3 But, this isn't >> f/-1 : f/-1 + 1 *** Syntax Error: (line 1) invalid word at : f/-1 + 1 *** Where: set *** Stack: load greggirwin 22:19You have a space before the colon. Moppy_gitlab 22:20ah, thanks. It does work greggirwin 22:24The inconvenience here is that you still need a temporary ref to the tail of the series. It's not terrible, to be sure, but not entirely elegant either. Also be aware of 0 index access behavior. >> f: [1 2 3 4] == [1 2 3 4] >> f: at f 3 == [3 4] >> f/1 == 3 >> f/0 == none >> f/-1 == 2 Moppy_gitlab 22:35Vertical bar also isn't used for anything. Maybe that could be used? Or is the entire idea of backwards traversing a dubious one? >> ? | No matching values were found in the global context. greggirwin 22:36I think reverse traverse is dubious for overall value. Lexical space is very tight in Red, so we are *very* conservative about how we use what's left. 22:38Pipe has the same issues I raised in the issue comment. It's a deep lexical and value question. e.g. are [|a |1 |-2] a new type of refinement, and what impact might that have on things like function calls? 22:39It's also a breaking change, as | is valid for word use today. gltewalt:matrix.org 23:03Reverse indexing is necessary for slice 23:03Isn't it? Moppy_gitlab 23:05I'm interested in the prospect of DSL being able to define locally changed syntax. Would the documentation for that be in Red/System's? gltewalt:matrix.org 23:12No, it's about context and parse 23:29Ollllld rebol sample https://gist.github.com/tormaroe/1497179 Moppy_gitlab 23:31thanks Wednesday 22nd December, 2021 Moppy_gitlab 01:12Maybe, the 0 index could always refer to a series' tail instead of returning none? >> f: [1 2 3 4] >> f/0 [] >> f/0/-1 4 >> f/0/-2 3 greggirwin 01:26@Moppy_gitlab since you're new to Red, I'll suggest that you spend some time with it before making too many suggestions that relate to fundamental design aspects. A lot of the same issues come up over time, or have been discussed in depth already. A related topic is big design choices, which can lead to more info and new sections [here](https://github.com/red/red/wiki/%5BDOC%5D-Red-Should...-(Feature-Wars)). Ultimately, though, we each need to think through things from a big picture perspective, weigh the pros and cons (and it *is* often helpful to do that in chat, and extracting results into the wiki). This is why I suggest spending time with Red, so you have a better feel for how many parts are deeply intertwingled, or what is idiomatically Red. In this case, the idea of 0 meaning tail makes it a magic number. More than that, it doesn't solve the issue today, but in iterating over indexes, suddenly 0 becomes quite dangerous if you cross that boundary. It also dramatically changes path evaluation, which we want to be consistent. Moppy_gitlab 01:53I think I've found a nicer way that already works 01:54 01:54 >> f: [1 2 3 4] >> g: tail f >> f/1: "a" >> head g ["a" 2 3 4] >> g/-1: "d" >> head f ["a" 2 3 "d"] 01:58I can traverse f in any way, and g will still point to its tail gltewalt 02:17It's interesting that there's a first function, but not a rest function. Easy to make, though. rest: func [s [series!]][next s] Moppy_gitlab 02:22doesn't take s 1 do the same thing, except also removing the first member? gltewalt 02:23yeah 02:23chomps out the element though Moppy_gitlab 02:26In lisps, rest does chomp out the element > (define f (list 1 2 3 4)) > (define g (rest f)) > g '(2 3 4) > (first g) 2 gltewalt 02:27If you assign it to g 02:28It's assigning the returned elements to g, isn't it? Moppy_gitlab 02:28Yes, in your example though, rest is returned a reference, not a block 02:29rest in lisps never returns a reference gltewalt 02:29If you do (rest f) (first f) 02:29? Moppy_gitlab 02:29yes, that returns just the values 02:30next s doesn't just return the values gltewalt 02:31next s should. s: next s doesn't Moppy_gitlab 02:31 >> f: [1 2 3 4] >> g: rest f >> head g [1 2 3 4] gltewalt 02:32Oh, I see what you're saying 02:33take it is, then 02:47rest: func [s [series!]][copy next s] 02:48 >> f: "Hi there" == "Hi there" >> g: rest f == "i there" >> head g == "i there" 02:49copy will still be the death of me Moppy_gitlab 02:50that looks fine. What are you trying to do? gltewalt 02:53Oh nothing, I just happened to remember that there was no rest in the middle of thinking about traversing and indexes greggirwin 02:53@Moppy_gitlab, your idea works if no new items are added, but as soon as that happens, g no longer points to the tail. >> f: [1 2 3 4] == [1 2 3 4] >> g: tail f == [] >> append f "x" == [1 2 3 4 "x"] >> g/-1 == 4 >> g/-1: "d" == "d" >> f == [1 2 3 "d" "x"] And, in case you think it should...no it shouldn't. :^) Won't take long to reason out why. Moppy_gitlab 03:03@greggirwin could I concurrently append f and change where g points to the new tail? 03:04I guess a function could do that 03:05 append+: function [series in ref] [append series in ref: tail series] 03:11nnn, that doesn't work 03:45 f/((length? f) - 1): f/((length? f) - 1) + 1 GalenIvanov 08:32@gltewalt:matrix.org Yes, in Python negative indices always start from the end. Regarding slices, [Icon](https://www2.cs.arizona.edu/icon/) also have slices, maybe long before Python. [Here](https://tio.run/##bZBBboMwEEX3OcVPsgEBUghZWeoNegPEYmSmdCIwle2k6umpZRJCJLywrK/vN88WPZpp@rGj5vZmGQOJSdIdwupHTT0ongnqA3WVX/IyPzcxitsRhjvycmeIaUWzw5cdB/hvBps2dn6teE6oLsom3T1uuV60mG6G8J3t31xzyZ7qs7o0OQ44LPUZ5yUI9uI8ipg4GhjksKfVnHQTWarTE7m4r/svo0V/262oVHjH2u4dQ7duCKbcLsACn7Vk6gpxb9YhVZJdm@05Zaaq55jwkdP0Dw) are some examples. Icon doesn't have step for the slices, but introduces a nice "augmented" mode: L[i+:j] which is equal to L[i:i+j] Thursday 23th December, 2021 bubnenkoff 11:46Hi! I need to iterate data and print current data level. I can't figure out how to understand if we go inside block or it's alredy block ouside? For example here. After customer we goint to lot, but how to understand that we already not in customer level? data-pointer: [ lots: [ bar: none baz: none customers: [ customer: [ name: none ] ] lot: [ name: none objs:[ obj: [ price: none ] ] ] ] ] elements-before: function [] [ level: 0 walk: function[data-pointer /extern level] [ foreach [data-name data-value] data-pointer [ if block? data-value [ print data-name walk data-value ] ] ] walk data-pointer ] elements-before hiiamboris 12:53build a stack of currently visited node names 12:53add something before walk start, remove it after leaving it 12:54 [data-pointer lots customers customer] [data-pointer lots customers] [data-pointer lots] [data-pointer lots lot] ... olivier_lp_twitter 14:00Hi, do we know when all I/O on progress works will be added on the main branch? Is the /as refinement of read, write has been implemented? bubnenkoff 16:14> > [data-pointer lots customers customer] > [data-pointer lots customers] > [data-pointer lots] > [data-pointer lots lot] > ... > data-pointer: [ lots: [ bar: none baz: none customers: [ customer: [ name: none ] ] lot: [ name: none objs:[ obj: [ price: none ] ] ] ] ] remove-last: function [blk] [ head clear back tail copy blk ] elements-before: function [] [ print "elements-before" level: 0 stack: [] walk: function[data-pointer /extern level] [ foreach [data-name data-value] data-pointer [ if block? data-value [ print [data-name " > " stack] append stack to-word data-name walk data-value remove-last stack ] ] ] walk data-pointer ] elements-before I am getting: lots > customers > lots customer > lots customers lot > lots customers customer ; ! Error! lot parent is lots but not: lots customers customer objs > lots customers customer lot obj > lots customers customer lot objs == [lots customers customer lot objs] hiiamboris 16:17you'll figure it out :) 16:18why would it not remove it, right? :) bubnenkoff 16:18yes Moppy_gitlab 20:16I solved this problem in Red. Never solved it before. My answer is quite different from others, so I'm guessing there's a more elegant way to do it than what I did. 20:16https://rosettacode.org/wiki/9_billion_names_of_God_the_integer 20:16https://pastebin.com/6tguAP5Q 20:17output: name-find 10 1 1 1 1 1 1 1 2 1 1 1 2 2 1 1 1 3 3 2 1 1 1 3 4 3 2 1 1 1 4 5 5 3 2 1 1 1 4 7 6 5 3 2 1 1 1 5 8 9 7 5 3 2 1 1 greggirwin 21:15Nice. :+1: Since there's no Red solution there yet, you could add yours. Moppy_gitlab 21:21I noticed that '[1 2 3 4] is neither a valid word nor series. I'm assuming though Red is committed to having only one kind of series rather different types; ex python has arrays, lists, tuples and dictionaries. 21:21Is it possible to make data types with Red/System or something like that? greggirwin 21:25There is no "literal series" format, because they are already literal (unevaluated). There are, however, a number of series types in Red. Try ? series!, and also ? typeset! Moppy_gitlab 21:30I know string! and date! are types of series, but the way paths work is the same for all of them. I'm asking because I wonder if making a type of series where negative integers are relative to the tail is possible. greggirwin 21:32Dates are not series values. Almost anything is possible in Red. You would certainly learn a lot by trying. Moppy_gitlab 22:28My code really is poorly optimized. The second part of the problem, calculating the sum of a row, is possible, but takes a very long time for anything larger than 40 22:29I added mine to the page anyway. greggirwin 22:34:+1: 22:35Before long, The Great Red Optimizer may kick in, but it's the holidays too. gltewalt:matrix.org 23:03sum row Moppy_gitlab 23:09row isn't a series, it's a number 23:11 >> f: make reactor! [s: [1 2 3 4]] == make object! [ s: [1 2 3 4] ] >> t: is [tail f/s] >> append f/s 5 == [1 2 3 4 5] >> t == [5] 23:13 >> t: is [f/s/(length? s)] *** Script Error: s has no value *** Where: length? *** Stack: eval 23:19t: is [f/s/((length? f/s) + 1)] doesn't return an error, but it returns none, the value of tail. 23:23t: is [find f/s/((length? f/s) + 1)] doesn't work because find can't use none as an input. Friday 24th December, 2021 Moppy_gitlab 02:45I can see a way to store previous row's results and relate them to the current row. That'll probably speed things up. gltewalt:matrix.org 02:58If you store row results, should be fast to sum a row gltewalt 04:01t: is [f/s/(length? f/s)] 04:03t: is [f/s/(length? f/s) + 1] 04:18What do you want to do? Have tail adjust to appending values? Moppy_gitlab 05:01yeah 05:36On second thought, I was mistaken about how that could be related to the current row 05:47actually, it does work 06:21and it calculates the sum a lot faster. Not lightning fast, but better. 06:24it times out by row 123 though 06:35here it is https://pastebin.com/raw/jv5JAjRX 08:40adding a line if mem/1 > rem [break] speeds things up more, but 123 is still undoable bubnenkoff 16:05Guys, I need your help. I've run into a very serious mistake. I cannot understand its logic. I've been messing around with it all day, but I'm not even close to figuring out what the problem might be. The same code behaves differently when passing data from function to function and when copying from notepad. It sounds like a total mystery, but I really don't understand what's wrong. Look what a mystery it is: https://imgur.com/Y34Ww16 reproduction https://gist.github.com/bubnenkoff/51e01aa0863659f741515274072aa85e#file-app-red-L143 hiiamboris 16:25do you have a direct link to the screenshot? that site only loads gray screen for me bubnenkoff 16:31[![изображение.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/0pFI/thumb/izobrazhenie.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/0pFI/izobrazhenie.png) 16:33The main idea. If copy result of first function in notepad, make word from it and pass to second function you will get different result than if you will pass result of first function to second. hiiamboris 16:34let's see... 16:37I don't see this difference on Red 0.6.4 for Windows built 22-Dec-2021/17:36:36+03:00 commit #328c904 16:38I just inserted it into notepad, added "stack: " prefix and copied back to 2nd red console bubnenkoff 16:38Did you get first or second result? hiiamboris 16:38wait you're right 16:39I'm just not paying enough attention :) bubnenkoff 16:39It's seems that I begin to understood problem.... it seems that it issue with missed here: [ data-name copy/deep m ] 16:41yeah.... sorry for your concern hiiamboris 16:42yeah looks like you haven't copied something 16:42then when you copy/paste it this makes a copy of every block gltewalt 22:12@Moppy_gitlab It's going to blow up at a certain size because integer span a range from -2147483648 to 2147483647 And there is no automatic conversion to float 22:13No BigInt Moppy_gitlab 22:29@gltewalt are you saying my code doesn't have automatic conversion to float, or Red doesn't have that? 22:29Also, I wrote this today https://rosettacode.org/wiki/Abelian_sandpile_model/Identity#Red 22:33anyway, it does work (slowly) after making everything a float gltewalt:matrix.org 22:39Red doesn't have it Moppy_gitlab 22:42by the way, is there any way to make logic operators not evaluate the second argument? 22:42like if the first argument to and is false, it wont try to evaluate the second argument 22:42the same for when the first argument to or is true ne1uno 22:45any & all short circuit Moppy_gitlab 22:46thanks Saturday 25th December, 2021 toomasv 12:26@Moppy_gitlab My try: context [ sum-part: function [nums [block!] count [integer!]][ out: 0.0 loop count [ out: out + nums/1 if empty? nums: next nums [break] ] out ] nums: make map! [1 [1] 2 [1 1]] sums: make map! [1 1 2 2] set 'names function [row][ if row < 1 [cause-error 'user 'message "Argument needs to be >= 1"] either sums/:row [sums/:row][ out: clear [] half: to integer! row / 2 repeat col row - 1 [ unless nums/:col [names col] unless nums/(row - 1) [names row - 1] either col = (half + 1) [ append out at nums/(row - 1) half break ][ append out sum-part nums/(row - col) col ] ] sums/:row: sum nums/:row: copy out clear out sums/:row ;probe reduce [row nums/:row sums/:row] ] ] ] Problem is with stack depth here. After incrementally going up to 1234, here are the results: >> names 23 == 1255.0 >> names 123 == 2552338241.0 >> names 1234 == 1.569787972237331e35 12345 is too high and needs different approatch to be practical Moppy_gitlab 16:31@toomasv so this code is specifically for calculating the sum of a row? I'm not sure where half is coming from. Are you using a formula of some kind? 16:34I've also noticed my answer gives a wrong answer for the sum of 123, but is correct for 23... toomasv 17:00It calculates both rows and sums from these rows. To see rows just uncomment last line. Should be improved to show rows on demand. Moppy_gitlab 17:48Is this based on the other answers? My maths aren't good enough to understand it on sight. toomasv 18:34Nope, I looked at your output, then read description of the task and played with it until I more-or-less understood how it works. Below is the improved version. It doesn't depend anymore on stack depth, so you can go straight to names 1234, but it takes sooome time to reach the answer. You can now see each row with e.g. names/show 23 or names/show/all 23. Latter prints row numbers and sums too. context [ sum-part: function [nums [block!] count [integer!]][ out: 0.0 loop count [ out: out + nums/1 if empty? nums: next nums [break] ] out ] nums: make map! [1 [1] 2 [1 1]] sums: make map! [1 1 2 2] set 'names function [row /show /all][ if row < 1 [cause-error 'user 'message "Argument needs to be >= 1"] if show [ unless nums/:row [names row] repeat i row [either all [probe reduce [i nums/:i sums/:i]][print nums/:i]] ] either sums/:row [sums/:row][ out: clear [] half: to integer! row / 2 if row - 1 > last: length? nums [ repeat i row - last - 1 [names last + i] ] repeat col row - 1 [ either col = (half + 1) [ append out at nums/(row - 1) half break ][ append out sum-part nums/(row - col) col ] ] also sums/:row: sum nums/:row: copy out clear out ] ] ] Moppy_gitlab 20:28Wrote this https://rosettacode.org/wiki/Rock-paper-scissors#Red 20:31I like how mine is relatively concise. cloutiy 21:08I'm trying to save the latest red build In my mind the task is simple enough: 1) read the file 2) save the file >> save %latest-red read https://static.red-lang.org/dl/auto/linux/red-latest *** Access Error: invalid UTF-8 encoding: #{9F040834} *** Where: read *** Stack: save Do I need to specify that it's a binary or something like that? I'm trying to make a program that I can run to download, rename, chmod and replace red with the latest hiiamboris 21:14I don't think littering Rosetta with beginner's code gives a good impression on the language. 21:14@cloutiy read/binary and write/binary 21:15? read ? write to get help cloutiy 21:27@hiiamboris great thank you! Moppy_gitlab 21:35@hiiamboris Is Rosetta a place to advertise? Nobody using a language gives an even worse impression 21:36if you don't like my solution, replace it with your own cloutiy 21:40@hiiamboris Worked like a charm. Moppy_gitlab 22:53In fact, I replaced mine with Vooglaid's (with credit given) gltewalt 23:04I wouldn't call it beginner. It solved the problem. hiiamboris 23:10Do what you will :) I just shared an opinion Sunday 26th December, 2021 ldci 01:33We're all beginners when exploring various solutions :) hiiamboris 11:29@Moppy_gitlab OK while I'm the mood for this.. I'm not trying to discourage you or anything :) I just see by your code that you're fighting the language. For example: print "choose rock: r, paper: p, or scissors: s" pchoice: ask "" This makes little sense because ask "" is just input, and print "xxx" ask "" is just ask "xxx". So the same code can be written as (note newline as in your design): pchoice: ask "choose rock: r, paper: p, or scissors: s^/" But bear more with me... forever [ print "choose rock: r, paper: p, or scissors: s" pchoice: ask "" unless any [pchoice = "r" pchoice = "p" pchoice = "s"] [break] Infinite loops like forever are also a last resort and should be used sparingly. Since you got break there, your loop is actually conditional. So this can be just while: while [find choices pchoice: ask "choose rock: r, paper: p, or scissors: s^/"] In Red every expression returns a result, so you can always get the common denominator out. This applies to your case: case [ pchoice = cchoice [print "tie"] pindex = cindex [print "you lose"] true [print "you win"] ] Where we can take the print out: print case [ pchoice = cchoice ["tie"] pindex = cindex ["you lose"] true ["you win"] ] It's a minor thing but it showcases the flexibility. Note that we also often write 'else [..] instead of true [..] for more readability. Though it's a matter of taste of course. This part is especially messy and I couldn't get what it's doing until I gradually rewrote it bit by bit: lx: none unless (find prior lose/:pindex) = none [lx: (index? find prior lose/:pindex) - 1] unless lx = none [remove skip prior lx] ;removes what would have lost to player Turns out you can do the same thing with: remove find prior lose/:pindex ;removes what would have lost to player And it tells the reader what's happening. Besides, this touches another subject: indexes. I find it undeserving of a high-level language to delve into index-juggling. Part of what I'm trying to push Red into is declarativity of code. So every time we explicitly use an index, we should ask ourselves, can we avoid it? This leads to much clearer code. 11:30By the way your program does not output the AI's move. I understand it's just an oversight, but whoever runs it may feel lost at what's happening. 11:31With the above fixes and some more improvements the whole code becomes this: Red [Purpose: "Implement a rock-paper-scissors game with weighted probability"] prior: rejoin choices: ["r" "p" "s"] while [ find choices player-move: ask "choose (r)ock, (p)aper, or (s)cissors: " ][ print ["AI draws:" ai-move: random/only prior] ai-win: select "rpsr" player-move ai-loss: select "rspr" player-move print case [ ai-move = player-move/1 ["tie"] ai-move = ai-win ["you lose"] 'else ["you win"] ] append prior ai-win ;-- adds what would have beaten player remove find prior ai-loss ;-- removes what would have lost to player ] 11:34Now however let's take a step back. It's common to use the input line to interface with humans, but that's because it most languages GUI is either too hard to code or unavailable. With Red, GUI is it's strong point. So why not show it there? The same program in VID would looks like this: Red [ Purpose: "Implement a rock-paper-scissors game with weighted probability" Needs: View ] prior: "RPS" names: [#"R" "Rock" #"P" "Paper" #"S" "Scissors"] ai-move: function [player-move] [ ai/text: select names ai-move: random/only prior append prior ai-win: select "RPSR" player-move ;-- adds what would have beaten player remove find prior ai-loss: select "RSPR" player-move ;-- removes what would have lost to player round/text: case [ ai-move = player-move ["tie"] ai-move = ai-win ["you lose"] 'else ["you win"] ] ] view [ text "Your move:" player: text "" react later [ai-move face/text/1] return text "AI move:" ai: text "" return text "Result:" round: text "" return button [player/text: face/text] "Rock" button [player/text: face/text] "Paper" button [player/text: face/text] "Scissors" ] Then we are really showcasing the power of Red here and the reader might be intrigued enough to take a look at what that Red is. 11:38Rosetta is a great collection of puzzles. It's a great way to learn. But as you learn you will see new solutions to the problems you've previously solved. Then you'll see that in Red there's no final solution. Never. Every time you think you've mastered it, later you find out that there's yet another approach you didn't see. It's like engineering in a way, with endless number of ways to combine the primitives and the only limit is that of our imagination. 11:39Who knows, @greggirwin might even sponsor some more idiomatic code on Rosetta, because we need advocacy and our presence there is quite small :) 11:42So take your time to learn and if you like puzzles you may become our champion :) bubnenkoff 15:20How to create nested deep/copy map? I need something like: m: copy/deep #(nodes: copy/deep #() ) I tried to do something like: m: copy/deep make map! reduce [nodes: make map! copy/deep [] ] But it's wrong syntax hiiamboris 15:21how deep? can you do it the other way? 15:22if it's only the above example, just figure out what your reduce is doing and you're good bubnenkoff 15:23I need two level deep 15:25reduce is evaluate block. In my case nodes is some setted word above hiiamboris 15:26so what do you think is the result of reduce [nodes: make map! copy/deep [] ]? bubnenkoff 15:31mm... copy/deep in wrong place? It would be reduced but would not be binded with map? hiiamboris 15:32you know you can just paste that into console and check? bubnenkoff 15:33Yes, I did it already several times) hiiamboris 15:33:) 15:33does the result look like something you can create a map with? 15:33does it have both key and value? bubnenkoff 15:33the issue in key.... hiiamboris 15:34right... bubnenkoff 15:37 >> reduce [nodes: make map! [] ] == [#()] and key is disappeared... hiiamboris 15:40yeah, and why do you think it disappeared? bubnenkoff 15:41because I do not see it. I expected to get: nodes: #() hiiamboris 15:43well, reduce is replacing each *single expression* with *single result* 15:43how many expressions do you see in your reduce block? bubnenkoff 15:44two hiiamboris 15:44and that's where you're wrong sire :) 15:46word: value is a single expression yielding single result bubnenkoff 15:49hm... >> reduce [make map! [] ] == [#()] >> reduce [nodes: make map! [] ] == [#()] hiiamboris 15:50I would add: >> make map! [] == #() >> nodes: make map! [] == #() 15:50see the similarity? bubnenkoff 15:51yes 15:51even: >> set 'x reduce [nodes: make map! [] ] == [#()] hiiamboris 15:52indeed, still a single expression :) bubnenkoff 15:57This version (not working) is closer to result? m: copy/deep make map! [ nodes: reduce [make map! copy/deep [] ] ] ? hiiamboris 15:57nope 15:57you have to make 2 expressions somehow instead of one bubnenkoff 15:58is it's possible to do with reduce? hiiamboris 15:58absolutely 16:04you can even have 3 expressions: >> reduce [1 1 1] == [1 1 1] bubnenkoff 16:11 >> m: copy/deep make map! [nodes: [make map! copy/deep [] ] ] == #( nodes: [make map! copy/deep []] ) Am i close? hiiamboris 16:12nope 16:13why don't you just play with reduce in console, giving it random input until you figure out how to get 2 results returned? 16:15it is important to understand how interpreter identifies expressions to write good code bubnenkoff 16:36it seems that I figure out how to do it! m: copy/deep make map! reduce [to-set-word 'nodes make map! copy/deep [] ] hiiamboris 16:38:clap: bubnenkoff 16:38yahoo! 16:39it's shortest way? hiiamboris 16:39well, for example you don't have to torture [] with copy/deep because it's empty, it has nothing "deep" in it to be copied 16:41and there's no need to copy/deep the map you've just created either, because what you have created is the only existing copy so far and since there is no other reference to it, that original copy will be simply lost 16:42e.g. >> copy copy copy copy "abc" == "abc" valid code, but pointless Moppy_gitlab 17:46@hiiamboris Thanks, your post was very informative. I thought ^/ was the newline character, but I guess in certain cases it's s^/ 17:49oh, I see you didn't put a space 17:49I tried using the newline in ask before and it didn't work. 17:51Instead of printing a newline to the console, it just prints a space 17:51 >> ask "hi^/ hi hiiamboris 18:01 >> ask "hi^/" hi hello == "hello" 18:01(in the CLI console) 18:01I guess it's a little bit buggy, but then it's point is to have a single line question 18:02it work in GUI console though 18:03you can raise an [issue](https://github.com/red/red/issues/) about ask with newlines misbehaving in --cli mode 18:04if "it just prints a space" maybe you have an old build Moppy_gitlab 18:08I used the automated build for windows a few weeks ago. Maybe I'll raise an issue 18:14 choose rock: r, paper: p, or scissors: s r AI Draws: s you win choose rock: r, paper: p, or scissors: s r AI Draws: p you lose choose rock: r, paper: p, or scissors: s s AI Draws: p you win choose rock: r, paper: p, or scissors: s s hiiamboris 18:16in my build, CLI console totally loses it after a few "ask"s, prints "hi" instead of ">>" :) 18:17on W10 18:19I don't what it does. loop 3 [ask "hi^/"] then press up in the input line a few times. 18:19apparently it's trying to re-print the string gltewalt 19:09I had chistmas wine A.I. at some point testerday. cpu-move: select weapons random/only append weapons player-move gltewalt:matrix.org 19:15Where weapons is ["rock" "paper" "scissors" "rock"] hiiamboris 19:26Add Spock to your arsenal. gltewalt:matrix.org 19:33What defeats Spock? Bones? hiiamboris 19:35Lizard 19:35Or Paper Moppy_gitlab 20:27@gltewalt isn't that a little dangerous? >> f: [1 2 3 4] == [1 2 3 4] >> select f 4 == none 20:28If you randomly select the last element in weapons gltewalt:matrix.org 20:33That's why "rock" is repeated 20:33f: [1 2 3 4 1] 20:34Makes it pseudo circular 20:35 The more a player choice gets added to weapons, the higher the chance that random/only will return that choice. Select returns the weapon that defeats the most likely choice.> 20:35Bare bones intelligence 20:38select f 1 in your example finds the first 1 and returns 2 Moppy_gitlab 20:47ah, I see select is done and then append 20:50 >> f: [1 2 3 4 1] == [1 2 3 4 1] >> x: select f 5 append f 6 == [1 2 3 4 1 6] 20:51or, actually, select is done on a random value of appended f 20:54 >> f: [1 2 3 4 1] == [1 2 3 4 1] >> x: select f last append f 6 == none gltewalt:matrix.org 20:54Appends players choice to the weapons block, then random/only returns a value from the modified block, then select works on the weapons block with the value that was returned from random/only Moppy_gitlab 20:55what if the value returned by random/only is the last in the modified block? gltewalt:matrix.org 20:58Select finds the first match. And with contrained input, there's going to be more than one of those values. 20:59For example, if input values are constrained to 1 through four and the initial block is [1 2 3 4 1] GiuseppeChillemi 21:30I would like to set the consecutive elements of a block with all the elements of another one. I could arrange a function but if it already exists, I would use it. hiiamboris 21:33change? gltewalt:matrix.org 21:36What do you mean by "set the consecutive elements"? GiuseppeChillemi 21:57xxx [9 5 6 4] [1 2 3] - > [1 2 3 4] 21:58The content of the block on the right, replaces the first 3 elements inside the block on the left. Moppy_gitlab 21:59@GiuseppeChillemi swap 22:00https://www.red-by-example.org/#swap 22:04actually, change works better 22:04https://www.red-by-example.org/#change 22:06 >> x: [9 5 6 4] == [9 5 6 4] >> y: [1 2 3] == [1 2 3] >> change x y == [4] >> x == [1 2 3 4] GiuseppeChillemi 22:37Thank you all Tuesday 28th December, 2021 gltewalt 21:17This is pretty slick: https://rosettacode.org/wiki/Animation#Red greggirwin 22:22Indeed. gltewalt 22:29Where am I messing up with copy here? encrypt: func [txt [string!] key [integer!] /local temp][ temp: copy "" forall txt [append temp to-char add first txt key] ] decrypt: func spec-of :encrypt copy replace/deep body-of :encrypt 'add 'subtract 22:30Need to not change the original encrypt hiiamboris 22:39replace/deep gltewalt 22:43Oh.. copy/deep 22:45decrypt: func spec-of :encrypt replace/deep copy/deep body-of :encrypt '+ '- Thursday 30th December, 2021 Moppy_gitlab 01:56Is there any way of waiting for user input, without returning the input, like waiting for them to hit the enter key? greggirwin 02:01Is there a problem with just ignoring the input? The functions that don't return a value are the rare exception, often meant for use in the console. In this case, you could easily hack ask to create your own version that doesn't return a value (use unset!). Moppy_gitlab 02:03I'm making a console version of go fish, and I want the output to wait for the user so text doesn't just get spat out too fast for them to read. 02:07seems ask/hide might work greggirwin 02:08That just masks what the user types. But we need to add a doc string for that. Moppy_gitlab 02:12So is what I'm trying to do possible? Something with buffers? greggirwin 02:14 wait-for-enter: does [ ask "Press Enter to continue " () ; return unset! ] gltewalt 03:31Also, if you ever want ask with a newline: ask2: func [s][print s input] 03:38 reply: func [n msg][wait n print msg] 03:39prin reply 3 "...Hello?" 03:39wait pauses 03:47Modify ask with wait ? 03:47 ask-wait: func [ "Prompt the user for input" duration [number! time! block! none!] question [string!] /hide return: [string!] /local buffer ][ buffer: make string! 1 _set-buffer-history buffer head system/console/history _read-input question hide wait duration buffer ] greggirwin 03:51Fun variations @gltewalt. :+1: GiuseppeChillemi 09:01Do you have links to *construction syntax* articles and examples? hiiamboris 09:12It hasn't been designed. Not recommended to use. gltewalt:matrix.org 09:28How come function [arg1 arg2 [integer!]] isn't a thing? Moppy_gitlab 15:51@gltewalt:matrix.org ? can't you already do that? hiiamboris 15:55@gltewalt:matrix.org would you want otherwise write [arg1 [default!] arg2 [integer!]] instead? greggirwin 18:38> How come function [arg1 arg2 [integer!]] isn't a thing? What behavior do you want @gltewalt:matrix.org (assuming you include a body)? gltewalt:matrix.org 20:33For arg1 and arg2 to be declared integer 20:34"All the preceding words are integer!" Moppy_gitlab 20:53I tried writing a gofish program. It's really buggy and I don't really like it, so I think I'll abandon ship 20:53https://pastebin.com/raw/0MrzEucx 20:54I tried writing it all out, and then testing. Maybe writing and testing each part separately would have been better. 21:01The included file points to this script, which works just fine. https://rosettacode.org/wiki/Playing_cards#Red greggirwin 21:08@gltewalt:matrix.org that would be a big breaking change, and just a lateral move, not a definitive improvement. It would also complicate how the func spec dialect is handled, as a guess. That is, more lookahead is involved. gltewalt:matrix.org 22:33It could expand into arg1 [integer!] arg2 [integer!] In the source. GiuseppeChillemi 22:53@gltewalt:matrix.org note that generally args have description too, and you can't group them. greggirwin 22:59Good point @GiuseppeChillemi. @gltewalt:matrix.org I understand how it *could* work, but it's still a *big*, breaking change, isn't it? And is it demonstrably better? If so, show me how. gltewalt:matrix.org 23:11Is is breaking if it's a macro? As for descriptions... example: x and y don't need descriptions for x ** y greggirwin 23:14Macros *shouldn't* break things, but your first task is to convince me it's an actual improvement. For your own code, go for it if that's what you prefer. 23:15Actually, if the macro works to expand it they way you describe, it *would be* a breaking change. 23:17That is arg1 arg2 [integer!] expanding to arg1 [integer!] arg2 [integer!] breaks code. It would have to expand to arg1 [default!] arg2 [integer!], which maintains the current behavior, but that's not what you want. So it could *only* work for code that expects that pattern. Which makes it incompatible with Red code in general. gltewalt 23:19Could do func [[xy][integer!] z [ham!]] but that's too much [] greggirwin 23:42You keep suggesting things, but not defending how any of it is better than what we have now. gltewalt 23:58I'm surprised that it hasn't been an option since the REBOL 2 days. 23:59It's obvious to me that: function [ "some description" x y z [integer!] ] Or: function [ "some description" [x y z][integer!] ] Is better than: function [ "description" x [integer!] "description" y [integer!] "description" z [integer!] ] Friday 31st December, 2021 gltewalt 00:00If you have several words in a func that have the same type 00:00At least having the option to group some. Because sugar rules 00:02It's not going to happen - just surprised it has never been a thing greggirwin 00:03While it may be obvious to you, it's not to me. The great and terrible thing about people (not just programmers) is that we all see different obvious things. :^) 00:04Remember that some sugar is OK, but too much is bad for you. 00:08Remember, also, that you can do crazy things in Red. e.g. >> fn: func [integer! [string!]][print integer!] == func [integer! [string!]][print integer!] >> fn "x" x Keep that in mind as you design your macro. gltewalt 00:13Go Fish doesn't seem that complicated when explaining the rules human to human, but it's pretty involved to model with code Moppy_gitlab 01:41Just spotted that book-check only gets passed one argument in card-ask.... 01:42I'd rather redesign it from scratch than trying to patch it up though rebolek 07:34This is a bad idea: function [ "some description" x y z [integer!] ] You would gain one feature and lost an important one - the ability to *not* specify a type for an argument. This is better: function [ "some description" [x y z][integer!] ] However, you can write your own function constructor that would work this way, test it and if it makes sense, you can do a PR. I can already see some problems with it but they can be solved I guess. pekr 07:35+1 hiiamboris 08:44Main problem is that func spec is already hard to parse and this makes it even more complex :) 08:46Another: this syntax is already used for function attributes. GiuseppeChillemi 22:26To me, the highest priority on function specs is the ability to express different interfaces for the same function, sharing the body. I can fake it using using objects but it is tricky``**
