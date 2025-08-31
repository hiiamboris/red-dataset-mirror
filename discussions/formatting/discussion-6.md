URL: <https://github.com/hiiamboris/red-formatting/discussions/6>
Date created: 2021-08-13T17:43:51Z

# `as-ordinal` discussion

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L144-L146

My previous criticism: https://github.com/hiiamboris/red-formatting/commit/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae#r35975279

My current stance is to exclude this function.

## Comments

### hiiamboris commented at 2021-08-13T17:44:12Z:

The main problem with this function is it cannot be localized.

For example, in Russian ordinal form depends on 3 genders of the following term and on 6 declensions that you can only get from the context. You need an extensive dictionary to infer it or specify both arguments manually. So in reality almost nobody uses it in programming :D

This function should not be included until we:
- determine the use cases
- research how it's used in the variety of languages
- design a spec that fits everyone's need



### hiiamboris commented at 2021-08-13T17:48:19Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L966
https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L982

Minor naming issue. I don't think Redbol langs can "roundtrip" (what `r-` seemingly stands for) an ordinal number (it's not loadable), so `r-` prefix becomes a misnomer.

