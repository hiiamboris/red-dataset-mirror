
#2971: wish: 'edit function for launching the default text editor on the OS
================================================================================
Issue is closed, was reported by Blocode and has 6 comment(s).
<https://github.com/red/red/issues/2971>

I wish I could do this:
```Red
>> edit
```
to launch the default text editor on the OS


Comments:
--------------------------------------------------------------------------------

On 2017-08-13T09:54:26Z, meijeru, commented:
<https://github.com/red/red/issues/2971#issuecomment-322032541>

    Is there such a thing as a default editor on each OS? I know there is a default browser, and a default e-mail client, but on Windows 10 a quick check did not reveal a default editor...

--------------------------------------------------------------------------------

On 2017-08-13T11:21:29Z, Blocode, commented:
<https://github.com/red/red/issues/2971#issuecomment-322036119>

    on macOS, there is a default editor, just type this on terminal:
    ```
    $ open -t
    ```

--------------------------------------------------------------------------------

On 2017-08-13T11:56:37Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2971#issuecomment-322037726>

    For the foreseeable future, Red will be implemented to be cross-platform. It is possible that at some future date, there will be platform specific modules. I don't see that happening before Red 1.0 is published.
    
    You can use `call` to achieve what you want:
    
    ```
    call "open -t"
    call "open -t red.r
    ``` 

