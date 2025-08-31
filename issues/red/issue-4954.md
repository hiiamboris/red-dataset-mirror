
#4954: Queries re: A short introduction to Red for Python programmers
================================================================================
Issue is closed, was reported by mark-summerfield and has 2 comment(s).
<https://github.com/red/red/issues/4954>

I've started reading [A-short-introduction-to-Red-for-Python-programmers](https://github.com/red/red/wiki/A-short-introduction-to-Red-for-Python-programmers) and have some initial comments on the `Datatypes` section:

- For `char!` it isn't clear if `#"^(41)"` is decimal or hexadecimal. It would be useful to put in a clearer example e.g., U+20AC (euro) since that would make it obvious which it is, and that Red can cope with non-ASCII Unicode chars (assuming it can).
- For `string!` the first example seems to use curly quotes rather than straight quotes, but the others use straight quotes. Does Red accept either? If not, just the valid kind should be shown.
- Also in `string!` it isn't clear if `{}` are _only_ for multi-line strings or could be used for even short strings, say, `{a small "string"}`?
- Regarding `block!` and `paren!`: if `[]` is equivalent to `'()` it is worth mentioning.
- Also, in `paren!` the term `quote` is used but not defined or given an example. I have guessed it means single-quote, i.e., `'`, but it would be nice to be told.
- Regarding `map!` and `object!` both seem to hold key-value pairs, so some explanation of the differences would help.
- The `function!` example is unclear because the meaning of the term 'specification' seems to be Red-specific but isn't explained.
- I don't understand the `bitset!` examples at all.

This is clearly a useful guide, but more examples and more explanations would help.


Comments:
--------------------------------------------------------------------------------

On 2021-09-03T22:55:52Z, greggirwin, commented:
<https://github.com/red/red/issues/4954#issuecomment-912852559>

    Thanks for the feedback! I'll let @galenivanov chime in where I don't address something.
    
    1) Agreed. Having hex codes as examples, or high code points is a good idea.
    2,3) `"..."` is for single line strings only `{...}` can be used for either. Good to note the distinction.
    4) There is no `'()` syntax, but, yes, blocks are not evaluated by default, while parens are. Otherwise, they are both block types and may contain any value.
    5) `quote` is a function to prevent evlauation of an argument or value. Use `help quote` in the console.
    6) Yes. We could point to https://github.com/red/red/wiki/%5BDOC%5D-Comparison-of-aggregate-values-(block!-vector!-object!-hash!-map!)
    7) I'll let Galen address this.
    8) Good to note!

