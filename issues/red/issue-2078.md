
#2078: Cannot use LENGTH? on IMAGE!
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.built] [type.wish]
<https://github.com/red/red/issues/2078>

In Rebol, I can use `length?` on `image!` type:

```
>> type? image
== image!
>> length? image
== 1512
```

That’s not possible in Red:

```
red>> type? image
== image!
red>> length? image
*** Script Error: length? does not allow image! for its series argument
*** Where: length?
```



Comments:
--------------------------------------------------------------------------------

On 2016-06-30T19:31:27Z, meijeru, commented:
<https://github.com/red/red/issues/2078#issuecomment-229764257>

    I think this was solved by [this commit](https://github.com/red/red/commit/f9b18cbe1c1005e377b0033f549d79d6a620a342)

