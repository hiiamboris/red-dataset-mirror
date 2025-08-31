
#3396: sort trips on NaNs
================================================================================
Issue is open, was reported by hiiamboris and has 30 comment(s).
[type.review]
<https://github.com/red/red/issues/3396>

### Steps to reproduce the problem
```
sort [1.#inf -1.0 1.#nan 1.0 -1.#inf 1.#nan 0]
sort/reverse [1.#inf -1.0 1.#nan 1.0 -1.#inf 1.#nan 0]
```

### Actual behavior
```
>> sort [1.#inf -1.0 1.#nan 1.0 -1.#inf 1.#nan 0]
== [-1.0 1.#INF 1.#NaN -1.#INF 1.0 1.#NaN 0]
>> sort/reverse [1.#inf -1.0 1.#nan 1.0 -1.#inf 1.#nan 0]
== [1.#INF -1.0 1.#NaN 1.0 -1.#INF 1.#NaN 0]
```
As you can see NaNs sort of "delimit" the sorting groups: `sort` does not pass values around them. This makes the output of `sort` depend on the order in which values in the block were laid out. Which is not what one expects from `sort`, right?

### Expected behavior
Forward sort might produce any of the following:
```
== [-1.#INF -1.0 0 1.0 1.#INF 1.#NaN 1.#NaN]
== [1.#NaN 1.#NaN -1.#INF -1.0 0 1.0 1.#INF]
```
and reverse sort any of:
```
== [1.#INF 1.0 0 -1.0 -1.#INF 1.#NaN 1.#NaN]
== [1.#NaN 1.#NaN 1.#INF 1.0 0 -1.0 -1.#INF]
```
Doesn't matter at which end are NaNs, but
```
x: reverse sort copy [1.#inf -1.0 1.#nan 1.0 -1.#inf 1.#nan 0]
y: sort/reverse copy [1.#inf -1.0 1.#nan 1.0 -1.#inf 1.#nan 0]
r: yes
repeat i length? x [
   set [a b] reduce [x/:i y/:i]
   r: all [ r
      any [ a = b                 ;-- equal
         all [a <> a  b <> b]     ;-- both are NaNs
      ]
   ]
]
```
should hold true.

### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 703 date: 10-May-2018/3:19:55 commit: #7c5f402062ac67fbd6078592ca477bbe91a56f92 ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-10-07T07:39:49Z, bitbegin, commented:
<https://github.com/red/red/issues/3396#issuecomment-427632903>

    > The numerical comparison operators <, <=, >, and >= always return false if either or both operands are NaN. 
    
    As NaN is very special, i don't know how to fix this. Maybe you can avoid to use 'sort' for it

--------------------------------------------------------------------------------

On 2018-10-09T09:10:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/3396#issuecomment-428119045>

    I suggest that `sort` should treat NaNs *as if* these were of different *type* than floats. Although it's a design decision that should be taken by the core team only.

--------------------------------------------------------------------------------

On 2019-09-17T16:36:35Z, qtxie, commented:
<https://github.com/red/red/issues/3396#issuecomment-532300413>

    You cannot sort `NaN` as it's not equal to any float values, and neither greater nor lesser than any float values. https://en.wikipedia.org/wiki/NaN#Comparison_with_NaN

--------------------------------------------------------------------------------

On 2019-09-17T18:17:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/3396#issuecomment-532339828>

    @qtxie indeed. But NaNs prevent the other numbers from being sorted. How can we solve it gracefully?

--------------------------------------------------------------------------------

