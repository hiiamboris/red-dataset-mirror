
#4788: on-deep-change* does not always accurately report series position and slots range.
================================================================================
Issue is open, was reported by hiiamboris and has 12 comment(s).
[type.review]
<https://github.com/red/red/issues/4788>

See https://github.com/red/REP/issues/92 for some context. I've been afraid to write on-deep-change handlers for long, and I'm not surprised that it's full of bugs. I'm listing them here.

Now brace yourselves... ;)

**Describe the bug**

I tried counting the bugs here but failed to do so, so I just mark all bugs with `!!` and questions with `??` for further search.

### insert

```
>> insert/dup next s [z x] 2

ON-DEEP:
owner: 	make object! [x: [1 2 3 4 5] spec: [owner word target action
word: 	x
target: [2 3 4 5]
action: insert
new: 	[z x]
index: 	1
part: 	4						;) to infer dup = part / length? new

ON-DEEP:
owner: 	make object! [x: [1 z x z x 2 3 4 5] spec: [owner word targe
word: 	x
target:	[z x z x 2 3 4 5]
action:	inserted
new: 	[z x]
index: 	1
part: 	4
== [2 3 4 5]

>> insert/part/dup next s [z x c] 2 3

ON-DEEP:
owner:	make object! [x: [1 2 3 4 5] spec: [owner word target action
word:	x
target:	[2 3 4 5]
action:	insert
new:	[z x c]
index:	1
part:	6						;) (part = /dup * /part) now but we don't know dup

ON-DEEP:
owner:	make object! [x: [1 z x z x z x 2 3 4 5] spec: [owner word t
word:	x
target:	[z x z x z x 2 3 4 5]
action:	inserted
new:	[z x c]
index:	1
part:	6
== [2 3 4 5]
```
No way to discern `/part` from `/dup` (e.g. `insert/part/dup 1 3` will look the same as `insert/part/dup 3 1`). But at least we know the size of the inserted chunk.

```
>> insert/part/dup next s next [z x c] -2 3

ON-DEEP:
owner:	make object! [x: [1 2 3 4 5] spec: [owner word target action
word:	x
target:	[2 3 4 5]
action:	insert
new:	[x c]					;) !! broken negative part - should be [z x c]
index:	1
part:	6						;) !! ..and this should be = 3

ON-DEEP:						;) !! result should be [1 z z z 2 3 4 5]
owner:	make object! [x: [1 x c x c x c 2 3 4 5] spec: [owner word t
word:	x
target:	[x c x c x c 2 3 4 5]
action:	inserted
new:	[x c]					;) same
index:	1
part:	6						;) same
== [2 3 4 5]

; On 4097 also broken:
>> insert/part/dup next s next [z x c] -2 3

ON-DEEP:						;) !! should be [1 z z z 2 3 4 5]
owner:	make object! [x: [1 x c x c x c 2 3 4 5] spec: [owner word t
word:	x
target:	[2 3 4 5]
action:	insert
new:	[x c]					;) !! should be [z x c]
index:	1
part:	2						;) !! should be 3
== [2 3 4 5]					;) !! no `inserted` event, `insert` occurred after(!) the insertion
```

### append

