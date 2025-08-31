# Archived messages from: [gitter.im/red/audio](/gitter.im/red/audio/) from year: 2019

## Thursday 31st January, 2019

greggirwin

[22:04](#msg5c5370e2f04ef00644bb99e2)We do have this room. No idea why Gitter wasn't showing it to me.

rebolek

[22:05](#msg5c53711b454aad4df7d45faa)@greggirwin You should use Red-based reliable tools instead of web stuff :smirk:

greggirwin

[22:05](#msg5c5371278aa5ca5abf639dc2)Agreed.

BeardPower

[22:06](#msg5c53717c93fe7d5ac021d73c)I totally forgot about it!

[22:07](#msg5c5371a813a2814df6fc0062)So the first step would be a PoC running on Windows?

rebolek

[22:08](#msg5c5371cc975714406b73a42c)`audio://` ?

BeardPower

[22:08](#msg5c5371f4454aad4df7d464e3)Using the new

```
port!
```

type?

rebolek

[22:09](#msg5c537211454aad4df7d4666a)Yes, but it needs to be done at R/S level.

BeardPower

[22:09](#msg5c53722313a2814df6fc03c8)Challenge accepted?

rebolek

[22:11](#msg5c537283454aad4df7d4686a)I'm not going to investigate Windows solution, as I have no Win machine, but certainly would look into Linux and macOS.

BeardPower

[22:14](#msg5c53733141775971a0b72397)I did a little of R&amp;D about it: https://github.com/red/red/wiki/%5BDOC%5D-Audio-R&amp;D

[22:17](#msg5c53740cc2dba5382ebda4ab)It should not be that hard to implement a PoC.

[22:19](#msg5c5374661b62f126508040a0)I will look into it over the weekend.

rebolek

[22:21](#msg5c537500f46373406a3122ec)@BeardPower I would start with something simpler IMO. I have sound/musical background so mono&amp;stereo is enough for me most of the time. 3D audio is nice, but not always necessary.

BeardPower

[22:22](#msg5c53753013a2814df6fc172d)@rebolek Yes. The POC would be a "sine wave hello world" one.

[22:23](#msg5c53754dca428b0645343476)3D audio is mainly used in games, yes.

rebolek

[22:24](#msg5c5375a2ceb5a2264f72c193)"sine wave hello world" exactly

## Friday 1st February, 2019

BeardPower

[15:39](#msg5c54684b41775971a0bd558a)I looked a little into the Red/System sources. Everything for OLE is there, which is great.  
Now we need to decide what we should use:  
XAudio2, Core Audio (WASAPI etc.) or ASIO? * not to mix Core Audio with the macOS CoreAudio.  
XAudio2 is on top of Core Audio and support DSP effects and all the fancy stuff. It's higher latency than Core Audio but it's still low latency.  
Core Audio is the lowest hardware interface giving you the lowest latency possible but it's more complicated to code with. It's used for pro audio software.  
ASIO is a driver interface developed by Steinberg. It needs its own driver but is independent to the Windows drivers. It also offers lowest-latency and is used for pro audio software. Its licensed by Steinberg.

[15:41](#msg5c54688d454aad4df7da8b93)Core Audio is the equivalent to Pulse Audio and Jack on Linux and CoreAudio on macOS.

rebolek

[18:18](#msg5c548d8e8aa5ca5abf6ae358)I've been looking at Pulse Audio and playing a sample in C looks really easy, so R/S should be at home there.

At first, I would prefer most direct access to HW, so no DSP stuff, this can be done in R/S. So Core Audio, CoreAudio and Pulse Audio.

BeardPower

[19:44](#msg5c54a18d93fe7d5ac02993a0)Most direct access to HW: assembler ;-)

[19:45](#msg5c54a1c054f21a71a1e1c685)Where are my SID chips :-)

rebolek

[20:24](#msg5c54aafb41775971a0bf3411)Yeah, I meant most direct at OS level of course :-)

[20:24](#msg5c54ab1b7b68f9410256a32a)My SID chip is patiently waiting for some additional hardware and lot of time ;)

## Friday 15th March, 2019

topcheese

[10:09](#msg5c8b79c7eca34208c6e99a6e)Hi, I was thinking about using Csound and possibly Vamp, but Superpowered looks really nice. It would be nice to build some type of pluggable backend that supports things like VST, LV2, and Vamp. It looks we have a way to go before we get there. https://www.vamp-plugins.org/

[10:49](#msg5c8b8328c627612ffd9ef818)There doesn't seem to be a lot of documentation and tutorials floating around for Superpowered. I'm still leaning towards Csound. I don't have a good feeling about it because of unanswered questions like this one. https://stackoverflow.com/questions/54456092/how-to-download-superpowered-sdk

[10:58](#msg5c8b85614844137f8332025a)I also see that Racket has a Csound binding. Perhaps Red should also have one? https://github.com/aqui18/racket-csound

rebolek

[11:04](#msg5c8b86a7c627612ffd9f117f)If someone’s willing to write it, then why not :smile:

[11:06](#msg5c8b871cf5841318cdf31224)Docs look nice https://csound.com/docs/api/csound\_8h.html

topcheese

[11:15](#msg5c8b893a3519ca08c7b0466c)I'm not sure people would want me to write it, but it'll take me some time. I'm still trying to read up and practice as much as I can on Red. I'm still not even sure if I can call the executable, or if I can load the DLL. I've been bouncing back and forth between the Rebol and Red docs.

[11:17](#msg5c8b89c8f6999130a00bdb91)I like it because it's easy and simple like Red, plus it's fully backwards compatible with code from the 80's, so there's plenty of useful documentation out there that's still good. Kind of like with Rebol. ;-)

rebolek

[11:23](#msg5c8b8b2e85ba5b30a11c878a)You can do both, call executable and/or load DLL.

Oldes

[14:56](#msg5c8bbd2ba28d73296cefee01)I quite cannot imagine how you could connect Red with Csound. But can imagine use something like Soundpipe https://github.com/PaulBatchelor/Soundpipe

[15:01](#msg5c8bbe391314c277618de94b)Being able to compile the Csound code using its api \[`csoundCompile`](https://csound.com/docs/api/group\_\_\_p\_e\_r\_f\_o\_r\_m\_a\_n\_c\_e.html#ga92c741a482b072bc503f790bf0824dad) should be quite trivial. If there is 32bit Csound dll available.

[15:10](#msg5c8bc069f5841318cdf4c11a)@topcheese The hardest part of such a tasks is to define, how the (usage) code should look like.

[15:11](#msg5c8bc0aff6999130a00d6093)You would like to be able have Red code like this one for Python? https://csound.com/docs/ctcsound/ctcsound-API.html#introduction

topcheese

[15:16](#msg5c8bc1bf4844137f8333cad7)Soundpipe looks good. Yeah it seems you have to build your own 32 bit version with Csound.

[15:27](#msg5c8bc455f8066c18ce520d92)@Oldes I'm pretty sure that's ultimately the route I'd like to go. I just started looking at all of this in the last few days, so I haven't had time to figure it all out yet. I also just found Csound about a couple weeks ago and started to learn that. I was using a tool called Cabbage to develop some audio plugins, but then I ran into Red. So I'm not really sure what would be the best way to integrate it with Csound. There are so many ways to do it? Thanks for the input!

[15:29](#msg5c8bc4e14844137f8333dfc2)Most people use haskell or python with Csound. It just seems Red would be a better choice.

[15:32](#msg5c8bc584c627612ffda0dede)Then we could use Red to build something like this for Csound. https://blue.kunstmusik.com/

Oldes

[15:34](#msg5c8bc6182b6075296bce608a)I may give it a try... one day.

topcheese

[15:35](#msg5c8bc6392b6075296bce614f)is that a challenge accepted? hahaha

Oldes

[15:35](#msg5c8bc64cf5841318cdf4ebfb)At least the Red/System part.

topcheese

[15:35](#msg5c8bc64ff5841318cdf4ec01)We'll get there some day.

[15:49](#msg5c8bc98a2b6075296bce7aa0)Yeah it looks like the same thing can be done with Sporth/Soundpipe

BeardPower

[19:26](#msg5c8bfc48f6999130a00f14bb)A tracker is cooler ;-)

rebolek

[20:43](#msg5c8c0e6fcfd0b65f74c6ede5)tracker is very limited

Oldes

[22:41](#msg5c8c2a1e6a3d2e230dcf2f46)Ok... I'm playing with the Soundpipe... it looks its just a set of various "modules" which take some input and produce output and or just generate some output. All modules are described in `lua` code like this oscillator: https://github.com/PaulBatchelor/Soundpipe/blob/master/modules/data/blsaw.lua

The question is, how you would imagine the Red code should look like?

[22:43](#msg5c8c2a7cfcaf7b5f73bebcf1)That is probably question for @rebolek as he is writing own synth. ;-)

## Saturday 16th March, 2019

topcheese

[00:05](#msg5c8c3db22fb6800d80281ceb)That's great to know he's writing one. I was just about to start to start writing one, but got side-tracked by Red. I never got into lua, and I figured Red could some day replace an obscure scripting language called GDScript in the Godot game engine. I had just recently started using that for cross platform games and applications. I think LibRed will come in handy for that. https://docs.godotengine.org/en/3.0/getting\_started/scripting/gdscript/gdscript\_basics.html

## Sunday 17th March, 2019

topcheese

[02:47](#msg5c8db55bfa5b721a1fa03f72)Although I found a few more that look like a better fit for Red. https://github.com/dr-soft/miniaudio

[02:48](#msg5c8db586ec203c59b7b18827)https://github.com/jarikomppa/soloud

[02:48](#msg5c8db59adfc69a1454a816de)http://libsound.io/

[02:49](#msg5c8db5a7ec203c59b7b18907)http://www.attr-x.net/yse/

[02:50](#msg5c8db5ffec203c59b7b18ab4)I'm leaning towards MiniAudio.

[02:58](#msg5c8db7e42fb6800d80315294)Actually I like them all, but I guess I wouldn't know which would be better.

Oldes

[08:00](#msg5c8dfe869d9cc8114ad3f708)Thanks for links.. libsound.io and miniaudio are new to me.. will have to check them.

BeardPower

[09:11](#msg5c8e0f28ec203c59b7b39d23)Great links. Now I'm used to Red, looking at the C/C++ code makes my eyes hurt.

topcheese

[12:45](#msg5c8e417d8126720abcf8e911)Yes they remind me of why I always went for the higher level languages. I've used so many different flavors and dialects, and it's become like fake news to me. Even then I would start to learn it then find something better and move on. I find that Red seems deceptively simple, yet it feels like it's potentially one of the most powerful languages I've ever run across. Red has warts and all, but Red/Rebol seem to be the real deal. I trust all the people smarter than I am that still believe and support it, otherwise you all wouldn't be wasting your time and effort. I could be wrong. :-)

[12:53](#msg5c8e433cfa5b721a1fa370c3)I did play around the RGB to use on miniaudio, but I couldn't get the example dll to build. I don't see to get any errors, but I was thinking that's one more thing I'll have to learn to use. https://github.com/Pebaz/RGB

9214

[13:03](#msg5c8e45b53dd81711490633fc)@topcheese and where Red has warts, exactly?

topcheese

[15:10](#msg5c8e636449fdaa0d81cd1a28)@9214 So we want to go down that road do we? Why so you can perhaps brand me as a hater? I think you know the warts, and a quick Internet search reveals that. I've read the excuses why the software is still at an alpha stage, and they all seem reasonable, but that doesn't stop it from being alpha software ... which that in and of itself denotes warts does it not? Trust me in that you 're in a better position to see any warts in the project. I also look at projects like Jetbrains mps even though it's not fair to compare them, but it seems Red has a way to go before it gets to that level. I found Jetbrains through a Red/Rebol link, and even though it looked all snazzy I still thought Red was more powerful. A wart is a wart, but warts are superficial and can be cured. Just remember that. ;-)

[15:18](#msg5c8e652e9d9cc8114ad6931b)Where's my package manager? Just kidding!

[15:25](#msg5c8e66cd6a3d2e230ddca6a6)Other than that I can understand your concern because I think the project is pretty tight. Every project out there has its warts, and Red is no different. I've heard rumors that the projects not that open, but so far it seems pretty open considering it's still at an alpha stage. I can understand wanting to keep the source reserved to the most experienced developers. I was more or less speaking in general, but you don't see that stopping me from coming back. :-)

## Tuesday 19th March, 2019

greggirwin

[02:00](#msg5c904d52fa5b721a1fb0cac4)&gt; but that doesn't stop it from being alpha software ... which that in and of itself denotes warts does it not?

@topcheese there's a big difference between language design warts and implementation warts, or warts we'll grow out of. Of course, more warts can appear as well. And things we sometimes view as warts are intentional, and part of a language's design. There is no such thing as perfect, just different choices.

Oldes

[12:36](#msg5c90e2582fb6800d8045ffcc)I was playing with `miniaudio` and I'm quite not sure if it is the right way for Red... even the `simple_enumeration` example which does nothing more than prints out available in/out devices produces exe which has 200kB striped, which is quite a lot, when it could just call OS to get such an info.

[12:39](#msg5c90e2f0dfc69a1454bca20f)Anyway... I don't know if Red has warts or not, but it does not have a port specification, which is quite important for real use. If you don't want to just play samples, which is possible with several other libs, which are in red/code repository.

[12:40](#msg5c90e3562fb6800d80460854)Another problem with `miniaudio` is, that it is just a single header file, co you would have to first make a shared library from it to be usable with Red.

[15:48](#msg5c910f38fa5b721a1fb5fb69)Looks like `libsoundio` is better... shared library (with WASAPI backend) is 100kB and example listing devices (with quite a lot details) is 18kB.

topcheese

[19:15](#msg5c913fc7f3dbbd230c829bc0)@Oldes , They recently released 2.0 and use the MIT license. It looks really nice and thanks for checking it out. I don't have any real preference, but I would like to use Red to write a simple game, so it's nice to know my options.
