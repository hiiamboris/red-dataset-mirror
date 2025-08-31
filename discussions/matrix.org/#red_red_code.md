# Archived messages from: https://app.gitter.im/#/room/#red_red_code:gitter.im (https://app.gitter.im/#/room/!lDXMOKKRlhBEmnYSPs:gitter.im)

## 31-Oct-2021

[17:32:07](#u7oR9iNhjAwLiDBzjv5jXK-ANvqnX7rqIWVK8phKBuE) <digitalbeat (digitalbeat)>:
This is probably another dumb question but I have been trying to understand view and vid or maybe that should be vid and view capabilities in Red for awhile now. I have a database that I am reading 1 to n records that match some search value - all good so far. HOW do I display the results using view or vid?

I would prefer  to display several lines at a time and then maybe a new screen (more) if I have more than several lines of data. I dont want  a simple text dump but formatted so in this example it would say  on each line.
City: New York"    State: New York 
City: Chicago      State: Illinois
....
City: Dallas       State: Texas

based on (in this example) a csv file that looks like
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


I dont think I can use foreach inside the view block - just drawing a blank finding a simple red language example on reading and displaying formatted table data. 


[17:42:23](#eizYdjRzHE0q7NeUZ2Tdf4cck2wCB8_0qJ0SteY_Ulk) <endo64>:
We currently don't have grid/table in VID. So you can check Rich Text Dialect (RTD).

[18:45:54](#Wo45pA_LQXjWsceVEsFlDmoIJsnbHu8pu7CjEIEbDas) <greggirwin (Gregg Irwin)>:
Until we do have a grid, you can use a `text-list` and format the data you want to display in it. Another approach is to either generate the faces dynamically, or create them once and assign data to them in "page" groups.

[19:47:06](#OY0Mx2C5rIAgIrBsf7U5I3rq4qjgHx-9HqjnD1_QbRs) <henrikmk (Henrik Mikael Kristensen)>:
What is the state on grid? Anyone working on it?

[21:00:15](#4EfX3pmOAjenwld9Lurj5bqAvOpHYwSYW1g59AiVlhU) <digitalbeat (digitalbeat)>:
ok thanks I didn't realize the text-list contents allowed formatting.  ill look into that approach but it sounds like doing something with rich text may be my best approach. 

## 1-Nov-2021

[18:30:41](#w8qFblvuPkt877aN1DQQsssKPNzauS-lRn_8FoWV3iU) <greggirwin (Gregg Irwin)>:
@digitalbeat you just build up strings to be each row in the text-list, so not "formatting" per se, just control over what is in there.

[18:31:17](#OiSILNCRG5R4Anx38K57QaKv7dkl4r3wb9NAxw7llso) <greggirwin (Gregg Irwin)>:
@henrikmk the deepest work on it is probably in @hiiamboris' red-spaces project on gitlab.

[18:31:33](#nU7zRuJaFNfqgI2dbOYcrOEzB4xq4HkIwRjtXLxbAuc) <greggirwin (Gregg Irwin)>:
* @henrikmk the deepest work on a grid is probably in @hiiamboris' red-spaces project on gitlab.

[18:55:29](#UUxk6YNurf3Jf02zix4FKG2-XWKJ4thqtzGsxbtxR64) <hiiamboris (NOT THIS ONE)>:
Red regressed so much while I wasn't looking that Spaces won't run anymore Ì†ΩÌ∏É

[18:58:52](#NpmCKiCox89ZH9X5ocgTIu4iE-w6h8MhATPC8WxmJLw) <hiiamboris (NOT THIS ONE)>:
I'll take a look tomorrow. This task should be dead simple.

[19:03:15](#KyH60h2CYUxQauc9kV_TMTKzrFgUpFWUqgbjj8g8I3Q) <greggirwin (Gregg Irwin)>:
Life on the bleeding edge.

## 2-Nov-2021

[11:49:00](#cxmv3VTUsxSz-IC7Rg2BirvWXfR5KtoO3EnYvtSjsZc) <henrikmk (Henrik Mikael Kristensen)>:
@greggirwin ok, thanks

[15:07:45](#jYgAKVSeuMSQu9K1yPzxyY_ZbxYH3W9xy2BFHNKfK-w) <hiiamboris (NOT THIS ONE)>:
@digitalbeat to get your data displayed using [spaces](https://gitlab.com/hiiamboris/red-spaces/)
![](https://i.gyazo.com/821bd4ff92106377b7f4bceca5eb6a2f.gif)
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
But you have to use Red builds of September 2 or prior, before `forall` started crashing. You can build Red console at any commit by download downloading a zip snapshot and following instructions on [the main page](https://github.com/red/red/)

[19:35:36](#XS2X2wVGo8hc6OyNHQ2mm14-e4VVxoFGCBsBraofOp4) <greggirwin (Gregg Irwin)>:
Ì†ΩÌ±è @hiiamboris 

## 21-Nov-2021

[16:38:50](#vwArRWmkLnrYYy2BRhelffrUSACGVRCJDGqA_9EX-fU) <GiuseppeChillemi (GiuseppeChillemi)>:
Could someone explain?

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

[16:39:09](#QEm8q2G04nE2fOAp0AU31i1EHimiXCH6gPaBPjC94jI) <GiuseppeChillemi (GiuseppeChillemi)>:
I think it is a bug but maybe a "feature"

[16:44:05](#sgvKRNaNpuS9ev16UFCvpHQCPyu3TebyC1rsypM79lw) <toomasv>:
[Feature](https://github.com/red/docs/blob/master/en/datatypes/map.adoc)

[16:55:41](#Up5HR2LzthRtsC3uQ54eEfcTgtfyZtGkkbBWZKKhWCg) <hiiamboris (NOT THIS ONE)>:
map is not a series

[16:56:03](#L3yKrrL9LZBlsqwbgQM4w-Jsy9ou_GZzkzB5JcTJPBc) <GiuseppeChillemi (GiuseppeChillemi)>:
I have read:

*setting a key that did not exist previously in the map, will simply create it.*

And I admit I totally dislike this "feature". It makes working with `map!`, `block!` and `object` using path different from each other. Let me explain:


[16:56:48](#Uzheop_5IkokFvnSuMRmkLAkc6AsvgdEs7lGpvwyQAc) <hiiamboris (NOT THIS ONE)>:
* map is not a series
```
>> find series! map!
== false
```

[16:57:44](#-Ea-sst7JeQ11-ymYnz5C-vcrf-TzVX5q-YCvZvyR90) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have read:

*setting a key that did not exist previously in the map, will simply create it.*

And I admit I totally dislike this "feature". It makes working with `map!`, `block!` and `object!` using path different from each other. Let me explain:


[16:58:00](#dyFsOXxhJLGEdtR-mcuFf5i58C17gF8zXJmtk58XogY) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have read:

*setting a key that did not exist previously in the map, will simply create it.*

And I admit I totally dislike this "feature". It makes working with `map!`, `block!` and `object!` using path, different from each other. Let me explain:


[17:00:39](#2cv_lopWLNbzwL2PcdpSfvuSqcn8FYIxOaqFX3kLP-g) <toomasv>:
It is (and should be) different.

[17:00:51](#30G9xzM0Um401x227ChpKUpzCD0c0YWzxa-FUUVpX0w) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Of course, they are different from each other.

[17:01:12](#FAe3hdW5hg1Ge6hDV08CACtzilc405o6HXYMxzLBEnI) <rebolek (Boleslav B≈ôezovsk√Ω)>:
`map!` is unordered, there is no second value.

[17:01:32](#hnvWFQpi1fJW3FXAMkzcBRq9OqGLRdpZLYuFdvs0uao) <GiuseppeChillemi (GiuseppeChillemi)>:
@rebolek Touch√®!

[17:13:15](#QcWObDk_zONIbptZxJTk59GUsWWuhzfmN6jkd4ANzI8) <GiuseppeChillemi (GiuseppeChillemi)>:
The problem is the congruency in the accessing style:

If you have a `ROW` of data expressed as:
```
 o: make map! #(a: 22 b: 33 c: 44)
m: make object!! [a: 22 b: 33 c: 44]
b: [a 22 b 33  zc44]
```

setting them 
`object!`
```
>> o/z: 33
>> 
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



[17:13:49](#OrtjE1w9__VmQ5_jZpILePOVHWIOrRt1lorPbY5E8oU) <GiuseppeChillemi (GiuseppeChillemi)>:
* The problem is the congruency in the accessing style:

If you have a `ROW` of data expressed as:
```
 o: make map! #(a: 22 b: 33 c: 44)
m: make object!! [a: 22 b: 33 c: 44]
b: [a 22 b 33  zc44]
```

setting them 
`object!`
>> probe o
make object! [
    a: 22
    b: 33
    c: 44
]
```
>> o/z: 33
>> 
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



[17:14:04](#igj-obq03Z9aZfwVL5PxC5GtUEETVRTbksLqNgsgdBQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* The problem is the congruency in the accessing style:

If you have a `ROW` of data expressed as:
```
 o: make map! #(a: 22 b: 33 c: 44)
m: make object!! [a: 22 b: 33 c: 44]
b: [a 22 b 33  zc44]
```

setting them 
`object!`
>> probe o
make object! [
    a: 22
    b: 33
    c: 44
]
```
>> o/z: 33
>> 
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
>> b/z
== none
>> b/z: 22
*** Script Error: cannot set none in path b/z:
*** Where: set-path
*** Stack:  
```



[17:15:06](#Koy-gFa9S8MxXfBgstZSRqB5ZX7TFEszg-64XXfUKVw) <GiuseppeChillemi (GiuseppeChillemi)>:
* The problem is the congruency in the accessing style:

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
>> b/z
== none
>> b/z: 22
*** Script Error: cannot set none in path b/z:
*** Where: set-path
*** Stack:  
```



[17:15:50](#8OLM5K9cBhf-msLVTWtKn5rDVto-Qg6CIzsfEAmKXsw) <GiuseppeChillemi (GiuseppeChillemi)>:
* The problem is the congruency in the accessing style:

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



[17:17:50](#CRxxK9mrfxWZYynHafsgj3niLHN_M5zdD0lw6e2zoj0) <GiuseppeChillemi (GiuseppeChillemi)>:
If you work with the same data in different containers, you must handle 3 routines. 

[17:21:10](#EhZnSrX6r9SBbjw-Ok7P-E0xb-qDFwWUoLv3v5DxFik) <hiiamboris (NOT THIS ONE)>:
use `put` & `select` for more consistency

[17:21:33](#p2Kx-Ar4_uRlVhRL4GcYRgzUQ8pd5Kwr7Fw9hFV5v1c) <hiiamboris (NOT THIS ONE)>:
or use `hash!` since you have blocks anyway

[17:32:29](#_HC5K2q_oyKo4H5kS9BOUyRdDrKifVyi0Q-gqMkUUp4) <GiuseppeChillemi (GiuseppeChillemi)>:
Also reading is different:

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
`object!`:  not supported (but it could, as position is preserved)



[17:33:11](#jOoG_msZlDBtXFSTSGtIF9bgWzlvuYDWBgSz28BHU68) <GiuseppeChillemi (GiuseppeChillemi)>:
Couldn't  some differences be changed in favour of uniformity?

[17:34:47](#ZDhKjBimD6ST_xH8BBBez_jsQDJ_RkGltzkkVpzWecg) <GiuseppeChillemi (GiuseppeChillemi)>:
In objects it would be nice to have a positional accessor to do things like this:
`pick o 1`

[17:35:02](#Um6hudbrFUyVYObzHNDNuwq5vx9nxMWcR6uOBwmgNEU) <GiuseppeChillemi (GiuseppeChillemi)>:
* In `objects` it would be nice to have a positional accessor to do things like this:
`pick o 1`

[17:35:17](#0iS499ppqYjMy2-pSsUVKqRQcsWmJE3SlbxxDpp4zJM) <GiuseppeChillemi (GiuseppeChillemi)>:
* In `objects!` it would be nice to have a positional accessor to do things like this:
`pick o 1`

[17:35:38](#bRGwLgjCySR_1ZstWZySnzPxj_UNk1AwUs78ITXbv0Y) <toomasv>:
As @hiiamboris just said you can make selecting more consistent with `select`.
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
```` 

[17:36:35](#gZFXttin8aha2INsXTDEW-7AOaQ-GQRJIWeWfkpdCDI) <GiuseppeChillemi (GiuseppeChillemi)>:
So, when you store the same data in different containers, even a plain table block with like `[[a b c][22 33 44]]` you access the data using the same picker.

[17:36:47](#cwhgXaQCV6XKOVhXVynGCDy9R_9O7rujEngTrDqUxJU) <toomasv>:
But `put` will still be different.

[17:37:43](#LBJwkIFf0vl2EH5LhRbLeH0MReubuWfIuv5Szwm-Qo8) <GiuseppeChillemi (GiuseppeChillemi)>:
@toomasv I have tried `select` it gives more consistency

[17:38:10](#5LkuhKcPNggWjlc7x5YDpHM6foCNHiFVwSdrj58UclU) <GiuseppeChillemi (GiuseppeChillemi)>:
* @toomasv Yes, I have tried `select` it gives more consistency

[17:47:49](#lJYLt3Vcz_JalLmO3Mokwq2Djgqgs3YjJ9Y1fn_yDlo) <GiuseppeChillemi (GiuseppeChillemi)>:
But as I have written before: people need a simple and common way of working when using the same instrument, otherwise they will be confused from receiving different results doing the same things. Imagine being a newcomer and having to learn so many combinations of `datatype!` `command` `desired action` `result` `errors-situations`. @toomasv  you are the mathematician here: how many different combinations does this number of variables create? 

[17:48:09](#We6dOTi-HcYkWMInE0HSOP90bMJBHP6YVNZxp2HD1Cc) <GiuseppeChillemi (GiuseppeChillemi)>:
* But as I have written before: people need a simple and common way of working when using the same instrument, otherwise they will be confused from receiving different results doing the same things. Imagine being a newcomer and having to learn so many combinations of `datatype!` `command` desired-action `result` `errors-situations`. @toomasv  you are the mathematician here: how many different combinations does this number of variables create? 

[17:48:25](#wgssEBQVHi67a-EEhh0kHEzgfogjDB3qZKUBMkN1fag) <GiuseppeChillemi (GiuseppeChillemi)>:
* But as I have written before: people need a simple and common way of working when using the same instrument, otherwise they will be confused from receiving different results doing the same things. Imagine being a newcomer and having to learn so many combinations of `datatype!`, `command` ,desired-action, `result`, `errors-situations`. @toomasv  you are the mathematician here: how many different combinations does this number of variables create? 

[17:50:57](#k840LxZ2zkg3ux6qMLCJawcPdLvFMlCPVE1Ds4wCRXs) <toomasv>:
But with map, object and block you have there instruments not "same" instrument. You can of course use single instrument and still have several ways to access and put things into it.

[17:53:47](#evXInPYejeq-CVE1ROyIstTi9KCbinHLSXykWWUDDVo) <hiiamboris (NOT THIS ONE)>:
@GiuseppeChillemi we advocated ordered maps with @giesse previously but no one esle supported

[17:54:08](#TR4vZaNP8L_1xH50qXRE5aXiPCh1pgvPoe4cMne7yJ4) <GiuseppeChillemi (GiuseppeChillemi)>:
I have not read the thread

[17:54:57](#m3p2uNLJTp4wgMdkJVDv8KsA9O8j1WzCtaP3UNp89Ug) <GiuseppeChillemi (GiuseppeChillemi)>:
But I am in favour of order in MAPS and also in objects. So you can work with indices.

[17:55:26](#csmt-a8JJFdPkbJEi-c66WSRS04dfGC-XvExviSDLu8) <hiiamboris (NOT THIS ONE)>:
we did not advocate indexes Ì†ΩÌ∏â
I like indexes in maps as they are

[17:55:39](#zZ11XTzZthA_23QJo2zYqg1JNsq7T7Nb_0l0GS03BLI) <hiiamboris (NOT THIS ONE)>:
and again point you into `hash!` direction

[17:56:51](#8S94GVffRq8QN0jwVxR_lD_vQUP_yyLbpjKdDeT4MUY) <GiuseppeChillemi (GiuseppeChillemi)>:
Also, as MAP! is an easy and fast way to store database ROWS where the position is important to keep a cursor, and even more important when this is tied with Ordered data. 

[17:57:06](#_Mpuwyiz1yZ8npZed_ooDmPEKxPp4gljKcE7RCsjOqk) <GiuseppeChillemi (GiuseppeChillemi)>:
* Also, as `MAP!` is an easy and fast way to store database ROWS where the position is important to keep a cursor, and even more important when this is tied with Ordered data. 

[17:57:15](#rX2L7xeQlxsu8G1Q3uV7DC0IqXAt2jwIWXHVPKLNZWg) <GiuseppeChillemi (GiuseppeChillemi)>:
* Also, as `MAP!` is an easy and fast way to store database ROWS, where the position is important to keep a cursor, and even more important when this is tied with Ordered data. 

[17:57:37](#Q9ShRPCGSC8PHiZgBYDpS9FSOxmKZpxrgV4_65Fp3JQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* Also, as `MAP!` is an easy and fast way to store database ROWS, where the position is important to keep a cursor, and even more important when this is tied with sorted data. 

[17:57:55](#yCQf8CvPQVyeavHV04vHjmKD2ggrqgMm12vABN7NMyM) <rebolek (Boleslav B≈ôezovsk√Ω)>:
What is the advantage of map! here?

[17:58:20](#faTzcWbfzeB6TxeFXy2nPuHtfN73bxvM74z4gQmiraA) <rebolek (Boleslav B≈ôezovsk√Ω)>:
If you have rows, why not using block?

[17:58:21](#jVYs1dyTqebt2KzHt148VYbzr18QWa60ayT6C-1dicU) <GiuseppeChillemi (GiuseppeChillemi)>:
Speed and Key access?

[17:58:28](#iwKOGLcIiwfySzLhg2OE_S8VBax_VejRaUpqYmxUp3g) <GiuseppeChillemi (GiuseppeChillemi)>:
* Speed and Keyed access?

[18:00:11](#aBnzsElDhm5zRX9AxOjf1mW7WrjUqudhSm2NrZDnB78) <hiiamboris (NOT THIS ONE)>:
and third time I point you into `hash!` direction

[18:00:19](#H7LrysVqcjBjeLT38y89bzXdJ3xweiiz-L_bfNxIWEA) <hiiamboris (NOT THIS ONE)>:
it becomes absurd at this point

[18:00:43](#VnGTOjoJ5Hpl2eoWahEDDatZNLDGLbPFELxcGTwkVIQ) <rebolek (Boleslav B≈ôezovsk√Ω)>:
what keys are you using for rows?

[18:01:37](#717BET0jZK6tmycXKt2kkHSnqwEW7uZbSwcs0YmHZug) <GiuseppeChillemi (GiuseppeChillemi)>:
either single one or keys in multiple columns!

[18:01:44](#kIgNR1Bce6gCQY3vlq4nMWW30c69UaaS6RZG0Nx2ISU) <GiuseppeChillemi (GiuseppeChillemi)>:
* either single one or keys in multiple columns

[18:05:21](#UeMzeLH__GOwytmZuOwnBrSkXAWsbA90DPBj1b0ULu8) <rebolek (Boleslav B≈ôezovsk√Ω)>:
```
db: [
    [name age]
    [morlok 3'000]
    [ujo 35]
]
```

Here I have a simple DB in block, what keys would you use if it was a map?


[18:07:07](#T2c93oSfLc-Nzf3oLnyQBeKhrfey8Hj_Ll8Tglzl-_Q) <GiuseppeChillemi (GiuseppeChillemi)>:
Name and Age on each line.

[18:08:49](#NqrtnRVV0ca-1FFQDmpZDAqDlKaY6tmRBm5zcfCY8kk) <rebolek (Boleslav B≈ôezovsk√Ω)>:
So it would be ordered not by rows but by columns, I see.

[18:09:05](#Ou7FuxnwuREZO6fkSV2dONYfQdQwJkYK45ey0w4uMKk) <rebolek (Boleslav B≈ôezovsk√Ω)>:
However, you wrote: "Also, as MAP! is an easy and fast way to store database ROWS"

[18:17:28](#E3n-DZwYUb-lzmxYoUf4WbrLJdB9beTO16X1wCc3guE) <GiuseppeChillemi (GiuseppeChillemi)>:
Now you have this:
```
cs-headings: [name age]
customers: [
  1[morlok 3'000]
  2 [ujo 35]
]

or: headings [customer product price]
orders: [
  a [1 "Headphone" USD$50]
  b [1 "Diagrammar" USD$129]
  c [3 "Diagrammar" USD$129]
]
```
How do would you build a JOIN in one data structure with reference to the originating blocks and keeping headings?

[18:17:56](#m0d9CBgbAbCAi_msBSzKbXW2H4gAlUo4dcUCQn_kT5k) <GiuseppeChillemi (GiuseppeChillemi)>:
* Now you have this:
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
How do would you build a JOIN in one data structure with reference to the originating blocks and keeping headings?

[18:19:41](#-zIJw7Vf6Yu-oVaZiSlR6FW75ZVt2WPUoT9qcE-HTAY) <GiuseppeChillemi (GiuseppeChillemi)>:
* Now you have this:
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
How do would you build a JOIN in one data structure with reference to the originating blocks, keeping headings and having local indices too?

[18:19:52](#03ElTBahY79hMIYIgqG1alqLWrYPEm3fkCqhGsS0mYs) <GiuseppeChillemi (GiuseppeChillemi)>:
* Now you have this:
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
How do would you build a JOIN in one data structure with reference to the originating blocks, keeping headings and having local indixes too?

[18:19:58](#NSphnBvrlGsAOWp0xJH_mUoECo74wySgtxbYmGXveCk) <GiuseppeChillemi (GiuseppeChillemi)>:
* Now you have this:
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
How do would you build a JOIN in one data structure with reference to the originating blocks, keeping headings and having local indexes too?

[18:24:45](#3Zyt7oSImoev9Bixu-cprj1UvwTDdvciduy4PoaFQ50) <GiuseppeChillemi (GiuseppeChillemi)>:
* Now you have this:
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

[18:27:19](#O9HAATLH5AkmXzrXIjrzTk-R6wh8r_dChnXcSzYuNKU) <GiuseppeChillemi (GiuseppeChillemi)>:
I mean this:
```
#(
join-internal-id: 1 cached: true join: #(customer: a 1 product: "Headphone" price: USD$50)
join-internal-id: 2 cached: true join: #(customer: b 1 product: "Diagrammar" price: USD$129)
join-internal-id: 3 cached: false join: #(customer: c 3 product: "Diagrammar" price: USD$129)
)
```

[18:28:45](#uVYUQY-VFEyNxUi9L9pK4vAtw4F7L_R5FGTZfXfAw70) <GiuseppeChillemi (GiuseppeChillemi)>:
* I mean this:
```
#(
join-internal-id: 1 cached: true join: #(order: a customer: 1 product: "Headphone" price: USD$50)
join-internal-id: 2 cached: true join: #(order: b customer:  1 product: "Diagrammar" price: USD$129)
join-internal-id: 3 cached: false join: #(order: c customer: 3 product: "Diagrammar" price: USD$129)
)
```

[18:29:11](#hZSdCgL8j6vu-5KizFRdVhyIoO4MTvsZrz4xDU-0_EQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* I mean this:
```
#(
join-internal-id: 1 cached: true join: #(order: a customer: 1 product: "Headphone" price: USD$50)
join-internal-id: 2 cached: true join: #(order: b customer: 1 product: "Diagrammar" price: USD$129)
join-internal-id: 3 cached: false join: #(order: c customer: 3 product: "Diagrammar" price: USD$129)
)
```

[18:30:29](#45VdUKePrSMLVMk3f_donxImPlJtv2Zx0FYEi46TX7c) <rebolek (Boleslav B≈ôezovsk√Ω)>:
I don't see why you have indexes there.


[18:30:58](#CZMpRYsGJ4f4A1CX2x_yvdBmNJlOv3-mCru4ns8FmfQ) <GiuseppeChillemi (GiuseppeChillemi)>:
What you mean?

[18:32:01](#fRA897_ukvyE9dgLl_zKZqQ79FNDQjxbgq-blmNOxMY) <GiuseppeChillemi (GiuseppeChillemi)>:
They can be referenced by a VID object if you are talking about `join-internal-id`

[18:32:15](#tQZy73nXiARopUm3_QKe8G3ENhXR2VykX_1dmNBfIQA) <rebolek (Boleslav B≈ôezovsk√Ω)>:
What's the point of 
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

[18:33:16](#LB0h-OEzjy2Eb09oTB7GG2NJYt1R1IJj4GNBJfvUvNI) <GiuseppeChillemi (GiuseppeChillemi)>:
How do you reference `customers` externally if the order changes?

[18:33:30](#agRjnBKWWxjiqWfS2sHK6vKUT6k6Irj8jWLb4EkLRK0) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Why the order changes?

[18:34:48](#T4r1ba4__4K2rzE_Wpdsd1WVVHzAjQHTClq8aVNGdIE) <GiuseppeChillemi (GiuseppeChillemi)>:
Because if you query your block with a "where" type action, the resulting sets has different positions, and if you need to backlink to the originating table, you need a key

[18:35:02](#jAxZ5EpVmsvkrXAiTI9cj4kcO1KDwQHmC_EI4b-B2E0) <GiuseppeChillemi (GiuseppeChillemi)>:
* Because if you query your block with a "where" type action, the resulting set has different positions, and if you need to backlink to the originating table, you need a key

[18:36:59](#26Uj9QueGq1k5inP6ae2TkA3xstZ7xy9of3RSC3Hf9s) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Your block can be the key. And how can a query change the order?

[18:38:03](#P9ACdHAaUjdzl3WAwPsDv4Rfr8bc22sQR_ThjN6Ntr8) <GiuseppeChillemi (GiuseppeChillemi)>:
About ‚òù [21 novembre 2021 19:27](https://gitter.im/red/red/code?at=619a8f87cdb5c1081a23deb7)
If you handle external data, you have no control over the columns name, your internal keys could have the same column name of the external row, so you need this kind of structure.  

[18:39:42](#_wWHmTdNgPgN2bJtuzu12DPFW2fR41KezBeT5km3wFA) <rebolek (Boleslav B≈ôezovsk√Ω)>:
I don'≈ß understand, it sounds to complicated to me. I probably would need to see your data.

[18:42:22](#lOHQ2RU7SUXNwq9QgduZI9exNc04U9iw-fvBn_h-rrc) <GiuseppeChillemi (GiuseppeChillemi)>:
> Your block can be the key. And how can a query change the order changes?

Try this one:

customers: [
  1 [morlok 3'000 alabama]
  2 [ujo 35 texas]
]

Create an order view from an action on customers like: 

"Select name, age where age < 2000"
And the result is:

```
orders-view: [
   [ujo 35]
]
```

How do you backlink to `customers` without a key?
How do you backlink to 




[18:42:42](#TqGxL9HfN2NlrOQ-TwIrf04CpDP-Cik6CRgdVFl5-pc) <GiuseppeChillemi (GiuseppeChillemi)>:
* > Your block can be the key. And how can a query change the order changes?

Try this one:
```
customers: [
  1 [morlok 3'000 alabama]
  2 [ujo 35 texas]
]
```

Create an order view from an action on customers like: 

"Select name, age where age < 2000"
And the result is:

```
orders-view: [
   [ujo 35]
]
```

How do you backlink to `customers` without a key?
How do you backlink to 




[18:42:42](#ljZ89vIDxhp-asg8tGNQ3dKYJ0D6YeiqK3zfJRY6XK0) <rebolek (Boleslav B≈ôezovsk√Ω)>:
* > Your block can be the key. And how can a query change the order changes?

Try this one:
```
customers: [
  1 [morlok 3'000 alabama]
  2 [ujo 35 texas]
]
```

Create an order view from an action on customers like: 

"Select name, age where age < 2000"
And the result is:

```
orders-view: [
   [ujo 35]
]
```

How do you backlink to `customers` without a key?
How do you backlink to 




[18:42:54](#mQ03eWrfg7x3zh6kEIwuX9Hrz9Ky3eMXMq17UqNuEtY) <GiuseppeChillemi (GiuseppeChillemi)>:
* > Your block can be the key. And how can a query change the order changes?

Try this one:
```
customers: [
  1 [morlok 3'000 alabama]
  2 [ujo 35 texas]
]
```

Create an order view from an action on customers like: 

"Select name, age where age < 2000"
And the result is:

```
orders-view: [
   [ujo 35]
]
```

How do you backlink to `customers` without a key?





[18:43:10](#G1bj1AhpEn_Af8xWIZ70fqlus2TREPb5WE7Dw59Efa8) <GiuseppeChillemi (GiuseppeChillemi)>:
* > Your block can be the key. And how can a query change the order changes?

Try this one:
```
customers: [
  1 [morlok 3'000 alabama]
  2 [ujo 35 texas]
]
```

Create an order view from an action on customers like: 

"Select name, age where age < 2000"
And the result is:

```
orders-view: [
   [ujo 35]
]
```

How do you backlink to `customers` to retrieve the "state" without a key?





[18:48:08](#EOVtOO86HyRkzcOVOtt9X7wx7Dz753w3N8v9LrzqBzU) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Simply:
```
; define data
>> customers: [[morlok 3'000 alabama] [ujo 35 texas]]
== [[morlok 3000 alabama] [ujo 35 texas]]

; make func to run queries (for the sake of simplicity doesn't mak column names
>> sel: func [db code][collect [foreach row db [if do code [keep/only row]]]]
== func [db code][collect [foreach row db [if do code [keep/only row]]]]

; run it and get results
>> result: sel customers [row/2 < 2000]
== [[ujo 35 texas]]

; check result against original data
>> find/only customers result/1
== [[ujo 35 texas]]
```

[18:48:24](#yYB3sZAeB9oWNS_gbkFpPgxzYxfpTmuiKzV9zhPh0Hw) <rebolek (Boleslav B≈ôezovsk√Ω)>:
* Simply:
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

[18:50:45](#DxTLxUE8AAR-jF7dOwr3wlFAo58CuVcQc5LCxa_MuHI) <GiuseppeChillemi (GiuseppeChillemi)>:
`[[morlok 3000 alabama] [ujo 35 texas] [ujo 35 california]]`?

[18:50:59](#pwRNBDQd8dMG-30pzdIXwme2DBdFO-rnPLLuSqC-NK0) <GiuseppeChillemi (GiuseppeChillemi)>:
* And?
`[[morlok 3000 alabama] [ujo 35 texas] [ujo 35 california]]`?

[18:51:32](#nJk3RKchdVxXsLKQhw4N1JN3qiIavHU7rAuCQ5LZVDM) <GiuseppeChillemi (GiuseppeChillemi)>:
* And?
```
[[morlok 3000 alabama] [ujo 35 texas] [ujo 35 california]]`?
```


[18:51:46](#aDWC_xq_HRMpjZKJvSKZDvoq9NnEZvM3j2rO7cMTQmk) <GiuseppeChillemi (GiuseppeChillemi)>:
* And?
```
customers:  [[morlok 3000 alabama] [ujo 35 texas] [ujo 35 california]]`?
```


[18:51:52](#pZ6J7zchpTujJv7JVVRCwHbx_X78kKxe92dVR-AbUgc) <rebolek (Boleslav B≈ôezovsk√Ω)>:
That doesn't change anything,  you will get a new block with two values, but they still point to original values, they are the same blocks.

[18:51:57](#n52v4nyswGX4FwyMc27oupLQjStmuCkBQ7x-PpGYUvE) <GiuseppeChillemi (GiuseppeChillemi)>:
* And?
```
customers:  [[morlok 3000 alabama] [ujo 35 texas] [ujo 35 california]]?
```


[18:52:43](#IrugXjNcx-OHyiHXe-aVDUP_0xHKyeP8DrXAAvN7EZE) <greggirwin (Gregg Irwin)>:
Adding user level access notes to {this wiki page](https://github.com/red/red/wiki/%5BDOC%5D-Comparison-of-aggregate-values-(block!-vector!-object!-hash!-map!)) would be great. 

We do want to leverage consistency as much as possible, including with `make` and `copy` which are important aspects to me. *But* that doesn't mean every structure can or *should* support exactly the same interface. It may seem to solve a problem, but often just pushes it around. If it's the simple fact that errors don't occur, you just end up checking datatypes when you need to know that. If it's that you want indexed access, but a type doesn't guarantee it, you may assume something that isn't true. I agree that conversions can be a pain, and helpers that handle the differences are an extra step, but at the language level we have to look at what lets people build the specific solutions they need from the general features Red provides.

[18:52:45](#F2OsNJIrWAJYfTIxH2cbELGj0tZBtmka_sVeeOvXF-M) <rebolek (Boleslav B≈ôezovsk√Ω)>:
```
>> customers: [[morlok 3'000 alabama] [ujo 35 texas] [ujo 35 california]]
== [[morlok 3000 alabama] [ujo 35 texas] [ujo 35 california]]
>> result: sel customers [row/2 < 2000]
== [[ujo 35 texas] [ujo 35 california]]
>> same? customers/3 result/2
== true
```

[18:55:49](#v6ORnrPcDEwB5nB9GRkHHIoYI9DwhWVIAeqA3giwqso) <GiuseppeChillemi (GiuseppeChillemi)>:
Oh, yes, I have understood your technique, you backlink using series internal reference, but there could be times where you want this to be explicit. 

[18:58:30](#HNeuGVw9FWeUqsnfWfojF9MgR1dBxwAvUSdeCBwwEfw) <rebolek (Boleslav B≈ôezovsk√Ω)>:
I thought so in the past too.

[19:00:05](#Aq_sJfjp2xe0woa_gRE7Xmq716UfgDWVCXu3m1L20qg) <greggirwin (Gregg Irwin)>:
@GiuseppeChillemi how much data are we talking about? And what are your performance requirements? Blocks are *the* general solution. As @hiiamboris notes, `hash!` is just a block with faster access, paying the price on writing/changes to offer that.

[19:01:50](#VUwLsOd0AY8nJ5VpFMy5dQNPuulB5IHdcY0eTB3Cep8) <GiuseppeChillemi (GiuseppeChillemi)>:
@greggirwin You are right but if those features are of marginal use case, it is better to not add a difference and keep the same working. For example, path on a non-existent key in objects led to error while on other data led to `none`. It's ok for me to keep this as I see it could be important. But using a `path` to put a value on `map` seems not so useful.

[19:02:49](#ske_1lZ8oAYRi7igdjE2xCnFaCll4S-B9SMD0SJGqxs) <greggirwin (Gregg Irwin)>:
One man's marginal use case is another's necessary feature. :^)

[19:02:57](#HaGNNX6wk1bqZWXTWfRQStO9i7HexBwoeG4HWumArbI) <GiuseppeChillemi (GiuseppeChillemi)>:
@greggirwin We are talking about 1M rows. 

[19:03:28](#FYApr0V3H_h7z6mhTZR0ExGvzd1fGyilNS3UzO373a4) <GiuseppeChillemi (GiuseppeChillemi)>:
@greggirwin :) That's the relativeness of things, the `R` in Rebol.

[19:03:34](#jS4wLUQ3RCNBZPkCuPYcqDV29REDDTyyEsBdy2swLJQ) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Wow, how much memory does it take.

[19:03:59](#OI1DrugZux2nv6fmfXWbY9c3pF6-2-gk1ZI70SarP8I) <rebolek (Boleslav B≈ôezovsk√Ω)>:
With so many rows I wouldn't want to waste space with unnecessary indexes :-)

[19:04:23](#Rb-j-etLcqw4Ccnpoh_mgHB3kbyBWroLVvAb_3ZLa9E) <greggirwin (Gregg Irwin)>:
Some of this *is*, as we admit, implementation details leaking out a bit, which we have to weigh against justifying how you think about things. What helps you to understand versus things you can safely ignore.

[19:05:32](#N5q7gZzy4BAjvmFZRyz7MSeBPTA9inafy6JY1_V0oa4) <GiuseppeChillemi (GiuseppeChillemi)>:
Actually, I process it on SQLServer but I would like to mirror the data set inside Red to process it faster when it will possible. 

[19:05:50](#pwcMM-YVykcEuORMbAJt1NPn_GKXirb5m_Czfyu2vD8) <GiuseppeChillemi (GiuseppeChillemi)>:
* @rebolek Actually, I process it on SQLServer but I would like to mirror the data set inside Red to process it faster when it will possible. 

[19:06:03](#WCBzmNGv0YG023mNRvT3d7wVtq_vIEfC026jKWqRnW4) <greggirwin (Gregg Irwin)>:
~1M is a great size for this discussion. Beyond what I feel I could comfortably brute force, but small enough that I wouldn't want to build a complex infrastructure. 

[19:08:10](#QiE_TbrIqbZPb-v47PtltpszKFLOOc8u2RC2SSpwTRM) <greggirwin (Gregg Irwin)>:
The real catch, though, is how you want and need to query it. This is where there's a huge gap between SQL engines and simpler ISAM models. I want to build the latter into Red, which is the foundation for higher level models. 

[19:08:57](#AbU6Y9QMrmtTXZlXIuqETUCZz8Puwt7Hv0F66NFmLrE) <GiuseppeChillemi (GiuseppeChillemi)>:
It is 15 years of the company's data: 10 rows per document 6000 documents each year. And you have to backlink them to the Customer and  Articles tables. 

[19:10:59](#Du-W_ybCzC3bUCKTGayFl0a_UjxjRhIdPOUzWMI0N5g) <GiuseppeChillemi (GiuseppeChillemi)>:
@greggirwin I would like to experiment. Actually @henrikmk List-View component on Vid-Extension-Kit is able to handle such data using a block of objects structure but I have tried upto 200K entries. 

[19:12:01](#pHRxarFR5pQmFxfl7xDxjCZs5ydgnEUVCLPpf5QIR0I) <rebolek (Boleslav B≈ôezovsk√Ω)>:
I have a [query dialect](https://github.com/rebolek/red-tools/blob/master/qobom.red) for block of maps, but can be easily adapted for a block of blocks too.

[19:12:47](#wpSeq9ACYjbll2iDxqrbzEjhotvr_Ve7AloYmmgE6Sg) <GiuseppeChillemi (GiuseppeChillemi)>:
@rebolek You are doing great things!

[19:14:39](#RHX1FMBkOwSWbM3O5IJRxGdIi6Iy728TewfcLnUlxK0) <GiuseppeChillemi (GiuseppeChillemi)>:
I am trying to implement a data type system on Rebol and port it on Red as soon as the Datagrid component will be ready. I was working on a `make-row` function and started trying the differences between Rebol and Red, so the reason about this topic.

[19:14:48](#WLTwhHNc2eNdTHWxtXTMCbtdbcTMr9lyVRSIuVEepes) <GiuseppeChillemi (GiuseppeChillemi)>:
* I am trying to implement a datatype system on Rebol and port it on Red as soon as the Datagrid component will be ready. I was working on a `make-row` function and started trying the differences between Rebol and Red, so the reason about this topic.

[19:16:29](#etjjL62Y6_5wFPkGvScFDJCkZ-xyKIxMUmOsRGipm2k) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@GiuseppeChillemi thanks :)

[19:18:11](#UWWrDqBqCPzN83wJwEsxektgqHL-ZY-28gR6aZkCLzg) <greggirwin (Gregg Irwin)>:
When I did an image management system I did a few things. 1) use the file system for the images themselves, 2) build indexes for known query needs, 3) break things down by time. That may not work for you, but by splitting up the data, it became more manageable, and query results could then be combined if needed. Often (again in my case) people only cared about the most recent, and "paging back in time" worked well.

[19:20:28](#y1pQNcx7lWsL6CJbQ8ePi2g7KHcwPdI0zZwFe3f6hkc) <greggirwin (Gregg Irwin)>:
There are always tradeoffs, and no external DB needs in that case, but it scaled to 100M+ images and ~50TB of data in pure R2.

[19:20:54](#HOnx8m1b9GpGpV5vjAW3vGNMbiDM7t6Ugr1NoqdYFD8) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Nice!

[19:45:06](#k9RiljpF_TNQ5HMy7gIYX8j-DfUCJu2oxP4fdxt3hj0) <GiuseppeChillemi (GiuseppeChillemi)>:
@greggirwin Imagine loading in memory those 50TB of data :-)

[20:36:16](#-OF9BNqcv_PdZOXMUo0tUwQDHMXtsOZFTRn6KS_lapo) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Having 1M rows where each row is a map is terrible waste of memory and cpu as well. Even having each row as a small block is a waste as block with 3 values is actually block for 8 values etc.

[21:53:49](#GHONUNBPKdiUBxhK5HHUAlliNXLtJk63KQ1bD0B70L8) <GiuseppeChillemi (GiuseppeChillemi)>:
I see only hash and separated headings block as a solution. Do you have any other?

[22:00:38](#BT76PYfrA-s5k_1BV8LTTGruxjZRW5kv3ESgkJ6WTOk) <greggirwin (Gregg Irwin)>:
It's all tradeoffs. With sub-structures you can change them independently, they can vary in structure, etc. With fixed offset values, and no markers at all, changes and direct data viewing become much more difficult.

[22:08:41](#trH1hlnh17DHRXfH7KqZ0xk0HkAr_UcSLwwt3TSnUnY) <greggirwin (Gregg Irwin)>:
If I have 1M records, each with a couple numbers and a few strings, the size in memory, as sub-blocks, may be ~10x the raw data size. A linear search on a value will take ~1s. So it's well within brute force territory for an in-house system. Add a few more tables though, and you'll hit 32-bit Red limits. Then it's weighing programmer time vs machine time vs future needs.

I never want to be *needlessly* wasteful, but efficiency often comes with associated costs.

[22:39:21](#zN6bQqbXVGj2GGpcTLzxyvH4vwnHKUjX3_iUT_-VJ-4) <greggirwin (Gregg Irwin)>:
I remember in my VB days how battles raged over the use of the Variant datatype and its comparative inefficiency to base types (and other issues). When I transitioned away from VB I was still in the "Variants Bad" camp. That's when I found Rebol, and saw that it *could* be worth it. The difference, I think, is that variants didn't add any new expressive power. They solved some problems, but caused others.

Soon enough, in the grand scheme of things, we'll have 64-bit value slots. As with Unicode, or Mac fat binaries, it may look like things will explode in size. What we have to ask is if the ROI on that is worth it. Red is a high level language, but we still have Red/System and types like `vector!` that can be leveraged where needed.

Memory is ~$5/GB.  Are the limits of Moore's Law, and the world at large, finally going to force us to think differently? Maybe not. Brute force just takes us farther, always just enough for many things, so we don't have to. But what if we *choose* to? What if all your data didn't live in one process, but was split among communicating processes, even locally? Is this "microservices"? Is it better to have one DB daemon that does it all in a 64GB in memory DB or 16x3GB limited processes? 3GB is still a *lot* of data, just not by today's (wasteful?) standards where data explosion is the norm. I'm all for "we might need it someday" but even I have my limits.

## 22-Nov-2021

[5:50:40](#W5JveKWFzPsKUWFdZ-GPQdE61sZZO8YYC9ogyTXmDKE) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@Oldes that‚Äôs true. In such case flat block and using `/skip` is best alternative.

[10:13:18](#ywGAfvIQZDoosJEkanAyD7YtC-J_XIgYeRZJMsdtbR8) <GiuseppeChillemi (GiuseppeChillemi)>:
I will try to profile the differences

## 25-Nov-2021

[14:31:12](#Ha5JSIzL2UR4myyE8CZiPwvPrmcAECUJGNQGi5UXohY) <GiuseppeChillemi (GiuseppeChillemi)>:
Well, it seems Red acts better than Rebol here at honoring get value notation.

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



[14:38:33](#vpBjhqgeVdkiJdxQ-4i_DywxPmkO9GTpm31DXYZEH6Y) <hiiamboris (NOT THIS ONE)>:
keep in mind `get 'fc/1` is broken though

[14:38:53](#RIkZjoZVu2ZP53AvFBxEjgk3paiBeS_hKcUg23xf1oo) <GiuseppeChillemi (GiuseppeChillemi)>:
On Red or Rebol?

[14:39:08](#ShnOS4kb-s21hypqpPeZc0WBVGmD8W1kYIM3Mg-nRd4) <hiiamboris (NOT THIS ONE)>:
nobody break Rebol anymore Ì†ΩÌ∏â

[14:39:11](#tNMmHh0Mmz6K0buV9LAOCezBa7AKGyZPhqm_3IyxtRU) <hiiamboris (NOT THIS ONE)>:
* nobody breaks Rebol anymore ;)

[14:39:28](#q5Al4aJNiCUyyXxsqXrxeXDDjz2jPw9dmbnDwrmOU6A) <GiuseppeChillemi (GiuseppeChillemi)>:
I break it!

[14:39:48](#Q4Sl8RJWOJMRcxjShuRPLKaCazFYNwG4Epw6587nYL4) <hiiamboris (NOT THIS ONE)>:
haha okay do that Ì†ΩÌ∏â

[14:40:25](#-muFh8hmOn7cmJIXuIFj3Dijdsx6sz0qHuZrhoCSvPE) <hiiamboris (NOT THIS ONE)>:
no, it was broken in Red 

[14:41:39](#G_DW3hr6SxeMQRqhXDN_8SHQ4SCAaTV0S8RS-ZRYEEI) <GiuseppeChillemi (GiuseppeChillemi)>:
 ```
>> get 'fc/1
*** Script Error: fc/1 is missing its a argument
*** Where: get
*** Stack:  
```

[14:42:07](#dlVsqASW9l7TCklYEnm5-Uzn076GeC3XlY3BYVx_ii8) <GiuseppeChillemi (GiuseppeChillemi)>:
it should evaluate to `get fc/1`

[14:42:39](#ewlo2XAsX7Gjnd3oEmv22Vl0Xkzyt1JfqcewhTf68Co) <GiuseppeChillemi (GiuseppeChillemi)>:
That it should not execute the function, isn't it?

[14:42:47](#Z22h_uerZSMu1NgkFT-X1ja25O3tunyZWihtFi5APgI) <GiuseppeChillemi (GiuseppeChillemi)>:
* That should not execute the function, isn't it?

[14:42:56](#Wim23ifbYlrOBz3lXOaxLshCBQspbgLyqgfejnof7yA) <GiuseppeChillemi (GiuseppeChillemi)>:
* That should not execute the function, should't it?

[14:43:11](#ef4GYbU5bIHmENqUn68AINA69U8QiBBMHRBM8cmcGiE) <hiiamboris (NOT THIS ONE)>:
nope

[14:43:42](#QzAW-zWnr78ihoJLQgcNgW0zgDYNKw9qFdfUjYvHfrg) <GiuseppeChillemi (GiuseppeChillemi)>:
Nope = was I right or wrong?

[14:45:21](#xv_Wfemr9ZSQsz2iNiMd16O7RBaAM5F9l9LSI7dA0OU) <hiiamboris (NOT THIS ONE)>:
it should not

[14:45:28](#b3q8NbMXCpymvl8V-0A27bK4xE8zFIbbwWeEFQ2kGME) <hiiamboris (NOT THIS ONE)>:
that's what I was talking about

[16:27:23](#am8uN-kyFYgeyauzD7ozrxpXBFSmRlZO0fq2fYcqlpY) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@GiuseppeChillemi in Rebol3 I have:
```rebol
>> fc: reduce [func [a][]]
== [make function! [[a][]]]

>> type? :fc/1
== function!

>> type? get 'fc/1
== function!
```

[18:46:54](#oIBwyG0AZu4cnSeYOMpNJdtWeeBGWTAnrHnT6IMT7Jg) <toomasv>:
In Red path notation is "active" access, evaluating its target. To access passively use other accessors:
```
>> fc: reduce [func [a][]]
== [func [a][]]
>> type? first fc
== function!
>> type? pick fc 1
== function!
```

[18:47:49](#l-VIkVRydujqciuZ-lTjpuBh4hpJTzxGZAfiEl6NFJo) <toomasv>:
* In Red path notation is "active", evaluating its target. To access passively use other accessors:
```
>> fc: reduce [func [a][]]
== [func [a][]]
>> type? first fc
== function!
>> type? pick fc 1
== function!
```

[19:31:13](#lBSYfmm25kvIfycAekaiSbKWPfHS-o06BhPWFqWvLLc) <gltewalt (Greg T)>:
Yep, path! is an active type

[20:29:41](#qUr4519RF2jyg2HND1i9PElaldGLlRIFaG4UYvL4KqI) <GiuseppeChillemi (GiuseppeChillemi)>:
Path should not be active if you precede it using `'`

## 10-Dec-2021

[9:52:19](#qQogHa4-eLVx-dsaKaviYUfbsF5YAlFVXFv_WOtyljE) <Devon0175 (Devon Thomson)>:
Path should not be active if you precede it using `'`

[9:59:19](#b8BWp3mPut9YmU1fRPyXh-WjPJiEjuFNtKtMQ35VhMM) <pekr (Petr Krenzelok)>:
Spam?

[17:48:37](#c8gve6LC8YYFexg6nylCXOmlwY8uOzvL1-wTruDKYGA) <greggirwin (Gregg Irwin)>:
Deleted. 

## 8-Feb-2022

[9:18:56](#XnWbuFbQRZVKhps7ZctQnylu1prjFuUDF9evJiev0HE) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@greggirwin I was looking at the Red/code repo, where to put XML functions. See the description from https://github.com/red/code/tree/master/Library :

    This is a collection of useful Library functions and modules that can be included in Red programs. Its two sub-sections are Red and Red/System. All library functions and modules have API documentation.

There are actually no subsections. Either the description should be changed or the subsections should be created.


[9:20:04](#DMLYvB_ybZNTkNTMSiF73-MlAzAFbTQ2AdMxYYqiEgE) <rebolek (Boleslav B≈ôezovsk√Ω)>:
I‚Äôll leave XML-tools in the `markup` repo for now until we decide how to organize the stuff in `code`.

[16:33:46](#SPP4SOpsL3eKLQRKS18OL8hQmjUyw6LP87DD378x6IY) <greggirwin (Gregg Irwin)>:
Both red/code and red/community probably need a maintainer to see if the organization makes sense. Subsections make sense to me.

## 21-Aug-2022

[20:08:26](#_n125tUJKz40xfX3EA0rVn2mtW3BJHC-QYir0aw5hBQ) <cosacam1 (cosacam1)>:
Hi there. The user enters a number (actually an amount of money) but he/she is free to type it with/without decimal places, and as much decimal places as wanted so the user can enter 123 or 123.4 or 123.45 or 123.456. However I want to truncate at the cents and not to have any currency symbol. I made this function `with-cents: func [s][return remove to-string to-money s]` which works fine when the amount is under 1000, else it returns something like `"123'456.00"` with the thousand separator. I know it's related to how is currency set in the PC but I want it to work no matter the settings in any PC. I tried round/to 123 1.00 expecting to force to two decimals but it returned a float with one decimal place. So, any help? Thanks

[20:11:46](#Mfy1izF0ctBQQTYoB3p0_SIUaC4SBfWiG1p8SBNx1SQ) <hiiamboris (NOT THIS ONE)>:
`system/options/money-digits: 0`

[20:12:09](#osYBwGrs61SqDLo6wRr48MkvmfZnBRjRu8RTLp81fUU) <cosacam1 (cosacam1)>:
I could do something with find to detect the dot position in the string then to add it and the zeroes if not enough present or the other way round, remove extra decimals, all this in a while or an until, well I'm just looking for a format function or something, I guess there must be one just I don't remember now

[20:12:58](#4QPlaBB9LyBpptkdAvRPB_i96JyUN7Vg0xEvlHcH5nA) <dsunanda (dsunanda)>:
@cosacam1 Not entirely sure I understand what you are trying to do - but does this do it?
```
round/to 4578457845.454545 0.01
== 4578457845.45
```

[20:16:10](#cWDYRW-oI3dR5qbglVBC4_8VmHv8SJYPip_dvACOxzw) <hiiamboris (NOT THIS ONE)>:
If you only want to omit `.00`, then `clear find .. ".00"` will help

[20:18:25](#_4uAUT7YXBkBknzsz7cYGexnAnPGhf8OBrHuoT0wNe0) <cosacam1 (cosacam1)>:
Sure, not 1.00 but 0.01 as format. Thanks dsunanda. And yes, I want to keep .00 if any, thanks anyway hiiamboris

[20:20:29](#j-4lnIAEbedcktRSzh6TX0fP9PWeUFImd0P_FE4uOBo) <dsunanda (dsunanda)>:
You may need to use round/down/to for what you want:
```
>> round/to/down 4578457845.999999 0.01
== 4578457845.99
>> round/to 4578457845.999999 0.01
== 4578457846.0
```

[20:24:48](#CPmyss9nHuubbRqxGAo79-nLv6Ff8Thoodc-nK51EKY) <hiiamboris (NOT THIS ONE)>:
maybe just use `mold` instead of `to-string`?

[20:28:23](#9yOV9uM_XL24ezz2EYMv8lYH2L3I7oGlxqe9oVGX5Q8) <cosacam1 (cosacam1)>:
Yes I've just noticed /to only returns one decimal place, so /to/down is the answer. Thanks... well, no. It works for numbers that already have more than two decimals but not with those with one or no decimals

[20:33:25](#gnuXsl9Fb9pv5z3PtVEso3RRhEHOezRjAaPN9jMs5IE) <cosacam1 (cosacam1)>:
It works with mold. ```with-cents: func [s][return remove mold to-money s]``` Thanks both

