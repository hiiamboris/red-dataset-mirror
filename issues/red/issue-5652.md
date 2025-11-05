# Issue #5652: `remove/key` is case sensitive, but shouldn't be
<https://github.com/red/red/issues/5652>

Key lookups in maps are case insensitive, and you can't have duplicate keys that differ only by case, so it seems key removal should be case insensitive as well. 
```
>> m: #[abc: 1]
== #[
    abc: 1
]
>> remove/key m 'ABC
== #[
    abc: 1
]
>> remove/key m 'abc
== #[]

>> m: #["abc" 1]
== #[
    "abc" 1
]
>> remove/key m "ABC"
== #[
    "abc" 1
]
>> remove/key m "abc"
== #[]
```

Internally it uses `COMP_STRICT_EQUAL`, but there's no comment to say whether that's by design.

-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "codec-redraft" tag: #v0.6.0 ahead: 9585 date: 1-Sep-2025/8:25:52 commit: #753b6b429cd439f80a6875340321af762075bd04 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------




## GiuseppeChillemi on 2025-10-05T16:31:55Z
`PUT/CASE` let you use the same key but different in case.

```
>> put/case x: #[A 33] 'a 22 probe x
#[
    A: 33
    a: 22
]
== #[
    A: 33
    a: 22
]
```

So it would be good to have `remove/case/key`




## GiuseppeChillemi on 2025-10-05T16:33:47Z
Only path lookup is case insensitive:

```
>> x/A
== 33
>> x/a
== 33
```

While using `select/case`

```
>> x: #[A: 33 a: 22]
== #[
    A: 33
    a: 22
]
>> select/case x 'a
== 22
>> select/case x 'A
== 33
```



## gurzgri on 2025-10-05T17:00:24Z
> Like hash! and block!, map! is case-preserving, and case-insensitive for lookup by default.

is how https://github.com/red/docs/blob/master/en/datatypes/map.adoc puts it.


## gurzgri on 2025-10-05T17:48:42Z
`remove/key` in itself only for use with maps has been considered a "hack" already in a longer Red/Red gitter room discussion between @greggirwin , @hiiamboris, Gabriele and others starting 21. Jan. 2021. Back than @hiiamboris called `remove/key`
 
>  an outlier, unlike anything else in Red (or is not?), and twisting it further won't bring any beauty to it's design

Adding another refinement `/case` to `remove` only to be used together with `/key` probably doesn't improve on this I think. When deleting keys, is a case-insensitive default really useful? I guess one wants to have perfect control over the keys when removing them.


## GiuseppeChillemi on 2025-10-05T18:35:39Z
@gurzgri So we would have different default working, one for `remove`, one for `select` and `put`. We need simmetry to avoid mental fatigue and to not have fragmentation. The more it is, the more a language is difficult to adopt and Redbol language have a lot of fragmentation because of DSLs.







## greggirwin on 2025-10-06T02:10:00Z
Thanks for the comments. I had forgotten about `/case` with maps, because I never use it. I've always been a "different things should have different names" kinda' guy, but that's just me. 

There was *HUGE* design discussion about `remove/key`, as there was no other way to do it. In other langs, assigning `none` would do it, but Red maps can store that just fine. We also don't want to use `unset!` for that, as...we really don't want to use it for anything.

Maps have a split personality, and `remove` can choose only one unless we combine it with `/case` and nothing else needs that in `remove`. Sadly, *we* have to choose. Unfortunately, having both means complicating `remove`, with the alternative being people writing mezzanine wrappers to normalize keys, etc.

> When deleting keys, is a case-insensitive default really useful? I guess one wants to have perfect control over the keys when removing them.

I don't think there's a single right answer to this. Associative arrays were, originally, targeted for easy, flexible use, with objects being more strict. We also have words vs strings, but we probably want the same behavior for both here. I don't remember when `set/case` was added, but that only works for paths, not single words, otherwise we'd be in a real mess. :^) Literal maps preserve case as well.

As with some other decisions, the question is how the reverse works. If it's insensitive by default, then we can add `remove/key/case`. If it's sensitive by default, removing keys case insensitively looks like...no fun at all. *However*, this also affects series that support `/key` and also default to being case sensitive.

So it's doc'd as being case sensitive, and may have been in the original design chat as such. I would have to search back to see.

For now, I will plan to close this, unless other arguments provide a better solution.


## hiiamboris on 2025-10-06T05:22:32Z
I keep my claim that `remove find map key` could work just fine, and aligned with Red actions design. Even if maps do not guarantee any order to survive between changes, they do guarantee order while reading, which is why we can `foreach` over them (which currently should be considered magic, not design ;), have `words-of`, `body-of`. All it takes is to use key as index (as opposed to integer index), and `first map`, `next map`, `find map key`, `remove map`... start working automatically.


