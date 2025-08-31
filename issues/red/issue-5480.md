
#5480: Some operations on complement bitsets are wrong
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[type.review]
<https://github.com/red/red/issues/5480>

**Describe the bug**

Using helper func for visualization:
`base2: func [bs] [s: copy {} repeat i 24 [append s pick "10" on = find bs i - 1] insert skip insert skip s 8 "." 8 "." s]` 

| command | result | expected | ok? |
|-|-|-|-|
| `base2 c1: charset [0 - 15]` | `"11111111.11111111.00000000"` | `"11111111.11111111.00000000"` | ✅ |
| `base2 c2: charset [not 1 - 6]` | `"10000001.11111111.11111111"` | `"10000001.11111111.11111111"` | ✅ |
| `base2 exclude c1 c2` | `"01111110.11111111.11111111"` | `"01111110.00000000.00000000"` | ❌ |
| `base2 exclude c2 c1` | `"00000000.00000000.11111111"` | `"00000000.00000000.11111111"` | ✅ |
| `base2 union c1 c2` | `"11111111.11111111.11111111"` | `"11111111.11111111.11111111"` | ✅ |
| `base2 c1 or c2` | `"11111111.11111111.11111111"` | `"11111111.11111111.11111111"` | ✅ |
| `base2 intersect c1 c2` | `"10000001.00000000.11111111"` | `"10000001.11111111.00000000"` | ❌ |
| `base2 c1 and c2` | `"10000001.11111111.11111111"` | `"10000001.11111111.00000000"` | ❌ |
| `base2 difference c1 c2` | `"01111110.11111111.11111111"` | `"01111110.00000000.11111111"` | ❌ |
| `base2 c1 xor c2` | `"01111110.11111111.11111111"` | `"01111110.00000000.11111111"` | ❌ |

**To reproduce**
```
base2 c1: charset [0 - 15]
base2 c2: charset [not 1 - 6]
base2 exclude c1 c2
base2 exclude c2 c1
base2 union c1 c2
base2 c1 or c2
base2 intersect c1 c2
base2 c1 and c2
base2 difference c1 c2
base2 c1 xor c2
```

**Platform version**
```
Red 0.6.4 for Windows built 13-Feb-2024/15:12:43+03:00  commit #f519e8a
```


Comments:
--------------------------------------------------------------------------------

On 2024-02-14T02:53:30Z, qtxie, commented:
<https://github.com/red/red/issues/5480#issuecomment-1943008240>

    The length of the bitset should be taken into account.
    
    ```
    >> c1
    ==  make bitset! #{FFFF}      ;-- "11111111.11111111"
    >> c2
    == make bitset! [not #{7E}]   ;-- "10000001"
    >> length? c1
    == 16
    >> length? c2
    == 8
    >> c3: c1 and c2
    == make bitset! [not #{7E}]   ;-- "10000001"
    >> length? c3
    == 8
    ```
    `c1 and c2` is correct.

--------------------------------------------------------------------------------

On 2024-02-14T08:21:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/5480#issuecomment-1943274011>

    No it's not correct. Length is just an internal implementation detail. Implementation should not drive the design. Design should drive the implementation.

--------------------------------------------------------------------------------

On 2024-02-14T15:05:06Z, hiiamboris, commented:
<https://github.com/red/red/issues/5480#issuecomment-1944019346>

    General rules for bitsets should be:
    1. Result length should equal the longest operand's length, and may be zero:
       ```
       >> (charset []) or (charset [not]) 
       == make bitset! [not #{FF}]     ;) length was extended leading to wrong result! expected [not #{}]
       ```
    2. Negation flag may be freely set by binary operations depending on whether the trail should be set or not, e.g.:
       ```
       >> (charset [not]) and (charset [])
       == make bitset! [not #{}]       ;) expected empty set, got full set!
       >> (charset [not]) and (charset [not]) 
       == make bitset! #{}             ;) expected full set, got empty set!
       ```
    
    Current builds of Red, R3 and Ren-C I have all fail the bitset math. @Oldes @hostilefork FYI.

