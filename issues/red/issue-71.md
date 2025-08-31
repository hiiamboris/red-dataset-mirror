
#71: Subtle bug in byte comparison
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/71>

I am trying to write a MOLD function for c-strings. This needs to encode bytes below 32 as ^A etc.(two characters). The following program fragment illustrates how I try to determine the length of the resulting string in order to reserve space for it. Unfortunately, it does not function as expected with bytes above 127. (printf is short for print form)

```
s: "á"
c: length? s
printf c ; gives 1 as expected
while [s/1 <> #"^(00)"][
    if s/1 < #" " [c: c + 1]
    s: s + 1
]
printf c ; gives 2 whereas the test on s/1 should fail
```

The program fragment

```
s: "á" either s/1 < #" " [print "NOK"][print "OK"]
```

gives a correct result. How come?



Comments:
--------------------------------------------------------------------------------

On 2011-06-03T11:55:06Z, dockimbel, commented:
<https://github.com/red/red/issues/71#issuecomment-1296291>

    This bug affects byte! comparisons in conditional expressions used by IF, EITHER, WHILE, ALL and ANY.

--------------------------------------------------------------------------------

On 2011-06-03T14:24:36Z, dockimbel, commented:
<https://github.com/red/red/issues/71#issuecomment-1297014>

    Tested OK.