## hiiamboris on 2025-10-06T06:59:51Z
Implementation-wise, since key is generally too big to attach to a cell, it can be modeled as:
1. An index in the current keys array, with a generation number attached to it. Once map mutates, it's generation number increases, rendering all the previous index references invalid, and index-aware series actions throwing an exception.
2. An index in a copy of current keys array. Such copy would be made only when required (by `foreach` or `find` call), and would be referenced from the map cell. It would remain intact for as long as any cell reference to it exists (though obviously after map modifications, some keys may yield `none` on access). 

FYI current `foreach` behavior relies on index in the current keys array but without any versioning, so its behavior is purely defined by the underlying implementation:
```
>> foreach [k v] m: #[1 1 2 2] [?? k m/(k + 2): k + 2]
k: 1
k: 2
k: 3
k: 4
k: 5
k: 6
k: 7
k: 8    ;) ... (runaway loop - as long as newly added key didn't exist it will run away)

>> foreach [k v] m: #[1 1 2 2 3 3 4 4 5 5] [?? k remove/key m k + 1]
k: 1
k: 3
k: 5

>> foreach [k v] m: #[1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10] [?? k  remove/key m k - 1]
k: 1
k: 2
k: 3
k: 4
k: 5
k: 6
k: 7
k: 8
k: 9
k: 10    ;) removal works (unless we trigger map compaction somehow)
```


## greggirwin on 2025-10-06T16:43:11Z
Thanks @hiiamboris.

Here is the old gitter channel, so save others searching: https://app.gitter.im/#/room/!DpbTtXGKMqJMjJVQtG:gitter.im

And old design notes: https://github.com/red/red/wiki/%5BNOTES%5D-Design-notes-on-removing-keys-from-MAP!-values

Since blocks support `/key` as well now, same as map, we have this behavior:
```
>> blk: [a 1 A 2 b 3 B 4]
== [a 1 A 2 b 3 B 4]
>> remove/key blk 'A
== [a 1 b 3 B 4]
>> blk: [a 1 A 2 b 3 B 4]
== [a 1 A 2 b 3 B 4]
>> remove/part find blk 'A 2
== [A 2 b 3 B 4]
>> blk: [a 1 A 2 b 3 B 4]
== [a 1 A 2 b 3 B 4]
>> remove/part find/case blk 'A 2
== [b 3 B 4]
>> blk
== [a 1 b 3 B 4]
```
A detail here is that `remove find ...` returns the position (and we don't want to change that), but `remove/key` returns the head of the series, which also matches maps (which have no direct series semantics). This brings me back to an ooooold question of whether Red should have standard key-val support funcs for blocks, to wrap the `remove/part find/skip series key 2 2` dance.

An issue in the past for `[find/get/set/has?/remove/take/...]-key` wrappers was supporting refinements that `find/select` have. i.e. `/only /case /same`. This should now be *much* easier with dynamic refinements, but still means more complicated specs for those funcs. It also means *not* supporting refinements that use series semantics, like `/part /last`, etc. and stating that key-val *access* does not guarantee ordering, as maps already do.

Thoughts, @dockimbel? 


## greggirwin on 2025-10-06T17:54:02Z
Correction, `/only` is *always* used for keys in this model.


## hiiamboris on 2025-10-06T17:58:45Z
```
>> remove/key [a b c d] 'b
== [a d]
```


## greggirwin on 2025-10-06T18:04:13Z
Good catch.


## GiuseppeChillemi on 2025-10-06T19:35:06Z
> ```
> >> remove/key [a b c d] 'b
> == [a d]
> ```

Here `remove/skip block key size` is a necessity
`remove/key` is for keys appearing at any position. If you want key removed on a partitioned block, `/skip` must be implemented



## GiuseppeChillemi on 2025-10-06T19:45:18Z
@Oldes 

Rebol3 assumes `skip` size = `2` when using `/key`

```
>> probe head remove/key x: [a b c d e f] 'a
[c d e f]
== [c d e f]

>> probe head remove/key x: [a b c d e f] 'b
[a b c d e f]
== [a b c d e f]

>> probe head remove/key x: [a b c d e f] 'c
[a b e f]
== [a b e f]
```

Also in Rebol3 `/part` does not work when using `/key`

```
>> remove/key/part x: [a b c d e f] 'a 3
== [c d e f]
```




## GiuseppeChillemi on 2025-10-06T20:00:13Z
IMHO `skip/part/key` are useful:

`/part length` remove `length` elements

`/skip size` removes size elements (= `/part length`)

`/key k` let you remove at any position so `remove/key [a b c d] 'b -> [a d]` is possible

`/key k /skip size` partitions the block and searches the key only in the head position avoiding `remove/key [a b c d] 'b -> [a d]`

`/skip size + /part length` removes `length` elements of `sized` partitions 

`/key k + /part length` removes `length` couples of `size: 2` 




## greggirwin on 2025-10-06T20:17:27Z
I'm sorry, @GiuseppeChillemi, but that makes no sense to me. A goal here is *not* to complect (nod to RIch Hickey) `remove`. YOu have `/part` meaning different things, based on whether it's in combination, as well as implicit sizing. I see this all as making it harder to get things right and reason about them, and as benefitting more direct use of low level functions with flat blocks, which I think we want to do *less* of whenever possible. The low level funcs are there, because they are needed for generality. You can do all that, I will argue, *more* clearly, with `remove find ...`.

`/key`, to me, implies key-value.

I'm also trying to avoid leaking all this out to @hiiamboris's `part and skip` ideas, and a general key-value DB interface, for temporary sanity, as those are deep topics.


## GiuseppeChillemi on 2025-10-06T22:12:00Z
It is simpler than you think but you must give geometry and names and use the concept of _RECORD_.

When you use `remove` you delete a _RECORD_ from a series whose `SIZE` is `1`. 
`/KEY` tells Red that `SIZE` = `2` and key is the first element. Series space is free form.
`/SKIP SIZE` would tell Red that record is `SIZE` and series space is partitioned so the `key` must be searched at the start of each partition.

If you want to delete multiple _records_ you must use `/part length`

Thinking in this way `MAPS` are record of `size` = `2` and when you remove, `skip 2` is implicit, `/part` is ignored. 

In any TARGET, `MAP!` or `BLOCK!` `/case` makes searching for the key more granular, letting you distringuish between `a A a: A:`

This framework would make `REMOVE`, `PUT`, `SELECT`, `FIND` use the same concepts and naming.

NOTE: I am also experimenting this notation: `/SKIP [3 2]` where the first is `size`, the second is `key`  position inside the record; my `FIND/SKIP` use this notation too. In `SELECT/SKIP`, the notation has 3 elements: `[3 2 3]` where `[SKIP-SIZE: 3 KEY-POS: 2 PICK-COLUMN: 3]` and you can easily undestand what it does.
  


## greggirwin on 2025-10-06T23:50:05Z
You're making it worse. :^)

- Magic numbers are *bad bad bad*.
- With `/part` You're conflating records with groups of record based on their order, which sounds downright dangerous. Though I don't imagine anyone would ever put two magic numbers in the wrong order. ;^)
- If you have groups of records it is more than likely based on an index of some kind, not their order and invisible size in a block.
- Flat data is opaque without a legend or Rosetta stone. We want data that is as self explanatory as possible. When we *can* include data and metadata together, that's great, and then you can do whatever you want, because the metadata should be part of the interface you *must* use to access the data.


