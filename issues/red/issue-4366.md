
#4366: [CRASH] on `image/argb: data`
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4366>

**To reproduce**

1. Start a *fresh console*!!!
2. Input:
```
recycle/off
bin: to binary! mold system
length? bin
i: make image! 5112x1000 / 1x4        ;) to fit 5112000 bytes
i/argb: bin
```
3. See the output:
```
>> recycle/off
>> bin: to binary! mold system
== #{
6D616B65206F626A65637421205B0A2020202076657273696F6E3A20302E362E
340A202020206275696C643A206D616B65206F626A65637421205B0A20202020
20202020646174653A2032352D4D61722D323032302F323A35333A35392B3033
3...
>> length? bin
== 381762
>> i: make image! 5112x1000 / 1x4        ;) to fit 5112000 bytes
== make image! [5112x250 #{
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF...
>> i/argb: bin

*** Runtime Error 98: assertion failed
*** in file: /D/devel/red/red-src/red/system/runtime/libc.reds
*** at line: 162
***
***   stack: copy-memory 00000062h 0041DEABh 0
***   stack: copy-memory 03F20000h 03E84CF0h 5112000
***   stack: red/image/set-data 02B01680h 02A01694h 2
***   stack: red/image/eval-path 02B01680h 03EE2D58h 02A01694h 03EE2C90h false
***   stack: red/actions/eval-path 02B01680h 03EE2D58h 02A01694h 03EE2C90h false
***   stack: red/interpreter/eval-path 03EE2D58h 03EE2CB0h 03EE2CB0h true true false false
***   stack: red/interpreter/eval-expression 03EE2CB0h 03EE2CB0h false false false
***   stack: red/interpreter/eval 02A01674h true
***   stack: red/natives/catch* true 1
***   stack: ctx||534~try-do 003B0794h
***   stack: ctx||534~do-command 003B0794h
***   stack: ctx||534~eval-command 003B0794h
***   stack: ctx||534~run 003B0794h
***   stack: ctx||534~launch 003B0794h
***   stack: ctx||552~launch 003B02DCh
```

Tip: `5112000` bytes has no meaning other than at some point my `mold system` was that big.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 25-Mar-2020/2:53:59+03:00
```



