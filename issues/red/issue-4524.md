
#4524: Ownership quirks
================================================================================
Issue is open, was reported by hiiamboris and has 8 comment(s).
[type.design]
<https://github.com/red/red/issues/4524>

**Describe the bug**

Part of this issue are clearly bugs/limitations, part questions that they raise...

**1. Inner objects are not always owned by default:**
```
d: deep-reactor [o: object [s: 0] on-deep-change*: func [o w t a n i p] [?? n]] ()
d/o/s: [0] ()      ;) make a series to track the changes in
d/o/s/1: 2
d/o: d/o ()      ;) make d the owner of o
d/o/s/1: 3
```
Tracks only the last line:
```
>> d/o/s/1: 2
>> d/o/s/1: 3
n: 3
n: 3
== 3
```
Although if the object initially contains a series:
```
d: deep-reactor [o: object [s: [0]] on-deep-change*: func [o w t a n i p] [?? n]] ()
d/o/s/1: 2
d/o: d/o ()       ;) make d the owner of o
d/o/s/1: 3
```
Then it is initially owned:
```
>> d/o/s/1: 2
n: 2
n: 2
== 2
>> d/o: d/o ()       
>> d/o/s/1: 3
n: 3
n: 3
== 3
```

---
**2. Outer object can't track assignments to fields of inner object - only changes in the series:**
```
d: deep-reactor [o: object [s: [1]] on-change*: func [w o n] [?? n] on-deep-change*: func [o w t a n i p] [?? n]] ()
d/o: d/o ()
d/o/s: d/o/s ()
d/o/s/1: 2
```
Results in:
```
...
>> d/o/s: d/o/s ()
>> d/o/s/1: 2
n: 2
n: 2
== 2
```
So it can see a change *inside* `s` but not the reassignment of `s` itself. Neither `on-change*` nor `on-deep-change*` catch the change. I expected `on-deep-change*` to do.

---
**3. Do we actually *want* to report changes in inner objects to the outer one?**

I can tell that the current reactivity implementation does not use this potential: it only detects the last object in a path, and counts it as a reactor. Example for clarity:
```
d: deep-reactor [o: object [s: [1]] on-deep-change*: func [o w t a n i p] [?? o ?? w]] ()
react [probe d/o/s]
```
`react` here will find `o`, see that it's not a reactor, and will ignore it, not making a new relation. It won't look further for `d`. But even if it did, it would have been limited: see the next clause.

---
**4. What if there are multiple `on-deep-change*` funcs on the way?**

```
d: deep-reactor [o: deep-reactor [s: [1] on-deep-change*: func [o w t a n i p] [print 'inner ?? n]] on-deep-change*: func [o w t a n i p] [print 'outer ?? n]] ()
d/o/s/1: 2
d/o/s: d/o/s
d/o: d/o
```
Outputs:
```
>> d/o/s/1: 2
inner
n: 2
inner
n: 2
== 2
```
So only the "innermost" `on-deep-change*` detects the change. That means the owner will see the deep change in an inner object, in an inner reactor, but not in an inner deep reactor. Which is again, inelegant and limited and makes me wonder if there's value at all in such deep detection.

---
**5. In the reactivity implementation, this part looks weird to me:**

https://github.com/red/red/blob/2ffb93280b95c5f8b173abbe4973e0d3430a7580/environment/reactivity.red#L30-L34
So, if I change a value, that is a block, to the same block with different index - it's ownership is not going to get reassigned. E.g. `obj/x: next obj/x` does not trigger `modify`.
But why only a block? Why all strings, hashes, images should trigger it? Is this just an oversight or there's some hidden meaning in it?

**Expected behavior**

Up for discussion at this point...

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



Comments:
--------------------------------------------------------------------------------

On 2020-12-30T20:31:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/4524#issuecomment-752749252>

    loosely related: https://github.com/red/REP/issues/92

--------------------------------------------------------------------------------

On 2021-10-15T10:13:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/4524#issuecomment-944172171>

    Another quirk.
    Reactor initially owns it's series within series but not those added afterwards:
    ```
    o: make deep-reactor! [
    	x: [[]]
    	on-deep-change*: func spec: [owner word target action new index part] [
    		print ["^/ON-DEEP:"]
    		foreach w bind spec context? 'owner [
    			print rejoin [w ":^-" mold/flat/part get w 60]
    		]
    	]
    ]
    append/only o/x []
    ```
    ```
    >> o/x
    == [[] []]
    >> append o/x/1 1
    
    ON-DEEP:
    owner:	make object! [x: [[] []] spec: [owner word target action new
    word:	x:
    target:	[]
    action:	append
    new:	1
    index:	0
    part:	1
    
    ON-DEEP:
    owner:	make object! [x: [[1] []] spec: [owner word target action ne
    word:	x:
    target:	[1]
    action:	appended
    new:	1
    index:	0
    part:	1
    == [1]
    >> append o/x/2 2
    == [2]       ;) UNDETECTED
    ```

