
#2667: HELP doesn't like `parse` spec.
================================================================================
Issue is closed, was reported by greggirwin and has 6 comment(s).
<https://github.com/red/red/issues/2667>

The `callback` param has a complex type spec, rather than a datatype or typeset.
```
callback [function! [
        event [word!] 
        match? [logic!] 
        rule [block!] 
        input [series!] 
        stack [block!] 
        return: [logic!]
    ]] 
```
`Help` shows the information correctly, but also emits its "Looks like we have a bad type spec:" debug message. 

Right now, the param type check uses `[some [datatype! | typeset!]]` as its rule. Is the correct solution to add a `function! + spec` check there, and (knowing it's limited today) that args could theoretically nest specs deeply? Or should `help` just check for `'function! block!` and leave it at that?


Comments:
--------------------------------------------------------------------------------

On 2017-05-09T06:19:05Z, dockimbel, commented:
<https://github.com/red/red/issues/2667#issuecomment-300071789>

    I think `'function! block!` is enough for now.

--------------------------------------------------------------------------------

On 2017-05-09T15:56:11Z, greggirwin, commented:
<https://github.com/red/red/issues/2667#issuecomment-300210257>

    OK, I'll go with that. Thanks.

--------------------------------------------------------------------------------

On 2017-06-05T23:00:19Z, greggirwin, commented:
<https://github.com/red/red/issues/2667#issuecomment-306334255>

    This is complete, in a previous PR.

