
#706: Console crashes on ??
================================================================================
Issue is closed, was reported by iArnold and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/706>

On Mac the console crashes after input "??"
red>> ?? 
unset: 
**\* Runtime Error 1: access violation
**\* at: 00033024h
logout

Wish: make interpreter more rubust and return a message like 
"unable to process this input"



Comments:
--------------------------------------------------------------------------------

On 2014-03-04T16:31:04Z, dockimbel, commented:
<https://github.com/red/red/issues/706#issuecomment-36643484>

    Now it will correctly catch the error and display an appropriate message:
    
    ```
    red>> ??
    *** Interpreter Error: missing argument...
    ```

