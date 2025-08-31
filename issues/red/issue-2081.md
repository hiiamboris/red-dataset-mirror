
#2081: PEN color is ignored when it was turned off before
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/2081>

Consider this code:

```
red>> view [base 200x200 draw [fill-pen red triangle 10x10 100x10 10x100 fill-pen off pen black triangle 10x10 100x10 10x100]]
```

it draws red triangle with black outline.

Now have a look at this code:

```
red>> view [base 200x200 draw [pen off fill-pen red triangle 10x10 100x10 10x100 fill-pen off pen black triangle 10x10 100x10 10x100]]
```

It should draw same triangle, but the black outline is now missing.



