URL: <https://github.com/hiiamboris/red-formatting/discussions/13>
Date created: 2021-08-17T12:16:13Z

# `format-bytes` discussion

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L539-L546


## Comments

### hiiamboris commented at 2021-08-17T13:23:17Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L543
https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L545

I understand `/SI` is for automatic choice of unit. But `/as` should support SI units as well. It seems that implementation expects `/SI/as .. 'kB` (docstrings don't reflect this currently), but why not just `/as .. 'kB`?

Also `/as none` should be supported (like `load/as .. none`) for dispatching into this function from the others. `none` should work as absence of `/as`.

### hiiamboris commented at 2021-08-17T13:25:56Z:

Unit names should come from `system/locale`, see #14 
So should be the default separator `/sep` when not specified.

### hiiamboris commented at 2021-08-17T13:36:15Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L569

An unlikely case, but for completeness: why can't we just display what we have? `3000 YiB` is fine by me, even `30000000 YiB`, and I don't see why we should prefer an error.

### hiiamboris commented at 2021-08-17T13:45:56Z:

I propose this function wraps #11 (*after* it has done division by unit). For robustness at least.
In /SI mode it's even similar to engineering notation, just E+3x becomes the unit name.

### hiiamboris commented at 2021-08-17T13:46:59Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L542
`/to` is not a solution here (though maybe it can be left as an option).

To cover https://github.com/hiiamboris/red-formatting/commit/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae#r35975422 use case we will have to combine:
- total number of significant figures
- extension by one figure for `1x` numbers
- exponent inference (as a multiple of 3) based on value

But since there's no single right answer to the last problem (`420 kB` or `0.42 MB` etc.), it should accept an exponent function. Necessary refinements then: `/exp /total /extend`.

### hiiamboris commented at 2021-08-17T17:19:08Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L557-L559
I think error is good here. Except instead of `return` we should use `do`.

### hiiamboris commented at 2021-08-17T17:36:57Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L543-L545
Should it be `bytes` or `B` (for consistency with other units)?
Or let it be `bytes` by default in automatic mode, and allow `'B` as custom unit?


### hiiamboris commented at 2022-02-22T14:02:42Z:

So, what's the status of `quantity!`? Should we wait for it, to have a general quantity formatter?

