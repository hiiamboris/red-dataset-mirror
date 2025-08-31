
#2595: DOC: various peculiarities of make bitset!
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[type.documentation]
<https://github.com/red/red/issues/2595>

1. `charset` is shorthand for `make bitset!` except it does not cover `make bitset! <binary>`. This does make sense since `charset` suggests we deal with code point numbers, but it is useful to point out.
2. `charset 5` makes a single-byte empty bitset, `charset #"^E"` makes `#{04}`, BUT both `charset [5]` and `charset [#"^E"]` make `#{04}`. In other words, `make bitset! <integer>` is treated as storage reservation, as with all `series!` values, although `bitset!` does not belong to `series!`. It is questionable which kind of (in)consistency is less confusing for the user. In any case, the chosen solution has to be documented...
3. `charset [32 - #"Z"]` is allowed, in other words, integers and code points may be freely mixed in the spec block.


Comments:
--------------------------------------------------------------------------------

On 2017-04-19T19:27:42Z, meijeru, commented:
<https://github.com/red/red/issues/2595#issuecomment-295402676>

    Point 3 is solved by the fixes to #2587

--------------------------------------------------------------------------------

On 2019-09-11T16:45:35Z, dockimbel, commented:
<https://github.com/red/red/issues/2595#issuecomment-530465425>

    Issue moved to [red/docs #194](https://github.com/red/docs/issues/194) via [**ZenHub**](https://www.zenhub.com/)

