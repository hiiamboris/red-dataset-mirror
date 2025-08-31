
#3023: [macOS] Setting Container Backdrop Alpha to 255 crashes Red "View" console
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3023>

```text
>> view [size 200x200 backdrop 230.230.230.255 text "230.230.230.255"]
2017-09-09 13:46:31.648 macView[40238:29091835] -[RedWindow setDrawsBackground:]: unrecognized selector sent to instance 0x53cf90
2017-09-09 13:46:31.652 macView[40238:29091835] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[RedWindow setDrawsBackground:]: unrecognized selector sent to instance 0x53cf90'
*** Call stack at first throw:
(
	0   CoreFoundation                      0x9437627b __raiseError + 187
	1   libobjc.A.dylib                     0xa0cbd6f2 objc_exception_throw + 273
	2   CoreFoundation                      0x9437a0dc -[NSObject(NSObject) doesNotRecognizeSelector:] + 172
	3   CoreFoundation                      0x9425d555 ___forwarding___ + 1013
	4   CoreFoundation                      0x9425d13e _CF_forwarding_prep_0 + 14
	5   macView                             0x000bb57a macView + 763258
)
Trace/BPT trap: 5
```


Comments:
--------------------------------------------------------------------------------

On 2017-09-09T05:58:17Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3023#issuecomment-328256999>

    There is no crash when setting the transparency of the background to a number less than 255
    ```text
    view [size 200x200 backdrop 230.230.230.254 text "230.230.230.254"]
    ```

