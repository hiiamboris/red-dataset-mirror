# Archived messages from: [gitter.im/red/bugs](/gitter.im/red/bugs/) from year: 2022

## Wednesday 5th January, 2022

Oldes

[16:55](#msg61d5cd645ee4df335accd54d)I believe, that there should be `%""` instead of `none` in these cases:

```
>> split-path %/
== [%/ none]
>> split-path %./
== [%./ none]
>> split-path %../
== [%../ none]
```

hiiamboris

[17:12](#msg61d5d16fe1a1264f0a3fb02e)looks like it will be a win in some cases and loss in others

greggirwin

[17:18](#msg61d5d2e55dc6213cd4c87448)@Oldes I can dig out my old `split-path` tests, based on Ladislav's idea that `rejoin split-path` should produce the original result. I always liked that idea, but as @hiiamboris it's not a silver bullet, just a different design choice.

Oldes

[17:20](#msg61d5d36e5ee4df335acce60c)@hiiamboris can you be more specific? For me it is clear issue. It does not make sense to have 3 exceptions, where there is `none`.

hiiamboris

[17:36](#msg61d5d71046529077f56d1ec6)well, for example you could put split-path into `until` until loop and check if file part is none

[17:36](#msg61d5d71d5ee4df335accee7a)or just use default filename when it is none

[17:37](#msg61d5d7432a210c38c1b31447)both cases are a bit shorter with none than with `%""`

[17:37](#msg61d5d77582a4667b255effac)I'm not against either design

[17:39](#msg61d5d7d25ee4df335acceffb)but this is totally an inconsistency:

```
>> split-path %""
== [%./ %""]
```

enough to open an issue

greggirwin

[18:18](#msg61d5e0eb2a210c38c1b32a72)Here's one I drafted some time back that matches the current behavior, but is much simpler.

```
split-path: function [
	"Returns a block containing a path and target."
	path [any-string!]
][
	target: any [find/last/tail path slash   path]
	reduce [copy/part path target  to file! target]
]
```

hiiamboris

[18:25](#msg61d5e27cf5a3947800edf674)PR it :)

zentrog:matrix.org

[18:25](#msg61d5e27d82a4667b255f1905)Could it be that the problem is not with `split-path`, but with `rejoin`?

```
>> rejoin [%/ none]
== %/none
```

Why does it convert `none` to `%none`? I know it's just just forming it, but it doesn't seem that helpful to me. The empty file `%""` seems weirder to me than `none` for "no file"

greggirwin

[18:28](#msg61d5e34ad143b14f8300f516)Sorry, mine does \*not* match the current behavior, which is probably why I didn't PR it. But it \*does* hold true to `rejoin`.

[18:30](#msg61d5e3bd6d9ba23328a840b6)@zentrog:matrix.org if `none` formed to `""`, you would never see it in a lot of output.

zentrog:matrix.org

[18:40](#msg61d5e62c9b470f3897503b2c)I don't mean changing `form`, but `rejoin`, since it is producing a `file!`, not a `string!` in this case. It just seems weird to me that you would get a file named "none" out of the value `none`.

toomasv

[18:47](#msg61d5e7ced143b14f830101e4)Could use `trim`?

```
rejoin trim split-path %/
== %/
```

greggirwin

[19:24](#msg61d5f059d143b14f83011868)While we can work around it, the best thing to me seems to be making `split-path` the best it can be first.

gltewalt

[19:28](#msg61d5f1516d9ba23328a863a1)

```
>> help split-path
Func spec couldn't be parsed, may be malformed.
func [
```

greggirwin

[19:39](#msg61d5f3e09a335454060a12c2)I added notes and comments to https://github.com/red/red/issues/5024

hiiamboris

[19:40](#msg61d5f42a5dc6213cd4c8c518)@gltewalt can't reproduce

greggirwin

[19:40](#msg61d5f42e6d9ba23328a86ab9)@gltewalt good catch. We're going to see a lot of that now, as the interpreter events changed func specs. Oy.

[19:41](#msg61d5f456f5a3947800ee210f)`split-path` now has `[no-trace]` in it.

hiiamboris

[19:41](#msg61d5f4596d9ba23328a86b54)oh, on newer build I can

greggirwin

[19:41](#msg61d5f4805ee4df335acd3887)`clean-path` and `layout` are also broken.

[19:44](#msg61d5f51c46529077f56d67fd)Patching `help` now.

gltewalt

[19:45](#msg61d5f54b526fb77b3164eae7)@greggirwin `split-path` is too dense. Your split-path is better, is it not?

greggirwin

[19:48](#msg61d5f6052a210c38c1b35e20)The old one is pretty dense, but at least not too large. Mine is \*different* and a breaking change, so not to be considered lightly. If we want magic relative dirs added, per my comments on the ticket, mine will get uglier as well.

gltewalt

[19:50](#msg61d5f6929b470f3897506206)@hiiamboris Yeah `Red 0.6.4 for Linux built 30-Dec-2021/17:47:48-07:00 commit #972994d`

[19:54](#msg61d5f762742c3d4b2181ae46)According to this `Splits a file or URL path. Returns a block containing path and target`, `split-path %""` should be `[%./ none]` Right?

[19:57](#msg61d5f82e742c3d4b2181b006)Because their is no target.

zentrog:matrix.org

[19:58](#msg61d5f877e1a1264f0a400fa2)From a purely logical standpoint, the existing behavior makes sense to me. If the function is meant to always return a directory part with a file part - I like `none` better for "no file part", instead of a `file!` which cannot exist. But maybe there are some use cases which are really awkward dealing with that? I've never used it so far though. I always run into little things that are different from my expectations, and it's not always clear to me what the idiomatic way would be.

gltewalt

[19:59](#msg61d5f8a15ee4df335acd431f)And `none` is a result of `find` when find fails

zentrog:matrix.org

[20:00](#msg61d5f8c6d41a5853f9369c94)A test could be added which checks that all defined function specs are valid

greggirwin

[20:11](#msg61d5fb5c526fb77b3164fb97)@zentrog:matrix.org that's a good use case for a static analyzer. This is a case of `help` being specific in the attrs it checks for, rather than just accepting a block, and suffered the classic fate of other changes breaking that. :^\\

[20:13](#msg61d5fbd4526fb77b3164fc84)It's also an interesting area because people can write new func-making wrappers that don't follow the same spec, and which `help` will then choke on. What it does in that case is show you the source as a fallback.

gltewalt:matrix.org

[20:23](#msg61d5fe27d41a5853f936a9db)Hey, I use the wrong "there"

greggirwin

[20:59](#msg61d6069b2a210c38c1b38c7d)I all do that sometimes.

## Sunday 9th January, 2022

GiuseppeChillemi

[20:41](#msg61db48616d9ba23328b2ab38)Could user defined part be added to the new function specs? I mean `[USR: [content]]` and everything inside it is ignored but accessible. It would be great for flagging, tagging, cataloging, so extending the functions info.

hiiamboris

[21:04](#msg61db4df5742c3d4b218bed29)no

## Monday 10th January, 2022

rebolek

[06:07](#msg61dbcd3ce1a1264f0a4b033a)It can, if you write your own function constructor.

[06:09](#msg61dbcd992a210c38c1be7d0a)Or you can abuse refinements for that

gurzgri

[07:48](#msg61dbe4c85dc6213cd4d3ff6e)Is this to be considered a bug? I would expect LENGTH? to return 20, but it returns what seems to be a memory address or some other random value:

```
Red []
register-scheme make system/standard/scheme [name: 'len actor: context [
    open: func [port] [port]
    length?: func [port] [20]
]]
probe length? port: open len://test ;== 75611332
```

Or is it some kind of misunderstanding on how port schemes are supposed to be implemented?

rebolek

[08:20](#msg61dbec6a46529077f578c0aa)Interesting. @qtxie do you know what is going on here?

Oldes

[08:54](#msg61dbf446f5a3947800f97efa)@gurzgri it's a bug... the `length?` on opened `len` port should return `20` according your spec.

[08:55](#msg61dbf49d7842bd3ca93b192e)In Rebol3 it is:

```
sys/make-scheme [
	name: 'len
	actor: [
	    open: func [port] [port]
	    length?: func [port] [20]
	]
]
length? open len://test ;== 20
```

gurzgri

[09:00](#msg61dbf5ade1a1264f0a4b55b2)I'll open a ticket then, thanks for confirming.

gltewalt

[17:21](#msg61dc6b0182a4667b256bb243)

[17:21](#msg61dc6b112a210c38c1bfd82b)

```
>> b2: ["aa" "bb"]
== ["aa" "bb"]
>> unique form b2 
== "a b"

>> b2: ["aa" "bb" "cc" "dd"]
== ["aa" "bb" "cc" "dd"]
>> unique form b2 
== "a bcd"
```

hiiamboris

[17:23](#msg61dc6b76f5a3947800fa90e4)no

gltewalt:matrix.org

[17:23](#msg61dc6ba9f5a3947800fa917c)It's unique-ing space also?

gurzgri

[17:28](#msg61dc6cd3f5a3947800fa94aa)

```
>> unique probe form b2: b2: ["aa" "bb" "cc" "dd"]
"aa bb cc dd"
== "a bcd"
```

(edit after re-reading your question:) Yes, it uniquifies spaces, too. `unique` on strings removes all duplicate chars just as it should, I'd say.

gltewalt:matrix.org

[17:32](#msg61dc6d97bfe2f54b2e0f8391)Should it be when applied to string though

gurzgri

[17:35](#msg61dc6e552a210c38c1bfe0a5)Yes it should, as per definition. `unique` removes all duplicate values from string arguments.

[17:35](#msg61dc6e67526fb77b31716102)i.e., all duplicate chars

gltewalt:matrix.org

[17:51](#msg61dc72235ee4df335ad9d9b1)That it does according to description, and "should it?", are different things

gurzgri

[17:58](#msg61dc73abe1a1264f0a4c7a67)Ah, I'm sorry, I didn't realize that you're actually proposing a different behaviour than the one spec'ed. Then you'll probably need some very good arguments for your proposal, because that would be a very breaking change.

greggirwin

[19:17](#msg61dc86459b470f38975d1333)@gltewalt:matrix.org I second @gurzgri here. First, tell us why it should. Think about all the other cases, including non-string cases, what they should return, and how you'll reason about them. Maybe throw a `sort` in there to prime the problem pump.

## Wednesday 12nd January, 2022

greggirwin

[00:01](#msg61de1a73742c3d4b2191f330)@GiuseppeChillemi WRT https://gitter.im/red/bugs?at=61db48616d9ba23328b2ab38 and func metadata, it needs to be a fully-fleshed out proposal. Metadata is good, but we don't want func specs to become bloated. It's also important to think about whether, or how the data may be used at runtime, and how it may be exploited as a security risk. Even in a live system, like Smalltalk, it sometimes makes sense to separate the data for processing and handling.

For example

```
Re: WRT: func ['name content][ <add content to system catalog> ]
WRT incr [<INCR metadata here>]
```

With an approach like this, you can still put the data close to the context of the function, but can also spec more definitively what its purpose is, formats allowed, etc. With a general dumping ground, things get much messier, as I'm sure we'll see in the wild with `face/extra`.

toomasv

[08:24](#msg61de90527842bd3ca940e304)@GiuseppeChillemi But you can also define you func in context containing metainfo, e.g.:

```
>> context [meta: "My additional thoughts on this func" set 'my func [arg /meta][if meta [print self/meta] arg]]()
>> my/meta 1
My additional thoughts on this func
== 1
```

GiuseppeChillemi

[23:13](#msg61df60a182a4667b25724edd)@toomasv This solution is good but not readable.

[23:48](#msg61df68c9526fb77b3177f384)@greggirwin  
&gt; With a general dumping ground, things get much messier, as I'm sure we'll see in the wild with face/extra

I like this idea as it gives the flexibility you need. `self/extra` or `/user` and you can store and you `LOAD` without reducing anything.

I am experimenting with using this inside the function's body (I would prefer having it in function's SPECH)

```
F-INFO: [
		STATUS: []
		VERSION: 1.0
		LOG: {}
		TODO: {}
		NOTES: {}
		DOCS: {}
		IDEAS: {}
	]
```

But I have found it can also be included in specs body using this technique:

```
f: func [
  arg 
  /local
  any-local 
  F-INFO {
		STATUS: [WORKING]
		VERSION: 1.0
		LOG: {}
		TODO: {}
		NOTES: {}
		DOCS: {}
		IDEAS: {}
}
] [
  <my-function-body>
]
```

And you can get it using:

```
>> parse spec-of :f [thru 'f-info s: (probe info: load first s) to end]
[
    STATUS: [WORKING] 
    VERSION: 1.0 
    LOG: "" 
    TODO: "" 
    NOTES: "" 
    DOCS: "" 
    IDEAS: ""
]
```

Now `info` contains our information block.

I am starting to adopt this technique so I can start to keep track of each function stage of development as we do with the script header.

## Thursday 13th January, 2022

greggirwin

[00:10](#msg61df6de87842bd3ca942bf35)As long as you accept the risk that Red may break code that does clever things like this. :^)

GiuseppeChillemi

[08:58](#msg61dfe9c96d9ba23328bc9f7c)In this case, first position in the body of function is a safer place.

[16:11](#msg61e04f327842bd3ca944750d)@greggirwin Do you think we could continue this discussion elsewhere?

greggirwin

[19:36](#msg61e07f47e1a1264f0a554555)I don't like the func body hack either. Nenad and I talked about it recently. I'm overloaded, but if others want to chat in red/red or elsewhere for fun, I will at least skim things.

## Friday 14th January, 2022

hiiamboris

[14:38](#msg61e18afbf5a394780005c2c9)@greggirwin this quite surprised me when I used it inside the lexer's trace func:

```
>> x: block!
== block!
>> ? x
    code             length: 0 index: 24 []
    b                length: 0  []
    p                length: 0 index: 7 []
    e                length: 0 index: 3 []
    included-scripts  length: 26  [%/d/devel/red/common/expect.red %/d/de...
```

[14:40](#msg61e18b437842bd3ca947153d)I understand technically there's no difference between `? x` and `? block!` but talk about shooting off one's feet..

[14:41](#msg61e18b96d41a5853f94e122b)Somehow in R2:

```
>> x: block!
== block!
>> ? block!
Found these words:
   any-object!     block!    length: 3
   any-path!       block!    length: 3
   bar-effect      block!    length: 4
   base-effect     block!    length: 4
   ctx-edit        block!    length: 152
   ctx-viewtop     block!    length: 371
   datatypes       block!    length: 54
   dtw-keymap      block!    length: 18
   immediate!      block!    length: 17
   internal!       block!    length: 3
   scalar!         block!    length: 7
   suffix-map      block!    length: 25

>> ? x
No information on x (word has no value)
```

[14:42](#msg61e18bc682a4667b2576e742)the output I don't even understand :)

[14:42](#msg61e18bd2bfe2f54b2e1a7a16)why would it have no value..

toomasv

[15:16](#msg61e193be7842bd3ca9472991)That's what I get in fresh console (Jan 11 build, W10):

```
>> x: block!
== block!
>> ? x
No block values were found in the global context.
```

And in not so fresh I get looots of blocks:

```
>> x: block!
== block!
>> ? x
    val              length: 6  [455x1055 15x15 square to-right 0x0 []]
    B1               length: 119 index: 2 [translate 0x0 [push [fill-pen 0.0.0 line-width 1.0 box 0x0 15x1...
    B2               length: 115 index: 6 [translate 15x0 [push [fill-pen white line-width 1.0 box 0x0 15x...
...
```

hiiamboris

[15:35](#msg61e19828526fb77b317c8b65)well I must have had some globally defined blocks

```
>> x: block!
== block!
>> ? x
No block values were found in the global context.

>> ? block!
No block values were found in the global context.

>> b: []
== []
>> ? x
    b                length: 0  []

>> ? block!
    b                length: 0  []
```

[15:35](#msg61e1984b742c3d4b2199481f)anyway what I wanted to know is what `x`'s value is, not how many blocks there are around :)

[15:36](#msg61e1987f526fb77b317c8c01)`x` in this case is the `type` parameter passed to me by the lexer, and I wanted to know if it passes me words or datatypes (`??` is of no help here, nor `mold/all`)

toomasv

[16:02](#msg61e19eb06d9ba23328c055f1)Ah, sorry, my head is a bit hazy now... so, why `type?` is not good?

hiiamboris

[16:07](#msg61e19fd682a4667b257714fe)it's what I did eventually `print [type type? type]`, but obviously during debugging I'd like to intrude less into the code, so `?` was my first try

gltewalt:matrix.org

[16:42](#msg61e1a800d41a5853f94e5198)Quote it?

gltewalt

[16:48](#msg61e1a9626d9ba23328c06d67)

```
>> x: 'block!
== block!
>> ? x
X is a word! value: block!

>> ? (reduce x)
    b                length: 0  []
```

hiiamboris

[16:49](#msg61e1a98e6d9ba23328c06dd7)I don't get to choose what lexer spits at me.

gltewalt

[17:07](#msg61e1add65dc6213cd4e08fbd)`datatype?` ?

gltewalt:matrix.org

[17:10](#msg61e1ae7b526fb77b317cc06d)That should say yes or no to if it passes you a datatype

hiiamboris

[17:11](#msg61e1aec35dc6213cd4e09315)you're totally missing the point ☻

gltewalt:matrix.org

[17:12](#msg61e1aefa9a3354540621fff9)Does not surprise me, but that's what you typed

hiiamboris

[17:30](#msg61e1b34ed143b14f831920ff)R3 btw:

```
>> x: block!
== block!

>> ? block!
BLOCK! is a datatype.
It is defined as a series of values.
It is of the general type block.

Found these related words:
  datatypes       block!     length: 57 [end! unset! none! logic! integer! decimal! percent! money! char! pair! tu...

>> ? x
X is a datatype of value: block!
```

[17:32](#msg61e1b39c9a33545406220a50)there's a great idea there, brilliant even:

```
>> ?? ?
...
 datatype? :value [
     spec: spec-of :value
     either :word <> to word! :value [
         output ajoin [
             "^[[1;32m" uppercase mold :word "^[[m is a datatype of value: ^[[32m" mold :value "^[[m^/"
         ]
     ] [
         output ajoin [
             "^[[1;32m" uppercase mold :word "^[[m is a datatype.^[[m^/"
             "It is defined as" either find "aeiou" first spec/title [" an "] [" a "] spec/title ".^/"
             "It is of the general type ^[[1;32m" spec/type "^[[m.^/^/"
         ]
         unless empty? value: dump-obj/match/only system/contexts/lib :word [
             output ajoin ["Found these related words:^/" value]
         ]
     ]
     throw true
 ]
```

mikeyaunish

[19:37](#msg61e1d1095ee4df335ae5933f)@hiiamboris here is what I get.

```
>> x: block!
== block!
>> ?? x
x: block!
>> v: mold x
== "block!"
```

greggirwin

[20:01](#msg61e1d68b82a4667b257797da)Here's what I get in R3 (Atronix). You must be using a different one. Maybe @Oldes version based on the escapes in there.

```
>> x: block!
== block!

>> ? x
x is a datatype
It is defined as a series of values
It is of the general type block

No values defined for x
>> ? block!
block! is a datatype
It is defined as a series of values
It is of the general type block

Found these related words:
   datatypes       block!    length: 58
```

So `? x` is not helpful there IMO. And this is the key question: What should `help` do?

hiiamboris

[20:04](#msg61e1d7545dc6213cd4e0eb37)do what Oldes' R3 does

greggirwin

[20:09](#msg61e1d87ad41a5853f94ec0ed)Open a ticket if you want. Can't think deeply about it right now.

hiiamboris

[20:18](#msg61e1da7b526fb77b317d1ebc)done

## Saturday 15th January, 2022

toomasv

[13:25](#msg61e2cb4a526fb77b317ec21f)This crashes console on W10:

```
x: [a 1] case/all [a: x/a [a] b: x/b [b]]
```

hiiamboris

[13:45](#msg61e2cfee526fb77b317eca1a)true

[13:45](#msg61e2cff77842bd3ca949712c)better report that to Nenad though ;)

toomasv

[14:42](#msg61e2dd392a210c38c1cd5903)Another problem with console on W10: generate a view, let it fall behind some other window, close the view without bringing it into foreground first -- console that produced the view hungs.

hiiamboris

[14:57](#msg61e2e0d27842bd3ca9499025)`view [base rate 0:0:3 on-time [unview]]` works for me

[14:58](#msg61e2e10f9a33545406244088)oh if I kill it from task manager then hangs

[14:58](#msg61e2e12cf5a3947800083c69)actually it still works just doesn't print anything

[14:59](#msg61e2e1375ee4df335ae7724b)I can type `view [] (enter)` and show another window :)

[14:59](#msg61e2e15746529077f5879515)create an issue

toomasv

[15:03](#msg61e2e2247842bd3ca9499273)This does not correspond to my description. Do this: in console enter `view [base]`. Click into console. Mouse over console icon in bottom of screen and close the view from there. My console hangs. Does yours?

hiiamboris

[15:10](#msg61e2e3dd742c3d4b219bb521)like I said it doesn't hang

[15:10](#msg61e2e3f9bfe2f54b2e1d07a5)try inputing `ESC view [] ENTER` blindly even though it doesn't reflect keystrokes

[15:11](#msg61e2e40446529077f58799cd)menu also works

greggirwin

[20:24](#msg61e32d6546529077f5881dc9)Confirmed `case/all` crash.

Console hang issue confirmed as well. Scroller itself still moves, but the text area doesn't respond.

mikeyaunish

[20:54](#msg61e3348ed41a5853f9512913)Checking in on a new behaviour.

```
Red 0.6.4 for Windows built 4-Feb-2021/17:06:04-07:00 commit #6440af5

>> foreach i jo [ print [ type? i mold i ]]
datatype logic!
datatype percent!
datatype date!
datatype file!
datatype tuple!
datatype pair!
datatype string!
datatype word!
datatype set-word!
>> find jo file!
== [file! tuple! pair! string! word! set-word!]
```

Since Feb/2021 build find gives this result:

```
>> find jo file!
== none
```

I can work around this. Just checking to see if this is an intentional change?

greggirwin

[21:31](#msg61e33d1ad143b14f831beba7)This feels like a regression related to `/only`. You can use `find/only` for now, but we should check tickets, as there are a couple related to this.

[21:32](#msg61e33d502a210c38c1ce0116)https://github.com/red/red/pull/4924

hiiamboris

[21:42](#msg61e33fc46d9ba23328c34c1c)this is september though

[21:45](#msg61e340739b470f38976b23f0)I confirm this is the cause and it was intentional. Now:  
\- /only finds `file!` datatype  
\- no-/only - finds any value of `file!` datatype

[21:45](#msg61e3407e7842bd3ca94a391c)before this PR it was a crazy mix of both

greggirwin

[22:22](#msg61e349226d9ba23328c35c42)Thanks @hiiamboris.

## Sunday 16th January, 2022

mikeyaunish

[00:44](#msg61e36a53e1a1264f0a5ae978)Great - thanks for clearing that up. The new usage makes sense.

## Thursday 20th January, 2022

Oldes

[22:32](#msg61e9e319f5a39478001639b2)It is nice, that `trim` works on binary as:

```
>> trim/head #{0011002200} 
== #{11002200}
>> trim/tail #{0011002200} 
== #{00110022}
```

But I believe, that when used `trim/head/with`, it should throw an error, that incompatible refinements are used instead of ignoring the `/head` silently:

```
>> trim/head/with #{0011002200} 0
== #{1122}
```

[22:35](#msg61e9e3cc82a4667b25879129)The same with normal string:

```
>> trim/head/with "abcabc" #"a"
== "bcbc"
```

gltewalt

[22:38](#msg61e9e4749b470f3897789289)There are other instances of functions with incompatible refinements. No errors thrown.

hiiamboris

[22:39](#msg61e9e489e1a1264f0a680f43)all of them should be fixed :)

Oldes

[23:36](#msg61e9f21582a4667b2587ac16)And this seems to be clear error:

```
>> head trim/tail back tail #{0000110000}
== #{0000110000} ;<--- Wrong, should be #{00001100}
```

This is ok:

```
>> head trim/head back tail #{0000110000}
== #{00001100}
```

## Friday 21st January, 2022

greggirwin

[00:03](#msg61e9f83e2a210c38c1db8ff5)Why would `/head` and /with\` be incompatible, conceptually?

gltewalt:matrix.org

[00:53](#msg61ea03ef5dc6213cd4f126f9)If they shadow, or "clobber" each other silently.

greggirwin

[00:59](#msg61ea055c742c3d4b21a9f772)That's a bug. You should be able to say "Trim only from the head, and use this alt value." at the same time.

gltewalt

[01:00](#msg61ea05ac46529077f595e894)Unless im miss remembering there are others that clobber

Oldes

[06:21](#msg61ea50d582a4667b258851d8):point\_up: \[January 21, 2022 1:59 AM](https://gitter.im/red/bugs?at=61ea055c742c3d4b21a9f772) That would nice, but it is not as easy as to add the error message for now... currently `/with` is same as `/all`, but with alternate chars... as is noted in the doc string:

```
/with        => Same as /all, but removes characters in 'str'.
        str          [char! string! binary! integer!]
```

[06:25](#msg61ea51c482a4667b2588535d)https://github.com/red/REP/issues/52

[07:08](#msg61ea5bdf9a33545406331f8e)

```
red
>> trim/tail #{000000}
== #{00}
```

[07:17](#msg61ea5e0a5ee4df335af6587d)Silently ignored `/with`:

```
>> trim/with [#[none] 1 #[none] 2 #[none]] 1
== [1 2]
```

[07:19](#msg61ea5e85f5a3947800171f5f)not to mention, that: `trim [#[none] 1 #[none] 2 #[none]]` should be `[1 #[none] 2]` instead of `[1 2]`, because that is known issue https://github.com/red/red/issues/4210

## Sunday 23th January, 2022

greggirwin

[20:55](#msg61edc0af742c3d4b21b0eef6)

```
>> sort/compare [[a 3] [c 1]] 2
*** Script Error: incompatible or invalid refinements
*** Where: sort
*** Near : 2
*** Stack:
```

Should work. In May-2020 it changed from "value out of range" to this error. I don't see a ticket for it. Does anyone know of this being reported already?

hiiamboris

[20:58](#msg61edc17346529077f59cbad8)no it's not reported

greggirwin

[20:58](#msg61edc1866d9ba23328d7da6e)Thanks. :+1:

[21:06](#msg61edc3396d9ba23328d7dded)https://github.com/red/red/issues/5050

## Tuesday 25th January, 2022

gltewalt

[01:25](#msg61ef5191bfe2f54b2e35541b)should `body-of` applied to a native! give an error?

[01:25](#msg61ef51a55ee4df335aff9ad6)The latest build returns an integer

[01:27](#msg61ef5204d143b14f83337c13)

```
>> body-of :zero?
== 98
>> add body-of :zero? body-of :print
== 121
```

[02:47](#msg61ef64bebfe2f54b2e3576f8)What the heck?

```
>> set/some [a none c][1 2 3]
== [1 2 3]
>> a
== 1
*** Script Error: ask does not allow integer! for its question argument
*** Where: ask
*** Near : result
*** Stack: ask
```

[02:47](#msg61ef64dbd41a5853f96928f1)Fresh session. `a` not previously set to anything

greggirwin

[04:31](#msg61ef7d31e1a1264f0a727d8c)`Body-of` returning an int is something we can note, about why, but it doesn't hurt anything to do so at this time.

In the second example, you are redefining `none` to be `2`, so all bets are off on behavior after that.

gltewalt:matrix.org

[04:33](#msg61ef7d8a9b470f389782fe12)Isn't set/some not supposes to set none ?

[04:34](#msg61ef7dc06d9ba23328db2948)Even if it's backwards

greggirwin

[04:34](#msg61ef7dd9526fb77b31975de1)Nope. It does not treat `'none` specially if on the left hand side.

[04:34](#msg61ef7de3d143b14f8333cad3)Because it's not a `none` value, it's just a word.

[04:36](#msg61ef7e345dc6213cd4fb648b)And, yes, this can lead to "Should Red have at least a \*few* keywords to avoid this kind of thing?" The answer being: No. :^) At least not until somebody comes up with a complete and rock solid proposal for that.

[04:36](#msg61ef7e5b2a210c38c1e5cefb)Note that the doc string clearly states "In a block or object \*value* agrument".

gltewalt:matrix.org

[04:39](#msg61ef7f0b526fb77b31975fe3)Yep but if for some reason they have unrelated blocks and decide to set the wordss of one to the values of the othet

[04:40](#msg61ef7f43d143b14f8333cdda)Low probability, but chaos ensues

[04:43](#msg61ef7fd7526fb77b319761cc)Any complete proposal shouldn't be more than: none, true, false

[04:46](#msg61ef809a82a4667b2591ef1b)Maybe... NaN

gltewalt

[12:32](#msg61efedd56d9ba23328dbfd0e)I haven't looked at how `reflect` works yet, but:

```
>> probe get 'print
make native! [[
    "Outputs a value followed by a newline" 
    value [any-type!]
]]
```

[12:33](#msg61efee295ee4df335a00bd3e)Which is better than `23`

[12:37](#msg61efeefa7842bd3ca96322ce)And, am I further confused?

```
>> set/some [a b c][1 none 3]
== [1 none 3]
>> b
== none
```

rebolek

[12:45](#msg61eff0e6bfe2f54b2e368650)@gltewalt what’s your confusion here?

gltewalt:matrix.org

[12:52](#msg61eff27c742c3d4b21b53112)Spec says it isny supposes to set a word to a none value?

[12:52](#msg61eff29446529077f5a0e8d2)Isn't supposed to

rebolek

[12:55](#msg61eff32d9b470f389783e2f6)Ah, I see.

[12:57](#msg61eff3d79a335454063d9a18)Again, you are confusing `none` word with `none!` value.

```
>> type? b
== word!
```

[12:58](#msg61eff3e7bfe2f54b2e368c86)If you do `reduce [1 none 3]`, it works as expected.

[12:58](#msg61eff3f982a4667b2592d1ee)or `[1 #[none] 3]`

gltewalt:matrix.org

[14:52](#msg61f00eafe1a1264f0a73a1c9)I know that none in an unreduced block is just a word.  
Isn't it the job of /some to check the value (reduce)?  
If the words none are fine to set, no reason to use/some. Just use set.

hiiamboris

[14:55](#msg61f00f616d9ba23328dc404c)why would `set` reduce anything?

gltewalt:matrix.org

[16:38](#msg61f02793d143b14f833526f5)The some refinement would iterate, get the value, and act accordingly

[16:39](#msg61f027bd5dc6213cd4fcbdf6)Set by itself shouldn't

hiiamboris

[16:56](#msg61f02bc95ee4df335a013cf3)don't complicate things :)

gltewalt

[17:26](#msg61f032dbd41a5853f96ac5c4)Looks like it's not an issue if collecting values. The issue is the human not being able to tell if it's #\[none] or none if they look at a block of values that has been collected.

[17:27](#msg61f032ea9b470f3897846761)

```
>> x: ["a" "b" "c"]
== ["a" "b" "c"]
>> y: [none none none]
== [none none none]
>> type? y/1
== word!
>> z: collect [foreach i x [keep find i "Oh"]]
== [none none none]
>> type? z/1
== none!
```

hiiamboris

[17:33](#msg61f0344f742c3d4b21b5c18d)what's `b`?

gltewalt

[17:33](#msg61f0346fd41a5853f96ac90f)Oh... I forgot to change it

[17:33](#msg61f0347c6d9ba23328dc8fdd)There

[17:34](#msg61f034bd5dc6213cd4fcda6d)That begs the question, should functions returning none, return #\[none] ?

hiiamboris

[17:35](#msg61f034d2bfe2f54b2e3718ee)funny, they actually do return `#[none]`

[17:36](#msg61f035039b470f3897846c76)you got a really strange mental model there

gltewalt:matrix.org

[17:37](#msg61f03574f5a394780022272b)Lexically they don't. For the humans.

hiiamboris

[17:38](#msg61f035b27842bd3ca963b6ee)but it's humans who prefer `none` as it hurts the eye less

rebolek

[17:39](#msg61f035d75dc6213cd4fcdc04)I agree it can be confusing sometimes and having literal `none` (and logic values) would make things easier.I sometimes run into that too, especially in `parse` where you write a dialect that checks for `none!` and depending if a human writes it or if the machine produces it, `none` can be either a `word!` or `none!`.

gltewalt:matrix.org

[17:39](#msg61f035e19b470f3897846e31)Maybe so, but then they have to check types. Can't tell by looking

rebolek

[17:40](#msg61f035fe5dc6213cd4fcdc1b)OTOH all words have invisible properties in Redbol.

[17:40](#msg61f036065ee4df335a015461)Like context.

gltewalt:matrix.org

[17:40](#msg61f03614d41a5853f96acc09)You see I'm not so crazy

rebolek

[17:40](#msg61f036297842bd3ca963b79f)It’s just that you need to get used to it.

[17:41](#msg61f036492a210c38c1e749f6)Red is different than most of the languages, but it’s different for a reason.

[17:41](#msg61f0366582a4667b25935c5a)Can some things be improved? Certainly. Do you know how? Write a proposal.

gltewalt:matrix.org

[17:43](#msg61f036a62a210c38c1e74b21)Can you give an example of when literal none, true, and false would be bad?

rebolek

[17:44](#msg61f036e35dc6213cd4fcdde4)That’s not the point. The point is, how would they look?

gltewalt:matrix.org

[17:44](#msg61f037159a335454063e2b00)Honest question though, as I cant off the top of my head, but I'm nowhere near a guru

rebolek

[17:44](#msg61f03716742c3d4b21b5c7c9)You can’t use `none` because that would limit its use in dialects if it wouldn’t be a `word!`.

hiiamboris

[17:46](#msg61f0376ef5a3947800222ba0)perhaps we should write this reasoning down somewhere for the future reader

gltewalt:matrix.org

[17:46](#msg61f03774742c3d4b21b5c834)I guess they would look like the construction syntax, since users are already exposed to it

[17:49](#msg61f038249b470f3897847217)It would probably go in Guru Meditations on the wiki. But I don't know how much it gets used.

hiiamboris

[17:55](#msg61f0399d5ee4df335a015b8c)or I might load some XML: `texttext` and having `none` as keyword would trip me up

gltewalt:matrix.org

[17:57](#msg61f03a1ae1a1264f0a73fc70)#\[keyword] ?

hiiamboris

[18:06](#msg61f03c2f46529077f5a1895a)you already have that

[18:06](#msg61f03c3e526fb77b3198de0d)just use mold/all

rebolek

[18:08](#msg61f03caebfe2f54b2e3728a0)@gltewalt:matrix.org `#[none]`

greggirwin

[20:11](#msg61f05966742c3d4b21b6118f)&gt; Any complete proposal shouldn't be more than: none, true, false

What about `[on off yes no]`? Those are also logic values and will break code that uses them just like `[true false]`. And `unset`? \*All* the `datatype!` words? Those suffer the same problem. Then what about `if` and every other standard function. You tripped over `none`, but redefining any standard function will break code. The more common, the more code.

This design aspect is fundamental to Red. @rebolek noted a key reason: dialects.

Any complete proposal is going to take a long time and be a lot of work, because it has to address \*everything* related to words, their evaluation, and their forms.

The issue of construction syntax (serialized form), and whether or how to show more details by default in the console, is in active chat by the team.

gltewalt:matrix.org

[20:30](#msg61f05dfe5dc6213cd4fd333f)On off yes no, are aliases. Unset is like none, but datatype! words are not.  
I dont think anyone talks about making function names reserved.

[20:31](#msg61f05e349a335454063e803d)Easier to browbeat you over coffee

greggirwin

[20:49](#msg61f062757842bd3ca9641748)If you're going to browbeat me, you're buying. ;^)

rebolek

[22:35](#msg61f07b3482a4667b2593ebb6)&gt; Unset is like none, but datatype! words are not.

of course they are! There's the same difference between `none` unevaluated `word!` and `none` evaluated to `none!` and for example unevaluated `string!` word and evaluated `string!` `datatype!`.

## Wednesday 26th January, 2022

gltewalt:matrix.org

[00:27](#msg61f095606d9ba23328dd50c1)None, true,, and false, are self describing. They act as pseudo constants.  
You know if evaluated, none means none!. true means true! false means false!  
Sure, you can do `none: "hi"` or similar.

`s: "string"`  
s is not "self describing", so string! Isn't like none!

greggirwin

[00:28](#msg61f095a7f5a394780022e900)I think @rebolek meant `string!` and `string!`. Can you tell which is a word and which is a datatype?

gltewalt:matrix.org

[00:36](#msg61f097a5742c3d4b21b68fd8)Ah, I see

## Thursday 27th January, 2022

ralfwenske

[01:53](#msg61f1fb255ee4df335a04ee9e)\[!\[image.png](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/2vRG/thumb/image.png)](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/2vRG/image.png)

[01:57](#msg61f1fc07742c3d4b21b954ed)\[!\[image.png](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/SfG9/thumb/image.png)](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/SfG9/image.png)

[01:59](#msg61f1fc6fbfe2f54b2e3ac2cc)I’m playing with Red again on Linux Mint and Mac.  
The above works on Linux fine (apart from the size difference between slider and progress bar).  
On Mac I get an error (see above).  
Red 0.6.4 for macOS built 25-Jan-2022/2:32:52+10:00 commit #ae5482d  
Linux is also from 25-Jan-2022  
(the same if I use `view [ title "TABS"….`

hiiamboris

[10:17](#msg61f271497842bd3ca968310a)What exactly causes the error?

ralfwenske

[10:49](#msg61f278b8d41a5853f96f4b87)I can only guess that it might be in layout. Like I showed it works in Linux. I think that a synched ‘\*.red’ source should result in identical result when run in linux, mac or windows version of the same red compiler.

[10:50](#msg61f278e69b470f389789018d)(version)

hiiamboris

[11:12](#msg61f27e26742c3d4b21ba4c29)try to minimize your snippet until you figure out what's causing it?

ralfwenske

[11:30](#msg61f28249d41a5853f96f5dcd)Sorry @hiiamboris - I could have done this in the first place.  
`progress` is the culprit. The program works on Mac when I comment it out.

```
Red [ needs: 'view]
view [ below
    progress 100x20 data 20% react [face/data: s/data]
	s: slider 100x20 data 20%
]
```

results in (not on Linux - only on Mac):

```
*** Script Error: float! type is not allowed here
*** Where: eval-set-path
*** Near : no
*** Stack: view layout eval-set-path
```

hiiamboris

[11:43](#msg61f28558e1a1264f0a78a509)does it happen during `face/data: s/data`?

[11:45](#msg61f285c1e1a1264f0a78a54b)what if you remove `s` line and `react`?

greggirwin

[19:18](#msg61f2eff99b470f38978a07d1)I think @ldci reported a `progress` issue not long ago. We have other tickets for it, but I don't see that one.

ralfwenske

[21:31](#msg61f30f34d41a5853f9708e23)\[!\[image.png](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/ssCO/thumb/image.png)](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/ssCO/image.png)

[21:35](#msg61f3103a6d9ba23328e25797)\[!\[image.png](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/YgiJ/thumb/image.png)](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/YgiJ/image.png)

[21:38](#msg61f310ccd41a5853f97091b9)\[!\[image.png](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/ZjCh/thumb/image.png)](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/ZjCh/image.png)

[21:40](#msg61f31138e1a1264f0a79d8bb)

```
Red [needs: 'view]
view [
    progress 50% 100x20   
]
```

on Mac leads to:

```
*** Script Error: float! type is not allowed here
*** Where: eval-set-path
*** Near : no
*** Stack: view layout eval-set-path
```

hiiamboris

[21:42](#msg61f311ac2a210c38c1ed1dd2)good! now please create an issue so @qtxie can fix it

greggirwin

[21:51](#msg61f313c72a210c38c1ed22ce)Thanks for tracking that down @ralfwenske !

ralfwenske

[22:02](#msg61f316812a210c38c1ed2803)Ticket: Progress bar on Mac causes script error #5056

## Friday 28th January, 2022

ldci

[07:36](#msg61f39d0e6d9ba23328e34afd)For macOS there is a problem with pair!. This code runs

```
Red [
	needs: 'view
]
view [
    p: progress 200 
    do [p/data: 50%]
]
```

qtxie

[12:58](#msg61f3e876742c3d4b21bd1c19)IIRC, the height of the progress bar cannot be changed on macOS and GTK. I agree it should accept pair! without error.

Oldes

[18:40](#msg61f438902a210c38c1ef61c2)Having...

```
>> #{11111111} xor #{ffffffff}
== #{EEEEEEEE}
```

Than isn't this wrong?

```
>> head ((skip #{11111111} 2) xor #{ffffffff})
== #{EEEEFFFF} ;<---- I expected #{1111EEEE}
>> head ((skip #{11111111} 2) xor #{ffff})
== #{EEEE} ;<---- I expected  #{1111EEEE}
```

hiiamboris

[18:48](#msg61f43a7d526fb77b31a0f268)looks weird, however R2 does the same..

Oldes

[18:48](#msg61f43a897842bd3ca96bc710)It does... but I think it is a bug

hiiamboris

[18:49](#msg61f43aab2a210c38c1ef6685)how come Red and R2 has the same bug though?

Oldes

[18:49](#msg61f43ac56d9ba23328e48f87)the index is ignored.. easy to happen.

hiiamboris

[18:50](#msg61f43addbfe2f54b2e3f2d29)actually I think it makes sense what it does

[18:50](#msg61f43ae15ee4df335a095e22)I got it

Oldes

[18:50](#msg61f43af1d41a5853f972d9ae)It does not make sense to me

hiiamboris

[18:50](#msg61f43afbf5a39478002a5ffe)

```
>> #{1111} xor #{FFFFFFFF}
== #{EEEEFFFF}
```

[18:50](#msg61f43b0c9b470f38978c969d)it created new series

Oldes

[18:51](#msg61f43b2e9b470f38978c96fa)ah... right.. so the first is right.

hiiamboris

[18:51](#msg61f43b425ee4df335a095eb5)both are

Oldes

[18:52](#msg61f43b5af5a39478002a609b)But I want to modify only the tail of the first binary

hiiamboris

[18:53](#msg61f43b9f2a210c38c1ef6821)can't think of a builtin solution..

Oldes

[18:53](#msg61f43bb06d9ba23328e49154)In the same way how it is for example:

```
>> head uppercase skip "aaaa" 2 
== "aaAA"
```

[18:54](#msg61f43bee7842bd3ca96bc9ad)So I think, that it ignores the index as I said and just pads the shortest value with 0

hiiamboris

[18:54](#msg61f43bf67842bd3ca96bc9c9)yep

[18:55](#msg61f43c139b470f38978c990c)ideally there should be some `xor-in-place` routine that `xor` would dispatch to but it should be a REP

Oldes

[18:56](#msg61f43c47d41a5853f972dbb8)why there should be `xor-in-place`?

hiiamboris

[18:56](#msg61f43c576d9ba23328e492d1)isn't that what you want? modify the buffer?

Oldes

[18:57](#msg61f43c859a33545406464b5b)I wanted:

```
>> head ((skip #{11111111} 2) xor #{ffff})
== #{1111EEEE} ;<--- not #{EEEE}
```

hiiamboris

[18:57](#msg61f43cb47842bd3ca96bcb2c)that's actually `#{EEEE}`

[18:58](#msg61f43cbbd143b14f833d6984)

```
>> head ((skip #{11111111} 2) xor #{ffff})
== #{EEEE}
```

Oldes

[18:58](#msg61f43cd3526fb77b31a0f712)Now it is, but I don't want it to be :/

hiiamboris

[18:58](#msg61f43ceed41a5853f972dd34)you want the original buffer modified, yes

[18:58](#msg61f43cf2f5a39478002a645c)write a routine :)

Oldes

[18:59](#msg61f43cf5d143b14f833d69f1)But the reason probably is, that it does not modify the source, but creates a new binary

[18:59](#msg61f43d0382a4667b259b77a1)so it is not a bug:/

hiiamboris

[18:59](#msg61f43d1bbfe2f54b2e3f32ba)&gt; creates a new binary

as it should :)

Oldes

[18:59](#msg61f43d256d9ba23328e494ad)hm

hiiamboris

[19:00](#msg61f43d3d6d9ba23328e494db)why do you need to modify the original though? is it big?

Oldes

[19:00](#msg61f43d5f9b470f38978c9b38)Ok.. I can pad the second with zeros to get the expected result:

```
>> #{11111111} xor #{0000ffff}
== #{1111EEEE}
```

hiiamboris

[19:01](#msg61f43d945ee4df335a0962e1)yeah or `change` it with the result depending on your needs

zentrog:matrix.org

[19:51](#msg61f449432a210c38c1ef8576)&gt; Ok.. I can pad the second with zeros to get the expected result:  
@Oldes only if the input is all ones though... it needs to be padded with the input inverted

Oldes

[19:53](#msg61f4499d5dc6213cd405326b)Right. I don't want to create so many copies anyway... better to do it byte-by-byte. And optimize later.

## Tuesday 1st February, 2022

Oldes

[09:50](#msg61f9024df5a394780033201f)

```
red
a: make block! 0
b: at [1 2 3 4 5 6 7 8 9] 5
insert/part a b -2
a ;== [5 6 7 8 9] ;<---- it should be [3 4], like in Rebol!
```

greggirwin

[19:31](#msg61f98aac5dc6213cd40eeb24)Hmmmm. This feels like it should be an error. Just a couple quick checks make me think we need to spec this behavior across the board. e.g. `sort` seems to honor it, but `reverse` does not, and `reverse/part b -3` in R2 is an error.

If it's going to work, it should work consistently.

@Oldes do you depend on this behavior?

Oldes

[19:46](#msg61f98e17d41a5853f97c9fb2)@greggirwin no, I don't depend on it... But I want Rebol/Red compatibility and I was just trying this code https://www.curecode.org/rebol3/ticket.rsp?id=856

Why you have a feeling, that is should be an error? To me it is clear, that it is a bug. If there can be

```
copy/part b -2 ;== [3 4]
```

Than it should work also with `insert` and `append`.

[19:47](#msg61f98e469a33545406502635)And it is known issue -&gt; https://github.com/red/red/issues/4106

[19:52](#msg61f98f926d9ba23328ee7c0e)And the `reverse/part` should also work... in Rebol3 it does:

```
>> b: [1 2 3 4] reverse/part tail b -2
== [4 3]
>> b
== [1 2 4 3]
```

greggirwin

[20:14](#msg61f994b7d143b14f83473d51)&gt; Why you have a feeling, that is should be an error?

Where you think it should work because another func works that way, I'm looking at it from "What does a negative part even mean?"

&gt; /part Limit the length of the result.

You can't have a length less than zero for a series. Given a `series!` value for `length/range` is different than an `number!`, so we need to define the behavior for both.

In the grand scheme, we have to ask if something is useful, and whether it's a win overall when it comes to writing code we can reason about. Another important question is if we disallow something now, can we allow it later without breaking code? In this case, we can.

I'm not saying we \*shouldn't ever* support negative `part` amounts, but I \*am* saying that we shouldn't propagate unspecified behavior. +100 for a complete `/part` evaluation, design spec, and proposal. :^)

[20:15](#msg61f994dee1a1264f0a85f0bc)Note that @hiiamboris has a general `part` func and design as well, which should be the first thing someone looks at.

Oldes

[21:35](#msg61f9a7940779373db8c36bae)Negative length/range is something, what is completely normal in Rebol... it is sad, that in Red one would have to write:

```
append buffer copy skip tail b -2
```

instead of shorter and more optimal:

```
append/part buffer tail b -2
```

hiiamboris

[21:40](#msg61f9a8e3ced11857f98bf6fa)I totally agree with Oldes.

[21:41](#msg61f9a9113349fe1c71ee67d5)@greggirwin sometimes experiences a hard reset in his design thoughts ;)

[21:43](#msg61f9a966ced11857f98bf7f6)But it's a good note that `part` func should support negative length too.

Oldes

[21:44](#msg61f9a9bc3e52f56a26e2bc36)Where is the `part` func proposal?

hiiamboris

[21:44](#msg61f9a9c9ced11857f98bf911)Unfortunately, looks like Nenad didn't get the point of it, so it's going to just collect dust.

[21:44](#msg61f9a9d603f270478213fb23)https://github.com/red/REP/issues/97

[21:46](#msg61f9aa4db8b082448212e832)It's easy to extend it to negatives by defining `limit` as `abs part` and skipping back the same amount.

greggirwin

[22:56](#msg61f9baa23e52f56a26e2dcdb)Moving to red/red for my response.

## Wednesday 2nd February, 2022

Oldes

[13:37](#msg61fa89154164105ab07993bc)I think that the error message is wrong.

```
>> remove/part (make bitset! "ABC") "AB"
*** Script Error: missing a required argument or refinement
*** Where: remove
*** Near : "AB"
*** Stack:
```

[13:43](#msg61fa8a684164105ab0799668)I believe, that there should be `bad-refines: "incompatible or invalid refinements"`

[13:47](#msg61fa8b60d410244480412cad)Or maybe it could work just like:

```
>> remove/key (make bitset! "ABC") "AB"
== make bitset! #{000000000000000010}
```

hiiamboris

[13:56](#msg61fa8d7eb8b0824482148ef7)I think it should be `invalid-arg` but agree that the existing message is wrong. There's a ticket about messages.

[13:56](#msg61fa8d983349fe1c71f01d26)https://github.com/red/red/issues/4532

## Thursday 3th February, 2022

Oldes

[13:33](#msg61fbd9923e52f56a26e70a5f)I noticed, that in Red one can use:

```
>> rejoin [#{00} [#{01} #{02}]]
== #{000102}
```

which is nice, but:

```
>> rejoin ["a" ["b" "c"]]
== "ab c" ;<---- I expected the inner block to be also joined, so have "abc"
```

[13:35](#msg61fbda093e52f56a26e70b36)Hm... the inner block is just \_formed_ and it has same result like in Rebol :/

```
>> rejoin ["a" ["b" now]]
== "ab now"
```

[13:39](#msg61fbdb1ab8b0824482172ee3)Never mind... it is how it should be. At least I like how it works with binary.

ne1uno

[13:41](#msg61fbdb7103f2704782183df8)Wish `rejoin/deep`

Oldes

[13:41](#msg61fbdb861fe6ba5a9708e1bf)It would slowdown rejoin even more. Looking how complex this mezzanine is, I wonder why I still have such a strong habit to use it.

greggirwin

[18:40](#msg61fc21a1e4c979478d5cff4a)Probably because concatenation is used a lot. In my 2012 func counts, it's about number 25 in the list by use.

## Wednesday 9th February, 2022

Oldes

[16:15](#msg6203e89b41e3293d65e40631)Using `select/skip` in Rebol2 was like:

```
>> data: [a 1 2 b 3 4]
== [a 1 2 b 3 4]
>> select/skip data 'a 1
== 1
>> select/skip data 'a 3
== [1 2]
>> select/skip data 'b 3
== [3 4]
```

while in Rebol3 and in Red it is now:

```
>> select/skip data 'b 3
== 3
```

Would not it be better to have is same like in R2?

hiiamboris

[16:18](#msg6203e95551bd8b580c95b2e7)would be slower if it's a copy

[16:19](#msg6203e98a03f2704782281aad)if it's not a copy, then it's `find/tail`, so pointless

Oldes

[16:24](#msg6203eabd708e9c3dd76e154f)But now to have the same result, you must do:

```
>> either tmp: find/skip/tail data 'a 3 [copy/part tmp 2][none]
== [1 2]
```

[16:28](#msg6203ebad6e4c1e1c845727be)@meijeru https://www.curecode.org/rebol3/ticket.rsp?id=730

[16:34](#msg6203ed18d410244480539f88)I somehow feel, that it should return a block, when `skip-size > 2`

[16:36](#msg6203eda91fe6ba5a9718a8bb)I think that in R2, when `skip-size <= 1`, than it works like if there is no `/skip` and that in R3 the \_block selection_ was never done.

hiiamboris

[16:37](#msg6203ede00779373db8d79119)I can't agree. The role of select is to select, not to `find`. Making yet another special case in the design only to omit one if-expression is not worth it.

[16:38](#msg6203edfa1fe6ba5a9718a97f)`either tmp: find/skip/tail data 'a 3 [copy/part tmp 2][none]`  
is the same thing as  
`if tmp: find/skip/tail data 'a 3 [copy/part tmp 2]`

Oldes

[16:39](#msg6203ee310779373db8d791bb)

```
...
     /skip        => Treat the series as fixed size records.
        size         [integer!] 
...
```

hiiamboris

[16:40](#msg6203ee85a41d896a20892d40)So it does. `skip`s the indexes that are not integer multiples.

toomasv

[16:41](#msg6203eec16e4c1e1c84572eaf)BTW In Red `find/skip/tail` returns \*after the skip\*, not after needle as in your example.

hiiamboris

[16:42](#msg6203eee90779373db8d7939a)Now that \*may* be a bug.

Oldes

[16:42](#msg6203ef074164105ab08c215d)Ok.. counted your opinion. I will wait on @greggirwin's input, why it is how it is and why it cannot be changed, because there are no hard data.

[16:46](#msg6203eff24164105ab08c22d4)So instead of:

```
select/skip data 'a 3
```

there must be:

```
if tmp: find/skip data 'a 3 [copy/part next tmp 2]
```

hiiamboris

[16:49](#msg6203f0956e4c1e1c8457325c)if /tail is final then yes

toomasv

[16:57](#msg6203f25c03f2704782283021)Or

```
all [tmp: find/skip data 'a 3  copy/part next tmp 2]
```

Oldes

[17:18](#msg6203f74b6e4c1e1c84574089)Yes... there are options, but I wanted to know, if everybody is fine with the current single value result from `select/skip`

toomasv

[17:33](#msg6203fad3b8b082448226e981)It might be good to get the whole record after needle, but I usually need just one element of the record, so there is not much difference between

```
pick select/skip data 'b 3 2  ;provided /skip returns block
```

and

```
pick find/skip data 'b 3 3
```

except that in first case there is created an additional block.

hiiamboris

[17:43](#msg6203fd2f6e4c1e1c84574d93)and if you need more than one, it's more efficient to access items in place `row: find/skip ... row/1 row/2 ..` than work with the copy

greggirwin

[20:24](#msg620422f3a41d896a2089a697)I need to get some coffee, as this is an oooold topic and no matter what I say will likely contradict at least something I've said about it in the past. :^) But, to @hiiamboris point:

&gt; The role of select is to select, not to find

Yes it is. First find the value, then select what comes after it.

&gt; select: \*Find* a value in a series and return the next value, or NONE.

[21:39](#msg620434aae4c979478d6cce4f)I did a quick search on R2 code, and got about 125 hits on `select/skip`, roughly discounting dupes by eye. Most common skip value by far is 3. Next is 2. A few used 4. 2 is kind of funny, because it's the same as 1, but returns a block. I imagine this was Carl's clever way of letting you get a single value or a block, but it's a bit odd from a consistency reasoning perspective. I'll come back to this.

That's a good number of uses, which are now broken in Red. I don't know how much it's used in any R3 code, that but that would be good to know. Most important is Red use of course. There it's used 3 times in the Java bridge, and once in `help`. Lots of tests for it though.

From the above chat we know that the `/skip` part applies to the value/key/needle you're searching for; what's returned is separate from that.

I haven't searched old altme chat but, coming back to the first para I wrote, I'm confident that the change was made in R3 because using blocks as key-val stores is one of the most common things people do. The catch is that there is no inherent `/skip 2` when you do that, for `select` or path syntax. \*This* design chat I do remember coming up at times in R2. Most R2 code is probably OK, but every time path syntax is used, or plain `select`, it runs the risk of finding the key as part of a record or non-key value. That's bad. I can't be the only one with multiple versions of helper funcs to avoid this problem. I even ported mine to Red.

The reason the change was made in R3, and adopted by Red, is to avoid the double-clock problem. If you have a key-val model, and your vals are blocks, you get this in R2:

```
>> blks: [a [1 2] b [3 4]]
== [a [1 2] b [3 4]]
>> select/skip blks 'a 2
== [[1 2]]
```

When what you want is what Red/R3 do:

```
>> blks: [a [1 2] b [3 4]]
== [a [1 2] b [3 4]]
>> select/skip blks 'a 2
== [1 2]
```

But that makes you work harder for every other case, outside `/skip 2`. `/only` is already used for the key, so we can't even add that to flatten the result. This is a rock and a hard place. It makes perfect sense to return everything in a "record" when you select for its key (the R2 model), but it also makes perfect sense to optimize for the most common use case.

Raw, flat blocks are harder to reason about as records, but more efficient. the CSV codec has an option for just this reason, as it can make a big difference on large datasets. @hiiamboris considers this in his `part` REP. The idea being that series values could have an internal `skip` value. But that's beyond this issue for now.

Where flat blocks are used, e.g. CSV, they are less often keyed (guessing a bit here, but also thinking back on my own experience), and are based solely on offset and field count. So `select/skip` doesn't apply as often.

Given all that, I think the current behavior is best. What we can and should do, of course, is cookbook an example for the alternate case.

gltewalt

[21:46](#msg620436274164105ab08cbdcf)`/last` is not deep. Is that an issue?

[21:46](#msg6204364edc191b3d69a2f36d)

```
>> select/last [a b c d e f g a h] 'a
== h
>> select/last [a b c d e [f g a h]] 'a
== b
```

[21:50](#msg6204370b4164105ab08cc035)Or should there be a deep? The second example is technically correct since \[f g a h] is a different block

greggirwin

[21:52](#msg620437b6708e9c3dd76ec35d)There is no `deep`. Good exercise to think about why. :^)

## Friday 11st February, 2022

Oldes

[15:57](#msg6206876d0779373db8dd0955)Is `read/info` supposed to be used with the new IO? Because it has no doc-string now.

## Saturday 12nd February, 2022

greggirwin

[02:28](#msg62071b5541e3293d65eac8e2)Right now it returns full HTTP info `[response-code headers content]`. Full I/O behavior is TBD.

Oldes

[09:47](#msg6207821a0779373db8def8e1)I know what it does.. I wonder if the name of the refinement will be kept.

greggirwin

[17:31](#msg6207eed83e52f56a26ff2387)I don't now what everyone knows. :^) I can't commit to the name being frozen at this time.

## Sunday 13th February, 2022

Oldes

[23:12](#msg6209907a708e9c3dd7796f2a)Wouldn't it be better named `read/all` instead? So it would be more in sync with `load/all`?

[23:15](#msg62099127b8b0824482323f6a)Although it would be strange to have `read/all/part`

greggirwin

[23:15](#msg6209912da41d896a20948861)That's a good name, and existing. What we should do is make sure we know what its purpose is for types that support it.

[23:16](#msg62099165ced11857f9ab61c3)`/all` is better for what it returns now, I agree. Because it's not just `HEAD` for HTTP.

Oldes

[23:21](#msg6209927eced11857f9ab6399)Hm.. I think `read/all` is better than `read/info`.. because for example in case of error, it returns the error html content page too.. and not just error. Which is useful.

## Monday 14th February, 2022

endo64

[16:10](#msg620a7edda41d896a20966cc4)I remember `select/skip` discussion with Carl on Altme, but don't remember the conclusion :)

```
b: new-line/skip [a b c d e f g h i] on 3
>> select/skip probe b 'd 3
[
    a b c
    d e f
    g h i
]
== [e f]
```

If we treat series as a record then I want to get the selected part which is `e` and `f`.  
Otherwise I just use `find`.

[16:10](#msg620a7ede03f270478235698a)\[!\[image.png](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/4oqF/thumb/image.png)](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/4oqF/image.png)

hiiamboris

[16:21](#msg620a81753e52f56a26042f44)What if your key is in 2nd or 3rd column?

endo64

[16:22](#msg620a81cc708e9c3dd77b4ed6)You need to organize your data then.

hiiamboris

[16:23](#msg620a81f051bd8b580ca30f5b)Nope. Sometimes you use different columns as keys. E.g. `reactivity.red`

[16:24](#msg620a8229b8b0824482341ad8)You can just use maps with block values if your data is organized, and key is in 1st column.

endo64

[16:26](#msg620a82a1d41024448060ec5e)`select/skip probe b [d e] 3 ; == [f g]` on R2, which I think it should be `[f]`

[16:27](#msg620a82fb708e9c3dd77b54de)Here I found the discussion: http://www.rebol.net/cgi-bin/r3blog.r?view=0194#comments

hiiamboris

[16:35](#msg620a84c641e3293d65f14621)Zero arguments in that, only momentary preferences.  
Well, anyway GC pressure of this design would render select near-useless for anything but console tinkering.

[16:36](#msg620a850d708e9c3dd77b5979)Plus, every select-using function will have to split it's logic based on /skip size.

[16:36](#msg620a852bced11857f9ad41da)Plus, everyone will have to keep this quirk in their minds.

[16:37](#msg620a8534708e9c3dd77b59b7)Horrible idea :)

greggirwin

[18:06](#msg620a9a3f03f270478235a2ec)&gt; GC pressure of this design would render select near-useless for anything but console tinkering.

Or people would still write a lot of useful code, completely ignorant of what happens behind the scenes. Fewer people would optimize beyond that, by choice or need. That's what I think would happen.

## Tuesday 15th February, 2022

Oldes

[13:34](#msg620babd2e4c979478d7bb4d2)There is not much info in the \[Altme chat](http://www.rebol.org/aga-display-posts.r?offset=0&amp;post=r3wp453x13747) either. But it looks that years ago the preferences were to have R2 behavior.

[13:36](#msg620bac421fe6ba5a97283e9f)It's a shame that we don't know Carl's opinion... as many times he asked a question and that was all.

[13:46](#msg620baed141e3293d65f3ab15)And after checking my old code... I used `select/skip` only with `length = 2` (mostly because there was no `map!` type for key-value pairs in Rebol2)

[14:09](#msg620bb408d410244480636ae8)Also in 1238 scripts from rebol.org there is only `select/skip` with `2`.

endo64

[19:16](#msg620bfc284164105ab09c6b2b)Thanks for the info @Oldes

## Saturday 19th February, 2022

zentrog:matrix.org

[01:07](#msg621042ee9bd1c71eca652482)I'm not clear whether this is a bug or by design. I'm trying to `select` with a `path!` to get at a nested value.

```
>> select [a: [b: 123]] 'a/b
== none
```

I thought maybe it's because `select` is looking for a literal `path!`, but these didn't confirm that suspicion either...

```
>> select [a: [b: 123] a/b 456] 'a/b
== none
```

toomasv

[04:40](#msg621074b0257a357825efa4b6)For last one use `/only`. But `select` does not go deep: \*"Find a value in a series and return the next value, or NONE"*

[08:31](#msg6210aaff0909252318e874d3)Path without `/only` works same as block:

```
>> select [a: b: 123 a/b 456] [a b]
== 123
>> select [a: b: 123 a/b 456] 'a/b
== 123
```

But:

```
>> select/only [a: b: 123 a/b 456] 'a/b
== 456
>> select/only [[a: b:] 123 a/b 456] [a: b:]
== 123
>> select/only [[a: b:] 123 a/b 456] [a b]
== 123
```

[08:54](#msg6210b051161ffc40d7798010)Extension :)

```
select*: function [blk key /only][case [
    only [select/only blk key] 
    path? key [foreach k key [blk: select/only blk k]] 
    true [select blk key]
]]
select* [a: [b: 123] a/b 456] 'a/b
;== 123
select*/only [a: [b: 123] a/b 456] 'a/b
;== 456
select*/only [[a: b:] 123 a/b 456] [a b]
;== 123
select* [a: b: 123 a/b 456] [a b]
;== 123
select* [a: [b: 123] a/b [c 456]] to-path [a/b c]
;== 456
>> select* [a: [b: [c: [x y z d 123]]] a/b [c 456]] 'a/b/c/d
== 123
select* [a: [b: [c: [x y z d 123]]] a/b [c/d 456]] to-path [a/b c/d]
== 456
```

[09:25](#msg6210b7a46b91242320f797a1)Better just

```
select-path: function [blk key [path!]][foreach k key [blk: select/only blk k]]
```

gurzgri

[09:49](#msg6210bd0cddcba117a2e49250)Is this a known lexer bug? `transcode "1.79769313486232e308"` (or typing `1.79769313486232e308` in the console) hangs Red 0.6.4 for Windows built 19-Feb-2022/3:17:54+01:00 commit #abb5641.

hiiamboris

[10:29](#msg6210c6879a09ab24f36865c6)nope, pls report it

gurzgri

[10:42](#msg6210c98599d94f5f0c128032)will do

## Monday 21st February, 2022

zentrog:matrix.org

[07:53](#msg621344f80909252318ed675a)toomasv (Toomas Vooglaid): Thanks! That is pretty nice. I was trying to construct a new path and `do` it, but hadn’t gotten that working yet

toomasv

[09:13](#msg621357c899d94f5f0c176caf)@zentrog:matrix.org You are welcome!

## Sunday 27th February, 2022

loziniak

[11:59](#msg621b67b66b912423200cd6c7)

```
>> type? load "[test"
*** Syntax Error: (line 1) missing ] at [test
*** Where: transcode
*** Stack: load  

>> type? load-json "[test"
== error!
```

How do you think, is consistency important here? If yes, should `load` return error, or `load-json` should cause error instead?

hiiamboris

[12:02](#msg621b683ed1b64840db40d576)load-json should cause error instead

[12:03](#msg621b689099d94f5f0c279e69)though Gregg disagreed with this IIRC

greggirwin

[18:50](#msg621bc7ff99d94f5f0c284d43)We need to think about it for all codecs, and other modules as well. CSV causes an error in one case, but returns them in the rest. JSON returns it for a top level problem, but `unescape` is now a routine that `fire`s an error. XML has a lot of `do make error!` calls. @rebolek, is there a reason you don't use `cause-error`?

Error handling choices are always fun. And by "fun" I mean the other thing. :^) There is no single right or wrong here. Consistency is a good thing, but also not universal. This is one of a things I've seen a lot written about in the Java space. If you decide on exceptions (caused/fired/thrown errors), that ripples up to the top of the app that may crash. As you start building levels and layers in apps, each layer has to handle them. In Java this is painful because exceptions are typed, meaning the caller has to handle every specific type of error you may throw in some way, or default to a general handler, which abdicates some responsibility.

In Red, people may eventually build large, layered apps, but for us that issue is much more about libraries. Consistency in the ecosystem will help everyone, but again, we can use too broad a brush. No easy answers.

So let's think about Red's strengths, and how that plays into this. Consider IPC, distributed systems, logging failures, event streams, messaging, HOFs, and more. We may \*not* have a single standard model for error handling.

We can chat in red/red and extract thoughts to https://github.com/red/red/wiki/%5BDOC%5D-Error-handling, or people can add their own thoughts directly there (with self-attribution so we know whose thoughts they are).

hiiamboris

[18:58](#msg621bc9ebc61ef0178e4c45d6)&gt; Consider IPC, distributed systems, logging failures, event streams, messaging, HOFs, and more. We may not have a single standard model for error handling.

I honestly don't understand why we should consider any of that. The only thing we should consider here is whether user has to write `if error? data: load-json` or `if error? try [data: load-json ..]`. And answer here is clear as it comes down to what user gets if he omits `if error?`: a clear error from the JSON codec or something like `error! type is not allowed here`.

greggirwin

[19:11](#msg621bcce7d1b64840db418964)&gt; The only thing we should consider here is whether user has to write...

If that were the case, and easily agreed on as clearly superior, wouldn't all languages use the same mechanism at this point?

[19:12](#msg621bcd2cddcba117a2fa5cbf)In some ways it's like the distinction between assertions and errors.

[19:15](#msg621bcde2161ffc40d78f78fc)&gt; And answer here is clear as it comes down to what user gets if he omits `if error?`

Who is the user? The one writing directly against a call? The person using the library the first one wrote? The front end dev who uses the wrapper and doesn't know that they need to use `try`, so their app crashes?

[19:16](#msg621bce1e0466b352a4f5142f)Believe me, I'll be \*thrilled* if we can find an easy answer to this that everyone agrees on and works universally.

hiiamboris

[19:17](#msg621bce589a09ab24f37e3bd4)I don't really care about those languages. E.g. in C you have to put an error check after \*every* call, which seems nonsensical but has two reasons: exceptions are slower (if you wrap every call in a `try` that is, but if you just use a reasonable number of `try`es then it may even easily be a win), and exceptions were invented much later than C.  
D already throws everywhere by default.

[19:17](#msg621bce65c61ef0178e4c4e01)&gt; The front end dev who uses the wrapper and doesn't know that they need to use try, so their app crashes?

But app crashes either way

greggirwin

[19:22](#msg621bcf756b912423200d86cb)&gt; But app crashes either way

`view [a: area 600x480 button "Load" [a/text: form load %fail2.json]]`

hiiamboris

[19:23](#msg621bcfc7f43b6d783fd98436)counter-example:  
`view [a: area 600x480 button "Load" [a/text: do make error! "fail2.json"]]`

[19:24](#msg621bcff3257a35782505fe89)Basically throw or not comes down to two programming paradigms:  
1\. (old) Meticulously check results at every step and provide error message for every occasion  
2\. (modern) Divide code into more broad blocks and provide messages for every block failure

[19:26](#msg621bd0829a09ab24f37e3ffe)Well, there's 3 (ultramodern) - Do not provide any messages and say "something went wrong" on every failure :)

[19:27](#msg621bd0910909252318fe7ca8)let's not consider it though

greggirwin

[19:32](#msg621bd1e099d94f5f0c285fc5)In your counter-example, it's a more silent failure, yes? I had to test. :^)

Anyway, wrong room to continue the design chat on this.

To get back on topic, do new GUI consoles not let you select with the mouse, after at least one evaluation, unless you go down a line, for anyone else?

hiiamboris

[19:36](#msg621bd2a89bd1c71eca7bd8a7)broken for me too

greggirwin

[19:36](#msg621bd2b58db2b95f0a42ec1c)Thanks. :+1:

## Monday 28th February, 2022

rebolek

[06:43](#msg621c6f16e9cb3c52aef18e9d)@greggirwin  
&gt; is there a reason you don't use cause-error?

Yes, it’s a confusing function without documentation.

[06:43](#msg621c6f2a0466b352a4f62dac)&gt; CSV causes an error in one case, but returns them in the rest.

[06:44](#msg621c6f403ae95a1ec176facf)t should cause them in all cases, I’ll fix that.

greggirwin

[18:36](#msg621d1624257a357825089135)&gt; it’s a confusing function without documentation.

We should address that then. Making errors can be a bit tricky, and we should outline best practices.

Don't change CSV just now, as we have so many other tasks pending. Let's sync everybody up on general error handling models and guidelines, and write that up.

hiiamboris

[18:53](#msg621d1a1d99d94f5f0c2aef16)I agree with Bolek that `cause-error` is quite low level. Preferred way should be the `#error` macro in most cases.

Error catalog is designed for R/S code that uses it extensively, and `cause-error` is just a Red wrapper for that.

In Red code, benefit of `cause-error` is that by using error catalog you don't have to duplicate the same message all over. And also your compiled code also doesn't have to include extra error message strings. So it makes sense to wrap it in \*some* contexts.

In general though, errors are often unique, and if we use `cause-error` in place of clear to-the-point error messages we forfeit important clues and waste our and everybody's time in the end.

[18:53](#msg621d1a40d1b64840db4418b7)It \*can* still be used as alias to `do make error!`, but it's a bulkier alias in this case.

[18:56](#msg621d1ac7257a357825089be8)`cause-error 'user 'message "error text"` vs `do make error! "error text"`

greggirwin

[20:44](#msg621d342f9a09ab24f3810cbb)For me the issue is clarity of intent. `do make error!` makes you think a lot more. At least it does me.

[20:54](#msg621d3679f43b6d783fdc5624)One downside to `#error` is the lack of an active verb in the name, so it looks like a definition more than an action.

I have similar naming issues about `do/cause/fire/throw/...` in the error domain as with all the variants of `append/extend/rejoin/reform/join/ajoin/combine/merge` in string and structure building.

hiiamboris

[21:08](#msg621d39e99a09ab24f38117b8)I proposed a few alternative names \[here](https://github.com/hiiamboris/red-formatting/discussions/20#discussioncomment-2210811), but I would still choose `#error`

[21:09](#msg621d3a046b91242320105e65)Besides, that's far from the only name that is not canonical in Red

[21:16](#msg621d3bbd257a35782508e39c)E.g. `math`, `layout`, `what`

[21:17](#msg621d3beb99d94f5f0c2b3abc)I agree would be nice to have a verb, but is e.g. `#err` better?

greggirwin

[21:26](#msg621d3e0f8db2b95f0a45cdba)We're on the same page. Also in how we can condense the most common patterns when it comes to string output, including interpolation and errors. `Math` is probably best suited as an optional piece. It's a nice example to have included, also so small that it seems silly to break it out. OTOH, it's also limited in scope and `math` is a very broad term. And handy if people want to expose math expressions to end users. They shouldn't have to know about Red's internals. `do-math` or `eval-math` at least verbify it.

hiiamboris

[21:26](#msg621d3e12257a35782508e999)`#fail` would probably be my next fav after `#error`

greggirwin

[21:27](#msg621d3e488db2b95f0a45ce2b)`Layout` is interesting, because it is a verb as well as a noun, and so works very well mapped to a declarative dialect.

hiiamboris

[21:27](#msg621d3e5a8db2b95f0a45ce3c)shouldn't be `lay-out` as a verb?

greggirwin

[21:28](#msg621d3e61f43b6d783fdc673a)I never liked `what`.

[21:28](#msg621d3e8cf43b6d783fdc67a0)&gt; shouldn't be `lay-out` as a verb?

It's an imperfect world. :^)

hiiamboris

[21:28](#msg621d3e92e9cb3c52aef354f4):)

[21:36](#msg621d405af43b6d783fdc6af6)If we switch to emojis, no more verb/noun issues ;)

greggirwin

[21:37](#msg621d4090c435002500cbee0c)I think you mean \*more* issues. :^)

hiiamboris

[21:39](#msg621d4111c435002500cbef34)Of other type, yes ;)

## Tuesday 1st March, 2022

zentrog:matrix.org

[01:28](#msg621d76a06b9124232010d5d4)`complain` is cute, but kind of informal or something. I seem to remember that appearing somewhere else. Does `what` need to be a global value? Maybe it could be folded into `help`. It seems like it doesn't have a clear role distinct from help. For instance, either returning a value, \_or_ printing results (and maybe printing and returning). I think it would have more utility if it just returned results. And why does it reuse the same output buffer?

[02:42](#msg621d882f090925231801e857)I also found `cause-error` extremely confusing. There is no indication what `type` or `id` are used for. And when you intercept an error, it's not super clear what you are supposed to do with it either...

```
>> probe try [do make error! "ack"]
make error! [
    code: 800
    type: 'user
    id: 'message
    arg1: "ack"
    arg2: none
    arg3: none
    near: none
    where: 'do
    stack: 75580124
]
```

`where` is nice, but most other languages would call that the `stack`. So what is this `stack` for? If you just want to present the message to the user, do you just show them `arg1`? What are the other args for?  
I'm not actually asking for answers to these questions, just talking about the thought process.

greggirwin

[06:45](#msg621dc0f60909252318024f2d)- `What` we simply inherited from Rebol, but changing it doesn't break anything beyond unlearning it. I doubt it's used much anyway (I know I don't), because the information isn't presented in a terribly useful way.

\- `cause-error` needs improvement, so I'll ping Nenad on that. Just let him know we're talking about it and may propose something better.

\- `Where` vs `stack` is interesting, and I believe it's OK in the context of Red being data centric, including "code". The new interpreter instrumentation, and @hiiamboris 's improvements on the mezz wrappers are great. Another case of needing to outline guidelines for people as an important step.

rebolek

[08:14](#msg621dd5db161ffc40d7937523)Thinking about `cause-error` a bit more: As CSV is part of the main distro, probably it shouldn’ throw `user error` but its error should be added to error catalog. Then `cause-error` would make sense using.

gltewalt:matrix.org

[15:03](#msg621e35b3e9cb3c52aef53db7)Use this

[15:03](#msg621e35b90466b352a4f9d5e4)\[40f.png](https://gitter.ems.host/\_matrix/media/v1/download/matrix.org/wlzEtivqeYyVPesMhfKgxDlH)

greggirwin

[17:31](#msg621e587b161ffc40d7948f41)Moving to red/red.

## Friday 4th March, 2022

endo64

[08:15](#msg6221ca909bd1c71eca87cb7e)&gt; &gt; its error should be added to error catalog

I agree on that, currently we have `throw, note, syntax, script, math, access, reserved1, reserved2, user, internal` in `SYSTEM/CATALOG/ERRORS`, we might have `codec` or `data` for JSON, CSV, XML codecs.

## Tuesday 8th March, 2022

rebolek

[08:26](#msg6227133c0909252318147a40)

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

I am setting a value not present in the context. Red happily accepts it, even if it can’t set it. I would expect an error in such a case.

toomasv

[09:07](#msg62271ccdf43b6d783fef8fb8)Seems to be regression introduced sometime around June/July last year.

rebolek

[09:11](#msg62271dba257a3578251c3ef2)Thanks, I’ll open a ticket for it.

greggirwin

[22:37](#msg6227dac39a09ab24f395ba2f)Good catch!

## Friday 11st March, 2022

hiiamboris

[11:22](#msg622b310a09092523181c91f7)&gt; Thanks, I’ll open a ticket for it.

@rebolek forgot? ;)

rebolek

[16:37](#msg622b7aafc435002500e7c972)@hiiamboris Yup, totally :) It was a byproduct of working on IO and I focused on it again.

[16:47](#msg622b7d37c435002500e7cdc2)Done https://github.com/red/red/issues/5101

hiiamboris

[16:49](#msg622b7da4c61ef0178e6b1bee):+1:

## Sunday 13th March, 2022

mikeyaunish

[21:09](#msg622e5d6ef43b6d783ffd5edb)Can't seem to catch this `font-size 0` error.

Red 0.6.4 for Windows built 10-Mar-2022/17:40:53-06:00 commit #27f71f9

```
view [
    button "layout with font-size 0" [
        the-vid-code: [base1: base "HELLO" font-color white font-size 0]
        either error? err: try/all [
            output-panel/pane: layout/only the-vid-code 
            true
        ][
            print "error"
        ][
            print "no-error"
        ]
    ]
    output-panel: panel 400x400
]
```

`attempt` didn't seem to catch it either.

hiiamboris

[21:15](#msg622e5edd161ffc40d7b35557)confirmed: `base "x" font-size 0` crashes

[21:15](#msg622e5ee8257a3578252a15b3)pls create an issue

mikeyaunish

[22:39](#msg622e7297161ffc40d7b37781)@hiiamboris OK - thanks.

## Monday 14th March, 2022

greggirwin

[01:14](#msg622e96dbc61ef0178e7091d2)Thanks @mikeyaunish. :+1:

## Thursday 17th March, 2022

loziniak

[02:11](#msg623298d03ae95a1ec1a1c09a)Hello. On my Manjaro Linux machine I get a core dumped when executing any script by console compiled by `echo 'Rebol[] do/args %red.r "-d -r --no-view %environment/console/CLI/console.red"' | rebol +q -s` from latest master.

[02:12](#msg623298f5c435002500f50d93)Example script:

```
Red []
print "test"
```

[02:14](#msg6232998dc435002500f50ed6)Can anyone confirm?

[02:21](#msg62329b296b91242320398650)There is no problem when running scripts from toolchain build \*10-Mar-2022*

hiiamboris

[16:51](#msg62336721c61ef0178e7a1d12)no issue on ubuntu

[16:51](#msg6233672899d94f5f0c565865)

```
>> about
Red 0.6.4 for Linux built 17-Mar-2022/9:27:47
```

[16:52](#msg62336756c435002500f6a0a5)ah wait, I need a script

[16:53](#msg62336787e9cb3c52ae1e41f1)no, still no issue

loziniak

[17:32](#msg623370aec61ef0178e7a3158)I tracked down the error, it's introduced in commit af98e79db717134b924160101f8a1e75566aa575 "FIX: partial fix for #5094."

hiiamboris

[17:36](#msg62337198f43b6d783f0751df)hmm seems I forgot to pull, so on 11 Mar commit now

[17:36](#msg6233719f257a35782533f3c3)let me test on current

[17:39](#msg6233723ad1b64840db6f4fec)yes, segfaults on ubuntu too, after the script is executed

[17:39](#msg62337269c435002500f6b8ad)please add a note on that commit

loziniak

[17:45](#msg623373b0e9cb3c52ae1e599e)ok, sure. thanks for checking

## Thursday 24th March, 2022

GiuseppeChillemi

[11:24](#msg623c54e86b912423204c430f)One of the most recent Red Version console, does not let me select the output of a commands. Has this bug appeared here?

hiiamboris

[11:58](#msg623c5cd3c61ef0178e8b1f12)yep

## Monday 28th March, 2022

rebolek

[07:44](#msg624167519a09ab24f3c5f701)Try typing this in console: `[http://test.com]`. When I press Enter, Red opens a block for me. I must type space before the closing bracket to get this input accepted.

toomasv

[08:24](#msg624170a9f43b6d783f21ad9b)Seems OK on W10.

rebolek

[08:39](#msg624174473ae95a1ec1bd9d73)I tested it with master branch and it’s fine. This happens on IO branch only. Probably some master branch fixes are not merged in.

dsunanda

[17:15](#msg6241ed49c61ef0178e957132) 8-bit arithmetic dept: is this expected?

```
#"a" - #"b"
*** Math Error: math or number overflow

0 + #"a" - #"b"
== -1
```

hiiamboris

[17:18](#msg6241ee00c4350025001225de)yes

[17:19](#msg6241ee1d9a09ab24f3c70ad8)it's not 8-bit, it's because char! codepoint cannot be negative

[17:19](#msg6241ee2999d94f5f0c719d9d)same for tuples, but they are silent

## Wednesday 30th March, 2022

Oldes

[11:11](#msg62443ad809092523184c0d56)It should return `-1` imho instead of the error.

[11:21](#msg62443d37e9cb3c52ae3e3eaa)In R3 it is:

```
>> #"b" - #"a" 
== 1
>> #"a" - #"b" 
== -1
```

But also:

```
>> #"a" + #"b" 
== #"Ã"
```

Which I'm not sure if should not be also an integer instead (but I don't care).

[11:23](#msg62443d9609092523184c14ab)Anyway.. for the subtraction the result is always an offset, which is the most useful result.

hiiamboris

[11:49](#msg624443de8db2b95f0a9080fd)does R3 also auto expand integer on overflow?

dsunanda

[14:14](#msg624465b30466b352a442a626)

```
#"a" - #"b"
```

R2 returns 255, Atronix R3 returns -1, Red errors .... Between the dialects, it looks like every defensible option is catered for :)

Oldes

[14:50](#msg62446e41ddcba117a2481cca)What is wrong with the offset between 2 chars? 255 does not make sense when the char is now 32bit

hiiamboris

[15:44](#msg62447add0466b352a442d243)-1 seems most useful, but has to be consistent with integers IMO

greggirwin

[17:55](#msg624499abd1b64840db8fe481)&gt; for the subtraction the result is always an offset, which is the most useful result.

What makes it most useful? I understand ASCII casing offsets, but that's a very narrow...case. For me it feels odd that arithmetic on matching types produces a different type.

The Red behavior is by design and \[documented](https://github.com/red/docs/blob/master/en/datatypes/char.adoc#arithmetic) but can be changed if it leads to a more consistent and reasonable design. I'm not against removing the error in this case, and we do want to maximize leverage. But we also want to make sure types have consistent and appropriate behavior in their domain.

hiiamboris

[18:40](#msg6244a431f43b6d783f27f8e0)&gt; For me it feels odd that arithmetic on matching types produces a different type.

```
>> 2/2/2 - 1/1/1
== 397
```

greggirwin

[21:36](#msg6244cd52257a3578255504a5)That one I'm normalized to. :^) And why I said it needed to be appropriate to the domain of the type. Returning offsets for chars probably \*is* the best option, and worth thinking about how negative offsets might be used. What are the cases?

hiiamboris

[21:39](#msg6244ce17d1b64840db904bb0)my use case is eliminating boring errors \[like this](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/tracing.md#tracing-sub-expressions-with-traceall)

greggirwin

[21:45](#msg6244cf896b912423205c56df)1) Has anyone ever hit this error in production code? 2) Since it returns an integer offset, we can justify it not erroring out. It doesn't error on `32 - #"a"`, which is a case for consistency.

hiiamboris

[21:46](#msg6244cfc59a09ab24f3ccae5b)do we have "production code" in Red? ;)

[21:47](#msg6244cfe40466b352a4438233)that was not a made up example if that's what you mean

[21:48](#msg6244d01e0466b352a4438258)still I'm not convinced myself we're shuffling things a better way here

[21:48](#msg6244d03a8db2b95f0a91a7b3)if anyone has strong argumentation for the change, open a REP pls

greggirwin

[21:51](#msg6244d0fcd1b64840db90514f):+1:

## Saturday 2nd April, 2022

hiiamboris

[16:35](#msg62487b43c4350025001ed361)I recall someone posted a link to a page with assumptions about time... One of that was "time is always monotonic", lol:

```
>> loop 10000 [t: dt [loop 1000 []] if t < 0 [probe t]]
-0:00:00.0001707
-0:00:00.0005066
-0:00:00.0003257
-0:00:00.0003281
-0:00:00.0003163
-0:00:00.0004959
== none
```

[16:35](#msg62487b5d6b91242320635522)Only reproducible on Windows.

[18:00](#msg62488f53257a3578255c2e49)must be some math error in get-time

greggirwin

[19:10](#msg62489f9cc61ef0178ea27b87)Lamport clocks. :^)

## Sunday 3th April, 2022

GiuseppeChillemi

[14:13](#msg6249ab8b161ffc40d7e7471b)Wow, time machine exists!

dsunanda

[14:31](#msg6249afcdc43500250020e796)@GiuseppeChillemi Clock-independent timing loops were an integral part of the VTOS operating system that was built in the 1980s to support the BABBAGE language. Windows has clearly inherited some of the design goals.  
http://www.tlc-systems.com/babbage.htm

hiiamboris

[15:24](#msg6249bc33f43b6d783f317dd5)&gt; Wow, time machine exists!

Brain is a time machine ;) \[We know the future before it happens](https://www.spiritualityhealth.com/articles/2012/01/27/science-premonitions)

[15:25](#msg6249bc51e9cb3c52ae48b1bb)No wonder Red learned that as well :D

pekr

[15:35](#msg6249bebd257a3578255e3b33)@hiiamboris with your negative time measures, we have finally got ultra fast timers, so we can compete with the LibEvent, LibUV, etc event loops :-) https://stackoverflow.com/questions/9433864/whats-the-difference-between-libev-and-libevent

hiiamboris

[15:38](#msg6249bf68ddcba117a2523b95)lol

## Monday 11st April, 2022

GiuseppeChillemi

[22:01](#msg6254a539c435002500359e16)Is this correct?

```
>> y: [none none!]
>> quote none = pick y 1

** Script Error: = operator is missing an argument
*** Where: catch
*** Near : = pick y 1
*** Stack:
```

greggirwin

[22:15](#msg6254a88a09092523186b4022)Yes.

```
>> quote none
== none

>> = pick y 1
*** Script Error: = operator is missing an argument
*** Where: catch
*** Near : = pick y 1
*** Stack:
```

[22:16](#msg6254a8d3257a3578257314b0)

```
>> 'none = pick y 1
== true
>> #[none] = pick y 2
== false
>> 'none! = pick y 2
== true
```

GiuseppeChillemi

[22:20](#msg6254a99de9cb3c52ae5d8b77)Wow, I didn't know about `'none`

greggirwin

[22:20](#msg6254a9c5257a3578257315e5)It's just a `lit-word!` like any other.

GiuseppeChillemi

[22:25](#msg6254aabfe9cb3c52ae5d8df2)The more I think I know, the more I know I don't know.

[22:27](#msg6254ab576b912423207a6c4d)Also, it is starting to be late.... I have forgotten that as Red priorities work, that phrase is read as:

```
quote (none = pick) y 1
```

[22:28](#msg6254ab8ac61ef0178eb93cb7)I must quit and go to sleep, I am doing the usual late night errors you know.

greggirwin

[23:02](#msg6254b3999bd1c71ecae82dcd):^)

gurzgri

[23:23](#msg6254b88ad1b64840dbae7356)I don't think that is how it is evaluated by the `do` dialect, see

```
>> do/next [quote none = pick y 1] 'step
== none
>> step
== [= pick y 1]
>> do step
*** Script Error: = operator is missing an argument
```

Have a look into the `spec-of :quote` to see how that is defined and why therefore your line is explicitly not evaluated the way you assume.

[23:33](#msg6254bae40466b352a4618cf2)`(none = pick)` would itself raise an error, because then `pick` would be missing it's arguments. If any, then `quote (none = pick y 1)` ⇔ `quote (none = 'none)` ⇔ `quote false` (with the parens only for explicitly demonstrating alledged evaluation order), but as shown: no, not in this order.

[23:40](#msg6254bc5cddcba117a26724bf)Therefore, I'm a bit puzzled too because of

```
>> quote none = pick y 1
*** Script Error: = operator is missing an argument
>> (quote none) = pick y 1
== true
```

greggirwin

[23:48](#msg6254be58257a357825733a4a)https://github.com/red/red/issues/3179 and a couple other related tickets come into play here, because `quote` uses a get-arg.

## Tuesday 12nd April, 2022

hiiamboris

[15:09](#msg6255961109092523186d04ae)It's an optimization as I understand it. Esoteric use case not worthy of slowing down the interpreter with it.

[15:13](#msg62559725d1b64840dbb0222f)Some more esoteric cases can be found here: https://github.com/red/red/issues/941

gurzgri

[15:21](#msg625598eb257a35782574dadd)Okay then, with much emphasis on "okay" :J I'm all against esoteric cases, but was just curious.

Oldes

[21:32](#msg6255efe23ae95a1ec1e4c4b9)

```
>> mold to url! "http://aa/bb[]cc"
== "http://aa/bb%5B%5Dcc" ;<--- OK
>> mold to url! "http://aa/bb()cc"
== "http://aa/bb()cc" ;<--- WRONG, it should be: "http://aa/bb%28%29cc"
```

hiiamboris

[21:54](#msg6255f5226b912423207cf619)https://github.com/red/REP/issues/112

[21:55](#msg6255f535e9cb3c52ae6022a6)see trailing comments

## Wednesday 13th April, 2022

Oldes

[22:12](#msg62574ad4c4350025003adff3)

```
>> %"aa:bb"
== %aa:bb ;<=== not backwards loadable
>> load {%aa:bb}
== [%aa :bb] ;<=== two values
```

greggirwin

[22:36](#msg62575076d1b64840dbb38d16)Good catch @Oldes. Please report it.

hiiamboris

[22:49](#msg6257535c0909252318708717)https://github.com/red/red/issues/4060

greggirwin

[22:50](#msg625753ae161ffc40d7016748)Ah, thanks.

## Friday 15th April, 2022

bubnenkoff

[07:06](#msg625919878db2b95f0ab88c99)I have found a bug:

```
>> out: copy []
== []
>> loop 10000 [collect/into [keep [[a: 1]] ] out] 
== [[a: 1] [a: 1] [a: 1] [a: 1] [a: 1] [a: 1] [a: 1] [a: 1] [a: 1] [a: 1] [a: 1] [a: 1] [a: 1] [a: 1] [a: 1...
>> ; probe out
>> 
>> 
>> unique out
*** Internal Error: stack overflow
*** Where: unique
*** Near : out
*** Stack:
```

gurzgri

[08:57](#msg625933698db2b95f0ab8bdca)Have you realized that you're inserting 10'000 times the exact same block `[a: 1]`? Just to make sure. Then there is no need to 10'000 times `collect`, you can often use it only once as an outer "bracket". And then there is `keep/only` to insert blocks as blocks:

```
>> out: collect [loop 10000 [keep/only [a: 1]]]
```

However, the problem you encoutered with `unique` remains. It happens with most `any-block!` types but interestingly doesn't happen for `map!`:

```
>> unique collect [loop 10000 [keep/only [a: 1]]] ;*** Internal Error: stack overflow
>> unique collect [loop 10000 [keep/only quote (a: 1)]] ;*** Internal Error: stack overflow
>> unique collect [loop 10000 [keep/only quote a/b]] ;*** Internal Error: stack overflow
>> unique collect [loop 10000 [keep/only quote :a/b]] ;*** Internal Error: stack overflow
>> unique collect [loop 10000 [keep/only quote a/b:]] ;*** Internal Error: stack overflow
>> unique collect [loop 10000 [keep/only #(a: 1)]]
== [#(
    a: 1
)]
```

hiiamboris

[09:00](#msg625934479bd1c71ecaf0e74e)Please create a ticket @bubnenkoff

bubnenkoff

[09:02](#msg625934bf99d94f5f0c9e2599)&gt; Have you realized that you're inserting 10'000 times the exact same block \[a: 1]? Just to make sure.  
Yes, I inserted same block on purpose

@hiiamboris ok

gurzgri

[09:03](#msg625934dae9cb3c52ae6698fd)Good then :J

bubnenkoff

[09:08](#msg62593629c61ef0178ec23dfc)done https://github.com/red/red/issues/5123

hiiamboris

[09:45](#msg62593eaec4350025003ea6ec)thanks

## Wednesday 18th May, 2022

ALANVF

[20:06](#msg628551c5887b1a635ba9328c)found a nice View bug where attempting to use `return center` between widgets causes a syntax error. I'm sure that bugs exist for other attributes as well

hiiamboris

[20:11](#msg6285530cfd12f01bddb2de9d)why should it not be a syntax error?

ALANVF

[20:12](#msg6285531792865155b8cb3143)the docs say that it's allowed

[20:12](#msg6285532277bd5538bd97419f)https://github.com/red/docs/blob/master/en/vid.adoc#43-return

[20:12](#msg6285532b887b1a635ba934ed)either the docs are wrong or Red is wrong

[20:12](#msg62855337978f8b71a7d6f23f)(in which case, I'll move this to red/docs)

hiiamboris

[20:12](#msg6285533e92865155b8cb3165)ah

greggirwin

[20:13](#msg628553609b66e01be6000168)Question of whether it's just docs that are wrong. This example from an old blog entry makes me think docs just copied some bits they shouldn't.

```
view [
        style chk: check "Option" data yes
        style vline: base 2x60 red
        across top    vline button "Ok" text "Text" field chk return
        across middle vline button "Ok" text "Text" field chk return
        across bottom vline button "Ok" text "Text" field chk
    ]
```

But the docs aren't just copied from other direction commands. @qtxie any thoughts?

hiiamboris

[20:14](#msg62855398a726cf495bb7471d)@ALANVF I think it's a docs problem, since `return` accepts either new row with `middle/top/bottom` or new column with `center/left/right`, but when you mismatch these you get the error

greggirwin

[20:14](#msg628553a6fd12f01bddb2e039)We need examples directly in docs, or at least links to them. I know that has its own issues, but when we don't know who to trust, it's bad.

[20:14](#msg628553b716c31238c375fb37)Good quick R&amp;D @hiiamboris.

hiiamboris

[20:15](#msg628553f51308e56363af3ac8)I just recalled it from my previous `layout` work :)

greggirwin

[20:19](#msg628554da74eb0971abcd94cd)Pffft. Too easy. ;^)

[20:19](#msg628554ed8e47ce374ac01352)@ALANVF please R&amp;D it and make an example if you would.

ALANVF

[20:26](#msg6285568516c31238c37600a7)sure

[20:31](#msg628557a9af3c8355c0b15697)doesn't crash in this specific example, but `return` doesn't do anything either (I am still learning VID)

```
view [ below text "a" return center below text "b" ]
```

[20:32](#msg628557ce1308e56363af4166)oh I should look up what R&amp;D actually means

[20:32](#msg628557ecdb3fe1746f063548)ahhh ignore that then

greggirwin

[20:56](#msg62855d651308e56363af4d02)Interactive R&amp;D. "I tried this..." :^)

[20:56](#msg62855d84a726cf495bb75b04)I do that, because I can't keep everything in my head like @hiiamboris and some others.

ALANVF

[20:59](#msg62855e17978f8b71a7d70665)ah, I usually just keep like a text/markdown file for stuff like that lol

## Thursday 19th May, 2022

ALANVF

[22:54](#msg6286ca9dda330517ff849fec)pog found a new crash:

```
o: make object! [ f: does [self] ]
context? first body-of :o/f
```

[22:54](#msg6286cac006a77e1e18454a3b)I'm not sure why it crashes though

## Friday 20th May, 2022

greggirwin

[00:24](#msg6286dfaf67db9a59dbd9e79c)There are a few `self`-related tickets out there. If you can't find this one, please add it.

ALANVF

[00:25](#msg6286dfea09eea00adea247b1)do you think it's related to #4552?

greggirwin

[00:29](#msg6286e0e506a77e1e18457181)Looks like it. And something good to note as @dockimbel said something about redbin having issues with objects IIRC.

ALANVF

[00:29](#msg6286e0f5c61b987d33b936df)ok

greggirwin

[00:29](#msg6286e107f8daa71e078a713d)Add a note to that ticket.

## Saturday 21st May, 2022

dsunanda

[16:57](#msg628919e5ef00bd1dc6f11cb9)I can't get compile option -e to work under Windows --- it appears to not understand that #includes may be in sub-folders. This code can create the conditions to test (you need to change the name of the Red executable in the two .BAT files):

```
;; create sub-programs
attempt [make-dir %utility-scripts]
write %utility-scripts/math.red "Red []^/^/halt"
write %utility-scripts/gui.red  "Red []^/^/halt"


  ;; create main program
write %test.red {
Red [needs: View]

#include %utility-scripts/math.red
#include %utility-scripts/gui.red
halt
}


   ;; compile with -e
write %compile-test-with-e.bat {
echo on
red-2022-05-17 -r -e -t windows test.red 
pause
}


   ;; compile without -e
write %compile-test-without-e.bat {
echo on
red-2022-05-17 -r -t windows test.red 
pause
}
```

[16:58](#msg62891a21d126691416aa6b38)Attempt to compile with -e gets:

```
*** Compilation Error: include file not found: utility-scripts/gui.red
```

Without -e, I get a correctly compiled .exe, as expected.

hiiamboris

[17:10](#msg62891d027df86c141e97a373)a long known bug

[17:11](#msg62891d3dc9382316a616e4d7)solution: https://gitlab.com/hiiamboris/red-cli/-/tree/master/mockups/inline

dsunanda

[17:23](#msg6289202bc61b987d33bd9815)@hiiamboris Thanks. Any idea when it might be fixed? My actual nest of scripts contains a script that won't compile without -e .... So, right now, the app is undeployable.

hiiamboris

[17:33](#msg62892282da83520ac340eed8)no idea

[17:33](#msg62892287f8daa71e078ede2d)I'm just using `inline`

## Sunday 22nd May, 2022

dsunanda

[07:08](#msg6289e173d126691416abdb57)@hiiamboris Thanks. inline looks useful for overcoming the brokenness of -e.  
But, basically, the whole compiling model is, at the very least, looks due for a rethink if -e is even necessary.  
Essentially, right now, compiling is useless for anything beyond a moderate level of complexity.

hiiamboris

[08:17](#msg6289f184db6f627d2594a240)True.

## Wednesday 25th May, 2022

Oldes

[13:45](#msg628e32e5da83520ac34ae99c)Is this ok?

```
>> to-integer "3.4E+2"
== 3 ;<==  is 340 in R2 and R3
```

hiiamboris

[13:47](#msg628e338dc61b987d33c774fb)I think it should be as it is

[13:48](#msg628e339b4aa6c31dca1c692b)for speed and less surprises

ALANVF

[21:11](#msg628e9b65f8daa71e07997d68)I personally find that pretty surprising

hiiamboris

[21:23](#msg628e9e6fdb6f627d259dd4bc)well, since it fails on many other invalid inputs, an error would be preferable

[21:24](#msg628e9ea6da330517ff93fe75)or it should stably eat as many digits as it can

[21:25](#msg628e9eccda330517ff93fe98)right now it's result is just implementation dependent gray zone

[21:30](#msg628e9fe4da83520ac34bcce9)this is clearly a bug:

```
>> to integer! "3.4e2"
== 3
>> to integer! "3e2"
*** Script Error: cannot MAKE/TO integer! from: "3e2"
*** Where: to
*** Near : "3e2"
*** Stack:
```

ALANVF

[21:30](#msg628ea00709eea00adeb169f6)that actually seems intentional to me?

hiiamboris

[21:30](#msg628ea00d09eea00adeb16a0f)how so?

ALANVF

[21:31](#msg628ea02906a77e1e18549d39)integer parsing is often defined so that you can successfully parse the beginning of a string, but not all of it

[21:31](#msg628ea03fef00bd1dc6fbdc5d)`.` is a common punctuation, so once it's encountered the parser stops

hiiamboris

[21:32](#msg628ea052d126691416b56e56)agreed, but then:

```
>> to integer! "3x2"
*** Script Error: cannot MAKE/TO integer! from: "3x2"
*** Where: to
*** Near : "3x2"
*** Stack:  

>> to integer! "3 inches"
*** Script Error: cannot MAKE/TO integer! from: "3 inches"
*** Where: to
*** Near : "3 inches"
*** Stack:
```

so it totally doesn't work as I thought

ALANVF

[21:32](#msg628ea05406a77e1e18549d89)but a letter is seen as a parsing error, because of course letters aren't separators

[21:32](#msg628ea060d126691416b56e7d)hmm

[21:32](#msg628ea0674e38f759e28a89ea)that just makes it seems more intentional

[21:32](#msg628ea06fda330517ff940144)possibly even for this exact use case

hiiamboris

[21:32](#msg628ea08209eea00adeb16b52)for extracting integers only from floats that have a period?

[21:32](#msg628ea08ac61b987d33c8541a)hardly

ALANVF

[21:33](#msg628ea090c61b987d33c8541f)yeah, or more simply, extracting an integer from a float input

hiiamboris

[21:35](#msg628ea13fc9382316a621d40f)@ALANVF if you're willing to open an issue report and describe what R2/R3 does and possible use cases and drawbacks of both loading (as in rebol) and simple forgiving integer extraction, that would be welcome

[21:36](#msg628ea15cdeea5616bbc6846a)whether it should understand `'` delimiter is also questionable

ALANVF

[21:36](#msg628ea167da83520ac34bd081)well I'm kinda torn between returning 340 and throwing an error

hiiamboris

[21:37](#msg628ea19ada330517ff9402f7)of course, that's why we need a ticket to collect input and design ideas

ALANVF

[21:37](#msg628ea1b6db6f627d259dd967)ok

hiiamboris

[21:38](#msg628ea1bbda330517ff940335):+1:

ALANVF

[21:53](#msg628ea549da83520ac34bd6f5)@hiiamboris #5147

[21:53](#msg628ea55fd126691416b57760)I'm not great at writing, but that should be a good description of the issue

hiiamboris

[22:03](#msg628ea7acdeea5616bbc68f9c)thanks

## Saturday 11st June, 2022

gurzgri

[16:01](#msg62a4bc624e38f759e2b58b2b)Is it to be expected that a script as simple as

```
Red [] #system [memory-stats 3]
```

compiled with `do/args %red.r "--release --debug %memtest.red"` fails with

```
PS C:\Users\Christian Ensel\Development\red-master> .\memtest.exe

====== Red Memory Stats ======

-- Node frames --
#1: used = 10000/10000 (100%), free = 0/10000 (0%)
#2: used = 424/10000 (4%), free = 9576/10000 (96%)

    2 frames

-- Series frames --
#1: used = 1048520/1048576 (99%), free = 56/1048576 (1%)
 - 05450014: size = 64000, offset pos = 0, tail pos = 25568    T
 - 0545FA28: size = 53491844, offset pos = -88472092, tail pos = 4

*** Runtime Error 98: assertion failed
*** in file: /C/Users/Christian Ensel/Development/red-master/runtime/debug-tools.reds
*** at line: 194
***
***   stack: red/list-series-buffers 05450004h
***   stack: red/memory-stats 3
```

(this is with a freshly cloned Red 0.6.4 for Windows built 11-Jun-2022/15:58:04)? I expected that to work.

hiiamboris

[16:08](#msg62a4bdfdda83520ac376b1e6)I guess just nobody used `memory-stats` in a while?

[16:09](#msg62a4be29deea5616bbf18642)raise an issue, I'm sure it was never reported

gurzgri

[16:28](#msg62a4c290c9382316a64ce556)\[#5150](https://github.com/red/red/issues/5150)

## Saturday 18th June, 2022

dsunanda

[11:49](#msg62adbbe18fe56a38b5a0adcb)I am trying to convert an old Rebol system which has run rock-solid for at least 15 years. The Red port of it will crash after about an hour's usage. The problem seems to be running out of memory after displaying around 2000 images - even though only one is on screen at any one time.  
My high score for the code below is around 950 loops before crash. The code is under Windows 10. I really need a high score of at least 10,000 to have a viable application:

[11:49](#msg62adbbe5b408e830dc18bc7a)

```
;; Create a couple of fairly small images:
im-1: to-image view/no-wait compose [box 500x500 red (copy/part mold system 4000 )]
im-2: to-image view/no-wait compose [box 400x400 blue (copy/part mold system 2000)]
save/as %image-1.jpg im-1 'jpeg
save/as %image-2.jpg im-2 'jpeg
unview/all

view/no-wait [im: image 200x200 count: text 100x50]
recycle/on       
try [delete %log-file.txt]
n: 0
     ;; swap between the images until failure:
loop 5000 [
   n: n + 1
   count/text: rejoin [form n " " stats]
   im/image: load/as %image-1.jpg 'jpeg
   im/image: load/as %image-2.jpg 'jpeg
   write/lines/append %log-file.txt count/text
   recycle
   ]
print "worked this time"   ;; be nice to see this message :)
```

hiiamboris

[11:51](#msg62adbc2922c53438bca885f7)images are not collected

[11:52](#msg62adbc659a314a3ec4b49ede)you can use this very old branch for your task https://github.com/red/red/pull/4662

[11:52](#msg62adbc89fe909e3ec7d78c67)it's still GDI backed

dsunanda

[11:52](#msg62adbc8f9f29d42bed833f05)So basically, Red's View is a GUI with no images!? Can that be fixed?

hiiamboris

[11:53](#msg62adbcb576cd751a2f452bcf)why with no images? a few will work fine, you just can't spawn a lot

dsunanda

[11:55](#msg62adbd313bbb384889830647)Thanks for the comments and info .... My issue is the application is a membership database that shows the member's headshot. So spawning one image per person is kinda the minimum expected of it.

hiiamboris

[12:03](#msg62adbf1f0a5226479853037a)well...

[12:04](#msg62adbf539a314a3ec4b4a3ba)are you using ODBC branch then?

dsunanda

[12:18](#msg62adc28a9f73251a2c5da0dc)No - just the latest nightly. (Handling the DB side without ODBC is story for another time :)

hiiamboris

[12:25](#msg62adc454b408e830dc18cc53)then that old branch might still be an option

dsunanda

[12:38](#msg62adc72bef5ee44882b3f9e2)I'll take a look ..... But it seems unlikely as I have had bugs in the official 0.6.4 release - which is of a similar age.  
Right now, it looks like Red is not an appropriate choice if the app needs to display more than 100 images (depending on size), even if just one at a time.

hiiamboris

[12:46](#msg62adc90e3bbb384889831de0)Gregg will come and say that our coffee machine is not smart enough :)

[12:47](#msg62adc9699f29d42bed8357ec)But we have an old coffee machine which is noisy but was able to clean the glasses ;)

dsunanda

[13:14](#msg62adcfa622c53438bca8ae3c):) But the slowly growing problem with the Rebol app is that it is accumulating cruft - eg things like 'browse doesn't work properly any more.

So I'd like to replace it with something that isn't aleady years old, and hard to update .... So a spun-off branch is not that attractive :)

hiiamboris

[16:35](#msg62adfeb69f73251a2c5e168d)Sure, but your best bet for now, given what we have

## Friday 24th June, 2022

loziniak

[12:33](#msg62b5af10568c2c30d3e7ef03)

```
$ ./red-16jun22-15b93aff8 
Gtk-Message: 14:32:15.045: Failed to load module "xapp-gtk3-module"
Gtk-Message: 14:32:15.045: Failed to load module "xapp-gtk3-module"
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> system/build/date
== 24-Jun-2022/12:28:44
```

Perhaps worth checking?

[12:33](#msg62b5af2dab6b634f7362600f)downloaded from https://www.red-lang.org/p/download.html

greggirwin

[13:51](#msg62b5c156904f20479a2109ae)Do you have 32-bit libs installed? That's the first issue people usually hit.

[13:51](#msg62b5c169ab6b634f7362e536)And is it only the new build that errors?

GiuseppeChillemi

[15:40](#msg62b5db04ab6b634f7363964f)I see `port?` not implemented into RED while PORT! is, it is correct?

[15:41](#msg62b5db0d22c53438bcbea3f7)(Tested on RED-ODBC)

gurzgri

[16:03](#msg62b5e0461227f62be3bbbdcb)can confirm, noticed that too, probably waits for i/o branch or so.

GiuseppeChillemi

[17:22](#msg62b5f2bd9f29d42bed9a0e05)This works:

```
f1: func [/local data1 data2] [
   data1: "hello" data2: none
    f2 words-of context? 'data1 ;<--------- The difference is here
   	reduce [data1 data2]
   ]
f2: func [ctx] [
   set next ctx reduce [uppercase get ctx/2 " world!"] ;next avoids /local
   "DUMMY RETURN"
]
```

```
>> f1
["HELLO" " world!"]
>>
```

This eats the stack:

```
f1: func [/local data1 data2] [
   data1: "hello" data2: none
    f2 context? 'data1 ;<--------- The difference is here
   	reduce [data1 data2]
   ]
f2: func [ctx] [
	 ctx: words-of ctx;<--------- The difference is here
   set next ctx reduce [uppercase get ctx/2 " world!"] ;next avoids /local
   "DUMMY RETURN"
]
```

!!!

```
*** Internal Error: stack overflow
*** Where: data1
*** Near : "hello" data2: none f2 context? 'data1 reduce 
*** Stack: probe f1 f2 words-of f2 words-of f2 words-of f2 words-of f2 words-of f2 words-of f2 words-of f2 words-of 
f2 words-of f2 words-of f2 words-of f2 words-of f2 words-of f2 words-of f2 words-of f2 words-of f2 words-of f2 words
-of f2 words-of f2 words-of f2 words-of f2 words-of f2 words-of f2 words-of f2 words-of f2 words-of f2 words-of f2 w
ords-of f2 words-of f2
```

[17:25](#msg62b5f38a9a314a3ec4cb583a)Have I done something wrong or could I write a bug report?

Oldes

[17:28](#msg62b5f4409a314a3ec4cb5bdc)It's not a bug. `ctx` in `f2` is a function, which calls itself, until the stack's end.

[17:29](#msg62b5f477ef5ee44882cade0a)Use `ctx: words-of :ctx` and it will be ok.

GiuseppeChillemi

[17:39](#msg62b5f6c58fe56a38b5b7ab1d)Thank you Oldes, to me CTX was just a context, as I have obtained it with `context?` and not the function itself. Changing it to `ctx: words-of :ctx` has solved.

Oldes

[17:47](#msg62b5f8cfab6b634f73646b9d)Even a function may be a context.

GiuseppeChillemi

[17:58](#msg62b5fb403bbb38488999d27e)Yes but I have supposed it would have been more like regular object than an active function.

## Monday 27th June, 2022

loziniak

[11:22](#msg62b992e33bbb384889b33c1e)@greggirwin It was not about `Gtk-Message`s, but build date – it's different than filename. 16 vs 24 Jun.

hiiamboris

[11:24](#msg62b9936f9a314a3ec4e50cfd)happens when there are no new commits

## Wednesday 29th June, 2022

Oldes

[10:07](#msg62bc24569f29d42bedc65ee1)Is the `try/all` functional? It looks that `try` catches these `break`, `continue`, `exit`, etc. exception any time.

```
>> error? try [exit]
== true
>> error? try/all [exit]
== true
>>
```

hiiamboris

[11:59](#msg62bc3e959a314a3ec4f83d87)

```
>> ? try
USAGE:
     TRY block

DESCRIPTION: 
     Tries to DO a block and returns its value or an error. 
     TRY is a native! value.

ARGUMENTS:
     block        [block!] 

REFINEMENTS:
     /all         => Catch also BREAK, CONTINUE, RETURN, EXIT and THROW exceptions.
     /keep        => Capture and save the call stack in the error object.
```

[11:59](#msg62bc3eb10a52264798965681)`try/all` is fine

[12:00](#msg62bc3ec322c53438bcec6fcc)with `try` you need a function to use `exit`, otherwise it's an error indeed

Oldes

[12:28](#msg62bc457e0a52264798968bd1)I don't see any difference between `try` and `try/all` in Red.

[12:30](#msg62bc45dc3bbb384889c6eda7)In Rebol, which don't have `try/all`, the `try` don't catch these exceptions:

```
>> error? try [1 / 0]
== true

>> error? try [exit]

** Throw error: return or exit not in function
```

[12:34](#msg62bc46efd3c8894f71d35dde)So I think that if there is not some invisible reason, `try/all` could be removed in Red and Rebol should be able to catch these exceptions by default like Red does.

hiiamboris

[12:35](#msg62bc470c8fe56a38b5e4e31d)

```
>> do reduce [does [try [return 42]]]
== 42
```

[12:35](#msg62bc471afe909e3ec71b860d)like I said

Oldes

[12:37](#msg62bc47811227f62be3e9b1a3)How it is related to `try/all`? And you don't have to send help on try. I'm not a newbie!

hiiamboris

[12:39](#msg62bc47e48fe56a38b5e4eb49)sure

[12:39](#msg62bc4808904f20479a4fb1a1)

```
>> do reduce [does [try [return 42]]]
== 42
>> do reduce [does [try/all [return 42]]]
*** Throw Error: return or exit not in function
*** Where: return
*** Near : 42
*** Stack: run eval-command do-command try-do
```

This clears up the difference?

Oldes

[12:52](#msg62bc4b1d76cd751a2f8994df)Yes.. that makes sense.

hiiamboris

[13:29](#msg62bc53b7904f20479a500d16)I agree though, design was too quick. In my experience when you build loops, you want to catch only continue or only break, and get it's argument, and leave the rest untouched. As for exit/return, on the contrary, you want transparency to these, esp. for function body.

## Tuesday 5th July, 2022

Oldes

[19:23](#msg62c48fc60a52264798d0d329)There seems to be such inconsistency:

```
>> to-string quote a/b:
== "a/b:" ;<-- keeps decoration
>> to-string quote b:
== "b" ;<-- removes decoration
```

[19:25](#msg62c490433bbb38488901e1f1)No difference:

```
>> form quote a/b:
== "a/b:"
>> mold quote a/b:
== "a/b:"
```

greggirwin

[19:53](#msg62c496ba76cd751a2fc46d70)Listed \[here](https://github.com/red/red/wiki/%5BDOC%5D-Table-for-to-string-etc.), but it's a good design question.

[19:55](#msg62c497429a314a3ec433d680)That table needs a quick update, as `mold/all` produces serial syntax for `none!` and `logic!` now.

[19:57](#msg62c49793b408e830dc97d145)Done.

Oldes

[20:00](#msg62c49855568c2c30d35294e0)@meijeru do you think that `form quote a/b:` and `to string! quote a/b:` should remove the decoration like it is with set-words?

meijeru

[20:03](#msg62c4992e9f29d42bed028d9e)Yes, for consistency and ease of remembering, I would think that (lit/set/get)-paths should be treated similar to (lit/set/get)-words by form and to-string.

hiiamboris

[20:07](#msg62c499f476cd751a2fc483bd)agreed

Oldes

[20:12](#msg62c49b38b408e830dc97e69e)I wonder if it should be removed also when used with other string types.. like `email!`, `ref!`, `url!`, `tag!` etc.?

```
>> to-url quote a/b:
== a/b:
>> to-url quote a:
== a
```

hiiamboris

[20:24](#msg62c49de69f29d42bed02aa09)`:` is ok in urls refs emails tags

[20:24](#msg62c49df79f73251a2cdc97e4)but I don't care really

[20:24](#msg62c49dff0a52264798d13cb1)who builds these from words?

Oldes

[20:32](#msg62c49fcc8fe56a38b520142f)I would remove it there too for simplicity and consistency. I thing these conversions are there just because some result is better than error anyway.

[20:38](#msg62c4a15a3bbb38488902647f)Also... currently there is:

```
>> to string! [(a b) [c d] e/f g h]
== "a bc de/fgh"
```

I think, that `"a b c d e/f g h"` looks like better result :/

hiiamboris

[20:40](#msg62c4a1b29f29d42bed02c0fb)I would prefer `form` to form and `to-string` to call itself

Oldes

[20:40](#msg62c4a1b6568c2c30d352db83)Or is there someone using something like:

```
>> to-string [h e l l o]
== "hello"
```

?

hiiamboris

[20:40](#msg62c4a1b7904f20479a8b05d8)

```
>> form [(a b) [c d] e/f g h]
== "a b c d e/f g h"
```

[20:40](#msg62c4a1c78fe56a38b52023cd)then `to-string` would yield `"abcde/fgh"`

[20:41](#msg62c4a2093bbb384889026ad0)it's counter-intuitive that `to-string` calls `form` on blocks

greggirwin

[20:46](#msg62c4a332b408e830dc982608)&gt; it's counter-intuitive that `to-string` calls `form` on blocks

Agreed.

## Thursday 7th July, 2022

Oldes

[10:02](#msg62c6af461227f62be333a46f)The escape char `^` behaves strangely when used in file:

```
>> %^
== %"^"
>> %"^"
== %"""
>> %"""
*** Syntax Error: (line 1) invalid string at "
```

hiiamboris

[10:49](#msg62c6ba23fe909e3ec765768e)Yeah

```
>> %"^""
*** Syntax Error: (line 1) invalid string at "
*** Where: set
*** Near : token/y
*** Stack: load
```

## Monday 11st July, 2022

inc0n:matrix.org

[14:35](#msg62cc353d3bbb38488937e165)Hello everyone, I'm on Mac m1, red 0.6.4 from the download page result in "bad CPU type in executable". And I'm also unable to build from source, since it requires a rebol intepreter, which is also bad CPU type. What would my options be for trying out red??

[14:35](#msg62cc354276cd751a2ffa41a5)Thanks in advance

ldci

[14:50](#msg62cc3898568c2c30d388cde6)@inc0n:matrix.org .Unfortunately Red is 32-bit only. I’m also on Mac m1 and the only way I found is to install parallel desktop and a windows 64-bit version.

greggirwin

[14:50](#msg62cc38b79f73251a2c1291a4)There are some Docker images available as well.

[14:51](#msg62cc38f022c53438bc5eb7fa)https://github.com/rebolek/red-tools/wiki/Red-on-Catalina

## Wednesday 13th July, 2022

gltewalt

[20:53](#msg62cf30ca9f73251a2c27df97)

```
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> system/words/what

*** Runtime Error 1: access violation
*** at: 080943BBh
```

greggirwin

[20:54](#msg62cf3122fe909e3ec7a15a66)Reproduced. See if there's a ticket for that.

gltewalt

[21:01](#msg62cf32b6ef5ee448827f0b1e)Not sure exactly what to search for, but so far I don't see one

greggirwin

[21:03](#msg62cf3312fe909e3ec7a16727)Open a new one then. Thanks!

[21:03](#msg62cf333f9a314a3ec47f1690)Please note that `what` by itself works fine.

gltewalt

[21:04](#msg62cf33743bbb3848894d0657)Yeah. And... should I go through each system/words(where applicable) looking for other bombs?

greggirwin

[21:05](#msg62cf33a49a314a3ec47f1a05)Help, about, and source seem OK.

hiiamboris

[21:08](#msg62cf343bab6b634f7317c671)wow

[21:08](#msg62cf34689f29d42bed4e8815)compiler's glitch by the looks of it

## Tuesday 19th July, 2022

Oldes

[09:49](#msg62d67e2f3bbb38488980b433)When inserting `char!` key into a `map!` it is always case-sensitive... as there is `put/case` available, I guess that `put` without `/case` should be insensitive:

```
>> m: #() put m #"a" 1 put m #"A" 2 m
== #(
    #"a" 1
    #"A" 2
)
```

hiiamboris

[09:59](#msg62d6807efe909e3ec7d4fefc)It's insensitive:

```
>> m: #()
== #()
>> put m "ab" 'ab
== ab
>> put m "AB" 'AB
== AB
>> m
== #(
    "ab" AB
)
```

[09:59](#msg62d6809ab408e830dc179296)Red just has this char problem:

```
>> #"a" = #"A"
== false
```

[10:00](#msg62d680b0fe909e3ec7d4ffbb)and you have to form chars to compare

toomasv

[10:43](#msg62d68ad69a314a3ec4b3a305)Are chars not always case-sensitive in Red? And strings by default case-insensitive.

ldci

[10:44](#msg62d68afb8fe56a38b59faecd)

```
m: #()
put m 1 "ab"
put m 2 "AB"
m
```

[10:44](#msg62d68b25904f20479a0b5743)

```
>> m
== #(
    1 "ab"
    2 "AB"
)
```

[11:40](#msg62d69847b408e830dc182f75)

```
>> a: "ab"
== "ab"

>> b: "AB"
== "AB"

>> a = b
== true
```

[11:45](#msg62d699580a52264798516f09)`#"a" = # »A »`is also true with R3

## Thursday 21st July, 2022

GiuseppeChillemi

[21:14](#msg62d9c1a4904f20479a224fff)I have a probable bug

If you use a datatype in a function specs without a block, the function eats and additional argument:

```
f: func [
			a 
			/b 
			arg-b word! "Should work?" 
			/local
		] [
			
			either b [
				probe a * arg-b
			] [
				probe a
			]
		]
```

[21:14](#msg62d9c1c89f29d42bed9a6bc7)Try:

```
f/b 2 3
```

It won't work

[21:16](#msg62d9c23b3bbb384889989085)But if you try:

```
f/b 2 3 4
```

[21:18](#msg62d9c2b776cd751a2f5b5aa4)It is executed!

Oldes

[21:20](#msg62d9c3369a314a3ec4cae2fc)Actually it is not a bug... you just made a function, where `/b` has 2 arguments: `arg-b` and `word!`

GiuseppeChillemi

[21:21](#msg62d9c367ef5ee44882caf54d)Nice explanation but I don't think it should be allowed ;-)

Oldes

[21:21](#msg62d9c3689f29d42bed9a79e6)Because:

```
>> type? first [word!]
== word!
>> type? first [x!]
== word!
```

[21:22](#msg62d9c37e568c2c30d3e9aee3)The `!` is just a convention.

GiuseppeChillemi

[21:22](#msg62d9c3ab76cd751a2f5b6284)Yes, In the last months you have already enlightened me.

Oldes

[21:24](#msg62d9c4038fe56a38b5b70e58)It is your bug. Just use correct syntax.

GiuseppeChillemi

[21:25](#msg62d9c4650a52264798682b67)I won't answer. I have to think about it.

Oldes

[21:30](#msg62d9c55822c53438bcbfd108)

```
>> f: func[word! [string!]][ probe word! ]
== func [word! [string!]][probe word!]
>> f "a"
"a"
== "a"
>> f 1
*** Script Error: f does not allow integer! for its word! argument
```

[21:31](#msg62d9c5a3b408e830dc2f1a28)Red (and Rebol) cannot do anything with this... `word!` and `string!` are just words like `word` and `string`.

[21:32](#msg62d9c5ff9f73251a2c730cc1)It can try to do checks, if you really want `word!` and not correct `[word!]`, but it would be expensive.

GiuseppeChillemi

[21:52](#msg62d9ca899a314a3ec4cb16cd)No, leave everything as is.

[21:52](#msg62d9ca9ad3c8894f71a66249)Just we whould add notes to the docs-

[22:15](#msg62d9d006ef5ee44882cb49f6)Being in the middle of the transition from Rebol to Red, I have discovered interesting things:

In \*\*Rebol2\**

```
probe bound? to-lit-word word!
== none
```

you get no context from this conversion

You must do

```
to-lit-word to-word word!
```

To have a context  
While in \*\*Red\**

```
to-lit-word word!
```

Is sufficient to have a word with a context as result

Oldes

[22:21](#msg62d9d16976cd751a2f5bc93d)Don't understand what you mean. In Red you do:

```
>> context? quote word!
== make object! [
```

GiuseppeChillemi

[22:23](#msg62d9d1f31227f62be3bcfb42)Try `bound? to-lit-word word!` in Rebol2

Oldes

[22:24](#msg62d9d20e8fe56a38b5b7698b)And so? It is Rebol2 bug.

```
>> type? to-lit-word word!
== word! ;<= should be lit-word! like in Rebol3 and Red
```

GiuseppeChillemi

[22:24](#msg62d9d2203bbb3848899904a1)I have thought it was a difference

[22:25](#msg62d9d23cab6b634f736344ff)However, you should consider this when converting code

[22:27](#msg62d9d2ca568c2c30d3ea1cb9)&gt; And so? It is Rebol2 bug.  
&gt;

```
rebol
> >> type? to-lit-word word!
> == word! ;<= should be lit-word! like in Rebol3 and Red
>
```

Funny

## Friday 22nd July, 2022

greggirwin

[18:25](#msg62daeb9a904f20479a2a9b69)@GiuseppeChillemi on func specs, an easy way to see what Red thinks is to use `help` on the function.

GiuseppeChillemi

[20:37](#msg62db0a7fef5ee44882d3f8d5)If I try to probe all the words of the system context I get an `invalid utf-8 encoding: #{A0D0A7FE}`

Try:

```
red-words: words-of system/words

foreach [wordx] red-words [
   probe wordx
]
```

greggirwin

[21:24](#msg62db1599ef5ee44882d44db7)Works fine here for me.

```
RED: [ branch: "master" tag: #v0.6.0 ahead: 8140 date: 16-Jun-2022/2:23:20 commit: #15b93aff8e561de22905572ada060699eb3a4146 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
```

GiuseppeChillemi

[21:25](#msg62db15d7b408e830dc3870f2)Maybe my italian language windows influences it? I suppose some accented italian strings

[21:26](#msg62db15f0ef5ee44882d45170)Could be date related like `lunedì` (Monday)

## Saturday 30th July, 2022

PeterWAWood

[10:06](#msg62e5029fd020d223d3f993a5)I installed the new GUI and CLI console builds on a Raspberry PI running the latest 32-bit OS (Buster) which is fully updated. The cli console runs fine but there is an issue with missing libcrypto.so.1.0.2

```
pi@Pi4B:~ $ cat /etc/os-release
PRETTY_NAME="Raspbian GNU/Linux 11 (bullseye)"
NAME="Raspbian GNU/Linux"
VERSION_ID="11"
VERSION="11 (bullseye)"
VERSION_CODENAME=bullseye
ID=raspbian
ID_LIKE=debian
HOME_URL="http://www.raspbian.org/"
SUPPORT_URL="http://www.raspbian.org/RaspbianForums"
BUG_REPORT_URL="http://www.raspbian.org/RaspbianBugs"
pi@Pi4B:~ $  getconf LONG_BIT
32
pi@Pi4B:~ $ Red/red
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> quit
pi@Pi4B:~ $ Red/red-view
Red/red-view: error while loading shared libraries: libcrypto.so.1.0.2: cannot open shared object file: No such file or directory
```

libcrypto1.1 is installed.

```
libcrypto.so.1.1 (libc6,hard-float) => /lib/arm-linux-gnueabihf/libcrypto.so.1.1
```

hiiamboris

[11:05](#msg62e5109572ad51741f9edd78)was also reported here https://gitter.im/red/red?at=61e693276d9ba23328c9c1b5

[11:06](#msg62e510aa443b7927a7d4fd41)symlink is the only solution for now I guess

PeterWAWood

[11:30](#msg62e51651647d633cf6e011f4)The linked comment reports libcrypto.so.1.1 could not be found. I got a message that libcrypto.so.1.0.2 could not be found when I have 1.1 installed.

hiiamboris

[11:38](#msg62e518529d3c186299c05b0a)tried symlinking?

dockimbel

[13:07](#msg62e52cf6b16e8236e3399f0b)Thanks Peter for reporting it. I remember a similar issue on my RPi, I'll have a look to see how I solved it.

## Sunday 31st July, 2022

PeterWAWood

[01:32](#msg62e5dbaf05ad4a3701b5e457)@hiiamboris @dockimbel Symbolic linking libcrypto.so.1.0.2 to libcrypto.so.1.1 gets Rebol/View console working on an up-to-date 32-bit PiOS Buster system. For the benefit of others trying, this is the command that I used to "symlink" to the installed library.

```
sudo ln -s /lib/arm-linux-gnueabihf/libcrypto.so.1.1 /lib/libcrypto.so.1.0.2
```

qtxie

[03:06](#msg62e5f1ad7ccf6b6d459cedac)This lib name along with others we used in Red are varies in different Linux distros. Even in the same distro, it changed in newer versions.

hiiamboris

[08:14](#msg62e639cd11a6a83d047d9b3f)https://stackoverflow.com/questions/3839756/how-do-applications-resolve-to-different-versions-of-shared-libraries-at-run-tim

qtxie

[22:59](#msg62e7095b6837563d1ca34714)Not everyone follows this rules in real world. That's why language like `go` use static link by default.

## Monday 1st August, 2022

PeterWAWood

[01:01](#msg62e725ef72ad51741fadfc76)At some time in the future, It might be worth thinking about publishing a statically-linked "beginners'" edition for the Raspberry Pi. It would make it easier for youngsters and the technically inept (people like me) to try out Red.

hiiamboris

[06:54](#msg62e7788eaa09177429def07a)@qtxie you mean `libcrypt.so.1` is absent on some distributions, but `libcrypt.so.1.1` present?

[06:54](#msg62e778bf05ad4a3701c15ef7)that would be weird

qtxie

[08:39](#msg62e7912b458f823ce055a6cc)@hiiamboris I mean `libcrypto` doesn't follow this rule. `libcrypt` and `libcrypto` are two different libraries.

hiiamboris

[08:42](#msg62e791eeb16e8236e34b4268)oh

[08:42](#msg62e791fd11a6a83d048779cc)right :D

[08:42](#msg62e7920205ad4a3701c221e5)even on WSL

[08:44](#msg62e79266647d633cf6f24ef9)well if such basic rules do not hold, no wonder everything on linux is either monolithic or not working

greggirwin

[16:31](#msg62e7fff105ad4a3701c5523c)I consider being self-supporting one of Red's great superpowers. But the tradeoff is implementing things ourselves, to avoid this kind of issue. It all has to be balanced.

Oldes

[17:32](#msg62e80e1df4d7a323dea8f023)There is another inconsistency...

```
>> type? #[none]
== none!
>> type? #[none!]
== datatype!
```

but than:

```
>> type? #[unset]
== datatype! ;<--- I was expecting `unset!`
>> type? #[unset!]
== datatype!
```

[17:48](#msg62e811dfcf6cfd27af61cf43)Also it looks that it is not possible to \_find_ a datatype:

```
>> find reduce [string! binary!] #[binary!]  
== none
>> find [#[string!] #[binary!]] #[binary!]  
== none
```

[17:49](#msg62e8123af4d7a323dea90b31)In `switch` it is ok:

```
>> switch #[binary!] [#[binary!] ["this works"]]
== "this works"
```

hiiamboris

[18:12](#msg62e817a2f4d7a323dea9321a)`find/only`

[18:13](#msg62e817ba3a42316d33c4ec10)else you're looking for values of that type

[18:14](#msg62e818027ccf6b6d45ac8e2b)

```
>> ? find
USAGE:
     FIND series value
...
     /only        => Treat series and typeset value arguments as single values.
```

[18:14](#msg62e8181f647d633cf6f63be9)OK it could have `and datatype` in it

[18:15](#msg62e8182a458f823ce059caaa)But length is limited

Oldes

[18:15](#msg62e8184ff4d7a323dea93663)Makes sense.

greggirwin

[22:14](#msg62e8504e3a42316d33c68a62)There's also a ticket on finding typesets. Specs are first on the new roadmap. A big reason is to make behavior choices explicit.

dockimbel

[22:59](#msg62e85ae96837563d1cacf6c8)

```
>> type? #[unset]
== datatype! ;<--- I was expecting `unset!`
```

Please open a ticket for this one, that's an easy fix.

## Tuesday 2nd August, 2022

PeterWAWood

[03:19](#msg62e897c83a42316d33c8934a)A to tag! test in %convert-test.red is failing on RasPI Buster.

```
--test-- "to-tag!-integer!"
		--assert <-1> = to tag! -1
```

The failure:

```
> <-1> = to tag! -1
*** Script Error: <-1> has no value
*** Where: =
*** Near : <-1> = to tag! -1
*** Stack:
```

[03:40](#msg62e89cadd020d223d313fa33)Test "#4781" in lexer-test.red is failing on RasPi4 32-bit Buster. It seems to be related to floating point precision.  
The test:

```
--test-- "#4781"
		--assert 3:3:3.3000000001 = transcode/one "3:3:3,3"
```

The issue:

```
>> 3:3:3.3000000001 = transcode/one "3:3:3,3"
== false
>> transcode/one "3:3:3,3"
== 3:03:03.3
```

Perhaps the test could be changed to :

```
--assert 3 = first transcode/one "3:3:3,3" 
--assert 3 = second transcode/one "3:3:3,3"
--assertf~= 3.3 third transcode/one "3:3:3,3" 1e-12
```

Note ~--assertf~= 3.3 third transcode/one "3:3:3,3" 1e-13\` failed on the Raspberry Pi.

[04:01](#msg62e8a1a0d020d223d3141b2b)Test "mp-12" in serialization-test.red is failing on RasPI4 32-bit Buster. I suspect that it is because `mold pi` is only displaying 15 significant digits "3.14159265358979" whereas the test is expecting 16 significant digits "3.141592653589793"

[12:56](#msg62e91ef13a42316d33cc7d35)Does Red treat filenames as Case Sensitive on Linux? I found the following

```
>> ls 
	README.gtk3       
>> read %readme.gtk3
*** Access Error: cannot open: %readme.gtk3
*** Where: read
*** Near : %readme.gtk3
*** Stack:  

>> read %README.gtk3
== {sudo apt install at-spi2-core #for Error retrieving accessibility bus address: org.freedesktop.DBu...
>> equal? %readme.gtk3 %README.gtk3
== true
```

hiiamboris

[13:00](#msg62e92008999499629342f6d2)what do you expect? linux file system treats them as case sensitive

## Thursday 4th August, 2022

Oldes

[10:09](#msg62eb9aed11a6a83d04a501ed)Is it ok?

```
>> transcode/one ""
== [] ;<--- why not #[unset] instead?
```

dsunanda

[16:38](#msg62ebf5feb16e8236e36ba518)Is this a bug?....Trying to replicate the last two values in series to its head:

```
blk: copy [1 2 3 4 5 6]
insert blk skip blk -2 + length? blk
probe head blk
== [3 4 1 2 3 4 5 6]
```

For reference (and what I was expecting, as this is ported code): Rebol 2 and 3 give:

```
== [5 6 1 2 3 4 5 6]
```

While Red seems to need an extraneous COPY to get the same behavior:

```
blk: copy [1 2 3 4 5 6]
insert blk COPY skip blk -2 + length? blk
probe head blk
== [5 6 1 2 3 4 5 6]
```

hiiamboris

[16:43](#msg62ebf741999499629357cfce)I'd certainly call this a bug. It first inserts cells then fills them, understandable, but this is not an intuitive result.

dsunanda

[17:03](#msg62ebfbcc443b7927a707cfd4)Thanks .... Is now issue #5171 ..... The behavior was making a linked list in some ported code go weird :)

greggirwin

[19:23](#msg62ec1c97cf6cfd27af7fa9fd)@Oldes it's correct the way it is. There is no unset value in there. No values at all.

Oldes

[19:38](#msg62ec201bd020d223d32d87eb)So it is good to have same result for `""` and `"[]"`?

[19:39](#msg62ec206d3a42316d33e27172)There should be `null` in this case.. but that does not exists in redbol

hiiamboris

[19:45](#msg62ec21f6443b7927a708e2b0)unset seems more reasonable

[19:48](#msg62ec227d3a42316d33e27c36)or an error (requested `one` value, but none found)

greggirwin

[20:02](#msg62ec25bb7ccf6b6d45ca0319)1) Why should it be unset? There is no input to say "There's an empty/unset placeholder value here." Unset is something to avoid, not propagate.  
2\) What is the use case where we care? e.g. we have `/next` and `/scan` as well.

hiiamboris

[20:05](#msg62ec268705ad4a3701e35acf)`/next` has the same behavior

[20:07](#msg62ec26e66837563d1cc88d58)1) why should it be a block?

[20:08](#msg62ec2729aa09177429010c05)2) probably when we forget to check for `empty? input`

greggirwin

[20:08](#msg62ec272b72ad51741fd2f58d)I understand `/next` does the same thing.

No fair asking the same question back in reverse. I asked first :^)

hiiamboris

[20:08](#msg62ec273bf4d7a323dec74e27);)

[20:08](#msg62ec274f72ad51741fd2f65b)a question can partly be an answer in itself

gurzgri

[20:09](#msg62ec276511a6a83d04a8ea62)@PeterWAWood `equal? %a %A ;== true` yes, but also `strict-equal? %a %A ;== false` in OS independent ways. I don't think `equal?` returning true even on Linux is a contradiction to the fact that Linux allows them to be different files. And no contradiction in Windows not treating `%a` and `%A` as the same file either. As in both cases file names are compared, not files.

hiiamboris

[20:09](#msg62ec276611a6a83d04a8ea68)in this case, it points that the question formulation is invalid

[20:09](#msg62ec2792647d633cf6139d35)TBH, unset gnaws at me too, so proposed error

greggirwin

[20:10](#msg62ec27b1aa09177429011078)Why is the question invalid?

hiiamboris

[20:10](#msg62ec27d205ad4a3701e361c4)because  
&gt; There is no input to say "There's an empty/unset placeholder value here."

doesn't justify the block either

[20:11](#msg62ec27efb16e8236e36d133c)and if anything, unset at least triggers an error slightly faster

greggirwin

[20:12](#msg62ec2815647d633cf6139ff2)`load ""` sets a precedent, does it not?

[20:12](#msg62ec282d647d633cf613a0b7)As does `transcode` itself, without the refinement.

hiiamboris

[20:12](#msg62ec28376837563d1cc89785)mind `transcode` vs `transcode/one` (which @Oldes used)

[20:13](#msg62ec284fd020d223d32dc7ec)`load ""` and `transcode ""` are not questioned

greggirwin

[20:14](#msg62ec28897ccf6b6d45ca18ee)Again, I am clear on @Oldes question. My point being that what `/one` means is the crux, as it's not clearly defined yet.

hiiamboris

[20:15](#msg62ec28cad020d223d32dcc5e)ok, well, for me `one` means exactly one value

[20:15](#msg62ec28f0d020d223d32dcda6)and while `transcode ""` always returns a block of zero or more values, `one` is unsuitable for zero case  
think of `transcode input` as a series of `transcode/one` input: then `/one` on empty should be undefined, otherwise it breaks the model

greggirwin

[20:15](#msg62ec28fdcf6cfd27af8004fa)I watched a great talk recently by John Ousterhout, and plan to get his new book. One of his principles, which Red already does quite often, is to avoid raising errors when they aren't important. His example is out of bound indexes on slices. Just return what data you can.

hiiamboris

[20:17](#msg62ec2955458f823ce077588f)what's his rationale for that?

greggirwin

[20:37](#msg62ec2e099d3c186299f42b36)https://www.youtube.com/watch?v=bmSAYlu0NcY

[20:41](#msg62ec2ef09994996293596031)&gt; think of transcode input as a series of transcode/one input: then /one on empty should be undefined, otherwise it breaks the model

Good point. But `/next` solves this, as does `/scan`, right? Following your logic, `/next` would throw an error at the end, meaning all `transcode/next` loops still have to check for empty input or handle the possible error if you go to the end. This is why I asked for use cases. How do we expect `/one` to be used?

[20:41](#msg62ec2f1272ad51741fd33627)Rather, how did @dockimbel \*design* it to be used.

hiiamboris

[21:12](#msg62ec3640aa091774290187f2)If you don't check for empty, you end up with an invalid result, or infinite loop (as it will return `[]` indefinitely)

greggirwin

[21:17](#msg62ec376c72ad51741fd37401)So you want the error to protect from that?

[21:21](#msg62ec384e647d633cf6140909)And how does that relate to other possible infinite loops? Certainly, I agree that preventing problems is a good thing. Just a matter of how best to achieve that.

## Friday 5th August, 2022

Oldes

[08:08](#msg62ecd003cf6cfd27af84aa6f)If `#[unset]` is not good enough and there is no `null` type, than the only acceptable result (for me) would be:

```
>> transcode/one ""
** Script error: out of range or past end
```

[08:44](#msg62ecd864443b7927a70e0a5d)The same for `transcode/next ""` imho.

meijeru

[15:03](#msg62ed315f458f823ce07e7115)I have a difficulty with `remove-each`: the following gives an error

```
>> a: [1 2 3 4 5]
== [1 2 3 4 5]
>> remove-each w a odd? w
*** Script Error: w has no value
*** Where: odd?
*** Near : w
*** Stack:
```

[15:04](#msg62ed316b3a42316d33ea020b)What do I do wrong?

[15:05](#msg62ed31a39d3c186299fb67c6)From the docstring I conclude that w is set to a/1, a/2 etc.

pekr

[15:05](#msg62ed31a811a6a83d04b06a18)A subblick?

[15:05](#msg62ed31b99994996293609f62)Block, sorry, on a smartphone.

meijeru

[15:05](#msg62ed31d43a42316d33ea02e8)Aha, w is set to a, next a, next next a etc.?

pekr

[15:07](#msg62ed3222443b7927a7107c8b)I mean, should not `odd? w` be in a block?

meijeru

[15:08](#msg62ed3275647d633cf61b2ab0)I apologize, of course it should!

pekr

[15:12](#msg62ed336ad020d223d3354920)I was not sure anyway, long time since I last programmed, so did not remember the exact syntax. Shame on me, I get okder and start to forget things 🙂

ldci

[15:29](#msg62ed374eb16e8236e374b663)remove-each w a \[odd? w]

GiuseppeChillemi

[16:01](#msg62ed3edeb16e8236e374ecc3)Could someone explain what is happening here?

```
t: func [
	a
	/copy
	/local
	out-data
	o
] [
	out-data: system/words/copy []
	o: make object! compose/only [
		copy: (copy)
	]
]

t2: func [
	a
	/local
	out-data
] [
	probe out-data: copy []
]

probe t [] 
probe t2 []
```

This is the output:

```
make object! [
    copy: false
]
none
[]
```

`none` should be `[]` but `copy` in the second function is `none`. The third `[]` should not exists.

If I comment out `copy` in the object of the first function, I get the correct result.

```
o: make object! compose/only [
		;copy: (copy)
	]
```

I have used defined a refinement `/copy`so both `copy` and `(copy)` should not interfere with the global words.

[16:03](#msg62ed3f55f4d7a323decf0a9b)(Note, I have fixed the script)

[16:25](#msg62ed44807ccf6b6d45d2410b)I have found the cause

[16:30](#msg62ed45887ccf6b6d45d24803)It is a side effect of an upper `function` which encloses both functions. It seems it makes `copy:` local.

[16:32](#msg62ed46186837563d1cd0a3fb)I didn't expect `function` would collect any `set-word!` even on prototypes keys in object creation

hiiamboris

[16:39](#msg62ed47b6f4d7a323decf49f9)I get caught by careless overrides all the time ;)

GiuseppeChillemi

[16:49](#msg62ed4a2f72ad51741fdafd06)It is one more reason to keep using `func` instead of `function`. Having nested functions and objects definition inside them, makes `function` really a plague! You must shield any block with `set-word!`s from binding, defining them in a word outside the `function` binding range and then reduce the word when needed. But then you loose the binding of the refinement word to the inner function and you must bind the block manually. OMG, you can go crazy with this!

hiiamboris

[16:52](#msg62ed4ac53a42316d33eab43b)Tip: keep functions small. Get what you can out of them.

GiuseppeChillemi

[17:01](#msg62ed4cfbaa09177429096676)I usually prefer keeping local needed structures inside the function, to have them organized inside the "container" where they are used.  
Maybe, I now see a good use fort `function/with` in Rebol3, keeping my structures outside the function's block.

hiiamboris

[17:14](#msg62ed500872ad51741fdb2825)`context [structures... f: function [] [...]]`

[17:15](#msg62ed5023443b7927a7114f24)Mind that function re-evaluates whatever you define inside it \*on every call!*

GiuseppeChillemi

[17:24](#msg62ed523a443b7927a7115caf)Yes, I know but I do this when I must have new operative objects on every call, so the the function is recursive. Otherwise I keep inside just the prototypes which are a little `word: [proto]` setting operation and a small binding overhead.

greggirwin

[18:37](#msg62ed637e458f823ce07ff67f)On `transcode/one`, @oldes what are you using it for? Anyone else have use cases?

This is the difference we're talking about, right?

```
; Trim because all spaces is like an empty string to transcode
input: trim "your data here"

; Current design: choose empty default/logic as you wish
val: either empty? input [none][try [transcode/one input]]
if error? val [
	; Invalid data for sure
]

; New error proposal
val: try [transcode/one input]
if error? val [
	; Is the error because it's empty or invalid data?
]
```

I think this comes back to the design intent that @dockimbel has to weigh in on. `Transcode` takes an input, and we probably all agree that inputs should be checked. An empty input is a legal edge case. It is not an error. It's also not a value placeholder (unset). But it has to return something. Can't distinguish empty from `#[none]` if we go that way, which is an issue elsewhere (e.g. `select`). Today we can't tell `""` from `"[]"` either.

It's a design \*choice* with no right or wrong. Any change here is just different, not better.

Side note/bug: Why can't we `trim` tags?

```
>> input: trim <your data here>
*** Script Error: trim does not allow tag! for its series argument
*** Where: trim
*** Near : <your data here>
*** Stack:
```

hiiamboris

[18:47](#msg62ed65c73a42316d33eb7667)&gt; It is not an error

This is where we disagree with you. `one` (`next`) value requested - condition that cannot be fulfilled by empty input.

[18:49](#msg62ed66263a42316d33eb7be7)`take` returns `none` in this case though, understandably (still an error, but we chose to muffle it)

pekr

[19:07](#msg62ed6a609994996293623f8f)I don't like /one name. Maybe /once, not sure either ....

[19:08](#msg62ed6a90cf6cfd27af8916a7)I do agree, that returning empty string/block at edges (tail / head) is perfectly valid

hiiamboris

[19:26](#msg62ed6ed0443b7927a7122a95)sorry, where have you seen an empty \*string* and what does it have to do with \*head\*?

Oldes

[21:34](#msg62ed8cec9d3c186299fdf2ed)@greggirwin I was reviewing `translate` in Rebol3. So my use case was to write test cases with acceptable results. I don't consider current Red result for this case correct, so I mentioned it here.

[21:37](#msg62ed8d909994996293634cec)Btw.. in R3 there is `/error` refine for relaxed behavior.. returning error instead of throwing it, so no need to use `try`. I'm on mobile now.. so no advanced example.

[21:39](#msg62ed8e13d020d223d337fffb)https://github.com/Oldes/Rebol3/blob/9ea5fc1a3de5a11759a36df50145ec36a3c21aaa/src/tests/units/lexer-test.r3#L29

greggirwin

[23:23](#msg62eda66a443b7927a713bd61)I haven't kept up with your version of R3. Looks like `/line` is new there, and I will have to make time to see what `translate` is. Thanks.

## Saturday 6th August, 2022

Oldes

[06:17](#msg62ee0794aa091774290e80c9)Sorry.. transcode.. not translate.. it was too late for me.

greggirwin

[17:02](#msg62ee9e91443b7927a71a8f7e)&lt;hehe&gt;

## Tuesday 9th August, 2022

bubnenkoff

[08:02](#msg62f214973a42316d330d78fe)Could anybody check next code:

```
d: [test: none]
x: none 
set d/test 'x
```

it seems a bug. Console become blank and hang

hiiamboris

[08:18](#msg62f2183af4d7a323def1e152)You're destroying `none` value globally.

[08:18](#msg62f2185e443b7927a7330b9c)Forgot the `'` before `d/test`?

## Wednesday 10th August, 2022

luce80

[16:39](#msg62f3df436837563d1cffb1f4)

```
>> help load
USAGE:
     LOAD source

DESCRIPTION: 
     Returns a value or block of values by reading and evaluating a source. 
     LOAD is a function! value.
...
```

Does it really evaluate the source ?

dockimbel

[16:45](#msg62f3e0a3f4d7a323defec661)No, the docstring is wrong and need to be changed.

hiiamboris

[16:55](#msg62f3e2e59d3c1862992afdf5)Nope.

greggirwin

[17:54](#msg62f3f0c105ad4a37011b4e78)It's a bit of a gray area, as a string needs to be tokenized and turned into Red data. We don't have a term for that, except `load` itself.

## Thursday 11st August, 2022

luce80

[14:20](#msg62f51034458f823ce0b69a4c)@greggirwin IMHO tokenizing is far away from evaluating but I do not want to start a despute.

[14:20](#msg62f51049647d633cf652bd0a)

```
>> help layout
Func spec couldn't be parsed, may be malformed.
...
```

In which way is the spec unparseable or malformed ?

ne1uno

[14:25](#msg62f5115bcf6cfd27afbfaacd)@luce80, probably from a change with debugging `[no-trace]`

[14:25](#msg62f5115b05ad4a3701234bfd) are you using an older interpreter?

[14:26](#msg62f51188aa0917742940cc78)`?? layout`

hiiamboris

[14:28](#msg62f511fb647d633cf652c78a)same result for me, even on today's build

[14:31](#msg62f512c93a42316d3322b05a)I think it was reported but can't find the report itself :/

dockimbel

[15:01](#msg62f519e1b16e8236e3ad5795)Contributions are welcome to fix that `help` issue.

## Friday 12nd August, 2022

hiiamboris

[18:43](#msg62f69f5d3a42316d332dd9c6)@dockimbel

```
>> replace/all/deep "abc" [skip] ""
*** Script Error: PARSE - matching by datatype not supported for any-string! input
*** Where: parse
*** Near : deep?
*** Stack: replace also
```

[18:44](#msg62f69f8a05ad4a37012e7137)found a regression after all ;)

dockimbel

[19:25](#msg62f6a91f05ad4a37012eafa7)Thanks, fix pushed.

hiiamboris

[19:27](#msg62f6a984d020d223d3791278)I think problem is in `any-list` though.

[19:27](#msg62f6a9a011a6a83d04f442cd)Try `replace/all/deep "abc" ["b"] ""` - works?

dockimbel

[19:28](#msg62f6a9f3647d633cf65e3219)That one is not related to the end check removal. It crashes the same on commits before the merge.

hiiamboris

[19:50](#msg62f6af0b7ccf6b6d45151f70)Not reported AFAIK

[19:51](#msg62f6af52b16e8236e3b8bd0f)(but it's not crashing for me)

## Monday 15th August, 2022

luce80

[15:19](#msg62fa641baa091774296718b2)

```
>> about
Red 0.6.4 for Windows built 14-Aug-2022/9:23:14+02:00  commit #4eb8ad8
```

```
system/view/silent?: yes
system/view/auto-sync?: no
view compose [
	below
	inp: field 200 "pen green circle 30x30 20" focus on-key-up [out/draw: load inp/text show out]
	out: base
	do [out/draw: load inp/text]
]
```

Try to \*\*rapidly\** remove the "green" word and an access violation will happen.

hiiamboris

[16:10](#msg62fa700d647d633cf678c22d)reproduced

[16:19](#msg62fa721f443b7927a76eb900)looks like `silent?` crashes it?

[16:20](#msg62fa72439994996293be8f4c)modified version:

```
Red []
system/view/silent?: yes
system/view/auto-sync?: no
text: "pen green circle 30x30 20"
view [
    out: base rate 10 on-time [
		remove skip text 4
		out/draw: load text show out
	]
]
```

just press any key to crash it

greggirwin

[18:41](#msg62fa9368f4d7a323de2d9112)If nobody else gets to the `help` issue before I'm back online I'll look into it.

## Tuesday 16th August, 2022

hiiamboris

[12:33](#msg62fb8e8f6837563d1c361541)@dockimbel on linux when console is just started it prints an error:

```
*** Access Error: cannot open: %""
*** Where: read
*** Near : 'Red
*** Stack:
```

[12:33](#msg62fb8e95458f823ce0e4e2d4)could be parse related

[12:53](#msg62fb93483a42316d3350dd38)perhaps adding `not end` before https://github.com/red/red/blob/58444429bcaf09ed4500496936a1c3657b533969/environment/functions.red#L758 will fix it?

x8x

[13:01](#msg62fb9541f4d7a323de34df01)this commit break it https://github.com/red/red/commit/1f3694334e94236e5b1c2cce8406978426fceb6e , after it on linux `system/options/args` returns `[""]` instead of \`none.  
that error is actually a printed trapped error from here https://github.com/red/red/blob/58444429bcaf09ed4500496936a1c3657b533969/environment/console/engine.red#L68

hiiamboris

[13:20](#msg62fb99b66837563d1c366aad)@qtxie was there a change to anti-aliasing mode recently? I'm detecting that text drawn on images became more blurry

qtxie

[13:28](#msg62fb9b8c9994996293c6db38)@hiiamboris Yes. In order to drawing text on fully transparent image.

hiiamboris

[13:29](#msg62fb9ba511a6a83d04174ef5)okay

[13:29](#msg62fb9bb96837563d1c3678ce)cleartype doesn't work with alpha I guess

qtxie

[13:34](#msg62fb9cd06837563d1c367fe3)Seems so. Not sure if it's a limitation or a bug in DirectWrite.

luce80

[16:06](#msg62fbc0a17ccf6b6d4538fd18)about `system/view/silent?`, I don't know if this makes things easier or not but when I forgot to use compose:

```
>> system/view/silent?: yes
== true
>> drawing: [pen green circle 30x30 20]
== [pen green circle 30x30 20]
>> view [
[    	below
[    	inp: field 200 (form drawing) focus on-key-up [out/draw: load inp/text  out]
[    	out: base draw drawing
[    ]
*** Throw Error: no catch for throw: silent
*** Where: either
*** Near : no
*** Stack:
```

GiuseppeChillemi

[17:04](#msg62fbce0711a6a83d0418b057)has someone experienced the debugger continuously going on creen, like having hit `enter` after a `do/later` and then `stop` in a subcall?

[17:05](#msg62fbce753a42316d33529a61)Note: call has been invoked inside a VIEW button actor code.

loziniak

[23:13](#msg62fc24b5b16e8236e3dfa3a9)hello. I've got a nasty one:

```
>> to block! make vector! [2]
== [2]
>> 
>> to block! make vector! []

*** Runtime Error 98: assertion failed
*** in file: /mnt/share/downl/red-master/runtime/allocator.reds
*** at line: 903
***
***   stack: red/alloc-series-buffer 0 16 0
***   stack: red/alloc-series 0 16 0
***   stack: red/alloc-cells 0
***   stack: red/block/make-at 08920554h 0
***   stack: red/vector/to-block 08920564h 08920554h
***   stack: red/block/to 08920554h 08920564h 5
***   stack: red/actions/to 08920554h 08920564h
***   stack: red/actions/to*
***   stack: red/interpreter/eval-arguments 08920544h F65B0A00h F65B0A00h 08920524h 00000000h 00000000h F67B0DF8h
***   stack: red/interpreter/eval-code F67B0DF8h F65B09C0h F65B0A00h 08920524h false 00000000h 00000000h F67B0DF8h
***   stack: red/interpreter/eval-expression F65B09C0h F65B0A00h 08920524h false false false
***   stack: red/interpreter/eval 08920524h true
***   stack: red/natives/catch* true 1
***   stack: ctx||495~try-do F7F8B808h
***   stack: ctx||495~do-command F7F8B808h
***   stack: ctx||495~eval-command F7F8B808h
***   stack: ctx||495~run F7F8B808h
***   stack: ctx||495~launch F7F8B808h
***   stack: ctx||514~launch F7F8B214h
***   stack: ***_start
```

Can anyone confirm? It's on recent master.

dockimbel

[23:36](#msg62fc29e8aa0917742973ece8)Confirmed, you can open a ticket for it. It's a trivial fix.

## Wednesday 17th August, 2022

loziniak

[05:54](#msg62fc82977ccf6b6d453e6782)Here it is: https://github.com/red/red/issues/5178 :-)

luce80

[14:06](#msg62fcf5cc11a6a83d042106d7)A strange thing happens on Win11.  
\* open gui-console  
\* `do` a script that opens a window  
\* go to another window (not console nor script)  
\* close the script window using the thumbnail that appears hovering on the task bar  
\* when you go back to console it is as if the script did not finished

hiiamboris

[14:12](#msg62fcf75d72ad51741f4a8baf)it's a known bug for a year or so, but I can't find it :/

## Thursday 18th August, 2022

luce80

[13:12](#msg62fe3acd7ccf6b6d454af225)Another annoying thing. \*\*Without\** console opened, try this on Win11:

```
print "" ; open console for debug
view [text "Hello world!" button "Hi" [alert "All right"]]
```

When I press the "OK" button of the alert the console disappears . It is gone behind other windows I have opened.

dockimbel

[13:30](#msg62fe3eeef4d7a323de47b932)Can't reproduce that on Win10, might be specific to Win11.

greggirwin

[16:57](#msg62fe6f75aa0917742983d4f4)Looks like `help layout` broke mid-December of last year.

[17:02](#msg62fe70c39d3c1862997648c9)That's when `no-trace` was added, which a patch was made for on 11-Jan-2022, but `'layout` must not have been used when testing it.

[17:05](#msg62fe7158443b7927a78b77ff)`split-path` and `clean-path` as well.

rebolek

[17:08](#msg62fe7214b16e8236e3f03818)`help` can't parse func attributes

greggirwin

[17:12](#msg62fe72edcf6cfd27af022021)Looks like a spec ordering issue. The parser expects any doc string to come before attrs.

[17:16](#msg62fe73fd458f823ce0f984d8)For now we can make `help` forgiving, but it points out why specs are important.

[18:55](#msg62fe8b18647d633cf6962284)The reason for that presumed ordering came from R2, which also didn't have a hard spec, but here's an example:

```
>> ?? throw-on-error
throw-on-error: func [
    {Evaluates a block, which if it results in an error, throws that error.}
    [throw]
    blk [block!]
][
    if error? set/any 'blk try blk [throw blk]
    get/any 'blk
]
```

## Friday 19th August, 2022

qtxie

[04:27](#msg62ff114d458f823ce0fde425)&gt; Another annoying thing. \*\*Without\** console opened, try this on Win11:  
&gt;

```
> print "" ; open console for debug
> view [text "Hello world!" button "Hi" [alert "All right"]]
>
```

&gt; When I press the "OK" button of the alert the console disappears . It is gone behind other windows I have opened.

It's a known issue which caused by we use a normal window to simulate a modal dialog.

[04:29](#msg62ff11c3d020d223d3b52995)Seems a modal dialog on Windows is kind of special.

hiiamboris

[08:18](#msg62ff475b11a6a83d043192d4)I have the same issue with my email client: newly opened (non modal) email window goes to the bottom of Z-order. I think it's one of the permanent Windows bugs, which we'll have to find a workaround for.

qtxie

[09:20](#msg62ff55d7cf6cfd27af0881f4)@luce80 @hiiamboris Pushed a fix.

```
ShowWindow

SW_HIDE
0 	Hides the window and activates another window.
```

\*activates another window* :sweat:

hiiamboris

[11:25](#msg62ff7324f4d7a323de506069)But that makes sense. Otherwise focus will just get lost, which is the most annoying thing to happen.

[11:36](#msg62ff75ce647d633cf69cb2fc)The fix works fine. But how is SW\_HIDE an issue I wonder?

[11:39](#msg62ff76646837563d1c51e609)I have a regression though. Need to locate it only :/

[11:52](#msg62ff7979f4d7a323de508bf6)Ohh that's a big one.

[11:52](#msg62ff7988b16e8236e3f7c864)@dockimbel

```
>> a: context [x: none]
>> a/x: func [x][]
*** Script Error: a/x: is missing its x argument
*** Where: x
*** Near : []
*** Stack: x
```

## Saturday 20th August, 2022

hiiamboris

[16:27](#msg63010b73aa09177429966439)@dockimbel encountered this?

```
Compiling to native code...
*** Loading Error: file access error: %../image-utils.reds
*** in file: %/D/devel/red/spaces/programs/datatypes/image.reds
*** at line: 13
```

[16:29](#msg63010be2f4d7a323de5bafb4)Compiling `-r` any script leads to this error

[16:29](#msg63010bf6cf6cfd27af148dc6)Must be related to you moving files around recently.

[16:31](#msg63010c59f4d7a323de5bb368)Above path is invalid ofc.

dockimbel

[19:05](#msg6301308305ad4a3701799d3d)I can reproduce it.

greggirwin

[20:07](#msg63013eec443b7927a79f2992)Maybe not worth a ticket, but there's a typo in %function.reds. `decode-attributs` should be `decode-attributes`.

@dockimbel it looks like you have it coded so func attrs must come first, before the doc string. Rather than allowing both orders, should I just switch the rules in `help` from:

```
opt func-desc=
				opt func-attr=
```

to:

```
opt func-attr=
				opt func-desc=
```

?

## Sunday 21st August, 2022

dockimbel

[15:21](#msg63024d649994996293f6fce1)Attributes should come first (for now), yes.

greggirwin

[16:57](#msg630263fe6837563d1c666e66)Will do. :+1:

## Monday 22nd August, 2022

dsunanda

[13:24](#msg6303837fcf6cfd27af266a73)@dockimbel Thanks for fixing #5101 - it's been extremely annoying when writing code - typos can be hard to find, and cause weird misbehavior.

dockimbel

[13:26](#msg63038406f4d7a323de6d1295)@dsunanda You're welcome! I should have fixed it much earlier.

dsunanda

[13:28](#msg63038484aa09177429a7d9e8):) I just discovered it was fixed because some old code broke (it had a typo). Very happy that your bug fix found my old bug.

GiuseppeChillemi

[22:31](#msg630403cf3a42316d338d3a55)Is it a bug or a feature?

```
>> a: random "lak4tl24k43g3rvuj" probe reduce [random a random a]
["3342atvur4kl4jlgk" "3342atvur4kl4jlgk"]
```

The randomized strings are equal but if you run the block multiple times, the randomization works.

greggirwin

[22:38](#msg6304055411a6a83d04531b55)`random` works in place, so by the time you `probe`, `a` still refers to the original series...both times. :^)

GiuseppeChillemi

[22:41](#msg63040636aa09177429ab971b)but shouldn't the internal randomized seed (pardon If I call it in the wrong way) change at each run, so the randomization on the same string will change at each call?

## Tuesday 23th August, 2022

greggirwin

[00:08](#msg63041a7a647d633cf6bda1db)

```
>> a: random "lak4tl24k43g3rvuj"
== "llk43kt4u2r3avgj4"
>> reduce [x: random a y: random a]
== ["vk3rl3kuj442atg4l" "vk3rl3kuj442atg4l"]
>> same? x y
== true
```

GiuseppeChillemi

[06:59](#msg63047adab16e8236e31b798b)While building a test on `hash!` table with this loop:

```
table: make hash! [[a b c d e]]
random-string: "lak4tl24k43g3rvuj"
repeat idx 100000 [

	random-string: random "lak4tl24k43g3rvuj"
	
	append/only table reduce [
		random-string 
		random-string
		random-string
		head insert copy [] idx
		random-string
	]
]
```

Red has eaten 3,5GB of ram in 1 minute and then has hanged. Is it expected or should I open a ticket?

hiiamboris

[07:47](#msg630485fdaa09177429af392b)

[07:49](#msg630486753a42316d3390d601)https://github.com/red/red/commit/671dae6581601abf2e54f695a36e44c120887fe0 this should be the answer

[07:50](#msg630486d6647d633cf6c0acca)tip: don't make hash until you have a finished block

GiuseppeChillemi

[09:34](#msg63049f119d3c186299a261c5)So I have not understood how RANDOM works: I thought it would return a different result at each invocation, because on the console:

```
>> random "lak4tl24k43g3rvuj" 
== "llk43kt4u2r3avgj4"
>> random "lak4tl24k43g3rvuj" 
== "k3akjltv2u44l3g4r"
```

OMG... maybe I have the answer. It could be because in the console, the same string content is a different series! Lets test it!

```
>> s: "lak4tl24k43g3rvuj" 
>> random s
== "jlva32l44t3grk4uk"
>> random s
== "4vrgu24jl43katk3l"
```

[09:35](#msg63049f53999499629307bae6)Not, even on the same series, I get different result inside the console

[09:37](#msg63049fbef4d7a323de74fbe1)@gregg Isn't this test :point\_up: \[23 agosto 2022 02:08](https://gitter.im/red/bugs?at=63041a7a647d633cf6bda1db)  
and my last one on the console the same? (Apart the first `random`?

Oldes

[09:56](#msg6304a436999499629307d942)`random` just modifies content of the series' data

[09:56](#msg6304a456f4d7a323de751fc3)I don't understand, what you don't understand.

[09:57](#msg6304a4a1458f823ce0253c89)It is event in the doc string twice... \_...shuffles series... result (modified when series)..._

[10:04](#msg6304a62205ad4a37019235c1)Use `random/seed` when you need consistent results and `copy` when you want a new series.

```
>> s: "12345"
== "12345"
>> random/seed 1
>> random copy s
== "52134"
>> random copy s
== "31425"
>> random/seed 1
>> random copy s
== "52134"
>> random copy s
== "31425"
```

[10:07](#msg6304a6d6f4d7a323de75379c)In your test, you should have:

```
random-string: does [random copy "lak4tl24k43g3rvuj"]
```

[10:14](#msg6304a887f4d7a323de7545f2)Or something more random, like:

```
random-string: function[/length len [integer!]][
    len: any [len 8]
    str: make string! len
    loop len [append str to char! (47 + random 73)]
]
```

[10:21](#msg6304aa339994996293080285)(maybe it would be fine to have `random` working on `bitset!` too)

GiuseppeChillemi

[10:23](#msg6304aa8611a6a83d04579bab)What is causing me to not understand is here:

```
>> s: "lak4tl24k43g3rvuj" reduce [random s random s]
== ["kuglj3at432vlk4r4" "kuglj3at432vlk4r4"]
;------ In the console 
>> random s
== "lg4ajurltkvk34243"
>> random s
== "t3r43kg42vlk4ajlu"
```

If `Random` modifies (shuffles) the original series, why using it twice in a block does not modify the series and I get the same results in both first and second position?

Oldes

[10:24](#msg6304aaef3a42316d3391d8fa)It is same like:

```
>> s: "123" reduce [next s next s]
== ["23" "23"]
```

GiuseppeChillemi

[10:25](#msg6304ab1acf6cfd27af2ee447)No, it's different, there you are modifying series content not the pointer to the series

[10:27](#msg6304ab767ccf6b6d4578f31a)One moment, I have understood.

[10:27](#msg6304ab9811a6a83d0457a663)No, I havent.

Oldes

[10:27](#msg6304aba4f4d7a323de7562e9)

```
>> s: "123" b: reduce [s s]
== ["123" "123"]
>> random s 
== "231"
>> b
== ["231" "231"]
```

GiuseppeChillemi

[10:28](#msg6304abc96837563d1c76b648)But if you run `random s` a second time in the console, you get a different result

Oldes

[10:28](#msg6304abcf11a6a83d0457a720)The block `b` has two pointers to the same series data, which are modified by `random`. But this is not right group for this chat. It is basic working with series in redbol languages.

[10:31](#msg6304ac7f458f823ce0257503)Last try to let you understand, what is going on... than you must meditate over it yourself.

```
>> s: "lak4tl24k43g3rvuj" random/seed 1 reduce [probe random s probe random s]
"ll3v2ru4k34gkat4j"
"4gvkuj4k3r2tlal43"
== ["4gvkuj4k3r2tlal43" "4gvkuj4k3r2tlal43"]
```

GiuseppeChillemi

[10:32](#msg6304acbd05ad4a3701925fb7)&gt; But if you run `random s` a second time in the console, you get a different result

:point\_up:

This is the point

[10:37](#msg6304adce3a42316d3391ecac)With the last examples you have totally confused me. Where could we move to talk? red/help?

riprwwa

[10:43](#msg6304af6d647d633cf6c1c9a3)I see this as: the probe expressions are evaluated while the block is being reduced.  
This makes us see the 2 different strings, as probe outputs stuff to the console, aka has side effects.  
But the end result is the same series s, to which random has been applied twice in-place - the block refers to the same series s

GiuseppeChillemi

[10:46](#msg6304afe96837563d1c76d5c6)@riprwwa I will move this topic to red/help to continue, but now I need 1 hour to relocate.

Oldes

[10:50](#msg6304b0fb9d3c186299a2e111)

```
>> s: "12345" random/seed 1 b: reduce [probe random s probe random s]
"52134"
"15324"
== ["15324" "15324"]
```

is same like:

```
>> s: "12345" b: reduce [probe append s "x" probe append s "y"]
"12345x"
"12345xy"
== ["12345xy" "12345xy"]
```

and:

```
>> s: "12345" random/seed 1 b: reduce [s s]
== ["12345" "12345"]
>> random s
== "52134"
>> random s
== "15324"
>> b
== ["15324" "15324"]
```

And that is really my final post on this topic. If you don't understand it, you should go to the first class again and learn, why we have to use `copy` when working with series.

GiuseppeChillemi

[10:59](#msg6304b32d99949962930841c7)@Oldes don't offend me, otherwise I will say to Hostile Fork that you love his Ren-C and you are asking to accept all his modifications to your Rebol3 😁😁😁

[11:15](#msg6304b6b9443b7927a7b77271)I have finally understood. The console shows the correct behaviour. It returns the same series but modified. Inside the block the second `random` modifies the series a second time, so that all results, being the same series are modified. In my code there are 4 random numbers but see just the last result in all (the last modification of the series).

[11:21](#msg6304b84905ad4a370192b508)It modifies the series and returns the original one. This was to understand. Because another possible hyphotesis was valid too: I have supposed `random`was returning a new instance of the series, randomizing its content in the copy, and at the same time returning the same randomized original value when called again in the block.

[11:31](#msg6304baa8647d633cf6c21ecb)@Oldes Thank you, this time I have been caught by a really powerful illusion. Without your example where you have used `happend`, I would still be entrapped. Redbol languages have multiple possible working scenarios you can imagine, because of the multiple ways things could be done.

[11:33](#msg6304baf3458f823ce025ddda)(I promise I will not tell Hostile Fork you love his work and you want to merge :-D )

[11:47](#msg6304be55443b7927a7b7a774)I sudden storm has forced me to remain home, so I have done further investigations on all parts involved.

Also, 2 linguistic problems in the help string have influenced the creation of multiple interpretations:

`Maximum value of result (modified when series)`

What is modified here: the "result" or the maximum randomized value when series?

And also:

`Returns a random value of the same datatype; or shuffles series`

Does it shuffles the series and returns the shuffled value, or "shuffles" the original series?

I would modify the function description into:

`Returns a random value of the same datatype; shuffles the original series and returns it`

greggirwin

[19:24](#msg63052961443b7927a7baad5e)@GiuseppeChillemi per your console question:

```
>> random a: "lak4tl24k43g3rvuj" 
== "llk43kt4u2r3avgj4"
>> random b: "lak4tl24k43g3rvuj" 
== "k3akjltv2u44l3g4r"
>> same? a b
== false
```

It's very important to remember that the console does not work exactly like in a script in this sense.

[19:24](#msg6305297faa09177429b3d877)It's easy to trip over, especially for those new to Red, but I still do it once in a while too.

GiuseppeChillemi

[20:22](#msg63053705f4d7a323de795bfb)@greggirwin Gregg the cause of the problem was to find in many different concurrent and possibile scenarios. My brain has been totally blocked, thinking that:  
`a: "k3akjltv2u44l3g4r" [random a random a]` would not modify the original series but it was generating the same random value when it encounters `"k3akjltv2u44l3g4r"` for the first time. Instead, as all the elements of the block were referring to the same string, the result of the last round of `RANDOM` was shown into all the elements of the block. This is the same output you have if the function would work not modifying the original string and genereating the same output when it is called over `"k3akjltv2u44l3g4r"`

## Sunday 28th August, 2022

luce80

[18:35](#msg630bb589b16e8236e34df70a)If I have a custom style in whose `template` I set `options` they are delete and overwritten by user options, is it by design?:

```
system/view/VID/styles/ascroller: [
	default-actor: on-change
	template: [
		type: 'scroller
		size: 16x16

		options: [direction: -2]
	]
	init: []
]
view [
	scrl: ascroller options [a: 1 b: 2]
]
?? scrl/options 
; scrl/options: [a: 1 b: 2 style: ascroller vid-align: top at-offset: none]
```

How can I have default `options` ?

greggirwin

[18:44](#msg630bb79df4d7a323dea6d97a)You do have default options. :^) As you say, they are overridden by the user. `Options` is just a piece of data like any other. There's is no built-in mechanism for templating or merging from VID. For now, the best you can do is document it for users, unless you want to do quite a lot of deep work on VID itself. In that case, the first thing to do is make a proposal to see if it may be accepted.

[18:45](#msg630bb7bb72ad51741fb35514)A general templating and merging system is on my list, as it's useful in many contexts.

## Thursday 1st September, 2022

qtxie

[04:18](#msg6310329faa09177429ea94f5)&gt; I installed the new GUI and CLI console builds on a Raspberry PI running the latest 32-bit OS (Buster) which is fully updated. The cli console runs fine but there is an issue with missing libcrypto.so.1.0.2

@PeterWAWood Seems the binaries on the download page are wrong for RPi. It should use `libcrypto.so.1.1` if it's compiled with target `-t RPi`.

[04:19](#msg631032d8647d633cf6fc2e7f)BTW, you can use it on 64-bit OS. https://github.com/red/red/wiki/%5BNOTE%5D-Linux-GTK-dependencies#armbian

## Saturday 3th September, 2022

hiiamboris

[12:16](#msg631345813a42316d33d2128d)Uhm.. what do you guys think of this?

```
>> f: func compose/deep [n [(number!)]] [? n]
== func [n [make typeset! [integer! float! percent!]]][? n]
>> f 10
N is an integer! value: 10
```

[12:17](#msg631345c3443b7927a7f71484)

```
>> f: func compose/deep [n [(number!) (any-string!)]] [? n] ?? f
f: func [n [make typeset! [integer! float! percent!] make typeset! [string! file! url! tag! email! ref!]]][? n]
>> f "abc"
N is a string! value: "abc"
```

[12:17](#msg631345cdf4d7a323deb57860)I suppose it's a `help`s problem

[12:18](#msg631346049994996293489107)though I can abuse it:

```
>> f: func compose/deep [n [(number!) (number!) (number!)]] [? n] ?? f
f: func [n [make typeset! [integer! float! percent!] make typeset! [integer! float! percent!] make typeset! [integer! float! percent!]]][? n]
>> f 10%
N is a percent! value: 10%
```

dockimbel

[15:37](#msg631374c9647d633cf6024924)That's legal both in Red and Rebol. The arguments types are usually specified with words, but it's only because it's more convenient for us to write even though it's just a proxy for the real thing: datatypes and typesets. The "abusing" example is not a problem as multityping is allowed, it may affect performances though in Rebol. In Red, the arguments cache would squash all type declarations for a given argument into a single typeset.

[15:38](#msg631374ef6837563d1cb7b0f2)`help` should be adjusted to take such cases into account.

hiiamboris

[15:38](#msg631374f7458f823ce0660146)Also, is this a bug or necessity @dockimbel ?

```
>> o: object [x: 1 on-change*: func [w o n] [print mold/part context? w 200]]
== make object! [
    x: 1
]
>> set o none
make object! [
    datatype!: datatype!
    unset!: unset!
    none!: none!
    logic!: logic!
    block!: block!
    paren!: paren!
    string!: string!
    file!: file!
    url!: url!
    char!: cha
== none
>> o
== make object! [
    x: none
]
>> ;) 'x word was reported bound to `system/words`
```

dockimbel

[15:46](#msg631376db3a42316d33d273a2)Neither. `system/words` is not a normal context, it serves as a first-class symbol table also. So every symbol gets an entry there (set to `unset!`) by default. It's an implementation choice (same as in R2, not sure if R3 changed it or not). Anyway, modules inclusion might change that implementation model eventually.

```
>> to-word "googles"
== googles
>> skip tail words-of system/words -1
== [googles]
```

hiiamboris

[15:47](#msg63137726cf6cfd27af6f7eef)No, I know that. But all other set operations report words bound to the proper object.

[15:48](#msg6313773f11a6a83d04989a30)

```
>> o/x: 1
make object! [
    x: 1
]
== 1
>> set in o 'x 2
make object! [
    x: 2
]
== 2
>> o/('x): 3
make object! [
    x: 3
]
== 3
```

[15:48](#msg631377626837563d1cb7b58d)Shouldn't `set obj value` also take words from object's context?

dockimbel

[15:58](#msg6313799505ad4a3701d35177)It should provide a word bound to object's to `on-change*`, though it seems that can't be always \[guaranteed](https://github.com/red/red/blob/master/modules/view/view.red#L422).

GiuseppeChillemi

[16:00](#msg63137a2d11a6a83d04989ef1)@dockimbel I don't think Rebol 3 system context works as R2 and Red. `Load` has the following refinement:  
`/unbound - Do not bind the block`  
So, if a block content could be unbound, the word elements are not added to the system context and this means that not all symbols have there an entry.

hiiamboris

[16:12](#msg63137cf9999499629348fc60)@dockimbel it seems like while context's words are `red-word!`s, they don't carry the binding info? I see `_object/set-many` just passes them as is to `fire-on-set`.

[16:13](#msg63137d1e05ad4a3701d35781)I also think it's fixable if `fire-on-set` sets the context info from it's `obj` argument.

[16:13](#msg63137d3e443b7927a7f77fad)Question is though, why aren't they bound in the first place?

dockimbel

[16:29](#msg631380d1d020d223d31d70f2)Because they should have been used as "symbols" only, that are combined with a context node to form words on demand, but we got lazy and just directly reference them or `copy-cell` those slots instead of properly constructing them when needed. Also object events now could benefit from pre-bound words from context's symbols array.

hiiamboris

[16:51](#msg631385f66837563d1cb7d104)OK I'm putting this into an issue then

## Sunday 4th September, 2022

luce80

[12:46](#msg63149e297ccf6b6d45bb8ad5)For some values of font size the calculated text length is wrong and the text is clipped. I am on Win11

```
>> about
Red 0.6.4 for Windows built 4-Sep-2022/12:59:01+02:00  commit #d85b2ef
>> view [text "targets react to slider , slider reacts to field" bold font [size: 10]]
```

[12:49](#msg63149ee2aa09177429f2c84c)\[!\[image.png](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/xqWu/thumb/image.png)](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/xqWu/image.png)

hiiamboris

[12:49](#msg63149ef5aa09177429f2c855)W10: !\[](https://i.gyazo.com/3eb32483e2ad053071e5920f05b5f15b.png)

[12:50](#msg63149f05aa09177429f2c889)Make an issue

[12:52](#msg63149f7e99949962934aeb2f)Ellipsization in GUI console also regressed for me

[12:52](#msg63149fa7aa09177429f2c9d7)It's the `wrap` flag that's the culprit

[12:53](#msg63149fd89d3c186299e5a290)!\[](https://i.gyazo.com/e84cca6d43764106b98f70e6c9ab9c28.png)

[12:54](#msg63149ff6443b7927a7f9831e)well, also a failure ;)

luce80

[13:01](#msg6314a1a005ad4a3701d562c1)About ellipsization wouldn't it better to have a third option instead of assuming ellpsization instead of clipping ?

hiiamboris

[13:10](#msg6314a3c999949962934af30c)Well, yeah, I agree. Open a REP for the 'ellipsize' flag if you wish :)

[13:11](#msg6314a3f9d020d223d31f6d2c)UI labels should never ever ever be clipped or ellipsized.

[13:11](#msg6314a41caa09177429f2d151)But when it's data, like long file paths, not UI, then it should be controllable.

[18:41](#msg6314f13e9d3c186299e63478)@dockimbel I'm getting a very hard to isolate stack-related crash in Sep 3-4 builds, but not in Aug 31. Any idea?

[20:53](#msg6315103972ad51741fc51d16)Similar to `do [do [do [do [...` crash I reported but can't find. And involves throw and certain stack depth.

[21:03](#msg631512b3647d633cf60530bd)Found it

dockimbel

[23:04](#msg63152ef8d020d223d3206455)What was the cause of the crash?

## Monday 5th September, 2022

hiiamboris

[08:12](#msg6315af537ccf6b6d45bd7c38)#4880

## Tuesday 6th September, 2022

luce80

[16:56](#msg63177ba172ad51741fc9c5c5)Can I make an issue for this ? :

```
>> about
Red 0.6.4 for Windows built 4-Sep-2022/12:59:01+02:00  commit #d85b2ef
>> system/view/silent?: yes
== true
>> view [base (error)]
*** Throw Error: no catch for throw: silent
*** Where: either
*** Near : no
*** Stack:
```

hiiamboris

[17:04](#msg63177daad020d223d324de2c)Yes please :)

## Thursday 8th September, 2022

gurzgri

[19:40](#msg631a454005ad4a3701e0446a)Looks like Red doesn't get it right: https://daniel.haxx.se/blog/2022/09/08/http-http-http-http-http-http-http/

```
>> type? http://http://http://@http://http://?http://#http://  ;== url!
>> url-parser/parse-url http://http://http://@http://http://?http://#http://  ;== none
```

greggirwin

[20:00](#msg631a49dbaa09177429fdc899)The lexing rules for `url!` are simple, and don't match the RFC spec, which `decode-url` is meant to.

[20:02](#msg631a4a46d020d223d32a5f70)Now it's a matter of seeing where the decoder goes wrong, and if we care. :^) I'll read the article first.

gurzgri

[20:04](#msg631a4ad26837563d1cc4b5fa)Well that's truly an edge case and I was posting it mostly for the fun of it, should've gone into https://gitter.im/red/chit-chat instead.

greggirwin

[20:10](#msg631a4c31443b7927a7049c99)He notes the escape rules, but the RFC also has notes about the port number if the colon is used to indicate one should exist. Red's parser \*does* require a number there, avoiding the "What is the default port for the scheme?" question. We can note that as an open question.

[20:13](#msg631a4cd87ccf6b6d45c69045)The decoder could also just set the port to `none` in that case, leaving it to the user to set if desired.

[20:13](#msg631a4cfd443b7927a7049d86)`encode-url` is already set to handle `none` ports.

## Monday 12nd September, 2022

hiiamboris

[11:37](#msg631f1a117ccf6b6d45cf6cf1)@dockimbel is this a map bug or error message bug?

```
>> m: #()
>> k: 1
>> m/:k
== none
>> unset 'k
>> m/:k
*** Script Error: cannot access :k in path m/:k
*** Where: catch
*** Near : m/:k
*** Stack:
```

[11:44](#msg631f1b9a99949962935eda36)I guess I expected it to say `k` is unset or smth. Otherwise it looks as if I'm accessing an object, because map lookups are not producing errors usually. Had to double check that it's indeed a map.

dockimbel

[12:10](#msg631f21a0cf6cfd27af8562ef)It works as expected, see the same case for blocks:

```
>> b: []
== []
>> k: 1
== 1
>> b/:k
== none
>> unset 'k
>> b/:k
*** Script Error: cannot access :k in path b/:k
*** Where: catch
*** Near : b/:k
*** Stack:
```

[12:11](#msg631f21ded020d223d33361e5)The `b/:k` path cannot be resolved because `k` has no value. No lookup occurs in such case.

hiiamboris

[12:16](#msg631f231372ad51741fd86f44)I see

dsunanda

[17:44](#msg631f700f05ad4a3701e9ecb1)I have a large GUI app that works fine on a month-old Red.exe. But running it on yesterday's (red 11-sep-2022) causes the Red console to very quickly ping out of existence.  
To narrow down the failure point, I really need something like TRACE that can write its output to a file in real time.  
Anyone got something like that? Or some other ideas? Thanks!

hiiamboris

[17:47](#msg631f70bc9d3c186299fa3f67)I'm afraid trace only works on small snippets.

[17:48](#msg631f70da11a6a83d04af6e37)Compile a CLI console in debug mode, look at the stack trace for hints.

[17:48](#msg631f70ffd020d223d33411ad)https://gitlab.com/hiiamboris/red-cli/-/tree/master/mockups/redbuild

dsunanda

[17:55](#msg631f7282443b7927a70e4c3f)@hiiamboris Would a compiled command line run the GUI?

hiiamboris

[18:01](#msg631f7415647d633cf6192ef9)If you include the View module, yes

dsunanda

[18:11](#msg631f7635d020d223d3341be2)Thanks .... No need (maybe). I found the line of code by other means....  
....It's setting a PANEL's visible? flag to TRUE, when it already is TRUE. Do that 3 to 5 times and the GUI console vanishes.

Quick fix: The code works fine if I only set it TRUE if it is currently FALSE.  
The problem is absolutely repeatable at that line of code.

But I can't (yet!) replicate it in a small snippet for a bug report. That's the next puzzle....

[18:51](#msg631f7fc29d3c186299fa5e54)This will crash today's (2022-09-12) Window's GUI console in usually less than 10 clicks of the "Update" button. Comment out the "this!" line for no crash.

```
win: view/no-wait [
     p: panel 200x200 [box 100x100 blue box 100x100 red]
     return
     button "update" 
       on-up [
          clear p/pane
          append p/pane layout/only compose [box 100x100 (random white) box 100x100 (random white)]
          p/visible?: true    ; <-- this!
       ]     
     ]
```

greggirwin

[18:56](#msg631f80c9d020d223d334325b)Confirmed.

[18:57](#msg631f8119d020d223d3343324)Does not crash on my local build from 08-Sep.

hiiamboris

[19:01](#msg631f81f03a42316d33e95f75)I'll report it

[19:04](#msg631f82ac3a42316d33e960ee)Thanks for narrowing it down, @dsunanda

dsunanda

[19:07](#msg631f83607ccf6b6d45d0513e) @greggirwin Thanks. Looks like it is a very recent regression. I was fine until I upgraded from 21-Aug.  
@hiiamboris Thanks. It was fun (for some definitions of the word fun).

hiiamboris

[19:27](#msg631f883911a6a83d04afa150)Actually I'm able to crash any console I have

[19:28](#msg631f8840647d633cf6195a27)Just for some it takes a little longer

greggirwin

[19:31](#msg631f88f9b16e8236e373e9f4)I clicked about 100 times in my 24-Aug build with no issue.

dsunanda

[19:37](#msg631f8a7905ad4a3701ea27c3)@hiiamboris Confirmed.  
Using your "rate" version (Git hub #5208), older versions will crash, but may live for 100+ interations before crashing.  
So it's an old bug that is growing stronger :)

greggirwin

[19:38](#msg631f8ac87ccf6b6d45d06096)Mutating.

[19:40](#msg631f8b3b05ad4a3701ea2908)Indeed. Boris' code crashes things nicely.

pekr

[19:42](#msg631f8bb33a42316d33e97429)My fresh console died in 3 clicks ....

## Tuesday 13th September, 2022

dsunanda

[05:06](#msg63200fd5f4d7a323decdd926)Wow - Fixed already! https://github.com/red/red/issues/5208 (and available in the 2022-09-13 build). Thanks all!

greggirwin

[06:23](#msg632021e4999499629360efcf)Go @qtxie , go!

Oldes

[16:00](#msg6320a92a6837563d1cd0c5a1)Is this know?

```
a: 0.1 + 0.1 + 0.1   b: 0.3
; than:
equal? a b ;== true as expected
; but:
lesser-or-equal? a b ;== false ?!
```

hiiamboris

[16:02](#msg6320a9856837563d1cd0c65a)yes, it's an FP precision issue

[16:02](#msg6320a9b0647d633cf61b905b)

```
>> a: 0.1 + 0.1 + 0.1   b: 0.3
== 0.3
>> strict-equal? a b
== false
```

Oldes

[16:16](#msg6320acf9cf6cfd27af887c17)`strict-equal?` is not related to it. At least if the equality check in `lesser-or-equal?` is not supposed to be `strict-equal` as well.

[16:17](#msg6320ad219994996293620b54)Currently it should be called `lesser-or-strict-equal?`

hiiamboris

[16:24](#msg6320aea07ccf6b6d45d29db0)I guess so. But what do you propose? Fuzzy `lesser-or-equal?` and `greater-or-equal?`? Then you'll open another trap: both `lesser-or-equal?` and `greater?` could return true at for the same value.

[16:24](#msg6320aec6f4d7a323decf16e0)Or removing fuzziness from `equal?` ? :)

greggirwin

[17:33](#msg6320bedb458f823ce07f526e)Another good topic for the language spec. It's easy to explain, but not necessarily intuitive. We also have to weigh completeness and practical use. That's where the design falls now, though it isn't documented. By this I mean that comparisons for equality are likely used in different ways than their lesser/greater counterparts. Here it makes sense to nearness for the common case, while allowing a strict alternative, as doing it the other way around would be awkward. It does mean there are gaps in consistency however. @meijeru may have thoughts here.

My gut instinct is that the `lesser/greater+-or-equal?` should be relaxed, as this makes things consistent. It does mean a different gap in logic, and we have to ask if that needs to be filled. We don't have to do it until someone complains, and that can also be worked around for those rare cases. While still awkward, those cases should be much rarer.

[17:35](#msg6320bf7d6837563d1cd0f4d7)I started a \[wiki page](https://github.com/red/red/wiki/Language-Spec-Notes) for spec topics.

Oldes

[17:37](#msg6320bfd005ad4a3701ec8bb5)@hiiamboris I propose:

```
a: 0.1 + 0.1 + 0.1
b: 0.3
true == equal? a b
true == lesser-or-equal? a b
true == greater-or-equal? a b
true == not strict-equal? a b
true == not lesser? a b
true == not greater? a b
```

hiiamboris

[17:47](#msg6320c2219994996293623543)But how can you possibly achieve this?

[17:49](#msg6320c2b172ad51741fdbc787)

```
>> a: 1.0
== 1.0
>> b: to float! head change back tail to binary! a 1
== 1.0   ;) 1.0 + epsilon!
>> b == a
== false
>> b < a
== false
>> b > a    ;) greater? is already true
== true
```

Plus `lesser-or-equal?` will be true as well

meijeru

[17:51](#msg6320c32fd020d223d336b848)I suppose "simple" equality allows for deviation in both directions. But could we specify the deviation in the inequality tests (`<=` etc.) to be unidirectional?

hiiamboris

[17:52](#msg6320c36f3a42316d33ebdfca)It will be the same as today (no deviation).

greggirwin

[17:53](#msg6320c398d020d223d336b903)&gt; b: to float! head change back tail to binary! a 1

What is the use case there @hiiamboris ?

hiiamboris

[17:53](#msg6320c3b2d020d223d336b916)Sorry, where?

[17:54](#msg6320c3c6f4d7a323decf4244)I just created a next (nearest) possible float number.

[17:55](#msg6320c404b16e8236e3765e5b)

```
>> to binary! a
== #{3FF0000000000000}
>> to binary! b
== #{3FF0000000000001}
```

[17:56](#msg6320c440f4d7a323decf42eb)I should have used `add` or something :)

greggirwin

[17:56](#msg6320c4429d3c186299fcea21)I mean, where would you modify binary data and make it back into a float, but it sounds like you don't do that in real life.

hiiamboris

[17:56](#msg6320c4593a42316d33ebe21a)Look above. Oldes does the same, just in a random way.

[17:57](#msg6320c48b6837563d1cd0fea2)

```
>> to binary! 0.3
== #{3FD3333333333333}
>> to binary! 0.1 + 0.1 + 0.1
== #{3FD3333333333334}
```

greggirwin

[17:58](#msg6320c4c43a42316d33ebe329)He's just doing math. I seriously thought you used that kind of thing in your code somewhere.

hiiamboris

[18:00](#msg6320c54605ad4a3701ec96a0)Ah. No ;)

meijeru

[18:02](#msg6320c5a272ad51741fdbce85)Another thought: the problem does not occur with `<=` and `>=` because almost equal numbers will satisfy both, provided their near equality is tested first. But in testing `<` one could also perhaps first test `=` (with deviation allowed) and if that is true, `<` will be false; i it is not true, only then `<` will be tested.

greggirwin

[18:02](#msg6320c5c1b16e8236e37660bc)I think unidirectional deviation (as I understand it) would be confusing. I think we need to treat the epsilonic deviation consistently in either direction.

[18:04](#msg6320c6297ccf6b6d45d2cf55)@meijeru the example case shows the `<=` problem.

```
>> a = b
== true
>> a <= b
== false
```

Because `=` is relaxed but `<=` isn't.

[18:05](#msg6320c6556837563d1cd102a7)I agree on how it could work internally using your logic, which I think matches what I proposed.

meijeru

[18:06](#msg6320c6a311a6a83d04b223e8)It implies double testing instead of relying on single machine instructions, I suppose, so a penalty in execution time and more complicated code generation.

greggirwin

[18:15](#msg6320c8cd11a6a83d04b227c9)Indeed. So then we ask, practically, what is most important for floats, which are known to be inaccurate, and what are the main use cases where you might use `<=/>=` that people need to be aware of. Is it \*enough* to warn them? I'd still love, if we can link static bits in the future, to try dropping in Crockford's ASM-sourced DEC64 for `decimal!` use, to see how it fares in real use. Nothing is perfect, but having different rules for different numeric types is a recipe for human error...on top of FP errors. :^)

hiiamboris

[18:20](#msg6320ca0772ad51741fdbd6e6)We're talking Red level here. Not machine instructions.

[18:22](#msg6320ca50647d633cf61bd51b)So no noticeable penalty. But! This will lead to alternate versions of all `<= < > >=` operators (or at least functions). It will be a bigger mess than just `= ==`

greggirwin

[18:24](#msg6320cade458f823ce07f6a8a)It doesn't lead to alternate version for me. It leads to extra work, as @meijeru noted, if people need to check those strictly.

[18:25](#msg6320cb0472ad51741fdbd8fc)i.e. it puts that on the user.

hiiamboris

[18:25](#msg6320cb28d020d223d336c768)So, instead of `a >= b` we'll write `to logic! any [a == b a > b]`, nice, especially for library code ;)

[18:37](#msg6320cdfc9994996293624c87)`<=~ >=~ >~` can be made ops for anyone willing to use these. `<~` unfortunately opens a tag.

greggirwin

[18:38](#msg6320ce337ccf6b6d45d2dfe9)Yes, which should be rare, but also easily wrapped. At which point you'll complain about performance and I'll say "R2 didn't even have floats, so there was no problem." ...

So, let's start with use cases. Anybody ever have a problem with this in real life?

meijeru

[18:39](#msg6320ce66f4d7a323decf5919)No, we will not need to write the double test in Red, it can be taken care of in the compiler/interpreter, can't it?

hiiamboris

[18:40](#msg6320ce9a7ccf6b6d45d2e0ae)What if you don't want fuzziness? We're back to double the operators set.

meijeru

[18:41](#msg6320cecb3a42316d33ebf6ab)With floats you will have to accept fuzzyness. If you don't want then indeed you have to double test in Red.

greggirwin

[18:41](#msg6320ced6b16e8236e3767277)It could, yes, which was my original thought as well, but then Boris said "no machine code", and it \*can* be solved at the mezz level. I'm fine with that, but also think we should relax things, which still means R/S work here.

&gt; What if you don't want fuzziness?

Don't use floats. :^)

hiiamboris

[18:42](#msg6320cf1aaa091774290a29ef)My hunch: this will ruin most of the math code ;)

[18:43](#msg6320cf5dd020d223d336d138)Besides, not Red problem. Proponents should find a language where this is implemented and see how that fared ;)

[18:45](#msg6320cfb26837563d1cd113b0)(I can almost see Nenad coming and saying "let's remove fuzziness from equality to make everyone happy" :)

greggirwin

[21:30](#msg6320f65bcf6cfd27af8915b6)We can do that for floats once we have a true decimal type.

hiiamboris

[21:37](#msg6320f833458f823ce07fc43b)I don't share the enthusiasm about decimal type. It's good for formatting numbers, scanning, for multiplying by powers of ten, but most floats will be results of some computations, so why should it matter.

greggirwin

[21:46](#msg6320fa4c6837563d1cd16531)Ummmmm...correctness and human reasoning? The very argument we're having now, because `.1 + .1 + .1 <> .3`.

[21:48](#msg6320fab7647d633cf61c342d)If you use strict floats at all times that is.

[21:52](#msg6320fba69d3c186299fd5aa5)And why I feel relaxing things is better for the other ops. Which also brings us back to use cases. When and where do you care about strictness with floats, given their behavior in general?

[21:58](#msg6320fd19d020d223d3373298)On the URL topic @gurzgri posted. It's easy to change. We don't have full URL parser tests in the codebase, but I have a suite here from when it was built. I based it on the RFC, but got the `opt port` part wrong.

My tests are based on round-tripping, which doesn't work if ports are optional.

```
Expected: foo://example.com:/over/there?# 
Got: foo://example.com/over/there?#

Expected: telnet://192.0.2.16:/ 
Got: telnet://192.0.2.16/
```

Notes I just made:

```
§3.2.3 says "URI producers and normalizers should omit the port 
component and its ":" delimiter if port is empty or if its 
value would be the same as that of the scheme's default."
 We don't have defaults for schemes, so will only worry about
 the missing port case. That makes round-tripping lossy, as the
 ":" will go away if no port is specified. The alternative is to
 include the colon but still omit the port. Since it still meets
 the RFC spec for the URL grammar, and we aren't technically a
 normalizer, that seems best. But it's problematic as we don't
 have a reference URL, so can't know if it was included to start.
```

hiiamboris

[22:22](#msg6321029e999499629362acab)&gt; When and where do you care about strictness with floats, given their behavior in general?

Everytime I'm choosing between `<` and `<=` I care about strictness, even though it's just one unlikely value of difference. Sorry but this is not serious proposal at all. You are for example suggesting that `1e-20 <= 1e-300` and `1e-20 >= 1e-300` at the same time. Or that `1e-20` is not `positive?` nor `negative?` number, but `zero?`. So `1 / 1e-20` should also be not negative not positive, but infinite (of undetermined sign, so maybe a NaN?). And so on.

greggirwin

[22:43](#msg632107759d3c186299fd70b4)Did I propose anything like that? No, I didn't.

[22:43](#msg6321079b443b7927a7117020)&gt; Everytime I'm choosing between &lt; and &lt;= I care about strictness,

Not a use case.

## Wednesday 14th September, 2022

hiiamboris

[07:35](#msg6321842ecf6cfd27af8a1652)What are the use cases for fuzziness?

[07:36](#msg6321847d6837563d1cd25643)I recently used float equality in an assertion. But 1e-10 precision wasn't enough, so I lowered it to 1e-6. So `=` just doesn't work.

[07:37](#msg632184a472ad51741fdd3d1c)In quick-test you have `assertf~=` function, with about the same tolerance, not equality.

[07:37](#msg632184c0b16e8236e377ca3c)In base-self-test I'm changing tolerance on case by case basis, usually from 1% to 10%.

[11:19](#msg6321b8de647d633cf61d965b)Should this be an overflow error, @dockimbel?

```
>> as-pair 4e9 3e9
== -2147483648x-2147483648
```

dockimbel

[11:36](#msg6321bca4647d633cf61d9d6f)No need, `pair!` type is in a transition state, until we decide if/how to support floats in pairs (or in a new datatype).

[11:38](#msg6321bd38458f823ce08137d4)&gt; (I can almost see Nenad coming and saying "let's remove fuzziness from equality to make everyone happy" :)

Could be an option, but the core issue is that we don't have an exact `decimal!` datatype. I'm very sceptical of DEC64 after seeing the horrifying math issues with DEC32. There's a good reason no language adopted that format for his number type.

hiiamboris

[11:44](#msg6321be9eb16e8236e378433f)Have a link to these issues?

greggirwin

[18:07](#msg6322187072ad51741fde78a9)&gt; What are the use cases for fuzziness?

Exactly what we've been talking about, and my comment about correctness and reasoning. So the use cases are everywhere a base-10 human has to reason about a result, or where FP errors occur. I'm biased against floats largely because of where and how the implementation leaks out and affects humans. I'll tell you my favorite float story sometime. Floats, like some other things in software exist only for, and because of, machines. They are not fit for humans, because we \*can't* reason about their behavior and thus use them incorrectly.

https://randomascii.wordpress.com/2012/02/25/comparing-floating-point-numbers-2012-edition/ (A couple of the things it links to are fun reads)

Can we keep them for internal use, for performance and compatibility reasons? Sure. I have no problem with that. Am I glad they're called `float!` and not `decimal!`. Yes! But let's make people \*choose* to use them, and offer something better.

hiiamboris

[18:10](#msg63221919443b7927a7138141)&gt; Exactly what we've been talking about, and my comment about correctness and reasoning

But typing constants in console is not a use case. I mean do you have code that would benefit?

greggirwin

[18:25](#msg63221c8305ad4a3701ef5fd7)It absolutely \*is* a use case. Consider new programmers. You type something into a Red console and it appears that it can't even do basic math correctly. Now you have to learn about FP and believe us when we say "It's not our fault!" The closest related Red use case I have is %math-lab, where I considered if the args fields should support evaluation. I planned to have extra help, which may all get subsumed in %dict-doc and other tooling. Here we have to explain it.

My historical bias comes from working on financial apps, where amortization calculations and such were subject to FP drift which had to be accounted for. In Red we have `money!`, but `percent!` is a float under the hood.

## Wednesday 21st September, 2022

GiuseppeChillemi

[23:47](#msg632ba2a272ad51741ff0fd2c)

```
>> help layout
Func spec couldn't be parsed, may be malformed.
```

Is this know?

## Thursday 22nd September, 2022

hiiamboris

[07:58](#msg632c15907ccf6b6d45e8cc7c)update

## Saturday 15th October, 2022

luce80

[13:53](#msg634abb5b21df5f7a54a193f5)This is same as R2 (!) but should give an error IMHO:

```
>> -1x-
== -1x0
```

hiiamboris

[14:00](#msg634abd13f00b697fec42304c)agreed, make an issue

## Thursday 20th October, 2022

dsunanda

[18:09](#msg63518eecbad3c73752e59d7f)This breaks the layout parser:

```
unview/all view/no-wait [
      rich-text 100x100 data [
          font 9  i "" /i /font
          ]]
*** Script Error: f has no value
*** Where: either
*** Near : f
*** Stack: view layout fetch-options rtd-layout pop cause-error
```

I think it may be a fairly recent regression.  
Workaround: don't have empty strings :)

greggirwin

[18:21](#msg635191adaa210536d61e3bf2)I went back over a year and it's still there, so not a recent regression.

dsunanda

[18:50](#msg63519872a3ccb16cbe199f7d)Thanks....I've just started seeing it; maybe I've not been emitting null strings before.

## Friday 21st October, 2022

dockimbel

[11:22](#msg635280e55b0dbc04b893a882)@dsunanda Please open a ticket for it.

hiiamboris

[11:28](#msg6352825721df5f7a54b00ed8)I think Qingtian fixed it 3 hours ago :)

dsunanda

[13:18](#msg63529c1821df5f7a54b03f0c)@hiiamboris Not seeing it fixed in the current windows download. Does that take a few hours to update?

hiiamboris

[13:19](#msg63529c47f3e9f037584cf73a)Ah, different branch https://github.com/red/red/commit/ef3849d332dfb5dd0492762d776a6e302c108944

[13:19](#msg63529c4fcf41c67a5cbfe348)Maybe incomplete?

dsunanda

[13:47](#msg6352a2f688e38704c020e8ed)Thanks....I'll report it per Nenad's request.....#5231

## Saturday 22nd October, 2022

qtxie

[06:50](#msg635392bdbad3c73752e93d55)&gt; I think Qingtian fixed it 3 hours ago :)

I'm not sure if the fix is complete. I made a PR so @dockimbel can review it.

dockimbel

[11:32](#msg6353d4b3880fe76caa0812cb)Ah, too bad I didn't see your PR in time. I've pushed a fix too, but yours is better. I'll rollback my changes.

dsunanda

[19:45](#msg63544872cd9a8436d12c554c)@qtxie @dockimbel #5231 looks fixed. Thanks for the fast work!

## Sunday 23th October, 2022

dockimbel

[11:25](#msg635524a09ee3ec22b4d7451e)@dsunanda You're welcome!

## Friday 11st November, 2022

hiiamboris

[16:27](#msg636e77d4473cf96648df3341)@dockimbel this seems surprising:

```
>> f: function [w] [a: 1 b: 2  get select #(x a y b) w]
>> f 'x
*** Script Error: a has no value
*** Where: get
*** Near : get select #(x: a y: b) w
*** Stack: f
```

toomasv

[20:32](#msg636eb15b4fee72663c6f4985)Funny

```
>> f: function [w] [a: 1 b: 2  get select to map! [x a y b] w]
>> f 'x
== 1
```

dockimbel

[21:21](#msg636ebcf025ca105c88b079d6)Words in maps are not bound to local contexts, you have to bind them explicitly when needed:

```
>> f: function [w] [a: 1 b: 2 get bind select #(x a y b) w :f]
== func [w /local a b][a: 1 b: 2 get bind select #(
    x: a
    y: b
) w :f]
>> f 'x
== 1
```

hiiamboris

[21:23](#msg636ebd6a15a3885c70e8737b)What's the reason?

dockimbel

[21:24](#msg636ebda0a34b51121127ff98)`map!` is not a data-structure primarily used for representing code to evaluate, so it does not get automatically bound to local contexts like for `any-block!` series.

## Sunday 13th November, 2022

greggirwin

[18:47](#msg63713bd4bcdb0060b81dea6b)Would someone like to add that to the Guru Meditations wiki page?

## Tuesday 15th November, 2022

dsunanda

[20:28](#msg6373f6850513b562e8b0ce44)Is it reasonable to expect this to work?

```
save/as "" system 'redbin
*** Access Error: cannot decode or encode (no codec): routine ["Internal Use Only"][bool: as red-logic! stack/arguments bool/header: T
```

greggirwin

[20:37](#msg6373f86ebcdb0060b822ecdf)No, because strings are UTF-8 and redbin is binary. That issue aside, redbin can't currently encode every value (type). Offhand I don't know what it's tripping over in `system`.

## Wednesday 16th November, 2022

endo64

[09:51](#msg6374b299f9491f62c9b765d6)About `decode-url`:

1\. It accepts `string!` but always return `none`: `>> decode-url "http://example.com" ; == none` (regression?)  
2\. `decode-url` directly calls `parse-url` which has `throw-error` refinement, wouldn't be nice to have that refinement on `decode-url`?

greggirwin

[20:05](#msg637542a64fee72663c7b4119)1. Doesn't appear to be a regression, just a bug that's always been there. `parse-url` molds the arg, whether it's a string or not. `mold` is there because `form` doesn't hex-encode URLs, but if it's given a string, can we all agree that it's on the user to ensure they are hex-encoded, or do we drop string support?

2\. `decode-url` is meant to be higher level, and exists mainly as a name to balance `encode-url`, so I don't think we need to expose the refinement there. Do you have a specific use case where that seems better than using `parse-url` directly?

## Monday 21st November, 2022

endo64

[07:43](#msg637b2c0518f21c023bc06377)&gt; Do you have a specific use case where that seems better than using parse-url directly?

No, actually I could use `parse-url` directly.

It looks correct to remove `string!` support from `parse-url`, but would be ok to keep it in `decode-url` high level function. And instead of `mold`, `to url!` can be used if the argument is a `string!`.

greggirwin

[17:36](#msg637bb71118f21c023bc16b58)I agree. Does anybody have a reason to keep string support in `parse-url`?

## Tuesday 22nd November, 2022

meijeru

[13:24](#msg637ccd730513b562e8c0acd5)It seems that an `area` face that has `enabled?` set to `false` does not allow scrolling. I use such a face to display search results and I don't want the user to modify these, but when there are more results than fit in the visible area, I want the user to be able to scroll down. Do we have a bug or a feature here?

[14:32](#msg637cdd75ff5546644b57eb17)Also, does the VID keyword `middle` work? I can't see it working on text in a `field` face.

hiiamboris

[14:35](#msg637cde16655bc46025db5aa2)`field` is a single line edit box, it's not supposed to support vertical alignment

[14:37](#msg637cde9225ca105c88ca099a)as for `area` we should ask @qtxie if it's even possible to scroll a disabled control

[14:38](#msg637cdecbff5546644b57edc4)even if it is, I don't think it's a good thing to do - one should use a `text` in a scrollable panel instead

[14:40](#msg637cdf584fee72663c88d8a1)`text` is dumb though, I can't seem to make it autosize itself properly

[14:42](#msg637cdfcef9491f62c9c61aaa)https://github.com/red/red/issues/3861

meijeru

[15:59](#msg637cf1f1426f9311ffb82990)@hiiamboris With default sizes for font-height and field height, I find the text aligned to the top, which is not nice.

hiiamboris

[16:01](#msg637cf24bb1a7596436830eb8)my default: !\[](https://i.gyazo.com/bbb10e9b42935fd0a07953073b1e656a.png)

[16:01](#msg637cf24f18f21c023bc39f17)what's yours?

[16:01](#msg637cf260bcdb0060b8330af3)`view [field "abcd"]`

[16:02](#msg637cf2984fee72663c88fe5c)seems very much centered !\[](https://i.gyazo.com/33428349a7656cec632a57377cdce742.png)

meijeru

[16:09](#msg637cf432f9491f62c9c642c1)\[!\[Screenshot\_20221122\_170607.png](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/HUDP/thumb/Screenshot\_20221122\_170607.png)](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/HUDP/Screenshot\_20221122\_170607.png)

hiiamboris

[16:10](#msg637cf462426f9311ffb82df7)yeah not nice, you should report it

meijeru

[16:10](#msg637cf46af9491f62c9c6431c)This is mine. It is definitely not centered.

[17:34](#msg637d082cabfb5860bb2a2e6f)For the record: issue #5242.

## Wednesday 23th November, 2022

qtxie

[03:44](#msg637d9734ff5546644b593af3)&gt; if it's even possible to scroll a disabled control

@hiiamboris There is a ES\_READONLY flag. We can give it a try. https://learn.microsoft.com/en-us/windows/win32/controls/em-setreadonly

[03:50](#msg637d988bb1a7596436843d94)@meijeru Height 23 should be the standard height. I changed it in the latest commit.

meijeru

[12:21](#msg637e104715a3885c7003e760)The fix works for the standard font but not for e.g. Courier New.

hiiamboris

[16:17](#msg637e47a3426f9311ffbaa416)

```
txt: " this text^/should be^/ readable"
img: draw 70x70 drw: compose [text 8x10 (txt)]
view [image 70x70 draw drw image 70x70 with [image: img]]
```

we have some rather crappy image scaling @qtxie  
!\[](https://i.gyazo.com/656b2aed216133ac752e15e63f6195d0.png)

[16:20](#msg637e483af9491f62c9c8ae38)I guess it's even worse for 200% scaling users (I got 150%)

## Thursday 1st December, 2022

hiiamboris

[17:23](#msg6388e32ef9491f62c9dc2ebd)

```
>> to-image rtd-layout ["a"]
== none
```

Shouldn't this work without `view` and produce an image?

dockimbel

[17:30](#msg6388e4a6426f9311ffce2031)Currently, the rich-text sub-system interface is a face! object of type `rich-text`, so it can't work without View. We could maybe in the future isolate that API, so that it could be used without View, as we do for images.

hiiamboris

[17:36](#msg6388e634b1a759643698f0c5)But I mean, it's okay to require the View subsystem, but clearly it should work without actually displaying the face. Currently I just work around by `draw size-text r: rtd-layout ["a"] compose [text 0x0 (r)]` but seems like extra work.

[17:44](#msg6388e813473cf966480f4a85)Although I guess I will have to use this workaround anyway, because `to-image` will use face's size rather than `size-text`...

[17:45](#msg6388e8222cb657024051dd4f)Still, doesn't explain why it should return `none`.

dockimbel

[19:38](#msg638902a6b1a7596436992b39)@qtxie ^---

## Friday 2nd December, 2022

qtxie

[02:38](#msg6389653625ca105c88e12bcc)&gt;

```
> >> to-image rtd-layout ["a"]
> == none
>
```

&gt; Shouldn't this work without `view` and produce an image?

`rich-text` use D2D to draw the content. While the OS API used in `to-image` only works on native controls. I'll see how to support it.

## Saturday 3th December, 2022

luce80

[17:35](#msg638b88c7f0973a41eb24a39a)@hiiamboris Very nice trick. It's right on time ! ;) but what does it happen here ? :( . This "closes" Red.  
`draw size-text r: rtd-layout [ red "a" ] compose [text 0x0 (r)]`

hiiamboris

[17:48](#msg638b8bdbaaf0965f7c71b928)report it

## Sunday 4th December, 2022

ldci

[10:29](#msg638c76852305cb4ed70aa830)There is problem with change-dir under windows11

```
Red [
]
home: select list-env "HOME"
home: select list-env "USERPROFILE"
appDir: to-file rejoin [home "/Programmation/Red/BabyCry/code/"]
print ["App Dir: " appDir]
change-dir %..
print pwd 
change-dir appDir
```

[10:29](#msg638c76a73f353f70807f79f3)

```
*** Access Error: cannot open: %"/C/Users/fjouen/Programmation/C:\Users\fjouen/Programmation/Red/BabyCry/code/"
*** Where: do
*** Near : print pwd change-dir appDir
*** Stack: change-dir cause-error
```

hiiamboris

[10:40](#msg638c791f85045441f8b0359b)use `to-red-file` to convert filenames to an interchangeable representation

ldci

[10:44](#msg638c7a0185045441f8b0367c)@hiiamboris Thanks:)

## Monday 5th December, 2022

hiiamboris

[17:17](#msg638e27b34cb5585f9666500d)@dockimbel looks like a bug?

```
>> parse [1] [opt (print "here")]
== false
```

## Sunday 11st December, 2022

hiiamboris

[15:59](#msg6395fe6f967c8305842bd41c)Maps have this annoying feature of turning words into set-words upon iteration:

```
>> m: #(a b)
== #(
    a: b
)
>> keys-of m
== [a]
>> foreach [k v] m [?? k]
k: a:
```

I find myself constantly tripping on it and having to convert explicitly. Can we fix it?

## Monday 12nd December, 2022

greggirwin

[03:51](#msg6396a53ea8211f623d7b676c)What do you then do with the set word that causes a problem? I know they're not 100% compatible, but Red is much nicer about allowing set-words with some functions.

hiiamboris

[09:03](#msg6396ee55b9b68753418ea3e5)E.g. in switch that is bound to fail.

[09:04](#msg6396ee948bdea01368b0c721)But why even have set-words when map keys most likely are actually words. You don't access them as `m/(quote a:)` after all.

greggirwin

[18:36](#msg639774a23daaa326ba7fdd0b)\*Why* is the proper question. It is by design and documented:

&gt; If the key is of any-word! type, the key type is converted to set-word! in the map, in order to make the map content look more like pairs of keys with value assigned.

So it's consistent with blocks. e.g. if you make a block from a map you'll get the same behavior.

## Wednesday 14th December, 2022

dsunanda

[13:48](#msg6399d43407ac190597f19407)I know `index? is only defined on series .... So would it not be better to throw an error when used on a map, rather than the current odd behavior?`  
index? find make map! #('a 1 'b 2 'c 3) 'a  
\== 488  
\`

hiiamboris

[14:20](#msg6399db96a8211f623d81a597)it's by design here

[14:20](#msg6399dba489c38775e75fbb74)`index? word` returns word's offset in the object where it's bound

[14:20](#msg6399dbbab9b687534194554c)

```
>> index? 'x
== 360
```

## Thursday 15th December, 2022

hiiamboris

[13:13](#msg639b1d948bdea01368b8c639)

```
view [rich-text "abcdefghij" data [3x4 bold 5x4 underline]]
```

!\[](https://i.gyazo.com/381c52f20f5c86c27ce1f3c091359f98.png)

[13:14](#msg639b1d9f07ac190597f3feb3)

```
>> view [rich-text data ["ab" b "cd" u "ef" /b "gh" /u "ij"]]
*** Script Error: RTD - invalid syntax at: [/b "gh" /u "ij"]
*** Where: do
*** Near : spec: fetch-options face opts style spec 
*** Stack: view layout fetch-options rtd-layout cause-error
```

[13:14](#msg639b1db0a8211f623d8403e0)Should high-level dialect also allow non-stack-like behavior?

dsunanda

[13:54](#msg639b2710967c830584358eb7)In an ideal world, no.  
In the world we live in, browers will correctly render badly nested HTML, so if Red needs the ability to convert sloppy HTML to rich-text, then yes. But would thsat be a priority?

hiiamboris

[14:02](#msg639b290c2b937b1a2ec12fb3)Not a priority, just something to note for the future if we decide so.

[14:17](#msg639b2c79865cc926ae609f9f)Should this be considered bad practice in HTML though to write like this, @dsunanda ?

dsunanda

[16:02](#msg639b450d83b5463b6e047036)Browsers embody the 2nd half of Postel's law: "be conservative in what you send, be liberal in what you accept" ..... Which, sadly, enables a billion bad apps to ignore the 1st half.

hiiamboris

[16:21](#msg639b499207ac190597f456ec)I'm asking because I don't see anything bad about this.  
Consider this perfectly normal workflow:  
!\[](https://i.gyazo.com/08055c2ffc10fd61a1022636e117a7e6.gif)  
How its result should be encoded in HTML? As `ab cd ef gh`? It looks like an unnecessary complication to me.

[16:23](#msg639b49ed8bdea01368b91b0d)That is, I don't see anything wrong here. And I don't know if HTML spec speaks against it or not.

[16:24](#msg639b4a29865cc926ae60db3f)I'd ask google, but have hard time formulating the query ATM ;)

[16:26](#msg639b4ab6a151003b5a6dceff)IMO it's a fundamental mistake of HTML to encode both text attributes and document tree structure using tags. Tree nodes cannot intersect, while attributes can.

Oldes

[16:34](#msg639b4ca3967c83058435d9f5)Nesting is not valid... you may check it here: https://validator.w3.org/#validate\_by\_input

hiiamboris

[16:37](#msg639b4d4f8bdea01368b92243)Thanks

greggirwin

[16:39](#msg639b4db2967c83058435dc1b)I don't think we should accept sloppiness and bad input, that's just perpetuating the problem. If we want to follow Postel, that means emitting good HTML (potentially), and we can't do that consistently with sloppy input.

hiiamboris

[16:41](#msg639b4e412b937b1a2ec17b32)But as a human what would you write, simple version or nested version?

Oldes

[16:42](#msg639b4e6da8211f623d8469c1)Simple

hiiamboris

[16:42](#msg639b4e8a967c83058435de41)That's what I would do too.

greggirwin

[17:01](#msg639b52e24a6ed513835b646c)Simple, I imagine, but it should catch errors as it does. However, I expect most content will be generated with tools. Devs will still write templates and pieces by hand, but not full documents.

[17:02](#msg639b5331967c83058435e745)So there the nested version is much nicer for processing. It's not as human friendly in very short content, but once things grow matching tags isn't friendly either.

## Friday 16th December, 2022

hiiamboris

[15:34](#msg639c900083b5463b6e06db98)@dockimbel what do you think?

[15:35](#msg639c9030dbde086250e777ef)And on another topic:

```
>> parse [1 a] [collect [keep set x integer! (?? x) keep set x opt integer! (?? x)]]
x: 1
x: none
== [1]
```

Should second `keep` collect `none` instead of the empty block?

[15:36](#msg639c908d2b937b1a2ec3c99b)Though `keep` is block oriented, so maybe not.

rgchris

[20:10](#msg639cd0b92b937b1a2ec44ba0)@dsunanda @hiiamboris HTML 5 is prescriptive in how any given character sequence is converted into a tree and is consistent across all implementations. This particular case: `AB CD EF GH` is handled by the Adoption Agency Algorithm which would, as speculated, resolve to `AB CD EF GH`.

hiiamboris

[21:01](#msg639cdc8f2b937b1a2ec4627b)Good to know, thanks @rgchris  
Do you think there's actually some benefit for text attributes to be tree nodes just like the document structure, or is it merely an artifact of syntax derived from SGML?

rgchris

[21:19](#msg639ce0fbb9b687534199fc52)Do you mean text formatting? How would you propose it be handled?

hiiamboris

[21:51](#msg639ce86bdbde086250e821cd)Bold, italic, underline, strikethru, link target, font size, font face, cursor type - all these attributes can in theory intersect with one another. Designers could have used different syntax for them, that would not require them to become tree nodes, but rather become ranges internally, like our rich-text dialect handles `[2x7 bold italic]` and so on.

rgchris

[23:34](#msg639d0073967c83058439182f)Perhaps, though arguably in HTML those aren't formatting elements, rather part of the document structure as well. For example, the **tag \[is described as](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-b-element) \_"The b element represents a span of text to which attention is being drawn for utilitarian purposes without conveying any extra importance and with no implication of an alternate voice or mood, such as key words in a document abstract, product names in a review, actionable words in interactive text-driven software, or an article lede."\_**

**[23:36](#msg639d00f4a8211f623d879321)The mechanism for making that span darker than other text is a separate concern (aka. style sheets)**

**[23:45](#msg639d032969ce3c53382f8f07)(and since I used *above \_"\[The i element](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-i-element) represents a span of text in an alternate voice or mood, or otherwise offset from the normal prose in a manner indicating a different quality of text, such as a taxonomic designation, a technical term, an idiomatic phrase from another language, transliteration, a thought, or a ship name in Western texts."_ 🙂)***

***[23:51](#msg639d0493a151003b5a71004f)I've made the argument prior that View should similarly define UIs semantically and apply style separately. It doesn't always fit (same with HTML—particularly when using it to describe the elements of 'Web Apps') but there's a versatility to it.***

*****Saturday 17th December, 2022*****

***hiiamboris***

***[09:27](#msg639d8b6ea1ba3e75d8ff1fa9)That's how I approached it as well.***

***[09:28](#msg639d8bbfb9b68753419b2768)Thanks for the info. So they see it as a structure by design.***

***dsunanda***

***[10:35](#msg639d9b7169ce3c5338308d23)@rgchris Thanks. Prior to HTML 5, browsers (etc) did their own thing, with a top priority being to make a webpage render, no matter how badly formed the HMTL tags were.***  
***In contrast, XML insisted from day 1 that the only acceptable XML is fully correct XML.***  
***Some say that hindered the adoption of XML. On another hand, maybe it helped attract disciplined developers.***

*****Wednesday 21st December, 2022*****

***mikeyaunish***

***[02:00](#msg63a268b563c9fc72d3edcd61)Trying to track down what is crashing Red when I run my interpreted program. Is there a trace log I can turn on before the crash?***

***hiiamboris***

***[10:47](#msg63a2e4358f8df4262ab6df10)compile your console with `-d` option***

***[10:48](#msg63a2e496fb195421bd49e7fc)using instructions \[here](https://github.com/red/red/#running-red-from-the-sources-for-contributors), or \[this tool](https://gitlab.com/hiiamboris/red-cli/-/tree/master/mockups/redbuild)***

***[10:50](#msg63a2e4ed0cd40c2e899bd624)or compile your script with `-r -e -d` flags and run the exe***

*****Thursday 22nd December, 2022*****

***mikeyaunish***

***[15:55](#msg63a47df30cd40c2e899ee0e5)@hiiamboris I have created a debug console. Haven't used it before so not sure how to use it. I can successfully run my program and crash it.***

***hiiamboris***

***[15:58](#msg63a47e977de82d2616f33d68)just `do` your script or pass it as an argument to console exe***

***[15:58](#msg63a47ea5ff1fd121b30d2f66)crash it and see the output if that helps***

***mikeyaunish***

***[16:09](#msg63a4813e8f8df4262ab9f27f)Crash looks like this:***  
***`*** Runtime Error 1: access violation *** in file: /e/red/red/modules/view/backends/windows/gui.reds *** at line: 146 *** *** stack: gui/get-face-values 00210BBEh *** stack: gui/paint-background 00210BBEh 50011627h *** stack: gui/render-base 00210BBEh 50011627h *** stack: gui/WndProc 00210BBEh 20 1342248487 0`***

***[16:10](#msg63a48180c4fec572d64d513a)This shows up when using a tab-panel.***

***hiiamboris***

***[16:14](#msg63a4826ed8678973f9793d01)I can see from it only that `base` is involved***

***[16:15](#msg63a4828dc4fec572d64d52d8)could be some facet having an unexpected value?***

***[16:16](#msg63a482e53b37dd2c11440f45)look around this list as well: https://github.com/red/red/issues?q=is%3Aissue+is%3Aopen+gui%2Fget-face-values***

***[16:16](#msg63a482f3be2c3c20c71315cb)maybe your problem is reported already***

***[16:20](#msg63a483e9fb195421bd4cff2a)admittedly their search is brutally nonsensical though***

***mikeyaunish***

***[16:22](#msg63a4843251d2482e91d1c3bd)OK - I'll look into it.***

***[17:47](#msg63a4983dbe2c3c20c7134209)@hiiamboris this bug showed up sometime after: Red 0.6.4 for Windows built 2-Jun-2022/0:50:38-07:00 commit #671dae6***

*****Wednesday 28th December, 2022*****

***hiiamboris***

***[16:12](#msg63ac6ae4fb195421bd5ac409)This doesn't seem correct to me:***  
***`>> cs1: charset [31] >> cs1/31: off >> cs1 == make bitset! #{00000000} >> cs1 = charset [] == false`***

***[16:15](#msg63ac6ba763c9fc72d3ff7dce)Same on Oldes' R3 :(***

***[16:30](#msg63ac6f2951d2482e91df8ba4)It should either auto-trim itself (slower flipping of trailing bits) or ignore trailing zeroes (slower equality, but still better than `cs1 = make bitset! length? cs1`). `==` may still perform fast equality then. `<=` `>=` not sure.***

***[16:35](#msg63ac704e40557a3d5c4c4e5c)As it is it's half-series half-set.***

***greggirwin***

***[17:07](#msg63ac77bbc4fec572d65b2242)So, should `cs-3: make bitset!` auto-trim? I don't think so. If so, it does nothing but inefficiently. :^)***

***[17:07](#msg63ac77df51d2482e91df9c2d)The design question is whether the bitset length is part of the comparison. @dockimbel ?***

***hiiamboris***

***[17:09](#msg63ac783763c9fc72d3ff9604)It could use soft trimming to be more efficient. Track the length of non-zero part. Bitset cell has two unused slots. But flipping will still be slow, e.g. if `cs: charset [100000]` then `cs/100000: off` will have to scan all bits to determine the new (zero) length. So this only takes care of the allocations.***

***[17:11](#msg63ac78c0be2c3c20c7210362)Or it could be series, then one could just `trim` it when needed :)***

*****Friday 30th December, 2022*****

***ne1uno***

***[00:06](#msg63ae2b9d51d2482e91e2af84)&gt;&gt; 'm: make map! \[0 0 1 1 2 1]' ; Syntax Error: (line 1) invalid integer at 0 0 1 1 2 1]***

***greggirwin***

***[01:44](#msg63ae42928f8df4262acad770)***  
***`>> m: make map! [0 0 1 1 2 1] == #( 0 0 1 1 2 1 )`***  
***What does `about` tell you @ne1uno ?***

***ne1uno***

***[01:55](#msg63ae45173b37dd2c1155153e)latest view 2202 nov***  
***`>> about/debug -----------RED & PLATFORM VERSION----------- RED: [ branch: "master" tag: #v0.6.4 ahead: 4573 date: 23-Nov-2022/3:49:21 commit: #ee723a91c5007c4338b8252956063dcd668cf012 ] PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ] -------------------------------------------- >> m: make map! [0 0 1 1 2 1] *** Syntax Error: (line 1) invalid integer at 0 0 1 1 2 1] *** Where: set *** Near : transcode/trace buffer :delimiter-lex`***

***[02:00](#msg63ae4642be2c3c20c7243e89)cli too***

***[02:23](#msg63ae4b9551d2482e91e2e9fd)&gt; \** Script Error: invalid argument: \[0 1 1 2 1]***

***greggirwin***

***[02:29](#msg63ae4d13fb195421bd5e30f6)***  
***`>> about Red 0.6.4 for Windows built 29-Dec-2022/13:00:14-07:00 commit #6af0b70 >> m: make map! [0 0 1 1 2 1] == #( 0 0 1 1 2 1 )`***

***[02:30](#msg63ae4d51fb195421bd5e316e)That's a fresh local build for me. Try the latest download and see if it works.***

***ne1uno***

***[02:46](#msg63ae50f1fb195421bd5e3792)latest view stuck nov22?***

***greggirwin***

***[02:49](#msg63ae51d0378d512c183972ae)@dockimbel ?***

***ne1uno***

***[03:18](#msg63ae586ffb195421bd5e4299)same with local build just now***

***greggirwin***

***[03:18](#msg63ae588f63c9fc72d302e913)With a recent pull from source? If so, strange.***

***ne1uno***

***[03:20](#msg63ae58e3be2c3c20c7245db7)it works R3 and a 2019 build I keep for testing***

***greggirwin***

***[03:20](#msg63ae58fafb195421bd5e4365)Let's see what others report, to narrow it down.***

***ne1uno***

***[03:25](#msg63ae5a4740557a3d5c4fc179)I'm not sure what's going on now, I backspaced before the 2nd zero adding space and it works***

***greggirwin***

***[03:27](#msg63ae5ab3be2c3c20c7246114)Partial character encoding perhaps?***

***ne1uno***

***[03:30](#msg63ae5b44fb195421bd5e46cb)the cli looks like this when I paste, `m: make map! [00 1 1 2 1]` thought it was weird makes a little sense now. looks the same in view. not my first utf copy &amp; paste bug. sorry***

***[09:27](#msg63aeaf0d63c9fc72d3037858)thanks @doc @greggirwin, older chrome knockoff had to remove red-lang cookies***
