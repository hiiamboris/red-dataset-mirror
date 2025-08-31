
#2314: drop-list crashes after unview
================================================================================
Issue is closed, was reported by Rebol2Red and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2314>

view [
    drop-list data ["Dutch" "English"][x: face/selected unview]
]
; program stops right here, because of an unview related issue
print x ; <- no value shows up


Comments:
--------------------------------------------------------------------------------

On 2016-11-15T23:31:49Z, qtxie, commented:
<https://github.com/red/red/issues/2314#issuecomment-260804738>

    @Rebol2Red Which version of Windows are you using? It works fine on my Win 7 64bit.

--------------------------------------------------------------------------------

On 2016-11-20T00:05:55Z, Rebol2Red, commented:
<https://github.com/red/red/issues/2314#issuecomment-261748598>

    Windows 10 64 bits Red 20-11-2016
    
    Have you tried selecting the first item and THEN  the second item?
    When you select the first it gives 1 after the second selecting nothing shows up and
    after restarting the script nothing shows up anymore.
    
    if i use the code without unview and close the window with the close button everything works fine, that's why i think it must be related to unview.
    
    This code works fine (using the close button):
    view [drop-list data ["Dutch" "English"][x: face/selected]]
    print x
    
    I can't make clearer what the problem is, but maybe this:
    
    This works:
    view [text-list data ["1" "2"][x: face/selected unview]]
    view [text x]
    
    This do not work:
    view [drop-list data ["Dutch" "English"][x: face/selected unview]]
    view [text x]
    
    If the first sample works then the second should work too, right?!

--------------------------------------------------------------------------------

On 2016-11-20T20:13:29Z, geekyi, commented:
<https://github.com/red/red/issues/2314#issuecomment-261802221>

    Heisenbug detected! Initially was crashing.. I don't know what I did to make it not crash.
    
    Ok, tried again. It crashes sometimes. Other times I'm able to `print x`
    Win10 x64 latest build

