URL: <https://github.com/hiiamboris/red-formatting/discussions/15>
Date created: 2021-08-17T18:56:28Z

# `format-number-with-mask` discussion

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L805-L808

Masks need more design work. Otherwise it's pretty straightforward IMO. I'd give it 7/10 confidence.

## Comments

### hiiamboris commented at 2021-08-17T18:58:03Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L711-L712
`9` is awkward. Propose dropping it in favor of `?`.

### hiiamboris commented at 2021-08-17T19:04:45Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L636-L642
https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L656-L658

A few examples to consider:

| mask | decimal separator | group separator |
|-|-|-|
| `0 0,0` | comma  | space |
| `0,0 0` | comma  | space |
| `0 0.0` | period | space |
| `0.0 0` | period | space |
| `0'0,0` | comma  | apostrophe |
| `0,0'0` | comma  | apostrophe |
| `0'0.0` | period | apostrophe |
| `0.0'0` | period | apostrophe |
| `0.#,#` | period | comma |
| `#.0,#` | ambiguous | ambiguous |
| `#.#,0` | comma | period |
| `0.0,0` | ambiguous | ambiguous |
| `0,0.0` | ambiguous | ambiguous |
| `0,0,0.0` | period | comma |
| `0,0.0,0` | period | comma |
| `0.0,0,0` | period | comma |
| `0` | default | none |
| `0 0` | default | space |
| `0,0` | comma | none |

Proposed heuristics (ordered):

1. We determine start and end points by `#`, `0` and `?`, everything outside is ignored in separator context. At least one `0` is required, otherwise it's an error.
2. If other (than `,.#0?`) symbol is found between these end points - it's a group separator. Then whatever symbol is left (`.` or `,`) will be decimal separator, or if no such symbol we use the default\*. We will need to count both possible decimal separators `,` and `.` then, to ensure only one of them is present and appears 0 or 1 times in the mask (else it's an error).
3. If both `,` and `.` appear in between the end points:
   3.1. One that appears 2 or more times is the group separator, the other one is decimal separator.
   3.2. If both are single, but one is surrounded by `0`, the other isn't, then the one surronded is the decimal separator, the other is group separator.
   3.3. If both are single, but only one has adjacent `0`, we choose it as decimal separator, the other as group separator.
   3.4. If both appear 2 or more times, or `0` vs `#` cannot resolve the ambiguity, it's an error.
3. If only one of `,` or `.` appears in the mask, it has to appear once (else it's an error). It is used as decimal separator, and we do not include group separator.
4. We default\* to a chosen decimal separator, and do not include group separator.

\* - should we use locale default or common default? If masks are fetched from `system/locale`, makes sense to use locale default. If masks are provided by the user explicitly, then we don't know what the user expects, maybe `'` and `.` as with `form`.

Notes:
- the above implies that whole and fraction parts use the same separator (I think it's only sane to assume so)
- group separator to the left of decimal separator affects only whole part, one to the right - only fractional part. So only long masks like `0,000.000,0` will use `,` separator in both parts
- since symbols outside of the region are ignored in separator context, so `.0,0.0,0` is a valid mask (period counted only once), even if not very useful
- zeroes should be grouped and be adjacent to the decimal separator (if it's present); masks like `#0#` or `#0#.#000#` are an error


### hiiamboris commented at 2021-08-17T19:10:41Z:

Should masks support exponent notation at all? `#'##0E+0`? I see they are not currently, but looks like they *can be* supported.

### hiiamboris commented at 2021-08-18T18:02:12Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L814
Why not? Let's round and help the user. Why would we ever want `1.999999999999` to be displayed as `1.99`?

Example:
Given mask `##0.0##,#` we know the limits of precision (fractional part): min 1 digit, max 4 digits. So we round to 4 digits, then clear away trailing zeroes. `1.99999999999` becomes `2.0`

### hiiamboris commented at 2021-08-26T13:35:53Z:

One more thing to consider here is can we format hex/oct/bin numbers using masks? `00.` -> `00h`/`00o`/`00b`? (only integers ofc)

