
#2345: Glitch on rounded box
================================================================================
Issue is closed, was reported by endo64 and has 18 comment(s).
[type.bug] [status.reviewed]
<https://github.com/red/red/issues/2345>

Rounded box has a glitch if line-width is bigger than 1.

`view [base 100x100 draw [line-width 6 box 30x30 70x70 3]]`

![image](https://cloud.githubusercontent.com/assets/840604/20479305/5f2d35d8-afe6-11e6-8fe9-bc37b3380abc.png)


Comments:
--------------------------------------------------------------------------------

On 2016-11-21T10:52:32Z, qtxie, commented:
<https://github.com/red/red/issues/2345#issuecomment-261905242>

    Seems it's a bug in GDI+ since Window 8.

--------------------------------------------------------------------------------

On 2016-11-21T11:13:49Z, qtxie, commented:
<https://github.com/red/red/issues/2345#issuecomment-261909682>

    Also when create the pen with `world` unit, it doesn't show anything on the screen. 
    But it works fine on Win 7. 

--------------------------------------------------------------------------------

On 2016-11-21T11:49:29Z, Zamlox, commented:
<https://github.com/red/red/issues/2345#issuecomment-261916599>

    > Also when create the pen with world unit, it doesn't show anything on the screen.
    But it works fine on Win 7.
    
    This explains why @endo64 wasn't able to see anything using my repository. I have changed creation of ```pen``` to use ```world``` units. @qtxie do you have a workaround in mind ?

--------------------------------------------------------------------------------

On 2016-11-22T09:16:44Z, qtxie, commented:
<https://github.com/red/red/issues/2345#issuecomment-262187185>

    @Zamlox I have no idea. It's really strange...

--------------------------------------------------------------------------------

On 2016-11-22T10:14:52Z, qtxie, commented:
<https://github.com/red/red/issues/2345#issuecomment-262200734>

    I copied the `gdiplus.dll` in Win7 into Win10, and compiled the console to use this special DLL, then it's working.
    
    So I suspected it's bug in Win10. But the following drawing code (using the same algorithm) works fine in Autoit.
    ```
    #include <GDIPlus.au3>
    #include <WinAPI.au3>
    #include <WindowsConstants.au3>
    
    _GDIPlus_Startup()
    
    Global $hWndMain = GUICreate("Rounded Rectangles", 400, 400)
    GUISetState()
    
    Global $hDC = _WinAPI_GetDC($hWndMain)
    Global $hGraphics = _GDIPlus_GraphicsCreateFromHDC($hDC)
    Global $hBrush = _GDIPlus_BrushCreateSolid(0xffffc080)
    _GDIPlus_GraphicsSetSmoothingMode($hGraphics, 4)
    
    ;GUIRegisterMsg($WM_PAINT, "_OnPaint")
    
    _OnPaint($hwndMain, 0, 0, 0)
    
    While GUIGetMsg() <> -3
        Sleep(10)
    WEnd
    
    _GDIPlus_BrushDispose($hBrush)
    _GDIPlus_GraphicsDispose($hGraphics)
    _WinAPI_ReleaseDC($hWndMain, $hDC)
    _GDIPlus_Shutdown()
    
    Func _OnPaint($hWnd, $nMsg, $wParam, $lParam)
        If $hWnd = $hWndMain Then
            _GDIPlus_GraphicsClear($hGraphics, 0xffffffff)
            _GDIPlus_GraphicsDrawRoundRect($hGraphics, 30, 30, 40, 40, 3)
            ;_GDIPlus_GraphicsDrawRoundRect($hGraphics, 8, 116, 384, 80, 20)
            ;_GDIPlus_GraphicsDrawRoundRect($hGraphics, 8, 204, 188, 188, 20, $hBrush)
            ;_GDIPlus_GraphicsDrawRoundRect($hGraphics, 204, 204, 188, 188, 60)
        EndIf
     EndFunc
    
    
    Func _GDIPlus_GraphicsDrawRoundRect($hGraphics, $iX, $iY, $iWidth, $iHeight, $iRadius, $hBrush = 0, $hPen = 0)
        $hPen = _GDIPlus_PenCreate(0xFF000000, 6)
        Local $hPath = _GDIPlus_PathCreate()
    	_GDIPlus_PathAddArc($hPath, $iX, $iY, $iRadius * 2, $iRadius * 2, 180, 90)
        _GDIPlus_PathAddArc($hPath, $iX + $iWidth - ($iRadius * 2), $iY, $iRadius * 2, $iRadius * 2, 270, 90)
        _GDIPlus_PathAddArc($hPath, $iX + $iWidth - ($iRadius * 2), $iY + $iHeight - ($iRadius * 2), $iRadius * 2, $iRadius * 2, 0, 90)
        _GDIPlus_PathAddArc($hPath, $iX, $iY + $iHeight - ($iRadius * 2), $iRadius * 2, $iRadius * 2, 90, 90)
    
        _GDIPlus_PathCloseFigure($hPath)
        If $hBrush <> 0 Then _GDIPlus_GraphicsFillPath($hGraphics, $hPath, $hBrush)
        _GDIPlus_GraphicsDrawPath($hGraphics, $hPath, $hPen)
        _GDIPlus_PathDispose($hPath)
        _GDIPlus_PenDispose($hPen)
    EndFunc
    ```
    That means we did something wrong in the red code, I guess it would be the following:
    1. We missing some initializing/setting for gdiplus.
    2. The same function in gdiplus.dll has different versions, we link the wrong one.
    3. Red/System float issue, the `GdipAddPathArc` function needs `float32!` argument, maybe the compiler generate wrong code.

--------------------------------------------------------------------------------

On 2016-11-22T10:29:09Z, Zamlox, commented:
<https://github.com/red/red/issues/2345#issuecomment-262204012>

    How about to use GDI+ functions which take ```float32``` as parameters (not ```integers!```). I remember I had an issue when I tried to scale a figure created with shape dialect, the joints didn't match, because I used GDI+ function which used ```integer!``` parameters. Try to replace those functions with their counterparts that use ```float!``` (just an idea).
    Instead of ```GdipAddPathArcI``` use ```GdipAddPathArc``` and use ```float!``` type local parameters. the precision of drawing will increase.

--------------------------------------------------------------------------------

On 2016-11-22T11:06:28Z, qtxie, commented:
<https://github.com/red/red/issues/2345#issuecomment-262212327>

    @Zamlox Using `GdipAddPathArc` is the same in this case as we only support `integer!` in `box` command. 

--------------------------------------------------------------------------------

On 2016-11-23T10:30:51Z, Zamlox, commented:
<https://github.com/red/red/issues/2345#issuecomment-262479080>

    you are right. So it was related to ```float32!``` conversion.

--------------------------------------------------------------------------------

On 2016-11-24T07:55:54Z, qtxie, commented:
<https://github.com/red/red/issues/2345#issuecomment-262712062>

    Fixed the float32! conversion bug in this commit: 03991bdca2530fed27bf10250baa924124d3799c

