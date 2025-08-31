URL: <https://github.com/hiiamboris/red-formatting/discussions/3>
Date created: 2021-08-11T14:13:41Z

# `capitalize` discussion

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/string-formatting.red#L356-L364

I'm giving it 3/10 confidence so far. Too many features missing.
I have lot of experience in formatting music tags, but it is all universally applicable.


## Comments

### hiiamboris commented at 2021-08-11T14:18:40Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/string-formatting.red#L300-L303
I see no unicode letters accounted for.
We should have better rules for upper/lower letter somewhere in uppercase/lowercase function sources.
But let's aim higher: we should have globally available charsets for common character classes in Red, out of the box: `alpha`, `alpha-en`, `digit`, `hex-digit`, `alphanum`, `alpha-upper`, `alpha-lower`, `alpha-en-upper`, `alpha-en-lower`, `vowel`, `vowel-en`, `consonant`, `consonant-en`, `punctuation`, `whitespace`...
- What other classes do we want?
- What names should we use?


### hiiamboris commented at 2021-08-11T14:23:13Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/string-formatting.red#L312-L323

Out of the box, should support french rules as well e.g.: `L'Arrivée sur l'Ile`.
Italian is similar: `L'Oscurità dell'Ignoto`.

### hiiamboris commented at 2021-08-11T14:27:13Z:

I'm thinking we should provide a dictionary per every language (out of the box: english, german, french).
And user should be able to select and combine any number of dictionaries in a call (including user-defined ofc).

Dictionary should contain not strings per se, but Parse rules *and* strings used by those rules (and charsets). See below for reasons.

### hiiamboris commented at 2021-08-11T14:33:55Z:

It should be able to know when a new sentence starts.
E.g. `Sentence One. Sentence Two.` -> `Sentence one. Sentence two.`

We must also be able to let it know whether given text is *at the start of a sentence* already or not (whether to capitalize the 1st letter).
The dumbest rule for this is period `.` (also `!` and `?`) followed by any `whitespace`. Other languages may have their own punctuation before whitespace.

It should also be possible to make it treat newline markers as sentence separators (e.g. if we have new-line delimited data "column", poetry/lyrics being one common case).

### hiiamboris commented at 2021-08-11T14:43:09Z:

Names are a common case:
`J.Smith` `J. Smith` `J.S.Smith` `J.S. Smith` `J. S. Smith` (whitespace is optional)
but also `Smith J.` `Smith J.S.` `Smith J. S.`, and even `Smith, J.S.` (widely used for alphabetic sorting, and in dictionaries)

Names won't work with simple uppercase-after-a-dot rule (e.g. `input: "someone by the name smith j. s."`), but rather should recognize name formats using Parse. Some cases like `Smith J.` may be ambiguous and out of our reach though.

To this end, what's the shortest last name? https://www.quora.com/Who-in-the-world-has-the-shortest-full-name gives us examples `U Nu` and `Ba U`, so single-letter last name is valid. However http://www.americanlastnames.us/articles/shortest-last-names.html says these cases are extremely rare, even 2-letter ones are, so if this causes any problems we can use 2-letter min limit.




### hiiamboris commented at 2021-08-11T14:48:56Z:

Roman numbers is another common case. 
Using parse rule we should be able to always uppercase them.

Whether roman numbers recognition is enabled or disabled should be controllable. Maybe `roman-numbers` should be a separate dictionary.


### hiiamboris commented at 2021-08-11T14:50:04Z:

`I` is seemingly missing from english dict right now. And is also a roman digit. Some languages may want to lowercase it though.

### hiiamboris commented at 2021-08-11T14:58:25Z:

No vowels in a word means with big probability it must be an abbreviation, so we should uppercase it.

### hiiamboris commented at 2021-08-11T15:06:14Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/string-formatting.red#L308-L310

hyphen `-` and apostrophe `'` should not start a new word. `Ph'nglui mglw'nafh` `Crime-ridden society`. 
IDK if backtick too, in the form of `` `n` ``?

### hiiamboris commented at 2021-08-11T15:07:04Z:

Word after a number is a tricky case.
We can't include all known measure unit names.
`100HP` (horse power) vs `100MHz` (how do you know for sure it's not milli-herz?) vs `100mW` (it's not mega-watt) ...
I think only things like 1st, 2nd, 3eme, etc. should be lowercased using a language dictionary, while rest we should probably leave as is.


### hiiamboris commented at 2021-08-11T15:10:48Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/string-formatting.red#L333

What about `N`,`E`,`S`,`W` as standalone words? In English I think only `n` may be ambiguous, but even then probably less common than `N` as north if it's without a backtick?

### hiiamboris commented at 2022-02-14T17:59:04Z:

Unicode.org just couldn't make life any easier:
```
>> #"^(01F2)"
== #"ǲ"
>> lowercase #"^(01F2)"
== #"ǳ"
>> uppercase #"^(01F2)"
== #"Ǳ"
```
That is, we can have chars that are neither lower- nor upper-case. And if we convert their case we can't get the original back without 3rd `titlecase` function.

> Due to the inclusion of certain composite characters for compatibility, such as the Latin capital letter ‘DZ’ (\u01F1 ‘DZ’), there is a third case called title case

### hiiamboris commented at 2022-02-14T18:06:05Z:

Another example (note the lost dot):
```
>> uppercase lowercase #"İ"
== #"I"
```
Suggests that `uppercase`/`lowercase` natives behavior may depend on the language...

>  For instance, unlike English, the character Latin small letter ‘i’ in Turkish has an equivalent Latin capital letter ‘I’ with dot above ( \u0130 ‘İ’).

![](https://i.gyazo.com/9abaefae9db989e9b821a69f0f5aec38.png)

### hiiamboris commented at 2022-02-15T15:42:36Z:

What about name `encase` as in "enforce casing"?
OTOH that assumes more general lower/upper/capital casing, but this one is only for capital.

### hiiamboris commented at 2022-02-16T15:57:19Z:

I am at the point where need to ask *the* question. What's the purpose of this function?
Are we dealing with data that's all uppercased or all lowercased?
Are we beautifying the text, or detecting possible case errors?

There's a catch. Consider the following:
- `... the resp. leaders are ...` - our heuristic on sentence splitting may tell us that dot+space is a new sentence, or not, depending on how "good" the input is. Where a sentence starts then determines an uppercased char.
- `BE` - what is this? an acronym? beryllium element? or verb `to be`? There is virtually endless list of ambiguous words like this, including units and geographic names. We could detect (and ignore) acronyms if they're all caps, but not if we expect that our text is all caps.

I want to design it like this: 
- we have a set of named rules, some language-agnostic some not, that tell where a capital letter is likely
- by listing those rules in a block argument we can fine-tune what to capitalize or not

Still, design of these rules depends on the answer. And given how big this task is, all the more reason to nail it down before designing further. 

