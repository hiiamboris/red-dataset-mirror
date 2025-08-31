
#3013: Wish: Select or Pick a portion from time and date.
================================================================================
Issue is closed, was reported by Blocode and has 8 comment(s).
[type.wish]
<https://github.com/red/red/issues/3013>

In Rebol 3, I can do the following code.
```Red
n: now
pick n 'time
pick n 'date
```


Comments:
--------------------------------------------------------------------------------

On 2017-09-04T13:39:05Z, meijeru, commented:
<https://github.com/red/red/issues/3013#issuecomment-326965802>

    the components of a `time!` or  `date!` value have the following numbers:
    for `time!` values: `1 ~ hour 2 ~ minute 3 ~ second`
    for `date!` values: `1 ~ date 2 ~ year 3 ~ month 4 ~ day 5 ~ zone 6 ~ time 7 ~ hour 8 ~ minute 9 ~ second 10 ~ weekday 11 ~ yearday = julian 12 ~ timezone 13 ~ week 14 ~ isoweek`
    these numbers can be used as arguments to `pick`, that should be enough

--------------------------------------------------------------------------------

On 2017-09-06T10:49:34Z, meijeru, commented:
<https://github.com/red/red/issues/3013#issuecomment-327447422>

    BTW, these numbers can be found from `system/catalog/accessors` except `julian` which has number 15 in the block `system/catalog/accessors/date!` because it is a synonym
    @dockimbel is `julian` really necessary?

--------------------------------------------------------------------------------

On 2017-09-13T12:21:17Z, dockimbel, commented:
<https://github.com/red/red/issues/3013#issuecomment-329150342>

    @meijeru For compatibility with Rebol only.

--------------------------------------------------------------------------------

On 2018-04-25T06:32:55Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3013#issuecomment-384175382>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

