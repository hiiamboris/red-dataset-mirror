
#902: Access violation on PARSE of URL!
================================================================================
Issue is closed, was reported by hostilefork and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/902>

```
red> parse http://rebol.info/foo ["http" opt "s" "://rebol.info" to end]
*** Runtime Error 1: access violation
*** at: 080B2BADh
```



