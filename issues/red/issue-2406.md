
#2406: Alias "exit" to "q" or "quit" in the REPL.
================================================================================
Issue is closed, was reported by apotheon and has 8 comment(s).
[status.dismissed] [type.wish]
<https://github.com/red/red/issues/2406>

If there is no Red-specific reason to avoid it, including `exit` as an alias for `q` or `quit` in the REPL would be helpful for people with touch-type muscle-memory for typing `exit` -- available for most languages' REPLs, in my experience -- to close a REPL.


Comments:
--------------------------------------------------------------------------------

On 2017-01-08T12:57:30Z, ghost, commented:
<https://github.com/red/red/issues/2406#issuecomment-271149495>

    @apotheon `exit` is [already defined](http://www.rebol.com/docs/words/wexit.html). Therefore it can't be used as an alias for `quit`.

--------------------------------------------------------------------------------

On 2017-01-08T13:12:33Z, apotheon, commented:
<https://github.com/red/red/issues/2406#issuecomment-271150324>

    What are the implications of doing something like effectively making the REPL an event loop function that exits when entering `exit`?  (I'm just spitballing ideas.  I haven't looked at the REPL source at all yet.)

--------------------------------------------------------------------------------

On 2017-02-14T12:09:17Z, dockimbel, commented:
<https://github.com/red/red/issues/2406#issuecomment-279691055>

    `exit` is already part of the language and serves different purpose than the one you propose. Here is a minimalistic console loop that provides the feature you ask for:
    ```
    my-console: function [][
        forever [
            line: trim ask "my>> "
            unless line: attempt [load/all line][print "syntax error"]
            if all [not empty? line line/1 = 'exit][quit]
            set/any 'result do line
            case [
                error? :result [print result]
                not unset? :result [print ["==" result]]
            ]
        ]
    ]
    ```
    Run the regular Red console, paste that code and call `my-console`.  If you type `exit`, it will quit the Red session entirely. This console is not as powerful as the real one, though it is quite capable already.

--------------------------------------------------------------------------------

On 2017-02-15T18:48:33Z, apotheon, commented:
<https://github.com/red/red/issues/2406#issuecomment-280101544>

    Thanks for the code sample.