--------------------------------------------------------------------------------

On 2021-10-28T07:21:09Z, hiiamboris, commented:
<https://github.com/red/red/issues/4524#issuecomment-953570556>

    Another and biggest issue is tracking of changes into inner series.
    
    Using reactor from https://github.com/red/red/issues/4788:
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
    Let's make a deep change:
    ```
    >> o/x: [[1 "" [1]] [[2] 2]]
    == [[1 "" [1]] [[2] 2]]
    >> p: next o/x/2/1
    == []
    >> append p 3
    
    ON-DEEP:
    owner:	make object! [x: [[1 "" [1]] [[2] 2]] spec: [owner word targ
    word:	x
    target:	[]
    action:	append
    new:	3
    index:	1
    part:	1
    
    ON-DEEP:
    owner:	make object! [x: [[1 "" [1]] [[2 3] 2]] spec: [owner word ta
    word:	x
    target:	[3]
    action:	appended
    new:	3
    index:	1
    part:	1
    == [2 3]
    ```
    
    We can't know where it happened!
    The only piece of into is the `target`.
    To actually find the `target` in `x` is a lot of work! We have to recursively scan whole block for series, and manually check if that series' head is the head of the series we're looking for. We can't just search for `target` there because as in the above example, it can be on a different offset and we won't find it:
    ```
    	deep-offset?: function [series chunk /with path] [
    		path: any [path copy []]
    		if (head series) =? head chunk [return append path offset? series chunk]
    		
    		pos: series
    		append path 0
    		while [pos: find/tail pos series!] [
    			change-last path offset? series back pos
    			if deep-offset?/with pos/-1 chunk path [return path] 
    		]
    		take/last path
    		none
    	]
    ```
    But this super-inefficient code is still unreliable and naive. What if I have multiple instances of the same series buffer in my series?
    ```
    >> o/x: reduce [[1 "" [1]] reduce [a: [2 3 4] next a a 2]]
    == [[1 "" [1]] [[2 3 4] [3 4] [2 3 4] 2]]
    >> p: next o/x/2/3
    == [3 4]
    >> insert head p 1
    
    ON-DEEP:
    owner:	make object! [x: [[1 "" [1]] [[2 3 4] [3 4] [2 3 4] 2]] spec
    word:	x
    target:	[2 3 4]
    action:	insert
    new:	1
    index:	0
    part:	1
    
    ON-DEEP:
    owner:	make object! [x: [[1 "" [1]] [[1 2 3 4] [2 3 4] [1 2 3 4] 2]
    word:	x
    target:	[1 2 3 4]
    action:	inserted
    new:	1
    index:	0
    part:	1
    == [2 3 4]
    >> o/x
    == [[1 "" [1]] [[1 2 3 4] [2 3 4] [1 2 3 4] 2]]
    ```
    So I have to find all occurrences of the `target` using brute force of deep iteration, then check if the change affected series' length or items after the current index for each occurrence.
    
    This issue may not have a solution, I know. At least I don't see one.
    
    

--------------------------------------------------------------------------------

On 2022-08-14T11:31:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/4524#issuecomment-1214346678>

    In design scope, wanna link (typical) beginner issues with ownership/reactivity: [gitter](https://gitter.im/red/GTK?at=6290a5acd126691416b96d9e). I've run into similar problems myself back in the day.
    
    Also here's a case from my latest work:
    - I have a `text` space template with `/text` facet in it
    - and a `field` template with a `text` space (built upon `text` template) owned by it
    - that inner `text` space is required to be a separate object, so it can be styled along with all other text spaces in a single style (no way around that)
    - `field` has to expose `field/text` facet for convenience, but what is really being rendered is `field/text/text`
    - so I have to watch in `field/on-change` for `field/text` assignment and set `field/text/text` to the *same* string, triggering `text/on-change` that will update the text's internals and look (so can't use `set-quiet`)
    
    That sort of works for shallow reactivity triggered by `set`. But future-wise, if I wanted (and it was feasible) to expose deep reactivity to users, setting `field/text/text` would transfer that string ownership from `field` into `text`, and it would fail the users. I would have to either set `field/text: field/text/text`  to restore ownership, or manually carry it over with `modify`. And then I would ask myself, what the hell I'm doing? This looks like workarounds for workarounds already.
    
    Reactivity is one of the highest level features, so it has to be *user-friendly*. Of course we could solve it Gregg's way, putting a big Warning banner in the reactivity documentation (which currently never even mentions "ownership") saying where the dragons lie and how to avoid them, saving people some time and headache. But that's not ultimately a solution, as either we solve complexity ourselves or we shift it to our users, and in my experience hidden state (which is ownership) is one of the worst sources of complexity in software.
    
    All this is not to be read as criticism, but as arguments and case studies for further design quests.

