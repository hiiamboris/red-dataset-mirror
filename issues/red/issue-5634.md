
#5634: Invalid character creation possibility using error object
================================================================================
Issue is open, was reported by Oldes and has 10 comment(s).
<https://github.com/red/red/issues/5634>

Currently there is:

```red
>> to binary! #"^(10FFFF)"
== #{F48FBFBF} ; expected UTF-8 encoding

>> to binary! #"^(110000)"
*** Syntax Error: (line 1) invalid char at #"^(110000)"  ; expected error

>> to binary! (1 + #"^(10FFFF)")
== #{00110000} ; should be error instead!
```

Also the invalid char should not be one of the error arguments!
Now there is:

<img width="822" height="600" alt="Image" src="https://github.com/user-attachments/assets/bd73ac4a-ed4e-456f-a102-8843694ff05b" />



Comments:
--------------------------------------------------------------------------------

On 2025-08-01T09:17:06Z, Oldes, commented:
<https://github.com/red/red/issues/5634#issuecomment-3143850799>

    My mistake... in the code above (bad argument order).. this is expected:
    ```
    >> to binary! (#"^(10FFFF)" + 1)
    *** Math Error: math or number overflow
    ```
    Still there is the issue with the invalid char in the error object.
    ```red
    >> error? err: try [transcode/one {#"^(110000)"}]
    == true
    >> type? err/arg1
    == char!
    >> mold err/arg1
    
    >>

--------------------------------------------------------------------------------

On 2025-08-01T09:20:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/5634#issuecomment-3143861267>

    ```
    >> (1 + #"^(10FFFF)")
    == 1114112
    ```
    It's an integer though

--------------------------------------------------------------------------------

On 2025-08-01T09:26:13Z, Oldes, commented:
<https://github.com/red/red/issues/5634#issuecomment-3143876117>

    I'm not proposing anything... I just think that it should not be possible to create an invalid char.
    In Rebol3 now also UTF-16 surrogate pairs will be disallowed (as these should not be present in a valid UTF-8 string)!
    ```rebol
    >> to char! 55348
    
    ** Access error: invalid UTF-8 character: 55348
    ```

--------------------------------------------------------------------------------

On 2025-08-01T09:29:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/5634#issuecomment-3143885625>

    Sorry, that was a glitch in my brain, you indeed didn't propose it originally. However now that you make this point the counterargument becomes valid:
    
    > In Rebol3 now also UTF-16 surrogate pairs will be disallowed (as these should not be present in a valid UTF-8 string)!
    > 
    > >> to char! 55348
    > 
    > ** Access error: invalid UTF-8 character: 55348
    
    This will make `char!` arithmetic even more trippy than it is, e.g. currently:
    ```
    >> a: 100 b: 110
    == 110
    >> #"A" + b - a
    == #"K"
    >> #"A" - a + b
    *** Math Error: math or number overflow
    *** Where: -
    *** Near : #"A" - a + b
    *** Stack:  
    ```
    But with the proposed change errors will appear unpredictably even when the number is nonnegative.
    This still remains as a valid workaround:
    ```
    >> #"A" + (b - a)
    == #"K"
    ```
    But it may cause more debugging time and user frustration, so this fact should be weighed against the risk of dealing with invalid UTF-8 codepoints. Perhaps it is `mold` and `to binary!` that should be made more strict instead.
    

--------------------------------------------------------------------------------

On 2025-08-01T09:50:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/5634#issuecomment-3143946734>

    > Still there is the issue with the invalid char in the error object.
    > 
    > ```
    > >> error? err: try [transcode/one {#"^(110000)"}]
    > == true
    > ```
    
    This crashes the GUI console by the way: 
    ```
    gui-console-ctx/terminal/color?: on
    try [transcode/one {#"^(110000)"}]
    ```
    Output I'm seeing (GUI console compiled with `-d -t MSDOS`):
    ```
    *** Script Error: Invalid char! value: #"��"
    *** Where: transcode
    *** Near : transcode/one {#"��"}
    *** Stack:
    
    Error: to-utf16 codepoint overflow
    Error: to-utf16 codepoint overflow
    root: 7433/10117, runs: 0, mem: 3268608 => 3085388, mark: 9.0ms, sweep: 1.0ms
    *** Script Error: Invalid char! value: #"��"
    *** Where: transcode
    *** Near : exit
    *** Stack: ask ask
    Error: to-utf16 codepoint overflow
    ```
    `Red 0.6.6 for Windows built 13-Jul-2025/21:27:17+08:00  commit #31205e5`

