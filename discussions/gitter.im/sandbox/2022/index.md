# Archived messages from: [gitter.im/red/sandbox](/gitter.im/red/sandbox/) from year: 2022

## Saturday 1st January, 2022

gltewalt

[07:57](#msg61d0095346529077f5624c9c)Roughly hewn as I sampled wines and listened to fireworks outside. Admonishments welcome.  
https://gist.github.com/gltewalt/e68bfabacfe5747909976f0f989c1e3b

greggirwin

[20:39](#msg61d0bc186d9ba233289e92b9)Looks very clean to me! :+1:

gltewalt

[23:49](#msg61d0e8a32a210c38c1a9bf32)@greggirwin  
I don;t think that `remove-each` is workable in functions `get-cards` and `check-for-books`, where I use `take/part i length? i`  
Is it?

## Sunday 2nd January, 2022

greggirwin

[00:03](#msg61d0ebbcd41a5853f92d1a5d)I'd have to review the code in detail, which will have to wait for another day.

gltewalt:matrix.org

[00:04](#msg61d0ebf85ee4df335ac3a82c)Yeah.  
It works as is, but leaving behind "" elements is a wart

## Thursday 6th January, 2022

gltewalt

[06:08](#msg61d687609a335454060b2d3e)Can you folks see this with a direct link?

[06:08](#msg61d6876282a4667b25605c27)https://github.com/gltewalt/go-fish

rebolek

[06:11](#msg61d68816742c3d4b2182bffd)404

gltewalt

[06:13](#msg61d6886df5a3947800ef3d17)ok

[06:31](#msg61d68cad742c3d4b2182c7f5)Should be public now.  
For a few days. I figured it was better than a gist for saving in the cloud, until I'm done poking at it

toomasv

[12:47](#msg61d6e4c59a335454060be76c)Nice pic!

gltewalt

[19:25](#msg61d74231742c3d4b2184653b)Let me move to red/help. Experiment in code review if anybody has the time and the inclination

## Saturday 8th January, 2022

ne1uno

[02:06](#msg61d8f1b0526fb77b316aedb1)I'm doing an old advent of code with json, https://adventofcode.com/2015/day/12

[02:06](#msg61d8f1b19a3354540610451d)is there any way around case insensitive keys?

[02:10](#msg61d8f2ab2a210c38c1b9885d)help should probably warn about potential data loss if not

gltewalt:matrix.org

[02:18](#msg61d8f4759b470f3897568213)Constrain any IO to one case or another?

[02:19](#msg61d8f4c82a210c38c1b98c1e)Ah, I just read it

ne1uno

[02:21](#msg61d8f5189b470f3897568309)yea. I'll probably pre-process the keys, but it wasn't obvious why I wasn't able to see everything at first

gltewalt:matrix.org

[02:21](#msg61d8f547bfe2f54b2e093c3b)Ah, yes. Help should probably mention it

ne1uno

[02:22](#msg61d8f55b742c3d4b2187d161)for some reason I thought map keys were case sensitive

greggirwin

[02:55](#msg61d8fd1ad143b14f83075a12)When in doubt, read the docs: https://github.com/red/docs/blob/master/en/datatypes/map.adoc

ne1uno

[03:06](#msg61d8ffbb2a210c38c1b99d84)thanks, will try get/case

gltewalt:matrix.org

[04:06](#msg61d90dcc7842bd3ca9360af2)Amazing what a person (me) forgets

ne1uno

[04:09](#msg61d90e81526fb77b316b1f78)https://codegolf.stackexchange.com/questions/195476/extract-all-keys-from-an-object-json --spoiler--

gltewalt:matrix.org

[04:25](#msg61d9124e526fb77b316b2505)y: to-map x  
keys-of y

ne1uno

[04:30](#msg61d913627842bd3ca93614c2)needs recurse, some keys are maps or blocks etc

## Sunday 9th January, 2022

gltewalt

[01:36](#msg61da3c2a46529077f575cf6e)`parse trim/with form load/as %test.json 'json "#(^/)"` \[do your stuff]

ne1uno

[01:55](#msg61da40a17842bd3ca9382520)nice flatten for maps, I'm still getting same wrong sum

gltewalt:matrix.org

[02:06](#msg61da4328742c3d4b218a1ceb)For which thing? Advent?

ne1uno

[02:13](#msg61da44b79a335454061291f6)yes. wondering if load-json is missing the last map. haven't tried older version yet

gltewalt

[03:10](#msg61da520ae1a1264f0a487c77)

```
>> blk: load form load trim/with form load/as %advent.json 'json "#()^/,:"
== [e e 86 c 23 a a 120 169 green red orange b red g yellow b yellow d red f -1...
>> foreach i blk [if integer? i [append nums: [] i]]
== none
>> nums
== [86 23 120 169 -19 -47 2 59 47 43 168 78 82 -41 2 77 147 49 -1 142 136 166 -...
```

[03:10](#msg61da5235bfe2f54b2e0b9978)try `load/as 'json`

[03:11](#msg61da525c5dc6213cd4d14093)Those load form things flatten blocks

gltewalt:matrix.org

[03:15](#msg61da53596d9ba23328b0f96a)And it isn't like I knew up front how many I needed or the order. It was a "look, then chisel away at it" process

ne1uno

[03:17](#msg61da53af742c3d4b218a39bd)there are a dozen or more different puzzle inputs, mine may have just stopped loading half way for some reason as a string. `load/as` does error at the place the string stopped

gltewalt:matrix.org

[03:18](#msg61da541782a4667b2567c2de)I logged in and did that day. Pasted their data into a text file and save it

[03:19](#msg61da543c6d9ba23328b0fb17)First attempt at pasting into a text file bogged down though

ne1uno

[03:21](#msg61da54aa5dc6213cd4d14362)https://pastebin.com/PFA0zwNf

[03:22](#msg61da54e546529077f575f5a0)there's a coma between two objects may be the problem

[03:23](#msg61da55387842bd3ca9384657)probably not standard json either

gltewalt

[03:33](#msg61da57752a210c38c1bbf0b8)copy this long-ass thing and save it in a txt file

[03:33](#msg61da5777f5a3947800f69fdb)https://gist.github.com/gltewalt/b840a8beb749fdd71ff7c0b646303720

[03:33](#msg61da579cd41a5853f93f1def)That is part 1

[03:34](#msg61da57cc742c3d4b218a41a0)my shortcut way won't work for part 2

ne1uno

[03:40](#msg61da59312a210c38c1bbf358)no for pt#2 valid json parsing will work better, I looked on on the reddit solution thread.

gltewalt

[03:42](#msg61da59ac2a210c38c1bbf429)I don't know how to solve part 2

[03:43](#msg61da59fa5dc6213cd4d14b53)When I tried to go through all the days a couple years ago I fell in to the same trap of hacking my way through a part 1, only to see it woulnt work for part 2

ne1uno

[03:45](#msg61da5a489a3354540612b25c)solving for the examples usually sets you up well for part 2

gltewalt

[03:45](#msg61da5a5f7842bd3ca9384df8)Not when you're a little nutty and lazy like me

[03:46](#msg61da5a9e9b470f389758fbf7)first instinct is "be hacky"

ne1uno

[03:47](#msg61da5ac6742c3d4b218a46ba)they get more complicated after the first week. I am stuck on part one usually

[03:50](#msg61da5b709a3354540612b3f5)some are too memory/cpu intensive to solve without shortcuts

gltewalt

[04:05](#msg61da5f1b526fb77b316d6bd6)Might be a start:  
`nested-block: load trim/with form load/as %advent.json 'json "#()^/"`

[04:12](#msg61da609582a4667b2567d601)Nope... don't know how to solve it.

ne1uno

[04:21](#msg61da62b4d41a5853f93f3061)nested block probably simpler than map, `mold/all/flat` maybe

gltewalt

[05:13](#msg61da6ef982a4667b2567ec86)Hmm, if you save the file with .json, don't need load/as, just load

ne1uno

[05:22](#msg61da71139b470f3897591dd4)@rebolek tools worked, flatten load-json/flat read file

[05:23](#msg61da714ebfe2f54b2e0bcbbe)red-lang doesn't have flatten or load-json/flat

[05:25](#msg61da71b4f5a3947800f6c9cd)then just loop over blocks. part#2 don't flatten and skip blocks contain red?

[05:28](#msg61da72746d9ba23328b12b56) I see now part 2 will need to look more closely at types

gltewalt

[05:31](#msg61da734846529077f57627db)"Ignore any object (and all of its children) which has any property with the value "red"."  
Which is anything between `{` and `}`

ne1uno

[05:37](#msg61da7485bfe2f54b2e0bd115)flatten red https://gist.github.com/toomasv/f9730db91c365bf1ed94453028bfc1c0

[05:38](#msg61da74e1f5a3947800f6cf27)form is probably too aggressive as flatten

gltewalt

[05:47](#msg61da76da82a4667b2567f8f4)It would be between `#(` and `)` for objects, since red converts into map

[06:10](#msg61da7c712a210c38c1bc2f3c)Maybe this, using toomas flatten:

[06:11](#msg61da7c7c9a3354540612ea12)

```
>> j:  load %advent.json
== #(
    e: [[#(
        e: 86
        c: 23
        a: #(
            a: [120...
>> j: replace/all form j "#(" "["
== {e: [[[^/    e: 86^/    c: 23^/    a: [^/        a: [120 169 "green" "red" "...
>> j: replace/all form j ")" "]"
== {e: [[[^/    e: 86^/    c: 23^/    a: [^/        a: [120 169 "green" "red" "...
>> flat: flatten load j
== [e: 
    e: 86 
    c: 23 
    a: 
    a: 120 169 "green" "red" "orange"
```

ne1uno

[06:26](#msg61da801e742c3d4b218a8512) j: replace/all form j "#(" "['o "

[06:27](#msg61da804fe1a1264f0a48c514)then will have a hope of excluding any of the right objects

[06:28](#msg61da80745ee4df335ad60f29)flatten/level might be useful

gltewalt:matrix.org

[06:28](#msg61da8087742c3d4b218a8598)Like a level 1 maybe

ne1uno

[07:26](#msg61da8e0ad41a5853f93f7568)will be simpler 2 pass, remove all the objects required, then handle like pt#1

toomasv

[14:32](#msg61daf1f89a3354540613b089):point\_up: \[January 9, 2022 5:21 AM](https://gitter.im/red/sandbox?at=61da54aa5dc6213cd4d14362)  
@ne1uno this loads ok here.

[15:19](#msg61dafd06d41a5853f940337f)A recursive func checking three types suffices to solve 12/2.

## Monday 10th January, 2022

gltewalt:matrix.org

[01:13](#msg61db88552a210c38c1be088a)How are you going to recurse through a map?

ne1uno

[01:17](#msg61db8912742c3d4b218c5009)values-of

toomasv

[06:24](#msg61dbd138526fb77b316ff59a)I used `values-of` for checking "red", `keys-of` for recursing, but `values-of` an be used for both, yes.

## Wednesday 12nd January, 2022

gltewalt

[01:13](#msg61de2b2e742c3d4b21921642)how's this for a `unique-each` ? (Or maybe some other name)

```
unique-each: func [blk [block! hash!]][
    forall blk [
        case [
            string? blk/1 [blk/1: unique blk/1]
            block? blk/1 [blk/1: unique-each blk/1]
        ]
    ]
    head unique blk 
]

list: make hash! [a a ["BBB" ["cc" [d d]]]]
>> unique-each list
== make hash! [a ["B" ["c" [d]]]]
>> unique-each [a b b [c c] ["dd"]]
== [a b [c] ["d"]]
```

[01:18](#msg61de2c5982a4667b256fc023)or just a `unique-deep`:

```
unique-deep: func [blk [block! hash!]][
    forall blk [
        if block? blk/1 [blk/1: unique-deep blk/1]
    ]
    head unique blk 
]
```

[01:19](#msg61de2c977842bd3ca9401ad5)

```
>> unique-deep [a a b [c d d] [e [f f] e]]
== [a b [c d] [e [f]]]
```

[01:23](#msg61de2d7ae1a1264f0a506f55)@toomasv @greggirwin

greggirwin

[04:35](#msg61de5a74d41a5853f94758a0)What about adding `/deep` to something like this, so it's generalized?

```
change-all: func [
	"Change each value in the series by applying a function to it"
	series  [series!]
	fn      [any-function!] "Function that takes one arg"
][
	forall series [change/only series fn first series]
	series
]
```

gltewalt:matrix.org

[04:53](#msg61de5edabfe2f54b2e13d0a5)I cant recall atm if unique accepts all series.

[05:12](#msg61de6351f5a3947800ff15c8)There's a valley that lies between generality and specificity, and the shadows that it holds befuddle my sense of direction

[05:39](#msg61de69a26d9ba23328b97dd1)An aside, the code that I formatted above via that browser looked fine, but through matrix it's all wonky.  
What do you see?

greggirwin

[06:07](#msg61de702546529077f57e7a17)Looks fine on Gitter.

Even if `unique` doesn't (it's `[hash! block! string!]`), HOF wrappers don't have to be concerned with that. It's on the user to match their data to their funcs.

gltewalt:matrix.org

[06:16](#msg61de725046529077f57e7e55)When's the right time for generality? Do you have graphs or things that aide you with the decision, or is it a matter of a lot of experience?  
What guides you?

toomasv

[15:31](#msg61def466742c3d4b2193a239)Some time ago I added two bits to rosettacode: \[sieve of Eratosthenes](https://rosettacode.org/wiki/Sieve\_of\_Eratosthenes#Red) and \[prime generator/checker/counter](https://rosettacode.org/wiki/Extensible\_prime\_generator#Red). Any improvements to these?

## Thursday 13th January, 2022

gltewalt:matrix.org

[00:48](#msg61df76c6d41a5853f949b548)I'm not qualified to suggest anything with math.  
If we had Ranges, it would be even fewer lines, though

[00:48](#msg61df76f1d41a5853f949b57a)Bitset is efficient

gltewalt

[01:47](#msg61df84975dc6213cd4dc0a9d)What is `q` in it?

[01:47](#msg61df84add41a5853f949cf93)

```
primes: function [n [integer!]][
   poke prim: make bitset! n 1 true
   r: 2 while [r * r <= n][
      repeat q n / r - 1 [poke prim q + 1 * r true] 
      until [not pick prim r: r + 1]
   ]
   collect [repeat i n [if not prim/:i [keep i]]]
]
```

toomasv

[06:28](#msg61dfc6a246529077f58143bd)@gltewalt Thanks for looking into it! `q` is traversing over bitset, `r` is last prime found, `n` is top until which to look for primes.

gltewalt:matrix.org

[07:30](#msg61dfd5086d9ba23328bc73b7)Oh that's embarrassing. I hardley ever use repeat, and forgot that it sets iterator word.  
I was thinking "where did q come from?" lol

[07:33](#msg61dfd5c32a210c38c1c7456c)A gui version would be cool, and could post animated gif for the result example if rosetta site allows them.  
Similar to this:

[07:33](#msg61dfd5d99b470f3897645257)\[Sieve\_of\_Eratosthenes\_animation.gif](https://gitter.ems.host/\_matrix/media/v1/download/matrix.org/mPQAwiaRBdzfvJlxSnwGISXW)

[07:40](#msg61dfd7769b470f389764553b)Loop &lt;number&gt;  
vs.  
Repeat &lt;word&gt; &lt;number&gt;

toomasv

[07:48](#msg61dfd9587842bd3ca9437cfa)Nice visualisation!

[12:22](#msg61e019986d9ba23328bcff30)Challenge accepted:  
\[!\[sieve](https://toomasv.red/images/Animations/sieve.gif)](https://toomasv.red/images/Animations/sieve.gif)

pekr

[12:26](#msg61e01a7982a4667b2573b5ec)Excellent :-)

rebolek

[12:26](#msg61e01a845dc6213cd4dd2c75)yes, really nice :)

hiiamboris

[12:28](#msg61e01aea5ee4df335ae1c6d8):clap:

toomasv

[12:41](#msg61e01de2742c3d4b219612e9)Thanks! Here is another:  
\[!\[sieve2](https://toomasv.red/images/Animations/sieve2.gif)](https://toomasv.red/images/Animations/sieve2.gif)

hiiamboris

[13:03](#msg61e023255ee4df335ae1d65f)this is cleaner

gltewalt:matrix.org

[13:05](#msg61e023a1f5a394780002acdf)Yes, the second one

toomasv

[13:12](#msg61e0254a9a335454061e99e4)Agreed. And, sorry, one more - primes up to 1200 in 30 cols:  
\[!\[sieve3](https://toomasv.red/images/Animations/sieve3.gif)](https://toomasv.red/images/Animations/sieve3.gif)

gltewalt:matrix.org

[14:51](#msg61e03c76e1a1264f0a54a561)Awesome

toomasv

[15:26](#msg61e0448e82a4667b257411fb):)

greggirwin

[19:39](#msg61e07fe85ee4df335ae2b22c)This would make a great blog entry.

toomasv

[21:02](#msg61e093729b470f389765f98c)This was an exercise with diagram dialect, at least partly. Not ready for blogging yet.

greggirwin

[21:03](#msg61e093b45ee4df335ae2e0f9)Ooooh. Now I'm \*really* intrigued. It's something I wouldn't have imagined could be done, which is great.

## Monday 17th January, 2022

gltewalt

[07:36](#msg61e51c96d41a5853f954a5ad)anyone want to fix this, or make it shorter or prettier?  
https://rosettacode.org/wiki/Go\_Fish#Red

greggirwin

[15:38](#msg61e58d6ad41a5853f95585c2)Is there a way in RC to see which tasks are viewed most often? Those are where we'll get the biggest ROI.

gltewalt:matrix.org

[19:27](#msg61e5c321bfe2f54b2e22550d)I dont know

hiiamboris

[19:38](#msg61e5c5b946529077f58d135c)tried google? https://www.reddit.com/r/ProgrammingLanguages/comments/lj48jw/rosetta\_code\_tasks\_ranked\_by\_most\_language/

gltewalt:matrix.org

[19:41](#msg61e5c67ee1a1264f0a5f6281)No I hadn't because I've been busy

greggirwin

[20:01](#msg61e5cafd2a210c38c1d2d6ae)That doesn't say how often they're \*viewed* though.

hiiamboris

[20:16](#msg61e5ce946d9ba23328c81677)indeed, but it must correlate

greggirwin

[20:28](#msg61e5d16d5ee4df335aecfa8f)I don't think so. It may even be inverse. That is, the less langs that have it the more we stand out, and the harder those tasks may be, showing us off more. The goal is to be seen more, not be in the most crowded places.

hiiamboris

[20:36](#msg61e5d3527842bd3ca94f2d4c)Showing off doesn't correlate, in fact to show off we should pick the simplest tasks I think, where Red strikes with one-liner, a few max.  
But how often they are viewed should correlate with how often someone adds a solution.

greggirwin

[20:37](#msg61e5d39ad143b14f8320cb5f)Popular solutions are what were the easiest to do I imagine. Hence `hello world` far in the lead.

gltewalt

[20:38](#msg61e5d3c95ee4df335aecff85)There are a lot of the easiest in the most viewed. Except for the sieve

greggirwin

[20:39](#msg61e5d3fb6d9ba23328c821ee)So there is a most viewed filter/page?

gltewalt

[20:40](#msg61e5d44f6d9ba23328c822a3)Oh, not viewed. But.. correlation

[20:45](#msg61e5d576f5a39478000db49d)How useful would something like this be to you if it was "built in"?

```
equal-length?: function [
    v1 [series!]
    v2 [series!]
][
    equal? length? v1 length? v2
]
```

ne1uno

[20:51](#msg61e5d6c86d9ba23328c82798)Red‏‎ (154 members) Rust‏‎ (852 members) they turned it into a task

[20:51](#msg61e5d6c82a210c38c1d2f507)https://rosettacode.org/wiki/Rosetta\_Code/Rank\_languages\_by\_number\_of\_users

greggirwin

[20:52](#msg61e5d72082a4667b257f1b02)@gltewalt I can only say I don't have it in either my Red or R2 series libs. So probably nut much value to me as standard.

ne1uno

[20:53](#msg61e5d74f2a210c38c1d2f5e8)return \[-1 0 1 ] less equal or more

gltewalt

[20:58](#msg61e5d8916d9ba23328c82b1b)How about the REBOL `array` function? That seems handy.  
`array/initial 10 'closed`

greggirwin

[21:04](#msg61e5d9e4f5a39478000dbd98)`Array` has come up. I have a Red version. It's an unfortunate name, because it's simply prefilling/allocating.

gltewalt:matrix.org

[21:13](#msg61e5dbfb46529077f58d4757)https://rosettacode.org/wiki/Category:Solutions\_by\_Programming\_Task

[21:18](#msg61e5dd1b6d9ba23328c834c9)Could pick what should be the hardest programming tasks, and see how Red does

## Tuesday 18th January, 2022

gltewalt

[00:12](#msg61e605f3526fb77b3184bd0c)Is this valid for the 24 Game?  
There's already an entry for it, but I thought I'd try with simple `parse`

https://gist.github.com/gltewalt/6a8d71ad7f87b6b8cbfed8203fab6f34

[00:14](#msg61e60678742c3d4b21a1a335)strictly left to right

ne1uno

[00:40](#msg61e60c7b6d9ba23328c89909)`random/seed now/time/precise`

gltewalt

[02:03](#msg61e61ff8526fb77b3184f24d)I don't think seeding is necessary because it allows for repeated numbers?

ne1uno

[02:33](#msg61e626fe5dc6213cd4e8f57b)not seeding/seeding with known seed is sometimes useful to repeat sequences while debugging. usually you want more random in a game

gltewalt:matrix.org

[04:16](#msg61e63f02f5a39478000e8b19)Seems like the one that is already posted could be less wordy.

https://rosettacode.org/wiki/24\_game#Red

hiiamboris

[09:24](#msg61e6873d2a210c38c1d46538)Red seeds by default

ne1uno

[12:29](#msg61e6b2baf5a39478000f8b85)^habit

[13:03](#msg61e6ba8e5dc6213cd4ea48e4)work in progress https://usercontent.irccloud-cdn.com/file/rmkwcU2N/mandala-3d.png

gltewalt:matrix.org

[13:04](#msg61e6baf2bfe2f54b2e247eb4)👍

toomasv

[14:50](#msg61e6d3c746529077f58f6044)@ne1uno Interesting!

gltewalt:matrix.org

[17:15](#msg61e6f5afd143b14f8323558d)If it seeds by default it hasn't behaved like it. Based on recent experiences.

hiiamboris

[17:21](#msg61e6f703526fb77b3186d9a9)confirmed, it regressed

[17:33](#msg61e6f9d56d9ba23328cab710)actually I can't find any commits that seeded it, nor a build that seeds automatically

[17:33](#msg61e6f9ec9a335454062c5a78)but I have a strong memory that at some point we switched to auto seeding

[17:33](#msg61e6f9fe7842bd3ca951bcc8)so don't mind me I am probably a visitor from parallel universe anyway :)

gltewalt

[18:12](#msg61e70312e1a1264f0a6225ae)Well you could be right, or it was on a "to do" list

greggirwin

[19:38](#msg61e71736d143b14f8323a70c)AFAIK Red follows Rebol and always starts with the same seed. If you want to randomize, you have to do that yourself. There was a whole R2 thread, long long ago, about what seed was best.

hiiamboris

[19:46](#msg61e71905d41a5853f959005c)but surely auto seeding is more user friendly, don't you think? we're not in 80s

greggirwin

[20:04](#msg61e71d5f7842bd3ca95211e0)I don't remember if there was a reason Carl chose not to, but it does seem like the better choice today.

[20:05](#msg61e71d767842bd3ca95211fc)It does help when testing, but that's where seeding yourself also makes the intent clear.

Respectech

[21:58](#msg61e737fe82a4667b258220f2)I vote that for `random` auto-seeding should be the default and user-seeding should be the option.

greggirwin

[22:53](#msg61e744ea9b470f3897735691)It's possible that Carl didn't do it because it was another thing to do on startup, and he wanted Rebol to start as instantly as possible. CGI was a big use case at the time, which he mentioned more than once.

[22:54](#msg61e7450ad143b14f83240f58)Also why there were so many kernel options to build against when encapping.

hiiamboris

[23:41](#msg61e7501782a4667b2582547a)hmm it's like 1/100000000th of program's startup time or what? ☻

## Wednesday 19th January, 2022

greggirwin

[00:04](#msg61e7558f2a210c38c1d64fb5)Old habits die hard.

ne1uno

[00:13](#msg61e757917842bd3ca952914d)there is no universally available random source. leave seeding to users gives them the actual options. do any languages call them any thing other than pseudo random? being slightly more random conveys a false sense of security.

greggirwin

[00:14](#msg61e757e5e1a1264f0a62e057)Red offers the basics (Mersenne Twister and `/secure`), and users can always write their own. If a new one becomes popular enough, it can be added as a refinement.

## Thursday 3th March, 2022

ne1uno

[20:29](#msg622125409a09ab24f389090e)https://github.com/red/red/wiki/red-run-checklist

greggirwin

[20:44](#msg62212899e9cb3c52aefb2f6c)@ne1uno :+1:

## Monday 18th July, 2022

GiuseppeChillemi

[17:27](#msg62d597e5d3c8894f7187dc51)I often use code as scratchpad: if I have an idea and I am in the editor, I test the idea where I am actually coding, just between a sections where I can put it.  
To avoid having any interference creating words, I isolate the section and execute it with with:

```
isolating: func [
	"Executes a block with all locals"
	body "The body (WARNING: Modified by Bind)"
] [
 body: function [] body
 body 		
]
```

So you can:

```
x: 33
isolating [x: 99 <... my code here>]
probe x
> 33
```

Just to share with you to see if you like this one.

rebolek

[18:08](#msg62d5a1b59f73251a2c55a219)very nice example

## Friday 19th August, 2022

GiuseppeChillemi

[19:16](#msg62ffe19ccf6cfd27af0c696a)I have created a little \[sort-by-length](https://gist.github.com/GiuseppeChillemi/8574182a514e0c32f1ab2ece0f60a497) function:

It normally sorts from smallest to biggest

```
inn-data: ["aaa" "aaaaaaa" "aaaaaaaaaaa" "a"]
probe sorted-series: sort-by-length inn-data
;---RESULT---
["a" "aaa" "aaaaaaa" "aaaaaaaaaaa"]
```

It could be reversed

```
inn-data: ["aaa" "aaaaaaa" "aaaaaaaaaaa" "a"]
probe sorted-series: sort-by-length/reverse inn-data
;---RESULT---
["aaaaaaaaaaa" "aaaaaaa" "aaa" "a"]
```

It generates an error if the other elements are not of the same datatype of the first one:

```
inn-data: ["aaa" "aaaaaaa" "aaaaaaaaaaa" "a"]
append/only inn-data [1]
probe sorted-series: sort-by-length inn-data
;---RESULT---
Function: Sort-by-Length
	Element at index: 5 is: block!
	expected: string!
```

...But a `/safe` refinement exists to sort any kind of series

```
inn-data: ["aaa" "aaaaaaa" "aaaaaaaaaaa" "a"]
append/only inn-data [1]
probe sorted-series: sort-by-length/safe inn-data
;---RESULT---
["a" [1] "aaa" "aaaaaaa" "aaaaaaaaaaa"]
```

It throws an error if a datatype which is not a series is found

```
inn-data: ["aaa" "aaaaaaa" "aaaaaaaaaaa" "a"]
append/only inn-data 1
probe sorted-series: sort-by-length inn-data
;---RESULT---
Function: Sort-by-Length
	Element at index: 5 is: integer!
	should be a SERIES!
```

Note: `throw` does not work in Red but a printout is generated for the error condition

Any suggestion is welcome. Actually, it returns a copy of the original block and does not sort in place.

hiiamboris

[19:25](#msg62ffe3b99994996293e5c01b)Generalize it to `sort-by series any-function` and make a REP.

greggirwin

[19:27](#msg62ffe43f3a42316d33704518)Why not use `sort/compare`? Scanning quickly so I may miss something.

gurzgri

[20:36](#msg62fff45605ad4a370170c8f4)That's the way to go I thought of too reading this, @greggirwin @GiuseppeChillemi

```
>> by-length: func [a b] [sign? subtract any [length? b 0] any [length? a 0]] ()
>> sort/compare ["aaa" "aaaaaaa" "aaaaaaaaaaa" 1.2.3.4 "a" #[none] [1]] :by-length
== [none "a" [1] "aaa" 1.2.3.4 "aaaaaaa" "aaaaaaaaaaa"]
```

hiiamboris

[20:44](#msg62fff610443b7927a7965294)Still a good idea. Why doesn't `/compare` accept unary (any-)functions?

greggirwin

[21:25](#msg62ffffe76837563d1c55d23d)Doesn't the func need to know the \*two* items being compared?

gurzgri

[21:26](#msg63000011443b7927a79698ee)

```
Red
by-func: func [fun [any-function!]] [get in context [f: :fun g: func [a b] [case [greater? a: f a b: f b [-1] lesser? a b [1] true [0]]]] 'g]
>> sort/compare [0 45 90 135 180 225 270 315 360] by-func :sine
== [270 225 315 360 180 0 45 135 90]
>> sort/compare [0 45 90 135 180 225 270 315 360] by-func :cosine
== [180 135 225 270 90 315 45 360 0]
```

[21:30](#msg630000fcb16e8236e3fb8cbd)It needs to know \*how* the two items should be compared (by which measure). That's not something which is easily derived from arbitrary unary any-functions. Best / canonical thing is probably a per-datatype order. Don't know how useful that might be in practice.

hiiamboris

[21:34](#msg630001ef3a42316d33710d8e)Piece of cake. Let `sort` given `unary-func` call it with each item in the pair it compares and compare resulting values with each other.

gurzgri

[21:36](#msg63000253b16e8236e3fb965d)Ah, yes, now I see what you meant.

hiiamboris

[21:37](#msg630002919994996293e698b9)A mockup would be `by-unary: func [f] [func [a b] [a: sort reduce [f :a f :b] :a/2 =? :b]]`

[21:47](#msg6300050eb16e8236e3fbaa6c)`=? f :b` that is

gurzgri

[22:17](#msg63000be411a6a83d043733ed)Something like

```
>> sort-by: func [values fun /local val] [extract sort/skip/compare parse values [collect [any [keep set val skip keep (fun :val)]]] 2 2 2]
>> sort-by [0 45 90 135 180 225 270 315 360] :cosine ;== [180 135 225 270 90 315 45 360 0]
>> sort-by [0 90 135 180 225 270 315 360] :random ;== [0 360 135 225 90 270 180 315]
>> sort-by words-of system/words func [word] [checksum form :word 'sha256]
== [red-system ctrl? url-parser level quiet ...
```

applies the unary functions only once per value but needs more memory.

GiuseppeChillemi

[23:57](#msg6300237e9994996293e78ce6)@gregg  
&gt; Why not use `sort/compare`? Scanning quickly so I may miss something.

Never used sort compare, I don't know I it works but I am looking at the following posts.

[23:59](#msg630023e7f4d7a323de55470e)@hiiamboris  
&gt; Generalize it to `sort-by series any-function` and make a REP.

What does mean that `any-function`? Where should I use it?

## Saturday 20th August, 2022

GiuseppeChillemi

[13:09](#msg6300dcf4458f823ce00ab370)Could please someone explain how `/compare` works?  
I suppose `find` scans each element and passes the current and the next one to the comparison function. Then if a `true` is returned it.... and if a `false` is returned it... Well, what it does?

I have made a little experiment to understand it:

Function returning `true`

```
;===Sort/Compare Experiments
probe x: [a c d z]
f: func [o1 o2] [
	print [o1 o2]
	true
]
sort/compare x :f
```

output:

```
[a c d z]
c a
d a
d c
z a
z c
z d
;Result
>> probe x
[z d c a]
```

function returning `false`:

```
sort/compare x :f 
probe x: [a c d z]
f: func [o1 o2] [
	print [o1 o2]
	false
]
```

Output:

```
[a c d z]
c a
d c
z d
;Result
>> probe x
[a c d z]
```

From the experiments, it seems it scans all data as supposed but, the second argument is set to the current one and the first is set to the next. If a `false` is returned, it skips to the next couple, if a `true` is returned... I really do not understand what it does!

hiiamboris

[13:34](#msg6300e2ead020d223d3c20bf8)`compare` function should take 2 items and answer if they are \*ordered* or not

[13:35](#msg6300e3103a42316d33774707)But for stable sort the return value is more complex: -1 for unordered, 0 for equal, 1 for ordered

[13:35](#msg6300e33a72ad51741f6691c5)Or vice versa. I never can quite recall the sign :D

GiuseppeChillemi

[14:16](#msg6300eca705ad4a3701779be8)Answering false, the order does not change, maybe the question is: should it be changed? `True`: yes, `False`: no ?

hiiamboris

[14:21](#msg6300ede1647d633cf6a7379d)no

[14:21](#msg6300edfd72ad51741f66ea8f)

```
>> sort/compare [1 8 5 3 6 2] func [a b] [ordered?: a < b]
== [1 2 3 5 6 8]
>> sort/compare [1 8 5 3 6 2] func [a b] [ordered?: a > b]
== [8 6 5 3 2 1]
```

gurzgri

[18:58](#msg63012edfaa09177429975dee)Never but only now it occurred to me that for stable sorting you're not limited to 1=ordered, 0=equal, -1=unordered. truthy, none, falsey also works.

greggirwin

[18:59](#msg63012f1a3a42316d33795aa9)Hah! I never thought about that.

## Sunday 21st August, 2022

GiuseppeChillemi

[01:06](#msg63018523b16e8236e3063b56)Red is infinite, even at this alpha stage. I think that even spending another 10 years, I will never know it fully

## Saturday 3th September, 2022

hiiamboris

[17:28](#msg63138ec89994996293491c65)Playing with a simple \[typechecked object](https://gist.github.com/hiiamboris/167b13603359440dea4b6a444fdb0d88):

```
>> obj: typed-object [x: 1  restrict [integer! float!] y: 2]
== make object! [
    x: 1
    y: 2
]

>> obj/x: 2
== 2
>> obj/y: 3
== 3
>> obj
== make object! [
    x: 2
    y: 3
]

>> obj/x: 'word
== word
>> obj/y: 'word
*** Script Error: type-checker does not allow word! for its y argument
*** Where: type-checker
*** Near : :new set-quiet word :new
*** Stack:  
>> obj
== make object! [
    x: 'word
    y: 3
]

>> set obj 4
== 4
>> obj
== make object! [
    x: 4
    y: 4
]

>> set obj none
*** Script Error: type-checker does not allow none! for its y argument
*** Where: type-checker
*** Near : :new set-quiet word :new
*** Stack:  
>> obj
== make object! [
    x: none
    y: 4
]
```

greggirwin

[18:57](#msg6313a3a0647d633cf6029dac)Fun. I played with some ideas quite a while back. I started with the premise of a generic data object and a separate spec that could be applied to them, to `vet` them. You'd get back a result object that told you what was wrong, or if it passed muster. A primary use case being objects used as complex args to funcs. I never got to granular control that could be used from change handlers. Here's how it works at the coarse level.

Given:

```
sub-o: object [aa: 1 bb: 2 cc: 3 dd: 'test]
o: object [a: 1 b: 2 c: 3 s: ss: sub-o]
spec: object [
	a: integer!
	b: string!
	c: func [value [integer!]][value < 2]
	d: integer!
	s: object [aa: bb: integer! cc: string!]
	ss: object [
		aa: bbb: cc: integer!
		dd: reduce [string! file!]
		ee: [
;			< 2
;			ee >= 3             _ >= 3
;			between? ee 0 5     between? _ 0 5
;			all [>= 0 < 5]
		]
	]
]
probe vet-spec o spec
probe vet-spec/with o spec [minimize]
```

It returns the following for the test calls:

```
make object! [
    a: 'OK
    b: "Wrong type. Expected: string!"
    c: "Predicate failed: value < 2"
    d: 'Missing
    s: make object! [
        aa: 'OK
        bb: 'OK
        cc: "Wrong type. Expected: string!"
    ]
    ss: make object! [
        aa: 'OK
        bbb: 'Missing
        cc: 'OK
        dd: "Wrong type. Expected one of: [string! file!]"
        ee: 'Missing
    ]
]
make object! [
    b: "Wrong type. Expected: string!"
    c: "Predicate failed: value < 2"
    d: 'Missing
    s: make object! [
        cc: "Wrong type. Expected: string!"
    ]
    ss: make object! [
        bbb: 'Missing
        dd: "Wrong type. Expected one of: [string! file!]"
        ee: 'Missing
    ]
]
```

The `ee` predicates are just draft syntax placeholders.

## Sunday 4th September, 2022

hiiamboris

[10:35](#msg63147f826837563d1cb989ac)Separate spec is a bad idea, as it will get out of sync during refactoring :)

[10:36](#msg63147fbf3a42316d33d44695)On the other hand, I do need to figure out how to have these checks per-class rather than per-object (otherwise RAM cost will be too high).

greggirwin

[17:42](#msg6314e38799949962934b655e)&gt; Separate spec is a bad idea, as it will get out of sync during refactoring

Different use cases. Mine isn't primarily about enforcing strict object constraints, but checking whether an aggregate arg to a func meets the func's expectations. Duck typing meets type spec.

hiiamboris

[17:47](#msg6314e4af3a42316d33d4fca4)I will REP this topic later, as it's important and seems totally missed by Redbol.

greggirwin

[17:50](#msg6314e576cf6cfd27af7201c8)Another use case, and why I played with returning rich information, is API use. That is, you spec an API, but have little control over what you'll get from remote callers, but want to be helpful in returning information that let's them solve problems. Can then also be used on a wider scale to check for compatibility, interrogate systems, etc..

hiiamboris

[17:52](#msg6314e5c9d020d223d31fe0ed)Good point

## Thursday 8th September, 2022

hiiamboris

[18:51](#msg631a39cb458f823ce072f29e)Got an advanced implementation now: https://codeberg.org/hiiamboris/red-common/src/branch/master/classy-object.red (but not fit for API scope)

[18:53](#msg631a3a0f647d633cf60f639e)Type and value checking and more:

```
>> my-object1/x: 2
== 2
>> my-object1/x: 'oops
*** User Error: {Word x can't accept `oops` of type word!, only [integer!]}
*** Where: do
*** Near : types'
*** Stack: on-change-dispatch check-type

>> my-object1/y: 10000
== 10000
>> my-object1/y: -10000
*** User Error: "Word y can't accept `-10000` value, only [y >= 0]"
*** Where: do
*** Near : values'
*** Stack: on-change-dispatch check-value
```

greggirwin

[18:58](#msg631a3b4472ad51741fcf4dda)Thanks for including all the design notes.

hiiamboris

[19:05](#msg631a3d00aa09177429fdade5)Yeah, couldn't do otherwise ;) Too many different design aspects coming in touch with this.

## Friday 23th September, 2022

ne1uno

[11:10](#msg632d941e647d633cf634c608)\[screenshot](https://usercontent.irccloud-cdn.com/file/2zLaOKXj/b64-png-screenshot.jpg)

[11:10](#msg632d941eaa091774292309cd)I made a \[little] utility script to convert to &amp; from base 64 png image strings:

[11:10](#msg632d941e11a6a83d04cb29f2)\[gist b64-png-red](https://gist.github.com/ne1uno/74efc2bda96a662dbf7d8858a60cfcf1#file-b64-png-red)

[11:10](#msg632d941e443b7927a729e22e)I have most things working, including from base 64 to image.

[11:10](#msg632d941e99949962937b23b8) but can't work out `encode`, kinda the whole point of program. what am I missing?

[11:10](#msg632d941f458f823ce0985ff1)code around lines 1100 in "make to-b64 from image" button

[11:10](#msg632d942172ad51741ff4ad35)I tried `encode img/image` `encode img/image/rgb` and directly from `%image.png`

[11:10](#msg632d9421cf6cfd27afa1b056)shorter example in comments at end of gist

hiiamboris

[11:31](#msg632d9907b16e8236e38f4995)since you're `load`ing, you should also `save`.

ne1uno

[12:39](#msg632da8f1cf6cfd27afa1d8c6)`enbase save/as copy "" i/image 'png` ;closer, still no

gurzgri

[12:52](#msg632dac289d3c186299162502)

```
Red
>> probe system/catalog/accessors/image!
[size argb rgb alpha]
>> img/argb   ;-- #{FF0000FFFF0907...
>> enbase img/argb ;--  {/wAA//8JB/...
```

[12:53](#msg632dac2e72ad51741ff4db85)maybe?

[12:57](#msg632dad49aa09177429233e93)Most problably not, though. More like `enbase read/binary %image.png` I guess.

hiiamboris

[12:58](#msg632dad876837563d1cea0ee5)or `save/as copy #{}`

ne1uno

[13:39](#msg632db700f4d7a323dee87dc8)`enbase save/as none i/image 'png ;worked!` thanks for `probe system/catalog/accessors/image!` too. , will update gist when my internet is less flaky.

gurzgri

[15:23](#msg632dcf80647d633cf635439c)You're welcome. For clarification I'd like to point out that for a image already loaded `save/as none i/image 'png` is the same as `enbase read/binary %image.png` for an image not loaded but read in binary. The difference you had to cope with here is the one between the binary on-disk file format and the image as represented in-memory as a Red datataype. You want to `enbase` a file format, not Red's in-memory image.

## Wednesday 5th October, 2022

toomasv

[16:00](#msg633daa200b8c9518d7db9f12)Playing with \[SPARQL](https://gist.github.com/toomasv/201b445e115d1aba7caae2d4943bea7e)

\[!\[SPARQL](https://toomasv.red/images/SemanticWeb/sparql.gif)](https://toomasv.red/images/SemanticWeb/sparql.gif)

Respectech

[20:51](#msg633dee60773e7e5c7bbf8a0b)That's really neat!

GiuseppeChillemi

[20:53](#msg633deec04fad225661277402)Wow, great work!

[20:53](#msg633deed62a06f4566b21dc60)Fantastic as always, Toomas.

## Thursday 6th October, 2022

toomasv

[04:11](#msg633e557a0b8c9518d7dcd438)Thanks, guys! Red still amazes me :)

greggirwin

[16:06](#msg633efcf964f29419bfc79799)Good stuff as always @toomasv. :+1:

## Saturday 15th October, 2022

hiiamboris

[18:07](#msg634af6fbbad3c73752d9684c)\[Extended `function`](https://codeberg.org/hiiamboris/red-common/src/branch/master/advanced-function.red) in action:

```
>> probe f: function [/ref x: 1  [integer! (x >= 0) string!]  (find x "0")] [x]
;;                            ^default     ^check for integer  ^fallback check (applies for string)
func [/ref x [integer! string!]][
	switch/default type? :x [
		none! [x: 1] 						;) applies default when X is not given
		integer! [							;) integer type check
			unless (x >= 0) [
				do make error! form reduce [
					"Failed" "(x >= 0)" "for" type? :x "value:" mold/flat/part :x 40
				]
			]
		]
	] [
		unless (find x "0") [				;) fallback type check
			do make error! form reduce [
				"Failed" {(find x "0")} "for" type? :x "value:" mold/flat/part :x 40
			]
		]
	] 
	x										;) actual body starts...
]
```

@GiuseppeChillemi IIRC you wanted some parts of this, I think defaults for locals or something...

greggirwin

[18:10](#msg634af7a627f328266d3e5452)Very nice @hiiamboris.

GiuseppeChillemi

[18:12](#msg634af820cf41c67a5cb1c346)@hiiamboris Great Work!

greggirwin

[18:51](#msg634b012b0a8c6e22a1c3e924)It seems like a short wrapper for `do make error! form reduce` would be worth it, given how much code this could be used. I understand that its primary use is not code generation, per se, but even if `make error!` supports string interpolation someday, it seems worth it.

hiiamboris

[19:10](#msg634b059baa210536d6121694)I'm using `ERROR` as you know in the code I write manually. For generated code, I care less.

## Sunday 4th December, 2022

ne1uno

[00:05](#msg638be44f280bbe4693bf8a63)https://twitter.com/ostwilkens/status/1598458146187628544

[00:05](#msg638be44fc00c002797b31efa)&gt;Fully automated solving &amp; submission for #AdventOfCode using #OpenAI text-davinci-003

[00:05](#msg638be450aaf0965f7c72536f)10 seconds is the new time to beat
