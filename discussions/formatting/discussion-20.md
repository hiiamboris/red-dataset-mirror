URL: <https://github.com/hiiamboris/red-formatting/discussions/20>
Date created: 2021-08-26T13:02:24Z

# On interpolation and formatting (high-level view)


It's tempting to unify `composite` and `format-*` (and `short-form` can be seen as a step in that direction). Besides, both `composite` and `short-form` having string input initially, they share the same binding problem, only solved using macro approach.

# However let's take a step back and overview the idea and it's parts

### 1. Strings with masks: numeric precision control, date format.

   Useful for logs, error messages or dialog boxes, output of CLI scripts, etc - when we want to specify how each value looks like (money, numbers, dates mostly). Spreadsheets and web API use case is more limited: we don't usually want full messages with masks there, but want just values being formatted.

   May also be useful for locale-aware GUI generation. Think interactive forms, exams, formulae with free values. Imagine a truly rich text (mix of text and widgets). Mask can be substituted with edit boxes of defined format, that would format data taken from some `word!` and update the word when user edits the text. Near each mask we'll have a flag if it's editable or not, box width, and text styles (font size, weight, color), i.e. metainfo that's not part of the mask format per se. Why I say "locale-aware" is because such edit boxes are not fixed but may float around with the text, depending on where translator puts them. That is, `some text runs and [here]'s and edit field, [here] another one` - forms with in-paragraph input widgets.

### 2. Alignment (using spaces): generation of ASCII reports, space-delimited CSV, debug output in console.

   I consider it a very low priority. It's mostly how we (devs) are used to do the simplest thing. If I understand the global trend at all, this is not relevant anymore for reports, as people would rather use Word + Red plugin to achieve most polished reports possible. For CSV, we have a codec. For developers, we can create better tools than ASCII dumps anyway.

   To some extent we can leverage this in CLI tools, but I think this use case is in decline as well.

   This affects the `<` and `>` alignment markers, as well as `?`/`9` mask symbol, and the general tendency of masks to keep spaces at head/tail. We may not want that for most needs.

### 3. Localization of output.

   See #14. Required for end users, but not for developers. So localization and alignment are mutually exclusive needs.

   We want to specify locale per single message rather than per single value in the majority of cases (the only exception comes to mind is some format translator script that would produce strings consisting of multiple locales formats at once). And default to OS-set locale when per-message override is absent.

---
# What do we clearly need per-value

### For numbers:

- **Real numbers:**
  
  Simplest: *total* digits and a hint for *exponent* choice (which includes exponent-less range), **OR** *fractional* digits count (and fixed exponent if not zero). Locale changes delimiters and their placement only.

  More control: masks (delimiters, precision) - but those likely come from locale settings.

- **Integers:**

  Most of the time it's just integer, without decor.

  Next simplest case: count of *whole* digits to produce smth like `0001`: hours/minutes, catalog numbers (hex/binary dumps not relevant here). But for integers it's the same as the *total* digits count.

  More involved case: a mask with delimiters (phone numbers, catalog numbers, bank card numbers... though 32-bit integers are small for most of this).

  All locale-agnostic?

- **Integers as ordinals:** to be decided yet (language-specific).

### For money:

- Currency format and precision are taken from locale settings. Sign preference (e.g. braces) will be per-message. Is there anything we want to control on per-value basis? Unlikely.

### For dates:

- Full pattern. Even if taken from locale settings, there are multiple ways to format it: shorter, longer. So we need universal names for these formats that will be found in all locales.

### For other values:

- Nothing? Possibly per-value capitalization, but it's a rare case.


---
# Rationale for unification

Out of the box we have smth like this:
```
#composite {This is (format value1 "fmt1") and (format value2 "fmt2")}
```
Or if we use backticks for composite form:
```
`{This is (format value1 "fmt1") and (format value2 "fmt2")}`
```
We can assign `F>: :format` and shorten that as:
```
`{This is (F> value1 "fmt1") and (F> value2 "fmt2")}`
```
Or we can make an operator `~: make op! :format`:
```
`{This is (value1 ~"fmt1") and (value2 ~"fmt2")}`
```
This is as far as we can get with simple means. And it's quite good, though still requires double quotes and uses tilde.

Now, since `#composite` is a macro, we can totally get rid of `F>`/`~`, but we still have to replace it with *something* to let it know that `"fmt1"` is not just a value, but a formatting style that should be applied.

