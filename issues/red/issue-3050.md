
#3050: Add 'name facet and naming mechanism to VID specs
================================================================================
Issue is closed, was reported by rgchris and has 10 comment(s).
[type.wish]
<https://github.com/red/red/issues/3050>

The idea is to reduce the burden on named UI elements. Suggested use LIT-WORD!:

```
get-values: func [face /local kid][
    make map! collect [
        foreach kid face/pane [
            if kid/name [
                keep kid/name
                keep kid/data
            ]
        ]
    ]
]

view [
    field 'name 300
    field 'city 300
    button "Submit" [
        probe get-values face/parent
        ; => #(name: "" city: "")
    ]
]
```

Could also use ISSUE! with some crossover caveats regarding issue-as-color:

```
view [
    field #name 300
    field #city 300
    button "Submit" [
        probe get-values face/parent
    ]
]
```



Comments:
--------------------------------------------------------------------------------

On 2017-09-21T17:32:50Z, greggirwin, commented:
<https://github.com/red/red/issues/3050#issuecomment-331227311>

    We can't use issue for this, unless we remove the feature that allows them to be used as colors.
    
    `Extra` can be used for this, though it's not as concise. If we want an alt-ID auto-assignment facet, there's a chance we'll get an `@ref` syntax` `ref!` type, but there's still the question of what's the best use of each type in a VID spec. Once defaulted, it can't be changed. We already have the ability to name fields, but this isn't just sugar, as the mechanism is different. That is, you don't have a normal word to access the face, but you gain context.

--------------------------------------------------------------------------------

On 2017-09-21T20:35:46Z, rgchris, commented:
<https://github.com/red/red/issues/3050#issuecomment-331273926>

    I'd say this is more essential than colours, although there's [very little overlap](http://reb4.me/x/colours.html) between words and six-digit colour values.

--------------------------------------------------------------------------------

On 2017-09-21T21:00:45Z, rgchris, commented:
<https://github.com/red/red/issues/3050#issuecomment-331280649>

    I think LIT-WORD! would be an acceptable compromise anyhow. I think it's imperative to have a naming system outside of the current assign-a-variable approach.

--------------------------------------------------------------------------------

On 2017-09-22T02:19:52Z, rgchris, commented:
<https://github.com/red/red/issues/3050#issuecomment-331332261>

    In [responding to a StackOverflow question](https://stackoverflow.com/questions/46350543/use-strings-to-create-words-and-paths-in-red-language/46354461#46354461), I used `face/extra` in the way I would anticipate using the proposed solution here (particularly the last example). Am leaning toward `face/name` rather than `face/reference` as well.

--------------------------------------------------------------------------------

On 2018-04-25T06:35:54Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3050#issuecomment-384176007>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

