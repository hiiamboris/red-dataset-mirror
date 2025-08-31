
#5482: Malformed JPG can crash console session
================================================================================
Issue is closed, was reported by dsunanda and has 16 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/5482>

An otherwise reliable (non-Red!) compression utility can reliably create JPGs that crash Red's console session. 

_Obviously, that is a bug in the compression utility - the JPGs are malformed in such a way that some applications can render them, while others cannot. But Red is the only application I have found that completely crashes._

**Code to create**
```
    ;; Can load good jpg
jpg-good: load/as %jpg-good.jpg 'jpeg

    ;; Can't load bad jpg
jpg-bad: load/as %jpg-bad.jpg 'jpg


    ;; attempt to load binary of bad jpg crashes the console
jpg-bad: read/binary %jpg-bad.jpg
TRY [load/as jpg-bad 'jpeg]
```

**Console session (without the TRY/CRASH line)**

```
--== Red 0.6.5 ==-- 
Type HELP for starting information. 

>>     ;; Can load good jpg
>> jpg-good: load/as %jpg-good.jpg 'jpeg
== make image! [122x54 #{
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF...
>> 
>>     ;; Can't load bad jpg
>> jpg-bad: load/as %jpg-bad.jpg 'jpg


*** Script Error: invalid /as argument: jpg
*** Where: do
*** Near : jpg-bad: load/as %jpg-bad.jpg 'jpg
*** Stack: load cause-error  

>> 
>> 
>>     ;; attempt to load binary of bad jpg crashes the console
>> jpg-bad: read/binary %jpg-bad.jpg
== #{
FFD8FFE000104A46494600010100000100010000FFDB00430007050506050407
0...

```

**Red Version**
Red 0.6.5 for Windows built 14-Feb-2024/12:03:12  commit #d3409ba

**Uploads**
![jpg-bad](https://github.com/red/red/assets/16221143/f28c6104-e97a-4315-a6df-292ac14987bc)
![jpg-good](https://github.com/red/red/assets/16221143/cc7d78c0-153c-436d-b47e-421ef3a48b02)


Comments:
--------------------------------------------------------------------------------

On 2024-02-17T10:41:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/5482#issuecomment-1949931805>

    I can.
    ```
    >> load https://private-user-images.githubusercontent.com/16221143/305634607-f28c6104-e97a-4315-a6df-292ac14987bc.jpg?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDgxNjU5MDMsIm5iZiI6MTcwODE2NTYwMywicGF0aCI6Ii8xNjIyMTE0My8zMDU2MzQ2MDctZjI4YzYxMDQtZTk3YS00MzE1LWE2ZGYtMjkyYWMxNDk4N2JjLmpwZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDAyMTclMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwMjE3VDEwMjY0M1omWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWY0NGZmM2YyZmRjMWJmN2YwOTBiYzRiNTkyYmVlYjlmYTEwOWMwNmNkNzZhMTMxZTYwNTI1MmFhNzkwYWI5YTAmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.w0ZeJG5XjjuZjB-v3S2cZ3ec-N-M6MIhf7DrRsstPa4                                                                                                                                                                                                                                                                                                                    
    *** Runtime Error 1: access violation
    *** in file: /d/devel/red/red-src/master/runtime/platform/image-wic.reds
    *** at line: 582
    ***
    ***   stack: red/OS-image/get-data 91390818 0109FD2Ch
    ***   stack: red/image/serialize 0527201Ch 0527202Ch false false false 0527202Ch 173 1
    ***   stack: red/image/mold 0527201Ch 0527202Ch false false false 0527202Ch 191 0
    ***   stack: red/actions/mold 0527201Ch 0527202Ch false false false 0527202Ch 191 0
    ***   stack: red/actions/mold* -1 -1 -1 1
    ***   stack: ctx||627~do-command 057DF680h
    ***   stack: ctx||627~eval-command 057DF680h
    ***   stack: ctx||627~run 057DF680h
    ***   stack: ctx||627~launch 057DF680h
    ***   stack: ctx||646~launch 057DF06Ch
    ```

--------------------------------------------------------------------------------

On 2024-02-17T12:20:42Z, dockimbel, commented:
<https://github.com/red/red/issues/5482#issuecomment-1950029248>

    I have some troubles reading that file. Most of the time I get a network access error:
    ```
    *** Access Error: cannot connect: https://private-user-images.githubusercontent.com/16221143/305634607-f28c6104-e9 
    *** Where: read
    *** Near : a: read/binary https://private-user-imag
    *** Stack: 
    ```

--------------------------------------------------------------------------------

On 2024-02-17T13:09:42Z, dockimbel, commented:
<https://github.com/red/red/issues/5482#issuecomment-1950129402>

    I succeeded in downloading the corruped image and saving it locally. However, making it to crash requires:
    ```
    mold load/as read/binary %bad.jpg 'jpeg
    ```
    
    Using just `load` is not enough as it gets rightly rejected:
    ```
    >> load/as %bad.jpg 'jpeg
    *** Access Error: cannot open: %bad.jpg
    *** Where: decode
    *** Near : codec/decode source
    *** Stack: load
    ```
    while it passes when the input is a `binary!` series, but later causes a crash when trying to `mold` the resulting `image!` value.

--------------------------------------------------------------------------------

On 2024-02-17T14:23:22Z, qtxie, commented:
<https://github.com/red/red/issues/5482#issuecomment-1950222617>

    Should be fixed by commit https://github.com/red/red/commit/151ab0cfdcf2d11a6e03b59585b304e2b52d55e7.

--------------------------------------------------------------------------------

On 2024-02-19T12:31:22Z, dockimbel, commented:
<https://github.com/red/red/issues/5482#issuecomment-1952353563>

    There's still a problem: the invalid image is not triggering an error on `load` but only later, when the image is serialized by `mold` or `form`:
    
    ```
    img: load/as read/binary %bad.jpg 'jpeg
    probe set/any 'err try [mold img]
    ```
    gives:
    ```
    make error! [
        code: 513
        type: 'access
        id: 'bad-media
        arg1: none
        arg2: none
        arg3: none
        near: unset
        where: 'mold              ;-- should error out in `load` instead!
        stack: 90247320
    ]
    ```
    
    @qtxie If there's no other way to check in `image/decode` if the image is valid or not, maybe we should add a call to `lock-bitmap` and `unlock-bitmap` at the end of the loading, to trigger the error there when the image is invalid?

--------------------------------------------------------------------------------

On 2024-02-20T04:13:59Z, qtxie, commented:
<https://github.com/red/red/issues/5482#issuecomment-1953460568>

    @dockimbel The WICBitmap API delays the real decoding until it actually need to reads the bitmap data. After the image is loaded, it only decodes the metadata of the image. So `img/size` works.
    
    Yes. we need to call lock-bitmap and unlock-bitmap to trigger the decoding.

--------------------------------------------------------------------------------

On 2024-02-22T13:48:38Z, dockimbel, commented:
<https://github.com/red/red/issues/5482#issuecomment-1959487688>

    That commit is referencing the wrong issue, just ignore it.

--------------------------------------------------------------------------------

On 2024-04-23T10:09:12Z, Oldes, commented:
<https://github.com/red/red/issues/5482#issuecomment-2071922505>

    This issue may be closed now.

