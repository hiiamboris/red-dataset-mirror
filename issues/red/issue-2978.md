
#2978: When a newline char is included in the prompt string of the ASK function
================================================================================
Issue is closed, was reported by Blocode and has 8 comment(s).
<https://github.com/red/red/issues/2978>

When a newline char is included in the prompt string of the ASK function, the prompt string will be repeatedly shows up on console every time a char is typed in.

on Windows:
```Red
>> ask "how old are you?^/"
how old are you?
how old are you?
how old are you?
30
== "30"
```

on macOS:
```Red
>> ask "how old are you?^/"
how old are you?
how old are you?
how old are you?
                30
== "30"
```


Comments:
--------------------------------------------------------------------------------

On 2017-08-16T14:52:50Z, meijeru, commented:
<https://github.com/red/red/issues/2978#issuecomment-322797589>

    Notice the difference in where the input is echoed, between win and mac. Any significance?

--------------------------------------------------------------------------------

On 2017-12-19T23:28:14Z, gltewalt, commented:
<https://github.com/red/red/issues/2978#issuecomment-352918104>

    This is still an issue with the GUI Console, Win7 Pro, 
    Red for Windows version 0.6.3 built 19-Dec-2017/15:46:56-07:00
    
    [https://imgur.com/a/f7BBQ](url)

--------------------------------------------------------------------------------

On 2018-04-25T08:34:04Z, qtxie, commented:
<https://github.com/red/red/issues/2978#issuecomment-384206132>

    Fixed in the new gui console.

--------------------------------------------------------------------------------

On 2018-12-23T00:18:30Z, endo64, commented:
<https://github.com/red/red/issues/2978#issuecomment-449605684>

    @greggirwin I think we are good to close this ticket.

