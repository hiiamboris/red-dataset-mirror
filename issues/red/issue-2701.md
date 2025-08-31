
#2701: WISH: sqrt, log-e, log-2, log10 should test on positive argument
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.deferred] [type.wish]
<https://github.com/red/red/issues/2701>

Both R2 and R3 do this. Red gives NaN as result.


Comments:
--------------------------------------------------------------------------------

On 2017-05-20T16:06:09Z, dockimbel, commented:
<https://github.com/red/red/issues/2701#issuecomment-302882270>

    Red is following IEEE-754 standard by default, which specifies that NaN is the expected result in such cases. Though, IEEE-754 is not always suitable for Red users, so we plan to add a Rebol-compatible mode, where errors will be returned in such case. In order to do so, we need a way to alter such mode locally only, and we haven't defined such way yet.

--------------------------------------------------------------------------------

On 2017-05-20T16:51:24Z, meijeru, commented:
<https://github.com/red/red/issues/2701#issuecomment-302884999>

    Thanks. May I suggest "deferred"status?

--------------------------------------------------------------------------------

On 2018-04-25T05:11:47Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2701#issuecomment-384162604>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

