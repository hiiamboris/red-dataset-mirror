
#4936: `system/console/prompt` and `system/console/result` may be used to prematurely exit a console
================================================================================
Issue is closed, was reported by Oldes and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/4936>

It's possible to crash a console when making an error in `prompt` or `result` system/console functions...
Like:
```red
system/console/prompt: does [some-error-here]
```


Comments:
--------------------------------------------------------------------------------

On 2021-07-23T14:04:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/4936#issuecomment-885662799>

    Not a crash though, just terminates the REPL:
    ```
    >> system/console/prompt: does [some-error-here]
    == func [][some-error-here]
    *** Script Error: some-error-here has no value
    *** Where: prompt
    *** Stack: ask string? prompt
    ```

--------------------------------------------------------------------------------

On 2021-07-24T13:59:13Z, dockimbel, commented:
<https://github.com/red/red/issues/4936#issuecomment-886057590>

    I've removed the "CRASH" mentions in the issue title, as there is no crash strictly speaking (native level error), just a regular error that makes the console engine exit.
    
    I will add an error catching and proper restoration procedure for those sensitive values.

