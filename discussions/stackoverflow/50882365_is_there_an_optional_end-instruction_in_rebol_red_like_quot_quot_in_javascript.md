# is there an optional end-instruction in rebol/red like &quot;;&quot; in javascript

**Link:**
<https://stackoverflow.com/questions/50882365/is-there-an-optional-end-instruction-in-rebol-red-like-in-javascript>

**Asked:** 2018-06-15 20:38:03 UTC

------------------------------------------------------------------------

red accepts instruction written on multiple lines which is good. But is
there a way to use separator between instructions ?

I tried to use \";\" but it doesn\'t work, is there any other symbol
available ?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by endo64

Nope, there is no such symbol and it should not be necessary.

------------------------------------------------------------------------

### Answer (score: 0) --- by DocKimbel

> red accepts instruction written on multiple lines which is good. But
> is there a way to use separator between instructions ?

There are no \"instructions\" in Red, it\'s all *data* (blocks, words,
integers, strings, etc\...). Moreover, \"lines\" are irrevelant in Red
once your script is `load`-ed in memory, it becomes a native data
structure that you can interact with, like any other data structure.
New-line characters are converted to so-called \"line markers\" that are
just cosmetic, they have no specific meaning in the language. They
separate *values* like any other accepted whitespace character.

If you really need to make a long expression easier to read, you can use
\"line markers\" or parens to isolate nested expressions.

*Comment by endo64:* It looks `load` mostly keeps the line markers in
the given string.

------------------------------------------------------------------------

## Comments on question

*Comment by HostileFork says dont trust SE:* In Rebol2/R3-Alpha, UNSET!
is generally a no-op in instructions like **any** and **all**. So you
can do something like **\|: does \[\]**. That will not work in Red, as
it considers UNSET! to be truthy in an ANY and ALL. So **any \[1 \> 2 \|
\"foo\"\]** will be UNSET!, not \"foo\". For related topics, see
[BAR!](https://trello.com/c/7RbcHZX3/128-vertical-bar-is-an-expression-barrier-which-can-be-used-to-isolate-evaluations){rel="nofollow noreferrer"}
and [null](https://trello.com/c/rmsTJueg){rel="nofollow noreferrer"}
