# Archived messages from: [gitter.im/red/red/code](/gitter.im/red/red/code/) from year: 2019

## Friday 3th May, 2019

raster-bar

[09:11](#msg5ccc05b71cd0b8307db502ea)Sorry if I missed something, but it looks like Red wiki is not a right place to discuss red/code repository, and there's no such place elsewere aside from this room, right?

[09:23](#msg5ccc087b4b4cb471d99cd24b)The reason I'm asking is that a wiki is a decent place for design docs

greggirwin

[20:45](#msg5ccca84c5b3f941aa5d866f0)The wiki for each repo should have content related to that repo. Wikis are easy to change, so getting the content out there is the important step. After that, we can move it if a better place is decided on.

## Saturday 4th May, 2019

raster-bar

[09:56](#msg5ccd61db2e2caa1aa60817a6)I'm sorry I didn't realise it was used

## Friday 17th May, 2019

meijeru

[08:53](#msg5cde768def853135c8d51fa3)I have published a function `request-date` which, when called, brings up a small month calendar with options to skip to next/previous month and next/previous year. Clicking a date yields the `date!` value as result. Call it with a `date!` argument to prefill a certain date, or with `none` to prefill it with today's date. The code is \[here](https://gist.github.com/meijeru/c56d0aa547180ed5d6a7630d5c09674a)

rcqls

[09:15](#msg5cde7bb5879f4478c7936832)@meijeru It looks great! Almost working on linux since I think it seems there is an issue with `unview` in red/gtk that I need to fix.

toomasv

[10:00](#msg5cde862163dea422b4992b6e)@meijeru :+1:

greggirwin

[16:58](#msg5cdee81b75d9a575a6faee20)Nice @meijeru! Note that if you select a day (e.g. 31st), then scroll the month to one that has less than that day number, it doesn't calculate correctly to keep the same day.

meijeru

[17:17](#msg5cdeecc38265145bbb2986c1)Astutely observed. I do -- naively -- `date/month: date/month - 1`, so you get from `31-Jul-2019` to `31-Jun-2019` which is corrected by Red to `1-Jul-2019`automatically. The month scrolling should be more sophisticated.

[17:21](#msg5cdeeda28265145bbb298de9)But then again, what is "one month before 31st of July 2019"? How do you define that? And "one month before 31st of March 2019"? That could be 28th of February, but in 2020 it should be 29th of February. This becomes quite tricky.

[17:22](#msg5cdeedbaef853135c8d8fbf8)So perhaps my naive approach is not too burdensome...

greggirwin

[17:23](#msg5cdeee0463dea422b49c74a8)Here's an old bit of code:

```
set 'same-day-next-month func [date /local d] [
    d: date
    d/month: d/month + 1
    if d/day < date/day [d: d - d/day]
    d
]
```

[17:25](#msg5cdeee6f7c363c75a7f8eb04)And an old hack for finding the last day of the month (without using lists):

```
set 'last-day-of-month func [date /local d] [
    d: date
    d/day: 1
    d/month: d/month + 1
    d: d - 1
    d
]
```

meijeru

[17:28](#msg5cdeef370ec37966a1877a1e)Thanks for these hacks!

greggirwin

[17:28](#msg5cdeef53ad024978c6e21ac7)If there are less days in the target month, than the day currently selected, the least surprising thing seems to be to use the last day of the month. Without second-guessing things, or maintaining a flag during navigation, it does mean that you will change the day if you go 31-Mar to Feb, back to Mar. That's a problem.

meijeru

[17:36](#msg5cdef125879f4478c797274a)I corrected the gist already and it works. t is true that this creates another problem as you mentioned. But at least the month is actually changed all the time.

greggirwin

[17:40](#msg5cdef1f50ec37966a1878f52):+1:

meijeru

[18:13](#msg5cdef9d9ad024978c6e26b51)For the previous year, one gets "one year before 29-Feb-2020" as 1-Mar-2019 with my construction. This is probably correct, since people having a birthday of 29-Feb will celebrate it on 1-Mar in non-leap years... However, adjusting the `/year` component of 29-Feb-2020 gives a non-existing date. See the latest issue #3881 .

toomasv

[18:51](#msg5cdf02b7d22ba766a2b409eb)@meijeru If you have time and interest may be you can compare with my \[date-picker](https://gist.github.com/toomasv/1234d616d8e43a4e49efaa7c1a06c9c9)

meijeru

[21:22](#msg5cdf260e509b1035c7677638)@toomasv You limit the years, and you avoid the above problem by losing focus on changing month or year. The use of `range` simplifies some formulations and makes for fewer LOCs (if you don't count the source of range, of course...).

## Saturday 18th May, 2019

toomasv

[07:17](#msg5cdfb1a65b63ea22b3c6dd14)@meijeru Thanks!

&gt; You limit the years...

Years are limited in drop-down selection list, but any year can be entered in the box. No sense in providing list of all years for selection.

&gt; you avoid the above problem by losing focus ...

Yes, because that's the job of user to pick a date. But currently my picker doesn't actually return a date, only probes the picked value.

I agree about `range` usage.
