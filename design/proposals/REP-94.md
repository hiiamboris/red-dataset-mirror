
#94: DESIGN: embedded /skip
================================================================================
Issue is open, was reported by hiiamboris and has 12 comment(s).
<https://github.com/red/REP/issues/94>

## Background

Use of /skip in series functions leads to micromanagement and clutter undeserving of a high-level language.
Imagine if Red values didn't carry their type inside and we always had to type: `x: [integer! 0]  if [integer! x] == [integer! y] [...]` and so on. Yes, `/skip` looks exactly that stupid. 
And when one suddenly decides to extend one's 'table' with new columns, it becomes a nightmare.

Proposed design explores the idea of embedding /skip into the series itself. Two possibilities:

1. We include /skip into the cell, together with the index (provided we find space). Then we become able to shape the same array of data at any time depending on how we wanna access it, e.g. `shape data 3` would change skip to 3 same as `skip data 3` changes the index.
- `shape data new-width` in this design simply creates a new cell pointing to the same data, similar to `as` native.

2. We include /skip into the series buffer, together with it's tail. And it makes sense, since /skip is really a property of the data itself. Drawback: when we want to ignore /skip and work on per-item basis, we have to temprorarily change /skip value in place, and restore it afterwards.
- In this design `shape data new-width [..code..]` would be a wrapper mezz. But if e.g. `code` will call some other code that relies on `data` having `old-width`, this gets messy.

Proposed design follows the (1) possibility as it is more flexible.

*Implementation note. This design benefits 3 types: `block!`, `hash!` and `vector!`. And only `block!` has a free 32-bit value in the cell. On the other hand, we have 3 reserved bits in the header, and 11 more bits can be freed, totaling at 14 bits = `0..16383` range. Not enough for a spreadsheet emulation using a mere block, and may not be enough for some big matrix computations, but for tasks we usually tend to solve with /skip - even `0..32` range is usually more than needed.*

*P.S. Actually, looking at `red-routine!` structure I believe more than 11 bits can be freed*

## Overview of `image!` model

