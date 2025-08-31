
#5087: MacOS: Bad CPU type in executable
================================================================================
Issue is closed, was reported by pilipenok and has 8 comment(s).
[status.resolved]
<https://github.com/red/red/issues/5087>

okay, 2 years are passed and this is my second attempt to try the awesome Red lang on my mac

I see like closed duplicated errors: #4491, #4359, #4216 about Catalina and macos 10.15.5

Now I have `red-064` file from the official download page
but still see `zsh: Bad CPU type in executable` on Monterey 12.2 on MacPro 2019 (i9)

If this is again not a bug for you 
then could you provide what version do you mean of MacOS on Red download page?

Thanks




Comments:
--------------------------------------------------------------------------------

On 2022-02-26T12:02:46Z, hiiamboris, commented:
<https://github.com/red/red/issues/5087#issuecomment-1052083649>

    Maybe this recent work will help? https://github.com/otobrglez/compression-puzzle/pull/39/files

--------------------------------------------------------------------------------

On 2022-02-26T17:44:04Z, pilipenok, commented:
<https://github.com/red/red/issues/5087#issuecomment-1052369711>

    thank you @hiiamboris,
    that docker image is runable but seems to be a workaround for simple things only..
    
    ```
    Aleh@MacBook ~ % docker run -it --entrypoint /bin/red rebolek/red
    --== Red 0.6.4 ==-- 
    Type HELP for starting information. 
    
    >> pi: 3.14159265358979
    == 3.14159265358979
    >> pi-32: as float32! pi
    *** Script Error: float32! has no value
    *** Where: as
    *** Stack:  
    ```
    
    
    Can't wait for full MacOS support! with GUI as well

--------------------------------------------------------------------------------

On 2022-02-26T17:47:45Z, hiiamboris, commented:
<https://github.com/red/red/issues/5087#issuecomment-1052374273>

    That's true though - `float32!` is not a Red type.
    You can start exploring by typing `help` (as console suggests).
    Also visit https://gitter.im/red/red/welcome room should you have more questions :)

--------------------------------------------------------------------------------

On 2022-02-27T02:19:00Z, dockimbel, commented:
<https://github.com/red/red/issues/5087#issuecomment-1052962921>

    Red only support macOS 32-bit editions for now.

