# Archived messages from: [gitter.im/red/mezz](/gitter.im/red/mezz/) from year: 2016

## Friday 20th May, 2016

DideC

[07:45](#msg573ec0afff441ca333d3460e)Restarting mezzanines conversation here.

[07:47](#msg573ec121e675315635f853d6)About R3 `split` (see the spec \[here](http://www.rebol.com/r3/docs/functions/split.html)). Features wise, it looks good.

[07:49](#msg573ec18fdce4845b35eb8b60)Just, I dislike the `/into` word as it has a strong meaning in other funcs. At first, I was expecting it to put the result into an existing serie, like `collect`.

rebolek

[07:50](#msg573ec1c44c282c3d3bf6cafc)@DideC do you have some ideas what can replace `/into`?

DideC

[08:47](#msg573ecf34e675315635f857f1)maybe `/part`, but i'm not sure.

[08:52](#msg573ed060f240e50046a0bac1)In fact `split serie integer` is not friendly understandable at first. If you don't use it frequently, you have to use `help` anyway.

[08:54](#msg573ed0b8dce4845b35eb902f)As said, having one func that do more is good, but don't abuse that too.

[08:56](#msg573ed13508a18f700b820a3b)Maybe a `cut` at side of `split` can handle one of the use case.

greggirwin

[17:19](#msg573f47397aab25fb459d4708)`/into` wasn't a standard refinement when `split` was designed. I agree that it's confusing now and should be changed.

[17:25](#msg573f4875f240e50046a0e2c1)`/part` is really the default behavior for an integer dlm value. That seemed to be the more common case, compared to the `/into` behavior. If we reverse the default, `/part` could be used.

[17:29](#msg573f495cd3f431720bb2459a)`cut` is more like `extract` which I have also experimented with extending via a dialected interface.

[17:34](#msg573f4a98e675315635f8824d)Consider `cut` as a tool like \*nix's command of the same name.

DideC

[20:17](#msg573f70dbf240e50046a0ef64)You're right, `cut`is not the good name. Nor `extract`. They have the meaning of removing something or picking only part of.

[20:19](#msg573f7139d3f431720bb25265)`separate` could be a candidate, but does it read good as a function ? `separate [1 2 3 4 5 6] 2` is not very understandable at first, does it ?

greggirwin

[20:20](#msg573f7178f240e50046a0ef95)Do we need a separate func for this though? To me it's still a way to split things, so a refinement is appropriate.

[20:26](#msg573f72f0dce4845b35ebc7c5)`/parts` has the right meaning but may be too close to `/part` and be confusing, because the behavior is different.

[20:27](#msg573f7342ff441ca333d3836f)I think `/pieces` was considered in the past as well.

DideC

[20:43](#msg573f76e6dce4845b35ebc901)`/in` for the parts number ?

greggirwin

[20:45](#msg573f7783ff441ca333d384c8)Could be confused with `in` related to contexts? Also not as descriptive to me, aside from the single "split in two" case.

## Monday 23th May, 2016

greggirwin

[15:07](#msg57431c94ff441ca333d421fc)Based on chat in the main room:

```
rotate: function [
	"Rotate values in a series."
	series [series!]
	/left   "Rotate left (default)"
	/right  "Rotate right"
	/part
		count [number!] "Rotate this many positions"
][
	if empty? series [return series]
	; modulo the count against the series size
	count: any [all [count  count // length? series] 1]
	;if zero? count [return series]	; MOVE handles a zero /part correctly
	head either right [
		move/part (skip tail series negate count) series count
	][
		move/part series tail series count
	]
]
rotate-tests: [
	blk: [1 2 3 4 5 6 7 8 9 10]
	rot: func [cmd] [prin [mold blk mold cmd "== "]  do cmd  print mold blk]
	rot [rotate blk]
	rot [rotate/left blk]
	rot [rotate/right blk]
	rot [rotate/right blk]
	rot [rotate/part blk 3]
	rot [rotate/right/part blk 3]
]
;do rotate-tests
```

dockimbel

[16:19](#msg57432d8a9463e3f85b03d5e8)@greggirwin This simplified version seems to be working fine:

```
rotate: function [
    "Rotate values in a series."
    series [series!]
    /left   "Rotate left (default)"
    /right  "Rotate right"
    /part
        count [number!] "Rotate this many positions"
][
	count: any [count 1]
    head either right [
        move/part (skip tail series negate count) series count
    ][
        move/part series tail series count
    ]
]
```

[16:20](#msg57432deaeef56d88637f4039)Not sure it is worth keeping `/left`, as it is the default one. Same as for the native `shift` (though it uses `/right` as default, so we should be consistent there).

greggirwin

[16:21](#msg57432df3fce033da4bef2cff)Excellent! Thanks!

[16:22](#msg57432e2afce033da4bef2d16)I include refinements for default options at times, so calling code can be more self-documenting.

[16:22](#msg57432e3a719c119b575b62f5)Agreed on consistency.

[16:25](#msg57432ee956ccfef516a00a86)Yours crashes here if I use a count &gt; series length.

dockimbel

[16:26](#msg57432f39eef56d88637f4042)Good catch!

[16:28](#msg57432fa5e0d13993573610f6)`move/part` is missing some bound checking:

```
red>> a: [1 2] move/part a tail a 10

*** Runtime Error 1: access violation
*** Cannot determine source file/line info.
***
```

greggirwin

[16:29](#msg57432feb719c119b575b6388)Mezzanine development as test code. :^)

dockimbel

[16:55](#msg57433602e0d1399357361124)@greggirwin Crash fixed.

## Thursday 26th May, 2016

greggirwin

[02:28](#msg57465f43454cb2be094f01bf)In the past, there was talk of considering funcs that end with `?` to be more strictly predicates (returning logic! results). There aren't too many, but some are common (`index?` `length?` `type?`, `suffix?`) others like `sign?`, `brightness?`, `modified?` and `size?` are important but less used I imagine.

Has this been discussed, or decided on for Red?

It's not something we can, or should, strictly enforce in user code. There have only been a few occasions that they have caused me to consider changing them worthwhile. Some are more ambiguous than others, with `modified?` being at the top of my list. I've used `changed?` or `dirty?` in the past for tracking changed items.

I think all my mezzanines use `?` strictly on predicate funcs, and I've used an `-of` suffix as a substitute (`file-of, path-of`, etc)

[02:32](#msg57466022454cb2be094f01e5)That said, is there any preference on `sign?'s implementation`?

```
sign?: func [
    "Returns sign of N as 1, 0, or -1 (to use as a multiplier)."
    n [number!] ; money! time!
][
    either positive? n [1][
        either negative? n [-1][0]
    ]
]

sign?: func [
	"Returns sign of N as 1, 0, or -1 (to use as a multiplier)."
	n [number!]
][
	case [
		positive? n [1]
		negative? n [-1]
		zero? n [0]
	]
]

sign?: func [
	"Returns sign of N as 1, 0, or -1 (to use as a multiplier)."
	n [number!]
][
	case [
		n > 0 [1]
		n < 0 [-1]
		n = 0 [0]
	]
]
```

[02:40](#msg57466237da3f93da6f2058bc)One more question. I used `n` as the param name above. `remainder` uses `value1 value2` and `modulo` uses `a b`. The `log*` funcs use `value`. `n` makes sense when a param can only be a number, though even then we have some gray areas. When you include `vector!` and others, it's not as obviously clear.

The question, then, is whether it's important to define some standard names or do we use descriptive terms? Personally, I don't think `dividend` and `divisor` would add any meaning to `modulo` (and it would make the implementation 10 times as long.

## Saturday 28th May, 2016

greggirwin

[13:02](#msg574996f4ec10ddbb09db8d8f)`default` is a nice little func (Ladislav's idea IIRC) that made it into Rebol. If added to Red, I do have one behavior change to suggest. I think it should return the value the word refers to, whether it was set or pre-existing, rather than the value passed in (as Rebol does).

```
default: func [
	"Set a value for the word if the word is not set or is none."
	'word
	value
][
	if any [not value? :word  none? get word] [
		set word :value
	]
	get word
]
```

iArnold

[17:35](#msg5749d6d76bbc2d1d4def0e0e)No split discussed here. Bummer bye.

greggirwin

[19:10](#msg5749ed20da3f93da6f213429)What do you want to dicsuss about it Arnold?

[19:34](#msg5749f2c610f0fed86f4919d1)Or we could start with something really easy, like `incr`. I mean, what could be easier?

```
incr: function [
	"Increments a value or series index."
	value [any-word! series! number!] "If value is a word, it will refer to the incremented value"
	/by "Change by this amount"
		amount [number!]
][
	default amount 1
	either any-word? :value [
		op: either series? get value [:skip] [:add]
		set value op get value amount
		:value                                          ;-- Return the word for chaining calls.
	][
		op: either series? :value [:skip] [:add]
		op value amount
	]
]
```

[19:38](#msg5749f3b6f44fde236e5146f9)I've been through a number of `incr` variations through the years, arguing with myself whether using a lit-word! arg made calling code cleaner to update word references, or if it should only operate directly on numbers. There's no clear winner when sometimes I write things in a very imperative style, and other times I chain calls and use HOFs like `map`.

[19:41](#msg5749f46b10f0fed86f491a06)The above is flexible, but has behavior that may not be immediately clear to a user, especially one new to Red.

```
red>> w: 1
== 1
red>> incr w
== 2
red>> w
== 1
red>> incr 'w
== w
red>> w
== 2
red>> b: [1 2 3]
== [1 2 3]
red>> incr b
== [2 3]
red>> b
== [1 2 3]
red>> incr 'b
== b
red>> b
== [2 3]
```

iArnold

[19:44](#msg5749f521da3f93da6f21354c)@greggirwin #1938 said split was discussed here. But no. I've had it for now. Going to look for alternative "hobby".

greggirwin

[19:46](#msg5749f58c10f0fed86f491a1e)@iArnold OK.

[19:50](#msg5749f67ada3f93da6f21357c)

```
decr: function [
	"Decrements a value or series index."
	value [any-word! series! number!] "If value is a word, it will refer to the decremented value"
	/by "Change by this amount"
		amount [number!]
][
	incr/by value negate any [amount 1]
]
```

[20:30](#msg5749ffdbf44fde236e51496e)Just caught up with the chat on #1938. One issue is the `/into` refinement. `/parts` is the best replacement name I've come up with so far. Here's a gist we can use for discussion: https://gist.github.com/greggirwin/66d7c6892fc310097cd91ab354189542

For some reason it won't let me set tabs to 4, but reverts to 8. Even tried recreating it.

[20:38](#msg574a01b3da3f93da6f21379e)@iArnold , I included `collect` in the gist, though that's fixed in newer Red versions. I also included `map-each` which is the first dependency we need to get approved for inclusion in Red.

[20:39](#msg574a0207454cb2be094fdc68)If you can come up with pathological cases that make it misbehave, that would be great.

## Sunday 29th May, 2016

iArnold

[08:35](#msg574aa9e6f44fde236e515cf6)@greggirwin I am for the normal usecases, I often wonder how ppl come up with the strange looking cases they do come up with. These things always seem to get full splitting hairs attention, as if hackers exploit these vulnarabilities already. Even when R1 will still be the product to make the real Red (2.0) when these thing could really become an issue.

[08:40](#msg574aaaee6bbc2d1d4def2874)And why is split in the repo and rejoin is not? Some times it seems all my efforts are a wot anyway, so that is the reason of my other hobby remark. So I can focus my energy on that and just watch this project from a distance. Save myself (and others) some frustrations. :-/

dockimbel

[08:58](#msg574aaf27a78d5a256e38d82b)@iArnold \*And why is split in the repo and rejoin is not?* Because `rejoin` is trivial to replace with regular code, `split` is much less trivial. Also, `rejoin`, like all conversion functions, needs to be reconsidered in a global way before we do any implementation.

iArnold

[09:07](#msg574ab16980352f204df320ba)OK thanks for expl.

dockimbel

[09:14](#msg574ab30b6bbc2d1d4def2956)\*Some times it seems all my efforts are a wot anyway\*. You should spend more time improving your skills first, like re-reading Rebol/Core documentation, re-read all the available Red documentation, practice Red &amp; Rebol coding much more. Also, if you want your contributions to be of any use, they need to be \*relevant* to the project. Copy/pasting code from R3 to make a PR with broken and incomplete code, bypassing any prior discussion about it and ignoring Red coding conventions, is not helpful at all, and a waste of time for everybody. It's obvious to me, and it should be obvious to you too. If you want your attempts at contributing to be taken seriously, \*be serious* about them. If your skills are not up to the task, stop complaining and work/study harder to improve them.

[09:18](#msg574ab3f480352f204df3210b)@greggirwin Thanks for the list, though, it should be moved to a wiki page where we can easily edit it in a collaborative way.

[09:25](#msg574ab58d454cb2be094ff0bb)@greggirwin I think we should set up some preliminary rules to help select the final set of mezz to include. We should make 3 categories: accepted (consensus or needed in the Red runtime), potential (to be discussed and weightened), rejected (too narrow use-case(s), too heavy, etc...).

rebolek

[10:30](#msg574ac4aa548104867b682cea)If `rejoin` will be gone, replaced with much improved `join`, not a single tear will be shed I guess.

dockimbel

[10:32](#msg574ac534a78d5a256e38dacf)They fulfill different needs. On takes a single block argument (and reduces it), the other takes 2 arguments. We need to preserve the existing features, just maybe providing them with less functions, and in a more intuitive way (if possible).

rebolek

[10:34](#msg574ac59da0fc3091611b1be5)I agree that we need less functions to handle joining. I was probably too radical with just single `join` function ;)

greggirwin

[10:38](#msg574ac692a78d5a256e38db03)@iArnold "normal" use cases are the best, but not always easy to find. ;^) If you've never had to split a string into fixed size records, or break a binary (not working in Red yet) into parts that vary in size, along with the common case of splitting a string at a delimiter, those features may seem like bloat. And maybe your data is always very nicely normalized, so the extra filler handling code wouldn't be needed, but those things are there for a reason.  
It is absolutely true, however, that we can add special cases that \*aren't* used enough to warrant being included, which is part of the design process and why we discuss what to include.

[10:39](#msg574ac6ddec10ddbb09dbb639)@dockimbel , happy to move to wiki. Didn't want to pollute since I didn't know if it was even close to what you wanted. Weightings were gut feelings from me, and done quickly.

[10:39](#msg574ac6fa6bbc2d1d4def2b72)At first it was just one long list, and I couldn't make any sense of that. :^\\

[10:55](#msg574acaaf6bbc2d1d4def2bc9)@dockimbel, wiki page created: https://github.com/red/red/wiki/What-Red-is-missing:-From-Rebol-and-new-proposals

dockimbel

[10:58](#msg574acb616bbc2d1d4def2bdc)@greggirwin Thanks! I think you should remove `action!` values from the list, as they are part of the Core language.

[10:59](#msg574acb91454cb2be094ff312)I will do a first pass to move all the ones we already plan to support under "accepted". Also the ones already implemented in Red's runtime library should be removed.

greggirwin

[11:04](#msg574accd2da3f93da6f214e93)How do I know which are actions? That's an implementation detail, right? One of the first things I ran into when building the list was that there isn't a 100% datatype match of existing funcs between Red and Rebol, so I decided not to care about their type in the list. My first plan was to make lists by type, but then I saw things existed in alternate type lists.

[11:05](#msg574accf980352f204df323b7)Also, my quick differencing surely missed some things. I expected we would do manual cleanup.

dockimbel

[11:07](#msg574acd886bbc2d1d4def2c1b)@greggirwin `help action!`;-)

greggirwin

[11:09](#msg574acddbf44fde236e516103)Right, but, e.g., `reverse` and `round` are actions in Red but not Rebol.

[11:10](#msg574ace0d80352f204df323d5)So, did you mean to remove Red or Rebol action values from the list?

dockimbel

[11:10](#msg574ace176bbc2d1d4def2c37)If they are already in Red, just remove them from that page. ;-) Yes, you can remove all Red &amp; Rebol actions.

greggirwin

[11:11](#msg574ace6380352f204df323e6)Of course they shouldn't have made it, so my diffing missed stuff somehow. It's a wiki now though. ;^)

[11:12](#msg574ace8e10f0fed86f4933a9)Why remove them though, if they are missing from Red?

[11:13](#msg574acec180352f204df323f2)i.e., the goal is to see what is still to be done (word wise), correct?

[11:14](#msg574acf04ec10ddbb09dbb713)Just trying to make sure I understand what I'm doing, so it helps more than it hurts.

dockimbel

[11:15](#msg574acf5a80352f204df3240c)Ok, maybe it's easier that way, so let's keep them all there.

iArnold

[17:21](#msg574b2515f44fde236e516e2a)Parse is incredibly difficult:

[17:21](#msg574b251a10f0fed86f49414a)split: func \[{Break a string series into pieces using the provided delimiters} series \[any-string!] "String series to split" dlm \[string! char!] "Delimiter as a char or string pattern" return: \[block!] {Returns a block of split pieces without the delimiters} /local value rule]\[rule: complement charset dlm parse series \[collect \[any \[keep copy value some rule | keep copy value dlm | skip]]]]  
split "||qwert|" "|"

[17:21](#msg574b2536f44fde236e516e34)result:

[17:22](#msg574b2538454cb2be0950009f)  
\== \["|" "|" "qwert" "|"]  
&gt;

[17:22](#msg574b256ea78d5a256e38e8fb)But it is heading in the right direction now!

[17:23](#msg574b25a9454cb2be095000b5)I could use this as a workaround now. I am a practical user u know.

[17:30](#msg574b273ef44fde236e516e93)That is why I have no fear of using code that works for the use cases I need. It is a black box, you put data in and receive data back. Even you trust black boxes.. CS!

greggirwin

[17:52](#msg574b2c48454cb2be09500202)Even before the big `split` makes it into Red, or if it never does, you can still include the code and use it yourself.

iArnold

[18:47](#msg574b392f80352f204df334ce)@greggirwin I do that because I do that anyway because it is too hard to get a simple diaplay of date/time of finished compilation to be accepted.

## Monday 30th May, 2016

dockimbel

[08:15](#msg574bf691ec10ddbb09dbe79d)@greggirwin \*apply ; But, PLEASE, a better way to propagate refinements* What do you have in mind?

rebolek

[08:17](#msg574bf6fd4a49504d6099f57f)@dockimbel I can’t talk for @greggirwin, but named refinements would be much better solution than current APPLY approach.

dockimbel

[08:21](#msg574bf801454cb2be09502424)@rebolek How would it look like?

rebolek

[08:53](#msg574bff784a49504d6099f5c3)@dockimbel Insetad of `apply :append [data 1 none none none true 3]` (taken from http://www.rebol.com/r3/docs/functions/apply.html) I would prefer something like `apply :append [data 1 /dup 3]`

dockimbel

[08:54](#msg574bffd510f0fed86f496827)@rebolek Can be done, but would be magnitude(s) slower in the interpreter than the low-level version of `apply`, as internally, it still needs to construct the stack frame, filling the rest with nones. The compiler though, wouldn't have any performance issue with such form (if used literally, otherwise, same penalty as interpreter).

rebolek

[08:59](#msg574c00e04a49504d6099f5cb)There may be other approaches I haven’t thought of, that could be faster and still expressive enough, but the above `appen` example with three `none`s shows problems of current approach. It’s not something you can write without consulting documentation. Counting refinements \*\*and\** their args is not very intuitive.

dockimbel

[09:00](#msg574c014410f0fed86f496891)@rebolek Agreed, though, whatever abstraction you put on top, internally, it will need to be reduced to what `apply` currently does, there is no work around that, as it is the stack frame required to call the function at the lowest level. There's a performance trick the Red interpreter does with paths when they are function calls with refinements, to avoid the huge cost of resolving it on each call, maybe it could be applied to `apply` too (though it requires a literal path for that...). Maybe, an `apply/short` form could be used as a hook by the interpreter to lower the cost of a \*shorter* form.

rebolek

[09:01](#msg574c0175548104867b68308d)I see. It would be probably best to have both fast version and simple one.

dockimbel

[11:14](#msg574c20a1f44fde236e519dd7)@greggirwin I made a first pass over all the words to sort them in the 3 categories.

greggirwin

[18:15](#msg574c8341ec10ddbb09dc115e)@dockimbel I'm fine with a low level version of `apply` being there as well, but for high level code, the performance impact is unimportant, relative to understandability (either when reading or writing). Keep `apply` as it is if you want. I will write up some thoughts on it.

And thanks for going through the word lists. Most helpful.

[18:18](#msg574c840e454cb2be09504da4) What I've done in the past isn't enough for a general func. The basic idea is easy enough"

```
refine: func [
    [catch]
    "Refines a function with the specified refinements. DO the result to call the func."
    'fn "The function"
    refinements [any-block!]
][
    to path! compose [(fn) (refinements)]
]
```

Which lets you do this: `do refine find [last tail] "abcdeabcfg" "abc"`. But when you need to propagate them, it means either doing this:

```
my-find: func [ser val opts [block!]] [do refine find opts ser val]
```

or something like this:

```
my-find: func [ser val /last /tail /local opts] [
    opts: collect [
        all [last keep 'last]
        all [tail keep 'tail]
    ]
    do refine find opts ser val
]
```

[18:28](#msg574c864dda3f93da6f21ac3a)Where it gets uglier is when you have refinements that take args. I have some ideas, but need to give them more thought. Basically @rebolek 's idea as the interface. One catch being that refinements in the called func are seen as true|none rather than refinement|word|none. That may be the biggest issue. Unfortunately, I think there's no way around that the way things work today.

DideC

[21:11](#msg574cac6d80352f204df38977)\[Thinking out loud (but not too deeper : i'm not a guru)]  
Why not using a syntax like this:

```
refine find [serie value /part 10 /skip 2]
```

[21:18](#msg574cae22f44fde236e51c8c6)So it become a dialect: firsts values are standard arguments collected in a first block, the first refinment close the args list. Then you can collect refinments in anotherblock, and optionnal values are added to first block. And build the code to call from there.

## Tuesday 31st May, 2016

greggirwin

[03:20](#msg574d03056bbc2d1d4defa195)That's what Bolek suggested above, and I agree. It will just be lower performance, so `apply` would still be justified as a low level alternative.

rebolek

[03:21](#msg574d0351548104867b683671)I’m perfectly fine with having "fast" and "easy" way to do it.

greggirwin

[05:22](#msg574d1f7b10f0fed86f49b21a)@dockimbel , you have `entab/detab` in your Accepted list. Experimenting.

```
detab: function [
	"Converts tabs in a string to spaces. (tab size 4)"
	string [any-string!]
	/size number [integer!]
	/leading "Change only leading tabs to spaces"
][
	s: append/dup copy "" space any [number 4]
	parse string compose/deep [
		some [change tab s (either leading [[thru newline]][]) | skip]
	]
	string
]
print mold s1: detab "a b c^-d e f g"
print mold s2: detab "^-a b c^-^-d e f g^-"
print mold s3: detab/leading "^-a^-^/ b^-^/ c^-^-d e f g^/^-"
```

[05:22](#msg574d1f9080352f204df39dbc)

```
entab: function [
	"Converts spaces in a string to tabs. (tab size 4)"
	string [any-string!]
	/size number [integer!]
	/leading "Change only leading spaces to tabs"
][
	number: any [number 4]
	parse string compose/deep [
		some [change (number) space tab (either leading [[thru newline]][]) | skip]
	]
	string
]
print mold entab s1
print mold entab s2
print mold entab/leading s3
```

dockimbel

[05:24](#msg574d2008548104867b6836ab)@greggirwin You could avoid the expensive `compose` using a `if (leading)` rule.

greggirwin

[05:25](#msg574d2056454cb2be09506c8b)Ah! I had `compose` in there because before I rebuilt the changed value was not reduced.

[05:27](#msg574d20dc80352f204df39dea)Ah! (again), still need the paren after the `if`.

[05:28](#msg574d20ecda3f93da6f21cbe0)

[05:28](#msg574d211480352f204df39df3)

```
detab: function [
	"Converts tabs in a string to spaces. (tab size 4)"
	string [any-string!]
	/size number [integer!]
	/leading "Change only leading tabs to spaces"
][
	s: append/dup copy "" space any [number 4]
	parse string [
		some [change tab s if (leading) [thru newline] | skip]
	]
	string
]
print mold s1: detab "a b c^-d e f g"
print mold s2: detab "^-a b c^-^-d e f g^-"
print mold s3: detab/leading "^-a^-^/ b^-^/ c^-^-d e f g^/^-"

entab: function [
	"Converts spaces in a string to tabs. (tab size 4)"
	string [any-string!]
	/size number [integer!]
	/leading "Change only leading spaces to tabs"
][
	number: any [number 4]
	parse string [
		some [change number space tab if (leading) [thru newline] | skip]
	]
	string
]
print mold entab s1
print mold entab s2
print mold entab/leading s3
```

[05:30](#msg574d215ff44fde236e51dcee)And I know Rebol doesn't have `/leading` but when you write the IDE you may want it. ;^)

dockimbel

[05:53](#msg574d26d6548104867b6836c0)Agreed on `/leading`.

greggirwin

[05:53](#msg574d26daa78d5a256e395938)Except it's not quite that easy. :^\\

[05:54](#msg574d270ba78d5a256e395944)Naively doesn't handle multiple leading tabs.

dockimbel

[05:55](#msg574d275c8fba4a053f1b0aa6)`change some tab s` should do.

[05:56](#msg574d27a24a49504d6099fc4d)`some [change tab s]` should do.

greggirwin

[05:57](#msg574d27d1454cb2be09506dd2)Lovely!

[05:58](#msg574d27feda3f93da6f21cd01)

```
detab: function [
	"Converts tabs in a string to spaces. (tab size 4)"
	string [any-string!]
	/size number [integer!]
	/leading "Change only leading tabs to spaces"
][
	s: append/dup copy "" space any [number 4]
	parse string [
		some [any [change tab s]  if (leading) [thru newline] | skip]
	]
	string
]
print mold s1: detab "a b c^-d e f g"
print mold s2: detab "^-a b c^-^-d e f g^-"
;print mold s3: detab/leading "^-a^-^/ b^-^/ c^-^-d e f g^/^-"
print mold s3: detab/leading "^-^-a^-^/ b^-^/ c^-^-d e f g^/^-"

entab: function [
	"Converts spaces in a string to tabs. (tab size 4)"
	string [any-string!]
	/size number [integer!]
	/leading "Change only leading spaces to tabs"
][
	number: any [number 4]
	parse string [
		some [any [change number space tab]  if (leading) [thru newline] | skip]
	]
	string
]
print mold entab s1
print mold entab s2
print mold entab/leading s3
```

dockimbel

[06:25](#msg574d2e68548104867b6836c8)@greggirwin Could you please refresh your PR #1944 with your latest fixes, so I can merge it?

greggirwin

[06:36](#msg574d30d6454cb2be09506fe3)If only I knew how to make git happy. I will as soon as I sort out merge conflicts.

dockimbel

[06:37](#msg574d31194a49504d6099fc62)@greggirwin Did you do a rebase? As a rule of thumb, you should open a new branch for each new PR you make, to avoid unrelated commits/merges mess it up.

greggirwin

[06:38](#msg574d317eda3f93da6f21cf21)I did rebase, but I don't branch. Something I'll have to do I guess. Or find myself a git proxy.

dockimbel

[06:39](#msg574d31a84a49504d6099fc64)Branching is very cheap in Git and avoids a lot of headaches. ;-) Which Git client do you use?

greggirwin

[06:40](#msg574d31e1da3f93da6f21cf3a)Cheap I understand, but cheap and easy are not the same thing, until it becomes normal.

dockimbel

[06:41](#msg574d320c4a49504d6099fc67)I'm using TortoiseGit client, and it's both easy and cheap there. ;-)

rebolek

[13:33](#msg574d92b9a0fc3091611b2903)One of great things about Redis is its SET datatype. It’s basically block of unique (and unsorted, but that’s irrelevant in Red) values. I found that it’s very useful to have such functionality in Red also. But populating the block first and than using `unique` is not very fast and memory friendly, so it’s better to handle this at insertion. Therefore I have this function that I use very often when working with some data:

```
expand: func [
	"Append value to block only if not present"
	block
	value
] [
	unless find block value [
		return append block value
	]
]
```

It would be interesting to try to rewrite this using the new reactive stuff, so the block will be checked automatically on insert/append.

dockimbel

[13:48](#msg574d964aa0fc3091611b2913)@rebolek What are your use cases for a SET?

rebolek

[13:52](#msg574d97358fba4a053f1b0d34)@dockimbel When processing some table/csv file, getting unique values in column.

dockimbel

[14:03](#msg574d99b6548104867b68392c)@rebolek I planned a specific set! datatype for Red, though, still unsure if it should go into the Core library or just as an extension.

rebolek

[14:10](#msg574d9b4c4a49504d6099ff03)@dockimbel hmm, that sounds really promising. I would love to have it in Red, even just as an extension.

dockimbel

[14:18](#msg574d9d1e548104867b68395b)A set! datatype could implement more efficient algorithms for checking than the linear search used by FIND.

rebolek

[14:21](#msg574d9dee8fba4a053f1b0d7c)Definitely.

greggirwin

[15:50](#msg574db2af454cb2be09509f42)`expand` doesn't express the meaning very well to me, but the functionality is good. Could almost be a refinement on `append` if we found the right name. I'm loathe to overload `append` too much though.

dockimbel

[15:55](#msg574db3dca0fc3091611b2a74)@greggirwin Patching `append` would not be enough to handle a set, you need to overload all the modifying actions/natives. A deep reactive approach could achieve that, though a dedicated datatype would be much more efficient.

greggirwin

[15:56](#msg574db4206bbc2d1d4defd85c)Understood. I just meant there's value in even that one feature. It's not that it guarantees uniqueness in the series, but makes a common case easy to get right.

[15:59](#msg574db4f610f0fed86f49e567)

```
inset: func [
	"Append value to series if not present; otherwise return location where value was found."
	series [series!]
	value
][
	any [find series value  append series value]
]
```

`inset` is too close to `insert` though.

dockimbel

[16:21](#msg574dba148fba4a053f1b0efb)@greggirwin There's already `alter` function which is very similar, so maybe just adding a refinement to `alter` would be enough. I would avoid the removal by default and allow it using a refinement.

greggirwin

[16:22](#msg574dba59da3f93da6f2201de)Really different purposes though.

rebolek

[16:23](#msg574dba68a0fc3091611b2ad9)@greggirwin `expand` was the first name that came to my mind and I agree that something better can be used.

dockimbel

[16:24](#msg574dbab54a49504d609a0090)@greggirwin It looks very close to me:

```
>> source alter
alter: func [
    {If a value is not found in a series, append it; otherwise, remove it. Returns true if added.
 (Modifies)}
    series [series! port!]
    value
][
    found? unless remove find series :value [append series :value]
]
```

rebolek

[16:25](#msg574dbae14a49504d609a0093)Something like `alter/keep` ?

greggirwin

[16:25](#msg574dbb0bda3f93da6f220230)I mean `alter` is named (though I've never liked the name), to indicate possible removal. The question is what the refinement name would be.

[16:27](#msg574dbb6d10f0fed86f49e864)My thought on `inset` was the "set" part as well as the meaning. It \*sort of* works, but it was a quick idea, not thought out deeply.

## Sunday 12nd June, 2016

greggirwin

[00:16](#msg575ca9ea814a568071423353)https://github.com/red/red/wiki/REP-FOR-loop-function

There are much more important things, but now it's out of my head.

iArnold

[09:43](#msg575d2ebce20024bd1ad2c0c2)Not sure about your proposal Gregg.  
First I like the Rebol/Red loop types. When for becomes available FOR will be used as it is a Swiss Army knive. Even though the kind of loop will be perfect for LOOP or REPEAT a FOR will be used. (In my view FOR is an ugly construct in C and Java.) The use of FOR as a FOR x from 5 to 10 step 2 is indeed a missing thing, though it can be made using 'while. I also do not really like your suggested x = 5 because it looks like a C assignment. In Redbol x = 5 is true or false (or none ?) so this would add to the confusion.  
Just my 2cents.

dockimbel

[11:22](#msg575d45f697e1b2d245e207e8)@greggirwin Thanks for your REP, it will be interesting to see it go through the REP process, so we can fine-tune it. About the content, I find it very interesting. Did you ever propose it to Carl before?

iArnold

[13:54](#msg575d69a61cf76dd645366687)There is only room to express your full support for the REP? I did not want to spoil the Debate section.

[14:07](#msg575d6c8a2eaa837d71e8bdd8)Added my comments to the Debate section.

greggirwin

[15:03](#msg575d79b497e1b2d245e210b4)I don't know the REP process Arnold, just took the template as a start. Peter Wood can comment more. I think "chat debate" here and elsewhere is good, then it can be summarized into the REP as important points come up.

[15:24](#msg575d7eb62eaa837d71e8c172)@iArnold I like the native loop types as well, and only use `for` in special cases. I think sometimes I avoid it too hard, using `while` as you point out. I also don't care for the C model myself. An interesting thing is that the discussion that led to this REP (long ago) came from Ladislav proposing a `cfor` func. It is so general that, internally, my test implementation actually converts many of the cases to `cfor` format of `[init][test][bump]` blocks, which is used if it can't delegate to one of the other native loops.  
I think that C/{...} people won't fall to using it as standard. My hope in this is that they care about performance, and as soon as you tell them it's slower, they'll abandon it for native loops except where they need special behavior.  
WRT `=`. I experiment. I also support `from`, as `for [i from 5 to 10 step 2] [print i]`. Two things taken together can justify `=`: it's used in a lot of other languages and in the context of the dialect it means "i will equal the following values as the loop is processed." I agree it's a bit ambiguous though.

dockimbel

[15:29](#msg575d7fe8e42570166a845daf)@greggirwin There might be two others concepts that we should support in the future, which could overlap partially with your REP: list comprehensions and ranges. So, we might want to have a broader vision about them all.

greggirwin

[15:31](#msg575d804c97e1b2d245e211c0)And it is intentionally a Swiss Army Knife in this proposal. I'm not sure I like it either, but there are pros and cons, as I laid out in the benefits and consequences sections of the REP. Of course, it can be pared down. The alternatives I see are either to use the same spec that REBOL did or leave it out entirely and address it in a doc page that shows how to use other loops in its place.  
The side of my brain that says it's a \*good* thing to roll it all into one thinks that a smaller number of very flexible functions can reduce cognitive overhead for users. I argued very hard for `round` to be that way, though we could easily have `trunc floor ceil` etc. The point is that the name tells you something, and it collect information. The catch, of course, is that they have to work intuitively, so you really do make things easier rather than harder.

dockimbel

[15:33](#msg575d80bd37340f6b2fe26cd3)Don't worry about performances, such dialected `for` can be easily compiled down to native loops (using direct support in compiler, or some form of macros).

greggirwin

[15:33](#msg575d80c76092456f66336344)@dockimbel I think Carl said what you did "Interesting" and his main concern was about the optional keywords. We've talked about that, in general, WRT Rebol, and they have their own pros and cons. Ultimately, I do see this `for` as a potential learning tool as much as a useful construct.

[15:35](#msg575d8138a1be01c01a793325)The current version does work with series targets for start/end under Rebol, but not Red (just ported and need to investigate). I do also have old BOUNDS and RANGE dialected funcs and proposed the value of a range! type in the past. So I agree.

dockimbel

[15:39](#msg575d821de9fbf4267bf367a1)The hardest part with range! is (as usual) finding an appropriate syntax. I used to think that `x..y` could do, but actually, it would end up being no different than pair!... so why not use pair! to specify ranges (extending some natives to accept it, e.g.: `copy series 1x2` , just food for thoughts) ;-) OTOH, I'm not against a new literal range type, for sake of richer dialecting support.

greggirwin

[15:39](#msg575d821ee20024bd1ad2cd4b)Also, not to get OT, but `split` was also designed as a multi-tool. I actually just played with adding a couple more to it, based on other ways I often split things.

[15:41](#msg575d82a31cf76dd645366af4)@dockimbel I use x..y tuples for literals under R2, but parse dialected blocks otherwise. My problem with pair values is that the `x` implies different axes to me, not different points on the same line.

dockimbel

[15:43](#msg575d830a37340f6b2fe26cd7)`x..y` as tuple, nice one. ;-)

greggirwin

[15:48](#msg575d845de20024bd1ad2cdc5)The other hard part in starting down that path is that then you end up thinking about intervals in general and how it might be applied. A literal syntax would be nice, so as not to require a `bounds` func. The upside to `bounds` is that you can do more. e.g. I have keywords like `today` and `tomorrow`. Also, `range` wraps `bounds` so it isn't too bad just as a func, and is simple to do, the main work being `collect [for v start end step [keep :v]]`. Yes, that is one of the special cases where I use `for`.

dockimbel

[15:49](#msg575d849ee9fbf4267bf367b5)Your last example is the beginning of a list comprehensions support.

greggirwin

[15:52](#msg575d854c814a568071425158)Right, notation wise, I never dug into a nice way to mark inclusive/exclusive limits. e.g., as soon as we have a range! type, we need to consider set functions as well, right? ;^)

dockimbel

[15:55](#msg575d85fcc046fa5b2fd548b5)Among others, yes. ;-)

PeterWAWood

[22:39](#msg575de48de20024bd1ad2e2bc)@iArnold Gregg's proposal has not yet been submitted. The place to discuss it is here or the mailing list. It is premature to express support for the proposal until it has been submitted. You will be able to tell when it has been submitted as it will have been allocated a REP Number.

It is even more premature and incorrect to add discussion to the REP. The document clearly states in bold text that the discussion section will be curated by the Red team.

[22:40](#msg575de4c3a1be01c01a794883)This is @iArnold comment on the For Loop REP:

"Date: 12 June 2016

Point: Not against the proposal. The FOR you suggest is like a Swiss Army knife. Used for too many a thing. The LOOP and REPEAT loops are great in a sense that they are a perfect fit for their looping tasks. I agree a FOR type loop is missing in Red, but it is possible to use WHILE to work around this now. Also the first block of the WHILE could be put more to use. The FOR \[X 1 10 2]\[] I can support. Though the suggested \[X = 5 from 5 to 10 step 10] I think is 'bad'. It is bad because X = 5 suggest a C style assignment, where in Red and Rebol X = 5 will result in TRUE or FALSE (or maybe a none) giving rise to confusion to the very newcomers that will be pleased to find Red has a FOR. Just my 2 cents."

## Monday 13th June, 2016

iArnold

[05:25](#msg575e43d6a1be01c01a79577f)@PeterWAWood That is what I wrote here too but in slightly other words. Unless the text has been removed from the page a link would have been ok?  
Sure, curated by the Red team, so the info on the page will contain only relevant discussion, makes a lot of sense to me.  
@greggirwin Were you aware that you had not submitted your proposal yet?

[05:30](#msg575e44fb97e1b2d245e23743)You guys make it seem that I am breaking all unwritten laws of community participation all of the time.. :hammer: "Guilty!" :-/

greggirwin

[15:49](#msg575ed6251cf76dd64536c1d4)I thought I was supposed to leave it as XXXX so the Red team could number them. First time trying a REP, so I don't know the process either.

## Friday 12nd August, 2016

greggirwin

[21:10](#msg57ae3b31a00c6adb45e1f961)From red/welcome. Steeve, I'm not sure about wanting to copy objects more than series. My thought about copying everything by default is that it's the least surprising, and safest thing to do. If you need to optimize, that's what refinements are for.

[21:12](#msg57ae3bba625cb3d845423ed1)Doc may be planning for `copy/deep` to do this, and it already has `/types`. So another question is how `clone` would differ from that. Don't want too many things that are very subtly different.

SteeveGit

[21:31](#msg57ae402f9aba41a43d3e54b3)My, my, my... I'm a foul, I didn't notice the \*\*copy/types\** refinement. Arghhh!

[21:32](#msg57ae40769aba41a43d3e54b5)How do we rollback gitter 1 day in the past?

greggirwin

[21:33](#msg57ae4095364ad7fc5acee1cb)New to me too Steeve. Damn us noobs.

SteeveGit

[21:33](#msg57ae409a77ca0aba32e770d9):-)
