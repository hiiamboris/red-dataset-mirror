
#2288: In DRAW, a text containing a newline (^/) is rendered with the last character missing
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.wish] [GUI]
<https://github.com/red/red/issues/2288>

I was hoping to be able to draw multi-line texts, by inserting a newline character (`^/`). However the result was that the text was truncated.

```
view [base 400x400 draw [text 20x20 "abcd^/efgh"]]
```

What is rendered is `abcdefg`.



