
#4361: [Compiler] Fails on repeatable patterns
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[type.review] [status.wontfix]
<https://github.com/red/red/issues/4361>

:point_up: [March 22, 2020 4:57 AM](https://gitter.im/red/red?at=5e76c5ee05db386b5f2c043a)

**Describe the bug**

Some simple and naive code constructs, when multiplied ad absurdum, cause the compiler to fail with an internal error.

Just some examples, as there must be much more than that:
```
a/b
a/b
a/b
...
```
and
```
f: does []
f: does []
f: does []
...
```
Repeat the mantra 50'000 times and the file won't compile, because the compiler calls `duplicate-symbol` internally and tries to create 50'000 unique words.

**To reproduce**

1. [`reddo "write %1.red {Red []^/} loop 50000 [write/append/lines %1.red {a/b}]"`](https://gitlab.com/hiiamboris/red-cli/-/tree/master/mockups%2Freddo) to create the test file
2. `red -c 1.red` output:
```
*** Red Compiler Internal Error: Internal Error : No more global variable space
*** Where: duplicate-symbol
*** Near:  [forall path [
append words either integer? item: path/1 [item] [
get?: to logic! any [head? path get-word? item]
get-path-word item clear blk get?
]
]
emit words
]
```

**Expected behavior**

Should be able to compile such scripts.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-Feb-2020/6:07:00+03:00 commit #bf15211
```



Comments:
--------------------------------------------------------------------------------

On 2020-03-23T13:12:15Z, dockimbel, commented:
<https://github.com/red/red/issues/4361#issuecomment-602580416>

    Just for the record, Red is flexible enough that nobody ever needs to hardcode 50k identical paths and functions. ;-)

--------------------------------------------------------------------------------

On 2020-05-26T11:38:49Z, dockimbel, commented:
<https://github.com/red/red/issues/4361#issuecomment-633971730>

    Even if we could find a way to remove the need for `duplicate-symbol` (which we currently can't), it would only push away a bit the reaching of Rebol's words limit (100k iterations instead of 50k in this case). The main issue is duplicating 50k the same path, which should be easily avoidable in any properly designed script.
    
    The proper way to remove this limit is when we transition to a self-hosted toolchain for Red and get rid of Rebol for running it. Until then, efforts for pushing away that limit would be very costly for us (and not very efficient) compared to users properly organizing their own code to avoid such extreme repetitions (after all, proper coding is about removing repetitions).

