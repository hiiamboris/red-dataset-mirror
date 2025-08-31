
#2770: macOS: Image loading error
================================================================================
Issue is closed, was reported by JenniferLee520 and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2770>

In the latest macOS version
```Red
>> load https://www.baidu.com/img/bd_logo1.png
*** Access Error: invalid UTF-8 encoding: #{B0854002}
*** Where: read
*** Stack: load 
```
This error is only on macOS.


Comments:
--------------------------------------------------------------------------------

On 2017-06-09T09:06:32Z, JenniferLee520, commented:
<https://github.com/red/red/issues/2770#issuecomment-307337159>

    Putting this into VID is even worse. It crashes.
    ```Red
    >> view [ image https://www.baidu.com/img/bd_logo1.png ]
    
    *** Runtime Error 1: access violation
    *** at: 0005F88Eh
    logout
    Saving session...
    ...copying shared history...
    ...saving history...truncating history files...
    ...completed.
    ```

--------------------------------------------------------------------------------

On 2017-06-09T09:43:19Z, JenniferLee520, commented:
<https://github.com/red/red/issues/2770#issuecomment-307345363>

    confirmed fixed.

