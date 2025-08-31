
#4808: `copy image` returns junk
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [type.bug] [test.written] [GUI]
<https://github.com/red/red/issues/4808>

**Describe the bug**

Image is the only 2D series and has different `at` and `skip` semantics than the rest of the series:
```
>> i: make image! [4x4 #{111111 212121 313131 414141 121212 222222 323232 424242 131313 232323 333333 434343 141414 242424 343434 444444 }]
>> at i 2x2
== make image! [4x4 #{
    222222323232424242131313232323333333434343...
>> skip i 1x1
== make image! [4x4 #{
    222222323232424242131313232323333333434343...
```
As can be seen `(skip i n) <> (next at i n)` but in fact `(skip i n) = (at i 1x1 + n)`. And it makes sense in 2D thinking.

Similarly, we have `copy/part i pair` that copies 2D regions. We couldn't have had it any other way as any image has to be rectangular.

```
>> copy/part skip i 1x1 1x1
== make image! [1x1 #{222222}]
>> copy/part skip i 1x1 2x2
== make image! [2x2 #{222222323232232323333333}]
>> copy/part skip i 1x1 3x3
== make image! [3x3 #{
    222222323232424242232323333333434343242424...
>> copy/part skip i 1x1 4x4
== make image! [3x3 #{
    222222323232424242232323333333434343242424...
```
So far so good.

But what should `copy` do without /part? I think it should act like `copy/part .. INFxINF` that is copy up to the bottom right corner.
That is not what it does however:
```
>> copy i
== make image! [4x4 #{
    111111212121313131414141121212222222323232...     ;) correct
>> copy skip i 0x1
== make image! [4x3 #{
    121212222222323232424242131313232323333333...     ;) correct
>> copy skip i 1x0
== make image! [4x3 #{}]
>> copy skip i 1x1
== make image! [4x2 #{}]
>> copy skip i 0x2
== make image! [4x2 #{
    131313232323333333434343141414242424343434...     ;) correct
>> copy skip i 2x0
== make image! [4x3 #{}]
>> copy skip i 1x2
== make image! [4x1 #{}]
>> copy skip i 2x1
== make image! [4x2 #{}]
>> copy skip i 2x2
== make image! [4x1 #{}]
>> copy skip i 3x2
== make image! [4x1 #{}]
>> copy skip i 2x3
== make image! [2x1 #{343434444444}]       ;) correct
>> copy skip i 3x3
== make image! [1x1 #{444444}]             ;) correct
>> copy skip i 4x4
== make image! [0x0 #{}]                   ;) correct
```
What seems to work is skipping a whole number of rows and some other arbitrary cases.

At least 2 bugs here:
- resulting size is often unexplainable
- image is often empty

**To reproduce**
```
i: make image! [4x4 #{111111 212121 313131 414141 121212 222222 323232 424242 131313 232323 333333 434343 141414 242424 343434 444444 }]
copy i
copy skip i 0x1
copy skip i 1x0
copy skip i 1x1
copy skip i 0x2
copy skip i 2x0
copy skip i 1x2
copy skip i 2x1
copy skip i 2x2
copy skip i 3x2
copy skip i 2x3
copy skip i 3x3
copy skip i 4x4
```

**Expected behavior**
See above.

**Platform version**
```
Red 0.6.4 for Windows built 20-Dec-2020/21:04:56+03:00 commit #7a6d9a9
```

keywords: view


Comments:
--------------------------------------------------------------------------------

On 2021-01-22T16:26:15Z, hiiamboris, commented:
<https://github.com/red/red/issues/4808#issuecomment-765528223>

    See also https://github.com/red/REP/issues/59
    We could easily add that I think

