# Archived messages from: [gitter.im/red/bugs](/gitter.im/red/bugs/) from year: 2018

## Monday 1st January, 2018

9214

[11:36](#msg5a4a1d2484fb74b940253c3a)I noticed that `is`, while being an `op!`, supports literal argument:

```
>> ?? is
is: make op! [[
    {Defines a reactive relation whose result is assigned to a word} 
    'field [set-word!] {Set-word which will get set to the result of the reaction} 
    reaction [block!] "Reactive relation" 
    /local words obj rule item
]]
```

however, user-defined `op!`s don't support neither get arguments nor literal ones. Can this be considered as a bug?

meijeru

[12:14](#msg5a4a260e29ec6ac311a6990e)@9214 I have not seen the interpreter protest an `op!` definition with lit- or get-arguments.

9214

[12:15](#msg5a4a265a68d092bb620f76cd)@meijeru no protests, it just refuses to work with them :D

```
>> test: func [:x y][append form :x y]
== func [:x y][append form :x y]
>> test abracadabra 1
== "abracadabra1"
>> test: make op! :test
== make op! [[:x y]]
>> abracadabra test 1
*** Script Error: abracadabra has no value
*** Where: test
*** Stack:
```

meijeru

[12:20](#msg5a4a278684fb74b940256964)Then it is a bug, I would say.

9214

[13:30](#msg5a4a38125355812e573c1ea7)guess I'll file a ticket before I forget that I reported this ;)

## Wednesday 3th January, 2018

luce80

[10:02](#msg5a4caa3eb48e8c356694ce9a)in R2 end-of-input/tail-of-input/empty-input/no-input is `unset!` in R3 and Red no. Is it by design?

```
>> about
REBOL/View 2.7.8.3.1 1-Jan-2011
Copyright 2000-2011 REBOL Technologies.  All rights reserved.
REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM
>> type?
== unset!
```

```
>> about
*****************************************************
**  REBOL 3.0
**    Version:   3.0.0.3.3
**    Platform:  Windows win32-x64
**    Build:     12-May-2014/13:36:01

>> type?
** Script error: type? is missing its value argument
```

```
>> about
Red for Windows version 0.6.3 built 27-Nov-2017/19:24:27+01:00
>> type?
*** Script Error: type? is missing its value argument
*** Where: type?
*** Stack:
```

R2 behaviour could be useful for a function like this:

```
better-comment: func [a b [any-type! unset!]] [either not unset? get/any 'b [:b][()] ]
```

rebolek

[10:05](#msg5a4caae60163b02810a843af)@luce80 In Red you need to quote the argument to get that behaviour:

```
== func ['b [any-type!]][probe type? :b]
>> f
unset!
```

luce80

[10:09](#msg5a4cabe203838b2f2a65afcc)@rebolek Ok, so it becomes:

```
better-comment: func [a 'b [any-type!]] [:b]
```

x8x

[23:07](#msg5a4d622051915d962afd9ee0):point\_up: \[December 29, 2017 11:21 AM](https://gitter.im/red/bugs?at=5a45c2ba03838b2f2a498725) @toomasv Thank you for the `position` example :-)

## Thursday 4th January, 2018

toomasv

[04:07](#msg5a4da8700163b02810ad63e0)@x8x You are welcome!

rebolek

[11:44](#msg5a4e139168d092bb6221f27a)Hm :suspect:

```
>> stats
== -2001924096
```

endo64

[12:05](#msg5a4e189c03838b2f2a6cecff)32bit boundry, you can do `to-hex stats`

rebolek

[12:08](#msg5a4e193b5355812e574ec119)@endo64 I understand, but I wonder why Red hadn't crashed already.

endo64

[13:56](#msg5a4e329e5355812e574f4e42)I think its because the value is still fit in 32bit (unsigned)  
In natives.reds file stats defined as `stats*: func [ ... ] [... integer/box memory/total ... ]`

[13:58](#msg5a4e32edb48e8c35669cab75)

```
>> to-hex -2001924096
== #88AD1000
```

Even if it doesnt, you probably see the first 4 bytes.

## Friday 5th January, 2018

9214

[14:32](#msg5a4f8c9ace68c3bc7480cd39):confused: I don't get it

```
>> foo: func [series '?][forall series probe compose [if (?) [print "!"]]]
== func [series '?][forall series probe compose [if (?) [print "!"]]]
>> foo [1 2 3][odd? index? series]
[if odd? index? series [print "!"]]
*** Script Error: series has no value
*** Where: index?
*** Stack: foo  

>> foo: func [series '?][forall series probe compose [if odd? index? series [print "!"]]]
== func [series '?][forall series probe compose [if odd? index? series [print "!"]]]
>> foo [1 2 3][odd? index? series]
[if odd? index? series [print "!"]]
!
!
```

[14:35](#msg5a4f8d25b48e8c3566a36793)somehow `forall` doesn't `bind` all words in a `compose`d body

rebolek

[14:38](#msg5a4f8dcc03838b2f2a744baa)Why do you think it should `bind`?

[14:38](#msg5a4f8de6232e79134dcccc9a)`foo: func [series '?][forall series probe bind compose [if (?) [print "!"]] 'series]`

9214

[14:38](#msg5a4f8df95355812e5756284d)@rebolek ooh, now I got it

[14:38](#msg5a4f8e02ba39a53f1adcc3a1)totally forgot that `bind` can accept word too

[14:39](#msg5a4f8e04232e79134dccccfb):+1:

## Sunday 7th January, 2018

luce80

[09:08](#msg5a51e3a4ce68c3bc748a80d3)

```
!
>> find {abc'defg} complement charset "a"
== "bc'defg" ; OK
>> find {abc'defg} complement charset "b"
== "abc'defg" ; OK
>> find {abc'defg} complement charset "z"
== "abc'defg" ; OK
>> find {abc'defg} complement charset " "
== "'defg" ; What !?
>> find {abc'defg} complement charset "^-"
== none ; What !?
```

[09:41](#msg5a51eb405355812e57602b1d)

```
>> about
Red for Windows version 0.6.3 built 7-Jan-2018/9:28:41+01:00
```

I think it is a recent regression since it is not present in:

```
Red for Windows version 0.6.3 built 27-Nov-2017/19:24:27+01:00
```

9214

[09:44](#msg5a51ebed290a1f45615b787d)potential culprits:  
\* https://github.com/red/red/commit/1f08d38d4a79fecc8b96ddfb09692d5802eed5c1  
\* https://github.com/red/red/commit/910d79a51d652628487ca2047615bbcf638fa1d8  
\* https://github.com/red/red/commit/c4523a0b3805d7392151634aa99184baeb823893

## Tuesday 9th January, 2018

9214

[15:56](#msg5a54e6436117191e614535f1)I would expect `[1 "a" 1 "b"]` here, though, this behavior makes sense too (all keys in records are identical, hence only one record remained)

```
>> unique/skip [1 "a" 1 "b" 1 "a"] 2
== [1 "a"]
```

greggirwin

[17:16](#msg5a54f8f2ce68c3bc7499b95a)Good to note, but not a bug. I think this makes the behavior a little clearer than the current red-by-example entry for this. @mikeparr?

9214

[17:17](#msg5a54f93c232e79134de664c4)@greggirwin how then I can apply `unique` to 2-element entries as a whole, not specifically to their keys?

greggirwin

[17:35](#msg5a54fd7ace68c3bc7499d623)You can't. They would need to be sub-blocks, or map over it yourself. If we want to consider it as a design change (and it may be a lot of work, because all set ops need to work consistently, and it will surely affect their code), we need to think through the implications. e.g., knowing you can't then use `extract` to get a unique set of keys, or `select` based on a unique key.

## Wednesday 10th January, 2018

Phryxe

[08:40](#msg5a55d16cba39a53f1afa1b24)@9214 @greggirwin Thanks for the clarification about 2-element entries.

PeterWAWood

[10:39](#msg5a55ed756117191e614ab0e0)@9214 If we consider the stated intention of the /skip refinement (from the help text) - `/skip => Treat the series as fixed size records`, I would also expect that each "sub-series" be treated as a single record.

```
>> unique/skip [1 "a" 1 "b" 1 "a"] 2
actual== [1 "a"]
expected== [1 "a" 1 "b"]
```

9214

[10:40](#msg5a55ed9983152df26d5347ce)@PeterWAWood that was my thought also

[10:41](#msg5a55edd5ae53c15903cdf6f4)but I agree with @greggirwin that in such case it's better either to use `map!` or wrap records in blocks

PeterWAWood

[10:41](#msg5a55edd8290a1f45616f8fa3)I feel that in Rebol, the "Treat the series as fixed size records" gets translated to treat the records as fixed length keyed records and process the keys.

[10:41](#msg5a55edf6b48e8c3566c1dda3)Reds' behaviour follows that of Rebol.

9214

[10:42](#msg5a55ee21232e79134deb62ea)yes, I understand that some operations use blocks as small databases and that `key - record` structure is implied

[10:44](#msg5a55ee92290a1f45616f9327)for now IMO it's reasonable to wait and see what are the most popular (and valid) use-cases and which behavior is more desired

PeterWAWood

[10:44](#msg5a55eea1290a1f45616f9362)Personally, I feel that `/skip` is not really well thought out and may have been added as an after thought.

[10:47](#msg5a55ef5eba39a53f1afac265)For example, it would make sense for me to have `next/skip` and `back/skip` if the `/skip` refinements were meant to provide a way of processing records with a fixed number of values all held in a single block.

rebolek

[10:57](#msg5a55f1a2ba39a53f1afacdba)@PeterWAWood `next/skip`, `back/skip` :+1:

9214

[10:58](#msg5a55f1bbb48e8c3566c1efc6)that's actually an interesting proposal

PeterWAWood

[11:05](#msg5a55f36b232e79134deb7ddb)I think that the question we should ask is should Red provide a way of treating a series of values as a series of records with a fixed number of values?

Which leads to the question "What value does treating the values of a block as a series of fixed records give over other ways of handling records (e.g. a block of blocks).

rebolek

[11:06](#msg5a55f3cad0514c785b121c9b)Much easier searching.

[11:07](#msg5a55f3f6ae53c15903ce1a81)Also, non-unique keys, if you need that.

PeterWAWood

[11:12](#msg5a55f506ce68c3bc749ea249)`find/skip` treats the data as keyed fixed number of item records with the key in the "first" position

[11:15](#msg5a55f5ddd0514c785b122804)

```
text
>> sort/skip [1 a 1 b 1 a] 2
== [1 a 1 b 1 a]
```

[11:17](#msg5a55f64ece68c3bc749ea8d7)So in general. when the help text says "Treat the series as fixed size records." it actually means "Treats the series as a key followed by a fixed number of values. Applies the function to the keys".

rebolek

[11:18](#msg5a55f6885a9ebe4f756c7bec)`sort` has `/compare` refinement that can be used to pass index in the record. Maybe `find` should support it also?

9214

[11:19](#msg5a55f6c1b48e8c3566c20c1b)@rebolek that would also solve issue with `unique` - `unique/compare`

[11:20](#msg5a55f6f9232e79134deb90bf)e.g. `unique/compare [1 "aa" 1 "bb" 1 "aa"] 2` yields `[1 "aa" 1 "bb"]` (?)

PeterWAWood

[11:21](#msg5a55f7425a9ebe4f756c7f20)I really wonder how useful this is:

```
>> select/skip [1 a b c d 2 e f g h] 2 5 
== e
```

9214

[11:21](#msg5a55f74a83152df26d537acd)i.e. instead of treating the first value of records as a key, you pass an index of another "key-like" value

rebolek

[11:22](#msg5a55f77e6117191e614ae34d)@9214 It probably would need to be `unique/skip/compare block 2 2`

9214

[11:22](#msg5a55f785ba39a53f1afaf0d3)@PeterWAWood I actually thought not a while ago that it may return `[e f g h]`

[11:22](#msg5a55f78cd0514c785b12301c)@rebolek yes, correct

PeterWAWood

[11:23](#msg5a55f7c0ba39a53f1afaf18a)I don't know if it is possible to come up with a quick fix. @dockimbel &amp; @greggirwin probably understand why `/skip` works the way it does. Hopefully one of them has time to drop by and tell us.

9214

[11:23](#msg5a55f7c483152df26d537e0d)but then, `select` returns \*value\*, not \*record*

PeterWAWood

[11:26](#msg5a55f84e5a9ebe4f756c848d)For me, I feel the whole area of treating a single series as a collection of records needs to be thoroughly thought through. A magical, virtual `record!` type might be the answer.

[11:27](#msg5a55f895ba39a53f1afaf66f)(@Rebolek Do you have Gitter stats for the number of posts containing alliteration? )

9214

[11:27](#msg5a55f8bace68c3bc749eb477):D

PeterWAWood

[11:28](#msg5a55f8fb5a9ebe4f756c8818)@9214 When `select` returns a value and not a record, it isn't really treating the series as fixed records is it?

rebolek

[11:29](#msg5a55f904290a1f45616fcd55)@PeterWAWood not yet, I should add it. :pencil:

PeterWAWood

[11:29](#msg5a55f90e5a9ebe4f756c8857):+1:

9214

[11:29](#msg5a55f925d0514c785b123975)@PeterWAWood again, it all depends on what Rebol (and Red) means by "fixed size records"

[11:30](#msg5a55f94ace68c3bc749eb7b0)I can imagine that both behaviors are useful, and separate `record!` datatype (or a dialect?) should suffice

[11:30](#msg5a55f95cba39a53f1afaf9bd)which one to choose as a default one - hard to tell

PeterWAWood

[11:30](#msg5a55f9736117191e614aec3b)As I said this needs to be properly thought through.

9214

[11:33](#msg5a55f9fe290a1f45616fd184)meanwhile, all we can do is to take notes an collect stats :)

toomasv

[11:53](#msg5a55feba290a1f45616feb7c)@9214 You mean something like:

```
select-record: func [series skp needle][copy/part next find/skip series needle skp skp - 1]
select-record [1 a b c 2 s d f 3 e d c] 4 2
== [s d f]
select-record [1 a b c 2 s d f 3 e d c] 4 3
== [e d c]
select-record [1 a b c 2 s d f 3 e d c] 4 1
== [a b c]
```

9214

[11:53](#msg5a55fed6290a1f45616febdc)@toomasv yup

[11:55](#msg5a55ff4c290a1f45616fef4d)`/record` refinement?

toomasv

[11:56](#msg5a55ff5d232e79134debc212)Why not

Phryxe

[13:18](#msg5a56129d290a1f4561705b8b)To continue about the 2-element entries and the suggestion to use subblocks. I wonder if `exclude` and `unique` should result in this way?

```
x: [[1 "aa"] [2 "bb"] [3 "cc"]]
y: [[1 "aa"] [2 "bc"] [3 "bc"]]
z: exclude x y
== [[1 "aa"] [2 "bb"] [3 "cc"]]

u: union x y
== [[1 "aa"] [2 "bb"] [3 "cc"] [1 "aa"] [2 "bc"] [3 "bc"]]
>> sort u
== [[1 "aa"] [1 "aa"] [2 "bb"] [2 "bc"] [3 "bc"] [3 "cc"]]
>> unique u
== [[1 "aa"] [1 "aa"] [2 "bb"] [2 "bc"] [3 "bc"] [3 "cc"]]
```

9214

[13:20](#msg5a561305ae53c15903ceca55)`exclude` works as intended, it returns the first set minus all the elements in the second set, same for `union`, it creates new set which contains all elements from first and second sets

[13:20](#msg5a56132683152df26d54182d)`sort`ing is okay, `unique`... well, idk

rebolek

[13:21](#msg5a5613686117191e614b7a86)@Phryxe you need to use `sort/compare` and pass a comparator function to it

Phryxe

[13:22](#msg5a561381ba39a53f1afb85da)I didn't think z should contain `[1 "aa"]`

[13:22](#msg5a56138fb48e8c3566c2ade2)... but sort works!?

9214

[13:23](#msg5a5613c0d0514c785b12c626)hmmm

rebolek

[13:23](#msg5a5613c4d0514c785b12c637)@Phryxe

```
>> b: [["x" 5]["b" 13]["f" 1]]
== [["x" 5] ["b" 13] ["f" 1]]
>> comparator: func [this that][this/1 < that/1]
== func [this that][this/1 < that/1]
>> sort/compare b :comparator
== [["b" 13] ["f" 1] ["x" 5]]
>> comparator: func [this that][this/2 < that/2]
== func [this that][this/2 < that/2]
>> sort/compare b :comparator
== [["f" 1] ["x" 5] ["b" 13]]
```

Phryxe

[13:24](#msg5a56141f290a1f456170632d)

```
>> b: [["x" 5]["b" 13]["f" 1]]
== [["x" 5] ["b" 13] ["f" 1]]
>> sort b
== [["b" 13] ["f" 1] ["x" 5]]
```

9214

[13:26](#msg5a56146d6117191e614b7f35)

```
text
>> exclude [[1 a]] [[1 a]]
== [[1 a]]
```

[13:26](#msg5a561475d0514c785b12ca26)hmhmhmhmhmmmm

[13:26](#msg5a561491ba39a53f1afb8da4)@Phryxe why won't you use `map!`?

rebolek

[13:27](#msg5a5614d86117191e614b836c)because of multiple same keys

9214

[13:28](#msg5a5614e3ce68c3bc749f46f3)ah, right

Phryxe

[13:28](#msg5a5614f6232e79134dec4035)@9214 As I mentioned to @rebolek before. I don't have unique keys and I wanted to use `exclude`, `union` and `unique`.

9214

[13:32](#msg5a5615e9ba39a53f1afb9524)perhaps set operations don't work as intended with sets of blocks

Phryxe

[13:37](#msg5a56170dd0514c785b12d8fd)I'm clueless :confused:

9214

[13:37](#msg5a56173283152df26d543084)let's wait for our all-mighties :^)

greggirwin

[17:24](#msg5a564c56ae53c15903d03aa4)So many great thoughts. Someone make sure we extract this into a wiki, for more thorough analysis.

[17:24](#msg5a564c5dce68c3bc74a09ec0)@greggirwin don't forget to do that.

9214

[17:25](#msg5a564c725a9ebe4f756e8711)@rebolek can you do that with your gitter magic?

rebolek

[17:25](#msg5a564c89d0514c785b141ee3)simsalabim

[17:25](#msg5a564c976117191e614cdb43)@9214 I can, I guess.

9214

[17:26](#msg5a564caab48e8c3566c41902)@rebolek it's kreks-peks-feks actually

rebolek

[17:26](#msg5a564cd8d0514c785b14210d)@9214 @greggirwin I will take a look at it and let you know

greggirwin

[17:38](#msg5a564fa4b48e8c3566c42d66)On `/skip`, for consistency, then we'd end up with `skip/skip`, right?

The obvious use case is key-value pairs, so you can avoid values being treated as keys by `find/select`, so the size 2 case is optimal.

`/record` is a very interesting idea, but needs more thought about the ultimate value.

&gt; "Treat the series as fixed size records." it actually means "Treats the series as a key followed by a fixed number of values. Applies the function to the keys".

Should be in red-by-example, or other docs, for sure.

The funcs in question are: `[find select sort ]`, yes? (`new-line` shouldn't matter here). And I think we're all good with `find/skip`, and `sort/skip` works as expected. That leaves `select/skip`. The doc string for `select` is:

&gt; Find a value in a series and return the next value, or NONE.

So it does what it says, and matches Peter's explanation above. As it stands, you can make the `/record` approach work, as @toomasv shows. If we change it, and you want the current behavior, you have to do `first select/skip series value size`, yes? And, if changed, you don't get the key back with the record, correct? So you say your record size is N, but you get back N-1 values, and would need to insert the key if you want the complete rec. That is, if you visualize chopping the series up into fixed size sub-blocks, the key would be the first item \*inside* each one.

[17:42](#msg5a56508dd0514c785b143ab2)`next/skip` and `back/skip` \*do* look appealing at first glance. Then we should also have `at/skip` and `pick/skip` for consistency.

9214

[17:44](#msg5a5650f16117191e614cf9f0)\[`skip-ba-bop-ba-dop-bop`](https://www.youtube.com/watch?v=Hy8kmNEo1i8)

greggirwin

[17:49](#msg5a56520cba39a53f1afd04ce)Worth considering? Yes. An obvious design mistake? No.

And since I don't think (my opinion only) that it's a design mistake, I'm uneasy about changing it. Not because the new behavior wouldn't be useful in some cases, but because I don't know if we should encourage the use of flat blocks for implicit, fixed-size records. If all data did that, you wouldn't know anything about the structure by looking at it.

If you've Reboled or Reduced for any time, you've used this trick. I can't say I've ever been glad I did when I went back to it later. Short term gains.

9214

[17:52](#msg5a5652ead0514c785b1449f6)@greggirwin another questions is if set operations designed to work with sets of blocks?

[17:53](#msg5a56530aae53c15903d065dc)

```
text
>> unique [[1][1]]
== [[1] [1]]
>> exclude [[1]][[1]]
== [[1]]
```

toomasv

[17:55](#msg5a565374ba39a53f1afd0c0a)I recall that I used something like this when playing with `query`. If you want to build anything like db in `red` proper you have to have access to records. Of course, records don't need to be `copy/part`-ed, but appropriate part should be bound to field-words. .. Or something

9214

[17:59](#msg5a5654836117191e614d0fa9)also, blockifying flat set is (almost) trivial, with the caveat then there's one element left at the tail

```
>> parse [please blockify me thanks in advance !][collect some keep [3 skip | thru end]]
== [[please blockify me] [thanks in advance] !]
```

[17:59](#msg5a56549f6117191e614d1057)also, why the snippet above freezes everything if I change `thru` to `to`?

greggirwin

[18:03](#msg5a565555d0514c785b1456c7)@Phryxe @9214 that looks like an `unique/exclude` bug. Please report it if there's not already a ticket. Good catch!

9214

[18:03](#msg5a5655566117191e614d166f)I feel that this one could be a separate mezzanine

toomasv

[18:04](#msg5a5655c75a9ebe4f756ec138)s/@toomasv/@9214

greggirwin

[18:05](#msg5a5655edb48e8c3566c45628)@9214 `some [to end]`

[18:05](#msg5a565602232e79134deddce9)Thanks @toomasv. :^)

9214

[18:05](#msg5a565602290a1f456171f85d)@greggirwin aaah, of course

greggirwin

[18:06](#msg5a565627b48e8c3566c457c8)I saw it right away, because that's my life. Always \*almost* done.

9214

[18:07](#msg5a565656b48e8c3566c4587c)A little engine that could :train:

[18:16](#msg5a5658716117191e614d2a8a)https://github.com/red/red/issues/3195

Phryxe

[20:29](#msg5a56779883152df26d56810f)Not sure if this result also should be mentioned in the same issue?

```
>> intersect [[1][2][3]][[3][4][5]]
== []
>> intersect [[1][2][3]] [[3][4][5]]
== []
>> intersect [[1] [2] [3]] [[3] [4] [5]]
== [[3]]
```

[20:34](#msg5a5678d183152df26d568881)Added it in a comment.

toomasv

[20:54](#msg5a567d8a83152df26d56a16e)Interesting. For me all are empty.

Phryxe

[20:55](#msg5a567dc0232e79134deecb96)I tried again and they are all empty, but above code is copied straight from the console.

toomasv

[20:56](#msg5a567e0dd0514c785b15445a) :see\_no\_evil:

Phryxe

[20:57](#msg5a567e266117191e614e1271):laughing:

greggirwin

[21:44](#msg5a568959290a1f4561731d04)I get the result above the \*first* time I run it. Empty result if I just do the last line again. Worth a report addition.

## Thursday 11st January, 2018

Phryxe

[07:20](#msg5a571021b48e8c3566c7c5b1)@greggirwin Thanks. Glad I wan't hallucinating :relieved:

[08:58](#msg5a572722d0514c785b182f3c)wan't =&gt; wasn't

greggirwin

[18:19](#msg5a57aaa8b48e8c3566cb50a9)Who doesn't "want" hallucinating? :^)

toomasv

[18:21](#msg5a57ab16d0514c785b1b36a1)@greggirwin Me does

greggirwin

[18:23](#msg5a57abaa6117191e61540edd)I'm going to brew some more psychoactive brown liquid shortly. Pretty sure you are all voices in my head that it creates.

toomasv

[18:24](#msg5a57abdb5a9ebe4f7575eeb4)Nam-nam

rebolek

[19:16](#msg5a57b8026117191e61545518)mmmm

## Friday 12nd January, 2018

Phryxe

[11:32](#msg5a589cbe83152df26d61147a)It's all about C3 now, but I hope we can get a quick fix for the SET operations with subblocks as I need it :nail\_care:

greggirwin

[18:30](#msg5a58fed761a861c92706db12)Can you live with mezz solutions for now @Phryxe? I built some before Red had native set funcs, and could pull them out if it would help.

Phryxe

[20:37](#msg5a591c9bb48e8c3566d2a29a)@greggirwin Thank you, that would be great.

greggirwin

[23:17](#msg5a59420083152df26d64b9b7)@Phryxe: https://gist.github.com/greggirwin/e579c08410497b9f9ba3b9978fa45347

I removed most dead, experimental versions of the funcs, but left in some ideas about how we can approach function factories in given domains.

## Saturday 13th January, 2018

Phryxe

[11:07](#msg5a59e88bb48e8c3566d5bba6)@greggirwin Thanks again!

greggirwin

[11:20](#msg5a59eb865a9ebe4f758079eb)Happy to help.

## Sunday 14th January, 2018

9214

[13:34](#msg5a5b5c52290a1f4561889cfa)`round`'s description claims "Returns the nearest \*\*integer\*\*"

```
>> round 2.0
== 2.0
```

either bug or docstring needs clarification

greggirwin

[16:23](#msg5a5b841bce68c3bc74b7b8c0)There was a lot of chat about that when `round` was designed. I would prefer a true integer! result, but it's not \*wrong\*, because 2.0 is an integral value. "Returns the nearest multiple of 1 of the same datatype." doesn't read so well. For values like time, money, and more, we don't want an integer! result, but for plain numbers, it can be very useful, and intuitive IMO.

[16:26](#msg5a5b84c4517037a212a5d920)If you give it an integer value, you do get one back, which still makes it useful for alternate scale rounding, where an integer! result is desired. It just means you can't as easily use the result directly with func (e.g. `repeat`) that require an integer!.

If we want to change it, we need a strong case.

9214

[16:32](#msg5a5b86045a9ebe4f7586adf9)@greggirwin I see, thanks for detailed answer!

toomasv

[17:08](#msg5a5b8e735ade18be397557ea)On phone now, but I remember ‘round/to 2.0 1’ gives ‘integer!’.

greggirwin

[17:10](#msg5a5b8eface68c3bc74b7eb7f)Ah, yes!

## Tuesday 16th January, 2018

Oldes

[13:29](#msg5a5dfe49b48e8c3566e7fbe7)I tied to make smaller Red compiled app using the latest UPX tool and it fails... so I guess there will be something wrong in the executable..

```
x:\tools>upx -9 lame-gui.exe
                       Ultimate Packer for eXecutables
                          Copyright (C) 1996 - 2017
UPX 3.94w       Markus Oberhumer, Laszlo Molnar & John Reiser   May 12th 2017

        File size         Ratio      Format      Name
   --------------------   ------   -----------   -----------
upx: lame-gui.exe: InternalError: should not happen
```

@dockimbel couldn't it be the reason why some Antivirus software don't like Red binaries?

## Wednesday 17th January, 2018

endo64

[07:10](#msg5a5ef6d45a9ebe4f75983d4a)Most antivirus programs give error for upx compressed executable too.

## Thursday 18th January, 2018

kermitaner

[22:54](#msg5a6125a85a9ebe4f75a55276)i'm currently playing around with the enbase/base functions and i get an error when compiling the enbase function:

```
Red []
probe enbase "abc"
```

Compiling D:\\save\\red\\rosetta\\vignere\\t1.red ...  
...using libRedRT built on 18-Jan-2018/23:40:21+1:00  
...compilation time : 31 ms

Target: MSDOS

Compiling to native code...  
\*\** Compilation Error: undefined symbol: red/natives/enbase*  
\*\** in file: %/D/save/red/rosetta/vignere/t1.red  
\*\** at line: 332  
\*\** near: [  
natives/enbase* true -1  
stack/unwind  
f\_probe  
stack/unwind #user-code  
]  
in release mode it is working , also no problems with the debase function. tested with latest build...

greggirwin

[23:30](#msg5a612e175ade18be3993c247)@kermitaner, good find. It looks like `red/natives/debase*` needs to be added to https://github.com/red/red/blob/master/system/utils/libRedRT-exports.r. Please file a ticket.

[23:41](#msg5a6130bc9cdc721e4f9c86ce)Sorry, `enbase` needs to be added.

## Friday 19th January, 2018

kermitaner

[08:55](#msg5a61b26fce68c3bc74d8280e)@greggirwin Done: #3203

greggirwin

[21:49](#msg5a6268076117191e6189ff5a)Great! Thanks. Already fixed.

## Saturday 20th January, 2018

kermitaner

[10:45](#msg5a631dc16117191e618cd128)yes, I'm always impressed how fast things get fixed and are included in the latest build :- ) I used the function in my latest gist for vigenere encrypting  
\[gist](https://gist.github.com/kermitaner/adf6a77b8502fab05997280277cdbb68)

greggirwin

[16:39](#msg5a6370c86117191e618e5ef9)@kermitaner, very nice! Hey, @toomasv, it's a https://en.wikipedia.org/wiki/Vigen%C3%A8re\_cipher!

toomasv

[17:23](#msg5a637b03ba39a53f1a3db255)@greggirwin :question:

greggirwin

[22:37](#msg5a63c4b9517037a212d1752a)Just thought you might like it, because of your other cypher work.

## Sunday 21st January, 2018

toomasv

[06:43](#msg5a643677517037a212d310cd)@greggirwin I see, first time I clicked your link I got the answer that the article is not in Wikipedia -- but it was the fault of the exclamation mark in the end of the link :wink:

greggirwin

[07:32](#msg5a64422b9cdc721e4faabfc7)Ahhhhhh. :^\\

## Wednesday 24th January, 2018

Oldes

[10:08](#msg5a685b2ee01412265085ac46)@dockimbel I just noticed, that this fails to compile:

```
t:  (as float! (systime/data3 and FFFFh) * 3600.0)
```

while this is ok:

```
t:  (3600.0 * as float! (systime/data3 and FFFFh))
```

Worth ticket?

greggirwin

[16:22](#msg5a68b2d298927d57452ebacc)Does this compile?

```
t:  ((as float! (systime/data3 and FFFFh)) * 3600.0)
```

9214

[20:26](#msg5a68ebe4ae53c159032dd4d3)expected?

```
>> f: has [x][x]
== func [/local x][x]
>> f
== none
```

toomasv

[20:51](#msg5a68f1c998927d5745305cd5)@9214 What did you expect?

9214

[20:51](#msg5a68f1d3d9f895c360583447)`unset`

toomasv

[20:52](#msg5a68f1f298927d5745305d72)Why?

9214

[20:52](#msg5a68f20e5a9ebe4f75cd8620)well, because `x` wasn't set to any value?

[20:52](#msg5a68f21a0ad3e04b1b641bc4)and why `none`?

[20:54](#msg5a68f26dae53c159032e02cd)or, since `/local` is a refinement, all arguments of that refinement are setted to `none`

toomasv

[20:54](#msg5a68f26dce68c3bc74fc8097)Because otherwise you can't do things like `any [x 'b]` from inside func?

9214

[20:54](#msg5a68f26f0ad3e04b1b641e3d)I see

toomasv

[21:01](#msg5a68f41cae53c159032e0e44)

```
>> f: func [/refine something][print either something ["Got it!"]["I still don't understand!"]]
== func [/refine something][print either something ["Got it!"] ["I still don't understand!"]]
>> f
I still don't understand!
>> f/refine "my understanding"
Got it!
```

9214

[21:02](#msg5a68f475ae53c159032e1114)why `/local` is a refinement anyway?

[21:02](#msg5a68f47b5a9ebe4f75cd94ed)oh, good question to Carl

greggirwin

[21:43](#msg5a68fe176117191e61aacf41)Local words do get initialized to `none`, for convenience. As for why it's a refinement, we can ask "How else would you do it?" It's one of those tricks that you don't really notice, and it took a long time for people to even consider that you could sneakily use it when calling a func.

From an implementation perspective, it's consistent with other refinements that can be followed by words, and even type specs for them.

## Saturday 27th January, 2018

luce80

[16:53](#msg5a6cae6cae53c15903410fdc)I think there is something wrong here:

```
>> find "abc" complement charset "a"
== "bc"
>> find "abc" complement charset "d"
== "abc"
>> find "abc" complement charset " "
== none
>> about
Red for Windows version 0.6.3 built 27-Jan-2018/15:00:13+01:00
```

toomasv

[18:27](#msg5a6cc499e217167e2c0a2140)

```
>> non-em: complement charset " "
== make bitset! [not #{0000000080}]
>> repeat i length? non-em [if non-em/:i [prin to-char i]]
<some control chars>
!"#$%&'(
>> find "abc" non-em
== none
```

Given content of `non-em`, its only logical. The problem arises from the mechanism of charset allocation.

luce80

[18:44](#msg5a6cc88c0ad3e04b1b775397)Therefore there is a problem...

toomasv

[19:17](#msg5a6cd0464a6b0dd32b55ab37)I wonder -- is this the explanation? \[red-blog](http://www.red-lang.org/search?q=bitset)

&gt; Bitsets are auto-sized to fit the specification value(s) provided. The size is rounded to the upper byte bound.

luce80

[19:47](#msg5a6cd749ae53c1590341d079)Seems so:

```
>> space: charset " "
== make bitset! #{0000000080}
>> non-em: make bitset! complement #{00000000800000000000000000}
== make bitset! #{FFFFFFFF7FFFFFFFFFFFFFFFFF}
>> find "abc" non-em
== "abc"
>> repeat i length? non-em [if non-em/:i [prin to-char i]]
<some ctrl chars>!"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefg== none
>> non-em: make bitset! complement #{000000008000000000}
== make bitset! #{FFFFFFFF7FFFFFFFFF}
>> find "abc" non-em
== none
```

toomasv

[21:20](#msg5a6ced00e217167e2c0ad7db)@luce80 :+1:

endo64

[22:50](#msg5a6d022a6117191e61bf00dd)It works here:

```
>> find "abc" complement charset " "
== "abc"
>> about
Red for Windows version 0.6.3 built 21-Dec-2017/23:39:43+03:00
```

9214

[22:55](#msg5a6d03594a6b0dd32b568a3b)@endo64 can't find a culprit in commits :confused:  
https://github.com/red/red/commits/master

endo64

[23:02](#msg5a6d04f898927d574544a5dd)I just re-build Red, and now:

```
>> find "abc" complement charset " "
== none
```

[23:04](#msg5a6d0581ce68c3bc7410cf4a)@9214 Could be this one?

```
SHA-1: c4523a0b3805d7392151634aa99184baeb823893
* FIX: issue #3159 (Uncorrect result when `find/skip` vector! with 0 and negative numbers)
```

9214

[23:05](#msg5a6d05a0ae53c1590342988c)@endo64 how did I missed that one? :+1:

endo64

[23:10](#msg5a6d06d5ae53c15903429db7)Should we raise another issue for this or just inform @qtxie or comment in #3159 ?

9214

[23:10](#msg5a6d0700ce68c3bc7410d6c3)@endo64 all of the above? :smile:

endo64

[23:18](#msg5a6d08cc0ad3e04b1b787433):) Done! #3214

## Sunday 28th January, 2018

qtxie

[03:21](#msg5a6d41bbce68c3bc7411ad06)Thanks. I'll have a look at it.

## Monday 29th January, 2018

endo64

[07:39](#msg5a6ecfb04a6b0dd32b5e22ba)I know these are most stupid parse rules ever written, but they crash, worth a ticket?

```
>> parse "abc" [to fail]
>> parse "abc" [some fail]
>> parse "abc" [thru fail]
>> parse "abc" [any fail]

*** Runtime Error 1: access violation
*** at: 00427815h
```

PeterWAWood

[07:46](#msg5a6ed14f98927d57454c1a1e)Yes, I think so.

endo64

[08:07](#msg5a6ed631ce68c3bc74185d92)Done, #3217

PeterWAWood

[08:24](#msg5a6eda326117191e61c6be01)Thanks

## Tuesday 30th January, 2018

xqlab

[12:32](#msg5a7065f96117191e61cfbd84)

```
>> help put
USAGE:
     PUT series key value

DESCRIPTION: 
     Replaces the value following a key, and returns the new value. 
     PUT is an action! value.

ARGUMENTS:
     series       [series! map! object!] 
     key          [scalar! any-string! any-word! binary!] 
     value        [any-type!] 

REFINEMENTS:
     /case        => Perform a case-sensitive search.

RETURNS:
     [series! map! object!]

>> 
>> 
>> put {1a2b3c4e5f} {2} "x"
*** Script Error: put does not allow string! for its series argument
*** Where: put
*** Stack:  

>> series? {2}
== true
>>
```

endo64

[12:39](#msg5a706786e217167e2c1c2726)I think `put` currently supports only `map!`

xqlab

[13:47](#msg5a70777e6117191e61d02f21)No, it works with blocks too. Maybe the help text should be changed

rebolek

[13:50](#msg5a707814494bd0f53043f5c5)Right, it should probably be `[any-block! map! object!]`

endo64

[20:33](#msg5a70d6abe217167e2c1f141e)Correct, works also with `object!` so it could be bug or regression (if it worked before but I don't remember)

## Saturday 3th February, 2018

PeterWAWood

[13:14](#msg5a75b5cd4a6b0dd32b83de5c)I compiled this program with the `-u` option:

```
Red []

#system [
	print [string/byte-to-hex 255 lf]
]

print 100
```

LibRedRT was recompiled but the program compilation failed Here is he output:

```
-=== Red Compiler 0.6.3 ===- 

Compiling /Users/peter/VMShare/Code/Red/test.red ...
...compilation time : 908 ms

Target: Darwin 

Compiling to native code...
libRedRT-extras.r file generated, recompiling... 

Compiling /Users/peter/VMShare/Code/Red/test.red ...
...using libRedRT built on 12-Nov-2017/6:49:14+8:00
...compilation time : 24 ms

Target: Darwin 

Compiling to native code...
*** Compilation Error: undefined symbol: red/string/byte-to-hex 
*** in file: %/Users/peter/VMShare/Code/Red/test.red 
*** at line: 332
```

Did I misunderstand the purpose of the `-u` option or is it a bug?

endo64

[14:41](#msg5a75ca334a6b0dd32b843c74)@PeterWAWood I think `byte-to-hex` is missing in `libRedRT-exports.r` file.

[15:00](#msg5a75cea3e217167e2c39676e)@PeterWAWood I can compile your script:

```
Compiling C:\Users\endo\Documents\Red\red-endo\build\bin\test.red ...
...compilation time : 1275 ms

Target: Darwin

Compiling to native code...
libRedRT-extras.r file generated, recompiling...

Compiling C:\Users\endo\Documents\Red\red-endo\build\bin\test.red ...
Compiling libRedRT...
...compilation time : 1986 ms

Compiling to native code...
...compilation time : 58005 ms
...linking time     : 666 ms
...output file size : 962560 bytes
...output file      : C:\Users\endo\Documents\Red\red-endo\build\bin\libRedRT.dylib

...compilation time : 36 ms

Target: Darwin

Compiling to native code...
...compilation time : 1689 ms
...linking time     : 111 ms
...output file size : 73728 bytes
...output file      : C:\Users\endo\Documents\Red\red-endo\build\bin\test
```

I'm on Win10 x64.

toomasv

[16:39](#msg5a75e5a9ce68c3bc743e3cde)I am in big trouble. No version of red console is showing up on W10. I was developing `graph` and something happened so that console crashed and does not open up anymore. I downloaded the latest version, it compiled, but doesn't open. Neither does the stable 0.6.3. Even after restart. :scream:

9214

[16:42](#msg5a75e68c98927d57457265ec)@toomasv have you cleared up ProgramData?

toomasv

[17:04](#msg5a75eb9036de78850ce8076e)@9214 Sorry, switched off my computer meanwhile. ProgramData? Umm .. No. How?

9214

[17:04](#msg5a75ebb398927d574572806d)IIRC there's some directory on Win there all red executable versions and crash dumps reside

toomasv

[17:05](#msg5a75ebed98927d57457280eb)I'll start searching. Thanks

9214

[17:07](#msg5a75ec3498927d57457282a5)@toomasv it should be `/ProgramData/Red/`

[17:07](#msg5a75ec48b3c4a0d376d776f9)just wipe it out and do a fresh install, I think it should help

toomasv

[17:10](#msg5a75ed23ac509d207db3fa86)@9214 :bow: You are my hero! I'll be your slave for .. err.. tonight!

[17:12](#msg5a75ed8298927d57457288b6)I noticed there were lot of crash reports in ProgramData/Red. Should I study these closer when they appear again?

9214

[17:13](#msg5a75eda836de78850ce812d6)@toomasv you can include them in bug reports if you want

[17:13](#msg5a75edb8ce68c3bc743e62e8)\[!\[RGI7iPwqM9A.jpg](https://files.gitter.im/red/bugs/oyBJ/thumb/RGI7iPwqM9A.jpg)](https://files.gitter.im/red/bugs/oyBJ/RGI7iPwqM9A.jpg)

[17:13](#msg5a75edb9b3c4a0d376d77fa7)&gt; I'll be your slave

toomasv

[17:13](#msg5a75edca36de78850ce81390)Who's who?

9214

[17:14](#msg5a75ede3ce68c3bc743e6352)time will tell

toomasv

[17:49](#msg5a75f63ee217167e2c3a19d6)@9214 BTW \[That's](http://vooglaid.ee/red/graph-steps.gif) what I was working on:  
!\[stepped (orthogonal) graphs](http://vooglaid.ee/red/graph-steps.gif)

9214

[17:50](#msg5a75f671ce68c3bc743e8c9e)@toomasv wow, and how is it performance-wise?

toomasv

[17:51](#msg5a75f68a7dcd63481f12fed4):-1:

[17:52](#msg5a75f6eda3447aac7538a100)It doesn't work with recent builds. I use one from the end of last year.

greggirwin

[19:08](#msg5a7608976117191e61ee1075)Temporary problems and performance aside, this is \*very* cool @toomasv. It just keeps getting better.

toomasv

[19:27](#msg5a760d3dce68c3bc743ef806)Thanks, @greggirwin . My head is blowing up with ideas about what else to do with it.

9214

[19:28](#msg5a760d5b4a6b0dd32b8565d1)@toomasv visualize blockchain?

toomasv

[19:30](#msg5a760dd536de78850ce8ac28)Visualize relations in anything -- with another DSL which converts arbitrary (well, almost) structures into graph DSL.

9214

[19:31](#msg5a760e24ac509d207db49746)I would like to see notes/tutorial of yours with regard to DSL development at some point, since you're the one who really digs into subject.

toomasv

[19:34](#msg5a760edf36de78850ce8b0ed)I would need help here, as I am very bad in even commenting my code, not to tell about writing a tutorial.

greggirwin

[19:39](#msg5a760ff47dcd63481f1371f0)We can collaborate. Someone looks at the code and asks questions, the author (who hates writing even comments ;^) answers, and the editor wordsmiths their answers into documentation.

9214

[19:40](#msg5a761017ac509d207db4a0c2)and everyone get tips :red\_circle:

greggirwin

[19:40](#msg5a7610264a6b0dd32b857364)It could be done in an interview style. It can be very helpful to talk to others and learn how they work.

[19:40](#msg5a7610376117191e61ee3556)@9214 of course. :^)

toomasv

[19:40](#msg5a76104a98927d57457332fb)Wool Ya Wool

greggirwin

[19:42](#msg5a76108898927d5745733475)That sounds vaguely Swedish when I read it. ;^\\

BillDStrong

[19:43](#msg5a7610db4a6b0dd32b857879)Being forced to talk about your code can also help you reason about it better.

toomasv

[19:43](#msg5a7610f3ac509d207db4a5f1)(Got it from urban dictionary while looking for Ya Whol, to seem knowlegeable)

greggirwin

[19:44](#msg5a7611277dcd63481f137694)@toomasv, ah, maybe the German `Ja vol!`?

[19:45](#msg5a7611526117191e61ee3b5f)Or maybe Jawohl? Have to look it up.

toomasv

[19:45](#msg5a761168a3447aac75392185)Yes, jawohl

greggirwin

[19:45](#msg5a761173ce68c3bc743f0c7b)@BillDStrong yes, so... @toomasv TALK ABOUT YOUR CODE!! :^)

toomasv

[19:46](#msg5a761182a3447aac753921cd)Bla-bla - bla..

greggirwin

[19:46](#msg5a7611b26117191e61ee3cf0)Hmmm, stubborn this one is.

toomasv

[19:47](#msg5a7611d16117191e61ee3d9c)First, I write some code... then I get lot of crashes. Then I cry... And then I rewrite the code ..

greggirwin

[19:48](#msg5a7611fc6117191e61ee3eec)LOL! Ah, I wasn't expecting that.

[19:48](#msg5a76120b98927d5745733b5e)Finally, someone uses the same methodology I do.

toomasv

[19:49](#msg5a76123036de78850ce8c08b):hatching\_chick: :chicken:

[19:56](#msg5a7613dc98927d57457342b3)I wrote once about my basic method when @9214 asked about it, but I don't remember in what room was it. Basically it is adhoc try-fail-try-again. Reflect. After some time write down some structure. Rewrite the code. New ideas. Try-fail.. again. Succeed. Puti it up somwhere. Screw it again . Restore. Go on. Go on. Get up. Fall. Get up. Go on...

9214

[19:57](#msg5a76143e4a6b0dd32b8588ba)for some reason \[`Autechre - Cap.IV`](https://www.youtube.com/watch?v=1qkMYxt4XYs) started playing in my head

toomasv

[19:59](#msg5a7614a44a6b0dd32b858a7d)With reason..

## Sunday 4th February, 2018

PeterWAWood

[23:16](#msg5a7794496117191e61f48ae5)@endo64 Thanks for compiling the script with the `-u` option. It looks as though it is bug under macOS or when the source is not in a sub-drectory of red.

[23:33](#msg5a77984ee217167e2c40fc51)I have updated to the latest master version of Red and can now compile but get a runtime crash.

[23:47](#msg5a779b7bb3c4a0d376dea33c)#3219

## Tuesday 6th February, 2018

9214

[18:25](#msg5a79f3237084124a3443b9b9)nitpicking, but changing element in a block affects new-line markers

```
>> b: new-line/all [1 2 3] on
== [
    1 
    2 
    3
]
>> parse b [some [change quote 2 42 | skip]]
== true
>> b
== [
    1 42 
    3
]
>> b: new-line/all [1 2 3] on
== [
    1 
    2 
    3
]
>> change at b 2 42
== [
    3
]
>> b
== [
    1 42 
    3
]
```

worth a ticket?

endo64

[19:17](#msg5a79ff607084124a34440621)But how would it work with `/part` and `/dup` refinements?

```
>> head change at new-line/all b: [1 2 3] true 2 4
== [
    1 4
    3
]

>> head change/dup at new-line/all b: [1 2 3] true 2 4 5
== [
    1 4 4 4 4 4
]
```

9214

[19:18](#msg5a79ff9da3447aac754d4c0e)@endo64 good question

## Wednesday 7th February, 2018

greggirwin

[03:05](#msg5a7a6cfe7dcd63481f295284)@9214, I think this has come up before, and would be a great thing to doc. Also, good thought @endo64.

## Monday 12nd February, 2018

PeterWAWood

[03:25](#msg5a810946e217167e2c710bda)Is this a "Rebol3" improvement or a bug?

```
>> load ["a"]
*** Script Error: load does not allow block! for its source argument
*** Where: load
*** Stack: load
```

greggirwin

[06:25](#msg5a81335518f388e6269069f2)R3 doesn't error for me.

meijeru

[09:27](#msg5a815e1918f388e626914e69)If you look at the docstring for `load` a block is specifically excluded. I think this is worth a wish. Implementation would not seem to be too onerous...

greggirwin

[17:28](#msg5a81cec7ce68c3bc7478c5cb)What is the exact behavior of `load` on a block in Rebol? That is, if you already have a block, what does it do? Also, R3 behaves differently than R2. No error on this in R2, just no eval:

```
>> load [1 + 1]
** Script error: -apply- does not allow integer! for its source argument
** Where: apply map-each case load
** Near: apply :load [:item header all type ftype]
```

[17:30](#msg5a81cf2ce217167e2c753cf9)We could say it's a no-op, but what's the point then?

## Tuesday 13th February, 2018

9214

[14:04](#msg5a82f0604a6b0dd32bc63cb5)why this doesn't work?

```
>> digit: charset [#"0" - #"9"]
== make bitset! #{000000000000FFC0}
>> rule: [collect into test some [keep digit | skip]]
== [collect into test some [keep digit | skip]]
>> test: ""
== ""
>> input: "ab13de412f"
== "ab13de412f"
>> probe also test parse input rule
"13412"
== "13412"
>> input: extract/into input 1 []
== [#"a" #"b" #"1" #"3" #"d" #"e" #"4" #"1" #"2" #"f"]
>> probe also clear test parse input rule
""
```

I expect `digit` to match as usual and `collect into` to `keep` matched characters into `test` string

[14:05](#msg5a82f0afe217167e2c7b6f20)

```
text
>> rule: [collect into test some [keep skip]]
== [collect into test some [keep skip]]
>> probe also test parse input rule
"ab13de412f"
== "ab13de412f"
```

rebolek

[14:08](#msg5a82f155f283b8e5465738b4)`probe also clear test parse input rule` &lt;- `clear test`?

9214

[14:08](#msg5a82f1674a6b0dd32bc64387)@rebolek to clear it after the first match

[14:08](#msg5a82f1704a6b0dd32bc64575)it doesn't work without `clear` either

rebolek

[14:09](#msg5a82f18db3c4a0d3761972b0)Right, I see.

[14:09](#msg5a82f1a97084124a34705c1c)

```
>> parse [#"1"] [digit]
== false
```

9214

[14:10](#msg5a82f1cab3c4a0d376197525)

```
text
>> parse ["1"][digit]
== false
>> parse "1" [digit]
== true
```

:confused:

rebolek

[14:10](#msg5a82f1d8f283b8e546573c13)bitsets are for string parsing only

9214

[14:11](#msg5a82f1f618f388e6269a3eea)so I should rather construct `[ #"0" | #"1" | ... | #"9"]` equivalent by myself?

rebolek

[14:11](#msg5a82f20218f388e6269a3f17)

```
>> parse ["1"] [into [digit]]
== true
```

9214

[14:11](#msg5a82f20993be87284db01fd9)@rebolek oh, right

rebolek

[14:11](#msg5a82f218e217167e2c7b7860)but that does not work with `char!`, of course

9214

[14:19](#msg5a82f3d6b3c4a0d376198512)interesting, it seems that `into` allows to parse `vector!`(although you can't match by datatype inside it)

```
>> parse reduce [make vector! [1 2 3]][into [skip x: (probe x)]]
make vector! [2 3]
== false
```

but you can't parse `vector!` directly

rebolek

[14:21](#msg5a82f45d8c71e5e01d8d5e53)You can't have different datatypes in vector, so it doesn't make sense to parse by type there.

9214

[14:21](#msg5a82f471d74ee9f50dbbf655)@rebolek no, I meant that `into [3 integer!]` will fail

rebolek

[14:22](#msg5a82f4afd74ee9f50dbbf842)of course, they are not `integer!`s

9214

[14:23](#msg5a82f4c818f388e6269a5203)really?

```
>> type? first make vector! [1 2 3]
== integer!
```

rebolek

[14:23](#msg5a82f4f3f283b8e5465753c4)it's complicated ;)

9214

[14:24](#msg5a82f52e4a6b0dd32bc65ff1)whatever, I wonder if this is a bug or a feature

rebolek

[14:25](#msg5a82f54ab3c4a0d37619906b)Hard to say. I think it's more feature than bug,

greggirwin

[19:19](#msg5a833a5af283b8e546593ea1)To match by type, the values have to be Red values in a block type. Vectors aren't block types, but currently inherit from series (indirectly, via string), which calls back into the vector type to get values (e.g. with `first`), and marshals values. At least that's what it looks like to me.

## Monday 19th February, 2018

9214

[08:15](#msg5a8a87b66fba1a703a6ef437)should overflow be catched in `pair!`s?

```
>> 123123123123x123123123123
== -2147483648x-2147483648
```

rebolek

[08:19](#msg5a8a88748f1c77ef3a26abec)Certainly.

9214

[08:21](#msg5a8a8910888332ee3aa127c1)and should there be option for `vector!` to represent only unsigned integers?

```
>> make vector! [integer! 8 1 [127]]
== make vector! [integer! 8 [127]]
>> make vector! [integer! 8 1 [128]]
== make vector! [integer! 8 [-128]]
```

rebolek

[08:22](#msg5a8a894ca2194eb80d8242b6)There was in R3, so I think it should be supported in Red also.

9214

[08:34](#msg5a8a8c2ee4ff28713a983009):sunglasses: https://github.com/red/red/issues/3228 https://github.com/red/red/issues/3229

greggirwin

[19:55](#msg5a8b2bae888332ee3aa598b3)+1

## Monday 26th February, 2018

toomasv

[19:06](#msg5a945a9ec3c5f8b90d0b2211)DRAW `push` is not "pushing" `line-width`. Is this a bug or intentional?

```
view [box 300x300 draw [
   line-width 1 push [
      line-width 10 pen red line 65x75 187x166
   ] line 109x37 244x140
]]
```

!\[lines](http://vooglaid.ee/red/lines1.png)

greggirwin

[19:07](#msg5a945add888332ee3ad553a8)@qtxie would have to say.

toomasv

[19:08](#msg5a945b20458cbde557ced528)OK

## Tuesday 27th February, 2018

qtxie

[02:51](#msg5a94c79ae4ff28713acf792f)@toomasv Not decided. Different platforms have different `pushing` rules. I'll write a proposal before implement it.

toomasv

[04:08](#msg5a94d9d9e4ff28713acfce2b)@qtxie OK, thanks!

Zamlox

[04:16](#msg5a94dba7888332ee3ad82d6f)@toomasv neither of them :) The API function in Windows responsible for this behavior saves only "transformations, clipping region, and quality settings". Perhaps

```
line-width
```

does not fall into "quality settings" category and that's why it is not saved. Which means custom logic must be implemented to achieve this.

toomasv

[04:21](#msg5a94dcad8f1c77ef3a5d997b)@Zamlox I implemented it already, but restoring line-width after push block \*\*and\** then moving the push block together with restored line-width can cause unexpected changes in view. It would make sense if all the ("formatting") commands were pushed.

Zamlox

[04:26](#msg5a94de05c3c5f8b90d0dfe5e)@toomasv true and I agree with you. But unfortunately this feature is not provided by that API function, which means it should be designed and implemented.

toomasv

[04:27](#msg5a94de2a458cbde557d1be14)OK, have to live with it for now. :)

[08:09](#msg5a951237458cbde557d2c807)With `line-join` and `line-cap` there is different problem: pushing these doesn't restore default values after the push-block is closed, but does restore the values that were explicitly declared before the push-block:

```
view/no-wait [
   box 260x70 draw [
      line-width 10 push [
         line-join round line-cap round pen red 
         line 10x10 100x10 10x50 100x50
      ] line 140x10 230x10 140x50 230x50
]]

view [
   box 260x70 draw [
      line-join miter line-cap square line-width 10 push [
         line-join round line-cap round pen red 
         line 10x10 100x10 10x50 100x50
      ] line 140x10 230x10 140x50 230x50
]]
```

!\[line-join\_line-cap](http://vooglaid.ee/red/join-cap1.png)

greggirwin

[16:29](#msg5a9587800202dc012e90a9eb)Your future ticket tokens are adding up @toomasv. :^)

toomasv

[16:30](#msg5a95879c0202dc012e90aa61)Namm!

rebolek

[16:46](#msg5a958b81c3c5f8b90d11f345)The future will be wonderful. Unfortunately we are living in present ;)

9214

[16:47](#msg5a958b93e4d1c63604a00f69)hmm, @rebolek in `bugs` room

[16:47](#msg5a958b96888332ee3adc2380)talks about present

[16:47](#msg5a958b9de4ff28713ad3d319)PROTECT YOUR BEARS :bear:

rebolek

[17:01](#msg5a958ee8e4ff28713ad3ea54)MEBIR is past, present and hopefully not future.

[17:04](#msg5a958f928f1c77ef3a61bebd)@9214 there's lot of present bugs I haven't reported just because I found some workaround. Fortunately, things can be fine in different ways.

[17:04](#msg5a958fa935dd17022eff4e35)fine=done, sorry, phone

## Wednesday 28th February, 2018

Oldes

[13:08](#msg5a96a9df6fba1a703aaff465)What is better result? In Red:

```
>> type? probe load {git@github.com:red/red.git}
[git@github.com :red/red.git]
== block!
```

in Rebol:

```
>> type? probe load {git@github.com:red/red.git}
git@github.com:red/red.git
== url!
```

rgchris

[18:26](#msg5a96f4466fba1a703ab1a355)IMO: first is bad—I think the lack of explicit space between values is likely to lead to bugs (\*the exception being block delimters `()[]`), the second—while kindof correct (it is intended as a path to a resource) it doesn't conform to the \[URI spec](https://tools.ietf.org/html/rfc3986#section-3). Am a wee bit surprised it wasn't recognised as an \[EMAIL!](https://tools.ietf.org/html/rfc2822#section-3.4.1)

Oldes

[19:23](#msg5a9701a8e4d1c63604a7a285)If the \_git_ thing is not a valid uri.. I wonder who invented it. Now it is in common use, I believe.

rgchris

[19:52](#msg5a970864758c233504d038cc)It's not Git, it's an SSH scheme I believe.

[19:53](#msg5a9708d06fba1a703ab215f2)I want to say you could just add ssh:// to it, but then you can have shorthand versions based on your config settings.

greggirwin

[22:32](#msg5a972e07888332ee3ae460e7)Red seems more correct in this case. It could flag it as invalid instead. Making it a url! goes against the spec, as @rgchris said, but maybe we need to formalize that in the context of the RFC, and IPv6. The vFuture part of the spec will be harder, as it uses square brackets.

## Thursday 1st March, 2018

rgchris

[00:35](#msg5a974ac56fba1a703ab34d59)@greggirwin I think the first case is precisely the argument against implied space between 'values'. \[Again: IMO] should be a syntax error.

[00:36](#msg5a974af46fba1a703ab34de2)... before recognizing as two values.

## Monday 5th March, 2018

rebolek

[16:05](#msg5a9d6ad0e4d1c63604c4d30e)I thought this was fixed already :(

```
>> write/info http://www.red-lang.org [POST [a: b]]

*** Runtime Error 1: access violation
*** at: 0806D54Dh
```

[16:07](#msg5a9d6b3e888332ee3a0088d9)https://github.com/red/red/issues/2469

## Tuesday 6th March, 2018

greggirwin

[01:06](#msg5a9de997e4ff28713aface69)Maybe fixed only on MacOS, since that was the initial report?

## Wednesday 7th March, 2018

toomasv

[15:48](#msg5aa009c535dd17022e31030e)Panel does not support alpha-channel:

```
view [base red at 10x10 panel transparent]
```

shows only black panel. Bug?

9214

[16:53](#msg5aa018f6888332ee3a0e05c3)@toomasv IIRC it was reported some time back

toomasv

[17:00](#msg5aa01aa0458cbde5570892c1)OK, thanks.

greggirwin

[18:00](#msg5aa028ac888332ee3a0e6ac8)This one? https://github.com/red/red/issues/1823

I didn't find another in a quick search.

toomasv

[20:47](#msg5aa04fe535dd17022e32b21f)Not quite same, but maybe connected?

## Thursday 8th March, 2018

9214

[06:13](#msg5aa0d48c458cbde5570c2472)@toomasv just in case, I think you should leave a comment under this issue, with snippet example

toomasv

[07:23](#msg5aa0e4e235dd17022e3531bd)@9214 OK, added to https://github.com/red/red/issues/1823

endo64

[10:51](#msg5aa115b56fba1a703ae14046)I have faced a very interesting bug on R2, fortunately it's not in Red (and R3):  
See the output of `enbase` for a long text in base 16:

```
>> first enbase/base "loooooooooooooooong text" 16
== #"6"
>> first enbase/base "looooooooooooooooooooooooooooooong text" 16
== #"^/"   ; where this newline comes from??!
```

maximvl

[14:47](#msg5aa14d09e4d1c63604d86deb)`random/seed` seem to not work on wine:

```
>> random/seed now/precise
>> random 10
== 3
>> random 10
== 7
>> random 10
== 5
>> random 10
== 5
>> random 10
== 3
>> random 10
== 6
>> random/seed now/precise
>> random/seed now/precise
>> random 10
== 3
>> random 10
== 7
>> random 10
== 5
>> random 10
== 5
>> random 10
== 3
>> random 10
== 6
>> random/seed now/precise
>> random 10
== 3
>> random 10
== 7
>> random 10
== 5
>> random 10
== 5
>> random/seed now
>> random 10
== 3
>> random 10
== 7
>> random 10
== 5
>> random 10
== 5
>> random 10
== 3
>> random 10
== 6
```

[14:49](#msg5aa14d686fba1a703ae283a5)same on linux actually

9214

[14:50](#msg5aa14db6458cbde5570e94e3)@maximvl

```
>> random/seed now
>> collect [loop 5 [keep random 10]]
== [9 8 4 2 2]
>> random/seed now
>> collect [loop 5 [keep random 10]]
== [9 8 4 2 2]
>> random/seed now/time
>> collect [loop 5 [keep random 10]]
== [4 8 8 2 8]
>> random/seed now/time
>> collect [loop 5 [keep random 10]]
== [10 1 5 8 6]
```

maximvl

[14:51](#msg5aa14de2c3c5f8b90d4ae0f0)@9214 yeah, `now/time` works, thanks

[14:51](#msg5aa14dee6fba1a703ae28790)still strange that others don't

9214

[14:54](#msg5aa14e9a0a1614b712f8429e)@maximvl it's not a bug, but a feature, useful to test something on random input and then reproduce it with same seed

maximvl

[14:54](#msg5aa14eaf53c1dbb743bb7116)`now/precise` can't give you the same seed

rebolek

[15:01](#msg5aa15055458cbde5570ea405)@maximvl I agree, it looks like a bug to me.

9214

[15:04](#msg5aa151066fba1a703ae29b79)maybe `random` uses only part of the returned date

greggirwin

[22:56](#msg5aa1bfb1e4d1c63604dada58)@endo64, enbased strings can contain whitespace, which we normally only see in large base-64 values, so it's a matter of R2 molding it that way. Certainly something to trip over.

[23:15](#msg5aa1c3fd6f8b4b994605b80e)`Random` for `time!` inherits from `float!`, which casts to integer:  
https://github.com/red/red/blob/master/runtime/datatypes/float.reds#L508

`Random` for `date!` does, indeed, use only the `/date` part it seems:  
https://github.com/red/red/blob/master/runtime/datatypes/date.reds#L664  
https://github.com/red/red/blob/master/runtime/datatypes/date.reds#L666

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

Which suffers the same fate, as it just passes `date!` seeds through. You can avoid that by `form`ing them first of course.

I think it would be good to open a ticket or PR for this. There may be a reason Red does what it does, and that reason may be R2 compatibility. If nobody can come up with a good reason to keep it that way, the PoLS tells me to use the `/time` part as well.

## Sunday 11st March, 2018

9214

[11:15](#msg5aa50fb4f3f6d24c686051c0)should `cause-error` reduce `args` block?

```
>> cause-error 'script 'no-arg [foo bar]
*** Script Error: foo has no value
*** Where: reduce
*** Stack: cause-error  

>> cause-error 'script 'no-arg ['foo 'bar]
*** Script Error: foo is missing its bar argument
*** Where: do
*** Stack: cause-error
```

endo64

[12:15](#msg5aa51dd627c509a7744d31ab)Is this a known issue or worth reporting? `set object none` breaks `on-change*`

```
>> o: object [a: 1 on-change*: func [w o n] []]
>> set o none
*** Script Error: invalid argument: none
>> o/a: 2
*** Script Error: invalid argument: none

>> body-of o
== [a: 2 on-change*: none]
```

9214

[12:18](#msg5aa51e8f458cbde5571f465e)@endo64 possibly https://github.com/red/red/issues/2919#issuecomment-317246798 ?

endo64

[12:25](#msg5aa5204ff3f6d24c6860922f)@9214 I think yes, Doc says: "The object event API is a work in progress, so all the possible checks for valid definitions are not yet implemented." there, so no need another issue, but I will add comment for using `set` function.

9214

[12:26](#msg5aa5206053c1dbb743cba8b0)@endo64 thanks!

greggirwin

[20:24](#msg5aa590970a1614b7120a80e1):point\_up: \[March 11, 2018 5:15 AM](https://gitter.im/red/bugs?at=5aa50fb4f3f6d24c686051c0) @9214, your mission, should you choose to accept it, is to write a wiki page, or section we can add to official docs, on `cause-error`. It seems to trip us all up at some point. So find examples of how it's used in the current source, explain it, maybe write a helper to wrap it, and ask @dockimbel to review.

## Monday 12nd March, 2018

9214

[05:56](#msg5aa61692e4d1c63604ec74d6)

```
text
>> rejoin [<abc> <def>]
== <abc<def>>
```

I expected single tag :confused:

meijeru

[07:22](#msg5aa62ad36f8b4b9946180057)Rebol does the same! on the other hand, `rejoin [ "def"]` does the trick.

[07:24](#msg5aa62b14f3f6d24c6864c8c4)Your expected result makes more sense, despite incompatibility with Rebol, so perhaps an issue?

9214

[07:24](#msg5aa62b378f1c77ef3aae02dc)@meijeru I'd wait for Gregg's or Doc's response.

greggirwin

[08:19](#msg5aa63828e4d1c63604ed0ec6)It boils down to what `form` on a `tag!` should return. Tags are a bit tricky, because their "user friendly" form includes the brackets, yes? Otherwise you'd get this:

```
>> rejoin [<abc> <def>]
== "abcdef"
```

Or implicitly use `mold` on tags when appending only to tags. This has come up in the past, and Carl added 'ajoin' to Rebol, though I never cared for it much. Rebol also has `build-tag`. I think the reason is wasn't changed is because the alternatives aren't clearly better, just different. Worth a REP, though, if someone wants to propose improved behavior.

meijeru

[09:01](#msg5aa641ede4ff28713a209f8c)Another solution is for append to use `to-string` instead of `form` on the items it appends, since `to-string` is `"abc"` ; this seems to be the only exception to `to-string` and `form` being equivalent.

9214

[09:35](#msg5aa649dfe4ff28713a20cc2d)@greggirwin `cause-error` is on my list :guardsman:

[19:33](#msg5aa6d61535dd17022e4fb68c)

```
text
>> ? wait
...
     value        [number! time! block! none!] 

REFINEMENTS:
     /all         => Returns all in a block.

>> wait [1 2 3]
*** Script Error: invalid argument: [1 2 3]
*** Where: wait
*** Stack:  

>> wait none
*** Script Error: invalid argument: none
*** Where: wait
*** Stack:
```

[19:34](#msg5aa6d6420a1614b71210c0b1)I'm not sure what `wait` should do with block or `none`, also have no idea about `/all` refinement.

DideC

[19:54](#msg5aa6dae10a1614b71210da92)Wait for I/O to see `wait` on block. Then, it can be used to wait on some port! or a timeout.  
For `/all`, I guess the sentence is wrong, see Rebol version:

```
>> help wait
USAGE:
    WAIT value /all

DESCRIPTION:
     Waits for a duration, port, or both.
     WAIT is a native value.

ARGUMENTS:
     value -- (Type: number time port block none)

REFINEMENTS:
     /all -- Returns all events in a block
```

9214

[19:54](#msg5aa6db0a35dd17022e4fd165)@DideC yes, I thought it has something to do with I/O and parallelism, thanks!

[19:55](#msg5aa6db2b27c509a774555b0d)yup, misspelling in a docstring, `events` is missing.

[19:56](#msg5aa6db616f8b4b99461c04c7)Can someone do a quickfix, since I'm going to bed?

rebolek

[19:59](#msg5aa6dc1553c1dbb743d3ee4b)we know, it's getting late in @#$%^&amp;\*().

9214

[20:00](#msg5aa6dc46458cbde55727b640)@rebolek I didn't know that you speak J :)

[20:00](#msg5aa6dc5de4ff28713a2443f7)a very strange tacit recursive verb you have here

rebolek

[20:00](#msg5aa6dc6835dd17022e4fd779)@9214 It's J? I though it's perfect Perl ;)

[20:01](#msg5aa6dc85e4d1c63604f0cbce)or, god forgive me, ...regex...

9214

[20:01](#msg5aa6dca6458cbde55727b8d9)well yeah, though it's syntactically incorrect, `@` conjunction misses leftmost noun for a start, and parens are empty

rebolek

[20:02](#msg5aa6dcc30a1614b71210e32f):)

9214

[20:09](#msg5aa6de7ac3c5f8b90d63b35b)@rebolek I'll investigate your gibberish talk tomorrow, perhaps it's hivemind that speaks through you... :bee:

[20:13](#msg5aa6df5ee4ff28713a24540c)ah, nope, it's not recursive, `$` is Shape/Shape of

greggirwin

[21:23](#msg5aa6efc9e4ff28713a24ae50)@9214 :point\_up: \[March 12, 2018 1:54 PM](https://gitter.im/red/bugs?at=5aa6db0a35dd17022e4fd165) Doc string updated.

## Wednesday 14th March, 2018

lepinekong\_twitter

[18:00](#msg5aa9633d8f1c77ef3abe9be4)Something really weird with call:  
This function which wrap "git status" works on Windows 10 as expected within the context of dozens of script I load whereas It doesn't have any logical dependency with them

```
app.git:  function['.commands [word! string! unset!] /repo .repo [url!] /local ][
    switch/default type?/word get/any '.commands [
        unset! [
            print "TODO: HELP"
        ]
        word! string! [
            commands: form .commands
            out: copy ""
            call/wait/output {powershell -Command "git status"} out
            print out
        ]
    ] [
        throw-error 'script 'expect-arg varName
    ]
]
git: :app.git
```

proof below:  
https://i.snag.gy/ahDvdf.jpg

but in the pure Red Console it doesnt because out always return ""

```
out: copy ""
            call/wait/output {powershell -Command "git status"} out
            print out
```

that's not logical at all ;)

9214

[18:04](#msg5aa9641a35dd17022e5c9296)what is not logical is using `wait`, which makes command wait for exit, and then expecting it to produce output to stdout

lepinekong\_twitter

[18:05](#msg5aa9647b53c1dbb743e09e67)I added wait to test if it could work with as it doesn't without.

9214

[18:15](#msg5aa966b9a60157d62fe8ed8b)@lepinekong\_twitter how long does it take for command to complete?

lepinekong\_twitter

[18:41](#msg5aa96cf28f1c77ef3abed8e3)@9214 ~1 second

9214

[18:46](#msg5aa96e18e4d1c63604fd8931)have you checked the content of `out` after one second?

lepinekong\_twitter

[19:58](#msg5aa97ed98f1c77ef3abf317e)@9214 ok good idea . Now it works in naked console when I have nothing to commit. I'll try again when I'll some stuffs to commit.

## Thursday 15th March, 2018

toomasv

[09:31](#msg5aaa3d8f35dd17022e6049c5)What's that?:

```
>> pts: [1 2 3] forall pts [probe reduce [index? pts pts/(index? pts)]]
[1 1]
[2 3]
[3 none]
```

What did I miss?

maximvl

[09:45](#msg5aaa40c635dd17022e605c89)@toomasv `forall` moves the index, so on the second run `pts` is `[2 3]` and you are accessing element number `2` which is `3`

[09:45](#msg5aaa40d6f3f6d24c687924d8)on last run `pts` is `[3]` and you are trying to get third element of it ;)

toomasv

[09:46](#msg5aaa40f58f1c77ef3ac270a4)@maximvl Ahh, thanks!

maximvl

[09:46](#msg5aaa40fee4d1c63604011af8)in short with `forall` you should use `pts/1` for the current element

lepinekong\_twitter

[10:19](#msg5aaa489ee4d1c6360401424f)system/options/home is correct with rebol whereas it returns none with red with this same test:  
test.bat

```
@echo off
start "system/options/home returns none on windows" /D "c:\windows" "C:\rebol\red.exe" "c:\rebol\test.red" %1
```

test.red

```
Red []

probe rejoin ["system/options/home: " system/options/home]
probe rejoin ["system/options/path:" system/options/path]
ask "..."
```

Expected result:

```
"system/options/home: /c/windows/"
"system/options/path:/c/rebol/"
...
```

Actual result:

```
"system/options/home: none"
"system/options/path:/c/rebol/"
...
```

greggirwin

[22:15](#msg5aaaf08bc3c5f8b90d785354)@toomasv, it can help sometimes to include the series you're iterating over:

```
>> pts: [1 2 3] forall pts [probe reduce [pts  index? pts  pts/(index? pts)]]
[[1 2 3] 1 1]
[[2 3] 2 3]
[[3] 3 none]
== [[3] 3 none]
```

[22:18](#msg5aaaf11ae4d1c6360404d1d9)@lepinekong\_twitter, please file a ticket for that so we can decide if it should be supported, or the compatibility placeholder removed.

## Friday 16th March, 2018

toomasv

[03:58](#msg5aab41018f1c77ef3ac745ab)@greggirwin Yes, thanks! Actually I've used `forall` many times, but had a memory block in my head for some reason yesterday :)

greggirwin

[05:13](#msg5aab5279f3f6d24c687e3876)I have blocks in my memory all the time. ;^)

9214

[10:11](#msg5aab9851e4ff28713a3ba720):sweat:

```
url: https://api.github.com/repos/red/red/contributors
read/info url []
```

```
*** Runtime Error 1: access violation
*** at: 080A0211h
```

DideC

[10:23](#msg5aab9b3a27c509a7746c265e)@9214 Here (Win10) :

```
>> url: https://api.github.com/repos/red/red/contributors
== https://api.github.com/repos/red/red/contributors
>> read url
== {[^{"login":"dockimbel","id":411393,"avatar_url":"https://avatars1.githubusercon
>> read/info url
== [200 #(
    Cache-Control: "public, max-age=60, s-maxage=60"
    Date: "Fri, 1...
```

9214

[10:25](#msg5aab9b998f1c77ef3ac8dd0e)@DideC how can you use `read/info` with one argument if it requires two?

[10:28](#msg5aab9c36bb1018b37aee8ab6)okay, now what? :confused:

```
do-thru https://raw.githubusercontent.com/rebolek/red-tools/master/json.red
```

```
*** Runtime Error 1: access violation
*** at: 080A0211h
```

DideC

[10:29](#msg5aab9c83f3f6d24c687f90fe)@9214 Wich second argument ?

```
>> help read
USAGE:
     READ source

DESCRIPTION: 
     Reads from a file, URL, or other port. 
     READ is an action! value.

ARGUMENTS:
     source       [file! url!] 

REFINEMENTS:
     /part        => Partial read a given number of units (source relative).
        length       [number!] 
     /seek        => Read from a specific position (source relative).
        index        [number!] 
     /binary      => Preserves contents exactly.
     /lines       => Convert to block of strings.
     /info        => 
     /as          => Read with the specified encoding, default is 'UTF-8.
        encoding     [word!]
```

[10:30](#msg5aab9ca8c3c5f8b90d7b15b6)What build / OS do you use ?

9214

[10:30](#msg5aab9cb2a60157d62ff35828)@DideC ah, sorry, I mixed it up with `write/info`

[10:30](#msg5aab9cc36f8b4b994632fa79)which actually works

DideC

[10:30](#msg5aab9ccae4d1c63604078ff0)It's what I start wondering ;-)

lepinekong\_twitter

[21:46](#msg5aac3b3b6f8b4b9946364b88):point\_up: \[March 14, 2018 7:00 PM](https://gitter.im/red/bugs?at=5aa9633d8f1c77ef3abe9be4)

How can I wait for the value of out ? I tried this but it never gets out of the loop if out already returns "":

```
until [
                do-events/no-wait
                out <> ""
            ]
            print out
```

## Sunday 18th March, 2018

nedzadarek

[16:25](#msg5aae92e0458cbde5574b27ae)This works fine:

```
parse "" [any ""]
; == true
```

but with non-0-length string it will halt the console:

```
parse "str" [any ""]
```

[16:25](#msg5aae92f9a60157d62fff3b0e)Red for Windows version 0.6.3 built 9-Mar-2018/0:05:59+01:00 on Win 8.1

9214

[16:25](#msg5aae9312a60157d62fff3b8e)@nedzadarek it's an infinite loop for me, as it should be.

nedzadarek

[16:28](#msg5aae9391fa066c532543b019)@9214 in both cases?  
It shouldn't be the infinite loop - `any` should take 0 or more. I'm not sure how it cases infinite loop.

9214

[16:28](#msg5aae93b227c509a774780026)@nedzadarek in the first case series is already at the end, so `parse` just returns `true`.

[16:29](#msg5aae93d027c509a774780094)In the second it'll stuck with matching an empty string at the very beginning.

nedzadarek

[17:01](#msg5aae9b4d5f188ccc15cccc82)@9214 but shouldn't it much just one empty string?

9214

[17:01](#msg5aae9b72e4d1c63604137ea2)@nedzadarek can you tell me how many empty string are there?

nedzadarek

[17:01](#msg5aae9b78c3c5f8b90d8733c7)1?

9214

[17:01](#msg5aae9b825f188ccc15cccd1e)Why not 1 million?

nedzadarek

[17:02](#msg5aae9bad5f188ccc15cccdd6)because `length? str < 1000000`

9214

[17:03](#msg5aae9bef5f188ccc15ccced7)And now you're applying `length?` to `logic!`.

nedzadarek

[17:04](#msg5aae9c2e6f8b4b99463ed8ad)We are dealing with abstract terms (so we can define them differently) but... is there case(s) when the 2nd example is helpful (matching more empty strings)?

9214

[17:05](#msg5aae9c63c3c5f8b90d8736b0)Doesn't make sense to match an empty string using repetition (`while`, `any` and `some`), since it will make `parse` stuck in an infinite loop.

[17:06](#msg5aae9c7b27c509a774782423)@dockimbel have you implemented some checks for that? :point\_up:

## Monday 19th March, 2018

dockimbel

[02:37](#msg5aaf2252bb1018b37afc9e4a)@9214 No specific checks.

[02:38](#msg5aaf228bc3c5f8b90d895063)@nedzadarek You created an infinite loop, because `any` can match the empty string against the input an infinite number of time without reaching the input end.

## Wednesday 21st March, 2018

greggirwin

[00:10](#msg5ab1a2f135dd17022e818442)@nedzadarek

```
>> parse "" [end]
== true
```

But there are some subtleties here we should outline with regard to matching and advancing. e.g.,

```
>> parse "str" [any pos: ""]
== false
```

nedzadarek

[14:07](#msg5ab267175f188ccc15dee1d1)@dockimbel @greggirwin interesting  
Too bad we can `Esc` in such cases.

## Thursday 22nd March, 2018

9214

[09:27](#msg5ab37703a60157d62f16abef)@dockimbel  
https://github.com/red/red/blob/master/lexer.r#L879  
;)

dockimbel

[09:57](#msg5ab37e13a60157d62f16cfc1)@9214 Leftover from a debugging session...you can send a PR to fix that. ;-)

9214

[10:00](#msg5ab37ea3bb1018b37a1198a5):baby:

## Saturday 24th March, 2018

lepinekong\_twitter

[07:24](#msg5ab5fd30458cbde5576df531)read-clipboard bug: doubling blank lines. Quite annoying.

ne1uno

[07:56](#msg5ab604a2e3d0b1ff2c60dbe4)not seeing any doubling in win7 recent builds

9214

[09:12](#msg5ab6167027c509a7749abac4)@lepinekong\_twitter are you sure this isn't PEBKAC?

[09:12](#msg5ab61692e4ff28713a6af512)Because I checked it the first time you reported and haven't found any doubled blank lines.

toomasv

[09:13](#msg5ab616d0458cbde5576e4020)Seems to be regression -- in following `check`'s value does not change on clicking. Tried in console built on March 23rd (W10).

```
view [check [probe face/data]]
```

In build of March 17th this workes correctly.

9214

[09:15](#msg5ab61722458cbde5576e40c3)@toomasv https://github.com/red/red/issues/3264 related?

toomasv

[09:16](#msg5ab6176227c509a7749abd61)Not sure. But may be something was changed that affected the normal behaviour?

9214

[09:16](#msg5ab6177cc3c5f8b90daa8fb8)@toomasv file a ticket anyway, good catch :+1:

toomasv

[09:16](#msg5ab617835f188ccc15ef4681)OK

[09:30](#msg5ab61aaac3c5f8b90daa99c8)Not sure if this is bug, but seems strange: Why are three events generated on `change` to `true`:

```
>> view [style r: radio [probe reduce [face/text face/data]] r "r1" r "r2"]
["r1" true]
["r1" true]
["r1" true]
["r1" false]
["r2" true]
["r2" true]
["r2" true]
```

9214

[09:32](#msg5ab61b21458cbde5576e4d50)@toomasv same here.

toomasv

[09:32](#msg5ab61b4835dd17022e95902b)What do you think, let's wait comments?

9214

[09:33](#msg5ab61b74f3f6d24c68ae3d56)Yes, I think maybe it's a leftover from https://github.com/red/red/issues/3264

[09:33](#msg5ab61b80fa066c532566b15c)@toomasv can you leave a comment there?

toomasv

[09:34](#msg5ab61b8bf3f6d24c68ae3dd3)OK

9214

[14:44](#msg5ab6646bc574b1aa3e2a15ab)@dockimbel looks like your patch in `environment/console/input.red` misses `terminate` field in `system/console` context. I checked from REPL, and it's set to an empty block, so I changed patch to the following:

```
unless system/console [
    system/console: context [
        history: make block! 200
        size: 0x0
        terminate: []           ; <--
    ]
]
```

also tried to include this file and compile `ask` - everything works fine. Should I make a PR with this fix?

## Sunday 25th March, 2018

dockimbel

[04:22](#msg5ab723fd458cbde55771f24a)@9214 Which patch?

9214

[04:39](#msg5ab72806e4ff28713a6ebf9b)@dockimbel https://github.com/red/red/blob/master/environment/console/input.red#L17

[04:45](#msg5ab72953e3d0b1ff2c64df88)technically, it isn't fully yours :confused:  
https://github.com/red/red/blame/master/environment/console/input.red

[04:52](#msg5ab72b01458cbde55772085c)Per `ask` compilation:  
https://github.com/red/red/wiki/Guru-Meditations#how-to-compile-ask

dockimbel

[07:01](#msg5ab7492fe3d0b1ff2c653de0)@9214 Okay for the PR, will let @qtxie review it.

qtxie

[09:45](#msg5ab76fd635dd17022e9a0315)@9214 Thanks. There is a better fix for it. ;-) I'm pushing it.

9214

[09:46](#msg5ab76fe3fa066c53256b636d)@qtxie :+1:

## Monday 26th March, 2018

ne1uno

[07:13](#msg5ab89dacc574b1aa3e32175f)view \[check "check" \[probe face/data]] no output at all now?

toomasv

[07:14](#msg5ab89dc3bb1018b37a261eb1)I made just a comment about this on #3279

ne1uno

[07:23](#msg5ab89ff1458cbde557775a9e)maybe ??? could pull up the bug report

rebolek

[11:29](#msg5ab8d99ec574b1aa3e3347ae)@qtxie @dockimbel When you compile latest version (`2c0c05e0`) on Linux, it crashes right after executing console. Works fine on Windows, I don't know about macOS.

[11:37](#msg5ab8db5dc4d0ae8007010300)So it seems that the regression is caused by `2b9e6`, that's first version that crashes, `5f9c4` works fine.

x8x

[11:39](#msg5ab8dbd93fe1be3704ca2834)@rebolek fine on macOS, confirmed crash on Linux `2c0c05e0`

rebolek

[11:39](#msg5ab8dc07bb1018b37a2755fc)@x8x thanks for report.

lepinekong\_twitter

[14:58](#msg5ab90a9e7c3a01610d7742e6):point\_up: \[March 24, 2018 10:12 AM](https://gitter.im/red/bugs?at=5ab6167027c509a7749abac4) made a mistake: double blank problem is not with Read-Clipboard but Write-Clipboard

nedzadarek

[15:03](#msg5ab90bdee3d0b1ff2c6c6729)@lepinekong\_twitter you mean this:

```
>>  write-clipboard "foo f^/f"
; == true
read-clipboard
; == "foo f^M^/f"
```

?  
Ah `^M` is new line and `^/` is carriage return - on windows it's just one symbol/code.

lepinekong\_twitter

[16:08](#msg5ab91ae9e3d0b1ff2c6cbfd9)@nedzadarek what I do is

```
test: read-clipboard
write-clipboard test
```

[16:09](#msg5ab91b3dc4d0ae8007026eee)@nedzadarek so if I do copy the two lines above, on Windows I'd get

```
test: read-clipboard

write-clipboard test
```

9214

[17:29](#msg5ab92e135f188ccc15fb7186)

```
text
>> read-clipboard
== "test: read-clipboard^M^/write-clipboard test"
>> print read-clipboard
test: read-clipboard
write-clipboard test
```

nedzadarek

[23:00](#msg5ab97b9e7c3a01610d7979c8)@lepinekong\_twitter it seems that `write-clipboard` just insert `^M` for every `^/` :

[23:01](#msg5ab97bb727c509a774a816f2)

```
write-clipboard "test: read-clipboard^M^M^/write-clipboard test"
read-clipboard
; == "test: read-clipboard^M^M^M^/write-clipboard test"
```

[23:20](#msg5ab98024c574b1aa3e36bd0c)Can someone test it:

```
monkey: make object! [
        hp: 100 
        eat: func [] [
             print "tasty"
             return "done"
        ]
]
monkey/('hp)
; == 100
h: monkey/('hp)
; == 100
h
; == 100
a: monkey/('eat)
; tasty
; == eat
a
; == eat
a: (monkey/('eat))
; tasty
; == "done"
; a
; == "done"
```

https://github.com/red/red/issues/2181

[23:21](#msg5ab98060c574b1aa3e36bdac)

```
about
Red for Windows version 0.6.3 built 26-Mar-2018/1:14:22+02:00
```

## Tuesday 27th March, 2018

greggirwin

[00:45](#msg5ab99445c4d0ae800704ba28)

```
>> monkey: make object! [
[            hp: 100 
[            eat: func [] [
[                 print "tasty"
[                 return "done"
[            ]
[    ]
== make object! [
    hp: 100
    eat: func [][
        print "tasty" 
        return "done"
    ]
]
>> monkey/('hp)
== 100
>> h: monkey/('hp)
== 100
>> h
== 100
>> a: monkey/('eat)
tasty
== eat
>> type? :a
== word!
>> a: (monkey/('eat))
tasty
== "done"
```

endo64

[07:35](#msg5ab9f454e3d0b1ff2c706626)@nedzadarek Exact same result with yours. `Red for Windows version 0.6.3 built 27-Mar-2018/10:27:44+03:00` Win10 x64.

nedzadarek

[10:41](#msg5aba1fe72b9dfdbc3a288044)Thank you. So it seems certain sequence causes that bug.

ne1uno

[16:18](#msg5aba6ec4bb1018b37a2ef726)v064 red-console grabs focus when you start view code then won't output any print or probe until you click back to the console. this seems like a bug, view should keep the focus like the v063 gui console

## Wednesday 28th March, 2018

endo64

[08:56](#msg5abb58b15f188ccc150558b3)\[!\[image.png](https://files.gitter.im/red/bugs/NR3a/thumb/image.png)](https://files.gitter.im/red/bugs/NR3a/image.png)

[08:56](#msg5abb58c85f188ccc15055949)I just compiled the latest version and open the GUI console, I was reading the blog post, after a while I saw that there is an error on the console, I didn't understand how that happened because I didn't write anything on the console. I'm on Win10 x64.

[08:57](#msg5abb58e4458cbde557845508)I opened another GUI console and waiting now to see if that happens again.

rebolek

[08:57](#msg5abb58ed2b9dfdbc3a2e443a)Interesting, I will try on Wine.

endo64

[08:57](#msg5abb590f5f188ccc15055be6)aha! It happens when I open the "About" window from the File menü.

[08:58](#msg5abb592527c509a774b063c0)So I didn't write anything but did something that my brain deletes completely :)

[08:58](#msg5abb5943c4d0ae80070ce3d6)And I don't see Red logo on about window

[08:58](#msg5abb5949c4d0ae80070ce3eb)\[!\[image.png](https://files.gitter.im/red/bugs/M8My/thumb/image.png)](https://files.gitter.im/red/bugs/M8My/image.png)

[08:59](#msg5abb595e27c509a774b0658a)@qtxie &amp; @dockimbel ^^

rebolek

[09:00](#msg5abb59a45f188ccc15055df0)@endo64 I don't have the error message on Wine, but can't see logo also.

9214

[09:01](#msg5abb59ee35dd17022eab19ca)Possible regression related to https://github.com/red/red/issues/3267 ?

ne1uno

[09:01](#msg5abb59f627c509a774b069ab)there was an crasher opening the about reported and fixed last week? I just tried with a recent build not getting an error or a crash

endo64

[09:05](#msg5abb5ae1e3d0b1ff2c77114d)@9214 Could be.

[09:07](#msg5abb5b372b9dfdbc3a2e4e7e)My mockup designer application is also crashing with `*** View Error: CreateWindowEx failed!` error now, but I should examine detailed to see what's wrong there.

9214

[09:07](#msg5abb5b51e4ff28713a80e5b4)\*sniff-sniff\*... :bear: smell.

endo64

[09:07](#msg5abb5b602b9dfdbc3a2e4f18)It happens just after creating a face, appending to win/pane, and `show`

9214

[09:08](#msg5abb5b7d27c509a774b07099)@rebolek the true evil has many faces :point\_up:

endo64

[09:08](#msg5abb5b89458cbde5578461dd)But my `face` has also some `draw` blocks, so I don't know which part causes the crash.

ne1uno

[09:09](#msg5abb5bbb2b9dfdbc3a2e5085)might be merge related? travis failed build

rebolek

[09:09](#msg5abb5bdfe4ff28713a80e823)@9214 but this is View bug, so is it really ME :bear: IR related?

9214

[09:10](#msg5abb5bfc5f188ccc1505694f)@rebolek let's say that :bear: got a View on life and things in general

rebolek

[09:10](#msg5abb5c10c4d0ae80070cf2bc):)

9214

[09:10](#msg5abb5c107c3a01610d81dd8b) and figured out what to do next

rebolek

[09:11](#msg5abb5c302b9dfdbc3a2e528c)I'm looking for day when the :bear: will finally die

9214

[09:11](#msg5abb5c4935dd17022eab24f9)@rebolek the :bear: is in our hearts, young padawan

[09:11](#msg5abb5c4fc574b1aa3e3f32d2)and between our monitors and chairs

[09:12](#msg5abb5c815f188ccc15056b80)it came to our world with us, and will leave it as we step away into nothing :wine\_glass: :book:

rebolek

[09:14](#msg5abb5d05458cbde557846aa0)just get rid of it already

9214

[09:15](#msg5abb5d2f2b9dfdbc3a2e5a4d)I talk to it, but it doesn't cooperate.

rebolek

[09:15](#msg5abb5d4c2b9dfdbc3a2e5b0c)go back to your cave, :bear: ! Nobody likes you!

[09:17](#msg5abb5dbf7c3a01610d81e42d)

```
>> 🐻
*** Script Error: 🐻 has no value
```

[09:18](#msg5abb5dcdbb1018b37a33113f)see?

[09:18](#msg5abb5dd6e4ff28713a80f08b)you have no value!

9214

[09:19](#msg5abb5e15458cbde557846f1d)No, it means that :bear: is `unset`ting.

ne1uno

[09:20](#msg5abb5e69f3f6d24c68c43685)still not seeing a problem just built on win7

[09:33](#msg5abb618127c509a774b0916b)new red-console also works ok so far

[09:35](#msg5abb61d8e4ff28713a8105d1)\*still has that focus problem reported above though.

rebolek

[09:39](#msg5abb62bf7c3a01610d81fadb)@ne1uno you're able to run red-console?

ne1uno

[09:39](#msg5abb62dd27c509a774b098f3)from merged in master just built. seems ok

[09:40](#msg5abb6316c574b1aa3e3f5158)script run from run menu keeps focus on the view code. little different than if called from commandline

rebolek

[09:42](#msg5abb637e27c509a774b09bed)On wine, I got

```
*** Runtime Error 003a:err:seh:raise_exception Unhandled exception code c0000005 flags 0 addr 0x41cd9a
```

ne1uno

[09:54](#msg5abb6661e3d0b1ff2c774bb4)I can crash red-console opening a red script twice, starts the script then goes unresponsive and the windows crash resolver kicks in, which I have firewall blocked so hangs

[09:55](#msg5abb669a27c509a774b0ab20)never saw the run menu before so it might be an old bug or related to multiple view

toomasv

[10:16](#msg5abb6b8335dd17022eab7438)Console works fine on my W10

dockimbel

[10:22](#msg5abb6ce35f188ccc1505b6f6)@ne1uno  
&gt; I can crash red-console opening a red script twice, starts the script then goes unresponsive and the windows crash resolver kicks in, which I have firewall blocked so hangs

Which Red script?

ne1uno

[10:33](#msg5abb6f70458cbde55784be58)@dockimbel I'll see if I can simplify, it doesn't happen with every script

rebolek

[11:15](#msg5abb7935458cbde55784f021)Wow...

```
>> cd %../temp
*** Access Error: cannot open: %/home/sony/Code/updater../temp/
```

ne1uno

[13:07](#msg5abb9382f3f6d24c68c53af4)@dockimbel `ih: load %any.jpg` then in a view `ix: image ih` no crash first time, no crash using png

[13:08](#msg5abb93c7c4d0ae80070e17e2)total fluke I happened to pick that script to try and run a second time

[13:09](#msg5abb93f8c4d0ae80070e18de)many scripts have some conflict and refuse to run a second time or just run without problems

[16:21](#msg5abbc10a27c509a774b295a7)could be a known problem, only `png` officially supported? I didn't see any open or closed tickets

meijeru

[18:47](#msg5abbe3407c3a01610d84a4fd)Four formats actually supported:

```
>> extract system/codecs 2
== [png jpeg bmp gif]
```

endo64

[21:52](#msg5abc0eae270d7d37086cebb5)When I execute by double clicking `build.r` on Win10 x64, it writes "cleaning files" and hangs forever.  
I use R2.7.8.3.1, could find 2.7.6 so couldn't test with that. Also tested with 2.7.7, same result.  
But if I execute build script from my text editor (it uses `rebol.exe -s`) then it works

[21:53](#msg5abc0ef0270d7d37086cec5c)Weird enough, I open a rebol.exe window with `-s` flag and `do %build.r`, hangs again.

greggirwin

[22:37](#msg5abc193e458cbde557881db1):point\_up: \[March 28, 2018 5:15 AM](https://gitter.im/red/bugs?at=5abb7935458cbde55784f021) I don't get the strange path here. Are you on a very recent pull?

[22:38](#msg5abc1977e3d0b1ff2c7af24c)@endo64, I can send you 2.7.6 if needed. There are known `call` issues in 2.7.8, but the hangs should be inconsistent in that case.

## Thursday 29th March, 2018

ne1uno

[00:14](#msg5abc2fdf27c509a774b4a6b3)this is v2.7.6 http://static.red-lang.org/build/rebview.exe

[00:15](#msg5abc3016c574b1aa3e437d8d)another piece to the puzzle. I've never been able to run the tests reliably

[01:01](#msg5abc3ace7c3a01610d86115c)tests still random hangs.

PeterWAWood

[04:55](#msg5abc71d0c4d0ae80071212b0)Rebol seems to randomly hang when running all the tests on Windows/10.

dockimbel

[09:04](#msg5abcac17458cbde5578a6c4f)@PeterWAWood Could you please try different combinations with 2.7.6/2.7.8 using native `call` or the custom one we provide?

rebolek

[13:12](#msg5abce62592f5d62057720b34)I was trying to build console and got:

```
Compiling to native code...
*** Loading Error: file access error: %wcwidth.reds 
*** in file: %/home/sony/Code/red/environment/console/CLI/console.red 
*** at line: 546
```

[13:18](#msg5abce7a25f188ccc150cab96)I'm able to build gui-console, but that one still crashes on Wine:

```
*** Runtime Error 0009:err:seh:raise_exception Unhandled exception code c0000005 flags 0 addr 0x41cda9
```

dockimbel

[13:51](#msg5abcef47bb1018b37a3a7a6b)@rebolek I am not sure we can support Wine anymore in the new GUI console, though you can still compile the old GUI console (it's in %environment/console/GUI/old/gui-console.red now).

9214

[13:51](#msg5abcef6b7c3a01610d89257f)That's unfortunate :(

dockimbel

[13:52](#msg5abcefb192f5d62057724363)Wine is lagging behind too much, it's XP-level IIRC.

rebolek

[13:58](#msg5abcf1125f188ccc150cdf64)I'm not sure what version they target, but Wine 3.0 supports Direct3D 10 and 11 which is definitely not XP-level technology.

[14:31](#msg5abcf8afe3d0b1ff2c7ec44b)Console compiles fine again.

ne1uno

[14:59](#msg5abcff65c4d0ae800714e0d3)this will prevent anyone using wine trying nightlies any more, or get surprise bugs if they do?

rebolek

[15:03](#msg5abd002de4ff28713a88cf39)This happens very rarely, as far as I can say. Directory structure changed and that something that doesn't happen very often.

9214

[16:55](#msg5abd1a70c574b1aa3e47a129)Anyone else faces problem with permission settings on latest build?

```
isheh@sam ~ $ ~/dev/red/red-063 
Compiling compression library...
Compiling Red console...
sh: 1: /home/isheh/.red/console-2018-3-29-47595: Permission denied
isheh@sam ~ $ chmod +x /home/isheh/.red/console-2018-3-29-47595
isheh@sam ~ $ ~/dev/red/red-063 
--== Red 0.6.3 ==-- 
Type HELP for starting information. 

>>
```

dockimbel

[17:12](#msg5abd1e6a5f188ccc150dd039)@9214 Hmm, there's now an extra file copy in the building process for the CLI console, so that could affect the right flags. If the issue is confirmed, it needs a fix.

toomasv

[18:11](#msg5abd2c3ee4ff28713a89ac19)@dockimbel In today's build (W10)  
\[!\[blob](https://files.gitter.im/red/bugs/V4wA/thumb/blob.png)](https://files.gitter.im/red/bugs/V4wA/blob)

greggirwin

[19:16](#msg5abd3b8a7c3a01610d8a9ee5)Someone in the community may need to champion Wine if they want it supported and the core team can't afford the time for it. Would those who use it consider it more important than GTK, and do we know anyone who might be able to maintain it, if the Foundation could provide an ETH bounty?

9214

[19:17](#msg5abd3bb85f188ccc150e6031)@greggirwin personally, I use Wine as a substitute for GTK backend.

rebolek

[19:19](#msg5abd3c38c574b1aa3e485449)If there's fully working GTK version, I wouldn't care about Wine.

greggirwin

[19:28](#msg5abd3e5227c509a774b9782b)Good to know. If your are both representative samples, GTX seems more important. But maybe we can also bounty Wine to see if someone knows an easy way to keep it working.

ne1uno

[19:34](#msg5abd3fcd7c3a01610d8ab9b1)anyone try wine on android?

endo64

[19:43](#msg5abd41f227c509a774b9879a)&gt; @endo64, I can send you 2.7.6 if needed. There are known `call` issues in 2.7.8, but the hangs should be inconsistent in that case.

Thanks @greggirwin I found 2.7.6 on my work laptop, I pulled the latest source from git, testing with 2.7.8 and 2.7.6 now

greggirwin

[19:45](#msg5abd4243458cbde5578d846d)Cool.

endo64

[19:51](#msg5abd43d25f188ccc150e8621)Ok, the problem is the ultimate `call` bug in 2.7.8, but it didn't happen 1 or 2 weeks ago.

[19:52](#msg5abd43f8e4ff28713a8a1c11)I found that these script hangs the rebol process:

```
;-- Try to get version data from git repository
save git-file do %git-version.r
```

[19:53](#msg5abd442d7c3a01610d8ace4a)inside `git-version.r` file there is `call`, so if we can add `call/show ""` just before `do`ing that file, it works with 2.7.8 too.

greggirwin

[19:54](#msg5abd448c270d7d37087273d4)`/show` is available under 2.7.6 as well, but not earlier versions. There's more to the `call` issue in R2 though, IIRC.

endo64

[19:56](#msg5abd44d8270d7d370872750c)We can check `system/core` inside `git-version.r` (or better in`build.r`) script and if it is 2.7.8 then do `call/show ""`

[19:56](#msg5abd44e25f188ccc150e89d7)Should I make that change and PR?

[19:56](#msg5abd44f1458cbde5578d9477)So it will work with all SDK versions

greggirwin

[19:57](#msg5abd4534270d7d3708727691)If you want, that would be great, so it's there and in a known place to be seen. It \*may* not be merged if @dockimbel or @PeterWAWood jump in with more info.

endo64

[20:12](#msg5abd48b527c509a774b9a784)Ok, opened the issue #3295, fixed and made PR #3296

greggirwin

[20:24](#msg5abd4b7fc574b1aa3e48989f)Thanks!

9214

[20:31](#msg5abd4d2f7c3a01610d8afb5e)@dockimbel permission issue confirmed on MacOS  
https://gitter.im/red/red?at=5abd4ce5270d7d37087299a2

endo64

[21:35](#msg5abd5c1027c509a774ba05c9)Two small things, after executing build.r, `git status` says `deleted: build/git.r` leads the local repo modified.  
Second, inside `tips.red` file there is a line `probe event/key` probes a value to console. &lt;- @qtxie

## Friday 30th March, 2018

dockimbel

[03:02](#msg5abda8aec574b1aa3e49f29e)@x8x ^----

x8x

[03:39](#msg5abdb1737c3a01610d8c5bec)@dockimbel https://github.com/red/red/pull/3293

hiiamboris

[04:30](#msg5abdbd7a2b9dfdbc3a391a54)gui console just crashes on `about` now (:

PeterWAWood

[04:33](#msg5abdbe18270d7d37087435e8)@dockimbel I tried the four combinations of 2.7.6 and 2.7.8 with both with the builtin `call` and the custom one on Win/10.

All hung. Using native `call`, Rebol seems to hang on the first call of `call`. Using custom `call`, Rebol hangs at different times during the test.

(In the past, the tests have occasionally run to completion on Win 10).

I'm not sure when I'll have time to do enough debugging to see if I can isolate the issue with the custom `call`.

dockimbel

[05:17](#msg5abdc8795f188ccc15107723)@PeterWAWood Thanks, interesting results. Now I am wondering if the freezing is not caused by a file lock on one of the temporary output files.

[05:17](#msg5abdc8845f188ccc1510773a)@hiiamboris Platform?

9214

[05:36](#msg5abdcce0e3d0b1ff2c822ec2)@dockimbel am I right that recent builds of GUI console are no longer functional on Wine?

dockimbel

[06:18](#msg5abdd6a492f5d62057760693)@9214 Can't say, we never test on Wine.

[06:21](#msg5abdd77ee4ff28713a8c3a8f)@qtxie Confirmed crashing on `about` function call.

qtxie

[06:59](#msg5abde063bb1018b37a3e6db4)Ok. I thought it's `about` menu in gui-console.

dockimbel

[08:16](#msg5abdf254270d7d37087505f4)@9214 Permission issue should be fixed now.

PeterWAWood

[08:58](#msg5abdfc4cbb1018b37a3eddad)@dockimbel I don't think the freeze is being caused by a locked file. I waited until the tests hung and then ran a PowerShell script that lists locked files. It reported no locked files in the red/quick-test/runnable hierarchy.

dockimbel

[10:21](#msg5abe0f9d27c509a774bca236)@PeterWAWood Then I have no clue what is causing it. ;-)

[10:23](#msg5abe1026458cbde5579098ef)For the `about` crash, it's caused by the compiled code for `to-UTC-date` function (the function's code is fine). Issue is caused by the internal tracking of object's owner for immediate! values. It relies on a global state that is not properly reset somewhere between the interpreted and compiled code evaluations.

PeterWAWood

[11:45](#msg5abe23697c3a01610d8e197f)@dockimbel I'll try to do some debugging when I get time.

endo64

[11:46](#msg5abe23a327c509a774bcf952)`ls` (and `list-dir` obviously) prints only dots `...` (in all window sizes) and prints very slowly. But `print read %file.txt` prints very fast.

[11:47](#msg5abe23bbe4ff28713a8d7bbe)\[!\[LS.gif](https://files.gitter.im/red/bugs/cR0j/thumb/LS.gif)](https://files.gitter.im/red/bugs/cR0j/LS.gif)

[11:48](#msg5abe2417270d7d370875dcb6)And this happens only on GUI console, not in CLI.

9214

[14:02](#msg5abe436d27c509a774bd8e33)@dockimbel it's just that latest build insta-crashes on Wine, I can't even launch REPL

meijeru

[14:33](#msg5abe4a9fbb1018b37a40439f)@endo64 I can confirm the `ls` bug. Worth reporting an issue.

dockimbel

[15:05](#msg5abe524692f5d62057783730)@qtxie Could we disable the latest R/S code for filling `system/platform` for WinXP? I guess that's the cause of crashing on start under Wine.

qtxie

[15:40](#msg5abe5a72270d7d370876f6cf)I use the same code in view to get system info, should work on WinXP. I'll have a look at it tomorrow.

Phryxe

[17:04](#msg5abe6e06bb1018b37a40f9a5)The color picker in Options - Settings... doesn't work for me. Win 10 and `Red 0.6.3 for Windows built 30-Mar-2018/16:55:45 commit #be7ff3a9`.

endo64

[22:09](#msg5abeb59d27c509a774bfb0f3)@Phryxe I confirm that color picker in Settings window doesn't work. Win10 x64.

[22:11](#msg5abeb601bb1018b37a424061)Another small issue, font color switches to black after changing font. When you open Settings window and click on ok, then colors comes back.

[22:12](#msg5abeb642bb1018b37a42412c)Github link is not clickable on Help &gt; About window, while red-lang.org is clickable.

[22:13](#msg5abeb670bb1018b37a4241fe)@qtxie Can you check above 3 points?

[22:31](#msg5abebab77c3a01610d90ce83)@meijeru Done. #3298

## Saturday 31st March, 2018

qtxie

[02:02](#msg5abeec4dc4d0ae80071d2cc4)@9214 The new console cannot be run on WinXP and Wine. We'll build the old gui console for those platforms in the next commits.

[02:30](#msg5abef2db270d7d3708796b6c)@endo64 Yes. Thanks for testing.

9214

[07:43](#msg5abf3c37bb1018b37a43fa13)@qtxie thanks!

## Monday 2nd April, 2018

meijeru

[14:40](#msg5ac240f97c3a01610d9d084c)@endo64 Help&gt;About issue is reported by me as #3306, with link to #3300

BeardPower

[15:15](#msg5ac248f55f188ccc1521400f)The font values do not change when clicking on the color boxes.

[15:15](#msg5ac249051130fe3d36935533)Is this already reported?

Phryxe

[18:27](#msg5ac2760ec4d0ae80072a2ebd)@BeardPower Do you mean this -&gt; https://github.com/red/red/issues/3307 ?

BeardPower

[18:53](#msg5ac27c1a92f5d62057879fdc)@Phryxe Yes! Thanks!

ne1uno

[22:16](#msg5ac2aba52b9dfdbc3a4bdd92)red ignores everything before a valid Red header...

[22:17](#msg5ac2ac0692f5d620578876db)comment {} doesn't completely protect against some constructs. but it's not going to be effective at all ahead of a Red header

[22:20](#msg5ac2ac97c574b1aa3e5d68d0)you start off with Red so it's going to try and parse a header

[22:20](#msg5ac2acafe4ff28713a9ed2fa)maybe it's a bug or a known limitation

lepinekong\_twitter

[22:20](#msg5ac2acb01130fe3d369544eb)@ne1uno it's not Red it's Redlang

[22:21](#msg5ac2acec7c3a01610d9f16ac)@ne1uno it's a bug compared to Rebol behavior.

[22:22](#msg5ac2ad0c1130fe3d36954625)And it's very annoying.

[22:23](#msg5ac2ad7527c509a774ce5dfe)I'd even say It's SUPER ANNOYING in my case :smile:

ne1uno

[22:24](#msg5ac2ad96e3d0b1ff2c94d5e1)put a unicode nospace after R maybe

[22:24](#msg5ac2adb05f188ccc15233132)but then you would have to have the right encoding on the file too

[22:27](#msg5ac2ae6ce4ff28713a9ed863)add a keyword and make your instructions part of the header

lepinekong\_twitter

[22:33](#msg5ac2af9cc4d0ae80072b389c)@ne1uno things are getting worst : it doesn't execute at all if I don't leave Redlang :-1:

[22:39](#msg5ac2b1271130fe3d369558ef)@ne1uno have to remove everything before header until fixed.

ne1uno

[22:39](#msg5ac2b13c270d7d37088718fe)you already have non aschii, °. could it be an encoding problem in the file? I always use utf8 bom incase I paste in some non aschii

[22:42](#msg5ac2b1e592f5d62057888f3b)BTW, using the latest I just built it doesn't error

[22:48](#msg5ac2b33ec4d0ae80072b46a9)@lepinekong\_twitter update to latest

lepinekong\_twitter

[23:02](#msg5ac2b6912b9dfdbc3a4c08eb)@ne1uno it's VSCode UTF8 format with Red extension, never exactly know what bom or not bom is ;)

[23:05](#msg5ac2b754e3d0b1ff2c94feed)@ne1uno I tried with latest build, weirdly it compiles with -r -e -t Windows but it doesn't interpret:  
\*\** Syntax Error: invalid value at ", type in Red console: do read"  
\*\** Where: do  
\*\** Stack: do-file expand-directives load

[23:06](#msg5ac2b78ebb1018b37a51095e)I mean the exe works but I cannot do script in red gui console.

[23:07](#msg5ac2b7be1130fe3d369575f6)@ne1uno in the case I remove Redlang. if I don't remove it works.

ne1uno

[23:08](#msg5ac2b7e1bb1018b37a510ae0)I'm not sure if the \_latest is generated after each commit, but your .red worked ok with a v064 from last week ok too

lepinekong\_twitter

[23:10](#msg5ac2b86ae3d0b1ff2c950367)@ne1uno did you remove Redlang ?

ne1uno

[23:11](#msg5ac2b8b4c574b1aa3e5d9d6e)saved from your gist. maybe try that and see if there is something off in vscode encoding?

lepinekong\_twitter

[23:12](#msg5ac2b8dce4ff28713a9f0797)This one is buggy https://gist.githubusercontent.com/lepinekong/034aff9e317d3e8ce575c74d778318cb/raw/37e74284f60e56e3f092fa25fd6e2f446f1a0eae/gistfile1.txt

ne1uno

[23:12](#msg5ac2b8df92f5d6205788aae7)I don't think bom or no bom would matter

lepinekong\_twitter

[23:13](#msg5ac2b902e4ff28713a9f07df)@ne1uno no it's not bom since it works when I have redlang.

ne1uno

[23:14](#msg5ac2b9707c3a01610d9f4607)I'm not seeing a problem with that one either interpreted

[23:15](#msg5ac2b97ae3d0b1ff2c9506fa)I didn't try to compile either one

lepinekong\_twitter

[23:16](#msg5ac2b9d41130fe3d36957d7c)@ne1uno I'm testing again ...

ne1uno

[23:17](#msg5ac2ba07c4d0ae80072b6109)also no problem with \_latest from 3/12

lepinekong\_twitter

[23:19](#msg5ac2ba961130fe3d36958012)@ne1uno I found the error :  
do read %countdown.red is OK  
do %countdown.red is KO

ne1uno

[23:22](#msg5ac2bb231130fe3d3695820e)both work from red-console here

lepinekong\_twitter

[23:22](#msg5ac2bb461130fe3d3695823f)@ne1uno same if I save file from github without using VSCode. Are you on Windows ?

ne1uno

[23:23](#msg5ac2bb57270d7d37088740f9)win7

lepinekong\_twitter

[23:24](#msg5ac2bba2c574b1aa3e5da97c)I'm on Windows 10

[23:24](#msg5ac2bbb7c574b1aa3e5da9bf)Will try on Windows 7 tomorrow on a virtual machine

ne1uno

[23:24](#msg5ac2bbb7e4ff28713a9f10d3)maybe someone on win10 can try

[23:24](#msg5ac2bbcb92f5d6205788b56e)maybe it's a char page thing

lepinekong\_twitter

[23:25](#msg5ac2bbeb5f188ccc1523643f)char page thing too technical for me :smile:

[23:38](#msg5ac2bee3bb1018b37a5123f7)@ne1uno but even with do read it creates Redlang variable and so pollute global system.

ne1uno

[23:39](#msg5ac2bf267c3a01610d9f5b00)that does seem like a bug

lepinekong\_twitter

[23:40](#msg5ac2bf615f188ccc15236fa2)@ne1uno seem only are you british ;)

PeterWAWood

[23:40](#msg5ac2bf7e27c509a774cea474)@qtxie When you enter code into the GUI console on macOS, the console history is hidden when you start typing. The result of the evaluation is also hidden. You have to manually scroll up to see the results:

[23:41](#msg5ac2bf8c27c509a774cea527)\[Red Console macOS.mp4](https://files.gitter.im/red/bugs/w1bI/Red-Console-macOS.mp4)

[23:42](#msg5ac2bfd87c3a01610d9f5ce3)Should I raise an issue?

ne1uno

[23:43](#msg5ac2c011e4ff28713a9f1f63)@lepinekong_ it may be a known behavior of `do`, I don't know for sure if it's a bug

lepinekong\_twitter

[23:44](#msg5ac2c05e5f188ccc15237358)@ne1uno for me it's a bug known or not, polluting a global namespace is a no-no :)

ne1uno

[23:47](#msg5ac2c1087c3a01610d9f61c9)@lepinekong_ when run from commandline redlang has no value

lepinekong\_twitter

[23:49](#msg5ac2c17ac574b1aa3e5dbc72)@ne1uno what do you mean from commandline ? whatever I have a whole system which depends on Red Console.

ne1uno

[23:50](#msg5ac2c1bc92f5d6205788c6aa)when you pass the filename on commandline, I guess there is some other process that runs code

lepinekong\_twitter

[23:53](#msg5ac2c2701130fe3d36959df7)@ne1uno weird.

## Tuesday 3th April, 2018

lepinekong\_twitter

[00:06](#msg5ac2c596e3d0b1ff2c953390)@ne1uno with do read I can mitigate with comment (but with comment but I'll have to explain to people that it won't work with just do)

ne1uno

[00:24](#msg5ac2c9c47c3a01610d9f7f63)I think the run menu command in the new red-console also uses `do`

[00:34](#msg5ac2cc1c27c509a774ced021)it injects do %file into history

qtxie

[01:11](#msg5ac2d4cac4d0ae80072bc945)@PeterWAWood There is an regression causes many issues, please wait until it is fixed.

PeterWAWood

[03:12](#msg5ac2f130e4ff28713a9fc786)@qtxie Will do.

9214

[03:24](#msg5ac2f3f3e3d0b1ff2c95d945)regression in https://doc.red-lang.org/en/reactivity.html#\_dynamic\_relations

[03:25](#msg5ac2f40d2b9dfdbc3a4cd30d)\[!\[bug.gif](https://files.gitter.im/red/bugs/afmv/thumb/bug.gif)](https://files.gitter.im/red/bugs/afmv/bug.gif)

greggirwin

[06:00](#msg5ac318935f188ccc1524aafb)@9214, what't the problem with that demo?

9214

[06:01](#msg5ac318bc2b9dfdbc3a4d5567)@greggirwin  
https://4.bp.blogspot.com/-qxnBAnPFpKM/V3QqBOUVW2I/AAAAAAAAAMs/TBH3Tw7nIc4urW\_xpn2KywPcGQiUUneFACLcB/s320/react4.gif

greggirwin

[06:01](#msg5ac318be7c3a01610da08f3b)It's not the same as the other `follow` balls demo, so maybe just a bad func name in there.

[06:02](#msg5ac318f1270d7d37088893d6)Different demo. The first one works the same under old releases.

9214

[06:02](#msg5ac318f627c509a774cfdb01)@greggirwin my bad, reporting bugs in the morning is a bad idea :^/

greggirwin

[06:02](#msg5ac318fae3d0b1ff2c9663d4):^)

9214

[06:02](#msg5ac3190ebb1018b37a52609d)Maybe reactivity example should be updated?

greggirwin

[06:03](#msg5ac31945e4ff28713aa05968)I like both demos, so maybe add a comment and rename `follow` in the newer one.

toomasv

[10:13](#msg5ac353b8bb1018b37a537092)Is this reported already? Only first `button` is operative in console of April 1st on W10:

```
view [style btn: button [probe face/text] btn "b1" btn "b2"]
```

\[!\[button-bug](http://vooglaid.ee/red/button-bug.gif)](http://vooglaid.ee/red/button-bug.gif)  
Will someone please confirm!?

[10:18](#msg5ac3550292f5d620578b1bbc)Actually, this seems to be more general problem. Same behavior (or rather absence of it) here:

```
>> view [style btn: check [probe face/text] btn "b1" btn "b2"]
"b1"
"b1"
"b1"
```

Same with `radio` (only fist instance of style reacts), and `field`...

dockimbel

[10:20](#msg5ac355881130fe3d3697ffd1)@toomasv There's seems to be a regression on styles defining event handlers.

toomasv

[10:21](#msg5ac355aee4ff28713aa17920)@dockimbel Should I file a ticket?

dockimbel

[12:34](#msg5ac374ee270d7d37088a5d57)@toomasv You can probably add that case in this ticket https://github.com/red/red/issues/3300, as it's probably the same cause.

toomasv

[12:42](#msg5ac376c62b9dfdbc3a4f2bee)@dockimbel Done

dockimbel

[13:15](#msg5ac37e712b9dfdbc3a4f58c2)Thanks, I should process it tomorrow.

lepinekong\_twitter

[18:03](#msg5ac3c1ed1130fe3d369a53f2):point\_up: \[April 3, 2018 12:13 PM](https://gitter.im/red/bugs?at=5ac353b8bb1018b37a537092) April 1st on W10? I thought it was an April fool :smile:

gltewalt

[20:00](#msg5ac3dd62e3d0b1ff2c9a6218)This seems a little strange. It doesn't recognize lack of whitespace for `/` and `//` correctly?

```
>> #b/#c
*** Script Error: / does not allow issue! for its value1 argument
*** Where: /
*** Stack:

>> #b//#c
*** Script Error: / operator is missing an argument
*** Where: /
*** Stack:
```

[20:01](#msg5ac3dd9d1130fe3d369ae411)Should it be `invalid path!` ?

[20:04](#msg5ac3de367c3a01610da47a2e)

```
>> 'b/#c
*** Syntax Error: invalid path! at "'b/#c"
*** Where: do
*** Stack: load

>> #b/c
== /c
```

nedzadarek

[20:09](#msg5ac3df6792f5d620578e0ba5)@gltewalt shouldn't everything that starts with `#` be `invalid issue!` (if it's invalid of course)?

gltewalt

[20:09](#msg5ac3df7be3d0b1ff2c9a6d65)I would guess that, but it's an assumption

[20:09](#msg5ac3df9392f5d620578e0c31)invalid path or invalid issue. Probably issue

nedzadarek

[20:14](#msg5ac3e08bbb1018b37a566198)btw. it seems that `issue!` is ok with `/` after it: `/: make op! func [a b] [reduce [a b]] #a/#b` or just `refinement!` after it `#a/refinement1` maybe that causes that error

greggirwin

[22:45](#msg5ac403f67c3a01610da5291a)Issue design isn't completely locked down, but issues are word types, and end at special characters.

```
>> reduce [#b/c]
== [#b /c]
>> reduce [#b[c]]
== [#b [c]]
```

And path's literal form doesn't allow all types, though you can create them programmatically.

```
>> to path! [a #b /c]
== a/#b//c
```

## Friday 6th April, 2018

hiiamboris

[07:36](#msg5ac72391c574b1aa3e71769c)

```
>> append/only l: [1] l
== [1 [...]]
>> c: context [x: l]
== make object! [
    x: [1 [...]]
]
>> make c []

*** Runtime Error 19: stack error or overflow
*** at: 0041A38Dh
```

is this a bug?

[07:40](#msg5ac72470270d7d37089ace50)I have them doubly linked lists there where items reference each other, and making an object with a link to that stuff = crash

dockimbel

[07:42](#msg5ac724d427c509a774e26a95)@hiiamboris The binding process does not handle cyclic references well for now. Though, that can be easily improved as we have an internal cyclic references detection system (though that would slow down binding process significantly). You can open a ticket for it.

hiiamboris

[07:43](#msg5ac7250b27c509a774e26bc2)okay

dockimbel

[07:44](#msg5ac72565109bb0433293299f)In Rebol, you get:

```
>> make c []
** Internal error: stack overflow
```

which I think is a good trade-off (catchable error) we can use in Red too.

nedzadarek

[22:17](#msg5ac7f1df92f5d62057a05d8b)I'm doing something wrong here (I have 4GB ram, and that line just took 1GB):

```
form make image! [10x10]
*** Internal Error: not enough memory
*** Where: form
*** Stack:
```

greggirwin

[22:17](#msg5ac7f2122b9dfdbc3a63a140)Definitely looks like a bug to me.

[22:18](#msg5ac7f21ee3d0b1ff2cacebac)Please submit a ticket.

[22:18](#msg5ac7f24a270d7d37089ec369)`to string!` has the same problem.

## Saturday 7th April, 2018

hiiamboris

[11:53](#msg5ac8b11f6d7e07082bcb3ef5)can somebody test this too? I think I'm out of rounds:

```
>> round/to 1.1 1.0
== 1.0
>> round/to 0.9 1.0
== 1.0
>> round/to 0.1 1.0
== 0.0
>> round/to -0.1 1.0
== 0.0
>> round/to -0.9 1.0
== -1.0
>> round/to -1.1 1.0
== -1.0
>> round/to -1.9 1.0
== -2.0
>> round/to -2.1 1.0
== -2.0
>> 
>> round/to 1.1 1
== 1
>> round/to 0.9 1
== 1
>> round/to 0.1 1
== 0
>> round/to -0.1 1
== 0
>> round/to -0.9 1
== 0
>> round/to -1.1 1
== 0
>> round/to -1.9 1
== -1
>> round/to -2.1 1
== -1
```

9214

[12:01](#msg5ac8b313080a385053085c83)@hiiamboris what do you expect?

hiiamboris

[12:02](#msg5ac8b33ae3d0b1ff2caf4564)same as 1.0 but without .0 part

[12:03](#msg5ac8b3aadf3e0fb547b11f10)where I live they round -2.1 to -2

BeardPower

[12:06](#msg5ac8b44927c509a774e8b0ab)I agree, the last 4 are incorrect.

[12:07](#msg5ac8b48e080a3850530860d1)

```
>> round/to 1.9 1
== 2
>> round/to -1.9 1
== -1

>> round/to -2.1 1
== -1
>> round/to 2.1 1
== 2
```

[12:07](#msg5ac8b49d2b9dfdbc3a65fa46)It should be -2.

[12:09](#msg5ac8b4f0df3e0fb547b12326)There is an issue with negative values.

9214

[12:11](#msg5ac8b5645f188ccc153d5f5a)https://github.com/red/red/blob/master/runtime/actions.reds#L629 ?

hiiamboris

[12:14](#msg5ac8b61fdf3e0fb547b12812)what that line is telling us?

BeardPower

[12:31](#msg5ac8ba2c5f188ccc153d72af)That the bug is adding +1 all the time :)

[12:32](#msg5ac8ba43080a385053087716)Instead of -1 for negative numbers.

9214

[12:32](#msg5ac8ba49e3d0b1ff2caf5e1d)That's just a guess, which makes sense if you look at results.

[12:32](#msg5ac8ba6a92f5d62057a2c1a2)`-2.1 + 1 = -1.1`, which then rounds to the nearest multiple of `1` and gives us `-1`.

BeardPower

[12:33](#msg5ac8baabe3d0b1ff2caf5fa4)Yep. I think it's not a guess, but a fact.

[12:34](#msg5ac8baea1130fe3d36b02864)Guessing? NOT on MY LAWN! ;-)

hiiamboris

[12:37](#msg5ac8bb89df3e0fb547b13b85)why not for float 1.0 ?

9214

[12:39](#msg5ac8bc0192f5d62057a2c649)Maybe the difference of `round` actions for `float!` and `integer!`, or consequences of type coercion, or both.

greggirwin

[12:42](#msg5ac8bccb2b9dfdbc3a6617bf)https://github.com/red/red/blob/master/runtime/datatypes/float.reds#L859

[12:44](#msg5ac8bd156d7e07082bcb6782)That's a good find. Please file a ticket @hiiamboris. I should port my old rounding tests from R2.

BeardPower

[12:48](#msg5ac8be10109bb04332997b72)@hiiamboris Because floats use a fractional part of 0.5 for rounding, which integers do not.

[12:49](#msg5ac8be607c3a01610db94d3d)

```
if OPTION?(scale) [
			if TYPE_OF(scale) = TYPE_FLOAT [
				f: as red-float! value
				f/value: as-float num
				f/header: TYPE_FLOAT
				return float/round value as red-float! scale _even? down? half-down? floor? ceil? half-ceil?
			]
			sc: abs scale/value
]
```

[12:50](#msg5ac8beae7c3a01610db94ee4)If the scale is an integer, its using it's absolute value.

greggirwin

[12:53](#msg5ac8bf5d5f188ccc153d871f)If you desperately need rounding, and don't desperately need performance, you can patch in `round` from R2.

```
throw-on-error: func [
    {Evaluates a block, which if it results in an error, throws that error.}
    [throw]
    blk [block!]
][
    if error? set/any 'blk try blk [throw blk]
    get/any 'blk
]

found?: func [
    "Returns TRUE if value is not NONE."
    value
][
    not none? :value
]

abs: :absolute

round: func [
    {Returns the nearest integer. Halves round up (away from zero) by default.}
    [catch]
    n [number! time!] "The value to round"
    /even "Halves round toward even results"
    /down {Round toward zero, ignoring discarded digits. (truncate)}
    /half-down "Halves round toward zero"
    /floor "Round in negative direction"
    /ceiling "Round in positive direction"
    /half-ceiling "Halves round in positive direction"
    /to "Return the nearest multiple of the scale parameter"
    scale [number! time!] "Must be a non-zero value"
    /local m
][
    throw-on-error [
        scale: abs any [scale 1]
        any [number? n scale: make n scale]
        make scale either any [even half-ceiling] [
            m: 0.5 * scale + n
            any [
                all [
                    m = m: m - mod m scale
                    even
                    positive? m - n
                    m - mod m scale + scale
                ]
                m
            ]
        ] [
            any [
                floor
                ceiling
                (ceiling: (found? half-down) xor negative? n down)
                n: add n scale * pick [-0.5 0.5] ceiling
            ]
            either ceiling [n + mod negate n scale] [n - mod n scale]
        ]
    ]
]
```

hiiamboris

[12:56](#msg5ac8c002e3d0b1ff2caf70b2)nah I just needed a simple round-to-integer, already settled upon  
`to-integer x + (0.5 * sign? x)`

BeardPower

[12:58](#msg5ac8c06a5f188ccc153d8b0a)This is the code for float and scale being an integer:

```
if TYPE_OF(scale) = TYPE_INTEGER [
				int: as red-integer! value
				int/value: as-integer dec + 0.5
				int/header: TYPE_INTEGER
				return integer/round value as red-integer! scale _even? down? half-down? floor? ceil? half-ceil?
]
```

[12:58](#msg5ac8c08c270d7d3708a14858)-2.1: 0.5 will be added so it will try to round -1.6

[12:59](#msg5ac8c0b71130fe3d36b03b31)Which will be rounded to -1 from the integer round action.

[13:00](#msg5ac8c10a7c3a01610db956ab)It would need to consider the sign.

[13:01](#msg5ac8c11092f5d62057a2d707)Which it does not.

[13:01](#msg5ac8c13e7c3a01610db95733)-2.1 - 0.5 = -2.6 -&gt; would be rounded correctly to -2.

[13:02](#msg5ac8c162080a385053088ec5)I would suggest to always use absolute values, round them and then re-apply the sign.

hiiamboris

[13:02](#msg5ac8c162e3d0b1ff2caf74b1)makes sense, but why then these do work correctly:

```
>> round/to -10.0 10
== -10
>> round/to -10.0 5
== -10
>> round/to -10.0 2
== -10
```

[13:03](#msg5ac8c18bdf3e0fb547b14ec9)looks like `integer/round` has a bug that compensates for this bug?

BeardPower

[13:03](#msg5ac8c1bd27c509a774e8dfd2)Kind of. I guess it's because of the scale value being higher than 1.

[13:05](#msg5ac8c2127c3a01610db95a1e)It would be the easiest to use absolute values, as the rounding has the same behavior.

[13:05](#msg5ac8c22f92f5d62057a2dac0)For positive and negative values.

[13:07](#msg5ac8c28c080a38505308921f)Or treat the fractional parts as part of a integer value, round and cut off the fractional digits.

[13:08](#msg5ac8c2e0e3d0b1ff2caf79af)The code @greggirwin posted it just doing that: positive? m - n

[13:10](#msg5ac8c32892f5d62057a2de23)Maybe there is a better and performant trick to to rounding.

[13:12](#msg5ac8c3a927c509a774e8e702)Or can we just convert an integer scale to a float scale internally?

[13:12](#msg5ac8c3cb27c509a774e8e74b)We won't need the check, if a scale is an integer or a float.

hiiamboris

[13:13](#msg5ac8c400270d7d3708a154ad)the point of having integer as scale is to return integer result, I think

BeardPower

[13:14](#msg5ac8c425109bb04332999103)Ah, right.

[13:14](#msg5ac8c4512b9dfdbc3a662fb8)We would not have these issues with DEC64, as it can be used as integers and floats :)

[13:15](#msg5ac8c466e3d0b1ff2caf7e55)One type to rule them all.

hiiamboris

[13:25](#msg5ac8c6b4109bb04332999a77)idk looks like it just swaps decimal rounding errors for binary rounding errors

[13:25](#msg5ac8c6ce7c3a01610db96b7c)IEEE defines decimal FP too btw

BeardPower

[13:28](#msg5ac8c78f080a38505308a50c)Yes, which all have their shortcomings.

[13:29](#msg5ac8c7a927c509a774e8f466)They give incorrect results and should have never existed ;-)

[13:30](#msg5ac8c7f0df3e0fb547b16619)DEC64 will round and divide correctly.

[13:32](#msg5ac8c86d92f5d62057a2f2b4)If you need reliable division and rounding, you need a different fractional representation.

[13:32](#msg5ac8c878080a38505308a7b3)That's why COBOL is used in finance.

hiiamboris

[13:35](#msg5ac8c91d1130fe3d36b05b8c)so the fate of the galaxy depends on DEC64? ;)

9214

[13:39](#msg5ac8ca1cdf3e0fb547b16dd0)Cough-cough. Chit-chat?

BeardPower

[13:39](#msg5ac8ca1cdf3e0fb547b16dd2)And The Mill ;-)

[13:40](#msg5ac8ca32270d7d3708a16bdd)Ooops, not again!

[13:40](#msg5ac8ca681130fe3d36b05ea8):blush:

[13:41](#msg5ac8ca807c3a01610db978f4)It was him! I was dragged into it by him! ;-)

9214

[13:42](#msg5ac8caaa109bb0433299a87f)Not on my lawn, and not in my shift. -20 points to Wyckoffindor.

BeardPower

[14:01](#msg5ac8cf30df3e0fb547b180f2)And a bonus for discussing interesting things, while being aware of risking to be penalized: +50 points to Wyckoffindor.

## Sunday 8th April, 2018

StephaneVeneri

[15:56](#msg5aca3b99df3e0fb547b6317f)I tested gui-console on macOs (10.12.6), I detected 2 problems:  
\* 'q' or 'quit' don't work, error message:

```
--== Red 0.6.3 ==-- 
Type HELP for starting information. 

>> q
*** Script Error: _terminate-console has no value
*** Where: do
*** Stack: q
```

\* 'pwd' gives this path by default after launch and not the real path

```
>> pwd
%/
```

I know there are developments going on. Do I create issues?

9214

[15:56](#msg5aca3bca6bbe1d2739c49534)@StephaneVeneri https://github.com/red/red/issues/3313

[15:58](#msg5aca3c19080a3850530d756d)Can't find `pwd`-related ticket though.

StephaneVeneri

[15:59](#msg5aca3c73109bb043329e7690)@9214 I saw this issue but I’m not sure it’s the same problem

greggirwin

[18:24](#msg5aca5e4d27c509a774ee5550)If someone can dupe the error, it's definitely worth reporting. A lot of changes are in progress in the console right now.

StephaneVeneri

[19:58](#msg5aca744f2b9dfdbc3a6bfc0c)There are 2 problems but my message is "a little" incomprehensible. So let me quickly summarize:  
\* "q" or "quit" don't work  
\* "pwd" does not give the current path  
@greggirwin I'll wait for feedback before reporting problems but I have the impression that mac users are not very numerous :-p

greggirwin

[20:00](#msg5aca74c9080a3850530e54c7)There are a few mac users out there, to be sure. We care more about quality than quantity. :^)

StephaneVeneri

[20:03](#msg5aca759b5f188ccc15434b86)I agree with you. :smile:

## Tuesday 10th April, 2018

Oldes

[11:26](#msg5acc9f827c3a01610dc8c3db)Is this expected result?

```
>> trim/tail/with "aa\aa\" "\"
== "aaaa"
```

Rebol3 throws error:

```
>> trim/tail/with "aa\aa\" "\"
** Script error: incompatible or invalid refinements
** Where: trim
** Near: trim/tail/with "aa\aa\" "\"
```

I was expecting to get:

```
"aa\aa"
```

DideC

[12:04](#msg5acca86092f5d62057b22fe5)On R2 /tail and /with can't be used at the same time too (the error message is not as clear as on R3).

rebolek

[12:06](#msg5acca8d71130fe3d36c01e5e)Oldes' expectation makes sense to me.

DideC

[12:10](#msg5acca9b26bbe1d2739cf5b32)trim/with is hungry:

```
>> trim "  aa bb cc "
== "aa bb cc"
>> trim/with "  aa bb cc " #" "
== "aabbcc"
```

[12:11](#msg5acca9f3080a385053180e65)It might be messing with /all:

```
>> trim/all "  aa bb cc "
== "aabbcc"
```

[12:12](#msg5accaa312b9dfdbc3a75b3d6)So, look's like a R2 "bug" that propagate to R3 and Red. What could be the reason @dockimbel ?

[12:20](#msg5accabfb6d7e07082bdb6149)"Find the brake and stop the train" !  
This is by design:

```
...
     /all         => Removes all whitespace.
     /with        => Same as /all, but removes characters in 'str'.
        str          [char! string! binary! integer!]`
```

[12:21](#msg5accac64109bb04332a915b4)I still wonder why /with act like /all? It would have been of value to be able to use one, the other or both.

endo64

[14:02](#msg5accc407df3e0fb547c13707)On Win8.1 x64, new GUI console has some issues, can someone confirm please?  
\* No cursor  
\* No scroll with mouse wheel  
\* Menus don't work

[14:03](#msg5accc433270d7d3708b12472)I just compiled from the latest source code.

ne1uno

[14:50](#msg5acccf38df3e0fb547c17b40)@endo64 win7-64 scroll, cursor &amp; menu works

dockimbel

[16:42](#msg5acce9596bbe1d2739d0c27d)@DideC IIRC, the reason was the too big number of possible combinations with other refinements, which would have resulted in a very big implementation for `trim`. So constraining `/with` to act as `/all` was the trade-off.

DideC

[18:48](#msg5acd06e0109bb04332ab0549)@dockimbel I can understand the reason, hence it lost a usefull feature.

StephaneVeneri

[19:35](#msg5acd12062b9dfdbc3a77f0a7)@endo64 None of these problems on Windows 10

[20:21](#msg5acd1cc5109bb04332ab730e)I created the #3322 issue for the quit function.  
I found #2731 issue which corresponds to the 'pwd' problem, it concerns the console but I don't think it's necessary to create another one for gui-console.

[20:54](#msg5acd248027c509a774fae016)I detected a bug in gui-console on macOs and windows 10:  
\* change the foreground colour (Options -&gt; settings)  
\* go into the "Choose Font" menu  
\* close the dialog (no need to modify)  
The foreground color is back to the original color. If you close gui-console the selected foreground color is nevertheless saved. Can you confirmed ?

nedzadarek

[23:24](#msg5acd47b6270d7d3708b3cbf3)@StephaneVeneri win 8.1 not stable :`Red for Windows version 0.6.3 built 26-Mar-2018/1:14:22+02:00` works fine.

## Wednesday 11st April, 2018

Oldes

[09:24](#msg5acdd43b27c509a774fdafac)@qtxie it looks that GUI console has problems with some unicode strings... like:

```
>> to-binary "🦄"
== #{F09FA68400}
>> to-string to-binary "🦄"
== "🦄^@"
```

Note the null char, which should not be there. It causes other issues, like invalid cursor position when editing the line, copy paste and more.

[09:26](#msg5acdd4b6270d7d3708b5fe9c)Good thing is, that it can display it correctly:)

[09:26](#msg5acdd4bc5f188ccc15526ba7)\[!\[image.png](https://files.gitter.im/red/bugs/BigZ/thumb/image.png)](https://files.gitter.im/red/bugs/BigZ/image.png)

9214

[09:28](#msg5acdd52192f5d62057b7c5af)@Oldes can we define a 🦄 word in the new console?

Oldes

[09:28](#msg5acdd549080a3850531d9772)Not now, because there is the null char. Also the edit of the line with such a char is broken.

rebolek

[09:29](#msg5acdd57b6bbe1d2739d4cbd4)Use old console

[09:29](#msg5acdd593270d7d3708b6029c)

```
>> 🦄: "unicorn"
== "unicorn"
>> 🦄
== "unicorn"
```

9214

[09:30](#msg5acdd5c192f5d62057b7c946)Old console doesn't display them accurately on Wine.

[09:30](#msg5acdd5cf1130fe3d36c5b320)i.e. I have boxes instead of a 🦄

Oldes

[09:30](#msg5acdd5d0df3e0fb547c61528)I think that it is not old/new console, but which OS you use... the Windows one is broken.

rebolek

[09:31](#msg5acdd5d61130fe3d36c5b329)Sorry, I meant CLI console.

[09:31](#msg5acdd5e36d7e07082be0d7f3)@Oldes right, I'm doing this on Linux

dockimbel

[09:34](#msg5acdd6922b9dfdbc3a7b382a)@Oldes Please open a ticket for that.

Oldes

[09:39](#msg5acdd7e8109bb04332ae75a0)I will... it is the input, which is causing problems. Because this is working:

```
>> x: to-word to-string #{F09FA684}
== 🦄
```

[09:45](#msg5acdd92d7c3a01610dce77cd)Done: https://github.com/red/red/issues/3324

toomasv

[10:08](#msg5acddeb91130fe3d36c5e4a2)

```
>> to-string head remove back tail #{F09FA68400}
== "🦄"
```

Oldes

[11:17](#msg5acdeec07c3a01610dcee146)@toomasv as written in the ticket, the problem is with the clipboard.

toomasv

[11:24](#msg5acdf07e6bbe1d2739d5539e)OK, yes:

```
>> to-string #{F09FA684}
== "🦄"
>> write-clipboard to-string #{F09FA684} read-clipboard
== "🦄^@"
```

meijeru

[12:01](#msg5acdf91e27c509a774fe6ae0)I also made a comment, but in the issue itself, before I saw the above discussion.

endo64

[12:52](#msg5ace051f92f5d62057b8b639)@ne1uno @StephaneVeneri Thanks I'll test on some other machines to be sure. But latest master cannot be compiled currently:

```
E:\Git\red\build\bin>red.exe
Compiling Red GUI console...
*** Compilation Error: include file not found: RTD.red
*** in file: C:\ProgramData\Red\GUI\gui-console.red
```

9214

[12:54](#msg5ace05a2109bb04332af6ad0)Bears, Unicorns, Russian Trancing Dans...

ne1uno

[12:55](#msg5ace05bb080a3850531e945e)just did, Red 0.6.3 for Windows built 11-Apr-2018/8:27:27-04:00 commit #cad2c8b

endo64

[12:56](#msg5ace05ea27c509a774feac54)@toomasv also have this issue, see help room.

[12:56](#msg5ace06166bbe1d2739d5c545)Interesting, RTD.red file is there, in modules/view same location with the script that includes it.

9214

[12:57](#msg5ace06207c3a01610dcf5d3a)https://github.com/red/red/commit/cad2c8b9d23c4e714d24f42965b928354affdf8b#diff-a9024e274fd415fac6f746c45927cf71 indeed

endo64

[12:58](#msg5ace06601130fe3d36c6b0c7)Ok, Doc added it just now, @toomasv pull the latest then it compiles.

[13:02](#msg5ace07502b9dfdbc3a7c3baf)Hmm, it gets strange.  
Menus work at first, but when print anything on GUI then menus don't work any more.  
No cursor blinking. And about window gives `*** View Error: CreateWindowEx failed!` again.

Red 0.6.3 for Windows built 11-Apr-2018/15:56:31+03:00 commit #9b085fa

toomasv

[13:03](#msg5ace078d1130fe3d36c6b949) :sparkles:  
\[!\[blob](https://files.gitter.im/red/bugs/RKAH/thumb/blob.png)](https://files.gitter.im/red/bugs/RKAH/blob)

rebolek

[13:04](#msg5ace07f427c509a774feb516)136x43

9214

[13:05](#msg5ace081f92f5d62057b8c92b)@rebolek it's a tiny miracle!

rebolek

[13:06](#msg5ace084827c509a774feb67d):)

toomasv

[13:07](#msg5ace08a55f188ccc15538157)!\[rich-text](http://vooglaid.ee/red/Rich-text.png)

9214

[16:22](#msg5ace3630109bb04332b09374)

```
text
rtd-layout [i "hello" /i]
```

Crashes on Wine (old console). I guess that's expected?

ne1uno

[16:48](#msg5ace3c42080a3850531fbb80)== make object!... in win7

meijeru

[16:58](#msg5ace3ebedf3e0fb547c8455f)@neluno As it should!

greggirwin

[20:17](#msg5ace6d63df3e0fb547c93542)@toomasv gets tokens for the first RTD demo image!

toomasv

[20:18](#msg5ace6d94df3e0fb547c935de):tada:

greggirwin

[20:19](#msg5ace6dbf270d7d3708b92bb0)@DideC, is it worth creating a `trim` mezz that isn't greedy? Seems like it would need more features to be worth it, but maybe is a good example.

meijeru

[20:19](#msg5ace6dd65d7286b43a1bfb3a)What about tokens for finding the first issues? ;-)

greggirwin

[20:19](#msg5ace6de86d7e07082be40757)Sure. We're working on how to keep track of all this. :^)

[20:20](#msg5ace6e0c27c509a77400bf6e)Also, has anyone noticed the new feature, not bug, that console history extends over sessions now?

meijeru

[20:24](#msg5ace6ef05d7286b43a1c00a0)Yeah, I wondered briefly, then more or less dismissed it. But it is there, in console-cfg.red in AppData alright. Very good in this debug stage, when the console sometimes gives up on you, and you can still get to your history on re-start!

endo64

[22:02](#msg5ace85f627c509a7740126a8)Is there any better way than `compose` to get the value inside rich-text? `view compose/deep [rich-text data [i b (txt) /b /i]]`

greggirwin

[22:21](#msg5ace8a76df3e0fb547c9addf)I don't think so at this time.

## Thursday 12nd April, 2018

nedzadarek

[00:02](#msg5acea216080a385053219401)@endo64 Win 8.1`Red 0.6.3 for Windows built 11-Apr-2018/14:56:31+02:00 commit #9b085fa`  
I have similar issues:  
simple stuffs like `view [base red]` - crash  
no cursor/about/printing (like you)  
some reach text examples crashes too  
&gt; Menus work at first, but when print anything on GUI then menus don't work any more.

type `--` &gt; you should have `>> --` on the screen &gt; mark from right to left (reverse might work) from last `-` to `>` (so `--`) &gt; click just below first `-` (from left).  
The above bug happens with other letters but `-` is the easiest to explain.

toomasv

[03:08](#msg5acecdc75f188ccc15571ef1)On Win10 nothing of this happens.

hiiamboris

[07:42](#msg5acf0deb1130fe3d36cb6378)&gt; Also, has anyone noticed the new feature, not bug, that console history extends over sessions now?

yep, it gave me headache of moving the config around so I peeked into it once and saw a history there  
:+1:

[07:44](#msg5acf0e6f5d7286b43a1e5f25)trying to compile:

```
Red [] probe unset? :unknown
```

red -c output:

```
*** Compilation Error: undefined word unknown
*** in file: D:\usr\redjunk\ticket13.red
*** near: [:unknown]
```

this compiler is hopeless so far ):  
is it even worth reporting?

rebolek

[07:45](#msg5acf0ea05d7286b43a1e5faa)@hiiamboris Compiler is much stricter than interpreter

[07:45](#msg5acf0eac5d7286b43a1e5fd2)so it will report things like this on compile time

hiiamboris

[07:46](#msg5acf0ed6df3e0fb547cba9f0)I just wanted to include my script once, not once per #include, so I test it like this

[07:47](#msg5acf0f2c270d7d3708bb8e13)okay hello system/words then..

[07:54](#msg5acf10ad2b9dfdbc3a80e4d7)great now I'm receiving "internal errors" :)

```
*** Red Compiler Internal Error: Script Error : Expected one of: word! - not: path!
*** Where: repend
*** Near:  [proto: get-prefix-func to word! pos/4]
```

rebolek

[07:54](#msg5acf10c22b9dfdbc3a80e5b8)@hiiamboris `Internal error` is worth reporting

hiiamboris

[07:55](#msg5acf10e9080a385053233a55)if only I knew how to reproduce it...

[07:55](#msg5acf10fe7c3a01610dd3eec8)it's a big script...

[08:04](#msg5acf132b1130fe3d36cb7d91)last line is the cause:

```
Red []

f: func [x y] [x + y]
c: context [f: get bind 'f 'system]

op1: make op! :f
op2: make op! :c/f
```

rebolek

[08:18](#msg5acf164b270d7d3708bbb00c):clap:

PeterWAWood

[08:32](#msg5acf19aadf3e0fb547cbe235)@hiiamboris #include only includes a file once.

dockimbel

[08:34](#msg5acf1a2cdf3e0fb547cbe472)@hiiamboris You can also try using `Config: [red-strict-check?: no]` in your main script header.

9214

[08:35](#msg5acf1a3f5d7286b43a1e9ac2)@hiiamboris or encapping mode

[08:38](#msg5acf1af07c3a01610dd41cc4)Shouldn't `system` be `system/words`?

hiiamboris

[08:38](#msg5acf1b0b270d7d3708bbc2d5)@9214 it's a shortcut :)

[08:50](#msg5acf1ddb5f188ccc155879ba)@PeterWAWood agree, with -c it's only once, in interpreted mode though it's again every time...

9214

[08:51](#msg5acf1df4270d7d3708bbd107)@hiiamboris `#include` in interpreter is substituted with `do`.

hiiamboris

[08:51](#msg5acf1e175d7286b43a1eafa8)yeah I know

[08:59](#msg5acf1fe5080a385053238c93)don't you think we need some equivalent of once-only #include in interpreted mode?  
I feel like I'm writing in C sometimes :) with it's #ifdef MONSTER\_H things

dockimbel

[09:35](#msg5acf287b1130fe3d36cbeebc)@hiiamboris  
&gt; don't you think we need some equivalent of once-only #include in interpreted mode?

Yes, that would be an improvement. The straighforward way would be to replace `do` by a custom mezz function that will hold a local cache for previously included file.

hiiamboris

[11:20](#msg5acf4115270d7d3708bc89f5)

```
Red []
c: make reactor! [x: 1]
r: context [ x: is [c/x] ]
dump-reactions
```

as `red script.red`:

```
*** Script Error: append does not allow none! for its series argument
*** Where: append
*** Stack: dump-reactions
```

as `red --cli script.red` (dumps empty action):

```
1:---
  Source: object
   Field: x
  Action:
  Target: x
2:---
  Source: object
   Field: x
  Action:
  Target: x
```

being copy-pasted to the GUI console window (works fine, except for formatting differences):

```
1
:---  Source: object [x]
   Field: x
  Action: [c/x]
  Target: x
2
:---  Source: object [x]
   Field: x
  Action: [c/x]
  Target: x
```

curiously, it works fine in versions ~ march 26 and before (except the stable which has some other bug), and I don't see any difference in `? :dump-reactions` output

9214

[11:22](#msg5acf41756d7e07082be77c2d)@hiiamboris `c` is not a reactive source in your case.

hiiamboris

[11:22](#msg5acf4182270d7d3708bc8d2f)is it not?

[11:24](#msg5acf420b1130fe3d36cc78a6)hmm okay true

9214

[11:25](#msg5acf4213109bb04332b5286b)@hiiamboris no, because it's not a reactor object.

hiiamboris

[11:28](#msg5acf42f05f188ccc155943e2)@9214 I've fixed the message text of :point\_up: \[April 12, 2018 2:20 PM](https://gitter.im/red/bugs?at=5acf4115270d7d3708bc89f5), but the behavior stands

9214

[11:32](#msg5acf43bd6d7e07082be7899a)@hiiamboris wait, you get this error on old builds, right?

hiiamboris

[11:32](#msg5acf43dc5d7286b43a1f760e)no, on the contrary, on newer ones

9214

[11:34](#msg5acf442b080a3850532443d1)Ah, yes, I see.

[11:34](#msg5acf44395f188ccc15594a06)Just reminded me of this one https://github.com/red/red/issues/3046

hiiamboris

[11:34](#msg5acf445d080a3850532444e2)&gt; Just reminded me of this one https://github.com/red/red/issues/3046

that's exactly what I get with the stable :)

greggirwin

[16:09](#msg5acf849f27c509a77405ad64)Has to do with the new GUI console. If you `print` something before dumping reactions, it works. Please file a ticket @hiiamboris. Good catch.

```
Red []
print ""
c: make reactor! [x: 1]
r: context [ x: is [c/x] ]
dump-reactions
```

[16:10](#msg5acf84f41130fe3d36cdfa1c)Looks like the cause may be `prin`. Please note that in the ticket.

hiiamboris

[16:54](#msg5acf8f4c6d7e07082be94c6b)@greggirwin :) looks like you noted that already  
I'm also curious as to why so many reactions (2-3)... perhaps some magical bind deduction going bananas?

greggirwin

[17:05](#msg5acf91ed2b9dfdbc3a839f04)I did, once I saw the ticket.

[17:15](#msg5acf94436bbe1d2739dd3e81) Not magical binding in any way, but `is` calls `react` internally, and I don't remember looking at why it adds 2 relations (one in `is` and one at line 299 in `react`).

## Friday 13th April, 2018

hiiamboris

[11:29](#msg5ad094855f188ccc155f48a2)is `react` within a `reactor!` not working \*by design\*?

```
>> r: make reactor! [x: 1  y: 0  react [y: x * 2]]
== make object! [
    x: 1
    y: 0
]
>> r/y
== 0
>> r/x: 2
== 2
>> r/y
== 0
>> dump-reactions
>> react [r/y: r/x * 3]
== [r/y: r/x * 3]
>> dump-reactions
1
:---  Source: object [x y]
   Field: x
  Action: [r/y: r/x * 3]
>> r/y
== 6
```

[11:38](#msg5ad096a52b9dfdbc3a87fd2d)and also why won't a reactor allow locally defined words as a reaction source?

```
>> r1: make reactor! [x: 1  y: 0  init: does [react [y: x * 2]] ]  r1/init
== none
>> r2: make reactor! [x: 1  y: 0  init: does [react [y: r2/x * 2]] ]  r2/init
== [y: r2/x * 2]
>> ? r1
     on-change*  function!     [word old new /local srs]
     x           integer!      1
     y           integer!      0
     init        function!     []

>> ? r2
     on-change*  function!     [word old new /local srs]
     x           integer!      1
     y           integer!      2
     init        function!     []

>> r1/x: 100
== 100
>> r1/y
== 0
>> dump-reactions
1
:---  Source: object [x y init]
   Field: x
  Action: [y: r2/x * 2]
```

nedzadarek

[13:42](#msg5ad0b3d37c3a01610ddb9abd)@hiiamboris version with `is` works: `r1: make reactor! [x: 1 y: 0 init: is [y: x * 2] ]` but with `react` you need `self/`: `r1: make reactor! [x: 1 y: 0 init: does [react [y: self/x * 2]] ] r1/init`

hiiamboris

[13:43](#msg5ad0b4195d7286b43a26217f)interesting... however `is` has proven itself too buggy for now, so I'm going with self/

[13:49](#msg5ad0b5575f188ccc155fffa6)and more quirks to come....

```
>> r3: make reactor! [a: 1x1  b: none  react [b: self/a * 2]]
== make object! [
    a: 1x1
    b: 2x2
]
>> r3/a: r3/a + 1x1
== 2x2
>> r3/b
== 4x4
>> r3/a/x: 100
== 100
>> r3/b
== 4x4
```

[13:50](#msg5ad0b58c080a3850532af6ea)works with deep-reactor though

[13:50](#msg5ad0b59d1130fe3d36d36fb5)as if pair! was a series!

dockimbel

[15:56](#msg5ad0d32c6d7e07082bef3c58)@hiiamboris `react` is not meant to be used from inside a reactor, that's why it only recognizes paths are possible sources of reactions.

hiiamboris

[16:02](#msg5ad0d47d080a3850532bab9d)@dockimbel why the limitation though? faster this way?

[16:03](#msg5ad0d4d17c3a01610ddc4e58)it's just so convenient to lay out reactions right where their targets are defined

dockimbel

[16:19](#msg5ad0d8801130fe3d36d439dd)@hiiamboris  
&gt; it's just so convenient to lay out reactions right where their targets are defined

That's what `is` is for. ;-)

hiiamboris

[16:19](#msg5ad0d8a427c509a7740bc877)mkay :)

dockimbel

[16:20](#msg5ad0d8b21130fe3d36d43b0e)`r3: make reactor! [a: 1x1 b: is [a * 2]]`

[16:21](#msg5ad0d9105f188ccc1560cabe)`r3/a/x` not reacting is a regression. There's a ticket about a related issue already IIRC... but I can't see it, so maybe better open a new one, so that we don't forget about it.

[16:23](#msg5ad0d9817c3a01610ddc6789)Basically, use `is` for "internal" relations inside a reactor, and `react` for "external" relations (requiring path accessors).

hiiamboris

[16:30](#msg5ad0db206d7e07082bef695a)@dockimbel ok I'll open a new one, and thanks for the tips :+1:  
Meanwhile what \*safety* strategy would you suggest to apply to reactor programming to mostly avoid their bugs? I'm having a hard time... in v0.6.3 stable even `react` often gives me totally insane behavior, not to mention `is`, and in newer versions there's a lot of other things broken

dockimbel

[16:33](#msg5ad0dbbd2b9dfdbc3a897c7c)@hiiamboris Mostly avoid circular relations, I have improved it since 0.6.3, though it can still trip you up. Another thing that can help often, is skipping the initial reaction, with a `/later` refinement (or `react later` in VID).

[16:33](#msg5ad0dbecdf3e0fb547d45e16)I think the best way to debug reactive relations is to have a visual tool, to do them step-by-step. As the reactive framework is entirely written in Red, it should not be very hard to write a GUI for that (and deploy it using the upcoming "console plugin API"). ;-)

greggirwin

[21:27](#msg5ad120de6bbe1d2739e476e3)@hiiamboris, and add notes to https://github.com/red/red/wiki/Reactivity

## Wednesday 18th April, 2018

hiiamboris

[09:37](#msg5ad711c96bbe1d2739fb5fd1)there's quite a mess about keys it seems  
quoting the wiki https://doc.red-lang.org/en/view.html#\_actors  
&gt; The following extra key names can be returned by event/key only for key-down and key-up messages:  
left-control  
right-control  
left-shift  
right-shift  
left-menu  
right-menu

code https://github.com/red/red/blob/408809998130c129ece856d73fba996605d766de/modules/view/backends/platform.red#L367 also defines left/right "alt" and this is indeed what is returned when I press left or right alt keys on windows

in MS docs they call "alt" key a "menu" key instead: https://msdn.microsoft.com/en-us/library/windows/desktop/dd375731%28v=vs.85%29.aspx

moreover if you google for "what is a menu key" google will tell you that this is an alias of "apps" key (the one for showing a context menu), and I doubt this one can have left or right flavors  
plus when I press it, I get `event/key = 93`

DideC

[12:58](#msg5ad74102109bb04332d5962c)\[ALT] key is called "Menu key" by M$ because it's the one that activate the menu to navigate in it with the Keybord in Windows OS and apps. In last Windows, where menu is frequently hidden, it even show it. But it is also used in many keyboard shortcuts.

## Thursday 19th April, 2018

hiiamboris

[16:54](#msg5ad8c9ac27c509a7742c78a7)@9214 it seems the only difference is in the condition:  
newer repend:

```
head either any [only not any-list? series] [
        insert/only tail series reduce :value
    ] [
        reduce/into :value tail series
    ]
```

older:

```
head either any [only not block? series] [
       insert/only tail series reduce :value
   ] [
       reduce/into :value tail series
   ]
```

9214

[16:54](#msg5ad8c9d75d7286b43a478008)@hiiamboris yeah, `any-list?` looked suspicious on a first glance.

[16:55](#msg5ad8ca142b9dfdbc3aa9f504)@hiiamboris though, maybe `repend` isn't \*actually* a shortcut for `append/reduce` :confused:

hiiamboris

[16:56](#msg5ad8ca2d6d7e07082b10a483)that's what I'm thinking about too...

[16:56](#msg5ad8ca3a27c509a7742c7ae9)maybe we've discovered the hidden wisdom of it :D

[17:03](#msg5ad8cbd027c509a7742c8489)@dockimbel are `repend` and `append reduce` supposed to be total equivalents and we've found a regression, or are they not?

[17:06](#msg5ad8ccab270d7d3708e4a052)well it actually comes down to the question of equivalence of `reduce` and `reduce/into` I guess

9214

[17:09](#msg5ad8cd5a15c9b0311414263a)@hiiamboris it has something to do with recursion, I'm too tired to think about it clearly :zzz:

hiiamboris

[17:10](#msg5ad8cd81270d7d3708e4a4a1)@9214 wait I'll show you

greggirwin

[17:12](#msg5ad8cde02b9dfdbc3aaa07fa)For `append/insert` `/into` is implied because you provide the series. What we need to do is show if or how the behavior is different, to document that. Using `reduce/into` is an optimization, so a new series doesn't have to be allocated by `reduce`.

hiiamboris

[17:13](#msg5ad8ce3a6d7e07082b10ba3a)@greggirwin @9214 look where the difference between stable and nightly occurs:  
stable:

```
[0 [1] 1 [1] 5 4 3 2 [2]]                                                    
[0 [1] 1 [1] 5 4 3 [6] 2 [2]]                                                
[0 [1] 1 [1] 5 4 [24] 3 [6] 2 [2]]                                           
[0 [1] 1 [1] 5 [120] 4 [24] 3 [6] 2 [2]]                                     
120                                                                          
func [n /local b][switch/default n [0 [1] 1 [1] 5 [120] 4 [24] 3 [6] 2 [2]] [
    do also b: body-of context? 'b                                           
    n: also n                                                                
    probe repend select b 'n [n to-block n * (n: n - 1 do b)]                
]]
```

nightly:

```
[0 [1] 1 [1] 5 4 3 2 [2]]                                                  
[0 [1] 1 [1] 5 4 3 2 [2] [6]]                                              
[0 [1] 1 [1] 5 4 3 2 [2] [6] [8]]                                          
[0 [1] 1 [1] 5 4 3 2 [2] [6] [8] [10]]                                     
2                                                                          
func [n /local b][switch/default n [0 [1] 1 [1] 5 4 3 2 [2] [6] [8] [10]] [
    do also b: body-of context? 'b                                         
    n: also n                                                              
    probe repend select b 'n [n to-block n * (n: n - 1 do b)]              
]]
```

[17:15](#msg5ad8ce9b5d7286b43a4799c5)so the older reduce/into evaluated its 1st item then remembered where it's going to insert the 2nd item and descended into recursive evaluation of it, and when finished - inserted it into the right position  
while the newer inserts at the end somewhere

greggirwin

[17:17](#msg5ad8cf136d7e07082b10bea4)Going to take a bit to analyze that. It's a bit dense.

hiiamboris

[17:17](#msg5ad8cf476d7e07082b10c008)well the logic of it is like this:  
repend inserts `[n` part, remembers the index and goes recursively into evaluating the `to-block n * (n: n - 1 do b)]` part

[17:18](#msg5ad8cf775d7286b43a479da5)and you can see upon the exit from each recursive call what the new switch block looks like

[17:20](#msg5ad8cfc96d7e07082b10c2ba)everything else is irrelevant

greggirwin

[17:20](#msg5ad8cff6102fac7b7b2cf735)I can't see anything yet. The code is very hard to follow at a glance. I'll come back to it if I can make time later. If you can narrow down the use case and question we need to answer, that will help. I know you're trying to do that here, but I'll have to tease it apart to understand it.

9214

[17:21](#msg5ad8d018270d7d3708e4b139)@hiiamboris can you simplify it to something more trivial?

hiiamboris

[17:21](#msg5ad8d02a1130fe3d36f53749)if it means abandoning factorial... yep

greggirwin

[17:23](#msg5ad8d0907c3a01610dfcc3a9)Quoting myself:

&gt; What we need to do is show if or how the behavior is different, to document that.

And if it's a limitation or bug in `reduce/into` that's \*very* important to identify.

hiiamboris

[17:50](#msg5ad8d6db7c3a01610dfce0f4)ok here's the minimal version:

```
probe repend b: [] ["<" (append b "x"  "o") ">"]       
probe append b: [] reduce ["<" (append b "x"  "o") ">"]
```

stop and think for a moment: what is the order of things? is it even defined? do we want a defined order or mark it as UB and call it a day?

both versions show how different `repend` and `append reduce` are, but they themselves also behave differently

this is what stable does:

```
["<" "o" ">" "x"]
["x" "<" "o" ">"]
```

look at the 1st line (2nd is obvious anyway)  
it knows it's gonna insert `<` then `o` then `>`, preserving the index and thus the order of provided tokens

now this is what nightly does:

```
["<" "x" "o" ">"]
["x" "<" "o" ">"]
```

looks like it just pushes the stuff into the tail

9214

[17:52](#msg5ad8d7581130fe3d36f55f2a)as if `reduce/into` appends, not inserts at the current index?

hiiamboris

[17:52](#msg5ad8d7635d7286b43a47c3c1)sort of, yeah

[17:55](#msg5ad8d81d5f188ccc15817686)maybe it internally started indexing the series from it's end?

9214

[17:57](#msg5ad8d8721130fe3d36f5640d)

```
text
["<" "x" "o" ">"]
```

Doesn't make any sense whichever way I look at it. :confused:

hiiamboris

[18:02](#msg5ad8d9a81130fe3d36f56c3f)the Zen of append/repend hehe :smiling\_imp:

## Saturday 21st April, 2018

9214

[09:31](#msg5adb04e0270d7d3708eda2da)I see two Parse tests (\[1](https://github.com/red/red/blob/master/tests/source/units/parse-test.red#L155) and \[2](https://github.com/red/red/blob/master/tests/source/units/parse-test.red#L160)) with identical names. Is that expected?

PeterWAWood

[09:44](#msg5adb080627c509a77435c7d3)It is not expected but it does not invalidate the tests. It will just be confusing if there is a failure in one of them.

9214

[09:45](#msg5adb08236bbe1d27390cdd41)@PeterWAWood thanks!

dockimbel

[13:00](#msg5adb35d17c3a01610d0663ed)@hiiamboris  
&gt; @dockimbel are `repend` and `append reduce` supposed to be total equivalents and we've found a regression, or are they not?

There are supposed to be equivalent. I don't think that it can be achieved now without adding a new refinement to `reduce`, like `/after`, to ensure that all resulting values are appended. The current `/into` refinement only inserts from current position. Worth a ticket for sure.

hiiamboris

[14:00](#msg5adb440015c9b031141e1ef4)submitted :)

9214

[14:02](#msg5adb44895f188ccc158b2fd2)@hiiamboris you're doing a good job catching all these bugs and regressions :+1:

hiiamboris

[14:03](#msg5adb44cf5f188ccc158b30ed)@9214 thanks for your help with it ;)

## Sunday 22nd April, 2018

9214

[13:12](#msg5adc8a4a5f188ccc158f5341)There's this strange formatting issue with the body of an empty object. Besides, why `b` wasn't set to `c`?

```
>> a: context [b: context [set 'b 'c]]
== make object! [
    b: make object! [    ] ; <-- note the empty space inside
]
>> empty? body-of a/b
== true
```

meijeru

[13:33](#msg5adc8f1f15c9b03114224d70)There is a `b` that is set to `c` but that is in the global context, not that which is in the context labeled `a`.

9214

[13:33](#msg5adc8f46109bb04332eaeb8f)@meijeru

```
>> a: context [b: context [set 'b 'c]]
== make object! [
    b: make object! [    ]
]
>> b
*** Script Error: b has no value
*** Where: catch
*** Stack:
```

[13:35](#msg5adc8f9f109bb04332eaec91)Perhaps `b` inside `a` \*was* set and then re-set again to a newly created object?

hiiamboris

[13:44](#msg5adc91b415c9b03114225542)I think set happens before context to b assignment

[13:46](#msg5adc922062316e0505e8fcb8)the space is curious though

[13:48](#msg5adc92b327c509a7743acdf6)look, it grows

```
>> context [a: context [ ] ]
== make object! [
    a: make object! [    ]
]
>> context [a: context [ b: context [ ] ] ]
== make object! [
    a: make object! [
        b: make object! [        ]
    ]
]
```

[13:49](#msg5adc92dd5d7286b43a55cd34)I think it's the indentation that should be on the next line, but it doesn't jump to the next line in the absence of inner stuff

9214

[13:49](#msg5adc92e015c9b031142258b0)Ah, so it isn't specific to this case.

[13:50](#msg5adc93322b9dfdbc3ab80541)Yes, I think it has something to do with `new-line` formatting of the block.

meijeru

[13:51](#msg5adc936e27c509a7743ad179)It clearly says that `b` has no value, but that is the `b`whose context IS the global context. The question is, what is the context of the inner `b`? I tried to find that out as follows:

```
>> a: context [b: context [set 'b 'c probe context? 'b]]
make object! [
    b: 'c
]
== make object! [
    b: make object! [    ]
]
```

hiiamboris

[13:52](#msg5adc93aa62316e0505e901b8)as expected it took 'b from 'a

9214

[13:52](#msg5adc93ad62316e0505e901c3)@meijeru the context of `b` is `a`, as you can see.

[13:53](#msg5adc93bc2d0e228d7b9cb934)Because of the leftmost `b:`

meijeru

[13:54](#msg5adc94166d7e07082b1f3bc0)But then `a` is printed wrongly! This seems worth an issue...

9214

[13:57](#msg5adc94d515c9b03114225e8e)@meijeru it's not. As I said, first `b` is set to `c` inside `a`, then you probe the context (at this point in execution `b` is indeed set to `c`, so the output is correct), and then `b` is re-set to a newly created object.

meijeru

[14:28](#msg5adc9c2a6d7e07082b1f5b04)In conclusion, it's all about the order in which things are done...

mikeparr

[16:11](#msg5adcb4432d0e228d7b9d4029)The specification of the "spec-of" word says:  
Returns the spec of a....  
As far as I can see, it displays a spec, but does not return it. A bug in its description?

9214

[16:12](#msg5adcb4687c3a01610d0b4f50)@mikeparr why do you think it doesn't return a spec?

[16:13](#msg5adcb4a25f188ccc158ffd92)

```
text
>> spec-of func [x y z][z y x]
== [x y z]
>> type? spec-of func [x y z][z y x]
== block!
```

meijeru

[16:18](#msg5adcb5e72d0e228d7b9d4622)Also:

```
>> a: spec-of func [x y][x + y]
== [x y]
>> a
== [x y]
```

That is what is meant by returning: yielding a value that a word can be set to.

mikeparr

[16:46](#msg5adcbc7027c509a7743b736f)My mistake - I was trying to get at the documentation strings. Thanks.

hiiamboris

[21:05](#msg5adcf923109bb04332ec80c9)guess visually first: how many of these lines will succeed?

```
o1: make op! f1: func ['x 'y] [(get x) * (get y)]
o2: make op! f2: func [ x  y] [x       * y]
o3: make op! f3: func [ x 'y] [x       * (get y)]
o4: make op! f4: func ['x  y] [(get x) * y]
o5: make op! f5: func [ x 'y] [x       * y]
a: 2 b: 3
f3 a b
f4 a b
a o1 b
a o2 b
a o3 b
a o4 b
a o5 b
```

9214

[21:12](#msg5adcfac35f188ccc15910ca9)@hiiamboris are you on nightly or stable?

[21:13](#msg5adcfadf2b9dfdbc3ab982e1)https://github.com/red/red/issues/3179

hiiamboris

[21:13](#msg5adcfb166d7e07082b20c7e6)well, nightly fails one time less than stable

9214

[21:17](#msg5adcfbd32d0e228d7b9e4798)`o3` and `o4` unexpectedly fail for me, as if arguments in spec are mixed up.

[21:17](#msg5adcfbd77c3a01610d0c5177)Good catch!

hiiamboris

[21:20](#msg5adcfca46d7e07082b20cd8c)ok there'll be a ticket... tomorrow... :sleeping: :zzz:

[21:21](#msg5adcfce05d7286b43a5756d9)o5 unexpectedly works btw

9214

[21:23](#msg5adcfd385d7286b43a575829)@hiiamboris right. :sleeping: here too.

meijeru

[21:40](#msg5add01461130fe3d36053496)Something that works but shouldn't is also subject for a ticket, isn't it?

greggirwin

[21:55](#msg5add04df27c509a7743c865c)Good stuff all! Thanks for banging on these and finding these issues.

## Tuesday 24th April, 2018

9214

[10:23](#msg5adf05a06d7e07082b2a15da)@dockimbel is this an expected behavior?

```
>> object skip [x: 1 y: 2] 2
== make object! [
    x: unset
    y: 2
]
```

rebolek

[10:24](#msg5adf05ec5f188ccc159a11c2)Additional quirkiness:

```
>> make object! [a: quote b: c: d: 2]
== make object! [
    a: b:
    b: unset
    c: 2
    d: 2
]
```

9214

[10:25](#msg5adf06326d7e07082b2a1805)

```
text
>> object tail [x: 1 y: 2]
== make object! [
    x: unset
    y: unset
]
```

rebolek

[10:27](#msg5adf0697270d7d3708fd7435)All these examples support my suspicion that block at head is scanned for all `set-word!`s and then their value is taken from block at current position.

## Wednesday 25th April, 2018

greggirwin

[03:01](#msg5adfef855d7286b43a652ed1)Anyone want to add notes to https://github.com/red/red/wiki/Object-Notes? You could reference https://github.com/red/red/blob/master/runtime/datatypes/object.reds#L985, at a glance.

xqlab

[11:20](#msg5ae0648b2b9dfdbc3ac95cf1)Is this intended behavior that parse does not evaluate/reduce words to parse key words

```
>> y:  'skip parse " "  [y]
*** Script Error: PARSE - invalid rule or usage of rule: skip
*** Where: parse
*** Stack:
```

while it reduces to other data types

```
>> parse " " [skip]
== true
>> y:  " " parse " "  [y]
== true
>> y:  'skip parse " "  reduce [y]
== true
>>
```

9214

[11:38](#msg5ae068ab15c9b03114340dac)`y: [skip]`

xqlab

[12:20](#msg5ae0729d1130fe3d36158895)but R2 and R3

```
>> x: 'skip parse/all " " [x]
== true
```

gltewalt

[18:33](#msg5ae0c9e7109bb04332fec866)2147483647 * 2

9214

[18:33](#msg5ae0ca13109bb04332fec9da)@gltewalt Red is 32 bit as of now.

gltewalt

[18:34](#msg5ae0ca18109bb04332fec9e4)I guess it's normal?

[18:35](#msg5ae0ca802d0e228d7bb080c4)Looks like rebview also throws the error. But if you introduce a decimal point to one of the numbers, it converts to `float!`

9214

[18:36](#msg5ae0ca97109bb04332feccca)@gltewalt do you understand what "is 32 bit" means?

[18:37](#msg5ae0caea7c3a01610d1e5c0c)`2147483647` is the maximum positive integer number you can represent with 32 bits

```
>> enbase/base to binary! to integer! 2 ** 31 - 1 2
== "01111111111111111111111111111111"
```

[18:38](#msg5ae0cb106d7e07082b3348ba)Rebol2 is limited to 32 bits too.

gltewalt

[18:40](#msg5ae0cb9427c509a7744eab67)I'm just wondering if it should auto convert to `float` or wait for bignum?

9214

[18:41](#msg5ae0cbd32b9dfdbc3acbac1a)Operation on two integers produces an integer, there's no implicit conversion. That's why you need to supply at least one `float!`.

gltewalt

[18:42](#msg5ae0cc26109bb04332fed678)Many years ago, I was used to implicit conversion when playing with a different language

[18:44](#msg5ae0cc77b01085166cbea09d)I think it was a design decision / hack

greggirwin

[18:53](#msg5ae0cea627c509a7744eb96e)It is by design that integer does not auto convert to float on overflow. People need to be aware of that.

gltewalt

[18:56](#msg5ae0cf44109bb04332feea3c)Noted

hiiamboris

[18:58](#msg5ae0cfe3270d7d370806c352)@greggirwin @dockimbel I'd like your expert comments on :point\_up: \[April 25, 2018 2:03 PM](https://gitter.im/red/help?at=5ae0607d2d0e228d7bae1b6e) when you've a bit of free time

greggirwin

[19:17](#msg5ae0d45f1130fe3d3617cdfc)@hiiamboris LOL! Free time. You crack me up. ;^) Yes, I'm shoveling as fast as I can, but things keep piling up.

hiiamboris

[19:22](#msg5ae0d5596d7e07082b33844a):D

## Thursday 26th April, 2018

maximvl

[11:53](#msg5ae1bdd2b01085166cc2ac65)hey guys, I have an issue with wine and latest red:

```
~ > wine --version
wine-2.4
 ~ > wine ~/bin/red.exe 
err:winediag:SQLDrivers No ODBC drivers could be found. Check the settings for your libodbc provider.
 ~ > fixme:dwmapi:DwmIsCompositionEnabled 0x33fdb0
fixme:dwrite:get_name_record_codepage encoding 20 not handled, platform 1.
fixme:dwrite:get_name_record_codepage encoding 20 not handled, platform 1.
fixme:dwrite:get_name_record_locale failed to get locale name for lcid=0x00000455
fixme:dwrite:get_name_record_locale failed to get locale name for lcid=0x00000455
fixme:dwrite:get_name_record_locale failed to get locale name for lcid=0x00000455
fixme:dwrite:get_name_record_locale failed to get locale name for lcid=0x00000455
fixme:dwrite:get_name_record_locale failed to get locale name for lcid=0x00000455
fixme:dwrite:get_name_record_locale failed to get locale name for lcid=0x00000455
fixme:dwrite:get_name_record_locale failed to get locale name for lcid=0x00000455
fixme:dwrite:get_name_record_locale failed to get locale name for lcid=0x00000455
fixme:dwrite:get_name_record_locale failed to get locale name for lcid=0x00000455
fixme:dwrite:get_name_record_locale failed to get locale name for lcid=0x00000455
fixme:dwrite:get_name_record_locale failed to get locale name for lcid=0x00000455
fixme:dwrite:get_name_record_locale failed to get locale name for lcid=0x00000455
fixme:win:EnumDisplayDevicesW ((null),0,0x33f674,0x00000000), stub!
fixme:dxgi:DXGID3D10CreateDevice Ignoring flags 0x20.
fixme:dxgi:dxgi_check_feature_level_support Ignoring adapter type.
fixme:winediag:dxgi_check_feature_level_support None of the requested D3D feature levels is supported on this GPU with the current shader backend.
fixme:dwrite:dwritetextformat_SetIncrementalTabStop (0x20ddb0)->(0.000000): stub
err:seh:raise_exception Unhandled exception code c0000005 flags 0 addr 0x41d4f6

 ~ >
 ~ >
```

[11:54](#msg5ae1bdf015c9b031143a6133)can somebody reproduce it?

9214

[11:55](#msg5ae1be216d7e07082b3768f3)@maximvl Wine support was dropped in the new console engine, you should compile an old one from sources.

maximvl

[11:55](#msg5ae1be292b9dfdbc3acfac36)wat

rebolek

[11:55](#msg5ae1be497c3a01610d227e29)@9214 `SQLDrivers No ODBC drivers could be found. Check the settings for your libodbc provider.` doesn't sound like GUI problem

maximvl

[11:55](#msg5ae1be4a62316e050500cf0d)wine was the only way to make GUI on linux

[11:56](#msg5ae1be5c5d7286b43a6da4a6)@rebolek no, this message has always been there

rebolek

[11:56](#msg5ae1be62dad6fb186febd03f)Ah, ok

maximvl

[11:56](#msg5ae1be657c3a01610d227e82)the rest is new however

rebolek

[11:56](#msg5ae1be6b5d7286b43a6da50d)@maximvl there's now `GTK` branch

9214

[11:56](#msg5ae1be6fdad6fb186febd114)@rebolek but the rest is concerned with DirectX

[11:56](#msg5ae1be73109bb0433202f8f1)as far as I can see

maximvl

[11:56](#msg5ae1be8315c9b031143a6366)@rebolek are there any builds available for that branch?

rebolek

[11:57](#msg5ae1beaadad6fb186febd217)@maximvl I build manually

9214

[11:57](#msg5ae1beac2d0e228d7bb4b867)@maximvl nope, compile everything by hand like all big boys do :neckbeard:

maximvl

[11:57](#msg5ae1bebdb01085166cc2b14f)like all \_nerds_ do, quickfix

rebolek

[11:58](#msg5ae1bed8dad6fb186febd327)Maybe I can add a cron job to my stats server to do automated builds

[11:58](#msg5ae1beed1130fe3d361bd5f2)CPU is idling there most of the time anyway

maximvl

[11:58](#msg5ae1bef65d7286b43a6da7ff)hopefully stable version is old enough

rebolek

[11:59](#msg5ae1bf05109bb0433202fd50)stable version is too old :)

maximvl

[11:59](#msg5ae1bf0b62316e050500d3bb)@rebolek that'd be nice

[11:59](#msg5ae1bf321130fe3d361bd7b2)yeah, I think long long time ago I asked to keep builds available

[12:00](#msg5ae1bf582d0e228d7bb4badb)apparently this doesn't bother anybody except me

rebolek

[12:00](#msg5ae1bf5a1130fe3d361bd8a7)@maximvl here's 2-3 days old build of GTK branch http://rebolek.com/gtkonsole

9214

[12:00](#msg5ae1bf5f109bb0433202feb8)@maximvl if you can provide file space for that of course.

maximvl

[12:00](#msg5ae1bf695d7286b43a6da9f2)@9214 file space for 1mb files?

[12:01](#msg5ae1bf826d7e07082b37708e)you kidding?)

9214

[12:01](#msg5ae1bf982d0e228d7bb4bbcf)@maximvl for every possible build, with each new one rolled out 2-8 times per day.

maximvl

[12:02](#msg5ae1bfc3270d7d37080acc0b)once per day is enough

9214

[12:02](#msg5ae1bfd0dad6fb186febd785)even though you can do the same by tracking commit history on github and compiling from sources.

maximvl

[12:03](#msg5ae1bffcdad6fb186febd90a)except that it ruins the whole idea

rebolek

[12:03](#msg5ae1c0031130fe3d361bdb74)there's ~9200 commits, so it's ~ 10000 \\* 3 platforms \\* 1MB = 30GB maximum.

9214

[12:03](#msg5ae1c0201130fe3d361bdc06)@rebolek now add another 10GB for custom GTK builds.

[12:03](#msg5ae1c02b2d0e228d7bb4bed2)and another 30GB for pre-MEBIR ones :bear:

rebolek

[12:04](#msg5ae1c034109bb0433203027e):)

[12:04](#msg5ae1c0422d0e228d7bb4bf50)pre-MEBIR are in those 30GBs

[12:04](#msg5ae1c0517c3a01610d2288e7)and GTK branch is cca 2 weeks old

maximvl

[12:04](#msg5ae1c053270d7d37080ad07c)and you are still not getting any close to even a tiny flash drive

9214

[12:04](#msg5ae1c054b01085166cc2bbb6)@rebolek don't underestimate the :bear:

maximvl

[12:06](#msg5ae1c0ae109bb04332030595)@rebolek

```
~ > ./Downloads/gtkonsole 
./Downloads/gtkonsole: error while loading shared libraries: libgtk-3.so.0: cannot open shared object file: No such file or directory
```

[12:06](#msg5ae1c0b415c9b031143a6f9f)ok here it goes

rebolek

[12:06](#msg5ae1c0bf15c9b031143a6fc6)@maximvl you need to install 32bit GTK libs

maximvl

[12:07](#msg5ae1c0e82d0e228d7bb4c375)yeah, this is what i'm talking about

rebolek

[12:08](#msg5ae1c1281130fe3d361be199)I'm not going to build all 9200 versions as it makes no sense, but I will look into automated builds on my server. I have enough disk space and free CPU to do it.

maximvl

[12:08](#msg5ae1c14962316e050500e093):+1:

[12:09](#msg5ae1c16f2d0e228d7bb4c5a3)I mean, of course, nobody cares about past versions, but there were few cases already when critical bugs were in the builds for a while

[12:09](#msg5ae1c17e7c3a01610d228fc5)so it's good to keep a little history

rebolek

[12:10](#msg5ae1c1a72b9dfdbc3acfbd79)I agree.

[13:40](#msg5ae1d6be15c9b031143ae385)@maximvl build script seems to be working - https://rebolek.com/builds/

[13:42](#msg5ae1d75a15c9b031143ae84d)added to cron table. Let's hope there will be new builds tomorrow :)

maximvl

[13:45](#msg5ae1d7eb62316e0505015e5a)@rebolek nice! :D

## Friday 27th April, 2018

greggirwin

[06:17](#msg5ae2c08262316e0505055a86)We can look into keeping milestone builds, but the more we keep, the more confusing it is when you try to find something.

hiiamboris

[19:12](#msg5ae3762462316e050508e893)oops I broke Red again:

```
insert/dup "world" "order" 30%
```

(it's still working on it...)

9214

[19:14](#msg5ae376796d7e07082b3fbc42)I don't think `number!` should be allowed here.

hiiamboris

[19:15](#msg5ae376ce62316e050508ed2b)same for `append/dup`, and there's magic at work: some numbers make it think hard, some return the original immediately

toomasv

[19:20](#msg5ae378017c3a01610d2a98fe)@qtxie The latest build (red-27apr18-4c361086.exe) tends to die with message:  
\[!\[blob](https://files.gitter.im/red/bugs/bdVJ/thumb/blob.png)](https://files.gitter.im/red/bugs/bdVJ/blob)

hiiamboris

[19:22](#msg5ae3785b15c9b0311442b52b)@qtxie and how about a quick-fix `number!` -&gt; `integer!` for the above :point\_up: \[April 27, 2018 10:12 PM](https://gitter.im/red/bugs?at=5ae3762462316e050508e893)? this ain't worth a ticket ;)

greggirwin

[21:35](#msg5ae397987c3a01610d2b215f)@hiiamboris, good find. Maybe worth a ticket, though, since it would be nice to know why it hangs. e.g. using `0` for the dup arg is fine, but there's enough logic in the action that it's not immediately clear what the problem is. It also crashes right away for blocks, which is different.

[21:36](#msg5ae397ca15c9b0311443381e)I agree that changing the arg type should be done, and we can do that easily, but I'd like some RCA.

9214

[23:23](#msg5ae3b10a15c9b03114439d48)I guess that's expected when working with cyclic structures?

```
>> copy/deep append/only x: [] x
Segmentation fault
```

## Saturday 28th April, 2018

greggirwin

[00:05](#msg5ae3bada109bb043320c2073)I think Nenad has said that cycle detection is TBD.

9214

[00:08](#msg5ae3bb86b01085166ccc1677)@greggirwin good to know, thanks.

qtxie

[00:41](#msg5ae3c328109bb043320c3ef1)@toomasv How to reproduce it?

[00:55](#msg5ae3c6837c3a01610d2bbd61)@hiiamboris Yes. It shouldn't freeze the console. I'm not sure we should allow `number!` here. For `/dup`, only `integer!` value makes sense for me.

[01:01](#msg5ae3c7f61130fe3d362595c3)For `/part`, different type of number! may be used in different way. For example, if use `50%`, will insert half of the elements.

```
>> a: []
>> b: [1 2 3 4]
>> insert/part a b 50%
>> a
== [1 2]
```

toomasv

[03:19](#msg5ae3e8501130fe3d3625fb5d)@qtxie It happened several times when I played a bit with curves, as seen on above picture, and left the console unattended for a little while. Each time after coming back I found it had died.  
I was playing with variations of `view [box 500x300 draw [shape [move 50x150 curve 50x10 150x10 150x150 curv 250x290 250x150 move 50x150]]]`.

qtxie

[03:49](#msg5ae3ef466d7e07082b416f02)@toomasv Thanks. Maybe some memory corruption in `curve` function. :bug:

hiiamboris

[07:11](#msg5ae41eac1130fe3d3626abe0)@qtxie @greggirwin talking about root causes...

```
Red []
foo: routine [x [value!] /local y [red-integer!]] [
  y: as red-integer! x
  print y/value
  print #"^/"
]
repeat i 10 [
  prin [0.1 * i " "]
  foo 0.1 * i
]
```

`red -c ...`

```
0.1  -1717986918
0.2  -1717986918
0.3  858993460  
0.4  -1717986918
0.5  0          
0.6  858993460  
0.7  1717986919 
0.8  -1717986918
0.9  -858993459 
1.0  0
```

[07:13](#msg5ae41f292d0e228d7bbf1d2f)if there was a check around https://github.com/red/red/blob/master/runtime/datatypes/string.reds#L2153 for TYPE\_INTEGER, it might have not crashed/freezed

qtxie

[07:14](#msg5ae41f44dad6fb186ff630bd)@hiiamboris IIRC, `red-integer!` will auto-unwrap when passing to a `routine`.

hiiamboris

[07:15](#msg5ae41f912d0e228d7bbf1e6a)but I pass it as red-value (struct), to reproduce the `insert` behavior

qtxie

[07:15](#msg5ae41f955d7286b43a78046f)Ah, you mean the fix for `/part` issue. Yes, we should check the type there.

hiiamboris

[07:16](#msg5ae41fe0270d7d3708153cad)@qtxie I agree, simple change to `integer!` for the accepted type should be enough of a fix for `/dup` in my opinion

dockimbel

[09:15](#msg5ae43b95b01085166ccda05b)@9214  
&gt; @dockimbel is this an expected behavior?

```
>> object skip [x: 1 y: 2] 2
== make object! [
    x: unset
    y: 2
]
```

That's a bug.

[09:21](#msg5ae43d2562316e05050b87e7)@hiiamboris  
&gt; @qtxie @greggirwin talking about root causes...

Looks like a bug? If confirmed, please log it in a ticket.

meijeru

[10:41](#msg5ae44fde62316e05050bc59e)The usual question: is it a bug or a feature? Take an element from a block, where the element has the `newline` flag set. Insert that element in another block -- the newline flag remains set. If it is a feature, it may mean extra programming to unset the newline if it is not wanted.

```
>> b: [1 2 3]
== [1 2 3]
>> new-line b true
== [
    1 2 3
]
>> d: make block! 10
== []
>> insert tail d b/1
== []
>> d
== [
    1
]
```

dockimbel

[10:48](#msg5ae4516315c9b0311445bb21)@meijeru Feature. We preserve `newline` flags by default. If it's not desired, you can clean them up at any time using a `new-line/all off` call.

meijeru

[10:49](#msg5ae451a17c3a01610d2d74eb)@dockimbel Fine! A warning to this effect in the docs needed?

dockimbel

[11:01](#msg5ae45497dad6fb186ff6e3da)@meijeru I think that stating that `newline` markers are preserved when values are moved between any-lists is enough. Rebol2/3 have the same behavior.

hiiamboris

[11:19](#msg5ae458c67c3a01610d2d8b7c)

```
>> o: object [f: does [probe self probe :self]]
>> o/f
make object! [
    f: func [][probe self probe :self]
]
unset
```

why won't `self` work as a `get-word!`?

dockimbel

[11:32](#msg5ae45be67c3a01610d2d99df)@hiiamboris Probably missing a code branch.

## Sunday 29th April, 2018

nedzadarek

[10:43](#msg5ae5a1bc109bb04332124341)I have checked this in `red/help` but to make sure:  
`any` with block causes infinite loop, but with normal string it will be fine:

```
parse "foo" [any [""] "foo"]
; parse "foo" [any "" "foo"] ; infinite loop
```

[11:23](#msg5ae5ab422b9dfdbc3adf460c)`op!` doesn't work with `quote`: `quote 1 + 1` will show: `Script Error: - operator is missing an argument`. Is this correct behaviour?

PeterWAWood

[11:37](#msg5ae5ae7f62316e05051039d4)When cross-compiling the GUI console, `system\build\config` shows the name of the target OS but uses the host OS version number.

I compiled the GUI console for Windows under macOS 10.12:

```
text
>> help system/build/config
SYSTEM/BUILD/CONFIG is an object! with the following words and values:
     config-name        word!         windows
     OS                 word!         Windows
     OS-version         float!        10.12
```

[11:39](#msg5ae5aeda1130fe3d362bda69)It seems like a bug.

hiiamboris

[12:54](#msg5ae5c09a62316e0505107765)&gt; `op!` doesn't work with `quote`: `quote 1 + 1` will show: `Script Error: - operator is missing an argument`. Is this correct behaviour?

@nedzadarek  
`? 1 + 1` -- same  
looks like `:get-words` and `'lit-words` in functions specs get priority over operators? weird is that `+` won't get the result of `quote`, seems like a lexer limitation to me

nedzadarek

[13:20](#msg5ae5c6a22b9dfdbc3adfa619)@hiiamboris hmm... but I think `? 1 + 1` is expected behaviour because `? 1` doesn't return anything (useful/`integer!`). `quote 1` on the other hands returns `1` (`q: quote 1 q`).

9214

[13:23](#msg5ae5c7432d0e228d7bc46dc9)This behavior is expected with get-args and lit-args, which `?` and `quote` use.

hiiamboris

[13:30](#msg5ae5c9081130fe3d362c3e6c)@nedzadarek yeah, I agree..

[13:31](#msg5ae5c921109bb0433212cfa3)it works fine in R3 btw

nedzadarek

[13:34](#msg5ae5c9eb7c3a01610d324c75)@9214 why it's expected? I mean quote returns some value so it should \*give* `+` it.

dockimbel

[13:37](#msg5ae5ca7f1388b2df210ea909)@nedzadarek

```
>> (quote 1) + 1
== 2
>> 1 + quote 1
== 2
```

nedzadarek

[13:37](#msg5ae5cab2dad6fb186ffb7c6d)@dockimbel yes, but at first argument, why you need `()`?

9214

[13:41](#msg5ae5cb6e109bb0433212d7e3)@nedzadarek because operators have precedence over functions.

[13:44](#msg5ae5cc362b9dfdbc3adfbbea)and because otherwise quoted argument is not a par of infix expression.

nedzadarek

[13:46](#msg5ae5cca6270d7d37081ab8a6)@9214 I don't mean precedence (`op!` vs `function!`). I mean why `quote 1 + 1` doesn't work at all (requires parenthesis)? If `op!` has higher precedence over `function!` then it should be evaluated something like this `q: (1 + 1) quote` (`quote 2`).

9214

[13:50](#msg5ae5cd9e15c9b031144a8671)But get-arg goes first and eats leftmost argument, leaving operator only with one at the right.

hiiamboris

[13:51](#msg5ae5cdf26d7e07082b47a39d)R3: !\[](https://i.gyazo.com/bedddf2f1c842b064237b0318224d581.png)  
I think it's even more wrong? what's the point of quoting a result of an expression?  
I'd rather expect `quote 1 + 1` = `(quote 1) + 1`, so the Red behavior looks better to me  
although I don't see why the result of `quote` won't go into the `+` as left-expression

[13:57](#msg5ae5cf361388b2df210eb8a7)nah, I was wrong about R3, it does all right:  
!\[](https://i.gyazo.com/3bf44b7cfc57c6aa416acd86bf08c3ab.png)

greggirwin

[22:09](#msg5ae642af1388b2df21105856)@nedzadarek, `parse "foo" [any "" "foo"] ; infinite loop` should be OK, I think, because `any` doesn't advance the input in this case, and so should break. If nobody corrects my view, please open a ticket for that.

## Monday 30th April, 2018

9214

[04:49](#msg5ae6a066109bb04332158f70)@greggirwin that's correct.

[05:53](#msg5ae6af411130fe3d362f42cb)?

```
>> parse x: [][insert ('foo)]
== true
>> x
== [unset]
>> parse x: [][insert (quote foo)]
== true
>> x
== [unset]
```

dockimbel

[06:09](#msg5ae6b31c6d7e07082b4ab2e9)&gt; parse "foo" \[any "" "foo"] ; infinite loop

Worth a ticket, as we could add infinite loop detection for that case.

[06:11](#msg5ae6b3852d0e228d7bc78aee)@9214 Looks like a bug.

9214

[06:14](#msg5ae6b42c6d7e07082b4ab607)@dockimbel https://github.com/red/red/issues/3357 :guardsman:

dockimbel

[06:19](#msg5ae6b5805d7286b43a8094dd)@9214 Thanks. :+1:

hiiamboris

[20:14](#msg5ae7790d7c3a01610d3922fc)%ticket19.red:

```
Red [] ? value
```

invoked:

```
VALUE is a string! value: "ticket19.red"
```

some global context pollution?

greggirwin

[20:15](#msg5ae7797d1388b2df211591e4)I believe this was a recent ticket... what build, and REPL or compiled?

hiiamboris

[20:16](#msg5ae779a762316e0505178113)REPL, all builds

greggirwin

[20:17](#msg5ae779bf1130fe3d36332bda)Just built. Seems fine here.

meijeru

[20:17](#msg5ae779d462316e0505178186)This was a case of leakage.

greggirwin

[20:17](#msg5ae779d5c3072ad76f1f015b)

```
>> Red []  ? value
     value?          native!       Returns TRUE if the word has a value.
     values-of       function!     Returns the list of values of a value that supports reflection.
```

hiiamboris

[20:18](#msg5ae77a00109bb0433219a347)@greggirwin you need to put that into a file and specify the filename as an argument to red.exe

meijeru

[20:18](#msg5ae77a1e2b9dfdbc3ae69c32)PR #3346 solved the leakage.

hiiamboris

[20:19](#msg5ae77a59109bb0433219a848)oh wow

greggirwin

[20:21](#msg5ae77ac6270d7d37082199cb)Thanks @meijeru, that's the one. I'm always too slow. :^)

hiiamboris

[20:22](#msg5ae77afa62316e05051788a1)yeah just updated and that fixed it, thanks!

meijeru

[20:22](#msg5ae77b061388b2df21159911)It's just that I was one of those that thought of the probable cause when the issue was first mentioned. So I was glad to be right...

[20:23](#msg5ae77b25270d7d3708219bef)And therefore I remember it!

## Tuesday 1st May, 2018

dockimbel

[08:40](#msg5ae82810dea1b95c10f40ae8)Can't find which room talked about the rich-text face updating issue, but it has been fixed, so the following code now works as expected:

```
move-color: func [face][face/data/1/x: face/data/1/x + 1]

view [
    rt: rich-text 300x50 "Jumping color" with [data: [1x1 255.0.0]] 
    return 
    button "Jump" [move-color rt probe rt/data]
]
```

9214

[16:28](#msg5ae895bd59a057800497d799)@toomasv :point\_up:

toomasv

[16:34](#msg5ae8970553ceca3604a321da):point\_up: \[May 1, 2018 7:33 PM](https://gitter.im/red/help?at=5ae896d46d98e53e0443d342)

9214

[16:34](#msg5ae89733b982f08504e5caf6):+1:

toomasv

[16:56](#msg5ae89c3f5cf0b830044a880c)@dockimbel The new console dies regularly, when left for some time alone, so that screen-saver switches in. When I log in again, the console has died.

gltewalt

[21:16](#msg5ae8d9350a9c956f041afda1)Seems to be long residing issues with consoles and ‘sleep mode’ on windows

nedzadarek

[22:13](#msg5ae8e67bf2d2d53704566008)@toomasv I don't remember which version it was (22.04 or 29/30.04) but after some time it took a lot of my ram.

## Wednesday 2nd May, 2018

toomasv

[03:07](#msg5ae92b7eda323a7c04ed4255)I met with this or very similar problem first time only recently, after @qtxie made changes to bezier functions in shape dialect. But I am not sure it originated there, because I hadn't downloaded new builds regularly before that.

dockimbel

[08:04](#msg5ae97127da323a7c04ee1455)I also noticed some issue with hibernation, when waking up, the console window is blank and painted only when bringing it on front.

## Friday 4th May, 2018

gltewalt

[17:05](#msg5aec92bcdb299d4004d05dcf)Yes, hibernation or 'sleep mode'

greggirwin

[18:17](#msg5aeca3b097e5506e0499fbcf)I just had some long running GUI consoles die here, without sleep or hibernate. Had some other things go odd at the same time, so could be display/driver dependent.

gltewalt

[19:00](#msg5aecadb340f24c430452a8a4)Is the memory growing over time?

greggirwin

[19:32](#msg5aecb55ada323a7c04f95f7e)I didn't have TaskMgr up at the time. Will watch that in the future.

nedzadarek

[23:00](#msg5aece60a53ceca3604b2105f)@greggirwin @gltewalt I'm on win 8.1 with 04.05.2018 build. When the task manager is opened, the cpu usage goes up to 40-60% and Ghz goes from 0,5-1GHz to full speed ~2.5GHz. Memory started to grow at that time.

[23:06](#msg5aece75ab982f08504f4d46e)When I minimised, cpu % went to ~~15%. It worked few times, but at ~3rd time there is no change (40-60% cpu).  
In the new console `;comment` is deleted (it disappear from the screen).

[23:08](#msg5aece7e2db299d4004d17bae)`new-line` markers in the old (26-03) and the new gui console (04.05) are not set correctly, especially after blocks:

```
[ a
      [b]
      c
      [d]
      z
    ]
; == [a 
;     [b] c 
;     [d] z
; ]
[[b]
    ]
; == [[b]]
[[b]
    z
    ]
; == [[b] z]
[z
    ]
; == [z]
[z
    z]
; == [z 
;     z
; ]
```

## Saturday 5th May, 2018

gltewalt

[00:01](#msg5aecf46eb37eab7d046b10b6)Does memory grow without introducing any code? (Fresh console at idle)

nedzadarek

[00:07](#msg5aecf5cf5cf0b83004596517)@gltewalt yes

greggirwin

[04:06](#msg5aed2ddeb982f08504f56f65)@gltewalt I saw one instance where it went up, but only to 66M (still not expected), then died. There are some recent commits with console related code and even MW\_ACTIVATE handling, which could be related.

gltewalt

[04:08](#msg5aed2e516f9af87e0444250d)GUI console only I assume

greggirwin

[04:10](#msg5aed2ecab982f08504f5724b)Yes.

gltewalt

[04:11](#msg5aed2efbb37eab7d046b8337)Newest daily build GUI Console is steady as she goes so far on Win7. How long usually until it "goes up"?

greggirwin

[04:14](#msg5aed2fa8f2d2d5370464a8a4)I can't yet dupe it on demand.

gltewalt

[04:14](#msg5aed2faf59a0578004a7387e)hmm

greggirwin

[04:15](#msg5aed2fe06d98e53e04533a12)Just pulled and building fresh. Will see if it happens again.

gltewalt

[04:15](#msg5aed2fecda323a7c04fa880a)I see that every time you give the GUI console focus memory usage uncreases

[04:15](#msg5aed2ff040f24c430453fc8c)increases

[04:16](#msg5aed3024f2d2d5370464acec)click away to taskmgr, click back to console. Grows

[04:17](#msg5aed30456f9af87e044429a4)By 4k

greggirwin

[04:20](#msg5aed311059a0578004a73e3a)Not the same on Win10.

gltewalt

[04:25](#msg5aed325103cafa797b2a8537)It grows when I cycle through open windows or click away and then give it back focus. If I leave it up and let it sit idle, it stays the same. So far.

ne1uno

[04:27](#msg5aed32c459a0578004a74267)I left new clean gui running was about 6 hours before it went from 20meg to 40meg

[04:28](#msg5aed32e2ff26986d08340084)win7, the old gui must be using less than 20 and it never used more

[04:29](#msg5aed3314da323a7c04fa8e2f)one time I unminimized it was blank, but never crashed

[04:29](#msg5aed33335cf0b8300459efa0)no hibernate though it probably had a screensaver or two kick in

gltewalt

[04:32](#msg5aed33f353ceca3604b2afb2)Yeah, I was wrong. It slowly grows while idle.

[04:33](#msg5aed340b00dc48880497c12a)If it's in focus

[05:03](#msg5aed3b066f9af87e04444098)13, 412 K to 13, 860 K, over 12 minutes

endo64

[10:06](#msg5aed823f40f24c430454bf9f)`parse-trace [3] [1 2 quote 3] ; == Error: PARSE - invalid rule or usage of rule: 3` but `parse [3] [1 2 quote 3] ; == true`

qtxie

[12:13](#msg5aed9fd05cf0b830045afc1a)@gltewalt I noticed that several days ago. The WM\_ACTIVATE handling ease it a bit, but I didn't find the right fix yet. :bug:

nedzadarek

[13:43](#msg5aedb4f0f2d2d5370465f10e)@endo64 It works when you put it into square brackets: `parse-trace [3] [1 2 [quote 3] ]`. It seems that `parse/trace` also doesn't work (`parse/trace [3] [1 2 quote 3] func [][]`).  
I have found similar "fix" to other bug: https://github.com/red/red/issues/3358 Maybe it's related?

greggirwin

[21:02](#msg5aee1bf0b37eab7d046dd5ab)The REPL crash is interesting. I've seen it a couple more times now, after screen saver. Mem use is 60-80M when it crashes.

## Monday 7th May, 2018

hiiamboris

[06:47](#msg5aeff69753ceca3604b9282a)@qtxie look:

```
>> a: "12345678"
== "12345678"
>> copy b
== "aa"
>> a: "12345678"
== "12345678"
>> b: skip a 6
== "78"
>> c: tail a
== ""
>> remove/part a 4
== "5678"
>> b
== ""
>> copy b
== "56"
>> c
== ""
>> copy c
== "5678"
```

[07:14](#msg5aeffcb91eddba3d04da2d7f)ahh, filed a ticket on that..

greggirwin

[17:09](#msg5af0885440f24c43045cbc90)@hiiamboris, is `b: "aa"` defined before that in your session?

[17:11](#msg5af088daff26986d083caa4e)Ah, it's all in your ticket. Thanks.

ne1uno

[17:59](#msg5af093f91eddba3d04dc826b)is there a way to tell rebol to leave the console open on error? red old gui is failing to build, rebol closes before I can see errors. +q doesn't help

[18:03](#msg5af0950f1eddba3d04dc869c)doh, I guess can't do it from commandline

greggirwin

[18:31](#msg5af09b7fff26986d083cf5fa)Do you have a Red CLI console running while trying to build. Make sure any failed instances of the build (Rebol), aren't still hanging around in memory.

ne1uno

[18:32](#msg5af09bceda323a7c040385ff)I usually run a bat file to build, cli and new gui console build and run ok. old console starts to build but fails a few minutes later.

[18:34](#msg5af09c2118d6bdde372258bd)no other red-console running

gltewalt

[18:37](#msg5af09cea40f24c43045d0e23)Have you tried the `rc` way by loading red.r ?

[18:38](#msg5af09d1540f24c43045d0e7e)I think if it errors out it should keep Rebol console open?

ne1uno

[18:42](#msg5af09e186d98e53e045c3ac3)won't that run into the problem of not being able to compile from red with no sdk?

## Tuesday 8th May, 2018

bitbegin

[01:14](#msg5af0fa1040f24c43045e254f)@hiiamboris and @greggirwin After `a` changed, the associate `b`'s position (var `head`) don't change. So I will fix this issue by adapting this position.

[01:20](#msg5af0fb471eddba3d04ddc3ea)As the reason showed above, this issue maybe exist in other series functions.

greggirwin

[04:45](#msg5af12b706d98e53e045dcd2a)Thanks @bitbegin !

bitbegin

[06:55](#msg5af149cc6d98e53e045e303f)discussed with qtxie, no need to change `b`'s position, just process the overflow

hiiamboris

[07:16](#msg5af14eb897f07c7e13788505)@bitbegin yeah I think tracking all series positions will be an overhead. Instead one could just do a fair amount of checks if any series argument has it's pointer past the buffer tail, and decide accordingly.

[07:18](#msg5af14f28f2d2d537046fd65a)Plus sometimes you might not need a change in other series:

```
a: "12345678"
b: skip a 4
clear a
index? b   ; or any other access - should not change b
append a "87654321"
b = "4321"   ; should be true
```

bitbegin

[07:34](#msg5af1532303cafa797b359d32)You're right

[07:43](#msg5af155206d98e53e045e5a25)@hiiamboris and @qtxie about issue #3368, we only allow integer! for dump, is this will be ok?

hiiamboris

[07:48](#msg5af1564503cafa797b35aaae)@bitbegin yeah, I believe we previously agreed on that, but @qtxie was just busy enough with other stuff to fix it

bitbegin

[08:03](#msg5af159e400dc488804a2fbff)ok, i create a PR(3376) for this bug

hiiamboris

[08:36](#msg5af1619353ceca3604bdeb3e)@bitbegin thank you!  
some automatic tests fail there though after the copy-fix

nedzadarek

[11:28](#msg5af189e0ff26986d083fe85b)Should `all`, `any` etc returns `none` in this case `all [ 1 = 2]` and `any [ 1 = 2]`? I think it should return false (`first reduce [1 = 2]; false`).

hiiamboris

[11:48](#msg5af18e7259a0578004b30388)@nedzadarek whatever the reason for that design, it's there since R2 and unlikely will be changed

nedzadarek

[11:48](#msg5af18ea097e5506e04a7399f)@hiiamboris sO I shouldn't fill the thicket?

hiiamboris

[11:49](#msg5af18ec2f2d2d5370470c771)up to you ;) I decided not to

9214

[11:52](#msg5af18f8dda323a7c040668e7)@nedzadarek read their description more carefully.

nedzadarek

[11:54](#msg5af18ff5ff26986d083ffcc1)@9214 `all`: `Evaluates, returning at the first that is not true.`does it say that it should return `none`?

hiiamboris

[12:01](#msg5af1918553ceca3604be8fc2)\*\*at the first\** is even more misleading then ;) one might think it returns the given series \*at* that point

[12:02](#msg5af191d3ff26986d08400354)@nedzadarek descriptions at RbE are accurate though: http://www.red-by-example.org/index.html#all http://www.red-by-example.org/index.html#any

9214

[13:37](#msg5af1a82ada323a7c0406c77b)@nedzadarek and why you need `false`, specifically? `none` is its logical equivalent, so I don't see much difference, not to mention the need for a ticket.

meijeru

[14:21](#msg5af1b2706f9af87e04506ded)Actual semantics of `all` and `any`:  
The shortcut evaluation functions `any` and `all` have a block as argument; they will evaluate the expressions one by one; `any` will stop at the first one whose value is not `false` or `none` and yield that as result; if there is no such expressions it will yield `none`; `all` will stop at the first one which is `false` or `none` and yield `none` as a result; if there is no such one it will yield the result of evaluating the last one. Note that `any [ ]` and `all [ ]` both yield `none`. Also: `all [false] == none`, `any[false] == none`.

toomasv

[14:39](#msg5af1b69097e5506e04a7c947)Even if `none` is falsey value in standalone situations, it does not act as such in more complex logical formulas, e.g.

```
true or none ; true or any []
== *** Script Error: or does not allow none! for its value2 argument
```

In such cases it is better to include all conditions in `any`-block. Alternatively `none` should be converted into `logic!` type with `make logic!` or `to logic!`/ `to-logic`.

nedzadarek

[20:27](#msg5af2081f97f07c7e137b38ad)@9214 I haven't made anything that needs `logic!` (so I'm not sure if it would cause a problem) but I guess there might be cases where it matters (as @toomasv said).

greggirwin

[20:52](#msg5af20df4da323a7c0408554f)The doc strings could be improved in any case.

[20:53](#msg5af20e331eddba3d04e1957b)I'll get on that.

## Wednesday 9th May, 2018

bitbegin

[03:36](#msg5af26cbdf2d2d5370473be30)@hiiamboris CI tests ok

[09:06](#msg5af2ba0e97f07c7e137d3aa4)i have fixed #3369, and added some test cases for it.

hiiamboris

[09:24](#msg5af2be5853ceca3604c25e0b):+1:

[09:30](#msg5af2bfa05cf0b8300469be8d)@bitbegin once I test `copy` on a fresh build, I suppose we need to inspect the other series functions as well, right?  
like this:

```
>> a: "12345678"
== "12345678"
>> b: skip a 6
== "78"
>> clear skip a 4
== ""
>> a
== "1234"
>> remove b
== ""
>> a
== "123456"
>> :)
???
```

[20:11](#msg5af355d6ebe5534efb38cb53)is it normal that `foreach [] [1] []` deadlocks? R3 complains when I'm asking it do the same

endo64

[20:20](#msg5af357fd1a8bab4efa07b965)I'm think it is a bug, you can open an issue for it.

hiiamboris

[20:24](#msg5af35907b07c06775b66566b)alright

greggirwin

[23:09](#msg5af37fa53d6c86775a0c51d5)@hiiamboris, you are the king on this issue. Keep breaking things.

## Thursday 10th May, 2018

bitbegin

[01:57](#msg5af3a70cb84be71db9f5b4eb)@hiiamboris Maybe `a` should be "1234" . You can open a ticket.

haolloyin

[12:47](#msg5af43f74862c5e33e92441ce)It seems here `16-3:` at \[runtime/allocator.reds#L51-L53](https://github.com/red/red/blob/master/runtime/allocator.reds#L51-L53) should be `16-5:`(change bit \*\*3\** to \*\*5\*\*)?

hiiamboris

[17:44](#msg5af484f652194a4a67d5e555)@bitbegin https://github.com/red/red/issues/3369  
I've commented on that ticket, on the other series glitches I could find

[17:46](#msg5af485755a1d895fae2db70e)@dockimbel @greggirwin There are some question marks there I'd like you designers to have a comment on, as with some results it's not obvious what would a correct way be.

meijeru

[17:55](#msg5af487951cfca775e1fbe72e)Have these bugs already been reported (they come from https://github.com/rebol/rebol-issues/issues/2286)

```
>> t: now/time
== 19:51:12
>> t/day
*** Script Error: cannot access day in path [script invalid-path]
*** Where: catch
*** Stack:  

>> now/time/day
== 10
```

First bug: wrong error message; second bug: /time is ignored and not reported

hiiamboris

[18:06](#msg5af48a13d245fe2eb79e9115)@meijeru what should the error message be? and how `now` should handle the 2nd example?

meijeru

[18:46](#msg5af49398e0b50c2d05b1a589)The error message should of course be `cannot acces day in path t/day` -- there is is a wrong parameter somewhere. The 2nd example should be either a protest to having two incompatible refinements, or to ignore the second one, and not the first one. What happens here is that programmatically /day is treated before /time, because that is the order in which they are defined, contrary to the order in which they are given in the path. My preference is for an error rather than ignoring.

hiiamboris

[18:49](#msg5af4942f5666c42eb6ffb4b9)I agree, an error makes sense.. otherwise it can become a hard to find bug

meijeru

[18:53](#msg5af49526b84be71db9f90965)There is a problem in determining whether to make issues out of this: has somebody already made them before? How to search for those?

hiiamboris

[19:02](#msg5af4972bbd10f34a68f19a3e)I looked up `invalid-path` and immediately found your issue, so I guess it's the way

meijeru

[19:09](#msg5af498dc1cfca775e1fc32e7)OK two issues can stand

rgchris

[19:09](#msg5af498fce1cf621dba0d813a)@meijeru I believe all public Red issues are in \[red/red](https://github.com/red/red/issues), can search that. All issues related to the erstwhile Rebol 3 project are in \[rebol/rebol-issues](https://github.com/rebol/rebol-issues/issues) (were painstakingly migrated from an older bug database). Somewhere there exists some Rebol 2 bugs, but I don't think they're public. I don't think it'd be controversial to reference a Rebol 3 issue in a Red issue if it pertains to some degree of compatibility.

hiiamboris

[19:17](#msg5af49aafb84be71db9f91b4c)@meijeru no I mean I found \*only* the new issue ;)

meijeru

[19:17](#msg5af49accea553a33ea54202f)@rgchris Thank you. I knew all that. In fact, I am using the R3 issues (ex Curecode) to get inspiration for new Red issues. The R3 collection very conveniently has a tag `Red.has.this.too`, so the only question is, have those issues not only been \*detected* in Red by the R3 people, but also \*reported* in the Red issues.

rgchris

[19:18](#msg5af49af9d332ee5fad0b8ef9)I figured you would, just reiterating :)

meijeru

[19:18](#msg5af49b11d332ee5fad0b8f3b)@hiiamboris Yes, that is why the new issue is not a duplicate and can stand. The one about now/time/day can also stand.

rgchris

[19:18](#msg5af49b225e8e2175e25710ec)I think the `red.has.this.too` has not been cross-posted. Is just an observation, as I understand it.

9214

[19:19](#msg5af49b36b84be71db9f91c73)@meijeru given the hostility of this tag maintainer, I doubt any of them were reported.

meijeru

[19:19](#msg5af49b52d332ee5fad0b903a)@rgchris It is funny, there must be ex-Curecode issues that I reported myself. Not sure how I can filter those in the Github version...

[19:20](#msg5af49b8352194a4a67d634bb)But that would be mainly for nostalgia. I am not looking at R3 anymore. Too much to do in Red!

9214

[19:21](#msg5af49bc2ea553a33ea54254e)@greggirwin :point\_up: I think it's a nice idea for a bounty - skim through R3 issues, test them in Red \*and* report on our issue tracker.

rgchris

[19:21](#msg5af49bc6e0b50c2d05b1c577)@9214 Not to delve into the politics of the thing, I believe the tag is both for observational purposes and for the information of anyone on the Red side. I'm not certain the migrated issues repository is on the radar of Red devs though.

[19:23](#msg5af49c21f04ce53632c9da0b)Red's behaviour is a data point for the developer of, em, a certain Rebol 3 fork that shall not be mentioned.

9214

[19:23](#msg5af49c39862c5e33e925c416)Voldefork!

meijeru

[19:24](#msg5af49c775a1d895fae2e07c9)My two most recent issues are examples of bounty hunting. Unfortunately I lack the time to do this more systematically.

[19:26](#msg5af49cd1b84be71db9f92289)@9214 :clap:

9214

[19:28](#msg5af49d4cd245fe2eb79ee0c9)Additionally, if there are any noteworthy and interesting design decisions among these ticket (and even in \[\*humphmhmphm\*](https://www.youtube.com/watch?v=rWBntJAvTmY)), they can be collected in \[REP](https://github.com/red/REP) wiki/tracker for future reviews and discussions.

## Friday 11st May, 2018

9214

[00:20](#msg5af4e1d9bd10f34a68f283dc)There are some issues with new GUI console and UTF, see:  
\* https://gitter.im/red/help?at=5af4e0eab84be71db9f9f794  
\* https://gitter.im/red/help?at=5af4e138862c5e33e9269521

ne1uno

[15:43](#msg5af5ba255666c42eb60354a9)is nobody else having problems building old gui console? win7 seems to be after this comment, timer changed from integer to pointer/handle FIX: uses non-zero uIDEvent argument in SetTimer according to the document. #6fdf75bb

greggirwin

[20:48](#msg5af6019f5a1d895fae3274f9)Certainly issue research and tracking is bounty worthy.

[20:49](#msg5af601e89ad18967b9db6128)I haven't tried building the old GUI console in some time @ne1uno. What is the exact problem/error?

ne1uno

[20:53](#msg5af602d6f04ce53632ce6080)I'm also having a weird problem with an atomic clock program I've been running for years, that and nobody reporting a problem in the last week has me wondering if it's just me

[20:53](#msg5af602dd1cfca775e100c1b8) \*\** Compilation Error: argument type mismatch on calling: exec/gui/KillTimer

[20:53](#msg5af602dd2df44c2d061ed970) \*\** expected: \[integer!], found: \[pointer! \[integer!]]

[20:53](#msg5af602dd5e8e2175e25b86a4) \*\** in file: %/c/c/Lang/red-lang/red/red-master/environment/console/GUI/old/windows.reds

[20:54](#msg5af6031b1cfca775e100c28f)I tried a simple change back to timer: integer! but that wasn't enough

greggirwin

[20:56](#msg5af6038e1cfca775e100c3cf)@ne1uno I am slammed at the moment. If @qtxie (also slammed) doesn't jump in with a quick idea or fix, maybe @9214 can assist. Seems like maybe a small change, and just not caught if automated builds aren't running against the old console. @rebolek's builds might also offer clues. Thanks for narrowing it down where you have so far.

ne1uno

[20:57](#msg5af603d62df44c2d061edbd0)rebolek server is on a rebuild. wasn't able to confirm or deny a problem

greggirwin

[20:58](#msg5af60403b84be71db9fd82c8)Ah, right.

gltewalt

[21:35](#msg5af60c9c5666c42eb60477c6)is that a local variable? `/local [pointer! [integer!]]`

9214

[22:03](#msg5af6133dd245fe2eb7a388a5)@greggirwin assuming that `handle!` is just a shortcut to integer pointer, second `timer` argument in two `KillTimer` calls should be patched to `timer/value`. I applied this fix and successfully compiled old console on Win7, after seeing the same error @ne1uno posted above.

[22:04](#msg5af61350e0b50c2d05b66282)Should I PR a fix for @qtxie to review?

greggirwin

[22:04](#msg5af61369e0b50c2d05b662b8)Yes please! Thanks!

9214

[22:06](#msg5af613cde1cf621dba121ad0)https://github.com/red/red/pull/3387

ne1uno

[23:11](#msg5af62327a2d951363332a6bc)thanks all\*, builds ok now latest commit, some programs run, there may still be a silent exit problem if timer is used?

## Saturday 12nd May, 2018

ne1uno

[00:12](#msg5af63181a2d951363332c74b)not sure what it is now, only one program crashes, other programs with timers work.

## Sunday 13th May, 2018

9214

[13:57](#msg5af844511cfca775e105c835)

```
text
>> ? +
USAGE:
     value1 + value2

DESCRIPTION: 
     Returns the sum of the two values. 
     + is an op! value.

ARGUMENTS:
     value1       [number! char! pair! tuple! vector! time! date!] 
     value2       [number! char! pair! tuple! vector! time! date!] 

RETURNS:
     [number! char! pair! tuple! vector! time! date!]

>> ? is
*** Script Error: is operator is missing an argument
*** Where: catch
*** Stack:
```

hiiamboris

[15:17](#msg5af856f0e0b50c2d05bb6d07)@9214 yeah this thing caught me once too :)  
when you specify an operator with a left arg type of lit-word! or get-word! the operator (`is`) takes precedence over func `?`

9214

[15:18](#msg5af85751f04ce53632d3963d)@hiiamboris yup.

hiiamboris

[21:03](#msg5af8a83a52194a4a67e0b56b)@greggirwin can you reopen this https://github.com/red/red/issues/3369 ?

greggirwin

[21:06](#msg5af8a8e041f54f22e227baf5)Done.

hiiamboris

[21:06](#msg5af8a8f22df44c2d06250150)thanks

[21:07](#msg5af8a92de0b50c2d05bc4cb6)@greggirwin you can decide the desired behavior there btw, as I'm not the authority to do so ;)

greggirwin

[22:41](#msg5af8befce0b50c2d05bc84b9)I've been trying, unsuccessfully, to make time to get through more tickets. :^)

[22:41](#msg5af8bf25a2d9513633389953)Those things that take time to think about deserve deeper effort.

## Monday 14th May, 2018

hiiamboris

[07:10](#msg5af9367d52194a4a67e1fef0)@greggirwin No problem, we'll remind you some other time :) Meanwhile @bitbegin will be able to fix all the more obvious parts.

nedzadarek

[11:54](#msg5af97900bd10f34a68fe9a53)With object ownership (reactors), index/part isn't set to -1 (\[/red/help's discussion](https://gitter.im/red/help?at=5af97427bd10f34a68fe8752) ):  
&gt; When modifications affect several non-contiguous or all elements, index will be set to -1.

I've tried `trim/all` and `clear` but in both cases `index: 0`.

&gt;When modifications affect an undetermined number of elements, part will be set to -1.

With, again, `trim/all` `part: 0`.  
ps. \[source](https://www.red-lang.org/2016/03/060-red-gui-system.html)

hiiamboris

[19:59](#msg5af9ea9a52194a4a67e4df26)do you find this consistent?

```
>> "a" = "A"
== true
>> #"a" = #"A"
== false
```

9214

[20:01](#msg5af9eb24e0b50c2d05c06f58)@hiiamboris yes, because string comparison is case-insensitive, while chars represent different UTF codepoints.

[20:01](#msg5af9eb352df44c2d0629280d)it's like comparing two different integers and expecting them to be the same.

greggirwin

[20:02](#msg5af9eb4652194a4a67e4e121)@9214 +1

hiiamboris

[20:02](#msg5af9eb565a1d895fae3cb18c)well, to me #"a" doesn't look like an integer, but as an UTF code point

[20:03](#msg5af9eb7452194a4a67e4e228)which, like you said, can be compared with case in consideration

greggirwin

[20:03](#msg5af9eb75e1cf621dba1c2318)That's what he said, simile aside.

[20:03](#msg5af9eb7bf04ce53632d89533):^)

9214

[20:03](#msg5af9eb845666c42eb60e8de7)

```
text
>> to integer! #"a"
== 97
>> to integer! #"A"
== 65
>> #"A" + 1
== #"B"
```

hiiamboris

[20:04](#msg5af9ebc6e1cf621dba1c23b9)yeah I know the arithmetic, I'm just pointing out that == and = behavior on chars and strings is \*surprisingly* different

greggirwin

[20:04](#msg5af9ebd7b84be71db907b658)Only the first time. :^)

hiiamboris

[20:04](#msg5af9ebe2e1cf621dba1c2405)mkay :)

9214

[20:04](#msg5af9ebe31cfca775e10ae99c)Uhm, what `==` has to do with it?

hiiamboris

[20:05](#msg5af9ebf09ad18967b9e599e1)`==` is case-sensitive on strings

9214

[20:05](#msg5af9ec055666c42eb60e902c)Now that's strange.

[20:05](#msg5af9ec0ed332ee5fad1a4dbf)@greggirwin :point\_up: is it expected?

greggirwin

[20:05](#msg5af9ec201cfca775e10aeb49)Yes, by design.

9214

[20:06](#msg5af9ec3952194a4a67e4e606)@gltewalt :point\_up: don't forget to note this.

hiiamboris

[20:07](#msg5af9ec7f8c24fe61eae4d5ac)so how do I compare strings char by char then? by uppercasing both chars? can I be \*sure* it will yield the same result that `string1 = string2` yields?

greggirwin

[20:07](#msg5af9ec9ab84be71db907b97a)One of those subjective design judgement calls. Works well in practice, but agreed that we should note it, as both case and string sub-type trigger inequality.

[20:08](#msg5af9ecd741f54f22e22bdf3d)Make each char a string with just that char in it, then they compare as strings.

hiiamboris

[20:09](#msg5af9ecf49ad18967b9e59e51)right! :)

[20:09](#msg5af9ed128c24fe61eae4d848)awkward but reliable

greggirwin

[20:10](#msg5af9ed1e8c24fe61eae4d852)And you can make it pretty efficient, too, if you care. ;^)

gltewalt

[20:11](#msg5af9ed5b2df44c2d06292fe3)Are there helper funcs that handle the differences already? Like same? or equal?

9214

[20:11](#msg5af9ed831cfca775e10af087)`same?` is `=?`, `equal?` is `=`.

greggirwin

[20:11](#msg5af9ed84bd10f34a68008163)`==` is `strict-equal?` already.

gltewalt

[20:11](#msg5af9ed89a2d95136333ca701)(I could look, but - on mobile)

greggirwin

[20:12](#msg5af9ed9d5666c42eb60e9547)Whew! I was slow but gave a complementary answer. ;^)

[20:13](#msg5af9ede02df44c2d062931b6)String processing is worth some good docs, as you can, and may need to, do things a bit differently in Red.

gltewalt

[20:13](#msg5af9ede15a1d895fae3cbc69)That’s fairly straightforward.

hiiamboris

[20:17](#msg5af9eede1cfca775e10af721)`same-letter?: func [a [char!] b [char!]] [ (head change "" a) = (head change "" b) ]` should efficient enough I guess

BeardPower

[20:44](#msg5af9f53a5666c42eb60eb172)Or use xor.

hiiamboris

[20:50](#msg5af9f6b0bd10f34a6800a52c)@BeardPower :confused: like how?

BeardPower

[20:52](#msg5af9f71552194a4a67e50ea2)@hiiamboris

```
a: "test"
a/1 xor a/4 = #"^@"
```

hiiamboris

[20:53](#msg5af9f7515666c42eb60ebaa2)but no case-insensitivity this way?

BeardPower

[20:54](#msg5af9f78641f54f22e22c088a)no, you need to change them to lowercase/uppercase first or use an additional or

hiiamboris

[20:56](#msg5af9f7eb9ad18967b9e5cb58)this is too extremist! :D esp. the or-way

BeardPower

[20:56](#msg5af9f8049ad18967b9e5cb9c)

```
(lowercase a/1) xor (lowercase a/4) = #"^@"
```

[20:57](#msg5af9f8395666c42eb60ebfb1)Sure, that's why this is enough:

```
(lowercase a/1) = (lowercase a/4)
```

hiiamboris

[20:58](#msg5af9f8752df44c2d06295650)I'm not sure though if `a = b` is equivalent to `(lowercase a) == (lowercase b)`

[20:59](#msg5af9f894bd10f34a6800aad4)Unicode scares me sometimes :D

BeardPower

[20:59](#msg5af9f8a05a1d895fae3ce266)It is, because = is not a strict comparison.

[20:59](#msg5af9f8ace0b50c2d05c0a426)== is a strict comparison.

[21:00](#msg5af9f8dfbd10f34a6800ab59)= is a case-insensitive comparison, == is a case sensitive one.

[21:02](#msg5af9f96ba2d95136333cd4b9)To get the best performance, you need to use XOR, CMP, SUB or TEST.

[21:02](#msg5af9f9795a1d895fae3ce587)And use the zero flag of the CPU.

hiiamboris

[21:03](#msg5af9f9aca2d95136333cd558)yeah, after looking up the source of `string/equal?` I agree, `lowercase` should work  
not sure if xor will matter on the Red (not R/S) level :)

BeardPower

[21:04](#msg5af9f9d68c24fe61eae50d40)It depends if you want to prevent timing attacks of your code.

[21:07](#msg5af9faa11cfca775e10b21a0)Or swapping the contents of some "variable" without an intermediary.

[21:10](#msg5af9fb361cfca775e10b2396)

```
>> a: "a"
== "a"
>> b: "b"
== "b"
>> a: a xor b
== "^C"
>> b: b xor a
== "a"
>> a: a xor b
== "b"
>> a
== "b"
>> b
== "a"
```

[21:14](#msg5af9fc37d245fe2eb7adf4f6)You can also use or instead of the char from above (#"^@"):

```
b = ((a xor b) or b)
```

[21:15](#msg5af9fc77e0b50c2d05c0b44a)Or just:

```
to logic! ((a xor b) or b)
```

[21:16](#msg5af9fcb09ad18967b9e5dd46)Or just:

```
to logic! a xor b
```

hiiamboris

[21:18](#msg5af9fd3a41f54f22e22c1ba2)@BeardPower

```
swap1: func ['a 'b] [set a (get a) xor (get b)  set b (get b) xor (get a)  set a (get a) xor (get b)]
swap2: func ['a 'b] [set a also get b set b get a]
x: 1 y: 2
clock [swap1 x y]
clock [swap2 x y]
clock [(lowercase #"t") xor (lowercase #"T") = #"^@"]
clock [to logic! (lowercase #"t") xor (lowercase #"T")]
```

```
0:00:00.589000001 [swap1 x y]
0:00:00.287000001 [swap2 x y]
0:00:00.156000001 [(lowercase #"t") xor (lowercase #"T") = #"^@"]
0:00:00.184000001 [to logic! (lowercase #"t") xor (lowercase #"T")]
```

The Theory won't work on an interpreter :(

BeardPower

[21:22](#msg5af9fdff5666c42eb60ed61d)Why would it not work on an interpreter?

hiiamboris

[21:23](#msg5af9fe35d245fe2eb7adfc0a)because :point\_up: of the benchmarks: the less tokens you use the better

BeardPower

[21:23](#msg5af9fe60d245fe2eb7adfcb5)It works, just at different speed.

hiiamboris

[21:25](#msg5af9fecd5a1d895fae3cfbe8)you mean it works in negative time scale? ;)

BeardPower

[21:27](#msg5af9ff5ef04ce53632d8e345)No, it just works. I never was saying it's the fastest :-)

hiiamboris

[21:28](#msg5af9ff8fa2d95136333ce95c)I see :)

BeardPower

[21:29](#msg5af9ffaea2d95136333ce9d2)Try it with R/S :-)

[21:30](#msg5af9fff15a1d895fae3cffc5)Do you want/need the best performance?

[21:30](#msg5afa000f52194a4a67e530e0)I dont't like the set/get way. It's less readable.

hiiamboris

[21:31](#msg5afa00315666c42eb60edd5d)Totally!

[21:32](#msg5afa005fa2d95136333ceb98)let's go to chit-chat though :)

BeardPower

[21:32](#msg5afa006a52194a4a67e5331d)Instead of a: also :b b: a

[21:32](#msg5afa007abd10f34a6800c4fb)Sure.

## Friday 18th May, 2018

rebolek

[08:45](#msg5afe928fe1cf621dba2c021b)

```
>> do/args %red.r "-r environment/console/CLI/console.red" 
Script: "Red command-line front-end" (none)

-=== Red Compiler 0.6.3 ===- 

Compiling /home/sony/Code/red/environment/console/CLI/console.red ...
*** Red Compiler Internal Error: Script Error : repend expected series argument of type: series port 
*** Where: comp-func 
*** Near:  [repend shadow-funcs [
decorate-func/strict name 
shadow: to-context-spec symbols 
ctx 
spec
] 
bind-function body
]
```

PeterWAWood

[08:51](#msg5afe94231cfca775e11b33d4)@rebolek The CLI console compiles on macOS

rebolek

[08:52](#msg5afe943fd245fe2eb7bddfc0)@PeterWAWood this is on Linux

[08:52](#msg5afe94659ad18967b9f5fdcb)I was able to cross-compile GUI console for Windows on Linux, but with CLI console, I got this error

[08:55](#msg5afe94e88c24fe61eaf51bd1)When I checked out `cec0793`compilation works again, so it must be recent problem.

PeterWAWood

[08:55](#msg5afe9514f04ce53632e8ff3c)I just tried on Ubuntu32 with the latest commit:

```
-=== Red Compiler 0.6.3 ===- 

Compiling /media/sf_VMShare/Red/red/environment/console/CLI/console.red ...
...compilation time : 1235 ms

Target: Linux 

Compiling to native code...
...compilation time : 34717 ms
...linking time     : 583 ms
...output file size : 995936 bytes
...output file      : /media/sf_VMShare/Red/red/console
```

[08:56](#msg5afe9557bd10f34a6810c77e)This commit commit 1fd3e99c516a900d562ad9a7744e0c74b5e2613d

rebolek

[08:57](#msg5afe956d2df44c2d06398f9c)@PeterWAWood strange, I can compile `HEAD` now too. I've restarted Rebol 3 times before posting this, to be sure...  
Probably some Heisenbug...

PeterWAWood

[08:57](#msg5afe958341f54f22e23c1e98)... worrying!

rebolek

[08:58](#msg5afe95ad2df44c2d06399025):ghost:

PeterWAWood

[08:59](#msg5afe95df5666c42eb61ef112)Though perhaps it is a Heisenbug in Rebol.

## Saturday 19th May, 2018

9214

[12:29](#msg5b0018b08c24fe61eaf9dd02)@dockimbel I'm probably doing something stupid

```
r: make object! [
	a: [1 2 3]
	b: [4 5 6]

	on-deep-change*: func [owner word target action new index part][
		print ['on-deep-change* tab word]
	]

	on-change*: func [word old new][
		print ['on-change* tab word]

		modify old 'owned none
		modify new 'owned reduce [self word]
	]
]

reverse/part r/a 2
r/a: [3 2 1]
probe r

reverse/part r/a 2
```

```
*** Runtime Error 1: access violation
*** at: 0807DCF5h
```

dockimbel

[15:35](#msg5b00445b52194a4a67fa47c4)@9214 Worth a ticket for investigating.

BeardPower

[15:41](#msg5b0045a852194a4a67fa4b1b)@9214 A great language should never throw a segfault, despite doing the most stupid things.

dockimbel

[15:42](#msg5b0045ccbd10f34a6815e466)Yep, native crashes from Red should be systematically reported for investigation.

9214

[15:42](#msg5b0045dd5666c42eb6241ac4)Is that a milltalk or a moontalk, can't figure out? :smirk:

BeardPower

[15:42](#msg5b0045f4d332ee5fad2fd2a8)Millmoon or Moonmill :smile:

9214

[15:47](#msg5b0046f7e0b50c2d05d62af5)@dockimbel done https://github.com/red/red/issues/3393, let me know if you need a smaller example or more details.

[15:47](#msg5b00470e2df44c2d063ecb9d)By the way, are there any docs on `modify`, e.g. what fields in aggregate structure can be modifed?

[15:49](#msg5b0047985666c42eb6241e6e)Its spec is a bit off though:

```
...
RETURNS:
     [map! file!]
```

dockimbel

[17:25](#msg5b005e138c24fe61eafaa052)@9214 You need to look at the source code of `modify` action for that. It's a WIP feature. I want to use it for providing write access to some datatypes internal properties. For example, ability to set the internal encoding of a `string!` (to shrink it when possible).

9214

[17:26](#msg5b005e50d332ee5fad3013c8)I see, that would be very interesting to have.

dockimbel

[17:28](#msg5b005ea052194a4a67fa9190)I would need to write a spec document about those internal properties, and their accessors. I'm waiting for ports to be implemented to do that, as they will be exposing the most properties.

BeardPower

[20:42](#msg5b008c302df44c2d063f7f9f)Woohoo! Ports... yummy.

## Monday 21st May, 2018

gltewalt

[19:58](#msg5b0324eb2df44c2d0646d0f4):question:

```
>> max 1.2.3 1.2.3.4
*** Script Error: value out of range: 1.2.3.4
*** Where: max
*** Stack:

>> max 1.2 1.2.3.4
== 1.2.3.4
```

meijeru

[20:23](#msg5b032aab1cfca775e128825d)`max` and `min` when applied to two `tuple!` arguments require tuples of the same size, in other words the comparison is not based on lexicographic ordering, in contrast to `>` and `<` for tuples. I think this is a missed opportunity and worth a WISH.

[20:26](#msg5b032b5de1cf621dba3907b4)On the other hand, `max` and `min` may be applied to a tuple and a float or integer, with the float converted to integer first, and then it is compared to each of the elements of the tuple. Is this useful, I wonder?

BeardPower

[20:26](#msg5b032b742df44c2d0646e791)This does not explain, why the latter is working, as the tuples are not the same size. It's more of tuples need to be a multiple of each other.

meijeru

[20:28](#msg5b032be22df44c2d0646ea00)The latter is not a comparison of tuples, since `1.2` is a float, and not a tuple.

BeardPower

[20:29](#msg5b032c20f04ce53632f64451)Then it should not return the 1.2.3.4 tuple as a max.

meijeru

[20:30](#msg5b032c5452194a4a6702533e)Yes it should, because it compares each of the elements of the tuple to `1` and takes the max; all four tuple elements are `>= 1`

[20:30](#msg5b032c73b84be71db925290b)I repeat: this is the way it is; whether that is useful is another question.

[20:32](#msg5b032cd0677d792bd1a479dd)Example: `max 2 1.2.3.4 ; == 2.2.3.4`

BeardPower

[20:39](#msg5b032e6ad245fe2eb7cae5af)Sure.

meijeru

[20:41](#msg5b032ef341f54f22e24985a2)For the first case, I have formulated an issue rather than a wish, see #3395

hiiamboris

[20:55](#msg5b03324f5a1d895fae5a3ffa)don't you think that `1.1.1 = min 1.2.3 1` is kinda weird and unexpected? even the hypothesis that `min` of 2 values should return one of these values: `not none? find [p q] min p q` is broken by it

[20:56](#msg5b03329841f54f22e2499222)I mean if we put aside how it's currently done for a moment and think on the rationale?

[21:01](#msg5b03339fe1cf621dba39288b)and are there any other cases where `r = min p q` and `true = all [p <> r r <> q]`?

[21:05](#msg5b033487d332ee5fad37f719)okay, pairs here too, and pairs break the `if p >= q then (max p q) = p` logic:

```
>> 0x1 > 1x0
== true
>> max 0x1 1x0
== 1x1
```

gltewalt

[21:41](#msg5b033d1b2df44c2d064729b5)I think it’s weird, but I’ve been struggling and I’ve forgotten plo

[21:41](#msg5b033d1e9ad18967b903c10e)Plenty

greggirwin

[23:42](#msg5b0359735666c42eb62cb82d)@dockimbel needs to say whether it's intentional. If we use tuples in non-traditional ways, e.g. I've used them to store dates, it might be useful. It could also just be a logic path that slipped through.

## Tuesday 22nd May, 2018

hiiamboris

[08:05](#msg5b03cf3141f54f22e24b4f25)wow look what I've discovered:

```
>> 1.0 < 1.#nan
== true
>> 1.#nan > 1.0
== false
```

rebolek

[08:08](#msg5b03cffc1cfca775e12a6a1f)Interesting, in a slightly older console it throws an error.

bitbegin

[08:24](#msg5b03d3d452194a4a67043477)

```
>> a: #(b: true)
== #(
    b: true
)
>> a/b
== true
>> type? a/b
== word!
```

rebolek

[08:25](#msg5b03d3eebd10f34a681fe75a)@bitbegin that's not a bug.

bitbegin

[08:25](#msg5b03d3f7d332ee5fad39c88e)`type? a/b` should be logic?

[08:25](#msg5b03d4115a1d895fae5c111c)but i want to use logic in map!

rebolek

[08:26](#msg5b03d423e0b50c2d05e0764a)`true` is a `word!` that gets evaluated to `logic!` value. However when you are constructing `map!`, that word is not evaluated.

meijeru

[08:26](#msg5b03d42dbd10f34a681fe886)"It is not a bug, it is a feature". For logic, use `#[true]`.

rebolek

[08:26](#msg5b03d44fb84be71db9272356)

```
>> type? true
== logic!
;; evaluated
>> type? first [true]
== word!
;; not evaluated
```

bitbegin

[08:27](#msg5b03d474d245fe2eb7ccc90d)

```
>> a: #(b: #[true])
== #(
    b: true
)
>> type? a/b
== logic!
```

rebolek

[08:27](#msg5b03d4885666c42eb62e2a85):+1:

bitbegin

[08:27](#msg5b03d489d332ee5fad39cac8)@rebolek @rebolek thanks

hiiamboris

[10:26](#msg5b03f038b84be71db92792f7):) looks like \*\*everyone\** asks this question at some point

[10:27](#msg5b03f07fbd10f34a682057d6)is there a wiki page for all the unexpected things?

rebolek

[10:28](#msg5b03f0c4a2d95136335ce819)I'm not sure. It probably depends on your definition of unexpected :smirk:

hiiamboris

[10:28](#msg5b03f0e35666c42eb62e9e8c)if everyone asks the same question, it means no one expected that, right? ;)

[10:35](#msg5b03f261b84be71db9279f72)like what kind of sorting is this:

```
>> sort/reverse [1.#inf 1.0 1.#nan 0.0 -1.#inf]
== [1.#INF 1.0 1.#NaN 0.0 -1.#INF]
>> sort [1.#inf 1.0 1.#nan 0.0 -1.#inf]
== [1.0 1.#INF 1.#NaN -1.#INF 0.0]
```

rebolek

[10:37](#msg5b03f2e2bd10f34a68206420)I'm not sure if there are defined rules in Red for handling comparison, sorting, etc of infinities and NaNs. You should report it, I guess.

hiiamboris

[10:38](#msg5b03f32e41f54f22e24be393)yeah I get it, I just haven't set my mind on the scale of the problem and the number of tickets... still exploring, breaking things :)

[14:08](#msg5b0424721cfca775e12bd4de)they have this bug since 2014!!! https://github.com/red/red/issues/847 :)

endo64

[15:28](#msg5b04371a5666c42eb62fdf1f)@hiiamboris It is a low priority issue

9214

[15:31](#msg5b0437b95666c42eb62fe258)Based on @rebolek and @qtxie comments, I'd say that it's either this or an uncaught regressions.

[15:44](#msg5b043ae041f54f22e24d2f29)&gt; they have this bug since 2014

Which tells me that floats are nightmare to implement and support properly (and on multiple architectures) by a team of 2 (1?) people.

hiiamboris

[16:02](#msg5b043f27a2d95136335e48b1)yeah, NaNs are tricky  
I once asked Carl to implement them, he refused as it required literals (1.#nan, 1.#inf)  
it's already great that we have the literals in Red, and quiet NaN arithmetic, which is a life-saver in scientific programming

9214

[16:04](#msg5b043f8f2df44c2d064abace)@hiiamboris

&gt; Carl

so you're Rebol old-timer?

hiiamboris

[16:06](#msg5b044023d332ee5fad3b98ae)I wasn't deeply into Rebol, just wrote some program on it at the time of it's decline

[16:07](#msg5b044050677d792bd1a85381)I was then interested in D more, but then they invented D2 and I wasn't interested anymore ;)

rebolek

[16:19](#msg5b04432fd245fe2eb7cea5c3)@hiiamboris this is theme more related for chit-chat group, but what do you dislike about D2?

gltewalt

[20:02](#msg5b047770a2d95136335f2be2)mod and modulo should work

```
>> mod 1.2.3 4.5.6
*** Script Error: cannot compare 1.2.3 with 0
*** Where: <
*** Stack: mod

>> modulo 1.2.3 4.5.6
*** Script Error: absolute does not allow tuple! for its value argument
*** Where: absolute
*** Stack: modulo mod

>> help mod
USAGE:
     MOD a b

DESCRIPTION:
     Compute a nonnegative remainder of A divided by B.
     MOD is a function! value.

ARGUMENTS:
     a            [number! char! pair! tuple! vector! time!]
     b            [number! char! pair! tuple! vector! time!] "Must be nonzero."

RETURNS:
     [number! char! pair! tuple! vector! time!]

>> help modulo
USAGE:
     MODULO a b

DESCRIPTION:
     Wrapper for MOD that handles errors like REMAINDER. Negligible values (com
ared to A and B) are rounded to zero.
     MODULO is a function! value.

ARGUMENTS:
     a            [number! char! pair! tuple! vector! time!]
     b            [number! char! pair! tuple! vector! time!]
```

meijeru

[20:31](#msg5b047e3c6309af743d06641c)Known bug, see #2674 and #2997

## Wednesday 23th May, 2018

bitbegin

[11:04](#msg5b054aa7d96cfd743eb457c1)found an issue about put on map!

[11:04](#msg5b054ab03815f70bffd050e7)

```
>> a: #()
== #()
>> put a 'b 1
== 1
>> a
== #(
    b: 1
)
>> clear a
== #()
>> put a "b" 1
== 1
>> a
== #(
    "b" 1
)
>> clear a
== #()
>> put a 'b 1
== 1
>> a
== #()
>>
```

rebolek

[11:06](#msg5b054b44d96cfd743eb459a4)@bitbegin Nice! But I think it's `clear` issue, I can trigger same bug without `put`:

```
>> a: #()
== #()
>> a/b: 1
== 1
>> clear a
== #()
>> a/("b"): 1
== 1
>> clear a
== #()
>> a/b: 1
== 1
>> a
== #()
```

bitbegin

[11:33](#msg5b055191fb0f4a0bfe63c3c1)@rebolek yes. clear bug

qtxie

[14:45](#msg5b057e759ed336150ea4993a)@bitbegin Please open a ticket for it.

## Thursday 24th May, 2018

bitbegin

[01:56](#msg5b061bdcee623e2e41fb77cc)done

greggirwin

[21:57](#msg5b073553752aff5931119c8a)@hiiamboris, regarding the `map!` behavior, it's doc'd on https://doc.red-lang.org/en/map.html.

[21:58](#msg5b073583752aff5931119cd4)We can't say that everyone found it unexpected, because all those who expected it didn't mention it. :^)

hiiamboris

[22:15](#msg5b07396e60209a1187e016f9)@greggirwin no I mean almost everyone confuses words \*true\*, \*false* and \*none* with their evaluated equivalents, but I myself was once confused by switch not evaluating it's key arguments (`switch type? x [integer! [...]]` case of mistake), which was maybe a misremembering, but still is closely related, and I've seen people trip on `switch` behavior and ask the same question a few times on my memory :)

greggirwin

[22:16](#msg5b0739daaaafa25932b3a8bd)Sure. We all trip over evaluation at times. Life with Red.

hiiamboris

[22:17](#msg5b073a0bd96cfd743ebb802e)it's not about a `map!`, not even about mentioning evaluation rules somewhere, but about a need to make it clearly visible for the newcomers, so they can shortly develop a \*habit* of looking at these things in a proper way :)

[22:19](#msg5b073a7bee623e2e41ff97ff)we should ask @9124 probably how many times he explained evaluation to someone

greggirwin

[22:27](#msg5b073c3f96af8f1186ca253d)Do you have a concrete improvement to suggest? The problem is making it clearly visible.

## Friday 25th May, 2018

hiiamboris

[07:08](#msg5b07b66ba7abc8692ee1d19c)@greggirwin maybe a FAQ? link in the topic of help/welcome? the classic way, you know...

toomasv

[10:57](#msg5b07ec06160c567d16d7fc07)Seems to be regression in `event/away?`. In later builds, when mouse is moved into a face three events are generated for `event/away?`: `false`, `true`, `false`. Moving out is correct. In stable build events are correct. If face is transparent events are generated as if `all-over` was declared in later builds. Stable build is correct in this regard also.

Left gif shows stable build behaviour, right gif shows latest build.  
\[!\[event/away?](http://vooglaid.ee/red/event-away.gif)](http://vooglaid.ee/red/event-away.gif)  
Code:

```
i: 0 view [size 150x150 base 100x100 on-over [prin event/away? print ["" i: i + 1]]]
```

[11:20](#msg5b07f178edd06f7d15e1c21d)Ah, with transparency `true` and `false` events are generated continuously  
\[!\[event/away? 2](http://vooglaid.ee/red/event-away2.gif)](http://vooglaid.ee/red/event-away2.gif)

```
i: 0 view [size 150x150 box 100x100 on-over [prin event/away? print [i: i + 1]]]
```

endo64

[14:09](#msg5b08191fedd06f7d15e2632f)@toomasv Is your screen display scaled?

[14:11](#msg5b081976016ae21a4ce3413d)I had a similar issue, I put a base face on a window set it loose so it can be dragged by mouse, but sometime I cannot drag it, then I realized that it happens only if my display scaled on Windows, like %125.

toomasv

[14:16](#msg5b081aafba1a351a68c30ee9)@endo64 It is not as far as I know. Does it mean this problem does not appear on your screen? I use W10. And if it is about scaling then why does stable build work as expected, but new one not?

hiiamboris

[14:40](#msg5b08207ba7abc8692ee37ba0)I see the 1st issue on W7 (no aero) with both transparent and opaque color, but 2nd example does not trigger any events at all unless I specify a (non-transparent) color.

toomasv

[15:58](#msg5b08328ba7abc8692ee3cae4)@hiiamboris But it should work like this (stable version) with `box`  
\[!\[event/away? 3](http://vooglaid.ee/red/event-away3.gif)](http://vooglaid.ee/red/event-away3.gif)

hiiamboris

[17:11](#msg5b0843d2352b9e1a4b31cf26)@toomasv stable: no events on W7 (again, unless I specify the color)

greggirwin

[18:10](#msg5b085182ba1a351a68c3e6c6)@hiiamboris room topic doesn't seem like the right place to mention tech details. But feel free to add a section to https://github.com/red/red/wiki/FAQ.

[18:12](#msg5b08520cc712f56125319dec)@toomasv please open a ticket for @qtxie, or post a note in red/gui-branch and link to your example here. Dupes here, and your example is great.

toomasv

[18:17](#msg5b085332016ae21a4ce423d2)@greggirwin Ok, thanks

## Saturday 26th May, 2018

qtxie

[07:37](#msg5b090eb7ba1a351a68c5e5f2)@toomasv I fixed the hover issue on non-transparent window.

toomasv

[08:20](#msg5b0918d7ba1a351a68c5fb77)@qtxie Thanks!

9214

[16:02](#msg5b098521361a950a66195fcc)I have noticed that evaluating any expression in the new console that was idle for a while results in a crash. @greggirwin I believe you reported something similar recently?

greggirwin

[17:40](#msg5b099c0fb6eece791db5dece)My issues with the console crashing all seem related to the system sleeping and changing display settings. Could be the same root cause. All on Windows for me.

luce80

[17:41](#msg5b099c67ba1a351a68c76447)On R2 and R3

```
>> type? do func [][1]
== integer!
```

on Red

```
>> type? do func [][1]
== function!
```

greggirwin

[17:47](#msg5b099d9454ce231361588872)@luce, would you please add that to https://github.com/red/red/wiki/Differences-between-Red-and-Rebol ?

[17:48](#msg5b099e06016ae21a4ce7940c)It will probably generate a flurry of discussion in any case. :^)

luce80

[17:50](#msg5b099e5cb6eece791db5e59f)@greggirwin Is it really by design?

meijeru

[17:50](#msg5b099e81a45f930a65d8fd22)I don't think it's a feature, but a bug:

```
>> do func [a][1] 1
== 1
>> do func [][1]
== func [][1]
```

[17:51](#msg5b099eaf54ce231361588b5c)As you see, `do` treats zero-argument functions differently from 1-argument functions

greggirwin

[17:52](#msg5b099eea352b9e1a4b357961)@meijeru, I disagree:

```
>>  do func [a][1] 2
== 2
```

meijeru

[17:53](#msg5b099f1793dc78791c89daac)I stand corrected for my example, it was not discriminating enough. But the worry about feature/bug subsists.

toomasv

[18:01](#msg5b09a104016ae21a4ce79bb2)This behaviour corresponds to the description of `do`

&gt; Evaluates a value, returning the last evaluation result.

luce80

[18:01](#msg5b09a11193dc78791c89e077)A "use" case could be:

```
>> use: func [locals body][do has locals body]
```

greggirwin

[18:03](#msg5b09a17fedd06f7d15e6ca5a)It is by design, from looking at the code.

[18:06](#msg5b09a216361a950a6619b242)That is, from `do` passive evaluation is used for `any-function!` values.

toomasv

[18:06](#msg5b09a22f52e35117cde3827e)

```
>> do [func [][1]]
== func [][1]
>> reduce [func [][1]]
== [func [][1]]
>> do reduce [func [][1]]
== 1
>> reduce reduce [func [][1]]
== [1]
```

greggirwin

[18:10](#msg5b09a31716f6496124e22160)The values that get special treatment by `do` are: `[block! path! string! url! file! error!]` Everything else is evaluated passively.

meijeru

[18:12](#msg5b09a39916f6496124e223d8)Thus it is indeed a feature. One could even claim that R2/3 have it wrong...

[18:13](#msg5b09a3e3a45f930a65d90bf8)Is there a choice to be made between being right and being (backwards compatibly) wrong ?

hiiamboris

[18:27](#msg5b09a709361a950a6619c1f2):point\_up: \[March 21, 2018 7:15 PM](https://gitter.im/red/help?at=5ab285275f188ccc15df954b)  
Doc said the reason behind this was to get rid of variable arity

greggirwin

[18:29](#msg5b09a76d160c567d16dd2d19)&gt; Is there a choice to be made between being right and being (backwards compatibly) wrong ?

Always. :^)

[18:29](#msg5b09a78b160c567d16dd2d3d)Thanks for finding that @hiiamboris ! We can add that to the wiki page.

[18:31](#msg5b09a8074eaffb692d5a16cc)I'll edit the wiki.

meijeru

[18:35](#msg5b09a905a45f930a65d91b60)I agree that the variable arity argument is the best and the easiest to remember!

## Sunday 27th May, 2018

gltewalt

[04:33](#msg5b0a351c16f6496124e36156)

```
>> type? x: to-issue "hi there"
== issue!
>> x
== #hi there
>> #hi there
*** Script Error: there has no value
*** Where: catch
*** Stack:
```

9214

[04:34](#msg5b0a3573ba1a351a68c8bd86)@gltewalt `#hi there` is a syntactically invalid issue, which can be constructed by `to` anyway.

gltewalt

[04:35](#msg5b0a358654ce23136159e593)Yeah, isn't that a bug?

9214

[04:36](#msg5b0a35b6352b9e1a4b36c3d4)I don't think it's a bug per se, just that `to`'s design is not casted in stone.

[04:36](#msg5b0a35c354ce23136159e703)It should get more stricter at some point.

[04:36](#msg5b0a35d0352b9e1a4b36c405)

```
text
>> to path! [[a b] 1]
== [a b]/1
```

gltewalt

[04:37](#msg5b0a3601a7abc8692ee90962)How about:

```
>> type? #HODL,42
== 0.42
>> type? #HODL:42
*** Syntax Error: invalid value at ":42"
*** Where: do
*** Stack: load
```

9214

[04:38](#msg5b0a3640352b9e1a4b36c571)`issue!` isn't a part of `any-string!`, so this one is expected.

[04:38](#msg5b0a3651160c567d16de63f3)I mean, there're some limitations on what characters you can and cannot use.

gltewalt

[04:41](#msg5b0a36f6a45f930a65da5d08)It also terminates the issue if you include a `;`. Should it?

9214

[04:41](#msg5b0a370e016ae21a4ce8e779)?

```
>> #abc;
== #abc
```

[04:41](#msg5b0a3713361a950a661b02aa)`;` is a comment

gltewalt

[04:42](#msg5b0a372ac712f561253661b4)Yeah, but should it be treated as such in an issue!

9214

[04:42](#msg5b0a373dedd06f7d15e818fb)~~No, it shouldn't.~~ Err, I mean it should be treated as a start of a comment.

gltewalt

[04:43](#msg5b0a3759a45f930a65da5e17)

```
>> #a;bc
== #a
```

[04:45](#msg5b0a37ed52e35117cde4d105)Should issue be part of any-string! ?

9214

[04:47](#msg5b0a3855361a950a661b04b6)I don't think so. It's a part of `any-word!` in R3 though.

toomasv

[05:17](#msg5b0a3f53352b9e1a4b36d8d9)@gltewalt Here your earlier nice find comes to help:

```
>> to-issue "HODL:42"
== #HODL:42
>> to-issue "a;bc"
== #a;bc
```

meijeru

[09:04](#msg5b0a74a3a7abc8692ee99cff)Together with `refinement!`, `issue!` is part of `all-word!`which further includes `any-word!`. In Red, the latter is only `make typeset! [word! set-word! lit-word! get-word!]`

greggirwin

[23:51](#msg5b0b4471016ae21a4ceb7bbf)Issues were strings in R2. When Carl changed them to words, I argued against it. I used them as he originally intended, as identifiers (record IDs and such), while he found he used them more as keywords. Nenad followed the change, carefully weighing the tradeoffs, and went with words. There is a big win there, with the downside being that you can't modify them directly, and they will impact symbol table space more. There has also been discussion about whether they could be both. e.g. if they start with a digit, they would be a string type under the hood; otherwise a word. It gets tricky, even if the details are hidden from Red users.

Once I have free time (Hah! I make joke!) and @BeardPower tutors me on datatype creation, I'll push forward with my `ref!` type proposal, which can be a string type.

## Wednesday 30th May, 2018

endo64

[10:56](#msg5b0e8375352b9e1a4b44681f)@qtxie When I type `do-events` alone, on GUI console it stuck in an infinite loop.  
And `*** Script Error: path none is not valid for none! type` on non-GUI console.

qtxie

[11:37](#msg5b0e8d15a45f930a65e81e8d)@endo64 Yes. `do-events` will start an infinite loop.

endo64

[17:12](#msg5b0edb874eaffb692d6a7e38)Can anyone test GUI console on Win 8.1? I have several issues on Win 8.1 which doesn't exists on Win10.

ne1uno

[17:56](#msg5b0ee5d693dc78791c9a369f)@endo64 could it be related to DirextX version? what does dxdiag show?

hiiamboris

[18:40](#msg5b0ef01aa45f930a65e9cb01)@endo64 what needs testing?

endo64

[19:49](#msg5b0f0044edd06f7d15f7d0ec)@ne1uno I'll check dxdiag, it could be it, or may be gfx card / nvidia driver problem.

[19:52](#msg5b0f00faa7abc8692ef8b211)@hiiamboris There is no cursor at all, so you don't see what you are typing. While type the whole window refreshes and weirdly other windows and even task bar refreshes. Scroll with mouse wheel doesn't work at all. Menus cannot opened.

ne1uno

[19:52](#msg5b0f010852e35117cdf44845)dxdiag just shows 11 in win7 so may need some registry key or look at some dll properties to get the exact version. would be useful to know what update version sp1 sp2 etc

endo64

[19:59](#msg5b0f029b99fa7f4c063093af)Tomorrow I'll check versions of all OS related components. And if I can, I'll update and retest. @ne1uno @hiiamboris do you use Win8.1?

hiiamboris

[20:05](#msg5b0f041c52e35117cdf452a7)@endo64 I have w8.1, may run some tests

endo64

[20:06](#msg5b0f044b352b9e1a4b468715)Great, do you see any of the above issues on your PC?

hiiamboris

[20:09](#msg5b0f04fe352b9e1a4b468ae7)&gt; There is no cursor at all  
&gt; Menus cannot opened.

yes, I believe since april it's still not fixed

&gt; whole window refreshes and weirdly other windows and even task bar refreshes  
&gt; Scroll with mouse wheel doesn't work at all

I can't confirm this (29 may autobuild), it's working for me

[20:12](#msg5b0f0590361a950a662ab3b2)interesting, I can open the menu until I execute smth on the console

[20:13](#msg5b0f05cf352b9e1a4b468e73)

```
>> 1
== 1
```

menus still working

```
>> probe 123
123
== 123
```

not anymore

endo64

[20:31](#msg5b0f0a1416f6496124f30db1)Thanks for testing. I'll investigate further and open tickets for them. Just wanted to be sure it is not happening to me only.

hiiamboris

[20:36](#msg5b0f0b4de26c847ac8a42220)I remember there were complaints about the caret issue so there may be some tickets open already

## Thursday 31st May, 2018

hiiamboris

[18:36](#msg5b1040cb361a950a662f019b)Community vote @/all, regarding https://github.com/red/red/issues/3369#issuecomment-388128962  
`a` is a string! `"5678"`, `c` is the same string! buffer at the index 7 (that is set 2 chars behind the series tail). In `change/part c 99 -1` expression the starting index (-1 relative to c) is still behind the tail by 1 char. Should Red first get back to the tail, then offset by -1 (resulting index being 4), or first offset by -1 then check that it's behind the tail and move to the tail (resulting index being 5)? Should the output be `"567899"` or `"56799"`. Which way is more consistent and expected?

9214

[18:42](#msg5b10422d16f6496124f73c52)`56799`

endo64

[21:42](#msg5b106c3d361a950a662f9fdc)@hiiamboris I think resulting index should be 4, Red should first get back to the tail, then offset by -1 .  
And this definitely look like a bug to me:

```
s: "123" c: skip s 10
remove/part s 2
change c "98"
s
; == "32398"
```

## Friday 1st June, 2018

BeardPower

[11:59](#msg5b11350d4eaffb692d7273dd)@endo64 It's definitely a bug. The result should be

```
"398"
```

. Somehow it's skipping back.

[11:59](#msg5b113526352b9e1a4b4ddab3)@greggirwin What do you think?

hiiamboris

[12:27](#msg5b113bccb6eece791dcec0fa)indeed, it's a bug mentioned in the link 3 posts above :)

BeardPower

[12:30](#msg5b113c6dc712f561254d87be)@hiiamboris :+1:

hiiamboris

[12:33](#msg5b113d21b6eece791dcec5dc)@BeardPower what's your vote? :)

BeardPower

[12:34](#msg5b113d6e361a950a66325594)@hiiamboris My vote? It's a bug.

[12:35](#msg5b113d8d160c567d16f56b9f)If the index is more than the amount of elements, it should stay at the tail.

[12:35](#msg5b113d97361a950a6632560f)Like in Rebol.

hiiamboris

[12:36](#msg5b113dbc52e35117cdfbdf94)@BeardPower regarding :point\_up: \[May 31, 2018 9:36 PM](https://gitter.im/red/bugs?at=5b1040cb361a950a662f019b)  
`56799` or `567899`?

BeardPower

[12:39](#msg5b113e9599fa7f4c06380e3d)

```
567899
```

as the index was greater than the elements of the string.

hiiamboris

[12:40](#msg5b113ea852e35117cdfbe2d7):+1:

[12:40](#msg5b113ec2f9f2e56cf231466a)hopefully we'll have more than 3 votes tho :)

BeardPower

[12:42](#msg5b113f42b6eece791dcecf34)But it is the question what is more intuitive, as an index &gt; size of string would be a out of bounds, so it would also make sense to set it to the tail if there is an oob.

[12:45](#msg5b113fea4eaffb692d72a072)If we treat it like an oob, it would be

```
56799
```

, if we treat it like a "memory" index with no oob, it would be

```
567899
```

.

[12:47](#msg5b11404852e35117cdfbe9a0)So the former would be more intuitive, the latter more strict.

toomasv

[12:47](#msg5b114059160c567d16f57777)"56799"

BeardPower

[12:48](#msg5b114094160c567d16f57848)C coder would be fine with the latter, as they are used to shoot themselves in the foot, but users of other languages with save-guards prefer the former.

[12:49](#msg5b1140dae26c847ac8ab9ab2)Is the string zero-terminated? Auto-managed? Is it's buffer bigger than the stored elements?

toomasv

[12:50](#msg5b114125160c567d16f57a64)@BeardPower I understand that question is not about "is" but about "should".

BeardPower

[12:51](#msg5b11414cba1a351a68e00545)Sure, but C programmers have a different opinion on should ;-)

toomasv

[12:52](#msg5b114176361a950a663265ba)Thats fine, but question was "Should Red..."

hiiamboris

[12:54](#msg5b1141f0f9f2e56cf23153ad)I believe the `56799` answer comes from the idea that \*series after the tail should be treated as if it's at the tail\*, which I totally understand (or are there more arguments to support it?).  
But the problem is deeper, as this also breaks some logic invariants...  
Like, I can use a different logic (that supports `567899` answer):  
\- I can rewrite `change/part c 99 -1` as `change/part (at c -1) 99 1` and expect the same result  
\- or since `#"8" = pick c -3` I might expect `change/part c 99 -3` start it's changes from `#"8"` char

toomasv

[12:57](#msg5b1142ccc712f561254da374)@hiiamboris How is it that "since `#"8" = pick c -3`"? Why not `#"6" = pick c -3`?

hiiamboris

[12:59](#msg5b11431e160c567d16f581dd)@toomasv it's because `7 = index? c`, so `(pick c -3) = first at (head c) (7 - 3)`

[13:00](#msg5b114362c712f561254da65e)unless we root out the evil of `(index? c) > length? head c` there's always some source of ambiguity, but rooting it out isn't an option if you ask me

toomasv

[13:02](#msg5b1143d3016ae21a4cffe72f)Well, if you ask about "intuitivity" then going two steps further the wall isn't very intuitive.

hiiamboris

[13:07](#msg5b11452dedd06f7d15ff7d14)Yeah I understand, and thank you all for your votes :) Personally I favor the `567899` over `56799` but just a little bit.  
I'll mention this discussion in the ticket, hopefully it'll help the team to take a decision.

toomasv

[13:13](#msg5b114674b6eece791dcee82e)You wuold like to see `011` instead?

```
a: "5678"
c: at a 7
append a "91011"
c
== "91011"
```

hiiamboris

[13:18](#msg5b114798edd06f7d15ff874d)@toomasv in your case `5 = index? c`, to get it past the tail you need to `remove` something first from `a`

[13:19](#msg5b1147deb6eece791dceed28)

```
>> a: "345678" c: tail a remove/part a 2
== "5678"
>> index? c
== 7
>> append a "91011"
== "567891011"
>> c
== "011"
```

toomasv

[13:25](#msg5b114933016ae21a4cfffe28)But this is a silent death of console:

```
a: "5678"
c: at a 7
change/part a "" 4
insert c "91011"
```

hiiamboris

[13:26](#msg5b114970ba1a351a68e027a4)@toomasv yeah, insert is bugged, and mentioned in the ticket

[13:27](#msg5b1149c693dc78791ca234cf)they've been working on `remove` lately, but `change/part` is the hardest thing

toomasv

[13:46](#msg5b114e1a4eaffb692d72d82f)There seems to be some bug in treatment of blocks also:

```
>> a: [1 2 3 4]
== [1 2 3 4]
>> c: at a 7
== []
>> change/part a [] 4 
== []
>> head a
== []
>> head c
== []
>> index? c
== 5
>> insert c [5 6]
== []
>> a
== [5 6]
>> c
== []
>> insert c [7 8 9]
== [5 6] ; unexpected?! Why does it insert in `head c`?
>> c
== [6] 
>> head c
== [7 8 9 5 6]
>> a
== [7 8 9 5 6]
>> index? a
== 1
>> index? c
== 5
>> c
== [6]
```

hiiamboris

[13:49](#msg5b114edc160c567d16f5b49e)I believe these functions are common for all series, both block- and string-based.

[13:49](#msg5b114f06ba1a351a68e04432)But it's curious that strings throw an exception while blocks work in a weird way.

[13:51](#msg5b114f53e26c847ac8abd556)@toomasv can you add this info to the ticket? ;)

endo64

[14:04](#msg5b115268edd06f7d15ffbdbf)@toomasv Its like `index? c` should fix offset of `c` and return 0 after `change/part`, but in that case all series functions should set &amp; check a dirty? flag, which might not good performance wise.

hiiamboris

[14:11](#msg5b1153fbba1a351a68e0591a)let's imagine if that was the case:

```
>> a
== "5678"
>> index? c
== 5
>> remove a  index? c
== 4
>> insert a 123  index? c
== 4
>> append a a   clear skip a 3   index? c
== 4
>> x: copy a   append clear a x   index? c
== 1
```

[14:19](#msg5b1155db016ae21a4c0035b6)

```
g: func [s] [loop 4 [append s take head s]]
f: does [
   s: tail "1234"
   g s
   s
]
>> f
== "1234"
???
```

[14:21](#msg5b115672ba1a351a68e06355)the amount of unexpectedness would depend on how eagerly the index is "fixed" ;)

[14:26](#msg5b115797edd06f7d15ffd15f)or if `index?` doesn't change `c` but only returns `max`:

```
>> a
== "5678"
>> index? c
== 5
>> insert a 4  index? c
== 6
>> insert a 23  index? c
== 7
>> insert a 1  index? c
== 7
```

greggirwin

[20:35](#msg5b11ae08edd06f7d15012378)I have this on my list to dig into and weigh in. Good questions, but I haven't had a block of time, when I was awake enough to do it.

## Sunday 3th June, 2018

toomasv

[19:58](#msg5b14485e16f6496124032869)I'm carrying this over from help room. The problem boils down to this:

```
>> parse [x] [collect some [collect keep ['x]]]
== [[x] []]
>> parse [x] [collect some [collect keep ['x ()]]]
== [[x]]
```

Also, whenever literal-rule matches last literal in `collect` (with no paren following it) an empty collection box is created, like this:

```
>> parse [x] [collect some [collect keep ['x | word!]]]
== [[x] []]
>> parse [x] [collect some [collect keep ['y | word!]]]
== [[x]]
>> parse [y] [collect some [collect keep ['x | word!]]]
== [[y]]
>> parse [y] [collect some [collect keep ['y | word!]]]
== [[y] []]
>> parse [y] [collect some [collect keep ['y () | word!]]]
== [[y]]
>> parse ["a"] [collect some [collect keep ["a" | word!]]]
== [["a"] []]
>> parse ["a"] [collect some [collect keep ["b" | string!]]]
== [["a"]]
>> parse [#"a"] [collect some [collect keep [#"a" | char!]]]
== [[#"a"] []]
>> parse [#"a"] [collect some [collect keep [#"b" | char!]]]
== [[#"a"]]
>> parse [#"a"] [collect some [collect keep [#"a" () | char!]]]
== [[#"a"]]
>> parse [1] [collect some [collect keep [quote 1 | integer!]]]
== [[1] []]
>> parse [1] [collect some [collect keep [quote 1 () | integer!]]]
== [[1]]
>> parse [1] [collect some [collect keep [quote 2 | integer!]]]
== [[1]]
```

endo64

[21:12](#msg5b1459cfba1a351a68e8b4ef)@toomasv It's even simpler to see the problem here, without `collect`

```
>> parse [1] [some [(print '.) integer!]]
.
>> parse [x] [some [(print '.) 'x]]
.
.
```

Why there is 2 pass in the second example? Might be better @dockimbel to examine this.

greggirwin

[23:24](#msg5b1478c0a45f930a65fac280)

```
>> parse [1] [some [(print '.) quote 1]]
.
.
== true
```

[23:25](#msg5b1478d0b6eece791dd7d1b9)Just for clarity.

## Monday 4th June, 2018

PeterWAWood

[00:24](#msg5b1486af160c567d16fe8ef8)@dockimbel I am tidying up some of the tests and came across this one:

```
--assert a = to email! #"a"
```

[00:27](#msg5b148786ba1a351a68e925a9)It fails as written because `a` is word not the email `a`. I can make the test pass by changing it to:

```
--assert equal? head remove/part next a@b 2 to email! "a"
```

[00:29](#msg5b148801a45f930a65fae31c)However, it could be considered a bug in that it shouldn't be possible to create an email that has no literal form. Are you happy with the current behaviour or should we treat it as a bug?

[00:57](#msg5b148e73e26c847ac8b4ca2a)@dockimbel Currently it is possible to create a zero-length `email!`.

```
>> em: to email! #{}
== 
>> type? em
== email!
>> length? em
== 0
```

Bug?

[01:05](#msg5b14906e352b9e1a4b57517c)`to email! []` also creates a zero-length `email!`.

9214

[01:25](#msg5b14951d160c567d16feb275)@greggirwin :point\_up: I think we need a 'caveats and pitfalls of unfinished `to` design' wiki.

bitbegin

[01:34](#msg5b14973716f6496124040973)Is this a bug of split?

[01:34](#msg5b14973da45f930a65fb05e8)

```
>> split "abc   def              asd" " "
== ["abc" "" "" "def" "" "" "" "" "" "" "" "" "" "" "" "" "" "asd"]
>>
```

endo64

[06:17](#msg5b14d995edd06f7d15095dbd)@PeterWAWood A few days ago same topic discussed: `>> type? @ ;== email!`

[06:20](#msg5b14da2516f649612404b0d4)@bitbegin I think no, what output do you expect? Looks correct to me, same as:

```
>> split "1,2,3,,,6" ","
== ["1" "2" "3" "" "" "6"]
```

[06:24](#msg5b14db2793dc78791cac0dd0)@toomasv @greggirwin I think the difference is matching by datatype and value:

```
>> parse [a@a.com] [some [(print '.) email!]]
.
== true

>> parse [a@a.com] [some [(print '.) a@a.com]]
.
.
== true
```

toomasv

[06:37](#msg5b14de43a45f930a65fbba44)@bitbegin You may want this:

```
split trim/lines "abc   def              asd" " "
== ["abc" "def" "asd"]
```

&gt; /lines =&gt; Removes all line breaks and extra spaces.

bitbegin

[06:48](#msg5b14e0bd16f649612404c6d1)@toomasv thanks

[07:07](#msg5b14e53222a05f5e71fba287)@endo64 Maybe should add a refinement for split, like this split/all

toomasv

[08:16](#msg5b14f557edd06f7d1509c0ca)@endo64 Yes, seems so. @bitbegin You are welcome!

9214

[10:49](#msg5b15192d52e35117cd06e33d)

```
text
>> parse [FOO]['foo]
== false
>> parse [FOO]['FOO]
== true
>> parse/case [FOO]['FOO]
== true
>> parse/case [FOO]['foo]
== false
```

https://github.com/red/red/issues/3029 @qtxie @dockimbel @greggirwin :point\_up: ?

gltewalt

[21:05](#msg5b15a99652e35117cd095d6d)I’ve read somewhere that an email value should not start with `@` and should be a minimum of two characters. Red doesn’t adhere to these restrictions, currently.

BeardPower

[21:41](#msg5b15b1ede26c847ac8b8f4a9)You would need to read the RFC on that one.

[21:41](#msg5b15b218160c567d1602aa68)https://tools.ietf.org/html/rfc2822#section-3.4.1

[21:43](#msg5b15b28222a05f5e71fee04a)An addr-spec is a specific Internet identifier that contains a  
locally interpreted string followed by the at-sign character ("@",  
ASCII value 64) followed by an Internet domain. The locally  
interpreted string is either a quoted-string or a dot-atom. If the  
string can be represented as a dot-atom (that is, it contains no  
characters other than atext characters or "." surrounded by atext  
characters), then the dot-atom form SHOULD be used and the  
quoted-string form SHOULD NOT be used. Comments and folding white  
space SHOULD NOT be used around the "@" in the addr-spec.

greggirwin

[21:48](#msg5b15b3ab35e25f39974bbe1a)@PeterWAWood, there are a number of ways to create values that don't match their lexical (literal) form. In this case, it could be ambiguous, because where would the sigil go? I also still want a `ref!` type, which would be of the form `@your-name-here`.

For testing, I don't know if we can safely \*always* use a literal form, but it will be convenient when we can. The question then is if we should normalize all of them to use more complex tests.

[21:49](#msg5b15b40635e25f39974bbf27)I think email lexing is currently simple, because more wasn't needed. I'm all for making it more strict.

[21:51](#msg5b15b44d16f649612408333c)@bitbegin, we'll have a much better `split` in the future, based on the Rebol version I hope. I have a bit of work done on that, but needs design review.

BeardPower

[21:52](#msg5b15b48082a4d36ea6cd7a4b)Are we also gonna provide hashtags?

greggirwin

[21:53](#msg5b15b4c5f9f2e56cf23ea71a)@endo64 @toomasv @9214 it all seems related. Let's get all the info we can, to help @dockimbel nail it as easily as possible when he's back and has time for some tickets.

[21:53](#msg5b15b4d4f9f2e56cf23ea73e)Issues are hashtags @BeardPower .

BeardPower

[21:55](#msg5b15b536f9f2e56cf23ea879)You mentioned

```
ref!
```

for

```
@your-name-here
```

, so what do you think of

```
#your-topic-here
```

?

greggirwin

[22:05](#msg5b15b7c6a45f930a65ff3e42)That's what `issue!` is. We have it already.

BeardPower

[22:06](#msg5b15b7d9edd06f7d150cca68)OK.

[22:08](#msg5b15b85eb6eece791ddc44c6)I thought it's main usage is ISBN kind of values.

## Tuesday 5th June, 2018

toomasv

[03:11](#msg5b15ff75f9f2e56cf23f7785)I think empty and partial emails can be handy in composition, e.g.

```
email: to-email ""
foreach part [tom @ global - red . com][append email part]
== tom@global-red.com
```

or

```
email: @red-global.com 
foreach guru [rebolek 9214 greggirwin][append [] head insert copy email guru]
== [rebolek@red-global.com 9214@red-global.com greggirwin@red-global.com]
```

## Thursday 7th June, 2018

Oldes

[20:44](#msg5b19994b9ca98417e250fbfb)Currently here is this functionality:

```
>> f: func['val][type? get/any :val]
== func ['val][type? get/any :val]
>> f xxx
== unset!
>> b: [a] f b/xxx
== none!
```

Should not be the last result also `unset!` instead of `none!`?

9214

[20:47](#msg5b1999c9659aad4a325b995a)@Oldes only words can be `unset`, not paths.

Oldes

[20:48](#msg5b199a3214d4bc146e71eade)Hm.. probably makes sense. But how to find out, that path is not existing?

[20:50](#msg5b199a84178709146f1c5986)Or is this help result correct?

```
>> help b/xxx
B/XXX is a none! value: none
```

9214

[20:51](#msg5b199ac9144c8c6fea7bec02)@Oldes seems legit to me, since `path!` accessor implements `select` logic:

```
>> select [what] 'ever
== none
```

Oldes

[20:51](#msg5b199ae5659aad4a325b9cd1)Ok.

9214

[20:52](#msg5b199b06144c8c6fea7becc0)As for the non-existing element - I don't think there's an easy answer for that, but it's over midnight here :wink:

greggirwin

[21:57](#msg5b19aa5e659aad4a325bd0fb)

```
>> b: reduce ['a 'xxx ()] f b/xxx
== unset!
```

To find out if a key exists, use `find`.

## Friday 8th June, 2018

endo64

[06:29](#msg5b1a223ee36e0e7d3f5b5130)

```
>> find first [a/b/c] 'c
== c
>> find first [a/b/c] 'x
== none
```

greggirwin

[16:50](#msg5b1ab3f33516592752f3fc17)Good clarification. Thanks @endo64!

## Monday 11st June, 2018

ne1uno

[07:40](#msg5b1e2752d7b4f6288cc02d53)new `alert` missing unview and return value? `button "ok" ['ok unview]`

endo64

[09:48](#msg5b1e45663516592752fd73b9)@ne1uno Correct, probably overlooked. We can fix &amp; improve it very easily. Thanks for noting.

[09:54](#msg5b1e46c9d7b4f6288cc09a60)Can someone test &amp; confirm that after unviewing a window `read-clipboard` doesn't work anymore, I tested on Win8.1 x64, non-GUI console.

hiiamboris

[11:34](#msg5b1e5e56106f3c24bdefeb6a)@endo64 W8.1x64  
!\[](https://i.gyazo.com/45b8db08b9f0f95675237826aee42fa3.png)

[11:36](#msg5b1e5ea73516592752fdcc1d)it works for me after `unview`... although `view` after `print` = crash :)

[11:36](#msg5b1e5ec6106f3c24bdefee08)no idea how you can use Red console under W8...

gltewalt

[12:16](#msg5b1e68106077c67d3ee4f685)No idea how anyone can put up with W8

endo64

[15:24](#msg5b1e9427144c8c6fea8a0d9e)I use non-GUI console on Win8.1, no crash after print. But `read-cliboard` doesn't work after `unview`.  
`view [button "ok"]` immediately crash my GUI console, but it I think my Win8 has problems with gfx card driver.

[15:24](#msg5b1e943e144c8c6fea8a0dfa)Thanks for testing @hiiamboris

hiiamboris

[15:32](#msg5b1e9623144c8c6fea8a141c)@endo64 interesting.. I tried the cli console and it didn't crash but after `unview` `read-clipboard` always returns `none` even though it's not empty  
also, `write-clipboard` returns `false` and does nothing

endo64

[15:39](#msg5b1e979814d4bc146e808102)@hiiamboris Same for me. So we can raise an issue for this. Thanks!

dander

[17:11](#msg5b1ead4970d89b3a318d732e)I can't reproduce any of those view/unview clipboard issues on Win10

greggirwin

[17:53](#msg5b1eb70b37a2df7bed33c1bf)Same as @dander here, no issue on Win10. Fine on Win7 as well.

endo64

[23:18](#msg5b1f033dc277fb705dc5c9fa)Interesting, I just tested on Win10 x64, and same problem occurred here as well:

```
>> read-clipboard
== "test"
>> view [button "ok" [unview]]
>> read-clipboard
== none
>> about
Red 0.6.3 for Windows built 11-Jun-2018/13:34:14+03:00 commit #de47b6c
```

[23:21](#msg5b1f03f5ebf21755ca2960f3)On GUI console it works, on non-GUI console `read-clipboard` returns `none` on Win10.

greggirwin

[23:22](#msg5b1f043682b1b355c94f83df)My build is a few days old rebuilding now to test.

[23:28](#msg5b1f058da0161836cb12bd94)I can dupe the `none` clipboard issue on Win10 here as well.

ne1uno

[23:38](#msg5b1f07e34fbf4449eb0e2a0e)some apps intentionally clear clipboard on exit. win7 old &amp; new console not none, cli errors with view

## Tuesday 12nd June, 2018

toomasv

[05:30](#msg5b1f5a5b70d89b3a318eeb83)OK on W10

```
>> read-clipboard
== "test"
>> view [button "ok" [unview]]
>> read-clipboard
== "test"
>> about
Red 0.6.3 for Windows built 12-Jun-2018/5:18:35+03:00 commit #c55a199
```

endo64

[06:43](#msg5b1f6b97c277fb705dc68819)@toomasv Thanks for testing, hope @qtxie can reproduce it so he can fix. I've submitted an issuehttps://github.com/red/red/issues/3421

qtxie

[12:09](#msg5b1fb804ebf21755ca2add57)Yes. I can reproduce it.

## Wednesday 13th June, 2018

Oldes

[14:11](#msg5b2126078864a936cc850731)Not exactly bug... but I noticed, that Red (as Rebol2) returns `none` if index used for `pick` is `0`:

```
>> pick b: at [1 2 3 4 5] 3 0
== none
>> b/-1
== 2
```

While this behaviour was changed in Rebol3 (\[considered to be a bug](http://www.rebol.net/cgi-bin/r3blog.r?view=0173)):

```
>> pick b: at [1 2 3 4 5] 3 0
== 2
>> b/-1
== 1
```

@dockimbel Is it OK?

9214

[14:11](#msg5b2126231ee2d149ecbed431)@Oldes yes, it's by design.

Oldes

[14:12](#msg5b212667cf3b245b2cfb45cd)Any racional reason?

9214

[14:14](#msg5b2126c670d89b3a319375cc)@Oldes R2 compatibility?

Oldes

[14:15](#msg5b2126f3c277fb705dcaddd2)That is quite a strong reason.. right. But on the other side, BrianH was quite sure (in comments) that it should be changed.

[14:16](#msg5b2127494fbf4449eb133f16)But BrianH is gone from Redbol world.

9214

[14:23](#msg5b2128e7d128fa71f66685d2)Personally, I see the point behind the R3 change, but R2 behavior makes more sense to me, intuitively. Maybe other old-timers have something to share on this matter?

gltewalt

[15:05](#msg5b2132b3c277fb705dcb01e9)R2 behavior makes sense.  
You’re at the third element of b, and there’s no zero, so return none. Move back one and you’re at the second element of b, which is 2

meijeru

[15:08](#msg5b21335d4fbf4449eb136867)Imagine a series at its tail. The index would be 1 + length? &lt;series&gt;. Then the last element would have to have index one lower, rather than the same as the tail, yes? Thus the \_relative_ index of the last element would be -1. This is also how it works with `at` and `pick` in Red and R2.

Oldes

[16:35](#msg5b2147ee202c8f71f5fef120)@meijeru good point... this in R3 really does not look correct to me:

```
>> b: "123"
== "123"

>> pick tail b -1
== #"2"
```

greggirwin

[17:21](#msg5b2152a486343c3a3201e7b5)IIRC there is a \*lot* of other chat around this and `skip`. Another subtle topic, for which there are pros and cons each way, and worthy of some good docs.

## Thursday 14th June, 2018

dockimbel

[09:35](#msg5b2236df1ee2d149ecc133ec)Index zero for series is considered invalid, we should return an error actually instead of `none`.

greggirwin

[20:16](#msg5b22cd131ee2d149ecc2e755)I think we had that noted somewhere. Zero based `pick` funcs have also been discussed in the past. e.g. `zpick/zpoke`

gltewalt

[20:41](#msg5b22d307fd5b835b2d5c5ca6)`to email!` appears to do nothing with 29-May-2018 build

hiiamboris

[21:09](#msg5b22d990a0161836cb1c1c01)works here

```
>> to email! ["ab" "@c"]
== ab@c
>> to email! "ab@c"
== ab@c
```

gltewalt

[21:11](#msg5b22da1282b1b355c958c3c6)

```
>> to url! [one two three]
== one://two/three
>> to file! [one two three]
== %onetwothree
>> to email! [one two three]
== onetwothree
```

[21:12](#msg5b22da3586343c3a32058bad)should it not behave like `to url!`?

[21:12](#msg5b22da59fd5b835b2d5c6ff2)Or at least return a "@"

[21:13](#msg5b22da96a0161836cb1c1e2f)By behave like url, I mean supply the @ for you when it converts the value

[21:18](#msg5b22db91c277fb705dcefc1e)Weird.

```
>> type? x: to-email 2 * 2
== email!
>> ?? x
x: 4
```

hiiamboris

[21:18](#msg5b22dbbde87f0c7bee8c5045)I guess it just forms it

[21:19](#msg5b22dbda37a2df7bed3d8278)Adding a "@" makes sense for a block of 2 items

[21:23](#msg5b22dcc037a2df7bed3d8587)But then it should do so for longer blocks right? For consistency? Where to add the at-sign? After the 1st item? And what of blocks of 1 item and zero?

[21:37](#msg5b22e00732618e705ebb74cb)By the way, R3 doesn't add the `@`, so maybe it's a compatibility decision

gltewalt

[21:38](#msg5b22e05c82b1b355c958d290)Are you sure R3 doesn't? It's in the docs. `probe to-email [user some long domain name out there dom]`

greggirwin

[21:40](#msg5b22e0e74fbf4449eb17788a)It may just not be implemented yet. Right now, email just inherits `to` from string. R2 might be a better reference than R3 here.

```
>> to email! [a]
** Script Error: Invalid argument: a
** Near: to email! [a]
>> to email! [a b]
== a@b
>> to email! [a b c]
== a@b.c
>> to email! [a b c d]
== a@b.c.d
>> to email! [a b c d e]
== a@b.c.d.e
```

Find the behavior we'd change there and submit a ticket. Low priority, but worth remembering.

gltewalt

[21:43](#msg5b22e16c86343c3a32059b05)I notice that `to` refuses `point!` even though `point!` is listed by `? datatype!`. I assume it is TBD

[21:44](#msg5b22e1be70d89b3a3197b6bf)The R2 example for `to email!` makes sense to me

greggirwin

[21:44](#msg5b22e1d5cf3b245b2cff65be)`Point!` is TBD, yes.

## Saturday 16th June, 2018

hiiamboris

[12:20](#msg5b2500a26b24803e845d432e)hmm what am I missing?

```
>> parse %234 ["23" thru [end]]
== true
>> parse/part %234 ["23" thru ["4" end]] 3
== true
>> parse/part %234 ["23" thru [end]] 100
== true
>> parse/part %234 ["23" thru [end]] 3
== false
```

toomasv

[12:31](#msg5b25030b32618e705ebf94e0)@hiiamboris Yes, interesting:

```
>> parse/part %234 ["23" thru [end]] 1
== true
>> parse/part %234 ["23" thru [end]] 2
== true
>> parse/part %234 ["23" thru [end]] 3
== false
>> parse/part %234 ["23" thru [end]] 4
== true
>> parse/part %234 ["23" thru end] 3
== true
>> parse/part %234 ["23" to [end]] 2
== true
>> parse/part %234 ["23" to [end]] 3
== false
>> parse/part %234 ["23" to [end]] 4
== true
>> parse/part %234 ["23" to end] 3
== true
```

greggirwin

[19:54](#msg5b256ad982b1b355c95db183)Something to put in a ticket and note in the wiki. Could easily be a bug.

hiiamboris

[19:55](#msg5b256b3c37a2df7bed426a38)@greggirwin okay, I'm choosing ticket ;)

greggirwin

[19:58](#msg5b256be017cfd73e8543e988):^)

## Sunday 17th June, 2018

nedzadarek

[15:54](#msg5b26844049960533e8a287d1)`try [ return 42]` just closes the console (no error message). With `/all` it works as expected (Red error: cannot use `return` outside function). Is this a bug?

hiiamboris

[17:11](#msg5b26962bf339a97372f3649b)@nedzadarek yep https://github.com/red/red/issues/3268

## Monday 18th June, 2018

gltewalt

[03:42](#msg5b272a2694a11e0adea89567)It looks like something has changed in `print` recently?

```
>> print type? "hi"
string
>> probe type? "hi"
string!
== string!
```

[03:43](#msg5b272a4447559749103133dd)I thought they both printed the datatype with the `!`?

9214

[03:43](#msg5b272a4ad9bcab2dd6978c7f)@gltewalt it always was that way.

gltewalt

[03:43](#msg5b272a5bd9bcab2dd6978c98)Really? wow.. that's scary

9214

[03:43](#msg5b272a75d9bcab2dd6978cac)Compare R2 behavior for sanity check.

[03:43](#msg5b272a7f4755974910313469)And Red's stable build.

gltewalt

[03:44](#msg5b272a8bd9bcab2dd6978cc1)The uneasy sanity is my memory since april

[03:44](#msg5b272aa694a11e0adea895d9)But yes, I should have checked R2 first

Oldes

[10:22](#msg5b2787fa94a11e0adea95d1e)@gltewalt the difference is that `print` is using `form` and `probe` is using `mold`:

```
>> form type? "hi"
== "string"
>> mold type? "hi"
== "string!"
```

## Tuesday 19th June, 2018

dander

[07:21](#msg5b28af03fc6062038064323c)In the gui console, I'm getting a crash with the `to-UTC-date` function. For example: `to-UTC-date now`. But in the cli, it works fine. Latest build (commit 67531575), Win 10

9214

[07:25](#msg5b28b000ce3b0f268d28cdd7)@dander https://github.com/red/red/issues/3411

dander

[07:26](#msg5b28b028fc606203806435a7)thanks, should have looked there

## Wednesday 20th June, 2018

BeardPower

[15:08](#msg5b2a6de5960fcd4eb91029ef)The following code is not compiled, as the value: line is recognized as a return value of None:

```
Red/System [
]

money: context [	

    ; the exponent is too small, so it's attempted to scale it up by increasing the exponent of the DEC64 value
	pack-increase: func [
		coefficient [float!]
		exponent	[integer!]
        return:     [integer!]

		/local
			values [struct! [coefficient [float!] exponent [integer!]]]
	]
	[
	    values: as struct! [coefficient [float!] exponent [integer!]]
		
        ;values/coefficient: 1.0
        
        0
	]
]
```

```
Compiling to native code...
*** Compilation Error: wrong return type in function: money/pack-increase
*** expected: [integer!], found: [none]
*** in file: %/E/Development/red_old/test.reds
*** in function: money/pack-increase
*** at line: 16
*** near: [
    values: as struct! [coefficient [float!] exponent [integer!]]
    0
]
```

[15:11](#msg5b2a6e95fc60620380689bd9)The following code compiles, but shouldn't it complain about using an uninitialized value?

```
Red/System [
]

money: context [	

    ; the exponent is too small, so it's attempted to scale it up by increasing the exponent of the DEC64 value
	pack-increase: func [
		coefficient [float!]
		exponent	[integer!]
        return:     [integer!]

		/local
			values [struct! [coefficient [float!] exponent [integer!]]]
	]
	[
	    ;values: as struct! [coefficient [float!] exponent [integer!]]
		
        values/coefficient: 1.0
        
        0
	]
]
```

[15:27](#msg5b2a725d59799e70172dbf9f)Thanks to @9214, the struct must still be declared:

```
values: declare struct! [coefficient [float!] exponent [integer!]]
```

Oldes

[15:59](#msg5b2a79d06ceffe4eba1cd8e1)Is there any advantage that `power` with 2 integers sometimes returns `integer` and sometimes `float`?

9214

[15:59](#msg5b2a79e85862c35f47b4e65e)@Oldes IIRC it was discussed at some point... @hiiamboris ?

[16:00](#msg5b2a7a135862c35f47b4e6b1)Ah, it returns a float if your number doesn't fit in 32-bit size.

[16:00](#msg5b2a7a1f6ceffe4eba1cd9ee)i.e. implicit conversion.

Oldes

[16:00](#msg5b2a7a320168e70c08d6a8bc)But is it any advantage that it is not always float, like in Rebol?

BeardPower

[16:00](#msg5b2a7a35960fcd4eb91055c5)It's because there is no int64 yet.

9214

[16:01](#msg5b2a7a4a72b31d3691dcf2d2)@Oldes personally I prefer Red's approach.

[16:01](#msg5b2a7a5f7da8cd7c8c59361d)`2 ** 5 => 32.0` always gives me a knee-jerk reaction.

BeardPower

[16:01](#msg5b2a7a72fc6062038068c629)power for two int returning float does not make any sense to me.

Oldes

[16:02](#msg5b2a7a86479ca266896c3555)but it is anyway (in some cases) :)

BeardPower

[16:02](#msg5b2a7a9472b31d3691dcf3c8)Yes, because Red has no int64 type yet ;-)

[16:02](#msg5b2a7aa3ad21887018cafe1d)So it needs to use float! instead.

9214

[16:02](#msg5b2a7aa3467bd7268c204d3c)@Oldes well, what else can it do? Throw an error?

BeardPower

[16:03](#msg5b2a7ac86ceffe4eba1cdba7)Maybe we should cache the values ;-)

Oldes

[16:03](#msg5b2a7ac9960fcd4eb91057a8)I don't know.. I'm not a mathematician, so I'm asking.

hiiamboris

[16:03](#msg5b2a7ad25862c35f47b4e8bc)@Oldes advantage is - you don't have to convert it back to integer working against the Red

9214

[16:04](#msg5b2a7b180168e70c08d6ab73)Sometimes I prefer to write large integers in `base ** exponent` form.

[16:05](#msg5b2a7b32fc6062038068c921)A lot easier to read IMO (`10 ** 7` - '1 and that many zeroes')

Oldes

[16:05](#msg5b2a7b440168e70c08d6abcb)Ok.. that makes sense.

9214

[16:05](#msg5b2a7b56479ca266896c37fb)But I'm too spoiled by J so don't listen to me :P

[16:05](#msg5b2a7b6559799e70172ddb0d)And I'm also a pedant!1!1!

## Thursday 21st June, 2018

hiiamboris

[09:53](#msg5b2b75967da8cd7c8c5fe072)can someone test this too?

```
view [base 100x100 99.99.0 focus on-key [unview]]
```

creates a window which is \*\*active\** and when you close it by alt-f4 it unviews itself

```
view [base 100x100 99.99.0.0 focus on-key [unview]]
```

(added alpha channel)  
creates a window with \*\*inactive\** title bar and some other invisible window that accepts the keyboard input, and when you press alt-f4 the invisible window is closed and the main window becomes active

endo64

[09:58](#msg5b2b76cd467bd7268c267a4d)Second one creates an active window for me and alt-f4 closes the window. I just can't see the windows content it gives `*** View Error: CreateWindowEx failed!` on my PC, but that is only me I guess.

ne1uno

[10:03](#msg5b2b77e7960fcd4eb9160b09)win7 no second window, title is active in both, it looks like the blank window flashes for a second then morphs into a regular window ok here

[10:04](#msg5b2b7839ad21887018d10ee7)first one any key unviews, 2nd one isn't accepting key input?

hiiamboris

[10:07](#msg5b2b78ff1480560285994072)on the 2nd one the invisible one accepts and processes the input, and when I press alt-f4 it closes and:  
\- input is not accepted anymore  
\- the parent window that is now active does not contain the `base` square  
\- another alt-f4 hit closes this window

ne1uno

[10:10](#msg5b2b79acad21887018d11356)only takes one F4. the second window steals focus but exits with the first

hiiamboris

[10:12](#msg5b2b7a1a7d3bca737afd503a)just tried the stable release, same thing

[10:15](#msg5b2b7adbce3b0f268d34c0e9)tried W8 (that was W7 previously), same as your result @endo64 : `CreateWindowEx` in the CLI console, and an immediate crash in the GUI console, but no 2nd window

greggirwin

[18:42](#msg5b2bf182ce3b0f268d362612)The second one works fine here on Win10. Base can't get focus, but it's worth a ticket in any case, so we know what's going on.

hiiamboris

[18:55](#msg5b2bf4b65862c35f47bbd91b)okay

[19:32](#msg5b2bfd55aeb8fa0c0734cd20)@greggirwin btw, do you mean that base isn't supposed to be used for catching key input at all, or it just bugs on W10?

greggirwin

[19:34](#msg5b2bfdb7479ca26689737b19)I think it can't get focus, so shouldn't be used to get keys. It will \*need to\*, of course, when we roll non-native GUI bits.

hiiamboris

[19:37](#msg5b2bfe8b479ca26689737c9d)and what is the proper way to eavesdrop on the keys then? when using only draw for instance  
hopefully not `insert-event-func`?

endo64

[19:37](#msg5b2bfe917da8cd7c8c616892)When I test base can get focus when you set focus on it. It can't if you click on it.

greggirwin

[19:41](#msg5b2bff7dd2abe466887dbd08)`insert-event-func` isn't so bad, especially as things get more complex. In any case, I have notes for wanting to do a key-binding/key-map dialect. Maybe we can bounty that soon.

dsunanda

[23:09](#msg5b2c3045fc6062038070df0f)Hello.....Small bug? LAST does not work with TUPLE!:  
&gt;&gt; last 1.2.3.4  
\*\** Script Error: last does not allow tuple! for its s argument

FIRST does work. Both FIRST and LAST work in R2 and R3.

greggirwin

[23:53](#msg5b2c3a5ece3b0f268d36ce03)How about this change? from:

```
last: func [
	"Returns the last value in a series"
	s [series! tuple!]
][
	pick back tail s 1
]
```

to

```
last: func [
	"Returns the last value in a series or tuple"
	s [series! tuple!]
][
	pick s length? s
]
```

9214

[23:53](#msg5b2c3a97fc6062038070f02c)@greggirwin

```
>> pick spec-of :first 3
== [series! tuple! pair! time!]
```

greggirwin

[23:54](#msg5b2c3aa0b9c2fb2557ffa7da)`Back` and `tail` don't work for tuples either. Likely it just wasn't needed before now.

[23:55](#msg5b2c3ae1d2abe466887e47ce)@9214, yes? `First` works fine because it only uses `pick`.

[23:55](#msg5b2c3af4479ca26689740264)It's also possible that `length?` didn't work for tuples in the past.

9214

[23:56](#msg5b2c3b285862c35f47bc8445)@greggirwin I meant that you also need to add `pair!` and `time!` into the mix.

[23:56](#msg5b2c3b4a479ca266897402ca)That way `last` will be consistent with `first`.

greggirwin

[23:57](#msg5b2c3b64aeb8fa0c07355e5f)I don't see the need for that. They are fixed length values.

[23:57](#msg5b2c3b856ceffe4eba26ca46)We could use `case` in `last` for that, but I don't see the win.

[23:58](#msg5b2c3ba772b31d3691e59433)Except for a generic wrapper of some kind that dispatches to `last`.

[23:58](#msg5b2c3bc26ceffe4eba26ca8f)Rebol doesn't support those either, so no compatibility argument.

## Friday 22nd June, 2018

greggirwin

[00:14](#msg5b2c3f6e7da8cd7c8c6201d6)I created a PR for this. Thanks @dsunanda !

[03:03](#msg5b2c66e4b9c2fb2557ffedf2)I thought we had a ticket for the GUI console issue, where it dies in the latest build. Can't find it though. Pulling the latest source and the automated build both fail for me on Win10.

ne1uno

[05:38](#msg5b2c8b42ad21887018d3a6c4)about/debug new gui crasher? 16-Jun-2018/11:14:01 commit: #d298a5fc28e5472983098e

rebolek

[06:09](#msg5b2c927c467bd7268c29200a)23, my favourite number  
https://github.com/red/REP/issues/23

dander

[07:28](#msg5b2ca522ad21887018d3e3fe)@ne1uno already reported #3329

Oldes

[14:16](#msg5b2d04d18a0a354b38a00034)Can anybody reproduce this?

```
>> 10%
== 10%
>> 1%
== 1%
>> 1.#NAN
== 1.#NaN
>> 1%
== 1.#NaN
>> 1%
== 1.#NaN
>> 1.#inf
== 1.#INF
>> 1%
== 1.#INF
```

9214

[14:17](#msg5b2d0512960fcd4eb919e420)@Oldes confirmed

```
>> 10%
== 10%
>> 1%
== 1%
>> 1.#NAN
== 1.#NaN
>> 1%
== 1.#NaN
>> 1%
== 1.#NaN
>> about
Red 0.6.3 for Windows built 18-Jun-2018/18:11:17+05:00 commit #6753157
```

Oldes

[14:20](#msg5b2d05c8d2abe466888014eb)Thanks.. https://github.com/red/red/issues/3435

toomasv

[16:50](#msg5b2d28d1d2abe46688807ce5)Is this a bug or am I doing something wrong?  
Without actors this works (drawing rectangles on image and moving these). With actors it doesn't.

```
Red []
context [
	start: end: 0x0 
	inside?: false 
	diff-s: diff-e: none
	view/tight [
		i: image 0.0.0.245 64x64 all-over draw []
		on-down [
			either within? event/offset start end - start [
				inside?: yes 
				diff-s: event/offset - start 
				diff-e: end - event/offset
			][
				inside?: no 
				face/draw: compose [box (start: end: event/offset) (end)]]
		] 
		on-over [
			if event/down? [
				either inside? [
					change back back tail face/draw reduce [
						start: event/offset - diff-s end: event/offset + diff-e
					]
				]
				[
					change back tail face/draw end: event/offset
				]
			]
		]
		with [
			menu: ["Cut" cut "Copy" copy "Color" color]
		]
	]
]
```

Now, if I include harmless actor:

```
with [
			menu: ["Cut" cut "Copy" copy "Color" color]
			actors: object [
				on-menu: func [face event][
					switch event/picked [
						cut [
							probe "cut"
						]
					]
				]
			]
		]
```

... it doesn't work anymore. :(

9214

[16:51](#msg5b2d290faeb8fa0c07378c11)@toomasv shouldn't `actors` facet be a block?

toomasv

[16:51](#msg5b2d292bb9c2fb255701e411)`actors` should be `object!`

9214

[16:52](#msg5b2d29366ceffe4eba28fda0)Yes, just double-checked the docs, my bad.

hiiamboris

[16:58](#msg5b2d2acf8a0a354b38a071ff)@toomasv you're overriding previously defined actors (on-down, on-over) with the `actors:` line

[17:00](#msg5b2d2b2f467bd7268c2acb15)try `actors: make self/actors [ ... ]`

toomasv

[17:01](#msg5b2d2b6872b31d3691e7ddf6)@hiiamboris Got it! Thanks!

9214

[17:02](#msg5b2d2b8972b31d3691e7de2d)@hiiamboris it should work without `self` I believe.

hiiamboris

[17:02](#msg5b2d2bb8b9c2fb255701e9a1)probably, but I was lazy to try ;)

toomasv

[17:11](#msg5b2d2da8ad21887018d55ba8)I just moved everything to `with`

Oldes

[17:59](#msg5b2d38fbaeb8fa0c0737b89c)Is this by design?

```
>> 1 / 0
*** Math Error: attempt to divide by zero
*** Where: /
*** Stack:  

>> 1.0  / 0
== 1.#INF
```

[18:02](#msg5b2d39d1aeb8fa0c0737bb4f)(I think so)

hiiamboris

[18:08](#msg5b2d3b1faeb8fa0c0737bf67)it is

Oldes

[20:39](#msg5b2d5e77d2abe4668881098f)Although in Lua it is:

```
> 1 / 0
inf
```

hiiamboris

[20:50](#msg5b2d6117be98b14224fee863)too bad for lua I think, as doing `int op int` one expects to stay inside the integer space

[20:50](#msg5b2d6130ce3b0f268d399729)the less special cases there are the better (easier to reason)

Oldes

[21:43](#msg5b2d6d9b6ceffe4eba29ac70)And what about this... not a big issue, but....

```
>> to-binary -1.#NaN
== #{7FF8000000000000}  ;<--- would be better to have it #{FFF8000000000000}
>> to-binary 1.#NaN
== #{7FF8000000000000}
```

I'm aware that even the negative NaN is always molded as positive (which is fine), but still it does not look good when you convert it to binary representation like in the example above.

[22:11](#msg5b2d740abe98b14224ff15c8)Also I believe, this should not throw an error:

```
>> tangent/radians (pi / 2)
*** Math Error: math or number overflow
*** Where: tangent
```

It should be `1.#INF`

hiiamboris

[22:32](#msg5b2d78f2aeb8fa0c07385a9f)@Oldes I think `FFF8000000000000` is a signaling NaN

[22:40](#msg5b2d7ac559799e70173990e8)

[22:40](#msg5b2d7af2467bd7268c2b8d79)no, it's not

[22:44](#msg5b2d7bc8467bd7268c2b8e56)but what if it's not \*molded as positive\*, but Red substitutes any NaN \*literal* with the same (binary) NaN value?

[22:47](#msg5b2d7c6ead21887018d6162d)I totally agree with your `tangent/radians` point, you should file a ticket for that, and for `tangent 90`

[22:59](#msg5b2d7f4cd2abe46688814f22)

```
>> to-binary probe to-float #{FFFF800000000000}
1.#NaN
== #{FFFF800000000000}
```

## Saturday 23th June, 2018

PeterWAWood

[02:05](#msg5b2dab035862c35f47bfc7a1)This seems a correct value for NaN according to IEEE-754.

meijeru

[09:01](#msg5b2e0c61479ca2668978b686)Is the following reasonable?

```
>> positive? 1.#NaN
== false
>> negative? 1.#NaN
== true
>> zero? 1.#NaN
== true
```

hiiamboris

[13:36](#msg5b2e4ce8ad21887018d7fa46)total nonsense...

meijeru

[14:31](#msg5b2e59d2960fcd4eb91d1a16)Should all three error out? What does IEEE 754 say?

greggirwin

[19:58](#msg5b2ea64f479ca2668979c927)https://en.wikipedia.org/wiki/NaN#Comparison\_with\_NaN

Looks like `< >` comparisons need an extra check. Fortunately, there is a `NaN?` native that should make it easy. All comparisons should return `false`, except inequality, which should always return `true`. If we agree on that, lets ticket it.

hiiamboris

[19:59](#msg5b2ea69f479ca2668979c9dc)I bet there's a ticket about `< >` operators already, so maybe it should be added there

greggirwin

[20:12](#msg5b2ea9ad59799e70173c1b13)https://github.com/red/red/issues/847

## Sunday 24th June, 2018

meijeru

[16:43](#msg5b2fca217da8cd7c8c69b4de)I just reported a curious issue with bitsets that refuse to be set at every 128th index. #3443

hiiamboris

[19:42](#msg5b2ff438aeb8fa0c073e865b)speaking of tangents, `atan` has an erroneous docstring:

```
USAGE:
     ATAN angle

DESCRIPTION: 
     Returns the trigonometric arctangent. 
     ATAN is a function! value.

ARGUMENTS:
     angle        [float!] "Angle in radians."
```

`angle` should be `number` and has nothing to do with radians  
almost the same for `arctangent`:

```
USAGE:
     ARCTANGENT angle

DESCRIPTION: 
     Returns the trigonometric arctangent (in degrees by default). 
     ARCTANGENT is a native! value.

ARGUMENTS:
     angle        [number!] 

REFINEMENTS:
     /radians     => Angle is specified in radians.

RETURNS:
     [float!]
```

[22:13](#msg5b30176cbe98b14224055d3f)oh wow that's something you'll all love!

```
Red []
probe -10%
probe type? -10%
probe -10% * 0.1
```

compiled with `-c` or `-c -e` or `-r -e`:

```
#-10%-
issue!
*** Script Error: * does not allow issue! for its value1 argument
*** Where: *
*** Stack:
```

## Monday 25th June, 2018

dockimbel

[04:47](#msg5b3073de0168e70c08eba687)@hiiamboris Good catch, looks like compiler's lexer bug, as it works fine from the console.

9214

[05:06](#msg5b3078465862c35f47c5375f) @dockimbel https://github.com/red/red/blob/master/lexer.r#L413 ?

[05:11](#msg5b30799572b31d3691f0b42a)Why is there a need for two separate lexers? Because of R2's Parse limitations?

Oldes

[07:52](#msg5b309f3dce3b0f268d409c3e)@hiiamboris what is wrong with `atan`? It is shorthand for `arctangent/radians`, isn't it?

hiiamboris

[08:09](#msg5b30a353479ca266897cebcb)@Oldes docstrings

[08:10](#msg5b30a361ce3b0f268d40a7fa)I'll make a PR when I got time

[08:10](#msg5b30a3630168e70c08ec0db8)no sweat

[08:10](#msg5b30a3800168e70c08ec0de0)besides, R3 has them correct

Oldes

[15:56](#msg5b3110a8ce3b0f268d41f616)Should not this return `1.#NaN` instead of error?

```
>> arcsine/radians -3.0
*** Math Error: math or number overflow
*** Where: arcsine
```

[16:00](#msg5b31119aad21887018dd230d)I believe these overflow errors are there from days when we had no `1.#INF` and `1.#NaN` values accessible.

[16:02](#msg5b311230b9c2fb25570a2c14)Btw... now the short names like `sin` are just shortcuts for `sine/radians`. I think that it would be more useful to provide these without all the conversion jumbo/mambo and rounding and map them just to libC versions to make them faster.

hiiamboris

[16:15](#msg5b31152ba288503b3dde33ed)&gt; Should not this return `1.#NaN` instead of error?

makes sense I guess

greggirwin

[17:44](#msg5b312a167d3bca737a09015d)&gt; I believe these overflow errors are there from days when we had no `1.#INF` and `1.#NaN` values accessible.

@Oldes that may be the best explanation, as the carry-over behavior from Rebol. Should add that to the ticket comments.

[17:52](#msg5b312bdebe98b1422407e090)@hiiamboris it looks like all the `function!` trig funcs, as opposed to natives, use `float!`. We should visit them all at once, and make sure they're consistent.

@Oldes, there is probably a reason they don't just use libC directly. @dockimbel or @qtxie would have to say.

hiiamboris

[17:54](#msg5b312c5b6ceffe4eba322f90)@greggirwin I've nothing against `float!`

[18:26](#msg5b3133d2b9c2fb25570a8ac0)https://github.com/red/red/pull/3447/files about the docstrings

[18:26](#msg5b3133e972b31d3691f2bce8)I don't need to open an issue for a PR do I?

Oldes

[19:10](#msg5b313e410168e70c08edd675)@greggirwin there is no reason why these (radians based) should not use libc directly (the \[libc is used anyway](https://github.com/red/red/blob/master/runtime/natives.reds#L1624)). The only difference with current behaviour is, that it does nicer formating... for example shows `0.0` in cases where it would show some not rounded value -&gt; https://github.com/red/red/blob/master/runtime/natives.reds#L1625

hiiamboris

[19:21](#msg5b3140c572b31d3691f2daf4)now that's a pretty weird thing to do - limit precision on a native level!

## Wednesday 27th June, 2018

Oldes

[13:52](#msg5b3396846ceffe4eba37b10c)What about this?

```
>> number? 1.#NaN
== true
```

I believe it should return `false` as `NaN` means \_Not a Number\_.

[13:54](#msg5b3396fa5862c35f47ccbcdc)But maybe it is too pedant.

[13:59](#msg5b339836a288503b3de3d7ba)On the other side, `number?` could be a native and do also tests for `NaN` and we would not need `nan?` function.

rebolek

[14:03](#msg5b33993e960fcd4eb927e608)What type then wiuld NaN be?

Oldes

[14:11](#msg5b339b237d3bca737a0e9afc)Hm.. good question. Don't know. It is undefined:/

[14:12](#msg5b339b46960fcd4eb927ebf0)I think it should be `float!`.

[14:12](#msg5b339b60a288503b3de3e144)But still `number?` should return `false` when testing it.

rebolek

[14:13](#msg5b339b9759799e7017467c77)I think we should be pragmatic here.

Oldes

[14:13](#msg5b339ba37d3bca737a0e9c7f)What do you mean? What I don't like is, that there is `nan?` and also `number?`.

rebolek

[14:15](#msg5b339c15aeb8fa0c0746db9e)You are the worst kind of right - technically right. NaN is not a number, but it would be IMO easier to leave it as it is.

Oldes

[14:18](#msg5b339ca1b9c2fb2557100376)And also that in most cases you would use `if not nan?`. Ok...there are more important topics.

rebolek

[14:20](#msg5b339d480168e70c08f3576e)Right. But it might be worth an issue for future reference.

endo64

[16:11](#msg5b33b7340168e70c08f3a824)As long as it treated as float:

```
>> float? 1.#NaN
== true
>> integer? 1.#NaN
== false
>> NaN? 1.#NaN
== true
```

Oldes

[18:28](#msg5b33d760be98b142240e4928)One more thing... In theory `atan2 0 0` should return `1.#NaN` instead of `0.0` . What do you think?

[18:30](#msg5b33d7d4b9c2fb255710b519)Although the needed additional check would slow down the function, so probably not worth the change.

gltewalt

[18:45](#msg5b33db5cd2abe466888f88f7)Not A Usable Number, I think. Quiet NaNs.

https://en.wikipedia.org/wiki/NaN

Oldes

[18:58](#msg5b33de6a59799e7017473fd1)I would not complicate it with qNaNs.. one NaN is enough... I just think that this code:

```
a: 0.0 while [a < 2.0 ][ 
    if number? n: asin a [print [a "=" n]] 
    a: a + 0.2
]
```

looks better than code where you would have to use `not error? try` now or `not nan?` if `asin` would return `1.#NaN` instead of throwing error.

[20:29](#msg5b33f3917d3bca737a0f89d2)From different topic... now there is:

```
>> f: func[a return: [integer!] c /local b][]
== func [a return: [integer!] c /local b][]
>> ? f
Func spec couldn't be parsed, may be malformed.
func [a return: [integer!] c /local b][]
```

Should not be there thrown error when the function is being defined?

endo64

[22:13](#msg5b340bf0b9c2fb2557113b84)Shouldn't `clear` clear the complement flag?

```
>> b: complement make bitset! []
== make bitset! [not #{00}]
>> clear b
== make bitset! [not #{00}]
```

[22:16](#msg5b340cce5862c35f47ce1096)This behavior is same with R3, but different with R2 (as there is no complemented flag in R2's bitsets)

gltewalt

[22:35](#msg5b3411247da8cd7c8c73ad12)I don't know why clear accepts bitset!. Bitset is not part of series!

[22:39](#msg5b341214ad21887018e43a1d)Hmm

```
>> b: complement charset ["x"]
== make bitset! [not #{00000000000000000000000000000080}]
>> clear complement b
== make bitset! #{00000000000000000000000000000000}
```

endo64

[22:40](#msg5b34124e960fcd4eb929344a)Bitset is not series but some of series functions work with bitsets like `pick`, `poke`, they are useful and simplifies using bitsets.

[22:41](#msg5b341282ad21887018e43b34)But I don't see any use case for keeping complemented flag when `clear`ing a bitset.

gltewalt

[22:42](#msg5b3412e4960fcd4eb929357b)I'm rebuilding my knowledge, but with the caveat that I probably don't know what I don't know, I agree.

## Thursday 28th June, 2018

endo64

[08:02](#msg5b349621960fcd4eb92a1d87)@dockimbel @greggirwin @9214 May I also ask your opinions for https://gitter.im/red/bugs?at=5b340bf0b9c2fb2557113b84

Oldes

[08:49](#msg5b34a1326ceffe4eba3a1385)@endo64 do you have any use case for clearing `bitset!` generally?

nickkoro02

[09:03](#msg5b34a47ace3b0f268d4a471e)Hi guys. Today I discovered that `break` doesn't work well in `foreach-face`:

```
ui: layout [ text "foo" ]

print "Starting"

foreach-face ui [ print face/type ]

print "Ended"
```

Works as expected, but if I add a break in the loop:

```
ui: layout [ text "foo" ]

print "Starting"

foreach-face ui [ print face/type break ]

print "Ended"
```

My program crashes without a message. The CLI console crashes, too,  
but it works fine if I compile the program and then run it.

Can somebody reproduce this/should I create an issue on github?

meijeru

[09:40](#msg5b34ad19ad21887018e55a39)On clearing bitsets \[see above](https://gitter.im/red/bugs?at=5b340bf0b9c2fb2557113b84) here is my opinion: `clear` should also clear the complement flag. That is what the average user will expect from the notion implied by the use of the word "clear". The complement flag is just a device for not having to set a lot of bits explicitly, especially given the upper limit of Unicode, since bitsets are often used for character sets.

endo64

[09:45](#msg5b34ae38479ca26689869b7e)@Oldes I don't have strong use cases for clearing bitsets instead of re-using them. But I think IF `clear` supports `bitset!` then it should also clear the complemented flag.

rebolek

[09:48](#msg5b34aed372b31d3691faa81a)I agree.

endo64

[10:38](#msg5b34ba9a72b31d3691fac6b8)@nickkoro02 Not exactly sure but this might be the reason; `foreach-face` evaluate the body block with `do`, hence fails. If you remove `do` below you can see the difference:

```
>> f: func [b] [foreach x [1 2 3] do b]
== func [b][foreach x [1 2 3] do b]
>> f [print x break]
1
*** Throw Error: no loop to break
```

nickkoro02

[18:20](#msg5b3526f9d2abe46688928330)@endo64 Hm... interesting. But I don't think this is expected, right? So it's probably worth an issue.

Oldes

[19:08](#msg5b35321bb9c2fb255713f575)@endo64 @nickkoro22 it is not a bug... the `do` is there redundant.. use just: `f: func [b] [foreach x [1 2 3] b]`

[19:10](#msg5b3532afd2abe4668892a063)With the `do` it is equivalent to:

```
>> f: func [b] [do b]
== func [b][do b]
>> f [print x break]
1
*** Throw Error: no loop to break
```

and:

```
>> do [print 1 break]
1
*** Throw Error: no loop to break
```

gltewalt

[20:43](#msg5b35487459799e70174a9a77)I think a literal `email!` should adhere to this format:

One or more characters followed by an at symbol `@`, followed by zero or more characters.

[20:46](#msg5b35490fb9c2fb25571432e6)In Red right now all that is required is a `@`

[21:05](#msg5b354d9f7d3bca737a12a968)Or: one or more characters, `@`, one or more characters

## Friday 29th June, 2018

gltewalt

[01:16](#msg5b358882aeb8fa0c074b8b03)Illegal characters appear to be: `%` `(` `)` `:` `"`  
For now.

## Sunday 1st July, 2018

hiiamboris

[19:40](#msg5b392e449b82c6701b99c6e6)@nickkoro02 I believe this is definitely worth an issue, since it's only logical that foreach* loops should accept a `break`

[19:41](#msg5b392e6070efc60660a4550e)plus it's quite unclear to me where the bug is:

```
>> ui: layout [ text "foo" ]
== make object! [
    type: 'window
    offset: none
    size: 100x44
    text: none
   ...
>> try/all [foreach-face ui [ print face/type break ]]
text
*** Script Error: catch does not allow native! for its block argument
*** Where: catch
*** Stack:

>> try/all [loop 1 [foreach-face ui [ print face/type break ]]]
text
(halted)
*** Script Error: try-do does not allow none! for its <anon> argument
*** Where: try-do
*** Stack:
```

[19:41](#msg5b392e70e534eb69a5bf220a)just what a mess is this?

gltewalt

[20:01](#msg5b393302bd92d807828acd41)It crashes my GUI Console

hiiamboris

[20:01](#msg5b39330df16644066110d7d6)yes, mine too

[20:01](#msg5b39331689db5e701c993361)I copied from the CLI

gltewalt

[20:01](#msg5b3933283c5abf52b6335098):thumbsup:

[20:19](#msg5b39376cf16644066110df6e)Does it work for you if you compile that example?

hiiamboris

[20:41](#msg5b393c7c70efc60660a46c00)well, it doesn't crash if compiled, but as to \*work* - unlikely:

```
Red [needs: 'view]
ui: layout [ text "foo" ]
probe try/all [foreach-face ui [ print face/type break/return 'x 'y ]]
probe try/all [loop 1 [foreach-face ui [ print face/type break/return 'x 'y ]]]
```

```
text
[]
text
[]
finished
```

I would expect it to return `x` not `[]`

gltewalt

[20:59](#msg5b3940a23d8f71623d53f1f7)I tried to use `stack/dump` and it barfed.

[21:01](#msg5b39413a3c5abf52b6336728)

```
*** Script Error: path none is not valid for unset! type
*** Where: eval-path
*** Stack:
```

[21:03](#msg5b3941a7216ee2623e936225)It might be my mistake, though, because I haven't done much debug mode.

```
Red [Needs: View]

system/view/debug?: on

ui: layout [ text "foo" ]

stack/dump

try/all [foreach-face ui [ print face/type break/return 'x 'y ]]
```

[21:07](#msg5b3942a089db5e701c994e9b)If I stick `stack/dump` afterthe try/all, it returns `text`, then blows up, so it must be unrelated

## Monday 2nd July, 2018

x8x

[02:15](#msg5b398ad6e49e0b3682f0bbbe)Nice little game, but when reaching the exit it crashes (macOS) , should open an issue?

```
do https://gist.githubusercontent.com/maximvl/6787d6fb3382bf72399eab87b2857d86/raw/eb07d68dff6a718739d56817869dcf769d909dff/game.red

*** Runtime Error 1: access violation
*** at: A48EEF24h
```

[02:37](#msg5b398fe2e49e0b3682f0bbc0)@rebolek Could you please test this on macOS, do the code 1 time, close window, do the code a second time without quitting red, window open, graphics shows up, but no animation and beach ball, have to ctrl-c

```
do https://gist.githubusercontent.com/toomasv/9c7f400a36fecec9e9b2faf567035ea5/raw/9621390243c683fe683a25f5f8b6c22186ecee87/ellipse1.red
```

rebolek

[03:52](#msg5b39a195a99e1e52b70e0192)@x8x I've built latest gui-console and tried running above code. It works without problems, I run it 3 times in row and worked each time.

x8x

[03:56](#msg5b39a2698f5a13513955edc4)@rebolek Thanks! Can you please try running above than this one

```
do https://gist.githubusercontent.com/toomasv/b8883f41543c4b54142b4a62a5386797/raw/d0e8f00ab6b6cd3a1bb32f6ad789197955579744/spirograph.red
```

and a mix of firt one than the other, I don't get the beach ball all the time

rebolek

[03:59](#msg5b39a3237b811a6d63c7781e)I've run mix of both ~10 times. I got beach ball on first run for ~5-10 seconds, but I guess it was connection problem, because after that time, window appeared and everything run as expected.

x8x

[04:01](#msg5b39a388570da9100dadf648)@rebolek Ok, thanks! you're on macOS 10.12 right?

rebolek

[04:01](#msg5b39a39e81816669a4281692)@x8x 10.11.6

x8x

[04:02](#msg5b39a3bd8d75e7510649cb6f)OK, thank you! :smile:

rebolek

[04:02](#msg5b39a3e17b811a6d63c779eb)I'm afraid of upgrading, but probably will in few weeks :)

greggirwin

[23:49](#msg5b3aba0e81816669a42add17):point\_up: \[June 27, 2018 7:59 AM](https://gitter.im/red/bugs?at=5b339836a288503b3de3d7ba) I like `number?` being consistent with the other type checking funcs. In that sense, NaN is a number, as it's represented as a special float value.

[23:51](#msg5b3aba75e534eb69a5c29ee7):point\_up: \[June 27, 2018 12:28 PM](https://gitter.im/red/bugs?at=5b33d760be98b142240e4928) if we have a choice of "fast and wrong" versus "slow and correct" we really don't have a choice. :^)

[23:56](#msg5b3abba2f166440661143947):point\_up: \[June 27, 2018 2:29 PM](https://gitter.im/red/bugs?at=5b33f3917d3bca737a0f89d2) @Oldes , would you open a ticket for that. `Help` should handle that, so it's a bug.

## Tuesday 3th July, 2018

greggirwin

[00:16](#msg5b3ac0743572e970c1708110):point\_up: \[June 27, 2018 4:13 PM](https://gitter.im/red/bugs?at=5b340bf0b9c2fb2557113b84) On bitsets, I don't think `clear` should clear the `not` meta flag. https://www.red-lang.org/2013/11/041-introducing-parse.html points to http://www.rebol.com/r3/docs/datatypes/bitset.html, which clearly says

&gt; Note that a complemented bitset remains complemented. The clear function does not reset the flag.

[00:32](#msg5b3ac405f16644066114452b)The use case I see if outside the realm of charsets as we might normally use them with `parse`. If you use bitsets as a more general sparse map or index.

[00:40](#msg5b3ac5f3f1664406611448ec)`Foreach-face` with `break` is worth a ticket.

[00:41](#msg5b3ac62270efc60660a7c89a)@Oldes, how can we make the most efficient use of your time on the trig funcs, to make decisions on what results should be, and also document those decisions?

hiiamboris

[13:08](#msg5b3b753c63042f2df352737d)it seems for about a week @rebolek is the only provider of windows builds

rebolek

[13:09](#msg5b3b7588f16644066115bf9d)@hiiamboris how is it so? Official download page is not working?

ne1uno

[13:12](#msg5b3b762663042f2df35275fb)no commits?

[13:12](#msg5b3b7656bd92d807828fb84c)how about a simple-gc build? I get a bunch of hard crashed on the gui console

[13:13](#msg5b3b7689bd92d807828fb870)few of the demos the code repo, others seem to work

hiiamboris

[13:14](#msg5b3b76a1f16644066115c20b)@rebolek seemingly because the appveyor gets out of it's allowed build time and blocks it

rebolek

[13:14](#msg5b3b76d0bd92d807828fb93f)@hiiamboris interesting

[13:15](#msg5b3b76f181816669a42c8350)I'm not doing any testing of the builds, so I don't know if they are working.

ne1uno

[13:16](#msg5b3b7725bd92d807828fba05)I think it just builds when there is a commit to master.

hiiamboris

[13:17](#msg5b3b775263042f2df3527a03)oh right there's also no commits for 5 days into master

rebolek

[13:18](#msg5b3b778881816669a42c85b4)That's a check I have to add to my build script yet :)

[13:18](#msg5b3b77ac89db5e701c9dfc78)Right now it just blindly builds every day.

ne1uno

[13:21](#msg5b3b7871e534eb69a5c43641)none of the bots showing commit logs tag the branch, makes it more difficult to track

rebolek

[13:23](#msg5b3b78e7bd92d807828fbeb3)Hm, maybe I could add commit logs by branch to my builds page, GitHub API should make it easy to track it (and if not, git log is super easy to parse).

[13:34](#msg5b3b7b7860c387078359d3ed)So there's total 38 Windows builds on my server (28. May - 3. July), but only 9 of them are unique.

[13:35](#msg5b3b7b9a3d8f71623d58cbf8)This really needs some optimization...

Oldes

[14:40](#msg5b3b8af1bd92d807828feef8)&gt; :point\_up: \[June 27, 2018 12:28 PM](https://gitter.im/red/bugs?at=5b33d760be98b142240e4928) if we have a choice of "fast and wrong" versus "slow and correct" we really don't have a choice. :^)

Sorry @greggirwin , but I don't understand what do you mean. As `atan2` is usually used to find angle from 0x0 to a cursor position, when the result is `0x0` for the input `0x0`, it may break your animation or whatever you do with it. The proper calculation should detect such an input . If the result would be `1.#NaN`, you could check output for such a case. With the modification to `number?` you could write:

```
if number? angle: atan2 y x [...]
```

[14:48](#msg5b3b8ca73d8f71623d58fbb0)Also when there are now 2 almost same trigonometric functions, one can be used as a \_slower but more precise_ and the second one as a \_faster but without rounding results_

rebolek

[14:49](#msg5b3b8d069b82c6701b9ef3db)If by two almost same functions you mean `atan2` and `arctangent2`, I would prefer them to follow the convention and one accept degrees, while second radians.

hiiamboris

[15:58](#msg5b3b9d2070efc60660a9c406)I totally agree with Gregg that `number? 1.#NaN` should be true because `number?` is a test for membership in a `number!` typeset which includes `float!` and `1.#NaN` is definitely a `float!` and it would be quite misleading to have it otherwise  
Although it is a fair observation that `true = number? not-a-number` is an unfortunate oxymoron we'll have to live with, but it's a naming issue, right?

[16:03](#msg5b3b9e369b82c6701b9f2ab1)As to rounding `atan` to zero, I would myself like to know why it's even done like that. What's the reason? I would expect `sin 1e-100` to be the same `1e-100`, not zero (same for tan/atan obviously). Maybe I'm going to multiply it by 1e99 in the next step? Why should I suffer from the loss of precision? Why should I fight the language while it makes obstacles for me?  
I bet @dockimbel knows... ;)

Oldes

[16:53](#msg5b3ba9fcf1664406611663a3)And do you have any real life example why `number? 1.#nan` returning `true`is useful? With a cost that there is also `nan?`, which could be eliminated?

[16:55](#msg5b3baa7270efc60660a9e994)The rounding is there to have nice results in console.

[17:08](#msg5b3bad98e534eb69a5c4dbee)The question is.. if this rounding should not be done in `mold` or `form` functions.. if it is needed.

hiiamboris

[17:29](#msg5b3bb263bd92d80782906d4c)&gt; The rounding is there to have nice results in console.

I'm not so sure. Do you have any arguments why this rounding is done to prettify the output? As you say yourself the proper place for that is in mold/form.  
It looks like this rounding goes all the way from Rebol, but then Rebol isn't as general-purpose as Red strives to be, and maybe Carl thought that the average user will only use these functions for geometry calculations, where forcefully aligning the line along the axis might even do you good. But that's a blind guess.

[17:30](#msg5b3bb2aa81816669a42d4557)&gt; And do you have any real life example why `number? 1.#nan` returning `true`is useful? With a cost that there is also `nan?`, which could be eliminated?

Easy. `f: func [x [number! string!]] [either number? x [...][...]]`

[17:31](#msg5b3bb2f73572e970c172c6dd)why would I transform it to `either any [number? x nan? x]`? looks like a bloat to me, and not just bloat but also \*yet another* special case to always keep in mind =&gt; source of bugs =&gt; source of headaches =&gt; less fun to code in

greggirwin

[17:45](#msg5b3bb6293572e970c172cea8)The trig chat is why I asked about the best way to nail down and document the design. I agree that similar named funcs that take different value types (deg/rad) can be confusing.

\- What are the behaviors today (maybe in a table)?  
\- What are the common use cases for each func?  
\- Where do those two things diverge?

The benefit of `number?` with NaN being like it is? Consistency. Ease of understanding. Typeset checking has very clear semantics today. If we go down the path of special value validity, where will that lead? The result of `make email! ""` is not going to be a valid email address, but it's still a value of that type. As @hiiamboris said, it's the IEEE name for it that's the problem here. If we call it "Not A \*Usable* Number", does that help? :^)

rebolek

[18:03](#msg5b3bba6689db5e701c9ec39f)If you think the rounding is too much, try to play with `system/options/decimal-digits`

hiiamboris

[18:04](#msg5b3bbab760c38707835a9220)@rebolek it's rounded by float! epsilon there, which doesn't even take exponent into account

[18:05](#msg5b3bbad83c5abf52b638f6f2)`if result < epsilon [result = 0]` just like that

rebolek

[18:06](#msg5b3bbb1081816669a42d571c)@hiiamboris ok, it was just a guess

hiiamboris

[18:08](#msg5b3bbb8f7e23133ecb2ea6a0)https://github.com/red/red/blob/master/runtime/natives.reds#L1625  
in fact, `tangent` is unaffected, only sine and cosine

[18:08](#msg5b3bbba4f166440661169826)

```
>> 1e100 * sin 1e-100
== 0.0
>> 1e100 * tan 1e-100
== 1.0
```

[18:08](#msg5b3bbbba63042f2df353478f)which is even more weird to my eye

greggirwin

[18:55](#msg5b3bc69c89db5e701c9ee07b)https://github.com/red/red/wiki/Trig-Functions---Behavior-and-Design

## Wednesday 4th July, 2018

bitbegin

[01:11](#msg5b3c1eaaf166440661177770)

```
>> probe make error! [user message ["tests"]]
make error! [
    code: 600
    type: 'user
    id: 'message
    arg1: none
    arg2: none
    arg3: none
    near: none
    where: none
    stack: none
]
*** User Error: none
*** Where: ??? 

>>
```

[01:11](#msg5b3c1ec6bd92d80782916d1a)the "tests" string not exist in error!

[01:11](#msg5b3c1ede9b82c6701ba04f76)Is this a bug?

greggirwin

[05:12](#msg5b3c574d63042f2df3548b92)`cause-error` works, and just wraps `make error!`. Hmmm.

```
>> error? set 'err try [cause-error 'user 'message ["tests"]]
== true
>> probe err
make error! [
    code: 600
    type: 'user
    id: 'message
    arg1: "tests"
    arg2: none
    arg3: none
    near: none
    where: 'do
    stack: 41519516
]
*** User Error: "tests"
*** Where: do
*** Stack: probe
```

[05:14](#msg5b3c57b13572e970c1741c39)It's late here, and not obvious to me right now if there's something I'm missing.

bitbegin

[05:26](#msg5b3c5a7dbd92d8078291dae5)this way is ok, but make error! not same with rebol

Oldes

[07:13](#msg5b3c73997e23133ecb302bfd)@hiiamboris you could write `either string?` instead of `number?` if you really expect NaN values there too (which is not much

[07:14](#msg5b3c73d4bd92d8078292191a)...not much likely)

[07:16](#msg5b3c743a60c38707835c1675)It would be also more efficient as it would do test just against one type and not a lookup. Still I don't consider it to be a real life example.

## Thursday 5th July, 2018

hiiamboris

[17:42](#msg5b3e586a3572e970c179111c)tell me if I'm doing smth wrong or it's a couple bugs in `load-thru`:  
1\. `? (load-thru https://picsum.photos/100/100?random)` works 1st time, saves it but won't load it again, complaining (solved by `do load-thru ...`)  
2\. `? (load-thru https://picsum.photos/100/100/?random)` (note the slash) won't save the image at all

greggirwin

[20:37](#msg5b3e8182e534eb69a5cba2b2)1) loads from cache fine here, but if you want a new random image, you'll need to use `exists-thru?` and clear the file. For a random result, it doesn't make sense to use the cache. See also: https://github.com/red/red/pull/3124

2\) https://github.com/red/red/issues/3117 added some fixes, but this is the issue.

```
>> path-thru https://picsum.photos/100/100/?random
== %/C/Users/Gregg/AppData/Roaming/Red/cache/picsum.photos/100/100/
```

hiiamboris

[20:53](#msg5b3e855681816669a433fd2b)@greggirwin hmm interesting... just updated to July 5 ver, still getting on (1):

```
>> ? (load-thru https://picsum.photos/100/100?random)
*** Script Error: word-is-value-str does not allow block! for its word argument
*** Where: word-is-value-str
*** Stack: ? help-string
```

greggirwin

[21:34](#msg5b3e8ed463042f2df359cc13)Interesting indeed. It's saving as a molded Red image it seems, which is not handled properly.

[21:34](#msg5b3e8ef033b0282df403ae35)That is, it works the first time, but errors the second time. It did work twice in a row for me before.

[21:37](#msg5b3e8f83bd92d80782974563)Ah, it's `help` that's choking on the result.

[21:38](#msg5b3e8fc263042f2df359ce97)Due to the `paren!` it seems. Care to file a ticket?

## Friday 6th July, 2018

hiiamboris

[06:20](#msg5b3f0a4a63042f2df35aa68f)@greggirwin sure, since you confirmed it  
It saves as a molded `image!` but then loads - as a `block!`, so as I said previously I have to `do` it (which is probably not by design)

greggirwin

[07:24](#msg5b3f19277e23133ecb3630fc)We should consider the `*-thru` funcs as works in progress. We don't yet have `/all` for saving, for example. That's the issue at play here. I just checked, and R2 uses `read-thru`, which does `read+write/binary` rather than `load/save` directly.

[07:25](#msg5b3f19749b82c6701ba6f20b)Along with the naming issue from the above ticket, it's worth revisiting in the future. e.g., if used by the module system, we'll want it to work well for that.

gltewalt

[07:58](#msg5b3f21223c5abf52b6407786)Is this a bug, or the expected result?

```
>> 42x42 // 84x84
*** Script Error: cannot compare 42x42 with 0
*** Where: <
*** Stack: mod
```

[08:00](#msg5b3f21b17e23133ecb3645e9)or `mod 84x84 42x42`, or mod &lt;any-pair&gt; &lt;any-pair&gt;

rebolek

[08:01](#msg5b3f21e589db5e701ca64199)Both args can be `pair!`, so a bug IMO.

gltewalt

[09:01](#msg5b3f2fdde534eb69a5cce08c)I'll open an issue when I wake up.  
...Too loopy from lack of sleep right now

hiiamboris

[12:01](#msg5b3f5a337b811a6d63d4e2bd)@greggirwin I added the trailing slash problem to https://github.com/red/red/issues/3117  
Perhaps it's worth to reopen it?

meijeru

[16:36](#msg5b3f9a7633b0282df405f44c)The issue #2674 covers the `mod` problem already.

greggirwin

[18:15](#msg5b3fb1b060c387078363cbbc)@hiiamboris, done. Thanks.

gltewalt

[19:25](#msg5b3fc21770efc60660b344be)Thanks @meijeru

## Saturday 7th July, 2018

hiiamboris

[22:20](#msg5b413cc67b811a6d63d8625f)@dockimbel once you have a minute I'd also like you to tell if this :point\_up: \[July 6, 2018 6:55 PM](https://gitter.im/red/help?at=5b3f90e13d8f71623d622f93) is a bug in react or what

## Sunday 8th July, 2018

toomasv

[05:55](#msg5b41a76860c387078366d760)@hiiamboris IMO this works as expected. In second version you are just clearing `face/data`. (You might want to use `react later` in first version)

hiiamboris

[07:19](#msg5b41bb1bf16644066122b508)&gt; In second version you are just clearing `face/data`

@toomasv am I? ;) I'm passing this cleared block to `reduce/into` which is getting filled as you can see from `probe` output - it prints `[3]` when I enter `1 + 2` into the `field`  
Moreover, face being deep reactor should see the change. `dump-reactions` tells that it's registered also.

toomasv

[07:38](#msg5b41bf8063042f2df35f84f4) @hiiamboris YAR, `face/text` is not updated when `face/data` changes

```
view/no-wait [f: field text react later [face/text: form probe reduce/into f/data face/data: clear []]]
```

hiiamboris

[07:44](#msg5b41c0e77b811a6d63d8ffe1)yes and it's curious since to me the change in code looks purely cosmetic...

toomasv

[08:01](#msg5b41c4e19b82c6701babb413)@hiiamboris Interesting - this works with "delay"

```
view/no-wait [f: field text react later [probe reduce/into f/data clear face/data: []]]
```

hiiamboris

[08:09](#msg5b41c6b09b82c6701babb672)I was inspecting `:on-face-deep-change*` and it looks like it changes `data` in response to a deep change of `text` but not the other way around, so the only `data` -&gt; `text` mechanism lies in `:on-change*`

[08:14](#msg5b41c7d770efc60660b638a5)explains the "delay" then: you change the text -&gt; `face/data: []` assigns it to itself and triggers `on-change*` which displays stuff by modifying `face/text` -&gt; then `face/data` is modified yet modifications remain unreflected until the next `face/data: []` event

[08:16](#msg5b41c86963042f2df35f9232)adding an explicit deep reaction: `view [f: field text react [probe reduce/into f/data face/data: clear []] react [face/text: form face/data]]` fixes it

luce80

[15:56](#msg5b42343163042f2df36049e4)

```
>> about
Red 0.6.3 for Windows built 7-Jul-2018/21:53:14+02:00 commit #0db15f7
on Win 7
>> view [panel red [text "Hello" green]]
```

In this example the text is black in a &lt;same-as-windows-background-color&gt; instead of black on green. It worked on version of April 2017.

hiiamboris

[16:04](#msg5b42360489db5e701cabc519)@luce80 https://github.com/red/red/issues/3448 it was supposed to be fixed

[16:06](#msg5b4236a2a99e1e52b7203b7a)on my build of July 5, this:  
!\[](https://i.gyazo.com/fc346422cad119cf006dfebe5474d4a2.png)

[16:11](#msg5b4237a19b82c6701bac72c9)@luce80 I commented on that ticket, let's wait now for @greggirwin to reopen it.

ne1uno

[16:13](#msg5b4238159b82c6701bac73a8)jun 23 simple-gc branch on win7 has green on red both old and new gui

[16:29](#msg5b423be4e534eb69a5d2382f)building latest source seems broken on windows.

luce80

[16:58](#msg5b4242d160c387078367dd0f)@ne1uno green on red should be the right thing since first given color should be the color of text while second color should be that of background.

ne1uno

[17:03](#msg5b4243cd3c5abf52b645fb26)Windows built 23-Jun-2018/19:27:16-04:00 commit #978c011 works, must be some commit to master between 6/23 and 7/5 the recent simple-gc branch also still works

[17:04](#msg5b4244073c5abf52b645fb5a)build from master 7/5 fails here too

greggirwin

[18:33](#msg5b4258e83c5abf52b6461e09)@hiiamboris @toomasv, without digging into it, my first instinct was that you're running up against cycle detection in the reactive system. Add deductions and more hints to https://github.com/red/red/wiki/Reactivity if you would.

hiiamboris

[18:59](#msg5b425f1f7b811a6d63da107e)I think it's a bug. Why bother with documenting a bug? I say let's wait for Doc's word.

greggirwin

[19:01](#msg5b425f703c5abf52b6462771)&gt; Why bother with documenting a bug?

So others (which means me in a month) have "Danger!" signs that keep them from falling into pits. :^)

[19:01](#msg5b425f9e63042f2df360a274)If you think it's a bug, ticket it, so we'll remember it after the 0.6.4 push is over.

hiiamboris

[19:03](#msg5b425fea81816669a43ac952)Well, I'm not \*completely* sure :) as is also the case with sine/cosine. There might be reasons...

toomasv

[19:08](#msg5b42613c7e23133ecb3be7d8)My hypothesis was it is connected to number of changes in `face/data`. First time it is cleared, second time result of `f/data` is reduced into it. Only first change is reflected in `face/text`. May be completely wrong though.

hiiamboris

[19:10](#msg5b426188e534eb69a5d27cb7):point\_up: \[July 8, 2018 11:09 AM](https://gitter.im/red/bugs?at=5b41c6b09b82c6701babb672)

toomasv

[19:11](#msg5b4261fd63042f2df360a6b0)Yep

## Tuesday 10th July, 2018

gltewalt

[05:20](#msg5b44420233b0282df40e7902)Hmmm

```
>> prin append/dup [] '* 1
*** Script Error: * operator is missing an argument
*** Where: prin
*** Stack:

>> prin (append/dup [] '* 1)
*** Script Error: * operator is missing an argument
*** Where: prin
*** Stack:

>> prin [append/dup [] '* 1]
*
```

[05:23](#msg5b4442eb63042f2df364cb93)

```
>> prin append [] '*
*** Script Error: * operator is missing an argument
*** Where: prin
*** Stack:

>> append [] '*
== [*]

>> prin '*
*
```

rebolek

[05:25](#msg5b44434e7e23133ecb400e3c)@gltewalt that's fine, `print` reduces its argument, so `*` gets executed

[05:27](#msg5b4443a860c38707836c1a88)

```
>> print head insert next [2 3] '*
6
```

gltewalt

[05:27](#msg5b4443c29b82c6701bb0b0ea)And `prin '*`?

rebolek

[05:28](#msg5b444405f16644066127d6fc)`'*` is not a `block!`, so it's not reduced.

gltewalt

[05:29](#msg5b4444343d8f71623d6ac4a2)The evaluator doesn't reduce? `'*`, to `*`

rebolek

[05:30](#msg5b44446ef16644066127d776)It's up to `print` how it interprets its arguments. It's native, so you need to look at R/S sources to be exactly sure.

gltewalt

[05:30](#msg5b4444899b82c6701bb0b1d2)ok

[05:37](#msg5b444613e534eb69a5d688fe)I can't remember right now... when was the `wait` issue planned to be fixed for GUI Console?

rebolek

[05:38](#msg5b4446437b811a6d63de2840)IIRC in 0.6.4? I will try to find it.

gltewalt

[05:47](#msg5b44487a9b82c6701bb0b97f)Is this output wanted?

```
>> p: make path! 10
== 

>> insert p 'root
== 

>> append p 'refinement
== root/refinement
```

rebolek

[05:50](#msg5b444942e534eb69a5d68e3b)I guess so.

endo64

[07:11](#msg5b445c3133b0282df40eba06)@gltewalt `insert` inserts the value to the current position and returns the position just after the insert. This gives you to chain insert operations

```
>> p: make path! 10
>> head insert p 'root
== root
>> head insert insert p 'a 'b
== a/b/root
```

[07:12](#msg5b445c6f60c38707836c5931)Append is simply does `head insert tail series`

gltewalt

[07:16](#msg5b445d4463042f2df365061d)I just thought it strange that there’s no representation of a return value for `make path!`. It’s just `==`

greggirwin

[08:00](#msg5b44678da99e1e52b724e3ad)Do it with a block, and you'll see an empty block. Paths with a single item in them just look empty. :^)

Oldes

[09:43](#msg5b447fb981816669a43f48cf)What about using serialized form in such a case :

```
>> p: make path! 10
== #[path! []]
>> insert p 'root
== #[path! [root] 2]
```

endo64

[15:30](#msg5b44d0f97e23133ecb4189c3)Or only when the path is empty, show it as `== make path! []` in console, just like as hash values:

```
>> h: make hash! 0
== make hash! []
>> p: make path! 0
== make path! []  
>> form h  ; == ""
>> form p ; == ""
```

But mold would be different.

9214

[15:39](#msg5b44d314bd92d80782a3c3a3)

```
text
>> tail 'foo/bar/baz
== 
>> append/dup/only [] make path! 0 5
== [    ]
```

Oldes

[15:39](#msg5b44d3473572e970c185cd3f)Should be:

```
>> append/dup/only [] make path! 0 5
== [#[path! []] #[path! []] #[path! []] #[path! []] #[path! []]]
```

[15:42](#msg5b44d3cebd92d80782a3c5aa)@endo64 you must use serialized form... `make path! []` is not enough in such a case:

```
>> empty? p: insert insert make path! 0 'root 'foo
== true
>> p
== #[path! [root foo] 3]
>> index? p
== 3
>> head p
== root/foo
```

gltewalt

[18:19](#msg5b44f8a5a99e1e52b7265943)Good thoughts

hiiamboris

[19:14](#msg5b45059ca99e1e52b7267fc9)is there a reason Red's so unfriendly to big files?

```
>> d: read/binary %"D:\filmz\560MB-test.mp4" 
== #{
00000018667479706D7034320000000069736F6D6D703432001C27D76D6F6F76
0000006C6D76686400000000D4...
>> d: read/binary %"D:\filmz\560MB-test.mp4" 
*** Internal Error: not enough memory
*** Where: read
*** Stack:  

>> d: read/binary %"D:\filmz\560MB-test.mp4" 
*** Access Error: cannot open: %D:\filmz\560MB-test.mp4
*** Where: read
*** Stack:
```

[19:15](#msg5b4505c7f16644066129df58)(there's plenty of RAM actually, Red console doesn't even go over 1.1GB)

[19:16](#msg5b45060263042f2df366d00e)anything over 700MB - goes right into "not enough memory" step

greggirwin

[19:30](#msg5b45096633b0282df4109f5d)Still Alpha remember. :^) I don't know the reason for the limit right now.

hiiamboris

[19:32](#msg5b4509ce7e23133ecb422dbc)worth an issue? ;)

greggirwin

[19:33](#msg5b450a1133b0282df410a110)Probably not. Something to note, though, as a current limitation.

hiiamboris

[19:34](#msg5b450a2c33b0282df410a1cc):+1:

greggirwin

[19:37](#msg5b450b0381816669a440d895)Nothing complex in the code, so likely just an alloc failure trickling up.

## Wednesday 11st July, 2018

9214

[06:55](#msg5b45a9e363042f2df3686eb7)In the same vein, Draw can't handle (very) large images:

```
*** Script Error: invalid argument: 56264x84424
*** Where: make
*** Stack: view do-events do-actor do-safe fit prettify draw
```

Oldes

[08:28](#msg5b45bf963c5abf52b64df2a2)@9214 That seems to be ok as R3 has same result, just with better message:

```
>> make image! 56264x84424
** Script error: maximum limit reached: image!
** Where: make
** Near: make image! 56264x84424
```

9214

[08:28](#msg5b45bfbc3d8f71623d6ea846)Any rationale behind this limit?

Oldes

[08:44](#msg5b45c36a81816669a442a721)I believe that image size is encoded in a 32bit integer in Rebol. That is first limit.

rebolek

[08:45](#msg5b45c38e63042f2df368bf12)I believe that 56264x84424 is enough for everyone.

Oldes

[08:45](#msg5b45c3b533b0282df4126cab)Same in Red:

```
red-image!: alias struct! [
	header 	[integer!]								;-- cell header
	head	[integer!]								;-- series's head index (zero-based)
	node	[node!]									;-- internal buffer or platform-specific handle
	size	[integer!]								;-- pair of size
]
```

[08:47](#msg5b45c42e33b0282df4126d52)Second limit is, that with so many pixels you get array over 4GB so you could not address it using 32bit integers.

9214

[08:49](#msg5b45c48f3c5abf52b64e004d)@Oldes thanks!

[08:56](#msg5b45c6383c5abf52b64e04ca)@rebolek it wasn't for me. I can live with that though.

rebolek

[09:37](#msg5b45cfd160c3870783703a3b)@9214 next time you're going to tell me that 640kB isn't enough for you either

9214

[09:43](#msg5b45d12933b0282df412943f)Blasphemy!

## Saturday 14th July, 2018

hiiamboris

[19:53](#msg5b4a54bcc2d95c60f4dabfb9)is this a desired behavior?

```
>> bind quote (a + b) context [a: 1 b: 2]
*** Script Error: bind does not allow paren! for its word argument
*** Where: bind
*** Stack:
```

[19:54](#msg5b4a550f866e0c6b15a7f9dc)I can add `as block!` no problem, but why bind can't do that itself?

endo64

[21:14](#msg5b4a67b06534bc5d2e5ba0ee)a word or block of words can be bound to a context, a paren cannot. why would you need it? `do bind [a + b] context [a: 1 b: 2]` would work.

hiiamboris

[21:16](#msg5b4a682f66c1e833a9e8d5e8)&gt; a paren cannot

since internally paren! is a block!, I don't see why limit `bind`, why can't it take any-block! (or at least paren! and hash!)

&gt; why would you need it?

to evaluate expressions, akin to those in parse DSL, just in a special context

[21:25](#msg5b4a6a4973026160f5a15589)come to think of, it makes sense to bind any-path! as well sometimes, i.e. if I'm constructing a path of words and going to reduce it after, before accessing

## Sunday 15th July, 2018

greggirwin

[02:15](#msg5b4aae4e1c0f906b1453d893)@hiiamboris more good questions. Remember, though, that the goal is to be expressive and flexible...to a point. A change like this requires solid justification. I can see parens being trickier to reason about here, because they are evaluated by default. So now your binding code has to know if it might ever get a paren, and use `quote` as you do above. Same for paths.

[02:16](#msg5b4aae79866e0c6b15a8b05c)It's certainly worth some concrete examples for discussion.

hiiamboris

[07:56](#msg5b4afe10c02eb83d7c75c7a9)@greggirwin `quote` is there just to make a short example. I was making a DSL that will among things contain blocks (that will denote loops) and parens (that akin to parse will denote expressions). So I don't get `quote` there, parens come naturally from `foreach token expression [switch type?/name token [...]]` Context for it is created on the fly where most of the words used will have meaning. It's just a first iteration, and I think I'll experiment a bit and instead of `paren! [do bind as block! token]` will just bind the whole expression, that will recursively bind all my parens. So, no trouble with that.

It's just that when I wrote this 1st iteration, I wrote `do bind token` assuming that `bind` being able to bind blocks - should be able to bind parens too. I didn't even check it, until I got an error. It's just logical, no? That's why my question arose here, if it's desired.

For bound paths I have no use yet, I just foresee that it can be used this way.

Hash! is a curious beast though. I've never used it, I don't know what it will be good for. But since it provides a block-like interface, I believe it's reasonable to have it also support block-like features. Otherwise it'll be quite inconvenient to use, yes? Currently hash does not support neither `bind`-ing it nor `reduce`-ing or `do`-ing. It sort of lives in a different world with no interface to Red features. I cannot know if it's by design or because it's a recent addition and is not \*yet* integrated enough.  
It should be considered:  
1\. if `bind` should be able to bind hash values  
2\. what will bind do if it encounters a hash inside a block - bind or skip?  
3\. if it makes sense to `do`/`reduce` a hash just like any block or is there arguments against that

greggirwin

[15:02](#msg5b4b620c866e0c6b15ab649f)`Bind` only supports blocks, by design right now. As I said, it's a good question, and needs examples for discussion. `Hash!` is, indeed, a special case right now. I agree that a unified interface is a good thing, but we may need to live with some exceptions.

[15:06](#msg5b4b62ff9a612333aa63f705)In glancing at `%hash.reds`, I saw that the `append` action is not inherited, but hash! supports `append`. Early here. Must be missing something.

gltewalt

[23:48](#msg5b4bdd5a95e03e3d7b505f90)`trim/all` causes spooky behavior here:

```
digits: charset ["0123456789"]

mastercard: [["51" | "52" | "53" | "54" | "55"] to end]

visa: ["2" to end]

accepted-cards: [mastercard | visa]

valid-length: [16 digits]

validate-entry: func [n][parse trim/all n valid-length]

view [
    f: field 200x20 on-change [either validate-entry f/text [f/color: green][f/color: white]]
]
```

Or I may be dumb.

This works if `trim/all` is removed:

```
digits: charset ["0123456789"]

mastercard: [["51" | "52" | "53" | "54" | "55"] to end]

visa: ["2" to end]

accepted-cards: [mastercard | visa]

valid-length: [16 digits]

validate-entry: func [n][parse n valid-length]

view [
    f: field 200x20 on-change [either validate-entry f/text [f/color: green][f/color: white]]
]
```

[23:56](#msg5b4bdf119a612333aa656c62)When I include trim/all, the chars `field` are inserted backward. Then an overflow happens eventually.

## Monday 16th July, 2018

endo64

[00:00](#msg5b4be00466c1e833a9ecc0bd)`trim/all` causes another `on-change` event trigger, and so on, until you get stack overflow.

gltewalt

[00:00](#msg5b4be023866e0c6b15ad9aa6)Or any trim it looks like

endo64

[00:00](#msg5b4be039c02eb83d7c79b491)On any change actually.

[00:01](#msg5b4be05a95e03e3d7b5069e6)This should work

```
f: field 200x20 on-change [txt: trim/all copy f/text either validate-entry txt [f/color: green][f/color: white]]
```

gltewalt

[00:02](#msg5b4be0a395e03e3d7b506b6f)Is that the easiest way?

endo64

[00:03](#msg5b4be0df866e0c6b15ad9d88)Or

```
f: field 200x20 on-change [either validate-entry trim/all copy f/text [f/color: green][f/color: white]]
```

[00:05](#msg5b4be15c1c0f906b1458e2fb)Worth to note somewhere, on-change can be triggered inside the on-change event if you change the value of the face and leads to stackoverflow. Not sure if should not be triggered inside the event.

gltewalt

[00:08](#msg5b4be1f3c02eb83d7c79bd51)I like the second example

[00:09](#msg5b4be223866e0c6b15ada230)Is it a bug or is on-change supposed to be triggered by on-change?

endo64

[00:34](#msg5b4be82ac02eb83d7c79d70a)I can't say that it is a bug, because on-change should be triggered when ever face's text change, if you change it inside the on-change event, it triggers another on-change.  
But the problem `trim` triggers a change even if it didn't make any change on the text.

[00:35](#msg5b4be835c02eb83d7c79d724)See this example:  
`view [f: field on-change [print random 100 trim f/text]]`

[00:35](#msg5b4be86895e03e3d7b508b45)When you type one character you'll see a bunch of random number and then stackoverflow error.

greggirwin

[02:43](#msg5b4c064b582aaa63076ed90d)Recursive triggers are not a bug, just something to be aware of. \*However\*, this does seem to trip over internal ownership checking, which is tied to reactivity. If that's not already a ticket, please write it up. You can cause problems by appending an empty string, or using `remove` as well. Until that's fixed, we should put a warning in a wiki somewhere about the current behavior.

[02:43](#msg5b4c0654c02eb83d7c7a4272)Good catch.

dander

[06:08](#msg5b4c36611c0f906b145a253a)There seems to be some miscalculation for the width of the description column of help text for `string!` values. In the Red sources, `VAL_FORM_LIMIT` doesn't seem to take into account extra spaces between the columns, so the end of the description text flows down to the next line.  
To see what I mean, try `? "series"`

endo64

[06:55](#msg5b4c417f66c1e833a9eddf3e)@dander Looks OK on Win8.1 for both Red/CLI and Red/Gui console

dander

[07:04](#msg5b4c43871c0f906b145a7110)Hmm, interesting. This is how it looks for me in cli:  
\[!\[image.png](https://files.gitter.im/red/bugs/LCuo/thumb/image.png)](https://files.gitter.im/red/bugs/LCuo/image.png)

[07:05](#msg5b4c43b91c0f906b145a727f)And gui with same build  
\[!\[image.png](https://files.gitter.im/red/bugs/yXsz/thumb/image.png)](https://files.gitter.im/red/bugs/yXsz/image.png)

endo64

[07:07](#msg5b4c4437866e0c6b15af3118)On which OS?

[07:07](#msg5b4c444895e03e3d7b520fa5)I mean, Win10, 7 or 8?

rebolek

[07:07](#msg5b4c444e1c0f906b145a7632)Looks W10-like.

endo64

[07:09](#msg5b4c448d1c0f906b145a7932)Ah yes its already there. Anyone reproduce it on Win10?

toomasv

[07:27](#msg5b4c48d06534bc5d2e60a930)@dander Both OK on my W10.

endo64

[07:28](#msg5b4c493195e03e3d7b523c26)I remember that I had this issue recently but don't remember when and how it disappeared.

dander

[07:30](#msg5b4c4984c02eb83d7c7b7d63)it's been like this for me for a while. I wonder what is different. Does Red store default window size? Even if it did, I don't understand why the width calculation would work differently

[07:32](#msg5b4c49f5866e0c6b15af620e)

```
>> system/console/size
== 76x22
>> help-ctx/VAL_FORM_LIMIT
== 44
```

[07:32](#msg5b4c4a031c0f906b145aa886)maybe it would be related to font size?

hiiamboris

[07:32](#msg5b4c4a28866e0c6b15af62e3)same bug, W7, July 5 build https://i.gyazo.com/3cea6ce81b029299e64ea9e77899e350.png

[07:35](#msg5b4c4adc582aaa63076fb586)Gui console is no better at this: https://i.gyazo.com/7272eb8916838ed71e388c7e0ade81e2.png  
Trims the doc strings in such a way that they go to the next line

[07:37](#msg5b4c4b55c02eb83d7c7b8ada)stable build is affected too

endo64

[07:47](#msg5b4c4d941c0f906b145ac69b)Can you try to change font settings of CMD?

[07:47](#msg5b4c4d971c0f906b145ac6a5)\[!\[image.png](https://files.gitter.im/red/bugs/Ffsi/thumb/image.png)](https://files.gitter.im/red/bugs/Ffsi/image.png)

hiiamboris

[07:49](#msg5b4c4dfc866e0c6b15af7edb)Yes, same thing. And tried reducing the console width to 80 chars - even worse.

endo64

[07:51](#msg5b4c4e6e1c0f906b145acc95)Can you also check the display settings, you might be using a scaled screen?

[07:51](#msg5b4c4e831c0f906b145accd5)I don't know if it anything related tough.

hiiamboris

[07:51](#msg5b4c4e9b66c1e833a9ee0543)I have a 125% font size. But how on earth would that affect the CLI console? ;)

endo64

[07:53](#msg5b4c4f0895e03e3d7b526afd)I wouldn't be surprised if it is :)

hiiamboris

[07:54](#msg5b4c4f241c0f906b145ad16b)well, changing it will require me to log out and I'd rather not...

endo64

[07:55](#msg5b4c4f791c0f906b145ad3c0)I'll test tonight at home with Win10 scaled display. ~10 hours later

ne1uno

[12:08](#msg5b4c8adb1c0f906b145caa40)`view/no-wait [text 50x15 yellow "text"]`

[12:08](#msg5b4c8adbc02eb83d7c7d94cd)when you specify a size larger than the text, where is the white color comming from? should be all yellow?

[12:09](#msg5b4c8b12866e0c6b15b16d46)recent regression

hiiamboris

[12:24](#msg5b4c8e6095e03e3d7b5467e7)@ne1uno https://github.com/red/red/issues/3448 probably

rebolek

[12:54](#msg5b4c956ec02eb83d7c7dedbe)Shouldn't some error be raised instead of crash?

```
>>  b: [none] forall b [append b none]

*** Runtime Error 16: invalid virtual address
*** at: F7EE9BDFh
```

hiiamboris

[12:59](#msg5b4c969d95e03e3d7b54acfc)@rebolek July 5 build, W7:

```
>> b: [none] forall b [append b none]
*** Internal Error: not enough memory
*** Where: append
*** Stack:
```

[12:59](#msg5b4c96ae95e03e3d7b54adb9)it was doing smth for a few seconds before the error

rebolek

[12:59](#msg5b4c96be9a612333aa676984)Yes, it takes time to fill all memory :)

[13:00](#msg5b4c96d295e03e3d7b54af3a)

```
>> system/build
== make object! [
    date: 30-May-2018/8:42:26+02:00
    git: none
    config: make object! [
        config-name: 'Linux
        OS: 'Linux
```

[13:00](#msg5b4c96f6582aaa6307709b0d)I will build latest version to see if it's fixed already.

[13:06](#msg5b4c984f95e03e3d7b54bc88)@hiiamboris so I have same error with a build I just made using latest sources.

hiiamboris

[13:06](#msg5b4c9866c02eb83d7c7e0b2a)Error 16?

rebolek

[13:07](#msg5b4c9877c02eb83d7c7e0b6d)right, invalid virtual address

hiiamboris

[13:07](#msg5b4c989795e03e3d7b54beb8)interesting... and what if you just allocate a huge block?

rebolek

[13:08](#msg5b4c98e195e03e3d7b54c14f)

```
sony@deli:~/Code/red$ red
--== Red 0.6.3 ==-- 
Type HELP for starting information. 

>> b: make binary! 2'000'000'000
== #{}
>> b: make binary! 2'000'000'000

*** Runtime Error 1: access violation
*** at: 0805B9D6h
```

hiiamboris

[13:09](#msg5b4c98fa1c0f906b145d2e7d)wow, so bad :)

[13:09](#msg5b4c99081c0f906b145d2f56)so it's an allocation problem on \*nix

[13:10](#msg5b4c992c1c0f906b145d310d)

```
>> make binary! 1'000'000'000
*** Internal Error: not enough memory
*** Where: make
*** Stack:
```

rebolek

[13:30](#msg5b4c9df095e03e3d7b54ebba)Right, I will report it and test it in the evening on macOS

endo64

[15:40](#msg5b4cbc6b95e03e3d7b561bf2)Same on Win8.1, I get not enough memory on my second try, but task manager show red console exe uses just a few MB

[19:52](#msg5b4cf766c02eb83d7c817b46)Same on Win10, no crash

```
>> make binary! 1'000'000'000
== #{}
>> make binary! 1'000'000'000
*** Internal Error: not enough memory
```

## Tuesday 17th July, 2018

greggirwin

[04:34](#msg5b4d71c1a94c5255523912e1)Please file a ticket for the allocation error. That's a big one.

On `help`, worth a ticket, to see if we can improve it. The current code, IIRC, is empirical, and getting more info on behaviors with different scaling will help. That one is on me. :^)

gltewalt

[04:44](#msg5b4d74221539a7040ce36910)Speaking of help, why are certain datatypes not listed? Like `scalar!`

[04:49](#msg5b4d755079f7236acb2f8199)`help datatype!` doesn't show `scalar!`, but `help "scalar"` does.

[04:51](#msg5b4d75d34b583a74a721208c)And not that someone would need it, but it also doesn't show `default!`.

[04:51](#msg5b4d75e0fd1b3474a696a1c1)But `help "default"` does.

[04:52](#msg5b4d7610fd1b3474a696a24b)Same with `immediate!`

hiiamboris

[05:37](#msg5b4d8088b6f407068a1e100b)@gltewalt `? datatype!` vs `? typeset!`

rebolek

[05:40](#msg5b4d81318578203ee7384d4c)@greggirwin I've already did it yesterday https://github.com/red/red/issues/3471

gltewalt

[05:51](#msg5b4d83f7f046ba6aca5cd2b8)Ahh yeah. :smile:

[05:51](#msg5b4d83fe4b583a74a7214229)Time for bed

[05:53](#msg5b4d8453fd1b3474a696c381)Jeez...

dander

[07:19](#msg5b4d9882623cc3040b27d8cc)Thanks @greggirwin, I opened an issue for you: red/red#3472

x8x

[12:50](#msg5b4de626d67be274079d44c4)@rebolek Could you please check this on macOS:

```
do https://gist.githubusercontent.com/toomasv/01817e797fdb38d277d4c01dad89b326/raw/89182eacf536b2a0ea35e78d96e2d02cb3b803e2/arc.red
```

I'm getting the beachball, are there known issues with the event manager on macOS, I see the beachball too often which removes the fun. :unamused:

rebolek

[12:51](#msg5b4de64df046ba6aca5dddad)@x8x I will let you know in the evening.

[15:49](#msg5b4e0ffaa94c5255523ae0a5)@x8x no, no beach ball at all

[15:49](#msg5b4e1023fd1b3474a69869d5)10.11.6, maybe it's different on newer versions

[15:57](#msg5b4e11fe03a5fa639e60e217)@toomasv there’s one small problem thought, when I enter some value, I need to press Enter twice, to update the display

toomasv

[17:17](#msg5b4e24a464990f3c000bab7b)@rebolek Are you referring to `arc.red`?

rebolek

[17:19](#msg5b4e2517ad8d085553a9a993)@toomasv yes, the link above

[17:20](#msg5b4e256803a5fa639e611da2)@toomasv Hm, now it works fine :-D

toomasv

[17:21](#msg5b4e25893187ca3ee8bb68e2)@rebolek Can't see this problem on W10

rebolek

[17:21](#msg5b4e259e03a5fa639e611e66)@toomasv I can’t reproduce it now on macOS also

[17:21](#msg5b4e25a7ad8d085553a9ab62)probably a Heisenbug ;)

toomasv

[17:21](#msg5b4e25b64b583a74a723279a)Probably yes

[18:10](#msg5b4e31188578203ee73a5b52)@rebolek If you try "Exercise" you should get visual feedback on match. There can be several ways to get the visual match, but only one way to match the code. I would love your feedback! Suggestions, ideas, critique...

rebolek

[18:14](#msg5b4e321b623cc3040b29c3b4)@toomasv I'll certainly try it when I have some time on macOS, but I'm on Linux mostly. At least I can use it to test GTK branch.

toomasv

[18:15](#msg5b4e323a8578203ee73a5f44)@rebolek OK, thanks!

x8x

[18:30](#msg5b4e35cf42d25a486327f181)@rebolek Thanks for checking! Then either the issue is only on 10.13.x or my system has issues, anyone else with 10.13.x who could test?

## Wednesday 18th July, 2018

toomasv

[06:29](#msg5b4ede42623cc3040b2b3925)Am I missing something?

```
>> system/view/auto-sync?: false
== false
>> system/view/auto-sync?
== true
```

That's in graphic console only.

gltewalt

[06:49](#msg5b4ee2f303a5fa639e62ddd2)Is there a check in the source code that sets it back to true when it notices false?  
They may have wanted true for GUI console for some reason

endo64

[07:47](#msg5b4ef09f1539a7040ce74263)in `ask` function in `gui-console.red` file there is a line `system/view/auto-sync?: yes` so if GUI console use `ask` for prompt it might be the reason.

## Thursday 19th July, 2018

greggirwin

[06:06](#msg5b502a6decc1f82e2fc4d2cd)That's a good one @toomasv. @endo64 nailed it. The console uses `ask`, which resets it.

```
>> system/view/auto-sync?: false  system/view/auto-sync?
== false
>> system/view/auto-sync?
== true
```

toomasv

[07:08](#msg5b5038e21539a7040ceaeae9)Thanks @endo64 ! @greggirwin But it shouldn't?!

## Friday 20th July, 2018

greggirwin

[02:00](#msg5b51422af02a0977a3e9c21f)Well, if the GUI console is a window that then doesn't auto-sync...is it still useful?

[02:00](#msg5b514237c579673e6b813964)I mean, it won't show anything you're doing then, right?

[02:00](#msg5b514248f9ffc4664bed965b)Seems a special case, and a fun easter egg to note somewhere.

## Sunday 22nd July, 2018

9214

[15:12](#msg5b549ecc4b880b3e6a3f919e)Indexing with path notation evaluates `function!`, but not an `op!`. Is that expected?

```
>> block: reduce [:+]
== [make op! [[
    "Returns the sum of the two values" 
    value1 [number! char! pair! tuple! vector! time! date!] 
    value2 [number! char! pair! tup...
>> block/1
== make op! [[
    "Returns the sum of the two values" 
    value1 [number! char! pair! tuple! vector! time! date!] 
    value2 [number! char! pair! tupl...
>> block: reduce [:set]
== [make native! [[
    "Sets the value(s) one or more words refer to" 
    word [any-word! block! object! path!] "Word, object, map path or block of wor...
>> block/1
*** Script Error: block/1 is missing its word argument
*** Where: catch
*** Stack:  

>> first block
== make native! [[
    "Sets the value(s) one or more words refer to" 
    word [any-word! block! object! path!] "Word, object, map path or block of word...
```

[16:10](#msg5b54ac8ee06d7e740995a57e)And shouldn't `'word` decay to `word` in this case?

```
>> get also 'x parse x: [][change none 'word]
== ['word]
```

## Monday 23th July, 2018

greggirwin

[05:39](#msg5b556a0af477e4664ab682dd)@9214 I don't know why op doesn't complain there, and don't see at a glance the cause. @qtxie? It seems like it should behave the same as a function.

[05:42](#msg5b556ad4c579673e6b8a8c42)And it does seem like the word should decay there, yes. Please file a ticket.

qtxie

[07:37](#msg5b5585b405e1cc3553045717)Yes. I think it's a bug.

## Tuesday 24th July, 2018

9214

[17:03](#msg5b575be4c331e03552152383)Is it intentional that `copy`ing `none` in Parse results in an empty block?

```
>> parse [][copy match none (probe match)]
[]
== true
```

i'd prefer it to return `none!` value instead, as it makes checking optional values easier, e.g.:

```
parse [][copy match opt "a" (unless match [...])]
```

[17:04](#msg5b575c13c331e0355215257f)Otherwise I usually rewrite such rules as `["a" | (no "a" here)]` instead.

[17:05](#msg5b575c48f02a0977a3f8aa27)Though, returning empty block is actually an expected behavior.

greggirwin

[21:59](#msg5b57a15fbd17b96159ff511c)That seems like a bug to me. R2 produces `none`.

9214

[22:00](#msg5b57a1825301255724c24559)I'll file a ticket then.

greggirwin

[22:00](#msg5b57a18832d98c2ed2b18dee):+1:

9214

[22:03](#msg5b57a234ee7b230b446536e5)On the other hand...

```
>> parse [][set match none (probe match)]
none
== true
```

[22:04](#msg5b57a262c0fa8016e7352599)Red follows R3 behavior here.

greggirwin

[22:07](#msg5b57a312b1b9572ed3dae938)Ooooh, good catch. So it follows R3. No ticket needed, but good to note.

## Sunday 29th July, 2018

meijeru

[12:32](#msg5b5db3d9d4527523f63bc573)Bug or feature: `reduce` and `compose` may both be applied to a non-block argument, and for arguments not of type `any-function!` they just yield the result of evaluation, BUT `reduce :add` gives the native, `compose :add` gives an error, since it tries to \*\*apply\** the native.

## Wednesday 1st August, 2018

ne1uno

[22:36](#msg5b6235e1cf8ab4758a901cf7);; · &lt;- this bit of unicode crashes simple-gc gui if file is utf-8. other encoding it errors on load hex #B7

[22:37](#msg5b62360c0cfcf02fdffc1fb3)it is part of a copy &amp; paste from any github issue title.

[22:53](#msg5b6239d30cfcf02fdffc2a49)it may be a problem with the PSPad encoding too but earlier versions don't have problems

## Saturday 4th August, 2018

meijeru

[10:35](#msg5b658186c79ebc1ae7a7a87b)For lack of reaction, I have turned the above "bug or feature" into an issue, see #3489

## Wednesday 8th August, 2018

rolandhadinger

[08:40](#msg5b6aac6ac79ebc1ae7c24be0)Hi!

rebolek

[08:40](#msg5b6aac833a5a2d2f990b5c84)hello

rolandhadinger

[08:43](#msg5b6aad278eb2d52fde5e9d2b)Hello. I think the following should not be possible:

```
>> integer!: string!
== string!
>> type? 100
== percent!
>> integer!: none
== none
>> type? 100
*** Script Error: make-number does not allow none! for its type argument
*** Where: do
*** Stack: load
```

rebolek

[08:44](#msg5b6aad52e9ab53770ca57502)@rolandhadinger `protect` would take care of that, but is not implemented yet.

[08:44](#msg5b6aad663bca002dcbd9e263)see http://rebol.com/r3/docs/functions/protect.html

rolandhadinger

[08:51](#msg5b6aaf093a5a2d2f990b6b76)Ah, good. Hope that this function's counterpart `unprotect` can be disabled, then.

greggirwin

[20:40](#msg5b6b5541179f842c970faafd)@rolandhadinger, out of curiosity, why do you think that should not be allowed?

[20:42](#msg5b6b55a8a6af14730b0baa89)I ask because `protect` will help us lock some things down, but the above is just an example that shows how Red allows us to redefine pretty much anything. That is, it's not a special case in any way.

meijeru

[21:14](#msg5b6b5d352a8e6c608398f22b)This is an old discussion, which started at \[#360](https://github.com/red/red/issues/360).

endo64

[21:22](#msg5b6b5f02b3cbd23ffc164d5b)I checked out the branch `simple-gc-free`, build freshly, but when I compile red CLI or GUI console I get below error, cleaned up the `%programdata%\Red` folder but same result:

```
C:\Users\endo\Documents\Red\red\build\bin>red.exe
Compiling compression library...
Compiling Red GUI console...
*** Loading Error: file access error: %collector.reds
*** in file: %/C/Users/endo/Documents/Red/red/build/bin/inflate.reds
*** at line: 127
```

[21:25](#msg5b6b5fc4179f842c970fe9a0)same with `simple-gc` branch.

ne1uno

[21:55](#msg5b6b66cea6af14730b0c0aa6)was there a recent commit to simple-gc? last time everything built ok around 7/28

[21:55](#msg5b6b66e0179f842c971012cf)never checked out simple-gc-free

[21:56](#msg5b6b6706988005174eb1b947)wish the bots would tag branch so you can see from chat when commit happens

endo64

[21:59](#msg5b6b67df637ee66082c405c9)There are 5 commits in simple-gc in August. Let me try with an older commit

[22:01](#msg5b6b682267eb9f60feb3d087)simple-gc-free is based on simple-gc and ahead of it with 8 more commits.

[22:11](#msg5b6b6aa249932d4fe4b65c6e)Yes, 07/28 can be compiled. 01/08 cannot.  
Problem occurs with `* Merge remote-tracking branch 'red/master' into simple-gc-fixed` done by @qtxie at 2018-08-01 15:01

ne1uno

[22:12](#msg5b6b6ad75762ee4fe54d322c)just built simple-gc old-gui from a zip download looks like updated 8/2

[22:13](#msg5b6b6afb937eee2423efd609)dates might be slightly different with UTC

[22:15](#msg5b6b6b90a6af14730b0c255d)new gui console also builds and runs

endo64

[22:16](#msg5b6b6bd426e68560fdcc429e)Are you on Win10 as well?

ne1uno

[22:17](#msg5b6b6be2b983453ffbfc4ed9)win7

endo64

[22:17](#msg5b6b6bec5b07ae730a90926e)commit f4c13fff892b5878fd536ef7a347ce6e5b169cf0 doesn't compile here, Win10.

[22:18](#msg5b6b6c185ec2bc174fd14ad7)I'll test on Win8.1 tomorrow.

## Thursday 9th August, 2018

rolandhadinger

[08:11](#msg5b6bf737e9b96f2c98e38417)@greggirwin First reason: If you are allowed to redefine the name of any data type, type checks in existing functions will be rendered worse than useless, because then no type check can guarantee what it was originally meant to guarantee.

[08:37](#msg5b6bfd46196bc60b6ba59b3a)Secondly, name-value binding is unidirectional, i.e. no value explicitly knows by which word it is uniquely referred to. But data types somehow have to, because there has to be a way to express them (by `mold`, `form` etc.). Neither Rebol nor Red handle this correctly (see example above, also doesn't work in Rebol). The easiest solution would be to disallow redefinition of words that are used for data types.

endo64

[14:34](#msg5b6c50f7179f842c97152f9c)@ne1uno The problem was `%collector.reds` file was missing in the `build/include.r` file. Should be fixed in the repo then.

ne1uno

[14:38](#msg5b6c51e626e68560fdd15926)I am not using anything in build directly. maybe that explains it

[14:42](#msg5b6c52ef637ee66082c92272)still waiting on Carl to release command sdk

## Friday 10th August, 2018

greggirwin

[05:33](#msg5b6d23c72a8e6c6083a2ac16)&gt; Neither Rebol nor Red handle this correctly (see example above, also doesn't work in Rebol). The easiest solution would be to disallow redefinition of words that are used for data types.

@rolandhadinger, when you say they don't handle it correctly, that's incorrect. There are a lot of things in Red, and Rebol langs that work differently, and people coming from other langs don't consider that, true bugs aside, things work this way by design. Some choices can be revisited, and we do that.

What you're asking for is keywords, which Red doesn't have. Datatypes don't have any more right to be keywords than `if` or `do`, do they? If you redefine certain things in Red, you can break the system. Completely. We will get `protect` at some point, and maybe even a default setting for the global context and standard words that will do what you want. But we can't do what you ask, the way you ask, because it is at the core of how Red works.

rolandhadinger

[06:43](#msg5b6d3419b3cbd23ffc20695c)@greggirwin I didn't ask for keywords, I was suggesting predefined constants in the global context, and only for built-in fundamental data types, not for functions, not for anything else.

[06:45](#msg5b6d349a5b07ae730a9a9d25)By the way, I'm not antagonizing. Red is overall an awesome language.

greggirwin

[17:27](#msg5b6dcb1b5ec2bc174fde889a)@rolandhadinger, no offense taken here. I didn't think you were antagonizing, just coming from a position of "not knowing". These are good conversations to have, and we do. We also make people defend their suggestions. ;^) So, what makes datatype words different than any other word for you? e.g., compared to `do` or `if`. Yes, changing them breaks things, but so does changing a lot of other things.

If we do what you ask, you could no longer do this, correct:

```
>> o: object [number!: 0]
== make object! [
    number!: 0
]
>> type? number!
== typeset!
>> type? o/number!
== integer!
```

Which may also affect dialects you can design. And it relies on either a fixed set of datatypes, or the risk of your code breaking when a new datatype is added that conflicts with a word you're already using. What about custom runtimes where others have added datatypes of their own, but other libraries conflict? Same question for typesets, because you can make your own (which is enormously powerful). Next, do we also protect future user defined types? Do we make the naming convention the fixed rule? Then you can't end any words with `!` or it will conflict.

All this to say that there is no easy solution here, in the context of changing things. The easiest solution is to tell people that this is how Red works. :^)

[17:29](#msg5b6dcb8249932d4fe4c379c2)All that said, when we get `protect`, it may be all you need.

rolandhadinger

[23:27](#msg5b6e1f6c67eb9f60fec31bbc)Ideally, `protect` would only render words immutable in their respective contexts, so they can still be defined or redefined elsewhere. As far as I know, this is how `protect` is implemented in Rebol 3: there, `protect` does not forbid polysemic shadowing; it does not downgrade words to keywords across contexts.

Why datatype words, and not other words like `do` or `if`?: at least I can imagine why it sometimes is advantageous to be able to redefine built in functions, but for changing built in fundamental data types, I can't think of any use cases (maybe I'm just unimaginative). Adding new types to existing typesets (similarly to how other languages allow you to implement existing traits on new types), yes.

## Saturday 11st August, 2018

greggirwin

[01:31](#msg5b6e3c6ab3cbd23ffc263eb1)Suppose you want to disallow, or disable certain datatypes in a dialect you're writing. Say, for example that I don't want to allow `set-path!` values, because they open up a security hole.

```
>> unset 'set-path!
>> a: [b [c 1]]
== [b [c 1]]
>> a/b/c: 2
*** Script Error: set-path! has no value
*** Where: do
*** Stack: load 
>> load "a b: c/d/e e/f/g: 3"
*** Script Error: set-path! has no value
*** Where: do
*** Stack: load
```

rolandhadinger

[07:29](#msg5b6e90545ec2bc174fe28b1b)I'd probably disallow that type directly in the rules of my dialect:

```
my-dialect-value: [ ahead not set-path! any-type! ] ; takes any value except for set-path!
my-dialect-rule-x: [ ... my-dialect-value ... ]
my-dialect-rule-y: [ ... my-dialect-value ... ]
```

[09:35](#msg5b6eadea49932d4fe4c810dc)Sorry, first line above should read `not` instead of `ahead not`

greggirwin

[19:09](#msg5b6f346926e68560fde0fc78)Sure, I was just trying to imagine a specific use. But the general design issue stands.

## Tuesday 14th August, 2018

toomasv

[20:29](#msg5b733baca37112689c1db93c)Why the difference in behavior of string- and block-series?

```
>> x: [a] append/dup x x 4
== [a a a a a]
>> x: "a" append/dup x x 4
== "aaaaaaaaaaaaaaaa"
```

gltewalt

[21:13](#msg5b734612a3a93d242265c408)

```
>> append/dup "a" "a" 4
== "aaaaa"
```

[21:14](#msg5b73463e26e68560fdf74a1e)

```
>> x: "a" append/dup copy x x 4
== "aaaaa"
```

[21:14](#msg5b7346535b07ae730abb4bb6)An implicit copy for block! ?

[22:19](#msg5b735580a3a93d24226618b2)Might need to add a few test in `red/tests/source/units/series-test.red`, in `===start-group=== "append"`

[22:30](#msg5b7358125ec2bc174ffc8b2b)There is a difference between `block/rs-append` copy-cell and `string/append-char`, but I have to run. Don't have time to poke through it more.

## Wednesday 15th August, 2018

greggirwin

[00:19](#msg5b737183179f842c973c4368)Indeed. Interesting subtlety.

```
>> x: [a] append/dup/only x x 4
== [a [...] [...] [...] [...]]
```

[00:31](#msg5b7374615762ee4fe5791486)Not as simple as it may seem. Not related to `append-char`, as it's a string. What we need to understand is `insert` for each type. That's where the meat is.

gltewalt

[02:01](#msg5b73897f5762ee4fe57982ef)https://github.com/red/red/blob/master/runtime/datatypes/string.reds#L2246

greggirwin

[02:06](#msg5b738ab3196bc60b6bceb4af)Quite possible.

gltewalt

[02:10](#msg5b738b988206fd2a46ac1847)

```
>> x: "a" append/dup "" x 4
== "aaaa"

>> x
== "a"
```

[02:13](#msg5b738c50e9b96f2c980cf05d)It's duping the right amount. Buffer grows if x is used.

[02:16](#msg5b738cee637ee66082f048a8)

```
>> x: "a" append/dup x copy x 4
== "aaaaa"

>> x
== "aaaaa"
```

toomasv

[09:24](#msg5b73f1628206fd2a46ae47fb)This behavior of strings is very welcomed and logical. One usecase is e.g. `make-transparent` where I had to fill alpha with 90000 values for 300x300 image.

With `append/dup str str to-integer log-2 90000` it takes only 16 repetitions + 1 additional step instead of 89999 repetitions.

With block `loop to-integer log-2 90000 [append blk blk]` can be used, but this is not as quick as append/dup for strings.

gltewalt

[14:31](#msg5b743955937eee24231f89a8)When in doubt, use copy, I guess

## Friday 17th August, 2018

alexbaban\_twitter

[16:47](#msg5b76fc1e796f7b601d56c448)This might not be a bug in Red, but a compiled macOS Red executable, can't read/write to files in latest Sierra. If I launch the program from console it works, but errors if is compiled. Anybody knows a workaround or any news about being fixed. Thank you. https://github.com/red/red/issues/3207

9214

[16:49](#msg5b76fcaa802bc42c5f3288ae)@alexbaban\_twitter this is a known issue related to APFS compression introduced in new new macOS versions (@qtxie :point\_up: is that right? I recall you saying something among these lines).

alexbaban\_twitter

[16:50](#msg5b76fce6e40fdf5fb15150e5)Yes, it's a show stopper for me if my program can't read/write files on macOS latest Sierra

[16:50](#msg5b76fcf3e2e48a20b471c8d9)The program I made works fine on El Capitan

9214

[16:51](#msg5b76fd21d7901b2c6050a63b)@alexbaban\_twitter can you check if it works with `-r -e` flags specified during compilation?

alexbaban\_twitter

[16:52](#msg5b76fd52e40fdf5fb15152f9)Thank you, I'll check, I'll let you know as soon as I get the chance.

9214

[16:53](#msg5b76fd6ce7971d5f10979dbc)@alexbaban\_twitter you're welcome.

alexbaban\_twitter

[18:39](#msg5b77166dd7901b2c605131f3)tried compilation with -r -e also -r only, it does not work, when I first tried to launch the compiled app, I got a pop-up, sent me to https://support.apple.com/en-ca/HT208436

[18:39](#msg5b771679cda86f5fb26c45c6)If I launch the app via Red console, no problem

[18:40](#msg5b77168ae026575f0f89778b)I'm on latest macOS High Sierra

[18:40](#msg5b77169acda86f5fb26c45f1)so frustrated with the stupid apple os updates

[18:41](#msg5b7716c5e7971d5f10983238)the app was working fine until they started with these

## Saturday 18th August, 2018

qtxie

[00:31](#msg5b7768ea0825690ea2e62c14)That's strange. The console is also a 32bit app.

## Monday 20th August, 2018

x8x

[09:09](#msg5b7a855fe2e48a20b4840777)@qtxie In the Terminal.app you can open binaries (not app bundle) without the 32bit warning and signing check.

alexbaban\_twitter

[16:12](#msg5b7ae8655921214124948e3d)@qtxie @x8x thank you for your attention to this problem. the warning only appears first time so that's no problem, the problem is that any compiled app, even if open binaries from the terminal, won't run, crashes at start with a stack trace of some ' unsupported compressor... AppleFSCompression... \` thing

x8x

[17:50](#msg5b7aff4d88520a0c6ee5e57e)@alexbaban\_twitter Are you using the latest nightly builds? Could you please put a reduced example of code generating the issue in a gist?

## Tuesday 21st August, 2018

gltewalt

[01:25](#msg5b7b6a16fd3c641b06e87084)making an error with only the error type (single word) crashes GUI Console for red-simple-gc.

Crashes CLI with the following error:

```
>> make error! [math]
*** Internal Error: invalid error object field value: none
*** Where: print
*** Stack:
```

[01:26](#msg5b7b6a5bc53ee54c187d2fc2)Any single word of the type list crashes it:

```
throw  note syntax script math access user internal
```

bitbegin

[02:18](#msg5b7b766fa491f459177a5347)can you open a ticket for this issue?

gltewalt

[02:18](#msg5b7b767fe5b40332abd69681)I will if it is confirmed

greggirwin

[02:22](#msg5b7b774ce5b40332abd699cd)Confirmed.

bitbegin

[02:35](#msg5b7b7a7d94f8164c1778df0b)https://github.com/red/red/pull/3513

[02:37](#msg5b7b7b05a491f459177a6b92)fixed

gltewalt

[02:44](#msg5b7b7c9d94f8164c1778eaa3)ok

## Thursday 23th August, 2018

gltewalt

[00:02](#msg5b7df99fa491f4591788f5cb)

```
>> make error! 0
*** Script Error: value out of range: 0
*** Where: make
*** Stack:
```

[00:04](#msg5b7df9f0ac25fd11b57eb9a2)Should be "no loop to break"

[00:04](#msg5b7dfa02cff55e561748ea9e)

```
>> help system/catalog/errors/throw
SYSTEM/CATALOG/ERRORS/THROW is an object! with the following words and values:
     code        integer!      0
     type        string!       "Throw Error"
     break       string!       "no loop to break"
     return      string!       "return or exit not in function"
     throw       block!        length: 2  ["no catch for throw:" :arg1]
     continue    string!       "no loop to continue"
     while-cond  string!       {BREAK/CONTINUE cannot be used in WHILE condition block}
```

[00:05](#msg5b7dfa4ba491f4591788f8df)

```
>> make error! 1
*** Throw Error: return or exit not in function
*** Where: ???
```

[00:07](#msg5b7dfac3fd3c641b06f70e62)As seen in `syntax`:

```
>> help system/catalog/errors/syntax
SYSTEM/CATALOG/ERRORS/SYNTAX is an object! with the following words and values:
     code          integer!      200
     type          string!       "Syntax Error"
     invalid       block!        length: 4  ["invalid" :arg1 "at" :arg2]
     missing       block!        length: 4  ["missing" :arg1 "at" :arg2]
     no-header     block!        length: 2  ["script is missing a Red header:" :arg1]
     no-rs-header  block!        length: 2  ["script is missing a Red/System header:" :arg1]
     bad-header    block!        length: 2  ["script header is not valid:" :arg1]
     malconstruct  block!        length: 2  ["invalid construction spec:" :arg1]
     bad-char      block!        length: 2  ["invalid character in:" :arg1]

>> make error! 200
*** Syntax Error: invalid none at none
*** Where: ??? 

>> make error! 201
*** Syntax Error: missing none at none
*** Where: ???
```

[00:12](#msg5b7dfbf960f9ee7aa47a1fda)This is simple-gc, built from source.

[00:24](#msg5b7dfeb360f9ee7aa47a2e10)Does the same with latest master build

[00:26](#msg5b7dff3cac25fd11b57ed495)For what it's worth...  
#3518

## Sunday 26th August, 2018

gltewalt

[23:30](#msg5b83380d9c71d363c1333228)

```
>> 2:00:00 + 1:45:30
== 3:45:30

>> 2:00:00 - 1:45:30
== 0:14:30

>> 2:00:00 / 1:45:30
== 1.137440758293839

>> 2:00:00 // 1:45:30
== 0:14:30

>> 2:00:00 * 1:45:30
*** Script Error: incompatible argument for multiply of time!
*** Where: *
*** Stack:
```

greggirwin

[23:48](#msg5b833c5bc53ee54c18a9202e)Not a bug. What should the result be? Treating everything as seconds isn't easy to reason about.

gltewalt

[23:55](#msg5b833ddc9c71d363c1334eca)I don’t know but it seems peculiar since / doesn’t error

[23:56](#msg5b833e269c71d363c133520e)Should be 2:00:00

[23:59](#msg5b833ee74be56c59189db718)It should multiply by the hour/minute/second fields?

## Monday 27th August, 2018

gltewalt

[00:04](#msg5b83400294f8164c17a45783)Addition seems to work across hour, minute, second

greggirwin

[00:16](#msg5b8342fbfd3c641b06139bbb)Correct, but is multiplication \*useful\*?

[00:17](#msg5b834310fd3c641b06139be3)Note what type division returns.

gltewalt

[02:44](#msg5b8365a3f5402f32aa9798e7)Don't know if it's useful or not, but:

```
>> t1: 2:00:00
== 2:00:00

>> t2: 1:45:30
== 1:45:30

>> reduce [t1/hour * t2/hour t1/minute * t2/minute t1/second * t2/second]
== [2 0 0.0]

>> to time! reduce [t1/hour * t2/hour t1/minute * t2/minute t1/second * t2/second]
== 2:00:00
```

meijeru

[07:49](#msg5b83ad2694f8164c17a6982c)To understand why time multiplication does NOT work, use a dimensional argument: time \\* time would be of dimension time-squared (seconds \** 2), and that makes little sense.

## Wednesday 29th August, 2018

lepinekong\_twitter

[12:21](#msg5b868fc5d8d36815e5a75db2)Rebol works with CNAME DNS record seems red doesn't for example  
do http://www.redlang.red  
on rebol I get correct answer:

```
>> do http://redlang.red
connecting to: redlang.red
** Syntax Error: Script is missing a REBOL header
```

on red I get

```
>> do https://www.redlang.red
*** Access Error: cannot connect: https://www.redlang.red reason: timeout
```

[12:22](#msg5b868fee1d3a5711b6b4eb41)Red works only without www:  
do https://redlang.red

rebolek

[12:23](#msg5b869027f86b741b05dc8550)

```
>> read https://www.redlang.red
ERROR: SSL peer certificate or SSH remote key was not OK
*** Access Error: cannot connect: https://www.redlang.red reason: timeout
*** Where: read
*** Stack:
```

[12:24](#msg5b8690924be56c5918b0eec1)If it works without `www` only, your certificate is probably set wrong.

[12:36](#msg5b8693344be56c5918b0ff75)It's same from browser, Firefox warns about non-secured connection.

[12:36](#msg5b869347d8d36815e5a77149)Rebol works, because there are no certificates over HTTP.

## Sunday 2nd September, 2018

endo64

[00:03](#msg5b8b28b61d3a5711b6cf0fa2)Can some one confirm this?

Save below script as `test.red`

```
view/flags [text "test" center] [modal popup]
```

Both `red --cli test.red` and `red test.red` works, `do %test.red` on GUI console also works, but `do %test.red` on CLI console crashes `*** Runtime Error 1: access violation`

[00:04](#msg5b8b28f911b41f69dba8673d)If I remove `center` then it doesn't crash.

toomasv

[04:41](#msg5b8b69f058a3797aa3ed8040)@endo64 All tests work on my W10 (with proper header).

endo64

[09:41](#msg5b8bb05358a3797aa3eee94a)@toomasv Thanks for testing, strange I just built fresh and it still crashes (it worked just once, I tested 15-20 times)

toomasv

[09:50](#msg5b8bb26ee5b40332ab31dcd7)@endo64 I tried again. Same  
\[!\[image.png](https://files.gitter.im/red/bugs/AWiq/thumb/image.png)](https://files.gitter.im/red/bugs/AWiq/image.png)

[10:02](#msg5b8bb534cff55e56179604a4)That was with build from August 15th. Now tried with latest - all your tests work.

endo64

[10:27](#msg5b8bbb2af5402f32aac779ec)Thank you @toomasv I'll test at work tomorrow on Win8.1 and on another Win10.

toomasv

[10:28](#msg5b8bbb62c9500b4bab6e402b)@endo64 :+1:

lepinekong\_twitter

[11:54](#msg5b8bcf624be56c5918ce8033)@rebolek ok thanks will look for certificate problem.

## Monday 3th September, 2018

endo64

[10:12](#msg5b8d090fc9500b4bab75a556)@toomasv I tested `Red [Needs: View] view/flags [text "test" center] [modal popup]` on Win8.1 (x64) with both CLI and GUI console (fresh built from latest source codes), it works, didn't crash even once.

toomasv

[12:09](#msg5b8d2477c2bd5d117a1179bd)@endo64 Good! How about W10?

endo64

[15:27](#msg5b8d52ef4be56c5918d72c31)@toomasv Tested on another W10, it works. I need to check at home to find what is wrong there :(

toomasv

[17:01](#msg5b8d68f6f86b741b05036d1f)@endo64 Good luck! Please let us know if you'll find out!

endo64

[22:09](#msg5b8db130ac25fd11b5d79086)@toomasv I deleted all files in %programdata% folder, fresh built the Red, and it works both in CLI and GUI console now.

## Tuesday 4th September, 2018

toomasv

[03:14](#msg5b8df8a81d3a5711b6df0a29)@endo64 OK, thanks! Good to know.

Oldes

[21:02](#msg5b8ef2dc4be56c5918e1536e)When making large charsets, the output is truncated as is somehow confusing, isn't it?

```
>> charset [#"^(251C)" - #"^(252C)"]
== make bitset! #{0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
```

## Wednesday 5th September, 2018

bitbegin

[02:03](#msg5b8f395f11b41f69dbc05b51)it's designed to be this

[02:03](#msg5b8f3964ac25fd11b5e0febb)

```
>> a: ""
== ""
>> append/dup a "abc" 1000
== {abcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabca...
>>
```

[02:03](#msg5b8f3986d457a1406ca267a8)for example

toomasv

[04:09](#msg5b8f5704f5402f32aadcd16d)@Oldes I understand that output on screen is only indicative and truncated for any longer result. `probe ...` will show the full output, as you know of course :mask:

Oldes

[05:52](#msg5b8f6f0b94f8164c17deb06b)@bitbegin I know the output is truncated but as you can see in your example are at least the dots indicating the truncation.

bitbegin

[06:14](#msg5b8f7451c9500b4bab849327)

```
>>  charset [#"^(251C)" - #"^(252C)"]
== make bitset! #{00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000...
>>
```

[06:15](#msg5b8f746b11b41f69dbc1a7d4)do we have different result?

Oldes

[07:23](#msg5b8f847358a3797aa305f451)\[!\[image.png](https://files.gitter.im/red/bugs/TR5c/thumb/image.png)](https://files.gitter.im/red/bugs/TR5c/image.png)

bitbegin

[07:28](#msg5b8f85a258a3797aa305fa5e)do you use latest daily version?

Oldes

[08:11](#msg5b8f8f9494f8164c17df30c9)Looks like I don't when you have different results:) Rebuilding now.

[08:13](#msg5b8f902af86b741b05106e4d)\[!\[image.png](https://files.gitter.im/red/bugs/26ab/thumb/image.png)](https://files.gitter.im/red/bugs/26ab/image.png)

[08:13](#msg5b8f9032f86b741b05106eae)Looks good now.

greggirwin

[20:55](#msg5b9042add457a1406ca718ee)Does that mean https://github.com/red/red/issues/3438 can be closed?

## Thursday 6th September, 2018

meijeru

[15:12](#msg5b9143e160f9ee7aa4e85db5)See my final comment to that issue.

Oldes

[16:13](#msg5b91523a11b41f69dbcd15dc)@greggirwin no :) `mold` is corrupted now :(

## Monday 10th September, 2018

Oldes

[09:33](#msg5b963a4ca2343433d1285882)The problem is, that current console trims \*\*output only on one line\*\*.. \*\*I strongly dislike it.\** I was now very confused when I wanted to see a url from variable and it was truncated. If I would not know about this issue, I would be even more confused.... I really don't like to write in console `probe url` or `print url` just to see content of the url variable... and that is just an example. I prefer to have output at least a few lines before truncating.

[09:33](#msg5b963a71728ddf028287d3f4)\[!\[image.png](https://files.gitter.im/red/bugs/apDb/thumb/image.png)](https://files.gitter.im/red/bugs/apDb/image.png)

[09:34](#msg5b963aafa04db554a703c1b2)On the screen above is my console.. the first line was before I re-sized the console window.

greggirwin

[22:14](#msg5b96ecd2e6e309365e334483)We do need to fix the `...` issue, so truncation is clear.

## Wednesday 12nd September, 2018

gltewalt

[00:21](#msg5b985c1e0fb4232e38ae206f)

```
>> x: make image! 100x100
== make image! [100x100 #{
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    F

>> y: make image! 200x200
== make image! [200x200 #{
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    F

>> x = y
== false
>> x == y
== false
>> x =? y
== false
>> x <> y
== true

>> x < y

...FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}]
*** Where: <
*** Stack:
```

[00:34](#msg5b985efe0fb4232e38ae30bb)That's a little weird to me, but `x/size < y/size` is fine

[00:34](#msg5b985f1a33ebb72e3703ef0c)I was unsure if I should post this in help or in here

[00:36](#msg5b985f9a51a02e2a261861d0)Alpha should be the same value, it wasn't set

```
>> x/alpha < y/alpha
== true
```

greggirwin

[00:41](#msg5b9860c3f59e0c1555e4c377)It does show the error on comparing images, but doesn't truncate the output.

```
>> x < y
*** Script Error: cannot compare make image! [100x100 #{FFFFFF
...
```

gltewalt

[00:42](#msg5b9860e545318b2dfe967e33)ok

[00:42](#msg5b98610e728ddf02829541dd)It can compare with `=, ==, <>, =?`, though

[00:43](#msg5b986143550f8808f5976454)I set out expecting it not to be able to compare at all though, so.. I guess it's ahead of the game

[00:44](#msg5b98616f33ebb72e3703f881)I didn't realize (or remember) that they were part of `series!`

greggirwin

[00:51](#msg5b986324f3c26b08f66379b8)Comparing for equality has meaning, but ordering images really doesn't.

gltewalt

[00:53](#msg5b98637b1e2b442a25fb2686)What about alpha? Shouldn’t it be the same value if not specified?

greggirwin

[00:54](#msg5b9863b57189ae6fddafc60d)Different length. X is shorter than Y.

gltewalt

[01:30](#msg5b986c50e481f854a6a58bca)This time for sure.

`img: make image! [100x100 120.20.199.200]`

`load form enbase/base img/alpha 2`

\*boom*

[01:34](#msg5b986d0a33ebb72e370431ea)`load form enbase/base img/alpha 64` works.

`load form enbase/base img/alpha 58`

```
*** Syntax Error: invalid integer! at "9M3wUgPyR2Zan9RQA8kdh3bVYorFdp4UrsNvfb4m"
```

`load form enbase/base img/alpha 16` works.

[01:36](#msg5b986d837189ae6fddaffd26)With base of 2, both GUI Console and --cli stop working

greggirwin

[02:14](#msg5b98766a33ebb72e37046516)Interesting. Works with base 16, but fails if you try to see what `type?` it returns. File a ticket.

[02:19](#msg5b9877ac550f8808f597e1b1)More than 309 digits gives you &gt; ~1E308, which goes to `1.#INF` \*normally\*. See if you can narrow down exactly where it hangs.

gltewalt

[03:25](#msg5b98871ae6e309365e3ce0a9)It's ok if the alpha value is zero.

```
>> img: make image! [100x100 128.24.90.0]
== make image! [100x100 #{
    80185A80185A80185A80185A80185A80185A80185A80185A80185A80185A
    80185A80185A80185A80185A80185A80185A80185A80185A80185A80185A
    8

>> type? load form enbase/base img/alpha 64
== word!

>> type? load form enbase/base img/alpha 58
== float!

>> type? load form enbase/base img/alpha 16
== integer!

>> type? load form enbase/base img/alpha 2
== integer!
>>
```

[03:26](#msg5b988750f3c26b08f664334d)Anything other than zero is an issue.

```
>> img: make image! [100x100 128.24.90.1]
== make image! [100x100 #{
    80185A80185A80185A80185A80185A80185A80185A80185A80185A80185A
    80185A80185A80185A80185A80185A80185A80185A80185A80185A80185A
    8

>> type? load form enbase/base img/alpha 64
== word!

>> type? load form enbase/base img/alpha 58
*** Syntax Error: invalid integer! at "3RNjUkKqqjDMEfyxSGb7aesbxdCxs7gsRKfqd8ZQ"
*** Where: do
*** Stack: load  

>> type? load form enbase/base img/alpha 16
== float!
```

And of course, using 2 blows up the consoles.

toomasv

[08:10](#msg5b98c9fc0fb4232e38b07c01)Isn't `find` supposed to find things according to typeset also?

```
find ['a a :a a:] any-word!
== none
>> find [1 2.0 3%] number!
== none
```

meijeru

[08:24](#msg5b98cd391e2b442a25fd8ee4)I know you can test on datatype, rather than value, in parse. Also you can use find to test for the presence of a type in a typeset. But the thing you want, I don't think it was in the design.

greggirwin

[08:28](#msg5b98ce24a2343433d1383b3d)@toomasv, only for datatypes, not typesets.

toomasv

[08:28](#msg5b98ce44e6e309365e3e76a2)OK, thanks! But why not?

greggirwin

[08:32](#msg5b98cf0c33ebb72e370662bd)`Find` is already a complex func, and we can do it with `parse` (with a bit more work), so it's a question of value. It's certainly possible.

toomasv

[08:35](#msg5b98cfe633ebb72e37066a43)OK.

meijeru

[20:30](#msg5b99774afcba1254faa7f4ee)So `find [1 2.0 3%] float!` is possible !?! I have learned something :smiley:

[20:37](#msg5b9978f51ee2ca650208fc21)I have formulated the rule in the specs as follows :With `find`, if the  argument is of type `any-block!` except `hash!`  
and the is of type `datatype!` the result is the  at the index of the first occurrence of a component of that type.

[20:39](#msg5b997989be4f30062684f0af)The exception for `hash!` is obvious, but the coverage of `paren!` and `any-path!` is unexpectedly nice. Still, I would imagine that the extension to finding by typeset would be almost trivial.

## Thursday 13th September, 2018

gltewalt

[00:03](#msg5b99a951b4990c30eea82796)Haven’t narrowed down where load breaks @endo64

toomasv

[03:27](#msg5b99d91dbe4f3006268722f4)@meijeru I agree. Finding by typeset too would make `find` not only (even) more powerful but also more consistent. But I don't know the implementation, may be it isn't so trivial.

meijeru

[10:09](#msg5b9a37713b7e6c2edd0e59e0)I looked at `%runtime/datatypes/block.reds` around line 880 , and it looks quite feasible. I will make a REP wish ticket later.

toomasv

[11:02](#msg5b9a43c17dca306503f4eadf):+1:

## Saturday 15th September, 2018

meijeru

[11:32](#msg5b9cede0f08bc22dfb5e7654)See https://github.com/red/REP/issues/29

## Monday 17th September, 2018

ericguedespinto

[11:57](#msg5b9f96aa1ee2ca65022bdc7d)@9214 Regarding your |&gt; op! you posted a while back, I've come up with the following work-around:

```
pipe: func ['a 'b][ insert/only at c: to-block b 2 a do c]
|>: make op! :pipe
```

It does the following:  
x |&gt; f is equivalent to f x  
x |&gt; \[f y] is equivalent to f x y  
x |&gt; f |&gt; g |&gt; h is equivalent to h g f x  
For example:

```
>> [1 2 3] |> reverse |> print
3 2 1
>> [1 2 3] |> reverse |> [append 0] |> print
3 2 1 0
>> 1 |> [add 2] |> print
3
```

9214

[12:01](#msg5b9f97923b7e6c2edd2cb9f1)@ericguedespinto been there, done that :wink:

```
then: make op! func ['a 'b][do head insert/only next to block! b a]
```

[12:03](#msg5b9f97f43b7e6c2edd2cbc2c)As an exercise, you can implement equivalent of Clojure threading macros.

ericguedespinto

[12:03](#msg5b9f980c8909f71f75e7dbfa)You're the master !!! lol

## Wednesday 19th September, 2018

gltewalt

[22:27](#msg5ba2cd3e913ba7799b15e287)Problem with the current GUI Console. Win7.  
Doesn't redraw properly when this is entered: `help datatype!`  
There may be more 'things'

[22:28](#msg5ba2cd7cb4990c30eeddb2e9)`Red 0.6.3 for Windows built 15-Sep-2018/23:12:03-06:00 commit #09de884`

More specifically, Scroll isn't behaving properly

ne1uno

[22:29](#msg5ba2cde27dca30650326f181)some control code, VT or something

rebolek

[22:30](#msg5ba2cdefb4990c30eeddb425)I've reinstalled my machine and now I get this:

```
tankpad% red
--== Red 0.6.3 ==-- 
Type HELP for starting information. 

>> system/build
== make object! [
    date: 19-Sep-2018/20:24:49+02:00
    git: none
    config: make object! [
        config-name: 'Linux
        OS: 'Linux
        OS-version: 0
  
>> read http://www.rebolek.com

*** Runtime Error 32: segmentation fault
*** at: F7BCD947h
```

gltewalt

[22:33](#msg5ba2cea6913ba7799b15eb50):hushed:

greggirwin

[22:38](#msg5ba2d0011043315947b7c50b)@gltewalt confirmed. I don't see any recent merges on master that would relate to this, but there will be some big merges coming soon. Worth a ticket, so we remember.

[22:40](#msg5ba2d05e0cfe7f30f1bc8008)@rebolek no segfault here on Windows. Will do a fresh build to check.

rebolek

[22:41](#msg5ba2d0adb9531f2dfa90885e)@greggirwin you don't have to, it works on Windows, it also works on Linux on different machine

[22:42](#msg5ba2d0c9913ba7799b15f4f9)it's just this machine, I'm trying to find out why

[22:47](#msg5ba2d2087dca306503270762)Hm, debug mode is not very helpful :/

```
>> read http://www.google.com

*** Runtime Error 32: segmentation fault
*** Cannot determine source file/line info.
```

9214

[22:49](#msg5ba2d26c913ba7799b15fe3b)@rebolek can you build console from source in debug mode?

rebolek

[22:49](#msg5ba2d283e5c2cc56adb51a04)@9214 that was console in debug mode

9214

[22:49](#msg5ba2d295e5c2cc56adb51a9d)Huh.

gltewalt

[22:52](#msg5ba2d347fcba1254fadf390a)Might be easier to make a video of the GUI Console behavior?

ne1uno

[22:55](#msg5ba2d3c5e5c2cc56adb51f1d)may be something wonky in the event! doc?

[22:55](#msg5ba2d3d1e5c2cc56adb51f26)worked ok in the console w/o events

[23:00](#msg5ba2d4fe5df5194734e49798)`? datatype!` weird too

rebolek

[23:02](#msg5ba2d56cd655361f762522e2)If anybody's willing to try to repro it in VM, I'm on Manjaro with latest kernel: `Linux tankpad 4.19.0-1-MANJARO #1 SMP PREEMPT Mon Sep 17 17:34:11 UTC 2018 x86_64 GNU/Linux`

gltewalt

[23:11](#msg5ba2d78f1043315947b7ec98)https://imgur.com/a/6UGEbhz

[23:15](#msg5ba2d892f7e1580625f76009)Will this do? #3538

[23:16](#msg5ba2d8b1f4bd1056ac8a66ef)Even regular `help` is weird, but still usable

[23:40](#msg5ba2de561043315947b813c5)@rebolek That machine have the 386 libs onboard?

rebolek

[23:40](#msg5ba2de861ee2ca65023fe03e)@gltewalt Red wouldn't run without them.

[23:41](#msg5ba2deab1043315947b816b3)

```
sony@tankpad  ~/code/red   master  ldd console 
	linux-gate.so.1 (0xf7fc4000)
	libc.so.6 => /usr/lib32/libc.so.6 (0xf7daf000)
	libm.so.6 => /usr/lib32/libm.so.6 (0xf7ce2000)
	libcurl.so.4 => /usr/lib32/libcurl.so.4 (0xf7c58000)
	/lib/ld-linux.so.2 => /usr/lib/ld-linux.so.2 (0xf7fc6000)
	libidn2.so.0 => /usr/lib32/libidn2.so.0 (0xf7c3a000)
	libpsl.so.5 => /usr/lib32/libpsl.so.5 (0xf7c29000)
	libssl.so.1.1 => /usr/lib32/libssl.so.1.1 (0xf7bba000)
	libcrypto.so.1.1 => /usr/lib32/libcrypto.so.1.1 (0xf795c000)
	libgssapi_krb5.so.2 => /usr/lib32/libgssapi_krb5.so.2 (0xf7907000)
	libkrb5.so.3 => /usr/lib32/libkrb5.so.3 (0xf781e000)
	libk5crypto.so.3 => /usr/lib32/libk5crypto.so.3 (0xf77e8000)
	libcom_err.so.2 => /usr/lib32/libcom_err.so.2 (0xf77e3000)
	libz.so.1 => /usr/lib32/libz.so.1 (0xf77c8000)
	libpthread.so.0 => /usr/lib32/libpthread.so.0 (0xf77a7000)
	libunistring.so.2 => /usr/lib32/libunistring.so.2 (0xf7626000)
	libdl.so.2 => /usr/lib32/libdl.so.2 (0xf7620000)
	libkrb5support.so.0 => /usr/lib32/libkrb5support.so.0 (0xf7612000)
	libkeyutils.so.1 => /usr/lib32/libkeyutils.so.1 (0xf760c000)
	libresolv.so.2 => /usr/lib32/libresolv.so.2 (0xf75f3000)
```

gltewalt

[23:43](#msg5ba2df34b9531f2dfa90d79e)Revert back to libcurl3 ?

## Thursday 20th September, 2018

greggirwin

[00:00](#msg5ba2e337d655361f76256c30)@gltewalt that ticket is fine, but if we can narrow it down a bit, that would be even better. Recent `help` changes don't seem too suspect.

rebolek

[00:03](#msg5ba2e3b9f4bd1056ac8a9be9)@gltewalt `simple-io.reds` needs `libcurl.so.4`

gltewalt

[00:05](#msg5ba2e4367dca3065032765f3)Download page says that is needed for FreeBSD

rebolek

[00:06](#msg5ba2e46e7dca30650327669b)Download page is wrong about `libcurl3`, someone should update it.

gltewalt

[00:08](#msg5ba2e5015df5194734e4ecf1)Ok

rebolek

[00:23](#msg5ba2e879f7e1580625f7b9e5)so the segfault happens when calling `curl_easy_perform()`

greggirwin

[01:01](#msg5ba2f168d655361f7625b44f)I see libcurl.so.4 on the download page. Where is libcurl3 ref'd?

ne1uno

[01:07](#msg5ba2f2e3913ba7799b16a1bc)Red 0.6.3 for Windows built 14-Jul-2018/22:03:36-04:00 commit #8b2db6b help datatype! seems normal

[01:12](#msg5ba2f3f8d655361f7625bdb4)ok too Red 0.6.3 for Windows built 19-Aug-2018/20:39:55-04:00 commit #318673b

gltewalt

[01:31](#msg5ba2f8641ee2ca65024064e1)The Debian and Ubuntu section

[01:31](#msg5ba2f868be4f300626bcc3f3)https://imgur.com/a/5pxAHUL

greggirwin

[01:34](#msg5ba2f91d7dca30650327d0b2)Thanks! @x8x, can you make that update?

x8x

[09:57](#msg5ba36f01fbe23c730fa63285)Guys, I'm a bit lost. Just downloaded a fresh Debian and instructions on the download page are still relevant, Manjaro is an ArchLinux based distro and there is no ArchLinux install infos on the download page, just a link to the AUR repo. So what should I change/fix on the download page? I have some Manjaro and other Archs around, should we add infos for that platform? Thank you! :smiley:

rebolek

[10:15](#msg5ba3734ff4bd1056ac8dc802)@x8x Thanks for looking into this! That AUR isn't updated, I believe, so just ignore it. You need to enable multilib, to get 32bit support, see \[here](https://wiki.archlinux.org/index.php/Official\_repositories#multilib). I believe that on my system multilib was already enabled, but it's better to check it twice. So:

1\. Enable multilib  
2\. Install 32bit libs  
3\. Try to build and run Red

[10:16](#msg5ba37374f4bd1056ac8dc92c)&gt; I have some Manjaro and other Archs around, should we add infos for that platform?

Once it works, definitely ;)

x8x

[10:24](#msg5ba37578ea302d38a63eb2ad)@rebolek I have Red running fine on Arch, we could add instructions, but I still don't get what should I fix on the download page! ;-)

rebolek

[10:46](#msg5ba37a900cfe7f30f1c05337)@x8x Download page says `libcurl3` for Debian, but it should be `libcurl4` I believe. I've had Red running on Arch recently (on different machine though), so I wonder where does my problem on Manjaro comes from.

x8x

[11:19](#msg5ba3825a7209fd61d0f11137)Nope, `libcurl3:i386` is correct for Debian.

[11:33](#msg5ba3856f0382083362b4fcb9)Will have to check Ubuntu and Alpine later, I remember a libcurl3 vs libcurl4 issue somewhere but can't remember where..

rebolek

[12:31](#msg5ba3933d913ba7799b1a5c06)@x8x OK. Let me know if you can make Red work on Manjaro, because right now I'm redless :white\_circle:

x8x

[13:29](#msg5ba3a0c31bb7b80b4ebd992c)@rebolek Which sauce of Manjaro are you running?

rebolek

[14:24](#msg5ba3adba7dca3065032c1a82)@x8x manjaro xfce 17.1.12

greggirwin

[16:29](#msg5ba3caf30cfe7f30f1c277d2)Thanks for digging in guys.

## Friday 21st September, 2018

9214

[14:33](#msg5ba501490cfe7f30f1c9a5cd)Looks like `react?/target` recognizes target fields if they were linked with `is`, but not with `react`.

```
>> foo: make reactor! [a: 1 b: 2]
== make object! [
    a: 1
    b: 2
]
>> bar: object [x: 0]
== make object! [
    x: 0
]
>> react [bar/x: foo/a + foo/b]
== [bar/x: foo/a + foo/b]
>> react?/target bar 'x
== none

>> bar: object [x: is [foo/a + foo/b]]
== make object! [
    x: 3
]
>> react?/target bar 'x
== [foo/a + foo/b]
```

[14:35](#msg5ba501ab7dca306503341579)I also have discovered an extemely cryptic behavior. Whenever I directly copypaste code from GUI console, some return expressions get doubled:

```
>> a: [
[    b
[    c
[    d]
== [
    b 
    c 
    d
== [
    b 
    c 
    d
]
>> 1 2 3
== 3
>> 4 5 6
== 6
>> 6 * 7
== 42
>>
```

[14:57](#msg5ba506d0e5c2cc56adc23771):point\_up: this happend only with multi-line output, e.g:

```
>> [
[    a
[    b
[    c
[    ]
== [
    a 
    b 
    c ; <-- WTF? Note the missing closing bracket.
== [
    a 
    b 
    c
]
>> object []
== make object! []
>> object [x: 1 y: 2]
== make object! [
    x: 1
    y: 2
== m ;<-- WTF? Note the missing closing bracket above.
```

[15:15](#msg5ba50af5e6046343f396a392)@9214 happen\*\*s\*\**

nedzadarek

[15:45](#msg5ba51221f4bd1056ac97cef9)https://github.com/red/red/issues/3539

```
source-a: make reactor! [a: 1]
source-b: make reactor! [b: 10]

obj: object [c: 0]
block: [obj/c: source-a/a * source-b/b]
react block
obj/c
; == 10

source-a/a: 2
obj/c
; == 20

; react/unlink block [source-a source-b] ; works fine
react/unlink block source-a ; freezes the console
```

9214

[15:45](#msg5ba5122de5c2cc56adc28c69)@nedzadarek thanks!

greggirwin

[16:58](#msg5ba523181043315947c5f03a)@9214, the doubling is a known issue I think. Along with the recent one @gltewalt submitted on scrolling.

9214

[17:12](#msg5ba52694e5c2cc56adc313d8)@greggirwin I'll mention this in @gltewalt's ticket then.

greggirwin

[17:29](#msg5ba52a608909f71f750a3df5):+1:

9214

[20:11](#msg5ba5508c7dca306503362959)@greggirwin and regarding `react` vs. `is`, worth a ticket or nay?

greggirwin

[20:28](#msg5ba55450d655361f76343785)Go ahead. I don't have time to look into it right now.

## Tuesday 25th September, 2018

PeterWAWood

[07:36](#msg5ba9e580fe37781110f3b1c8)Why does this give a script error:

```
>> view [
[    style my-text: text
[    title "title"
[    across
[    ]
*** Script Error: VID - invalid syntax at: [title "title" across]
*** Where: do
*** Stack: view layout cause-error
```

but this does not:

```
>> view [
[    title "title"
[    across
[    style my-text: text
[    ]
>>
```

toomasv

[15:55](#msg5baa5a7a53c31c11116209d0)@PeterWAWood Window props `size`, `backdrop` and `title` have to come first, then everything else.

[16:22](#msg5baa60e27bd81c5b9db091ec)See \[here](https://github.com/red/red/blob/master/modules/view/VID.red#L580)

## Wednesday 26th September, 2018

PeterWAWood

[01:07](#msg5baadbca01fb5f4ae121f1b8)@toomasv Thanks. That's a shame because it makes for messy codes from my point of view.

greggirwin

[04:33](#msg5bab0c1ccdc5013172541953)@PeterWAWood you think styles should be forced first?

PeterWAWood

[07:20](#msg5bab332101fb5f4ae123f2bf)@greggirwin In my mind, defining the styles needed before declaring the layout seems to be a worthy separation.

toomasv

[14:07](#msg5bab929daedb375b9c4d0ef5)Is this known limitation that `on-menu` actor of faces on `base`'s pane are not invoked?

```
view [
	base 100x100 silver 
	on-down [probe "gray"] 
	on-menu [probe event/picked]
	with [
		menu: ["One" grayone "Two" graytwo] 
		pane: layout/only [
			base 40x40 red 
			on-menu [probe event/picked 'done] 
			on-down [probe "red" 'done]
			with [
				menu: ["One" redone "Two" redtwo]
			] 
		] 
	]
]
```

When `panel` or `group-box` is used instead of top `base`, `on-menu` of bottom `base` works.  
:confused:

qtxie

[21:04](#msg5babf4638ddf5867dc7b43e0)@toomasv Yes. I think so.

greggirwin

[22:53](#msg5bac0de47bd81c5b9dbba8ef)@PeterWAWood I think the better solution is to update @rebolek's stylize, and make sure it matches how Doc wants it to work, so you can define your styles outside the layout. For me, the current approach works OK, because you declare things about the layout before what goes into it. Maybe it's something we can support either way, but Nenad can't look into it right now.

## Thursday 27th September, 2018

ne1uno

[02:55](#msg5bac46a801fb5f4ae12b06c3) email: "electronic(at)gsnail.com" is a crasher in the header in latest?

[05:51](#msg5bac6fe88ddf5867dc7df9c5)\*thought I had isolated a problem but it's not repeatable just with the email.

qtxie

[18:52](#msg5bad26d353c31c11117441ae)@toomasv The `on-menu` actor works on macOS, so it's a Windows issue.

9214

[21:53](#msg5bad516d41177e0bc7b89462)`about/debug` typed in GUI console with latest build results in a silent crash on W10. Can anyone confirm?

rebolek

[21:57](#msg5bad5247aedb375b9c58d89c)not here. but I get lots of random crashes with something else.

ne1uno

[21:58](#msg5bad526f7bd81c5b9dc3e08a)I think there's a ticket? at least it's been reported before in red/bugs win7 too

9214

[21:58](#msg5bad5296eba8e60bc6563595)Yup https://github.com/red/red/issues/3329

ne1uno

[22:00](#msg5bad530053c31c1111755ecc)maybe some stray unicode got into the output? another ticket for that crasher

[22:08](#msg5bad54d053c31c1111756afb)about/debug works in old gui

## Tuesday 2nd October, 2018

dander

[06:08](#msg5bb30b45600c5f64233e7d22)I'm able to get a pretty reliable access violation if I call `recycle`, followed by `? recycle` something like 1 - 5 times or so (it randomly occurs with the help call).

9214

[06:17](#msg5bb30d601c100a4f291a4df3)

```
text
>> recycle ? recycle

*** Runtime Error 1: access violation
*** at: 00429DEAh
```

greggirwin

[06:22](#msg5bb30e9cae7be94016eb29c9)@dander, please file a ticket.

dander

[06:49](#msg5bb314fbae7be94016eb52f2)@greggirwin, issue #3549 created. Thanks for verification @9214

rebolek

[12:02](#msg5bb35e6ebbdc0b2505d4689b)Another Heisenbug...Red sometimes crashes when making an object and sometimes does not.

greggirwin

[16:08](#msg5bb39802a9be136b94e5ab7d)@rebolek any good code for reproducing that?

9214

[16:39](#msg5bb39f25ae7be94016eef4e7)How should I name this one? :thought\_balloon:

```
Red [File: %bug.red]

#include %bug.red

a b [[]]
c: 0
compose/deep/only []
```

```
*** Runtime Error 1: access violation
*** at: 0042FDA7h
```

[16:42](#msg5bb3a00ae65a634336723662)And this one?

```
Red [File: %bug.red]

#include %bug.red

a b [[]]
c 0
compose/deep/only []
```

```
*** Script Error: set does not allow È       ╗ ╗  @
                                                   8`
                                                      ╗  Þ╔  ║   for its word argument
*** Where: set
*** Stack:
```

[16:44](#msg5bb3a072271506518da7cbe8)Ha!

[16:44](#msg5bb3a0805af48530684e0be2)

```
text
Red [File: %bug.red]
#include %bug.red
[][][]
```

```
*** Runtime Error 1: access violation
*** at: 0042FDA7h
```

rebolek

[17:48](#msg5bb3af82271506518da83392)@greggirwin I would love to, but it's hard to isolate it. The bug happens only sometimes and in complex script.

## Wednesday 3th October, 2018

dockimbel

[04:29](#msg5bb44590435c2a518e4348bc)@rebolek Try compiling your code in debug mode, and post the stack trace if any. Also, try to run your code with `recycle/off` to see if relates to the GC or not.

rebolek

[08:12](#msg5bb479d9c7bf7c3662ab29e6)@dockimbel here's the stack trace - https://pastebin.com/3RXsEh9t

dockimbel

[20:46](#msg5bb52a9a5331811c2e45be77)@rebolek Great, thanks!

[20:46](#msg5bb52ab5e65a6343367bcdac)@qtxie Please have a look at that stack trace above ^---.

qtxie

[22:26](#msg5bb542066e5a401c2d11a017)@rebolek Do you use `map!` or `hash!` in your script?

## Thursday 4th October, 2018

rebolek

[04:05](#msg5bb59170ae7be94016fae951)@qtxie `map!` heavily, I think there's no `hash!` in this one.

dockimbel

[04:12](#msg5bb593471e23486b9385d296)@rebolek We would need your code to track the root cause of that crash. Could you share it with @qtxie? (you can send him privately).

rebolek

[05:20](#msg5bb5a328271506518db41ccf)@dockimbel Ok, I will contact him privately.

toomasv

[09:13](#msg5bb5d9c25331811c2e49d165)@qtxie On Windows `area/selected` seems to count newlines as two chars. Bug?

[09:13](#msg5bb5d9c95af48530685bb2b5)\[!\[image.png](https://files.gitter.im/red/bugs/iJJd/thumb/image.png)](https://files.gitter.im/red/bugs/iJJd/image.png)

[10:22](#msg5bb5e9cf1e23486b9387e63c)Similar problem is with `offset-to-caret`.

Oldes

[16:35](#msg5bb6413cc7bf7c3662b67f8d)Not exactly bug... but don't want to pollute the main room.... what is the best behaviour in this case :  
`Red:`

```
>> x: any [all [1 2 print "yes"] 1]
yes
*** Script Error: x: needs a value
*** Where: x
*** Stack:
```

`Rebol2`:

```
>> x:  any [all [1 2 print "yes"] 3]
yes
** Script Error: x needs a value
** Near: x: any [all [1 2 print "yes"] 3]
```

`Rebol3:`

```
>> x:  any [all [1 2 print "yes"] 3]
yes
== 3
```

`Ren-c:`

```
>> x: any [all [1 2 print "yes"] 1]
yes
** Script Error: VOID! values are not conditionally true or false
** Where: all any _
** Near: [... 2 print "yes" ~~]
** Line: 1
```

[16:35](#msg5bb6415ac08b8b3067d13212)I prefer the `Rebol2` version. `Rebol3` is wrong. `Red` should have better error message.

9214

[16:37](#msg5bb641d1ae7be94016ff5fc9)@Oldes it depends on the treatise of `unset!` values. In Red and R2 they are "truthy".

Oldes

[16:42](#msg5bb64303600c5f642352ffb9)I think that being \_truthy_ is correct... because I was just bitten by Rebol3's behaviour.

[16:45](#msg5bb643bce65a63433682a6f5)`Red` is clear winner in this case:

```
>> if all [1 2 (print "yes")][print "go"]
yes
go
```

[16:48](#msg5bb64461c7bf7c3662b69327)At least for me ;-)

[16:49](#msg5bb64497bbdc0b2505e7073f)Especially when the only way how to debug in Redbol (for now) is using \_prints_ here and there.

greggirwin

[17:06](#msg5bb648b16e5a401c2d182419)An issue Red faces with the `near` part of the message is that, unlike R2, it can be compiled. It should be possible to add that info in interpreted mode though.

qtxie

[17:37](#msg5bb64fceae7be94016ffc163)@toomasv The "^/" is converted to "^M^/" on Windows. Please open a ticket so we can fix it later.

dsunanda

[19:22](#msg5bb6685b6e5a401c2d18f92f)I'm seeing some glitches in the VID/View repainting when animating boxes so they move across a panel. Not sure I can easily simplify the code any further - it's nearly 200 lines, including comments and a test script. Can I put that on github, or would you prefer another way?

toomasv

[19:24](#msg5bb66904c08b8b3067d23085)@qtxie OK, thanks, will do.

greggirwin

[19:28](#msg5bb669ca64cfc273f9974bc2)@dsunanda a gist is fine.

dsunanda

[22:33](#msg5bb6951c1c100a4f2930a3ac)Thanks Gregg. Gist is visible in the two images \[in this link](https://imgur.com/a/Oiy1TIU)

[22:35](#msg5bb6959764cfc273f99869d9)The first one is how it should work. The second one is how the first one sometimes slightly glitches. The second one differs from the first in that it omits an explict SHOW - which should be unnecessary anyway.  
Summary: Without SHOW of canvas/pane, it's completely broken.  
Withn SHOW of canvas/pane, it glitches many 1 time in 10.

[22:35](#msg5bb695c382893a2f3b9eb846)/ it glitches many 1 time in 10./ --&gt; /it glitches about 1 time in 10./

## Friday 5th October, 2018

temperfugit

[05:50](#msg5bb6fb92600c5f64235759b4)I'm having an issue with the recent nightly builds (including the most recent 10/3 one) where "image" doesn't display anything on Windows 8.1. Console says "\*\** View Error: CreateWindowEx failed!" The 0.63 build works properly on my Windows 8.1 install, and the 10/3 nightly build displays images fine on my Windows 10 machine.

greggirwin

[15:44](#msg5bb786e01e23486b93923700)There were some experiments done here recently, trying to address some other issues with the COMPOSITED flag. I don't know if they made it into nightly, but if someone can reproduce, we can look into it.

dockimbel

[17:37](#msg5bb7a144ae7be9401607f1cb)@qtxie ^---

## Saturday 6th October, 2018

dsunanda

[10:02](#msg5bb8881b1e23486b93980f72)More on glitches in the screen repainting....  
Code below has a blue square that chases a red square when you click Do-it.  
You can probably see various rendering issues, especially when the blue square starts completely off the canvas (both boxes are LOOSE, so can be repositioned by hand).  
Uncommenting the SHOW fixes the glitches in \*almost* every run.

[10:02](#msg5bb8882dc7bf7c3662c45ff6)

```
;; set up display with target red box
unview/all
view/no-wait compose [
    title (rejoin [system/version " " system/build/date])
	button "Chase" [Chase]
	canvas: panel 500x500 222.222.222 [at 200x200 target: box loose 200x200 red]
	dashboard: text 100x50
	]

    ;; Create flying blue box
flier: first get in layout [box 100x100 loose blue] 'pane
flier/offset: -100x-100
append canvas/pane flier

    ;; function to move blue box closer to red box
Chase: func [][
 forever [
    if flier/offset = target/offset [break]
     wait 0.001
     flight-direction: 0x0
     if flier/offset/1 < target/offset/1 [flight-direction/1: +1]	  
     if flier/offset/2 < target/offset/2 [flight-direction/2: +1]
     if flier/offset/1 > target/offset/1 [flight-direction/1: -1]	  
     if flier/offset/2 > target/offset/2 [flight-direction/2: -1]
     flier/offset: flier/offset + flight-direction
	 dashboard/text: rejoin  ["" flier/offset "..." target/offset]
     ;;;;;;; show canvas
	]  
   'done
]  

do-events
```

toomasv

[11:05](#msg5bb896f46e5a401c2d25cfe3)@dsunanda Flickering will be releaved with `system/view/auto-sync?: off` before your code (and `show` uncommented).

I tried also a version making use of `rate` without `autosync?: off`. I think result was decent:

```
view compose [
	title (rejoin [system/version " " system/build/date])
	button "Chase" [canvas/rate: 64]
	canvas: panel 500x500 222.222.222 [
		at 200x200 
		target: box loose 200x200 red
		at -100x-100
		flier: box 100x100 loose blue
	] on-time [
		flight-direction: 0x0
		if flier/offset/1 < target/offset/1 [flight-direction/1: +1]      
		if flier/offset/2 < target/offset/2 [flight-direction/2: +1]
		if flier/offset/1 > target/offset/1 [flight-direction/1: -1]      
		if flier/offset/2 > target/offset/2 [flight-direction/2: -1]
		flier/offset: flier/offset + flight-direction
		dashboard/text: rejoin [flier/offset "..." target/offset]
		if flier/offset = target/offset [face/rate: none]
	]
	dashboard: text 100x50
]
```

## Sunday 7th October, 2018

Tovim

[14:43](#msg5bba1b9182893a2f3bb31777)Hi, never ever did I have a problem with running red-063.exe binary except these (three?) days: starting the mentioned binary (via double click or in cmd console), I am getting a message "Compiling Red GUI console..." - the process of which always fails (after a minute), followed by MS Windows 10 Defender´s message, that we were infected by a Trojan:Win32/Tuerboos.A!cl virus that has been encased in the quarantine and that can be easily removed.  
Have read somewhere, that MS Windows 10 are so sophisticated lately, that some form of alarm can be reported for no reason.  
Please, confirm me that with the Red-063.exe compilation there is no problem before I set to a long way of seeking the cause at MS Windows.

9214

[14:44](#msg5bba1bc8c08b8b3067e7c7aa)@Tovim that's problem with AV vendors and their poor heuristics, not Red.

Tovim

[14:47](#msg5bba1c64ef4afc4f2831bca6)Sorry? I do not understand: "AV vendors" and "poor heuristics". Please, try it in other words. Thank you.

9214

[14:49](#msg5bba1cfb1e23486b93a1009d)@Tovim some antivirus software (Norton, Avast, Avira and Windows Defender) consistently flag Red toolchain and some compiled scripts as a "generic malware", even though binaries are not malicious or infected.

[14:51](#msg5bba1d56ae7be940161607b9)The best you can do is to mark toolchain as a false-positive and whitelist all Red-related folders. Or to swith to more adequate AV.

Tovim

[14:54](#msg5bba1e0d271506518dceb293)Please, what does it mean the "AV"? Thank you.

9214

[14:54](#msg5bba1e1b6e5a401c2d2e441e)Anti Virus, gee.

Tovim

[14:57](#msg5bba1edb1c100a4f29451ee5)Mea culpa! Windows Defender is free as a part of the instalation. Till now no problems. Maybe it could work with setting less defence activities. Will try. Thank.

9214

[15:01](#msg5bba1fd982893a2f3bb33506)It looks like Microsoft updates their databases each month (@BeardPower ?), people report false-positives, scanners go quiet, then cycle repeats.

BeardPower

[15:11](#msg5bba2228ae7be940161620c2)@9214 Yes. The whitelist the FPs once reported and confirmed. This changes their "AI" based heuristics and their scanner is triggered again.

[15:11](#msg5bba2235ae7be9401616212c)This time with another FP of the same software.

[15:12](#msg5bba226a600c5f642369a3fe)What was Trojan.Gen.Cheese last week is Trojan.Gen.Boon this week.

Tovim

[15:18](#msg5bba23d56e5a401c2d2e6854)Well, my respective Trojans were: Win32/{Fuerbos.A!cl, Fuerbos.C!cl, Unwaders.C!ml} - in turn.

9214

[15:23](#msg5bba24f71e23486b93a12c6f)https://docs.microsoft.com/en-us/windows/security/threat-protection/intelligence/malware-naming

dander

[17:25](#msg5bba41a3c7bf7c3662ce10b1)MS has a site for submitting binaries for false positive results

[17:26](#msg5bba41b7271506518dcf93a3)https://www.microsoft.com/en-us/wdsi/filesubmission

[17:27](#msg5bba41fbc08b8b3067e8ab53)I think a real person looks at them

Tovim

[18:37](#msg5bba5266e65a6343369a6a80)Hi @dander, I have visited the "/filesubmission" page and submitted my problem. Going to inform this forum. Thanks.

Oldes

[18:50](#msg5bba556f82893a2f3bb473ee)@dockimbel I found this difference between Red and Rebol - I wonder if it is intentional:  
`Rebol`:

```
>> all []
== true
```

`Red`:

```
>> all []
== none
```

endo64

[18:57](#msg5bba5725600c5f64236adb61)Would be nice to add to https://github.com/red/red/wiki/%5BDOC%5D-Differences-between-Red-and-Rebol if it is intentional.

[18:59](#msg5bba57a082893a2f3bb4827f)I remember that `all [] == true` was intentional.

## Monday 8th October, 2018

rebolek

[06:21](#msg5bbaf75a1e23486b93a497a1)Hm, what is better?

[06:23](#msg5bbaf7cac7bf7c3662d23df6)`Evaluates, returning at the first that is not true.` - One can argue that in empty block, no value is not true, so it shouldn't return `none`.

temperfugit

[17:04](#msg5bbb8e00384492366104429f)FYI I dug out an old tablet that also runs Windows 8.1. I can confirm that trying to display an image in View with the nightly build doesn't work on either Windows 8.1 device, and also the Red console doesn't have a flashing cursor to show where you are on the line. The stable 0.63 binary displays images and the cursor just fine on these devices.

dockimbel

[20:37](#msg5bbbbfedae7be94016216e17)In R3:

```
>> all []
== true
>> any []
== none
```

It's probably safer to return `none` in both cases as Red does.

[20:38](#msg5bbbc02e384492366105d337)@temperfugit We'll try to find a Windows 8.1 box to reproduce that here. (@qtxie)

rebolek

[20:48](#msg5bbbc29782893a2f3bbac849)It's probably safer to return \*same value* in both cases. If it should be `true` or `none` is other question.

## Tuesday 9th October, 2018

dander

[07:37](#msg5bbc5aa0c08b8b3067f20cc7)To me, the literal `all []` doesn't have much meaning to me, but when I try to imagine the kind of situation where that case would occur, I think the Rebol version makes more sense. This could come up while dynamically collecting conditions under which some action is taken. Using `all` implies that if any of the conditions are not met, then the action would not be taken. Eliminating all the conditions would imply that the action be taken unconditionally.

rebolek

[07:39](#msg5bbc5b3dc08b8b3067f2128d)@dander Yes, I agree with that.

rcqls

[08:16](#msg5bbc63eee65a634336a8632f)@dander Your explanation is certainly why `julia`, `R` and `python` answer respectively `true` and `false` when executing `all([])` and `any([])` .

9214

[08:20](#msg5bbc64b9384492366109f9bd)I agree with @dockimbel, `any` and `all` on empty block should return `none`, because there are no expressions inside the block to base our condition. If that's desired, user can check if block is `empty?` in advance.

rebolek

[08:20](#msg5bbc64e65331811c2e72ac6a)@9214 There are no expressions, so none of them returns `false`. Therefore, the result should be `true`.

9214

[08:22](#msg5bbc653cc08b8b3067f2426d)@rebolek absence of `false` does not automatically means `true`.

rebolek

[08:24](#msg5bbc65b2bbdc0b25050d085a)Yes, but it also does not automatically mean `none` also. You can argue for both and what's more practical should be implemented.

9214

[08:25](#msg5bbc6605435c2a518e75e5d0)`none` at least prevents condition from executing code, as in `if all [][...]`

[08:26](#msg5bbc664564cfc273f9b3d0d2)In edge cases like that I'd rather prevented potential error from spreading.

rebolek

[08:26](#msg5bbc6651c7bf7c3662dcc8ea)The question is if that's desirable. OTOH, `if all[][...]` can be rewritten as `all [...]` anyway, so from this POV, we don't lose anything when `all []` returns `none`.

bitbegin

[09:27](#msg5bbc7489600c5f64237946a5)@temperfugit @dockimbel @qtxie to modify manifest's will fix these two issues

[09:27](#msg5bbc74995331811c2e731d5f)default is for win10

[09:58](#msg5bbc7bbaae7be94016267226)As `GetVersionEx` is depcated, maybe we should use `VersionHelper` to get system version

Tovim

[15:24](#msg5bbcc8136e5a401c2d40bf9a)Hi @dander and @9214, submitting red.exe for inspecting at microsoft.com is informative but doesn´t help. Marking it as a false-positive in Windows Defender works. Hopefully, it will not be needed in some not far future. Thank you.

9214

[15:24](#msg5bbcc83eae7be9401628f43b)@Tovim the issue with false-positives is a long-standing one, and unlikely to go anythere in the near future.

Tovim

[15:27](#msg5bbcc8dd435c2a518e78e2d4)Maybe, but why didn´t it occur to me before?

9214

[15:29](#msg5bbcc958ae7be9401628fffc)@Tovim because Microsoft periodically updates their heuristics and databases, and because not all scripts you write can be mistaken for malicious software.

[15:30](#msg5bbcc97b271506518de14d53)See \[here](https://github.com/red/red/issues?utf8=%E2%9C%93&amp;q=is%3Aissue+label%3Atype.AV+)

qtxie

[21:53](#msg5bbd23486e5a401c2d439739)@temperfugit Pushed a fix. The view should work fine on Win8.1 now.

## Wednesday 10th October, 2018

temperfugit

[00:32](#msg5bbd4881e65a634336af6410)@qtxie It is working now. Thank you!

xqlab

[13:29](#msg5bbdfed3f659e67772903e2a)Why does Rebol anf Red offer three truth values? none is neither true nor false, so I am for none as result of empty conditions.

9214

[13:31](#msg5bbdff17f659e67772904003)@xqlab where did you see 3 truth values?

[13:31](#msg5bbdff33ae7be9401631c281)In conditional expressions, any value except `false` and `none` is counted as "truthy".

[13:32](#msg5bbdff8bae7be9401631c629)&gt; none is neither true nor false

`none` is false in logic sense, not in datatype sense.

xqlab

[13:36](#msg5bbe007aef4afc4f284d03a5)sorry, just my wish

[13:38](#msg5bbe00c93844923661161a14)If none always means the same as false, why is it existent in Rebol ?

[13:40](#msg5bbe013864cfc273f9b80716)

```
>> none? true
== false
>> none? no
== false
```

9214

[13:41](#msg5bbe0196271506518dea1193)`none` is not the same as `false`, they are values of different datatypes.

xqlab

[13:45](#msg5bbe025c3844923661162743)Why a different datatype, if the meaning is the same? There are already other words for false like no or off with the same type.

9214

[13:47](#msg5bbe02f1ef4afc4f284d1470)Their meaning is anything but the same.

xqlab

[13:50](#msg5bbe038e1c100a4f29607d74)So tell me what's the reason for none according your opinion

9214

[13:56](#msg5bbe05116e5a401c2d49af01)`none!`denotes the absence of value or result, akin to null, `logic!` denotes boolean values.

[13:57](#msg5bbe054d82893a2f3bc4c620)According to Rebol and Red documentation.

xqlab

[14:00](#msg5bbe06056e5a401c2d49b76e)So none should be neither true nor false

9214

[14:02](#msg5bbe06731e23486b93ac8a30)By what logic..?

xqlab

[14:16](#msg5bbe09ac38449236611660b7)null ist neither true nor false

Tovim

[14:57](#msg5bbe13726e5a401c2d4a1f78)Still wading in improper installed red.exe application. New scenery today. Trying to download fresh binary file at the Red/Downloads page, I got this FireFox message:  
Your connection is not secure. The owner of static.red-lang.orh has configured their website improperly. Static.red-lang.org uses an invalid security certificate. This certificate expired on October 10, 2018, 12:33:02 PM. Error code (link): SEC\_ERROR\_EXPIRED\_CERTIFICATE. There follows a text with the certificate chain.  
This text am I able to sent as a mail attachment, when needed.

9214

[15:28](#msg5bbe1a9de65a634336b552e6)@xqlab I don't follow what are you trying to say and why you're saying it in `/bugs` room.

Tovim

[19:03](#msg5bbe4d126e5a401c2d4bfb58)Back to my input at 16:57: There seems to be no problem with an invalid certificate now. Thank you.

## Thursday 11st October, 2018

xqlab

[05:11](#msg5bbedb6ec08b8b3067fd3a0c)@9214 the discussion started about

[05:13](#msg5bbedbfb600c5f64238b38ae)

```
>> all []
== true
>> any []
== none
```

maximvl

[08:49](#msg5bbf0e93ef4afc4f28549ea6)Hello, I wonder if someone can test this https://github.com/red/red/issues/3080 in the new pre-release build to check if it's fixed, thank you :)

[08:49](#msg5bbf0ea81c100a4f2968060f)hm, let me also do it myself first

[09:07](#msg5bbf12ba1c100a4f2968232b)ok, crash still happens on `date: 11-Oct-2018/10:49:41+02:00` build

ne1uno

[13:50](#msg5bbf5532ae7be940163ba82a)no crash RED: \[ branch: "master" tag: #v0.6.3 ahead: 1073 date: 9-Oct-2018/23:49:12 commit: #b313e166528c31c0276dfd28118d4043bc525917 ]

[13:50](#msg5bbf55321c100a4f296a3ad0)PLATFORM: \[ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]

[13:53](#msg5bbf55cf435c2a518e8b8d38)@maximvl

meijeru

[18:55](#msg5bbf9cb0ae7be940163e1291)As requested by @dockimbel : here are my favorite tickets -- I have selected ones that are either relatively easy to resolve, or real obstacles to proper operation. All the other ones that I ever submitted, and that are still open, can wait a little while more (some 80 issues in all). BTW #2661 has been built and can be closed.  
#2518, #2633, #2674, #2812, #3329, #3379, #3424, #3516, #3517

9214

[23:24](#msg5bbfdbc6e65a634336c253a0)any idea why `do path` in the case below returns `false`?

```
>> a: [b c]
== [b c]
>> do 'a/b
== false
>> reduce 'a/b
== c
```

[23:26](#msg5bbfdc34f659e677729e6b14)and then

```
>> do quote a/b
== a/b
>> do quote :a/b
== c
>> do quote 'a/b
== 'a/b
```

## Friday 12nd October, 2018

dockimbel

[04:07](#msg5bc01e116e5a401c2d590cf5)@meijeru Thank you. :+1: @greggirwin Let's put those tickets in the todo-list for the new release.

[04:08](#msg5bc01e5ae65a634336c3eee3)@9214 Looks wrong, worth a ticket.

maximvl

[08:40](#msg5bc05e15600c5f64239667a5)@ne1uno I see, but linux still has the problem :(

[08:45](#msg5bc05f2f1c100a4f2971c247)there also was a startup issue that I can't start Red from other programs

[09:29](#msg5bc069736e5a401c2d5b0e36)reported: https://github.com/red/red/issues/3562

[09:30](#msg5bc069b8435c2a518e935652)I understand it's coming from some Rebol hackery, but nonetheless it limits the usage

9214

[09:30](#msg5bc069c8271506518dfb8a90)@maximvl citing readme:  
&gt; Note: Running the Red toolchain binary from a $PATH currently requires a wrapping shell script (see relevant tickets: #543 and #1547).

maximvl

[09:34](#msg5bc06ac3ae7be9401643a52e)@9214 just tried, I don't get the error with a wrapper, but also no output =\\

9214

[09:41](#msg5bc06c42271506518dfb9bc7)@maximvl shouldn't it be `print 5 + 5`?

maximvl

[09:41](#msg5bc06c646e5a401c2d5b240c)I tried both ways

[09:50](#msg5bc06e76e65a634336c61a62)it also works with `ipython` but not with `python` %)

[09:53](#msg5bc06f0de65a634336c61db3)anyway I put all my findings into the issue

dsunanda

[11:28](#msg5bc08579435c2a518e941f09)Is this a known bug (/fix!). In R2 lines 2 and 4 invoke the function. In Red, only line 4 does:

```
obj: make object! [fun: does [print "--> obj/fun run"]]
do get in obj 'fun           ;; invokes 'fun in R2 only
var: get in obj 'fun
var                            ;; invokes 'fun in Red and R2
```

9214

[11:29](#msg5bc085aa82893a2f3bd03175)@dsunanda this is an intended design choice, `do` passively evaluates `function!` values.

[11:29](#msg5bc085b7271506518dfc4f5d)https://github.com/red/red/issues/3553

dsunanda

[11:40](#msg5bc088213844923661285840)Thanks for the quick answer. Not entirely sure I agree with the change - it seems to add more anomalies than it fixes - such as below. One line runs the function, the other one doesn't.

```
a: reduce [111 does [print 222]]
do pick a 2
do a/2
```

9214

[11:41](#msg5bc08858ae7be940164486f9)@dsunanda this has nothing to do (no pun intended) with `do`.  
https://github.com/red/red/issues/3482

[11:41](#msg5bc08881600c5f642397b236)If you index with `path!`, function will be evaluated. `pick` with `select` avoid evaluation.

dsunanda

[11:46](#msg5bc08994ef4afc4f285fa5ab)And FIND works one way while SELECT works another - so it looks to me that we're missing a chance to simplify mental models of what is going on

```
do find a function!
do select a 111
```

9214

[11:47](#msg5bc089e638449236612865a6)@dsunanda again, all of your examples have nothing in common with `do`.

[11:48](#msg5bc08a13e65a634336c6f868)`find` returns series at position where the first value of `function!` datatype was found, `select` treats block as a key/value store and returns a value that follow the key (if any).

[11:49](#msg5bc08a591c100a4f29730146)`do` on block simply evaluates a block, `do` on function returns a function.

dsunanda

[11:56](#msg5bc08be76e5a401c2d5c0e5f)Thanks for the explanations. I think I am more regretting the complications this adds in porting code from R2 to Red

```
obj: make object! [fun: does [print 111]]
do get in obj 'fun             ;; existing code
do reduce [get in obj 'fun]    ;; portable version of code
```

9214

[11:58](#msg5bc08c78ae7be9401644a832)@dsunanda this two lines boil down to `obj/fun`.

[12:07](#msg5bc08e6d38449236612889cf)And, by the way:

```
>> do in obj 'fun
111
```

Oldes

[16:49](#msg5bc0d0a3271506518dfedaa8)&gt; Is this a known bug (/fix!). In R2 lines 2 and 4 invoke the function. In Red, only line 4 does:

```
obj: make object! [fun: does [print "--> obj/fun run"]]
do get in obj 'fun           ;; invokes 'fun in R2 only
var: get in obj 'fun
var                            ;; invokes 'fun in Red and R2
```

I consider it to be a bug. But I would use code as @9214 points out above.

[16:51](#msg5bc0d12c435c2a518e96aba1)But maybe @dsunanda has reason why he used in R2 `do get in obj 'fun`

[16:53](#msg5bc0d19a435c2a518e96b04a)On a deeper though, maybe it is not a bug... it can be simplified into:

```
>> f: does [print 1]
== func [][print 1]
>> do :f
== func [][print 1]
```

9214

[16:54](#msg5bc0d1bb435c2a518e96b164)@Oldes :point\_up: see my \[previous message](https://gitter.im/red/bugs?at=5bc085aa82893a2f3bd03175).

dsunanda

[16:59](#msg5bc0d2fd271506518dfee9c1)There are now some inconsistencies in handling/ignoring/throwing errors bewteen R2 and Red with code such as below (plus DOing it, and using GET/ANY). To be fair, R2 changed its behavior around version 1.6, so R2 itself has been inconsistent.....and Red is closer to the older R2 behavior.

```
get in system 'badword
in system 'badword
system/badword
```

9214

[17:01](#msg5bc0d379ae7be9401647140b)Well, Red is not R2, so I don't understand why you keep comparing them. `in` returns `none` if word is not present in an object, accessing non-existend word with path will throw an error, which you can catch or suppress with `try` and `attempt`, respectively.

Oldes

[17:06](#msg5bc0d486600c5f64239a5685)I would prefer to have Red behaviour like Rebol. I'm interested in Red because it is close to Rebol2.

[17:07](#msg5bc0d4ce38449236612acddd)@9214 we are comparing Red and Rebol, because instead of you some of us spend years using Rebol.

dsunanda

[17:08](#msg5bc0d517f659e67772a5598f)To a certain extent, R2 is a reference implementation for Red - it certainly should be possible for Red developers to explain why they have looked at the reference, anf taken a different / perhaps better path.  
Otherwise we are left on the dark - for example /COMPARE is ignored when SORTing a string in Red, while honored in R2. Oversight or principled design decision? I can't know unless somone is prepared to compare the two and discuss the differences.

Oldes

[17:08](#msg5bc0d52064cfc273f9bf8104)They don't have to be same, but if there are some design changes, it should be at least documented and explained.

9214

[17:13](#msg5bc0d64a64cfc273f9bf84d5)&gt; /COMPARE is ignored when SORTing a string in Red, while honored in R2

?

```
>> sort/compare "cbcaabcacc" func [x y][x < y]
== "aaabbccccc"
>> sort/compare "cbcaabcacc" func [x y][x > y]
== "cccccbbaaa"
```

dsunanda

[17:17](#msg5bc0d7191c100a4f29757d99)But......

```
sort/compare "cbcaabcacc" func [x y][x > y]
== "aaabbccccc"
sort/compare "cbcaabcacc" func [x y][x < y]
== "aaabbccccc"
```

9214

[17:18](#msg5bc0d74dbbdc0b25052e249b)What's that suppose to mean?

```
>> sort/compare "cbcaabcacc" func [x y][x > y]
== "cccccbbaaa"
>> sort/compare "cbcaabcacc" func [x y][x < y]
== "aaabbccccc"
>> sort/compare "cbcaabcacc" func [x y][x > y]
== "cccccbbaaa"
>> about
Red 0.6.3 for Windows built 6-Oct-2018/7:28:28+05:00 commit #dafc828
```

dsunanda

[17:19](#msg5bc0d7a1e65a634336c977e4)second sort should be reverse of first. One has a "&lt; " while the other has a "&gt;"

9214

[17:20](#msg5bc0d7cdbbdc0b25052e29a7)@dsunanda okay, that's the case in both of my snippets, all susequent function have different comparators.

[17:20](#msg5bc0d7e81c100a4f2975862b)While in your case it somehow ceases to work. Which version are you using?

dsunanda

[17:23](#msg5bc0d890f659e67772a57373)Okay, thanks -- I can see it now working on the current daily. Not working on the current public, stable release.

9214

[17:25](#msg5bc0d8ff271506518dff1aa4)I think I already mentioned that it's better to grab updates regularly, instead of sticking to a year old build with lots of unfixed bugs.

[17:26](#msg5bc0d93d271506518dff1d5c)This is the second time it causes confusion, when you report a bug and it's already been fixed.

dsunanda

[17:33](#msg5bc0daf0ef4afc4f2862451f)You have mentioned that before. But I am not a developer OF Red, I am a developer IN Red - or, at least, I am evaluating it it see whether it is useful. I will routinely use what the website itself defines as the stable version. If that stable version is triggering too many bug reports, that is an issue for the development team - not us users.

And remember, I never reported the SORT issue as a bug -- It is/was a difference between R2 and Red - and you have seemingly ruled out differences as issues for discussion in Red forums ("Well, Red is not R2, so I don't understand why you keep comparing them"). Ditto some dozen or so other undocumented behavior differences that I am aware of.

9214

[17:42](#msg5bc0dcf9435c2a518e970cf7)Don't you think "stable version of \_alpha_ software" is a somewhat vague term, and that you should at least consider to use nightly build when regular Red developer suggests you to do so, instead of interpreting information on the website as the ultimate truth?  
Changes happen on a daily basis, and if you want a pleasant experience while evaluating Red, as a user, then I suggest to do at least semi-regular updates, which, fortunately, are two clicks away and take almost none of your time.

Initial design goals clearly stated that Red aims at least at 90% compatability with R2, not 100%, and significant changes gonna happen on the road to 2.0. Not a single promise was given about documenting or even "justifying" any deviations from Rebol, as far as I can tell. In some cases R3 behavior was chosen instead of R2, somewhere Red team implemented a change or innovation of its own. I do not agree that Red should "stick to the roots" and avoid innovation, otherwise it will just remain where R2 and R3 were left.

[17:52](#msg5bc0df4fc7bf7c3662fe3fdb)Comparisons with Rebol are welcomed if you have a strong justification for them, and if they make a general sense. "Red should follow Rebol because I have trouble porting my code" is not a strong justification IMO. Provide concrete, specific use-cases, and we'll see what we can do.

dockimbel

[21:58](#msg5bc118faae7be940164920b0)@dsunanda Some of your questions were answered during R3's development, and Red simply chose to follow some evolutions/fixes from R3. If you find a behavior that differs both from R2 \*and* R3, then we do owe you an explanation. ;-)

[22:00](#msg5bc119976e5a401c2d608be6)One evolution that R3 started and that Red is continuing is the elimination of variable-arity behaviors. R3 eliminated it in `make` and Red pushed the consistency by forbidding it from `do` too. So, the cases where `do` could consume an arbitrary number of argument values following it are forbidden. The goal was to make R3/Red more easily statically analyzable.

endo64

[22:48](#msg5bc124ce271506518d015bf4)`draw` changes it block! argument If I don't `copy`, it looks like a bug;

```
d: [box 0x0 10x10 box 20x20 10x10]
c: copy d
view [base 100x100 green draw d]
probe d
probe c = d

== [box 0x0 10x10 box 10x10 20x20] (d changed)
== false
```

[22:51](#msg5bc12583bbdc0b25053069a3)But strangely, if I execute same line `view [base 100x100 green draw d]` with the changed block, it still draws the original block.

9214

[22:52](#msg5bc125ac38449236612d3cec)@endo64 because, technically, it's the same box, just with two coordinates swapped around.

endo64

[22:53](#msg5bc125ee435c2a518e9924ad)@9214 correct, 2 AM is a bit late to think :)

9214

[22:54](#msg5bc12612ae7be94016497617)Tell me about it

```
>> now/time
== 3:53:49
```

It looks like normalization of some sort.

BeardPower

[22:56](#msg5bc126b5f659e67772a7c258)@9214 Huh? Since when are two boxes with different edge points the same box?

9214

[22:58](#msg5bc1270e600c5f64239cd24e)@BeardPower how many boxes do you see here?

```
? (draw 500x500 [box 100x100 200x200 box 200x200 100x100])
```

[22:59](#msg5bc127346e5a401c2d60e304)The differ only in order of drawing commands, but the geometric shape itself is the same.

BeardPower

[22:59](#msg5bc12736f659e67772a7c4af)Two.

[22:59](#msg5bc12743271506518d016a9f)But the edge point is different.

[22:59](#msg5bc1276538449236612d466f)Top left and bottom right.

9214

[23:00](#msg5bc12785c7bf7c3662005beb)@BeardPower so, how many boxes do you \_see\_? :wink:

BeardPower

[23:00](#msg5bc12787ef4afc4f28648a97)It should not draw it like that.

[23:01](#msg5bc127b1435c2a518e992e84)Because box one starts at 100x100 and box two at 200x200.

[23:01](#msg5bc127c5ae7be94016497f6c)So how can it be the same.

9214

[23:01](#msg5bc127c738449236612d48ce)\[!\[изображение.png](https://files.gitter.im/red/bugs/OOqJ/thumb/\_\_\_\_\_\_\_\_\_\_\_.png)](https://files.gitter.im/red/bugs/OOqJ/\_\_\_\_\_\_\_\_\_\_\_.png)

BeardPower

[23:01](#msg5bc127cf600c5f64239cd7c3)It's a bug.

[23:02](#msg5bc127efe65a634336cbd54b)Why should one box be drawn from bottom right to top left?

[23:02](#msg5bc12809600c5f64239cd917)And box one from top left to bottom right?

9214

[23:02](#msg5bc1280bef4afc4f28648d58)Ah, yes, you're right.

BeardPower

[23:02](#msg5bc12812435c2a518e992f9e)It makes no sense.

9214

[23:03](#msg5bc12850c7bf7c366200606f)top-left / bottom-right coordinates. Definitely not the best time for thinking :confused:

BeardPower

[23:03](#msg5bc12855c7bf7c3662006089)It seems that it switches drawing order if the second edge has coordinates less than the first edge.

9214

[23:04](#msg5bc1287dae7be940164987b1)@BeardPower yes.

[23:05](#msg5bc128bfef4afc4f2864927e)@endo64 sorry, I confused you. Worth to file a ticket in such case.

BeardPower

[23:06](#msg5bc128dc435c2a518e993476)Is it a feature or a bug? :smile:

9214

[23:06](#msg5bc128df38449236612d4f93)... unless @BeardPower is way over midnight here too.

endo64

[23:06](#msg5bc128e11e23486b93b4d40a)@9214 No problem, I'll do it.

9214

[23:06](#msg5bc1290e271506518d017666)Reminds me of the tale about 3 blind men and an elephant.

BeardPower

[23:06](#msg5bc12913ae7be94016498b81)01:06

[23:07](#msg5bc1292982893a2f3bd2af83)@9214 lol :+1:

endo64

[23:21](#msg5bc12c97c7bf7c36620077de)It doesn't just re-order, it mixes the coordinates:

```
>> view [base 100x100 green draw x: [box 20x20 10x10 box 15x5 0x10]]
>> x
== [box 10x10 20x20 box 0x5 15x10]
```

Where did 0x5 and 15x10 comes from?

[23:23](#msg5bc12cf1e65a634336cbf176)#3564

BeardPower

[23:24](#msg5bc12d14c7bf7c36620079e0)A box cannot have an offset of 0.

[23:24](#msg5bc12d2ff659e67772a7e8a9)Definitely some bonanza going on.

## Saturday 13th October, 2018

toomasv

[04:23](#msg5bc17350bbdc0b2505323605)@BeardPower Why not? Draw-coordinates are 0-based. E.g. if you want to draw border for panel:

```
view [panel with [draw: compose [box 0x0 (size - 1)]]]
```

[04:25](#msg5bc173cb435c2a518e9aff6a)@endo64 It is very convienient. To ensure `box` is drawn it seems to take `min coord1 coord2 max coord1 coord2` for coordinates.

endo64

[07:52](#msg5bc1a433ae7be940164c6aa2)@toomasv Yes. The issue is draw modifies its argument. If this is expected, we should always `copy` before giving our block to draw.

BeardPower

[10:12](#msg5bc1c519384492366130fd74)@toomasv That would not be a border, because of the 0x0 edge. It would need to be 1x1 for an inside and -1x-1 for an outside border. But I was not talking about 0x0 as the starting edge but 0x0 as the opposite edge. 10x10 0x0 would draw nothing as it's dimension would be zero.

[10:14](#msg5bc1c568c08b8b30670a7f1c) So it's neither a box nor a line or even a single pixel.

## Wednesday 17th October, 2018

endo64

[19:20](#msg5bc78b60c7bf7c3662294072)Is this a bug?

```
>> type? 1:2:-3
>>       ; no output

>> d: type? 1:2:-3
>> d
== time!

>> 1:2:3
== 1:02:03
>> 1:2:-3
>>    ;no output
```

rebolek

[19:21](#msg5bc78bb0069fca52a5504052)@endo64 try `probe d`

9214

[19:21](#msg5bc78bb2f659e67772d09fdb)@endo64 Huh

```
>> [1:2:-3]
== [1:02:00 :-3]
```

rebolek

[19:21](#msg5bc78bbdbbdc0b250558ea73):mouse:

9214

[19:21](#msg5bc78bc9271506518d2a232c)@endo64 what you're getting is `unset!` from `:-3`.

[19:21](#msg5bc78bcdc08b8b30672dd596)Kawaii! Sugoi-sugoi desu ne `:^3`

endo64

[19:22](#msg5bc78be06e5a401c2d89b177)Yes, I just saw:

```
>> probe reduce [ 1:2:-3]
[1:02:00 unset]
```

[19:22](#msg5bc78beff659e67772d0a0c9)So desu ne :)

meijeru

[19:25](#msg5bc78ca6600c5f6423c5afe4)In `time!` literals, there can only be a minus sign in front, not in the other parts. What is wrong here IMO is that there is no good error handling/message. Worth a ticket?

9214

[19:25](#msg5bc78ca8435c2a518ec1c881)@rebolek will you DJ ID&amp;T set at RedCon?

[19:25](#msg5bc78cbd271506518d2a294e)You know what track should come first :mouse: :rocket:

[19:26](#msg5bc78ced1e23486b93d61d8f)@meijeru but it lexes correctly, sort of.

meijeru

[19:28](#msg5bc78d51ef4afc4f288cf64f)No it does not, since `1:2:` is not a legal time literal, not even for `1:02:00` and even it it were acceptable, then `-3` should not become `unset`.

9214

[19:28](#msg5bc78d72435c2a518ec1ccce)@meijeru but `1:2` \*is* a legal time literal.

[19:28](#msg5bc78d7bc08b8b30672de0b8)And `:-3` is a legal `get-word!`.

rebolek

[19:30](#msg5bc78de5271506518d2a3230)@9214 this is an interesting idea but I'm afraid there won't be an opportunity.

meijeru

[19:31](#msg5bc78e2f384492366155ea5d)@9214 Yes, that is the way the lexer looks at it. So the trouble (if it is considered trouble) is in the fact that there need not be a space between the two lexical items. Perhaps there should be a requirement in this case...

[19:33](#msg5bc78e7164cfc273f9e19c54)Because this can surely be considered a "gotcha"

rebolek

[19:38](#msg5bc78fb7bbdc0b2505590620)@meijeru I agree that the space should be required. Red is not a can of sardines or Hong Kong flat. More space is good.

[19:40](#msg5bc79017c08b8b30672ded51)But `:-3` being legal `get-word!` is very problematic IMO.

meijeru

[19:59](#msg5bc7949664cfc273f9e1c672)One could indeed argue that, since `-3` is not a word, `:-3` should not be a get-word. Apparently the lexer grammar has not been so exhaustively tested.

9214

[20:01](#msg5bc7951d271506518d2a63e2)

```
text
>> foreach x probe reduce [-3 '-3][probe type? x]
[-3 -3]
integer!
word!
== word!
```

rebolek

[20:02](#msg5bc7955b271506518d2a6625)This is certainly a problem.

dockimbel

[20:41](#msg5bc79e62ae7be94016733a51)Please log that `:-3` issue in a ticket.

9214

[20:50](#msg5bc7a0971c100a4f29a0f9af)https://github.com/red/red/issues/3569

dockimbel

[21:30](#msg5bc7aa0c384492366156a583):+1:

## Monday 22nd October, 2018

x8x

[21:39](#msg5bce43979786c7419295707b)Is Red CLI supposed to work in Cygwin Terminal on Windows (7 here) ? CLI Console starts but I don't get a prompt:

[21:40](#msg5bce43b23a42fa76532ecac4)\[!\[Screenshot 2018-10-23 at 04.37.53.png](https://files.gitter.im/red/bugs/iVvm/thumb/Screenshot-2018-10-23-at-04.37.53.png)](https://files.gitter.im/red/bugs/iVvm/Screenshot-2018-10-23-at-04.37.53.png)

[21:41](#msg5bce44170386d0635fedebe8)And btw, what is the latest/best more linux like Console that can be installed on Windows 7 ?

BeardPower

[21:43](#msg5bce446b384492366180737e)@x8x http://babun.github.io/

ne1uno

[21:43](#msg5bce446f64cfc273f90bd94c)mintty?

x8x

[21:46](#msg5bce454d898e4e19edd91ae4)Wired, after a CTRL-C to exit the Red CLI Console, I get this:

[21:47](#msg5bce4566db022f757af4c2a4)\[!\[Screenshot 2018-10-23 at 04.43.28.png](https://files.gitter.im/red/bugs/BtfP/thumb/Screenshot-2018-10-23-at-04.43.28.png)](https://files.gitter.im/red/bugs/BtfP/Screenshot-2018-10-23-at-04.43.28.png)

BeardPower

[21:55](#msg5bce47581c100a4f29ca3309)Seems like the return value.

x8x

[21:59](#msg5bce482fe4b1d87dc792b228)Thanks @BeardPower and @ne1uno ! :smiley:

[21:59](#msg5bce4853f0a85e40a7510ab4)I get the same with babun, no Red prompt. Any ideas?

ne1uno

[22:00](#msg5bce4882ef4afc4f28b6c14e)old gui still has Xp support?

[22:02](#msg5bce48e682893a2f3b239ad2)or maybe Xp code isn't in cli? maybe build cli local from R2 see if that works

x8x

[22:28](#msg5bce4f25f0a85e40a7510abb)@BeardPower Does it work for you? You get a Red prompt?

BeardPower

[22:44](#msg5bce52bd600c5f6423f0358b)@x8x I run Win10, not Win7.

x8x

[22:53](#msg5bce54d2aed22a514b61e878)@BeardPower Ok thanks! Anyone on Win7 could test?

ne1uno

[22:56](#msg5bce55a66e5a401c2db4846d)what is in this thing for 225meg ziped? electron?

x8x

[22:57](#msg5bce55cddb022f757af4c2af)@ne1uno I thought the same... actually it includes all cygwin

ne1uno

[22:59](#msg5bce565e069fca52a57abe3c)uses mintty anyway

[23:02](#msg5bce5712384492366180e09b)won't the red cli console just pop open its own window on windows?

x8x

[23:02](#msg5bce571df0a85e40a7510abe)Yea, should have gone with mintty as I had cygwin installed already, but less time I spend in Windows the better.. The good think is you click the dot bat file and it does all the magik and you get a Console up and running when it's done.

[23:04](#msg5bce57600386d0635fedec03)@ne1uno Yea but I was testing ASCII colors in a `red.exe --cli` console.

ne1uno

[23:14](#msg5bce59f1384492366180f4d5)x8x: I get silent exit with any version of cli, your latest colors.red, runs in gui but just shows ansi codes

[23:15](#msg5bce5a00600c5f6423f05e40)win7

x8x

[23:16](#msg5bce5a37e4b1d87dc792b232)Yea, no ANSI colors in GUI that way I was trying on a normal console..

## Tuesday 23th October, 2018

ne1uno

[00:36](#msg5bce6d1a82893a2f3b2468bc)an older version of colors or copied from chat did turn prompt red, but otherwise shows debugging output

[03:01](#msg5bce8f0dbbdc0b2505850689)x8x: seems like cli console blocked for me too in babun zsh in win7, shows header but no prompt. I'll see if search has any help

[03:30](#msg5bce95c2ef4afc4f28b87f71)plain minGW mintty acts the same as on cygwin.

[05:14](#msg5bceae22435c2a518eee2fb8)you can run something in its own window, cygstart /path/console.exe path\\prog.red

[05:14](#msg5bceae51069fca52a57c9e97)but the path gets translated to forward slashes. is it possible console is getting hung trying to find the cfg file?

[05:15](#msg5bceae6bc7bf7c366255cc6f)when run from inside the terminal

[06:52](#msg5bcec5391c100a4f29cd185b)python -i sort of works, not sure what else -interactive mode is good for

[07:34](#msg5bceceeb069fca52a57d7165)https://code.google.com/archive/p/mintty/issues/56 it's a known issue, https://github.com/rprichard/winpty a tool for Cygwin and MSYS for running Windows console program

x8x

[12:26](#msg5bcf13600386d0635feded2c)@BeardPower So this works on Win10 but not on Win7? I had the old Console work in Cygwin IIRC about a year ago.

BeardPower

[14:24](#msg5bcf2f1a069fca52a58003ba)@x8x In bambu and Win10 it has the same behavior as yours. gui-console.exe opens the GUI REPL but also a console, so what you type in the GUI-console is replicated in the console. Starting console.exe will not eval anything until you exit it.

x8x

[15:58](#msg5bcf450ff0a85e40a7510d00)@BeardPower console.ext you mean same as`red.exe --cli` ?

BeardPower

[16:03](#msg5bcf463664cfc273f9125359)@x8x Yes, the compiled REPL.

Oldes

[20:10](#msg5bcf803a1c100a4f29d225fd)Checking REBOL vs Red again and found that in `Rebol2`:

```
>> select/part (skip [1 2 1 2 1 2] 2) 1 2
== 2
>> select/part (skip [1 2 1 2 1 2] 2) 2 2
== 1
```

While in `Red`:

```
>> select/part (skip [1 2 1 2 1 2] 2) 1 2
== 2
>> select/part (skip [1 2 1 2 1 2] 2) 2 2
== none
```

@dockimbel which one is correct? I would say that Red's result. Right?

[20:25](#msg5bcf83c91c100a4f29d23f70)But it seems to be inconsistent with:

```
>> select/part  [1 2 1 2 1 2] 2 2
== 1
```

dockimbel

[22:06](#msg5bcf9b6d1e23486b9308daa4)@Oldes On first look, it should work like in Rebol. `/part` limits the search for the key, but should not affect the reachability of the value. So the following case should be considered a bug:

```
>> select/part (skip [1 2 1 2 1 2] 2) 2 2
== none
```

Oldes

[22:21](#msg5bcf9efaef4afc4f28bf5b85)Hm... I'm not sure if reaching value out of the part range is the good one.

greggirwin

[23:37](#msg5bcfb0bd1e23486b9309588a)If `/part` limits the same for `select` and `find`, it's then a matter of documenting this subtle behavior.

[23:39](#msg5bcfb116c08b8b3067614302)Instinctively, I thought the same as @Oldes but technically, R2's behavior seems easier to reason about.

## Wednesday 24th October, 2018

dockimbel

[00:41](#msg5bcfbfcd600c5f6423f9a25c)This is what the docstring says for `select/part`:

```
/part        => Limit the length of the search.
```

It only applies to the searching of the key, not to the value retrieval.

Oldes

[07:48](#msg5bd023e782893a2f3b2f8a7a)I still think the value should not be selected out of bounds. I imagine the `/part` as a feature where I don't have to cut the series to do actions on it. Selecting out of the given range seems to be odd to me. I wonder if someone have a real use case.

dockimbel

[19:16](#msg5bd0c4f5271506518d6476f7)@Oldes Remember that `select ...` is just a shortcut for `all [pos: find ... pos/2]`, so `select/part ...` needs to behave like `all [pos: find/part ... pos/2]`, or that would create a new consistency issue.

Oldes

[19:18](#msg5bd0c57fc08b8b3067685348)In my head `select/part [1 2 3] 2 2` should be same as `select copy/part [1 2 3] 2 2`

[19:22](#msg5bd0c665ab17df2631e4baa0)And if I should use your case, I would say: `all [pos: find/part ... (part - 1) pos/2]` else it is really selecting out of `part` bound.

[19:24](#msg5bd0c6d21e23486b9310b307)I don't say it is big issue for me... I'm using rebol many years and noticed it just now, because I was hunting issues.

[19:27](#msg5bd0c7ac1c100a4f29daac3f)Btw... if I would need current functionality, I could use your way using `find/part` :) But somehow I feel, that more useful is to be able to do `select` in given \_range_ without need to `copy/part` the series.

endo64

[19:30](#msg5bd0c86abbdc0b250593b9ec)This still looks like a bug:

```
>> select/part (probe skip [1 2 3 4 5 6] 2) 4 2
[3 4 5 6]
== none
>> select/part [3 4 5 6] 4 2
== 5
```

dockimbel

[20:23](#msg5bd0d4dbc7bf7c3662646ad2)@Oldes  
&gt; And if I should use your case, I would say: `all [pos: find/part ... (part - 1) pos/2]` else it is really selecting out of `part` bound.

You are still missing it, `/part` doesn't apply on selecting, but on finding. If you change that, `select` becomes inconsistent with `find`.

[20:25](#msg5bd0d52fc08b8b306768bb79)Let me rephrase it in a simpler way: `select` = `second find`. That is the meaning of `select` and how it is implemented both in Rebol and Red.

Oldes

[20:26](#msg5bd0d56ac7bf7c3662646e74)I'm not missing it... I would just prefer smarter `select` and not `select` to be just a shortcut for `second find`

dockimbel

[20:27](#msg5bd0d5cb82893a2f3b345e80)@Oldes  
&gt; Btw... if I would need current functionality, I could use your way using `find/part` :) But somehow I feel, that more useful is to be able to do `select` in given \_range_ without need to `copy/part` the series.

That's a job for a new feature we are thinking about (slices). We won't break `select` consistency with `find` just for one rare use-case.

Oldes

[20:28](#msg5bd0d5f5069fca52a58b2748)Ok... than you should at least fix the `skip` case.

dockimbel

[20:29](#msg5bd0d6193844923661916153)If you are referring to the `none` result, that's a bug that need to be logged in a ticket.

[20:30](#msg5bd0d68182893a2f3b3463ee)@Oldes BTW, any chance you can come to Prague on 3rd or 4th at least, or you're definitely not available?

Oldes

[20:32](#msg5bd0d6f1069fca52a58b2dee)Unfortunately I'm not available... we have an Amanita's meeting once a year and it will be exactly 1.-4.11. in Orické mountains.

[20:37](#msg5bd0d816600c5f642300e76d)Here it is: https://github.com/red/red/issues/3577

dockimbel

[20:45](#msg5bd0d9dcae7be94016ae1beb)Thanks!

## Thursday 25th October, 2018

Oldes

[08:34](#msg5bd180281c100a4f29df0d67)@dockimbel is it by design, that default image color in Red is `white` while in Rebol it was `black`?

rebolek

[08:36](#msg5bd180951e23486b9315121e)Also, why it's not `red`? ;-)

dockimbel

[21:53](#msg5bd23b461e23486b931a1a7c)@Oldes Yes, same as for web pages, background defaults to white.

endo64

[22:14](#msg5bd24035ae7be94016b74c05)Built-in `replace` behaves different than newly created one

```
>> replace [a] 'a does ["x"]
== [func []["x"]]
>> rep: do mold :replace
>> rep [a] 'a does ["x"]
== ["x"]
```

9214

[22:15](#msg5bd24064069fca52a59445a9)@endo64 https://github.com/red/red/wiki/\[DOC]-Guru-Meditations#compiled-versus-interpreted-behaviors

endo64

[22:16](#msg5bd240dac7bf7c36626d9140)@9214 Thanks. Its also different compiled vs. REPL.

[22:22](#msg5bd2423cc08b8b306771f51f)Also,

```
>> replace [a] 'a does ["x"]
== [func []["x"]]
>> replace/deep [a] 'a does ["x"]
== ["x"]
```

dockimbel

[22:50](#msg5bd248a9271506518d6e2a46)@endo64 On a quick look, the `replace` body cannot handle safely a function for its `value` argument, as it would need to refer to it using `:value` to keep it inactive (otherwise the function would be called). I just tried such fix here and the results are then identical.

9214

[22:51](#msg5bd248e9600c5f64230a42d5)@dockimbel but `:value` suppresses any evaluation.

endo64

[23:41](#msg5bd254bcef4afc4f28d0d91f)@9214 , yes, and I think it is the desired behavior, not the below one.

```
>> replace/deep/all [a a a] 'a does [random 100]
== [53 81 67]
```

9214

[23:45](#msg5bd255afab17df2631eed954)@endo64 I don't think it really is.

```
>> foo: func [x y z][replace x y z]
== func [x y z][replace x y z]
>> foo [a b c] 'b (to word! "x")
== [a x c]
>> foo [a b c] 'b 1 + 2
== [a 3 c]

>> foo: func [x y :z][replace x y z]
== func [x y :z][replace x y z]
>> foo [a b c] 'b (to word! "x")
== [a to word! "x" c]
>> foo [a b c] 'b 1 + 2
*** Script Error: + operator is missing an argument
*** Where: catch
*** Stack:
```

[23:54](#msg5bd257a0069fca52a594d621)Referring to `does [...]` with `:value` will yield `does` word, not the function.

[23:56](#msg5bd2581a1c100a4f29e497b2)Besides, if you really want to replace something with a `function!` value:

```
>> type? second probe replace [a b c] 'b reduce [does ['x]]
[a func []['x] c]
== function!
```

## Friday 26th October, 2018

rebolek

[00:16](#msg5bd25ced600c5f64230ab166)What...

```
>> replace [a b c] 'a 'x
*** Script Error: a has no value
*** Where: find
*** Stack: replace
```

dockimbel

[00:34](#msg5bd2610f435c2a518e06612a)@9214 I meant using `:value` in the `replace` body, not in its spec block.

9214

[00:34](#msg5bd2612e82893a2f3b3e2c31)@dockimbel ah, that makes sense.

dockimbel

[00:35](#msg5bd2615c1e23486b931b010d)@rebolek Works fine here.

rebolek

[00:36](#msg5bd2618dae7be94016b81f45)@dockimbel ok, I will try to rebuild and see if it's better

[00:38](#msg5bd2621338449236619b47f8)Fine now, thanks.

endo64

[06:19](#msg5bd2b2006e5a401c2dd08f7d)@rebolek it was a regression after adding `/case` refinement fixed recently.

rebolek

[07:14](#msg5bd2bec382893a2f3b4060c0)@endo64 Ah, ok. Thanks!

## Monday 29th October, 2018

x8x

[20:57](#msg5bd7743fb5f5456747ed29dc)@rebolek Looks like @qtxie fixed the issue with Arch and `read http..`, latest nightly runs fine on Manjaro.

rebolek

[20:58](#msg5bd774781c100a4f2904010d)@x8x yes, he fixed it two or three weeks ago, IIRC.

[20:59](#msg5bd774acab17df26310e7aaf)16.10 exactly :)

## Tuesday 30th October, 2018

dander

[07:12](#msg5bd80451c7bf7c366290da27)I can't get the clock demo to run from the current GUI console on Win 10

[07:28](#msg5bd808121c100a4f29073cbc)This snippet seems to be enough to cause the console to crash

```
clock-demo: {
    base rate 1 now
}

view [
    title "test"

    source: area 410x300 clock-demo 

    panel 200x300 react [
        attempt/safer [face/pane: layout/tight/only load source/text]
    ]
]
```

Commenting the `base rate 1 now` part will allow it to come up, and then it can be un-commented and won't crash any longer (the whole demo will work by that point as well). So it appears to be related to the initial load.

[07:29](#msg5bd808413844923661bdbd18)I'm heading to bed, but maybe someone can confirm whether they see this as well?

rebolek

[07:30](#msg5bd808851c100a4f29073f77)@dander crash confirmed

toomasv

[08:03](#msg5bd81046600c5f64232d4410)@dander With latest build it crashes. With my older Sep 28 build it works. Somewhere regression crept in.

endo64

[10:52](#msg5bd837ffae7be94016dc04ac)Crash confirmed on W10, only on GUI console

dockimbel

[15:34](#msg5bd87a18ef4afc4f28f67b7b)Confirmed here too on W10. @qtxie that one is for you. ;-)

greggirwin

[15:52](#msg5bd87e3f1c100a4f290a61b2)Confirmed here too. Is that enough to consider it mined?

dander

[17:35](#msg5bd89668bbdc0b2505c4ee9b):smile: thanks all. Issue #3580 reported

endo64

[18:59](#msg5bd8a9fa82893a2f3b654422)probably @qtxie will solve it in 5 minutes :)

rebolek

[21:23](#msg5bd8cbec6eb1e3597a857ce3)Should `all` accept `unset!` as truthy value? My guess is that it shouldn't, but:

```
>> all [get/any first [sfsafsa] "no"]
== "no"
```

endo64

[21:39](#msg5bd8cf8e26be6b597942ca98)@rebolek It wasn't before, but I remember Carl decided to relax it for some use cases in Rebol. Red follows that decision.  
A simpler example is`all [print 1 "no"]`

rebolek

[21:40](#msg5bd8cfd0a9c55b2574808e94)I see, I can live with it.

## Wednesday 31st October, 2018

hiiamboris

[11:01](#msg5bd98b9d25b9875faeaee637)Script:

```
Red []
? system/script/args
? system/options/args
? system/options/path
```

Command:

```
D:\torrents\musick\2014.07.16 - Kalafina THE BEST ''Red''>d:\gear\red2 ticket26.red "Kalafina - THE
BEST ''Red''.mkv"
```

Those `''` inbetween are actually two apostrophes  
Ironically, Red sees THE BEST prefix as too much flattery ;)  
Output:

```
SYSTEM/SCRIPT/ARGS is a string! value: {"Kalafina - THE BEST {}Red{}.mkv"}

SYSTEM/OPTIONS/ARGS is a block! value.  length: 1  ["Kalafina - THE BEST {}Red{}.mkv"]

SYSTEM/OPTIONS/PATH is a file! value: %/D/torrents/musick/2014.07.16%20-%20Kalafina%20THE%20BEST%20''Red''/
```

Note how `''` becomes `{}`. W7 x64 latest. Anyone can confirm on other platforms?

endo64

[13:39](#msg5bd9b0aa26be6b597948075f)Confirmed on Win10, though the last one looks different, there is no double ' char:

```
SYSTEM/SCRIPT/ARGS is a string! value: {"Kalafina - THE BEST {}Red{}.mkv"}
SYSTEM/OPTIONS/ARGS is a block! value.  length: 1  ["Kalafina - THE BEST {}Red{}.mkv"]
SYSTEM/OPTIONS/PATH is a file! value: %/C/Users/endo/Documents/2014.07.16%20-%20Kalafina%20THE%20BEST%20'Red'/
```

hiiamboris

[13:50](#msg5bd9b30b076992347a93c694)@endo64 thanks. And I thought at least options/path is reliable... ;)

[14:06](#msg5bd9b6f05905a9195530b4ed)https://github.com/red/red/issues/3581

meijeru

[22:13](#msg5bda28ef0445e15fad02fed1)Discovered something that is either a bug or a feature:

```
>> b: [1 2 3]
== [1 2 3]
>> b/(#"^B")
== none
>> pick b (#"^B")
== 2
```

What does the community think?

[22:17](#msg5bda2a06538a1c1971533f9b)For me, the `none` result makes sense, but the fact that `pick` allows characters instead of integers as index is an unexpected extension.

[22:18](#msg5bda2a49076992347a96ea10)Neither Rebol 2 nor Rebol 3 allow this.

## Thursday 1st November, 2018

toomasv

[05:15](#msg5bda8bf7a9c55b25748b430d)@meijeru Also

```
>> b/(to-integer #"^B")
== 2
>> pick b #"^B"
== 2
```

endo64

[05:56](#msg5bda958926be6b59794d8785)pick's index argument is scalar and it converts it to integer. We need to use `select` for that case. R2 and R3 returns error or none?

## Saturday 3th November, 2018

novvorto\_twitter

[05:41](#msg5bdd34fd5905a91955474e9b)@9214 Strangely,

```
>> to get-word! "-3"
*** Syntax Error: invalid character in: "-3"
*** Where: to
*** Stack:
```

Is there a way to check the datatype of `:-3` alone?

[05:43](#msg5bdd3589a9c55b25749cdce5)I thought all literals cannot be turned into a get-word!. Then how come 1reduce `[1:1:-1]` gets and unset?

[05:47](#msg5bdd367e5905a91955475a67)

```
>> to get-word! "peter@yahoo.com"
*** Syntax Error: invalid character in: "peter@yahoo.com"
*** Where: to
*** Stack:
```

```
>> to get-word! {#"a"}
*** Syntax Error: invalid character in: {#"a"}
*** Where: to
*** Stack:
```

```
>> to get-word! "1:1:1"
*** Syntax Error: invalid character in: "1:1:1"
*** Where: to
*** Stack:
```

```
>> to get-word! "1"
*** Syntax Error: invalid character in: "1"
*** Where: to
*** Stack:
```

## Monday 5th November, 2018

gltewalt

[23:29](#msg5be0d26caa56280c97104b14)

```
>> type? first [:-3]
== get-word!
```

[23:57](#msg5be0d8edaa58bd1674485ec0)

```
>> type? quote :-3
== get-word!
```

[23:59](#msg5be0d974aa58bd1674486108)

```
>> type? quote print
== word!

>> type? quote true
== word!

>> type? quote #[true]
== logic!
```

## Tuesday 6th November, 2018

meijeru

[10:05](#msg5be16771fbb6f507e63f2e02)@endo64 R2 returns error, since the pick argument is `number! logic! pair!`. Red's pick argument is of a wider typeset, which supposedly has good reasons. But this particular case could still be caught. Shall I make an issue?

endo64

[11:20](#msg5be178e6aa56280c97141cbc)@meijeru It might be worth a ticket with your example:

```
b: [1 2 3] s: "123"
pick b #"^B" ; == 2
pick s #"^B" ; == #"2"
pick s 1.9 ; == none
```

It doesn't explicitly convert its index argument to integer. It happens only for char! type.

Oldes

[11:58](#msg5be18201f25a725338fcd016)The \[`char!`](https://github.com/red/red/blob/master/runtime/datatypes/structures.reds#L203) value has internaly same structure like \[`integer!`](https://github.com/red/red/blob/master/runtime/datatypes/structures.reds#L155) so no need for conversion.

[12:08](#msg5be1843d1f2bb1676b6125df)You can see how the index is received here: https://github.com/red/red/blob/master/runtime/actions.reds#L94-L109

[12:13](#msg5be1855daa58bd16744c5fd1)I'm personally quite not sure, if picking using `char!` index is useful enough.

endo64

[14:57](#msg5be1abed6200995df1463f53)Picking using `char!` doesn't look useful to me, just confusing.

toomasv

[16:30](#msg5be1c1b19c65e607e70ba117)It would be interesting to see use-cases for all types allowed as indexes:

```
>> ? pick
USAGE:
     PICK series index
;...
ARGUMENTS:
     series       [series! bitset! pair! tuple! date! time!] 
     index        [scalar! any-string! any-word! block! logic! time!] 

>> ? scalar!
SCALAR! is a typeset! value: make typeset! [char! integer! float! pair! percent! tuple! time! date!]

>> ? any-string!
ANY-STRING! is a typeset! value: make typeset! [string! file! url! tag! email!]

>> ? any-word!
ANY-WORD! is a typeset! value: make typeset! [word! set-word! lit-word! get-word!]
```

rebolek

[16:37](#msg5be1c35fde33dd0c96db97e3)And it would be great to add path as index, as I mentioned on Red Devcon.

9214

[17:08](#msg5be1ca837312745337323034)@rebolek wouldn't they clash with `date!` values?

```
>> 06/11/18
== 6-Nov-2018
```

rebolek

[18:40](#msg5be1e008f25a725338ff4563)@9214 when written as `make path! [6 11 18]`, then no. Yes they can't be loaded, but they are not forgotten also.

## Wednesday 7th November, 2018

hiiamboris

[13:51](#msg5be2edd547217e07ffe5ef4e)

```
>> i: make image! [1x1 0.0.0.0]
== make image! [1x1 #{000000}]
>> i/(1x1)
== 0.0.0.0
>> i/(1x1): 1
== 1
>> i/(1x1)
== 9.0.0.0
>> i/(1x1): 10000
== 10000
>> i/(1x1)
== 9.0.0.0
```

shouldn't it tell me I'm doing nonsense instead? or there's a meaning?

meijeru

[17:45](#msg5be324cd9600d10e647369db)See issue #2883. The integer is supposed to be used as a four-byte quantity, but apparently, there is a programming mistake. A new issue should be raised.

hiiamboris

[17:55](#msg5be3270662866f7473621fcc)ok!

meijeru

[17:57](#msg5be327929600d10e64737db9)It is even more curious that poke gives another result than path expression:

```
>> i: make image! [1x1 0.0.0.0]
== make image! [1x1 #{000000}]
>> poke i 1x1 1
== 1
>> i
== make image! [1x1 #{0B0000}]
```

hiiamboris

[18:03](#msg5be328e64e7ca145206c8006)noted that in https://github.com/red/red/issues/3582

## Thursday 8th November, 2018

endo64

[21:52](#msg5be4b0097326df140ed6e239)`to integer!` on a unicode char returns incorrect result?

```
>> to binary! #"Ü"
== #{C39C}
>> to integer! #"Ü"
== 220
>> to integer! to binary! #"Ü"
== 50076
```

[21:53](#msg5be4b054c0e6da07fef6f062)220 is the ANSI code for Ü char in Turkish-1254 (or 8859-9)

hiiamboris

[22:51](#msg5be4be0e92b7d117215c1f35)

```
>> to binary! #"☺"
== #{E298BA}
>> to binary! to integer! #"☺"
== #{0000263A}
```

[22:54](#msg5be4beb347217e07fff18328)brings us here https://www.utf8-chartable.de/unicode-utf8-table.pl?start=9728&amp;names=-  
and then my guess is `to binary! ...` encodes into utf8, while `to integer! ...` into utf32

[22:56](#msg5be4bf32bb887874749be5a4)and #"Ü" is also 220 in latin-1, so is in utf-32...

## Friday 9th November, 2018

meijeru

[08:53](#msg5be54b137a36913a9a1518c8)Your guess is correct.

[11:35](#msg5be571114e7ca145207adb75)However, it would perhaps be better if to-binary on a character yielded the Unicode Point number, just as to-integer does, and the UTF-8 encoding would only be used for strings. What does the community think?

hiiamboris

[11:49](#msg5be574612138723405dcd2f0)methinks it's more uniform the way it is now:

```
>> a: b: #"♥"
>> rejoin [to-binary a to-binary b]
== #{E299A5E299A5}
>> to-binary rejoin [a b]
== #{E299A5E299A5}
```

[11:53](#msg5be5752ac0e6da07fefbab9a)otherwise I'll have to convert every char to string first... which is an extra action (suppose I'm processing strings and work on single chars)

meijeru

[12:22](#msg5be57c1847217e07fff5eba7)It is true that one can always do `to-binary to-integer` to get the other result.

## Saturday 10th November, 2018

Rebol2Red

[11:09](#msg5be6bc624e7ca14520832388)Why do i get 16 times the character -?

```
loop 5 [ prin {-} ] print []
```

When i execute the code directly into the console (0.6.3) i get 5  
If i put the code into a red file ex. testing.red  
Place it into the same map as my red-exe.exe  
Execute it with: red-exe.exe testing.red  
I get 16 in the opened console window  
Strange, because when i put the code into that opened console window, i get 5???

Nedzadarek:  
@Rebol2Red You are right (at least on the new console). Can you post it into \[/bug room](https://gitter.im/red/bugs) as well? Maybe it was fixed.  
ps. new console: `Red 0.6.3 for Windows built 22-Oct-2018/18:39:48+01:00 commit #d3c8c4f`  
old: `Red for Windows version 0.6.3 built 26-Mar-2018/1:14:22+02:00`

I tested it with the latest build:  
Red 0.6.3 for Windows built 8-Nov-2018/8:26:02+01:00 commit #06ddce9  
Not fixed.

hiiamboris

[11:21](#msg5be6bf2e3102f145217caaf2)I confirm though only GUI console seems to be affected

[11:23](#msg5be6bf9762866f7473788b07)the count of `-`s being output with `loop N [...]`is 2^(N-1) for some reason

[11:25](#msg5be6c04147217e07fffdd3ac)maybe it modifies (corrupts) the initial `{-}` string and then adds it to itself?

[11:26](#msg5be6c06d47217e07fffdd4a5)

```
Red []
loop 10 [ prin s: {-} ] print []
? s
```

```
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
S is a string! value: {--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------}

>>
```

[11:28](#msg5be6c0cee0fd6b4360cf83fc)@Rebol2Red please ticket this ☺

ne1uno

[11:50](#msg5be6c61a47217e07fffdf5c6)old gui ok too

lepinekong\_twitter

[21:32](#msg5be74e7de0fd6b4360d2f0fc)Red has regressed: this doesn't return empty string instead of final url:

```
command: {"C:\Windows\System32\curl.exe"  -Ls -o /dev/null -w %{url_effective} https://aka.ms/win32-x64-user-stable}
    url>: copy ""
    err: copy ""
    call/shell/output/error command url> err
```

hiiamboris

[22:46](#msg5be75fd6bb06d73a9954a341)wine?

9214

[22:46](#msg5be75fe1bb06d73a9954a36f)@hiiamboris PEBKAC

hiiamboris

[22:47](#msg5be7601947217e07ff01b679)☻

## Monday 12nd November, 2018

greggirwin

[22:12](#msg5be9fab5bb06d73a99646356)Picking on char values doesn't seem too useful to me. As others said, it may be more confusing, and you can be explicit about it.

Similar for the binary encoding of chars, as @hiiamboris noted.

We should doc both points.

[22:22](#msg5be9fd18bb88787474bc130b)@lepinekong\_twitter do you have an example of old and new behavior? Not sure what you mean, but `call` always returns an integer value.

## Tuesday 13th November, 2018

rebolek

[06:13](#msg5bea6b7bbb88787474bea4a2)I got some ridiculous errors, unfortunately it's not in simple code, so it's hard to isolate. Example:

```
*** Script Error: empty? does not allow string! for its block argument                        
*** Where: rejoin
```

ne1uno

[06:22](#msg5bea6daf7326df140ef9cd79)can you increase trace size? `system/state/trace: 22` it's way too easy to get stuck with un-runnable errors

rebolek

[06:25](#msg5bea6e58bb06d73a99671e90)I haven't pasted the stack as it's not the point. The point is that the error should say `rejoin does not allow string! for its block argument`. `empty?` 1) allows `string!`, 2) has no `block` argument.

9214

[06:26](#msg5bea6e83e0fd6b4360e5a3d4)@rebolek perhaps you accidentally redefined something?

rebolek

[06:27](#msg5bea6eb99600d10e64a079b8)@9214 when I look at source of `empty?` and `rejoin`, they're fine.

9214

[06:28](#msg5bea6ef97a36913a9a345733)And the error persists on a fresh run?

rebolek

[06:28](#msg5bea6f0d2138723405fb538d)yes, it's on fresh run

9214

[06:29](#msg5bea6f66fee6703aaf61a695)Well, idk, if it appeared after some change in code - try to locate the culprit . Otherwise try to track down specific Red version which introduced the regression.

rebolek

[06:31](#msg5bea6fd13102f1452192f2fc)Of course. I was just curious if anybody has seen similar problem.

9214

[06:32](#msg5bea70116b9822140d20ed96)@rebolek how big is your code, by the way?

rebolek

[06:33](#msg5bea70464e7ca14520997eaa)~45kB, it's Values script.

9214

[06:34](#msg5bea70787326df140ef9d920)https://gitter.im/red/help?at=5be8a9303102f145218828d9

Starts to look suspicious.

[06:35](#msg5bea70a97326df140ef9dac3)And, as a very wild guess, try it with GC turned off.

rebolek

[09:20](#msg5bea974c92b7d117217fbba0)I've fixed the source of the error in my code, but I'd like to get back to it and see where the problem can be.

meijeru

[10:33](#msg5beaa87a47217e07ff154e6f)Unfortunately, I too have some unexplainable malfunctions (view does not show anything, or a draw block is not rendered after a change) that cropped up after GC was introduced. Again, it is in fairly large programs and difficult to isolate.

lepinekong\_twitter

[10:45](#msg5beaab59e0fd6b4360e72715)@greggirwin I'm not talking about return value, I'm talking about url&gt; output var which should contained the final redirected url.

toomasv

[10:55](#msg5beaad87e0fd6b4360e731fb)@meijeru Have you tried `system/view/platform/redraw`?

meijeru

[11:04](#msg5beaafc07326df140efb68b9)@toomasv I have now. Doesn't work. I checked that the draw-block was changed, but the change does not appear even with redraw.

[11:07](#msg5beab07b4e7ca145209b0dc5)It does occur after an `unview` followed by a `view`, with a recalculated layout.

[11:22](#msg5beab40547217e07ff15952a)I have also tried to turn GC off, but there is no difference.

toomasv

[12:19](#msg5beac141bb06d73a99693314)@meijeru Did you try also `/draw: /draw` ? This has always worked for me.

meijeru

[12:29](#msg5beac3a3fee6703aaf63c969)Thanks a lot! This works. But it is a kludge, and there must be an underlying issue. Has that been reported?

[12:31](#msg5beac4042138723405fd7241)Namely, it is not necessary after the first call of `view`.

toomasv

[12:33](#msg5beac48bbb88787474c0df9f)I haven't researched it but I suspect it has something to do with subseries in `draw`. I may be totally wrong though. May be intial `show` would also help?

meijeru

[14:17](#msg5beadce14e7ca145209c2ef2)It is true that the changes in the draw block are performed by `poke` on individual elements. So it could be a bug in the reactivity mechanism...

toomasv

[14:28](#msg5beadf9fbb88787474c1aa7f)Does anyone confirm that `alert "msg"` does not close on clicking "ok"?

meijeru

[14:34](#msg5beae0e43102f1452195da36)Yes - I just tried it with the latest W10.

[14:35](#msg5beae118e0fd6b4360e8918c)Looking at the source, there is no `[quit]` on the button!

greggirwin

[14:39](#msg5beae223d001b91720540d71)Should maybe just be `unview`, rather than `quit`, but that's an easy fix for someone. Make a ticket if you want.

meijeru

[14:39](#msg5beae22b7326df140efcbaf8)Also, the argument may be a block! but that should be refused by the VID. Is this a recent addition to the view facilities?

greggirwin

[14:40](#msg5beae24efee6703aaf649ffc)@lepinekong\_twitter can you post results with working an non-working Red versions, noting their build dates?

[14:41](#msg5beae2a6fee6703aaf64a2a8)@rebolek can you patch `rejoin` to see what it's getting when that error happens? Odd indeed.

[14:44](#msg5beae3324e7ca145209c5c01)It gets composed @meijeru, but I agree that there should be a `reform` there if we want to support blocks, as not all blocks will work directly.

rebolek

[14:45](#msg5beae38e4e7ca145209c5d9c)@greggirwin it's getting right data, just the error message is wrong.

greggirwin

[14:46](#msg5beae3bb4e7ca145209c5ecc)On the subject of requesters: https://gist.github.com/greggirwin/9cd640ca42bdfd56c5ff4432c4765d2c

Any thoughts or comments are welcome, especially on naming, code structure, and how best to do the images (which are currently very crude).

[14:47](#msg5beae3f76b9822140d23bfbe)@rebolek but you shouldn't get that error passing a string to `empty?`.

meijeru

[14:49](#msg5beae4934e7ca145209c66e2)The alert issue is #3586.

greggirwin

[14:52](#msg5beae51b92b7d1172181bf45)Thanks.

rebolek

[14:53](#msg5beae54ce0fd6b4360e8ac3d)@greggirwin but it's not `empty?` that is causing this error, it's `rejoin`. There was error in my code, I was passing `string!` to `rejoin`, that error got caught, but the function is reported incorrectly as `empty?`.

greggirwin

[14:57](#msg5beae652fee6703aaf64c312)Ahhhh.

meijeru

[16:17](#msg5beaf92c4e7ca145209cf9d5)@greggirwin Saw your PR for 3586. What is ^O?

greggirwin

[16:20](#msg5beaf9b862866f7473923383)ctrl+o. We should have someone look at accelerator key subsystems, as we don't catch those today. That plays into the UI side as well, as Windows uses &amp; in a caption to underline the hot key.

[16:21](#msg5beaf9ff47217e07ff1781cf)I don't know what other OSs do in that regard.

meijeru

[16:21](#msg5beafa1c7a36913a9a37f934)Why should ^O be used to close the alert? Is it because "OK" starts with an O? Seems far-fetched.

greggirwin

[16:24](#msg5beafaad3102f14521969598)I would prefer Alt+O, with a true accelerator key on Windows, but we can't do that today. It should map to Command+O on MacOS, which I think is the standard. A mac user would have to verify that though.

meijeru

[16:33](#msg5beafcdb2138723405fef27f)You seem to assume that an accelerator key is necessary at all.

greggirwin

[16:42](#msg5beaff0862866f74739256fb)Not necessary, but often nice.

toomasv

[19:06](#msg5beb20b97a36913a9a38fd25)It seems that `Red` lexer is too eager to reckognize `Red` program.  
file `try.txt`:

```
Hello Red probe "try"
Red [] probe "Hoi!"
```

```
>> do %try.txt
"try"
"Hoi!"
== "Hoi!"
```

file `try1.txt`

```
"Hello Red probe try"
Red [] probe "Hoi!"
```

```
>> do %try1.txt
*** Syntax Error: invalid value at {"Red [] probe "Hoi!"}
```

file `%try2.txt`

```
"Hello Reb probe try"
Red [] probe "Hoi!"
```

```
>> do %try2.txt
"Hoi!"
```

It doesn't wait for brackets.

## Wednesday 14th November, 2018

greggirwin

[01:11](#msg5beb76399600d10e64a71734)Definitely worth a ticket.

[22:02](#msg5bec9b887326df140e07e527)@meijeru, do you want me to remove the ^O shortcut in my PR?

meijeru

[22:10](#msg5bec9d42d001b917205f429f)Why should you? It is supplementary. The only thing is, one should remember to align it in future to a policy on short-cut keys yet to be decided.

greggirwin

[23:14](#msg5becac589600d10e64aef9e5)Yes, we need a cross-platform-enabled UI/UX lead.

## Thursday 15th November, 2018

gltewalt

[03:29](#msg5bece80a7326df140e09a88c)Generally the Enter Key fires the default button. “OK”  
With MacOS Enter would click OK, and by default, Esc would click Cancel.

[03:31](#msg5bece8966b9822140d308631)Also with MacOS, if you use Tab to navigate to a different button, the space bar fires the button event

[03:34](#msg5bece92c6b9822140d308aaf)Inconsistently, `Command+First Letter On Button` works

[03:35](#msg5bece9904e7ca14520a969b3)`Command`+`.` also fires off Cancel

[03:38](#msg5becea30d001b91720611693)Control+O on windows is equivalent to Command+O on mac, so you had it right

[03:39](#msg5becea619600d10e64b07df0)https://support.microsoft.com/en-us/help/970299/keyboard-mappings-using-a-pc-keyboard-on-a-macintosh

greggirwin

[17:04](#msg5beda71ff1b8753404cf4330)Thanks @gltewalt!

## Friday 16th November, 2018

dsunanda

[09:23](#msg5bee8ca6f9993b426719f75a)Any one else seeing this under Windows? (happens on 0.6.3 stable release, and latest nightly):  
Create a simple VID window, eg: view \[box 200x200 red].  
Now grab the title bar and move it around rapidly - the console window will soon minimize.

toomasv

[09:47](#msg5bee922080e46b4266bd440b)@dsunanda Yep! ALL my open applications got minimized!

9214

[10:54](#msg5beea1e7de42d46bba72941b)Specifications of `native!`s support nested definitions of `function!` (`any-function!`s ?) in typesets, e.g. `parse` specifies `callback`s signature:

```
>> probe spec-of :parse
[
    "Process a series using dialected grammar rules" 
    input [binary! any-block! any-string!] 
    rules [block!] 
    /case "Uses case-sensitive comparison" 
    /part "Limit to a length or position" 
    length [number! series!] 
    /trace 
    callback [function! [
        event [word!] 
        match? [logic!] 
        rule [block!] 
        input [series!] 
        stack [block!] 
        return: [logic!]
    ]] 
    return: [logic! block!]
]
```

However, if I try to create such specification myself:

```
>> foo: func [a [function! [a [word!]]]][]
*** Script Error: invalid type specifier: [a [word!]]
*** Where: func
*** Stack: foo
```

Bug / feature / not implemented?

dsunanda

[14:47](#msg5beed89bde42d46bba741372)@toomasv Thanks -- I'll add unexpected minimization it as a github issue

toomasv

[14:48](#msg5beed8db4720c11e0e773292):+1:

greggirwin

[17:16](#msg5beefb85de42d46bba750821)@dsunanda I can't dupe under Win10. Commented on the ticket. What OS are you on?

[17:22](#msg5beefcda6183a977eec8e809)@9214 it's an expected limitation at this time. There's no plan to add that feature, but it's something that could be part of a dependent types experiment.

dsunanda

[18:18](#msg5bef09ef80e46b4266c06f0c)@greggirwin Thanks for trying. Strange. Fully patched Win10. Toomas (above) has seen the same issue - don't know what version he's on.

hiiamboris

[18:18](#msg5bef09f2a47c6c5d3bf736d1)@dsunanda nope, nothing on W7x64, aero off

greggirwin

[18:27](#msg5bef0c0080652945c371a7c9)@dsunanda do you have any display settings, e.g. scaling, or anything else special in your setup?

dsunanda

[18:27](#msg5bef0c2c9f5a9e6e41f66dc7) @greggirwin Nothing I can think of - very standard set up, with no other obvious display quirks.

greggirwin

[18:29](#msg5bef0c90a47c6c5d3bf7499b)Let's hope @qtxie can dupe then.

dsunanda

[18:47](#msg5bef10ce4720c11e0e78b7e2)Having just spent way too long jiggling random windows around -- it's looking like a quirk of my set up, not one specific to having a Red window running. (Odd, because I explicitly don't have mouse gestures activated). So sorry - very probably a false alarm re Red issues.

toomasv

[19:51](#msg5bef1fb4f9993b42671decab)Yes, not Red's problem. Moving around other apps would do same.

qtxie

[23:54](#msg5bef58b16183a977eecb3d81)&gt; Any one else seeing this under Windows? (happens on 0.6.3 stable release, and latest nightly):  
Create a simple VID window, eg: view \[box 200x200 red].  
Now grab the title bar and move it around rapidly - the console window will soon minimize.

It's a feature of Windows.

## Saturday 17th November, 2018

dander

[06:03](#msg5befaf1b534b2745c48a6998)it's called \[Aero shake](https://www.howtogeek.com/howto/windows-7/disable-aero-shake-in-windows-7/), and can be disabled in the registry. I find it to be pretty annoying.

endo64

[12:45](#msg5bf00d5c1ad4155d3adb8fa4)Yes it is a feature of Windows sincw Win7 no need an issue. @dsunanda @greggirwin

greggirwin

[18:47](#msg5bf062311ad4155d3add8ff6)I closed the ticket.

[18:48](#msg5bf062621ad4155d3add904c)And thanks for the research @dander .

## Monday 19th November, 2018

rebolek

[08:05](#msg5bf26ed59f5a9e6e410a788a)There seems to be problem with `help` in latest Red, it always returns

```
Func spec couldn't be parsed, may be malformed.
```

endo64

[12:49](#msg5bf2b1472735965dfefd11ec)Don't we have tests for `help` function? @greggirwin 's latest commits, making some global words local, may cause this regression, need to check them.

meijeru

[15:47](#msg5bf2db024bad337eb90462b9)See #3593

greggirwin

[19:27](#msg5bf30eb91ad4155d3aedcf5b)@endo64 I thought so too, which is how the regression got it. The comment in the help test file says:

```
; help-string tests pass with quick-test, but full automated tests fail
; when trying to include %help.red. May require -r or -u compilation.
; #include with a relative path for it fails, but `help-string` also 
; doesn't exist if an absolute path is used for the #include.
```

[19:29](#msg5bf30f0580652945c389ad5c)And my local test must have been against a different build, because I did test `help` before committing. My fault.

[20:33](#msg5bf31e306183a977eee22619)Seems the compiler has an issue, when trying to capture a func the way I did. Interpreted is fine. In `help`, the inner `stack` value used by `parse-func-spec` is fine if we don't capture `parse-func-spec` in `help-ctx`. If we do, though, `stack` (from the inner `func-spec-ctx`) is then bound to `help-ctx` it seems, but there's no stack word there. It evals to 12, which is one of the config options. Here's a small test you can run, though the capture version just doesn't show anything when compiled, so I'm not sure what's going on.

```
Red []

print "Capture test"
outer: object [
    o-slot-1: 1
    o-slot-2: 2
    o-slot-3: 3
    o-slot-4: 4
    o-slot-5: 5
    o-slot-6: 6
    exported-func: none
    inner: object [
        stack: copy []
        set 'exported-func func [][
        	print "In Func"
            ; Calling this func now makes 'stack appear bound to
            ; the outer context, and accessing it returns a value
            ; from that context, but not in this little test. :^(
            print mold stack
            print mold context? 'stack
            true
        ]
    ]
]
outer2: object [
    inner: object [
        stack: copy []
        set 'exported-func func [][
        	print "In globally exported Func"
            print mold stack
            print mold context? 'stack
            true
        ]
    ]
]
outer/exported-func
exported-func
```

[20:34](#msg5bf31e5480652945c38a1319)If someone (maybe @9214) wants to dig in more, that would be great. I don't have time to pursue it right now.

endo64

[20:52](#msg5bf322a880e46b4266d96102)@greggirwin I changed your script to this:

```
Red []

print "Capture test"
outer: object [
    o-slot-1: 1
    o-slot-2: 2
    o-slot-3: 3
    o-slot-4: 4
    o-slot-5: 5
    o-slot-6: 6
    exported-func: does [
		print "Original"
    ]
    inner: object [
        stack: copy []
        set 'exported-func func [][
            print "In Func"
            ; Calling this func now makes 'stack appear bound to
            ; the outer context, and accessing it returns a value
            ; from that context, but not in this little test. :^(
            print mold stack
            print mold context? 'stack
            true
        ]
    ]
]
outer2: object [
    inner: object [
        stack: copy []
        set 'exported-func func [][
            print "In globally exported Func"
            print mold stack
            print mold context? 'stack
            true
        ]
    ]
]
outer/exported-func
exported-func
probe get 'outer/exported-func
outer/exported-func
```

and the output is

```
Capture test
Original
In globally exported Func
[]
make object! [
    stack: []
]
func [][
    print "In Func"
    print mold stack
    print mold context? 'stack
    true
]
Original
```

So `outer/exported-func` doesn't change by `set 'exported-func` but it looks like it changed when I `probe` it.

greggirwin

[20:58](#msg5bf323f3a47c6c5d3b1060c7)Thanks @endo64. Would you open a ticket for this?

endo64

[21:01](#msg5bf324aab86c70503f5872df)Sure.

[21:30](#msg5bf32b8c1ad4155d3aee8bd4)@greggirwin See #3597, please update its title as I could find a good explanation.

[21:34](#msg5bf32c709f5a9e6e410f922a)https://github.com/red/red/issues/1748 and https://github.com/red/red/issues/1977 explains the issue, it might be closed then.

dander

[22:58](#msg5bf3400180652945c38af73e)I don't know if it would be considered a bug, but I noticed that for functions which specify a return type, `reflect ... 'spec` displays `return:` in the returned spec, which is invalid when defining a function, because the colon is not allowed. It is somewhat helpful that it's differentiated from the other arguments, but on the other hand, it's nice to have `source` produce code which is valid without any modifications.

## Tuesday 20th November, 2018

greggirwin

[02:23](#msg5bf3702980e46b4266db3f88)@dander can you give a specific example? I just wrote a ticket about the interpreter having an issue with `return:` and doc strings, but seems unrelated to what you're saying. I just used `source` on a func with a `return:`, and `do`ing it worked fine.

dander

[04:30](#msg5bf38deb80e46b4266dbe998)@greggirwin my mistake. Maybe I corrupted something in my environment before, but now I can't reproduce it at all 🤔

[06:19](#msg5bf3a75cf9993b4267398b75)@greggirwin okay, I don't really understand what is happening, but this reproduces what I was seeing before

```
spec: reflect :on-parse-event 'spec
body: reflect :on-parse-event 'body
func spec body
```

rebolek

[06:48](#msg5bf3ae2f80652945c38d9798)@dander @greggirwin

```
>> func [x return: [integer!]][x + 1]
== func [x return: [integer!]][x + 1]
>> func [x return: [integer!] "this is problem"][x + 1]
*** Script Error: invalid function definition: return:
*** Where: func
*** Stack:
```

[07:13](#msg5bf3b40a6183a977eee5d410)@greggirwin is there complementary function to `parse-func-spec` that will turn the object into spec dialect?

dander

[07:45](#msg5bf3bb8cf9993b42673a00eb)thanks for clarifying that, @rebolek !

Tovim

[19:54](#msg5bf46688a3d89f7406dbd8f9)Strange behaviour: both `help vid` and `help div` return the same info: `divide action! Returns the quotient of two values`.  
Tried to get an info about VID.

meijeru

[20:29](#msg5bf46ec5ced7003fe15c0d52)This is because HELP works only on defined words, i.e. words that occur in `system/words`, and there is no such word as `VID` defined.

[20:31](#msg5bf46f08b6c07010525ed651)When HELP does not find the word, it searches for other words that contain the same letters.

greggirwin

[20:31](#msg5bf46f22c6cf4524d14e4406)@dander @rebolek that is the ticket I just opened, so we're all on track.

@rebolek, no, there no counterpart to it currently. Could be useful for code generators, but I haven't had a need for it yet.

@Tovim, @meijeru beat me to it. :^)

rebolek

[20:34](#msg5bf46fb96621313894f06919)@greggirwin I do, I am using similar function in Values (with different format, but that can be adopted), so I may take a look at doing it. Then I can use `parse-func-spec` instead of my own function and save some bytes.

greggirwin

[20:39](#msg5bf471046621313894f07271)Sounds good. `Parse-func-spec` lives in the `help` code right now, as that's where it was needed, but it could move to more general meta programming or reflection libs if we add those.

rebolek

[20:42](#msg5bf471aef59704348ed928f4)It's not a high priority for me, but I would like to use some standard instead of my own design, it makes code simpler.

greggirwin

[21:28](#msg5bf47c61f59704348ed979a9)Agreed. Please report any issues you find.

## Thursday 22nd November, 2018

dsunanda

[01:06](#msg5bf60109f048fa105101e269)Anyone else seeing this? Strings assigned to VID TEXT styles result in considerable bloating of SYSTEM/WORDS, eg:

```
layout [t: h1]  
t/text: "aaa bbb ccc. ddd, eee"
back back back back tail words-of system/words
== [aaa bbb ccc. ddd]
```

greggirwin

[01:12](#msg5bf60284e25cc2740522cbf1)Indeed. Likely a `load` in there for `/data`.

```
>> t/text: "100"
== "100"
>> t/data
== 100
```

[01:13](#msg5bf602d1f59704348ee37471)Is there a ticket for that? Chances are it's known and expected that modules will alleviate the issue.

dsunanda

[01:32](#msg5bf60722c6cf4524d1589d99)Thanks Gregg. Can't see an obvious ticket - though it may be there under another set of keywords.

There seems no obvious point in automatically initiating /data for a text style. (It doesn't get populated for other styles - say. LAYOUT [F: BOX} F/text: "AAA BBB"). And the populating is somewhat defective (EEE gets missed in the original example - presumable because DDD, EEE triggers an error).

greggirwin

[04:46](#msg5bf634abf048fa105102ff2f)It's tied to the reactive system, and the behavior is an unintended side effect of `load` in this case.

dsunanda

[10:20](#msg5bf682f1baf43f2b9b568b3b)Thanks again. Not sure it's a welcome side-effect. I'll add an issue so the devs can at least look at it and decide whether it's a bug or a feature.  
Pity Red does not have R2's ability to create words without adding them to SYSTEM/WORDS, eg to-block "aaa bbb cccc" - in R2 creates a block with 3 words, but does not update SYSTEM/WORDS. That might allow the reactive stuff without the side-effect of bloating SYSTEM/WORDS.

endo64

[14:58](#msg5bf6c42587c4b86bccfd7fb7)@dsunanda better file a ticket to not forget this. If we put a huge text into a `text` face we fill the system/words.

greggirwin

[17:16](#msg5bf6e46a6621313894001d78)I don't know if it's by design or not. In this example, `data` is not set for the face, because the entire text can't be loaded. But if it could, `data` would then refer to the block of words.

```
>> t/text: "aaa bbb ccc ddd eee"
== "aaa bbb ccc ddd eee"
>> t/data/1
== aaa
```

dsunanda

[18:30](#msg5bf6f5b4baf43f2b9b598dbb)Thanks guys - it's now issue #3606  
If Rebol and Red were more highly secure by design, there'd be information leak issues here too - simply moving a string to a VID text style leaves a trace in SYSTEM/WORDS

greggirwin

[19:40](#msg5bf70648a115c91ef777edc6)Given Red's flexibility, and Red/System's total control capability, that kind of leak is way down on the list of bad things that could happen. :^) I am really excited by the security side, and how people will build dialects for that. Also, this note may be of interest to @ddsec, whose team audited the Wallet code.

## Friday 23th November, 2018

x8x

[10:43](#msg5bf7d9cfb5154c550051ded4)Not sure if it's a feature or a bug to include the `%`:

```
json/encode %path
;   {"%path"}
```

Me think one should mold if he wants to keep the `%` from a `path!` value

rebolek

[11:29](#msg5bf7e495a115c91ef77d4210)@x8x `encode-into` molds every non-JSON value. This way you can encode Red values to make sure that `json/decode json/encode whatever` would always work. Maybe it's one of those little things that should be user-configurable.

x8x

[12:01](#msg5bf7ec1e375c40294bacad91)Just thinking laud, what about having `json/save` and `json/load`? I get the benefit of molding, but not sure is a good default at least in above case, `%` has meaning only inside Red, in a JSON value that could be consumed by any other tool, that would have no meaning. Is it more logic to need to `form %file` to pass a file path to a javascript code thru JSON?

rebolek

[12:07](#msg5bf7ed81cfa682348d6fd3c0)No, it's just a question of changing `mold` to `form` on one line. Or preferably adding one `either` so user can switch between both modes. There are some other switches in JSON module already (for none value and for automatic loading of numbers/unix time stamps , IIRC), so it's one minute change. I just need some good name for that switch. `mold?` or `form?` seems to vague to me and `preserve-red-values?` is too long OTOH :)

[12:08](#msg5bf7edcb6621313894067ccb)Of course I am talking about JSON version in my repo, I can't talk for Fullstack if they decide to adopt this change or not.

x8x

[12:11](#msg5bf7ee6cd4848f45c5fba1b0)The other way around, any other language/tool would pass a file path as a string in JSON format, on the Red side I would have to `to file! JSON-string-field` and for JSON coming from Red I would have to `load JSON-string-field`.

rebolek

[12:13](#msg5bf7ef0287c4b86bcc049418)I understand. I'm not against changing it, I just need good name for the switch and also we need to decide if it should be turned on or off by default.

x8x

[12:14](#msg5bf7ef39a78657253c46aff3)Why switches instead of refinements? Maybe having both?

rebolek

[12:15](#msg5bf7ef7cf59704348eef5c48)Both. You can build `to-json` and `load-json` with refinements on top of `json` object!.

x8x

[12:17](#msg5bf7efc0375c40294bacad93)Ok, thank you!

greggirwin

[19:18](#msg5bf8528bfa7bbb3fe0f27db5)We will have an official JSON code, for `load/as` and `save/as`, I hope in 0.6.5. It's close but depends on the map! behavior for `none` to change. Much chat has been made over that. In any case, we have to balance interop with round-tripping, and not automatically do things that are hard to undo. Writing a simple preprocessor, to `form` `any-string!` values shouldn't be hard.

rebolek

[21:10](#msg5bf86cdbc6cf4524d167b242)What chat and where? I am really interested in it, I know that I am just an outsider, but I've implemented few JSON based APIs for Red (like Github, Gitter and so on) and would be really interested in such conversation, even if I don't have much to add to it.

greggirwin

[21:41](#msg5bf8740bcfa682348d7354ba)You're not an outsider. It was just to facilitate work and design, which @giesse did, based on a number of Redbol JSON libs. We'll probably make it public soon, as it's part of the C3 work underdevelopment now.

## Saturday 24th November, 2018

Oldes

[21:14](#msg5bf9bf21cfa682348d7b38f2)@dockimbel :point\_up: \[regarding our previous `select/part` discussion](https://gitter.im/red/bugs?at=5bd0d5cb82893a2f3b345e80) I believe, that `find/part` is also wrong. Example:

```
>> find/part s: "abcd" "ab" e: next s
== "abcd" ;<-- wrong
>> index? e
== 2 ;<-- Red is looking for "ab" in 2 bytes, but should be looking only in 1
```

In Rebol2 it was correct, because it counts with one-based series' index:

```
>> find/part s: "abcd" "ab" next s
== none
```

And Rebol3 is also wrong, as it limits the start of the find, but not the tail:

```
>> find/part s: "abcd" "ab" next s
== "abcd" ;<-- wrong
>> find/part "abcd" "bc" 2
== "bcd" ;<-- wrong, because there is no "bc" in "ab"
```

## Sunday 25th November, 2018

toomasv

[09:01](#msg5bfa64d8fa7bbb3fe0fed4d3)@Oldes I see this:

```
>> find/part s: "abcd" "ab" next s
== none
>> about
Red 0.6.4 for Windows built 24-Nov-2018/3:38:06+02:00 commit #3b0a577
```

Oldes

[19:27](#msg5bfaf7bcced7003fe184e718)Ah... than it is good for Red :-) And I should rebuild my Red console before posting something next time :-(

## Monday 26th November, 2018

hiiamboris

[20:11](#msg5bfc5354f048fa1051293271)When I write `probe read %//` it shows me the contents of the C: drive. Should it?

dander

[20:37](#msg5bfc598fb6c070105290f977)@hiiamboris it seems to be interpreting that as launching `\`, and that is how explorer or the run dialog would behave. I guess it chops off the first slash, because usually you have a drive letter after that. Looks like it won't work with more than two slashes though. I think it seems like it's up to the OS behavior in this case.

```
>> to-local-file %//
== "\"
```

hiiamboris

[20:39](#msg5bfc59f27074b903685d47fa)Ah! Good thinking @dander :)

dsunanda

[21:19](#msg5bfc637b66213138942248d5)It's what R2 does as well. Try experimenting with:

```
print clean-path %/
probe read clean-path %/
```

And append an extra / each time. What happens makes sense - at least for Windows.

ne1uno

[21:29](#msg5bfc65d0958fc53895f42755)isn't `//` a net share? seems like it should be bad path

dsunanda

[21:39](#msg5bfc682397a8982b9a6c3611)I think it's a case of Rebol's opsys-independent notation clashing with some opsys specifics - and (at least so far) Red has adopted the same convention.

The official Rebol statement on the issue says: \[If the first directory name is absent, and the path begins with double forward slashes , then the file path is relative to the current volume](http://www.rebol.com/docs/core23/rebolcore-12.html#section-2.2)

hiiamboris

[21:42](#msg5bfc68b77074b903685da8f3)

```
>> print clean-path %///
/C/Users/
```

Interesting feature. I wonder what are the applications of it.

dsunanda

[21:46](#msg5bfc699ae25cc274054a749f)Remember it is relative to your current directory, so if you were in (say) d:\\data\\apps\\rebol\\ you'd see /D/data/ in that case.  
Read %/ -- is a good way to get a list of all current drives.

endo64

[21:51](#msg5bfc6ad0b6c0701052917336)\[!\[autocomplete.gif](https://files.gitter.im/red/bugs/XDWn/thumb/autocomplete.gif)](https://files.gitter.im/red/bugs/XDWn/autocomplete.gif)

9214

[21:52](#msg5bfc6b0c7074b903685dba77)@endo64 can't reproduce.

endo64

[21:53](#msg5bfc6b3cced7003fe18e3a27)@9214 on 0.6.3 autocomplete was working even if there are other texts after the word

[21:53](#msg5bfc6b65d24f9324d25a6655)Actually, it was working a few weeks (or 1 or 2 months ago) but not anymore. It was very useful.

hiiamboris

[21:53](#msg5bfc6b6bbaf43f2b9b7b4f92)@endo64 I have that bug too on W7

9214

[21:54](#msg5bfc6b7eb6c0701052917870)22 Nov build, everything works fine, W10.

endo64

[21:54](#msg5bfc6b9787c4b86bcc20a22b)@qtxie Can you look at this please?

[21:55](#msg5bfc6bebe25cc274054a81c3)Both CLI and GUI console.

[21:56](#msg5bfc6c11cfa682348d8c1a69)Let me check with 22 Nov build

[22:04](#msg5bfc6e03fa7bbb3fe00bc2d4)One of these two commits breaks it (both on 2018-11-17)

SHA-1: 780e7d0d9fd5a59d6ce81b002318f566b2eec9ad  
\* FIX: some local variables are leaking in global space.

SHA-1: 2d6c75ff99d0432aed12b6bc99c1bba2a5cdcca1  
\* FEAT: put auto-completion functions into a context.

9214

[22:12](#msg5bfc6fc8f048fa105129f560)Rather:  
\* https://github.com/red/red/commit/2d6c75ff99d0432aed12b6bc99c1bba2a5cdcca1  
\* https://github.com/red/red/commit/277a4399bb8bdb4e4f5105a3d43a72730b3dfe2b

## Wednesday 28th November, 2018

rebolek

[06:25](#msg5bfe34e9ed6bcf1ef870ff3f)@greggirwin

&gt; You're not an outsider.

Of course I am. I'm not part of any JSON conversation, I know nothing about solution to JSON's `null`, nothing about latest `map!` changes, so all my comments about JSON are just comments from a person that relies on public information only.

hiiamboris

[12:21](#msg5bfe883f6621313894300b2b)I have GUI console saving history when I close it by Alt+F4 but never when I close it by typing `q` or `quit`. Is this supposed to be this way?

Oldes

[12:52](#msg5bfe8fa9e25cc27405580d20)@hiiamboris `quit` is just a simple function which you may redefine for your needs:

```
>> source quit
quit: func ["Stops evaluation and exits the program" 
    /return status [integer!] "Return an exit status"
][
    quit-return any [status 0]
]
```

hiiamboris

[12:58](#msg5bfe9109ed6bcf1ef8734850)@Oldes sure, but what about the history?

Oldes

[13:29](#msg5bfe9822f59704348e197077)I don't know... I even didn't know, that console saves history.. but I think the console code can modify the quit to save it like with Alt+F4.

endo64

[13:32](#msg5bfe98d2958fc53895021868)yes there is that issue, if you close the window is saves the configuration and the history, if you quit it does not.

hiiamboris

[13:53](#msg5bfe9dcdf849b222e0b932a5)Didn't see this one reported, so I opened https://github.com/red/REP/issues/33

endo64

[15:02](#msg5bfeade8f048fa10513861bb)@hiiamboris This could go to the main repo instead of REP.

hiiamboris

[15:38](#msg5bfeb65e8dffd748dbf7d4e3)Maybe.

greggirwin

[17:15](#msg5bfecd2bd24f9324d269b288)@rebolek, I mean you're not an "outsider" in any negative way. We just can't make all conversations public, or even open to a significant number of people. Without a stake in the ground, that process creates too much churn in most cases.

rebolek

[18:05](#msg5bfed8e8f048fa105139ab3f)@greggirwin I didn't took it in negative way, I'm just just stating that I am an outsider who doesn't know what is going with JSON in Red, that's all.

[18:06](#msg5bfed938a115c91ef7a947f3)I understand that if everyone who wrote their own JSON parser and encoder in Red would be involved, it would create too much noise.

gltewalt

[20:27](#msg5bfefa2fed6bcf1ef8762950)Shouldn't Alpha be 255? spec indicates that the default should be fully opaque.

```
>> i: make image! 1x1
== make image! [1x1 #{FFFFFF}]

>> i/rgb
== #{FFFFFF}

>> i/alpha
== #{00}

>> i/argb
== #{FFFFFFFF}
```

[20:31](#msg5bfefb2e958fc5389504c851)Nevermind. #2812

toomasv

[21:05](#msg5bff02fe7074b903686e7d59)@gltewalt Opaque in Red is 0. 255 is fully transparent.

gltewalt

[21:15](#msg5bff0581ed6bcf1ef876767f)Zero is fully transparent in argb

toomasv

[21:22](#msg5bff0704958fc53895051352)But in Red it is the way around:

```
view [
    b: box 255.0.0.0 
    slider 20x80 [
        b/color/4: to-integer 255 * face/data 
        t/offset/y: to-integer 73 - (60.0 / 255 * b/color/4)  
        t/text: to-string b/color/4] 
    at 120x73 t: text "0" 30x25
]
```

## Thursday 29th November, 2018

meijeru

[09:45](#msg5bffb5438dffd748dbfe127e)There is recent discussion on this in issue #2812

9214

[15:42](#msg5c0008f4cfa682348da38997)

```
text
view [
    panel
        with [menu: ["a"]] ; note the missing menu element ID
        on-menu [probe event/picked]
]
```

Once I click on `a` from contextual menu, I get

```
*** Runtime Error 1: access violation
*** at: 0042F984h
```

Can anyone else confirm that? W10.

bitbegin

[15:44](#msg5c000942ed6bcf1ef87ccd7e)\[!\[图片.png](https://files.gitter.im/red/bugs/v1ks/thumb/\_\_.png)](https://files.gitter.im/red/bugs/v1ks/\_\_.png)

[15:44](#msg5c000945f048fa1051414fda)work right for me

9214

[15:45](#msg5c000980ed6bcf1ef87ccf2d)@bitbegin have you tried to right-click on an empty panel to bring up contextual menu, and then to click on `a` entry?

bitbegin

[15:46](#msg5c0009bbed6bcf1ef87cd075)click on `a` will print select-all  
select-all

9214

[15:48](#msg5c000a4dcb32736b29b178b0)Hmm...

hiiamboris

[15:51](#msg5c000b04ced7003fe1a52a3a)Prints `about-msg` for me (W7)

9214

[15:52](#msg5c000b357d26db1e831594f1)Looks like out of boundaries read.

[15:54](#msg5c000bbde25cc274056185a7)What about this?

```
view/options [
    on-menu [probe event/picked]
][
    menu: ["a"]
]
```

I still experience the crash.

[16:08](#msg5c000eeef59704348e22eaff)https://github.com/red/red/issues/3619

ne1uno

[16:23](#msg5c001271b6c0701052a8c77f)win7 I get `select-all` for both.

9214

[16:26](#msg5c00132fa115c91ef7b0ed5d)I get `about-msg` from GUI console, but CLI crashes. Both are unexpected.

[16:28](#msg5c0013a0d24f9324d271dc0a)Interestingly, from GUI console, if I add ID `word!`, check the snippet, and then remove it, it will still print the old ID despite it being removed.

toomasv

[16:33](#msg5c0014cc7d26db1e8315d2ba)@9214 On GUI console both versions return `about-msg` on W10. (And `word!` is still printed after removing)

9214

[16:35](#msg5c001568cfa682348da3e28f)It seems that `even/picked` carries some arbitrarily selected value from memory. In my case, on the first try it printed `b`. No idea where it came from.

hiiamboris

[17:24](#msg5c0020c1f59704348e236ac3)@9214  
&gt; What about this?

Again, no crash. `about-msg`. GUI console

[17:26](#msg5c002158f59704348e236dd6)Confirmed crash on CLI console:

```
*** Runtime Error 1: access violation
*** at: 0042F984h
```

## Friday 30th November, 2018

endo64

[12:25](#msg5c012c396c3c565096b049f7)@9214 No crash on my W10 for both CLI &amp; GUI, `Red 0.6.4 for Windows built 24-Nov-2018/4:38:06+03:00 commit #3b0a577`

hiiamboris

[21:50](#msg5c01b0a299ad1556dbe8091d)So we have these 3 functions now, very useful:

```
>> offset-to-caret system/view/screens/1 1x1

*** Runtime Error 1: access violation
*** at: 004BF041h

>> caret-to-offset system/view/screens/1 1

*** Runtime Error 1: access violation
*** at: 004BF041h

>> offset-to-char system/view/screens/1 1x1

*** Runtime Error 1: access violation
*** at: 004BF041h
```

## Saturday 1st December, 2018

gltewalt

[02:39](#msg5c01f469be66d825265a1f55)Fix it

[02:40](#msg5c01f4918fa4333e391e0445)I believe you’re feeding it `none` so that should narrow it down.

toomasv

[05:13](#msg5c02185e464b6c0fd672099d)

```
view [ar: area "Something" below 
    button "caret-to-offset" [probe caret-to-offset ar 3] 
    button "offset-to-caret" [probe offset-to-caret ar 40x10] 
    button "offset-to-char" [probe offset-to-char ar 40x10] 
    button "selected" [ar/selected: as-pair offset-to-caret ar 40x10 offset-to-char ar 40x10 set-focus ar]]
```

hiiamboris

[08:18](#msg5c0243bd3f50311036099aa7)@toomasv and if you remove "Something"?

[08:20](#msg5c0244421c439034affe4666)@gltewalt thanks, I'll try

toomasv

[08:35](#msg5c0247d343c68b3727e0d047)You mean if I try to ask for caret or offset from `none`?

hiiamboris

[08:39](#msg5c0248d948d021555ad35ad4)Empty string works, unspecified string crashes :)

9214

[14:19](#msg5c029881e82749252580ae0b)@hiiamboris it's good to see you ramping up on issue triaging, keep pumping :+1:

hiiamboris

[14:38](#msg5c029ce2e82749252580caa7)@9214 thanks ☺ Glad to be of help

Oldes

[20:55](#msg5c02f547be66d82526601877)@dockimbel In Rebol2&amp;3 input from `ask` function is automatically \_trimed\_:

```
>> ask "name: "
name:     foo
== "foo"
```

while not in Red:

```
>> ask "name: "
name:     foo    
== "    foo    "
```

Is it by design?

hiiamboris

[22:34](#msg5c030c641c439034af0307d2)@rebolek what's the history behind https://github.com/red/red/pull/2191 ? There are some regressions crying for a fix...

## Sunday 2nd December, 2018

rebolek

[06:32](#msg5c037c776c3c565096be3d48)@hiiamboris what can I say? I went thru all ~2100 bugs and if it was possible to write test for that bug, I did it.

hiiamboris

[09:44](#msg5c03a99a48d021555adb7ab5)@rebolek but why wasn't it merged in 2 years?

rebolek

[10:27](#msg5c03b380c4af6856da744c01)I don't know, probably because not all tests passed, as there were some unfixed regressions. I would be good to expand it with tests for ~1300 new issues.

[10:30](#msg5c03b44fa6c29a1037cf16b5)@hiiamboris You should ask @dockimbel , not me.

hiiamboris

[10:36](#msg5c03b5b1bc1a693e3a4315b7)@rebolek I see. Well, better late than never, right? (: As you apparently have had no time to do so, you wouldn't mind if I refactor that branch for the current test suite, push a new PR, raise the issues for regressions caught, maybe fix some? I think there's a lot of value in that PR and it should be included in the master repo.

rebolek

[10:38](#msg5c03b6276c3c565096bf84f8)@hiiamboris feel free to update it as you want, if you have the time. You're unfortunately right that I don't. Also it may get merged if it won't be from me, who knows.

hiiamboris

[10:50](#msg5c03b8f56c3c565096bf9855):+1:

## Monday 3th December, 2018

PeterWAWood

[13:46](#msg5c0533a8be66d825266d83b5)This somewhat excessive code:

```
Red[]
s: ""
loop 2147483647 [
	append s #"a"
]
```

compiles but crashes the Red runtime when executed:

```
Compiling to native code...
...compilation time : 1241 ms
...linking time     : 51 ms
...output file size : 77824 bytes
...output file      :./test 

./test
*** Internal Error: not enough memory
*** Where: append
*** Stack:
```

Is this behaviour reasonable or should the runtime trap the out of memory condition?

hiiamboris

[14:00](#msg5c053708e82749252590ac46)@PeterWAWood see https://github.com/red/red/issues/3261#issuecomment-373342437  
I think Nenad was working on some handler for that but didn't finish it, so it's expected for now. Last time I checked even the `read` of an 1GB file crashed it.

greggirwin

[20:13](#msg5c058e87e827492525931ab0)Just saw `checksum` die with `'adler32` if the input \*ends in* any of `^A ^B ^C ^D ^E ^G`. Just spot checks, so there may be others. Can someone confirm and write up a ticket?

hiiamboris

[20:41](#msg5c0594ffa6c29a1037db2f1b)

```
>> checksum "^A" 'adler32
== 131074
>> checksum "qwerty^A" 'adler32
== 541197258
>> checksum "qwerty^B" 'adler32
== 847643866
```

greggirwin

[20:44](#msg5c0595a699ad1556dbffb4d4)Interesting. I'll pull and build fresh. Thanks.

dsunanda

[20:46](#msg5c0596243f503110361e2ebd)I'm seeing 0.6.4 Win10 crash on some values - simplest is

```
checksum "X^A" 'adler32
```

hiiamboris

[20:47](#msg5c059663e8274925259351cb)Interesting indeed!

dsunanda

[20:48](#msg5c059684e82749252593526d)No obvious pattern

hiiamboris

[20:48](#msg5c05968cc4af6856da8025da)It crashes when I start a new console. But I have one running for a few days already - and that one doesn't crash when I paste it there. Same commit, Nov 29.

meijeru

[20:52](#msg5c05977e9f38cc0fd59d4dad)I see `checksum "X^A" 'adler32` crashing also -- W10.

greggirwin

[20:53](#msg5c0597d7e827492525935a28)The adler code is entirely R/S, not calling OS libs. Would someone please write up a ticket for it?

hiiamboris

[20:54](#msg5c0598158fa4333e39344df6)sure

greggirwin

[20:54](#msg5c059822bc1a693e3a4f1ba6)Thanks.

hiiamboris

[21:01](#msg5c0599959f38cc0fd59d5964)https://github.com/red/red/issues/3631

[21:06](#msg5c059aef9aec405095c0a277)I think @PeterWAWood forgot to comment out the failing test https://github.com/red/red/blob/master/tests/source/units/replace-test.red#L91 (mentioned in https://github.com/red/red/issues/3624) so we have all builds failing right now. Someone with the access should fix that.

greggirwin

[21:33](#msg5c05a12dbe66d825267076c9)One of our upcoming goals is to not just comment out failing tests.

[21:34](#msg5c05a17fa6c29a1037db85d5)I'll let Peter speak to this case though.

PeterWAWood

[22:36](#msg5c05afdb99ad1556db00627d)@hiiamboris I didn't comment out the failing test as a first step towards not simply commenting out failing tests. I should have let you know, sorry.

[23:09](#msg5c05b79043c68b3727f605ca)I believe that for Red to be widely adopted, especially by commercial developers, one of the things we need to achieve high levels of reliability and robustness, much higher than Rebol did.

I feel the practice of commenting out failing tests is no longer appropriate and fear that it will become so deeply engrained in the project psyche that it will be almost impossible to change.

hiiamboris

[23:22](#msg5c05bac5e827492525943879)Then you're planning to fix it soon? OK

PeterWAWood

[23:43](#msg5c05bfa0be66d82526713bd7)No. I didn't write the code, I didn't write the tests.

[23:47](#msg5c05c08999ad1556db00c978)Whilst I understand the quality of the code can be considered a collective responsibility, we need contributors to take ownership for the quality of their submissions.

[23:50](#msg5c05c1379aec405095c1978e)Is everybody who reports an issue responsible to supply a fix?

[23:52](#msg5c05c1cf48d021555ae8af0d)I feel that another barrier to improving the quality (robustness and reliability) of Red is the practice of accepting code without tests.

## Tuesday 4th December, 2018

greggirwin

[01:09](#msg5c05d3b6a6c29a1037dcc6ea)&gt; Is everybody who reports an issue responsible to supply a fix?

Not sure how we can enforce that. It means only skilled devs can report issues.

&gt; I feel that another barrier to improving the quality (robustness and reliability) of Red is the practice of accepting code without tests.

We're getting better about that. If there are FOSS projects that handle this particularly well, what can we learn from them? Beyond that, we would love to sponsor QA work.

PeterWAWood

[01:09](#msg5c05d3dbe82749252594cc24)On reflection, I will comment out the failing test as it was obviously premature to do so.

rebolek

[07:36](#msg5c062e8e48d021555aeb13e5)&gt; Is everybody who reports an issue responsible to supply a fix?

Enforcing that some like a really bad idea to me.

Requiring that PRs will come with tests OTOH is good idea.

[11:42](#msg5c06680e464b6c0fd68c130c)What is this error? I've never seen it:

```
*** stack smashing detected ***: <unknown> terminated
```

9214

[12:37](#msg5c067502e82749252598aff7)@rebolek :bear: :beer: :question:

rebolek

[12:42](#msg5c06762443c68b3727fa85fd)@9214 Don't think so. I've triggered it only once on VPS. I probably won't be able to reproduce it.

Oldes

[21:28](#msg5c06f1869f38cc0fd5a5f0fe)Another compatibility question... `Rebol3`'s `forall` function resets series position on `break` and `throw` but not on `error`:

```
>> data: [1 2 3 4] forall data [if data/1 = 3 [break]] data
== [1 2 3 4]
>> data: [1 2 3 4] catch [forall data [if data/1 = 3 [throw true]]] data
== [1 2 3 4]
>> data: [1 2 3 4] try [forall data [if data/1 = 3 [do make error! "?"]]] data
== [3 4]
```

`Rebol2` and `Red` are consistent:

```
>> data: [1 2 3 4] forall data [if data/1 = 3 [break]] data
== [3 4]
>> data: [1 2 3 4] catch [forall data [if data/1 = 3 [throw 1]]] data
== [3 4]
>> data: [1 2 3 4] try [forall data [if data/1 = 3 [do make error! "?"]]] data
== [3 4]
```

Which version we should consider to be the correct? Is automatic position reset a feature?

9214

[21:29](#msg5c06f1c16c3c565096d45ff6)@Oldes Red's choice to not reset series position is an intended one.

Oldes

[21:30](#msg5c06f20ebe66d8252678f118)I'm also inclined to this variant.

[21:33](#msg5c06f299464b6c0fd68fd80f)On the other side, if I would need result as in Red, I could use this in `Rebol3`:

```
>> data: [1 2 3 4] forall data [if data/1 = 3 [break/return data]]
== [3 4]
```

[21:34](#msg5c06f2cb3f503110362727b8)I quite don't believe that this change in `Rebol3` was not intended.

[21:57](#msg5c06f8323f50311036274f62)Hm... but when I look at it... it is really just a stupid R3's bug.

[22:27](#msg5c06ff4a6c3c565096d4b250)Or maybe it was intended, as it looks in R3 the position is reseted not like in R2 &amp; Red:

```
>> data: [1 2 3 4] forall data [] data
== [1 2 3 4]
```

[22:27](#msg5c06ff659f38cc0fd5a653d4)Still probably prefer the old R2 version... any other opinion?

hiiamboris

[22:36](#msg5c070158bc1a693e3a584f4f)I would keep side effects to a minimum. That said I'd always reset the head, even with do make error.

Oldes

[22:36](#msg5c07018b99ad1556db08e2db)The thing is, that Rebol2 and Red never resets. Which is something what old \_Rebolers_ were used to.

hiiamboris

[22:45](#msg5c07037e43c68b3727fe6ab9)Well, Red is at least consistent in it's actions. I wouldn't want to bother myself with the consideration of all the options when it does or does not reset.

Oldes

[22:50](#msg5c0704c43f503110362798b9)Of course.

gltewalt

[23:28](#msg5c070d9f5e4095250316b11e)It does reset if you make it through the forall normally

Oldes

[23:32](#msg5c070e80f992693c7a21ce7d)Ah... really... I overlook that :/ Maybe I should be sleeping instead.

gltewalt

[23:37](#msg5c070fa5e4787d16e346e26a)At one point R2 must not have reset, because it indicates that it does not in the Rebol/Core Guide

[23:38](#msg5c070fdd5e4095250316bf0e)But my version of R2 does.

```
>>     chars: "abcdef"
== "abcdef"
>>     forall chars [print first chars]
a
b
c
d
e
f
>>     probe chars
"abcdef"
== "abcdef"
```

[23:39](#msg5c0710238336e22a7de0cda6)http://www.rebol.com/docs/words/wforall.html

## Wednesday 5th December, 2018

greggirwin

[00:57](#msg5c072269e4787d16e34754ea)`Forall` in R2 is a mezz, built on `forskip` (also a mezz), so you can see exactly how it works.

[01:00](#msg5c072340f4880a60a229dc6c)The Red R/S version requires a bit more thought to understand, but I believe it's modeled on the same behavior.

gltewalt

[22:30](#msg5c08519af4880a60a231cf52)

```
>> to integer! #{2A}
== 42

>> to float! #{2A}
== 0.0
```

greggirwin

[22:34](#msg5c085275f4880a60a231d711)

```
>> to binary! 1.234
== #{3FF3BE76C8B43958}
>> to float! to binary! 1.234
== 1.234
```

## Thursday 6th December, 2018

hiiamboris

[15:47](#msg5c0944a04808192b03f50efe)@9214 I tried to repro your image issue but it worked ok for me

9214

[15:48](#msg5c0944b15e4095250324ff4b)@hiiamboris can you check it in CLI console?

[15:48](#msg5c0944bd5e4095250324ff93)I'll update to nightly and give it another spin.

hiiamboris

[15:48](#msg5c0944d433d9e119918e3ea9)@9214 yes, both are ok

[15:49](#msg5c0944fcf4880a60a237db9c)if that matters, I was using it on `red\tests\source\units\button.gif` from the Red sources

9214

[15:49](#msg5c09451b8336e22a7def084e)@hiiamboris I checked with PNG file.

hiiamboris

[15:52](#msg5c0945c2e4787d16e3553791)works for me on small and big pngs

9214

[15:53](#msg5c0946178d4f3a2a7c7dcd19)Nope, still the case with the latest build.

hiiamboris

[15:54](#msg5c09462b33d9e119918e4949)with different pngs or just one particular?

9214

[15:54](#msg5c09463c1e86c30823373baf)Different images, different formats.

## Friday 7th December, 2018

greggirwin

[06:04](#msg5c0a0d51e4787d16e35a38bb)On Win10 here, it works fine, with a 1600x900 PNG that saves as an 8MB %.red file. This is from the GUI console.

[06:06](#msg5c0a0dc826de6f0822968200)I can then load and reduce the %.red file and the image is intact.

## Saturday 8th December, 2018

hiiamboris

[20:12](#msg5c0c25aaf4880a60a249e4b5)Can anyone on linux reproduce what I'm having on a VM? I've no idea how you catch bugs like this. Everything I change, even the loop count from 12 to anything else, and it starts working.

```
Red []

;recycle/off
probe rb4-bb: copy [1 2 3 4 5 6 7 8 9 10]
loop 12 [append rb4-bb rb4-bb]
probe length? rb4-b: copy rb4-bb
probe o: make object! [a: 1 b: 7 c: 13]
probe try [o/("c")]
```

Outputs:

```
[1 2 3 4 5 6 7 8 9 10]
40960
make object! [
    a: 1
    b: 7
    c: 13
]

*** Runtime Error 1: access violation
*** at: B7EE3C1Ch
```

[20:14](#msg5c0c262311bb5b250483f481)P.S. When compiled only

9214

[20:18](#msg5c0c2727f992693c7a428d2c)@hiiamboris can't reproduce with 20 Nov build.

```
[1 2 3 4 5 6 7 8 9 10]
40960
make object! [
    a: 1
    b: 7
    c: 13
]
make error! [
    code: 328
    type: 'script
    id: 'invalid-path
    arg1: o/("c")
    arg2: "c"
    arg3: none
    near: none
    where: 'body
    stack: -161881984
]
```

[20:19](#msg5c0c274b33d9e11991a03fb0)Should `recycle/off` be commented out though?

hiiamboris

[20:21](#msg5c0c27c44808192b03071f22)yes, when it's really off, it's okay

[20:21](#msg5c0c27db1e86c30823494159)I'm using Dec 7 build btw

9214

[20:22](#msg5c0c28123de4e816e22e8f7a)Will check with nightly shortly.

[20:47](#msg5c0c2ded26de6f0822a38d35)Nope, no crash with the latest build.

hiiamboris

[21:20](#msg5c0c35b426de6f0822a3bbd5)@9214 can you also please try this?

```
Red []

;recycle/off
repeat i 10 [
	append/dup b: copy [1 2 3] 1 i * 10000
	print mold/flat stats/info
	length? copy b
	print mold/flat stats/info
	recycle
	print mold/flat stats/info
	o: make object! []
	probe type? try [o/()]
	print "^/"
]
```

9214

[21:26](#msg5c0c371433d9e11991a09cec)@hiiamboris nope, no crash.

hiiamboris

[21:27](#msg5c0c3739f992693c7a42e823)You compiled it, right?

9214

[21:27](#msg5c0c37433de4e816e22eee43)Yes, in release mode.

hiiamboris

[21:28](#msg5c0c377b1e86c3082349a62e)Right! So it's ok in release mode for me too...

[21:30](#msg5c0c37e94808192b03078269)But `-c` or `-c -u` not okay. Now it's really weird...

9214

[21:31](#msg5c0c382d8d4f3a2a7c9015a6)I confirm the crash in development mode, with both of your examples.

hiiamboris

[21:31](#msg5c0c38443de4e816e22ef44e)Great! Thank you.

9214

[21:32](#msg5c0c385d5e4095250337867a)Np.

## Monday 10th December, 2018

dockimbel

[10:48](#msg5c0e44684808192b03138b9b)@hiiamboris Crash fixed.

hiiamboris

[12:58](#msg5c0e62f8178d7860a1b433b6)@dockimbel thanks! It's a great help. If you could also find the time to fix https://github.com/red/red/issues/2207 and https://github.com/red/red/issues/3637 that will be awesome. Problem currently is that if you change the order of some 2 tests in the suite, there's a huge chance one of these bugs will remind you of themselves and demand time to isolate them and circumvent. The only way to find out what code is triggering these bugs is to comment out the test parts until you find a particular sequence of lines. It's \*very* annoying.

## Tuesday 11st December, 2018

9214

[08:56](#msg5c0f7bd24808192b031b6cde)@hiiamboris kudos for https://github.com/red/red/issues/3502 !

dockimbel

[09:51](#msg5c0f88894808192b031bbbb2)Indeed, @hiiamboris well done! :+1:

hiiamboris

[12:18](#msg5c0faafa8b656e2b04f8c4fd)You're welcome ☺ Glad it was that simple. Still, the fix is based on the assumption that Windows flushes the pipe buffer in one go. I don't really know that, so.. just keep that in mind - if you ever see a truncated output from a call, then the assumption was wrong.

[16:11](#msg5c0fe1cff4880a60a261479e)Interesting. 2GB RAM is not enough on a Linux VM to compile `run-all-comp*` tests.

AlexanderBaggett

[22:31](#msg5c103ad33de4e816e24846c6)Hi guys, I believe I found a bug on windows 10. It may also be a bug on other windows OS's.

[22:32](#msg5c103ae98d4f3a2a7ca91ccd)This code

```
Red [Needs 'View]

sidePanel: [

    nodeTypes:  Text-list 100x250 data [
        "Generate"
    ] 
    on-change [
        t:  to string! nodeTypes/data/(nodeTypes/selected) 
        switch t [
            "Generate" [ p/pane: layout generate]
        ]
    ]
    return
    p: Panel 300x600  155.155.155 [

    ]
]

generate: [
        box 75x75 red
]
view sidePanel
```

[22:33](#msg5c103b1d8d4f3a2a7ca91da1)Instead of throwing an error of some kind, it instead just kills the window when you click on the text, AND the red console.

[22:33](#msg5c103b3311bb5b25049d7ec7)This is a simplified reproduction. The actual code I am using in my project is a bit more complex.

[22:33](#msg5c103b48e4787d16e380bf04)Let me know if you guys can produce the issue too.

[22:34](#msg5c103b6f11bb5b25049d7fa2)and Yes I understand

```
layout generate
```

should be

```
layout/only generate
```

[22:34](#msg5c103b855e4095250350d708)but it still should not crash the console altogether, it should throw an error like normal.

[22:36](#msg5c103bd01e86c30823630311)I am using 0.6.4 , not the latest automated build.

ne1uno

[22:41](#msg5c103cff28907a3c7b05b472)crashes win7 just built

## Wednesday 12nd December, 2018

ne1uno

[00:33](#msg5c1057701e86c3082363a98f)older 063 traps error, \*\** Script Error: cannot MAKE/TO string! from: none

gltewalt

[00:47](#msg5c105a99e4787d16e3817829)"PROGRAM ERROR: Invalid encapsulated data." is still an issue, and I'd rather not make .bat to work around it. Will it remain an issue until Red is self hosted? #543

dander

[08:10](#msg5c10c28de4787d16e383d6d4)@gltewalt if you download red using \[Scoop](https://github.com/red/scoop-bucket) it shims the exe for you. The other nice thing is it makes it easy to update too. Just `scoop update red-latest -f`

AlexanderBaggett

[16:25](#msg5c113672e4787d16e386f0f6)@dockimbel , Have you had a chance to look at this yet? Would you like me to create a github issue for this code? Never filed a bug directly myself before for Red, but would be glad to do it.

9214

[16:44](#msg5c113ad028907a3c7b0c1629)@AlexanderBaggett ever heard of \[SSCCE](http://sscce.org/)?

```
Red [Needs: View]

view [button [face/pane: 'boom]]
```

ne1uno

[17:24](#msg5c114445178d7860a1c71d04)nice. taking tips from browser bug reports? does that mean it's not a bug?

[17:27](#msg5c11450680986419d57e288c)&gt;9214 opened an issue in red/red: access violation on setting PANE facet to non-SERIES! value https://github.com/red/red/issues/3656

AlexanderBaggett

[17:32](#msg5c11462126de6f0822c3b5dd)@9214 I have heard of \[MVCE](https://stackoverflow.com/help/mcve) . So I get the essence of what you are saying. I feel my example is simple enough that someone more experienced than myself can reduce it further. I feel my example would have been good enough for stackoverflow or other programming forums for people to easily reproduce the issue. And quite frankly I don't know how to reduce it further myself. I will leave that to the experts like you. Thanks

[17:43](#msg5c1148d233d9e11991c09551)Perhaps you can teach me how your code example is effectively doing the same as mine. Because I don't understand it. I thought the issue was related to the use of the

```
layout
```

command and

```
pane
```

not handling it well.

9214

[17:47](#msg5c1149b05e40952503578830)@AlexanderBaggett it's not a rocket science, just start throwing pieces away and see if error persists. If it disappeared - return throwed piece back and start anew. Rinse and repeat until there remain a bare minimum.

AlexanderBaggett

[17:47](#msg5c1149bdf4880a60a26a81c2)I already did that. But I see there is more I could have done.

[17:48](#msg5c1149d726de6f0822c3d036)throwing away piece is not what you did, you changed them outright. I never had a button in my example.

[17:56](#msg5c114bc54808192b03276d8b)This is about as far as I can reduce it. How did you go further?

```
Red [Needs 'View]
sidePanel: [
    p: Panel  []
    Text-list data [
        "Generate"
    ] 
    on-change [
            p/pane: layout generate
        ]
    ]
]
generate: []
view sidePanel
```

9214

[17:56](#msg5c114bc73de4e816e24f0c31)First I removed redutant values, like size and color:

```
sidePanel: [

    nodeTypes:  Text-list data [
        "Generate"
    ] 
    on-change [
        t:  to string! nodeTypes/data/(nodeTypes/selected) 
        switch t [
            "Generate" [ p/pane: layout generate]
        ]
    ]
    return
    p: Panel [

    ]
]

generate: [
        box 75x75 red
]
view sidePanel
```

Then I squeezed code a bit:

```
sidePanel: [
    nodeTypes:  Text-list data ["a"] on-change [
        t:  to string! nodeTypes/data/(nodeTypes/selected) 
        switch t [
            "a" [ p/pane: layout [box 75x75 red]]
        ]
    ]

    p: Panel []
]

view sidePanel
```

Then I figured that `to string! none` conversion error is not the culprit and removed it entirely together with `switch`.

```
sidePanel: [
    nodeTypes:  Text-list data ["a"] on-change [
            p/pane: layout [box 75x75 red]
        ]
    ]

    p: Panel []
]

view sidePanel
```

At this point `text-list` functionally was identical to a button, so I changed it to a button:

```
sidePanel: [
     button [p/pane: layout [box 75x75 red]]
    p: Panel []
]

view sidePanel
```

Then I realised that `layout` can eat an empty block:

```
sidePanel: [
     button [p/pane: layout []]
    p: Panel []
]

view sidePanel
```

And that `panel` face is not related to the issue - that is, it can be any face, even `button` itself:

```
sidePanel: [
     button [face/pane: layout []]
]

view sidePanel
```

Final touch:

```
view [button [face/pane: layout []]]
```

At this point `layout` was the only moving piece under observation, so I tried to substitute it for an arbitrary value:

```
view [button [face/pane: 'boom]]
```

Then I just played around and figured out that it doesn't error out on most of `series!` values, e.g. `paren!` or even `vector!`.

AlexanderBaggett

[18:01](#msg5c114ceff4880a60a26a9772)Man, that's crazy. You really know Red very well. I'm still learning. I would have never guessed to test layout with an empty block.

greggirwin

[21:13](#msg5c117a0c11bb5b2504a59301)@AlexanderBaggett, @9214 is on a different level. :^) @9214, that's worth a little write-up somewhere, even on the wiki if that's easiest.

[21:14](#msg5c117a2e178d7860a1c8968e)And thanks for digging into it. Detective stories make for good reading.

## Thursday 13th December, 2018

9214

[08:01](#msg5c1211db33d9e11991c57069)@greggirwin not quite sure what deserves a write-up here.

greggirwin

[08:02](#msg5c1212228336e22a7d25fe3e)Your answer to "How did you go further?" The mindset and process of debugging in Red, which has different facets to it, as we think in terms of datatypes and their attributes.

9214

[08:37](#msg5c121a63f4880a60a26f9be4)When you ask a hound how did it catch a squirrel, all it can say is "woof".

## Monday 17th December, 2018

Oldes

[17:20](#msg5c17daf6987052387efe368f)When reviewing `date` syntax, I noticed, that there is in `Rebol`:

```
>> 1/1/9999/23:59:59-
== 1-Jan-9999/23:59:59
>> 1/1/9999/23:59:59-2
== 1-Jan-9999/23:59:59
>> 1/1/9999/23:59:59-20
== 1-Jan-9999/23:59:59
>> 1/1/9999/23:59:59-200
== 1-Jan-9999/23:59:59-2:00
>> 1/1/9999/23:59:59-2000
** Syntax Error: Invalid date -- 1/1/9999/23:59:59-2000
** Near: (line 1) 1/1/9999/23:59:59-2000
```

while in `Red` it is:

```
>> 1/1/9999/23:59:59-
*** Syntax Error: invalid time! at ""
*** Where: do
*** Stack: load 
>> 1/1/9999/23:59:59-2
== 1-Jan-9999/23:59:59-02:00
>> 1/1/9999/23:59:59-200
*** Syntax Error: invalid time! at "200"
*** Where: do
*** Stack: load
>> 1/1/9999/23:59:59-20
== 1-Jan-9999/23:59:59-04:00 
>> 1/1/9999/23:59:59-2000
== 1-Jan-9999/23:59:59-04:00
```

Which results are bad and which are good? At least the last one in Red seems to be strange. Any explanation?

[17:29](#msg5c17dcf2b18e825e3b4393b6)Ok... looks like Red is normalizing the zone using reminder... `24 // 20 == 4`. I'm not sure I like it.

rebolek

[17:34](#msg5c17de3ce806954a9a321ec3)Timezones are tricky stuff...

Oldes

[17:49](#msg5c17e1c1987052387efe615e)It looks that \[Carl implemented](https://github.com/rebol/rebol-issues/issues/1608#issuecomment-170911426) a single number in a timezone to be a number of minutes in `R3`:

```
>> 1-1-2000/2:0+60
== 1-Jan-2000/2:00+1:00
```

I think it was not good decision. `Red` give very unexpected result in this case:

```
>>  1-1-2000/2:0+60
== 1-Jan-2000/2:00:00-12:00
```

[17:58](#msg5c17e3d1e86b0460b3b2026e)On the second though... \[Carl's decision](https://github.com/rebol/rebol-issues/issues/1411#issuecomment-170907151) maybe makes a sense... as the number is simply padded to `HHMM`

[18:02](#msg5c17e4a394d8cd0b9cdb9a2b)So if one use `+200`, it is like using `+0200`, which should be `+02:00`. So I now think, that Red is somehow strange. Any other opinion? @dockimbel is above \_by design\_?

[18:12](#msg5c17e70db4c74555cce203b5)Maybe it would be better to throw error instead of doing such a modifications? For example SQLite does not recognize `00:60` as a valid time zone. But it does not recognize many current valid formats which are loadable from Red.

rebolek

[18:55](#msg5c17f138039551387fb28852) SQLite may not recognize `00:60` as valid timezone, but some mad dictator may. Timezones are not mathematical or time-keeping stuff, but strictly political one. So they should be open to all possibilities.

greggirwin

[19:34](#msg5c17fa3a72f31355cd6e78ff)@Oldes, it's by design. Both https://doc.red-lang.org/en/datatypes/date.html#\_\_zone and https://doc.red-lang.org/en/datatypes/date.html#\_\_timezone note that:

&gt; Timezones are returned as time! values between -16:00 and +15:00. ...Out of range argument values will result in a normalized date.

And that your `-2000` example means `hhmm`, which equates to the same as `-20`, which is just `hh`.

Oldes

[19:35](#msg5c17fa82392d8c6f8e780d21)@greggirwin I have problem with this:

```
>> 1-1-2000/2:0+60
== 1-Jan-2000/2:00:00-12:00
```

[19:38](#msg5c17fb3b039551387fb2d4dc)I wonder if it makes sense to do some kind of normalizations.

greggirwin

[19:38](#msg5c17fb49b18e825e3b446337)Do you want it to throw an error, rather than normalizing, or do you want it to normalize using a different algorithm?

[19:39](#msg5c17fb8a987052387eff0478)And where will these bad numbers come from?

Oldes

[19:40](#msg5c17fbbe039551387fb2d7c2)I'm not timezone specialist so for me it is unexpected result and I have no idea if someone may find some of these normalizations to be useful.

greggirwin

[19:40](#msg5c17fbc8ca317a0e25e1383e)In a case like this, I don't know that Red can always do the right thing for everyone. One man's normalization is another's garbage output.

[19:41](#msg5c17fbe472f31355cd6e857c)Given bad input, we can't always produce useful results.

Oldes

[19:42](#msg5c17fc10392d8c6f8e781637)I don't say it should be changed. I'm just trying to understand reasons. So far there is big difference between Red and Rebol. That is for sure.

greggirwin

[19:44](#msg5c17fc9bb18e825e3b446c07)The reason is...can you come up with something definitively better? My gut says that R3's approach isn't good.

```
>> 1-1-2000/2:0+60
== 1-Jan-2000/2:00+1:00
```

Especially in Red, where we clearly state that 2 digits means `hour`. If that suddenly becomes `minutes` because of normalizing, that seems worse to me.

Oldes

[19:45](#msg5c17fcd90a86bc6f8dc29e19)Rebol clearly state, that the 2 digit number are minutes.

greggirwin

[19:45](#msg5c17fcedca317a0e25e13e9c)So that's just a different design choice.

Oldes

[19:46](#msg5c17fd08b512ce0b9da7373d)Isn't it a bug when you exceed the zone limit? Because you are doying zone normalizations without modifying the date.

greggirwin

[19:47](#msg5c17fd4be86b0460b3b2b5c9)Red's date formats encompass some ISO8601 compatibility, which Rebol does not, including `hh` as a zone value.

Oldes

[19:48](#msg5c17fd73e806954a9a32f5a0)I don't think there is any normalization in the ISO

rebolek

[19:49](#msg5c17fdde72f31355cd6e94f5)That's because ISO defines valid data and doesn't deal with invalid data. That's up to implementation.

greggirwin

[19:52](#msg5c17fe63b18e825e3b44799d)&gt; Isn't it a bug when you exceed the zone limit?

That's why I asked if you wanted an error, or different normalizing.

ISO8601 doesn't have to normalize, because ...what @rebolek said.

[19:52](#msg5c17fe900a145b0e24b68b7f)@Oldes, so let me ask again: Where is this bad data coming from? Red tells you the rules. If you break them, what should it do?

rebolek

[19:52](#msg5c17fe98b512ce0b9da74221)@Oldes @greggirwin

```
>> d: now
== 17-Dec-2018/20:51:52+01:00
>> d/hour: 28
== 28
>> d
== 18-Dec-2018/4:51:52+01:00
>> d/month: 257
== 257
>> d
== 18-May-2039/4:51:52+01:00
```

[19:53](#msg5c17fec1b512ce0b9da742ec)So `zone` is doing the same as other fields.

Oldes

[19:54](#msg5c17fee2e86b0460b3b2c0b7)@greggirwin the data are from my playing in console.

[19:55](#msg5c17ff300a86bc6f8dc2ac7b)@rebolek sorry.. don't understand what you mean... there is no zone used in your example.

greggirwin

[19:55](#msg5c17ff4a539aca60b225e9d0)@Oldes, right. I get that. You can type anything you want in the console. But in production use, if bad data like that shows up, there's no way Red can make sense of it, and get it right for everyone, is there?

rebolek

[19:56](#msg5c17ff5b0a145b0e24b69138)@Oldes no, but as you can see, I can set `month` to `257`. There's no 257th month in a year, is there?

Oldes

[19:57](#msg5c17ff8f039551387fb2f26e)But in your example the date value is modified while if you set zone to something not existent, it is normalized and the date is same

rebolek

[19:58](#msg5c17ffe1e806954a9a33042c)Right and I think that's the best outcome. Seconds can overflow to minutes, minutes to hours, etc...to years, but timezones are abstract and shouldn't change the date unless you explicitly want them to do it.

greggirwin

[19:58](#msg5c17fff7539aca60b225ed2f)Because, circling back, timezones are political, so normal math rules don't really apply.

Oldes

[19:59](#msg5c180010b18e825e3b448677)@rebolek check this:

```
>> 1-1-2000/0:0:0+47 = 1-1-2000/0:0:0+15
== true
```

greggirwin

[19:59](#msg5c180035b512ce0b9da74b0f)If you set the zone to 2'000'000, and imagine circling the Earth to find out where to stop, are you ~200 years in the future?

Oldes

[20:00](#msg5c180057c428e9539d53f3f4)Ok... I think, that there should be an error instead.

rebolek

[20:00](#msg5c18005ee806954a9a3307e9)@Oldes I see your point.

greggirwin

[20:00](#msg5c18005fb4c74555cce2b909)Now, we \*could* also apply that logic to other date fields, which is a bigger design question.

rebolek

[20:02](#msg5c1800d8039551387fb2f9ee)Ok, maybe if the docs say that zones are values between -16:00 and +15:00, maybe Red should throw error for other values and leave the overflow logic for real time values like seconds to years.

[20:04](#msg5c180136e806954a9a330d35)Maybe it shouldn't convert 47 to 15.

greggirwin

[20:04](#msg5c18016494d8cd0b9cdc66bf)@Oldes feel free to open a REP ticket, to change lexing of OOB zone values to throw errors.

[20:04](#msg5c18016bc428e9539d53fb88)Good chat guys.

Oldes

[20:24](#msg5c1805e5e86b0460b3b2f0cc)Btw... why it is -16:00 to +15:00? \[According Wikipedia](https://en.wikipedia.org/wiki/List\_of\_UTC\_time\_offsets) it is (UTC−12 to UTC+14)

rebolek

[20:26](#msg5c180672392d8c6f8e785a0d)32 hours?

[20:27](#msg5c1806b0ca317a0e25e180e9)It's good there's some margin. At least Red's `date!` is prepared for some other crazy island that decides they should be first to celebrate New Year.

greggirwin

[20:39](#msg5c18099eca317a0e25e195c1)@Oldes the current limits are an artifact of the implementation.

Oldes

[21:42](#msg5c1818601287f05a1e231a1f)@greggirwin here is another reason why not to normalize the timestamp -&gt; https://tools.ietf.org/html/rfc3339#section-5.8

1937-01-01T12:00:27.87+00:20

This represents the same instant of time as noon, January 1, 1937,  
Netherlands time. Standard time in the Netherlands was exactly 19  
minutes and 32.13 seconds ahead of UTC by law from 1909-05-01 through  
1937-06-30. This time zone cannot be represented exactly using the  
HH:MM format, and this timestamp uses the closest representable UTC  
offset.

[21:44](#msg5c1818c134c6c32cc82ee784)It looks some people may need the timezone to be not touched.

rebolek

[21:44](#msg5c1818d8c35a3002473e1b8b)@Oldes Timezones and summer time are minefield you don't want to walk on.

Oldes

[21:45](#msg5c1818e39c82bd02402d80f6)Yes... I'm ending.

rebolek

[21:45](#msg5c18190db6f00a271003dbcb)Just imagine that there's an hour every year, that happens twice.

[21:46](#msg5c181931c35a3002473e1f22)You can be in Brno at 2:30 and in Adamov at 2:30 at the same day, in the same timezone.

[21:47](#msg5c18197834c6c32cc82eec0c)Does it make sense? It doesn't. How can you represent that time? Without UTC, you can't. Yet, we use it and pretend like it's totally normal and it makes sense. It doesn't, OMG!

## Tuesday 18th December, 2018

rgchris

[00:26](#msg5c183ed200ab9f27110588b3)Any reason this isn't a bug?

```
>> to string! <a href="^">
== {a href=""}
```

ne1uno

[00:51](#msg5c18448034c6c32cc82fe9f3)`to-tag to string!` [round trip?](%5E)

[greggirwin](%5E)

[](%5E)

[](%5E)[04:21](#msg5c1875b6b6f00a2710060615)

```
>> <a href="^">
== <a href="">
>> <a href="^^>
== <a href="^>
```

@rgchris, it's not a bug, because the escape just escapes the double quote that follows it.

Oldes

[11:13](#msg5c18d643c35a300247428c68)@greggirwin and is it good that Red allows `** Syntax Error: Missing " at <a href="^^> ** Near: halt`

`11:19On the other side, one can construct invalid tags using other methods in Rebol, so Red's behaviour is probably ok. >> append <a> { href="} == <a href=">`

`dockimbel 11:20@Oldes > @rebolek check this: > > >> 1-1-2000/0:0:0+47 = 1-1-2000/0:0:0+15 > == true > A modulo is applied to the out-of-range timezones. There is no standard rule for handling such cases, so it's up to us to figure out what is the most useful behavior for users in such case. As the TZ are circling around the globe, there's only one valid range of TZ, so using a modulo to normalize seemed fitting. I am fine with changing that rule to something better, but we need some empirical data to identify the most helpful behavior, and I haven't found any so far. Oldes 11:21Cannot we just keep the TZ untouched? And throw error in out of range? hiiamboris 11:22we have to pack it into a certain number of bits, which we can use for other purposes Oldes 11:24(but there are more important things to do now) dockimbel 11:25@rgchris > Any reason this isn't a bug? > lisp > >> to string! <a href="^"> > == {a href=""} > R2: >> {"^"} == {""} >> <"^"> ** Syntax Error: Missing " at <"^"> R3: >> {"^"} == {""} >> <"^"> == <"^"> >> <a"^"> == <a"^"> Red: >> {"^"} == {""} >> <"^"> *** Syntax Error: invalid value at {"^^">} *** Where: do *** Stack: load >> <a"^"> == <a""> 11:27Notice that Red does require a valid character after the < in order for the literal form to qualify as a tag!. Oldes 11:29@dockimbel above Red's results looks good to me, but not this one: >> <a href="^> == <a href="> dockimbel 11:29@Oldes > Cannot we just keep the TZ untouched? And throw error in out of range? Why would that be a more helpful behavior? We normalize all the other fields for out-of-range values, but would error out on TZ field? That's not consistent. Oldes 11:30Which values? In datetime when you normalize, you don't loose the info like with TZ dockimbel 11:31@Oldes > @dockimbel above Red's results looks good to me, but not this one: > > >> <a href="^> > == <a href="> > Indeed, worth a ticket. 11:35@Oldes The point is normalizing vs erroring out. TZ field has specific rules, like 15min steps: >> a: now == 18-Dec-2018/19:34:39+08:00 >> a/zone: a/zone + 0:12 == 8:12:00 >> a == 18-Dec-2018/19:34:39+08:00 >> a/zone: a/zone + 0:17 == 8:17:00 >> a == 18-Dec-2018/19:34:39+08:15 Oldes 11:36Regarding TZ, I don't want to continue as it is really not so important now. But I was really surprised when I've seen this: >> 1-1-2000/2:0+60 == 1-Jan-2000/2:00:00-12:00 Without studying the documentation, where is defined some range, which even is not same like current time-zones in use. (sorry.. I don't think there will be any new island with own new TZ like Rebolek predicts) dockimbel 11:38@Oldes You know that some countries are building artificial islands to claim sea territories? ;-) So an island can be built pretty much anywhere, and Red is ready to be used on those new lands. ;-) Oldes 11:39And I have posted example, when is used TZ with value +0:20 for existent reason (for someone), so the rounding to steps is also not too friendly. dockimbel 11:41> so the rounding to steps is also not too friendly. TZ have a 15mn granularity, it's not about being friendly, but having TZ that match the real world. 11:43@Oldes > Regarding TZ, I don't want to continue as it is really not so important now. But I was really surprised when I've seen this: > > >> 1-1-2000/2:0+60 > == 1-Jan-2000/2:00:00-12:00 > If it errored out, you (or someone else) would have said also that the error is surprising, as it's not consistent with how other fields behave for out-of-range values... I don't see a clear winner there, so that's why I prefer to wait until someone stumbles upon that with a real use-case, so that we can change the rule to something better. hiiamboris 11:47@dockimbel can you please look at https://github.com/red/red/issues/3581 and have your say? It's about some curious commandline processing syntax you made for the console launcher dockimbel 11:51@hiiamboris Have you checked if that case conforms or not with the command-line processing rules of Windows? (IIRC, there's a page about that somewhere in MSDN, I might have left a link inn the source code for that). Windows has some different rules than Unix systems for that. hiiamboris 11:53@dockimbel on Windows there are 2 conventions in use: - simply extract anything between paired double quotes (pathname-friendly syntax) - same, but also escape \" as " and \\ as \ (not pathname-friendly, but standard in MSVC) And the short answer is no. I mean I've checked and it's not compatible with neither Windows or Unix. 11:57I think this https://docs.microsoft.com/en-us/previous-versions//17w5ykft%28v=vs.85%29 is the page you are referring to dockimbel 11:58@hiiamboris I think so, yes. Thanks for digging it out. 12:00Here is an interesting in-depth analysis of those rules: http://www.windowsinspired.com/how-a-windows-programs-splits-its-command-line-into-individual-arguments/ 12:01@hiiamboris Once you've confirmed the proper behavior, you can submit a PR to fix it, in case it's not conforming. hiiamboris 12:02@dockimbel Thanks, I'll read that. I favor the 1st and simple solution over all this escaping business, as I very often pass filenames as arguments. When we need strings passed as part of the script (like rebol --do), we can simply use {..} on Windows instead of "..". You will be okay if we choose that behavior? 12:07I asked in the first place because of this: > test-args.exe { 1 2 } ;-- compiled Red script system/script/args = "{ 1 2 }" system/options/args = [" 1 2 "] which seemed strange and I didn't know if you made this for a reason 12:07In Windows this is 5 arguments normally. dockimbel 12:09From what I remember {} was used internally as an escape mechanism for passing arguments to the console executable, to workaround some annoyances on Windows. hiiamboris 12:09I see. dockimbel 12:11But, a global clean-up of arguments handling would be welcome. I think some of the implementation decisions were made for sake of performances and lower memory usage on start-up. Though, probably those concerns are misplaced wrt conformity to platform's rules. 12:13From your ticket: "I'd like to let OS routines do the job of argument splitting and joining as this is the most reliable way, also forward-compatible." IIRC, some of those OS API would be quite memory-consuming? hiiamboris 12:18@dockimbel Disregard that. After some more research I discovered that CommandLineToArgv destroys pathnames suffix ("c:\" becomes c:", "c:\" "d:\" becomes c:" d:\ etc) and IIRC on Unix arguments come to us already being split. So it will be simpler and more efficient to do it by hand. Oldes 13:12@dockimbel Is there any documentation when is used conversion between CRLF, CR and LF? Or any consensus when it should be used and when not? This does not look good to me: >> write %xxx CRLF read %xxx == "^/^/" While this is ok: >> to-string probe to-binary probe to-string crlf "^M^/" #{0D0A} == "^M^/" dockimbel 13:18@Oldes The conversions should happen only on file I/O read/write, like in R2. On Windows: >> write %xxx CRLF read %xxx == "^/^/" >> write/binary %xxx CRLF read %xxx == "^/" Oldes 13:25Hm... at least it is compatible with R2... but still quite don't like how the CR is converted to LF dockimbel 13:27 lisp >> write %xxx CRLF read/binary %xxx == #{0D0D0A} It's not the CR which is converted to LF, but the LF that gets converted to CRLF on writing. :-D 13:30CRLF has no special meaning in Redbol, as LF is the standard end-of-line marker, so CR is treated separately of LF in the Redbol environment. Hence you should only have strings with LF as markers, if you have CRLF in Redbol strings, you should normalize them before doing any I/O writing. hiiamboris 14:29@dockimbel is this a known limitation atm that I can't pass a function into a function? Red/System [] foo!: alias function! [n [integer!] return: [integer!]] inc: func [n [integer!] return: [integer!]] [n + 1] call: func [f [foo!] return: [integer!]][ f 2 ] print call :inc Outputs: *** Compilation Error: undefined symbol: f *** in file: %/D/devel/red/red-src/red/2.reds *** in function: call *** at line: 4 *** near: [f 2] 14:38I can still pass it as an integer!.. but that's ugly dockimbel 14:53Yes, it was limited on purpose, as I didn't want to push R/S into the functional programming territory (mostly because R/S was supposed to stay minimal until Red 2.0). Though, I agree that the workaround for that specific use-case is ugly and even possibly harmful. hiiamboris 14:56Should I rather duplicate the code than use this pattern then? dockimbel 14:56If the code is not too big, yes. hiiamboris 14:56Okay. dockimbel 14:58BTW, we probably will need to implement that feature anyway if we want to support both 32 and 64-bit from same codebase. hiiamboris 21:16@dockimbel is it by design that structures on the stack are not zero-filled? I don't remember R/S docs mentioning that... Red/System [] s!: alias struct! [a [integer!] b [integer!] c [integer!]] f: func [/local x [s! value]] [ print-wide [x/a x/b x/c] ] f outputs: 0 1638252 1`

`Wednesday 19th December, 2018 dockimbel 05:03@hiiamboris None of the local variables are zero-filled, for sake of performance. Though, in order to balance that, the compiler is supposed to check that you've assigned a variable before using it. Though, for structs references, the compiler can't accurately determine that. 05:03 lisp Red/System [] f: func [/local x [integer!]] [print x] f results in compilation error: *** Compilation Error: local variable x used before being initialized! *** in file: %/c/dev/Red/system/tests/test2.reds *** in function: f *** at line: 2 *** near: [x] 05:05Since we introduced "structs by value" support, I haven't checked if the compiler could properly infer that such structs have been initialized or not, but cases like filling the struct with a memcpy() would still escape the compiler's detection. 05:08The compiler could emit some warning though, but we would need to add a compilation option for suppressing the warnings selectively then. gltewalt 06:57Expected *** Syntax Error: invalid binary! at "64#{2A}" *** Where: do *** Stack: load Expected >> 64#{2A+} *** Syntax Error: invalid binary! at "64#{2A+}" *** Where: do *** Stack: load Issue... >> 64#{2A+/} == #{D80FBF} >> 64#{2A+/+} == #{D80FBF} >> 64#{2A+/+/} == #{D80FBF} >> 64#{2A+/+//} == #{D80FBF} >> 64#{2A+/+///} == #{D80FBFFBFFFF} 07:00Should be 4 characters or groups of 4 characters, or - error Oldes 08:56Are you sure that it is an issue? 08:56[![image.png](https://files.gitter.im/red/bugs/udNJ/thumb/image.png)](https://files.gitter.im/red/bugs/udNJ/image.png) 08:56https://cryptii.com/pipes/base64-to-hex 08:59actually according the web, 64#{2A+} and 64#{2A} could be valid. 09:03Just 2A+/+ is reported as invalid. endo64 09:15For R2 & R3: >> 64#{2A+/+///} == #{D80FBFFBFFFF} >> 64#{2A+/+//} ** Syntax Error: Invalid binary -- 64#{2A+/+//} >> 64#{2A+/+/} ** Syntax Error: Invalid binary -- 64#{2A+/+/} >> 64#{2A+/+} ** Syntax Error: Invalid binary -- 64#{2A+/+} >> 64#{2A+/} == #{D80FBF} >> 64#{2A+} ** Syntax Error: Invalid binary -- 64#{2A+} >> 64#{2A} ** Syntax Error: Invalid binary -- 64#{2A} rebolek 09:39Should empty block in func specs mean that the argument can't have any type? What's the use for this? >> f: func [x []][x] == func [x []][x] >> f 1 *** Script Error: f does not allow integer! for its x argument *** Where: f *** Stack: f >> f "asd" *** Script Error: f does not allow string! for its x argument *** Where: f *** Stack: f 09:39I would prefer it empty block would be same as no block. Oldes 09:50Heh... it's same in Rebol... the use of it is to be able to write useless functions. rebolek 09:51:smile: hiiamboris 09:57and what will be the use of using an empty block instead of no block? rebolek 09:58It would be the same. dockimbel 10:00It's a side-effect of the function spec dialect. An empty block as type spec means that none of the existing types are allowed. We could emit an error on that, but that would be adding code to remove a possible feature. Less is more. hiiamboris 10:01@dockimbel should I raise an issue about compiler not complaining about non initialized structs in the stack? dockimbel 10:02One usage of that could be to dynamically enable/disable access to a given function (it's probably not the best way, but it's efficient ;-)). 10:05@hiiamboris I would prefer a wish ticket (or is there a wiki page for that now?), to propose that the compiler emits a warning for that, and a proposition about handling warnings through a compilation option. rebolek 10:06> One usage of that could be to dynamically enable/disable access to a given function (it's probably not the best way, but it's efficient ;-)). Ok then :smile: Oldes 10:08But it would work only with functions, which have some argument. dockimbel 10:10Insert a fake argument with empty type spec to disable access to any function. ;-) It wouldn't work for compiled functions though. Anyway this behavior seems harmless, so we would not add code to block it. hiiamboris 10:16what about this (compiling any script w/o header at all): *** Red Compiler Internal Error: Script Error : copy expected value argument of type: series port bitset *** Where: rejoin *** Near: [mold copy/part pos 40] rebolek 10:17I agree it 's harmless, but when left in Red, I believe it should be documented. dockimbel 10:19@hiiamboris The compiler should produce a proper error instead of choking on it. hiiamboris 10:40ok wish here the way I see it: https://github.com/red/REP/issues/38 rebolek 10:49I can understand that using strings in binary parsing shouldn't work, but this seems inconsistent: >> text: to binary! crlf == #{0D0A} >> parse text [crlf] == false >> parse text [to crlf] *** Script Error: PARSE - invalid rule or usage of rule: "^M^/" *** Where: parse *** Stack: endo64 11:20parse text compose [(to binary! crlf)] ; ==true because text is not a string but a binary value, hence your rule should be as well. >> parse #{65} [#"e"] == true >> parse #{65} ["e"] >> parse #{65} compose [(to binary! "e")] == true 11:21Ah, you already mentioned that. 11:21But still crlf is a string, not a char or binary. rebolek 11:22No problem, so it fails. But once it returns false and in second case error!. 11:22If string rule in binary is invalid, both cases should throw error, no? dockimbel 11:23It's not inconsistent, the matching operation is different in those two rules. 11:24The first one is equivalent to a crlf = #{0D0A} while the second one is similar to find #{0D0A} crlf. rebolek 11:27I see. dockimbel 11:27I see that Rebol does a stricter checking when the input is of any-string!: >> parse "hello" ['abc] ** Script error: PARSE - invalid rule or usage of rule: 'abc ** Where: parse ** Near: parse "hello" ['abc] rebolek 11:28In R3, you can use strings when parsing binary. dockimbel 11:29@rebolek Isn't R3 encoding its strings in UTF-8 internally? If so, then that's understandable, as it costs nothing to allow such matching. If not, I wonder how R3 manages on-the-fly UTF-8 conversions then, the overhead must be very big. rebolek 11:31@dockimbel I think it does, @Oldes should know about R3 internals better. dockimbel 11:35@rebolek If so, then it can do such matching in Parse, but Red cannot, it needs an explicit conversion to UTF-8. Though, you could use macros if you really want to embed strings in rules when parsing binary series in Red. For example, prefix the strings with #utf8 and write a short macro that will preprocess those nested strings. Oldes 11:37R3 does not have UTF-8 internally... just ANSI and UTF-16... I guess that parsing binary with not ANSI string would fail. rebolek 11:38@dockimbel I'm fine with using binary directly in such case, I noticed it just because converting some R3 code to Red. Oldes 11:38In R3: >> parse to-binary "Škoda" ["Škoda"] == false >> parse to-binary "Skoda" ["Skoda"] == true 11:39So it does not do any conversion. Just uses the internal data structure in parse. 11:44Which may be useful in some cases, when one know its limitations, as this should be safe: >> parse to-binary "<a>Škoda</a>" [thru "<a>" copy x to #"<" to end] to-string probe x #{C5A06B6F6461} == "Škoda" 11:58On the other side, R3 does not allow find #{0D0A} crlf as Red does. >> find #{0D0A} crlf ** Script error: values must be of the same type ** Where: find ** Near: find #{0D0A} crlf dockimbel 12:04@Oldes We could allow the same feature in Parse in Red, but that looks quite sloppy and error-prone for the user. Though, Internet protocols rely on ASCII strings, so it's quite tempting to allow it... Oldes 12:07But useful... it is up to you:) The thing is, that in R3, the default result from read is binary and so one can for example parse page's title without need to convert all the content into string and still use human-friendly tag names. dockimbel 12:08@Oldes You can use read/binary in Red for getting the raw binary instead of the human-friendly default string. Yeah, for HTML tags parsing it could be useful too. Oldes 12:09Yes, but the human-friendly tags is what is important. >> parse to-binary "<a>Škoda</a>" [thru <a> copy x to </a> to end] == true 12:11I think it was me who changed Carl's mind in this case btw. I think he had same arguments like you :-) dockimbel 12:12@Oldes > Yes, but the human-friendly tags is what is important. Red handles that already: >> parse "<a>Škoda</a>" [thru <a> copy x to </a> to end] == true Allowing binary parsing to match strings is just an optimization, but I agree that it can be a useful one. Oldes 12:13I know... but we were talking about binary input parsing. dockimbel 12:13@Oldes You can open a wish ticket for it. Oldes 12:14I was not the one who requested it... it was @rebolek :) And actually he didn't like that in one case it does not throw an error. dockimbel 12:17I think we can allow it, as we do already for find. Though, it's still a borderline semantic rule which will need to be properly documented. gltewalt 19:06So in other Redbols, Base 64 binary follows the rule I mentioned. 4 characters or groups of 4 characters- anything else is an error. 19:07Red doesn’t error for Base 64, currently Thursday 20th December, 2018 greggirwin 04:22@rebolek @oldes, we can add notes about this to https://github.com/red/red/wiki/%5BDOC%5D-Parse 04:29@gltewalt https://en.wikipedia.org/wiki/Base64#Decoding_Base64_without_padding >> to string! 64#{YW55IGNhcm5hbCBwbGVhcw} == "any carnal plea" >> to string! 64#{YW55IGNhcm5hbCBwbGVhc3U} == "any carnal plea" >> to string! 64#{YW55IGNhcm5hbCBwbGVhc3Vy} == "any carnal pleasur" Looks like Red could do better, as the first two cases there don't look correct. Should be the same as >> to string! 64#{YW55IGNhcm5hbCBwbGVhcw==} == "any carnal pleas" >> to string! 64#{YW55IGNhcm5hbCBwbGVhc3U=} == "any carnal pleasu" Or we say we don't support unpadded data. gltewalt 04:32I think padding works with enbase and debase 04:36 >> enbase/base "any carnal pleasure" 64 == "YW55IGNhcm5hbCBwbGVhc3VyZQ==" 04:38 >> b: enbase/base "any carnal pleasure" 64 == "YW55IGNhcm5hbCBwbGVhc3VyZQ==" >> to-string debase/base b 64 == "any carnal pleasure" 04:45 >> enbase/base "any carnal pleas" 64 == "YW55IGNhcm5hbCBwbGVhcw==" >> enbase/base "any carnal pleasu" 64 == "YW55IGNhcm5hbCBwbGVhc3U=" >> enbase/base "any carnal pleasur" 64 == "YW55IGNhcm5hbCBwbGVhc3Vy" dockimbel 15:19@rebolek Feature added to Parse: --== Red 0.6.4 ==-- Type HELP for starting information. >> parse to-binary "<a>Škoda</a>" [thru "<a>" copy x to #"<" to end] to-string probe x #{C5A06B6F6461} == "Škoda" rebolek 15:20@dockimbel Nice, thanks! greggirwin 17:49@rebolek, @dockimbel is devious you know. This feature now puts the pressure on the rest of us to write protocols when 0.7.0 is available. "See how easy it is!" ;^) hiiamboris 17:55@dockimbel shouldn't declare zero-fill the struct? Red/System [] s!: alias struct! [x [integer!]] f: func [/local x [s!]] [ x: declare s! print x/x x/x: x/x + 1 ] f f f gives me: 012 17:58at least that's how I interpreted https://static.red-lang.org/red-system-specs.html#section-4.7 ... rebolek 17:58@greggirwin :smile: hiiamboris 17:58also: is declare a dynamic allocation? probably not, but to be sure Friday 21st December, 2018 dockimbel 03:06 @hiiamboris declared is a static zero-filled allocation. So you have to be cautious if you are using it from a local variable. hiiamboris 10:42@dockimbel hmm.. I find it semantically misguiding then. It *looks like it does something*, occurring in the midst of code, while in reality it only tells the compiler to leave some zeroes at some place when it generates that code. Even so, 1) how do I zero fill the struct properly? I can = 0 2 members, but if there's more it becomes annoying. And memset seems like an overkill for the task. No? 2) I take it /local x [s! value] stores that struct data in the code segment before the function, right? Where /local x [s!] (accessed by reference) stores the data? 3) what's even the point of declare? isn't /local x [s!] a declaration in it's own right? endo64 11:23@hiiamboris important questions indeed, but better fit to red/system room instead of /bugs. hiiamboris 11:27@endo64 right! sorry ☻ endo64 11:28@hiiamboris No problem! Just for later references it would be better this conversation to be there. dockimbel 11:35@endo64 Should I answer his questions here or in R/S, I'm lost. ;-) endo64 13:16Can someone confirm that this is a bug? I have some files with similar names, test1, test2, when I type %te and press tab key CLI and GUI console auto-completes to %test. But if I have one more file with uppercase, TEST3, then when I press tab auto complete makes %te to % dsunanda 13:36@endo64 I can see that too - Red 0.6.4 Win10. If I create a file called TEST, then %te in console autocompletes to %. If I delete the fiie TEST, it goes back to autocompleting the names of previous files that begin %te - including the rather mysterious file name %test-render.red - which does not exist on my drive(s). endo64 14:29Thanks @dsunanda opened #3674 gltewalt 21:43@dander I forgot to thank you for the Scoop link. Thanks. Monday 24th December, 2018 hiiamboris 18:10I'm wondering, is this order for a reason? >> view [backdrop white origin 0x0] >> view [origin 0x0 backdrop white] *** Script Error: VID - invalid syntax at: [backdrop white] *** Where: do *** Stack: view layout layout cause-error toomasv 18:59It's clearly intended, as seen from doc. hiiamboris 19:05oh I see.. it's because one can change both origin and space at a whim, but not backdrop toomasv 19:35All window props (i.e. size and title too) and actors. But you can set up layout block without these and include these with view/options. Tuesday 25th December, 2018 bitbegin 07:48write %abc.txt system/words crash console, should be a bug endo64 10:39@bitbegin Confirmed on W10. Additionally, I couldn't make a copy of system/words to test. >> o: make system/words [] *** Script Error: cannot set on-change* field to unset! datatype >> o: make system/words [on-change*: none] *** Script Error: cannot set on-change* field to none! datatype hiiamboris 11:46more info: >> write %nul system/words root size: 3451, root max: 4878, cycles: 0 root size: 3451, root max: 4878, cycles: 1 *** Runtime Error 101: no value matched in SWITCH *** in file: /d/devel/red/red-src/red/runtime/datatypes/string.reds *** at line: 377 *** *** stack: red/string/get-char 00000065h 4393006 *** stack: red/string/get-char 02C2A50Ch 16 *** stack: red/file/to-local-path 02980404h 02980434h false *** stack: red/file/to-OS-path 02980404h *** stack: red/simple-io/write 02980404h 02980414h 029803F4h 029803F4h false false false *** stack: red/file/write 02980404h 02980414h false false false false 029803F4h 029803F4h 029803F4h 029803F4h *** stack: red/actions/write 02980404h 02980414h false false false false 029803F4h 029803F4h 029803F4h 029803F4h *** stack: red/actions/write* -1 -1 -1 -1 -1 -1 -1 -1 *** stack: red/interpreter/eval-arguments 02B80244h 02E23EB8h 02E23EB8h 00000000h 00000000h *** stack: red/interpreter/eval-code 02B80244h 02E23E98h 02E23EB8h false 00000000h 00000000h 02B80244h *** stack: red/interpreter/eval-expression 02E23E98h 02E23EB8h false false false *** stack: red/interpreter/eval 029803D4h true *** stack: red/natives/catch* true 1 *** stack: ctx473~try-do 003A1E00h *** stack: ctx473~do-command 003A1E00h *** stack: ctx473~eval-command 003A1E00h *** stack: ctx473~run 003A1E00h *** stack: ctx473~launch 003A1E00h 14:21is this a necessary limitation that paths can't swallow pairs as they appear? >> i: make image! 2x2 >> i/1x1 *** Syntax Error: invalid integer! at "i/1x1" *** Where: do *** Stack: load >> i/(1x1) == 255.255.255.0 meijeru 16:53It is a lexical restriction Wednesday 26th December, 2018 amreus 20:39Here's a Rich Text anomaly. Rich Text doesn't like having a single character between tags when the single character is another tag, unless the single char is the same as the tag: view [rich-text data [i "u" /i] ; error view [rich-text data [s "i" /s] ; error view [rich-text data [b "s" /b] ; error view [rich-text data [u "u" /u] ; OK 20:45Leading or trailing text makes no difference view [rich-text data [ "begin " u "s" /u " end" ]] ; error Using red-26dec18-7369fa2e.exe on WIndows 10 Home hiiamboris 20:46@amreus there's an extra [ in your examples. You're right though, quite a bug there. Can you raise an issue on the issue tracker? amreus 20:47@hiiamboris I see. In the examples but there's an error without them. I fixed the examples posted here. I'll try filing an issue. hiiamboris 20:47Yeah. I also found some more just now: view [rich-text data ["u" i "x" /i]] doubles the x amreus 20:49Dang - messed up the examples again and now can't edit them. ne1uno 20:50no preview! can't waste buttons? 20:53can someone add a preview button to the new issue template? Thursday 27th December, 2018 toomasv 10:10@amreus @hiiamboris First, as here the problem seems to be with one-letter strings, which somehow get wrongly interpreted, I experimented a bit and came up with this solution: to avoid this I put a check on [style, line 32](https://github.com/red/red/blob/master/modules/view/RTD.red#L31): ahead [word! | tag! | tuple! | path!] and it worked. (Could be made into typeset! style!: make typeset [word! tag! tuple! path!]) Additionally I allowed char! along with string! on [line 52](https://github.com/red/red/blob/master/modules/view/RTD.red#L52), which seems to cause no harm, but allows also spec like [#"u" b #"s" /b i [#"b"]]. Second, there was problem with colors. Colors are supposed to be closed with this syntax: red ["aaa"] blue ["bbb"] green ["ccc"], otherwise they have scope to the end of input text. If they "stand alone" as in [red "aaa" blue "bbb" green "ccc"], it is ok, because they are stored in data block in this order. But if they are united with some other style, they may get transferred to some earlier position and can be "overwritten" by later colors. But closing syntax doesn't work due to bug(s) in pop-color func on [line 60](https://github.com/red/red/blob/master/modules/view/RTD.red#L60). Here is correction: pop-color: has [entry pos][ ;close-colors ;entry: back back tail color-stk entry: skip tail color-stk -3 append append out as-pair entry/1 tail-idx? - entry/1 entry/3 clear skip tail color-stk -3 ] Third, there is also problem with styles in path - if color is included in path it is not closed. Correction in the end of [pop-all func](https://github.com/red/red/blob/master/modules/view/RTD.red#L101): pop-all: function [mark [block!]][ first?: yes while [mark <> tail stack][ pop last stack either first? [first?: no][remove skip tail out -2] ] if v [pop-color] ; <- this was lacking ] 10:24^ Instead of append append out ...: reduce/into [as-pair entry/1 tail-idx? - entry/1 entry/3] tail out 10:36Or rather :flushed: repend out [as-pair entry/1 tail-idx? - entry/1 entry/3] 10:43The bug in first case appears from the parsing: >> parse ["i"][<i>] == true Strings "u", "i", "s" and "b" are initially interpreted as style tags. endo64 12:29@toomasv Great analysis! Why don't you make a PR with your fixes? toomasv 12:30@endo64 Thanks! Done already! 9214 12:30 text >> parse ["i"][<i>] == true >> parse [user@domain]["user@domain"] == true >> parse [%file]["file"] == true >> parse [http://site.com]["http://site.com"] == true This deserves a separate issue. Seems that any-string! values can be parsed with any other any-string! value. toomasv 12:31Ok, will do. 12:46Is the problem [here](https://github.com/red/red/blob/master/runtime/parse.reds#L65)? 9214 12:48Hard to say, but it boils down to equal? vs. strict-equal? comparison. Culprit might be [here](https://github.com/red/red/blob/master/runtime/parse.reds#L345). 12:48 text >> parse/case ["user@domain"][user@domain] == false 12:49Something to do with comp-op. toomasv 13:21@9214 Indeed, parse/case on [line 137](https://github.com/red/red/blob/master/modules/view/RTD.red#L137) would have fixed the first case also. 13:34@dockimbel Might it actually be intended result (for performance?), and to avoid it we have just to use case or additional check on type? dockimbel 14:33@toomasv Yes, it was intended, along with a /strict extra refinement, which is currently merged in /case for implementation reasons. We probably need to revisit those choices, if they cause more issues than help. 14:36There is a bunch of changes/addition that are waiting in the pipe to be applied to Parse, so we should cover those all together in a single upgrade pass over Parse's code. toomasv 14:56@dockimbel Ok, thanks! Friday 28th December, 2018 toomasv 08:23Is this a bug in block find?: >> index? find/tail [a b c d e f] [c d e] == 4 >> index? find/tail "abcdef" "cde" == 6 In REBOL: >> index? find/tail [a b c d e f] [c d e] == 6 dockimbel 08:31@toomasv Looks like a bug yes, please log it in a ticket, should be a quick fix. toomasv 08:31OK, thanks. #3686 luce80 19:56I downloaded Red 0.6.4 for Windows built 25-Dec-2018/12:56:39+01:00 commit #67a6bffon Win7 and freshly compiled libRED.dll and then mandelbrot.red does not draw. 9214 20:03@luce80 compile in release mode instead. Saturday 29th December, 2018 hiiamboris 14:32@xqlab shouldn't you somehow check against going upwards in the tree? 9214 14:35 @xqlab I'd suggest to use /help room instead, unless you are really confident (and if you are, then try to narrow it down a bit further) that there's a bug somewhere in your snippet. amreus 18:15@toomasv Since your analysis, do issues still need to be filed for these two rich-text bugs? 9214 18:17@amreus https://github.com/red/red/pull/3684 18:19These issues pointed out a caveat in how Parse handles any-string! matching, so there is a pending design decision to be made in that regard. amreus 18:20@9214 Ok good. I was looking for them in the issues. Thanks. 9214 18:20No problem. Thanks for finding them in the first place :wink: Sunday 30th December, 2018 toomasv 08:35@amreus My fix is merged in new build and it works. However, I see some other problems, which need fixing. One concerns s and u in style path with color, e.g. u/red ["xxx"]or s/b/green/i ["xxx"]. In these cases, i.e. when s or u start the path, the color is not rendered, although it is included in data, e.g. 1x3 underline 255.0.0 and 1x3 italic bold strike 0.255.0 for cases above. These are exactly the cases where strike or underlineappear immediately before the color tuple in data. The problem can be overcome with e.g. u red ["xxx"] /u or changing the order of styles in longer path, e.g. i/s/b/green ["xxx"]. In both cases the order of styles in data will be different -- in first case color appears before strike or underline, in second case italic or bold appear immediately before color tuple. I can't say where is the source of the problem though. Another problem is also with paths -- when color-word does not end the path, but appears somewhere earlier, and this path is not the last element to be processed, then color is not integrated with other styles in path, and similar problem appears as earlier -- some things get overwritten with wrong colors. This bug concerns my fix to pop-all. 09:27^ This is on W10. Don’t know about other. 15:04OK, most of this would be cleared with following changes: 1) To prevent underline or strike to be positioned immediately before color-tuple, let's transfer color-setting before other styles in [pop-all](https://github.com/red/red/blob/master/modules/view/RTD.red#L101). pop-all: function [mark [block!]][ first?: yes if col [pop-color] ; <-- TO HERE while [mark <> tail stack][ pop last stack either first? [first?: no][remove skip tail out -2] ] ;if v [pop-color] FROM HERE --^ ] 2) Notice that v is changed to col above. That's because v is set to none on each style in path (line 46 below) and so color was not added if it appeared in earlier places in path. To fix it I introduced new marker col, which is set to none just once while entering path ([line 45](https://github.com/red/red/blob/master/modules/view/RTD.red#L45)), and to yes if color is seen in the styles path ([line 48](https://github.com/red/red/blob/master/modules/view/RTD.red#L48)). | ahead path! into [ (col: none mark: tail stack) some [ ; <-- LINE 45 (v: none) ; <-- LINE 46 s: ['b | 'i | 'u | 's | word! if (tuple? attempt [v: get s/1])] (either v [col: yes push-color v][push s/1]) ; <-- LINE 48 ] ] nested (pop-all mark) 3) optimize func which is meant to join styles with same indexes, actually worked on first one only and ignored further cases because of miscalculated jump on [line 117](https://github.com/red/red/blob/master/modules/view/RTD.red#L117). My proposal is to replace next there with skip: ; e: next move/part s pos offset? s back e ; CURRENT e: skip move/part s pos l: offset? s back e l ; PROPOSED In my expereiments this works well. 4) A readability problem -- while popping colors new-line was not set. I propose to insert one on [line 64](https://github.com/red/red/blob/master/modules/view/RTD.red#L64): pop-color: has [entry pos][ entry: skip tail color-stk -3 repend out [as-pair entry/1 tail-idx? - entry/1 entry/3] new-line skip tail out -2 on ; <-- HERE clear entry ] These fixes correct the second problem mentioned in previous post and circumvent the first one without removing the root cause, which is above my head. If ever strike or underline will appear immediately before color-tuple in data, color is not rendered, e.g. after introducing above fixes, the bug will still affect cases like this: view [rich-text data [s [red "bbb"]]] ;But not this view [rich-text data [s [red ["bbb"]]]] 15:18That's because in first case color is closed in the end of processing only, and is then united to strike in optimization phase, but on second case color is closed immediately, and strike is united to it. hiiamboris 15:46@toomasv You seem to have dismantled that RTD to bits already ☺ Nice job! I expect soon it will become reliable enough for even the most complex of tasks. toomasv 15:56@hiiamboris Long way to go still! We need nice scrolling-bars handling and automatic key events for it. :) hiiamboris 19:36Is this not a bug? >> arctangent 0.1 == 5.710593137499643 >> arctangent 10% == -89.99999996664947 >> arctangent 10.0 == 84.28940686250037 >> arcsine 0.1 == 5.739170477266787 >> arcsine 10% *** Math Error: math or number overflow *** Where: arcsine *** Stack: 19:37I expected percent be treated same as float, but I can't make any sense of it at all. toomasv 20:00Hmm >> arctangent -1717986737.680019 == -89.99999996664947 Monday 31st December, 2018 hiiamboris 00:20I require a volunteer for GC bug safari. Here's a snippet with instructions https://gitlab.com/snippets/1793901 Can anyone confirm that? 9214 01:11@hiiamboris no crash on Linux (both with old Dec 8 build and the latest one). Index table is formed and printed out without a fuss. hiiamboris 01:29Hmm... elusive, this one. I tried 6-7 different builds, all of them crash. It looks like compiling the console with Needs: View enabled and -d flag makes it crash sooner (25kB output only, of the whole 12MB): *** Runtime Error 1: access violation *** in file: /D/devel/red/red-src/red/runtime/parse.reds *** at line: 499 *** *** stack: red/parser/loop-bitset 02D416BCh 02D5BC64h 0 -1 0018F750h 0 *** stack: red/parser/loop-token 02D416BCh 02D5BC64h 0 -1 0018F750h 0 0 *** stack: red/parser/process 02D416BCh 02A804E4h 0 0 02A804C4h *** stack: red/natives/parse* false -1 0 -1 *** stack: red/interpreter/eval-arguments 02B805C4h 02D5C81Ch 02D5C81Ch 00000000h 00000000h *** stack: red/interpreter/eval-code 02B805C4h 02D5C7FCh 02D5C81Ch false 00000000h 00000000h 02B805C4h *** stack: red/interpreter/eval-expression 02D5C7FCh 02D5C81Ch false false false *** stack: red/interpreter/eval 02A80494h false *** stack: red/natives/forall* false *** stack: red/interpreter/eval-arguments 02B80364h 02D5C4CCh 02D5C4CCh 00000000h 00000000h *** stack: red/interpreter/eval-code 02B80364h 02D5C4ACh 02D5C4CCh false 00000000h 00000000h 02B80364h *** stack: red/interpreter/eval-expression 02D5C4ACh 02D5C4CCh false false false *** stack: red/interpreter/eval 02D5C3C8h true *** stack: red/interpreter/eval-function 02A803F4h 02D5C3C8h *** stack: red/_function/call 02A803F4h 00393884h *** stack: red/interpreter/eval-code 02A803F4h 02D5C258h 02D5C258h false 00000000h 00000000h 02B86E54h *** stack: red/interpreter/eval-expression 02D5C248h 02D5C258h false false false *** stack: red/interpreter/eval 02A803C4h false *** stack: red/natives/foreach* false *** stack: red/interpreter/eval-arguments 02B80354h 02D5C114h 02D5C114h 00000000h 00000000h *** stack: red/interpreter/eval-code 02B80354h 02D5C0E4h 02D5C114h false 00000000h 00000000h 02B80354h *** stack: red/interpreter/eval-expression 02D5C0E4h 02D5C114h false false false *** stack: red/interpreter/eval 02D5BFE0h true *** stack: red/interpreter/eval-function 02A80354h 02D5BFE0h *** stack: red/_function/call 02A80354h 00393884h *** stack: red/interpreter/eval-code 02A80354h 02D408E0h 02D40910h false 00000000h 00000000h 02B86E24h *** stack: red/interpreter/eval-expression 02D408E0h 02D40910h false false false *** stack: red/interpreter/eval 02A80334h true *** stack: red/natives/catch* true 1 *** stack: ctx473~try-do 003B1DF0h *** stack: ctx473~launch 003B1DF0h 9214 01:36And it works as expected with recycle/off? hiiamboris 01:46Yep. 01:48I need to somehow make a smaller snippet, but I grew bored with it today ;) Better luck tomorrow maybe. Thanks for testing it @9214 dockimbel 03:58@toomasv Great work on reverse-engineering RTD and fixing issues! :+1: toomasv 04:04:smile: 14:16Some thoughts more on RTD. Currently, if colors which where open in the beginning are closed in the end then other colors which where inserted in between are overwritten. Like this: view [rich-text data [ "black " red "red " green ["green " blue ["blue "]] "red" ]] [![rt-colors1](http://vooglaid.ee/red/rt-colors1-1.png)](http://vooglaid.ee/red/rt-colors1-1.png) To prevent this, unclosed colors should be inserted in the begenning of the out block in [close-colors](https://github.com/red/red/blob/master/modules/view/RTD.red#L67): close-colors: has [pos][ pos: tail color-stk while [pos: find/reverse pos '_][ pos/1: tail-idx? insert out as-pair pos/-1 tail-idx? - pos/-1 insert next out pos/2 new-line skip out 2 on pos: remove/part skip pos -1 3 ] ] [![rt-colors2](http://vooglaid.ee/red/rt-colors2-1.png)](http://vooglaid.ee/red/rt-colors2-1.png) The above rich-text will be better with this change, but not perfect, because, similar problem affects colors, which are immediately closed, but nested. To fix this, [optimize](https://github.com/red/red/blob/master/modules/view/RTD.red#L110) func may be made to sort styles: optimize: function [][ ;-- combine same ranges together parse out [ any [ cur: pos: pair! (range: pos/1) [to pair! e: pos: | to end e:] any [ to range s: skip [to pair! | to end] e: ( s: remove s e: skip move/part s pos l: offset? s back e l ;!!! tom 30.12.2018 ) :e ]( pos: :cur mov: no while [pos: find/reverse pos pair!][ case [ any [ pos/1/1 > cur/1/1 all [pos/1/1 = cur/1/1 pos/1/2 > pos/1/2] ][ mov: yes pos1: :pos if head? pos1 [ move/part cur pos1 offset? cur e break ] ] any [mov head? pos] [ move/part cur pos1 offset? cur e break ] 'else [break] ] ] ) ] ] ] With this the above view snippet will show perfectly. [![rt-colors3](http://vooglaid.ee/red/rt-colors3-1.png)](http://vooglaid.ee/red/rt-colors3-1.png) hiiamboris 17:54https://github.com/red/red/issues/3692 on the GC/parse crash I have cast in stone the set of files that lead to the bug appearing, but that's as far as I can get it. Hopefully @dockimbel will be lucky enough to reproduce it. greggirwin 20:06More good research @toomasv and @hiiamboris. Thanks for that.`
