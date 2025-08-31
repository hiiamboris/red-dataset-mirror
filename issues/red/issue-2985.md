
#2985: PEN PATTERN does not work on macOS
================================================================================
Issue is open, was reported by rebolek and has 6 comment(s).
[GUI]
<https://github.com/red/red/issues/2985>

This code:

```
>> view [base 100x100 draw [pen pattern 4x1 [line 2x0] line 0x50 100x50]]
```

draws a line, but pattern is ignored and following error message is printed to console:

```
Aug 20 10:26:19  console[11533] <Error>: CGContextSetStrokePattern: pattern specified with non-pattern color space.
```


Comments:
--------------------------------------------------------------------------------

On 2017-08-20T08:57:41Z, qtxie, commented:
<https://github.com/red/red/issues/2985#issuecomment-323572659>

    Yes. It's not be implemented. I'll note it in the documents.

--------------------------------------------------------------------------------

On 2017-08-21T17:50:15Z, rebolek, commented:
<https://github.com/red/red/issues/2985#issuecomment-323808836>

    Thanks. But the error message looks like pattern is not completely ignored. Is it planned for macOS?

--------------------------------------------------------------------------------

On 2017-08-27T01:15:45Z, qtxie, commented:
<https://github.com/red/red/issues/2985#issuecomment-325170902>

     Yes. But we're going to revise this feature first.

