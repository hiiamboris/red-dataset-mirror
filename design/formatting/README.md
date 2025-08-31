# Red format (WIP)

Old funcs are [here](https://github.com/hiiamboris/red-formatting/tree/stashed) and in [@greggirwin's repo](https://github.com/greggirwin/red-formatting). 

See [Discussions](https://github.com/hiiamboris/red-formatting/discussions) for design talk and [this commit (older)](https://github.com/hiiamboris/red-formatting/commit/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae)


## Play with mask-based number formatting

There's a precompiled binary: [Windows](playground.exe) [Linux](playground)

Goal: catch 'em bugs!

<img src=https://i.gyazo.com/7d2443e3a2fd2d85e1d957f629189d85.gif width=250></img>


## Rounding showcase

Try to figure out a pattern using videos ;)

| ![](https://i.gyazo.com/6bc2885bf1b092df1d1bd353f57b5bbd.gif) | ![](https://i.gyazo.com/6971ba738502af144e60fb025ff3af08.gif) | ![](https://i.gyazo.com/d35b67e31c5cb1bb086d74ffef6b155c.gif) |
|-|-|-|
| mantissa is rounded to the nearest, in this case - nearest specified **significant** digit | here, to nearest **absolute** value (halves round to **even** numbers) | exponent is always rounded **down**, to absolute value in the mask | 

## Number mask format spec

Somewhat based on [ICU's number patterns](https://www.unicode.org/reports/tr35/tr35-numbers.html#Number_Format_Patterns), [Excel format](https://www.ablebits.com/office-addins-blog/2016/07/07/custom-excel-number-format/) and [Gregg's previous work](https://github.com/greggirwin/red-formatting/blob/master/formatting-functions.adoc#111-mask-format) as well as [mask design discussion](https://github.com/hiiamboris/red-formatting/discussions/15).

My quick research hints that ICU patterns are likely the most powerful out there, but only implemented in special packages like ICU4C/ICU4J and a few others. The masks available out of the box in most languages are rather simplistic and limited, giving Red an advantage here. Spreadsheet programs take the 2nd place in flexibility, lacking rounding, significant digit format and engineering notation, but adding fractions.

Goal is not to be 100% compatible with any, but only where it makes most sense. I want masks simple and predictable by their reader and I hope that the presented design is more powerful and simpler than it's predecessors. It has far fewer rules and no special cases.

Incompatibilities with ICU should be resolved by the [script](https://gitlab.com/hiiamboris/icu/-/blob/main/icu.red) that imports it's data into Red. Reason for breaking compatibility is not to inherit complexity of their masks in Red.

### Summary of the mask syntax

There are 4 modes of number formatting:

| Parameter | Criterion | Example | Masks examples | 
|-|-|-|-|
| Decimal vs Exponential mode | Presence of `E` or `x` in the mask | `1234.5` or `1.2345E+3` | `0.0####` vs `0.0####E+0` |
| Significant vs Fractional digits | Presence of `.` in the mask | `12.345` can be formatted as `12.3` either by requiring *3 significant digits* or *1 fractional digit* | `000` vs `0.0` |

This is the most important clue to have in mind.

Same thing said by example:
- `12.345` formatted as `000` results in `12.3` (significant digits, decimal) 
- `12.345` formatted as `000.` results in `012` (fractional digits, decimal) 
- `12.345` formatted as `00E0` results in `1.2E1` (significant digits, exponential) 
- `12.345` formatted as `00.E0` results in `01E1` (fractional digits, exponential) 

All the supported symbols are listed below:

<table style="undefined;table-layout: fixed; width: 1004px">
<colgroup>
<col style="width: 129px">
<col style="width: 175px">
<col style="width: 254px">
<col style="width: 203px">
<col style="width: 243px">
</colgroup>
<thead>
  <tr>
    <th>Scope</th>
    <th align="center">Whole part</th>
    <th align="center">Fraction part</th>
    <th align="center">Exponent part</th>
    <th>Note<br></th>
  </tr>
</thead>
<tbody>
  <tr>
    <td><b>Scope starts with</b></td>
    <td align="center">initial state, always present</td>
    <td align="center">with <code>.</code></td>
    <td align="center">with <code>E</code> or <code>x</code></td>
    <td></td>
  </tr>
  <tr>
    <td><b>Symbol</b></td>
    <td colspan="3" align="center"><b>Meaning</b></td>
    <td></td>
  </tr>
  <tr>
    <td><code>.</code> (period)</td>
    <td colspan="2" align="center">turns on fractional digits mode and starts fraction part of the mask<br></td>
    <td align="center">forbidden</td>
    <td>if absent, significant digits mode is used</td>
  </tr>
  <tr>
    <td><code>$</code>, <code>$$</code>, <code>$$$</code>, <code>$$$$</code></td>
    <td colspan="2" align="center">gets replaced by localized currency symbol; between digits or <code>#</code>s, also starts fraction part of the mask; count of <code>$</code>s affect the width (short, long currency names)</td>
    <td align="center">forbidden</td>
    <td>e.g. <code>0$00</code> may produce <code>12€30</code></td>
  </tr>
  <tr>
    <td><code>E</code> (uppercase)</td>
    <td colspan="2" align="center">starts exponent part of the mask</td>
    <td align="center">N/A</td>
    <td></td>
  </tr>
  <tr>
    <td><code>x</code> (lowercase)</td>
    <td colspan="2" align="center">starts exponent part of the mask</td>
    <td align="center">N/A</td>
    <td>formatted as <code>×10</code> and subsequent digits become superscript</td>
  </tr>
  <tr>
    <td><code>0</code></td>
    <td align="center">digit that is always present, even if it's a leading zero</td>
    <td align="center">digit that is always present, even if it's a trailing zero</td>
    <td align="center">same as whole part</td>
    <td></td>
  </tr>
  <tr>
    <td><code>1</code> - <code>9</code></td>
    <td colspan="3" align="center">same as <code>0</code>, but rounds the number, e.g. <code>01.2E3</code> rounds exponent to a multiple of 3 (engineering notation), then rounds mantissa to a multiple of <code>1.2</code></td>
    <td>default rounding is to last figure, e.g. <code>0.00</code> and <code>0.01</code> are equivalent</td>
  </tr>
  <tr>
    <td><code>#</code></td>
    <td align="center">used for grouping only (together with space); has to precede digits (if any)</td>
    <td align="center">digit that is removed if it and all <code>#</code>s after are zero; has to come after <code>0</code>s (if any)</td>
    <td rowspan="2" align="center">same as whole part</td>
    <td></td>
  </tr>
  <tr>
    <td><code> </code> (space)</td>
    <td align="center">sets grouping size, e.g. <code># ##0</code> groups digits by 3</td>
    <td align="center">gets replaced by group separator, e.g. <code>0.0# ## ##</code> groups up to 6 fraction digits in pairs</td>
    <td>has to be between <code>#</code>s or digits to take effect</td>
  </tr>
  <tr>
    <td><code>+</code></td>
    <td colspan="2" align="center">always present sign symbol</td>
    <td rowspan="2" align="center">same as for the mantissa, but only applies if comes after <code>E</code> or <code>x</code></td>
    <td>e.g. <code>+0.0++E0+++</code> may format <code>-123</code> as <code>-1.2--E2+++</code></td>
  </tr>
  <tr>
    <td><code>-</code></td>
    <td colspan="2" align="center">sign symbol that is omitted if number is nonnegative</td>
    <td align="center">automatically added before the first digit or <code>#</code> if neither of the sign marks is specified</td>
  </tr>
  <tr>
    <td><code>(</code> and <code>)</code></td>
    <td colspan="2" align="center">accounting sign denotation that is omitted if number is nonnegative</td>
    <td align="center">never part of the exponent</td>
    <td>e.g. <code>($0.00)</code> may produce <code>$15.00</code> or <code>($15.00)</code><br></td>
  </tr>
  <tr>
    <td><code>%</code></td>
    <td colspan="3" align="center">multiplies mantissa by 100; gets replaced by localized percent sign</td>
    <td></td>
  </tr>
  <tr>
    <td><code>%o</code></td>
    <td colspan="3" align="center">multiplies mantissa by 1000; gets replaced by localized permille sign</td>
    <td></td>
  </tr>
  <tr>
    <td><code>'</code> (apostrophe)</td>
    <td colspan="3" align="center">quoting char used to insert literal text; double to produce apostrophe itself<br></td>
    <td>e.g. <code>'#'000</code>, <code>0 o''clock</code><br></td>
  </tr>
  <tr>
    <td><code>?</code></td>
    <td colspan="3" align="center">reserved for padding variant of <code>#</code>, if we decide to support it</td>
    <td></td>
  </tr>
  <tr>
    <td><code>*</code> (asterisk)</td>
    <td colspan="3" align="center">reserved for padding, if we decide to support it</td>
    <td></td>
  </tr>
</tbody>
</table>

### Examples & comparison

| ICU mask | Excel mask | Red mask |  `12345` formatted | `12.345` formatted | `0.012345` formatted | `-12.345` formatted |
|-|-|-|-|-|-|-|
| `0`             | not allowed   |  not allowed | `5`         | `2`       | `0`        | `2`? |
| `#`             | `0.######`    |  `0.######`  | `12345`     | `12.345`  | `0.012345` | `-12.345` |
| not allowed?    | `0`           |  `0.`        | `12345`     | `12`      | `0`        | `-12` |
| `#.`       | `0.` | needs literal dot: `0.'.'` | `12345.`    | `12.`     | `0.`       | `-12.` |
| `#.##`          | `0.##`        |  not allowed | `12345.`    | `12.35`   | `0.01`     | `-12.35` |
| not allowed?    | not allowed   |  `0.##`      | `12345`     | `12.35`   | `0.01`     | `-12.35` |
| `0.0#`          | `0.0#`        |  `0.0#`      | `12345.0`   | `12.35`   | `0.01`     | `-12.35` |
| `#.0#`          | `#.0#`        |  `#.0#`      | `12345.0`   | `12.35`   | `.01`      | `-12.35` |
| `#,#0`          | not allowed   |  `# #0.`     | `1'23'45`   | `12`      | `0`        | `-12` |
| `#,##0`         | `#,##0`       |  `# ##0.`    | `12'345`    | `12`      | `0`        | `-12` |
| `#,##`          | not allowed   |`# #0.######` | `1'23'45`   | `12.345`  | `0.012345` | `-12.345` |
| `0.0#,#`        | not allowed   |  `0.0# #`    | `12345.0`   | `12.34'5` | `0.01'2`   | `-12.34'5` |
| `@@`            | not allowed   |  `00`        | `12000`     | `12`      | `0.012`    | `-12` |
| `0E0`           | `0E0`         |  `0E0`       | `1E4`       | `1E1`     | `1E-2`     | `-1E1` |
| `##0.#E0`       | not allowed   |  `0.#E3`     | `12.3E3`    | `12.3E0`  | `12.3E-3`  | `-12.3E0` |
| `@@@E0`         | not allowed   |  `000E3`     | `12.3E3`    | `12.3E0`  | `12.3E-3`  | `-12.3E0` |
| `@@5E0`         | not allowed   |  `005E3`     | `12.5E3`    | `12.5E0`  | `12.5E-3`  | `-12.5E0` |
| not allowed?    | not allowed   |  `0x0`       | `12×10³`    | `12×10⁰`  | `12×10⁻³`  | `-12×10⁰` |
| `#0¤00`         | not allowed   |  `0$00`      | `12345€00`  | `12€34`   | `0€01`     | `-12€34` |
| `#,##0¤00`      | not allowed   |  `# ##0$00`  | `12'345€00` | `12€34`   | `0€01`     | `-12€34` |
| `@,@@`          | not allowed   |  `0 00`      | `1'23'00`   | `12.3`    | `0.01'23`  | `-12.3` |
| `#,@@`          | not allowed   |  `# 00`      | `1'20'00`   | `12`      | `0.01'2`   | `-12` |
| `#,#@@`         | not allowed   |  `# #00`     | `12'000`    | `12`      | `0.012`    | `-12` |
| `#0.00;(#0.00)` | `0.00;(0.00)` |  `(0.00)`    | `12345`     | `12.34`   | `0.01`     | `(12.34)` |


TODO: write a GUI converter between all three mask formats, also feed all masks from ICU into it for testing.

### Become a grouping expert

Example: `#### ## #00 0.# ## ###` has 7 groups:
- 2nd group `##` is the *primary group*: it is used when number is bigger than the mask\
  Usually defining two groups is enough, e.g. `# ##0` will add separators after each 3 digits\
  If absence of 2nd group of whole digits (e.g. `##0` mask) no separators are inserted between whole digits at all
- 1st group `####` *gets grown* up to the primary group if it's shorter\
  This allows us to write `# ##0` instead of `### ##0`\
  But if it's longer, then it's used as is, not shortened
- Groups after the 2nd are used as they appear (including groups in fractional part)

If we format number 1e12 using this mask we get `1 00 0000 00 000 0`\
If we format number 1e-12 using this mask we get `00 0`\
If we format number 12345e-7 using this mask we get `00 0.0 01 234` 

In significant digit mode grouping of fractional digits mirrors that of whole digits, so:
- `12345678` formatted as `000 0 00` results in `1 2 345 6 00` 
- `0.0012345678` formatted as `000 0 00` results in `0.00 1 234 5 7` (last digit rounded) 

---

<details>
<summary> Major deviations of this design from ICU (or how I imagine it anyway) </summary>

<br>

- ASCII mask symbols only (for ease of writing)
- Space ([internationally recommended thousands separator](https://en.wikipedia.org/wiki/Decimal_separator)) instead of comma (used in ICU and Excel) as group separator (for better readability, esp. for low sighted)\
  Note: it only affects masks spelling. Resulting separator is defined by locale data, which allows masks to stay as culturally neutral as possible (no hardcoded currency symbol, no hardcoded separators, no hardcoded digits, etc.)
- Whole digit truncation is disabled: mask `0` formats `123` as `123`, not as `3` (rarely needed use case, likely to induce bugs)
- Period `.` is required for fixed-precision masks, e.g. `#0.`, not `#0` (allows to get rid of complexity of `@` symbol and simplifies engineering notation significantly)
- Period `.` is not output if no digits follow it,e.g. `0.` mask formats `11` as `11` not `11.` (unlikely ever needed use case, absence of which allows to simplify the design)
- No infinite precision output (e.g. `#` and `#E0` in ICU). If we want max precision, why are we even calling `format`? I find it awkward that in ICU `#` is infinite precision, `#.` is any number without fraction but with a dot (which cannot be removed?), and `0` is a single digit only. This is messy. In the case we later need this, we can just define a 16-digit mask and assign a name to it.

</details>

<details>
<summary> Design notes </summary>

<br>

- While exponent case `E`/`e` can be resolved by the substitution character solely, `x` (formatted as `×`) affects subsequent chars, making them superscript, so it has to become a separate mask char.
- `?` char (used for alignment) is not supported, because this hack only works for monospaced fonts. When using variable-width fonts, Excel kerns each digit separately in this mode to make digits and spaces equally wide, but fails on many fonts. It simply doesn't make sense to complicate masks if workaround still has to be implemented in GUI widgets. Proper way to align digits would be to create a sort of `number-field` widget based on `field` that would position each char individually and aligned under the dot. Gregg though thinks `?` is still useful for `.txt` report files printed in monospace fonts and that those are still relevant. We agreed to wait until someone *actually* requests that for a real world task. 
- ICU recommends: *"Programmers are used to the fallback exponent style `1.23E4`, but that should not be shown to end-users [...] to show a format like `1.23 × 10⁴`"*, but I don't see any support for that in their docs.
- Multiple semicolon-delimited patterns (pos/neg in ICU, pos/neg/zero/text in spreadsheets) are not supported, because we have smart `()` for accounting.
- Unicode variants of the ASCII sigils might be supported too: `¤` for `$`, `‰` for `%o`, `×` for `x`. Former two symbols are not even in the font I'm using in the editor, permille doesn't appear even in my browser font, so I imagine they are not going to have a lot of fans. 
 
</details> 
 
 