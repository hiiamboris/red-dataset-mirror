
#5095: Date subtraction semantics is not well defined (and buggy?)
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.bug] [type.design]
<https://github.com/red/red/issues/5095>

**Describe the bug**

We were trying to figure out the results of this script:
```
REBOL [] Red []

repeat z 3 [
	a: 1/1/1/11:11:11
	b: 1/1/1/11:11:12
	a/zone: b/zone: z - 2 * 1:0
	print [a - b  b - a  a b]
]
```
In Red it is:
```
-1 -1 1-Jan-2001/11:11:11-01:00 1-Jan-2001/11:11:12-01:00
-1 0 1-Jan-2001/11:11:11 1-Jan-2001/11:11:12
0 0 1-Jan-2001/11:11:11+01:00 1-Jan-2001/11:11:12+01:00
```
In R2 it is:
```
0 0 1-Jan-2001/11:11:11-1:00 1-Jan-2001/11:11:12-1:00
0 0 1-Jan-2001/11:11:11 1-Jan-2001/11:11:12
0 0 1-Jan-2001/11:11:11+1:00 1-Jan-2001/11:11:12+1:00
```

[Documentation](https://w.red-lang.org/en/datatypes/date) says:
> subtracting two date values: result is a signed number of days between those two dates.

Which is unclear, for example let's take `Jan 1 23:00` and `Jan 3 1:00`:
1. Are these days 2 days apart, judging from dates themselves (3 - 1)?
2. Or 1 day apart, judging from the number of whole 24H intervals between them?

Current behavior doesn't seem to match any of the variants.

Also how does timezone come into play? In the 1st case, zone in which both dates are expressed matters. I would expect calculation to be done in the zone of 1st operand. 

R2 seems to just ignore the TZ, which is not useful IMO:
```
>> a: 1/1/1/11:11:11-12:00
== 1-Jan-2001/11:11:11-12:00
>> b: 1/1/1/11:11:11+13:00
== 1-Jan-2001/11:11:11+13:00
>> b - a
== 0
>> a - b
== 0
```
R3 seems to follow 2nd definition:
```
>> a: 1/1/1/11:11:11-12:00
== 1-Jan-2001/11:11:11-12:00
>> b: 1/1/1/11:11:11+13:00
== 1-Jan-2001/11:11:11+13:00
>> a - b
== 1
>> b - a
== -1
```
```
>> b
== 31-Dec-2000/23:11:11-12:00
>> a
== 1-Jan-2001/11:11:11-12:00
>> a - b
== 0
>> b - a
== 0
```

**Expected behavior**

1. One of the above definitions followed
2. It's precisely documented

Another question here: if we follow R3 and 2nd definition, is automatic truncation useful or necessary? `difference` seems to be the only non-truncated way of subtraction currently.

**Platform version**
```
Red 0.6.4 for Windows built 22-Feb-2022/5:26:32+03:00  commit #8126da7
```



Comments:
--------------------------------------------------------------------------------

On 2022-09-12T21:55:00Z, greggirwin, commented:
<https://github.com/red/red/issues/5095#issuecomment-1244555109>

    While clearing out tabs and doing other research, I came across [this](https://tc39.es/proposal-temporal/). I thought it might have an easy answer but, alas, I got lost very quickly, and gave up entirely when I saw `AddDurationToOrSubtractDurationFromPlainYearMonth` (https://tc39.es/proposal-temporal/#sec-temporal-adddurationtoorsubtractdurationfromplainyearmonth for details). Just...wow.

