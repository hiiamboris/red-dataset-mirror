
#3920: write/info crashes with GC on
================================================================================
Issue is closed, was reported by qtxie and has 2 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3920>

**To reproduce**
```
>> candles-url: https://api-fxtrade.oanda.com/v3/instruments/EUR_USD/candles?price=M&from=2019-06-09T22:00
>> write/info candles-url [GET [Authorization: "Bearer 8534d1f6644e4b83eeef98a1b5a316a7-0ad4b58c0054ce19858b74373f97a369" Content-Type: "application/json"]]
root size: 2885, root max: 4600, cycles: 0, before: 2991664
*** Runtime Error 1: access violation
*** in file: /home/sony/Code/red/runtime/allocator.reds
*** at line: 455
***
***   stack: red/update-series F63D6F5Ch 355752 1360
***   stack: red/compact-series-frame F6362004h 09D823C8h
***   stack: red/cross-compact-frame F6362004h 09D82280h
***   stack: red/collect-frames 1
***   stack: red/collector/do-mark-sweep
***   stack: red/collector/do-cycle
***   stack: red/alloc-series-buffer 1048576 1 0
***   stack: red/expand-series F64AC274h 1048576
***   stack: red/alloc-tail-unit F64AC274h 14855
***   stack: red/binary/rs-append 09DA36D4h 09DC5480h 14855
***   stack: red/simple-io/get-http-response 09DC5480h 1 14855 09DA36D4h
```
**Expected behavior**
No crash.

**Platform version (please complete the following information)**
Linux



Comments:
--------------------------------------------------------------------------------

On 2019-06-19T10:12:25Z, rebolek, commented:
<https://github.com/red/red/issues/3920#issuecomment-503498269>

    More info [here](https://gitter.im/red/help?at=5d09c865fbcc305cc4a5f36e).

