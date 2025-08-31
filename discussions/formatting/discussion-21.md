URL: <https://github.com/hiiamboris/red-formatting/discussions/21>
Date created: 2021-08-26T18:15:52Z

# `format` (the entry point) discussion

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L1243-L1245

Possible names also: `form/with`, `form/at` ☺ (see [Gabriele's notes](https://docs.google.com/document/d/11AfflcOXUJ_cHvqaaUjwOAyZ7F-zF3m_9g6R_bXg5jI/edit#heading=h.oxobx4ogoks))

About 5/10 confidence for now. Two-argument interface I agree with, but what to accept and how to handle it is a biiig question.

## Comments

### hiiamboris commented at 2021-08-26T18:17:24Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L1244

In the light of #20 I propose restricting `value` to scalars for now, disabling interpolation. Maybe let's also allow string value with word/block format (to be dispatched into `format-string`). 

### hiiamboris commented at 2021-08-26T18:18:34Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L1245

What do these mean? `block! function! object! map!`

### hiiamboris commented at 2021-08-26T18:20:46Z:

There is this function that is never used:
https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L1207-L1210
Was it just a failed experiment or there is a point in it?

### greggirwin commented at 2021-08-26T20:44:47Z:

> https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L1243-L1245
> 
> Possible names also: `form/with`, `form/at` ☺ (see [Gabriele's notes](https://docs.google.com/document/d/11AfflcOXUJ_cHvqaaUjwOAyZ7F-zF3m_9g6R_bXg5jI/edit#heading=h.oxobx4ogoks))
> 
> About 5/10 confidence for now. Two-argument interface I agree with, but what to accept and how to handle it is a biiig question.

Agreed that the interface is the big one. I stand by my comment to Gabriele that we still need this functionality as a separate entity, and we can add dispatching from `form` later if desired.

### greggirwin commented at 2021-09-22T21:22:33Z:

```
set 'format function [
	value [number! date! time! logic!]		; 1*
	fmt   [word! string! block!] "Named or custom format"	; 2*
]
```

1) We can add `logic!` on pass 2, but while https://github.com/hiiamboris/red-formatting/discussions/12 notes L10N, is that critical here? We can add it later, and because of the interface, people can easily provide their own values in the meantime. We want L10N, but there may also be an English bias many places in Red.

2) If we include `logic!`, we need `word!` support for the format, and should also update `mold-logic`3* to take that as a param, rather than using refinements. We can leave out the short/med/long named formats for dates, but I think named standards formats 4*, e.g. ISO8601, are important to include. Block needed for logic options as well.

3) If we have both `form-logic` and `mold-logic`, how do we select the `mold` version? And if we want to support `mold/all` as well, that's another branch. This being `format`, it may be best to leave `mold-logic` out, providing it as a standalone function.

4) This again raises the question of how to add named formats. If they are just in code, but if we put them in a `system/catalog` map, refactoring the func as a comment notes, it's just a mapping of name to mask.


### hiiamboris commented at 2021-10-01T22:20:39Z:

One use case to keep in mind is formatting vectors of numbers into blocks of strings, using the same given numeric format. Most likely also blocks of numbers, e.g. `format [1 2 3] 'r-general` instead of `reduce [format 1 'r-general format 2 'r-general format 3 'r-general]`. 

I think we only need it for high-level `format` call. Other `format-number-...` functions do not have to support this case, but *may* if it provides significant performance boost.

