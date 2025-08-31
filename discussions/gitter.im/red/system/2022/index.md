# Archived messages from: [gitter.im/red/red/system](/gitter.im/red/red/system/) from year: 2022

## Sunday 30th January, 2022

olivier\_lp\_twitter

[13:11](#msg61f68e93d41a5853f976ed34)I, is there a documentation for SET\_RETURN, I saw it in some script examples, are there others c like operands?

[13:57](#msg61f699547842bd3ca97004ef)Is there in red/system function to read/write files?

## Monday 31st January, 2022

rebolek

[08:31](#msg61f79e4e82a4667b25a15d62)@olivier\_lp\_twitter you can `#include` this file https://github.com/red/red/blob/master/runtime/simple-io.reds to get file IO. Or call OS functions directly.

hiiamboris

[09:07](#msg61f7a6df9b470f389792a5af)SET\_RETURN can be found in the source code (macros.reds).

## Sunday 6th February, 2022

gurzgri

[23:12](#msg620055e451bd8b580c8e839c)When manipulating blocks in routine's Red/System code, creating blocks in blocks there and creating many boxed an unboxed red-values in these, it is — so I guess —, always a certain sign of \*me* doing sth. wrong when I get visual signs of GC kicking in with messages like

```
root: 6474/107152, runs: 2, mem: 3252744 => 2651976, mark: 7.9ms, sweep: 1.0ms
```

right? If so, it must happen somewhere in a &gt; 4000 LOC script (2/3 Red/System, 1/3 Red code). So far I had no luck in breaking it down in a digestable minimal example to reproduce the issue. Hence just this top-levekl question. What are the most common traps I should avoid wrt to these messages? Any advice or pointers would be much appreciated.

## Monday 7th February, 2022

hiiamboris

[09:24](#msg6200e5351fe6ba5a9712725f)What's wrong with GC kicking in?

Oldes

[09:43](#msg6200e9bd41e3293d65ddd4f6)You want to lower such a need as much as possible.

[09:44](#msg6200ea00e4c979478d65e5cc)So problem is not GC, but that there is \_creating many boxed an unboxed red-values\_, which needs to be released.

greggirwin

[18:31](#msg6201657403f270478222e0d4)I asked Nenad, and he said the same thing.

gurzgri

[19:51](#msg6201785eb8b082448221ca05)GC kicking in of \*course* isn't a problem - the strange GC output cited above is. Or \*was\*, as I should rather say: It never occurred to me that they go away when compiling in `--release` mode i/o `--compile` development mode. Sometimes you just have to ask to give yourself the answer ...

hiiamboris

[19:55](#msg62017932ced11857f99b11ef):+1:

## Tuesday 5th April, 2022

gurzgri

[21:55](#msg624cbae909092523185c106f)Given I have a value `bin` of type `red-binary!` cointaing UTF-16LE string bytes, how can I treat that as a red-string! in R/S?

```
str: as red-string! as red-value! bin
set-type as red-value! str TYPE_STRING
series: GET_BUFFER(str)
series/flags: series/flags or flag-UTF16-cache
SET_RETURN(str)
```

isn't sufficient, it returns `{A^@B^@C^@ä^@ö^@ü^@ß^@A^@B...}`, not `{ABCäöüßAB...}`.

[21:57](#msg624cbb4a161ffc40d7ed1841)Ideally without loading it in a new string as `string/load` would do even I could load from the binary node's series.

## Wednesday 6th April, 2022

gurzgri

[19:49](#msg624deeb28db2b95f0aa30cc9)Giving me the answer myself:

```
---     series/flags: series/flags or flag-UTF16-cache
+++     series/flags: series/flags and flag-unit-mask or UCS-2
```

## Wednesday 18th May, 2022

ALANVF

[21:18](#msg628562989b66e01be600235e)so I'm looking at fixing #5108, and I see this at https://github.com/red/red/blob/master/runtime/datatypes/map.reds#L237

```
blk: block/make-at as red-block! stack/push* size
if blk? [block/copy as red-block! spec blk null no null]
```

if I'm understanding this correctly, would a better solution be this?

```
either blk? [
	blk: block/clone as red-block! spec no no
][
	blk: block/make-at as red-block! stack/push* size
]
```

[21:48](#msg628569c41308e56363af688b)it looks to be fine, but I'm not sure (since idk how to prof memory like they do in the example code)

[21:52](#msg62856a9677bd5538bd977239)ok looks to work

[21:52](#msg62856a98fd12f01bddb30e59)\[!\[image.png](https://files.gitter.im/55f4ffc80fc9f982beb085e7/Sh1o/thumb/image.png)](https://files.gitter.im/55f4ffc80fc9f982beb085e7/Sh1o/image.png)

[22:00](#msg62856c99db3fe1746f06623f)~~nvm that's broken~~

## Tuesday 31st May, 2022

gltewalt

[22:49](#msg62969b64deea5616bbd60e64)blk is always going to be truthy if it's `any-list` because it is set in the switch. Looks like.

[22:49](#msg62969b7adb6f627d25ad7ec4)set to `yes`, which is trithy

[22:49](#msg62969b7ddb6f627d25ad7edd)truthy

## Wednesday 1st June, 2022

gltewalt

[00:39](#msg6296b53509eea00adec1228d)blk? that is

## Sunday 12nd June, 2022

gurzgri

[16:09](#msg62a60fd7e393a31806531d4b)As some of you might have seen, I'm working on an implemation of an ODBC port scheme. Which for datasources like PostgreSQL, Intersystems Caché, SQL Server, MS Text Driver and MariaDB already works quite nicely.

However, trying to get it working with SQLite I'm so hard running against a wall:

What I'm experiencing with SQLite and the driver \[SQLite ODBC Driver](http://www.ch-werner.de/sqliteodbc/) is that after envocations of `SQLDescribeColW` and or `SQLBindCol` (even if successfull) allocating memory in R/S with `allocate` fails with null pointers being returned or `*** access violation`s before `allocate` returns.

I don't know much about stuff such low level, I can only guess that there's some heap corruption going on?!

Sadly, the \[minimal example reproducing the issue](https://gist.github.com/gurzgri/c63a03efc94dd7c6f20553d5a84dda38) and it's \[output](https://gist.github.com/gurzgri/aad26e0aa4abd7ba700f9fabc5732021) isn't really "minimal" (and depends on declarations from `%environment/schemes/odbc.reds`). That's because there're quite some things involved to get to the point where it fails. But the script is very straight forward and proves that it's not just caused by some random bug in the much larger scheme implemention.

Funny thing is, that stuff like INSERT, UPDATE and DELETE statements \*do work fine* even with SQLite, so it's just the result set returning SELECT statement (and catalog functions) which involves `SQLDescribeColW`/`SQLBindCol` to retrieve results which causes problems. SELECT works fine with other databases/database drivers. But I can't just assume that it's the driver causing the problem - as it works just fine in e.g. WinSQL and DBeaver. I must do something wrong in the most esoteric ways here.

Any ideas, anyone? I've already been spending days researching this ... to no avail :(

greggirwin

[17:32](#msg62a6231667db9a59db16f243)I've sent up the bat signal.

gurzgri

[19:24](#msg62a63d594e38f759e2b84baa)

```
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::-'    `-::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::-'          `::::::::::::::::
:::::::::::::::::::::::::::::::::::::::-  '   /(_M_)\  `:::::::::::::::
:::::::::::::::::::::::::::::::::::-'        |       |  :::::::::::::::
::::::::::::::::::::::::::::::::-         .   \/~V~\/  ,:::::::::::::::
::::::::::::::::::::::::::::-'             .          ,::::::::::::::::
:::::::::::::::::::::::::-'                 `-.    .-::::::::::::::::::
:::::::::::::::::::::-'                  _,,-::::::::::::::::::::::::::
```

Much appreciated! :-) Thanks!

dockimbel

[22:11](#msg62a664a009eea00adedf9a2f)@gurzgri `allocate` in R/S is just an \[imported](https://github.com/red/red/blob/master/system/runtime/libc.reds#L15) libC's `malloc()`. If it returns `null`, it means you either used up all available memory or you've fragmented the heap memory so much that a contiguous region of the required size cannot be allocated anymore. In both cases, it means you've messed up memory management really bad.

[22:33](#msg62a669c8d126691416e37e65)When I look at your `sqlite-debug.red` code, I see many memory management errors, like `free message` been called twice on some code paths, or many allocations without the corresponding release.

## Monday 20th June, 2022

gurzgri

[21:47](#msg62b0eaeeab6b634f735340c8)@dockimbel Thank you very much for having a look into this - much appreciated!

But I'm still completely lost. Therefore I simplified the script even further. The result is the same.

I really do not see where I'm would be messing up memory: \[sqlite-debug.red](https://gist.github.com/gurzgri/c63a03efc94dd7c6f20553d5a84dda38) has no other script dependencies and has practically zero "code paths" or script logic with runaway allocating/freeing.

The script just runs from top to bottom, all ODBC API calls succeed (retcode = 0): \[sqlite-debug.log](https://gist.github.com/gurzgri/aad26e0aa4abd7ba700f9fabc5732021).  
Yet again it's failing on `allocate` after the second successfull API call to `SQLDescribeCol`.

Up to this point I'm only allocating 4 bytes, 4 bytes, 256 bytes, 4 bytes, 4 bytes. No way these tiny amounts can fragment the heap?!? But then trying to allocate 242 bytes fails. And at this point, not a single `free`ing has taken place.

And that is only where used with SQLite driver, other databases work fine.

hiiamboris

[21:58](#msg62b0ed7fd3c8894f7194abb7)wow, malloc returns 0 on 242 bytes

[21:59](#msg62b0edba3bbb384889891301)is that on linux?

[21:59](#msg62b0edd1ef5ee44882ba1460)could be 32 bit lib bugs on 64 bit system?

[22:00](#msg62b0edec3bbb3848898913be)no, looks like windows

[22:00](#msg62b0ee18fe909e3ec7dd9d8a)try allocating using WINAPI?

[22:01](#msg62b0ee229a314a3ec4bab94a)you'll get the error code/message in case of failure

[22:01](#msg62b0ee321227f62be3abad6a)with GetLastError

## Tuesday 21st June, 2022

gurzgri

[14:25](#msg62b1d4e39f73251a2c659b2f)Good idea! And what should I say? Using `kernel32.dll`'s `GetProcessHeap` and `HeapAlloc` instead of `malloc` (thru `allocate`) it ... just works. Crazy.

hiiamboris

[14:49](#msg62b1da600a522647985b3819)Totally ;)

## Thursday 30th June, 2022

dockimbel

[13:48](#msg62bda9a99a314a3ec402b31b)@gurzgri I see you've removed a lot of R/S code. Are you sure that you get the right type value in `sqltype` \[there](https://gist.github.com/gurzgri/c63a03efc94dd7c6f20553d5a84dda38#file-sqlite-debug-red-L200)? You should check after the `case` if the right entry was matched, because otherwise that would most likely cause memory corruptions. Your comments \[here](https://gist.github.com/gurzgri/c63a03efc94dd7c6f20553d5a84dda38#file-sqlite-debug-red-L36) says you expect those values to be negative, but they are stored in 32-bit slots, so they are positive.

gurzgri

[19:01](#msg62bdf304ef5ee448820427ea)@dockimbel Type constants weren't the problem. I have identified the issue, see my comment :point\_up: \[28. Juni 2022 17:24](https://gitter.im/red/database?at=62bb1d49b408e830dc540b05) over in red/database. Thanks anyway!

## Sunday 17th July, 2022

ldci

[15:50](#msg62d42fbd9a314a3ec4a2b1f3)\[!\[image.png](https://files.gitter.im/55f4ffc80fc9f982beb085e7/Iqsl/thumb/image.png)](https://files.gitter.im/55f4ffc80fc9f982beb085e7/Iqsl/image.png)

[15:53](#msg62d430649f73251a2c4b3d7c)An update at https://github.com/ldci/Red-System/tree/main/BitTools with some tools for bytes and bits manipulations

Oldes

[18:37](#msg62d456ebab6b634f733c38c5)Reminds me my old https://github.com/red/code/tree/master/Library/Stream-IO

## Monday 18th July, 2022

ldci

[17:11](#msg62d59440ef5ee44882acbe77)@Oldes We have to coordinate :)

[17:18](#msg62d595d776cd751a2f3d7239)I hate it when the universe resists me. As I didn't understand the LZW decompression of gif files, I went back to the sources. Rebol 3 and Red are really fantastic. Here is an algorithm for LZV compression in less than 30 LOC.

[17:18](#msg62d595f1ab6b634f7344fe2a)

```
#!/usr/local/bin/red
Red [
]
LZWCompress: function [
	"Compress a string to a list of output symbols"
	string [string!]
][
	codeTableSize: 256
	codeTable: make map! []
	i: 0
	while [i < codeTableSize] [put codeTable to-string to-char i i i: i + 1]
	outPut: copy []
	w: ""
	foreach c string [
		wc: rejoin [w c]
		either find codeTable to-string wc [w: wc][
			;--Add code to outPut
			append outPut select codeTable to-string w
			;--Add wc to the codeTable.
			put codeTable to-string wc codeTableSize
			codeTableSize: codeTableSize + 1
			w: c
		]
	]
	;--Output the code for the last w
	if not none? w [append outPut select codeTable to-string w]
]

string: "abracadabraaaa"
codes: LZWCompress string
?? codes
```

greggirwin

[17:20](#msg62d5966cfe909e3ec7ce6778):+1:

ldci

[17:27](#msg62d597e59f29d42bed7c41b1)@greggirwin. Thanks. Next step: decompress :)

rebolek

[18:07](#msg62d5a16d3bbb3848897aba61)black magic :eyes:

## Tuesday 19th July, 2022

toomasv

[07:36](#msg62d65ef5b408e830dc168ba2)@ldci Nice! But it is case-insensitive:

```
>> LZWCompress "ABRacADabRaAAa"
== [97 98 114 97 99 97 100 256 258 97 265]
>> LZWCompress-case-sensitive "ABRacADabRaAAa"
== [65 66 82 97 99 65 68 97 98 258 65 65 97]
```

ldci

[08:01](#msg62d664ea22c53438bca77b66)@toomasv Yes, I know but with find/case I get an error: `Script error: cannot MAKE char! from: none`

[08:02](#msg62d665309a314a3ec4b28e60)@toomasv . Another problem for decompress. This function doesn’ work correctly

```
LZWDecompress: function [
	"Decompress a list of codes to a string"
	codes	[block!]
][	
	codeTableSize: 256
	codeTable: make map! []
	i: 0
	while [i < codeTableSize] [put codeTable to-string to-char i i i: i + 1]
	outPut: copy ""
	w: to-string to-char first codes
	foreach c codes [
		if find values-of codeTable c [entry: to-string to-char c]
		if c = codeTableSize [entry: rejoin [w w/1]] 
		append outPut entry
		;--Add w+entry[0] to the dictionary
		put codeTable rejoin [w entry/1] codeTableSize
		codeTableSize: codeTableSize + 1
		w: entry
	]
	outPut
]
```

toomasv

[08:03](#msg62d6653cef5ee44882b29b4e)I worked from yours:

```
LZWCompress2: function [
    "Compress a string to a list of output symbols"
    string [string!]
][
	;--Initialize codeTable
    codeTableSize: 256
    codeTable: make map! []
    i: 0
    while [i < codeTableSize] [
		put codeTable to-char i i 
		i: i + 1
	]
    outPut: clear []
	w: string/1
    foreach c next string [
        wc: rejoin [w c]
        either find/case codeTable wc [w: wc][
            ;--Add code to outPut
            append outPut codeTable/:w
            ;--Add wc to the codeTable.
			put codeTable wc codeTableSize
			codeTableSize: codeTableSize + 1
			w: c
		]
    ]
    ;--Output the code for the last w
    if w [append outPut codeTable/:w]
]
```

ldci

[08:04](#msg62d665919a314a3ec4b29179)le line `if c = codeTableSize [entry: rejoin [w w/1]]`is not evaluated

[08:21](#msg62d6698cfe909e3ec7d45a56)@toomasv Thanks. Your code works fine with Red, but not with Oldes’s R3 version.

toomasv

[08:39](#msg62d66dc43bbb384889803c48)Ok, thanks!  
Here is decompress, first tests work:

```
LZWDecompress2: function [
    "Decompress a list of codes to a string"
    codes    [block!]
][    
    codeTableSize: 256
    codeTable: make map! []
    i: 0
    while [i < codeTableSize] [
        put codeTable i to-char i
        i: i + 1
    ]
    old: first codes
    outPut: to-string codeTable/:old
    foreach new next codes [
        if not s: codeTable/:new [
            s: rejoin [codeTable/:old to-char c]
        ]
        append outPut s
        c: first to-string s
        codeTable/:codeTableSize: rejoin [to-char old c]
        codeTableSize: codeTableSize + 1
        old: new
    ]
    outPut
]
```

```
>> codes: LZWCompress2 "ABRacADabRaAAa"
== [65 66 82 97 99 65 68 97 98 258 65 65 97]
>> LZWDecompress2 codes
== "ABRacADabRaAAa"
```

ldci

[08:48](#msg62d66fd20a522647985038b5)@toomasv Thanks I’ll test :)

[08:59](#msg62d6727d76cd751a2f43a40b)@toomasv Perfect! Just a question why are you using next in foreach loop?

toomasv

[09:00](#msg62d672bb8fe56a38b59ee0c9)Because I initialize `outPut` to first letter (and use up the first code).

ldci

[09:04](#msg62d6739afe909e3ec7d49e82)@toomasv . It was a stupid question:)

toomasv

[09:04](#msg62d673bb568c2c30d3d203b6)There is no such thing!

[09:37](#msg62d67b64d3c8894f718e2d52)@ldci There was a mistake, here is corrected:

```
LZWDecompress: func [
    "Decompress a list of codes to a string"
    codes    [block!]
][    
    codeTableSize: 256
    codeTable: make map! []
    i: 0
    while [i < codeTableSize] [
        put codeTable i to-char i
        i: i + 1
    ]
    old: first codes
    outPut: to-string codeTable/:old
    foreach new next codes [
        if not s: codeTable/:new [
            s: rejoin [codeTable/:old c]
        ]
        append outPut s
        c: first to-string s
        codeTable/:codeTableSize: rejoin [codeTable/:old c] ;<--------- was wrong!
        codeTableSize: codeTableSize + 1
        old: new
    ]
    outPut
]
```

ldci

[10:27](#msg62d687009f73251a2c5c163c)@toomasv Thanks

toomasv

[10:29](#msg62d687a4fe909e3ec7d5359c)There is something wrong with compression too (provided `put/case codeTable wc codeTableSize` is corrected):

```
>> codes: LZWCompress2 "WyS*WyGWYS*WySWYSG"
== [87 121 83 42 256 71 87 89 258 256 83 256 83 71]
;                                         ^     <----- wrong, should be 262
>> probe at to-block codeTable 513 ()
[
    "Wy" 256 
    "yS" 257 
    "S*" 258 
    "*W" 259 
    "WyG" 260 
    "GW" 261 
    "WY" 262 
    "YS" 263 
    "S*W" 264 
    "WyS" 265 
    "SW" 266 
    "WYS" 267 
    "SG" 268
]
```

ldci

[12:03](#msg62d69d9f9a314a3ec4b4211b)@toomasv : Strings seem insensitive. « ab » = « AB » . So Wy (256) = WY(262)

toomasv

[12:05](#msg62d69df4904f20479a0bc812)@ldci Yes, but I use `find/case` and `put/case`!

ldci

[12:08](#msg62d69ecb1227f62be3a5c22f)@toomasv Me too with R3 : same problem

[12:10](#msg62d69f40ef5ee44882b432b6)With put/case all strings are in uppercase

```
WyS*WyGWYS*WySWYSG
[
    256 "WY"
    257 "YS"
    258 "S*"
    259 "*W"
    260 "WYG"
    261 "GW"
    262 "WY"
    263 "YS"
    264 "S*W"
    265 "WYS"
    266 "SW"
    267 "WYS"
    268 "SG"
]
```

toomasv

[12:17](#msg62d6a0e73bbb38488981b67d)Weird!

[12:18](#msg62d6a12bab6b634f734c7580)@Oldes Is that intended?

ldci

[12:34](#msg62d6a4f2ab6b634f734c8ece)@toomasv . Making comparison on binary values correct the problem: `87 121 83 42 256 71 87 89 258 256 83 262 83 71`

[12:43](#msg62d6a6e822c53438bca96559)@toomasv It works!

```
String  WyS*WyGWYS*WySWYSG
87 121 83 42 256 71 87 89 258 256 83 262 83 71
Result  WyS*WyGWYS*WySWYSG
```

[13:20](#msg62d6afb0ef5ee44882b4b077)

```
#!/usr/local/bin/red
Red [
]
;--Thanks to Toomas Vooglaid for his help
LZWCompress: function [
    "Compress a string to a list of output symbols"
    string [string!]
][
    ;--Initialize codeTable
    codeTableSize: 256
    codeTable: make map! []
    i: 0
    while [i < codeTableSize] [
        put codeTable to-binary to-char i i ;--char-->integer
        i: i + 1
    ]
    outPut: clear []
    w: to-binary string/1
    foreach c next string [
        wc: to-binary rejoin [w c]
        either find codeTable wc [w: wc][
            ;--Add code to outPut
            append outPut codeTable/:w
            ;--Add wc to the codeTable.
            put codeTable wc codeTableSize
            codeTableSize: codeTableSize + 1
            w: to-binary c
        ]
    ]
    ;--Output the code for the last w
    if w [append outPut codeTable/:w]
]
```

[13:22](#msg62d6b0141227f62be3a63b82)We don’t need /case refinement

[13:25](#msg62d6b0d03bbb384889822825)The decompress function remains unchanged

toomasv

[13:27](#msg62d6b13e904f20479a0c4a7f)I got it ok too with `/case`:

```
LZWCompress: func [
    "Compress a string to a list of output symbols"
    string [string!]
][
    ;--Initialize codeTable
    codeTableSize: 256
    codeTable: make map! []
    i: 0
    while [i < codeTableSize] [
        put codeTable to-char i i 
        i: i + 1
    ]
    outPut: clear []
    w: string/1
    foreach c next string [
        wc: rejoin [w c]
        either find/case codeTable wc [w: wc][
            ;--Add code to outPut
            append outPut select/case codeTable w  ; <----- !!!
            ;--Add wc to the codeTable.
            put/case codeTable wc codeTableSize
            codeTableSize: codeTableSize + 1
            w: c
        ]
    ]
    ;--Output the code for the last w
    if w [append outPut select/case codeTable w]  ; <----- !!!
]
```

ldci

[13:40](#msg62d6b44e9f29d42bed84294d)@toomasv Nice, just change put to put/case when creating the codeTable. This avoids an error with R3 when decoding.

toomasv

[13:41](#msg62d6b49e568c2c30d3d3d685)@ldci Thanks!

ldci

[13:50](#msg62d6b6ac76cd751a2f4587b3)I’ll send you by mail the last version

toomasv

[13:52](#msg62d6b727fe909e3ec7d692fe):+1:

ldci

[15:04](#msg62d6c7fa904f20479a0ceb01)A few hours of collaboration with Toomas and here is the work:

```
#!/usr/local/bin/red
Red [
	Title:    "Red Language: LZW string compression and decompression "
	Authors:  "François Jouen and Toomas Vooglaid"
	File: 	  %LZW.red
	Tabs:	  4
	Rights:  "Copyright (C) 2022 Red Foundation. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

;--The Lempel-Ziv-Welch (LZW) algorithm provides loss-less data compression.
;--This code for strings is case-sensitive.

LZWCompress: func [
    "Compress a string to a list of output symbols"
    string [string!]
][
    ;--Initialize codeTable
    codeTableSize: 256
    codeTable: make map! []
    i: 0
    while [i < codeTableSize] [
        put/case codeTable to-char i i 		;--char-->integer
        i: i + 1
    ]
    outPut: clear []
    w: string/1
    foreach c next string [
        wc: rejoin [w c]
        either find/case codeTable wc [w: wc][
            ;--Add code to outPut
        	append outPut select/case codeTable w  
            ;--Add wc to the codeTable.
            put/case codeTable wc codeTableSize
            codeTableSize: codeTableSize + 1
            w: c
        ]
    ]
    ;--Output the code for the last w
    if w [append outPut select/case codeTable w]  
]

LZWDecompress: function [
    "Decompress a list of codes to a string"
    codes    [block!]
][    
    codeTableSize: 256
    codeTable: make map! []
    i: 0
    while [i < codeTableSize] [
        put codeTable i to-char i ;--integer-->char
        i: i + 1
    ]
    old: first codes
    outPut: to-string codeTable/:old
    foreach new next codes [
        if not s: codeTable/:new [
            s: codeTable/:old
            s: rejoin [s to-char c]
        ]
        append outPut s
        c: first to-string s
        codeTable/:codeTableSize: rejoin [codeTable/:old c]
        codeTableSize: codeTableSize + 1
        old: new
    ]
    outPut
]

;-*************************Test*********************************

string: "WyS*WyGWYS*WySWYSG"
print ["String " string]
codes: LZWCompress string
prin "Codes   " probe codes
result: LZWDecompress codes
print ["Result " result]
```

toomasv

[15:34](#msg62d6cf0cb408e830dc19b481)I played a bit further with it and tried `parse`:

```
context [
    stringTable: make map! []
    getCode: func [w [string! char!]][
        either string? w [select/case stringTable w][to-integer w]
    ]
    
    set LZWCompress2 function [string [string!]][
        clear StringTable
        code: 256
        w: string/1
        parse next string [
            collect some [
                set c skip (wc: rejoin [w c])
                [ if (find/case stringTable wc) (w: wc)
                | keep (getCode w)
                  (
                    put/case stringTable wc code 
                    code: code + 1 
                    w: c
                  )
                ]
                opt [end keep (getCode w)]
            ]
        ]
    ]
```

It seems to be more efficient:

```
>> string: "abracadabraaaa"
>> recycle/off
>> profile/count/show [[LZWCompress string][LZWCompress2 string]] 1000 recycle
Count: 1000
Time         | Time (Per)   |      Memory | Code
0:00:00.069  | 0:00:00      |     3684284 | [LZWCompress2 string]
0:00:00.398  | 0:00:00      |    39596440 | [LZWCompress string]
```

ldci

[15:58](#msg62d6d4b03bbb384889833645)@toomasv Possible : string concatenation in a loop seems to be O(N^2)

toomasv

[16:39](#msg62d6de3eef5ee44882b60773)^ Note that it should be `set 'LZWCompress2...`, and closing bracket is missing; I edited and messed it up. Sorry for sloppiness!

dockimbel

[16:51](#msg62d6e10776cd751a2f46a749)Looks great! Please post the final version to red/code repo.

toomasv

[16:56](#msg62d6e22dfe909e3ec7d7d208)Together with decompression:

```
context [
    stringTable: make map! []
    getCode: func [w [string! char!]][
        either string? w [select/case stringTable w][to-integer w]
    ]
    getString: func [code [integer!]][
        either code > 255 [stringTable/:code][to-char code]
    ]
    
    set 'LZWCompress2 function [string [string!]][
        clear StringTable
        code: 256
        w: string/1
        parse next string [
            collect some [
                set c skip (wc: rejoin [w c])
                [ if (find/case stringTable wc) (w: wc)
                | keep (getCode w)
                  (
                    put/case stringTable wc code 
                    code: code + 1 
                    w: c
                  )
                ]
                opt [end keep (getCode w)]
            ]
        ]
    ]
    
    set 'LZWDecompress2 function [codes [block!]][
        clear stringTable
        code: 256
        old: first codes
        rejoin parse next codes [
            collect [
                keep (getString old)
                some [
                    set new skip
                    opt [if (not s: getString new)(s: rejoin [getString old c])]
                    keep (s);(print [old new s])
                    (
                        c: first to-string s
                        stringTable/:code: rejoin [getString old c]
                        code: code + 1
                        old: new
                    )
                ]
            ]
        ]
    ]
]
```

[17:00](#msg62d6e34b8fe56a38b5a22842)

```
>> string: "WyS*WyGWYS*WySWYSG"
== "WyS*WyGWYS*WySWYSG"
>> codes: LZWCompress2 string
== [87 121 83 42 256 71 87 89 258 256 83 262 83 71]
>> recycle/off
>> profile/count/show [[LZWDecompress codes][LZWDecompress2 codes]] 1000 recycle
Count: 1000
Time         | Time (Per)   |      Memory | Code
0:00:00.085  | 0:00:00      |     2920284 | [LZWDecompress2 codes]
0:00:00.397  | 0:00:00      |    39828440 | [LZWDecompress codes]
```

[17:30](#msg62d6ea439a314a3ec4b6597a)@dsunanda pointed out decompression was faulty for cases like `LZWDecompress2 LZWCompress2 "AAA"`. Thanks!  
Here is correction:

```
set 'LZWDecompress2 function [codes [block!]][
        clear stringTable
        code: 256
        old: first codes
        rejoin parse next codes [
            collect [
                keep (x: getString old) 
                some [
                    set new skip 
                    opt [if (not s: getString new)(s: rejoin [getString old any [c x]])]
                    keep (s)
                    (
                        c: first to-string s
                        stringTable/:code: rejoin [getString old c]
                        code: code + 1
                        old: new
                    )
                ]
            ]
        ]
    ]
```

```
>> LZWDecompress2 LZWCompress2 "AAA"
== "AAA"
```

More testing and bughunting very welcome!

[17:44](#msg62d6ed8f1227f62be3a7fa3f)@ldci :point\_up: \[July 19, 2022 6:58 PM](https://gitter.im/red/red/system?at=62d6d4b03bbb384889833645) I am ignorant in complexity calculations. Can you please point out for me where is the problem.

[17:52](#msg62d6ef6cef5ee44882b68a45)Next improvement prompted by @dsunanda (case `LZWDecompress2 LZWCompress2 s: "^/"`):

```
set 'LZWCompress2 function [string [string!]][
        clear StringTable
        code: 256
        old: first string
        parse next string [
            collect some [
                set new skip (composed: rejoin [old new])
                [ if (find/case stringTable composed) (old: composed)
                | keep (getCode old)
                  (
                    put/case stringTable composed code 
                    code: code + 1 
                    old: new
                  )
                ]
                opt [end keep (getCode old)]
            |   end keep (getCode old)
            ]
        ]
    ]
```

```
>> LZWDecompress2 LZWCompress2 "^/"
== "^/"
```

ldci

[17:52](#msg62d6ef728fe56a38b5a277e4)@toomasv Just read on the internet. Not specialist :)

toomasv

[18:11](#msg62d6f3b70a5226479853e20b)And `LZWCompress2` should start with `if empty? string [return copy []]` and `LZWDecompress2` should start with `if empty? codes [return copy ""]`.  
Thanks to @dsunanda again!

[19:47](#msg62d70a6aef5ee44882b75624)Ok, with all corrections:

```
context [
    stringTable: make map! []
    getCode: func [w [string! char!]][
        either string? w [select/case stringTable w][to-integer w]
    ]
    getString: func [code [integer!]][
        either code > 255 [stringTable/:code][to-char code]
    ]
    
    set 'LZWCompress2 function [string [string!]][
        if empty? string [return copy []]
        clear StringTable
        code: 256
        old: first string
        ending: [end keep (getCode old)]
        parse next string [
            collect some [
                set new skip (composed: rejoin [old new])
                [ if (find/case stringTable composed) (old: composed)
                | keep (getCode old)
                  (
                    put/case stringTable composed code 
                    code: code + 1 
                    old: new
                  )
                ]
                opt ending
            |   ending
            ]
        ]
    ]
    
    set 'LZWDecompress2 function [codes [block!]][
        if empty? codes [return copy ""]
        clear stringTable
        code: 256
        old: first codes
        rejoin parse next codes [
            collect [
                keep (x: getString old) 
                some [
                    set new skip 
                    opt [if (not s: getString new)(s: rejoin [getString old any [c x]])]
                    keep (s)
                    (
                        c: first to-string s
                        stringTable/:code: rejoin [getString old c]
                        code: code + 1
                        old: new
                    )
                ]
            ]
        ]
    ]
]
```

## Wednesday 20th July, 2022

toomasv

[07:39](#msg62d7b13a8fe56a38b5a7eb19)\[Codes](https://github.com/toomasv/LZW/blob/main/LZW.red) are now extendable, not limited to default 255:

```
>> lzw-ctx/limit: 1000000
== 1000000
>> str: {plate: "tropical stuff: 🍌🍍 and other healthy food: 🥒🍅🥕"}
== {plate: "tropical stuff: 🍌🍍 and other healthy food: 🥒🍅🥕"}
>> cod: lzw-compress str
== [112 108 97 116 101 58 32 34 116 114 111 112 105 99 97 108 32 115 116 117 102 102 1000005 127820 127821 32 97 110 100 32 111 116 104 101 114 32 1000032 100001...
>> lzw-decompress cod
== {plate: "tropical stuff: 🍌🍍 and other healthy food: 🥒🍅🥕"}
```

ldci

[07:47](#msg62d7b329ab6b634f73540ad4)@toomasv You’re the best :)

toomasv

[08:00](#msg62d7b6160a52264798591b88):smile:

greggirwin

[08:01](#msg62d7b65222c53438bcb0cf9e):+1:

toomasv

[08:32](#msg62d7bdbb568c2c30d3db235e)This results from another input from @dsunanda, \*muchas gracias\*!

[08:58](#msg62d7c3ad9f29d42bed8bc7d4)Another example of usage:

```
>> str: read https://github.com/red/docs/blob/master/en/parse.adoc
== {^/^/^/^/^/^/^/<!DOCTYPE html>^/<html lang="en" data-color-mode="auto" data-light-theme="light" data-dark-theme="dark" data-a11y-animated-images="system">^/  ...
>> i: lzw-ctx/top str
== 129520
>> cod: lzw-compress/size str i + 1
== [10 129521 129522 10 60 33 68 79 67 84 89 80 69 32 104 116 109 108 62 129524 129535 129537 32 108 97 110 103 61 34 101 110 34 32 100 97 116 97 45 99 111 108 1...
>> str2: lzw-decompress cod
== {^/^/^/^/^/^/^/<!DOCTYPE html>^/<html lang="en" data-color-mode="auto" data-light-theme="light" data-dark-theme="dark" data-a11y-animated-images="system">^/  ...
>> str = str2
== true
```

ldci

[09:10](#msg62d7c698fe909e3ec7de42c1)@toomasv As usual your code is elegant . The solution with parse is very efficient because it avoids creating a big string table. It also avoids searching the codes in a large map. The only problem is that it is specific to Red parsing.  
I rewrote the initial code with your ideas to be able to use it with Red or Rebol

```
#!/usr/local/bin/r3
REBOL [
	Title:    "Red Language: LZW string compression and decompression "
	Authors:  "François Jouen and Toomas Vooglaid"
	File: 	  %LZW2.r3
	Tabs:	  4
	Rights:  "Copyright (C) 2022 Red Foundation. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

;--The Lempel-Ziv-Welch (LZW) algorithm provides loss-less data compression.
;--This code for strings is case-sensitive

LZW: context [
	limit: 256 ;Below this are chars, from this up - strings; may be increased if needed
	stringTable: make map! []
	
    getCode: func [w [string! char!]][
        either string? w [select/case stringTable w][to-integer w]
    ]
    
    getString: func [code [integer!]][
        either code > limit [stringTable/:code][to-char code]
    ]
    
    Compress: function [
    	string [string!]
    	/size limit 
    ][
    	if empty? string [return copy []]
        clear StringTable 
        codeTable: copy []
        if limit [self/limit: limit]
        code: self/limit 
        old: string/1
        foreach new next string [
        	composed: rejoin [old new]
			either find/case stringTable composed [old: composed][
				append codeTable getCode old
        		put/case stringTable composed code
            	code: code + 1
            	old: new
        	]
        ]
        codeTable
    ];--end of compress
    
    Decompress: function [
    "Decompress a list of codes to a string"
    	codes    [block!]
    	/size limit
    
	][  
		if empty? codes [return copy ""]
        clear stringTable
        if limit [self/limit: limit]
        code: self/limit 
        old: first codes
        outPut: to-string getString old
        foreach new next codes [
        	if not s: getString new [s: rejoin [getString old c]]
        	append outPut s
        	c: first to-string s
            stringTable/:code: rejoin [getString old c]
            code: code + 1
            old: new
        ]
        outPut
	];--end of Decompress
];--end of context
```

toomasv

[09:23](#msg62d7c9a0568c2c30d3db7aa6)@ldci :+1:  
Only, I had a mistake in `getString`. It should be `code >= limit`.

ldci

[09:27](#msg62d7ca9bfe909e3ec7de5e51)OK I’ll correct :)

Oldes

[09:29](#msg62d7caf3568c2c30d3db82bd)You should avoid using functions like `to-string` in tight loops. Use `to string!` instead to avoid unnecessary function calls. Also is good to use `unless` instead of `if not` to avoid one evaluation.

[09:36](#msg62d7cc9576cd751a2f4d0137)For R3, good optimization is use of `ajoin` instead of `rejoin`, when the result is a string.

```
>> profile [[ajoin ["a" "b"]] [rejoin ["a" "b"]]]

Running 2 code blocks 10 times.
----------------------------------------------------------------------------------
Time               | Evals  | S.made | S.expa | Memory      | Code
1.0x (1μs)         | 3      | 1      | 0      | 8           | [ajoin ["a" "b"]]
3.31x (4μs)        | 25     | 3      | 0      | 112         | [rejoin ["a" "b"]]
----------------------------------------------------------------------------------
```

toomasv

[09:38](#msg62d7cd1fd3c8894f7197e6c5)Thanks, @Oldes!

ldci

[11:16](#msg62d7e40bb408e830dc214d84)@Oldes Thanks for optimization for R3. I used rejoin since join and a join do not exist in Red:)

[11:55](#msg62d7ed3bd3c8894f7198d1ff)R3: test with a complet 255 table:

```
Running 2 code blocks 10 times.
-------------------------------------------------------------------------------
Time               | Evals  | S.made | S.expa | Memory      | Code
error              | 0      | 0      | 0      | 0           | lzw-test
100.0x (100ns)     | 0      | 0      | 0      | 0           | "WyS*WyGWYS*WySWYSG"
-------------------------------------------------------------------------------
--------------
String "WyS*WyGWYS*WySWYSG"
Codes  [87 121 83 42 256 71 87 89 258 256 83 262 83 71]
Result "WyS*WyGWYS*WySWYSG"
0.459
```

[11:56](#msg62d7ed7aab6b634f7355a27f)R3 test with the reduced table

```
Running 2 code blocks 10 times.
-------------------------------------------------------------------------------
Time               | Evals  | S.made | S.expa | Memory      | Code
error              | 0      | 0      | 0      | 0           | lzw-test
600.0x (600ns)     | 0      | 0      | 0      | 0           | "WyS*WyGWYS*WySWYSG"
-------------------------------------------------------------------------------
--------------
String "WyS*WyGWYS*WySWYSG"
Codes  [87 121 83 42 256 71 87 89 258 256 83 262 83 71]
Result "WyS*WyGWYS*WySWYSG"
0.07
```

Oldes

[12:02](#msg62d7eee88fe56a38b5a9a3fd)You are not using the `profile` correctly! It must be: `profile [[lzw-test "WyS*WyGWYS*WySWYSG"]]`

[12:03](#msg62d7ef1bab6b634f7355ae94)Notice the block inside a block!

ldci

[12:03](#msg62d7ef1e9f29d42bed8cff7e)@Oldes Oups.

[12:04](#msg62d7ef4a0a522647985ac1aa)I was just interested by dt :)

Oldes

[12:04](#msg62d7ef58ab6b634f7355b0a7)than use `dt`, but `profile` is much more precise.

GiuseppeChillemi

[12:04](#msg62d7ef59b408e830dc219d32)&gt; @Oldes Thanks for optimization for R3. I used rejoin since join and a join do not exist in Red:)

I have never understood the reason.

## Friday 22nd July, 2022

toomasv

[13:49](#msg62daab01b408e830dc3566ce)Added \[LZW21](https://github.com/toomasv/LZW/blob/main/LZW21.red) and \[LZW22](https://github.com/toomasv/LZW/blob/main/LZW22.red) to the repo. LZW21 should work on both R3 and Red. LZW22 is attempt to further optimize the algorithm mainly regarding the usage of memory. I haven't tried to run it on R3. Tests and comments welcome!

ldci

[14:41](#msg62dab732d3c8894f71aceec5)@toomasv Thanks :)

greggirwin

[18:01](#msg62dae612fe909e3ec7f4bcef):+1:

## Monday 1st August, 2022

ldci

[13:36](#msg62e7d6dacf6cfd27af601c9e)While Toomas continues decoding gif files, I have updated the Tiff library for reading and writing Tiff files : https://github.com/ldci/TiffLib

[13:36](#msg62e7d6eef4d7a323dea73d37)\[!\[image.png](https://files.gitter.im/55f4ffc80fc9f982beb085e7/uYAo/thumb/image.png)](https://files.gitter.im/55f4ffc80fc9f982beb085e7/uYAo/image.png)

dockimbel

[17:04](#msg62e8079e72ad51741fb451fe):+1:

cloutiy

[23:45](#msg62e8657c05ad4a3701c8302d)Aka Tiffany library?

## Tuesday 2nd August, 2022

ldci

[05:06](#msg62e8b0dc443b7927a7ef9cec)@cloutiy :)

## Wednesday 3th August, 2022

gurzgri

[17:23](#msg62eaaf22f4d7a323debc9899)@fix I can compile

```
Red/System []                                                   ;-- correct header Red/System, not Red ?

#import [
  "libsecp256k1.so" cdecl [
    context_create: "secp256k1_context_create" [
      flags [integer!]
      return: [pointer! [byte!]]
    ]
    pubkey_create: "secp256k1_ec_pubkey_create" [
      ctx [pointer! [byte!]]
      pubkey [pointer! [byte!]]
      seckey [pointer! [byte!]]
      return: [integer!]
    ]
  ]
]

create: func [
  return: [c-string!]                                              ;-- return: before /local
  /local ctx pubkey seckey
][
  ctx: context_create 1
  pubkey: declare pointer! [byte!]
  seckey: declare pointer! [byte!]
  pubkey_create ctx pubkey seckey
  as c-string! ctx                                                     ;-- return type
]
```

on Windows with

```
PS> red-toolchain -t Linux -c thoorens.reds
-=== Red Compiler 0.6.4 ===-
Compiling C:\Users\Christian Ensel\Development\thoorens.reds ...
Target: Linux
Compiling to native code...
...compilation time : 235 ms
...global words     : 4992 (15.17%)
...linking time     : 16 ms
...output file size : 7752 bytes
...output file      : C:\Users\Christian Ensel\Development\thoorens
```

but can't execute, no Linux here.

## Thursday 4th August, 2022

fix

[06:19](#msg62eb64faf4d7a323dec1a899)@gurzgri nice, sounds ok here too! now i have a "wrong ELF class: ELFCLASS64" error with execution, but i know how to solve it.  
Side note, compiler is not really meaning full. I think some kind of preprocessor could be really helpful for these kind of (beginners) errors

hiiamboris

[06:45](#msg62eb6b0d11a6a83d04a3b2df)compiler is throwaway, will be replaced by 64 bit one

fix

[06:49](#msg62eb6bed7ccf6b6d45c4b0e4)yes, but in the between i need to deal with 32 ;)

[06:49](#msg62eb6c00443b7927a703bee2)bbtw is there some cheat sheet to match C types with red types ?

hiiamboris

[06:50](#msg62eb6c2cf4d7a323dec1e2f8)only R/S specs afaik

## Saturday 3th September, 2022

ldci

[09:39](#msg631320ea443b7927a7f6d4cf)@fix Have a look here: https://github.com/ldci/OpenCV3-red for matching C and Red/S types

## Friday 9th September, 2022

Rebol2Red

[07:57](#msg631af1cf7ccf6b6d45c7c3cd)@toomasv

```
LZW: context [
    stringTable: make map! []
    getCode: func [w [string! char!]][
        either string? w [select/case stringTable w][to-integer w]
    ]
    getString: func [code [integer!]][
        either code > 255 [stringTable/:code][to-char code]
    ]

    set 'LZWCompress2 function [string [string!]][
        if empty? string [return copy []]
        clear StringTable
        code: 256
        old: first string
        ending: [end keep (getCode old)]
        parse next string [
            collect some [
                set new skip (composed: rejoin [old new])
                [ if (find/case stringTable composed) (old: composed)
                | keep (getCode old)
                  (
                    put/case stringTable composed code 
                    code: code + 1 
                    old: new
                  )
                ]
                opt ending
            |   ending
            ]
        ]
    ]

    set 'LZWDecompress2 function [codes [block!]][
        if empty? codes [return copy ""]
        clear stringTable
        code: 256
        old: first codes
        rejoin parse next codes [
            collect [
                keep (x: getString old) 
                some [
                    set new skip 
                    opt [if (not s: getString new)(s: rejoin [getString old any [c x]])]
                    keep (s)
                    (
                        c: first to-string s
                        stringTable/:code: rejoin [getString old c]
                        code: code + 1
                        old: new
                    )
                ]
            ]
        ]
    ]
]
```

```
str: {plate: "tropical stuff: 🍌🍍 and other healthy food: 🥒🍅🥕"}
cod: lzwcompress2 str
print lzwdecompress2 cod
```

I get this output on W10:

```
plate: "tropical stuff: : :none: and other healthy food: : :none:nonen"
```

toomasv

[09:28](#msg631b072d6837563d1cc61667)@Rebol2Red You should increase `limit`:

```
do https://raw.githubusercontent.com/toomasv/LZW/main/LZW.red
lzw-ctx/limit: 1000000
str: {plate: "tropical stuff: 🍌🍍 and other healthy food: 🥒🍅🥕"}
cod: lzw-compress str
lzw-decompress cod
== {plate: "tropical stuff: 🍌🍍 and other healthy food: 🥒🍅🥕"}
```

Rebol2Red

[13:41](#msg631b428205ad4a3701e22d2b)@toomasv But ofcourse. Thank you.

toomasv

[13:54](#msg631b4578f4d7a323dec4c902)You are welcome!

## Saturday 10th September, 2022

ldci

[14:53](#msg631ca503f4d7a323dec76c86)\[!\[image.png](https://files.gitter.im/55f4ffc80fc9f982beb085e7/sp4E/thumb/image.png)](https://files.gitter.im/55f4ffc80fc9f982beb085e7/sp4E/image.png)

[14:54](#msg631ca5099d3c186299f50db5)Gif Reader: https://github.com/ldci/GIF

hiiamboris

[15:05](#msg631ca7ba6837563d1cc92131)Cool! :+1:

[15:06](#msg631ca807f4d7a323dec77246)Can you figure out why it won't play gifs produced by \[Gifcam](https://downloads.digitaltrends.com/gifcam/windows) ? (I suppose it expects each frame to be own image, while Gifcam produces a progressive gif that only lists changed pixels, or smth like that)

ldci

[15:24](#msg631cac1e11a6a83d04aa41e8)@hiiamboris Thanks. Gifcam files seem slightly different from classical gif files. I need to test :)

[16:53](#msg631cc1216837563d1cc94ff5)@hiiamboris. Toomas’s code reads correctly Gifcam files :)

## Tuesday 13th September, 2022

isqwy

[04:44](#msg63200aa5458f823ce07de603)in the `Red/System` spec -&gt; 4.8.6 Literal arrays , the example code :

```
e: [1.23e10 "Hello" 789 "World!" 3.14]
pf: as float-ptr! e
probe pf/1                             ;-- outputs 1.23e+010
probe as-c-string e/3                  ;-- outputs Hello
probe e/5                              ;-- outputs 789
probe as-c-string e/7                  ;-- outputs World!
probe pf/5                             ;-- outputs 3.14
```

need help to understand:  
is `as-c-string` right?  
why `as-c-string e/3` is "hello" and `as-c-string e/7` is "world!"  
Thanks!

ldci

[06:37](#msg63202524458f823ce07e1693)@isqwy Have a look here: https://github.com/ldci/Red-System/tree/main/doc

isqwy

[06:41](#msg632026233a42316d33ea9555)@ldci Thank you! I'll read it

ldci

[06:42](#msg6320263d3a42316d33ea95a3)@isqwy You’re welcome

dockimbel

[08:22](#msg63203ddd11a6a83d04b107cd)@isqwy Quoting the documentation:  
&gt; Mixing the different allowed types in the same array is permitted (enumerations can also be used). In such case, the size of each array's slot is either 32-bit, or 64-bit if a float64! value is present.

And for that specific example:  
&gt; In the last example, pay attention to the different pointer indexes used, depending on the size (32-bit or 64-bit) of referenced value.

Literal arrays uses `pointer! [integer!]` in a mixed content scenario. As the first value above is 64-bit, accessing the 2nd slot needs `/3`. `as-c-string` is needed as `e` type is `pointer! [integer!]`.

## Wednesday 2nd November, 2022

ldci

[16:46](#msg63629eeb21df5f7a54cdc781)\[!\[image.png](https://files.gitter.im/55f4ffc80fc9f982beb085e7/SngA/thumb/image.png)](https://files.gitter.im/55f4ffc80fc9f982beb085e7/SngA/image.png)

[16:46](#msg63629efccf41c67a5cdd442e)Thanks to Oldes's efforts, we now have easy access to the latest versions of OpenCV with Rebol 3:)

Respectech

[17:01](#msg6362a263cd9a8436d146d67a)That's impressive!

ldci

[17:52](#msg6362ae4acd9a8436d146f105)Oldes did a fantastic job: we can run the code on the latest Apple 64-bit processors.

greggirwin

[18:49](#msg6362bbae86407c265ba02835):+1:

## Thursday 3th November, 2022

ldci

[11:12](#msg6363a22ea3ccb16cbe3accb8)We can use 1-4 channels images with char to float 64 matrices. I’m really waiting for a Red 64-bit :)

## Tuesday 15th November, 2022

ldci

[17:37](#msg6373ce3e2cb65702402b8417)\[!\[image.png](https://files.gitter.im/55f4ffc80fc9f982beb085e7/X1wN/thumb/image.png)](https://files.gitter.im/55f4ffc80fc9f982beb085e7/X1wN/image.png)

[17:37](#msg6373ce40a34b5112113130b1)for the fun

Respectech

[18:11](#msg6373d66e655bc46025cb164c)Making your own desktop environment?

ldci

[18:13](#msg6373d6b5ff5546644b47b1cd)Nope. Just an homage to NexT OS :)

greggirwin

[18:16](#msg6373d79ab1a759643672bd66)Beautiful @ldci.

ldci

[18:22](#msg6373d8e8655bc46025cb1a4f)One of the best OS around the history of computers :)

GalenIvanov

[18:35](#msg6373dbdeb1a759643672c440)Looks great, @ldci !

ldci

[18:44](#msg6373de1725ca105c88b9da8d)I had the chance to work for a group that sold NeXT stations. The OS is the ancestor of MacOS. In 1993 it was fabulous, and I think DocKimbel or Gregg remember it.

greggirwin

[18:57](#msg6373e10e15a3885c70f1b857)It's the ancestor of OSX, not MacOS, isn't it? It's Unix based and used Display Postscript, which made for amazing possibilities, way back then. Beautiful machines, but ahead of their time. Jobs didn't always make the best business decisions for marketability. :^)

[18:57](#msg6373e13318f21c023bb364e8)The UI design was truly a work of art.

## Wednesday 16th November, 2022

ldci

[04:28](#msg637466dff9491f62c9b6dc36)This ancestor is still used today even with Red:  
NSRect!: aka struct! [  
x \[float32!]  
y \[float32!]  
w \[float32!]  
h \[float32!]  
]  
NS means NextStep

## Friday 25th November, 2022

henrikmk

[11:43](#msg6380aa582cb657024042b305)The NextStep file system was not a work of art. I remember it being trashed shortly after installation, when I was trying to use it in emulation. Never got very far. But the rest of the OS is super interesting and fun to use.

greggirwin

[17:07](#msg6380f64fbcdb0060b83a6a52)A number of old Unix systems wer fragile in the face of crashes and such.