What is `"fmt"`? Considering all of the above, it's masks (strings) and mask names (words). We may make a special syntax for total+exponent, or for count of fractional digits, but there doesn't seem to be any value in it.

So, can we bring any more value by unifying interpolation and formatting into a single entity?

---

# Available lands to conquer

1. get rid of double quotes: `(value1 ~"fmt1")` -> `(value1 ~fmt1)`
2. free tilde (or another) symbol globally, only give it special meaning inside `#composite` string
3. simplify paths like `obj/value1` -> `/value1` (like does `short-form` and `sift/locate`)
4. incrementally fetch values (given a block) e.g. `blk/1` `blk/2`: `{This is (~fmt1) and (~fmt2)}`

## Strategy 1: conquer only 1-2

We can leverage other string types, e.g. `ref!`:\
    `{This is (value1 @fmt1) and (value2 @fmt2)}` - works only if our masks have no spaces, else we can use `tag!`\
Though now we can't distinguish between a mask and it's name. So either we leave tilde:\
    `{Mask format (somedate ~ @dd-mm-yy) vs named format (somedate ~ RFC1234)}`\
Or we use `issue!` for named formats:\
    `{Mask format (somedate @dd-mm-yy) vs named format (somedate #RFC1234)}`

Such `#format` macro will be backward compatible with `#composite` design, and we can still use it with backtick syntax:\
    `#format "Hello, (persona/name). Today is (n: now @dd/mm) of (n @yyyy)"`\
    `` `"Hello, (persona/name). Today is (n: now @dd/mm) of (n @yyyy)"` ``\
where both expand into:
    `rejoin ["Hello, " (persona/name) ". Today is " (format (n: now) "dd/mm") " of " (format n "yyyy")]`

The beauty of this option is in how it's composed of two features - composite macro and format function for individual values. `#format` macro can be built on top of `#composite` and just post-process it's result, or it can fully replace it.

## Strategy 2: conquer all 1-4 with a macro

3-4 require also the source of data: object, map, block. Tough question: how to specify it? Macro only knows about the string, not about any value outside of it. Besides, most likely that value will be provided at runtime and not known in advance.

