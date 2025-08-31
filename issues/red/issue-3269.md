
#3269: WRITE/INFO crashes when server returns 403
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3269>

### Expected behavior

This code should work:
```
write/info https://api.github.com/repos/red/red/issues [GET [Content-Type: "application/json" Accept: "application/vnd.github.v3+json" Authorization: "Basic bm9uZTpub25l"] ""]
```

### Actual behavior

It crashes. Because of missing `User-Agent` field, server returns 403 error, that `write/info` can't handle and crashes. It's specifically `403` error, if you add user agent, server returns 401 error, that is fine:

```
>> write/info  https://api.github.com/repos/red/red/issues [GET [Content-Type: "application/json" Accept: "application/vnd.github.v3+json" Authorization: "Basic bm9uZTpub25l" User-Agent: "xxx"] ""]
== [401 #(
    Server: "GitHub.com"
    Date: "Wed, 21 Mar 2018 13:43:48 GMT"
    Content-Type: "application/json; charset=utf-8"
    Content-Length: "83"
    Status: "401 Unauthorized"
    X-Gi...
```

### Steps to reproduce the problem

see the code above

### Red version and build date, operating system with version.

```
>> system/version
== 0.6.3
>> system/build
== make object! [
    date: 14-Mar-2018/12:01:04+01:00
    config: make object! [
        config-name: 'Linux
        OS: 'Linux
```



