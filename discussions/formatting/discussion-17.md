URL: <https://github.com/hiiamboris/red-formatting/discussions/17>
Date created: 2021-08-18T18:57:11Z

# The missing `parse-format` (or whatever we call it)

My initial thoughts: https://github.com/hiiamboris/red-formatting/commit/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae#r35986605

After we've formatted the text, if it's editable, we can parse it back to update the value.

Fields we can extract (possibly surrounded by plain text, but knowing what we're looking for):
1. Single numbers (easiest)
   - do we want to accept percent type?
   - mask determines decimal separator (and we ignore group seps)
   - automatic conversion to an integer when mask tells us so?
2. Money
   - should we be able to recognize currency? if so, it can be before or after the number, can stick to other symbols/text, misspelled, may use currency symbols instead of abbreviations...
3. Time, including time intervals
   - may include `:` or not
   - heuristics for `1:2` should likely be context aware - is it minutes+seconds or hours+minutes? (Red convention doesn't matter here)
4. Dates, or dates + time
   - hard part is month words and possibly ordinal days, esp. all that in non-english locales
   - do we accept it in user locale? in user locale or english? in any supported language (in that case we must include locale data for all of them)?
   - mask matters: DD/MM/YY or MM/DD/YY or YY/MM/DD? separators may be ignored, but the order is defined by the mask, unless it's unambiguous (like when months are words)

Anything else?

Proposed arguments: expected data type, mask (numbers and dates require it, but it may eventually become useful for money and time?), input text
Proposed result: value of expected data type, or an error

Can we omit the mask? Surely, e.g. for integers we can. For floats, we may in this case provide the default mask for chosen locale.

I think this function should be developed in parallel with `format-number-with-mask` #15 and others, to ensure that if there are features that must correlate, they do.

## Comments

### hiiamboris commented at 2021-08-18T18:58:47Z:

We may also consider smart extraction of values from arbitrary text, out of the scope of `format` but should be easily built on top of our features here.

### greggirwin commented at 2021-08-19T07:41:35Z:

There's a "when" aspect to validation, and also how helpful we can be to the user. That means being helpful to the programmer by returning hints about how the data matches up against a mask/pattern. Users moving insertion points around, pasting, etc. makes things a pain if we try to control and guide input. It's a good research project. :^) You should be able to look at the insertion point and tell what's valid in that position, but if that shifts other things into non-valid positions what do you do? Or if the max length is reached? Forcing users to delete chars first is very unfriendly. If we go beyond numbers, showing a parallel mask as a guide also fails when proportional fonts are used.

But we can start with a simple approach. Regexes are pushed far beyond their readability, but simple pattern matching can be quite useful. Then we can ask `like?`. Perhaps most importantly, we need to be users and attack the input problem top down, focusing first on the behavior and user experience.

