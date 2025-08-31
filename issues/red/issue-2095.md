
#2095: DECLARE doesn't support alias struct! within contexts
================================================================================
Issue is closed, was reported by aeronavery and has 2 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/2095>

The compiler doesn't seem to support declaring a struct that's been aliased inside a context.

```
foo: context [
    bar!: alias struct! [
        tmp [integer!]
    ]
]
test: declare foo/bar!
```

Gives the compiler error:
`*** Compilation Error: declaring literal for type foo/bar! not supported`

This isn't a huge issue since you can simply define it as `foo-bar!` but it would be nice for consistency.



Comments:
--------------------------------------------------------------------------------

On 2016-07-05T08:18:38Z, dockimbel, commented:
<https://github.com/red/red/issues/2095#issuecomment-230415226>

    Thank you for the ticket.

