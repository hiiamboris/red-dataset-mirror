
#3239: MAKE IMAGE! READ-CLIPBOARD with image copied in a buffer causes access violation
================================================================================
Issue is closed, was reported by 9214 and has 16 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3239>

### Expected behavior
Image is created or meaningful error message is raised.
### Actual behavior
Access violation.
### Steps to reproduce the problem
Copy any image in a buffer (say, right click on my userpic - Copy Image) and run the snippet below
```Red
make image! read-clipboard
 ```
This effectively results in
```Red
*** Runtime Error 1: access violation
*** at: F7C73599h
```
While `read-clipboard` itself returns `bitset!`
```Red
>> read-clipboard
== make bitset! #{0000000020C000300000009400000090}
```

### Red version and build date, operating system with version.
I don't think that checking with latest build makes much sense ;)
```Red
>> about
Red for Windows version 0.6.3 built 25-Jan-2018/23:52:32+05:00
```


Comments:
--------------------------------------------------------------------------------

On 2018-03-02T08:06:58Z, qtxie, commented:
<https://github.com/red/red/issues/3239#issuecomment-369850741>

    Interesting, `read-clipbord` should return `string!`. @9214 Are you using Windows 10? Works fine on Win 7 64bit.

--------------------------------------------------------------------------------

On 2018-03-02T09:39:45Z, 9214, commented:
<https://github.com/red/red/issues/3239#issuecomment-369872353>

    @qtxie no, I checked this with Wine on Linux Mint.

--------------------------------------------------------------------------------

On 2018-03-02T11:03:33Z, lepinekong, commented:
<https://github.com/red/red/issues/3239#issuecomment-369892132>

    On Windows read-clipboard doesn't even return: console just shut down :)

--------------------------------------------------------------------------------

On 2018-03-02T15:16:54Z, nedzadarek, commented:
<https://github.com/red/red/issues/3239#issuecomment-369948844>

    I have Red from 21 Januarry, on Win 8.1
    
    It seems that when there is nothing in the clipboard or non-text is copied, `read-clipboard` holds the same bitset:
    `read-clipboard; make bitset! #{0000000020C000300000009400000090}`
    but when you try to set it to the variable, it will be `none`:
    `v: read-clipboard`
    however, when you try run `read-clipboard` directly with some function:
    `print read-clipboard`
    It causes access violation.
    ps. with a variable:
    ```
    v: read-clipboard
    ; == none
    v
    ' == none
    make image! v
    ; *** Script Error: cannot MAKE/TO image! from: none
    ; *** Where: make
    ; *** Stack:
    ```
    
    @lepinekong you have to run it in the "text mode": `red324234.exe --cli`

--------------------------------------------------------------------------------

On 2018-03-02T20:08:29Z, gltewalt, commented:
<https://github.com/red/red/issues/3239#issuecomment-370038402>

    @qtxie It blows up on my Win7 64 bit.  Ensure that you are copying an image into the clipboard via the OS first.

--------------------------------------------------------------------------------

On 2018-03-13T00:17:00Z, qtxie, commented:
<https://github.com/red/red/issues/3239#issuecomment-372504502>

    I see. Thanks.

--------------------------------------------------------------------------------

On 2018-03-13T09:28:09Z, qtxie, commented:
<https://github.com/red/red/issues/3239#issuecomment-372600769>

    I pushed a fix. Should not crash anymore.
    FYI. `read-clipboard` only support string for now. If you selected any other datatypes into clipboard, `read-clipboard` will return `none`.

--------------------------------------------------------------------------------

On 2018-03-22T08:41:37Z, qtxie, commented:
<https://github.com/red/red/issues/3239#issuecomment-375219454>

    I'll close it. If it still crashes, please reopen it.