In Red we already have a 2D series type: `image!`. Most of the linear thinking does not apply to it:
- image is always rectangular, it doesn't have a "tail" that we can set with single-pixel precision. As an illustration:
```
>> i: make image! [3x3 #{
	111111 212121 313131
	121212 222222 323232
	131313 232323 333333 
	}]
>> copy/part i 5
== make image! [3x1 #{111111 212121 313131}]
```
- both `index` (ROI starting point) of the image and it's `part` (ROI ending point) are 2D terms, so when we copy a part of it, we copy content between chosen columns (i.e. copy is sparse), and it's *two-dimensionally* clipped by the image/size:
```
>> copy/part skip i 1x0 100x2
== make image! [2x2 #{
	212121 313131
	222222 323232
	}]
```
- this maps quite badly to our linear series model (such code doesn't even make sense):
```
>> copy/part next i 4
== make image! [3x1 #{}]
```
- we can't even "select" any empty area of the image except for the tail, e.g. `skip i 3x0` wraps column=4 around and resets it to column=1:
```
>> skip i 3x0
== make image! [3x3 #{
	121212 222222 323232
	131313 232323 333333
	}]
```

Of course, image is 2D by nature and it wouldn't make sense to treat it as a linear succession of pixels, and what we see above is just the best we could do with *actions* designed for linearity. But for other series this model doesn't work, as by supporting planar model we are losing support of the linear one.

Attempt to fuse both 2D and 1D model into single interface leads to ambiguities. 

E.g. consider `copy/part series part` function, where both `series/size` and `part` can be 1D (integer) or 2D (pair):
- when /part is not set, and series/size is a pair: are we *linearly* or *planarly* copying until the tail? Is tail a planar point or linear marker?

And what is the meaning of `skip series amount` with e.g. `series/size = 5x5` and `amount = 6`?
- linearly skip `6` items arriving at point `2x2`?
- or planarly skip 6 columns (clipped to 5) arriving at point `6x1`?

As a result we can't apply proper 2D thinking here and should instead think of pseudo-2D (;

## Wire model

For the purpose of this design I'm going to call it's data type a **tube**, and the model - **wire model**,
for it resembles a wire (or spaghetti) rolled like a spiral inside a tube of predefined width. This is the model our /skip refinement currently follows:

E.g. for a tube of width=3 we have a representation:
```
tube: [
	1  2  3
	4  5  6
	]
append tube 3 7
== [
	1  2  3
	4  5  6
	7
	]
append tube 3 8
== [
	1  2  3
	4  5  6
	7  8
	]
```

Tube width can be:
- zero, meaning that it is *unbound*, same as we have today for any series
- positive integer, effectively defining that data consists of rows of a fixed size

In this model `copy` is always continuous, and addressing is linear: whereas pair `AxB` in image has a meaning `pixel at (X=A,Y=B)`, in *wire model* it's totally different: `skip A whole rows then skip B single items`, that is `linear-skip = (A * tube-width) + B` unambiguously maps between pair and integer representations. Note that `A` then denotes what would be `Y` in the image model.

For illustration let's define 2 tubes, one bound one unbound:
```
t1: [1 2 3 4 5 6 7 8 9 10]
t2: [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16]
t1/width: 0
t2/width: 4
```

---
First important aspect is **`mold`**: now it outputs data according to it's format:
```
>> t1 
== [1 2 3 4 5 6 7 8 9 10]

>> t2 
== [
 	1 	2 	3 	4
 	5 	6 	7 	8
 	9 	10 	11 	12
 	13 	14 	15 	16
]
```
This example is simplified. For `mold`, `load`, `save` we'll have to come up with a construction syntax (which for vectors is already convoluted enough).

---
Then **addressing**. Since width is known, we can omit it and tell the code to "skip N rows":
```
>> skip' t1 2 
== [3 4 5 6 7 8 9 10]

>> skip' t1 2x3   ;-- 2 rows of 0 size then 3 items
== [4 5 6 7 8 9 10]

>> skip' t2 2 
== [
 	3 	4 	5 	6
 	7 	8 	9 	10
 	11 	12 	13 	14
 	15 	16
]

>> skip' t2 2x3   ;-- 2 rows of 4 size then 3 items
== [
 	12 	13 	14 	15
 	16
]
```

---
There are 2 possible **`index?`** and **`length?`** functions:
```
>> index?' skip' t2 1x1 
== 6

>> pindex?' skip' t2 1x1 
== 1x2

>> length?' next' t2   ;-- 3*4+3
== 15

>> size?' next' t2   ;-- 3 full rows and 3 items
== 3x3
```
I haven't decided yet on the best way to add this pair index and length (as a refinement or a transform function), but it looks useful.

---
We can change tube width at will (but will have to provide a separate native/mezz for that):
```
>> shape t1 3   ;-- or `fit` is a better name?
== [
 	1 	2 	3
 	4 	5 	6
 	7 	8 	9
 	10
]

>> shape t1 1   ;-- width=0 and 1 differ only in visual representation and addressing
== [
 	1
 	2
 	3
 	4
 	5
 	6
 	7
 	8
 	9
 	10
]
```

---
**`extract`** is one of the interesting parts. We want to be able extract both columns and rows. Column extraction we have already:
```
>> extract' t2 1x0   ;-- column extraction
== [
 	1
 	5
 	9
 	13
]

>> extract' next' t2 1x0   ;-- we can even choose the column number
== [
 	2
 	6
 	10
 	14
]

>> extract' t2 2x0   ;-- sparse column extraction (only odd rows of column 1)
== [
 	1
 	9
]
```
I propose we add a `/width` refinement to `extract` to generalize it:
```
>> extract'/width t2 1x0 0x2   ;-- two-column extraction (skip = 1 row, width = 2 items)
== [
 	1 	2
 	5 	6
 	9 	10
 	13 	14
]

>> extract'/width t2 2x0 1x0   ;-- row extraction (skip = 2 rows, width = 1 row)
== [
 	1 	2 	3 	4
 	9 	10 	11 	12
]
```

---
Reordering (**`sort`, `reverse`, `random`**) will work on a row-by-row basis for `width <> 0`:
```
>> reverse' copy' t1 
== [10 9 8 7 6 5 4 3 2 1]

>> reverse' copy' t2 
== [
 	13 	14 	15 	16
 	9 	10 	11 	12
 	5 	6 	7 	8
 	1 	2 	3 	4
]
```

---
Set operations (**`union`, `exclude`, `unique`, `difference`, `intersect`**) support /skip but are currently comparing against 1st column only (need `/compare` and `/all` refinements from `sort`):
```
>> t3 
== [
 	1 	2 	3 	4
 	4 	0 	1 	4
 	4 	0 	0 	4
 	4 	0 	1 	4
]

>> union' t2 t3   ;-- set operations are using 1st column only
== [
 	1 	2 	3 	4
 	5 	6 	7 	8
 	9 	10 	11 	12
 	13 	14 	15 	16
 	4 	0 	1 	4
]

>> unique' t3 
== [
 	1 	2 	3 	4
 	4 	0 	1 	4
]

>> sort'/compare (union' t2 t3) 3   ;-- row sorting by 3rd column
== [
 	4 	0 	1 	4
 	1 	2 	3 	4
 	5 	6 	7 	8
 	9 	10 	11 	12
 	13 	14 	15 	16
]
```

---
**`foreach`** is also one of the most interesting aspects. If our data has rows, why will we ever want iteration not aligned to rows? Most useful case seems when `foreach` skips a whole row:
```
>> foreach' x t2 [print x]   ;-- by row iteration
1
5
9
13
== unset

>> foreach' [x y] t2 [print [x y]] 
1 2
5 6
9 10
13 14
== unset

>> foreach' [a b c d e] t2 [print [a b c d e]]   ;-- natural wrap around
1 2 3 4 5
5 6 7 8 9
9 10 11 12 13
13 14 15 16 none
== unset

>> foreach' [x y] shape t2 0 [print [x y]]   ;-- non-aligned iteration possible via setting width to 0
1 2
3 4
5 6
7 8
9 10
11 12
13 14
15 16
== unset

>> remove-each' [x y] copy' t2 [y < 10]   ;-- removes rows
== [
 	9 	10 	11 	12
 	13 	14 	15 	16
]
```
On the other hand, listing a proper number of words in the spec (`foreach [x y _ _] t2 [...]`) is not a problem either, so I'm undecided.

---
**`find` & `select`** now start looking for rows:
```
>> find' t2 13   ;-- row search
== [
 	13 	14 	15 	16
]

>> find' t2 [13 14]   ;-- row search
== [
 	13 	14 	15 	16
]

>> find' t2 14   ;-- search begins at 1st column
== none

>> select' shape t2 2 13   ;-- k/v store
== 14

>> select' shape t2 2 14   ;-- 14 is a value, not key
== none
```

---
The rest should be trivial.

## Wanna play?

Visit https://gitlab.com/-/snippets/2066140



Comments:
--------------------------------------------------------------------------------

On 2021-01-25T20:34:47Z, greggirwin, commented:
<https://github.com/red/REP/issues/94#issuecomment-767096302>

    First and most importantly, I appreciate all the thought that went into this, the explanations, and the working mezzanine code. A++
    
    The tube and wire metaphor is very helpful when thinking about images, but confusing to me when thinking about tables of records.
    
    > Attempt to fuse both 2D and 1D model into single interface leads to ambiguities.
    
    Agreed. But I'm not sure pseudo-2D is the right answer either. Images are a special case, and force-fit into what we have now, inelegantly in some ways.
    
    ```
    >> t2 
    == [
     	1 	2 	3 	4
     	5 	6 	7 	8
     	9 	10 	11 	12
     	13 	14 	15 	16
    ]
    
    >> skip' t2 2 
    == [
     	3 	4 	5 	6
     	7 	8 	9 	10
     	11 	12 	13 	14
     	15 	16
    ]
    
    I expected:
    
    >> skip' t2 2 
    == [
     	9 	10	11 	12
     	13 	14 	15 	16
    ]
    ```
    
    ```
    >> foreach' x t2 [print x]   ;-- by row iteration
    1
    5
    9
    13
    == unset
    
    I expected:
    
    >> foreach' x t2 [print x]   ;-- by row iteration
    1 	2 	3 	4
    5 	6 	7 	8
    9 	10 	11 	12
    13 	14 	15 	16
    
    ```
    
    I imagine you've also considered how path access will work, so a tube works like a block with sub-blocks. And _that_ model is the one you have to dethrone in my mind. For all the things I like about this idea, it leaves me feeling uneasy. It's like an uncanny valley of data. 9^/
    
    I like the idea of column extraction, enforcement of record size consistency, the efficiencies, and data carrying meta info. But I also appreciate the simplicity of nested blocks and key-value structures. My gut feeling is that this really cool idea may make things _harder_ for users rather than easier. Some of that is surely due to it being new to me, and needing more time to think about and then play with it. e.g. `skip'` necessarily deals in columns on the linear side, but if I think about fixed size rows, i.e. records, that's more like a DB, and they skip in terms of records.
    
    But a big part of it comes from having seen Redbol data in flat blocks, which had invisible structure to it, and that's not a good thing. So the idea of pseudo-2D, and needing to reason about behavior that may be subtle and easy to take for granted but goes wrong because of assumptions on incoming data for generic funcs.
    
    I'm not saying it's a bad thing to want, you know I want a `table` myself, but that trying to do it all with flat series is, itself, a low level approach (windowing over data) that has its own impedance mismatches and, perhaps, puts a bit too much strain on the leverage of the current series/action model for my taste. You've shown we can do this at the mezz level, so I still believe we can build a great `table` system and maybe use some of these ideas.
    
    Please make sure the community knows about this, so others can comment.
    

--------------------------------------------------------------------------------

On 2021-01-25T21:47:55Z, hiiamboris, commented:
<https://github.com/red/REP/issues/94#issuecomment-767134140>

    Thanks for your thoughts ;)
    
    To clarify, I totally agree with all you're saying. This model is not omnipotent. It is just a replacement for the ugly /skip we have. Nothing more, not a spreadsheet for sure. Still, blocks of records is an efficient structure and I can't think of removing it from Red, that's why I'm trying to make it better for the programmer (; The typical task this model tries to solve is e.g. reactions table in `reactivity.red`. Block of blocks has its merits but you can't find/select on it and that's it. And think of vectors. Vectors can't be nested.
    
    ```
    >> skip' t2 2 
    == [
     	3 	4 	5 	6
     	7 	8 	9 	10
     	11 	12 	13 	14
     	15 	16
    ]
    
    I expected:
    
    >> skip' t2 2 
    == [
     	9 	10	11 	12
     	13 	14 	15 	16
    ]
    ```
    My first idea was also that, skip rows. But then we lose the level of control we have right now. What if I want to prefix my 4x4 table with 3 configuration values? Looking closer you'll see I'm not really changing how most series functions operate. I just make them apply /skip implicitly.
    
    To achieve what you expect you can skip 2 rows: `skip' t2 2x0`.
    
    I will also post `part` design later, which beautifully complements this /skip design, especially for vectors. I like how they fit together well as the mockup code shows.
    
    By the way, I'm not saying that we should remove /skip refinements. In fact, most of the code won't change. It will just apply /skip from the cell's header, then from the refinement (if provided). This way we can get both a human friendly interface and backward compatibility with Rebol.
    

--------------------------------------------------------------------------------

On 2021-01-25T23:16:18Z, greggirwin, commented:
<https://github.com/red/REP/issues/94#issuecomment-767174221>

    Great. I'll be anxious to hear Nenad's thoughts as well. As you know I tend to think of higher level abstractions when I want a different model, and this provides a lot to think about.

--------------------------------------------------------------------------------

On 2021-01-26T20:21:57Z, mbk, commented:
<https://github.com/red/REP/issues/94#issuecomment-767804154>

    Just a quick note: we have a 2D image type already, why not create a tensor! type for numeric or other fixed values? It might already be in OpenCV - I have it on my todo list.

--------------------------------------------------------------------------------

On 2021-05-31T17:29:55Z, hiiamboris, commented:
<https://github.com/red/REP/issues/94#issuecomment-851609133>

    Here's a magnificent display of why I insist /skip must be embedded (real code from reactivity):
    ```
    unlink-reaction: function [reactor [object!] reaction [function! block!]] [
    	at-reactor: find/same/skip reactors reactor REACTORS-PERIOD
    	pos: next relations: at-reactor/2
    	while [pos: find/same/only/skip pos :reaction RELATIONS-PERIOD][
    		--debug-print-- ["-- react: removed --" :reaction "FOR" pos/-1 "IN" reactor]
    		remove-part back found?: pos RELATIONS-PERIOD
    	]
    	if empty? relations [remove-part at-reactor REACTORS-PERIOD]
    
    	at-reaction: find/same/only/skip reactions :reaction REACTIONS-PERIOD
    	remove find/same objs: at-reaction/2 reactor
    	if empty? objs [remove-part at-reaction REACTIONS-PERIOD]
    	found?
    ]
    ```
    Now isn't this a mess? ☻

--------------------------------------------------------------------------------

On 2021-05-31T21:02:50Z, greggirwin, commented:
<https://github.com/red/REP/issues/94#issuecomment-851681120>

    Just read through this again, and vectors are certainly a key value area here. I saw an interesting video some years back about security analysis of executables, looking at the binaries as data and windowing using different patterns, creating a pointcloud like visualization that made it instantly clear when things lined up into chunks and such.

