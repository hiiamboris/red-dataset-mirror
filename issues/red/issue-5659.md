# Issue #5659: CRASHing interaction between GC, GTK View, and load
<https://github.com/red/red/issues/5659>

**Describe the bug**

```
i: 1
root: 6221/8906, runs: 0, mem: 3069684 => 2843524, mark: 1.0ms, sweep: 0.7ms

*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/master/runtime/datatypes/block.reds
*** at line: 50
***
***   --Frame-- --Code--  --Call--
***   FFBB483Ch 0808E4DEh red/block/rs-head F292D154h
***   FFBB489Ch 080E53C7h red/interpreter/eval-path F292D154h F292D184h F292D194h 09465FD4h true false false false
***   FFBB4918h 080E749Ah red/interpreter/eval-expression F292D184h F292D194h 09465FD4h false false false
***   FFBB4968h 080E7D70h red/interpreter/eval 09465FD4h true
***   FFBB49A0h 080CF195h red/natives/repeat* false
***   FFBB4A94h 080E6B3Fh red/interpreter/eval-arguments 09465FA4h F292D20Ch F292D20Ch 09465F94h 00000000h 00000000h 0 false
***   FFBB4AECh 080E6CE0h red/interpreter/eval-code F2B27BFCh F292D1DCh F292D20Ch 09465F94h false 00000000h 00000000h F2B27BFCh 0 false
***   FFBB4B70h 080E7769h red/interpreter/eval-expression F292D1DCh F292D20Ch 09465F94h false false false
***   FFBB4BC0h 080E7D70h red/interpreter/eval 09465F94h true
***   FFBB4C20h 080D00CEh red/natives/do* false -1 -1 -1 -1
***   FFBB4D24h 080E6B3Fh red/interpreter/eval-arguments 09465F84h F292CC8Ch F292CC8Ch 09465F64h 00000000h 00000000h 0 false
***   FFBB4D7Ch 080E6CE0h red/interpreter/eval-code F2B27CECh F292CC7Ch F292CC8Ch 09465F64h false 00000000h 00000000h F2B27CECh 0 false
***   FFBB4E00h 080E7769h red/interpreter/eval-expression F292CC7Ch F292CC8Ch 09465F64h false false false
***   FFBB4E50h 080E7D70h red/interpreter/eval 09465F64h true
***   FFBB4E90h 080D43A0h red/natives/catch* true 1
***   FFBB4ED8h 0815DADBh ctx||631~try-do F27BB4B0h
***   FFBB4F34h 0815DF6Dh ctx||631~do-command F27BB4B0h
***   FFBB4F60h 0815ED63h ctx||631~eval-command F27BB4B0h
***   FFBB4F9Ch 0815F3CFh ctx||631~run F27BB4B0h
***   FFBB4FF0h 0815FCCDh ctx||631~launch F27BB4B0h
***   FFBB5014h 0816135Ch ctx||650~launch F27BBAC0h
***   FFBB502Ch 0806EBA8h ***_start
```
Big image matters. Smaller ones do not produce the crash so easily. Content of the image doesn't seem to matter. `load-thru` doesn't trigger it. `recycle/off` doesn't trigger it. Absence of an image face doesn't trigger it.

**To reproduce**

Use this script:
```
Red [Needs: 'View]

view/no-wait [im: base 50x50]
repeat i 999 [
	?? i
	im/image: load https://link.storjshare.io/raw/jv4poamoeywjmhbg6hpktcgxefaa/img/Utnifxg.png
	do-events/no-wait
]
```

**Expected behavior**

No crash.

**Platform version**
```
Red 0.6.6 for Linux built 29-Jun-2025/12:36:06
```



## hiiamboris on 2025-10-23T12:50:50Z
It's not the first time I notice web reads corrupting the memory, but this case has 100% reproduction rate for me. Web access is where I would start looking.


## dockimbel on 2025-10-23T13:49:46Z
Simple-IO subsystem is known to have some GC-related issues left.


## dockimbel on 2025-10-23T19:44:25Z
Do you run that script from the CLI console or compiled? I tried compiling it, no crashes.


## dockimbel on 2025-10-23T20:00:59Z
Can't reproduce the crash either way:
```
>> do %bug2.red
running
i: 1
root: 6336/9023, runs: 0, mem: 3245412 => 2962148, mark: 0.9ms, sweep: 0.6ms
i: 2
i: 3
root: 6336/9023, runs: 1, mem: 4841688 => 2962824, mark: 0.8ms, sweep: 3.0ms
i: 4
i: 5
root: 6336/9023, runs: 2, mem: 4841808 => 2962944, mark: 1.1ms, sweep: 1.6ms
i: 6
i: 7
root: 6336/9023, runs: 3, mem: 4841928 => 2963064, mark: 0.9ms, sweep: 2.7ms
i: 8
i: 9
root: 6336/9023, runs: 4, mem: 4842048 => 2963184, mark: 1.2ms, sweep: 1.3ms
i: 10
i: 11
root: 6336/9023, runs: 5, mem: 4842168 => 2963304, mark: 0.9ms, sweep: 3.1ms
i: 12
i: 13
root: 6336/9023, runs: 6, mem: 4842288 => 2963424, mark: 1.1ms, sweep: 1.1ms
i: 14
i: 15
root: 6336/9023, runs: 7, mem: 4842408 => 2963544, mark: 1.6ms, sweep: 1.2ms
i: 16
i: 17
root: 6336/9023, runs: 8, mem: 4842528 => 2963664, mark: 1.1ms, sweep: 1.0ms
i: 18
i: 19
root: 6336/9023, runs: 9, mem: 4842648 => 2963784, mark: 1.4ms, sweep: 1.3ms
i: 20
i: 21
```

I'm testing on a Ubuntu 24.10 VM on VirtualBox.


## hiiamboris on 2025-10-24T13:34:24Z
Sorry. I should update more often. No crashes in `Red 0.6.6 for Linux built 16-Oct-2025/19:50:42+08:00  commit #bfc01e1`. Neither for this code, nor for the original R&M images.


