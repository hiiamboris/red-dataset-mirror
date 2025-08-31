# Archived messages from: [gitter.im/red/audio](/gitter.im/red/audio/) from year: 2021

## Thursday 30th September, 2021

Oldes

[14:48](#msg6155ce2c98c13e7550ac7043)Should I report bugs for the new audio port?

greggirwin

[18:20](#msg6155fff9d3ae402e47222648)Can't hurt IMO.

Oldes

[19:01](#msg61560974cd4972068b20b9dd)Ok... this one is really basic:

```
x: load %/C/Windows/Media/chimes.wav
port: open audio://
write port x ;<--- CRASH
```

[19:20](#msg61560e0f3f09d85736ea5228)Also I cannot find, how to play more sounds together without mixing data manually.

```
>> p1: open audio:// p2: open audio://
*** Access Error: cannot open: "Port is already opened"
```

## Friday 1st October, 2021

qtxie

[04:19](#msg61568c43ee6c260cf7f3e64f)The current audio port is a prototype. I don't have any experience on audio programming. I use the Rebol docs as a reference. We need to write the spec of the port first.

rebolek

[05:36](#msg61569e498c019f0d0b0e185e)I try to find the specs I wrote for R3 audio port.

greggirwin

[05:36](#msg61569e68cd4972068b21ed0b)@Oldes, you, @rebolek, @hiiamboris, and @BeardPower are the prime candidates to test and provide design input and assistance with audio.

[05:37](#msg61569eb58c019f0d0b0e19bf)You have some of the deepest real-world experience in this area.

[05:40](#msg61569f3c7db1e3753e175ad4)We have a \[wiki page](https://github.com/red/red/wiki/%5BDOC%5D-Audio-R&amp;D) where we can make notes as well.

Oldes

[09:36](#msg6156d6afa41fd20699bbdef4)@qtxie current implementation (at least on Windows where I play with it) does not support 24bit audio data.

qtxie

[10:10](#msg6156de937db1e3753e17dc47)Yes, 16bit integer, 32bit integer and 32bit float only. We should support all the other formats later.

## Tuesday 23th November, 2021

ldci

[15:44](#msg619d0c6f026dc63ca610f0e5)While waiting for sound support, have a look here: http://sox.sourceforge.net

[17:03](#msg619d1ef776e3791755ffcd58)For fun: Hello world in morse code with light and sound.

[17:03](#msg619d1ef88f98cb081187ca18)\[!\[image.png](https://files.gitter.im/5ab1b630d73408ce4f925702/PGcP/thumb/image.png)](https://files.gitter.im/5ab1b630d73408ce4f925702/PGcP/image.png)

[17:04](#msg619d1f11026dc63ca611204b)\[!\[image.png](https://files.gitter.im/5ab1b630d73408ce4f925702/ZQvB/thumb/image.png)](https://files.gitter.im/5ab1b630d73408ce4f925702/ZQvB/image.png)

greggirwin

[19:45](#msg619d44f3197fa95a1c895bb1)Nice! Wrapping CLIs in GUIs is a great use case for Red. @qtxie is working on audio, but we won't have the breadth of support that libs like sox and ogg do, so giving people examples of how to integrate them is great.

## Wednesday 24th November, 2021

ldci

[10:12](#msg619e100d8f98cb081189d169)@greggirwin . Call is really useful. In this sample I use 2 simple functions which are conjointly activated:

```
light: func [
	b	[float!]
][
	plot/2: yellow
	canvas/draw: reduce [plot]
	wait b
	plot/2: black
	canvas/draw: reduce[plot]
]

beep: func [
	b	[float!]
][
	prog: rejoin ["play -n synth " form b " sine 700"]
	call/wait prog
]
```

[11:23](#msg619e20bcc6149e5349490867)@greggirwin A better solution

```
plot: compose [pen green fill-pen black circle 150x150 100]

light: func [
	b	[float!]
][
	plot/4: yellow wait b plot/4: black
]
beep: func [
	b	[float!]
][
	call/wait rejoin ["play -n synth " form b " sine 700"]
]
```

greggirwin

[19:52](#msg619e97e4b5ba9e5a11d361ff):+1:
