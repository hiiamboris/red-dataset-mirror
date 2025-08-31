# Archived messages from: [gitter.im/red/bugs](/gitter.im/red/bugs/) from year: 2017

## Friday 28th April, 2017

x8x

[07:08](#msg5902ea58cfec91927281fb3f)File `test`:

```
Red []

? system/script
```

Linux:

```
# ./red test
*** Script Error: image! has no value
*** Where: =
```

macOS:

```
# red red/read/test

*** Runtime Error 27: non-existent physical address
*** at: A17340E4h
```

dockimbel

[07:13](#msg5902eba7f22385553d84878b)@x8x Confirmed on Linux using `red-28apr17-bbd8e43`.

x8x

[07:50](#msg5902f43ccfec919272822641)I have an issue on macOS, open a Terminal.app window with 2 tabs, now run red console in one and paste this code:

```
to-int: function [value [percent!]][to integer! 255 * value]

view [
    below
    r: slider
    g: slider
    b: slider
    base react [
        face/color: as-color to-int r/data to-int g/data to-int b/data
    ]
]
```

Now after closing the `View` window I notice a 2 seconds delay when switching Terminal.app tabs,  
also the window closing should be instantly but it also has a delay.  
Now paste again above code and I get this https://pastebin.com/raw/4tADZxHG in the Terminal Window while the View window runs fine.  
Never seen this latency with any other software.  
Another strangeness, while red console is open (compiled with View) the icon in the Dock when control-clicked says `Application Not Responding`, normally that is only for unresponsive apps.

[07:54](#msg5902f5538e4b63533d10aea0)Well it's worst, all my UI clicks suffer delays until I close red, not sure how to debug that.

[07:57](#msg5902f6028fcce56b204512ce)It is not a recent regression.

dockimbel

[09:13](#msg590307bb8fcce56b20455a8a)@qtxie ^---

qtxie

[09:27](#msg59030b1512d2409935a81beb)@x8x Thanks. I'll check that. Are you using macOS 10.12?

[12:05](#msg5903301a12d2409935a8bb7a)Seems only the console has this problem. When compile the script as a standalone executable, it works fine.

x8x

[12:19](#msg5903335bcfec9192728341c8)yes 10.12, yes interpreted, didn't try compiled

dander

[16:46](#msg590371f5587a245e245a10c6)I know this is not the right way to define an `op!`, but it looks like it works at first, and can generate a crash:

```
>> plus: make op! [[x y][x + y]]
== make op! [[x y]]
>> ? plus
USAGE:
        x plus y

DESCRIPTION:

        PLUS is an op! value

ARGUMENTS:
        x
        y
>> 1 plus 1

*** Runtime Error 1: access violation
*** at: 02BD5F0Ch
```

## Saturday 29th April, 2017

dockimbel

[16:28](#msg5904bf3e587a245e245e893a)@dander Worth a ticket, for the crash, and for blocking such syntax. An `op!` is just the infix version of a prefix binary function, it has no constructor defined for a spec/body blocks input.

dander

[17:00](#msg5904c6c78e4b63533d1785a7)@dockimbel two separate tickets? or just one?

## Sunday 30th April, 2017

dockimbel

[05:11](#msg590572096aea30763d56d006)Just one.

maximvl

[15:19](#msg5906009412d2409935b23fcc)I saw directory loading in Rebol examples, but in Red it fails with a cryptic error:

```
>> load %.
*** Script Error: transcode does not allow block! for its <anon> argument
*** Where: transcode
```

meijeru

[17:04](#msg59061931d32c6f2f0955e6e2)Shouldn't that be `read %.` ???

maximvl

[23:10](#msg59066eedcfec9192728e3aae)@meijeru `read` works, but maybe there was a plan for `load` too, as in Rebol

## Monday 1st May, 2017

dockimbel

[08:59](#msg5906f8e5c1d3b5015439391d)@maximvl I'm not sure if that's an intended feature in Rebol, or a side-effect of the implementation. We'll see once we implement the file and directory ports in 0.7.0.

## Tuesday 9th May, 2017

x8x

[10:29](#msg59119a05551ea6485ba8109f)Just been bitten again by the copy/paste/autocomplete issue.. pretty annoying and now that we have presenters doing copy/paste it is maybe time to consider fixing it 😜

[10:31](#msg59119a944746d29d249a0c01)This should work right? (note that there is a `tab` before `;comment`

```
f: func [
	fun	;comment
][fun]
f 1
```

but this is what comes by pasting in console:

```
f: func [
[    func function function! function? 
[     func;comment
[    ][fun]
;   func [
    func
][fun]
  f 1
*** Script Error: fun has no value
*** Where: f
```

[10:35](#msg59119b7eb88c0f5a04268b6d)There are 2 issues open about this https://github.com/red/red/issues/1164 and https://github.com/red/red/issues/2265

qtxie

[23:17](#msg59124e158a05641b1167dfc9)@x8x Just tried the `bracketed paste mode` on Mac, it can be used to fix this issue. Will push a fix later. :smile:

x8x

[23:23](#msg59124f70e4cfd50062a5e069)Thank you very much @qtxie ! This is really great! From what I read it should work also on Linux while on Windows, I really don't know.. 😉

[23:33](#msg591251e6e4cfd50062a5e094)While you are at escape sequences.. 😁, if it's not too complicate could you have a look also at these 2 issues https://github.com/red/red/issues/1844 https://github.com/red/red/issues/1845 . Just a wish 🤓.

## Wednesday 10th May, 2017

x8x

[08:49](#msg5912d42273b39c5f1573c476)Wonderful THANKS !! Works in macOS and Linux! Well done! :smile:

qtxie

[09:23](#msg5912dbf68a05641b1169eb20)For issue #1845, I have an idea how to fix it, but more code need to write, so I'll postone it.

x8x

[09:27](#msg5912dd02e4cfd50062a5e7ca)No hurry and thanks for looking into it!

## Thursday 11st May, 2017

geekyi

[13:40](#msg591469db2b926f8a6744d3d0)@x8x I guess it's not much of a problem on windows because of `gui-console`. Also, I guess we don't need anything like that on Unix?

## Sunday 14th May, 2017

x8x

[17:54](#msg591899bd331deef464691306)The workaround in compiled scripts till we get dyn-stack is to `do` the block containing a function passed as an argument.  
My understanding is that what is in the `do` block will run interpreted at execution time.  
So I'm wondering if this is also related to missing dyn-stack or a bug.  
This script:

```
Red []

object [
	a: func [i][i]
	set 'b func [f][do [f 1]]
	set 'c does [b func [i][print a i]]
]
c
```

when compiled and executed, returns:

```
?function?
```

That is the `a` function called in the function passed as an argument to function `b` inside function `c` should be executed interpreted as it is evaluated inside the `do` block in the body of function `b`.  
But `a` is not executed, it returns instead it's function value.  
To get it properly working I have to write it like this:

```
Red []

object [
	a: func [i][i]
	set 'b func [f][do [f 1]]
	set 'c does [b func [i][print do [a i]]]
]
c
```

That is `do [a i]` instead of `a i` inside the function passed as argument to function `b` that is run inside the `do` block of function `b`  
Hopefully I'm clear enough ;-)

[18:04](#msg59189c16741056301282e9b9)Also I'm wondering if writing code that needs the dyn-stack is bad style ( probably due to too much freedom in rebol ) and just curious if there is an eta for when the dyn-stack will come. 🤓

## Monday 15th May, 2017

dockimbel

[06:20](#msg5919489c92217cca5878c619)You can't have your cake and eat it too, either you want to use a very flexible style, and it won't be compilable, in such case, wrap your whole code in a `do`, so that the interpreter takes over it (maybe we should make that a compilation option) and you won't be limited by the compiler. Dyn-stack branch should solve most (maybe all those cases), though, performances will suffer from it, for use cases like that (closer to interpreted performances than compiled ones). No ETA, they are too many other higher priority tasks for now.

x8x

[06:23](#msg5919497a5dc6925a7a443714)@dockimbel Thanks, but why would `a` returns it's function value and not be executed instead?

dockimbel

[06:27](#msg59194a3bf3001cd3422137a3)Because compiling functions in functions is not well supported by the compiler for now. I plan to work on that once we implement the HOF.

x8x

[06:27](#msg59194a4e331deef464691822)How should I write the same functionality in a way that would please the compiler?

dockimbel

[06:28](#msg59194a87c4d73f445aa9b149)Just wrap the expression in `do` as you did in the second example.

x8x

[06:29](#msg59194ae4331deef46469182a)OK thanks! 😊

geekyi

[11:22](#msg59198f8000efc2bb3e6bdc70)@x8x :point\_up: \[May 14, 2017 10:54 PM](https://gitter.im/red/bugs?at=591899bd331deef464691306)  
&gt; The workaround in compiled scripts till we get dyn-stack

Did you put this info in a github issue (If I'm remembering correctly)? So that info is not lost.  
Probably worth putting in the wiki under a.. maybe `Red[] Compilation troubleshoot`?  
It's in the gray area between the interpreter, and \*Red/System*

[11:23](#msg59198fa400efc2bb3e6bdd47)https://github.com/red/red/issues/2485#issuecomment-294886825

[11:24](#msg59199006f3001cd342225e86)I find there's quite a log of bugs like this, and the workaround in most cases is to `do` it

maximvl

[20:14](#msg591a0c302b926f8a675b0589)Inside `system/view/evt-names` in latest windows build:

```
key-up on-key-up 
    ime on-ime 
    focus on-focus
```

[20:15](#msg591a0c502b926f8a675b073a)seems like somebody forgot to throw out the second line

[20:15](#msg591a0c59631b8e4e61dbc899)cause `time on-time` is there

## Tuesday 16th May, 2017

qtxie

[02:27](#msg591a63aa83cb5db07335abf4)@maximvl This event is for \[input method editor(IME)](https://en.wikipedia.org/wiki/Input\_method) support.

maximvl

[07:02](#msg591aa3f42b926f8a675d408a)oh, I see

## Sunday 21st May, 2017

meijeru

[21:35](#msg59220837f3001cd34244c48c)I am puzzled about `continue`. The help says "Throws control back to top of loop" and from a few tests I suspect that this is indeed what it does: restart the loop body with the loop counter the same as it was. But that leads to endless loops. Shouldn't it rather throw control to the \*end* of the loop, where the loop counter is tested and possibly increased?

## Monday 22nd May, 2017

dockimbel

[02:59](#msg59225409f3001cd34245cb62)@meijeru

```
>> loop 3 [continue]
>>
```

Where is the issue?

geekyi

[06:25](#msg5922844aeec422e415d7637e)@meijeru  
`loop`, `while`,`until`: no counter, \*NA*  
`repeat`: counter increases  
`forall`: \*infinite loop (implying counter doesn't increase)*  
`foreach`: counter increases

rebolek

[06:27](#msg592284dd2b926f8a677ca23d)@meijeru can I see some example, where the counter does not increase? Here's one where it does:

```
>> repeat i 5 [if odd? i [continue] print i]
2
4
```

geekyi

[06:34](#msg592286690a783b6c0ac1289e)

```
red
things: [1 2 3]
forall things [if 2 < first things [break] print things continue]
```

[06:35](#msg592286bc631b8e4e61fd7b5b)(warning: infinite loop)

rebolek

[06:37](#msg59228736eec422e415d7726e)Interesting, thanks. But the infinite loop happens only when `continue` is last value:

```
>> things: [1 2 3 4 5 6] forall things [if 4 < first things [continue] print things]
1 2 3 4 5 6
2 3 4 5 6
3 4 5 6
4 5 6
```

geekyi

[06:40](#msg592287c85e34568d5e7ae8e7)@rebolek not for me, maybe because you don't reset to `head things`?

[06:41](#msg59228826f3001cd34246886a)

```
>> system/build
== make object! [
    date: "13-May-2017/3:26:47+5:00"
```

rebolek

[06:42](#msg5922884bfa63ba2f76685bae)@geekyi You've changed your example, I had infinite loop with first one, what's the point of resetting to head, when in cannot be reached due to infinite loop?

geekyi

[06:42](#msg5922886cc4d73f445aceef3a)@rebolek good point..

rebolek

[06:43](#msg59228885c4d73f445aceef7c)Sorry, I was wrong, there is infinite loop even with my code.

geekyi

[06:43](#msg592288ae0a783b6c0ac130ec)Ah, ok.. I was trying to reproduce your condition :smile:

rebolek

[06:44](#msg592288cf92217cca589e24a0)It's Monday morning... ;)

meijeru

[06:56](#msg59228bac05e3326c67f78f57)It is as I suspected: an infinite loop with `forall`. I will make the issue later today.

[06:57](#msg59228bd7c4d73f445acefd88)No need. Doc made it himself...

rebolek

[07:03](#msg59228d3892217cca589e3a16)...and released a fix for it :)

dockimbel

[07:03](#msg59228d3805e3326c67f7970a)... and fixed now: https://github.com/red/red/issues/2707

meijeru

[18:44](#msg592331935e34568d5e7df8b9)See `%interpreter.reds` at lines 215 - 220. There is a definite typo

```
switch TYPE_OF(arg) [		
					TYPE_LOGIC	 [push logic/get arg]
					TYPE_INTEGER [push integer/get arg]
					TYPE_LOGIC	 [push float/get arg]
					default		 [push arg]
				]
```

The second `TYPE_LOGIC` should be `TYPE_FLOAT`

## Tuesday 23th May, 2017

dockimbel

[04:22](#msg5923b91800efc2bb3e9569e9)@meijeru Good catch, fixed now.

AlexanderBaggett

[16:46](#msg592467499f4f4ab05bf2b69a)Geeky told me I should post this here. There is a way to create a set of windows such that you Lockup the REPL in Red.

[16:46](#msg5924675efcbbe1891c392857)

```
p: layout [ 
            button "Create" [
                do view [
                    button "Lockup Red REPL"[
                        unview/only p 
                        view p 
                        unview 
                        unview p 
                    ]
                ]
            ]
]
view p
```

[16:46](#msg592467800a783b6c0ac96bd8)The basic idea is simple. You create a window. You create a child window. You close the parent window from an event from the child window. After doing that the REPL is locked. Even if you close the child window, or re-open and reclose the parent window from the child window, the REPL stays locked.

[16:48](#msg592467cefcbbe1891c392b17)@dockimbel , Is this something we should open a github issue for?

geekyi

[18:37](#msg5924815bfa63ba2f76718fad)Additional info from bolek:

[18:37](#msg59248187fa63ba2f7671908f)&gt;

```
p: layout [ 
            button "Create" [
                do view [
                    button "Lockup Red REPL"[
                        unview/only p 
                        view p 
                        unview 
                        unview/only p 
                    ]
                ]
            ]
]
view p
```

[18:38](#msg59248193fa63ba2f767190fb)This code doesn't lockup

## Wednesday 24th May, 2017

dockimbel

[02:04](#msg5924ea1d00efc2bb3e9acb74)@AlexanderBaggett What is the `do` in `do view` for?

[02:05](#msg5924ea4d05e3326c670204a3)@qtxie Please have a look at the above case.

AlexanderBaggett

[13:48](#msg59258f37fcbbe1891c3e141e)@dockimbel , it's not important to the reproduction of the issue. You can leave it out. Its really just part of my particular coding style.

dockimbel

[16:06](#msg5925af95fcbbe1891c3ec6a0)@AlexanderBaggett FYI, `do view` will try to evaluate the return value of `view`, which is very odd, as `view`should return a face or a value from the event loop.

## Monday 29th May, 2017

geekyi

[13:29](#msg592c223500efc2bb3eb66fa4):point\_left: \[May 29, 2017 2:48 AM](https://gitter.im/red/help?at=592b45b02b926f8a67a01de7) view and borders, what I'm getting:

[13:29](#msg592c2249cb83ba6a410d5d0f)\[!\[image.png](https://files.gitter.im/red/bugs/tPGJ/thumb/image.png)](https://files.gitter.im/red/bugs/tPGJ/image.png)

[13:30](#msg592c2261fcbbe1891c5709e9)Only `popup` doesn't have borders, a different result from what @justjenny is getting (`noflags` doesn't work for her either)

[13:32](#msg592c22ed00efc2bb3eb6731e)But also reproducible with python and rebol (?)

[13:34](#msg592c2348cb83ba6a410d6253)Win 10 1607

[13:35](#msg592c23a22b926f8a67a34a9c)What popup looks like when focused (only top blue border is visible):

[13:35](#msg592c23aafcbbe1891c570f5c)\[!\[image.png](https://files.gitter.im/red/bugs/M2Dc/thumb/image.png)](https://files.gitter.im/red/bugs/M2Dc/image.png)

dockimbel

[14:10](#msg592c2bd75e34568d5ea0b520)@geekyi I'm not sure to understand what problem you are reporting, could you be more specific (expectation vs result)?

[14:14](#msg592c2ce3cb83ba6a410d8bc4)We are currently working on improving window size depending on the set of flags used, so we're very interested in issues about that.

geekyi

[14:19](#msg592c2dee631b8e4e6123d857)@dockimbel just trying to reproduce

dockimbel

[14:21](#msg592c2e7f631b8e4e6123db78)@geekyi Ok, so you didn't notice any issue there?

geekyi

[15:02](#msg592c381d631b8e4e61240791)Sorry @dockimbel not sure if you got my last message. On mobile. So here's it again. I was able to reproduce in `popup`. With @justjenny bug with borders, if you see the last image, the popup version doesn't have blue border except at the top. Given, it's just a minor visual thing. And jenny says it happens with python and rebol too (which I've not checked)

dockimbel

[16:10](#msg592c480a2b926f8a67a3ec19)@geekyi Thanks, I will investigate that tomorrow. As I'm not a regular Win10 user, I'm not sure if that's the expected layout for a popup window or not.

meijeru

[17:37](#msg592c5c43631b8e4e6124a544)Saw the `Showcase/last-commits.red` example. Great! Only, when I run it as is, the window is minimal size, and cannot be enlarged. I had to add dimensions to the text-list (say 800x600) in order to have a useful picture. Missing or wrong default size for text-list?

greggirwin

[18:07](#msg592c6367631b8e4e6124c2ba)What OS @meijeru? Works on Windows here. Text list is 454x155 that demo.

Very cool demo BTW!

meijeru

[20:05](#msg592c7eefeec422e415fe6434)W10. I use the 23 May build. Maybe something improved since....

geekyi

[21:02](#msg592c8c790a783b6c0ae88fa7)@meijeru I think it's always been that way, i.e, you can't maximize, try `view/flags [] 'resize`

[21:04](#msg592c8cf8631b8e4e61256829)But even without it, gives me a useful, scrollable layout

[21:05](#msg592c8d30fcbbe1891c58c7ac)\[!\[image.png](https://files.gitter.im/red/bugs/6rcu/thumb/image.png)](https://files.gitter.im/red/bugs/6rcu/image.png)

[21:08](#msg592c8deac4d73f445af6e2c8)Tried May 19 build, works the same for me

## Tuesday 30th May, 2017

dockimbel

[02:44](#msg592cdca60ba4d59763f2cd90)@meijeru We don't have built-in resizing yet, you need to pass the flags to `view`, then write the resizing event handler yourself.

[02:46](#msg592cdd145e34568d5ea37023)BTW, that demo code can be rewritten as a single expression:

```
view [
	text-list data parse 
		read https://api.github.com/repos/red/red/events
		[collect [any [thru "message" 3 skip keep to ["\n" | {"}]]]]
]
```

As I don't think that mixing a lot of Red code inside VID dialect is very readable, I opted for the separated expressions outside of VID. Though, this version gets rid of `events` and `list` words definition, so it looks more \*pure\*.

[02:52](#msg592cde8a631b8e4e61266e19)Though, if you think that this version is a better \*showcase\*, let me know. ;-)

rebolek

[05:26](#msg592d02800ba4d59763f34540)Or you can use GitHub API:

```
view [
    text-list data collect [
        foreach commit github/list-commits 'red/red [
            keep commit/commit/message
        ]
    ]
]
```

:satisfied:

geekyi

[10:11](#msg592d4560631b8e4e6127f5f2)@rebolek you should mention where your github api is 😉

rebolek

[14:25](#msg592d80ef0a783b6c0aec5226)@geekyi Oh, sorry :) Currently it is available as a part of Gritter: https://github.com/rebolek/gritter

## Friday 2nd June, 2017

meijeru

[08:54](#msg593127dbcf9c13503c46f981)I may be doing something wrong, or I am using an older version, but see this result of compiling a very small program (only essentials shown):

```
Compiling to native code...
...compilation time : 53527 ms
...linking time     : 641 ms
...output file size : 882176 bytes
...output file      : C:\Projects\Red\programs\red-inspector\libRedRT.dll 

...compilation time : 62 ms

Target: MSDOS 

Compiling to native code...
*** Compilation Error: attempt to redefine existing function name: red/object/get-values 
*** near: [332x1 
    #import ["libRedRT.dll" stdcall [
            get-values: "red/object/get-values" [obj [red/red-object!] return: [red/cell!]] 
            get-values: "red/object/get-values" [obj [red-object!] return: [cell!]]
        ]]
]

> Terminated with exit code 1.
```

[10:03](#msg593137dc6549436c7d0babb7)Bug disappeared when using latest version. Please forget the above.

## Monday 5th June, 2017

meijeru

[09:20](#msg59352278142826e972844fb9)I am puzzeled about the requirements for the type spec of a routine formal argument. Inspecting the Red compiler, `convert-types` allows there to be no type spec at all, but when such a routine is actually compiled, a compilation error occurs, presumably coming from the Red/System compiler. Wouldn't it be easy to allow no type spec and substitute `any-type` for that? OR, am I doing something wrong?

## Tuesday 6th June, 2017

rebolek

[06:39](#msg59364e33e531dbc905b55dd8)I would expect `false` and `true` to be printed here:

```
>> case [(probe equal? 1 2) [print "asd"] (probe equal? 1 1) [print "xyz"]]
xyz
```

A bug?

dockimbel

[06:40](#msg59364e6ae531dbc905b55e88)I get `false` and `true` printed here.

rebolek

[06:41](#msg59364e876549436c7d1de95e)Interesting. I will recompile my console and try it once again.

[06:43](#msg59364f2431f589c64f7bb3ea)Works fine now, probably some bad build. Thanks.

dockimbel

[11:37](#msg593693e5cf9c13503c5b2732)@meijeru The absent type is filled with a `[red-value!]` when the routine is called the first time (`emit-routine`). So if you never call the routine, its spec block will remain invalid. The following code compiles fine:

```
r: routine [a][probe TYPE_OF(a)]
r 123
```

[11:38](#msg59369426e531dbc905b69fa9)The injection should rather happen in `convert-types`, so that it will not error out if the routine is never called.

meijeru

[13:41](#msg5936b110167d046a7d7348be)I will raise a suitably formulated issue.

## Friday 9th June, 2017

Oldes

[12:16](#msg593a918f6462d8493cf6886e)@dockimbel there seems to be bug with quoted arguments on Windows... using code:

```
argument: system/args-list + 1
home-dir: argument/item
print-line ["Julia home dir: " home-dir]
```

and than:

```
c:\dev\GIT\Red>julia "c:\dev\Julia-0.5.2\bin\"
Julia home dir: c:\dev\Julia-0.5.2\bin"
```

Notice that there should be: `c:\dev\Julia-0.5.2\bin\` not `c:\dev\Julia-0.5.2\bin"`

dockimbel

[12:31](#msg593a951c6549436c7d2f864d)I think `\"` is treated as an escape sequence for double quote. I guess such rule should not be used on Windows. You can open a ticket for it.

Oldes

[12:49](#msg593a996c02c480e67229916b)https://github.com/red/red/issues/2772

## Wednesday 14th June, 2017

iArnold

[07:46](#msg5940e9dcf31c8ced0c340bca)When compiling using 'rc in Rebol console with --no-runtime option, console gets flooded and no executable is generated.

## Thursday 15th June, 2017

dander

[22:28](#msg59430a0ff6a78eab4851ad5e)`get-env` doesn't seem to work correctly with a `word!` argument (but I'm not sure how it's supposed to work)

```
>> env: 'temp
== temp
>> env2: "temp"
== "temp"
>> get-env temp
*** Script Error: temp has no value
*** Where: get-env
*** Stack:
>> get-env env
== temp
>> get-env env2
== "C:\Users\davidan\AppData\Local\Temp"
>> get-env 'env2

*** Runtime Error 13: integer divide by zero
*** at: 0041A295h
```

```
>> get-env  'temp

*** Runtime Error 1: access violation
*** at: 0041A2CBh
```

## Friday 16th June, 2017

dockimbel

[02:19](#msg5943402dcf9c13503c8e4032)@dander It's clearly a bug, except for `get-env temp` where you are not passing a valid argument. Please open a ticket for it.

dander

[03:47](#msg594354e3142826e972bd5946)red/red#2814

iArnold

[21:05](#msg5944482aca6d4ae80c1f165e)No one could reproduce the --no-runtime issue? ... or ... no one cares for creating small executables?

PeterWAWood

[21:53](#msg59445340d83c50560c1663d7)I think you misunderstand the --no-runtime option.

[21:58](#msg59445487f6a78eab485701df)If you use it you must provide a replacement for the runtime in your own code. Most people would only use this for compiling code for very small platforms such as Arduino or if they want to write their own operating system,

[22:01](#msg59445540142826e972c1aa01)It just doesn't make sense to me to use the --no-runtime option on a

[22:06](#msg5944565ef6a78eab48570973)machine running a mainstream operating system.

[22:07](#msg5944569dd83c50560c167357)Why did you use the --no-runtime option?

## Saturday 17th June, 2017

ghost~5680c5f416b6c7089cc058a5

[03:54](#msg5944a7ebcf9c13503c93cc01)@iArnold for `--no-runtime`, there was this https://github.com/red/red/issues/1772

[03:58](#msg5944a8d76462d8493c1e760f)I am able to atleast compile using `--no-runtime` though. Maybe you are trying to compile `Red` files where the `--no-runtime` expects it to be `R/S`

[03:59](#msg5944a90431f589c64fb5daae)From `red --help`

```
--no-runtime                   : Do not include runtime during Red/System source compilation.
```

iArnold

[06:01](#msg5944c5b1f31c8ced0c442549)@nc-x Thanks Neelesh! The key word in this is Red/System SOURCE compilation. So when you compile a Red program you will \*always* get the runtime included.

ghost~5680c5f416b6c7089cc058a5

[06:46](#msg5944d031e531dbc905f02894)@iArnold You are welcome :smile:

[06:47](#msg5944d068f31c8ced0c444994)@dockimbel Would it be possible for the compiler to give error in case `--no-runtime` is used with `Red` source code?

iArnold

[09:03](#msg5944f073caf4d68d6f42513f)Somehow I also thought that because the second step in compiling \*is* the compiling of the generated Red/System code, `--no-runtime` automatically applied to that step.

dockimbel

[09:56](#msg5944fccc02c480e672521324)@nc-x Yes, but it doesn't look like something that needs to be done before a 0.9.x version, if that option still exists by then. ;-)

ghost~5680c5f416b6c7089cc058a5

[11:21](#msg5945109cf6a78eab48594e4d)Well, I am by no means an expert but doesn't writing operating systems and other low level stuff require something like `--no-runtime`

[11:21](#msg594510b5cf9c13503c951ebd)&gt; if that option still exists by then.

[11:21](#msg594510c202c480e6725252df)^^^

dockimbel

[11:23](#msg59451126d83c50560c18bf0a)@nc-x What I meant is that such feature might become accessible in a different way, instead of a command-line compilation option, as its usage is not very common.

ghost~5680c5f416b6c7089cc058a5

[11:55](#msg594518a86462d8493c1fd961)Oh, thats great! :smile:

iArnold

[19:06](#msg59457da2f6a78eab485acf8d)Most of my programs actually never use the runtime. The majority of programs will never use it I think, yet it will be included in every executable. The compiler directive could be to include it, were it not for the consoles that get compiled so often to justify the current behaviour.

[19:07](#msg59457df0ca6d4ae80c231f6b)And I still don't get why I cannot get `--no-runtime` to work for Red sources.

greggirwin

[21:47](#msg5945a3776549436c7d59b699)If you're not using the runtime, I assume you're writing Red/System code, in which case, why do you need that feature in Red? I don't understand the problem.

## Sunday 18th June, 2017

PeterWAWood

[06:37](#msg59461fc46462d8493c2346c6)@dockimbel The object on-change event is not activated when the value of a word defined in a nested object is changed (or a value in a block in the object is changed).

```
>> o: make object! [
[    b: [aa 1 bb 2]
[    on-change*: func [w o n] [ print "activated" ]
[    o: make object! [oa: 1 ob: 2]
[    c: 1
[    ]
== make object! [...
>> o/c: 1
activated
== 1
>> o/b/bb: 4
== 4
>> o/o/ob: 4
== 4
```

Is this the expected behaviour or a bug?

meijeru

[06:53](#msg5946234df31c8ced0c48a817)Isn't that for on-deep-change* ??

dockimbel

[06:55](#msg594623ca31f589c64fbadeb6)@PeterWAWood `on-change` is triggered by changed values in the root object only. `on-deep-change` is what you want (though, IIRC, nested objects needs to be manually "owned" for now using `modify`).

PeterWAWood

[07:17](#msg59462902f6a78eab485ce643)@meijeru @dockimbel Thanks.

## Monday 19th June, 2017

iArnold

[07:57](#msg594783efca6d4ae80c2a17c9)@greggirwin Because I am curious about what is generated.  
It turns out that compiling the script

```
Red/System []
print "Hello world!"
```

with `--no-runtime` results in

```
*** Compilation Error: undefined symbol: print
```

[07:58](#msg59478436caf4d68d6f4b21ea)So the runtime is getting used in my simple programs, but not all features are used ;-)

PeterWAWood

[08:06](#msg5947861df6a78eab4861b614)@iArnold The print function is part of the Red/System runtime. You cannot use it if you want to compile your code without the Red/System runtime.

[08:09](#msg594786b9caf4d68d6f4b2e5e)The Red/System runtime is similar to the C language runtime. (It actually makes use of it as it is pre-installed on Windows, macOS and Linux).

[08:10](#msg594786ffd83c50560c212441)If you're still at a loss, this \[stackoverflow answer](https://stackoverflow.com/questions/2766233/what-is-the-c-runtime-library#2766421) might help.

iArnold

[08:17](#msg59478881ca6d4ae80c2a2f79)Thank you Peter!

greggirwin

[16:48](#msg59480069bf1bfe6770c98239)Ah, I see your question more now @iArnold, you want to include only the parts you use. That will certainly be possible, and is part of the plan as I understand it, but it's not important right now. When we get to modular compiling and linking, it will be a natural side effect.

iArnold

[20:53](#msg594839bc88348abd0aa996b8)Indeed @greggirwin and knowing the minimal code generated helps in unraveling the way the sources do their work, so I can understand better what is needed for 64 bit versus 32 bit. ( http://ref.x86asm.net/ http://0xax.blogspot.nl/2014/08/say-hello-to-x64-assembly-part-1.html http://yasm.tortall.net/ and the like)  
Because the need to support 64 bit for the desktop increases continuously. If you are going to install a new OS on your desktop it is practically a no-brainer that it will be the 64 bit version. Having the programmers and worse the users of their programs install 32-bit libs on their systems where other languages do have 64 support is so 2017. Similar concern I have is with the Rebol dependency. Rebol.com has been out, so no R2 available for download, and this will probably become a yearly exercise. Selfhosting of Red in my expectation should get a higher priority. For one thing I hope this new release of macOS will be the last one in the series of releases that took up much more time because of the very large scale, and following releases will follow up significantly quicker.

[21:04](#msg59483c4288348abd0aa9a4fd)According to Henrik in AltME the High Sierra will be the last release of macOS to support 32 bit, given the current release frequency of macOS of a year avarage, this situation of 32 vs 64 bit is pretty soon an actuality.

greggirwin

[21:43](#msg5948457cc98bc6d563849938)The importance depends on the target market. Have to balance appealing to developers with modern machines and the huge number of devices out there that aren't.

## Tuesday 20th June, 2017

iArnold

[06:55](#msg5948c6f202c480e67260c4f9)Last thing you hear me say is to drop 32 bit support ;-) I am only pointing out the upcoming urgency of this issue.

greggirwin

[16:11](#msg5949493402c480e6726370bd)I didn't think you meant that, just that mobile is a higher priority right now, and I think ARM (for example) is maintaining 32-bit instruction compatibility even as they move forward, for now.

Everything is urgent. :^)

iArnold

[17:49](#msg59496032142826e972d57051)Mobile priority bugs me yes ;-)

## Tuesday 27th June, 2017

x8x

[01:59](#msg5951bbf351915d962af566df)Can anyone reproduce this issue? https://github.com/red/red/issues/2837

dockimbel

[05:28](#msg5951ece511755ab05627e6c5)@x8x You should rather post that in red/red as very few people have subscribed to this channel.

rebolek

[05:45](#msg5951f0fc8dae4250315a2657)@x8x @dockimbel I can't repro, because I have troubles compiling Red/View under macOS. I've added `Needs: 'View` to header but the compilation breaks with error

```
*** Compilation Error: invalid #call function name: face?
*** in file: /Users/sony/Code/red/environment/console/console.red
*** near: []
```

[06:42](#msg5951fe5fceb5bef82eb54e57)@x8x I managed to compile View and tried your example, but cannot reproduce it. I will add comment to GitHub

x8x

[10:22](#msg595231f997cedeb048257c63)@rebolek Could you try this one:

```
sudo  red
Password:
PROGRAM ERROR: Invalid encapsulated data.
```

rebolek

[10:31](#msg5952341e57a6e9f72e03d0bb)@x8x I can reproduce this one

[10:32](#msg595234263230e14f3afcc5b4)

```
fakemac:red sony$ sudo red
Password:
PROGRAM ERROR: Invalid encapsulated data.
fakemac:red sony$
```

dockimbel

[10:32](#msg59523433703e565c334b12cd)@x8x You cannot call `sudo` directly on a Rebol encapped executable, you need to wrap it in a shell script. Though, we have a generic solution for such issues that will be part of 0.6.4.

rebolek

[10:33](#msg5952346f76a757f808ae1f7f)`sudo ./console` works

x8x

[10:51](#msg5952389e51915d962af56cef)@rebolek Yes that works. @dockimbel Good to know. Thanks both!

[10:52](#msg595238dc81cd9a5d7e9a0995)@rebolek What version of macOS are you running?

rebolek

[13:18](#msg59525b153230e14f3afd8d2e)@x8x 10.11.6

## Thursday 29th June, 2017

9214

[16:04](#msg59552501ad9c781843b2aa91)

```
alphabet: {AaBbCc}
replace alphabet #"a" 1
probe alphabet
```

Results in

```
"1aBbCc"
```

It seems that `replace` is case-insensitive

rebolek

[16:05](#msg59552539329651f46e370e11)Red is case-insensitive by default. So it's a feature, not a bug ;)

9214

[16:06](#msg5955256f11755ab05636382f)@rebolek it's not that funny :confused: what am I supposed to do?

rebolek

[16:07](#msg595525a74bcd78af565aff96)@9214 `replace`is function that uses `find` for matching. `find` supports `/case` refinement, so I think that `replace` should also support it.

9214

[16:07](#msg595525db329651f46e3710db)@rebolek I thought it does!

```
>> replace/case
*** Script Error: replace has no refinement called case
*** Where: replace
>> ? replace
USAGE:
     REPLACE series pattern value

DESCRIPTION: 
     REPLACE is a function! value.

ARGUMENTS:
     series       [series!] 
     pattern       
     value         

REFINEMENTS:
     /all         =>
```

rebolek

[16:08](#msg5955260511755ab056363a98)It does in Rebol, in Red not yet.

9214

[16:08](#msg5955261211755ab056363abe)Worth a ticket?

rebolek

[16:09](#msg595526475a1ab55f643a408c)Yes, a WISH ticket.

[16:13](#msg5955271e703e565c33585519)@9214 here you go https://gist.github.com/rebolek/f5731bc1d9234ef15e2d4fe31f4f531f

9214

[16:13](#msg59552739c101bc4e3a33de34)@rebolek :+1:

## Monday 3th July, 2017

9214

[12:38](#msg595a3adfc101bc4e3a475cf3)Question about \[get-arguments](http://www.rebol.com/docs/core23/rebolcore-9.html#section-3.3). In Rebol2:

```
print-body: func [:foo] [probe second :foo]
print-body print-body
```

Results in

```
[probe second :foo]
```

But in Red it gives me

```
*** Script Error: second does not allow word! for its s argument
*** Where: second
```

Turns out in Red `:foo` in spec is equivalent to `'foo`. Why is that?

[12:53](#msg595a3e44329651f46e4a9780)But this one works as expected

```
print-func: func [:foo] [probe get/any foo]
print-func print-func
```

[13:11](#msg595a427b329651f46e4ab00b)I'm asking because I wanted to implement `|>` pipe operator. For now user is forced to use `get-word!` on calling side:

```
|>: make op! func [x :f] [f x] ; :f could be 'f
[1 2 3] |> :reverse |> :print
```

Instead I'd like it to be

```
|>: make op! func [x :f] [f x]
[1 2 3] |> reverse |> print
```

dockimbel

[13:38](#msg595a48c64bcd78af566eadff)@9214 In Rebol 2, `first`, `second` and `third` correspond in Red respectively to `words-of`, `body-of` and `spec-of`.

[13:39](#msg595a492976a757f808cf758b)&gt; Turns out in Red :foo in spec is equivalent to 'foo. Why is that?

Compatibility with Rebol3, but actually the Rebol2 behavior might be more useful, so we should change that in the future (there's a ticket for that on github).

9214

[13:46](#msg595a4ac35a1ab55f644de2f0)@dockimbel what about using `get-word!` on calling side? Comparing with Rebol2:

```
REBOL []

pipe: func [x :f] [f x]
pipe [1 2 3] print
```

```
Red []

pipe: func [x 'f] [f x]
pipe [1 2 3] :print
```

dockimbel

[13:48](#msg595a4b414bcd78af566ebb97)Yes, that's a valid workaround.

9214

[13:50](#msg595a4ba14bcd78af566ebcf4)@dockimbel but IMO Rebol one is more elegant (writing `print` instead of `:print`)

[13:50](#msg595a4bad5a1ab55f644de7fc):point\_up: \[3 июля 2017 г., 18:11](https://gitter.im/red/bugs?at=595a427b329651f46e4ab00b)

dockimbel

[13:51](#msg595a4bd7c101bc4e3a47aa0d)Yes, I agree. I also think the Rebol2 way is better than Rebol3's for that feature.

9214

[13:51](#msg595a4bed703e565c336c44e2)Okay, so there's a wish ticket for that already?

dockimbel

[13:52](#msg595a4c0776a757f808cf857d)There's a ticket for that, but can't remember which one.

9214

[13:54](#msg595a4c9bf5b3458e3009b2fe)https://github.com/red/red/issues/1850 ?

dockimbel

[13:55](#msg595a4ce9703e565c336c4894)Yes, should be that one.

9214

[13:56](#msg595a4cffad9c781843c6b3fd)Alrighty then, thanks Doc!

dockimbel

[13:58](#msg595a4d7b703e565c336c4dd9)Welcome. ;-)

9214

[16:55](#msg595a76ebc101bc4e3a487b5c)The following code:

```
Red [
    Config: [red-strict-check?: off]
]

#do [
    unfold: function [
        range [block!]
    ][  
        bit: make bitset! range
        len: length? bit
        str: make string! len
        
        repeat i len [if find bit i [append str to char! i]]
        return str
    ]
]

#macro alphabet: func [] [unfold [#"A" - #"Z"]]

probe alphabet
```

Then interpreted results in:

```
"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
```

As expected. But if I try to compile it:

```
*** Red Compiler Internal Error: Script Error : Invalid argument: -
*** Where: unfold
*** Near:  [bit: make bitset! range
len:
]
```

Any ideas?

[19:37](#msg595a9d075a1ab55f644f7666)Also, if I'll try to specify named macro without arguments and with some `/local` words (i.e. `has` function):

```
#macro whatever: func [/local some-word] []
```

```
*** Macro Error: invalid specification
*** Where: [whatever: func [/local some-word]]
*** Throw Error: no catch for throw: halt-request
*** Where: throw
*** Stack: expand-directives expand
```

[19:41](#msg595a9dd25a1ab55f644f7bc6)But this one is OK (though basically it's the same as above):

```
#macro whatever: function [] [some-word:]
```

PeterWAWood

[22:22](#msg595ac3966ae41d5d33b021a6)@9214 The current alpha compiler is build in Rebol. If you want code inside a macro to run in both the interpreter and the compiler, the code must be valid in both Red and Rebol.

There is a \[note](https://doc.red-lang.org/en/preprocessor.html#\_implementation\_note) in the pre-processor docs.

[22:25](#msg595ac43cf5b3458e300bf4d1)`function` in Red is equivalent to `funct` in Rebol 2. `function` in Rebol 2 takes 3 arguments the second being a list of local words.

[22:44](#msg595ac8c76ae41d5d33b03519)The error with `#macro whatever: func [/local some-word] []` seems like a bug to me.

## Tuesday 4th July, 2017

9214

[05:34](#msg595b28e0703e565c336fdb2b)@PeterWAWood ah, so Rebol doesn't support `[ - ]` bitset generation?

greggirwin

[06:29](#msg595b35e25a1ab55f6451a880)@9214, that should be fine. What Rebol doesn't like is `function` with just two args. For R2 it takes 3: `FUNCTION spec vars body`

[06:30](#msg595b35f9329651f46e4ebf45)`Function` is one function that is not Rebol compatible.

dockimbel

[06:35](#msg595b371a329651f46e4ec4b8)@greggirwin @9214 `function` is redefined in the toolchain to match Red's definition, you can check it by compiling the following code:

```
Red []
#do [probe :function]
```

greggirwin

[06:35](#msg595b3734703e565c3370137c)Ah, my mistake. Sorry about that.

dockimbel

[06:35](#msg595b374fbf7e6af22c9fbc47)The `*** Macro Error: invalid specification`error looks like an issue with the preprocessor macro validation code.

9214

[06:52](#msg595b3b18c101bc4e3a4b8b53)I've rewrite `unfold` as `func` just for sanity check but error still persist. Rebol2 actually supports charset generation, so now I'm confused :confused:

[06:57](#msg595b3c73f5b3458e300da519)I even reinvented the naive `charset` wheel, and now error message is even more cryptic:

```
Red []

#do [
    charset: func [
        range [block!]
        /local
        bs blk start bump
    ][  
        bs: make bitset! copy []

        while [not tail? range] [
            blk: head remove at take/part range 3 2
            start: to integer! blk/1
            bump:  to integer! blk/2
            
            while [start <= bump] [
                bs/:start: on
                start: start + 1
            ]
        ]

        return bs
    ]

    unfold: func [
        range
        /local
        bit len str
    ][  
        bit: charset range
        len: length? bit
        str: make string! len

        repeat i len [if find bit i [append str to char! i]]
        return str
    ]
]

probe #do keep [unfold [#"A" - #"Z"]]
```

```
*** Red Compiler Internal Error: Script Error : Invalid argument: '00000041
*** Where: charset
*** Near:  [start: to integer! blk/1
bump:
]
```

[07:06](#msg595b3e64ad9c781843cab6a6)@dockimbel :point\_up: \[4 июля 2017 г., 11:35](https://gitter.im/red/bugs?at=595b374fbf7e6af22c9fbc47) should I fill a ticket?

dockimbel

[07:12](#msg595b3fde703e565c337037b5)@9214 Yes, please.

9214

[07:13](#msg595b40102723db8d5ed4f712)Roger! I'll tackle with `unfold` for a while.

[08:48](#msg595b56405a1ab55f645245cc)Okay, here's the trick. This one works flawlessly:

```
Red []

#do [
    unfold: func [
        range [block!]
        /local
        index bump blk
    ][  
        to string! collect [
            while [not tail? range] [
                blk: head remove at take/part range 3 2
                forall blk [poke blk 1 to integer! to char! blk/1]
                set [index bump] blk
                
                until [keep to char! index (index: index + 1) > bump]
            ]
        ]
    ]
]

view [text #do keep [unfold ["A" - "Z"]]]
```

But on this one compiler (preprocessor?) chokes up (while interpreter works fine):

```
Red []

#do [
    unfold: func [
        range [block!]
        /local
        index bump blk
    ][  
        to string! collect [
            while [not tail? range] [
                blk: head remove at take/part range 3 2
                forall blk [poke blk 1 to integer! blk/1]
                set [index bump] blk
                
                until [keep to char! index (index: index + 1) > bump]
            ]
        ]
    ]
]

view [text #do keep [unfold [#"A" - #"Z"]]]
```

```
*** Preprocessor Error in #do
*** Script Error : Invalid argument: '00000041
*** Where: [#do]
*** Near:  [forall blk [poke blk 1 to integer! blk/1]
set [index bump]
]
```

The only difference is that in first example I use `string!`s in `range` block and explicitly convert them to `char!` and then to `integer!`, while in the second case this conversion is avoided because I use `chars!` as usually.

[09:12](#msg595b5bff4bcd78af567369b3)Also

```
probe #do keep ["1 2 3"]       ;== "1 2 3"
probe #do keep [[1 2 3]]       ;?? 1

; crude workarounds
probe load #do keep ["1 2 3"]  ;== [1 2 3]
probe #do keep [[[1 2 3]]]     ;== [1 2 3]
```

Maybe it's worth to create `/only` refinement (i.e. `#do keep/only`) for such cases?

[09:18](#msg595b5d7676a757f808d429d9)Same with named macro

[11:36](#msg595b7dacc101bc4e3a4d16f4)I feel like a Starship Trooper today :bug: (sorry if it looks too obtrusive!)

```
|>: make op! func [x 'f] [f x]

[1 2 3] |> :reverse |> :print
```

Result in

```
*** Compilation Error: invalid path value: intrinsics/func*
*** in file: <snip>
*** at line: 332
*** near: [
    get-word/get ~reverse
    intrinsics/func*
    stack/unwind
    get-word/get ~print
    intrinsics/func*
    stack/unwind
]
```

[11:48](#msg595b808976a757f808d50417):bug: :gun: currently I'm working on some hash decoding algorithm which involves a lot of bit-twiddling trickery, so, for the sake of simplicity, I've defined some shortcuts (in the same context where this operations are used):

```
&: :and
|: :or
~: :complement
```

So, the thing is - this one compiles:

```
&: :and
|: :or
~: :complement

complement 100 and 200 or 300
```

This one crashes:

```
&: :and
|: :or
~: :complement

~ 100 & 200 | 300
```

```
*** Compilation Error: invalid path value: ops/&*
*** in file: <snip>
*** at line: 332
*** near: [
    integer/push 200
    ops/&*
    stack/unwind
    integer/push 300
    ops/|*
    stack/unwind
]
```

[11:54](#msg595b81e03230e14f3a22ea38)Workaround:

```
bit-twiddling: context [
    &: :and
    |: :or
    ~: :complement
]

complement 100 and 200 or 300
do bind [~ 100 & 200 | 300] bit-twiddling
```

dockimbel

[12:54](#msg595b8ff33230e14f3a234248)@9214 You're hitting on some interesting edge cases there, will review that in detail after I merge the `date!` type branch.

9214

[13:07](#msg595b9311f5b3458e300f9df7)@dockimbel good! Should I fill some tickets for you? Though I'm not sure which of the three reported issues (`unfold` macro, `|>` weirdness, and `bit-twiddling` crash) are worthy and what exactly I should write in description :(

dockimbel

[13:07](#msg595b932f3230e14f3a23568b)@9214 No need until I get a chance to review it in detail.

## Wednesday 5th July, 2017

9214

[17:40](#msg595d24a00de4d2545ef8994b)\[!\[Starship-Troopers.jpg](https://files.gitter.im/red/bugs/N3tm/thumb/Starship-Troopers.jpg)](https://files.gitter.im/red/bugs/N3tm/Starship-Troopers.jpg)

```
Red []

context? 'context?
```

```
Compiling to native code...
*** Compilation Error: undefined symbol: red/natives/context?*
*** in file: <snip>
*** at line: 332
*** near: [
    natives/context?* true
    stack/unwind #user-code
]
```

## Thursday 6th July, 2017

PeterWAWood

[09:31](#msg595e0362bf7e6af22cada241)@dockimbel It looks as there is a formatting error when molding dates:

```
>> a: 1/1/0000
== 1-Jan-0000
>> b: 1/1/0001
== 1-Jan-1000
>> b/year
== 1
```

[09:33](#msg595e03d21c8697534af72420)Also:

```
>> a: a - 1
== 31/Dec/-100
>> a/year
== -1
```

dockimbel

[09:34](#msg595e04103230e14f3a2ed2c1)@9214 About the `context?`error, did you compile in dev mode (using libRedRT) or in release mode? Worth a ticket for a deeper look anyway.

9214

[09:34](#msg595e0428bf7e6af22cada5e8)@dockimbel I think in dev mode

dockimbel

[09:34](#msg595e043b0de4d2545efc3ee3)@PeterWAWood Odd, will fix that now.

9214

[10:11](#msg595e0ccb6ae41d5d33bfa561)

```
#do [foo: does [1 % 1]]
#macro make-some-foo: func [][foo]

probe make-some-foo
```

```
...using libRedRT built on 6-Jul-2017/15:05:21+5:00
*** Red Compiler Internal Error: Script Error : % has no value
*** Where: foo
*** Near:  [% 1]
```

Changing `%` to `mod` works

```
#do [foo: does [mod 1 1]]
#macro make-some-foo: func [][foo]

probe make-some-foo
```

dockimbel

[10:14](#msg595e0d7dbf7e6af22cadd520)@9214 Compile-time macros are run by the Rebol interpreter (which powers our toolchain), the `%` character alone is invalid syntax in Rebol, so you need to either use `//` or `mod` in that case.

9214

[10:14](#msg595e0d8d76a757f808e1419a)@dockimbel oh, right, thanks!

[10:22](#msg595e0f5f3230e14f3a2f0b22)Regarding `|>` crash, it seems that binding block of code to some context fixes it (as with `| & ~` shortcuts issue)

```
|>: make op! func [x 'f][f x]

do bind [[1 2 3] |> :reverse |> :print] system/words
```

dockimbel

[10:25](#msg595e10302723db8d5ee2ac47)That's odd, as by default those words are bound to global context (aka `system/words`).

iArnold

[11:33](#msg595e20212723db8d5ee2fc13)Is this correct behaviour? Latest sources used.

```
>> block1: [12uifehwiguhig] 
*** Syntax Error: invalid integer! at "12uifehwiguhig]"
*** Where: do
*** Stack: load
```

PeterWAWood

[11:42](#msg595e224189aea4761d6ec2c1)Yes it is. The contents of a block need to be loadable so they must be valid values. The contents of a block are not evaluated upon loading (which is why you can include words which are not bound to a value in a block).

[11:43](#msg595e226c4bcd78af5680f9ed)Try it in Rebol and you'll get a similar error message.

xqlab

[11:52](#msg595e2465c101bc4e3a59bac9)

```
>> 1/1/001
== 1
>>  probe 1/1/010
1-Jan-2001
== 0
```

latest version

dockimbel

[11:54](#msg595e24fd6ae41d5d33c02723)@xqlab

```
>> [1/1/001]
== [1-Jan-2000 1]
```

[11:55](#msg595e251a2723db8d5ee31193)It's parsed correctly, just missing an extra rule to avoid such sticky integers and return an error to block a confusing syntax.

iArnold

[13:18](#msg595e38ac3230e14f3a2fd33a)@PeterWAWood Thank you for the explanation.

## Friday 7th July, 2017

PeterWAWood

[06:51](#msg595f2f8d4bcd78af5685adb2)@dockimbel You can set the `time` of a `date` to an `integer!`. Though doing so seems to adjust the time rather than set it. Shouldn't this raise an error as does Rebol?

```
>> d: now
== 7-Jul-2017/14:46:37+08:00
>> d/time: 1
== 1
>> d
== 7-Jul-2017/6:46:01+08:00
>> d/time: -10
== -10
>> d
== 6-Jul-2017/22:46:50+08:00
```

dockimbel

[06:53](#msg595f2fdcbf7e6af22cb2f285)@PeterWAWood Good catch.

[06:53](#msg595f30036ae41d5d33c4cbec)BTW, `random` on dates seems broken.

PeterWAWood

[06:59](#msg595f314b76a757f808e683c2)@dockimbel Setting the 'date/time`to a negative`time`also appears to give incorrect results. Perhaps it should also raise an error?`text  
&gt;&gt; d: now  
\== 7-Jul-2017/14:56:24+08:00  
&gt;&gt; t: -24:00  
\== -24:00:00  
&gt;&gt; d/time: t  
\== -24:00:00  
&gt;&gt; d  
\== 6-Jul-2017/0:00:00+08:00  
\`

dockimbel

[07:00](#msg595f31a30de4d2545e0198bf)No, that's correct, and it's a needed feature, otherwise you cannot do arithmetics using `/time`. Rebol behaves the same (for same reasons).

[07:04](#msg595f3299f5b3458e30206ea7)The previous issue with setting `/time` to an integer is fixed now.

PeterWAWood

[07:09](#msg595f33a4329651f46e61a24b)Is there a definition of the result of setting the time of a date to a negative value that could be included in the Docs?

It seems that the result of doing so is to subtract one day from the date and then set the time to 24:00 plus the negative time value supplied.

dockimbel

[07:11](#msg595f340476a757f808e6900f)@PeterWAWood Setting time to a negative value means counting time backwards from the same day, starting at 0:00:00. So `-24:00` will give you same time (`0:00:00`), but minus one day.

PeterWAWood

[07:14](#msg595f34cf4bcd78af5685c559)Thanks for the explanation.

dockimbel

[07:15](#msg595f34fb89aea4761d737ed5)BTW, I'm currently writing a doc for `date!` (while it's all still fresh in my mind).

meijeru

[08:18](#msg595f43dff5b3458e3020b7b3)Should the two bugs mentioned above not be formulated as issues (setting time in date to integer, and random being broken)?

dockimbel

[08:21](#msg595f446cbf7e6af22cb353f8)@meijeru No need, the first one has been fixed already and I posted the second one, which means I have it on my todo-list already.

## Sunday 9th July, 2017

Oldes

[12:44](#msg5962254376a757f808f16ec8)@dockimbel reading the `date!` documentation, this was the first thing I tried:

```
>> d: 31/Dec/32767
== 7
>> d
== 31-Dec-3276
```

[12:54](#msg5962276ff5b3458e302b4fcd)Also:

```
>> probe 28-Feb-0341 probe 28-Feb-341
28-Feb-0341
28-Feb-2034
== 1
```

[12:55](#msg596227b81c8697534a07344e)In Rebol2 it is possible to write:

```
>> 28-Feb-341
== 28-Feb-0341
```

dockimbel

[14:15](#msg59623a7e2723db8d5ef2cc0e)@Oldes Issue fixed. 3-digit years now allowed.

## Monday 10th July, 2017

9214

[08:30](#msg59633b0f3230e14f3a42b0c9):point\_up: \[4 июля 2017 г., 16:48](https://gitter.im/red/bugs?at=595b808976a757f808d50417)  
Surprisingly

```
set '& get 'and
set '| get 'or
```

Compiles. @dockimbel I'm sorry to bother you, you'll get a chance to review all of this in more detail after `0.6.3` launch, right?

dockimbel

[08:30](#msg59633b2fc101bc4e3a6d031a)@9214 Right, thanks for your understanding.

9214

[08:36](#msg59633c954bcd78af5694b60c)Another report:

```
entry: [a b c]
foreach :entry [1 2 3 4 5 6 7 8 9][
    print [a * 2 b * 3 c * 4]
]
```

Interpreted

```
2 6 12
8 15 24
14 24 36
```

Compiled

```
...using libRedRT built on 6-Jul-2017/15:05:21+5:00
*** Red Compiler Internal Error: Script Error : add-symbol expected name argument of type: word
*** Where: comp-foreach
*** Near:  [add-symbol word: pc/1
add-global word
]
```

[08:39](#msg59633d24bc46472974d41bab)And some inconsistency in `while` behavior, it always returns `unset` no matter what.  
I expect it to return last evaluated expression like with other iterators.

```
probe while [true][break/return 42] ; unset vs. 42
i: 1 probe while [i < 5][i: i + 1]  ; unset vs. 5
```

[08:40](#msg59633d6c89aea4761d82326a)Workaround is to wrap `while` loop in `catch/throw`

```
probe catch [while [true][throw 42]]
i: 1 probe catch [
    while [i < 5][
        i: i + 1 
        if i = 5 [throw i]
    ]
]
```

[08:46](#msg59633efb0de4d2545e10863e)@dockimbel keep up the good work! But do you mind if I fill the tickets? I worry that we will forget everything that I wrote here :( (+ weird behavior with macro inclusion :point\_up: \[6 июля 2017 г., 02:28](https://gitter.im/red/red?at=595d59fa3230e14f3a2c3da6))

dockimbel

[08:47](#msg59633f1bbf7e6af22cc1c0e7)@9214 Please go on with adding tickets.

9214

[08:47](#msg59633f283230e14f3a42c6c3):muscle:

dockimbel

[09:06](#msg596343adc101bc4e3a6d2b6d):sweat\_smile:

## Tuesday 11st July, 2017

PeterWAWood

[00:11](#msg596417acbc46472974d81054)When the time of a date is 0:00, mold ignores it. This makes sense when the user sets only the date (with no time) but not when a date is being incremented.

```
>> d: 2016-11-23/23:57
== 23-Nov-2016/23:57:00
>> loop 6 [print d: d + 0:01]
23-Nov-2016/23:58:00
23-Nov-2016/23:59:00
24-Nov-2016
24-Nov-2016/0:01:00
24-Nov-2016/0:02:00
24-Nov-2016/0:03:00
```

Rebol2 treats dates with a 0:00 time differently and also has a '/date' refinement to display dates without the time:

```
>> d: 2013-11-23/0:00
== 23-Nov-2013/0:00
>> e: 2013-11-23     
== 23-Nov-2013
>> d/date
== 23-Nov-2013
```

[00:26](#msg59641b231c8697534a0f645f)The `date!` docs suggest that any of the "ordinal" paths can be used with `pick`. However, trying to pick `12` (week) or `13` (isoweek) gives a script error:

```
>> e: 2017-11-23/0:00
== 23-Nov-2017
>> pick e 12
*** Script Error: value out of range: 12
*** Where: pick
*** Stack: 
>> pick e 13
*** Script Error: value out of range: 13
*** Where: pick
*** Stack: 
>> e/12
== 47
>> e/13
== 47
```

[00:26](#msg59641b3f89aea4761d8655ac)Let me know if the docs need changing and I'll do it.

[00:29](#msg59641bf2bc46472974d81d4a)Large dates suffer from integer overflow when converting to epoch time:

```
>> f: 9999-12-24
== 24-Dec-9999
>> to integer! f
== -1460864
```

dockimbel

[03:37](#msg59644815c101bc4e3a71a18a)@PeterWAWood Funny that I forgot to implement `/date` accessor. :smile:

[03:40](#msg596448b276a757f808fa30d3)@PeterWAWood The Unix epoch time is not defined beyond \[year 2038](https://en.wikipedia.org/wiki/Year\_2038\_problem).

[03:42](#msg5964493c89aea4761d86fb23)For the zero time displaying, we should be able to support that too.

greggirwin

[03:46](#msg59644a17329651f46e7513ac)Do we need "commonly used" in the first sentence of the docs? There's no special meaning there, correct? Just that date values are common.

dockimbel

[04:14](#msg596450be3230e14f3a479f76)@greggirwin Correct. Maybe `represent calendar dates` would be better?

greggirwin

[04:26](#msg5964535c1c8697534a10264c)Agreed. I'll make the change.

[04:57](#msg59645aa276a757f808fa6f2c)Playing with setting negative days and months, and out of range args.

```
== 1-Jan-2017
>> d/month: -1
== -1
>> d
== 1-Nov-2016
>> d/month: 1
== 1
>> d
== 1-Jan-2016
>> d/month: 2
== 2
>> d
== 1-Feb-2016
>> d: 31-jan-2017
== 31-Jan-2017
>> d/month: 2
== 2
>> d
== 31-Feb-2017
>> d: 31-feb-2017
*** Script Error: cannot MAKE/TO date! from: [day month year]
*** Where: do
*** Stack: load
```

dockimbel

[04:59](#msg59645b2b0de4d2545e1580e5)@PeterWAWood `pick` issue fixed.

greggirwin

[05:03](#msg59645c2e1c8697534a104899)Is there a good reason to support out of range months? Things can get tricky, and unpredictable. Common needs like last-day-of-month and same-day-next-month can wrap behavior to some extent. I don't know a good reference offhand, since this isn't just basic date math, but design.

dockimbel

[05:04](#msg59645c7b0de4d2545e15865e)@greggirwin Without support for out-of-range values, we cannot do any math on date fields (except for days, as we can do &lt;date&gt; + &lt;days&gt;). The result should always be normalized, so this is not an issue. Same as in Rebol.

greggirwin

[05:07](#msg59645d003230e14f3a47ce7f)Just thinking about how best to explain it, since the results are counterintuitive.

dockimbel

[05:07](#msg59645d0f329651f46e755335)Here's an example:

```
>> last-day-of-month: func [d][d/month: d/month + 1 d/day: 1 d - 1]
== func [d][d/month: d/month + 1 d/day: 1 d - 1]
>> last-day-of-month now
== 31-Jul-2017/13:06:56+08:00
```

greggirwin

[05:07](#msg59645d1f4bcd78af5699b02b)

```
>> d: 1-jan-2017
== 1-Jan-2017
>> d/day: 32
== 32
>> d
== 1-Feb-2017
>> d/day: -1
== -1
>> d
== 30-Jan-2017
```

dockimbel

[05:08](#msg59645d49329651f46e7553f0)@greggirwin IIRC, Rebol/Core Manual doesn't try to explain it beyond that you can do math with date fields and get a correct resulting date.

greggirwin

[05:08](#msg59645d4f0de4d2545e1588fe)Yes, I have almost that exact func as well.

dockimbel

[05:09](#msg59645d9189aea4761d873ff4)The current docs I write are "reference documentation", so they aim at describing exhaustively the datatype's features. A tutorial and/or User Manual should present things differently.

greggirwin

[05:11](#msg59645df00de4d2545e158a8f)I'm adding some examples as I go through it, to help clarify. The month example above, creating a bad date, was what caught my eye. Other things I've checked against R2 and make sense.

dockimbel

[05:11](#msg59645e0b4bcd78af5699b3ce)

```
lisp
>> d: 1-Feb-2017
== 1-Feb-2017
>> d/day: 1
== 1
>> d
== 1-Feb-2017
>> d/day: 0
== 0
>> d
== 31-Jan-2017
```

greggirwin

[05:12](#msg59645e3abf7e6af22cc6cca5)Right. The 0 gap.

dockimbel

[05:12](#msg59645e5089aea4761d8742aa)&gt; The month example above, creating a bad date

It's a bug, I'm fixing it.

greggirwin

[05:13](#msg59645e6ef5b3458e30345625)Great. Thanks!

dockimbel

[05:14](#msg59645e9e76a757f808fa80f0)Fixed. FYI, the GUI console seems to be broken currently because of a recent commit from Qingtian, but the CLI console is fine.

[11:45](#msg5964ba6f4bcd78af569b4685)@PeterWAWood This is what you can do in Red now:

```
>> d: 2016-11-23/23:57
== 23-Nov-2016/23:57:00
>> loop 6 [print d: d + 0:01]
23-Nov-2016/23:58:00
23-Nov-2016/23:59:00
24-Nov-2016/0:00:00
24-Nov-2016/0:01:00
24-Nov-2016/0:02:00
24-Nov-2016/0:03:00
>> d/time: none
== none
>> d
== 24-Nov-2016
>> loop 6 [print d: d + 0:01]
24-Nov-2016/0:01:00
24-Nov-2016/0:02:00
24-Nov-2016/0:03:00
24-Nov-2016/0:04:00
24-Nov-2016/0:05:00
24-Nov-2016/0:06:00
```

[12:02](#msg5964be461c8697534a11eb04)I had to use 1 bit in the date! value slot for the time presence flag, so the range for years is reduced to -16384 to 16383.

PeterWAWood

[12:14](#msg5964c12089aea4761d88e72b)Great! I don't think many people will worry about the reduced date! range.

x8x

[16:33](#msg5964fdc542d2f61025875481)

```
1-1-10000
*** Syntax Error: invalid date! at "10000"
*** Where: do
*** Stack: load 
  31-12-9999 + 1
;   1-Jan-10000
```

meijeru

[17:08](#msg59650601c101bc4e3a74f180)That is not a bug, it is a feature :smile:

dockimbel

[17:09](#msg59650635bc46472974dc1716)@x8x From the date doc:  
&gt; Supported dates range from 1/Jan/-16384 to 31/Dec/16383, wrapping around on overflowing math operations. On input, that range is reduced to 1/Jan/-9999 to 31/Dec/9999 for practical reasons.

x8x

[17:10](#msg5965067681cd9a5d7e9aca4f)Thanks, so I can input dates till 9999 but I can do maths on years till 16383, correct?

dockimbel

[17:10](#msg5965067f329651f46e7865b4)Right.

x8x

[17:10](#msg5965069751915d962af62615)Perfect thx!

## Friday 14th July, 2017

Oldes

[10:35](#msg59689e67329651f46e87bd5e)@dockimbel compile this script with `-t Windows` and press the button... the application quits:

```
Red [Needs:	 'View]

view [
	button "Press me" [print "pressed"]
]
```

[10:37](#msg59689edfbc46472974eb92fc)That is the reason why `view-test.red` script does nothing when compiled with `-t Windows` and not `-d`.

dockimbel

[10:41](#msg59689fc03230e14f3a5a2e73)From red/help:  
&gt; Yes, -t Windows redirects the standard output to the GUI console, which is not (yet) part of the runtime. So the app then silently fails to run.

PeterWAWood

[10:42](#msg5968a01576a757f8080d06eb)@dockimbel I ran the tests, latest master, under Windows 10 and got a failure:

```
--test-- libWin32-1 FAILED**************
```

geekyi

[11:03](#msg5968a51d2723db8d5e0da2cc)Just so it doesn't get lost, posted on red/help channel :point\_left: \[July 14, 2017 12:56 AM](https://gitter.im/red/help?at=5967d06ebf7e6af22cd64b22)

PeterWAWood

[11:04](#msg5968a548bf7e6af22cd97737)@dockimbel If I change line 30 of the `%lib-win32-test.reds` from

```
lw1-len/int: 15
```

to

```
lw1-len/int: 16
```

the test passes on Windows10.

[11:06](#msg5968a5cf76a757f8080d1dc6)(I found this out because after the call to `get-computer-name`, `lwl-len/int` had been set to 16).

dockimbel

[11:15](#msg5968a7bf0de4d2545e286a02)@PeterWAWood Good catch!

PeterWAWood

[11:16](#msg5968a806329651f46e87e3a5)@dockimbel Should I update the test ?

dockimbel

[11:16](#msg5968a812bf7e6af22cd98133)@PeterWAWood Yes, please.

PeterWAWood

[11:18](#msg5968a895bf7e6af22cd983ad)Done

## Sunday 16th July, 2017

Oldes

[09:33](#msg596b32e52723db8d5e169413)@dockimbel I'm trying to find out, why `bass-test.red` from Red/Code is not working and found strange behavior.... with this code:

```
#define BASS_FETCH_OPT_NAMED_VALUE(type) [
			pos: cmd + 1
			if pos < tail [
				value: either TYPE_OF(pos) = TYPE_WORD [_context/get as red-word! pos][pos]
				if TYPE_OF(value) = type [cmd: pos]
			]
		]
		#define BASS_FETCH_OPT_SETTINGS(blk ms) [
			blk: null
			BASS_FETCH_OPT_NAMED_VALUE(TYPE_BLOCK) 
			print-line [pos " " cmd " " blk]
			if pos = cmd [
				blk: as red-block! value
			]
			print-line ["blk: " blk]
		]
```

I get this result:

```
028ED348 028ED338 00000000
blk: 029119A8
```

any idea how it is possible?

[09:33](#msg596b32f6bc46472974f48612)notice that `pos <> cmd`

[09:54](#msg596b37bc329651f46e90d0fc)Similar result when I include content of the `BASS_FETCH_OPT_SETTINGS` directly into the code. Simply `pos = cmd` is `true` even when the values are different.

[10:48](#msg596b44793230e14f3a637fb5)To be more precise.. `pos = cmd` is `false`, but `if` block is evaluated anyway.

PeterWAWood

[10:53](#msg596b45ae1c8697534a2c1d45)@Oldes I don't think that `either` returns a value in Red/System. So you will get some unpredictable results with:

```
value: either TYPE_OF(pos) = TYPE_WORD [_context/get as red-word! pos][pos]
```

Oldes

[10:53](#msg596b45c6f5b3458e30500d75)it was working.

PeterWAWood

[10:56](#msg596b46682723db8d5e16d678)@Oldes It looks as though it does now support returning a value.

[10:57](#msg596b467d89aea4761da2eff0)(I must try to keep up with the times).

dockimbel

[10:59](#msg596b47102723db8d5e16d80f)@PeterWAWood `either` can return a value (for setting a variable or returning from a funciton), but `either` should not be used nested in expressions otherwise.

Oldes

[10:59](#msg596b4723f5b3458e305011ea)It looks that the `if`/`either` is somehow corrupted... I had similar case... using:

```
#define BASS_FETCH_OPT_NAMED_VALUE(type) [
			pos: cmd + 1
			print-line [(pos < tail) " " pos " < " tail]
			either pos < tail [
				value: either TYPE_OF(pos) = TYPE_WORD [_context/get as red-word! pos][pos]
				print-line [(TYPE_OF(value) = type) " " TYPE_OF(value) " = " type]
				if TYPE_OF(value) = type [cmd: pos]
			][
				print-line "?"
			]
		]
```

I get:

```
true 0285D348 < 0285D368
?
```

dockimbel

[11:05](#msg596b48930de4d2545e3185f6)@Oldes That's odd, never seen similar behavior before. I would bet on something else in your code having a side-effect. Does it work if you inline manually the macros?

[11:08](#msg596b49351c8697534a2c277e)In `%system/compiler.r`, at line 3885, just before `compiler/run job src file`, you can add a `write %src.reds src` and examine the output of the preprocessor.

Oldes

[11:13](#msg596b4a3f2723db8d5e16e0b9)I will check it.. but I have limited time now.

[11:22](#msg596b4c831c8697534a2c31c3)Used `save %src.reds src` (to have it readable :) but see nothing suspicious there.

[11:32](#msg596b4ee32723db8d5e16f1c8)When I compile the `bass-test.red` with version of Red from 04/03/2017, it is working I will try to find the last working commit. Later.

[12:59](#msg596b634589aea4761da35d99)@dockimbel I found it... this is the commit which is causing above mentioned issue: https://github.com/red/red/commit/6f89becc879a1d3e8775196273b95fb704298adf

[13:08](#msg596b65463230e14f3a63f414)And just for a test, I replaced in my code lines like:

```
value: either TYPE_OF(pos) = TYPE_WORD [_context/get as red-word! pos][pos]
```

to:

```
either TYPE_OF(pos) = TYPE_WORD [value: _context/get as red-word! pos][value: pos]
```

but the result is still the same.

dockimbel

[13:15](#msg596b66ef0de4d2545e31f7d9)@Oldes I would need a simple way to reproduce it. Could you please open a ticket for it, with the minimal code you can come up with that shows the error?

Oldes

[13:15](#msg596b670b2723db8d5e174c64)That will not be an easy task:/

dockimbel

[13:16](#msg596b672bf5b3458e305088ef)Just remove everything that is not in the code path/branch of the issue.

Oldes

[13:16](#msg596b67434bcd78af56b5ea72)And you have `bass.dll`?

[13:17](#msg596b675989aea4761da36e59)I will try it.

dockimbel

[13:17](#msg596b6763329651f46e917de8)No, but it doesn't look like it's needed to reproduce this issue, is it?

[13:17](#msg596b67810de4d2545e31fb5c)Anyway, it won't make it in 0.6.3 release.

Oldes

[13:18](#msg596b67aa3230e14f3a63fc2b)what about revert the commit which made this issue?

dockimbel

[13:19](#msg596b67ddf5b3458e30508c26)Reverting such commit will likely create regressions, so no.

Oldes

[13:22](#msg596b688f3230e14f3a63fe54)Reverting it just resolves the current invalid behavior... if I understand the commit well, it was used just to provide compiler detection and error reporting for nested assignment.

dockimbel

[13:25](#msg596b693876a757f80816aff3)I don't want to take any risk when the new release is imminent, nor do I want to retest everything manually again on all platforms.

Oldes

[13:25](#msg596b695e89aea4761da3761d)But then you are providing very odd version, because this is really odd. But true is, that there is not many users who would notice it.

dockimbel

[13:27](#msg596b69b3c101bc4e3a8dbad7)I don't want to delay the release for 24h more because of that. The 90k LOC of R/S in the runtime seem to be unaffected by this issue, so there's no urgency.

Oldes

[16:22](#msg596b92b9f5b3458e30512587)@dockimbel here it is: https://github.com/red/red/issues/2893

raimundasa

[17:52](#msg596ba7ef329651f46e9261d6)A refinement `request-dir/dir` does not work properly if an argument is a string. A starting directory always is user\`s home directory. My system is Windows 8.1

greggirwin

[20:39](#msg596bcefdc101bc4e3a8f27b1)Confirmed. It looks the same for `request-file/file`. Both internal funcs (`OS-request-dir/OS-request-file`) look like they may have been written for file support, and strings were added to the func spec later, without them being updated. They coerce `file!` values to OS-local format, but don't seem to prime `pbuf` if it's a string.

## Wednesday 19th July, 2017

PeterWAWood

[02:04](#msg596ebe3c4bcd78af56c387c8)When compiling tests under FreeBSD32, libRedRT fails to compile:

```
-=== Red Compiler 0.6.3 ===- 

Compiling /mnt/Red/red/tests/source/runtime/unicode-test.red ...
Compiling libRedRT...
...compilation time : 792 ms

Compiling to native code...
*** Compilation Error: invalid path value: image/encode 
*** in file: %environment/codecs/png.red 
*** in function: exec/ctx259~encode
*** at line: 1 
*** near: [as cell! image/encode img where IMAGE_PNG]
```

[02:07](#msg596ebec9f5b3458e305e190f)runtime/tools-test.reds fails to compile under FreeBSD32:

```
-=== Red Compiler 0.6.3 ===- 

Compiling /mnt/Red/red/tests/source/runtime/tools-test.reds ...

Target: FreeBSD 

Compiling to native code...
*** Compilation Error: #export directive requires a library compilation mode 
*** in file: %start.reds 
*** at line: 67 
*** near: [
    #export [environ __progname]
]
```

iArnold

[11:35](#msg596f43f1f5b3458e3060211a)And if you fix that there will be other errors ahead, I did some investigations a while ago: https://github.com/reddoc/develop/wiki/DEV-GOAL-FreeBSD-support

## Thursday 20th July, 2017

iArnold

[07:27](#msg59705b6df5b3458e3064bba0)Testing for virusses of the simplest Red \[] Print "Hello World" program created with 0.6.3 release on  
https://www.virustotal.com results in positives for:  
Virusscanner Result Version  
Avira (no cloud) TR/Crypt.XPACK.Gen2 20170720  
CrowdStrike Falcon (ML) malicious\_confidence\_60% (D) 20170710  
Cylance Unsafe 20170720  
Endgame malicious (moderate confidence) 20170713  
Invincea heuristic 20170607  
Qihoo-360 HEUR/QVM20.1.9ABE.Malware.Gen 20170720  
(eScan AV is not included in the tests)

[13:16](#msg5970ad110de4d2545e47a66f)eScan seems to have changed something, my program now is allowed to run again.

greggirwin

[17:21](#msg5970e6961c8697534a4392ad)Thanks for testing that Arnold.

kermitaner

[18:40](#msg5970f928329651f46ea87c5a)

```
Red[]
m: make map!["a" 1 "b" 2 "c" 3]
foreach k keys-of m[probe k]
```

[18:42](#msg5970f9b276a757f8082e0412)its giving me an error when compiled , target dos, win 10, "entry point exec/f\_words-of" not found in dll, values-of is working correctly, using latest build for windows

greggirwin

[18:48](#msg5970faeabc464729740c7035)Are you compiling in release mode? Maybe an old libRedRT on your system?

kermitaner

[18:51](#msg5970fbc3bf7e6af22cfa6193)libredRT was built new, it was the first compile on my new machine

[18:57](#msg5970fd36bc464729740c7cb7)ok, its working now, compiled again with -r flag, sorry

greggirwin

[18:58](#msg5970fd382723db8d5e2eacd4)If I compile in release mode, it works here.

[19:02](#msg5970fe301c8697534a43f780)If I compile with `-u`, the compile completes fine, but then gives the same error you posted. Please open a ticket.

kermitaner

[19:03](#msg5970fe9d329651f46ea89603)ok, my first one :smile:

greggirwin

[19:04](#msg5970feab89aea4761dba95f8)Congratulations! :^)

[19:07](#msg5970ff5676a757f8082e1e76)Looks like an aliasing issue on `keys-of`. If you change that to `words-of`, it works fine.

kermitaner

[19:10](#msg597100161c8697534a43ffb1)ah, thanks, i'll use that, ticket opened :)

greggirwin

[19:10](#msg5971003fbc464729740c88af)Thanks!

## Friday 21st July, 2017

raimundasa

[21:45](#msg5972760676a757f808342c3c)A behavior of a code snippet on the paragraph 10 (Red/View Graphic Engine) is strange. If I click "Change" text-list data not changes. But if I click any Name and then click "Change", it substitutes to lowercase "john"

greggirwin

[21:52](#msg597277b7bc46472974126cd6)Should do this instead?

```
view [
    list: text-list data ["John" "Bob" "Alice"]
    button "Add" [append list/data "Sue"]
    button "Change" [lowercase list/data/(list/selected)]
]
```

[21:53](#msg597277cb89aea4761dc0917a)If so, I agree.

[22:13](#msg59727c8f89aea4761dc0a2d4)Updated.

## Saturday 22nd July, 2017

9214

[02:24](#msg5972b7533230e14f3a81d254)Good morning gentlemen :shipit:

```
Red []

case []
```

Results in:

```
Compiling to native code...
*** Compilation Error: datatype not allowed
*** in file: %<snip>
*** at line: 332
*** near: [none
    either logic/true? none [stack/reset none/push-last]
    stack/unwind #user-code
]
```

[02:28](#msg5972b85bf5b3458e306e6e81)Another tricky bug which boils down to something like this:

```
my-ctx: context [
    my-other-ctx: context [
        f: func [c][
            object [x: 100 * c y: 100 / c]
        ]
    ]

    foo: func [c][my-other-ctx/f c]
]

probe my-ctx/foo 3

view []
```

`my-ctx/foo` should always return `object!` and that's exactly what happening in interpreter:

```
make object! [
    x: 300
    y: 33
]
```

But If I'll compile this script and launch app, `my-ctx/foo` for some reason returns `3`.

[02:34](#msg5972b9ad3230e14f3a81da17)Another example which is more similar to my original situation:

```
with: func [
    contexts [block!]
    body     [block!]
][  
    forall contexts [bind body reduce first contexts]
]

my-ctx*: context [
    my-other-ctx: context [
        f: func [c][
            object [x: 100 * c y: 100 / c]
        ]
    ]

    some-other-ctx: context [field: 'whatever] ;<-- if I'll comment out this line compiled app will silently crash
    
    foo-body: with [some-other-ctx][my-other-ctx/f c]
    foo: func [c] foo-body
]

probe my-ctx*/foo 3

view []
```

Again, in interpreter it's good ol' `object!`, but once compiled `probe` returns

```
func [c][some-other-ctx]
```

Alternatively, if I wrap up `my-ctx*/foo 3` call inside `view` block like this:

```
view [do [probe my-ctx*/foo 3]]
```

I'll get `object!` in interpreter (as usual), and, uhm, `object!` in compiler, but not the one I expected

```
make object! [
    field: 'whatever
]
```

[02:41](#msg5972bb6289aea4761dc15c25)Further if I want to access, say, `x` field of returned `object!` I'll get an error, since there's no `x` field! (because it's not \*that* object) :(

[04:33](#msg5972d5b32723db8d5e35d649)

```
ctx: context [
    ctx*: context [
        ok?: func [x][yes]
    ]

    foo: func [thing][
        case [
            not ctx*/ok? thing [return "UNNACEPTABLE!"]
        ]
    ]
]
```

```
...using libRedRT built on 22-Jul-2017/7:13:40+5:00
*** Compilation Error: CASE is missing a value
*** in file: <snip>
*** near: []
```

[04:35](#msg5972d607bc46472974137ee5)Alternatively:

```
ctx: context [
    ctx*: context [
        ok?: func [x][yes]
    ]

    foo: func [thing][
        if not ctx*/ok? thing [return "UNNACEPTABLE!"]
    ]
]
```

```
...using libRedRT built on 22-Jul-2017/7:13:40+5:00
*** Compilation Error: expected a block for IF-BODY instead of word! value
*** in file: <snip>
*** near: [thing [return "UNNACEPTABLE!"]]
```

[04:36](#msg5972d6661c8697534a4afe97)With `ok?` moved out of inner context everything works fine.

dockimbel

[05:28](#msg5972e285614889d475db8e4f)@9214 Please log those findings into new tickets, so we can process them when possible.

9214

[05:29](#msg5972e29f45fc670746b61289)@dockimbel yessiree!

[06:46](#msg5972f4d8bc4647297413dc95)I expected it to spit out generic syntax error (I know that it should be valid hex color)

```
view [backdrop #itscrash]
```

```
*** Runtime Error 1: access violation
*** at: 0042535Dh
```

dockimbel

[06:47](#msg5972f50b329651f46eafe36a)@9214 Good catch! Please fill a ticket for it, will fix it today.

## Tuesday 25th July, 2017

raimundasa

[09:42](#msg597712721c8697534a59f6da)@greggirwin

```
view [
    list: text-list data ["John" "Bob" "Alice"] select 1
    button "Add" [append list/data "Sue"]
    button "Change" [lowercase pick list/data list/selected]
]
```

xqlab

[10:51](#msg597722b789aea4761dd0eccc)

```
>> wait  0:10:0
== none
```

wait does not wait for specified time

[11:16](#msg5977289a329651f46ebec0f9)wrong time  
Rebol

```
>> help system/version
SYSTEM/VERSION is a tuple of value: 2.7.8.4.2
>> now
== 25-Jul-2017/13:13:52+2:00
>>
```

```
--== Red 0.6.3 ==-- 
Type HELP for starting information. 

>> now
== 25-Jul-2017/12:14:17+01:00
>>
```

[11:18](#msg597728f8c101bc4e3abb646b)It seems summertime saving is not considered

9214

[11:37](#msg59772d6f614889d475eaf18a)@dockimbel Doc, can you give any ETA on https://github.com/red/red/issues/2910 or give a tip on how to bypass it? I'm asking because this unpleasant bug prevents me from using compiled app and my attempts on refactoring and full rewrite did not lead to anything :(

geekyi

[11:38](#msg59772daf45fc670746c54654)@9214 `foo: func [c][do [my-other-ctx/f c]]` helps? In general, if there is a compiler error with function, that instead runs the function in an interpreter

9214

[11:39](#msg59772de0bc4647297423048f)@geekyi which `func` exactly? I start to remember something among this lines in compiler vs. interpreted behavior...

[11:42](#msg59772e9e614889d475eaf584)no, wrapping `my-ctx/foo 3` in `do` block doesn't help

[11:44](#msg59772f0945fc670746c54c2a)@geekyi oh, I see your edited message

[11:45](#msg59772f48bc46472974230977):O yes! Thanks a bunch @geekyi !

[12:00](#msg597732dd329651f46ebef278)and now I have no idea where to insert this `do`

PeterWAWood

[12:07](#msg5977346d1c8697534a5a8b28)@9214 If you insert `do [` straight after the Red header and `]` at the end of your code, the whole program will be compiled to be interpreted. The compiler will still give you a single binary executable to run. When it runs the code will be interpreted by the Red runtime.

We use this "crude" method to create interpreter tests for Red.

9214

[12:11](#msg5977357689aea4761dd14349)cheers to @PeterWAWood and @geekyi :beers: ! I thought I'll go nuts sooner or later :smile:

[12:14](#msg5977361f89aea4761dd14817)Sigh... I'll probably go nuts, compiled app got detected by AV

[12:14](#msg59773628bc46472974232545)\[!\[изображение.png](https://files.gitter.im/red/bugs/orqF/thumb/\_\_\_\_\_\_\_\_\_\_\_.png)](https://files.gitter.im/red/bugs/orqF/\_\_\_\_\_\_\_\_\_\_\_.png)

dockimbel

[12:16](#msg59773693714ea96f781e85e7)@xqlab `wait` issue confirmed, a recent regression, will be fixed in a few minutes.

[12:18](#msg5977370a614889d475eb1a4e)@9214 Could you please report it as false positive to Avast? You can always check against other AV using: http://virustotal.com

9214

[12:18](#msg59773714329651f46ebf02dc)@dockimbel sure thing!

[12:40](#msg59773c2d89aea4761dd16620)Compiled with `-c -r -t Windows` app can't be launched - View window just never pops up.

[12:40](#msg59773c38714ea96f781e9e12):point\_up: \[25 июля 2017 г., 17:11](https://gitter.im/red/bugs?at=5977357689aea4761dd14349)

dockimbel

[12:41](#msg59773c864bcd78af56e40741)@9214 `-c` and `-r` are contradicting options, should be either one or the other. When compiled with `-t Window`, you give up on having a console, so any output attempt using `print` or `probe` will result in the app quitting. Or it could just be your AV preventing the executable from launching.

9214

[12:42](#msg59773cafc101bc4e3abbc2e1)if I want to compile self-contained `exe` which I want to share with users, should I use `-r`?

dockimbel

[12:43](#msg59773d00c101bc4e3abbc3ee)@9214 Yes, `-r` is for compiling in release mode, so a self-contained exe.

9214

[12:44](#msg59773d24714ea96f781ea302)Thanks for pointing out `probe` and `print`, I think I forgot to remove them after debugging :D

dockimbel

[12:49](#msg59773e6c45fc670746c594c0)@9214 We'll try to improve that in the next release.

9214

[13:38](#msg597749f3329651f46ebf5a5e)@dockimbel I've re-checked source code, it seems that app compiled with `-r` flag silently crashes (console window blinks for a second and disappears).

[13:43](#msg59774b16c101bc4e3abc0207)just out of curiosity tried to run compiled `exe` on old Win XP machine and got

```
Entry point in procedure GetGestureInfo not found in DLL USER32.DLL
```

[13:48](#msg59774c2c89aea4761dd1bb48)Same with `-c` flag. Though I can try to compile without `-t Windows`... Edit: nope, still the same error.

[13:55](#msg59774dd14bcd78af56e45b7c)Okay, only standard compilation with `-c` flag from VSCode produces working executable, compilation with other options (`-o`, `-r`, and `-t Windows`) doesn't work.

[14:10](#msg5977513d714ea96f781f088a)Gosh, turns out `exe` compiled with `-r -t Windows -o ...` works \*only if* all `.red` scripts are present in the same directory... is it because of `do/expand` workaround?

dockimbel

[14:11](#msg59775179329651f46ebf8188)@9214 There is a `WindowsXP` compilation target.

[14:13](#msg597751f92723db8d5e461500)@9214 Possible, if you `do` the other `.red` script at runtime, if you include them it should work, though `#include` in Red is still limited for now.

9214

[14:13](#msg597751fa329651f46ebf83ad)@dockimbel right, but what should I do if I want a \*real* self-contained app? :( :point\_up: \[25 июля 2017 г., 19:10](https://gitter.im/red/bugs?at=5977513d714ea96f781f088a)  
If I throw away `do/expand` then #2910 pops up.

[14:14](#msg5977522976a757f808457842)

```
do/expand [
    #include %decoder.red
    #include %injector.red
    #include %gui.red
]
```

Doesn't work. Should I `do` them instead?

dockimbel

[14:17](#msg597752f44bcd78af56e4758c)@9214 `do/expand [#include ]` does not work?

9214

[14:17](#msg59775312714ea96f781f0f7b)@dockimbel no, and neither `do [do do ...]`

[14:18](#msg5977534a714ea96f781f105b)app works only if I place `exe` among all needed scripts

dockimbel

[14:20](#msg597753b789aea4761dd1e173)@9214 Sounds logical, `do` will load files at run-time, so the exe location matters.

9214

[14:21](#msg597753e11c8697534a5b20db)Sigh, I'm doomed :(

dockimbel

[14:23](#msg59775463329651f46ebf9230)You should include those files directly if you want them embedded in your exe, putting them in a block with a `do/expand` postpones their processing to run-time.

9214

[14:24](#msg59775498c101bc4e3abc3a1c)@dockimbel you mean copy-paste everything in one script and wrap this big chunk of code into `do/expand`?

[14:25](#msg597754df329651f46ebf94ee)`do/expand` needed (or not?) because there's macros

[14:31](#msg5977564abc4647297423ca45)Hooray, it seems to work like that!

dockimbel

[14:32](#msg5977567245fc670746c61912)@9214 No the opposite, no wrapping it with a `do`. The compiler resolved macros already, `do/expand` will preprocess and evaluate the argument block at run-time, though, the compiler should have expanded the macros in the block before, unless there are hidden behind an include, and as `#include` is rather limited currently...

9214

[14:34](#msg597757011c8697534a5b2f28)@dockimbel thanks a lot for your guidance, I appreciate that. Will this compile limitations be throwed away on the road to `1.0`? Because, frankly, working with interpreted Red was \*very* joyful experience, but then it comed to compilation... yikes, my arse still hurts :fire:

[14:37](#msg597757baf5b3458e307f113e):point\_up: \[25 июля 2017 г., 19:32](https://gitter.im/red/bugs?at=5977567245fc670746c61912) to clarify, I copy-pasted all scripts into one big blob and wrapped it up inside `do/expand`, so far `exe` is trully self containted.

dockimbel

[14:38](#msg597757ec4bcd78af56e49174)@9214 By mixing compile-time preprocessing with run-time preprocessing and limited `#include` capabilities, you are jumping right in the middle of uncharted behaviors. I don't think anybody tried such mix until now. Given how young is the preprocessor and the various compiler rough edges, you should be going there step by step, so we can identify bugs and limitations one by one and fix or workaround them.

[14:42](#msg597758d71c8697534a5b38a8)You need to give me the time to process the tickets you opened recently about the preprocessor and includes. That would probably clear up most of your issues.

9214

[14:45](#msg5977596e89aea4761dd1fc10)Sure thing, no pushing here! I just badly wanted this compiled `exe`, otherwise whole project of mine is useless.

dockimbel

[14:47](#msg59775a1845fc670746c6295b)@9214 You can send me an archive with whole sources in private message if you want, so I can have a more global look at what is going wrong.

greggirwin

[16:43](#msg5977751476a757f808462990)With R2, the preprocessor (or Ladislav's `include`) let you bundle all your scripts into one for encapping. The downside, of course, is that then you need a main script to do the build. Not hard, but not as easy as just running interpreted. Here is where we can build tooling to help, but need to think about notations. With R2, I sometimes had multiple build scripts (bundle, encap, encap for distro on CD, build for IOS).

[16:43](#msg59777541329651f46ec032be)What matters, then, is the notation we use for tooling. e.g., can tools safely find all `do` instances and handle them.

## Wednesday 26th July, 2017

geekyi

[11:42](#msg5978801376a757f8084a3d96)

```
red
Red []
print unset ; doesn't work but prints error after eval next line (4 + 2)
print 4 + 2
```

[11:43](#msg5978804ac101bc4e3ac0d656)Example in gui console (have to run from file):

```
6
*** Script Error: unset does not allow unset! for its word argument
*** Where: unset
*** Stack:
```

9214

[11:43](#msg5978804e76a757f8084a3e80)@geekyi

```
>> print unset
*** Script Error: unset is missing its word argument
*** Where: unset
*** Stack:  

>> print 4 + 2
6
```

[11:43](#msg5978806245fc670746cac614)

```
>> system/version
== 0.6.3
>> system/build/date
== 25-Jul-2017/14:54:28+05:00
```

maximvl

[11:44](#msg597880ac2723db8d5e4ac902)@geekyi this is correct, `unset` expects argument so evaluation goes to the next thing which is `print 4 + 2`

geekyi

[11:44](#msg597880b6614889d475f0733c)@9214 I'll have to check with latest version also, using stable 0.6.3

maximvl

[11:44](#msg597880b71c8697534a5fe5c5)it prints the result and returns `unset!` which becomes argument for `unset` and then fails

geekyi

[11:45](#msg597880c345fc670746cac73c)@maximvl silly me! I was wondering why `print [unset]` was working fine

9214

[11:45](#msg597880f4a7b406262d310707)so it's `unset` `unset`?

maximvl

[11:46](#msg59788107329651f46ec41f62)do not believe the line breaks, they are an illusion :D

[11:46](#msg597881262723db8d5e4acaff)@9214 yup:

```
>> probe print 1
1
unset
>> unset unset
*** Script Error: unset is missing its word argument
*** Where: unset
*** Stack:
```

geekyi

[11:47](#msg5978815a89aea4761dd68d38)Actually was trying to reduce an error, maybe I reduced it too far..

maximvl

[11:48](#msg59788170bc46472974286bdf)do you even reduce? :D

geekyi

[11:51](#msg5978824cf5b3458e3083be24)@maximvl too much XD , actually same problem higher up..

```
s: reduce [:append 42]

print type? s/1  ; incomplete line
print [4]
```

[11:52](#msg59788261f5b3458e3083be71)Maybe if I'd used `probe`, would catch sooner..

9214

[11:53](#msg597882d145fc670746cad0e8)how can you append if `42` is not a series?

maximvl

[11:54](#msg597882fb614889d475f07c3c)this code doesn't run `append`, it evaluates to the function itself

geekyi

[11:54](#msg597883104bcd78af56e9260d)@9214 not trying to, just trying out \*compile* vs \*interpret\*. Could have been any other func

maximvl

[11:55](#msg5978832b76a757f8084a4c72)

```
>> s: reduce [:append]
== [make action! [[
    {Inserts value(s) at series tail; returns series head} 
    series [ser...
>> print type? s/1
*** Script Error: s/1 is missing its series argument
*** Where: type?
*** Stack:
```

[11:55](#msg5978834f2723db8d5e4ad47f)to make sure you don't run it use the colon:

```
>> print type? :s/1
action
```

9214

[11:56](#msg597883642723db8d5e4ad4a7)`get-word!` ;)

geekyi

[12:15](#msg597887c74bcd78af56e93b56)Got caught by nested `blocks!` of length 1. `?` doesn't distinguish between.. no, you can't simply find the difference from console output. Found out there isn't a bug (probably)

[12:16](#msg5978881cc101bc4e3ac0f6b0)@geekyi was inspired by @9214 bug https://github.com/red/red/issues/2910 :evil:

9214

[12:17](#msg5978885e89aea4761dd6abb6)@geekyi don't mention it, I won't sleep if I see number `2910` ever again :(

[12:17](#msg5978887489aea4761dd6ac67)@9214 still fights with compiler

geekyi

[12:19](#msg597888cc1c8697534a600607)Due to the way it works now, compiled vs interpreted code can give different `length?` for blocks, if you have nested functions

9214

[12:19](#msg597888ef89aea4761dd6ae3a)@9214 fun factoids: `2910` is almost like `9214` only messed up and without `4`

geekyi

[12:20](#msg597888ff329651f46ec440fd)@geekyi noticed it too

9214

[12:21](#msg5978892d89aea4761dd6af10)@geekyi have you tried to wrap script inside `do` block?

geekyi

[12:21](#msg59788954329651f46ec442b8)@9214 not a bug, just testing stuff. Using `do` and `reduce`

9214

[16:09](#msg5978beb44bcd78af56ea34cf)`make error! 100` silently crashes REPL. Bug/feature?

rebolek

[16:23](#msg5978c1f21c8697534a611e45)Certainly a bug. I've reported similar one recently.

9214

[20:27](#msg5978fb3276a757f8084c7c3c)

```
text
view layout/flags [] 'some-valid-flag
```

```
*** Script Error: cannot set none in path none
*** Where: eval-set-path
*** Stack: view layout eval-set-path
```

meijeru

[20:37](#msg5978fd921c8697534a621f44)crash of `make error! 100` is also in comments to issue #2628

9214

[20:38](#msg5978fdd6bc464729742aa102)@meijeru :+1:

greggirwin

[21:38](#msg59790bdc329651f46ec68bc7)@9214, confirmed that `layout` has the issue, but `view` itself is fine. Is that what you mean?

9214

[21:44](#msg59790d241c8697534a625d98)@greggirwin yup

greggirwin

[21:44](#msg59790d50f5b3458e30862fc5)Seems worth a ticket, if one isn't there already.

[21:44](#msg59790d5aa7b406262d337ff0)Nice find.

9214

[21:46](#msg59790dbbbc464729742ad7bd)quickly skimmed through open issues with `layout`, couldn't find anything related, currently filling a ticket.

[21:47](#msg59790dec45fc670746cd33a4)https://github.com/red/red/issues/2936

greggirwin

[21:47](#msg59790dfd45fc670746cd33c7)Thanks @9214.

## Thursday 27th July, 2017

geekyi

[07:20](#msg597994361c8697534a640c41)&gt; crash of `make error! 100` is also in comments to issue #2628

red/red#2628

## Friday 28th July, 2017

9214

[12:30](#msg597b2e7345fc670746d4b045)What is prefferable format for issues in `red` repo?

rebolek

[12:31](#msg597b2e8d4bcd78af56f2e990)What do you mean by format?

9214

[12:34](#msg597b2f5789aea4761de062d4)I mean how to format your bug finding so it's easier to read/track/reproduce by Red team? Say, instead of `foo chokes up on bar arg` maybe I should write `SOME-TAG-IN-CAPS: FOO chokes up on BAR arg` or vise versa? Same for content of the issue, I know that it should contain at least minimum code example, but anyway.

rebolek

[12:36](#msg597b2fd676a757f808545f4c)I usually try to describe the problem in in title, add detailed description and example code to body. `TAG-IN-CAPS` is usually left for `WISH:`, or maybe `[VID]` and/or `[View]`.

dockimbel

[14:38](#msg597b4c7b329651f46ece7347)@9214 You can put emphasis on some parts using typographic styles: italic, bold, underline, that's usually enough. Or do you mean specifically for the issue's title?

## Saturday 29th July, 2017

9214

[13:00](#msg597c86e8329651f46ed250cc)yes, issue's title

dockimbel

[14:45](#msg597c9f98329651f46ed29cde)An informal tag can help, but more for searching duplicates than for processing it. Actually, titles should be really be optimised for duplicates identification. Not sure what should be the best rules for that.

## Sunday 30th July, 2017

toomasv

[13:32](#msg597ddfeec101bc4e3ad29c75)Bug?

```
>> bs: make bitset! 1
== make bitset! #{00}
>> repeat c length? bs [print bs/:c]
false
false
false
false
false
false
false
false
>> b: [true false true] 
== [true false true]
>> repeat x length? b [bs/:x: b/:x]
== true
>> repeat c length? bs [print bs/:c]
true
true
true
false
false
false
false
false
```

I expected second bit to be `false`.

[13:48](#msg597de3bf1c8697534a71f978)Sorry, got it. Right way would be:

```
>> repeat x length? b [bs/:x: reduce b/:x]
== true
>> repeat c length? bs [print bs/:c]
true
false
true
false
false
false
false
false
```

x8x

[17:13](#msg597e13ca81cd9a5d7e9bbcae)I think it's a bug:

```
make date! [1 2 3 4 5 6 4]
;   1-Feb-0003/4:05:06+04:00
  make date! [1 2 3 4 5 6 5]
*** Script Error: cannot MAKE/TO date! from: [1 2 3 4 5 6 5]
*** Where: make
*** Stack:
```

greggirwin

[17:51](#msg597e1c93210ac269203bfb8c)Looks like it. There has been some recent work on date, but I don't know if it's a regression.

[17:52](#msg597e1cdba7b406262d43ad39)Zone is good down to -16 in that construct, then wraps back to -1.

[17:53](#msg597e1d054bcd78af56fbb2ba)Please file a ticket.

x8x

[17:53](#msg597e1d3381cd9a5d7e9bbd17)Will do thanks for checking :-)

## Monday 31st July, 2017

dockimbel

[09:25](#msg597ef7742723db8d5e5f9708)@greggirwin Are "file a ticket" and "fill a ticket" equivalent expressions, or is the latter incorrect?

[09:25](#msg597ef79976a757f8085fbf7e)MAKE date! issue is fixed now.

x8x

[09:26](#msg597ef7c842d2f61025884daf)Thanks! Works fine now. 😃

greggirwin

[15:43](#msg597f5021210ac269203fea98)@dockimbel, "File a ticket" is like "Submit a ticket" or "File a report". If you want to use "fill", I would say "Fill \*out* a ticket."

geekyi

[17:00](#msg597f6224329651f46edae6f5)"Fill out a form, then file it for later" :)

dockimbel

[17:27](#msg597f68651c8697534a770f6b)Thanks for the explanations. :+1:

raimundasa

[19:34](#msg597f863776a757f8086221bb)A button is not colored. win 8.1  
'''  
view \[button red "Click Me"]  
'''

greggirwin

[19:59](#msg597f8c0576a757f808623696)Not supported at this time. Native controls offer both benefits and limitations.

[20:06](#msg597f8dafc101bc4e3ad85760)You can work around it, by creating images to use on base faces (or drawing directly on them). Depends on how much work and what effects you need. e.g.

```
>> i: make image! 100x24
== make image! [100x24 #{
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFF
>> draw i [pen black fill-pen red box 1x1 99x23]
== make image! [100x24 #{
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFF
>> view [base i]
```

raimundasa

[20:13](#msg597f8f4e2723db8d5e6218d9)Then clear

## Friday 4th August, 2017

x8x

[00:07](#msg5983bac342d2f6102588863c)There is probably a recent regression in compiled code, this used to return `123.0`, it now returns `123`:

```
Red []
object [
	to-float*: :system/words/to-float
	set 'to-float func [n][to-float* n]
]
print to-float 123
```

tried with `-c` and `-r`

dockimbel

[03:43](#msg5983ed63a7b406262d58ef28)@x8x Will have a look at it.

xqlab

[11:52](#msg5984601bf5b3458e30ada381)Anyone else seeing strange behavior of the gui-console under Win7? Sometimes the active area is smaller than the window size.

dockimbel

[12:29](#msg598468a4c101bc4e3aea732b)@xqlab Please share a screenshot for such kind of cases. Can you provide some ways to reproduce it?

rebolek

[16:10](#msg59849c91a7b406262d5ba8ab)@dockimbel Here's a question from IRC:

&gt; I just downloaded latest red binary "red-63" and tried to run it, but all i get was:  
Compiling compression library...  
Compiling Red console...  
\*\** Runtime Error 23: illegal operand  
\*\** at: 0806202Dh  
whats that about?  
it's a bit old pentium 4 linux machine

dander

[21:32](#msg5984e80a210ac269205515df)@dockimbel I was just seeing a strange behavior that sounds like what @xqlab was describing when I pasted and slightly modified the code from @rebolek's post :point\_up: \[August 4, 2017 3:51 AM](https://gitter.im/red/red/gui-branch?at=598451b8210ac2692052ad4a)  
It didn't seem to happen every time, so thought it was something I was doing, but I can get it to happen without making any changes to that line. Just open console, paste, enter. It seems like the text area of the window shrinks down when it shows the new view window. If I resize the console window by dragging the corner, it goes back to normal

[21:33](#msg5984e8161c8697534a8c1f4d)\[!\[image.png](https://files.gitter.im/red/bugs/n5KT/thumb/image.png)](https://files.gitter.im/red/bugs/n5KT/image.png)

[21:42](#msg5984ea4f614889d4751cb6d6)looks to me like the text area takes the same size as the child window

## Saturday 5th August, 2017

dockimbel

[04:55](#msg59854fb7329651f46ef09354)@rebolek We are missing \[SSE3 detection](https://github.com/red/red/blob/master/red.r#L96) for non-Windows platforms, so that the compiler will emit unsupported instructions. If someone wants to add SSE3 detection for Linux and macOS platforms, a PR is welcome. (Should be trivial for Linux using `/proc/cpuinfo`).

[04:56](#msg5985500745fc670746f7b87d)@qtxie Please have a look at the console issue above.

[04:57](#msg598550394bcd78af5616049e)@dander You can open a ticket for that.

dander

[06:20](#msg598563c82723db8d5e77cf0c)@dockimbel @qtxie issue #2962 created

xqlab

[07:03](#msg59856dc8bc4647297455d0bc)I am not on windows now. My observation is similar, but also a little bit different to what @dander sees. It looks same, but it happens immediately after opening the gui-console without any interaction. Resizing cures it.

ne1uno

[07:15](#msg5985708aa7b406262d5e29e8)changing background color from the menu fixes it even for next start. but now it won't remember it's last position, so it must involve the config file somehow

[07:16](#msg598570bfbc4647297455d9a9)win7

rebolek

[12:27](#msg5985b9bc329651f46ef1d25c)@dockimbel Thanks for info, I've passed the message.

dockimbel

[13:00](#msg5985c16ef5b3458e30b2286d)The console resizing issue has been fixed.

## Friday 11st August, 2017

PeterWAWood

[01:12](#msg598d0465ee5c9a4c5faccbcc)Error message for invalid escaped characters show `#"^^..."` instead of `#"^..."`. Is this a consequence of the bootstrap toolchain using Rebol?

```
>> #"^"
*** Syntax Error: invalid char! at {#"^^"}
*** Where: do
*** Stack: load 
>> #"^8"
*** Syntax Error: invalid char! at {#"^^8"}
*** Where: do
*** Stack: load
```

[01:15](#msg598d053980d90ca024e9fff1)Invalid escaped characters "crash" the bootstrap compiler:

```
*** Syntax Error: Invalid issue! value
*** in file: /Users/peter/VMShare/Code/Red/test.red
*** line: 3
*** at: {"^^4"}
>>
```

Is this avoidable at all with the bootstrap compiler?

meijeru

[08:52](#msg598d704f614889d4753a65cf)Curiously, `^4` within a \*string* is accepted, i.e. in that case `^` quotes anything following it, which does not have a special meaning.

[08:55](#msg598d70f11c8697534aaa127d)This could easily be allowed within a character literal as well.

## Saturday 12nd August, 2017

PeterWAWood

[09:52](#msg598ecfe7bc46472974773edf)When molding a date Red formats any timezone as ±hh:mm. Rebol suppresses leading zeros with hours. Personally, I prefer Red's formatting. Is the difference intentional?

## Wednesday 16th August, 2017

Oldes

[16:45](#msg5994768d9acddb24079860cd)@dockimbel I believe that \[this line](https://github.com/red/red/blob/master/runtime/simple-io.reds#L692) should be:

```
res: either zero? res [-1][read-sz]
```

and not:

```
res: either zero? res [-1][1]
```

Currently on Windows it always return 1 as number of bytes read as it is in other oses.

## Saturday 19th August, 2017

maximvl

[16:40](#msg59986a19162adb6d2e11fbaa)is `;` allowed as a word?

[16:41](#msg59986a1eee5c9a4c5fda3fe3)

```
>> to-word ";"
*** Syntax Error: invalid character in: ";"
*** Where: to
*** Stack: to-word  

>> to-word first ";"
== ;
```

rebolek

[16:42](#msg59986a7ebc464729749ec8ea)No, it shouldn't be imo

9214

[16:43](#msg59986ab02723db8d5ebf86f4)Alas

```
>> set to word! "a" 2
== 2
>> a
== 2
>> set to word! #";" 42
== 42
>> ;
>> ; ???
>> ; :^(
```

maximvl

[16:47](#msg59986bb8210ac269209e356b)is there any way to specify exactly how to parse content of `paren!`?

[16:47](#msg59986bbe76a757f808c07bfe)eg `subshell: [ '( compound-list ') ]`

[16:48](#msg59986bd980d90ca024175ebf)(this one doesn't work)

[16:51](#msg59986c7a210ac269209e390e)hm, I guess `into` can do that

rebolek

[16:56](#msg59986dcdbc464729749ed6a2)`ahead paren! into ...` to make sure you are not parsing content of a string, for example

maximvl

[17:46](#msg5998798c210ac269209e6abe)thanks :)

9214

[18:03](#msg59987d79a7b406262da7120a)looks like an issue with `cd`

```
>> to-red-file "C:\Program Files"
== %/C/Program%20Files
>> cd to-red-file "C:\Program Files"
*** Access Error: cannot open: <snip>
*** Where: do
*** Stack: cd change-dir cause-error  

>> change-dir to-red-file "C:\Program Files"
== %/C/Program%20Files/
```

## Sunday 20th August, 2017

toomasv

[05:50](#msg59992338614889d47568eb84)

```
>> set to-word first ";" 42
== 42
>> get to-word first ";"
== 42
>> set to-word #";" 24
== 24
>> get to-word #";"
== 24
```

[06:05](#msg5999268c76a757f808c3216a)Same with other special chars:

```
>> set to-word #"{" 'left-brace
== left-brace
>> get to-word #"{"
== left-brace
```

PeterWAWood

[07:32](#msg59993b19bc46472974a1a754)@toomasv The issue appears to be with the `to` function:

```
>> to word! #";"
== ;
```

toomasv

[07:35](#msg59993bceee5c9a4c5fdd2dc5)@PeterWAWood What issue? :) `to word!` works the same:

```
>> set to word! #";" 42
== 42
>> get to word! #";"
== 42
```

PeterWAWood

[07:36](#msg59993bfe9acddb2407ace124); is not a valid character in a word

toomasv

[07:39](#msg59993c949acddb2407ace2d0)Is it an issue? These are very special cases and not too easily confused with usual word manipulation.

PeterWAWood

[07:46](#msg59993e442723db8d5ec289de)From the Rebol 2:  
"Words are composed of alphabetic characters, numbers, and any of the following characters ? ! . ' + - * &amp; | = _ &amp;~"

The lexer enforces this rule, the `to` function should also enforce it.

toomasv

[07:48](#msg59993ee2614889d475694f4c)Also interesting:

```
>> set to-word first "1" 42
== 42
>> get to-word first "1"
== 42
>>
```

`to` seems to accept any char:

```
>> set to-word first "^/" 42
== 42
>> get to-word first "^/"
== 42
```

dockimbel

[08:59](#msg59994f79578b44a046cb5093)@toomasv `to-word` should be checking for a valid character before allowing the conversion. You can open a ticket for that.

[09:02](#msg5999501176a757f808c3afbc)@9214 `cd` is not a shortcut for `change-dir`, it is meant to work as its system shell counterpart, so only works with literal values, and not with function calls (`change-dir` is there for that).

9214

[09:02](#msg59995032162adb6d2e153279)@dockimbel :+1:

[09:03](#msg59995057a7b406262da9f766)@9214 can't wait to see @maximvl's `shell` dialect

dockimbel

[09:05](#msg599950dc210ac26920a1702d)@9214 Yes, it will be interesting to see how we can best interface a shell-like environment with Red expressions.

9214

[09:06](#msg5999512f80d90ca0241a9758)yeah, then I can throw away Win7, forget about switching to emacs and just sit in Red's REPL for eternity :older\_man:

dockimbel

[09:08](#msg5999517480d90ca0241a9809)Making the Red environment good enough to avoid using the underlying OS at all, is one of my goals. ;-)

toomasv

[10:55](#msg59996a8880d90ca0241af4d1) @dockimbel https://github.com/red/red/issues/2988  
Somewhat reluctantly though. It seems like an interesting feature:

```
>> set to-word #" " 'space
== space
>> get get to-word get get to-word #" "
== #" "
```

[11:26](#msg599971daa7b406262daa711a)

```
code: "v[t"
v: 'view
t: "text {One-letter-command mini-language!}"
set to-word #"[" 'to-block
reduce parse code [collect some [s: keep (get to-word first s) skip]]
```

maximvl

[18:13](#msg5999d1392723db8d5ec4e61f)@9214 here you go ;)  
https://gitlab.com/maxvel/red-shell-dialect

9214

[18:14](#msg5999d170578b44a046cd77c1)@maximvl :clap:

maximvl

[21:54](#msg599a052ac101bc4e3a3bbb8b)

```
>> call/console {grep doesn\'t}
```

[21:55](#msg599a0543ba0f0f6e38c621e8)not sure how the escaping is done, but this ^ hangs interpreter

## Monday 21st August, 2017

geekyi

[00:16](#msg599a2654a7b406262dad2e64)@maximvl which shell/terminal emulator? I think it's possibly problem there

[00:46](#msg599a2d6d614889d4756d03bd)@maximvl what about

```
>> call/console {grep blah}
```

I think anything should hang as `grep` waits for input in that case (when you don't pass in a file to process)

```
~$ grep foo
blah
foo
foo
```

[01:00](#msg599a30cc162adb6d2e18b359)Not sure if this would help:

```
>> call/console form reduce [{grep foo} newline 'blah newline 'foo #"^D"]
```

maximvl

[06:55](#msg599a83fd210ac26920a603fd)@geekyi lol, you are right

[06:56](#msg599a84292723db8d5ec77be9)ill do more tests in the evening

[06:56](#msg599a8436c101bc4e3a3d8696)thanks

## Tuesday 22nd August, 2017

9214

[07:51](#msg599be293162adb6d2e1fb543)

```
text
probe collect [
    foreach [l d] "a1b2" [
        keep reduce [
            subtract to integer! to char! l 1
            to integer! form d
        ]
    ]
]
```

results in `[96 1 97 2]`. But logically identical

```
probe collect [
    foreach [l d] "a1b2" [
        keep reduce [
            -1 + to integer! to char! l
            to integer! form d
        ]
    ]
]
```

gives me

```
[
    96 1
    97 2
]
```

i.e. new-line markers inside block are setted for some reason

rebolek

[07:53](#msg599be30fc101bc4e3a436365)`keep` is probably adding them to make the block more readable. If you do not want them, you can remove them.

9214

[07:56](#msg599be3c5614889d475742e65)@rebolek okay, why then it formatted a block only in the second example with `-1`?

[07:57](#msg599be3ffc101bc4e3a436891)I mean, `-1 + x` is the same as `subtract x 1`

[07:58](#msg599be409bc46472974aca95c)theoretically at least :smile:

rebolek

[07:59](#msg599be478162adb6d2e1fbdc8)Oh

[08:01](#msg599be4cea7b406262db45f2b)This is indeed strange behaviour.

## Thursday 24th August, 2017

PeterWAWood

[12:24](#msg599ec566a7b406262dc1138e)@dockimbel If an error! is made in a function it only appears to be activated when the value is returned. Is this by design or a bug?

```
>> i: 11
== 11
>> if i > 10 [make error! "too big"]
*** User Error: "too big"
*** Where: ??? 

>> f: func [i][if i > 10 [make error! "too big"] print i]
== func [i][if i > 10 [make error! "too big"] print i]
>> f 11
11
>> f: func [i][if i > 10 [return make error! "too big"] print i]
== func [i][if i > 10 [return make error! "too big"] print i]
>> f 11
*** User Error: "too big"
*** Where: ???
```

greggirwin

[15:05](#msg599eeb1ca7b406262dc1d371)I think it's by design. You need to use `cause-error` to make them hot. The console forms error info, so you see it that way:

```
>> f: func [i][if i > 10 [e: make error! "too big"] print i]
== func [i][if i > 10 [e: make error! "too big"] print i]
>> f 11
11
>> e
*** User Error: "too big"
*** Where: ???
```

## Sunday 27th August, 2017

endo64

[08:56](#msg59a28933ba0f0f6e38e98903)@dockimbel `foreach v [] []` returns `unset!` on Red but `none!` on R2. Is it a bug / known issue or intentional?

9214

[12:09](#msg59a2b67a76a757f808eaa836)@endo64 yes, it's known behavior for some (or all?) iterators

endo64

[17:07](#msg59a2fc6bc101bc4e3a60b8cc)Is it decided or TBD?

9214

[17:09](#msg59a2fcad578b44a046f3927e)I think @dockimbel mentioned that this behavior will be reconsidered

## Monday 28th August, 2017

dockimbel

[11:39](#msg59a400efba0f0f6e38ef3af0)@endo64 There's at least one ticket about that. We need to decide what to return for each iterator, and then implement it.

[11:41](#msg59a401569acddb2407d88c3d)@9214  
&gt; @rebolek okay, why then it formatted a block only in the second example with `-1`?

Most probably a side-effect of re-using the value slot internally and not resetting the slot's header bits. Could be considered a feature though. ;-)

[11:42](#msg59a401aa9acddb2407d88dc2)@PeterWAWood Errors are `form`-ed by default when returned in the console. As this can be confusing, I guess we should change that to the `mold`-ed version (`make error! [...]`) rather.

[12:01](#msg59a40600bc46472974ce28c6)@Oldes About your simple-IO question, we don't use the number of bytes read, we just need a success/failure value. If you need it, we can change it to return the number of bytes read (or you can do it directly and send a PR).

9214

[13:44](#msg59a41e439acddb2407d920ad)

```
text
>> [<]
*** Syntax Error: invalid tag! at "<]"
*** Where: do
*** Stack: load
>> ?? <
<: make op! [[
    {Returns TRUE if the first value is less than the second} 
    value1 [any-type!] 
    value2 [any-type!]
]]
>> [< ]
== [<]
```

[13:47](#msg59a41f09210ac26920cd59d8)should I file it as a bug?

rebolek

[13:57](#msg59a4213d162adb6d2e4166eb)@9214 definitely

Oldes

[14:10](#msg59a4243aee5c9a4c5f0a387c)@dockimbel thanks.. I will.

9214

[17:53](#msg59a4588976a757f808f164ff)am I right that `extend` doesn't support `object!`s yet?

rebolek

[17:58](#msg59a459b6578b44a046f958f8)@9214 you are right and the question is if it does not support it \*yet* or at \*all\*.

9214

[17:59](#msg59a459e776a757f808f16b93)I guess \_yet_

```
>> ? extend
USAGE:
     EXTEND obj spec

DESCRIPTION: 
     Extend an object or map value with list of key and value pairs. 
     EXTEND is a native! value.

ARGUMENTS:
     obj          [object! map!] 
     spec         [block! hash! map!] 

REFINEMENTS:
     /case        => Use case-sensitive comparison.
```

rebolek

[17:59](#msg59a45a09210ac26920ce70ca)We will see.

## Friday 1st September, 2017

maximvl

[08:24](#msg59a919269acddb2407ef51f0)

```
>> switch type? :to-path [function! [probe "func"]]
== none
```

[08:24](#msg59a9192966c1c7c4770373b5)is this a bug?

dockimbel

[08:25](#msg59a9197bba0f0f6e38062abe)@maximvl You are trying to match `datatype!` values with `word!` values. Use `type?/word` instead.

maximvl

[08:26](#msg59a919a2210ac26920e36007)@dockimbel ok, I understood the reason, didn't know about `/word!`, thanks :)

dockimbel

[08:27](#msg59a919db66c1c7c4770375f3)Alternatively, you can define inlined `datatype!`values using the construction syntax (`#[...]`), though, it's just partially implemented for now, and anyway looks uglier in code. ;-)

maximvl

[08:40](#msg59a91cea8f4427b462bf58a4)@dockimbel looks like `refinement` can have multiple arguments, is that by design?

```
>> f: func [/a b c] [probe reduce [a b c]]
== func [/a b c][probe reduce [a b c]]
>> f/a 1 2
[true 1 2]
== [true 1 2]
>> f
[false none none]
== [false none none]
```

[08:40](#msg59a91cf8bac826f0546b819c)I don't think I ever saw this in the code

[08:40](#msg59a91d13bac826f0546b81f4)but this means refinements are not equivalent of optional arguments, but something more powerful

meijeru

[09:33](#msg59a92970c101bc4e3a7baf5d)That is indeed by design!

9214

[09:37](#msg59a92a58b16f264642f494ab)sure thing it is

dander

[16:30](#msg59a98b199acddb2407f17ba1)@maximvl check out the /trace refinement on parse: https://github.com/red/red/blob/master/environment/natives.red#L348 :open\_mouth:

Oldes

[16:50](#msg59a98fe1bc46472974e735a9)@dander `trace` refinement in your code have only one argument - a function callback ;)

[16:53](#msg59a990998f4427b462c1944c)@maximvl it is for sure by design.. even help can recognize it:

```
>> f: func [/a b "this" c "that" /d] [probe reduce [a b c]]
== func [/a b "this" c "that" /d][probe reduce [a b c]]
>> ? f
USAGE:
     F 

DESCRIPTION: 
     F is a function! value.

REFINEMENTS:
     /a           => 
        b             "this".
        c             "that".
     /d           =>
```

dander

[17:01](#msg59a992528f4427b462c19c0d)@Oldes not my code... but I was amazed at how much detail could be added to a refinement argument

[17:02](#msg59a992c29acddb2407f19e5e)I was just used to seeing the type blocks and descriptions. I didn't know you could describe the whole callback signature, and I thought that was really cool!

[18:26](#msg59a9a654210ac26920e612cc)Would it be worth opening a wish ticket to request making `unset!` falsey? It's sort of related to #2645, but I think there might be a stronger case for `unset!`. My concern is that I might be conflating it with `none`, and I don't totally understand the implications it would have with functions that return `unset!`. However this kind of thing seems confusing/surprising to me (I know that's not an argument in itself for doing it):

```
>> unset 'w
>> if (get/any 'w) [print w]
*** Script Error: w has no value
```

greggirwin

[18:49](#msg59a9abbdc101bc4e3a7e1e84)There's a bit of historical discussion about `unset!`, with no clear right/wrong answer. It's a design choice. I don't think it's worth a wish ticket, but I doubt Doc wants to take time right now to document his thoughts in more detail. http://www.rebol.net/r3blogs/0318.html has some good thoughts in it, WRT the truthiness of `unset!` from Carl's perspective. There is a note about why it exists at all, which is important, and simple: https://github.com/red/red/wiki/Guru-Meditations#why-does-unset-exist.

It does mean we will have some "Don't do that" cases. An alternative, timely with the current Haskell chat here, is what happens when everything has to be `Maybe` enabled.

9214

[18:53](#msg59a9ac93162adb6d2e5a1454)I'd say that you should not rely on `unset!` as a `true` or `false` at all, it's kinda of a special value as @greggirwin pointed out

[18:55](#msg59a9ad18bac826f0546e39f4)I already stumbled on this once while creating a macro which relies on a returning value from a `while` - in Red it's always `unset!`, but not in Rebol; so, in interpreter everything worked, but broke after compilation (since macros currently rely on R2)

dander

[19:15](#msg59a9b1d8c101bc4e3a7e3c24)@greggirwin, @9214 Thanks, that rebol post kind of flipped the switch for me. I think my confusion was based on coming from languages which only have `null`, which needs to be differentiated between an invalid condition, and also a valid empty placeholder. I hadn't realized that redbol had a solution to that problem :smile:

## Saturday 2nd September, 2017

maximvl

[07:24](#msg59aa5cb266c1c7c47708bc90)is this a bug?

```
>> find reduce [function! op! action! native!] datatype!
== [function! op! action! native!]
```

[07:25](#msg59aa5cd1bac826f05470bb1f)

```
>> function! = datatype!
== false
```

rebolek

[07:49](#msg59aa6283162adb6d2e5ca1a8)no

maximvl

[07:49](#msg59aa6299bc46472974ea6bf8)what's going on then?

[07:49](#msg59aa62a0bac826f05470cdfb)I don't see any logic here

rebolek

[07:50](#msg59aa62b1bc46472974ea6c22)You can search by datatype:

```
>> find ["asdf" 123 456,789 bflm] float!
== [456.789 bflm]
```

[07:50](#msg59aa62d8bac826f05470cea4)So if you search for `datatype!`, it returns first found datatype, in your case `function!`

maximvl

[07:51](#msg59aa62f4bac826f05470cf24)how do I search for `datatype!` itself?

rebolek

[07:53](#msg59aa6386210ac26920e8c571)Hm

maximvl

[07:53](#msg59aa6397162adb6d2e5ca70a)ok, to-word seems to work:

```
>> find [function! op! action! native!] to-word datatype!
== none
>> find [function! op! action! native!] to-word function!
== [function! op! action! native!]
```

rebolek

[07:54](#msg59aa63d2162adb6d2e5ca795)But then you are not searching for `datytype!` but for `word!`

maximvl

[07:55](#msg59aa6408bc46472974ea7060)btw I foresee a lot of problems with debugging having two things represented in the same way like `function!` as a word and `function!` as a datatype

rebolek

[08:00](#msg59aa6509bac826f05470d5ac)Yes, it brings some problems. They are fortunately solvable.

maximvl

[08:25](#msg59aa6ae9bc46472974ea8b19)@rebolek is there any way to make an object callable?

rebolek

[08:26](#msg59aa6b20bc46472974ea8b73)@maximvl You can call function in an object, if that's what you mean. I'm not sure how you want to call whole object.

maximvl

[08:26](#msg59aa6b36162adb6d2e5cbffa)`a: object ...` and then `a x y`

[08:26](#msg59aa6b4d210ac26920e8e720)eg if an object has a function, lets say `call` it's called

rebolek

[08:27](#msg59aa6b74614889d475b1c48a)So object would have some function with predefined name that would be called automatically?

maximvl

[08:27](#msg59aa6b7f66c1c7c47708edd1)yep

rebolek

[08:28](#msg59aa6ba5bc46472974ea8daa)No, that's not possible.

maximvl

[08:28](#msg59aa6bba9acddb2407f4d4b9)why? I believe this is a super important feature

[08:29](#msg59aa6bd1ba0f0f6e380ba5ae)it allows you to switch between function and object worlds

rebolek

[08:29](#msg59aa6be0162adb6d2e5cc2d1)But function has its own context, so why not just call function?

maximvl

[08:29](#msg59aa6bf966c1c7c47708ef62)because then I can't make objects look like functions

[08:30](#msg59aa6c39bc46472974ea8f79)ok, let me give you an example

rebolek

[08:31](#msg59aa6c4dbc46472974ea8fab)

```
>> o: object [a: 1 b: 2 set 'f func [][a + b]]
== make object! [
    a: 1
    b: 2
]
>> f
== 3
```

maximvl

[08:31](#msg59aa6c6dc101bc4e3a80c9c7)I'm working on `curry` function which should allow one to bind arbitrary parameters of a function

[08:31](#msg59aa6c7e162adb6d2e5cc4b2)it's super easy to implement with objects because I can store the state and everything

[08:32](#msg59aa6c94162adb6d2e5cc4ea)but the result should be the same a a function, you should be able to call if afterwards

[08:32](#msg59aa6cb78f4427b462c4bd7a)otherwise you always have to check if you have a function - call function and if you have a carried object - call a function of this object

[08:33](#msg59aa6cbd210ac26920e8eb10)which is just stupid

rebolek

[08:33](#msg59aa6ce1ba0f0f6e380ba945)Hm... any code?

maximvl

[08:33](#msg59aa6ce5ba0f0f6e380ba949)I can create and return a new function, but then if you want to curry it again you have to go through all parsing process

[08:34](#msg59aa6d01c101bc4e3a80cb82)while if I would have an object I could just reuse it's state

[08:35](#msg59aa6d56ba0f0f6e380baa44)this is essential feature - to have a state which is useful for internal stuff and be able to behave as a function for users without breaking abstraction details

rebolek

[08:36](#msg59aa6d71b16f264642f9c6e0)I think you want closures.

maximvl

[08:36](#msg59aa6d7566c1c7c47708f49a)the code is in progress, but thinking about how and what should I do I found this issue

[08:36](#msg59aa6da3c101bc4e3a80ce48)how would a closure help?

rebolek

[08:37](#msg59aa6db6ee5c9a4c5f25c8b1)For storing state? Certainly.

maximvl

[08:37](#msg59aa6dd9ba0f0f6e380bac24)but the closure stores state inside the function, isn't it?

rebolek

[08:37](#msg59aa6de6162adb6d2e5ccbef)Right.

maximvl

[08:38](#msg59aa6def8f4427b462c4c117)so how do I access it from outside?

rebolek

[08:40](#msg59aa6e73162adb6d2e5ccef7)Hm, you can't.

[08:40](#msg59aa6e81ee5c9a4c5f25ccd7)But see my above example where I define function in an object.

[08:41](#msg59aa6e9eb16f264642f9cad1)You have access to both function and to the object that holds its internal state.

maximvl

[08:41](#msg59aa6ea8162adb6d2e5cd039)but I need only one thing

[08:42](#msg59aa6eeb9acddb2407f4df60)I can return only function and then look for object using `context?` or something, but this is too hacky

[08:43](#msg59aa6f1e8f4427b462c4c5c3)and there will be too many things which can go bad

[08:43](#msg59aa6f4b210ac26920e8f468)every dynamic language out there can do it

[08:44](#msg59aa6f578f4427b462c4c659)https://docs.python.org/3.4/reference/datamodel.html#object.\_\_call\__

rebolek

[08:44](#msg59aa6f5ab16f264642f9cca8)The problem with automatic call of a function in an object is that if you define that function, then you can't get whole object: `reduce [my-object 1 2]` &lt;- is this a call to `my-object/call` with args 1 and 2 or do I want to reduce object and two integers?

maximvl

[08:48](#msg59aa7052c101bc4e3a80da84)depends on if `my-object` has a `call` method

[08:48](#msg59aa7079bc46472974ea9e3e)and it accepts 0, 1 or 2 arguments

rebolek

[08:49](#msg59aa70a19acddb2407f4e50e)So if it has a `call` method, how do I override it and get whole object?

maximvl

[08:49](#msg59aa70b6c101bc4e3a80dc75)idk with `:my-object` ?

rebolek

[08:50](#msg59aa70f1162adb6d2e5cd817)Hm, that could be possible.

maximvl

[08:51](#msg59aa7105c101bc4e3a80dd80)btw in common lisp functions belong to the object system

[08:51](#msg59aa712cee5c9a4c5f25d62d)so it's super natural that you can extend function class and do wherether you want

[08:52](#msg59aa7138c101bc4e3a80de65)same in js

[08:54](#msg59aa71e2ee5c9a4c5f25d87c)smalltalk, IO and some others

rebolek

[08:55](#msg59aa72059acddb2407f4e92d)I see. I think this more a question for @dockimbel

dockimbel

[16:39](#msg59aadecd210ac26920ea95c0)@maximvl It's a natural feature in OO languages where functions derive from objects, so that's a no-go for languages which are not sharing those characteristics (like Redbol). JS \[doesn't seem](https://stackoverflow.com/questions/19335983/can-you-make-an-object-callable) to support such feature. What you really want is `closure!`.

rebolek

[22:45](#msg59ab347c9acddb2407f7b9b1)I'm encountering some strange bug in console on Linux in gtk branch (cannot confirm it yet on main branch), where after some time float math stops working. It returns zero. It's hard to reproduce, console must be running for some time.

greggirwin

[23:06](#msg59ab3971bc46472974ed9e67)&gt; I foresee a lot of problems with debugging having two things represented in the same way

&gt; because then I can't make objects look like functions

Life is confusing. :^) @maximvl, you've seen Doc's `specialize` func, right?

```
specialize: function [fun [function!] defs [block!]][
    spec: copy/deep spec-of :fun
    body: copy/deep body-of :fun

    foreach [arg value] defs [
        arg: to word! form arg
        pos: find spec arg
        remove/part pos pick [2 1] block? pos/2
        parse body rule: [some [change only arg value | into rule | skip]]
    ]
    func spec body
]
```

[23:07](#msg59ab39a7b16f264642fcb6ce)

```
>> foo: func [x y][x + y]
== func [x y][x + y]
>> bar: specialize :foo [x: 5]
== func [y][5 + y]
>> bar 10
== 15
>> baz: specialize :bar [y: 5]
== func [][5 + 5]
>> baz
== 10
```

## Sunday 3th September, 2017

maximvl

[11:51](#msg59abecb89acddb2407f9f23d)@greggirwin haha, good catch :D

[11:51](#msg59abecd9b16f264642fec366)I'll think about Dock's approach, thanks

9214

[12:21](#msg59abf3dc162adb6d2e61e524)@maximvl so, you want to implement `curry` function that gets another function with inner state, changes its state, and returns a new function, right?

[12:22](#msg59abf423210ac26920edf84d)and state is represented as some anonymous object which can be refferenced only with that function?

[12:27](#msg59abf5278f4427b462c9d9be)

```
text
context [foo: on bar: off set 'f func [/state] compose [if state [return (self)]]]
```

[12:28](#msg59abf550bac826f054762456)if called with `/state` refinement it spits out its internal state, otherwise performs some function

[12:28](#msg59abf563210ac26920edfc74)though I haven't checked if you can modify this state directly

[12:29](#msg59abf5b2bc46472974efda39)yay!

```
>> f/state
== make object! [
    foo: true
    bar: false
]
>> set in f/state 'foo 'poop
== poop
>> f/state
== make object! [
    foo: 'poop
    bar: false
]
```

luce80

[16:00](#msg59ac2715614889d475b7bc78)I thing `while` shouldn't return `unset`

```
n: 1 probe while [n < 3] [n: n + 1]
```

9214

[16:00](#msg59ac27309acddb2407facf36)@luce80 that's a known behavior for most iterators

luce80

[16:02](#msg59ac27afbc46472974f08ce9)loop, repeat, and until return last evalued value. forever returns `unset`if ends with break. Those are all correct.

9214

[16:03](#msg59ac27eeee5c9a4c5f2bb4a7)@luce80 https://github.com/red/red/issues/2873

greggirwin

[18:24](#msg59ac48f9c101bc4e3a871a82)@9214, @chrisrg often uses `use` in his R2 work to create an anonymous context that returns a function. No way to get at the internal state, unless you add it as a refinement, like you do. That's clever.

[18:25](#msg59ac4917614889d475b83fee)I've used a similar `/state` type trick for aggregator funcs.

9214

[18:26](#msg59ac494aba0f0f6e38121382)I think it could be nicer to create a custom constructor which will generate boilerplate of refinements depending on the spec

[18:27](#msg59ac4980ee5c9a4c5f2c392f)so instead of doing `set in blah blah` you can just call `foo/set-blah`

greggirwin

[18:27](#msg59ac499b614889d475b841b8)One of the interesting things here is that, with Red, we can not only `curry` things, but we can potentially `uncurry` them as well.

9214

[18:27](#msg59ac49a0614889d475b841c5)and that way we can simulate objects just like in mainstream languages I suppose?

greggirwin

[18:28](#msg59ac49c4b16f264642001536)Ultimately, it's about finding what various approaches let us express clearly.

9214

[18:28](#msg59ac49c98f4427b462cb1016)i.e. you have well-defined interface and no way to `probe` something, because it's anonymous

[18:28](#msg59ac49eaba0f0f6e381215fe)though you still can probe `self` in function's body :confused:

greggirwin

[18:29](#msg59ac49ec9acddb2407fb589c)Yes, we can absolutely do things like that.

## Tuesday 5th September, 2017

maximvl

[12:07](#msg59ae9399ba0f0f6e381b93d4)

```
>> read https://raw.githubusercontent.com/minimaxir/big-list-of-naughty-strings/master/blns.txt
*** Access Error: invalid UTF-8 encoding: #{EFBFBE0A}
*** Where: read
*** Stack:
```

[12:08](#msg59ae93a8bac826f05480e49e)https://github.com/minimaxir/big-list-of-naughty-strings

[12:08](#msg59ae93be8f4427b462d47b76)list of weird strings for testing unicode support

## Wednesday 6th September, 2017

geekyi

[01:05](#msg59af49e4bc46472974fe40a2)http://www.fileformat.info/info/unicode/char/fffe/index.htm

[01:05](#msg59af49ecc101bc4e3a940e5e)\[!\[image.png](https://files.gitter.im/red/bugs/uiUK/thumb/image.png)](https://files.gitter.im/red/bugs/uiUK/image.png)

[01:10](#msg59af4b1e210ac26920fc1d65)&gt; Unicode Data  
Name Noncharacter  
Block Specials  
Index entries Noncharacters  
Comments may be used to detect byte order by contrast with U+FEFF  
See Also zero width no-break space U+FEFF

[01:12](#msg59af4b6bb16f2646420d358c)https://www.wikiwand.com/en/Byte\_order\_mark#UTF-16:  
&gt; If an attempt is made to read this stream with the wrong endianess, the bytes will be swapped, thus delivering the character U+FFFE, \*which is defined by Unicode as a "non character" that should never appear in the text*

[01:17](#msg59af4ca6ba0f0f6e381f4acf)\*\*tl;dr\** it is a swapped UTF-16 byte-order mark (indicating the endian-ness has been reversed)

[02:08](#msg59af5886bc46472974fe7b43)Side note:  
https://github.com/minimaxir/big-list-of-naughty-strings/blob/master/blns.txt#L136  
Red accepts other `EFBF` characters, including the UTF-8 \[Byte order mark](https://www.wikiwand.com/en/Byte\_order\_mark#/Byte\_order\_marks\_by\_encoding) `EFBBBF`

```
a: read/binary https://raw.githubusercontent.com/minimaxir/big-list-of-naughty-strings/master/blns.txt
b: find a #{EFBFBE}
a1: take/part a2: copy a index? b
```

Also, it looks like it's the only character that gives an error in Red:

```
>> back back back back b         ; UTF-8 Byte order mark
== #{
EFBBBF0A...
>> to-string a1           ; before 
== {#^-Reserved Strings...
>> to-string at a2 3      ; after
== {^/^/#^-Unicode Symbols
```

## Thursday 7th September, 2017

xqlab

[08:39](#msg59b105d4b16f264642151335)Today I could not start red (gui-console), as my console-config.red file was corrupted. The content consisted of many NULLs.

## Friday 8th September, 2017

xqlab

[08:21](#msg59b252f2cfeed2eb65e555a9)console-config.red = console-cfg.red

PeterWAWood

[10:42](#msg59b274218f4427b462e6089d)Setting the width of a text field stops the height of the field being calculated. Is this a bug?

Script and Screenshots:

```
view [
	size 232x300
	across
        text "Font-Size 24"  font-size 24
	return
	text "Font-Size 24" 230 font-size 24
]
```

[10:43](#msg59b27437614889d475d3a530)\[!\[Windows.png](https://files.gitter.im/red/bugs/81ei/thumb/Windows.png)](https://files.gitter.im/red/bugs/81ei/Windows.png)

[10:43](#msg59b2744eee5c9a4c5f4760d3)\[!\[macOS.png](https://files.gitter.im/red/bugs/yXTM/thumb/macOS.png)](https://files.gitter.im/red/bugs/yXTM/macOS.png)

[10:48](#msg59b2757d66c1c7c4772a8c18)This is different from Rebol/View.

dockimbel

[10:56](#msg59b2776c8f4427b462e61901)@PeterWAWood Worth a ticket to improve such cases.

PeterWAWood

[12:10](#msg59b288b1bc464729740d0f74)#3020

## Tuesday 12nd September, 2017

luce80

[18:22](#msg59b825f3c101bc4e3abb10a4)this quits Red 0.6.3 on Win7:

```
view [base on-create [show face]]
```

## Wednesday 13th September, 2017

dockimbel

[04:09](#msg59b8af85cfeed2eb650178c0)@luce80 Please open a ticket for it.

maximvl

[17:33](#msg59b96bcec101bc4e3ac1dfe3)interesting `ask` behaviour:

```
>> ask "test> "
test> 
== "q"
```

[17:33](#msg59b96bd9cfeed2eb65058da7)what I did - pressed C-d

[17:33](#msg59b96be6177fb9fe7eb80c90)return value for some reason is "q"

[17:34](#msg59b96c0ebc464729742cdd02)which seems to be indistinguishable from typing "q"

9214

[18:35](#msg59b97a5ebc464729742d351a)`Ctrl-d` is a shortcut for typing `q` word, which halts the REPL

maximvl

[18:36](#msg59b97a9cbac826f054b365b0)maybe it's fine for repl, but how do I know if user wanted to enter just "q"

9214

[18:37](#msg59b97afccfeed2eb6505e7a4)yeah, `ask` should check for such key shortcuts before processing them

[18:41](#msg59b97bd9614889d475f3f338)same for `Ctrl-c` (returns `"q"`), `Ctrl-[` returns `"^["` and `Ctrl-m` returns `""`

[18:45](#msg59b97cb1210ac26920296a21)`Ctrl-3` is treated as `"^["` (escape?), `Ctrl-8` acts like backspace (dunno why I'm investigating this :D)

[18:49](#msg59b97dd6bac826f054b3784f)and only `Ctrl-<1 9 0>` puts actual digits, though it works for all of them with numpad

maximvl

[19:58](#msg59b98e02614889d475f46232)is there any way to call a saved `op!`?

```
>> a: #()
== #()
>> a/+: :+
== make op! [[
    "Returns the sum of the two values" 
    value1 [number! char! pair! tuple! vector! time!] 
    value2 [number! char! pair! tuple! vector! time!] 
    return: [...
>> 1 a/+ 2
== 2
```

[20:50](#msg59b99a0c177fb9fe7eb9268f)`to-block` somehow evaluates it's argument:

```
>> to-block "abc"
== [abc]
>> to-block "1"
== [1]
>> to-block "1/0"
*** Syntax Error: invalid integer! at "1/0"
*** Where: do
*** Stack: to-block
```

[20:59](#msg59b99c3a177fb9fe7eb933f6)shouldn't this collect `[a b c]`?

```
>> parse [a b c z] [ collect [ [keep skip] thru 'z ]]
== [a]
```

rebolek

[21:00](#msg59b99c8b319100804e301230)No, `keep skip` will keep `a` and `thru 'z` will go to end.

9214

[21:01](#msg59b99cb6177fb9fe7eb936ce)

```
text
>> parse [a b c z][collect keep to 'z]
== [[a b c]]
```

rebolek

[21:02](#msg59b99ccc177fb9fe7eb93705)

```
>> parse [a b c z] [ collect [ some [keep [not 'z skip]] thru 'z ]]
== [a b c]
```

[21:02](#msg59b99cde210ac269202a1ed0)@9214 yes, that's shorter :)

9214

[21:02](#msg59b99cefbac826f054b42817)though I don't get why `collect` returns nested blocks

rebolek

[21:03](#msg59b99d3abc464729742e0755)@9214 because `keep` in `parse` works as `keep/only`, see https://github.com/red/red/issues/2899

9214

[21:04](#msg59b99d4eb59d55b823f1fca1)@maximvl regarding `op!` - I bashed my head over this and IMO it's easier just to store their function counterparts

[21:05](#msg59b99d8c1081499f1f2a965a)

```
text
>> a: #()
== #()
>> a/+: :add
== make action! [[
    "Returns the sum of the two values" 
    value...
>> a/+ 1 2
== 3
```

maximvl

[21:06](#msg59b99ddf177fb9fe7eb93da8)@9214 hm, somehow I hoped `to` cares about left arg as well

[21:07](#msg59b99e02bac826f054b42d99)didn't know about `add` thanks :D

9214

[21:08](#msg59b99e53210ac269202a2752)and I hoped that this one would work

```
>> a/+: :+
== make op! [[
    "Returns the sum of the two values" 
    value1 [n...
>> do reduce [1 a/+ 2]
*** Internal Error: reserved for future use (or not yet implemented)
*** Where: do
*** Stack:
```

maximvl

[21:09](#msg59b99e8abac826f054b4319d)why doesn't this work?

```
>> parse "[1]" ["[" any skip "]"]
== false
```

rebolek

[21:10](#msg59b99eb4bc464729742e0ee9)Because `any` matches also nothing

9214

[21:10](#msg59b99eb61081499f1f2a9c33)I think because `any` is greedy, it matches `1]`

[21:10](#msg59b99eddbc464729742e0f8f)@maximvl why you're not in `help` room btw? :D

maximvl

[21:11](#msg59b99ef7177fb9fe7eb944a3)because I suspect those are bugs :D

9214

[21:11](#msg59b99f00bac826f054b435a8):shipit:

[21:12](#msg59b99f2b177fb9fe7eb94591)

```
text
>> parse [what ever really][any skip]
== true
```

[21:12](#msg59b99f54bac826f054b43837)iterators (i.e. `any` `some` and `while`) repeat rule maximum possible times

[21:13](#msg59b99f70bac826f054b43944)this means that in your example `any skip` skipped to the end of the series and `"]"` failed the match

## Thursday 14th September, 2017

dockimbel

[02:45](#msg59b9ed5abc464729742f733a)@maximvl  
&gt; `to-block` somehow evaluates it's argument:

No, it just applies a `load` on a string value, before wrapping it in a block. In your case above, you specified a non-loadable string.

[02:49](#msg59b9ee27bac826f054b59d95)@9214 @maximvl

```
>> ++: :a/+
>> ++ 1 2
== 3
```

[02:50](#msg59b9ee64b59d55b823f376c8)(typically a case that the compiler will not process correctly for now, so will require a `do [...]` wrapper for ensuring `++` is processed as a function call).

9214

[14:53](#msg59ba97f1177fb9fe7ebe44e9)congrats with 2k closed issues :bug: :sparkles:

dockimbel

[15:57](#msg59baa6e3c101bc4e3ac85a24)@9214 Thanks :+1: :fire: :smile:

dander

[19:20](#msg59bad68bcfeed2eb650d052e)looks like tab-completion on an unset word is causing a crash (or at least quits) in both consoles (I pressed tab after the /)

```
>> foo/*** Script Error: w1 needs a value
*** Where: set
*** Stack: ask red-complete-input red-complete-path
```

greggirwin

[19:53](#msg59bade38177fb9fe7ebfe635)Confirmed. Please file a ticket.

dander

[20:06](#msg59bae140614889d475fb5c44)opened red/red#3033

greggirwin

[20:11](#msg59bae25b177fb9fe7ebffcbe)Thanks @dander.

dander

[20:11](#msg59bae2847b7d98d30df6c364)thanks for repro :thumbsup:

## Saturday 16th September, 2017

luce80

[08:49](#msg59bce5aabc464729743e3470)Unimplemented feature:

```
>> first now/date
*** Script Error: first does not allow date! for its s argument
*** Where: first
*** Stack: first  

>> second now/date
*** Script Error: second does not allow date! for its s argument
*** Where: second
*** Stack: second
```

9214

[08:50](#msg59bce5f17b7d98d30d003bd8)@luce80

```
>> series? now/date
== false
```

luce80

[08:52](#msg59bce650614889d47504cf33)@9214

```
>> first now/time
== 10
```

9214

[08:53](#msg59bce67dbac826f054c47d19)hm, now this makes sense

maximvl

[08:53](#msg59bce68e7b7d98d30d003ef9)

```
>> help first
USAGE:
     FIRST s

DESCRIPTION: 
     Returns the first value in a series. 
     FIRST is a function! value.

ARGUMENTS:
     s            [series! tuple! pair! time!]
```

[08:53](#msg59bce695614889d47504d111)time! is there, but not date!

9214

[08:54](#msg59bce6c6614889d47504d1dd)but since ordinal path notation is allowed, i guess `first`, `second` and etc should accept `date!` too

luce80

[08:55](#msg59bce6e4cfeed2eb6516c75e)I wrote "unimplemented" ;) not "bug".

9214

[08:55](#msg59bce6fac101bc4e3ad2e4e7)but you wrote this in `red/bug` room :D

maximvl

[13:28](#msg59bd26e9cfeed2eb6517d443)is this a proper behaviour?

```
>> parse [1 2 3] [collect [keep collect any [keep number!]]]
== [[1 2 3] [1 2 3]]
```

9214

[13:28](#msg59bd27007b7d98d30d015622)@maximvl why do you think it's not?

maximvl

[13:29](#msg59bd27257b7d98d30d0156d7)I would say the second collect/keep should collect all three numbers

[13:29](#msg59bd2735614889d47505e5bf)and then the first collect/keep's argument should be a block

[13:29](#msg59bd273dcfeed2eb6517d5a8)and result should be `[[1 2 3]]`

[13:31](#msg59bd27bd7b7d98d30d015929)and I don't see how it would produce double block anyways

9214

[13:32](#msg59bd27d8210ac269203b2cc8)

```
text
>> parse [1 2 3] [collect keep any number!]
== [[1 2 3]]
```

maximvl

[13:34](#msg59bd28767b7d98d30d015e1b)I wonder if I can `keep` result of a `collect` in the same way

9214

[13:37](#msg59bd28fd614889d47505ed73)perhaps topmost `collect` collects both `keep collect ...` and `keep any number!` ?

maximvl

[13:37](#msg59bd2907bc464729743f50f7)looks like it

9214

[13:37](#msg59bd290f210ac269203b3314)it's the same `[1 2 3]` in both cases

maximvl

[13:37](#msg59bd2912cfeed2eb6517dcb6)

```
>> parse [1 2 3] [collect [keep collect [keep number!]]]
== [[1] 1]
```

[13:38](#msg59bd294dc101bc4e3ad3fb1e)well, first question - is that a bug? I'd like `keep` to affect the closest `collect` only, if possible

9214

[13:38](#msg59bd2959210ac269203b33be)could be considered as a feature though :)

maximvl

[13:38](#msg59bd295dcfeed2eb6517dd8f)because then one can nest them in any way

[13:40](#msg59bd29df7b7d98d30d016449)and the second question - if that's not possible, how do I go about parsing recursive structures?

[13:41](#msg59bd2a0c614889d47505f334)once a rule uses `collect/keep` - it can't be used recursively because of this behaviour

9214

[13:47](#msg59bd2b5cc101bc4e3ad4059f)@maximvl recursive - `ahead / into` combo?

maximvl

[13:49](#msg59bd2bd5210ac269203b3f97)yes, but how do I collect the data? :)

9214

[13:50](#msg59bd2c0f7b7d98d30d016d26)idk, `set`, `copy`, `collect set`, `collect into`

maximvl

[13:50](#msg59bd2c33cfeed2eb6517e875)I don't see a way to keep structure using these

[13:56](#msg59bd2d94177fb9fe7ecacb70)hm, I guess I need to make a stack of structures

rebolek

[13:58](#msg59bd2e1fc101bc4e3ad411f4)@maximvl `keep`/`collect` preserves structure

maximvl

[13:59](#msg59bd2e33cfeed2eb6517f2a5)@rebolek could you show me an example?

[14:00](#msg59bd2e70bc464729743f69fe)looks like I'm missing something

[14:01](#msg59bd2ed2c101bc4e3ad414eb)it actually feels like I asked this question before

rebolek

[14:02](#msg59bd2f02c101bc4e3ad41566)@maximvl I will try, wait a minute...

9214

[14:07](#msg59bd3004bac826f054c5b686)@maximvl bingo! :tada:

```
>> parse [1 2 3][collect [keep ahead collect any [keep number!]]]
== [[1 2 3]]
```

rebolek

[14:07](#msg59bd3021cfeed2eb6517f9a6)@maximvl `copy/deep` the parse way :godmode:

```
>> rule: [collect some [into rule | keep skip]]
== [collect some [into rule | keep skip]]
>> parse [a b [c d]] rule
== [a b [c d]]
```

9214

[14:07](#msg59bd3022210ac269203b51c3)so I'd say it's a rather nice feature

maximvl

[14:09](#msg59bd3087b59d55b823035332)@9214 @rebolek now I don't get why it works in your examples and doesn't work in mine

9214

[14:09](#msg59bd30ae177fb9fe7ecada21)`ahead` basically says "first match this rule before doing anything else"

[14:10](#msg59bd30c3c101bc4e3ad41c9b)after that `[1 2 3]` is collected

maximvl

[14:11](#msg59bd3118614889d475061307)`ahead` shouldn't adjust the input

rebolek

[14:12](#msg59bd3130210ac269203b54f3)It does not, it is basically `if`

9214

[14:12](#msg59bd3151210ac269203b5575)first collect any numbers into block, then collect this block

[14:12](#msg59bd31567b7d98d30d01839a)makes perfect sense to me

rebolek

[14:13](#msg59bd318c1081499f1f3bbc8f)

```
>> parse [a "b" #c 'd][collect some [ahead issue! keep skip | skip]]
== [#c]
```

maximvl

[14:13](#msg59bd3197177fb9fe7ecade27)but why `ahead` is needed there at all

[14:13](#msg59bd3199b59d55b8230358f8)I don't get it

[14:14](#msg59bd31adc101bc4e3ad42030)how is it different from `parse [1 2 3] [collect [keep collect any [keep number!]]]`

rebolek

[14:14](#msg59bd31b77b7d98d30d018570)@maximvl because `into` parse `series!` and `string!` is `series!` too.

maximvl

[14:15](#msg59bd321ab59d55b823035bb9)wait, wait my input is a string, I can't use `into`

rebolek

[14:16](#msg59bd322e614889d475061919)Ah :)

maximvl

[14:16](#msg59bd3236bc464729743f7b52)I'm trying to understand this `ahead` approach

rebolek

[14:17](#msg59bd3271bc464729743f7c18)`ahead` is like `if`, it matches some rule, but does not advance. If it matches, next rule is matched. If it does not, it backtracks.

maximvl

[14:18](#msg59bd329a614889d475061a9f)ok, let's start from the beginnig

[14:18](#msg59bd32aa210ac269203b5c1b)

```
>> parse [1 2 3] [collect [keep collect any [keep number!]]]
== [[1 2 3] [1 2 3]]
```

[14:18](#msg59bd32b2614889d475061b4a)why do I get two blocks here?

rebolek

[14:19](#msg59bd32f0bac826f054c5c2b7)because you do `collect/keep` twice

maximvl

[14:19](#msg59bd3303bac826f054c5c37d)but I collect numbers only once

9214

[14:19](#msg59bd3304cfeed2eb651806da)keep any numbers (innermost), then keep numbers again (topmost), then collect everything together

[14:23](#msg59bd33e0cfeed2eb65180ac4)and with `parse [1 2 3] [collect [keep ahead collect any [keep number!]]]` it's: keep any numbers (innermost), collect them, then keep collected numbers (topmost), then collect them

maximvl

[14:23](#msg59bd33f61081499f1f3bc8a3)does it mean that `collect` appends to the result automatically and I don't need to do it second time?

9214

[14:27](#msg59bd34b6210ac269203b6617)not sure what you mean

maximvl

[14:27](#msg59bd34bfbc464729743f867e)@rebolek is there any way to make this structure without `into`?

rebolek

[14:29](#msg59bd3537210ac269203b6849)@maximvl keeping your own stack

dockimbel

[16:17](#msg59bd4eb2c101bc4e3ad4ade6)@maximvl  
&gt; does it mean that `collect` appends to the result automatically and I don't need to do it second time?

Precisely, so the first `keep` is the cause of your troubles:

```
>> parse [1 2 3] [collect [collect any [keep number!]]]
== [[1 2 3]]
```

Actually, a single `collect` is enough there, unless you really want a nested block.

[16:21](#msg59bd4f83210ac269203be3d1)`collect` automatically appends to its parent `collect` and the root one returns the block as result. This auto-appending feature works only on "naked" `collect` (not followed by any optional keyword, like `set`, `into`, `after`). So, you can control for every `collect` where the resulting block will go, either let it flow to his parent, or redirect it somewhere else.

maximvl

[16:40](#msg59bd53f11081499f1f3c62f7)@dockimbel that's a good explanation, thanks!

[16:43](#msg59bd54a71081499f1f3c662b)now this one works even with nested structures :D

```
mal-map: [
         collect set tmp-series [ "{" any [not "}" mal-expression] "}" ]
         keep (to-map tmp-series)
      ]
```

[16:44](#msg59bd54dcb59d55b823040333)and one word is enough because it's being set only after sub-rule is done

[20:04](#msg59bd83e1bc4647297440ffe9)here's the code I have:

```
Red []

do %/home/max/projects/mal/red/mal-utils.red
probe "worked"
do probe to-file append system/options/path "mal-utils.red"
probe "worked 2"
```

[20:05](#msg59bd83ffcfeed2eb65197d9e)this is how I run it:

```
~/projects/mal/tests $ red ../red/step0_repl.red
"worked"
%/home/max/projects/mal/red/mal-utils.red
*** Access Error: cannot open: %/home/max/projects/mal/red/mal-utils.red/
*** Where: do
*** Stack: do-file change-dir cause-error
```

[20:06](#msg59bd843b7b7d98d30d0309ce)looks super strange that `do` works with the constant but fails with constructed one though it's exactly the same

greggirwin

[21:14](#msg59bd9423b59d55b82305230b)I see a trailing slash in the constructed `%/home/max/projects/mal/red/mal-utils.red/`.

[21:16](#msg59bd94b3210ac269203d2b60)Is `system/options/path` being modified by `append` the issue? i.e. `copy` it before the append.

maximvl

[21:54](#msg59bd9d9dcfeed2eb6519e850)@greggirwin it worked, that's something new to keep in mind, thanks :)

## Sunday 17th September, 2017

maximvl

[08:32](#msg59be3315bac826f054c9ee40)there is something wrong in specs return values:

```
>> spec-of :odd?
== [
    {Returns true if the number has a remainder of 1 when divided by 2} 
    number [number! char! time!] 
    return: [number! char! time!]
]
```

[08:32](#msg59be3321c101bc4e3ad85353)return should be `logic!`

dockimbel

[12:20](#msg59be6891c101bc4e3ad9314c)@maximvl Indeed, same for `even?`. You can post a PR to fix it.

maximvl

[12:21](#msg59be68d4614889d4750b20ee)@dockimbel will do, I did a search for all things which have "returns false/true" in their doc string

[12:21](#msg59be68e1cfeed2eb651cfe37)will check how many of them actually have logic type in return spec

[12:22](#msg59be68fdcfeed2eb651cfe94)but first tests for `hash!` :)

[12:56](#msg59be7118bac826f054caf111)things are quite bad with it:

```
>> h
== make hash! []
>> put h 1 2
== 2
>> h/1
== 1
>> h
== make hash! [1 2]
```

dockimbel

[12:58](#msg59be7190cfeed2eb651d23be)@maximvl That looks fine, you are doing an indexed access there, not a key lookup. Hashs are just blocks with fast lookups.

maximvl

[12:59](#msg59be71bd614889d4750b4844)okey %)

9214

[13:00](#msg59be71dec101bc4e3ad95661)@dockimbel bug/feature? (see discussion) :point\_right: https://gitter.im/red/help?at=59be3d9ebc4647297443e15a

maximvl

[13:01](#msg59be721ec101bc4e3ad956fd)@dockimbel should `make hash! [1 2 3 4]` and `make hash! [3 4 1 2]` be equal?

[13:08](#msg59be73cbcfeed2eb651d2e4d)my test constructs `make hash! [b 2 a 1 a 4]` using `put` only

[13:08](#msg59be73d2cfeed2eb651d2e72)I can't even reproduce it in the repl :D

[13:16](#msg59be75ab210ac2692040acb2)@dockimbel not sure what's going on, but github puts my new changes into the old PR

9214

[14:17](#msg59be83f91081499f1f415d3f)@maximvl same for me (tried to do 2 PRs yesterday)

dockimbel

[15:54](#msg59be9aa87b7d98d30d078031)@9214 Looks like a serious regression...we really need more unit tests for hash!.

[15:54](#msg59be9acb177fb9fe7ed0e5de)@maximvl No they should not, no more equal than `[1 2 3 4]` and `[3 4 1 2]`.

[15:55](#msg59be9b0d210ac26920415bc5)@maximvl I'm not a PR expert, I only did a few ones, but I think you need to make a new branch for a PR, to avoid new and unrelated commits to pile up in the PR. @qtxie might know better.

maximvl

[17:36](#msg59beb295210ac2692041cbc0)done

[17:38](#msg59beb3107b7d98d30d07f1bf)@dockimbel could you tell me anything about https://gitter.im/red/help?at=59bd9e90b59d55b82305527f ?

## Monday 18th September, 2017

dockimbel

[03:08](#msg59bf3896177fb9fe7ed3b51e)@maximvl It's the usual issue of trying to run an encapped Rebol binary from another app, just use a wrapper script: https://github.com/red/red/issues/543. Why do you need to run the Red toolchain from Python? If you need to run your Red script interpreted, just use the console binary which does not suffer from the limitation of the encapped Red toolchain binary.

9214

[10:52](#msg59bfa586cfeed2eb65229bfb)@maximvl ?

```
>> h: make hash! [1 a 2 b]
== make hash! [1 a 2 b]
>> find h 1
== make hash! [1 a 2 b]
>> find h 'a
== make hash! [a 2 b]
>> select h 1
== a
>> about
Red for Windows version 0.6.3 built 18-Sep-2017/15:48:26+05:00
```

maximvl

[11:24](#msg59bface8b59d55b8230e24d6)@dockimbel this is the way they run tests in MAL, python script sends input and verifies output

[11:25](#msg59bfad18b59d55b8230e25a5)will try with a helper script later

dockimbel

[11:25](#msg59bfad1a614889d4751109d0)@maximvl So you don't need to use the Red toolchain, the console binary is enough to run your script, right?

maximvl

[11:25](#msg59bfad311081499f1f46b698)what is `console binary` and what is `toolchain` ? :)

dockimbel

[11:27](#msg59bfadbd210ac2692046438d)@maximvl The `red.exe` you download from Red's web site is the toolchain, the console is precompiled on first run and put in a cache folder. To find the console binary: `list-dir system/options/cache`, then you can just make a copy of the latest console binary to your working folder, and use it to run your Red scripts interpreted.

endo64

[11:28](#msg59bfadc0bc464729744a93cd)`console binary` is the compiled binary usually under `%ProgramData%`: `C:\ProgramData\Red\console-2017-9-17-80805.exe`

[11:28](#msg59bfade8177fb9fe7ed5f807)Sorry, I interfere.

dockimbel

[11:29](#msg59bfae0e614889d475111014)@endo64 Not at all.

maximvl

[11:30](#msg59bfae4c614889d475111134)on linux I believe it's somewhere in ~/.red

[11:30](#msg59bfae66614889d4751111c3)@dockimbel isn't this something we can fix?

dockimbel

[11:31](#msg59bfae82bac826f054d0bc49)@maximvl What exactly do you mean by "something"?

maximvl

[11:31](#msg59bfae91c101bc4e3adf30e2)the issue in #543

[11:31](#msg59bfaea11081499f1f46be08)the fact that red binary fails to run under certain conditions

dockimbel

[11:32](#msg59bfaec1bc464729744a9ab2)@maximvl No, it's a limitation of the Rebol Encapper (Rebol/SDK), which is closed source. Once we ditch Rebol and run the toolchain on Red, that issue will disappear.

maximvl

[11:33](#msg59bfaeed7b7d98d30d0c7e96)ok, looking forward to self-hosting then :)

dockimbel

[11:35](#msg59bfaf6b210ac26920464c93)@maximvl There is still a mitigating measure we plan for that in 0.6.4, which is swapping the current roles of the toolchain and console. Currently the toolchain is `red.exe` and acts as the master, while the console is the slave. We should be able to reverse this relationship, and that will fix most of those cases, where the `red` binary is run by another app with redirected I/O.

maximvl

[11:39](#msg59bfb06bcfeed2eb6522d748)nice

9214

[23:03](#msg59c050d2614889d47514c7bb)looks like the following attempt to make a new reactive source from `reactor!` prototype with `is` "linkage" breaks entire reactive framework

```
>> r1: make reactor! [x: 1]
== make object! [
    x: 1
]
>> r2: make r1 [x: is [r1/x]]
*** Script Error: set-quiet does not allow set-word! for its word argument
*** Where: set-quiet
*** Stack:  

>> ;-- boom
>> what: make reactor! [ever: 'really]
== make object! [
    ever: 'really
]
>> nope: is [what/ever]
== really
>> what/ever: 'yeah
== yeah
>> nope
== really
```

[23:07](#msg59c05196210ac2692049df50)checked with every example from docs btw

[23:10](#msg59c0527e7b7d98d30d1024b7)and what I've tried to simulate is \[this](https://gitter.im/red/red?at=59c046ac7b7d98d30d0ff158) (seems like a worthy wish, no?)

## Tuesday 19th September, 2017

dockimbel

[03:20](#msg59c08d19b59d55b82312a49f)@9214 You can open a ticket for the first one. `is` is meant to work from inside a reactive object. The global context is not reactive. Use `react` for general reactions definition.

9214

[08:16](#msg59c0d265cfeed2eb652864eb)@dockimbel it's the combination of `make` and `: is [proto/]` that wreaks hawoc I believe. Not sure what you meant about global context and `react` though: second example works perfectly fine if I'd skip the first part.

[08:20](#msg59c0d341b59d55b82313b368)

```
text
>> what: make reactor! [ever: 'really]
== make object! [
    ever: 'really
]
>> nope: is [what/ever]
== really
>> what/ever: 'yeah
== yeah
>> nope
== yeah
```

[08:56](#msg59c0dbc57b7d98d30d124691)@dockimbel ah, you meant that I can do this instead?

```
>> r1: make reactor! [x: 1]
== make object! [
    x: 1
]
>> r2: make r1 []
== make object! [
    x: 1
]
>> react [r2/x: r1/x]
== [r2/x: r1/x]
>> r1/x: 100
== 100
>> r2/x
== 100
```

dockimbel

[09:06](#msg59c0de1ab59d55b82313eed7)@9214 Right, yes.

## Wednesday 20th September, 2017

Oldes

[08:10](#msg59c2228c1081499f1f522b88)Is this by design? In Rebol:

```
>> parse/all "abc" [#"a" copy x any #"x" to end] x
== none
```

In Red:

```
>> parse "abc" [#"a" copy x any #"x" to end] x
== ""
```

9214

[10:23](#msg59c241a2cfeed2eb652f2eb0)ok

```
view [
    base transparent 500x500 draw [
        pen red
        circle 250x250 100
    ]
]
```

[10:23](#msg59c241ad177fb9fe7ee2760b)\[!\[изображение.png](https://files.gitter.im/red/bugs/f9oh/thumb/\_\_\_\_\_\_\_\_\_\_\_.png)](https://files.gitter.im/red/bugs/f9oh/\_\_\_\_\_\_\_\_\_\_\_.png)

[10:24](#msg59c241cc614889d4751d7c70)not ok?

```
view [
    base transparent 500x500 draw [
        [pen red]
        circle 250x250 100
    ]
]
```

[10:24](#msg59c241d3b59d55b8231a8aca)\[!\[изображение.png](https://files.gitter.im/red/bugs/HWIA/thumb/\_\_\_\_\_\_\_\_\_\_\_.png)](https://files.gitter.im/red/bugs/HWIA/\_\_\_\_\_\_\_\_\_\_\_.png)

[10:25](#msg59c2420b210ac26920526aa2)per spec  
&gt; Inside Draw code, commands can be arbitrarily grouped using blocks. Semantics remain unchanged, this is currently just a syntactic sugar allowing easier group manipulations of commands.

dockimbel

[12:02](#msg59c258ebcfeed2eb652f9a8c)@Oldes Yes, `copy` in Parse will copy the input if the sub-rule succeeds (`any` always succeeds) and even if the input does not advance (you get `""` then). Same as in Rebol3. This makes `copy` more predictable.

Oldes

[12:03](#msg59c2591b1081499f1f531d66)Ok.. thanks... already modified my old R2 code.

dockimbel

[12:05](#msg59c25985cfeed2eb652f9e7a)@9214 That's a bug, yes. The result should be the same. ^--- @qtxie It seems the matrix is pushed when it shoudn't?

qtxie

[13:52](#msg59c27289210ac26920535629)Yes. It's a bug. Should be fixed now.

## Thursday 21st September, 2017

9214

[05:16](#msg59c34b1bc101bc4e3af03803)have some algorithmic class today and found this (fib sequence with memoization, yay):

```
fib: function [n [float!]][
    table: #(0.0 0.0 1.0 1.0)
    either table/:n [
        table/:n
    ][
        extend table reduce [
            n
            add fib n - 1 fib n - 2
        ]
    ]
]

repeat i 100 [fib to float! i]
t: select body-of :fib 'table

probe select t 78.0
probe select t 79.0
```

results in

```
8944394323791464.0
1.447233402467622e16
```

is that expected?

[05:19](#msg59c34bd91081499f1f576086)moreover in `table/:n` `n` is actually a `float!` value

PeterWAWood

[05:41](#msg59c35109210ac26920572966)@9214 Your results look correct. Why did you use a map and not a block?

[05:43](#msg59c35188c101bc4e3af04c6c)Here's a version using a block. I've had to adjust for F78 actually being the 79th number in the series as Fibonacci series start at 0. (Clearly Fibonacci would have been a C programmer :-))

```
fib: function [i [integer!]][
    table: [0.0 1.0]
    either table/:i [
        table/:i
    ][
        append table reduce [add to float! fib i - 1 to float! fib i - 2]
    ]
]

repeat i 100 [fib i]
t: select body-of :fib 'table
probe pick t 78 + 1     ;; adjust for 0 being considered F0
probe pick t 79 + 1
```

9214

[05:44](#msg59c351c1177fb9fe7ee76fc1)@PeterWAWood I just confused that it suddenly dropped down from very large number to `1.44`, floats are tricky :D

PeterWAWood

[05:46](#msg59c35220cfeed2eb653402bf)@9214 The second number is in scientific notation. Did you miss the `e16` at the end?

[05:46](#msg59c35241bc464729745c1740)Though I agree binary floats are tricky.

9214

[05:47](#msg59c35263bac826f054e1ea01)right, thanks!

[05:49](#msg59c352ee177fb9fe7ee774f9)@PeterWAWood regarding `map!` vs. `block!` - I think I want to check if it could be modified inside a function's body (as with `block!`s without `copy`)

PeterWAWood

[06:05](#msg59c356c1177fb9fe7ee78413)@9214 The one that's gone was wrong. Let me try again:

```
put table n add fib n - 1 fib n - 2
```

dockimbel

[06:14](#msg59c358b4c101bc4e3af06682)@9214 I sometimes use that memoization technic (usually with blocks) as local caches in functions. Very useful.

9214

[06:30](#msg59c35ca3b59d55b8231f89eb)@dockimbel I've wrote down some notes from my Cy D. Fect colleague about Red ;)

dockimbel

[06:33](#msg59c35d36614889d475227f4f)@9214 Sounds interesting. ;-)

9214

[07:22](#msg59c368c71081499f1f57cfb9)@dockimbel  
\* There's no way you're ready to write code, we're still downloading VStudio.  
\* Is that some new Lisp or what?  
\* What do you mean by "memoization for free"? What do you mean by "because function can modify itself"... wait, self-modifying code?! You didn't tell me you're \*that* experienced.  
\* I hate this function pointers juggling then it comes to implementing HOFs (he didn't actually know that it's called HOF)... why you're chuckling?  
\* I think you're cheating - we still can't debug our factorial example.  
\* Now, implement fib sequence for negative numbers... no mister, you can't just `pick [- +] negative? n` like that, you should rewrite everything using `if/else` and... stop chuckling!

[07:41](#msg59c36d46177fb9fe7ee7e901)perhaps I should've used R/S to be on equal footing

dockimbel

[09:02](#msg59c3803d210ac2692057f290)@9214 Hahaha, thanks for sharing. ;-) :+1:

greggirwin

[18:29](#msg59c404fccfeed2eb65376736)@9214, you are a true Reducer. :^)

9214

[18:33](#msg59c405e5bac826f054e578b7):guardsman: yissir

## Sunday 24th September, 2017

9214

[17:32](#msg59c7ec28cfeed2eb6545ff80)@dockimbel in Draw dialect, \[`scale`](https://doc.red-lang.org/en/draw.html#\_scale) accepts two `number!` arguments, but chokes up on `percent!`, though

```
>> number!
== make typeset! [integer! float! percent!]
```

I bet it's a bug

## Monday 25th September, 2017

dockimbel

[03:29](#msg59c87835177fb9fe7efbc4a0)@9214 Feature not implemented, though I guess that would be nice to support too.

9214

[07:50](#msg59c8b52dc101bc4e3a052174)@dockimbel should I make a wish or is it already on your list somewhere?

dockimbel

[07:50](#msg59c8b54cc101bc4e3a0521c1)You can open a ticket for it, though, I'm not sure when it will be implemented.

9214

[07:51](#msg59c8b58dbc46472974714a9f)it's just that documentation is a little bit misleading

[07:52](#msg59c8b5b4210ac269206bb480)should be `integer! float!` instead

dockimbel

[07:52](#msg59c8b5ba177fb9fe7efc9d3d)I think the issue arised when we moved `percent!` into the `number!` typeset. Though in this case, having support for percents would be nice to have anyway.

9214

[07:58](#msg59c8b73ac101bc4e3a052970)`number!` is used only for `scale` and `matrix`, I quickly checked `matrix` and it seems to support `percent!`

## Tuesday 26th September, 2017

PeterWAWood

[01:52](#msg59c9b2f9bc464729747624f3)I am getting instances of the Red console "freezing" on macOS when it is built with `Needs: View`.

Starting the console in the Terminal results in a window-less "View" app appearing in the dock (in addition to the terminal).

If you then hide the Terminal app (CMD+h), the "View" app freezes.

When you force-quit the "View" app, the Red console in the Terminal is terminated:

```
mbp:red peter$ ./macView
--== Red 0.6.3 ==-- 
Type HELP for starting information. 

>> Terminated: 15
```

[01:54](#msg59c9b371177fb9fe7e0185fa)Should a "View" app be launched before `View` is called or is that a bug?

[02:12](#msg59c9b791cfeed2eb654dbaa6)A window produced with `view/no-wait [panel 300x300]` responds differently to mouse actions between Windows and macOS. On both systems, it can be dragged around the screen. On Windows, it can be minimised and closed using the window buttons. On macOS, clicking on the minimise and close window buttons resulting in a spinning beach ball.

dockimbel

[02:46](#msg59c9bf99b59d55b82339265a)@PeterWAWood Is that a recent regression (like since a few days), or older behavior?

[02:46](#msg59c9bf9f32fc8b7e403ddd5a)@qtxie ^---

PeterWAWood

[02:53](#msg59c9c12dcfeed2eb654dd9b4)@dockimbel I think the freezing is more than a few days, Bolek mentioned it a while ago. I don't know about the `/no-wait` difference as I only tried that today.

[02:59](#msg59c9c28b210ac269207096cb)Also on macOS, a window created with `view/no-wait` does not respond to `unview`.

[02:59](#msg59c9c2a6bc46472974765bb5)\[!\[Unview Issue.png](https://files.gitter.im/red/bugs/YNdL/thumb/Unview-Issue.png)](https://files.gitter.im/red/bugs/YNdL/Unview-Issue.png)

dockimbel

[03:41](#msg59c9cc86614889d4753c5858)Worth a ticket.

PeterWAWood

[04:20](#msg59c9d59bb59d55b823397362)#3057

qtxie

[06:26](#msg59c9f32ab59d55b82339de3e)You mean the red console freezing or a red program built with `Needs: View` freezing ?

rebolek

[06:41](#msg59c9f684177fb9fe7e0278d8)Red console.

9214

[23:14](#msg59cadf64177fb9fe7e07c2df)looks like an interesting feature, but my spider sense is tingling

```
>> [<tag>]
== [<tag>]
>> [< not tag >]
== [< not tag >]
>> type? first [<. not tag? >]
== tag!
>> <. not tag? >
== <. not tag? >
>> < what >
*** Script Error: < operator is missing an argument
*** Where: catch
*** Stack:  

>> <| okay that's interesting |>
== <| okay that's interesting |>
```

## Wednesday 27th September, 2017

dockimbel

[03:11](#msg59cb16f1177fb9fe7e08af8f)@9214 `<` followed by a whitespace will parse as a word. If you put anything else, it should parse as a tag (if you provide a closing `>`).

[03:12](#msg59cb1708177fb9fe7e08afb5)

```
lisp
>> < what >
*** Script Error: < operator is missing an argument
*** Where: catch
*** Stack: 
>> [< what >]
== [< what >]
>> length? [< what >]
== 3
>> length? [<this is a tag >]
== 1
```

9214

[08:31](#msg59cb61eb177fb9fe7e0a1990)@dockimbel thanks, I thought that spaces are not allowed in tags

dockimbel

[08:55](#msg59cb6786614889d47544c7f3)@9214 They are allowed, just not right after the opening `<` character.

rebolek

[08:58](#msg59cb681d32fc8b7e40462434)@9214 If spaces were not allowed, this would be impossible:

[greggirwin](http://www.server.com)

[](http://www.server.com)

[](http://www.server.com)[17:53](#msg59cbe588bac826f054077cad)I just think of tags as a string with different brackets. The leading space being the special condition that applies to them.

## Thursday 28th September, 2017

9214

[04:36](#msg59cc7c45f7299e8f537f986b)

```
text
also violate! violate!: does [violate!]
```

```
*** Runtime Error 1: access violation
*** at: 00460102h
```

dockimbel

[04:58](#msg59cc818fbac826f0540a655a)@9214 Crash -&gt; ticket. ;-)

9214

[11:27](#msg59ccdc93bac826f0540c323a)snippet is misleading though, `violate!` was already defined before `also` is used (idk why I used it)

[12:30](#msg59cceb78b59d55b82349de59)?

```
do also 'violate! violate: does [violate!]
```

toomasv

[13:11](#msg59ccf5097b7d98d30d48d05c)Is this a bug? `wheel`-event and `down`-event occur in same spot but values are different (Win10):

```
>> view [base 100x100 on-wheel [probe compose [wheel: (event/offset)]] on-down [probe compose [down: (event/offset)]]]
[wheel: 960x559]
[down: 47x43]
```

meijeru

[15:39](#msg59cd179fcfeed2eb655fb9d9)Looks like `on-wheel` gives the offset w.r.t. upper left corner of entire screen (absolute coordinates) while `on-down` gives the offset w.r.t the window, as it should.

toomasv

[15:44](#msg59cd18d3614889d4754e136a)@meijeru Looks so indeed! Thanks for explanation!

meijeru

[17:28](#msg59cd3157177fb9fe7e144913)It is still the question, if this is a bug or a feature :worried:

toomasv

[19:12](#msg59cd4985f7299e8f53841798)@meijeru At least I can proceed now. Actually I am extreemly proud \[having solved scaling by wheel problem](https://github.com/toomasv/l-system). :angel:

dander

[19:25](#msg59cd4cbfcfeed2eb65610d89)@toomasv that's really nice! I imagine the same algorithm will be useful in many places :thumbsup:  
I did notice that I can drag the image at the start, but after scrolling, the image doesn't refresh after dragging

toomasv

[19:26](#msg59cd4ce8b20c6424299b9c82)@dander Yes, dealing with that.

9214

[19:41](#msg59cd506b7b7d98d30d4b0f78)@dockimbel

```
>> make reactor! [probe words-of self]
[on-change*]
== make object! [
]
>> make object! [probe words-of self]
[]
== make object! []
```

Is that intended?

Also, do I understand correctly that `reactor!` isn't a separate datatype but a shortcut of some sort?

```
>> foo: func [x [reactor!]][]
*** Script Error: invalid type specifier: reactor!
*** Where: func
*** Stack:
```

greggirwin

[19:45](#msg59cd515eb59d55b8234c5433)&gt; Also, do I understand correctly that reactor! isn't a separate datatype but a shortcut of some sort?

Correct. They're just objects with `on-change/on-deep-change` callback funcs.

[19:50](#msg59cd526ff7299e8f5384497f)The object datatype has special handling for those funcs, when molding an object. Use `mold/all` to see them.

9214

[19:50](#msg59cd52a2b59d55b8234c5a53)@greggirwin it's just that I didn't expected to see some hidden stuff in `words-of` block, because it's, ehm, hidden

greggirwin

[19:53](#msg59cd5353cfeed2eb65612fa4)That is a good question. We don't have a way to get them, as with `mold`, because reflector funcs don't (currently) have refinements. If they're hidden via reflection, then there's no way to find them.

9214

[20:11](#msg59cd5759177fb9fe7e153842)@greggirwin I guess dedicated "reveal all" refinement is a good option, because this gave me \[a lot of headache](https://github.com/9214/linden/blob/master/src/dol.red#L37) recently

maximvl

[21:00](#msg59cd62fe7b7d98d30d4b7cb2)is this a bug?

```
>> parse z: [] [x: (insert x 'a) y: skip]
== true
>> parse z: [] [x: (insert x 'a) y: 'a end]
== false
>> x
== [a]
>> y
== [a]
```

[21:01](#msg59cd63137b7d98d30d4b7ced)inserting into the source and then trying to match it fails, while `skip` works

9214

[21:04](#msg59cd63e2b20c6424299c263e)@maximvl `insert` continues match \*after* the insertion

```
>> parse z: [] [x: insert 'a]
== true
>> z
== ['a]
```

maximvl

[21:05](#msg59cd6407b59d55b8234cbe7e)but i'm not using `insert` keyword

9214

[21:05](#msg59cd6413b20c6424299c273f)@maximvl oh, my bad

maximvl

[21:05](#msg59cd641fb20c6424299c27ae)I didn't even know it exists :D

[21:07](#msg59cd6495cfeed2eb656193ac)@9214 still

```
>> parse z: [] [x: insert 'a :x 'a]
== false
```

9214

[21:08](#msg59cd64b7210ac2692083fe2a)@maximvl though `a` is inserted in `z`

maximvl

[21:08](#msg59cd64c9210ac2692083fea6)yes, then I backtrack the position and trying to parse it

9214

[21:21](#msg59cd67bcb20c6424299c3e0f)

```
text
>> parse z: [] [x: (insert x 'a) :x thru 'a]
== true
```

## Friday 29th September, 2017

dockimbel

[07:31](#msg59cdf6cef7299e8f53874eea)@maximvl That's a bug, though it need to retest with latest commit...

[07:43](#msg59cdf98d32fc8b7e40538fbd)Confirmed bug.

[08:06](#msg59cdfef57b7d98d30d4e406c)I'm opening a ticket for it: https://github.com/red/red/issues/3060

[08:26](#msg59ce03c4177fb9fe7e1863e9)@9214 I should add something about reactor's `mold` specific behavior in the docs.

toomasv

[08:32](#msg59ce051c177fb9fe7e186b5a):point\_up: \[September 28, 2017 10:25 PM](https://gitter.im/red/bugs?at=59cd4cbfcfeed2eb65610d89) @dander \[Corrected](https://github.com/toomasv/l-system/blob/master/l-system.red) Seems to work fine.

PeterWAWood

[11:35](#msg59ce2fee7b7d98d30d4f4c0b)This behaviour looks inconsistent:

```
>> t: 1.2.3.4.5.6
== 1.2.3.4.5.6
>> make tuple! [1 2 3 4 5.8 6 7]
== 1.2.3.4.5.6.7
>> t/5: 5.8
== 5.8
>> t
== 1.2.3.4.255.6
```

9214

[11:40](#msg59ce3145b20c642429a00ce6)

```
text
>> x: 1.2.3
== 1.2.3
>> x/3: 3.2
== 3.2
>> x
== 1.2.0
>> x/3: 3.3
== 3.3
>> x
== 1.2.255
```

maximvl

[12:11](#msg59ce3856b59d55b82350c642)on Wine Red can't do networking:

```
>> do https://tinyurl.com/y9azl975
*** Access Error: cannot connect: https://tinyurl.com/y9azl975 reason: timeout
*** Where: read
*** Stack: do-file
>> read http://google.com
*** Access Error: cannot connect: http://google.com reason: timeout
*** Where: read
*** Stack:
```

[12:11](#msg59ce386d614889d47553dcc1)these are messages from Wine:

```
fixme:winhttp:winhttp_request_QueryInterface interface {06f29373-5c5a-4b54-b025-6ef1bf8abf0e} not implemented
fixme:ole:CoCreateInstanceEx no instance created for interface {06f29373-5c5a-4b54-b025-6ef1bf8abf0e} of class {2087c2f4-2cef-4953-a8ab-66779b670495}, hres is 0x80004002
fixme:winhttp:winhttp_request_QueryInterface interface {06f29373-5c5a-4b54-b025-6ef1bf8abf0e} not implemented
fixme:ole:CoCreateInstanceEx no instance created for interface {06f29373-5c5a-4b54-b025-6ef1bf8abf0e} of class {2087c2f4-2cef-4953-a8ab-66779b670495}, hres is 0x80004002
fixme:winhttp:winhttp_request_QueryInterface interface {06f29373-5c5a-4b54-b025-6ef1bf8abf0e} not implemented
fixme:ole:CoCreateInstanceEx no instance created for interface {06f29373-5c5a-4b54-b025-6ef1bf8abf0e} of class {2087c2f4-2cef-4953-a8ab-66779b670495}, hres is 0x80004002
```

9214

[19:15](#msg59ce9be432fc8b7e405756f3)can anyone with macOS check this? :point\_right: https://gitter.im/red/red/system?at=59ce9b0ab20c642429a2b391

[19:16](#msg59ce9bfcb59d55b823533812)\[code to check](https://gitter.im/red/red/system?at=59ce98e5614889d47556300f)

## Saturday 30th September, 2017

maximvl

[08:31](#msg59cf5649bac826f05419071e)and this one as well, it hangs right after spawning a window: `do https://tinyurl.com/y9azl975`

dockimbel

[09:52](#msg59cf6941cfeed2eb656b6347)@qtxie ^---

## Sunday 1st October, 2017

9214

[09:14](#msg59d0b20ef7299e8f5393b9e8)why `op!` doesn't allow to pass unevaluated operators?

```
>> bar: make op! func ['left 'right][]
== make op! [['left 'right]]
>> foo bar baz
*** Script Error: foo has no value
*** Where: bar
*** Stack:
```

dockimbel

[11:05](#msg59d0cbf3c171ee8b299d6df6)@9214 Not implemented yet, that would requires significant changes in the way infix are processed. Though, it's on my todo-list, just very low priority for now.

9214

[11:16](#msg59d0ce8b210ac26920935462)@dockimbel I'm curious, will function specs support flags/options like `infix` `postfix` `prefix`?

dockimbel

[11:23](#msg59d0d01b614889d4755f53ed)@9214 Probably not, as it changes the way arguments are fetched and maybe even how the Red internal stack should work, so it would probably be better to use new datatypes instead. But, I don't see a need for such features for now, if you need them, you can write a custom interpreter and make it a dialect.

9214

[21:13](#msg59d15a65b20c642429ae6771)@dockimbel \[The mother of bugs](https://github.com/9214/daruma) just gave birth to another amusing creature :beetle:  
I have macro defined on \[line 50](https://github.com/9214/daruma/blob/master/src/decoder.red#L50), but then I try to interpret this script:

```
*** Script Error: make-bge-base64 has no value
*** Where: encoding
*** Stack: context context
```

But hey, I know the drill - if I wrap all script into `do/expand [...]` block, it works (in fact it gives another error, but that's expected). Any ideas? I believe it worked roughly 2 weeks ago without a fuss.

[23:13](#msg59d17696614889d475624b68)and I think this is unexpected

```
>> parse [set-word:] [quote set-word:]
== true
>> parse [set-word:] [quote set-word]
== true
>> parse [set-word:] [quote :set-word]
== true
>> parse [set-word:] [quote :set-word]
```

[23:36](#msg59d17be0bbbf9f1a380e9958)I know that `ahead set-word! quote set-word` will do, but still

[23:46](#msg59d17e58b59d55b8235f3eff)I also encountered 2 more bugs:  
\* after defining new macro compiled exe is a dead corpse and Wine gives me runtime error

```
*** Runtime Error err:seh:raise_exception Unhandled exception code c0000005 flags 0 addr 0x4161e6
```

I'll try to test it on Win10 machine in the daytime and report back.  
\* again, after defining new macro attempt on script compilation results in a massive text wall of Red compiler internal error, which boils down to the fact that macro is pattern-matching and uses `ahead`, and boom:

```
*** Red Compiler Internal Error: Script Error : ahead has no value 
*** Where: expand 
*** Near:  [parse code rule: [
```

## Monday 2nd October, 2017

greggirwin

[03:15](#msg59d1af53f7299e8f5397f5bd)@9214, you have to be pushing macros harder than anyone. :^)

dockimbel

[03:34](#msg59d1b3c5614889d475632d94)@9214 Remember that compiler's macros run on Rebol2, which does not have `ahead` in his Parse dialect.

[03:35](#msg59d1b410177fb9fe7e290b85)For the loose matching of any-words in Parse, it's a side-effect of fixing a bug in Parse a few days ago. I will see if this can be improved.

9214

[06:57](#msg59d1e368b59d55b82360cb2d)@dockimbel thanks, figured out `ahead` already, no clue regarding `make-bge-base64` and bugged executable is dead, just checked on Win10

[06:59](#msg59d1e3ddbbbf9f1a38102c08)should I fill a ticket addressing loose matching or is it already on your list?

[07:17](#msg59d1e7f87f323fc375f7341a)@dockimbel could you also share your vision of macro system and how it can be improved? Two things come to mind:  
\* Named macro and functions in execution context are just like any other function and should be first-class citizens. Say, if I have `inc: func [x][x + 1]` and I want to build macro from that function or make it usable from macro, I should copypaste it either inside `#do [...]` or in `#macro inc: ...` directive, but it would be nice if I could just set some flag in \*that* function (e.g. `inc: func [[macro] x][x + 1]` instead of copypasting everything by hand. I have no idea how Red could distinguish between between macro call and function call though :D Also, I whish I could separate my macros (and execution context) in dedicated file(s) and just `#include` it anythere I need them instead of copypasting their definitions (and `#do [...]` context).  
\* Dependency of compiler's macros on R2 is something to be constantly aware of, otherwise you'll get your post-compiling bugs and sleepless mumbo-jumbo with debugging and stuff. And while it's possible to hack your way around with named macro, pattern matching macro are limited with R2 `parse` implementation.

[07:20](#msg59d1e8aebac826f05423b05e)@greggirwin call me \[3 `#`](http://wiki.c2.com/?ThreeStarProgrammer) programmer :^)

dockimbel

[07:55](#msg59d1f0dc177fb9fe7e2a11f6)@9214  
&gt; should I fill a ticket addressing loose matching or is it already on your list?

No need.

greggirwin

[17:39](#msg59d279c0b20c642429b40702)@9214 :^) How about "all-star" programer?

## Tuesday 3th October, 2017

9214

[15:37](#msg59d3aeac210ac26920a16732)@dockimbel and R2 `parse` doesn't have`collect/keep` keywords either? This could explain why compiled exe is dead, though, why it didn't spit compiler internal error as with `ahead` in this case?

## Wednesday 4th October, 2017

dockimbel

[07:26](#msg59d48d3c01110b723174e427)@9214 Rebol's Parse does not have `collect/keep` support, yes. If you can make a short version that reproduces the crash, you can put it in a new ticket for investigation.

9214

[11:37](#msg59d4c817614889d475736faa)@dockimbel done https://github.com/red/red/issues/3069

[12:04](#msg59d4ce64bac826f0543367d0)

```
text
Red []

#macro answer: func [][42]
a: answer
```

```
>> do %scratchpad.red
*** Script Error: answer has no value
*** Where: a
*** Stack:
```

[12:07](#msg59d4cf10177fb9fe7e39b92a)

```
text
Red []

do/expand [
    #macro answer: func [][42]
    c: answer
]
```

```
>> do %scratchpad.red
== 42
```

Again, I'm pretty confident that 2 weeks ago it just worked without `do/expand` wrapping

dockimbel

[12:18](#msg59d4d1afbac826f054337cd1)@9214 If you can find the commit which is causing the regression, that would be helpful.

9214

[12:19](#msg59d4d1e2177fb9fe7e39c9af)@dockimbel will do whatever I can :baby:

[12:32](#msg59d4d4c47f323fc37506e290)On a first sight, the only commit somehow related to preprocessor is \[this](https://github.com/red/red/commit/5d11266de100b9b6a9d37c2f5b967dc6d4179994), 22 days ago.

[12:44](#msg59d4d79fbbbf9f1a381fb042)though, compiling toolchain with this changes reverted ain't do the trick

[12:46](#msg59d4d808b20c642429c065b4)the thing is - this issue somehow magically disappeared when I reported #3069, I was able to interpret script with F6 hotkey from VSCode, but not to compile

[12:49](#msg59d4d8d2b20c642429c06aae)Uh-uh..?

```
>> do %scratchpad.red
*** Script Error: answer has no value
*** Where: a
*** Stack: do-file  

>> do load %scratchpad.red
== 42
>> do %scratchpad.red
== 42
```

dockimbel

[12:51](#msg59d4d959210ac26920a770b1)The last one is not significative as the macro is already loaded.

[12:52](#msg59d4d976f7299e8f53a8bf22)`do` on file! will call internally \[this high-level function](https://github.com/red/red/blob/master/environment/functions.red#L835). As you can see on line 840, it calls `expand-directives` on the loaded file.

9214

[12:58](#msg59d4db11bac826f05433b5d1)

```
text
>> do expand-directives load {#macro answer: func [][42] a: answer}
*** Script Error: answer has no value
*** Where: answer
*** Stack:
```

[13:01](#msg59d4db97b59d55b82370ae8e)

```
text
>> do/expand load {#macro answer: func [][42] a: answer}
== 42
```

dockimbel

[13:04](#msg59d4dc4b614889d47573e8ec)@9214 Looks like something is broken in `expand-directives`.

9214

[13:05](#msg59d4dc97177fb9fe7e3a0816)@dockimbel uses \[`expand`](https://github.com/red/red/blob/master/utils/preprocessor.r#L271)

[13:11](#msg59d4de1e7f323fc375071b3d)since macro directive is successfully \[removed](https://github.com/red/red/blob/master/utils/preprocessor.r#L354) from loaded source, I suspect that \[`register-macro`](https://github.com/red/red/blob/master/utils/preprocessor.r#L353) goes nuts and doesn't register `answer` as a macro?

dockimbel

[13:23](#msg59d4e0d8210ac26920a7a185)@9214 The macro is present, just not applied:

```
>> preprocessor/macros
== ['answer 
    (change/part s do-macro 'answer s 0 1) :s
]
```

9214

[13:30](#msg59d4e288210ac26920a7acec)so `do-macro` is guilty?

[13:30](#msg59d4e293bbbf9f1a381ff3dd)@9214 how deep the rabbit hole goes? :rabbit:

[13:53](#msg59d4e7dfbbbf9f1a38201649)or perhaps it has something to do with loose `parse` matching of any-words?

dockimbel

[16:14](#msg59d508f2bac826f05434dd1b)@9214 Pinpointing the exact cause will take some time, as the preprocessor's code is using many different features with some hairy code. I will dig into it tomorrow.

9214

[16:19](#msg59d50a28f7299e8f53a9fa92)@dockimbel :+1:

dander

[18:33](#msg59d5297f210ac26920a96e48)I don't know if this is really considered a bug, but I think it's a bit confusing that `about` displays the build date of the cached console executable, rather than the date that red.exe was built. Is there a rationale for doing that? For example, from different runs of Red.exe located in my Downloads folder after clearing the cache:

```
>> about
Red for Windows version 0.6.3 built 29-Sep-2017/13:51:12-07:00
>> system/options/boot
== "C:\ProgramData\Red\gui-console-2017-8-3-49893.exe"

>> about
Red for Windows version 0.6.3 built 4-Oct-2017/11:24:09-07:00
>> system/options/boot
== "C:\ProgramData\Red\gui-console-2017-8-3-49893.exe"
```

## Thursday 5th October, 2017

dockimbel

[01:17](#msg59d58813bbbf9f1a3823972f)@dander Agreed, that needs to be improved to include the toolchain build date too. I would also like to have the commit hash included, though I'm not sure if there is a simple way to extract it from the git repo.

dander

[03:27](#msg59d5a6c0177fb9fe7e3e4a66)@dockimbel here are some potential options if you want to call git directly. Or would it be better to mine it out of one of the git text files? I'm willing to dig deeper if you want to be more specific.

```
>git log -n 1
commit 87e85d10a78c4aeb1e2bdc77de4c4c402a02f7c7
Author: Nenad Rakocevic <nr@red-lang.org>
Date:   Wed Oct 4 21:20:58 2017 +0800

    FIX: minor fix in the compilation output display.

>git describe
v0.6.3-235-g87e85d1

>git log -n 1 --pretty=format:%h
87e85d1
```

9214

[03:30](#msg59d5a772177fb9fe7e3e4d85)&gt; simple way to extract it from the git repo

\[this](https://github.com/rebolek/red-tools/blob/master/github-v3.red) and \[that](http://www.red-lang.org/2013/11/041-introducing-parse.html)? :grimacing:

dander

[03:40](#msg59d5a996b20c642429c4d61f)@9214 ooh, nice!  
also this?

```
>> call/output "git log -n 1 --pretty=format:^"[short: {%h} long: {%H} date: %aI]^"" :out commit: load out
== [short: "87e85d1" long: "87e85d10a78c4aeb1e2bdc77de4c4c402a02f7c7" date: 4-Oct-2017/21:20:58+08:00]
```

dockimbel

[05:14](#msg59d5bfad210ac26920ac1d63)@9214 @dander Thanks! Extracting the information the git text files would be a simpler option, and as a fallback, scraping it from github website or API.

dander

[08:16](#msg59d5ea6db59d55b823761bbf)@dockimbel I think this should work

```
git-commit?: function [
    "Gets the latest (HEAD) commit hash from the current git repo"
][
    path: system/options/path
    ; look for the root of the git repo
    while [not exists? dirize path/.git][
        path: clean-path path/..
        if not exists? path [cause-error 'user 'message ["Could not find .git directory; this does not appear to be a Git repository"]]
    ]
    ; HEAD will either contain the hash of the latest commit (detached head) or a reference to the current branch file which contains it.
    ; i.e: "ref: refs/heads/master" which indicates the hash is in .git/refs/heads/master
    head: read path/.git/HEAD
    if find head "ref:" [
        ref: load head
        head: read path/.git/(ref/ref)
    ]
    trim/lines head
]
```

dockimbel

[08:19](#msg59d5eb22b59d55b823761eea)@dander :+1: I will give it a try later today.

[09:04](#msg59d5f592614889d47579aa92)@9214 It seems my fix for #3029 is the cause of the preprocessor's parsing going mad.

[09:39](#msg59d5fdb9177fb9fe7e3fe49c)Nope, finally the culprit was #3060.

9214

[11:58](#msg59d61e48177fb9fe7e40962e)@dockimbel thanks! will check later

[12:13](#msg59d621ec614889d4757a9ac3)indeed, the mother of bugs is pleased with your offering :beetle: :womans\_hat:

dockimbel

[12:14](#msg59d62215b59d55b823774e3e)@9214 I wouldn't dare to displease her. ;-)

## Friday 6th October, 2017

PeterWAWood

[08:57](#msg59d7456b01110b723182a8d3)@dockimbel `context` processes a call to `return` in the spec block. It returns the argument value of the called return instead of the object.

```
>> o: context [x: 5 return 2 + x]
== 7
>> probe o
7
== 7
```

Rebol2 silently ignores the call to `return`:

```
>> o: context [x: 5 return 2 + x]
>> context [x: 5 return 2 + x]                                
>> probe o
make object! [
    x: 5
]
```

This looks like a bug to me.

9214

[08:58](#msg59d745bd177fb9fe7e461c28)but I considered that as a feature :confused:

dockimbel

[10:17](#msg59d75837614889d475808d2b)@PeterWAWood See my reply in red/red. R2 does not ignore it, it just catches the exception in `make object!` (all code after `return 2 + x` is not evaluated). R3 behaves the same as Red.

## Saturday 7th October, 2017

meijeru

[11:08](#msg59d8b5c6b20c642429d30136)It would be different if `context` were a macro instead of a function, I supppose...

## Saturday 14th October, 2017

maximvl

[07:46](#msg59e1c0d93cb340a2612218a3)hi guys

[07:46](#msg59e1c0efb20c642429fec633)I tried to run Red under strace:

```
max@max-virtualbox ~/projects/typed $ strace red
execve("/home/max/bin/red", ["red"], [/* 62 vars */]) = 0
strace: [ Process PID=588 runs in 32 bit mode. ]
brk(NULL)                               = 0x9a4e000
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
mmap2(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xf7781000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=141957, ...}) = 0
mmap2(NULL, 141957, PROT_READ, MAP_PRIVATE, 3, 0) = 0xf775e000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
open("/lib/i386-linux-gnu/libm.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\1\1\1\3\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\220E\0\0004\0\0\0"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0644, st_size=341948, ...}) = 0
mmap2(NULL, 344144, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xf7709000
mmap2(0xf775c000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x52000) = 0xf775c000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
open("/lib/i386-linux-gnu/libdl.so.2", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0000\n\0\0004\0\0\0"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0644, st_size=13828, ...}) = 0
mmap2(NULL, 16488, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xf7704000
mmap2(0xf7707000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xf7707000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
open("/lib/i386-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\1\1\1\3\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\320\207\1\0004\0\0\0"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=1786484, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xf77a8000
mmap2(NULL, 1792540, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xf754e000
mprotect(0xf76fd000, 4096, PROT_NONE)   = 0
mmap2(0xf76fe000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1af000) = 0xf76fe000
mmap2(0xf7701000, 10780, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xf7701000
close(3)                                = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xf754d000
set_thread_area({entry_number:-1, base_addr:0xf754d700, limit:1048575, seg_32bit:1, contents:0, read_exec_only:0, limit_in_pages:1, seg_not_present:0, useable:1}) = 0 (entry_number:12)
mprotect(0xf76fe000, 8192, PROT_READ)   = 0
mprotect(0xf7707000, 4096, PROT_READ)   = 0
mprotect(0xf775c000, 4096, PROT_READ)   = 0
mprotect(0xf77a9000, 4096, PROT_READ)   = 0
munmap(0xf775e000, 141957)              = 0
rt_sigaction(SIGCONT, {0x80a2cb0, [CONT], SA_RESTART}, {SIG_DFL, [], 0}, 8) = 0
rt_sigaction(SIGTSTP, {0x80a3150, [TSTP], SA_RESTART}, {SIG_DFL, [], 0}, 8) = 0
rt_sigaction(SIGINT, {0x80a4ad0, [INT], SA_RESTART}, {SIG_DFL, [], 0}, 8) = 0
rt_sigaction(SIGTERM, {0x80a4ad0, [TERM], SA_RESTART}, {SIG_DFL, [], 0}, 8) = 0
rt_sigaction(SIGHUP, {0x80a4ad0, [HUP], SA_RESTART}, {SIG_DFL, [], 0}, 8) = 0
brk(NULL)                               = 0x9a4e000
brk(0x9a71000)                          = 0x9a71000
mmap2(NULL, 528384, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xf74cc000
mmap2(NULL, 528384, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xf744b000
brk(0x9a94000)                          = 0x9a94000
brk(0x9ab5000)                          = 0x9ab5000
brk(0x9ad6000)                          = 0x9ad6000
gettimeofday({2787310729019563, -35154101159329788}, NULL) = 0
open("/etc/localtime", O_RDONLY|O_CLOEXEC) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
fstat64(3, {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
read(3, "TZif2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\16\0\0\0\16\0\0\0\0"..., 4096) = 2943
_llseek(3, -28, [2915], SEEK_CUR)       = 0
read(3, "\nCET-1CEST,M3.5.0,M10.5.0/3\n", 4096) = 28
close(3)                                = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
brk(0x9af7000)                          = 0x9af7000
getcwd("/home/max/projects/typed", 50)  = 25
brk(0x9b1a000)                          = 0x9b1a000
brk(0x9b17000)                          = 0x9b17000
brk(0x9b16000)                          = 0x9b16000
gettimeofday({2815661808140459, -35152997360919260}, NULL) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/home/max/projects/typed/none", 0xff831050) = -1 ENOENT (No such file or directory)
stat64("/usr/local/bin/netscape", 0xff831050) = -1 ENOENT (No such file or directory)
stat64("/usr/bin/netscape", 0xff831050) = -1 ENOENT (No such file or directory)
gettimeofday({2822280352743595, -35152997360919260}, NULL) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
gettimeofday({2825402793967787, -35152997360919260}, NULL) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
gettimeofday({2828649789243563, -35152997360919260}, NULL) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
gettimeofday({2832712828305579, -35152997360919260}, NULL) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
gettimeofday({2844412319219883, -35152997360919260}, NULL) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
gettimeofday({2848578437497003, -35152997360919260}, NULL) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
gettimeofday({2851151122907307, -35152997360919260}, NULL) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
gettimeofday({2853530534789291, -35152997360919260}, NULL) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
gettimeofday({2855343010988203, -35152997360919260}, NULL) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
gettimeofday({2858534171689131, -35152997360919260}, NULL) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2943, ...}) = 0
getpeername(0, 0xff831d74, 0xff831d70)  = -1 ENOTSOCK (Socket operation on non-socket)
open("/home/max/license.key", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/home/max/projects/typed/license.key", O_RDONLY) = -1 ENOENT (No such file or directory)
mmap2(NULL, 790528, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xf738a000
open("/usr/bin/strace", O_RDONLY)       = 3
lseek(3, 464260, SEEK_SET)              = 464260
read(3, "H\211\373\350\24\357\376\377H\213s H\211\337\350\30\375\377\377H\215=u\306\0\0\350lr\377\377"..., 116) = 116
read(3, "\30\306\0\0\350\17r\377\377H\213s0H\215\25\226O\0\0H\215=\315\303\"\0\350(\346\377\377"..., 66) = 66
read(3, "d$\1dH\213\4%(\0\0\0H\211D$\0301\300\350\276q\377\377\17\266\34$L\215l$"..., 785638) = 402038
close(3)                                = 0
mmap2(NULL, 1032675328, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb9ab4000
write(1, "** Script Error: ", 17** Script Error: )       = 17
write(1, "Invalid compressed data - proble"..., 37Invalid compressed data - problem: -3) = 37
write(1, "\n", 1
)                       = 1
write(1, "** Near: ", 9** Near: )                = 9
write(1, "script: decapsulate \nif none? sc"..., 36script: decapsulate 
if none? script) = 36
write(1, "\n", 1
)                       = 1
exit_group(0)                           = ?
+++ exited with 0 +++
```

[07:48](#msg59e1c137e44c43700a2fdce9)so the first thing is it crashes

[07:48](#msg59e1c148e44c43700a2fdd00)the second one - what are the license keys it tries to read?

```
open("/home/max/license.key", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/home/max/projects/typed/license.key", O_RDONLY) = -1 ENOENT (No such file or directory)
```

9214

[07:48](#msg59e1c15c614889d475b26e3d)Rebol SDK license?

maximvl

[07:49](#msg59e1c16d5c40c1ba799c30a2)idk but is Rebol still embedded into the Red binary?

[07:49](#msg59e1c1a53cb340a261221d31)I thought whole compiled binary is generated by Red compiler and Rebol is only needed to run the compiler, not to be included into the result

PeterWAWood

[08:12](#msg59e1c6ef5c40c1ba799c4a28)The Red binary that is distributed is built with the Rebol encapper (part of the Rebol SDK). Rebol is embedded in the resultant binary.

[08:14](#msg59e1c754bbbf9f1a385d04f0)The Red binary is not compiled.

[08:14](#msg59e1c77101110b7231b49a8a)A Red program, such as the console, is compiled and does not require Rebol to run.

maximvl

[08:14](#msg59e1c782177fb9fe7e78afa5)I see, thanks

dockimbel

[09:22](#msg59e1d75fe44c43700a303028)&gt; I tried to run Red under strace

Actually no, you are running a Rebol executable under strace. ;-) The Red toolchain is written in Rebol.

maximvl

[11:55](#msg59e1fb3f614889d475b35f1e)I broke Red:

```
>> typed [x z: x]

*** Runtime Error 1: access violation
*** at: 0806D8DBh
max@max-virtualbox ~/projects/typed $
```

[11:56](#msg59e1fb6ee44c43700a30c087)and it's reproducible, do you need a script?

dockimbel

[12:22](#msg59e2017232e080696edc857c)@maximvl A script, yes please, and a new ticket.

maximvl

[12:59](#msg59e20a295c40c1ba799d5b0b)done, I added prints to the code around crashing point

## Sunday 15th October, 2017

9214

[09:12](#msg59e326865c40c1ba79a1cc2b)am I dumb or this thing refuses to work?

```
probe expand-directives [
#macro [ahead set-word! quote lookup-table block!] func [[manual] s e][
    s/2: reverse s/2
    e
]
lookup-table: [<1> 2 3 <4> 5 6]
]
```

```
[
    lookup-table: [<1> 2 3 <4> 5 6]
]
```

I expected `[6 5 <4> 3 2 <1>]`

[09:13](#msg59e326b0e44c43700a356b15)

```
text
probe expand-directives [
#macro [ahead set-word! quote lookup-table block!] func [[manual] s e][
    s/2: reduce [reverse s/2]
    e
]
lookup-table: [<1> 2 3 <4> 5 6]
]
```

```
[
    lookup-table: [[[6 5 <4> 3 2 <1>]]]
]
```

[09:37](#msg59e32c6fb20c64242904797c)looks like macro matches twice and reverses series back to normal?

[09:39](#msg59e32ceff7299e8f53ec805e)ah, `expand-directives` causes block to be preprocessed second time

[09:49](#msg59e32f15f7299e8f53ec898b)@dockimbel I don't see any info about `-e` flag on `--help` screen

[09:50](#msg59e32f76177fb9fe7e7e61ee)and it doesn't seems to work at all, I still get compiler internal error about `ahead` having no value :(

dockimbel

[09:53](#msg59e3301932e080696ee1328b)@9214 Your macro does not work when compiled? (Seems ok from the console). Yes, `expand-directives` invokes the preprocessor.

9214

[09:54](#msg59e3304832e080696ee13339)@dockimbel It won't work if I compile with `-c`, because of R2 limitations, and `-e` aint do the trick

[09:54](#msg59e3304d210ac26920ea6591)or I'm doing something wrong

dockimbel

[09:56](#msg59e330c7614889d475b830a1)`-e` is experimental and may be replaced by a different command-line syntax. Actually, the compiler's preprocessor will still be invoked on the source code, even in that encapped mode. Such behavior could be blocked, but it then defeats the purpose of macros in Red, which are a compile-time optimisation. Using macros in interpreted code is useless, as you can do the preprocessing in the code itself without any external framework. The only reason macros are resolved in the interpreter is for compatibility with compiled code. You really don't need them otherwise. That's why they never made it in Rebol after two decades of usage, it's just useless for an interpreted homoiconic language.

9214

[10:08](#msg59e333bae44c43700a35a215)so far I've used macros to pre-process and pre-compute some data before actual script is compiled/interpreted

[10:11](#msg59e3344c614889d475b83e7d)and right now I created another such preprocessing transformation on data table, which works fine interpreted but which underlying R2 can't process, so I thought that `-e` is my savior

dockimbel

[10:12](#msg59e33485f7299e8f53eca09e)You need to stick to R2-compatible code when writing macros. Unless you really benefit from using the preprocessor and the macros system it provides, you might be better with just preprocessing your code in a custom way at run-time. In such case, you can just use Red code and forget about R2.

9214

[10:12](#msg59e33494e44c43700a35a59a)@dockimbel yeah, believe me I got that already :smile:

[17:09](#msg59e39638f7299e8f53ee4551)@dockimbel you mentioned "custom way of preprocessing at run-time", you mean create another script which will preprocess all stuff in another script? Again, I want this data transformation to happen exactly once before code is evaluated (or compiled), without any overhead at runtime, and I thought that this is what macros do.

## Monday 16th October, 2017

dockimbel

[03:58](#msg59e42e57f7299e8f53f0bca9)@9214 No need for another script, just inline it in your main script. Yes, no overhead at run-time is what compiled macros give you. But if you can't notice the run-time overhead in the first place, then it's not really worth the trouble of using macros. Just use regular code transformations (macros are just a very thin syntactic sugar for that anyway, at least for now).

## Tuesday 17th October, 2017

dsunanda

[08:52](#msg59e5c4cb32e080696eedd427)Red-0.6.3 under Win 10  
console crash with  
difference \[] \[none]

dockimbel

[09:02](#msg59e5c70b614889d475c4fda7)@dsunanda Good catch! Please open a ticket for it if you have a github account.

dsunanda

[09:07](#msg59e5c8365c40c1ba79aeb7f3)Thanks - done #3081

[09:11](#msg59e5c92bb20c642429114a0e)Red-0.6.3 under Win10  
Weirdness with APPEND/DUP:  
append/dup \[] "x" 3.2 ;; &lt;--- non-interger dup count  
r3 === \["x" "x" "x"] ;; R3 treats /DUP float as an INTEGER  
Red === \[] ;; Red treats /DUP float as zero  
append/dup \[] "x" 3.3  
r3 === \["x" "x" "x"]  
Red === \[] ;; Internal Error: not enough memory  
Weirder still:  
append/dup \[] "x" 3.2999  
Red === \[]  
append/dup \[] "x" 3.29999  
Red === \*\** Internal Error: not enough memory

dockimbel

[09:13](#msg59e5c9af5c40c1ba79aec040)@dsunanda I think that feature is just not implemented in the code.

## Wednesday 18th October, 2017

PeterWAWood

[11:21](#msg59e73945d6c36fca3167c4ed)When compiled the following code raises a runtime script error:

```
Red [] 
list-dir %./
```

[11:23](#msg59e739ae210ac26920ff0022)

```
text
./test
*** Script Error: path none is not valid for none! type
*** Where: eval-path
*** Stack:
```

Is this because it is not designed to run in a complied program?

dockimbel

[15:00](#msg59e76c82b20c6424291a7f02)@PeterWAWood `list-dir` purpose's is to print a list of files inside the console. Therefore, it relies on `system/console/size` for that, but the console is not there when you compile the script. What is the use-case for using `list-dir` in a compiled script?

greggirwin

[15:38](#msg59e77589177fb9fe7e94b0bf)I don't think Peter has a use case, just that a newer user writing tests hit this behavior.

[15:40](#msg59e775e5f7299e8f53025214)`Help` also uses the system console size. Maybe we could standardize on a default if that isn't there.

PeterWAWood

[23:18](#msg59e7e13c177fb9fe7e973496)@dockimbel The question on `list-dir` came about when writing tests for `environment/functions.red`in which it is defined. If it is a console only function, wouldn't it be better in a file under in `environment/console/`?

## Thursday 19th October, 2017

dockimbel

[04:48](#msg59e82eb1b20c6424291e8b33)@PeterWAWood Yes, I think so. Done.

meijeru

[09:00](#msg59e869a932e080696efbef97):+1: I note that the (near-)synonyms of `list-dir`, namely `ls` `dir` and `ll` were already in `console/engine.red`.

## Sunday 22nd October, 2017

dander

[08:40](#msg59ec596c32e080696e0e59cc)There seems to be an issue with sort/all and args passed to a custom compare function with `/all`. After making the block longer, it doesn't pass both params...

```
>> comp: func [a b][probe reduce [a b] probe either a/2 = b/2 [a/1 < b/1] [a/2 > b/2]]
== func [a b][probe reduce [a b] probe either a/2 = b/2 [a/1 < b/1] [a/2 > b/2]]
>> sort/all/skip/compare [#"b" 1 #"a" 1  #"d" 1 #"e" 2 #"c" 2 #"f" 2 #"g" 2] 2 :comp
[[#"a" 1] [#"b" 1]]
true
[[#"d" 1] [#"b" 1]]
false
[[#"e" 2] [#"d" 1]]
true
(snip)
== [#"c" 2 #"e" 2 #"f" 2 #"g" 2 #"a" 1 #"b" 1 #"d" 1]

>> sort/all/skip/compare [#"b" 1 #"a" 1  #"d" 1 #"e" 2 #"c" 2 #"f" 2 #"g" 2 #"h" 1] 2 :comp
[#"c" #"b"]
*** Script Error: path a/2 is not valid for char! type
*** Where: =
*** Stack: probe
```

dockimbel

[10:20](#msg59ec70d932e080696e0eb2b7)@qtxie ^----

qtxie

[10:46](#msg59ec76fde44c43700a62d945)@dander It's a bug. Please open a ticket for it.

dander

[16:14](#msg59ecc3d0614889d475e787fa)@qtxie #3086 opened

## Monday 23th October, 2017

PeterWAWood

[04:59](#msg59ed774b5c40c1ba79d41bd8)This code compiles but raises an access violation when run under macOS:

```
Red [] 
#system [
	#call [probe 1]
]
```

```
*** Runtime Error 1: access violation
*** at: A1742F52h
```

[05:14](#msg59ed7ab5f7299e8f531e24ef)I get the same crash on Ubuntu 32.

dockimbel

[07:23](#msg59ed9901210ac269201cd92c)@PeterWAWood `#call` does not do any boxing/unboxing of the argument values. In the above code, you are passing a red-value! pointer of value `1`, causing the crash. You need to provide valid Red values (pointers to `red-!` structs).

PeterWAWood

[07:27](#msg59ed99f2b20c642429374559)@dockimbel Thanks. Should I update the Red/System spec as it says:

"The arguments should be passed as pointers to Red values of the expected type, except for integer! and logic! datatypes, that can be passed inlined, without requiring any boxing. When required, for pointer arguments, a simple type casting is allowed." in \[#call](http://static.red-lang.org/red-system-specs.html#section-16.8).

dockimbel

[07:38](#msg59ed9c7f32e080696e13ad33)@PeterWAWood Let me recheck that in the compiler's code first.

greggirwin

[18:23](#msg59ee33bb32e080696e172287):point\_up: \[October 22, 2017 10:14 AM](https://gitter.im/red/bugs?at=59ecc3d0614889d475e787fa) I poked a bit and added comments to #3086.

## Tuesday 24th October, 2017

PeterWAWood

[02:23](#msg59eea408b20c6424293d1e10)Here is a screenshot showing a couple of Red console zombies. I suspect this is related to the issue that @rebolek and I have mentioned before.

[02:23](#msg59eea41ef7299e8f53248db9)\[!\[macOS Red Console Zombies.png](https://files.gitter.im/red/bugs/lQMA/thumb/macOS-Red-Console-Zombies.png)](https://files.gitter.im/red/bugs/lQMA/macOS-Red-Console-Zombies.png)

[02:35](#msg59eea6ede44c43700a6d691e)I was using a console built against the latest master.

## Friday 27th October, 2017

toomasv

[07:40](#msg59f2e307e44c43700a83649e)I use same laptop (Thinkpad) on workplace with big display and at home without it. Red console opened at home and at work scale differently. Console can be just reopened to set it stright, but View windows texts do not adapt. Some confusion with metrics. Is it possible to adjust this behaviour or do I have just to restart computer to get correct metrics?  
!\[scaling-problem](http://toomas.vooglaid.ee/red/scale-problem.png)

qtxie

[09:02](#msg59f2f60d5a1758ed0f563e54)@toomasv Do you use latest red binary or 0.6.3?

toomasv

[09:04](#msg59f2f6b5614889d47507d0eb)@qtxie

```
>> system/build
== make object! [
    date: 17-Oct-2017/17:00:48+03:00
```

qtxie

[09:16](#msg59f2f96ef7299e8f533ae5c5)Does reboot work? The view engine doesn't handle dynamically DPI changing for now.

toomasv

[09:48](#msg59f300d4d6c36fca31a239db)@qtxie Yes, reboot works.

## Monday 30th October, 2017

9214

[08:31](#msg59f6e36a32e080696e40ec46)with anything but `text` in the first line it works, but with `text` there's no, well, text

```
>> text: "test"
== "test"
>> view [panel [text with [text: text]]]
```

greggirwin

[17:52](#msg59f766f8d6c36fca31b62a33)It's not referencing your global `text` in that example. That is, it works without defining text, because `text` is in the working context already.

```
>> view [panel [text with [text: probe text]]]
none
```

9214

[17:53](#msg59f7671a976e63937e06f793)@greggirwin right, thanks Gregg, you reminded me that `with` block is binded to current face

## Tuesday 7th November, 2017

toomasv

[20:55](#msg5a021db8f7299e8f53840a75)Is this a bug?

```
>> blk: [23 #"g" 56 11 #"8"]
== [23 #"g" 56 11 #"8"]
>> find blk #"8"
== [56 11 #"8"]
```

It seems #"8" is implicitly cast to integer in `find`:

```
>> to-integer #"8"
== 56
```

rebolek

[20:57](#msg5a021e1dd6c36fca31eabfde)@toomasv I vote for bug, Rebol returns `[#"8"]`

toomasv

[20:59](#msg5a021ea8614889d47550839d)@rebolek It seems so indeed:

```
>> find blk #"g"
== [#"g" 56 11 #"8"]
>> to-integer #"g"
== 103
>> insert blk 103
== [23 #"g" 56 11 #"8"]
>> find blk #"g"
== [103 23 #"g" 56 11 #"8"]
```

Oldes

[21:16](#msg5a0222c2e44c43700acca959)@toomasv You can use `find/case`, but I think it is more bug than feature.

[21:17](#msg5a0222d4d6c36fca31eadca6)

```
>> find/case [b 103 a] #"g"
== none
>> find/case [b 103 a] 103
== [103 a]
```

## Wednesday 8th November, 2017

toomasv

[04:22](#msg5a0286905a1758ed0fa0901d)@Oldes OK, thanks!

## Thursday 9th November, 2017

9214

[17:40](#msg5a04932b86d308b755cadcf4)`any [bug? not intended? I'm-doing-something-wrong?]`

```
>> ? bind
USAGE:
     BIND word context

DESCRIPTION: 
     BIND is a native! value.

ARGUMENTS:
     word         [block! any-word!] 
     context      [any-word! any-object! function!] 

REFINEMENTS:
     /copy        => 

RETURNS:
     [block! any-word!]

>> do bind [x] has [x][x: 1]
*** Script Error: x is not in the specified context
*** Where: do
*** Stack:
```

greggirwin

[18:30](#msg5a049ee232e080696e85c5bf)I \*think* not by design, but @dockimbel would have to say.

```
>> fn: has [x][x: 1]
== func [/local x][x: 1]
>> context? first bind [x] :fn
== func [/local x][x: 1]
>> same? :fn context? first bind [x] :fn
== true
```

## Friday 10th November, 2017

dockimbel

[09:35](#msg5a0572e0f7299e8f5395af90)@greggirwin @9214 Function contexts only exist when the function is under evaluation (same as in Rebol3), so the error there is legitimate, as the function is not running when `[x]` is evaluated. But the error message is not very accurate (it was copied from Rebol3), so it probably needs to be changed to something like "context for x is not available".

9214

[13:46](#msg5a05adcfe44c43700adf513b)@dockimbel so `[x]` is bounded, but its context is missing? That's interesting, and how one can evaluate `[x]` "in parallel" with function evaluation?

dockimbel

[15:31](#msg5a05c64adf09362e67f0eeaf)@9214 Function's context are allocated on the stack (objects and closures ones are on the heap), so you need to have the function called to have its context available. Though the function does not need to be the currently called one, just somewhere in the call chain. When the context is available, then any word bound to that function's context can be evaluated. When the function is not in the call stack anymore, its context becomes unavailable. Closures will not have this limitation, but they will have a memory and performance overhead. For the record, Rebol2 puts function contexts on the heap, while Rebol3 puts them on the stack (like Red).

greggirwin

[17:51](#msg5a05e70986d308b755d1c36c)Great explanation. Thanks @dockimbel. Added to https://github.com/red/red/wiki/Guru-Meditations

## Saturday 11st November, 2017

9214

[02:30](#msg5a0660dad6c36fca3101886e)@dockimbel @greggirwin

```
>> foo: has [x][x: 'cool bar]
== func [/local x][x: 'cool bar]
>> bar: does [do bind [x] :foo]
== func [][do bind [x] :foo]
>> foo
== cool
```

[02:40](#msg5a06630886d308b755d4188b)

```
text
>> foo: has [x /bar][if bar [return do bind [x] :foo] x: 'cool foo/bar]
== func [/local x /bar][if bar [return do bind [x] :foo] x: 'cool foo/bar]
>> foo
== cool
```

[02:41](#msg5a066353026aeaa02ffccc82)now I wonder what are the use cases :mortar\_board:

[02:45](#msg5a066464614889d4756782e7)I think it would be rather interesting to check out after parallelism and concurrency are implemented

[02:55](#msg5a0666bbf257ad91097e1af3)more representative example

```
>> foo: has [x /bar][if bar [return do block] x: 'cool foo/bar]
== func [/local x /bar][if bar [return do block] x: 'cool foo/bar]
>> block: [do bind [x] :foo]
== [do bind [x] :foo]
>> do block
*** Script Error: x is not in the specified context
*** Where: do
*** Stack:  

>> foo
== cool
>> do block
*** Script Error: x is not in the specified context
*** Where: do
*** Stack:
```

greggirwin

[17:53](#msg5a073911540c78242defdf13)One thought is something like aspect oriented programming, or tracing, but may need more thought on function reflection and such. You could certainly build your own conventions, but I still want to think about how we can instrument all our Red apps with something like a DTrace system.

## Tuesday 14th November, 2017

PeterWAWood

[01:07](#msg5a0a41dcf257ad91098f7320)@dockimbel The help text for `length?` species that the argument must a series. However, `length?` currently accepts a `map!` and returns the number of entries as its length. `length?` does not accept an `object!`.

Is it intended for `length?` to work on `map!`s?

Given that determining the number of "entries" in both `map!`s and `object!`s is trivial with `length? words-of`, is it necessary for `length?` to work directly on `map!`s?

dockimbel

[05:21](#msg5a0a7d5c71ad3f8736df9545)@PeterWAWood Good point. Yes, it could work with `words-of`, though that is more much resource-consuming, but also you rarely need it, that might not really matter in practice. As `map!` is more object-like than series-like, it would make sense to support objects too then if we keep it for maps. So I'm undecided on that.

greggirwin

[05:46](#msg5a0a831c71ad3f8736dfaa73)The question for me is how it would be used. That is, without using `words-of/values-of` in conjunction with it, what do you use it for? Perhaps useful when you only need to know the length ("There are 19 items in X"), but you can't iterate or `pick` with it.

9214

[08:33](#msg5a0aaa48614889d4757aa4da)

```
text
partition: function [elems [block!] group [integer!]][
    parse elems [
        collect some [keep group skip | [collect keep to end]]
    ]
]

probe partition [1 2 3 4 5 6 7 8 9] 2
```

```
*** Runtime Error 1: access violation
*** at: 0805B384h
```

The cause is `to` keyword which seems to throw `parse` into an infinite loop.

dockimbel

[08:34](#msg5a0aaa91e606d60e34bfb6c2)@9214 Confirmed, please log it in a ticket.

9214

[08:34](#msg5a0aaa9c505b630c05de16a1)sir yes sir :guardsman:

[08:50](#msg5a0aae38ba39a53f1a995775)@dockimbel though, I'm not really sure what the cause is: using various @greggirwin's `profile` setups (see \[here](https://gitter.im/red/help?at=5a0aad6aba39a53f1a9953a0)):

```
profile/show/count collect [
    repeat i samples [
        keep/only compose [
            partition (to word! rejoin ['elems i]) group]
    ]
] 100
```

```
*** Math Error: math or number overflow
*** Where: -
*** Stack: profile collect
```

and with count increased up to `1000`

```
*** Runtime Error 1: access violation
*** at: F76C5D60h
```

greggirwin

[19:07](#msg5a0b3ed7982ea2653f7baa82)I commented on the ticket @9214. I think it's just running out of memory.

## Wednesday 15th November, 2017

9214

[02:04](#msg5a0ba0b6df09362e670cbaff)@greggirwin thanks!

## Friday 17th November, 2017

xqlab

[10:28](#msg5a0eb9caf257ad9109a77f57)

```
take/part [1] -1
```

with negative length causes closing of the console without an error

meijeru

[10:37](#msg5a0ebbf8540c78242d1512a2)Confirmed. Worth a ticket (issue).

dockimbel

[10:46](#msg5a0ebe012837ee510694e147)Good catch!

## Sunday 19th November, 2017

endo64

[01:34](#msg5a10dfbdba39a53f1ab8ec04)@qtxie Can you check below crashing code:

```
Red [
	Needs:	View
]
;system/view/auto-sync?: false

a: make face! [type: 'base color: red   offset: 120x120 size: 50x50]
b: make face! [type: 'base size: 50x50]

win: make face! [
	type:	'window
	size:	400x400
	pane: reduce [a]
	actors: object [
		on-down: function [face event] [
			append face/pane make b [color: random white offset: random 150x150]
			move find/same win/pane a tail win/pane
			show win	; <<< crashes if auto-sync is OFF!
		]
	]
]
view win
```

[01:36](#msg5a10e02e540c78242d1ef40f)This one doesn't crash with auto-sync ON or OFF:

```
on-down: function [face event] [
			append face/pane make b [color: random white offset: random 150x150]
			show win  ; this prevents the crash
			move find/same win/pane a tail win/pane
			show win
		]
```

## Thursday 23th November, 2017

rebolek

[07:38](#msg5a167b0de606d60e34fb54e9) I know it's because floating point numbers, but seems strange anyway:

```
>> x: 1% while [x < 10%][x: x + 1%]
>> x
== 11%
```

qtxie

[08:30](#msg5a16871671ad3f87361dab5d)@endo64 I can reproduce it with the latest Red. But no crashes in 0.6.4 branch.

## Saturday 25th November, 2017

9214

[08:52](#msg5a192f658b3a9e2c0c16cfd5)Is that by design? It's surprising that `do` can automatically `load` `string!` value, I expected it to return `"foo"`.

```
>> foo: 'bar
== bar
>> do "foo"
== bar
```

rebolek

[09:02](#msg5a1931c0cc1d527f6bb21326)@9214 Yes, that's by design. See these examples:

```
>> do "1 + 2"
== 3
>> do "{foo}"
== "foo"
```

9214

[09:11](#msg5a1933bc232e79134dcce81d)@rebolek I'll put this ace in my sleeve then... :black\_joker:

```
>> do "11 + 2"
== 13
>> do next "11 + 2"
== 3
```

rebolek

[09:15](#msg5a193496ffa3e37919b984dd):thumbsup:

9214

[10:32](#msg5a1946b9ba39a53f1ae1dbe0)is it okay that I can't use `set-word!` syntax on everything that starts with `<`?

```
>> <: 1
*** Syntax Error: invalid tag! at "<: 1"
*** Where: do
*** Stack: load
```

toomasv

[17:28](#msg5a19a855ffa3e37919bb6eea)Bug?

```
>> to-date to-integer 1-Jan-1970/0:00:01
== 1-Jan-1970/0:00:01
>> to-date to-integer 11-9-1561/4:35:13
== 1-Jan-1970/0:00:01
```

endo64

[18:27](#msg5a19b602e606d60e3409f0f0)I think its 32 bit integer boundary.

greggirwin

[19:49](#msg5a19c930232e79134dcf60ed)@9214, yes, there are limitations in lexing.

[19:49](#msg5a19c961e606d60e340a4508)Also, while we \*can* `do` strings, it's one of those things we want to be careful of.

[19:50](#msg5a19c96ddf09362e6751ec69)Just like `do`ing untrusted blocks.

[20:05](#msg5a19ccfaffa3e37919bc15b0)@toomasv @endo64 combination of limits at work I imagine  
\- https://doc.red-lang.org/en/date.html#\_abstract  
\- https://doc.red-lang.org/en/date.html#\_conversions

i.e. casting to epoch time limits what makes sense, and 1561 doesn't. Seems to be windowed at 1901.

## Monday 27th November, 2017

greggirwin

[01:16](#msg5a1b677bcc1d527f6bbb18d4)Can someone confirm that I'm losing my mind?

```
>> m: #(a: 1 b: [2])
== #(
    a: 1
    b: [2]
)
>> mm: copy m
== #(
    a: 1
    b: [2]
)
>> mmm: copy/deep m
== #(
    a: 1
    b: [2]
)
>> same? m/b mm/b
== false    ; should be true
>> same? m/b mmm/b
== false
>> same? mm/b mmm/b
== true     ; should be false
```

PeterWAWood

[02:06](#msg5a1b733e8b3a9e2c0c1f42bb)@greggirwin It looks looks like a bug in `copy` to me:

```
>> m: #(a: 1 b: [2])
== #(
    a: 1
    b: [2]
)
>> mm: copy m
== #(
    a: 1
    b: [2]
)
>> same? mm/b m/b
== true
>> mmm: copy/deep m
== #(
    a: 1
    b: [2]
)
>> same? mm/b m/b
== false
>> same? mm/b mmm/b
== true
```

[03:27](#msg5a1b8623cc1d527f6bbb8ee5)It seems only to affect `map!`. I tried with `block!` and `object!` and they are not affected.

greggirwin

[03:42](#msg5a1b898c540c78242d50dda6)I tested those as well, to be sure I wasn't too off base. I'll report it tomorrow if nobody else beats me to it.

PeterWAWood

[03:47](#msg5a1b8aefffa3e37919c34127)I'll do it.

[04:03](#msg5a1b8eafcc1d527f6bbbaa2c)#3118

greggirwin

[17:10](#msg5a1c46feba39a53f1aee83b2)Thanks Peter.

endo64

[21:19](#msg5a1c816b540c78242d564c88)@qtxie I think the latest build of Red has some issues, below code was working before:

```
test: make face! [
	type: 'base
	myfunc:	does [ 'nothing ]
]
*** Script Error: old has no value
*** Where: series?
*** Stack: series?
```

greggirwin

[22:26](#msg5a1c910d540c78242d56a8cf)Error trying to add any new word when making a face it seems?

## Tuesday 28th November, 2017

qtxie

[02:36](#msg5a1ccb9c540c78242d57b7e4)@endo64 Thanks. I can reproduce the error.

[06:48](#msg5a1d06a1ba39a53f1af25db2)Open a ticket for it: #3122

## Thursday 30th November, 2017

toomasv

[15:42](#msg5a2026d0540c78242d69b0d2)I am playing with a tree structure. Something strange happens when trying to get ancestors or descendants of a node. Seems to be some reference issue. See below.

```
make object! [
	label: none
	parent: none
	root: does [
		either self/root? [self][
			first self/ancestors
		]
	]
	children: copy []
	siblings: does [
		exclude parent/children reduce [self]
	]
	; NB! needs to be copied as `descendants-list: copy node/descendants` 
	; otherwise crashes
	descendants: func [/into list][
		list: any [list copy []]
		if not empty? children [
			append list copy children
			foreach child children [
				child/descendants/into list 
			]
		] copy list
	] 
	; NB! needs to be copied `ancestors-list: copy node/ancestors` 
	; otherwise crashes
	ancestors: has [list ancestor][
		list: copy []
		ancestor: parent
		while [ancestor][
			insert list ancestor
			ancestor: ancestor/parent
		] copy list
	] 
	root?: does [not to-logic parent]
	leaf?: does [empty? children]
	branch?: does [not leaf?]
	external?: does [leaf?]
	internal?: does [branch?]
	; e.g. node/count/condition node/children 'internal?
	count: func [what /condition cond /local n][
		either condition [
			n: 0
			forall what [if what/1/:cond [n: n + 1]]
			n
		][
			length? what
		]
	]
	degree: does [length? children]
	depth: does [length? ancestors]
	level: does [depth + 1]
	set 'node func [label parent /local me my][
		me: my: make object! self
		my/label: copy label
		if parent [
			my/parent: parent
			append parent/children me
		]
		me
	]
]

n1: node "1" none
n2: node "2" n1
n3: node "3" n2
n4: node "4" n2
n5: node "5" n3
n6: node "6" n4
n7: node "7" n4
n8: node "8" n7
```

So far so good.

```
>> length? n1/descendants
== 7
>> length? n8/ancestors
== 4
>> foreach d copy n1/descendants [probe d/label]
"2"
"3"
"4"
"5"
"6"
"7"
"8"
== "8"
>> length? n7/ancestors
== 3
>> foreach d copy n7/ancestors [probe d/label]
"1"
"2"
"4"
== "4"
```

But why do I need `copy` here? Te result is copied already:

```
descendants: func [/into list][
	list: any [list copy []]
	if not empty? children [
		append list copy children
		foreach child children [
			child/descendants/into list 
		]
	] copy list
] 
ancestors: has [list ancestor][
	list: copy []
	ancestor: parent
	while [ancestor][
		insert list ancestor
		ancestor: ancestor/parent
	] copy list
]
```

Looping without `copy` results in `Error`:

```
>> foreach d n1/descendants [probe d/label]
*** Script Error: invalid argument: make object! [label: "2" parent: make object! [label: "1" ...
```

And even worse, setting without `copy` (`d: n1/descendants`) crashes the console, while `d: copy n1/descendants` works well.

Any thoughts?

greggirwin

[19:04](#msg5a2056573c69dd49170a353c)Something about `foreach` accessing the underlying the func rather than the result?

```
>> n1/descendants/1
*** Script Error: descendants has no refinement called 1
*** Where: descendants
*** Stack:
```

```
>> d: copy n1/descendants 
== [make object! [
    label: "2"
    parent: make object! [
        label: "1"
        parent: none
        root: fu...
>> d/1
== make object! [
    label: "2"
    parent: make object! [
        label: "1"
        parent: none
        root: fun...
```

[19:09](#msg5a20577e71ad3f87364d9593)i.e. something in the stack handling getting confused? This works: `foreach d probe n1/descendants [d/label]` Shoot. Console just vanished while experimenting.

[19:11](#msg5a2057c671ad3f87364d9715)Just doing `des: n1/descendants` dupes it.

[19:12](#msg5a205810cc1d527f6bd5b3b4)I'll have to come back to this later.

toomasv

[20:16](#msg5a20671e232e79134df1ba03)@greggirwin Yep, setting without `copy`consistently crashes the console.

greggirwin

[20:21](#msg5a206848232e79134df1c096)And `foreach` sets a word each time, so they may have a related issue.

[20:22](#msg5a2068793c69dd49170a9b13)Need to come up with a minimal test case that shows the problem.

[20:32](#msg5a206acd3ae2aa6b3f6e8c7a)Deep cloning at `me: my: make object! self` doesn't fix it.

[20:34](#msg5a206b3effa3e37919de02f5)Back later for more.

## Friday 1st December, 2017

toomasv

[08:00](#msg5a210c23cc1d527f6bd90f11)Interesting:

```
a: copy []
same? copy a a
;== false
;But:
same? copy n1/descendants n1/descendants
;== true
same? copy n2/ancestors n2/ancestors
;== true
;But also:
same? a copy a
;== false
;And:
same? n1/descendants copy n1/descendants
;== false
same? n2/ancestors copy n2/ancestors
;== false
```

[09:53](#msg5a21267d87680e6230b9c0c3)This is as minimal, as I can make it:

```
n: object [l: none x: none asc: has [a l][l: copy [] a: x while [a][insert l a a: a/x] copy l]]
n1: make n [l: "1" x: none]
n2: make n [l: "2" x: n1]
foreach y n2/asc [probe y/l]
*** Script Error: invalid argument: make object! [l: "1" x: none asc: func [/local a l][l: copy [] a: x while [a] [insert l a a: a/x] copy l]]
*** Where: foreach
*** Stack:  
>> type? n2/asc
== block!
>> length? n2/asc
== 1
```

But:

```
>> foreach y copy n2/asc [probe y/l]
"1"
== "1"
>> foreach y to-block n2/asc [probe y/l]
"1"
== "1"
```

[12:23](#msg5a2149da540c78242d6f735b)And this seems to concern funcs operating from within objects. With global funcs it works well:

```
n: object [l: none x: none]
asc: func [n /local a l][l: copy [] a: n/x while [a][insert l a a: a/x] copy l]
n1: make n [l: "1" x: none]
n2: make n [l: "2" x: n1]
>> foreach y asc n2 [probe y/l]
"1"
== "1"
```

But not from inside object:

```
>> m: object [asc: func [n /local a l][l: copy [] a: n/x while [a][insert l a a: a/x] copy l]]
== make object! [
    asc: func [n /local a l][l: copy [] a: n/x while [a] [insert l a a: a/x] copy l]
]
>> foreach y m/asc n2 [probe y/l]
*** Script Error: invalid argument: make object! [l: "1" x: none]
*** Where: foreach
*** Stack:
```

greggirwin

[19:51](#msg5a21b2cdcc1d527f6bdca795)Reproduced here. If you do `bang: n2/asc` it kills the process. Please file a ticket.

toomasv

[20:47](#msg5a21bfcb232e79134df8e63e)#3128

greggirwin

[21:06](#msg5a21c452232e79134df8ff7a)Thanks @toomasv

endo64

[22:08](#msg5a21d2f1cc1d527f6bdd57f0)@qtxie #3122 is fixed by @dockimbel , but below code was working before but not anymore:

```
view make face! [
	type: 'window
	color: red
	size: 100x100
	f1: does [f2]
	f2: does [print "ok"]
]
; *** Script Error: f2 has no value
```

[22:09](#msg5a21d3193c69dd491711d681)even `f1` is not executed it requires `f2` to be defined before `f1`.

[22:11](#msg5a21d391232e79134df957ba)Another question: Why `ok` printed 3 times for below code:

```
view make face! [
	type: 'window
	color: red
	size: 100x100
	f1: does [print "ok"]
	f1
]
;ok
;ok
;ok
```

[22:18](#msg5a21d51cffa3e37919e5870c)Inner functions are called multiple times during creation, even without calling it:

```
make face! [
	type: 'base
	size: 100x100
	f1: does [print "ok"]
]
;ok
;ok
```

greggirwin

[23:12](#msg5a21e1dc3a80a84b5ba75c79)Please open a new ticket, and reference #3122. Good catch.

## Saturday 2nd December, 2017

endo64

[06:46](#msg5a224c413ae2aa6b3f77d5b5)Done, #3131

[07:40](#msg5a2258f3540c78242d748eb3)@dockimbel I've fixed #3131.  
In the same commit I also fixed #3122 `*** Script Error: old has no value` issue if `system/view/debug? true`

[07:44](#msg5a2259d0cc1d527f6bdf68a6)That commit goes with my previous PR #3073 , is that ok or should I make it on a different branch and another PR?

## Sunday 3th December, 2017

endo64

[18:34](#msg5a2443a487680e6230c77985)@dockimbel I've fixed issue #3132 and added a PR #3134

## Saturday 9th December, 2017

9214

[09:01](#msg5a2ba64dc65707ba2b2ea40f)script:

```
forever [[][reduce []]
```

Note the absence of Red header. I would expect get "Red header not found!" error, but instead:

```
*** Syntax Error: invalid value at "]"
*** Where: do
*** Stack: load
```

[13:06](#msg5a2bdfce3ae2aa6b3fa6eaaa)

```
text
>> x: [1 2 3]
== [1 2 3]
>> move/part x next x 3
```

crashes the console

toomasv

[13:15](#msg5a2be1fb540c78242da3411d)Confirmed here.

9214

[13:16](#msg5a2be2363ae2aa6b3fa6f69b)One way ticket, \[one way ticket](https://www.youtube.com/watch?v=g\_jUtiKSf1Y) to the :bug:-tracker

greggirwin

[19:12](#msg5a2c35a3a2be4668287f53a4)Nice track. :^)

## Friday 15th December, 2017

9214

[08:19](#msg5a3385885355812e57da1dcc)

```
text
>> parse ["1" "2"][some [copy match string!]]
== true
>> match
== ["2"]
```

I expect match to be just `"2"`

rebolek

[08:21](#msg5a3385fec254d1100e291d4a)@9214 Use `set` then.

9214

[08:21](#msg5a33860f540c78242dc93762)@rebolek right, figured out already, thanks!

## Thursday 21st December, 2017

endo64

[21:05](#msg5a3c2235a2be466828cd9d6b)`break` doesn't reset series internal pointer to head when used in `forall`, is this behavior by design?

```
>> s: "12345" forall s [all [s/1 = #"3" break]] s
== "345"
```

greggirwin

[21:54](#msg5a3c2d941a4e6c822339c4c2)I believe that's by design. If it didn't, you'd have to track that yourself when breaking.

## Friday 22nd December, 2017

endo64

[07:31](#msg5a3cb4b5c072deaf0bee78e8)I see, so this pattern can be used when necessary. Thanks!

```
>> s: "12345" forall s [all [s/1 = #"3" also s: head s break]] s
== "12345"
```

maximvl

[11:18](#msg5a3ce9e8ba39a53f1a8efa82)this is clearly a bug:

```
>> to-float "1e-18"
== 0.0
>> zero? to-float "1e-18"
== false
>> 5 * to-float "1e-18"
== 0.0
```

[11:18](#msg5a3ce9efa2be466828d1097c)either on printing or in logic

rebolek

[11:18](#msg5a3cea1affa3e379196a8d09)in printing IMO. Mold does this to prevent things like `1 + 2 = 3.0000000000000000000001`

maximvl

[11:19](#msg5a3cea53a2be466828d10d58)

```
>> 100000000000 * to-float "1e-18"
== 1.0e-7
```

[11:19](#msg5a3cea575355812e57070215)@rebolek looks like printing

[11:20](#msg5a3cea6d1a4e6c82233cfd6c)

```
>> to-float "1e-17"
== 0.0
>> to-float "1e-16"
== 0.0
>> to-float "1e-15"
== 1.0e-15
```

dockimbel

[13:21](#msg5a3d06cf0163b02810697900)@maximvl Good catch. Floats are really a never-ending source of troubles. ;-) Hopefully, we can have a decent BCD implementation next year, and finalize our `dtoa()` port in R/S.

9214

[17:56](#msg5a3d4757b48e8c356656d361)poked around `parse.reds` and thought that `case` is some undocumented keyword (if so, what is it for?), but

```
parse [][case]
```

crashes the console

```
*** Runtime Error 1: access violation
*** at: F76D1FFCh
```

greggirwin

[20:32](#msg5a3d6bf9ba39a53f1a91b909)Case sensitive string parsing:

```
>> parse "aaA" [some #"a"]
== true
>> parse/case "aaA" [some #"a"]
== false
```

[20:34](#msg5a3d6c595355812e5709c246)The crash is probably worth reporting though. I'm guessing it's a regression.

## Saturday 23th December, 2017

9214

[07:07](#msg5a3e00c7e43a7a150c9978ab)@greggirwin I know about `/case` refinement, but \[this one](https://github.com/red/red/blob/master/runtime/parse.reds#L139) seems to be actual rule

dockimbel

[08:48](#msg5a3e184e0163b028106e0ffd)@9214 See "Parse dialect" section in latest blog \[entry](http://www.red-lang.org/2017/07/063-macos-gui-backend.html).

9214

[09:17](#msg5a3e1f44ffa3e379196ff9eb)@dockimbel :+1:

[09:26](#msg5a3e21495355812e570c6e89)s/rule/keyword

greggirwin

[20:05](#msg5a3eb723b48e8c35665c9482)My confusion @9214.

## Tuesday 26th December, 2017

9214

[12:36](#msg5a424257b48e8c3566699028)there's some trouble with menus on MacOS :point\_right: \[here](https://gitter.im/red/red?at=5a4162c4ffa3e379197c6b34)

qtxie

[12:44](#msg5a424413a2a87ea02171c3e7)@9214 Would you please open a ticket for it? I'll check it later.

9214

[12:46](#msg5a4244a8b48e8c3566699c8b)@qtxie sure

qtxie

[12:47](#msg5a4244f5a2a87ea02171c87e)@9214 Thanks. :smile:

9214

[18:29](#msg5a429517ffa3e379198119e0):confused:

```
>> foo: func ['a [any-type!] 'b [any-type!]][probe :a probe :b]
== func ['a [any-type!] 'b [any-type!]][probe :a probe :b]
>> foo
unset
unset
>> foo 1
1
unset
>> foo 1 2
1
2
== 2
```

[19:42](#msg5a42a63de43a7a150caac499):point\_up: is this a bug or a feature? I don't get from where `unset` pops up, and it won't work if arguments aren't quoted and `unset!` is not listed in typeset (here its `any-type!`, so `unset` values are allowed)

rebolek

[20:37](#msg5a42b322b48e8c35666b900d)@9214 This is feature to support i.e. both `?` and `? something` in console.

[20:46](#msg5a42b50c5355812e571dcca8)With bit effort, you can use it to fake variadic functions, but then you need to enclose each function call in `do []` block.

[20:46](#msg5a42b51ac072deaf0b05f887)It's not worth it ;)

9214

[20:49](#msg5a42b5efe43a7a150cab06c8)@rebolek yes, now I remembered that @greggirwin showed that trick with variadic function long time ago

rebolek

[20:53](#msg5a42b6b7e43a7a150cab0ad2)IMO something like `f [random number of args]` is much easier.

9214

[20:53](#msg5a42b6e4a2a87ea02173d4ae)https://github.com/red/red/wiki/Guru-Meditations#variadic-function

rebolek

[21:01](#msg5a42b894ba39a53f1aa5b2b6)Cool.

## Wednesday 27th December, 2017

maximvl

[11:00](#msg5a437d33b48e8c35666e9f67)there are some shenanigans going on with `append` to a list

[11:00](#msg5a437d3dba39a53f1aa8a596)I have this code executed in a loop

```
append prefixes probe to-word name
probe length? prefixes
```

[11:00](#msg5a437d52ba39a53f1aa8a622)and this is a piece of output:

```
56
n
57
p
58
f
59
a
60
z
61
y
62
US
2
survey
3
geodetic
4
Zena
3
Duna
4
```

[11:01](#msg5a437d6c03838b2f2a3faaa8)so suddenly when list reaches 62 items it gets reduced to 2..

rebolek

[11:03](#msg5a437e1dba39a53f1aa8a8fd)Interesting, but without seeing more of the code, it's hard to tell what is going on.

9214

[11:04](#msg5a437e2603838b2f2a3fae27)looks like some kind of overflow

maximvl

[11:04](#msg5a437e3c0163b02810829f78)yeah, I'm trying to make a small example

[11:04](#msg5a437e47ba39a53f1aa8a96a)because I have this in a hundred lines of other code

[11:18](#msg5a4381960163b0281082afd4)it happens inside parse inside attempt, when I call `length` on a `word!` value

[12:43](#msg5a43958db48e8c35666f0ab5)ok

[12:44](#msg5a4395af232e79134d97fceb)the problem was in exception thrown with `forall` while iterating over a series which is a part of context

[12:44](#msg5a4395c35355812e57215250)so it left index at the element where error happened

[12:45](#msg5a4395e3c072deaf0b0964b7)and then all other code was using same series

[12:53](#msg5a4397cb29ec6ac3118c017f)https://github.com/red/red/issues/3170

9214

[12:54](#msg5a4397f1c072deaf0b096c2e)@maximvl I think this behavior was discussed recently (with @endo64 I believe) and it's by design

maximvl

[12:54](#msg5a4397f9b48e8c35666f131e)I replaced `forall` with `foreach` in my code so it works now

[12:54](#msg5a439821b48e8c35666f136d)@9214 you have a link?

9214

[12:57](#msg5a4398a20163b02810831599)@maximvl gitter search is a mess, bu I'll try to dig up something

maximvl

[12:57](#msg5a4398b8c072deaf0b096f76)anyway

[12:57](#msg5a4398c30163b02810831613)I think a refinement can be a good thing to add

9214

[12:57](#msg5a4398c929ec6ac3118c065f)I agree with that

maximvl

[12:58](#msg5a4398db0163b0281083168a)or at least a doc string that it modifies the index

9214

[12:58](#msg5a439904edd2230811e256dd)https://gitter.im/red/red?at=57335717bce0284832d994ea

maximvl

[13:01](#msg5a4399a5edd2230811e25963)I see a question but don't see any replies

9214

[13:01](#msg5a4399b2c072deaf0b09731e)@maximvl look at the date :D

[13:01](#msg5a4399c4b48e8c35666f1c0e)it's not that recent

maximvl

[13:02](#msg5a4399f3c072deaf0b097437)I just scroll down the chat

[13:02](#msg5a4399ff232e79134d980fe1)but anyway, let's see what will happen in the ticket

[16:29](#msg5a43ca71edd2230811e34aee)does somebody see inconsistency here?

```
>> #"a" = "a"
== false
>> 1.0 = 1
== true
```

9214

[17:13](#msg5a43d4c2b48e8c35667043df)I don't get why this doesn't work

```
>> insert body-of :?? [print "!!!"]
== [
    prin mold :value 
    prin ": " 
    print either value? :value [mold get/any :value] ["unset!"]
]
>> ?? a
a: unset!
>> ?? b
b: unset!
>> ?? ??
??: func [
    "Prints a word and the value it refers to (molded)" 
    'value [word! path!]
][print "!!!" 
    prin mold :value 
    prin ": " 
    print either value? :value [mold get/any :value] ["unset!"]
]
```

body of `??` is updated but it ignores `insert`ed commands

maximvl

[17:15](#msg5a43d522e43a7a150cafabce)my assumption is that a function object made from this body exists separately

9214

[17:15](#msg5a43d547b48e8c3566704704)but this trick works with user-defined functions as far as I checked

maximvl

[17:16](#msg5a43d583ba39a53f1aaa4312)precompiled functions may behave differently

9214

[17:17](#msg5a43d591ba39a53f1aaa434d)

```
text
>> append body-of :rejoin [print "all rejoined, yay!"]
== [
    if empty? block: reduce block [return block] 
    append either series? first block [copy first block] [...
>> rejoin [1 2 3]
== "1 2 3"
```

maximvl

[17:19](#msg5a43d60703838b2f2a414bfa)I have a super weird bug with blocks:

```
probe res
         probe next res
         probe type? res
         probe length? res
         res: next res
         probe res
         probe type? res
         forall res [
```

this code produces this result:

```
[kg]
none
block!
1
none
none!
*** Script Error: forall does not allow none! for its 'word argument
*** Where: forall
*** Stack:
```

[17:19](#msg5a43d61eedd2230811e38528)so `next` returns `none` instead of an empty block

[17:19](#msg5a43d62cedd2230811e3856b)while it works if I just try it separately

9214

[17:21](#msg5a43d67e232e79134d99404c)@maximvl maybe you've redefined `next` somewhere?

maximvl

[17:21](#msg5a43d68e232e79134d99410a)lol, true

[17:21](#msg5a43d691edd2230811e38826)@9214 thanks :D

9214

[17:21](#msg5a43d69ee43a7a150cafb465)np

x8x

[18:40](#msg5a43e91b19147ac3231b0c2e)Bug?  
rebol:

```
replace t: %a.b find/last t %. %.c
;   %a.c
```

red:

```
replace t: %a.b find/last t %. %.c 
;   %a.c.b
```

rebolek

[18:43](#msg5a43e9d3c072deaf0b0afd50)I think you should report it.

x8x

[18:44](#msg5a43e9f351915d962afd764e)Will do, thx! :-)

## Thursday 28th December, 2017

greggirwin

[06:33](#msg5a44902903838b2f2a443ef2)I commented on https://github.com/red/red/issues/3170.

[06:35](#msg5a4490aa5355812e57259aef)@maximvl, no inconsistency on char/string and float/integer comparisons either. So you'll like this:

```
>> #"a" = 97
== true
```

[06:37](#msg5a44911fb48e8c3566733a75):point\_up: \[December 27, 2017 10:17 AM](https://gitter.im/red/bugs?at=5a43d591ba39a53f1aaa434d) @9214 see: https://github.com/red/red/wiki/Guru-Meditations#compiled-versus-interpreted-behaviors

9214

[07:15](#msg5a4499fc03838b2f2a44668b)@greggirwin aha, that explains why reconstruction with `body-of` and `spec-of` works, thanks!

maximvl

[14:13](#msg5a44fc0003838b2f2a462c6a)

```
>> "s" = "S"
== true
```

[14:13](#msg5a44fc010163b0281089208f)wat

[14:13](#msg5a44fc0a232e79134d9e3a17)@greggirwin is this intended as well?

rebolek

[14:13](#msg5a44fc1ac072deaf0b0f858a)Red is case insensitive by default

maximvl

[14:13](#msg5a44fc2129ec6ac3119240be)how do I fix it?

rebolek

[14:14](#msg5a44fc385355812e57279797)

```
>> "S" == "s"
== false
```

or `strictly-equal?`

maximvl

[14:14](#msg5a44fc4a29ec6ac31192419e)thanks!

rebolek

[14:14](#msg5a44fc5a5355812e5727986e)you're welcome

9214

[14:14](#msg5a44fc60ba39a53f1aaf239f)

```
text
>> ? ==
USAGE:
     value1 == value2

DESCRIPTION: 
     Returns TRUE if two values are equal, and also the same datatype. 
     == is an op! value.

ARGUMENTS:
     value1       [any-type!] 
     value2       [any-type!]
```

[14:15](#msg5a44fc6eedd2230811e898e9)no mention of case though

rebolek

[14:15](#msg5a44fc9ae43a7a150cb4a563)Probably to keep help string reasonably long.

maximvl

[14:16](#msg5a44fca603838b2f2a462ee0)

```
>> m: to-map [ "a" 1 ]
== #(
    "a" 1
)
>> select m "a"
== 1
>> select m "A"
== 1
```

[14:16](#msg5a44fcadedd2230811e89a61)@greggirwin how do I apply this for hashes?

[14:16](#msg5a44fccf0163b0281089259b)`select/case` I see :)

rebolek

[14:20](#msg5a44fd9c5355812e57279e1d):)

maximvl

[14:34](#msg5a4500f103838b2f2a4645fd)what about refinement on `read/lines` to correctly process newline escapes like this:

```
abc\
bca
```

[14:34](#msg5a4500fd0163b02810893a4b)so it would read this as a single line

[14:34](#msg5a4501030163b02810893a78)`abcbca` ?

rebolek

[14:35](#msg5a45013829ec6ac311925c0d)It's not native Red escape, unlike `^`, so I doubt it would be accepted.

maximvl

[14:36](#msg5a450160edd2230811e8b4b5)what about `read/lines/escape %file #"\"` ?

[14:36](#msg5a45016a232e79134d9e5786)so that you can specify the character

[15:38](#msg5a451005ba39a53f1aaf82a2)ok, am I stupid again here?

```
>> 604800.0 / 86400.0
== 7.0
>> units/graph/week/base-unit-value / units/graph/day/base-unit-value
== 1.0
>> units/graph/week/base-unit-value
== 604800.0
>> units/graph/day/base-unit-value
== 86400.0
>> units/graph/week/base-unit-value / units/graph/day/base-unit-value
== 1.0
```

[15:38](#msg5a451008edd2230811e900a4)why 1.0?

rebolek

[15:40](#msg5a45106029ec6ac31192ad7a)interesting, maybe a bug?

maximvl

[15:40](#msg5a4510755355812e5727fdad)the `base-unit-value` is a function

[15:40](#msg5a451081c072deaf0b0fee06)

```
base-unit-value: does [
      if base-unit [ select/case conversions base-unit ]
   ]
```

[15:41](#msg5a4510b80163b02810898df9)this is a full definition with context:

```
unit: object [
   ; value: 1
   type: 'unit
   conversions: none
   base-unit: none
   init: does [
      conversions: make map! []
   ]
   base-unit-value: does [
      if base-unit [ select/case conversions base-unit ]
   ]
   can-convert: func [_to] [ find conversions _to ]
   convert: func [amount _to /local formula] [
      formula: select/case conversions _to
      if formula [
         run-formula formula amount
      ]
   ]
]
```

rebolek

[15:47](#msg5a4511f65355812e572804ae)@maximvl I've tried this code:

```
units: context [
	graph: context [
		week: make unit [base-unit: "s" conversions: ["s" 604800.0]]
		day: make unit [base-unit: "s" conversions: ["s" 86400.0]]
	]
]
```

but then I get `7.0` when dividing

maximvl

[15:48](#msg5a451230c072deaf0b0ff7ec)so I have this now

```
unit: object [
   type: 'unit
   conversions: none
   base-unit: none
   init: does [
      conversions: make map! []
   ]
   base-unit-value: does [
      probe select/case conversions base-unit
      if base-unit [ select/case conversions base-unit ]
   ]
]

>> units/graph/week/base-unit-value / units/graph/day/base-unit-value
604800.0
86400.0
== 1.0
```

[15:49](#msg5a451292edd2230811e90efd)I really don't want to say this, but

[15:49](#msg5a4512960163b0281089977e)probably we have a bug

rebolek

[15:50](#msg5a4512c55355812e572808af)You can try `do reduce [units/graph/week/base-unit-value '/ units/graph/day/base-unit-value]`

maximvl

[15:50](#msg5a4512e303838b2f2a46a650)@rebolek try this

[15:51](#msg5a451300ba39a53f1aaf91fc)

```
>> week: make object! [
        type: 'unit
        conversions: #(
            s: 604800.0
        )
        base-unit: 's
        init: func [][
            conversions: make map! []
        ]
        base-unit-value: func [][
            probe select/case conversions base-unit 
            if base-unit [select/case conversions base-unit]
        ]
    ]
>> day: make object! [
        type: 'unit
        conversions: #(
            s: 86400.0
        )
        base-unit: 's
        init: func [][
            conversions: make map! []
        ]
        base-unit-value: func [][
            probe select/case conversions base-unit 
            if base-unit [select/case conversions base-unit]
        ]
    ]
>> week/base-unit-value / day/base-unit-value
604800.0
86400.0
== 1.0
>>
```

rebolek

[15:52](#msg5a451344c072deaf0b0ffd2b)I get `7.0`

[15:52](#msg5a451351232e79134d9eb257)Let me try with different build.

maximvl

[15:52](#msg5a45135603838b2f2a46a85e)

```
>> system/build/date
== 27-Dec-2017/13:48:35+01:00
```

rebolek

[15:53](#msg5a451367c072deaf0b0ffdca)I have older build.

[15:53](#msg5a4513710163b02810899ca2)I suspect it is related to bug I reported recently.

maximvl

[15:53](#msg5a45138de43a7a150cb5237e)this really worries me that we are getting such obscure bugs

[15:54](#msg5a4513cdb48e8c356675a2bf)imagine self hosting with such bugs

rebolek

[15:55](#msg5a4513f8edd2230811e918c1)See this bug https://github.com/red/red/issues/3156 there is also reference to commit that introduced this bug, you can try building older console to see if it's related.

[16:01](#msg5a451543e43a7a150cb52c1b)@maximvl There's a reason why Red is still in alpha.

maximvl

[16:02](#msg5a4515b25355812e572817f5)@rebolek probably it's related:

```
>> units/convert2 1 'week 'day
604800.0

*** Runtime Error 1: access violation
*** at: 08074D8Fh
```

[16:03](#msg5a4515c6c072deaf0b100d5a)this is when I rewrote to

```
a: from-unit/base-unit-value
b: to-unit/base-unit-value
(n * a) / b
```

[16:04](#msg5a45162803838b2f2a46b62e)I added a comment in your ticket

[16:07](#msg5a4516cab48e8c356675b3ca)@rebolek do you know any workaround?

rebolek

[16:09](#msg5a45172ec072deaf0b101490)@maximvl I use older build. This is pretty serious bug and prevents lot of stuff.

maximvl

[16:10](#msg5a45175bedd2230811e92939)yeah, I don't get what's the cause though

rebolek

[16:13](#msg5a4518215355812e57282383)Looking at the commits it seems that Nenad changed some stack behaviour when fixing some reactive bug and this change introduced this regression.

maximvl

[16:13](#msg5a45183fc072deaf0b1019da)ok, hopefully we will get a fix some day :D

rebolek

[16:14](#msg5a45184e03838b2f2a46c0d9)Hopefully before Red/C3 ;)

maximvl

[16:14](#msg5a451851b48e8c356675babd)meanwhile I made my stuff work:

```
>> units/convert2 1 'week 'day
== 7.0
>> units/convert2 1 'week 'hour
== 168.0
>> units/convert2 1 'uranusyear 'hour
== 736491.672036
>> units/convert2 1 'uranusyear 'day
== 30687.1530015
```

[16:15](#msg5a451888edd2230811e9348e)will finish the library an a weekend

[16:15](#msg5a45188f232e79134d9ecbf2)Red is getting a universal converter

[16:15](#msg5a45189d03838b2f2a46c28d)(actually I just steal everything from `units` unix utility :))

[16:19](#msg5a45198aba39a53f1aafb363)

```
>> units/convert 1 'earthmass 'moonmass
== 81.30058827479664
```

[16:19](#msg5a45198b29ec6ac31192de60)nice

rebolek

[16:23](#msg5a451a66e43a7a150cb547af)Nice!

[16:23](#msg5a451a79232e79134d9ed488)is there a way to get list of supported units?

maximvl

[16:23](#msg5a451a8b232e79134d9ed4d4)there is :D

[16:23](#msg5a451a9803838b2f2a46cddf)

```
>> probe keys-of units/graph
[kg kilogram s second m meter A ampere amp cd candela mol mole K kelvin radian sr steradian US bit cm LENGTH AREA VOLUME MASS CURRENT AMOUNT ANGLE SOLID_ANGLE MONEY tonne t metricton quintal cc are a liter L l galvat angstrom xunit_cu xunit_mo angstromstar fermi barn shed svedberg spat sec minute min hour hr day d da week wk sennight fortnight blink ce watch bell decimalhour decimalminute decimalsecond beat circle degree deg arcdeg arcmin arcminute arcsec arcsecond rightangle quadrant quintant sextant sign turn revolution rev gon grade centesimalminute centesimalsecond milangle pointangle centrad sphere squaredegree squareminute squaresecond squarearcmin squarearcsec sphericalrightangle octant TEMPERATURE TEMPERATURE_DIFFERENCE degcelsius degC degfahrenheit degF degreesrankine degrankine degreerankine degR tempR temprankine degreaumur degK tempK atomicmassunit u amu amu_chem amu_phys dalton standardtemp stdtemp Rinfinity R_H bohrradius planckmass m_P deuteronchargeradius protonchargeradius electronmass m_e protonmass m_p neutronmass m_n muonmass m_mu deuteronmass m_d alphaparticlemass m_alpha taumass m_tau tritonmass m_t helionmass m_h kayser balmer abampere abamp aA biot Bi intampere intamp LUMINOUS_INTENSITY candle hefnerunit hefnercandle violle TIME anomalisticyear siderealyear tropicalyear eclipseyear siderealday siderealhour siderealminute siderealsecond anomalisticmonth nodicalmonth draconicmonth draconiticmonth siderealmonth year yr month mo lustrum decade century millennium millennia solaryear calendaryear commonyear leapyear julianyear gregorianyear islamicyear islamicleapyear islamicmonth mercuryday venusday earthday marsday jupiterday saturnday uranusday neptuneday plutoday mercuryyear venusyear earthyear marsyear jupiteryear saturnyear uranusyear neptuneyear plutoyear earthradius_equatorial sunradius astronomicalunit au solarmass sunmass sundist moondist sundist_near sundist_far mercurymass venusmass earthmoonmass marsmass jupitermass saturnmass uranusmass neptunemass plutomass earthmass moonmass oldmercurymass oldvenusmass oldmarsmass oldjupitermass oldsaturnmass olduranusmass oldneptunemass oldplutomass atomicmass atomiclength thermalvolt inch in foot feet ft yard yd mile line rod perch furlong statutemile league chain link ch intacre acre section township homestead engineerschain engineerslink ramsdenschain ramsdenslink gurleychain gurleylink wingchain winglink internationalyard fathom nauticalmile cable intcable cablelength marineleague pound lb grain ounce oz dram dr ushundredweight shorthundredweight shortton shortquarterweight shortquarter troypound troyounce ozt pennyweight dwt fineounce silversmithpoint appound apounce apdram apscruple usgallon usquart uspint usgill usfluidounce usfloz liquidbarrel beerkeg ponykeg winekeg petroleumbarrel barrel bbl ushogshead usfirkin usbushel uspeck drygallon dryquart drypint drybarrel cranberrybarrel heapedbushel wheatbushel soybeanbushel cornbushel ryebushel barleybushel oatbushel ricebushel canada_oatbushel ponyvolume jigger shot fifth wineglass magnum metricquart jeroboam rehoboam methuselah salmanazar balthazar nebuchadnezzar shoeiron shoeounce shoesize_delta shoe_men0 shoe_women0 shoe_boys0 shoe_girls0 europeshoesize buck fin sawbuck usgrand greenback key lid usfootballfield canadafootballfield brnauticalmile brcable admiraltymile admiraltycable seamile shackle clove stone tod brhundredweight longhundredweight longton brton brgallon brbarrel brbushel brheapedbushel brquarter brchaldron bag bucket last pottle pin puncheon seam coomb boll firlot brfirkin cran brwinehogshead brhogshead brbeerhogshead brbeerbutt registerton shippington brshippington freightton displacementton waterton strike amber imperialgallon imperialbarrel imperialbushel imperialheapedbushel imperialquarter imperialchaldron imperialwinehogshead imperialhogshead imperialbeerhogshead imperialbeerbutt imperialfirkin hide virgate nook englishcarat mancus mast nailkeg basebox metre litre geometricpace pace USmilitarypace USdoubletimepace fingerbreadth fingerleng
```

rebolek

[16:24](#msg5a451ab1232e79134d9ed55a)That's a long list :)

maximvl

[16:24](#msg5a451ac40163b0281089c5cb)yeah, well, many of them are synonyms

rebolek

[16:24](#msg5a451ad329ec6ac31192e4fb)can I convert ampers to I don't know, seconds? ;)

maximvl

[16:25](#msg5a451af929ec6ac31192e576)

```
>> units/convert 10 'ampere 's
*** Throw Error: no catch for throw: cant-convert
*** Where: throw
*** Stack:
```

[16:25](#msg5a451afce43a7a150cb54ab7):D

[16:26](#msg5a451b250163b0281089c79f)there is still a bunch of those which are quite hard to parse and handle

[16:26](#msg5a451b320163b0281089c80b)(at least for me)

[16:27](#msg5a451b5f0163b0281089c940)for example

```
thermalhenry            J K^2/W^2  # thermal inductance
osi                     ounce force / inch^2   # used in aviation
europeanUvalue          watt / m^2 K
```

greggirwin

[19:42](#msg5a454923b48e8c356676a6e2)@maximvl, the units stuff is very cool. I want an homage to Frink in Red. Also, I commented on your comment on the bug ticket.

x8x

[22:05](#msg5a456a920cef4fed2ebec38f)shouldn't these both return same result:

```
>> change "test" ""
== "test"
>> change/part "test" "" 1
== "est"
```

rebolek

[22:09](#msg5a456b7ee43a7a150cb6b23e)No, `change` gets length from `value`. In first case, that length is zero.

```
>> head change "test" ""
== "test"
>> head change "test" "_"
== "_est"
>> head change "test" "__"
== "__st"
>> head change "test" "___"
== "___t"
```

x8x

[23:07](#msg5a45793d0cef4fed2ebec3ed)@rebolek I guess you mean that without `/part` refinement, `/part` is equal to the length of the value so that:

```
change "test" ""
```

correspond to:

```
change/part "test" "" 0
```

I think I got mislead by `or position` in the description:  
`/part => Limits the amount to change to a given length or position`

rebolek

[23:28](#msg5a457e17232e79134da0acda)&gt;&gt; I guess you mean that without /part refinement, /part is equal to the length of the value

Exactly. Sorry for not being clear.

## Friday 29th December, 2017

x8x

[00:30](#msg5a458cb40cef4fed2ebec45b)@rebolek Very Thanks! :-)

toomasv

[04:21](#msg5a45c2ba03838b2f2a498725)@x8x The `position` part accounts for this:

```
>> change/part t: "test" "b" at t 2 t
== "best"
>> change/part t: "test" "b" at t 4 t
== "bt"
```

rebolek

[15:27](#msg5a465edf03838b2f2a4c2ed7)Issues can't be keys in maps? This is outrageous!

meijeru

[17:28](#msg5a467b20e43a7a150cbb38a0)Neither can refinements; these two "word-like" value type are treated differently from the rest.

rebolek

[18:07](#msg5a46845ab48e8c35667bfc5e)Interesting. I don't see why. `issue!` especially is such a great key.

## Saturday 30th December, 2017

greggirwin

[02:37](#msg5a46fbd9232e79134da6e689)I imagine it's because of the path syntax for accessing them being a problem. Think of them more like objects than blocks?

[02:38](#msg5a46fc1ae43a7a150cbd3f54)Also, if they are converted to plain words, you lose information.