One solution is to generate paths with some invalid placeholder, e.g. `/1` -> `as path! [#value 1]`, then let `format` function replace it when evaluated (with it's local word referring to the value).

What we get is a different macro that expands a string (short format) into a block format, but doesn't produce a `rejoin` call anymore:\
    ``format value `"/x is: (/x @0.00)"` ``\
    ``format [1 10 11] `"(@0.00) + (@0.00) = (@0.00)"` ``\
expands roughly as:\
    `format value ["/x is: " (#value/x as "0.00")]`\
    `format [1 10 11] ["" (#value/1 as "0.00") " + " (#value/2 as "0.00") " = " (#value/3 as "0.00")]` ``

Pros: shorter format expression, e.g. compare:
    ``format [1 10 11] `"(@0.00) + (@0.00) = (@0.00)"` `` (with 3-4)\
    ``b: [1 10 11] `"(b/1 @0.00) + (b/2 @0.00) = (b/3 @0.00)"` `` (with only 1-2)

Cons: we have now to always prefix the string with `format value` or with `rejoin`:
    ``rejoin `"(x) + (y) = (x + y)"` `` (with 3-4)\
    ``format x "X is (x @0.00)"` `` (with 3-4)\
    `` `"(x) + (y) = (x + y)"` `` (with only 1-2)\
    `` `"X is (x @0.00)"` `` (with only 1-2)\
(this extra verbosity should be considered with added `print` or `do make error!`...)

Also if we allow 3-4, we introduce a drawback that cannot be mitigated: `format` will have to do a deep copy (and parsing) of the block (produced by the macro) on every evaluation. Though copy cost will only be paid when such simplified path notation is used, so can be avoided when necessary.

Another drawback is we reserve the meaning of refinements and cannot use them inside composited expressions as is. But that is no big deal IMO.

So do we win by conquering lands 3-4? I'm not sold. Would love to see a solution that is not a tradeoff. We can probably have a variant of backtick form, for `format` only, e.g. ``format x # `"X is (@0.00)"` ``. Then the original still retains it's `rejoin` prefix. But we're just getting more and more special cases this way.

## Strategy 3: use a function instead of a macro

Compared to the above solution, differences are:
- `#composite` macro remains unchanged and retains it's backtick form
- subpaths like `/1`, `/value` are expanded by the function code (slower but still correct)
- plain words (to get a value or call a function) should be forbidden inside format-expression, as this leads users into a binding trap (format should not be meant exclusively for advanced coders)


---

# Summing it up

Previous thoughts: [short-form](https://github.com/hiiamboris/red-formatting/commit/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae#r35988190) and also [this comment](https://github.com/hiiamboris/red-formatting/commit/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae#r35975998) and a few above it; [block-form](https://github.com/hiiamboris/red-formatting/commit/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae#r35976086)

`short-form` is a good *first iteration* IMO. But of limited readability and extensibility, and inspired by `printf` which was adequate for it's years, not anymore. Besides requires one to memorize it's rules (I never could combine [all `printf` rules](https://www.cplusplus.com/reference/cstdio/printf/) in my head beyond simple ones).

I'm ignoring *padding/alignment* for reasons explained earlier. It can always be done manually for those few use cases that still need it with `pad`, or mask syntax can be extended to account for alignment later down the road.

*Ordinal* number case can also be done using `as-ordinal`. Besides, it's very tricky to get right in many languages, so masks as is do not work for it.

`format` should accept a *locale-override* refinement. E.g. `/locale [word! none!]`: word can be `'enUS` or other, none will act like no /locale override is specified (OS-default one used).

Problem of binding (see "Why do we even need binding info?" section in [composite doc](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/composite.md)) *prevents us* from using `format` *function* for string interpolation and limits it to formatting of individual values. Only macro approach solves the issue.

[Block format expressions](https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L1069) *should not* be used to insert values into the string, but only as intermediate computation results, because blocks will complicate localization of Red programs (see [L10N note in composite docs](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/composite.md#localization)) and are not always readable.

**I thus propose delaying both short and block forms until an elegant solution is found to the above problems. Let's implement format for scalars only and sleep on this for some time. And ask the community.**

## Comments

### greggirwin commented at 2021-08-26T22:12:44Z:

Just skimmed, and this is a great analysis. So many things pull on each other. 

> Spreadsheets and web API don't really count here, as these are formatting single value most of the time.

Coming back to the idea of stylesheets, spreadsheets have hierarchical rules (cell, row/col, sheet), which is handled at a higher level. e.g. the spreadsheet is still dealing with single values at a time, but a different format may apply for each value in a column (likely almost all the same, but with a few exceptions for sub-totals and such. The real kicker here, which points to your note on padding being largely a legacy issue and locale issues, is that UI formatting and data formatting can a) be ignorant of each other, b) fight each other or, c) work together. I have no idea yet _how_ they would work together. :^) This also plays into tooling vs raw data. Data is so voluminous today that we often can't make sense of it without tooling. What we can make sense of is summary data, but even then raw data is most helpful in-the-small.

> We want to specify locale per single message rather than per single value in the majority of cases

Also a key insight. 

I will sleep on this, read again, and comment more soon.

Thanks!

### hiiamboris commented at 2022-02-17T21:54:27Z:

(Outside readers may want to get acquainted with general [`composite` design docs first](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/composite.md))

I've been playing more with various possible short syntaxes for interpolation.
Made a [quick utility](https://github.com/hiiamboris/red-formatting/blob/master/sticky-test.red) to help me experiment.
Some results below, but first off some thoughts.
1. We have 9 lexical forms for strings: `"abc" {abc} %..%{abc}%..% %abc %"abc" ab://c ab@c @abc <abc>`
2. 5 forms: `"abc" {abc} %"abc" ab://c <abc>` can benefit from composition:
   ```
	"(now as {hhh:mi:ss}): (value) is invalid in (mold spec)"
	{(now as "hhh:mi:ss"): (value) is invalid in (mold spec)}
	%"(drive):\(path)\file-(idx as "000.").(ext)"
	http://(site)/(resource)?param=(date as "yyyy")
	<img src=(url) width=(width as "0")>
   ```
   - rawstrings are usually huge, so full `#composite` prefix is preferable
   - emails.. haven't seen them ever used, not to mention composed
   - refs are likely always literal
   - file format without quotes does not support parens, and there's no point in changing that because we have quoted format
   - url doesn't support parens too, but why can't we allow it? besides, brackets are already planned for ipv6
3. Only 2 forms `{abc} "abc"` are essential, as other can be obtain by coercion e.g. `as file! ..`
   - coercion is acceptable because eventually this form becomes a rejoin-expression, so it has to be evaluated anyway
   - on the other hand, would be nice not to resort to coercion, for brevity and less noisy code
4. I'm playing with currently implemented lexical rules here, but minor changes in the lexer should be considered if this opens us a new, more readable, interpolation syntax. In my today's view, string interpolation is the crucial element of formatting, probably more important than all the other formatting functions taken together. Especially error messages, other printed messages and UI strings.

Having string type at the core is important otherwise text we put into the string is limited by valid Red types. So I see basically two options here:
- markers around (or only before) the string of given type: this allows us to preserve the type without coercion, e.g. `` `%"(x) + (y) = (z)"` `` or `#C %"(x) + (y) = (z)"`
- markers within the tag allow for a reasonably short syntax too (and it is currently lexed pretty good). Example: `<"(x) + (y) = (z)">`

---

<details>
<summary>
<b>Now how it looks like and works (note that some options e.g. <code>&lt;&lt;text&gt;&gt;</code> lex as multiple tokens <code>&lt;&lt;text&gt;&nbsp;&gt;</code> currently, but this is not an obstacle as long as all parens are being put into a string):</b>
</summary>

---
The only currently fully lexable form (tag option):
<img src=https://i.gyazo.com/e44f7ed8a11fc2ea28b04bbf8b56199d.png width=400></img>
however, url is a valid tag here, so cannot be used for composition

A more decorated variant could support all 5 types:
<img src=https://i.gyazo.com/1b9f1b88d0399c699ebb78d40d84baa9.png width=400></img>

---
Prefix-only variants:
<img src=https://i.gyazo.com/d162a57406e852a26a117b7ff0058645.png width=400></img>
---
<img src=https://i.gyazo.com/f1e25127a36420da474afcb87867e942.png width=400></img>
---
<img src=https://i.gyazo.com/4f72d267279be7256de7dc0c215db1ed.png width=400></img>
---
Surrounding markers:
<img src=https://i.gyazo.com/cdfec377dcbbcb0daf32464be1dbc013.png width=400></img>
---
<img src=https://i.gyazo.com/29f00ef05fa2d8085fb6eb1e32e281e2.png width=400></img>
---
<img src=https://i.gyazo.com/ded8191d2931111537d9add7463d28af.png width=400></img>
---
<img src=https://i.gyazo.com/0984e5846712c859463d2017d3510c30.png width=400></img>

</details>


Thoughts? Favorites? Anything I'm missing?

### hiiamboris commented at 2022-02-18T18:35:53Z:

My interpolation usage stats so far, total 226 uses:

<details><summary><code>#print - 64 occurrences</code></summary>

<pre>
#print "ERROR: Request failed with code = (response/code). (msg)"
#print "ERROR: expected 'name=value', found (mold parm)"
#print "ERROR: Tag needs a value: (tag)"
#print "error reading the config file: (msg)"
#print "*** Failed to evaluate event (kind) (mold/part/flat :fn 100)!^/(msg)"
#print "*** Failed to evaluate (spc-name)!^/(msg)"
#print "^/*** Failed to render (name)!^/(msg)"
#print "Found (as path! path) at index (index? pos)"
#print "NOT found (as path! path) in spaces tree"
#print "Payload: (mold bin)"
#print "ERROR: Request failed with code = (response/code). (msg)"
#print "ERROR: expected 'name=value', found (mold parm)"
#print "ERROR: Tag needs a value: (tag)"
#print "Upload OK: '(remote)'"
#print "Download OK: '(remote)' [(info/Content-Type), (info/Content-Length) bytes]"
#print "Delete OK: '(remote)'"
#print "=== Worker said:^/(copy/part output 100)^/==="
#debug events [if dragging? [#print "WARNING: Dragging override detected: (drag-path)->(path)"]]
#debug events [#print "Starting drag on [(copy/part path -99) | (path)] with (:param)"]
#debug focus [#print "last valid focus: (as path! focus)"]
#debug focus [#print "find-next-focal-space @(path)"]
#debug focus [#print "Attempting to focus (as path! path)"]
#debug grid-view [#print "scrollable/draw: renders content from (max 0x0 0x0 - origin) to (box - origin); box=(box)"]
#debug grid-view [#print "origin in scrollable/draw: (origin)"]
#debug grid-view [#print "on-change origin: (mold :old) -> (mold :new)"]
#debug grid-view [#print "on-change clipped to: (origin)"]
#debug grid-view [#print "window/draw is called with xy1=(xy1) xy2=(xy2)"]
#debug list-view [#print "window resized to (s)"]
#debug grid-view [#print "origin in inf-scrollable/roll: (origin)"]
#debug list-view [#print "autosized window to (window/max-size)"]
#debug list-view [#print "available? dir=(dir) from=(from) req=(requested) -> (r)"]
#debug list-view [#print "locate-line (level0) -> (mold r)"]
#debug list-view [#print "item-length? (i) -> (r)"]
#debug list-view [#print "locate-range (low-level),(high-level) -> (mold r)"]
#debug list-view [#print "autosized window to (window/max-size)"]
#debug grid-view [#print "grid/calc-limits [no auto] -> (limits)"]
#debug grid-view [#print "grid/calc-limits [auto] -> (lim)"]
#debug grid-view [#print "sub (n) (size) -> whole: (whole) level: (level)"]
#debug grid-view [#print "sub-def (from) (n) def: (def)"]
#debug grid-view [#print "locate-line/(x)=(xy/:x) -> [(item) (idx) (ofs)]"]
#debug grid-view [#print "locate-point (xy) -> (mold r)"]
#debug grid-view [#print "grid/calc-size is called!"]
#debug grid-view [#print "grid/calc-size -> (r)"]
#debug grid-view [#print "grid/draw is called with xy1=(xy1) xy2=(xy2)"]
#debug grid-view [#print "drawing grid from (xy1) to (xy2)"]
#debug grid-view [#print "avail?/(axis) (dir) = (r) of (requested)"]
#debug grid-view [#print "grid-view/draw is called! passing to inf-scrollable"]
#debug styles [#print "Style for (p) is (mold/flat :style)"]
#debug styles [#print "render-face on (face/type) with current-style: (mold current-style)"]
#debug [#print "Moving focus from (as path! old-focus) to (as path! new-focus)"]
#debug [#print "ERROR: Unable to make (mold type) out of (mold/flat/part :pos/1 100)"]
unless verbose? [#print "Got response: (response/raw)"] 
vprint #composite "Deleting remote file '(remote)'"		;-- `if verbose? [#print` is just as long as `vprint #composite`, lol
vprint #composite "Uploading remote file '(remote)'"
vprint #composite "Downloading remote file '(remote)'"
vprint #composite "Computed signature string is: (mold/flat signature-string)"
vprint #composite "Sending (params/method) request to (params/url): (mold request)"
vprint #composite "Got response: (mold response)"
vprint #composite "Decoded result: (mold result)"
#print? {invoking: (cmd)^/from: "(to-local-file what-dir)"}
#print? "root path: (path)"
#print? "using video file: (vfile)"
#print? "possible audio match: (f)"
#print? "chosen audio track: (afile)"
</pre>

</details>

<details><summary><code>ERROR - 67 occurrences</code></summary>

<pre>
ERROR "(ii/pos-word) does not refer to series"
ERROR "(ii/pos-word) was changed to another series"
ERROR "/case and /same refinements are mutually exclusive"
ERROR "/self is only allowed when iterating over series or map"
ERROR "Cannot set (word) to (mold/only/part :data 50)"
ERROR "Cannot use refinements without column selected at (mold/only/part p 40)"
ERROR "Cannot use type checks without column selected at (mold/part p 40)"
ERROR "Cannot use type filters on ranges"
ERROR "Cannot use value filters on ranges"
ERROR "Cell (first + old) should be broken before (first)"
ERROR "Cell (first + old-span) should be broken before (first)"
ERROR "Could not finish issues compilation!"
ERROR "Mask (mold .mask) has no place for digits"
ERROR "Mask (mold .mask) is missing exponent digits"
ERROR "Out of allowed worker slots"
ERROR "Series index can only be used when iterating over series"
ERROR "Unable to find definition for issue (key)"
ERROR "Unexpected occurrence of (mold spec/1) in spec"
ERROR "Unknown format name: (format)"
ERROR "Unknown format name: (format)"
ERROR "Unsupported currency mask '(copy/part s e)' in (mold .mask)"
ERROR "Worker CRASHED!"			;-- some are not composed, but used for brevity/readability
ERROR "Worker is BUSY!"
ERROR "Zero step is only allowed with series index"
ERROR "amount-of: invalid color selection spec (mold spec)"
ERROR "command (mold-part/flat code 30) failed with:^/(form/part output 100)"
ERROR "do not know how to add spaces to (name)"
ERROR "drag: invalid path spec (mold path)"
ERROR {Compilation of (src-file) failed with: (find task/output "***")}
[p: (ERROR "Unexpected pattern format at (mold/only/part p 40)") ]
[p: (ERROR "`variant` expects a block here: (mold-part/flat p 50)")]
[(ERROR "(token1) cannot follow (token2) in the (name) part of (mold .mask)")]
[p: (ERROR "Unexpected syntax at (mold/part p 50)")]
[p: (ERROR "`variant` expects integer here: (mold-part/flat p 50)")]
| reserved! (ERROR "Invalid mask pattern at (mold p)")
| spec: (ERROR "Unexpected spec format (mold spec)")
ERROR "Unsupported locale (lc-name)"
ERROR "No path masks found in expression: (mold/part expr 50)"
end | (ERROR "Spec must contain words or get-words!")
ERROR "(item) is not unique in (mold/flat/part tree 50)"	
if (.multiplier) (ERROR "Extra percent marker in (mold .mask)") 
if (.multiplier) (ERROR "Extra permille marker in (mold .mask)")
if all [release devmode] [ERROR "/release and /devmode are mutually exclusive"]
if empty? exp-names [ERROR "Map-each is not working?!"]
if empty? spec [ERROR "Spec must contain at least one mandatory word"]
if ii/step = 0 [ERROR ""]	;@@ error or not? one can use such loop to advance manually
if ii/step [ERROR "Duplicate pipe in spec"]
if index-word [ERROR "Can't use indexes when iterating over map"]
if self [ERROR "/self is not allowed when iterating on ranges"]
not pos: find tree item [ERROR "(item) not found in (mold/flat/part tree 50)"]
not single? ns [ERROR "Path masks refer to series of different lengths in: (mold/part expr 50)"]
opt [if (.scope <> 'whole) (ERROR "Extra decimal separator detected in (mold .mask)")]
opt [if (.scope = 'exp) (ERROR "Extra exponent detected in (mold .mask)")]
range? [if index-word [ERROR "Can't use indexes with integer/pair ranges"]]
reshape [!(rule) | p: (ERROR "Expected (mold quote !(rule)) at: (mold/part p 100)")]
set in system/words to word! w does [ERROR "DO NOT CALL (to word! w) DIRECTLY"]
unless any [release devmode] [ERROR "compilation mode [/release or /devmode] should be specified"]
unless any-function? :fun [ERROR "NAME argument (name) does not refer to a function"]
unless compile-ahead? def/code [ERROR "Nothing to compile in issue (key)"]
unless data: sl/list/:name [ERROR "Data for locale '(name)' is not loaded"]
unless def/flags/compiled [ERROR "Not a compiled issue - (key)"]
unless def: issues/:key [ERROR "Unable to find definition for issue (key)"]
unless im1/size = im2/size [ERROR "Images are expected to be of equal size, got (im1/size) and (im2/size)"]
unless parse point =anchors= [ERROR "Invalid `at` block: (point)"]
unless parse/case spec =spec= [ERROR "Invalid box spec: (mold spec)"]
unless parse/case spec =spec= [ERROR "Invalid text spec: (mold spec)"]
unless set-word? :pos/1 [ERROR "Expected set-word at (mold/part args 30)"]
</pre>

</details>

<details><summary><code>general composition - 94 occurrences</code></summary>

<br>Some of these wrappers could be made macros themselves though, e.g. loggers which are 60% of this list. Rest is split between GUI strings and file names or shell commands.
<pre>
#composite "(a/date) (either a/commit [to paren! a/commit][""])"
(#composite "Worker build date: (var/date) commit: (var2)^/OS: (system/platform)")
(#composite "size: (i1/size)")
(#composite "size: (i2/size)")
if vnum [title: #composite "(title)-(vnum)"]
key: either 2 = length? vars [title][#composite "(title)-(vnum)"]
text: #composite "(key) comparison"
text: #composite "Artifact (any [attempt [o/key] txt])"
text: #composite "Error log (any [title {}])"
text: #composite {Block "(txt)"}
text: (#composite "align: (mold align)")
text: (#composite "axes: (mold axes)")	
imasks: #composite "(vfile-noex).*"
auth: #composite "SharedKeyLite (config/storage-account-name):(signed)"
cmp-dir: #composite %"../(dir)"
file: #composite %"(key)-artifacts.red"
exe-file: #composite %"(what-dir)(key)-code.exe"
cfg-file: #composite %"(startup-dir)config.red"
src-file: #composite %"(what-dir)(key)-code.red"	
name:   #composite %"(working-dir)worker-(wi).red"
stderr: #composite %"(working-dir)stderr-(wi).txt"
stdin:  #composite %"(working-dir)stdin-(wi).txt"		;-- use absolute paths to be able to change directories
stdout: #composite %"(basename)-stdout.txt"
stdout: #composite %"(working-dir)stdout-(wi).txt"
default conffile: to-red-file #composite %"(origin)(self).conf"
cmd: #composite {(config/compiler-to-test)(flags) -o "(to-local-file exe-file)" "(to-local-file src-file)"}
call/show/shell #composite {"(exe)" >"(to-local-file out)"}
pid: call #composite {red --cli (to-local-file name) 1>(to-local-file stdout) 2>(to-local-file stderr)}
pid: call/shell #composite {(config/command-to-test) (to-local-file name) 1>(to-local-file stdout)}
pid: call/shell #composite {d:\devel\red\red-src\red\console-view-3369-nodebug.exe (to-local-file name) 1>(to-local-file stdout) 2>(to-local-file stderr)}
pid: call/shell #composite {d:\devel\red\red-src\red\console-view-3369-nodebug.exe (to-local-file name) 1>(to-local-file stdout)}
pid: call/shell #composite {d:\devel\red\red-src\red\console-view.exe (to-local-file name) 1>(to-local-file stdout) 2>(to-local-file stderr)}
pid: call/shell #composite {d:\devel\red\red-src\red\console-view.exe (to-local-file name) 1>(to-local-file stdout) 2>(to-local-file stderr)}
pid: call/shell #composite {d:\devel\red\red-src\red\console-view.exe (to-local-file name) 1>(to-local-file stdout)}
do load #composite %"(startup-dir)config.red"
do/expand load #composite %"(startup-dir)testing.red"
exists? #composite %"(key)-code.exe"
exists? cmp: #composite %"../(dir).reference.run"
exists? cmp: #composite %"../(dir).reference.run.png"
explore/title i #composite {Image "(any [txt i/size])"}
gen-name-for-capture: does [#composite %"(current-key)-capture-(timestamp).png"]
include #composite %"(startup-dir)dope.red"
include #composite %"(startup-dir)input.red"
include #composite %"(startup-dir)jobs.red"
include #composite %"(startup-dir)visuals.red"
include/force #composite %"(startup-dir)issues.red"
inform #composite "(mold expr) check succeeded"
inform #composite "(mold expr) yielded (val), ideally should be (ideal)"
inform #composite "Finished process with handle: (mold/all handle)"
log-info #composite "Configured compiler is: (config/compiler-to-test)"
log-info #composite "Configured worker console is: (config/command-to-test)"
log-info #composite "Cutting process tree starting with PID (root-pid) (mold/all hproc)..."
log-info #composite "Killed process with PID (target-pid)"
log-info #composite "Starting compile job in a heavy worker: (cmd)"
log-info #composite {Started executable (exe) [PID: (pid), handle: (mold/all handle)] }
log-info #composite {Started worker (name) ("(")PID:(pid)(")")}
log-trace #composite "Checking to-image (word)..."
log-trace #composite "Styles to test to-image on: (mold words)"
log-trace #composite "coerce: (word) -> (mold-part/flat get/any word 40) [expected: (type)]"
log-trace #composite "to-image test failed for (mold bad)"
log-trace #composite "to-image test succeeded for (mold good)"
log-warn #composite "Testing against a console. Compilation will be unavailable!^/Set `config/compiler-to-test` to a valid compiler executable to fix that."
panic  #composite "(mold expr) check failed with (:r)^/(red-log)"
panic  #composite "(mold expr) errored out with^/(:e)"
panic  #composite "Process with handle (mold/all handle) is not terminating"
panic #composite "(err)^/*** During execution of: (mold-part pos 100)"
panic #composite "(err)^/*** During execution of: (mold-part pos 100)"
panic #composite "(mold expr) should have returned a number, not (mold :val)"
panic #composite "(mold expr) yielded (val), outside critical range: (crit-lo) to (crit-hi). (msg)"
panic #composite "*** Out-of-order worker output encountered:^/(out-of-order)"
panic #composite "Compilation task failed with:^/(err)"
panic #composite "Internal error:^/(form e)^/during execution of (mold-part any [code-2 code] 100)"
panic #composite "main-worker CRASHED! during execution of:^/(mold main-worker/last-code)^/with message:^/(output)"
panic #composite {*** INTERNAL ERROR: Code/Last-code mismatch: code="(code)" last-code="(worker/last-code)"}
panic-if [not parsed?] #composite "invalid expectations block: (mold expected)"
prin #composite "^/ * (field) = (o/:field) whereas (flag) = (flag-value) for event=(o/type);^-input = (mold/flat state/input)"
prin #composite "^/ * (form test) = (mold x);^-expected = (mold y)(event);^-input = (mold/flat state/input)"
print msg: #composite "=== Worker is BUSY! after executing:^/(mold-part code 100)^/==="
print msg: #composite "Error in input: expected (what) at (mold/part p 500)"
print msg: ` "ERROR: possible exploit attempt detected at (mold/part p 100)" `
report #composite "(script): No ending (type) marker after opening at line (line)"
report #composite "(script): Unbalanced (type) markers between lines (line1) and (line)"
report #composite "(script): Unexpected closing (type) marker at line (line)"
url: as url! #composite "https://(config/search-account-name).search.windows.net/indexes/(index-name)/docs/(key)?api-version=(api-version)(select)"
url: as url! #composite "https://(config/search-account-name).search.windows.net/indexes/(index-name)/docs/index?api-version=(api-version)"
url: as url! #composite "https://(config/search-account-name).search.windows.net/indexes/(index-name)/docs/search?api-version=(api-version)"
warn #composite "(mold expr) yielded (val), expected to be in range: (warn-lo) to (warn-hi). (msg)"
warn #composite "Redefinition of issue (key) detected"
warn-if [not empty? extra-names]   #composite "Unexpected (mold extra-names) were found in the event log"
warn-if [not empty? lacking-names] #composite "Expected (mold lacking-names) events to happen, but they didn't"
write name #composite {...Red script with composed fields...}
write/append #composite %"(working-dir)log.txt" line
write/append cfg-file #composite "config: (mold config)"
write/append/lines #composite %"(key)-artifacts.red" mold/all/flat art
write/append/lines #composite %"(key)-artifacts.red" mold/all/flat o
</pre>

</details>

```
;; non-macro (runtime) composition - 1 occurrence:
;; in config:
avcmd:  {"(player)" "(vfile)" --audio-file "(afile)"}
vcmd:   {"(player)" "(vfile)"}
;; in code:
cmd: composite['root] get bind either afile ['avcmd]['vcmd] :a+v
```



