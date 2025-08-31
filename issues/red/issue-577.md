
#577: load/into APPENDs instead of INSERTs
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 8 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/577>

red>> b: next [1 2]
== [2]
red>> load/into "3" b
== [2 3]
red>> b
== [2 3]



Comments:
--------------------------------------------------------------------------------

On 2013-11-24T23:14:43Z, dockimbel, commented:
<https://github.com/red/red/issues/577#issuecomment-29169370>

    Changing that requires significant work on %tokenizer.r (which should be soon replaced) and changes in the code across most of datatypes. If this is not important to you, I would prefer to postpone it.

--------------------------------------------------------------------------------

On 2013-11-25T00:00:53Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/577#issuecomment-29170387>

    That's alright. I found it when I realised that I had based my TNetStrings loader on LOAD's behaviour, and it was not consistent with /into on other functions.

--------------------------------------------------------------------------------

On 2013-11-25T11:23:25Z, dockimbel, commented:
<https://github.com/red/red/issues/577#issuecomment-29194307>

    Ticket processing postponed to the replacement of the runtime lexer.

--------------------------------------------------------------------------------

On 2014-04-28T11:05:24Z, dockimbel, commented:
<https://github.com/red/red/issues/577#issuecomment-41546147>

    It seems that the issue is not fixed for all cases:
    
    ```
    red>> b: next [1 2]
    == [2]
    red>> load/into "a" b
    == [2 a]
    ```

