
#1901: WISH: platform-neutral access to temp & other std dirs
================================================================================
Issue is closed, was reported by mark-summerfield and has 4 comment(s).
[type.wish] [status.reviewed]
<https://github.com/red/red/issues/1901>

It can be very useful to know what the system's temp dir is so that you can store temp files, caches etc. only needed at runtime.

See, for example: https://docs.python.org/dev/library/tempfile.html#module-tempfile
I bet their source code would be easy to translate to Red.

It would also be useful to know the user's home dir.



Comments:
--------------------------------------------------------------------------------

On 2016-05-13T09:55:58Z, dockimbel, commented:
<https://github.com/red/red/issues/1901#issuecomment-219001427>

    I think we can support such feature in 0.7.0 using a `tmp://` virtual port.

--------------------------------------------------------------------------------

On 2018-04-25T04:43:08Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1901#issuecomment-384159045>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

