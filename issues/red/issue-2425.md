
#2425: request-file under Windows ignores value of /file refinement
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
<https://github.com/red/red/issues/2425>

Instead, request-file starts in the last folder visited, and this across sessions (program start/end). It seems the parameter is ignored. 


Comments:
--------------------------------------------------------------------------------

On 2017-01-31T13:18:45Z, geekyi, commented:
<https://github.com/red/red/issues/2425#issuecomment-276360514>

    Works for me with:
    `red>> request-file/file %/C/Users/`
    
    Doesn't work if the trailing slash `/` is missing:
    `red>> request-file/file %/C/Users`
    
    latest: `red-25jan17-080ebed.exe`

--------------------------------------------------------------------------------

On 2017-02-01T15:18:59Z, meijeru, commented:
<https://github.com/red/red/issues/2425#issuecomment-276684506>

    Works now -> close issue!

