
#867: REPL crashes on "a:"
================================================================================
Issue is closed, was reported by drewm1980 and has 8 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/867>

red>> a:

**\* Script error: action 6 not defined for type: 0

This causes the new user to lose any definitions they had typed by hand into the REPL and make a face like this:

red>> |:

**\* Script error: action 6 not defined for type: 0



Comments:
--------------------------------------------------------------------------------

On 2014-06-27T11:09:04Z, iArnold, commented:
<https://github.com/red/red/issues/867#issuecomment-47331880>

    (You must be from down under. To me, that face is upside down.)
    REPL does crash and disappear (at least on Windows), which is quite a penalty for a possibly prematurely hit <-enter-> key.
    So I can confirm that the behaviour of the REPL could be improved here.
    (The error message is cryptic, but this is another issue.)

--------------------------------------------------------------------------------

On 2014-06-27T14:28:24Z, dockimbel, commented:
<https://github.com/red/red/issues/867#issuecomment-47351372>

    :-) I can understand the frustration, but as you might have noticed, Red is still under construction (v0.4.2) and some pieces are still missing, like proper errors handling. So far, we just have hard-wired a few error messages in the code, there is no internal error processing or barrier, so the internal states can easily get corrupted after any error, that it is why the REPL is exiting. The REPL itself has nothing to do with such issue, it is just related to the missing error handling module.
    
    Also, on some errors, we have avoided exiting on the request of the TryRed web site developer, in order to make it more usable (but still with the current risk of internal corruption).
    
    There is nothing we can do about that right now, you need to wait until we get error support done, somewhere during this summer.

--------------------------------------------------------------------------------

On 2014-06-27T18:04:13Z, drewm1980, commented:
<https://github.com/red/red/issues/867#issuecomment-47381521>

    Thanks for the response!  I am just excited about the project, and thought even a minor bug report might help out.  Post a call when you'd like people to start documenting loose ends, and I'll go play with REBOL til red beta comes along!

--------------------------------------------------------------------------------

On 2014-06-28T01:55:10Z, WayneCui, commented:
<https://github.com/red/red/issues/867#issuecomment-47415090>

    @drewm1980 For "lose any definitions they had typed by hand into the REPL", there is a trick: using a CMD console to open the REPL, then though REPL  will still exit on an error, but the console not, so you still can get what you typed back. For convenience, you can put the RED path in the PATH of Environment variable. 

