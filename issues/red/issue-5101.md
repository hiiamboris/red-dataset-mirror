
#5101: Setting non-existing word in a context is silently accepted
================================================================================
Issue is closed, was reported by rebolek and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5101>

Setting non-existing word in a context is silently accepted, however, an error should be thrown. See the example:

```
>> c: context [a: 1]
== make object! [
    a: 1
]
>> c/b: 1
>> c
== make object! [
    a: 1
]
```

Rebol properly throws an error:

```
>> c: context [a: 1]
>> c/b: 5
** Script Error: Invalid path value: b
** Near: c/b: 5
```

According to [@toomasv](https://gitter.im/red/bugs?at=62271ccdf43b6d783fef8fb8) this bug was introduced around June/July last year.



Comments:
--------------------------------------------------------------------------------

On 2022-03-14T15:27:41Z, dockimbel, commented:
<https://github.com/red/red/issues/5101#issuecomment-1066945630>

    That regression is related to the following commit: https://github.com/red/red/commit/85426df87f0f8225feb795ad0771d2e959bffa1a

--------------------------------------------------------------------------------

On 2022-03-14T17:34:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/5101#issuecomment-1067100887>

    https://github.com/red/red/issues/4988 likely too

