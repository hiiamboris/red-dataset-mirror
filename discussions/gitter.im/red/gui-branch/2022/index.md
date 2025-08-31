# Archived messages from: [gitter.im/red/red/gui-branch](/gitter.im/red/red/gui-branch/) from year: 2022

## Saturday 1st January, 2022

gltewalt

[17:20](#msg61d08d51526fb77b315abda9)Cookbook page on new site?

greggirwin

[20:38](#msg61d0bbd246529077f5637b60)@gltewalt something like that, but needs to support user contributions, searching, etc. so not a small task.

cloutiy

[21:51](#msg61d0ccfdd143b14f83f76189)"...no small task.". Red: "Hold my beer..."

greggirwin

[22:31](#msg61d0d6309a3354540600759a)Famous last words. :^)

gltewalt

[23:02](#msg61d0dd73d143b14f83f77d54)Does it, or can user contributions be curated from the wiki or a repo?

greggirwin

[23:04](#msg61d0de0c5ee4df335ac393d2)Why not just use the wiki or repo directly then? We could write an app to access the data there.

## Sunday 2nd January, 2022

gltewalt

[03:00](#msg61d115379b470f3897473928)Sure. And for that kind of thing, I'm guessing repo

greggirwin

[03:46](#msg61d1200d6d9ba233289f34c6)Agreed.

[03:46](#msg61d12020742c3d4b21786b94)We could add %cookbook/ sections to /code or /community.

zentrog:matrix.org

[20:46](#msg61d20f1f9b470f389748d9f2)https://www.red-by-example.org has lots of samples!

greggirwin

[20:51](#msg61d2103f2a210c38c1aba9c6)@zentrog:matrix.org yes, it's a great resource. I think @mikeyaunish wants "How do I do task X?" versus "How does function X work?"

gltewalt

[22:01](#msg61d220b79a3354540602a1b2)http://www.rebol.net/cookbook/

## Monday 3th January, 2022

zentrog:matrix.org

[00:38](#msg61d2457b2a210c38c1ac02f5)greggirwin (Gregg Irwin): I see. I think stack overflow is great for those sort questions too

greggirwin

[02:36](#msg61d261475dc6213cd4c1ba40)Agreed, we just don't have a presence there, and it will be a long time ramping that up.

zentrog:matrix.org

[03:08](#msg61d268c82a210c38c1ac3dde)There are some reducers following the red tag. Questions definitely get answers

mikeyaunish

[16:15](#msg61d3210d742c3d4b217be821)Actually I am thinking of a search engine that gives you results that pin point a sentence in a document rather than just dumps you into a page and "find it yourself". This is 2022 after all.

hiiamboris

[16:22](#msg61d322c77842bd3ca929e93b)In that case, wiki + github search is the way

[16:24](#msg61d32345f5a3947800e87c74)Google doesn't seem to index GH contents though. But indexes SO.

ldci

[16:29](#msg61d3246446529077f5679e08)@mikeyaunish : have a look here : https://iscpif.fr/projects/linkrbrain/?lang=en. It's for brain but very illustrative of new methods for data retrieving

mikeyaunish

[16:34](#msg61d325adf5a3947800e8818c)@ldci I like what they are saying. Not sure which link illustrates what their search results look like though?

ldci

[16:38](#msg61d3267a9a335454060477b9)@mikeyaunish You have it : Click on "Aller sur la plateforme"

mikeyaunish

[16:49](#msg61d32905e1a1264f0a3a55ad)Thanks @ldci . My french is very rusty.

ldci

[16:49](#msg61d32937526fb77b315f4bd7)@mikeyaunish You're welcome

## Tuesday 4th January, 2022

greggirwin

[01:16](#msg61d3a003f5a3947800e96d2f)Clearing things out, I came across https://2021.stateofcss.com/en-US/. Lots of data there. The key thing for us is figuring out the important bits people really need, especially as it relates to Red Spaces.

[02:14](#msg61d3ad81742c3d4b217d0504)Related to the above. Some cute things, and some things I don't see the value in.

https://www.smashingmagazine.com/2021/10/modern-css-solutions-for-common-problems/

ldci

[04:23](#msg61d3cbc1d143b14f83fcaa8b)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/74LD/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/74LD/image.png)

[04:23](#msg61d3cbdf6d9ba23328a40771)Have a look here: https://openmoji.org with a lot of free png files to include in your Red code.

olivier\_lp\_twitter

[18:43](#msg61d49535526fb77b3162239e)Hi, a very beginner question, how can i make the rebol equiivalent :

```
view layout [b: text "hello" red edge [size: 1x1 color: blue] [b/font/colors/1: blue b/font/colors/2: red show b]]
```

for the font part I did

```
view layout [b: text "hello" font [color: red] [b/font/color: blue]]
```

but i was compelled to init font  
Is there a way not to make init in the layout block! Otherwise for edge attribute, don't know how to

greggirwin

[19:01](#msg61d499a282a4667b255c8a97)Nice find @ldci !

ldci

[19:08](#msg61d49b32742c3d4b217ee820)@olivier\_lp\_twitter Edge is reserved for the future:)

[19:15](#msg61d49cdc742c3d4b217eec83)@greggirwin Unicode fonts depends on your OS. For the moment openMoji.ttf is experimental. and color emojis are black and white. Do not install openMoji.ttf : it's a mess. So wait and see :)

greggirwin

[19:15](#msg61d49ce77842bd3ca92ce999)@olivier\_lp\_twitter `edge` can't be applied to native widgets, so it doesn't exist yet. We'll see how skinning and other `edge` applications end up working in Red Spaces.

[19:16](#msg61d49d06d41a5853f933dbb1)@ldci thanks. That's why the PNG options could be very cool.

ldci

[19:17](#msg61d49d41742c3d4b217eed17)@greggirwin exactly 72x72 pixels png files supported by Red :)

[19:18](#msg61d49d992a210c38c1b09f58)@greggirwin But openMoji is coherent with unicode.org.

[19:20](#msg61d49df7bfe2f54b2e004736)Aesthetically , I appreciate the flat design :)

hiiamboris

[19:27](#msg61d49fb0f5a3947800eb71cf)@olivier\_lp\_twitter `view [b: base 80x20 "hello" glass red draw [pen blue box 0x0 80x20]]`

greggirwin

[21:37](#msg61d4bdfc526fb77b31627a75)I'll post this here, since it may interest others.

https://www.nngroup.com/articles/golden-ratio-ui-design/

Lots of "old news" there for some (I designed a log spiral that was etched into the floor at my old house), but a few tidbits I didn't know. While https://grtcalculator.com/ doesn't seem to work right now, could we use that idea for smarter layouts, and tools that suggest settings? But what struck me as not-too-hard, useful, and fun for the graphically oriented, is the image cropping idea.

olivier\_lp\_twitter

[22:13](#msg61d4c68782a4667b255ce732)Thanx for the answers

## Wednesday 5th January, 2022

GalenIvanov

[07:34](#msg61d54a0cf5a3947800ecb26c)Interesting article, @greggirwin !

planetsizecpu

[15:19](#msg61d5b6f8742c3d4b21810711)Now testing new L29, for those who like space exploration 😑

[15:19](#msg61d5b7116d9ba23328a7d50c)\[!\[cavetest290.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/g0ij/thumb/cavetest290.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/g0ij/cavetest290.gif)

[15:26](#msg61d5b8ae526fb77b316455fe)I think I'm going to stop at L-thirty, it is enough as an example for future reducers to test 🙂

hiiamboris

[15:29](#msg61d5b969d143b14f83008db8)what are you then going to do with your weekends? ;)

GalenIvanov

[15:52](#msg61d5beacbfe2f54b2e027fef)@planetsizecpu Nice! Maybe you will start thinking of a new game?

planetsizecpu

[17:37](#msg61d5d743742c3d4b218158cc)Well it has no sound so there is a lot of work pending.

## Saturday 8th January, 2022

pekr

[10:57](#msg61d96e1046529077f5746a95)@GalenIvanov It seems to me the new year demo does not work anymore, and after a while it just closes Red?

GalenIvanov

[17:03](#msg61d9c3e5742c3d4b21893c52)@pekr I'm currently making changes. I'll fix it and will let you know.

## Sunday 9th January, 2022

cloutiy

[13:38](#msg61dae560e1a1264f0a496a46)I have a question regarding multi step forms. For example if i have a form for user to input a couple fields, then click next button to go to next part to fill. What is the view approach to this? Is it to define a layout for each "page" and toggle the visibility on button click? Is there an example either in rebol or red to look at? Thank you

hiiamboris

[13:44](#msg61dae6a16d9ba23328b1f263)there's no ready OS widget for that, but you can define multiple `panel`s and show/hide them

[13:53](#msg61dae8d6f5a3947800f795dc)

```
view [
	box cyan "My installer" p: panel [
		panel [box {Just click "Next" a few times}]
		at 10x10 panel hidden [box {Ok, again...}]
		at 10x10 panel hidden [box {Ok, "Finish" now...}]
	] return
	pad 200x0 button [
		repeat i len: length? p/pane [
			if p/pane/:i/visible? [
				if i = len [unview print "Atta boy!" break]
				p/pane/:i/visible?: no 
				p/pane/(i + 1)/visible?: yes 
				break
			]
		]
	]
	react [face/text: pick ["Finish" "Next"] p/pane/3/visible?]
]
```

cloutiy

[20:32](#msg61db4670d41a5853f940b92a)🤔

## Monday 10th January, 2022

chunes3

[07:44](#msg61dbe3f582a4667b256a7a2b)Is there a way to set focus to a field when you press a button? Even if I `set-focus my-field` at the end of the button action, focus stays on the button.

gurzgri

[08:00](#msg61dbe7929b470f38975ba5b3)

```
view [fld: field btn: button "enter" [set-focus fld]]
```

chunes3

[08:14](#msg61dbeaf1d143b14f830c786c)Doesn't work for me

hiiamboris

[08:39](#msg61dbf0bcf5a3947800f9754f)OS and Red version?

chunes3

[13:10](#msg61dc30439b470f38975c3ef9)Windows 7 Red 0.6.4

hiiamboris

[14:16](#msg61dc3fc89b470f38975c6313)try nightly

[14:16](#msg61dc3fdbf5a3947800fa212f)or "automatic" whatever it's called

greggirwin

[19:11](#msg61dc84c5bfe2f54b2e0fb82e)@chunes3 works here for me with a recent build, on Win10.

## Wednesday 12nd January, 2022

ldci

[07:57](#msg61de89f06d9ba23328b9bdef)Hi, is there a way to create a vertical progress object with Red?

ne1uno

[08:01](#msg61de8ad45ee4df335ade8b96)`view [progress 5x30]`

ldci

[08:02](#msg61de8b185ee4df335ade8bfc)@ne1uno Thanks :)

planetsizecpu

[12:08](#msg61dec4a546529077f57f2ae7)Ladies and gentlemen, the last but not the least is L30, it resembles a lot to L1 but is L1 + L2 on bottom, so double amusement!. Now I'll wait for official sound support to make a bit of noise 😏

[12:08](#msg61dec4da6d9ba23328ba31c8)\[!\[cavetest301.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/wTCJ/thumb/cavetest301.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/wTCJ/cavetest301.gif)

[12:10](#msg61dec550f5a3947800ffcfaf)I found a flawn where the crossing kart passes over the elevator while loaded, so the boy was killed, now we check this and avoid that behavior.

cloutiy

[15:04](#msg61deedf9742c3d4b21939267)@planetsizecpu you should package all this into a book or course on game development with Red.

GalenIvanov

[16:50](#msg61df06c59a335454061c4706):+1:

ldci

[18:17](#msg61df1b25d41a5853f948e7ff)@planetsizecpu Congratulations. For sound you can use Sox: http://sox.sourceforge.net. It’s really easy to use with Red call function and available for macOS, Linux and Windows:)

planetsizecpu

[18:43](#msg61df2169d41a5853f948f475)Thx guys. @cloutiy great idea, I'll try to write a doc explaining how it has been coming to the actual state. @ldci will check sox, but about Red sound it is not the first time I use a language under development and the xperience tell me it is better wait for things well arranged before investing so much effort 😃

ldci

[19:13](#msg61df285bd143b14f8313aefc)@planetsizecpu Have a look here: https://github.com/ldci/Red-System/blob/main/Map/morse.red

[19:15](#msg61df28d7d41a5853f949053e)and I'w waiting for your book :)

greggirwin

[19:23](#msg61df2a9e742c3d4b21941f78)Congratulations @planetsizecpu ! It's been really fun watching it progress from the outside.

planetsizecpu

[20:48](#msg61df3eaf5ee4df335ae011b0)I'll look at it tomorrow François thx. @greggirwin thx and not only the game progress but my learning process too, if I have to highlight a Red specific feature that allowed the game to run I'll point to path access to objects and Red / Vid easyness.

[20:50](#msg61df3f1a6d9ba23328bb43c5)I could not imagine the nightmare to do the same game with a pure O.O. lang 😬

## Thursday 13th January, 2022

chunes3

[07:08](#msg61dfcfef82a4667b25732338)`view[do[loop 5[text "hello"]]]` This doesn't work but does anyone know how I can make something like this work?

[07:11](#msg61dfd08ef5a3947800020a1c)I need to be able to create a lot of faces programmatically and then refer to them later with path syntax.

[07:11](#msg61dfd09a9b470f38976447d2)And I have no idea where to even start with that

[07:13](#msg61dfd1269b470f3897644908)oh hey I figured it out!

[07:14](#msg61dfd13f5dc6213cd4dc9769)

```
a: append/dup copy [] [text "hello"] 5
view a
```

[07:14](#msg61dfd15b9a335454061ded7d)sorta.. still can't refer to them by name though

ne1uno

[08:02](#msg61dfdca7e1a1264f0a53e23b)something like `view layout repend collect [(repeat x 5 [keep reduce [to-set-word rejoin ['t x] 'text rejoin ["hello " x] ]])] ['return 'button [append t5/text "+"]]`

[08:02](#msg61dfdca7526fb77b3178d2b7)@chunes3, careful crowding statements to save a few spaces. it can be hard to debug if you make valid words by mistake

planetsizecpu

[08:09](#msg61dfde1c2a210c38c1c75690)Interesting how you workaround the lack of sound @ldci so you call sox `play ...` on each beep.

The main idea I have at this moment is to create a Vid object that will have `rate n`, but not visible on screen, so game funcs will manipulate some freq or note field on this object, depending  
on how sound works, to play some effect sound or note. But there will be a global sound effects switch as in all the computer games, if it is ON then `n` rate parameter will be set to some fixed value so the sound func will run with the object parameters, but if switch is OFF then `n` rate parameter will be none so will not play sound effects although the funcs will manipulate the object. So the sound will play asynchronous and not delaying the gameplay.

For background music is the same idea with a different Vid object, the question is that I don't like to set a sound file, I better prefer to code some notes because the melody \[Turkey In The Straw](https://www.youtube.com/watch?v=Vr8QnkTwT\_w)  
is simple, say `melody1: "AEBCDFCDGEACDEBC" melody2: "BCDEAFCGAEBCFED"` so on each `rate` tick will consume a note.

I don't know at this moment how will come sound, is just my idea by now, one key question is if sound will be available on console, to test notes, so we can compose any melody much more easy, if not then will have to make some sound mockup script to test sound alone.

[15:02](#msg61e03f029a335454061ed0bc)There are different strategies to finish each level, in this L30 after loading some gold bags, we can throw away the gold down to the elevator hole, and and form a gold heap at the bottom, later we throw the wheelbarrow and the gold loads by contact, that's all 😄

[15:02](#msg61e03f1c9a335454061ed0da)\[!\[cavetest302.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/Thvi/thumb/cavetest302.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/Thvi/cavetest302.gif)

greggirwin

[19:43](#msg61e080ea5dc6213cd4de1924)@chunes3 how I often start is by writing the VID code manually first, just a small bit, so I can see what I want the data to look like that I'm going to generate. Then build the pieces to generate one item. e.g. the set-word (name), style, and facets. With that, you're pretty much done and just have to assemble the parts and drive it from other data.

[19:44](#msg61e0813a6d9ba23328bdf092)Also, generate your data and compare it to the manual version you wrote. Preview that before feeding it to VID and you'll learn a lot.

[19:51](#msg61e082ae7842bd3ca944f3c2)I encourage you to try it on your own, but here's a spoiler: https://gist.github.com/greggirwin/9c32a31a366631ce159d2ac1d5fb89f8

## Thursday 20th January, 2022

chunes3

[16:07](#msg61e988ae82a4667b2586c649)`view [text "hi" base 10x10]` how do I get rid of the enormous gap between these two faces without using absolute positioning?

[16:11](#msg61e989972a210c38c1daa8bf)`text` doesn't seem to respect `space`

[16:12](#msg61e989d09a335454063178fa)`view [text "hi" space 0x0 base 10x10]` is the same

ne1uno

[16:14](#msg61e98a7f9b470f389777c9d8)`view/tight [text "hi" 15x20 pad -5x0 base 10x10]`

chunes3

[16:17](#msg61e98b25742c3d4b21a8f861)Ah, thank you! I did not remember that refinement, but I see it now in the docs

greggirwin

[16:18](#msg61e98b4046529077f594e125)Note that the gap isn't large, the `text` style has a default size. `view [text "hi" red base 10x10]`

[16:18](#msg61e98b6482a4667b2586cc1f)Another way to see it: `view [text right "hi" base 10x10]`

chunes3

[16:19](#msg61e98b7c7842bd3ca956f417)Oh, I see. Is there a way to shrink the size of the text style?

greggirwin

[16:19](#msg61e98b809a33545406317cb8)Of course, you can also set the size of the `text` face.

ne1uno

[16:19](#msg61e98b9946529077f594e2a5)there may be a setting for all the face that set a minimum distance between elements?

greggirwin

[16:19](#msg61e98ba0e1a1264f0a67479a)You can define your own style, yes.

[16:20](#msg61e98bbe9a33545406317d34)https://github.com/red/docs/blob/master/en/vid.adoc#styling

chunes3

[16:20](#msg61e98bd87842bd3ca956f46f)I wonder if it would be hard to automatically determine a 'snug' size for the face based on the font and the string

[16:21](#msg61e98bf0d41a5853f95dfca1)Or is that essentially what view/tight does

[16:21](#msg61e98c0a526fb77b318c1d4c)okay, no, it's not

greggirwin

[16:23](#msg61e98c6a5ee4df335af4b3c4)You can use `size-text` for that, but keep in mind that UIs benefit from consistency in their layouts. All depends on your needs of course.

ne1uno

[16:24](#msg61e98cb16d9ba23328cfff52)probably would need kerning even with an average text size

[16:25](#msg61e98cf146529077f594e543)style is the way to go, figure your average size. can always override it

chunes3

[16:26](#msg61e98d1e9b470f389777cf92)You both are right. Thanks for the help

hiiamboris

[16:27](#msg61e98d81526fb77b318c20ff)`view [text "hi" tight base 10x10]`

[16:28](#msg61e98d9382a4667b2586d127)`tight` is buggy though, it has to follow the text right now

[16:28](#msg61e98db2d143b14f8328983f)https://github.com/red/red/issues/4292

greggirwin

[16:32](#msg61e98e9982a4667b2586d407)Is that why it isn't doc'd? I was trying to remember if it worked or not. I've only ever used it for layouts.

hiiamboris

[16:34](#msg61e98f035ee4df335af4b9a3)Maybe they just forgot it :)

greggirwin

[16:35](#msg61e98f6e6d9ba23328d00430)I'll add a ticket.

## Monday 24th January, 2022

toomasv

[14:56](#msg61eebe00e1a1264f0a710a5e)@qtxie In the beginning of last year regression occurred in view. Compare these:  
\[!\[base-regression](https://toomasv.red/images/Errors/base-colors.gif)](https://toomasv.red/images/Errors/base-colors.gif)

hiiamboris

[15:01](#msg61eebf36742c3d4b21b2c559)create an issue plz

toomasv

[15:02](#msg61eebf8fe1a1264f0a710e30)ok

[15:20](#msg61eec3bad143b14f83325600)https://github.com/red/red/issues/5051

hiiamboris

[15:21](#msg61eec3f65dc6213cd4f9f1c5)thanks

## Friday 28th January, 2022

planetsizecpu

[08:50](#msg61f3ae63742c3d4b21bca4a3)This week I had some free time for a new level of the game. As I already said that there would be no more levels, I have decided that from now on the levels will be extra, meaning they will come erratic, that's why I called it LX31 😏

[08:51](#msg61f3ae8146529077f5a8857a)\[!\[cavetest310.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/cnEB/thumb/cavetest310.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/cnEB/cavetest310.gif)

[08:52](#msg61f3aedcd143b14f833c42a2)As in my latitude we are some cold I recalled the old ice levels, so I dust off old L4.

toomasv

[10:45](#msg61f3c938742c3d4b21bcdf21):+1:

[10:58](#msg61f3cc3be1a1264f0a7b2cd2)Clipping seems to always to intersect since switch to D2D

```
view [box 101x101 draw [fill-pen brick clip 0x0 70x70 clip 50x50 100x100 xor box 0x0 100x100]]
```

Earlier:  
\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/lyUE/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/lyUE/image.png)

[10:58](#msg61f3cc70e1a1264f0a7b2d27)Now:  
\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/EbXn/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/EbXn/image.png)

pekr

[12:00](#msg61f3daeb526fb77b31a02068)@GalenIvanov Would like to ask something towards the animation dialect. I can see the following pattern, where `expires`looks kind of repetitive / busy:

```
start 1 duration 2 ease :ease-in-out-quad
    stroke-path test (path) width 15 color (papaya - 10.10.10) expires after 4
```

Could the expiration instruction be moved to the first line? Or is that this way, because you can have multiple strokes as shown on the second like, each with its own expiration timeout? Does the first line mean, that what follws (is indented) is a group of multiple instructions?

GalenIvanov

[12:10](#msg61f3dd469a33545406458253)@pekr Thank you for your question! I'll upload the documentation in the weekend (or at latest on Monday).  
`expires` works only with "compound" effects - `particles`, `text-fx`, `curve-fx`, `stroke-path` and that's why I decided to declare it at the effect level and not at `start`. `start` works like `pen` and similar - changes the state until the next `start`. There might be many effects after `start` and each can be delayed by some time, if there was `delay` keyword. That's why I decided to set expiration time for each compound effect.

pekr

[12:32](#msg61f3e2652a210c38c1eeabad)Were you thinking about grouping stuff? I would not hesitate using blocks .... for things like slides, multiple strokes, etc. Because even in Powerpoint, which I am using for animations for our LED screen, you set delays, expiration, repetition for the slide itself, as well as for its selected elements, separately.

GalenIvanov

[13:02](#msg61f3e9525dc6213cd40462e5)I was thinking about blocks following `start` declaration, so that all animations in that block to start relative to it, but have't tried it. I added named animations, so that they can be used as references.

greggirwin

[17:02](#msg61f421b66d9ba23328e45c92)Nice to see that you can't let go @planetsizecpu. :^)

@qtxie @toomasv is this a change we just need to doc, or is it a bug and should work like the old behavior?

planetsizecpu

[17:41](#msg61f42ad22a210c38c1ef4570)Yes it's difficul to leave when the core hard job is done @greggirwin, and every new level is more and more easy to grow, but as you know making games is not my role, I'd rather prefer making DB artifacts for management, so just enjoying while learning Red 😀

toomasv

[18:09](#msg61f43155f5a39478002a4c87)@greggirwin IMO its bug for anyone looking for guidance from \[docs](https://github.com/red/docs/blob/master/en/draw.adoc#clip).

hiiamboris

[18:10](#msg61f4318646529077f5a997d5)@planetsizecpu some say look at what you're doing in your leisure time: this should be your job ;)

planetsizecpu

[18:59](#msg61f43cf67842bd3ca96bcb97)Agreed 😀

greggirwin

[19:31](#msg61f444af2a210c38c1ef7c69)@hiiamboris however, it can also be that turning your passion into your job can change how you feel about it. It's great when it does work out though.

hiiamboris

[20:16](#msg61f44f3b7842bd3ca96bf3a3)&gt; passion into your job can change how you feel about it

I'd say, there's an unnoticed self delusion in this case, different for everyone. For example, if one loves to dance one can dance for oneself, and get recognized like \[Marquest Scott](https://www.youtube.com/watch?v=NBqb3mkmQ7Q). Maybe you won't get as popular but you'll have enough, and a lot of fun. Or one can join some govt-sponsored club of good for nothing shadows that live and breathe boredom and only get invited by organizations to provide background for some official events. In the latter case one actually abandoned his dream by refusing responsibility for it and only pretends to follow it.

## Saturday 29th January, 2022

gltewalt

[04:44](#msg61f4c61d6d9ba23328e59c5e)I wish i could color a field green up to a parse match and leave the rest of the field white. Or do different colors of the "copy and paste" highlight.

hiiamboris

[09:24](#msg61f507b982a4667b259ce186)Use rich text DSL.

GiuseppeChillemi

[12:24](#msg61f531f3d143b14f833f1e59)@hiiamboris  
&gt; @planetsizecpu some say look at what you're doing in your leisure time: this should be your job ;)

So I should code in Red/Rebol as job?

hiiamboris

[12:25](#msg61f5324c46529077f5ab651f)Only you can answer that ;)

greggirwin

[18:54](#msg61f58d66e1a1264f0a7e706b)@GiuseppeChillemi yes, you should. ;^)

## Monday 31st January, 2022

pekr

[15:22](#msg61f7feaa5ee4df335a0ff458)@GalenIvanov Would like to ask about the duration of animations. Is there any possibility to accelerate / slow-down? I can see, there is `on-time` event, so one could probably use that section to program that. Just curious though. In vide editing software, we've got key-frames, so that you can divide the path to multiple points and set various parameters to such a node and between nodes use diferent metrics of acceleration, slow down, etc. Maybe @Oldes could share some ideas from his Flash experience :-)

GalenIvanov

[18:29](#msg61f82a79bfe2f54b2e46325d)@pekr No, there is no such possibility.

hiiamboris

[18:43](#msg61f82de79b470f389793cd62)it should be as easy as exposing a time scaling parameter

GalenIvanov

[18:46](#msg61f82e7a9a335454064d76b0)@hiiamboris Thanks for the suggestion!

hiiamboris

[18:46](#msg61f82e9e46529077f5b0c021):+1:

pekr

[18:49](#msg61f82f272a210c38c1f67843)I am still quite versed on longish one liners, respectively, if there should (or not) be some grouping, like panel in VID, simply by using brackets. That way, you can create (named) groups, set parameters to the whole group vs the contained elements, consider them being a slides, frames, etc.

GalenIvanov

[18:53](#msg61f8302bd143b14f83447af5)I know. You are most probably not the only one to want blocks for animations. I'm writing the docs right now and I'll explain there why I decided not ti use blocks. In short - I think of `start 2 duration 3 delay 0.5`as a fame of reference and not a container, since there might be subanimations "sticking out" after these 3 seconds.

[18:56](#msg61f830e4e1a1264f0a833001)I might change my opinion if there is enough evidence to support the use of blocks :)

pekr

[19:06](#msg61f83328d143b14f83447f7f)This might be thing of some kind of compatibility, with VID for e.g. VID uses options, which you can use at the top level, but you can use `with`to access the object directly. Jeff Kreiss did the presentation as a VID extension, so you could use buttons and other elements:

```
field "Brutally maiming the competition" with [font: []] 0:0:16 [
			:0:1 fade red 20 body 
			:0:1 fade yellow 20 text
			:0:1 go 110x200 5
			:0:9 move 3x-3 30 
			:0:9 fade 30 full
		]
```

GalenIvanov

[19:07](#msg61f8336ed143b14f83447fe5):+1:

pekr

[19:07](#msg61f833867842bd3ca972f79c)I will not push further, I think you already know my opinion. When I can see lots of unordered stuff, it might get confusing in the long run. And even `shape` uses subblock ....

GalenIvanov

[19:08](#msg61f833c446529077f5b0cbf6)OK, thanks - I understand your position.

## Tuesday 1st February, 2022

Oldes

[00:26](#msg61f87e3b9b470f38979474a7)@hiiamboris I love to \[dance like this](https://youtu.be/OVmCGiNsX00)

GalenIvanov

[08:42](#msg61f8f27a46529077f5b23116)I found that `image` doesn't show anything on screen, whereas `image` and `image` work as expected.

[08:42](#msg61f8f28ebfe2f54b2e47b044)

```
Red [needs: view]
img: make image! [200x200 255.255.255.0]
draw img [fill-pen teal circle 100x100 80]

view [
    canvas: base 200x200 beige
	draw [
	    image img 10x10 190x190
	    ;image img 10x10 190x10 10x190 190x190
	]
]
```

[08:44](#msg61f8f2f26d9ba23328ed2bd9)The code above works, but if I use the commented line, nothing is shown.  
Red 0.6.4 for Windows built 27-Jan-2022/14:21:11+02:00 commit #008f815, I tried it also on older versions with the same result.

hiiamboris

[09:07](#msg61f8f8355ee4df335a11d79d)@Oldes tried that, but it makes me nauseous like I ate something bad :(

[09:08](#msg61f8f8719b470f38979551d8)@GalenIvanov IIRC it's not implemented and even documented somewhere that it's not implemented :)

GalenIvanov

[09:08](#msg61f8f898e1a1264f0a84a3af)OK, thanks!

## Wednesday 9th February, 2022

cloutiy

[22:49](#msg62044514b8b082448227904a)I'm working with a text area and want to have it so that if I type an opening bracket or paren, that the corresponding closing get added. I'm trying to test on last char of text but this doesn't give the expected result.

```
view [ t: area font [ size: 16] [
   print last t/text  
   if (last t/text  == "(" [ 
      print "found (" 
      t/text: append t/text ")"
    ]
   ]
]
```

hiiamboris

[22:54](#msg620446080779373db8d851f4)try `t/selected: 1x1 * length? t/text` after appending

[22:54](#msg62044620d410244480545ee9)that's the best you can achieve with current implementation of native `area`

greggirwin

[22:54](#msg6204463341e3293d65e4d5e9)There are a few issues with your code. Compare this and see if you can find the important ones.

```
view [
	t: area font [size: 16] [
		print mold last t/text  
		if #"(" = last t/text [
			print "found (" 
			append t/text ")"
		]
	]
]
```

cloutiy

[23:02](#msg620447efb8b0824482279641)@greggirwin Yes you're right i had a couple mistakes in there. For one I was missing a paren...was working at the command line and tried a couple different approaches.

[23:04](#msg62044879d410244480546392)@hiiamboris What about if I'm interested in the current cursor position. for example if hit the back key a few times and insert a new char there...do I need to do these checks using index math, or is there a "current-cursor-position" property?

[23:09](#msg6204498f41e3293d65e4dd19)I sometimes wish there was a way to get help from within dialects. like `? view/area` or something like that.

[23:21](#msg62044c5f03f270478229004a)For an `area` I see there is an `on-key` event. How do I check which key has been pressed in the `on-key [ ... ]` ?

greggirwin

[23:26](#msg62044db2d410244480546ee9)Check the event.

https://github.com/red/docs/blob/master/en/view.adoc#events

## Sunday 20th February, 2022

gltewalt

[19:41](#msg6212997d8db2b95f0a308220)How to hook to a window to `show` this?

[19:42](#msg6212998d99d94f5f0c15f5dd)

```
i: make image! [400x300 255.255.255.255]

my-base: make face! [type: 'base size: 400x300 image: i rate: 100]
```

hiiamboris

[19:47](#msg62129aba99d94f5f0c15f842)make face type=window and add offsets and sizes to both

[19:48](#msg62129af699d94f5f0c15f8ab)also add base to `pane`

gltewalt

[20:11](#msg6212a0720909252318ec2ba7)

```
>> my-thing: make face! [type: 'window size: 400x300 pane: 'base]
== make object! [
    type: 'window
    offset: none
    size: 400x300
    text...
>> show my-thing
*** Script Error: foreach does not allow word! for its series argument
*** Where: foreach
*** Near : no
*** Stack: show
```

hiiamboris

[20:27](#msg6212a41699d94f5f0c160acd)that's not how `pane` should look like

## Monday 21st February, 2022

ne1uno

[00:02](#msg6212d6989bd1c71eca6a0388)red-community/games/game.red uses `pane: reduce [ base ]`

## Friday 25th February, 2022

planetsizecpu

[11:40](#msg6218c046e9cb3c52aeeab2d4)Just yesterday released LX33 for those who want to play, if any 😐

[11:41](#msg6218c06c99d94f5f0c22a487)\[!\[cavetest331.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/pqOI/thumb/cavetest331.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/pqOI/cavetest331.gif)

[11:44](#msg6218c10a3ae95a1ec1703e9c)As it is too difficult to win, I had to set two wheelbarrows, so I was able to win after playing 40+ games 😄

greggirwin

[18:02](#msg6219199fe9cb3c52aeeb7233)Wow!

## Thursday 10th March, 2022

GiuseppeChillemi

[18:20](#msg622a416f0466b352a4117e33)Is it possible to move the cursor of a text area into a specific line/position?

hiiamboris

[18:24](#msg622a4262ddcba117a216b537)only with R/S

GiuseppeChillemi

[19:41](#msg622a54593ae95a1ec1924b5a)I am not at that level.

mikeyaunish

[23:16](#msg622a86b1c61ef0178e694c7d)@GiuseppeChillemi I will need this functionality soon. @hiiamboris is the text-box widget still in the cards for this kind of text manipultion? I am not at the R/S level yet either but this will be a good excuse to dive in I guess.

[23:34](#msg622a8af199d94f5f0c4580d8)I can convert every VID object using `to-image` except for rich-text. Should I be submitting a bug?

greggirwin

[23:51](#msg622a8f19e9cb3c52ae0d78ba)@mikeyaunish make it a wish ticket, not a bug.

## Friday 11st March, 2022

hiiamboris

[09:24](#msg622b153b6b912423202b6948)It's a known bug.

GiuseppeChillemi

[09:29](#msg622b1688e9cb3c52ae0e6646)@mikeyaunish I need to search text and go to its position without selecting it and also to reopen a text at the position it has been closed.

hiiamboris

[09:58](#msg622b1d450466b352a41328dc)With recent fixes spaces can be run again, so it's an alternative to RS. Text needs some work there though.

mikeyaunish

[14:11](#msg622b5890c61ef0178e6ad250)@GiuseppeChillemi That is exactly what I need too. After the next release of Direct Code - I will go after making a proper text editor unless someone else is already doing so.

hiiamboris

[14:43](#msg622b5ffa8db2b95f0a615fb4)text editor is a huge task

mikeyaunish

[15:02](#msg622b646c09092523181cfb3d)@hiiamboris Would it be better (easier/faster) to attach to an existing open source text editor widget? I guess we may not need everything that a text editor does. The piece that is missing right now is querying the cursor position and moving the cursor/view to where we want the cursor to be. The rest of the functionality already exists.

hiiamboris

[15:08](#msg622b65f2c61ef0178e6aeb7e)that should be easy then, but it's not really an editor, just a text area widget with caret contol

mikeyaunish

[15:08](#msg622b65fa8db2b95f0a616bd2)@greggirwin I haven't made a wish ticket yet. Where do I go?

hiiamboris

[15:08](#msg622b65ff6b912423202c06ed)Toomas probably made a few already

mikeyaunish

[15:10](#msg622b66600466b352a413b24f)Great. @toomasv Have you made text-area with caret control?

hiiamboris

[15:10](#msg622b66759bd1c71eca9a23e6)&gt; @greggirwin I haven't made a wish ticket yet. Where do I go?

https://github.com/red/red/issues/4269

toomasv

[15:37](#msg622b6ccdc61ef0178e6af8d9)Yes, with help from @hiiamboris, I did one for DiaGrammar. But there are still glitches I couldn't control.

hiiamboris

[15:47](#msg622b6f13257a35782524e476)did you not make some rich-text based ones?

[15:50](#msg622b6fb609092523181d11e1)I may prioritize `area` style in Spaces, but not sure if GC is stable enough already for it to be useful.

[15:51](#msg622b6fed09092523181d1241)(not that GC is the culprit, it just trips on other heisenbugs)

toomasv

[16:03](#msg622b72eb8db2b95f0a618812)Yes, I experimented with rich-text too. I'll try if any of this still works...

[16:25](#msg622b77f09a09ab24f39cb4a7)At least something of \[this](https://github.com/toomasv/learning/blob/master/snippets/rich-text/rtbox.red) works. I just added quickly a menu to open files. (Needs a click if it doesn't seem to work at once :).)

hiiamboris

[16:31](#msg622b795f3ae95a1ec19473e8):+1:

[16:31](#msg622b7962e9cb3c52ae0f2a3a)works fine

pekr

[16:35](#msg622b7a590466b352a413dcf0)@hiiamboris what do you mean by an alternative to RS? You mean Red/System? Or rich style?

hiiamboris

[16:38](#msg622b7b1f09092523181d29c5)alternative solution to studying Red/System and writing kludges to existing native `area` implementations on all OSes

mikeyaunish

[16:57](#msg622b7f816b912423202c3a2f)Thanks @toomasv I think that will work.

toomasv

[17:08](#msg622b8202257a3578252510c8)Glad if it works!

[18:26](#msg622b944ec61ef0178e6b4cf7)@qtxie I have a question about `track` event on scroller! object. It seems horizontal and vertical tracking events cannot be distinguished as they are designated by same word (lines \[268](https://github.com/red/red/blob/master/modules/view/backends/windows/events.reds#L268) and \[277](https://github.com/red/red/blob/master/modules/view/backends/windows/events.reds#L277)). I tried to use scroller object in a \[table-template](https://github.com/toomasv/table/blob/master/table-template.red) style I am working on, and generally it works well, except horizontal thumbtracking. Do you have any ideas/suggestions how to solve this?

hiiamboris

[18:35](#msg622b9673e9cb3c52ae0f71b6)don't you know from scroller dimensions if it's horizontal or vertical?

[18:40](#msg622b97a3f43b6d783ff8938c)https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/scrollpanel.md

toomasv

[18:40](#msg622b97b6d1b64840db6071a1)It is not standalone scroller to access it's size. `scroller!` object doesn't even have `size` facet.

[18:41](#msg622b97d2e9cb3c52ae0f73d8)Thanks, I'll look you solution..

hiiamboris

[18:41](#msg622b97de9bd1c71eca9a8c4d)Ah, I see.

toomasv

[18:48](#msg622b997c99d94f5f0c47929d)Anyone interested to try this, please use \[try-table.red](https://github.com/toomasv/table/blob/master/try-table.red) and \[style.red](https://github.com/toomasv/table/blob/master/style.red) and \[example data](https://github.com/toomasv/table/tree/master/data) or your own. But there are lot's of open ends currently.

GiuseppeChillemi

[19:43](#msg622ba666257a3578252562fb)@mikeyaunish do you intend to write a WYSIWYG or a code editor with font of same size and RTF?

mikeyaunish

[20:19](#msg622baed33ae95a1ec194e852)@GiuseppeChillemi - I really need plain code editing (with the requirements mentioned previously) using a fixed font size. I will probably turn Toomas' stuff into a rich-text requester, which I have a need for as well.

## Saturday 12nd March, 2022

qtxie

[03:00](#msg622c0cbfd1b64840db6146a1)@toomasv Did you use `get-scroller` to get the scroller! object? like this one: https://github.com/red/red/blob/master/environment/console/GUI/gui-console.red#L115

[03:01](#msg622c0cfae9cb3c52ae104114)You can get two scroller! objects.

toomasv

[04:18](#msg622c1f143ae95a1ec195aa30)@qtxie Yes, I did it so (\[here](https://github.com/toomasv/table/blob/master/table-template.red#L819)):

```
vscr: get-scroller face 'vertical
hscr: get-scroller face 'horizontal
```

Nevertheless, parent's `on-scroll` actor's `event/key` is `track` for both, and it can't be decided whether to send it to `hscr` or to `vscr`. See e.g. \[here](https://github.com/toomasv/table/blob/master/table-template.red#L555). May-be I am just confused?

qtxie

[12:05](#msg622c8c976b912423202e1a39)@toomasv Ok. I know the issue. We can put 'vertical or 'horizontal in `event/flags` to distinguish them. Or do you have any suggestions?

toomasv

[12:20](#msg622c8ff9c61ef0178e6d07b8)Yes, that seems to be one solution. Another would maybe be to use different word for horizontal tracking, e.g. `thumb`. Or may-be use `htrack` and `vtrack`? But this is perhaps too cryptic. And `end` key has same problem, so probably including horizontal/vertical in flags would be more general.

## Sunday 13th March, 2022

pekr

[09:02](#msg622db32ec61ef0178e6efb7e)@hiiamboris From Red Spaces docs: "host uses it's rate and draw facets internally, requires all-over flag to be set, but the other facets can be repurposed as you see fit.":

\- I wondered what Host means, after reading doc, it is ok. So just an idea - why not call it Spaces? It would resemble the subsystem we try to use? That'r really minor though ...  
\- Usage of the `all-over`. When View was introduced sometimes in 1999 or so, it used that by default and it was really slow for any meaningful work back then (Pentium 75 / 135 was my PC back then :-) ). Later on it became a special flag only for cases, when it was really needed. Why is that needed in Spaces all the time?

hiiamboris

[09:28](#msg622db94dc435002500ebb4b9)`host` is more to the point IMO, but I'll keep your suggestion in mind

[09:29](#msg622db9763ae95a1ec1985da0)&gt; all-over

How else do you propose tracking pointer?

[09:37](#msg622dbb5d9a09ab24f3a0ac95)Also `host` won't be necessary in the future as I will create VID styles for common host spaces.

pekr

[09:38](#msg622dbb7b99d94f5f0c4b55ae)How is that being tracked in view itself? Does it relate to spaces being mostly a Draw window, hence you have to turn on all-over, to get precise positions?

hiiamboris

[09:38](#msg622dbb980909252318211b97)View tracks all events in it's R/S code.

[09:41](#msg622dbc449bd1c71eca9e4b7c)Then dispatches it to faces depending on over flag configuration.

[09:41](#msg622dbc59257a35782528e7b4)But on a Draw surface you don't have faces, so it won't dispatch. I have to do that myself.

pekr

[09:41](#msg622dbc5f99d94f5f0c4b571b)Taugh call then ... you would have to resort to use regular faces with separate draw blocks ... btw - that's what Carl's GUI did ...

hiiamboris

[09:42](#msg622dbc820909252318211d65)That would be stupid of me and will significantly slow everything down :)

pekr

[09:43](#msg622dbcae161ffc40d7b23429)So Spaces are basically one Draw window, which draws its widgets, hence you need all-over to get the precise position events. I am just trying to think, how to get down to the R/S level.

hiiamboris

[09:44](#msg622dbcec3ae95a1ec1986512)If I go down to R/S level, almost nobody will use spaces because of compilation requirements.

pekr

[09:44](#msg622dbd12f43b6d783ffc3b76)I can't express myself enough ... what I mean is - what about a completly new View, with the access to the R/S code, where widgets are being drawn by subsystem similar to Draw, just having access to R/S code?

hiiamboris

[09:45](#msg622dbd4d9bd1c71eca9e4d42)Sorry, I'm still not getting it :)

[09:46](#msg622dbd5e9bd1c71eca9e4d49)Can you give an example?

greggirwin

[16:32](#msg622e1c83090925231821d680)@pekr how much "too slow" is `spaces`, and what is the best example of that?

pekr

[17:02](#msg622e23bf9a09ab24f3a16da9)I did not say Spaces is slow. I do remember using all-over handler is slow. But even with Demos hiiamboris admits, that those can be laggy (stated in docs).

hiiamboris

[17:04](#msg622e24119bd1c71eca9f0266)you're mixing it up

pekr

[17:04](#msg622e24129bd1c71eca9f026b)Maybe that's why there were GOBs with the R3. Those could be of a text, draw, effect type IIRc and faces were higher level construct, built upon GOBs.

[17:05](#msg622e2468f43b6d783ffcfa78)That's possible. What I did understand (maybe incorrectly) is, that Spaces are basically one Draw bitmap upon which everything is being drawn? So one base element at the low level OS mapping?

hiiamboris

[17:08](#msg622e24f6ddcba117a21db8d1)of course

[17:08](#msg622e25168db2b95f0a6642bb)but so were all R2 faces

greggirwin

[17:13](#msg622e2630161ffc40d7b2f077)My point is that we first need to evaluate `spaces` and see where improvements are needed.

pekr

[17:13](#msg622e264ac435002500ec7ee1)Guys, you don't need to care that much about my remarks. Clearly I can't even ask the correct question :-) What I had in mind was something like - what if there would be the version of the View engine, without OS widgets mappings and having accelerated Draw with clever clipping/caching engine at its guts, as a first class citizen. I can't even envision, if such a question makes any sense .....

hiiamboris

[17:15](#msg622e26ccc435002500ec7fea)Draw is not going to be a bottleneck for Spaces. For Animations - yes.

[18:13](#msg622e345d6b9124232030f4d1)I'm thinking of using ranges for description of spaces' size constraints. Because, obviously I do not want the mess of HTML with it's `min-width` `max-height` etc crap.

E.g. `label "Some text" 200 .. none weight 1` would allow the label to stretch once it's container is resized, but over the minimum of `200`.

I'm okay for using an object for now, but @greggirwin any news on range! datatype?

There's also use case for half-open pairs, e.g. smth like `100xNONE .. 200x200` (impose no lower limit on Y). But just mentioning it as food for thought right now. If pairs were floating point we could leverage NaN for that. `100xNAN`, `100x-INF`...

[18:36](#msg622e39ba6b9124232030fe09)In retrospect, `1x2` syntax for pairs is good but limiting. If we had `,` as alias we could use a form like `nan,100` while we can't write `nanx100` (it's a single word).

## Monday 14th March, 2022

greggirwin

[01:13](#msg622e96c70466b352a41942d8)The literal form for ranges is the trickiest part. We can mezz around with its behavior in the meantime. Also, @dockimbel has mentioned `(x, y, z)` as a literal `point!` form in the past.

qtxie

[03:14](#msg622eb3286b9124232031d10a)@toomasv I added a new refinement in `event` to get the orientation of the scrollbar.

[03:14](#msg622eb32ac61ef0178e70c353)

```
on-scroll: func [face [object!] event [event!]][
    probe event/orientation = 'vertical
]
```

toomasv

[04:12](#msg622ec0929a09ab24f3a2767d)@qtxie Great, thanks!

[04:27](#msg622ec42f090925231822f850)Needs to be included in `system/catalog/accessors/event!` too :)

qtxie

[06:59](#msg622ee7ee09092523182334e9)Thanks! Forgot this one.

GaryMiller

[10:17](#msg622f164cc61ef0178e717aef)So glad to see some action being taken on Scroll bars. Working scrolling on multiline text boxes with word wrap enabled has been a big limitation IMHO

hiiamboris

[13:45](#msg622f4701c435002500ee804f)@greggirwin both the benefit and the trickiness of `nan,100` or `(x,y)` is in words. We want words, maybe even parenthesized expressions, so we can evaluate them. But then two questions arise:  
1\. It's not a terminal lexical form. `,` now unifies not only 2-3 numbers, but may contain words or expressions. It's like an object with 2-3 keys/values (and a decorated way to `make` it?)  
2\. If there are words/exprs in this limited object, when does the actual evaluation take place? When we get the numeric value out of it?

I wonder if there was any talk about this and how can it be solved?

[13:53](#msg622f48c199d94f5f0c4e1f2e)For ranges, we could start without literal form. Mold it as `make range! [a b]`. And make `..` a non sticky constructor operator. `a..b` - not a word anymore.

## Tuesday 15th March, 2022

greggirwin

[04:36](#msg623017d90466b352a41c1993)@hiiamboris agreed on the parenthetical form issue. I don't know how Nenad intends to address those issues, but we should note them.

I also agree we can start `range` work without a literal form. As appealing as `..` is from a familiarity standpoint, making it not a word is an exception I'm not sure I like. It seems like it would be too easy to trip over, but it's also not the only one.

## Friday 18th March, 2022

Boum69

[10:46](#msg6234631ec61ef0178e7bf22c)Hi everybody! I wanna add shadows to transparent images . Do you know how to do that with Red? I didn't find any documentation about that... Thank you.

toomasv

[11:04](#msg6234673199d94f5f0c58370e)@Boum69 It is experimental and not complete, but some things do work. I did some experiments a year ago:  
:point\_up: \[March 7, 2021 7:29 PM](https://gitter.im/red/red/gui-branch?at=60450d8c95e23446e41b68af)  
:point\_up: \[March 7, 2021 8:13 PM](https://gitter.im/red/red/gui-branch?at=604517c6120cd84f78fdfeb3)  
:point\_up: \[March 7, 2021 9:02 PM](https://gitter.im/red/red/gui-branch?at=6045235295e23446e41ba55a)

hiiamboris

[11:14](#msg623469ade9cb3c52ae20320c)it partly works on windows, but crashes on other platforms

Boum69

[12:29](#msg62347b2c9a09ab24f3adab4e)Thank you ; ) @toomasv I'll try it this evening. And @hiiamboris thanks for the information I use Win10 👍

toomasv

[14:31](#msg623497d0c61ef0178e7c5e21)@Boum69 You are welcome!

## Sunday 20th March, 2022

mikeyaunish

[03:58](#msg6236a662f43b6d783f0d40ca)Happy to say Direct Code V3.0 is now available. Creating and editing Red GUI's should be a whole lot easier now. !\[demo-vid-editor](https://user-images.githubusercontent.com/29316525/159147211-f58e8282-58c8-4003-94d0-6c05f1197796.gif) \[Demo Video on YouTube](https://www.youtube.com/watch?v=hd1QUSH04iw)

toomasv

[06:42](#msg6236ccc9161ffc40d7c36e9c)@mikeyaunish Excellent! :+1:  
I am working on a similar but not so advanced project. Main difference is that objects (faces) are by default inserted, positioned and sized on a shadow window, but can be edited on textual forms also. But yours has several nice touches mine is missing. My main goal is moving from layout editor to app editor.

GalenIvanov

[08:19](#msg6236e37b9a09ab24f3b2133a)@mikeyaunish Really nice, great job!

mikeyaunish

[14:47](#msg62373e92d1b64840db7641bf)@toomasv I am intrigued. The editor was developed entirely in a shadow window. It would be an easy addition to make if needed, I'll keep my eye on that option. The textual forms editing intrests me, can you give an example? I would like to circle back and incorporate everything I learned from my DB-Rider experience.

[14:47](#msg62373e9d257a3578253af02e)Thanks @GalenIvanov

toomasv

[15:03](#msg6237423b9a09ab24f3b2bedb)By textual forms I mean as you have the forms for editing facets.

mikeyaunish

[15:30](#msg62374895d1b64840db7653a9)@toomasv and instead of editing the facets what would a textual form modify? It seems my brain is stuck in a paradigm that isn't understanding this.

ldci

[18:08](#msg62376daac435002500fe2133)@mikeyaunish Nice job, but some problems under. macOS :)

mikeyaunish

[21:49](#msg6237a184257a3578253ba646)@ldci Thanks. What kind of issues are you seeing?

## Monday 21st March, 2022

planetsizecpu

[07:48](#msg62382dd23ae95a1ec1ac0b4e)Good job @mikeyaunish push hard!

mikeyaunish

[15:44](#msg62389d418db2b95f0a7a451c)Thanks @planetsizecpu . I know it's just an expression but is there some area that needs to be pushed?

greggirwin

[17:58](#msg6238bcca0909252318362eea)Wow! That's great @mikeyaunish. So many thoughtful features.

mikeyaunish

[18:59](#msg6238cb1c99d94f5f0c60672b)@greggirwin Thanks. Have you noticed anything that is missing, that you think should be there?

greggirwin

[19:51](#msg6238d73c8db2b95f0a7abcaa)I will have to play to see, but am working on many fronts at the moment. For GUI editors, the first thing I thought of was selecting a face and showing sizing handles. That leads to being able to select multiple faces and how to be smart about sizing. e.g. sizing a face in the upper left \*might* automatically adjust other faces offsets that it overlaps. Maybe it does that by default, but holding ctrl while dragging overrides it.

Other things I really want in everything is standard undo/redo capability. In the case of UIs, it would also be great to copy the entire layout to do what-if comparisons without having to copy files on disk, load multiple projects, etc. This starts moving into the realm of responsive design, or what Atronix called Semantic Zoom, and automatic resizing. That's much bigger, so a simple manual option is where to start.

mikeyaunish

[20:31](#msg6238e0906b912423204570d1)Thanks @greggirwin , good ideas. I'll see what I can do.

## Tuesday 22nd March, 2022

endo64

[09:15](#msg623993b63ae95a1ec1aeee8e)@mikeyaunish great work!

## Friday 25th March, 2022

mikeyaunish

[16:22](#msg623dec60c4350025000adeee)Thanks @endo64 .

[16:35](#msg623def34f43b6d783f1b698b)Some fun playing around with "aware" objects with a new game called "Smart Drop".  
\[Smart Drop Demo](https://github.com/mikeyaunish/smart-drop/blob/main/smart-drop-demo1.gif)

greggirwin

[19:13](#msg623e1457c4350025000b2e42)Very cool!

GiuseppeChillemi

[23:45](#msg623e54299bd1c71ecabe26c7)I see that words are considered as symbols in VID and they are not reduced to their values, so:

```
button-size: 100x200
text: "Click Me"

view [button text button-size]
```

does not work, and I must use compose.

Do you confirm? (They are reduced in Rebol with VID extension Kit)

## Saturday 26th March, 2022

ldci

[06:26](#msg623eb215d1b64840db84b422)@GiuseppeChillemi in red and in rebol you must use layout object which reduces words

[06:26](#msg623eb22d257a357825498fb0)

```
button-size: 100x200
 button-text: "Click me"
 main: layout [button button-text button-size]
 view main
```

[06:28](#msg623eb27ec4350025000c3aa9)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/S0tx/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/S0tx/image.png)

[06:28](#msg623eb29c99d94f5f0c6bdd17)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/EY9n/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/EY9n/image.png)

greggirwin

[06:31](#msg623eb35df43b6d783f1ccd52)@GiuseppeChillemi it's a simple problem you'll see in the morning. :^) `Text` is a style, so you're confusing VID. e.g. this works `sz: 100x200 view [button sz text red sz]`

GiuseppeChillemi

[08:35](#msg623ed04e3ae95a1ec1b905fe)@greggirwin :))) morning has come. However, I have also supposed that as a text is needed, the word after `button` would not be interpreted as VID element.

[08:38](#msg623ed0e8257a35782549c26d)@ldci I remember having read that Layout was still not implemented in Red

[09:00](#msg623ed6420466b352a438453b)But I am sure I am confusing `layout` with Stylesheet and custom Styles.

[13:26](#msg623f149de9cb3c52ae349f45)Question: `view` has implicit `layout`, hasn't it? While `layout` returns the object.

hiiamboris

[13:45](#msg623f1914f43b6d783f1d8bf5)yes

## Wednesday 30th March, 2022

GiuseppeChillemi

[08:13](#msg6244113409092523184bb0cf)@toomasv I need to make some connected diagrams with single to one/single to multi/multi to single lines/arrows. Is your diagram dialect still working with the latest Red verions?

toomasv

[09:11](#msg62441eb23ae95a1ec1c2d504)@GiuseppeChillemi Seems that at least something of it is still working, but I suspect not all of it. Closest example to what you need is probably \[this](https://github.com/toomasv/diagram/blob/master/examples/ex4-tables.rex). But don't expect much.

bubnenkoff

[17:08](#msg62448e7ee9cb3c52ae3ef763)what is the strange file extension \*.rex ?  
And how to run examples?

```
*** Script Error: dia has no value
*** Where: either
*** Near : dia [size 220x120 style table: diagram border ]
```

toomasv

[19:02](#msg6244a9628db2b95f0a915d01)You'll need all of \[this](https://github.com/toomasv/diagram).

## Thursday 31st March, 2022

bubnenkoff

[18:10](#msg6245ee84c61ef0178e9d634a)Could you explain how to get it work step by step

hiiamboris

[18:10](#msg6245eea5ddcba117a24b1bb3)have you read the readme?

bubnenkoff

[18:12](#msg6245ef0f09092523184f6cd4)Oh! I understood! I thought that I should copy-past all of this to console

[18:12](#msg6245ef1b09092523184f6ce9)I have never used Run command before

[18:14](#msg6245ef90ddcba117a24b1d0e)Yes few examples works! Other crush Red

hiiamboris

[18:19](#msg6245f0caf43b6d783f2a8c32):)

## Friday 8th April, 2022

GiuseppeChillemi

[23:00](#msg6250be943ae95a1ec1db27e8)Is there any risk that if I bind a view block, some internal words value are altered? I mean...

[23:02](#msg6250bf17d1b64840dba72740)`view bind [field "" size] make object! [size: 500x50]`

[23:03](#msg6250bf5b9bd1c71ecae1003a)So, if `size` is used internally by VID, there is some interference.

[23:05](#msg6250bfa1161ffc40d7f4fec1)I ask this because I have just encountered thi problem on Rebol with VID Extension Kit, so I ask just in case...

## Saturday 9th April, 2022

toomasv

[04:14](#msg6251080e09092523186496c6)Of course! Why would it be otherwise? Before `layout` kicks in it's just a block with words (and other values), bound or not bound.

GiuseppeChillemi

[07:37](#msg625137c0090925231864e535)Because the VID parse could take `SIZE`value, store it where this parameter is needed, and do this without interfering with other `SIZE` parameters in internal objects.

[07:40](#msg62513867161ffc40d7f5cfaf)I repeat: `SIZE` other than being reduced to its value, which is the thing I expect, is also interfering with other internal objects. So I ask if there is the risk of interference in Red VID too.

## Thursday 28th April, 2022

GiuseppeChillemi

[05:49](#msg626a2b0361f5ca3feed724c8)@toomasv  
Hi toomas, I have just seen your `table` style on red/help and started trying it.  
I have a note and a question:

Using this code:

```
x: copy []
a: loop 100000  [append/only x reduce copy/deep [random 1000 random 200 random "Red is a wonderfull language" "Hello world" "hi there"]]
insert/only head x [col1 col2 col3 col4 col5]
view [table 700x500 data x options [auto-index: #[true]]]
```

When I scroll the table by a single click on an empty part of the slider, the first element after the click is INDEX +2 than the last one before the click. I mean:

\*Before the click on an empty part of the scroller*

[05:50](#msg626a2b0cbb0de60c7213805d)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/PTLa/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/PTLa/image.png)

[05:50](#msg626a2b41eaf3267f8535d5a4)\*After the click*  
\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/v9nW/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/v9nW/image.png)

[05:51](#msg626a2b5389dcc96e9cd7dfc9)It should be 20

[05:54](#msg626a2c03cd35b566afbd06ba)Question: Is there a way to set the first row as fixed and not editable, because it contains column names? So it is kept there while scrolling and it is not seen as part of the data, either visually and in accessing data via code using an index?

[05:55](#msg626a2c4ed4ef6e15af1e3d5b)(I mean that something like: `pick-table-row table-data 1` would return the second row\`)

toomasv

[06:11](#msg626a2ff8d30b6b44ebc20a7d)&gt; When I scroll the table by a single click on an empty part of the slider, the first element after the click is INDEX +2 than the last one before the click.

[06:12](#msg626a30549db19366b20255f5)Yes, this needs improving. Currently any row/column, that is even partly visible is counted as "seen" and on page-scrolling will be skipped. Will work on this.

[06:14](#msg626a30bccd938f6ea21f3040)&gt; Is there a way to set the first row as fixed and not editable

Yes, select "Row-&gt;Freeze" from local menu, with mouse on row you want to freeze.

[06:15](#msg626a30f5d30b6b44ebc20cc7)I'll update readme soon for other features too.

[06:19](#msg626a3206cd938f6ea21f3370)&gt; So it is kept there while scrolling and it is not seen as part of the data, either visually and in accessing data via code using an index?

It is kept fixed, yes. In sorting/filtering it is not considered - only data below it in current order are considered. About "accessing data via code using an index" I need to think of still.

planetsizecpu

[06:20](#msg626a324cfa846847c93cdb78)Good job btw @toomasv

toomasv

[06:21](#msg626a3258d30b6b44ebc20f6f)Thanks, Jose!

GiuseppeChillemi

[06:36](#msg626a35ebcd938f6ea21f3a44) How do I add/remove columns from code?

[06:37](#msg626a362dbb0de60c72139666)Is there a way to have less output Colin's than the input ones? I mean just a selection

[06:45](#msg626a381f949ae940067f3b55)\*columns

toomasv

[06:58](#msg626a3af89db19366b2026944)You can hide columns from local menu (Mouse on column, select Column-&gt;Hide). But currently no unhiding. Soon.  
From local menu you should be able to insert and append columns too. Currently no deleting. Soon.

GiuseppeChillemi

[06:59](#msg626a3b3e949ae940067f40dd)However, I am very excited a table style is finally here.

[06:59](#msg626a3b59eaf3267f8535f1fa)Still more questions:

[07:00](#msg626a3b7010cfc315bc5377ac)Is there any row filtering?

toomasv

[07:00](#msg626a3b7646495f47cfb5fa36)Yes

GiuseppeChillemi

[07:00](#msg626a3b93949ae940067f4177)Would it be possible to conditionally highlight cells or rows?

toomasv

[07:01](#msg626a3bb9d30b6b44ebc21e82)No, not yet.

[07:01](#msg626a3bde61f5ca3feed741ca)Just updated readme (and table-template.red)

GiuseppeChillemi

[07:01](#msg626a3bdfcd938f6ea21f460d)Which are the actor?

[07:01](#msg626a3be646495f47cfb5fb11)Actors

toomasv

[07:02](#msg626a3bf4fa846847c93ceea2)What do you mean?

GiuseppeChillemi

[07:02](#msg626a3c1f41f4560c6f7540b3)On-select on-edit....

toomasv

[07:03](#msg626a3c57949ae940067f434a)https://github.com/toomasv/table-template/blob/main/table-template.red#L1733

GiuseppeChillemi

[07:09](#msg626a3db461f5ca3feed74523)However, it's fast. I have tried with 100K rows and the only difference is startup speed.

pekr

[07:09](#msg626a3db8d4ef6e15af1e5d93)Perfect :-) @toomasv - does it work kind of virtually? I mean - you've got block of data and map it for the display, without the need to suffle with original data block?

toomasv

[07:15](#msg626a3f2d949ae940067f487a)Yes, it's mainly index picking only screenful of data, without messing with original. Column-inserting/appending/deleting/editing though will affect all data.

pekr

[07:17](#msg626a3f8ba687887f8d7d0a0d)Perfect :-)

[07:18](#msg626a3fdd89dcc96e9cd80598)Might I ask, how it is done? Is that ..... lots of separate faces .... or still faces based, but panned = only visible area is drawn .... or is that draw based and hence one element? My question leads to - can we have different elements in fields? E.g. image, button, etc.?

[07:20](#msg626a4022949ae940067f4a65)Ah, so it shuffles data. Remember Cyphre's attempt at grid, where he prevented that, hence the order was mapped virtually, because I can't imagine you move such big chunks of data around?

toomasv

[07:27](#msg626a41c689dcc96e9cd808e3)It is relatively little size single draw, using clipping for cells boundering - so no arbitrary faces. For that you should use @hiiamboris `spaces`. But it can show arbitrary images and draw in cells, i.e. anything that `draw` can show. This needs more work though.

[07:28](#msg626a4233eaf3267f8535fdc3)And, as I said, only picking data by index into pre-existing draw-cells, not suffling original data, unless original data needs to be changed through all table.

GiuseppeChillemi

[07:30](#msg626a42a5cd938f6ea21f522b)Toomas, one of the most important things is the ability to open and close the table at the same row position.

[07:33](#msg626a4330d4ef6e15af1e6958)Also, how many selection modes are there? Other than single, are multi using ctrl key and multi without the needing of a ctrl key?

toomasv

[07:48](#msg626a46d246495f47cfb6100d)&gt; to open and close the table at the same row position

Yes, it will come when I implement saving preferences, i.e. selections/freeze-settings/sorting/filtering/current-position for current table.

[07:50](#msg626a4747cd35b566afbd3c8b)&gt; how many selection modes are there?

You can select with mouse and with navigation-keys. Shift-down will extend selection. Ctrl-mouse will start new selection-range without removing previous ranges.  
Selection with hot-keys will come, e.g. ^A. Some keys for selecting row and column too.

pekr

[08:00](#msg626a49afd30b6b44ebc23be7)One useful mode for selection in database apps, is just having hilited the whole row, not only a single cell, so that you can more easily identify, where you stand. But .... the basics are definitely good and improvements can come later :-)

[08:01](#msg626a49ddeaf3267f85360d83)So far my last question - is the new style going to be default part of the Red VID? I would like to have at least one standard available across the platforms ....

toomasv

[08:08](#msg626a4b9010cfc315bc539667)I'am kind of trying to think of two kinds of applications - db table and sheet, which need a bit different functionality. But yes, maybe hiliting both row and column whould be good. Or ability to choose hiliting.

About last question - not my call. And my guess is no. Also, I can't test on other platforms. It is developed on W10, but as I have not used system code, it is possible in principle that it compiles on other platforms too. Not too optimistic about that, though.

GiuseppeChillemi

[08:21](#msg626a4e75949ae940067f66eb)&gt; Yes, it will come when I implement saving preferences, i.e. selections/freeze-settings/sorting/filtering/current-position for current table.

I just need to have the first/last or the central row positioned at given index at opening (one of them, I actually prefer the central one); and also have the corresponding position returned or accessible when closing the table. It is need for reaopening and bookmarking.

GalenIvanov

[08:22](#msg626a4ec1eaf3267f853616fd)Good work, @toomasv !

GiuseppeChillemi

[08:24](#msg626a4f35bb0de60c7213c6c8)Also, I wish to return to single cell highlighting providing a check function. It is really important to let the user pay attention to certain values (Especially when you need to control and verify data), if it is possible, please implement it!

[08:27](#msg626a4fe5eaf3267f853618e0)@henrikmk Toomas has made us a surprise  
\[gift](https://github.com/toomasv/table-template) :point\_up: \[28 aprile 2022 07:49](https://gitter.im/red/red/gui-branch?at=626a2b0361f5ca3feed724c8)

toomasv

[08:39](#msg626a52c39db19366b20298a3)Thanks, Galen!

[08:48](#msg626a54e4a687887f8d7d351a)@GiuseppeChillemi Ok, I'll think about these issues. Thanks for suggesting.

[09:20](#msg626a5c48d4ef6e15af1e9ed7)@GiuseppeChillemi Can you please explain with some example, what do you mean by "accessing data via code using an index" :point\_up: \[April 28, 2022 9:19 AM](https://gitter.im/red/red/gui-branch?at=626a3206cd938f6ea21f3370) There are principally three ways to specify address of data: COLxROW in original table, COLxROW in current index (may be sorted and filtered), and COLxROW in current visible view. If I understand you correctly you mean COLxROW as in current index, counted starting from next after last frozen row (and col?). Or something else?

GiuseppeChillemi

[10:05](#msg626a66eb9db19366b202c012)Accessing data = reading or writing data in any of the VIEWS you have mentioned, where you express which data you want to access using the "views" you have mentioned.

```
face/data  (Index is from head)
face/filtered (Index is from head of filtered data)
face/visible (index is from the head of visible data)
face/source (Index  in the original data)
```

So you can write:

```
`select-cell face/data idx 'column ` ;or just `select-cell face idx 'column `
`select-row face/data idx`
```

or

```
`select-cell face/filtered idx 'column `
`select-row face/filtered idx`
```

or any of the other accessors

Note: I usually think as ROWxCOL , because it is more natural as it corresponds to path way of organizing data, as in `DATA/:IDX/COLUMN` (if block of objects) or  
`DATA/:IDX/(index? find column-list column-name)` (if block of blocks with columns on the first line)

toomasv

[10:50](#msg626a716614df4e44f2fd7e10)Ok, thanks, will digest it.

GiuseppeChillemi

[12:27](#msg626a884dd30b6b44ebc2b89d)This:

```
face/data  (Index is from head)
face/filtered (Index is from head of filtered data)
face/visible (index is from the head of visible data)
face/source (Index  in the original data)
```

Could also be this, where the refinement represents a different view.

```
face/data  (Index is from head)
face/data/filtered (Index is from head of filtered data)
face/data/visible (index is from the head of visible data)
face/data/source (Index  in the original data)
```

If it could be useful to not pollute the face context with words.

greggirwin

[19:37](#msg626aed1110cfc315bc54db97)Thanks all for testing, and for the feedback! And to @toomasv for pressing forward on this daunting task. We know there will be differences with @hiiamboris' `spaces`, and we still have a `table!` module on our list, which is a background "type" that should work with the GUI styles.

The editing aspects and other extension hooks will be key, long term. @toomasv is laying a foundation to build on, with the two key domains of data and spreadsheets. The next level beyond that will either be through extensions/hooks, or require Boris' `spaces`. These will both be game-changing for what people can do with Red.

toomasv

[19:42](#msg626aee0c14df4e44f2fe77a8)Thanks, @greggirwin! :+1:

pekr

[20:16](#msg626af608bb0de60c72151952)@greggirwin So is Spaces officially the next big thing?

greggirwin

[20:17](#msg626af656cd938f6ea220b491)It will be our first-gen non-native GUI system.

pekr

[20:19](#msg626af6cb89dcc96e9cd97fa1)Perfect. thanks!

GiuseppeChillemi

[21:50](#msg626b0c15bb0de60c72154713)@greggirwin &gt;The next level beyond that will either be through extensions/hooks, or require Boris' spaces. These will both be game-changing for what people can do with Red.

Could you explain why it will be fake changer and which will be the improvements?

greggirwin

[23:10](#msg626b1eda10cfc315bc553a40)It won't be a fake changer, but a real one. ;^) What I mean is that tables are a critical UI element we've lacked, and makes many things possible that are...not great today. e.g. hacking through use of text lists and such. Spaces will allow much more.

## Friday 29th April, 2022

GiuseppeChillemi

[06:15](#msg626b828b61f5ca3feed9a29a)Mobile phone corrector has always a different opinion and the last word on my phrases.

toomasv

[17:51](#msg626c259846495f47cfb9b06c)@GiuseppeChillemi Initial \[attempt](https://github.com/toomasv/table-template) to save table state and restore it on opening - only if you save table with `.red` suffix. Maybe should change this to `.tbl` or something? Example in `try-table.red`.

Boum69

[20:53](#msg626c503ed30b6b44ebc62ca0)Amazing job !! @toomasv I tried it after work and your style-table is so fast, clean and easy to use . 👍👏👏👏

## Saturday 30th April, 2022

toomasv

[02:58](#msg626ca5cd46495f47cfba9017)Thanks, @Boum69 !

ldci

[08:34](#msg626cf47dd30b6b44ebc743c6)@toomasv Great job: style-table works on macOS :)

toomasv

[08:35](#msg626cf4b7cd35b566afc2554a)Very good to know! Thanks, @ldci !

GiuseppeChillemi

[10:17](#msg626d0cc5a687887f8d8250d1)@toomasv I will try it later today. About the naming, I need to think about it for a moment.

toomasv

[19:40](#msg626d90af61f5ca3feedd6f4d)@GiuseppeChillemi :point\_up: \[April 28, 2022 8:49 AM](https://gitter.im/red/red/gui-branch?at=626a2b0361f5ca3feed724c8) Corrected page-scrolling.

## Sunday 1st May, 2022

mikeyaunish

[00:45](#msg626dd838d4ef6e15af250a54)The file naming has been something I've been thinking about lately. Has there been any discussion about data file naming conventions.?I like obvious - so I'd go with: &lt;table-name&gt;-table-state.data.

toomasv

[04:59](#msg626e1398d30b6b44ebc92b9c)Can't recall any discussion of that now. Interesting proposition. I'd prefer names that have type encoded in suffix alone, not in half of the proper name, though. E.g. &lt;table-name&gt;.table

GiuseppeChillemi

[07:51](#msg626e3bfdbb0de60c721b030d)@toomasv  
I have just compiled \[RED-ODBC](https://github.com/gurzgri/red/tree/odbc) and tried it in a real-world scenario, doing a `"select *"` from a table with 148 columns, on a Window Server 2012.  
The table is open and visible, but I receive the following error on scroll cliccking on scroll bars. No error on wheel.

```
*** Near : event/orientation = 'vertical steps: count-steps 
*** Stack: do-file view do-events do-actor do-safe 
*** Script Error: cannot access orientation in path event/orientation
```

[07:56](#msg626e3d3bbb0de60c721b05d6)The horizontal bar does not move and does not give whatsoever error

[07:59](#msg626e3df0d30b6b44ebc97422)Pardon, it does give an error on horizontal scroll bars too but the console was not scrolling.

toomasv

[08:24](#msg626e43becd35b566afc49d69)How old is your build?

[08:30](#msg626e452f9db19366b209b42a)@qtxie added this on Mar 14.

GiuseppeChillemi

[09:19](#msg626e50a0949ae9400686a915)@gurzgri can answer this, Red-Odbc is his creature.

gurzgri

[10:43](#msg626e645014df4e44f2049d18)This branch is 90 commits ahead, 80 commits behind red/red:master.

GiuseppeChillemi

[11:02](#msg626e68d99db19366b209ef2e)I have connected to my remote server, opened Red, and run a "select * from ar". Then all the articles of my company appeared in the data-grid. You can't imagine how happy I am!

[11:03](#msg626e68eacd938f6ea226ec3a)https://i.imgur.com/OXnzbBO.gif

[11:12](#msg626e6b0cbb0de60c721b53de)\[!\[OXnzbBO.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/AGft/thumb/OXnzbBO.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/AGft/OXnzbBO.gif)

ldci

[12:34](#msg626e7e70bb0de60c721b73f0)@GiuseppeChillemi Really nice :)

toomasv

[12:39](#msg626e7f6910cfc315bc5b3948)@GiuseppeChillemi Excellent! Me happy too :)!

[12:40](#msg626e7fd0fa846847c94492e9)Can you change cell sizes, freeze, sort by column, filter?

GiuseppeChillemi

[13:27](#msg626e8ac314df4e44f204e225)Yes, I confirm but I expect that freezing a cell, only a single one is frozen, insted you freeze everything until that cell. Maybe a different name would help.  
Also, sorting when those row/cols are frozen, led to a strange behaviour. I expect that the left greyed area in the following video would not be sorted but instead it is.

[13:28](#msg626e8ae914df4e44f204e29c)\[!\[AnyDesk\_b4nLT69riN.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/U3RF/thumb/AnyDesk\_b4nLT69riN.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/U3RF/AnyDesk\_b4nLT69riN.gif)

toomasv

[13:31](#msg626e8b9641f4560c6f7d1c0d)In case of cell-freezing, given cell is taken as specifying both rows and columns up to which to freeze. In gif rows that are not frozen are sorted, seems ok to me.

GiuseppeChillemi

[13:32](#msg626e8bf7a687887f8d84ddd0)Yes, but also frozen cells are sorted (columns 1,2,3). If they are frozen you expect they would not be sorted.

[13:36](#msg626e8cc6eaf3267f853db972)Also, I think that sorting is not working properly. In the following video, the second row should not be on that position

[13:36](#msg626e8cf910cfc315bc5b5013)\[!\[AnyDesk\_dlnu5owibt.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/c8yU/thumb/AnyDesk\_dlnu5owibt.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/c8yU/AnyDesk\_dlnu5owibt.gif)

toomasv

[13:36](#msg626e8cfbd30b6b44ebc9ff09)&gt; If they are frozen you expect they would not be sorted.

Nope, frozen columns are frozen in horizontal dimension only, frozen rows in vertical dimension.

GiuseppeChillemi

[13:37](#msg626e8d05cd938f6ea2272b84)OK

[13:37](#msg626e8d3414df4e44f204e659)HINT: The string "descrizione" is a `WORD!`

toomasv

[13:38](#msg626e8d489db19366b20a2f4e)Will check what's wrong with sorting, thanks!

GiuseppeChillemi

[13:38](#msg626e8d6bd30b6b44ebc9ffd7)It has been returned by RED-ODBC query as column name.

[13:39](#msg626e8d7fcd35b566afc51dd5)(You are welcome!)

[13:43](#msg626e8e93cd938f6ea2272e34)There is a problem in filtering: if a cell is a `word!` then as simple `< 20` would reduce that word and you get a `content-of-the-cell has no value`

[13:49](#msg626e8ffc89dcc96e9cdfe996)Also a few questions:  
which is the difference between REMOVE and DELETE?  
Could you add the column name you have hidden to `unhide` as sub-menu? Or to a list which is popped up?

[14:00](#msg626e9260cd938f6ea22733d7)As I can see, the project has been created to work also as a spreadsheet. It would be nice to have the first that could be treated as COLUMNS HEADINGS CONTAINER, so you have them with 3D style, different color, font, size, events and it would be automatically kept away from sorting and other operations.

[14:41](#msg626e9c1946495f47cfbded4f)I have looked at the code and I have found `save-table-as` and similar functions but no corresponding menu entry. I imagine it is intended.  
Also about saving and loading, other than to file, it is important to save to a `word` the current table state and load the table from it. This is useful to store the data into a database ROW and restore it from another session opened elsewhere.  
The implementation to save it as file is a great idea. So you can load the table OFFLINE, share it and write back from another session. Please consider having an `EXTRA` section so we/you can add useful data to it like `original-source`

toomasv

[14:48](#msg626e9dbfbb0de60c721baab7)&gt; which is the difference between REMOVE and DELETE?

REMOVE removes given column from column-index, so it is not shown. All removed columns are restored with RESTORE.  
DELETE deletes column from original data, Deleted columns can be restored only by reopening the file (unless you have saved it with column deleted).  
HIDE sets column width to 0. It is still in view and can be copied, just not seen. UNHIDE sets width of all hidden columns to default size.

GiuseppeChillemi

[15:27](#msg626ea6d461f5ca3feedf4447)Unhide IMHO should default to last column size.

toomasv

[16:17](#msg626eb27deaf3267f853dfdfe)&gt; I have found save-table-as and similar functions but no corresponding menu entry

Yes, these can be used as seen in `try-table.red`. I'll include these into local menu too.

[16:19](#msg626eb2f6949ae9400687576d)&gt; the project has been created to work also as a spreadsheet

Sheet functionality is underdeveloped currently, but yes, I want to be able to use table style also as sheet.

GiuseppeChillemi

[17:59](#msg626eca7289dcc96e9ce051c4)I see a code window. Is the grid visible from there? Is any bound Word to it?

toomasv

[18:53](#msg626ed720bb0de60c721c1781)What code window?

greggirwin

[19:07](#msg626eda5f61f5ca3feedfa905)Great testing and feedback @GiuseppeChillemi. And thanks again to @gurzgri for his ODBC work. :+1:

[19:14](#msg626edc1ad4ef6e15af26c4a7)Really cool to see @toomasv's table in action. :clap:

GiuseppeChillemi

[20:03](#msg626ee781d4ef6e15af26d862)@gurzgri what could I do to add RED ODBC scheme to the latest Red version?

ldci

[20:21](#msg626eebbfeaf3267f853e640b)@toomasv. Still waiting for a 64-bit Red version, thus playing with Python and PySimpleGui framework:)

[20:21](#msg626eebc361f5ca3feedfc639)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/V212/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/V212/image.png)

[20:24](#msg626eec67cd35b566afc5c750)and also cimgui for julia

[20:24](#msg626eec6bd30b6b44ebcaacaa)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/9UNL/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/9UNL/image.png)

GiuseppeChillemi

[20:58](#msg626ef46541f4560c6f7dd963)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/GrRE/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/GrRE/image.png)

[20:58](#msg626ef465a687887f8d8594f4)@toomasv This one:

[20:59](#msg626ef4cfd30b6b44ebcaba0b)@greggirwin We need those technologies as humans need oxygen. Doing my best to help them come to light is the thing to do.

[21:01](#msg626ef50fcd35b566afc5d638)@ldci Yes, that is what I meant for "column headings"

[21:01](#msg626ef5349db19366b20ae8ee)You click on them and change sorting

[21:01](#msg626ef544d4ef6e15af26ef67)You right-click on them and open a column related menu

[21:05](#msg626ef5fe61f5ca3feedfd704)Also, columns with buttons or images as whole-cell or as virtual column beside a regular one are needed to have row related functionality.

[21:07](#msg626ef69746495f47cfbe8a77)I am talking about this:

[21:07](#msg626ef69d10cfc315bc5c0a06)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/wS4F/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/wS4F/image.png)

[21:07](#msg626ef6ae949ae9400687d2b7)They could be even between columns

[21:09](#msg626ef6fefa846847c9456a3d)Another important component is a filter ROW at the top/botton of the list:

[21:10](#msg626ef750d30b6b44ebcabf8c)This is how I have it on my ERP

[21:10](#msg626ef754d30b6b44ebcabf91)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/viAS/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/viAS/image.png)

[21:11](#msg626ef79914df4e44f205a45a)I enter the text of what I want to filter or text + wildcards and the list is filtered

## Monday 2nd May, 2022

toomasv

[03:45](#msg626f53d710cfc315bc5c9e8d)@ldci Very nice! Long way to go ..

[04:18](#msg626f5ba6cd35b566afc67fdf)@GiuseppeChillemi This code window is used for filtering and for column editing. See readme.

[04:20](#msg626f5c0c41f4560c6f7e8655)&gt; columns with buttons ...

No such things here. You have to use spaces for that.

greggirwin

[04:30](#msg626f5e5114df4e44f2064d33)I don't want to distract either @toomasv or @hiiamboris, but I've always felt that R2's `list` style was soooo close to being \*great\*. The iterated pane model just had a few limitations that made it good for some things, but not easy or universal. @giesse isn't around much, and @rebolek is very busy, but one of the old timers might have ideas onw how `list` could be done well in Red, that somebody could bring to life at some point.

[04:32](#msg626f5ec9fa846847c94612e6)For those not familiar with it, the basic idea was that a `list` was just an iterated virtual panel that displayed a `layout` spec for each "row". You had total control.

[04:34](#msg626f5f4c46495f47cfbf3324)For example, the rebol.org library desktop app used it like this:

[04:34](#msg626f5f5f14df4e44f2064f52)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/KU5g/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/KU5g/image.png)

GiuseppeChillemi

[05:12](#msg626f6847eaf3267f853f3787)@toomasv ok, as it appears hitting EDIT, I have supposed the word "code" inside the panel meant "enter code for editing"

[05:16](#msg626f6923d30b6b44ebcb7b14)So, even if no button is possible, could it have one of: check Flag/Image?

[05:28](#msg626f6c0dcd35b566afc69b9b)@greggirwin If I remember correctly, Bid Exension Kit List Style works this way......

[05:29](#msg626f6c1c41f4560c6f7e9ffc).... from its docs:

[05:29](#msg626f6c2846495f47cfbf49a2)"... LIST - This is the basic list style, which essentially is a list of iterated faces with predefined access possibilities for changing rendering, column/row layout, row manipulation, keyboard navigation and scrolling accessor...."

[05:29](#msg626f6c46cd938f6ea228a7c9)\*Vid Extension Kit

[05:33](#msg626f6d2546495f47cfbf4af6)The following functions in VEK List should need SPACES:

[05:33](#msg626f6d27eaf3267f853f3f16)....

[05:33](#msg626f6d3010cfc315bc5cc707)header-face - This is a layout block. When used, it will replace the standard header generated by DATA-LIST. You can use any standard layout.

sub-face - This is a layout block for each row used in the layout. When using this, you can create an entirely custom layout, even with multiple lines per data row. Words in OUTPUT are distributed in the same order that the faces are described in the layout. Note that the layout cannot change height, so you cannot use variable height layouts in these types of lists.

render - This is a function body that uses FACE and CELL as argument. The FACE is the list face inside the data list. The CELL is the cell that is currently being rendered

[05:33](#msg626f6d3361f5ca3feee0981d)....

hiiamboris

[08:24](#msg626f953710cfc315bc5d0df6)&gt; the basic idea was that a list was just an iterated virtual panel that displayed a layout spec for each "row". You had total control.

@greggirwin exactly how it is done in spaces

ldci

[08:39](#msg626f98babb0de60c721d5ba6)@greggirwin. You’re right R2 list is fantastic. While searching my personal archives, I found an example that illustrates the use of R2 lists. As you can see, this object (on the left) is able to associate image and text. Then I had written views for text, code, images and HTML pages (right).

[08:39](#msg626f98c8eaf3267f853f8c92)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/3C2z/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/3C2z/image.png)

[08:39](#msg626f98d410cfc315bc5d1443)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/qzWw/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/qzWw/image.png)

[14:14](#msg626fe74546495f47cfc0363c)Someone remembers what supply does in R2?

GiuseppeChillemi

[14:37](#msg626fecbafa846847c9471bd4)There is no `supply` on R2

ldci

[15:02](#msg626ff26bd4ef6e15af28b836)@GiuseppeChillemi Not documented but existing. A sample from an old personal code.

```
;view associated to the left panel

dirview: layout [across origin 0x0 
	dir_list: list white to-pair compose [(x1) (ymax - 90)] 
		[across origin 5x5  pad 5
		ico: box 32x32 [read_Dir to-file fln/text dir_fld/text: what-dir  
						find_extension to-file afile fix_slider] 
		fln: text 150x32  font [colors/1: colors/2: red ][read_Dir to-file fln/text dir_fld/text: what-dir
						find_extension to-file afile fix_slider] 
		]
		supply [
				; thanks to DideC for optimazation of supply
				count: count + my-offset
				if face/show?: count <= length? data_bloc [
				row: pick data_bloc face/user-data: count
				ico/image: select ico-cache first row 
				fln/text: second row]
		face/show?
	]	
]
```

DideC

[15:34](#msg626ff9eaeaf3267f85404dfc)IIRC `supply` is the code (body function like) called for each face of the list to format the face and to give it its value.

ldci

[15:38](#msg626ffadb89dcc96e9ce27167)@DideC Thanks a lot :)

greggirwin

[16:30](#msg62700728d30b6b44ebcca33d)Sounds like our problem is solved, once `spaces` is ready. :^) Though `spaces` has a lot more, and if the rest of your UI is native, there \*may* be cases where someone wants a single, drop-in style for that. Again, though, unless someone wants to do it on their own, it's not on the team's roadmap.

hiiamboris

[16:36](#msg6270087314df4e44f207948e)Native GUI is quite bad fit for that due to it's scalability issues and bugs. Of course you can make a small list of 5-10 layouts.

greggirwin

[16:42](#msg627009e614df4e44f207980c)Many UIs are simple, but there's still the issue that desktop OSs aren't designed to have their controls/faces repeatedly created and destroyed at speed. You can do it of course, and there's no \*technical* reason it shouldn't work, but a pure `spaces` approach would be much better. I don't know how mobile OSs or langs implement them, but it's a dominant model there, so anyone looking at it should research there.

[16:47](#msg62700b36d4ef6e15af28ee68)And the old grid styles that allowed things beyond text weren't completely extensible in that regard. You had just a few options, like those @GiuseppeChillemi mentioned. Check boxes and images being key.

How it worked, historically, in something like Excel is that it's all drawn, like @toomasv and @hiiamboris are doing. So there is no real checkbox. Just a drawn box and code that knows clicking on that cell should change its state to draw with a pattern-filled box.

As Boris notes, you can also do this at small scales, even without a real scrolling panel or doing more than changing faces visibility. You just create them and change the data. No, you don't get that nice feedback of seeing things move incrementally (which they don't in all UIs anyway), and it's a pain to work with so needs helpers, but it can be done.

toomasv

[17:10](#msg627010a0a687887f8d87a153)Something like this:  
\[!\[logic-col](https://toomasv.red/images/Table/logic-col.gif)](https://toomasv.red/images/Table/logic-col.gif)

greggirwin

[17:15](#msg627011bd46495f47cfc08e7a)Yup! :+1:

ldci

[17:17](#msg62701219bb0de60c721e4d4e)@toomasv Wizard:)

toomasv

[17:18](#msg62701250eaf3267f85407bd9):smile\_cat:

[17:27](#msg6270147846495f47cfc094b6)Or a bit more pronounced:  
\[!\[logic-col2](https://toomasv.red/images/Table/logic-col2.gif)](https://toomasv.red/images/Table/logic-col2.gif)

pekr

[17:32](#msg627015b946495f47cfc096a0)Having the grid is essential for the DB apps. But we should also watch, where the world is moving. E.g. in corporate area, Microsoft did really great job with new Microsoft lists. You can display the same list in Table mode, calendar mode, card mode, etc. Just for those curious: https://www.microsoft.com/en/microsoft-365/microsoft-lists

GiuseppeChillemi

[18:36](#msg627024b1fa846847c9478aaf)@toomasv Nice work Toomas. Your table in going to have all the basic features. Let's start reaching the top of skyscraper and later we could aim to the sky with Spaces.

giesse

[18:42](#msg6270261514df4e44f207d16d)@greggirwin re: iterated pane - my instinct would be to make the draw dialect turing complete. A draw "program" would be a superset of iterated panes and could be used to do a ton of things (animation, resizing, ...)

greggirwin

[18:46](#msg627027229db19366b20d1b3d)@giesse interesting. I always thought Display PostScript was a great idea. It certainly produced impressive results on NeXT.

GiuseppeChillemi

[19:07](#msg62702bed61f5ca3feee20d8d)@toomasv I see the `image!` datatype, so I suppose you are going to support it.

[19:09](#msg62702c78d30b6b44ebccee4b)You have witten you won't support cells with buttons. But, which is the difficulty into having a text in a cell that with different background color that will change when you click the cell area?

pekr

[19:12](#msg62702d289db19366b20d264c)Maybe what guys meant was that it is not face based. IIRC what Cyphre did with his grid, was real faces, where you could put arbitrary View code in the cell, so have buttons, animations, etc.

[19:13](#msg62702d59cd938f6ea22a2959)It would be resource hungry, so he used panning "window" to data source and constructed only a visible area ...

greggirwin

[19:14](#msg62702d7c41f4560c6f801d45)@GiuseppeChillemi, @pekr is correct. The table doesn't contain faces, which is where `spaces` comes in as its faces are non-native and handled all the way down in the module.

GiuseppeChillemi

[19:16](#msg62702e0dcd35b566afc815ef)So, how is he drawing the check V?

greggirwin

[19:17](#msg62702e339db19366b20d28a0)What some other systems do is like old line editors. All the data is display only, but then you can activate a line/row for editing interaction. Sometimes this happens transparently, as in Excel (cell by cell). The problem with using native controls is that faking it then means emulating the look of a button for each OS, which ends up being a huge pain. But @toomasv has already shown that logic fields work, and a "button" could work the same, very simply as a demo, but once again you run into all the extra handling, tracking a pressed state look when mousing away, etc.

[19:17](#msg62702e51cd938f6ea22a2b0b)&gt; So, how is he drawing the check V?

Unicode characters.

toomasv

[19:33](#msg627031f389dcc96e9ce2e79c)&gt; I see the image! datatype, so I suppose you are going to support it.

Yes, as image is supported by draw, it will be possible to use it in table.

&gt; which is the difficulty into having a text in a cell that with different background color that will change when you click the cell area?

Something like this will be, yes. Also plain draw in cells.

Logic markers are unicode, yes, thanks @greggirwin!

GiuseppeChillemi

[19:59](#msg6270381641f4560c6f80319c)&gt;&gt; So, how is he drawing the check V?

&gt; Unicode characters.

@greggirwin Thanks, black magic is now white magic.

gurzgri

[20:53](#msg627044ca9db19366b20d53fb)@GiuseppeChillemi  
&gt; @gurzgri what could I do to add RED ODBC scheme to the latest Red version?

Nothing: I merged branch odbc into master @ https://github.com/gurzgri/red, making ODBC up to date with latest Red development.

GiuseppeChillemi

[20:54](#msg6270452189dcc96e9ce30b9e)Nice! I will try it very soon

## Tuesday 3th May, 2022

toomasv

[04:27](#msg6270af25cd35b566afc8f350)&gt; black magic is now white magic.

Taking magic out of it:  
\* Map mouse offset to cell address on `mouse-down`  
\* Check if column is set to type `logic!`  
\* Negate cell content  
\* Map logic values to unicode chars  
\* Render

GiuseppeChillemi

[07:35](#msg6270db50fa846847c948d217)@toomasv @gurzgri  
I have tested the table style using the updated RED-ODBC.  
I have queried for 10.000 ROWS on a Table with 108 columns. I am browsing the documents inside my ERP with a `select top 10000 *` query.  
Load time is good, and the table is very usable. On horizontal scroll it is very fluid, in vertical one just a little slower.  
Nice Work!

[07:38](#msg6270dbe5949ae940068b42f6)\[!\[AnyDesk\_jVBk3Fh6he.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/n2KF/thumb/AnyDesk\_jVBk3Fh6he.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/n2KF/AnyDesk\_jVBk3Fh6he.gif)

toomasv

[08:18](#msg6270e571d4ef6e15af2a7921):+1:

[11:19](#msg62710fb7cd35b566afc9a72d)@GiuseppeChillemi Can you please try saving different states with `Table->Save state as ...` on your query and then using these states with `Table->Use state ...`. Seems to work here, but may be some bugs pop up.

gurzgri

[12:03](#msg627119f710cfc315bc5fe9e8)Browsing thru a table with 10‘000 rows rarely isn‘t something a user wants to do. ODBC allows for paging, offering oppotunities to further improve responsiveness.

hiiamboris

[12:54](#msg627126239db19366b20eede9)@gurzgri but what is paging for? What's even the point of \*browsing* raw DB data?

GiuseppeChillemi

[13:13](#msg62712a6e949ae940068bdba8)@toomasv I have opened the save file using an editor and while all rows are in one line, a few span multiple lines, but I do not see the reason for this. There are unexpected CF/LF.  
I have saved everything in a GITS. At the end, correct line are more frequent.

https://gist.github.com/GiuseppeChillemi/049a1ae7397aef600ea30845606b46a0

I have now tried saving the result of the query without passing from the `table style` and the original query has this problem too @gurzgri

Until we understand why this CF/LF I can't give you a response.

[13:15](#msg62712b02bb0de60c72205061)@hiiamboris I have not undestood the question.

hiiamboris

[13:16](#msg62712b40949ae940068bdd9a)I'm asking if your database is 1M+ rows, what task do you expect to solve by browsing it (by paging or whatnot)?

[13:17](#msg62712b69949ae940068bdddf)What's the point of browsing unfiltered database?

[13:18](#msg62712b9010cfc315bc600cb0)As a human you cannot hope to cover it anyway.

GiuseppeChillemi

[13:19](#msg62712be2fa846847c949659c)When betatesting, you do the opposite of what you usually do, this because you have to try the code for the most terrible scenery. It is a stress test.

[13:20](#msg62712c0141f4560c6f81fc53)Also, there is a reason why a table opens "unfiltered":

[13:20](#msg62712c2761f5ca3feee3e738)I my day to day work, I use the filtering header in the table header to navigate inside documents.

[13:22](#msg62712c8546495f47cfc29491):point\_up: \[May 1, 2022 11:10 PM](https://gitter.im/red/red/gui-branch?at=626ef750d30b6b44ebcabf8c)

Here is the navigation header. You compose your query and the table is then filtered.

[13:23](#msg62712cd3cd35b566afc9de3f)I can even SAVE the filter in a filters list and reopen the table providing one for convenience.

toomasv

[13:26](#msg62712d69a687887f8d89a8bb)@GiuseppeChillemi I mean try state saving/using, without saving data into file. You have to renew the `table-template.red` to do this.

hiiamboris

[13:27](#msg62712da9fa846847c94969b4)@GiuseppeChillemi So you admit that unfiltered state is just an unimportant side effect of UI implementation.

[13:29](#msg62712e3146495f47cfc297f9)So we're back to the question, why people even implement paging.

GiuseppeChillemi

[14:46](#msg6271405bcd35b566afca07e7)@hiiamboris I have never said the opposite. For big mixed data, unfiltered data is a mess but paged access is important because during filtering you may query too much data and performance will suffer with very long list freezing.

hiiamboris

[15:08](#msg62714584cd35b566afca1249)Look at this chat for example. It simply shows like 30 messages total, and no paging required.

[15:09](#msg627145b446495f47cfc2c80e)I agree showing too much is a bad idea. I just don't see why page it (at least in the sense paging is done in DBs)

pekr

[15:52](#msg62714fc4fa846847c949b19c)And how would you call a need to scroll? It is just like paging 🙂

GiuseppeChillemi

[15:57](#msg627150cf89dcc96e9ce4fc53)DB thinks as query on table. On most ERPs, on the interface you have a "filter on/off" switch. The problem is on the "OFF" phase: without paging, you would load 100.000 rows.

[15:58](#msg62715113cd938f6ea22c3b44)@pekr In fact, when I scroll up to the limit of the page size, Gitter halts for a second to load other data and then continues.

hiiamboris

[16:00](#msg627151849db19366b20f481e)@pekr dunno :)

gurzgri

[16:15](#msg6271553361f5ca3feee43f94)@pekr Indeed, me too, I always thought of endless scrolling as being implemented thru means of paging - without reserving screen space for paging ui elements.

GiuseppeChillemi

[16:38](#msg62715aa1bb0de60c7220b47c)@toomasv State saving/loading seems to work. I have saved the state and take a screenshot.  
Here is the result;

[16:39](#msg62715aa541f4560c6f825571)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/LVgb/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/LVgb/image.png)

[16:40](#msg62715af0cd35b566afca411f)Please note that rows are 10.001 (10.000 + columns row)

[16:40](#msg62715afd10cfc315bc6071f8)Here is the info on the save state:

[16:41](#msg62715b3c949ae940068c3cae)

```
frozen-rows: [] 
frozen-cols: [] 
top: 0x0 
current: 0x9979 
sizes: #(
    x: #()
    y: #()
) 
box: 100x25 
row-index: [...(truncated)....]
auto-index: true 
col-type: #() 
selected: [6x10001] 
anchor: 6x10001 
active: 6x10001
```

[16:41](#msg62715b52d4ef6e15af2b60f0)Are those number correct?

[16:42](#msg62715b87fa846847c949c940)Is `current` at `0x9979`, first visible line index - 1 , correct?

toomasv

[16:43](#msg62715bc2d30b6b44ebcf1e89)Great, thanks!

Yes, current is first visible non-frozen - 1.

GiuseppeChillemi

[16:44](#msg62715bf7cd35b566afca42ed)Your are welcome, my hero!

toomasv

[16:47](#msg62715cb0949ae940068c3fd3):)

GiuseppeChillemi

[16:47](#msg62715cb49db19366b20f5e4e)I have just experienced a bug:

[16:48](#msg62715cd341f4560c6f825a15)I have frozen the first line. Then I have sorted the auto created index colum and I have got this

[16:48](#msg62715cd7bb0de60c7220b7cf)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/WZs9/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/WZs9/image.png)

[16:48](#msg62715cf2eaf3267f8542e6ad)On the place of 5002 there is:

[16:49](#msg62715d0ecd35b566afca44c7)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/kndP/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/kndP/image.png)

[16:51](#msg62715d77a687887f8d8a09ca)Pardon I meant "sorted down"

toomasv

[16:51](#msg62715d9510cfc315bc607893)Yep, something has gone wrong recently, I can reproduce.

GiuseppeChillemi

[16:52](#msg62715dbcbb0de60c7220b9c8)Worksite is still open ;-)

[16:54](#msg62715e3a949ae940068c4291)Also I have the following error on console:

```
*** Script Error: caption is unset in path caption/size/y
*** Where: +
*** Near : caption/size/y tb/actors/resize tb
*** Stack: do-file view show do-actor do-safe
```

[16:56](#msg62715ec0cd35b566afca488f)I have added the `%try-table` content to my `%test-table.red`

[16:56](#msg62715ed161f5ca3feee45304)

```
view/flags/options [tb: table 1000x600 data x options [auto-index: #[true]]]  'resize [
	text: form file 
	menu: ["File" ["Open ..." open "Save" save "Save as ..." save-as]]
	actors: object [
		on-resizing: func [face event][
			tb/size: face/size - as-pair 20 30 + caption/size/y 
			tb/actors/resize tb
		]
		on-resize: func [face event][
			face/actors/on-resizing face event
		]
		on-menu: function [face event][
			switch event/picked [
				open [if file: tb/actors/open-table tb [face/text: form file]]
				save [if file: tb/actors/save-table tb [face/text: form file]]
				save-as [if file: tb/actors/save-table-as tb [face/text: form file]]
			]
		]
	]
]
```

[16:58](#msg62715f2489dcc96e9ce5196f)Maybe I have made something wrong

[17:09](#msg627161e761f5ca3feee4595e)A last note: I have a column which contains integer conversion of binary bitset. It has about:

```
2000  x 2
2000  x 4
200   x 8
4000  x 16
100   x 32
200   x 8192
600   x 16184
800   x 1048576
```

Sorting DOWN takes a lot of time, despite other columns do it in few seconds

toomasv

[17:37](#msg6271683ecd938f6ea22c64e5)Remove reference to `caption` as you don't have it defined in your view.

GiuseppeChillemi

[17:38](#msg627168859db19366b20f7477)I don't even know what is a `caption` ;-)

toomasv

[17:38](#msg6271689fcd938f6ea22c6615)Find it in `try-table.red` :)

[17:40](#msg627168f29db19366b20f7548)&gt; Sorting DOWN takes a lot of time

Yeah, I have messed up sorting; dealing with it.

## Wednesday 4th May, 2022

ne1uno

[06:19](#msg62721ad4d4ef6e15af2cbbbc)\[cog tests source gist](https://gist.github.com/ne1uno/19f189d7b1526148554326e662ca1707#file-cognition-red) still some rough spots, see \[cognition screenshot](https://usercontent.irccloud-cdn.com/file/3FxMnTHm/cog-test-red-lang.gif)

toomasv

[12:43](#msg62727508fa846847c94bc590)@GiuseppeChillemi Can you try sorting now? It's just basic red-sorting.

GiuseppeChillemi

[16:50](#msg6272aef010cfc315bc62f831)@toomasv I have tried. Actually there is a problem: if you sort consecutively two times the same column in the same direction, and the you have multiple equal values, the rows with the same value in the sorted column change their order.

toomasv

[16:58](#msg6272b0d2d30b6b44ebd1ab8b)Hmm.. I guess, I can't do anything about it.

GiuseppeChillemi

[17:02](#msg6272b1a6eaf3267f85456dfe)I remember we have discussed about this topic for `sort/compare` in Red/Help and it is a matter of coherent sorting algorithm. @greggirwin has interested @qtxie and something has been done.

greggirwin

[17:03](#msg6272b1cecd938f6ea22edae3)Use `sort/stable`.

[17:08](#msg6272b30346495f47cfc58f4c)`/stable` uses mergesort rather than quicksort, but supports custom comparators as well. Compound sorting is a separate issue, e.g. using a block of ints or keys to sort by multiple values in a block or structure.

toomasv

[17:15](#msg6272b4b19db19366b211e078)Sorry, `/stable` crashes it.

GiuseppeChillemi

[17:16](#msg6272b4d7949ae940068ebee5)`Sort/(un)stable` ! :-))))))

toomasv

[17:18](#msg6272b55ffa846847c94c4cf1):)

hiiamboris

[17:19](#msg6272b5adbb0de60c7223423c)`sort/stable` needs a 3-state return

[17:19](#msg6272b5bea687887f8d8c9c0d)-1 0 1 IIRC

[17:21](#msg6272b61b46495f47cfc594de)https://github.com/red/red/issues/4489

[17:21](#msg6272b622fa846847c94c4e73)if it still crashes, worth reopening

toomasv

[18:02](#msg6272bfb614df4e44f20cb096)Thanks @hiiamboris! Unfortunately this workaround implies comparison of numbers only. I tried `>=` and it works for strings, but not for e.g. words, probably some other types too.

hiiamboris

[18:05](#msg6272c04fd30b6b44ebd1d134)https://github.com/red/red/issues/3396#issuecomment-656089412

[18:06](#msg6272c0b1cd35b566afcce7e3)I don't recommend that though :D

[18:06](#msg6272c0b646495f47cfc5abb8)what a mess

toomasv

[18:07](#msg6272c0fc46495f47cfc5ac3a)Gosh! :flushed:

GiuseppeChillemi

[18:22](#msg6272c47a949ae940068ee2d8)@greggirwin what you say about "can of worms" and me? 😁

greggirwin

[18:29](#msg6272c61689dcc96e9ce7bf83)I say @GiuseppeChillemi is the greatest accidental fisherman ever. :^)

[19:01](#msg6272cd86d30b6b44ebd1eb78)@9214 asks the key question in that NaN sorting ticket.

&gt; How other languages handle that, BTW?

If NaNs are technically floats, and we support them as a value, `sort` should \*never* crash because they exist. That's step 1. Step 2 is whether they produce nonsensical sorted results for NaNs themselves. That's bad, but not our fault (again, technically). But given that it affects how other values sort, it's bugged.

```
>> sort [3 2 1 0   1.#NaN  -1 -2 -3  1.#INF -1.#INF]
== [-1.#INF -3 -2 -1 1.#NaN 0 1 2 3 1.#INF]
>> sort [3 2 1 0 -1 -2 -3  1.#INF -1.#INF  1.#NaN]
== [1.#NaN 2 1 0 -1 -2 -3 1.#INF -1.#INF 3]
```

We \*should* do the most helpful thing for the user, and that means keeping them together. If we choose not to do this, we have to clearly doc the issue. I'm OK with noting that custom sorting needs to be NaN-aware, but we should provide templates for people to copy.

hiiamboris

[19:20](#msg6272d1effa846847c94c8896)https://dlang.org/library/std/algorithm/sorting/sort.html (last example)

[19:21](#msg6272d23cfa846847c94c88fb)negative nans are a bit of an overkill though

[19:24](#msg6272d307eaf3267f8545b57a)D has put a lot of thought into NaN handling. For example there are operators `!< !<= !> !>=` (negations of comparison - made especially for NaNs). Our COMP\_SORT comparison just needs to be NaN-aware like that.

## Thursday 5th May, 2022

greggirwin

[00:12](#msg6273166841f4560c6f8597cb)Thanks @hiiamboris. :+1: Red normalizes NaNs, but I recall using them inline caused issues at one point. @qtxie please give your thoughts on the NaN approach D uses. I don't think we want special ops for them, just transparent handling. When we have our own decimal type, it will matter even less.

[00:20](#msg6273183261f5ca3feee78e6f)On paging, from the recent chat here, I agree that better querying and filtering is the most effective place to invest time and effort. But I'm also a stupid human who sometimes forgets to use `everything` to find files, and that's OK. There are times where the act of looking for what I want leads to other discoveries. Personally, that's where paging falls down for me. Seeing tiny chunks of data doesn't \*really* let me browse. At the extremes browsing doesn't work well either, but there's a huge gray middle-ground between 100 and 1M items. I always thought fisheye menus were cool for browsing, but they also fail at scale because you can't control the mouse movement in fine enough increments. That could lead to a new, hierarchical or spatial browsing model of some kind I imagine.

[00:23](#msg627318e7d4ef6e15af2eb184)Say your scroller is actually a 2D box. At the far left you scroll like a regular scroller. But the more data you have the wider it gets, and as you also move the thumb to the right, it slows the vertical scrolling. Of course, it could be horrible in actual use. :^)

[00:24](#msg62731944cd938f6ea22fa4bd)It's also very much related to context and what you're trying to do. At the conference yesterday, more than one person talked about how they \*loved* using graphs to see overviews, then be able to click on data points to open the source data (e.g. logs).

qtxie

[08:35](#msg62738c3ca687887f8d8e2e9d)@greggirwin I also think we want it to be handled transparently. Especially make `sort` NaN-aware.

Oldes

[15:57](#msg6273f3e1eaf3267f8547e899)@greggirwin in my R3:

```
>> sort [3 2 1 0   -1.#NaN  -1 -2 -3  1.#INF -1.#INF]
== [-1.#INF -3 -2 -1 0 1 2 3 1.#INF 1.#NaN]
```

hiiamboris

[16:01](#msg6273f4e9bb0de60c7225aff3)

```
REBOL 3.5.5 (Oldes branch)

>> sort [1.#inf -1.0 1.#nan 1.0 -1.#inf 0 1.#NAN]
== [-1.#INF -1.0 0 1.0 1.#NaN 1.#NaN 1.#INF]
>> sort [1.#inf -1.0 1.#nan 1.0 -1.#inf 1.#NAN 0]
== [-1.#INF -1.0 0 1.0 1.#NaN 1.#NaN 1.#INF]
>> sort [1.#inf -1.0 1.#nan 1.0 1.#NAN -1.#inf 0]
== [-1.#INF -1.0 0 1.0 1.#NaN 1.#INF 1.#NaN]
>> sort [1.#inf -1.0 1.#nan 1.#NAN 1.0 -1.#inf 0]
== [-1.#INF 1.#NaN -1.0 0 1.0 1.#INF 1.#NaN]
>> sort [1.#inf 1.#NAN -1.0 1.#nan 1.0 -1.#inf 0]
== [-1.#INF -1.0 0 1.0 1.#INF 1.#NaN 1.#NaN]
>> sort [1.#NAN 1.#inf -1.0 1.#nan 1.0 -1.#inf 0]
== [-1.#INF 1.#NaN -1.0 0 1.0 1.#INF 1.#NaN]
```

[16:02](#msg6273f502fa846847c94ebee1)bugged as everything else

GiuseppeChillemi

[18:13](#msg627413c7eaf3267f85482d9e)@greggirwin oh, no, it's sphreading! 😁

hiiamboris

[18:16](#msg6274147e61f5ca3feee979f8)☻

greggirwin

[20:20](#msg62743199fa846847c94f40ea)I happily leave it to @qtxie and @hiiamboris to make `sort` work and NaNs handled transparently. @hiiamboris' suggestion to put them at the end, and compare as a different type \*for sorting\*, makes sense to me.

Oldes

[21:13](#msg62743df5fa846847c94f58f1)After \[a tiny change in my R3](https://github.com/Oldes/Rebol3/commit/b751885142634a9bee08c30727023b182b897bbd#diff-593d98c7af7c153edbeb659238444c2f7cf01676d24e3805ac0c2373dcc33ef4L237-R241) I have:

```
>> sort [1.#inf -1.0 1.#nan 1.0 -1.#inf 0 1.#NAN]
== [-1.#INF -1.0 0 1.0 1.#INF 1.#NaN 1.#NaN]
>> sort [1.#inf -1.0 1.#nan 1.0 -1.#inf 1.#NAN 0]
== [-1.#INF -1.0 0 1.0 1.#INF 1.#NaN 1.#NaN]
>> sort [1.#inf -1.0 1.#nan 1.0 1.#NAN -1.#inf 0]
== [-1.#INF -1.0 0 1.0 1.#INF 1.#NaN 1.#NaN]
>> sort [1.#inf -1.0 1.#nan 1.#NAN 1.0 -1.#inf 0]
== [-1.#INF -1.0 0 1.0 1.#INF 1.#NaN 1.#NaN]
>> sort [1.#inf 1.#NAN -1.0 1.#nan 1.0 -1.#inf 0]
== [-1.#INF -1.0 0 1.0 1.#INF 1.#NaN 1.#NaN]
>> sort [1.#NAN 1.#inf -1.0 1.#nan 1.0 -1.#inf 0]
== [-1.#INF -1.0 0 1.0 1.#INF 1.#NaN 1.#NaN]
```

[21:15](#msg62743e75cd35b566afcfdc98)(Never mind.. out of topic here)

greggirwin

[21:22](#msg62744023d30b6b44ebd4bc09)That's OK @Oldes. The note is appreciated since Red wants to fix this as well.

hiiamboris

[21:35](#msg6274433110cfc315bc661ebf)@Oldes This implementation still considers every NaN to be greater than the other NaN, most likely leading to artifacts in more NaN-ridden cases.

[21:45](#msg6274458d949ae9400691c050)Or if you `sort/reverse`

greggirwin

[23:06](#msg6274588cd4ef6e15af312c96)@hiiamboris in your approach, all NaNs would be equal, correct?

## Friday 6th May, 2022

Oldes

[05:52](#msg6274b789eaf3267f85495f38)Reversed sorting works ok..

```
>> sort/reverse [1.#inf -1.0 1.#nan 1.0 -1.#inf 0 1.#NAN]
== [1.#NaN 1.#NaN 1.#INF 1.0 0 -1.0 -1.#INF]
```

But real problem is, that currently:

```
>> 1.#NaN = 1.#NaN  
== false ;<-- which is expected result according IEEE-754
```

Because than comparing blocks will always fail, when there would be a NaN:

```
>> same? [1.#NaN] [1.#NaN]
== false
```

[05:57](#msg6274b8dd41f4560c6f88aa44)@greggirwin So I believe, that it would be better to have all NaNs equal.

[05:59](#msg6274b959949ae940069288b9)Here is a story behind reasons, why NaNs are not equal in IEEE-754 standard  
https://stackoverflow.com/questions/1565164/what-is-the-rationale-for-all-comparisons-returning-false-for-ieee754-nan-values

hiiamboris

[07:41](#msg6274d13014df4e44f2109e5d)I agree they should be equal for sorting purposes only.

GiuseppeChillemi

[08:26](#msg6274dbca949ae9400692cc58)Is #NaN is an conventional representation for infinite numbers?

[08:41](#msg6274df57a687887f8d90bd02)No, I have inferred the wrong thing while guessing 2 NaNs are different because they could have nonequal internal numeric values as they are in the right digits on the example. I have read now wikipedia.

toomasv

[18:05](#msg6275635541f4560c6f89f8fa)Initial trial to use Google's \[icons](https://fonts.google.com/icons?icon.set=Material+Icons) in table:  
\[!\[Icons](https://toomasv.red/images/Table/icons.gif)](https://toomasv.red/images/Table/icons.gif)

GiuseppeChillemi

[18:16](#msg62756616cd938f6ea234074d)Very nice! A question: could text and this graphic be formatted to be at "middle"/"right"/"left" of the cell?

toomasv

[18:18](#msg6275666146495f47cfcad063)So far no. Only column width/height can be changed.

GiuseppeChillemi

[18:18](#msg62756684fa846847c95190d4)How could I give an initial size to each column?

[18:19](#msg627566a49db19366b217199a)And, is there a way to have the first ROW frozen at startup, to let it work as headings?

[18:20](#msg627566f489dcc96e9cecd5e4)(Changed)

greggirwin

[18:58](#msg62756fe8eaf3267f854acbf7)@toomasv :+1:

@Oldes @hiiamboris let's make it so, if @qtxie agrees.

[19:33](#msg62757801a687887f8d91f460)BTW, that link from @Oldes on NaNs is great. :+1:

## Saturday 7th May, 2022

qtxie

[02:55](#msg6275dfa2d4ef6e15af340f1d)@greggirwin @hiiamboris OK. So we just need to handle `COMP_SORT` in `float/compare` ?

[02:56](#msg6275dfcfcd938f6ea234e5da)@toomasv Looks nice!

toomasv

[03:30](#msg6275e7da9db19366b2180457)Thanks!

[04:28](#msg6275f55d41f4560c6f8b0422)@GiuseppeChillemi You can save the state you want next time to use, and then next time, er.., use it. Before saving state you can change sizes of individual columns by dragging on their borders. Also freeze before saving state.

GiuseppeChillemi

[04:44](#msg6275f912fa846847c9529d01)Yes but I am asking if I could pass the column sizes at table Init in options and/or set the first line as frozen in the same config block.

toomasv

[05:49](#msg62760859eaf3267f854bdf53)Currently no.

GiuseppeChillemi

[09:41](#msg62763eb0cd938f6ea2358c7c)I have waited for years, I could wait some more.

## Monday 9th May, 2022

toomasv

[13:35](#msg6279189910cfc315bc6eb0f9)@GiuseppeChillemi A step closer to end your multi-year waiting. Now you can give initial conf, something like e.g. this:

```
view [
    table 617x517 
    data %data/RV291_29062020120209394.csv 
    options [conf: [
        frozen-rows: [1] 
        col-index: [1 6 5 4 3 2]
        auto-index: true 
        sizes: [x: [1 30]] 
]]]
```

hiiamboris

[14:00](#msg62791e65d4ef6e15af39bb9b)Eventually you'll write Giuseppe's program for him :)

toomasv

[14:34](#msg62792680cd35b566afd8ab34)No problem, good to have someone pushing ;)

greggirwin

[17:47](#msg627953a9d4ef6e15af3a2aa8)It's user feedback driving design.

[17:49](#msg62795436cd938f6ea23b05ad)@toomasv is there a reason you don't use `with`, calling it `options` instead? And could `conf` be `config`?

toomasv

[18:17](#msg62795aa689dcc96e9cf3db5d)No special reason, I just used `options` facet instead of creating new one. And yes, I'll change `conf` to `config`.

greggirwin

[18:32](#msg62795e2c41f4560c6f910104):+1: I haven't used `options` for anything myself, that I recall. From a glance at docs, it's only mentioned \[here](https://github.com/red/docs/blob/master/en/vid.adoc#6131-default). Can anyone else weigh in on its use? @hiiamboris is the most likely, or maybe @henrikmk if he tinkered with advanced styles.

hiiamboris

[18:39](#msg62795fdfbb0de60c722f75a3)`with` VID keyword won't allow you add new facets to the face (smth I addressed in Spaces)

[18:40](#msg6279600efa846847c9588c81)But if `config` is defined, then `with` should be better.

greggirwin

[18:40](#msg62796038cd938f6ea23b1aa7):+1:

GiuseppeChillemi

[20:07](#msg6279746b949ae940069b0cfa)@toomasv I have just seen this great news. It's fantastic!

[20:11](#msg62797566fa846847c958b3fc)@greggirwin Henrik uses `setup`. Also `input`and `output` to define input parameters of the row, and output like the size, the columns to display.

[20:13](#msg627975f1fa846847c958b4a7)`Setup` can be used inside an actor to reset the style and change its content and aspect.

[20:21](#msg627977afa687887f8d990056)@toomasv I expected to move completely to Red from Rebol next year but thanks to you and @gurzgri this will happen much sooner. It's like the time when in space sims you change time factor to 32x and the planets and stars start moving fast in front of you.

## Tuesday 10th May, 2022

toomasv

[03:25](#msg6279db47eaf3267f855298c8)@greggirwin `options`facet is \[described](https://github.com/red/docs/blob/master/en/view.adoc#options-facet) as:

&gt; Options facet holds optional facets which are used for specific behaviors

Some of these are predefined, but I would say it is pretty good match to hold optional data for specific behaviours of a face. I don't know what makes `with` better.

[03:27](#msg6279dba7d4ef6e15af3b290c)@GiuseppeChillemi Sure I can change it into `setup` if it is preferred.

[03:38](#msg6279de2fbb0de60c72305e64)Also, notice that you can save your setup into simple text-file (w/o Red header) and use it as e.g. `... options [setup: %my-table-setup] ...`

pekr

[03:47](#msg6279e041eaf3267f8552a0b8)Please hold on on quick naming changes. Just because someone uses setup as a word, does not mean we should use it here too. What is tat for? Is that a replacement for config? If so, config is much better name imo.

[03:49](#msg6279e0c6bb0de60c72306219)As for the `with`, it stems down to VID, where you can kind of inline other configuration directly to the underlying object using a `with`keyword. During R2/R3 times, I think I have seen `options` used, can't remember which GUI version used that though.

greggirwin

[03:56](#msg6279e27589dcc96e9cf4dc6a)Thanks @toomasv. Sometimes I can't find things right in front of me.

I like `config`, as `layout` is already taken. :^) No on `setup`.

Are there other places where `options` is used directly in VID? There is some overlap, as we can have new facets, but also group them, like `extra` overlaps this need. And all generic words. My thought about `with` comes from seeing that, and in the context of VID where it has nice meaning. I'm not set either way, and it's a bit late here, so I won't think more until my brain is fresh.

toomasv

[04:57](#msg6279f0ae949ae940069be8ca)@pekr @hiiamboris @greggirwin  
I like  
that you like  
what you like.

But why not write  
why you like  
what you like.

[05:35](#msg6279f99beaf3267f8552cf0d)Or for that matter  
why better is better  
and why does it matter

[05:50](#msg6279fd3410cfc315bc70600f)at all?

hiiamboris

[07:34](#msg627a1570eaf3267f8553036b)If config is a facet that lives with the widget, `with` is the most \*direct* way to work with it, and it will be easier to access if one wants. If it's just data that gets read and discarded then `options` wins because it doesn't require you to allocate a facet for it. Or if you think this data is not going to be accessed by anyone, thus you kind of hide it. What seems extra then is `options [config:`, why can't it be just `options`?

greggirwin

[07:51](#msg627a198c9db19366b21f7082)\*Damn* Red's flexibility! ;^)

toomasv

[07:57](#msg627a1ad741f4560c6f925eb6)Thanks for explanation, @hiiamboris ! I agree with all points except last, because `options` is used primarily for some predefined things not set by my template, e.g. in case of table: `[style: table vid-align: top at-offset: none]`. `config` is added to these once on initialisation, so it is preferred to be kept in `options`. I'll consider making it mutable during execution, in which case it will be transferred to separate facet and set on initialisation with `with`.

hiiamboris

[08:32](#msg627a2336cd938f6ea23c8338)Ah okay. I thought VID would not interfere with custom styles.

GiuseppeChillemi

[14:58](#msg627a7d9ea687887f8d9af7d8)@toomasv I like `options` and `config`. The other keyword is also a \*verb* as it comes from `setup-face`. `Options` does play well with actions like `restart-face [options[...]]`.

[18:07](#msg627aa9d8bb0de60c7231ed2f)@toomasv

I see `sizes: [x: [1 30]]`. Please note that there are headings on DB which starts with illegal Red words like `2do`. I would be better to accept strings too.

[18:07](#msg627aa9fbd4ef6e15af3ccf15)Pardon...

[18:08](#msg627aaa12bb0de60c7231ed49)I don't understand if `X` = horizontal or a column name.

[18:08](#msg627aaa1761f5ca3feef57775)I have a doubt

[18:08](#msg627aaa2489dcc96e9cf66e48)I am going to try

[18:55](#msg627ab53abb0de60c72320481)But, is `frozen-rows` already implemented? Here it does not work:

```
view [tb: table 1000x600 data x options [conf: [auto-index: true  frozen-rows: [1] ] ]]
```

toomasv

[19:08](#msg627ab84ad4ef6e15af3ced29)`config:…`

[19:23](#msg627abbc610cfc315bc71f161)`x` in `sizes` is dimension, i.e. horizontal, block consists of column numbers (including auto-index) and their widths.

GiuseppeChillemi

[22:17](#msg627ae48ad30b6b44ebe0f2a2)Thank, I want to signal that if I freeze a row, I need to hit another cell have the row become gray

greggirwin

[22:52](#msg627aecc589dcc96e9cf6fa94)Since I doubt I'll have time very soon to dive into `with/options/extra`, @toomasv or @hiiamboris would you set up a wiki page and put some of the notes from this chat there as a starting point? Thanks.

GiuseppeChillemi

[22:59](#msg627aee62cd938f6ea23e2519)@toomasv I have tried to view the usual table with the following line with no luck, all columns are the same, despite the different lenghts

```
view [tb: table 1000x600 data x options [config: [sizes: [x: [81 50 126 99 63 90 108 63 117 90 90 50 50 135 81 108 99 81 99 108 90 108 171 135 63 306 90 99 153 180 171 171 50 72 135 54 117 90 90 63 63 63 50 72 99 99 90 180 180 72 135 90 99 126 135 135 171 162 153 144 153 216 50 90 90 117 90 81 99 99 50 189 189 135 108 135 81 90 414 432 180 180 171 90 162 171 243 108 126 117 144 90 72 81 126 153 81 54 171 243 117 153 153 108 189 90 135 90]]]]]
```

## Wednesday 11st May, 2022

toomasv

[03:31](#msg627b2e0b9db19366b221a59b)If it is list of sizes of columns, then you have to include column numbers too, like `[1 81 2 50 3 126...]`. Otherwise it is interpeted as: column 81 has width 50, column 126 has width 99...

If these are consecutive columns, then you can do it like this:

```
sz: [81 50 126...]
i: 0 
while [not empty? sz][sz: next insert sz i: i + 1] 
sz: head sz
```

&gt; if I freeze a row, I need to hit another cell have the row become gray

This is new, thanks, dealing with it.

[04:18](#msg627b3922949ae940069e82e4)@greggirwin Ok, I'll add it.

GiuseppeChillemi

[09:14](#msg627b7e7b46495f47cfd5eb11)@toomasv @gurzgri

I have just ported the code I had on Rebol to automatically calculate table column sizes, adding the "column index" options you require for your table viewer.

Now I display data simply as follow:

```
view [
	below

	button 150x20 "Open Cust. Groups" [
		view-test-table "SELECT top 1000 * from cfgruppo3"
	]	
	
	button 150x20 "Open Articles" [
		view-test-table "SELECT top 1000 * from ar"
	]	
	button 150x20 "Open Documents" [
		view-test-table "SELECT top 1000 * from dotes"
	]	
	button 150x20 "Open Customers" [
		view-test-table "SELECT top 1000 * from cf"
	]	
	
]
```

[09:14](#msg627b7e93cd35b566afdd337e)(GIF recording is loading)

[09:15](#msg627b7eb9fa846847c95caeaa)\[!\[AnyDesk\_UfyD7jKxXv.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/78Fa/thumb/AnyDesk\_UfyD7jKxXv.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/78Fa/AnyDesk\_UfyD7jKxXv.gif)

[09:17](#msg627b7f3941f4560c6f9525f7)As you can see, columns size is adapted accordingly to its content. I will share the code soon

[09:18](#msg627b7f4aa687887f8d9cf782)(Once I will add `MAP!` support)

toomasv

[09:24](#msg627b80e946495f47cfd5ef23)@greggirwin @hiiamboris I put a brief note in wiki (https://github.com/red/red/wiki/%5BHOWTO%5D-VID-and-View-(GUI)-hints-and-tips#when-to-use-options-extra-and-with). Please edit/complement it as you feel right.

[09:26](#msg627b815f10cfc315bc736b6e)@GiuseppeChillemi Great! Notice, that if you use `focus` keyword on your table, then the cursor-cell will be "active" at once (i.e. you can move it with navigation-keys). Otherwise it will become active after a click on table only.

GiuseppeChillemi

[09:41](#msg627b84e0cd35b566afdd407b)@toomasv Is there a common actor that triggers either when you select a cell via mouse click, or via navigation keys, or via some `set-focus` function?

toomasv

[09:49](#msg627b869846495f47cfd5fa58)`mark-active`, but it currently takes only relative coordinates of cell as visible on screen. I still have to make a more general function for selection. There are now buds of `find-in-row` and `find-in-col` funcs also, accessible from menu. `find-in-row` just seeks strings in cells; `find-in-col` works similar to filtering, but instead of actually filtering it just marks matching cells. Not much tested, brittle.

GiuseppeChillemi

[09:49](#msg627b86b941f4560c6f9537b5)Question 2: about accessing filtered/whole-data . Until you will implement these accessors, how could I read and modify the current selected row from an actor? Or modify a cell/row?

[09:55](#msg627b880241f4560c6f953b43)A final note: I have just discovered that:  
`col-index: [1 6 5 4 3 2]` implements the selection of displayed column. Great! Now the table style is already usable as flexible data viewer.

toomasv

[09:56](#msg627b8839bb0de60c72339ffd)Yes, selection AND custom ordering.

[09:57](#msg627b88a114df4e44f21d0e54)Preparing answer for Q2 now... :)

GiuseppeChillemi

[10:07](#msg627b8ae9bb0de60c7233a4c0)It is an exciting day today.

toomasv

[11:46](#msg627ba20deaf3267f85561787)A wise man said: One example is better than thousand words:  
\[!\[find-select](https://toomasv.red/images/Table/find-select.gif)](https://toomasv.red/images/Table/find-select.gif)  
Here is source

```
view [
    below 
    panel [
        origin 0x0 
        code: area 340x63 
        below 
        col: drop-down 100 data ["1" "2" "3" "4" "5" "6"] 
        button 100 "Find" [tb/actors/find-in-col tb col/selected load code/text] 
        return 
        button 140 "Filter" [tb/actors/filter tb col/selected load code/text] 
        button 140 "Remove filter" [tb/actors/unfilter tb]
    ] 
    tb: table 617x517 data %data/RV291.red focus 
    across 
    out: area 500x60 wrap 
    button "Get selected" [
        tb/actors/copy-selection tb 
        out/text: form selection-data
    ]
]
```

It's frresh and brittle. Expect bugs.

GalenIvanov

[11:51](#msg627ba33dcd35b566afdd7dc9)Great!

toomasv

[12:01](#msg627ba59fd30b6b44ebe264eb):)

[12:22](#msg627baa85bb0de60c7233e68c)@GiuseppeChillemi Warning! I'm going to change `copy-selection` into `copy-selected`, and `selection-data` into `selected-data`, which read more naturally.

GiuseppeChillemi

[12:27](#msg627baba7d30b6b44ebe27033)Nice, you find, filter and get values. Some observations:

From code you should be able to do the following:

`Get/Set/Select XxY`(or `YxX`)  
`Get/Set/Select XxY to XxY`  
`Get/Set/Select XxY to XxY`  
`Get/Set/Select XxX` &lt;- Whole Rows  
`Get/Set/Select YxY` &lt;- Whole Columns  
Other than `columns`, filter by one or more `rows`

Also, it is really important that `get-filtered` or `get-data`, `selected-data` like operations, could return data in these formats:  
`data` or  
`data + indexes`  
`indexes`

The most important one is the last, as it with indexes you can later `get/write/select` the original cells.

[12:31](#msg627baca689dcc96e9cf87c6e)And the indexes/coordinates could be relative to filtered view or to the original data.

[12:33](#msg627bacfcd30b6b44ebe272d0)So, at the moment there is no way to write back.

toomasv

[12:33](#msg627bad0d61f5ca3feef761ae)Nope, unless directly edit cells.

GiuseppeChillemi

[12:42](#msg627baf2efa846847c95d1332)I have faith, we are near.

[12:42](#msg627baf39d30b6b44ebe2775a)Very near.

[16:33](#msg627be56046495f47cfd6bc66)I admit I am looking at https://toomasv.red/images/Table/find-select.gif in loop. I think I am hypnotized

toomasv

[17:07](#msg627bed58d30b6b44ebe2fb55)Here comes another one to look at - selection from different bases:  
\[!\[select-in-table](https://toomasv.red/images/Table/select.gif)](https://toomasv.red/images/Table/select.gif)

[17:13](#msg627beec6eaf3267f8556be1b)

```
view [
    below 
    panel [
        origin 0x0 
        code: area 340x63 
        below 
        col: drop-down 100 data ["1" "DIM2" "Abielu kestus" "TIME" "Vaatlusperiood" "Value"] 
        button 100 "Find" [tb/actors/find-in-col tb col/selected load code/text] 
        return 
        button 140 "Filter" [tb/actors/filter tb col/selected load code/text] 
        button 140 "Remove filter" [tb/actors/unfilter tb]
    ] 
    tb: table 617x517 data %data/RV291.red focus 
    panel [
        origin 0x0 
        out: area 380x63 wrap 
        below 
        from: check data #[false] "from" 
        pad 0x3 
        start: drop-down 100 data ["view" "current" "top"] select 1 
        return 
        button 90 "Select" [
            either from/data [
                st: load pick start/data start/selected 
                tb/actors/select/from tb load out/text st
            ][
                tb/actors/select tb load out/text
            ]
        ] 
        button 90 "Get selected" [tb/actors/copy-selected tb out/text: form selected-data]
    ]
]
```

GiuseppeChillemi

[17:25](#msg627bf18189dcc96e9cf90dd8)When you have revealed this project, I have thought that spreadsheet could limit some features of the data grid. Instead it power it up, because you can extract data snapshots. This feature opens a lot of possibilities

greggirwin

[17:39](#msg627bf4eafa846847c95dab80)@GiuseppeChillemi thanks for testing and playing.

@toomasv thank you for continuing to "power it up".

toomasv

[17:40](#msg627bf50c41f4560c6f96164b):+1:

GiuseppeChillemi

[17:46](#msg627bf68761f5ca3feef7fe3c)@greggirwin The Table Style is very important for our community. It will open a world of opportunities.

greggirwin

[17:51](#msg627bf79f949ae94006a01574)@GiuseppeChillemi it's \*HUGE* IMO.

GiuseppeChillemi

[19:12](#msg627c0aabd4ef6e15af3f977b)@greggirwin When ports and timer will be implemented, one of the GEMS you have made in your career, will be important for red

[19:12](#msg627c0abad30b6b44ebe338b2)You know which one 😉

greggirwin

[19:18](#msg627c0bfe46495f47cfd70e54)I'm not sure I do, but I like the suspense of not knowing. :^)

GiuseppeChillemi

[19:36](#msg627c1024d4ef6e15af3fa327)I will `schedule` a reminder for you.

greggirwin

[19:40](#msg627c112589dcc96e9cf94cbf)Ah, thanks. ;^)

GiuseppeChillemi

[19:49](#msg627c135f46495f47cfd71eb1)Just a note for everyone. Until the Android version of Red will be ready, we can replace these devices using Windows Tablets like Dell Venue series. Then it's just matter of using a big Font size in Table

## Thursday 12nd May, 2022

Boum69

[12:35](#msg627cff1e46495f47cfd8d78d)Amazing work @toomasv ! Great progress . Your table widget is really professional and I admit it was one of the only thing teally lacks in Red the second thing is audio support .

toomasv

[12:36](#msg627cff5dfa846847c95fb066)Thanks, @Boum69 !

Boum69

[12:36](#msg627cff6889dcc96e9cfb1db2)@toomasv : how can I use a CSV file with your table widget . I ve understood that it only read .csv files from url ? Can I use one CSV file from my hard disk?

toomasv

[12:41](#msg627d007561f5ca3feefa02f7)@Boum69 Yes, it was primarily intended for working with csv-files. You can use it with csv-file like this (with \[newest version](https://github.com/toomasv/table-template)):

```
do %table-template.red 
view [table 617x517 data %data/RV291.csv]
```

Boum69

[13:31](#msg627d0c31cd35b566afe045d7)Thank you very much, I will try it as soon as possible. 🙂

toomasv

[13:40](#msg627d0e5e10cfc315bc768ac0):+1:

[14:52](#msg627d1f2e41f4560c6f985c8a)@GiuseppeChillemi Another step forward: now you have almost total control over writing into table programmatically. Here is silly example:  
\[!\[pasting-into-table](https://toomasv.red/images/Table/pasting.gif)](https://toomasv.red/images/Table/pasting.gif)

[15:01](#msg627d212dcd938f6ea24280f3)

```
view [
    below 
    panel [
        origin 0x0 
        code: area 340x63 
        below 
        col: drop-down 120 data ["1" "DIM2" "Abielu kestus" "TIME" "Vaatlusperiood" "Value"] 
        button 120 "Find" [
            tb/actors/find-in-col tb col/selected load code/text
        ] 
        return 
        button 120 "Filter" [
            tb/actors/filter tb col/selected load code/text
        ] 
        button 120 "Remove Filter" [
            tb/actors/unfilter tb
        ]
    ] 
    tb: table 617x517 data %data/RV291.red focus 
    panel [
        origin 0x0 
        out: area 340x63 wrap 
        below 
        button 120 "Select" [
            either from/data [
                st: load pick start/data start/selected 
                tb/actors/select/from tb load out/text st
            ][
                tb/actors/select tb load out/text
            ]
        ] 
        panel [
            origin 0x0 
            from: check 50 data #[false] "from" 
            pad 0x3 
            start: drop-down 60 data ["view" "current" "top"] select 1
        ] 
        return 
        button 120 "Get Selected" [
            tb/actors/copy-selected tb 
            out/text: read-clipboard
        ] 
        button 120 "Set Selected" [
            selected-data: load/all out/text 
            tb/actors/paste-selected tb
        ]
    ]
]
```

Respectech

[15:40](#msg627d2a82cd938f6ea242951e)That is really nice!

toomasv

[16:26](#msg627d352e41f4560c6f988d22):)

GiuseppeChillemi

[16:30](#msg627d3643bb0de60c7236f9f2)What can I say, I am looking at the spectacle of birth! :-)

pekr

[16:42](#msg627d38da46495f47cfd9573b)Is there a possibility of a conditional coloring?

GiuseppeChillemi

[16:43](#msg627d394814df4e44f2206c62)Find is already coloring but I think it could use a function to be called with cell value and eventually coordinates to have a color value returned or a full font and attributes specification

toomasv

[17:12](#msg627d400bcd35b566afe0bc1b)Formatting is generally not supported, to keep it simple, but may be added later. @pekr Please tell me about conditional coloring in more detail, what do you expect from it.

greggirwin

[17:56](#msg627d4a37eaf3267f8559669c)I don't think that's a silly example at all @toomasv. It shows exactly how it works, and very clearly. Very nice!

[18:03](#msg627d4c09a687887f8da0a70f)On formatting, we definitely want to use `format`, rather than duplicating effort and having multiple systems. This work will push that back on the priority list. @toomasv new example also brings to mind that HOFs should be applicable to selected data, which may be defined as above or via cell ranges. So HOFs come back up as well.

Coloring isn't part of `format`, but there is overlap in how things work, including how a `table!` type works and maps to UIs as simply as possible. I haven't looked at the internals of `table` to see how data structures map architecturally. Future work.

One of the key aspects for formatting (including coloring) is the hierarchy (scoping) of application and how to make it efficient. Another aspect, which comes down to design choices, as none are perfect, is masked inputs for editing. AFAIK there is no "winner" in this area from UX research. I'd love to be wrong about that. For now, we need to keep it simple. I don't remember if @hiiamboris has experiments in this area.

GiuseppeChillemi

[18:12](#msg627d4e0441f4560c6f98bfe0)+1 To adopt Format for the text part.  
For me, conditional visualization is just color names or tuples returned by a function you pass the current cell value . Colors could be either for text and backgrounds. Later, this function could return other font attributes.

toomasv

[18:15](#msg627d4eb041f4560c6f98c17e)Thanks, @greggirwin ! Yes, I like it myself too :)=  
The thing is, `copy-selected` generates two global words - `selected-data`, refering to you-know-what, and `selected-range`, refering to addresses of cells from which data were extracted. Data are extracted exactly in order you selected cells. After `copy-seleccted` you can select either single cell or new range, which has to have same length as data previously selected (may be I'll loose this requirement). With `paste-selected`, if single cell is selected then previously extracted data are pasted into table according to the figure in `selected-range` but relative to the given cell. If a range is selected (matching the size of extracted data), then data (possibly edited) are pasted into the selected range, again exactly in order as the (new) range is selected. :hmm: Hopefully this makes some sense...

greggirwin

[18:18](#msg627d4f7d41f4560c6f98c2e8)@toomasv that's \*great\*. By making it data driven and declarative (it could be, done in code). It's powerful because then you can create "forms" or entry points into a spreadsheet, insert data, it recalcs, and you can extract data from "result" ranges.

GiuseppeChillemi

[18:23](#msg627d5085bb0de60c723732c7)@toomasv A question: data format is actually block of blocks but does Table work with rows that have keys coded into the row, like map/objects?

toomasv

[19:09](#msg627d5b87fa846847c960812d)@GiuseppeChillemi No, table is strictly block of blocks, but data extracted by `copy-selected` and pasted back by `paste-selected` is flat block.

[19:12](#msg627d5c1c89dcc96e9cfbeb1b)I.e. data should be transformed into correct format (block of blocks) before entering table.

## Friday 13th May, 2022

toomasv

[03:48](#msg627dd5069db19366b226dbe0)Example of how copy-paste works:  
\[!\[copy-paste](https://toomasv.red/images/Table/copy-paste.gif)](https://toomasv.red/images/Table/copy-paste.gif)

```
view [
    table 217x217 data 8x9 options [config: [box: 25x25 auto-index: true]] 
    table 217x217 data 8x9 options [config: [box: 25x25]]
]
```

pekr

[04:26](#msg627dde03d4ef6e15af432acf)@toomasv sorry for a late reply ... conditional coloring is quite common, even with Excel. You have for e.g. list of contracts and you want to watch various stages - new, in progress, finished, invoiced, paid, closed, etc. Or you want to hilite the ones with some risk factors ... you can either color the cell, or a row ....

toomasv

[04:50](#msg627de387cd35b566afe1f98d)Ok, thanks, @pekr !

greggirwin

[06:19](#msg627df86eeaf3267f855ac10e)Programmatic coloring is cool, but a baseline for coloring is simple alternates for odd/even rows, which is in place already. That's a \*really* nice feature for making things look "financial".

GiuseppeChillemi

[07:25](#msg627e07ed89dcc96e9cfd33f9)@greggirwin we use coloring in a Rebol table for warnings: list customers which still have to pay, orders that are overdue, document lines which have a price too low or excessive discount

greggirwin

[07:59](#msg627e0fe7bb0de60c72389b91)Yes, there are many uses.

Boum69

[09:28](#msg627e24c8fa846847c961fe36)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/wkgV/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/wkgV/image.png)

[09:28](#msg627e24cdcd938f6ea2447f16)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/4gEE/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/4gEE/image.png)

[09:29](#msg627e24e0d30b6b44ebe746c0)Hi @toomasv I ve downloaded your newest version and I got this error after trying to launch test-table.red (I work on Win10 and I have downloaded the last automatic buil wich work with your previous version )

toomasv

[09:57](#msg627e2b82d4ef6e15af43bc57)@Boum69 Sorry, my bad! I forgot to update `try-table.red` after some changes in `table-template.red`. Now should work.

[11:07](#msg627e3be1bb0de60c7238f4a0)Towards colors:  
\[!\[colors](https://toomasv.red/images/Table/colors.gif)](https://toomasv.red/images/Table/colors.gif)

```
do %colors/web-colors.red
colors: foreach [color tuple] web-colors [
    repend/only [] [color tuple compose [fill-pen (tuple) pen off box 0x0 99x24]]
]
insert/only colors ["Web-Color" "Value" "Example"]
view [table data colors]
```

GiuseppeChillemi

[11:36](#msg627e42bca687887f8da274e5)Fantastic!

[11:37](#msg627e430289dcc96e9cfda5b3)We have a Rainbow Table. Imagine 10x10 boxes with different colors and we have a color palette to pick from

pekr

[11:53](#msg627e46d741f4560c6f9a96e2)@toomasv - You are faster than the light speed :-) Just a question - will the table become part of the official distro? It is imo so essential, that I would like to vote for the inclusion ....

GiuseppeChillemi

[12:12](#msg627e4b3e41f4560c6f9a9f76)@toomasv and If look at his code is also well structured and pleasant to read.

[12:13](#msg627e4b7441f4560c6f9a9fbf)I would vote the inclusion of the table too, even using 10 fake accounts for this sole purpose!

[13:03](#msg627e5733cd35b566afe2e2b0)Ashley's Munge has a load-excel function and a save-excel it would be perfect to use in together with table style.

[13:04](#msg627e575d949ae94006a4b8ad)The bad new is that Dobeash site has disappeared.

[13:04](#msg627e57759db19366b227d999)@Dobeash Are you there?

[13:06](#msg627e57cbeaf3267f855b7f6d)Here is the archived version: https://web.archive.org/web/20181108193048/http://dobeash.com/

[13:08](#msg627e5833cd938f6ea244e35a)Here is the the latest version: https://github.com/GiuseppeChillemi/munge

greggirwin

[18:37](#msg627ea55ffa846847c96307a6)I think `table` should be standard as well, but the final call lies with Nenad.

[18:38](#msg627ea5ad89dcc96e9cfe78c7)With all the great feedback and excitement here, and @toomasv' amazing progress in response to it, Toomas and I should plan to propose it to him at the end of the month for review.

Boum69

[20:25](#msg627ebea210cfc315bc79e5f0)@toomasv I confirm that it works know ; )

[20:25](#msg627ebeb3cd938f6ea245bf59)Thank you

[20:28](#msg627ebf51eaf3267f855c576f)One more question : I didn't succeed to load a csv file with ";" delimiter. Is it not yet implemented? Maybe @rebolek could help me too please? I don't know how to use your csv codec.

greggirwin

[20:29](#msg627ebf8deaf3267f855c5851)@Boum69 have you used `? load-csv` to see the options?

ne1uno

[20:36](#msg627ec14114df4e44f22378c7)can comment out include CSV.red if using recent version

Boum69

[20:47](#msg627ec3ec61f5ca3feefd9e18)@greggirwin no : / sorry to waste your time. I just succeeded now . I understand how it works. But there are some characters who couldn't be loaded such as "é" "à", etc..

[20:49](#msg627ec44f9db19366b228bf19)@ne1uno the CSV codec is in the folder of the table-template from @toomasv but there  
is no version number...

ne1uno

[20:49](#msg627ec46bd30b6b44ebe891bc)`if not find system/codecs 'csv [#include SV.red]`

[20:49](#msg627ec476949ae94006a59f2a)`if not find system/codecs 'csv [#include CSV.red]`

[20:52](#msg627ec522bb0de60c723a12df)`if not find system/codecs 'csv [#include SV.red]`

greggirwin

[20:53](#msg627ec54541f4560c6f9b9d58)@Boum69 not a problem at all. :^) If your data isn't UTF-8, and uses code pages, @rebolek can point you to his supporting work for that.

ne1uno

[20:53](#msg627ec54fa687887f8da38452)my client is doing something weird with '%

greggirwin

[21:06](#msg627ec85ceaf3267f855c66e8)Not sure if this is the latest, but https://gitlab.com/rebolek/codepage

Boum69

[21:16](#msg627eca9561f5ca3feefda9ef)Thank you so much at both of you ; )

## Saturday 14th May, 2022

toomasv

[05:37](#msg627f3ffdbb0de60c723ae94c)Thanks all for your support! I am out of town, so my responses are sporadic.  
Here is another example of using colors:  
\[!\[custom-colors](https://toomasv.red/images/Table/custom-colors.gif)](https://toomasv.red/images/Table/custom-colors.gif)

Code altered from previous:

```
do %colors/web-colors.red
colors: foreach [color tuple] web-colors [
    set to-word color tuple 
    repend/only [] [color tuple compose [fill-pen (tuple) pen off box 0x0 99x24]]
]
insert/only colors ["Web-Color" "Value" "Example"]
view [title "Colored table" table data colors options [config: [frozen-rows: [1]]]]
```

luis-rj

[15:44](#msg627fce5beaf3267f855e3f36)I really admire your work, thanks !

greggirwin

[16:15](#msg627fd59461f5ca3feeff8bfc)Fancy color names @toomasv. ;^) :+1:

toomasv

[17:11](#msg627fe2b6d30b6b44ebea9322)Thanks, @luis-rj !  
@greggirwin Yes, I like \[these](https://htmlcolorcodes.com/color-names/). But there is no chance I can remember those.

GiuseppeChillemi

[19:31](#msg6280038dd30b6b44ebead2b5)@toomasv please, come back from your holidays, we can't live withouth your daily improvements

toomasv

[19:33](#msg6280040614df4e44f225c44c):) I was dead silent for ~three months, agonizing to build the basics, ... and to have fun now.

greggirwin

[19:50](#msg628007fa949ae94006a7e417)Giving birth is hard.

toomasv

[19:50](#msg62800817eaf3267f855eabca)But conceiving is fun :)

greggirwin

[20:00](#msg62800a5541f4560c6f9df39a)Practice, practice, practice.

## Sunday 15th May, 2022

rebolek

[06:53](#msg6280a35b46495f47cfdfbf44)@Boum69 when you compile, you can include CSV codec in the `needs` header.

Boum69

[07:26](#msg6280ab11a687887f8da6fc59)Ok thank you @rebolek 👍 and thank you for your codec. 👌

rebolek

[08:30](#msg6280ba1a61f5ca3fee01272c)You’re welcome. If you have troubles running it or any questions, just let me know.

Boum69

[09:24](#msg6280c6b0a687887f8da72b14)Of course I will ; ) thanks again.

## Monday 16th May, 2022

toomasv

[14:47](#msg6282641bfa846847c96a062a)Baby db-viewer. \[Chinooking](https://github.com/toomasv/table-template/blob/main/chinook2.red):  
\[!\[chinook](https://toomasv.red/images/Table/db-chinook.gif)](https://toomasv.red/images/Table/db-chinook.gif)

ldci

[14:50](#msg628264c4cd938f6ea24ca0b8)@toomasv Great job as usual :)

toomasv

[14:52](#msg6282652389dcc96e9c057da0)Thanks, @ldci! :)

pekr

[14:57](#msg6282667610cfc315bc80ad10)Perfect :-)

toomasv

[15:07](#msg628268c8949ae94006ac6333):smile:

Respectech

[16:03](#msg628275b641f4560c6fa2a245)I really enjoy seeing the anim GIFs of the demos.

toomasv

[16:34](#msg62827d2eeaf3267f85635670)Yes, to see is much better than to read (often, not always).

pekr

[16:41](#msg62827eba949ae94006ac9354)Can columns be auto-scaled for the content value? I know that it is not always desirable ....

toomasv

[17:03](#msg628283fbcd938f6ea24ce4ea)I have considered this, but currently no.

GiuseppeChillemi

[17:29](#msg62828a15d30b6b44ebef9c16)@pekr If for "autoscale" you mean start the table with every column size proportioned to fit its content, I have some code

[17:31](#msg62828a5ed4ef6e15af4c202a)You can see it at work here: https://gitter.im/red/red/gui-branch?at=627b7e7b46495f47cfd5eb11

[17:37](#msg62828be1eaf3267f856375f0)I see the information on botton right, it is perfect for debugging. Nice work as always, Toomas!

[17:39](#msg62828c50bb0de60c72412801)86 lines for a full DB viewer, including 10 of headers... Red, what else?

toomasv

[17:58](#msg628290add30b6b44ebefaa35)Thanks, Giuseppe!

[18:17](#msg6282953146495f47cfe3a52c)But what you can do, is changing sizes of several columns at once, like this (holding down ctrl while dragging):  
\[!\[sizes](https://toomasv.red/images/Table/sizes.gif)](https://toomasv.red/images/Table/sizes.gif)

greggirwin

[19:16](#msg6282a31ecd938f6ea24d256b)Beautiful @toomasv! :clap:

[19:18](#msg6282a384a687887f8daae5f6)Being able to save and restore table layouts is so important.

[19:42](#msg6282a925d30b6b44ebefdbe0)@toomasv can you put the test DB in the repo, or somewhere else if it's large?

## Tuesday 17th May, 2022

toomasv

[03:31](#msg6283172941f4560c6fa3e129)Thanks, @greggirwin ! Yes, I saved layout configurations in `%chinook2.cnf` (in \[repo](https://github.com/toomasv/table-template/blob/main/chinook2.cnf)). To use these one can just do `table-opts: load %cchinook2.cnf` before opening `%chinook2.red`. I'm going to put it in menu though.

Test db is a \[standard SQLite sample db](https://www.sqlitetutorial.net/sqlite-sample-database/).

ldci

[08:42](#msg6283600041f4560c6fa46df6)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/FpeI/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/FpeI/image.png)

[08:42](#msg62836013fa846847c96bf208)Playing with styles :)

[08:45](#msg62836097949ae94006ae416b)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/lNPn/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/lNPn/image.png)

[08:45](#msg628360a146495f47cfe52280)Another test

GiuseppeChillemi

[10:39](#msg62837b6c61f5ca3fee067e9e)@ldci So, you are creating styles with your code using DRAW?

ldci

[10:44](#msg62837c729db19366b231b1ca)@GiuseppeChillemi Yes with 2 draw methods depending on face data value (0 or 1). The basic idea is to use an object with properties and methods in the face/extra property.

toomasv

[10:46](#msg62837d0710cfc315bc82ce4a)@ldci Nice!

ldci

[10:52](#msg62837e62cd938f6ea24ec1fd)@toomasv Thanks, the idea comes from the style `switch-btn`, but I don’t know who created this code. May be @greggirwin or @rebolek ?

toomasv

[11:28](#msg628386eed4ef6e15af4e02d4)My version:

```
view [
    toggle: box 40x20 0.0.0.254 data #[false] 
    draw [
        shape [
            pen gray move 10x2 'hline 18 'arc 0x18 9 9 0 sweep 'hline -18 'arc 0x-18 9 9 0 sweep
        ] 
        switch-off: pen gray fill-pen brick circle 10x10 9 
        switch-on:  pen off  fill-pen off   circle 28x10 9
    ] 
    on-down [
        face/data: not face/data 
        switch-on/pen:       pick [gray off]  face/data 
        switch-on/fill-pen:  pick [leaf off]  face/data 
        switch-off/pen:      pick [off gray]  face/data
        switch-off/fill-pen: pick [off brick] face/data
    ] 
    text react [face/text: form toggle/data]
]
```

GalenIvanov

[11:32](#msg628387b510cfc315bc82e3c9)@ldci and @toomasv Nice!

GiuseppeChillemi

[11:38](#msg6283894fd4ef6e15af4e07e7)One day I will learn how to create them. I would like doing this a lot

toomasv

[11:43](#msg62838a4ccd938f6ea24eda1b)More like @ldci's :

```
view [
    toggle: box 40x20 data #[false] 
    draw [
        pen gray
        shape [fill-pen brick move 10x1 'hline 18 'arc 0x18 9 9 0 sweep 'hline -18 'arc 0x-19 9 9 0 sweep] 
        switcher: fill-pen linen circle 10x10 9 
    ] 
    on-down [
        face/data: not face/data 
        switcher/circle/x:  pick [28 10]  face/data 
        face/draw/shape/fill-pen: pick [leaf brick] face/data
    ] 
    text react [face/text: form toggle/data]
]
```

GiuseppeChillemi

[12:11](#msg628390dfcd938f6ea24ee6f9)I always ask myself if VID and DRAW could be transposed to generate graphic for the WEB.

pekr

[12:15](#msg628391cb9db19366b231dfdd)You imo either need to create a transpiller, which generates the whole app in terms of the html, css, js ... not just VID, but also if you want your app to be any useful - it has to have some supporting code in js. Or ... use stuff like Webassembly to put whole your app in a container. But I am not even sure I have ever seen WebAssembly app - not sure if this concept lives up to its initial expectations ....

toomasv

[12:35](#msg62839675fa846847c96c6359)\[!\[thumbs-up](https://toomasv.red/images/Misc/thumb-toggle.gif)](https://toomasv.red/images/Misc/thumb-toggle.gif)

```
view [box 40x40 data #[false] draw [scale 2 2 text 1x1 "^(1F44E)"] 
on-down [face/draw/6: pick ["^(1F44D)" "^(1F44E)"] face/data: not face/data]]
```

ldci

[12:46](#msg62839936cd35b566afed184d)@toomasv Very elegant solutions :)

toomasv

[12:56](#msg62839b7f89dcc96e9c07e01c)Thanks, @ldci ! :)

GalenIvanov

[13:19](#msg6283a0d4fa846847c96c7940):+1:

toomasv

[16:50](#msg6283d254a687887f8dad2f23)A day gone astray:  
\[!\[thumb-toggle2](https://toomasv.red/images/Misc/thumb-toggle2.gif)](https://toomasv.red/images/Misc/thumb-toggle2.gif)

```
view [
    toggle: box 40x40 data #[false] 
    draw [matrix [2 0 0 -2 0 40] text 1x1 "^(1F44D)"] 
    on-time [
        face/draw/matrix/6: face/draw/matrix/6 - (cf * 1.2) 
        face/draw/matrix/4: face/draw/matrix/4 + (cf * 0.1) 
        if 40 = tick: tick + 1 [face/rate: none]
    ] 
    on-down [
        tick: 0 
        cf: pick [1 -1] face/data: not face/data 
        face/rate: 60
    ] 
    text react [face/text: form toggle/data]
]
```

greggirwin

[17:30](#msg6283dbc6cd938f6ea24f8dbd)Fun stuff all!

ldci

[18:56](#msg6283efe4fa846847c96d1e47)@greggirwin This means rhat Red is a really fantastic language for creative and innovative approaches.

## Wednesday 18th May, 2022

ldci

[09:04](#msg6284b693db3fe1746f04dc04)Hi all. This code runs perfectly under macOS, but not with windows. Any idea why?

```
#! /usr/local/bin/red
Red [
	Title: "drop-down"
	Author: "LDCI"
	Version: 1.0
	Notes: {This code allows to use unicode characters in Red drop-down object}
	Needs: view
] 

;--update the color viewer according to selected object
update: func [face [object!]] [
	f/color: face/font/color  
	cf/text: form face/font/color
]


view win: layout [
	title "Color Selection: drop-down"
	space 5x5	
	t: drop-down 100 white black font-size 11 data []
	on-create [
		append face/data rejoin [to-char 2764h to-char FE0Fh " Red"]
		append face/data rejoin [to-char 1F49Ah " Green"]
		append face/data rejoin [to-char 1F499h " Blue"]
		append face/data rejoin [to-char 1F49Ch " Magenta"]
		append face/data rejoin [to-char 1F9E1h " Orange" ]
		append face/data rejoin [to-char 1F49Bh " Yellow"]
		append face/data rejoin [to-char 1F5A4h " Black"]
		face/extra: [red green blue magenta orange yellow black]
	]
	
	on-change [ 
		face/font/color: do face/extra/(face/selected)
		update face				;--update color viewer
		face/font/color: black	;--restore default font color 
	]
	select 1
	cf: field 90 center
	pad 5x0 button  50 "Quit"[quit]
	return
	f: base 260x120 white black font-size 16 
	do [f/color:red cf/text: "255.0.0"]
]
```

[09:04](#msg6284b6a9c5aac73747c45d1c)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/cifQ/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/cifQ/image.png)

[09:04](#msg6284b6b59b66e01be6feb9e9)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/ns17/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/ns17/image.png)

hiiamboris

[09:33](#msg6284bd5b8e47ce374abec7bb)GDI controls do not color codepoints

ldci

[10:04](#msg6284c49974eb0971abcc6007)@hiiamboris. Thanks for information:)

toomasv

[16:07](#msg628519dcaf3c8355c0b0ca02)Emojimation:  
\[!\[rocket](https://toomasv.red/images/Misc/rocket.gif)](https://toomasv.red/images/Misc/rocket.gif)

```
a: -0.2657 b: 0 
view [box 400x120 navy 
    draw [
        push [matrix [1 0 0 1 200 250] translate -200x-150 rocket: text 1x1 "^(1F680)"] 
        text 100x20 "^(1F31C)"text 300x0 "^(2728)"
    ] 
    on-time [
        b: b + a
        m/1: cosine b m/2: negate sine b m/3: sine b m/4: cosine b 
        switch tick: tick + 1 [400 [a: 0] 420 [rocket/3: "^(1F4A5)"] 450 [face/rate: none]]
    ] 
    on-down [m: face/draw/push/matrix tick: 0 face/rate: 30] 
]
```

hiiamboris

[16:09](#msg62851a1c887b1a635ba8b6cb)ouch! what a crash

toomasv

[16:09](#msg62851a3e978f8b71a7d67b63):)

ldci

[16:23](#msg62851d661308e56363aec667)@toomasv Nice animation:)

rebolek

[16:32](#msg62851fab9b66e01be6ff959a)if the rocket rotated in reverse it could actually land safely ;) anyway, very nice!

greggirwin

[16:33](#msg62851fe292865155b8cabc5e)Add `on-key` and it's Lunar Lander.

toomasv

[16:57](#msg6285258b978f8b71a7d6941a):)

[16:59](#msg62852607978f8b71a7d694f7)Today got a step forward with big file viewing:  
\[!\[big-csv](https://toomasv.red/images/Table/big-csv.gif)](https://toomasv.red/images/Table/big-csv.gif)  
But I don't know yet how to filter/sort/search these as they are loaded in chunks...

greggirwin

[17:16](#msg628529defd12f01bddb28690)Is the issue that the data won't fit in memory, so you have to load it in chunks?

toomasv

[17:24](#msg62852bc1f90a084962515a15)Yes, the second I opened in gif is 200+ MB and red (or rather table) could not open it - it struggled for 5 minutes and then gave up :(

greggirwin

[17:28](#msg62852cd3f90a084962515ba3)So Red can load the data, but then what `table` has to do to map and access it hits limits.

[17:29](#msg62852d01af3c8355c0b0f51d)A 200M file may be hitting Red limits when loaded. How much memory does the process use?

[17:31](#msg62852d79db3fe1746f05de8b)Are you using `read/seek` and `read/part` to chunk it?

[17:36](#msg62852e92bd487e746b5d898a)It does become more involved when you have to create interim structures and work on subsets of data, though it can still be pretty fast, and then you're just assembling what table works against in memory. That still has its limits, unless you then stream results to disk (cached query result) and then chunk against that.

toomasv

[17:45](#msg628530c09b66e01be6ffb806)I'll try to measure how much it consumes. And yes, I used `read/binary/seek/part` to chunk it (together with `find/last` to cut it on newline) .

greggirwin

[18:21](#msg6285391aa726cf495bb71193)Ah, for the days of fixed size records and `GET/PUT` mode in BASIC. :^)

toomasv

[18:32](#msg62853ba077bd5538bd970ec7)Well, tried to measure it with `profile`, but console died :(

GiuseppeChillemi

[18:33](#msg62853be077bd5538bd970f5a)The day will come we could handle big data on Red, I have faith!

## Thursday 19th May, 2022

toomasv

[05:26](#msg6285d4f8f8daa71e07884314)With `load-csv` reading 208MB csv file, console died after the process consuming 1.5+GB.  
`read`ing it takes ~350MB and then settles to 210MB in 1.7 sec.

planetsizecpu

[06:16](#msg6285e0d967db9a59dbd7ca50)&gt; Ah, for the days of fixed size records and `GET/PUT` mode in BASIC. :^)

The computers gold age! 😍

rebolek

[08:47](#msg62860431db6f627d258cf5b6)@toomasv rewriting CSV as a scheme would certainly help with big file access and sorting.

[08:47](#msg6286043ec9382316a610bc3d)However it’s not priority TBH.

GiuseppeChillemi

[09:45](#msg628611cfe393a3180614b6df)The current state of things cuts out any possibility to use big data sets. They are not of common use but in research and mid sized companies. However, you can import them in the database engine of your choice and query the data while waiting RED64 will be release in a couple of years.

greggirwin

[12:50](#msg62863cfa4e38f759e27a23f1)@toomasv thanks for the notes. I don't think I ever stress tested it, though I have done that with JSON or XML codecs a bit. It will be good to have some rough numbers out there for people, to manage expectations.

GiuseppeChillemi

[16:38](#msg6286728f09eea00adea163c7)@toomasv is it possible to change font size in Table style?

toomasv

[16:39](#msg628672c509eea00adea163f8)No formatting so far (except background color).

## Friday 20th May, 2022

toomasv

[08:42](#msg628754784aa6c31dca0f02e4)Querying big data with no-sql (\[query-big.red](https://github.com/toomasv/table-template/blob/main/query-big.red)):  
\[!\[query-big](https://toomasv.red/images/Table/query-big.gif)](https://toomasv.red/images/Table/query-big.gif)  
CSV files are from \[World Development Indicators](https://datatopics.worldbank.org/world-development-indicators/).

GiuseppeChillemi

[09:04](#msg628759904aa6c31dca0f0df7)Big Toomas

greggirwin

[19:15](#msg6287e8ddda83520ac33e9c38)WOW! WOW! WOW! Fantastic @toomasv !

For those interested, that's a 200M CSV file with ~400K rows.

toomasv

[19:51](#msg6287f126db6f627d2590eece)Thanks, @greggirwin , yes, it is. And I was pleasantly surprised with the performance of `parse` :)

GalenIvanov

[19:54](#msg6287f1e0c9382316a614b0be):+1:

mikeyaunish

[20:06](#msg6287f4b309eea00adea469bd)@toomasv Amazing work your doing there. Most small (even medium) businesses would easily fit within this size of data.

GiuseppeChillemi

[20:06](#msg6287f4c6db6f627d2590f745)@toomasv RED-ODBC is capable of returning a "window" with a numbered set of ROW from the whole result set. If you have created a page loading mechanism, I think it could be used to sync table rows fetching with any DB like interface which has pagination.

[20:07](#msg6287f4ed09eea00adea46a23)@gurzgri What you think about this?

greggirwin

[20:44](#msg6287fdbb4e38f759e27dae57)@toomasv if I open %WDISeries.csv I get this error:

```
*** Script Error: length? does not allow error! for its series argument
*** Where: length?
*** Near : data total/x: length? first data if face 
*** Stack: view do-events do-actor do-safe open-big-table open-red-table init-grid
```

Didn't edit the default query at all.

[20:48](#msg6287fe984aa6c31dca10608d)Really, \*really* nice @toomasv. Is `loaded` the amount of data displayed relative to the total dataset size?

[20:49](#msg6287fec54e38f759e27db065)The larger files take about 1s to query here. e.g. the 8K and 12K row results, or the 200M file. The others are instant.

[21:04](#msg6288027409eea00adea48837)For any lurkers comparing these results to massive cloud DBs and such, bear in mind that this is all done with brute force here. No indexes, no prebuilt queries, etc. What this means is that it is completely unencumbered and dynamic. Effectively real-time for this type and amount of data.

GiuseppeChillemi

[21:09](#msg62880382da83520ac33ecfb5)@greggirwin Do you know Humble Bundle? I am a strong donator. Well, it hangs for minutes trying to display my purchases. The support has sent me an excuse email after my complain: "It's a know problem for lists over 1000 items". 🤦🏻‍♂️

[21:10](#msg628803cf4e38f759e27dbac9)Go Red Go! I am strongly waiting for it to use it in the modern world and let everyone see how it is powerful!

## Saturday 21st May, 2022

toomasv

[03:31](#msg62885cf4c61b987d33bc27d5)@greggirwin Yeah, noted, thanks! It was just quick and dirty POC. `loaded` shows how far the opened chunk reaches into the whole. Significant only for bigger files of course. If files are opened (from text-list), then it reads 1000'000 bytes and cuts on last newline. Query results are expected to fit into memory, but I should actually check the size and decide then how to open it - as normal or large.

[14:24](#msg6288f631da330517ff88dae1)@GalenIvanov @mikeyaunish Thanks!

## Sunday 22nd May, 2022

gurzgri

[18:58](#msg628a87d74e38f759e2825e7b)@toomasv Really great stuff!  
@GiuseppeChillemi From a quick glimpse, it's not possible with the `prev-chunk`, `next-chunk` actors, because they seem to be a bit opinionated on how to retrieve the prev/next chunk and implement the retrieval by themself instead of executing configured handlers. But I'm really not judging or questioning the design here, I'd rather wait for more docs to see what is possible.

GiuseppeChillemi

[22:30](#msg628ab990deea5616bbbecdec)Yes, let's see when Toomas will end this first phase of the table style development, I suppose it would be easy to create a more general handler. I have mentioned you because both of your projects implement the same datatype (block of blocks) and paged data. So, it has been natural to see a conjunction point. It seems very natural.

[23:15](#msg628ac3f7c61b987d33c08e8f)Also @rebolek could have some opinion about tho topic, because his experience.

## Monday 23th May, 2022

toomasv

[03:22](#msg628afdffc9382316a61a5470)Thanks, @gurzgri ! Sure, chunking is not meant for paging, just to load digestable chunks of files which cannot be loaded as whole.

[14:32](#msg628b9af567db9a59dbe30ada)Messing with \[ODBC](https://github.com/toomasv/table-template/blob/main/try-odbc.red). Got it working, but I don't know yet how to deal with "deferred" columns. And it tends to die at times. I'm not yet sure why. Didn't try pageing yet.  
\[!\[odbc](https://toomasv.red/images/Table/odbc.gif)](https://toomasv.red/images/Table/odbc.gif)

GiuseppeChillemi

[14:59](#msg628ba16806a77e1e184e945b)Toomas, thank you for always giving shape to my thoughts. You have created a tool that could be used to view any ODBC DB. Together with @gurzgri work, a new era is opening for all of us

[15:03](#msg628ba22f4aa6c31dca174528)@henrikmk @dobeash Have you seen this?

toomasv

[15:17](#msg628ba59cef00bd1dc6f5ea09):+1:

GiuseppeChillemi

[15:30](#msg628ba8a9c61b987d33c25a47)About deferred columns, they are for "BLOB columns", they are VARBINARY data you can READ using `PICK`. They could be XML, Images and anything which can be saved up to 2GB. Actually RED ODBC is capable of reading but not writing them.

[15:32](#msg628ba8f5e393a318061fa9f2)If you can track down when it dies, @gurzgri is always open to debug his code.

[15:42](#msg628bab62e393a318061fb0c3)Here is the chat line where BLOB column implementation has been announced. https://gitter.im/red/database?at=624e1a5899d94f5f0c88ef53  
Just following it you will find some more info like `pick STATEMENT 'columnname` (or "columnname" in case of incompatible names) to read the data

toomasv

[15:43](#msg628babafc9382316a61bcbe1)Thanks, Giuseppe!

GiuseppeChillemi

[15:44](#msg628babc7da83520ac345cc62)You are welcome.

## Tuesday 24th May, 2022

greggirwin

[16:03](#msg628d01e34e38f759e2874564)It's exciting to see these two projects working together. :+1:

## Thursday 26th May, 2022

toomasv

[20:05](#msg628fdd8409eea00adeb3ccca)I restructured the odbc&lt;-&gt;table \[playground](https://github.com/toomasv/table-template/blob/main/try-odbc.red), and aded \[sqlite](http://www.ch-werner.de/sqliteodbc/) and `text` odbc drivers to the bunch:  
\[!\[odbc2](https://toomasv.red/images/Table/odbc2.gif)](https://toomasv.red/images/Table/odbc2.gif)

But.. with `sqlite` crashes are back. Unfortunately I couldn't catch the error messages, as debugging sessions also crashed. Also need to add `scheme.ini` for text/csv driver.  
Then will try writing changes back to data sources.

GiuseppeChillemi

[20:12](#msg628fdf1309eea00adeb3cf7f)I like what is happening. Every data we may randomly generate, is not enough randomized as real world sceneries. This is making the whole system more robust and crash resistent.

gurzgri

[20:22](#msg628fe18bef00bd1dc6fe5b15)The crash I see again with this is another `access violation`, again when `fire`ing an error. I wonder if I somehow might corrupt the stack somewhere ...

## Friday 27th May, 2022

planetsizecpu

[13:59](#msg6290d92d67db9a59dbeda113)Good job @toomasv looks very professional, push hard!

toomasv

[14:30](#msg6290e09a7df86c141ea6f563)Thanks, @planetsizecpu !

## Saturday 28th May, 2022

toomasv

[16:42](#msg629250f906a77e1e185bf757)First steps towards more spreadsheet-like funtionality:  
\[!\[sheet-funcs](https://toomasv.red/images/Table/sheet-funcs.gif)](https://toomasv.red/images/Table/sheet-funcs.gif)

greggirwin

[16:56](#msg6292543ff8daa71e07a0d4d3)@toomasv :+1:

GiuseppeChillemi

[17:51](#msg6292612067db9a59dbf09f9c)Microsoft will hire Toomas to develop the new version of Excel.

[17:59](#msg629262f4e393a318062d21a6)Toomas, could I ask for columns and rows dragging to another position?

GalenIvanov

[18:02](#msg629263cdda330517ff9b6e26)@toomasv Great!

toomasv

[18:34](#msg62926b1906a77e1e185c289c)Thanks!  
@GiuseppeChillemi Like this?  
\[!\[sheet-reorder](https://toomasv.red/images/Table/sheet-reorder.gif)](https://toomasv.red/images/Table/sheet-reorder.gif)

greggirwin

[18:51](#msg62926f4309eea00adeb8e421)Wowza!

GiuseppeChillemi

[19:10](#msg629273a5c61b987d33cfe26d)Fantastic, it needs just a visible line view where you are moving.

toomasv

[19:13](#msg62927455c9382316a6295ffe)Yes, it needs beautification.. or affordances as Gregg taught me. I didn't even know the word :thought\_balloon:

hiiamboris

[19:24](#msg629276ddef00bd1dc60383fb)it's either dragging or easy selection though, not both

toomasv

[19:25](#msg62927740da83520ac35357c9)It is not seen here but dragging is with `ctrl` down. Selection is simple `over` with `down`.

hiiamboris

[19:26](#msg62927756deea5616bbce23f8):+1:

toomasv

[19:28](#msg629277e6ef00bd1dc6038774)Also, dragging row/col is simple index manipulation, dragging selection (or single cell) is moving data itself.

greggirwin

[19:43](#msg62927b4ce393a318062d4de4)An idiomatic approach is that frozen cells/headers allow you to drag rows/cols, anything else is selection by default. Option keys can override though.

## Sunday 29th May, 2022

GiuseppeChillemi

[01:43](#msg6292cfc0e393a318062de69b)Yes, LONG clicking on frozen headers let you DRAG, while clicking on a cell let you select. CTRL + click, let you freely multiselect headers, shift + click let you select a starting and ending headers plus everything in the middle.

## Thursday 2nd June, 2022

TimeSlip

[00:59](#msg62980b60deea5616bbd8edb3)@toomasv I've been away for several months due to work and life and so coming back to see your table code was exhilarating. Well done and thank you.

ldci

[06:28](#msg629858954aa6c31dca3049bf)Have a look here: https://lock.cmpxchg8b.com/linux123.html

toomasv

[15:39](#msg6298d9954e38f759e29e733b)@TimeSlip Thank you! I am away for a week, so there will be a gap in reports.

greggirwin

[16:52](#msg6298eac6da83520ac35ff675)Fun stuff @ldci. :^)

## Monday 6th June, 2022

ldci

[19:27](#msg629e5531c61b987d33e6b789)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/LDXd/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/LDXd/image.png)

[19:29](#msg629e5598deea5616bbe4e70b)Rebol3 and Red are really fantastic : a simple way to implement Gabor filters in less od 100 loc. Thanks guys:)

[19:29](#msg629e55b4c9382316a64029d4)To be included in redCV ASAP

[19:31](#msg629e5627da330517ffb2a82b)Oups in less tan 100 loc :)

[19:37](#msg629e5786c61b987d33e6bc36)oups 2 than

greggirwin

[21:25](#msg629e70e4f8daa71e07b826c1):+1:

## Tuesday 7th June, 2022

ldci

[03:54](#msg629ecbe9c9382316a64106f4)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/MOHt/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/MOHt/image.png)

[03:54](#msg629ecbfac9382316a6410716)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/dJt2/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/dJt2/image.png)

[03:55](#msg629ecc18c9382316a641078c)Gabor filters generation with Red :)

greggirwin

[03:59](#msg629ecd05deea5616bbe5c7d7)Nice!

ldci

[04:01](#msg629ecdac09eea00aded0da3b)@greggirwin Thanks, but I really need a 64-bit Red version now :)

toomasv

[05:33](#msg629ee33dc9382316a641310c)@ldci Really nice!

planetsizecpu

[06:28](#msg629ef01ada330517ffb3be92)Well done @ldci

GalenIvanov

[06:39](#msg629ef2b47df86c141ec1fe88)Very cool, @ldci !

ldci

[07:32](#msg629eff234aa6c31dca3cde57)@toomasv @planetsizecpu @GalenIvanov Thanks. Gabor functions are very useful to simulate cells activity in the visual cortex. The idea now is to integrate such as filter in neural networks for faster object detection :)

## Friday 10th June, 2022

ldci

[02:10](#msg62a2a820e393a318064caa17)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/vosD/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/vosD/image.png)

[02:10](#msg62a2a82fc9382316a648c92f)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/GnD0/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/GnD0/image.png)

[02:11](#msg62a2a84cc9382316a648c976)Gabor filter on image is now implemented:)

toomasv

[03:07](#msg62a2b57cda83520ac372c2d5):+1:

ldci

[03:28](#msg62a2ba4cdb6f627d25c52eac)@toomasv Thanks :)

rebolek

[07:25](#msg62a2f1ff06a77e1e187c53c0)How can I get size of a pane?

[07:39](#msg62a2f52d06a77e1e187c5a74)nevermind, I found a solution

[07:54](#msg62a2f8b0ef00bd1dc6239748)btw, `help layout` doesn't work.

toomasv

[10:20](#msg62a31adcda83520ac37386db)Using aggregation with odbc:  
\[!\[odbc-aggregate](https://toomasv.red/images/Table/odbc-aggregate.gif)](https://toomasv.red/images/Table/odbc-aggregate.gif)

GiuseppeChillemi

[10:23](#msg62a31bb5da330517ffbc21ed)Toomas from Excel.

greggirwin

[18:28](#msg62a38d50da330517ffbd1696)&gt; btw, help layout doesn't work.

Thanks @rebolek. I'll take a look.

[18:30](#msg62a38dc37df86c141ecb3f25)@toomasv FANTASTIC!

toomasv

[19:26](#msg62a39ad806a77e1e187daa18):smile:

greggirwin

[19:36](#msg62a39d577df86c141ecb5ea6)I can't tell you how excited I am about the `table` stylem the DB work from @gurzgri, and seeing them put together.

GiuseppeChillemi

[20:14](#msg62a3a629deea5616bbef850a)@greggirwin I can see you and me dancing here from minute 1:07

[20:14](#msg62a3a62d06a77e1e187dc1b5)https://youtu.be/Yz6hTuK9yBo

[20:18](#msg62a3a72af8daa71e07c2a128)(but don't skip the first time you look at it as it is a nice video made using this old song)

greggirwin

[20:52](#msg62a3aef9da330517ffbd5d86)Agreed. :^)

[20:52](#msg62a3af10da83520ac374c12a)I am definitely Anthony Michael Hall.

## Saturday 11st June, 2022

ldci

[04:47](#msg62a41e7bdeea5616bbf066ce)redCV including Gabor filters and documentation is updated: https://github.com/ldci/redCV

greggirwin

[06:12](#msg62a43254ef00bd1dc6260fc8)Thanks @ldci!

## Monday 13th June, 2022

ldci

[08:14](#msg62a6f1e24aa6c31dca4c6031)With Rebol 3 and color :)

[08:51](#msg62a6fa8bdb6f627d25cd47f4)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/LXFq/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/LXFq/image.png)

## Thursday 16th June, 2022

ALANVF

[22:31](#msg62abaf27904f20479a07d005)after some conversation in red/help, I've drafted some ideas and thoughts about View that I'd like to share (and maybe get some feedback on)

[22:31](#msg62abaf2b3bbb3848897efc1e)\[view-ideas.txt](https://files.gitter.im/55b1d8290fc9f982beaacceb/RrLG/view-ideas.txt)

[22:31](#msg62abaf5f22c53438bca48ca0)(not sure which channel this should go in, but this seemed like the best option)

[23:02](#msg62abb66e8fe56a38b59ccefb)hmm that "button focus" thing actually seems to be a bug with nested windows, so ignore that

## Friday 17th June, 2022

hiiamboris

[08:30](#msg62ac3bacab6b634f734a1bcd)&gt; `menu` option should be configureable directly in VID via `menu [ ... ]`

Agreed. In spaces that's how it works.

&gt; should be possible to directly inline expressions/values in VID rules without `compose`, using parens or something similar

Also how it works in Spaces. This is tricky though, as requires a trigger, like `data`. VID can only extend the set of triggers, but it can't magically know if next token is a keyword or expression, so this notion is limited.

&gt; ability to refer to the current window at all times

You have it: `view window: layout [button "Show me" [? window]]`

&gt; there should be an option to make a widget (reactively) fit the bounds of its parent, so when the parent is resized, it is also resized

What I aim to achieve in Spaces is that resizing should always work automatically out of the box with zero effort. Kludge for VID: https://gitlab.com/hiiamboris/red-elastic-ui

&gt; ability to set minimum/maximum size for windows/widgets

Agreed. I also introduced this. But this can only be a part of the resizing system.

&gt; "message box" widget, or helper widget

Could be useful, just nobody designed it. VID makes it easy for anyone anyway.

&gt; color picker widget (unless this can't be done natively?)

I think @toomasv has one.

&gt; "grid"-based positioning system

VID has it: `view compose/only [panel 3 (probe map-each x "ABC" [map-each y 3 [reduce ['text rejoin [x y]]]])]`  
!\[](https://i.gyazo.com/ef54caaddd4014cd19090b6890f0598f.png)

Spaces have an infinite more powerful grid. I don't think native VID ever will though, as there's no such OS widget.

&gt; Alt-shortcuts and keyboard shorcuts should be configurable for menu options

And they should be right in the menu block! But this needs design. E.g. how to denote shortcuts (datatype, DSL), and where to insert the keyboard hook.

&gt; should be able to configure a menu option as disabled

Agreed.

&gt; menu options should allow for inline code (rather than just an ID)

Discussed this in /help.

&gt; ability to have a button selected/highlighted by default

You have it: https://w.red-lang.org/en/vid/#focus

&gt; filtering input should be possible (using Parse and/or charsets, or something similar)

Agreed, but again needs design and ties with the (missing so far) part of the formatting work - input validation. It's tougher than it seems at first. But for simple cases you can abuse `on-key`.

&gt; escape key should deselect all text

I think it's up to OS, not us. ESC is a nonstandard behavior.

&gt; should be able to manually send special events like undo/redo, copy/paste, etc

Agreed. In Spaces I added an `edit` DSL that has commands like `undo` and `redo`.

&gt; should also be possible to override them

Here I'd like you to elaborate the use case.

&gt; (text widgets) should support rich text at some point, somehow

Spaces will have this eventually, but I'm not there yet. I don't think there's a native control for it. Do you have an example code in Tk that proves me wrong? I can't make much sense of the info by the link you mentioned.

&gt; should be able to change cursor position

Yes. Very annoying limitation.

&gt; should be able to customize cursor

Disagree here. You only do this in fully featured editors, not in input fields.

&gt; revisit Ctrl+(key) events, as `Ctrl+S` registers the key as #"^S" rather than #"s" or #"S" (with ctrl?: true)

It's `#"^S"` in `on-key` but `#"s" + ctrl?` in `on-key-down/up`. This is how OSes work. Not our doing. `on-key` gives you a composed character, not the key itself.

&gt; some keys like delete and escape should also return `word!`s rather than #"^H" and #"^["

Agreed.

&gt; setting the value of a widget should be reactive. for example, `my-area/text: ""` does not replace the text of the widget

You must have a bug somewhere. Show the minimal code.

greggirwin

[15:37](#msg62ac9fd076cd751a2f430fea)Thanks for your thoughts @ALANVF, and for your feedback @hiiamboris.

@toomasv does have some color pickers. Let me find my requester experiment.

[15:38](#msg62ac9fe6568c2c30d3d0e398)https://gist.github.com/greggirwin/9cd640ca42bdfd56c5ff4432c4765d2c

[17:46](#msg62acbe099f73251a2c5bba7c)We've talked in the past about R2's `list` style, which was great but had some limitations. @toomasv has a working and quite advanced `table` style now, and @GalenIvanov is going to coordinate with him and R&amp;D a `tree` style. I think there's still value in `list`, which offers rich layout for "rows", and an associated style would be an `accordian`, that is, sections that expand and collapse, like a tree, but with richer content/sub-layouts. Not sure where a code-folding editor falls in this, but that's basically a data tree. @henrikmk and @rgchris have both done some great UI style work in the past, so I hope we can get some good thoughts and momentum going in this area.

henrikmk

[18:06](#msg62acc2b20a52264798512222)I've recently taken to building a few applications in pure R2 VID, where I'm using LIST heavily. One note is that the SUPPLY method automatically makes it easy to window quickly through infinitely sized lists. I don't have to consider updating the list at all, and I use a picker function inside SUPPLY to get the data needed and a render function to render the cell output correctly. The iterated face method drives the rendering fully. Where LIST is weak is handling multi-selection.

greggirwin

[18:08](#msg62acc3198fe56a38b59ee42c)It also has issues when you \*do* need to update data, IIRC.

Thanks for weighing in.

[18:11](#msg62acc3b69f29d42bed815f0e)I also think the `list` style is an exact fit for what happens in a lot of mobile apps.

[18:12](#msg62acc4229f73251a2c5bc645)Another issue, which I don't have an answer in my head for, is that the rows are equally sized. Consider one of the most common "lists" in use: chat. If we can nail that use case, there's a lot of leverage there.

henrikmk

[18:37](#msg62acc9eb0a52264798513351)Does Red support an iterated face method, and if so, can it be customized?

greggirwin

[19:20](#msg62acd3f576cd751a2f437b03)It does not, at this time, but should be doable at the mezz level. All R2 styles are.

GiuseppeChillemi

[20:14](#msg62ace09c22c53438bca6f254)Lists with different row height let you handle chats easily. I have a couple more interesting uses like displaying tables content with carriage return/lf in it.

greggirwin

[20:22](#msg62ace294ab6b634f734b780b)For me, Telegram is a reference standard in this regard.

[20:27](#msg62ace3c4ef5ee44882b256d9)AltMe did a great job for its time as well.

GiuseppeChillemi

[20:30](#msg62ace47576cd751a2f439d3c)Agree

greggirwin

[20:32](#msg62ace4d31227f62be3a41e08)AltMe surely used something like `list` and faces internally. We can scale up as we R&amp;D. Start with fixed height rows, then let heights vary, and see how it might all be done with `draw`, like Toomas' `table`. Lots of playing we can do quickly. A key aspect is that editing doesn't have to happen in the list. An edit window comes up for that. It does need some interaction though.

GiuseppeChillemi

[20:32](#msg62ace4db76cd751a2f439e2c)I didn't know a tree widget was under development. Also I have seen you have pushed for file dropping support. All are great news

greggirwin

[20:33](#msg62ace5249f73251a2c5c08a8)`Tree` is just being evaluated now.

[20:35](#msg62ace588568c2c30d3d1706f)Another thought here is that infinite lists are hip and trendy, but that doesn't mean they're best. e.g. I have to scroll for days to find old messages by date in Telegram. Unless there's a feature I don't know about. Being able to filter data is powerful, and allows us to load all data that is less than "everything from forever".

[20:36](#msg62ace5c476cd751a2f439fad)Even AltMe's simple `before/after` date filtering beats modern chat apps.

GiuseppeChillemi

[20:36](#msg62ace5d29f29d42bed81a736)Another important piece. Red foundation is block and it is Hierarchical data.

## Saturday 18th June, 2022

luce80

[08:52](#msg62ad9254ef5ee44882b3975f)@henrikmk I tried back in 2017 without success and lost interest. The only thing that worked is this "not-automatic" ;) version

```
view [
	button "Add image" [
		i1: to-image canvas
		i2: to-image field-img
		canvas/draw/1: 'image
		canvas/draw/2: i1
		canvas/draw/4: i1/size
		canvas/draw/5: 'image
		canvas/draw/6: i2
		canvas/draw/7: off: off + (i2/size * 0x1)
		canvas/draw/8: off + i2/size
	]
	field-img: field "abcd"
		return
	canvas: base 300x200 white draw [line 0x0 0x0 0x0 line 0x0 0x0 0x0]

	do [off: field-img/size * 0x-1]
]
```

I was able to implement it \[here](http://www.rebol.org/view-script.r?script=vid1r3.r3) at line 1034 so should be doable. If you are interested in a more "automatic" but not working version let me know.

ldci

[15:45](#msg62adf31722c53438bca8f0d8)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/bvBg/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/bvBg/image.png)

[15:46](#msg62adf34ad3c8894f718f05b2)A color wheel for Rebol, Red and redCV

hiiamboris

[16:35](#msg62adfed59f29d42bed83badc):+1:

[16:35](#msg62adfedcd3c8894f718f1ea1)Source?

ldci

[16:40](#msg62adfff1ab6b634f734d86a7)@hiiamboris Yes of course

```
#!/usr/local/bin/red
Red [ 
	Needs: view
] 


hsb2Rgb: function [
	hue		[float!]	;--hue [0..1]
	sat 	[float!]	;--saturation [0..1]
	bri		[float!] 	;--brightness [0..1]
	return: [tuple!]
][
	color: make tuple! reduce [255 255 255]
	u: to-integer bri * 255 + 0.5
	if sat = 0.0 [color/1: color/2: color/3: u]
	hf: (hue - round/floor hue) * 6 ;--6 quadrants
	h: to-integer hf
	f: hf - round/floor hf
	p: to-integer (bri * (1 - sat) * 255 + 0.5)
	q: to-integer (bri * (1 - (sat * f)) * 255 + 0.5)
	t: to-integer (bri * (1 - (sat * (1 - f))) * 255 + 0.5)
	switch h [
		0 [color/1: u color/2: t color/3: p]
		1 [color/1: q color/2: u color/3: p]
		2 [color/1: p color/2: u color/3: t]
		3 [color/1: p color/2: q color/3: u]
		4 [color/1: t color/2: p color/3: u]
		5 [color/1: u color/2: p color/3: q]
	]
	color
]


colorWheel: function [
	radius	[integer!]
	return: [image!]
][
	tau: pi * 2.0
	imsize: as-pair radius * 2 radius * 2
	imsize: imsize + 40
	im: make image! imsize
	cy: to-integer imsize/y / 2
	cx: to-integer imsize/x / 2
	y: 0 
	while [y < imsize/y] [
		x: 0
		dy: to-float (y - cy)
		while [x < imsize/x][
			dx: to-float (x - cx)
			distance: sqrt ((dx * dx) + (dy * dy))
			if distance <= radius [
				theta: atan2 dy dx
				hue: theta + pi / tau
				idx: to-integer (y * imsize/x) + x + 1 ;--Red and Rebol are zero-based
				im/:idx: hsb2Rgb hue 1.0 1.0
			]
			x: x + 1
		]
		y: y + 1
	]
	im
]

acolor: black

drawCross: 	compose [line-width 1 
			pen (acolor) line 0x10 6x10 
			pen off pen (acolor) line 14x10 20x10
			pen (acolor) line 10x0 10x6 
			pen off pen (acolor) line 10x14 10x20
			line-width 2 box 0x0 20x20]


img: colorWheel 100

win: layout [
	title "Color Wheel"
	pad 195x0 button "Quit" [Quit]
	return
	canvas: base 256x256 img
	return
	f1: field 256
	at canvas/offset + 5x5 p2: base 0.0.0.254 22x22 loose draw drawCross
	on-drag [
		posct: p2/offset - canvas/offset + 11
		if all [posct/x >= 0 posct/y >= 0 posct/x <= 256 posct/y <= 256][
			clear f1/text
			color: pick img posct
			f1/text: rejoin ["Coordinates : " form posct " - Color : " color]
		]
	]
]

view win
```

[16:44](#msg62ae00e022c53438bca90cd8)@hiiamboris I’m sure that you could improve the code :)

hiiamboris

[16:53](#msg62ae0307d3c8894f718f26be)I was thinking, you don't really need hsl2rgb here, you could draw the image using radial gradient pen

[16:58](#msg62ae043d1227f62be3a6296c)\*hsv2rgb

greggirwin

[16:59](#msg62ae047a22c53438bca9139e)\*Really* lovely @ldci.

ldci

[17:15](#msg62ae0836d3c8894f718f3079)@greggirwin Thanks. @hiiamboris Gradients could be use, but are still unstable under macOS. This version with hsb2Rgb works fine for Red and Rebol3. Best regards

## Monday 20th June, 2022

ldci

[17:26](#msg62b0add13bbb3848898895a1)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/jJXN/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/jJXN/image.png)

[17:27](#msg62b0adf20a5226479858b0dc)Problems with diamond gradients

[17:28](#msg62b0ae411227f62be3ab2fcf)Here’s the code

```
Red [
	needs: view
]

win: layout [
	title "Gradients"
	text 200 "Linear"
	text 200 "Radial"
	text 125 "Diamond"
	button "Quit" [Quit]
	return
	
	base 200x200 draw [
		pen off 
		fill-pen linear 0x0 0 200  blue yellow
		box 0x0 200x200] 
	
	base 200x200 draw [
		pen off 
		fill-pen radial 100x100 0 100  blue yellow
		circle 100x100 90] 
	

	base 200x200 draw [
		pen off 
		fill-pen diamond 100x100 0 100 blue yellow
		box 0x0 200x200
	]
]

view win
```

hiiamboris

[17:54](#msg62b0b44bb408e830dc1e6608)you should report that :)

[17:54](#msg62b0b4691227f62be3ab3cf8)hmm it's the same on windows

[17:55](#msg62b0b49b3bbb38488988a4d1)can you run the gradient lab?

[17:57](#msg62b0b4ed8fe56a38b5a66c97)https://raw.githubusercontent.com/red/code/master/Scripts/gradient-lab.red found it

[17:57](#msg62b0b51c568c2c30d3d8b2cb)lol it's broken on windows too I think

[17:57](#msg62b0b52522c53438bcae4a7d)it was probably only working in GDI

[17:58](#msg62b0b5299f73251a2c634605)1.5 years ago

greggirwin

[18:18](#msg62b0ba029a314a3ec4ba5318)Looks like there's a glitch in the dropdown handler now as well, which is one step behind in updating the draw block code for people to copy.

## Thursday 23th June, 2022

dsunanda

[18:39](#msg62b4b3528fe56a38b5ae9aba)Why do we have to use `on-up` with `rich-text` fields? Only the first line here registerers a click:

```
unview/all view/no-wait [rich-text 200x200 data [red "please click me"] on-up [print  "Thanks"]] do-events
unview/all view/no-wait [rich-text 200x200 data [red "please click me"] [print  "Thanks"]] do-events
unview/all view/no-wait [rich-text 200x200 data [red "please click me"] on-click [print  "Thanks"]] do-events
```

gurzgri

[18:52](#msg62b4b6729f29d42bed911589)`rich-text`'s `default-actor` is `on-change`, not `on-click` as for e.g `button`. Doesn't explain why explicit `on-click` doesn't work though ...

[18:58](#msg62b4b7d39f29d42bed911ea2)Ah, `on-click` really is for \[button widgets only](https://github.com/red/docs/blob/master/en/view.adoc#111-event-names)

dsunanda

[20:16](#msg62b4ca380a5226479861828c)Thanks. It just seems strangely non-orthogonal. The first two both work for a `text` face. Odd that `rich-text` does do not have a default action .... only other one without a defaut action is `panel` - but there is a reason for that.

## Friday 24th June, 2022

GiuseppeChillemi

[16:06](#msg62b5e0ebfe909e3ec7edd031)@toomasv I have a question about table style. Is there a way to have returned the index of the row in the original data block when you click on it (and then close the table)?

toomasv

[19:17](#msg62b60dd18fe56a38b5b84305)@GiuseppeChillemi Like this?

```
view [on-up [r/text: form tb/actors/active/y] tb: table return r: text ""]
```

\[!\[clicked-row](https://toomasv.red/images/Table/clicked-row.gif)](https://toomasv.red/images/Table/clicked-row.gif)

[20:06](#msg62b61939904f20479a238b28)With sorted data, it's trickier. I have to work on it.

```
view [
    on-up [r/text: form tb/actors/get-data-row tb/actors/active/y] 
    tb: table data %./data/cities/worldcities.csv 
    return r: text ""
]
```

\[!\[clicked-row2](https://toomasv.red/images/Table/clicked-row2.gif)](https://toomasv.red/images/Table/clicked-row2.gif)

GiuseppeChillemi

[22:04](#msg62b6350b3bbb3848899b5b14)Thank you

[22:51](#msg62b63fdc76cd751a2f5e3cb1)I have not understood the logic of setting `on-up`  
I have this code which does not work, the console is not printed

```
[
    below center 
    Text "Table Tittle" text-size font [size: 20] 
    on-up [
        r/text: probe form tb/actors/active/y
    ] 
    tb: table 1000x600 data table-data options [
        config: [frozen-rows: [1] sizes: [x: [1 30 2 30 3 30 4 30 5 200 6 30 7 30 8 45 9 36 10 30 11 30 12 180 13 180 14 171]]]
    ] 
    return 
    r: text ""
]
```

[22:51](#msg62b6400fef5ee44882cce3fd)(note: `text-size` , `table-data`, are all defined in a context)

## Saturday 25th June, 2022

toomasv

[04:25](#msg62b68e3676cd751a2f605d47)Put `on-up` before `below`. It is window's actor and must be set before any other elements in layout, or separately in window's options. Idea is to use actors of table's wrapper element, i.e. window in this simplest case. If there are more elements in layout, then you have to wrap table into panel and use panel's actors. Actors of table itself cannot be used as they are already defined. (In principle they can be twisted by user to accommodate his needs of course.)

GiuseppeChillemi

[07:46](#msg62b6bd439a314a3ec4d10a51)I have isolated the table inside a panel and it works. Thanks!

toomasv

[07:46](#msg62b6bd72b408e830dc34e035):+1:

GiuseppeChillemi

[16:21](#msg62b7360e568c2c30d3f32e58)I renew the personal consideration I have made about 2 years ago about VID. It is magic and also draw and view are fantastic but to make even little things, like opening a window and having a return value, you must learn many difficult concepts like:

\* binding  
\* contexts  
\* multi-step binding  
\* face naming and searching  
\* operating with faces near your  
\* double linking  
\* composing  
\* the working of the `/only` refinement  
\* series  
\* the working of `/deep` refinement and `copy`  
\* parens in paths  
\* parens using `compose`  
\* stacking blocks using `append`  
\* actors  
\* `with`  
\* dialects  
\* styles  
\* reactivity  
\* processing steps of the view block and availability of the `face` object

It is not an easy task for newcomers to RED. (As it wasn't in REBOL). We need something simpler with a minimal learning step to not scare them. Hope some ideas will rise in the future from our minds.

greggirwin

[19:12](#msg62b75e033bbb384889a36ea9)One of the things I'd like to include in Red is a standard UI data exchange system.

GiuseppeChillemi

[19:13](#msg62b75e533bbb384889a370ed)What is a "data exchange system" for you in this scenario?

greggirwin

[19:21](#msg62b7601db408e830dc39435b)A way to map your in memory data to UI elements, `scatter` to display and `gather` to collect, but I don't love those old names.

GiuseppeChillemi

[19:24](#msg62b760e0568c2c30d3f46122)I have not gone deep on this topic, as I am currently working on another idea but it would be nice to `LINK face` or any value.

greggirwin

[19:26](#msg62b761771227f62be3c6850b)There's a reactive aspect, but I also think there is big potential in how we define the data that lets us enforce and automate many things. It's another way to leverage our rich type system and being a data format first.

[19:31](#msg62b76289ab6b634f736e8194)For example, in a DB stored procedure, you can enforce constraints, but how do you do that on a role-based system, and give the user quicker feedback? User Bob can set `max-agents` to `200` at most, but Admin Alice can set it to `5'000`. If those rules come down and the UI is built from them, based on who is getting the content, it can also build in a message telling Bob to contact Alice if he needs more agents. Can you do this with an error result from the DB, maybe, but if we can group things together, we leverage context and information locality for the analyst or dev.

GiuseppeChillemi

[19:32](#msg62b762d722c53438bcc9698e)In fact, we are a data format. When the Red Pill has made his effect I have started to see this and its big potential. I have accumulated some ideas since then and I will try to do my best to make those ideas a reality.

greggirwin

[19:32](#msg62b762e98fe56a38b5c1cf13)There is LowCode/NoCode today, and also Infrastructure as Code, but I haven't seen `LowCode Infrastructure as Code`. :^)

[19:33](#msg62b762f63bbb384889a3951d):+1:

GiuseppeChillemi

[19:37](#msg62b76417ef5ee44882d4fb63)My ERP has such a system. It has been written in Visual Fox Pro and it makes decent work. (Also VFP is source of inspiration for many things as it is very modulare and database oriented). Such ACS could be standardized as having ARexx-like functionality. The world of possibilities is there and awaits us to be forged.

## Sunday 26th June, 2022

meijeru

[18:02](#msg62b89f4fab6b634f73771fcb)I have a question: I have a text area on which I will allow selection by mouse, but no key inputs. I have a handle-key function defined as actor for on-key events, and it tests if the focus is on this area. If so, I ignore the key event. However, it turns out that the editing (insert, backspac, delete) is done by the system BEFORE the handle-key-event is transmitted? It does not help to make the area disabled, because then I cannnot select by mouse. What to do?

hiiamboris

[18:04](#msg62b89fb11227f62be3cf5bb7)try on-key-down

meijeru

[18:35](#msg62b8a6f89f29d42bedacf8e3)I suppose I should return 'done in order to dismiss the event, but it still does not work.

[18:38](#msg62b8a78c568c2c30d3fd6104)Also returning 'stop does not work.

greggirwin

[18:48](#msg62b8aa080a522647987cc386)That may be worth a ticket. What do you think @qtxie?

hiiamboris

[19:19](#msg62b8b1393bbb384889acedba)

```
system/view/capturing?: yes
view [field "abc" on-detect [if find form event/type "key" ['stop]]]
```

[19:22](#msg62b8b1dbef5ee44882de50df)(works on windows only)

meijeru

[19:33](#msg62b8b4709f73251a2c87a322)Great! It works, as I happen to be on Windows.

greggirwin

[19:51](#msg62b8b8df8fe56a38b5cb381d)Thanks @hiiamboris. :+1:

meijeru

[20:47](#msg62b8c5ed9f73251a2c881f61)Another question: how can I know programmatically the place of the cursor in a input field. I tried offset-to-caret using on-change, but the offset is not available (none).

hiiamboris

[20:57](#msg62b8c8219f73251a2c883093)no way currently

[20:57](#msg62b8c8293bbb384889ad93bd)(except using RS)

greggirwin

[20:57](#msg62b8c84e9f73251a2c883187)https://gist.github.com/toomasv/0085fd7c61e53dc9cedb45ae98f777e9

[20:58](#msg62b8c863d3c8894f71b9998b)Not sure it matches your needs, but it's the best example we have right now.

meijeru

[21:18](#msg62b8cd251227f62be3d0a337)Problem is it needs compilation, and I am in the first stages of a development, with many many iterations.

[21:18](#msg62b8cd3eb408e830dc43724a)I will enter a feature request.

greggirwin

[21:19](#msg62b8cd48b408e830dc4372f3)If you use dev mode, compilation should be fast.

[21:19](#msg62b8cd610a522647987dc526)After the first time of course.

hiiamboris

[21:37](#msg62b8d18e904f20479a36c88e)Compile that gist into the console

[21:38](#msg62b8d1cb568c2c30d3fe8822)Or I could add features you need into Spaces' field. But then you'll face another problem eventually: compiling it won't be a piece of cake

## Monday 27th June, 2022

meijeru

[11:19](#msg62b992341227f62be3d634f2)Thanks. I'll do a workaround for the moment, and file a proposal for enhancement.

hiiamboris

[11:25](#msg62b993c58fe56a38b5d141dd)https://github.com/red/red/issues/2422

[11:26](#msg62b993d79f73251a2c8ddcba)https://github.com/red/red/issues/3194

[11:26](#msg62b993e9904f20479a3c3c06)https://github.com/red/REP/issues/76

[11:53](#msg62b99a4a8fe56a38b5d177a4)https://github.com/red/REP/issues/5

[11:54](#msg62b99a5d3bbb384889b36c1c)take your pick ☻

## Tuesday 28th June, 2022

meijeru

[07:52](#msg62bab3589f29d42bedbbf3c1)I have made a suggestion in a comment to red/REP#5.

[07:53](#msg62bab3929f73251a2c95e171)It is simplicity itself: provide a pair! in /selected, with second coordinate 0.

hiiamboris

[08:18](#msg62bab93b22c53438bce159a6)that's how OS does it: selected = NxM, where M = caret position, N = selection start (= M if no selection obviously)

[08:18](#msg62bab9681227f62be3de4d55)but this underlying structure was fought against, because of convenience of none testing for selection

[16:36](#msg62bb2e26ef5ee44882f01d9d)!\[](https://i.gyazo.com/2cf05e56b7b3752f7260782bde79fcdb.gif)

toomasv

[16:51](#msg62bb3179ef5ee44882f0340c):+1: Although, at times the math seems ... , hm, probably it's just me, and the heat

hiiamboris

[16:54](#msg62bb322e1227f62be3e1c284)math is fine :)

[16:54](#msg62bb32349f73251a2c99866a)think offsets, not indexes

rebolek

[17:08](#msg62bb35a11227f62be3e1dae1)Exactly, offsets are zero-based, indexes are one-based. Zero-based indexing is nonsense, it's offsetting.

toomasv

[17:11](#msg62bb364676cd751a2f818cf0)It's not offsets, it 's heat, I repeat :)

hiiamboris

[17:24](#msg62bb3955fe909e3ec713caea)heat-induced algebra distortion ;)

rebolek

[17:33](#msg62bb3b58ef5ee44882f07f08)@toomasv I feel for you, the heat is unbearable here too.

toomasv

[17:58](#msg62bb4136ab6b634f7389d6cc):+1:

GiuseppeChillemi

[18:26](#msg62bb47eed3c8894f71cbfb9c)@rebolek @toomasv where do you live?

toomasv

[19:28](#msg62bb566afe909e3ec714a752)@GiuseppeChillemi Is nothing, compared to you, but please take into account that most of the time we live in snow (almost) :)

[19:28](#msg62bb566e568c2c30d310a93b)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/EWVX/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/EWVX/image.png)

GiuseppeChillemi

[20:02](#msg62bb5e6ed3c8894f71cca753)I can understand. Here, only a fan is saving me from melting. It's evening and I am above 40 degrees. The bed, the furniture, everything I touch is hot!

greggirwin

[20:08](#msg62bb5fba0a52264798902c3f)Yow! I thought it was bad at 35 during the day here.

Respectech

[20:13](#msg62bb60e99f73251a2c9ad20a)It's been over 38C here for a week - today is the first day it will be lower than that.

GiuseppeChillemi

[20:23](#msg62bb6328ab6b634f738ad1d9)I am happy I am actually living alone, no one would appreciate my nude look!

greggirwin

[20:23](#msg62bb634622c53438bce62af8):^)

## Wednesday 29th June, 2022

planetsizecpu

[08:15](#msg62bc0a340a5226479894e0c8)Here in the islands we suffer hot waves coming time to time from the Sahara desert, last weeks we had on of these with 38C, but now it's a pleasant 31C thanks to the atlantic storms, they save us for now.

GiuseppeChillemi

[14:02](#msg62bc5b8dfe909e3ec71c1773)Lets move to chit-chat, here we are off-topic until I connect a panel to my car and I need to display it...

toomasv

[15:41](#msg62bc72a69f29d42bedc894ea)I took table-template apart and put it together again so that now it is easier to manipulate virtual (i.e. active) rows and columns. As you remember `auto-index` used to add a auto-indexed column to table. This changed now into `auto-col`, and it got a partner `auto-row`. `auto-col` and `auto-row` themselves have index 0, e.g.:

```
view/flags [
   on-resizing [tb/size: face/size - 20 tb/actors/resize tb] 
   tb: table 317x167 data 10x20 focus 
      options [auto-row: #[true] auto-col: #[true]]
] 'resize
```

[15:41](#msg62bc72ab9a314a3ec4f9c589)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/zlBN/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/zlBN/image.png)

[15:43](#msg62bc732ffe909e3ec71cceef)Virtual rows and columns have negative indexes:

[15:43](#msg62bc733376cd751a2f8aba2f)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/YUMI/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/YUMI/image.png)

[15:49](#msg62bc747d9a314a3ec4f9d2ae)But this makes it cumbersome to enter formulas with row and column numbers, e.g. `R4C4` refers to cell with row header -1 and col header 2. So you'll have to just count the rows and headers. Not good. So I added an option `sheet` that turns row/column headers into plain index:

```
view/flags [
   on-resizing [tb/size: face/size - 20 tb/actors/resize tb] 
   tb: table 317x167 data 10x20 focus 
      options [sheet: #[true]]
] 'resize
```

[15:49](#msg62bc7480b408e830dc5dd4b0)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/y4V7/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/y4V7/image.png)

[15:53](#msg62bc756e904f20479a5104b7)`sheet: #[true]` will always add both row and column headers and these will always show plain visual index of given row and column, not their index in original or virtual data.

[15:54](#msg62bc75b09f73251a2ca2c6cf)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/ND6D/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/ND6D/image.png)

GiuseppeChillemi

[17:21](#msg62bc8a1a1227f62be3eb9fb0)I think it is a good solution. It is important that you can get a index to the original column/row asking something like `get-base-index`

[17:22](#msg62bc8a69b408e830dc5e7437)I dont' know if you want to mask the original data and give an accessor or let you poke to the original data and update the displayed one. Both are good solutions to me

[17:24](#msg62bc8acc9f73251a2ca35ab7)I have started to user RED to see some tables, insted of Rebol. I am now aboard thanks to having a way to select the row and get its index to the original data, as I can have full functionality.

[17:27](#msg62bc8b8476cd751a2f8b601c)There you can have 2 types of multiselection with or without an additional control key, at least this is what I had on Rebol

[17:29](#msg62bc8c0cb408e830dc5e8365)But we can wait, it is more important having full `write/copy/delete/modify` access that modifies the original data.

greggirwin

[17:45](#msg62bc8fc49f73251a2ca37be9)Nice update @toomasv. :+1:

toomasv

[19:04](#msg62bca24dfe909e3ec71e22e1)Thanks! The only drawback is that we can't display both indexes at once. But I'm not sure it is so bad either, because too much info would clutter the view. Sheet-view is better if you are into virtual/active sheet-like operations, otherwise default data-view is better for db-like viewing. I think.

GiuseppeChillemi

[19:58](#msg62bcaef03bbb384889ca0f61)I think so too. Other than numerical I would have letter based on as it is the default for excel, like `A B C.. A1 A2 A3... AA1 AA2 AA3`

[19:59](#msg62bcaf1f0a5226479899786f)* on = index

## Monday 4th July, 2022

toomasv

[05:08](#msg62c275e9ab6b634f73bcfe05)Added defaults to virtual rows/cols:  
\[!\[default-cols](https://toomasv.red/images/Table/default-col.gif)](https://toomasv.red/images/Table/default-col.gif)

greggirwin

[14:24](#msg62c2f8178fe56a38b51485fc)Very nice! :clap:

GiuseppeChillemi

[14:51](#msg62c2fe860a52264798c5d1e6)`probe reverse !gnizamA`

toomasv

[15:54](#msg62c30d4b9f73251a2cd19f68):)

ldci

[16:12](#msg62c31161ef5ee4488228902f)@toomasv Great!

toomasv

[16:36](#msg62c316f81227f62be31a4a1b)Thanks @ldci !

## Tuesday 5th July, 2022

Respectech

[18:12](#msg62c47f0176cd751a2fc3bee2)That is looking great!

## Wednesday 6th July, 2022

toomasv

[04:23](#msg62c50e3222c53438bc2bd92a)Thanks @Respectech !

planetsizecpu

[07:05](#msg62c5343676cd751a2fc8d20f)Looks very well, go @toomasv go!

toomasv

[09:38](#msg62c5580cb408e830dc9d08f2):)

## Sunday 10th July, 2022

cloutiy

[20:27](#msg62cb361d8fe56a38b54eb6fe)I have a field and a button. Below i have a group-box. When i click the button i want to append to the group box a field with the same contents, and a button to delete the field that was just added to the group. Im trying `append my-group-box [ copy my-field make button "delete"]` however append throws an error that it does not accept object. What is the secret?

hiiamboris

[20:30](#msg62cb36ccb408e830dcc6bf90)missing `/pane`?

[20:30](#msg62cb36e676cd751a2ff30eaf)https://w.red-lang.org/en/view/#the-face-tree

cloutiy

[21:02](#msg62cb3e750a52264798fff14e)Thanks @hiiamboris 👍

## Saturday 16th July, 2022

luce80

[17:30](#msg62d2f5cf9f73251a2c42a32c)How can I do the "action" block of a face from the "action" block of another face? and How can I bind a VID block that is defined outside a layout block so that it behaves as if it were defined inside ?

hiiamboris

[18:51](#msg62d308ba22c53438bc8fbb8f)'compose/deep/only'?

dsunanda

[21:50](#msg62d332b93bbb384889696c93)@luce80  
&gt; How can I do the "action" block of a face from the "action" block of another face?

Simplest way is to assign the face to a word, eg:

```
view/no-wait [
    b1: button "1" [print "button 1 action performed"]
        button "2" [do b1/actors/on-click b1 none]
]
```

## Sunday 17th July, 2022

luce80

[06:58](#msg62d3b3211227f62be390b958)@dsunanda Yes ! thanks.  
@hiiamboris ok I forgot it; but can it be done with `bind` ?

dsunanda

[12:05](#msg62d3fb01568c2c30d3c0318b)@luce80 Slightly more advanced technique that does not clutter the global name space, and also creates a handy map to all faces you need to later refer to:

Use ON-CREATE to populate an object with your important faces, eg:

```
MIF: make object! [start-button: none text-fields: copy []]   ;; My Important Faces
view/no-wait [
    button "Start" ON-CREATE [mif/start-button: face] [print "started"]
    text  "Text 1" ON-CREATE [append mif/text-fields face]
    text  "Text 2"  ;; not an important face
    text  "Text 3" ON-CREATE [append mif/text-fields face]
    button "Also start" [mif/start-button/actors/on-click mif/start-button none]
    ]
    
mif/start-button/text: "Begin"    ;; change button caption
foreach face mif/text-fields [face/color: pink]  ;; change color of all important text fields
```

I find this technique useful when creating complex windows. It makes keeping track much easier.

hiiamboris

[12:33](#msg62d401939f29d42bed70eb5c)@luce80 by binding to one face you'll unbind from another face

[12:34](#msg62d401e19f73251a2c49e8b2)Just compose your layout before `layout` is called (it will copy the blocks).

[12:35](#msg62d4020d904f20479af938c9)Alternatively, just use a function (not a block) for the event handler.

[12:37](#msg62d40286d3c8894f717c84e0)`style` is another way: `view [style b: button [probe face/text] b "text1" b "text2"]`

GiuseppeChillemi

[14:10](#msg62d4185522c53438bc97335a)@dsunanda and you do not pollute the `system/word`context.

gurzgri

[14:35](#msg62d41e2d904f20479afa02aa)@luce80  
&gt; How can I do the "action" block of a face from the "action" block of another face?

There's even the dedicated \[helper function](https://github.com/red/docs/blob/master/en/view.adoc#14-extra-functions) `do-actor` for this.

[14:59](#msg62d423edab6b634f733ad0c7)This avoids the repetition of &lt;face&gt; as in the previously mentioned `/actors/on-` (which btw doesn't require to be `do`ne explictly).

ldci

[17:21](#msg62d44523904f20479afb109a)Looking through my old files, I found this code written with Rebol 2. In the early 2000s, Rebol decoded animated gifs. This is no longer supported with R3 and Red. Too bad.

```
REBOL []

gif-anim: load %ping.gif
ni: to-integer (length? gif-anim) + 1

view layout [
    img: image (first gif-anim) with [
        rate: 5
        cnt: 0
        feel: make feel [
            engage: func [f a e][
            	if e/type == 'time [
                    cnt: cnt + 1
					if cnt = ni  [cnt: 1]
                    f/image: pick gif-anim cnt
                    show f
                ]
            ]
        ]
    ]
]
```

[17:22](#msg62d44541904f20479afb115a)

Oldes

[18:24](#msg62d453f6b408e830dc0802c0)Having something like `load` returning `image!` with one file and `block!` for another file is a bad design imho.

[18:27](#msg62d4547c904f20479afb7686)I think that `query` and `modify` should work with `image!`. The first should be able to give you information, if the image has more frames and the second should allow you to change the frame.

pekr

[19:05](#msg62d45d7b76cd751a2f34c4b0)I do remember writing gif anim in View in just few lines of code .... because, IIRC, load returned set of the images you could cycle over. If R3 / Red don't support that, that is not what I call a simplicity, not a rebollish ....

Oldes

[19:17](#msg62d460301227f62be3958599)In R2 days animated gif was used for animated emoticons but not for screen recordings.

hiiamboris

[19:17](#msg62d4605a1227f62be39586f3)also, losing frame rate is not a design at all

Oldes

[19:19](#msg62d460a49a314a3ec4a41cd0)Right.. anim gifs may have variadic framerates.

## Monday 18th July, 2022

ldci

[07:06](#msg62d506733bbb384889765ecd)Yes, duration for each frame is in extension sub-blocks of the gif file.

## Wednesday 20th July, 2022

ingvast

[19:06](#msg62d85224904f20479a17ef88)Hi  
I'm rewriting a rebol script to red:  
`view/no-wait` with a forever loop after that calls `wait` does not work. It seem like the `wait` does not let the graphics update as it does in rebol.  
What function can be called in the loop so that graphics gets updated?

gurzgri

[19:16](#msg62d8549e76cd751a2f50e18a)`do-events`? What are you doing in that loop?

ingvast

[19:20](#msg62d855608fe56a38b5aca635)`do-events` doesn't come back. I'm typically fetching values to put into the gui by calling other programs and parsing the result. So I do a `call`, `parse` and then wait 0.5

gurzgri

[19:21](#msg62d855ad22c53438bcb57224)`do-events/no-wait`?

greggirwin

[19:21](#msg62d855ae904f20479a1804de)@ingvast did you try `do-events/no-wait`?

ingvast

[19:23](#msg62d856271227f62be3b24c75)No, that would be an idea, but I do not need to call the functions that often. Having the loop run without wait does not seem right either. But maybe OK.

[19:23](#msg62d856419f73251a2c68b3bf)Thanks for the `do-events/no-wait` idea

greggirwin

[19:26](#msg62d856d29a314a3ec4c0a59f)Another approach is to use a timer on a face to trigger your tasks.

gurzgri

[19:26](#msg62d856f58fe56a38b5acaf43)Whatever you're doing in that loop, you may eventually do it in an `on-time` actor with `face/rate` in 0.5 sec intervals?

[19:27](#msg62d85711fe909e3ec7e2531e)Ah, Gregg beat me.

ingvast

[19:27](#msg62d8572c8fe56a38b5acb06f)That would be a good idea. Thanks @gurzgri and @greggirwin

greggirwin

[19:29](#msg62d85790ab6b634f73588894)You beat me the first time @gurzgri. :^)

## Monday 1st August, 2022

toomasv

[09:13](#msg62e7993872ad51741fb13142)Coming over from `help`-room  
@ldci Working from your earlier example there:

```
gif/decode %spiral.gif ; your %1.gif
im1: make image! reduce [gif/frames/1/size gif/frames/1/colors] ; changed gif/images -> gif/frames
view compose/deep [bb: base im1 rate 32 on-time [i: tick % 4 + 1 bb/image/rgb: gif/frames/:i/colors tick: tick + 1] do [tick: 0]]
```

ldci

[09:25](#msg62e79bf1458f823ce055f147)@toomasv Better implementation :)

toomasv

[09:31](#msg62e79d5dd020d223d30c692e)No `compose` needed thou.

luce80

[18:08](#msg62e8169672ad51741fb4bcb2)Is there a way to have `to-image` work before opening the window ? This makes a black image instead of a green one.

```
view [
	panel [origin 0x0
		at 0x0
	    canvas: base 300x190 green
	] on-created [
			save probe rejoin [%/C/Users/Public/canvas.png] to-image canvas
		]
]
```

hiiamboris

[18:11](#msg62e8175472ad51741fb4c2f7)no, as OS has to draw the widgets

[18:12](#msg62e817836837563d1cab24f2)what do you wanna do?

luce80

[18:27](#msg62e81b1f11a6a83d048b7926)I want to have a lot of "fake" widgets inside a face. They need to only exist as an image.

hiiamboris

[18:31](#msg62e81c1072ad51741fb4ed34)hmm, maybe save them once then load every time? unless they should change

[18:32](#msg62e81c339d3c186299d65438)why fake widgets at all?

pekr

[18:54](#msg62e8216d647d633cf6f67841)IIRC, R2 was about to allow gfx subsystem without the windowing. Making an image! and manipulating pixels should be possible without the GUI being displayed?

greggirwin

[22:13](#msg62e84ff06837563d1cacaa19)@pekr you can make images, but you can't make an image from a layout without it being rendered first. One trick is to render them off screen, so the user doesn't see it.

## Tuesday 2nd August, 2022

toomasv

[12:35](#msg62e919f411a6a83d0492e85b)Finally got rid of some nasty bugs. Now logic seems correct, time to start optimising:

```
do %GIF.red
gif/decode https://media.giphy.com/media/reJOGQ43nNeGk/giphy.gif
gif/view
```

\[!\[laugh](https://toomasv.red/images/Animations/laugh.gif)](https://toomasv.red/images/Animations/laugh.gif)

gurzgri

[12:43](#msg62e91bfcb16e8236e356a6ba)Now I can't help but think of Statler and Waldorf commenting on you doing a live-on-stage coding performance and them laughing at the nasty bugs you're making ... :laughing: You called for that with that GIF :wink: :innocent:

rebolek

[12:49](#msg62e91d4ad020d223d317acb0):D

toomasv

[13:27](#msg62e9262a11a6a83d049340ef):)

GalenIvanov

[14:30](#msg62e934f7d020d223d3185b91)Great @toomasv !

GiuseppeChillemi

[17:10](#msg62e95a8405ad4a3701cf662a)Great Work

luce80

[18:05](#msg62e96778443b7927a7f4e7d1)@greggirwin How can I render widgets off screen ?

greggirwin

[18:07](#msg62e967fa11a6a83d04953465)Put the whole window off screen. But it's one of those tricky things, because then \*you* can't see it, so you need to watch for it getting orphaned out there in the negative space.

gurzgri

[18:13](#msg62e9696672ad51741fbea83b)Was on mobile earlier today, only now had a chance to try it out. Really great work, @toomasv, as always!

luce80

[18:14](#msg62e9698e443b7927a7f4fa1f)So I still need to open the window, let layout and rendering take place, make the images and then placing the window where it should be...ok for a custom situation but not for a generic one. If rendering is fast enough it is not needed to hide the window, but I still need to open it before making the images...

greggirwin

[18:18](#msg62e96a5e6837563d1cb4b319)I don't know what custom vs generic means here, but this is a limitation of using native widgets. Otherwise you have to fake it all yourself.

luce80

[18:23](#msg62e96ba5458f823ce06364fc)@henrikmk are you reading this ? this was my 7th attempt at making iterated faces, but no luck this time too. Perhaps others will have a better idea.

henrikmk

[18:27](#msg62e96c81647d633cf6ffd2ef)@luce80 I'm reading you, but have not tried doing iterated faces in Red.

hiiamboris

[18:27](#msg62e96c98cf6cfd27af6bcb09)what \*exactly* are you trying to do, for the uninitiated?

luce80

[18:29](#msg62e96d0c7ccf6b6d45b63bcf)@henrikmk so perhaps you can success where I failed. @hiiamboris iterated faces as those seen in Rebol2 View.

hiiamboris

[18:31](#msg62e96d82647d633cf6ffdc9d)I have no idea about that

greggirwin

[18:33](#msg62e96de705ad4a3701cff0c4)It's the foundation of the `LIST` style in R2.

henrikmk

[18:34](#msg62e96e27cf6cfd27af6bd886)you can study the list style in R2 yes, but I don't know if Red's implementation is similar. you need a subface and a driver function in the PANE word.

greggirwin

[18:36](#msg62e96ec63a42316d33cede69)Red has no support for anything like that yet. Creation and destruction of native faces make it more involved.

hiiamboris

[18:50](#msg62e971df3a42316d33cef810)Ok it's what I thought. So how is it connected to `to-image face`?

[18:55](#msg62e9732e99949962934545bd)You know that images in Red are not recycled right?

qtxie

[22:03](#msg62e99f289994996293468222)Great Work @toomasv .

## Wednesday 3th August, 2022

toomasv

[04:27](#msg62e9f91ab16e8236e35cf345)@GalenIvanov @GiuseppeChillemi @gurzgri @qtxie Thanks!

planetsizecpu

[07:49](#msg62ea289605ad4a3701d526c0)Amazing @toomasv push hard

toomasv

[09:29](#msg62ea3fef72ad51741fc4fb21)@planetsizecpu Thanks!

## Saturday 6th August, 2022

GiuseppeChillemi

[14:06](#msg62ee757472ad51741fe33dc4)Does someone undestand why `AREA` is truncating the read page?

@rebolek I am now using your `codepage.red`script. Now I don't understan what is happening:

```
probe pg: read-cp read/binary https://agerborsamerci.it/listino/web.htm 'ISO-IEC-8859-1
	view [area  pg 600x400]
```

As you can see, the output of probe is far longer than the text in `AREA`

gurzgri

[15:52](#msg62ee8e2172ad51741fe3f691)

```
Red
>> while [pg: find/tail pg "Prezzi in"] [probe copy/part pg 10]
" ^@/t, pron"
" ^@/t, pron"
" ^@/t, pron"
replace/all pg: head pg "^@" "€"
```

The codepage obviously isn't a good fit for the € char in that page and `area` seems to stop at a null char.

GiuseppeChillemi

[15:53](#msg62ee8e8e11a6a83d04ba4be1)So this is a bug.

[15:54](#msg62ee8ea1cf6cfd27af912d74)Or I have used the wrong codepage?

gurzgri

[15:54](#msg62ee8ebcb16e8236e37e4b18)Well, the web page itself says it's encoded, I'd say.

[15:57](#msg62ee8f75f4d7a323ded870ea)So you should've used `pg: read-cp read/binary ... 'Windows-1252`, it's not bug in `codepage.red`.

GiuseppeChillemi

[16:20](#msg62ee94d005ad4a3701f4d4ab)It works, @rebolek should just say if truncation is an intended behaviour for `€` character

gurzgri

[16:29](#msg62ee96d53a42316d33f4060f)It's nothing special to `€`, it does that for all characters not defined in ISO-8859-1:

```
>> read-cp #{808182838485868788898A8B8C8D8E8F909192939495969798999A9B9C9D9E9F} 'ISO-8859-1
== "^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@"
>> read-cp #{808182838485868788898A8B8C8D8E8F909192939495969798999A9B9C9D9E9F} 'Windows-1252
== "€1‚ƒ„…†‡ˆ‰Š‹Œ1Ž11‘’“”•–—˜™š›œ1žŸ"
```

[16:31](#msg62ee9765cf6cfd27af916623)But there is a quirkyness in

```
>> >> read-cp #{818d8f909d} 'Windows-1252 ;== "11111"
```

That's not correct. These should be "^@"'s, too.

GiuseppeChillemi

[16:34](#msg62ee9826647d633cf624d861)I have supposed than an unsupported character would decode in a visually wrong way and not truncating the whole page but maybe it is intended.

gurzgri

[16:37](#msg62ee98cb443b7927a71a6014)Mapping undecodable chars to `^@` isn't bad in itself. It's just that Red uses native widgets and native widgets treat strings as null-terminated strings.

[16:38](#msg62ee98f36837563d1cd9fa17)`view [button "Null^@terminated"]`

GiuseppeChillemi

[16:42](#msg62ee99fe9d3c18629905506f)Thanks, I have understood

hiiamboris

[18:53](#msg62eeb8c3647d633cf625c535)&gt; `^@`

There is a `�` char (U+FFFD) in unicode, which "Replaces an invalid or unrecognizable character. Indicates a Unicode error."

gurzgri

[19:07](#msg62eebbe9aa09177429137265)Yes, I know. But `codepage.red` is written to explicitly return `#"^@"` in case of an unrecognized char. And that is what happend here, so by definition not a bug. The bug was in converting with the wrong codepage. That's what I was pointing out.

[19:26](#msg62eec04daa091774291394f6)

```
Red
>> to string! #{fffd}
*** Access Error: invalid UTF-8 encoding: #{FFFD6E00}
```

Hm, mixed feelings about that. Should be allowd, I think. And where is that #{6e} creeping in?

[19:43](#msg62eec4547ccf6b6d45dce2e7)→ https://github.com/red/red/issues/5172

hiiamboris

[19:57](#msg62eec7a63a42316d33f56e79)suspicious indeed

[19:57](#msg62eec7b205ad4a3701f63c93)thanks

gurzgri

[21:43](#msg62eee07f458f823ce08a9412)No, that was a dumb mistake. Codepoint `U+FFFD` is `#{efbfbd}` in UTF-8 and `to string! #{efbfbd} == "�"`. My bad.

hiiamboris

[21:46](#msg62eee1323a42316d33f631be)I don't have `6E` creeping in btw

[21:46](#msg62eee13705ad4a3701f6e68c)heisenbug?

gurzgri

[21:46](#msg62eee14c443b7927a71c77a1)Me neither with latest build.

GiuseppeChillemi

[21:47](#msg62eee188647d633cf626d837)So vast is the Red sea.

## Thursday 11st August, 2022

GiuseppeChillemi

[08:04](#msg62f4b7ff72ad51741f0ffd70)Position keeping is on of the most important aspects of a GUI System. When moving from the main window to a child one, and the back, you expect to find text/icons/lists/the cursor where you have left it. Changing their position, confuses the brain as it has to reseek for elements as it looses track of them or has to reposition everything as before. When you open an editor, it is fantastic to find the cursor where you have made the last edit; when you delete a line in a list, it is a breeze when you to not have to reseek for the deletion position; when you reopen a program, having the same windows and document is very helpful. This because the most of the time, you continue working on something than doing something new. (Obviously, there are exception to this rule)

[08:04](#msg62f4b80af4d7a323de0492bf)Why I write this?

[08:08](#msg62f4b9176837563d1c05afff)Because I have recently faced some very good apps, which have totally frustrated me to the point I have discarded them. One was a photo editor which depict filters groups as images. When you click onto one filter , then a windows with subfilters and the image open but when you closes it, the filter groups are shifted and you do not know anymore which was your starting group.

[08:11](#msg62f4b9acaa091774293e5edd)The same is happening using Facebook on mobile, when you unexpectedly find it has refreshed and restarted. Also Google keep forces me to reopen the last note and go to the bottom of it, because it does not save the last position.

[08:16](#msg62f4bace6837563d1c05bdf6)The whole world is moving toward maintaining the user working session accross sites, computer, devices. So if we want to have a gui system suitable for the modern world, having it capable of giving to the developer a way to get the last position and restart from it, is really important.

rebolek

[08:16](#msg62f4bacfd020d223d36b609b)@GiuseppeChillemi @gurzgri Maybe I can add an option to switch a character for unsupported chars.

hiiamboris

[08:23](#msg62f4bc77458f823ce0b43eba)@GiuseppeChillemi as long as we're living in an economy of absurdity, whole world is moving towards \[Brazil](https://www.imdb.com/title/tt0088846/). I've only seen the degradation of software during the years it exists, and corporations are at the forefront of the economy, so they take the biggest hit. Worst-UX products come from Google.

As for saving state, nobody is stopping you from doing it.

GiuseppeChillemi

[08:24](#msg62f4bcb405ad4a370120e1fb)@rebolek Boleslav, other than switching a character, it would be important to know the event of having an unsupported char has happened. This would help either having an error on conversion return (thank can be avoided with a `/safe` refinement) or a secondary `check` function.

[08:33](#msg62f4beddaa091774293e863d)@hiiamboris There are things, as a developer, that could not let you implement "position keeping". If in a text area you can't get the current cursor position and offset from the top and set it via code, you do not have the instruments to reposition the text. The same applies in lists and anything which has scrollable parts. @toomasv has kindly listened to this request on text-list and now we have code for text areas cursor too. Mine is a note for any further development. Please implement everywhere getting and setting elements via coordinates, from gui opening to any scrollable item as it is really important for usability.

hiiamboris

[08:36](#msg62f4bfa5d020d223d36b876b)That goes without saying. Mind the alpha stage.

GiuseppeChillemi

[08:40](#msg62f4c07c458f823ce0b457fe)Yes, I know you are good and skilled boys!

[08:43](#msg62f4c12ccf6cfd27afbd67e0)About corporations taking control of everything, also GUIs and Standards, to the point to be dictators, I have just read a \[message](https://github.com/github/markup/issues/1440#issuecomment-1211679532) from an user about having the colored text on github markdown which laments just this situation.

## Thursday 25th August, 2022

gchiu

[18:12](#msg6307bb9f11a6a83d046d9795)Can red cv do binarising on a colour image? I want to automate the measurements of capillary loops

[18:14](#msg6307bc1411a6a83d046d9a0f)@ldci is redcv still under development?

## Friday 26th August, 2022

ldci

[06:17](#msg63086578647d633cf6dc8d63)@gchiu Yes redCV is still in progressand you can use rcvThreshold function for binarisation :)

gchiu

[08:39](#msg630886bbaa09177429cbccbd)&gt; @gchiu Yes redCV is still in progressand you can use rcvThreshold function for binarisation :)

can you therefore do edge detection and pick out shapes?

ldci

[08:54](#msg63088a2c9d3c186299be7be6)@gchiu Yes, see redCV/samples/image\_detectors in documentation :)

hiiamboris

[10:34](#msg6308a1c2443b7927a7d347ca)Automatic ellipsization is now available for use in text spaces:  
!\[](https://codeberg.org/hiiamboris/media/raw/branch/master/spaces/demo-ellipsization.gif)

greggirwin

[18:44](#msg630914829d3c186299c24305)Nice @hiiamboris.

GiuseppeChillemi

[18:53](#msg630916c372ad51741fa15db8)@hiiamboris whatever will be the fate of your work, it is a great product.

[18:54](#msg630916df6837563d1c96918d)And I see it is allowing a lot of fixes

hiiamboris

[19:07](#msg630919ef647d633cf6e1aa6f)Thanks

## Saturday 27th August, 2022

luce80

[09:55](#msg6309ea2611a6a83d047d28a3)@hiiamboris Awesome. Not too distant from a multi-column text list and a tree-view for which we are impatiently waiting ;)

[09:56](#msg6309ea306837563d1c9c72c6)Can someone please provide an example of a not-too-simple-not-too-complicated VID custom style ? I'd like to see the use of `template` , `init` , `options` , `actors`combined with `on-create` and `on-created`

hiiamboris

[11:19](#msg6309fdb911a6a83d047db04c)&gt; multi-column text list

It's been available since Bolek's table style years ago :)  
Spaces support that and Toomas's table as well.

&gt; tree-view

Shouldn't be too complex to build upon spaces yourself. It's not top priority for me, have a few tasks before that.

[11:22](#msg6309fe58f4d7a323de9b6678)&gt; Can someone please provide an example of a not-too-simple-not-too-complicated VID custom style ? I'd like to see the use of `template` , `init` , `options` , `actors`combined with `on-create` and `on-created`

\[Scrollpanel](https://codeberg.org/hiiamboris/red-common/src/commit/a22e4c1d84c52a853a728e638c5dddc1d73f3f29/scrollpanel.red#L161) \[(docs)](https://codeberg.org/hiiamboris/red-common/src/branch/master/scrollpanel.md)

You shouldn't use actors in your custom style, or they will not be available to users (use global \[event functions](https://github.com/red/docs/blob/master/en/view.adoc#115-global-event-handlers) instead).

luce80

[18:00](#msg630a5ba711a6a83d04806341)If I have a custom style in whose `template` I set `options` they are delete and overwritten by user options, is it by design?:

```
system/view/VID/styles/ascroller: [
	default-actor: on-change
	template: [
		type: 'scroller
		size: 16x16

		options: [direction: -2]
	]
	init: []
]
view [
	scrl: ascroller options [a: 1 b: 2]
]
?? scrl/options 
; scrl/options: [a: 1 b: 2 style: ascroller vid-align: top at-offset: none]
```

How can I have default `options` ?

hiiamboris

[18:06](#msg630a5d0b05ad4a3701bb57d4)I'd try `init` and if that doesn't work then `on-create` from a global handler.

[18:07](#msg630a5d4b05ad4a3701bb5897)Facets are always overridden in `layout`.

[18:07](#msg630a5d7c3a42316d33ba9621)I tried to save at least `with` here https://github.com/red/REP/issues/74 ;)

[18:09](#msg630a5dbc458f823ce04e07d3)But it makes sense that they're generally not collecting. Maybe you don't want to collect, what then?

luce80

[18:17](#msg630a5fa3647d633cf6ea9f0f)No luck with `init` because it comes after user `options` have overwritten original `options`.  
&gt;But it makes sense that they're generally not collecting. Maybe you don't want to collect, what then?

Can you elaborate on this ?  
Can you give me an example of `on-create` from a global handler ?

hiiamboris

[18:19](#msg630a60243a42316d33baa61b)Have you read the View docs link I gave you?

luce80

[18:22](#msg630a60ceb16e8236e3453515)Sorry but I am not so smart perhaps. I can make a global handler but then ? Should I call do-actor or something ?

hiiamboris

[18:23](#msg630a612b9d3c186299cbb2cb)&gt; &gt; But it makes sense that they're generally not collecting. Maybe you don't want to collect, what then?

&gt; Can you elaborate on this ?

I mean e.g. you set `data` by default in your style to some `[a b c]` list. If it appended, not overridden, how would user remove that default data? It makes sense to override.

luce80

[18:29](#msg630a6284999499629331179e)We are not talking about overriding here. My original `options` values are totally destroyed. For me overridding means changing values of alreading existing keys, not deleting (or not °merging\*) already existing ones.

hiiamboris

[18:30](#msg630a62c4d020d223d305c607)That's because whole `options` facet gets overridden. Same as `data` or `text` would.

[18:31](#msg630a62fd443b7927a7dfb3ee)You can write instead of `options [new stuff]` - `with [append options [new stuff]]`, but that's a nuisance.

luce80

[18:35](#msg630a63dfcf6cfd27af57efcf)A nuisance ? Will \*\*you\** tell my users to write that in the docs ;) ?

hiiamboris

[18:35](#msg630a64039994996293312493)lol no, I'll pass ;)

luce80

[18:40](#msg630a6529458f823ce04e3b9f)Let's see if someone else thinks this is a \*strange* behavior.

## Monday 29th August, 2022

luce80

[17:21](#msg630cf59f647d633cf6f5df20)I think I have found a workaround. I have a "private" `object!` in my custom "public" style and in `init` I use `options` as a template for that object. Let's see if it works.

## Friday 2nd September, 2022

luce80

[18:37](#msg63124d5911a6a83d04968ab8)I am trying to make a custom style that will be "linked" to another style given by the user. I'd like to do some calculations before my style is `show`n but ther is not an `on-show` actor. How can I do it ?

hiiamboris

[18:43](#msg63124ed872ad51741fc0240a)it's best to do your calculations using reactivity

[18:43](#msg63124ee43a42316d33d06209)`show` may not do anything if it doesn't detect a change

dockimbel

[20:03](#msg6312618cb16e8236e35afc1f)@luce80 `on-created` actor is invoked, if defined by the user, just before the face is shown.

hiiamboris

[21:15](#msg6312727af4d7a323deb40913)He's making his own style, so I advised him to leave actors free of occupation, or style users won't be able to use them.

## Saturday 3th September, 2022

luce80

[14:13](#msg631360f2b16e8236e35cb769)My plan was: when I am about to be redrawn (with `show`) do some calculations based on data taken from "linked" face. Reactivity is much harder for me. I tried to keep the size of a face in sync with that of one that is resized during window resizing but it worked only using simple VID `react` (so I had to name faces and do it in "normal" VID code) but I was not able to define it in my own custom style, how can I do it ?

hiiamboris

[14:37](#msg6313668f647d633cf6022d21)use `react/link`

luce80

[18:14](#msg631399a2aa09177429f0f4a8)Yes, you talk as if it is a simple thing and I perfectly know what you are talking about. Reactivity is hard for me. I read the docs and tried a few things but nothing worked. It was something related to "bindology", that is as much hard for me, or because I placed the code in the wrong place (`init`). Is there a \*not-too-simple-but-not-too-complicated* example somewhere ?

hiiamboris

[18:16](#msg63139a019994996293492f5d)Surprisingly, \[in the docs](https://github.com/red/docs/blob/master/en/reactivity.adoc#13-dynamic-relations)

## Monday 5th September, 2022

luce80

[17:51](#msg6316371299949962934def97)Yes, before even starting to write my custom style I read the docs to see how I could have done it but unfortunatly reading them and making a few tries is not enough. I only menaged to avoid a "face has no context" error but have not succeded in linking the size of my face with that of the face provided by the "user" until now ! and it is not that simple , I will see if I can simplify something. If anyone else is interested:

```
system/view/VID/styles/mystyle: [
	default-actor: on-change
	template: [
	...
	]
	init: [
		face/values: make face/values face/options
		face/axis: pick [1 2] (face/size/x > face/size/y)
		if attempt [face/values/linked] [
			react/link func [face linked] compose/deep [(to-set-path compose [face size (face/axis)]) (to-path compose [linked size (face/axis)]) ][face face/values/linked]
		]
	]
```

[18:19](#msg63163db0443b7927a7fca8a9)P.S. I hope this https://github.com/red/red/pull/4529 will be merged.

hiiamboris

[18:20](#msg63163dd2443b7927a7fca8f7)Amen ;)

[18:20](#msg63163df099949962934dfcf3)For your function: use `x: (face/axis)` then all paths are clear, e.g. `face/size/:x`

luce80

[18:29](#msg631640163a42316d33d79bf5)On recent build If I open console using `print` from a script it does not show `print` output unless I click on it:

```
Red []
print "" ; open console for debug
view [area-test: area on-key-up [print area-test/text]]
```

hiiamboris

[18:33](#msg631641047ccf6b6d45bea390)Confirmed (need `print "test"` or smth)

[18:33](#msg631641157ccf6b6d45bea3c0)@qtxie

## Tuesday 6th September, 2022

qtxie

[08:22](#msg6317033805ad4a3701d9d2e5)@hiiamboris @luce80 Fixed it in the latest commit.

hiiamboris

[08:36](#msg63170679443b7927a7fe1fad)thanks

## Sunday 11st September, 2022

luce80

[12:54](#msg631dda9f443b7927a70b35c5)Why `with` VID keyword works by simply `do`ing the provided `block!` and does not "extends" the `face!` object as in Rebol2 ?

hiiamboris

[13:05](#msg631ddd139d3c186299f72c04)I second that question. In Spaces I decided to go with extending.

## Tuesday 13th September, 2022

dockimbel

[15:10](#msg63209d4fcf6cfd27af88595a)The `face!` event handlers are \[using a bitmask](https://github.com/red/red/blob/master/modules/view/view.red#L205) to track which object words have changed and pass it to the low-level backends. As the mask is stored in an integer, it's 32-bit only, so only 32 words can be tracked. Currently 25 words are used in `face!`, so only 7 more can be added with tracking enabled. In order to avoid users being confused by such limit, I preferred avoiding extension. Anyway, `/extra` facet is there for extensions without limits.

[15:13](#msg63209e1d999499629361eaba)BTW, I don't like much the `extra` name, but haven't found anything better. `/user-data` is too long and `/locals` seems related to contexts.

hiiamboris

[15:17](#msg63209f0311a6a83d04b1d015)What is tracking doing in this context?

dockimbel

[15:18](#msg63209f4011a6a83d04b1d08f)Passing the list of the changed words to the low-level backend in an efficient way (using a bit-array).

hiiamboris

[15:19](#msg63209f66d020d223d33668b1)But why low level backends need these user-defined facets?

[15:20](#msg63209fa9647d633cf61b7ca8)I have extended faces myself, reactivity works fine, I had no issues. So what's the catch I'm missing? ;)

dockimbel

[15:20](#msg63209fb672ad51741fdb7ef3)They don't need them. It's just that changes in extra words (beyond 32) won't be tracked by the `face!` event handlers. So even face reactivity won't work on them.

hiiamboris

[15:21](#msg63209fecaa0917742909c1fb)Seems to work:

```
>> f: make face! [a: b: c: d: e: f: g: h: i: j: k: l: m: n: o: p: 1]
>> length? words-of f
== 41
>> react [probe f/p]
1
== [probe f/p]
>> f/p: 2
2
== 2
```

dockimbel

[15:21](#msg63209feecf6cfd27af885f3a)Ah, right, we only exclude `state` and `extra` right now from the processing.

[15:21](#msg6320a00dd020d223d3366a8b)We didn't have reactivity when VID was written.

hiiamboris

[15:24](#msg6320a0aaaa0917742909c387)I suppose now this mask only controls when to trigger redraw?

dockimbel

[15:25](#msg6320a0dc7ccf6b6d45d27fbc)No, it tells the low-level code in backends which fields changed in the face, so that those changes can be processed.

hiiamboris

[15:27](#msg6320a169458f823ce07f16a0)I think I get the idea. I've had weird issues with rich-text face after disabling it's on-change. Probably some internal state became invalid.

dockimbel

[15:28](#msg6320a198f4d7a323decef9cd)See: https://github.com/red/red/blob/master/modules/view/view.red#L499

hiiamboris

[15:29](#msg6320a1c411a6a83d04b1d6d1)Saw that, tried calling `update-view` myself, didn't solve it :)

[15:29](#msg6320a1efb16e8236e3761899)Although I was using set-quiet, so maybe mask was not updated.

GiuseppeChillemi

[23:37](#msg63211449999499629362cdc8)So, is there a way to add a custom event and manage it with a custom actor like `on-myevent`? Could I simulate an event, as a key being hit or mouse move, never made from the user? Do we have only the Gui event manager or is there a global one whic include networking related event, time related one, and so on? Or it is just one?

## Wednesday 14th September, 2022

planetsizecpu

[07:01](#msg63217c62b16e8236e377b93c)&gt; BTW, I don't like much the `extra` name, but haven't found anything better. `/user-data` is too long and `/locals` seems related to contexts.

Nowadays I feel very comfortable using `/extra`

hiiamboris

[07:43](#msg6321862ff4d7a323ded0ad22)&gt; So, is there a way to add a custom event and manage it with a custom actor like on-myevent?

No, you can't create `event!`s, but `actors` object is yours to add functions and then call them.

&gt; Could I simulate an event, as a key being hit or mouse move, never made from the user?

You can \[send a message](https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-sendmessage) to own window, or simulate an OS event using \[mouse\_event](https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-mouse\_event). And something like that on other platforms.

&gt; or is there a global one whic include networking related event, time related one, and so on?

Not yet, but I assume that's the plan.

GiuseppeChillemi

[10:54](#msg6321b2f73a42316d33edb7dd)&gt;&gt; So, is there a way to add a custom event and manage it with a custom actor like on-myevent?  
&gt;No, you can't create event!s, but actors object is yours to add functions and then call them.

I hoped there could be a way to inject events and automate the GUI but from the inside of Red, to be OS independent

[10:57](#msg6321b3adaa091774290bd950)There could be some interesting application for this, over all: guides and courses.

hiiamboris

[11:07](#msg6321b5fd05ad4a3701ee7a70)There won't be unless someone bothers to do that :)

[11:08](#msg6321b642d020d223d33890b4)Besides, you don't need portability for a guide/course. Just record a mpeg.

GiuseppeChillemi

[11:30](#msg6321bb467ccf6b6d45d4aa1d)&gt; Besides, you don't need portability for a guide/course. Just record a mpeg.

In this way in can't do dynamic help/guides. I see the user that starts the guide and it types something in a field and the deletes it as invitation to the the same; or it draws a circle around a button and then it open a table-list and scrolls it to the needed point to select on entry, and so on.

[11:31](#msg6321bb766837563d1cd2cbee)Injecting events is important it this case.

hiiamboris

[11:33](#msg6321bc0e443b7927a712bf01)Ah, I see

greggirwin

[17:31](#msg6322100111a6a83d04b4ad41)My old `send-keys` dialect was for Windows only, but it was very useful at times. I never rewrote it for Red, but I did use it as an experiments for DiaGrammar tutorials. I thought that would work well, because it could play the keys and someone could do the voice over without having to do both at the same time. It also avoids mistakes in typing while making videos.

GiuseppeChillemi

[17:39](#msg632211d3f4d7a323ded1d358)Your send-key is already a great work and the usage scenario is just that. Having a way to inject the events inside the Red event system would either make it platform independent and also give fine interactivity for dynamic guides.

## Saturday 17th September, 2022

luce80

[09:13](#msg63258fae7ccf6b6d45dc52d8)I am trying to make a scrollable panel but with no success. The event system returns `'horizontal` for both scrollers. It works for a `base` style but not for a `panel` style. What am I doing wrong ?

```
>> about
Red 0.6.4 for Windows built 17-Sep-2022/5:57:29+02:00  commit #44403ba
system/view/VID/styles/scpanel: [
	default-actor: on-down
	template: [
		type: 'panel
		actors: [
			on-scroll: function [face [object!] event [event! none!]][
				?? event/picked
				?? event/orientation
				?? event/key
			]
		]
	]
]
print "" ; open console for debug
view [
	scpanel 150x150 magenta scrollable
]
```

hiiamboris

[09:18](#msg632590e299949962936bbda0)It's not implemented IIRC

dockimbel

[09:27](#msg63259304b16e8236e37ffa59)@qtxie ^---

## Sunday 18th September, 2022

qtxie

[01:28](#msg63267427443b7927a71c1def)@luce80 Pushed a fix. Caution: The `scrollable` face is an experimental feature. The API need to be reviewed and may be changed.

luce80

[08:18](#msg6326d443458f823ce08b5849)@qtxie Nice ! If API changes I will update my scripts. I think some scroller's object! names should be changed but naming is always the harder part and is subjective.

[08:41](#msg6326d99c647d633cf627bbd6)The width of the ellipsized `text` of an `alert` is 200 pixels. I think it is a bit too few even for the display of a smartphone , it should be made wrapped and not limited in height and/or wider.

hiiamboris

[09:06](#msg6326dfadb16e8236e382655a)submit a PR ;)

luce80

[16:56](#msg63274dd9443b7927a71da717)Is `visible?` implemented for a `scrollable` scroller ? It becomes disabled but it is still visible:

```
>> about
Red 0.6.4 for Windows built 18-Sep-2022/3:17:02+02:00  commit #5035ab9
system/view/VID/styles/scpanel: [
	default-actor: on-down
	template: [
		type: 'panel
		actors: [
			scroller: make map! 2
			on-created: func [face [object!] event [event! none!] ][
				scroller/x: get-scroller face 'horizontal

				scroller/x/max-size: 50
				scroller/x/page-size: 150
				scroller/x/visible?: scroller/x/max-size > scroller/x/page-size
				?? scroller/x/visible?
 			]
		]
	]
]
print "" ; open console for debug
view [
	scpanel 150x150 magenta scrollable
]
```

[17:49](#msg63275a37d020d223d343abcd)@hiiamboris willingly, but how can I measure the size of a wrapped text ?

```
>> size-text-face: make-face/spec 'text ["A more recent version of Red is required."]
== make object! [
    type: 'text
    offset: none
    size: 215x25
    text: "A more recent version of Red is required."
    image: none...
>> size-text size-text-face
== 215x15
>> size-text-face: make-face/spec/size 'text [wrap "A more recent version of Red is required."] 150x150
== make object! [
    type: 'text
    offset: none
    size: 150x150
    text: "A more recent version of Red is required."
    image: non...
>> size-text size-text-face
== 215x15
```

hiiamboris

[17:54](#msg63275b639d3c18629909eac2)well, this should work out of the box, but it's definitely buggy :D

```
view [text 100 wrap "abc def abc def abc def abc def abc def abc def abc def abc def abc def"]
```

luce80

[18:00](#msg63275cac72ad51741fe8a8b6)Having a `text` style that do not "bother" its height IMHO is less severe (even possibly a "feature") then not being able to precisely measure a text, since most parts of a GUI are made of text.

[18:10](#msg63275f103a42316d33f8ef26)Uh, but there is `caret-to-offset` ...

```
>> msg: "A more recent version of Red is required."
== "A more recent version of Red is required."
>> size-text-face: make-face/spec 'text compose [wrap (msg)]
== make object! [
    type: 'text
    offset: none
    size: 215x25
    text: "A more recent version of Red is required."
    image: none...
>> size-text size-text-face
== 215x15
>> caret-to-offset size-text-face length? msg
***CRASH***
```

hiiamboris

[18:11](#msg63275f36443b7927a71dc6ed):)

[18:11](#msg63275f577ccf6b6d45dfbfa1)¯\\\\\\\_(ツ)\\\_/¯

GiuseppeChillemi

[20:00](#msg632778f799949962936f52b1):D

## Monday 19th September, 2022

qtxie

[08:56](#msg63282ec005ad4a3701fb27d2)`caret-to-offset` works for rich-text only. I'll add some checking code.

luce80

[18:03](#msg6328aeed72ad51741feb39b9)And what about `visible?` of `scrollable` ?

[18:24](#msg6328b3c411a6a83d04c1ae86)Also I do not like centered text in alerts OK:

```
view [rich-text "Message to display"]
```

but I prefer transparent background

```
view [rich-text "Message to display" 255.255.255.255]
```

[18:24](#msg6328b3d63a42316d33fb8a48)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/hcfx/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/hcfx/image.png)

[18:24](#msg6328b3f7cf6cfd27af984426)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/br1X/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/br1X/image.png)

hiiamboris

[18:39](#msg6328b74fb16e8236e385eb7a)`alert` is easy to redefine for your taste

greggirwin

[18:42](#msg6328b819443b7927a7206576)I still want more standard dialogs. e.g. https://gist.github.com/greggirwin/9cd640ca42bdfd56c5ff4432c4765d2c

## Tuesday 20th September, 2022

luce80

[17:01](#msg6329f1df7ccf6b6d45e4a6c2)@hiiamboris In fact I was trying to redefine it using `rich-text`. But I see that if I do not specify a transparent color I get a \*\*left aligned\** text and if I make one with transparent background I get a \*\*centered\** text.  
P.S.: @qtxie And what about `visible?` of `scrollable` ?

hiiamboris

[17:06](#msg6329f329f4d7a323dee1336f)write bug reports as you find bugs, only then they will be fixed ;)  
or ask for reopening of existing bugs

[17:09](#msg6329f3c2647d633cf62db795)https://github.com/red/red/issues/4429 seems related a little

## Wednesday 21st September, 2022

luce80

[17:48](#msg632b4e5f9d3c18629911945f)@hiiamboris the `visible?` problem is much more important for me. Can you please confirm it is not working ?

hiiamboris

[17:52](#msg632b4f4f05ad4a3701013d6f)Yeah I ran your code. Seems weird.

[17:53](#msg632b4f9b647d633cf6306775)I tried to complain about scrollers some years ago, but was told that it's a WIP, and no issue reports are accepted. Dunno, maybe it's time. Ask @qtxie better.

luce80

[18:08](#msg632b530b6837563d1ce58ce3)@qtxie I understand `scrollable` is experimental and WIP , I only ask if I should give up for the time beeing or not and if not if that `visible?` will be implemented or, as an alternative, having access to scroller size to be able to make it 0-sized.

greggirwin

[18:19](#msg632b55a8458f823ce09411d3)`Scrollable` is part of the native control, so not something VID controls directly. Not even sure you can do it with API calls. The ugly workaround is to see if it's needed (measure content) and recreate the face without it.

luce80

[18:32](#msg632b58a1999499629376d5c3)It is already working as it is. See @toomasv table-style. In fact I have "reverse-engineered" it and I have a working version as you can see from the example above. The only thing left that will make it "complete" is the possibility to hide it. I found this `scrollable` magic only a few days ago mentioned by @hiiamboris and tried it. A few days before I was just tring the "manual" version using the "normal" `scroller` but that was harder than expected. It seems I am compelled to use reactions but they are a bit hard for me. I nevertheless managed to have a working version but when I tried to go on with that other problems came up so when I heared of `scrollable` I tried it hoping it was easier.

greggirwin

[18:32](#msg632b58d3f4d7a323dee3f05b):+1:

qtxie

[20:32](#msg632b74d16837563d1ce5cca3)`face/visible?` should work for all the types of face. `scrollable` flags works for `base`, 'rich-text`, 'panel` and `window` faces.

[20:33](#msg632b752d443b7927a725bcf5)Yes. There is `scroller` face type if you want fully control. It's a normal face!.

[20:34](#msg632b755a647d633cf630b53d)&gt; In fact I was trying to redefine it using rich-text. But I see that if I do not specify a transparent color I get a left aligned text and if I make one with transparent background I get a centered text.

Use `face/para` to control the alignment.

[21:11](#msg632b7e126837563d1ce5e0c4)&gt; Is visible? implemented for a scrollable scroller ?

I'll check the code. Should be easy to add if not implemented.

GiuseppeChillemi

[21:13](#msg632b7e646837563d1ce5e187)@luce80  
&gt; It is already working as it is. See @toomasv table-style. In fact I have "reverse-engineered" it.

Wow, very nice! I want to study Table-Style, because it is really great. I would like to give my help improving it, as the whole Red team is concentrating on Red 0.7 and 1.0 and Table-Style could need some hands.

[21:13](#msg632b7e766837563d1ce5e191)What about sharing some experiences on it?

[21:14](#msg632b7eb005ad4a3701019dd1)Have you seen how it internally organizes its data too?

## Thursday 22nd September, 2022

luce80

[18:36](#msg632cab3711a6a83d04c97983)Wouldn't it be nice if `paren!`s inside VID "layouting" blocks were evaluated automatically without having to use `compose` ?

greggirwin

[19:35](#msg632cb911443b7927a7283da0)Some parens are evaluated. e.g. `view [button "Extra! Extra!" [print mold face/extra] extra (1 + 2 + 3)]`

This request comes up from time to time, and may seem obvious to do. But then we have to ask how much it helps, or if you're better off building your dynamic layouts another way. The simple cases, like caption/text replacement, still need a way to refer to the config'd text, which works today.

```
s: "Extra! Extra!"
view [button s [print mold face/extra] extra (1 + 2  + 3)]
```

But not if your word is in an object, because paths don't evaluate automatically like words there.

We could set up a page like \[this one](https://github.com/red/red/wiki/%5BHOWTO%5D-VID-and-View-(GUI)-hints-and-tips) but for VID design ideas.

GiuseppeChillemi

[22:02](#msg632cdb5faa0917742921b373)@toomasv  
Coming from: https://gitter.im/red/parse?at=632c0e26647d633cf631d420

I have understood but is there a way to tell VID "Draw it at the bottom of this button", or "add this button to the panel and recalculate and reposition everything? I mean a method that does not imply feeding VID the entire description again?

## Friday 23th September, 2022

toomasv

[03:43](#msg632d2b4a6837563d1ce916bf)@GiuseppeChillemi Yes, there is, but you have to be pretty specific about where to put it.

&gt; Draw it at the bottom of this button

You have several options to do this. May-be closest to your example:

```
view [
    p: panel 300x150 [
        x: button "hello" [
			append p/pane layout/only compose [
				at (as-pair x/offset/x x/offset/y + x/size/y + 10)
				button "world" with [
				][probe reduce [x/offset face/offset]]
]]]]
```

Or

```
view [
    p: panel 300x150 [
        x: button "hello" [
			append p/pane make-face/offset/spec 'button 
				as-pair x/offset/x x/offset/y + x/size/y + 10 [
					"world" [probe reduce [x/offset face/offset]]
				]
]]]
```

This is if you wanted to add it below. Try positioning it across.

&gt; add this button to the panel and recalculate and reposition everything

I assume you mean inserting here. Again, you have to do calculations, if you are not going to feed the whole layout to `layout` again. E.g.

```
view [
    p: panel 300x150 [
        x: button "hello" [
			insert p/pane make-face/offset/spec 'button x/offset [
				"world" [probe reduce [x/offset face/offset]]
			]
			x/offset/y: face/offset/y + face/size/y + 10
]]]
```

[04:03](#msg632d3022cf6cfd27afa0f0f6)Gosh, I don't know what the `with []` is doing in first example :flushed: I probably tried first to give offset to the new button with `with [offset: ...]` but it didn't work.

[19:47](#msg632e0d42647d633cf635bec7)@GiuseppeChillemi A \[toy](https://gist.github.com/toomasv/5fc2e81d4f0e1a507ac277a151ecd989) to play with :).

greggirwin

[21:12](#msg632e214e9d3c186299170237)Very nice @toomasv !

GiuseppeChillemi

[22:46](#msg632e3744458f823ce0999b15)@toomasv I am already playing with it, thank you!

## Saturday 24th September, 2022

toomasv

[08:20](#msg632ebdb811a6a83d04cd47f8):)

luce80

[08:22](#msg632ebe5c3a42316d33073165)Are these `size-text` results expected:

```
>> about
Red 0.6.4 for Windows built 24-Sep-2022/9:39:31+02:00  commit #487881e
>> msg1: "A more recent version of Red is required. A more recent version of Red is required."
== {A more recent version of Red is required. A more recent version of Red is required.}
>> size-text-face: make-face/size/spec 'rich-text 300x2000 [wrap font []]
== make object! [
    type: 'rich-text
    offset: none
    size: 300x2000
    text: none
    image: none
    color: 255.255.255
    menu...
>> probe size-text/with size-text-face msg1
0x16
== 0x16
>> size-text-face/text: msg1
== {A more recent version of Red is required. A more recent version of Red is required.}
>> probe size-text size-text-face
295x32
== 295x32
```

hiiamboris

[08:29](#msg632ebfe9443b7927a72c0168)/with doesn't work with rich-text IIRC :D

[08:30](#msg632ec028443b7927a72c01f8)I'm assigning /text then measuring then reverting it

[08:31](#msg632ec06c3a42316d33073406)https://github.com/red/red/issues/3812

luce80

[09:42](#msg632ed0f66837563d1cec2b8c)here we are. Don't be shy and try to beat me !

```
system-view-alert-ctx: context [
size-text-face: make-face/size/spec 'rich-text 300x2000 [wrap font []] ;@@ IMHO this face! should be somewhere inside view object!
set 'alert func [
	{Displays an alert message in a pop-up modal window} 
	msg [string! block!] "Message to display"
	/local
		emoji
		emoji-size
		text-size
][
	msg: form reduce msg
	size-text-face/text: msg
	text-size: size-text size-text-face
	emoji: "⚠"
	size-text-face/text: emoji
	size-text-face/font/size: 40
	emoji-size: size-text size-text-face
	view/flags [
		title "Alert" 
		below
		center ;@@ could/should be inside system/view/VID/GUI-rules 
		panel [
			origin 0x0 across middle
			rich-text glass emoji-size emoji font-size 40
			rich-text glass text-size msg wrap
		]
		panel [
			; add buttons here
			button focus "OK" [unview] on-key [
				switch event/key [
					#"^M" #"^[" #" " #"^O" [unview]
				]
			]
			; add buttons here
		]
	] [
		no-min no-max
		modal
	]
]
] ; system-view-alert-ctx
either system/build/date < 24-09-2022 [alert "A more recent version of Red is required !" quit ][alert "This is a nice alert ! " quit]
```

Note that by simply changing the emoji and adding buttons you can get different requesters.  
But are emoji supported enough ?  
Also I really don'i know if and how to calc min and max text sizes.  
P.S. obviously this is PD and made to replace the official one ;)

hiiamboris

[09:49](#msg632ed2c2f4d7a323deea8a8c)I guess it's another bug to report: that rich-text doesn't automatically set it's size to that of /text or /data facets.

luce80

[09:57](#msg632ed470cf6cfd27afa3f253)Having rich-text to automatically set it's size to that of /text or /data facets seems a nice \*feature* to add. With the possibility to manually set its size of course.

hiiamboris

[10:01](#msg632ed59211a6a83d04cd7552)this is still affecting it too https://github.com/red/red/issues/3861

[10:02](#msg632ed5a7458f823ce09ab242)without all these bugs fixed I don't see any hope for requesters :)

luce80

[10:08](#msg632ed734aa09177429255324)Apparently there is hope since the situation only a few days ago was much worse so now ping @qtxie to fix https://github.com/red/red/issues/3861 ;) . The same example with `rich-text`gives different results.

## Sunday 25th September, 2022

qtxie

[02:24](#msg632fbbd672ad51741ff88d6c)&gt; Also I really don'i know if and how to calc min and max text sizes.

`size-text` returns the mininum text sizes. What do you expect for the max text sizes? Infinite?

[02:29](#msg632fbcecf4d7a323deec25a4)&gt; Having rich-text to automatically set it's size to that of /text or /data facets seems a nice \*feature* to add. With the possibility to manually set its size of course.

How is that possible? For example, you have set the /size facet to 200x200, then you set the /text facet. How does Red know if you want to reset /size according to the /text or not?

luce80

[07:33](#msg6330043699949962937f97cc)&gt; What do you expect for the max text sizes? Infinite?

That is the thing I don't know ;) . Here I am talking about aesthetics.

&gt; How is that possible?

Yes, not possible. But there are a number of possibilities, none is the \*right* one but some could be better then others. provided the there is choice to change things.  
P.S. about aesthetics: I would modify that function a bit. I would delete `origin 0x0` and probably reduce emoji `font-size` a bit.

hiiamboris

[08:43](#msg63301495647d633cf6395a97)&gt; Having rich-text to automatically set it's size to that of /text or /data facets seems a nice feature to add.  
&gt; How is that possible?

Easy  
!\[](https://i.gyazo.com/3bb87d5ad941ecdfba115e7e22d13018.gif)

[08:44](#msg633014d599949962937fb7a7)I'm controlling width when height is inferred automatically. With a minimum width determined by the longest word and maximum width - by that of whole text.

[08:45](#msg6330150fcf6cfd27afa62d6b)Aesthetically, I would guess humans will prefer W/H ratio from 1.0 to 2.0. But that is perhaps not a task for VID (and is context-dependent). It's a task for the user to take the max width and get a square root.

GiuseppeChillemi

[12:46](#msg63304db8d020d223d354b31e)Why I have no output here until I close the window?

```
print "a"
view [button "Hello" [probe face/extra] with [probe 22 extra: 33]]
```

hiiamboris

[12:57](#msg63305030647d633cf639caef)Dunno. I have the output.

[12:57](#msg6330503f72ad51741ff99681)`Red 0.6.4 for Windows built 25-Sep-2022/4:45:17+03:00 commit #499b279`

GiuseppeChillemi

[13:49](#msg63305c827ccf6b6d45f0bd50)I am starting the script from Ultra Edit via key combination

[13:56](#msg63305df172ad51741ff9b0cf)@hiiamboris open the DOS console in Windows, save the script and start it with `red.exe test.r`

[13:56](#msg63305e00f4d7a323deed4d6a)It happens when you run it from a file.

hiiamboris

[13:58](#msg63305e69458f823ce09d6d22)!\[](https://i.gyazo.com/919c2f31262c3149efc4025249a4e80f.gif)

GiuseppeChillemi

[14:04](#msg63305fdfd020d223d354d4b9)\[!\[Bug.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/9emT/thumb/Bug.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/9emT/Bug.gif)

hiiamboris

[14:05](#msg633060133a42316d330a14fc)your build?

GiuseppeChillemi

[14:05](#msg6330601e72ad51741ff9b4ee)`Red 0.6.4 for Windows built 22-Aug-2022/20:21:51+02:00 commit #9b56273`

hiiamboris

[14:05](#msg6330602a6837563d1ceeec4e)update

GiuseppeChillemi

[14:09](#msg6330612a3a42316d330a16f0)The update has had a bad side effect...

[14:10](#msg633061409d3c1862991afb78)It has solved the problem!

hiiamboris

[14:14](#msg6330625f443b7927a72ef931)I guess in today's world where every update usually just destroys some features, this is indeed a miracle :)

GiuseppeChillemi

[14:17](#msg63306300458f823ce09d7719)The crowd screams:  
Long live Red! Hooray!!!  
Long live Red! Hooray!!!  
Long live Red! Hooray!!!

## Monday 26th September, 2022

luce80

[18:33](#msg6331f05f443b7927a731f6c6)I thought the `scrollable` thing was easier but is becoming a nightmare:

```
>> about
Red 0.6.4 for Windows built 24-Sep-2022/9:39:31+02:00  commit #487881e
system/view/VID/styles/scpanel: [
	default-actor: on-down
	template: [
		type: 'panel
		actors: [
			scroller: make map! 2
			on-created: func [face [object!] event [event! none!] ][
				scroller/x: get-scroller face 'horizontal
				scroller/x/max-size: scroller/x/parent/pane/1/size/x
				scroller/x/page-size: scroller/x/parent/size/x
				scroller/x/visible?: scroller/x/max-size > scroller/x/page-size
 			]
			on-scroll: func [face [object!] event [event! none!] /local dim steps][
				if event/key <> 'end [
					dim: pick [y x] event/orientation = 'vertical
					either event/key = 'track [
						scroller/:dim/position: event/picked ; absolute movement
					][
						scroller/:dim/position: scroller/:dim/position + (1 * pick [1 -1] event/key = 'right) ; relative movement
					]
					scroller/:dim/position: min max 0 scroller/:dim/position  (scroller/:dim/max-size - scroller/:dim/page-size)
					scroller/:dim/parent/pane/1/offset/:dim: negate scroller/:dim/position ;
				]
			]
		]
	]
]

view [
	scpanel 150x150 magenta scrollable [
		origin 0x0
		text "123 abc 456 abc 789 xyz" 250x200 brown
	]
]
```

after I drag the knob for the 1st time then if I try again it goes "on its own".

hiiamboris

[18:56](#msg6331f5c1f4d7a323def05f41)happens with WIP parts :)

toomasv

[19:37](#msg6331ff7fb16e8236e3975002)@luce80 Regression has occurred somewhere after 26 August. With 26-August build scroller in my table-template still works and you snippet seems to work too. In my current build (Sept 22) it does not.

## Thursday 29th September, 2022

GiuseppeChillemi

[20:49](#msg633604e372ad51741f04689f)OMG, creating multiple panels, each based on dynamic VID block, s whose number and content varies depending on the Sarà you provide is very difficult

[20:50](#msg633605253a42316d3314c39c)* Data

greggirwin

[21:42](#msg6336115505ad4a3701158846)Entire frameworks, applications, and companies have been built on that. :^)

## Friday 30th September, 2022

GiuseppeChillemi

[06:34](#msg63368dd805ad4a3701166409)I have not understood the sense of the phrase, is: they have been built to avoid this problem, or "is it just your problem" 😁

greggirwin

[15:17](#msg633708a672ad51741f064f33)They have been built to solve this problem, so you don't have to.

## Monday 3th October, 2022

riprwwa

[03:13](#msg633a536df4d7a323deffce11)And it's such a vast problem that lots of people make a living solving it.

hiiamboris

[17:13](#msg633b182f773e7e5c7bba3e2d)Grid fitting is nearly instantaneous if I eliminate \*face* resizing from it:  
!\[](https://i.ibb.co/RcbQfgz/GIF-03-Oct-22-20-08-53.gif)

pekr

[17:15](#msg633b18bb35c5276a7213b142)Why is that so? Is that because face is mapped to some OS widget? Is that possible to have just a window, then a bitmap to draw onto? Or why would face cause a slowdown then?

hiiamboris

[17:18](#msg633b196b9a0ad66a76f075b0)@qtxie is the one to ask

greggirwin

[18:30](#msg633b2a31a72aed0166170f23)Very nice @hiiamboris. So you're using `draw` for everything without individual `base` faces for content? If so, then it makes sense it will be a lot faster (and more scalable).

hiiamboris

[18:49](#msg633b2eaccb3b243528fb5b76)I `draw` on `base`, but don't resize the base itself.

[18:49](#msg633b2ebdfbade7016ea58932)I never used individual bases.

greggirwin

[19:52](#msg633b3d7d0b8c9518d7d710c3)So your `base` is just big and your bounding box is defined within that?

hiiamboris

[19:56](#msg633b3e7afbade7016ea5aa09)Right

GiuseppeChillemi

[21:48](#msg633b58b8fbade7016ea5dc3c)@greggirwin  
&gt; Entire frameworks, applications, and companies have been built on that.

However, it is far easier to bind a dynamic block to a temporary context, with all the structures and values, than:

```
make make object! compose/deep/only...
```

Because you also have blocks with `compose/deep/only`, so you create from an object proto which has also `make make object! compose/deep/only...`, and your brain become nuts going back and forth inside the script, trying to read and understand how all the structures works.

[21:53](#msg633b59f664f29419bfc0b079)In this case, it would be great if you have a single block with everything inside and you can selectively compose parens, telling Red which one to use. So you may compose some deeper blocks, then some other and then up to the root level.

greggirwin

[21:58](#msg633b5b1235c5276a72143133)This is exactly the use case for a dialect. There are many moving parts in a UI framework and most of them can be described delcaratively.

## Tuesday 4th October, 2022

GalenIvanov

[07:13](#msg633bdd0bcbfe685c881137ac)Looks great, @hiiamboris !

## Thursday 6th October, 2022

planetsizecpu

[07:30](#msg633e83f8683a5c58c721539f)I test automatic night builds on my game as a daily basis. This morning I found a strange behavior on latest build available, of Red 0.6.4 for Windows built 6-Oct-2022/8:24:41+02:00 commit #0657e22. The wheelbarrow disapears when released, and there is a space when grip on the kart handles that I think wasn't here on previous build. I had no time to investigate if it is some hidden flawn on my sources due to my daily work, just want to comment here for others to test their software.

[07:30](#msg633e84152a06f4566b22e4c6)\[!\[cavetest333.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/jV2D/thumb/cavetest333.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/jV2D/cavetest333.gif)

hiiamboris

[08:07](#msg633e8ca9cbfe685c88164b5b)Thanks for reporting. Please try isolating the issue.

luce80

[17:28](#msg633f1047133b6458ca14bcb7)Is there a way to have `error?` return `true` when an error occurs inside a `draw` `block!` ?

```
>> about
Red 0.6.4 for Windows built 24-Sep-2022/9:39:31+02:00  commit #487881e
>> view [
    	below
    	inp: area 150x40 "fill-pen 1" focus on-key-up [
    		probe error? probe try [out/draw: load inp/text ]
    		probe error? probe try [show out ]
    	]
    	out: base white draw []
    ]
[fill-pen 1]
false
true
false
*** Script Error: invalid Draw dialect input at: [1]
*** Where: ???
*** Near : none
```

or having a mean to know if an error occured.

hiiamboris

[18:25](#msg633f1daf9a0ad66a76f8054b)what I'm doing is `try [draw 1x1 [...]]`

[18:26](#msg633f1dc8773e7e5c7bc1bbd8)not sure if there's a more by-design way :)

[18:27](#msg633f1df5133b6458ca14d78d)(images are not recycled so I'm bound to run out of memory eventually)

greggirwin

[18:27](#msg633f1e082a06f4566b240198)That's where I was headed too. Couldn't find another way in quick checking here.

GiuseppeChillemi

[23:14](#msg633f6144cbfe685c8817e160)Today I have redone the code to build dynamic data blocks based on binding instest of composing, to have it more readable. I have soon understood my code was plagued by `context not available` problems, avoided by composing words to their values in the previous attempt. Tomorrow I will make another one using a context inside the function, so I can the bind my vid code to it. I admit it's a very difficult task.

## Friday 7th October, 2022

luce80

[18:07](#msg63406ad69a0ad66a76faa4d8)`scroller/selected` changes after creation . Initially it is correctly 58% but when I scroll it has become 57% so If I scroll all the way down I can see the red background. I can avoid that by recalculating `selected` every time but why does it happen ?

```
view layout [
    size 390x252
	backdrop green
    across space 0x0
    gp: panel 350x232 red [
        origin 0x0 space 0x0
        p: panel 350x400 [
            origin 0x0 space 0x0
            below
            area "A" 350x100
            area "B" 350x100
            area "C" 350x100
            area "D" 350x100
        ]
    ]
	sc: scroller 16x232 on-created [
		face/selected: to-percent min (max 1 face/size/y) / (max 1  p/size/y) 1 ; visible-part / total  ratio given as percentage
		?? face/selected
	] extra object [
		scroll: func [face][
			face/data: min max 0.0 face/data (1.0 - face/selected)      ; constrain to allowed range
			p/offset/y: to integer! negate p/size/y * face/data         ; scroll amount
			p/offset/y: min max face/size/y - p/size/y  p/offset/y  0   ; constrain to allowed range
			print [face/selected face/data p/offset/y gp/size/y face/size/y p/size/y]
		]
	]
	[ ; action (on-change)
		face/extra/scroll face
	] 
]
```

greggirwin

[19:53](#msg634083cc64f29419bfcab46a)What is the goal @luce80 ?

GiuseppeChillemi

[23:14](#msg6340b2ca34982518bdeae5e7)I have managed to make things simpler with a couple of rules:  
1\) user a wrapper object for prototypes  
2\) use the convention to add -PROTO to each prototype name inside the object, so you can avoid the problem of having `make object! [structure-name: structure-name]` which causes error  
3\) When objects are connected, do not use the `o: make object! [extra: my-value-creation-code]` but `o: make object! [extra: none]` -&gt; `o/extra: my-value-creation-code`

[23:14](#msg6340b2e4fbade7016eb013aa)However... I find one thing very annoying!

[23:15](#msg6340b324683a5c58c725a772)I would like to isolate the configuration words that contains the face parameters inside an object and refer to them via path but I can't:

```
>> a: make object! [size: 50x50]
== make object! [
    size: 50x50
]
>> view [button "Hello" a/size]
*** Script Error: VID - invalid syntax at: [a/size]
*** Where: do
*** Near : args
*** Stack: view layout throw-error cause-error
```

[23:17](#msg6340b38e2a06f4566b272bc9)So, if I use the word `size` I am forced to not use it inside the actors block (you have to shield it via composing/reducing)

[23:19](#msg6340b3ed133b6458ca17f09f)If I have multiple faces with 2 configuration objects, I must build the panel in 2 phases. In the first one I bind the 2 faces creation blocks to 2 objects, in the second, I join the blocks.

[23:20](#msg6340b42364f29419bfcb0f34)While I could have used

```
button "a" face-a/size 
button "b" face-b/size
```

to select the proper configurations

[23:21](#msg6340b48f773e7e5c7bc4ee0c)Supporting paths in VID dialect INMHO is very important

## Saturday 8th October, 2022

gurzgri

[00:05](#msg6340beb464f29419bfcb21b4)@luce80: Not an answer to your question, but no recalculation of `sc/selected` needed with

```
view layout [
    size 390x252 backdrop green across space 0x0
    gp: panel 350x232 [
        backdrop red origin 0x0 space 0x0
        p: panel 350x400 [
			style area: area 350x100
            origin 0x0 space 0x0 below
            area "A" area "B" area "C" area "D" 
        ]
    ]
    sc: scroller 16x232 on-created [
		face/selected: gp/size/y / p/size/y
	]
	react [p/offset/y: to integer! max sc/size/y - p/size/y sc/data * p/size/y * -1] 
]
```

toomasv

[04:38](#msg6340feaa6f104f35308e7844)@GiuseppeChillemi Use `button with [size: …]`.

GiuseppeChillemi

[05:50](#msg63410f8e64f29419bfcbaa24)A question: is `with` block converted to object or is it parsed?

hiiamboris

[07:29](#msg634126dafbade7016eb0d469)neither

[07:29](#msg634126ed64f29419bfcbd516)just evaluated

toomasv

[08:19](#msg6341328b34982518bdebbbe2)... in context of current face, i.e. bound to face.

luce80

[13:13](#msg6341776b34982518bdec3873)@gurzgri make a win-resizable version, scroll all the way down and then resize thw window dragging down the window border and you will magically see appear the red background that then magically disappears if you scroll again.

[13:33](#msg63417c11a72aed01662306a6)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/TnxW/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/TnxW/image.png)

[13:33](#msg63417c3035c5276a721fa526)The two circles are not centered:

```
>> about
Red 0.6.4 for Windows built 5-Oct-2022/19:40:17+02:00  commit #cbe1935
view [base white draw [
pen red
circle 30x30 20.4
pen black
circle 30x30 20.5
]]
```

hiiamboris

[13:34](#msg63417c81cb3b243528075333)this will go away with floating point pairs

luce80

[13:36](#msg63417cdd34982518bdec4191)The centers are the same `pair!` but radii are a little different.

hiiamboris

[13:36](#msg63417cec0b8c9518d7e2d638)I understand

[13:38](#msg63417d43cbfe685c881be689)I guess @qtxie could work around it

[13:39](#msg63417dae2a06f4566b2889f0)worth opening an issue IMO

[13:46](#msg63417f269a0ad66a76fc967a)D2D should support arbitrary radius, so it must be a remnant of GDI somewhere

toomasv

[15:11](#msg634193396f104f35308f7f3d)&gt; is it possible to change font size in Table style?

:point\_up: \[May 19, 2022 7:38 PM](https://gitter.im/red/red/gui-branch?at=6286728f09eea00adea163c7)

\[!\[formatting](https://toomasv.red/images/Table/formatting.gif)](https://toomasv.red/images/Table/formatting.gif)

GiuseppeChillemi

[18:12](#msg6341bd9735c5276a722022cf)&gt; neither

So, is it a simple `do bind [with] face`?

toomasv

[18:15](#msg6341be5a6f104f35308fd455)Tread your path from \[here](https://github.com/red/red/blob/master/modules/view/VID.red#L323) :)

hiiamboris

[18:18](#msg6341bee16f104f35308fd4dd)Surprisingly @GiuseppeChillemi there's \[documentation](https://github.com/red/docs/blob/master/en/vid.adoc#with)

GiuseppeChillemi

[22:04](#msg6341f3f26f104f35309036ed)@toomasv Nice link Toomas!

[22:05](#msg6341f4209a0ad66a76fd7467)@hiiamboris I am often surprised from the documentation, this is one of those "wow" moments.

## Monday 10th October, 2022

qtxie

[09:58](#msg6343ecda683a5c58c72b5501)&gt; this will go away with floating point pairs

Yes.

## Tuesday 11st October, 2022

luce80

[18:26](#msg6345b567cbfe685c88239c58)A focused button in a panel gains no focus:

```
>> about
Red 0.6.4 for Windows built 5-Oct-2022/19:40:17+02:00  commit #cbe1935
view [panel [button focus "ok?" [unview]]]
```

hiiamboris

[18:30](#msg6345b65f34982518bdf3e626)reported here: https://github.com/red/red/issues/3808#issuecomment-832191434

luce80

[18:58](#msg6345bcc8cb3b2435280eeebd)&gt;&gt; this will go away with floating point pairs

&gt;Yes.

@qtxie Something else perhaps but NOT this. Or prevent me from using floats for circle's radius.

qtxie

[23:11](#msg6345f80e133b6458ca216c75)@luce80 Indeed. I'll make some improvement.

## Thursday 13th October, 2022

luce80

[18:27](#msg634858aecbfe685c88289976)@qtxie Nice! as always.

I already posted a similar code but this one is slightly modified:

```
>> about
Red 0.6.4 for Windows built 12-Oct-2022/1:16:27+02:00  commit #0fcd694
>> about
Red 0.6.4 for Windows built 5-Oct-2022/19:40:17+02:00  commit #cbe1935

system/view/VID/styles/scpanel: [
	default-actor: on-down
	template: [
		type: 'panel
		actors: [
			scroller: make map! 2
			on-created: func [face [object!] event [event! none!] ][
				scroller/x: get-scroller face 'horizontal
				scroller/x/max-size: scroller/x/parent/pane/1/size/x
				scroller/x/page-size: scroller/x/parent/size/x
				scroller/x/visible?: scroller/x/max-size > scroller/x/page-size
 			]
			on-scroll: func [face [object!] event [event! none!] /local dim steps][
				if event/key <> 'end [
					dim: pick [y x] event/orientation = 'vertical
					either event/key = 'track [
						scroller/:dim/position: event/picked ; absolute movement
					][
						scroller/:dim/position: scroller/:dim/position + pick [20 -20] event/key = 'right ; relative movement
					]
					scroller/:dim/position: min max 0 scroller/:dim/position  (scroller/:dim/max-size - scroller/:dim/page-size)
					scroller/:dim/parent/pane/1/offset/:dim: negate scroller/:dim/position ;
				]
			]
		]
	]
]

view [
	scpanel 150x150 magenta scrollable [
		origin 0x0
		text "123 abc 456 abc 789 xyz" 250x200 brown
	]
]
```

If I use the arrows buttons to scroll they do not work correctly, as if they stay behind one click.  
it was working as of 18-Sep and perhaps as of 24-Sep.

qtxie

[23:29](#msg63489f69fbade7016ebe9bfa)@luce80 @dockimbel It's a regression since this commit: https://github.com/red/red/commit/cbe19354196e97a830b34899ef8ae525833c7ced

```
view [
	b: base button "move" [b/offset/x: -20]
]
```

## Friday 14th October, 2022

bubnenkoff

[12:27](#msg634955ada3ccb16cbe0a22ed)@hiiamboris I decided to try Spaces, but faced with problem

[12:27](#msg634955aff00b697fec3f86c6)\[!\[изображение.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/ynH6/thumb/izobrazhenie.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/ynH6/izobrazhenie.png)

hiiamboris

[12:30](#msg6349567588e38704c00fbac9)Yeah a problem. I'm in the middle of some \*\*big\** change, and I've updated a few things in red-common repo, but not in the spaces' master branch.

[12:31](#msg6349568c21df5f7a549ef661)Use `single-parent` branch of Spaces, it's up to date.

[12:31](#msg6349569786407c265b715ee5)I'll merge it to the master in a few weeks.

[12:33](#msg634957129ee3ec22b4c1886c)Alternatively you can reset red-common to commit `26e8c102ff`, it'll work (`git reset --hard 26e8c102ff`).

bubnenkoff

[12:35](#msg634957840a8c6e22a1c0c329)Thanks! But what do you mean here "Code assumes /spaces and /common reside in this script's directory"  
Do I have right directory structure? Or should be folder named `scripts`?

hiiamboris

[12:35](#msg63495797bad3c73752d64eb5)It's shown in the spoiler below.

[12:36](#msg634957ceaa210536d60edc9d)Below `If you would prefer...` words.

[12:36](#msg634957eaf00b697fec3f8ae3)In quick start https://codeberg.org/hiiamboris/red-spaces/src/branch/master/quickstart.md

bubnenkoff

[12:37](#msg634957f49ee3ec22b4c18ab5)ah! thanks!

[12:37](#msg63495821cf41c67a5caea26e)Is there any way to run code with copy-paste to console?

hiiamboris

[12:41](#msg634958f6cd9a8436d11831dd)I've put that answer into two documents :)

[12:42](#msg63495950bad3c73752d651f7)Look for `Examples in this document can be run`...

bubnenkoff

[13:00](#msg63495d7c27f328266d3b4ff6)Wow! It's look cool! I first example to work

pekr

[14:29](#msg6349723e21df5f7a549f2d6c)@hiiamboris what kind of big changes can we expect? 🙂

hiiamboris

[14:59](#msg6349795dcf41c67a5caee9ca)To be announced when done.

bubnenkoff

[15:34](#msg6349817bcf41c67a5caef8ea)&gt; I test automatic night builds on my game as a daily basis. This morning I found a strange behavior on latest build available, of Red 0.6.4 for Windows built 6-Oct-2022/8:24:41+02:00 commit #0657e22. The wheelbarrow disapears when released, and there is a space when grip on the kart handles that I think wasn't here on previous build. I had no time to investigate if it is some hidden flawn on my sources due to my daily work, just want to comment here for others to test their software.

Hi! Could you show code of your sprites? Just interesting how it's works

## Saturday 15th October, 2022

luce80

[08:13](#msg634a6bb3dcbf067fdc9607d9)Could also this be improved ?

```
>> about
Red 0.6.4 for Windows built 12-Oct-2022/1:16:27+02:00  commit #0fcd694
>> view [base draw [box 5x5 50x50 10]]
>> view [base draw [box 5x5 50x50 10.4]]
*** Script Error: invalid Draw dialect input at: [10.4]
```

greggirwin

[18:05](#msg634af6630a8c6e22a1c3d4f0)Improved meaning allowing floats there, I assume. Yes, that's possible.

## Sunday 16th October, 2022

luce80

[07:06](#msg634bad7a88e38704c01404ab)The previous mystery deepens...try these in this exact order and the circle will "open" and "close" when you do not expect it ;) :

```
>> about
Red 0.6.4 for Windows built 12-Oct-2022/1:16:27+02:00  commit #0fcd694
>> view [base draw [circle 30x30 20 20]]
>> view [base draw [circle 30x30 20.0 20]]
>> view [base draw [circle 30x30 20 20.0]]
>> view [base draw [circle 30x30 20.0 20]]
>> view [base draw [circle 30x30 20 20.0]]
>> view [base draw [fill-pen red circle 30x30 20 20.0]]
>> view [base draw [circle 30x30 20 20.0]]
```

I am on Win11

hiiamboris

[08:10](#msg634bbc8321df5f7a54a36a3d)getting !\[](https://i.gyazo.com/6c5f6e269824ddca9e030b88545215fb.png) after first circle

[08:11](#msg634bbcc6cf41c67a5cb31706)`Red 0.6.4 for Windows built 6-Oct-2022/9:24:41+03:00 commit #0657e22`

luce80

[08:43](#msg634bc448880fe76caaf92777)Yes, but more fun is happening after, when `20 20.0` first gives a circle and then gives a line.

hiiamboris

[08:44](#msg634bc463cf41c67a5cb32599)not happening for me

[08:44](#msg634bc46627f328266d3fb447)only lines

luce80

[08:45](#msg634bc4a7880fe76caaf927fc)Well, your situation is more "stable" ;)

## Tuesday 18th October, 2022

planetsizecpu

[13:19](#msg634ea7e0f3e9f0375845a53a)&gt; \[!\[cavetest333.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/jV2D/thumb/cavetest333.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/jV2D/cavetest333.gif)

Today's built solved itself the space between the boy and the handles when hanging for the kart, anyway I found a flawn on the barrow handling func, where I wrote `face/visible: true` instead of `face/visible?: true` this time it was a fun review 😄 Thx to the @RedTeam

[14:20](#msg634eb63827f328266d453ed8)Unfortunately the compiled exe does not respond as the interpreted one, so it blocks the boy at the starting point and it is not playable. I have to investigate a bit when time permits.

## Thursday 20th October, 2022

luce80

[17:11](#msg6351812921df5f7a54ae3859)

[17:11](#msg6351813bcf41c67a5cbdddf4)

[17:11](#msg6351815ff00b697fec4ee356)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/XkcH/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/XkcH/image.png)

[17:12](#msg6351817c86407c265b809196)I've found an aesthetic anomaly:

```
>> about
Red 0.6.4 for Windows built 12-Oct-2022/1:16:27+02:00  commit #0fcd694
view [text yellow "Age" font-size 20 field "Age" font-size 20]
```

greggirwin

[17:31](#msg635185d6f00b697fec4eeb5d)It has to do with the extra space the native `field` control includes.

```
view [
    text yellow "Age" font-size 20
    field "Age" font-size 20
    field no-border "Age" font-size 20
    button "Age" font-size 20
]
```

hiiamboris

[17:41](#msg63518857cd9a8436d1275f65)Clipped for me too: !\[](https://i.gyazo.com/3d1b38cb7a631e70da6a97aa041974d8.png)

[17:42](#msg6351887bcd9a8436d1276005)It also has to do with aligning of labels to fields. I suppose text should have extra spacing then.

[17:42](#msg6351888a21df5f7a54ae471a)@qtxie

luce80

[18:32](#msg63519430880fe76caa040345)I do not know if this should be "fixed" but if I do not specify the size in a template:

```
>> about
Red 0.6.4 for Windows built 12-Oct-2022/1:16:27+02:00  commit #0fcd694
>> system/view/VID/styles/newstyle: [template: [type: 'base]] view [newstyle "hi" 30]
*** Script Error: path element > y < does not apply to none! type
*** Where: eval-path
*** Near : styling? if all [style/init not styling?] 
*** Stack: view layout fetch-options eval-set-path
```

## Friday 21st October, 2022

luce80

[18:35](#msg6352e66aaa210536d620b635)I'd like to make a `style` made as a group of 2 `button`s. If I use a `panel` then I can not have an "action" block because that is "reserved", if I use a `base` I can populate its `pane` only with `base`s and not `button`s or other "widgets" . How can I solve this problem ?

hiiamboris

[18:37](#msg6352e6e3f3e9f037584d8a69)What would be the point of an action block if there are two buttons?

[18:40](#msg6352e78e27f328266d4d060f)I suggest instead of a "style" write a dialect over VID.

greggirwin

[18:51](#msg6352ea39cd9a8436d129f509)A style is a singular element, not a collection. A mechanism for creating groups or templates and combining them doesn't exist today, beyond `compose` or building the layout incrementally.

GiuseppeChillemi

[21:43](#msg6353129f5b0dbc04b894bb32)@greggirwin So, no `stylize` in Red?

greggirwin

[22:38](#msg63531f6e0a8c6e22a1d30458)@rebolek did one a long time ago, but it was never merged. But that doesn't matter, as styles were never about grouping. Fundamentally they are for single faces. We need a higher level mechanism for reusable groups.

hiiamboris

[22:49](#msg635321df9ee3ec22b4d3c984)What if style is saved literally (as VID), and then interpreted after each injection?

[22:50](#msg63532241f3e9f037584df842)It would like an ad-hoc macro, but other than that is there a drawback?

greggirwin

[22:51](#msg6353228e9ee3ec22b4d3cae7)That sounds a lot like `compose`.

hiiamboris

[22:52](#msg63532293bad3c73752e87aba)In Spaces I just disabled the ability to style lists until I figure out how it should work.

greggirwin

[22:53](#msg63532305dcbf067fdca64fc5)One of the tricky parts I see is akin to iterated faces in R2's `list` style. you need references to sub-items, but VID doesn't support paths for that. This also aligns with data binding needs, where you may have multiple instances of a group, each bound to a different data source.

hiiamboris

[23:01](#msg635324e0a3ccb16cbe1c74bc)But data source you will specify when you specialize the instance of the style.

[23:03](#msg63532528bad3c73752e88044)Maybe we don't need `stylize` or `style` and can use `compose`? If we dropped the problematic `(..)` syntax and used e.g. `@[..]` for /only-like behavior and `@(..)` for splicing... Or we could accept named blocks in VID as Parse does.

[23:05](#msg635325d627f328266d4d804c)Can you give an example of when sub-items in list need referencing and why that doesn't work in VID? I didn't get it.

## Saturday 22nd October, 2022

greggirwin

[00:02](#msg6353332821df5f7a54b16089)I don't think we need new syntax. e.g. the old `build/inject` alternative idea to compose gives you more control.

In R2 list, there was only ever a single "current" item being drawn. The model made it hard to implement anything but display+action-only lists. e.g. it built the sub-layout based on an index, and you could create a link/action that was fixed, based on a block of data. But if you showed multiple items (the point of a list), things like `field` or `check/radio` didn't work. It was a nice foundation, but incomplete for real world needs.

luce80

[08:51](#msg6353af040a8c6e22a1d3f3c2)&gt;things like `field` or `check/radio` didn't work

Uh! Yes it seems so, now that I've tested it. Funny that with my `vid1r3.r3` it works ...

&gt;What would be the point of an action block if there are two buttons?

I am trying to make a spinner. And there is always a point in an action block.

&gt; A mechanism for creating groups or templates and combining them doesn't exist today,

There should be or how do you create complex `style`s from simple ones ?

&gt;beyond `compose` or building the layout incrementally.

When you have built the layout how do you control it from an implementer POV and from a user POV ?

hiiamboris

[09:25](#msg6353b713880fe76caa07dbca)@greggirwin `build/inject` is still new syntax (to Red), just \*\*much\** less thought out.

[09:30](#msg6353b832cd9a8436d12b5085)@luce it's beyond `style` scope. You can control your layout if you declared your own template.

luce80

[12:33](#msg6353e305f00b697fec533dd1)I shoul have not used the word `style` that is ambiguous, I shoud have used "widget", but what I meant is that I can not use this:

```
system/view/VID/styles/spinner: [
	default-actor: on-down
	template: [
		type: 'panel
		size: 0x0 ;@@ declared to avoid BUG
	]
	init: [
		pane: layout [
			space 0x0 below
			button "▲" 13x10
			button "▼" 13x10
		]
		face/pane: pane/pane
		face/size: pane/size
	]
]

view [spinner 30 [Print "hi"]] ;@ cannot use action
```

And this does not work:

```
view make face! [
	type: 'window
	size: 200x150
	pane: reduce [
		make face! [
			type: 'base
			size: 180x100
			color: yellow
			pane: reduce [
				make face! [
					type: 'button
					size: 13x10
					text: "▲"
				]
				make face! [
					type: 'button
					offset: 0x11
					size: 13x10
					text: "▼"
				]
			]
		]
	]
]
```

hiiamboris

[14:29](#msg6353fe31aa210536d6229f29)ez fix: `view [spinner 30 on-click [Print "hi"]]`  
`layout` uses block for panel's pane, it's hardcoded in current design  
But I'll return to my question, what's even the point? You're about to assign the \*same* action to two buttons.

[14:32](#msg6353ff0421df5f7a54b2bb28)&gt; And this does not work

You forgot offsets, and `base` is a D2D surface, it cannot support native controls

luce80

[16:00](#msg6354139f88e38704c023845e)The fix is a kind of a "documentation" fix. The idea was to "intercept" the click and "dispatch" the action based on the clicked button, and/or something similar to the buttons of a scroller which can have an action block.  
In the example there is only one offset which is enough if the `base` is changed with a `panel`.  
I could ask you what is a D2D surface but I think that would be too much ;)

hiiamboris

[16:04](#msg635414a888e38704c02385cd)Direct2D is a hardware-accelerated vector rendering technology, which has nothing to do with the native GUI widgets coming since pre-Windows-95 era. You can draw native widgets \*over* it (expect flicker), but not \*inside* (by the means of) D2D surface.

[16:07](#msg6354155227f328266d4f1774)You seem to be trying to hack the design past it's designed limits with your dispatch based on the button idea. I suggest either using `data` facet to provide data to your style, then let the style pick relevant actors from there, or like I proposed previously, make a dialect extending VID.

luce80

[16:20](#msg6354183c0a8c6e22a1d4adf9)When you talk about extending VID do you mean something like `view my-extending-vid-function [spinner [print data]]` ?

hiiamboris

[16:22](#msg635418aca3ccb16cbe1e17b9)Yeah, or `my-view [spinner [print data]]`

greggirwin

[18:30](#msg635436b5a3ccb16cbe1e4e27) I understand your goal now @luce80. Thanks for clarifying. There are two thoughts here.

1\) a reusable compound widget should encapsulate details and hide information. So the user doesn't control the individual actions of the inner buttons. This leads to complications if you want a single style to both handle numeric spinning and list-of-data selection.

2\) R2 provided more control with its `words` handling in style definitions. That was important because it didn't use native controls, so everything was built using that. Red's VID doesn't have that, so you're limited in what you can expose in a compound style anyway.

Which leads back to the other solutions we're discussing.

## Sunday 23th October, 2022

luce80

[07:52](#msg6354f2d086407c265b86be88)IMHO having the possibility to create a compound widget using already implemented native controls could be a way to extend the number of available widgets in a relatively simple way. Otherwise I must recreate even a simple button from scratch also drawing it using `draw` in a non system-GUI compatible way. But I am not as skilled as @hiiamboris ;) , should I go to his side anyway and/or wait for him to implement the widgets I need or like ? Perhaps its time to try his VID/S ;)

hiiamboris

[09:17](#msg635506a4a3ccb16cbe1faf8d)Just use `single-parent` branch for now if you do.

## Tuesday 25th October, 2022

luce80

[18:43](#msg63582e4d880fe76caa1018ff)I have a `button`, when I click it I set `rate` to create `time` events,; in the `on-time` actor I do a few things. Now I would like to do different things if `shift` key is pressed but time events seem not to report it, is it so ?

```
view [button "ticks" focus [face/rate: 0:0:0.5] on-time [
	either event/shift? [
		print "shift tick"
	][
		print "tick"
	]
]]
```

hiiamboris

[18:49](#msg63582fa3cf41c67a5cca2c1a)Just save the flags you get from key-down/up events

[18:49](#msg63582fbff00b697fec5b4011)time event of course doesn't have that info

## Sunday 30th October, 2022

luce80

[08:48](#msg635e3a74cf41c67a5cd54236)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/TDgE/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/TDgE/image.png)

[08:49](#msg635e3a8a88e38704c0363b0b)how many problems can you see here ;) ?

```
>> about
Red 0.6.4 for Windows built 27-Oct-2022/3:05:04+01:00  commit #5f113b7
view [base 500x300 draw [
line-width 50
pen linear green red
rotate 'pen 30 30x230
arc 130x130 100x100 0 359
line-width 5
fill-pen off
circle 130x130 100
arc 130x130 100x100 0 360
]]
```

dockimbel

[10:32](#msg635e52d0f00b697fec6680dd)@qtxie ^---

[10:48](#msg635e567eaa210536d635d83a)@luce80 It should be `pen off` instead of `fill-pen off` (which has no effect there, as there's no filling pen defined previously). Over than that, it seems there's only one bug there: the second arc's center location seems affected by the first arc.

[10:52](#msg635e578b9ee3ec22b4e86815)Looks like the culprit is the arc's sweep argument.

hiiamboris

[12:06](#msg635e68b586407c265b981971)Shouldn't `arc` scale pen to it's size as `circle` does?

[12:07](#msg635e68fa0a8c6e22a1e7b5fa)At least when `pen` has no explicit gradient coordinates.

[12:22](#msg635e6c93f00b697fec66ada3)

```
view [
	below
	panel tight [text 60 "start:"  s: slider 400 data 0.3 st: text 40 react [face/text: form to 1 s/data * 1200 - 400]]
	panel tight [text 60 "length:" e: slider 400 data 0.6 et: text 40 react [face/text: form to 1 e/data * 1200 - 400]]
	base cyan 500x300 react [face/draw: compose [
		line-width 50
		arc 130x130 100x100 (transcode/one st/text) (transcode/one et/text)
	]]
]
```

And outside the 0-360 range behavior of `arc` seems undefined:  
!\[](https://i.gyazo.com/bb8a19c801eb88e30488f18a11ddd3e9.gif)

[12:23](#msg635e6cd9880fe76caa1b5665)It also only accepts integers (very typical issue for Draw commands, likely from GDI era)

[12:29](#msg635e6e28880fe76caa1b583f)

```
view [
	below
	panel tight [text 60 "start:"  s: slider 400 data 0.3 st: text 40 react [face/text: form to 1 s/data * 1200 - 360]]
	panel tight [text 60 "length:" e: slider 400 data 0.6 et: text 40 react [face/text: form to 1 e/data * 1200 - 360]]
	base cyan 500x300 react [face/draw: compose [
		line-width 50
		arc 130x130 100x100 (transcode/one st/text) (transcode/one et/text)
	]]
]
```

Fun:  
!\[](https://i.gyazo.com/bae230130e1281526a61279959eac23f.gif)

dockimbel

[12:45](#msg635e7202f3e9f0375862ac2a)Better open a ticket for that issue.

[12:47](#msg635e72735b0dbc04b8a9abf0)In the above reactive formula you could have leveraged the `/text` and `/data` auto-convert feature to simplify the code:

```
react [face/data: to 1 s/data * 1200 - 400]
react [face/data: to 1 e/data * 1200 - 400]
```

then the `arc` command can be reduced to:

```
arc 130x130 100x100 (st/data) (et/data)
```

hiiamboris

[12:48](#msg635e7290bad3c73752fd7087)Right, thanks!

[12:49](#msg635e72e1880fe76caa1b600a)Another ticket for pen not being scaled, or it's somehow by design?

dockimbel

[12:52](#msg635e739688e38704c0369adf)Might be a backend limitation, I'm not sure. @qtxie can tell.

hiiamboris

[13:06](#msg635e76b821df5f7a54c604e2)https://github.com/red/red/issues/5234

luce80

[13:15](#msg635e78e2f3e9f0375862b845)The `fill-pen off` is a leftover since there was a `fill-pen` but I wanted to simplify things as much as possible. But what about the rotated but no-more-interpolated linear gradient of 1st `arc` ?

hiiamboris

[13:18](#msg635e7989dcbf067fdcbb1669)As answered above, waiting for Qingtian.

## Monday 31st October, 2022

qtxie

[07:59](#msg635f805627f328266d63ee3c)&gt; no-more-interpolated linear gradient

You should specify the `starting point` and the `ending point` of the linear pen. For now the draw engine is not yet able to figure them out for `arc`.

## Wednesday 2nd November, 2022

cloutiy

[14:51](#msg63628401880fe76caa22e250)I think red gui could be a great option for making a ui mockup tool. For example like balsamiq or excalidraw.

## Saturday 5th November, 2022

luce80

[10:05](#msg6366355d0a8c6e22a1f66e83)Promotion:  
After many hours of fighting I was able to do \[this](https://gist.github.com/luce80/433286c66d98997aff6e69fbd6323a35).  
Please have a look and tell me what you think. I am still not satisfied with "key qualifiers" incrementing values, if anyone have suggestions please tell me or even better make an improved version of the gist.

hiiamboris

[11:09](#msg6366446b27f328266d70b29a)Cool @luce80 !

[11:10](#msg6366449b9ee3ec22b4f73125)One note: on touchpad it feels reversed, when you move fingers up, it decreases the value and vice versa.

[11:10](#msg636644ba27f328266d70b323)I also get some errors on startup:

```
*** Script Error: none! type is not allowed here
*** Where: -
*** Near : siz: face/size - face/data face/data: face
*** Stack: view show do-actor do-safe
*** Script Error: none! type is not allowed here
*** Where: -
*** Near : siz: face/size - face/data face/data: face
*** Stack: view show do-actor do-safe on-resizing
```

luce80

[13:03](#msg63665f350a8c6e22a1f6bc87)@hiiamboris thanks. To which key are fingers map to ?  
About the error: can you understand what is `none` ? Does an `data: 0x0` placed before `win/actors` definition cure the problem ?

hiiamboris

[13:21](#msg6366634bbad3c737520c6031)It's not keys, Windows maps touchpad to wheel events for legacy apps.

[13:22](#msg6366639f880fe76caa2a43f1)`face/data` is none in on-resizing event

[13:25](#msg63666433a3ccb16cbe40190d)`0x0` fixes the error, but size is bigger than the window:  
!\[](https://i.gyazo.com/ef149341552969343207dd8d639ecce5.png)

luce80

[13:27](#msg636664aaf3e9f03758718638)So if I reverse wheel events then rotating wheel down will increase the value ? Is it preferable or is there a way to distinguish between the two?  
Does this fixes the problem ?

```
actors: object [
	on-create: func [face][face/data: face/size]  ; init value
;...
```

hiiamboris

[13:27](#msg636664c55b0dbc04b8b892e9)No way I think

[13:29](#msg6366653f88e38704c04579dd)Yes that fixed it for big windows, for small you'll need to clip it:  
!\[](https://i.gyazo.com/f217917e6823cfafff866a3c420b32c9.png)

luce80

[13:34](#msg6366666d27f328266d70f55a)Thanks, I have updated the gist, but no that seems intended behaviour: numeric field width is 0 and text has moved over it. It is strange that on my Win11 I had no that problem.

[13:36](#msg636666d89ee3ec22b4f77072)Also is there a vertical red bar right to the arrow buttons ? It should not be visible.

[13:37](#msg63666706a3ccb16cbe401f98)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/ba9g/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/ba9g/image.png)

[13:38](#msg6366676988e38704c0457e7f)Also your triangles seem too big. Also your text is nicer, placed vertically.

[13:54](#msg63666b09f3e9f0375871923d)Can anyone, please, post an image showing the result of following code ? I'd like to see the differences between OSes

```
view [
		backdrop brown
		space 0x0 below

		base 100x20
		box yellow 100x20
		field 100
		area 100x26
		text 100 "hi" magenta
		button 100 "hi"
		check 100 magenta
		toggle 100 "hu"
		radio 100 yellow
		progress 100
		slider 100 magenta
		text-list 100x20 data ["hi"]
		drop-list 100x20 data ["hi"]
		drop-down 100x20 data ["hi"]
	]
```

Mine is Win11

[13:55](#msg63666b4421df5f7a54d4fba4)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/hswW/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/hswW/image.png)

hiiamboris

[13:56](#msg63666b9a86407c265ba73844)Vertical red bar is native field outline sticking out.

luce80

[13:58](#msg63666c15aa210536d6450185)No, it shouldn't. Please change this: `face/color: red ; to see if resizing is right` to green or something else and try again.

hiiamboris

[13:59](#msg63666c3927f328266d70ff00)W10: !\[](https://i.gyazo.com/7717cb4a644f9173d0ce16c7673bb571.png)  
GTK (doesn't fit): !\[](https://i.gyazo.com/7433ac03a1ec9cdfb3a8bdd97f617fe1.png)

[14:00](#msg63666c8ddcbf067fdcc9f8f0)color: blue  
!\[](https://i.gyazo.com/9418374235fd618ed62075a132885aa0.png)

[14:01](#msg63666ca10a8c6e22a1f6d3eb)I think field uses external margin, to align with `text`

[14:02](#msg63666ceff00b697fec75a2d7)

```
>> system/view/metrics/dpi
== 144
```

[14:03](#msg63666d1e0a8c6e22a1f6d4c2)maybe just rounding error due to 150% scaling

luce80

[14:05](#msg63666dc4dcbf067fdcc9fac5)Shit ! So I should take dpi into consideration...but why 1st widget is not showing blue bar ?...

hiiamboris

[14:07](#msg63666e1a9ee3ec22b4f77dbf)It seems 1px smaller to me

[14:09](#msg63666e7ff00b697fec75a537)!\[](https://i.gyazo.com/9831b3e32edb5e34aa443bae125f9c61.gif)

luce80

[14:25](#msg6366726021df5f7a54d5061a)I have setted my dpi to 150%, tried again, modified as necessary and updated the gist. It should be ok now, could you please confirm ?

hiiamboris

[14:40](#msg636675e488e38704c04597b0)Sure

[14:42](#msg63667639880fe76caa2a64b7)!\[](https://i.gyazo.com/9062110e4ff296496748246b969dc9c1.png)

[14:42](#msg63667640dcbf067fdcca0716)Fine now, save for arrows clipped a bit

luce80

[14:51](#msg63667857cf41c67a5ce4a309)Thanks again ! It seems perfection is not reachable ;).  
P.S.  
\[WISH] : I'd like default text style be defined like this:

```
system/view/VID/styles/text: [
	default-actor: on-down
	template: [type: 'text size: 0x0]
]
```

So it can be nicely aligned also vertically.

hiiamboris

[15:44](#msg636684e6f3e9f0375871c514)How does default size affect alignment?

[15:46](#msg6366857088e38704c045b452)Anyway default size is used to make empty labels and generate their /text later.

luce80

[15:58](#msg6366880d0a8c6e22a1f70782)I do not understand what you mean as "empty labels" but try something like this:

```
view [across middle field "abc" text "def"]
```

with and without my template especially using \*\*100% dpi scaling\** and see the difference. Also add a back color to the text to see it better.

hiiamboris

[16:04](#msg63668973aa210536d64534c9)Just add `tight` after all other facets of `text`.

[16:04](#msg6366897ccf41c67a5ce4c1c6)(it's bugged when you add it too early)

luce80

[16:11](#msg63668b3dbad3c737520caaba)And is bugged if you use it as a new style like: `style text: text font-size 10 tight` so why not use my template as default ?

hiiamboris

[16:13](#msg63668bb627f328266d713aff)Because, like I said

[16:13](#msg63668bb9cf41c67a5ce4c616)Try this `view [below t1: text t2: text do [t1/data: now/time t2/data: now/date]]`

[16:14](#msg63668c02bad3c737520caba7)Or this `view [text "aaaa" button "aaaa" return text "bbb" button "bbb" return text "cc" button "cc"]`

luce80

[16:31](#msg63668fd45b0dbc04b8b8e1ce)So you prefer having a default non-zero size instead of doing  
`view [style text: text 80x25 below t1: text t2: text do [t1/data: now/time t2/data: now/date]]`  
Or `view [style text: text 80x25 text "aaaa" button "aaaa" return text "bbb" button "bbb" return text "cc" button "cc"]` ?  
I'm sorry I'm accustomed to my solution and I still think my solution is more generic but I admit it is a matter of taste.

hiiamboris

[16:38](#msg6366919088e38704c045cacf)Not just me ;)

[16:39](#msg636691a7a3ccb16cbe406e18)Lazy people seem to agree defaults are a good thing.

[16:40](#msg636691e727f328266d714795)You are trying to work around an implementation (not design) bug, by complicating the design.

[16:40](#msg636691f127f328266d7147a1)Instead, push a fix for it ;)

[16:40](#msg6366920ca3ccb16cbe406eac)https://github.com/red/red/issues/4292

[16:41](#msg63669251bad3c737520cb83e)At least add a comment there that it doesn't work with `style` too. I didn't even try that.

luce80

[16:47](#msg636693bef3e9f0375871e06e)I am lazy, I agree defaults are a good thing.  
I added a comment, that was easy ;)  
Since we are talking about size: R2 VID had also negative "init" values e.g. `-1x20` means 20 pixels height but calculated width. This also could come in handy. And now let's wait for the bug fix.

hiiamboris

[16:51](#msg63669486cf41c67a5ce4d762):+1:

luce80

[16:54](#msg63669535a3ccb16cbe40741c)...ehm...now we could discuss which default value is better and when and how to set it ;)

hiiamboris

[16:56](#msg636695c8dcbf067fdcca4435)I'm fine with 80x25 ;)

greggirwin

[18:36](#msg6366ad14aa210536d64576fc)Really nice work @luce80. :+1:

## Monday 7th November, 2022

luce80

[17:51](#msg6369458f21df5f7a54da1f98)@qtxie is it possible to have area `face/selected` and `event/selected` being 0-based so that we can also set and get the `caret` position ? If Doc agrees, of course.  
Or, as an alternative, use `0x0`, `1x0` etc to set (and get) `caret` position.

hiiamboris

[17:55](#msg636946accd9a8436d1532f6b)I'm also using \*offset* for selection in Spaces (as opposed to \*index\*). I'm for the change.

## Tuesday 8th November, 2022

qtxie

[02:16](#msg6369bbfdabfb5860bb06f3e0)@luce80 Red uses 1-based index. I'm afraid it will cause troubles if we use 0-based index in `View`.

dockimbel

[10:30](#msg636a2fdca34b5112111f440d)&gt; 0-based so that we can also set and get the caret position

Can you elaborate on how those are related?

hiiamboris

[11:00](#msg636a36ca4fee72663c66b994)Indexes mean whole chars, e.g. 7x7 is a single 7-th character, and there's no way to denote an empty interval (which a caret is) using index notation. While pair offsets (that are zero-based) represent ranges and 7x7 means start after 7 chars and end after 7 chars, which is an empty interval (a caret). 0x0 is a valid caret location, after 0 chars.

[11:01](#msg636a370aff5546644b35c293)AFAIK OSes all use offset notation. In Red we fight designs taken by the OSes to come up with a more limited and less convenient design (IMO :)

[11:14](#msg636a39f925ca105c88a7d14f)If we add /caret facet, it can only be offset-based, and if /selected is index-based, they won't align with each other, leading to awkward math needed for such a simple thing.

[11:15](#msg636a3a3b473cf96648d70a91)But since most GUI systems don't support /caret separate from /selected (selection always ends at caret), they unify it into one logical parameter.

[12:05](#msg636a45fa426f9311ff95e9a2)Alternatively, /caret can include both char index and a flag whether it is located before that char or after it. It makes some sense for wrapped text: caret with the same offset can map to end of the previous or to beginning of the next line, will act the same but will be displayed differently (otherwise you may click on beginning of the next line and see caret at the end of the previous, or vice versa). This will however obviously complicate working with it, for very ephemeral value.

[12:10](#msg636a4724655bc46025b9711f)I am also of an opinion that an integer range! datatype should be used for selection, not a pair (which has a 2D meaning, and is going to support floats hopefully). Then `empty? selection` would naturally map to it, as well as `length? selection`.

luce80

[18:29](#msg636aa01325ca105c88a8a40d)@dockimbel : @hiiamboris already explained it. I can only add 2 things: pixels are 0-based so there is a precedent; the alternative proposed was using `/y = 0` as a kind of escaping number so 7x7 still means a single 7-th character but 7x0 means an empty selection starting after 7-th character and representing the caret position. I do not know if the 2nd alternative is easily implemented and/or simple to "understand" by the user, you choose.

greggirwin

[23:04](#msg636ae077655bc46025baa285)+1 for `range!`. I don't like `pair!` for this use either. I've looked at interval math before, but the key for Red is to be clear about which actions and functions deal in indexes and which in offsets.

I also hope to read your design notes sometime soon.

## Wednesday 9th November, 2022

luce80

[19:04](#msg636bf9ae326f06602c3f29ff)Just a second thought: 7x0 could mean an empty selection starting before 7-th character so 1-based remains and we could have it before `range!` is implemented and you still could possibly change it when View is revisited. Currently I could find a (cumbersome) workaround to get the caret position but no way to set it.

greggirwin

[22:09](#msg636c2508426f9311ff998548)We can think further outside this box and make selection a structure, e.g. a block. Then we can also name values. But first we should define an interface for dealing with selections via wrappers. That may be enough.

## Thursday 10th November, 2022

luce80

[19:58](#msg636d57d3655bc46025bf45d7)So no caret `set` and `get` for next years ? Or are they months?

## Friday 11st November, 2022

qtxie

[01:11](#msg636da13f25ca105c88ae5290)&gt; Or, as an alternative, use 0x0, 1x0 etc to set (and get) caret position.

Why not just use `integer!` values?

luce80

[18:49](#msg636e9937bcdb0060b8194141)`integer!` is better ! I simply thought we had to stay "compatible" with current format. I just tried and for 0-based selection indeed this works moving the caret:

```
select-text: func [
	hWnd   [handle!]
	values [red-value!]
	/local
		sel		[red-pair!]
		begin	[integer!]
		end		[integer!]
][
	sel: as red-pair! values + FACE_OBJ_SELECTED
	either TYPE_OF(sel) = TYPE_PAIR [
		begin: sel/x
		end: sel/y									;
	][
		begin: 0
		end:   0
	]
	SendMessage hWnd EM_SETSEL begin end
]
```

Although it is not "adjusted" for newlines...

hiiamboris

[19:10](#msg636e9e41a34b51121127c67e)Caret and selection exist together. When you press Left or Right or Shift+Left or Shift+Right the caret moves or selection extends/contracts from the previous caret position.

luce80

[19:16](#msg636e9f99f9491f62c9ac5c55)That was the reason why I thought that `selected` `pair!`should be used, but probably `integer!` could solve and/or simplify things even more.

hiiamboris

[19:18](#msg636ea005b1a7596436693b15)Maybe you're right. On the other hand that's two types to deal with instead of one.

## Wednesday 16th November, 2022

pekr

[10:53](#msg6374c144a34b51121132eafe)@hiiamboris just tried Red inspector. I really like BW design. Subjectively, much prettier than red and yellow combination. It has a bit laggy scrolling here, and when I type into a search field, the caret flows few chars behing what letter I actually type :-)

hiiamboris

[10:56](#msg6374c1debcdb0060b8245504)yeah, need to fix that

pekr

[10:59](#msg6374c276473cf96648eaba08)Is that executable "old" Red/S, or already a new prototype, after your new redesign attempt?

hiiamboris

[11:34](#msg6374cab54fee72663c7a592f)after the redesign, must have not noticed the regression

[11:38](#msg6374cbc1326f06602c4f3b7a)the core of this issue is explained in https://github.com/red/REP/issues/124 clause 3

[11:39](#msg6374cbe8426f9311ffa96fbb)I may change the text in rich-text face, and it may update the text before I'm ready to redraw the caret

[11:39](#msg6374cbf2f9491f62c9b792e5)need to be extra careful to avoid this

[11:48](#msg6374ce08655bc46025ccdd57)actually now that I think of it, I probably never found a fix in the first place :)

[11:52](#msg6374cef9426f9311ffa97593)and another funny fact: I can easily reproduce the bug in compiled exe (with `-e`) but not in the interpreted script

[11:56](#msg6374cffc655bc46025cce0e5)oh that's because compiled one is much laggier, lol

[11:57](#msg6374d019473cf96648ead355)must be bugs in preprocessing

[12:46](#msg6374dbababfb5860bb1b86f9)indeed, this was due to `#[none]` being replaced by `none` word

[12:53](#msg6374dd5d25ca105c88bba6a9)@pekr recompiled, you can try a new one

## Sunday 20th November, 2022

pekr

[08:10](#msg6379e0e40513b562e8bb748b)@hiiamboris Dunno if it is just a feeling, but Red Inspector now seems to be faster and cursor position lag seems to be gone too. Design wise, I am really liking what I am seeing - scrollable areas, tables, tooltips, buttons, resizing / stretching. For others to see - http://2zone.cz/pekr/red-inspector.jpg

[08:12](#msg6379e17625ca105c88c4b4d0)I am seeing one glitch though - when in root, there is a `platform`item for e.g. And when I drag the scroller, it scrolls, and once at bottom, it jumps back and the situation repeats. It is because the data being eventually loaded dynamically, so you have to recalculate? If so, then it is not a bug then ....

hiiamboris

[08:44](#msg6379e8fea34b5112113c33b5)It's pagination.

[08:45](#msg6379e934a34b5112113c3403)Even then, I limited the number of items it could display per object to 100, for performance reasons.

pekr

[08:49](#msg6379ea260513b562e8bb847b)OK, works quite well though.

[08:52](#msg6379ead1b1a75964367da517)It is few weeks already, since I skimmed across the code and I already mentioned dislike to `=something=` syntax in the codebase. I belived you have studied most of the Redbol past GUI efforts, but IIRC I also saw your mention about exposing "keywords"? So just a note - not sure it was Carl's R3 GUI effort, but I do remember:

\- facet - shared property across instantiated "objects"  
\- faced - private copy to the created object (not shared)  
\- options - block, which defined keywords for the VID level ....

hiiamboris

[09:17](#msg6379f09025ca105c88c4cf7d)To like or dislike something in the codebase you first have to understand it ;) So no, I don't accept style complaints there.

[09:17](#msg6379f0c715a3885c70fc9756)As for terms, I use 'facet', sometimes at least. Not sure where the other terms are applicable.

pekr

[09:49](#msg6379f81b0513b562e8bb9a86)Visual code representation might be imo a valid argument, as it might influence how users perceive the system and might influence they likes/dislikes to use any such system.

[09:53](#msg6379f906655bc46025d6250e)As for the past Rebol experience - in Rebol, subobjects are shared. During the old VID times, users were manipulating the face elements directly, and wondering, why changing a button to red color changed all of them :-) `faced`simply allowed to define a private instance element at a style level, IIRC. `options`allowed to define exposed keywords to the VID level, so that you could use `my-style color red`, where `color`was an exposed keyword.

hiiamboris

[09:59](#msg6379fa822cb657024036b46b)I see, thanks. So R2 VID was much more configurable than Red VID.

pekr

[10:06](#msg6379fc1325ca105c88c4e431)It is always a tough call between the native gui vs non-native one :-) During the old R2 VID times (1996 or 1998 was first View 1.0 release) we have complained, that apps might get refused, as we did not have the ability to have elements like menu, context menu, reflect OS native styling.

The perceptions changed with the iPhone revolution imo. Amiga like big buttons were not a problem anymore :-) With Red, we've got native UI integration. I like the menu, buttons, find it sufficient .... till you don't want to use more sophisticated elements like Grid, for which you simply will not be able to find a cross-platform element.

The problem of past VID was also its incompletness. Carl told us, that it was just his attempt to show a way, and expected community to bring in more sophisticated GUIs on top of View. The situation was also improved later with the AGG library integrations, so Draw got much more powerfull capabilities.

[10:09](#msg6379fcd315a3885c70fcaa57)The problem of past VID was its simplicity - no rich-text, insufficient keyboard support, OS non compatible tabbing, etc. It can be done, but needs more complex set-up, and that's what I can see with Spaces.

Btw - when Amiga was for sale, Carl worked for a Viscorp company, which wanted to buy an Amiga for their set-top-box business. Was interviewing him for Amiga Review and asked about Amiga GUI. He told me, that his plans were like apps have its own coordiante "space" and resolution. So maybe you are kind of bravely fulfilling some of his original ideas :-)

hiiamboris

[10:12](#msg6379fd77bcdb0060b82dca83)Re: `=something=`. This is a decoration style I took from Gregg to make Parse expressions more readable and avoid clash of rule names and locals (though he also uses \[alternate syntax](https://github.com/red/red/blame/1e2918aa47108ceab497d8f717384c24809f1291/environment/console/help.red#L265): `=thing` for locals, `rule=` for rules, but this one I like less).  
Nenad uses \[similar style too](https://github.com/red/red/blame/1e2918aa47108ceab497d8f717384c24809f1291/environment/networking.red#L36), and I didn't see you complaining so far.

pekr

[10:13](#msg6379fde2655bc46025d62d17)Most probably because I haven't spotted it yet. But look - if it is not going to be exposed to the VID or stylesheet level, I might be OK with that ....

hiiamboris

[10:15](#msg6379fe51abfb5860bb24c961)&gt; Btw - when Amiga was for sale, Carl worked for a Viscorp company, which wanted to buy an Amiga for their set-top-box business. Was interviewing him for Amiga Review and asked about Amiga GUI. He told me, that his plans were like apps have its own coordiante "space" and resolution. So maybe you are kind of bravely fulfilling some of his original ideas :-)

Interesting! Thanks.

pekr

[10:20](#msg6379ff504fee72663c83c1d6)Amiga had some special gfx chipset features though, so not sure how it could be applicatble today. You could have draggable screens, each with its own resolution ... not sure if / how Carl's ideas were related to any such specialities. Talking cca 1994 here :-)

[10:23](#msg637a000ebcdb0060b82dce87)Btw - is there any other generally accepted non-native toolkit apart from Qt? Judging just upon the Inspector now, but Spaces seem complex enough to offer sufficient cross platform toolkit for Red. I really wonder about the general way we follow in future, especially as Android might need a bit different aproach to something like desktop. Could those GUIs coexist as modules to Red?

[10:23](#msg637a0030abfb5860bb24ccd3)In other words - am I right thinking, that for Spaces, you don't need those native OS style wrappers?

hiiamboris

[10:35](#msg637a02d8b1a75964367dcdf1)Just `base` to draw on.

greggirwin

[19:20](#msg637a7e11473cf96648f50ac0):point\_up: \[here](https://gitter.im/red/red/gui-branch?at=6379fd77bcdb0060b82dca83) I think that's only my style. I believe @dockimbel doesn't like decorations of almost any kind. I've noted a few times that the leading \*or* trailing sigil in my style is to parallel get/set word syntax and also BNF syntax.

[19:22](#msg637a7e58abfb5860bb25a5af)Flutter is probably the big name in UI frameworks now.

## Monday 21st November, 2022

hiiamboris

[10:36](#msg637b54bf4fee72663c860b3e)&gt; decorations of almost any kind

Still we have things like `and~` or `on-change*`. And `!` in `integer!` is a decoration as well IMO. I can have in one function: `space` object, `space!` charset and `=space=` rule ;)

[10:38](#msg637b5535f9491f62c9c3523b)Or `new-line` native, `new-line!` charset and `=new-line=` rule :)

pekr

[11:24](#msg637b5feca34b5112113ec6ac) Exclamation mark is a official syntax of the lexer for datatypes though :-)

greggirwin

[17:35](#msg637bb6e92cb657024039b4ee)Sigils are a variation on Hungarian Notation, and a convention we can and should leverage. But we also want to be careful with it, and try to agree on styles for common use cases.

## Saturday 26th November, 2022

luce80

[17:38](#msg63824f034fee72663c92b69f)Promotion:  
After a few hours of fighting I have hacked \[this](https://gist.github.com/luce80/433286c66d98997aff6e69fbd6323a35#file-area-plus-red)  
try it by typing this in the console:

```
do/args https://t.ly/_8Xk "test"
```

hiiamboris

[18:10](#msg638256970513b562e8cacbde)wow cool!

greggirwin

[18:14](#msg6382576fff5546644b61c2a8)Very nice @luce80.

hiiamboris

[18:14](#msg63825790426f9311ffc1f47f)found only 1 bug so far (seems line feed related):  
!\[](https://i.gyazo.com/09957b21241b9b31d3369eb664398353.gif)

[18:15](#msg638257a6326f06602c679337)shift-tab shift-tab ctrl-z ctrl-z

[18:35](#msg63825c730513b562e8cad647)I will be adding `area` to Spaces soon enough too. But I want to try to abuse `on-deep-change` for that.

luce80

[18:52](#msg63826063bcdb0060b83cd9c7)You know what reactions are, unfortunatly I don't.  
Thanks for bug report, should be fixed if I haven't screwed up something else ...  
`do/args https://t.ly/IRz0 "test"`

hiiamboris

[18:56](#msg6382614d15a3885c700baab6)seems to work now

luce80

[19:01](#msg6382627ff9491f62c9d004c6)Why the red circle do not show up ?

```
view [
	do [
		im1: make image! 100x100 
		draw im1 [fill-pen red circle 50x50 45 ] 
	]
	button "OK" im1
]
```

hiiamboris

[19:07](#msg638263e92cb657024045c521)add `? draw` there

luce80

[19:13](#msg6382657425ca105c88d40bb4)So `system/words/draw` works. Is it "by-design" or am I missing something?

hiiamboris

[19:35](#msg63826a84abfb5860bb33d725)yes, bound to the container

## Sunday 27th November, 2022

luce80

[08:30](#msg638320250513b562e8cc2a60)Wouldn't it be better to have it bound to `system/words` ?

hiiamboris

[09:42](#msg638330fd25ca105c88d56a20)better how?

dockimbel

[09:43](#msg63833138b1a75964368e4339)The binding to container's face object was introduced a long time ago (https://github.com/red/red/commit/719aeac36a90080895a67afd0783d6b95ab66dad) in order to enable `self` usage. Maybe a selective binding only binding `self` words would be better than a full block binding?

hiiamboris

[09:45](#msg638331ab473cf96648049c7c)I haven't seen `do` used much myself. I'm using `with` mostly (for the window - view/options). So hard to tell what's best for `do`.

dockimbel

[09:50](#msg638332ebf9491f62c9d16c4c)`do` is a general escape mechanism in VID for evaluating regular Red code (container-related initialization, global init code, dynamic face injection, facets calculations, ...).

luce80

[17:57](#msg6383a4fca34b5112114d9676)Now that I have shown an area caret usage example I hope that it would be possible to `set` and `get` the caret position so I could simplify my script a lot and add new features ;)

## Friday 2nd December, 2022

luce80

[18:59](#msg638a4b0fb4401f7e9a4e498b)

```
>> show [1 <a>]
== true
```

I think it should give an `error!` when elements of `block!` are not a `face!` or at least not an `object!`

greggirwin

[19:10](#msg638a4d9479e4e83468cc51b5)Worth a ticket. Easy to change as `show` is a mezzanine.

## Saturday 3th December, 2022

luce80

[10:17](#msg638b221cf0973a41eb23f050)If I drag the window's bottom border 1px up the panel height do not change, if then I drag it down 1 px the panel's height gets smaller instead of larger as if things stay 1 event behind. This gives me a wrong behavior in an other situation. Is it normal ?

```
view/flags/options [
	p: panel 100x150 blue []] [resize] [
	actors: object [
		on-create: func [face][face/data: face/size]  ; init value
		on-focus: func [face event][face/data: face/size]  ; store old size
		on-resize: func [face event][face/actors/on-resizing face event] ; forward
		on-resizing: func [face event /local siz][
			siz: face/size - face/data    ; compute size difference
			face/data: face/size          ; store new size
			
			p/size: p/size + (siz * 0x1)
		]
	]
]
```

hiiamboris

[10:20](#msg638b22daaaf0965f7c70f849)1x1 not x1?

luce80

[10:22](#msg638b23644abb3f4684a0b8b1)`panel 100x150` and `(siz * 0x1)` .

hiiamboris

[10:23](#msg638b23ba2305cb4ed708661c)https://github.com/red/red/issues/4355

luce80

[10:26](#msg638b245e8319db70990cf03e):( . It not only "hurts user experience", it gives wrong results if the algorithm is based on that. Let's hope for a fix.

greggirwin

[17:27](#msg638b86f0bdd9d94eca38e8a8)That's an old and painful bug, to be sure.

## Sunday 4th December, 2022

luce80

[09:27](#msg638c681d4cb5585f96632beb)I am not sure if I should report this since I have already done a few things base on this behaviour... but where is the red line ? :

```
>> draw 2x10 [anti-alias off pen red line 0x0 0x10]
== make image! [2x10 #{
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    }]
```

hiiamboris

[09:31](#msg638c68d5f0973a41eb2623c7)aliasing is highly platform specific

[09:32](#msg638c6930bdd9d94eca3a68c4)you can't even rely on proper rotation: https://github.com/red/red/issues/4729  
what can be said of aliasing then?

luce80

[09:48](#msg638c6ce23f353f70807f68c1)Incredible that Mac behaviour. I have wrong rotation results also for `anti-alias off` fo Win11 !! But a simple non antialiased line ... really platform specific ? If I draw it as `line 1x0 1x10` it appears (in the wrong place IMHO) but...only on Win 11 ?

hiiamboris

[09:59](#msg638c6f752305cb4ed70a9b51)I would not assume it being even driver agnostic

luce80

[11:11](#msg638c80784abb3f4684a311e6)Perhaps should be done as `line 0.5x0.0 0.5x10.0` if only there were float `pair!`s ?

hiiamboris

[11:22](#msg638c83002305cb4ed70abe3e)that should be more reliable, yes

## Monday 5th December, 2022

planetsizecpu

[14:15](#msg638dfd0585045441f8b2effd)Today discovered a flawn on L23 while testing the game on a distinct CPU, the teleporter doors Z index where greater than the gold bags one, so they where unrecoverable when dropping over, now it's ok.

[14:16](#msg638dfd32f07f3970c05e4d7f)\[!\[cavetest233.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/Op6X/thumb/cavetest233.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/Op6X/cavetest233.gif)

## Tuesday 6th December, 2022

mikeyaunish

[00:07](#msg638e87b285045441f8b40482)I have noticed a change in behaviour. Just checking to see if this is just a correction. It seems a VID style now collides with the same named function. Is this now correct behaviour?

greggirwin

[00:41](#msg638e8fd3280bbe4693c45c5a)Can you post an example @mikeyaunish ?

## Wednesday 7th December, 2022

mikeyaunish

[04:28](#msg6390168b0c89e71a33694493)

```
new-fun: does [ print "new-fun" ] 
view [
    style new-fun: field "field1"
    button1: button "? new-fun" [? new-fun]
]
```

[04:29](#msg639016a489c38775e74d647a)Different results from June 2022 version of Red

greggirwin

[04:32](#msg6390176ea8211f623d6f5d49)Reproduced. The style now shadows the function. @dockimbel @qtxie by design?

dockimbel

[11:05](#msg63907387967c83058421a516)Not by design. Could be a side-effect of the changes made a few months ago for early setting the face labels in VID.

[11:23](#msg639077ae0c89e71a3369fa8a)Fix pushed.

greggirwin

[15:18](#msg6390aecc2b937b1a2ead9350):+1:

mikeyaunish

[20:15](#msg6390f4474a6ed5138347f697)Nice work guys.

## Thursday 8th December, 2022

luce80

[09:49](#msg6391b3368bdea01368a72e44)

```
view [tab-panel blue ["1" [origin 0x0 base sky "abc"]]]
```

Is there a way to avoid seeing the blue background ?

hiiamboris

[09:59](#msg6391b57b69ce3c53381a70d8)looks like some bug

luce80

[10:01](#msg6391b611a8211f623d726077)Let's call it "unimplemented feature" ? (Or is it implemented and I am missing something?)

hiiamboris

[10:23](#msg6391bb2e967c8305842412e6)I have no idea where the extra spacing comes from, and I don't think it should be there

bubnenkoff

[15:00](#msg6391fc140c89e71a336cd963)&gt; I have no idea where the extra spacing comes from, and I don't think it should be there

Oh! I thought I am again missed something) I have same problem)

[15:02](#msg6391fc838bdea01368a7c219)&gt; Today discovered a flawn on L23 while testing the game on a distinct CPU, the teleporter doors Z index where greater than the gold bags one, so they where unrecoverable when dropping over, now it's ok.

Hi! Could you show source code game of sprites? it's gif or it's red code?

hiiamboris

[15:04](#msg6391fcff4a6ed5138349db69)@bubnenkoff https://github.com/red/red/wiki/\[LINKS]-Projects-showcase-(links-to-remember) the "Cave-In" one

[15:07](#msg6391fd99a8211f623d72f0ce)@luce80 I believe your undoable area belongs there too ;)

luce80

[15:21](#msg639200e9a1ba3e75d8e9db6c)@hiiamboris is it ? Isn't it an OS widget limitation ?  
What about this? tab-panel background is \*red* and should be \*partially* covered by a green panel, but when you close the 1st window ...

```
win: layout [
	size 400x300
	tb: tab-panel red [
		"1" [origin 0x0 a: base 100x100 sky "abc"]
		"2" [origin 0x0 b: base 10x10 magenta "zzc"]
	]
]
tb/pane/1/color: green
tb/size/x: tb/size/x + 200
tb/pane/1/size/x: tb/pane/1/size/x + 50

a/size: a/parent/size
view win
a/size: a/parent/size
view win
```

hiiamboris

[15:28](#msg63920281967c83058424a960)Quite hard to follow code :/

[15:29](#msg639202ccb9b687534185a0e1)I guess inner panel gets automatically resized to tab-panel size on your 1st `view` (so next `a/parent/size` is different)

[15:29](#msg639202e7a8211f623d72f91a)But not when you change the tab-panel size directly

[15:30](#msg6392030c2b937b1a2eb00cd7)Could be by design.. @qtxie @dockimbel

[15:31](#msg6392034b89c38775e75117e8)Looks real weird to me.

dockimbel

[15:40](#msg63920560b9b687534185a526)The code and descriptions are confusing... E.g.: "tab-panel background is red and should be partially covered by a green panel" =&gt; the red and green panels are not even on the same tabs...

luce80

[15:40](#msg6392057507ac190597e2f979)There are 2 bad things. Tab-panel has red background and has 2 sub-`panel`s. 1st panel is "post"-colored green (since it cannot be colored by `VID`), then tab-panel is enlarged and 1st sub-`panel` is enlarged less. The idea was to be able to distinguish among tab-panel, 1st sub-panel and its `base` content. Hoping that I can fill the sub-panel I enlarge the base to have the size of its parent panel but nothing seem to happen but at a second try it and its pane get the size of the tab-panel ! (Which was the final result I wanted ;) )

hiiamboris

[15:44](#msg639206754a6ed5138349ed11)&gt; nothing seem to happen

Not true. You changed panel's size from 109x111 to 159x111. Just make it `+ 200` and you get the wanted result.

dockimbel

[15:46](#msg639206cf865cc926ae4f9573)

```
lisp
>> dump-face win
 Type: window Style: none Offset: none Size: 400x300 Text: none
     Type: tab-panel Style: tab-panel Offset: 10x10 Size: 313x136 Text: none
         Type: panel Style: panel Offset: 11x35 Size: 159x111 Text: none
             Type: base Style: base Offset: 0x0 Size: 159x111 Text: "abc"
         Type: panel Style: panel Offset: 11x35 Size: 109x111 Text: none
             Type: base Style: base Offset: 0x0 Size: 10x10 Text: "zzc"
>> view win
>> dump-face win
 Type: window Style: none Offset: 1080x570 Size: 400x300 Text: "Red: untitled"
     Type: tab-panel Style: tab-panel Offset: 10x10 Size: 313x136 Text: none
         Type: panel Style: panel Offset: 2x22 Size: 307x110 Text: none
             Type: base Style: base Offset: 0x0 Size: 159x111 Text: "abc"
         Type: panel Style: panel Offset: 2x22 Size: 307x110 Text: none
             Type: base Style: base Offset: 0x0 Size: 10x10 Text: "zzc"
```

[15:47](#msg63920725865cc926ae4f961b)I remember that the panels in a tab-panel should be auto-sized to fit the whole widget dimensions, though I don't remember where we do that. Anyway, you should not try to change the size of those background panels, as they are part of the widget. They are there to provide a container and a background for each tab. Ah found the \[place](https://github.com/red/red/blob/master/modules/view/backends/windows/tab-panel.reds#L221) where the auto-sizing happens.

luce80

[15:55](#msg639209022b937b1a2eb01959)The auto-sizing seems to happen too late, otherwise I wouldn't try to change the size myself :)

hiiamboris

[15:57](#msg6392095d0c89e71a336cf2ca)So my hypothesis about the unwanted spacing above:  
\- VID assigns panel and tab-panel size according to it's own `svm/paddings` value and content size  
\- View changes panel size upon rendering to the real non-client metrics reported by the OS (which will be font-dependent too)  
\- the discrepancy between the two results in the unwanted spacing and asymmetry

[16:03](#msg63920acdb9b687534185b03f)I suppose catch-22 is that VID doesn't yet show anything, but OS won't let you know the metrics until you do show it.

dockimbel

[16:06](#msg63920b7c865cc926ae4f9e53)The issue seems to be with this line: `tb/size/x: tb/size/x + 200`. The reactivity model for such deep set-path on multidimensional scalar values has been changed to trigger a `change` event instead of a `deep-change` previously. The logic for tab-panel in View engine was not updated to account for that.

hiiamboris

[16:08](#msg63920c0483b5463b6ef339d9)I'm trying a reactive approach: `view/flags [tab-panel ["1" [at 0x0 panel blue [] react [face/size: face/parent/size]]] react [face/size: face/parent/size - 20]] 'resize` but seems like tab-panel's internal panels are fixed and nothing updates them after the initial display.

[16:11](#msg63920ca507ac190597e3083d)Working solution is a mess: `view/flags [tab-panel ["1" [at 0x0 panel blue [] react [face/size: face/parent/size]]] react [old: face/size face/size: face/parent/size - 20 foreach f face/pane [f/size: f/size + face/size - old]]] 'resize`

dockimbel

[16:38](#msg639212f40c89e71a336d05b8)You can open a ticket for it, just simplify the code to the minimum required to show the wrong behavior.

hiiamboris

[16:44](#msg63921472a1ba3e75d8ea0271)ok

[16:54](#msg639216b189c38775e751419a)@dockimbel I opened https://github.com/red/red/issues/5252 about panel size propagation. Should I also open design ticket about VID not having enough info for proper initial sizing?

dockimbel

[16:56](#msg63921741a151003b5a5ca12b)I'm not sure what you are referring to. Do you have a simple example of that?

hiiamboris

[16:57](#msg6392179489c38775e751433d)`view [tab-panel magenta ["1" [origin 0x0 base cyan]]]`

[16:58](#msg639217b5a151003b5a5ca244)i.e. the original issue

[16:58](#msg639217b80c89e71a336d113d)!\[](https://i.gyazo.com/0a3a3a174c0b1120e801ebd716f3f33a.png)

[16:59](#msg639217ed83b5463b6ef3519e)theorized here :point\_up: \[December 8, 2022 6:57 PM](https://gitter.im/red/red/gui-branch?at=6392095d0c89e71a336cf2ca)

dockimbel

[19:39](#msg63923d64967c830584251c45)OK, I see it now. I'll have a look at it tomorrow.

## Friday 9th December, 2022

planetsizecpu

[07:28](#msg6392e39ddbde086250d55be5)&gt; &gt;  
&gt; Hi! Could you show source code game of sprites? it's gif or it's red code?

It is Red code using png files as sprites @bubnenkoff

## Sunday 11st December, 2022

luce80

[09:34](#msg6395a41189c38775e757b3e5)Promotion:  
After a few hours of fighting I have made \[this](https://gist.github.com/luce80/433286c66d98997aff6e69fbd6323a35#file-splitter-red)  
try it by typing this in the console:

```
do/args https://t.ly/_8Xk "test"
```

[09:41](#msg6395a5b6967c8305842b394f)Better not to try it with `tab-panel`s. ;) . If you dare to try it with transparency \*\*PLEASE SAVE ALL YOUR WORK FIRST\** ;((

hiiamboris

[10:52](#msg6395b66b4a6ed5138350b9b3)wow really that dangerous?

luce80

[11:00](#msg6395b8363daaa326ba7ca12b)Yes, not a simple crush, It will freeze also the mouse pointer. (on Win11 at least)

hiiamboris

[11:01](#msg6395b86c2b937b1a2eb6d8af)but what do you mean trying it "with transparency"?

[11:02](#msg6395b8b183b5463b6ef9fae2)also what changed in it since your previous promotion?

[11:03](#msg6395b9020c89e71a3373c7fc)link seems to load area, not splitter

[11:03](#msg6395b916a151003b5a634ac1)I'll run it the old way

luce80

[11:04](#msg6395b95969ce3c533821d257)Using alpha channel, assigning e.g. 255.0.0.100 to a `base` face.

This promotion is about the added `splitter`, that causes the nasty problem.

```
do/args https://t.ly/92qy "test"
```

hiiamboris

[11:08](#msg6395ba1ca8211f623d79c191)buttons seems a bit undercut:  
!\[](https://i.gyazo.com/caca4f5ffccca7a42081a1b629b8870e.png)

[11:08](#msg6395ba2807ac190597e9c717)even if resized:  
!\[](https://i.gyazo.com/662b14b167eaf37d6037016561a44614.png)

[11:09](#msg6395ba514a6ed5138350c0c0)also it isn't clear how proportional/fixed/etc width is different from the demo itself

[11:11](#msg6395bafa4a6ed5138350c195)

[11:13](#msg6395bb6ea8211f623d79c525)no that's right, no crashes with transparency on W10 `Red 0.6.4 for Windows built 9-Dec-2022/10:12:47+03:00 commit #ce6e33c`

luce80

[11:18](#msg6395bc77a1ba3e75d8f095d7)I was waiting for you noticing buttons undercut ;) . Even if your 1st button is more undercut then mine (!?). I think it is not my fault and I am not sure if I should make exeptions for these widgets. Can I reliably rely on system/view/metrics/margins ?

&gt;width is different from the demo itself

Which demo ?

Can you try transparency after uncommenting `;view-resize` at bottom of script please ? Have you saved your work ;) ?

hiiamboris

[11:42](#msg6395c20c3daaa326ba7cb0e2)I'm risky :)

[11:42](#msg6395c215a8211f623d79d21e)But yeah I tried uncommenting view-resize as well.

[11:42](#msg6395c24089c38775e757e5fa)&gt; Which demo ?

Splitter demo, "Simple" layout. 3 bases to the left, I don't see how their behavior is different.

luce80

[13:06](#msg6395d5df69ce3c533822041f)`Red 0.6.4 for Windows built 10-Dec-2022/17:23:09+01:00 commit #f120d1c`  
on Win11 this crushes hard when I move the separator.

```
view [
	size 300x300
	spl: splitter green [
		space 7x7
		below
		base 255.255.255.50 1x50 "face 1" ;FIXME: Red nasty bug if transparency is used
		base 100x100 "face 2"
	] options [second-min-size: 50 flags: [separator]]
]
```

I will try to isolate the problem if I can.  
&gt;I don't see how their behavior is different.

Align the 2 bottom bases separators to the top one and then try to resize the window and you should see the difference.

hiiamboris

[13:41](#msg6395de023daaa326ba7ce1e3)Understood, thanks.

[13:46](#msg6395df45dbde086250dac461)Confirmed, last sample added to the bottom of the script totally froze W10 after 4-5 moves of the splitter. But I tried 2-3 times before that and it worked fine. Guess one just has to be persistent.

[13:48](#msg6395dfaf4a6ed513835105ed)&gt; I will try to isolate the problem if I can.

Would be awesome ;)

luce80

[16:56](#msg63960bb8a1ba3e75d8f12b19)I hope I have isolated it enough. \*\*SAVE ALL YOUR WORK FIRST\** and then drag the red box up and down rapidly:

```
view  [
	below
	base 0.255.0.50 50x50 "face 1" ;FIXME: nasty bug if transparency is used
		react [face/size/y: b/offset/y]
	b: base 255.0.0 100x10 loose ; all ok if transparency is used also here (!!)
	base 100x100 "face 2"
		react [
			face/size/y: face/parent/size/y - b/offset/y - b/size/y
			face/offset/y: b/offset/y + b/size/y
		]
]
```

Removing the gray face and its sizing or adding transparency also to the red face (!!) gives no problem.  
I can provide a non reacting version if it helps.

hiiamboris

[17:04](#msg63960d9ba1ba3e75d8f12e20)Best if you provide non-interactive version that changes offset e.g. million times and quickly disposes of the PC :)

[17:08](#msg63960e78a1ba3e75d8f12fbc)So bug cannot be triggered using only 2 bases? Need 3?

luce80

[17:12](#msg63960f96865cc926ae56f502)Need 3.  
I tried a non-interactive version starting with this but with no luck. Can you try at it ?

```
view  
[
	below
	base 0.255.0.50 50x50 "face 1" ;FIXME: nasty bug if transparency is used
	base 255.0.0 100x10 loose
		extra object [origin: 0]
		with [
			actors: object [
				on-drag-start: func [face event] [
					face/extra/origin: face/offset/y
				]
				on-drag: func [face event /local delta face1 face2] [
					delta: face/offset/y - face/extra/origin
					face1: face/parent/pane/1
					face2: face/parent/pane/3

					face1/size/y: face1/size/y + delta

					face2/size/y: face2/size/y - delta
					face2/offset/y: face/offset/y + face/size/y
					face/extra/origin: face/offset/y
				]
			]
		]
	base 100x100 "face 2"
]
```

hiiamboris

[17:17](#msg639610b269ce3c53382271b0)Hate reboots :) but ok I'll give it a few tries

[17:34](#msg639614b30c89e71a33746fe0)OK this explosive is \*\*SELF-DETONATING\*\*:

```
Red [needs: view]
view/tight/no-wait [
	below
    b1: base 0.255.0.50
    b2: base 255.0.0
]
loop 5000 [
	b1/size/y: b2/offset/y: random 100
	loop 5 [do-events/no-wait]
]
```

\# 🧨💥☠

[17:34](#msg639614bb89c38775e7587aaa)2 bases are enough, 1 is not.

[17:35](#msg639614d60c89e71a33747033)Life expectancy is about 3 seconds.

[17:37](#msg6396154b69ce3c5338227a0d)I wonder if it's even a Red bug (clearly not only Red, but if Red has a bug at all)...

[17:49](#msg6396181d8bdea01368af4f29)https://github.com/red/red/issues/5253

luce80

[18:09](#msg63961cdea8211f623d7a74bb)It would be nice to replicate it with another language to see if it is Red related or not. I tried to probe the numbers and if console opens over the window fast enough no detonation happens but if you then uncover the window...Ca-boom !

pekr

[19:44](#msg63963323a151003b5a6423df):-)

dsunanda

[20:03](#msg63963782a1ba3e75d8f1782b)@hiiamboris I noted (rather than reported) a similar OS hang when resizing Red windows by hand. At the time, I simply lamented it as a likely Lenovo / Win 11 driver bug.

Can't find that discussion -- Gitter search is beyond me.

I can still get the failure....My workaround is not to resize on Win11. Never seen the problem on another machine.

## Monday 12nd December, 2022

guibus

[23:00](#msg6397b29069ce3c53382593ee)Hi everybody. I don't know if it's the right place to write about my problem, but. I'm currently re-writing an old rebol program manipulating image. to make it succint, I used a box to draw a part of my image (millions of images) exactly to the correct position using offset and sizing, and finally I save this image using the save/png of my boxand it ran correctly.

[23:00](#msg6397b29eb9b68753419031cb)rebol code : imgbox/effect/draw: copy \[]  
append imgbox/effect/draw reduce \['image neworigin img]  
imgbox/size: newimgsize  
show imgbox

save/png newfile make image! imgbox

[23:01](#msg6397b2cb865cc926ae5a0c18)but when trying make image! imgbox, it return non!.

[23:02](#msg6397b30483b5463b6efdac33)so is there a method red to save the image of an element that is calculated via draw ?

[23:03](#msg6397b33e4a6ed513835475e9)if no, is there a way to extract a portion of an image knowing the pairs or coordinates to get a new smaller image ?

[23:03](#msg6397b34aa8211f623d7d8331)thank you for your answer.

## Tuesday 13th December, 2022

Oldes

[01:18](#msg6397d2fa2b937b1a2ebac9cc)I am not sure if I follow you well, but you just want to resize an image?

ldci

[04:03](#msg6397f99eb9b687534190b081)@guibus . You can use to-image imgbox before saving. You’ll find here : https://github.com/ldci/redCV a lot of functions for image processing :)

## Wednesday 14th December, 2022

guibus

[15:30](#msg6399ec22967c83058433416f)@ldci thanks François, I'll give it a try. I saw and tried your library, but as I already had developped my script more than 10 years ago, I thought it was easier to rewrite it in red, considering the similarities.

[15:31](#msg6399ec5b07ac190597f1c640)@oldes Yes, that's the point. I know how to resize it, but not how to save the content in a file.

[15:32](#msg6399ec7e865cc926ae5e4dfa)@Oldes thanks for helping

Oldes

[15:58](#msg6399f28c83b5463b6e01f26c)@guibus saving is easy:

```
>> save %file.png make image! 200x200

>> load %file.png
== make image! [200x200 #{
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FF...
```

guibus

[16:00](#msg6399f33bb9b6875341948280)@ldci actually my problem is very simple : I have 2 bits image of scans with surrounding white but not necessary clean, with some black pixels of noise. I want to make a new image computed from the boundary box of the scan, and it was working well in rebol. Your library is very complete, is there a bounding box function in redcv ? thanks

ldci

[16:11](#msg6399f5c789c38775e75feed1)@guibus Have a look to samples/image\_transformation examples:)

guibus

[16:12](#msg6399f5eca1ba3e75d8f8996c)@Oldes saving an image is not a problem. it is to make an image from a box that uses draw that is a problem in red. probing imgbox gives none to imgbox/image and /parent/pane/image contains the original image, not the resized one. imgbox/size gives me the correct size, but no image of the drawn imgbox seems to be created. my question is : how do I get an image of what is displayed in the window or the box with the draw \[image ...] command ?

[16:12](#msg6399f605865cc926ae5e6298)@oldes again, it worked perfectly well in rebol.

[16:13](#msg6399f61d0c89e71a337bcae1)@ldci thanks!

hiiamboris

[16:16](#msg6399f6e9dbde086250e2a268)I would advise against saving what is displayed on the GUI face, as it is likely going to be scaled/distorted.

[16:16](#msg6399f6fb4a6ed5138358c5f3)Just use the `draw` standalone function.

[16:17](#msg6399f71d0c89e71a337bcd23)Draw dialect is \[documented](https://github.com/red/docs/blob/master/en/draw.adoc#image)

[16:19](#msg6399f77d89c38775e75ff1b1)If you want to autodetect crop size you'll need something from @ldci library. Standard Red won't help (not fast enough anyway).

ldci

[16:22](#msg6399f83d3daaa326ba84a84b)@guibus. here is an example of how saving a box :

```
#!/usr/local/bin/red
Red [needs: view]
myshape: [
	move 10x10 ; puts pen at 10x10
	'hline 30 ;horizontal line to coordinate X =30
	'vline 30 ;vertical line to coordinate Y = 30
	'hline 30 ;horizontal line 30 pixels long (longer than hlineabove)
	'vline 30 ;vertical line 30 pixels long
	'hline -50 ; just to show the use of RELATIVE negative lenghts
	; shape dialect will close the shape now
]
view compose/deep/only [
	bb: base draw [shape (myshape)]
	button "Save" [img: to-image bb save %test.png img]
]
```

[16:23](#msg6399f87d967c830584335c82)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/bdc6/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/bdc6/image.png)

guibus

[17:06](#msg639a027e0c89e71a337be66e)@ldci wow, I'm onto something. when using the save button it works perfectly on my program, but if the window is closed img/image returns none. Is it something normal or is it a bug ? because in this program in rebol I never displayed a view, everything in rebol happened in the layout. With red it seems I have to display the view and save inside the vied. Is there a way to avoid that because I have hundreds of thousand of images (scans of pages of tibetan text) to compute ? thks

ldci

[17:29](#msg639a07f54a6ed5138358e6c9)@guibus

```
#! /usr/local/bin/red

Red [
	Title:	"Red window & screen capture VID demo"
	Author:	"Qingtian Xie"
	File:	%face-to-image-vid.red
	Tabs:	4
	Needs:	'View
	Rights:	"Copyright (C) 2016 Qingtian Xie. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

view [
	title "Simple Capturing demo"
	style btn: button 100x40
	pad 30x0
	btn "Capture Self" [
		img: to-image face
		canvas/draw: reduce ['image (img) (canvas/size - img/size / 2)]
	]
	btn "Capture Window" [
		img: to-image face/parent
		canvas/draw: reduce ['image (img) 0x0 (canvas/size)]
	]
	btn "Capture Screen" [
		img: to-image system/view/screens/1
		canvas/draw: reduce [
			'image (img)
			0x0 canvas/size
		]
	]
	return
	canvas: image 400x330
]
```

Oldes

[17:39](#msg639a0a618bdea01368b6cc90)@guibus if you just need to crop an image, you may use `copy/part`:

```
img: make image! 100x100
copy/part at img 2x2 20x20 ;; will create an image of size 20x20 from the original position 2x2
```

ldci

[17:42](#msg639a0af42b937b1a2ebf1ebb)@Oldes . Good point :)

guibus

[17:54](#msg639a0dec83b5463b6e022bd5)@Oldes thank you so much! so simple ! worked perfectly!

dsunanda

[18:00](#msg639a0f2b3daaa326ba84d546)@guibus (millions of images)  
Please take care with Red if you are LOADing more than a few thousand images.....Red has no real garbage collection for images and (being still 32-bit) can rapidly run out of memory.

For the time being, you may want to shell-out to Rebol code to tweak the images.

The code below is an example of a failure:

```
unview/all
im-1: make image! view/no-wait compose [box 500x500 red (copy/part mold system 1200)]
save/as %im-1.png im-1 'png
im-2: make image! view/no-wait compose [box 500x500 blue (copy/part mold system 1200)]
save/as %im-2.png im-1 'png

unview/all
view/no-wait [ib: image 500x500]
repeat n 2000 [
   print n
   ib/image: load %im-1.png
   ib/image: load %im-2.png
   recycle
   ]

1528
1529
1530
1531
*** Internal Error: not enough memory
*** Where: ???
*** Near : show self
```

guibus

[18:17](#msg639a133807ac190597f217b7)@dsunanda thanks for the info, good to know. as for rebol, I can't make it work correctly, it crashes, so i'm stuck to red. :)

[18:19](#msg639a13aa3daaa326ba84e079)as I work per volume, and a volume never reaches 1000 pages, running a script in a new session for each volume will not be a major problem. thanks.

dsunanda

[18:29](#msg639a161ab9b687534194c513)Glad you've got a work-around.

Oldes

[18:36](#msg639a179b8bdea01368b6e68b)@guibus you may try my \[Rebol version](https://github.com/Oldes/Rebol3)

guibus

[23:17](#msg639a5999a8211f623d829a5e)@Oldes thanks. I thought rebol was a dead project.

## Thursday 15th December, 2022

ldci

[04:28](#msg639aa2570c89e71a337d0ed4)@Oldes Thanks for the 3.10.2 version :)

## Friday 16th December, 2022

planetsizecpu

[09:21](#msg639c3897b9b687534198b8cb)Welcome btw @guibus

## Saturday 17th December, 2022

guibus

[12:21](#msg639db42f865cc926ae653e70)@planetsizecpu thanks.

[12:21](#msg639db449a8211f623d88c08c)@Oldes is there an exe available ?

ldci

[12:26](#msg639db56007ac190597f8b31b)@guibus. Here: https://github.com/Oldes/Rebol3/releases/tag/3.10.2

## Sunday 25th December, 2022

luce80

[08:44](#msg63a80d803b37dd2c114a1e80)Promotion:  
After many hours of fighting I have made \[this](https://gist.github.com/luce80/433286c66d98997aff6e69fbd6323a35#file-scroller-panel-red)  
try it by typing this in the console:

```
do/args https://t.ly/yk__x "test"
```

hiiamboris

[10:11](#msg63a821ef0dba35742344ceb5):+1:

[10:31](#msg63a8267abe2c3c20c71953c9)is it single-child only?

luce80

[10:59](#msg63a82cf6ff1fd121b3137911)Yes single-child, the idea is that its child can be a panel, although I liked also your idea of having an "auto-visible" focused face, but it's hard to implement...

hiiamboris

[11:00](#msg63a82d6151d2482e91d80a01)just I don't know if should be called a panel if it's single-child :)

[11:01](#msg63a82d980dba35742344e23b)&gt; "auto-visible" focused face

not sure what you are referring to  
in my scrollpanel I just measured the span of all children and then decided if scrollers are to be or not to be :)

luce80

[11:06](#msg63a82ea6c4fec572d6539b1f)Good point. "Single-child-scrolling-panel" is better ;) ? "Scrollable-base-that-I-had-to-use-a-panel-instead" also ;) ?  
&gt; "auto-visible" focused face

And what about the "scroll-to-face" function ?

hiiamboris

[11:42](#msg63a8371fff1fd121b3138a26)Ah that. Got you.

[11:42](#msg63a837397de82d2616f99f02)It's good for tabbing.

[11:43](#msg63a8376c378d512c182ebea4)On name: scrollable-child?

## Tuesday 27th December, 2022

luce80

[18:09](#msg63ab34e440557a3d5c4a24d0)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/jxFS/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/jxFS/image.png)

[18:09](#msg63ab34f4378d512c1833de84)Here I am with a few new "glitches" to examine.  
\- It would be nice to have a `find-window` function. It's very easy to implement and quite handy at times.  
\- `set-focus` does not work on `panel` which I use to make compound widgets, so I can not forward `on-focus` to a sub-face.  
\- Is this "intended behaviour" ?

```
view [
	below
	text green "a string with one line"
	text yellow "a string^/with two lines"
	button "OK"
]
```

hiiamboris

[18:39](#msg63ab3bddbe2c3c20c71ec7cc)I don't know an OS where `panel` can be focused.

[18:49](#msg63ab3e493b37dd2c114fb69e)https://github.com/red/red/issues/2503

[18:51](#msg63ab3e9b40557a3d5c4a368c)but it's another regression

## Thursday 29th December, 2022

luce80

[18:59](#msg63ade37d63c9fc72d30225c3)If you do not want to call it `panel` call it `compound-face-which-is-a-base-with-a-pane-with-some-faces` . I think the wish is legit, unless you provide me with a different solution.

hiiamboris

[19:08](#msg63ade5a33b37dd2c1154672b)We all may have our wishes, but OS developers don't usually listen to us :)

luce80

[19:16](#msg63ade785ff1fd121b31d9563)OS developers surely do not listen to us but a focusable "compound" \*Red* `face` is so strange ?

hiiamboris

[19:18](#msg63ade8213b37dd2c11546b0e)How do you envision it would work on OS level?

greggirwin

[19:20](#msg63ade87bc4fec572d65dc83b)Compound faces are important, but not portable. e.g. Windows ListView isn't available elsewhere, so we do have to roll our own. What we need to do is design a model for how they work, so we can share them.

luce80

[19:39](#msg63adece87de82d261603ad04)I do not mind the OS level, a `panel` is (or not?) a `face` and a `face` should be focusable. I would use a `base` if that provided the same functionality of a `panel`. The OS should not know what I am doing with the `face`just provide key input for whatever it is and continue to use `window/selected`and give `on-focus` and/or keyboard events to it.

## Friday 30th December, 2022

luce80

[18:20](#msg63af2bfdd8678973f98bf07e)Promotion:  
After a few hours of playing I have made \[this](https://gist.github.com/luce80/89be16a8d0a3031b41cc49795e6e20b4#file-action-requesters-red)  
try it by typing this in the console:

```
do/args https://t.ly/30y_ "test"
```

hiiamboris

[18:28](#msg63af2dd4410c633d4800b7b2)Button glitch:  
!\[](https://i.gyazo.com/b25a5139080d3f64ecb3b81f5c3fd367.png)

[18:29](#msg63af2decbe2c3c20c725d701)Also `!` is a little misaligned:  
!\[](https://i.gyazo.com/dab729f7ccd45cf70d3c6027a0e6c30f.png)

[18:29](#msg63af2e1463c9fc72d3045d1a)And should first dialog close by itself? It appears for a second then goes away.

[18:31](#msg63af2e847de82d261605e535)Other than that looks fine!

greggirwin

[18:43](#msg63af31530cd40c2e89b19f13)Very nice @luce80 ! Yours look nicer than \[mine](https://gist.github.com/greggirwin/9cd640ca42bdfd56c5ff4432c4765d2c) which is pretty badly broken now.

luce80

[18:46](#msg63af320d63c9fc72d3046352)Thanks for testing.  
Button glitch is the way Windows shows a focused button ;)  
Misalinement is probably due to not beeing able to use float pair!s but should be tested also on other platform (to see even worse misalignement ;)  
Yes, first dialog has a timeout , that you tested to work ;)  
@greggirwin thank you for your version from which I started :)

greggirwin

[18:55](#msg63af34328f8df4262acc7ee8):+1:

hiiamboris

[18:58](#msg63af34df51d2482e91e480c5)&gt; Button glitch is the way Windows shows a focused button ;)

I think it should show "Yes", not "Ok" (besides correct spelling is "OK")

luce80

[19:05](#msg63af36683b37dd2c1156bb99)Thanks, I have corrected the spelling.
