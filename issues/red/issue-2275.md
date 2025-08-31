
#2275: Add conversion between different types of words
================================================================================
Issue is closed, was reported by maximvl and has 2 comment(s).
[status.built] [type.wish]
<https://github.com/red/red/issues/2275>

So, right now `to` doesn't support `word!` as an argument:

```
red>> to string! 'a
*** Script Error: to does not allow word! for its type argument
*** Where: to
```

It should be able to convert `word!` at least to `set-word!`, `get-word!`, `lit-word!` and `string!`
Strings conversion also doesn't work for `get-word!`:

```
red>> to get-word! "a"
*** Script Error: TO cannot convert get-word! from: a
*** Where: to
```



Comments:
--------------------------------------------------------------------------------

On 2016-11-16T01:33:57Z, qtxie, commented:
<https://github.com/red/red/issues/2275#issuecomment-260826771>

    It has been implemented now.

