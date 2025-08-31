
#903: Make PARSE return the input on success (wish)
================================================================================
Issue is closed, was reported by hostilefork and has 4 comment(s).
[type.wish]
<https://github.com/red/red/issues/903>

Currently:

```
red> parse false ['false]
== false
```

I guess the idea of PARSE allowing NONE! and LOGIC! as input may fit into some idea of parse "taking anything".  Yet I suspect it would be more valuable if those two cases were specifically disallowed (just scalar values in general being disallowed, actually).  And if on success, PARSE would by default return its input instead of TRUE/FALSE on success...and NONE on failure.

This would make PARSE more convenient in situations where your goal is simply validation of your input, and none would raise some kind of error.  Think:

```
read to-url parse urlstring ["http" opt "s" "://rebol.info" to end]
```



Comments:
--------------------------------------------------------------------------------

On 2014-08-22T16:25:29Z, rgchris, commented:
<https://github.com/red/red/issues/903#issuecomment-53084203>

    I think **parse reduce [false] [logic!]** is fine as FALSE isn't the input, the block containing FALSE is. Just as **parse reduce [false true true false false] [some logic!]** might be of value.
    
    The idea of PARSE returning the input series (except in the case where COLLECT is used) could be useful.

--------------------------------------------------------------------------------

On 2018-04-25T04:34:55Z, PeterWAWood, commented:
<https://github.com/red/red/issues/903#issuecomment-384158045>

    Following the introduction the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