```
>> append next s 'x

ON-DEEP:
owner: 	make object! [x: [1 2 3 4 5] spec: [owner word target action
word: 	x
target:	[2 3 4 5]			  	;) ?? at this index it's of no use
action:	append
new: 	x
index: 	5						;) index is 0-based and relative to head target
part: 	1

ON-DEEP:
owner: 	make object! [x: [1 2 3 4 5 x] spec: [owner word target acti
word: 	x
target: [2 3 4 5 x]
action: appended
new: 	x
index: 	5
part: 	1
== [1 2 3 4 5 x]
```
Append stands out from most actions and requires a special case for it: `if find [append appended] action [target: skip head target index]`. Not a bug, just an extra effort. I would prefer `target` to be there already.
```
>> append/part/dup next s skip s 2 -2 3

ON-DEEP:
owner:	make object! [x: [1 2 3 4 5] spec: [owner word target action
word:	x
target:	[2 3 4 5]
action:	append
new:	[3 4 5]
index:	5
part:	9						;) !! broken negative part, expected = 6

ON-DEEP:						;) !! expected result = [1 1 2 1 2 1 2 2 3 4 5]
owner:	make object! [x: [1 2 3 4 5 3 4 5 3 4 5 3 4 5] spec: [owner 
word:	x
target:	[2 3 4 5 3 4 5 3 4 5 3 4 5]
action:	appended
new:	[3 4 5 3 4 5 3 4 5 3 4 5]
index:	5
part:	9
== [1 2 3 4 5 3 4 5 3 4 5 3 4 5]

; Also broken on 4097
>> append/part/dup next s skip s 2 -2 3

ON-DEEP:						;) !! expected result = [1 1 2 1 2 1 2 2 3 4 5]
owner:	make object! [x: [1 2 3 4 5 3 4 5 3 4 5 3 4 5] spec: [owner 
word:	x
target:	[2 3 4 5 3 4 5 3 4 5 3 4 5]
action:	append
new:	[3 4 5 3 4 5 3 4 5 3 4 5]
index:	5
part:	3
== [1 2 3 4 5 3 4 5 3 4 5 3 4 5]	;) !! no `appended` event, !! `append` called after the change
```

### change

```
>> change/dup/part next s [z x c] 2 3

ON-DEEP:
owner:	make object! [x: [1 2 3 4 5] spec: [owner word target action
word:	x
target:	[2 3 4 5]
action:	change
new:	none					;) !! `new` is not set
index:	1
part:	3						;) we don't know dup here at all

ON-DEEP:
owner:	make object! [x: [1 z x c z x c 5] spec: [owner word target 
word:	x
target:	[5]
action:	changed
new:	none					;) not set again
index:	1
part:	6						;) we don't know neither dup nor part
== [5]
```
As with insert, at least we know the removed and inserted chunk's size.