On 2019-09-17T18:19:27Z, 9214, commented:
<https://github.com/red/red/issues/3396#issuecomment-532340725>

    Just tuck NaNs away at the head / tail (@hiiamboris' original proposal)? How other languages handle that, BTW?

--------------------------------------------------------------------------------

On 2019-09-17T18:26:34Z, qtxie, commented:
<https://github.com/red/red/issues/3396#issuecomment-532343560>

    @hiiamboris This works:
    ```
    sort/compare [
    	1.#inf -1.0 1.#nan 1.0 -1.#inf 1.#nan 0
    ] function [a b][either NaN? a [false][a - b]]
    ```

--------------------------------------------------------------------------------

On 2020-07-09T12:08:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/3396#issuecomment-656089412>

    Just look at how I'm sorting table data today, after a couple of fixes and workarounds by @qtxie made it finally possible:
    ```
    ; values: [block of unknown data...]
    ; indexes: [1 2 3 ... length? data]
    buf1: []  buf2: []
    sort/stable/compare indexes func [a b] [	;-- /stable is required for multi-column sort to work
    	change/only buf1 :values/:a				;-- change/only is required for setting unset! values
    	change/only buf2 :values/:b				;-- blocks are required to compare values of different types
    	case [
    		:buf1/1 <> :buf1/1 [-1]				;@@ workaround for #3396 - pushes NaNs to the tail
    		buf1 < buf2 [1]						;@@ workaround for #4489 crash - need 3 states
    		buf1 > buf2 [-1]
    		"equal"     [0]						;@@ can't use = because of #4456
    	]
    ]
    clear buf1  clear buf2
    ; rearrange data using indexes
    ```
    Nice and very user friendly, eh? ;)

--------------------------------------------------------------------------------

On 2020-07-09T13:49:44Z, qtxie, commented:
<https://github.com/red/red/issues/3396#issuecomment-656139123>

    That's the real world. Not every question has a simple solution.

--------------------------------------------------------------------------------

On 2021-09-22T12:04:01Z, dockimbel, commented:
<https://github.com/red/red/issues/3396#issuecomment-924864810>

    @hiiamboris Is the current behavior satisfying? If it is, let's close this ticket.

--------------------------------------------------------------------------------

On 2021-09-22T12:27:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/3396#issuecomment-924882718>

    Watch the mutation of result as I move single NaN from the tail to the head stepwise:
    ```
    >> sort [1.#inf -1.0 1.#nan 1.0 -1.#inf 0 1.#NAN] == [-1.#INF -1.0 0 1.0 1.#NaN 1.#NaN 1.#INF]
    >> sort [1.#inf -1.0 1.#nan 1.0 -1.#inf 1.#NAN 0] == [-1.#INF -1.0 0 1.0 1.#NaN 1.#NaN 1.#INF]
    >> sort [1.#inf -1.0 1.#nan 1.0 1.#NAN -1.#inf 0] == [-1.#INF -1.0 0 1.0 1.#NaN 1.#NaN 1.#INF]
    >> sort [1.#inf -1.0 1.#nan 1.#NAN 1.0 -1.#inf 0] == [1.#NaN -1.0 1.#NaN 1.#INF 1.0 -1.#INF 0]
    >> sort [1.#inf 1.#NAN -1.0 1.#nan 1.0 -1.#inf 0] == [1.#NaN 1.#NaN -1.0 1.#INF 1.0 -1.#INF 0]
    >> sort [1.#NAN 1.#inf -1.0 1.#nan 1.0 -1.#inf 0] == [1.#NaN 1.#INF -1.0 1.#NaN 1.0 -1.#INF 0]
    ```
    As I see it result of such sort is still **undefined**.
    
    Same with mergesort:
    ```
    >> sort/stable [1.#inf -1.0 1.#nan 1.0 -1.#inf 0 1.#NAN] == [-1.0 1.#NaN -1.#INF 0 1.0 1.#INF 1.#NaN]
    >> sort/stable [1.#inf -1.0 1.#nan 1.0 -1.#inf 1.#NAN 0] == [-1.0 1.#NaN -1.#INF 1.#NaN 0 1.0 1.#INF]
    >> sort/stable [1.#inf -1.0 1.#nan 1.0 1.#NAN -1.#inf 0] == [-1.0 1.#NaN 1.#NaN -1.#INF 0 1.0 1.#INF]
    >> sort/stable [1.#inf -1.0 1.#nan 1.#NAN 1.0 -1.#inf 0] == [-1.#INF -1.0 0 1.0 1.#INF 1.#NaN 1.#NaN]
    >> sort/stable [1.#inf 1.#NAN -1.0 1.#nan 1.0 -1.#inf 0] == [1.#INF 1.#NaN -1.0 1.#NaN -1.#INF 0 1.0]
    >> sort/stable [1.#NAN 1.#inf -1.0 1.#nan 1.0 -1.#inf 0] == [1.#NaN -1.#INF -1.0 0 1.0 1.#INF 1.#NaN]
    ```

