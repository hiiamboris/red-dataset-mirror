
#557: how to use call function 
================================================================================
Issue is closed, was reported by abbypan and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/557>

just want get info like 
$info = `ffmpeg -i video.mp4`  
in perl 

; the red code :

Red [
    Title: "Simple ffmpeg script"
]

info: make string! 1024
call/error "ffmpeg -i video.mp4" info
print info

; the error msg :
; **\* Error: word in path has no value!



Comments:
--------------------------------------------------------------------------------

On 2013-11-05T11:06:59Z, dockimbel, commented:
<https://github.com/red/red/issues/557#issuecomment-27764394>

    There is no CALL function implemented in Red yet.

--------------------------------------------------------------------------------

On 2013-11-05T16:19:36Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/557#issuecomment-27786970>

    CALL is implemented in the C library binding and in my interpreter downloads, but not call/error. Try a `*/Red/red*` interpreter for your platform from here:
    
    http://red.esperconsultancy.nl/Red-test/dir?ci=tip

