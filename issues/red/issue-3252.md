
#3252: RANDOM doesn't use /time part of date! seeds
================================================================================
Issue is closed, was reported by greggirwin and has 4 comment(s).
[status.tested] [status.reviewed] [status.resolved] [status.contribution]
<https://github.com/red/red/issues/3252>

### Expected behavior
```
>> random/seed now/time
>> collect [loop 5 [keep random 10]]
== [4 8 8 2 8]
>> random/seed now/time
>> collect [loop 5 [keep random 10]]
== [10 1 5 8 6]
```

### Actual behavior
```
>> random/seed now
>> collect [loop 5 [keep random 10]]
== [9 8 4 2 2]
>> random/seed now
>> collect [loop 5 [keep random 10]]
== [9 8 4 2 2]
```

### Steps to reproduce the problem

See above.

### Red version and build date, operating system with version.

0.6.3 on all platforms.

### Notes from Gitter chat

Random for time! inherits from float!, which casts to integer:

- https://github.com/red/red/blob/master/runtime/datatypes/float.reds#L508

Random for date! does, indeed, use only the /date part it seems:

- https://github.com/red/red/blob/master/runtime/datatypes/date.reds#L664
- https://github.com/red/red/blob/master/runtime/datatypes/date.reds#L666

I have this old, ported func based on empirical research in the R2 days of yore:
```
randomize: func [
    "Reseed the random number generator."
    /with seed "date, time, and integer values are used directly; others are converted."
][
    random/seed either find [date! time! integer!] type?/word seed [seed] [
        to integer! checksum form any [seed now/precise] 'sha1
    ]
]
```
Which suffers the same fate, as it just passes date! seeds through. You can avoid that by forming them first of course.

I think it would be good to open a ticket or PR for this. There may be a reason Red does what it does, and that reason may be R2 compatibility. If nobody can come up with a good reason to keep it that way, the PoLS tells me to use the /time part as well.


Comments:
--------------------------------------------------------------------------------

On 2018-03-13T10:16:27Z, dockimbel, commented:
<https://github.com/red/red/issues/3252#issuecomment-372615018>

    Could someone post a PR for this issue?

--------------------------------------------------------------------------------

On 2019-02-04T20:37:45Z, greggirwin, commented:
<https://github.com/red/red/issues/3252#issuecomment-460403683>

    If we revisit this, don't forget about https://github.com/red/red/pull/3428, which I'm going to close.

