
#4969: Copy of `error!` value is returning an `object!` type
================================================================================
Issue is closed, was reported by Oldes and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4969>

Currently:
```red
>> type? e: try [1 / 0]
== error!
>> type? copy e
== object! ;<--- should be error!
```
Mentioned: https://gitter.im/red/bugs?at=6147413d99b7d975281a9684


