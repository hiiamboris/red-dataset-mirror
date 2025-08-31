
#2778: WISH: checksum to operate on url! as well
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[type.wish] [status.resolved]
<https://github.com/red/red/issues/2778>

Unless of course there is a reason why this can't be done...


Comments:
--------------------------------------------------------------------------------

On 2017-06-19T02:08:01Z, qtxie, commented:
<https://github.com/red/red/issues/2778#issuecomment-309321857>

    In R2, `checksum` on `url!` is the same as on `string!`.
    ```
    >> checksum "http://rebol.com"
    == 13615491
    >> checksum http://rebol.com
    == 13615491
    ```
    Is it the behavior you want? @meijeru

--------------------------------------------------------------------------------

On 2017-06-20T21:04:08Z, meijeru, commented:
<https://github.com/red/red/issues/2778#issuecomment-309890920>

    No, I suppose the analogy is not with url! as a sort of string, but with url!, like file!, as an address where information is stored, and the checksum is computed over that information...

--------------------------------------------------------------------------------

On 2017-06-22T16:05:48Z, greggirwin, commented:
<https://github.com/red/red/issues/2778#issuecomment-310426335>

    It would be a nice convenience wrapper, but may be a bit tricky. With a local file, though it currently just bulk reads it, when we get full I/O it can handle large files. That won't work with url targets.

--------------------------------------------------------------------------------

On 2017-07-28T17:25:17Z, dockimbel, commented:
<https://github.com/red/red/issues/2778#issuecomment-318713942>

    We cannot do the checksum on a remote resource, you need to download it first locally using an I/O operation. What you want is `checksum read <url>`, that's already available (if your URL is using HTTP/S).

