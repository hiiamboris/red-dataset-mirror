URL: <https://github.com/hiiamboris/red-formatting/discussions/8>
Date created: 2021-08-15T15:38:29Z

# `form-num-ex` discussion

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L294-L298

My vote is to drop this function. I don't see it's usefulness.
If it is to be kept (as a wrapper around https://github.com/hiiamboris/red-formatting/discussions/11), I propose it should be kept private. Comments below assume it's private.
Docstring for `/type` is confusing btw.

## Comments

### hiiamboris commented at 2021-08-15T17:47:00Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L298
https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L304

My complaint here is discrepancy with `round` when formatting percents and between integer and float:
```
>> form-num-ex/to 234.567% 100
== "2"
>> form-num-ex/to 234.567% 100.0
== "2.35"
>> round/to 234.567% 100.0
== 2.0
```
But round is still [buggy as it can be](https://github.com/red/red/issues/4948), so this may not have been intended result.

### hiiamboris commented at 2021-08-15T17:49:07Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L252-L255

Decision to include `E0` (as in `123.4E0`) or not seems arbitrary to me. I propose `sci0` and `eng0` that leave `E0`, and `sci` and `eng` leave it out.

### greggirwin commented at 2021-08-19T02:31:59Z:

> https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L294-L298
> 
> My vote is to drop this function. I don't see it's usefulness.
> If it is to be kept (as a wrapper around #11), I propose it should be kept private. Comments below assume it's private.
> Docstring for `/type` is confusing btw.

Can you say _what_ is confusing about the doc string, or propose an alternative?

If #11 covers this functionality internally, that's great. I do see value in the higher level named formats. If the overall wrapper(s) support that, delegating internally, the internal implementation will be "may the best man win".

### greggirwin commented at 2021-08-19T19:39:20Z:

- "One of [gen sci eng acct] or custom exponent function" 
- "[gen sci eng acct] (default is gen), or custom exponent function" 
- "[gen sci eng acct] Default is gen; or custom exponent function" 
- "Custom exponent function or one of [gen sci eng acct]; default is gen" 


### greggirwin commented at 2021-08-24T22:57:51Z:

> https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L294-L298
> 
> My vote is to drop this function. I don't see it's usefulness.
> If it is to be kept (as a wrapper around #11), I propose it should be kept private. Comments below assume it's private.
> Docstring for `/type` is confusing btw.

I'm working on a wiki page now, with a confidence table. Something we may also want to do is compare how you create various outputs via which functions. Some people may only want to use masks, others named formats. So dropping or privatizing funcs has to be considered in light of reducing overlap vs creating holes (or ugliness) in functionality.

