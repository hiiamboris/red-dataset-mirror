URL: <https://github.com/hiiamboris/red-formatting/discussions/11>
Date created: 2021-08-15T17:01:39Z

# The (missing) basic number formatter

What we really need is a single low-level format function that we can fully control and on top of which *every* other number formatter can be based.

Examples of features we should be able to cover (not out of the box but with minimum wrapping effort):
- https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/dd25b461356f6fcb3c624c6848916794f2b668c1/format-readable.red#L59-64
- https://github.com/hiiamboris/red-formatting/commit/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae#r35975422

Or in other words:
- formatting of a group of numbers using the same precision depending on the value of a selected one
- formatting for minimum visual noise, e.g. `.5` instead of `0.5`, `0.4 MB` instead of `423 kB`, etc.
- extending the number of figures for numbers starting with `1`

What I'm proposing is:
```
function [
	number  [number!]  "to be formatted"
	exp     [integer!] "exponent base to express it in"
	figures [integer!] "nonnegative number of significant figures to keep (whole + fractional)"
	return: [block!]   "[sign whole-part frac-part exp-part]"	;) e.g. 1.230e4 = ["+" "1" "230" "4"]
]
```
To auto infer the `exp` argument we will also need [`exponent-of`](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/dd25b461356f6fcb3c624c6848916794f2b668c1/format-readable.red#L123-128):
```
	set 'exponent-of function [
		"Returns the exponent E of X = m * (10 ** e), 1 <= m < 10"
		x [number!]
	][
		attempt [to 1 round/floor log-10 absolute x]
	]
```
I propose making both funcs public, as user may want to use this basic formatter too, and `exponent-of` is a necessary addition to it, and is easy to make [mistake](https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L287) in

This already gives us all number parts we can compose. Plus rounding, using `figures` argument. Rounding has to be done before we converted number into a string, and has to be tied to the max precision we wish to see in the output.
- when we want max precision, `figures` would be set to 16 for 64-bit float, 19 for 80-bit (when/if we have it)
- when we want specific (maximum) number of digits after the dot, we add the desired number to the result of `exponent-of` and pass it to the formatter

Internally it may be based upon [`float-to-ascii`](https://github.com/red/red/blob/5398bf0765a83a6c16cc715d4866115489fc0108/runtime/dtoa.reds#L751), extend it if needed, planning some fast & advanced algorithm for the future (e.g. [Ryu](https://dl.acm.org/doi/10.1145/3192366.3192369))

Once we have this base we can:
- pad the whole part to a given minimum number of significant figures (with `0` or user-defined char)
- pad the fractional part to a given minimum number of significant figures (with `0` or user-defined char)
- strip trailing zeroes from the fractional part, up to a chosen minimum
- map both parts to a mask or litter with separators of our choice
- insert dot (or comma) as needed
- attach returned sign or replace it with braces

We're missing [`/extend`](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/dd25b461356f6fcb3c624c6848916794f2b668c1/format-readable.red#L137) refinement which makes it possible to add a significant figure *after* it was determined that rounded representation of our number starts with `1`. However, if this formatter is fast, we can just repeat the call in the wrapping function for this case. Even if it's slow, max. overall slowdown is less than 10%.


## Comments