`change` is funny. I wanted to see how this maps to overlapped changes: `change/part next s (at s 3) 3` but it crashed (see #4097).

Result in #4097:
```
>> change/part/dup next s (at s 3) 3 2

ON-DEEP:
owner:	make object! [x: [1 2 3 4 5] spec: [owner word target action
word:	x
target:	[2 3 4 5]
action:	change
new:	none
index:	1
part:	3

ON-DEEP:
owner:	make object! [x: [1 3 4 5 3 4 5 5] spec: [owner word target 
word:	x
target:	[3 4 5 3 4 5 5]
action:	changed
new:	none
index:	1
part:	6
== [5]
```
Same bugs, otherwise OK.
```
; Change with negative part and overlapping, 4097:
>> change/part/dup skip s 4 (at s 3) -3 2

ON-DEEP:
owner:	make object! [x: [1 2 3 4 5] spec: [owner word target action
word:	x
target:	[2 3 4 5]
action:	change
new:	none
index:	1
part:	3

ON-DEEP:
owner:	make object! [x: [1 3 4 5 3 4 5 5] spec: [owner word target 
word:	x
target:	[3 4 5 3 4 5 5]
action:	changed
new:	none
index:	1
part:	6
== [5]
```
Same result! OK!


### clear

`clear` seems OK to me.

### move

```
>> move/part next s (at s 3) 2

ON-DEEP:
owner:	make object! [x: [1 2 3 4 5] spec: [owner word target action
word:	x
target:	[3 4 5]
action:	move
new:	[2 3 4 5]
index:	1
part:	2

ON-DEEP:
owner:	make object! [x: [1 2 3 4 5] spec: [owner word target action
word:	x
target:	[3 4 5]
action:	moved
new:	none					;) why none? but okay, I won't be able to make sense of it anyway
index:	0						;) bug (6) - should be 1
part:	2
== [2 3 4 5]

>> move/part skip s 3 (at s 3) -2
== [3 4 5]						;) !! ignores negative part - also on 4097
```

### poke

`poke` seems OK to me.

### put

```
>> put next s 1.0 'x

ON-DEEP:
owner:	make object! [x: [1 2 3 4 5] spec: [owner word target action
word:	x
target:	[2 3 4 5]
action:	put
new:	x						;) !! doesn't tell the key to be inserted
index:	4						;) !! this time index is relative to target, not it's head?
part:	1						;) !! 2 items are about to be added, while part tells 1
== x 							;) !! no `put-ed` action followed

>> put next s 2 'y

ON-DEEP:
owner:	make object! [x: [1 2 3 4 5 1.0 x] spec: [owner word target 
word:	x
target:	[2 3 4 5 1.0 x]			;) !! would be nice to be at [3 4 ..]
action:	put
new:	y
index:	2						;) index is relative to head again!
part:	1

ON-DEEP:
owner:	make object! [x: [1 2 y 4 5 1.0 x] spec: [owner word target 
word:	x
target:	[2 y 4 5 1.0 x]			;) same
action:	put-ed
new:	y
index:	2
part:	1
== y
```

### random

```
>> random/only next s

ON-DEEP:						;) !! random/only does not change series, should not be triggered
owner:	make object! [x: [1 2 3 4 5] spec: [owner word target action
word:	x
target:	[2 3 4 5]
action:	random
new:	none
index:	1
part:	4
== 5
```

### reverse

```
>> reverse/part tail s -3		;) !! negative /part is broken for reverse, on 4097 as well
== []
>> s
== [1 2 3 4 5]
```

### sort

```
>> sort/skip/part/reverse next s 2 4

ON-DEEP:
owner:	make object! [x: [1 2 3 4 5] spec: [owner word target action
word:	x
target:	[2 3 4 5]
action:	sort
new:	none
index:	1
part:	0						;) !! part should be = 4

ON-DEEP:
owner:	make object! [x: [1 4 5 2 3] spec: [owner word target action
word:	x
target:	[4 5 2 3]
action:	sorted
new:	none
index:	1
part:	0						;) same
== [4 5 2 3]

>> sort/skip/part/reverse tail s 2 -4
== []
>> s
== [1 2 3 4 5]					;) !! negative /part is broken for sort

; On #4097:
>> sort/skip/part/reverse tail s 2 -4

ON-DEEP:
owner:	make object! [x: [1 4 5 2 3] spec: [owner word target action
word:	x
target:	[4 5 2 3]
action:	sort
new:	none
index:	1
part:	0
== [4 5 2 3]					;) !! no `sorted` event reported
```

### swap

```
>> swap [z] next s

ON-DEEP:
owner:	make object! [x: [1 2 3 4 5] spec: [owner word target action
word:	x
target:	[2 3 4 5]
action:	swap
new:	none					;) !! should be [z]
index:	1
part:	1

ON-DEEP:
owner:	make object! [x: [1 z 3 4 5] spec: [owner word target action
word:	x
target:	[z 3 4 5]
action:	swaped					;) ?? this should have two Ps: `swapped`
new:	none					;) as above
index:	1
part:	1
== [2]

>> swap next s [q]				;) with reversed args - the same, OK

ON-DEEP:
owner:	make object! [x: [1 z 3 4 5] spec: [owner word target action
word:	x
target:	[z 3 4 5]
action:	swap
new:	none
index:	1
part:	1

ON-DEEP:
owner:	make object! [x: [1 q 3 4 5] spec: [owner word target action
word:	x
target:	[q 3 4 5]
action:	swaped
new:	none
index:	1
part:	1
== [q 3 4 5]
```

### take

```
>> take/last/part next s 3

ON-DEEP:
owner:	make object! [x: [1 2 3 4 5] spec: [owner word target action
word:	x
target:	[2 3 4 5]
action:	take
new:	none
index:	1						;) !! wrong index - can't know where we're taking from
part:	3

ON-DEEP:
owner:	make object! [x: [1 2] spec: [owner word target action new i
word:	x
target:	[2]
action:	taken
new:	none
index:	1
part:	0
== [3 4 5]

>> take/part skip s 4 -3

ON-DEEP:
owner:	make object! [x: [1 2 3 4 5] spec: [owner word target action
word:	x
target:	[5]
action:	take
new:	none
index:	4
part:	-3						;) !! I'd like R/S to deal with this and act as forward take above

ON-DEEP:
owner:	make object! [x: [1 5] spec: [owner word target action new i
word:	x
target:	[]
action:	taken
new:	none
index:	4						;) !! this index is meaningless now, it's beyond the tail
part:	0
== [2 3 4]
```

### trim

```
>> s: o/x: reduce [none 1 2 none 4 5 none]
== [none 1 2 none 4 5 none]
>> trim/tail next s

ON-DEEP:
owner:	make object! [x: [none 1 2 none 4 5 none] spec: [owner word 
word:	x
target:	[1 2 none 4 5 none]
action:	trim
new:	none
index:	1
part:	0						;) !! should be = -1 + length? s

ON-DEEP:
owner:	make object! [x: [none 1 2 4 5] spec: [owner word target act
word:	x
target:	[1 2 4 5]
action:	trimmed
new:	none
index:	1
part:	0						;) same
== [1 2 4 5]					;) !! known bug in trim on blocks - ignores /tail

; On 4097:
>> trim/tail next s

ON-DEEP:
owner:	make object! [x: [none 1 2 4 5] spec: [owner word target act
word:	x
target:	[1 2 4 5]
action:	trim
new:	none
index:	1
part:	0
== [1 2 4 5]					;) !! no `trimmed` event, !! `trim` called after the change
```
Now with strings:
```
>> s: o/x: " a  b "
== " a  b "
>> trim/tail next s

ON-DEEP:
owner:	make object! [x: " a  b " spec: [owner word target action ne
word:	x
target:	"a  b "
action:	trim
new:	none
index:	1						;) !! should be = 5
part:	0						;) !! should be = 1

ON-DEEP:
owner:	make object! [x: " a  b" spec: [owner word target action new
word:	x
target:	"a  b"
action:	trimmed
new:	none
index:	1						;) same
part:	0
== "a  b"
```

Note I haven't considered after-the-tail series here ;)

Now, my main point here is: no matter how much effort one puts into handling all the special cases, these bugs turn effort into nothing because at the end of the day it won't work as intended. E.g. in the simple example described in https://github.com/red/REP/issues/92 a lot of holes will let `list-length` get out of sync with it's content easily.

**Expected behavior**

Should be in each note in the code.

**Platform version**
```
Red 0.6.4 for Windows built 27-Dec-2020/16:49:23
```



Comments:
--------------------------------------------------------------------------------

On 2020-12-31T00:07:50Z, greggirwin, commented:
<https://github.com/red/red/issues/4788#issuecomment-752796726>

    Thanks for all the research, and documenting it! :+1:

--------------------------------------------------------------------------------

On 2021-01-14T21:52:12Z, dockimbel, commented:
<https://github.com/red/red/issues/4788#issuecomment-760499420>

    > on-deep-change* is useless unless complete
    
    Most of the use-cases in View don't require an accurate `index` or `part` value (which are most of the issues you've reported), so it works fine there. Your characterization is an exaggeration, so I'm changing the title to something more neutral. ;-)

