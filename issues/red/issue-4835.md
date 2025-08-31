
#4835: [Regression, D2D] CRASH when BASE is big
================================================================================
Issue is closed, was reported by hiiamboris and has 26 comment(s).
[status.built] [status.tested] [type.review] [GUI]
<https://github.com/red/red/issues/4835>

**To reproduce**
```
Red []
view/options [base 11000x11000] [offset: 10x10]    ;) CRASHES
; view/options [base 40000x40000] []               ;) DOESNT
```
```
*** Runtime Error 98: assertion failed
*** in file: /D/devel/red/red-src/red/modules/view/backends/windows/direct2d.reds
*** at line: 1904
***
***   stack: gui/create-render-target 00000062h 004ECE48h true
***   stack: gui/create-render-target 00700D76h 02995EF0h false
***   stack: gui/get-hwnd-render-target 00700D76h false
***   stack: gui/draw-begin 0053D330h 00700D76h 00000000h false true
***   stack: gui/BaseWndProc 00700D76h 15 0 0
```

**Expected behavior**

No crash.

**Platform version**
```
Red 0.6.4 for Windows built 16-Feb-2021/11:41:34+03:00 commit #0187423
```



Comments:
--------------------------------------------------------------------------------

On 2021-02-26T21:03:06Z, greggirwin, commented:
<https://github.com/red/red/issues/4835#issuecomment-786892584>

    Doesn't crash for me. Interesting.

--------------------------------------------------------------------------------

On 2021-02-26T21:32:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/4835#issuecomment-786905178>

    Yes, curious. What if you increase the size?

--------------------------------------------------------------------------------

On 2021-02-27T12:49:28Z, qtxie, commented:
<https://github.com/red/red/issues/4835#issuecomment-787068017>

    Doesn't crash here. @hiiamboris Maybe no enough GPU resource was not currently available no your system. 
    We should throw an error in this case instead of crash.

--------------------------------------------------------------------------------

On 2021-02-27T13:57:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/4835#issuecomment-787076993>

    That's just 500MB of VRAM needed (11 * 11 * 4). I got 8GB of OS memory shared for GPU needs. And I can stably reproduce the crash.

--------------------------------------------------------------------------------

On 2021-02-28T06:46:17Z, qtxie, commented:
<https://github.com/red/red/issues/4835#issuecomment-787405457>

    @hiiamboris Can you check the [`hr` value](https://github.com/red/red/blob/master/modules/view/backends/windows/direct2d.reds#L1903) before the assertion?

--------------------------------------------------------------------------------

On 2021-02-28T09:34:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/4835#issuecomment-787423558>

    `-2147024809` or `80070057h`
    
    > `#define E_INVALIDARG _HRESULT_TYPEDEF_(0x80070057L).`

--------------------------------------------------------------------------------

On 2021-02-28T10:03:23Z, hiiamboris, commented:
<https://github.com/red/red/issues/4835#issuecomment-787427101>

    What it was called with:
    ```
    dxgi-factory: 00A258A8
    d3d-device: 009B8374
    hWnd: 000D0AF2
    desc/Width: 16500
    desc/Height: 16500
    desc/Scaling: 1
    desc/Flags: 0
    ```
    idk where to go from here, nothing outright suspicious 

--------------------------------------------------------------------------------

On 2021-03-01T03:17:42Z, qtxie, commented:
<https://github.com/red/red/issues/4835#issuecomment-787607270>

    If the error happened only when BASE is big, then maybe the big BASE corrupted internal memory or CreateSwapChainForHwnd cannot handle big BASE on some systems.
    
    `view/options [base 11000x11000] [offset: 10x10]` works fine on my system.
    `view/options [base 40000x40000] []` doesn't crash, but no window shows. `view/options [base 40000x40000] [offset: 10x10]` crashes on my system.

--------------------------------------------------------------------------------

On 2021-03-01T08:58:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/4835#issuecomment-787778867>

    > no window shows
    
    It's an old as time layout bug. Try e.g.
    ```
    view/options [] [size: system/view/screens/1/size * 1.1]
    view/options [] [size: system/view/screens/1/size * 1.2]
    view/options [] [size: system/view/screens/1/size * 1.5]
    view/options [] [size: system/view/screens/1/size * 2]
    (etc)
    ```
    and see how the window slides up and to the left

--------------------------------------------------------------------------------

On 2021-03-01T08:59:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/4835#issuecomment-787779633>

    > `view/options [base 40000x40000] [offset: 10x10]` crashes on my system.
    
    Nice, so you can debug it probably ;)

--------------------------------------------------------------------------------

On 2021-03-02T07:35:12Z, qtxie, commented:
<https://github.com/red/red/issues/4835#issuecomment-788688691>

    > > `view/options [base 40000x40000] [offset: 10x10]` crashes on my system.
    > 
    > Nice, so you can debug it probably ;)
    
    I think it's a limitation in Direct2D. What we can do is throw an error in this case.

--------------------------------------------------------------------------------

On 2021-03-20T15:30:50Z, dsunanda, commented:
<https://github.com/red/red/issues/4835#issuecomment-803380268>

    I've tested the two lines on both Win10 and Win7.
    
    Win10 - both worked fine
    
    Win 7:
    > view/options [base 11000x11000] [offset: 10x10]    ;) CRASHES
    This went into a spinlock, taking 100% of one CPU. Had to terminate the task
    
    > view/options [base 40000x40000] []               ;) DOESNT
    This quickly dropped to 0% CPU. But I could not get to the window (it remained hidden behind the GUI console). And the GUI console was frozen. Again had to terminate the task,

--------------------------------------------------------------------------------

On 2021-07-30T04:00:01Z, gltewalt, commented:
<https://github.com/red/red/issues/4835#issuecomment-889610077>

    As an aside...
    
    `view/options [base 40000x40000] [offset: 10x10] `
    
    ```
    (console-2021-7-29-9050:5809): Gdk-WARNING **: 21:56:09.480: Native Windows wider or taller than 32767 pixels are not supported
    ```
    Crashed `Cinnamon` on my Linux Mint. 

