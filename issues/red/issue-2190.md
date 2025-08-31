
#2190: Wrong error message (that also changes)
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
<https://github.com/red/red/issues/2190>

I should get bad argument error (_Script Error: *\* does not allow time! for its number argument_) here:

```
red>> 0:0:2 ** 5
*** Syntax error: invalid integer! at {"0:0:2 ** 5"}
*** Where: do
```

Also note that the error is different when I try it again:

```
red>> 0:0:2 ** 5
*** Script error: get does not allow string! for its word argument
*** Where: get
```

This is on OSX console, GUI console under W7 seems to be fine.



