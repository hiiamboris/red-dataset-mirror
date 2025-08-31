
#2256: HTTP POST ignores headers with WRITE/INFO
================================================================================
Issue is closed, was reported by rebolek and has 6 comment(s).
[status.tested] [type.review]
<https://github.com/red/red/issues/2256>

I have this code:

```
write/info http://api.gitter.im/v1/rooms/ [
    POST  [
        Accept: "application/json"
    ] {{test}}
]
```

that should be equivalent with this Curl code:

```
curl -X POST -H "Accept: application/json" http://api.gitter.im/v1/rooms/ -d "{test}"
```

I captured both command's outputs with Wireshark:

Curl request is on the left side, Red is on the right side:

![wireshark](https://cloud.githubusercontent.com/assets/660267/19102732/cc8ddc4c-8ad2-11e6-9a04-92040b76d11f.png)



Comments:
--------------------------------------------------------------------------------

On 2016-10-05T07:53:08Z, rebolek, commented:
<https://github.com/red/red/issues/2256#issuecomment-251606664>

    On OSX, I get crash:
    
    ```
    red>> do %test.red
    2016-10-05 09:51:18.410 console[1197:95220] -[__NSCFConstantString ]: unrecognized selector sent to instance 0xa447e160
    2016-10-05 09:51:18.414 console[1197:95220] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[__NSCFConstantString ]: unrecognized selector sent to instance 0xa447e160'
    *** Call stack at first throw:
    (
        0   CoreFoundation                      0x95495a69 __raiseError + 201
        1   libobjc.A.dylib                     0x9c4a0fd1 objc_exception_throw + 276
        2   CoreFoundation                      0x95499513 -[NSObject(NSObject) doesNotRecognizeSelector:] + 275
        3   CoreFoundation                      0x95389e9c ___forwarding___ + 1020
        4   CoreFoundation                      0x95389a7e _CF_forwarding_prep_0 + 14
        5   console                             0x0004fa9b console + 322203
    )
    Trace/BPT trap: 5
    ```

--------------------------------------------------------------------------------

On 2016-10-05T10:15:37Z, qtxie, commented:
<https://github.com/red/red/issues/2256#issuecomment-251636184>

    Actually it send the headers, see `Reassebmled TCP segments` in Wireshark when using Red.
    If I turn off the auto-follow redirect, I can get the same result as `curl`.
    
    We can use `httpbin.org/post` to check it.
    
    ```
    probe write/info http://httpbin.org/post  [POST [Header1: "text1"] "test123"]
    [200 #(
        Connection: "keep-alive"
        Date: "Wed, 05 Oct 2016 10:19:18 GMT"
        Content-Length: "443"
        Content-Type: "application/json"
        Server: "nginx"
        Access-Control-Allow-Origin: "*"
        Access-Control-Allow-Credentials: "true"
    ) {{"args": {}, 
        "data": "", 
        "files": {}, 
        "form": {
            "test123": ""
        }, 
      "headers": {
        "Accept": "*/*", 
        "Content-Length": "7",
        "Content-Type": "application/x-www-form-urlencoded; Charset=UTF-8", 
        "Header1": "text1", 
        "Host": "httpbin.org", 
        "User-Agent": "Mozilla/4.0 (compatible; Win32; WinHttp.WinHttpRequest.5)"
      }, 
      "json": null, 
      "origin": "120.42.98.110", 
      "url": "http://httpbin.org/post"
    }}]
    ```

--------------------------------------------------------------------------------

On 2017-03-04T03:33:07Z, qtxie, commented:
<https://github.com/red/red/issues/2256#issuecomment-284123950>

    Cannot reproduce the crash on macOS with the latest version. 
    For configuring auto-follow redirect, we'll implement it in 0.7 with full I/O support.

