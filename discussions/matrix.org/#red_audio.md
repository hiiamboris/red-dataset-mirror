# Archived messages from: https://app.gitter.im/#/room/#red_audio:gitter.im (https://app.gitter.im/#/room/!xSzPWFGLavWjXGbNSt:gitter.im)

## 30-Sep-2021

[14:48:22](#RZhIUtcMye7jMnA08jWb_LyzT5s58GULRlFTornpTUk) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Should I report bugs for the new audio port?

[18:20:42](#Ldx5bRWDDjQxnhxEp4Q1RHPK7uNZOkvuF9uHqzjJ_NI) <greggirwin (Gregg Irwin)>:
Can't hurt IMO.

[19:01:09](#RRLYv_0qL0TWU2eAM-Vb8tnIqwZXJXs6cuQtJhuVe9I) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Ok... this one is really basic:
```
x: load %/C/Windows/Media/chimes.wav
port: open audio://
write port x ;<--- CRASH

[19:01:16](#04DGl_W-u3GCpzUVONPEDWjxT_zpiDrzUXWZee6UIHg) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* Ok... this one is really basic:
```
x: load %/C/Windows/Media/chimes.wav
port: open audio://
write port x ;<--- CRASH
```

[19:20:48](#-9UA5mORmnSv8egGuODMcJ4iu-5s0KREmDdc5r4P7IU) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Also I cannot find, how to play more sounds together without mixing data manually.
```
>> p1: open audio:// p2: open audio://
*** Access Error: cannot open: "Port is already opened"
```

## 1-Oct-2021

[4:19:16](#hDO7WX1i5_27FrnyGRqBeiFdbyNPhWoRkS3L3s9Fp_E) <qtxie>:
The current audio port is a prototype. I don't have any experience on audio programming. I use the Rebol docs as a reference. I think we need to write the spec of the port first. 

[4:19:42](#w7qfVrBM1A7vPVHmo49RqXlxcbZ8SCXTkMmEaJIUXhU) <qtxie>:
* The current audio port is a prototype. I don't have any experience on audio programming. I use the Rebol docs as a reference. We need to write the spec of the port first. 

[5:36:11](#yYCv8b6bQxOBZSTcbR9HqhBDSuO4EuA0voObljW9tIs) <rebolek (Boleslav Březovský)>:
I try to find the specs I wrote for R3 audio port.

[5:36:40](#q35OMG8NRbJmS3olDbnef6jpt97L3v4TjHA6Aih6SFY) <greggirwin (Gregg Irwin)>:
@Oldes, you, @rebolek, @hiiamboris, and @BeardPower are the prime candidates to test and provide design input and assistance with audio. 

[5:37:58](#qLRJzQJ0rdNsesWJBFR7ZKbrLUuqrTrco5zPXx-Ql8k) <greggirwin (Gregg Irwin)>:
You have some of the deepest real-world experience in this area.

[5:40:13](#eWxcY0Fton6BJI9j2_yhRIbtUfqDfZOa9lwv1Q77ONY) <greggirwin (Gregg Irwin)>:
We have a [wiki page](https://github.com/red/red/wiki/%5BDOC%5D-Audio-R&D)  where we can make notes as well.

[9:36:48](#8stZ-UREKStz_vhwanZyG6IurGGPbg4LIhnisxoC_6Q) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@qtxie current implementation (at least on Windows where I play with it) does not support 24bit audio data.

[10:10:27](#x1A9GS6IMShDMYpfN0qfopG324be08mwPjRuSM64xMs) <qtxie>:
Yes

[10:12:54](#ylM7AZzI_xe0CYEDygQlRKrQ203srPVXURFdJ1st6VU) <qtxie>:
* Yes, 16bit integer, 32bit integer and 32bit float only. We should support all the other formats later.

## 23-Nov-2021

[15:44:48](#89JtWdvp6aH_ru_PyKo5NVNnSbj0m6SXY_NVE9zco74) <ldci (François Jouen)>:
While waiting for sound support, have a look here: http://sox.sourceforge.net

[17:03:52](#mus_s9uUbHwuFlngBU0BMzLD8DkKH0NjW5e7591iLTo) <ldci (François Jouen)>:
For fun: Hello world in morse code with light and sound.


[17:03:53](#Gt8CfUGEzk9M8Z2fSeFKL1g890kDQn50uAR0RUgIQ_M) <ldci (François Jouen)>:
[![image.png](https://files.gitter.im/5ab1b630d73408ce4f925702/PGcP/thumb/image.png)](https://files.gitter.im/5ab1b630d73408ce4f925702/PGcP/image.png)

[17:04:17](#cRC3ttJxjXM66LUlDpdGQq0eMugH14LCdHFBbth2JYA) <ldci (François Jouen)>:
[![image.png](https://files.gitter.im/5ab1b630d73408ce4f925702/ZQvB/thumb/image.png)](https://files.gitter.im/5ab1b630d73408ce4f925702/ZQvB/image.png)

[19:45:56](#JJq8ktn0JhTWpPcYXdC9ftHzEXBL9fFI2D3gp_CjN6E) <greggirwin (Gregg Irwin)>:
Nice! Wrapping CLIs in GUIs is a great use case for Red. @qtxie is working on audio, but we won't have the breadth of support that libs like sox and ogg do, so giving people examples of how to integrate them is great.

## 24-Nov-2021

[10:12:30](#zpr_yyY1qLmh4aJrl0C4x3-dSKll-gcHrtDccxDGEmw) <ldci (François Jouen)>:
@greggirwin . Call is really useful. In this sample I use 2 simple functions which are conjointly activated:
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


[11:23:42](#ODDWnuDPgWSnf_s_25Qvt7NTA72nkktIW5cwHBU6HBM) <ldci (François Jouen)>:
@greggirwin A better solution
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


[19:52:05](#lSmX15wtWZfjFRtf85pnvB52l_CRfzJ8lVB0uTRMCQc) <greggirwin (Gregg Irwin)>:
:+1:

## 27-Apr-2024

[0:27:10](#ywHTfakijvpyY14wRzHAE7yjOZscO_cWhODwiFeWgwA) <greggirwin (Gregg Irwin)>:
I doubt I'd be able to do this in Red, but I wish I could. Here's the project. I wrote a play, which is being produced next January. In this play there is a human and 4 AIs. The director isn't sure if the voice actors will "manifest" during the show, but we know that they will start out as just voices...and visualizations. Live visualizations. That is, I want the mic feed from each AI actor to drive the viz, and when there are glitches, that should be represented somehow, so some level of control throughout. 

It's possible that we'll have to simplify and just use some live DMX interface and simple lighting as the viz. But step one is figuring out what they *could* look like, what tools exist, and if Red can play a role in the creation of this effect.

All thoughts are welcome.

[7:39:12](#xxE9gA4wRoUULFyOiKaag6Q0_-PzJLmLEGj1tfu_G9k) <gurzgri>:
If not Red, then maybe Oldes ' Rebol3? Afaik, he has put some work in a R3 MIDI port which probably might help with the DMX interface. That said, I know exactly nothing about event technology. Sounds like a great project!

[17:09:14](#YoM0yOYZPivnFddpGi1cSURDhGV2SWWT2BsW35J1vFo) <greggirwin (Gregg Irwin)>:
Yes, I've thought about that too.

[17:29:38](#vStUlGiFnTG9ZNgQFXDKF3A0VpHwUeb00fs-1G4sIgY) <Oldes (@oldes.h:matrix.org)>:
In that case one would have to improve my [`Rebol-MiniAudio`](https://github.com/Oldes/Rebol-MiniAudio) native extension to support audio input.

[17:32:37](#NNt1TlwF7AqXVLMtirPhMNpcsHQ50pCnNfH6egr_u4Y) <Oldes (@oldes.h:matrix.org)>:
For Red there is my old [`pa-record.reds`](https://github.com/red/code/blob/master/Library/Portaudio/examples/pa-record.reds) code which I was able to use to record an audio using PortAudio library... but I am not sure if it is still working.

[19:05:33](#-RDAvWIdIU77-Lpr_FDVIh9JnA8gh5kKcc0aHtk1giI) <greggirwin (Gregg Irwin)>:
Thanks!

