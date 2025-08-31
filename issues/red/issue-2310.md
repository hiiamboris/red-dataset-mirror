
#2310: Some integer!s shrink tenfold.
================================================================================
Issue is closed, was reported by WiseGenius and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2310>

When reading `integer!`s > 4772185889, they are converted to `integer!`s about a tenth of their value:
```
red>> 4772185889
== 4772185889.0
red>> 4772185890
== 477218594
```
But then `integer!`s > 10737418239 are converted to `float!`s properly again:
```
red>> 10737418239
== 2147483647
red>> 10737418240
== 10737418240.0
```
Not sure whether or not these are the only 2 places they switch.


