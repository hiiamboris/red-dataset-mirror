# Archived messages from: [gitter.im/red/audio](/gitter.im/red/audio/) from year: 2018

## Wednesday 21st March, 2018

dockimbel

[01:58](#msg5ab1bc2a27c509a774873736)With the work on full I/O starting soon (next month), we will soon have the `port!` type available, and the possibility to implement a `sound://` port. So now the question is what audio features to support?

[02:00](#msg5ab1bcb727c509a7748738e1)My early plan was to actually have two ports (both async):  
\* `sound://` port for playing samples in raw format (binary!) and user-generated sounds.  
\* `music://` port for playing encoded audio tracks in WAV or MP3 formats (at least).

[02:00](#msg5ab1bcba5f188ccc15dbc3fa)What do you think?

BeardPower

[02:02](#msg5ab1bd1bf3f6d24c689a705b)Sounds good to have short samples/SFX separated from streaming audio.

dockimbel

[02:05](#msg5ab1bdf95f188ccc15dbc906)Now, how (should we?) do we handle multiple audio channels? :-) Should we just let users instanciate several sound:// ports and provide ways to sync them properly?

BeardPower

[02:06](#msg5ab1be42bb1018b37a09ae6a)We should support the major audio formats of the platforms. aiff would be needed for the Apple platforms. MP3 has some licensing issues, so we should also support some of the Open Source formats as well like .ogg. The samples should support a format, which has low latency.

[02:09](#msg5ab1bede458cbde5575a8387)As Red will use the capabilities of the OS, there are low and high level APIs available, which offer all kinds of mixing, so I agree on the idea of multiple instances. Maybe we should also add mixer:// into the game?

greggirwin

[02:11](#msg5ab1bf4fa60157d62f0ea418)https://github.com/red/red/wiki/Audio-R&amp;D

[02:14](#msg5ab1bffabb1018b37a09b6b1)Should `mixer` be a port though? I see it as a dialect for controlling ports and sounds, their position, level, state (play/pause/resume/stop), transition, etc., like VID is for GUIs.

[02:16](#msg5ab1c08c35dd17022e81f284)Maybe it's 2 levels, like VID and View, where sound ports are analogs of faces (no pun intended :^).

BeardPower

[02:16](#msg5ab1c08fbb1018b37a09b9a9)Yeah, that would be a possibility, but IIRC there is some hardware mixer available, to rewire the input and output connections of the sound card.

greggirwin

[02:18](#msg5ab1c112458cbde5575a8c6c)We need a high level option in any case, because we want to send commands, not actual audio, over the wire when possible, like MIDI.

BeardPower

[02:21](#msg5ab1c1a1bb1018b37a09bd15)Absolutely. So yes, we should put mixer into some dialect. A lot of audio is done in software anyway, unless you have special hardware.

[02:21](#msg5ab1c1c65f188ccc15dbd6a7)DSP effects and what not.

greggirwin

[02:22](#msg5ab1c1ddbb1018b37a09bdbd)Think globally, act locally. :^)

BeardPower

[02:22](#msg5ab1c1e85f188ccc15dbd6d0):)

Oldes

[10:16](#msg5ab230e76f8b4b99464fefe6)Hi.. first of all.. I recently experimented with XAudio2 and was able to use it from pure C, so it is easily portable to Red if needed. Problem probably is, that it is not supported on older Windows without redistributable.

dockimbel

[10:17](#msg5ab23141a60157d62f109659)Can we start by using only what each OS supports natively and see how far that can go? We need to know what is the common set of audio features we could support in a cross-platform way.

Oldes

[10:20](#msg5ab231f6a60157d62f109a4d)I'm quite not sure, if I like the port concept. Except some rare situations, feeding the buffer manually from high level code is not necessary. Basically what I would need in most cases is to decode set of sounds into raw data and let the sound engine play these when needed, while be able to modify parameters when the sound is playing (in most cases just volume).

[10:22](#msg5ab23276f3f6d24c689c5997)I never liked the old sound port in Rebol, as it give so much work to the high level.... like decoding and feeding the buffer from interpreter.

[10:24](#msg5ab232eea60157d62f109de5)Writing the decoders in Red/System is also something what hardly anybody want to do. I wish Red could load static libraries.

dockimbel

[10:25](#msg5ab23308e4ff28713a592a4f)@Oldes You mean "link" static libraries?

Oldes

[10:25](#msg5ab2330ff3f6d24c689c5d11)yes

[10:30](#msg5ab23438a60157d62f10a3e7)I would like to see some examples, how the port should be used.. I believe that it is better to use DSL for sound (which could be wrapped in port?).

dockimbel

[10:30](#msg5ab2345a458cbde5575c7763)That's a feature we want to have in the toolchain, though it would take quite a while to add support for it. Though, there is one path in our internal roadmap which leads to such support during this year, if we can afford the time (depends on the extra resources we could hire during the year, to offload me and Qingtian).

Oldes

[10:31](#msg5ab2348827c509a77489357e)This is how I imagine it could be used: https://github.com/red/code/blob/master/Library/Bass/bass-test.red#L26-L34  
Where the `bass/do` could be replaced with whatever else while the syntax of the DSL would keep same.

[10:37](#msg5ab23602f3f6d24c689c6e36)@BeardPower what API should we used if the XAudio2 is not available?

dockimbel

[10:38](#msg5ab23621bb1018b37a0bb2be)BASS is not open source software, and it requires (expensive) payment for non-commercial use. The lib size and features supported are great though, but the licensing makes it a no-go for integrating it in the Red runtime library by default.

Oldes

[10:38](#msg5ab2363b27c509a774893c7c)For Linux/macOS, I would probably used OpenAL, which can be used on mac too, right?

[10:40](#msg5ab23685a60157d62f10b08c)@dockimbel I know.. that is the reason why I experiment with other frameworks and APIs too. I'm not interested in MOD scene.

dockimbel

[10:40](#msg5ab236acc3c5f8b90d98b098)FMOD is open source, but much bigger. Huh, after re-checking it doesn't seem to be open...

Oldes

[10:41](#msg5ab236eb27c509a774893fa7)You need shared library for FMOD, which you would have to distribute with an app, so not for Red console use.

PeterWAWood

[10:42](#msg5ab23731458cbde5575c87da)@Oldes I believe Apple's Core Audio is built on top of OpenAL.

Oldes

[10:43](#msg5ab237566f8b4b9946500ee7)Isn't OpenAL built on top of Core Audio? https://stackoverflow.com/a/4026236/494472

PeterWAWood

[10:47](#msg5ab23848e4ff28713a59431b)You are probably correct. \[This diagram](https://developer.apple.com/library/content/documentation/MusicAudio/Conceptual/CoreAudioOverview/Art/core\_audio\_architecture\_2x.png) indicates that OpenAL is considered an application service in Core Audio.

BeardPower

[11:03](#msg5ab23be7bb1018b37a0bcdca)@Oldes If XAudio2 is not available you can use WASAPI, XAudio or DirectSound.

Oldes

[11:03](#msg5ab23c0fe4ff28713a595795)yes... but which one to start with?

[11:04](#msg5ab23c38fa066c5325554763)is DS available by default? How much old systems we want to target?

[11:05](#msg5ab23c84fa066c532555488c)For making a game, I would just use XAudio2 and provide the binary if needed, but that is not good for Red itself.

[11:06](#msg5ab23cb8f3f6d24c689c9121)On the other side, how many people is using XP and want to play sound from console?

BeardPower

[11:09](#msg5ab23d615f188ccc15dde07d)That is the question. XAudio2 and the newer sound APIs are part of the newer Windows versions. On old version they are part of the DX SDK, which need to be installed.

Oldes

[11:09](#msg5ab23d82e4ff28713a595f18)Windows7 supports XAudio2.7, so it is also fine.

BeardPower

[11:11](#msg5ab23dd1e4ff28713a59601e)Windows XP would need that SDK. Win7, 8, 10 have it on board.

[11:11](#msg5ab23ddbc3c5f8b90d98d5cc)Yes.

Oldes

[11:11](#msg5ab23dece4ff28713a596088)Hm.. Win7 needs the SDK too.

dockimbel

[11:12](#msg5ab23e366f8b4b994650305a)We can forgot XP for audio support.

BeardPower

[11:14](#msg5ab23e8835dd17022e8413f8)@Oldes Ah, sorry, yes. Win7 does not come with 2.7.

Oldes

[11:14](#msg5ab23e98a60157d62f10d9ff)It depends how you translate this: https://msdn.microsoft.com/en-us/library/windows/desktop/ee415802(v=vs.85).aspx

BeardPower

[11:16](#msg5ab23f0cfa066c53255554a5)Yeah, it's a little confusing. It sounds to me, that it's only related to 2.7 and earlier, but 2.8 is on board.

Oldes

[11:17](#msg5ab23f38458cbde5575cb18e)I think so. Win7 would need the dll or use some other API

[11:18](#msg5ab23f9f458cbde5575cb321)XAudio2\_7.dll has 518kB, btw:)

BeardPower

[11:19](#msg5ab23fd5bb1018b37a0bdeef)Yeah, the usual Windows bloat.

Oldes

[11:25](#msg5ab24147fa066c532555602d)I will play with WASAPI a little bit.

[11:26](#msg5ab2415335dd17022e8424f5)When time permits.

[11:27](#msg5ab241b4fa066c53255562cd)Or better to start with the XAudio2 to have at least something? XAudio2 seems to be more friendly as the OS does all the mixing, which I want to avoid doying myself.. WASAPI looks like an adept for the `sound://` port.

BeardPower

[11:30](#msg5ab2423ea60157d62f10efc2)The recent version of SDL dropped XAudio2 and is only using WASAPI now.

[11:32](#msg5ab242d85f188ccc15ddf99a)Yes, there are 4 core audio APIs in Windows:

```
The Core Audio APIs are:

    Multimedia Device (MMDevice) API. Clients use this API to enumerate the audio endpoint devices in the system.
    Windows Audio Session API (WASAPI). Clients use this API to create and manage audio streams to and from audio endpoint devices.
    DeviceTopology API. Clients use this API to directly access the topological features (for example, volume controls and multiplexers) that lie along the data paths inside hardware devices in audio adapters.
    EndpointVolume API. Clients use this API to directly access the volume controls on audio endpoint devices. This API is primarily used by applications that manage exclusive-mode audio streams.
```

[11:34](#msg5ab2434d27c509a774897e7c)All other APIs are on top of these layers.

[11:35](#msg5ab24382fa066c5325556a0f)There are other libraries we could use, which do mixing and DSP.

[11:38](#msg5ab24431fa066c5325556e4c)With the price of a dependency or a port.

Oldes

[11:40](#msg5ab244c5e4ff28713a5984a7)Any known reason why only WASAPI in SDL? I guess to stay cross-platform as much as possible.

BeardPower

[11:43](#msg5ab24551e4d1c6360424e747)Because their XAudio2 implementation is deprecated:  
&gt;Implemented WASAPI support on Windows UWP and removed the deprecated XAudio2 implementation

[11:45](#msg5ab245eabb1018b37a0c029c)Possible, yes. I need to dig through the forum more deeply.

Oldes

[11:48](#msg5ab24696bb1018b37a0c055d)Hm... maybe it would be logical to start with the OpenAL and see, how cross-platform it really is.

[11:49](#msg5ab246c1e4d1c6360424ee84)I guess that the OpenAL32.dll comes with drivers for the sound card, right?

[11:50](#msg5ab246ffbb1018b37a0c07cc)At least mine in system32 folder is signed by Creative Labs. So I believe it was there preinstalled with the OS.

BeardPower

[11:58](#msg5ab248e935dd17022e844b2a)Yes.

[11:59](#msg5ab24904e4ff28713a599a5c)They created the spec.

greggirwin

[17:14](#msg5ab292f1f3f6d24c689e8ba7)Looks like @oldes has already done much design work on the dialect. I had forgotten that. Thanks @oldes!

## Monday 28th May, 2018

Oldes

[16:39](#msg5b0c30d2edd06f7d15edbb68)I'm still having a big question, if is better to implement `audio` as a port or set of native commands (accessible directly or using some DSL) :/

[16:42](#msg5b0c316f93dc78791c90a8ff)I inclined to use the natives directly, but on the other side, I'm pretty sure that I would need to listen for events like that sound ended and in this case, I can imagine that audio port would be more natural.

rebolek

[17:08](#msg5b0c37a2352b9e1a4b3c6f57)I am for `port!` and I believe sample-precise audio can be done that way.

greggirwin

[17:45](#msg5b0c4054160c567d16e429ad)We'll likely want more flexibility than a port interface will allow. e.g., what would it look like to mix, fade, pan, or schedule timing against a port?

Oldes

[17:46](#msg5b0c405e160c567d16e429c1)Sample precise audio would be more about `sound://` port than `audio://` port. I'm more interested in the second one as feeding all the buffers manually would be a waste of resources from the higher level code.

greggirwin

[17:46](#msg5b0c4085361a950a6620e51d)We have the same question for `video://`.

[17:47](#msg5b0c40c9160c567d16e42af1)The dialect may wrap the port, with the port, in turn, wrapping the native commands.

[17:49](#msg5b0c412aba1a351a68ceb2aa)It's a good question, about how to structure it all.

Oldes

[17:49](#msg5b0c4143352b9e1a4b3c9780)

```
a: open [scheme: 'audio channels: 32]
write a [
	sound:   load %jaguar.wav            ;sound can be loaded from file
	drum:    load %drumloop.wav [loop fx volume: 0] ;optional default settings can be specified
	music:   load %feroness_-_sun.mod   ;loads MOD file
	channel: play music [volume: 0]     ;channel can be stored for later use, optional block with settings can be used 
	fade channel [volume: 0.3] 0:0:20   ;it is possible to fade some values in time
	play sound   [volume: 0.4 pan: -1]  ;or not if not needed
	loop: play drum [volume: 1] 0:0:10  ;fade is possible to set even during 'play' command
]
```

[17:50](#msg5b0c417b93dc78791c90e20d)still don't know how to connect it with the events system :)

greggirwin

[17:52](#msg5b0c41f516f6496124e92425)What if we view it like the GUI system? Your dialect above, being like VID, with set-words becoming sound objects that can trigger events and be accessed like we do faces in a GUI?

[17:53](#msg5b0c4227361a950a6620eaaf)Event handling is managed the same way, as part of an event loop, with different back ends available.

[17:55](#msg5b0c4274a45f930a65e0340d)And as we haven styles in VID, there are different audio objects with different facets: sound, MIDI, mixer, channel, sequence, synth, etc.

Oldes

[17:56](#msg5b0c42de361a950a6620ecf9)In the about code... `sound`, `drum`, `music` and `channel` would be handles to appropriate native structures. Wrapping them in object is interesting idea, but I'm far to know, how to do it.

[17:58](#msg5b0c434893dc78791c90eac6)(above code was randomly taken from the bass test file: https://github.com/Oldes/code/blob/master/Library/Bass/bass-test.red#L27-L33)

greggirwin

[17:58](#msg5b0c4359352b9e1a4b3c9eed)Since objects support series ownership and reactivity, they shouldn't limit how we do things.

Oldes

[18:00](#msg5b0c43b3ba1a351a68cebebb)I'm even not able to create an object from R/S. And reactivity is some being living on Mars. :)

greggirwin

[18:01](#msg5b0c43fca7abc8692eeef76f)&lt;he he&gt;

[18:02](#msg5b0c442fc712f561253c4360)Once @BeardPower finishes `money!`, maybe we can have him look at audio a bit.

BeardPower

[18:14](#msg5b0c470d361a950a6620fee7)Should not take much longer. I got some more free time.

[18:14](#msg5b0c4719016ae21a4ceeb1d7)Definitely.

rebolek

[19:33](#msg5b0c599693dc78791c913eca)@greggirwin `audio://device:channel`

[19:34](#msg5b0c59da4eaffb692d61925e)sample precision: `write at audio://device position sample`

greggirwin

[19:36](#msg5b0c5a40ba1a351a68cf1055)And `sample` is prepared out-of-band?

rebolek

[19:36](#msg5b0c5a594eaffb692d619415)what does that mean?

greggirwin

[19:40](#msg5b0c5b104eaffb692d619638)I mean the sample volume, pan position, etc. is all set up ahead of time, so you're just writing raw data to the port.

[19:41](#msg5b0c5b6499fa7f4c06271cec)Because `position` is just a series offset.

BeardPower

[19:43](#msg5b0c5be354ce231361602590)If you want positional audio, you would setup a scene ahead of time but calculate positions in real-time.

rebolek

[19:50](#msg5b0c5d7316f6496124e98a91)@greggirwin right

[19:52](#msg5b0c5ded99fa7f4c0627245e)but my requirements for audio are quite different from eg @Oldes. I believe that multiple implementations would be needed.

Oldes

[19:52](#msg5b0c5e0f016ae21a4cef047d)My requirements are higher:)

rebolek

[19:53](#msg5b0c5e1f352b9e1a4b3d0096)That depends on the point of view.

Oldes

[19:53](#msg5b0c5e2f16f6496124e98cc8)But I see where you are heading.

[19:54](#msg5b0c5e5999fa7f4c062725f1)My point of view is, that I want to be on higher level, not just pushing integers to output buffer.

greggirwin

[19:56](#msg5b0c5f0293dc78791c915247)Oldes has already written a \*lot* of native interfaces to libraries, which are probably the foundation for everything else.

BeardPower

[19:57](#msg5b0c5f12361a950a66215227)@rebolek Could you sketch out the differences?

[19:57](#msg5b0c5f40ba1a351a68cf2105)There are different audio APIs for different requirements.

greggirwin

[19:58](#msg5b0c5f5e52e35117cdeafe79)The work @Oldes has done gives us a huge start on designing a common interface over them.

[20:00](#msg5b0c5ff699fa7f4c06272c51)It's also really good to have different perspectives, @Oldes' game dev background, and @rebolek's synth work, with @BeardPower adding media creation I think.

BeardPower

[20:01](#msg5b0c60274eaffb692d61a7be)Yes, but my current projects are games :)

[20:03](#msg5b0c60ac54ce231361603481)I'm looking forward to switch from Haxe/C\[++] to Red.

[20:05](#msg5b0c610393dc78791c915a53)The mentioned topics above need alot of audio, video and graphic toolsets. It would be just awesome to have everything in Red.
