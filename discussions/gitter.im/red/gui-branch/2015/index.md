# Archived messages from: [gitter.im/red/red/gui-branch](/gitter.im/red/red/gui-branch/) from year: 2015

## Wednesday 12nd August, 2015

PeterWAWood

[10:17](#msg55cb1d4baac97ada66dd9d9e)@qtxie I tried DO function with a file in the reg gui branch. I seem to have a file path error:

```
mbp:Red peter$ ./test-console  docs/emit-reds-api-md2.red
hello
function
mbp:Red peter$ ./test-console
--== Red 0.5.4 ==-- 
Type HELP for starting information. 

red>> do %docs/emit-reds-api-md2.red
*** Error: File not found
```

[11:56](#msg55cb345eaac97ada66dd9ff1)@qtxie I've now got the latest commit and do %file works :-) but there seems a problem with supplying a file-name when running the console:

```
mbp:Red peter$ ./test-console  docs/emit-reds-api-md2.red
*** Script error: load does not allow binary for its source argument
*** Where: load
mbp:Red peter$ ./test-console
--== Red 0.5.4 ==-- 
Type HELP for starting information. 

red>> do %docs/emit-reds-api-md2.red
hello
function
```

qtxie

[11:57](#msg55cb34b147c6144d3511fe7c)Ok. I'll have a look at it.

PeterWAWood

[11:59](#msg55cb353aaac97ada66dda012)Thanks.

## Sunday 16th August, 2015

WiseGenius

[14:31](#msg55d09ec2255950880cfbbd8a)In XP, view-test's last face initially looks like this:

[14:31](#msg55d09eca057d8c9d3a6d987d)\[!\[transparent.png](https://files.gitter.im/red/red/gui-branch/z051/thumb/transparent.png)](https://files.gitter.im/red/red/gui-branch/z051/transparent.png)

[14:31](#msg55d09eda3d8917890c1642f6)When the window loses focus, it changes permanently to this:

[14:32](#msg55d09ee835e3e09b3adaf49b)\[!\[opaque.png](https://files.gitter.im/red/red/gui-branch/nycM/thumb/opaque.png)](https://files.gitter.im/red/red/gui-branch/nycM/opaque.png)

dockimbel

[14:34](#msg55d09f5c204de35b42305122)@WiseGenius Thanks for reporting it. Trying it on Win7, I get the same results but only when the window is minimized first, then brought back.

[14:49](#msg55d0a2e49b45e15c4264718e)@WiseGenius Issue fixed.

WiseGenius

[14:53](#msg55d0a3ff255950880cfbbdec)That was quick! Yes, it works here too now.

dockimbel

[14:56](#msg55d0a4bb255950880cfbbdfe)@WiseGenius Good. :)

## Thursday 20th August, 2015

WiseGenius

[09:31](#msg55d59e8811c7afc249787755)\[!\[blob](https://files.gitter.im/red/red/gui-branch/rYWy/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/rYWy/blob)

pekr

[09:41](#msg55d5a0c931c67ec1498a2b0f)So we have got MS Wordpad integration already :-)

dockimbel

[10:47](#msg55d5b0430d29ce8f44b717fe)@WiseGenius Interesting effect. :-)

[10:50](#msg55d5b0feb421ebcb0dade595)@WiseGenius I'm trying to reproduce it on my XP image, but it works fine. What do you mean precisely by "deactivating the window"?

WiseGenius

[10:51](#msg55d5b1290d29ce8f44b71812)Switching to any other window, or clicking on the taskbar.

dockimbel

[10:53](#msg55d5b1b0f4d6ddcc0d91ffe2)@WiseGenius I can make the Draw output disappear by clicking away from the window, though, I couldn't get it to draw over another window yet.

WiseGenius

[10:55](#msg55d5b21bb421ebcb0dade5c7)Drawing over other windows doesn't happen every time, but the disappearence usually does. I've got the same happening on another XP computer.

dockimbel

[11:02](#msg55d5b3bde3dd189044339e35)I'll let @qtxie have a look at that issue.

## Sunday 23th August, 2015

qtxie

[01:38](#msg55d9240da6bcd88940688930)It seems a bug when using some GDI+ functions with WS\_EX\_COMPOSITED style on Win XP.

WiseGenius

[04:09](#msg55d9478736e894436a9aa571)New issue (on XP and Virtual Win 7):

```
REBOL/View 2.7.8.3.1 1-Jan-2011
Copyright 2000-2011 REBOL Technologies.  All rights reserved.
REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM


Type desktop to start the Viewtop.
>> do/args %red.r {-d %tests/view-test.red}
Script: "Red command-line front-end" (none)
Script: "Encap virtual filesystem" (21-Sep-2009)

-=== Red Compiler 0.5.4 ===-

Compiling /C/Tests/2015-08-23-13-47/red-gui/red-gui/tests/view-test.red ...
Pre-compiling compression library...
Script: "Red/System PE/COFF format emitter" (none)
...compilation time : 424 ms

Compiling to native code...
*** Compilation Error: return type missing in function: red/platform/prin-float*
*** in file: %/C/Tests/2015-08-23-13-47/red-gui/red-gui/system/runtime/utils.reds
*** in function: _print
*** at line: 78
*** near: [red/platform/prin-float* fp/value]
>>
```

dockimbel

[04:25](#msg55d94b4404a67300316246b4)@WiseGenius Issue fixed.

WiseGenius

[04:42](#msg55d94f2d04a67300316246e0)Confirmed on both.

## Friday 28th August, 2015

PeterWAWood

[08:34](#msg55e01d2daa53caef647d3f01)There seems to a small problem with write on OS X:

```
red>> system/platform
== MacOSX
red>> write %test.txt "This is a test"
*** Access error: cannot open: test.txt
*** Where: write
```

[08:36](#msg55e01d7ccbf802f022f0c426)Currently read of HTTP doesn't seem to support re-directs. I'm guessing that this will not be introduced until Red 0.7.0.

```
red>> read http://bbc.co.uk
== ""
```

dockimbel

[09:54](#msg55e02fbdcbf802f022f0c6d0)@PeterWAWood Do you have write access to the working folder?

PeterWAWood

[09:58](#msg55e030d2ed5c1a937b95ba4e)@dockimbel Yes, I do have write access to the directory:

```
mbp:Red peter$ ./test-console
--== Red 0.5.4 ==-- 
Type HELP for starting information. 

red>> write %text.txt "text"
*** Access error: cannot open: text.txt
*** Where: write
red>> quit
mbp:Red peter$ rebol
>> write %text.txt "text"
>> read %text.txt
 == "text"
>> what-dir
== %/Users/peter/VMShare/Languages/Red/
>> delete %text.txt
```

## Monday 31st August, 2015

WiseGenius

[14:47](#msg55e4690170e051b716389d08)@dockimbel In the console compiled from the gui branch on XP and virtual Win7:

```
red>> system

*** Runtime Error 1: access violation
*** at: 00419D9Ch
```

Works fine in the master branch.

dockimbel

[14:51](#msg55e469dd3d8fc2d12eaa77fe)@WiseGenius Thanks for the report.

[14:59](#msg55e46bed56211cd86f86c129)It's caused by extra View-related datatypes not fully defined if the View module is not imported. Just a side-effect of unfinished integration of View module.

WiseGenius

[15:05](#msg55e46d4f70e051b716389dc5)Right.

## Wednesday 2nd September, 2015

WiseGenius

[14:59](#msg55e70eedd231aa8e5918c46f)Not sure if this needs reporting: that `make`ing a `face!` whose `type` doesn't exist has an access violation at runtime.  
Example: Putting the following code somewhere in `view-test.red`:

```
make face! [
	type: 'dark-energy text: "I'm just a fudge factor!" offset: 0x0 size: 120x30
]
```

And compiling and then running gives:

```
Windows XP build 2600
slider changed: 25%
gui/find-class failed

*** Runtime Error 1: access violation
*** at: 004547D3h
```

dockimbel

[21:17](#msg55e76779f6fb4f034f6b645c)We haven't implemented yet user-level error throwing for common errors.

## Thursday 3th September, 2015

iArnold

[11:24](#msg55e82dfad231aa8e5918ef61)When I strip the example view-test.red and try to change the canvas/draw, adding a lot of lines, before the window is shown, this doesn't work. probe win/pane gives all info on the faces on there but there is no reference to canvas as being one of them so probe win/pane/canvas results in a none value. And as a consequence win/pane/canvas/draw cannot be set for path on a none is not possible.

Oldes

[11:27](#msg55e82ea1a75db4b375c3d17e)@iArnold Instead of verbally describing something, you should use https://gist.github.com/ and post your not working script there. Else nobody knows what you are really messing with and potentially help you.

iArnold

[11:39](#msg55e8317717b2081605a58329)I am already posting my example on the mailing list and you beat me to saying that here.

[11:51](#msg55e834514d3425403fb97017)As the canvas is the second item in my example I have a working workaround using win/pane/2/draw: \[ a lot of lines here ]

Oldes

[12:34](#msg55e83e56faa620f25267dc82)@iArnold I've send you the reply. In short, use just

```
canvas
```

instead of

```
win/pane/canvas
```

And go again into a Rebol school for a while. :)

iArnold

[12:51](#msg55e84263a75db4b375c3d4a3)Thank you for your reply David. I had not noticed the reduce for win/pane. So actually canvas is declared when the reduce is done.  
Where can students apply?

[14:40](#msg55e85bd1d231aa8e5918f837)How about transparent support? And is support for drag and drop present? Do you have examples headmaster Oldes? ;-)

pekr

[16:29](#msg55e8756205f4097b40f6c22e)not sure, but drag and drop is most probably not present. What I do remember, it is some kind of cutome widget events, so that you could create your own widgets. Transparency is not there too, well, if you mean top level window. As for images, I expect alpha channel being supported.

iArnold

[19:10](#msg55e89b389a0e5c6e6810f694)Yes png with transparent is displayed ok. There is an offset reported when mousedown and mouseup events are fired, the button can move, so drag and drop should be closeby.

[19:11](#msg55e89b6980f234ec149dbdc9)Just trying to push it to the limits, no, through or beyond.

## Friday 4th September, 2015

WiseGenius

[06:35](#msg55e93bacc473234d41df59ee)@iArnold By “support for drag and drop”, do you mean drag and drop between different applications, or simply dragging the button around within the pane?

iArnold

[07:43](#msg55e94b8dfaa620f2526805ba)I mean the last, yes. As you perhaps know I am interested in moving chess pieces around a chess board.

[19:27](#msg55e9f08d3277de1c4fe35f55)I tried on-down and on-up and I managed to get results, but offset more or less was constant the offset of the image used. Need some general action on mousemove to complete let the image follow the mousemovement, or at least an offset on a parent element or relative to start to move a face over to the desired place. It was a busy day today.

[19:53](#msg55e9f69d59f9cd5958b990b3)Managed to get a reaction on on-down and on-up actors. But offset values I can get to are the ones of the object itself. So almost there but need now to get the image to follow the offset of the mousecursor offset value while mousedown.

[19:54](#msg55e9f6e03277de1c4fe35f89)Ah that was meant for another discussion, like I said it has been a busy day today.

## Sunday 6th September, 2015

X4

[00:10](#msg55eb848024228c321f1ae6f7)Can you tell me if it's already possible to implement a fileWatcher for Windows that runs another process in threads, when new files with a given file extension are found in a directory. The four parameters: directory, extension, process and thread count should be configurable via the GUI.

gchiu

[02:55](#msg55ebab13941cb60657c7712e)Bo has something like this that was written a while ago in red/system I think

X4

[19:16](#msg55ec910aece6c2581e08ff92)@gchiu sounds cool, is it online anywhere?

## Monday 7th September, 2015

gchiu

[06:26](#msg55ed2e13d92b7f6f11d412cc)@X4 I believe it's a commercial product so the source is not available

[06:28](#msg55ed2e8d2e48d88a543dc443)look here for some information http://rebol.info/altme/105/announce

## Wednesday 9th September, 2015

iArnold

[07:54](#msg55efe5be532e5edc65553ec1)@qtxie I shared my newest progress on the drag and drop with you on AltME.

WiseGenius

[12:53](#msg55f02be7773a9de16f2d079f)@dockimbel It seems that the 4th value in a Red colour denotes opacity as it does in Rebol 3, CSS, RGBA, etc., and not transparency as it does in Rebol 2.  
If so, then it follows that the default 4th value should “full” (`255`) as it is in Rebol 3, CSS3, etc.  
However, this does not seem to be the case:

Red sets opacity to `0` as though it were the default:

```
red>> img1: make image! 1x1
== make image! [1x1 #{
000000}]
red>> pick img1 1
== 0.0.0.0
```

Rebol 3, as expected, sets to full opacity as default:

```
>> img1: make image! 1x1
== make image! [1x1 #{
000000
}]

>> pick img1 1
== 0.0.0.255
```

Red hides an opacity of `0`, as though it were the default:

```
red>> img2: make image! [1x1 #{000000} #{00}]
== make image! [1x1 #{
000000}]
```

Rebol 3, as expected, displays an opacity of 0, since it isn't default:

```
>> img2: make image! [1x1 #{000000} #{00}]
== make image! [1x1 #{
000000
} #{
00
}]
```

Red displays an opacity of `255` as though it were not default:

```
red>> img3: make image! [1x1 #{000000} #{FF}]
== make image! [1x1 #{
000000} #{
FF}]
```

Rebol 3, as expected, hides a full opacity, since it is default:

```
>> img3: make image! [1x1 #{000000} #{FF}]
== make image! [1x1 #{
000000
}]
```

Red sets the opacity to `0` when poking with a colour, even when the pixel was previously fully opaque:

```
red>> img4: make image! [1x1 #{000000} #{FF}]
== make image! [1x1 #{
000000} #{
FF}]
red>> poke img4 1 red
== 255.0.0
red>> pick img4 1
== 255.0.0.0
```

Rebol 3, as expected, sets the opacity to `255` when poking with a colour, even when the pixel was previously fully transparent:

```
>> img5: make image! [1x1 #{000000} #{00}]
== make image! [1x1 #{
000000
} #{
00
}]

>> poke img5 1 red
== 255.0.0

>> pick img5 1
== 255.0.0.255
```

I do wonder, though, if this last example should leave the alpha channel as whatever it was previously when the new value doesn't have one, instead of setting it to the default. It would make some operations easier. Worth a proposal?

[13:00](#msg55f02d7e6fe7b2a123ea8b45)P.S. I was using @qtxie's branch for the `pick` and `poke` functions, but other than that I think all the examples are the same in the main gui branch.

qtxie

[13:51](#msg55f0397e6fe7b2a123ea8d98)@WiseGenius Yes. You're right. We use opacity as in Rebol 3. I'll fix that.

iArnold

[14:26](#msg55f0419524362d5253fe652d)Would this fix the problem of transparent layers showing up as black?

qtxie

[15:56](#msg55f056a424362d5253fe6a2d)@iArnold What's the problem of transparent layers? The png picture with transparent layer look fine in the test.

iArnold

[19:17](#msg55f085c05a917c890e691d37)Yes, but there are two issues. One is when you start the image png outside of the silver pane, so it has a white background and move it toward the silver pane, when it goes over the silver the background of the png stays white.

[19:18](#msg55f08605f8fdc343106ebcbf)Second is making another pane over the original one making it transparent using color none. It will block the underlying pane with its black appearance.

[19:23](#msg55f08735f8fdc343106ebcc5)I used multiple pane technique in my rebol checkers program called dam. You can find that on rebol.org. Eh no the real program is on my site, the link is on your AltMe.

## Thursday 10th September, 2015

iArnold

[05:35](#msg55f116ad6adf53f87d0db2d0)But perhaps that png just has a white background, not 100% sure about that.

## Friday 11st September, 2015

Oldes

[12:21](#msg55f2c7674624296d78aec295)@qtxie are you aware about this issue with view under console? https://gitter.im/red/red?at=55f136e8f9ba4ed1186094c4

[13:19](#msg55f2d4c84624296d78aec537)The camera is not quite correct in the latest version - it blinks between camera image and just black color.

qtxie

[19:36](#msg55f32d2a5ba1e0ea6b80bd41)@Oldes FIxed on here: https://github.com/red/red/pull/1348

## Saturday 12nd September, 2015

iArnold

[06:19](#msg55f3c3ff7653576c61156e29)@qtxie If a transparent layer were possible .. I wanted to say that I could overlay one and find out the position myself, but the flashlight worked and I can use the canvas itself because that already catches the event. Really too bad I cannot work at this here, but I could perhaps prepare some code.

## Sunday 13th September, 2015

WiseGenius

[06:19](#msg55f5158873ecb93f5cdce737)In `draw`, `text` is always drawn in `black` rather than the `pen` colour.

[06:26](#msg55f5171ebea06a0828a2bfe0)And newlines in the string are ignored.

## Tuesday 15th September, 2015

iArnold

[11:28](#msg55f800d718e0111d7e4eebd1)How do you trigger a menu item event?

rebolek

[15:09](#msg55f8349afe4ca46810e1c484)You select an menu item?

iArnold

[20:08](#msg55f87aa75c29d81d60c6ae59)Spot on! But then! I am used that there will follow an action that was connected to the menu item. So I made a menu-functions block with the menu actions and blocks of actions and at on-menu actor I added: do select menu-functions event/picked  
I wanted amongst others a subwindow to open (think about an About window e.g.) it opens but closes immediately triggered by an on-click event (on the close button) It is all just like the view-test example, but without the button to trigger the window.

## Wednesday 16th September, 2015

rebolek

[05:30](#msg55f8fe8bf66d320b4fbdbef0)Can you post the code somewhere?

iArnold

[06:53](#msg55f911fca2c7aa6b1086b73c)Shared a folder on AltMe with you called RedGUIMenu

[11:06](#msg55f94d26f66d320b4fbdc88a)I noticed that you cannot comment out faces on the window(/pane/canvas) using comment {}. Commenting out using ; commenting fortunately does work.

Oldes

[11:55](#msg55f958c1a2c7aa6b1086c12f)Again... check this in Rebol:  
&gt;&gt; length? \[comment {foo}]  
\== 2  
&gt;&gt; source comment  
comment: native [  
"Ignores the argument value and returns nothing."  
value "A string, block, or any other value"  
]

[11:56](#msg55f958e7c588a0de6edec245)So yes... you cannot use

```
comment
```

in blocks.

[12:03](#msg55f95aa2a2c7aa6b1086c175)Rebol and Red don't have proper multi-line comment syntax.

[12:07](#msg55f95b83a2c7aa6b1086c19e)\_The comment function tells REBOL to ignore the following block or string. Note that string and block comments are actually part of the script block. Care should be taken to avoid placing them in data blocks, because they would appear as part of the data._  
http://www.rebol.com/docs/core23/rebolcore-5.html#section-4.3

WiseGenius

[14:48](#msg55f98151f66d320b4fbdd225)@dockimbel I just submitted a \[proposal](https://github.com/red/red/wiki/Use-1-based-Indexing-with-pair!) which would affect `pick` and `poke` on `image!`.

## Thursday 17th September, 2015

dockimbel

[02:19](#msg55fa232518e0111d7e4f4204)@WiseGenius Thanks.

## Friday 25th September, 2015

iArnold

[17:55](#msg56058a81a26c57d433a69517)I tried to create a dummy draw element called marker. Using this marker different parts of the 'draw blocks can be identified to help change it in a more dynamic way. This worked fine. But as a follow up I thought about multiple markers where the markers just are words that start with marker. So marker-1 or marker-start would be valid markers in a draw block. This I didn't get to work because the draw elements are encoded using sym: symbol/resolve w/symbol which I have trouble understanding.

[17:57](#msg56058b10a26c57d433a6951b)Perhaps the complete draw block should get prescanned and all markers should be changed to marker in that step? Or there is a much more elegant way?

## Saturday 26th September, 2015

dockimbel

[03:30](#msg5606114be85e8d337252fa84)@iArnold You should prescan the block and convert those marker words into block positions, no need to modify the Draw dialect implementation for that.

pekr

[07:21](#msg560647605064bb2c74d969db)Looking into the ownership branch - is that only about the face hierarchy, or general internal object hierarchy?

dockimbel

[07:26](#msg560648ae5c1379fe6459aba4)@pekr Can be used by any objects.

pekr

[07:27](#msg560648d95c1379fe6459aba6)ok, thanks!

iArnold

[08:15](#msg56065419554671b67bbefdf7)@dockimbel That was indeed the third option I had in mind.  
I must say I only need this feature because in R2 I would use an extra transparent layer to have that draw block changed and keep my hands of the other draw blocks. Making an extra layer now, results in overpainting the layer below it.

pekr

[09:11](#msg5606615a131b784f781ffc5e)Zulip looks impressive, although not so UI polished, as Gitter. What I don' like about the Gitter is, that you don't know the list of channels available. Zulip can do that, but we would need our own server, so no cloud service here?

[09:12](#msg5606616618e292ea40f75154)eh, should be in general chat group, sorry ...

## Wednesday 30th September, 2015

iArnold

[10:33](#msg560bba8cdfb3151302857bcb)When fill-pen is not used, I can make a circle where the center shows the background. Once I use the fill-pen ... how can it be reset to none/unset?

[10:36](#msg560bbb30081f3a9c044d96c0)Think I found it. Use off

[10:38](#msg560bbbbc95756f1402bca05e)Works.

## Thursday 1st October, 2015

Oldes

[08:37](#msg560cf0b2ff22c70f6fab80bd)@qtxie I don't know if its known issue, but in the current view-test on my Windows7 the camera is blinking between black and camera image when turned on.

[08:48](#msg560cf37a081f3a9c044dc502)@dockimbel it looks that calling

```
show
```

on button also fires it's action, which should not.... you can test it with my latest change of the

```
view-test
```

https://github.com/red/red/pull/1368

[08:49](#msg560cf39eff22c70f6fab810f)do you want to log an issue?

[08:56](#msg560cf536dfb315130285aa03)Also.. should not it be possible to add on-click actor for image? I know, I can catch

```
on-down
```

on image, but it's quite confusing that

```
on-click
```

is not there as it is for buttons.... I can imagine that many people can use images as buttons.

dockimbel

[09:34](#msg560cfe2edfb315130285ab3b)@Oldes Thanks, will have a look at it. No need to open GUI issues for now yet.

[09:35](#msg560cfe71552ed791327a27d8)@Oldes We'll have support for image in/as button, so it will stay as "button" style.

Oldes

[09:37](#msg560cfef2081f3a9c044dc6bf)@dockimbel it would be nice to have 9-slice support for the image/button later - http://rwillustrator.blogspot.cz/2007/04/understanding-9-slice-scaling.html

[09:38](#msg560cff22f4b61c106fb2f36e)... so one could make resizable bitmap butons easily.

[09:40](#msg560cff95552ed791327a2807)I vaguely remember it was supported in Rebol/View .. but its so many years back I did some View layout. Hmm... it was by using

```
extend
```

effect.

dockimbel

[10:06](#msg560d05bfdfb315130285ac56)@Oldes That was the "extend" effect in Rebol/View. We plan to support it, but effects won't be in 0.6.0. BTW, if someone wants to implement image effects in R/S for Red/View, he's welcome. :-)

iArnold

[12:58](#msg560d2e00dfb315130285b223)Does anyone have the link to QTXie's Mac window in Red/System. I cannot find it

dockimbel

[15:13](#msg560d4d83ff22c70f6fab908c)@iArnold It's \[here](https://gist.github.com/qtxie/bd0f03c49070944f447c).

fergus4

[15:34](#msg560d528adfb315130285babb)Is that the start of GUI work for Mac? Just some experimenting?

dockimbel

[15:54](#msg560d5718dfb315130285bb81)@fergus4 Just raw experimentation from qtxie. ;-) It shows that it should not be very difficult to make such GUI backend for Mac OSX too.

iArnold

[17:44](#msg560d70f35a0bd02131888aab)@dockimbel thank you, to be sure I don't have to look for it again, I forked it :-)

[17:49](#msg560d72375a0bd02131888ab6)It is almost impossible to find information on how to call functions in the cocoa API. Closest thing I found recently is http://www.cocoawithlove.com/2010/09/minimalist-cocoa-programming.html but that relies on gcc to compile the header stuff using the API to an executable. The work by QtXie is a great step towards having a VID for MacOSX.

[17:51](#msg560d729f5a0bd02131888abc)Today I heard a colleague of mine complaining about there being no real multiplatform solution for mobile development. There is still a void to be filled.

pekr

[17:51](#msg560d72b5081f3a9c044ddc66)There are some, web based ...

iArnold

[17:54](#msg560d7350f79814570842649c)But not for apps. He knows his development tools, and he may use anything to get the job done.

pekr

[17:58](#msg560d7433081f3a9c044ddcc4)I just read the czech report from the Disrupt conference (mostly start-ups, some crazy ideas, ppl trying to get investor attention), there was a young polish company, they claim to provide wysiwyg mobile development - Kinetise.com - https://www.kinetise.com/

[17:58](#msg560d745df4b61c106fb308b0)Haven't checked, so sorry if is not what we are talking about here ...

iArnold

[17:59](#msg560d7495f7981457084264ab)GUI is important for mobile development too. For me that qualifies.

[18:00](#msg560d74d8f7981457084264af)That kinesine is a magic tool! 'No programming required'!

[18:06](#msg560d76314e48bd6f613e5f27)(Sorry kinetise, kinnesinne is a Frisian word meaning jealousy.)

[18:11](#msg560d775b4e48bd6f613e5f34)For a moment I thought the smiley in the view-test.red example https://github.com/red/red/blob/gui/tests/view-test.red script was used as in the cookbook article https://web.archive.org/web/20120506101356/http://www.rebol.net/cookbook/recipes/0048.html but the image is encoded hexadecimal style and the coding splits it up into two parts.

## Friday 2nd October, 2015

PeterWAWood

[01:42](#msg560de120ef36415027430cc0)@iArnold  
&gt; Today I heard a colleague of mine complaining about there being no real multiplatform solution for mobile development. There is still a void to be filled.

iOS, Android and Windows 10 apps can be developed with Delphi.

[01:44](#msg560de188bd0a2d24271889e6)It will be better and more fun to build them in Red though :-)

iArnold

[05:25](#msg560e155bf79814570842670e)+1 here @PeterWAWood !! After a Delphi to Red convertion tool is made I'll tip him about Delphi.

## Monday 5th October, 2015

qtxie

[11:38](#msg5612611e0b9059c80b7a5d25)@Oldes I'll have a look at it. Thanks.

## Tuesday 6th October, 2015

Oldes

[09:55](#msg56139a9dce6e633c45189383)@dockimbel I think that current

```
do-events
```

should be reimplemented later, as used

```
GetMessage
```

call is blocking. When

```
no-wait?
```

is used,

```
PeekMessage
```

should be used instead... but that's just my 2c, I'm not even advanced in the Win32 api. https://github.com/red/red/blob/gui/modules/view/backends/windows/events.reds#L465

[09:56](#msg56139aebfd5c74d714140c1a)\_Unlike GetMessage, the PeekMessage function does not wait for a message to be posted before returning._

[09:57](#msg56139af6ff22c70f6fac4648)https://msdn.microsoft.com/en-us/library/windows/desktop/ms644936(v=vs.85).aspx

[10:07](#msg56139d6576d984a358756a7c)In other words - there should be separate version when no waiting is required.

dockimbel

[10:58](#msg5613a9487e53d02c09d01647)@Oldes That's temporary code, it will be trashed once we'll have the event loop for IO done. We can switch to `PeekMessage` once we have a real use for the `no-wait` mode.

pekr

[11:03](#msg5613aa967e53d02c09d0166b)@dockimbel - is there going to be something like the `rate`field in R2/View? I noticed it in the code, but then it got commented out? I know that it would come after the proper IO implementation, but just curious, if we will get it the same way, or you have some different ideas here?

dockimbel

[11:29](#msg5613b0b4ff22c70f6fac49c9)@pekr By default, we'll use the R2 model for `rate`, but I didn't have time yet to study R3's or other alternative models.

pekr

[11:30](#msg5613b0cb7e53d02c09d01730)R3 does not have rate IIRC :-)

[11:30](#msg5613b0f176d984a358756d60)But maybe @rebolek know more here ....

rebolek

[11:35](#msg5613b20d261e77ba2dbae897)No timers in R3 yet.

## Friday 9th October, 2015

pekr

[13:46](#msg5617c53f99bbd76f0f30857e)Have been away from digging into Red internals for quite some time (not that I would be smart enough to sort it out anyway :-) , but are we already (or going to be) able to create an own style? I mean - e.g. create own button? We have draw (though not effect pipeline hence no gradients till it comes), we can change colors and we have events. What kind of events do we support yet?

[13:47](#msg5617c5587d0c14ed2235fef9)I have found on-make, on-change, on-menu, on-click, on-select ....

rebolek

[14:18](#msg5617cc9f4e0fa3e55447d32d)What you are asking for requires functioning VID. But, yes, you can create your own button right now.

pekr

[14:22](#msg5617cdb61b0e279854bd9217)OK, thanks ...

rebolek

[14:28](#msg5617cef21b0e279854bd924d)Face is just an object, so it's easy to change :-)

[14:28](#msg5617cf084e0fa3e55447d3ae)But for some STYLIZE keyword you need to wait for VID.

pekr

[14:29](#msg5617cf4d0376066b0f8bd42e)well, yes. That's why I said, that testing View code is already quite nicely readable. But I am not sure, what kind of events are dispatched. I can see many events in the definition block, but not sure they are all passed-on. E.g. drag, move (over), etc.

rebolek

[14:32](#msg5617cff11b0e279854bd9294)I think just some basic events are passed now only. Haven't tested it yet.

iArnold

[19:36](#msg5618174f31152d97505d8173)Be aware that viewing the face the ones lower in the definition are shown on top of the ones defined earlier (last to first) and events are cought by the order from first to last.

pekr

[19:48](#msg56181a011b0e279854bda183)Hmm, is that so in Rebol too? I mean - what if the faces are clipping one each other? Do you still receive the even of the underlying layer (does it bubble up), or is the even clipped too?

iArnold

[21:37](#msg561833b231152d97505d81e9)They do not propagate (yet) but I used a shadow object that moves along the image on top to handle it.

## Sunday 11st October, 2015

pekr

[08:25](#msg561a1cfa6dc64436714ac09a)Just a note - reverse button does not reverse the color boxes anymore, mayme some regression?

dockimbel

[08:31](#msg561a1e5199bbd76f0f30c276)@pekr It's a regression from today's commits.

[08:47](#msg561a221d99bbd76f0f30c2bd)Fixed now.

pekr

[08:57](#msg561a245c6dc64436714ac11a)Fix working, thanx ...

dockimbel

[15:05](#msg561a7aa599bbd76f0f30c860)About 100 commits were merged into gui today. Face updating is now supported. Let us know if you find any big issues.

rebolek

[17:19](#msg561a9a1e99bbd76f0f30cb14)Wow, nice. Will test it ;)

## Monday 12nd October, 2015

iArnold

[08:16](#msg561b6c5b1b0e279854bded6a)Face updating meaning putting show face in an event will trigger the update immediately?

dockimbel

[08:19](#msg561b6cfc4e0fa3e554482e78)@iArnold Calling SHOW updates the face, like in Rebol/View.

Oldes

[08:27](#msg561b6eeaa15f996e24c48f6a)The \_change_ button action, which randomly modifies the text-list should be changed... I though it's some bug before I checked the source that it's expected.

dockimbel

[08:31](#msg561b6fe11b0e279854bdee09)@Oldes Changed how?

Oldes

[08:31](#msg561b6fe24e0fa3e554482efc)And there will be some bug.. sometimes the tab panels disappear

dockimbel

[08:32](#msg561b701b1b0e279854bdee19)@Oldes I haven't seen that issue here. How to reproduce it?

Oldes

[08:33](#msg561b704299bbd76f0f30e0f8)I also don't like how it clears the drop-list data... as you still have the button to select option 5 - which does not make sense when there are no options anymore:)

[08:33](#msg561b705183b69fe7548d9317)I just click change button multiple times

[08:33](#msg561b706883b69fe7548d9322)\[!\[blob](https://files.gitter.im/red/red/gui-branch/Eq9t/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/Eq9t/blob)

[08:33](#msg561b707583b69fe7548d9325)Here I pressed it for the first time and tabs are gone

[08:34](#msg561b709ea15f996e24c48fb2)Although when I come back, they are there again.

rebolek

[08:35](#msg561b70d41b0e279854bdee38)Btw, it would be nice of the view-test's window was bit smaller, the blank space at bottom is unnecesssary and thanks to it, it has troubles to fit on 768px tall screen.

dockimbel

[08:44](#msg561b72d899bbd76f0f30e168)@Oldes It's a "test" app, it's not a "user" app, creating weird states and seeing how the system reacts is exactly what we want.

pekr

[08:44](#msg561b72f41b0e279854bdee97)Yes, we wait for @rebolek to port his 1000cows :-)

dockimbel

[08:46](#msg561b73680376066b0f8c2dd3)@Oldes What does "when I come back" mean? We cannot reproduce that issue here.

WiseGenius

[08:49](#msg561b74334e0fa3e554482fb8)I can confirm that in both Windows XP and 7, clicking on change the first time makes the tabs disappear as above until they are redrawn. Eg. They are redrawn partially when the mouse hovers over them, and fully redrawn when switching focus between windows.

Oldes

[08:51](#msg561b748883b69fe7548d93af)\_when I come back_ means that I switch the window back to front.

[08:51](#msg561b74a9a15f996e24c4906a)\[!\[blob](https://files.gitter.im/red/red/gui-branch/b1US/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/b1US/blob)

[08:52](#msg561b74b91b0e279854bdeef0)But I can force the redraw just by moving mouse over it.

dockimbel

[08:52](#msg561b74bf4e0fa3e554482fcf)I can reproduce it if I switch my Win7 from Aero to the "Basic" theme you use.

rebolek

[09:13](#msg561b79ba4e0fa3e554483095)@pekr Hm, maybe it's finally the time :-)

pekr

[09:18](#msg561b7af3a15f996e24c49182)YES! :-)

iArnold

[12:00](#msg561ba0cd773bc4af20fef942)My transparent png images are not so transparent anymore in the newest gui

## Tuesday 13th October, 2015

dockimbel

[07:36](#msg561cb468d9a6c8414bf86d38)@Oldes I have pushed a fix \[here](https://github.com/red/red/commit/770cc54d80abe4413249a7fed186bd71711f95b5) for that issue. It works fine here when I switch to Basic theme.

Oldes

[07:42](#msg561cb5f5773bc4af20ff2271) \*\** Compilation Error: undefined symbol: hWnd  
\*\** in file: %/c/dev/git/red/modules/view/backends/windows/tab-panel.reds  
\*\** in function: exec/gui/refresh-tab-panel  
\*\** at line: 19  
\*\** near: [hWnd rect  
InvalidateRect GetClientArea hWnd rect 0

[07:43](#msg561cb6390376066b0f8c5ccc)@dockimbel you are not passing the handle there

WiseGenius

[08:29](#msg561cc0e5d9a6c8414bf86f04)Same error here on XP.

dockimbel

[08:34](#msg561cc22c83b69fe7548dc5e6)@Oldes Huh...sorry, last minute change before commiting...

[08:43](#msg561cc43899bbd76f0f31139b)Fixed now.

WiseGenius

[08:45](#msg561cc4c00376066b0f8c5ef8)Compiles, and the tab problem is gone in both XP and 7.

dockimbel

[08:48](#msg561cc572658d3721774400e7)@WiseGenius Thanks for prompt feedback. :+1:

Oldes

[08:49](#msg561cc5ab0376066b0f8c5f28)Right.. but I still have blinking camera.. which is not that much important as I don't like to watch myself anyway.

[08:50](#msg561cc5dc0376066b0f8c5f37)Btw... the application start is quite slow... is it possible to somehow debug, what may be the reason?

dockimbel

[08:52](#msg561cc63499bbd76f0f3113f3)@Oldes Is it still slow if you switch off the debugging info in view-test.red script?

[08:53](#msg561cc6710376066b0f8c5f59)I haven't tried it on slow hardware since a while, I will give it a try on my low-end tablet.

Oldes

[08:54](#msg561cc6b2658d372177440125)I think it's better. And it's not that much slow even with debugging.. no need to worry atm.

[08:56](#msg561cc72a658d372177440137)Actually the startup speed differs so it may be some OS thing.

[08:57](#msg561cc78cd9a6c8414bf87048)The question was more like if you know and use some utils, like ProcMon for testing.

dockimbel

[08:59](#msg561cc7e683b69fe7548dc704)I used a few, ProcMon and Spy++ mostly, but only for debugging purposes.

Oldes

[09:05](#msg561cc95a0376066b0f8c5fd0)It's possible that the sometimes slow speedup is related to my dual GPU... I can see quite a lot video related calls during the startup.

[09:06](#msg561cc99a99bbd76f0f31147e)Quite a lot like:

10:58:33.7213383 AM view-test.exe 24528 ReadFile C:\\ProgramData\\NVIDIA Corporation\\Drs\\nvAppTimestamps SUCCESS Offset: 6,884, Length: 8  
10:58:33.7213457 AM view-test.exe 24528 ReadFile C:\\ProgramData\\NVIDIA Corporation\\Drs\\nvAppTimestamps SUCCESS Offset: 6,892, Length: 4  
10:58:33.7213535 AM view-test.exe 24528 ReadFile C:\\ProgramData\\NVIDIA Corporation\\Drs\\nvAppTimestamps SUCCESS Offset: 6,896, Length: 184

[09:07](#msg561cc9da0376066b0f8c5fe4)For real demo I would put the camera widget into the subwindow if possible.

dockimbel

[09:16](#msg561ccbe9d9a6c8414bf8710f)Tested on my Win8.1 tablet with Atom CPU and slow GPU, startup time is same as on my big Win7 box (at least, cannot tell the difference).

Oldes

[09:16](#msg561ccbffd9a6c8414bf87117)Right... I can confirm that commenting out the camera widget, the startup is immediate while when the camera is there (even not active) I have startup lags (like 1s)

dockimbel

[09:17](#msg561ccc36d9a6c8414bf8711e)I don't have that 1s delay here. But, as there is no standard way to access the camera on Windows across OS versions, it might improve once we add other APIs support.

Oldes

[09:18](#msg561ccc4c83b69fe7548dc7ce)But I have and will not be alone:)

[09:18](#msg561ccc6b99bbd76f0f311505)I would put the camera widtget out of the default demo as it's not stable anyway.

[09:19](#msg561ccc98773bc4af20ff2617)I can send you logs from procmon with camera enabled and without the camera, if you want.

WiseGenius

[09:19](#msg561cccafd9a6c8414bf87131)It's not a demo. It's a test.

dockimbel

[09:19](#msg561cccb9658d372177440225)It's very stable and working fine on all the Windows hardware we have here (and we have very different ones, including Apple hardware). And right, as @Wisegenius points out, it's a test script that we need for development, it's not a demo.

Oldes

[09:21](#msg561cccfe773bc4af20ff2630)Demo or test... I just wanted to tell you, that it's not good as you think.

dockimbel

[09:21](#msg561ccd21658d37217744023b)@Oldes Read my comment above about API support. We \*know* it currently doesn't work on every Windows platform.

Oldes

[09:30](#msg561ccf21d9a6c8414bf8719c)@dockimbel @qtxie just in case somene would like to investigate, here are 2 procmon logs, first one without camera in the test, the second including camera.  
https://gist.github.com/Oldes/21afeaed33573e54346f/revisions

dockimbel

[09:41](#msg561cd1bc0376066b0f8c6150)@Oldes Thanks, @qtxie will have a look at it when we'll add other API support.

## Saturday 17th October, 2015

WiseGenius

[17:07](#msg5622805503c6b52d3c597bee)Before `text 40x6 "Hello Red :-)"`, the last `pen` color was `blue`. Yet, when commenting out the 2 lines below, the text turns black, and the `anti alias` checkbox still has no effect on the text.

```
font-A: make font! [
	name: "Comic Sans MS"
	size: 14
	;color: blue
	style: [bold italic underline]
	;anti-alias?: yes
]
```

## Sunday 25th October, 2015

WiseGenius

[09:16](#msg562c9de7f2adcffe367f7004)On my i5-4440 desktop, the “Drag me” button has noticable... drag... latency when being dragged over the canvas while the “anti alias” check box is checked. Even more so if both “anti alias” and “Debug?” are checked at the same time. If “anti alias” is not checked, then I personally can't perceive any latency, even if “Debug?” is checked, and even if I test on my 1.60GHz laptop.

rebolek

[09:30](#msg562ca120f2adcffe367f703e)on my i3-2310M in XP VM, I can't see any latency with or without antialias/debug

dockimbel

[09:42](#msg562ca4075e0024c823b6e600)@WiseGenius Thanks for reporting it. We'll try to reproduce it on slower configs.

[09:43](#msg562ca444dd7fb14516cfc90d)@WiseGenius Which graphic card do you have? Do you use card vendor's drivers or Microsoft's default one?

WiseGenius

[09:57](#msg562ca79aeec098f92cc29116)On my desktop, I have nVIDIA GeForce GT 630, 2GB. On my laptop, I have Mobile Intel(R) GMA 950. The Driver providers are NVIDIA and Intel Corporation respectively.

[09:57](#msg562ca7a1eec098f92cc29117)Just to clarify, I have the exact same latency issue on both.

dockimbel

[10:06](#msg562ca9c1f67aa4d236ca250e)@WiseGenius Thanks for the info. You're using XP on both?

WiseGenius

[10:08](#msg562caa2848fc9e2d6fe8d602)Yes.

dockimbel

[10:10](#msg562caa8bf2adcffe367f710c)@WiseGenius Is Aero theme active or disabled (Basic Theme mode)?

WiseGenius

[10:15](#msg562cabb6f67aa4d236ca252a)\[!\[themes.png](https://files.gitter.im/red/red/gui-branch/e7kn/thumb/themes.png)](https://files.gitter.im/red/red/gui-branch/e7kn/themes.png)

[10:16](#msg562cabe5d73f9e4f3b1bb9ed)Is that what you mean? They're both the same. The modification is just that my desktop is black instead of having a background.

[10:16](#msg562cac1beec098f92cc29132)In a strange twist, when I run it in Windows 7 in a virtual machine in XP on my desktop, I don't get any latency.

dockimbel

[10:40](#msg562cb197f2adcffe367f71ba)@WiseGenius Yes, so you have Aero theme on.

pekr

[12:07](#msg562cc60c5e0024c823b6e6d9)I noticed that too, but thought that it is related to Debug info printing into the console, which might be slow. I have Core i5 notebook, 8GB RAM, Win10 64 bit. It is speedy enough to do some realtime video effects, so :-)

[15:25](#msg562cf45e5e0024c823b6e8e2)I can see words like `drag`being used in the actors ... Not sure what purpose it has, but if it is like flag, we could introduce general flags/tags block, where we could put various such flags, as resize, etc.?

dockimbel

[16:14](#msg562cffce48fc9e2d6fe8d960)@pekr There's no `drag` anymore, just `drag-on: 'down` setting. We could move it to an `options` facet though, the design is not fully done yet. I have many other facets to store somewhere, but I don't want to overload the face! object too much.

pekr

[19:13](#msg562d29bd48fc9e2d6fe8dbf2)As for the face object - R3 introduced the gob, for things, which did not need whole face object. Not sure it was utilised enough to really save on the memory.

[19:13](#msg562d29f348fc9e2d6fe8dbf6)What Carl introduced though, was facet vs the faced. The one was private to each instance, the other one was shared.

[19:15](#msg562d2a525e0024c823b6ebff)Later on Saphir reworked the gui and I remember elements like state, most probably to dave some computations/states, and tags.

[19:16](#msg562d2a715e0024c823b6ec02)Looling forward to the forthcomimg design decisions ....

[19:17](#msg562d2ab8f67aa4d236ca37c7)Ah those typos, typing in the cell phone, sorry ...

## Monday 26th October, 2015

pekr

[08:50](#msg562de949dd7fb14516cfd7e2)@dockimbel - I have a question towards the `options`. I can see, that `flags` were removed? Maybe the reason is, that flags are usually boolean, whereas you need to keep some values. But my question is a bit different - R3 used options to actually define parameters, user can set directly at VID dialect level. So my question is, if it is not an usefull word for the user level options? Here's an example of the style in R3:

[08:50](#msg562de96cdd7fb14516cfd7e9)button: clicker [

about: "Single action button with text."

tags: \[action tab]

facets: [  
init-size: 130x24  
text: "Button"  
text-style: 'button  
max-size: 260x24  
min-size: 24x24  
text-size-pad: 20x0  
]

options: [  
text: \[string! block!]  
bg-color: \[tuple!]  
init-size: \[pair!]  
wide: \[percent!]  
face-width: \[integer!]  
]

actors: [  
on-set: [  
if arg/1 = 'value [  
face/facets/text: form any \[arg/2 ""]  
show-later face  
]  
]  
on-get: [  
if arg = 'value [  
face/facets/text  
]  
]  
on-draw: [  
t: get-facet face 'text  
; limit-text-size modifies, so we need to copy  
; size is made 20px smaller to incorporate "..." (see text-size-pad)  
l: limit-text-size copy t face/gob/size - face/facets/text-size-pad face-font? face  
set-facet face 'text-body either equal? length? t length? l \[t]\[join l "..."]  
do-actor/style face 'on-draw arg 'clicker  
]  
]  
]

[08:52](#msg562de9def2adcffe367f9dc9)Just a note - I don't want you to bother you with constant pointing to R3, etc., so please regard this question being just a suggestion worth looking into ...

Oldes

[09:15](#msg562def1ef2adcffe367f9ec7)@WiseGenius try to remove camera related lines 579-606 if it helps. The camera widget is problematic at least in my case.

dockimbel

[09:46](#msg562df658dd7fb14516cfd8e1)@pekr I don't see why we would need such construction in our VID, my plan is to let user extend OPTIONS directly from VID (basically merging facets and options into just options).

[09:49](#msg562df741f67aa4d236ca5480)@WiseGenius It seems that the high CPU usage when dragging over the canvas with alpha mode on is caused by Windows switching from GPU to CPU mode to render the canvas+alpha, resulting in a big slowdown. For alpha mode, we use a GDI+ window, so when the dragged face rendered using GDI overlaps with the canvas, Windows seems to be switching all to CPU rendering. We have can implement some counter-measures for that.

pekr

[09:50](#msg562df758f2adcffe367fa008)Well, the above code is from the Stylize function, so it is for a style authors, but what you propose sounds promissing ...

dockimbel

[09:52](#msg562df7f534e65add50eeaa05)I'm also thinking about moving the `para` fields to `face/options` too.

pekr

[10:22](#msg562dfed0f2adcffe367fa149)'para? Like in R2 VID?

dockimbel

[10:34](#msg562e01a7f2adcffe367fa1f2)Pretty much, yes, not sure where Rebol3 stores those values now.

pekr

[10:38](#msg562e02bf5e0024c823b6f61f)R3 is different. Minimal R3 GUI app takes cca 2MB, IIRC. With R2 VID, it was something like 6MB. R2 GUI was memory hungry, because the face was the smallest element. And it carried the fields you did not necessarily need. Hence R3 uses `gob!` primitive. It can be of several types - image, color, text, draw, effect. It has a `data`field, which stores a reference to a face, if any ....

[10:39](#msg562e02e85e0024c823b6f622)It allows for really streamlined GUIS, as especially with some more media oriented apps, you did not need all the wasted space, which is there with the face! type.

[10:40](#msg562e031b5e0024c823b6f626)Rebolek did 1000cows script, which showed a performance of an order of magnitude better, than R2. But it is also fair to say, that R3 switched to the fully AGG rendering, replacing old/initial RT View internal code :-)

[10:41](#msg562e0356d73f9e4f3b1bc986)More about R3 faces here - http://www.rebol.com/r3/docs/gui/faces.html (Carl's GUI, Saphir might differ)

[10:42](#msg562e0399f67aa4d236ca56ae)I think, that R3 does not use stuff like edge and para at all. Text is done via the `draw` and R3 GUI uses draw frames, to represent various widget visual states states:

[10:44](#msg562e041bdd7fb14516cfd9ae)Hmm, maybe not, dunno. I remember Carl talking about Flash frames like aproach. But maybe then a draw block was simplified, so no sub-states there ...

[10:44](#msg562e0423eec098f92cc2a1ee)http://www.rebol.com/r3/docs/gui/styles.html

[10:45](#msg562e046248fc9e2d6fe8e695)I really like how the style definition looks like ...

[10:48](#msg562e0513f2adcffe367fa2a3)Saphir R3 GUI is here - https://github.com/saphirion/documentation/tree/master/r3/r3-gui ... pity that it directly does not interpret make-doc :-)

rebolek

[11:01](#msg562e0810f67aa4d236ca578c)There was some work done on make-doc support.

## Tuesday 27th October, 2015

dockimbel

[09:41](#msg562f46b670e3dd4b5039d8f8)@WiseGenius This \[commit](https://github.com/red/red/pull/1404) should fix the slowdown of the dragged button when anti-aliasing is activated in the canvas.

WiseGenius

[16:03](#msg562fa04970e3dd4b5039f75d)@dockimbel Success. I can't detect any drag on any of my systems.

dockimbel

[16:05](#msg562fa0c4738e06e175f4491f)@WiseGenius Glad to hear that. :)

## Friday 30th October, 2015

pekr

[11:31](#msg56335517b1bb53dd75727d35)Ticking an anti-alias check-box removes the drawing - some kind of regression?

dockimbel

[11:41](#msg5633575ac60dc89d53ec8c8b)@pekr Yes, temporary regression.

iArnold

[13:39](#msg56337313195a24fc65bd4218)A transparent .png is transparent in browser but not in testprogram https://gist.github.com/iArnold/979411a137248580bb62

qtxie

[15:11](#msg56338891643ae8fb655b2052)@iArnold Comfirm the issue. Seems it is a regression.

iArnold

[15:52](#msg5633923a643ae8fb655b24af)(yes it was okay before we experimented with a primitive drag and drop) Drag and drop works nice now, afaict without any extra shadow objects.

[19:51](#msg5633ca349a3c5ec951cc22c5)The transparency problem is also visible on the draggable button on view-test.red testprogram.

## Monday 2nd November, 2015

iArnold

[09:01](#msg5637266de4bb7eee53802c0d)Noticed that arc is starting at "three o'clock", is it better to start at 12, for most use of this will be pie charting and most start at the top, now being -90.

[09:02](#msg563726ae9ecf3d082fc9afb2) fill-pen green  
pen green  
arc 100x100 80x80 -90 120 closed  
fill-pen yellow  
pen yellow  
arc 100x100 80x80 30 120 closed  
fill-pen red  
pen red  
arc 100x100 80x80 150 120 closed

dockimbel

[09:03](#msg563726e48afec94a69a8a5b8)@iArnold I personally also prefer when things start at 12 o'clock rather than 3 o'clock. ;-)

[09:04](#msg563727078afec94a69a8a5c2)@qtxie ^--- See the `arc` reference point issue.

iArnold

[09:07](#msg563727be195a24fc65bdf217)Must say I see a lot of progress last month. Time to embrace menu functions and merge into mainline ;-)

pekr

[09:11](#msg563728b1cfb11ae85306a359)The proof of concept is going to be, when you are going to be able to create e.g. a custom button style, like in R2 :-) Haven't tried that, but the functionality is there, at least I think - draw, events, keyboard, so should be possible? :-)

[09:11](#msg563728cde87b056a49cdcb83)note - not that I need such buttons, if we have native ones, it was just an example ...

iArnold

[09:17](#msg56372a3f195a24fc65bdf2a5)What I like is to be able to draw without the limitation of a window or a canvas. Use this to display a png as an opening image for your application, while it is "loading".

WiseGenius

[12:09](#msg563752818afec94a69a8b087)

```
red>> make image! [100x100 white]

*** Runtime Error 1: access violation
*** at: 00434F55h

red>> make image! [100x100 255.255.255]

*** Runtime Error 1: access violation
*** at: 0043663Ah

red>> make image! [100x100 1.2.3]
== make image! [100x100 #{
000000000000000000000000000000000000000000...
red>> make image! [100x100 0.0.0]
== make image! [100x100 #{
6D616B6520696D61676521205B3130307831303020...
```

Oldes

[12:39](#msg5637596dcfb11ae85306a6fc)@WiseGenius missing asserts (and features) here https://github.com/red/red/blob/gui/runtime/datatypes/image.reds#L261

iArnold

[12:48](#msg56375b89e87b056a49cdcf3d)I have tried to make a line grow slowly, the idea was to make a base for a Hanoi tower to slide into view block by block and then have text show up "Red makes programming fun (again)!"

[12:53](#msg56375ce03de26ed07395fd2c)Perhaps a little demo game is possible: have 3 blocks (Red draggable buttons) on the screen and they have to be dragged to an outlined Red Hanoi Tower starting with the bottom block. When the tower is finished, the demo "Game" is over and Red advertisement is shown.

dockimbel

[13:05](#msg56375faee87b056a49cdcfaa)@qtxie We need some image spec block type checking and proper error firing.

## Tuesday 3th November, 2015

WiseGenius

[03:28](#msg563829c2a530033014e3b470)

```
red>> make image! [1x1 1.2.3]
== make image! [1x1 #{
010203}]
red>> make image! [1x1 1.2.3.4]
== make image! [1x1 #{
010203} #{
04}]
red>> make image! [1x1 1.2.3 4]

*** Runtime Error 1: access violation
*** at: 00434F82h
```

dockimbel

[04:36](#msg563839e2a530033014e3b634)@WiseGenius Should be fixed now by the latest PR from @qtxie.

pekr

[16:18](#msg5638de53c74a90c744791bb6)why isn't EVT\_MOVING called just EVT\_MOVE, plain and simple? :-)

dockimbel

[16:30](#msg5638e10bdcafd1f07508521a)@pekr See the new commit and you'll get your answer.

pekr

[16:31](#msg5638e156dcafd1f07508523c)thanks ... so it is for the just occuring state, something like stuff being just dragged, etc.

dockimbel

[16:32](#msg5638e1a5c74a90c744791c2b)It's for covering different needs, MOVING is triggered on every change of position while you hold the mouse button down, while MOVE event happens only when the moving is finished.

[16:49](#msg5638e59864376ec44425e475)BTW, those events apply to windows only, not the widgets.

## Thursday 5th November, 2015

WiseGenius

[03:28](#msg563accc00800da954de6c306)I can no longer open view-test.exe:

[03:28](#msg563acccfc74a90c744794a80)\[!\[SetGestureConfig.PNG](https://files.gitter.im/red/red/gui-branch/ZmNc/thumb/SetGestureConfig.png)](https://files.gitter.im/red/red/gui-branch/ZmNc/SetGestureConfig.PNG)

[03:32](#msg563acdc80800da954de6c315)That's on XP. It does open on Windows7.

dockimbel

[03:43](#msg563ad04682077add3ea5a455)@WiseGenius The gesture supporting code is missing some conditional loading, will be added today.

[08:12](#msg563b0f8382077add3ea5a782)@WiseGenius A fix has been provided, let me know if you still have issues.

WiseGenius

[08:36](#msg563b15075680530d270486ca)@dockimbel When compiling, Rebol 2 gives me:

```
*** Driver Internal Error: Script Error : config has no value
*** Where: add-legacy-flags
*** Near:  [either config/legacy [
append config/legacy 'no-touch
] [
config/legacy: copy [no-touch]
]]
```

dockimbel

[08:37](#msg563b154da530033014e46e45)@WiseGenius Oops, sorry, I commited the wrong code... Will fix it in a few minutes.

[08:45](#msg563b170d5680530d27048740)@WiseGenius Please have a new try with latest commit.

WiseGenius

[08:48](#msg563b17de5680530d27048796)Working now.

dockimbel

[08:49](#msg563b18073872d66c6eafd6be)Great. :)

## Wednesday 11st November, 2015

pekr

[10:38](#msg56431ab904a883da3838f2f8)Not sure about the API used, nor if it is actually supposed to work with my Dell ntb trackpad, but for me the demo of pinch-2-zoom does not seem to work. My ntb does not have the real touchscreen though ....

[10:39](#msg56431ac6fa021fde389d09f2)If I test e.g. here, it works even with my Dell trackpad - http://scripty2.com/demos/touch/photofun/

[10:39](#msg56431ace94df6212290da2a4)Any tips?

WiseGenius

[10:48](#msg56431d1824b05a58349a5d3e)@pekr Don't have anything I could try it with myself, but now I'm wondering: Is it just on mine that the "Pinch me" text is hidden behind the red box? Or you too? Maybe that should be in the draw block?

pekr

[10:49](#msg56431d358b872257348e43f5)I can't see the Pinch me text either ...

dockimbel

[10:52](#msg56431dfb6420c33467a162d6)"Pinch me" text: we'll push soon a new implementation of the `base` face that will fix that. For the zooming support, the current code needs improvement, as the result is not accurate enough.

meijeru

[15:05](#msg56435957aff38af50a9d3b59)I have been comparing the widgets recognized by VID with the ones named in `platform.red` as well as the ones in `view-test.red`, and it turns out that VID recognizes `toggle` and `clock` which are not (yet) implemented, and does not recognize quite a few that are implemented as faces (`area, text-list, progress, slider, drop-down` etc.). I suppose that the alignment of VID and the totality of implemented face types is planned for 0.6.0?

Oldes

[15:08](#msg564359deaed85e09393da682)@meijeru the not implemented widgets in VID are from the early Android version... adding support for new widgets should be easy task for anybody with free time. Don't know if it will be part of the 0.6.0 release.

WiseGenius

[15:16](#msg56435bd3aed85e09393da730)@meijeru Seems VID is about to catch up with the very recent widgets: https://trello.com/c/OEQTvoRe/60-0-6-0-gui-support Don't know what will happen to `clock` though.

pekr

[15:30](#msg56435f1bbf9b7d0c39873aa7)Has anyone ever used a clock? :-)

Oldes

[15:32](#msg56435f7cbf9b7d0c39873ac9)Yes, on android (phone) it's quite important widget.

pekr

[15:32](#msg56435f91bf9b7d0c39873ad5)What does it mean - "important"?

[15:33](#msg56435fbcbf9b7d0c39873adc)If anything is really practically important, then it is a multi-columnt text list, splitters/containers, etc. :-)

Oldes

[15:33](#msg56435fd4aed85e09393da8b2)In my case, I use "clock" widget on my phone quite often - that means, that it is probably important to me. Again.. it is in VID from early Android view tests when Nenad probably used it for some demos.

pekr

[15:36](#msg5643607aaed85e09393da8f5)Well, I am not sure, if the widget we talk about, is the same widget. I can see plenty of clock widgets for Android around - some of them, being pretty complex - e.g. shared with weather, etc. So - is there a standard Android clock widget? I suppose there is. But then there is many other widgets, which maybe, don't even rely on the native one?

[15:36](#msg56436094bf9b7d0c39873b1f)As for VID, I expect it is not yet complete ...

Oldes

[15:42](#msg564361efbf9b7d0c39873b9c)Current "clock" widget is linked to android.widget.AnalogClock - https://github.com/red/red/blob/gui/modules/view/backends/android/gui.red#L82

WiseGenius

[15:46](#msg564362bfaed85e09393da9b6)&gt; Has anyone ever used a clock? :-)

Yeah, I think my great grand-parents might have. Their phones couldn't tell time back in those days. :P

Oldes

[15:46](#msg564362ddbf9b7d0c39873bee):)

pekr

[16:30](#msg56436d315f3db8f60ab60a02)Fun stuff aside, I doubt anyone of you ever used clock widget in your apps :-)

## Thursday 12nd November, 2015

dockimbel

[07:44](#msg564443466c5a8a9c75e2c662)@meijeru VID is under heavy work right now to bring it to a usable level and covering the set of widgets our Red/View can currently support.

WiseGenius

[14:23](#msg5644a0db4887dd5569874e41)The `'image` `face!` is still in this form in view-test:

```
data: [%./bridges/android/samples/eval/res/drawable-xxhdpi/ic_launcher.png]
```

Will this be taking an image type instead?

meijeru

[14:45](#msg5644a61b4754f94942862519)@dockimbel I am excited about the progress in VID. One thing I wondered: the `evt-names`table is a hash! with \*pairs* of entries, but the `find` that is done in order to make the appropriate actor seems to ignore that. Is there a danger that the user writes `click`instead of `on-click` and that the VID parser produces the wrong code?

## Friday 13th November, 2015

dockimbel

[03:14](#msg56455598bb11d0727958d712)@WiseGenius It can already take an image! value directly, so we just need to remove the code for that form.

[03:16](#msg5645560896589f4338672eee)@meijeru Right, a `find/skip` is required there to search in the second column only.

## Saturday 14th November, 2015

dockimbel

[06:16](#msg5646d1b78b242470793da0e0)About the current menu spec block, I am wondering if I shouldn't allow to put action blocks directly in the spec instead of word IDs. I didn't do it from the beginning because the ownership sub-system would have marked all the series in action blocks, resulting in many unwanted events. But now I think it could be possible to mark only the first level of the spec block and not dive into nested series, so action blocks could be possible. It would make menus coding much simpler, though, there might be some drawbacks, so let me know what you think about it.

iArnold

[08:57](#msg5646f797ff8948a01532e080)@dockimbel Do you have a coding example for this? I think that having large codeblocks are bad for oversight of the application, but having a redirection to a one-line command, in those cases I prefer to have the one-line command in place.

dockimbel

[09:21](#msg5646fd2896589f4338674cdf)@iArnold See the view-test.red script.

pekr

[09:47](#msg5647032610f6aea94fdda21e)this is always tricky. Carl allowed VID level reactors, Saphir removed them, and allowed any actor being exposed at the dialect level, which is nice, but then your code for the default action block is polluted with repeating: on-action \[action here]

[09:47](#msg5647033dfc923f4438d4592d)As menus can be nested, it is going to be a bit tricky to distinguish. And even if not, then still visually so.

[09:49](#msg56470390aca9bb7c6e50543b)I can see you already expose e.g. on-key ...

dockimbel

[09:49](#msg564703aebb11d072795931ca)@pekr You could have a prefix keyword for indicating that the block is a sub-menu and not an action.

pekr

[09:55](#msg564705046296df7f6efea748)I just briefly went thru the Saphir's Actor document - http://development.saphirion.com/rebol/r3gui/actors/index.shtml#

[09:55](#msg5647052996589f4338674d24)It seems to me, that default DO reactor is replaced by on-, so basically there can't be an action block, without prior on- "keyword"

[09:57](#msg5647056f10f6aea94fdda235)I don't understand their on-action default actor though, it is some internal stuff, not exposed to STYLIZE, and allows to call it from multiple real style actors ....

[09:58](#msg564705e0fc923f4438d4593e)I don't understand Red's aproach here: on one hand you allow direct action block, no keyword, nothing, e.g. `button "Hello" 100x40 [bar/data: random 100%]`

[09:59](#msg564706185b7a2ea84f0823cf)on the other hand I can see `field 120 on-key [if event/key = cr [probe do face/text]]`

[10:00](#msg5647064efc923f4438d45944)so - the question is, what do we want the standalone (no prior keyword) block to mean - e.g. submenu in the case of menu, or an action block ...

[10:01](#msg56470695fc923f4438d45947)Well, just brainstorming with myself, I have no clear preference. But the truth is, that when I looked into Saphir VID code, I was a bit nervous seeing tonnes of repeating on-action, on-action, on-action ...

[10:02](#msg564706c810f6aea94fdda240)I don't in fact understand the distinction of the actor and reactor, other than being in some internals. For me, in the case of VID level, those are keywords anyway ...

[10:03](#msg5647070910f6aea94fdda243)on-action is long ... Rebol uses DO ... why not use `do [my code here]` ? It would still be a repeating patter in our VID code, but at least a short one, and ppl immediatelly know, what the block does ...

[10:05](#msg56470785fc923f4438d45952)hmm, but requiring the DO keyword ... what about if you would like to use on-key directly, as in above example?

[10:06](#msg564707ad10f6aea94fdda247)Well, hopefully you can see some thoughts patterns from my self-brainstorming :-)

dockimbel

[10:10](#msg5647088fbb11d0727959322e)In our VID, a block with no prefix event handler name is linked to the default event, which is defined in system/view/VID/styles.

pekr

[10:10](#msg564708aebb11d0727959322f)well, then let's use DO for the default one?

[10:11](#msg564708c28b242470793da5e4)that way, you can use another subblock as another spec, e.g. for the menu

dockimbel

[10:11](#msg564708d2bb11d07279593232)It would be useless, and DO is already a keyword in VID (though not yet implemented in Red's version). By defining, a default action does not require any prefix word.

[10:32](#msg56470dd08b242470793da664)By defining =&gt; By definition

pekr

[10:33](#msg56470e0896589f4338674d64)Well, if above is true, and you need/want to use block for other purposes (e.g. submenu), you have to introduce a keyword, no?

[10:34](#msg56470e3d6296df7f6efea787)btw - what is DO going to do, if default action, as you state, does not require any special prefix word? Just curious ....

dockimbel

[10:36](#msg56470ec05b7a2ea84f08241f)@pekr Using a block as spec for a `menu` keyword is not a problem at all. The question for menus was for sub-menus definition vs action block.

[10:38](#msg56470f3296589f4338674d6d)@pekr Have a look at Rebol2 VID docs, DO was used to run regular code as last-minute init code once the layout is composed.

pekr

[10:40](#msg56470f9a8b242470793da696)well, R3 View introduced stuff like actors - on-set, on-get, on-make, on-init. Is anything like that planned for Red VID? But anyway, I feel ashamed about not knowing the meaning of R2 VID DO :-)

dockimbel

[10:45](#msg564710e210f6aea94fdda278)@pekr on-* event handler are already supported by Red VID. `on-make` is also supported, the rest is irrevelant in Red/View (at least for now).

pekr

[11:59](#msg56472206fc923f4438d45a64)@dockimbel - what is the new base face all about? I can see terms as a "layered window" etc. Is it a base face, you usually use to base your further style developments upon?

dockimbel

[12:23](#msg564727c210f6aea94fdda357)@pekr New implementation of the base face to enable transparency handling across Windows versions, and better composition of basic face elements.

pekr

[12:23](#msg564727d4bb11d0727959355e)ok, thanks ...

## Sunday 15th November, 2015

pekr

[10:01](#msg564857e38b242470793dceae)re `insert-event-func` - why is one func, the second one function? Any intention?

dockimbel

[10:20](#msg56485c72bb11d07279595bd3)@pekr Sorry, I don't understand what you mean?... Do you mean the function constructors for `insert-event-func` and `remove-event-func`?

pekr

[10:22](#msg56485cf3fc923f4438d4681b)Nothing important, just skimmed thru the commited sources, and noticed the slight difference:

[10:22](#msg56485cf510f6aea94fddb0ee)insert-event-func: function [

[10:23](#msg56485d096296df7f6efeb52c)remove-event-func: func [

dockimbel

[10:24](#msg56485d42bb11d07279595bf7)Well, both are valid constructors. I will change the second one to be `function` too, though, it's purely cosmetic.

WiseGenius

[17:21](#msg5648bf0caca9bb7c6e50667f)&gt; @pekr You could have a prefix keyword for indicating that the block is a sub-menu and not an action.

&gt; In our VID, a block with no prefix event handler name is linked to the default event, which is defined in system/view/VID/styles.

I saw this when I read the code and it made perfect sense to me.

[17:26](#msg5648c02f6296df7f6efeb927)@dockimbel Personally, I would \[allow action blocks directly](https://gitter.im/red/red/gui-branch?at=5646d1b78b242470793da0e0), but maybe I'm the only one?

dockimbel

[17:28](#msg5648c0c2bb11d0727959685d)@WiseGenius We use blocks following the menu item to specify sub-menus, so it would clash. On of those two needs a prefix to remove the ambiguity.

[17:29](#msg5648c0fcbb11d07279596871)I am about to release a very very cool new feature for VID, but not sure how many users will "get" it. :-)

pekr

[18:01](#msg5648c8836296df7f6efeb9a5)Eager to see it! :-)

dockimbel

[18:03](#msg5648c8ff5b7a2ea84f0837e8)@pekr Will push it in a couple of minutes.

pekr

[18:04](#msg5648c91910f6aea94fddb622)I still don't seem to understand. So for sub-menus, block with no keyword is used. DO is used for the kind of VID-post init (LAYOUT pre-init). So what are "normal" action blocks going to use?

dockimbel

[18:05](#msg5648c9625b7a2ea84f0837f1)@pekr Just a block (for the default action) or a `on-*` event name prefix followed by the body block.

pekr

[18:05](#msg5648c97c96589f4338676121)OK, so we do accept the "clash", that for menu, "just a block" means sub-menu, right?

dockimbel

[18:06](#msg5648c99696589f4338676123)@pekr No, we don't, that was the point of my post (in the case where we want to enable action blocks inside menu definitions).

pekr

[18:06](#msg5648c9bffc923f4438d46cec)I prefer plain blocks to represent action. Made much sense in R2 VID. I never liked the look of the source code of Saphir R3 for e.g., where the code was all polluted with myriad `on-action` keyword, prior to each action block ...

[18:07](#msg5648c9edaca9bb7c6e506746)then just let's use `sub` keyword, or `sub-menu`, will not hurt imo ...

dockimbel

[18:07](#msg5648c9f5aca9bb7c6e506747)@pekr I don't think we are talking about the same thing. My wondering was just for menus definition, not for general action blocks and events.

pekr

[18:08](#msg5648ca2aaca9bb7c6e50674a)I think we are, but I am also often confused :-) Simply put, you were wondering, having just menu in mind, how would you distinguis two situations, where you need a block - an action, and sub-menu definition ...

[18:08](#msg5648ca36fc923f4438d46cf4)And what we generally say is, that plain block = action

[18:09](#msg5648ca43fc923f4438d46cf8)so submenu block definition has to use some kind of keyword, no? :-)

[18:09](#msg5648ca52fc923f4438d46cfc)Well, if not, then you don't need to further explain, I will get it later :-)

[18:09](#msg5648ca64fc923f4438d46cff)Don't loose your time with me not eventually understanding, better push new stuff :-)

[18:12](#msg5648cafc8b242470793dde0c)What I wonder though is, if Red View will over-feature R2/R3 View engine, e.g. allowing top window transparency :-) (IIRC, it was a hack by Cyphre for R2, which never got into official distro). Not sure how useful such feature is though, maybe just for some cool widgets, as clock, etc.

[18:12](#msg5648cb128b242470793dde10)what could be useful though, are switches for no-border, no-window ...

fergus4

[19:47](#msg5648e147fc923f4438d46e8b)React very cool. Saves a lot of coding.

## Monday 16th November, 2015

WiseGenius

[03:13](#msg564949bc5b7a2ea84f0840b1)@dockimbel :+1: `react`! Wow! Just the kind of feature I was hoping for someday, but wasn't expecting it so early!

[04:26](#msg56495afc6296df7f6efec210)@dockimbel Is there any chance you guys could be persuaded to implement \[shape](http://www.rebol.com/r3/docs/view/draw-shapes.html) soon? I know you've already done \_way_ more than was intended (or hoped by me) for 0.6.0 and want to get it out ASAP. Maybe in 0.6.1? Or is that too much work?

dockimbel

[04:29](#msg56495b9e6296df7f6efec215)@WiseGenius Supporting all Rebol's Draw commands is on our roadmap, we need it for proper SVG support. So, expect `shape` to come at some point, probably at the same time as matrix transformations support in Draw (it's not scheduled in a given release yet though).

WiseGenius

[04:43](#msg56495ee0fc923f4438d47655)Yes. `path` is the only SVG graphics element which cannot yet be drawn in Red's `draw`. `shape` is also the only thing left needed by 4 out of my 8 major Red projects. So my question is very selfish. ;)

dockimbel

[04:45](#msg56495f68bb11d072795984e3)@WiseGenius Most, if not all of those features are supported by the Windows API (in a more or less practical way), so it shouldn't be very difficult to implement. SVG support is very high on my todo-list.

WiseGenius

[04:47](#msg56495fd210f6aea94fddbf67):smile:

[05:22](#msg5649682810f6aea94fddbfb3)

```
red>> system/view/metrics/screen-size
== none
```

Is this not yet implemented?

dockimbel

[05:26](#msg564969048b242470793df96b)@WiseGenius I think it's deprecated, I should remove it. You can get that info from:

```
red>> system/view/screens/1/size
== 1920x1200
```

[05:26](#msg564969218b242470793df976)Though, it's available only after first `view` call.

[05:27](#msg56496952bb11d072795985d9)If you need to know the size before that first `view` call, you need to first call:

```
system/view/platform/init
```

[05:28](#msg56496997bb11d072795985e2)I'm still hesitating to call that init function from Red environment booting code or not...For now, the GUI sub-system is initialized only on first `view` call.

WiseGenius

[05:28](#msg56496998fc923f4438d476a9)Yes, found it in `system/view/screens/1/size` already, thanks. `system/view/metrics/dpi` works though. Would that be moved?

dockimbel

[05:30](#msg564969dcbb11d072795985e7)Hmm, maybe `dpi` should be moved too as it is a per screen info.

WiseGenius

[07:20](#msg564983d396589f4338676bb0)How should something be displayed full screen? Should/does `view` have a full screen option or should the user themselves set the offset and size to fill the screen as \[this Rebol example](http://business-programming.com/business\_programming.html#section-9.4) seems to do?

[07:20](#msg564983d5fc923f4438d477a0)If the latter, then how should one consistently hide the top-left edges of the window? In Rebol 2, this is achieved by setting the `offset` to `0x0` since `offset` refers to the content of the window. Currently in Red though, `offset` refers to the window itself, but `size` refers to the content. Should `offset` refer to the content too? Should there be different ways to set each? If not, how should one get the sizes of the edges?

[07:21](#msg564983dcfc923f4438d477a3)Also, how does one cover the taskbar? I'm still not sure which part of the linked example achieves that.

dockimbel

[07:23](#msg5649845496589f4338676bb6)@WiseGenius We'll provide a proper OS-friendly way to go fullscreen, not going the Rebol way for that feature. We'll implement that at the same time as the auto-resizing system (in 0.6.1 or 0.6.2). The next minor Red releases should come very quickly.

pekr

[07:23](#msg564984848b242470793dfbe9)Red needs just options r2 View has (no-window, no-border)

WiseGenius

[07:33](#msg564986b26296df7f6efec3c8)How does one set the offset when using VID?

dockimbel

[07:49](#msg56498a96fc923f4438d4780e)@WiseGenius If you want to position a face at absolute coordinates use `at` command.

WiseGenius

[08:35](#msg5649953910f6aea94fddc1c0)Sorry, I mean the window. Rebol 2 has an `/offset` refinement:

```
view/offset layout [text "Hello, World!"] 50x50
```

pekr

[08:35](#msg564995628b242470793dfe70)&gt;&gt; help view  
USAGE:  
VIEW view-face /new /offset xy /options opts /title text

DESCRIPTION:  
Displays a window face.  
VIEW is a function value.

ARGUMENTS:  
view-face -- (Type: object)

REFINEMENTS:  
/new -- Creates a new window and returns immediately  
/offset  
xy -- Offset of window on screen (Type: pair)  
/options  
opts -- Window options \[no-title no-border resize] (Type: block word)  
/title  
text -- Window bar title (Type: string)  
&gt;&gt;

WiseGenius

[08:42](#msg564996e096589f4338676cbd)However in Red, the title of the window can be set from within VID:

```
view [title "Hello" text "World!"]
```

So I was wondering if perhaps offset should be able to be too:

```
view [title "Hello" offset 50x50 text "World!"]
```

dockimbel

[08:49](#msg564998ad96589f4338676ce4)@WiseGenius Right, will check that.

pekr

[08:49](#msg564998b010f6aea94fddc204)

```
view [title "Hello" offset 50x50 options [no-window no border] text "World!"]
```

[08:50](#msg564998bcaca9bb7c6e507260)... for later :-)

[08:52](#msg564999408b242470793dff3d)@dockimbel I found it nice, that R3 (Saphir version IIRC) allowed to use options: \[color: 0.0.0 size: 20x30] to be specified in terms of the Stylize function. That way you simply defined, as a style author, what is exposed to the VID level for user to set. Do you find it convenient, or not much useful for Red?

[08:53](#msg5649998cbb11d07279598b80)Maybe I also remember the keyword `options`in some version of GUI, allowing to use/set the face object directly, something like `in`or `with`

dockimbel

[08:53](#msg56499992bb11d07279598b82)@pekr That's very minor concern for now, as `stylize` is not implemented yet.

pekr

[08:55](#msg564999f38b242470793dff57)I wonder if `stylize` makes some sense at all, with the native widgets. But then, for the custom ones, it might be useful ...

WiseGenius

[09:31](#msg5649a26310f6aea94fddc2e8)I recently noticed it seems the size of the window can also be set from within VID:

```
view [size 500x500 text "Hello, World!"]
```

Which also makes it seem appropriate for the offset.

dockimbel

[09:37](#msg5649a3d8aca9bb7c6e507312)@WiseGenius Right, it's more convenient, thought I'm not yet sure that's the best way.

pekr

[09:39](#msg5649a4448b242470793e014a)maybe something like `view/options [field button "Quit" [quit]][title: "Hello World" size: 200x300]`

[09:40](#msg5649a4928b242470793e0163)`options`could be used even in VID, to allow directly access facets (face object values), though it is a bit risky aproach, as accessors might be still better aproach/protection ...

WiseGenius

[10:29](#msg5649b022fc923f4438d47aa0)@dockimbel Neither am I. I was just saying it would be consistent with how it is so far. How it is so far is the part I'm mostly doubting. Currently, I like something closer to @pekr's approach better. For one thing, we're talking about attributes of the window itself, and not its content. For another thing, as it is now, `title` and `size` can be used anywhere in the VID block, which means this could look like I'm setting the size of one of the faces, or even the font size:

```
view [text "Hello, World!" size 500x500 button "Click me" title "Goodbye, Simplicity."]
```

This makes much more sense to me:

```
view/options [text "Hello, World!" button "Click me"][offset: 50x50 title: "Goodbye, Confusion!" size: 500x500]
```

[10:47](#msg5649b425fc923f4438d47af9)Among other things though, I understand wanting to write the title \_before_ the content.

[10:47](#msg5649b429aca9bb7c6e507413)Here's an idea that no one will like: Make `view` only take `face!`, and have a separate function, `vid`, which is 2 arity by default to take a title string and layout block:

```
vid/options "Goodbye, Confusion!" [text "Hello, World!" button "Click me"][offset: 50x50 size: 500x500]
```

This also makes the title mandatory so there's no question about the default title.

iArnold

[15:05](#msg5649f09cfc923f4438d480ce)I tried transparency and it works nice.  
Except for a minor detail ..

[15:05](#msg5649f0b0aca9bb7c6e5079c0)I tried fill-pen 255.0.0.200 ok

[15:10](#msg5649f1fd6296df7f6efecc17)255.0.0.150 ok but 255.0.0.050 result: missing "]" in compile. Guess the 0 before the 50 is not allowed. My error!

rebolek

[15:52](#msg5649fba86296df7f6efecd3f)I would say lexer’s error, not yours :-)

pekr

[16:01](#msg5649fde596589f43386776b2)@rebolek 1000cows anytime soon? :-)

rebolek

[16:34](#msg564a058d8b242470793e1e7d)@pekr I’ve been thinking about it during weekend (but I was away from keyboard ;-) so I guess I will try it soon.

WiseGenius

[17:23](#msg564a1106bb11d0727959aefa)When clicking on a `'base` face, although `view-test` prints the `down`, `up` and `double-click` events to the output console, it doesn't do any of my `on-down`, `on-up` or `on-click` code. Neither does `vid`.

[17:29](#msg564a1296bb11d0727959af9f)My mistake. `on-down` and `on-up` work in both. It's only `on-click` which doesn't work in either.

iArnold

[20:35](#msg564a3e2923c03b2e7f209285)Almost the end of this Gitter chat room?

pekr

[20:52](#msg564a41f68b242470793e32fc)End?

meijeru

[22:01](#msg564a5236bb11d0727959c46d)Before this chat room is closed, i.e. when GUI has become an integrated part of the Red toolchain with the release of 0.6.0, I still have several remarks (not proper issues, I think).

[22:03](#msg564a529c8b242470793e3840)The `view`function has a refinement `options` which is not used in the body. What is its purpose, and will it be implemented before the release?

[22:15](#msg564a55728b242470793e3926)The `view`function calls `do-events`\*unless* `/no-wait` is set. Then `do-events` which itself has a refinement `/no-wait` which is not used, calls `system/view/platform/do-event-loop`with argument `no` and `do-event-loop`, which is a routine, calls `gui/do-events` with the same argument. This latter function is platform dependent, defined in view/backends and calls the necessary OS functions. Apart from the fact that this process seems a bit too "layered" I wonder what the various arguments are for if they are never used.

rebolek

[23:42](#msg564a69d3bb11d0727959caf7)That GUI is "integrated part of the Red toolchain" doesn’t mean this room is obsolete ;)

iceflow19

[23:46](#msg564a6adb5b7a2ea84f0859af)Ditto, I suspect there will be many more conversations to come, especially once Red VID starts venturing into the territory of mobile devices.

pekr

[23:57](#msg564a6d8496589f43386782b1)+1 ... imo this room should stay open - GUI is imo broad enough topic for it to persist ....

## Tuesday 17th November, 2015

rebolek

[00:00](#msg564a6e3510f6aea94fddd77f)If it’s possible with Gitter, I guess it should be.

PeterWAWood

[01:30](#msg564a83218b242470793e43b2)The initial purpose of this room was the Github gui branch because it is for developing View for Windows. I suspect there will be an android branch in the not so distant future. It would seem to make sense to open a new room for that.

Once we are a little further a long the roadmap and have cross-platform gui support, it would seem to be sensible to have the following rooms:  
View  
Vid  
Windows  
Android  
Linux  
OS X  
iOS

I think it is a little early to set them up yet.

[03:18](#msg564a9c995b7a2ea84f085c8e)Referring to a non-existant face type compiles but gives access voilation when run:

```
Red [
	Needs: 'View
	Icon: %red.ico
]

win: make face! [
	type: 'window text: "Access Violation" size: 1000x600
]

win/pane: reduce [
	make face! [type: 'does-not-exist text "name: "] 
]

view win
```

[04:31](#msg564aadb296589f4338678656)@dockimbel Is it possible to right justify a text face?

When I try this, the text is still left aligned:

```
win: make face! [
	type: 'window text: "text not right-aligned" size: 1000x600
]

win/pane: reduce [
	make face! [
		type: 'text
		text: "Right" 
		offset: 10x10 
		size: 500x20
		align: 'right
	]
	make face! [
		type: 'text
		text: "<---------------------------------------------------------->"
		offset: 10x30 
		size: 500x20
	]
]

view win
```

dockimbel

[05:31](#msg564abba78b242470793e4c2d)@meijeru `do-events` implementation is temporary and will change totally in 0.7.0. `no` was hardcoded because of a bug in earlier versions. I will try to change that now.

[05:32](#msg564abbd1bb11d0727959d75d)@meijeru `/options` will be implemented in 0.6.0.

[05:36](#msg564abcd0bb11d0727959d77b)@PeterWAWood The current View engine is doing very little checking on validity of all the facets values, changing `type` or `state` is a quick way to a runtime crash. I don't think we'll have time to implement proper defense against that in 0.6.0 as it might require implementing immutable words and series support first (including `protect/unprotect` functions).

[05:37](#msg564abd258b242470793e4c5f)@PeterWAWood Face! doesn't have an `align` field, see the %view-test.red script to see how alignment is handled (look for `para` object).

WiseGenius

[05:39](#msg564abd9210f6aea94fdddb8c)@dockimbel I'm thinking `on-click` should work on `base`? What do you think?

dockimbel

[05:40](#msg564abde88b242470793e4c88)@WiseGenius `on-click` is reserved for buttons for now (because it's produced by Windows API). We'll probably extend it to `base` in next version. You can use `on-down` or `on-up` in the meantime.

WiseGenius

[05:41](#msg564abe0f6296df7f6efedd1a)Yes. It is good enough for now.

[05:42](#msg564abe56aca9bb7c6e5089f1)&gt; because it's produced by Windows API

Ah, didn't realize that. Makes sense.

dockimbel

[05:47](#msg564abf6410f6aea94fdddba9)@WiseGenius Actually, if you use `on-up` and ignore `on-down`, that's should be equivalent to `on-click`. Maybe a global handler could simply check if `on-click` handler is present, drop `on-down` and map `on-up` to `on-click` then, not sure Windows is doing much more than that anyway.

PeterWAWood

[05:53](#msg564ac0cc8b242470793e4cca)@dockimbel I don't want to align the Face! only the text that is displayed in it.

dockimbel

[05:54](#msg564ac1208b242470793e4cd3)@PeterWAWood I got that. You wrote `align: 'right` in the face object, such field is not processed by View. Aligning face's text is done through `face/para/` fields.

PeterWAWood

[06:00](#msg564ac2978b242470793e4cec)@dockimbel Sorry. I've got it right now.

WiseGenius

[06:01](#msg564ac2bfaca9bb7c6e508a11)@dockimbel It is doing more, because if you click outside the area, hold down and then release inside the area, that's an `on-up`. `on-click` should only work if the same and `on-down` and `on-up` are both inside the area. And of course, `on-down` is different too. IMO, both `on-down` and `on-up` are essential. `on-click` can be made using both, but it can be tricky. I would leave allowing `on-click` on things like `base` until later as you said. The only reason I previously suggested it for `base` is because I thought you had already done the work implementing `on-click` for `button` yourself, using `on-down` and `on-up`.

PeterWAWood

[06:10](#msg564ac4d496589f4338678713)@dockimbel Should v-align work with 'text face?

dockimbel

[06:10](#msg564ac4ed8b242470793e4d24)@PeterWAWood Not sure...

WiseGenius

[06:21](#msg564ac76396589f4338678733)@dockimbel Since I was already planning to implement `on-click` for `base` in my own projects using `on-down` and `on-up`, I might be able to contribute later for it being implemented for other faces. However, I wouldn't get to it in the next few weeks.

[06:21](#msg564ac76696589f4338678735)I'm going on an intense project from the 21st for 2 weeks, during which I will have almost no access to computers. Right now, I'm prepping for that project, and also trying to find time to report all the issues I can in case 0.6.0 gets released while I'm away. ;)

dockimbel

[06:25](#msg564ac86896589f4338678746)@WiseGenius Got it. We'll probably release 0.6.0 before, but I'm planning a 0.6.1 release shortly after, so we'll be able to fix more bugs there.

iArnold

[06:55](#msg564acf50bb11d0727959d95f)&gt; The initial purpose of this room was the Github gui branch because it is for developing View for Windows. I suspect there will be an android branch in the not so distant future. It would seem to make sense to open a new room for that.

Yes I was 'only' pointing at this aspect of this room, now the first release comes sooner than soon. No doubt there will be a lot GUI related to discuss about.

meijeru

[08:28](#msg564ae51a5b7a2ea84f085fdf)I continue my remarks: in `view-test.red` none of the `parent` fields of the sub-faces seems to be set. What is the significance of the parent face then?

dockimbel

[09:11](#msg564aef3a8b242470793e543d)@meijeru The `parent` field is set at runtime by the View engine, more accurately when `show` is first called on a face. It allows to navigate the face tree down to the root face.

pekr

[09:21](#msg564af188bb11d0727959dfa0)I can see a `default-actor` item now changed for the list widget types. Just a question - would it make sense, as with Saphir's GUI, to allow it being a block, and eventually call multiple actors, if there is a need to do so? They implemented system wide `on-action`, which imo allows something like that ...

dockimbel

[09:27](#msg564af3158b242470793e54ff)@pekr Makes no sense to me in Red/View. The default action block is written with a default event in mind. Using the same handler code for different events makes not much sense to me in this case.

meijeru

[10:40](#msg564b043afc923f4438d49702)@dockimbel Questions for documentation: can a window have other windows dependent on it, i.e. can the `pane` of a face of type `window` have faces in it which are also of type `window`? Also, why is `system/view/screen`a block of 6, when all windows have as parent `system/view/screen/1`?

dockimbel

[11:11](#msg564b0b636296df7f6efee1e1)@meijeru No, it should not, though, we don't check it yet at runtime. `system/view/screen` is a block, because we want to be able to handle multiple displays (in a later release).

meijeru

[11:28](#msg564b0f466296df7f6efee235)@dockimbel Thanks a lot. Next question: the \*draw* dialect can be used both directly, by inserting a block in field `draw:` of the face object, and in the VID. However, the \*menu* dialect cannot be used in the VID. Will that be remedied?

dockimbel

[12:07](#msg564b188e10f6aea94fdde20b)@meijeru Menu support in VID is not yet implemented, not sure we'll have time to do it for 0.6.0 as it requires some extra design.

iArnold

[15:15](#msg564b4482bb11d0727959f5e9)If I hover over some 'base object, and I programmed an on-over actor here, the event is indeed triggered. Then when I move my mouse away to the canvas again, the on-over event is triggered again. I expect an on-away event or on-leave not an on-over.

[15:31](#msg564b4861bb11d0727959f740)As a workaround I'll have to work with on-drag and on-drop on-up and on-down.

dockimbel

[16:00](#msg564b4f3b96589f433867930a)@iArnold Look into the view-test.red script to see how `on-over` handles the mouse cursor exiting. Having the same event for those cases makes it easier to write some handlers, for example, changing the color of the face:

```
lisp
on-over: func [face event][face/color: get pick [red blue] event/away?]
```

pekr

[18:13](#msg564b6e56e1d84b04136fc55f)Could the anti-aliasing be turned on by default, please? I can't imagine wanting it being otherwise ....

iArnold

[21:11](#msg564b9813e59fa9387ff1ded1)&gt; Could the anti-aliasing be turned on by default, please? I can't imagine wanting it being otherwise ....

Yes, I am at the point of inserting that too :-P

[21:19](#msg564b99fcbabd0bf33f37fec8)@dockimbel I take it event/away? is true/yes on leaving?

## Wednesday 18th November, 2015

dockimbel

[03:37](#msg564bf27fe1d84b04136fea27)@iArnold Right.

iArnold

[07:08](#msg564c23d3c3e9f31e2bf3d27e)Thank you. It will become nice now, all ingredients are present. Can't make a promise about when it will be operational, but busy at the moment :-/

meijeru

[16:18](#msg564ca4bd167ee3a91d43b244)@dockimbel I notice that a value of type `event!` has a field `face`. Then why do actor functions have to have a separate argument `face`?

dockimbel

[16:20](#msg564ca54c7ae518a71d2f8f29)@meijeru It's not always the same face, for example, during the event bubbling stage, the `face` argument changes to refer to parent faces, while `event/face` remains the same.

meijeru

[17:18](#msg564cb2f7726523e941a62e80)@dockimbel OK understood. But on a related point, in `view-test.red` there is a `drop-list` defined which has an actor `on-create` with a function with only a `face` argument, not an `event` one. Is that correct?

dockimbel

[17:40](#msg564cb805167ee3a91d43b9ff)@meijeru It is, `on-create` is an \*internal* event occuring just before a face is about to be displayed. It is generated by our View engine, not by the OS, so it does not have any low-level event object associated.

meijeru

[21:54](#msg564cf37c7ae518a71d2fa9f4)@dockimbel I understand. This is not the last question: why are there event types for `down` and `up`, but only an event-flag for `down?` and not for `up?`. The same for all the variations (`mid-down`, `alt-down`, `aux-down`). In other words: what is the value of `down?` when the type is `up` ??

## Thursday 19th November, 2015

iArnold

[07:11](#msg564d7608bcda46ff173d0cc9)I feel the way to be sure, until Doc answers this, only true is a 'valid' state for down? if state is down else it can be none, unset or false.

meijeru

[08:25](#msg564d876d96a31729694ff45c)@dockimbel `alt-down` is giving trouble anyhow, see issue #1464

dockimbel

[08:28](#msg564d8846167ee3a91d43e8fe)@meijeru Those event flags are returning logic! values: `true` means \*pressed\*, `false` \*not pressed\*. They allow checking the state of various special buttons during some events (mostly for key events IIRC).

[08:29](#msg564d887f167ee3a91d43e909)@meijeru Thanks for the ticket, we'll investigate that.

meijeru

[09:53](#msg564d9bfc7ae518a71d2fca76)@dockimbel I observed that `shift?` and `control?` are NOT set during a `click` event, although that could be handy...

dockimbel

[11:42](#msg564db5ad726523e941a64404)@meijeru Indeed, could you please make a ticket for that, so we don't miss it?

## Friday 20th November, 2015

iArnold

[07:11](#msg564ec78443ec9bda18253276)@dockimbel @qtxie After the release 0.6.0, will there be branches for development of the GUI for other platforms? And now you know how the binding with objective-C must be done for Red (or Red/System) could one of you post some guide or hints for that? Perhaps this gives the community a chance to participate in this development?

meijeru

[08:32](#msg564edaa4b0853133165635da)@dockimbel Earlier, you wrote about "the event bubbling stage". Can you tell me where in the source code this occurs. I had some difficulty finding it, and I need to understand it, also in relation to `system/view/handlers`.

dockimbel

[08:37](#msg564edbadb085313316563612)@meijeru Bubbling happens \[here](https://github.com/red/red/blob/gui/modules/view/view.red#L351). It's achieved by recursive calls to `awake`. Re-reading the `awake` code I realize that global handlers are probably not so global...I should fix that quickly.

meijeru

[09:27](#msg564ee77311ff1d3016e22f33)@dockimbel I see. Why is the recursive call of `awake`done in the form `system/view/awake`? You are in the right context, so there is no need to prefix.

dockimbel

[10:04](#msg564ef03911ff1d3016e2318a)@meijeru Probably a workaround for a compiler bug. Haven't tried removing the prefix to see if it works fine now.

meijeru

[12:40](#msg564f14b4b8d16ccc4a38085d)@dockimbel `system/view/reactors` is a block of 4-tuples, each of which consists of a face, a facet, a function and a context; I can't find where the 4th component is used?

[15:55](#msg564f425e225892ce3ce116b6)@dockimbel Please forget the above question. I have figured it out now.

[15:56](#msg564f42b1051b93d13c8d5024)@dockimbel However, looking at the `state` block of a face object I notice that provision is made for "only" 32 fields, since `state/2`, the change array, is a single integer. Correct?

dockimbel

[16:00](#msg564f43a8a051fea34242a912)@meijeru Correct.

meijeru

[16:11](#msg564f464206a214f1080b0259)@dockimbel Sorry to go on, but I am deep into the GUI system now. In `on-face-deep-change*`there is a call to `check-reactions` with arguments `owner 'word`. Should that be `owner word`, without the quoting on `word`?

dockimbel

[16:12](#msg564f46811a00e4f00803b9cd)@meijeru Good catch! :)

meijeru

[16:59](#msg564f5159051b93d13c8d5245)@dockimbel It occurred to me that, since there are only some 20-odd fields in a face object so far, the state block could have been made into 4 separate fields...

dockimbel

[17:12](#msg564f5484541ec57a66e2d8f2)@meijeru One field is more convenient for the different internal face callbacks to manage (the on-change* and on-deep-change* functions).

## Saturday 21st November, 2015

iArnold

[07:24](#msg56501c459e918c3c30cd05bc)I added "Needs: 'View" to console.red and compiled. Then started the console2 exe, and "do %script-with-view.red" crashed on me with path error on /view/debug? none. What did I do wrong? Normal scripts do run. I see little profit in the console program what is extra?

meijeru

[12:11](#msg56505f6ca051fea34242e21b)@dockimbel Another question: `system/view/VID/styles` is a map, indexed by face types. Its entries are blocks such as  
`[default-actor: on-click template: [type: 'window]`  
Why are there set-words in such a block? A simple word would do...

[12:31](#msg5650640d06a214f1080b15ed)@dockimbel Also, why is `styles` a map, and `local-styles`a simple block?

[13:49](#msg56507651a051fea34242e471)@dockimbel Windows allows font size to be specified in half points. The GUI does not.

dockimbel

[15:35](#msg56508f31a051fea34242e98a)@meijeru Agreed, we should allow `float!` for the font size value in addition to `integer!`.

[15:37](#msg56508fa2a051fea34242e99e)@meijeru `styles` is a map! in order to get faster lookups. `local-styles` is empty or holding very few styles, so adding an hashtable to it (map! is implemented using an hashtable) is wasting resources.

[15:38](#msg56509010a051fea34242e9b9)@meijeru It's nicer to have set-words, because the block is structured as name/value pairs, so just cosmetic, for better readability (these blocks should be extended in the future with more entries).

## Sunday 22nd November, 2015

meijeru

[19:31](#msg56521817a051fea3424325c5)I just uploaded a short GUI application, the "tile game", a 4x4 puzzle with 15 pieces and one open space. See https://gist.github.com/meijeru/6bc3965cea4743e85fde

iArnold

[19:52](#msg56521cf6cf4df03e5199909b)Is there a regression on select?  
Style: button Offset: 500x440 Size: 60x24 Text: "Quit"  
gui/find-class failed

\*\** Runtime Error 1: access violation  
\*\** at: 00470EC2h

[19:57](#msg56521e454cdf0cd11a124675)in an on-over event handler  
mydestinations: \[8x6 4x3 7x5] ;select play-moves 1  
; mydestinations: select play-moves 1

[19:59](#msg56521e86cf4df03e519990a6)play-moves: \[1 \[8x6 4x3 7x5]]

meijeru

[20:32](#msg5652264d225892ce3ce13f79)@iArnold I had an Access violation which disappeared when I speicfied `Needs: 'view` in the Red header.

## Monday 23th November, 2015

PeterWAWood

[03:22](#msg5652867a06a214f1080b33d7)@dockimbel @qtxie console.red in the latest gui branch compiles under both Linux and OS X but gives this error when run:

```
$ ./test-console
*** Script error: path none is not valid for none type
*** Where: =
*** Stack: extract-boot-args set find get pick =
```

iArnold

[07:25](#msg5652bf6154ba2ca2426127ee)@meijeru I have that line in the header.  
I defined play-moves to be \[1 \[...]] and the only other change is moving the semicolon to the other line.

dockimbel

[07:46](#msg5652c442541ec57a66e30ae4)@iArnold There is no regression on `select`that I know of.

[07:46](#msg5652c463225892ce3ce14886)@meijeru Very nice puzzle game! I wanted to make one too, but using loadable images. ;-)

iArnold

[07:46](#msg5652c466541ec57a66e30ae6)Managed to get the GUI running from within the 'new' console2 shell. Had to copy the newly compiled console.exe to the directory where console2 expects it. Because I overwrite the red-gui folder often with the newest sources I moved the compiled console.exe to a more permanent place :worried:

[07:48](#msg5652c4ba1a00e4f00803ee5d)@dockimbel I will try to make a minimal example

dockimbel

[07:48](#msg5652c4cda051fea342434655)@iArnold I point my Console2 target setting to my red/ working folder where I recompile the console everyday and didn't have any issue so far. Though, Qingtian has crashing issue with Console2 when double-clicking inside the window, it seems to be related to Unicode/codepage settings.

[07:49](#msg5652c500a051fea342434659)

```
lisp
red>> play-moves: [1 [8x6 4x3 7x5]]
== [1 [8x6 4x3 7x5]]
red>> mydestinations: select play-moves 1
== [8x6 4x3 7x5]
```

iArnold

[07:51](#msg5652c565051b93d13c8d81ce)Then you must recompile every day.  
I get that result too when directly in the code.

[08:15](#msg5652cb0f54ba2ca2426129e5)@meijeru Nice compact example!

dockimbel

[08:26](#msg5652cdc0ce18827866f52556)@meijeru Here's an even simpler \[version](https://gist.github.com/dockimbel/b2a591533db2b3c6b2e1) which requires the latest commit to work properly. Also, I will be adding some features today which will allow you to remove a line of code in the VID block. ;-)

iArnold

[08:28](#msg5652ce1e06a214f1080b3759)Select problem seems to be gone now.

meijeru

[08:41](#msg5652d148a051fea3424348af)@dockimbel Indeed, that was my original version, but because of issue #1467 which I think you now have solved, I had to repeat `origin` on each row.

[08:56](#msg5652d4b254ba2ca242612c1f)@dockimbel Default events for VID blocks which serve as handler bodies are specified in `system/view/styles`. They are even given for the grouping faces (tab-panel, panel and group-box). But for them they make no sense because a block after a panel etc. is never interpreted as handler body!

[12:15](#msg5653034ca051fea342435560)@dockimbel In `layout`, non-key words occurring in the VID block are replaced by the values they are bound to. In RebGUI, which I use with R2, also `paren!` values are permitted, which are evaluated. This could be a useful addition to the VID.

pekr

[12:17](#msg565303ce06a214f1080b3b8b)isn't that, at least partially, what DO keyword allows? But IIRC, it was just some kind of late post-init, or something like that ....

meijeru

[16:47](#msg56534312f10fe3736986fa0b)@dockimbel I have to report that my Norton Anti-Virus thinks compiled Red programs are suspect, e.g. the tile game. I am using Windows 10 and Norton Internet Security latest version, which alleges it found a Trojan.Cryptolocker threat.

dockimbel

[17:09](#msg565348468d32b18d27c1e0e8)Could you please pass your binary through https://www.virustotal.com/ and send me the resulting report link?

meijeru

[17:21](#msg56534b273146b37569411fe6)@dockimbel Here it is: https://www.virustotal.com/en/file/f30fac0f57c821fafbe7d0fce8e1ccb0bd3101802ba7a0c32d95981f26c80fad/analysis/1448299125/

dockimbel

[17:27](#msg56534c8e8276c3a05764d141)Ok, so it seems like a Norton-specific issue (heuristic false positive from qihoo 360 is not a big deal). Cryptolocker is a very serious threat though, you should double check your PC with another anti-virus. I suggest \[Malawarebyte](https://www.malwarebytes.org/).

meijeru

[18:43](#msg56535e60a60c9fa60895e1a8)@dockimbel I did the suggested check and nothing was found. So I guess I have to live with Norton's false positive.

iArnold

[20:47](#msg56537b620ff873d23354a9aa)I added a very early stage of the GUI to the Xiangqi program, I have not even checked if it compiles though.

[20:49](#msg56537be66566473d7d42f697)(Wow my video has hit a hundred views :-) )

## Tuesday 24th November, 2015

dockimbel

[02:39](#msg5653cdc577b7a53a219e351a)@meijeru We can report that false positive through the Norton web site and ask them to fix their engine or whitelist our binary.

meijeru

[08:59](#msg5654270bad9684883d786c33)I did the false positive report.

dockimbel

[09:09](#msg5654295d77b7a53a219e4637)@meijeru Thanks!

iArnold

[14:10](#msg56546fcdf2bb4538210b1157)I fear my use of BLACK having a value of 1 conflicts with 'pen black' in my draw block.

[14:13](#msg5654707aa60c9fa60895fb35)I think the simplest way of solving this conflict for me, in my program, is to use 0.0.0 in my draw block.

[16:07](#msg56548b590d143098620f0539)

Oldes

[16:13](#msg56548cb2e34e2efc2fbf356a)@iArnold  
1\. you should learn, how to paste code block - see the help menu in the right side of the input field  
2\. you are not posting any code, just data and error message, which is not much helpful to anybody.

iArnold

[16:15](#msg56548d1a3a7600fd2f873da6)sorry. my mistake!

Oldes

[16:15](#msg56548d3af59a8f0758a67441)You are welcome :)

## Wednesday 25th November, 2015

iArnold

[07:25](#msg5655626bf59a8f0758a6af4a)Yes I ran into an (to me) unexplainable error, I append strings to a string and later I append a pair to the string, then I want to append another string to the string and the string has become the pair I added in the step before, resulting in the error append does not allow pair for its series argument. I was copy and pasting that to my editor but I shifted focus to my other screen and entered. Still not solved the bug. It is nasty because if I isolate it, it behaves normally.

[08:34](#msg5655729592aa9746647b722e)I think I "fixed" my problem appending the pair p. Even though the problem continued when I appended p/1 then "x" and last p/2 (crash on appending "x") . Now I make xco: p/1 yco: p/2 and append xco, "x" and yco. It now seems to work.

[09:42](#msg56558273cac1354864a6deed)@qtxie Would you please take a look at https://gist.github.com/iArnold/3a9efe03898b4bf3c81e This is the error I encounter in my xiangqi-board.red script. Somehow the string I am collecting data in gets overwritten and has become a pair. Source is in https://github.com/iArnold/Xiangqi

dockimbel

[09:48](#msg565583df3a7600fd2f875511)@iArnold Could you please isolate the bug in a minimal source code?

iArnold

[09:53](#msg56558526f59a8f0758a6b84b)One of my problems is it is not reproducable then :-(  
Hey looks like I "fixed it by properly declaring all variables and not letting Red do that.

[09:54](#msg5655856763bfb30b58e44567)Probably had to do with reusing variables from another part of the program.

[09:57](#msg565585f1cac1354864a6df37)Without posting I would have been bugged much much longer! Thanks all for reading ;-)

Oldes

[09:57](#msg5655862563bfb30b58e4459a)Looking at nasty code like:

```
helper-string: copy " "
append helper-string xco
append helper-string copy "TRALALA"
append helper-string yco
append helper-string " size: "
replace helper-string "TRALALA" "x"
```

.. it would be almost time to add

```
rejoin
```

native into Red, what do you mean @dockimbel ?

[09:59](#msg56558683f59a8f0758a6b8b7)@iArnold isn't there (now) other way how to build your pieces instead of \*do\*ing constructed string as you do it?

[10:02](#msg56558727f59a8f0758a6b8ee)@dockimbel do you plan also add more efficient way how to join strings like is

```
ajoin
```

in R3?

iArnold

[10:02](#msg56558745f59a8f0758a6b8f8)LOL @Oldes Yes I know I \*can* write ugly code. I resort to this madness when faced with ugly bugs, I break down what I have in pieces and try to figure out what part of the statement is causing the trouble.

[10:04](#msg5655879f0d143098620f1cc6)I have this basic construct so I don't have to hardcode all my pieces and be flexible with the size of the board at the same time.

rebolek

[10:08](#msg565588b492aa9746647b73f9)It’s certainly not perfect, but works:

```
rejoin: func [
	"Crude REJOIN version, because I can't live without it"
	block 			[block!]
	/local
		string 		[string!]
] [
	string: make string! 300 ; good enough for my requirements
	block: reduce block
	foreach value block [append string form value]
	string
]
```

Oldes

[10:13](#msg565589d1e34e2efc2fbf4d6a)That is very crude, of course :) But now I see, that in Rebol

```
rejoin
```

and

```
join
```

are not natives, and it's source works in Red without modification:

```
red>> rejoin: func [
[        "Reduces and joins a block of values."
[        block [block!] "Values to reduce and join"
[    ][
[        if empty? block: reduce block [return block]
[        append either series? first block [copy first block] [
[            form first block
[        ] next block
[    ]
== func ["Reduces and joins a block of values." block [block!] "Value...
red>> rejoin ["a" "b"]
== "ab"
```

iArnold

[10:17](#msg56558ab23a7600fd2f8755eb)I like @rebolek s version better, I can understand that one :-)

Oldes

[10:18](#msg56558b04cac1354864a6dfaf)@iArnold but the Rebol version can do this:

```
red>> rejoin [%a "b"]
== %ab
```

rebolek

[10:18](#msg56558b13f59a8f0758a6ba29)@Oldes Good to know. I wrote it for joining 3-5 strings, so it’s not optimized in any way. AFAIR @dockimbel said that he wants some better solution than tons of join, rejoin, reform, remold, ... functions.

[10:19](#msg56558b33f59a8f0758a6ba33)Mine is more `ajoin` than `rejoin` :D

Oldes

[10:20](#msg56558b650d143098620f1d2a)@iArnold when you want to join strings as you do, you could also use chaining as Kaj does in his code... like:

```
red>> s: make string! 20 x: 1 y: 2
== 2
red>> append append append s x #"x" y
== "1x2"
```

[10:21](#msg56558baef59a8f0758a6ba5c)Which is ugly too, but the most efficient. Also when you allocate string, don't use just

```
copy ""
```

when you know, it will be large as in your case.

dockimbel

[10:45](#msg56559131f59a8f0758a6bc02)As said @rebolek, I want to redesign these functions to reduce their number if possible, while keeping all the features.

Oldes

[10:51](#msg565592a663bfb30b58e44981)@dockimbel I wish to have the modular (precompiled runtime) compiler soon, so we would not have worry to add more code into runtime... so one could add all the missing functionality like basic:

```
red>> make string! reduce ["a" "b"]
*** Internal error: reserved for future use (or not yet implemented)
*** Where: make
```

dockimbel

[10:55](#msg56559397f59a8f0758a6bcf1)@Oldes That one is just some missing code in MAKE action for string! type. My concerns about runtime size is much more about Red code there than Red/System one.

Oldes

[10:55](#msg565593b9f59a8f0758a6bcf9)I know.. remember I had all

```
TO
```

actions implemented year ago or more:)

pekr

[10:56](#msg565593d492aa9746647b74f0)Precompiled runtime is scheduled for 0.6.2, so should come relatively soon :-) Well, before big IO 0.7 release ...

dockimbel

[10:57](#msg5655940863bfb30b58e44a11)@Oldes I didn't merge it because TO needs reexamination of conversion rules, which we haven't yet done, not because of added code size (I wish we could have TO already there).

Oldes

[11:00](#msg565594b4f59a8f0758a6bd55)For myself I can say, I examined it quite a lot while working on them.. but never mind... it's not such a big deal... it's just that it hurts when I see code like Arnold has just because missing key basics.

SteeveGit

[11:45](#msg56559f5463bfb30b58e44d31)

iArnold

[12:20](#msg5655a78b63bfb30b58e44f04)Question, when Red encounters a yet undefined variable in a 'function, does it 'declare' the variable in a local scope? And in a 'func ?

Oldes

[12:22](#msg5655a7e863bfb30b58e44f18)

```
red>> f1: function [][a: 1] f2: func[][b: 2]
== func [][b: 2]
red>> a
*** Script error: a has no value
*** Where: do
red>> b
*** Script error: b has no value
*** Where: do
red>> f1
== 1
red>> f2
== 2
red>> a
*** Script error: a has no value
*** Where: do
red>> b
== 2
red>>
```

[12:24](#msg5655a899e34e2efc2fbf5051)So I would recommend using

```
function
```

if you are lazy to write all \_locals_ in the

```
func
```

spec block.

[12:26](#msg5655a8ec63bfb30b58e44f62)(btw... there is no reason to ask such a questions in the

```
red/gui-branch
```

)

iArnold

[12:28](#msg5655a969f59a8f0758a6c256)@Oldes It would help having the right tools at hand. My code is a little messier than needed, but I am trying to get the basic of the GUI up and running, learning on the job. Some code is needed for testing only, so quick and dirty.  
Interesting, would it be better if a new variable in a 'func would get a local scope too?  
You are right again, I ran into these issues when developing stuff using the GUI branch, and I continued chat here. Lazy programmer I am.

Oldes

[12:30](#msg5655a9e2cac1354864a6e21d)\_Interesting, would it be better if a new variable in a 'func would get a local scope too?_ actually in some cases you don't want to do additional scanning to find all local functions as

```
function
```

does.

[12:33](#msg5655aa8c92aa9746647b769d)Note that you can also do this:

```
red>> value? 'c
== false
red>> c
*** Script error: c has no value
*** Where: do
red>> f3: function[/extern c][c: 3] f3
== 3
red>> c
== 3
red>> value? 'c
== true
```

## Thursday 26th November, 2015

iArnold

[21:55](#msg56577fbc485174da4a6dcdc5)For the interested, some new code in my project. Still need to fix some issues though. If it still compiles you should get a nice impression of what it is going to become.

## Friday 27th November, 2015

iArnold

[19:32](#msg5658afcd9f944f86449c3b10)it compiles again.

## Saturday 28th November, 2015

iArnold

[09:56](#msg56597a5548dbbba834b3316a)I created a little Splash screen test. https://gist.github.com/iArnold/52651a605651cb934d84 What puzzles me is that the on-click event does not work so I copied the code to unview/all also in the working on-over event.

[09:59](#msg56597af98ddb1f284acf19b5)And when started from the explorer using a doubleclick there is a dos box showing up. Is there a way to hide that too?

pekr

[10:05](#msg56597c7849fc2afe4a4f838b)Have you tried to compile with -t Windows?

iArnold

[12:00](#msg5659976b343c988079e18891)Trying now, Ah old fashionstyle. Works great!

[12:00](#msg56599774fe7f3ce415cfe9c3)Thanks! @pekr

[13:32](#msg5659ad0a343c988079e188a9)And I had to use on-down :-)

## Sunday 29th November, 2015

iArnold

[16:40](#msg565b2a68bbeafe7b3b1f9bbe)@dockimbel Almost at finishing up stage now.

## Monday 30th November, 2015

PeterWAWood

[01:29](#msg565ba68c9991fe124e15b941)The console doesn't compile using the latest gui branch. I didn't add

```
needs: 'view
```

.

Windows:

```
Compiling /e/Languages/Red/environment/console/console.red ...
*** Red Compiler Internal Error: Script Error : Invalid path value: TYPE_EVENT
*** Where: emit-datatype
*** Near:  [emit extracts/definitions/:type]
```

OSX:

```
Compiling /Users/peter/VMShare/Languages/red/environment/console/console.red ...
...compilation time : 776 ms

Compiling to native code...
*** Compilation Error: invalid definition for function exec/gui/GdipCreateFromHWND: [
    graphics [GpGraphics!] 
    return: [integer!]
] 
...
```

Oldes

[07:28](#msg565bfab12753fafb4af610fd)The gui branch is \_windows_ only quite a long time (but I've not checked recently), @PeterWAWood, and I'm able to compile the console on Windows without problem (both, with and without View).

PeterWAWood

[07:45](#msg565bfe987b1084ab21a5425c)@Oldes The gui part of the gui branch is Windows only. The rest of it, such as the console, are not.

Oldes

[07:51](#msg565c001449e74fad21ebb037)When I tried last time, I was not able to compile the console without gui, but as I said, it's some time ago... I think that in my case it was crashing on the new config staff (related to XP and touch support)

dockimbel

[08:55](#msg565c0f1ac3d575114e6caf36)@PeterWAWood The gui branch is not yet ready to be used on non-Windows systems. On Windows, I just compiled console.red without issues (without the Needs field).

PeterWAWood

[10:15](#msg565c21cfc3d575114e6cb24f)@dockimbel I have updated to the latest gui branch commit and still get a compile error on Windows:

```
>> do/args %red.r "-o win-console.exe environment/console/console.red"
Script: "Red command-line front-end" (none)

-=== Red Compiler 0.5.4 ===-

Compiling /e/Languages/Red/environment/console/console.red ...
*** Red Compiler Internal Error: Script Error : Invalid path value: TYPE_EVENT
*** Where: emit-datatype
*** Near:  [emit extracts/definitions/:type]
```

[10:19](#msg565c22b39991fe124e15c443)The console compiles under OS X using -t Windows but when I run the executable, it doesn't show the &gt; prompt.

```
mbp:Red peter$ rebol -qs red.r -t Windows -o win-console.exe environment/console/console.red


-=== Red Compiler 0.5.4 ===- 

Compiling /Users/peter/VMShare/Languages/red/environment/console/console.red ...
...compilation time : 833 ms

Compiling to native code...
...compilation time : 24654 ms
...linking time     : 197 ms
...output file size : 774656 bytes
...output file      : /Users/peter/VMShare/Languages/red/win-console.exe
```

```
E:\Languages\red>win-console

E:\Languages\red>win-console
```

dockimbel

[10:51](#msg565c2a2328c528077726cb30)@PeterWAWood `-t Windows` target is for removing the console. If you want a console app (or mixed console/GUI) on Windows, you need to use the `MSDOS` target.

PeterWAWood

[13:39](#msg565c51a06693bfd6058dbc73)Thanks

[13:41](#msg565c521d3734bd42649a1c36)I can now cross-compile the console app for Windows.

pekr

[13:45](#msg565c52dd3a09625629649554)Why the resizing was cancelled from the last commit?

dockimbel

[14:14](#msg565c59e33a0962562964968c)@pekr Resizing is not \*cancelled\*, it's just disabled by default, because we don't have any automatic resizing support yet.

## Tuesday 1st December, 2015

djrondon

[18:06](#msg565de19f480c6db205171f04)Doc, Can I test the GUI on Linux? It seems it loads a lot of Windows dlls

pekr

[18:50](#msg565dec006ddbc1b32747c45c)Unfortunately, no. The GUI backend is recently Wimdows only, Android should follow.

## Friday 4th December, 2015

iArnold

[15:34](#msg5661b293d2a5a7813cd43f60)Only have to think of a mechanism to put captured pieces away (and back on the board when a move is taken back)

[15:36](#msg5661b2e4d2a5a7813cd43f79)And is there a way to adjust a z-order for items you place on the window? (Want the active one to become the topmost so not dragging under other items)

pekr

[15:37](#msg5661b33c1da31ad605a8e2ba)I think there is. Window should have a pane, and you can reorder stuff there. Should be a block. It was, at least with R2 .... or something like that :-)

dockimbel

[15:40](#msg5661b3f110eeaf6220871b25)z-order: same as in Rebol2, look into view-test.red, there's a visual test for that.

iArnold

[22:39](#msg5662160b192b17332f983104)Thanks for the hints!

## Sunday 6th December, 2015

pekr

[10:36](#msg56640fa91ab838e56dae5a6d)IIRC we talked about it already in the past, but - is that optimal to have Window/panel options being part of the VID block? It also seems, it needs to be at its beginning. Why not use view/options (already taken) kind of way? Or is that possible both ways?

[11:00](#msg56641530d2a5a7813cd477a0)I have a question towards the Comic Sans MS font usage - it looks terrible here and does not seem to be alieased, not even in terms of the draw block? Could there be a bug?

[11:01](#msg566415a65057376520dbcb60)http://2zone.cz/pekr/red-comic-sans-ms-font-aliasing.jpg

iArnold

[11:13](#msg566418706d841daf37798b36)Perhaps it is better to avoid Comic Sans at all, skipping discussions about the font. There are plenty alternatives.

[11:19](#msg566419a9ba548ebe16006c36)&gt; z-order: same as in Rebol2, look into view-test.red, there's a visual test for that.

All I can find is the reverse of elements in a panel. Is that the example?

pekr

[11:27](#msg56641bb7c15bca7e3c964f4f)most probably yes

iArnold

[11:33](#msg56641cf0ca08083309d60237)I was afraid of that.

[11:36](#msg56641ddaca08083309d6023b)Hope to have some time on monday evening to experiment with that.

pekr

[11:49](#msg566420c3d2a5a7813cd4786e)Why being afraid? Pane is just normal block, so the example uses just the `reverse panel/pane` followed by the `show panel`

iArnold

[11:54](#msg5664220cba548ebe16006c41)Well I have the pieces as base elements on the window now, now I will have to make them part of a panel, all references to indivual pieces must be adapted? In stead of just giving all pieces a new z-order I now have to handle sorting or cycling a block! Perhaps I have a nice Rebol2 example I can reuse from my checkers game.

pekr

[11:59](#msg566423205057376520dbcc5a)I find it quite opposite - it is a beauty, that language elements are reused.

[12:05](#msg566424701da31ad605a91cca)

```
obj1: context [a: 1]
obj2: context [b: 1]
obj3: context [c: 1]

blk: copy []
insert blk reduce [obj1 obj2 obj3]

probe find blk obj2
== [make object! [
        b: 1
    ] make object! [
        c: 1
    ]]
```

dockimbel

[13:34](#msg5664396e1da31ad605a91e84)@pekr \*Comic Sans MS* looks fine here on Win7. I don't remember seeing it as badly rendered as on your screenshot anywhere else.

pekr

[14:31](#msg566446a92cbea1d7054e495d)Win10 here for 2 months, but it wa the same on Win 8.1. Strange thing is, that in MS Word for e.g., it looks quite normal and aliased. Must be something on the Z ed's side

[14:32](#msg56644715c15bca7e3c965328)Uh, typo, not being able to edit on cell phone.

Oldes

[14:35](#msg5664479f77d271e66db230b5)@dockimbel \_Comic Sans_ does not look fine anywhere, it is one of the worst fonts ever made. http://www.comicsanscriminal.com/

pekr

[14:36](#msg566447fb1da31ad605a92031)Maybe that is why it is named Comic :-)

Oldes

[14:41](#msg566449091da31ad605a92050)Appropriate use for \_Comic Sans_ = when your audience is under 11 years old - I think Donald must like it ;-)

WiseGenius

[15:33](#msg566455511da31ad605a92178)@pekr and @dockimbel It's anti-aliased fine here on XP and 7.

iArnold

[20:33](#msg56649ba0ba548ebe16006d95)@pekr seems I used a panel to put all pieces on in Rebol too.

## Monday 7th December, 2015

WiseGenius

[11:20](#msg56656b701da31ad605a93dff)@dockimbel Concerning #1493, I'm experiencing the issue on both Windows 7 and XP. To reproduce it, I basically attempt to display any window.

```
red>> view [text "Hello, World!"]

*** Runtime Error 1: access violation
*** at: 00465FD8h
```

Running the compiled `view-test.exe` or `vid.exe` both give the following:

```
*** Runtime Error 1: access violation
*** in file: /H/Work/Red/Tests Red/2015-12-07-17-53-31-red-gui/red-gui/modules/view/backends/windows/events.reds
*** at line: 822
```

(Now line 822 since \[this commit](https://github.com/red/red/commit/74cb8da0590593c55e8f5de0864543b15d7d8968).)

dockimbel

[11:21](#msg56656ba31da31ad605a93e0d)@WiseGenius We can reproduce it on XP only, we're working on it.

rebolek

[11:26](#msg56656cf8c15bca7e3c96722f)I have the same problem on W8.1

dockimbel

[12:14](#msg56657842c15bca7e3c967401)Fix for #1493 pushed, it works fine here on both 7 and XP. Let me know if you still experience crashes.

rebolek

[12:21](#msg566579b310eeaf622087799f)view-test runs again here

WiseGenius

[12:24](#msg56657a612cbea1d7054e6adb)@dockimbel Working fine here on both XP and 7. :thumbsup:

dockimbel

[12:28](#msg56657b6f2cbea1d7054e6b00)@WiseGenius Great.

meijeru

[15:56](#msg5665ac4ad2a5a7813cd4a75b)Working fine now on Windows 10!

[20:20](#msg5665ea1c7b5b888449a7eb8f)@dockimbel Both `view` and `layout` now have `options` and `flags` refinements, but I don't see a transmission of the `view` ones to the `layout` function (in contrast to `tight` which IS transmitted). Why does `layout` have these options/flags?

## Tuesday 8th December, 2015

dockimbel

[01:55](#msg566638757b5b888449a7f763)@meijeru For the case where you construct the faces using `layout` function and not `view`. The `/flags` refinement is just a shortcut for setting the `flags` facet in faces. `/tight` is transmitted, because it is VID mode that only `layout` can process, while the other refinements are just setting facets in the window Also, we don't have yet `apply` function, so passing combinations of several refinements results in very verbose code.

meijeru

[08:47](#msg56669905b692dc8f48f4e3d1)@dockimbel Do I understand correctly from the source of `show` that the `parent`field of a `para`object may be a block, in other words, a `para` can have multiple parents? How is that used?

dockimbel

[09:12](#msg56669efd7b5b888449a80176)@meijeru That is right, it's for allowing several faces to share the same `para` object (same for `font`). That way you can modify the para/font properties for several faces at the same time (if you need to).

meijeru

[10:12](#msg5666ad0e981d32824933585a)@dockimbel Clever, but can you set that in VID dialect?

dockimbel

[10:16](#msg5666ade8868b8da62a25566d)@meijeru For now the only way to share them from VID is when you instantiate a face using a new style created using `style` keyword, for example:

```
style btn: button bold font-size 20
```

All the instances of `btn` will share the same font object.

meijeru

[20:25](#msg56673ca0981d3282493371fc)@dockimbel What is the point of having a `map!` value as `data` for a `drop-down` or `drop-list` face? BTW, you cannot do this in VID, only when constructing the face explicitly. Also, in`view-test.red` you put quite consistently string values alternating with integers in the data block (not a map!), but in the back-end only the string values are transmitted to the OS. Forgive me for being puzzled.

[21:14](#msg5667484b835961e946e1f6cf)@dockimbel Another thing: in the `draw`dialect, `text` must be followed by a `pair!` and a `string!` value in that order (changing them around gives an error) but `image` may be followed by an `image!` value and a `string!` value in any order. Surely this freedom can also be given to `text`.

[21:18](#msg56674911835961e946e1f6ee)@dockimbel Also, in the `draw` dialect conversion to OS, with `image`there is provision for a key-color and optional words `border` `reflect` and `repeat`. But putting these in the VID gives an error!

## Wednesday 9th December, 2015

dockimbel

[01:15](#msg566780a6835961e946e1ff0e)@meijeru \*What is the point of having a map! value as data for a drop-down or drop-list face? * Where did you see that?

[01:19](#msg566781bdaccacb9048922b9e)@meijeru `drop-down` and `drop-list` currently accept different data format according to user needs. It is very common for this type of widget to hold a list of labels for display and integer IDs for processing. So that when an item is selected, you can retrieve the corresponding ID value. Though, in some cases, the label is the value you want to retrieve, so the data structure is flexible enough to let you just list labels.

[01:27](#msg566783881af293de4696ade7)Draw dialect: we need to improve the processing of keyword arguments. The fact that \*image* accepts out of order argument is due to current weak implementation, it should be stricter (currently you can feed it with arbitrary number of same arguments). I am thinking about a `delect`-like approach for accurate argument parsing while maintaining high speed. If this can be generalized, then other keywords could benefit from it.

[01:29](#msg56678409c4b3d2a52a6b084b)@meijeru `But putting these in the VID gives an error!` You mean putting these in a Draw block inside VID?

meijeru

[08:06](#msg5667e11ec4b3d2a52a6b124c)@dockimbel \*What is the point of having a map! value as data for a drop-down or drop-list face? * Where did you see that? In init-drop-list`in`%backends/windows/text-list.reds\`, from line 58 onwards.

[08:08](#msg5667e160868b8da62a2584f8)@dockimbel `But putting these in the VID gives an error!` You mean putting these in a Draw block inside VID? Indeed.

[08:10](#msg5667e1e1835961e946e20942)@dockimbel \*`drop-down` and `drop-list` currently accept different data format according to user needs.* I can see the use you mention, but for that you will need to access the original data. Will the VID interpreter put the whole block in the `data`facet?

pekr

[08:11](#msg5667e24f981d32824933870f)@dockimbel - "All the instances of btn will share the same font object." - is there actually a way of how to prevent that? I do remember endless errors with R2, where ppl tweaked colors, borders, etc., and wondered, why it affects all widgets on the screen of particular type/style. R3 e.g. introduced `facet`vs `faced`, where style designer could decide, what should be shared, and what should be copied ...

[08:29](#msg5667e66aaccacb904892370c)As for DELECT - it was deprecated and was not later used in R3 internally anymore. I found some Altme chat, where Andreas said, that it might be replaced by the Parse OF keyword, which was not implemented though ...

[08:32](#msg5667e731c4b3d2a52a6b130f)https://archive.is/xjClU

dockimbel

[10:51](#msg566807c5868b8da62a258ac1)@meijeru The `drop-*` widgets can accept data in different container, blocks, hash or map. VID will assign whatever block you provide after `data` keyword to `data` facet.

[10:55](#msg5668088b835961e946e20f30)@pekr Yes, simply don't specify font in the style definition, then it won't be shared, or alternatively, overload an instance of the style locally with a `font` keyword in VID. What the style designer does and what the user does are two different things. In Red VID, the sharing is an effect of user's instructions, in Rebol2/VID, it is an implicit behavior of the VID dialect processor.

[10:56](#msg566808d2981d328249338d2e)DELECT and OF are the same thing, one is exposed as a native, while the other is exposed through a Parse keyword.

pekr

[10:58](#msg5668096f981d328249338d4d)btw - IIRC, DELECT was meant for VID, but also for the COMMAND interface of R3 plugins ...

meijeru

[19:48](#msg5668858ab692dc8f48f530a6)@dockimbel Continuing my efforts at understanding the GUI... I notice that any window created is put in the pane of the screen face, but the parent field of the window is not filled in (it should point to the screen face, right?)

[19:49](#msg566885aeb692dc8f48f530ae)@dockimbel Also, the screen face has an extra field called `name`. What is its significance?

iArnold

[20:43](#msg5668925edd72cc3c65eb6265)A panel cannot be transparent? color: none works on type: 'base but not on type: 'panel

[20:48](#msg566893a15cc42d160dfaa653)And a base cannot hold faces like the 'panel can. So I can now choose between having no pieces on my board or pieces without a board :-/

[21:11](#msg56689906dd72cc3c65eb6285)Already solved by making panel have size 0x0

[21:15](#msg566899edbada93d67c1ae71d)@dockimbel @qtxie you can get a taste of the gui version at the usual place at github

## Thursday 10th December, 2015

dockimbel

[02:50](#msg5668e87d868b8da62a25b141)@meijeru The window `parent` facet is not set yet for to keep the implementation of SHOW simpler, it will be set in the future (especially when the screen faces will be really linked to the display monitors).  
`name` is for the display name, as provided by the OS (unused yet).

[02:53](#msg5668e92d7b5b888449a85b23)@iArnold `panel` cannot be tranparent, but setting its size to 0 can do the trick as you found out. A `base` face can have a `pane` block (untested so far though).

iArnold

[07:22](#msg56692821b692dc8f48f54320)@dockimbel Thank you. I tried it by changing the type from 'panel to 'base and that did not work, the faces/images from the pane were not shown.

meijeru

[07:58](#msg566930b77b5b888449a86121)@dockimbel Thanks for the explanations. Now I am puzzled about `divides`. How is it used?

pekr

[08:07](#msg566932cb835961e946e23a4d)I wonder, if the transparency is not exposed by particular native widgets, or it is not just yet wrapped inside of Red? E.g. even top app window can be set as transparent, IIRC, I wonder, if panel is prohibited from doing so? If so, then it is very lame Windows design ....

dockimbel

[08:26](#msg5669374f981d32824933b97a)@pekr Windows pre-8 does not support any transparency for built-in widgets. In order to achieve it, you need to build custom ones. Windows GUI design is indeed lame, from many perspectives. If MS had stuck to GDI(+) and just kept improving it instead of building tons of new, more or less, incompatible layers, Windows GUI system would have been just great.

pekr

[08:31](#msg5669387dc4b3d2a52a6b4494)That is a real pity. I do remember all those Linux/Unix UI managers and translucent consoles, etc :-) Cyphre got managed top window to be transparent - he did some demos, IIRC something like AGG nicely aliased clock upon the Windows XP desktop. Pity native widgets don't support that.

[08:32](#msg566938a8835961e946e23ae7)I also do remember CA-VO we used to program, and sometimes programmers did hack some lower level Win32 API funct, to get some tricks done, but as you say - it should be supported by the system in the first place ....

dockimbel

[08:37](#msg566939b4835961e946e23b0d)It is supported from Win8 on. But, as you can imagine, getting it to work transparently (pun not intended) for users across Windows versions is a challenge (see our `base` face backend implementation).

[08:40](#msg56693a677b5b888449a86249)We should add support for transparent panels though, we need such feature.

meijeru

[14:49](#msg566990f91af293de4696f9a0)@dockimbel I noticed that several `draw`commands allow for "symbolic" arguments, i.e. a word which is bound to a value. However, `circle` and several others do not allow this. It would be possible in `draw.red` to factor out the fetching of symbolic arguments, just like it is done in `VID.red`. This would greatly help programming some drawings where elements are computed.

dockimbel

[15:56](#msg5669a0c0b692dc8f48f55697)@meijeru Yes, such change is planned, the current Draw parser is a quick implementation just to make it available asap.

meijeru

[16:10](#msg5669a413981d32824933cd68)@dockimbel Yet another thing: `VID` does not recognize `on-create`. A pity!

## Friday 11st December, 2015

WiseGenius

[04:05](#msg566a4b72da512f8905d5e93a)@dockimbel `foreach` always iterates over 3 pixels of an image, regardless of the size:

```
red>> foreach i make image! 100x100 [probe i]
0.0.0.255
0.0.0.255
0.0.0.255
== 0.0.0.255
```

```
red>> foreach i make image! 1x1 [probe i]
0.0.0.255
none
none
== none
```

dockimbel

[04:08](#msg566a4c4cde5536717681063d)@WiseGenius Good catch, please open a ticket for it.

## Thursday 17th December, 2015

WiseGenius

[12:38](#msg5672acdccc068a5e42f1c665)@dockimbel In \[September](https://gitter.im/red/red/gui-branch?at=55f0397e6fe7b2a123ea8d98) @qtxie confirmed my observation that “the 4th value in a Red colour denotes opacity as it does in Rebol 3, CSS, RGBA, etc., and not transparency as it does in Rebol 2.” However, the latest commits seem to have switched that around. Have you changed your mind?

dockimbel

[13:34](#msg5672b9fd37169e856a754804)@WiseGenius Yes. Denoting opacity instead of transparency is just not practical enough.

WiseGenius

[13:42](#msg5672bbbaf99ceb846ae6694c)Thanks. I'll keep that in mind in future reports.

dockimbel

[13:44](#msg5672bc4137169e856a754867)It will be part of the GUI documentation I'm writing this week.

SteeveGit

[18:32](#msg5672ffadf99ceb846ae676c4)Question: What will be the future implementation of the DRAW dialect? Especially on Windows, It can't be stuck with the Win 32 API for eternity , right? One need real SVG like capabilities.

[18:58](#msg567305c1b5777fb85ba4777d)Hmm... François Jouen and his opencv port, seems to be the way...

[19:14](#msg5673097ff31bbe91555b0aab)or not...

pekr

[20:27](#msg56731a9df99ceb846ae67b8d)Not sure IpenCV is the answer here ....

SteeveGit

[20:33](#msg56731c2e5155bfb75b171d4f)Definitly not, opencv still needs a front end to play with vector graphics

[20:34](#msg56731c53cc068a5e42f1d864)back to AGG ;-)

[20:35](#msg56731c8137169e856a755aa4)Oh my... I just learned that the creator of AGG is dead in 2013.

## Friday 18th December, 2015

pekr

[01:00](#msg56735ab9f99ceb846ae68558)Yes, he died quite young. We realised it just a year ago, actually I found out, lookimg for some AGG news. What I like about the AGG is its compactness and the quality of the output. Cairo was much worse back at thise times, yet it was selected by projects as Mozilla. Because its author had influence there - politics.

[01:03](#msg56735b5ccc068a5e42f1e14f)Doc is right, that we need hw accelerated drawing, which AGG was not. But I am not sure we can get anything comparatively ose to AGG quality by default Win32. We will see. I will believe it, once I can see demos like Cyphre, Particles in Red :-)

[01:05](#msg56735bd2cc068a5e42f1e154)Its about the feeling. And seeing first AGG demo in R2 was like reinventing Amiga in Rebol land. Since that time, no other wow effect happened to me in Rebol land. But - I believe in future of Red, we will get there no matter what :-)

dockimbel

[02:56](#msg567375c2f31bbe91555b1a88)@SteeveGit Win32 through GDI+ has full range of features required for SVG , it's just a matter of time to wrap them all. For the future, we'll add more backends to Draw (possibily both OpenGL/DirectX and AGG), so you can pick up the best one for a given task. Unfortunately, I don't know a 2D lib out there which has all the features and which is not bloated. By the way, if someone is willing to wrap AGG to make an alternative backend for Draw, he's welcome.

Oldes

[06:12](#msg5673a3e9ed2c39cb191ceeaf)Maybe http://blend2d.com once released is the future AGG

dockimbel

[06:33](#msg5673a8b4b5777fb85ba48c3a)@Oldes Looks promising but closed-source development smells bad...

asampal

[07:10](#msg5673b14db803c2e518c54d98)looks like they promise a zlib license when source will be released

iArnold

[07:57](#msg5673bc64f99ceb846ae68d13)On my project I bounced upon a problem with reordering face objects on a panel. Replaced items disappear and as an unpleasant bonus the pane is disconnected from the window, so dragging the window leaves the remaining images behind on the screen. As usual the mess is to be found at the regular site for if you like a small challenge :-/ (off course without any simplifications!)

dockimbel

[08:10](#msg5673bf6aa95dea5d42154454)@iArnold Please isolate the problem in smallest possible source code and open a new ticket about it.

iArnold

[09:06](#msg5673cc98cc068a5e42f1ea1f)@dockimbel Will try to find the time to do so.

SteeveGit

[11:42](#msg5673f11f69a89a8f552f24d3)@dockimbel Ok, GDI+ fulfil the quest. Sometimes I feel like and old monk recently out of retirement.

iArnold

[12:02](#msg5673f5becc068a5e42f1efee)@dockimbel https://gist.github.com/iArnold/2bd823cb5c2ba8abf6e0 only need two images in an image folder

[12:08](#msg5673f74af99ceb846ae695f0)Also created an issue. Have used most recent GUI branch to test.

dockimbel

[12:09](#msg5673f77f69a89a8f552f25b9)@SteeveGit SVG support is high on my list, I really want to have a native SVG loader/renderer in Red.

[12:10](#msg5673f7a337169e856a7574a0) @iArnold Thanks.

Oldes

[12:11](#msg5673f80469a89a8f552f25c9)@iArnold without actually trying it... you should probably call

```
show
```

on holder of your pieces (

```
piece-panel
```

in your case), not just the piece which change depth. Here: https://gist.github.com/iArnold/2bd823cb5c2ba8abf6e0#file-tb-red-L35

[12:14](#msg5673f8bfcc068a5e42f1f063)@dockimbel sorry for my laziness not trying it myself, is it possible to call

```
show
```

on block?

[12:27](#msg5673fba3f99ceb846ae696a6)@iArnold try this:

```
bring-to-top: func [face item] [
    append face/pane take find face/pane item
    show face
]
```

With not using

```
bring-to-top piece-panel/pane face
```

but just

```
bring-to-top piece-panel face
```

[12:28](#msg5673fbd3cc068a5e42f1f0de)(when you can be sure that the item is always in the face's pane)

dockimbel

[12:32](#msg5673fce55155bfb75b1738e9)@Oldes Yes, it is supported.

meijeru

[12:54](#msg567401f65155bfb75b1739bf)@dokimbel Not sure if these are features or issues, therefore posted here first: (1) if in a VID block one positions some controls with `at` then all subsequent controls also have to be positioned with `at` because otherwise they will be placed somewhere unexpected. Ideally, a control without `at` should be placed \*next* to the previous control, across or below according to the value of `direction`... (2) when specifying a background color for a panel, the text controls will have their own background which is grey by default. Shouldn't text controls have a transparent background by default?

SteeveGit

[12:57](#msg567402a2b5777fb85ba49820)

[13:03](#msg56740405cc068a5e42f1f216)@meijeru, Is that not the behaviour of \*\*origin\** keyword instead of \*\*at\*\*?

iArnold

[13:05](#msg56740485f99ceb846ae69808)@Oldes Thank you, I'll try later. I have used show on everything including the window (win) itself.

[13:08](#msg567405655155bfb75b173a45)@oldes Tried your suggestion but the clicked item still disappears.

[13:12](#msg5674064ba95dea5d42154e06)This bring-to-top function was used within my R2 cbh.r script (rebol.org) under the name move-to-top.  
Because R2 works with 'feel it is all a little different. Thought this approach should also work. Perhaps I must try without naming the pieces within the pane somehow.

Oldes

[13:29](#msg56740a4037169e856a757794)@iArnold hmm... I was trying it too now, and you are right it's not working, so there is probably some bug.

[13:34](#msg56740b4af31bbe91555b2b23)@dockimbel this works:

```
bring-to-top: func [face item] [
    reverse face/pane
    show face
]
```

this does not works:

```
bring-to-top: func [face item] [
    append face/pane take find face/pane item
    show face
]
```

[13:42](#msg56740d5237169e856a757828)@qtxie My naive guess without looking at sources is, that remove from pane releases face's resources and so it becomes invisible.

[13:50](#msg56740f1237169e856a75786a)And it's not related to images.. using just colors has same effect.

dockimbel

[14:11](#msg56741413f240f5a004172d23)@meijeru (1) `at` should not have any effect on faces after the first one, if it's not the case anymore, it's a regression. (2) The native `text` widget on Windows XP/7 cannot have transparent background. You can either change its background color to match panel's one or use the more flexible `base` face.

Oldes

[14:14](#msg567414c5f99ceb846ae69a8d)@iArnold it looks that the problem is related that you have your pieces in

```
panel
```

[14:27](#msg567417c3f31bbe91555b2d2e)Unfortunately it's completely weird.. I give up:) @dockimbel here is my simplified version: https://gist.github.com/Oldes/5b549aa56391542a9b5d

dockimbel

[14:38](#msg56741a5537169e856a757a7c)@Oldes Thanks! Could you please post it as comment in the ticket?

Oldes

[15:00](#msg56741f785155bfb75b173e97)Is there already a ticket?

dockimbel

[15:00](#msg56741f8ab5777fb85ba49ce3)Yes, @iArnold opened one.

meijeru

[15:13](#msg567422ae5155bfb75b173f32)@dockimbel Re (1) what I was formulating as a wish is precisely that `at` \*should* have that effect on faces (this is the way it is in RebGUI) (2) I understand - `base` will work fine for text faces, but I think not for other controls, because these cannot be sub-faces of `base`, right?

iArnold

[15:19](#msg567423e969a89a8f552f2cf4)&gt; @iArnold it looks that the problem is related that you have your pieces in

```
panel
```

I moved them inside the panel to be able to re-arrange them so the last one dragged drags over the others, not under. :-)

Oldes

[15:30](#msg5674269f091b6f9e0439b4d4)You can use base, instead of panel, no? But anyway, it does not solve the issue.

[15:54](#msg56742c27f99ceb846ae69ee6)@dockimbel what about this sub-issue: https://gist.github.com/Oldes/5b549aa56391542a9b5d#file-tb-red-L50

[16:05](#msg56742eb05155bfb75b1741d2)@iArnold temporary you can use

```
swap
```

to get the piece on top (https://gist.github.com/Oldes/5b549aa56391542a9b5d#file-tb-red-L19), although it's not perfect solution and there is also issue with calling many

```
on-over
```

events when clicked with current gui version.

meijeru

[16:09](#msg56742fd069a89a8f552f2f69)@dockimbel Another point, what is the use of the `enable?` facet?. I thought it meant: "face can(not) receive events". If I set it `false` for a `field` face, I can still type into it.

Oldes

[16:23](#msg5674330ff31bbe91555b3243)@iArnold hm.. sorry.. it looks that

```
base
```

is not able to display images at all, so I probably don't have enough info about it:)

iArnold

[18:36](#msg56745242efc84db71fcfed71)&gt; @iArnold temporary you can use

```
swap
```

to

I can live with

```
swap
```

The base solution was what I had first but that did not work. I had the pieces as separate base items in the beginning.

meijeru

[21:58](#msg5674818869a89a8f552f3c27)Further to my previous message: In fact, I don't see anywhere in the code that `enable?` is tested to prevent an event from being transmitted.

## Saturday 19th December, 2015

dockimbel

[03:42](#msg5674d20cb5777fb85ba4b2ca)@meijeru Yes, we forgot to add support for disabling faces.

meijeru

[09:58](#msg56752a5637169e856a759681)On a related subject: is `visible?`effectively supported??

dockimbel

[10:19](#msg56752f1b37169e856a7596c5)It should be, but we haven't tested it beyond the `base` face.

meijeru

[10:24](#msg5675305ff99ceb846ae6b774)As you may have seen from my preliminary write-up, the following items are either not implemented (perhaps just not easily found in the sources) or not described (yet):

[10:29](#msg56753189f99ceb846ae6b780)/modal, /parent divides, face/rate, face/edge, font/shadow, font/state, para/scroll, all-over flag, event/picked, event/away?

[10:36](#msg5675333ff240f5a004174a90)@dockimbel It looks like `visible?` works for controls.

## Sunday 20th December, 2015

dockimbel

[03:24](#msg56761f53f240f5a004175d45)@meijeru Good, thanks for testing.

## Monday 21st December, 2015

nickantonaccio

[05:41](#msg5677910137169e856a75c457)  
I'm able to compile GUI scripts using the current https://github.com/red/red/tree/gui branch (with do/args %red.r "%myscript.red" in the rebol interpreter), but I'd like to test the the scripts more quickly, using "do %myscript.red", in the compiled red.exe interpreter. I have a working red.exe (compiled using the instructions at https://github.com/red/red/tree/gui/build), I have "needs: 'view" in the script header. What else is required to run GUI code directly in red.exe?&gt;

dockimbel

[05:47](#msg5677928af240f5a0041777e7)You need to recompile the console manually with the Needs field set. I will see today if we can do the planned changes in the toolchain to support it automatically.

nickantonaccio

[05:49](#msg56779301f99ceb846ae6e457)Thanks :)

SteeveGit

[19:53](#msg567858a6b5777fb85ba4feca)@dockimbel , What do you intend to use as a rich text control in the future ?  
And how do you intend to distribute the code payload (Red vs OS GUI control)?  
Do you think about something approaching the rich text dialect of Rebol3? Eavly based on the draw dialect?

[19:55](#msg5678593eb5777fb85ba4fed7)I'm especially interested in the problem of correctly handling the caret.

## Tuesday 22nd December, 2015

dockimbel

[06:55](#msg5678f3c637169e856a75ecc3)@SteeveGit I'm not sure yet, we could try first the rich text classes provided by OS, if we can find a common ground across all our target GUI backends. The long term option would be to make a cross-platform custom one using the Draw engine (probably close to what R3 did, though, I haven't looked much into it yet).

[06:56](#msg5678f41137169e856a75ecc9)@SteeveGit I'm not sure to understand what you mean by "Red vs OS GUI control"? Red is a single binary which depends only on what the OS provides.

[06:57](#msg5678f45637169e856a75ecd2)Correct caret handling is one tricky part.

[06:58](#msg5678f490f31bbe91555b9f32)Another option for handling such component would be to use a webview component.

## Sunday 27th December, 2015

iArnold

[11:34](#msg567fccac66a282570f904351)&gt; @iArnold temporary you can use

```
swap
```

to get the piece on top (https://gist.github.com/Oldes/5b549aa56391542a9b5d#file-tb-red-L19), although it's not perfect solution and there is also issue with calling many

```
on-over
```

events when clicked with current gui version.

Today I tried this on a Windows 8.1 machine. It did not show the images. Can anyone confirm this? I have the images in the images folder (or else the program would have complained they were not present) but they do not show up like they did on the Windows 7 I used before to test.

[15:59](#msg56800accff981dbc7633fcba)(So is it me or is there a difference between Win 7 and 8 that is responsible)?

nickantonaccio

[16:51](#msg56801713653b30761d763cb2)This works:

view layout \[text-list data \["John" "Dave" "Jane" "Bob" "Sue"]]

This doesn't:

mylist: \["John" "Dave" "Jane" "Bob" "Sue"]  
view layout \[text-list data mylist]

What is the appropriate syntax?

iArnold

[19:19](#msg568039bf66a282570f9043ea)@nickantonaccio You can find the example code in the github repository https://github.com/red/red/blob/master/tests/vid.red and  
https://github.com/red/red/blob/master/tests/view-test.red

[20:19](#msg568047eb2a06b81d5bf85287)I suspect you are trying the VID style. It does not use the word layout between 'view and the layout block. For the rest I would expect both direct block and using a variable that contains the block to work. Could be a bug too.

nickantonaccio

[21:09](#msg5680536c9606b15a055dcc5c)@iArnold As far as I can tell,

[21:10](#msg568053e035e1a316162e5c0a)@iArnold 'layout is optional when viewing a block of VID code directly, but it doesn't change anything - we can still compose a block of VID code, apply the 'layout function to it, and then 'view that result, correct?

iArnold

[21:14](#msg568054d32a06b81d5bf852a2)I do not see 'layout used in the examples. If you make it  
view layout: \[your layout block here]  
it should work. Red's VID is not R2's VID copied 1 on 1.

nickantonaccio

[21:19](#msg568055f8653b30761d7642ef)I haven't had any issue using 'layout inline - it works as expected in all my code examples so far -it can be there or not, doesn't change a thing at all...

That's not the problem here, in either case. This works without issue:

mylist: copy \["John" "Dave" "Jane" "Bob" "Sue"]  
view [  
t: text-list data \[]  
do \[append t/data mylist]  
]

But, it seems there must be a more direct approach to setting the text-list data. Do you know what is the expected way to accomplish this most basic operation?:

mylist: \["John" "Dave" "Jane" "Bob" "Sue"]  
view \[text-list data mylist]

iArnold

[21:24](#msg5680570fff981dbc7633fd78)(There are some more differences, also in actions where R2 uses 'feel.)  
could work like this  
t: make face! [type: 'text-list  
data: \["John" "Dave" "Jane" "Bob" "Sue"]  
]  
Unfortunately no Win to be used here now.

[21:25](#msg5680573b66a282570f904429)@dockimbel Is Nick's problem a bug in Red VID?

[21:31](#msg568058baff981dbc7633fd7e)(because I expect too that last two lines of Nick's code to be the way this should work)

## Monday 28th December, 2015

nickantonaccio

[00:54](#msg5680885c35e1a316162e6031)Also, this works:

[00:56](#msg568088cb3c6894026924faed) mylist: copy \["John" "Dave" "Jane" "Bob" "Sue"]  
view [  
t: text-list data \[]  
do \[append t/data mylist]  
]

But this doesn't:

mylist: copy \["John" "Dave" "Jane" "Bob" "Sue"]  
view [  
t: text-list data \[]  
button "Add to list" \[append t/data mylist]  
]

iArnold

[20:49](#msg5681a05066a282570f904684)@dockimbel appended a new comment about WIn 8 problem to issue #1513, seems to be another issue with this workflow for grouping images within a panel.

## Tuesday 29th December, 2015

dockimbel

[07:05](#msg568230ca0171d1791d027d01)@nickantonaccio Both should work. `layout` is automatically invoked by `view`if you are passing a block value. If it's not the case, please open a ticket.

[07:06](#msg5682310b0199d70069e00ae1)@iArnold Thanks. @qtxie ^---

nickantonaccio

[13:35](#msg56828c229606b15a055e01cf)@dockimbel I wasn't having any problem with 'layout (that was a topic brought up by iArnold). The issues with text-list, however, are troublesome. What is the appropriate way to do things like:

[13:38](#msg56828cb835e1a316162e8b24)

```
mylist: ["John" "Dave" "Jane" "Bob" "Sue"]
view [text-list data mylist]
view [
    t: text-list data []
    button "Add to list" [append t/data mylist]
]
```

## Wednesday 30th December, 2015

dockimbel

[09:25](#msg5683a32235e1a316162ea972)@nickantonaccio Both ways should work fine, if not, please open a ticket so we can fix it.

nickantonaccio

[11:53](#msg5683c5a3653b30761d769d8d)Opened #1522
