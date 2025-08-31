
#3084: (WISH) - MAP! - NO LIMITATIONS ON TYPE OF KEYS
================================================================================
Issue is closed, was reported by numberjay and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/3084>

(unless there are deeper reasons for limiting the number of types supported as keys for map!)

i propose to always empower the programmer and for example let her choose to use blocks as keys in a map! even if the very mutable and dynamic nature of blocks could potentially fire back

there are countless valid use cases for blocks (and any other type) as keys in a map!, for example memoizing functions, implementing immutable/persistent data structures, and so on...


Comments:
--------------------------------------------------------------------------------

On 2017-11-09T09:13:44Z, dockimbel, commented:
<https://github.com/red/red/issues/3084#issuecomment-343093037>

    Aggregates datatypes like series and objects are not hashed in `map!` or `hash!` as the hashing time would in most cases, dwarf the lookup time, making the usage of such data structures useless. If you need an associative structure with blocks or objects as keys, you can simply use a `block!` for that and `select/only/skip ... 2` or `select/only/same/skip ... 2` for lookups.

--------------------------------------------------------------------------------

On 2024-07-24T18:20:09Z, hiiamboris, commented:
<https://github.com/red/red/issues/3084#issuecomment-2248643915>

    I often have a need to use objects or blocks as map keys, but always for the sameness comparison (note that `hash!` hashes these complex values by their cell content).
    
    Unfortunately, in these cases instead of e.g. writing `map/:block: value` I have to write:
    ```
    either pos: find/only/same/tail/skip hash block 2 [
        change/only pos :value
    ][
        append/only append/only hash block :value
    ]
    :value
    ```
    which is a contest winner for the most complicated code doing the most simple thing...
    
    And instead of `remove/key map block`:
    ```
    if pos: find/only/skip/same hash block 2 [
    	unless pos =? end: skip tail hash -2 [change pos end] 
    	clear end
    ]
    ```
    which is also quite cryptic... (tip: it's O(1))
    
    I tried making wrappers as objects with `put`, `find`, `remove` functions defined in them, but the level of indirection through the usage of functions and the overhead of creating an object for every such "map" and the RAM requirement of this extra object severely limits the applicability of this approach.
    
    So I want to second this wish once again, with a note that sameness must be implied for lookups.

