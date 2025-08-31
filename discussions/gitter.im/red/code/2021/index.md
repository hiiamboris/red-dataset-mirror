# Archived messages from: [gitter.im/red/red/code](/gitter.im/red/red/code/) from year: 2021

## Sunday 31st October, 2021

digitalbeat

[17:31](#msg617ed3097db1e3753e738cb1)This is probably another dumb question but I have been trying to understand view and vid or maybe that should be vid and view capabilities in Red for awhile now. I have a database that I am reading 1 to n records that match some search value - all good so far. HOW do I display the results using view or vid?

I would prefer to display several lines at a time and then maybe a new screen (more) if I have more than several lines of data. I dont want a simple text dump but formatted so in this example it would say on each line.  
City: New York" State: New York  
City: Chicago State: Illinois  
....  
City: Dallas State: Texas

based on (in this example) a csv file that looks like  
\["2019 rank" "City" "State" "2019 estimate"]  
\["1","New York" ,"New York", "8,336,817"]  
\["2","Los Angeles", "California", "3,979,576"]  
\["3" ,"Chicago" ,"Illinois" ,"2,693,976"]  
\["4" ,"Houston" ,"Texas" ,"2,320,268"]  
\["5" ,"Phoenix" ,"Arizona", "1,680,992"]  
\["6" ,"Philadelphia" ,"Pennsylvania", "1,584,064"]  
\["7" ,"San Antonio" ,"Texas" ,"1,547,253"]  
\["8" ,"San Diego" ,"California", "1,423,851"]  
\["9" ,"Dallas" ,"Texas" ,"1,343,573"]  
\["10" ,"San Jose" ,"California", "1,021,795"]

I dont think I can use foreach inside the view block - just drawing a blank finding a simple red language example on reading and displaying formatted table data.

endo64

[17:42](#msg617ed57e2197144e849ad513)We currently don't have grid/table in VID. So you can check Rich Text Dialect (RTD).

greggirwin

[18:45](#msg617ee4618c019f0d0b6a35bf)Until we do have a grid, you can use a `text-list` and format the data you want to display in it. Another approach is to either generate the faces dynamically, or create them once and assign data to them in "page" groups.

henrikmk

[19:47](#msg617ef2b829ddcd029356336c)What is the state on grid? Anyone working on it?

digitalbeat

[21:00](#msg617f03de9d20982e4ff22f22)ok thanks I didn't realize the text-list contents allowed formatting. ill look into that approach but it sounds like doing something with rich text may be my best approach.

## Monday 1st November, 2021

greggirwin

[18:30](#msg6180325098c13e75500da74b)@digitalbeat you just build up strings to be each row in the text-list, so not "formatting" per se, just control over what is in there.

[18:31](#msg618032758c019f0d0b6d86fe)@henrikmk the deepest work on a grid is probably in @hiiamboris' red-spaces project on gitlab.

hiiamboris

[18:55](#msg61803820d3ae402e47830883)Red regressed so much while I wasn't looking that Spaces won't run anymore :D

[18:58](#msg618038ebcd4972068b811dcf)I'll take a look tomorrow. This task should be dead simple.

greggirwin

[19:03](#msg618039f23f09d857364affa1)Life on the bleeding edge.

## Tuesday 2nd November, 2021

henrikmk

[11:48](#msg618125ab38377967f48b4449)@greggirwin ok, thanks

hiiamboris

[15:07](#msg61815440ee6c260cf7562a4c)@digitalbeat to get your data displayed using \[spaces](https://gitlab.com/hiiamboris/red-spaces/)  
!\[](https://i.gyazo.com/821bd4ff92106377b7f4bceca5eb6a2f.gif)  
Here's the code:

```
Red [needs: view]

recycle/off
change-dir %..
do %everything.red

city-data: load replace/all {
["2019 rank" "City" "State" "2019 estimate"]
["1","New York" ,"New York", "8,336,817"]
["2","Los Angeles", "California", "3,979,576"]
["3" ,"Chicago" ,"Illinois" ,"2,693,976"]
["4" ,"Houston" ,"Texas" ,"2,320,268"]
["5" ,"Phoenix" ,"Arizona", "1,680,992"]
["6" ,"Philadelphia" ,"Pennsylvania", "1,584,064"]
["7" ,"San Antonio" ,"Texas" ,"1,547,253"]
["8" ,"San Diego" ,"California", "1,423,851"]
["9" ,"Dallas" ,"Texas" ,"1,343,573"]
["10" ,"San Jose" ,"California", "1,021,795"]
} "," ""

view [
	host [
		grid-view with [
			size: 300x100								;-- grid visible size
			source: city-data							;-- data source
			grid/pinned: 0x1							;-- pin 1st row
			grid/heights/default: 'auto					;-- automatically size rows
		]
	]
]
```

But you have to use Red builds of September 2 or prior, before `forall` started crashing. You can build Red console at any commit by download downloading a zip snapshot and following instructions on \[the main page](https://github.com/red/red/)

greggirwin

[19:35](#msg61819308cd4972068b84512b):clap: @hiiamboris

## Sunday 21st November, 2021

GiuseppeChillemi

[16:38](#msg619a761975fa481649492939)Could someone explain?

```
>> o: make map! #(a: 22 b: 33 c: 44)
== #(
    a: 22
    b: 33
    c: 44
)
>> o/2: 99
== 99
>> o
== #(
    a: 22
    b: 33
    c: 44
    2 99
)
```

[16:39](#msg619a762c76e3791755fa0526)I think it is a bug but maybe a "feature"

toomasv

[16:44](#msg619a77548f98cb0811820046)\[Feature](https://github.com/red/docs/blob/master/en/datatypes/map.adoc)

hiiamboris

[16:55](#msg619a7a0c8853d3164009e191)map is not a series

```
>> find series! map!
== false
```

GiuseppeChillemi

[16:56](#msg619a7a238f98cb08118207e5)I have read:

\*setting a key that did not exist previously in the map, will simply create it.*

And I admit I totally dislike this "feature". It makes working with `map!`, `block!` and `object!` using path, different from each other. Let me explain:

toomasv

[17:00](#msg619a7b378f98cb0811820a11)It is (and should be) different.

rebolek

[17:00](#msg619a7b4263c1e83c951f1ce6)Of course, they are different from each other.

[17:01](#msg619a7b58c6149e5349412aa8)`map!` is unordered, there is no second value.

GiuseppeChillemi

[17:01](#msg619a7b6b026dc63ca60b54ff)@rebolek Touchè!

[17:13](#msg619a7e2babdd6644e39991ef)The problem is the congruency in the accessing style:

If you have a `ROW` of data expressed as:

```
o: make map! #(a: 22 b: 33 c: 44)
m: make object!! [a: 22 b: 33 c: 44]
b: [a 22 b 33  zc44]
```

setting them  
`object!`

```
>> probe o
>> o/z: 33
>> 
make object! [
    a: 22
    b: 33
    c: 44
]
```

`map!`

```
>> M/z: 33
== 33
>> probe m
#(
    a: 22
    b: 33
    c: 44
    z: 33
)
```

`block!`

```
>> b/z
== none
>> b/z: 22
*** Script Error: cannot set none in path b/z:
*** Where: set-path
*** Stack:
```

[17:17](#msg619a7f3e8853d3164009ed31)If you work with the same data in different containers, you must handle 3 routines.

hiiamboris

[17:21](#msg619a800563c1e83c951f2741)use `put` &amp; `select` for more consistency

[17:21](#msg619a801cb5ba9e5a11ca652b)or use `hash!` since you have blocks anyway

GiuseppeChillemi

[17:32](#msg619a82ad026dc63ca60b63da)Also reading is different:

`object!`

```
>> o/z
*** Script Error: cannot access z in path o/z
*** Where: catch
*** Stack:
```

`block!`

```
>> b/z
== none
```

`map!`

```
>> m/z
== none
```

And working with indices is different:

`block!`: supported  
`map!`: not supported because `integers!` could be keys! and no ordering is guarranted (and set path it generates a key)  
`object!`: not supported (but it could, as position is preserved)

[17:33](#msg619a82d776e3791755fa21b4)Couldn't some differences be changed in favour of uniformity?

[17:34](#msg619a8337197fa95a1c835536)In `objects!` it would be nice to have a positional accessor to do things like this:  
`pick o 1`

toomasv

[17:35](#msg619a836a8f98cb0811821a02)As @hiiamboris just said you can make selecting more consistent with `select`.

```
>> o: object body-of m: make map! b: [a 22  b 33  c 44]
== make object! [
    a: 22
    b: 33
    c: 44
]
>> select b 'z
== none
>> select m 'z
== none
>> select o 'z
== none
```

\`

GiuseppeChillemi

[17:36](#msg619a83a275fa48164949473a)So, when you store the same data in different containers, even a plain table block with like `[[a b c][22 33 44]]` you access the data using the same picker.

toomasv

[17:36](#msg619a83ae75fa481649494757)But `put` will still be different.

GiuseppeChillemi

[17:37](#msg619a83e78853d3164009f815)@toomasv Yes, I have tried `select` it gives more consistency

[17:47](#msg619a8644cd3f06175dca40c6)But as I have written before: people need a simple and common way of working when using the same instrument, otherwise they will be confused from receiving different results doing the same things. Imagine being a newcomer and having to learn so many combinations of `datatype!`, `command` ,desired-action, `result`, `errors-situations`. @toomasv you are the mathematician here: how many different combinations does this number of variables create?

toomasv

[17:50](#msg619a8700c2cc0e5343c0bbc5)But with map, object and block you have there instruments not "same" instrument. You can of course use single instrument and still have several ways to access and put things into it.

hiiamboris

[17:53](#msg619a87abb5ba9e5a11ca774b)@GiuseppeChillemi we advocated ordered maps with @giesse previously but no one esle supported

GiuseppeChillemi

[17:54](#msg619a87c0c2cc0e5343c0bcf0)I have not read the thread

[17:54](#msg619a87f1c2cc0e5343c0bd3c)But I am in favour of order in MAPS and also in objects. So you can work with indices.

hiiamboris

[17:55](#msg619a880d75fa481649495020)we did not advocate indexes ;)  
I like indexes in maps as they are

[17:55](#msg619a881ac2cc0e5343c0bd94)and again point you into `hash!` direction

GiuseppeChillemi

[17:56](#msg619a88638f98cb0811822601)Also, as `MAP!` is an easy and fast way to store database ROWS, where the position is important to keep a cursor, and even more important when this is tied with sorted data.

rebolek

[17:57](#msg619a88a375fa48164949520a)What is the advantage of map! here?

[17:58](#msg619a88bc76e3791755fa2f06)If you have rows, why not using block?

GiuseppeChillemi

[17:58](#msg619a88bca9c8eb44c4eec119)Speed and Keyed access?

hiiamboris

[18:00](#msg619a892b197fa95a1c836148)and third time I point you into `hash!` direction

[18:00](#msg619a8932cd3f06175dca465c)it becomes absurd at this point

rebolek

[18:00](#msg619a894b026dc63ca60b7048)what keys are you using for rows?

GiuseppeChillemi

[18:01](#msg619a8981abdd6644e399aace)either single one or keys in multiple columns

rebolek

[18:05](#msg619a8a608853d316400a050b)

```
db: [
    [name age]
    [morlok 3'000]
    [ujo 35]
]
```

Here I have a simple DB in block, what keys would you use if it was a map?

GiuseppeChillemi

[18:07](#msg619a8acacdb5c1081a23d4bc)Name and Age on each line.

rebolek

[18:08](#msg619a8b3163c1e83c951f42f3)So it would be ordered not by rows but by columns, I see.

[18:09](#msg619a8b4042fc2863b21deddd)However, you wrote: "Also, as MAP! is an easy and fast way to store database ROWS"

GiuseppeChillemi

[18:17](#msg619a8d38cd3f06175dca4f3a)Now you have this:

```
cs-headings: [name age]
customers: [
  1 [morlok 3'000]
  2 [ujo 35]
]

or: headings [customer product price]
orders: [
  a [1 "Headphone" USD$50]
  b [1 "Diagrammar" USD$129]
  c [3 "Diagrammar" USD$129]
]
```

How do would you build a JOIN in one data structure with reference to the originating blocks, keeping headings and having local indexes and data too?

[18:27](#msg619a8f87cdb5c1081a23deb7)I mean this:

```
#(
join-internal-id: 1 cached: true join: #(order: a customer: 1 product: "Headphone" price: USD$50)
join-internal-id: 2 cached: true join: #(order: b customer: 1 product: "Diagrammar" price: USD$129)
join-internal-id: 3 cached: false join: #(order: c customer: 3 product: "Diagrammar" price: USD$129)
)
```

rebolek

[18:30](#msg619a904463c1e83c951f4dc1)I don't see why you have indexes there.

GiuseppeChillemi

[18:30](#msg619a90628f98cb08118236c7)What you mean?

[18:32](#msg619a90a0c2cc0e5343c0cecd)They can be referenced by a VID object if you are talking about `join-internal-id`

rebolek

[18:32](#msg619a90ae42fc2863b21df9d7)What's the point of

```
customers: [
  1 [morlok 3'000]
  2 [ujo 35]
]
```

instead of

```
customers: [
  [morlok 3'000]
  [ujo 35]
]
```

GiuseppeChillemi

[18:33](#msg619a90ecb5ba9e5a11ca8e33)How do you reference `customers` externally if the order changes?

rebolek

[18:33](#msg619a90f942fc2863b21dfa7b)Why the order changes?

GiuseppeChillemi

[18:34](#msg619a9148197fa95a1c837281)Because if you query your block with a "where" type action, the resulting set has different positions, and if you need to backlink to the originating table, you need a key

rebolek

[18:36](#msg619a91cbb5ba9e5a11ca8fcd)Your block can be the key. And how can a query change the order?

GiuseppeChillemi

[18:38](#msg619a920a8f98cb0811823a2a)About :point\_up: \[21 novembre 2021 19:27](https://gitter.im/red/red/code?at=619a8f87cdb5c1081a23deb7)  
If you handle external data, you have no control over the columns name, your internal keys could have the same column name of the external row, so you need this kind of structure.

rebolek

[18:39](#msg619a926da9c8eb44c4eed503)I don'ŧ understand, it sounds to complicated to me. I probably would need to see your data.

GiuseppeChillemi

[18:42](#msg619a930e6104ea63b6aa12fa)&gt; Your block can be the key. And how can a query change the order changes?

Try this one:

```
customers: [
  1 [morlok 3'000 alabama]
  2 [ujo 35 texas]
]
```

Create an order view from an action on customers like:

"Select name, age where age &lt; 2000"  
And the result is:

```
orders-view: [
   [ujo 35]
]
```

How do you backlink to `customers` to retrieve the "state" without a key?

rebolek

[18:48](#msg619a94688853d316400a1cdc)Simply:

```
; define data
>> customers: [[morlok 3'000 alabama] [ujo 35 texas]]
== [[morlok 3000 alabama] [ujo 35 texas]]

; make func to run queries (for the sake of simplicity doesn't use column names)
>> sel: func [db code][collect [foreach row db [if do code [keep/only row]]]]
== func [db code][collect [foreach row db [if do code [keep/only row]]]]

; run it and get results
>> result: sel customers [row/2 < 2000]
== [[ujo 35 texas]]

; check result against original data
>> find/only customers result/1
== [[ujo 35 texas]]
```

GiuseppeChillemi

[18:50](#msg619a9505b5ba9e5a11ca96ba)And?

```
customers:  [[morlok 3000 alabama] [ujo 35 texas] [ujo 35 california]]?
```

rebolek

[18:51](#msg619a954876e3791755fa4b4b)That doesn't change anything, you will get a new block with two values, but they still point to original values, they are the same blocks.

greggirwin

[18:52](#msg619a957bc6149e5349416033)Adding user level access notes to {this wiki page](https://github.com/red/red/wiki/%5BDOC%5D-Comparison-of-aggregate-values-(block!-vector!-object!-hash!-map!)) would be great.

We do want to leverage consistency as much as possible, including with `make` and `copy` which are important aspects to me. \*But* that doesn't mean every structure can or \*should* support exactly the same interface. It may seem to solve a problem, but often just pushes it around. If it's the simple fact that errors don't occur, you just end up checking datatypes when you need to know that. If it's that you want indexed access, but a type doesn't guarantee it, you may assume something that isn't true. I agree that conversions can be a pain, and helpers that handle the differences are an extra step, but at the language level we have to look at what lets people build the specific solutions they need from the general features Red provides.

rebolek

[18:52](#msg619a957c76e3791755fa4b9b)

```
>> customers: [[morlok 3'000 alabama] [ujo 35 texas] [ujo 35 california]]
== [[morlok 3000 alabama] [ujo 35 texas] [ujo 35 california]]
>> result: sel customers [row/2 < 2000]
== [[ujo 35 texas] [ujo 35 california]]
>> same? customers/3 result/2
== true
```

GiuseppeChillemi

[18:55](#msg619a9635c6149e5349416187)Oh, yes, I have understood your technique, you backlink using series internal reference, but there could be times where you want this to be explicit.

rebolek

[18:58](#msg619a96d5026dc63ca60b8e19)I thought so in the past too.

greggirwin

[19:00](#msg619a9735a9c8eb44c4eee062)@GiuseppeChillemi how much data are we talking about? And what are your performance requirements? Blocks are \*the* general solution. As @hiiamboris notes, `hash!` is just a block with faster access, paying the price on writing/changes to offer that.

GiuseppeChillemi

[19:01](#msg619a979d42fc2863b21e0861)@greggirwin You are right but if those features are of marginal use case, it is better to not add a difference and keep the same working. For example, path on a non-existent key in objects led to error while on other data led to `none`. It's ok for me to keep this as I see it could be important. But using a `path` to put a value on `map` seems not so useful.

greggirwin

[19:02](#msg619a97d88853d316400a25dd)One man's marginal use case is another's necessary feature. :^)

GiuseppeChillemi

[19:02](#msg619a97e1cd3f06175dca65b4)@greggirwin We are talking about 1M rows.

[19:03](#msg619a97ff6104ea63b6aa1d0d)@greggirwin :) That's the relativeness of things, the `R` in Rebol.

rebolek

[19:03](#msg619a98058853d316400a263d)Wow, how much memory does it take.

[19:03](#msg619a981ecd3f06175dca660d)With so many rows I wouldn't want to waste space with unnecessary indexes :-)

greggirwin

[19:04](#msg619a9836cd3f06175dca662c)Some of this \*is\*, as we admit, implementation details leaking out a bit, which we have to weigh against justifying how you think about things. What helps you to understand versus things you can safely ignore.

GiuseppeChillemi

[19:05](#msg619a987c026dc63ca60b913c)@rebolek Actually, I process it on SQLServer but I would like to mirror the data set inside Red to process it faster when it will possible.

greggirwin

[19:06](#msg619a989ac6149e534941668e)~1M is a great size for this discussion. Beyond what I feel I could comfortably brute force, but small enough that I wouldn't want to build a complex infrastructure.

[19:08](#msg619a991a197fa95a1c83842c)The real catch, though, is how you want and need to query it. This is where there's a huge gap between SQL engines and simpler ISAM models. I want to build the latter into Red, which is the foundation for higher level models.

GiuseppeChillemi

[19:08](#msg619a9948abdd6644e399cde2)It is 15 years of the company's data: 10 rows per document 6000 documents each year. And you have to backlink them to the Customer and Articles tables.

[19:10](#msg619a99c3026dc63ca60b9360)@greggirwin I would like to experiment. Actually @henrikmk List-View component on Vid-Extension-Kit is able to handle such data using a block of objects structure but I have tried upto 200K entries.

rebolek

[19:12](#msg619a9a00b5ba9e5a11caa169)I have a \[query dialect](https://github.com/rebolek/red-tools/blob/master/qobom.red) for block of maps, but can be easily adapted for a block of blocks too.

GiuseppeChillemi

[19:12](#msg619a9a2ec6149e53494169c1)@rebolek You are doing great things!

[19:14](#msg619a9a9ecd3f06175dca6a18)I am trying to implement a datatype system on Rebol and port it on Red as soon as the Datagrid component will be ready. I was working on a `make-row` function and started trying the differences between Rebol and Red, so the reason about this topic.

rebolek

[19:16](#msg619a9b0ca9c8eb44c4eee98a)@GiuseppeChillemi thanks :)

greggirwin

[19:18](#msg619a9b71cdb5c1081a23fa30)When I did an image management system I did a few things. 1) use the file system for the images themselves, 2) build indexes for known query needs, 3) break things down by time. That may not work for you, but by splitting up the data, it became more manageable, and query results could then be combined if needed. Often (again in my case) people only cared about the most recent, and "paging back in time" worked well.

[19:20](#msg619a9bfbb5ba9e5a11caa6eb)There are always tradeoffs, and no external DB needs in that case, but it scaled to 100M+ images and ~50TB of data in pure R2.

rebolek

[19:20](#msg619a9c15c6149e5349416e2f)Nice!

GiuseppeChillemi

[19:45](#msg619aa1c2cd3f06175dca7c0b)@greggirwin Imagine loading in memory those 50TB of data :-)

Oldes

[20:36](#msg619aadbfc2cc0e5343c10da7)Having 1M rows where each row is a map is terrible waste of memory and cpu as well. Even having each row as a small block is a waste as block with 3 values is actually block for 8 values etc.

GiuseppeChillemi

[21:53](#msg619abfed42fc2863b21e5844)I see only hash and separated headings block as a solution. Do you have any other?

greggirwin

[22:00](#msg619ac185026dc63ca60bee8f)It's all tradeoffs. With sub-structures you can change them independently, they can vary in structure, etc. With fixed offset values, and no markers at all, changes and direct data viewing become much more difficult.

[22:08](#msg619ac36775fa48164949cf4c)If I have 1M records, each with a couple numbers and a few strings, the size in memory, as sub-blocks, may be ~10x the raw data size. A linear search on a value will take ~1s. So it's well within brute force territory for an in-house system. Add a few more tables though, and you'll hit 32-bit Red limits. Then it's weighing programmer time vs machine time vs future needs.

I never want to be \*needlessly* wasteful, but efficiency often comes with associated costs.

[22:39](#msg619aca99cd3f06175dcad013)I remember in my VB days how battles raged over the use of the Variant datatype and its comparative inefficiency to base types (and other issues). When I transitioned away from VB I was still in the "Variants Bad" camp. That's when I found Rebol, and saw that it \*could* be worth it. The difference, I think, is that variants didn't add any new expressive power. They solved some problems, but caused others.

Soon enough, in the grand scheme of things, we'll have 64-bit value slots. As with Unicode, or Mac fat binaries, it may look like things will explode in size. What we have to ask is if the ROI on that is worth it. Red is a high level language, but we still have Red/System and types like `vector!` that can be leveraged where needed.

Memory is ~$5/GB. Are the limits of Moore's Law, and the world at large, finally going to force us to think differently? Maybe not. Brute force just takes us farther, always just enough for many things, so we don't have to. But what if we \*choose* to? What if all your data didn't live in one process, but was split among communicating processes, even locally? Is this "microservices"? Is it better to have one DB daemon that does it all in a 64GB in memory DB or 16x3GB limited processes? 3GB is still a \*lot* of data, just not by today's (wasteful?) standards where data explosion is the norm. I'm all for "we might need it someday" but even I have my limits.

## Monday 22nd November, 2021

rebolek

[05:50](#msg619b2fb08853d316400b5eea)@Oldes that’s true. In such case flat block and using `/skip` is best alternative.

GiuseppeChillemi

[10:13](#msg619b6d3d8f98cb081184070d)I will try to profile the differences

## Thursday 25th November, 2021

GiuseppeChillemi

[14:31](#msg619f9e30c2cc0e5343cbc788)Well, it seems Red acts better than Rebol here at honoring get value notation.

Rebol:

```
>> fc: reduce [func [a][]]
== [func [a][]]
>> :fc/1
** Script Error: 1 is missing its a argument
** Where: halt-view
** Near: :fc/1
```

Red

```
>> fc: reduce [func [a][]]
== [func [a][]]
>> :fc/1
== func [a][]
>>
```

hiiamboris

[14:38](#msg619f9fe86104ea63b6b5116f)keep in mind `get 'fc/1` is broken though

GiuseppeChillemi

[14:38](#msg619f9ffcc6149e53494c3235)On Red or Rebol?

hiiamboris

[14:39](#msg619fa00b6104ea63b6b51195)nobody breaks Rebol anymore ;)

GiuseppeChillemi

[14:39](#msg619fa0208853d3164014f887)I break it!

hiiamboris

[14:39](#msg619fa033a9c8eb44c4f9b8f1)haha okay do that ;)

[14:40](#msg619fa058abdd6644e3a4a745)no, it was broken in Red

GiuseppeChillemi

[14:41](#msg619fa0a375fa481649545193)

```
>> get 'fc/1
*** Script Error: fc/1 is missing its a argument
*** Where: get
*** Stack:
```

[14:42](#msg619fa0be63c1e83c952a3561)it should evaluate to `get fc/1`

[14:42](#msg619fa0dfa9c8eb44c4f9b9ba)That should not execute the function, should't it?

hiiamboris

[14:43](#msg619fa0ff63c1e83c952a35f6)nope

GiuseppeChillemi

[14:43](#msg619fa11e75fa481649545273)Nope = was I right or wrong?

hiiamboris

[14:45](#msg619fa181197fa95a1c8e529b)it should not

[14:45](#msg619fa188cdb5c1081a2ec30f)that's what I was talking about

Oldes

[16:27](#msg619fb96a8f98cb08118d6d3c)@GiuseppeChillemi in Rebol3 I have:

```
>> fc: reduce [func [a][]]
== [make function! [[a][]]]

>> type? :fc/1
== function!

>> type? get 'fc/1
== function!
```

toomasv

[18:46](#msg619fda1d026dc63ca616f5a2)In Red path notation is "active", evaluating its target. To access passively use other accessors:

```
>> fc: reduce [func [a][]]
== [func [a][]]
>> type? first fc
== function!
>> type? pick fc 1
== function!
```

gltewalt

[19:31](#msg619fe480a9c8eb44c4fa4c88)Yep, path! is an active type

GiuseppeChillemi

[20:29](#msg619ff2356104ea63b6b5c4eb)Path should not be active if you precede it using `'`

## Friday 10th December, 2021

pekr

[09:59](#msg61b324f6b5ba9e5a11fe51aa)Spam?

greggirwin

[17:48](#msg61b392f5cd3f06175dfee3a1)Deleted.
