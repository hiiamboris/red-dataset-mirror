# Archived messages from: [gitter.im/red/help](/gitter.im/red/help/) from year: 2022

## Saturday 1st January, 2022

gltewalt

[23:03](#msg61d0ddab9b470f389746dc46)Why does take leave `""` with this:

```
>> b: ["one" "two" "three"]
== ["one" "two" "three"]
>> foreach i b [if find i "two" [take/part i length? i]]
== none
>> b
== ["one" "" "three"]
```

[23:06](#msg61d0de63bfe2f54b2ef971d4)But:

```
>> b: ["one" "two" "three"]
== ["one" "two" "three"]
>> take b
== "one"
>> b
== ["two" "three"]
```

[23:07](#msg61d0dea86d9ba233289ecae3)Can we not take positionally, and leave no dangling `""`?

[23:16](#msg61d0e0d02a210c38c1a9b128)Well I know `why`, but I don;t know how to take positionally

greggirwin

[23:17](#msg61d0e111742c3d4b21780320)`foreach`'s word doesn't let you access the series, use `forall` if you need that.

gltewalt

[23:30](#msg61d0e4246d9ba233289ed3fa)That doesn't seem to do it either

[23:31](#msg61d0e4419a33545406008c01)Need `take/only` to exist?

greggirwin

[23:32](#msg61d0e4aae1a1264f0a3669e9)If you want to remove based on an item's value, use `remove-each`. It's not about `/only`, but about accessing the series, and how tricky that can be when you start removing items as you traverse forward.

gltewalt

[23:35](#msg61d0e52e7842bd3ca926116b)ok

greggirwin

[23:35](#msg61d0e53a9a33545406008dd4)

```
>> b: ["one" "two" "three"]
== ["one" "two" "three"]
>> forall b [if find b/1 "two" [remove b]]
== ["three"]
>> b
== ["one" "three"]
>> 
>> 
>> b: ["one" "two" "two" "three"]
== ["one" "two" "two" "three"]
>> forall b [if find b/1 "two" [remove b]]
== none
>> b
== ["one" "two" "three"]
```

gltewalt:matrix.org

[23:52](#msg61d0e9547842bd3ca9261866)If only it removed for each match

## Sunday 2nd January, 2022

gltewalt:matrix.org

[03:53](#msg61d1219d46529077f5641e4f)Print all but last of a string? Non destructive

greggirwin

[04:19](#msg61d127e25dc6213cd4bfa70c)You're going to have to copy the string, as we don't (yet, maybe ever) have slices that define an end point before the tail of a series.

gltewalt

[06:55](#msg61d14c4c46529077f5645e14)Ok... Anyone have any idears on how to not have `""` left in the blocks ? (See comment on gist)  
https://gist.github.com/gltewalt/e68bfabacfe5747909976f0f989c1e3b

[06:57](#msg61d14cce6d9ba233289f7cf8)Have to be able to take multiple matches - the forall example above doesn't work for this, and I don't see that `remove-each` is viable. It returns unset.

rebolek

[06:59](#msg61d14d3b7842bd3ca926ba72)@gltewalt

&gt; Why does take leave "" with this:

`take` will remove values from the series. If you remove all values from a series, you are left with an empty series.

gltewalt

[06:59](#msg61d14d4f6d9ba233289f7dcd)I have to take it by elements with `take/part i length? i`, which leaves me with `""` left in the series

rebolek

[07:00](#msg61d14d7b46529077f564611c)you are taking elements from `"two"`, not from `["one" "two" "three"]`

[07:01](#msg61d14dadd143b14f83f83a79)Don't you want this instead?

```
>> b: ["one" "two" "three"]
== ["one" "two" "three"]
>> forall b [if find b/1 "two" [remove b]]
== ["three"]
>> b
== ["one" "three"]
```

[07:01](#msg61d14db79a33545406013090)or use `remove-each` as suggested

gltewalt

[07:01](#msg61d14dc6f5a3947800e54337)That won't work when you need to take more than one "two"

[07:02](#msg61d14e0782a4667b25566627)I'd use `remove-each` but it doesn't return a block of values

rebolek

[07:05](#msg61d14ea782a4667b255666e8)you can `remove/part b some-length`

[07:06](#msg61d14eed6d9ba233289f809b)but this `take/part i length? i` doesn't remove more than one `"two"` also, it removes `i` values where i is the length of the series, so in case of `two` it removes three chars.

[07:20](#msg61d1522e7842bd3ca926c164)In other words, `take/part i length? i` doesn't remove `i` it removes \*\*from\** `i`

gltewalt

[07:21](#msg61d1527c46529077f56467c1)But I need to be able to take duplicates, which it does. I know it's chomping down the elements of i

[07:21](#msg61d152887842bd3ca926c1e5)

```
>> x: ["one" "two" "three" "two"]
== ["one" "two" "three" "two"]
>> foreach i x [if find i "two" [take/part i length? i]]
== "two"
>> x
== ["one" "" "three" ""]
```

rebolek

[07:22](#msg61d152bd526fb77b315c0afd)

```
>> x: ["one" "two" "three" "two"]
== ["one" "two" "three" "two"]
>> remove-each i x [i = "two"]
>> x
== ["one" "three"]
```

gltewalt

[07:24](#msg61d1533a46529077f5646908)I would use that if it returned a block of values, but it dunna

rebolek

[07:25](#msg61d1535f9b470f38974797e3)Block of what values? Removed ones?

gltewalt

[07:25](#msg61d15364f5a3947800e54c62)yes

rebolek

[07:25](#msg61d153802a210c38c1aa6b31)but the foreach loop doesn't return such block either

gltewalt

[07:26](#msg61d153ab9a33545406013b8f)

```
get-cards: func [from-hand to-hand kind][ 
    foreach i from-hand [
        if find i kind [
            append to-hand take/part i length? i
        ]
     ]
]
```

rebolek

[07:26](#msg61d153ba7842bd3ca926c3e2)

```
>> collect [remove-each i x [all [i = "two" keep i]]]
== ["two" "two"]
```

gltewalt

[07:34](#msg61d1558af5a3947800e54f6c)So like

```
>> x: ["one" "two" "three" "two"]
== ["one" "two" "three" "two"]
>> z: []
== []
>> foreach c collect [remove-each i x [all [i = "two" keep i]]][append z c]
== ["two" "two"]
>> z
== ["two" "two"]
```

rebolek

[07:35](#msg61d155debfe2f54b2efa33ed)You can also `collect/into [code here] z`

gltewalt

[08:21](#msg61d1609e5dc6213cd4c0038d)Seems a lot nicer but it isn't transfering cards between `from-hand`, and `to-hand`.  
Time to put it down and sleep for a bit.

[08:22](#msg61d160b446529077f5647f39)Thanks for the help

hiiamboris

[11:01](#msg61d1861a5dc6213cd4c03f81)

```
>> parse x [collect any to keep "two"]
== ["two" "two"]
```

[11:06](#msg61d18725526fb77b315c620c)

```
>> sift x [s .. s = "two"]
== ["two" "two"]
```

[11:06](#msg61d1874546529077f564c070)remove-each should work too, it's just buggy

toomasv

[11:29](#msg61d18ca99a335454060195bb)@gltewalt

```
b: ["one" "two" "three" "two"]
collect [while [found: find b "two"] [keep take found]]
;== ["two" "two"]
b
;== ["one" "three"]
```

Or this?

```
b: ["hearts-one" "clubs-two" "hearts-three" "spades-two"]
collect [forall b [if find b/1 "two" [keep take b b: back b]]]
;== ["clubs-two" "spades-two"]
b
;== ["hearts-one" "hearts-three"]
```

greggirwin

[19:57](#msg61d203a2e1a1264f0a3846c5)

```
remove-each-and-count: function [
	"Like remove-each, but returns both modified series and count of removed items." 
	'word [word! block!] "Word or block of words to set each time" 
	data [series!] "The series to traverse (modified)" 
	body [block!] "Block to evaluate (return TRUE to remove)"
][
	orig-ct: length? data
	remove-each :word data body
	reduce [data  orig-ct - length? data]
]
remove-each-and-count v [1 2 3 4 5] [odd? v]
remove-each-and-count v [1 2 3 4 5 6 7 8 9 10] [odd? v]
```

[19:58](#msg61d203cb82a4667b25579f46)If you have multiple, different criteria for removing, you can't reproduce what was removed with this.

[20:02](#msg61d204e25dc6213cd4c11ebd)Another approach would be to partition. This is an old experimental version.

```
; Is . better than _ as a placeholder for the current value? It maps
; to the concept of %. as a current directory, but _ looks like an
; empty space where something goes.
filter: partition: function [
	"Returns two blocks: items that pass the test, and those that don't"
	series [series!]
	test [any-function! block!] "Test (predicate) to perform on each value; must take one arg if a function; block implied arg is named ."
	/only "Return a single block of values that pass the test"
][
	result: copy/deep [[][]]
	; Convert block test to anonymous func
	if block? :test [
		;probe test: func either arg [compose [(arg)]][[.]] test
		test: func [.] test
	]
	foreach value series [
		; `make logic!` is used, so zero test results become false.
		append/only pick result make logic! test :value :value
	]
	either only [result/1][result]
]
;red>> filter [1 2 3 4 5 6 7] :even?
;== [[2 4 6] [1 3 5 7]]
;red>> filter [1 2 3 4 5 6 7] :odd?
;== [[1 3 5 7] [2 4 6]
;red>> filter/only [1 2 3 4 5 6 7] :odd?
;== [1 3 5 7]
;red>> filter [/only /dup 3] :refinement?
;== [[/only /dup] [3]
;>> filter [1 2 3 4 5 6 7] [odd? _]
;== [[1 3 5 7] [2 4 6]]
;>> filter [[1 2] [3 4] [6 6]] [odd? ./1]
;== [[[1 2] [3 4]] [[6 6]]]
```

gltewalt

[20:29](#msg61d20b307842bd3ca927f3dc)Used second toomas example and variation.  
It works for a demo, sans the very basic A.I. part

https://gist.github.com/gltewalt/e68bfabacfe5747909976f0f989c1e3b

[20:31](#msg61d20bb5d41a5853f92efbd9)in other words, todo: A.I. and a non demo presentation, where you can't see computers cards, and the player enters a guess instead of having it random

[20:33](#msg61d20c0d82a4667b2557ad21)The no friction way in a perfect world would be `take/only/with`

hiiamboris

[20:41](#msg61d20e0982a4667b2557af5f)cards are unique, so why not `exclude`?

greggirwin

[20:43](#msg61d20e7082a4667b2557b076)I think he wants to get them (the excluded bits) back as a result.

gltewalt:matrix.org

[20:51](#msg61d210346d9ba23328a0ce14)Need a result to append to the other hand

hiiamboris

[21:01](#msg61d212a29b470f389748dfca)`difference`?

gltewalt:matrix.org

[21:01](#msg61d212ba526fb77b315d55af)Cards aren't unique because you ignore the suit when asking for cards

hiiamboris

[21:02](#msg61d212e046529077f565b538)too bad then

gltewalt:matrix.org

[21:09](#msg61d2147dd143b14f83f989d3)I'll explore set operations later, maybe re work things. For now I'm irritated

ne1uno

[21:11](#msg61d214fa5dc6213cd4c13d6c)custom sort?

gltewalt

[23:05](#msg61d22fbbe1a1264f0a389428)last edit in `red/sandbox`

## Tuesday 4th January, 2022

koba-yu

[04:25](#msg61d3cc466d9ba23328a40853)Hi, Happy New Year and thank you Red team for new features and a blog post.  
I have been away from coding and checking Red for a while, because of some illness of my family since last year but I want to keep in touch with Red.

I'm using the Red version below (might be the latest one I think),

&gt; Red 0.6.4 for Windows built 31-Dec-2021/9:47:48+09:00 commit #972994d

and trying to the code below, in order to understand the debug function;

```
test: func [a b][
	c: a + b
	print c
]
debug [test 1 2]
```

I use `:word` and `watch` command but I get the "Unknown command!" response like belw, at any time so far.

```
debug> :a
Unknown command!
debug> watch :a
Unknown command!
debug> :word
Unknown command!
```

I have some misunderstandings to use the commands?

hiiamboris

[10:19](#msg61d41f42d41a5853f932c852)Hi long time no see @koba-yu :)  
I'll let Nenad know. Can't get my head around debugger either :)

greggirwin

[19:03](#msg61d499f15ee4df335aca63b4)Nice to see you again @koba-yu! Expect dbugger improvements before too long.

## Thursday 6th January, 2022

gltewalt

[19:27](#msg61d7428546529077f5702c1c)If anybody has some spare time, and the inclination to give feedback on this, it would be appreciated and illuminating.  
https://github.com/gltewalt/go-fish

greggirwin

[20:15](#msg61d74dfd5dc6213cd4cb8e4c)Will try to look later. The fish is cute. :^)

gltewalt:matrix.org

[20:26](#msg61d75077f5a3947800f0ebbe)Grabbed that from https://openmoji.org/

greggirwin

[22:58](#msg61d774027842bd3ca932dcc5)First note: good func names, data names `chand phand fhand thand etc.` not as good. ;^)

[23:01](#msg61d774ca526fb77b3167f7d6)`0 <> length? deck` = `not empty? deck`

[23:03](#msg61d77542f5a3947800f13bee)`deck: random deck` `random` works in place on series, just in case you need the original.

[23:07](#msg61d7761b5dc6213cd4cbde83)`clear-show` wasn't clear to me on a first read.

[23:09](#msg61d77693d143b14f830455a2)Otherwise, I think it reads nicely.

gltewalt

[23:16](#msg61d7785dd143b14f830458a2)it was originally `show-and-clear`. After I had a few multi word function names, I decided to have all parameters as one word, thus.... the chand, etc

## Saturday 8th January, 2022

koba-yu

[04:43](#msg61d9168a6d9ba23328aed2f1)&gt; Hi long time no see @koba-yu :)  
&gt; I'll let Nenad know. Can't get my head around debugger either :)

&gt; Nice to see you again @koba-yu! Expect dbugger improvements before too long.

@hiiamboris @greggirwin Thank you!

[07:18](#msg61d93ac29b470f389756fa6c):point\_up: \[2022年1月4日 13:25](https://gitter.im/red/help?at=61d3cc466d9ba23328a40853)  
Latest Red binary seems fixed the command to work, thank you Nenad!

## Monday 10th January, 2022

bubnenkoff

[10:39](#msg61dc0cdef5a3947800f9afb5)Hi! Is there any progress with `http`-branch? I would like to try migrate my app to new Red version and http with timeout support is what I need

greggirwin

[17:27](#msg61dc6c9ef5a3947800fa93dc)I/O is high on our list to merge, but there is at least one bug and design issue ahead of it in the queue.

## Tuesday 11st January, 2022

chasecrum:matrix.org

[15:55](#msg61dda873526fb77b31742c10)(you'll have to forgive me - I'm day2 new newbie to Red...) I'm looking for an example block of code for a GUI menuing system that executes linux commands by selection. I'd like to looks at it's structure and pull it apart (skript kiddie style, to use a 90's throw back..) to help me learn along the way. Would anyone have a link to something like that?

hiiamboris

[16:00](#msg61dda9b8742c3d4b2190e95e)`view/options [] [menu: ["commands" ["bash" [call "bash"] "nano" [call "nano"]]]]`

chasecrum:matrix.org

[16:06](#msg61ddab155ee4df335adc990d)I'm almost certain there's more code to this, yes?

hiiamboris

[16:22](#msg61ddaec99a3354540619641b)nope :)

[16:24](#msg61ddaf3246529077f57ccbce)I haven't tested though, `call` is a little whimsical at times, might require some help

greggirwin

[18:00](#msg61ddc5dbf5a3947800fdb412)&gt; I'm almost certain there's more code to this, yes?

We get that a lot. ;^)

[18:01](#msg61ddc5f7bfe2f54b2e12798d)Very nice example @hiiamboris.

chasecrum:matrix.org

[18:03](#msg61ddc65f6d9ba23328b81ef9)In 20 years of Linux, this is rapidly becoming my favorite language, and I didn't know it existed a few days ago

greggirwin

[18:04](#msg61ddc698526fb77b31747433):^)

[18:05](#msg61ddc6d2bfe2f54b2e127bb7)Be aware, there \*are* things you'll trip over as you learn, because Red is very different. It just pretends really well, to keep you comfortable.

Enjoy the ride!

fergus4

[20:10](#msg61dde4299a3354540619e1bc)to-string to-money 3456.00 gives me "$3'456.00". Any way to give US thousand seperator: "3,456.00" - COMMA

[20:12](#msg61dde4b2bfe2f54b2e12c5f0)I can just do a replace but was wondering if there was a built in method.

greggirwin

[20:16](#msg61dde5b35dc6213cd4d89856)`format` is coming soon, but a simple replace is your best option there for now.

## Wednesday 12nd January, 2022

greggirwin

[00:12](#msg61de1d049b470f389760c60e)Is it just me, or are we completely lacking `menu` docs for VID/View?

gltewalt

[01:25](#msg61de2dfe9b470f389760e99b)https://imgur.com/a/j60xeKt

[01:25](#msg61de2e182a210c38c1c3e057)It mentions menu a few times in View docs, but at the bottom it shows that ^

[01:32](#msg61de2f96bfe2f54b2e137254)&gt; I haven't tested though, `call` is a little whimsical at times, might require some help

Doesn't work on my Mint

[01:32](#msg61de2fc382a4667b256fc71e)

```
(console-2021-12-31-2876:1940): Gtk-CRITICAL **: 18:30:38.759: gtk_menu_shell_insert: assertion 'GTK_IS_MENU_ITEM (child)' failed
```

Which may or may not impact it. There always seems to be Gtk barking

[01:33](#msg61de2fdc5dc6213cd4d93e4a)Menu functions, but nothing is "called"

[01:34](#msg61de303dd143b14f8311aaec)On second glance, it has to be the culprit

greggirwin

[04:32](#msg61de59e65ee4df335ade2d96)Well, someone noticed at some point. I'll add a ticket for it.

hiiamboris

[11:13](#msg61deb7ece1a1264f0a5185e0)okay that example actually crashes it on ubuntu :)

[11:14](#msg61deb8182a210c38c1c4e9ce)in fact, menu is more convoluted, unnecessarily so IMO:  
`view/options [] [menu: ["commands" ["bash" bash "nano" nano]] actors: object [on-menu: func [face event][call/show form event/picked]]]`

[11:15](#msg61deb83a5ee4df335adee802)but though this works on W10, on ubuntu - nothing happens (`call` returns the pid, but nothing is shown)

[11:16](#msg61deb89a46529077f57f11b6)`call/console` works - bash is shown in the terminal, which blocks Red ofc

[11:17](#msg61deb8b9f5a3947800ffb7ba)idk, maybe `call/show` is not implemented in GTK? (it was a contribution work, not really polished)

olivier\_lp\_twitter

[13:20](#msg61ded5ae5ee4df335adf1f0f)Hi, is it normal that on the console the code `loop 10 [i: copy [] loop 150 [append i to-char 15 + random 200] print i wait 1 ]`has a different behaviour on R2 than on Red. on R2 each line is written then the wait is done, on Red, all the line are written by the end of 10sec

rebolek

[13:23](#msg61ded66882a4667b25710e2d)@olivier\_lp\_twitter yes, that’s normal. It’s a know limitation of the GUI console (that should be removed in near future). If you try it in a normal console, the behaviour would be the same as in Rebol.

hiiamboris

[13:35](#msg61ded90446529077f57f551e)actually it works in GUI console, at least on W10

[13:35](#msg61ded9369b470f38976240b4)Qingtian sacrificed great deal of print speed to satisfy these complaints ;)

pekr

[15:13](#msg61def0377842bd3ca941a0fe)Those complaints were probably rised by one long time complainer - me :-)

planetsizecpu

[18:47](#msg61df22505ee4df335adfcd1a)Well @pekr some one has to take this responsibility 😀

gltewalt:matrix.org

[19:17](#msg61df2948d41a5853f949063c)If I inadvertently fix the gtk menu "child" item, do I get $100?

greggirwin

[19:25](#msg61df2b212a210c38c1c5f14e)@gltewalt:matrix.org I'll at least buy you a coffee. ;^) Per Knuth, bugs are worth $2.56.

gltewalt:matrix.org

[19:28](#msg61df2be4d143b14f8313b84e)🎉

## Friday 14th January, 2022

chasecrum:matrix.org

[18:12](#msg61e1bd1f5ee4df335ae5669b)is there a Red language command that will execute a linux bash command? I'm finding hit and miss web help on call functions but none of them seem to work yet

[18:23](#msg61e1bfa546529077f58583ae)maybe do?

hiiamboris

[18:23](#msg61e1bfaed143b14f83193e08)`call`

chasecrum:matrix.org

[18:24](#msg61e1bfc89a33545406222637)is there a particular syntax for call that would execute a bash command?

hiiamboris

[18:24](#msg61e1bfe946529077f5858441)

```
>> ? call
USAGE:
     CALL cmd

DESCRIPTION: 
     Executes a shell command to run another process. 
     CALL is a native! value.

ARGUMENTS:
     cmd          [string! file!] "A shell command or an executable file."

REFINEMENTS:
     /wait        => Runs command and waits for exit.
     /show        => Force the display of system's shell window (Windows only).
     /console     => Runs command with I/O redirected to console (CLI console only at present).
     /shell       => Forces command to be run from shell.  <-------
```

[18:27](#msg61e1c0759b470f3897687312)https://www.red-by-example.org is a good site to know when looking for some Red command

chasecrum:matrix.org

[18:27](#msg61e1c0a1e1a1264f0a57e908)yeah I've been looking that over - it's possible I just don't understand what I'm seeing yet. I did download somebody's book/pdf with a lot of howto - but nothing on this yet

hiiamboris

[18:32](#msg61e1c1b76d9ba23328c0a388)

```
>> call/shell/console "if echo 1; then echo 2; fi"
1
2
== 0
```

chasecrum:matrix.org

[18:32](#msg61e1c1d25dc6213cd4e0bf0d)is the &gt;&gt; intentional there?

hiiamboris

[18:33](#msg61e1c1e59b470f38976876ec)I'm just copying and pasting stuff from `red` console

[18:33](#msg61e1c1eb7842bd3ca9478caf)it's the REPL prompt

[18:34](#msg61e1c22b742c3d4b2199ab21)

```
>> system/console/prompt: "♥♥♥"
== "♥♥♥"
♥♥♥oops
*** Script Error: oops has no value
*** Where: catch
```

chasecrum:matrix.org

[18:39](#msg61e1c37882a4667b25776cb5)I got it - totally works now - thanks for the tip!

hiiamboris

[18:43](#msg61e1c4569a3354540622316a):+1:

chasecrum:matrix.org

[19:36](#msg61e1d0d9d143b14f831963b9)alright - curveball bonus round:

[19:37](#msg61e1d0e8d41a5853f94eaf82)how can I get a button to execute more than one comand?

[19:37](#msg61e1d0febfe2f54b2e1b19e9)I've tried multiple calls, but the syntax doesn't seem to work any way I imagine

[19:38](#msg61e1d139f5a3947800066508)currently button "button label here" \[call "/execute.some.thing.here"]

[19:38](#msg61e1d14182a4667b25778bf0)but I have more than one something. is this possible?

[19:39](#msg61e1d166d41a5853f94eb06c)I think maybe I need to build a function for it - but I can't seem to get more than one call in a function either

hiiamboris

[19:42](#msg61e1d23d526fb77b317d0cd2)what have you tried?

chasecrum:matrix.org

[19:45](#msg61e1d2f1e1a1264f0a5816dc)function\_name: func \[call "dothething"] \[call "dothing2"]

and

function\_name: func {  
\[call "dothething"]  
\[call "do thing2"]  
}

[19:55](#msg61e1d51e82a4667b257794f2)All of this is to go into a button action. I just need more than one thing to happen, and I don't know if that should be a function (which I can't do yet) or some scripting somehow.... IDK... its the current learning curve mystery of the day for me.

hiiamboris

[20:02](#msg61e1d6f22a210c38c1cb942f)well, in Red you don't need any delimiters between expressions

[20:03](#msg61e1d6f4742c3d4b2199dbaa)at all

[20:03](#msg61e1d72082a4667b2577991c)http://www.rebol.com/docs/core23/rebolcore.html is a very recommended reading to get the basics

chasecrum:matrix.org

[20:03](#msg61e1d72f5dc6213cd4e0eae6)ok

greggirwin

[20:21](#msg61e1db4b2a210c38c1cb9c7e)Having some examples directly in the VID docs would be great.

@chasecrum:matrix.org does this help? `view [button "print 2 things" [print 1 print 2]]`

[20:22](#msg61e1db965ee4df335ae5addb)Here you can see that the default actor (click for buttons) uses the block you give it. And that block can contain anything you want.

chasecrum:matrix.org

[20:22](#msg61e1dba0e1a1264f0a582d19)I'm not sure. The two things I need to do are bash executions, which is where I would normally use call to execute. could you use call twice in that example?

hiiamboris

[20:23](#msg61e1dbcc9a335454062266fa)why should call be any different?

greggirwin

[20:23](#msg61e1dbd17842bd3ca947c7e4)How is `call` different than `print`? They're just expressions.

chasecrum:matrix.org

[20:24](#msg61e1dc055dc6213cd4e0f8a1)You're probably right, I am just trying to picture the format. \[ call "dothingone" call "dothingtwo"] ???

greggirwin

[20:24](#msg61e1dc1b742c3d4b2199e817)Play. Play. Play. The console is your friend. :^)

chasecrum:matrix.org

[20:25](#msg61e1dc2a7842bd3ca947c828)yeah that's what I've been doing - I'll get this yet

greggirwin

[20:25](#msg61e1dc57e1a1264f0a582ec7)As long as you don't do something like `rm -f`, you're not going to hurt anything.

chasecrum:matrix.org

[20:26](#msg61e1dc93bfe2f54b2e1b353a)Ha! well the good news is, I'm not likely to do much harm - I just have to learn something new

greggirwin

[20:29](#msg61e1dd14d143b14f83197ecd)People coming to Red from other langs often make things harder than they should be, simply from past experience. It's normal for it to take a while to let go and just \*try* something how you'd \*want* it to work. It doesn't always, but mistakes also lead to you learn more about how Red works, which is just as valuable.

chasecrum:matrix.org

[20:29](#msg61e1dd3c46529077f585c7ae)I already Love the simplicity of the language, so I'm not likely to give up.

[20:32](#msg61e1ddda5dc6213cd4e0fd26)the weird thing is when I put both calls behind the button, the first call executes, but the second one does not. It feels like I'm missing something in between calls to show it's something additional, but back to the docs....

greggirwin

[20:35](#msg61e1dea02a210c38c1cba49e)Something like this?

```
>> view [button "print 2 things" [call/shell/console "echo 1" call/shell/console "echo 2"]]
1
2
```

chasecrum:matrix.org

[20:37](#msg61e1defa7842bd3ca947ce0b)your syntax for button is different from the examples I've been using. my programs that work so far have/ button "button name" \[call "something"] return

greggirwin

[20:37](#msg61e1df066d9ba23328c0e50e)`Call` \*can* be a little tricky, because there are a number of options and OS behaviors based on whether you're in GUI or CLI consoles, or a compiled app. Lots of moving parts, should it wait for a result, etc., so start simple and post your examples when you get stuck.

chasecrum:matrix.org

[20:38](#msg61e1df565ee4df335ae5b548)button "Install KVM and tools" \[call "./kvm\_inst.sh"] return &lt;--- this line does work for me

greggirwin

[20:38](#msg61e1df5bd41a5853f94ecf80)`button "button name" [call "something"] return` Seems the same. `Return` is a layout command, kind of like a CR for the GUI, but directionally aware (across vs below).

chasecrum:matrix.org

[20:39](#msg61e1df90742c3d4b2199f081)but the challenge is, what if I wanted to do more than call just one command - then i wouldn't need the supprting scripts

gltewalt:matrix.org

[20:40](#msg61e1dfc6d143b14f83198612)commands: does [  
call "command1"  
call "command2"  
]  
etc...

greggirwin

[20:40](#msg61e1dfd25dc6213cd4e10268)Does the example I posted, like Boris', work, echoing 2 things?

chasecrum:matrix.org

[20:41](#msg61e1dfddf5a3947800068747)I'm testing now...

greggirwin

[20:41](#msg61e1dffa5ee4df335ae5b6af)Maybe formatting will make it clearer:

```
view [
	button "print 2 things" [
		call/shell/console "echo 1"	; command 1
		call/shell/console "echo 2"	; command 2
	]
]
```

chasecrum:matrix.org

[20:48](#msg61e1e1a52a210c38c1cbaaf4)holy cow it works.

[20:49](#msg61e1e1d3742c3d4b2199f4b8)mind you these are examples for testing purposes...

[20:49](#msg61e1e1d69b470f389768c2e6)button "TEST" \[call/shell/console "/usr/bin/xterm -e zypper in htop" call/shell/console "/usr/bin/xterm -e zypper in ntop"] return

[20:49](#msg61e1e1dbd143b14f83198bd6)that worked!

[20:50](#msg61e1e2015dc6213cd4e10776)which is perfect, because now that I can combine commands to a single button, I can eliminate the need for the external shell scripts

[20:55](#msg61e1e32b7842bd3ca947d9f3)thank you so much for your help

greggirwin

[20:59](#msg61e1e440d41a5853f94eda45):+1:

## Saturday 15th January, 2022

gltewalt

[02:23](#msg61e230046d9ba23328c17aca)

```
commands: [who ps df]

view [
    button "Run three commands" [
        foreach c commands [
            call/console form c
        ]
    ]
]
```

greggirwin

[03:17](#msg61e23cc25dc6213cd4e1a92d)Nice. That will give @chasecrum:matrix.org a couple new things to learn.

ldci

[07:36](#msg61e2798f526fb77b317e321d)When using call in compiled app, use `call/wait` for ensuring that all commands are correctly executed.

chasecrum:matrix.org

[14:58](#msg61e2e0fe526fb77b317ee8a5)@ldci: can you clarify that a bit for me?

[15:01](#msg61e2e1bc742c3d4b219bb0d1)@gltewalt: can those commands be used with flags and switches? if so, how would the interpreter know where one command ended and the other began? for example, /usr/bin/xterm -e top - a command that says I want to open a new terminal and execute top in it (or whatever. With flags/switches after the command, how would I then start the other commands in your example?

hiiamboris

[15:13](#msg61e2e4885dc6213cd4e2c577)`commands: ["/usr/bin/xterm -e top -a" "another command" "etc"]`

chasecrum:matrix.org

[15:14](#msg61e2e4c3d41a5853f9509ad4)oh gotcha, thanks!

[15:15](#msg61e2e4ffd143b14f831b4dbf)what is that called? it doesn't look like my function examples. A loop maybe? there's got to be a name for what that is

hiiamboris

[15:15](#msg61e2e52e9b470f38976a7f4f)`[]`? a block

[15:16](#msg61e2e5529b470f38976a7f75)rebol/core manual is waiting for you :)

chasecrum:matrix.org

[15:16](#msg61e2e557bfe2f54b2e1d0a58)oh, no, I'm sorry - I got the block part - I mean the function/thing/whatsit above that it fits into

[15:16](#msg61e2e56b5dc6213cd4e2c6ea)(I'm currently reading the rebol manual from the link you guys gave me

hiiamboris

[15:17](#msg61e2e56e82a4667b257978b1)oh `commands:`? a set-word

[15:17](#msg61e2e5965ee4df335ae77a3f)

```
>> type? quote commands:
== set-word!
```

[15:18](#msg61e2e5ade1a1264f0a59fea6)it's almost equivalent to `set 'commands ...` when evaluated

chasecrum:matrix.org

[15:19](#msg61e2e60f742c3d4b219bb8e3)&gt;

```
> commands: [who ps df]
> 
> view [
>     button "Run three commands" [
>         foreach c commands [
>             call/console form c
>         ]
>     ]
> ]
```

[15:20](#msg61e2e6225dc6213cd4e2c821)I mean that

[15:20](#msg61e2e6306d9ba23328c2acf9)what is that THING called - it doesn't look like my function examples

[15:20](#msg61e2e63b9a33545406244a02)I thought maybe a loop or something

hiiamboris

[15:20](#msg61e2e63d6d9ba23328c2ad17)that what exactly? there's a lot going on there

chasecrum:matrix.org

[15:21](#msg61e2e666d41a5853f9509df0)right. the whole of it. what is that bodyt of code that does a thing called? I don't think it's a function by name, at least not by my examples... I was thinking maybe a loop, but I'm not sure

[15:21](#msg61e2e68782a4667b25797b7e)there's no declared function, but it looks similar to a function

hiiamboris

[15:22](#msg61e2e6b346529077f5879f15)you mean `view`? or `button`? or `foreach`?

chasecrum:matrix.org

[15:22](#msg61e2e6c09a33545406244add)ALL of it together

[15:23](#msg61e2e6d62a210c38c1cd6897)a function has several parts. that, has several parts. what's the sum of it all as an action called?

hiiamboris

[15:23](#msg61e2e6f29b470f38976a821a)all of it is just data :)

[15:23](#msg61e2e6fce1a1264f0a5a01f3)in Red everything is just data

[15:24](#msg61e2e719d41a5853f9509ed4)(until evaluated)

[15:24](#msg61e2e73ee1a1264f0a5a02c8)in this case I'd call it a snippet of code, but implying that code is data

chasecrum:matrix.org

[15:25](#msg61e2e757d41a5853f9509fa2)I thought it might have a name. I can point to what a function is, because it has several identifyable parts. that has a few parts, that act together to do a thing, and I thought it might have it's own name, like a function does. I don't think it's a function, and it kind of resembles a loop in my Bash days, but I don't know what you would call this particular action block of code.

[15:25](#msg61e2e77c5dc6213cd4e2cad4)it vaugely resembles a for loop

hiiamboris

[15:25](#msg61e2e7839b470f38976a82e6)

```
>> ? view
USAGE:
     VIEW spec

DESCRIPTION: 
     Displays a window view from a layout block or from a window face. 
     VIEW is a function! value.
```

chasecrum:matrix.org

[15:26](#msg61e2e788d143b14f831b51ca)IDK, it's not important I guess

hiiamboris

[15:26](#msg61e2e7a5742c3d4b219bbb16)`view` is a function of one argument

chasecrum:matrix.org

[15:26](#msg61e2e7a65ee4df335ae77e0c)yeah I know what view is/does - I meant all of the code in the snippet together

[15:26](#msg61e2e7c35ee4df335ae77e4d)Either way - not that important - just curious.

[15:27](#msg61e2e7cf526fb77b317ef4ab)thanks for all the help as usual

hiiamboris

[15:27](#msg61e2e7d6742c3d4b219bbb65)well that snippet is (if we skip command): 1 word (`view`) and 1 block

[15:27](#msg61e2e7f382a4667b25797e34)sure :)

gltewalt:matrix.org

[16:23](#msg61e2f4fb2a210c38c1cd8247)foreach loops through the block \[who ps df]

[16:31](#msg61e2f6de5ee4df335ae79a66)It touches each item in your grocery bag. The `c` in the above example stands for the item that is being touched at the time.

hiiamboris

[16:32](#msg61e2f7035ee4df335ae79aab)funny @gltewalt:matrix.org your avatar takes 20-30 secs to load and as other avatars of matrix.org visitors, is \*never* cached. I guess they love extra traffic and useless load on their servers.

gltewalt:matrix.org

[16:33](#msg61e2f74c526fb77b317f0e83)Body of all the code that does a thing is a program.

[16:34](#msg61e2f7add143b14f831b6e1d)matrix also has weird handling of code in \`°°

[16:35](#msg61e2f7b55ee4df335ae79c1e)\`

[16:36](#msg61e2f8279b470f38976aa0c2)reading it back is incorrectly formatted

hiiamboris

[16:38](#msg61e2f89bd143b14f831b700b)in what client? element crap?

gltewalt:matrix.org

[16:39](#msg61e2f8d35ee4df335ae79e16)Yes

[16:39](#msg61e2f8da7842bd3ca949bb2d)The app

hiiamboris

[16:41](#msg61e2f92b526fb77b317f111c)hmm haven't noticed

chasecrum:matrix.org

[16:41](#msg61e2f94c9a33545406246dbd)Is there a more preferred app than element?

[16:42](#msg61e2f9659a33545406246dfc)(it's seemed fairly decent to me so far...)

hiiamboris

[16:43](#msg61e2f9bf526fb77b317f121e)no, they're all one worse than the other

gltewalt:matrix.org

[16:43](#msg61e2f9ce46529077f587c040)It's fine for me, just has a few wrinkles still. On a PC I use the gitter web interface

chasecrum:matrix.org

[16:46](#msg61e2fa697842bd3ca949be54)I have it loaded on my OpenSUSE machine and my Ubuntu machine (which I'm on at the moment) - and they both seem to be just fine. Haven't had a problem yet

[16:47](#msg61e2faa69b470f38976aa49d)all of my primary machines are either OpenSUSE or SLES - so whatever I use has to work well on those and not just Ubuntu (that everything seems to work on...)

hiiamboris

[16:48](#msg61e2facb9b470f38976aa4cc)@gltewalt well, I count:  
\- constant struggles to authenticate different devices  
\- a message that on random just sticks to the bottom of the chat and you can't remove it until you log out  
\- removed functionality from the predecessor app  
\- it's inability to pre-load received messages until you open the chat where they appear (in this case you lose a lot of time until it loads them)  
\- inability to continue upload of image/video when it fails (go try that on Edge network)

chasecrum:matrix.org

[16:49](#msg61e2fafdbfe2f54b2e1d2e5f)(mind you I don't use mobile apps for this, just my computers) - thankfully I haven't encountered any of those problems yet (knock on wood)

hiiamboris

[16:52](#msg61e2fbc5e1a1264f0a5a28ba)for the web version I can say  
\- when I scroll up it loads 1 message per 3-5 seconds, so reading the previous chat is not an option  
\- but I'm using an older one because latest versions simply do not work in my browser at all after they switched to polyfills  
\- discord-level CPU load, which makes it super laggy on battery mode  
\- in high contrast mode no icons are visible, I had to rewrite their style myself  
\- image upload randomly fails even more often than on mobile  
\- page itself takes like a minute to load

gltewalt:matrix.org

[17:01](#msg61e2fde246529077f587c8cb)The message sticking to the bottom I've encountered a lot

hiiamboris

[17:01](#msg61e2fe04e1a1264f0a5a2ca2)and know what? it's been so for years, no one cares

greggirwin

[20:00](#msg61e327f82a210c38c1cdd9d5)@chasecrum:matrix.org chapters 3-5 should give you a good idea of the building blocks. A snippet, script, chunk of code, example, gist or other term can all refer to \*some Red content\*. @hiiamboris hinted at everything being data, so while we could say "Red code" and be fine, you'll also see stuff that is, indeed, just data. e.g. talking about data structures may look like code, but Red is a data format first and foremost, so we can run in circles arguing semantics. Just wait until you use the term \*variable* and watch the fireworks. ;^)

chasecrum:matrix.org

[23:34](#msg61e359f5e1a1264f0a5acda3)Ha! I'll keep that in mind :)

## Wednesday 19th January, 2022

meijeru

[16:25](#msg61e83b74f5a394780012db38)I am stuck with the following: the `delete` function only deletes a single file or an empty folder. How to delete a folder that is not empty?

hiiamboris

[16:27](#msg61e83be5d41a5853f95b521f)`delete` every file first

[16:30](#msg61e83ca1742c3d4b21a65a74)you can use \[`glob`](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/glob.red), `reverse` the result and then `delete` every item using `foreach`

meijeru

[17:06](#msg61e8451d46529077f5925e16)For a large multi-level tree structure of files, this becomes rather complicated. Ideally, one should have a refinement `/deep` on `delete`instead.

hiiamboris

[17:11](#msg61e8465582a4667b25843e8e)how complicated it is? `foreach file reverse glob [delete file]`

[17:18](#msg61e847c9d41a5853f95b6c40)Red makes coders lazy ☻

[17:34](#msg61e84b8882a4667b258449e3)it's going to fail on cyclic symlinks though, as there is no way to identify symlinks in pure Red

meijeru

[18:38](#msg61e85aac2a210c38c1d84b0b)Luckily my target is a simple folder tree.

Oldes

[18:47](#msg61e85cda9b470f3897756e16)@meijeru this is ported `delete-dir` function from Rebol:

```
delete-dir: function [
    {Deletes a directory including all files and subdirectories.}
    path [file!]
][
    try [
        if all [
            dir? path     ;@@ does not actually checks, if it is a real dir
            exists? path
            block? files: read path
        ] [
            foreach file files [delete-dir path/:file]
        ]
        delete path
    ]
]
```

## Monday 24th January, 2022

olivier\_lp\_twitter

[13:03](#msg61eea3be7842bd3ca96093cc)Hi, i'm testing et last build (red-23jan22-0ea764787.exe) to test async I/O and i've got an issue with open : Script Error: open does not allow file! for its port argument

hiiamboris

[13:07](#msg61eea47c46529077f59e5668)async IO is in a separate branch

[13:07](#msg61eea49abfe2f54b2e33eb1d)https://github.com/red/red/tree/IO

olivier\_lp\_twitter

[13:22](#msg61eea7f9bfe2f54b2e33f20c)the open functionn is in red-23jan22-0ea764787.exe build : ? open  
`USAGE: OPEN port DESCRIPTION: Opens a port; makes a new port from a specification if necessary. OPEN is an action! value. ARGUMENTS: port [port! file! url! block!]`  
but it doesn't work with a file argument

hiiamboris

[13:24](#msg61eea89ed143b14f83321a6d)it's not implemented there

[13:26](#msg61eea8fa2a210c38c1e4285c)on IO branch too AFAICT, only tcp, no `file://`

olivier\_lp\_twitter

[13:35](#msg61eeab2182a4667b25904201)ok, to be waiting, because when i saw ARGUMENTS: port \[port! file! url! block!]...

## Tuesday 25th January, 2022

TUA20762891\_twitter

[01:55](#msg61ef58a6f5a3947800207565)

```
>> 
>> write-clipboard ["one" "two" "three"]
== true
>> c: read-clipboard
== [%one %two %three]
>> type? c/1
== file!
>>
```

[01:56](#msg61ef58b76d9ba23328dae711)why do strings end up as files here?

[01:57](#msg61ef58f0bfe2f54b2e356137)and why does CTRL-V on WIN not paste the clipboard content?

greggirwin

[04:14](#msg61ef793e46529077f59fff7a)GU console is fine. Funny that I've always used `alt+space->E->P` for the CLI console. If we don't have a ticket for that, we can see what @qtxie thinks.

[04:16](#msg61ef79aae1a1264f0a7278c5)Hmmm. If I use `write-clipboard`, pasting into the CLI console doesn't work at all. Definitely worth a ticket if we don't have one already.

[04:23](#msg61ef7b5046529077f5a0034f)On formatting, we should definitely note how things work. Each OS has different support at this time. If you want to write a block of data as a string on Windows, you need to `form` it first. If it's a block, to try and be helpful, the platform code treats it as a block of files, for CF\_HDROP/DROPFILES compatibility. We need to doc it beyond having this comment in the code.

&gt; ;-- block of files in native format

Mac and Linux do not have this extended support, so it would be great to have people post results from those OSs, and put them in a wiki page.

TUA20762891\_twitter

[04:38](#msg61ef7ede7842bd3ca96244b6)thanks Gregg - much appreciated

qtxie

[10:04](#msg61efcb252a210c38c1e669d3)&gt; Hmmm. If I use `write-clipboard`, pasting into the CLI console doesn't work at all. Definitely worth a ticket if we don't have one already.

Yes. worth a ticket.

hiiamboris

[10:07](#msg61efcbe57842bd3ca962db61)Works fine for me.

[10:09](#msg61efcc4cbfe2f54b2e363c9d)If you `write-clipboard` files then CLI console doesn't paste anything though. But that's expected, because it's OS who does the paste, not the CLI console.

semarie

[10:51](#msg61efd63d9a335454063d5be0)clipboard might depends of the OS used : on Linux you only have 3 differents clipboard buffers you could use

hiiamboris

[11:30](#msg61efdf55f5a394780021750d)on W10 full clipboard history of ~25 last items is accessible

greggirwin

[20:19](#msg61f05b6e9a335454063e7933)The issue with the CLI console not pasting is only going to happen on Windows, and only when `write-clipboard` is used with a block, which lines up with what @semarie says and what the code looks like. What happens is that the CF\_HDROP format is probably not supported, i.e. converted to plain text, when the OS tries to paste into the CLI console.

@TUA20762891\_twitter would you be willing to open the ticket for this, linking to this chat for reference?

hiiamboris

[22:44](#msg61f07d382a210c38c1e7de86)what ticket? I don't see any Red faults here

[22:44](#msg61f07d63bfe2f54b2e37b39c)blame Microsoft, but I think it's by design

greggirwin

[23:03](#msg61f081d69b470f38978511fa)OK, we can note this in the wiki then, since we probably can't work around it in the CLI. HoweverI just hit this crash: `write-clipboard [a b c]`? We have https://github.com/red/red/issues/4331 for that case already.

hiiamboris

[23:07](#msg61f082b1d41a5853f96b7119)yes, the question is what should happen in this case?

[23:08](#msg61f082fcd143b14f8335e880)should it make another pass over the block and check the types then throw an error?

[23:11](#msg61f083939b470f389785152c)I see I asked it in the ticket

greggirwin

[23:15](#msg61f0847bd41a5853f96b7451)My first thought was to check the arg. If it's a single file or a block of files, use CF\_HDROP format, otherwise just make it a string. But I almost immediately thought that CF\_HDROP only has value in drag-drop ops, right? So what's the value in writing it programmatically. Well, that's what we'd need to do in drag-drop use cases. If it's anything but one or more `file!` values, it's just text or an image, and if we want to move data between Red apps, we just `load` it if it's text.

hiiamboris

[23:21](#msg61f08607742c3d4b21b66ef2)we either error out, or skip non-file values, or form them, or try some other processing  
or we form everything but it's kinda weird

[23:22](#msg61f0861dbfe2f54b2e37c641)I didn't implement any mechanism because I have no idea what is useful

[23:23](#msg61f086639b470f3897851b9c)also IIRC proper errors didn't work back then, never blamed the `write-clipboard` itself, but this should be fixed by now

greggirwin

[23:26](#msg61f0871b742c3d4b21b67136)If it's all files, CF\_HDROP, image = image, otherwise text. Shell formats don't support images, but other apps should. Works here, which is really nice.

hiiamboris

[23:28](#msg61f087b8526fb77b31997b35)I don't get what you're proposing

greggirwin

[23:29](#msg61f087db742c3d4b21b6723f):point\_up: https://gitter.im/red/help?at=61f0847bd41a5853f96b7451

hiiamboris

[23:30](#msg61f0882a82a4667b259405b7)`[%a %b %c]` gets pushed as file list but `[%a %b c]` as formed text?

[23:31](#msg61f088445dc6213cd4fd89c0)I think that's a bit treacherous. An error would be better IMO.

greggirwin

[23:34](#msg61f088fb82a4667b2594071e)How is it treacherous, if we say clearly that's how it works? You want to use files, make all the value files. The other alternative is always use text and never CF\_HDROP. Errors seem more treacherous here to me.

hiiamboris

[23:37](#msg61f089ad6d9ba23328dd3b05)Because if it's an error then you know what to fix, but if it's doing something you don't think it should be doing and it gives no clue, it's hard to debug.

[23:37](#msg61f089c2e1a1264f0a74a865)You might not even think of blaming write-clipboard.

greggirwin

[23:41](#msg61f08ac19a335454063eda33)I disagree, but what error do you throw in this case? Because throwing an error means you can \*never* mix file values with other types in what you write to the clipboard, right?

## Wednesday 26th January, 2022

hiiamboris

[10:10](#msg61f11df8526fb77b319a9ba2)Invalid argument I guess.

[10:11](#msg61f11e5dbfe2f54b2e38ef79)Well, never until someone finds a way how to do that usefully.

[10:18](#msg61f12005bfe2f54b2e38f2e6)We could for example register our own clipboard format and put Redbin into it. Though I still don't like the act of switching on condition that one of the items is not file or string.

[10:20](#msg61f1205af5a394780023f6bf)And it doesn't seem very useful to me.

## Thursday 27th January, 2022

olivier\_lp\_twitter

[22:37](#msg61f31eb55ee4df335a073522)Hi, is it planned to be able to access librairies from script mode or it will always be needed to compile? such a long way to see all possibilities.  
compilation is a big add from rebol, but is should be nice to be as much as rebol in script mode

By now, just waiting to be able to use port on file, and hope to be able to handle different files encoding, to switch from rebol to red  
(and maybe some improves in GUI)

hiiamboris

[22:53](#msg61f3225bf5a3947800283358)what do you mean \*librairies\*?

Respectech

[22:53](#msg61f32282526fb77b319ec9de)I'm assuming .dll and .so

hiiamboris

[22:54](#msg61f322a8bfe2f54b2e3d0d73)@greggirwin might know

greggirwin

[23:01](#msg61f3245a5ee4df335a073f6e)@olivier\_lp\_twitter yes, it is planned. The sticking point has been struct mapping at the Red level. @dockimbel has some ideas on this. I used FFI from R2 a \*lot\*, so I push for this feature as well.

hiiamboris

[23:39](#msg61f32d1dd41a5853f970c89c)I think it can be solved with a few routines if it's badly needed.

[23:48](#msg61f32f3446529077f5a79b10)Most boring part will be to make RS call a function that wasn't statically defined. I suppose you'll have to define a single function pointer type for every number of arguments for every calling convention.

## Saturday 29th January, 2022

GiuseppeChillemi

[16:45](#msg61f56f139b470f38978ec4bb)In the `system/words` object, all words exists even if they do not exists. They are created when you check for their existence.

```
>> in system/words 'gggg
== gggg
>> in make object! [aaaa: 1] 'gggg
== none
```

I feel like being in the movie Inception.  
How to you check if a word exists in `system/words` without creating it?

[16:47](#msg61f56f9bd143b14f833f89f7)Don't worry, I have just found a way:

[16:48](#msg61f56fd26d9ba23328e6cb11)

```
>> unset? 'gggg
== false
>> value? 'gggg
== false
>> gggg: true
== true
>> value? 'gggg
== true
```

[16:48](#msg61f56fde2a210c38c1f19310)`value?` is the solution

ne1uno

[16:52](#msg61f570e746529077f5abd60d)`if unset? get/any 'gghd [print off]`

[17:01](#msg61f572fbe1a1264f0a7e3ece)`unset?` might be hazardous, but I can't recall why because it works. maybe it goes away some day?

hiiamboris

[17:32](#msg61f57a322a210c38c1f1a5b6)`value?` IMO is more hazardous as it's easy to misuse:

```
>> value? in object [] 'x
== true
>> value? 'nonexisting/path
== true
```

## Monday 31st January, 2022

GiuseppeChillemi

[22:36](#msg61f864865dc6213cd40ca0c0)What do you suggest?

hiiamboris

[22:48](#msg61f867449b470f3897944a96)stay vigilant :)

## Tuesday 1st February, 2022

greggirwin

[00:04](#msg61f878f67842bd3ca97385ad)I suggest hiding the detail and making the intent clear at the same time.

```
word-exists?: func [word [word!] /in obj [object!]][
	either all [in  not same? obj system/words] [
		not none? system/words/in obj word
	][
		value? word
	]
]
```

There might be a more elegant implementation of course.

[00:06](#msg61f8798cd143b14f83450de2)If you \*only* care about system words, it's just `word-exists?: :value?` :^)

## Wednesday 2nd February, 2022

GiuseppeChillemi

[22:59](#msg61fb0cea0779373db8c62db0)@hiiamboris :D

## Thursday 3th February, 2022

Moppy\_gitlab

[20:23](#msg61fc39dab8b082448217faf1)How do you set a variable globally?

```
book-check: func [hand] [ 
	foreach book books [ 
		counter: 0 record: [] 
		repeat card-numb probe length? hand [
			if (first hand/:card-numb) = book [
				counter: counter + 1 append/only record hand/:card-numb
		]]
		if counter = 4 [hand: exclude hand record] ;not being set globally 
	]
]

obh: [["a" 0] ["a" 1] ["q" 0] ["a" 2] ["a" 3]]
book-check obh
probe obh
```

The result I want is `[["q" 0]]`, but this isn't being set globally to obh.

Oldes

[20:30](#msg61fc3b6051bd8b580c86d7e7)You can use `set global-word "foo"` to have `global-word` global (for example).

[20:31](#msg61fc3b976e4c1e1c84482b64)Can you include example of `books` data?

[20:33](#msg61fc3c0b708e9c3dd75f2a15)@Moppy\_gitlab try this:

```
>> f: func ['word][ ? word ? :word set :word random 100 ]  num: 0  f num  
WORD is a word! value: num

NUM is an integer! value: 0

== 13
>> num
== 13
```

Moppy\_gitlab

[21:03](#msg61fc432bb8b0824482180f04)@Oldes books's data is `["a" "2" "3" "4" "5" "6" "7" "8" "9" "10" "j" "q" "k"]`

[21:03](#msg61fc433a51bd8b580c86e716)the actual removal works fine

Oldes

[21:09](#msg61fc44890779373db8c8aa2c)

```
book-check: function ['hand] [ 
    data: get/any :hand
    foreach book books [ 
        counter: 0 record: clear [] 
        repeat card-numb probe length? data [
            if (first data/:card-numb) = book [
                counter: counter + 1 append/only record data/:card-numb
        ]]
        if counter = 4 [data: exclude data record] ;not being set globally 
    ]
    set :hand data 
]
```

Moppy\_gitlab

[21:12](#msg61fc45480779373db8c8ac39)@Oldes what is get/any? and why is making a new variable necessary?

Oldes

[21:13](#msg61fc4564e4c979478d5d4950)in your case `get` is good as well.

[21:13](#msg61fc45773e52f56a26e7f7f6)`/any => If word has no value, return UNSET rather than causing an error.`

Moppy\_gitlab

[21:13](#msg61fc457ca41d896a207a3a92)is there any difference between set and hand: ?

Oldes

[21:14](#msg61fc459a0779373db8c8ad56)yes... `hand:` will be local and `set` global as you wanted.

Moppy\_gitlab

[21:15](#msg61fc46094164105ab07d24ac)why does `length? :hand` not work?

[21:17](#msg61fc46686e4c1e1c84484300)`*** Script Error: length? does not allow word! for its series argument`

[21:17](#msg61fc46703e52f56a26e7fa6a)it's not a word, :hand is the value

Oldes

[21:19](#msg61fc46d503f2704782193fda)

```
>> f: func['w][probe type? :w length? get :w]  blk: [1 2]  f blk
word!
== 2
```

Moppy\_gitlab

[21:20](#msg61fc47171fe6ba5a9709d211)get :w seems repetitive, but whatever. I guess :w doesn't work properly

Oldes

[21:21](#msg61fc475da41d896a207a3dc4)But that is what you wanted.. you may as well just do:

```
books: ["a" "2" "3" "4" "5" "6" "7" "8" "9" "10" "j" "q" "k"]
book-check: function [hand] [ 
    foreach book books [ 
        counter: 0 record: [] 
        repeat card-numb probe length? hand [
            if (first hand/:card-numb) = book [
                counter: counter + 1 append/only record hand/:card-numb
        ]]
        if counter = 4 [hand: exclude hand record] ;not being set globally 
    ]
    hand
]

obh: [["a" 0] ["a" 1] ["q" 0] ["a" 2] ["a" 3]]
obh: book-check obh
probe obh
```

Moppy\_gitlab

[21:24](#msg61fc47f21fe6ba5a9709d3d6)that looks exactly like what I wrote originally, which doesn't work. obh doesn't change value

Oldes

[21:26](#msg61fc489c3349fe1c71f3b5fd)`obh: book-check obh` is changing.

Moppy\_gitlab

[21:27](#msg61fc48c903f27047821944aa)

```
probe book-check obh
=== 
none
```

[21:28](#msg61fc48e341e3293d65d54c1b)okay, so you added hand at the end

greggirwin

[21:28](#msg61fc491b4164105ab07d2b26)In functions, the last value evaluated is returned, even if `return` is not explicitly used.

Oldes

[21:29](#msg61fc493f03f2704782194616)If you want to modify the original data, you may use also:

```
books: ["a" "2" "3" "4" "5" "6" "7" "8" "9" "10" "j" "q" "k"]
book-check: function [hand] [ 
    foreach book books [ 
        counter: 0 record: copy [] 
        repeat card-numb probe length? hand [
            if (first hand/:card-numb) = book [
                counter: counter + 1 append/only record hand/:card-numb
        ]]
        if counter = 4 [result: exclude hand record insert clear hand result] ; a little bit cryptic :-)
    ]
]

obh: [["a" 0] ["a" 1] ["q" 0] ["a" 2] ["a" 3]]
book-check obh
probe obh
```

[21:30](#msg61fc498dd41024448044c332)You problem is, that `exclude` creates a new series.

[21:32](#msg61fc4a034164105ab07d2d7b)Or just:

```
book-check: function [hand] [ 
    foreach book books [ 
        counter: 0 record: copy [] 
        repeat card-numb probe length? hand [
            if (first hand/:card-numb) = book [
                counter: counter + 1 append/only record hand/:card-numb
        ]]
        if counter = 4 [return exclude hand record]
    ]
]

obh: [["a" 0] ["a" 1] ["q" 0] ["a" 2] ["a" 3]]
obh: book-check obh
probe obh
```

greggirwin

[21:32](#msg61fc4a063e52f56a26e8036c)@Moppy\_gitlab where things got a little tricky is where @Oldes changed `hand` to `'hand` in the func spec. We call this `lit-arg` syntax, and it's an advanced feature. With great power... :^)

Oldes

[21:35](#msg61fc4a980779373db8c8b831)@Moppy\_gitlab you should be also careful with using just `record: []` use `record: copy []` instead!

greggirwin

[21:36](#msg61fc4ade0779373db8c8b8c8)This is a bit deep as well, but here's why: https://github.com/red/red/wiki/%5BDOC%5D-Why-you-have-to-copy-series-values

Oldes

[21:36](#msg61fc4af51fe6ba5a9709da1d)@Moppy\_gitlab

```
>> f: func[v][blk: [] append blk v]  f 1
== [1]
>> source f
f: func [v][blk: [1] append blk v]
>> f "persistent in the function source!"
== [1 "persistent in the function source!"]
>> source f
f: func [v][blk: [1 "persistent in the function source!"] append blk v]
```

Moppy\_gitlab

[21:43](#msg61fc4c91708e9c3dd75f4e29)I don't really get it. So Red makes some complicated things simple while making simple things complicated?

greggirwin

[22:05](#msg61fc519e708e9c3dd75f5850)@Moppy\_gitlab you get it exactly. ;^)

But there is almost always a reason. In the case of `copy`, it's fundamental to the design, and the fact that Red is a data language first and foremost. Same with not having keywords. We \*could* change these rules, but then Red would be a very different language, and lose many of its benefits compared to others. In many cases it's just getting used to how things work, until they seem natural.

mikeyaunish

[22:06](#msg61fc51d54164105ab07d3ce2)I did eventually resolve my searching for Red docs problem.  
Made a simple search tool with Red (of course)  
!\[alt](https://user-images.githubusercontent.com/29316525/152436576-bd6aad69-2f73-451b-8ea4-1df77e8079d0.png)

Find it here: \[red-online-search-tool.red](https://gist.github.com/mikeyaunish/4b842d0e54f52b3fd160668b0fa941b4)

greggirwin

[22:06](#msg61fc51f91fe6ba5a9709ea54)Woohoo! Will have to make time to play. Thanks @mikeyaunish !

Moppy\_gitlab

[22:09](#msg61fc52b1ced11857f99152cf)Are there examples a coding novice can appreciate which demonstrate how conflating data and code is beneficial?

[22:10](#msg61fc52f33e52f56a26e81738)seems like mostly advanced programmers can understand it, but at that point they're probably invested in another way of doing things

[22:18](#msg61fc54d251bd8b580c87112e)does `record: []` not actually do anything after the first time?

hiiamboris

[22:20](#msg61fc55223e52f56a26e81bf7)@mikeyaunish `*.red` doesn't seem like it's working as designed?  
!\[](https://i.gyazo.com/fe3f0fa8ab94d33301a939671c10f38d.png)

greggirwin

[23:25](#msg61fc644cb8b0824482185376)&gt; does `record: []` not actually do anything after the first time?

Trick question. Define `do`. ;^) It's just two values, a set-word and a block. When Red \*evaluates* them, it sees the set-word and says "Whatever comes next, I'll set this word to refer to that, kind of like a variable." Then it sees the block and says "This is a block. It's empty, so I don't need to allocate slots for values it 'contains', and I'm done." With the block evaluation done, `record` can be set to refer to it.

Moppy\_gitlab

[23:33](#msg61fc66520779373db8c8ee06)`test: [1 2 3 4]`

```
>> foreach t test [
[    probe record: [] append record "a"]
[]
["a"]
["a" "a"]
["a" "a" "a"]
== ["a" "a" "a" "a"]
>>
```

```
>> foreach t test [
[    probe record: ["b"] append record "a"]
["b"]
["b" "a"]
["b" "a" "a"]
["b" "a" "a" "a"]
== ["b" "a" "a" "a" "a"]
```

```
>> test: [1 2 3 4]
== [1 2 3 4]
>> foreach t test [
[    append record "a"]
*** Script Error: record has no value
*** Where: either
*** Near : record "a"
*** Stack:
```

so what I'm getting from this, is initialization of a word is completely different from setting what that word refers to.

[23:35](#msg61fc66cdced11857f99179f7)but their syntax is the same in a lot of circumstances

```
>> d: 1
== 1
>> d: 2
== 2
>> d
== 2
>>
```

Respectech

[23:36](#msg61fc67193349fe1c71f3f1e4)In Redbol languages, it is a good idea to always initialize a new block or string with `copy`. If you want to do something more advanced, you can assign another word to an existing block or string, but both those words are simply pointers to the same memory structure.

Moppy\_gitlab

[23:38](#msg61fc67823e52f56a26e84029)so are numbers in Rebols like java's "primitives", and have different rules?

Respectech

[23:38](#msg61fc67884164105ab07d6da5)Something like this:

```
record: copy ["b"]
foreach t test [
    probe append record "a"
]
```

[23:40](#msg61fc67e24164105ab07d6e56)Numbers are generally `integer!` or `decimal!` datatypes. All datatypes have their own set of rules. For instance, if you add an integer! to a date!, should that add to the year, month, or day? In Redbol languages, it adds to the day.

[23:41](#msg61fc680e3349fe1c71f3f426)If you subtract two dates from each other, what should you get as a result? In Redbol languages, it is an integer of the number of days between those two dates.

Moppy\_gitlab

[23:41](#msg61fc684103f2704782198572)intuitively speaking(at least my intuition), subtracting dates would throw an error

Respectech

[23:43](#msg61fc688c1fe6ba5a970a16c0)If you asked a human to subtract a date from another date, what result would be the logical answer? Redbol languages deduce that the number of days between dates would be the answer.

mikeyaunish

[23:43](#msg61fc68b4708e9c3dd75f84b5)@hiiamboris - I get the same results. It's a fairly rudimentary Github filter, so there are lots of other kinds of ".red" source code on Github. Can't seem to get it to narrow down any more than this.

greggirwin

[23:45](#msg61fc692da41d896a207a8378)&gt; is initialization of a word is completely different from setting what that word refers to.

No. If you refer to a word that "doesn't exist" and Red tries to evaluate it (get what it refers to), you get an error (your `record` example). When you use a set-word, it doesn't do that, and in the special global context, adds an entry for that word. Normal contexts (objects) can't be extended right now, their words are set when they are created.

You can also use words as symbols. e.g. `'record`. This is called a lit-word. When evaluated, they return themselves rather than what that word refers to. That's where `get` can be used, as sometimes words are used indirectly. Sounds advanced, again, but isn't in most cases.

[23:50](#msg61fc6a36708e9c3dd75f87b1)&gt; so are numbers in Rebols like java's "primitives", and have different rules?

No, not at all. There are categories of values that share behavior. Numbers fall into the `scalar` category, which subsumes `number` and that contains `[integer float percent]`. We call these categories `typesets`. Blocks, strings, and more fall under `series`. Even at the bottom though, integers for example, are values with a common internal structure (and overhead). Some types can contain their entire content in that structure, while others need to store it elsewhere. e.g. an int is small and fits, but series vary in size and may be huge.

## Friday 4th February, 2022

greggirwin

[00:11](#msg61fc6f33d4102444804514f7)&gt; Are there examples a coding novice can appreciate which demonstrate how conflating data and code is beneficial?

\*Really* good question @Moppy\_gitlab, and one we should make a wiki page for, with links and examples. I don't know that it's for advanced programmers though. It may simplify things for anyone, but not in every case of course. The issue, and why your comment makes sense, is that it \*seems* advanced if you're used to other langs, but in reality it's simpler.

This can go deep, sounding even \*more* advanced, very quickly. If @9214 were here he'd explain it as `fexprs` vs `sexprs`, others might talk about `thunks`, but we can keep it simple. In most langs, code is evaluated when compiled, or interpreted. And that code is fixed. If you want added flexibility, you have to build it yourself. For example, let's say you have a `switch` statement in your code:

```
while [not empty? str: ask "What say you? "][
	print switch str [
		"Hello" ["Howdy"]
		"Bye" ["Later"]
	]
]
```

Normal code. If you want to change the list of inputs and outputs, you edit the code. But you \*have to* edit the code. You have to edit it where it sits. You have to be in the middle of the file with a bunch of other code. You can't take it out, put it in a config file, or create a tool that lets users make their own.

```
chat-map: [
	"Hello"  ["Howdy"]
	"Bye"    ["Later"]
	"What?!" ["Yeah, that's right"]
]
while [not empty? str: ask "What say you? "][
	print switch str chat-map
]
```

Nothing scary there, right? But I smell your next fear. "WHAT?! Put executable...stuff in the hands of users? Some crazy person will use this to write self-modifying code and the world will end! How do you debug anything when code, I mean data that's code, could come from anywhere?" All valid concerns. It's not a silver bullet, it's a tool. Like abstraction in OOP it can be used well or abused terribly. Red gives you this gift, and this burden. We don't tell you how to think, but offer you tools for new ways of thinking.

If you want a massive dose of overload, this old experiment came to mind: \[Reactive BMR Calc](https://gist.github.com/greggirwin/38883ca5109175a60896d2f406ee49f6). Note how `data-ranges` is data, and that other funcs operate at the data structure level, returning a rich structure rather than having separate functions for every possible value variation. I just noticed that this is so old it needs a fix, as it predates the change when `/` used to return an integer, but now returns a float.

@Moppy\_gitlab, woud you mind creating a wiki page, and using this as a start? Maybe call it `The Benefits of Code as Data` or something along those lines.

Moppy\_gitlab

[00:50](#msg61fc786003f270478219a24e)@greggirwin I've got no experience writing documentation, but I made the page.

[00:50](#msg61fc7861d4102444804525cb)https://github.com/red/red/wiki/The-Benefits-of-Code-as-Data

[00:51](#msg61fc789a51bd8b580c875680)I'm not too familiar, but in most functional languages, isn't "setting" anything globally highly discouraged? Red seems to deviate in this way.

greggirwin

[01:12](#msg61fc7d7b708e9c3dd75faad4)Thanks @Moppy\_gitlab! Wikis are made for tweaking. Doing the first draft is always the hardest part.

[01:18](#msg61fc7ed551bd8b580c8763fb)Red is not a purely functional language, nor is it based on immutability. These are intentional design choices. e.g. you can build immutability on top of mutability, but not the other way around.

Red also aims to be pragmatic. I'm happy to be shown where this is wrong, but IME the more "pure" you go down the functional path, the less pragmatic things become. e.g. Haskell is an amazing language, but look how I/O works; and what good is software with no I/O? Also while some people love FP, others like having "state" where they can see and touch it, rather than keeping it all in their head and knowing it's being passed around from place to place. Human issues are our biggest technical challenge. :^)

[01:18](#msg61fc7ef503f270478219ae02)In Red, we care much more about "Can you get useful work done?" than any particular dogma.

[01:21](#msg61fc7f8ed4102444804530b6)On the subject of immutability: https://gist.github.com/numberjay/3df8f13044145c6dde1918ea2cdfe3b8

Moppy\_gitlab

[01:28](#msg61fc813f6e4c1e1c8448b822)In python, it would kind of be like

```
>>> a = [1, 2, 3]
>>> a = [4, 5, 6]
>>> a
[1, 2, 3, 4, 5, 6]
```

[01:30](#msg61fc81ad03f270478219b296)in Red, it's still not like that though

```
>> r: [1 2 3]
== [1 2 3]
>> r: [4 5 6]
== [4 5 6]
>> r
== [4 5 6]
```

[01:31](#msg61fc81e6e4c979478d5dc518)

```
>> r: []
== []
>> r
== []
```

ne1uno

[01:33](#msg61fc824c03f270478219b3e4)more like static persistent variable. red acts at first glance like it has scope and variables till you dig deeper

Moppy\_gitlab

[01:33](#msg61fc82691fe6ba5a970a4982)my point is that there's probably more difficulty to it than people just being used to other languages

ne1uno

[01:34](#msg61fc8292ced11857f991ac3b)options

Moppy\_gitlab

[01:36](#msg61fc8329dc191b3d6993e064)If Red were to be taught as a first language, you'd have to explain "well it's like this here, but in THIS situation, you need to do things differently because the behavior changes". As opposed to "this is how it is and always is".

greggirwin

[01:36](#msg61fc833b4164105ab07da379)@Moppy\_gitlab if you search the wiki for Python, you'll find some great pages written by @GalenIvanov.

ne1uno

[01:38](#msg61fc839e3e52f56a26e875e5)https://github.com/red/red/wiki/%5BLINKS%5D-Scripts-collection

[01:39](#msg61fc83b4a41d896a207ab652)https://github.com/red/red/wiki/\[LINKS]-Scripts-collection

greggirwin

[01:40](#msg61fc83f9a41d896a207ab6b1)&gt; If Red were to be taught as a first language, you'd have to explain "well it's like this here, but in THIS situation, you need to do things differently because the behavior changes". As opposed to "this is how it is and always is".

Red is fairly consistent, and we keep trying to improve that, but if it were taught as a first language, the unlearning problem goes away. For example, to me these two lines of Python look the same:

```
>>> a = [1, 2, 3]
>>> a = [4, 5, 6]
```

Why do I get a different result? Why does `=` append, or does that mean that the first one also appends, but to an invisible array I never see?

[01:41](#msg61fc844451bd8b580c876caa)And `a =` vs `a` is the same as `r:` vs `r` in both langs, isn't it?

[01:42](#msg61fc847b3349fe1c71f424e0)You do have to understand \*some* things. Without those fundamentals, you can't do much in any language.

ne1uno

[01:42](#msg61fc84913e52f56a26e87854)https://github.com/red/red/wiki/Coming-to-Red-from-another-language

Moppy\_gitlab

[01:42](#msg61fc849cb8b0824482188cdd)@greggirwin having to write `r: copy []`, but only in the context of loops, is a little annoying.

greggirwin

[01:43](#msg61fc84dc03f270478219b950)It's not only in the context of loops though. This is what you have to learn.

Thanks for the links @ne1uno. :+1:

Moppy\_gitlab

[01:49](#msg61fc860d51bd8b580c87701a)Then why does this work as I expect it to?

```
>> r: [1]
== [1]
>> r: []
== []
>> r
== []
```

You posted a link explaining this, but to be honest a lot of it went over my head, and you called it a bit deep yourself.

greggirwin

[01:52](#msg61fc86d33349fe1c71f42953)

```
r: a: [1]    ; R and A both refer to this block
r: b: []     ; R now refers to this one, as does B
r
a
b
same? a b
same? r a
same? r b
append b 2
r
append c: copy b 3    ; C refers to a NEW block, which is a copy of B.
r
same? b c
```

Moppy\_gitlab

[02:03](#msg61fc896441e3293d65d5cbd6)Well that still makes me wonder why these two aren't equivalent

```
>> r: []
== []
>> loop 3 [r: [] append r 3]
== [3 3 3]
```

```
>> r: []
== []
>> append r 3
== [3]
>> r: []
== []
>> append r 3
== [3]
>> r: []
== []
>> append r 3
== [3]
>> r
== [3]
```

[02:07](#msg61fc8a6ca41d896a207ac04f)I mean, one of the most basic assumptions is that looping behaves the same as writing out the functions as many times as they repeat.

greggirwin

[02:08](#msg61fc8a8aa41d896a207ac09a)Because in the first example, `r` inside the `loop` call is the same one for every `append` call. You haven't changed it to a new reference. In the second example, you set `r` to refer to a new and different block every time you do `r: []`.

[02:08](#msg61fc8ab941e3293d65d5ce56)That's why I linked to the wiki page on copying.

[02:12](#msg61fc8b85d410244480454478)

```
loop 3 blk: [r: [] append r 3  print mold blk]
blk/1
blk/2
same? r blk/2
```

Moppy\_gitlab

[02:13](#msg61fc8bb64164105ab07db0f8)so, to put it simply `r: []` behaves differently inside a loop, because loop's instructions are inside a "block"?

greggirwin

[02:13](#msg61fc8be7708e9c3dd75fc5ec)So there \*is* a difference here, when you're working in the console, because there's kind a big outer block you don't see.

[02:16](#msg61fc8c661fe6ba5a970a5a97)

```
code: [
	r: []
	append r 1
	r: []
	append r 2
	r: []
	append r 3
]
do code
print mold code
r
```

[02:18](#msg61fc8cf503f270478219c70f)Now you can see that the first two blocks still exist, but `r` no longer refers to them. You can still access them though.

```
foreach val code [print mold val]
code/2
; etc.
```

[02:19](#msg61fc8d18b8b0824482189cde)It's a mind-bender for some people. You don't \*even* want to ask about `bind` and contexts yet. ;^)

Moppy\_gitlab

[02:22](#msg61fc8dd34164105ab07db432)I can see myself telling someone "in a loop, you have to add copy to set a word to a series, just because".

greggirwin

[02:24](#msg61fc8e466e4c1e1c8448cd5b)If you can see yourself explaining it that way, please send them here and I'll try to do better than "just because". Also, Red isn't for everyone, we acknowledge that.

[02:26](#msg61fc8ecdb8b0824482189efe)We like The Matrix references too, the red pill and all that, and this one would be where Morpheus tells Neo that they don't free people after a certain age because "the mind finds it hard to let go". :^)

Moppy\_gitlab

[02:26](#msg61fc8eef51bd8b580c878025)Is 20 too old?

Respectech

[02:27](#msg61fc8f0e0779373db8c9353d)No.

greggirwin

[02:32](#msg61fc9056ced11857f991c62d)I was almost 40 when my mind was freed.

Moppy\_gitlab

[02:33](#msg61fc906c51bd8b580c8782cf)To be more optimistic, I could call it a documentation problem, where the article explaining something as basic as how to set a reference to a series within a loop and why mentions serialization. If people being too used to other languages is the main problem, it's kind of a vicious cycle when existing documentation assumes that much knowledge.

greggirwin

[02:36](#msg61fc91300779373db8c9399e)Everyone hits different hurdles at different times. We're always open to improving docs. If you understand it now, give it a shot. You have the newcomer's perspcctive that we don't.

Moppy\_gitlab

[02:39](#msg61fc91ea0779373db8c93ad8)

```
?? loop
loop: make native! [[
    "Evaluates body a number of times"
    count [integer! float!]
    body [block!]
]]
```

Okay, so the body is a block type. And it's not this

```
>> do [r: [] append r 3]
== [3]
>> do [r: [] append r 3]
== [3]
>> do [r: [] append r 3]
```

[02:42](#msg61fc928cdc191b3d6993f997)I want to see how loop's behavior can be explained without loop.

ne1uno

[02:43](#msg61fc92d651bd8b580c8786cd)`f: func [][r: probe [] repeat i 5 [ append r i probe r ]] f f`

greggirwin

[02:44](#msg61fc9305b8b082448218a634)Go back to my `code` example.

```
code: [
	do [r: [] append r 3]
	do [r: [] append r 3]
	do [r: [] append r 3]
]
do code
print mold code
```

Moppy\_gitlab

[02:45](#msg61fc9357ced11857f991ca16)@ne1uno ah, so r's value within f is never discarded even after f finishes evaluating

[02:46](#msg61fc936ed4102444804552a9)it's just preserved I guess?

ne1uno

[02:46](#msg61fc938fced11857f991ca25)that's why you'll usually want a copy

greggirwin

[02:46](#msg61fc9391e4c979478d5de454)Or maybe this. These are equivalent:

```
loop 3 blk: [r: [] append r 3  print mold blk]
loop 3 blk: [r: [] append blk/2 3  print mold blk]
```

Then you can see that `r` isn't needed at all.

```
loop 3 blk: [[] append blk/1 3  print mold blk]
```

Now you have to use `blk` to refer to it, but that's incidental to how it works. It shows that setting a word to refer to something does not affect the thing it refers to.

[02:48](#msg61fc940ba41d896a207ad201)This might be good chat to cut into, or link to, the `why you have to copy` wiki page.

Moppy\_gitlab

[02:55](#msg61fc95a751bd8b580c878b28)`When evaluated, it binds the word to the result of next expression. It doesn't do anything more than that. So a: "" does not "reset" or "reinitialize" the "variable" a. That is an incorrect interpretation, it just makes the word a refer to the literal string "" which follows it.`

[02:56](#msg61fc95e00779373db8c940ee)within here though `f: func [][r: [] repeat i 5 [ append r i probe r ]] f f`, `r: []` doesn't actually make r refer to an empty series

[02:57](#msg61fc9609e4c979478d5de8ac)r is "unsettable" it seems

ne1uno

[02:57](#msg61fc962d3349fe1c71f4441d)`r: make string! 10` is another of various ways. you wan't always want an explicit `copy`

Moppy\_gitlab

[03:01](#msg61fc970651bd8b580c878cd8)`f: func [][r: 89 r:[] repeat i 5 [ append r i probe r ]] f f` does the same thing in the end. So I guess series are just never destroyed no matter what.

[03:05](#msg61fc97e8ced11857f991d2b2)

```
>> f: func [][r:[] repeat i 5 [ append r i probe r] r: 89]
== func [][r: [] repeat i 5 [append r i probe r] r: 89]
>> f
[1]
[1 2]
[1 2 3]
[1 2 3 4]
[1 2 3 4 5]
== 89
>> f
[1 2 3 4 5 1]
[1 2 3 4 5 1 2]
[1 2 3 4 5 1 2 3]
[1 2 3 4 5 1 2 3 4]
[1 2 3 4 5 1 2 3 4 5]
== 89
```

I can only say this is bizarre.

greggirwin

[03:06](#msg61fc98223e52f56a26e89a30)Define `destroyed`.

```
f: func [][r: copy [] repeat i 5 [ append r i probe r ]] f f
```

Moppy\_gitlab

[03:06](#msg61fc9834e4c979478d5dec30)it's like Red says "last time when r was a series it was this, so I'll append it to that"

[03:07](#msg61fc985da41d896a207ad911)Red doesn't say "r is this, now r is that, now r is something else"

greggirwin

[03:07](#msg61fc988b03f270478219da19)

```
>> f: func [][r:[] repeat i 5 [ append r i probe r] r: 89]
== func [][r: [] repeat i 5 [append r i probe r] r: 89]
>> print mold body-of :f
[r: [] repeat i 5 [append r i probe r] r: 89]
>> f
[1]
[1 2]
[1 2 3]
[1 2 3 4]
[1 2 3 4 5]
== 89
>> f
[1 2 3 4 5 1]
[1 2 3 4 5 1 2]
[1 2 3 4 5 1 2 3]
[1 2 3 4 5 1 2 3 4]
[1 2 3 4 5 1 2 3 4 5]
== 89
>> print mold body-of :f
[r: [1 2 3 4 5 1 2 3 4 5] repeat i 5 [append r i probe r] r: 89]
>> f: func [][r: copy [] repeat i 5 [ append r i probe r ]] f f
[1]
[1 2]
[1 2 3]
[1 2 3 4]
[1 2 3 4 5]
[1]
[1 2]
[1 2 3]
[1 2 3 4]
[1 2 3 4 5]
== [1 2 3 4 5]
>> print mold body-of :f
[r: copy [] repeat i 5 [append r i probe r]]
```

I think we should call it a night. I don't know of another way to explain it right now.

[03:09](#msg61fc98f86e4c1e1c8448dfe4)This is a key phrase from the wiki page:

&gt; Every function body is just a block of data, that you can manipulate as any other data, and you can do so at any time. There is no point in time where your "source code" becomes "code". It is, and remains, data.

Moppy\_gitlab

[03:10](#msg61fc992ad410244480455db8)To be honest, I don't know much about data.

ne1uno

[03:11](#msg61fc9955e4c979478d5dee0c)you can use `probe` between most statements to see what is happening, it passes values through

greggirwin

[03:12](#msg61fc999d6e4c1e1c8448e129)&gt; To be honest, I don't know much about data.

That will make Red a big challenge for you, but also a good way to learn about data. Another key phrase from the wiki:

&gt; Red &amp; Rebol are data formats first, before being programming languages.

Moppy\_gitlab

[03:15](#msg61fc9a5941e3293d65d5e8b0)

```
>> f: func [][probe r: "a" probe r:[] repeat i 5 [ append probe r i] probe r: 89]
== func [][probe r: "a" probe r: [] repeat i 5 [append probe r i] probe r: 89]
>> f
"a"
[]
[]
[1]
[1 2]
[1 2 3]
[1 2 3 4]
89
== 89
>> f
"a"
[1 2 3 4 5]
[1 2 3 4 5]
[1 2 3 4 5 1]
[1 2 3 4 5 1 2]
[1 2 3 4 5 1 2 3]
[1 2 3 4 5 1 2 3 4]
89
== 89
```

[03:23](#msg61fc9c4eced11857f991daf0)

```
>> f: func [][probe r: [] repeat i 5 [append r (i * -1)] probe r:[] repeat i 5 [ append r i]]
== func [][probe r: [] repeat i 5 [append r (i * -1)] probe r: [] repeat i 5 [append r i]]
>> f
[]
[]
== [1 2 3 4 5]
>> f
[-1 -2 -3 -4 -5]
[1 2 3 4 5]
== [1 2 3 4 5 1 2 3 4 5]
>> f
[-1 -2 -3 -4 -5 -1 -2 -3 -4 -5]
[1 2 3 4 5 1 2 3 4 5]
== [1 2 3 4 5 1 2 3 4 5 1 2 3 4 5]
```

[03:27](#msg61fc9d2d3e52f56a26e8a292)It's pretty interesting how that works. I suppose it's a feature.

[03:31](#msg61fc9e126e4c1e1c8448e85c)kind of goes back to this `>>> none = [] == false`

greggirwin

[03:34](#msg61fc9ecea41d896a207ae40c)&gt; I suppose it's a feature.

LOL. Yeah, it is.

Red is a deeply designed language. There will be some unintended consequences here and there, but it's built on a strong and intentional foundation.

[03:35](#msg61fc9ee90779373db8c95006)&gt; `>>> none = [] == false`

I have no idea what that means.

Moppy\_gitlab

[03:35](#msg61fc9f11ced11857f991dfe3)What I mean is that none is not a way to refer to literally "an empty series". Neither is \[]

[03:36](#msg61fc9f4b1fe6ba5a970a7893)I wonder if there is anything that always means "empty series"

greggirwin

[03:36](#msg61fc9f4c41e3293d65d5f28b)Correct. The only "falsy" values are `none` and `false/off/no`. We have `empty?` to ask about emptiness.

Moppy\_gitlab

[03:37](#msg61fc9f7c51bd8b580c879a9f)like a shorthand for copy \[]

greggirwin

[03:37](#msg61fc9f926e4c1e1c8448eaf4)No, not at all.

[03:38](#msg61fc9fce4164105ab07dd3a4)This can also become a long discussion. :^) Use `help` in the console for `empty?`

[03:39](#msg61fc9fd403f270478219e635)And `source`.

[03:39](#msg61fca00851bd8b580c879b8c)You can use `[]` to compare to an empty block, but that's not as meaningful.

pekr

[06:24](#msg61fcc6aea41d896a207b282d)@Moppy\_gitlab Your example of Python assignment is a complete headache, sorry. If you you claim, that Red's behaviour is "strange", then I just wonder, how can anyone explain what Python does here? It just looks terrible, sorry.  
For appending to the series, we've got function like `append` or `insert`. Which leads me to the following - one of the most important aspect of Redbol languages, is a concept of series. There is still Rebol Core documentation, which I would suggest you reading this chapter - http://www.rebol.com/docs/core23/rebolcore-6.html

[06:30](#msg61fcc808d41024448045af19)The series is just a .... series of data, unless evaluated. So you can manipulate the serie in many ways:

```
>> code: [print [1 2 3]]
== [print [1 2 3]]
>> code/1
== print
>> first code
== print
>> code/2/3
== 3
>> at code 2
== [[1 2 3]]
>> sort copy code
== [[1 2 3] print]
>> insert code "before"
== [print [1 2 3]]
>> append code "behind"
== ["before" print [1 2 3] "behind"]
>> remove back tail code
== []
>> code
== ["before" print [1 2 3]]
>> remove head code
== [print [1 2 3]]
>> do code
1 2 3
```

Moppy\_gitlab

[06:38](#msg61fcc9cf6e4c1e1c84492e2e)@pekr python doesn't actually work like that, at all

pekr

[07:01](#msg61fccf40b8b0824482190a46)I don't mind a differences between langs, but two times assigning a values to the same variable leading to addition / appending, looks really awful even for experienced, not to mention novices. And yes, Redbol langs have their gotchas, one of them being the need to copy the empty series to be safe. I can understand the benefits of having various words pointing to the same or different position in the series, but can't see a value in the case of an empty block usage. It burns most of the users. But then - I don't belong into the group of gurus here :-)

[07:28](#msg61fcd5bb1fe6ba5a970addba)Well, it seems that reusage of empty series is happening only in a function calls, not when prototyping in a console, so it has to have something to do with the function indefinite extent, or how was that called?:

```
;-- empty block in a function
>> test: func [value][c: [] append c value]
== func [value][c: [] append c value]
>> test 1
== [1]
>> c
== [1]
>> test 2
== [1 2]
>> c
== [1 2]

;-- empty block in a console
>> d: []
== []
>> append d 1
== [1]
>> d: []
== []
>> append d 2
== [2]
>> d
== [2]
```

Oldes

[08:46](#msg61fce7cee4c979478d5e7875)@pekr

```
>> c: context [b: [] f: func[v][append b v]]
== make object! [
    b: []
    f: func [v][append b v]
]
>> c/f 1
== [1]
>> c/f 2
== [1 2]
>> c
== make object! [
    b: [1 2]
    f: func [v][append b v]
]
```

[08:46](#msg61fce7f7b8b0824482193bde)when you make a function, the values inside it's body must have a context

pekr

[08:56](#msg61fcea3e3e52f56a26e92b5d)you always have some context, no? In the case of the console, you are using a global context.

Oldes

[08:57](#msg61fcea66dc191b3d69949d03)The body of the function is made only once, while in console you create the block every time.

pekr

[08:58](#msg61fcea9b03f27047821a730f)In case of object above, such functionality makes a sense. With a bare-bones function only, where it behaves just the same, it might be a bit difficult for a novice user to understand / get accustomed to ....

[08:58](#msg61fceac00779373db8c9d96c)Ah, thanx for the explanation, that makes sense. Those are the sentences, which explain things and should be part of the docs imo ....

Oldes

[09:00](#msg61fceb2e4164105ab07e62fe)You don't want copy everything every time... only where you really want it.

[09:07](#msg61fcece4e4c979478d5e81a6)For example here:

```
>> f: func[v][ print ["The Value is:" v] ]
== func [v][print ["The Value is:" v]]
>> f 1
The Value is: 1
```

you really don't want to make a copy of block `["The Value is:" v]` and copy of string `"The Value is:"` every time, when you call the function.

[09:13](#msg61fcee353349fe1c71f4dfdd)@Moppy\_gitlab in your case, you could also use `record: clear []` instead of `record: copy []`. Using the `clear` has the advantage, that you re-use already created series (no allocation), but you still start with empty record. You just have to be careful not to return the value from the function, because next run of the function always clears it.

hiiamboris

[11:45](#msg61fd11e5e4c979478d5ecdeb)@mikeyaunish FYI in all Firefox forks you can define your own search plugins, e.g.:  
!\[](https://i.gyazo.com/622d462d19390a0d6b009e5c9bfd7faf.png)  
Then in `search-metadata.json` you list them with an \*alias* e.g. `"[profile]/mal.xml":{"alias":"a"}`. Now entering `a term` in the URL bar will perform MAL search for `term`. I think Opera must have smth like this too (in fact the idea likely originated from Opera back in it's better days, though idk if it survived the switch to Chromium).

mikeyaunish

[16:50](#msg61fd594441e3293d65d76319)@hiiamboris Sounds interesting. I'll look into it. Not sure what more utility this will bring to my search efforts, but I'll give it a try.

Moppy\_gitlab

[17:25](#msg61fd6195ced11857f9936036)@Oldes makes sense. If Red is primarily a data format, I wonder how it compares/its advantages compared to other data formats. What I've seen has mostly compared Red to programming languages. I also wonder how well it interfaces with non-Red technologies that use data.

hiiamboris

[17:28](#msg61fd62473349fe1c71f5cb7f)Advantage is 50+ datatypes. Disadvantage is also 50+ datatypes ;)

Moppy\_gitlab

[17:32](#msg61fd63163e52f56a26ea2ca1)I mean, people seem to like treating all data the same, and then making a parsing scheme for every different usage.

rebolek

[18:41](#msg61fd73680779373db8cafab5)@Moppy\_gitlab what it means is that you need to think of everything being just data until it's executed.

rgchris

[21:19](#msg61fd987f0779373db8cb458f)@Moppy\_gitlab This isn't a comparison per se, but hits at the purpose of Red (or Rebol as the subject of the post) as a text-based data format: \['Was XML flawed from the start?'](http://www.rebol.com/article/0108.html). You could start to pick apart the merits on this basis; the challenges in not having the ubiquity of, say, JSON or XML; or even the complexity in writing a parser; but there's few data formats that operate quite in the same scope. Not everything about Red's specific interpretation of data-as-code is necessarily a given, but it does strongly inform how it works as a language.

Moppy\_gitlab

[21:34](#msg61fd9be54164105ab07fee56)Tried another crack at writing a Go Fish program. All of the "processes" work on their own. Together, it sometimes freezes before `request`, and book-check doesn't seem to work despite working on its own when I tested it.

[21:34](#msg61fd9be6708e9c3dd761d711)https://github.com/Dry-Leaf/Go-Fish-in-Red/blob/main/gofish.red

[21:35](#msg61fd9c2fa41d896a207ce12b)I don't know how to debug it.

[21:39](#msg61fd9d1ce4c979478d5fe80a)maybe book-check should for the other player now that I think about it.

[21:55](#msg61fda0efa41d896a207ceb16)@rgchris the shortcomings of XML mentioned in that article are probably why it fell of out popularity in favor of json.

greggirwin

[22:43](#msg61fdac0ba41d896a207d01aa)Thanks for chiming in @rgchris. Nice old article.

hiiamboris

[22:50](#msg61fdadbb1fe6ba5a970c97bf)From working with XML I'd say it has much bigger flaw: lack of arrays. Programmers always work with arrays of data, there's no escape from that. But in XML you represent array as sparse separate elements, and you have to filter \*through everything* to get them. This format just doesn't map to computers. And maps even worse to humans.

Moppy\_gitlab

[22:52](#msg61fdae1151bd8b580c89b593)So does anyone know where to start with debugging my program, because I'm at a loss here?

[23:03](#msg61fdb0d1708e9c3dd7620275)This is one output of it being run. At the end there it froze with no error or it crashing. https://pastebin.com/raw/qEp0RsVe

greggirwin

[23:29](#msg61fdb6d1dc191b3d69964fa6)@Moppy\_gitlab if your program "freezes", look to where infinite loops can occur. e.g. `until`. See what results are getting back to it, and maybe add a counter to break after N repetitions so it stops and lets you see if it always freezes after the same number of iterations, or different counts. Then remove randomness. Seed it with a known value and you should see consistent behavior. Look for a seed that makes it freeze, and then analyze the state of things to see where it goes wrong.

Hope this helps.

Moppy\_gitlab

[23:56](#msg61fdbd3a1fe6ba5a970cb275)@greggirwin I've figured out the problem is with this specific loop. I don't know why that would happen though.

```
search (choice: request) human_hand 
	]
```

## Saturday 5th February, 2022

Moppy\_gitlab

[00:00](#msg61fdbe39e4c979478d602a4d)The loop does not run infinitely every time, but eventually it always does. And it's not because human\_hand is empty.

[00:02](#msg61fdbe99d41024448047af2a)request seems to refuse to be invoked

[00:10](#msg61fdc0693349fe1c71f69294)I mean okay r: \[] doesn't clear r, but does r: function not call function every time?

[00:15](#msg61fdc1ae6e4c1e1c844b3196)realized I need to write active\_hand: book-check active\_hand active\_books, which is something else

gltewalt

[01:05](#msg61fdcd75708e9c3dd7623c02)&gt; I don't know how to debug it.

I would start with a couple print statements in the `until`blocks. "In first until", "In second until".

[01:06](#msg61fdcd96a41d896a207d4295)Or you can try `debug` or `trace`

Moppy\_gitlab

[01:14](#msg61fdcf70ced11857f9943f3b)@gltewalt Is trace a new build in word?

rgchris

[01:17](#msg61fdd028dc191b3d69967b6a)&gt; @rgchris the shortcomings of XML mentioned in that article are probably why it fell of out popularity in favor of json.

Possibly, but there's also no escaping XML, it just keeps turning up in the wrong places like a bad smell :(

JSON is likely wildly successful for it's (almost) simplicity, but vs. Redbol, you lose the implicit metadata from that array of datatypes (what does a 'date' look like in JSON?), not least the ability to represent code/language. Again, can argue the value of that, but that is the niche

Moppy\_gitlab

[01:17](#msg61fdd02d1fe6ba5a970cd4ec)after changing it to,

```
until [ ;probe human_hand
				trace search (choice: request) human_hand 
			]
```

the computer's turn seems to repeat indefinitely, even after fish is called.

[01:25](#msg61fdd1ff51bd8b580c89f77b)@rgchris people don't use json by itself. Maybe Red could just be used as a drop in for json, and nothing more, but I doubt that's the intended purpose or would have significant benefit. If Red is meant to be used by itself, wouldn't the programming part be no less important?

gltewalt

[01:28](#msg61fdd2a0d41024448047d5a0)Yeah, trace and debug are both fairly new

ne1uno

[01:33](#msg61fdd3d6d41024448047d80b)@Moppy\_gitlab https://github.com/red/docs/blob/master/en/interp-events.adoc post your source somewhere too. need `do/trace choice etc` or `probe choice` to see what it returns

Moppy\_gitlab

[01:34](#msg61fdd4206e4c1e1c844b50b0)@ne1uno source is right here https://github.com/Dry-Leaf/Go-Fish-in-Red/blob/main/gofish.red

gltewalt

[01:35](#msg61fdd44a3e52f56a26eb164b)That expression is never true then. `until` evaluates a body until it is truthy.

greggirwin

[01:35](#msg61fdd44edc191b3d699683aa)@Moppy\_gitlab be sure you understand what stops `until`, and what your expressions return when you use them there.

Moppy\_gitlab

[01:35](#msg61fdd476708e9c3dd7624746)Well it can't be truthy if request isn't invoked

[01:36](#msg61fdd48cdc191b3d69968445)sometimes request is invoked

[01:36](#msg61fdd497708e9c3dd762476d)and then it stops being invoked

gltewalt:matrix.org

[01:39](#msg61fdd56c1fe6ba5a970cdcad)Is it running out of cards in the hand?

Moppy\_gitlab

[01:40](#msg61fdd5781fe6ba5a970cdccb)No, I've put

[01:40](#msg61fdd584a41d896a207d5188)`print human_hand` in the until loops, and it's not empty

[01:40](#msg61fdd5ab6e4c1e1c844b5363)and even if it was empty, request should still be invoked

[01:49](#msg61fdd79ea41d896a207d5480)so after putting `probe choice` this is the output around when the freezing starts,

```
Computer's choice:  10

Computer's choice:  4


Go Fish

Remaining Books:  a 2 3 4 5 6 7 8 9 10 j q k

Your hand:

q♥  j♥  5♠  5♦  j♠  3♦  2♦  k♣  8♥  3♠  q♣  k♦

"10"
"10"
"10"
"10"
"10"
"10"
"10"
"10"
"10"
"10"
"10"
"10"
"10"
"10"
"10"
"10"
"10"
"10"
"10"
"10"
"10"
"10"
"10"
"10"
.....................
```

[01:52](#msg61fdd8686e4c1e1c844b5858)maybe this happens, every second time the computer gets "go fish"

[01:53](#msg61fdd8a3d41024448047e122)

```
Computer's choice:  9


Computer's choice:  6


Go Fish


Remaining Books:  a 2 3 4 5 6 7 8 9 10 j q k


Your hand:

5♦  k♦  k♣  q♥  7♠  7♥  k♠  8♦  5♥  3♠  2♣  8♥

"9"
"9"
"9"
...
```

greggirwin

[01:56](#msg61fdd93a3349fe1c71f6c14d)Looks like you're making progress debugging.

Moppy\_gitlab

[02:11](#msg61fddcb7d41024448047e7a1)It appears book-check actually also isn't working. I think I give up. I now appreciate variables more.

gltewalt:matrix.org

[02:17](#msg61fdde1e51bd8b580c8a0e12)It was a pain in the butt a few times for me.

Moppy\_gitlab

[02:18](#msg61fdde75b8b08244821b2935)I just want to quickly make small parts, and have them work together in a predictable way, without any weird esoteric behavior getting in my way.

greggirwin

[02:20](#msg61fddef7708e9c3dd7625a19)&gt; weird esoteric behavior

If you mean Red should work just like other langs, then maybe it isn't for you. It's not weird or esoteric, just different than what you're used to.

gltewalt:matrix.org

[02:22](#msg61fddf743349fe1c71f6cc96)Have you done a version in python? If so, what it easy?

Moppy\_gitlab

[02:23](#msg61fddf8f41e3293d65d86e88)In another lang, someone would easily be able to point out exactly where things go wrong and why. @gltewalt:matrix.org I should try that.

gltewalt:matrix.org

[02:23](#msg61fddf9151bd8b580c8a10bf)Was it

greggirwin

[02:26](#msg61fde046e4c979478d6066a4)&gt; In another lang, someone would easily be able to point out exactly where things go wrong and why.

I don't want to be harsh here @Moppy\_gitlab, but are you saying it's on us to debug your code? We are trying to help, but it's not clear if you've done what we've suggested.

gltewalt:matrix.org

[02:26](#msg61fde06b0779373db8cbcc36)Give it a try. Then you'll have a better idea as to whether it's the foreign nature of the language or just underestimating the difficulty level of go fish

greggirwin

[02:27](#msg61fde0914164105ab0807385)Listen to @gltewalt:matrix.org here. I haven't written GoFish, so have no first-hand experience with what challenges it presents.

Moppy\_gitlab

[02:30](#msg61fde1544164105ab080751d)I think Go Fish is a trivial program, which I'll test now by trying to write it in python. I don't expect someone else to debug my code, but I think in another language, behavior like an infinite loop is more easily explainable than necessitating general detective work. Every bit of code is kind of self-contained.

greggirwin

[02:34](#msg61fde247708e9c3dd7625f7d)&gt; behavior like an infinite loop is more easily explainable than necessitating general detective work.

We pointed out likely causes for it getting stuck, but without understanding \*all* of your code (the way it's written), we can't guess which part isn't working as \*you* expect in the context of \*this* problem.

ne1uno

[02:36](#msg61fde2b1708e9c3dd762600b)testing is the way too be sure smaller parts work together. document/comments/good naming can only help. probably some function isn't doing what you thought.

greggirwin

[02:37](#msg61fde2feb8b08244821b2ff4)And while I haven't tried to run it, I don't think we can, because an included file isn't in the repo.

Moppy\_gitlab

[02:39](#msg61fde349b8b08244821b30b3)`because an included file isn't in the repo.` what do you mean by that?

[02:39](#msg61fde3524164105ab08078c3)oh, pc.red

ne1uno

[02:39](#msg61fde35703f27047821c6a79)might be `#include %pc.red` From https://rosettacode.org/wiki/Playing\_cards#Red ... comments

Moppy\_gitlab

[02:39](#msg61fde3760779373db8cbd1d5)I've added it

gltewalt:matrix.org

[02:40](#msg61fde3ab708e9c3dd7626181)If I ever take another whack at it, I'm going to model it using object to see how that goes

gltewalt

[03:38](#msg61fdf12341e3293d65d88c44)The first issue is definitely:

```
until [ probe human_hand
				search (choice: request) human_hand 
			]
```

I assume that's where you want to let them keep guessing as long as the guess pip correctly

Moppy\_gitlab

[03:39](#msg61fdf176dc191b3d6996b40b)as long as what you pick is something in your hand

[03:40](#msg61fdf1a2708e9c3dd76279c1)if what you pick is also in the computer's hand(so no go fish), your turn should repeat

gltewalt:matrix.org

[04:00](#msg61fdf65003f27047821c89f3)That part goes into infinite loop because it's never true

[04:01](#msg61fdf68f708e9c3dd76282ad)If you're using find and it returns none, that's a falsey value

[04:01](#msg61fdf6b041e3293d65d896b2)Or, at a point it is no longer ever true

Moppy\_gitlab

[04:02](#msg61fdf6d2a41d896a207d8ca1)@gltewalt:matrix.org trying running it yourself, and you will see what I mean

gltewalt:matrix.org

[04:03](#msg61fdf71d3349fe1c71f6f775)I probably will later tonight sometime

ne1uno

[04:03](#msg61fdf72d6e4c1e1c844b8981)make 'tester a player that chooses random actions

Moppy\_gitlab

[04:09](#msg61fdf870a41d896a207d8f30)making the computer only pick randomly does seem to eliminate the infinite loop

[04:09](#msg61fdf896e4c979478d608db7)is this because request in ai is redefined?

[04:10](#msg61fdf8b1d410244480481793)that would make sense

[04:14](#msg61fdf99ee4c979478d608f75)renaming `request` to `computer_request` in `ai` seems to have fixed it.

[04:19](#msg61fdfac251bd8b580c8a3ec0)if you're importing a lot of libraries, I could see accidentally renaming something and breaking said library being a high risk.

gltewalt:matrix.org

[04:22](#msg61fdfb963349fe1c71f6fd84)That's why `context` is often used

ne1uno

[04:22](#msg61fdfb9cced11857f99489f2)one difference between `func`and `function`, easy ability to step on top level words

[04:30](#msg61fdfd5adc191b3d6996c95d)add /local words or change to function and use /extern to get outside access

bubnenkoff

[11:08](#msg61fe5a9ddc191b3d69976c76)Hi! A theoretical question. What is the difference between a language and a simple set of functions? foo(), bar(),. baz() are not yet a language.

ne1uno

[11:45](#msg61fe63711fe6ba5a970dd66a)is it turing complete, https://en.wikipedia.org/wiki/Turing\_completeness

[11:55](#msg61fe65bb03f27047821d528a)does it have a good name

[13:15](#msg61fe786c708e9c3dd76365cf)to a lesser extent is there a methodology or syntax it invents or inherits. are there design goals. a problem it will solve. is there a rosettacode page.

[13:37](#msg61fe7da13349fe1c71f7ddd8)https://stackoverflow.com/questions/145176/is-html-considered-a-programming-language

[13:55](#msg61fe81e103f27047821d85d7) view, parse and the other DSL in red-lang and Rebol are of this type https://en.wikipedia.org/wiki/Domain-specific\_language

gltewalt:matrix.org

[17:36](#msg61feb58841e3293d65d9e816)@Moppy\_gitlab: ya I'm guessing it was searching a hand to make sure the player had that pip in its hand. But it never did because request wasn't the right value. Then until was never true and it went infinite

[17:38](#msg61feb5fc1fe6ba5a970e6e9e)I want to try something with trace later, so I'll run the broken version

Moppy\_gitlab

[18:05](#msg61febc86ced11857f995e809)@gltewalt:matrix.org I finished the python version. I was pretty rusty(not that I was ever that experienced). I think the biggest difference is how python has some data types that are mutable, so you can change them via parameters using methods, and you can't redefine functions to be something else since they're treated differently from variables. Maybe if I carefully rewrote everything using function instead, and used Red's way declaring global usage of words, it would start working. Python's error messages are also much more helpful in my opinion.

[18:06](#msg61febc8e0779373db8cd55b8)https://github.com/Dry-Leaf/Go-Fish-in-Python

[20:00](#msg61fed75a4164105ab082370e)I wrote this, a bunch of examples to succinctly demonstrate how scope works in Red

[20:00](#msg61fed75b3e52f56a26ece8aa)https://github.com/Dry-Leaf/Red-Behavior-Examples/blob/main/code%20examples.txt

hiiamboris

[20:05](#msg61fed89a51bd8b580c8bd33d)I suggest reading https://github.com/red/red/wiki/\[DOC]-Guru-Meditations#contexts-and-binding

Moppy\_gitlab

[20:09](#msg61fed9883e52f56a26ecec00)I believe in show, not tell.

[20:15](#msg61fedae56e4c1e1c844d2e87)"Rebol just tries to fake them, cloaking itself as a thing that "kinda-sorta looks like an Algol-family language with functions, lexical scope and conventional while loops and stuff". Why should a user care then?

greggirwin

[20:16](#msg61fedb1c6e4c1e1c844d2eef)Examples are great to show \*how* things work. Explanations are needed to show \*why* things work.

[20:19](#msg61fedbb5e4c979478d6228ba)User's only need to care \*sometimes\*, but those times can be important. Most of the time you can treat an electric car like a gas-powered car, but if you run out of battery power, and are stuck at the side of the road, do you blame the car because the full gas can in your trunk doesn't help? :^)

[20:20](#msg61fedc14a41d896a207f319f)Thanks for posting the Python version for comparison.

hiiamboris

[20:20](#msg61fedc1a3e52f56a26ecf071)I think Vladimir left a lot of examples there. And \[here](https://github.com/red/community/blob/master/how-to/spuny-mortals.red)

greggirwin

[20:21](#msg61fedc2f1fe6ba5a970eb7e3)Having done that, did it help you understand what worked different in the Red version, and how it went wrong?

Moppy\_gitlab

[20:22](#msg61fedc69d41024448049a803)yes, but I'd have a hard time fixing the code I already have, so if I try again, I'd rewrite it from scratch

greggirwin

[20:22](#msg61fedc9903f27047821e2c56)That's often how things go, both from the science and craft perspectives.

[20:24](#msg61fedce7dc191b3d69985c16)"Doing" is a good teacher, maybe the best even. A filmmaker's first film, or an author's first book, is rarely their best, or even good sometimes.

Moppy\_gitlab

[20:29](#msg61fede2b1fe6ba5a970ebceb)"You can have \[rock rock rock rock] block where each rock means a different thing, where it is bound to a specific context. Not only that, but you can also change the meaning of any word, simply by altering its binding." How does this affect the readability of code?

hiiamboris

[20:35](#msg61fedf87a41d896a207f3860)Depends on the writer ☻

ne1uno

[20:35](#msg61fedf9f0779373db8cd9604)rr.gg.bb.aa all colors.

greggirwin

[20:41](#msg61fee10b4164105ab0824815)@Moppy\_gitlab I wouldn't have sent you down that path just yet. "This is not the feature you're looking for." but now it can't be unseen.

Consider how words are used in Red. You can see here how `text` has no meaning, but you can use the word in the contexts of `VID` and `draw`, each of which do different things. Here they are just symbols, but the idea holds that the same word can have a different meaning in different contexts.

```
>> text
*** Script Error: text has no value
*** Where: set
*** Near : text
*** Stack:  

>> view [text "Hello!" base 300x100 white draw [text 20x40 "Different meaning here."]]
```

[20:42](#msg61fee12951bd8b580c8be446)

```
view [
	text "Hello!"
	base 300x100 white draw [
		text 20x40 "Different meaning here."
	]
]
```

[20:42](#msg61fee13edc191b3d699863ff)Just clearer formatting.

[20:45](#msg61fee1f003f27047821e370f)It's true that they both "show text", but they operate differently behind the scenes, and their surrounding code in `VID` or `draw` is tailored to each context.

Moppy\_gitlab

[20:46](#msg61fee20ed41024448049b190)sure, but that can be likened to the parameters of functions, or instance variable in objects, in other languages. How does `text` meaning different things in different "contexts" create uniquely Red effects?

[20:47](#msg61fee260708e9c3dd7642b9f)it also reminds me of the fields in html

greggirwin

[20:48](#msg61fee293dc191b3d69986618)As a user, you don't have to write `text-face` and `draw-text` to disambiguate them, with the naming explosion that goes along with that approach. Instead, you build a vocabulary and write expressions, much like we write sentences in natural language, to say what you mean as clearly as possible. This is where `[rock rock rock rock]` says \*why\*, but isn't as helpful on the intent side.

ne1uno

[20:48](#msg61fee2ae51bd8b580c8be81c)the essential thing seems to be a block can hold multiple context, not that you must name them all rock

[20:51](#msg61fee33f3349fe1c71f8a36b)most code is reduced, not from literal scripts. in most other languages you might have a limited painful string eval if anything at all.

greggirwin

[20:53](#msg61fee3bedc191b3d69986890)&gt; that can be likened to the parameters of functions, or instance variable in objects, in other languages

For this aspect, write a baby version of `VID` or `draw` in Python. Doesn't have to generate output, just recognize the input such that work could be done with it. A small subset will do, as they are large dialects.

ne1uno

[21:08](#msg61fee761dc191b3d69986ee7)coming from python, you're probably aware of the potential side effects with un-trusted code. I don't think that problem has been solved anywhere yet. it's always worth mentioning with `eval`

hiiamboris

[21:14](#msg61fee8c803f27047821e4259)bad writing example:

```
c: context compose/deep [
	draw: function [] [
		view [
			image 200x200 (
				draw 100x100 [translate 50x50 rotate 45 line-width 10 pen gold box -40x-40 40x40]
			)
			draw [pen off draw: fill-pen cyan circle 100x100 70]
			rate 5 on-time [draw/2: random cyan]
		]
	]
]
c/draw
```

Moppy\_gitlab

[21:24](#msg61feeb036e4c1e1c844d4ce3)@ne1uno I'm really not "coming from python". The amount of code I've written in each is close to equal.

ne1uno

[21:25](#msg61feeb371fe6ba5a970ed96b)import/include too. plenty of ways.

Moppy\_gitlab

[21:45](#msg61feefffb8b08244821d13a0)what the problem with this?

```
>> storage: []
== []
>> l1: function [] [a: 0 b: 0 c: 0]
== func [][a: 0 b: 0 c: 0]
>> l2: function [] [a: 1 b: 1 c: 1]
== func [][a: 1 b: 1 c: 1]
>> l3: function [] [a: 2 b: 2 c: 2]
== func [][a: 2 b: 2 c: 2]
>> append storage [bind 'a context l3 bind 'b context l2 bind 'c context l1]
== [bind 'a context l3 bind 'b context l2 bind 'c context l3]
>> reduce storage
*** Script Error: context does not allow integer! for its spec argument
*** Where: context
*** Near : 2
*** Stack: context
```

ne1uno

[21:47](#msg61fef06d3349fe1c71f8bebc)`a:2: 4`

Moppy\_gitlab

[21:47](#msg61fef08c03f27047821e50d7)oh, it's spaces

ne1uno

[21:49](#msg61fef107ced11857f99648f6)`==: >>: none` now you can copy &amp; paste examples

Moppy\_gitlab

[21:53](#msg61fef1dae4c979478d6250ab)after adding spaces

[21:53](#msg61fef1e11fe6ba5a970ee59a)

```
*** Script Error: context does not allow integer! for its spec argument
*** Where: context
*** Near : 2
*** Stack: context
```

[21:55](#msg61fef26641e3293d65da55df)I guess saying `context l3` first evaluates l3 and returns an integer

[21:56](#msg61fef2736e4c1e1c844d5989)maybe `context 'l3` ?

[21:56](#msg61fef2a36e4c1e1c844d59d0)

```
*** Script Error: context does not allow word! for its spec argument
*** Where: context
*** Near : 'l3 bind 'b context 'l2 bind 'c context
*** Stack: context
```

[22:00](#msg61fef390b8b08244821d1a08)can I retrieve a word's context, not the word itself or its value?

ne1uno

[22:03](#msg61fef4271fe6ba5a970eeac8)`? context?`

[22:04](#msg61fef47a1fe6ba5a970eeb34)maybe someone else sees how to do this, I don't trust myself with bind

Moppy\_gitlab

[22:06](#msg61fef4d0d41024448049d4cc)

```
>> storage: clear []
>> append storage [bind 'a context context? 'l3 bind 'b context context? 'l2 bind 'c context context? 'l1]
>> reduce storage
*** Script Error: context does not allow object! for its spec argument
*** Where: context
*** Near : 'l3 bind 'b context context? 'l2 bind 'c
*** Stack: context
```

[22:08](#msg61fef55bdc191b3d69988cc2)`The word context is a shorter form of make object!.` Well, what about when the object is already made?

[22:08](#msg61fef5766e4c1e1c844d63ce)maybe leave out `context` ?

[22:11](#msg61fef5ff03f27047821e5cfd)

```
>> storage: clear []
>> append storage [bind 'a context? 'l3 bind 'b context? 'l2 bind 'c context? 'l1]
>> reduce storage
== [a b c]
```

greggirwin

[22:11](#msg61fef60ed41024448049d690)`Make`.

Moppy\_gitlab

[22:15](#msg61fef6e76e4c1e1c844d65c5)`make` needs a spec argument, and `context` is the same as `make object!`

[22:16](#msg61fef74bb8b08244821d20e8)

```
>> reduce make block! storage
== [a b c]
>> storage
== [bind 'a context? 'l3 bind 'b context? 'l2 bind 'c context? 'l1]
```

greggirwin

[22:16](#msg61fef753d41024448049d8bb)Ah, my mistake, I thought `L3` was an object, not a function. Not sure what you're trying to do, but I'm working on other things ATM.

Moppy\_gitlab

[22:18](#msg61fef7cb6e4c1e1c844d6732)I've set words in 3 different functions with different values. I want a to make a block with `a`, `b` and `c` using bind such that the result is `[2 1 0]`

[22:21](#msg61fef853dc191b3d69989243)basically instead of `rural-park` in `append rocks bind 'rock rural-park: context [rock: "mineral"]`, I want to use a context I made elsewhere, specifically a function's context.

hiiamboris

[22:31](#msg61fefad64164105ab0827e0f)just play in console, what does `context? 'l3` return

[22:31](#msg61fefadf51bd8b580c8c1815)it will be MUCH faster than asking

[22:33](#msg61fefb56e4c979478d62647d)you seem to have a heavy habit of trying to build complex things without looking at the small things you're building them out of

greggirwin

[22:41](#msg61fefd1c0779373db8cdcd55)&gt; you seem to have a heavy habit of trying to build complex things without looking at the small things you're building them out of

I had the same thought. Red can be so exciting that people want to run before they can stand.

hiiamboris

[22:43](#msg61fefd94ced11857f9966388)You also should ask yourself, what \*is* the context of a function?

[22:44](#msg61fefde41fe6ba5a970efb1b)Or how can you discover the answer to that without asking us or documentation (imagine console is your only world)?

Moppy\_gitlab

[23:04](#msg61ff02630779373db8cdd75a)Alright, I'll try doing it like that. Though I'm not sure how large adoption of the language would be possible if everyone is expected to do it that way.

greggirwin

[23:07](#msg61ff033c41e3293d65da7433)For comparison with what you're trying to do (function pointers and closures it seems at a glance), I encourage you to write the equivalent code in any other language.

ne1uno

[23:09](#msg61ff0390ced11857f9966e02)you can run and rerun a script

greggirwin

[23:09](#msg61ff039741e3293d65da7502)To @hiiamboris' point, we can show you \*how* (an example of working code), but that won't teach you \*why\*, which has to be learned and internalized if you want to be able to do things on your own.

Moppy\_gitlab

[23:10](#msg61ff03d9e4c979478d627327)@greggirwin I probably wouldn't try doing that, since those have global and local scope, whereas Red's analogue for that is explained in "Guru mediations" with examples that use bind.

[23:10](#msg61ff03ec0779373db8cddab7)so I think "well I have to understand bind now"

greggirwin

[23:15](#msg61ff04fa6e4c1e1c844d8109)In my experience, almost no application/line-of-business code needs to use `bind`. It's one of the most advanced aspects of Red.

But I can't really help with your original problem because you asked:

&gt; what the problem with this?

And showed code with an error. I have \*no* idea what your actual goal is, as far as functionality. What are you trying to accomplish? If it's to understand contexts, great, then you \*do* need to understand `bind`. :^)

Moppy\_gitlab

[23:16](#msg61ff05406e4c1e1c844d816a)Do I \*need* to understand contexts?

[23:16](#msg61ff055ddc191b3d6998ab60)to write applications

greggirwin

[23:17](#msg61ff0593d41024448049f19f)Only at a very basic level. e.g. objects contain words that refer to values in their context.

[23:21](#msg61ff067b51bd8b580c8c2ae1)And that functions can have local words, with the next step being to understand the difference between `func` and `function`, and how to control what's local and what's external to a function. This will lead you to `set` vs set-word syntax, and you're on your way.

Moppy\_gitlab

[23:23](#msg61ff06d6b8b08244821d3d27)So how would you explain the use of `/extern`? https://www.red-by-example.org/#function uses the term `global scope`, but Red does not have not have such a thing. Should `global scope` be replaced with `top-level context`?

greggirwin

[23:28](#msg61ff0810b8b08244821d3fc8)`system context` is a good way to think of it. Kind of in between the two.

[23:29](#msg61ff08466e4c1e1c844d862e)And that should lead you to exploring `system`. :^)

ne1uno

[23:31](#msg61ff08b9e4c979478d627b88)many scripts &amp; examples don't use objects or context just to keep it simple. nobody thinks unrestricted global is better

Moppy\_gitlab

[23:31](#msg61ff08e1b8b08244821d414e)

```
>> context? 'l3
== make object! [
    datatype!: datatype!
    unset!: unset!
    none!: none!
    logic!: logic!
    block!:...
```

This seems to get cut off.

greggirwin

[23:33](#msg61ff09556e4c1e1c844d880a)By default, the console limits output. You can use `probe` or `print mold` to see the full value.

ne1uno

[23:36](#msg61ff09e13e52f56a26ed41cb)`print [mold spec-of :l3 mold body-of :l3]`

Moppy\_gitlab

[23:39](#msg61ff0abe0779373db8cde6b0)I tried probe, the output is extremely massive. `print [mold spec-of :l3 mold body-of :l3]` is less so. Not sure what to make of it though.

[23:40](#msg61ff0ad903f27047821e807e)

```
>> print [mold spec-of :l3 mold body-of :l3]
[/local a b c] [a: 2 b: 2 c: 2]
```

Seems to be just the definition

[23:42](#msg61ff0b6e03f27047821e813f)interesting result

```
>> f1: context function [] [a: 0 b: 0 c: 0]
*** Script Error: context does not allow function! for its spec argument
```

[23:43](#msg61ff0bba51bd8b580c8c34b9)makes sense since context is the same as make object!

[23:45](#msg61ff0c0d1fe6ba5a970f13bd)functions have their own context, but they aren't objects

[23:46](#msg61ff0c57d41024448049fc82)

```
>> f1: function [] [a: 0 b: 0 c: 0]
== func [/local a b c][a: 0 b: 0 c: 0]
>> object? f1
== false
```

[23:52](#msg61ff0dd7ced11857f9967f7f)`Binding is quite a simple concept, I'm still puzzled why people fail to grasp it.`

greggirwin

[23:59](#msg61ff0f52dc191b3d6998bd07)`help mold` `Help` is your friend.

## Sunday 6th February, 2022

greggirwin

[00:01](#msg61ff0fdfa41d896a207f8c93)Others may struggle with `bind` for the same reason you're struggling with a lot of things right now. We're all different.

ne1uno

[00:02](#msg61ff101641e3293d65da8813)concept easy, syntax not so much

Moppy\_gitlab

[00:02](#msg61ff1030d4102444804a03de)if you can bind a word to an object's context, it only makes sense you'd be able to bind a word to a function's context. In fact, https://www.red-by-example.org/#bind says you can. So I tried this

```
>> f: function [] [a: 1]
>> function? :f
== true
```

```
>> storage: []
>> l1: function [] [a: 0 b: 0 c: 0]
>> l2: function [] [a: 1 b: 1 c: 1]
>> l3: function [] [a: 2 b: 2 c: 2]
>> append storage [bind 'a :l3 bind 'b :l2 bind 'c :l1]
>> reduce storage
== [a b c]
>> reduce reduce storage
*** Script Error: context for b is not available
```

greggirwin

[00:07](#msg61ff1153dc191b3d6998c06e)&gt; if you can `X`, it only makes sense you'd be able to `Y`

Only in very simplistic scenarios. You'll also learn that the `system` context is special in some ways. Red aims to be consistent, but not to the exclusion of things making sense in other ways. And sometimes consistency in one way contradicts consistency in another.

[00:09](#msg61ff11c54164105ab082a59c)You need to learn to explore, piece by piece, so when you hit an error, you can build an understanding of why it occurred. e.g. what is the result of `reduce storage`?

Moppy\_gitlab

[00:10](#msg61ff11eb3349fe1c71f8f82f)This works actually

```
>> storage: []
>> o1: context [a: 0 b: 0 c: 0]
>> o2: context [a: 1 b: 1 c: 1]
>> o3: context [a: 2 b: 2 c: 2]
>> append storage [bind 'a :o3 bind 'b :o2 bind 'c :o1]
>> reduce reduce storage
== [2 1 0]
```

[00:12](#msg61ff126e708e9c3dd7648b0e)"what is the result of reduce storage?" just \[a b c] it seems.

[00:14](#msg61ff12d241e3293d65da8c8f)So functions's context and object's context, are somehow different.

greggirwin

[00:26](#msg61ff15a13e52f56a26ed5709)&gt; just `[a b c]` it seems

Explore. Explore. I implore you to explore. Right now you're just banging around, and that won't serve your happiness long term.

[00:31](#msg61ff16ff41e3293d65da9343)The best thing we can probably do right now is to take a break from responding. That will force you to do more on your own and think through things.

Moppy\_gitlab

[00:40](#msg61ff18fa41e3293d65da9608)Well if I figure it out, I'll make sure to write it down so others don't have to go through the trouble.

[01:50](#msg61ff2957e4c979478d62b16c)Searching through this gitter, somebody else asked something similar before about what "context for x is not available" means.

&gt; @9214 if you can get the context with `context?` and then get error that `context is not available`, there's some contradiction, don't you think?

&gt; Neither objects nor functions are contexts by themselves. Objects are thin wrappers over contexts which are allocated on the heap, and function's contexts are mapped on call stack during function call, and disappear once function is evaluated.

&gt; @rebolek I don't see any contradiction, and already explained (twice) how it works. `context?` gives you a value (`object!` or a `function!`) that refers to internal `context!` value. `object!`'s context are allocated on the heap and are present during whole lifetime of a script (or until next GC sweep). `function!`'s contexts come and go to/from call stack together with function calls.

&gt; I think if the error message said something like \*context is not \*\*currently\** available\*, it would make more sense.

&gt; @rebolek not really. To me this implies that it may become \*eventually* available sometime in the future, but doesn't clarify when and how. So, if you want a less puzzling error, it should say something like "context for &lt;foo&gt; is available only during function call", but then it's up to a user to figure out which function is in question. Or error message can remain untouched (whatever you say it's fairly accurate), and contexts workings should be covered in documentation.

[01:51](#msg61ff2994ced11857f996ae96)This was discussed about 3 years ago

[01:51](#msg61ff29b941e3293d65dab45e)I don't know how using ? a bunch of times would explain all that, but it's good to know.

[01:52](#msg61ff29ccdc191b3d6998e741)`So functions's context and object's context, are somehow different.` looks like I was right

[02:13](#msg61ff2eb20779373db8ce240c)

```
storage3: []
sf: function [] [a: [1] append a 2]

append storage3 [bind 'a :sf]
reduce storage3
```

`a` in `sf` is within `sf`'s context, yet every time `sf` is called, `a` changes value. Nonetheless, `a`'s value cannot be accessed through storage3. Maaaaaaybe, `a` in `sf` points to somewhere else, where its value is stored, but only during a function call. So `sf` kind of opens communications during a function call, and after, communications are closed.

greggirwin

[03:58](#msg61ff475751bd8b580c8c9a09)&gt; a in sf is within sf's context, yet every time sf is called, a changes value.

Have you read the "Why you have to copy..." wiki page that's been mentioned a few times?

[04:14](#msg61ff4b31b8b08244821db06c)&gt; I don't know how using ? a bunch of times would explain all that

When you jumped out of the plane and started screaming on the way down, we yelled "Use your parachute!" When you got back in the plane, we said "Maybe start with the plane on the ground, to get used to landing and rolling." &lt;takeoff jump screaming&gt; "A jump buddy might be a good option." &lt;takeoff jump screaming&gt;

It pains us to see you suffer so much, and we'd love for you to enjoy the view and feel like you're flying, but don't know what else to suggest.

[04:31](#msg61ff4f386e4c1e1c844e04c4)&gt; How does text meaning different things in different "contexts" create uniquely Red effects?

@Moppy\_gitlab I answered your question in red/red. Let me know what you think. Does it help? It's only one of a zillion possibilities of course.

[04:32](#msg61ff4f4541e3293d65daf550)Maybe others will create samples and we can make a wiki page for them.

Moppy\_gitlab

[06:20](#msg61ff68ac6e4c1e1c844e2ec8)&gt; Have you read the "Why you have to copy..." wiki page  
Yes. I don't see these two statements can be consolidated though. `Inside the function! value, the spec and body blocks are still there, and they are still data.` `function's contexts are mapped on call stack during function call, and disappear once function is evaluated`

[06:22](#msg61ff691941e3293d65db20e0)How is the data "still there", if the context disappears?

[06:35](#msg61ff6c184164105ab0833ba1)the example in red/red is interesting. I'm not too sure how collect and keep/all work generally.

[06:36](#msg61ff6c7951bd8b580c8cd887)the examples here are pretty limited. https://www.red-by-example.org/#collect so maybe rebol docs are needed.

greggirwin

[06:44](#msg61ff6e50b8b08244821dec8e)&gt; I'm not too sure how collect and keep/all work generally.  
&gt; ...so maybe rebol docs are needed.

I'm still at my desk, and I can't seem to `help` myself from \*trying* to `help` you, so...play...in the console...with \*small, easy* bits of code. \*Learn* how `collect` works. It's pretty cool, and very useful. You won't learn if you don't try.

[06:55](#msg61ff70f0ced11857f9972311)My final plea this evening is to forget that the words `context` and `bind` even exist. You're trying to dive deep and you can't even swim.

pekr

[07:00](#msg61ff71f903f27047821f2bef)guys, do we really like the `context?`not returning a logic value? I would so much prefer `context-of`instead. Well, but then we've got `index?`and other functions too ...

greggirwin

[07:05](#msg61ff734d4164105ab08348c2)Let's not go there @pekr, it's a long dark road we've walked many times. ;^)

https://github.com/red/red/issues/255

You can skip to the last comment from @dockimbel.

pekr

[08:31](#msg61ff877f4164105ab08369e7)@Moppy\_gitlab you can as well use directly `append storage reduce [bind 'a :o1]`

[08:34](#msg61ff881741e3293d65db584a)I was not able to easily bind to the function. I have found two articles, when googling - first one, points out the (big) differences between the R2 and R3: https://stackoverflow.com/questions/14818324/what-is-the-summary-of-the-differences-in-binding-behaviour-between-rebol-2-and , the second one is from the rebol guru Ladislav, but most probably it refers to R2 https://github.com/r3n/rebol-wiki/wiki/Bindology

[08:37](#msg61ff88e541e3293d65db59a0)The topic is apparently big. In context of the first article, I just wonder, where between the R2 and R3, Red stands. We've got e.g. `self`too, but it might have a different meaning. We can't extend objects, while R3 can, etc.

Moppy\_gitlab

[15:35](#msg61ffead9dc191b3d699a38df)

```
help keep
No matching values were found in the global context.
```

[15:36](#msg61ffeb03d4102444804b8b75)

```
? keep
No matching values were found in the global context.
```

[15:38](#msg61ffeb72e4c979478d640f35)and `help collect` doesn't really explain how `keep` works. Right now, all I know is that if you already have a block with `keep` inside of it, `collect` will "keep" those. Not too useful.

[15:40](#msg61ffebeaced11857f99804f6)I guess `keep` is only in `collect`'s context. Can help be used for things not in the `global context`?

[15:50](#msg61ffee4bced11857f9980a74)

```
>> ?? collect
collect: func [
    {Collect in a new block all the values passed to KEEP function from the body block}
    body [block!] "Block to evaluate"
    /into {Insert into a buffer instead (returns position after insert)}
    collected [series!] "The buffer series (modified)"
    /local keep rule pos
][
    keep: func [v /only] [either only [append/only collected v] [append collected v] v]
    unless collected [collected: make block! 16]
    parse body rule: [
        any [pos: ['keep | 'collected] (pos/1: bind pos/1 'keep) | any-string! | binary! | into rule | skip]
    ]
    do body
    either into [collected] [head collected]
]
```

From what I see here, `keep` has no `all` refinement. The example in red/red though, uses `keep/all`.

gurzgri

[15:50](#msg61ffee58a41d896a20811612)You can use

```
help
```

in

```
collect
```

's context like so:

```
collect [help keep]
```

. However, the help this gets you is a bit disappointing. At least it points you to the

```
/only
```

refinement

```
keep
```

has, a secret which

```
collect
```

keeps very well (pun intended).

Moppy\_gitlab

[15:51](#msg61ffee9f4164105ab084286f)huh, that example only uses `keep/only`. Maybe I remembered wrong.

gurzgri

[15:53](#msg61ffeedc6e4c1e1c844f2232)

```
collect [keep [1] keep/only [2]] ;= [1 [2]]
```

rebolek

[15:55](#msg61ffef65e4c979478d6416a3)`collect [help keep]` is a clever trick. I guess that help string should be added to the internal `keep` function.

Moppy\_gitlab

[15:55](#msg61ffef733349fe1c71fa7bac)ahhh. I see you can actually put loops in `collect`.

[15:56](#msg61ffefaf1fe6ba5a9710a90d)or rather, use loops as a parameter for `collect`

rebolek

[15:57](#msg61ffeffcd4102444804b945f)you can put any code in the `collect`'s `body`

Moppy\_gitlab

[16:01](#msg61fff0c03349fe1c71fa7dc9)

```
>> a: [1 2 3]
>> collect [foreach numb a [keep numb]]
== [1 2 3]
```

[16:03](#msg61fff150dc191b3d699a47c5)I didn't know collect actually evaluates the block

[16:04](#msg61fff1914164105ab0842cf6)I think it'd be helpful to add that point to `help collect`

rebolek

[16:05](#msg61fff1ae03f2704782201844)That's actually standard behavior in Red, blocks are passed to a function that evaluates it. See `do`, `until`, `foreach`, ...

[16:06](#msg61fff20e4164105ab0842e2d)The length of the help string isn't theoretically limited but it's a good practice to keep it short (&lt;80 chars) so there's only so much info that you can fit in.

Moppy\_gitlab

[16:07](#msg61fff2461fe6ba5a9710ae17)`copy`, `extract` and `sort` don't evaluate the block they're given.

[16:08](#msg61fff293b8b08244821edf29)As a side note, which functions return a new block, and which modify the block given to them, has been a bit hard to keep track of.

rebolek

[16:10](#msg61fff31303f2704782201b21)True. It would be nice to improve the function specs with some tags like `#modifies` and `#evaluates` or something like that so it would be easier to see what you can expect.

gurzgri

[16:11](#msg61fff32dced11857f998138c)Functions modifying the series supplied usually have some sort of a "(modified)" warning in their help string.

hiiamboris

[17:10](#msg620000f86e4c1e1c844f46f7)&gt; I didn't know collect actually evaluates the block

```
>> ? collect
...
ARGUMENTS:
     body         [block!] "Block to EVALUATE."
...
```

(emphasis mine)

greggirwin

[20:28](#msg62002f72e4c979478d649078)One of our goals for this year is Red specifications. One of my goals in that area is to push for advances and ties to documentation systems, both reflectively and from tagged data.

cloutiy

[20:45](#msg620033793e52f56a26ef5b57)Today i thought of creating a `pure-function` that wraps `function` and makes a copy of non-scalar arguments. I.e. `myfunc: pure-function [a b ] [ ...]`

gltewalt

[20:49](#msg62003468a41d896a20819c65)Other fun stuff with funcs (which consist of blocks of words):

```
l3: function [] [a: 2 b: 2 c: 2]
set 'blk body-of :l3
blk/c: 99

>> :l3
== func [/local a b c][a: 2 b: 2 c: 99]

>> l3
== 99

>> clear spec-of :l3
== []

>> :l3
== func [][a: 2 b: 2 c: 99]

clear blk change blk [dir]

;-- now what does l3 do?
```

[20:50](#msg620034923349fe1c71fafd41)Just playing around is fun

greggirwin

[21:04](#msg620037f7b8b08244821f5c4c)Playing \*is* fun. :^) I will ask if we can change from using `l3` as a name, because it looks like `13`. The other thing I'll note is that advanced coding patterns may trip up the compiler, so if you want to compile your apps (remember `encap` is your friend here), keep it simple.

Moppy\_gitlab

[23:26](#msg6200591a6e4c1e1c844fe2a1)

```
>> f: function [] [a: 2 b: 2 c: 2]
== func [/local a b c][a: 2 b: 2 c: 2]
>> clear spec-of :f
== []
>> f
== 2
```

Interesting how `function` evaluates to a `func` with the `\local` refinement. `f` still works after clearing its spec though.

gltewalt:matrix.org

[23:34](#msg62005b14708e9c3dd766dd69)That particular function returns the last value, 2, so it wouldn't matter.

gurzgri

[23:37](#msg62005ba0ced11857f998db87)Clearing the spec of `f` doesn't rebind f's body to a new function context, so `a`, `b`, `c` are still bound to the original context of `f`. You can check with `keys-of :f ;== [local a b c]`. Therefore, even after clearing the spec, `f` doesn't set `a` in the global context:

```
>> f
== 2
>> a
*** Script Error: a has no value
```

## Monday 7th February, 2022

Moppy\_gitlab

[02:23](#msg6200828bdc191b3d699b56dc)

```
b: 1
f2: func [] [b: 3 print b]
f2
b
== 3
```

I see.

[02:25](#msg620083336e4c1e1c84502a40)What's up with this then?

```
>> a: 9
== 9
>> f: function [] [a: 2]
== func [/local a][a: 2]
>> clear spec-of :f
== []
>> ?? f
f: func [][a: 2]
>> f
== 2
>> a
== 9
>> f2: func [] [a: 2]
== func [][a: 2]
>> f2
== 2
>> a
== 2
```

[02:26](#msg62008361a41d896a20822d39)after `f`'s spec is cleared, it's the same as `f2`, yet its effect on `a` in the global context isn't the same.

[02:29](#msg620084233349fe1c71fb8b6a)I suppose this is the difference?

```
>> keys-of :f
== [local a b c]
>> keys-of :f2
== []
```

the difference between `key` and `spec` is kind of odd

[02:34](#msg62008535b8b08244821fe408)in @gltewalt 's example, `l3`'s spec actually didn't need to be cleared.

[02:40](#msg6200869d6e4c1e1c84502f77)This has similar behavior to a function's local words, but the keys-of value returns something different.

```
>> con: context [a: 5]
== make object! [
    a: 5
]
>> keys-of con
== [a]
>> a
*** Script Error: a has no value
```

spec-of returns something very mysterious when used on an object

```
>> spec-of con
*** Internal Error: reserved for future use (or not yet implemented)
```

[02:43](#msg620087524164105ab0853d32)

```
>> reflect con 'body
== [
    a: 5
]
>> reflect con 'spec
*** Internal Error: reserved for future use (or not yet implemented)
```

greggirwin

[03:01](#msg62008b920779373db8d09665)Not mysterious at all. Did you read the message?

gltewalt:matrix.org

[03:05](#msg62008c6b708e9c3dd76734b9)Example of manipulating data, and stuff you might be surprised you can do. Not that spec needed to be cleared

greggirwin

[03:06](#msg62008cce03f2704782213575)Maybe we need a red/voodoo group.

gltewalt:matrix.org

[03:07](#msg62008d0603f27047822135d5)My guess was that it 'might' have strange effects in subsequent calls, but I didn't know. And by your latest example, is there something afoot, or not?

[03:08](#msg62008d420779373db8d09943)remember that func and function are different

[03:09](#msg62008d61e4c979478d65350b)red/deep

[03:17](#msg62008f2f3349fe1c71fb9e3b)system level `a` was set again by system level `a` in func.  
Need `/local` refinement, or use `function`

[03:17](#msg62008f5a3349fe1c71fb9e7c)your `f2` example

Moppy\_gitlab

[03:23](#msg6200909c708e9c3dd7673c09)func and function are different, but `function` seems to be "represented" by `func`'s with `/local`, judging by the output of writing a `function` in the repl

ne1uno

[03:24](#msg620090e551bd8b580c8ee667)older repl too

Moppy\_gitlab

[03:25](#msg620091100779373db8d09fb4)and seeing a feature that's, "not implemented yet", maybe? is a new experience for me

[03:26](#msg620091623349fe1c71fba293)will it be implemented?

[03:26](#msg6200916541e3293d65dd36bb)I don't know

[03:29](#msg62009211a41d896a208246c9)

```
>> f: function [] [a: 2 b: 2 c: 2]
== func [/local a b c][a: 2 b: 2 c: 2]
```

if `f` is still different than a `func` with a `/local` refinement, shouldn't that say something different?

ne1uno

[03:30](#msg62009247e4c979478d653e90)`function` collects /local for you

Moppy\_gitlab

[03:33](#msg620092f83349fe1c71fba526)

```
>> f2: func [/local a] [a: 1]
>> a: 9
>> f2
>> a
== 9
>> clear spec-of :f2
>> f2
>> a
== 9
```

huh

[03:35](#msg62009399a41d896a20824a32)

```
>> keys-of :f2
== [local a]
```

now I wonder if there's a way of changing keys since clearing the spec doesn't seem to do anything(at least after the function is executed once?)

[03:40](#msg620094c2b8b08244821ffe1e)

```
>> clear keys-of :f2
== []
>> f2
== 1
>> a
== 9
>> keys-of :f2
== []
```

[03:42](#msg620095396e4c1e1c845048f8)so neither clearing keys nor spec makes `a` in `f2` not local anymore.

gltewalt

[04:30](#msg6200a07da41d896a2082601d)

```
>> f2: func [/local a][a: 1]
== func [/local a][a: 1]

>> a: 9
== 9

>> f2
== 1

>> a
== 9

>> clear spec-of :f2
== []

>> f2: do load mold/only :f2
== func [][a: 1]

>> a
== 9

>> f2
== 1

>> a
== 1
```

Moppy\_gitlab

[05:44](#msg6200b1b14164105ab08584d9)So you've got to clear f2's spec, then set f2 to the the executed loaded string of itself, then execute f2.

[05:48](#msg6200b2c41fe6ba5a97120f8f)why is `load mold/only` necessary?

[05:49](#msg6200b2ceb8b0824482202eb8)

```
>> mold/only :f2
== "func [][a: 1]"
>> load mold/only :f2
== [func [] [a: 1]]
>> do load mold/only :f2
== func [][a: 1]
>> a
== 9
>> do :f2
== func [][a: 1]
```

[05:49](#msg6200b2f31fe6ba5a97120fec)

```
>> f2: do :f2
== func [][a: 1]
>> f2
== 1
>> a
== 9
```

[05:52](#msg6200b398e4c979478d657abf)I guess do doesn't "clear" whatever is stuffed inside of `f2`, so you got to "remake" f2 in a two step process?

bubnenkoff

[08:31](#msg6200d8eaced11857f999bc69)

```
letters: charset [#"a" - #"z" #"A" - #"Z"]
```

Is there any way to more specify letters in all code-pages (cyrillic etc) at once?

Oldes

[08:48](#msg6200dcde41e3293d65ddbb4b)@Moppy\_gitlab `mold/load` is buggy/unfinished in Red...  
in Red:

```
>> str: mold/all :f2
== "func [/local a][a: 1]"
>> blk: load/all str
== [func [/local a] [a: 1]]
>> type? first blk
== word! ;<--- it is not function loaded.. so you must first reduce/do the blk
```

while in Rebol:

```
>> str: mold/all :f2
== "#[function! [[/local a][a: 1]]]"
>> blk: load/all str
== [make function! [[/local a][a: 1]]]
>> type? first blk
== function! ;<--- you already have the function in the blk
```

[08:50](#msg6200dd70b8b0824482207cfa)@bubnenkoff nothing inbuild... who knows, what are your expected cyrillic chars? You must find \[Unicode table](https://en.wikipedia.org/wiki/Cyrillic\_script\_in\_Unicode) and use data from it to make your charset.

[08:55](#msg6200de94b8b0824482207fe5)

```
cyrillic-letters: charset [#"^(0410)" - #"^(042F)" #"^(0430)" - #"^(044F)"]
parse "Чаи" [some cyrillic-letters] ;<== true
```

bubnenkoff

[09:01](#msg6200dfe3e4c979478d65cfb2)@Oldes thanks!

```
letters: charset [#"a" - #"z" #"A" - #"Z" #"а" - #"я" #"А" - #"Я"]
```

Also works

Oldes

[09:02](#msg6200e027d4102444804d5693)Of course... if you know your alphabet, you may skip the \_search table_ step ;-)

[09:06](#msg6200e1073e52f56a26f092f6)@Moppy\_gitlab being able to do `clear spec-of :f2` I consider as a security issue, while others think that it is a \_feature\_.

hiiamboris

[09:32](#msg6200e71851bd8b580c8f8898)Having 'write' function is also then a security issue?

Oldes

[09:41](#msg6200e93fb8b08244822096f5)It definitely is... without `secure` dialect at least in the state like it was in Rebol2. But here is not right place for such a talk (and I don't want to have it). I just think, that have modifiable access to function internals is a path to problems instead of something useful.

Moppy\_gitlab

[16:05](#msg62014344dc191b3d699cd20d)Okay. I'm asking all this out of curiosity for one. But also because I'd like to be able to quickly explain and demonstrate what I think are "pain points" for people who would be new to Red. Stuff like order of operations and context are the most important things to clarify first in my opinion, because they're the most likely to trip a person up. Specific key words for features like `union`, or lesser used data types, can always be looked up later, so are less important.

[16:32](#msg620149a741e3293d65de9a3a)Nobody is going to assume they have to use `clear`, so when they inevitably do, it WILL trip them up and that WILL frustrate them. Avoiding that situation in the first place would a be a good thing I think.

hiiamboris

[16:34](#msg62014a2a708e9c3dd768a86b)We always point newcomers to that `copy` wiki page.

Moppy\_gitlab

[16:40](#msg62014b8f41e3293d65de9e1a)That's a problem in my opinion. An introduction to the language should mention why `clear` (or `copy`) is necessary. Being relegated to some buried wiki page is not optimal.

gltewalt:matrix.org

[16:47](#msg62014d0dd4102444804e3e59)There's no introduction in the official docs.

Moppy\_gitlab

[16:50](#msg62014ddf1fe6ba5a97134cce)Is the wiki the "official docs"?

hiiamboris

[16:52](#msg62014e3903f270478222acc5)http://w.red-lang.org/

Moppy\_gitlab

[16:54](#msg62014eaa0779373db8d2172c)Okay then. Not really related.

gltewalt:matrix.org

[16:56](#msg62014f46e4c979478d66bee0)http://www.rebol.com/docs/core23/rebolcore-6.html

[16:56](#msg62014f4b41e3293d65dea5be)Section 5.3

hiiamboris

[16:56](#msg62014f51b8b0824482216bc8)Nobody has written a howto/guide that fits everyone's need yet. http://helpin.red is an okay attempt, Galen's \[Python 2 Red](https://github.com/red/red/wiki/A-short-introduction-to-Red-for-Python-programmers) for more narrow audience, https://learnxinyminutes.com/docs/red/ IMO needs rework/extension.  
R2 manual is still the winner IMO (by far).

rebolek

[17:08](#msg62015200ced11857f99abc26)R2 manual is \*\*The\** book.

gltewalt:matrix.org

[17:11](#msg620152a951bd8b580c9068bf)Too bad we can't get rights permission for official Edited for Red edition

Moppy\_gitlab

[17:11](#msg620152be708e9c3dd768be16)Maybe I'll try writing one too then, for people with less patience. It's a little concerning that a manual for R2 is pointed to since `mold` works differently in Red. And people will question if it wouldn't be easier to just use R2 or R3.

hiiamboris

[17:13](#msg62015332dc191b3d699cf770):+1: best of luck

gltewalt:matrix.org

[17:16](#msg620153d7dc191b3d699cf99b)It's 90% compatible, or somewhere in there, so not too concerning.

hiiamboris

[17:19](#msg620154a1ced11857f99ac18f)Someone was meticulous enough to list the wrongs in R2 manual: https://github.com/red/red/wiki/%5BDOC%5D-REBOL-Core-Users-Guide-\_\_-A-walkthrough-with-Red

gltewalt:matrix.org

[17:20](#msg620154d41fe6ba5a97135dcd)Yeah, I did, but hasn't been audited in a long time. May need edits

[17:21](#msg620155131fe6ba5a97135e3f)I could bring it up to date, and finish it. But... if it's not official docs will people still complain?

[17:23](#msg62015581e4c979478d66ccd4)I can see right away that the money parts are different now

hiiamboris

[17:25](#msg6201562141e3293d65deb5a5)https://crypticwyrm.neocities.org/learningred/ good attempt at a guide too, although too wordy to my taste

[17:34](#msg62015815ced11857f99ac998)Since playing is learning maybe guide should be an interactive Red program with small realistic tasks after each portion of info :)

Moppy\_gitlab

[18:05](#msg62015f52708e9c3dd768daec)Haskell has something similar on their front page. https://www.haskell.org/

hiiamboris

[18:16](#msg620161fa6e4c1e1c8451e480)Yeah, a good one.

Moppy\_gitlab

[19:51](#msg6201784a708e9c3dd76912bc)What is the deal with this?

```
>> f: function [hand] [hand: exclude hand [2]]
== func [hand][hand: exclude hand [2]]
>> f a
== [1 3]
>> a
== [1 2 3]
>> f: function [hand] [append hand 9]
== func [hand][append hand 9]
>> f a
== [1 2 3 9]
>> a
== [1 2 3 9]
```

[19:52](#msg62017877a41d896a2084106a)I guess setting through a parameter doesn't change was what passed to the parameter

hiiamboris

[19:53](#msg620178b8e4c979478d671dc5)`hand:` just makes the local word `hand` point to a new series

Moppy\_gitlab

[19:53](#msg620178d703f2704782230c53)except this works

```
>> a: [0]
== [0]
>> f: function [series] [series/1: series/1 + 1]
== func [series][series/1: series/1 + 1]
>> f a
== 1
>> a
== [1]
```

gurzgri

[19:54](#msg620178f10779373db8d279a5)There you are modifiying the series, not the word bound to a series.

Moppy\_gitlab

[19:55](#msg6201793ab8b082448221cb6b)

```
>> a: [1 2 3]
== [1 2 3]
>> f: function [hand] [:hand: exclude hand [2]]
*** Syntax Error: (line 1) invalid word at :hand: exclude hand [2]]
*** Where: set
*** Near : :delimiter-lex
*** Stack: load
```

[19:56](#msg6201795c3349fe1c71fd7971)not sure what I can do in this situation

[19:57](#msg620179923e52f56a26f1e3be)literal word?

hiiamboris

[19:57](#msg6201799fa41d896a208412e1)indeed, how would you put a \*new* series into the one pointed to by `hand`?

gurzgri

[19:59](#msg62017a0d708e9c3dd7691654)

```
>> f: function [hand] [head clear insert hand exclude hand [2]]
== func [hand][head clear insert hand exclude hand [2]]
>> a: [1 2 3]
== [1 2 3]
>> f a
== [1 3]
>> a
== [1 3]
```

[19:59](#msg62017a2ea41d896a2084142c)If modifiying `hand` is applicable, that is.

Moppy\_gitlab

[20:03](#msg62017b1c41e3293d65df04ec)what does `head clear` do?

greggirwin

[20:04](#msg62017b35b8b082448221cf9e)`Help`!

hiiamboris

[20:04](#msg62017b3f03f27047822311fc)indeed :)

gurzgri

[20:05](#msg62017b8fdc191b3d699d5609)I'm inserting exclude hand \[2], which returns the series after ther insertion. From there to tail I'm clearing the series and returning it at it's head.

Moppy\_gitlab

[20:05](#msg62017b9f51bd8b580c90c54f)okay, so it's because insert positions the series after the insert

[20:06](#msg62017be00779373db8d27f4a)and insert puts new values at the beginning

gurzgri

[20:13](#msg62017d8741e3293d65df09dc)But what if the series bound to `hand` itself isn't positioned at it's head? Then above `f` gives wrong result, a better solution would be:

```
>> a: next [0 1 2 3 4] ;== [1 2 3 4]
>> f: function [hand] [clear insert hand exclude hand [2]  hand] ()
>> f a  ;== [1 3 4]
>> a ;== [1 3 4]
>> head a; == [0 1 3 4]
```

This leaves the series position intact.

Moppy\_gitlab

[20:15](#msg62017de451bd8b580c90cac0)Rewrote my Red go fish program. It seems to work now.

[20:15](#msg62017de5dc191b3d699d5b00)https://github.com/Dry-Leaf/Go-Fish-in-Red/blob/main/gofish.red

greggirwin

[20:17](#msg62017e6451bd8b580c90cba0)`Help`! And \*play\*. In the console, define a block, and see how each series action it supports work. Use `help action!` for a list of all actions (not just series related). Take functions out of the equation entirely. Learn how words work. How does each form behave, why does `get-word!` even exist?

Then feel free to write scripts that let you perform actions and see their results. What happens if a series isn't at it's head when you do action X? How do you find where you are in a series?

I think if you do this, you'll enjoy Red more, and save us all a lot of time. Because then you'll start asking more interesting questions. ;^)

Moppy\_gitlab

[20:19](#msg62017eb6ced11857f99b1dd4)Am I abusing functions, or doing things unidiomatically?

greggirwin

[20:21](#msg62017f524164105ab0872928)I'm just talking about basic understanding. As I've said before, you're trying to run before you can walk. That's OK if you realize that it's not going well, and maybe you need to learn walking first. Do that.

gltewalt:matrix.org

[20:23](#msg62017fd251bd8b580c90cf57)He wants you to explore actions on series! values (block, string, etc) in the Red console. And to get familiar with `help` in the Red console.

Moppy\_gitlab

[20:24](#msg62017fec708e9c3dd769214c)Is writing command line programs with basic user interactivity considered running?

[20:25](#msg6201804441e3293d65df1064)realized I can make setup a block and then `do` it

greggirwin

[20:30](#msg6201814e41e3293d65df1305)@Moppy\_gitlab The app goal itself is fine. But then you went off into reflective func spec handling, and asking simple questions that you can easily answer yourself (learning much more in the process) by using `help`. For everyone's long term benefit, we will help new people started, but very quickly encourage them to become more self-sufficient. If you get into the habit of asking for answers every time, rather than trying to \*find* them yourself, you'll get less and less answers over time. Help us to help you, by making the best use of our time.

hiiamboris

[20:37](#msg620182f1b8b082448221e4e4)I would add that this `ask -> try -> think` pattern looks like a parenting issue to me. If you immediately give your child all the answers and do not encourage it to play or give time to come with own answers, eventually this way of learning prevails over the others and becomes a life habit. One that is not particularly useful anymore, but gets repeated automatically. A huge share of our behavior is defined this way unless we consciously reprogram ourselves.

Moppy\_gitlab

[20:37](#msg620183254164105ab08732e4)Less parents than google.

hiiamboris

[20:39](#msg6201837fdc191b3d699d66a9)Well, google facilitates this to an extent but by the time we learn to google usually our habits are in place already.

greggirwin

[20:43](#msg62018468708e9c3dd7692d72)When we build our help line chat system, we'll make that a feature. After you ask a question, a period of time or tracked "tries" have to pass before you can ask another. :^)

gurzgri

[20:46](#msg6201851de4c979478d673c13)Seeing how you immediately copy'n'pasted the above `head clear insert hand exclude hand record` code golf line into your script is neither walking nor running, its just rushing. In the context of your script `head` is totally superfluous, because you're not using the position it returns anywhere.

Moppy\_gitlab

[20:55](#msg62018755d4102444804ec6d7)Alright

```
if counter = 4 [
			rem_cards: exclude hand record
			clear insert hand rem_cards
```

[20:57](#msg620187cc3349fe1c71fd9988)In your second to last example, head didn't do anything either.

[20:58](#msg620187fae4c979478d674113)

```
>> a: [1 2 3]
>> f: function [hand] [clear insert hand exclude hand [2]]
>> f a
== []
>> a
== [1 3]
```

I'm sure this difference is important in some contexts, but not when you just want to change `a`

[22:10](#msg620198c751bd8b580c9104bf)what? The function return an empty block, but I don't care about that in my context. `clear` is so this doesn't happen

```
>> f a
== [1 2 3]
>> a
== [1 3 1 2 3]
```

Oldes

[22:10](#msg620198db4164105ab0876384)Sorry... I was wrong. I had too many beers today.. better be silent ;-)

[22:18](#msg62019a9d708e9c3dd7695dcf)Result of `exclude hand [2]` is `[1 3]`, which you insert to the hand, so you get `[1 3 1 2 3]`, but insert returns result at tail, so you clear the `[1 2 3]` part and see empty block.. but at tail... and `a` is `[1 3]`

[22:19](#msg62019ae74164105ab0876785)

```
>> f: function [hand] [probe head probe clear probe insert probe hand probe exclude hand [2]]
>> f a: [1 2 3]                                                                               
[1 2 3]
[1 3]
[1 2 3]
[]
[1 3]
== [1 3]
```

hiiamboris

[22:21](#msg62019b4f03f2704782235df2)

```
>> trace/all/deep [f a]
    a                               => [1 2 3]                              
      hand                          => [1 2 3]                              
      hand                          => [1 2 3]                              
      exclude hand [2]              => [1 3]                                
      insert hand [1 3]             => [1 2 3]                              
      clear []                      => []                                   
      head []                       => [1 3]                                
    f a                             => [1 3]                                
== [1 3]
```

[22:22](#msg62019ba803f2704782235e97)fixed, thanks

[22:23](#msg62019bde3e52f56a26f22b2e)looks like a glitch on `clear []`

greggirwin

[22:24](#msg62019c10a41d896a20846342)@hiiamboris :+1:

[22:24](#msg62019c353349fe1c71fdc16a)This is your updated `trace`, right, not merged yet?

hiiamboris

[22:25](#msg62019c41ced11857f99b5f93)no, it's the one in the master

greggirwin

[22:25](#msg62019c5c6e4c1e1c84526e18)Ah, my mistake. Thanks.

hiiamboris

[22:25](#msg62019c5eced11857f99b600b)glitch on clear happens because that series is not in the original block, so it is not copied

[22:25](#msg62019c74a41d896a20846460)no idea how to solve it with reasonable amount of effort

greggirwin

[22:26](#msg62019c8d51bd8b580c910cac)I had pasted a different `f` from here, so got extra output.

Oldes

[22:26](#msg62019c8fdc191b3d699d9bd2)@Moppy\_gitlab one good thing to know:

```
>> a: [1 2] insert a 0
== [1 2]
>> a
== [0 1 2]
>> a: [1 2] append a 0 
== [1 2 0]
>> a
== [1 2 0]
```

## Tuesday 8th February, 2022

BuilderGuy1

[20:47](#msg6202d6e4708e9c3dd76bdfa0)I need some help with drop-down lists. The list of items I want to display is in a predefined block.  
The problem is that it displays nothing if the block is defined before VIEW and an error if the block is inside of VIEW.  
Surely there is something simple I'm leaving out.

endo64

[20:53](#msg6202d867dc191b3d69a01992)Can you share your code?  
This one works for me: `b: ["one" "two" "three"] view [drop-down 250 data b]`

BuilderGuy1

[21:04](#msg6202dae6d410244480517448)`Red [ title: "Multiple View test" needs: 'view ] Vit_Min: [A B C D E K Iron Magnesium] Vit_Min_Units: [gram mg] view [ Button 60x18 "Quit" [quit] return p: panel white [ size 300x300 Text "Stuff Test" return drop-down 120 data Vit_Min drop-down 100 data Vit_Min_Units ] ]`

hiiamboris

[21:06](#msg6202db57ced11857f99ddf2a)should be strings

greggirwin

[21:06](#msg6202db6251bd8b580c93887f)@BuilderGuy1 you need triple backticks for multiline code.

[21:07](#msg6202db8ee4c979478d69fb99)https://github.com/red/docs/blob/master/en/view.adoc#drop-down

BuilderGuy1

[21:07](#msg6202db9cd4102444805176cf)Ah! Thanks @hiiamboris and @greggirwin :-)

[21:07](#msg6202dbac41e3293d65e1dc5f)I knew I was missing something really simple

greggirwin

[21:08](#msg6202dbb8dc191b3d69a0209a)Happens to all of us. :^)

[21:08](#msg6202dbdb0779373db8d55c8e)In the docs you'll see the reason, and the extra power it allows.

gurzgri

[22:46](#msg6202f2aea41d896a2087219c)@Moppy\_gitlab Above you asked if you're  
&gt; abusing functions, or doing things unidiomatically?

I'm not going to do a code review here, but it has to be said that by the overall looks of it it really doesn't read the "Red" way. Some bits do, yes, but many others do not, e.g. the excessive use of /extern isn't something you'd see promoted very often.

For the fun of it I did my own take on "Go fish" at

```
do https://gist.githubusercontent.com/gurzgri/f09b8b78e96cd1d876d38ae7a64b8c96/raw/bd02e1c20562cd96315527ec49cd57f6f93ee790/gofish.red
```

not to show off, but to give you something to compare your version with. I'm far from saying that my approach is "better" or is the most "reddish" and idiomatic one one can come up with — others here would be able to come up with way more elegant solutions.

But compare, disassemble and dissect my take on this with your version to see how thinking a bit about a proper layout of the data you have to deal with can help for example in leveraging the power of Red's block manipulation functions, can lend to way shorter code and to less ifs and eithers. And see how common Red naming conventions (think: verb, verb-noun, noun) and maybe some comments here and there may improve the overall readability of code. Hope this helps!

greggirwin

[22:48](#msg6202f338708e9c3dd76c1f75)Thanks for that @gurzgri. :+1:

## Wednesday 9th February, 2022

gltewalt

[01:00](#msg62031216a41d896a20876121)I had done a version also.  
https://github.com/gltewalt/go-fish

[01:02](#msg620312a1d41024448051e2f2)(may contain mistakes, and / or bugs)

[01:46](#msg62031cf11fe6ba5a971705ef)Just fixed one :-D

gltewalt:matrix.org

[02:12](#msg620322f00779373db8d5f05a)Lots of ways to do it. For perfectly idiomatic examples... Best bet might be @rebolek

BuilderGuy1

[18:49](#msg62040ca6ced11857f9a0523b)Another easy question: I'm trying to use abutton to get the data selected in a drop-down and add it to a text-list.

[18:49](#msg62040cbf4164105ab08c6470)

```
Red [
	title: "Drop-down test"
	needs: 'view
]
Vit_Min: ["A" "B" "C" "D" "E" "K" "Iron" "Magnesium"]

view [
	Button 60x18 "Quit" [quit] return
	V_M: drop-down 120 data Vit_Min
	
	button 60x30 green "Add" [V_M_List/data: pick V_M/data V_M/selected]
	return
	V_M_List: text-list 140x140 data ["hi" "there"]
]
```

hiiamboris

[18:58](#msg62040ec13e52f56a26f72d8a)text-list data is supposed to be a block

BuilderGuy1

[19:01](#msg62040f8b3349fe1c7102bfbb)I believe I have it in a block. What would I need to change?

hiiamboris

[19:08](#msg62041131ced11857f9a05b5f)insert `probe` before `pick`

BuilderGuy1

[19:15](#msg620412c8e4c979478d6c8087)Hmmm. That did not add anything to the Text-List. This is what was printed to the terminal (MacOS RED build Nov13th) when I selected an item from the drop down then pressed the button twice:

[19:15](#msg620412d7708e9c3dd76e6ff5)

```
none
none

*** Runtime Error 1: access violation
*** at: 00036F49h
```

[19:16](#msg620412f241e3293d65e4641d)Perhaps I need to get a newer build

hiiamboris

[19:19](#msg620413a41fe6ba5a9718fb50)see? not a block

[19:19](#msg620413b36e4c1e1c84577fb8)crash is interesting though

BuilderGuy1

[19:24](#msg620414dd03f2704782287cad)Today's build now compiled. As for that block...

[19:25](#msg6204151f0779373db8d7e784)I look at the text-list I see \["hi" "there"] and say "There's my block". Clearly this is not what your refering to though

[19:35](#msg620417771fe6ba5a97190447)no crash with new build at least :-)

hiiamboris

[19:51](#msg62041b3a51bd8b580c962395):)

gurzgri

[19:59](#msg62041d0b6e4c1e1c845793a3)@BuilderGuy1 text-list V\_M\_List's data is a block, yes, but its a block not for long: replace the

```
[ V_M_List/data: pick V_M/data V_M/selected]
```

actor with

```
[?? V_M_List/data   V_M_List/data: pick V_M/data V_M/selected   ?? V_M_List/data]
```

You see now?

Moppy\_gitlab

[20:05](#msg62041e9b6e4c1e1c845796bf)@gurzgri thanks for writing that. One thing I'd like to mention is that my code with influenced by the requirements listed here https://rosettacode.org/wiki/Playing\_cards , and I wanted to reuse what I wrote for that. This is definitely an elegant way of making a full deck of cards though

[20:06](#msg62041ea951bd8b580c962a48)

```
pool:     collect [foreach rank ranks [foreach suit suits [keep/only rejoin [rank suit]]]]
```

BuilderGuy1

[20:08](#msg62041f281fe6ba5a9719160e)@gurzgri Yes that illustrates it well thanks! So I would need to convert the data that comes out of PICK into a block

[20:14](#msg6204209b1fe6ba5a9719186e)why does "pick V\_M/data V\_M/selected" get "none"?

[20:15](#msg620420c503f270478228990c)I added "insert tail" in front of "V\_M\_List/data: " but it has nothing to add.

gurzgri

[20:16](#msg620421283349fe1c7102e510)`probe` or `??` your `V_M/data` and `V_M/selected`. Then `help pick` in the console. You'll find out what's going on.

BuilderGuy1

[20:16](#msg620421381fe6ba5a9719194d)will do

gurzgri

[20:26](#msg6204236c03f2704782289e25)@Moppy\_gitlab Trying to reuse (mimic) what you wrote in other languages is the no. 1 "mistake" with the Redbol languages. Often the key is unlearning things and doing them the Redbol way ... :D

BuilderGuy1

[20:47](#msg620428554164105ab08c9e19)Here's what it looks like to me: "V\_M/data" is the entire Vit\_Min list and "V\_M/selected" is returning the pair "1x1" regardless of what is being selected. It appears that PICK doesn't like PAIRs for it's index. I tried converting the pair (to integer!) but I can't find anything that will convert it without errors. I'm out of ideas.

hiiamboris

[20:49](#msg620428cddc191b3d69a2d669)`/1` `/2`?

[20:50](#msg620429050779373db8d814a7)we have docs btw: https://w.red-lang.org/en/datatypes/pair

BuilderGuy1

[20:50](#msg6204291ca41d896a2089b285)Like this? V\_M/selected/1

[20:50](#msg6204293303f270478228a981)I have so many pages of docs open it's getting stupid....

[20:51](#msg6204293b3e52f56a26f7674b)but I will read that page!

hiiamboris

[20:52](#msg62042973a41d896a2089b31e)first learning steps are hard :)

[20:53](#msg620429b751bd8b580c964056)I wonder where you get a pair though in your code...

BuilderGuy1

[20:53](#msg620429c2708e9c3dd76ea3a9)I'm getting there! I'm going through the REBOL/Core book right now. Most of the other docs are reference which makes it really hard to understand how to put thing together. They also only have trivial examples

[20:54](#msg62042a003e52f56a26f7689d)"probe V\_M/select" gives "1x1". Seams really weird to me that a drop-down would output a pair as it's index.

[20:55](#msg62042a2fdc191b3d69a2d8ca)I would expect an integer, but that's just me

hiiamboris

[20:55](#msg62042a37dc191b3d69a2d8e2)to me too, and I can't reproduce it

BuilderGuy1

[20:55](#msg62042a584164105ab08ca1d5)I'm using the Mac version, todays build

hiiamboris

[20:56](#msg62042a6b0779373db8d81753)oh

BuilderGuy1

[20:57](#msg62042a9ce4c979478d6cb815)I will try this later on a windows version (in coffee shop with laptop :-)

hiiamboris

[20:57](#msg62042abbced11857f9a0959a)if that's the case, do you still get pairs output in this example?  
`view [drop-down data ["aa" "bb"] select 1 rate 2 on-time [probe face/selected]]`

BuilderGuy1

[20:58](#msg62042b076e4c1e1c8457b2b2)As soon as it ran I got repeating "1" then choose "bb" from list and got repeating "1x2"

hiiamboris

[20:59](#msg62042b17d410244480542965)thanks, I'll handle it from here

BuilderGuy1

[20:59](#msg62042b3d1fe6ba5a97192e78)I also get some other crap...

```
/BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.200.3/Common/ChunkCompression.cpp:49: Error: unsupported compressor 8
/BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.200.3/Libraries/CompressData/CompressData.c:353: Error: Unknown compression scheme encountered for file '/System/Library/LinguisticData/Latn/Dict2.dat'
1x2
1x2
1x2
```

hiiamboris

[21:00](#msg62042b80e4c979478d6cb9dd)what's your macos version?

BuilderGuy1

[21:01](#msg62042bb6dc191b3d69a2dc53)10.14.6 I kept my laptop at this version specifically so I could continue using RED (32-bit support)

hiiamboris

[21:01](#msg62042bc03349fe1c7102fc80):+1:

BuilderGuy1

[21:02](#msg62042bf8b8b08244822753b7)I'll sign off then and try this in Windows RED a bit later

Moppy\_gitlab

[21:04](#msg62042c534164105ab08ca63a)@gurzgri from what I gather, doing things idiomatically involves editing data within contexts besides the global one, reusing data, and doing a lot of `collect`ing. I really like how `reverse` is used.

hiiamboris

[21:12](#msg62042e3ba41d896a2089c0b6)@BuilderGuy1 I reported your finding https://github.com/red/red/issues/5064

gurzgri

[21:20](#msg620430034164105ab08cae2e)Contexts/objects and blocks etc. used with path access as in `game/:player/hand` just make things so much more accessible than having each and every "thing" in it's own word (i.e. "variable"), help in tidying things up and allow for way easier debugging. In my script, I can easily `probe game` where ever I want and see the whole application state. `collect` isn't idiomatic per se, it's just that I love it so much. Many things you can `collect` you can gain by `remove-each` their complement:

```
remove-each card copy hand [not same? rank rank-of card]
```

```
collect [foreach card hand [same? rank rank-of card]]
```

That's a matter of taste, choose your favourite way. But with `collect`, you can e.g. wrap it on a high level around other code blocks and in there `keep` whatever you need. Think of creating logs that way for example.

greggirwin

[21:50](#msg620437080779373db8d83299)&gt; doing things idiomatically involves editing data within contexts besides the global one, reusing data, and doing a lot of collecting.

@Moppy\_gitlab I will say No to that analysis. There's a lot that goes into the Zen of Red, and everyone develops their own style. Idiomatic for you may not be for me. But it can help to think about how to most clearly express your intent, and always keep in mind that it's model of data-centric thinking is something unique that Red offers. In that vein, while maps and objects are data, really learn to use and understand blocks. Blocks and words are the foundation.

Consider, too, where other langs have 6-8 base datatypes. Red has a \*lot* (`help datatype!`). So if you find yourself using strings, and then `to` for converting to email, url, file, etc. that's \*un\*idiomatic. Leverage datatypes.

gltewalt

[21:52](#msg6204378fa41d896a2089d4e0)If I had to guess the ultimate Redbol way... it would be DSLs.  
`Sell 100 shares of "Acme" at $47.97 per share`

[21:53](#msg620437bedc191b3d69a2f6b5)From: http://www.rebol.com/docs/core23/rebolcore-4.html

greggirwin

[21:54](#msg6204382f0779373db8d83628)Yes, and that comes a bit from Forth's idea of "first write the language you want to write your program in, by building up a vocabulary for it." Not everything has to be dialected of course. You can gain a lot of leverage this way just with naming and structure.

gltewalt

[21:59](#msg6204392dced11857f9a0b42c)A lot of overhead for for a single text based card game. But... a dialect for all text based card games... and it starts to become interesting

greggirwin

[22:02](#msg620439ff03f270478228d90b)Agreed.

Moppy\_gitlab

[22:35](#msg620441ce51bd8b580c967a77)From what I have seen of Forth, I am glad Red isn't TOO like it.

```
# recursive fibonacci function in Python

def fib(n):
    if n < 3:
        return 1
    return fib(n-1) + fib(n-2)
```

```
\ the Forth version
: fib dup 3 < if drop 1 else 1- dup recurse swap 1- recurse + then ;
```

and then there's PostScript......

```
/fib { dup 3 lt { pop 1 } { 1 sub dup fib exch 1 sub fib add } ifelse } def
```

greggirwin

[22:46](#msg6204444241e3293d65e4d1fc):^)

## Thursday 10th February, 2022

bubnenkoff

[10:17](#msg6204e65003f27047822a2bcc)Are there any plans for the next 2-3 years to release a new dialect to replace the VID? I'm completely happy with it, but I want to make sure that in a few years I won't have to rewrite anything

[10:21](#msg6204e7396e4c1e1c845927f6)I am asking because I have seen news: "...Toomas stepped up and suggested an alternative, refinement-based, interface"

hiiamboris

[10:22](#msg6204e7504164105ab08e10e4)That comment was about `split`. I am 99% certain VID2 won't come out in the next 2-3 years.

rebolek

[10:28](#msg6204e8eae4c979478d6e2a80)Even if there would be VID2 it’s not going to be totally different.

planetsizecpu

[12:19](#msg620502b63e52f56a26f91a23)&gt; I am 99% certain VID2 won't come out in the next 2-3 years.

I hope god hears you 😬

hiiamboris

[12:38](#msg620507320779373db8d9c884)I hope so too ;) There are more urgent tasks.

pekr

[14:02](#msg62051b0a6e4c1e1c84599391)@hiiamboris in your reference - is VID2 your Spaces project? :-)

hiiamboris

[14:56](#msg620527920779373db8da0e81)No, unlikely :)

[14:58](#msg62052809d410244480561e80)Spaces just carve out a piece inside VID. With own specifics. If there will be VID2 however I hope it will learn from all experiments I did in Spaces.

Moppy\_gitlab

[16:18](#msg62053ae34164105ab08ecaa8)

```
>> b: [[none 0]]
>> a: [1 0 3 4]
>> reduce [a/-1 a/2]
== [none 0]
>> b/1
== [none 0]
>> b/1 = reduce [a/-1 a/2]
== false
```

Is there something obvious I'm missing?

ne1uno

[16:40](#msg620540153e52f56a26f9aa08) type? b/1/1

[16:43](#msg620540c04164105ab08ed8d9)type? first reduce \[a/-1 a/2]

[16:46](#msg62054160e4c979478d6eec7d)`b: [[#[none] 0]]`

Moppy\_gitlab

[16:47](#msg620541bf51bd8b580c988238)Thanks...

```
>> help #
*** Syntax Error: (line 1) invalid issue at #
*** Where: set
*** Near : :delimiter-lex
*** Stack: load
```

[16:48](#msg620541e5dc191b3d69a514e5)

```
>> ? #[none]
none is a none! value.

>> ? none
NONE is a none! value: none
```

hiiamboris

[16:48](#msg620541ecd41024448056619d)https://w.red-lang.org/en/datatypes/none/#literal-syntax

[16:49](#msg620541fcd4102444805661a4)

```
>> mold/all none
== "#[none]"
```

Moppy\_gitlab

[16:58](#msg62054423ced11857f9a2d44f)Wrote this, output matches Scheme's

[16:58](#msg62054424d410244480566793)https://rosettacode.org/wiki/One-dimensional\_cellular\_automata#Red

ne1uno

[16:58](#msg6205442ce4c979478d6ef371)also in your example, `(reduce b/1) = reduce [a/-1 a/2]`

greggirwin

[18:25](#msg62055890e4c979478d6f2087)@Moppy\_gitlab thanks for contributing that solution on RC!

Moppy\_gitlab

[18:41](#msg62055c601fe6ba5a971ba102)Realized `petri: head clear.....` isn't necessary. Insert "returns" a modified series after the inserted material, but that doesn't actually change where a series' word points to.

gltewalt:matrix.org

[18:46](#msg62055d710779373db8da8b92)So with that, only if it's a live cell it prints 1 or # ?

Moppy\_gitlab

[18:48](#msg62055dedb8b082448229d49d)@gltewalt:matrix.org yes. _ and # are harder to work with. Maybe there's some parsing scheme or something that could convert 0 and 1 automatically

gltewalt:matrix.org

[18:48](#msg62055e176e4c1e1c845a306d)How many events are supposed to be in the "array"?

[18:49](#msg62055e326e4c1e1c845a3092)Elements

[18:49](#msg62055e3751bd8b580c98c397)Not events

Moppy\_gitlab

[18:49](#msg62055e3c51bd8b580c98c3b6)@gltewalt:matrix.org arbitrary

[18:49](#msg62055e4241e3293d65e72011)doesn't matter

[18:50](#msg62055e6ddc191b3d69a5597e)I just treat `none` as a 0, which doesn't break any rules

gltewalt:matrix.org

[18:51](#msg62055ecdced11857f9a30cd8)Looks like if a neighbor group adds up to 2, there's life, otherwise no life.

Moppy\_gitlab

[18:52](#msg62055f011fe6ba5a971ba762)1 1 1 kills the one in the middle

[18:53](#msg62055f0f4164105ab08f19e0)1 0 1 bring the one in the middle to life

gltewalt:matrix.org

[18:53](#msg62055f100779373db8da8ec4)Oh

Moppy\_gitlab

[18:53](#msg62055f21e4c979478d6f2dce)so `select`seemed like the best option

[19:58](#msg62056e5ca41d896a208c4f7a)In a switch statement, what the best way of having multiple values that cause the same thing? This doesn't work for some reason.

```
a: 4
switch a [
    first find [0 2 3 4] a [print a]
    10 [print "10"]]
```

hiiamboris

[19:59](#msg62056e9bd41024448056c2ea)you want `case` maybe

[19:59](#msg62056eb303f27047822b6111)switch does not evaluate it's block

Moppy\_gitlab

[19:59](#msg62056eb4708e9c3dd7713eaf)probably. I'll use that then

greggirwin

[20:05](#msg620570143e52f56a26fa1aee)`Switch` works fine for that.

```
a: 4
switch a [
    0 2 3 4 [print a]
    10 [print "10"]
]
```

[20:07](#msg62057088a41d896a208c5453)Where it \*doesn't* work is when the value you're checking against is itself a block.

Moppy\_gitlab

[21:43](#msg6205870a03f27047822b98d4)Wrote a Red version of this. Output is same as Scheme's again.

[21:43](#msg6205870c0779373db8dae7ee)https://rosettacode.org/wiki/Conway%27s\_Game\_of\_Life#Red

hiiamboris

[21:48](#msg6205881f1fe6ba5a971c010f)https://github.com/red/community/blob/master/games/gameoflife2.red

Moppy\_gitlab

[21:50](#msg620588b9e4c979478d6f87a6)I don't know if using it is good practice, but `try` is very convenient.

greggirwin

[21:57](#msg62058a321fe6ba5a971c0662)Thanks @Moppy\_gitlab. Please add yourself as the author for these in the header. We think that will be a good thing for all of us to do, so we know who wrote something, and they get credit.

Moppy\_gitlab

[21:59](#msg62058adb1fe6ba5a971c0834)Added it. I'd credit anyone else, but I don't mind much when it comes to myself.

greggirwin

[22:02](#msg62058b67dc191b3d69a5be95)Yeah, we are often like this. This is mainly so when it comes time to edit or update things we have an audit trail, and don't step on toes.

## Friday 11st February, 2022

ne1uno

[09:21](#msg62062ab2d410244480584941)Script Error: to-interger has no value

dsunanda

[09:25](#msg62062b8a3349fe1c71071c08)to-integer -- just one "r" .....I n some English accents its often pronouned as if there was a second "r", so that's a common misspelling of the word -- https://gonaturalenglish.com/intrusive-r-sounds-like/

chunes3

[09:44](#msg62063001a41d896a208ddc86)Hey all, quick question. Does Red have an integer division function or operator? Or is `to-integer 10 / 3` the idiomatic way to do it?

bubnenkoff

[12:35](#msg620657f503f27047822d3cb0)Remember me please how to create copy of object and returng it without modifying original

```
obj: object [
	test: none
]

foo: func[] [
	obj: copy/deep obj
	obj/test: true ; it's modify original
	
	probe obj
]

foo
```

rebolek

[12:36](#msg620658486e4c1e1c845c30be)`new-obj: make obj []`

hiiamboris

[12:36](#msg6206584b51bd8b580c9ad427)you're modifying the word, not object

[12:36](#msg62065852708e9c3dd77320ac):turtle:

rebolek

[12:36](#msg620658591fe6ba5a971da6cb):)

bubnenkoff

[12:39](#msg620658e84164105ab0912029)oh thanks!

[13:04](#msg62065ef13349fe1c71078513)so the name should be always uniq to prevent overwriting of original?

rebolek

[13:06](#msg62065f403e52f56a26fbfbe0)you’re not "overwriting" anything

[13:06](#msg62065f560779373db8dcaaf1)you’re just changing what the word is pointing to

[13:07](#msg62065f97b8b08244822be5b1)

```
>> a: b: context [c: 1]
== make object! [
    c: 1
]
>> a: make a [c: 2]
== make object! [
    c: 2
]
>> a
== make object! [
    c: 2
]
>> b
== make object! [
    c: 1
]
```

bubnenkoff

[13:08](#msg62065fbd3e52f56a26fbfcca)

```
obj: object [
	test: none
	say: func[] [print ["hello:" test]]
]

foo: func[] [
	obj: make obj [] ; it's new instance of obj or original obj?
	obj/test: true
	obj/say
	
	return obj
]

foo
```

rebolek

[13:09](#msg6206600a3e52f56a26fbfdaf)`make obj []` returns new instance and you’re assigning that instance to the word `obj`

bubnenkoff

[13:10](#msg6206602ad41024448058bdc2)but this word is already is using, yes?

hiiamboris

[13:16](#msg620661981fe6ba5a971db9a8)

```
>> x: 1
== 1
>> f: func [][x: 2] 
== func [][x: 2]
>> f
== 2
>> x
== 2
```

[13:16](#msg620661b06e4c1e1c845c455c)what surprises you here? ;)

bubnenkoff

[13:16](#msg620661c91fe6ba5a971dba19)Here nothing, the problem is only with understanding objects)

hiiamboris

[13:18](#msg620662330779373db8dcb12b)but your code works exactly like this above

bubnenkoff

[13:20](#msg6206628a51bd8b580c9ae80f)m... so If I want to return new instance I should always do like Boleslav show?

```
new-obj: make obj [] ; where obj is already created object with methods and fields
```

[13:21](#msg620662e23e52f56a26fc0245)If yes, is there any red-style for naming of new objects? just add `new-` to name it's good?

hiiamboris

[13:22](#msg620662fb6e4c1e1c845c4857)naming of objects is no different than naming of anything else

pekr

[13:24](#msg62066388ced11857f9a526ae)Yes, Redbol langs don't have classes. So we use a prototype based objects. You can use existing object as a prototype and add new fields in one go:

```
>> obj1: make object! [a: 1]
== make object! [
    a: 1
]
>> obj2: make obj1 [b: 2]
== make object! [
    a: 1
    b: 2
]
```

[13:24](#msg620663a53e52f56a26fc0421)Not sure I remember it correctly (never tried that), there was an idea to use multiple existing objects, to create a new one.

hiiamboris

[13:26](#msg6206641c708e9c3dd7733a33)`make object [..] object [..]`

pekr

[13:45](#msg620668766e4c1e1c845c54ba)I don't remember already, why Red decided to not allow to extend an existing object. It was many times a requested feature during the R2 days, so R3 added that. Maybe because we've got maps? I don't know ....

rebolek

[13:46](#msg620668a5ced11857f9a530bc)@bubnenkoff

```
obj: make object! [a: 1]
obj: make obj []
```

is no different than

```
obj: make object! [a: 1]
obj: "now `obj` points to a string!"
```

bubnenkoff

[14:28](#msg620672a1b8b08244822c107c)But when we are creating new object old binds with maps and blocks still staying? I talk about should I declare all in object with `copy\copy/deep` to prevent use old links in new objects?

hiiamboris

[14:33](#msg620673ab3349fe1c7107afe5)you should check yourself but `copy/deep` should copy blocks, maybe objects or maps too

bubnenkoff

[14:37](#msg620674a6dc191b3d69a79f72)So it's normal behaviors that new objects continue link to original block words (blocks and maps) ?

hiiamboris

[14:38](#msg620674f60779373db8dcdca6)if you didn't copy them then yes

bubnenkoff

[14:52](#msg6206783f03f27047822d883e)Do not understand why it's changing original object:

```
obj: object [
	test: copy/deep #(a: none)
	say: func[] [print ["hello:" test]]
]


foo: function[] [
	nobj: make obj [] 
	nobj/test/a: true
	nobj/say
	
	return nobj
]

foo
obj/test ; is true, but I am expecting none
```

ingvast

[15:23](#msg62067f7503f27047822d9933)Rebol got the function `info?` to get type, date and size of a file. What can I use in red?

ne1uno

[15:34](#msg620682201fe6ba5a971dff57) `print [query f: %some-file size? f ]`

bubnenkoff

[15:54](#msg620686cd6e4c1e1c845c9cc5)@hiiamboris It should be possible to just use copy to create new object. But result is same. I can't understand why original object is modify:

```
obj: object [
	test: #(a: none)
	say: func[] [print ["hello:" test]]
]
bar: 123

foo: function[] [
	nobj: copy obj ; creating new object
	nobj/test/a: true
	nobj/say
	
	return nobj
]

foo
obj/test
```

ingvast

[16:03](#msg620688c541e3293d65e98c4c)@ne1uno Thanks, that should do it. I can use `dir?` to know if it is a directory or file.

ne1uno

[16:07](#msg620689aedc191b3d69a7cdcb)I think dir just checks for no extension? soon I/O branch should have more complete info

bubnenkoff

[16:07](#msg620689bb0779373db8dd0de5)docs: "Another way to create an object is to use the `copy` action which does not require a specification block, so does just a simple cloning of the object. Existing functions will be re-bound to the new object."

ne1uno

[16:10](#msg62068a753e52f56a26fc5e05)@bubnenkoff, you're throwing away any work done in foo?

bubnenkoff

[16:11](#msg62068aa30779373db8dd0fe6)yes, I am trying to return from foo modified object, but do not touch original

ldci

[16:25](#msg62068e1651bd8b580c9b4444)@bubnenkoff , use `test: #(a none)` and not \`test: #(a: none)’ in your object definition. Original object remains unmodified.

bubnenkoff

[16:29](#msg62068ed3b8b08244822c52d4)@ldci explain logic please. You map syntax is wrong: `test: #(a none)`. Should be: `test: #(a: none)`

ldci

[16:30](#msg62068f2a41e3293d65e99aa6)@bubnenkoff : wait for a moment. Testing and probably I »m wrong :)

[16:38](#msg620691151fe6ba5a971e1e80)@bubnenkoff , Forget this message for the map initialization.

hiiamboris

[16:38](#msg62069117a41d896a208eb834)@bubnenkoff tried `nobj: copy/deep obj?`

bubnenkoff

[16:41](#msg620691b141e3293d65e9a0c0)yes I tried this all

ingvast

[16:47](#msg6206931c0779373db8dd2291)I need to call ssh from red. On my machine it is located in c:/Windows/System32/OpenSSH. But I cannot reach that from red. However from cmd:

```
C:\Users\i>dir c:\Windows\System32\OpenSSH\
 Volume in drive C is Windows
 Volume Serial Number is 260A-94B5

 Directory of c:\Windows\System32\OpenSSH

2021-05-13  22:06    <DIR>          .
2021-05-13  22:06    <DIR>          ..
2021-05-13  20:39           307 712 scp.exe
2021-05-13  20:39           374 272 sftp.exe
2021-05-13  20:39           481 280 ssh-add.exe
2021-05-13  20:39           382 976 ssh-agent.exe
2021-05-13  20:39           662 016 ssh-keygen.exe
2021-05-13  20:39           557 568 ssh-keyscan.exe
2021-05-13  20:39           946 176 ssh.exe
               7 File(s)      3 712 000 bytes
               2 Dir(s)  115 633 356 800 bytes free
```

While reading directory from red:

```
>> read %/c/Windows/System32/OpenSSH/
*** Access Error: cannot open: %/c/Windows/System32/OpenSSH/
*** Where: read
*** Near : %/c/Windows/System32/OpenSSH/
*** Stack:
```

Nor can I find OpenSSH directory by reading `%/c/Windows/Sytstem32/`. Are there some permissions I do not have right?

gurzgri

[16:49](#msg62069390708e9c3dd773a215)I think you need to do copy/clone deep maps or objects by yourself:

```
a: object [a: none] a/a: a
b: copy/deep a
same? b/a b ;== false
same? b/a a ;== true
```

Same with maps I guess.

hiiamboris

[16:51](#msg6206942cced11857f9a591da)@bubnenkoff I recommend this approach then:

```
>> o1: object spec: [m: make map! [a: 1]]
>> o2: object spec
>> o1/m =? o2/m
== false
```

[16:54](#msg620694c2e4c979478d71ad9b)@ingvast you run `cmd` as admin maybe?

gltewalt:matrix.org

[16:58](#msg620695c00779373db8dd28f4)It does allow extend

pekr

[17:06](#msg6206979ab8b08244822c6691)

```
>> extend obj [b: 2]
*** Internal Error: reserved for future use (or not yet implemented)
*** Where: extend
*** Near : [b: 2]
*** Stack:
```

Good thing it is planned though ....

gltewalt:matrix.org

[17:08](#msg6206982b6e4c1e1c845cc594)With `make` @pekr

pekr

[17:09](#msg620698616e4c1e1c845cc5d7)Doesn't make recreate and object somehow from scratch? Can't envision internals myself ....

gltewalt:matrix.org

[17:12](#msg620698e26e4c1e1c845cc683)Well, the blog says "possible to extend it"

[17:12](#msg620698ef6e4c1e1c845cc6eb)

```
a: object [value: 123] 

c: make a [ increment: does [value: value + 1] ]
```

[17:16](#msg620699e53e52f56a26fc81ae)Oh, it extends a cooy I think

[17:16](#msg620699ea3349fe1c710808c4)Copy

bubnenkoff

[18:15](#msg6206a7d11fe6ba5a971e5457)thanks! But maybe it's a bug, because I think that my code should be valid. At last it's very logical to do as I am doing

ldci

[18:19](#msg6206a8a5708e9c3dd773d9cd)@bubnenkoff Clearly related to map datatype, but I don’t understand why.

hiiamboris

[18:24](#msg6206a9c603f27047822df6ea)@bubnenkoff no it's not a bug, but `copy/deep` part I do consider a (known) bug

ingvast

[18:45](#msg6206aec71fe6ba5a971e64f6)@hiiamboris No, normal user.  
Calling dir from red: `call/output/error "dir c:/Windows/System" o: "" e: "" print o` I find the strange

```
2021-11-02  09:23         1ÿ212ÿ544 OpenCL.dll
2019-12-07  10:09            60ÿ416 openfiles.exe
2021-07-08  23:35           922ÿ112 opengl32.dll
2021-05-05  02:33           107ÿ368 OpenWith.exe
2019-12-07  10:09            44ÿ032 OposHost.exe
2020-04-20  21:55           732ÿ0
...
019-12-07  10:09            32ÿ768 winml.dll
2020-10-14  04:20           149ÿ272 winmm.dll
```

Note the three dots "..." which are real.  
When listing from cmd, OpenSSH goes between `opengl32` and `openWith`:

```
2021-07-08  23:35         1 062 400 opengl32.dll
2021-05-13  22:06    <DIR>          OpenSSH
2021-05-05  02:32           123 984 OpenWith.exe
```

In cmd instead of "...." there are hundreds of files.

hiiamboris

[18:50](#msg6206b010e4c979478d71ebc4)

```
>> call/output/error "dir c:/Windows/System32" o: "" e: "" print o

>> call/output/error "dir c:\Windows\System32" o: "" e: "" print o
 Volume in drive C is OS
(dump of all the files, no dots)
```

[18:51](#msg6206b032b8b08244822c9da9)your Red and OS versions?

[18:52](#msg6206b07d3e52f56a26fcb1bb)Oh wait I found dots!

[18:53](#msg6206b08e3e52f56a26fcb1c3)

```
15-Jan-21  02:01           143,360 playtomenu.dl
...
8 WinTypes.dll
07-Dec-19  12:09            22,528 winusb.dll
```

ingvast

[18:53](#msg6206b09bced11857f9a5d1f9)On another check, it seem like print replaces a number of lines with ...  
It just happened to be close to where my problem is :(  
Win10  
I built it a week ago. git  
a154bbc3f at the master branch

hiiamboris

[18:54](#msg6206b0e1b8b08244822c9fa0)Yeah that's what I thought too. Looks like `gui-console`'s `print` was "fixed" from huge output.

ingvast

[18:55](#msg6206b10903f27047822e073c)But can that be related to I cannot see the OpenSSH directory

hiiamboris

[18:55](#msg6206b1163e52f56a26fcb359)No this should be something else.

[18:55](#msg6206b12fd410244480597262)Wait.

[18:55](#msg6206b1371fe6ba5a971e69e8)There's more.

[18:56](#msg6206b149708e9c3dd773ecc8)I saved the `o` output and there's no OpenSSH in the listing! (and no dots)

[18:58](#msg6206b1d80779373db8dd64ba)I'd say about 30% of the listing is missing.

[19:01](#msg6206b26e708e9c3dd773ef6a)OK I know what's happening. I've seen it already with `regedit` (someone reported)

[19:03](#msg6206b2ef4164105ab091f121)When you run `cmd` from Red (happens implicitly with `dir` command), W10 for some reason runs `%systemroot%\syswow64\cmd.exe` which runs in some sort of compatibility mode or something. When I call `dir %systemroot%\system32` from that `cmd.exe` it actually displays me contents of `syswow64` (and it's 30% smaller).

ingvast

[19:05](#msg6206b36ed410244480597764)Interesting. So it is some sort of 32/64 bit issue? Or something that directories in Windows is not always what you think?

hiiamboris

[19:05](#msg6206b37f0779373db8dd688b)Yeah. Directories and registry paths. Weird stuff.

greggirwin

[19:06](#msg6206b3d041e3293d65e9f431)Wow. Let's make sure this gets into the wiki. Nice research @hiiamboris.

hiiamboris

[19:07](#msg6206b3e6b8b08244822ca67f)In that case I need to google why this happens..

greggirwin

[19:08](#msg6206b4191fe6ba5a971e7047)Maybe @ingvast can do that, since it will give him more info and chances at success. :^)

hiiamboris

[19:09](#msg6206b452e4c979478d71f4d8)Would be awesome :)

ingvast

[19:09](#msg6206b45e3e52f56a26fcba6b)I'll pick it up. But not sure yet how to handle it. It seem that I have to run `%systemroot%\syswow64\cmd.exe` can that be called from the normall call?

hiiamboris

[19:10](#msg6206b4bcdc191b3d69a83029)No, it outsmarts you. Google may help :)

greggirwin

[19:11](#msg6206b4dae4c979478d71f5d4)@ingvast thanks. If you can do some leg work and post results, we'll help debug on the Red side.

hiiamboris

[19:11](#msg6206b4e63e52f56a26fcbbb8)

```
>> call/output "c:\windows\system32\cmd.exe /c dir c:\Windows\System32" o1: ""
>> call/output "c:\windows\syswow64\cmd.exe /c dir c:\Windows\System32" o2: ""
>> length? o1
== 147328
>> length? o2
== 147328
```

Both calls are actually syswow64 ones per the result

ingvast

[19:15](#msg6206b5cb1fe6ba5a971e74c6)I copy and get the error:

[19:15](#msg6206b5e1d410244480597c4e)

```
call/output "c:\windows\syswow64\cmd.exe /c dir c:\Windows\System32" o2: ""
*** Access Error: invalid UTF-8 encoding: #{FF313531}
*** Where: call
*** Stack:
```

greggirwin

[19:16](#msg6206b61b3349fe1c71084911)Works here for me @ingvast. What OS and what Red build (use `about` in the console)?

hiiamboris

[19:16](#msg6206b62bd410244480597d6d)No, this is because we're using en-US locales both here.

greggirwin

[19:17](#msg6206b653e4c979478d71f8e2)Ah. :^\\

hiiamboris

[19:17](#msg6206b65a6e4c1e1c845d0a62)`dir` gives output in OEM codepage, so can't be loaded like this.

greggirwin

[19:18](#msg6206b67b708e9c3dd773f7b7)It just keeps getting better.

ingvast

[19:18](#msg6206b690a41d896a208f07b6)But dir worked without he syswow64\\cmd

hiiamboris

[19:19](#msg6206b6b6dc191b3d69a83496)Hmm maybe `cmd` does some weird conversion..

greggirwin

[19:19](#msg6206b6be1fe6ba5a971e76f9)You can use `o2: #{}` as the target, but then need a code page decoder. Either @rebolek or @Oldes have those.

hiiamboris

[19:19](#msg6206b6c0e4c979478d71f9c5)I can't help here :) MS tools are a mess.

pekr

[19:19](#msg6206b6c751bd8b580c9ba178)I know it's not related, but could please dir / ls use e.g. 3 columns? I can see half of the output dotted ....

greggirwin

[19:20](#msg6206b70aa41d896a208f08ac)Hack on `list-dir` and propose a new version, or we can put it in red/community.

pekr

[19:20](#msg6206b7161fe6ba5a971e77cf)I say - no :-)

greggirwin

[19:21](#msg6206b73c3e52f56a26fcc0d3)I do agree that less (columns) is more in this case.

pekr

[19:21](#msg6206b73c4164105ab091fbb3)Recent behaviour uses too think columns, while it tries to calculate some size (might experiment a bit myself, yes), but default output is not useful

[19:22](#msg6206b75c4164105ab091fbc0)I will have to try to adapt scaling, I am at 125%.

greggirwin

[19:22](#msg6206b7763e52f56a26fcc1bd)`list-dir/col () 3`

hiiamboris

[19:22](#msg6206b784dc191b3d69a8362b)some formula glitch indeed

greggirwin

[19:22](#msg6206b78de4c979478d71fbf8)And you're all set @pekr.

hiiamboris

[19:23](#msg6206b7c6a41d896a208f0a32)I know what happens. It was written for CLI (tab size = 8), but in GUI tab size = 4.

pekr

[19:24](#msg6206b7d33349fe1c71084d43)My output takes 60% of the X size of the console and 80% of the output is dotted. Gregg, that's not how to go forward with a user experience, really.

hiiamboris

[19:26](#msg6206b854ced11857f9a5e38c)hmm no, even in CLI it's not full sized

ingvast

[19:26](#msg6206b8600779373db8dd7568)I still do not know if my lost OpenSSH directory can be explained by this. I can not find it by `find o2 to-binary "OpenSSH"`

pekr

[19:26](#msg6206b868d4102444805983dd)Super, I thought there might be some problem, seeing the code calculates sizes. Thought my display scaling is a culprit.

hiiamboris

[19:26](#msg6206b87841e3293d65e9fdec)@ingvast because there's no access to `system32` , only to wow64

pekr

[19:27](#msg6206b88dd41024448059848d)OK, I will play with that, it is a mezzanine after all ....

ingvast

[19:31](#msg6206b97e3349fe1c71085263)@hiiamboris There is no OpenSSH in `c:/windows/syswow64`. and  
`call/output "c:\windows\syswow64\cmd.exe /c dir c:\Windows\System32" o2: ""` does not seem to output OpenSSH (at least I cannot find it)

hiiamboris

[19:32](#msg6206b9e31fe6ba5a971e7f0a)Yes, that's why you don't find it with `read` too.

[19:33](#msg6206b9ed6e4c1e1c845d1489)Emulation.

ingvast

[19:36](#msg6206baa9a41d896a208f1020)Ok, thanks @hiiamboris for all the work you put into this. I have to think over how to document and how to work around this (need to call ssh). I'll get back hopefully tomorrow.

hiiamboris

[19:37](#msg6206bb040779373db8dd7c4c)https://en.wikipedia.org/wiki/WoW64#Registry\_and\_file\_system

[19:38](#msg6206bb34ced11857f9a5eaf4)There must be a way to circumvent it though :)

[19:38](#msg6206bb4a1fe6ba5a971e822a)Good luck @ingvast

ne1uno

[22:12](#msg6206df3dd41024448059d8f3)"c:/Windows/sysnative/where.exe openssl\*" maybe

[22:12](#msg6206df4aced11857f9a63c2c)"c:/Windows/sysnative/where.exe openssh\*"

greggirwin

[22:43](#msg6206e68b03f27047822e7b83)What is `sysnative`? And your slashes are backwards. ;^)

ne1uno

[22:51](#msg6206e88fdc191b3d69a8a4e0)don't need full path, `call/shell/output/error "where curl" out: "" err: "" print [out err]`

## Saturday 12nd February, 2022

ne1uno

[00:35](#msg620700dfa41d896a208fa50b)someone couldn't run osk.exe on win7 because of syswow64 redirect. it's buried a little deeper on win10 with only one link. takes a minute.

[00:35](#msg620700dfe4c979478d729594)`call/shell/output/error {where /R "%windir%" osk.exe } out: "" err: "" print [copy/part out 1560 err]`

gltewalt:matrix.org

[01:25](#msg62070c6d1fe6ba5a971f2980)Move to Linux Mint.

bubnenkoff

[07:27](#msg620761516e4c1e1c845e57a3)@hiiamboris I am continue trying, and still getting same result -- original modified. Do you sure that it's not a bug in copy?

```
number: object [
    type: copy/deep #(
            selected?: none
            name: none
    )
]

new-number: copy number

new-number/type/selected?: true

print ["number:" number/type/selected?]
print ["new-number" new-number/type/selected?]
```

ldci

[07:39](#msg62076432b8b08244822dfd9a)@bubnenkoff. As mentionned the problem is related to map datatype.

```
obj1: object [
    test: none
    say:  func[] [print ["hello:" test]]
]

foo: function[] [
    nobj: make obj1 [test: true]; creating new object
    nobj/say
    return nobj
]

f: foo
print ["old =" obj1/test] 	;--unchanged
print ["new =" f/test]		;--changed
```

[07:41](#msg6207649a41e3293d65eb50c4)This sample does not modify the first object.

bubnenkoff

[07:44](#msg6207656151bd8b580c9cf84d)Could you explain "problem is related to map datatype" why it's happens?

ldci

[08:30](#msg6207701cdc191b3d69a9a285)@bubnenkoff I do not know why but when test is a map `test: #(a: none)`orginal value is changed.

hiiamboris

[09:31](#msg62077e8aa41d896a209088de)@bubnenkoff I provided you a working method above

bubnenkoff

[10:01](#msg620785830779373db8defef0)@hiiamboris @ldci thanks!

ldci

[10:06](#msg6207868c41e3293d65eb8b88)@bubnenkoff You’re welcome

ingvast

[12:49](#msg6207acc3b8b08244822e8506)I've documented my issues with calling `ssh` and other 32 bit programs in https://github.com/red/red/wiki/%5BDOC%5D-Reference-Call#3264-bit-issues

[12:50](#msg6207acfeced11857f9a7bde3)Thanks @ne1uno for help pointing out sysnative.

hiiamboris

[13:04](#msg6207b04aced11857f9a7c483):+1:

[13:04](#msg6207b074708e9c3dd775ddbc)M$ just couldn't solve it with simple symlink, instead they create a virtual directory that only exists for 32-bit programs. Bravo as always.

bubnenkoff

[14:22](#msg6207c2b3dc191b3d69aa4564)Why names of objects are printing?

```
objs: object [

	obj1: object [
		foo: function[] [
			print "foo1"
		]
	]

	obj2: object [
		foo: function[] [
			print "foo2"
		]
	]
	
]

list: words-of objs

foreach el list [ 
	print objs/(el)/foo
]
```

output:

```
foo1
obj1
foo2
obj2
```

I expect only:

```
foo1
foo2
```

[14:31](#msg6207c4afa41d896a20910d7f)And is it possible to do return if I have got nested objects like this:

```
objs: object [

	obj1: object [
		foo: function[] [
			return "foo1"
		]
	]

	obj2: object [
		foo: function[] [
			return "foo2"
		]
	]
	
]

list: words-of objs

foreach el list [ 
	print objs/(el)/foo
]
```

It's print:

```
obj1
obj2
```

But If direct access the result is another:

```
>> objs/obj1/foo
== "foo1"
```

[14:52](#msg6207c9bf708e9c3dd7760f61)but:

```
foreach el list [ 
	print objs/:el/foo
]
```

prints:

```
foo1
foo2
```

Why? What is the logic here?

hiiamboris

[15:02](#msg6207cc20708e9c3dd77613a3)lol, this is really weird

[15:04](#msg6207cc8ce4c979478d74120e)some paren-related stack bug

[15:11](#msg6207ce39708e9c3dd77618b5)I'll report it

greggirwin

[17:47](#msg6207f2ab3e52f56a26ff2b2c)Thanks @ingvast !

[17:49](#msg6207f332708e9c3dd7765f5b)`Sysnative` isn't found on my system. Not just hidden from view, but the example calls don't work. Does it work for others? Win10 here.

hiiamboris

[17:55](#msg6207f47c51bd8b580c9e0fcf)works for me

greggirwin

[17:56](#msg6207f4be6e4c1e1c845f6bfa)I figured it works for @ingvast, so now I need to see what's different here.

hiiamboris

[17:56](#msg6207f4df3349fe1c710ab76c)you sure it doesn't work for you?

greggirwin

[18:00](#msg6207f5ca6e4c1e1c845f6e29)It was me. :^\\

ne1uno

[21:45](#msg62082a73dc191b3d69ab1130)if not exist? %/c/windows/sysnative you probably can use windir system32 pro vrs home? version dependent?

Moppy\_gitlab

[23:36](#msg62084478a41d896a20920de5)Are there are any view examples where the mouse can "draw" on the canvas like a pencil?

ne1uno

[23:41](#msg620845aa3e52f56a26ffd3d2)https://gist.github.com/search?q=drawing&amp;l=red

## Sunday 13th February, 2022

Moppy\_gitlab

[00:59](#msg620857e83349fe1c710b7918)this fits the bill

[00:59](#msg620857e9b8b08244822fd835)https://gist.github.com/toomasv/70acbae8dc9d2511df319498592c7eed

## Tuesday 15th February, 2022

bubnenkoff

[10:24](#msg620b7f656e4c1e1c846679e5)Why I I am getting baz baz baz?

```
els: ["foo" "bar" "baz"]

ui: collect [
        foreach i els [keep compose [
           text i
        ] ] 
    ]
 view [panel ui]
```

hiiamboris

[10:25](#msg620b7fa63349fe1c7111ae99)add `?? ui`

bubnenkoff

[10:29](#msg620b8095b8b08244823627dd)m... Should I add some index durung iteration to display proper element like `els/(i)` ?

rebolek

[10:32](#msg620b8122dc191b3d69b1b8db)No, you should use `(i)` instead of `i`

bubnenkoff

[10:32](#msg620b815151bd8b580ca51307)@rebolek yes, it's work, but why?

[10:33](#msg620b81673e52f56a26063c43)`(i)` is evaluate to proper text value every time?

rebolek

[10:34](#msg620b81add41024448063049a)of course, that’s the point of using `compose`

[10:34](#msg620b81bd4164105ab09b6ce6)`Returns a copy of a block, evaluating only parens`

bubnenkoff

[13:10](#msg620ba638b8b0824482367169)I want to generate UI and bind it's with values. The problem that two items getting same value (as it was in question above).

But I can't figure out what syntax I should to use?

```
form-each: func [b] [collect [forall b [keep form b/1]]]

config: [
    age: [1 2 3 4]
    index: [7 8 9]
]

ui: collect [
       foreach [key value] config [keep compose/deep [
           group-box (to-string key) [
             (to set-word! rejoin ['config- key]) drop-list data form-each config/(key)  ; []
           ]
        ] ] 
    ]
 view [panel ui]
```

hiiamboris

[13:15](#msg620ba7543e52f56a26068e4b)

```
>> ?? ui
ui: [
    group-box "age" [config-age: drop-list data form-each config/(key)] 
    group-box "index" [config-index: drop-list data form-each config/(key)]
]
```

[13:15](#msg620ba771d410244480635157)try `select` instead of paths

bubnenkoff

[13:18](#msg620ba8190779373db8e71b9a)@hiiamboris did not understand... how to use `select` syntax here

```
>> select config-age 'data
== ["7" "8" "9"]
>> select config-index 'data
== ["7" "8" "9"]
```

hiiamboris

[13:24](#msg620ba99f3349fe1c71120327)first you need to figure this out: do you see what is wrong with the `?? ui` output?

bubnenkoff

[13:26](#msg620ba9ffced11857f9afa588)`form-each config/(key)` did not evaluated to block?

hiiamboris

[13:30](#msg620baaeae4c979478d7bb30f)yeah

[13:31](#msg620bab2c708e9c3dd77db111)but you should check that

bubnenkoff

[13:31](#msg620bab301fe6ba5a97283cfd)But the brackets around `form-each config/(key)` don't help

hiiamboris

[13:31](#msg620bab3e3e52f56a260697e0)use `probe`

[13:31](#msg620bab43e4c979478d7bb3f5)`probe` is your friend

[13:32](#msg620bab55e4c979478d7bb401)still I think you didn't notice what's wrong

bubnenkoff

[13:35](#msg620bac1fb8b0824482367e08)probe for what ?

```
>> probe config/age
[1 2 3 4]
== [1 2 3 4]
>> 
>> probe config/index
[7 8 9]
== [7 8 9]
```

?

hiiamboris

[13:36](#msg620bac5b41e3293d65f3a470)for what you think is wrong

[13:36](#msg620bac6f3349fe1c71120866)insert `probe` into all steps between correct data and wrong data

[13:36](#msg620bac79b8b0824482367ede)then you will know \*when* it became wrong

bubnenkoff

[16:26](#msg620bd444d41024448063b456)@hiiamboris I can't understand at what place I should put `probe`

hiiamboris

[16:46](#msg620bd8d6a41d896a209935f8)do you understand \*why* put `probe`?

bubnenkoff

[16:53](#msg620bda821fe6ba5a9728a686)to get display state in every step I think.

```
form-each: func [b] [collect [forall b [keep form b/1]]]

config: [
    age: [1 2 3 4]
    index: [7 8 9]
]

ui: collect [
       foreach [key value] config [keep compose/deep [
           group-box (to-string key) [
             (to set-word! rejoin ['config- key]) drop-list data copy form-each config/(key)
             (probe reduce to-word rejoin ['config- key]) ; I should here get state of /data
           ]
        ] 
        ] 
    ]
 view [panel ui]
```

hiiamboris

[17:01](#msg620bdc6ed41024448063c7aa)&gt; to get display state in every step I think.

yes, and did you know you can fit it almost anywhere? like:

```
>> a: 1 - b: 2 + c: 3    ;) some unknown values
== -4
>> (probe a) + (probe b) + probe c   ;) displays all values
-4
5
3
== 4
```

bubnenkoff

[17:04](#msg620bdd0503f27047823831f2)Hah! I did not know that.  
1 - 2 + 3 = -4 ??

hiiamboris

[17:06](#msg620bdd8251bd8b580ca5d106)no, why would you think that a,b,c is 1,2,3?

bubnenkoff

[17:07](#msg620bddcc6e4c1e1c84674936)a: 1  
b: 2  
c: 3

pekr

[17:07](#msg620bddd0ced11857f9b019d6)no

bubnenkoff

[17:07](#msg620bddd3ced11857f9b019db)O.o

pekr

[17:07](#msg620bdde4dc191b3d69b27905)a: 1 followed by minus sign menas, that word a points to the result of 1 - b

[17:08](#msg620bddf16e4c1e1c846749b1)or something like that :-)

hiiamboris

[17:08](#msg620bde1eb8b082448236ea8c)

```
>> trace/all [a: 1 - b: 2 + c: 3]
    b: + 2 c: 3                     => 5                                    
    a: - 1 b: 5                     => -4                                   
== -4
```

pekr

[17:08](#msg620bde27d41024448063cbc6)You can see, that actually first assignment is to c, then result of c is added to b, and then result of that to a

bubnenkoff

[17:11](#msg620bded41fe6ba5a9728af96)it breaks the brain..)) really I need time to understand it....

[17:15](#msg620bdfc0b8b082448236ed6f)I understood only that I can write something like:

```
config: [
    age: [1 2 3 4]
    index: [7 8 9]
]

ui: collect [
       foreach [key value] config [keep compose/deep [
           group-box (to-string key) [
             (probe to set-word! rejoin ['config- key]) drop-list data [] ; probe here
           ]
        ] 

        ] 
    ]
    
view [panel ui]
```

But it's not what I need

hiiamboris

[17:16](#msg620bdffcd41024448063cfcb)no, of course not  
you need probe before every function called and every variable read

[17:19](#msg620be0a3d41024448063d12a)if you don't learn that you will never be able to debug your code

bubnenkoff

[17:20](#msg620be0dd708e9c3dd77e26f9)&gt; You can see, that actually first assignment is to c, then result of c is added to b, and then result of that to a

It's execute from right to left?!

pekr

[17:34](#msg620be410b8b082448236f6ee)Right, but because if bubled to the right, from the left first. Before a was assigned to 1, the minus sign followed, which has precedence, so first "1 - value" applied ....

```
>> a: 1 - b: 2
== -1
```

[17:35](#msg620be45ae4c979478d7c334b)Do you know, why the following is an error? The same reason:

```
>> length? "a" - 1
*** Script Error: - does not allow string! for its value1 argument
*** Where: -
*** Near : 1
*** Stack:
```

[17:37](#msg620be4bd3e52f56a26071687)You have to put first expression, length a, into parens first, because if not, once again minus operation was evaluated first `(length? "a") - 1`

hiiamboris

[17:44](#msg620be67b41e3293d65f42873)@bubnenkoff simply put, in `1 - b: 2`, `-` wants to fetch it's value on the right, but meets `b:`, and `b:` like function call `f x y z` opens a new expression (`b: 2` in this case)

[17:46](#msg620be6dd708e9c3dd77e330f)otherwise it would be subtracting `b:` from `1` which doesn't make sense (`b:` is a set-word) :)

[17:47](#msg620be719b8b082448236fcc3)I wonder if we have evaluation documented somewhere?

[17:51](#msg620be825ced11857f9b03158)https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#expressions-and-evaluation-order

[17:52](#msg620be8504164105ab09c4104)TL;DR but good examples there

toomasv

[17:55](#msg620be90bd41024448063e323)@bubnenkoff Compare these

```
>> a: 1 - (b: 2) + (c: 3)
== 2
>> a: 1 - (b: 2 + (c: 3))
== -4
```

First is like `a: 1 - 2 + 3`  
Second is like `a: 1 - b: 2 + c: 3`

bubnenkoff

[18:02](#msg620beaba03f2704782384fb4)Yes with parentheses it's easier to understand

Moppy\_gitlab

[18:11](#msg620becc203f27047823853bf)Why does this not give me transparent text?

```
view [
    text 600x30 bold red font-size 20 "My text" font[name: "Consolas" color: 100.100.100.255]
]
```

bubnenkoff

[18:13](#msg620bed5b4164105ab09c4cf7)m... probe show correct result, but app not work

```
form-each: func [b] [collect [forall b [keep form b/1]]]

config: [
    age: [1 2 3 4]
    index: [7 8 9]
]

ui: collect [
       foreach [key value] config [keep compose/deep [
           group-box (to-string key) [
             ( to set-word! rejoin ['config- key]) drop-list data append [] (probe form-each config/(key))

            ]
        ] 

        ] 
    ]

view [panel ui]
```

error:

```
Script Error: VID - invalid syntax at: ["3" "4"]
```

Am I on the right track?

hiiamboris

[18:13](#msg620bed5c1fe6ba5a9728cf6d)use `base` @moppy\_gitlab

[18:14](#msg620bed7941e3293d65f436ab)`text` is GDI-based and GDI is 24-bits of depth

[18:15](#msg620bedc16e4c1e1c84676aee)&gt; Am I on the right track?

Keep it up @bubnenkoff :) and add more probes. Way more :)

Moppy\_gitlab

[18:19](#msg620beeab6e4c1e1c84676dee)This successfully makes the background transparent, but not the text

```
view [
    base 600x30 255.0.0.255 text bold font-size 20 "My text" font-color 100.100.100.255 font[name: "Consolas"]
]
```

[18:20](#msg620beedfdc191b3d69b299c1)I guess text in base doesn't use `text`?

bubnenkoff

[18:21](#msg620bef2b3e52f56a260729cb)@hiiamboris lol I did it. But I still not sure how it's works...

```
form-each: func [b] [collect [forall b [keep form b/1]]]

config: [
    age: [1 2 3 4]
    index: [7 8 9]
]

ui: collect [
       foreach [key value] config [keep compose/deep [
           group-box (to-string key) [
             ( to set-word! rejoin ['config- key]) drop-list data append [] [(probe form-each config/(key))]

            ]
        ] 

        ] 
    ]

view [panel ui]
```

was I supposed to do that?

Moppy\_gitlab

[18:21](#msg620bef37e4c979478d7c4e54)

```
view [
    base 600x30 255.0.0.255 bold font-size 20 "My text" font-color 100.100.100.255 font[name: "Consolas"]
]
```

this works

hiiamboris

[18:24](#msg620befefd41024448063f20f)@bubnenkoff you've just proven the \[Infinite Monkey Theorem](https://en.wikipedia.org/wiki/Infinite\_monkey\_theorem) !! :D

pekr

[18:34](#msg620bf2333e52f56a260730c3)The code provided here looks so complicated, that my brain hurts. Why all those collects, keeps, etc.?

greggirwin

[18:34](#msg620bf24fe4c979478d7c54aa)@bubnenkoff what I often do in cases like this is start with the simplest thing possible, and make sure I understand what's happening. Then add pieces. If I jump steps, thinking I "get it" after the first one, it often ends with me going back and starting again.

In this case, I'd start with a hard-coded `ui` block, and make sure the `view` call works with that. Then add the `collect` part, and just basic `text` faces. Include something like a counter for the text, so you can see if each one is different. Now add `compose` and be sure to use `probe` as @hiiamboris suggested. Also, when generating UIs like this, it's \*vital* that you probe or save the resulting block for analysis. e.g. `probe ui` should be one of the first things you do, even before you hit a problem. :^)

[18:36](#msg620bf2964164105ab09c57e9)@pekr dynamic, data driven UIs are loaded with that kind of code, as are code generators in general.

[18:37](#msg620bf2d13349fe1c7112a8a8)What you have to weigh is when the payoff is big enough, because just changing data lets you build new UIs without copy-pasting old code.

pekr

[18:39](#msg620bf365d41024448063f96d)I know, but if you are a novice, start first with a simple UI and drop-list, fill the block with static data and then start to progress from there. But I am mostly stating what you said above ....

greggirwin

[18:42](#msg620bf40cced11857f9b049d7)Some of us wade in the shallows, others want to jump right into the deepest parts of the lake. For those, we'll throw life preservers. Eventually there are so many floating around that we stop throwing them and say "Look around you. Save yourself." :^)

[18:42](#msg620bf42aced11857f9b04a0d)Maybe we need emojis for that. ;^)

bubnenkoff

[19:49](#msg620c03d6e4c979478d7c7c60)&gt; The code provided here looks so complicated, that my brain hurts. Why all those collects, keeps, etc.?

because I need to generate UI dynamically. For example I can have 10 configs (ages and index just as example of digits values). And be able to access to every element.

gltewalt

[20:22](#msg620c0b98d410244480642ca9)"Not only did the monkeys produce nothing but five total pages\[14] largely consisting of the letter "S",\[12] the lead male began striking the keyboard with a stone, and other monkeys followed by soiling it"

[20:23](#msg620c0bb3dc191b3d69b2d717)Sounds like my work flow

hiiamboris

[20:23](#msg620c0bdc4164105ab09c8ef2)lol

gltewalt

[20:24](#msg620c0be61fe6ba5a97291047)s/"S"/"E"

## Wednesday 16th February, 2022

temperfugit

[04:47](#msg620c81fb51bd8b580ca714f9)Did the process for Red in Linux change? I downloaded the most recent nightly, set it as executable and tried to run it in the terminal but this happened:

[04:47](#msg620c81fe3349fe1c7113cb54)

```
>>./red-15feb22-3e79be5ab
Compiling compression library...
*** Driver Internal Error: Script Error : Invalid path value: Needs 
*** Where: run-console 
*** Near:  [all [
view? 
any [Windows? macOS? Linux?] 
not gui? 
append source/2/Needs 'View
] 
files: [%auto-complete.red %engine.red %help.red] 
foreach
]
```

greggirwin

[04:51](#msg620c82ce6e4c1e1c84688f67)It's a recent regression. Should be fixed before too long.

temperfugit

[04:54](#msg620c838b3349fe1c7113cd9f)Okay, thank you.

greggirwin

[04:57](#msg620c84381fe6ba5a9729ff29)If you can run the GUI console, that should still build fine.

temperfugit

[05:22](#msg620c8a27b8b0824482384031)I have an older build I can use for now, but out of curiosity doesn't it try to build the GUI console by default?

bubnenkoff

[10:46](#msg620cd608dc191b3d69b45e2f)Could anybody test next code. It's minimal reproducible code that I was able to create. It's hand Red console in infinity loop:

```
full-sql: {
            t1.id, t1.section_name,  t1.fz 
            FROM xml_files t1 
     WHERE t1.exists_status IS NULL -- тест, NULL
}


select-columns-raw-part: first split full-sql "FROM"  ;
replace select-columns-raw-part "SELECT" "" ; 


get-list-of-columns-from-select: function[] [   
    raw-list: split select-columns-raw-part ","

    foreach el raw-list [
        column-name: none
        column-name: second split el "." 

        trim column-name ; remove spaced. if comment all works!
    
        print  column-name
    ]

]

get-list-of-columns-from-select
```

if to comment `trim` all works.

hiiamboris

[10:49](#msg620cd6cab8b082448238df79)&gt; I have an older build I can use for now, but out of curiosity doesn't it try to build the GUI console by default?

@temperfugit not on linux

[10:52](#msg620cd76e3e52f56a2608f768)@bubnenkoff reproduced, GUI console only

rebolek

[10:52](#msg620cd78b4164105ab09e1770)@bubnenkoff  
Reproduced in CLI console

```
*** Runtime Error 16: invalid virtual address
*** at: 08066AB6h
```

hiiamboris

[10:56](#msg620cd85ed41024448065bdfa)Reproduced in CLI console on Ubuntu: a lot of garbage printed before the error 16

[11:01](#msg620cd98241e3293d65f613ca)`тест` letters are key to this

[11:02](#msg620cd9b33349fe1c711474f8)`replace` and `column-name: none` are not needed

[11:09](#msg620cdb720779373db8e98939)`print trim first split {x^/+й} "+"` this reproduces it for me

[11:09](#msg620cdb7fb8b082448238edec)confirmations?

bubnenkoff

[11:12](#msg620cdc253349fe1c7114798d)for me yes

hiiamboris

[11:12](#msg620cdc2ad41024448065c5c8):+1:

[11:12](#msg620cdc2d41e3293d65f618db)I'll report it

bubnenkoff

[11:15](#msg620cdcbc0779373db8e98ca6)@hiiamboris your are demonstrate perfect knowledge of Cyrillic)

rebolek

[11:18](#msg620cdd9741e3293d65f61d78)@hiiamboris reproduced

hiiamboris

[11:20](#msg620cde060779373db8e98f70):D

[11:21](#msg620cde3303f27047823a3985)I'm russian too, so no wonder.

[11:22](#msg620cde5c6e4c1e1c846947b4)for a temporary workaround, use `print copy column-name`

bubnenkoff

[11:27](#msg620cdfa56e4c1e1c846949e7)wow), cool, what "^/" symbol means?

hiiamboris

[11:29](#msg620ce00ea41d896a209b48a9)new-line

bubnenkoff

[11:31](#msg620ce08fa41d896a209b4958)trim is strip only spaces, how to strip new-line also?

hiiamboris

[11:32](#msg620ce0ce4164105ab09e2d0e)`? trim` :)

endo64

[11:40](#msg620ce29f3e52f56a260914f0)note that if you use `trim/with` it removes all newline characters, not only from head &amp; tail.

```
>> trim/with/tail "one^/two" newline
== "onetwo"
```

bubnenkoff

[15:13](#msg620d1491e4c979478d7ea9e0)Can I switch type? The follow code do not works:

```
str: "hello"
t: type? str
print t
switch t [
	string! [print "it is string"]
	integer! [print "it is integer"]
]
```

result is `none`

```
>> t: type? str
== string!
```

Oldes

[15:14](#msg620d14df51bd8b580ca841cd)

```
switch t [#[string!] [print "string"]]
```

hiiamboris

[15:15](#msg620d15053349fe1c711503cb)I would recommend `type?/word`

Oldes

[15:15](#msg620d150d51bd8b580ca842c4)Or you can use `type?/word` instead of `type?`

bubnenkoff

[15:15](#msg620d151fdc191b3d69b4eb06)&gt; I would recommend `type?/word`

why?

Oldes

[15:16](#msg620d153041e3293d65f697b1)Because in your switch block you have words.

hiiamboris

[15:16](#msg620d154041e3293d65f697fe)And because `#[string!]` syntax is very limited and buggy.

[15:16](#msg620d155e1fe6ba5a972b42ce)Even `#[unset!]` will cause troubles.

bubnenkoff

[15:56](#msg620d1ea5708e9c3dd780a7d8)How to stringify date and stay it's format as original?

```
>> rejoin ["yyyy-mm-dd: " 2015-02-28]
== "yyyy-mm-dd: 28-Feb-2015"
```

hiiamboris

[15:58](#msg620d1f19a41d896a209be056)will be possible to define your format once we merge `Format` module

[15:58](#msg620d1f2a0779373db8ea23d9)for now, you have to format each date field yourself

[15:59](#msg620d1f473349fe1c71151974)original format is not saved anywhere, so not possible

[16:00](#msg620d1f88a41d896a209be21b)don't forget to zero-pad the fields

Moppy\_gitlab

[19:01](#msg620d49f1dc191b3d69b56161)literal words don't work with `context`, right?  
You can't do this

```
card_type: context ['b 'c 'd]
== make object! []
```

you've got to do this

```
card_type: context [b: c: d: none]
```

hiiamboris

[19:02](#msg620d4a2cb8b082448239e3d5)yes

[19:02](#msg620d4a4a708e9c3dd78107d6)`construct [b: c: d:]` works too

endo64

[21:42](#msg620d6fca3e52f56a260a4c60)@Moppy\_gitlab it is not "literal words don't work", the block is evaluated but only set words preserved:

```
>> card_type: context [1 probe "a" none x: 1]
"a"
== make object! [x: 1]
```

## Friday 18th February, 2022

bubnenkoff

[17:10](#msg620fd304b8b08244823f33ad)I want to create nested object and set value to it. What right way to do it?

```
foo: object [
	bar: object: [a:1]
	
]

foo/bar/a: 123 ; do not work
```

gurzgri

[17:13](#msg620fd39edc191b3d69baa0ba)Watch out a bit for typos. It works:

```
>> foo: object [bar: object [a: 1]] foo/bar/a: 2 ? foo/bar/a
FOO/BAR/A is an integer! value: 2
```

bubnenkoff

[17:14](#msg620fd400ced11857f9b86557)oh, yes, you are right, thanks

[17:17](#msg620fd4a0a41d896a20a1a891)but why result is empty?

```
foo: object [
	bar: object [a:1]	
]

foo/bar/a: 123

>> probe foo
make object! [
    bar: make object! [    ]
]
== make object! [
    bar: make object! [    ]
]
```

hiiamboris

[17:18](#msg620fd4d1d4102444806c0f09)typo again

bubnenkoff

[17:19](#msg620fd521d4102444806c0f79)ok, that's mean that I need to go sleep it problems in typos)

hiiamboris

[17:19](#msg620fd5386e4c1e1c846f9a03):)

ushakovs\_gitlab

[17:47](#msg620fdb951fe6ba5a9731164a)

```
parse "aaaa bb" [(tag: "ss") "aaaa bb"]
```

return true but

```
parse "aaaa bb" [(tag: "ss") if (tag = "bb") [break|none] "aaaa bb"]
```

return false  
How "if" should works?

hiiamboris

[17:50](#msg620fdc4dd4102444806c2244)read this? https://www.red-lang.org/2013/11/041-introducing-parse.html

[17:50](#msg620fdc5903f27047824092ae)&gt; if (expr) : evaluate the Red expression, if false or none, fail and backtrack.

[17:53](#msg620fdd2ba41d896a20a1c04d)

```
>> parse [x] [if (true) (print "pass") | (print "fail")]
pass
```

ushakovs\_gitlab

[17:58](#msg620fde3241e3293d65fc8319)I read Helpin' Red.  
So how can I select rule between break and none by condition?

hiiamboris

[18:01](#msg620fdee3ced11857f9b88202)!\[](https://i.gyazo.com/0a3210dd3afb2e9c0ef2cc4fb5d74dd1.png)  
Helpin.red info is misleading at best

ushakovs\_gitlab

[18:02](#msg620fdf1db8b08244823f54a6)I try to parse &lt;table&gt; block with many rows in html. So I need parse all of the rows but break after &lt;/table&gt; because there are several &lt;table&gt; blocks and I need only first.

hiiamboris

[18:02](#msg620fdf2b6e4c1e1c846fb1f4)&gt; So how can I select rule between break and none by condition?

see my example above.. `parse [x] [if (cond) break | do you need none?]`

ushakovs\_gitlab

[18:03](#msg620fdf5c1fe6ba5a97311e37)But in your example if cond = false parse return false too.

hiiamboris

[18:03](#msg620fdf7d51bd8b580cae27e5)because I only shown you how condition works

[18:03](#msg620fdf8841e3293d65fc85b9)you can add `'x` to match the actual input

[18:04](#msg620fdf980779373db8eff576)also `break` likely not doing what you think it's doing

[18:05](#msg620fdfd0dc191b3d69bac1b8)when I need to get out of parse fast I put it into a function and use `(return ..)` from within Parse

[18:06](#msg620fe03e41e3293d65fc87f5)another way: before entering a new ````put an end-condition with if (second-table-already)ushakovs_gitlab 18:07Is it possible to learn about dialect's words by console help?hiiamboris 18:09![](https://i.gyazo.com/56922c52a0e2f0e071158ece4c2b3bb3.png) lol Helpin.Red actually documents R3 rules, not Red rules (we have no then and never had) 18:09> Is it possible to learn about dialect's words by console help? no, just read that page, or I can give a link to the reference 18:09https://w.red-lang.org/en/parse 18:10it's not an easy reading though ;)ushakovs_gitlab 18:10[![image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/qkTo/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/qkTo/image.png) 18:10Also lol: hiiamboris 18:11oh maybe it was there in the first release?ushakovs_gitlab 18:11Who knows.gltewalt:matrix.org 18:11then is in the parse bloghiiamboris 18:12I have veery old builds 18:12yeah then was theregltewalt:matrix.org 18:12too slow <-----hiiamboris 18:13it was so years ago and I'm starting to misremembering things :D Saturday 19th February, 2022 zentrog:matrix.org 01:00It was removed because it was too confusing, and didn't provide much benefit [removal of Parse THEN keyword](https://github.com/red/red/issues/3843) bubnenkoff 13:18Ia there any micro-linux distribs that support Red? Did anybody tried to run it on some ultra light weight (5-10MB)? rebolek 16:51as Red supports Musl, it should run on such micro-distros. I tried it on Debian-slim, Alpine, OpenWRT and few others. ushakovs_gitlab 16:59Is there any libs to work with JSON or other structured format? hiiamboris 17:00no libs, just ? "json" 17:04XML was merged recently, but I wouldn't recommend XML to anyone :D keep in mind though, Red is first a data format, then a language, so why not use Red or Redbin directly, unless you need interop with other software? ne1uno 17:04Needs: ['json] yet? hiiamboris 17:06it should be available in prebuilt console in any case Moppy_gitlab 17:18popup appears to be buggy. After closing one(with the x button), clicking anywhere in previously opened "main" window reopens the popup, and the "main" window can't be closed with the x button. 17:18 to-field: function [] [ view [field] [modal popup] ] view [ b1: button "draw" [resize] canvas: base 200x200 white return canvas-info: text "200x200" on-down [to-field] ] ushakovs_gitlab 17:18I need interop exactly. So JSON is good enough. Thank you! hiiamboris 17:24modal is not used in your code @Moppy_gitlab 17:24so, it's a View bug Moppy_gitlab 17:31what do you mean modal is not used? ne1uno 17:34? view hiiamboris 17:36you forgot /flags Moppy_gitlab 17:36okay 17:36thanks 17:38The problem persists to-field: function [] [ view/flags [field] [modal popup] ] 17:38Do I have to program the x button to unview the window? hiiamboris 17:39reported https://github.com/red/red/issues/5083 17:39try on-up for now? 17:40I saw very similar bug on W7, need to find it ne1uno 17:40model is a little wonky, focus might return to some random window Moppy_gitlab 17:45what does on-up do? Doesn't seem to be documented. https://github.com/red/docs/blob/master/en/view.adoc https://github.com/red/docs/blob/master/en/vid.adoc gltewalt:matrix.org 17:49on- <event> is an actor, so up is the event doc Moppy_gitlab 17:50not here either https://github.com/red/docs/blob/master/en/draw.adoc 17:50okay gltewalt:matrix.org 17:51https://github.com/red/docs/blob/master/en/view.adoc#111-event-names 17:51up Moppy_gitlab 17:59 to-field: function [] [ view/flags [ field on-up [unview] ] [modal popup] ] view [ b1: button "draw" [resize] canvas: base 200x200 white return canvas-info: text "200x200" on-down [to-field] ] this both makes the field useless and the problem persists. I'll wait then. hiiamboris 18:03you missed the point completely :) 18:04on-up [to-field] Moppy_gitlab 18:05removing modal all together doesn't seem to make a difference either. I appreciate the condescension. 18:08This freezes all interaction. So yeah. Doesn't work to-field: function [] [ view/flags [ field ] [modal popup] ] view [ b1: button "draw" [resize] canvas: base 200x200 white return canvas-info: text "200x200" on-up [to-field] ] 18:09insert smiley face hiiamboris 18:10lol 18:10View is a mess ne1uno 18:12adding 'done to the event didn't help either Moppy_gitlab 18:14would easy GUI be considered one of the main draws of Red? 18:15the syntax is nice and all 18:16but uuuugh, popups are kind of important for real programs hiiamboris 18:16agreed, hit that many times already ne1uno 18:17can still right click on the system menu, upper left icon to close Moppy_gitlab 18:20@ne1uno you can, but for me, the right click menu is disabled until I click on some other window pekr 18:29I wonder if most of those problems are related to the difficulcy of wrapping of the native gui elements? hiiamboris 18:30 to-field: function [] [ view/flags [ field ] [modal popup] ] view [ b1: button "draw" [resize] canvas: base 200x200 white return canvas-info: box 0.0.0.254 left 100x25 "200x200" on-up [to-field] ] this works Moppy_gitlab 18:31@pekr I assume that's why most languages opt for bindings to gui frameworks like qt ne1uno 18:33probably not every element is fully wrapped to work like a button automatically? hiiamboris 18:36it's not native controls that are a problem, it's tech debt View was written hastily to get funding for Red, and never was like really designed pekr 18:37@Moppy_gitlab But we were there already with the R2 and R3 and found our toolkits, system wise, being not fully compatible - especially in the resort of hotkeys, system look, etc. compatibility. Moppy_gitlab 18:46okay, well I'm glad this works. For future reference, I guess everything I want to use as a button, that isn't a button, should be a box? to-field: function [] [ view/flags [ new-size: field on-enter [canvas/size: to-pair new-size/text] ] [modal popup] ] view [ canvas: base 200x200 white return canvas-info: box 0.0.0.254 left 100x25 "200x200" on-up [to-field] ] hiiamboris 18:48you'll know, if it works then you're correct :) ne1uno 18:48base works for custom buttons usually hiiamboris 18:48box/base - same thing, different defaults 18:48but transparent colors also very problematic on W7 ne1uno 18:48x.x.x.254 for transparent ones Moppy_gitlab 19:26Can the pixels of a base be accessed and edited directly? Say for instance, I wanted to change a single pixel to a different color. 19:26not by adding something on top of the canvas, but by directly changing the canvas itself hiiamboris 19:30use image instead of base >> view/no-wait [i: image] >> i/image == make image! [100x100 #{ FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF... 19:30it's the same base but with image preallocated to it 19:32or add that pixel into draw facet of the base 19:32box 10x10 11x11 smth like that 19:33that's "on top" but it also eats less RAM gltewalt 19:35What are you trying to do @Moppy_gitlab 19:50 view [ size 200x100 title "View can view" button "Click Me" [ view [ text "I'm a pop-up" button "Ok" [unview] ] ] ] 19:52And alert exists to use as a guide/template for your own pop-ups. 19:52 alert: func [msg [string! block!]][ view/flags compose [ title "Message" below center text 200 (form reduce msg) center button focus "OK" [unview] on-key [ switch event/key [ #"^M" #"^[" #" " #"^O" [unview] ] ] ] 'modal ] Moppy_gitlab 20:09@gltewalt in a broad sense, remake ms paint as closely as I can, like https://jspaint.app/ 20:13view [image %something.png] is already better in that it preserves transparency gltewalt 20:26box might be of use 20:26It's a transparent base Moppy_gitlab 20:34the image! type lets you access pixel's value through a numbered path it seems, and every pixel is represented by 6 letters, or a tuple! value. >> x: load %pixtest.png == make image! [2x2 #{ED1C24FFAEC9FFFFFF000000}] >> x/1 == 237.28.36.0 >> x/2 == 255.174.201.0 hiiamboris 20:34x/1x1 20:34x/(as-pair x y) Moppy_gitlab 20:35that's convenient 20:37 x: make image! [100x100 255.255.255.0] view [ image x on-down [x/(event/offset): 0.0.0.0] ] hiiamboris 20:48:+1: Moppy_gitlab 21:22 repeat x-coor x/size/1 [repeat y-coor x/size/2 [ probe coor: make pair! reduce [x-coor y-coor] append/only storage reduce [coor x/:coor] ]] 1x1 1x2 2x1 2x2 3x1 3x2 4x1 4x2 5x1 5x2 == [[1x1 255.255.255.0] [1x1 255.255.255.0] [2x2 255.255.255.0] [2x2 255.255.255.0] [3x3 none] [3x3 none] [4x... 21:23coor is being set to what I expect it to be, but it's not evaluating in reduce to that 21:25probe reduce also gives me what I expect. 21:25so whatever is being appended to storage is different hiiamboris 21:26doesn't make sense 21:26works for me Moppy_gitlab 21:27x is this by the way x: make image! [5x2 255.255.255.0] 21:28okay, it works now 21:28after restarting the console gurzgri 22:02just a note, you can use coor: as-pair x-coor y-coorinstead 22:11and you can poke x event/offset 0.0.0.0 as an alternative to x/(event/offset): 0.0.0.0 if speed isn't your ultimate concern (it's a tad slower) Moppy_gitlab 23:09 This works, but if you move the pencil(mouse) too fast, it doesn't keep up and you end up with lots of little dots. mouse-state: 'up pencil: func [event] [ if mouse-state = 'down [ base-image/(event/offset): 0.0.0.0 ] ] base-image: make image! [200x200 255.255.255.0] view [ canvas: image all-over base-image on-down [mouse-state: 'down] on-up [mouse-state: 'up] on-over [pencil event] ] 23:10instead of a continuous line gltewalt:matrix.org 23:46What does view/no-wait give you? Moppy_gitlab 23:49the window instantly closes 23:50pretty sure that's what's it's supposed to do gltewalt 23:50Yeah. missremembering. I think you want to play with rate 23:51https://github.com/red/docs/blob/master/en/view.adoc#2-face-object Moppy_gitlab 23:54I've been trying. Setting it higher and higher up to 500000 doesn't seem to change anything 23:55I'm not sure it's related to the mouse even. 23:55on-over specifically 23:57it affects on-time Sunday 20th February, 2022 Moppy_gitlab 00:11I don't think time events know anything about the mouse on-time [print event/offset] none none none ...... 00:25This program doesn't have this issue. It doesn't use rate. The biggest difference seems to be that it draws lines instead of edits pixels 00:25https://gist.github.com/toomasv/70acbae8dc9d2511df319498592c7eed gltewalt 00:26Yeah, uses draw Moppy_gitlab 00:26for my purposes, that's not gonna work gurzgri 00:30no way that ’view/no-wait’ instantly closes a window, it rather opens a window but doesn‘t wait for events in an event loop. Moppy_gitlab 00:31should I record a video of it instantly closing? gurzgri 00:33The difference between toomasv‘s version and yours is that the former uses the draw block to draws lines to get lines from the old mouse pos to the current mouse pos, not just plots loose pixels at current mouse pos in an image 00:34minimal sample code to demonstrate should do 00:34No video required Moppy_gitlab 00:35his doesn't use no-wait 00:36my goal here is to quickly edit an image's pixels based on mouse position gltewalt:matrix.org 00:38It doesn't close here, but im using Mint Moppy_gitlab 00:56video of instant closing https://files.catbox.moe/duosq9.mp4 luis-rj 01:25@Moppy_gitlab Add do-events as last line of you program. Moppy_gitlab 01:27the problem persists gltewalt 01:31I'd guess that it can only be one of - a) the rate at which events are processing b) resolution 01:32@toomasv any knowledge here? Moppy_gitlab 01:32I asked elsewhere how you'd typically do this 01:32 You need to buffer the cursor position in memory so those pixels can be affected at a asynchronous rate to the script, display refresh or CPU time. > 01:33not a Red specific answer gltewalt 01:33Makes sense, but yeah.. I'm curious about Red specific Moppy_gitlab 01:34I wouldn't know how to make a buffer in any language, but uugh, I guess Red has support for that? gltewalt:matrix.org 01:39As far as I know you'd have to make one. But others will be along to give their 2 cents 01:44Maybe do the old fill bucket 🪣 part while you're stuch 01:53I'm stuck too, I dont know how to smooth it out without going into that buffer idea. 01:54Maybe... look at draw source code and see how it draws Moppy_gitlab 01:56I have no problem with using a buffer conceptually. ne1uno 01:56pixelation from integer x,y? maybe zoom in Moppy_gitlab 01:57you mean drawing a line, and then pixelizing it? 01:59line is some kind of abstraction of pixels, so whatever it uses to keep track of mouse position must also be usable for editing pixels. toomasv 07:11Drawing directly into image, but dotty: x: make image! [100x100 255.255.255.0] a: x/argb view [ below image x all-over on-over [if event/down? [x/(event/offset): 0.0.0.0]] button 100 "Clear" [x/argb: a] ] To draw with smooth continuous line I suggest using draw with spline. ldci 07:36@Moppy_gitlab You’ll find in redCV different routines (R/S) and functions (Red) such as rcvGetPixel or rcvSetPixel that allow getting and seting individual pixel value. toomasv 09:33With continuous line: view [ below pic: base white 100x100 draw [] all-over on-over [if event/down? [append face/draw event/offset]] on-down [append face/draw reduce ['spline event/offset event/offset]] button 100 "Clear" [clear pic/draw] ] hiiamboris 09:44after a few seconds this is gonna slow down a lot 09:45you have to rasterize points before the last two toomasv 10:34Maybe then: x: draw 100x100 [] clr: x/rgb view [ below im: image x draw [] all-over on-over [if event/down? [append face/draw event/offset]] on-down [ if not empty? face/draw [ dr: draw face/size face/draw x/rgb: x/rgb and dr/rgb clear face/draw ] append face/draw reduce ['spline event/offset event/offset] ] bt: button 100 "Clear" [clear im/draw x/rgb: clr] ] hiiamboris 10:45why not draw x face/draw? 10:46it actually has acceptable speed now, maybe because of D2D when I tested it on GDI back then it was *really* slowing down toomasv 10:46Yeah, of course. Silly me. hiiamboris 11:17wow I changed spline to curve and it crashes baaadly toomasv 11:31Did you use shape? And how do you place control points? hiiamboris 11:34 view [ below im: box 0.0.0.254 1000x600 draw [] all-over on-over [if event/down? [append face/draw event/offset]] on-down [ append face/draw reduce ['line-width 3 'curve event/offset event/offset] ] bt: button 100 "Clear" [clear im/draw] ] this is the crashing code need to simplify it :) toomasv 11:41This works x: draw 100x100 [] clr: x/rgb view [ below im: image x draw [shape []] all-over on-over [if event/down? [append face/draw/shape reduce [event/offset event/offset]]] on-down [ if not empty? face/draw/shape [draw x face/draw clear face/draw/shape] append face/draw/shape reduce ['move e: event/offset 'curv e e] ] bt: button 100 "Clear" [clear im/draw/shape x/rgb: clr] ] 12:31But control-points are nonsensical :) hiiamboris 12:32☻ 12:40 view [ im: box 0.0.0.254 1000x600 draw [] all-over on-over [if event/down? [append face/draw event/offset]] on-down [append face/draw reduce ['line-width 3 'line event/offset event/offset]] ] this is **unbearably** slow somehow 12:42almost okay on GUI console, but delayed by seconds on CLI console 12:50also, it's much faster if drawing by touchpad, and only slow when using touchscreen 12:54or maybe it's random, depending how it aligns with the timer gurzgri 13:11can't confirm this, same acceptable speed in cli and gui console here on a SurfacePro7 i5-1035G4 @ 1.10GHz 8 GB, latest automated Red build. no differences between mouse, touchpad or touchscreen hiiamboris 13:16interesting! need to investigate this more 13:16Surface has a discrete GPU? 13:22what if I add probe to CLI console: view [ im: box 0.0.0.254 1000x600 draw [] all-over on-over [if event/down? [append face/draw event/offset probe length? face/draw]] on-down [append face/draw reduce ['line-width 3 'line event/offset event/offset]] ] still fast? gurzgri 13:26ask me something simpler, especially ask me nothing about GPUs ;-) ... I think I stopped following them after Denise and Lisa. Should be a Intel Iris Plus Graphics G4 (Ice Lake 48 EU) without dedicated graphics eDRAM. hiiamboris 13:28I really don't get it. It usually starts slow for me like I'm drawing 100-200px away from where I see the changes, then esp. on touchpad, after like 10 seconds it starts to keep up and now it's not slow anymore, even though the number of points maybe close to 500 by now gurzgri 13:28With probeing, GUI slows way down, no noticable degrading with CLI console. hiiamboris 13:28nah, GUI is expected to slow down gurzgri 13:29yeah, thought so 13:30number of points doesn't matter much, I almost painted the whole canvas black :D hiiamboris 13:30lol 13:31![](https://i.gyazo.com/2b7232149c07fb82c47459438d442e58.gif) 13:31here it's even visible - first 3 seconds (touchpad) delay is so huge that it creates inertia 13:32then it suddenly syncs with me and keeps up after 13:33but I've no idea about the reasons :laughing: 13:41battery mode doesn't affect it for me Moppy_gitlab 15:27@ldci thanks for pointing me in that direction. 15:28the point's not to make lines, the point's to edit pixels in a variety of ways 15:41does RedCV offer a way of dealing with the mouse? Because the mouse seems to be the problem point 15:51This works, but doesn't solve the issue. And when going out of bounds, it causes an access violation and closes the program on-over [if event/down? [rcvSetPixel base-image event/offset 0.0.0.0]] ne1uno 15:53check < 0? hiiamboris 15:54@Moppy_gitlab your previous bugs were fixed today Moppy_gitlab 15:55with text? hiiamboris 15:57yeah Moppy_gitlab 16:09This demonstrates the crux of the problem. base-image: make image! [200x200 255.255.255.0] view [ canvas: image all-over base-image on-over [if event/down? [print event/offset]] ] output 67x24 67x32 67x40 67x50 67x60 67x74 67x86 67x101 67x116 67x129 66x144 65x154 64x161 64x166 62x168 62x169 62x170 I held the mouse down the entire time, so there's no way it could have teleported from 67x24 to 67x32. I need a way to capture every single pixel the mouse goes while the button is held down. hiiamboris 16:14study the solutions above ne1uno 16:17high mouse acceleration dpi? I'm not seeing much breakup Moppy_gitlab 16:19Okay, I'll read Red/System docs so I can understand this https://github.com/red/red/blob/89896f9c1e3d9ddbe97d33392d3239b00df0afb3/modules/view/draw.red hiiamboris 16:20don't overcomplicate the task :) 16:20what you're looking for is like 3 lines of code Moppy_gitlab 16:21I know this task is possible in a browser with javascript of all things. I don't know how though. ne1uno 16:25https://www.tutorialspoint.com/How-to-draw-on-the-canvas-with-JavaScript 16:30that's not a good example, looks like default html5 canvas accepts drawing by default Moppy_gitlab 16:47https://developer.mozilla.org/en-US/docs/Web/API/Element/mousemove_event 16:48> The frequency rate of events while the pointing device is moved is implementation-, device-, and platform-specific, but multiple consecutive mousemove events SHOULD be fired for sustained pointer-device movement, rather than a single event for each instance of mouse movement. Implementations are encouraged to determine the optimal frequency rate to balance responsiveness with performance. 16:48https://w3c.github.io/uievents/#event-type-mousemove 16:56maybe interpolation could work hiiamboris 16:58read the above like 5 times and still don't understand what it's saying :/ Moppy_gitlab 17:00I think, if movement puts events on a queue that happen consecutively, every movement causes multiple events. So even if I just moved the mouse one pixel, it would return its offset 5 times hiiamboris 17:03but that would pixelate the movements, make lines look like in 80s 17:04I doubt that's what it's saying ne1uno 17:10you're going to have to know if the movement was continuous to interpolate. de-bouncing user intentions is probably more than you want to do. 17:16https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API/Tutorial/Basic_animations there's probably a drawing on canvas section here but I didn't find it Moppy_gitlab 17:35I guess like this a: 1x1 b: 5x7 straight-gen a b { desired output [ 1x1 2x2 3x3 4x4 5x5 5x6 5x7 ] } 17:37I'll make a block(for x difference), then turn each member into a pair(y difference) hiiamboris 17:40I'd recommend to rethink your approach. It was already solved idiomatically in the above examples by Toomas. 17:40On the other hand if you pursue this, you'll realize why it's deeply wrong. Also a good thing. Moppy_gitlab 17:42If you're trying to feed a bird, and you feed a cat instead, you fed an animal, but not the right one. ne1uno 17:43http://en.wikipedia.org/wiki/Bresenham%27s_line_algorithm the 5th day adventofcode 2021 was about line intersection. hiiamboris 17:45aliased :) ne1uno 17:45guessing your mouse sensitivity is high too Moppy_gitlab 17:46my mouse is normal. Hardware is really not relevant. toomasv 18:18Somehow 1x1 is not there? i: draw 10x10 [anti-alias off line 1x1 5x7] collect [repeat r 10 [repeat c 10 [if i/(p: as-pair c r) = black [keep p]]]] ;== [2x2 2x3 3x3 3x4 4x5 4x6 5x6 5x7] hiiamboris 18:19start with 0x0 toomasv 18:19Then 5x7 will not be there hiiamboris 18:22why? 18:22![](https://i.gyazo.com/c12430002b722355757579d6bb986149.png) toomasv 18:23Hmm.. tired? collect [repeat r 10 [r: r - 1 repeat c 10 [c: c - 1 if i/(p: as-pair c r) = black [keep p]]]] == [2x2 2x3 3x3 3x4 4x5 4x6 5x6 5x7] hiiamboris 18:23D2D follows coordinate system 3 here toomasv 18:24 collect [repeat r 10 [repeat c 10 [if i/(p: as-pair c r) = black [keep p - 1]]]] == [1x1 1x2 2x2 2x3 3x4 3x5 4x5 4x6] hiiamboris 18:25well, your line is 5x7 - 1x1 = 4x6 pixels in size (outline) 18:26![](https://i.gyazo.com/bb1aa7b5ddefe002efce09d60d4a25d5.png) toomasv 18:28Ok, so it draws to the "start" of 5x7? hiiamboris 18:29![](https://i.gyazo.com/cb231bd263888ee03cce2c2c5b024ca6.png) 18:29red line coordinates are 1x1 to 5x7 on this pic 18:29there's no "start" or "end" toomasv 18:29:+1: bubnenkoff 18:33What principle difference when I should use object instead of block? foo: [a: 1 b: 2 c: 3] vs foo: object [a: 1 b: 2 c: 3] From real usage. I am using mostly blocks when I have same data structure, but now I see that at last real useful thing is support of casing object to json hiiamboris 18:36objects are heavier to create, but faster to select from Moppy_gitlab 18:39this produces some, uugh interesting results initial: none pencil: function [event] [ base-image/(event/offset): 0.0.0.0 ] straight-gen: function [init-pair final-pair] [ x-diff: final-pair/1 - init-pair/1 y-diff: final-pair/2 - init-pair/2 xvals: copy reduce [] repeat x absolute x-diff [ x-to-add: x if negative? x-diff [x-to-add: x-to-add * -1] append xvals reduce [init-pair/1 + x-to-add] ] vals: copy reduce [init-pair] repeat y absolute y-diff [ y-to-add: y if negative? y-diff [y-to-add: y-to-add * -1] case [ tail? xvals [ append vals as-pair xvals/-1 (init-pair/2 + y-to-add) ] (init-pair/2 + y-to-add) > xvals/1 [ append vals as-pair xvals/1 (init-pair/2 + y-to-add) ] true [ append vals as-pair xvals/1 (init-pair/2 + y-to-add) xvals: next xvals ] ]] vals ] base-image: make image! [200x200 255.255.255.0] view [ canvas: image all-over base-image on-down [initial: event/offset] on-over [if event/down? [ foreach pixel (straight-gen initial event/offset) [ base-image/:pixel: 0.0.0.0 ] ]] on-up [initial: none] ] hiiamboris 18:40wow gltewalt:matrix.org 18:49> but that would pixelate the movements, make lines look like in 80s Queue up events, blow out queued events (serially). Moppy_gitlab 18:50now it's a little better view [ canvas: image all-over base-image on-down [initial: event/offset] on-over [if event/down? [ foreach pixel (straight-gen initial event/offset) [ base-image/:pixel: 0.0.0.0 ] ] initial: event/offset ] on-up [initial: none] ] gltewalt:matrix.org 18:51Like buffering for video Moppy_gitlab 18:55except for straight lines that go up and down(kinda, not really), the desired result has not been achieved. There's also a noticeable delay between mouse movement and pixel color changing. With my current information, I give up. ne1uno 18:55que unique sequential events, react on a timer to smooth line output. to what end? avoiding draw? Moppy_gitlab 18:56I'm not avoiding draw, I don't need draw. Draw is tangential to what I've trying to do. hiiamboris 18:57no it's not Moppy_gitlab 18:57ms paint is the goal hiiamboris 18:57draw is exactly what you should have used GiuseppeChillemi 18:57I would like have a dynamic command whose refinements are defined by a word like: r: 'part copy/:r [a b c] 2 But it does not work I have tried in REBOL >> do to-path reduce ['copy r] [a b c] 2 == [a b] It does work but not in RED. I have to use: do reduce reduce ['to-path reduce ['copy r] [a b c] 2] Which is far less readable than both the above versions Is there a way to have the first version, which is very easy to manage, write and read? Moppy_gitlab 18:57ms paint does not make line objects, it edits pixels 18:57when you use the pencil hiiamboris 18:57so study draw better 18:57? draw 18:58like I said, your task was already solved above today :) Moppy_gitlab 18:58I don't think you understand my task hiiamboris 18:59> Is there a way to have the first version, which is very easy to manage, write and read? @GiuseppeChillemi no, by design, variable arity is forbidden to make interpreter faster and more predictable 19:00@Moppy_gitlab I do :) Moppy_gitlab 19:00In that case, you'd be able to say how draw accomplishes what I'm trying to hiiamboris 19:00? draw Moppy_gitlab 19:01I don't know why you're getting defensive. hiiamboris 19:01 DESCRIPTION: Draws scalable vector graphics to an image. Moppy_gitlab 19:01I'm not doing vector graphics 19:01vector graphics is not my goal hiiamboris 19:02ignore that 19:02read "TO AN IMAGE" GiuseppeChillemi 19:02@hiiamboris I know, we have talked about this 2 years ago. But I have hoped refinement could be evaluated before arity i defined so the interpreter know that copy/:r needs 2 args instead of 1. hiiamboris 19:03@GiuseppeChillemi well, I wish for that too sometimes (not too often though) Moppy_gitlab 19:03"To an Image" doesn't imply anything about raster graphics hiiamboris 19:03image! is a raster array in Red, aka bitmap GiuseppeChillemi 19:04 ref: 'part command: to-path reduce ['copy ref] do reduce [command [a b c] 2] == [a b]> hiiamboris 19:04just make a wrapper that works for both R2 and Red Moppy_gitlab 19:05>Raster-based image editors, such as PaintShop Pro, Corel Painter, Adobe Photoshop, Paint.NET, Microsoft Paint, and GIMP, revolve around editing pixels, unlike vector-based image editors, such as Xfig, CorelDRAW, Adobe Illustrator, or Inkscape, which revolve around editing lines and shapes (vectors). hiiamboris 19:06I know what raster is and I know what you're trying to do, and I stand by my point draw function is the way Moppy_gitlab 19:06even if I could finagle it, it's still an extra step going from vector to raster hiiamboris 19:06don't be so stubborn, plz? 19:08either you leverage draw or you reimplement it by modifying individual pixels 19:08there's no other way GiuseppeChillemi 19:09The most important thing I miss is to ability to run a function returned but another one or as result of a selection: f: reduce ['f1 func [a b] [print [a * b]] 'f2 func [a b] [print [a + b]]] select f 'f1 arg1 arg2 Moppy_gitlab 19:09I'd rather reimplement it. I don't know how I'd do that now. Hence what I said earlier about giving up. hiiamboris 19:09mkay GiuseppeChillemi 19:09or f/f1 arg1 arg2 ne1uno 19:09found https://github.com/raevilman/excalidraw while looking up their https://github.com/raevilman/windows-scripts/tree/master/mouse/speed 19:09not sure if it's 19:10not sure if it's vector or raster, but likely simpler than paint.net gltewalt 19:11A hue amount of stuff, though hiiamboris 19:12@GiuseppeChillemi why select? myfunction/f1 is an active accessor already 19:13f/f1 should work 19:14ah, I see what you're doing GiuseppeChillemi 19:14You are right, I have forgotten about this. It is just you can't execute when returning a function as result of another one! hiiamboris 19:14f2: f/f1 f2 arg1 arg2 19:14cleanest way GiuseppeChillemi 19:18@hiiamboris :point_up: [20 febbraio 2022 20:09](https://gitter.im/red/help?at=621291d36b91242320fb15c8) I have corrected the example, it is now what I want to do. hiiamboris 19:20well, that one is not returning a function 19:20but I've shown you the way without reduce GiuseppeChillemi 19:25Why? f: reduce ['f1 func [a b] [print [a * b]] 'f2 func [a b] [print [a + b]]] select f 'f1 == func [a b][print [a * b]] hiiamboris 19:26I mean this: > when returning a function as result of another one! GiuseppeChillemi 19:27Pardon, I have not understood! 19:27Could you repeat the example with the source data? hiiamboris 19:29ah nevermind 19:29sorry I need to make dinner fast 19:45@GiuseppeChillemi I'm sayin your code does not have a function that returns a function 20:03@Moppy_gitlab regarding your quest. I know nothing of mspaint source code, but I'm confident that it doesn't include a vector rasterizer. Nor does Red - it just lets OS do all that. And OS lets the driver do that. Just how low level do you wanna get with this? Red/System would be a better language for this task than Red. greggirwin 20:26@Moppy_gitlab your straight-gen confused me, as to your goal. I haven't followed the other links posted, but for a pencil brush, you should just be able to poke the color value into the image's pixel at a given position. Moppy_gitlab 20:27@hiiamboris As low as necessary to get a clean solution with no magic involved as to how events work. hiiamboris 20:28what events? 20:29what magic? Moppy_gitlab 20:30Toomas suggesting I used spline. Even if this would fix things, I don't how it does. I have no idea how spline works and draw as a whole. hiiamboris 20:31like I said, it gets down to the driver and DirectX code 20:31do you wanna go that low? maybe also to program the GPU? Moppy_gitlab 20:31I don't want to append a draw block millions of times hiiamboris 20:31anyway, my point is, you have to balance your task's complexity with your skills 20:31otherwise it will be no fun for you 20:32no fun = no learning Moppy_gitlab 20:32the draw block is going to get gargantuan 20:32editing the image itself is cleaner hiiamboris 20:32don't append, just understand that draw function draws a stroke on a bitmap 20:32I've spent whole evening trying to get this thru to you :) 20:33after it's drawn - there's just pixels Moppy_gitlab 20:33 on-down [ if not empty? face/draw/shape [draw x face/draw clear face/draw/shape] append face/draw/shape reduce ['move e: event/offset 'curv e e] ] 20:33append is right there hiiamboris 20:33that's because Toomas didn't choose to draw *every* intermediate line, only the whole line after mouse-up event 20:34doesn't stop you from doing that Moppy_gitlab 20:35I haven't seen any instance of putting a line in draw [] that doesn't involve appending to draw 20:36the line should not be deletable 20:36it should replace the color values of the pixels in those locations hiiamboris 20:37do you understand the distinction between face's draw facet (which is a block) and a draw function that commit similar block to the bitmap? gurzgri 20:37you seem to confuse face/draw block with the function draw. hiiamboris 20:37:turtle: 20:37:rocket: gurzgri 20:37beat me :D GiuseppeChillemi 20:38@hiiamboris I have spent the last hour making this. It works for Rebol and Red. run-a-cmd: func [ "Run a command by name with separate refinements and argument" 'cmd [word! function! action!] "The command name or a function" ref [word! block! none!] "The refinements" args [block!] "the arguments" /local the-command command exe run? the-ref in-cmd ] [ run?: true exe: copy [] either any [function? :cmd action? :cmd] [ in-cmd: :cmd the-command: 'in-cmd ] [ the-command: :cmd ] either none? ref [ the-command: append reduce [the-command] args ] [ if block? ref [ forall ref [ the-ref: first ref if any [not word? the-ref not refinement? the-ref] [run?: false] ] ref: to-path ref ] the-command: append append/only exe to-path reduce [the-command ref] args ] either run? = true [do the-command] [make error! "Invalid refinements!"] ] probe run-a-cmd copy none [[a b c]] probe run-a-cmd copy 'part [[a b c] 1] probe run-a-cmd :copy none [[a b c]] probe run-a-cmd :copy 'part [[a b c] 1] probe run-a-cmd :copy [deep part] [[a b c] 1] probe run-a-cmd :copy [deep part 22.2] [[a b c] 1] Result: [a b c] [a] [a b c] [a] make error! [ code: 800 type: 'user id: 'message arg1: "Invalid refinements!" arg2: none arg3: none near: none where: none stack: none ] Suggestion are welcome! Moppy_gitlab 20:39there are no functions in view though. just faces hiiamboris 20:39:clap: @GiuseppeChillemi gurzgri 20:40´system/words/draw´ or, as we say, global context hiiamboris 20:40yeah I pointed to ? draw like 3 times already :) gurzgri 20:40I know. Moppy_gitlab 20:41so there's the draw dialect, draw facet and draw function hiiamboris 20:41yep 20:42and it's all documented in https://w.red-lang.org/en/draw Moppy_gitlab 20:45so this guide is not actually about draw https://www.red-by-example.org/draw.html 20:45the function 20:45or dialect 20:46or whatever it is I should be using 20:47Looks like a facet of base to me view [ canvas: base 150x150 draw [line 10x0 160x50] ] hiiamboris 20:57correct Moppy_gitlab 21:01 base-image: make image! [200x200 255.255.255.0] draw base-image [line 0x0 10x10] view [image base-image] I did not know you could do this. hiiamboris 21:02that's why I initially insisted you study the Toomas' example Moppy_gitlab 21:06there seems to be a difference between save and write 21:08>Note that write is intended for storing data, not code. or files I guess hiiamboris 21:09save is roughly write mold Moppy_gitlab 22:48[![res.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/zL9l/thumb/res.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/zL9l/res.png) 22:48 base-image: make image! [200x200 255.255.255.0] draw base-image [anti-alias off line 0x20 150x21] above, result of this, below, what I'm trying to do(should go one pixel below initial point, but you know what I mean) 22:53This makes a hole in the line draw base-image [anti-alias off line 0x20 150x22] 22:53[![res2.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/7Ik5/thumb/res2.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/7Ik5/res2.png) ne1uno 23:03invent grey half pixels? 23:06line-width 2 Moppy_gitlab 23:11so is draw's vector -> bitmap system limited in how precise it can be? ne1uno 23:12what are the options? zoom out and you can have more pixels 23:20keep lines horizontal, vertical or 45 degrees to minimize jaggies 23:45https://github.com/red/red/wiki/[PROP]-Image-coordinate-systems-reboot-idea similar problem shows up in scale & rotation Monday 21st February, 2022 pekr 06:34I would like to say, that even with R2, user called Geomol created a paint program, which resembled Amiga Deluxe paint, and it worked. I just can't find any screenshots right now .... ne1uno 06:46Rebol Geomol paint turns up a bunch of links. R2 draw effects would need work pekr 06:52None of them are useful to the topic. Just wanted to show you a Rebol version of Amiga Deluxe Paint in under 200KB of code. Would have to dig some harddrive. ne1uno 06:54https://pastebin.com/Xpz2Nq9Y 06:57>Paint REBOL version "Frank Sievertsen" Red port "Gregg Irwin" pekr 06:59That's not it. Geomol (John Niclasen) was very skilled Rebol programmer. He even created a Rebol clone called World programming language. I think, it is abandoned, as its website dissappeared, but it can be found via Github, last commits in 2016 .... 06:59But - there was multiple simpler paint programs and as for Red, I think stuff from Toomas are quite inspirational .... ldci 07:01See http://www.world-lang.org ne1uno 07:01https://github.com/Geomol/World/ 07:11I used some amiga paint & cad and the video toaster in the early 90's at a marketing company. way ahead of anything else I had access to then. toomasv 08:43@Moppy_gitlab Something like this? img: draw 200x50 [] clr: img/rgb paint-line: function [img [image!] points [block!]][ img/rgb: clr forall points [ if not last? points [df: points/2 - points/1 case [ any [df/y = 0 df/x = 0 (abs-x: absolute df/x) = (abs-y: absolute df/y)] [ draw img compose [anti-alias off line (points/1) (points/2)] ] abs-x > abs-y [ dy: pick [-1 1] df/y < 0 dx: df/x / ay: abs-y + 1 x: points/1/x y: points/1/y loop ay [draw img compose [anti-alias off line (as-pair x y) (as-pair x: x + dx y)] y: y + dy] ] true [ dx: pick [-1 1] df/x < 0 dy: df/y / ax: abs-x + 1 x: points/1/x y: points/1/y loop ax [draw img compose [anti-alias off line (as-pair x y) (as-pair x y: y + dy)] x: x + dx] ] ] ]] ? img ] get-points: function [img [image!]][collect [repeat r img/size/y [repeat c img/size/x [if img/(p: as-pair c r) = black [keep p]]]]] show-points: function [img [image!] /cols cls][cls: any [cls 20] points: get-points img probe new-line/skip points true cls ()] E.g.: paint-line img [1x20 150x22 148x50 200x50 200x1 150x50] hiiamboris 09:20or just don't turn off antialias :) toomasv 09:21It's not same hiiamboris 10:11![](https://i.gyazo.com/f7cf31839062ab1dff7ad7f3ac183eb8.png) 10:11:) 10:19question is, why is it not symmetric? ;) toomasv 10:52Excellent tool! But... ... what about following comparison? First is by my code above, second is anti-alias on, third anti-alias off, fourth just draw, all scaled by 3: 10:52[![image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/uwwX/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/uwwX/image.png) 10:53Third is with line-cap round as in yours. hiiamboris 11:00it's a mess :) 11:00![](https://i.gyazo.com/242ac1784a32ef882f655679982f5b90.png) 11:03some implementation artifacts which are likely different across platforms toomasv 11:08My code for above comparison: bi: draw 200x50 [] paint-line bi [1x20 150x22 148x50 200x50 200x1 150x50] gi: draw 200x50 [] draw gi [line 1x20 150x22 148x50 200x50 200x1 150x50] hi: draw 200x50 [] draw hi [anti-alias off line-cap round line 1x20 150x22 148x50 200x50 200x1 150x50] view [below box 1000x200 draw [scale 3 3 image bi] box 1000x200 draw [scale 3 3 image gi] box 1000x200 draw [scale 3 3 image hi] box 1000x200 draw [scale 3 3 line 1x20 150x22 148x50 200x50 200x1 150x50] ] hiiamboris 11:10explore draw 200x50 [anti-alias off line 1x20 150x22 148x50 200x50 200x1 150x50] on GTK: ![](https://i.gyazo.com/c23f13a6fa49fafa83dddedd9b161f72.png) 11:11open source beats it toomasv 11:15How does paint-line-d image look in your explore? hiiamboris 11:17![](https://i.gyazo.com/f814e062d1827ab3b1a38294910a9e7f.png) toomasv 11:18Thanks! Not too bad. hiiamboris 11:18yeah pretty good :) 11:18off by a pixel though? I think it draws from pixel's center to pixel's center 11:18not from corner to corner toomasv 11:20I devised it so as to match my taste for what I would expect from it ... hiiamboris 11:20ok :) 11:24draw should be like this then for fairer comparison: ![](https://i.gyazo.com/d0a7b9f05cf315b2b443a9536402c0b4.png) toomasv 11:41Ha, I like it more! :) 11:43But why do you need line-cap round? hiiamboris 11:46just forgot to remove, it doesn't seem to do it's magic when line has >2 points toomasv 11:48Ok, thanks. 11:50Maybe line-join? 11:53Naah.. Moppy_gitlab 15:52@toomasv Thank you for writing that. @ne1uno mentions this sort of thing happening in scale and rotation too. While for each one, a workaround is probably possible, at that point, you might as well "fix" anti-alias itself. I don't expect anyone to do that for something so specific and seemingly niche. ne1uno 15:58nothing is broken, there is a physical limit of how you deal with limited pixels. Moppy_gitlab 15:59what do you mean by that? ne1uno 16:00vector drawing is another workaround. you describe shapes exactly, then render Moppy_gitlab 16:01to draw a line that ends one pixel below the initial point, anti-alias off needs to be used, and its functionality needs to be added to by adding logic which breaks the line down into pieces. 16:02if anti-alias off had all that built into it(in a generalized way), such things wouldn't be necessary hiiamboris 16:08> to draw a line that ends one pixel below the initial point, anti-alias off needs to be used not true though Moppy_gitlab 16:11[![alias.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/SBUM/thumb/alias.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/SBUM/alias.png) 16:12pretty much every feature was made with anti-alias being on in mind, since it's the default and all 16:14so to make a program where every feature is anti-alias off by default, a lot of workarounds are probably needed hiiamboris 16:18write a mail to micro$oft :) Moppy_gitlab 16:19does microsoft have something to do with this? hiiamboris 16:20who else do you think writes Direct2D? Moppy_gitlab 16:21mmm, I see. So it comes back to vector graphics. 16:26@pekr Did R2 have a built-in graphical facility? 16:27R3 view's draw dialect seems to have took a similar approach to Red 16:28http://rebol.com/docs/draw.html 16:29apparently R2's didn't even have anti-aliasing pekr 16:39R2 had antialiasing, since it was based upon AGG library. Moppy_gitlab 16:41Yeah, after trying it, I can see that. 16:41R3 has "new anti-aliasing" 16:47[![test3.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/jW3a/thumb/test3.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/jW3a/test3.png) 16:48 base-image: draw 200x200 [] draw base-image [anti-alias off line-width .5 line 0x20 150x21] 16:48I mean.... ushakovs_gitlab 17:05 res: [] parse "a a a a " [any [ (ch:[]) 2 ["a" skip (append ch "a") ] (append/only res ch) ] ] length? res/1 I suppose res should be block of 2x2. But in fact it's block of 2x4. What is wrong with my code? hiiamboris 17:07https://github.com/red/red/wiki/[DOC]-Why-you-have-to-copy-series-values endo64 22:22@GiuseppeChillemi here is my version: run: function [cmd args /ref refs] [do probe reduce compose/deep [to path! [(cmd) (any [refs ()])] (args)]] >> run 'copy [next "abc"] [copy "bc"] == "bc" >> run/ref 'copy [next "abcabcabc" 2] [part] [copy/part "bcabcabc" 2] == "bc" >> run/ref 'find ["testing" "t"] [last] [find/last "testing" "t"] == "ting" Tuesday 22nd February, 2022 toomasv 07:45@hiiamboris @Moppy_gitlab Seems that GDI handles anti-alias off much better than D2D. Tried Jan 18, 2021 build. hiiamboris 09:56can't stop progress :/ Wednesday 23th February, 2022 Moppy_gitlab 03:47@toomasv What is GDI? Is this what you mean? https://docs.microsoft.com/en-us/windows/win32/gdi/windows-gdi 03:48I guess so if D2D is short for Direct 2D toomasv 04:23Yes. Red used GDI/GDI+ in its Draw engine earlier, but switched to [Direct2D](https://docs.microsoft.com/en-us/windows/win32/direct2d/direct2d-portal) about year ago. But I don't know the low-level details, or benefits. Have noticed some drawbacks though, some things that used to work, do not any more. pekr 05:59The main benefit is, that D2D is hw accelerated. I did some tests with the Particles demo and D2D provided a clear advantage in performance, whereas Direct / 3D stuff is known for having problems with precision .... Thursday 24th February, 2022 Moppy_gitlab 17:17wouldn't allowing users to choose the backend they use be better? ne1uno 17:19you can with compiling hiiamboris 17:22also GDI backend is not maintained ne1uno 17:25I thought the old gui would use GDI. I think you need to edit in Config before you build. the and may itself still require Dx11 D2D 17:26Config: [gui-console?: yes red-help?: yes draw-engine: 'GDI+] 17:31%environment/console/GUI/old/gui-console.red 17:32also not fully maintained, has a few quirks 18:45you could build a gui console from before 2021 to see how GDI+ looks, modulo any bugs fixed since Moppy_gitlab 18:51why not opengl, sdl2 or vulkan? ne1uno 18:56linux console uses gtk. hiiamboris 18:56those are 3d tech Moppy_gitlab 19:25not exclusively 19:27There's also OpenVG 19:29@ne1uno huh? There's no mandate that terminal emulators need to use gtk ne1uno 19:31yea, just for view I guess. I haven't used linux in awhile 19:33cairo 19:45there are some various gui wraps in the community repo? everyone should wrap a gui, at least once. hiiamboris 19:46:) 19:48@ldci wrapped a lot of them already ne1uno 20:04https://github.com/red/code/tree/master/Library/Vulkan greggirwin 20:54The idea of having user-configurable back ends sounds great, but it adds another dimension to being cross platform. That's already hard enough. And just as platform differences lead to lowest-common-denominator limitations, so will each different graphics and audio back end. So you end up exposing things at a low level and code is now *far* less portable. 20:56To ease things for the user, Red relies on what the OS provides, and minimizes all other dependencies. And the more options we support, even at the OS level, the more we have to keep up with. Rebol learned this lesson the hard way. At one time it ran on 43 OSs, but unless you have a champion for each one, who is dedicated long term, features and robustness can easily become very uneven. GiuseppeChillemi 21:43@endo64 I'll take a look at your version during the weekend. Friday 25th February, 2022 Moppy_gitlab 01:59OpenGL is intended to be cross-platform, though I guess there's caveats to that. Nuklear's approach sounds pretty appealing, and like something Red would be well suited for. >It was designed as a simple embeddable user interface for application and does not have any dependencies, a default render backend or OS window/input handling but instead provides a highly modular, library-based approach, with simple input state for input and draw commands describing primitive shapes as output. So instead of providing a layered library that tries to abstract over a number of platform and render backends, it focuses only on the actual UI. 02:00https://github.com/Immediate-Mode-UI/Nuklear Oldes 09:44Problem with these immediate UIs is, that you must draw everything on each frame. So it is not the best choice for generic tools. It is fine as a debug overlay for a game, where you draw everything anyway. 11:27But when reading the [Nuklear documentation](https://immediate-mode-ui.github.io/Nuklear/doc/index.html), it is possible not to draw on each frame and instead call do_ui when needed.. and as it just fills buffer with draw commands, it could work even with current Red. Moppy_gitlab 22:30 t: [ p [" " <p> 'val " " </p> "^/^/"] img [" " <img src= 'val] alt [" " alt= 'val > "^/^/"] ] probe t/p probe t/img why am I getting this output? [" " <p> 'val " " </p> "^/^/"] [" " <img src= 'val] alt [" " alt= 'val > "^/^/" ] 22:30I'd like probe t/img to give [" " 23:54img ["^-^-" "^/^/"] so here, if I want to replace val with something else, because val is in a tag, replace isn't going to work. greggirwin 23:57It works fine. >> tag: <img src= val alt= val > == <img src= val alt= val > >> replace copy tag "val" "ABC...XYZ" == <img src= ABC...XYZ alt= val > >> replace/all copy tag "val" "ABC...XYZ" == <img src= ABC...XYZ alt= ABC...XYZ > Moppy_gitlab 23:57maybe to-tag? 23:57okay, I see Saturday 26th February, 2022 greggirwin 00:00Play with some other types as the replacement value, to see how they work. You can also see the source for replace, which is more involved than you might expect. Moppy_gitlab 00:15this is more or less, what I was expected >> g: %ex.jpg == %ex.jpg >> tag: <img src= val alt= val > == <img src= val alt= val > >> replace tag "val" g == <img src= ex.jpg alt= val > >> replace tag "val" load g == <img src= ex.jpg alt= make image! [708x1000 #{ FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF... 00:16I've gotten the result I wanted out of the generator now. 00:17I don't know how pages are generally dynamically generated in "web 2.0" sites, but this is a start. 00:18Red as a "data-driven" language seems well suited for web dev considering that's mostly markup. Oldes 07:55You are not making valid HTML tags! Moppy_gitlab 08:02@Oldes what do you mean? 08:02seems to work 08:02page comes out fine 08:02form does all the work Oldes 08:04 is not what you should use in a HTML page. 08:05Yes.. after all these years.. browsers are very forgiving... but that does not means, that you should not generate valid pages... you should find [some HTML validator](https://validator.w3.org/) to see what all is wrong. Moppy_gitlab 08:08@Oldes I didn't actually use that 08:08that was just to see what would happen 08:09my actual output looks like this Oldes 08:10Ok then. Moppy_gitlab 08:11any information on how to use and stuff like that with Red? 08:13here maybe https://helpin.red/CGI-Processingwebforms.html 08:14seems to be about Rebol though ne1uno 08:15there's a video series on youtube using parse for markdown and @Bitbegin has red-markdown on github. just for the basic proof of concept. they seem unfinished 08:18probably a form vrs mold explorer on http://gist.github print does form and probe does mold? Moppy_gitlab 08:22 Red [] mid: function[ element [series!] input ] [ head insert skip copy element 2 reduce ["^/" input "^/"] ] tag-mid: function [ element [series!] inputs ] [ out: copy/deep element foreach input inputs [ head replace out/2 "redval" input ] out ] t: [ doctype [<!DOCTYPE html> "^/"] html ["" <html> </html>] head ["^-" <head> "^-" </head> "^/"] title ["^-^-" <title> "^-^-" </title>] body ["^-" <body> "^-" </body>] p ["^-^-" <p> "^-^-" </p> "^/^/"] img ["^-^-" <img src= redval alt= redval > "^/^/"] styled-img ["^-^-" <img src=redval alt=redval style=redval> "^/^/"] form ["^-^-" <form action=redval method="Post"> "^-^-" </form> "^/^/"] input ["^-^-^-" <input type=redval id=redval name=redval value=redval> "^/"] br [<br>] ] page: [ t/doctype mid t/html reduce [ mid t/head mid t/title "^-^-^-Example" mid t/body ;this is where all of a site's actual content goes compose/deep 'contentx ]] form-page: function [a-page content] [ replace a-page/5 'contentx [content] form reduce a-page ] 08:22this is what I wrote. Best part is I can immediately understand it. 08:30for writing cgi scripts, this seems to be the most up to date source https://github.com/red/red/wiki/[DOC]-Using-Red-as-CGI ne1uno 08:34maybe @rebolek html tools for form post or get rebolek 08:35Yes, I have some html tools and also a dialect for producing HTML from Red. Moppy_gitlab 09:06hmm, I'm not sure cgi is necessary. 09:06to use the tag and a reverse proxy 09:06not sure how I'd retrieve that information though 09:10http? rebolek 09:14@Moppy_gitlab you need to be running HTTP server. You can run either some 3rd party webserver (Apache, lighttpd, nginx, ...) or use the IO branch and run Red webserver (but that’s experimental and unfinished yet). Moppy_gitlab 09:14I've gotten nginx to run before 09:15getting something from and then sending it to a Red program is what I'm not sure of rebolek 10:17see the wiki page you posted, setup Red as CGI and then use input to read POST data and printenv to read GET data. Or use wrappers in my HTTP tools that would make it easier. dsunanda 16:42Simple question - I hope :) - how do I successfully reLOAD a SAVEd map? m: make map! [] put m 'key make object! [data: 1] save %m.txt m m: load %m.txt select m 'key == make ;; <=== was hoping for the object hiiamboris 16:45using Redbin dsunanda 17:40Thanks! (It's easy when you know how :) Tuesday 1st March, 2022 cosacam1 02:39Hi guys, yesterday I made a question in the wrong room. Here I go again: I've been working recently. I'm creating a face (so to call it) which is actually a scrollable list of checks and multiline texts. However, my red.exe has stopped working. I use REEDITOR-11 and it still compiles ok (so slowly!) but it can't interpret because red.exe is broken. I can't use the console any more for the same reason (actually the GUI console is red.exe). It opens and close inmediatly. I've been googling but all I find is same problem with cmd for many users. But cmd works fine in my laptop. Only red.exe doesn't. Any suggestions? -- Someone gave me this https://github.com/red/red/issues/5073 -- I did what stated there (use rebol to compile gui-console) here is rebol output -=== Red Compiler 0.6.4 ===- Compiling F:\red\red\environment\console\GUI\gui-console.red ... ...compilation time : 6252 ms Target: Windows Compiling to native code... ...compilation time : 127928 ms ...linking time : 3389 ms ...output file size : 1226752 bytes ...output file : F:\red\red\gui-console.exe == none --- but actually the gui-console.exe does absolutely nothing Help please gltewalt:matrix.org 04:23Your anti-virus is squashing it 04:25Look in quarantined files hiiamboris 09:45You need to compile consoles using command lines in some of the last posts on that issue for them to give you output. Oldes 09:45@Moppy_gitlab with each use of "^-" you are loosing at least 8 bytes. You should use TAB instead. Or #"^-" (char instead of string). hiiamboris 09:46If it's AV, wouldn't it delete the compiled GUI console? Oldes 09:47@cosacam1 use CLI console instead and run it from command line. So in case of errors you should see the output. gltewalt:matrix.org 12:49Nope, sometimes it just copies it to quarantine, or moves it on the first attempt to run the exe. red.exe blipping and then quitting / disappearing is classic AV. In days of yore it happened to me all the time. ne1uno 13:00earlier version ran ok? gltewalt:matrix.org 13:06Anyway it's easy to check. Turn off AV. Compile, Run. Eliminate that possibility. dsunanda 23:06False positives from AV is a total pain for small developers - eg: https://www.nirsoft.net/blog/2009/05/antivirus-companies-cause-big-headache.html You probably don't need to turn it off entirely - you'll have options to whitelist folders or files. Wednesday 2nd March, 2022 Moppy_gitlab 03:05@Oldes good to know Thursday 3th March, 2022 gltewalt:matrix.org 12:42So... was I right? AV? He disappeared greggirwin 18:33That happens. Saturday 5th March, 2022 bubnenkoff 13:05How to measure time to get function execute time? >> a: now == 5-Mar-2022/16:02:16+03:00 >> b: now == 5-Mar-2022/16:02:19+03:00 >> a - b == 0 >> b - a == 0 pekr 13:15you can use now/precise .... but we've got a dt(time-it) function for such purposes already. You can use source dtto look into what it is doing. bubnenkoff 13:20thanks! greggirwin 17:12If you use now or now/precise yourself, use difference instead of subtract. But it looks like we have a regression in date math. >> c: now == 5-Mar-2022/10:11:10-07:00 >> d: now == 5-Mar-2022/10:11:15-07:00 >> c - d == -1 >> d - c == -1 Should be 0. There was a date ticket fixed not long ago, which may be the cause. 17:13If someone can confirm, would you please open a ticket for it? hiiamboris 17:18 >> a: now == 5-Mar-2022/20:19:35+03:00 >> b: now == 5-Mar-2022/20:19:37+03:00 >> a - b == 0 >> b - a == 0 >> about Red 0.6.4 for Windows built 22-Feb-2022/5:26:32+03:00 commit #8126da7 >> 17:19hmm >> a/zone: -7 == -7 >> b/zone: -7 == -7 >> a == 5-Mar-2022/20:19:35-07:00 >> b == 5-Mar-2022/20:19:37-07:00 >> a - b == -1 >> b - a == -1 17:20zone 0 seems to be the turning point 17:22it's also buggy in 0.6.4 17:23maybe it's correct, we just don't know how it works? 17:24R2 gives 0 in both cases though greggirwin 17:25Interesting. Thanks for the R&D @hiiamboris. :+1: 17:26If the zone is the same for both dates, there should be a zero day difference. hiiamboris 17:27so should the calculation be done in the zone of the 1st operand? 17:28or should it return truncated number of 24h intervals? greggirwin 17:29That sounds reasonable, though my brain is split right now. hiiamboris 17:32\* imagines how Gregg plugs his brain to a steam generator and extracts electricity :) 17:35R2 buggy as well? >> a == 1-Jan-2001/11:11:11-12:00 >> b == 1-Jan-2001/11:11:11+13:00 >> a - b == 0 >> b - a == 0 either way this should not be zero greggirwin 17:44Given two identical dates, with one being in zone +24 or -24, we're at +/-1. The real world range is -11 to +14 but Red wraps at +/-16, 16 being the same as 0. Truncating makes sense here, since you're max zone diff is modulo'd. I don't think R2 is buggy, because the world is round. But Maybe. Let's ask some people in Samoa and Niue if they argue about which day it is. I might need a) coffee, b) to draft a viz, c) focus. I have a meeting in an hour so have to do some other work right now. hiiamboris 17:48but -12 and +13 are 25 hours apart 17:48R2 seems to ignore TZ completely? 17:49I'll make an issue for further discussion greggirwin 17:51> but -12 and +13 are 25 hours apart Which isn't possible in a 24-hour day, given that the date is the same. If we leave a location at the same time, flying in opposite directions, how far apart are we 12.5 hours later? hiiamboris 17:53I think you're missing critical part of timezone arithmetic here: if I'm living in +13 zone and you are in -11 zone, then when my date is Jan 1, your is Jan 2 17:54Though we're on the same meridian greggirwin 18:01Ah, we may be crossing our lines. <ba-doom-cha!> For this arithmetic, do we want the difference in *dates* or number of *days*. This is where I need to be able to step back and think about how the results will be used to calc other dates, etc. hiiamboris 18:06Exactly 18:06https://github.com/red/red/issues/5095 gltewalt:matrix.org 18:06Easier as a giant circular list greggirwin 18:09Thanks for writing that up @hiiamboris. :+1: @gltewalt:matrix.org, making a visual tool for this will also be good, to help people understand it. We've talked in the past about a time-clock app, and I still want to do that. gltewalt:matrix.org 18:10I found it difficult back in the day, but then I've always been not so talented 18:12But timezones around the world are effectively a circular list, due to the whole globe thing. hiiamboris 18:16most controversial region: https://en.wikipedia.org/wiki/Time_in_Antarctica 18:17technically you can have midnight 10 times a day if you move from zone to zone :) greggirwin 18:21And also the fun of daylight savings changes. Skip an hour or see the same one twice. In this case, it *seems* like we can just convert to UTC and do the basic math, but that may be what happens internally now, which is bugged. dsunanda 18:33An oldie, but perennially true -- Falsehoods programmers believe about time: https://gist.github.com/timvisee/fcda9bbdff88d45cc9061606b4b923ca (and regarding the second item on that list - never forget Sweden once had 30 February). gltewalt:matrix.org 19:15It gets even deeper https://www.timeanddate.com/time/international-atomic-time.html 19:15Have to pick a "good enough" outcome 19:35Looks like /precise is rounding ne1uno 20:12convert to julian if best guess more than 23 hour difference 20:26https://gist.github.com/luce80/96d48297f2307a713c918c68bf046520#file-dates-calcs-red Sunday 6th March, 2022 cosacam1 04:07hi guys again. well i had no AV running by the time I posted my issue. I couldn'y use CLI instead because it didn't showed up. Anyway I reinstalled W10 and here I am running again RED.exe succesfully. And I didn't dissapeared, I'm just a very busy man in several ways, and I don't have internet access all the time (I could have it using my phone but the screen is small and Gitter shows a purple ad which covers most of my screen) and blah, blah. besides, when I try to login Gitter via Github it always sends me a 6 digits code to my gmail account. So I need to enter gmail and read the code and enter it to Gitter. Why? I don't know. Ok I'm working. Thanks everybody. One question: how can I use size-text prior to defining the face. I mean- I wanna know the size a text will have in a future (non existing yet) face so I will create the face with a size where this text fits. I'm using fixedsys font so every char has the same width. Is there something in red like systemmetrics? Thanks 04:57Here's my code: 04:57Red [needs: view] txt: "qwertyuiop asdfgh jkl zxcv bnm" line-height: 2 * char-width: 12 ; in pixels chars-per-line: 10 len: length? txt lines: max 1 to-integer len / chars-per-line ; amount of lines used by txt, at least one sz: as-pair (chars-per-line * char-width) (line-height * lines) ; size of txt in pixels view [ text txt sz wrap font-name "Fixedsys" ] bubnenkoff 07:45My favorite question -- is there any progress with ports. I still need http timeouts... 08:31My http application started to behave strangely. The http responses are always two seconds or more. I can't figure out what the reason is. I created a minimal http server and checked on it. I get: >> print ttt. 0:00:02.04055 The server is https://gist.github.com/bubnenkoff/ca2ac7a0b3ed4522776050edfa31466c Application: http://localhost:5000/test insert-query: [{} ttt: dt [ send-request/data to-url http://localhost:5000/test 'POST object [ sql: to-json insert-query ] ] print ttt For http requests I am using https://github.com/rebolek/red-tools/blob/master/http-tools.red 08:42* insert-query: [ {} ] 08:55it's seems that this issue is happens only with local http server. I tested it with public, and response time is normal: do https://raw.githubusercontent.com/rebolek/red-tools/master/http-tools.red insert-query: [{}] ttt: dt [ send-request/data/verbose to-url http://www.thomas-bayer.com/sqlrest/ 'POST object [ sql: to-json insert-query ] ] print ttt 09:02I have tested it on two PC. Behavior is same. Very slow access to local http server and fast to external. Do you have any ideas? toomasv 12:20@cosacam1 I played with the idea, but the result is probably a bit too complicated: rt: none get-size: function [text font letters /extern rt][ replace/all text lf "" either rt [ rt/text: text repend clear rt/data [as-pair 1 length? text font/1 font/2] ][ rt: rtd-layout probe compose/only [font (font) (text) /font] rt/size: 2000x600 ] sz: size-text rt lt: round/ceiling/to sz/x / length? text 1 while [not empty? text: skip text letters][text: insert text lf] rt/text: head text x: letters * lt y: sz/y * round/ceiling/to sz/x / x 1 rt/data/1/2: length? rt/text as-pair x y ] txt: "qwertyuiop asdfgh jkl zxcv bnm" sz: get-size txt ["Consolas" 9] 10 view [rich-text sz with [text: rt/text data: rt/data]] Monday 7th March, 2022 cosacam1 18:08Thanks toomasv for your help. I've been studying it. It's interesting- 1) basically create a rich-text with the desired text and font; 2) use size-text to get the actual size in the rich-text; 3) insert linefeeds at 'letters' intervals (where letters is the desired amount of characters per line) 4) assign the modified text to the rich-text; 5) then getting and returning the actual size of the text after splitted in several lines. Some doubts: a) what is the '/font' at the end of rt: rtd-layout probe compose/only [font (font) (text) /font]; b) what are the refinements '/1/2' at rt/data/1/2: length? rt/text (I did ? rich-text and ? rtd-layout at CLI but I couldn't see any explanation of data). Finally, when I run your code, not all the text is shown. Thanks anyway. Meanwhile I managed to solve my problem yesterday. Here's my code: Red [needs: view] txt: "qwertyuiop ASDFGH jklzxcv bnm" line-height: char-width: 16 ; in pixels chars-per-line: 10 len: length? txt lines: max 1 round len / to float! chars-per-line ; ammount of lines used by txt, at least one sz: as-pair (chars-per-line * char-width) (1.6 * line-height * lines) ; size of txt in pixels ; 1.6 :: leave some vertical space for descendant characters like fgjpqy print [len lines sz] view [ text txt sz yellow wrap font [name: "Consolas" size: line-height] ] toomasv 19:05@cosacam1 You got it! I did it so the text can be splitted at any number of letters, not only on word borders. (Well, actually I did that too.) You'll get answers to your questions in rich-text [doc](https://github.com/red/docs/blob/master/en/rtd.adoc). If not, ask away and I'll try to answer, if I can :) cosacam1 21:21Thanks so much Toomasv Tuesday 8th March, 2022 toomasv 04:14You are welcome! Sunday 13th March, 2022 djrondon 12:56Hi Folks, Is there a documentation with examples of read/as mime-types csv, json, etc.? ne1uno 13:01@djrondon, try  https://github.com/red/red/wiki/Common-tasks-and-how-to-do-them-in-Red-(for-Python-programmers) djrondon 13:06thanks @ne1uno , Cool! :-; 13:31if I download the latest builds for linux and red --cli, Do I need to have installed GTK? ` 13:31 Unable to init server: Could not connect: Connection refused (console-2022-3-10-85264:2089400): Gtk-WARNING **: 13:29:13.824: cannot open display: hiiamboris 14:01you need xserver running 14:03or build console without View support djrondon 14:22so I have to compile. I thought that the option red --cli would allowed me just with the console without GUI. I don't have problems with the latest stable release, but with latest build. 14:22the latest stable version, red --cli is working 14:32I'm using the linux version, I think that latest build for linux is not prepared for the --cli option ne1uno 14:34stable is years old, before gtk view. would need 2 executables: view and no view djrondon 14:36I just want to use the console, because I don't have the GUI ne1uno 14:43you can get non gui rebol from http://rebol.com/download-core.html 14:50https://github.com/red/red for source, the readme shows options for building or running the console djrondon 15:14Ok. @ne1uno, I will do this. 15:33thanks @ne1uno . It worked! 21:17using the red console on linux, how can I give bold type as we can use in bash \033[1mresults:\033[0m echo -e "\033[1mresults:\033[0m" hiiamboris 21:24red char codes are hexadecimal, not octal 21:24^(1B) 21:24or ^[ 21:24https://w.red-lang.org/en/datatypes/char djrondon 21:25Thanks Monday 14th March, 2022 djrondon 01:36I compiled the console from the sources, but I couldn't compile my .red file with the new console, just with the old version. ne1uno 02:08to compile, the build needs the sdk but it's no longer available. you can run red source from rebol. 02:24the error message could be improved djrondon 02:25it's running ok, I just thought to generate the binaries with libRed 02:25but it's ok anyway 02:26I tried to run console -c -t Linux prog.red 02:26console is ok and up to date hiiamboris 09:08You can use Rebol to compile, like you did to create the console itself. ne1uno 14:02 header requires Needs: ['csv 'json] when compiling hiiamboris 15:14it's already in the header ne1uno 15:18Script Error: path element > header < does not apply to unset! type 15:18'csv 15:20no error at compile hiiamboris 16:02you're on the old console? ne1uno 16:05just tried again w/recent latest Red 0.6.4 for Windows built 8-Mar-2022/17:31:19-04:00 commit #b0e5493 16:06-r -t MsDos load-csv/header csv-data 16:06win10 hiiamboris 16:12https://github.com/red/red/blob/master/environment/console/CLI/console.red#L6 ne1uno 16:18why does the error go away when I add needs 'csv? hiiamboris 16:48ㄟ( ▔, ▔ )ㄏ Tuesday 15th March, 2022 bubnenkoff 19:10If I am compiling Red from sources will I would be able to use it fully as official builds? I an asking because I tried build odbc-branch, but I was not able to use result to compile my project because it did not recognized -c option and probable some others. Or I need to do some more manipulation to get own build work as I am expecting? hiiamboris 19:19you can only compile consoles 19:19and you can use the rebol compiler directly from rebol 19:20the launcher (which recognizes -c) is not compiled, it's packaged with Rebol/SDK mikeyaunish 20:45Didn't notice this change until now. The last version of Red (that I have) that the reaction works properly is: Red 0.6.3 for Windows built 24-May-2018/7:28:58-06:00 commit #ba9cabe view [ output: panel 200x200 gray button "load layout" [ output/pane: layout/only load { b1: button "move me" loose f1: field react [ f1/text: to-string b1/offset ] } ] ] To test it, click on the "load layout" button, then move the button labelled "move me". The text field should reflect the offset position of the button. No idea if this was meant to be a permanent feature of react or not? hiiamboris 21:28 >> dump-reactions >> 21:30looks like reactions get cleaned up during pane change and never recovered? 21:30make an issue anyway, it's a great case to think on design Wednesday 16th March, 2022 mikeyaunish 00:40@hiiamboris thanks for confirming. I will make an issue. bubnenkoff 10:37> the launcher (which recognizes -c) is not compiled, it's packaged with Rebol/SDK But that how red.exe works? I can compile all with them without Rebol hiiamboris 10:39red.exe is an R2 script (red.r) wrapped into an exe bubnenkoff 10:40Wow! I even can't imagine it! 10:41But why Rebol is still needed? What futures it have that Red have not? hiiamboris 10:42temporary compiler that we are using is written in Rebol bubnenkoff 10:44But what need to be implement to get Red self-hosted? hiiamboris 10:45just porting it to Red is a task team does not see very useful right now (although I believe there was an attempt by @oldes but it didn't work) bubnenkoff 10:47@hiiamboris and what status of ports branch? I have seen some activity there. When it would be merged? hiiamboris 10:47plan I think is, when we rewrite the compiler, we make it solid, so it's a big task 10:48> @hiiamboris and what status of ports branch? I have seen some activity there. When it would be merged? no idea :) you know how far plans usually go.. something happens along the way and the plan is scratched Oldes 10:48I was porting it to Rebol3 actually. But I don't have time for it and no need as well. hiiamboris 10:48thanks for clarifying 10:50anyway, Red changes a lot, so writing compiler in it right now would mean spending time maintaining it in a constantly changing environment Oldes 11:08Even the compiler written in Rebol is changing quite a lot, so it would be waste of time to do some real porting when there is no will to use it anyway. One would have to constantly follow all changes. Not to mention, that there is zero documentation and just a very few comments in the source. loziniak 12:14 >> change-dir probe %prj %prj == %/home/maciek/prj/ >> cd .. == %/home/maciek/ >> cd probe %prj *** Access Error: cannot open: %/home/maciek/probe/ *** Where: do *** Near : args *** Stack: cd change-dir cause-error Is there a reason why cd acts like that? 12:22also, what is the reason for what-dir and get-current-dir to coexist? hiiamboris 12:41@qtxie ? 12:42as for cd it's obviously so you can write cd prj as in bash loziniak 12:59it's probably same as with pwd – meant only for console use? hiiamboris 13:14yep Friday 18th March, 2022 redredwine 16:42parse question - If I have a string that already contains " " , how do i set a rule to include the quote in the string? e.g <a href="blablabla"> . I think rebol allows us to use { <a href="blablabla">}. but not sure how to handle that in Red. hiiamboris 16:46have you tried the same in Red? Monday 21st March, 2022 bubnenkoff 16:11Is it possible to get selected text from area? hiiamboris 16:14try view [area "a^/bc^/def^/1234" rate 1 on-time [attempt [probe copy/part face/text face/selected + 0x1]]] bubnenkoff 16:23thanks! toomasv 17:12@hiiamboris Dunno, this didn't do a thing for me on W10 :flushed: But this did: view [area "a^/bc^/def^/1234" rate 1 focus with [selected: 1x1] on-time [if (length? face/text) = face/selected/2: face/selected/2 + 1 [ probe "done" face/rate: none ]]] hiiamboris 17:14have you selected any text for it to "do the thing"? ;) toomasv 17:27Ha, something is happening :baby: hiiamboris 17:33:+1: Wednesday 23th March, 2022 redredwine 00:26@hiiamboris i tried the {} again today, it works. Thanks. Not sure what happened the other day. Thursday 24th March, 2022 GiuseppeChillemi 07:07How could I know if a datatype is part of a superset datatype? I mean: how could I know if integer! is part of number!? rebolek 07:08find number! integer! cloutiy 15:16Interesting GiuseppeChillemi 20:36I don't understand why of used in a block, I have to get it, otherwise I could use it directly. hiiamboris 22:12then you probably do not understand that *block is not evaluated* Friday 25th March, 2022 GiuseppeChillemi 09:20And where is written that a datatype is evalated before being interpreted? I have always thought of it as a terminal value. 09:22@rebolek > find number! integer! Is there a way to query integer for its parent without searching all datatypes? rebolek:matrix.org 09:25What do you mean by "evaluated before interpreted"? integer! is a word! that evaluates to integer datatype. GiuseppeChillemi 09:34Integer! has been for me always a datatype!, I mean a type of its own with different characteristics than word! because I have never read what you Rebolek and Hiiamboris are writing. It is written nowhere in Rebol Core doc. I am 20 in Rebol and i have never encountered anything about this fact. 09:37And when you read here: http://www.rebol.com/docs/words/wtypeq.html that /word - Returns the datatype as a word you think that the datatype is a "datatype" and not a word and then if you need it as a word, you must use /word refinement in type? rebolek:matrix.org 09:37Ok, let me show you something. x: 1. What is type of x? GiuseppeChillemi 09:38Set-word belonging to the words! superset? rebolek:matrix.org 09:40I wrote x so it's word!, but ok. And now: x!: 1 it's still word!, right? 09:42So why integer! should be different? It's a word, don't let the exclamation mark confuse you, is just a convention that works holding datatype value end with it. GiuseppeChillemi 09:44Yes, it was the exclamation mark that has led me to think it was not a word! but a datatype!. It's because of the symbolic decoding of the brain... 09:49But, is there a way to let Red recognize mydatatypename! as datatype when using type? rebolek:matrix.org 09:52For example mydatatypename!: :integer! GiuseppeChillemi 09:53A whole world opens. 09:54Is there any extra info I should know about using datatypes? Like the magic of find number! integer!? hiiamboris 10:21typeset is a kind of bitset, no other magic endo64 11:01Just type number! in the console and you see it: >> number! == make typeset! [integer! float! percent!] or better, type >> ? typeset! GiuseppeChillemi 16:55@hiiamboris so, no special accessor? hiiamboris 17:12what accessor? greggirwin 19:08> Is there any extra info I should know about using datatypes? Like the magic of find number! integer!? You can think of it *kind of* like find on a series, but more accurately, as @hiiamboris noted, like find on a bitset. We should into to [bitset docs](https://github.com/red/docs/blob/master/en/datatypes/bitset.adoc) on pick/poke/find and things like enbasing. 19:12> But, is there a way to let Red recognize mydatatypename! as datatype when using type? My canonical example for this is aliasing issue! as hashtag!. You have the type name and the type query func (i.e. issue! and issue?), which can be quite usable in many cases, but may be a liability in the grand scheme of things. GiuseppeChillemi 21:06What could go wrong? greggirwin 22:08It's not that something would "go wrong", as this is just another flexible part of Red. What I mean by being a liability is that programming in the large using *any* trick means more coordination. But I do think that the added meaning can be useful, especially in dialects. Saturday 26th March, 2022 hiiamboris 19:35Have you guys ever needed or used this function? >> ? distribute USAGE: DISTRIBUTE amount weights limits DESCRIPTION: Distribute a numeric AMOUNT across items with given WEIGHTS. DISTRIBUTE is a function! value. ARGUMENTS: amount [number!] "Any nonnegative number." weights [block!] {Zero for items that do not receive any part of AMOUNT.} limits [block!] {Maximum part of AMOUNT each item is able to receive; NONE if unlimited.} >> distribute 100 [1 2 1] [2e9 2e9 2e9] == [25 50 25] >> distribute 100 [1 2 1] [99 99 99] == [25 50 25] >> distribute 100 [1 2 1] [99 40 99] == [30 40 30] >> distribute 100 [1 2 1] [99 40 20] == [40 40 20] >> distribute 100 [1 2 1] [30 40 20] == [30 40 20] >> distribute 100 [1 0 1] [99 40 20] == [80 0 20] 19:37I'm just curious because I wrote it for Spaces, but it looks like something that *can* be generally useful. Sunday 27th March, 2022 GiuseppeChillemi 00:20I have neverused it, but It resembles a function that I have just written to calculate the column size for listviews, after scanning the column data. toomasv 08:32I haven’t used it, but looks very interesting. bubnenkoff 08:42How to make yellow panel take full width? view [ panel red [ ] panel blue [ ] return panel yellow [] ] hiiamboris 09:15'panel 210 yellow' or smth like this. bubnenkoff 09:18Only way to set absolute size? toomasv 12:36Use parent/size 12:36With with hiiamboris 12:40Alternatively, with https://gitlab.com/hiiamboris/red-elastic-ui you can write: view elastic [panel red [] panel blue [] return panel #fill yellow []] and also get automatic resizing if you enable it in flags ne1uno 13:10react [face/size/x: face/parent/size/x - 15] add after the item. I don't really understand how this works and it might miss some resize events hiiamboris 13:28should be - 20? GiuseppeChillemi 16:41While experimenting with select/skip I have told to my self, lets see if... >> type? select/skip [a b c none] 'c 1 == word! >> type? get select/skip [a b c none] 'c 1 == none! And yes, it is! hiiamboris 16:46☻ Monday 28th March, 2022 djrondon 00:58Is there any jwt library for red? greggirwin 01:04I think @rebolek started one, as did I. Need to dust it off and see what state it's in. 01:06[json-web-token.red](https://files.gitter.im/5780ef02c2f0db084a2231b0/wKD6/json-web-token.red) djrondon 01:42thanks @greggirwin ;-) rebolek 05:44@djrondon Yes, I have JWT library, I’m not sure if it’s online. planetsizecpu 07:13> Have you guys ever needed or used this function? > > >> ? distribute > USAGE: > DISTRIBUTE amount weights limits > > DESCRIPTION: > Distribute a numeric AMOUNT across items with given WEIGHTS. > DISTRIBUTE is a function! value. > > ARGUMENTS: > amount [number!] "Any nonnegative number." > weights [block!] {Zero for items that do not receive any part of AMOUNT.} > limits [block!] {Maximum part of AMOUNT each item is able to receive; NONE if unlimited.} > > >> distribute 100 [1 2 1] [2e9 2e9 2e9] > == [25 50 25] > >> distribute 100 [1 2 1] [99 99 99] > == [25 50 25] > >> distribute 100 [1 2 1] [99 40 99] > == [30 40 30] > >> distribute 100 [1 2 1] [99 40 20] > == [40 40 20] > >> distribute 100 [1 2 1] [30 40 20] > == [30 40 20] > >> distribute 100 [1 0 1] [99 40 20] > == [80 0 20] > @hiiamboris I never used distribute but I know at least one use case where it fits perfect: stock piling. When you have some number of items on one store location and have to distribute it to other locations wich have their own space limitations. As an example imagine a 40ft container filled with fencing grid rolls, to distribute along the shelves of a warehouse wich already have other older rolls. Userful, if you can subtract from the shelves location max loading value the already existing stock, that number would be the max value by location for the distribute func. bubnenkoff 08:27Am I right understand that if I am using throw function on success should always return none at the end? foo: function[] [ print "foo1" if (x > 1) [throw "x is greather than one"] return none] result: catch [ foo ] probe result hiiamboris 08:36Yes. 08:37@planetsizecpu thanks. Indeed, I'm using it after subtracting the current values too. GalenIvanov 10:21@hiiamboris The closest thing to distribute I remember I needed was in this [Pie-chart-direct-interface](https://github.com/GalenIvanov/Pie-chart-direct-interface). It's a good function to have. hiiamboris 10:22dead link 10:22or private? GalenIvanov 10:23oh, sorry - a private one 10:25Do you see it now? hiiamboris 10:26yes, thanks 10:27so there was a minimum limit for each slice? 10:31well I guess pie charts can use a simpler algorithm, just divide the circle GalenIvanov 10:31The minimum is 1% of the circle, since the sectors indicate the contribution of the 5 possible types to 100% 10:31Yes, indeed hiiamboris 10:32an interesting use case anyway, thanks GalenIvanov 10:32:+1: hiiamboris 10:33also interesting is how to make slices logarithmic in scale bubnenkoff 10:49What is the proper way to not break loop, but just stop iteration and continue it from same place? foo: function[] [ foreach el ["aa" "bb" "cc" "dd" "ee"] [ if (el = "bb") [ ; user need do some action in UI before continue iteration ] ] ] foo hiiamboris 10:51in existing UI or you can show a new dialog? bubnenkoff 10:52In existing hiiamboris 10:57 flag: off view [ base yellow "click to start loop" on-up [ foreach el [1 2 3 4 5] [ print el if el = 2 [ while [not flag][do-events/no-wait] ] ] ] base blue "click to continue" on-up [flag: true] ] bubnenkoff 10:59Thanks for example!! hiiamboris 11:01it's not a good practice though, you should weigh if it's necessary bubnenkoff 11:05what problems this approach have? 11:05infinity loop? hiiamboris 11:11for example, you can reenter into this loop many times by clicking yellow base 11:11of course you can work around that, but such code flow will be hard to predict and debug 11:13also, idk what will happen if you close the window before loops finish :) 11:13maybe it'll work, maybe not bubnenkoff 11:19So it's better to display modal window? hiiamboris 11:46yes bubnenkoff 11:49ok. Is it possible to display same list in main and new modal view? view [ list: text-list data ["aaa" "bbb" "ccc"] [ print list/selected ] button "modal" [ view [ list ; I want to display same list ] ] ] hiiamboris 12:03view [text-list data list/data] bubnenkoff 12:04thanks! greggirwin 17:28Distribute is a very nice func. I haven't used it exactly, because things needed to be in order, but I did a disc production system that needed to group data and then sort by what kind of disc to use (CD or DVD). Tuesday 29th March, 2022 bubnenkoff 17:39Is it possible to display non-modal window/zone in main app window? hiiamboris 18:15what do you mean by that? ne1uno 18:17docked? you can make a group or panel loose Wednesday 30th March, 2022 bubnenkoff 07:07I mean creating not blocking dialog. For example ask user about some action without creation new window dsunanda 08:41@bubnenkoff You probably want to use a technique like sub-panels - a way to switch in and out parts of the window display. The old Rebol website has some examples - you need to edit these very slightly as Rebol's VID dialect is not quite the same as Red's (eg VH2 --> H2 etc) http://www.rebol.com/how-to/subpanels.html endo64 08:58you can set a layout's parent to a window to show it inside: layout/parent [button "ok" [unview]] view/no-wait [size 300x300] none do-events hiiamboris 09:09Or make a hidden panel in advance. Then show it when you want. bubnenkoff 16:51Thanks! I also have plan to do small app for creation block-schemes. Which dialect it's better to use? Draw? Or there is something more suitable? hiiamboris 17:02https://gitter.im/red/red/gui-branch?at=6244113409092523184bb0cf greggirwin 17:04All those ideas would make a nice article. bubnenkoff 17:17> https://gitter.im/red/red/gui-branch?at=6244113409092523184bb0cf Thanks, but if diagram dialect is not in active developing, than how I could try to solve this problem? And which dialects have guarantees to have community support in future? greggirwin 17:19> And which dialects have guarantees to have community support in future? Those that are included in standard Red releases. hiiamboris 17:48@bubnenkoff still better to fix it than to roll your own ;) Friday 1st April, 2022 bubnenkoff 09:43Does crossbuild works now? I want to build GUI app from Windows for Linux ldci 09:46@bubnenkoff Yes. I’m writting apps under macOS and can cross-compile for Windows and Linux without problems: just red -t target filenane :) rebolek 11:10It always worked. bubnenkoff 14:49 >> a *** Script Error: a has no value *** Where: catch *** Near : a *** Stack: >> if not unset? 'a [print "value is exists"] value is exists >> >> if (not unset? 'a) [print "value is exists"] value is exists >> Why next code is show that value is exists, while it's not? hiiamboris 14:52help unset? 14:53also source unset? ldci 15:07@bubnenkoff. Using ‘a creates a word. Type? 'a —> word, but a has no value bubnenkoff 15:57> @bubnenkoff. Using ‘a creates a word. Type? 'a —> word, but a has no value Ah! Thanks! Tuesday 5th April, 2022 bubnenkoff 09:29I have block values for substitition in next format: mydata: [ [1 "Dopey"] [2 "Doc"] [3 "Bashful"] [4 "Sneezy"] [5 "Happy"] [6 "Grumpy"] [7 "Sleepy"] ] The function that accept prepared statment is accept data as: insert snowwhite [ "INSERT INTO Dwarves (Num, Name) VALUES (?, ?)" [1 "Dopey"] [2 "Doc"] [3 "Bashful"] [4 "Sneezy"] [5 "Happy"] [6 "Grumpy"] [7 "Sleepy"] ] remember me please how to make from mydata list of blocks? to get: [1 "Dopey"] [2 "Doc"] [3 "Bashful"] [4 "Sneezy"] [5 "Happy"] [6 "Grumpy"] [7 "Sleepy"] foo: function[blk] [ probe blk ] foo mydata hiiamboris 10:23mydata is already a block of blocks bubnenkoff 10:27So I can simply pass it without unwrapping? hiiamboris 10:33try it bubnenkoff 11:15 insert data-insert-statement reduce [ insert-part ; INSERT INTO lots ("purchaseNumber", "lotNumber", "deliveryTerm", "currency_code") VALUES (?,?,?,?) ["0373200040814000009" 1 "Some text here" "USD"] ; works ] do not works: insert data-insert-statement reduce [ insert-part prepared-values-part ; [["0373200040814000009" 1 "Some text here" "USD"]] ] error: *** Script Error: ODBC error: ["07002" 32 {The # of IPD parameters 1 < 4 the # of parameter markers}] *** Where: ctx||610~execute-statement *** Near : param So it seems that it's need it not as block of blocks hiiamboris 11:52seems so gurzgri 12:52First form: Simple block, gets reduced insert statement simple: ["SELECT INTO table VALUES (?, ?, ?)" a b c] Second form: Param block, won't get reduced, therefor e.g. compose/deep insert statement block: compose/deep ["SELECT INTO table VALUES (?, ?, ?)" [(a) (b) (c)]] Third form: Param "array", won't get reduced insert statement array: compose/deep ["SELECT INTO table value (?, ?, ?)" [(a1) (b1) (c1)] [(a2) (b2) (c2)] [(a3) (b3) (c3)]] Strictly speaking, the second form is no form on it's own, it's just a special case of the third form / array form with array length of 1. 12:55But pretty much all of this is documented in https://github.com/gurzgri/red/blob/odbc/environment/schemes/odbc.md I pointed you to already, it's in the "Parameter Arrays" section. 13:57@bubnenkoff Sorry, my bad - I see now that in private chat I edited your code sample such that there was this "inner outer block" ["SELECT ..." [[...] [...] [...]]] (sic!) which I didn't noticed w/o beeing able to actually run the code. At least the documentation is correct on this. meijeru 15:21For a toy implementation of the WORDLE game (see [here](https://wordlegame.org/)) I would need to print letters in color on the console. I looked at rich text, but that seems to be for the GUI only. How can I use ANSI escape codes? gurzgri 15:25print "^[[32mTest" meijeru 15:27Tried that, didn't work! gurzgri 15:29Works in Windows Terminal, might not work in other consoles. 15:30~~Works in cmd.exe, too.~~ My cmd.exe runs in Windows Terminal, too, probably that's why it works. meijeru 15:36I tried in the Red console. @Qtxie what can you tell me? hiiamboris 15:38@meijeru your OS version? 15:40https://superuser.com/questions/413073/windows-console-with-ansi-colors-handling/1050078#1050078 meijeru 15:44@hiiamboris W11 hiiamboris 15:45No idea there. On W10 ANSI is supported by default I think. meijeru 15:46@hiiamboris My desire is to have colors etc. show up in the Red console, not in the Windows console. hiiamboris 15:48In Red GUI console? 15:48I don't think it's supported. 15:54Use CLI or reinvent it. greggirwin 17:35There is experimental work on syntax highlighting in the Red console (IIRC), but that will probably be harder than other approaches right now. bubnenkoff 18:35> @bubnenkoff Sorry, my bad - I see now that in private chat I edited your code sample such that there was this "inner outer block" ["SELECT ..." [[...] [...] [...]]] (sic!) which I didn't noticed w/o beeing able to actually run the code. At least the documentation is correct on this. You mean that it's impossible to pass list of blocks like? [ [] [] [] ] But I have problem to generate blocks for passing without nesting. Because I do not understand how to pass data to statement Or I need way to deblock it to make it as statement expected it. gurzgri 18:48Problems exists so that people start looking out for solutions. And the answer to that particular problem you are able to find out by yourself by now. Experiment in the console, help yourself with help. Even if that may cost a bit of *your* time, it pays back with more experience. Thursday 7th April, 2022 ThatOneAlexDev 15:04Hey guys, pretty new to red. What's an effective way to concatenate multiple strings? In Java, i simply have the "+" operator. In red, i saw "append", but i'd have to type that for every new part. What's the best way to do that? hiiamboris 15:09Hi and welcome @ThatOneAlexDev :) Try ? rejoin ThatOneAlexDev 15:12Ohh rejoin works without a flaw, thanks! greggirwin 16:11Welcome @ThatOneAlexDev ! ThatOneAlexDev 18:53Hey thanks! Saturday 9th April, 2022 ThatOneAlexDev 18:58What does it mean if i have a file and there is just "context [...]" without any assignments? I often see a file start with "context [...]", where the context block contains the whole code. Does it just create an object with the file name or what does that do? 18:59https://i.imgur.com/RwOhZyz.png 18:59like that 18:59Couldn't find it in any tutorial dsunanda 19:13@ThatOneAlexDev If you literally, have a file that begins with CONTEXT, you can load it and assign it to a word.....Simple example: write %test.txt "context [a: 1 b: 2 c: func [][print a + b]]" x: do load %test.txt x/c == 3 ; Result! It's a way of saving and reloading Red data structures. gurzgri 19:14"anonymous" contexts these are. They are a common idiom often used as poor man's module system, probably setting (exporting) only selected global words but keeping most of their inner parts hidden in the context to not litter the global / the calling context. ThatOneAlexDev 19:16Thanks! Sunday 10th April, 2022 ThatOneAlexDev 13:32What's the best way to extract the host of an url? For example: If the input is "https://example.site/users/10", i'd like to extract the host "example.site". I could not find it in any of the docs i'm using. 13:33What are good docs anyway? Any suggestions? 13:33Red by example is pretty useful, and helpin.red 13:33Idk if there is anything better 13:33besides looking at the source code hiiamboris 13:33 >> probe decode-url https://example.site/users/10 make object! [ scheme: 'https user-info: none host: "example.site" port: none path: %/users/ target: %10 query: none fragment: none ref: https://example.site/users/10 ] 13:34> What are good docs anyway? Any suggestions? https://github.com/red/red/wiki/Beginner's-FAQ cloutiy 14:36@ThatOneAlexDev another option once you have a bit more experience with red is extracting with parse ThatOneAlexDev 15:06Yeah i've looked at that, just wanted to see if there is something implemented already, and decode-url is perfect greggirwin 16:47@ThatOneAlexDev something else you can do is use help with partial keys, or strings. e.g. ? url or ? "url". Use help (? is a shortcut for it) by itself for more hints on how to use it. Monday 11st April, 2022 bubnenkoff 12:09Does map have any guaranies about ordering elements? rebolek 12:59No. It’s implementation dependent and you shouldn’t rely on any current order. hiiamboris 13:23@bubnenkoff hash! does bubnenkoff 14:13thanks!! Wednesday 13th April, 2022 bubnenkoff 09:36Is sees that reduce do not evaluate a path: >> data: [a: [b: 1 c: "hello" d: []] e: 123] == [a: [b: 1 c: "hello" d: []] e: 123] >> reduce to-path [data a/b] == none >> data/a/b ; but direct access to path work == 1 hiiamboris 09:42[data a b] bubnenkoff 09:51But why reduce to-path [data a/b] do not work? the spelling of result look like normal hiiamboris 09:52because second item in this path is a/b 09:52do you have a/b in data? bubnenkoff 09:54ah.... 15:52I need help with fixing algorithm. This function should find return list of blocks before current tag. data: [ purchaseNumber: "" lots: [ lot: [ lotNumber: 1 customers: [ customer: [ customer_regNum: "" ] ] lotMaxPrice: none deliveryTerm: {} currency_code: "" objects: [ object: [ price: none ] ] ] ] tag: "" ] find-path-to-node: function[data node-name /parent] [ stack: copy [] current-tag-level: 0 level: 0 isFound: false walk: function [data /extern isFound level current-tag-level] [ foreach [key value] data [ if block? value [ level: level + 1 ; increment level either ((to-lit-word key) = node-name) [ ; if find needed node either parent [ ; finding parent isFound: true return stack ; return from walk with result ] [ isFound: true append stack to-word key ; add to stack and exit from walk return stack ; ] ] [ append stack to-word key ; needle node still not found add current node to stack ] print ["level:" level " key:" key ] walk value level: level - 1 ] ] ] walk data either isFound [ return stack ] [ return none ] ] probe find-path-to-node data 'object For example for object parents is: lots lot objects object. I'm stuck and can't figure out how to fix the feature. Obviously it's supposed to remove blocks of the same level so they don't go into the chain. I am getting next result: probe find-path-to-node data 'object [lots lot customers customer objects object] customers customer should not be here, but I can't understand when I should remove them. hiiamboris 15:54@bubnenkoff remove last item from the stack once you leave the scope 15:55and just an advice: use Parse bubnenkoff 15:57> and just an advice: use Parse Why? I do not think that code in parse would be more readable\short? hiiamboris 15:58I have a feeling it can be *much* simpler with Parse, because it provides recursion out of the box. bubnenkoff 15:58> @bubnenkoff remove last item from the stack once you leave the scope Please show me right place, I tried, but every time I am getting wrong result hiiamboris 15:58before level: level - 1 15:58only if you haven't found it bubnenkoff 16:01 if (isFound = false) [ take/last stack ] level: level - 1 Wrong result: probe find-path-to-node data 'customer [lots lot customers customer objects object] hiiamboris 16:06you are continuing to walk even though you have isFound = true bubnenkoff 16:19So I need not only do return but also to do exit from function? hiiamboris 16:24just check isFound 16:25at walk start for example bubnenkoff 16:27Still not working: find-path-to-node: function[data node-name /parent] [ stack: copy [] current-tag-level: 0 level: 0 isFound: false walk: function [data /extern isFound level current-tag-level] [ foreach [key value] data [ if block? value [ level: level + 1 ; increment level either ((to-lit-word key) = node-name) [ ; if find needed node either parent [ ; finding parent isFound: true return stack ; return from walk with result ; exit ] [ isFound: true current-tag-level: level append stack to-word key ; add to stack and exit from walk return stack ; ; exit ] ] [ append stack to-word key ; needle node still not found add current node to stack ] print ["level:" level " key:" key "isFound:" isFound] if (isFound = false) [ walk value take/last stack ] level: level - 1 ] ] ] walk data either isFound [ return stack ] [ return none ] ] probe find-path-to-node data 'object hiiamboris 16:33what does it return? bubnenkoff 16:33 probe find-path-to-node data 'object == [lots] hiiamboris 16:34well, scratch this and start over then :) bubnenkoff 16:35I wouldn't have asked if I hadn't tried this hiiamboris 16:35use Parse now! ;) bubnenkoff 16:38I am trying to rewrite old solution from Parse. It's work, but I do not like it really. Maybe it can be improved, but I prefer use Parse only when I am working with text data. Btw old solution code: find-pos: function[xdata w /parent] [ word-founded?: false current_level: 1 tag_level: 1 stack: copy [] parse xdata rule: [ some [ set-word! [integer! | string! | 'none ] | ahead [set-word! block!] ahead [ set block-name to block! ] [fail] | ahead block! ( if (not word-founded?) [ append stack to-word block-name ] ) (if find stack w [word-founded?: true]) into rule ( if (not word-founded?) [ stack: remove-last stack ] ) | skip ] ] if word-founded? [ if parent [ either (length? stack) > 1 [ ; return head clear back tail copy stack ; ] [ ; ; return first copy stack return [] ; ] ] return stack ; ] ] hiiamboris 16:38although I think it's almost correct, you just have append in the wrong place bubnenkoff 16:39Really? But it's working! hiiamboris 16:39no, I mean the other one that returns [lots] bubnenkoff 16:42> no, I mean the other one that returns [lots] You mean this append: append stack to-word key ; needle node still not found add current node to stack ? hiiamboris 16:43yep 16:43although wait 16:44what a mess :) 16:47your walk may set isFound to true, and then still evaluate take/last bubnenkoff 16:51take/last is evaluate only isFound is false if (isFound = false) [ walk value take/last stack ] hiiamboris 16:54nope, think again bubnenkoff 16:55oh, yes, I understand, but what do you suggest? hiiamboris 16:55check again? bubnenkoff 16:56> check again? Which variant? hiiamboris 16:56I mean check isFound bubnenkoff 16:59Again wrong result if (isFound = false) [ walk value if(isFound = false) [ take/last stack ] ] probe find-path-to-node data 'customer == [lots lot customers customer objects] hiiamboris 17:04yeah because your last append doesn't check isFound bubnenkoff 17:06@hiiamboris cool!!! Many thanks!!! It's seems that it works! find-path-to-node: function[data node-name /parent] [ stack: copy [] current-tag-level: 0 level: 0 isFound: false walk: function [data /extern isFound level current-tag-level] [ foreach [key value] data [ if block? value [ level: level + 1 ; increment level either ((to-lit-word key) = node-name) [ ; if find needed node either parent [ ; finding parent isFound: true return stack ; return from walk with result ] [ isFound: true current-tag-level: level append stack to-word key ; add to stack and exit from walk return stack ; ] ] [ if (isFound = false) [ append stack to-word key ; needle node still not found add current node to stack ] ] print ["level:" level " key:" key "isFound:" isFound] if (isFound = false) [ walk value if(isFound = false) [ take/last stack ] ] level: level - 1 ] ] ] walk data either isFound [ return stack ] [ return none ] ] probe find-path-to-node data 'object But I really still thinking that it's easier to read than Parse hiiamboris 17:08I think both versions are very ugly :) 17:08you know what, try to write it using throw and catch in place of return 17:08good exercise for you bubnenkoff 17:12ok, thanks, I will try, I think I understand why do you suggest it -- to prevent multiple check of isFound? hiiamboris 17:13yes, logic will be simpler and more predictable bubnenkoff 17:31ok, but before I tried to introduce current-tag-level and play with it. It was bad idea? I thought I can compare current level and some another level or something like it hiiamboris 17:43I don't think you need level there at all Thursday 14th April, 2022 toomasv 06:01@bubnenkoff One posssibility in spirit of your original approach: find-path-to-node: function [data node-name /parent] [ stack: copy [] level: 0 isFound?: no walk: func [data] [ foreach [key value] data [ case [ node-name = to-word key [ isFound?: yes if not parent [append stack to-word key] return stack ] block? value [ level: level + 1 append stack to-word key walk value if isFound? [return stack] clear at stack level level: level - 1 ] ] ] ] walk data if isFound? [stack] ] 06:22Instead of return stack just break is enough in both cases. bubnenkoff 07:16As usually Perfect!! Thanks) toomasv 07:38You are welcome! Friday 15th April, 2022 bubnenkoff 12:36I need any workaround for this bug https://gitter.im/red/bugs?at=625919878db2b95f0ab88c99 [["aa" "cc"] ["aa" "aa"] ["aa" "aa"] ["aa" "bb"] ["aa" "aa"]] gurzgri 13:16Something like uniquify: function [values] [ singles: make hash! length? values foreach value values [any [ find/only singles value append/only singles value ]] to block! singles ] 13:17Untested. hiiamboris 13:20just sort it and remove all sequential duplicates bubnenkoff 14:34thanks! greggirwin 17:54Here's one I did a loooong time ago, before Red had set-oriented functions. unique: function [ "Returns a copy of the series with duplicate values removed." series [series!] ; /case "Perform a case-sensitive search" ; /skip "Treat the series as fixed size records" ; size [integer!] ][ res: make series length? series foreach val series [ if not find/only res val [append/only res val] ] res ] Tuesday 19th April, 2022 rsheehan 01:53Is there any way to discover the cursor position in an area? gltewalt:matrix.org 03:17offset-to-character, character-to-offset I think 🤔 bubnenkoff 07:52What is my error? I am trying to move last element to first position with move x: [1 2 3 4 5] probe move/part x x 5 1 [1 2 3 4 5] rebolek 07:54The error is that both your positions are at the start of the block. 07:54 >> x: [1 2 3 4 5] == [1 2 3 4 5] >> head move back tail x x == [5 1 2 3 4] 07:55back tail x will point to the last element toomasv 08:02@rsheehan With Red/System code only. Here is [example for Windows](https://gist.github.com/toomasv/0085fd7c61e53dc9cedb45ae98f777e9). bubnenkoff 08:04> The error is that both your positions are at the start of the block. why first head is needed? I understand that is move to header, but why it's before move? Because it setting place that accept result of moving? toomasv 08:14Otherwise just position at last element is returned by move, because move was given series at this position. head is needed only if you require the whole series immediately. Otherwise not needed. You can just refer to x to get the whole series with rearranged elements. rebolek 08:21as @toomasv said head is not needed, I added it just to show the result. rsheehan 20:34@toomasv Thanks. I will try that. Wednesday 20th April, 2022 bubnenkoff 08:11Eght... back to checking if value has been set. I tried unset? and value?. Both gave an error: foo: func[][ either value? aaa [ print "aaa is exists" ] [ print "aaa not exists!" ] ] foo ldci 08:25@bubnenkoff aaa is just a word with no value:) bubnenkoff 08:26yes, but how to check if it has been set or not? ldci 08:28@bubnenkoff aaa: 45 value aaa -> true 08:31@bubnenkoff or set ‘aaa 45 value? aaa -> true bubnenkoff 08:31yes, I understand that if aaa have value I can check it with value? But: foo: func[][ either unset? aaa [ print "unset -> true" ] [ print "unset -> false" ] ] foo error: *** Script Error: aaa has no value *** Where: either *** Near : aaa [print "unset -> true"] [print "unset"] *** Stack: foo unset? 08:32I do not need error, I need just print that value did not set ldci 08:35@bubnenkoff if error? try [unset? aaa][print"unset-> true »] dsunanda 08:36Does this help? print unset? get/any 'aaa true print unset? 'aaa false bubnenkoff 08:43yes! What do get/any ? and maybe unset? should work without them? ldci 08:57@bubnenkoff . Your function foo: func[][ either unset? get/any 'aaa [ print "unset -> true" ] [ print "unset -> false" ] ] foo 08:58@bubnenkoff About get /any Allows word to have no value (allows unset) bubnenkoff 09:08thanks! ldci 09:09@bubnenkoff You’re welcome :) Thursday 21st April, 2022 bubnenkoff 09:55> also, idk what will happen if you close the window before loops finish :) I checked, it's really hangs. I still want to try find way to ask user about action in current windows, without creation separate windows (just usablity question). User case. There is some processing. There is menu in UI (list-list) that show current section. Sometimes section can't be detected and we need to ask user to select one of section from menu. foo: function [] [ foreach el ttt/data [ if (el = "bb") [ ; I need to ask user to click on any element in next list to continue ] ] ] view [ button "start" [foo] ttt: text-list: data ["aa" "bb" "cc" "dd"] ] Or maybe to display some addition button and wait for it clicking before processing hiiamboris 11:13In this case, I recommend leaving the loop, displaying some text telling the user what should be done, and making ttt selection enter a new loop. 11:13Any loop can be written using while or forever. Just stash the last index somewhere and continue once you're ready. Wednesday 27th April, 2022 cosacam1 14:38Hi again. When I type ? scroller! I see there are props like position, page-size, min-size, etc. However, if I use a scroller in VID there's nothing like those props. I think they are different objects. How can I use a scroller in VID with those props? Or, how can I make a scroller's thumb to move to it's top (or bottom or elsewhere) position when I set it's data to some value? Thanks hiiamboris 14:44view [scroller rate 2 on-time [face/data: 1 - face/data]] cosacam1 14:59@hiiamboris , thanks for your fast answer. Actually I wrote this example and I realized that my problem was I was assining integers to data, not floats. Now, with to-float, it works as desired: 15:00'''Red [needs: view] min-val: 10 max-val: 68 val: 54 view [ scr: scroller 120x20 text "0" react [face/text: to-string scr/data * (max-val - min-val) + min-val] button "go" [ scr/data: (val - min-val) / to-float (max-val - min-val) ] ]''' 15:02 Red [needs: view] min-val: 10 max-val: 68 val: 54 view [ scr: scroller 120x20 text "0" react [face/text: to-string scr/data * (max-val - min-val) + min-val] button "go" [ scr/data: (val - min-val) / to-float (max-val - min-val) ] ] 15:03Sorry, how to send some code? I forgot it hiiamboris 15:04Ctrl+Shift+M to see the syntax 15:04you forgot newlines before/after \\\` cosacam1 15:11Thanks again. I think this example is better: Red [needs: view] min-val: 10 max-val: 68 range: max-val - min-val view [ scr: scroller 120x20 text "0" react [face/text: to-string scr/data * range + min-val] button "click again" [ val: min-val + random range scr/data: (val - min-val) / to-float range ] ] 15:13Oops. No "0" in text. Sould be text to-string min-val... 15:15Oops again. Just no "0" in text. Sorry. toomasv 15:38@cosacam1 These are different things indeed - standalone scroller style and embeddable scroller object that you see with ? scroller!. I just used the embeddable one in a [table style](https://github.com/toomasv/table-template). See table-template.red, look from SCROLLING downward how it is implemented. ldci 16:04@cosacam1 I don’t understand what you’re trying to do. As far I remember Scroller is not a view face. Use slider min-val: 10 max-val: 68 range: max-val - min-val view [ scr: slider 120x20 text "10" react [face/text: form to-integer scr/data * range + min-val] button "click again" [ val: min-val + random range scr/data: to-percent val - min-val / range ] ] hiiamboris 16:06@ldci have you tried his code? ldci 16:08@hiiamboris Yes under macOS:) hiiamboris 16:11If scroller doesn't work on Mac, you should file an issue probably ;) ldci 16:13@hiiamboris scroller is unknown on Mac for a direct use with view. But Toomas’s table code works fine :) hiiamboris 16:14Actually it is not documented, so was probably never finished or not supported by Mac :) 16:15@qtxie may know ldci 16:16I think so. BTW no way to create a vertical slider under macOS. Not supported by the OS. cosacam1 19:01@ldci Well, there are both scrollers, one of them is a face. See Toomas comment 19:04@toomasv - I only took a look at your table's readme so far. I find it very useful. I haven't seen the code because I was away of my PC. Now I get to go home. I'll study it later. Thanks to all for your help. toomasv 19:06:+1: Saturday 30th April, 2022 dsunanda 07:10I have a Windows R2/View app that uses SQLite with Ashley's driver. Works fine (other than the growing R2 cruft). Been chugging away for years. Happy user. I have converted it to Red. Nicer GUI. But SQLite access is via CALL to SQLite's command line utility. Too clunky to really consider as a replacement for the R2 app. But what I'd really like is to be able to run the app on Android and IOS. How insanely naive am I? rebolek 07:30Doesn't @Oldes have SQLite driver for Red? toomasv 08:12It worked when I [played](https://github.com/toomasv/sqlite) with it ~two years ago. Haven't tried it since then, probably broken. [![chinook](https://toomasv.red/images/DB/db-admin.gif)](https://toomasv.red/images/DB/db-admin.gif) greggirwin 19:00> But what I'd really like is to be able to run the app on Android and IOS. How insanely naive am I? A lot of work went into Android some time back, and a community member is looking at what they can do to help. We hoped to get it updated this year, but I'm not sure we'll make it. :^( iOS is a different beast completely, and we have no work done on it or a place in the roadmap for it. Sunday 1st May, 2022 GiuseppeChillemi 08:42@toomasv are you aware that your "toys", once fully functional, are the foundations of beautiful future application we could make with Red? This table browser is fantastic! 08:46@greggirwin we are near the end. Once IO will be merged, we will have everything needed to build full applications. If you concentrate your forces to complete the Android version, everyone will have a complete toolset to create applications for companies and Red adoption will be bosted. (and also will start for everyone the source of income coding with Red) dsunanda 16:44@greggirwin Thanks Gregg. IOS would be nice, but Android is strategic. toomasv 16:46@GiuseppeChillemi Thanks! But they are still just toys. There is looong way from toys to real things, I've learned.. GiuseppeChillemi 17:56@dsunanda I agree, Android with support for external libraries to read barcodes, would open an incredible market and attracts coders and companies. 17:56@toomasv I have learned it too. Monday 2nd May, 2022 planetsizecpu 06:42Well done @toomasv this kind of tools are useful for DB developers, push hard 🦾 toomasv 08:43Thanks, @planetsizecpu ! Friday 6th May, 2022 GiuseppeChillemi 09:55 I want to create a block with field-name and validation rule in a block, like: [ code [integer?] description [25 < length?] ] I think only of making a context and with a word and bind the block like: validation: [ code [integer? value] description [25 < length? value] ] ctx: [ value: none ] code: 25 ctx/value: code valid? do bind validation/code ctx Have you a better approaches? hiiamboris 10:38Start from the top. How do you intend to use it? GiuseppeChillemi 10:47Validation of gui field input, connected to database columns. hiiamboris 10:49That was obvious :) But doesn't tell any of the specifics needed to answer your question. 10:49Why not just validation: [integer? code 25 < length? description] 10:49Bind it, put into an all block and you're done GiuseppeChillemi 11:41Because I want reusable code to use the for different fields. So I write fieldname validator-name and selxt the validator in another block 12:04Example: validation: [ string-40 [40 <= lenght? value] integer-less-25 [25 < length? value integer? value] ] field-specs: [ code integer-less-25 description string-40 id integer-less-25 ] hiiamboris 12:16I see 12:17context makes sense then, or replacement of value with the column name during validation rule composition GiuseppeChillemi 12:34Yes, it seems the only viable way to go. Saturday 7th May, 2022 hiiamboris 18:39Why can't we set "absent" tuple parts (even in R2)? >> c: 0.0.0.0 == 0.0.0.0 >> c/4: none == none >> c == 0.0.0 >> c/4: 0 *** Script Error: value out of range: none *** Where: set-path *** Near : 0 *** Stack: 18:48I have to first add a new part, only to be able to remove it: > c: 0.0.0 == 0.0.0 >> c/4: none *** Script Error: value out of range: none *** Where: set-path *** Near : none *** Stack: >> c: c + 0.0.0.0 == 0.0.0.0 >> c/4: none == none >> c == 0.0.0 greggirwin 19:14My first guess is that Red did it for Rebol compatibility. It may also have eased the implementation or align more closely with, e.g. block!/vector! behavior. Though vectors return none if you ask for an out of bounds index. And tuples cast none to 0 for all values following the index, if les than 3, setting the "size" of the tuple. If longer than 3, they go away. 19:15Worth a design review IMO. 19:20value out of range: none isn't helpful either. That's a bug. hiiamboris 19:26An issue would do or issue and a rep? greggirwin 19:27At the very least we'll get better docs out of it. And it's another case where we scratch our heads, because types are different and behave differently. Sometimes by design and sometimes...it can be improved. e.g. tuples can never be empty, or even have a length less than 3. Currently also a max length of 12 (which *likely* won't change, but is really an implementation side effect). And because they aren't series values, using none to clear them is kind of like the question on that for removing map keys when they were first implemented. But you can't use at+clear. The joy of language design. 19:27Maybe a brief REP to start, to lay out the current and desired behavior. hiiamboris 19:34Since it's a scalar, no need to be consistent with series. 19:34tuple/i: none is a bit of a hack, agreed Sunday 8th May, 2022 greggirwin 17:02While it's a bit of a hack, and a specific set-length action is more meaningful, I can't say it would be categorically better. But a set-length mezz might be worth considering. I have an old one for R2 (below), but like my shift and rotate series funcs, I only used it in a few cases. This is where it will be great when we have a collection of mezzanines and can evaluate and assemble things in a real ecosystem. This doesn't support tuples, but could easily. set-length: func [ "Sets the length of a series, trimming or padding as necessary." series [series!] "(modified)" length [integer!] /with "Override default pad fill value (space for strings, none for blocks)" value ][ default value either any-string? series [#" "] [none] if length = length? series [return series] either length < length? series [ head clear skip series length ][ append/dup series :value subtract length length? series ] ] hiiamboris 17:24I'm also using smth like that, for further indexed write: ;; extend & expand are taken already enlarge: function [ "Ensure certain SIZE of the BLOCK, fill empty space with VALUE" block [any-block!] size [integer!] value [any-type!] ][ insert/dup skip block size :value size - length? block ;; returns after size ] greggirwin 17:27Part of your tube work? hiiamboris 17:28No, used in popups code. greggirwin 17:29There are times where normalizing by size simplifies things, at the cost of space. So popups aren't just like regular layouts? hiiamboris 17:29https://codeberg.org/hiiamboris/red-spaces/src/commit/a387dfb186e77d53b4796f7b4c3258d217fb5017/popups.red#L58 17:29and L69 17:30> So popups aren't just like regular layouts? No, popups live in another faces with a predefined layered structure: - layer 0 is tooltips - layer 1 is top-level menu - layer 2 is second-level menu and so on greggirwin 17:30So stacks there are not strictly LIFO accessed. 17:31Ah, that explanation helps a lot. hiiamboris 17:31Basically, stack in that case is not a FIFO/LIFO stack but just a collection of layers. greggirwin 17:32Though I'll ask why tooltips are grouped with menus, rather than, say an object that names the elements. Outsider question. :^) 17:33If every face has them, blocks will be a lot lighter, per node!. hiiamboris 17:36It's just a registry of faces that I'm adding to the window and using for my own purposes (later I must find and remove them or repurpose). For example, when new level 2 menu is shown it hides previously opened menus of level 2 and above, but not level 1 menu. Also all menus hide tooltips. 17:37Each such "registry" stack is associated with a top level window. 17:39Anyway it's an internal implementation detail, not exposed to the user. greggirwin 17:39Thanks. Fortunately, Red gives us nice ways to deal with this too, e.g. named indexes into block structures. Monday 9th May, 2022 hiiamboris 17:52An experiment: function constructor that allows to write readable code and make a mess out of it: probe test: modifying-function ['a [word!] 'b [word!]] [ a: also b b: a probe 'a/:b/1/(b + 1) ] func ['a [word!] 'b [word!]] [ set a also (get b) set b (get a) probe 'a/(get/any b)/1/((get b) + 1) ] But I can't find a name for it :/ Any ideas? greggirwin 17:57If the goal is to make a mess of the code, ala obfuscation, call it messify. If it has a different purpose, like working around compiler issues, just use do. cloutiy 18:07You can call it spagettify hiiamboris 18:07Goal is to write readable code passing multiple values in and out. greggirwin 18:11I'm still not clear then. We've been writing readable code like that in Red for years. :^) hiiamboris 18:13Like many languages allow you to declare an argument "in/out" or ["pass by reference"](https://www.educative.io/edpresso/pass-by-value-vs-pass-by-reference) and it will automatically modify the variable (containing the argument value). greggirwin 18:16Got it. That seems like a custom/extended func spec need, since I'm guessing doc strings aren't enough in your case. You want the added protection and control. hiiamboris 18:17I'm just rewriting lit-args. 18:17 #include %keep-type.red modifying-function: function [spec [block!] body [block!]] [ ;@@ shitty name lit-words: keep-type spec lit-word! block-rule: [any [ ahead set w get-word! if (find lit-words w) change only skip (as paren! reduce ['get/any to word! w]) | ahead set w word! if (find lit-words w) change only skip (as paren! reduce ['get to word! w]) | ahead set w set-word! if (find lit-words w) insert ('set) change skip (to word! w) | ahead any-list! into block-rule | ahead any-path! into path-rule | ahead word! 'quote skip | skip ]] path-rule: [any [ ahead set w get-word! if (find lit-words w) change only skip (as paren! reduce ['get/any to word! w]) | ahead any-list! into block-rule | skip ]] parse body: copy/deep body block-rule function spec body ] 18:18No need to change the spec. greggirwin 18:21by-ref-lit-arg-func, mod-lit-args-func, in-out-lit-arg-func all long, but maybe in-out-func is enough, if the doc string tells you how it operates. 18:23I like mod better in there. arg-modding-func isn't great though. by-ref isn't great either, because of so many values being by reference anyway, not to mention ref!. hiiamboris 18:36in-out-func is okay 18:37thanks for ideas 18:42also maybe two-way-func greggirwin 19:07two-way sounds like it calls back out, rather than just modding args. Saturday 14th May, 2022 hiiamboris 18:26 >> ?? repend repend: func [ {Appends a reduced value to a series and returns the series head} series [series!] value /only "Appends a block value as a block" ][ head either any [only not any-block? series] [ insert/only tail series reduce :value ] [ reduce/into :value tail series ] ] I'm wondering here... Has anyone *ever* used the first branch of repend? 18:29I can only see it as a shortcut repend/only series block for append/only series reduce block, but then how common is it? 18:30For non-block types, what's even the point? toomasv 18:34I use repend with block quite often. Sometimes with /only. hiiamboris 18:39Can you point me to the code? 18:39Found one in diagram. A few even. 18:43OK I see your use case. Stacks of saved values. 18:48Funny, I don't think I ever used even append/only series reduce block. 18:49I guess we have our habits in how we model processes :) toomasv 19:31> Can you point me to the code? [Latest](https://github.com/toomasv/table-template/blob/main/table-template.red) hiiamboris 19:36I don't see repend/only there toomasv 19:43Ah, ok. [Here](https://github.com/toomasv/GA) are some. hiiamboris 19:46Thanks toomasv 19:48:+1: greggirwin 19:49I've used it a small number of times in R2 code, from a quick search, as have others. Monday 16th May, 2022 bubnenkoff 08:25Hi! foo: [button "test"] ; how to check here if view is already loaded/displayed or no? view foo ldci 08:34@bubnenkoff may be with visible? bubnenkoff 08:37 >> ? visible? No matching values were found in the global context. Or you mean to add a flag? hiiamboris 09:07you'll have to add your own flag, yes ldci 11:56Hi everybody. Why this code is wrong? face/extra object is not initialized. Red[ needs: view ] extend system/view/VID/styles [ iosBtn: [ default-actor: on-down template: [ type: 'base size: 48x25 color: red data: 0 actors: [ on-create: [ face/extra: object [ fColor: snow bColor: face/color bSize: face/size radius: to-integer bSize/y / 2 lCenter: as-pair radius radius rCenter: as-pair bSize/x - radius radius ;--make default image (off) blk: compose [ line-join round fill-pen fColor box 0x0 (bSize) (radius) fill-pen fColor circle (lCenter) (radius) ] bDraw: draw bSize blk ;--call draw method bClick: func [face][ either face/data = 0 [ face/data: 1 blk/4: bColor blk/12: rCenter ][face/data: 0 blk/4: fColor blk/12: lCenter] ;--update face image with draw bDraw: draw bSize blk face/image: face/extra/bDraw ] ];--end of object ];--end of create on-down: function [face] [ print "here" probe face/extra face/extra/bclick face ] ];--end of actors ];--end of template ];--end of style ];--end of extend view [iosBtn green 48x24 [face/extra/bclick face]] hiiamboris 12:02forgot function? ldci 16:38@hiiamboris . Thanks :) Tuesday 17th May, 2022 GiuseppeChillemi 20:45bind does not allow path for its target argument. Is there a way to bind the first word of a path without converting it to block? hiiamboris 21:36bind as block! path target ALANVF 21:39this could also work forall path [ path/1: bind path/1 target ] GiuseppeChillemi 21:39@hiiamboris I didn't know this way of doing. To me it should have been: to-path bind as block! path target ALANVF 21:40you might want as path! instead of to-path but yeah 21:40that way it doesn't copy anything GiuseppeChillemi 21:40I like both methods 21:42This don't understand if the other words other than the first one are bound, because they are symbolically used until they are get-word! ALANVF 21:42then you could just skip the forall and do path/1: bind path/1 target GiuseppeChillemi 21:58Path has confused me. I have thought path/1 would have returned a word unlinked to the path itself ALANVF 21:59well since path is a path! (and therefore a series!), it's gonna return its first value, which is a word 21:59it's the same as if path was a block! or something Wednesday 18th May, 2022 GiuseppeChillemi 08:06Yes if you bind the series, you can't pick from a block a word and rebind it: >> o: make object! [a: 22] == make object! [ a: 22 ] >> o2: make object! [a: 99] == make object! [ a: 99 ] >> append x: [] in o 'a == [a] >> bind x/1 o2 == a >> reduce x == [22] 08:11It would be nice to Rebind in place without changing the word, either for blocks and paths but it seems to me impossible, only bind seems to have this power when managing blocks. BuilderGuy1 21:58I'm trying to use two drop-downs to make a "Category" drop-down that feeds a "sub-category" drop-down. I can't get the second drop-down to see the results of the first. This is what I have (which does not work). 21:58 RED [ needs: 'view ] Categories: ["MyList1" "MyList2" "MyList3" ] MyList1: ["1" "2" "3" "4"] MyList2: ["A" "B" "C" "D"] MyList3: ["Arf" "Barf" "Carf" "Darf"] Add2Log: function [] [ append log/data append now append " " pick ItemSelect/data ItemSelect/selected ] Cat1: [] view [ across text "Category" 120x25 text "Sub Category" return CatSelect: drop-down 120x25 "Choose..." data Categories on-change [probe pick CatSelect/data CatSelect/selected ItemSelect/data: pick CatSelect/data CatSelect/selected] ItemSelect: drop-down 120x25 "Choose..." data Cat1 [probe Cat1: pick CatSelect/data CatSelect/selected] MyAdd: button 30x25 "+" [Add2Log] return below text "Today's log" Log: text-list 200x200 ] hiiamboris 22:03forgot on-change? BuilderGuy1 22:07I had that in there but I get an error stating that it can't use "none" ALANVF 22:09as a side note, you may want to change append " " pick ... to append copy " " pick ... BuilderGuy1 22:09ok I put it back and no error. i must have done something different before. Second droip-down still doesn't get any data 22:10I'll try it :-) @ALANVF 22:15Will the drop-down accept its DATA as text? Or do I have to change it's type inorder to point it to my other blocks? hiiamboris 22:17data should be a block 22:18https://w.red-lang.org/en/view/#drop-down 22:18we have docs btw Thursday 19th May, 2022 ldci 08:33@BuilderGuy1 Something like that? 08:33[![image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/Cqks/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/Cqks/image.png) 08:35Here’s the code Red [ needs: 'view ] Categories: ["MyList1" "MyList2" "MyList3"] MyList1: ["1" "2" "3" "4"] MyList2: ["A" "B" "C" "D"] MyList3: ["Arf" "Barf" "Carf" "Darf"] uChoice: none Add2Log: does [append log/data rejoin [form now " " uChoice]] view [ across text "Category" 120x25 text "Sub Category" return CatSelect: drop-down 120x25 "Choose..." data Categories on-change [ clear ItemSelect/data switch face/selected [ 1 [ItemSelect/data: copy MyList1] 2 [ItemSelect/data: copy MyList2] 3 [ItemSelect/data: copy MyList3] ] ;select ItemSelect first row and uChoice ItemSelect/selected: 1 uChoice: ItemSelect/data/(ItemSelect/selected) ] ItemSelect: drop-down 120x25 "Choose..." data [] on-change [uChoice: face/data/(face/selected)] button 30x25 "+" [Add2Log] return below text "Today's log" Log: text-list 200x200 data [] ] 09:05A better solution without switch test. CatSelect: drop-down 120x25 "Choose..." data Categories on-change [ clear ItemSelect/data subCategory: to-block get to-word face/data/(face/selected) ItemSelect/data: copy subCategory ;select ItemSelect first row and uChoice ItemSelect/selected: 1 uChoice: ItemSelect/data/(ItemSelect/selected) ] 11:07@BuilderGuy1. More concise: CatSelect: drop-down 80x25 "Choose..." data Categories on-change [ clear ItemSelect/data ItemSelect/data: to-block get to-word face/data/(face/selected) ;select ItemSelect first row and uChoice ItemSelect/selected: 1 uChoice: ItemSelect/data/(ItemSelect/selected) ] BuilderGuy1 15:17@ldci This is fabulous!! I'm examining the code now :-) I had made more progress on it yesterday. I could get data into the second drop-down but it was not syncing right. I love your examples!! Even at first glance I'm learning new things :-) ldci 15:21@BuilderGuy1 You’re welcome :) 15:23@BuilderGuy1 The second way without swich is better: you can add all sub-categories you need. BuilderGuy1 15:25Yes, I like the version without Switch too. I am glad you used it in an example thought! More examples are always better ;-) ldci 15:28Yes, Red is fabulous for testing idea. 15:29 Red[ Needs: 'View ] names: ["Carl Sassenrath" "Nenad Rakocevic" "Chris Lattner"] languages: ["Rebol" "Red" "Swift"] win: layout [ title "Picker" below center text "Languages" center font-size 14 drop: drop-list data languages select 1 H2 300 center react [face/text: names/(drop/selected)] button "Quit" [quit] ] view win Friday 20th May, 2022 gor77 14:39Hello, I've just started experimenting with Red. Seems very interesting! Right now I'm trying to understand why something as simple as this: falsy: [off false none] to-logic falsey/1 to-logic first falsey 14:39returns true? 14:47sorry, first line should have been falsey: [off false none], just a typo 14:52 falsey: [off false none] to-logic falsey/1 to-logic first falsey There :) hiiamboris 15:25Hi and welcome @gor77 :) If you type type? falsey/1 what does it say? ;) gor77 15:26Hi, it says ==word! hiiamboris 15:26So you see, you have 3 words in your block, because block contents is not evaluated by default. And word is a truthy value. 15:27Try falsey: reduce [off false none] 15:28And don't forget to check the type again ;) gor77 15:29Aha, think I get it ...it will take some time to get these concepts, obviously :) hiiamboris 15:30Indeed. Red is one of the most mind bending languages ;) 15:31Red is a data format first. Everything in Red is just data.. until it is evaluated. gor77 15:33I mean, I knew block is not evaluated by default...but I was under impression, that somehow, since this: first falsey ``` gives back **off**, it seemed logical to me that this to logic first falsey ` also returns off. But it's all about the meaning, the types behind it - not the way it looks like :) toomasv 15:34Hi, @gor77 get falsey/1 == false get first falsey == false gor77 15:36Yes, my understanding was that **first** will also **get** it :) But obviously, it will not do that. 15:41But also, I realized I could change lots of things, even some basic things like true and false. For example false: true 15:42I mean, it looks like there is no bottom-line here :) toomasv 15:43Yes, you can... but then you'll stop dead soon :) ne1uno 15:43 falsey: [off #[false] #[none]] gor77 15:44Yes, but still...shouldn't some things be like, set in stone...it's important for sanity :) hiiamboris 15:46One day it may happen gor77 15:46If I'm not wrong, I think Rebol has something like that? hiiamboris 15:48Yes, it has protect gor77 15:51That's useful. Now I'm maybe going too far with this, but if the whole concept of the language is around words (like a giant hashmap), would it be possible to reset it to clean state? For example, if I do something stupid like false: true :) 15:52I know I can simply start the console again...but I'm trying to understand what is possible within the language 15:53Still not very much resources out there, and it's a very interesting language. So different and extremely productive. ldci 15:54@gor77 Have a look here: https://github.com/red/docs/blob/master/en/SUMMARY.adoc hiiamboris 15:54It's possible to copy system/words and then set things back. At least some of them. gor77 15:54Aha, thanks, I will. hiiamboris 15:56That's a reference. You may wanna start with [Rebol/Core](http://www.rebol.com/docs/core23/rebolcore.html) manual which is mostly applicable to Red gor77 15:57@hiiamboris Yes, that's probably what I had in mind. There is a lot to learn. But when I realized how little code you need to display red image in a window, for example. Also, after fighting with regexes, parse looks like a revelation worth learning. 15:59But when it comes to Rebol, it's mostly V2 Red is based on? hiiamboris 16:00R2, R3 and Red are somewhat equidistant from each other 16:00R2 manual is just most well-written one :) gor77 16:01Aha, I see. Thanks a lot! :) hiiamboris 16:02https://helpin.red/ and https://crypticwyrm.neocities.org/learningred/ are Red resources but I can't vouch for their coverage and quality gor77 16:09Yes, I know for helpin.red, and also for www.red-by-example.org . These are very useful, but don't go very deep. I mean, in programming it's extremely important to understand how things are defined. I've also found https://github.com/meijeru/red.specs-public/blob/master/specs.adoc - definitely not an easy read, but clear definitions are very important hiiamboris 16:14:+1: gor77 16:20I just think this is the type of language people should start with..if nothing, they probably won't start to hate programming so quickly :) If it succeeds - like mass adoption - it could be a game changer. hiiamboris 16:26It depends on the person. Red blows the mind, because literally everything can be approached from multiple angles. People who like puzzles will love that, and it will help them develop their skill further. But other people can't have that much space in their head, and they may favor a rigid language with a few simple hardcoded directives like if and for. gor77 19:31Well, what I like about Red is that it somehow hits that spot between high-level language (like, *really* high) and a language that still has in mind what programming should be about. I think it gives nice abstractions so people don't have to write boring code over and over again. At the same time it's not boring because it seems to me that it manages to abstract just the boring/tedious parts :) And the only problem I see with this is the possibility it won't be taken seriously, simply because of that attitude that I think is still very much present in the programming world - if it's not C++/Java/C# and if you can open a window or a file (God save URL!) with a single line of code, it's probably something for kids. Maybe Red/System will change that. greggirwin 20:59Welcome @gor77 ! Others have noted some important details, but you also found parse already. Being a data format first is fundamental, and also using parse to build dialects (internal DSLs, using Red values and blocks rather than string parsing). As you've also seen, a bit, "There is no spoon." The idea of words being able to refer to other values in a given context or domain is also deeply part of Red, but there are times when you want to lock some stuff down. R/S proves this too, that you can create a more strict language out of a dynamic one, while sharing a syntax. Happy Reducing! gor77 22:32Thanks! I'm just surprised that it hasn't really got the attention I think it deserves. There are so many (too many, actually :) languages out there, so maybe people don't care so much. But many of them are really not that much different. Something like Linux distributions... And even when they get something important right - like, maybe safety in case of Rust - the fun part while trying to learn them, or while trying to do something concrete with them just wasn't there. It was completely missing. But the pain was almost constant, only with maybe few bright moments :) And yes, @hiiamboris is right - a lot of it depends on the person. I can speak only for myself. But then again - a lot of languages are not really human friendly *at all*. It's almost like they are made for machines, not humans. Red definitely looks and feels different, and that's a good thing! Monday 23th May, 2022 henrikmk 10:51This neither works in Red, nor R2 or R3: >> t: [(fc) 'custom-action (fc) (event)] ; I want to replace (fc) == [(fc) 'custom-action (fc) (event)] >> replace/all copy/deep t to-paren 'fc 'y ; replace (fc) with 'y == [(fc) 'custom-action (fc) (event)] >> replace/all load mold/all t to-paren 'fc 'y ; try harder == [(fc) 'custom-action (fc) (event)] It doesn't work with blocks either. What am I missing? It's something obvious, I know it. toomasv 11:10@henrikmk replace/all/deep t quote (fc) 'y == [y 'custom-action y (event)] henrikmk 11:17That still doesn't work in R2 or R3, and crashes in my Red build, so I guess this is a recent change. 11:17I'm using PARSE instead. Thanks. Was just curious. toomasv 11:39Tried this in 30-April build. fergus4 13:49What is the equivalent of rebol's reform? hiiamboris 15:32just write your own 15:33 >> replace/all [(fc) 'custom-action (fc) (event)] [(fc)] 'y == [y 'custom-action y (event)] rebolek 17:46@fergus4 IIRC reform is form reduce gltewalt:matrix.org 18:01> Yes, I know for helpin.red, and also for www.red-by-example.org . These are very useful, but don't go very deep. I mean, in programming it's extremely important to understand how things are defined. I've also found https://github.com/meijeru/red.specs-public/blob/master/specs.adoc - definitely not an easy read, but clear definitions are very important Unfortunately, Carl has never written (or a least has never released) REBOL design papers. So no one stop source for all of the "why"s and deep corners ALANVF 19:51@fergus4 it's not exactly the same (since the result type is determined by the first value), but rejoin seems to be similar BuilderGuy1 21:08I'm trying to save a BLOCK to a csv file. When I try to use "to-csv" i get the error "*** Script Error: to-csv has no value" 21:08What am I missing ?? gurzgri 21:09save/as data 'csv? BuilderGuy1 21:10This is what I'm using a: ["a" "b" "c" "d"] print to-csv a ALANVF 21:11seems like to-csv isn't a function 21:11what build is your version of Red? BuilderGuy1 21:11today's ALANVF 21:11weird, I have one from last week and it works for me BuilderGuy1 21:11to-csv is in the wiki and was added back in 2019 ALANVF 21:12[![image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/PRxX/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/PRxX/image.png) BuilderGuy1 21:12let me try... ALANVF 21:12if that doesn't work, enter system/build/date and tell me what it says BuilderGuy1 21:13 >> to-csv [1 2 3] *** Script Error: to-csv has no value *** Where: catch *** Near : to-csv [1 2 3] ALANVF 21:13try what I just said then BuilderGuy1 21:13 >> system/build/date == 23-May-2022/21:48:17 ALANVF 21:14weird 21:14maybe it was accidentally removed recently? BuilderGuy1 21:14I am using the WINDOWS version in CrossOver on Mac. i could try the Mac version (so buggy though...) 21:15I have to switch computers... hold on... M1 Mac Mini can't run RED. Have to use my laptop with 32-bit complient Mac OS 21:16HA!! that worked ! May 17th build. ALANVF 21:16huh weird 21:17now try the latest build on there, if it doesn't work again then I know what the problem is BuilderGuy1 21:17DAMN !!! That means i can't use my main system for RED. 21:17ok hold on... hiiamboris 21:22lol I can't use csv or json either BuilderGuy1 21:22It failed compiling !!! "Runtime error 1: access violation at: 0008524Ch" ALANVF 21:22interesting BuilderGuy1 21:22May 23rd Mac version ALANVF 21:22maybe today's build is just broken? BuilderGuy1 21:23I have an april 15th version in Crossover let me try that... ALANVF 21:23not sure how though BuilderGuy1 21:23 >> to-csv [1 2 3] *** Script Error: to-csv has no value *** Where: catch *** Near : to-csv [1 2 3] ALANVF 21:24weird BuilderGuy1 21:25 I never seem to get a project done but BOY can I find bugs ;-) hiiamboris 21:26:D ALANVF 21:26the file it's defined in hasn't even been touched in months https://github.com/red/red/blob/c97690694b6a85bd23b04c23a6c474ffc16ec472/environment/codecs/CSV.red#L359 hiiamboris 21:2614 may build has to-csv ALANVF 21:27I wonder if it's mac-only? 21:27it would not surprise me hiiamboris 21:27he said bug is on windows ALANVF 21:27ah BuilderGuy1 21:27It failed in 2 windows builds for me as well (Using Wine/CrossOver) ALANVF 21:28has you tried running it on a vm or something? 21:28I have a build from May 17th and it works fine for me natively (I use windows) hiiamboris 21:29try the latest? BuilderGuy1 21:29I could use my windows PC but it's not very convenient with my setup. My mac mini is my main system so trying to get as much working on it as possible. hiiamboris 21:31only 4 unrelated commits since 14th BuilderGuy1 21:31I tried the april 15th and may 23rd Windows builds in CrossOver. Both fail for "to-csv" but seem to work just fine for other basics (I can't do any thing complex so...) 21:32My little GUI app I'm building to learn RED works just fine in the May23rd build. Just TO-CSV that fails that I have found so far ALANVF 21:35curious, try context? 'to-csv and index? 'to-csv and see what it says 21:36or rather just the latter hiiamboris 21:36Hm I get to-csv in latest build, wait. But not in a custom built cli console but maybe because I skipped updates of some console files ALANVF 21:36index? 'to-csv should return 1508 or similar 21:36oh do you think it's only enabled in gui console? BuilderGuy1 21:36 >> index? 'to-csv == 2262 ALANVF 21:36ah 21:36what console are you using, gui or cli? BuilderGuy1 21:36gui ALANVF 21:37oh that complicates things hiiamboris 21:37Right, I don't have needs: [json csv] in my consoles 21:37It was a new invention and I didn't get to modify my version 21:38@BuilderGuy1 are you perchance building it yourself too? BuilderGuy1 21:38no hiiamboris 21:38weird ALANVF 21:39ahh here's something to try, enter system/build/config/modules and tell me what it says hiiamboris 21:39@BuilderGuy1 any directories you see in %ProgramData% path? BuilderGuy1 21:39 >> system/build/config/modules == [View] ALANVF 21:39ahhhhhh 21:39it's not loading JSON or CSV modules 21:39no clue why BuilderGuy1 21:41@hiiamboris How to I check that path? 21:41oh, I understand... 21:42This is a bottle in CrossOver (WINE). There are 2 directories directly in ProgramData: Windows and RED hiiamboris 21:43well maybe wine's the issue 21:43sorry path I wanted you to check is ProgramData/Red BuilderGuy1 21:43Could be but the Mac version doesn't work either hiiamboris 21:43there shouldn't be any leftover source directories 21:44but now I think it's the problem of OS version detection BuilderGuy1 21:44ProgramData/Red has 3 files: console-cfg.red crush-2022-5-23-6725.dll gui-console-2022-5-23-6725.exe 21:45It is in a Windows XP bottle. It would not work in Win7 or Win10 bottles. Same error as compile error with mac version ALANVF 21:46that's weird 21:47maybe you need to include additional windows libs? hiiamboris 21:47@BuilderGuy1 if you run R2, what does system/version/4 say under Wine? BuilderGuy1 21:48rebol? hiiamboris 21:48yeah 21:48though if it said anything else than 3 you would not get windows build 21:49really weird, idk BuilderGuy1 21:49i don't have that handy, don't use it... hiiamboris 21:49I guess Wine worked for you previously? BuilderGuy1 21:49I has been working fine. But now finding things that don't work 21:50My little GUI app works fine but can't use CSV hiiamboris 21:53idk, I guess just file [an issue](https://github.com/red/red/issues/new?template=bug_report.md) and maybe Qingtian has wine to test 21:53I've no idea what was broken BuilderGuy1 21:54weird... ok, I guess I will just need to use a real windows environment then Tuesday 24th May, 2022 ldci 04:59[![image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/seBD/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/seBD/image.png) ne1uno 12:02polka dot demo and a few anomalies. 12:02rate doesn't work if added to a style? is rate 7 not 7 seconds? 12:02/no-wait exits now interpreted? I think it used to work differently. 12:02(polkadot demo)[https://gist.github.com/ne1uno/b9c13330f563462038a75e4710743b64#file-polkadot-demo-red] pekr 13:50IIRC, rate accepts either the time type, or an integer, where it meanx - x-times per second. So if you want 7 secs, you have to specify it as a time 00:00:07 ne1uno 13:53thanks, I forgot layout on the view so am rechecking things 13:55yes, time format worked Wednesday 25th May, 2022 snotbubble 06:38Is there a way to tell the difference between "string" and {string}? They're both of type string! ne1uno 06:44literal {string} can have newlines. I think form shows {string} after some minimal length or if there are newlines. snotbubble 07:12Some context: Need to make view fields from "string" data, areas from {string} data, but can't tell the difference... besides doing something awful like getting-at the curly-braces. hiiamboris 07:33Look for a newline in the text 07:34Or, parse the input snotbubble 07:48won't work in this case as some ui items must be areas (eg: for sourcecode), even if the incoming data is a one-liner. Also I can't determine if it should be an area by checking the data name (word) as its set by the user. Everything is determined by type, but "string" and {string} are the same to Red. Is there a non-string string with a unique type that can be (ab)used for this task? ne1uno 07:48https://stackoverflow.com/questions/14765993/whats-the-fastest-most-efficient-way-to-count-lines-in-rebol 07:50make everything an area? 08:07if you control the input, store binary! then convert back to string rebolek 08:15@snotbubble you can abuse tag! for example. Oldes 08:33But this < > is two words and this <> is one word ;-) snotbubble 08:37@rebolek got it thanks! Will use tag for field, string for area... hiiamboris 09:15 areas: make hash! 100 transcode/trace {"string" {multiline string}} func [e i t l k] [ [load] repend areas [k i/1 = #"}"] ] ?? areas areas: make hash! ["string" false "multiline string" true] 09:16https://github.com/red/docs/blob/master/en/lexer.adoc#52-transcodetrace Friday 27th May, 2022 rsheehan 01:26Just wondering if anyone knows of a Red binding to ncurses? ALANVF 01:37@rsheehan does this work? https://github.com/red/code/tree/master/Library/Curses rsheehan 01:39@ALANVF Thanks. I will try it out. GiuseppeChillemi 10:38Is there a way to rebind the body of a function, once created, without recreating it? hiiamboris 11:15bind body-of :fun ctx 11:15obvious, right? GiuseppeChillemi 11:59I remember the body being copied and "closed" to further changes. 11:59I could try only later gurzgri 12:04 Red >> a: 4 f: does [prin [a ""]] f o: context [a: 5 f] bind body-of :f o f 4 4 5 It's not "closed". GiuseppeChillemi 12:46Good news. bubnenkoff 17:18How to rename key in map? I need to change: m: #(a: 1) to get b: 1 hiiamboris 17:19add a new key, remove the old bubnenkoff 17:22it's only way? I thought about it, but value is big array and I think it would be many unnecessary allocations hiiamboris 17:22map does not hold a copy of (series) value, just the reference 17:23 >> m: #() m/x: [long array] m/y: m/x same? m/x m/y == true GiuseppeChillemi 21:06This is what I was trying to do: s: 22 x: 33 f1: func [/local s x] [ probe [s x] ] f2: func [/local s x] [ probe reduce [s x] ] o: make object! [ m: :f1 n: :f2 ] bind body-of :o/m 's bind body-of :o/n 's probe o/m probe o/n But in Rebol I get: ** Script Error: Cannot use reflect on block value ** Near: make error! reduce [err-type err-id pick args 1 pick args 2 pick args 3] So this is not possible in Rebol but only in RED: o: make object! [ m: :f1 bind body-of :m 's n: :f2 bind body-of :n 's ] ALANVF 21:07trying to insert function values into an object is a pain GiuseppeChillemi 21:08In Red it is easier ALANVF 21:08slightly yes GiuseppeChillemi 21:08Why "slightly"? ALANVF 21:09dunno, I just remember trying something similar a while back and it took like 10 minutes to get it working correctly GiuseppeChillemi 21:10In Rebol the function body seems locked. ALANVF 21:11I think rebol copies the body so yeah 21:14wait are refinement!s more like word!s than issue!s? 21:15ughhhhhh that means I need to reimplement red.js stuff 21:16[![image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/5Yjm/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/5Yjm/image.png) 21:16it's weird because you can't treat them like words anywhere else 21:20it seems like issues are also words, but that doesn't explain the above behavior?? hiiamboris 21:22refinements still carry the binding (because of functions using them, primarily), but it was hidden recently (~year ago) ALANVF 21:23then what about issues? hiiamboris 21:23issues have the binding slot too, but it's unused, so issues are purely symbolic ALANVF 21:23well that's annoying hiiamboris 21:23what is? ALANVF 21:24the implementation for this hiiamboris 21:24why? 21:24each datatype serves different purposes ALANVF 21:24because now I get to rewrite a lot of Red.js code, since I had assumed refinements and issues were separate from words 21:25this is primarily painful due to implementing actions for the datatypes hiiamboris 21:25will teach you to design in more modular fashion ;) ALANVF 21:25well I like to think I already have hiiamboris 21:25every skill can be improved 21:26what really changes other than comparison for sameness? GiuseppeChillemi 21:26 =?returns if 2 elements are "identical". Refinement has binding while issue should have no binding, so the /c could be considered different because belong to different bindings, but I may be wrong. hiiamboris 21:27:turtle: ALANVF 21:27yeah basically GiuseppeChillemi 21:27> :turtle: ??? ALANVF 21:28> what really changes other than comparison for sameness? mainly the way comparison works, since issues and refinments use a different data structure layout / base type than words hiiamboris 21:29in Red, they have the same base, I'm sure you've seen 21:29which is the basis for all-word! typeset GiuseppeChillemi 21:29@hiiamboris Oh, I was so concentrated into writing that I have not seen you have already answered, so yes: :turtle: ALANVF 21:29yeah I never really thought about it at the time after observing the behavior of issues and refinements hiiamboris 21:29:) GiuseppeChillemi 21:31@ALANVF I have found this article while searching for info: https://stackoverflow.com/questions/14818324/what-is-the-summary-of-the-differences-in-binding-behaviour-between-rebol-2-and 21:32And another interesting link I will report in red/red ALANVF 21:36oh that's interesting, thank you 21:36this reminds me that I wish the use native was in Red 22:35ok got it working correctly in Red.js now, thanks :+1: 22:35[![image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/TbxV/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/TbxV/image.png) Saturday 28th May, 2022 GiuseppeChillemi 00:19Ottimo! 00:19Here is the only solution I have found in Rebol to include already made functions in objects and rebind they body: oo: make object! compose/deep [ f1: func copy/deep [(spec-of :f1)] copy/deep [(body-of :f1)] ] bubnenkoff 13:25I have next data structure: data: [ foo: 1 bar: 2 lots: [] ] I need to wrap every set words with not block value to object: data: [ object [ foo: 1 bar: 2 ] lots: [] ] I started with follow code: data: copy [ foo: 1 bar: 2 lots: [] ] foo: function [] [ isObjectAdded: false foreach [key value] data [ if not block? value [ if (isObjectAdded = false) [ insert data 'object isObjectAdded: true ] ] ] ] foo But I think that it would be hard to open [ and ] symbols. At least I can't figure out how to add them. Would it be better to start with parser here? 13:40And it seems that adding square brackets not trivial task. At least I can't find way to do it hiiamboris 13:46I think you're again seeing the code textually, not as a tree. 13:46you can sort the data, putting blocks to the bottom, then do your thing toomasv 13:48Just joking: data: [foo: 1 bar: 2 lots: []] parse data [any [change copy x to [set-word! block!] ('object) insert only (x) 2 skip]] data == [object [foo: 1 bar: 2] lots: []] bubnenkoff 13:53> Just joking: > > data: [foo: 1 bar: 2 lots: []] > parse data [any [change copy x to [set-word! block!] ('object) insert only (x) 2 skip]] > data > == [object [foo: 1 bar: 2] lots: []] > As usually thanks! I am reading, just not understand how to add brackets to block.... 13:54> you can sort the data, putting blocks to the bottom, then do your thing Yes, but I can't figure out how to add block symbols .... hiiamboris 13:54Oh come on. Your code **is not text!** 13:54You don't insert symbols into it. bubnenkoff 13:56ah....understood, but what way is to wrap it with block? hiiamboris 13:56reduce bubnenkoff 13:57to reduce what? words with not block values? 14:21@toomasv you are: 1. collecting all words and values till [set-word! block!] 2. than change all of them to .... (and here I can't understand what happens). 14:33@toomasv Base on your example I wrote this code: parse data [ any [ change copy x to [set-word! block!] (to-block x) ] ] probe data it's not work now, but I think it's logical. it's collect all words that have not block value, do block from it, and should replace original with it (leave out for simplification inserting object word). and it's now work now because I can't understand if change should change all till [set-word! block!] toomasv 14:42@bubnenkoff 1. **copy** all values until [set-word! block!] 2. change copied part into word object 3. insert copied part as block (with only) 4. skip set-word! block! 5. repeat if any more... 14:46 parse data [ any [ change only copy x to [set-word! block!] (x) 2 skip] ] bubnenkoff 14:51big thanks for explanation! and what do 2 skip ? it's seems that they should skip last value that have a block, or no? toomasv 14:51Point 4, yes bubnenkoff 14:53so it can be written as: parse data [ any [ change only copy x to [set-word! block!] (x) skip [set-word! block!] ] ] ? toomasv 14:54No 14:55 parse data [ any [ change only copy x to [set-word! block!] (x) set-word! block! ] ] bubnenkoff 14:55ah! Thanks! toomasv 14:56You are welcome! Sunday 29th May, 2022 bubnenkoff 08:22@toomasv I stuck with algo. The idea is next: I have got data structure that I should be able to prepare for casting to JSON: data: [ item1: none +lots: [ foo: none lot: [ bar: none baz: none +objects: [ price: 123 count: 1 object: [ item: "apples" ] object: [ item: "bananas" ] ] ] ] ] Every array is started with "+". Other elements is objects. So I need to get at result: data: [ object [ item1: none ] lots: reduce [ object [foo: none] object [ bar: none baz: none objects: reduce [ object [price: 123 count: 1] object [item: "apples"] object [item: "bananas"] ] ] ] ] print to-json object data ; I wrote follow code: is-any-except-block-inside?: function[data] [ foreach [k v] data [ if not block? v [return true] ] return false ] foo: func [] [ walk: function [data] [ if is-any-except-block-inside? data [ parse data [change copy x to [set-word! block!] ('object) insert only (x) set-word! block! ] ] foreach [key value] data [ if block? value [ either find to-string key "+" [ parse data [ to [set-word! block!] set-word! insert ('reduce) to end ] ] [ ; parse data [to [set-word! block!] change set-word! ('object)] ] walk value ] ] ] walk data ] foo probe data But all problem with commented lines. It should change every block name without + symbol to object like: lot: [] should become object [] but it does not. Could you help me? hiiamboris 09:22?? and probe are your friends, as always toomasv 11:13@bubnenkoff Is this you aim for? {"lots":[{"foo":null},{"bar":null,"baz":null,"objects":[{"price":123,"count":1},{"item":"apples"},{"item":"bananas"}]}]} bubnenkoff 11:16@toomasv yes, one moment I am looking more detail, but it's seems that yes toomasv 11:17Quite a challenge it was: type: copy [] in-array?: yes parse data rule: [any [ s: copy x [any [set-word! not block! skip] e:] opt [if (all [in-array? not empty? x]) (b: change/part s reduce ['object x] e) :b] change copy x set-word! ( insert type in-array? either in-array?: #"+" = first y: form x [reduce [to-set-word next y 'reduce]]['object] ) [ahead block! [into rule (in-array?: take type)] | skip] ]] print to-json object data bubnenkoff 11:22Oh my god! P.S. I did not checked you example but in json string first object [ item1: none ] was missed toomasv 11:23 probe data [object [item1: none] lots: reduce [object [foo: none] object [bar: none baz: none objects: reduce [object [price: 123 count: 1] object [item: "apples"] object [item: "bananas"]]]]] bubnenkoff 11:24One moment) I am trying to understand how it's works)) it's too different from my attempt)) toomasv 11:27First objet [item1: none] is lost because it is not retained in result after object data -- there is no set-word for it. bubnenkoff 11:30> First objet [item1: none] is lost because it is not retained in result after object data -- there is no set-word for it. Yes! I just discovered this problem! Is there any way so save it? toomasv 11:36Well, you design the output :) bubnenkoff 11:39it seems that it's work: print to-json reduce data ! toomasv 11:40Ok, change in-array?: no: {"item1":null,"lots":[{"foo":null},{"bar":null,"baz":null,"objects":[{"price":123,"count":1},{"item":"apples"},{"item":"bananas"}]}]} bubnenkoff 11:41Hah! it's work too! toomasv 11:41With reduce data you'll lose lots: bubnenkoff 11:41ah... one moment, I will look again 11:42You are right! I am losing lots: toomasv 11:43But with my way item1 is not in separate object any more bubnenkoff 11:46Thanks... I am looking at code, it seems that you are right.... 11:50@toomasv Egh... it's seems that your are right again, and it's more correctly not to make other key-value not part of object, but be as you did with first element.... 11:52Ah... one moment %) they are part of an array so they should be an object Wednesday 1st June, 2022 lucindamichele 00:33https://youtu.be/CMNry4PE93Y ALANVF 00:53why post that here? greggirwin 04:28May have been mis-posted. 04:31Lucinda helped us with PR for a while, and probably remembers me as a zombie child. GiuseppeChillemi 06:47Maybe Lucinda has a Children and was he who mis-posted ne1uno 10:04@iceflow19 is zombie GiuseppeChillemi 11:26OMG, you are confusing me. Is it an affirmation? Is it a Joke? Is someone else with a fake account? Is he really a Zombie from the world of deads? Do you know something about @iceflow19 we do not know? Are you him??? 😱 ne1uno 11:31never let a crisis go to waste GiuseppeChillemi 12:54You have been awarded with the first prize in cryptology. 🏆 cosacam1 19:21Hi everybody 19:27 I have problems with split. It brakes a quoted string in several words and I want the quoted string as a whole. For example. s: {john mary "Life is good" truck plane} r: split s " " print r hiiamboris 19:32use parse cosacam1 19:32The result is [john mary {"Life} "is" {good"} truck plane] however I need the quoted sentence not to be splitted. Is it possible? Thanks. hiiamboris 19:32https://www.red-lang.org/2013/11/041-introducing-parse.html cosacam1 19:37Yes I considered to use parse (though difficult for me yet) so I tried split, maybe with a /only refinement but split doesn't have it. Any other way to do it? Only through parse? greggirwin 19:38 >> print mold load-csv/with s " " [["john" "mary" "Life is good" "truck" "plane"]] Just pull the first item in the result block, since CSV make it a "row". cosacam1 19:41Impressive! Thanks a lot 19:44 Anyway I must study hard parsing greggirwin 19:44It's an advanced topic. Do the easy thing when you can. :^) hiiamboris 19:53nice solution ;) Thursday 2nd June, 2022 rebolek 09:15@greggirwin hah, I would've never thought of that :D 09:17@cosacam1 here's the parse version: parse s [collect [some [#"^"" keep to #"^"" skip | keep to space skip]]] cosacam1 11:04Thanks both. 15:13I see to-csv is a function in csv.red. I guess I must #include %cav.red in my program. I wonder if it is possible to do it in Red like in Python: from some module import somefunctio. Is it? rebolek 15:17Not yet, Red will get module support eventually. However, you can write your own Python-like import right now, if you want. cosacam1 15:31Let me finish my app first. Thanks. It would be a good exercise. I hope I can do it 16:11@rebolek to use your solution with parse I must include a space at the end of the source string otherwise the last element (plane in my example) is not collected. Ok, I can handle that rebolek 16:57@cosacam1 you're right. sorry, I'm somehow missed it. Here's the correct version: >> parse s [collect [some [#"^"" keep to #"^"" skip | keep to space skip] keep to end]] == ["john" "mary" "Life is good" "truck" "plane"] Friday 3th June, 2022 cosacam1 12:48Thanks again Tuesday 7th June, 2022 bubnenkoff 18:45Is there any way to prevent auto-parsing values? I want to create word: foo@bar: but it's recognizing as wrong email hiiamboris 19:04@ is an invalid char in words greggirwin 19:09You *can* work around it, but you'll end up creating more problems for yourself in the long run. Once you have email! values, you can modify them and convert them to words. ALANVF 22:09@hiiamboris that's interesting, I discovered the other day that +@a is a valid word 22:10[![image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/73He/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/73He/image.png) GiuseppeChillemi 22:23In Rebol even "+@ print hello word!" is a valid word. >> type? probe to-word "+@ print hello word!" +@ print hello word! == word! >> ALANVF 22:23lol GiuseppeChillemi 22:25I think it could have a valid reason. You can create phrases that act as a single function, or couple of words with verb + subject like add row which could be useful for human oriented languages. ALANVF 22:32I personally think it's just an oversight in the lexer 22:32but sure greggirwin 22:42@ALANVF worth a ticket on that lexer issue, if not already there. ALANVF 22:43I would but I'm not sure why it happens in the first place 22:43in theory, @ should never be allowed in words 22:44(also not really sure what to search on github for this issue lol) greggirwin 22:47Start by looking for lexer and email. I think it's just a lexer bug when +/- are followed by @. ALANVF 22:53ahhh I'll bet I know why it happens then 22:53it's because +/- trigger a check for a digit in the case of a signed number literal 22:58since rebol allows it, maybe it should be kept? greggirwin 23:02Q1) Can email addresses, per their spec, have only +/- as the user part? Q2) Even if the spec allows it, does it make any sense or have any practical use? If either of those are No, keep it as is and make a note somewhere. ALANVF 23:03I don't see any good reason to have +/- as the user part in an email, though I can look into it further Wednesday 8th June, 2022 GiuseppeChillemi 11:03@ALANVF I think that's because the combination could have meaning outside the emails context. So you are left free to build words like +@data for your DSL. gltewalt 15:29invalied doohickies in email should be: % ( ) : " 15:33Looks if it is a single character of -, + in the user part, it lexes it as word! 15:37If it's / or // it throws "operator is missing an argument". If you stack more of them, so it doesn't think it is math, it is word! again dukereg:matrix.org 21:00How do you make a function that uses refinements? I found documentation of how to make a refinement! symbol but not how they are worked into functions. Any links to examples would be appreciated greggirwin 21:05Look at the source for view. We can craft an example, but if you do ? function! you'll see all the mezz level funcs that you can use source on and poke around from there. 21:06You can also look at http://www.rebol.com/docs/core23/rebolcore-9.html#section-3.4 dukereg:matrix.org 21:20Thanks, that link should suffice Thursday 9th June, 2022 cosacam1 02:17Hi. I posted this question earlier today but I don't see it here so here I go again. Text-list will show a vertical scroll bar when needed but neither drop-list nor drop-down do it. What must be done so the scroll bar shows? Thanks GalenIvanov 07:04@dukereg:matrix.org > How do you make a function that uses refinements? I found documentation of how to make a refinement! symbol but not how they are worked into functions. Any links to examples would be appreciated Maybe [this](https://github.com/red/red/wiki/A-short-introduction-to-Red-for-Python-programmers#functions) will help you. toomasv 07:51@cosacam1 Add scrollable, e.g. view [drop-list 150 data read %./ scrollable] NB! It seems to be not documented, maybe experimental/temporary? greggirwin 12:30@qtxie can you say if it's experimental, or maybe platform specific? In any case, we should doc it, and can note limitations or caveats. cosacam1 12:48Thanks both but my red 0.6.4 says invalid syntax at: [scrollable], both in my program and in Toomas example in CLI greggirwin 13:14Are you using the very old "stable" build, or automated? If stable, use the automated build. hiiamboris 13:41Maybe we should remove b from "stable" greggirwin 13:52<rimshot> ldci 14:19Toomas’s sample runs under Windows 11 but not under macOS cosacam1 18:17I'm using Windows 10. Please, clarify me about stabla and automated versions of Red. i'm using a version I downloaded a couple of months ago or less hiiamboris 18:23see the build date: >> about Red 0.6.4 for Windows built 1-Jun-2022/7:18:47+03:00 commit #c619918 cosacam1 18:59Wow, mine is 21-Nov-2018. But I'm pretty sure I downloaded it recently. Well, I'm 60 years old. Maybe that explains everything. haha. And I'm still programming! hiiamboris 19:01Great! 19:02you should download the automated build, we don't recommend "sta(b)le" to anyone cosacam1 19:15I just browsed what I downloaded recently. it was downloaded on may 24 but it's nov 2018 version. Where is the automated version? On github? hiiamboris 19:16on the same download page cosacam1 19:19I'm seeking... Oh, 2 june 2022 downloaded. Let me see... hiiamboris 19:21![](https://i.gyazo.com/189b604546457f880904f36ab507cc04.png) 19:22actually it has a huge regression since 1st of june, but if you're not using hash! you're good cosacam1 20:17downloaded, installed, running, drop-list with scroll bar ok, also load as fast as read. In the Bible application I'm writing reading the Bible database (about 3 Mb) was fast but loading it was way too slow more than 15 seconds. Not so in rebol. Now kn this Red version both are fast. I'm sure I'll rind more improvements. Thank you all. hiiamboris 20:30:+1: Friday 10th June, 2022 qtxie 06:23> @qtxie can you say if it's experimental, or maybe platform specific? In any case, we should doc it, and can note limitations or caveats. It's experimental. It's made for the gui-console. IIRC, it has been implemented on Windows and macOS backend. Tuesday 14th June, 2022 ALANVF 20:28is there a way to format a time! value to show all digits like 00:00:00.000? 20:28mostly concerned with the decimal part at the end for milliseconds hiiamboris 20:45https://github.com/red/red/pull/5069 in this branch ALANVF 20:45ah, so that's a no for now I guess hiiamboris 20:45yep ALANVF 20:45dang hiiamboris 21:40https://codeberg.org/hiiamboris/red-common/src/branch/master/timestamp.red you can do a quick hack if you really need it I guess 21:40just no standard/flexible way ALANVF 21:40I figured something out 21:41in the process, I discovered that using on-time on a 10ms delay is slower than on a 100ms delay (who knew?) hiiamboris 21:46https://github.com/red/REP/issues/26 ALANVF 21:48ah that explains it Wednesday 15th June, 2022 ALANVF 21:06apparently when using a toggle rather than a button, all text id aligned to the right if it has a custom font and has a short width 21:06[![image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/3IiN/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/3IiN/image.png) 21:06compared to a button: 21:06[![image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/L78r/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/L78r/image.png) 21:06any ideas why? hiiamboris 21:12report a bug if one does not exist ALANVF 21:12wasn't sure if it was intentional or not 21:13skimming through the View code, I don't see why it would be happening hiiamboris 21:13https://github.com/red/red/issues/4280 21:13closed but root issue is the same obv ALANVF 21:13hmm ok hiiamboris 21:14https://github.com/red/red/issues/4429 also related (for cross linking) ALANVF 21:16do you think it's this? https://github.com/red/red/blob/master/modules/view/backends/windows/events.reds#L929 hiiamboris 21:21unless you see a relation with font, then no ALANVF 21:21this is specifically when I add a font hiiamboris 21:21I mean that part of code 21:21doesn't look like font related ALANVF 21:22ok that actually was it lmao hiiamboris 21:24haha 21:25push a fix then ALANVF 21:25doing that now :+1: 21:30#5152 Thursday 16th June, 2022 cosacam1 10:20Hi guys. I've been studying Helpin Red and Red by example/parse and I can count the times a substring appears in a string, but I have not found out how to count the exact word. For example "less" appears 4 times in "A lesser blessing is less than blessed" but the exact word is just once. How can I tell parse to count only the exact word "less". Thanks hiiamboris 10:21use split first cosacam1 11:07Yes, I though that, but in that case I must remove any punctuation symbols before so I can split on spaces. Ok, thanks. hiiamboris 11:07then define a parse rule what is a *word* and count on it cosacam1 11:27Right ldci 15:32@cosacam1 . A sample #! /usr/local/bin/red Red [ Needs: 'View ] flag: 1 punct: rejoin [",.;:!?-_(){}'" form #"^""] loadFile: does [ tmp: request-file unless none? tmp [ txt: lowercase read tmp ;--lowercase for all text trim/lines txt ;--suppress all line breaks and extra spaces in text ar/text: read tmp ;--orginal text countWords ;--count words in text ] ] removePunct1: function [ aText [string!] ][ trim/with aText punct ;--trim method ] removePunct2: function [ aText [string!] ][ remove-each c aText [find punct c] ;--remove-each method ] removePunct3: function [ aText [string!] ][ _punct: charset punct parse aText [any [remove _punct | skip]] ;--parse method ] countWords: does [ foreach fcval [wordsList f1 f2] [face: get fcval clear face/text] copycat: copy txt ;--a copy since methods modify text do-events/no-wait t1: now/time/precise switch flag [ 1 [removePunct1 copycat] 2 [removePunct2 copycat] 3 [removePunct3 copycat] ] wordBlock: split copycat space ;--get words sort wordBlock ;--sort words n: length? wordBlock; - 1 count: 1 wordCount: copy [] repeat i n [ key1: wordBlock/:i key2: wordBlock/(i + 1) either key1 = key2 [count: count + 1][append wordCount rejoin [key1 ": " count] count: 1] ] ;append wordCount rejoin [key1 ": " count] ; last word in block wordsList/text: "" foreach v wordCount [append wordsList/text rejoin [v newline]] t2: now/time/precise elapsed: to-integer (third t2 - t1) * 1000 f1/text: rejoin [form n + 1 " words"] f2/text: rejoin ["in " form elapsed " ms"] ] mainWin: layout [ title "Word Count: Tests" button "Load" [loadFile] drop-down 80 data ["Trim" "Remove" "Parse"] select 1 on-change [flag: face/selected countWords] f1: field 120 center f2: field 100 center pad 140x0 button "Quit" [Quit] return ar: area white 400x400 wrap font [name: "Arial" size: 14 color: black] wordsList: area black 200x400 font [name: "Arial" size: 14 color: green] ] view mainWin 15:35@cosacam1. With 3 different methods for word counting :) ALANVF 21:01[![image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/VNlJ/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/VNlJ/image.png) 21:01how do you make a context menu like this in View that includes the keyboard shortcuts on the side? greggirwin 21:04[menu.red](https://files.gitter.im/5780ef02c2f0db084a2231b0/hAYf/menu.red) ALANVF 21:06[![image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/tG6E/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/tG6E/image.png) 21:06yeah but then it's not aligned 21:06also, having access to those menu dividers would be nice though not necessary greggirwin 21:06Did you run what I posted? ALANVF 21:07not yet, only looked 21:07oh greggirwin 21:07So...maybe do that, and read the comments. ALANVF 21:09ahhh it uses tabs 21:09thanks greggirwin 21:11Menus are mentioned in https://github.com/red/docs/blob/master/en/view.adoc, but not doc'd. As you explore, including popups, that would be a great task. ALANVF 21:11yeah I noticed that, I could probably work on that after I finish this demo greggirwin 21:11:+1: 21:12The best time to write docs is when what you didn't know is fresh in your mind. :^) ALANVF 21:12and related, I think it'd be nice if the menu option was available within VID 21:12the current method is... clunky greggirwin 21:16You can do it this way: view layout/options [size 640x480] [ menu: [ "File" [ "New Ctrl+N" new "New Window Ctrl+Shift+N" win "Open ... Ctrl+O" open "Save Ctrl+S" save "Save As ... Ctrl+Shift+S" save-as "Quit Ctrl+Q" quit ] ] ] ALANVF 21:17sure, but for multiline view blocks it's kinda out of place since you have to scroll all the way to the bottom to view the config greggirwin 21:17It's a good thought experiment for you. Why *isn't* it included in VID already? ALANVF 21:18there's also the issue of menu for widgets that support it 21:18yeah greggirwin 21:19 window-opts: [ menu: [ "File" [ "New Ctrl+N" new "New Window Ctrl+Shift+N" win "Open ... Ctrl+O" open "Save Ctrl+S" save "Save As ... Ctrl+Shift+S" save-as "Quit Ctrl+Q" quit ] ] ] view layout/options [size 640x480] window-opts Now it comes first. :^) ALANVF 21:19ehhh 21:20would much prefer something like view [ size 640x480 menu [ ... ] ... ] hiiamboris 21:21Personally I consider having word commands in the menu a mistake. Something I avoided in Spaces. ALANVF 21:22yeah I also think it's a bit odd greggirwin 21:22So think about it. Is that *really* better overall? How so? Does it come with any tradeoffs? Are menus really part of the layout? Do you think it just hasn't been considered? Of course, here I agree that if we *did* think about it, and decided not to include it that way, it would be good to mention. 21:22Do you use strings, or func refs in spaces @hiiamboris? Or something else? ALANVF 21:23well my thing is that many other properties are directly configurable for the window object as well as other widgets in VID 21:23so it would make sense for menus to also be supported there greggirwin 21:24Feel free to spec out the rationale your design, and post it. But maybe @dockimbel will weigh in on the current design before too long. 21:25Consistency in how container options are handled is a good goal. hiiamboris 21:28> Do you use strings, or func refs in spaces @hiiamboris? Or something else? Just parens greggirwin 21:29Ah, interesting, so you can include code directly. Nice idea. hiiamboris 21:29Yeah. I hate that words appear in different places and have to be kept in sync. Humans have better things to do greggirwin 21:30I do like the aspect of words that menus are best suited as a dispatch mechanism, and that making you put things behind words makes those access points from code. 21:31Menus are arg-less commands (though don't rule out the idea of menu currying :^). hiiamboris 21:31"menu line" (call your func) is no less powerful, but doesn't require indirection greggirwin 21:32So even if I used parens in spaces, I would almost certainly never inline code there. 21:33Agreed, that's why I first asked if you used func, e.g. via get-words, to avoid that. hiiamboris 21:33it's just normal code block, use func when it works greggirwin 21:35It's possible that menu could add paren support, as it shouldn't break anything. Something to remember. gltewalt 21:35> Yes, I though that, but in that case I must remove any punctuation symbols before so I can split on spaces. Ok, thanks. Why must you remove punctuation? 21:38 >> b: split "A lesser blessing is less than blessed!" space == ["A" "lesser" "blessing" "is" "less" "than" "blessed!"] >> n: 0 == 0 >> foreach element b [if find element "less" [n: n + 1]] == 4 hiiamboris 21:40you're not solving his task :) gltewalt:matrix.org 21:50I thought he wanted to count "less" greggirwin 22:02> How can I tell parse to count only the exact word "less". gltewalt:matrix.org 22:10Well if he insists on parse... greggirwin 22:26I think the key is that he wants to match the exact word, which implies ignoring punctuation. Friday 17th June, 2022 xqlab 12:31 b: split "A lesser blessing is less than blessed!" charset {",.;:!?-_(){}' } 12:32Don't forget charset! ne1uno 12:56^- for tab Saturday 18th June, 2022 GiuseppeChillemi 23:39Is there a quick way to avoid typing the same word and perform a series of operations on it, and at the end it will be updated to the new value? Example: value: 0 value: value + 22 value: value * 50 value: value + (totals/income) value: value - calculate-depreciation tot 01/01/2000 01/01/2022 Should be: value: 0 do-operation 'value [ + 22 * 50 + (totals/income) - calculate-depreciation tot 01/01/2000 01/01/2022 ] Has anyone done something like this? Sunday 19th June, 2022 gltewalt:matrix.org 00:38Conditional assignment? 00:39People have done a few different "method chain" styles gltewalt 02:55probably something like: value: if 'true [ do reduce [ 0 + 22 * 50 + (totals/income) - calculate-depreciation tot 01/01/2000 01/01/2022 ] ] toomasv 04:46value + 22 * 50 + … cosacam1 08:43Hi again. @ldci thanks for your program, actually more than what I needed. You count every word in the text, I only needed to count one. Thanks a lot. And you put a bonus- three methods to remove punctuations! I just made an improvement- instead of appending directly to wordsList/text I did it to a temporary list, then I assigned it to wordList/text `wl: copy "" 08:45foreach v wordCount [append wl rejoin [v newline]] 08:45wordsList/text: wl` 08:46It' much faster 08:48Anyway I had done my program too. Here it is Red [needs: view] letter: charset [#"A" - #"Z" #"a" - #"z" "áéíóúüñ-"] ; every letter in Spanish ; not interested in capital accented ones nor Ñ ; but interested in compound words like Baal-peor with a hyphen do-search: func [wrd [string!]] [ cnt: 0 ; the counter foreach s txt [ ; for every string in the text init-len: length? s n2: 1 ; start searching the word from the beginning of the string done: false until [ p1: none ; points to where the word appears in the string p2: none ; points to the char right after the word found in the string parse/case at s n2 [to wrd p1: thru wrd p2:] ; note that parsing starts at n2 in every loop, see below either p1 [ ; is the word present in the string? n1: index? p1 ; index of the first char of the word in the string n2: index? p2 ; index of char right after the word; besides, is where the next parsing will start ; next, is the word the first one in the string? ; otherwise, is it not preceded by any letter? ; I mean, is it not a part of a longer word? startOk: any [n1 = 1 not find letter s/(n1 - 1)] ; next, is the word the last one in the string? ; otherwise, is it not succeded by any letter? ; I mean, is it not a part of a longer word? endOk: any [n2 > init-len not find letter p2/1] if all [startOk endOk] [cnt: cnt + 1] ; the "exact word" has been found done: n2 > init-len ; the whole string is parsed? ][done: true] done ] ] r/text: rejoin [wrd " has been found " cnt " times"] ] view [ title "Counting Exact Words" button "Load" [ff: request-file if ff [txt: read/lines ff]] text "Word to search for" f: field button "Search!" [do-search f/text] return r: text 200 ] 08:49What do you think? ldci 09:19@cosacam1 Could you send a formatted version of your code? Muchas gracias. cosacam1 10:35I'll try again 10:38 Red [needs: view] letter: charset [#"A" - #"Z" #"a" - #"z" "áéíóúüñ-"] ; every letter in Spanish ; not interested in capital accented ones nor Ñ ; but interested in compound words like Baal-peor with a hyphen do-search: func [wrd [string!]] [ cnt: 0 ; the counter foreach s txt [ ; for every string in the text init-len: length? s n2: 1 ; start searching the word from the beginning of the string done: false until [ p1: none ; points to where the word appears in the string p2: none ; points to the char right after the word found in the string parse/case at s n2 [to wrd p1: thru wrd p2:] ; note that parsing starts at n2 in every loop, see below either p1 [ ; is the word present in the string? n1: index? p1 ; index of the first char of the word in the string n2: index? p2 ; index of char right after the word; besides, is where the next parsing will start ; next, is the word the first one in the string? ; otherwise, is it not preceded by any letter? ; I mean, is it not a part of a longer word? startOk: any [n1 = 1 not find letter s/(n1 - 1)] ; next, is the word the last one in the string? ; otherwise, is it not succeded by any letter? ; I mean, is it not a part of a longer word? endOk: any [n2 > init-len not find letter p2/1] if all [startOk endOk] [cnt: cnt + 1] ; the "exact word" has been found done: n2 > init-len ; the whole string is parsed? ][done: true] done ] ] r/text: rejoin [wrd " has been found " cnt " times"] ] view [ title "Counting Exact Words" button "Load" [ff: request-file if ff [txt: read/lines ff]] text "Word to search for" f: field button "Search!" [do-search f/text] return r: text 200 ] 10:39What I'm I doing wrong? It does not format 10:40 10:40Red [needs: view] letter: charset [#"A" - #"Z" #"a" - #"z" "áéíóúüñ-"] ; every letter in Spanish ; not interested in capital accented ones nor Ñ ; but interested in compound words like Baal-peor with a hyphen do-search: func [wrd [string!]] [ cnt: 0 ; the counter foreach s txt [ ; for every string in the text init-len: length? s n2: 1 ; start searching the word from the beginning of the string done: false until [ p1: none ; points to where the word appears in the string p2: none ; points to the char right after the word found in the string parse/case at s n2 [to wrd p1: thru wrd p2:] ; note that parsing starts at n2 in every loop, see below either p1 [ ; is the word present in the string? n1: index? p1 ; index of the first char of the word in the string n2: index? p2 ; index of char right after the word; besides, is where the next parsing will start ; next, is the word the first one in the string? ; otherwise, is it not preceded by any letter? ; I mean, is it not a part of a longer word? startOk: any [n1 = 1 not find letter s/(n1 - 1)] ; next, is the word the last one in the string? ; otherwise, is it not succeded by any letter? ; I mean, is it not a part of a longer word? endOk: any [n2 > init-len not find letter p2/1] if all [startOk endOk] [cnt: cnt + 1] ; the "exact word" has been found done: n2 > init-len ; the whole string is parsed? ][done: true] done ] ] r/text: rejoin [wrd " has been found " cnt " times"] ] view [ title "Counting Exact Words" button "Load" [ff: request-file if ff [txt: read/lines ff]] text "Word to search for" f: field button "Search!" [do-search f/text] return r: text 200 ] ` 10:41 Red [needs: view] letter: charset [#"A" - #"Z" #"a" - #"z" "áéíóúüñ-"] ; every letter in Spanish ; not interested in capital accented ones nor Ñ ; but interested in compound words like Baal-peor with a hyphen do-search: func [wrd [string!]] [ cnt: 0 ; the counter foreach s txt [ ; for every string in the text init-len: length? s n2: 1 ; start searching the word from the beginning of the string done: false until [ p1: none ; points to where the word appears in the string p2: none ; points to the char right after the word found in the string parse/case at s n2 [to wrd p1: thru wrd p2:] ; note that parsing starts at n2 in every loop, see below either p1 [ ; is the word present in the string? n1: index? p1 ; index of the first char of the word in the string n2: index? p2 ; index of char right after the word; besides, is where the next parsing will start ; next, is the word the first one in the string? ; otherwise, is it not preceded by any letter? ; I mean, is it not a part of a longer word? startOk: any [n1 = 1 not find letter s/(n1 - 1)] ; next, is the word the last one in the string? ; otherwise, is it not succeded by any letter? ; I mean, is it not a part of a longer word? endOk: any [n2 > init-len not find letter p2/1] if all [startOk endOk] [cnt: cnt + 1] ; the "exact word" has been found done: n2 > init-len ; the whole string is parsed? ][done: true] done ] ] r/text: rejoin [wrd " has been found " cnt " times"] ] view [ title "Counting Exact Words" button "Load" [ff: request-file if ff [txt: read/lines ff]] text "Word to search for" f: field button "Search!" [do-search f/text] return r: text 200 ] 10:42Sorry I can't ldci 11:00Something like that Red [ needs: view ] letter: charset [#"A" - #"Z" #"a" - #"z" "áéíóúüñ-"] ; every letter in Spanish ; not interested in capital accented ones nor Ñ ; but interested in compound words like Baal-peor with a hyphen do-search: func [ wrd [string!] ][ cnt: 0 ; the counter foreach s txt [ ; for every string in the text init-len: length? s n2: 1 ; start searching the word from the beginning of the string done: false until [ p1: none ; points to where the word appears in the string p2: none ; points to the char right after the word found in the string parse/case at s n2 [to wrd p1: thru wrd p2:] ; note that parsing starts at n2 in every loop, see below either p1 [ ; is the word present in the string? n1: index? p1 ; index of the first char of the word in the string n2: index? p2 ; index of char right after the word; besides, is where the next parsing will start ; next, is the word the first one in the string? ; otherwise, is it not preceded by any letter? ; I mean, is it not a part of a longer word? startOk: any [n1 = 1 not find letter s/(n1 - 1)] ; next, is the word the last one in the string? ; otherwise, is it not succeded by any letter? ; I mean, is it not a part of a longer word? endOk: any [n2 > init-len not find letter p2/1] if all [startOk endOk] [cnt: cnt + 1] ; the "exact word" has been found done: n2 > init-len ; the whole string is parsed? ][done: true] done ] ] r/text: rejoin [wrd " has been found " cnt " times"] ] view [ title "Counting Exact Words" button "Load" [ff: request-file if ff [txt: read/lines ff]] text "Word to search for" f: field button "Search!" [do-search f/text] return r: text 200 ] cosacam1 11:37Thanks that's what I tried to do. I used the three apostrophs. Isn't it the way to do it? Thanks anyway toomasv 11:41Apostrophs on separate line. ldci 11:41Don’t forget shift+enter for line break:) cosacam1 16:52Thanks. Today is Father's Day in my country and some other ones so Congratulations and Blessings to all fathers in the Red community. gltewalt 23:36Blocks can be typed out however is pleasing to you. value: do reduce [ value + 22 * 50 + (totals / income) - calculate-depreciation tot 01/01/2000 01/01/2022 ] Wednesday 22nd June, 2022 ALANVF 18:26even better, use a paren Thursday 23th June, 2022 BuilderGuy1 16:47simple question; I want to make a Block of Blocks. How do I add an existing block into my Block of Blocks without it being added as a String? 16:48 >> a: [["a" "b" "c"]] == [["a" "b" "c"]] >> b: ["z" "v"] == ["z" "v"] >> append a b == [["a" "b" "c"] "z" "v"] :-( ne1uno 16:51@BuilderGuy1, try append/only a b BuilderGuy1 16:52Works! Awesome Thanks! 16:52I will reread the docs to understand why that works hiiamboris 16:59? append BuilderGuy1 17:31@hiiamboris I checked that too. Reading "Insert block types as single values" seemed like it would be inserting a single "string" as that's what APPEND was already doing. I understand now, but the description was not clear enough for me. hiiamboris 17:33Nice imagination ;) greggirwin 17:38@BuilderGuy1 it wasn't appending as a string, but as the values inside the block. >> a: [["a" "b" "c"]] == [["a" "b" "c"]] >> b: [1 @builderguy 2x3 <oh no!>] == [1 @builderguy 2x3 <oh no!>] >> append a b == [["a" "b" "c"] 1 @builderguy 2x3 <oh no!>] BuilderGuy1 17:40That makes sense. Looking closer it's clear it isn't a string. Thanks! Friday 24th June, 2022 loziniak 12:21hi, am I doing something wrong? I want to delete *map!* element: >> m: #(k1: 1 k2: 2) == #( k1: 1 k2: 2 ) >> m/k1: none == none >> m == #( k1: none k2: 2 ) 12:22[in docs](https://red-language-documentation.readthedocs.io/en/latest/Map!-datatype/): "In order to delete a key/value pair from a map, you simply set the key to none value using one of the available ways." toomasv 12:29@loziniak This was changed long ago: >> remove/key m 'k1 == #( k2: 2 ) loziniak 12:29<3 12:32thanks toomasv 12:35:) IIRC it was motivated by need to represent null values in maps by none. loziniak 12:38ok, I had also an outdated link to documentation. on github it's already fixed: https://github.com/red/docs/blob/master/en/datatypes/map.adoc#removing-keys greggirwin 13:54We need to see where readthedocs gets its data, or how to refresh or remove it, if it's out of date. Monday 27th June, 2022 GiuseppeChillemi 12:34Pardon my ignorance about the sum of floating point numbers: is it normal that summing a lot of numbers like 180.0 20.4 40.6 I get a number with many digits like: 346773.38999999996 13:11(a result I have got in red summing 1000 of such numbers) 13:12I have also counted decimals after the decimal point and none was over length of 1. endo64 14:22I think it is about mold >> s: 20.4 + 20.4 + 20.4 == 61.2 >> mold s == "61.199999999999996" >> print s 61.2 GiuseppeChillemi 14:48I have used Probe 14:48I have summed and probed the total value 14:58I confirm: if you PRINT it, you get 2 digits; if you PROBE it, you get all digits. I don't now if PROBE/MODEL work is correct. To you the answer. Respectech 16:02This is a well-known issue in the binary representation of floating-point numbers in computer science. Any language that uses floating-point numbers in the pure binary representation will run into this issue. The reason to use this type of floating-point number is speed, so most languages concerned with speed use this method. hiiamboris 16:33Use https://en.m.wikipedia.org/wiki/Pairwise_summation 16:33And round 16:35You can also sum numbers as 'money' GiuseppeChillemi 19:30Thank you Tuesday 28th June, 2022 GiuseppeChillemi 21:58Is it possible to convert from yearday to date? hiiamboris 21:59 >> d: 1980/1/1 == 1-Jan-1980 >> d/yearday: 200 == 200 >> d == 18-Jul-1980 ALANVF 22:01wondering if this is intentional or not? accessing the size of the window during initialization will not access the configured size, for example: view [ size 500x500 base with [ size: parent/size ] ] will cause the base widget to have a size of 100x100, since that's the default size for the window 22:02(also interesting, gitter is cutting off the first 5 in 500x500) GiuseppeChillemi 22:11@hiiamboris Thank you, I remember there where accessors but I forgot how to use them 22:12And, how whould I do to list all accessors? ne1uno 22:19print [system/catalog/accessors/date!] GiuseppeChillemi 22:37I have made a typo and something interesting has happened: >> probe d:week d:week == d:week >> probe type? d:week url! Is this correct? Respectech 22:59Yes. GiuseppeChillemi 23:03Thank you, I am also having a problem with date accessors: I am able to calculate everything but 2 values: * The end of the last/next/nth month, without having an auxiliary table * The end of the year without doing math by myself to understand if the year is a leap one. * The last week of of the year as they are sometime 52 and sometime 53 All other calculations are doable but I can't say: date/yearday 'last or date/day 'last or date/week 'last Respectech 23:19Here is one way to solve it without tables: >> d2: now/date == 28-Jun-2022 >> d2/month: d2/month + 2 == 8 >> d2/day: 1 == 1 >> d2: d2 - 1 == 31-Jul-2022 >> d2/day == 31 23:21 >> d2/year: d2/year + 1 == 2023 >> d2/month: 1 == 1 >> d2/day: 1 == 1 >> d2: d2 - 1 == 31-Dec-2022 >> d2/yearday == 365 23:22I did these samples in R2, but I imagine the same/similar could be done with Red. 23:26Here's a slightly shorter method: >> d2: now/date == 28-Jun-2022 >> d2/year: d2/year + 1 == 2023 >> d2: d2 - d2/yearday == 31-Dec-2022 >> d2/yearday == 365 GiuseppeChillemi 23:30Thank you. Wednesday 29th June, 2022 ALANVF 00:09is there a way to animate a GIF in View? greggirwin 00:16@GiuseppeChillemi I have old funcs for those, but it sounds like you want to avoid some approaches. In any case, there's a subtlety to weeks in year. This is old R2 code: ;ISO 8601 specifies that Week 01 of the year is the week containing ;the first Thursday; Monday is Weekday 1, Sunday is Weekday 7; weeks-in-year: func [year [date! integer!]] [ if date? year [year: year/year] jan-1: to-date join "1-Jan-" year dec-31: to-date join "31-Dec-" year 52 + either any [equal? 4 jan-1/weekday equal? 4 dec-31/weekday] [1] [0] ] 00:24@ALANVF on window sizing, it's expected. The panel (parent) size isn't set until the entire layout is processed. Whether that could change is a good question for @qtxie or @dockimbel. That is, it could be set when size is seen, then later adjusted, but there may be a reason it doesn't do that. ALANVF 00:24it seems counterintuitive which is why I asked about it greggirwin 00:25On GIFs, I want to say someone wrote a codec for them in R2 and did it manually, but I don't remember it being done for Red. ALANVF 00:25in general, window and widget resizing is all sorts of annoying and probably needs reworked at some point 00:26hmm, how hard would it be to add proper GIF support in that case? 00:27(if you don't know that's fine, just thinking it could be put on the roadmap) greggirwin 00:30On sizing, there are things which may seem more convenient, but also have pretty easy solutions already. If @qtxie doesn't see an issue, initializing this one sooner seems and easy change. On GIFs, there are a couple things 1) Does each OS have a standard loader for them? If not, it's a bit of work there. Then there are changes to event loop handling for them. The real question for me is value. I can see people wanting it, even if I don't. :^) ALANVF 00:32I can look into the loader thing tomorrow :+1: ne1uno 00:34a: load %"animated.gif" ? a locked up recent console. I only test a few images qtxie 01:35@ALANVF Opened an issue for it. https://github.com/red/red/issues/5154 ALANVF 01:35:+1: Friday 1st July, 2022 cosacam1 03:18Hi guys. Has anyone converted a Red program into an Android apk? How to do that? Besides, taking acount that many Android devices have different screen sizes, how to make my application to look the same in any device? RFO-BASIC! has scale_width and scale_height (or something like that) for that matter. How to in Red? Also, does Red have functions for Android's SQLite? Thanks greggirwin 04:34Red's Android branch is quite stale at this time, and isn't production ready. When it was in active development, you could create an Android app without any other tools. SQLite bindings were never ported there AFAIK. cosacam1 10:47However I see the demo with the tiger. It is a real example, isn't it? And there's a library for SQL in github, right? GiuseppeChillemi 11:10Do we have a command to create a function with all locals but no specs block? Just the body argument.... cosacam1 11:57Afaik all words used in function are local unless specified as /extern rebolek 12:25@GiuseppeChillemi I don't think there's such function. But making your own is very easy. Oldes 12:44@cosacam1 you mean _set-words_. 12:45Having all words local would be pretty useless cosacam1 15:28Well, I mean all vars needed in the function can be local. The function receives parameters and returns a result. That's how the black box communicates with the outside world. If any outside global var needed, it can be declared as /extern. I'm talking about information hiding. That's what Giuseppe needs. Otherwise I missunderstood his question hiiamboris 15:36I think he wants a shortcut for function [] cosacam1 15:40Interesting gurzgri 15:50@cosacam1 Yes! :wink: And you really only *mean* words of type set-word! :wink: The Redbol languages have no notion of "variables". They only have values. Some of these values are of type word! or it's different flavours like set-word!, get-word! etc. function only binds words of type set-word! to the context of the function it creates, with the exception of those declared as /extern. greggirwin 16:36> However I see the demo with the tiger. It is a real example, isn't it? And there's a library for SQL in github, right? The tiger demo is 100% real, and still runs on my Android phone, and you *may* be able to build things, but that branch is terribly out of date, so no guarantees. And, yes, there are bindings people have written, but I haven't heard of anyone using the SQLite binding on Android. cosacam1 17:27Thanks. I think Red development for Android should be a must. Smart phones are pocket computers everyone use now 24/7. I wish I had time and knowlege to enhance Red to its top! GiuseppeChillemi 17:49@rebolek yes, I know and it is super easy. Just asking if one exists, so I can use the standard one. cosacam1 20:14Yes, Rebol/Red has no vars as "some value is assigned to some symbol", but rather it is "some symbol is assigned to some value that exists in memory", kinda a pointer. That's what I refered to when I spoke of variables in a function. Ok, just briefing- does uses global words; has uses globals and locals, the later are in spec; func uses globals and locals specified by /local; finally function uses local words and globals specified by /extern cloutiy 22:48👍 Monday 4th July, 2022 ldci 17:09Hi, I have a 10x10 gif that consists of 4 colors, white, red, blue, black. 47 49 46 38 39 61 0A 00 0A 00 91 00 00 FF FF FF FF 00 00 00 00 FF 00 00 00 21 F9 04 00 00 00 00 00 2C 00 00 00 00 0A 00 0A 00 00 02 16 8C 2D 99 87 2A 1C DC 33 A0 02 75 EC 95 FA A8 DE 60 8C 04 91 4C 01 00 3B I'm able to parse the gif file and get the gif structures such as the Global Color Table [#{FFFFFF} #{FF0000} #{0000FF} #{000000}] I have image data above (labeled imageData) and I'm trying to decompress the data so that I get the original image. imageData: [8C 2D 99 87 2A 1C DC 33 A0 02 75 EC 95 FA A8 DE 60 8C 04 91 4C 01 00] GIF packs LZW codes into bytes in LSB-first order. The first code is stored as the 3 least-significant bits of the first byte; the second code as the next 3 bits; and so on. Any idea? Oldes 17:54load/as bin 'gif isn't enough? ldci 18:24@Oldes. Thanks, that’s perfect for gif image with a unique image. Now the question is about a gif file with more than 1 image :) hiiamboris 18:28I guess you'll have to study how lempel-ziv decoding works ldci 18:29@hiiamboris. Yes, but I do not understand the logic :) hiiamboris 18:30find a better explanatory article ;) ldci 18:32@hiiamboris. https://www.matthewflickinger.com/lab/whatsinagif/ is very good :) hiiamboris 18:34yeah looks nice :+1: greggirwin 18:44https://github.com/rebol/rebol/blob/master/src/core/u-gif.c has LZW C code in it. ldci 18:49@greggirwin. Thanks a lot:) Wednesday 6th July, 2022 cosacam1 12:08Hi. I compiled the program I've been working on into an exe. I run it and it shows a CLI window besides the main window. Is there any way to not show CLI window? Thanks hiiamboris 12:12-t windows 12:13red --help 12:15https://github.com/red/red/wiki/%5BDOC%5D-FAQ#how-do-i-make-it-so-that-compiled-gui-programs-on-windows-dont-spawn-a-parent-console-on-startup cosacam1 12:22Ok thanks ldci 20:30Is Red a vaporware? No commication on https://www.red-lang.org since December 31, 2021. ALANVF 20:31nah ldci 20:31communication :) ALANVF 20:31they're posting a new blog soon iirc ldci 20:36I have invested a lot in Red and Rebol before and I feel abandoned: no news about programming language advances. ALANVF 21:45lots of new things happen, we just don't always have the time to write about them dockimbel 21:46@ldci We are finishing a complete reorganization of the project. More news soon. Thursday 7th July, 2022 GiuseppeChillemi 00:20I need to copy/deep an object but it truncates each of its series at index, and the new object has only series starting from it. Is there a command to copy/deep an object and also PRESERVING every element in series which is before their current index? ldci 04:09@dockimbel Thanks hiiamboris 08:08No, @GiuseppeChillemi GiuseppeChillemi 10:04@hiiamboris I have made a little recursive function to copy/deep in each element, preserving the whole series but I don't know how to handle the danger of circular references. Oldes 10:06Your function would have to keep a map, what was already converted (copied) to what. 10:07But I believe, that you are again in the field where you should not be. Mines are waiting for you! hiiamboris 10:46Just let it fail. 'copy/deep' does. GiuseppeChillemi 14:56@Oldes I am working on a datatype. made using an object which has the data container inside. It is a block which contains a table like: make object! [ type: 'bob-table Data: [[col1 col2 col3][1 2 3][4 5 6]] .... ] data block is kept using Red block position. So, when a I need another instance of the data, copy/deep it,. The problem is that I get truncation of the data block, so if index is at 2, the new container will be without elements before. make object! [ type: 'bob-table Data: [[1 2 3][4 5 6]] .... ] (Note: BOB = Block of Blocks ;-) hiiamboris 15:24here's a badass trick for you: >> o: object [type: 'bobby data: reduce [next [1 2 3] next [a b c]]] == make object! [ type: 'bobby data: [[2 3] [b c]] ] >> p: load/as save/as #{} o 'redbin 'redbin == make object! [ type: 'bobby data: [[2 3] [b c]] ] >> head p/data/1 == [1 2 3] >> head p/data/2 == [a b c] >> same? p/data/1 o/data/1 == false GiuseppeChillemi 15:25Super Badass 23:36How do I clean a string of the LF to not have them visibile?The original string spawns multiple lines in the source and when I print it I get the following: {^/^-^-^-insert into MY-OWN-TABLE^/^-^-^-(col1 , col2 , col3)^/^-^-^-values^/^-^-^-('1' , '2' , '3''4' , 'a' , '6');^/^-^-} I do not want to remove them but have a clean multiline output 23:41@Oldes > But I believe, that you are again in the field where you should not be. Mines are waiting for you! I am also a creative, I like inventing and experimenting new solutions with the things I use. Often this leads to innoviations that could olnly be seen in the future. 23:43When Carl has started, had a strange idea of experimenting with words... Lets see where we are now! Friday 8th July, 2022 GalenIvanov 06:20@GiuseppeChillemi It works fine for me: >> s: {^/^-^-^-insert into MY-OWN-TABLE^/^-^-^-(col1 , col2 , col3)^/^-^-^-values^/^-^-^-('1' , '2' , '3''4' , 'a' , '6');^/^-^-} == {^/^-^-^-insert into MY-OWN-TABLE^/^-^-^-(col1 , col2 , col3)^/^-^-^-val... >> print s insert into MY-OWN-TABLE (col1 , col2 , col3) values ('1' , '2' , '3''4' , 'a' , '6'); >> GiuseppeChillemi 07:52It a side effect of having just moved from Rebol my codebase: probe { a b c } Red: {^/a^/b^/c^/} Rebol { a b c } I must rewire my brain to remember that I must use Print instead of Probe to see the sting printout as I have meant it to be. 18:05I am hitting some limits: I have 2 blocks with 28.000 lines each, coming from 2 queries. I have asked the system to unique set1 set2 but I receive a stack overflow. Is there any way to raise the stack? Do you have other sulutions? greggirwin 18:09Will this work for you @GiuseppeChillemi ? unique: function [ "Returns a copy of the series with duplicate values removed." series [series!] ; /case "Perform a case-sensitive search" ; /skip "Treat the series as fixed size records" ; size [integer!] ][ res: make series length? series foreach val series [ if not find/only res val [append/only res val] ] res ] (old code, from before set ops and collect existed) 18:10If it doesn't crash, let us know how slow it is. :^) GiuseppeChillemi 18:11Yes, thank you. I just hoped a way to rise the stack existed but I can use this function too. 18:13Why are you making RES of the same length of series? greggirwin 18:14The problem with raising the stack size is that you'll have to do it again, and again, ...or maybe not, but then we can also ask how big the stack limit should be on modern systems. Pre-allocating for the worst case, so appends don't slow down as it grows incrementally. 18:14Feel free to test without that, and post results. GiuseppeChillemi 18:15I have made a mistake... 18:15I have written unique instead of difference. However, the result is the same. 18:15I will write my own one 18:16> Feel free to test without that, and post results. I will test it! greggirwin 18:16 series-difference: function [ "Returns the unique symmetric difference (XOR) between two sets." series1 [series!] series2 [series!] ; /case "Perform a case-sensitive search" ; /skip "Treat the series as fixed size records" ; size [integer!] ][ res: make series1 length? series1 series1: unique series1 series2: unique series2 foreach val series1 [ if not find/only series2 val [append/only res val] ] foreach val series2 [ if not find/only series1 val [append/only res val] ] unique res ] GiuseppeChillemi 19:46Thank you but it took very long times. 5 minutes for 28k rows hiiamboris 19:47convert to hash GiuseppeChillemi 20:09I will test it Thursday 14th July, 2022 GiuseppeChillemi 23:03How do I run another instance of red from the previous directory and pass it arguments via CALL? call {../red.exe "argument1" "argument2"} This does not work 23:32Previous directory problem solved. It is just how to pass the arguments the problem Friday 15th July, 2022 hiiamboris 06:57How is it a problem? GiuseppeChillemi 07:42Using that line, my system/options/args and system/script/args ar empty. hiiamboris 08:00You probably messed it up then. 08:00Badly, as usual ;) GiuseppeChillemi 08:24It's a simple call! No trickery! 08:24[![image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/dbcC/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/dbcC/image.png) 08:26Well, solved. 08:26;-) 23:48In Rebol I could do: to-date "15-jun-2022" Red gives me an error. Is there a solution? Saturday 16th July, 2022 gltewalt 03:36load it 03:38load "15-jun-2022" GiuseppeChillemi 07:17Thank you. I would prefer it implemented in a to function to avoid loading something dangerous. rebolek 07:59load values aren't dangerous, if you don't do them GiuseppeChillemi 08:57This is correct. Monday 18th July, 2022 cosacam1 03:07Hi there! How can I know all possible error ids? 03:13I mean, I want to use cause-error. I need to know all possible err-type and err_id available. Thanks greggirwin 03:22system/catalog/errors gltewalt 03:24help system/catalog/errors If you want to inspect a certain category, like math: help system/catalog/errors/math 03:26If you want to see everything all in one glob: probe system/catalog/errors cosacam1 03:32Thank you very much! gltewalt 03:41Categories and their numbers: >> ws: words-of system/catalog/errors == [throw note syntax script math access reserved1 reserved2 user internal] >> foreach word ws [print [word system/catalog/errors/:word/code]] throw 0 note 100 syntax 200 script 300 math 400 access 500 reserved1 600 reserved2 700 user 800 internal 900 cosacam1 14:03Thanks again. By the way, I've read about catch and throw in Red by example, Helpin Red and other book Learn Red... (I don't remember it's name now) but I couldn't grasp the concept. I remember I once used them in Delphi or Borland Pascal (I guess) long ago but always related to exceptions. However those books I mentioned say they are not for error handling. Could anyone clarify me or direct me to other readings? Thank you. Oldes 14:25throw is a special type of exception (similar to error). When it is reached, it stops current evaluation and rewinds to the state, where is catch found, where it resumes the execution. 14:25 >> test: does [print catch [ print 1 f: does [print 2 throw 4] f print "this is not reached"] print 5] test 1 2 4 5 14:27 When used with /name, it can be catched only with catch using the same name. 14:31Compare with: >> test: does [probe try [ print 1 f: does [print 2 1 / 0] f print "this is not reached"] print 5] test 1 2 make error! [ code: 400 type: 'math id: 'zero-divide arg1: none arg2: none arg3: none near: [0] where: 'try stack: 74584876 ] 5 hiiamboris 15:501st hit in google: https://chenyitian.gitbooks.io/rebol-core-user-manual/content/docs/words/throw.html GiuseppeChillemi 16:47How should it be used for functions? f: func [ "My Func" [catch] arg1 [integer!] ] [ if arg1 > 22 [make error! rejoin ["Number to big!: " arg1 " max is 22!"] ] Is it ok? hiiamboris 16:50where did you get that, and what are you trying to do? GiuseppeChillemi 17:03I have read in somebody else code on Rebol2. I would like to return an error from the inside of a function to the caller one and have the message returned in console if the error is not managed. I dont remember if [catch] in specs was after or before the function description. 17:09Here is a code with it string-length?: func [[catch] string [any-string!] /local counter][ either parse/all string amend [ (counter: 0) any [[ascii | utf-8] (counter: counter + 1)] ][counter][raise "String contains invalid characters."] ] Taken here: https://github.com/rgchris/QuarterMaster/blob/master/qm.r greggirwin 17:25The best description for their use, IMO, is "non-local flow control". hiiamboris 17:51http://rebol.com/docs/core23/rebolcore-9.html#section-7 @GiuseppeChillemi GiuseppeChillemi 17:59Thanks, read. 18:00I have seen that in Rebol2 there is FUNCT which let you use a permanent object. Do we have it in Red? rebolek 18:12No, but it's easy to add. greggirwin 18:12No, but it's a mezzanine in R2 so you can see the source. 18:14Looking at the source, this line (unless object? object [object: make object! object]) reminds me of Ladislav's default, which I used sometimes. Lines like the above are *awful* IMO. 18:17I have a number of experimental versions for Red, which extended the idea to support defaulting multiple words in one call. GiuseppeChillemi 18:17Are they pubblic? greggirwin 18:19Option 1, works like set with a block of words and a block of values. default: function [ "Sets the value(s) one or more words refer to, if the word is none or unset" 'word "Word, or block of words, to set." value "Value, or block of values, to assign to words." ][ def: func [w "Word" v "Value"][ ; We're setting one word, so don't need to use set/only. if any [not value? :w none? get w][set w :v] get w ] ; CASE is used, rather than COMPOSE, to avoid the block allocation. case [ word? :word [def word :value] block? :word [ collect [ repeat i length? word [ keep/only def word/:i either block? :value [value/:i][:value] ] ] ] ] ] e.g. [ default a 1 default [a b c] [2 3 4] default f :append ;default [g h i j "k" #l m] [1 2 [3] 4 5 6 7] ;default [g h i j "k" #l m n o] [. . . . . . . .] default [g h i j k l m] [1 2 [3] 4 5 6 7] default [g h i j k l m n o] [. . . . . . . .] ] 18:20Option 2, uses a key-value block approach. ; word(s)-value pairs interface. default: function [ "Sets the value(s) one or more words refer to, if the word is none or unset" input [block!] "word(s) value pairs" ][ def: func [w "Word" v "Value"][ ; We're setting one word, so don't need to use set/only. if any [not value? :w none? get w][set w :v] get w ] ; CASE is used, rather than COMPOSE, to avoid the block allocation. foreach [word value] input [ case [ word? :word [def word :value] block? :word [ collect [ repeat i length? word [ keep/only def word/:i either block? :value [value/:i][:value] ] ] ] ] ] ] e.g. [ default [a 1] default [ a 2 b 3 c 4 [d e] -1 ] default compose [f (:append)] default [g 1 h 2 i [3] j 4 k 5 l 6 m 7] default [[g h i j k l m n o] '.] print [a b c d e :f g h mold i j k l m n o] ] 18:21The basic version is just for single words. default: func [ "Set a value for the word if the word is not set or is none." 'word value ][ if any [not value? :word none? get word] [ set word :value ] get word ] hiiamboris 18:25I'm using default a lot. But for the case above it's not useful as it would create the object even if it's not needed. greggirwin 18:26You mean the case in funct? hiiamboris 18:26Yeah 18:26Or rather it will cause an error 18:27Oh it depends.. 18:27 >> object object [x: 1] *** Script Error: object does not allow object! for its spec argument *** Where: object *** Near : 1 *** Stack: run eval-command do-command try-do object >> make object! object [x: 1] == make object! [ x: 1 ] greggirwin 18:27Yes, it would need to be extended if that's an issue. hiiamboris 18:28All tradeoffs. I tried feeding a block to default, but then it's not any more readable than any. greggirwin 18:28That is, if you want control over making necessary values or not. 18:29For me the main value by *far* is having the name there itself, because it's so meaningful. hiiamboris 18:29Also default won't check for object vs block, only falsey values. So not an option here anyway. greggirwin 18:46The case of object only allowing blocks is one of those subtle things that we don't often think about. Where it forces you to use make or copy, which are very clear in meaning. Object is declarative, but a function. Wednesday 20th July, 2022 cosacam1 12:47Hi. a: 22 b: 22 a =? b ; true but c: [3 2 1] d: [3 2 1] c =? d ; false Isn't it confusing? hiiamboris 14:24no 14:24but if you don't get the meaning of =?, why use it? cosacam1 14:39I do get the meaning of =? It is used to find out if two objects have the same id, if they both point to the same location in memory. So, a and b have the same value but they are different words. I guess they are binded to different data, in different memory locations. In that case =? should return false. I took the example from Red by example. hiiamboris 14:43there are basically 2 kinds of values in Red: series and immediates 14:43immediate, like 2 or 'word or #[none] fit into a single cell 14:43series do not 14:44and you can append stuff to them 14:44so they fit no measure eventually, save for the amount of RAM Red can address 14:44series are a cell that points to a memory location 14:45by same? or =? you ask if the cells are identical, which in case of series means also pointing to the same memory location, but in case of an immediate it's just the cell itself 14:47pseudo example: cell1: [type: block! address: 153914916] and cell2: [type: block! address: 7140601] are not identical, but cell3: [type: integer! value: 123] and cell4: [type: integer! value: 123] are 14:48when you write a =? b both a and b get evaluated, and =? receives their *values* (which are cells) 14:48so it's not about words at all! 14:48you wanna compare words, type 'a =? 'a 14:49because 'a will evaluate into an a value which is a word 14:49makes any sense? cosacam1 15:13Yes. Thanks for your explanation. Never heard of inmediaates. Just words, series, blocks, etc. A lot of useful data-types Rebol and Red have. hiiamboris 15:20 >> ? immediate! IMMEDIATE! is a typeset! value: [datatype! none! logic! char! integer! float! word! set-word! lit-word! get-word! refinement! issue! typeset! pair! percent! tuple! time! handle! date! money!] cosacam1 15:30My boss asks me to program in Python. And my probably-next boss too! I know it's popular and easy to learn. I studied 4 years ago but I could not use it for several reasons. I discovered Rebol and got fascinated: how could it do sooooo much with tooooo little, only 844 kb! Then moved to Red, the same! Well, I am comparing Python and Red to show myself which is better (so far I preffer Red) I took the samples from ellibrodepython.com and I'm studing and rewriting them in Red. Today I was studing Python's is which is equivalent to Red's =? Wish me luck! 15:33I need to study more Red. Inmediate was there and never saw it. I need time. I told you once I'm a very busy guy... And I'm 60 already. hiiamboris 15:41Nice! ☻ 15:42@cosacam1 might find this useful https://github.com/red/red/wiki/A-short-introduction-to-Red-for-Python-programmers Oldes 15:43If I can give you an advise, use Python or whatever else to earn some money and have Rebol or Red as a hobby. Btw... you may easily use Rebol or Red with Python... I was using Rebol scripts to control Python powered AI code recently. GiuseppeChillemi 16:02I still don't know which language to learn other than Red. I need to develop for web and mobile and also do some AI. Candidates are Phyton, C#, Javascript and Flutter. C# because it works well on all environments. I don't know in which order to start or if I should change some of the candidates. hiiamboris 16:05good luck with those, esp C# cosacam1 16:05@hiiamboris Thanks for the link. I see somebody else did the job. It's a good book. Oldes 16:06Knowing Javascript (or its clones) cannot hurt anybody. When you need AI, than there is only Python I guess (if you don't want to write everything from scratch). hiiamboris 16:06@cosacam1 kudos to @Galenivanov and PM him if you have ideas how to improve the read cosacam1 16:11@Oldes Yes, that's what I do. I wrote a program in Rebol to search in the Bible, read it and make sketches for sermons. I recently enhanced the app with Red. I want to make a version for Android. Let's see. GiuseppeChillemi 16:11@hiiamboris Which other suggestions to you have from your experience? hiiamboris 16:13none, sorry ;) I don't write web or AI stuff GiuseppeChillemi 16:14Nice news, so you are always committed into doing great stuff on Red! cosacam1 16:19Two things I like most of Rebol/Red is VID and parse. I wonder why regex is so obfuscated with those weird symbols when it should be written in english as in R/R parse. Have you ever seen a kivy book? Just to install it is a nightmare. And so many lines for a simple interface. There's nothing like VID. 16:32I read in Helpin Red that there is Nenad's Cheyenne, a small server for running Red scripts in the backend, for web development. I've never worked for the web hiiamboris 16:48Well, regex is concise. It was a nice solution for simple single-line pattern matching in the shell. People just abused it too much. cosacam1 17:58By the way. Is there an important market for Red coders? You guys earn your living with Red or just use it for hobby? gltewalt 18:17@GiuseppeChillemi learn Javascript. There are libraries for Android development, and tensorflow has a js library for A.I. 18:22https://github.com/getify/You-Dont-Know-JS Thursday 21st July, 2022 riprwwa 01:21C#: good for backend, graphical UIs (WPF, MAUI), good for mobile apps (Xamarin, Uno); pretty big ecosystem; it's statically typed so in some aspect less surprises; reasonably fast; lots of people to ask for help Javascript: pretty easy to learn (though it has its quirks), good for backend (Nodejs), frontend (vanilla or using any of lots of web frameworks), mobile (hybrid apps with Ionic or Meteor or others) and even desktop (Electron); big ecosystem; dynamic (with quirks); lots of people to ask for help. For web development you might also need the other two in the web trinity: HTML and CSS cosacam1 02:17And all this could be done with Red if it had enough libraries as far as it is a full stack programming language. Right? I've spent all my programmer's life developing desktop apps with only one tool name it Basic In many flavors or Turbo/Borland Pascal/Delphi or Game Maker without needing almost anything else. It's difficult for me to link all those software pieces in order to get a hugh application with a lot of dependencies and error prone if they are not so well linkeda. Yes I know there's no need to reinvent the wheel but... how many car brands exist right now in the world? And they innovate all the time! That's the beauty of programming, the best job ever! greggirwin 02:40:+1: riprwwa 04:13I agree with you @cosacam1 that's why I'm here :), was just responding to @GiuseppeChillemi who seemed to be pondering a choice in programming languages for web and mobile and maybe even AI (there's at least ML.NET for C# and TenshorFlow.js for Javascript) pekr 06:52What we can see in terms of our enterprise, is basically partners using two streams - you are either a React (Native) team, or an Angular + Flutter team :-) I have seen just one company around using Xamarin. GalenIvanov 07:36@cosacam1 Hi! I wrote [A-short-introduction-to-Red-for-Python-programmers](https://github.com/red/red/wiki/A-short-introduction-to-Red-for-Python-programmers) last summer. I'm sure there are many things that can be improved and I'll appreciate your feedback. ldci 17:33@GalenIvanov Your text is excellent and it woulbe important to add some supplementary samples :) GalenIvanov 18:06@ldci Thank you! ldci 18:15@GalenIvanov Have a look to what we did with Toomas for LZW compression/decompression compaired to python :) 18:16Most of my students use python and are really impressed when I show a reduced code with Red/REBOL:) pekr 18:22My team uses JAVA long time. Our company got acquired by big real estate one. The original tem used Kotlin (JAVA), but left the company and new team uses Python and React infrastructure. Now my team should learn Python as well, but is not happy about that. It is not easy to switch tools you are used to for long years. GalenIvanov 18:28@ldci I saw a discussion of LZW compression for GIFs but I don't think I've seen the final result. Can you share a link? Do you students want to learn Red/Rebol? ldci 18:46@GalenIvanov I think that Toomas will relesea the code on Githun after some controls. Have a look to red/red/system room:) GalenIvanov 18:49OK, thanks! ldci 18:57Sorry release on Github.I’m exhausted:) Friday 22nd July, 2022 GiuseppeChillemi 09:08I have a problem creating my one-of? function. It will return true if the data passed is any if the possible options. Well, in shich order would you write the args and why? one-of? data [possible options] or one-of? [possible options] data hiiamboris 09:10data has-one-of? [possible options] 09:10because it reads rebolek 09:10The convention is data first. There are exceptions to this rule, but generally you should abide by it. GiuseppeChillemi 09:10So you would make it as an operator? rebolek 09:11If you feel adventurous, go with infix operator, but that's not my preference. GiuseppeChillemi 09:11Pardon, the question was for @hiiamboris 09:12@hiiamboris So you would make it as an operator? 09:12@rebolek > The convention is data first. There are exceptions to this rule, but generally you should abide by it. have you a list of the rules? rebolek 09:15I can't find it now, IIRC it was called Rebol style guide or something like that. hiiamboris 09:15> @hiiamboris So you would make it as an operator? Definitely rebolek 09:16There's this http://rebol.com/docs/core23/rebolcore-5.html#section-5 but it doesn't mention the order of the args. hiiamboris 09:16has-one-of or is-one-of depending on what you're doing GiuseppeChillemi 09:17I will make it an infix when I will leave Rebol2 totally, which should happen soon hiiamboris 09:17otherwise just find [options] data, no need for a function rebolek 09:20Ok, let me correct myself. By data I meant the series you are searching in, so in your example [possible options]. GiuseppeChillemi 09:20@rebolek > I can't find it now, IIRC it was called Rebol style guide or something like that Why don't you a list of rules, so the community has reference? rebolek 09:20find [options] data is ok, if data can be just one value. 09:21> Why don't you a list of rules, so the community has reference? Carl set those rules, not me :-) 09:21It's just that the documentation is scattered an hard to search... GiuseppeChillemi 09:25@hiiamboris > otherwise just find [options] data, no need for a function It manages the special datatype case: one-of?: func [ "Returns true if a value is found in allowed values" allowed-values [block!] value "The value to find, datatypes are searched as words" /only "TBD:" /local out-data ] [ either not block? :value [ if datatype? :value [value: to-word value] out-data: not none? find allowed-values :value ] [ forall value [ out-data: not none? find allowed-values value/1 if out-data = false [break] ] ] out-data ] 09:26I need it for checking for datatypes as function does. toomasv 09:28@GiuseppeChillemi Can you pleeease stop using not none?. It hurts eyes, sorry! :) Oldes 09:30And if you want to check datatypes like function does, than you should use datatypes and typesets instead of words and block. 09:31 >> allowed-types: make typeset! [string! file!] == make typeset! [string! file!] >> find allowed-types string! == true >> find allowed-types integer! == false GiuseppeChillemi 09:34@toomasv I just discovered that a series at position = true 09:35Coming from Rebol, the found? function still confuses me 09:35Even on Rebol it is not needed Oldes 09:36And if you really need something like that, than use: [ either block? :value [ forall value [ if find allowed-values value/1 [return true] ] ][ if datatype? :value [value: to word! value] if find allowed-values :value [return true] ] false ] GiuseppeChillemi 09:37@Oldes > And if you want to check datatypes like function does, than you should use datatypes and typesets instead of words and block. I have no typesets in Rebol2. Also the function is not only meant for datatypes but for any value. I will create a datatype only version to check for datatypes. 09:38And if you really need something like that, than use: yes, now I can definitely abandon the found? mental cage. 09:44But why was found? created? Was there a time were not or if like functions were not handling truthy values or series were not truthy? rebolek 09:47I'm not sure about found? but I find true? very useful and miss it in Red. GiuseppeChillemi 09:54I think so: true? <something> is often better than true = hiiamboris 10:00not the same thing rebolek 10:01true GiuseppeChillemi 10:04Yes you are right, True? is for truthy and true is just for logic toomasv 10:06@GiuseppeChillemi How about this: one-of?: func [ allowed [block!] "Parse rule" value [any-type!] ][ if not block? :value [value: append copy [] :value] parse value [some allowed] ] >> one-of? ['a | integer!] 'a == true >> one-of? ['a | integer!] [a 1] == true >> one-of? ['a | integer!] [a 1.5] == false >> one-of? ['a | function!] does [nothing] == true >> one-of? [word! | quote 1] [a 1] == true GiuseppeChillemi 10:13@toomasv My rulify function: seems perfect to manage your allowed arg. rulify: func [ "Converts a block of words to a rule [one two three] -> [one | two | three]" elements [block!] /local out-data element ] [ ;TBD: Validate elements ;TBD: make a vaersion just for datatypes out-data: copy [] forall elements [ element: first elements ;probe type? element-value case [ any [word? :element string? element] [ append out-data to-lit-word element ] ;lit-word? element [ ; ;] datatype? element [ element: to-lit-word to-word element ;you need this for datatypes on Rebol append out-data element ] ] if (length? elements) > 1 [append out-data [|]] ] out-data ] 10:15 probe rulify [block! word!] = ['block! | 'word!] 10:16It is a work in progess, I need to learn how to handle lit-words in Parse. 10:17 probe rulify [hello word] = ['hello | 'word] toomasv 10:17> I need to learn how to handle lit-words in Parse >> parse ['a][lit-word!] == true >> parse ['a][quote 'a] == true GiuseppeChillemi 10:18Ok, so I should only output [quote 'a] inside the rule 10:22Done, thank you rulify: func [ "Converts a block of words to a rule [one two three] -> [one | two | three]" elements [block!] /local out-data element ] [ ;TBD: Validate elements ;TBD: make a vaersion just for datatypes out-data: copy [] forall elements [ element: first elements ;probe type? element-value case [ any [word? :element string? element] [ append out-data to-lit-word element ] lit-word? element [ element: reduce ['quote element] append out-data element ] datatype? element [ element: to-lit-word to-word element ;you need this for datatypes on Rebol append out-data element ] ] if (length? elements) > 1 [append out-data [|]] ] out-data ] probe rulify [hello word 'people] = ['hello | 'word | quote 'people] toomasv 11:12My version: rulify: func [rule [block!]][ rule: copy/deep rule forall rule [ case [ all [ not all [word? :rule/1 #"!" = last to-string rule/1] any [any-word? :rule/1 integer? :rule/1] ][ insert rule 'quote rule: next rule ] block? :rule/1 [ rule/1: rulify rule/1 ] ] if not last? rule [ insert next rule '| rule: next rule ] ] rule ] one-of?: function [ allowed [block!] "To be rulified" value [any-type!] /plain ][ if not block? :value [value: append copy [] :value] if not plain [allowed: rulify allowed] parse/case value [some allowed] ] >> rulify [a :b c: 'd 1 1.5 #hi [deeper] "string" ] == [quote a | quote :b | quote c: | quote 'd | quote 1 | 1.5 | #hi | [quote deeper] | "string"] >> one-of? [a :b c: 'd 1 1.5 #hi [deeper] "string" ] [deeper 1 a] == true >> one-of? [a :b c: 'd 1 1.5 #hi [deeper] "string" ] [deeper 1 a :c] == false But there are some parse's quirks >> one-of? ['d] 'd == true >> one-of? ['d] quote 'd == true >> one-of?/plain [quote 'd] 'd == true GiuseppeChillemi 11:36This solution is an effective check if value belongs to a group of values or to a datatype. There could be some of interesting variations for the allowed arg: * Checking for ranges * Checking using a bound block * Checking using an all/any block * Checking using more convoluted parse rules as validation arguments * Checking passing a check function I will play with them 11:38And give to this extended version the name valid? 11:49@rebolek I have understood why one-of? arg [word! string!] seems better this way on the first instance: it is because we are used to this order of things in function specs dialect. I have encountered this effect other times in my journey into the Redbol world. 11:51The sequence of visual symbols triggers the knowledge of the function specs dialect in our neurons and we are driven by that. gurzgri 16:02@GiuseppeChillemi > why was found? created? found? returns a value of type logic!, I remember seeing it used in patterns like pick [green red] found? find options value. The irony in this is, that in R2 it was implemented as not none? :value — makes me feel sorry for @toomasv ;) Oldes 16:13I think that some prehistoric Rebol version required logic! in conditionals, so there was need for the found? 16:16https://www.curecode.org/rebol3/ticket.rsp?id=2053 gurzgri 16:31:+1: Nice discussion between BrianH and Ladislav back then. GiuseppeChillemi 16:33Nice to see we still have trace of past discussions and decisions. toomasv 16:59@gurzgri NP, I just have to put on stronger R2-glasses. greggirwin 18:51On arg order, I have the same recollection as @rebolek, and we should address these notes in a new style guide, to go with new docs. My mental note, based on what I think Carl may have said (so many caveats), is "Order args by importance." So the most important args go first. Another consideration is chaining. It's common to return a set of data, so making the target data the first arg aids chaining. toomasv 19:35First material on which you work, then tool with which you work, and then all the tilu-lilu. First the stone, then the chisel. rebolek 20:02@toomasv great explanation! toomasv 20:29:) Saturday 23th July, 2022 GiuseppeChillemi 16:31With these rules I have only a problem. When you have a block/ctx of values that describe the next block, then they should come first. Think about: button "click me" 30x20 [ actor code here ] you understand where [code here] actor applies, because descriptive elements are before. If you write a section generator like: my-section: reduce [type text size [ code code code ] ] make context! [type: 'button text: "click me" size: 30x20] in this case, having a xbind which accept inverted arguments, it is more readable: my-section: reduce xbind make context! [type: 'button text: "click me" size: 30x20] [type text size [ .... .... ] ] rebolek 19:00R3 has with which has reversed order of args than bind GiuseppeChillemi 20:07Yes, I have my own with too. Such kind of phrases needs a premise with the details to be read correctly, or you won't understand what is appending. Otherwise you need to go back and forth, which also causes confusion. Monday 25th July, 2022 fergus4 18:01Trying to load XML (using Chris' altXML). Red really bogs down on large files. Rebol has no issue on same files using rebol version of altXML. What is the issue and can I do something on my end? hiiamboris 18:22just how huge your file is? rebolek 18:23@fergus4 there's built-in XML codec, maybe you can try this. One possible improvement is turning the XML codec into a scheme. Recently I made an experimental CSV scheme that can load much bigger files than CSV codec. XML scheme would be a bit more complicated but doable. hiiamboris 18:26it's not builtin ;) cosacam1 19:08@fergus4 Some time ago I told the forum that load was too slow compared to read in Red, not so in Rebol. A little later I asked something to the forum for some other reason, the solution was to download the most recent version of Red. Well, the load delay was solved too, so update. fergus4 20:13My red build is from July 19. I too thought XML was added with json? Guess not... 20:13File is only 3 megs . I have a 27 meg file further down my list of xml files.... 20:14I only need the first page so I parsed out what I needed to load-xml on....it works for what I need... hiiamboris 20:34@fergus4 https://raw.githubusercontent.com/rebolek/red/c7205002839fefffdc3ba58e98091d780013df3d/environment/codecs/XML.red Tuesday 26th July, 2022 greggirwin 04:37Profiling I did on @rebolek's XML codec came out to ~1.5MB/s, and it handled a 24M file just fine. fergus4 15:47@hiiamboris Thanks. This works. And I like the block layout. Thanks @rebolek hiiamboris 15:54@fergus4 it supports as high as 3 formats: https://gitlab.com/rebolek/markup/-/blob/main/README.md 15:54all with their own benefits and drawbacks Thursday 28th July, 2022 ldci 14:41Gurus’ help. New test for decoding compressed gif data, but without success. #!/usr/local/bin/red Red [ ] ;--Based on Rebol3-master src/core/u-gif.c ;-- 4 colors 10x10 test image codes_str: #{02168C2D99872A1CDC33A00275EC95FAA8DE608C04914C0100} ;codes: [140 45 153 135 42 28 220 51 160 2 117 236 149 250 168 222 96 140 4 145 76 1] MAX_STACK_SIZE: 4096 ;--2 ** 12 max NULL_CODE: -1 ;--for tests color_table: [] append color_table to-binary white append color_table to-binary red append color_table to-binary blue append color_table to-binary black decodeLZW: func [ data [binary!] h [integer!] w [integer!] ][ data_size: to-integer copy/part skip data 0 1 ;-- 2 OK nBytes: to-integer copy/part skip data 1 1 ;--22 bytes OK clear_code: 1 << data_size end_of_info: clear_code + 1 available: clear_code + 2 old_code: NULL_CODE code_size: data_size + 1 code_mask: (1 << code_size) - 1 prefix: copy [] suffix: copy [] top_stack: copy [] pixel_stack: copy [] datum: bits: count: first: 0 repeat i MAX_STACK_SIZE [ append prefix 0 append suffix 0 ] code: 0 while [code < clear_code] [ ;prefix/(code + 1): 0 suffix/(code + 1): code code: code + 1 ] ;print [clear_code end_of_info available old_code code_size code_mask] data: skip data 2;--codes begin here y: 0 while [y < h][ x: 0 while [x < w][ ;--if we don't have enough bits if bits < code_size [ ;--if we run out of bytes in the packet if count = 0 [ ;--get size of next packet count: to-integer copy/part data 1 ;--if 0, end of image if (count == 0) [break] ] ;--add bits from next byte and adjust counters data: next data datum: datum + (to-integer copy/part data 1) << bits bits: bits + 8 count: count - 1 continue ] ;--isolate the code bits and adjust the temps code: datum AND code_mask datum: datum >> code_size bits: bits - code_size ;--sanity check if any [code > available code = end_of_info] [ ;print [code ": sanity check"] ;break ] ;--time to reset the tables if code = clear_code [ ;print [code ": Clear"] code_size: data_size + 1 code_mask: (1 << code_size) - 1 available: clear_code + 2 old_code: NULL_CODE continue ] ;--if we are the first code, just stack it if (old_code = NULL_CODE) [ append top_stack suffix/(code + 1) old_code: code first_code: code continue ] in_code: code if (code = available)[ ;print [code ": Available"] append top_stack first_code code: old_code ] while [code > clear_code][ append top_stack suffix/(code + 1) code: prefix/(code + 1) ] first_code: suffix/(code + 1) ;--add a new string to the table if (available >= MAX_STACK_SIZE) [break] append top_stack first_code prefix/(available): old_code suffix/(available + 1): first_code available: available + 1 if all [(available and code_mask = 0) (available < MAX_STACK_SIZE)][ code_size: code_size + 1 code_mask: code_mask + available ;print [code_size code_mask] ] top_stack: back top_stack old_code: in_code x: x + 1 ] y: y + 1 ];--end y ?? top_stack ;--;--we get the pixel color colors: copy #{} foreach c top_stack [ append colors color_table/(c + 1) ] colors ] rgb: decodeLZW codes_str 10 10 ;-- what we should get in top_stack [ 1 1 1 1 1 2 2 2 2 2 1 1 1 1 1 2 2 2 2 2 1 1 1 1 1 2 2 2 2 2 1 1 1 0 0 0 0 2 2 2 1 1 1 0 0 0 0 2 2 2 2 2 2 0 0 0 0 1 1 1 2 2 2 0 0 0 0 1 1 1 2 2 2 2 2 1 1 1 1 1 2 2 2 2 2 1 1 1 1 1 2 2 2 2 2 1 1 1 1 1 ] comment [ im: make image! reduce [10x10 green] im/rgb: rgb save %test.png im call/shell "open test.png" ] Friday 29th July, 2022 toomasv 10:55Hi, @ldci! Here's my solution. Not sure yet, if it is general enough, but works for this little example: Red [] data: #{02168C2D99872A1CDC33A00275EC95FAA8DE608C04914C0100} aim: [4 1 6 6 2 9 9 7 8 10 2 12 1 14 15 6 0 21 0 10 7 22 23 18 26 7 10 29 13 24 12 18 16 36 12 5] indices: copy [] codes: copy [] to-code: func [c [string!]][ to integer! debase/base pad/left/with copy c 8 #"0" 2 ] decode: func [data [binary!] /local prev code byte][ N: data/1 CC: 2 ** N EOI: CC + 1 available: CC + 2 sz: N + 1 z: 0 stream: copy "" clear indices clear codes data: next data while [all [0 < count: data/1 data: next data]][ parse data [collect into stream count [ copy byte skip keep (enbase/base byte 2) (stream: head stream) data: ]] ] collect/into [ while [not empty? c: take/last/part stream sz][ keep code: to-code c case [ code = CC [ sz: N + 1 code-table: make map! copy/deep [0 [0] 1 [1] 2 [2] 3 [3] 4 -1 5 -2] continue ] code = EOI [ new-line/skip indices true 10 probe indices probe codes = aim return codes ] ] either selected: select code-table code [ append indices selected unless prev [prev: code continue] k: first selected available: length? code-table put code-table available new: append copy select code-table prev k if 2 ** sz - 1 = available [sz: sz + 1] ][ k: first selected: select code-table prev append indices new: append copy selected k put code-table code new ] prev: code ] ] codes ] decode data Output: >> do %giftest.red [ 1 1 1 1 1 2 2 2 2 2 1 1 1 1 1 2 2 2 2 2 1 1 1 1 1 2 2 2 2 2 1 1 1 0 0 0 0 2 2 2 1 1 1 0 0 0 0 2 2 2 2 2 2 0 0 0 0 1 1 1 2 2 2 0 0 0 0 1 1 1 2 2 2 2 2 1 1 1 1 1 2 2 2 2 2 1 1 1 1 1 2 2 2 2 2 1 1 1 1 1 ] true == [4 1 6 6 2 9 9 7 8 10 2 12 1 14 15 6 0 21 0 10 7 22 23 18 26 7 10 29 13 24 12 18 16 36 12 5] ` ldci 14:06@toomasv Thanks for your solution :) toomasv 14:16:+1: Saturday 30th July, 2022 koba-yu 10:50Just Sharing for other VS Code Extension fun. I have tried new Red binary. As long as I tested, to enable VS Code extension, I need to copy both console binary and GUI console binary to C:\ProgramData\Red\ and rename them, red-29jul22-95f4da55a.exe to console-29jul22-95f4da55a.exe and gui-console-29jul22-95f4da55a.exe to gui-console-29jul22-95f4da55a.exe. Then I set VS Code settings "Red Path" to C:/ProgramData/Red/gui-console-29jul22-95f4da55a.exe and Intelligence works. It seems the sourece code around [here](https://github.com/red/VScode-extension/blob/master/src/RedConfiguration.ts#L29) requires the binary's prefix name as above. hiiamboris 11:01Thanks for pointing that out. Feel free to submit a PR there, I guess ;) koba-yu 12:09@hiiamboris i have no experience to write codes of extension and TypeScript but i’ll give myself a try tomorrow, thank you😊 hiiamboris 12:43You're capable, I'm sure you'll manage ;) toomasv 14:41@ldci Working [gif-parser](https://github.com/toomasv/LZW/blob/main/GIF.red) (static only). See example in the end. ldci 15:27@toomasv *** Internal Error: stack overflow *** Where: code *** Near : none code-size: 0 color-table: copy [] local-color-table: *** Stack: do-file toomasv 15:32@ldci What gif did you try to decode? 15:41[![image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/Iopx/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/Iopx/image.png) ldci 15:55@toomasv It’s OK just an error in file name. I’m tired :) 16:00[![image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/kZHN/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/kZHN/image.png) 16:00Nice Toomas :) dockimbel 16:05@toomasv I'm very interested in integrating in Red runtime library a GIF-anim decoder if you have one. toomasv 16:07@dockimbel I don't have it yet, but I'm working on it. 16:08@ldci Nice! :+1: 16:09Tried DiaGrammar on it: [![gif-parse.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/X2Jz/thumb/gif-parse.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/X2Jz/gif-parse.png) ldci 16:25@toomasv Very elegant :) toomasv 16:28@ldci Thanks! 16:28[![image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/iYXn/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/iYXn/image.png) greggirwin 16:37Great work as always @toomasv. toomasv 16:43Thanks! ldci 17:12@toomasv dancing.gif doesn’t work for me. *** Script Error: invalid argument: none *** Where: set-path *** Near : colors system/words/view [image img] *** Stack: view toomasv 17:16Works like charm here on W10. Interesting, what are our differences? Platform? ldci 17:20@toomasv W11 with Parallels desktop on Mac ARM 64-bits:) 17:21I’ll test on Mac 32-bit toomasv 17:23Are these same for you? >> length? gif/codes == 29904 >> length? gif/indices == 57840 >> length? gif/colors == 173520 ldci 17:31@toomasv Same problem with Mac 32-bit greggirwin 19:32Endian issue perhaps? qtxie 23:55> Just Sharing for other VS Code Extension fun. > We need to update the VS Code Extentsion for it. Sunday 31st July, 2022 toomasv 13:35First try on gif animation: do %GIF.red GIF/decode %sample_2_animation.gif im1: make image! reduce [gif/images/1/size gif/images/1/colors] im2: make image! reduce [gif/images/2/size gif/images/2/colors] im3: make image! reduce [gif/images/3/size gif/images/3/colors] view compose/deep [ panel [ at (gif/images/1/pos) image im1 at (gif/images/2/pos) image im2 hidden at (gif/images/3/pos) image im3 hidden ] rate (100 / gif/images/1/delay) on-time [ case [ tick % 3 = 0 [face/pane/2/visible?: face/pane/3/visible?: false] tick % 3 = 1 [face/pane/2/visible?: true] tick % 3 = 2 [face/pane/3/visible?: true] ] tick: tick + 1 ] do [tick: 0] ] [![traffic-light](https://toomasv.red/images/Animations/traffic-light.gif)](https://toomasv.red/images/Animations/traffic-light.gif) ldci 14:07@toomasv Great :) toomasv 14:45Thanks, @ldci! ldci 16:17@toomasv Red [ ] do %GIF.red GIF/decode %1.gif im1: make image! reduce [gif/images/1/size gif/images/1/colors] im2: make image! reduce [gif/images/2/size gif/images/2/colors] im3: make image! reduce [gif/images/3/size gif/images/3/colors] im4: make image! reduce [gif/images/4/size gif/images/4/colors] view compose/deep [ title "Toomas's Animated Gif" bb: base im1 rate (5 / gif/images/1/delay) on-time [ case [ tick % 4 = 0 [bb/image: im1] tick % 4 = 1 [bb/image: im2] tick % 4 = 2 [bb/image: im3] tick % 4 = 3 [bb/image: im4] ] tick: tick + 1 ] do [tick: 0] ] 16:171.gif toomasv 16:19:) ldci 16:21[![image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/5s7q/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/5s7q/image.png) 16:23@toomasv. For large gif file (here 522x547 pixels by image) decoding is very long. toomasv 16:25Yeah, no optimisations so far. ldci 16:31We can also use external programs Convert -coalesce 1.gif frame_%d.png toomasv 16:42[![spiral](https://toomasv.red/images/Animations/spiral1.gif)](https://toomasv.red/images/Animations/spiral1.gif) 16:59This was decoded several minutes [![giphy](https://toomasv.red/images/Animations/giphy.gif)](https://toomasv.red/images/Animations/giphy.gif) pekr 17:10What is gif/decode? Doesn't it work like a codec? toomasv 18:01It is not built as codec. Or rather, I've never looked how a codec is built. Just a research of gif's belly. And exercise in LZW decompression. greggirwin 18:08@dockimbel if 0.7 is freezing after IO is merged, and we won't have View for some time on the new roadmap, where does GIF support come in, and for what use cases? qtxie 22:47> What is gif/decode? Doesn't it work like a codec? Why you want it to be a codec? Is it include it in your program and use gif/decode not enough? Monday 1st August, 2022 pekr 04:45We could state the same about bitmap, jpeg, png and oter formats too then .... cosacam1 09:10Hi. I want a field to accept only digits. I've tried with on-key event and parse to reject any non digit char but with no avail. Something like f: field on-key [unless parse key [digit][key: none]] having previously defined digit: charset "0123456789"I've read Helpin Red and Learn Red Fundamentals but the examples there are not suitable to my needs. Red by example refers to a url which don't show. Thanks 09:21@galen ivanov Can you read spanish? The document I'm writing comparing Python to Red is in spanish. I would like to send you what I have done so far so you give me your opinion and use whatever you need to improve yours, which by the way is very good. hiiamboris 10:19 >> digit: charset "0123456789^H" >> system/view/capturing?: on >> view [field focus on-detect [all [char? event/key not find digit event/key 'stop]]] @cosacam1 GalenIvanov 12:05@cosacam1 No, unfortunately I don't speak (or read) Spanish. Btw I would love to be able to read Jorge Luis Borges in original. gurzgri 14:30 Red collect [parse [] [(keep [value]) (keep/only [block])]] ;== [value [block]] parse [] [collect [keep pick ([value]) keep ([block])]] ;== [[value] [block]] Trying to overcome the collect [ parse [ (keep ...) habit and instead use the outperforming parse [ collect [ keep (...) form more often. The above [difference when keeping blocks](https://github.com/red/docs/blob/master/en/parse.adoc#collect) keeps getting in my way though. Is there really no way to collect the values of a block instead of keeping the block as a value with parse? hiiamboris 16:05Open an REP? It was decided that keep and keep pick act the same: https://github.com/red/red/issues/4198 and so far nobody challenged it with a real world use case 16:06I'm just using append when I need to mix blocks in. Not a fan of collect. 16:08For parse, IMO collect after should not even exist, and collect into should always append. Oldes 17:37@gurzgri I was [asking there](https://gitter.im/red/parse?at=62db0bb6ef5ee44882d4009f), why the keep pick does not work with expressions. Tuesday 2nd August, 2022 cosacam1 09:44@hiiamboris your code for capturring only digits works, however it does not work when I use the numeric key pad, only with the numbers above the letters on my laptop keyboard. I guess it is because the numeric keypad keys have different scan codes. I haven't tested it with a regular desktop keyboard. Thanks anyway hiiamboris 09:49Use NumLock ;) 09:49Else how are you planning to edit it. cosacam1 17:46Numlock is activated. Tested again, it works with number keys above letters but not with keys in numpad. greggirwin 18:02 probe-event: function [e] [ foreach field system/catalog/accessors/event! [ if not find [face window] field [print rejoin [field ": " mold e/:field]] ] print '____ ] view [ base red focus ;on-key [probe-event event] on-key-up [probe-event event] ] 18:06With num-lock off I get special keys [end, down, page-down], but with it on I get lowercase chars [a b c], where the alpha keys return the uppercase variants, and the numbers above the keyboard return the numeric chars. hiiamboris 18:19well, confirmed 18:19funny bug greggirwin 18:23Worth reporting if not already there. hiiamboris 18:24on it greggirwin 18:32Thanks. hiiamboris 18:43https://github.com/red/red/issues/5170 thanks @cosacam1 for finding this Wednesday 3th August, 2022 cosacam1 01:28So it is a bug. Ok, I solved it with what hiiamboris and gregg gave mi. Here it is ` 01:29accept-digits-only: func [event] [ all [ not all [ 95 < event/picked event/picked < 106 ] char? event/key not find digit event/key 'stop ] ] ` 01:31Oops again bad formatting. I'm typing/pasting directly on my phone. 01:32Here is the explanation 01:39This function is for fields where user may only type digits. The number keys in numeric keypad throw an event whose /key has a value different from what the key says. For example, when typing 0 in numpad, its /key value is #"" not #"0". /picked has the key's scan code; for 0 to 9 keys /picked varies from 96 to 105. If the key pressed is a numpad key, the all [95 < ...] statement returns true but not makes it false so we exit the external all~ block because it's not needed to analize anything else and in order to not execute the 'stop below. In char? event/key: /key could be char! or word! (for example in keys like tab, enter, capslock) We'll only accept char! so find in the next expression won't throw an error In not find... we check that the pressed key is a digit, not a letter or symbol. If the key is a digit (from above the letters) find returns true but not makes it false so we exit the external all block. But, if the key is a letter or a symbol (+ ; ~) find returns none and not` makes it true so we go forward to the 'stop. The 'stop statement makes the event not to propagate so the unwanted character is not added to field/text. 01:40Please correct me if I am wrong. Thanks 01:48Sorry I should put different example instead of 0 whose /key value is the same char used here to format the texts. I should say When typing in numpad the 1 its /key value is #"a" not #"1" 05:34Hi again. AFAIK there is no way to make a function with optional parameters in Red. Something like volume: func [width: 1 height: 1 depth: 1] that could be called like unit-vol: volume or print volume 3 2 I guess one reason is there's no commas between args. Am I wrong? toomasv 06:36 >> context [width: 1 height: 1 depth: 1 set 'volume func [/width w /height h /depth d][print [any [w self/width] any [h self/height] any [d self/depth]]]] == make object! [ width: 1 height: 1 depth: 1 ] >> volume 1 1 1 >> volume/width 3 3 1 1 >> volume/width/height 3 2 3 2 1 >> volume/width/height/depth 3 2 5 3 2 5 GalenIvanov 06:41Nice, @toomasv ! @codemosaic_twitter Here's my try: 06:41 unit-vol: func [args [block!]][ dim: context [width: 1 height: 1 depth: 1] make dim args ] probe unit-vol [] probe unit-vol [width: 2] probe unit-vol [height: 3 depth: 2 width: 4] 06:41 make object! [ width: 1 height: 1 depth: 1 ] make object! [ width: 2 height: 1 depth: 1 ] make object! [ width: 4 height: 3 depth: 2 ] >> toomasv 06:42@GalenIvanov :+1: Or >> volume: func [/width w /height h /depth d][width: any [w 1] height: any [h 1] depth: any [d 1] print [width height depth]] == func [/width w /height h /depth d][width: any [w 1] height: any [h 1] depth: any [d 1] print [width height depth]] >> volume 1 1 1 >> volume/width 5 5 1 1 >> volume/width/height 5 3 5 3 1 >> volume/width/height/depth 5 3 2 5 3 2 GalenIvanov 06:58:+1: hiiamboris 07:08 volume: function ['w [any-type!] 'h [any-type!] 'd [any-type!]] [ foreach a [w h d] [unless number? get/any a [set a 1]] w * h * d ] 07:09 >> volume == 1 >> volume 2 == 2 >> volume 2 3 == 6 >> volume 2 3 4 == 24 07:10good thing for shooting one's feet off ;) (and getting better understanding of Red) toomasv 08:23@hiiamboris Nice :) Then you must not forget parens >> a: volume 2 b: 3 == 6 >> b *** Script Error: b has no value >> a: (volume 2) b: 3 == 3 >> a == 2 cosacam1 08:52Wow! So many answers. Thanks. Meanwhile I made my version volume: func [args [block!] /local w h d][unless attemp [w: args/1][w: 1] unless attemp [h: args/2][h: 1] unless attemp [d: args/3][d: 1] w * h * d] 08:56Use: print [volume [] volume [3] volume [3 2] volume [3 2 4] ] 09:00I first thought to use refinements but I searched for a shorter solution 09:07@GalenIvanov may you explain how make dim args works? hiiamboris 09:10block is the idiomatic way, so congrats ;) cosacam1 09:11@toomasv those any [w 1]... are really short!!! 09:22@hiiamboris didn't know of get/any. I've just checked it out in help. Oh, it was there since Rebol too! I need to study more. I wish my days last 72 hours 09:23You guys help me so much. Thanks a lot 09:26By the way, any comment or sugestion to accept-digits-only above? hiiamboris 09:29If it works, it's good enough ;) cosacam1 09:39Ok 10:01I'm trying get/any in GUI but it gives me error. What I'm doing `>>'a 10:06Again. I type 'a just to create the word but without assigning any value. Then I try to print get/any a but it throws error a has no value. I thought it would not give any error GalenIvanov 10:33@cosacam1 dim: context [width: 1 height: 1 depth: 1] creates an object! dim with three fields (context spec is short for make object! spec - you can try source context in the console). So this dim object contains the default values for the dimensions. With make dim args I create a new object using dim as a prototype and args as a specification, that is - the fields of the new object are set using the specification when present, and when not - the default values as in dim will remain. You can see more here: [Object! datatype / Creation](https://github.com/red/docs/blob/master/en/datatypes/object.adoc#creation) riprwwa 10:35get takes a word as its first argument. Let's say I have not defined a word a get 'a *** Script Error: a has no value get/any 'a So get will not find the word a either way, because I have not defined it. It's just that with the /any refinement there is no error, it returns UNSET. My question is why does the following not work - I believe I'm using a get-word! instead of a lit-word! and get is supposed to take any-word! get/any :a hiiamboris 10:38@riprwwa use probe: get/any probe :a and get/any probe 'a to figure this out riprwwa 10:50thank you, so it tries to see if a is defined and fails get/any quote :a would prevent it from doing that cosacam1 11:12@GalenIvanov yes I had studied about objects but I thought make should always be followed by a datatype like in make block! Now I see it may be followed by a prototype. Thanks GalenIvanov 11:15:+1: cosacam1 11:22@riprwwa @hiiamboris thanks. I notice Hiiamboris volume function has w h d quoted so at foreach a [w h d] it happens that a gets qoted automatically. hiiamboris 11:24@riprwwa yes, basically the argument gets evaluated and get receives the result 11:25@cosacam1 true, without quotation such variable arity is forbidden cosacam1 12:18So when I said "there is no way to make a function with opcional parameters in Red... Am I wrong?" Yeap, I was wrong. It seems to me that everything is possible in Red. Thursday 4th August, 2022 GiuseppeChillemi 15:45Is there a way to encrypt the Red source to obfuscate it at compilation? 15:45I mean: my program source running in red. hiiamboris 15:54If your program is compiled, there's no source code in it. GiuseppeChillemi 15:58My code is interpreted, I can't compile it as some partes are dynamically built. hiiamboris 16:26Is it so valuable that someone will bother reverse engineering it? ;) 16:28There's still no source code, but a Redbin payload. Which one of course could theoretically extract, by unpacking it and figuring out the exe format from compiler's source code. 16:28Or that's how I understand it anyway. 16:37Try https://www.google.com/search?q=exe+obfuscator 16:37But it won't be bulletproof since your program can unpack itself. GiuseppeChillemi 16:58@hiiamboris Yes, it is starting to be valuable. It is a food tracking app which maintains an aggregated bill of material. 16:58I would like to give some test code around 16:58When ready hiiamboris 18:13I have a content-type facet which can take only 3 values (as word!): planar, horizontal and vertical. What would be a more specific word than -type? ne1uno 18:22-axis gurzgri 18:25orientation [planar | horizontal | vertical]? 18:26Or content-flow maybe. hiiamboris 18:40content-flow seems fit, thanks 18:41considered orientation but it's too long with content- ;) ne1uno 18:42-fit hiiamboris 18:43no, not for this case 18:44doesn't fit, sticks out (this parameters controls scrollbars logic) Tuesday 9th August, 2022 bubnenkoff 09:30a: [] how to check if path a/b/c is exists? hiiamboris 10:53you have a talent for finding weak points of Redbol design ;) 10:54for this concrete example, try get/any if it doesn't error out, then find on a/b block for c item 10:54I don't think there's a general solution though 10:55besides, there are cases like: >> a: [b: %file] == [b: %file] >> a/b/c == %file/c >> a: compose [b: (func [/c]['result])] == [b: func [/c]['result]] >> a/b/c == result gltewalt:matrix.org 14:02Path not existing returns none 14:04As a refinement not existing, returns an error 14:06I think all cases, no path, no refinement, no file, should error greggirwin 17:17Pretty sure @GiuseppeChillemi (or maybe it was someone else) has gone deep down this rabbit hole. This could be a good one for the rethink group here, as there's no single or perfect way to attack this problem. No universal solution. hiiamboris 17:32https://github.com/red/REP/issues/121 greggirwin 17:32Thanks! hiiamboris 17:44Brian has attacked this with design, trying to invent a general solution that would take a path and return a block of items to visit (that would also convert get-words and parens into a final item). And then any other part should magically work on top of that. Not sure he has finished it though, and don't recall where I saw that :/ GiuseppeChillemi 21:44@gltewalt:matrix.org I have long debated with myself about the current Red design, still with no definitive answer. Having been on Rebol, I have seen that Carl has creted 2 different sets of functions: paths and ordinals (first, second..) generate an error when you use a non-existing path or you pick out of range in the series; while pick and select returns a none. On Red, you need additional tail? and length? to understand if your ordinal picker is out of range. Instead, using paths you could use the method suggested by Doc in the ticket: error? try [my/path] This method actually has a problem: A path on object! always returns an error, independently from the non-existing path segment A path on block! returns an error only if the first word does not exist, or an intermediate one. So, you **CAN'T USE** error? try [my/path] to check for paths when it is just the last word which does not exists, because it returns none and does not trigger any error. In other words: x: [a [b c d]] probe error? try [x/dd/z] = true x: [a [b c d]] probe error? try [x/a/z] = false Actually, when you have a block with multiple nested blocks, it seems there is no way to know if the last element is a non-existing one. (But you can make your own path check function). Anyone is free to anyone to intervene if a method exists. 21:52We have too many path management combinations to deal with to access data. Carl has made paths to generate an error, and it works consistently across any data. With this observation, I think exists? takes point as a good solution to implement if we want to keep paths returning none, otherwise, let it fire an error! hiiamboris 21:55> Carl has made paths to generate an error, and it works consistently across any data >> b: [] == [] >> b/1 == none dockimbel 22:04> A path on block! returns an error only if the first word does not exist, or an intermediate one. That sentence is a nonsense. If the "first word" is not set, it cannot be "a path on block!". 22:06> Actually, when you have a block with multiple nested blocks, it seems there is no way to know if the last element is a non-existing one. x: [a [b c d]] find x/a 'z == none find x/a 'b == [b c d] GiuseppeChillemi 22:06On Rebol, picking using a number has the same working of pick': it returns none` if you are in a wrong position. He has made a parallel between path with a number and pick using number. 22:07@dockimbel I did my best with my english and technical knowledge. 22:15Thank you for the solution, I was not seeing it. But they are really too many combinations to manage for catching problems on path access, and all require different code. So, if you have a function that works with multiple datatypes, the error checking code will be long. Wednesday 10th August, 2022 GiuseppeChillemi 11:35I want to write a Red block which goes to the next line on write but I was not able to make it: a: "hello" b: "world" ;reduce write %myfile.txt reduce [[o: 33] a b lf cr] =[[o: 33] "hello" "world" #"^/" #"^M"] ;rejoin write %myfile.txt rejoin [[o: 33] a b lf cr] =[o: 33 "hello" "world" #"^/" #"^M"] ;rejoin + to-string write %myfile.txt rejoin [to-string [o: 33] a b lf cr] =o33helloworld My need is to save a Red block and then later edit with proper formatting on multiple lines and not all in one line hiiamboris 11:49write molds it's value (mold it yourself, then add a newline) 11:51or write/lines reduce [reduce [stuff]] 11:51randomly applying every function you can recall doesn't usually work ;) GiuseppeChillemi 12:20I am trying every combination to understand what molds and how everything works. The output of the console also confuses me as if you mold and probe, it seems you mold twice. dockimbel 12:21 >> body-of :probe == [ print mold :value :value ] GiuseppeChillemi 12:22Thanks 12:38@dockimbel I want to signal something happened doing some tests after your suggestion: >> body-of :write == 62 >> type? :write == action! I am currently investigating on it. I get this result only after a running long script which ends with an error on write/string (which is a Rebol refinement run there by mistake) , while it does not happen on a pristine console. 12:38What could be? dockimbel 12:41> while it does not happen on a pristine console. C:\Dev\Red>console --== Red 0.6.4 ==-- Type HELP for starting information. >> body-of :write == 62 >> type? :write == action! GiuseppeChillemi 12:52I was currently on a subdir with an older Red version, my mistake. >> about Red 0.6.4 for Windows built 9-Aug-2020/23:49:48+02:00 commit #ab1a8eb 12:54However, I have solved the problem, but I admit it was difficult because of the high number of combinations and unknown (to me) workings: write %myfile.txt rejoin [mold reduce [[o: 33] a b] lf mold reduce [[o: 44] a b] lf] [[o: 33] "hello" "world"] [[o: 44] "hello" "world"] gurzgri 15:05As Boris already suggested: write/lines %test.txt reduce [reduce [[o: 33] a b] reduce [[o: 44] a b]] [[o: 33] "hello" "world"] [[o: 44] "hello" "world"] will start each block on a new line. This seems to be so much easier then the rejoin mold reduce value lf. 15:12 Red write %test.txt mold/only new-line/all reduce [reduce [[o: 33] a b] reduce [[o: 44] a b]] on GiuseppeChillemi 16:55@gurzgri I havn't understood the mechanism used by write/lines to add a new line.. This is the reason why I have skipped his solution hiiamboris 16:58Try reading the docstring of write. GiuseppeChillemi 17:01Yes, I knew that /lines would add a newline at each string in a block. Didn't know it worked for blocks inside blocks too. 17:04Always something new to learn. luce80 17:08Is there a way to know if my script was started by another script or directly ? ne1uno 17:13if find system/options/script "myscript.red" [print "hi"] 17:14not bulletproof maybe and hardwires name luce80 17:50@ne1uno thanks. Using the same "trick" if "my title" = select select load system/options/script 'Red 'title [print "hi"] a bit convoluted and slow but less hardwired ne1uno 17:58for anyone else wondering why do you want this? I use it to run inline tests on a library script that won't run when included from another. something like python if __name__ == '__main__': luce80 18:05Exactly the same case for me. I wish system/script will be "filled in" and also load/header and also a complete script-module system will be available sooner or later. greggirwin 18:07I've just made a note for this use case. Thursday 11st August, 2022 cosacam1 20:03Hi. Load-csv/with load %somefile.csv gives me invalid UTF-8 encoding.... However, I rename file to somefile.txt then load-csv "works" hiiamboris 20:05you mean read %somefile.csv? cosacam1 20:11Both read and load give same error hiiamboris 20:11check permissions maybe 20:12file system bug possible too cosacam1 20:21I guess the reason is there are extended ascii chars (beyond 127) . I just edited the file with notepad, changed AÑO by ANO then run again and if gives same error but with another hex code possibly because another wrong char. I need to translate them all. Thanks anyway. 20:21And 20:22... is there any library for read/load xlsx files? 20:47Confirmed. Translated all to utf-8 with Notepad++ and works using read. hiiamboris 21:27> ... is there any library for read/load xlsx files? IIRC there was some VB integration demo of old GiuseppeChillemi 22:11@cosacam1 Rebolek has created a codepage translator. You find it [here](https://gitlab.com/rebolek/castr/-/tree/master/). 22:15Download the repository , include codepage.red and use read-cp in and as follow: myfile: read/binary %filename.red myfile: read-cp myfile 'codepage-here myfile: load-csv myfile cosacam1 23:01Ok thanks both. I will use it asap. I am in the middle of a black out right now Friday 12nd August, 2022 GiuseppeChillemi 13:19I need advice from you. I have this web page with product cost: https://agerborsamerci.it/listino/web.htm Which is the best approach to get each column element and store it as a table? 13:24I am confused because I have understood the developers have created some tools to parse Web Pages/XML (whose structure and working I know partially) and I really don't know where to start and what instrument to use. gurzgri 15:19> the developers have created some tools Which developers? The ones of [agerborsamerci.it](agerborsamerci.it)? Then your best bet would be go ask them for some XML with a schema you can rely on instead of scraping web pages. A very quick and dirty solution tailored only to that very page might be (it's only a start ...): context [ do %castr/codepage.red digit: charset "1234567890" break-lines: func [block] [new-line/all block on] table-rule: ["<table" thru ">" copy table any [table-rule | not "</table>" skip] "</table>" keep (table)] tables-of: func [page] [parse page [collect any [to "<table" table-rule]]] rows-of: func [table] [parse table [collect any [thru "<tr" thru ">" keep to "</tr>"]]] cells-of: func [row] [parse row [collect any [thru "<td" thru ">" keep to "</td>"]]] tidy: function [cell] [ parse cell [ any [ change [" " | "^/"] " " | change "<" "<" | change ">" ">" | remove ["<" opt "/" [["font" | "a"] ahead [" " | ">"]] thru ">"] | skip ] ] parse cell [any [change some " " " " | skip]] trim cell if equal? cell "0,00" [clear cell] any [ all [ parse cell [opt "-" digit any [opt "." some digit] opt ["," 2 digit]] not equal? $0 value: to money! load trim/with cell "." value ] unless empty? cell [cell] ] ] set 'scrape-prices function [page] [ break-lines collect [foreach table tables-of page [ keep/only break-lines collect [foreach row rows-of table [ row: collect [foreach cell cells-of row [keep tidy cell]] parse reverse row [any [remove none!]] keep/only reverse row ]] ]] ] ] probe scrape-prices read-cp read/binary https://agerborsamerci.it/listino/web.htm 'Windows-1252 ... ["FRUMENTO TENERO di produzione nazionale 2022"] [{n° 1 - speciali di forza - prot. 14% min, p.s. 79/80 kg/hl, c.e. 1%} $408.00 $413.00 $408.00 $413.00] [{n° 2 - speciali - prot. 12% min, p.s. 78/79 kg/hl, c.e. 1%} $361.00 $366.00 $364.00 $369.00 $3.00 $3.00] [{n° 3 - fino - prot. 11% min, p.s. 78 kg/hl min, c.e. 1%} $354.00 $359.00 $357.00 $362.00 $3.00 $3.00] ["n° 4 - buono mercantile - p.s. 76 kg/hl, c.e. 2%" $347.00 $352.00 $350.00 $355.00 $3.00 $3.00] .... GiuseppeChillemi 15:31@gurzgri Some tools have been created by @Rebolek as a function to pick a an XML table form a web page but I suppose here it does not apply. Also, I have imagined that there could exists a function to transform a web page in a block hierarchy with its component and then you can pick one or another section. But as I have totally no experience on this, I am here to ask gurzgri 15:47You can't just "pick an XML table from a web page" if there is none. That very page is just plain HTML. Of course there are HTML to XML converters. But these would hand you out ... XML. Which you then would have to make sense of. Converting to XML doesn't magically provide semantic structure where it's missing in the source. And that very page doesn't even use CSS classes but just inlines pretty much all styles. So you don't even have class names to make some educated guesses what some particluar piece of information is all about. GiuseppeChillemi 16:45Which tools do we have in Red to split an HTML page in its parts and store it to a block? Are there any, apart the parse approach? 16:46@gurzgri I forgot to say "Thank you" for the script. Here it is! Saturday 13th August, 2022 dsunanda 07:26@GiuseppeChillemi When I had to parse a HTML page in Red, I shelled out to Rebol and used LOAD/MARKUP. Not ideal but it got the job done. hiiamboris 07:30@rebolek must have some tools Oldes 08:38When I need to parse a html.. I use just parse. I never try to load it. loziniak 12:51Hi, I don't understand why I have to use /deep when I want to replace part of a block using alternative in *parse* pattern: >> a: [abc def ghi] == [abc def ghi] >> replace a ['def | 'xyz] [xxx] ;shouldn't this just work? == [abc def ghi] >> replace/deep a ['def | 'xyz] [xxx] == [abc xxx ghi] >> a: [abc def ghi] == [abc def ghi] >> replace a ['def] [xxx] ;this works ok! == [abc xxx ghi] gurzgri 13:27Looks like a bug to me or like a misleading help string to me at best. According to the help string /deep should only be needed to replace nested occurences of abc or ghi too as in replace/deep [abc [abc [def] ghi] def ghi] ['def | 'ghi] [xxx] but not for replacing only on top level as in replace [abc [abc [def] ghi] def ghi] ['def | 'ghi] [xxx] But from a first glance, the way replace is implemented, only with /deep it switches to parse here to do the replacing. Without /deep it loops until of all occurences that find finds have been replaced. But find doesn't find any: >> find [abc [abc [def] ghi] def ghi] ['def] ;== [def ghi] >> find [abc [abc [def] ghi] def ghi] ['def | 'ghi] ;== none Probably open a ticket. hiiamboris 15:51Replace is a known abomination, stitched together by different people for different tasks without a central design. 15:53I have an experimental redesign: [replace (read the header)](https://codeberg.org/hiiamboris/red-common/src/branch/master/new-replace.red), [mapparse](https://codeberg.org/hiiamboris/red-common/src/branch/master/mapparse.red), but unreviewed. Monday 15th August, 2022 luce80 17:07with numbers I have: >> n: 1.2 == 1.2 >> n * 2 == 2.4 >> n == 1.2 but with vector!s I have: >> v1: make vector! [1 2 3] == make vector! [1 2 3] >> v1 * 2 == make vector! [2 4 6] >> v1 == make vector! [2 4 6] Is this intended behaviour? hiiamboris 17:12https://github.com/red/red/issues/2216 luce80 17:18luckily ther is a workaround: >> v1: make vector! [1 2 3] == make vector! [1 2 3] >> v2: v1 * 2 == make vector! [2 4 6] >> v2 == make vector! [2 4 6] >> v1 == make vector! [2 4 6] >> v1: make vector! [1 2 3] == make vector! [1 2 3] >> v2: (copy v1) * 2 == make vector! [2 4 6] >> v1 == make vector! [1 2 3] >> v2 == make vector! [2 4 6] but surely it is not what one would expect to do, but maybe could be seen as a feature ;) ? 17:25Sorry, it is also already documented as a feature. hiiamboris 17:31well IMO it's a mess dockimbel 19:38> well IMO it's a mess That's what's called a "constructive" comment. 19:41@luce80 In Rebol/Red, vector! is an array! of scalar values, so it's a series by nature. In Red, we allowed the math operations on it, until we get a better alternative (like fixed-sized vectors and matrix types). As it's a series, it's costly to be used for temporary values, so we decided to use in-place modifying semantics for math ops. If we hadn't done that, people would be using them in math-intensive tasks and then complaining that their memory usage is exploding or that the GC is not doing its job (sic)...But if that is causing troubles, we can remove the math ops support, so you can enjoy writting them yourself at mezz level. ;-) hiiamboris 19:44> That's what's called a "constructive" comment. :D ¯\\\_(ツ)_/¯ 19:46Is it proven that in-place modification is significantly faster? If so, where the slowdown occurs? 19:47OK so it's GC issue again dockimbel 19:50The GC has no issue with vectors. hiiamboris 19:50Then what's slow? :) 19:52Constructively, I already wrote enough about the topic. I'll just add that no performance matter can justify such counter-intuitive math in a high level language. Make C-like operators at least. *= += etc. At least people will *see* what happens. But as I wrote already, it's a kludge and it doesn't scale (will there be e.g. sin=?). dockimbel 19:56> Then what's slow? :) You are reading me wrongly. I've never mentioned speed, but memory pressure. hiiamboris 19:57But memory pressure is only a thing for us because GC is lazy :) Otherwise, why would anyone care? dockimbel 19:59> such counter-intuitive math Maths does not define how arithmetic works between series and scalars, we do. It's part of the language semantics, not math rules. hiiamboris 20:01Such rules require a special case *in every* function that works on general arguments. 20:02Besides, math doesn't have *variables*, so what should it define? ;) dockimbel 20:02You are again over-generalizing your own use-cases... hiiamboris 20:03Math defines e.g. commutativity and transitivity. And probably a couple more rules that are totally broken by this. 20:03@meijeru will support me ;) dockimbel 20:04Anyway, as I said above: "we allowed the math operations on it, until we get a better alternative (like fixed-sized vectors and matrix types)." So this means that it's a temporary feature. I think we should rename that datatype, as we hesitated between array! and vector! in the beginning. 20:05Commutativity and transitivity do not apply on operands of different type/nature. 20:05apple + orange = ? hiiamboris 20:06Type promotion? 20:06v + 1 <=> v + vector-of-ones 20:06Anyway, if it's temporary I'll stop criticizing it :) dockimbel 20:07Implicit type promotion from scalar to series? That's an horror! hiiamboris 20:07Well, for modelling behavior, not for implementing it ;) 20:09I think, eventually, once GC is improved, it will just reuse recently created vector buffers, and this case will just resolve itself. dockimbel 20:09A series is not a number! So there's no possible "promotion", as they differ in nature! apple + orange = ? Let's promote the "orange" to "apple" to solve that, right? hiiamboris 20:09Not a correct analogy ;) dockimbel 20:10I think we should remove those math ops and rename the type to array!, so that people will stop misusing it. 20:10> Not a correct analogy ;) Prove that it's not correct, otherwise "it's just your opinion". hiiamboris 20:12Ahh. Lazy. Let it be "my opinion" :) dockimbel 20:13:+1: 20:17In some "high level languages" (like in C# IIRC), the math operators can be overloaded, but you can provide 2 implementations, depending on the operands order, as commutativity is not a given when the operands are of different natures, it needs to be defined case by case. hiiamboris 20:18Well, let's not follow their suit... 20:18@dockimbel noticed [this comment](https://github.com/red/red/commit/19ebddde32e20ade110f54e55b3c599062fd02d6#commitcomment-81213457) btw? dockimbel 20:18Surely, the C# designers, like me, do not know about maths. ;-) hiiamboris 20:20Since it's a megacorp, I doubt there's any real design thought there. Just typical bureaucratic madness. meijeru 21:02On the vector arithmetic question, since I have been appealed to by @hiiamboris, let me confirm that I do not like in-place modification as I have said in a few issues. dockimbel 21:08> The term vector is also used, in some contexts, for tuples, which are finite sequences of numbers of a fixed length. ([source](https://en.wikipedia.org/wiki/Vector_(mathematics_and_physics)) So our vector! datatype is misnamed as it does not fit that definition. We'll need to rename it and remove those built-in scalar operations. melcepstrum 21:08> Make C-like operators at least. *= += etc. That's a good idea IMO hiiamboris 21:16What's the difference between a vector and a tuple? dockimbel 21:18Which "vector"? A math vector or our vector! type? hiiamboris 21:19Math vector. 21:19Perhaps, that you can't add dimensions to it, but to tuple you can. dockimbel 21:21They seems equivalent. Both are fixed-size. 21:24> Since it's a megacorp, I doubt there's any real design thought there. Just typical bureaucratic madness. "[Anders Hejlsberg](https://en.wikipedia.org/wiki/Anders_Hejlsberg) is a Danish software engineer who co-designed several programming languages and development tools. He was the original author of Turbo Pascal and the chief architect of Delphi. He currently works for Microsoft as the lead architect of C# and core developer on TypeScript." "Since 2000, he has been the lead architect of the team developing the C# language. In 2012 Hejlsberg announced a new Microsoft project, TypeScript, a superset of JavaScript." He surely doesn't seem like someone who knows what he's doing, right?. ;-) melcepstrum 21:38if you're going to remove those built-in scalar operations then also remove vector by vector multiplication etc. hiiamboris 21:44> He surely doesn't seem like someone who knows what he's doing, right?. ;-) Judging by the designs, no ;) 21:45Everyone can write a fancy biography. But a deeply designed language - only a few. Tuesday 16th August, 2022 cosacam1 08:07Hi everybody. Take a look at this code date4calendar: none lyoCalendar: layout [ cld: calendar with [date: date4calendar] return button "Aceptar" [date4calendar: cld/date] button "Cerrar" [date4calendar: none] ] view [button "get date" [view lyoCalendar print date4calendar]] 08:11When I run it and select a date and press Aceptar (Ok) it gives me this Script Error: cannot access date in path cld/date. My question: how to make calendar show a given date and how to get the date from it, the one the user selected? pekr 08:13Ah, those scandinavians :-) Our company was bought by the scandinavian group. First, there was a huge initiative to use Java Kotlin, stuff like Kafka microservices, but noone apart from the core team could undestand those things. So they've left. Nowadays, Python is promoted by the different branch of the IT group. I hope, in few years, it might be finally Red, or some kind of Red to Python ecosystem / browser integration :-) Btw - Delphi is still alive and popular amongst some devs, it has its open source Lazarus alternative ... cosacam1 08:23Has anyone used calendar? luce80 08:53@cosacam1 view [ button "Aceptar" [print cal/data] cal: calendar data 01-01-2000 ] cosacam1 08:57Of course: data, not date. Thanks luce80 luce80 09:15pick accepts also a block! for its index parameter. How is it used? rebolek 09:21I guess it's not used and it's just reserved for usage in schemes where it may make sense, same as time! hiiamboris 09:42https://github.com/red/red/issues/3665 gltewalt:matrix.org 18:35Isn't this the wrong room for design debate? Wednesday 17th August, 2022 greggirwin 21:18Design debate should move to red/red. Thursday 18th August, 2022 GiuseppeChillemi 14:57This works in Rebol but not in Red, I get a no catch for throw error! f: func [ [catch] "Try me" arg "Any Arg" ] [ throw make error! "Oh noooo" ] f 999 I am doing something wrong? greggirwin 16:08Red doesn't support function attributes yet. bubnenkoff 17:05 >> #("text": 123) *** Syntax Error: (line 1) invalid word at : 123) it's impossible to use string as key in map? rebolek 17:05#("text" 123). There's no set-string!. greggirwin 17:06 >> #("text" 123) == #( "text" 123 ) 17:06Too slow. Grrrr. ;^) rebolek 17:06:mouse: bubnenkoff 17:06oh! thanks! 17:09But for example how to access for key if am putting string in next way: >> a: #({"foo" "bar"} 123) == #( {"foo" "bar"} 123 ) >> a/{"foo" "bar"} *** Syntax Error: (line 1) invalid path at a/{"foo" "bar"} ne1uno 17:13a/("foo"): "bar" bubnenkoff 17:14eht... I thought {"foo" "bar"} will be key of map with value 123 17:15So my question is about how to create map with key with string! type, or it's inpossible? ne1uno 17:16@bubnenkoff, enclose key in paren or use get instead of path 17:17a/({"foo" "bar"}) bubnenkoff 17:17thanks! Friday 19th August, 2022 bubnenkoff 15:33 data: [{"aa" "bb"} {"cc" "dd"} {"ee" "ff"}] how to write this to files with line breaks? [ {"aa" "bb"} {"cc" "dd"} {"ee" "ff"} ] I tried: formatted-values: [] foreach el data [ append formatted-values el append formatted-values lf ] write %out.red form reduce formatted-values But it remove string liters and block brackets hiiamboris 15:45? new-line ? save bubnenkoff 16:06Do not understand idea how it should work together... 16:11save %out.red new-line/all data on output: {"aa" "bb"} {"cc" "dd"} {"ee" "ff"} I am close to result! hiiamboris 16:11:+1: 16:12now study save refinements closer 16:13oh sorry, it doesn't have that :D 16:13ok then, mold has what you need, and save %file roughly equals write %file mold bubnenkoff 16:15 write %out.red mold (new-line/all data on) works! Thanks! 16:36The main idea is to write map! in human readable format. As it's displaying in code. Now I know to to write is block values, but now I need to add it's key: data: #( "foo" [ {"lots" "lot" "maxPrice"} {"lots" "lot" "objects" "maxPrice"} {"lots" "lot" "objects" "item" "maxLotPrice"} ] ) write %out.red mold (new-line/all data/("foo") on) 16:38 write %out.red insert mold (new-line/all data/("foo") on) "foo" do not work -- i tried to append key name before hiiamboris 16:57write data, not the result of new-line 16:57new-line is destructive (modifies in place) Saturday 20th August, 2022 ldci 09:47Rebol has a very complete image! datatype since images are considered as series. To copy an image (img2) into another image (img1) at a given location (xy): xy: 10x10 change at img1 xy img2 Is there an easy way to do the same with Red? hiiamboris 10:10draw img1 compose [image img2 (xy)] 10:11and you've found a regression, congrats ldci 10:22@hiiamboris Thanks a lot :) dockimbel 12:47> change at img1 xy img2 We should support that in Red too. @qtxie ldci 17:41@dockimbel That would be great. Have a look here: http://www.rebol.com/docs/image.html#section-1 hiiamboris 18:22I have a doubt that OS image functions can support all that. GiuseppeChillemi 18:44It had also nice special effects for images. 18:44But I don't know if we can have them in Red greggirwin 18:53In the past we talked about the value of an effects pipeline, and it's a great feature IMO. Especially with what @ldci does and exposing the convolving kernel. Sunday 21st August, 2022 ldci 09:01Hi, while waiting for change function on images, a small function that makes job: change-at: function [ img1 [image!] ;--first image img2 [image!] ;--second image pos [pair!] ;--starting position ][ if any [pos/x = 0 pos/y = 0] [pos: 1x1] ;--Red is 1-based start: pos/y - 1 * img1/size/x + pos/x line: 1 while [line <= img2/size/y][ col: 1 while [col <= img2/size/x][ img1/:start: img2/:col col: col + 1 start: start + 1 ] start: start + img2/size/x line: line + 1 ] ] comment [ a: make image! reduce [100x100 red] b: make image! reduce [50x50 green] change-at a b 25x25 view [image a] ] hiiamboris 09:25why bother if you have image command in Draw ldci 09:32@hiiamboris , mainly because draw can’t be used in routines:) hiiamboris 10:31I see ;) Monday 22nd August, 2022 bubnenkoff 12:51I forgot why next code is add only one field to UI: add-field: function [] [ append p/parent/pane layout/only [field] ] view [ p: panel [ ] button "add" [add-field ] ] I thought it should add as many fields as was clicked on add button dockimbel 13:12@bubnenkoff They are all placed at the same offset, so they are pilling up one on another. Here is a working example: pos: 5x5 add-field: function [/extern pos] [ append p/parent/pane make-face/offset 'field pos: pos + 0x30 ] view [ p: panel [] button "add" [add-field ] ] 13:16Use make-face when you need to create individual faces from existing styles, layout is invoking the full VID processor which is overkill in such case. bubnenkoff 13:17thanks! Heh I did not know that make-face is exists dockimbel 13:21It was missing from [View docs](https://github.com/red/docs/blob/master/en/view.adoc#extra-functions), so I just added it. bubnenkoff 13:39egh... and what if I want to add two fields at one click? for example I want to display it [] [] <- first click [] [] <- second click I tried to place field in block but git an error: make-face/offset does not allow block! for its style argument hiiamboris 15:51you'll figure it out, just don't let your hands do anything before your head ;) GiuseppeChillemi 16:20If I have some panels with elements inside, like button/areas, how could I add/remove elements from the panel? hiiamboris 16:32append or remove them from panel's pane GiuseppeChillemi 17:37Is there a way to let findlook at block! of block! content in one run to avoid a second run? I mean: my-data: [[a b] [a bbb] [b ccc] [a z]] find/????? my-data 'a So that it finds sub-blocks 1 2 and 4 henrikmk 17:49A FIND/DEEP would be nice, but perhaps is complicated to do. GiuseppeChillemi 17:56Yes, it would be good to find/deep or nest another lower lever find. Maybe one day we could provide even an R/S routine to be used by find to make a custom search at each element/row of the series. dockimbel 18:02Sure, why use Parse dialect when we can add yet another refinement to the most overloaded native... henrikmk 18:08We will not rest until FIND can brew coffee too. bubnenkoff 18:31I am trying to solve next problem. I have data structure that I want to display and make it possible to be editable. data: [ foo: none bar: none lots: [ lot: [ number: none ] customers: [ customer: [ name: none ] ] ] ] So I want to make UI from data and allow to save\load it from file. The number and names of blocks should be possible to change in dynamic. So for exmaple I should be able to add node objects inside node lot. I am thinking about proper ways to do it. And what types of controllers should I use. Now I am thinking that I could try to build UI base on field. I don't have a good idea how to organize the mapping logic with the hierarchy. If I would generate UI kike Nenad show how can I add any node to any level? greggirwin 18:38You can use face/extra to hold a reference to the field in the data structure. bubnenkoff 18:46Could you give an example. I can't find nothing in search by: face/extra greggirwin 18:50It's just a facet faces have. You can store anything there. So as you generate faces while walking your structure, you can use the current node's key and thus be able to update the data there. GiuseppeChillemi 19:09@dockimbel you are the master, I just make a wish. But before writing anything more, I will try to optimize my find-in function, even in parse, to see if at least 5x slower speed of 1 level block speed searching could be reached. See you! Tuesday 23th August, 2022 Respectech 00:46It sounds like someone needs to write a 'find dialect. GiuseppeChillemi 00:52I have made some speed test, the topic continues here on red/red :point_up: [23 agosto 2022 02:14](https://gitter.im/red/red?at=63041bd772ad51741f7d910f) zentrog:matrix.org 02:26I think the first step should be to define the interface and semantics of the feature, and not worry about performance until the very end greggirwin 03:28Agreed @dander. GiuseppeChillemi 06:51@zentrog:matrix.org I have made the speed tests to see if there could be advantages into going native with the /deep refinement. Here is the answer: Nested-find: 0:00:00.116017 Nested+chk: 0:00:00.224215 ;with -if all [block? column find column value]...-- check Find/Skip: 0:00:00.0029983 99999 If I have calculated it correctly, a native find/skip over a test made with 2 nested find and a datatype checks is about 30x faster. In these tests, the first find searches for a record located at the penultimate position over 100K; then it searches inside a block with just *one* element, so I can say that a simple datatype check and a second native find on a small block, would not not add so much on that 0:00:00.0029983. That 20/30x speed gain, gives motivation for a find/deep cosacam1 13:24Hi. I made a data structrure similar to Dmitri's example, a block of blocks,i.e 13:30a tree. I want to save it to a json file using Santilli's to-json. It gaves me no error msg but it does not creates any file rebolek 13:31what does save/as %output.json your-data 'json do? cosacam1 13:37I use probe before saving to check my data and it is ok. Any idea why is it not saved? rebolek 13:46It's hard to tell without seeing the code you are using. hiiamboris 14:01maybe you're just looking for the saved file in the wrong place? cosacam1 15:02@hiiamboris Actually I'm using an absolute path %/E/folder/subfolder/test.json 15:11@rebolek Code is not relevant. Data is ok, just a tree in a nested block fashion like Dmitri example above (sorry I cant give you my own but I cant use my laptop right now, I'm using my phone) For same reason I havent tested your suggestion save/as ... json rebolek 15:27@cosacam1 OK, so try my suggestion when you're at your computer and let me know. cosacam1 16:16@rebolek Yes, it works! And load/as ... 'json too. Why do I often take the longest path? Nevermind. Thank you. rebolek 16:20:) greggirwin 18:21> Code is not relevant. As a note to everyone, as many lurk here, actual code is almost always relevant, since it shows the problem. Without it, others can only guess and make simple suggestions. zentrog:matrix.org 22:01@GiuseppeChillemi: I would argue that speed gain is not relevant until you actually need it. The important thing about defining new functions/features is how useful they are and whether they make your code cleaner and more maintainable. If modifying the language, then you must be certain to make it unnecessarily more complex. If you later discover that this particular operation is very expensive _in an important way_ in your code, then going down to red/system would almost certainly help. At that point, the design is fixed though, and improving performance is an implementation detail. It doesn't have to be piggy-backing on an existing function to do that. GiuseppeChillemi 22:27As Nenad has said, we can add it to Find, even if it is the most overloaded native, and he would accept any proposal I will make! 22:28I am joking, let's see where this road ends. 22:43Thinking out aloud: what seems clear is that very strict nested loops gain a lot from having native R/S code. So, even if find/deep or find/into would not be implemented, we should create and use specialized R/S functions in such scenarios. greggirwin 22:49R/S wins big when it can access the underlying data in raw form, e.g. bytes or chars. Once you start dealing with things at the Red runtime level, e.g. rich types, the gains are much less. Wednesday 24th August, 2022 cosacam1 03:03Sorry Gregg, I was referring only to that specific case. Besides, I couldn't send my code because I was in a blackout... you don't wanna know how often they are! ... And I could not send this... because of another one 6 hours long!!! pekr 03:09@GiuseppeChillemi I do remember some very old discussion about findworking upon a nested structure, apart from /deep, the alternative name was /flatIIRC. But it never materialised .... cosacam1 03:59On July 1 Gregg answered to me: The tiger demo is 100% real, and still runs on my Android phone, and you may be able to build things, but that branch is terribly out of date, so no guarantees. Now I try to compile it with no avail. I wrote this little program too ` Red [ Title: "Trying to make an apk" Author: "cosacam" File: %test-apk.red ; Config: [type: 'dll libRed?: no libRedRT?: yes export-ABI: 'cdecl] Tabs: 4 Needs: 'View ] #include %/E/cosacam_data/bz/distrib_bz/programacion/red/red-master/bridges/java/JNI.reds view [ text "Name" n: field 100 button "Backwards" [r/text: reverse n/text] r: text "---" ] 04:04` 04:07I couldn't compile it either by red.exe -t Android E:\cosacam_data\bz\distrib_bz\programacion\red\red-master\bridges\java\bridge.red. So, no Android compiling yet? bubnenkoff 11:58@cosacam1 could you share your code please. I am still frustrating about idea how to write such tree cosacam1 13:43Asap. Blackout greggirwin 16:55Given that Android is now set to come after 1.0, don't expect any fixes to it before that. GiuseppeChillemi 20:13@greggirwin It would be good to create a group of volunteers to put the Android version on par with the current release. The work is in an advanced state and we could have one more instrument to the community. But... we have no human resources capable of this work! Or at least, I see just a couple of people and nothing more. greggirwin 20:20Someone from the community was going to, but we never built momentum. @dockimbel has a high bar for contributions and this work requires deep skills, which I doubt will be met by self-organized volunteers. Combined with the current codebase being frozen in the near future, given the new roadmap, changes may make any effort there wasted. GaryMiller 20:36Is there a link to the new roadmap? GiuseppeChillemi 20:37@GaryMiller The second message in the Red main site. 20:44@greggirwin You can have an unofficial, not-so-perfect solution and then the coders could move their codebases to the new Red Team which follows Doc standards. The advantage of this path is the creation of a codebase and applications that will be the ground for the official android one. greggirwin 20:46I don't think it's feasible, or a good use of people's time right now, but people can work on anything they want. @dockimbel would have to say if he supports any specific initiative. qtxie 22:50@GiuseppeChillemi Don't expect there are any volunteers to do it at the current scale of Red community. Even no volunteers to fix some simple issues which way easier than Android support. As Gregg said, people can work on anything they want. It's opensource, feel free to modify it to fit your needs. ;) GiuseppeChillemi 23:25Thank you for the answer, I already knew it but I have asked, just in a case... Expressing your dreams is free, realizing them is much more difficult! ;) qtxie 23:32> Combined with the current codebase being frozen in the near future, given the new roadmap, changes may make any effort there wasted. According to the blog article [The Road To 1.0](https://www.red-lang.org/2022/07/the-road-to-10.html), IIUC, the current codebase won't be frozen. Only the Rebol 2 code (compiler, linker and encapper) will be discarded. It will be replaced by a Red one. The R/S runtime codebase will continue to be updated. So changes in the runtime won't be wasted. Thursday 25th August, 2022 greggirwin 00:16"Frozen" is perhaps too strong a term, yes. But any work done in 32-bit now, e.g. in the Android back end, will have to be updated for 64-bit when the time comes. And once the deep core team is focused on the new work, there will likely be very few updates. @dockimbel can clarify, but building momentum on the new work is paramount, and avoiding distractions is key. 00:18That's how I read his final line in the blog post anyway. qtxie 01:48> But any work done in 32-bit now, e.g. in the Android back end, will have to be updated for 64-bit when the time comes. For Red code, no wrong. For R/S code, if you don't use pointer as 32-bit integer, then it should just works fine on 64-bit. greggirwin 03:03But Android work will be R/S, correct, so may be affected. bubnenkoff 07:55it's very interesting why on short strings is adding double quotes but longer strings is wrapping by {} >> x: [] == [] >> >> append x "aaaaaaaaaaaaaa aaaaaaaaa aaaaaaaaa" == ["aaaaaaaaaaaaaa aaaaaaaaa aaaaaaaaa"] >> >> append x "aaaaaaaaaaaaaa aaaaaaaaa aaaaaaaaa aaaaaaa aaaaaaaaaaaaaaaa" == ["aaaaaaaaaaaaaa aaaaaaaaa aaaaaaaaa" {aaaaaaaaaaaaaa aaaaaaaaa aaaaaaaaa aaaaaaa aaaaaaaaaaaaaaaa}] ; ^--- see ^--- and here rebolek 07:56they're equivalent, there's just a limit in mold when to switch from " to {}, otherwise there's no difference bubnenkoff 08:31But what is the logic? Why such design? rebolek 08:33Have you read the documentation? For example http://www.rebol.com/docs/core23/rebolcore-3.html#section-2.6 hiiamboris 08:43I guess logic is to choose between "" and {} without scanning the string for new-line markers (for speed). Limit just works in the majority of cases (single line strings are usually short, multi-line ones are usually long). dockimbel 09:06> Only the Rebol 2 code (compiler, linker and encapper) will be discarded. It will be replaced by a Red one. As we'll be rebuilding the new toolchain in Red, we'll need to make fixes and improvements to the current runtime, to sustain that work. That's also the reason why we need to pass some long-time planned changes/improvements to the Red runtime library before we start the work on the new toolchain. greggirwin 17:00Thanks for clarifying @dockimbel. bubnenkoff 18:53Hey! After some frustration I found example of using extrra (I used it in the past but forgot how to work with it) and wrote next prototype: data: [ foo: none bar: none lots: [ lot: [ number: none ] customers: [ customer: [ name: none ] ] ] ] foo: function [] [ level: 0 ui: copy [] walk: func [ data ] [ foreach [key value] data [ either block? value [ level: level + 1 append ui compose [pad (1x0 * level * 15) button (to-string key) extra (to-string key) return ] ; first (to-string key) for name, second for saving it's position walk value ] [ append ui compose [pad (1x0 * level * 15) button (to-string key) extra (to-string key) return ] ; first (to-string key) for name, second for saving it's position ] ] level: level - 1 ] walk data return ui ] view foo It's works! hiiamboris 19:01☻ bubnenkoff 19:14How I can increase only first element in pairs like 0x0. + 10 add 10 both, but I need to add only to one. I can't use + 10x0 because 10 is value from word. hiiamboris 19:21multiply 10 by something before adding greggirwin 20:43Sometimes I just can't resist playing. Inspired by @bubnenkoff's example, here's a hack on it. 20:44 data: [ foo: none bar: none lots: [ lot: [ number: none ] customers: [ customer: [ name: none ] ] ] ] foo: function [] [ level: 0 ui: copy [] key-path: make path! [] ; this looks empty, but it's like an invisible empty block add-ctl: func [key][ ; first key use is for name, second for saving its key append ui compose/deep/only [ pad (1x0 * level * 15) button (form key) extra [key (key) path (copy key-path)] [ print ["Current value:" mold get face/extra/path] either block? get face/extra/path [ print "Don't set containers!" ][ set face/extra/path random "abcdefg" ] ] return ] ] walk: func [ data [block!] /with root-key ; quick hack to avoid lit-arg design for now ][ if with [append key-path root-key] foreach [key value] data [ append key-path to word! key ; can't have set-words in a path add-ctl key either block? value [ level: level + 1 walk value ; recurse into nested block ][ ; We aren't recursing, so drop the last key in the path take/last key-path ] ] take/last key-path level: level - 1 ] walk/with data 'data probe ui ] view foo print ["Data is now:" mold data] cosacam1 23:34@bubnenkoff ` 23:34 greggirwin 23:38Another blackout? ;^) cosacam1 23:40@bubnenkoff a: 10 b: 4x5 c: as-pair a 0 b: b + c 23:42@bubnenkoff You asked me for my code for 23:58@bubnenkoff You asked my code for creating a tree. I've been working today on it however it's not for visually creating the tree but for getting some data from user then saving it as a tree (nested blocks) in a json file. The key is to use append/only compose/deep user-data. Only refinement is for keeping the sqare brackets. Compose is for evaluating field/text between parens. Deep refinement is for compose to work inside sub-blocks too. Unluckly I'm in a blackout again so I can't send you my program now. Friday 26th August, 2022 cosacam1 00:00@bubnenkoff I see you de 00:02@bubnenkoff I see you developed a solution and gregg made a variation of it. I will study both when I have electrticity again. qtxie 03:27@ldci Added CHANGE action for image! 03:27 a: make image! reduce [100x100 red] b: make image! reduce [50x50 green] change at a 25x25 b view [image a] ldci 06:12@qtxie Thanks a lot:) bubnenkoff 07:26@cosacam1 thanks! @greggirwin what random do here? set face/extra/path random "abcdefg"? Why it's needed? qtxie 08:26@ldci It's much faster than the pure Red version. >> (dt [loop 1000 [change-at a b 25x25]]) / (dt [loop 1000 [change at a 25x25 b]]) == 419.1689133726497 ldci 08:34@qtxie A new Red version: change-at: function [ img1 [image!] ;--first image pos [pair!] ;--offseting position img2 [image!] ;--second image ][ nRows: img2/size/x nLines: img2/size/y if any [pos/x = 0 pos/y = 0] [pos: 1x1] ;--Red is 1-based ;--image 2 must be contained in image 1: we ignore extra pixels if (pos/x + img2/size/x) > img1/size/x [nRows: img1/size/x - pos/x + 1] if (pos/y + img2/size/y) > img1/size/y [nLines: img1/size/y - pos/y + 1] line: 1 offset: (pos/y - 1 * img1/size/x) + pos/x until [ row: 1 ;print offset while [row <= nRows][ img1/(offset): img2/(row) row: row + 1 offset: offset + 1 ] offset: pos/y - 1 + line offset: offset * img1/size/x + pos/x line: line + 1 any [line = (nLines + 1) offset > (img1/size/x * img1/size/y)] ] ] greggirwin 18:43> what random do here? set face/extra/path random "abcdefg"? Why it's needed? To show that it can update the data based on the key-path the face holds. Sunday 28th August, 2022 bubnenkoff 08:04is it possible to fully change panel to another like: view [ p1: panel red [ button return button return button ] button "change panel" [ p1: panel green [ ; panel with new content field return field return field ] ] ] hiiamboris 08:12by modifying window/pane bubnenkoff 08:27 view [ p: panel red [ button return button ] button [ append window/pane [button] ] ] > Script Error: window is unset in path window/pane hiiamboris 08:32window is the face where panel is located 08:32how can you access it? bubnenkoff 08:40Than I am not understanding how to access to change it. I have ideas only like: win: [ button [ append face/pane [button "test"] ] ] view win But it also do not work hiiamboris 08:41you may have read in the docs that there's a tree of faces, right? 08:43how do you get a level up on that tree? bubnenkoff 08:48parent level is face, so accessing from body of layout should be to window if I right understand how all works hiiamboris 08:50no face is the button itself in this case bubnenkoff 13:15Do not understand docs. It's saying: parent - Back-reference to parent face (if any).. But face do same. So face/parent is parent of parent face or what? 13:51Also I can't find in VIS docs with I seeing that this word is using quite 14:10I am not fully understand how with and react/later works in next code: view/flags [ p: panel red with [ react/later [ size: parent/size - (self/offset * 2) ] ] [ a: area with [ react/later [ size: parent/size - (self/offset * 2) ] ] ] ] [resize] 15:00I have done example of panel that that have dynamic with and fixed height: view/flags [ p: panel red with [ react/later [ width: (first parent/size * 20%) height: 100 size: as-pair width height ] ] [ ] ] [resize] hiiamboris 15:22> So face/parent is parent of parent face or what? Yes 15:24> Also I can't find in VIS docs with I seeing that this word is using quite https://github.com/red/docs/blob/master/en/vid.adoc#with 15:28> have done example of panel that that have dynamic with and fixed height Good. That's a start ;) bubnenkoff 15:30Is there any good way to do resizable UI. Here button do not change it's position when UI is resizing: view/flags [ field with [ react/later [ width: (first parent/size * 80%) height: 25 size: as-pair width height ] ] button "ok" ] [resize] Should I also calculate pad for it? Or there is better way? hiiamboris 15:32Yes, you'll have to change it's offset. How would button know what it should do unless you tell it? 15:33Here's a simpler way: https://gitlab.com/hiiamboris/red-elastic-ui but perhaps you wanna learn how to do it yourself.. bubnenkoff 15:37hm... maybe I should put field in come kind of container and button will take all remain space from the right of it? hiiamboris 15:40No, View just doesn't do that. Elastic UI does: view/flags elastic [field #fill-x button "ok" #fix-x] 'resize ![](https://i.gyazo.com/b477de67f59fda853cfa7a7335f3d5c9.gif) bubnenkoff 15:43So impossible to do like (UI elements are not showing): view/flags [ p: box with [ react/later [ width: (first parent/size * 80%) height: 110 size: as-pair width height ] ] [ field with [ react/later [ size: parent/size * 100% ] ] button "ok" ] ] [resize] hiiamboris 15:45No, box is a transparent base. 15:51In Spaces it's automatic: ![](https://i.gyazo.com/9e473f04c6711bced3c6a449025dc9ef.gif) bubnenkoff 15:54Ok! Thanks! 15:55I will wait at least beta stage hiiamboris 15:56You know that View is not going to be changed until the core is finished, yes? That is, no less than a year from now. bubnenkoff 16:00Yes, I think I will try to use view as it is and hope to rewrite UI someday in future to Spaces. need only figure out how to change panels ) I still did not understand how to access to window hiiamboris 16:01Well, you have found parent/size, so you're closer now to parent/pane ;) bubnenkoff 16:07 view [ p: panel red [ button return button ] button [ append parent/pane [button] ] ] heh: *** Script Error: parent is unset in path parent/pane hiiamboris 16:09Unset indeed. Actor code is not bound to the face. 16:09How do you access it from the actor? bubnenkoff 16:11I have only one idea that do not work: append face/parent/pane [button] hiiamboris 16:11Almost there. 16:12Inspect face/parent/pane. Values of what datatype are inside it? bubnenkoff 16:12Almost -- you mean I need to reduce [button] ? I tried it too: button has no value hiiamboris 16:13Don't do random things. Follow my questions ;) 16:13As you progress, you will learn. bubnenkoff 16:14There objects. So I need to add button as object. Yes? hiiamboris 16:14Objects! True! So how do you *usually* turn word button into a button object? 16:15(obviously the object has to be created by something) bubnenkoff 16:16I know only one long way - describe it's as object make object! .... (do not remember full syntax) hiiamboris 16:16Well, one tip: view [stuff] is equivalent to view layout [stuff] because view internally calls layout. 16:17There's also make-face, but probably not needed here. bubnenkoff 16:17Oh! That's work: view [ p: panel red [ button return button ] button [ append face/parent/pane layout/only [button] ] ] 16:18thanks! hiiamboris 16:18:clap: bubnenkoff 16:18So in this way I could hide panel and show on it place panel with another content? hiiamboris 16:19Also mind that you may have to adjust /offset of the button you've created (it will always be at 10x10 otherwise) 16:19> So in this way I could hide panel and show on it place panel with another content? Yes. But also you could have declared a few panels with hidden flag and one visible, and then just changed the /visible? facet when you need it. bubnenkoff 16:21on same place? Just to switch between them? hiiamboris 16:21Yeah bubnenkoff 16:22perfect! Thanks! hiiamboris 16:22You're welcome bubnenkoff 18:44I remember I have asked about getting selected text from area, but is it hard to get from rich-text? greggirwin 18:46https://github.com/red/docs/blob/master/en/rtd.adoc hiiamboris 18:48Rich-text is not interactive. greggirwin 18:51You can track selection though. 18:52It just doesn't do it automatically. Monday 29th August, 2022 luce80 17:38@bubnenkoff About a resizable UI, if you have a simple UI where the styles simply "follow" the borders you can do as I did in the bottom part of [this useful script](https://gist.github.com/luce80/bfa8b54ca8c7e726723072786cad56fa) bubnenkoff 18:29@luce80 big thanks! look good! But do you have mode docs? It's not very clear how to add it to exist code cosacam1 19:10Hi there. Is there an on-close (or something) event to take some action before a window is closed, even to avoid it to be closed? thanks hiiamboris 19:13Exactly. on-close :) 19:16This chapter explains how to intercept events https://github.com/red/docs/blob/master/en/view.adoc#114-event-flow cosacam1 19:17However ` view [button [unview]] on-close [print "so long!"] *** Script Error: on-close has no value *** Where: catch *** Near : on-close [print "so long!"] *** Stack: hiiamboris 19:18use /options facet 19:19or put your actors at the beginning of view block (but it's not by design ;) cosacam1 19:24view/options [button [unview]] [on-close: [print "so long!"]] doesn't show error but prints nothing either gurzgri 19:28It's view [on-close [print "so long!"] button [unview]]. hiiamboris 19:29/options is not a dialect, just Red code cosacam1 19:32@gurzgri Thanks but it does not print message gurzgri 19:32> or put your actors at the beginning of view block (but it's not by design ;) At least it's [documented](https://github.com/red/docs/blob/master/en/vid.adoc#34-actors-definition) I think. hiiamboris 19:35Oh great then. I just remember it caused some troubles.. gurzgri 19:36@cosacam1 on-close actor is triggered on closing the window with the close icon in the tile bar. If you wan't the button to result in that action too, then do something like view [on-close [print "so long!"] button [do-actor face/parent none 'close unview]] cosacam1 19:40Yes, @gurzgri I 've just noticed that with example given in Helpin' Red. Thanks. And what about to avoid closing? greggirwin 19:45 view/options [ title "Closed window" size 500x600 ][ actors: object [ on-close: function [face event][ view/flags layout [ text "Do you want to close? <yes> <No>" style b: button b "Yes" [ret: 'done unview] b "No" [ret: 'continue unview] ][modal popup] ret ] ] ] hiiamboris 19:53click "X" twice ;) cosacam1 19:54So continue is another return value for the event. I knew about 'done and 'stop, now 'continue. Anything else? Any document about it? Thanks hiiamboris, christian and gregg. gurzgri 19:56[Global event handlers](https://github.com/red/docs/blob/master/en/view.adoc#115-global-event-handlers) 19:57'continue you've just made up I guess, @greggirwin, to contrast the return value with 'done, didn't you? 20:03And 'done doesn't seem to prevent the window from being closed when returned in the containers on-close as in view window: layout [on-close [print "You'd better stay!" 'done] text "Stay for good"] (but atm I'm not on the very latest red-latest) hiiamboris 20:05continue seems undocumented (no other token seems to work) 20:06also this breaks the general capturing/bubbling design, where for other events you have to capture them to intercept 20:09@dockimbel cosacam1 20:12Yeap, undocumented, the link given by Christian only mentions 'done, 'stop and none. Ok, I'm learning from you guys. Thanks 20:17Guys. I'm embarrased. There's no way I can format properly my code in the black box like everybody else. I'm typing in my laptop now but most the times I chat with you using my phone. I use the triple apostrohes (the one located above Tab in my laptop keyboard) however I cannot do it right. Sorry if I bother you 20:21@bubnenkoff I finished the sample program for creating a json file from my tree-like data. If you're still interested... 20:22It is 215 lines long gurzgri 20:28Not triple apostrophes but [triple backticks followed by Red word](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/creating-and-highlighting-code-blocks) for Red code blocks. And blank lines before an after backtick blocks are suggested. Single backticks for inlining code. greggirwin 21:06> click "X" twice ;) Shows default handling. :^) 21:07I remember these events being a little tricky when I used them long ago. 21:07That is, I couldn't just remember them and get them right. Tuesday 30th August, 2022 bubnenkoff 06:48@cosacam1 could you show how it's work? greggirwin 17:45I did in the example above. Wednesday 31st August, 2022 bubnenkoff 12:18> > data: [ > foo: none > bar: none > lots: [ > lot: [ > number: none > ] > customers: [ > customer: [ > name: none > ] > ] > ] > ] > > foo: function [] [ > level: 0 > ui: copy [] > key-path: make path! [] ; this looks empty, but it's like an invisible empty block > > add-ctl: func [key][ > ; first key use is for name, second for saving its key > append ui compose/deep/only [ > pad (1x0 * level * 15) > button (form key) extra [key (key) path (copy key-path)] [ > print ["Current value:" mold get face/extra/path] > either block? get face/extra/path [ > print "Don't set containers!" > ][ > set face/extra/path random "abcdefg" > ] > ] > return > ] > ] > > walk: func [ > data [block!] > /with root-key ; quick hack to avoid lit-arg design for now > ][ > if with [append key-path root-key] > foreach [key value] data [ > append key-path to word! key ; can't have set-words in a path > add-ctl key > either block? value [ > level: level + 1 > walk value ; recurse into nested block > ][ > ; We aren't recursing, so drop the last key in the path > take/last key-path > ] > ] > take/last key-path > level: level - 1 > ] > > walk/with data 'data > > probe ui > ] > > view foo > print ["Data is now:" mold data] > I went back to study an example. It's not still clear for me what path is button (form key) extra [key (key) path (copy key-path)] I tried to inspect button object but did not see no properties named path: >> view [b: button] >> probe :b hiiamboris 12:23look in extra Thursday 1st September, 2022 bubnenkoff 07:17 /with root-key ; quick hack to avoid lit-arg design for now Did not understand about lit-arg design 09:26Also I can't understand how compose/deep/only works: >> compose/only [ [(2 + 2)] ] == [[(2 + 2)]] >> >> compose/deep/only [ [(2 + 2)] ] == [[4]] >> >> compose/deep [ [(2 + 2)] ] == [[4]] >> compose/deep [ 1 2 3 [(2 + 2)] ] == [1 2 3 [4]] >> >> compose/deep/only [ 1 2 3 [(2 + 2)] ] == [1 2 3 [4]] hiiamboris 10:33What does /only docstring say? 10:33And /deep bubnenkoff 10:39 /only Compose nested blocks as blocks containing their values. deep - I understand) hiiamboris 10:40Well, try it with blocks, not just 2 + 2 bubnenkoff 10:41 >> a: "hello" == "hello" >> compose/deep/only [1 2 3 [(a)]] == [1 2 3 ["hello"]] 10:45@hiiamboris How stable Spaces stable now? I have a task to build complex UI and I have some problems that VID is not perfect for it, and I see that Spaces is much more powerful, so is it's time to start or you will do some breaking changes? hiiamboris 11:39No breaking changes, you can use it. 11:40> >> a: "hello" That's not a block bubnenkoff 11:55Oh! I understood! 13:16@greggirwin big thanks for your example! I learned a lot from it. But now I decided to continue mine code, because I understand it's better. Just to show what I am trying to reach (there is a lot of work) but mode complex example: data: [ foo: 1 bar: none lots: [ lot: [ number: none price: none date: none ] customers: [ customer: [ name: none ] ] ] ] foo: function [] [ level: 0 add-button-added?: false words-added?: false parent-name: none if (level = 0) [parent-name: 'data] ; for root parent always data ui: copy [ panel red [] panel blue [] ] walk: func [ data ] [ foreach [key value] data [ either block? value [ if (level = 0) [ append ui/3 compose/deep [pad (1x0 * level * 15) button "add block" button ( rejoin ["add field " parent-name ] ) extra (to-string key) pad 0x-10 return ] add-button-added?: true ] level: level + 1 append ui/3 compose/deep [pad (1x0 * level * 15) field data [(key)] button "add block" button "add field" extra (to-string key) pad 0x-10 return ] ; first (to-string key) for name, second for saving it's position parent-name: key ; save parent name walk value ] [ append ui/3 compose/deep [pad (1x0 * level * 15) field data [(key)] pad -10x0 field data [(value)] extra (to-string key) pad 0x-10 return ] ; first (to-string key) for name, second for saving it's position ] ] level: level - 1 ] walk data return ui ] view foo greggirwin 17:48Keep making progress. :^) Friday 2nd September, 2022 bubnenkoff 08:43> I forgot why next code is add only one field to UI: > > add-field: function [] [ > append p/parent/pane layout/only [field] > ] > > view [ > p: panel [ > ] > button "add" [add-field ] > ] > > I thought it should add as many fields as was clicked on add button > Code above work. What I am missing here? add-field: function [] [ append ui/parent/pane layout/only [field] ] ui: [ button "add" [add-field ] ] view ui error: *** Script Error: path ui/parent/pane is not valid for none! type hiiamboris 09:12what is ui? bubnenkoff 09:13block! hiiamboris 09:26indeed, and do you see parent in that block? bubnenkoff 09:26so it getting parent only at moment of evaluation it with view? hiiamboris 09:27you should use face available to every actor 09:27view doesn't do anything with your ui block, no magic involved bubnenkoff 09:29 add-field: function [] [ append face/parent/pane layout/only [field] ] ui: [ button "add" [add-field ] ] view ui Script Error: face is unset in path face/parent/pane hiiamboris 09:29I said to every actor, not to every function 09:30where is the actor in your code? bubnenkoff 09:31button should be an actor, or I do not understand what else could be actor... %) hiiamboris 09:32no, button is a face 09:32actor is something that *acts* upon events bubnenkoff 09:32on click event. So [add-field ] is actor? hiiamboris 09:32exactly 09:33face and event are defined only within that block bubnenkoff 09:38Ok. Your are saying: you should use face available to every actor and [add-field ] is actor So I can't imagine how it should look like... hiiamboris 09:40you have to somehow pass face to add-field I guess bubnenkoff 09:48Wow! Did not think that it's possible! add-field: function [face] [ append face/parent/pane layout/only [field] ] ui: [ button "add" [add-field face] ] view ui yes it's works! hiiamboris 09:50:clap: gurzgri 13:11@bubnenkoff Just have a look into what happens with an actor defined in VID: >> layout [btn: button [do something]] probe btn/actors make object! [ on-click: func [[trace] face [object!] event [event! none!]][do something] ] The actor block is used to create a function having args face and event, both of which you can use in it's body without them being declared somehow in the VID dialect. 13:16When a face recieves an click event, the View system calls the face's on-click actor function as in do-actor face event 'click to process it. That's why face in the actor body can be used. hiiamboris 13:20And it's [documented](https://github.com/red/docs/blob/master/en/vid.adoc#actors) ;) bubnenkoff 17:56why binding with offset do not work? view [ size 300x300 f: field with [offset: 50x30] ] I am seeing field on same position every time gurzgri 18:21view calls layout which lays out the window's pane sub-faces, offsetting them according to VID rules. Use e.g. at. bubnenkoff 18:35ah! thanks! 18:38@gurzgri so it would work inside panel ? 18:40hm.... If layout is placing faces according VID rules when I can use offset ? hiiamboris 18:41after or during faces creation bubnenkoff 18:43I can't understand moment when offset become at. As I understand they work same hiiamboris 18:44at is a keyword for layout, that it uses when it creates face objects and sets their offset 18:45what exactly do you want to achieve? maybe there's a better way bubnenkoff 18:51@hiiamboris I am still continue experiments with generation complex tree that refresh UI. But small example is look like: add-field: function [face] [ append face/parent/pane layout/only [field at 0x30] ; I need way to put field in custom position ] ui: [ button "add" [add-field face] ] view ui So I want to add some offset hiiamboris 18:55you're misusing at keyword 18:55re-read the docs bubnenkoff 19:00you are right again) hiiamboris 19:03☻ Saturday 3th September, 2022 GiuseppeChillemi 20:45I would like to learn how to use assert, do we have some documentation? hiiamboris 20:47https://static.red-lang.org/red-system-specs.html#section-12.1 20:47https://codeberg.org/hiiamboris/red-common/src/branch/master/assert.md Sunday 4th September, 2022 bubnenkoff 17:22I know that it should be better place it's in docs, but maybe someone will look in search removing element from a face. Example: view [p: panel [ button] button "remove" [ p/pane: [] ] ] it's clear panel and remove button from it cosacam1 21:00 Red view [test] 21:03well it works, my code is formatted properly here in a black box, but I needed to type shift+enter instead of enter. How to do it if I were typing from a phone? Or how to copy&paste a piece of code where I typed Enter all the time? hiiamboris 21:16Phone app usually does not send the message until it sees one of .!? 21:17But if it's not working you can always access this chat [from matrix](https://matrix.to/#/#red_help:gitter.im?utm_source=gitter) cosacam1 21:17should I put here an example program I made to show how to manipulate a little database in json? Or should I put it in some other place? In that case, where? hiiamboris 21:18https://gist.github.com cosacam1 21:26OK, here it is https://gist.github.com/cosacam1/0e5702505c92a5e1f34e69e94f264d7e 21:28Thanks hiiamboris, but my question is: Do I need to type shift+enter in every line instead of plain enter? 21:28Let me try: 21:37 Red [needs: view] view [ tab-panel [ "One" [ field button "Ok" ] "Two" [ box blue loose ] ] ] 21:39 Red Red [needs: view] view [ tab-panel [ "One" [ field button "Ok" ] "Two" [ box blue loose ] ] ] No, it does not work without shift+enter 21:40Yes it does! I must finish my message with Ctrl+Enter 21:57Thanks, guys Monday 5th September, 2022 hiiamboris 12:28*** Script Error: reset-start-pos has no value bubnenkoff 12:32I forgot to remove it. one moment 12:33 data: [ foo: 1 bar: none ] clear-panel: func[] [ print "clear-panel" ppp/pane: [] row-added-count: 0 ] row-added-count: 0 level-vertical-offset: function[/extern row-added-count] [ return to-pair compose [0 ( row-added-count * 30)] ] ui: copy [ size 520x700 ppp: panel red 340x690 [ ] button "start" [foo face] button "clear panel" [clear-panel] ] foo: func [face] [ print "foo" walk: func [ data ] [ foreach [key value] data [ append ppp/pane layout/only compose/deep [at ( level-vertical-offset ) field ] ; first (to-string key) for name, second for saving it's position row-added-count: row-added-count + 1 ] ] walk data ] view ui I can't understand why removing stop works after few: add control, remove, again add and agai remove hiiamboris 12:36we're back to https://github.com/red/red/wiki/[DOC]-Why-you-have-to-copy-series-values bubnenkoff 12:45Heh, this article is hard even for people that have some experience. Honestly I do not see place in my code where could be issue with copy hiiamboris 12:47in the piece that doesn't work ;) 12:50> hard even for people that have some experience ok let me try: *every time you write a **literal** series in your code, you have to ask yourself: am I not modifying it?* 12:51I've counted 27 literal series in the above code. bubnenkoff 12:53I found issue: clear ppp/pane ; that's work But should create new empty series that remove old data ppp/pane: [] hiiamboris 13:00@bubnenkoff you count now. How many series do you see in your code? 13:01(I made a mistake since I'm bad at counting ;) bubnenkoff 13:03I counted 7 13:06I am not sure if function args is series, possible they are so I need plus them hiiamboris 13:28Wrong ;) 13:28 >> ? series! SERIES! is a typeset! value: [block! paren! string! file! url! path! lit-path! set-path! get-path! vector! hash! binary! tag! email! ref! image!] 13:29Reminder for you bubnenkoff 14:31oh... but I still do not understand issue with copy >> foo: [a b c] == [a b c] >> foo: [] ; not it become empty == [] >> probe foo [] == [] >> hiiamboris 14:34OK count series in this fragment: f: func [] [print append "hello " "world"] bubnenkoff 14:473: f: "hello" "world" hiiamboris 14:48what type is f:? bubnenkoff 14:48set-word! hiiamboris 14:48is set-word! a series? 14:48 >> find series! set-word! == ? bubnenkoff 14:49It seems that set-word! is exception from list above, there is set-path! but no set-word! hiiamboris 14:50Indeed. All paths are there if you look closely, but no words. 14:50So f: is not a series. But you've missed some, find more. bubnenkoff 14:51[] is block! and body of function is block too, so all of them is series! hiiamboris 14:52Yes. So that makes 4? bubnenkoff 14:52yes hiiamboris 14:52And is this function f working or buggy? bubnenkoff 14:53oh! it's buggy! hiiamboris 14:53Indeed! And why? bubnenkoff 14:55I do not understand where it's do appending, it seems that it append to block! itself but I do not understand why it do so. I need away from PC, brb late hiiamboris 14:55Sure. Think on it while you're away. greggirwin 17:53Also, it is *critical* to understand that playing in the console and running scripts will not show the same behavior, as many people expect it will. If you paste your code into a console, then you can see how the interpreter sees it more than how you do as a human. e.g. every line you type is like a new line in a script. hiiamboris 19:01I'm facing a challenge. How can I define a #macro1 that enables #macro2 until the end of the block it appears in, but not after leaving it? 19:20My only idea is to parse the rest of the block myself, but then I will have to assume independence of #macro2 from any other macros defined. If some macro leaves #macro2 after itself, I won't know because I'm processing everything ahead of the preprocessor. greggirwin 19:22My first thought is that you'd have to use a flag in #macro1, which #macro2 checks. 19:27But that comes back to finding the end of the block again. 19:28It seems like a tricky pattern in any case, because you're already inside the block, correct? So you'd have to back up and find the start of the block you're in. hiiamboris 19:29Bingo! I can make #macro1 leave a #macro3 marker before the tail that will turn #macro2 off. Thanks. 19:30No need to find the start though. From the #macro1 location it will be fine. 19:31Will need some kind of stack though, for nested blocks. greggirwin 19:31Even if more blocks come before the end of the one you're in? In any case, it's clever to use another macro for it, which I hadn't thought about. hiiamboris 19:32Yes, that's why stack will be needed. greggirwin 19:32I was writing while you were. :^) hiiamboris 19:32☻ greggirwin 19:33So now you have #stackro handling to create. :^) dockimbel 20:48@hiiamboris This feature might help: https://github.com/red/docs/blob/master/en/preprocessor.adoc#local hiiamboris 21:07Hmm. Then I will have to define new macro in every block. I guess it's an option, but seems more work. bgrossot 21:13Hello, I have not find in doc what return the stats function. Any idea ? hiiamboris 21:17Number of bytes allocated. 21:31I figured how to write #macro1 without #macro3 and without even affecting nested blocks. I just need to list all blocks #macro1 appears in in some list, and check the blocks #macro2 appears in for presence in that list. 21:33Can even do parse-time checking in the macro pattern. Tuesday 6th September, 2022 bubnenkoff 09:05 f: func [] [print append "hello " "world"] I have only idea that it works in next way: hello and every series! point to it's container. That now block! and we bind it with block! and than we continue to append "word" to it hiiamboris 09:07no, no need to involve container at all 09:08I suggest seeing ?? f output after a few f calls bubnenkoff 09:19ah... it seems that I am begin to understand. first hello is series and we begin add to add data to it again and again because it's binded to with it in memory hiiamboris 09:21yes, append receives a series which it modifies *in place* 09:21it adds *directly* to "hello " we see 09:21we didn't copy it, so it grows 09:22in the same way when you write thing: [] you didn't copy the block that thing refers to 09:22so it will be modified bubnenkoff 09:36oh. Thanks! Now I understand the situation much better, but why first removing controls in my example works? hiiamboris 09:39because pane was assigned a block internally, then you appended to that block then you assigned your own block [] so the other one got lost together with it's faces but later you assigned the *same your* block again, you didn't change it, so you keep appending to it bubnenkoff 09:47Oh! Big thanks for explanation! It's hard to keep in mind specific of copy 11:24How to get coloring work immediately after adding control? on-change event to not handle default value: foo: function [] [ append ppp/pane layout/only compose/deep [ field data ["none"] on-change [either face/text == "none" [face/color: red] [face/color: none] ] ] ] view [ ppp: panel [ ] button [foo] ] hiiamboris 11:26at some point in foo you get a block of face! objects 11:26modify them bubnenkoff 11:39some point = button click event? hiiamboris 11:43that is an exercise for you bubnenkoff 11:44I remember that I can pass face to function, but I can't understand is it this case? hiiamboris 11:45you remember what kind of data is in pane? bubnenkoff 11:46pane with block that contain faces I think hiiamboris 11:47right 11:47you get these faces from somewhere 11:47modify them before appending bubnenkoff 11:56You mean this? foo: function [face] [ append ppp/pane layout/only compose/deep [ field with [color: red] data ["none"] on-change [either face/text == "none" [face/color: red] [face/color: none] ] ] ] view [ ppp: panel [ ] button [foo face] ] to bind it's with default color? 11:58or what kind of modifications I can do... hiiamboris 12:02sorry, I gave you too many hints already ;) 12:02it's up to you now to work it out bubnenkoff 12:02ok) thanks) hiiamboris 12:04I can only say it's sooo much simpler than what you're doing ;) 12:07@bubnenkoff maybe I don't get what you're trying to do though 12:08you already colored it, what's wrong with that? bubnenkoff 12:11I tried to get colorizing work without on-change event. Binding with color: red~~is solve my problem~~, but I thought that there is any other way to do it hiiamboris 12:13there's always another way.. bubnenkoff 12:14I was wrong that it solve problem) hiiamboris 12:15why not? :) bubnenkoff 12:15Because blank fields become red by default) 12:16[![изображение.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/CKjl/thumb/izobrazhenie.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/CKjl/izobrazhenie.png) hiiamboris 12:17when they *should* be red? bubnenkoff 12:19I need to colorize to red only none values at moment of it's adding hiiamboris 12:21try [reactivity](https://github.com/red/docs/blob/master/en/reactivity.adoc) bubnenkoff 12:49 bar: function [face] [ either (face/text = "none") [red] [none] ] foo: function [face] [ append ppp/pane layout/only compose/deep [ field data ["none"] react [ face/color: bar face ] ] ] view [ ppp: panel [ ] button [foo face] ] Do not work at all.... hiiamboris 12:50try inlining bar 12:51or, hackish way: react [ [face/text] face/color: bar face ] bubnenkoff 12:53one moment 12:55 foo: function [face] [ append ppp/pane layout/only [ field data ["none"] react [ face/color: either (face/text = "none") [red] [none] ] ] ] view [ ppp: panel [ ] button [foo face] ] is it right inline version? hiiamboris 12:55should be bubnenkoff 12:56But it's do not work :( hiiamboris 12:56works for me bubnenkoff 12:57And if you are changing value from none to any other it's work? and change color? hiiamboris 12:58![](https://i.gyazo.com/bf292283fa30bb06c5103cc158160778.gif) 12:58Red 0.6.4 for Windows built 3-Sep-2022/17:53:01+03:00 commit #cb83eca bubnenkoff 13:00wow! Cool! I will try to upgrade. My version is seems out of date: Red 0.6.4 for Windows built 3-Feb-2022/20:16:35+03:00 commit #fbdf84d hiiamboris 13:01https://github.com/red/red/issues/5103 was fixed recently, probably the case bubnenkoff 13:03yes, now it's works for me to 13:03thanks! hiiamboris 18:49@bubnenkoff try reading this please https://github.com/red/red/wiki/%5BDOC%5D-Why-you-have-to-copy-series-values#explanation-for-totally-hopeless-dummies Let me know if my explanation is clear enough for you or some parts need work. bubnenkoff 19:12Yes, I will read it now. It seems that I faced again with this problem. I really not understand how I am reach it %) pos: 70x0 data: [ foo: [] bar: [] ] add-item: func [face] [ ; clear ppp/pane ppp/pane: copy [] append data [ test: [] ] foo face ] foo: func [face] [ print "foo" walk: func [ data ] [ foreach [key value] data [ append face/parent/pane layout/only compose [at (pos: pos + 0x30) button (to-string key) [(add-item face)] ] ] ] walk data ] ui: [ size 300x500 button "add" [foo face] ppp: panel [ ] ] view ui The idea of code is next. First button is adding controls to face and by clicking of any control control add new controls to face (every added control should do same as first button). But they begin to multiply. I discovered :ppp and I am seeing that they are not removing, so it's issue with copy but I am doing: ppp/pane: copy [] hiiamboris 19:20you're not adding to ppp bubnenkoff 19:27> @bubnenkoff try reading this please https://github.com/red/red/wiki/%5BDOC%5D-Why-you-have-to-copy-series-values#explanation-for-totally-hopeless-dummies > Let me know if my explanation is clear enough for you or some parts need work. Yes, now it's much better. At least now I am understanding base idea. Maybe you should add some diagram like: `[ ]` <-- block is located in memory and can contain data. Every data with type series! Is binding with this memory block. `copy` is indicate that we should create new block in memory and use it instead old I am not sure if what I wrote is right, but it's my current vision %) 19:28> you're not adding to ppp Oh may bad, sorry. I tried to reproduce error and did mistake hiiamboris 19:29Thanks for your feedback bubnenkoff 19:34I can't to do short example of the bug, because short version works fine. But in long version https://gist.github.com/bubnenkoff/4f9c10b03086a0a3dbbc5f5ee84a2be4 I am getting stackoverflow error 19:36to reproduce you need to add block and click to added block button add block. Test block is named test so clicking on add block is cause an error 19:39[![изображение.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/PZro/thumb/izobrazhenie.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/PZro/izobrazhenie.png) hiiamboris 19:47I'm only getting: *** Script Error: append does not allow none! for its series argument *** Where: append *** Near : path-to-append [test: []] *** Stack: view do-events do-actor do-safe add-item bubnenkoff 19:49on gist above?? How it's possible? hiiamboris 19:50dunno, I'm clicking start then add block then add block near just added test field 19:50restart your console maybe bubnenkoff 19:50could you run it on fresh console with copy paste then: 1. click start 2. on customer click add block 3. on appeared test click add block hiiamboris 19:51oh reproduced 19:54It's as I thought... try ?? data after the error 19:55see anything wrong with it? bubnenkoff 19:56Yes, I am seeing. it seems I am doing append at wrong place 20:00But why it getting at recursion? I do not seeing place where is happens. I should be able to add test inside test hiiamboris 20:01you see ... in ?? data output? 20:01that means you appended something *to itself* bubnenkoff 20:02yes 20:03but why it begin to do it infinity? It should to do it only one time per click 20:11Oh, oh! It's seems I realized problem! 20:13I am finding path to append by block name, and here block name is same -- every time it's test. It's look like it's root of issue hiiamboris 20:16well if series is infinitely nested, stack overflow is expected when traversing it gurzgri 21:52@bubnenkoff Just for the fun of it, here's another parse based take on your find-path-to-node/walk approach, which gives equivalent results (probably minus the effects on extern words which you might rely on in other places): find-path-to-node: function [data node] [ path: copy [] parse data content: [any [ set step set-word! ahead block! ( append path to word! step) ( if equal? node step [return new-line/all path off]) into content ( take/last path) | 2 skip ]] none ] Wednesday 7th September, 2022 jasongrossman:matrix.org 04:57I'm using red on NixOS (which currently only has one version packaged, namely red 0.64 cli). Can someone please tell me where to see the command-line options of the red command? ty! riprwwa 05:33Have a look at the readme file in the root of the repo: https://github.com/red/red/blob/master/README.md Read below "The full command-line syntax is:" jasongrossman:matrix.org 05:47Thank you! bubnenkoff 07:33> @bubnenkoff Just for the fun of it, here's another parse based take on your find-path-to-node/walk approach, which gives equivalent results (probably minus the effects on extern words which you might rely on in other places): > > Red > find-path-to-node: function [data node] [ > path: copy [] > parse data content: [any [ > set step set-word! ahead block! > ( append path to word! step) > ( if equal? node step [return new-line/all path off]) > into content > ( take/last path) > | 2 skip > ]] > none > ] > Perfect! Thanks! 08:22Yesterday I thought that I have problem with recursion because I am trying to insert nodes with same name. But I was wrong. https://gist.github.com/bubnenkoff/67026416635b3c62f6ddcfd08ab419b2 I made node name unique but I am still getting infinity loop and stack overflow. And I can't understand why. Yes, I tried to dump data but I can't understand how it possible in my code. I do not see nothing that can trigger infinity adding. Steps to reproduce: 1 click start 2 on customer click add block 3 on appeared random name click add block hiiamboris 08:39I won't be able to tell a thing in such a big script ;) 08:40I suggest removing irrelevant stuff until it becomes small enough to understand 08:41For example, you don't need any View-related stuff if it's the data you can't get right. Work on data first. 08:43And you don't need walk either, unless it modifies data bubnenkoff 09:01 if block [ append reduce to-path path-to-append compose [ (wrd-name) [] ] ; triggering stackoverflow ; append reduce to-path [data lots lot] compose [ (wrd-name) [] ] ; works ] I do not see principal differene between hardcoded path and auto generated path like: [lots customers fbgadec]. What I can try to do else? hiiamboris 09:03have you compared [data lots lot] to path-to-append? 09:04perhaps latter keeps growing? bubnenkoff 09:13 prin "we will appeded to: " probe path-to-append wrd-name: to-set-word random "abcdefg" if block [ append reduce to-path path-to-append compose [ (wrd-name) [] ] ; triggering stackoverflow ; append reduce to-path [data lots customers customer] compose [ (wrd-name) [] ] ; works ] click on cuctomer: we will appeded to: [data lots customers customer] click on new added to customer block named efdbcga: we will appeded to: [data lots customers customer efdbcga] and then crush it's look like correct. 09:15after first click on customer data become: ... customers: [ customer: [ name: none efdbcga: [] ; it's looks right ] ] hiiamboris 09:19find the point when data becomes cyclic bubnenkoff 09:32hm... I have filling that it's issue with copy. I can't explain exactly but: append reduce to-path path-to-append compose [ (wrd-name) [] ] ; possible I should copy [] here hiiamboris 09:33try it bubnenkoff 09:42Yes! I was right! But I do not understand why I should use copy here(( append reduce to-path path-to-append reduce [ wrd-name copy [] ] ; works gurzgri 10:38That's because according to first spec-of :reduce ;== {Returns a copy of a block, evaluating all expressions} reduce only returns a copy of the one outer block, it doesn't copy all series in that block. bubnenkoff 12:32Eght... tiny example with inline reactivity works fine: foo: function [face] [ append ppp/pane layout/only [ field data ["none"] react [ face/color: either any [(face/text = "none") ((length? face/text) < 2 )] [red] [none] ] ] ] view [ ppp: panel [ ] button [foo face] ] But same condition do not work at bigger project: https://gist.github.com/bubnenkoff/f6d01055c91d2c3a4a319993a81bf035#file-app-red-L176 Nothing do not colorize on none and length < 2 hiiamboris 12:35that snippet doesn't work at all bubnenkoff 12:36[![изображение.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/UX5Z/thumb/izobrazhenie.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/UX5Z/izobrazhenie.png) 12:36fresh console hiiamboris 12:39 *** Syntax Error: (line 149) missing [ at ] *** Where: transcode *** Near : https://gist.githubusercontent.com/bubne *** Stack: load 12:39the big one bubnenkoff 12:39Ah, one moment I will recheck it 12:41I tried to open fresh console. than did copy-paste from raw gist to console and I do not see any errors hiiamboris 12:44well, why can't I? 12:44ohh 12:45that's so weird bubnenkoff 12:45get it work? hiiamboris 12:45it works with Ctrl+V but not with do load or do read-clipboard 12:45wtf 12:47I get it 12:47console simply ignores extra ] you put on the line bubnenkoff 12:48Does colorize work for you? hiiamboris 12:49nope 12:51you're composing it all out 12:51check the layout spec after composing bubnenkoff 12:53> Eght... tiny example with inline reactivity works fine: > > foo: function [face] [ > append ppp/pane layout/only [ field data ["none"] react [ face/color: either any [(face/text = "none") ((length? face/text) < 2 )] [red] [none] ] ] > ] > view [ ppp: panel [ ] button [foo face] ] > > > But same condition do not work at bigger project: > https://gist.github.com/bubnenkoff/f6d01055c91d2c3a4a319993a81bf035#file-app-red-L176 > > Nothing do not colorize on none and length < 2 > > So you are seeing difference in layout in this tiny example and in big code? hiiamboris 12:55I didn't check TBH but I spotted compose/deep and parens ;) 12:56compose is quite evil design bubnenkoff 12:58yes) I understood) 15:42Heh) is it possible to write next code without round brackets? if ((length? "asd") < 4) [print "less"] hiiamboris 15:43if 4 > length? "asd" 15:43if lesser? length? "asd" 4 bubnenkoff 15:48oh! Cool! Thanks! greggirwin 17:36> compose is quite evil design I've never felt that way. Some patterns aren't a good fit for it, hence Ladislav's build dialect idea and others. e.g. [my inject experiment](https://gist.github.com/greggirwin/29836d25de0c68eaba0e6dbd268a20f5), but that doesn't make it evil. hiiamboris 17:37It's evil because it keeps biting you from time to time when you least expect it. 17:38It's fine for single-line of code composition, even a few short ones, but we are actually promoting it's use even on View layouts. For that it's a very bad design. 17:39I can't count times when I was writing parens totally forgetting that I'm writing them inside some big compose/deep scope. greggirwin 17:46That's funny reasoning. hiiamboris 17:59Why? ;) gurzgri 18:03> forgetting that I'm writing them inside some big compose/deep scope compose and I are best friends since the beginning, but whenever compose was in involved in bugs in my code, it was for this very /deep reason. hiiamboris 18:04exactly gurzgri 18:11@bubnenkoff > Perfect! Thanks! You're welcome! But that find-path-to-node version comes with a special restrictive license attached: You're only allowed to use it in your code if you can credibly assure that you've processed and digested it and understand how and why it is working :wink: bubnenkoff 18:26Is it possible to remove foo: [] at one step? data: [ foo: [] bar: [] ] remove data 'foo ; the block will stay hiiamboris 18:27? remove bubnenkoff 18:27@gurzgri yes, I understand this problem) So often prefer write my own code even if there is some shorter alternative, because at least I can fix my own greggirwin 18:29@hiiamboris wouldn't that line of thinking make a *lot* of constructs "evil"? You say it's bitten you, and your own coding patterns or style don't fit well with it. That doesn't make it evil, or a bad design. That's on you. :^) Saying it's a bad design also implies that there's a better one, would you agree? If so, where is it? bubnenkoff 18:29@hiiamboris yes I did it. but remove/partis require to know position of removing element hiiamboris 18:31@greggirwin It's bitten me, Christian, Dmitry, Giuseppe, Ladislav - at least these are who testified. 18:31> Saying it's a bad design also implies that there's a better one, would you agree? If so, where is it? https://codeberg.org/hiiamboris/red-common/src/branch/master/reshape.md 18:32(but really, just using a not so common marker would both kill /only and get rid of bugs) 18:34(some parts in reshape design require it to walk backwards, which is powerful but also slower, so those parts are not for max juice) 18:36(optional /deep in compose is also a performance thing) 18:41> @hiiamboris yes I did it. but remove/partis require to know position of removing element re-read it @bubnenkoff bubnenkoff 18:49> > @hiiamboris yes I did it. but remove/partis require to know position of removing element > > re-read it @bubnenkoff data: [ foo: [] bar: [] baz: [] ] remove/part data 2 'bar probe data == [bar: [] baz: []] /part => Removes a number of values, or values up to the given series index. So I need to know index hiiamboris 18:52> Removes **a number of** values 18:53anyway, you *always* know the index, if you wanna do it the hard way ;) greggirwin 18:57I remember reshape now @hiiamboris. Our own design tastes can be quite distinct. I know mine can. So when I say that reshape is a massively more complex design and interface that doesn't make sense to me, that's my opinion. I'm happy for others to try it and weigh in, but it's certainly not *better* than compose IMO. Like the mutability question, compose is very simple to reason about, with a few limitations that we run up against sometimes. Omitting values is a big one. As far as complaints against compose, I don't remember a lot through the years, compared to how much it is used. hiiamboris 18:59you're ignoring my point: > (but really, just using a not so common marker would both kill /only and get rid of bugs) greggirwin 19:05So let's focus on that and try it out. 19:07Which I think was Ladislav's goal, and also mine when I updated his ideas to play. gurzgri 20:51I second that motion, neither compose nor compose/deep are bad by themself and I wouldn't want to do without them. They are just not the best solution especially for cases where compose/deep and the paren markers are far away from each other — not so much when you write *new* code but modify/refactor *old* code. An easy oversight then, with a better aka "safer" solution yet to be proposed (at least I know of none which over time I preferred over the occasional bug hunting session). hiiamboris 21:13> a better aka "safer" solution yet to be proposed There are many ways you can make parens unique, from a sigil like @() !() ~() &() to refinements /splice () /single () /only () /mixin () /the () /just () /inline (), to tags () ..., to issues #splice () ..., to prefix(es) of your own choice on a per-call basis. 21:15Anyway, I'm using reshape in non-critical code all the time. If !() and @() are too hard to grok for someone, it's not my trouble ;) Thursday 8th September, 2022 cosacam1 02:09@bubnenkoff make data point to foo ie., make foo the first elememt in data. Then loop 2 [remove data] That removes both foo and the block. 02:12BTW did you see the application I put in gist ? jasongrossman:matrix.org 02:59It seems that the syntax for extending objects is not working, unless I'm misunderstanding something: a: make object! [] extend a [newfield 99] *** Internal Error: reserved for future use (or not yet implemented) *** Where: extend *** Stack: I can extend objects like this instead - is the best way to do it? a: make a object [newfield: 99] Thank you! greggirwin 03:04Yes, extending objects is TBD, so you have to make a new one right now. 03:05But you can make the new one using just a spec block as well: >> o: object [a: 1] == make object! [ a: 1 ] >> make o [b: 2] == make object! [ a: 1 b: 2 ] jasongrossman:matrix.org 03:07Awesome. Thanks! 03:28I'm missing something basic about Red data structures :-( I'd like to make a bidirectional mapping between one set of paths and another set of paths. If I use a map!, I can't see how to search both the keys and the values. Probably I'm just being blind to the right bit of documentation - sorry. I can see how to search nicely in objects, but a path is not a word so it can't be a key in an object, right? 03:31dockimbel (Nenad Rakocevic) recently said "The real challenge is the bijective text<=>values mapping", but that was in a different context ... I hope! hiiamboris 06:45Use a block or hash. bubnenkoff 07:03@cosacam1 could you give link again, it seems that I missed something... Very soon I will public my code. I almost get it work. 09:05[![изображение.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/wutl/thumb/izobrazhenie.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/wutl/izobrazhenie.png) 09:05I did it! I get it work. Full code (need some cleanup) https://gist.github.com/bubnenkoff/5fc06bdab712130108c9b2041a845b8d For those who do not want to run it how it's look like: dockimbel 10:16@bubnenkoff Congrats! :+1: bubnenkoff 12:07Is there any simple way to add scroller to main app window if content is not feat in it? view [ size 150x150 button "aa" return button "bb" return button "cc" return button "dd" return button "ee" return button "ff" return button "gg" below scroller [ ] ] (code not works) I looked at examples here and all of them with calculation of elements size manually hiiamboris 12:14https://codeberg.org/hiiamboris/red-common/src/branch/master/scrollpanel.md 12:15As far as simple goes... bubnenkoff 12:20I'd prefer native solution even if it would not so accurate. I am not fully understand how scroller works. It's face, but if I am typing it in console it look like data type: >> ? scroller! SCROLLER! is an object! with the following words and values: position none! none page-size none! none min-size integer! 1 max-size none! none visible? logic! true vertical? logic! true parent none! none on-change* function! [word old new] hiiamboris 12:31It's half baked so good luck ;) 12:35Use scroller VID style. 12:35But beware: 2D scrolling panel is one of the trickiest widgets to get right ;) 12:37If you only need vertical scroller IIRC there's some hack to get it to show for a base face (which can also act as a panel IIRC), using get-scroller func 12:39I have some examples stashed, probably from Toomas: view [ size 390x220 across space 0x0 panel 350x200 [ origin 0x0 space 0x0 p: panel 350x800 [ origin 0x0 space 0x0 below area "A" 350x200 area "B" 350x200 area "C" 350x200 area "D" 350x200 ] ] scroller 16x200 [ face/data: min .75 face/data p/offset/y: to integer! negate 800 * face/data ] on-created [face/selected: 25%] ] 12:39 view [ size 390x220 across space 0x0 base 367x200 with [ flags: 'scrollable pane: layout/only [ origin 0x0 space 0x0 p: panel 350x800 [ origin 0x0 space 0x0 below area "A" 350x200 area "B" 350x200 area "C" 350x200 area "D" 350x200 ] ] ] on-created [ put get-scroller face 'horizontal 'visible? no sc: get-scroller face 'vertical sc/position: 0 sc/page-size: 200 sc/max-size: 800 ] on-scroll [ sc/position: max 0 min 600 switch event/key [ down [sc/position + 20] up [sc/position - 20] page-down [sc/position + sc/page-size] page-up [sc/position - sc/page-size] track [event/picked - 1] end [sc/position] ] p/offset: as-pair 0 negate sc/position ] ] 12:41But base as panel probably doesn't work since D2D merge. bubnenkoff 12:42Ogh..)) new challenge) 12:42Does this problem solved in Spaces? hiiamboris 12:43Indeed, but you can't use View faces inside Spaces. bubnenkoff 12:43> Use scroller VID style. Examples above not about it? Could you show what is scroller VID style. hiiamboris 12:43First is dockimbel 14:30@bubnenkoff You can use the built-in scroller widget, it's not that hard, even if it's currently limited: https://gist.github.com/dockimbel/8a5bcf3acb470d0dd9f4dd0a07da7817 greggirwin 18:30> I'd like to make a bidirectional mapping between one set of paths and another set of paths. @jasongrossman:matrix.org do you have an example in another lang that shows how you do it? As @hiiamboris said you can use a block or hash, but path *notation* is always "forward looking" i.e., select the next value in the path after the key. So if you do a key-val block, you'll need helpers to step backwards from the value. Whether your keys and values are guaranteed to be unique also comes into play. You can also do fun things, like this: blk: [k1 v1 k1 k2 v2 k2 k3 v3 k3] blk/k1 blk/v2 blk/k3 blk/v3 Paste that into a Red console and see if you understand what it's doing. And does it work with select? Does it work if the keys or values are not unique? cosacam1 19:47@bubnenkoff here is my link 19:51https://gist.github.com/cosacam1/0e5702505c92a5e1f34e69e94f264d7e jasongrossman:matrix.org 22:23@greggirwin (Gregg Irwin) Thank you! That gives me a lot to think about. I think you've already answered my main question, which is what is idiomatic in Red. I love the blk: [k1 v1 k1 k2 v2 k2 k3 v3 k3] example. 22:26As for examples in other languages: in many other languages, maps can have any datatype as their keys. In some other languages (e.g. Smalltalk, Self, Io), even objects can have any datatype as their field names. In Red I can't have paths (or strings) as keys in maps or as field names in objects, right? But I can have them in blocks. So I think I now have enough to go on. Thank you! 22:30My subsidiary question was about whether I could search for values in maps the way I can in objects ... but now I think I should give up on maps (because they can't have paths, or even strings, as keys). That leaves blocks, and I think I understand searching in blocks. Your points will help me check that I do. greggirwin 22:41Strings as keys work just fine. >> m-1: #("A" 1 "B" 2) == #( "A" 1 "B" 2 ) >> m-1/"A" == 1 >> m-1/"B" == 2 Finding works on values-of, but maps are unordered, so you can really only tell if a value exists, not which key it maps to. At least there are no guarantees, but for now you can use index? to check the position against keys-of. You're correct that you can't use block types (of which paths are one) as map keys. jasongrossman:matrix.org 22:42Oh! 22:42Can't think why I thought otherwise - I may have experimentad and made a typo. 22:42Thank you! greggirwin 22:42Happens to us all. :^) jasongrossman:matrix.org 22:43And as it happens, for my current use-case, finding which values exist is useful even without knowing their positions \o/ 22:43But in general it would probably be more idiomatic to use blocks, right, if that's not too vague a question? greggirwin 22:46Blocks are the most idiomatic compound type/data structure in Red, yes. But the others offer advantages and features of their own. It's all about matching them to the need. Start small and try with each type, see where you run into issues, and ask questions here with your use case as a backdrop. We call it "The Great Red Optimizer" and you'll get lots of wacky ideas sometimes. jasongrossman:matrix.org 22:47That makes complete sense. Thank you very much! Friday 9th September, 2022 ldci 05:55@jasongrossman:matrix.org . For map datatype, some examples here: https://github.com/ldci/Red-System/tree/main/Map jasongrossman:matrix.org 05:59Ooh thank you ldci 06:09@jasongrossman:matrix.org You’re welcome bubnenkoff 09:38> https://gist.github.com/cosacam1/0e5702505c92a5e1f34e69e94f264d7e Thanks! Looks cool! cosacam1 12:59@bubnenkoff I solved the scroller problem this way: In the view, I put a background panel (pnlBg) with a foreground panel (pnlFg) inside it. pnlFg might be vertically smaller, larger or equal than pnlBg. I also have a vertical scroller (scr) the same height as pnlBg. pnlFg/pane contains the widgets (fields, buttons, whatever) Then scr/extra will have the difference in size between both panels. scr/extra: pnlBg/size/y - pnlFg/size/x The difference will be negative when pnlFg is larger than pnlBg, that is how much of pnlFg is beyond pnlBg. (Negative to make easier the math in scroll function below) Make scroller visible only in that case because it is then when scroller is only needed scr/visible?: scr/extra < 0 Then I put this scroll function. It moves pnlFg (and all the widgets in it) vertically because the x remains the same. How much do we move it? Well, the part of pnlFg that is not visible originally, affected by scroller's data. When that data is 0.0, pnlFg's top will be aligned to pnlBg's top. When scroller's data is 1.0 then pnlFg's bottom will be aligned to pnlBg's bottom. Other values show pnlFg partially. By the way, I have noticed that if I drag the scroller's thumb (or click the scoller's down arrow) to it's bottom, scroller's data never gets to 1.0 but 0.91 (I think is Red's bug, sorry I never reported before) So I force it to 1.0. That behaviour is not present if I scroll using mouse wheel. So let's try it: 13:01 Red [needs 'view] scroll: does [ if scr/data > 0.91 [scr/data: 1.0] pnlFg/offset: as-pair pnlFg/offset/x (scr/extra * scr/data) ] clamp: func [lo value hi] [min max lo value hi] ; a function to keep a value between boundaries system/view/auto-sync?: yes ; to avoid flickering view [ pnlBg: panel blue 200x100 [ at 10x0 pnlFg: panel yellow 180x250 [ ; I make pnlFg larger than pnlBg on purpose, and narrower too below check "Hi" field hint "type here" b: box red button "Press here" [b/color: random 255.255.255] ] on-wheel [ if scr/visible? [ ;system/view/auto-sync?: yes uncomment this in case your code disables sync at any time ; next 0.91 is because of the bug (if any) ; I force it to 1.0 in scroll function but then, ; when scrolling via mouse wheel towards the top, it does not scroll ; so I force it back to 1.0 to make it work scr/data: clamp 0.0 ((min 0.91 scr/data) + (scr/steps * negate event/picked)) 1.0 scroll ] ] ] space 0x0 ; may the scroller be adyacent to pnlBg scr: scroller 20x100 [system/view/auto-sync?: yes scroll] ; about sync, same as above do [scr/extra: pnlBg/size/y - pnlFg/size/y scr/visible?: scr/extra < 0] ] 13:24@hiiamboris I tried both of your solutions for scrolling. The second one doesn't show the areas. I can't see why 13:42About Red's bug on scrolling, I said before if I drag the scroller's thumb (or click the scoller's down arrow) to it's bottom, scroller's data never gets to 1.0 but 0.91 Well, actually it is only when dragging the thumb. See next example and try to drag the thumb to the right end view [t: text scroller [t/text: to-string face/data]] hiiamboris 14:26> @hiiamboris I tried both of your solutions for scrolling. The second one doesn't show the areas. I can't see why @cosacam1 > But base as panel probably doesn't work since D2D merge. (i.e. it was a dirty hack and not supported anymore) 14:27> About Red's bug on scrolling It's data + page-size that equals 1 bubnenkoff 14:35I need to change one set-word! to another inside block. I know only it's index. It I tried: x: [foo: none bar: none baz: none] ; need get: [test: none bar: none baz: none] change/part x 1 (to-set-word 'test) probe x But got an error: *** Script Error: change/part does not allow set-word! for its range argument gurzgri 14:36> It's data + page-size that equals 1 And therefore scroller shouldn't be confused with slider, with the latter going up to 1 as in view [t: text slider [t/text: to-string face/data]] bubnenkoff 14:37it seems that it's work: x: [foo: none bar: none baz: none] change at x 1 (to-set-word 'test) probe x == [test: none bar: none baz: none] gurzgri 14:37poke x 1 to set-word! 'test 14:39Think of poke complementing pick, setting a value at given index instead of getting it from there. bubnenkoff 14:39thanks! gurzgri 14:40The difference between your change at and poke isn't that big and change at reads nicely, too. But it's two funtions instead of one. cosacam1 14:43Oh, I see the point. Not the same scroller asslider. However a little confusing. I think data = 1.0 is expected when reaching the bottom. Ok, I can live with that. Thanks both. hiiamboris 14:44@cosacam1 I've stumbled upon that myself before ;) toomasv 14:45> (i.e. it was a dirty hack and not supported anymore) Only second half of this is true. [Docs](https://github.com/red/docs/blob/master/en/view.adoc#base): > This face type should be used for any custom graphic component implementation. hiiamboris 14:45I think that means using Draw, not native faces 14:46Found https://github.com/red/red/issues/5051 14:46It can show other bases toomasv 14:51You mean only Draw is *graphic component*? hiiamboris 14:52I mean using Draw to create graphic components, like what Spaces are doing (or your table ;). toomasv 14:58I guess general understanding is that any face in *view* is *graphic*, i.e. has graphic aspect about it, is graphically presented. To narrow this to *drawn base faces* only is really stretching the meaning of *graphic*, IMO. Although in practice you are right and docs are wrong. :) hiiamboris 15:05I understand the docs as base is used to implement graphic components, but that does not imply that other graphic components can be grouped together in a base for that ;) 15:06Good idea to use pane for caret face by the way. 15:08Although.. maybe not as it could steal focus when clicked. cosacam1 17:00I've just downloaded Red 0.6.4 of today Sep 9, 2022. How can I know the differences from a previous version? hiiamboris 17:13https://github.com/red/red/commits/master cosacam1 17:58so there is where we can see how hard you guys work! congrats! hiiamboris 18:23(; cosacam1 20:53My IDE is RedEditor-11 (Notepad++) I always run (interpret) my program with the blue play button, and only when it's already tested I compile it with the other button (the one with a gear). However, I installed today the most recent version of Red and when I use the play button to interpret the code it shows a window telling me that the Console process is still running. I click the Kill button and the message closes. When I press run again, it happens the same. It didn't happen with my previous Red version which was 0.6.4 July 25. Any idea? hiiamboris 21:03run it from the terminal and look at the output cosacam1 21:17it runs fine from the console. The question is how do I make Notepad++ to use the previous version of Red? hiiamboris 21:21maybe some notepad++ users will read this chat cosacam1 21:22Ok, I gotta go. I will try next week. Have a happy week-end everybody. greggirwin 22:20@cosacam1 I haven't looked at my NP++ config here, as I rarely fire it up. I did have to reprogram everything in UltraEdit with the change in the Red exes. Saturday 10th September, 2022 koba-yu 05:51Hi, are there any defined / conventional methods to check the code is running under console or compiled executable? I guess I saw some before but cannot remember now... 06:01Ah, system/state/interpreted? maybe? hiiamboris 06:43I think I was checking system/options/script for none value when compiled. 06:43@dockimbel should know a proper way ;) koba-yu 06:46@hiiamboris Thank you. system/state/interpred? seems working so far. I'll keep in mind the way you taught too. hiiamboris 06:52try to compile: Red [] probe system/state/interpreted? probe do [system/state/interpreted?] koba-yu 08:11@hiiamboris I see, so interpreted? seems not for my purpose strictly. Thank you! 08:16I have pushed a new repo to GitHub. I appreciate if you have some coding advice or something like that. I want to write another personal blog post for this later. https://github.com/koba-yu/red-image-viewer hiiamboris 08:25instead of interpreted, check for attempt [system/console/gui?] for your case 08:25I also suggest scaling the image so it fits the window 08:26also ... button with request-dir (UX wise) 08:27also after a few images it stopped updating the display, apparently got some decoding error and stalled on it (make it recover from errors ;) 08:29also it just crashed my console ;) but this I will deal with myself... interesting, as well as that decoding error koba-yu 09:00@hiiamboris Thank you, Il’ll check👍 hiiamboris 09:22okay it's an out of memory related crash 09:23basically 5-7 photos is the limit before it reaches 2.2GB ;) 09:35@koba-yu I think that's because you reload all images on every next click 09:36(even though a single image doesn't fit the screen) koba-yu 09:40@hiiamboris Thank you, actually I made this app for viewing many small images for my AI related work. So the program not considered deeply to process big image at current commit 😅 I would keep improving! hiiamboris 09:45:+1: Sunday 11st September, 2022 bubnenkoff 08:39 foo: function[name /extern name] [ name: to-word name prin "inside function:" probe name ] foo 'fooo probe name Should name become available outside foo? I am getting an error: *** Script Error: name has no value hiiamboris 08:40I think this should raise an invalid spec error. @dockimbel ? bubnenkoff 08:52How it's correct to say: "word do not become global available" or "word do not binded to global context"? hiiamboris 08:55"is not bound to the global context" is more to the point, but we'll understand either way rebolek 09:00Agreed, [name /extern name] should raise an error. bubnenkoff 09:25I have got a question about my code: https://gist.github.com/bubnenkoff/8b6e3846f56c8060dc2a9acb3b23dd61 Even on this tiny example I am getting blinking on operation on data adding\removing (copy-paste to red and push add buttons). On bigger data structure the blinking become more annoying and time delays become bigger. it's error in architecture? and it possible to do it fast, or it's feature of VID? And it's not possible to solve it? gurzgri 09:26@bubnenkoff Anyways, do yourself a favour and try harder to do without /extern words in functions. Your future debugging self will be grateful … ;^) bubnenkoff 09:29> @bubnenkoff Anyways, do yourself a favour and try harder to do without /extern words in functions. Your future debugging self will be grateful … ;^) You mean that I should to prefer func when I there is no any other reason to make all data local? gurzgri 09:34Re: blinking - Sounds like you‘re relayouting the whole layout instead of adding/modifying/removing only the faces with actual changes. 09:41Re: No, the other way around. Try harder to let functions only work on the „outer world“ thru passed arguments and return values only instead of modifying words from outer contexts in functions. Way harder to avoid unwanted side effects if functions modify „random“ things, and harder to test too. You can not easily test a sinhle function that way and can‘t depend that the outcome of a function is dependend on the arguments only instead of random other application state. 09:43*sinhle = single, *can‘t depend … = can‘t rely on the outcome of s function being dependend … bubnenkoff 09:46 Re: blinking - Sounds like you‘re relayouting the whole layout instead of adding/modifying/removing only the faces with actual changes. But in code I am updating data (removing and adding) only to panel (ppp).> hiiamboris 09:48I suggest instead of assigning a new pane, modify the old one. gurzgri 10:00This. Another obvious improvement would be having each nesting level in a panel of it's own. That way you can easily get indention for free and have finer control on what is changed / needs to be redrawn. And a panels vertical offset and size could easily be calculated using reactivity then, depending on offset. But the key point really is not creating everything for every change. 10:04append ppp/pane layout/only is the culprit. It re-creates each and every face on every change. You'd be better off creating faces manually with make-face instead of creating a full VID layout spec of the entirety of faces each time something gets added/removed. hiiamboris 10:06also this ppp/pane: copy [] ;) 10:14on panels, it's a good advice to simplify code management, but changing offsets does seem to cause any flicker: view compose/deep [panel 300x300 [(loop 50 [append [] compose [at (random 270x270) field (random white) 30x30 rate 70 on-time [face/offset: max 0x0 min 270x270 face/offset - 2 + random 3x3]]])]] gurzgri 10:38No one *said* re-offsetting faces causes the flicker ;) hiiamboris 10:41sure, just clarifying :) Boum69 17:09Is it possible to use on Windows a non installed font with VID ? Same question with Rebol please. 😉 hiiamboris 18:01@qtxie might know rebolek 18:06AFAIK it's not possible bubnenkoff 18:06hm... save/write map! with #() like: #(a: 1) How to write: a: 1 hiiamboris 18:07convert to block greggirwin 18:08Native widgets require installed fonts. I think even under R2 they had to be installed in the system, because Rebol still used the OS for drawing, just selecting them into a DC I imagine. Boum69 18:19Ok , thanks all of you. I've spent a few hours to find a solution. Now, I know I is not possible for the moment unless @qtxie had a solution ? gurzgri 21:30@bubnenkoff I have put something together along the lines of your key:value editor, see the code at https://gist.github.com/gurzgri/895e8f3f5fe1caf16279725138567389 * using panels there for easier implementation of nesting levels / indention * dynamically created faces with make-face * still some flickering, but limited to the tree level just edited (probably related to using OS widgets) * added vertical / horizontal scrolling with scrollers and by mouse wheel * added a load-from block / save-into block mechanism Have fun studying (for more improvements probably ask @hiiamboris)! hiiamboris 21:38> "Give @bubnenkoff something to study. :^)" ☻ 21:38Great as always, @gurzgri :clap: greggirwin 22:19Indeed. Very nice @gurzgri. I get errors on the save button, and hint for those would be helpful. :^) gurzgri 22:47Thanks to both of you. Argh, it's always these simple last minute name changes ... fixed. Re: Hints - Yes indeed, thanks for the hint ;) 22:49My idiom of the day btw is add silver random coal, I'm sure I never picked a random pale color that way before :) 22:54@hiiamboris How to let root/offset react on the two scroller's data instead of setting it thru their on-change actors, any idea? Didn't managed to do so. Monday 12nd September, 2022 ldci 02:36@Boum69. For fonts testing: https://github.com/ldci/Red-System/tree/main/Fonts Boum69 03:26Good morning ; ) and thank you @ldci . hiiamboris 07:22> @hiiamboris How to let root/offset react on the two scroller's data instead of setting it thru their on-change actors, any idea? Didn't managed to do so. I just replaced on-change with react in your code and it works for me @gurzgri gurzgri 07:54Oh, thanks man! This is interesting, I‘ve tried adding it as react later to the root face (because it seemed to make more sense over there too me, it‘s root reacting to the scrollers). Will have a deeper look this evening. hiiamboris 07:56Objects must exist at react's block parsing time gurzgri 08:21Makes sense. I assumed later to deal with that since it didn‘t complain. hiiamboris 08:23later just skips initial reaction evaluation 08:24But it retrieves all reactive sources at parsing time anyway bubnenkoff 09:06 mmm: #( test: [ foo: function [value] [ print ["value: " value] ] ] ) mmm/test/foo 'hello I am trying to call function foo what I am missing? 09:08> @bubnenkoff I have put something together along the lines of your key:value editor, see the code at https://gist.github.com/gurzgri/895e8f3f5fe1caf16279725138567389 > * using panels there for easier implementation of nesting levels / indention > * dynamically created faces with make-face > * still some flickering, but limited to the tree level just edited (probably related to using OS widgets) > * added vertical / horizontal scrolling with scrollers and by mouse wheel > * added a load-from block / save-into block mechanism > Have fun studying (for more improvements probably ask @hiiamboris)! Wow!!! Thanks! Looks perfect! hiiamboris 09:12inspect your block, values of what types do you have there? bubnenkoff 09:15> inspect your block, values of what types do you have there? >> type? mmm/test/foo == word! rebolek 09:18> what I am missing? You are missing the basic rule of Redbol languages - everything is data until it's evaluated. Try length? mmm/test. I guess you expect it to be 2 but you'll be surprised that it's 4. Why is that? Because the block! assigned to testwasn't evaluated. dockimbel 09:27> I am trying to call function foo what I am missing? There is no "function foo", it does not exist, that's why you can't call it. bubnenkoff 09:28So I should reduce mmm/test to be able to call foo ? rebolek 09:30Yes, you need to reduce, but let's ask first, why do you have such structure? Function in a block in a map? Just because it's possible doesn't mean you should do it. bubnenkoff 09:33@rebolek because I am writing rules for processing data and every I put every possible operation on data in such structure 09:36 mmm: #( test: [ foo: function [value] [ print ["value: " value] ] ] ) reduce mmm/test foo "hello" this works rebolek 09:37Yes, but is this structure really the best structure for the task? bubnenkoff 09:41The problem of code above that foo become available in global context. Is there any way to prevent it. @rebolek one moment I will explain what I am doing on better example rebolek 09:42> The problem of code above that foo become available in global context. Is there any way to prevent it. Of course. Don't use function in a block in a map, use a function in a context. bubnenkoff 09:44@rebolek Example: notifications_section: #( KBKCode: [ ; tag for checking action: function [value] [ x: none result: rejoin parse value [collect some [ digit | keep skip ] ] ; if not empty? result [x: result] return x ] dist: 'KBKCode_letter ; tag for saving result ] ) The idea is next. Some sections have tags that require some manipulation and saving result to other tag. hiiamboris 09:47> Is there any way to prevent it. Walk backwards. Write down how the resulting block should look like, then figure out what to do with the source block to achieve that. bubnenkoff 10:00> > The problem of code above that foo become available in global context. Is there any way to prevent it. > > Of course. Don't use function in a block in a map, use a function in a context. your are suggesting structure like: mmm: [ test: context [ foo: function [value] [ print ["value: " value] ] ] ] rebolek 10:19for example bubnenkoff 10:34> In Rebol2 and Red, contexts can be extended only by cloning operation (make ), in Rebol3, object can be extended using series actions. I was not for that change, as it was blurring the lines between objects and series (not even mentioning maps). I personnaly had no need for expandable objects, just maybe for some specific cases, where reconstructing the whole objects with the right binding would have been too expensive/complex. So I was in favor of just an extend native, which would allow extending objects in-place (and would work only on objects, so avoiding confusion with series). In Red, I plan to add extend, though, it would probably make objects access path compilation much less efficient a priori, so I need to find a way to avoid the speed penalty for that first. Do I understand correctly that nothing has changed since then and you can only create a fill object at creation? hiiamboris 10:48Yes bubnenkoff 12:32 complex-obj: make object! [ notifications_section: [ tag1: [ action: function [value] [ print ["some operation: " value ] ] dist: 'KBKCode_letter ] ] ] Can't understand to make tag1/action binded to context of object. this code is make action is available from global context: reduce complex-obj/notifications_section/tag1 action "hello" hiiamboris 12:36same as this: >> o: object [ [x: 1] ] == make object! [] ;) oh look! no X! bubnenkoff 12:50> same as this: > > >> o: object [ [x: 1] ] > == make object! [] ;) oh look! no X! > notifications_section and tag1 should also be objects in my example? 12:57 complex-obj: object [ notifications_section: object [ tag1: object [ action: function [value] [ print ["some operation: " value ] ] dist: 'KBKCode_letter ] ] ] aaa: reduce complex-obj bbb: reduce aaa/notifications_section ccc: reduce bbb/tag1 ccc/action "hello" Could this reduce chain be simplified? hiiamboris 12:58Like I said: > Walk backwards. Write down how the resulting block should look like, then figure out what to do with the source block to achieve that. 12:59You have at this moment no idea what you're even doing. Just randomly adding stuff. 13:01You're not an [infinite monkey](https://en.wikipedia.org/wiki/Infinite_monkey_theorem), you cannot afford billions of years for this task ;) bubnenkoff 13:04This moment I understand) But I have doubt about how result block should look like, because I need to simplify it's creation and stay it's isolate hiiamboris 13:45Always start simple, and only extend it when there's no other way greggirwin 17:01@bubnenkoff to @hiiamboris' point, there is a big risk in trying advanced things, which you can't solve yourself, and getting help here. We all do want to help, but if you don't take the time to *really* understand things, you may end up in a situation where you can't maintain the code you have because you don't understand it. I imagine most of us will agree that Boris' advice to "start small" is good. Don't just use your existing code to understand. Use generic bits. Get to really understand blocks, objects, maps, and evaluation, including what context words are bound (set) to. cosacam1 17:50@bubnenkoff Do you understand Object Oriented Programming? In Rebol/Red or other language? If not, we can help. bubnenkoff 18:23@greggirwin thanks, I will try) @cosacam1 yes, I understand, but I think that OOP in Red is significantly difference from other langues cosacam1 19:14Not too much. Basically, there are no classes and instances, only objects. They have attributes and methods i.e. variables ,(actually words) and functions. Use those vars and functions asv regular ones just remembering they are members of (bibded to) the object. 19:27Typo: Not bibded but binded 19:54Objects can be made with make object! or copied from other object as in john-alias: copy john where every change in john will be reflected in john-alias. Finally objects can inherit attributes and methods from other object or objects (multiple inheritance) as in other-person: make proto-person Tuesday 13th September, 2022 bubnenkoff 09:32What is the difference between language and set of functions like foo bar baz? Why foo bar baz not yet a language? hiiamboris 09:40Who said it's not? ☻ bubnenkoff 10:28@hiiamboris they are? Really? hiiamboris 10:40Sure 10:40There exists a language without words, just spaces, new-lines, tabs, etc. 10:41foo bar baz is already an excessive vocabulary. Just foo and space is enough. 10:42If you can describe data with that, it's a language. 10:42You can communicate using it. 10:42With PC or humans (if they're nerdy enough). bubnenkoff 10:49But when people are write such functions they are not saying that they are wrote own language hiiamboris 10:53Perhaps because it was not their intention to communicate with these functions? ;) bubnenkoff 11:04But then when language become DSL? When foo bar baz solve only domain specific task? hiiamboris 13:39If it's not general purpose, it's domain specific greggirwin 18:10It's a gradient between functions/libraries and languages. Fluent interface is a modern term as well. We can say that add/subtract/... are domain specific, because they can behave differently given their arguments, but that's for the language to decide, and also pulls polymorphism into the discussion. For me, it's less "language" if it always takes the same set of arguments, and those arguments are positional or strictly named. Language allows more flexibility in how to express things and define new extensions to it. cosacam1 22:19 22:23So sql, html, prolog, cobol, gml aka game maker language are DSL, right? greggirwin 22:46That changes the aspect to general purpose versus domain specific. Also domains versus paradigms. e.g. prolog is a logic language by paradigm, but general purpose at the same time. Wednesday 14th September, 2022 bubnenkoff 08:38Oh... after 2 years I decided to try understand binding again: users: [foo bar baz] names: ["Piter" "Mike" "Jow"] foreach u users [ bind users object compose [(to-set-word u) (take names) ] ] reduce users And it seems that it's works: >> reduce users == ["Piter" "Mike" "Jow"] 08:43Am I right understand meaning of word require rebinding. Because I tried to change names and print them with reduce users and got old results hiiamboris 08:54What exactly have you tried? bubnenkoff 09:07I have added after code above next code: names: ["Apple" "Banana" "Carrot"] reduce users I expect: ["Apple" "Banana" "Carrot"] as output but got: == ["Piter" "Mike" "Jow"] hiiamboris 09:17 >> block: [1 + 1 2 * 2] == [1 + 1 2 * 2] >> result: reduce block == [2 4] >> block: [2 + 2 3 * 3] == [2 + 2 3 * 3] >> result ;) do you expect it to be [4 9] ? bubnenkoff 09:26result is still point to block: [1 + 1 2 * 2] here. But I still can't understand difference between simple setting word with word: and binding. It seems that they are do same things hiiamboris 09:26My example is no essentially different than yours. 09:26You've created an object from values in a block. 09:26Then created a new block with new values. 09:27What does the object have to do with these? 09:28> result is still point to block: [1 + 1 2 * 2] here. Completely wrong btw 09:37 >> change block 5 == [+ 1 2 * 2] >> block == [5 + 1 2 * 2] >> result == should be [6 4] you say? bubnenkoff 09:47change is changing original, so 7 9 (and I checked in console) 09:48 >> :block == [2 + 2 3 * 3] >> >> change block 5 == [+ 2 3 * 3] >> >> :block == [5 + 2 3 * 3] >> reduce block == [7 9] hiiamboris 09:48But you're cheating by reducing it *again* 09:49 >> block: [2 + 2 3 * 3] == [2 + 2 3 * 3] >> result: reduce block == [4 9] >> change block 5 == [+ 2 3 * 3] >> result == will it be [7 9] ? melcepstrum 10:46I need help. How to change a red value in a red-system code 10:51I have something like this Red [] #system [ pv: declare float-ptr! ] c: routine [ vec [vector!] ] [ pv: as float-ptr! vector/rs-head vec ] p: make reactor! [ v: make vector! [1.0 2.0 3.0] i: 1 f: 0.1 s: "red" ] print p c p/v #system [ pv/1: 5.0 ] print p 10:57now I want to change int, float and string values from red-system side hiiamboris 11:00for string look in datatypes/string.reds for some function that works for you 11:01it's encoded using one of 1,2 or 4-byte encodings (in your case 1-byte) 11:02for int/float, these are not series, so you're gonna change the object instead 11:03similarly, look for a function in datatypes/object.reds (or context.reds) melcepstrum 11:49thanks. I think it's too hard for me :) I was hoping for an example code ;) hiiamboris 11:51let's start with what do you want to achieve with this? ;) melcepstrum 12:00i'm writing a small app that do some sound processing hiiamboris 12:01and why does it need access to anything other than vectors? melcepstrum 12:02to signal red when buffer is ready hiiamboris 12:04simplest thing would be: ready?: routine [return: [logic!]] [ (returns some readiness flag) ] melcepstrum 12:04also to get device-name from portaudio and display that in gui 12:06ok, but i have to set that flag in red-system hiiamboris 12:06yes of course melcepstrum 12:06and routine is called in red hiiamboris 12:07but it will return Red logic! value 12:07routines automatically convert (box) scalars into Red datatypes melcepstrum 12:08i think it won't work for me hiiamboris 12:08why? melcepstrum 12:09sound is processed in red-system function hiiamboris 12:10I understand that 12:10why can't it process it and return readiness flag as Red logic value? 12:11and for device name, don't mess with the objects, just return the string: get-device-name: routine [return: [string!]] [ devname: ... get the name from port-audio ... string/load devname length? devname UTF-8 ] melcepstrum 12:11ok thanks hiiamboris 12:13example code: get-device-name: routine [return: [string!] /local devname [c-string!]] [ devname: "test-name" string/load devname length? devname UTF-8 ] probe get-device-name melcepstrum 12:15thanks :) 12:16and the sound processing loop is a callback in red system hiiamboris 12:16well in your Red code you will have to *do something* to test the flag anyway, so call a routine to check the flag, which is set from the R/S callback melcepstrum 12:18can't this be triggered from the r/s side ? hiiamboris 12:20it can, with more work, but what's the point? melcepstrum 12:23i had an idea that it will trigger an event hiiamboris 12:26ok let me cook smth up 12:51 Red [] r: reactor [red-flag: off] react/later [print ["changed to:" r/red-flag]] #system [ marked-word: declare red-word! ] mark: routine [word [word!]] [ copy-cell as cell! word as cell! marked-word ] flip: routine [/local logic [red-logic!]] [ logic: as red-logic! _context/get marked-word marked-word/ctx logic/value: not logic/value _context/set marked-word as red-value! logic ] mark in r 'red-flag flip flip flip print "finished" melcepstrum 12:59thanks :) that's very helpful hiiamboris 13:01you're welcome Friday 16th September, 2022 cosacam1 07:11Hi. I've been using Notepad++ now I'm moving to VSCode for the first time. I want to install Red plugin for VScode. I go to https://github.com/red/VScode-extension and it says there I must download the Red binaries to a local folder (I did it), then set the red.redDir to it. Where do I do that? Remember, first time in VSCode. Thanks riprwwa 08:46You can go to File / Preferences / Settings, where you will be able see a long list of settings. Then either type "red." in the small search bar at the top of that window to filter them down, or expand the category tree in the settings window and look under Extensions for a node called "Red". cosacam1 09:25What do you suggest? To use IntelliSense or not? What is it good for? 09:36I already learnt about IntelliSense. I'll use it. Ok Thank you very much @riprwwa 09:51 Red [needs 'view] view [button "Hi" [print "Hola mundo"]] 09:53I wrote that little program to test VSCode. Run it. Doesn't show a window with a button but prints Hola mundo in the console instead, at the bottom of VSCode. Why? 10:03Ok, the reason is I previously wrote Red [] print "Hola mundo" and run it ok, then in same file I wrote the code above but didn't save it (in Notepad++ when you run it you save it automatically) so vscode was running the previous version. Now I save it, run it and it says view has no value. Maybe I miss-configured the extension. Here it is 10:07[![image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/xJWh/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/xJWh/image.png) 10:08What do you think? 10:22[![image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/AsFe/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/AsFe/image.png) 10:22As you see, the paths are ok riprwwa 10:24Well... I'm going to assume the extension is wrongly trying to run that script using the red executable, instead of the red-view one. Actually I can see it's running using red-.....exe instead of red-view-.....exe. If you do CTRL+SHIFT+P in VSCode you will see all commands. Type "red", you should see something like "Red: Show all Red commands", and if you do that you will see there is another command there, "Run Current Script in GUI Console" - when I invoked that it worked. There is another shortcut in VSCode: CTRL+K then CTRL+S. This shows you all keyboard shortcuts. Again, you can filter them by typing "red" or "gui" - that will show you CTRL+F6 runs your script using the GUI console. cosacam1 10:33Yes, it works with Ctrl F6. Thanks again Sunday 18th September, 2022 ldci 14:11Question: I’ve s string of bits o: {010110111011001111110110} and I want a binary string but without changing the content s: #{010110111011001111110110} hiiamboris 14:17use debase 14:19but it looks broken 14:19:( 14:19ah, it just expects integer number of bytes ldci 14:20@hiiamboris Thanks:) Wednesday 21st September, 2022 bubnenkoff 15:03Red have datatype: dbl-quote. I need to extend it: dbl-quote: union dbl-quote {"} But I am getting an error: Error: union does not allow char! for its set1 argument 15:04Would it be correct to to-string dbl-quote ? hiiamboris 15:07omg bubnenkoff 15:07What problem I am trying to solve: remove-quotes: function [str][ ; parse dst: copy str [ ; uncomment if modification of original do not required parse dst: str [ ; p-st: opt dbl-quote some [not dbl-quote skip] p-end: dbl-quote end (if p-st/1 = dbl-quote [remove p-end remove p-st]) ] dst ] dbl-quote: union to-string dbl-quote {"} str: {"Apple Corp" some text} remove-quotes str print str hiiamboris 15:08have you tried ? on it? bubnenkoff 15:09m... it seems that I did string not union {""} hiiamboris 15:10on dbl-quote bubnenkoff 15:10Yes I tried. It's a char hiiamboris 15:11so how is it a datatype? bubnenkoff 15:11it's a char! hiiamboris 15:12okay, and what result do you expect from such union? bubnenkoff 15:14And what I should to do in case above? To try to create unions? Or I am on wrong way? hiiamboris 15:15the only wrong about your way is not understanding what you want :) 15:15so I'm asking you, what value do you want to get so it will work in Parse? 15:16try to write it literally, then if that works, construct it programmaticaly bubnenkoff 15:19> so I'm asking you, what value do you want to get so it will work in Parse? Right question 15:33Am I right? html-quote: charset {"} dbl-quote: union html-quote charset dbl-quote hiiamboris 15:40Do you understand what charset is and how parse will apply it to your input? 15:45In other words, what are the examples of input that charset will and will not match? bubnenkoff 15:45Think yes, it's make bit-set.I tried to test: special: charset {test} parse {test} [some special] == true 15:46now test is bitset hiiamboris 15:51how do you explain this >> parse {ttt} [some special] == true bubnenkoff 16:07Egh... it find one or some letters from bit-set that I created. So I wrote wrong code hiiamboris 16:14yes, you only need to match " and nothing else bubnenkoff 16:23It seems that I do not need to use unions because it not for my task. I should write else condition like: p-st: opt [dbl-quote | {"}] hiiamboris 16:24:clap: bubnenkoff 16:25thanks) greggirwin 17:36Your confusion seems to have stemmed from not understanding that chars are single values, bitsets are multiple values (e.g. made from multiple chars in this context) with no order and no duplication, while strings are an *ordered* set of chars which can contain duplicates because they differ in their position. You can create a bitset from a string, but it's a lossy operation because you throw away the ordering. >> make bitset! #"A" == make bitset! #{000000000000000040} >> make bitset! #"a" == make bitset! #{00000000000000000000000040} >> make bitset! "Aa" == make bitset! #{00000000000000004000000040} >> make bitset! "AaAAAAaaAAaaaaaaAAAAAAAaaaaaaAa" == make bitset! #{00000000000000004000000040} bubnenkoff 17:48Gregg, big thanks for example! 17:48I remember that scroll is unfinished, but is it possible to get it work inside panel (or it should be outside?)? view [ size 500x400 panel [ field field field field field field field return scroller 470 ] ] greggirwin 17:52Not implemented yet. Came up [here](https://gitter.im/red/red/gui-branch?at=63258fae7ccf6b6d45dc52d8) recently. luce80 18:15Also look at [this](https://gist.github.com/luce80/55bfd71f68716d6e996effa9b99f4a1e) 18:33I am trying to ping @qtxie to fully implement the "nicer" version ;) Oldes 18:42@bubnenkoff I must recomend you to first decode all html entities before processing the input! 18:44I have a codec for it in Rebol.. which you may port to Red if you wish https://github.com/Oldes/Rebol3/blob/master/src/mezz/codec-html-entities.reb greggirwin 18:46Good advice @Oldes. hiiamboris 18:47your list might be a bit short @Oldes ;) https://html.spec.whatwg.org/multipage/named-characters.html bubnenkoff 19:06@Oldes Hi! Thanks! Thursday 22nd September, 2022 toomasv 08:44@bubnenkoff view [ below panel 400x25 [ origin 0x0 pan: panel [origin 0x0 field "1" field "2" field "3" field "4" field "5" field "6" field "7"] ] scroller 400 on-created [ face/selected: 100% * face/size/x / pan/size/x diff: face/size/x - pan/size/x ] [pan/offset/x: max diff min 0 to integer! pan/size/x * -1 * face/data] ] bubnenkoff 13:59Perfect! Thanks! toomasv 19:40You are welcome! Did you understand, what and why? Tuesday 27th September, 2022 bubnenkoff 05:11@toomasv yes, I understood your are calculation pan offset during scroll moving rebolek 07:43Re HTML entities. My CASTR package comes with full list of them (and converter also :) https://gitlab.com/rebolek/castr/-/blob/master/entities Tuesday 4th October, 2022 bubnenkoff 08:47Hi! I am back to panel problem, I forgot some syntax: p: [panel []] view [ do p] it's not working. I want to declare panel outside view ldci 09:20@bubnenkoff Try with make face! bubnenkoff 09:25@ldci ok thanks, But what I am missing here: view [ p: panel blue [] button [ p/color: red] ] why color do not change? I should use react to get it work? hiiamboris 09:30It's a bug. Report it. ldci 09:35It’s running for me :Red 0.6.4 for Windows built 24-Sep-2022/9:39:31+02:00 commit #487881e hiiamboris 09:43Confirmed, regressed between Sep 28 and Sep 30 bubnenkoff 09:45heh) I really spend one hour thinking about what I am forgot again) ldci 09:45@hiiamboris Thanks :) bubnenkoff 09:50@hiiamboris done https://github.com/red/red/issues/5222 hiiamboris 09:53:+1: bubnenkoff 09:58> @bubnenkoff Try with make face! p: [panel []] view [make-face p] error: Error: VID - invalid syntax at: [make-face p] hiiamboris 10:00You should perhaps re-read what is visual inteface dialect and how it's different from normal Red instead of doing random stuff ldci 10:07 p: make face! [ type: 'panel offset: 0x0 size: 300x200 color: silver ] win: layout [] append win/pane p view win toomasv 11:09Or p: [panel []] view p ldci 11:15@toomasv Fine bubnenkoff 11:19> Or > > p: [panel []] > view p > Heh, I tried a lot of variants because I remember that it should be very simple, but not this) thanks) luce80 18:05I'd like to make a widget that is made as a group of 3 different styles , how can I accomplish that ? Should I use panel or base as template ? hiiamboris 18:13for native widgets, panel 18:17you can again use my scrollpanel style as a point of reference cosacam1 22:21hi everyone, long time away from here, I've been very busy. How can I sync two text-list so when I scroll in one of them the other-one scrolls too. I mean using any means to scroll (scroller, wheel, arrow keys, whatever) I suppose it's related to events, but how can I get to each text-list's scroller so I can use the scroller's data. Thanks in advance hiiamboris 22:21only using R/S cosacam1 22:21ouch 22:22that makes me compile every time I test my code 22:23btw, has compiling improved it's performance? hiiamboris 22:23you don't have to compile often if you insert R/S code into your console itself 22:23> btw, has compiling improved it's performance? no it hasn't, but devmode (-c) was always fine, <1 sec cosacam1 22:26do you mean I can put some R/S code in my program and run it w/o compiling some times? I don't understand 22:39what I've done so far is to select corresponding items in both text-lists 22:42 view [ t1: text-list data [] [t2/selected: t1/selected] t2: text-list data [] [t1/selected: t2/selected] return button "fill" [ loop 40 [ append t1/data copy random "qwertyuiop" append t2/data copy random "1234567890" ] ] 22:43sorry, it needs one more bracket 22:44 view [ t1: text-list data [] [t2/selected: t1/selected] t2: text-list data [] [t1/selected: t2/selected] return button "fill" [ loop 40 [ append t1/data copy random "qwertyuiop" append t2/data copy random "1234567890" ] ] ] Wednesday 5th October, 2022 ldci 05:02@cosacam1 Good approach :) Friday 7th October, 2022 ldci 06:22How to easily transform Red/System c-string! to a Red string? hiiamboris 08:26string/load str length? str UTF-8 ldci 08:36@hiiamboris Thanks a lot Thursday 13th October, 2022 bubnenkoff 09:09Heh, I wrote buggy code and got StackOverflow. Do not know should it be marked as a bug? a: #(a: 1) f: function[] [ probe f ] f 09:18And the second moment, it seems that there is regression. function have func signature: b: 1 f: function[] [ print b ] f is printing 1 instead of none: >> :f == func [][ print b ] hiiamboris 09:19stack overflow is expected from that in all languages I know 09:20why would it print none? bubnenkoff 09:22Oh... it seems that I am wrong cosacam1 12:34Hi. How can I set-focus to a field and make the caret be at the end of its text, not at the begining. Also, how to make all its text to be selected (blue) when focused. Thanks hiiamboris 12:56view [f: field "text" button [set-focus f f/selected: 1x4]] 12:59view [f: field "text" button [set-focus f f/selected: 5x5]] for no selection (but it's a hack) cosacam1 13:28Thanks. I tried also "textos" and 2x4. It selected from the second to the fourth chars. Clever Red. Thanks again @hiiamboris 13:44I think set-focus with /all and /part refinements would be nice applicable to field, area and rtf hiiamboris 14:13just write your own function for that cosacam1 15:37Yeap, as soon as I have electricity Saturday 15th October, 2022 luce80 14:00How can I scale something in draw block **without** scaling the pen ? I tried with matrix, scale and transform with and without 'pen with no effect. P.S.: transform perforns scaling after translation, is it by-design ? hiiamboris 14:02scaling applies to everything 14:02just update line-width as well luce80 14:19And what is the difference between scale and scale 'pen ? hiiamboris 14:34I would assume that it applies to bitmap/gradient pens 14:35I agree documentation is vague 14:35Let's ask @dockimbel dockimbel 15:11Should be for scaling gradient and pattern pens and fill-pens. I agree that the documentation could be more accurate about that. @qtxie can confirm. luce80 15:17And how can I "counteract" a not unform scaling like scale 20 10 ? hiiamboris 15:23I think you can't. Neither this, nor skew. 15:24> transform perforns scaling after translation, is it by-design ? By the way I had the same questions when I read the docs. Transformations order is not documented. dockimbel 17:24@qtxie ^--- please document that. qtxie 23:48> How can I scale something in draw block **without** scaling the pen ? I tried with matrix, scale and transform with and without 'pen with no effect. P.S.: transform perforns scaling after translation, is it by-design ? transform applies rotate, scale and translate in order. view [ base 300x300 draw [ transform 10 2 1.5 10x10 box 100x100 150x150 ] base 300x300 draw [ rotate 10 scale 2 1.5 translate 10x10 box 100x100 150x150 ] ] 23:53> And what is the difference between scale and scale 'pen ? If it's a pure color pen, any transforms on it has no effect. You can see the effect only if scale 'pen applies to bitmap/gradient pens. Sunday 16th October, 2022 luce80 08:40Ok, transform applies **transformation matrix multiplications** in that order. Wednesday 19th October, 2022 bubnenkoff 13:46What I missing in next algorithm? data-pointer: [ purchaseNumber: none isGOZ: none docPublishDate: none responsibleOrg_inn: none lots: [ mytag: none lot: [ lotNumber: none KBKCode: none lotMaxPrice: none customers: [ customer: [ customer_regNum: none customer_fullName: none ] users: [ user_regNum: none user_fullName: none ] ] foo: [a: none] objects: [ bar: none object: [ OKPD_code: none OKPD_name: none ] ] ] ] ] get-nesting-levels-as-map-list: function [] [ level: 0 tags-before: 0 nested?: false mmm: copy #() parent-name: none walk: function[data-pointer /extern level tags-before parent-name] [ foreach [data-name data-value] data-pointer [ if none? parent-name [ parent-name: 'root] ; either block? data-value [ mmm/(data-name): copy make map! compose [node-level: (level) tags-before: (tags-before) parent: (parent-name) ] level: level + 1 if (level > mmm/(data-name)/node-level) [ print ["data-name:" data-name "parent-name:" parent-name] mmm/(data-name)/parent: parent-name parent-name: to-word data-name ] mmm/(data-name)/node-level: level walk data-value ; level: level - 1 ] [ tags-before: tags-before + 2 ; key and value ] ] ] walk data-pointer return mmm ] probe get-nesting-levels-as-map-list it's output: data-name: lots parent-name: root data-name: lot parent-name: lots data-name: customers parent-name: lot data-name: customer parent-name: customers data-name: users parent-name: customer ; wrong parent should be: customers data-name: foo parent-name: users ; wrong parent should be: lot data-name: objects parent-name: foo ; wrong parent should be: lot data-name: object parent-name: objects Where am I wrong? hiiamboris 13:52Hard to say. Use probe or trace to find the point where first value becomes wrong, walk backwards from that. Monday 24th October, 2022 bubnenkoff 12:02Why I can't create next char? >> #"^" *** Syntax Error: (line 2) invalid char at #"^" *** Where: case *** Near : :delimiter-lex *** Stack: load Oldes 12:08@bubnenkoff because ^ is the escape char... you must use: #"^^" bubnenkoff 12:09thanks! greggirwin 18:53@bubnenkoff remember to check docs: https://github.com/red/docs/blob/master/en/datatypes/char.adoc They'll help a lot. Thursday 27th October, 2022 cosacam1 17:23hi guys take a look at this code 17:23` 17:24a: context [ info: make map! [ name "ana" age 10 ] m2i: func [m][info/name: m/name info/age: m/age] ] b: copy a c: copy a probe a b/m2i copy make map! [name "berta" age 15] probe b probe a c/m2i copy make map! [name "carlos" age 20] probe c probe b probe a view [ t: text-list data [] button "Fill list" [ append t/data b/info/name append t/data b/info append t/data c/info/name append t/data c/info ] button "Show selected" [ probe t/data/(2 * t/selected) ] ] ` 17:38I'm trying to append objects to the text-list data so I can use the selected object's properties even to save them in a json file. I know I can append the whole object, but in that case its methods would be appended and saved too, which I don't need, only its properties. That's why I use a map to hold the object's properties. I'm creating different copies of the prototype object however every new object overrides the previous ones although I'm using copy. Why? Thanks. 17:55"override or overwrite", I don't know what's the best word to express what I mean in English. Sorry hiiamboris 17:56Can you format the code? cosacam1 18:04I'll try. 18:04` 18:04Red [needs 'view] a: context [ info: make map! [ name "ana" age 10 ] m2i: func [m][info/name: m/name info/age: m/age] ] b: copy a c: copy a probe a b/m2i copy make map! [name "berta" age 15] probe b probe a c/m2i copy make map! [name "carlos" age 20] probe c probe b probe a view [ t: text-list data [] button "Fill list" [ append t/data b/info/name append t/data b/info append t/data c/info/name append t/data c/info ] button "Show selected" [ probe t/data/(2 * t/selected) ] ] ` hiiamboris 18:04shift+enter cosacam1 18:04oops. I did ctrl enter 18:05 Red [needs 'view] a: context [ info: make map! [ name "ana" age 10 ] m2i: func [m][info/name: m/name info/age: m/age] ] b: copy a c: copy a probe a b/m2i copy make map! [name "berta" age 15] probe b probe a c/m2i copy make map! [name "carlos" age 20] probe c probe b probe a view [ t: text-list data [] button "Fill list" [ append t/data b/info/name append t/data b/info append t/data c/info/name append t/data c/info ] button "Show selected" [ probe t/data/(2 * t/selected) ] ] 18:05voila! hiiamboris 18:06:clap: 18:06tried copy/deep a? 18:07copy has some weird semantics, making a shallow copy + functions + maybe smth else cosacam1 18:09copy/deep gave me same result. do you want to see the output? hiiamboris 18:09no, I'll test here cosacam1 18:10thanks anyway. someone else has any idea? hiiamboris 18:12 b: copy/deep a b/info: copy/deep b/info c: copy/deep a c/info: copy/deep c/info solves it 18:13so this is yet another quirk in maps 18:13maybe you should just use block instead of map? 18:14or replace the whole map? 18:15https://github.com/red/red/issues/3218 18:15https://github.com/red/red/issues/2167 Tuesday 1st November, 2022 toomasv 17:42Has such error appeared before? *** Script Error: path element > only < does not apply to function! type *** Where: eval-path What does it mean? I have function with refinement /only typ [word!], and I get this error in compiled script on invocation of the function. No error when interpreted. Here is signature of the function: set-col-type: function [face [object!] event [event! integer!] /only typ [word!]][... greggirwin 17:51Some path evaluation changes were made not long ago, mostly related to objects. Need to test on an old compiler, say from August, to see if it occurs there. toomasv 18:06Tried both with latest and with 30-May-2022/9:33:18+02:00 commit #e633c9a. Same for both. greggirwin 18:13Hmmm. No error here. 18:18Ah, failing silently here it seems. 18:24Nope, I was wrong, it seems fine. 18:26Compiling with redc.exe from 20-Oct-2022. 18:26Looks like something deeper is at play. toomasv 19:06Yeah, when I remove this invocation, I get next one: *** Script Error: path element > with < does not apply to function! type about next function. luce80 19:09How can I make form keep the number of decimals I want ? that is instead of: >> form 10.0 == "10.0" this: >> form-or-other-func 10.0 == "10.00" ; or "10.000" instead of: >> form 0.000001 == "1.0e-6" this: >> form-or-other-func 0.000001 == "0.000001" Can you suggest a simple function ? ldci 19:12Use round/to before form hiiamboris 19:15Float formatting and simple can not belong to the same sentence ;) greggirwin 19:15@ldci that won't pad zeros on the right. Someday we'll get format as standard. In the meantime, @luce80, you'll have to use the experimental formatting work from me or @hiiamboris. hiiamboris 19:17lvl1: https://codeberg.org/hiiamboris/red-common/src/branch/master/format-number.red lvl2: https://codeberg.org/hiiamboris/red-common/src/branch/master/format-readable.red lvl3: https://github.com/red/red/pull/5069 luce80 19:21lvl1 is very nice ! hiiamboris 19:23but has biggest number of edge cases ;) luce80 19:33Now how can I convert 0.01 to 2 and 0.001 to 3 ? hiiamboris 19:49you already have it in lvl2 Wednesday 2nd November, 2022 luce80 19:10lvl0: (no edge cases considered ;) ) pad-decimals: func [ "Pad FORMed number decimals to given precision" num [integer! float!] precision [float!] ] [ num: form (round/to num precision) + (precision * 0.1) copy/part num (length? num) - 1 ] hiiamboris 19:38but it doesn't solve your own task: >> pad-decimals 1e-6 1e-6 == "1.1e-" luce80 19:40and what about this ? : >> pad-decimals 10.0 1.0 == "10." Did I say no edge cases considered ? In fact I do not think I will use it, too low level ;) ne1uno 19:50https://gist.github.com/toomasv/006aaa95a0da02844916451fce8a6fcf#file-form-to-red I think it needs a fix after more recent changes, head pad ... 19:51or maybe return head number greggirwin 20:30:point_up: [this](https://gitter.im/red/help?at=63617042aa210536d63b9622) :^) Thursday 3th November, 2022 toomasv 06:38@ne1uno Thanks, changed! ... Although ?? pad still claims return: [string!] "Modified input string at head". ne1uno 13:46@toomasv, could be that find is what changed? bubnenkoff 15:54Could anybody to compile next app with -r flag and do click on start and start2 ten times https://gist.githubusercontent.com/bubnenkoff/78ace5972fe501993e480e6ba6f3c385/raw/064a2cbc96119c4217e2892ab39bf625cdfeb89e/app.red D:\code\test_grow_red> .\stat_ui.exe start start start start start start start start start *** Runtime Error 1: access violation if no compile no error hiiamboris 17:26in what order we should click these? at random? bubnenkoff 17:28Random hiiamboris 17:29crashes indeed, some View heisenbugs probably 17:31@bubnenkoff can you eliminate View and see if it still crashes? 17:32well, probably won't work, since even if compiled with -r -d it doesn't crash already 17:35but worth trying! because it will be hard to find the bug like this 17:43-c mode broken? 17:43crap 18:04nevermind @bubnenkoff I minified it to Red [needs: 'view] view [ ppp: panel 300x400 [] return button "kill me" [loop 100 [ppp/pane: layout/only [button "abc"]]] ] greggirwin 20:37So is -c mode broken @hiiamboris ? hiiamboris 20:48nah, it was just an eternal issue https://github.com/red/red/issues/4249 greggirwin 21:54Whew! Sunday 6th November, 2022 bubnenkoff 06:37@hiiamboris sorry, I was go away from PC Monday 7th November, 2022 bubnenkoff 11:45Am I right that currently impossible to change default button color? view [ button [ face/color: red] ] hiiamboris 12:08Text color changes, background is not supported by the OS bubnenkoff 12:16 view [ button "aaa" [ face/color: red] ] I do not see any changes on text color... hiiamboris 12:17because you're not changing text color 12:18try view [button pink green "abc"] bubnenkoff 12:20why view [button pink green "abc"] but not simply: view [button green "abc"]? hiiamboris 12:21first color goes to background in VID 12:22but in button's case remains unused Tuesday 8th November, 2022 cosacam1 04:14hi there. How to use get-scroller? Thanks hiiamboris 09:51There's a search function on the panel on the left bubnenkoff 15:58I need way to make color accent to button could anybody give any suggestion? I tried to use base before button, but I do not like how it's look like 15:59[![изображение.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/wAbg/thumb/izobrazhenie.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/wAbg/izobrazhenie.png) hiiamboris 16:11use base in place of a button? 16:14or draw a frame around it? 16:14or on top of it? 16:19view [button 80x25 "OK" at 10x10 box 82x24 draw [pen magenta line-width 3 box 3x1 79x23]] bubnenkoff 17:46But I am generation button dynamically, and I do not know it's size because they can different text, so I can't set box size and at. hiiamboris 17:48Everything VID does can be done in View bubnenkoff 17:50but how to draw box if I do not know it's size because I do not know length of text on button? 17:51By generation I mean: append ppp/pane layout/only compose/deep [ at (section-pos - 10x0) base 10x25 with [ color: (data-or-stat/(section-name)/(subsection-name)/color) ] at section-pos button (rejoin [to-string subsection-name ": " data-or-stat/(section-name)/(subsection-name)/filled-count] ) ] 17:52to draw box around it like on your example I need to know it's size hiiamboris 17:55you can read button's size after it was shown Thursday 10th November, 2022 bubnenkoff 09:48I found mention in help-in-red.pdf: group-box From documentation: A group-box is a container for other faces, with a visible frame around it. This is a temporary style which will be removed once Red has the support for edge facet. Is there any updates on edge face support? hiiamboris 10:00nope bubnenkoff 10:05Am i right understand that group-box and just a panel with text label? hiiamboris 10:21it's an OS widget 10:22basically, Red just gives a flag to the OS that it should have a label 10:27in fact group-box is a button under the hood in Windows bubnenkoff 10:49Only button? WoW! What is the right way to calculate child face size? I want to make tab-panel take all available size. Setting same size is not good because child should be less then parent: view [ size 1200x620 tab-panel 1200x620 [ ; I can set it less but I do not want to hardcode sizes of all elements "Tab1" [] "General2" [] ] ] hiiamboris 10:56default margin and spacing is 10x10 bubnenkoff 10:58But is there any way to not hardcode elements size? And make UI size easier to modifying? hiiamboris 10:58use reactivity bubnenkoff 10:59You mean to calculate size reactivity? hiiamboris 10:59yeah bubnenkoff 11:09I did it: view/flags [ panel green with [ react/later [ width: (first parent/size * 90%) height: (second parent/size * 90%) size: as-pair width height ] ] [ panel red [] ] ] [resize] green is stretchable. Could this code be improved? 11:10Maybe react is better to put in outside function? hiiamboris 11:17react is supported by VID natively 11:19also words width and height will leak, so you should better use as-pair without the intermediate words, or put them into a function wrapper bubnenkoff 11:26I can't remember how to use external variables in VID: tab-panel-size: 1000x500 view/flags [ size 1200x620 on-resizing [print "ddd"] tab-panel do (tab-panel-size) [ ; here "Tab1" [] "General2" [] ] ] [resize] 11:27or only way is with? hiiamboris 11:27compose too bubnenkoff 11:29 tab-panel-size: 1000x500 view/flags [ size 1200x620 on-resizing [print "ddd"] tab-panel compose (tab-panel-size) [ ; invalid syntax at: [compose (tab-panel-size) ["Tab1" [] "General2" []]] "Tab1" [] "General2" [] ] ] [resize] hiiamboris 11:30compose is not a VID invention, it's a function bubnenkoff 11:33Than I do not understand how to use it in VID hiiamboris 11:35use it outside VID bubnenkoff 11:53What I am missing? Why red panel size do not changing? base-window-size: 1200x620 tab-panel-size: function [] [ return base-window-size - 10 ] view/flags [ size base-window-size on-resizing [ base-window-size: face/size ] tab-panel red with [ react/later [size: tab-panel-size]] [ "Tab1" [] "Tab2" [] ] ] [resize] hiiamboris 11:55react needs a _reactive source_ 11:55https://github.com/red/docs/blob/master/en/reactivity.adoc bubnenkoff 12:05is creates a reactive formula whose result will be assigned to a word. So I could do: base-window-size: 1200x620 tab-panel-size: reactor [ is [base-window-size - 10] ] ? 12:06And should base-window-size be also reactive? hiiamboris 12:09reactive source is needed to *trigger* a reaction; what you do inside doesn't matter 12:09also is is an operator bubnenkoff 12:12 base-window-size: 1200x620 tab-panel-size: reactor [ print "d" is [base-window-size - 10] ] view/flags [ size base-window-size on-resizing [ base-window-size: face/size tab-panel-size ; I need to trigger tab-panel-size: reactor here? ] tab-panel red with [ react/later [size: tab-panel-size]] [ "Tab1" [] "Tab2" [] ] ] [resize] Can't understand how to trigger reactor hiiamboris 12:14it's like I said: > react needs a _reactive source_ bubnenkoff 12:15 tab-panel-size: reactor [ ; is it reactive source? is [base-window-size - 10] ] hiiamboris 12:18I gave you a documentation link 12:18please read what is a reactive source 12:18it's written black on white there bubnenkoff 12:48I reread it many times, I can only assume that base-window-size should be also reactive hiiamboris 12:50have you found what is a reactive source? 12:50paste here 12:51let's read it together :) bubnenkoff 12:53hah) I have only one idea that reactive source should be base-window-size but not it is not hiiamboris 12:55don't worry, paste the definition from the docs and we'll see bubnenkoff 12:55"A path! value referring to a field in a reactive object." 12:57hm... object ... set word is not an object! hiiamboris 12:58"A **path!** value" - do you see this? bubnenkoff 12:58yes... hiiamboris 12:58do you have a path value in your react block? bubnenkoff 12:59no, so it should be an object and I should to link to path inside it? hiiamboris 13:01no idea what does it mean "link to path" 13:01you understand what a path is? 13:01give me an example bubnenkoff 13:01one moment 13:05 base-window-object: reactor [ size: 1200x620 ] base-window-object/size hiiamboris 13:07yes good, that is a path to a field in a reactive object 13:07by the way, every face is also a reactive object 13:08now all you need is to give such path to react so it can watch it's changes 13:09react only scans the literal block you give it bubnenkoff 13:10 base-window-object: reactor [ size: 1200x620 ] tab-panel-size: reactor [ size: is [base-window-object/size - 10] ; what is correct syntax here? should I add set word or it can be returned? ] view/flags [ size base-window-size on-resizing [ base-window-object: face/size ] tab-panel red with [ react/later [size: tab-panel-size/size]] [ "Tab1" [] "Tab2" [] ] ] [resize] hiiamboris 13:13this should work I think bubnenkoff 13:14Do not: *** Script Error: VID - invalid syntax at: [base-window-size on-resizing [base-window-object: face/size]] hiiamboris 13:14but that's because you're not using compose 13:14reactive part should be fine bubnenkoff 13:16 base-window-object: reactor [ size: 1200x620 ] tab-panel-size: reactor [ size: base-window-object/size - 10 ] view/flags [ size base-window-size on-resizing [ base-window-object: face/size ] tab-panel red with [ react/later [size: compose (tab-panel-size/size)]] [ ; compose here? I am getting an error "Tab1" [] "Tab2" [] ] ] [resize] 13:17and it seems that error in: Script Error: VID - invalid syntax at: [base-window-size on-resizing [base-window-object: face/size]] 13:17oh moment 13:18I am seeing an error 13:18 base-window-object: reactor [ size: 1200x620 ] tab-panel-size: reactor [ size: base-window-object/size - 10 ] view/flags [ size base-window-size/size on-resizing [ base-window-object/size: face/size ] tab-panel red with [ react/later [size: tab-panel-size/size]] [ "Tab1" [] "Tab2" [] ] ] [resize] Again an error hiiamboris 13:20have you tried reading the error message? ;) 13:22if so, you should consult VID's size command syntax 13:22https://github.com/red/docs/blob/master/en/vid.adoc 13:23you can paste it here too bubnenkoff 13:25size value But my code: size base-window-size/size hiiamboris 13:25and the next line in the docs? bubnenkoff 13:26"<value> : width and height in pixels (pair!)." hiiamboris 13:26see the **pair!** there? 13:26do you give it a pair? bubnenkoff 13:27yes, but react should return 1200x620 in my code hiiamboris 13:27to hell with react 13:27base-window-size is not a pair bubnenkoff 13:29 size do [compose (base-window-size/size)] hiiamboris 13:29do is not a pair either 13:29what type is it? bubnenkoff 13:30here? Here should be a word hiiamboris 13:30great, we're getting somewhere 13:30so size expects a pair, but you keep giving it a word bubnenkoff 13:32But I can't use compose here: size compose (base-window-size/size) hiiamboris 13:32can you use compose outside of VID? bubnenkoff 13:34Only like this: foo: does [compose (base-window-size/size)] view/flags [ size foo hiiamboris 13:38but foo is a word bubnenkoff 13:40hah)) 13:43I am somewhere near! base-window-object: reactor [ size: 1200x620 ] tab-panel-size: reactor [ size: base-window-object/size - 10 ] view/flags compose [ size (base-window-size/size) on-resizing [ base-window-object/size: face/size ] tab-panel red with [ react/later [size: tab-panel-size/size]] [ "Tab1" [] "Tab2" [] ] ] [resize] 13:44btw syntax is still invalid hiiamboris 13:49:+1: bubnenkoff 14:38 view/flags compose [ size (base-window-size/size) on-resizing [ base-window-object/size: face/size ] tab-panel red with [ size: tab-panel-size/size] [ "Tab1" [] "Tab2" [] ] ] [resize] error: *** Script Error: VID - invalid syntax at: [none on-resizing [base-window-object/size: face/size]] hiiamboris 14:39figure out your typos bubnenkoff 14:42Oh indeed! Working example: base-window-object: reactor [ size: 1200x620 ] tab-panel-size: reactor [ size: base-window-object/size - 10 ] view/flags compose [ size (base-window-object/size) on-resizing [ base-window-object/size: face/size ] tab-panel red with [ size: tab-panel-size/size] [ "Tab1" [] "Tab2" [] ] ] [resize] hiiamboris 14:43:clap: bubnenkoff 14:44one moment I need to check if it work as expected, because now working example is running example) 14:48Not sure that it's work as expected: base-window-object: reactor [ size: 1100x620 ] tab-panel-size: reactor [ size: base-window-object/size - 20% ] view/flags compose [ size (base-window-object/size) on-resizing [ base-window-object/size: face/size ] tab-panel red with [ react/later [size: (tab-panel-size/size)]] [ ; tab-panel red with [ size: tab-panel-size/size] [ "Tab1" [] "Tab2" [] ] ] [resize] if I understood you right all faces is reactive by default, so commented and uncommented lines should work same? 14:49But I do not seeing changing of red panel size on windows resize hiiamboris 14:51all faces are reactive, but that doesn't change the meaning of with 14:51(which is only evaluated once) bubnenkoff 14:52hah) So is it still possible to get my code work? hiiamboris 14:55use probe to see what values get updated 14:55you'll find where you broke it bubnenkoff 15:00 base-window-object: reactor [ size: 1100x620 ] tab-panel-size: reactor [ size: base-window-object/size - 50 ] view/flags compose [ size (base-window-object/size) on-resizing [ base-window-object/size: face/size t/size: tab-panel-size/size probe t/size ; but i size is not changing ] t: tab-panel red (tab-panel-size/size) [ "Tab1" [] "Tab2" [] ] ] [resize] hiiamboris 15:03indeed, what do you think will change it? 15:03you have zero reactive relations defined bubnenkoff 15:08I have only idea that on-resizing should be somehow maked as reactive... 15:09because: base-window-object: reactor [ size: 1100x620 ] tab-panel-size: reactor [ size: base-window-object/size - 50 ] should be reactable hiiamboris 15:09you know how to define a *reactive relation*? bubnenkoff 15:11If i understand examples right it should be: on-resizing react [ base-window-object/size: face/size probe t/size t/size: tab-panel-size/size ] But usually understand it wrong hiiamboris 15:12indeed, does on-resizing accept word for it's argument? bubnenkoff 15:12No hiiamboris 15:12but that's what you're giving it bubnenkoff 15:18Now I have no ideas... hiiamboris 15:19give it a block come on 15:19you wrote correct relations an hour ago or so ;) bubnenkoff 15:26> I did it: > > view/flags [ > > panel green with [ react/later [ width: (first parent/size * 90%) height: (second parent/size * 90%) size: as-pair width height ] ] [ > panel red [] > ] > ] [resize] > > green is stretchable. Could this code be improved? You are talking about this example? hiiamboris 15:28yeah this one too 15:29and https://gitter.im/red/help?at=636cf8562cb65702401f067b bubnenkoff 15:35Even having examples I do not understand what I can took from them... 15:36I have only stupid ideas like: with react/later [ base-window-object/size: face/size probe t/size t/size: tab-panel-size/size ] hiiamboris 15:44in that case sleep on it ;) 15:46you are clearly tired today bubnenkoff 16:08You are right. Just say me if I am on right way? view/flags compose [ size (base-window-object/size) on-resizing [ ; passing to resize react block react/later [ base-window-object/size: face/size probe t/size t/size: tab-panel-size/size ] ] t: tab-panel red (tab-panel-size/size) [ "Tab1" [] "Tab2" [] ] ] [resize] hiiamboris 16:10you are bubnenkoff 16:13But face/size is not available there… hiiamboris 16:15indeed 16:15maybe use VID's react instead of on-resizing? 16:16or you'll have to make a *dynamic* relation (documented) bubnenkoff 16:20is it possible to use react? I am getting syntax error: view/flags compose [ size (base-window-object/size) react/later [ base-window-object/size: face/size probe t/size t/size: tab-panel-size/size ] t: tab-panel red (tab-panel-size/size) [ "Tab1" [] "Tab2" [] ] ] [resize] hiiamboris 16:26because you're not following the VID docs 16:26there's no react/later syntax in VID 16:26and it has to follow a face 16:27doing random things again :) 16:27good luck with that bubnenkoff 16:47> and it has to follow a face Please explain this hiiamboris 16:49actually, I'm mistaken, you can use react globally in VID 16:49> This keyword can be used both as a face option or as a global keyword. Arbitrary number of react instances can be used. 16:49then you just have to follow the documentation ;) bubnenkoff 17:57is seems that I should not call face from react, I should link by name. But on follow code react is do not do nothing (I checked with prints in it): base-window-object: reactor [ size: 1100x620 ] tab-panel-size: reactor [ size: is base-window-object/size - 50 ] view/flags compose win: [ size (base-window-object/size) react later [ print "hello" base-window-object/size: win/size ; I should not use face here ; probe t/size t/size: tab-panel-size/size ] t: tab-panel red (tab-panel-size/size) [ "Tab1" [] "Tab2" [] ] ] [resize] hiiamboris 18:31what reactive sources do you see in your react block? how many? Friday 11st November, 2022 bubnenkoff 05:16> what reactive sources do you see in your react block? how many? It seems that only one: tab-panel-size/size win/size is not react hiiamboris 08:54yes, and why? bubnenkoff 08:59I am continue fighting. I got it work and more or less understand how it works: base-window-objects: reactor [ size: 1100x620 panel-size: is [size - 50] ] view/flags compose [ size (base-window-objects/size) on-resizing [ base-window-objects/size: face/size t/size: base-window-objects/panel-size ] t: tab-panel red (base-window-objects/panel-size) [ "Tab1" [] "Tab2" [] ] ] [resize] Question: is there any way to change panel size without linking to t? hiiamboris 09:02of course, dynamic relations are documented at the link I gave you bubnenkoff 10:39 >> 100 - 20% == 99.8 why 99.8?! 10:40 >> to-percent 100 - 20% == 9980% >> to-percent (100 - 20%) == 9980% hiiamboris 10:44> Percent is from the Latin adverbial phrase per centum meaning “by the hundred.” 10:441 per cent means literally 1 / 100 10:44100 percent = 1 10:45 >> to percent! 1 == 100% 10:46% sign visually denotes the denominator and the number of zeroes (2) bubnenkoff 10:51But how to get 80 as result ? %) hiiamboris 11:03 >> 100% - 20% == 80% 11:03use multiplication, Luke 11:05 >> %: 1 / 100 == 0.01 >> 100% - (20 * %) == 80% bubnenkoff 12:58> > >> %: 1 / 100 > == 0.01 > >> 100% - (20 * %) > == 80% > thanks! luce80 19:04Just a thought. I feel a lot like @bubnenkoff when using reactions. I hope he will succeeds in his fight with them and will post the final result, hoping it will clarify that situation even for me. Saturday 12nd November, 2022 dsunanda 13:27Is there a way to set the user-agent string before doing a read http://.... ? hiiamboris 13:35no, it's hardcoded in the source unlike other headers: https://github.com/red/red/blob/134698f686c200e24d420f28866c8aa03a8557c0/runtime/simple-io.reds#L1644 13:36@rebolek may know if it's possible in the IO branch though dsunanda 13:42Thanks. Not a big problem. pekr 18:35IO branch was supposed to undergo some architectural changes, IIRC, so I would not bet on its API. Sunday 13th November, 2022 cosacam1 20:39About dmitry - hiiamboris chatting on reactors: I like hiamboris' style - He's teaching us how to fish rather than feeding us with fishes. We thank you. hiiamboris 21:34I appreciate you see the point @cosacam1 ☻ 21:34Indeed most useful learning skill is not to have the dots but to master how to connect them. Tuesday 15th November, 2022 cosacam1 06:05Several days ago I asked about get-scroller. I was suggested to search and I found a Toomas/hiiamboris example. However it doesn't work. It just shows a grey base with nothing in it. Well, I made some changes, as follows: - replaced base by panel and named it bg (background panel) - removed the with section and located scrollable in same line of bg panel declaration - also removed the pane: layout/only section as fg panel goes automatically in that pane - renamed p panel to fg (forground panel) - removed its default size so it gets high enough as to contain any widget in it no matter its size, as usually we do in VID - changed areas sizes (actually I used a style) so each area doesn't fill the whole panel - added more areas - replaced size constants by their respective refinements in bg and fg - added a diff variable to hold the height difference of both panels I realized that event/key has right,left,page-right,page-left values instead of down,up,page-down,page-up as stated in the example. (I guess an horizontal scroll-bar should use left,right,etc. values and a vertical one should use up,down,etc.) So I finished up with the following script: 06:06 view [ size 390x220 across space 0x0 bg: panel 367x200 scrollable [ origin 0x0 space 0x0 bg: panel [ style area: area 350x75 origin 0x0 space 0x0 below area "A" area "B" area "C" area "D" area "A1" area "B1" area "C1" area "D1" area "A2" area "B2" area "C2" area "D2" area "A3" area "B3" area "C3" area "D3" ] ] on-created [ put get-scroller face 'horizontal 'visible? no sc: get-scroller face 'vertical sc/position: 0 sc/page-size: bg/size/y sc/max-size: fg/size/y diff: fg/size/y - bg/size/y ] on-scroll [ if event/key = 'track [probe reduce ["before " event/picked sc/position]] sc/position: max 0 min diff switch event/key [ right [sc/position + 20] left [sc/position - 20] page-right [sc/position + sc/page-size] page-left [sc/position - sc/page-size] track [event/picked - 1] end [sc/position] ] if event/key = 'track [probe reduce ["after " event/picked sc/position]] p/offset: as-pair 0 negate sc/position ] ] 06:06Everything works fine except when I drag the thumb: the block associated to the track key is not working fine. The thumb always returns to top position and the panel doesn't scroll at all. As you see, I did probe event/picked and sc/position, before and after the switch. They are 0 all the time. Why? BTW my Red build date is 9-Jun-2022/20:34:35 running on Windows 10. Maybe that matters. Thanks. ldci 07:11@cosacam1 Tested with Red 0.6.4 for Windows built 7-Nov-2022/9:01:41+01:00 commit #134698f. But replace second bg name by fg and use fg/offset. Works fine:) cosacam1 07:38Thanks @ldci The typos you found are due to... typing the message here in Gitter but they are correctly typed in my IDE. I'll download Red's last version ldci 08:08Based on a code I found (I don’t know the author) you can also try Red [ ] view [ across panel 350x100 [ origin 0x0 pan: panel [ style area: area 350x75 origin 0x0 space 0x0 below area "1" area "2" area "3" area "4" area "5" area "6" area "7"] ] scroller 16x100 on-created [ face/selected: 100% * face/size/y / pan/size/y diff: face/size/y - pan/size/y ] [pan/offset/y: max diff min 0 to integer! pan/size/y * -1 * face/data] ] toomasv 09:19@cosacam1 > I realized that event/key has right,left,page-right,page-left values instead of down,up,page-down,page-up It seems vertical scrolling words are restored in later builds. At least I have these in Nov 7 Win build. 09:22@ldci Was it working fine for you? I had to replace event/keys to vertical words with same build. ldci 09:24@toomasv Response too fast Wednesday 16th November, 2022 cosacam1 16:06This example is based upon a Toomas / hiiamboris code that uses get-scroller. The original had neither on-wheel nor on-drag event handlers. Drag works fine when the difference between panels' height is less than 700, else it gets stuck before reaching the bottom. I guess it's a Red bug, correct me please if I'm wrong. Thanks. BTW It happens the same when using a supllied scroller face (not those returned by get-scroller) in the many examples given in the forum (even one of my own) 16:06 Red [needs 'view] view [ size 390x450 across space 0x0 bg: panel 367x400 scrollable [ origin 0x0 space 0x0 fg: panel blue loose [ ; use blue margin for dragging style a: area 300x50 origin 0x0 space 0x0 below a "A0" a "B0" a "C0" a "D0" a "A1" a "B1" a "C1" a "D1" a "A2" a "B2" a "C2" a "D2" a "A3" a "B3" a "C3" a "D3" a "A4" a "B4" a "C4" a "D4" a "A5" a "B5" ; a "C5" a "D5" uncomment these and you'll get stuck when dragging ; a "A6" a "B6" a "C6" a "D6" ; a "A7" a "B7" a "C7" a "D7" ; a "A8" a "B8" a "C8" a "D8" ; a "A9" a "B9" a "C9" a "D9" ] with [size/x: size/x + 40] ; 40 :: show blue margin on-wheel [ sc/position: max 0 min diff sc/position + either positive? event/picked [negate sc/min-size][sc/min-size] fg/offset/y: negate sc/position ] on-drag-start [system/view/auto-sync?: no] on-drag [ unless system/view/auto-sync? [ fg/offset: as-pair 0 (min max negate diff fg/offset/y 0) sc/position: negate fg/offset/y ] ] on-drop [system/view/auto-sync?: yes] ] on-created [ sc: get-scroller face 'vertical put get-scroller face 'horizontal 'visible? no td/text: to-string diff: fg/size/y - bg/size/y either diff > 0 [ put sc 'visible? yes sc/position: 0 sc/page-size: bg/size/y sc/min-size: bg/size/y / 10 sc/max-size: fg/size/y ][put sc 'visible? no] ] on-scroll [ sc/position: max 0 min diff switch event/key [ down [sc/position + sc/min-size] up [sc/position - sc/min-size] page-down [sc/position + sc/page-size] page-up [sc/position - sc/page-size] track [event/picked - 1] end [sc/position] ] fg/offset: as-pair 0 negate sc/position ] return text "Panel's height difference " td: text ] hiiamboris 16:16ah, if only copy pasting from this stupid chat was so easy 16:20![](https://i.gyazo.com/74319a1d34b8e2c62183a232f36f4521.gif) 16:21what must I do to make it stuck? cosacam1 16:22drag on the blue, not on the scroll bar hiiamboris 16:23I see 16:24well I suppose loose has some limits? 16:25I suggest using on-down/on-up/on-over events instead for this cosacam1 16:31ok, thanks. Any other suggestion, guys? Thursday 17th November, 2022 bubnenkoff 12:33what is the good way to check first word letter if it any symbol from list? data-key: '!foo if ( find any [#"!" #"-"] (first to-string data-key) ) [print "modificator detected"] error: find does not allow char! for its series argument hiiamboris 12:37your way is fine, just don't misuse find bubnenkoff 12:40thanks! It seems that this way is work too data-key: '+foo if ( find [! - +] (to-word first to-string data-key) ) [print "modificator detected"] 14:10hm... is it possible to change spelling of set words here? data: [ -key: "some text" ] if ( find [! - +] (to-word first to-string key) ) [ data/:key: to-word (remove at to-string key 1) ] probe data to get: data: [ key: "some text" ] hiiamboris 14:46you'll figure this out yourself bubnenkoff 14:50right direction? data: [ foo: "some text" ] change data foo 'bar ? 14:54yes, right: data: [ foo: "some text" ] replace data 'foo (to-set-word 'bar) probe data out: [bar: "some text"] hiiamboris 14:57:+1: 14:57split big problem into smaller ones and solve these 14:58exactly Friday 18th November, 2022 bubnenkoff 09:05@hiiamboris and what about map? Is it possible to change key name in map? 09:08replace and change do not work with map 09:10it seems the only way is remove old and create new one key hiiamboris 09:46> it seems the only way is remove old and create new one key yes Monday 21st November, 2022 bubnenkoff 13:25I need to display pressed button (or any other kind of visual accent). I tried property selected but it's do not work: view [b: button button [b/selected: true] ] hiiamboris 13:31well that would be some weird UX bubnenkoff 13:33hm... is there any pressed flag for button? hiiamboris 13:42no 13:42perhaps you should use checkbox instead of a button pekr 13:43Well, in old VID it was a toggleIIRC, but it was a custome gfx. Not sure it exists in RED VID, as the widgets are native, so I doubt it ... bubnenkoff 13:45Is there any way to detect witch radio button is actived without adding labels and complex logic of iteration? view [ radio radio radio ] hiiamboris 13:46on-change should work toomasv 14:59 view [style pet: radio on-change [print [face/extra pick ["is born" "is killed"] face/data]] pet extra "Tom" pet extra "Jerry"] Tuesday 22nd November, 2022 bubnenkoff 09:15Why control is not marked as selected after window creation: view [r: radio with [selected: true]] hiiamboris 10:12study the source of set-focus 11:01sorry I was AFK mostly 11:01seems like that doesn't work either, only focus keyword in VID bubnenkoff 11:03maybe it's an issue? Because it's expected to work as in my code hiiamboris 11:04seems like data facet controls it 11:04which sort of makes sense 11:05OTOH it also makes sense to only have one selected radio button per panel, or per some explicit radio group, and for that parent/selected makes sense.. except it conflicts with the focus model 11:07indeed there's a hack that handles per-panel selection (in View code): ;-- Radio faces handler -- insert-event-func [ if all [ event/type = 'click event/face/type = 'radio ][ foreach f event/face/parent/pane [ if all [f/type = 'radio f/data][f/data: off show f] ] event/face/data: on show event/face event/type: 'change ] event ] 11:09so I should guess that it was designed so user clicks select one radio per panel, but if you're doing it all programmatically then you're on your own greggirwin 19:06I want to say there was a facet to control radio grouping in R2, but that may have been something @rgchris did in his style. Wednesday 23th November, 2022 Rebol2Red 10:59Can someone explain the differences (the big picture, not the details) between the three versions of Red (Gui, Console and Toolchain version). Is there a version or a hack by which I can redirect the output of Red to a file? Like red.exe test.red > c:\output.txt hiiamboris 11:24Have you seen the main page? https://www.red-lang.org/ 11:28Redirection works fine from CLI console. dockimbel 11:30It's also briefly explained at the top of the Download page... Rebol2Red 12:15@hiiamboris Thanks ldci 12:16@Rebol2Red Red CLI : Red interpreter and CLI console. Without graphical interface. Red GUI : Red interpreter and View DSL including GUI console. All you need for graphical apps. Red Toolchain : Encapper for Red and Red/System compiler. If you want to compile and distribute your code. Rebol2Red 12:21You need a toggle button with an image toggle: func ['word][set word not get word] im1: make image! 100x100 ; im1: load %image1.jpg <- change to one of your own pictures draw im1 [box 0x0 100x100 circle 50x50 45] im2: make image! 100x100 ; im2: load %image2.jpg <- ; change to one of your own pictures draw im2 [box 10x10 90x90] sw: true ; a switch must be true at startup view [ title {RvS - Togglebutton @2022} size 500x500 at 200x200 b: button 100x100 "click me" im1 [ ; <- adjust buttonsize to biggest pictures size toggle sw case [ sw = true [b/image: im1] sw = false [b/image: im2] ] ] ] Too bad you can't have this resizing with the button image im1: make image! 100x100 draw im1 [box 0x0 100x100 circle 50x50 45] im2: make image! 100x100 draw im2 [box 10x10 90x90] view [ image 50x50 im1 image 50x50 im2 ] So you must resize your pictures outside of Red with Irfanview or the like 12:37You can have as many switches as you want toggle: func ['word][set word not get word] sw1: true sw2: false loop 5 [ toggle sw1 print sw1 toggle sw2 print sw2 ] In regard to my comment "; a switch must be true at startup" this is needed over there otherwise the picture only changes after the second click on it. 13:01Using togglebutton with your own pictures: toggle: func ['word][set word not get word] im1: load %image1.jpg ;<- change to one of your own pictures im2: load %image2.jpg ;<- change to one of your own pictures view [ title {RvS - Togglebutton @2022} size 500x500 at 200x200 b: button 100x100 im2 [ ; <- adjust buttonsize to biggest picture size or adjust pictures to buttonsize toggle sw case [ sw = false [b/image: im1] sw = true [b/image: im2] ] ] do [ sw: true ; in this case the switch must be true at startup ] ] 13:21@ldci Thank you, it is all clear now. (I accidently deleted this post) rgchris 14:52> I want to say there was a facet to control radio grouping in R2, but that may have been something @rgchris did in his style. @greggirwin No, I believe that was standard. The OF keyword was used for grouping, see this answer here: https://stackoverflow.com/a/6403025/292969 greggirwin 18:38Thanks @rgchris. :+1: cosacam1 19:39Hi again . Take a look at this 19:40 >> c: blue == 0.0.255 >> find [red green blue] c == none >> c: "John" == "John" >> find ["Jane" "John" "Joe"] c == ["John" "Joe"] >> 19:41why does it find the string in the list but not the tuple? dockimbel 19:52 lisp >> foreach item [red green blue] [probe type? item] word! word! word! >> foreach item reduce [red green blue] [probe type? item] tuple! tuple! tuple! cosacam1 20:08I see. Thanks. BTW did you see my drag problem above? 20:10@luce80 About my drag problem. Thanks for your reply but make the following changes to it and you'll get stuck when dragging the blue. 20:13 p: panel loose blue [ origin 0x0 space 0x0 below style area: area 250x100 area "A" area "B" area "C" area "D" area "A" area "B" ; ... insert a lot of areas A thru C ] with [size/x: 300 ] hiiamboris 20:15I already told you how to properly implement dragging. 20:17Otherwise, reduce it to a **minimal** example that shows it's a bug in Red, so we can fix it. cosacam1 20:19yes, I know, using mouse events, thanks but I'm just curious about this. Besides, I'm working in two projects at the same time. I haven't had time. Thanks again. 20:38I'm sorry, maybe I bother you guys but I only have internet access once and a while so... Here is the example. No scroller, only dragging. 20:40 Red [needs 'view] view [ bg: panel 300x300 [ origin 0x0 space 0x0 fg: panel blue loose [ ; just drag on the blue style a: area 100x50 origin 0x0 space 0x0 below a "A" a "B" a "C" a "D" a "A1" a "B1" a "C1" a "D1" a "A2" a "B2" a "C2" a "D2" a "A3" a "B3" a "C3" a "D3" a "A4" a "B4" a "C4" a "D4" a "A5" a "B5" a "C5" a "D5" ; get stuck when reaching here a "A6" a "B6" a "C6" a "D6" a "A7" a "B7" a "C7" a "D7" a "A8" a "B8" a "C8" a "D8" a "A9" a "B9" a "C9" a "D9" ] with [size/x: 200] on-drag-start [system/view/auto-sync?: no] on-drag [fg/offset/x: 0] on-drop [system/view/auto-sync?: yes] ] ] hiiamboris 20:46well, so far it still looks like a bug in your code - draggable face just gets hidden cosacam1 20:51The draggable face is the blue panel which contains the areas or whatever other faces we can put in it. I never hide anything. Can you drag it until you see "D9" area? And back again until "A" area. I can't. My Red version is dated to 12-Nov-2022/17:58:23. My system is Win 10. hiiamboris 20:53this shows the bug: view [ size 300x300 at 0x-1000 base 300x2100 "DRAG ME" cyan loose on-drag [?? event/offset] ] 20:54would you like to fill an [issue report](https://github.com/red/red/issues/new?template=bug_report.md) ? cosacam1 20:59well, for the sake of a better Red... yes 21:04may I use your example for the issue? it's shorter than mine. Or you may report it if you want hiiamboris 21:11indeed, use my example :) 21:11if your internet drops again, I'll file a report tomorrow myself cosacam1 21:37Thanks. Done. hiiamboris 21:44:+1: cosacam1 21:47And actually my internet doesn't drops, only that we have a lot of blackouts in my country, my phone (which I use as modem) is broken and I deppend upon a neighbour wifi... well, at least I have a laptop, a brain and a good Red community, thanks God. loziniak 21:50 >> f: function [code [block!]] [res: do code either unset? res [none] [res]] == func [code [block!] /local res][res: do code either unset? res [none] [res]] >> f [123] == 123 >> f [none] == none >> f [()] *** Script Error: res: needs a value *** Where: res *** Near : () *** Stack: f is there a possibility to make last call return none without repeating do code? 21:53i.e. without doing like this: >> f: function [code [block!]] [either unset? do code [none] [do code]] == func [code [block!]][either unset? do code [none] [do code]] >> f [()] == none 21:57My usecase is [my unit test library](https://github.com/exercism/red/blob/main/_templates/practice-exercise/testlib.red) - lines 31 and 52 (result: do code). cosacam1 21:59How about this? 21:59 >> f: function [code [block!]] [either empty? code [none][do code]] >> f [123] == 123 >> f [none] == none >> f [()] >> f compose [()] == none >> f [] == none >> loziniak 22:04hmm your example indeed solves [()] case, but it should return none for every *code* that returns unset!, like ["blabla" ()] as well: >> f: function [code [block!]] [either empty? code [none][do code]] == func [code [block!]][either empty? code [none] [do code]] >> f ["blabla" ()] >> type? f ["blabla" ()] == unset! hiiamboris 22:09@loziniak set/any loziniak 22:12 >> b: 5 == 5 >> f: function [] [b: 13 set/any 'b () probe b] == func [/local b][b: 13 set/any 'b () probe b] >> f *** Script Error: b has no value *** Where: probe *** Near : b *** Stack: f probe >> b == 5 22:12I need it to set local word in function hiiamboris 22:13@loziniak get/any ☻ loziniak 22:14:-D hiiamboris 22:14(although Red has also this handy :b notation - just don't tell anyone) cosacam1 22:14However 22:14 >> unset? ["ccc" ()] == false Oldes 22:15Of course, because it is a block. Or maybe you want to evaluate the block? >> unset? do ["ccc" ()] == true cosacam1 22:18You guys, with that tricky programming... I still need to learn a lot :) loziniak 22:19we all learn all the time! cosacam1 22:19yeap 22:22well, I must leave you guys. In a few minutes they'll cut the electricity. It's been a pleasure, as always. hiiamboris 22:23move to a colder country, cutting electricity there so often is not an option ;) loziniak 22:25there's something special in Red community that it attracts people from former or even current communist countries :-D 22:25sleep well @cosacam1 cosacam1 22:26@hiiamboris not so easy man... never mind. @loziniak maybe the name? Red hahaha loziniak 22:27hahaha you bet! 22:32anyway, problem solved. thank you guys very much! Thursday 24th November, 2022 bubnenkoff 09:33I need to pass path to map to function and than access to it's data. But I am getting none: template2: #( section_aaa: #( aa: 111 bb: 222 cc: 333 lots: [ ] ) ) f: function [data [path!]] [ print type? data probe data probe data/aa ; here ] f to-path template2/section_aaa What I am missing? type is path! probe print right data because it's evaluate path to data. But how to access to /aa field? I am getting: none == none hiiamboris 09:46read [path docs](https://codeberg.org/hiiamboris/red-docs/src/branch/master/en/datatypes/path.adoc) to understand it 09:46![](https://i.gyazo.com/b39926668f33dae1fd2be32aaef3c6eb.png) 09:47> it's evaluate path to data. This is where your assumption is wrong 09:47You made a path with a literal map inside. bubnenkoff 09:58Egh... after re-reading docs still not understand idea... I should extract map from path? hiiamboris 10:06path accessor data/aa selects on the path data (not the map) bubnenkoff 10:07yes I already understood this 10:08but how to make map from data? data: reduce data I have only this idea, but it do not work hiiamboris 10:09don't 10:09you should not have put a map inside a path in the first place 10:10(unless you know what you're doing, but you do not) bubnenkoff 10:10But I think that I understand what I am doing and I need to pass path exactly to map 10:13 template2: #( section_aaa: #( aa: 111 bb: 222 cc: 333 lots: [ ] ) ) f: function [data [path!]] [ print type? data ; doing some operations with passed map ] f to-path template2/section_aaa ; passing path to map hiiamboris 10:15in your f above change probe data/aa to probe data/1/aa 10:15when you really understand why it works, you will realize you've had no idea what you were doing ;) bubnenkoff 10:16oh! thanks! that's work! template2: #( section_aaa: #( aa: 111 bb: 222 cc: 333 lots: [ ] ) ) f: function [data [path!]] [ print type? data data: first data ; getting map from path probe data/aa ] f to-path template2/section_aaa hiiamboris 10:17so why pass a path if you only need a map? ;) bubnenkoff 10:24you asking right questions) One reason was to make function able to process blocks and maps with same key-value structure... I need to think more about it.. loziniak 17:44Hi! Is there a reason why in Red and Rebol while has condition block and if has condition expression? hiiamboris 17:45Because while expression would otherwise be evaluated only once before entering while :) Friday 25th November, 2022 loziniak 10:38makes sense! thanks. bubnenkoff 14:58Hm... I need to change spelling key in map and save it's position: x: #(foo: 1 bar: 2 baz: 3) for example I need to get: x: #(foo: 1 test: 2 baz: 3) ; bar -> test But remove\adding key with another spelling change order of elements hiiamboris 15:00maps have no position 15:00they're unordered bubnenkoff 15:01Yes, but I need to display data in map in same order... to make it easier to read... hiiamboris 15:11don't use maps then 15:26well, if your maps are small and you're using them for convenience, not performance, then you can just re-create them 15:28make #() head change find to [] x 'bar 'test Sunday 27th November, 2022 loziniak 11:11Hi! Is this intentional, that the last version available to download on project page is from 17 Aug? 11:12When I click "History", there are newer versions as well. hiiamboris 11:1217 you say? 11:13![](https://i.gyazo.com/5d54ba4de207b473020679dcb3250a44.png) loziniak 11:13red-view-17aug22-d99a1018a hiiamboris 11:15lol, how is this possible? loziniak 11:15[![image.png](https://files.gitter.im/5780ef02c2f0db084a2231b0/MkxY/thumb/image.png)](https://files.gitter.im/5780ef02c2f0db084a2231b0/MkxY/image.png) hiiamboris 11:16in a fresh browser all ok 11:16wow loziniak 11:16haha just checked, 26 Nov too here in another browser :-) hiiamboris 11:17ctrl+shift+r doesn't cure it either 11:19what fixed it is removing offline data stored by static.red-lang.org 11:20@dockimbel loziniak 11:20 HTTP/2.0 200 OK X-Firefox-Spdy: h2 content-length: 8216 content-type: text/html date: Wed, 17 Aug 2022 16:02:26 GMT last-modified: Wed, 17 Aug 2022 14:44:48 GMT server: Caddy, Cheyenne/0.9.20.dev Wed, 17 Aud 2022 :-) 11:25it also helps when you remove ?reload=true from URL. dockimbel 14:28From Chrome, I get: content-length: 8216 content-type: text/html date: Sun, 27 Nov 2022 14:26:25 GMT last-modified: Sat, 26 Nov 2022 16:23:01 GMT server: Caddy server: Cheyenne/0.9.20.dev 14:30The Download page relies on a````
