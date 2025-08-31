
#5325: `load`+`recycle`=CRASH after 1.4GB
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.bug] [type.GC]
<https://github.com/red/red/issues/5325>

Could be related to https://github.com/red/red/issues/5316

**Describe the bug**

`# type 1.red`
```
Red []

k: 10 n: 70 m: 100000
block: append/dup make [] m 0 m
save name: %test.redbin block
; save/as data: #{} block 'redbin
block2: make [] k * n
recycle/off
repeat i k [clock [repeat j n [append/only block2 load name]]]
; repeat i k [clock [repeat j n [append/only block2 load/as data 'redbin]]]
probe stats / 1e6
clock [recycle]
```
`# red 1.red`
```
root: 5775/8466, runs: 0, mem: 2463212 => 2436384, mark: 2.0ms, sweep: 1.0ms
root: 5775/8466, runs: 1, mem: 5112960 => 4587360, mark: 2.1ms, sweep: 1.0ms
187 ms  [repeat j n [append/only block2 load name]]
235 ms  [repeat j n [append/only block2 load name]]
182 ms  [repeat j n [append/only block2 load name]]
213 ms  [repeat j n [append/only block2 load name]]
193 ms  [repeat j n [append/only block2 load name]]
197 ms  [repeat j n [append/only block2 load name]]
220 ms  [repeat j n [append/only block2 load name]]
200 ms  [repeat j n [append/only block2 load name]]
202 ms  [repeat j n [append/only block2 load name]]
203 ms  [repeat j n [append/only block2 load name]]
1685.982544
root: 5775/8466, runs: 2, mem: 1685982676 => 1124097056, mark: 595.1ms, sweep: 562.3ms

*** Runtime Error 1: access violation
*** in file: /d/devel/red/red-src/master/runtime/interpreter.reds
*** at line: 789
***
***   stack: red/interpreter/eval-arguments 04A2035Ch 056A50F0h 056A50F0h 04A2034Ch 056A50A0h 056A5108h 053BFF08h
***   stack: red/interpreter/eval-code 053BFF08h 056A50B0h 056A50F0h 04A2034Ch true 056A50A0h 056A5108h 053BFF08h
***   stack: red/interpreter/eval-path 056A50A0h 056A50B0h 056A50F0h 04A2034Ch false false false false
***   stack: red/interpreter/eval-expression 056A50B0h 056A50F0h 04A2034Ch false false false
***   stack: red/interpreter/eval 04A2034Ch true
***   stack: red/natives/do* true -1 -1 -1 -1
***   stack: dt
***   stack: clock
***   stack: red/_function/call 04A2022Ch 04B03884h 0575D968h 0
***   stack: red/interpreter/eval-code 053C6AC8h 0575D988h 0575D988h 04A2020Ch false 00000000h 00000000h 053C6AC8h
***   stack: red/interpreter/eval-expression 0575D978h 0575D988h 04A2020Ch false false false
***   stack: red/interpreter/eval 04A2020Ch true
***   stack: red/natives/catch* true 1
***   stack: ctx||603~try-do 04B20BE0h
***   stack: ctx||603~launch 04B20BE0h
***   stack: ctx||622~launch 04B205ECh
```
Release console crashes with `n > 60`, debug one with `n > 61` for me.

Also, in the real code I'm seeing curious timing:
`root: 5775/8466, runs: 5, mem: 2471748172 => 892992272, mark: 474.8ms, sweep: 18020838782324208000000000000000000000000.0ms`

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4667 date: 9-Apr-2023/3:24:34 commit: #d36108eeffeafbf14839b5a9cadc9a0acd87f34a ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-05-26T22:17:06Z, dockimbel, commented:
<https://github.com/red/red/issues/5325#issuecomment-1565019299>

    I can't seem to be able to reproduce it on `apply` branch. Can you confirm?

--------------------------------------------------------------------------------

On 2023-05-27T08:39:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/5325#issuecomment-1565281298>

    ```
    >red+view-debug-apply-2023-05-26-1f585ee.exe 1.red
    root: 5783/8473, runs: 0, mem: 2564108 => 2528636, mark: 2.0ms, sweep: 1.0ms
    root: 5783/8473, runs: 1, mem: 4679316 => 4416700, mark: 3.0ms, sweep: 1.0ms
    192 ms  [repeat j n [append/only block2 load name]]
    199 ms  [repeat j n [append/only block2 load name]]
    201 ms  [repeat j n [append/only block2 load name]]
    205 ms  [repeat j n [append/only block2 load name]]
    203 ms  [repeat j n [append/only block2 load name]]
    213 ms  [repeat j n [append/only block2 load name]]
    197 ms  [repeat j n [append/only block2 load name]]
    209 ms  [repeat j n [append/only block2 load name]]
    205 ms  [repeat j n [append/only block2 load name]]
    222 ms  [repeat j n [append/only block2 load name]]
    1686.334676
    root: 5783/8473, runs: 2, mem: 1686334964 => 1124187608, mark: 148.7ms, sweep: 23647570.4ms
    
    *** Runtime Error 1: access violation
    *** in file: /D/devel/red/red-src/red/runtime/datatypes/block.reds
    *** at line: 61
    ***
    ***   stack: red/block/rs-tail 054C78B0h
    ***   stack: red/interpreter/eval-arguments 04AC03CCh 054C7900h 054C7900h 04AC03BCh 054C78B0h 054C7918h 0 false
    ***   stack: red/interpreter/eval-code 051CFDD0h 054C78C0h 054C7900h 04AC03BCh true 054C78B0h 054C7918h 051CFDD0h 0 false
    ***   stack: red/interpreter/eval-path 054C78B0h 054C78C0h 054C7900h 04AC03BCh false false false false
    ***   stack: red/interpreter/eval-expression 054C78C0h 054C7900h 04AC03BCh false false false
    ***   stack: red/interpreter/eval 04AC03BCh true
    ***   stack: red/natives/do* true -1 -1 -1 -1
    ***   stack: dt
    ***   stack: clock
    ***   stack: red/interpreter/call 04AC029Ch 049F3884h 05585278h 0
    ***   stack: red/interpreter/eval-code 051D69B0h 05585298h 05585298h 04AC027Ch false 00000000h 00000000h 051D69B0h 0 false
    ***   stack: red/interpreter/eval-expression 05585288h 05585298h 04AC027Ch false false false
    ***   stack: red/interpreter/eval 04AC027Ch true
    ***   stack: red/natives/catch* true 1
    ***   stack: ctx||606~try-do 04A0FC30h
    ***   stack: ctx||606~launch 04A0FC30h
    ***   stack: ctx||625~launch 04A0F63Ch
    ```
    no miracles :)

--------------------------------------------------------------------------------

On 2023-05-27T09:06:25Z, qtxie, commented:
<https://github.com/red/red/issues/5325#issuecomment-1565294168>

    > Also, in the real code I'm seeing curious timing:
    root: 5775/8466, runs: 5, mem: 2471748172 => 892992272, mark: 474.8ms, sweep: 18020838782324208000000000000000000000000.0ms
    
    Memory corruption that mess up the timing?

--------------------------------------------------------------------------------

On 2023-05-27T12:37:23Z, dockimbel, commented:
<https://github.com/red/red/issues/5325#issuecomment-1565394558>

    OK, I can reproduce it when I run the code through the GUI console in command-line mode.

