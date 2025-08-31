
#1231: set map! map!
================================================================================
Issue is open, was reported by WiseGenius and has 6 comment(s).
[status.reviewed] [type.task.wish]
<https://github.com/red/red/issues/1231>

```
red>> set [a b c] [1 2 3]
== [1 2 3]
red>> c
== 3
```

So far, so good, but:

```
red>> m: #(a: 1 b: 7)
== #(
    a: 1
    b: 7
)
red>> set m #(b: 2 c: 3)
== #(
    b: 2
    c: 3
)
red>> m
== #(
    a: b:
    b: 2
)
```

Expected/proposed result:

```
== #(
    a: 1
    b: 2
    c: 3
)
```

This proposal would mean that the form `set map! map!` would have the same result as `extend map! map!`, but would not “extend” an `object!`.
`set object! map!` (and/or `set object! object!`) could then be useful if one wanted to mass set values in an `object!`, but wanted an error if a non-existent `word!` was used.
`extend` could then be dropped from `map!` to be only used on `object!`s. `extend` wouldn't have to be dropped from `map!`, but if it were, it's `/case` refinement could also be dropped, and there would be no question of what should happen when one uses `extend/case` on an `object!`.



Comments:
--------------------------------------------------------------------------------

On 2015-06-11T03:42:38Z, WiseGenius, commented:
<https://github.com/red/red/issues/1231#issuecomment-110990513>

    Obviously, this implies the same result for the form `set map! block!`:
    
    ```
    red>> m: #(a: 1 b: 7)
    == #(
        a: 1
        b: 7
    )
    red>> set m [b: 2 c: 3]
    == [b: 2 c: 3]
    red>> m
    == #(
        a: 1
        b: 2
        c: 3
    )
    ```
    
    And similarly, for `set object! block!`:
    
    ```
    red>> o: make object! [a: 1 b: 7 c: 13]
    == make object! [
        a: 1
        b: 7
        c: 13
    ]
    red>> set o [b: 2 c: 3]
    == [b: 2 c: 3]
    red>> o
    == make object! [
        a: 1
        b: 2
        c: 3
    ]
    
    ```
    
    And `set object! map!`:
    
    ```
    red>> o: make object! [a: 1 b: 7 c: 13]
    == make object! [
        a: 1
        b: 7
        c: 13
    ]
    red>> set o #(b: 2 c: 3)
    == #(
        b: 2
        c: 3
    )
    red>> o
    == make object! [
        a: 1
        b: 2
        c: 3
    ]
    ```
    
    Etcetera. None of these currently behave this way.

--------------------------------------------------------------------------------

On 2020-08-04T13:20:19Z, 9214, commented:
<https://github.com/red/red/issues/1231#issuecomment-668592666>

    The crux of this wish, as I understand, is to set keys in bulk. There are two existing ways to address it:
    
    1. One is "positional", in a sense that you just provide values aligned with the order of the keys. See `set` as an example.
    ```red
    >> set [a b c][1 2 3]
    == [1 2 3]
    >> reduce [a b c]
    == [1 2 3]
    ```
    2. Another is "named", in a sense that you provide key/value pairings that you want to update. See `extend` as an example:
    ```red
    >> extend #(a: 1 b: 2) #(b: 3)
    == #(
        a: 1
        b: 3
    )
    ```
    
    Note that **(2)** limits itself to an update of existing keys, not addition of new ones.
    
    There are 3 types of values that can act as key/value aggregates: `map!`, `object!`, and `any-block!`. Let's see how the above-mentioned bulk updates can be implemented with them.
    
    #### `map!`
    1. Cannot because the ordering of the keys is not guaranteed.
    2. `extend`, except that it can add new keys.
    
    #### `object!`
    1. `set`.
    2. See the trick below.
    ```red
    >> foo: object [a: 1 b: 2 c: 3]
    == make object! [
        a: 1
        b: 2
        c: 3
    ]
    >> also foo do bind [b: 0 c: -1] foo
    == make object! [
        a: 1
        b: 0
        c: -1
    ]
    ```
    
    Since objects currently cannot be extended with new symbol entries, this avoids the problem of adding new keys.
    
    #### `any-block!`
    1. The expected result is not entirely clear, since `any-block!` are generic containers that one can adapt as key/value storage. `set` on `block!`, for example, will set words inside it, not "keys". The solution might be to convert block to either `object!` or `map!`, update keys, and then convert it back... but then what's the point of using `block!` as key/value storage at all?
    1. Same remark as above.
    
    ---
    
    * What about key deletion?
    * `object! <- block!` -- see above;
    * `object! <- map!` -- convert to `block!`, then see above;
    * `object! <- object!` -- `make` or the trick described above;
    * `map! <- block!` -- `extend`;
    * `map! <- map!` -- `extend`;
    * `map! <- object!` -- convert to `block!`, then `extend`.

--------------------------------------------------------------------------------

On 2020-10-14T00:30:25Z, greggirwin, commented:
<https://github.com/red/red/issues/1231#issuecomment-708082367>

    Good comments @9214. Especially on the effect with blocks containing set-words as values. The ambiguity here may outweigh the shortcut value, and why map support was removed from `set`.
    
    These are old thought experiments, which I'll include here for the "intent" aspect. `Set`, to me, implies something different than `extend/join/merge/combine`
    
    ```
    combine: func [
    	"Merge values, modifying a if possible"
    	a "Modified if series or map"
    	b "Single value or block of values; reduced if `a` is not an object or map"
    ][
    	if all [block? :b  not object? :a  not map? :a] [b: reduce b]
    	case [
    		series? :a [append a :b]
    		map?    :a [extend a :b]
    		object? :a [make a :b]					; extend doesn't work on objects yet
    		'else      [append form :a :b]
    	]
    ]
    join: func [
    	"Concatenate/merge values; a is not modified"
    	a "Coerced to string if not a series, map, or object"
    	b "Single value or block of values; reduced if `a` is not an object or map"
    ][
    	if all [block? :b  not object? :a  not map? :a] [b: reduce b]
    	case [
    		series? :a [a: copy a]
    		map?    :a [a: copy a]
    		object? :a []	; form or mold?
    		'else      [a: form :a]
    	]
    	combine a b
    ]
    ```

