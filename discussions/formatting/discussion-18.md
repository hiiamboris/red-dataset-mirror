URL: <https://github.com/hiiamboris/red-formatting/discussions/18>
Date created: 2021-08-21T11:55:28Z

# `format-number-with-style` discussion

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L948-L951


## Comments

### hiiamboris commented at 2021-08-21T11:56:30Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L953
This should be fetched from locale data.

### hiiamboris commented at 2021-08-21T12:02:49Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L950
https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L960-L963
It's not in the name (`format-number`), but I think this function should also accept `money!`. Looks like you've already considered that, just commented out. Because most likely `currency` format will be used with `money!` datatype and we wanna use internal lossless `form` for it.

I think, since money datatype is more limited than float, we may instead of `to money!` conversion want to use `form` for `money!` type, and `format-number-with-mask` for float type.

`accounting` format also should support `money!` btw.

And what do we do if given `money!` and format not supported by it, like `sci`? Do we throw an error or convert money to float?

### hiiamboris commented at 2021-08-21T12:19:05Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L967
https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L985
https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L990
```
>> format-number-with-style 1234 'hex
== "000004D2"
>> format-number-with-style 1234 'C-hex
== "0x000004D2"
>> format-number-with-style 1234 'r-hex
== #000004D2
```
Returning an issue is a bit unexpected, don't you think? I bet someone will trip over this.
More useful to me seems to have both tight hex format and space-delimited ones, like:
- `hex-2`: `"01 23 45 67 89"` (bytes)
- `hex-4`: `"0001 2345 6789"` (words)
- `hex-8`: `"00000001 23456789"` (dwords)
(maybe also prefixed with `00` and `0000` up to the input bit size)

Another thought: add `format-binary` function that will also support splitting by new-lines, e.g.:
```
1234 5678 90AB CDEF
0000 0000 0000 0000
```
And `format-number-with-style` would then wrap it (without new lines for numbers).

### hiiamboris commented at 2021-08-21T12:54:14Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L951
What's a direct style? How is object/map supposed to work?

### hiiamboris commented at 2021-08-21T17:34:40Z:

[Previous discussion](https://github.com/hiiamboris/red-formatting/commit/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae#r35975231)

What's the plan for `"$##0.00"` masks? Will `$` be replaced with locale-specific currency symbol, and also move to the side (before/after the number) specified in locale settings? In that case it's another place where we should be able to easily switch locale to enUS (by refinement or what).


### hiiamboris commented at 2021-08-21T17:36:38Z:

```
>> format-number-with-style 1234 'percent
== "1,234.0"
>> format-number-with-style 1234% 'percent
== "12.34"
```
Whatever this was supposed to do...