--------------------------------------------------------------------------------

On 2022-05-04T19:02:27Z, greggirwin, commented:
<https://github.com/red/red/issues/3396#issuecomment-1117701044>

    New chat related to this: https://gitter.im/red/red/gui-branch?at=6272b1a6eaf3267f85456dfe

--------------------------------------------------------------------------------

On 2023-07-27T19:47:03Z, greggirwin, commented:
<https://github.com/red/red/issues/3396#issuecomment-1654447297>

    Let's see if this new matrix message link works for the old chat: https://matrix.to/#/!ARPBrpwJJYziTJYuJj:gitter.im/$-xwKNdxbTmRTa52UigJ1e3KmHO38kPu7ArFgqXOkY14

--------------------------------------------------------------------------------

On 2023-07-27T19:57:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/3396#issuecomment-1654468526>

    No idea how to open it in my client :) However if I click on it from inside red/activity room where it happens to also appear, it just changes room to gui-branch. 🤷🏻‍♂️

--------------------------------------------------------------------------------

On 2023-07-27T19:58:33Z, greggirwin, commented:
<https://github.com/red/red/issues/3396#issuecomment-1654470030>

    My view then: 
    
    If NaNs are technically floats, and we support them as a value, sort should never crash because they exist. That's step 1. Step 2 is whether they produce nonsensical sorted results for NaNs themselves. That's bad, but not our fault (again, technically). But given that it affects how other values sort, it's bugged.
    ...
    We should do the most helpful thing for the user, and that means keeping them together. If we choose not to do this, we have to clearly doc the issue. I'm OK with noting that custom sorting needs to be NaN-aware, but we should provide templates for people to copy.
    
    And @qtxie  said: So we just need to handle COMP_SORT in float/compare ?
    
    The question for me is not what IEEE says, but what makes Red b) produce the most useful result that is easy to reason about¹ (e.g. NaNs group together and other values are sorted correctly), and a) not look stupid.
    
    ¹ WRT "easy to reason about and not looking stupid"
    ```
    >> n: 0  while [n <= 0.3][print mold/all n  n: n + 0.1]
    0
    0.1
    0.2
    ; Huh?
    >> n: 0  while [n <= 3][print mold/all n  n: n + 1]
    0
    1
    2
    3
    ; OK. I'm not crazy
    >> n: 0  while [n <= 0.4][print mold/all n  n: n + 0.1]
    0
    0.1
    0.2
    0.30000000000000004
    0.4
    ; What... Oh... How do I work around that?
    ```
    
    I had to jump through hoops to get to it in a browser. Hence cutting this in directly.

--------------------------------------------------------------------------------

On 2023-07-27T20:05:00Z, greggirwin, commented:
<https://github.com/red/red/issues/3396#issuecomment-1654480774>

    The "looking stupid" part is *really* important, especially things that *look* simple, because it destroys their confidence that Red can be trusted to do anything right. Yes, we can explain it. Yes, not everyone will hit this. But the flip side of looking stupid is that we don't just look like we're passing problems on and throwing our hands in the air, saying it's not our problem; it's part of our mission, and being empathetic to pain points is something people can hold up as examples of why *to* use Red, rather than why *not* to use Red.

