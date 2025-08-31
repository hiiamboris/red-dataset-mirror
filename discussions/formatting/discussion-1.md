URL: <https://github.com/hiiamboris/red-formatting/discussions/1>
Date created: 2021-08-11T13:50:01Z

# `format-string` discussion

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/string-formatting.red#L199-L202

I'm scoring it at 5/10 confidence right now. Half-baked, no docstrings...

## Comments

### hiiamboris commented at 2021-08-11T13:55:06Z:

I think it should belong to the common `formatting` context, not a context of it's own.

### hiiamboris commented at 2021-08-11T13:57:52Z:

What about /part, or let's just wait for https://github.com/red/REP/issues/97 ?

### hiiamboris commented at 2021-08-11T13:59:49Z:

For less cognitive load, it's dialect should not enforce the order of case, alignment, width, fill-char selection. We may want a general parse wrapper for that though.

### hiiamboris commented at 2021-08-11T14:00:51Z:

Empty spec block/string should apply no formatting ("leave input as is" case).

### hiiamboris commented at 2021-08-11T14:03:54Z:

Given fill-char should be trimmed from string ends automatically. E.g.: 
```
>> sentence: "So many words.  "      ;) length=16
>> format-string sentence [right width 16]
== "  So many words."
```

### hiiamboris commented at 2021-08-11T14:06:01Z:

It's own 'captalize' format should align with `capitalize` function (and call it internally).

