URL: <https://github.com/red/red/discussions/5637>
Date created: 2025-08-13T06:29:04Z

# lit-word! and get-word! parameters?

I'm trying to learn Red and I discovered you can write this:

`func ['a :b][]`

but I can't find any examples (other than `??` and `help`) or documentation anywhere of what `lit-word!` and `get-word!` parameters are for.


## Comments

### hiiamboris commented at 2025-08-13T13:41:31Z:

It is documented in the [unofficial spec](https://github.com/meijeru/red.specs-public/blob/b83be9f99e8a87770454d905d47feeab042d160c/specs.adoc#741-function-type) clause 7.4.1.2.i:
> Evaluate as many subsequent expressions as needed to obtain values corresponding to the non-optional arguments, except: When the _`<argument-name>` is a `'<word>`, then if the next value is a `:<word>` or `:<path>` or `<paren>`, evaluate this to fetch the value it refers to; else pass the next value as-is. If the `<argument-name>` is `:<word>`, do not evaluate the corresponding expression
but yield its first `<value>` as-is; do not raise an error if this value is unset._ Make the `<word>` of each `<argument name>` refer to the corresponding value. Check the type of each value against the type(set)s specified for the argument.

A few examples can be found in the runtime. E.g. try `?? foreach` and `?? quote`.

There's also R2 documentation about it (but not 100% applicable to Red): [lit-args](http://www.rebol.com/docs/core23/rebolcore-9.html#section-3.2), [get-args](http://www.rebol.com/docs/core23/rebolcore-9.html#section-3.3)

There's a quick to the point [summary of differences between R2 and Red](https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#literal-arguments-and-get-arguments) as well.

