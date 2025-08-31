# Archived messages from: [gitter.im/red/red/code](/gitter.im/red/red/code/) from year: 2016

## Tuesday 8th March, 2016

meijeru

[10:21](#msg56dea7c3a549284116694819)I have updated my tile-game on my public \[Gist] (https://gist.github.com/meijeru/6bc3965cea4743e85fde). It interprets and compiles OK so I offer it for Showcasing . Interestingly the header is longer than the program text...

[10:22](#msg56dea7e3b0cc3f1b4150fdc2)How do I prevent inlining of urls?

dockimbel

[10:28](#msg56dea955a5492841166948a6)URL inlining: I don't know.

[10:30](#msg56dea9b6b0cc3f1b4150fe4f)@meijeru `if not` =&gt; `unless`

[10:32](#msg56deaa2e126367383571d784)`origin 0x0 across space 0x0` =&gt; `across` is already the default mode. The rest can be replaced by `view/tight` refinement.

meijeru

[10:56](#msg56deafed19834f3c3535be9d)I made the changes.

[11:05](#msg56deb1ff68c0777464835f08)I now also added a second version which randomizes the initial configuration. Because of the parity test on the random permutation, this one is rather bigger...

[11:06](#msg56deb21addfe3d4316289f7d)It is called %tile-game-2.red

Oldes

[11:33](#msg56deb89a817dfa1e41ed4c20)

[11:34](#msg56deb8c0a549284116694c76)Sorry.. just wanted to try to use the gist url with the markup without space between ] and ( but it does not work either. Silly gitter.

nickantonaccio

[12:28](#msg56dec577a549284116694f88)@meijeru I put this version of my original up on redprogramming .com a month or so ago:

view [  
title "Tile Game"  
backdrop silver  
style t: button 100x100 [  
x: face/offset  
face/offset: e/offset  
e/offset: x  
]  
t "8" t "7" t "6" return  
t "5" t "4" t "3" return  
t "2" t" 1" e: base silver  
]

[12:29](#msg56dec5b1817dfa1e41ed4f3e)it's missing the "next to" check, but is the shortest minimal example

dockimbel

[13:54](#msg56ded9a6817dfa1e41ed54cb)@nickantonaccio Thanks for the code. I'll use Rudolf's one for now, but your's should qualify for the "fits-in-a-tweet" category I want to open. Also, I'll put most of your Red code examples in red/code too.

## Thursday 17th March, 2016

Cybarite

[02:16](#msg56ea1392c7364f7926bfb7a3)It is probably a windows question instead of a Red question but I am baffled on how to launch Chrome via call. I can launch Red generated programs in the current directory or other; I can launch notepad and explorer but I cannot launch chrome.exe or even IE. I really want the ability to run rebol/2 browse with an option to specify target.  
Anyone on Win/7 ability to call "chrome.exe" or call "chrome.exe http://www.rebol.com"

[02:27](#msg56ea161e3194fbd11097c310)I don't want Doc answering because it feels like asking Steven Hawking: "Stever Are you sure the earth goes around the sun?"

dockimbel

[02:43](#msg56ea19ef9f24605773d8e61a)@Cybarite You just need to wrap the \[ShellExecute](https://support.microsoft.com/en-us/kb/224816) API. Sorry... ;-)

Cybarite

[04:23](#msg56ea313b3194fbd11097c760)Nice.  
These lines work to accomplish that in R2

```
sys-path: to-rebol-file get-env "SystemRoot"
    shell32: load/library sys-path/System32/shell32.dll
    ShellExecute: make routine! [
            hwnd         [integer!]
            lpOperation  [string!]
            lpFile       [string!]
            lpParameters [string!]
            lpDirectory  [integer!]
            nShowCmd     [integer!]
            return:      [integer!]
    ] shell32 "ShellExecuteA"

    RedBrowse: func [cmd [string!] args [string!]][
        ShellExecute 0 "open" cmd args 0 1
    ]
```

Then I can red-browse "chrome.exe" "http://github.com/red/red" from R2.

[04:27](#msg56ea323f6fde057c26878317)So browse in Red for me is just a few more hints away.

dockimbel

[04:40](#msg56ea35283194fbd11097c80a)@Cybarite Is Chrome your default browser?

[04:50](#msg56ea377e3194fbd11097c857)@Cybarite Here's a working example for implementing the `browse` command in Red:

```
Red []

#system [
	#import [
		"shell32.dll" stdcall [
			ShellExecute: "ShellExecuteW" [
				hwnd         [integer!]
				lpOperation  [c-string!]
				lpFile       [c-string!]
				lpParameters [integer!]
				lpDirectory  [integer!]
				nShowCmd     [integer!]
				return:      [integer!]
			]
		]
	]
]

browse: routine [url [url!]][
	ShellExecute 0 #u16 "open" unicode/to-utf16 as red-string! url 0 0 1
]

browse http://github.com/red/red
```

[04:53](#msg56ea38549f24605773d8eabd)It supports Unicode (unlike the Rebol2 version) and will run your default browser. It needs to be compiled as it embeds Red/System code. If you want to have it in the Red console, you can just `#include` that source code in `environment/console/gui-console.red`.

[05:48](#msg56ea4515c7364f7926bfbf26)@Cybarite Though, if the goal is to follow the changes in red/red repo, you could just craft a 3 lines scripts for that. ;-)

```
Red []

events: read https://api.github.com/repos/red/red/events
list: parse events [collect [any [thru "message" 3 skip keep to ["\n" | {"}]]]]
view [text-list data list]
```

Cybarite

[08:42](#msg56ea6e0e89dd3cce10073a04)@dockimbel Thanks Doc. I have a few apps in mind - usually involving showing informational webpages related to the topic. I was just using github/red/red as an example but the idea of pulling github events so easily is another example of the power of Red. Well done on this great endeavor.

## Sunday 27th March, 2016

fergus4

[00:53](#msg56f72ef511ea211749c23373)Can someone give me a short example of how to use Kaj's bindings so I can have date! available? I'm not able to get it to work....

dockimbel

[04:32](#msg56f762587c18711013e65261)@fergus4 Which features do you need exactly? Just ability to retrieve current date and time?

iArnold

[19:24](#msg56f8337b6d20f28b42f24a21)@fergus4 There are also examples given by Kaj on his bindings pages. Often you need a couple of bindings together. Get all of them by using the download.r script from this page http://red.esperconsultancy.nl/Red-test/dir?ci=tip

[19:29](#msg56f834ac7c18711013e653c7)Just #include the needed files. If you still face problems post your code somewhere (perhaps a gist) and we can see where you need some additions. Else take a look at the CLI program https://github.com/iArnold/Xiangqi/blob/master/xiangqi/xiangqi-console.red I use Kaj's bindings there too, right at the top.

fergus4

[23:18](#msg56f86a3f8d2a72471b7aa285)@dockimbel - I need to retrieve date and some basic ops like adding and subtracting days etc. Porting over a calendar app I made in R2 for FDNY work schedules. Once red Android is available I will be distributing it for testing...I can wait for a more mature red before public release....on iOS too I hope. I know Android market is larger world wide but in USA iOS is essential.

[23:20](#msg56f86aa276b6f9de194baff8)@iArnold Thanks, I have kaj's scripts but I think I may be having path problems. I'll check out your code too.

## Wednesday 30th March, 2016

StephaneVeneri

[20:43](#msg56fc3a83e4a8384a1bbd63d4)This is my first "big" program in Red (https://github.com/StephaneVeneri/redscripts/tree/master/3d/3dviewer.red): a viewer of ASC file (3d Studio ascii format). There are still many improvements to make but it's operational. I'm not a 3D expert, it's not the aim, but it's funny to do and I could practice the parse, object, view. You must click on the button for display the model (I must correct it). Here a screenshot:  
\[!\[3dviewer.png](https://files.gitter.im/red/red/code/NPse/thumb/3dviewer.png)](https://files.gitter.im/red/red/code/NPse/3dviewer.png)

qtxie

[23:52](#msg56fc66b7d39de41b495f289f)Wow, Great! On Mac OSX ?

## Thursday 31st March, 2016

ghost~5680c5f416b6c7089cc058a5

[03:30](#msg56fc99cbbbffcc665faac386)@StephaneVeneri Looks great....

[03:30](#msg56fc99e1d39de41b495f30f3)But IDK why but it works interpreted but does not compile --

[03:31](#msg56fc9a1276b6f9de194cb8d3)

```
λ red -c 3dviewer.red

-=== Red Compiler 0.6.0 ===-

Compiling /C/Users/ABC/Desktop/redscripts-master/3d/3dviewer.red ...
*** Compilation Error: invalid type specified: [[logic!] [string!]]
*** in file: %/C/Users/ABC/Desktop/redscripts-master/3d/3dviewer.red
*** near: []
```

dockimbel

[03:33](#msg56fc9a7e1a1ccc164832a035)@StephaneVeneri Wow, very very cool! :clap: Definitely a candidate for red/code!

[03:54](#msg56fc9f6ad087756f7c04203d)@StephaneVeneri Last expression in a function is always returned, so you can safely remove a good number of `return` calls in your functions. For example:

```
result: [true ""]
	return result
```

can just be:

```
[true ""]
```

PeterWAWood

[04:32](#msg56fca85b8d2a72471b7baac2)@StephaneVeneri One small comment on your code. You use

```
function
```

to define your

```
function!
```

values and include the

```
/local
```

refinement to "declare" your local words. The

```
function
```

"pre-processes" the body of the function so that there is no need to declare local variables. In fact, it has an

```
/extern
```

refinement to let you access variables bound to other contexts. If you use

```
func
```

to define your functions, you need to use the

```
/local
```

requirement to "declare" words to be local to the function context.

This code may be easy understand than my explanation:

```
red>> a: 1
== 1
red>> print a
1
red>> f: func [/local a b c] [a: "one" print a]
== func [/local a b c][a: "one" print a]
red>> f
one
red>> print a
1
red>> f1: function [] [a: "one" print a]
== func [/local a][a: "one" print a]
red>> f1
one
red>> print a
1
```

[04:33](#msg56fca8a8d39de41b495f3345)Personally, I use

```
func
```

with the

```
/local
```

requirement but many people prefer

```
function
```

.

bitbegin

[05:04](#msg56fcafea76b6f9de194cbc23)maybe swap func and function will be better, as func is a shortcut ,also we save letters in the arguments block

rebolek

[05:05](#msg56fcb0351720648112da39e9)@bitbegin but `function` does automatically declare local words, so it’s really useful.

dockimbel

[05:08](#msg56fcb0e1d087756f7c04205d)@rebolek I think he meant swapping the names.

bitbegin

[05:09](#msg56fcb0eebbffcc665faac715)i mean we should use func to do auto declare, function as strike mode

rebolek

[05:09](#msg56fcb0f654b9c4023d23db0b)Ah, sorry, I see.

bitbegin

[05:09](#msg56fcb0fad9b73e635f67da43)@dockimbel yes

rebolek

[05:09](#msg56fcb11254b9c4023d23db0d)I need more tea, it’s still early morning here ;)

bitbegin

[05:10](#msg56fcb13ad39de41b495f3484)严格 -&gt; i forgot it's english as i use phone

StephaneVeneri

[18:36](#msg56fd6e4676b6f9de194cf882)Thank you all for your comments.  
@qtxie Yes on Os X but with the help of wine. I hope execute my code without wine soon ;-) Wine works well most of time except with http request and image generation with draw.  
@nc-x Good question :-)  
@dockimbel I will be happy, I must clean the code and understand some concept, the parse's part was not simple for me, I have chosen to analyse the ASC file in one shot instead of line by line: I don't know which is the best solution.  
@PeterWAWood Good to know, noted. `func` exists for the compatibility with Rebol ?

PeterWAWood

[21:47](#msg56fd9adcd478c81e2cbbfba0)@StephaneVeneri Yes I believe

```
func
```

is named so to be compatible with Rebol.

## Friday 1st April, 2016

ghost~5680c5f416b6c7089cc058a5

[03:03](#msg56fde4f0d478c81e2cbc0975)@StephaneVeneri Created a fix for the compilation issue (Thanks to @rebolek :clap: ) https://github.com/StephaneVeneri/redscripts/pull/1

dockimbel

[04:39](#msg56fdfb811720648112da4192)@StephaneVeneri Parsing in one shot is usually a cleaner option.

## Saturday 2nd April, 2016

qtxie

[23:56](#msg57005c1911ea211749c43742)\[!\[3dduck.png](https://files.gitter.im/red/red/code/8RSB/thumb/3dduck.png)](https://files.gitter.im/red/red/code/8RSB/3dduck.png)

[23:56](#msg57005c1fbbffcc665fab9794)@StephaneVeneri Hope you will like it. ;-)

## Sunday 3th April, 2016

ghost~5680c5f416b6c7089cc058a5

[03:20](#msg57008c02d9b73e635f68b082)@qtxie Native OSX?

[03:20](#msg57008c05d9b73e635f68b084)Cool...

dockimbel

[04:39](#msg57009e8e54b9c4023d23edce)@nc-x Native OSX yes. ;-)

ghost~5680c5f416b6c7089cc058a5

[06:54](#msg5700be2776b6f9de194d9c96)@dockimbel How long to wait before native Android? :smile:

dockimbel

[06:55](#msg5700be6dd087756f7c0432ab)@nc-x Hard to say as I'm working on libRed support first, then I need to travel for 10 days at least. So I guess, maybe a prototype by the end of the month.

ghost~5680c5f416b6c7089cc058a5

[06:56](#msg5700be9811ea211749c440d1)Okay....

nodrygo

[06:56](#msg5700beaa11ea211749c440d5)and is somebody working on GTK ? or will it be after ?

ghost~5680c5f416b6c7089cc058a5

[06:56](#msg5700bead8d2a72471b7c87db)And what is libRed?

dockimbel

[06:57](#msg5700bede54b9c4023d23eddf)@nc-x Ability to have the Red runtime in a shared library, that can be used by Red executables (drastically reducing compilation times).

ghost~5680c5f416b6c7089cc058a5

[06:58](#msg5700bf11e4a8384a1bbe57e0)Faster compile times..... Yay!!!

dockimbel

[06:59](#msg5700bf4d54b9c4023d23ede1)@nodrygo Nobody at this point, not enough resources unfortunately... Though, GTK support should be pretty straightforward and probably even faster to bring in compared to the OSX backend.

nodrygo

[07:02](#msg5700bfede4a8384a1bbe57f3)@dockimbel thanks unfortunalty I have not yet knowledge of GTK and only fews days of Red :-(

gour

[07:07](#msg5700c13b54b9c4023d23ede8)@gour is in similar situation as @nodrygo, but with the desire to use Red+GTK

[08:09](#msg5700cfd41a1ccc164832b2ee)I also wonder if it would be feasible to take advantage of GIR (GObject Introspection) and write some tool in Red to automate GTK &amp; related bindings?

iArnold

[08:20](#msg5700d26bd9b73e635f68b78d)@dockimbel If GTK support is probably pretty straightforward indeed, maybe it is good to put some directions on how to start / do this. Then the people wanting GTK support are perhaps willing to take a shot at a development, perhaps even show what they are doing on GTK forums and maybe even get the attention of some GTK experts out there?  
I know this also will take up some of your precious time.

[08:26](#msg5700d398bbffcc665faba788)In the meantime people that use OSX are interested in following development of the OSX GUI. Posting about that in more detail than on Twitter can aid in creating more active collaboration from the community.

pekr

[08:36](#msg5700d5f68d2a72471b7c8a4b)Being away for 1-2 days, I can see some newcomers here, but also one other thing. Hopefully it is just me, but it is a bit difficult for me to follow discussions. I have to switch between several channels, and can see, that red/red became more of red/chat, and red/code became more of red/red :-)

gour

[08:38](#msg5700d6831a1ccc164832b2fb)@pekr maybe it would be good to provide description for each room? atm, afaics, only red/red has one

pekr

[08:39](#msg5700d6c9d39de41b49601466)I don't know. So far only the gui-branch room is mostly on-topic ...

iArnold

[08:46](#msg5700d87bd478c81e2cbc9333)I also saw some familiar names from the past join in and why are you/we chatting here? Back to red/red.. :)

[08:57](#msg5700db0411ea211749c44413)I read about object ownership. If an object owns data it can be notified if that data is changed? This is not the same as encapsulation. When an object owns data everyone else should keep its hand of off that data and only the object itself should be allowed to change the data. I'll have a hard time explaining this to OOP people. Obviously I missed something here.

dockimbel

[08:59](#msg5700db6754b9c4023d23ee2a)@iArnold GTK expertise is not required (it's very easy to acquire), Red, Red/System and Red/View expertise, is.

iArnold

[09:03](#msg5700dc6cbbffcc665faba8a2)Good thing all of Red is open source!

dockimbel

[09:06](#msg5700dd2b54b9c4023d23ee31)@iArnold That's why it's called "ownership", there's no such thing as "private" data in Red/Rebol objects, though there are some ways to hide it from external accesses (in the rare cases where it makes sense to do so). OOP is not only about Java-style class-based systems.

[09:08](#msg5700dd701a1ccc164832b309)@pekr Yes, posts here are mostly off-topic, this group is about the red/code repo and discussions about new submissions to that repo.

[09:10](#msg5700ddeb54b9c4023d23ee33)Chat group here are either related to repos (just check https://github.com/red) or related to the topic hinted by their name.

iArnold

[09:37](#msg5700e475d9b73e635f68b9a0)@dockimbel Unfortunately Java is very popular and lots of people think of OOP with Java in mind. Your explanation cleared this up, thanks!

StephaneVeneri

[10:49](#msg5700f549d478c81e2cbc9730)@qtxie Wow, I wasn’t hoping a functional version so soon. To do without wine would be happiness :smile:

## Monday 18th April, 2016

SteeveGit

[06:34](#msg57147ff95cd40114649c2792)@dockimbel , I made a new version of your profiler. It runs faster and I added callee &lt;- caller stats. For you to see, if it can replace the current one :-)  
\[profiler2](https://gist.github.com/SteeveGit/61d75b2abc9473b1b85c3a5e5f040f87)

[06:36](#msg5714807a548df1be102dc998)

```
Function                       Count      Elapsed Time         % of ET
------------------------------------------------------------------------
compile                        1          0:01:44.106          100.0
 < <root>                       1
comp-dialect                   1444       0:01:34.87           79.05
 < comp-func-body               1372
 < fetch-into                   67
 < run                          5
fetch-expression               85827      0:01:34.531          78.29
 < comp-func-args               34330
 < comp-block                   15462
 < comp-dialect                 13557
 < comp-assignment              9175
```

## Tuesday 19th April, 2016

SteeveGit

[19:14](#msg57168391a3833fbc566982c5)Updated the red's profiler (v2), added caller AND callee stats.  
Also included a use case to show how to use it when compiling the red's console.  
\[profiler2](https://gist.github.com/SteeveGit/61d75b2abc9473b1b85c3a5e5f040f87)

## Wednesday 11st May, 2016

iArnold

[09:09](#msg5732f6b112fa465406ebe56a)Created a red-master.zip download helper that automatically adds the commit number and a date mark to the filename. https://gist.github.com/iArnold/54c21d0cbd6fb2a9df50bec810b81c0e

rebolek

[09:10](#msg5732f711a4ce56890fc02a38)@Arnold why you first initialize string and then rewrite it with some value?

```
github-page: copy ""
github-page: read http://www.github.com/red/red
```

dockimbel

[09:11](#msg5732f746f9a53a60793dc05b)@rebolek @iArnold I was about to write the same... The first line is dead code (actually worse than dead code as it consumes some memory for nothing!). Similarly:

```
number-of-commits: copy ""
    foreach ch extracted-digits [
        number-of-commits: append number-of-commits ch
    ]
```

should be just:

```
number-of-commits: make string! length? extracted-digits
    foreach ch extracted-digits [append number-of-commits ch]
```

[09:15](#msg5732f838a351d8310952f365)Also `number-of-commits-string` is an overly long name, see the \[Coding Style Guide](https://dockimbel.gitbooks.io/red/content/style-guide.html) for proper word naming.

[09:19](#msg5732f922a351d8310952f3cb)Another one:

```
commit-date: copy ""
	foreach ch extract-commit-date [
		if ch <> #"-" [append commit-date ch]
	]
	commit-date
```

should be just:

```
trim/with extract-commit-date #"-"
```

pekr

[09:20](#msg5732f94712fa465406ebe669)Nice to remind oneself about the naming conventions, long time forgot about it ...

iArnold

[09:44](#msg5732ff05b51b0e2948512c6f)@dockimbel @rebolek Thank you for your suggestions. It is a bit of a habit I have to initialize variables beforehand and with all those appends I don't want to keep appending so make the string empty again. I will apply your improvements.

[09:56](#msg573301ca12fa465406ebe999)Updated, hope it now hurts your eyes less guys! ;-)

rebolek

[10:16](#msg57330699c77d484d3a5d3c00)@iArnold do not forget that we do not have variables in Red. In `x: copy ""`, on right side you create empty `string!` and on left side you create `word!` `x` and assign right side to it. If you then assign something else to it, like `x: my-func`, it does not overwrite that empty string from first line, it is still in memory (because of no GC, with GC it would be destroyed, but it is still extra work).

[10:18](#msg573306e673c6de9f0def6c77)@iArnold also those appends...to prevent them I tend to implement my own simple `join`, `rejoin`, etc... as one-liners, to not get lost in it ;-)

iArnold

[10:25](#msg57330883f36daf63798e9b48)Yes it (x) is more a pointer, which is why Red is flexible using the same name for different types of data.  
I often use those own one-liners on larger projects but on these quick and dirty one purpose programs I just use what Red provides.  
Just hope the Precompiled runtime comes quickly and officially supported mezz functions can provide functionality (until eventually natives come implemented when appliccable).

## Friday 3th June, 2016

iArnold

[12:11](#msg575173e110f0fed86f4afdd1)Again some code that will hurt your eyes:

```
cycle: [10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200 210 220 230 240 250 260 270 280 290 300 310 320 330 340 350 360 10]
n: 10
tau: pi * 2
gogo: func [][
	n: select cycle n
	flo: tau * n / 360
	print flo
	b1/draw: reduce ['pen 'red 'fill-pen 'yellow 'circle 200x200 50 'fill-pen 'blue 'circle 200x200 + as-pair 200 * sin flo 200 * cos flo 20]
	show b1
]
view [
	size 400x500
	origin 0x0
	b1: base 400x400 draw [pen red fill-pen yellow
	circle 200x200 50 fill-pen gray
	circle 200x200 20 ]
	return
	btn: button "gogo" [loop 10 [gogo wait 1]]
]
```

The print is to get an idea of the progress. All 10 floats are printed at once. No smooth orbit around the "Sun".

rebolek

[12:33](#msg5751790e8d6c68ee5a8f2343)@iArnold do not expect that you can use `wait`for animations without timer.

iArnold

[12:39](#msg57517a84e8163f872c4da3b0)No will have to wait for that.

dockimbel

[12:43](#msg57517b5d9be9c5b637f01802)@iArnold

```
cycle: [10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200 210 220 230 240 250 260 270 280 290 300 310 320 330 340 350 360 10]
n: 10
tau: pi * 2
gogo: func [][
    n: select cycle n
    flo: tau * n / 360
    print flo
    b1/draw: compose [pen red fill-pen yellow circle 200x200 50 fill-pen blue circle (200x200 + as-pair 200 * sin flo 200 * cos flo) 20]
    show b1
]
view [
    size 400x500
    origin 0x0
    b1: base 400x400 draw [pen red fill-pen yellow
    circle 200x200 50 fill-pen gray
    circle 200x200 20 ]
    return
    btn: button "gogo" [loop 10 [gogo loop 20 [do-events/no-wait wait 0.05]]]
]
```

pekr

[12:57](#msg57517eb53bdac7ae37b4486a)Interesting - when I closed the window, I got `*** Error: CreateWindowEx failed!`, then one other number and then window disappeared, but no cursor in console ...

iArnold

[13:00](#msg57517f61813c217c21d9d23a)Same here, Console inactive even added a second button to counterstrike

```
btn2: button "do events" [do-events unview]
```

[13:02](#msg57517fef813c217c21d9d275)Quality code.... :-D

[13:07](#msg57518120813c217c21d9d2f7)By the way thanx again @dockimbel

## Wednesday 15th June, 2016

iArnold

[12:13](#msg5761467252352c8402824f0a)Improved version: https://gist.github.com/iArnold/9189f6d7f9614d35ec526b4b5d9df25a

## Monday 20th June, 2016

SteeveGit

[07:50](#msg5767a04191d56ac9155c6202)Work in progress: \[rich-text area using draw dialect](https://youtu.be/2Q1NK\_o2lCQ)

endo64

[08:00](#msg5767a2a46577f032450cb831)Wow, GUI console would look really nice with this

dockimbel

[08:02](#msg5767a3196577f032450cb85b)@SteeveGit Very nice! ;-)

SteeveGit

[08:07](#msg5767a44891d56ac9155c6223)@endo64 It may happen ;-) @dockimbel Thanks

qtxie

[09:44](#msg5767baf6233bc24f5cb1c0b1)@SteeveGit Wow, Great! :+1:

SteeveGit

[09:45](#msg5767bb3febb74a972351b8ec)Thx

## Wednesday 29th June, 2016

mydoghasworms

[15:46](#msg5773ed62bb1de91c54a77cf3)@iArnold Nice one on the planet example. It was through your commit, I think, that I learned about Tau. Did you do something special to celebrate it yesterday?

[15:48](#msg5773ede91ac8bd1a4d932678)@SteeveGit That is excellent work on the rich-text area!

## Tuesday 5th July, 2016

Beastinlosers

[19:28](#msg577c0a5c9d3eadd7236c5b34)I need help compiling

greggirwin

[19:33](#msg577c0b870c16867678c47d5a)Specifically....?

Beastinlosers

[19:33](#msg577c0ba0e22c1b816ade14ec)It keeps giving me errors

[19:33](#msg577c0ba5e22c1b816ade1501)Wait one sec

[19:35](#msg577c0c050c16867678c48568)in cmd it says red is not recognized (which I could expect). Then the red console doesn't recognize -c as a value

[19:35](#msg577c0c129d3eadd7236c791d)So where should I be compiling

greggirwin

[19:37](#msg577c0c600c16867678c48b8f)Is Red in your path or are you specifying the exe name fully? You can't compile from within the console (yet).

[19:37](#msg577c0c724e50bf894a1d5d09)Or are you in the dir where the Red exe is?

Beastinlosers

[22:17](#msg577c3210ddcdcee623f57f48)i have the red exe and the the file im compiling in the same dir. Nothing else is in there

[22:18](#msg577c321b64f940856a163dc1)I'll add red to my path

[22:18](#msg577c3249c6b33f904a8c45c9)Got it to compile. thanks

[22:18](#msg577c32504e50bf894a1fc8c8)just needed to spell out the full name

[22:19](#msg577c327c4e50bf894a1fcbab)I figured when i launched the executable the first time and it set up, it automatically added it to my path

[22:20](#msg577c32924e50bf894a1fce05)Actually nvm

[22:20](#msg577c32a40c16867678c6fc5c)I'm not thinking straight

greggirwin

[22:44](#msg577c38334e50bf894a2021e1):^) Glad it's working.

Beastinlosers

[23:14](#msg577c3f3d64f940856a16f77e)Can I execute other red scripts within a script

[23:14](#msg577c3f49e22c1b816ae10396)To kinda mirror classes in java

[23:14](#msg577c3f57ddcdcee623f651de)classes + extend/implementation

## Wednesday 6th July, 2016

greggirwin

[00:03](#msg577c4aeee22c1b816ae1a41a)Yes, you can `do` a file. That evaluates the script, which may not be what you always want. e.g. you can `load` them instead. But `do` can take you far. You just don't want to `do` untrusted code.

Beastinlosers

[00:22](#msg577c4f4cc6b33f904a8de889)Thankyou

[00:22](#msg577c4f500c16867678c8a177)Thank you*

## Thursday 7th July, 2016

DarioX1973\_twitter

[13:05](#msg577e53a8064f828707d3a983)Hello! if i have

```
f: func [x [integer!] "the x value" y [integer!] "the y value"] [ x + y ]
```

how can i also write a comment for the function f, and set the type of the returning function?  
Thanks!

x8x

[16:36](#msg577e85157aeb080527703215)@DarioX1973\_twitter

```
f: func [
	"Return the sum of 2 values"
	x [integer!] "the x value"
	y [integer!] "the y value"
	return: [integer!]
][ x + y ]
```

DarioX1973\_twitter

[21:32](#msg577eca607aeb080527742144)ok thanks!

meijeru

[22:09](#msg577ed320bdafd191072eb6c7)The spreadsheet example in the blog is amazing! What power, by combining various features! And a testimony to the combinability of those features. Well done, @dockimbel !

DarioX1973\_twitter

[22:45](#msg577edb76064f828707dbc178)Really amazing, with so little code ...

## Friday 8th July, 2016

dockimbel

[17:02](#msg577fdcc31ca34a944ec7cf94)@meijeru Thank you Rudolf. Indeed, such application is a very good target for Red capabilities. I hope my article inspired some Red users to dig more into that direction, where Red can really deliver unmatched productivity.

[17:05](#msg577fdd6a7aeb080527817ecf)@meijeru FYI, that article generated more than 25k views on the Red web site today. ;-)

pekr

[17:07](#msg577fddef1ca34a944ec7db7d)Do you have more concrete sources available? E.g. Twitter vs HN vs Reddit? Just curious ...

x8x

[23:36](#msg57803900bdafd19107407c23)Can't but agree with @meijeru , that's an amazing example of Red power!! Fantastic @dockimbel !!

## Saturday 9th July, 2016

Rebol2Red

[22:55](#msg578180f7064f828707f9d5d9)

## Sunday 10th July, 2016

dockimbel

[04:57](#msg5781d5a1b79455146f7ff7d7)@x8x @DarioX1973\_twitter Thanks! Now imagine what people will say once we'll be able to run that same code in the browser. ;-)

[05:01](#msg5781d6b7bdafd19107503f59)@pekr So far for the traffic brought by picosheet article, HN: 30k, Reddit: 2k, Twitter: 3k. Reddit traffic is limited because I posted to /r/tinycode, /r/programming usually brings as much as HN.

## Monday 11st July, 2016

x8x

[07:47](#msg57834f07064f8287070bfe3e)@dockimbel Re: "run that same code in the browser" something new we should know? 8-P .. Last year I thought to get up to date on javascript.. to make it short, as soon as I learned a new "framework", a newer more shiny came out.. after countless js, css, loaders,.. frameworks, I gave up because that layer over layer of libraries to get simple stuff done and coming from the redbol world just made non sense. Now, being able to code web clients in Red that would be amazing! ..and coupled with a Red Cheyenne ( http://cheyenne-server.org/ an amazing server side, do what you want framework), I'll be confident not to need to look around for the new shiny whatever.  
Has anybody else felt the frustration of having to do something in another language and always wondering "Why is it so complicate, why that much code for simple things?" I guess that's the downside of living in the redbol world ;-)  
The future is bright! The future is Red! Long live Red! 8-)

[07:55](#msg578350db064f8287070c0dab)Just curious, are you targeting wasm or a Red to JS transpiler? In the short term a JS transpiler would be most beneficial. One thing that other languages have is wast amount of libraries, and one thing that is good in the JS world is a wast number of libraries that got the API right! Being able to use Red to orchestrate them, that would be power!!

pekr

[07:58](#msg5783518c7aeb080527a4d789)Curious about the plan too. But we can't see anything like that on the Roadmap oficially. Maybe Doc keeps it for a surprise, or it is not planned as a priority yet ...

x8x

[08:05](#msg5783533559cfbd4c5e741e11)I'm sure @dockimbel and @qtxie are working on many hidden gems we know nothing about! Why would Red development be soo slow if not?? ;-P

pekr

[08:10](#msg578354611ca34a944ee9f313)Well, looking into amount of commits, I am not sure it is slow ...

x8x

[08:22](#msg5783575e3eaf66535e71ad42)Better I clarify that before someone misunderstand.. It was https://www.youtube.com/watch?v=OoufpqB6-ig

greggirwin

[12:45](#msg578394e0064f8287070f4170)I always miss Redbol when I have to use something else.

dockimbel

[12:48](#msg578395837aeb080527a80692)@greggirwin Hopefully, at some point, Red will be able to cover all your needs, so you'll be able to enjoy it endlessly. ;-)

greggirwin

[12:48](#msg5783959fbdafd19107632b7c)Trying to help make my own future in that regard.

rebolek

[12:48](#msg578395a79cd76c2c5ca50017):)

dockimbel

[12:53](#msg578396cbbdafd1910763401b)Your future self will thank you for that. My current and future selves are already grateful for your help. ;-)

greggirwin

[12:58](#msg578397f17aeb080527a828db):^)

## Friday 15th July, 2016

endo64

[12:27](#msg5788d6a89f79ee4f2bb49458)I changed my PR red/code#5 to include only calculator.red clear button, reverted shuffle button from tile-game.red.

dockimbel

[12:30](#msg5788d7603c5129720e2cd68e)@endo64 Thanks!

## Monday 18th July, 2016

x8x

[18:21](#msg578d1e0c2d04e058517b9fec)Here is a non optimized but useful function to check global word, you can save a status then define some function, save another status, then get a list of all new words defined and list of words that have been redefined:

```
words: function [
	/set
		s [word!]
	/get
		g [word!]
	/list
	/full
	/show

	return: [block!]
][
	wl: []
	last-ws: []
	last-wh: []
	ws: clear make block! 500

	if full [return wl]
	if list [return parse wl [collect any[keep skip skip]]]
	if get [return select wl g]
	if show [
		do [	;crash if compiled..
			foreach i words/list [
				print append form i ":"
				print mold words/get i
				print mold intersect ws words/get i
				prin newline
				append ws words/get i
			]
		]
		exit
	]
	foreach w sort exclude words-of system/words [system words] [
		if value? w [
			append ws w
		]
	]

	either set [
		append wl s
		append/only wl copy []

		foreach w ws [
			;print mold w
			; h: md5 mold system/words/get w
			h: mold system/words/get w
			either i: find last-ws w [
				i: index? i
				if last-wh/:i <> h [
					append last wl w
					last-wh/:i: h
				]
			][
				append last wl w
				append last-ws w
				append last-wh h
			]
		]
		last wl
	][ws]
]
```

use like:

```
words/set 'red
;   [% * ** + - .get .set / // < << <= <> = == =? > >= >> >>> ? ?? ???...
  a: 1 b: 2 now: none
;   none
  words/set 'after-my-custom-stuff
;   [a b now]
  words/show
red:
[% * ** + - .get .set / // < << <= <> = == =? > >= >> >>> ? ?? ??? a-an ..]
[]

after-my-custom-stuff:
[a b now]
[now]
```

You can see that `a b now` have been defined and actually `now` has been redefined.

greggirwin

[18:34](#msg578d2118ac85f2507abef28f)Nice!

[18:37](#msg578d21e675045f8767f0788a)Cross posting my latest from the Help group:

```
time-marks: object [
    data: #()

    _key: func [key][(any [key #__DEFAULT])]

    _get: func [key][data/(_key key)]
    _set: func [key][data/(_key key): now/time/precise]
    _clr: func [key][data/(_key key): none]

    set 'get-time-mark   func [/key k] [_get k]
    set 'set-time-mark   func [/key k] [_set k]
    set 'clear-time-mark func [/key k] [_clr k]

    set 'time-since-mark func [/key k] [
        if none? _get k [
            print ["##ERROR time-since-mark called for unknown key:" _key k]
            return none
        ]
        now/time/precise - _get k
    ]
]
;print time-since-mark
;set-time-mark
;print time-since-mark
;wait 1
;set-time-mark/key 'a
;wait 2
;print [time-since-mark  time-since-mark/key 'a]
```

[18:47](#msg578d243e9f35137e67cc5c6a)If you don't want the default key bit, it should be as simple as this (UNTESTED):

```
time-marks: object [
	data: #()

	set 'set-time-mark   func [key] [data/:key: now/time/precise]
	set 'clear-time-mark func [key] [data/:key: none]
	
	set 'time-since-mark func [key] [
		if none? data/:key [
			print ["##ERROR time-since-mark called for unknown key:" key]
			return none
		]
		now/time/precise - data/:key
	]
]
```

And you don't \*really* need the `get-time-mark` func.

## Saturday 23th July, 2016

jouborg\_twitter

[20:14](#msg5793d0141d2852c8437e7af1)hi, I'm trying to write a simple echo server for websocketd

[20:14](#msg5793d0211d2852c8437e7b07)code: https://gist.github.com/joubertnel/43bba914a96f4b2319fec7cae8e4f18e

[20:14](#msg5793d04067c448730ef01231)the code does what I expect when running on the console.

[20:15](#msg5793d07cb92e27447fa69450)but when I run with websocketd (http://websocketd.com), STDOUT seems to only be triggered once the program exits. Is this because of STDIN/STDOUT buffering?

[20:15](#msg5793d07e67c448730ef015d6)something else?

[23:30](#msg5793fe199d9e974a7f7292a1)what does the #system directive do?

[23:30](#msg5793fe33bc636a263ee2b1f4)I'm reading through https://github.com/red/red/blob/23a63d20ac73bd30419791ca58bc696f3aeac7be/environment/console/input.red and trying to understand the code better

[23:31](#msg5793fe6b959ee82b3e48f479)Looking online, the only reference I see to the #system directive is in the section http://static.red-lang.org/red-system-specs-light.html#section-16.8

[23:32](#msg5793fe73959ee82b3e48f488)but doesn't explain what #system actually does

## Sunday 24th July, 2016

PeterWAWood

[00:39](#msg57940e3f67c448730ef1dd4a)Please don't ask the same questions in different channels.

jouborg\_twitter

[00:44](#msg57940f82959ee82b3e495d53)@PeterWAWood roger. Still figuring out what the different channels are for. It isn't obvious to me.

dockimbel

[09:24](#msg579489651b9de56c0edafffc)@jouborg\_twitter Most likely buffering issue. @qtxie What do you think?

[09:25](#msg57948981959ee82b3e4caa63)@jouborg\_twitter This room is for discussing submissions to the \[red/code](https://github.com/red/code) repository. Help with coding is best provided from \[red/help](https://gitter.im/red/help).

PeterWAWood

[10:19](#msg579496341b9de56c0edb5903)@jouborg\_twitter This may help - \[List of Rooms](https://github.com/red/red/wiki/Gitter-Room-Index)

jouborg\_twitter

[13:46](#msg5794c6a59d9e974a7f788e78)@PeterWAWood great, that makes it clear

## Wednesday 3th August, 2016

gour

[11:48](#msg57a1d9f847659bfb108ae0eb)i might add that my belief is that having \*\*less\** Red-related rooms would be better and more effective...most of the open-source projects live with either single or at most two (user &amp; dev) IRC channels...

pekr

[11:52](#msg57a1db0d836d2d0211603055)We are used to that from the AltMe environement. If ppl keep it on topic, it just works ...

SteeveGit

[11:54](#msg57a1db83c2cebb0412466d7c)The Problem is that a lot of submissions are more related to learning Rebol basic skills than specific Red's ones. Yet, we still need to provide support for both.

gour

[12:01](#msg57a1dd220bd017c16e38172f)well, more rooms/channels is just more difficult to track...irc-like medium is usually not used for strict-on-topic talk...

x8x

[20:35](#msg57a255889e85d3e826846a3f)@pekr for those who miss `help to-`:

```
what: function [
	"Lists all functions, or search for them"
	/?
		:s [word! string! block!]
][
	words: either ? [
		either block? s [
			s
		][
			s: form s
			r: clear []
			foreach w words-of system/words [
				if all[
					find form w s
					value? w
				][append r w]
			]
			r
		]
	][words-of system/words]
	foreach w sort words [
		if all [word? w any-function? get/any :w][
			prin pad form w 15
			spec: spec-of get w

			either any [
				string? desc: spec/1
				string? desc: spec/2
			][
				print [#":" desc]
			][
				prin lf
			]
		]
	]
	exit
]
```

use as:

```
what/? to-
hex-to-rgb     : Converts a color in hex format to a tuple value; returns NONE if it fails
to-binary      : Return string converted to UTF-8 binary.
to-hex         : Converts numeric value to a hex issue! datatype (with leading # and 0's)
to-image       
to-integer     : Return integer converted from other types.
to-local-file  : Converts a Red file path to the local system file path
```

## Saturday 6th August, 2016

x8x

[20:15](#msg57a6454f2f03cf8749ccd91b)Wondering why `stats` is updated only every 2 passes:

```
a: make string! 1024000
loop 1024000 [append a #"0"]
ls: stats
repeat n 10 [
	copy a
	s: stats
	print [n s s - ls]
	ls: s
]
```

```
1 7520256 2101248
2 7520256 0
3 9621504 2101248
4 9621504 0
5 11722752 2101248
6 11722752 0
7 13824000 2101248
8 13824000 0
9 15925248 2101248
10 15925248 0
```

## Sunday 7th August, 2016

dockimbel

[04:47](#msg57a6bd55fb162b752ca4caa5)@x8x This room is for discussing submissions to \[red/code](https://github.com/red/code) repository.

SteeveGit

[04:51](#msg57a6be40ac014d6a097cb01c)Good day Nenad, btw I refreshed my last push for red/code. Seems you didn't notice.

dockimbel

[04:51](#msg57a6be5948422f8b4975b6c1)@SteeveGit Hi, saw it, but forgot to merge it. Done now.

SteeveGit

[04:53](#msg57a6bed5e8441a917903d099):laughing:

dockimbel

[04:54](#msg57a6bf22978997001e9ce967)@x8x The information returned by `stats` is currently the allocated memory from the OS, not the memory in-use by Red runtime.

x8x

[05:30](#msg57a6c7822f03cf8749cdb18a)@dockimbel Ok, sorry, lost track of which room is what.. :worried:

dander

[20:17](#msg57a797742f03cf8749cf23ab).

## Friday 19th August, 2016

Arie-vw

[14:36](#msg57b71983b64a3a016f4cb5fc)@x8x use help "to-" do do that!

## Sunday 28th August, 2016

geekyi

[23:26](#msg57c37339e353af447b39058f)`Scripts/perlin.red`

```
Compiling to native code...
*** Compilation Error: undefined symbol: red/integer/to-float
*** in file: %/C/Users/XXX/Documents/GitHub/red/code/Scripts/modules/view/styles.red
*** in function: exec/noise
*** at line: 1858
*** near: [
    integer/to-float idx/value - 128
]
```

dockimbel

[23:27](#msg57c3737742e38279218126b6)@geekyI You need to use the https://github.com/red/code/tree/0.6.2 branch.

geekyi

[23:28](#msg57c3738e42e38279218126d8)Ah, ok thanks

[23:39](#msg57c376483cdeb6467b7a4f7f)Had a moment of stupidity there trying to switch on red/red :sweat\_smile:

[23:41](#msg57c376aff6fe00361e093a66)I suppose you guys know that it doesn't work on 0.6.1 either? Initially was trying on 0.6.1 stable, it has a stackoverflow error on trying to run after compile

dockimbel

[23:43](#msg57c3771c8147d91e790a6c79)Does it work fine with 0.6.2 branch?

geekyi

[23:45](#msg57c377a03cdeb6467b7a52af)Compiling..

[23:46](#msg57c377c5f6fe00361e093cf5)Yeah it works :D red latest build, red/code 0.6.2 branch

## Monday 21st November, 2016

gearss

[00:33](#msg583240cab7cf637f2ac66ba8)I am new to Red, how can I find some Red sample codes to learn?

Phryxe

[05:48](#msg58328ab5b563b5516c464a86)&gt; I am new to Red, how can I find some Red sample codes to learn?

http://www.red-lang.org/

RiVeND

[11:15](#msg5832d75ae712c9a11893a0e4)@gearss A few more: http://redprogramming.com/Home.html

[11:15](#msg5832d769b7cf637f2ac92809)https://gist.github.com/dockimbel

[11:16](#msg5832d7975eb8ea792a48c98c)http://www.mycode4fun.co.uk/red-apps

[11:17](#msg5832d7b523ce1ae73c0a427c)http://www.red-by-example.org/

geekyi

[13:18](#msg5832f43db7cf637f2ac9c7fd)@gearss the red/code repo itself. Also, rebol 2 is almost the same

greggirwin

[16:18](#msg58331e412db952670461cfe7)@gearss, and you can ask specific questions here, in the red/help or red/red/welcome rooms.

## Tuesday 22nd November, 2016

gearss

[23:33](#msg5834d5d8c790e0ec561d2a13)my red codes works well on windows platform, if its running graphic effect and result is the same as the one on android platform?

[23:36](#msg5834d67f9a5479d0484cdfc1)how about the difference between the script code running speed and complied code running speed?

greggirwin

[23:44](#msg5834d85d16ee9e64047443d1)The goal is for behavior to be the same, or very close, on all platforms. Of course, by using native controls some things will vary. Team Red has done a lot of homework on the graphic effects side, as they designed things.

Speed will depend on what you're doing. Average text processing and such may not see much speedup, but heavy duty number crunching might.

[23:45](#msg5834d89b2db95267046c175b)There will always be exceptions but, with Red, \*how* you write your code will make a bigger difference than interpreted vs compiled. Kind of how better algorithms trump having a faster machine.

## Friday 9th December, 2016

dockimbel

[10:53](#msg584a8d10b4ffd59e380792d1)`9, 4, w, u, t` are not valid digits in base 2.

9214

[10:56](#msg584a8dd0bb7d528222d7be7e)oh, my bad, mixed up `debase` and `enbase` :disappointed\_relieved:

dockimbel

[10:56](#msg584a8df9f666c5a138eecaf9)Happens to me also. ;-)

## Friday 30th December, 2016

geekyi

[16:34](#msg58668ca1af6b364a2911b924):point\_up: \[December 28, 2016 10:08 PM](https://gitter.im/red/red?at=5863f17fc02c1a3959c0b4cd) @9214 mentioned forth haiku, and @maximvl made a demo (wip) \[gist](https://gist.github.com/maximvl/81f31f26b49a7a3a5891b9a63f47171a) putting here for future reference
