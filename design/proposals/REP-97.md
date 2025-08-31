
#97: DESIGN: general `part` function
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
<https://github.com/red/REP/issues/97>

All of the following functions support /part refinement today: `remove copy insert find select change append move reverse sort take uppercase lowercase read write load form mold parse transcode parse-trace`.
- 15 of them are actions so multiply it by the number of series datatypes.
- `load` and `parse-trace` just dispatch it, but most of the rest handles /part in R/S code.
- `mold` & `form` are outliers: they apply /part to the output, not to input. `change` takes 2 inputs but applies /part only to the 1st.
- In `read` & `write` case /part is nonnegative.

Now it is quite obvious that keeping this whole thing in sync, at the same time continuing appying fixes and improvements is quite a tedious task, doomed to fail (I know that from PR #4097).

I would also like the following functions to also support /part:
- `foreach map-each remove-each` (otherwise one has to resort to `repeat` everytime one needs /part)
- `extract replace random`
- `absolute negate round sum average`
- `add subtract divide multiply power modulo mod remainder min max`
- `union difference exclude unique intersect`
- `xor and or`: [use case](https://gitter.im/red/red?at=63864965bcdb0060b843f9f4)

And it's not an exhaustive list.

To partly solve this issue I believe we should come up with a set of R/S functions or macros that handle the /part in a standard way.

Another way to help the situation is to create a `part` function that creates some sort of "limited" series, kind of like `red-slice!` internal type, so all R/S code can work with a standard interface.

**This design describes one possible way such `part` function can operate.**

The whole reason IMO /part refinements were added to Rebol is because we have in the series: hard-head (0), hard-tail (data length), soft-head (index), but no soft-tail.

One of the key benefits of a global part function is that it will add /part support to virtually every series function anyone will ever write with Red. Almost effortless.

---
1. **Spec: `part: func [series limit [integer! none! pair! series!]]`** returns the same `series` with internal `part` value set to `limit`. That `part` value should be held inside the cell. 

*Implementation note: at least 2 of every 3 series types do not have enough space in their cell to hold the required length, so either cell extension will be required (more RAM usage then), or we could leverage ports when they come out (may be slower).*

---
2. Internal /part value **can be**:
- `none` when there is no limit (limit=+INF)
- integer offset from the current index (0 meaning always empty series)

---
3. Part value **persists** until set to `none`. Think of it as a **sliding window** - it never changes it's size and moves together with the index. See how it works alongside #94 :
```
>> t2 
== [
 	1 	2 	3 	4
 	5 	6 	7 	8
 	9 	10 	11 	12
 	13 	14 	15 	16
]

>> p: part t2 1x0   ;-- part set to single row
== [
 	1 	2 	3 	4
]

>> next' p   ;-- which we can move around
== [
 	2 	3 	4 	5
]

>> skip' p 1x0   ;-- e.g. onto other rows
== [
 	5 	6 	7 	8
]

>> part p none   ;-- part reset
== [
 	1 	2 	3 	4
 	5 	6 	7 	8
 	9 	10 	11 	12
 	13 	14 	15 	16
]

>> tail' p   ;-- tail and head are still referring to the limits of the series buffer
== []

>> index?' tail' p 
== 17

>> index?' tail' t2 
== 17
```

---
4. **Every native and action** when given series with `part <> none` assumes it's /part argument set to this value.
```
>> copy' part t2 3 
== [1 2 3]

>> copy' part t2 6 
== [
 	1 	2 	3 	4
 	5 	6
]

>> copy' part t2 2x3   ;-- 2 rows of 4 size + 3 items
== [
 	1 	2 	3 	4
 	5 	6 	7 	8
 	9 	10 	11
]

>> remove' part copy' t2 1x0   ;-- removing one row we get to another
== [
 	5 	6 	7 	8
]

>> remove' remove' part copy' t2 1x0 
== [
 	9 	10 	11 	12
]

>> find' t2 13   ;-- row search
== [
 	13 	14 	15 	16
]

>> find' part t2 2x0 13   ;-- not within first 2 rows
== none
```

---
5. **`length?`** returning length of /part (actually, `min part tail`) should allow every other function to support it:
```
>> length?' p 
== 4

>> sum' t2   ;-- sum 1:16
== 136

>> sum' part t2 1x0   ;-- 1+2+3+4
== 10

>> add' (part t2 2x0) part t2 8   ;-- scalar matrix arithmetic
== [
 	2 	4 	6 	8
 	10 	12 	14 	16
]
```
That last example also extends to all arithmetic functions, and should help work with **matrices** stored as `vector!`.

---
6. /part specified **as series** is transformed into integer window size internally:
```
>> p: part t2 (skip' t2 1x0)   ;-- series part -> integer
== [
 	1 	2 	3 	4
]

>> skip' p 1x0 
== [
 	5 	6 	7 	8
]
```

---
7. Part should be applicable to **images**, but when it's a pair, meaning for images is different. Other than that, it's the same linear position of the lower right corner.

---
8. We'll need some **`part?` reflector** to read the `part` value as it is, unlike `length?` that fuses it with tail position.

---
9. **Alternative** designs would be:
- reset /part after every series function that supports it
- let /part be a fixed position in the series (as opposed to this sliding window model)

But after some thought I do not favor them.

---
**Wanna play?**

See https://gitlab.com/-/snippets/2066140



Comments:
--------------------------------------------------------------------------------

On 2023-05-20T15:39:32Z, hiiamboris, commented:
<https://github.com/red/REP/issues/97#issuecomment-1555938004>

    Treatment of negative /part values here is an interesting question.
    1. `part` can be clipped at zero, which is predictable, but not so useful
    2. `part skip series S -N` can be regarded as a series of length N, with head at S-N, and at its tail:
       ```
       series: "abcdefghijklmnopqrstuvwxyz"
       S:  20                     ; ^ index here
       N: -10           ; ^ head limited by part
       "klmnopqrst" = copy part skip series S N   ; part = none in a fresh copy
       probe part skip series S N                 ; returns "" because it is at slice's tail when part is negative
       ```
    3. `part skip series S -N` can flip the part sign by skipping:
       ```
       (part skip series S -N) = (part skip series S - N N)
       ```
       In this case `probe` output will be visible, of length N, which is useful, but head is an edge case, and it will modify the series index:
       ```
       series: "abcdefghijkl"
       S:  6        ; ^ index was here
       N: -10 ; ^ soft head limited by hard head
       probe part skip series S N                 ; outputs "abcdefghij", not "abcdef"!   
       1 = index? part skip series S N            ; index is modified
       ```

--------------------------------------------------------------------------------

On 2025-07-19T13:00:04Z, hiiamboris, commented:
<https://github.com/red/REP/issues/97#issuecomment-3092339242>

    A note: the hypothetical non-sticky `..` operator (that makes sense to use for slice (and range) construction) should dispatch into the `part` function for series arguments, e.g.:
    
    | original syntax | slice syntax | part syntax |
    |:-|:-|:-|
    | `copy/part bgn end` | `copy bgn..end` | `copy part bgn end` |
    | `append/part tgt bgn end` | `append tgt bgn..end` | `append tgt part bgn end` |
    | `find/part bgn item end` | `find bgn..end item` | `find part bgn end item` |
    
    and so on...