## GiuseppeChillemi on 2025-10-07T14:06:57Z
There is another thing to consider here. `/Skip size` should be stored somewhere in the data block as side information to avoid writing it. @hiiamboris has already written on this topic and I have agreed with him.

I can understand that [3 2 3] or [1 3 2] or a coordinate system with no identifier may be confusing but don't consider it by know.

`remove` deletes a _record_ of `size` = 1
`remove/key` deletes a record of `size` = 2
`remove/skip n` would delete a record of `size` = n

The concept of `record` is always there.

The `/key` refinement tells `Red` to perform a free search for a key and then delete a record of `size` = 2. While `/key/skip key 2` would do the same work on a partitioned space as Rebol3 does (and Red does not have)

When you work on `MAP!` it is implicit that `record size` is 2

I would start with this wording and then continue. Do you agree with it?









## greggirwin on 2025-10-07T21:49:04Z
Things that came to mind, as I tinkered.
 
- In flat blocks, is the key part of the record (and its size)? That runs against the key-value model, right, where the two are deemed as separate things.
- `select/skip` only returns the next value, not the skip size. Do we change that for retrieval? R2 returned a block of skip size - 1, while R3 matches Red. I don't have the reason for the change in my head anymore. :^)
- We would need to add `/skip` to `[remove put]`, in addition to `/case` for `remove/key`.
- What about `take`? It needs `[/key /skip /case]` added.
- We have to sync up all the native functions that use `/key` for what types of keys are allowed. Currently `put` and `remove` differ in their specs.

My tinkerings are for flat blocks, and somewhat OT for this, but... https://gist.github.com/greggirwin/d990fff8cf55d2aaa53bd23a0e47acde

That's a quick mockup, based on some old ideas for key-val block support. To bring this back around to something I said earlier on the original topic:

> As with some other decisions, the question is how the reverse works. If it's insensitive by default, then we can add remove/key/case. If it's sensitive by default, removing keys case insensitively looks like...no fun at all. However, this also affects series that support /key and also default to being case sensitive.


## GiuseppeChillemi on 2025-10-07T22:57:36Z
1) `Key` is part of the record in my model
2) `select/skip` has a problem: it doesn't have the column to select in the interface. So records of `size` > 2 can't pick columns other than the next one. This should be solved and it is very important for flexibility. `select/skip` must not return the full record, only the selected column but I may change my mind. I actually use a special select/records which calculates the start of the record and copies  up to size.
3) Yes, `/skip` for `remove` and `put` together with `/case` would complete the model.

I will look at your gist tomorrow, with fresh mind.




## greggirwin on 2025-10-08T17:52:15Z
Gist updated.


## greggirwin on 2025-11-04T23:49:33Z
Gist updated: added a `hash!` for the keys, stored in parallel with the data.


