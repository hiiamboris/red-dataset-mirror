
#2257: HTTP POST crashes console with malformed(?) data
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.tested] [type.bug] [status.resolved]
<https://github.com/red/red/issues/2257>

I am not exactly sure, how POST request should look like, but even if my code is wrong, I would expect error instead of crash:

```
write http://www.google.com [POST "something"]
```



Comments:
--------------------------------------------------------------------------------

On 2017-02-19T10:33:29Z, qtxie, commented:
<https://github.com/red/red/issues/2257#issuecomment-280910100>

    No crash now.