--------------------------------------------------------------------------------

On 2021-01-14T22:14:09Z, dockimbel, commented:
<https://github.com/red/red/issues/4788#issuecomment-760509509>

    @hiiamboris Could you also provide the set up code (the full owner object)?

--------------------------------------------------------------------------------

On 2021-01-14T22:30:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/4788#issuecomment-760516758>

    Oh. Riiiight :D
    
    I used this init code and then played with `o/x`:
    ```
    o: make deep-reactor! [
    	x: []
    	on-deep-change*: func spec: [owner word target action new index part] [
    		print ["^/ON-DEEP:"]
    		foreach w bind spec context? 'owner [
    			print rejoin [w ":^-" mold/flat/part get w 60]
    		]
    	]
    ]
    ```

--------------------------------------------------------------------------------

On 2025-03-05T06:12:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/4788#issuecomment-2699973715>

    An addition to `change` action: for strings, binary and vectors there's no `change` event, only `changed`. So the only way to figure out what happened is implementing some string diff algorithm.
    
    E.g.:
    ```
    >> o/x: "abcde"
    >> change/part o/x "-" 3
    
    ON-DEEP:
    owner:	make object! [x: "-de" spec: [owner word target action new i
    word:	x
    target:	"de"
    action:	changed
    new:	none
    index:	0
    part:	1
    == "de"
    ```

--------------------------------------------------------------------------------

On 2025-03-07T10:32:08Z, dockimbel, commented:
<https://github.com/red/red/issues/4788#issuecomment-2706098877>

    @hiiamboris missing `change` event added.

