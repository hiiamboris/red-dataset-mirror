
#2469: [macOS] WRITE/INFO crashes Red
================================================================================
Issue is closed, was reported by rebolek and has 16 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2469>

Yesterday I've compiled console from latest source and now this code: 

```
write/info https://api.gitter.im/v1/user [
	GET [
		Accept: "application/json"
		Authorization: "Bearer 1234"
	]
]
```

gives this crash:

```
red>> do %bad.red
2017-03-08 07:11:26.959 console[67366:2961839] -[__NSCFConstantString ]: unrecognized selector sent to instance 0xa311f160
2017-03-08 07:11:26.959 console[67366:2961839] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[__NSCFConstantString ]: unrecognized selector sent to instance 0xa311f160'
*** Call stack at first throw:
(
	0   CoreFoundation                      0x9a8a59b9 __raiseError + 201
	1   libobjc.A.dylib                     0x9ae8bfd1 objc_exception_throw + 276
	2   CoreFoundation                      0x9a8a9463 -[NSObject(NSObject) doesNotRecognizeSelector:] + 275
	3   CoreFoundation                      0x9a799dec ___forwarding___ + 1020
	4   CoreFoundation                      0x9a7999ce _CF_forwarding_prep_0 + 14
	5   console                             0x0005402e console + 340014
)
Trace/BPT trap: 5
```

In my console from 28th January this problem does not happen.


Comments:
--------------------------------------------------------------------------------

On 2017-03-09T04:03:33Z, qtxie, commented:
<https://github.com/red/red/issues/2469#issuecomment-285248681>

    I tested it on our macOS 10.11.6 (15G31) box, got this:
    ```
    red>> do %bad.red
    == [401 #(
        Etag: {W/"18-l5HSkPgrt34VXDHy0Xbi5Q"}
        Access-Contr...
    ```

--------------------------------------------------------------------------------

On 2017-03-11T21:08:32Z, geekyi, commented:
<https://github.com/red/red/issues/2469#issuecomment-285900276>

    To reproduce this bug, does one need a Gitter token? 

--------------------------------------------------------------------------------

On 2017-03-12T08:40:04Z, rebolek, commented:
<https://github.com/red/red/issues/2469#issuecomment-285930549>

    @geekyi no, for me it crashes even with random token (i.e. 1234, as shown in above code).

--------------------------------------------------------------------------------

On 2017-03-12T09:44:37Z, x8x, commented:
<https://github.com/red/red/issues/2469#issuecomment-285933526>

    ```
      write/info https://api.gitter.im/v1/user [
    [     GET [
    [      Accept: "application/json"
    [      Authorization: "Bearer 1234"
    [     ]
    [    ]
    ;   [401 #(
        Etag: {W/"18-l5HSkPgrt34VXDHy0Xbi5Q"}
        Access-Contr...
    ```
    works fine here on macOS Sierra, @rebolek , what OS version and Machine are you using?

--------------------------------------------------------------------------------

On 2017-03-13T06:51:22Z, rebolek, commented:
<https://github.com/red/red/issues/2469#issuecomment-286027858>

    Thanks, I am using 10.11.6 on Hackintosh, I will try on Macbook with el Capitan when I return home at the end of the week.

--------------------------------------------------------------------------------

On 2017-03-21T07:42:13Z, rebolek, commented:
<https://github.com/red/red/issues/2469#issuecomment-287999637>

    @qtxie @x8x I've tried with fresh build from latest sources on my Hackintosh and cannot reproduce it. Thanks for help.

--------------------------------------------------------------------------------

On 2018-03-05T16:08:52Z, rebolek, commented:
<https://github.com/red/red/issues/2469#issuecomment-370470003>

    @qtxie I can still reproduce it on Linux with this code:
    ```
    write/info http://www.red-lang.org [POST [a: b]]
    ```

--------------------------------------------------------------------------------

On 2018-03-06T02:56:43Z, qtxie, commented:
<https://github.com/red/red/issues/2469#issuecomment-370645004>

    Missing some checking in the implementation. The contents in POST block must be `set-word!: string!` pair.
    https://github.com/red/red/wiki/Guru-Meditations#how-to-make-http-requests

