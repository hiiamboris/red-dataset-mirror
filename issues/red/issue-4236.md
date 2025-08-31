
#4236: READ/INFO returns multiple values in block! fields
================================================================================
Issue is open, was reported by rebolek and has 0 comment(s).
[type.review]
<https://github.com/red/red/issues/4236>

`read/info` returns multiple values in block! fields:

**To reproduce**

```
>> probe second read/binary/info http://red-lang.org
#(
    Location: ["http://www.red-lang.org" "https://www.red-lang.org/"]
    Date: ["Sun, 12 Jan 2020 08:28:53 GMT" "Sun, 12 Jan 2020 08:28:54 GMT" "Sun, 12 Jan 2020 08:28:54 GMT"]
    Content-Type: ["text/html; charset=UTF-8" "text/html; charset=UTF-8" "text/html; charset=UTF-8"]
    Server: ["ghs" "GSE" "GSE"]
    Content-Length: "220"
    X-XSS-Protection: ["0" "1; mode=block" "1; mode=block"]
    X-Frame-Options: ["SAMEORIGIN" "SAMEORIGIN"]
    Expires: ["Sun, 12 Jan 2020 08:28:54 GMT" "Sun, 12 Jan 2020 08:28:54 GMT"]
    Cache-Control: ["private, max-age=0" "private, max-age=0"]
    X-Content-Type-Options: ["nosniff" "nosniff"]
    Accept-Ranges: ["none" "none"]
    Vary: ["Accept-Encoding" "Accept-Encoding"]
    Transfer-Encoding: ["chunked" "chunked"]
    Last-Modified: "Fri, 10 Jan 2020 17:17:36 GMT"
)
```
As `red-lang.org` uses redirection it looks that new values are added for each page instead of replacing older values.
This has been confirmed on Linux and macOS latest builds, it seems fine on Windows. See [Red bugs room](https://gitter.im/red/bugs?at=5e1ad910b720fa5b3cfd98a1) for details.



