URL: <https://github.com/hiiamboris/red-formatting/discussions/4>
Date created: 2021-08-12T14:24:55Z

# `format-date-time` discussion

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format-date-time.red#L141-L145

7/10 confidence score, `via-accessors` being the weakest part of the design IMO

## Comments

### hiiamboris commented at 2021-08-12T14:35:06Z:

This is the main concern:
https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format-date-time.red#L336-L339

It expects strings intermingled with time/date accessors (`/day`,`/month` etc). But without a way to control formatting of those accessors I don't see how it's useful.

It would be better IMO if `-via-masks` translated mask into a block for `-via-accessors` function, and latter supported all kinds of formats. We should be able to format each accessor's value using:
- number formatting functions
- `format-string` for months

### hiiamboris commented at 2021-08-12T14:50:05Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format-date-time.red#L374-L382

Big issue here is that dates are using localized masks, like `mmmm`, but time formats enforce English-only AM/PM.

Maybe we let `long-date`, `long-time`, etc. be keys into a map provided for each locale?
If so, how can we access both default (English) locale and user-native one in one format block? we don't?


### hiiamboris commented at 2021-08-12T14:51:56Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format-date-time.red#L382
Another minor thing is, should `short-time` use `hh` and not `h`?

### hiiamboris commented at 2021-08-12T15:02:03Z:

Also big question is how do we format time intervals?
This function doesn't seem to help? Will there be another function?
Features:
- conditionally include hours & minutes if they are present
- turn 24-hour periods into days, 7-day into weeks, 30-day into months, 365 day into years?
- leave only the most significant part present, e.g. `2 days (ago)`, `3 weeks (from now)` ... with corner cases being `just now`/`recently` and `(seen) long ago`
- locale awareness (hard because needs to know how to follow language rules when using words)



### hiiamboris commented at 2021-08-12T15:06:12Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format-date-time.red#L272-L273
https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format-date-time.red#L289-L290
Glitch: `"h m"` format will take `m` for month. Better way would be to switch `m` context after emitting `h` or `s` to time, after `d` or `y` to date. But I don't quite like the ambiguity of `m`, maybe we should use `M` for months? This also ties to `-via-accessors` being intermediate form, where `m` will be stateless standalone mask inside a block.


### hiiamboris commented at 2021-08-12T15:12:19Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format-date-time.red#L249
https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format-date-time.red#L253-L256
https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format-date-time.red#L285-L288

What I have against `c` is that shortest format gives the longest output, which is counter intuitive in a sense.
Alternatives to consider here:
- `mon(th)` for months instead of `jan(uary)`
- `day`/`weekday` for week days instead of `mon(day)` (`w` can still be used for numeric weekday)
- `datetime` instead of `c` for full date + time

Also `-en` formats should be considered in the bigger context of https://github.com/hiiamboris/red-formatting/discussions/14 . `-en` may be a dead end in design.

### greggirwin commented at 2021-08-19T00:28:51Z:

> https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format-date-time.red#L141-L145
> 
> 7/10 confidence score, `via-accessors` being the weakest part of the design IMO

I _LOVE_ the confidence ratings. So helpful. Also having a review of any kind makes me revisit and run things, finding that stuff is broken. :^\ Accessors was certainly an experimental idea which can be deferred, eliminated, and blogged about as a warning to others.

### greggirwin commented at 2021-09-22T21:41:45Z:

If we include `rel-*` funcs, those are completely dependent on L10N, and also probably interpolation. We can `rejoin` our way around the latter, but it's a good guinea pig for both of those features in combination. Also note that the old mappings used `select-case`, which is an old dialected version of `case` I did. I still think that's useful too. Needs a good name though. Could be a refinement for `case`, but `case` is a native, so not as clean to dialect it.

A big issue for `format-date-time` is the current code using inner funcs in funcs. Need to wrap it in `do` for now. I don't think refactoring around that limitation is worth it at this time.

