
#5571: [Linux] When using lowercase strings as arguments to get-env, the results are not as expected.
================================================================================
Issue is closed, was reported by ScriptGo and has 8 comment(s).
<https://github.com/red/red/issues/5571>

```red
>> get-env "HOME"
== "/home/0x2a"
>> get-env "home"
== none
>> get-env "SHELL"
== "/usr/bin/zsh"
>> get-env "shell"
== none
```

Platform version

`Red 0.6.5 for Linux built 29-Nov-2024/4:56:25+08:00  commit #a691592`


Comments:
--------------------------------------------------------------------------------

On 2024-12-02T08:46:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/5571#issuecomment-2510908730>

    I think it's quite expected:
    ```
    $ echo HOME=$HOME Home=$Home home=$home
    HOME=/home/test Home= home=
    
    $ export x=1
    $ export X=2
    $ echo $x$X
    12
    ```

--------------------------------------------------------------------------------

On 2024-12-02T09:07:17Z, ScriptGo, commented:
<https://github.com/red/red/issues/5571#issuecomment-2510956990>

    On Windows, the output is the same whether the parameter is uppercase or lowercase, for example, get-env "appdata" and get-env "APPDATA" have the same output. Why is there a different output on Linux?

--------------------------------------------------------------------------------

On 2024-12-02T09:09:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/5571#issuecomment-2510961655>

    Because Linux is case-sensitive by default, which affects the filenames too. While Windows' policy is to ignore the case.

--------------------------------------------------------------------------------

On 2024-12-02T09:12:29Z, ScriptGo, commented:
<https://github.com/red/red/issues/5571#issuecomment-2510967839>

    OK, I see, thanks.

