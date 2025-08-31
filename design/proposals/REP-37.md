
#37: WISH: WRITE action could return first argument instead of unset!
================================================================================
Issue is open, was reported by Oldes and has 4 comment(s).
<https://github.com/red/REP/issues/37>

Now return value from `write` is `unset!` in Red:
```
>> type? write %xxx CRLF 
== unset!
```
What if it would return the first argument, so one could chain actions? Imagine:
```
>> read/binary write/binary %xxx CRLF
== #{0D0A}
```
 


Comments:
--------------------------------------------------------------------------------

On 2018-12-18T22:04:47Z, endo64, commented:
<https://github.com/red/REP/issues/37#issuecomment-448388122>

    `type? write %xxx CRLF ; == unset!` is same as R2.
    On R3 `write` returns a `port!`, Red may follow R3 when port! type is ready.
    
    I remember that I asked to make `write` return the second argument for R2 but it rejected,
    ```
    send some@one write %file1 write %file2 data
    ```
    would be possible.
    Returning first argument looks less useful than returning second argument to me.

--------------------------------------------------------------------------------

On 2018-12-19T09:25:09Z, Oldes, commented:
<https://github.com/red/REP/issues/37#issuecomment-448526980>

    On R3-alpha `write` is returning `port!`, but closed port and with write only flags used, so completely useless (and I believe it was not intended). As this feature was meant mainly for in console use, returning second argument could be confusing. When I was thinking about it a little bit more, the best would be to return absolute path like:
    ```
    >> write %temp.txt "hello"
    == %/X/GIT/Red/temp.txt
    ```
    But while returning unmodified file is with no cost, creating absolute path would require computation and so probably not worth the addition.

