# Archived messages from: [gitter.im/red/red/code](/gitter.im/red/red/code/) from year: 2017

## Thursday 12nd January, 2017

dockimbel

[08:00](#msg587737a5dec171b811db5a7f)@geekyi Thanks!

## Thursday 26th January, 2017

maximvl

[10:09](#msg5889cadc11e7a7f61de99871)http://tech.marksblogg.com/billion-nyc-taxi-kdb.html

[10:09](#msg5889cae0c19662f153918a4a)check this out guys

[10:09](#msg5889caedcbcb281770bacee4)at some point would be nice to have this as DSL :P

geekyi

[17:03](#msg588a2bd0c0f28dd86248ccfc)@maximvl  
&gt; at some point would be nice to have this as DSL :P

Are you referring to `kdb/Q`? My \*opinion* is \[J](http://www.jsoftware.com/help/dictionary/vocabul.htm) has a better api for a DSL  
I find J useful at times. Haven't tried kdb/Q tho

greggirwin

[18:06](#msg588a3a9ffba5bfea0691d4d9)I did a partial kdb wrapper many years ago. Can't remember what issues I hit, but if someone wants to make a new one, I can dig mine out.

## Wednesday 1st February, 2017

Oldes

[16:57](#msg5892137f5309d6b3589630cb)@dockimbel I have so far very simple

```
Red
```

binding to my old \_ImageMagick_

```
Red/System
```

binding... so far just as a prove of concept... where I can use code like this in console:

```
Magick/do [
	Read  %opice.png
	AdaptiveBlur 16.0 4.0
	Charcoal 16 4
	Write %opice.jpg
]
```

should I submit it to

```
Red/Code
```

repository and if so, do you have any more concrete idea how the structure should look like?

[16:58](#msg589213a21e4d4bd962bfe03a)Above code makes from this picture:

[16:58](#msg589213c62ff29dec06647ae9)\[!\[opice.png](https://files.gitter.im/red/red/code/26EW/thumb/opice.png)](https://files.gitter.im/red/red/code/26EW/opice.png)

[16:59](#msg589213d52ff29dec06647b6a)this picture:

[17:00](#msg5892142ffba5bfea06b7557f)\[!\[opice.jpg](https://files.gitter.im/red/red/code/vVda/thumb/opice.jpg)](https://files.gitter.im/red/red/code/vVda/opice.jpg)

[17:06](#msg589215a55309d6b358963f6c)Also... the old binding (still working btw.) is in the

```
Red
```

repository... https://github.com/red/red/blob/master/system/library/lib-iMagick.reds so I'm not sure, if it is ok there - it would be duplicated if used in

```
Red/Code
```

too.

rebolek

[17:11](#msg589216c01e4d4bd962bff3d1)@Oldes that is wonderful, but can I make the first picture from the second one? That would be much more useful to me, because that looks like (almost, it is bit better) my drawing.

Oldes

[17:13](#msg589217292ff29dec06649244)It is just a random effect with random values, which I used for testing... and no.. it is not possible to do reverse.. it would be too powerful magic of course.

rebolek

[17:14](#msg589217682ff29dec066493dc)of course, but it is image\*\*magic\*\*k, you know...

Oldes

[17:14](#msg589217862ff29dec066494f2)I have many questions regarding my work, but don't know where to ask them.. for example, what if I want to define own error message?

rebolek

[17:19](#msg589218904c04e9a44e5a85ce)IMO it is possible, but I am not able to find the source right now.

Oldes

[18:21](#msg58922711fba5bfea06b7d172)I wonder if there is any simple way how to document dialects in somehow standard way?

[18:22](#msg5892277c2ff29dec06650063)I'm still not much sure, if using DSL is better than providing direct \_routine_ mapping to the methods.

rebolek

[18:23](#msg5892279b4c04e9a44e5aea36)DSL is of course safer.

[18:26](#msg5892283ee836bf7010bbe7ce)Documenting dialect is indeed very interesting area.

[18:27](#msg5892287efba5bfea06b7da01)But we have header that is underused.

greggirwin

[18:29](#msg5892291cfba5bfea06b7dcfc)When wrapping libs, I often have layers. First is the Redbol mapping directly to functions, sometimes helpers on top of that where datatypes are coerced and errors may be mapped, and a dialect at the highest level.

[18:53](#msg58922ebe1e4d4bd962c08d30)I can't find my notes right now, but I like text interfaces that guide you, and have thought of how to design that into dialects. For example `fsutil`, when given incomplete commands, gives you a list of what could come next, or an exact example when only one element is missing.

Oldes

[22:00](#msg58925a6efba5bfea06b91dce)@greggirwin I don't know how to use own error message and have to decide if is better generic

```
invalid-data
```

or

```
invalid-arg
```

message, so some guides are quite far away from my reach now.

[22:05](#msg58925b975309d6b3589804fb)Also while I'm still not sure with the dialect, I'm working on it instead of direct mapping to Red (which could be easily generated) as I don't like the code which it needs.. like in this old Rebol script, which is quite important for me btw - https://github.com/Oldes/rs/blob/master/projects/texture-packer/latest/texture-packer.r#L36

[22:06](#msg58925bf1fba5bfea06b926fb)I could write this function easily in

```
Red/System
```

so no need to have it in higher

```
Red
```

layer. Making Red dialect is more fun.. when I imaging that I could plug in some GUI for it.

[22:08](#msg58925c46fba5bfea06b929fa)But designing dialect is definitely not easy if it should be intuitive and usable. But I am learning new things at least.. mostly diving into

```
view
```

module sources.

## Thursday 2nd February, 2017

geekyi

[07:42](#msg5892e2fa5309d6b3589a4ef0)&gt; I wonder if there is any simple way how to document dialects in somehow standard way?

A feature for self documenting dialects would be useful, just like `func` is self-documenting now

## Tuesday 7th February, 2017

Oldes

[19:53](#msg589a25aeaa800ee52c65923b)I pushed my ImageMagick binding (still work in progress) here: https://github.com/red/code/pull/11

rebolek

[20:01](#msg589a27969eb1bd81481bf217):+1:

greggirwin

[20:48](#msg589a328021d548df2cdc0fbb)+1

## Saturday 11st February, 2017

maximvl

[11:22](#msg589ef3efaa800ee52c7f831e)\[!\[haiku.PNG](https://files.gitter.im/red/red/code/PtNg/thumb/haiku.png)](https://files.gitter.im/red/red/code/PtNg/haiku.PNG)

[11:22](#msg589ef3f9f045df0a2233bba9)updated my haiku demo

[11:24](#msg589ef453aa800ee52c7f8464)things improved a little bit, but I still can't optimize it to be decently fast

pekr

[11:44](#msg589ef92ff045df0a2233cfb7)what do you mean by haiku demo? Does not look like port to HaikuOS?

maximvl

[11:52](#msg589efb15872fc8ce622040e9)@pekr this is implementation of http://forthsalon.appspot.com/haiku-editor

## Monday 13th February, 2017

greggirwin

[05:35](#msg58a145a5872fc8ce622a386b)I haven't looked at it @maximvl, but speed will likely come. Is it the graphics, because you're creating complex draw commands and rendering them at a high rate?

geekyi

[08:05](#msg58a168b8872fc8ce622ae0ec)@pekr :point\_up: \[December 30, 2016 9:34 PM](https://gitter.im/red/red/code?at=58668ca1af6b364a2911b924)

maximvl

[09:07](#msg58a1775621d548df2c00a269)@greggirwin I was doing this in first version, current one uses single `image!` and draws on it

## Wednesday 15th February, 2017

Oldes

[15:28](#msg58a473b7238b1dae57129f5e)I have a basic FMOD binding.. so far just able to play a sound, but would like to improve it a little bit... \*\*I wonder if it is ok to include some media files in the Red/Code repository?\** The same with my ImageMagick binding, where I could include some bitmaps used in test script.

[15:38](#msg58a475f0238b1dae5712b6a9)The problem with media files is, that they must be in the folder where is compiled exe, which is most probably in the `Red` root folder (in my case - but not perfect as it adds mess there), or anywhere else. What should be used to have it in some standard way?

## Monday 20th February, 2017

geekyi

[16:57](#msg58ab2010aa800ee52cbe63d0)@Oldes  
&gt;The same with my ImageMagick binding, where I could include some bitmaps used in test script.

From what I can see, you haven't included the test images (`opice.png`..) so I take it you want to include them too?  
An alternative I can think of is to use a url to public domain or cc images.. such as from \[Wikimedia Commons](https://commons.wikimedia.org/)

maximvl

[16:59](#msg58ab205b21d548df2c348641)@Oldes @geekyi I've seen some Rebol code including images as base64 text in the sources

geekyi

[16:59](#msg58ab206e872fc8ce625e8968)I guess that too would work

maximvl

[16:59](#msg58ab206fde50490822f12030)unless your images are megabytes of data you can do this too

geekyi

[17:00](#msg58ab20b9f045df0a2270b1cb)Also, wouldn't be wrong going with the \[standard test images](https://www.google.com/search?q=standard+test+images+for+image+processing) (would be easily available) not sure if there's something for audio..

maximvl

[17:03](#msg58ab216700c00c3d4f63bd98)you can base64 everything :D

geekyi

[17:03](#msg58ab21777ceae5376a15c75e)Xiph would have something for audio and media?

Oldes

[18:07](#msg58ab307321d548df2c34f2ca)@geekyi - I have no problem to include the test images... but I wanted to hear @dockimbel 's opinion first.

greggirwin

[18:19](#msg58ab332daa800ee52cbee3e4)In the past, I've used base64 and `compress`, but also looked at using Windows the resource section in the exe. I wrote a resource compiler \*many* years ago. My reason for not pursuing it (other than using ResHacker to embed version info in R2 exes) was because encoding everything as data is portable.

Oldes

[18:47](#msg58ab39cbaa800ee52cbf0e5d)@geekyi I have updated the test file so the images are downloaded from external repository if don't exist locally.. it is in this pull request: https://github.com/red/code/pull/15

geekyi

[19:58](#msg58ab4a8121d548df2c3598e8):+1:

## Tuesday 21st February, 2017

Oldes

[22:00](#msg58acb874de50490822fa208b)If there is someone interested in sound, I just pushed another pull request with BASS audio library binding - https://github.com/red/code/pull/16

[22:07](#msg58acba2b21d548df2c3dea54)Any idea how could look DSL for dealing with sounds from `Red` which could be universal for multiple APIs? Now I have `Red/System` binding for FMOD and BASS. Still don't know which one is better.. BASS is probably more lightweight as the dll has just 111kB while FMOD is 1.5MB

rebolek

[22:08](#msg58acba5821d548df2c3debed)Hm, the license is let's say suboptimal, but it supports streaming and ARM, I am going to definitely try it. Thanks, Oldi.

[22:09](#msg58acba8cf045df0a2279a1cc)I have some ideas from R3 alpha days, but it needs implementation and testing.

[22:11](#msg58acbb27de50490822fa2ee3)But it was based around `sound://` device and ports are not implemented yet.

greggirwin

[22:13](#msg58acbb711465c46a5697118b)Cool @Oldes! I wish I had time to play right now. I think sound is important, especially if we want people to build games with Red.

I have an old dialect over the WinMCI API. Start with the simplest things, play sound, stop sound, set volume. Then look at mixing possibilities. The dialect handler may need to report unsupported features depending on the API in use.

## Wednesday 22nd February, 2017

Oldes

[09:59](#msg58ad60fe1465c46a569a60ae)@rebolek Rebol's `sound://` port was \*\*very\** limited.

rebolek

[10:04](#msg58ad624400c00c3d4f7086c6)True, that's why I tried to improve it. Unfortunately the docs were uploaded to R3-Alpha world that does not exist anymore, so I can't show you anything right now, but I still remember the basic ideas.

DideC

[12:25](#msg58ad8333872fc8ce626c10e1)@rebolek I still have "r3-alpha" wold files on my HD (may be you too). So things could be recoverable from there. Just "View it offline" or dig into the worlds\\r3-alpha\\files folder.

[12:30](#msg58ad846cf045df0a227d88e3)I have find a Rebol-audio.html files in your user folder: is that what you're talking about ?

maximvl

[12:31](#msg58ad84ba21d548df2c422159)guys, can you give an overview for people from outside, what the `world` is or was?

[12:35](#msg58ad8589aa800ee52ccbe1ce)I've launched AltMe once, but didn't really use it

DideC

[12:38](#msg58ad863a21d548df2c422d79)In Altme, you join "World" (think of it like an IRC channel) where there is "Group" of discussions (IRC channels or Gitter room).

rebolek

[12:38](#msg58ad8662872fc8ce626c2711)@DideC yes, that should be it. Can you send me it? Thanks.

DideC

[12:42](#msg58ad8736872fc8ce626c2cf8)@rebolek done.

maximvl

[12:49](#msg58ad88c621d548df2c423d90)@DideC interesting, is it documented? there must be interesting ideas in it

DideC

[12:49](#msg58ad88e1de50490822fe3561)What ? Altme ?

maximvl

[12:49](#msg58ad88ea00c00c3d4f717584)yep

rebolek

[12:50](#msg58ad891e00c00c3d4f717698)@DideC got it, thanks!

DideC

[12:52](#msg58ad897600c00c3d4f7178fa)No. It's a closed source software, so no documentation publicly available.  
But i's a Rebol program. And if communication are encrypted, all data are stored on the HD of all users (except private chat: you have just yours private chats with others users, not all).

[12:53](#msg58ad89e7872fc8ce626c408c)Data are easily manageable and it's what does Rebol.org to display Altme chats. I have made my own tool to display a group chat without the message number limit that Altme has.

[12:57](#msg58ad8ab37ceae5376a238e09)So even if the "world" server is gone (not a big machine with tons of software and gigs of HD: just an Altme program start as a "world server"), you have all the data there that you can read off-line with Altme or with others self made tools.  
Ie: files share is just folder and files in a \\files subfolder.

[13:07](#msg58ad8d0cf045df0a227dc00c)As an example, my \\world folder is just 160MB, with all files and all chats of the 14 Altme worlds I connected one time since Altme was released. The current Rebol world "Rebol4" (not a rebol version, just the world name) takes only 22.4MB since it exists. The biggest one was the precedent "Rebol3" that takes near 70MB.  
Many years (on \[Altme.com](http://altme.com), oldest news is from 2003, so lets say 14 years) of chats and scripts there... for the size of a few nowodays camera photos.

Oldes

[14:15](#msg58ad9cfc21d548df2c42c463)@rebolek Instead of the Rebol's `sound://` port I can imagine something like this instead:

```
with bass [
	init                           ;initialize sound system with default options
	info                           ;this could provide some info about environment
	sound1:  load %drumloop.wav    ;sound can be loaded from file
	sound2:  load #{52494646 ... } ;or from memory
	my-loop: play sound1           ;channel can be stored for later use
	play  sound2                   ;or not if not needed
	pause my-loop                  ;pausing the channel
	play  my-loop                  ;and resuming it again (note that play accepts channel in this case)
]
```

[14:18](#msg58ad9dbd1465c46a569bd929)The `sound` and `channel` values would be of type `handle!`, with internal `type` of the handle, so the `play` routine could decide what the input really is.

[14:21](#msg58ad9e7d7ceae5376a24090e)I'm again very unsure if create above in a form of dialect, how I did it with my ImageMagick binding, or single routines.

rebolek

[14:25](#msg58ad9f717ceae5376a240edf)@Oldes I will cleanup my old document and publish it somewhere for you to look at.

Oldes

[14:29](#msg58ada04321d548df2c42d877)In the case of sound, I think, that single routines could be better and dialect may be done in Red layer if needed instead of Red/System.

rebolek

[14:32](#msg58ada10800c00c3d4f720b7e)just `play` is not enough IMO, you need precise timing for sound.

maximvl

[14:33](#msg58ada1237ceae5376a241993)@Oldes what's `with`? I don't see it in Red

Oldes

[14:35](#msg58ada1a2de50490822fec9f8)Ah... it is not in Red by default:)

```
red>> with: func [obj body][do bind body obj]
== func [obj body][do bind body obj]
red>> o: context [a: 1 f: does [print a]]
== make object! [
    a: 1
    f: func [][print a]
]
red>> o/f
1
red>> with o [f]
1
red>>
```

maximvl

[14:35](#msg58ada1c3aa800ee52ccc9ca8)I was thinking of something similar, thanks :)

[14:36](#msg58ada1d6aa800ee52ccc9da3)should be part of Red I would say

Oldes

[14:41](#msg58ada2fd00c00c3d4f721cee)Or would it be better:

```
bass/init
bass/load %foo
..
```

or

```
bass_init
bass_load %foo
..
```

?

rebolek

[14:42](#msg58ada344f045df0a227e46ca)underscore is terrible

[14:42](#msg58ada3511465c46a569bff66)`bass/init` I guess

geekyi

[22:46](#msg58ae14da7ceae5376a2742cc)@Oldes :point\_up: \[February 22, 2017 7:15 PM](https://gitter.im/red/red/code?at=58ad9cfc21d548df2c42c463) If you're thinking of a dialect for sound playing; I've seen the following:  
1\. \[Sonic Pi](http://sonic-pi.net/) (ruby)  
2\. \[Overtone ](https://github.com/overtone/overtone/wiki/Getting-Started) (Clojure) (predecessor of sonic-pi?)  
3\. \[Klangmeister](https://ctford.github.io/klangmeister/) (Clojurescript )  
4\. \[wavepot](http://wavepot.com/) (js)

Of those, I like Klangmeister most (dialect and it's use of function composition)

Oldes

[22:51](#msg58ae15e2e961e53c7f5425c1)Thanks... but that is too difficult for me... I'm not musician and not good in math.. so don't expect anything fancy... I'm just trying to find some way, how to do Red bindings in some user friendly way. Learning Red internals on the way... at this moment I was trying to figure out, how to correctly set word in Red/System. With success.

geekyi

[22:52](#msg58ae162e21d548df2c460e53):point\_up: \[February 11, 2017 4:52 PM](https://gitter.im/red/red/code?at=589efb15872fc8ce622040e9) also forthsalon has interesting ideas for sound synthesis, but perhaps a bit too low-level..

[22:56](#msg58ae1707872fc8ce626ff3b8)Sure :) , my suggestions were just very highlevel ideas for audio I've just been looking at anyway.. something like sonic-pi's syntax with more rebol, and a bit of klangmeister's functions would work for a pretty usable dialect

[23:02](#msg58ae188ade5049082201cd55)Klangmeister works in the browser and was pretty easy to understand (for me at least). Perhaps something to build upon your work ;)

Oldes

[23:03](#msg58ae18ca00c00c3d4f753263)Yes, sonic-pi seems to be interesting... still it seems to be single purpose use - to teach sound theory. I want to create a simple framework which would enable to play sounds in games once Red will be more mature.

[23:04](#msg58ae18f71465c46a569f2760)And possible create an example, how to create bindings.

## Friday 24th February, 2017

maximvl

[10:00](#msg58b004557ceae5376a31cd26)@Oldes @geekyi very nice! I'll try to find time and dig into these, have a little bit of music theory background, but never tried to combine it with programming

meijeru

[10:02](#msg58b004b1f1a33b627542aade)@dockimbel Curious about the new \*\*Epic\** label on issues.

rebolek

[10:11](#msg58b006eafef1d2de52ab54a8)@Oldes \[Here](http://red.qyz.cz/rebol-audio.html) is the old document, I am sick and do not have much strength to work on it now. I will improve it later. Feel free to post comments here on privately to me, I will incorporate them (or make a wiki from it for easier collaboration).

Oldes

[17:42](#msg58b0706e21d548df2c538297)I don't like your channel concept.. it is more like if you would like to do the mixing code yourself, which is definitely what I want to avoid.

rebolek

[18:18](#msg58b07910e961e53c7f61c1e2)Chanel concept is for allocation, not for mixing.

Oldes

[18:19](#msg58b0792c7ceae5376a34cd5a)Here is my simple binding for Red https://github.com/Oldes/code/blob/master/Library/Bass/bass.red

rebolek

[18:21](#msg58b079b600c00c3d4f82b412)I will try to use my ideas with it to see if it works.

Oldes

[21:12](#msg58b0a1af00c00c3d4f83aa65)This test is now working with the Bass binding: https://github.com/Oldes/code/blob/master/Library/Bass/bass-test.red

## Saturday 25th February, 2017

dockimbel

[09:24](#msg58b14d5700c00c3d4f868ffe)@Oldes It is ok to include media files of any sort with your code in red/code. You can use `-o` command-line option to generate the executable in a target folder (like the one containing the media files).

About sound/music, I would rather use ports abstraction rather than a DSL. Though, for sound synthesis, a DSL might be a good fit.

[09:26](#msg58b14dca872fc8ce62810d5a)I definitely prefer BASS lib, I played with it a couple of years ago, it's great.

[09:31](#msg58b14efa21d548df2c57bc45)@meijeru `Epic` tag is just a way to group related issues together.

[09:34](#msg58b14f8af1a33b6275494f7b)@rebolek @Oldes A port model for sound &amp; music (should we separate them or not?) would be welcome before we start the work on 0.7.0, as we need to integrate it at low-level in our event loop. So, the sooner we know what high-level model we want for that, the better.

geekyi

[09:35](#msg58b14ff5872fc8ce628118c3)@dockimbel `Epic` is like a `Meta` tag? ;)

dockimbel

[09:37](#msg58b1505d21d548df2c57c3d5)@geekyi Yep, it is very useful for processing together tickets which show various issues produces by the same cause.

[09:38](#msg58b15092de50490822128f2e)Though, I'm not sure if it's a Github or Zenhub (a plugin on top of Github) feature, as there is a dedicate UI for managing them.

geekyi

[09:38](#msg58b150ab7ceae5376a38d064)Oh, it is autogenerated?

rebolek

[09:39](#msg58b150da1465c46a56b09c97)@dockimbel I agree that using ports for sound is better fit. A dialect can be build on top of that. I wrote not only some synthesizers for Rebol but also a sequencer, so I think I have some understanding of what is needed. I am going to try Oldes' BASS binding, though I would prefer something with more liberal license, even if it had less features

dockimbel

[09:41](#msg58b1512ce961e53c7f65ca97)Checking with Firefox (no Zenhub plugin installed)...seems like the tag was injected by Zenhub. Here is how it looks like for me: https://www.zenhub.com/blog/working-with-epics-in-github/

meijeru

[11:35](#msg58b16c1d7ceae5376a394a5b)I found a nice explanation \[here](https://www.zenhub.com/blog/how-to-use-epics-and-milestones/)

Oldes

[14:15](#msg58b191871465c46a56b1ceab)Any idea how to friendly name `I3DL2REVERB` sound effect? Here is its structure: https://msdn.microsoft.com/en-us/library/windows/desktop/microsoft.directx\_sdk.reference.dsfxi3dl2reverb(v=vs.85).aspx

[14:16](#msg58b191d921d548df2c58e627)I mean in the context of my Bass dialect. Here are already defined effects: https://github.com/red/code/blob/master/Library/Bass/bass-test.red#L37

[14:19](#msg58b1925bde5049082213acf8)maybe I could use just `3D-reverb`

dockimbel

[15:23](#msg58b1a17dde5049082213f7f1)`reverb-3D`

## Sunday 5th March, 2017

maximvl

[22:55](#msg58bc97621465c46a56ee1293)hey guys, how do I prevent word from evaluation in this context? (this is Rebol)

```
>> x: 'test
x: 'test
== test
>> make object! compose [x: (x)]
make object! compose [x: (x)]
** Script Error: test has no value
** Near: x: test
```

[22:55](#msg58bc977f872fc8ce62bdfba5)I want to get object with `[x: 'test]`

rebolek

[22:58](#msg58bc9819f1a33b627584039b)

```
red>> x: 'test
== test
red>> make object! compose [x: (to lit-word! x)]
== make object! [
    x: 'test
]
```

or

```
red>> x: quote 'test
== 'test
red>> make object! compose [x: (x)]
== make object! [
    x: 'test
]
```

maximvl

[23:00](#msg58bc9870f1a33b6275840538)@rebolek interesting, I tried to do `[x: (quote x)]` but it doesn't work

rebolek

[23:00](#msg58bc98991465c46a56ee1760)Because `test` in `x` is `word!` already.

maximvl

[23:00](#msg58bc98a421d548df2c9586fb)yes, makes sense

rebolek

[23:01](#msg58bc98ad00c00c3d4fc41565)It was evaluated with `x: 'test`

maximvl

[23:01](#msg58bc98c700c00c3d4fc415c6)i'm still attached to lisp thing when `quote x` makes `'x`

[23:01](#msg58bc98e4de504908224cd41c)@rebolek thanks for explanation!

rebolek

[23:02](#msg58bc98fd872fc8ce62be03b4)You're welcome!

maximvl

[23:24](#msg58bc9e141465c46a56ee32e7)@rebolek I'm parsing binary data and I wonder if there a way to get part of series without copying?

[23:24](#msg58bc9e33f1a33b6275841f9e)let's say I want to get two bytes, now I do it like `copy/part binary 2`

[23:25](#msg58bc9e81e961e53c7fa38a06)there is `take` but it modifies original binary which may be even worse

## Monday 6th March, 2017

PeterWAWood

[01:14](#msg58bcb80300c00c3d4fc4a058)@maximvl

```
red>> b: #{0001020304}
== #{0001020304}
red>> two-bytes: make binary! compose [(b/3) (b/4)]
== #{0203}
```

maximvl

[01:19](#msg58bcb91a1465c46a56eeac08)@PeterWAWood I think this is the same copy as in `copy/part` :D

[01:20](#msg58bcb95ede504908224d684c)what I want is to create a series which has it's own pointers, indexes, length but shares data with another one

[01:22](#msg58bcb9c71465c46a56eeaed2)such thing would allow one to write very efficient code

PeterWAWood

[01:22](#msg58bcb9cde961e53c7fa40389)Then you must create and manage your own indices for the series. Red only has a single index which points to the current "start" in the series. It does not have a second index that points to a current "end" of the series.

maximvl

[01:23](#msg58bcba03f1a33b6275848fbb)@PeterWAWood can't do my own indexes, because it would require to have my own version of series, and all related functions

[01:24](#msg58bcba31872fc8ce62be9bbe)&gt;Red only has a single index which points to the current "start" in the series

are you sure? you can't do things like `next/prev` having only one index

[01:24](#msg58bcba4f872fc8ce62be9c56)and I doubt `length?` traverses all elements on each call

[01:26](#msg58bcbad27ceae5376a76ef3f)in my primitive understanding series is data with bunch of indexes, including head, tail, current one

PeterWAWood

[01:27](#msg58bcbb0d1465c46a56eeb45d)This is the data structure for a series! value:

```
red-series!: alias struct! [
	header 	[integer!]								;-- cell header
	head	[integer!]								;-- series's head index (zero-based)
	node	[node!]									;-- series node pointer
	extra	[integer!]								;-- datatype-specific extra value
]
```

maximvl

[01:27](#msg58bcbb1ff1a33b6275849453)I just don't understand why it is possible to have two series pointing to different `head` of the same data, but not different `tail`

[01:31](#msg58bcbbdd21d548df2c962618)@PeterWAWood it doesn't add up in my head, having this structure how can you find `index?` value for example?

PeterWAWood

[01:32](#msg58bcbc2ee961e53c7fa40dd0)This is the series index? function:

```
index?: func [
		return:	  [red-value!]
		/local
			ser	  [red-series!]
			index [red-integer!]
	][
		#if debug? = yes [if verbose > 0 [print-line "series/index?"]]

		ser:   as red-series! stack/arguments
		index: as red-integer! ser

		index/header: TYPE_INTEGER
		index/value:  ser/head + 1
		as red-value! index
	]
```

maximvl

[01:33](#msg58bcbc6b1465c46a56eebab3)ah, I confused `head` field with `head` function

[01:36](#msg58bcbd3400c00c3d4fc4ba5e)ok, I feel like I need to understand code for `series!` first

[01:41](#msg58bcbe3e21d548df2c963230)@PeterWAWood in the `length?` tail of series is found using Rebol's one: https://github.com/red/red/blob/master/runtime/datatypes/series.reds#L73

[01:41](#msg58bcbe62de504908224d7cdb)same in other parts of code

[01:42](#msg58bcbe8900c00c3d4fc4c2e2)but Rebol is implemented in C, so AFAIK it mush have separate pointer to the tail

[01:47](#msg58bcbf9f1465c46a56eeca30)anyway I think it worth creating a suggestion for such a feature

PeterWAWood

[01:47](#msg58bcbfa521d548df2c9639a4)Only Carl (and a few other fortunate people) know how Rebol is implemented in C. It probably didn't change in Rebol 3 so you could find out by looking at the Rebol 3 source.

[01:47](#msg58bcbfc1de504908224d8332)&gt; @PeterWAWood in the `length?` tail of series is found using Rebol's one: https://github.com/red/red/blob/master/runtime/datatypes/series.reds#L73

I didn't see any Rebol code ?

maximvl

[01:48](#msg58bcbfdde961e53c7fa42043)@PeterWAWood but in C you can't say `give me tail of an array`, right? :)

[01:48](#msg58bcbfec21d548df2c963aaa)you have to move indexes with it around

[01:50](#msg58bcc04ade504908224d851a)@PeterWAWood you are right, it's Red, but where the `s/tail` is implemented then?

[01:50](#msg58bcc061e961e53c7fa42274)it's not in the structure you posted above

PeterWAWood

[01:50](#msg58bcc07c7ceae5376a770a50)I would agree that having a "tail index" might be a useful feature. If you're serious about it, I would suggest that you put together a \[proposal](https://github.com/red/red/wiki/Red-Enhancement-Proposal-Process).

maximvl

[01:51](#msg58bcc08a872fc8ce62beb4bf)will do

PeterWAWood

[02:08](#msg58bcc48821d548df2c96513e)&gt; @PeterWAWood you are right, it's Red, but where the `s/tail` is implemented then?

The structure I posted above was the structure of a red-series!, the one that equates to a Red series! datatype. The underlying structure used in the runtime is:

```
series-buffer!: alias struct! [
	flags	[integer!]						;-- series flags
	node	[int-ptr!]						;-- point back to referring node
	size	[integer!]						;-- usable buffer size (series-buffer! struct excluded)
	offset	[cell!]							;-- series buffer offset pointer (insert at head optimization)
	tail	[cell!]							;-- series buffer tail pointer 
]
```

maximvl

[02:08](#msg58bcc4b0f1a33b627584bd1d)aha! so there is `tail` pointer

[02:09](#msg58bcc4c0e961e53c7fa433d0)and `offset`

[02:09](#msg58bcc4d61465c46a56eee5f1)and `size` for `length?` :D

[02:10](#msg58bcc4fcf1a33b627584bdee)I already started thinking there is a some kind of forbidden magic involved

PeterWAWood

[02:10](#msg58bcc50af1a33b627584be05)I don't think that size is equivalent to length.

maximvl

[02:10](#msg58bcc51d00c00c3d4fc4e0c0)nope, but it's used to calculate length in constant time

[02:10](#msg58bcc5267ceae5376a771fb0)depending on current index

PeterWAWood

[02:11](#msg58bcc538e961e53c7fa43671)I'm not sure as it is the usable buffer size not the used buffer size

maximvl

[02:11](#msg58bcc55be961e53c7fa436f5)@PeterWAWood thanks for helping with this one, I'll make the proposal later

[02:12](#msg58bcc58ee961e53c7fa437a3)btw, I can't find binary functions in Rebol docs, are there any? like invert binary, xor, shifts?

[02:15](#msg58bcc65721d548df2c965a34)@greggirwin do you know by the chance? ^

[02:21](#msg58bcc7a11465c46a56eef2ce)ok, found them, nvm

PeterWAWood

[02:31](#msg58bcca031465c46a56eefec2)@maximvl Are you assuming that the contents of a

```
series!
```

are stored contiguously in memory?

maximvl

[02:52](#msg58bccedae961e53c7fa461cf)@PeterWAWood nope, should I?

PeterWAWood

[03:13](#msg58bcd3d4f1a33b627584fb92)No. A series contains references to values not the values.

rebolek

[05:53](#msg58bcf9649eb1bd81481ed80a)@maximvl sorry for not responding, I was sleeping already :sleeping:

greggirwin

[07:32](#msg58bd10921465c46a56f0479f)@maximvl, sorry I had to jump off earlier.

maximvl

[19:04](#msg58bdb2b6e961e53c7fa9b860)hey guys

[19:05](#msg58bdb2fa00c00c3d4fca8862)is there any nice way to encode arbitrary number into binary in Rebol?

[19:05](#msg58bdb30f00c00c3d4fca8941)there is `to-hex` but it only works for integers

[19:40](#msg58bdbb2f1465c46a56f4e0d7)nvm, I solved this in a different way

greggirwin

[20:18](#msg58bdc40b00c00c3d4fcb1754)You keep solving your problems before we can help. ;^) What did you mean by "arbitrary number" and how did you do it?

maximvl

[20:19](#msg58bdc43e21d548df2c9ca212)@greggirwin number more that `2147483647` which are decimals

[20:19](#msg58bdc44a1465c46a56f524e1)`to-binary` doesn't work on them

[20:20](#msg58bdc48900c00c3d4fcb1b01)I thought I solved it, but thing is more complex, for now I just allow regular 4-bytes integers and encode them as 8-bytes with leading zeros =\\

greggirwin

[21:24](#msg58bdd387de5049082253ce44)We'll have to ask if that's a design choice or just a current limitation/bug. In R2 we had to hack our way around things to get at the underlying representation, which Nenad probably wants to avoid.

Oldes

[21:29](#msg58bdd4bd00c00c3d4fcb8cd3)It is current limitation until we will get 64bit integer support - my guess.

rebolek

[21:31](#msg58bdd5374150746b1515ea08)Yes, looks like 32bit limit to me.

[21:36](#msg58bdd6519eb1bd81481eeefe)I am afraid that signed limit is everywhere, look at vectors, in R3, you can have un/signed variants. They are always signed in Red, IIRC.

## Tuesday 7th March, 2017

dockimbel

[05:39](#msg58be47747ceae5376a803441)@rebolek Unsigned vs signed matters mostly for comparison ops, there is no different encoding in storage. So, you can store signed numbers in a vector (or in any other container) and interpret them as unsigned.

DideC

[16:31](#msg58bee075f1a33b6275910145)@maximvl What you want is a new datatype that would be the `range!` datatype. One with an head and a user decide length (or tail).  
There were already discussions about that, but no concensus.

maximvl

[16:48](#msg58bee47800c00c3d4fd1e869)@DideC I see, thanks for info

[16:49](#msg58bee48800c00c3d4fd1e8bb)@maximvl thought `range!` is for things like \[1 .. 5]

## Wednesday 8th March, 2017

geekyi

[05:01](#msg58bf9012de504908225da771)@geekyi thinks `range!` can also be used for things like \[1 .. 5]

greggirwin

[05:10](#msg58bf923f872fc8ce62cfb0b0)`range!` is generally thought of as bounded values, which could be applied to a sub-series, but sub-series can be emulated if you really need them.

[05:12](#msg58bf92c5872fc8ce62cfb324)Has anyone tried to build %mandelbrot-fast.red recently? I get an error on `log`:

```
*** Compilation Error: undefined symbol: log 
*** in file: %/<long path>/red-code/Scripts/modules/view/styles.red 
*** in function: exec/fast-mandelbrot
*** at line: 2012 
*** near: (log integer/to-float i)
```

dockimbel

[07:43](#msg58bfb621de504908225e5a77)@greggirwin IIRC, we renamed the `log` function in R/S to `log-2`.

greggirwin

[18:29](#msg58c04d8e1465c46a56044769)OK. Thanks.

## Saturday 18th March, 2017

metaperl

[16:23](#msg58cd5f0d6d7eb18404dfaf61)Please merge the ballots Showcase example into master - https://www.reddit.com/r/redlang/comments/604vro/please\_integrate\_the\_ballots\_showcase\_example/

geekyi

[19:09](#msg58cd85f1b809ca5f4a5aed74)@metaperl you have to check out the 0.6.2 branch right now

[19:10](#msg58cd8610b809ca5f4a5aeda1)Will be merged when 0.6.2 is released

## Tuesday 21st March, 2017

greggirwin

[16:10](#msg58d15091fe6a638b1aeb9898)Coming from red/red

[16:11](#msg58d150bfa84f611959cb06d4)Unless it's going to be in a url, the standard newline char is `^/`, rather than `%0A`

[16:12](#msg58d150ec590d72c864eeeb18)@9214, if you do `reply: msg: user-id: text: copy ""`, they all refer to the same string.

9214

[16:12](#msg58d15100b809ca5f4a6983a4)@greggirwin oh, right

greggirwin

[16:16](#msg58d151d12215a08f04ace8fc)@nc-x, hope we didn't overload you with suggestions.

ghost~5680c5f416b6c7089cc058a5

[16:16](#msg58d151f38fa1633954000434)@greggirwin it is part of the url, hence `%0A`

[16:16](#msg58d151fb7b3f37e7541e3e2d)Thanks for the other comments

[16:17](#msg58d152035917e26076bb6f8e)I will fix them whenever I get tine

[16:17](#msg58d15207a84f611959cb0d53)\*time

[16:18](#msg58d152388fa1633954000597)&gt; @nc-x, hope we didn't overload you with suggestions.

[16:18](#msg58d152432215a08f04aceaf9)These suggestions help to learn better

[16:18](#msg58d152532215a08f04aceb20)So thank you :smile:

greggirwin

[16:18](#msg58d1526f58ad4eb02839b863)We call the community "The Redbol optimizer". :^)

ghost~5680c5f416b6c7089cc058a5

[16:19](#msg58d152a5b809ca5f4a698c27):smile: :+1:

9214

[16:20](#msg58d152c7b809ca5f4a698cfb)the great reducers

maximvl

[18:46](#msg58d1750c6701410e585f85db)hey guys, do we have `disarm` in Red?

rebolek

[18:47](#msg58d17536590d72c864efa494)@maximvl no, Red is like R3 in this regard and does not need `disarm`

maximvl

[18:47](#msg58d17552f7f7d481043f0d35)does not need?

[18:48](#msg58d17565a84f611959cbc7e3)how should I write such loop then?

```
>> forall x [ try [ get x/1 ] ]
*** Script Error: unset-word has no value
*** Where: get
```

[18:49](#msg58d175b47b3f37e7541f00a6)correct me if I'm wrong, but I think `disarm` should help in this case

rebolek

[18:51](#msg58d1764cb809ca5f4a6a4e74)No, `x` does not exist when passing it to `forall`

[18:52](#msg58d17650fe6a638b1aec6916)

```
>> error? try [forall x [get x/1]]
== true
```

maximvl

[18:52](#msg58d176735917e26076bc38a7)wait, `x` exists, it's value is `[unset-word]`

[18:52](#msg58d176882215a08f04ada1d3)does it mean I should just `error?` inside the loop?

rebolek

[18:54](#msg58d176f4590d72c864efacc4)yes

maximvl

[19:00](#msg58d178436d7eb18404eff020)ok, thanks

9214

[19:22](#msg58d17d7a2215a08f04adc3ee)@maximvl `catch/throw` ?

maximvl

[19:30](#msg58d17f452215a08f04adcee2)it doesn't work for errors

greggirwin

[20:10](#msg58d188b058ad4eb0283acb6c)`catch/throw` are not for exception handling. They are for non-local flow control.

```
>> fn: does [repeat i 10 [print i  if i > 2 [throw 'three!]]]
>> catch [fn]
1
2
3
== three!
```

[20:13](#msg58d1896af7f7d481043f7449)But you can use them with errors as well:

```
>> fn: does [repeat i 10 [print i  if error? err: try [i / 0] [throw err/id]]]
== func [][repeat i 10 [print i if error? err: try [i / 0] [throw err/id]]]
>> catch [fn]
1
== zero-divide
```

maximvl

[20:57](#msg58d193c45917e26076bccc86)btw, speaking about errors and control flow, in CL (yes, again) dynamic variables enable so called `condition-restart` system, which allows both to be done in super flexible manner and this system is used by integrated language debugger allowing interactive manipulations during runtime too

[20:58](#msg58d193e558ad4eb0283b0126)I wonder if we can do something similar with contexts

[20:58](#msg58d193edb809ca5f4a6aedf2)FYI: https://lisper.in/restarts

greggirwin

[21:05](#msg58d195b45917e26076bcd608)Almost any answer to "Can we...?" in Red, is going to be Yes. :^) If you know how they work in CL, and use them a lot, you may be the best person to try building them in Red. Or provide a small, concrete, example of what you want to achieve, and show why it's useful. My brain often, it seems, goes into TL;DR mode on CL posts articles. :^\\

maximvl

[21:07](#msg58d1961658ad4eb0283b0c49)@greggirwin I know how they are made, but it requires something like dynamic variables, eg runtime binding system

[21:08](#msg58d196612215a08f04ae4591)or writing all the code in one context

[21:09](#msg58d196858fa1633954016621)which is the problem because you can't reuse words names

[21:10](#msg58d196ce5917e26076bcdc15)let me try to make an example anyways

greggirwin

[21:10](#msg58d196d7b809ca5f4a6afb9d)Thanks.

maximvl

[22:01](#msg58d1a2cd2215a08f04ae7dbe)nice that we have `catch/name` and `throw/name`

[22:03](#msg58d1a331590d72c864f07fb1)ow, wait, if I do `catch body` how do I know if execution was successful or not?

[22:04](#msg58d1a36cfe6a638b1aed479d)for errors there is `error?` but what about throws?

[22:20](#msg58d1a739590d72c864f08cce)

```
>> cause-error 'abc 'def [1 2 3]

*** Runtime Error 1: access violation
*** at: 08078B16h
```

[22:21](#msg58d1a7778fa163395401b7a9)

```
>> error? e: try [cause-error 'abc 'def [1 2 3]]
== true
>> e

*** Runtime Error 1: access violation
*** at: 08078B16h
```

[22:22](#msg58d1a78b5917e26076bd2867)this is the error you want to catch :D

Oldes

[22:35](#msg58d1aa97b809ca5f4a6b596d)This is a bug in error formating.. you must use `err-type` one of `system/catalog/errors` and `err-id` from its object... like:

```
red>> cause-error 'math 'overflow []
*** Math Error: math or number overflow
*** Where: do
```

[22:35](#msg58d1aab458ad4eb0283b6661)Runtime error is not possible to catch.

maximvl

[23:06](#msg58d1b1f4a84f611959cce462)well, I need my own type, will be careful with catching it :)

Oldes

[23:11](#msg58d1b307b809ca5f4a6b7b96)You can:

```
system/catalog/errors: make system/catalog/errors [my: object [code: 42 type: "foo" what: ["what is this?" :arg1]]]
cause-error 'my 'what [42]
```

```
*** foo: what is this? 42
*** Where: do
```

maximvl

[23:12](#msg58d1b3507b3f37e754201b90)nice, will do

Oldes

[23:12](#msg58d1b3617b3f37e754201ba7)You should also log the crash bug.. it's your point:)

maximvl

[23:50](#msg58d1bc5fa84f611959cd0c06)how do I emulate closures?

```
>> f: func [x] [ does [x] ]
== func [x][does [x]]
>> g: f 5
== func [][x]
>> g
*** Script Error: x is not in the specified context
*** Where: g
```

## Wednesday 22nd March, 2017

greggirwin

[01:40](#msg58d1d60558ad4eb0283bf87f)Do you need a closure?

```
>> f: func [x][does reduce [x]]
== func [x][does reduce [x]]
>> g: f 5
== func [][5]
>> g
== 5
```

[01:41](#msg58d1d643a84f611959cd6c33)But if you do:

```
; @JacobGood's closure func
closure: func [
	vars [block!] "Values to close over, in spec block format"
	spec [block!] "Function spec for closure func"
	body [block!] "Body of closure func; vars will be available"
][
	; Can't use `function` here, because it will collect set-words
	; in the body, which may be closure vars.
	func spec compose [(bind body context vars)]
]
```

[01:42](#msg58d1d685590d72c864f13942)

```
>> f: closure [x: 5][][does [x]]
== func [][does [x]]
>> g: f
== func [][x]
>> g
== 5
```

xaduha

[22:50](#msg58d2ffaca84f611959d2e3f3)livecode.red and simple-code.red from 0.6.2 branch don't work with latest builds (Windows 10)

## Thursday 23th March, 2017

dockimbel

[05:39](#msg58d35f7d2215a08f04b5da8f)@xaduha Thanks, we will re-test all the scripts from red/code anyway before the new release.

## Saturday 1st April, 2017

meijeru

[12:55](#msg58dfa35f8e4b63533d86748f)I have just uploaded a function to split a `url!` value into components. See \[this](https://gist.github.com/meijeru/4a44ff148e44182580c79182f61113b0) Gist.

## Wednesday 5th April, 2017

dockimbel

[09:08](#msg58e4b3f9408f90be668db3cb)@meijeru That's a candidate for inclusion in the Red runtime library.

## Wednesday 12nd April, 2017

toomasv

[09:56](#msg58edf9b5b52518ed4d0412ce)@meijeru @dockimbel Just trying to understand: Could the `split-url` result be `map` rather than `object`? What are benefits in either case?

dockimbel

[11:29](#msg58ee0f86b52518ed4d046bab)@toomasv The `object` gives you a \*template* with all default value at `none` which conveniently informs you of the missing fields from the URL. A `map` could not give you that, as `none` is not an accepted value. Moreover, the object fields are fixed, you can't remove them (even by accident), while the map entries can be freely added/removed. So an object is an appropriate choice in this case.

toomasv

[11:43](#msg58ee12cd08c00c092a72d253)Thanks, @dockimbel . So it is like safeguard against accidentally distorting the structure of splitted url. For nonexisting keys `map` returns `none` also, eg:

```
>> urlmap: #() 
== #()
>> urlmap/scheme: 'http
== http
>> urlmap/host: 'www.example.org
== www.example.org
>> urlmap/port
== none
```

Oldes

[11:51](#msg58ee14cff22385553d337a36)@toomasv with object you can do this:

```
>> o: object [a: 1]
== make object! [
    a: 1
]
>> o2: make o [b: 2] 
== make object! [
    a: 1
    b: 2
]
```

[11:52](#msg58ee14fda0e4856242f8ac56)Above is not possible with `map!`.

rebolek

[11:56](#msg58ee15dcb52518ed4d048715)Actually, it is possible, you just have to use different syntax.

```
>> m1: #(a: 1)
== #(
    a: 1
)
>> m2: extend copy m1 [b: 2] 
== #(
    a: 1
    b: 2
)
```

toomasv

[12:00](#msg58ee16cdf22385553d3380fb)@Oldes example may then be used for extending objects:

```
>> o: object [a: 1]
== make object! [
    a: 1
]
>> o: make o [b: 2]
== make object! [
    a: 1
    b: 2
]
```

DideC

[12:24](#msg58ee1c72a0e4856242f8d727)But if you have more words pointing to the same object, only the one you use (`o` in this case) will be pointing the new one. The others words still point the first object!  
You have 2 different objects in memory. With a GC, the firt one will be eventually freed if no more words reference it.

dockimbel

[12:27](#msg58ee1d1eb52518ed4d04a9fc)@toomasv Maps have specific behavior:

```
>> m: #()
== #()
>> m/any-non-existing-key-will-return-none
== none
>> o: object []
== make object! []
>> o/non-existing-key-will-error-out
*** Script Error: cannot access non-existing-key-will-error-out in path o/non-existing-key-will-error-out
*** Where: catch
```

toomasv

[12:32](#msg58ee1e4f69a692963ea2a0f3)@dockimbel Understood.

[12:41](#msg58ee2097a0e4856242f8eb56)Thanks , @DideC . Can the original object be actually extended after initialisation?

[13:19](#msg58ee2974f22385553d33d941)@DideC Sorry, not original object. I mean, can two words refer to the same object structure? As with maps:

```
>> m1: #(a: 1)
== #(
    a: 1
)
>> m2: m1
== #(
    a: 1
)
>> extend m1 [b 2]
== #(
    a: 1
    b: 2
)
>> m2
== #(
    a: 1
    b: 2
)
```

DideC

[14:21](#msg58ee37f8b52518ed4d053281)You can have any number of words referencing the same value. Except for values of type number!, pair!, tuple! that are passed by value and not by reference.

[14:23](#msg58ee38638e4b63533dc02fb7)

```
>> a: b: c: make object! [m: 1]
== make object! [
    m: 1
]
>> a
== make object! [
    m: 1
]
>> b
== make object! [
    m: 1
]
>> c
== make object! [
    m: 1
]
>> a/m: 2
== 2
>> b
== make object! [
    m: 2
]
>> c
== make object! [
    m: 2
]
>> d: reduce [a b c]
== [make object! [
    m: 2
] make object! [
    m: 2
] make object! [
    m: 2
]]
>> d/1/m: 3
== 3
>> d
== [make object! [
    m: 3
] make object! [
    m: 3
] make object! [
    m: 3
]]
```

toomasv

[18:37](#msg58ee74008e4b63533dc15d6c)Thanks, @DideC. I understand this part. Now I see that objects can't be extended. As @dockimbel said "the object fields are fixed". And as you earlier said "if you have more words pointing to the same object, only the one you use (o in this case) will be pointing the new one. The others words still point the first object!" Compare the similar code for maps above:

```
>> o1: object [a: 1]
== make object! [
    a: 1
]
>> o2: o1
== make object! [
    a: 1
]
>> o1: make o1 [b: 2]
== make object! [
    a: 1
    b: 2
]
>> o2
== make object! [
    a: 1
]
```

I have no done my reading of the doc that I found and I'll try to sum up the differences as I see them now. Any mistakes or additions to these points?  
1\) Map can be created "directly" as `m: #(...)` or by make as `m: make map! [...]`.  
Object can be created only by make as `o: make object! [...]`. `object` and `context`are just shortcuts to this.  
2\) "Fields" in map (keys) can be any literals (besides words) as `make map! ["key" val1 2 'val2 key2 val3]`. In object, these have to be set-words as `make object! [key: 'val1 two: 'val2 key3: 'val3]`.  
3\) When created, object's spec block will be evaluated once as `o: make object [a: 1 print b: "hello"]`. While creating maps, spec block will not be evaluated by default, but can be evaluated as eg `m: make map! compose [a 1 b: "hello" (print b)]`.  
4\) Because object's spec block will be evaluated, simple words in value position will be replaced by their values. Not so in map creation.  
5\) Keys in map can be created just by setting, as `m/key: 'some-value` or by extending as `extend m [key some-value]`. Objects cannot be extended after creation.  
6\) Setting map key to none will erase the key. Setting object word to none will set the none-value to the word.  
7\) Unlike map, object can be self-referenced by `self`.  
8\) It is quite easy to create infite descent with objects, as

```
o: object [o: 'p]
o/o: o
o/o/o/o/o/o/o
```

With map:

```
m: #(m m)
m/m: m
```

will crash the console.

rebolek

[18:40](#msg58ee7496a0e4856242faa20c)@toomasv Interesting, you should report the last example (map crash), as a bug.

[18:41](#msg58ee74f2bdf4acc11252d486)It is different from the object example, in the map case you are using whole map as a key, in object example, you are using just the word `o` as a key (word).

greggirwin

[18:48](#msg58ee76708fcce56b20f711bd)@toomasv, your analysis and understanding look good. I'll just add that the `construct` function can be used to create objects without evaluating values.

```
>> o: context [a: (1 + 1)]
== make object! [
    a: 2
]
>> o: construct [a: (1 + 1)]
== make object! [
    a: (1 + 1)
]
```

[18:54](#msg58ee77dcbdf4acc11252e29f)I think we still need to clearly spec `copy/deep` when used with objects and maps. I'm not sure that the current behavior is the final goal. i.e. maps in an object are not copied.

[18:55](#msg58ee783e8fcce56b20f71a40)In ticket #2167, Nenad notes that the `/types` refinement addresses this, or will eventually.

toomasv

[19:00](#msg58ee793569a692963ea475b8)@rebolek Sorry, I am a newbe. How shell I report it?  
Thanks, @greggirwin! And I forgot to add the important metaobject capabilities (detecting changes) in objects and extended actions `get` and `set`.

rebolek

[19:03](#msg58ee79fb408f90be66b49ccb)@toomasv here: https://github.com/red/red/issues

[19:03](#msg58ee7a14f22385553d35830b)If you are not sure what to do, just let me know, I will add the ticket myself.

luis-rj

[19:20](#msg58ee7e054cb8d0917384f8f4)Hi, I'm interested in exploring Rebolek´s Gritter program, but I'm getting the following msg:

```
*** Script Error: user-info has no value
*** Where: info
```

meijeru

[19:21](#msg58ee7e3f08c00c092a74df46)@toomasv Congratulations on a very didactic explanation of objects vs maps. I am sure that this can find its way into the documentation somehow and sometime.

luis-rj

[19:21](#msg58ee7e4c8fcce56b20f7387b)from: https://github.com/rebolek/gritter

rebolek

[19:28](#msg58ee7fe669a692963ea4912a)@mp3 I've made some changes to Gitter API, but I haven't updated Gritter to use them yet. You could either use older version (I will give you the link) or wait until I fix it.

[19:30](#msg58ee8047f22385553d35a059)@mp3 This should be working version https://github.com/rebolek/gritter/tree/479a7a8bf08c33423abffc5b5f01309b381d5029

toomasv

[20:08](#msg58ee89534cb8d09173852e6e)@rebolek I added issue. Is it correct?

rebolek

[20:25](#msg58ee8d2e69a692963ea4cab9)@toomasv https://github.com/red/red/issues/2569 great, thanks!

luis-rj

[21:38](#msg58ee9e42ad849bcf427ae87d)@rebolek excelent, thanks !

## Thursday 13th April, 2017

toomasv

[03:58](#msg58eef75869a692963ea653d5)@rebolek \*in the map case you are using whole map as a key* I see what you mean, but

```
>> m: #(#(#() m) m)
== #(
    #(
        #() m
    ) m
)
```

works fine, while

```
m: #(n m)
m/n: m
```

still crashes.  
First example shows that actually map accepts maps on key positions (but they cannot be selected, only `keys-of`-ed)

dockimbel

[06:57](#msg58ef216ab52518ed4d08ebdd)@toomasv Crash on self-referenced maps fixed. Having a map as a key in another map should throw an error, that needs fixing too.

toomasv

[06:58](#msg58ef21a88bb56c2d11a2a227)Thanks, @dockimbel . Should I make the issue for it too?

dockimbel

[06:59](#msg58ef21b9b52518ed4d08ee2c)Yes, please.

[07:03](#msg58ef22a4bdf4acc1125573eb)Only \*some* datatypes can be keys in maps: https://doc.red-lang.org/en/map.html#\_literal\_syntax Though, `map!` seems to be lacking some checks to enforce that rule.

toomasv

[07:07](#msg58ef23b78bb56c2d11a2ac61)@dockimbel Done. While playing with hash, I noticed that it doesn't allow to `select` lit-word keys:

```
>> h: make hash! [a 1 'b 2]
== make hash! [a 1 'b 2]
>> select h 'b
== none
>> h/b
== 2
```

Is it intended?

dockimbel

[07:08](#msg58ef23ee4cb8d0917387713e)@toomasv You are not passing a lit-word to `select` in that example. ;-)

[07:08](#msg58ef240569a692963ea704c0)

```
lisp
>> 'b
== b
```

toomasv

[07:10](#msg58ef244fad849bcf427cd219)@dockimbel Ok, so how can I `select` 'b?  
It works for map:

```
>> m: make map! [a 1 'b 2]
== #(
    a: 1
    b: 2
)
>> select m 'b
== 2
```

I guess this is because map converts the lit-word to word?

dockimbel

[07:11](#msg58ef24b54cb8d09173877426)

```
lisp
>> to-lit-word 'b
== 'b
```

toomasv

[07:13](#msg58ef251fa0e4856242fd508b)@dockimbel Indeed, thanks.

dockimbel

[07:15](#msg58ef257af22385553d380b56)`Hash!` is preserving the values stored, `map!` is converting `any-word!` keys to set-words and the key matching is \*relaxed* for words:

```
m: #('z 4)
== #(
    z: 4
)
>> select m 'z
== 4
>> select m to-lit-word 'z
== 4
>> select m to-set-word 'z
== 4
>> select m to-get-word 'z
== 4
```

toomasv

[07:25](#msg58ef27f3bdf4acc112558c69)@dockimbel Got it.

dockimbel

[07:27](#msg58ef284bad849bcf427ce620)An alternative way to preserve the lit-word from decaying to a word when evaluated is to use `quote`:

```
>> quote 'b
== 'b
```

[07:28](#msg58ef2897b52518ed4d09074b)`quote` is just a pass-thru, an \*identity* function preserving the argument value from evaluation.

toomasv

[07:33](#msg58ef29cb8bb56c2d11a2c74c)@dockimbel Great! Ho does block treat its values?

```
>> b: [a: 1]
== [a: 1]
>> select b 'a
== 1
```

dockimbel

[07:36](#msg58ef2a6a8e4b63533dc42774)`Block!` has relaxed lookup rules for words also by default (for convenience). You can enforce a stricter lookup mode for words by using the `/case` refinement on `select`.

toomasv

[07:40](#msg58ef2b85408f90be66b73ca6)@dockimbel I see. Thanks for explaining!

## Friday 14th April, 2017

iArnold

[15:03](#msg58f0e4c769a692963eadf953)Perhaps a nice suggestion for bored community members for a well spent easter weekend: https://www.youtube.com/watch?v=PyRN47mtdMM&amp;feature=youtu.be  
make a nice Red program for http://www.eprg.org/computerphile/testH5.awk  
Enjoy your weekend ;-)

greggirwin

[15:28](#msg58f0eaa6a0e4856242047ae5)Nice. Guess I should dust off my RAWK dialect.

iArnold

[19:50](#msg58f128174cb8d091738f664a)In the last moments of the video he asks for someone to put it in a faster language. Perhaps a nice readable implementation in Red could even get a mention in a sequel ;-)

9214

[20:30](#msg58f1314af22385553d4078c4)I already can foresee the future:  
\*\*People\*\*: yeah guys we need to implement ultra-complex X thing, it's a nice startup idea and we want to get funding on KS, also we need support from NASA, DARPA and xenomorphs...  
\*\*Reducer\*\*: ok let me just dust off my RX dialect, bear in mind that it cooked up on one's knee w/ Android smartphone during Covenant end credits... and sorry for enormous 1kb binary size, I was too sleepy and definetly should try to squeeze it down to 0.42, that way X could be ported to... oh, wait, sorry to take the bread out of your mouths guys, but I think that I \*acidentially ported* it to all platforms (Universe VM included!), since I use Red :(

iArnold

[20:31](#msg58f131ab08c00c092a7fa0e1)A good idea to give a place to some recreational Red?

greggirwin

[23:31](#msg58f15be04cb8d09173901142)@9214, you'll be glad to know that `format` is going to be \*enormous* when I put it out for review. Have to give the people something to complain about. :^)

## Saturday 15th April, 2017

maximvl

[02:00](#msg58f17ea6f22385553d417004)@greggirwin do you take into account CL's `format`?

[02:01](#msg58f17ef08fcce56b2002c883)there is a quite detailed documentation about it and about implementation, I'll try to find it later, there are some ideas to borrow for sure

greggirwin

[02:40](#msg58f18810bdf4acc1125eec78)@maximvl, yes. I've gathered information for a long time, and have some old implementations from R2 days. Any links are helpful.

## Sunday 23th April, 2017

Scaremonger

[16:31](#msg58fcd6cbad849bcf42b0e8cd)Is there a guide for interfacing C code into Red, Red/System? I have the usual .h and .c files available; do I need to compile them into a library first, or can I import them directly into Red/System?

rebolek

[16:38](#msg58fcd8998bb56c2d11d5c9cd)@Scaremonger You can interface with \*compiled* C code, not with C source.

Scaremonger

[16:42](#msg58fcd95bd32c6f2f09328888)Ok, cool; is there any preferred compiler? I tend to use MinGW.

rebolek

[16:44](#msg58fcda02f22385553d6b54d1)@Scaremonger it doesn't matter at all, you just need to compile library and write a wrapper for it in Red/System.

Scaremonger

[16:52](#msg58fcdbb23e27cac331b732e0)Ok, compiling will be the easy bit then. :) Will the interface in the wrapper follow the #import definition as per the \[Red/System documentation](http://static.red-lang.org/red-system-specs.html#section-15.1)?

rebolek

[16:53](#msg58fcdc1ad32c6f2f093292cf)Yes, exactly that.

Scaremonger

[19:53](#msg58fd06416aea30763d35a15f)Cool. Thanks.

## Monday 24th April, 2017

dockimbel

[00:17](#msg58fd44028e4b63533df8fd5b)@Scaremonger You can find some extra info \[there](https://github.com/red/red/wiki/Red-tutorial-for-newcomers-English-version), for the rest, just post questions in red/help (this room is for the discussions about red/code repo).

## Tuesday 25th April, 2017

Oldes

[15:09](#msg58ff669b08c00c092ab4637e)@dockimbel you mean \[this one](https://github.com/red/red/wiki/Red-System-tutorial-for-newcomers-English-version)?

dockimbel

[16:42](#msg58ff7c82f22385553d75c89a)@Oldes Ah yes, that one, thanks.

geekyi

[20:31](#msg58ffb20e8bb56c2d11e12acf)@Oldes sorry, that was my fault, I renamed it as I felt that was a better. Feel free to revert..

## Saturday 29th April, 2017

pekr

[08:39](#msg590451398fcce56b204a0f61)My first primitive attempt to use a `call` to call sqlite3.exe and get some result back. Later on, I will try to improve - parametrise the separator, quoting, etc. and using parse to get back result as a block.

```
sql-query: {
   create table tbl1(one varchar(10), two smallint);
   insert into tbl1 values('hello!',10);
   insert into tbl1 values('goodbye', 20);
   select * from tbl1;
}

result: copy ""

call/output tmp: to-string compose ["sqlite3 test.db " {"} (sql-query) {"}] result

print result
```

[08:40](#msg5904516a12d2409935acd2e7)It just works. And that's why I always liked `call`- it might be a strong integrator. Of course, proper driver will do much better. Not sure how would it handle larger dataset, etc., but you can always get sqlite output to file and read it back, etc.

maximvl

[09:32](#msg59045d95d32c6f2f09505e3f)@pekr good job :)

pekr

[09:54](#msg590462c48fcce56b204a4634)Well, there was some discussion with Giuseppe, who tried to gather all R3-GUI docs, while all stakeholders suggested it is a dead end. What Giuseppe misses is ODBC and would be satisfied with SQLite. There is some old Kaj's driver, not sure it is working, so just wanted to know, how difficult would it be to use `call`. Giuseppe might end up giving Red GUI a try then ....

x8x

[20:20](#msg5904f5966aea30763d556008)@pekr Another approach would be to write small code in nodejs for which you can find almost any DB driver (+libraries for anything you could imagine..), output the result in JSON format, execute the nodejs code with `call`and translate the JSON result to red object/block/whatever (@rebolek has a pure red JSON loader/encoder which works pretty well).

## Sunday 30th April, 2017

GiuseppeChillemi

[15:04](#msg5905fd0d08c00c092ace1aa0)Actually my show stopper is the lack of TEXT-TABLE in RED/GUI

[15:05](#msg5905fd31881b89e1019dff47)Otherwise I would start investigating if anything else is missing and than start adopting RED

## Monday 1st May, 2017

Scaremonger

[07:51](#msg5906e90412d2409935b520a4)@pekr - I found a \[SQLite wrapper](https://github.com/kealist/RS-fossil-mirror/tree/master/SQLite/) a few days back. The code seems to be written in \*\*Red\** but its two years old! I've not had a chance to try it yet.

geekyi

[09:31](#msg5907008b8e4b63533d1e8d87)@Scaremonger @GiuseppeChillemi that's kaj's code. He wrote many wrappers for the older red system, before I heard about Red. The code is still useful to learn redsystem I think . He is also the creator of syllable OS. Also @Oldes is writing a better sqlite wrapper now?

Scaremonger

[12:14](#msg590726c38bb56c2d11fd5960)@GiuseppeChillemi - You could use a panel containing a set of Text labels;: Take a look at the \[Native Reactive Spreadsheet](http://www.red-lang.org/2016/07/native-reactive-spreadsheet-in-17-loc.html) example for inspiration, alternatively you could simply use \[Vid](https://doc.red-lang.org/en/vid.html) to lay the Text labels out manually where you need them in a grid.

greggirwin

[15:55](#msg59075a8812d2409935b6dd48)I ported the spreadsheet demo to VID. While working on another side project (7 GUIs that someone linked to here recently, and I have all done except the Cells task) I found that a 26x99 sheet is slow to build and tear down here. Faster for Doc, and ~2s for Qingtian. Doc said the graphics card will have a big effect on that. So we can lay out tables using `field`, to a point.

I imagine they will wrap the native table widgets, but that will be a substantial design task, because they need to define set of features they can all support.

[15:56](#msg59075ac7edf919574a67b5a5)My 7GUIs code is here: https://github.com/greggirwin/7guis/tree/master/Red

It would be great to see other's approaches, and reactive versions.

GiuseppeChillemi

[17:16](#msg59076d7e12d2409935b73164)I am no so skilled to undestand and implement such "alternate version". Also I deepley need sorting and filtering.

[17:17](#msg59076da98bb56c2d11fe7f33)@Scaremonger Hope it will be implemented soon

## Tuesday 2nd May, 2017

Oldes

[13:48](#msg59088e458fcce56b2058bff0)@geekyi @Scaremonger I don't know if my SQLite binding is better, but my goal was to provide complete API... Kaj used just parts of it.. so far I have \[just the Red/System part](https://github.com/Oldes/code/tree/sqlite/Library/SQLite), so I didn't make it as a pull request... any idea how should look the Red part of it is welcome. I think it should work with ports once they will be implemented.

## Thursday 4th May, 2017

Oldes

[12:25](#msg590b1dd3c1d3b501544a3be4)Ok... so basic binding for SQLite can be now found \[here](https://github.com/Oldes/Red-SQLite) and also in a pull request into Red/code repository.

[12:27](#msg590b1e20f22385553da381d8)If you think that something should be done differently, let me know. I'm just a Red student.

[12:30](#msg590b1edfc1d3b501544a3fad)This is minimal code example for compiled Red:

```
#include %SQLite3.red
result: make block! 32 ;preallocating block for results
SQLite/do [
	open %test.db
	result: exec "SELECT * FROM Cars ORDER BY name"
	end ;closes all opened DBs and free SQLite resources
]
probe result
```

maximvl

[13:09](#msg590b281a8e4b63533d2fadb7)we should make query a dialect, not a string, I think

Oldes

[13:39](#msg590b2f2a63a9bc9028480e7f)I've now included simple helper function so it is possible to do this, if there is an opened database:

```
print ["Tables:" mold SQLite/query "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name"]
```

@maximvl we can make many things.. but as Red does not have GC, we should stay as light as possible. That is also reason, why I decided to return results as string values only to avoid all the conversions, which are not needed in many cases. Take is as a starter project. The Red/System binding should be complete, how to use it in Red is something different.

rebolek

[15:02](#msg590b427c594c95a5642e3fe9)@Oldes &gt;&gt; as Red does not have GC, we should stay as light as possible

[15:04](#msg590b42e1e66ccf474dee291b)Why? I understand right now you will get some memory leaks, but the code won't change once GC is implemented, do why not aim for the future?

[15:04](#msg590b4307e3b0d4e353bf3dcd)(Sorry for typos, phone)

Oldes

[15:15](#msg590b45ab10a6a16673e0e6b2)I don't need SQL so much I would need to build query dialects. I will keep it for someone else.

rebolek

[15:28](#msg590b488d4d51a79e643bfcb9)Ok, that makes sense :smile:

greggirwin

[16:10](#msg590b525edbeff564731a3e8b)Nice Oldes!

## Friday 5th May, 2017

gltewalt

[05:35](#msg590c0f040a783b6c0a67be38)

```
explode!: func [str [series!] /local coll][
    coll: copy []
    if not string? str [str: form str]
    foreach c str [append coll c]
    return coll
]
```

PeterWAWood

[05:37](#msg590c0f990dcaa48e672d127b)@gltewalt I believe that "forming" a string! simply returns the string so you don't need to check if str is a string .

gltewalt

[05:38](#msg590c0fc22b926f8a67237754)Cool, thanks

[05:52](#msg590c133533e9ee771c768ce9)And thanks to @9214

```
explode!: function [str [series!]] [
    collect [foreach c str [keep c]]
    ]
```

## Monday 8th May, 2017

Tovim

[15:15](#msg59108b9ed1a7716a0aa595d0)I am testing REBOL´s Appendix 1-Values documentation (2.10 Path) from the view point of the RED and I have got stuck with this example:

```
root: [sub1 [sub2 [
      word "a word at the end "
      num  55 ]    ]    ]
path: 'root/sub1/sub2/word
probe :path
== root/sub1/sub2/word
probe path
== "a word at the end"
```

Contrary to Rebol, I am not able to get the value of the "word", getting the path only.  
Maybe, it doesn´t work in Rebol either?

endo64

[15:55](#msg5910950833e9ee771c871c43)On R2, `probe path` also returns `root/sub1/sub2/word`. When you `do path` then it returns `"a word at the end "`. But on Red it returns `false`.

greggirwin

[16:35](#msg59109e440a783b6c0a78d46c)Use `get path` in this case.

Tovim

[18:04](#msg5910b34ad1a7716a0aa659aa)Nice. Thank you both.

[19:22](#msg5910c57bc89bb14b5ae24c23)Please, one more question, concerning the App 1-Values/2.10.4:

```
>> (form pick [root/sub] 1) ==
                               (mold pick [root/sub] 1)
== true
```

As both results are the same, is it true in Red, that the first one is a simple string whereas the second one presents a special string, reloadable as a Rebol/Red path value?

greggirwin

[20:08](#msg5910d03aac693c532ad2cd0a)`Mold` and `form` don't always produce the same result. It depends on the datatype.

```
>> form "abc"
== "abc"
>> mold "abc"
== {"abc"}
```

Use `mold` if you want to be sure it's loadable in Red.

## Thursday 11st May, 2017

Tovim

[19:05](#msg5914b5df00efc2bb3e59b4aa)Still in App-1 - 2.13-3 trying to make a conversion to url! type:

```
>> to-url [http www.rebol.com reboldoc.html]
== httpwww.rebol.comreboldoc.html
```

Any idea? Thank you.

greggirwin

[20:48](#msg5914ce049d90dc7a1c6ccc39)Type casting usually does the most basic thing. What's happening there is that it's forming the block, without reducing the values. It doesn't know if you want it to include path separators between elements. You could do this though: `rejoin [http:// %www.rebol.com/ %reboldoc.html]`

[20:51](#msg5914cec49d90dc7a1c6ccf67)Port specs may come in 0.7.0. Until then urls are just stringy values. Rudolph Meijer as written this though: https://gist.github.com/meijeru/4a44ff148e44182580c79182f61113b0

## Friday 12nd May, 2017

Tovim

[09:03](#msg59157a6a92217cca586aefb5)Were I not lazy, I would have tried it in Rebol and would have learned that in Rebol(3) it doesn´t work either.  
The declared result (in the chapter 2.13-3) is:

```
http://www.rebol.com/reboldoc.html
```

Never mind, next time. Thanks.

## Tuesday 30th May, 2017

mikeparr

[08:38](#msg592d2f70631b8e4e61278eee)I'm not sure about the relationship between using gists, and the new Red/community. Should we use the community for useful working code extracts?

Oldes

[08:56](#msg592d33befcbbe1891c5b0c4a)@mikeparr I think so.. or Red/code as I do:) But using gist is fine too... the more code we will add to GitHub, the more will Red rise.

geekyi

[10:10](#msg592d4522fcbbe1891c5b5cc6)I think it was because most everyone had code scattered everywhere. And submitting code to red/code required strict review

mikeparr

[12:11](#msg592d61792b926f8a67a81f38)As far as I know, there is no 'Red Gist' section, so it is difficult to link to a top-level page. Red Community will overcome this, I think. Should the community allow links to individual gists?

greggirwin

[15:30](#msg592d900c2b926f8a67a91198)Yes, Community is to make collecting quick things easier, without the review that Red/Code requires. We're already talking about a page for links to other repos and gists.

mikeparr

[15:39](#msg592d922fcb83ba6a411335db)@greggirwin Thanks, good to know!

## Sunday 25th June, 2017

Oldes

[12:00](#msg594fa5c04bcd78af5642e3f9)@dockimbel regarding recent `MacOSX` to `MacOS` change in Red, should I change it in Red/code too or wait?

dockimbel

[12:00](#msg594fa5e576a757f808a335a0)@Oldes You mean upgrading the code to use `macOS` OS name?

Oldes

[12:00](#msg594fa5ef76a757f808a335cf)yes

dockimbel

[12:01](#msg594fa60557a6e9f72ef8ad7c)If you don't upgrade it, it won't compile anymore.

Oldes

[12:01](#msg594fa61a57a6e9f72ef8ada6)I know, but not everybody use version from sources

dockimbel

[12:01](#msg594fa63711755ab0561e2b74)We are about to make the 0.6.3 release.

Oldes

[12:02](#msg594fa6713230e14f3af1e4a7)I will modify it and make a pull request.

dockimbel

[14:55](#msg594fcee4ceb5bef82eabfd83)Thanks. PR merged.

## Thursday 29th June, 2017

maximvl

[08:20](#msg5954b858bf7e6af22c8600fa)something we can implement in Red to show-off on hacker news: https://docs.racket-lang.org/2d/index.html

greggirwin

[16:24](#msg595529d011755ab056364d9a)That's clever!

## Tuesday 25th July, 2017

kskarthik

[14:46](#msg597759d2614889d475ebd00d)Hi guys! I believe this is the right place to ask about compiling red with musl or please guide me to the related place :)

greggirwin

[16:26](#msg5977713d2723db8d5e46abb0)Hi @kskarthik! Maybe try https://gitter.im/red/red/system or https://gitter.im/red/help. This room is more for mezzanine Red in the Red/Code repo.

kskarthik

[17:34](#msg5977811676a757f808466569)Thanks Gregg !

## Wednesday 23th August, 2017

419928194516

[05:01](#msg599d0c2dbc46472974b1ded6)why is mod implemented:

```
if (r: a % b) < 0 [r: r + b] 
    a: absolute a 
    either all [a + r = (a + b) r + r - b > 0] [r - b] [r]
```

and not just

```
a % b + b % b
```

[05:10](#msg599d0e60a7b406262db981dd)and modulo is also wrong... both type signatures are lies, as they don't work with pair, tuple, or vector

rebolek

[05:11](#msg599d0e77162adb6d2e24e26d)@419928194516 open an issue for it, please.

meijeru

[07:41](#msg599d318e76a757f808d3f0d9)See #2674

419928194516

[14:51](#msg599d967fc101bc4e3a4b0ce7)@meijeru @rebolek Ah, I'd just opened https://github.com/red/red/issues/2997 when I saw your message.

[14:54](#msg599d97099acddb2407bf1107)My suggestions for a fix diverge from yours however.

greggirwin

[16:05](#msg599da7db2723db8d5ed539d9)@419928194516, your suggestion changes the results, which may not be desirable. I don't have time to dig in right now, but would it work to change `0` to a temp val of `make b 0` in `mod`, and return `make b 0` in `modulo`? And add `absolute` support on vectors. Otherwise, it seems best to put the TBD type support in doc strings for the args and remove them until we have a working implementation.

419928194516

[16:47](#msg599db197ee5c9a4c5ff02c7e)I guess my question would be is the mod as it is currently defined really make sense w.r.t. established meanings of mod and rem?  
It's also trivial to write mod as

```
a % b + (absolute b) % b
```

to retain the exact 'always positive' semantics for not-floating numbers.

Regarding modulo

```
probe make (make tuple! [1 2 3]) 0 ; Error - issue?
```

but in general wouldn't it be better to have the "don't Error for b = 0" as a refinement instead of a new word?  
Same with the 'near 0 rounding' thing.  
So, assuming mod and fmod were different:  
We'd have `mod/safe` `fmod/safe` `fmod/round`

greggirwin

[17:01](#msg599db4f4ba0f0f6e38d6378b)&gt; is the mod as it is currently defined really make sense w.r.t. established meanings of mod and rem?

Right. As you say, test cases are missing. Perhaps the best approach would be to define a small set of them, for all target types, with expected results for discussion. The current behavior was designed for non-composite types, as you note, and should \*probably* be the reference for composite type behavior.

## Monday 4th September, 2017

Oldes

[21:54](#msg59adcba29acddb240701879f)Any idea, where I should add file with common definitions like:

```
int64!: alias struct! [lo [integer!] hi [integer!]] 
binary-ref!: alias struct! [value [pointer! [byte!]]]
```

in the Red/code repository? Aliases like above may be defined only once and I forced to use them in almost every library binding, so without defining them in separate file, I cannot join libraries easily together.

[21:58](#msg59adcc7c9acddb2407018a73)Or maybe the compiler could check if the value is same and not stop compilation... but it is on long run change.

## Tuesday 5th September, 2017

geekyi

[05:22](#msg59ae34afb16f26464207c51e)Ah yes, check if \*alias* and the \*data type* it defines is same and allow it seems best way.  
In the meantime, how about `%Library/common/alias.reds` ? Or something along those lines?

Oldes

[07:00](#msg59ae4b90210ac26920f73235)It should contain also some defines often used and not defined in Red.

[09:07](#msg59ae6958bc46472974f9c97c)What about naming of reference aliases like `binary-ref!`? I started using them as Kaj was using them in his old code, but I'm quite not sure if I like it.

## Friday 15th September, 2017

Oldes

[10:54](#msg59bbb176bc46472974385ebe)@dockimbel could you please merge also the PR https://github.com/red/code/pull/71 now? I started with the renaming and would like to change other libs asap too, but first would like to go into sync again... thanks.  
Because the already merged SQLite lib is using code, which will be changed with the PR 71

pekr

[11:10](#msg59bbb532cfeed2eb65110b8f)@Oldes sorry for uneducated question, but - why to have `[bytes! 3]`vs the `[byte!]`, and not have just `[byte! 3]`, `[byte! 1]`?

Oldes

[11:11](#msg59bbb55fb59d55b823fc58ee)Maybe because you are the only one with some reaction so far :/

[11:13](#msg59bbb5c3b59d55b823fc5b93)Technically it was easier for me with separate name `bytes!`. (although it was very difficult to make it working without any help)

dockimbel

[11:13](#msg59bbb5c7bac826f054beb2d4)@Oldes Merge done.

Oldes

[11:13](#msg59bbb5cccfeed2eb65110e90)thanks

pekr

[11:13](#msg59bbb5e6c101bc4e3acd5731)well, I am not the one who should speak to the low level aspects of development anyway :-) But one of reasons might be to not be pushed to state an explicit number value, if you want just one byte?

Oldes

[11:15](#msg59bbb64ecfeed2eb65111094)The main reason was to be able declare structs with correct sizes.

[11:15](#msg59bbb668bac826f054beb689)But of course, you can find also arrays of other types in C code:/ Which I must overcome with nasty defines like here: https://github.com/red/code/blob/master/Library/Vulkan/vulkan.reds#L90-L132

pekr

[11:21](#msg59bbb7a4210ac26920347a08)Some kind of array support is planned for R/S if I am not mistaken, but probably later ... let's see if Doc has enough of spare time to consider your PR inclusion, as it might need some deeper thoughts ...

[11:21](#msg59bbb7bc1081499f1f34db84)btw - are you porting your supporting tools from R2 to Red nowadays?

[11:21](#msg59bbb7cabac826f054bebe21)ah, wrong group, sorry for being off-topic here with the chatter ...

Oldes

[11:25](#msg59bbb88ebac826f054bec39a)It is not about array support in R/S, but how to declare struct which I need to use with external functions.

pekr

[11:26](#msg59bbb8e3b59d55b823fc6a85)I see

## Monday 18th September, 2017

Oldes

[14:48](#msg59bfdcaebac826f054d1e07e)@dockimbel could you please review/approve this: https://github.com/red/red/pull/3021 or should I include in Red/Code libc-extended.reds where would be imports missing in Red?

## Tuesday 19th September, 2017

dockimbel

[05:22](#msg59c0a98bcfeed2eb6527b35b)@Oldes I will have a look. FYI, R/S already supports modulo on floats.

Oldes

[06:35](#msg59c0ba9ebc464729744fdf22)@dockimbel thanks.. it is not that much important.. answering this would be more useful now

[06:35](#msg59c0baac210ac269204b4e4a)https://gitter.im/red/red/system?at=59ba63dbb59d55b823f5b3e0

## Wednesday 20th September, 2017

Oldes

[15:50](#msg59c28e3fb59d55b8231c3951)Just pushed UDP client/server Red/System example (Windows version) https://github.com/red/code/pull/77

[15:56](#msg59c28fc87b7d98d30d1aa066)Probably would be more useful, if I would made it as a `Library/Sockets/`

[16:39](#msg59c299bf1081499f1f548b2f)anybody knows in which library may be socket related functions on Linux - sys/socket.h ? libc?

rebolek

[17:41](#msg59c2a8411081499f1f54d571)libc IIRC

## Thursday 21st September, 2017

Oldes

[10:13](#msg59c390beb59d55b823208084)I pushed update - now I can run UDP \[server](https://github.com/Oldes/code/blob/master/Library/Sockets/examples/udp-server.reds)/\[client](https://github.com/Oldes/code/blob/master/Library/Sockets/examples/udp-client.reds) communication on Linux too :) Will try some TCP sockets example.

[15:25](#msg59c3d9db1081499f1f59f3df)I pushed update - now I can run TCP \[server](https://github.com/Oldes/code/blob/master/Library/Sockets/examples/tcp-server.reds)/\[client](https://github.com/Oldes/code/blob/master/Library/Sockets/examples/tcp-client.reds) communication on Linux too :)

[15:41](#msg59c3ddbabc464729745ec9f5)@dockimbel do I understand it well that for the Full I/O support in Red planed for version 0.7.0 we will need also threads? At least in the R/S level?

[17:16](#msg59c3f3f4177fb9fe7eeaa1c7)Although you maybe want to use system api and not going into such a low level like using sockets directly?

## Saturday 23th September, 2017

Oldes

[18:14](#msg59c6a48b7b7d98d30d2bcad0)Updated with \_read-url_ example.

[18:14](#msg59c6a499cfeed2eb6541c5c1)\[!\[image.png](https://files.gitter.im/red/red/code/IRMJ/thumb/image.png)](https://files.gitter.im/red/red/code/IRMJ/image.png)

rebolek

[18:25](#msg59c6a736c101bc4e3afe3fa4)@Oldes TCP server/client on Linux? That sounds great, now I can port Redis client to Red. Thanks!

Oldes

[18:52](#msg59c6ad56c101bc4e3afe5465)It is Red/System only

rebolek

[18:54](#msg59c6adcb210ac2692064e2c2)I wrote Red/System parser for Redis data format three years ago, so it shouldn't be a problem :)

Oldes

[18:54](#msg59c6adf6210ac2692064e384)Also the server is just an example... with limit to 1 connection.

[18:56](#msg59c6ae4832fc8b7e40326369)I would appreciate any feedback regarding naming and file positions.

[19:16](#msg59c6b317bac826f054eff9df)Somehow I feel like years ago, when I started coding in Rebol. With the difference, that now I can go deep insight the OS.

[20:00](#msg59c6bd4ec101bc4e3afe9030)Btw.. just tried all sockets examples on macOS and everything works as expected :] (I was not expecting such an easy compatibility.)

## Monday 25th September, 2017

greggirwin

[18:40](#msg59c94db8bac826f054f9f754)Thanks so much for this @oldes! Really great to see a start on this, and how small and clean the code can be.
