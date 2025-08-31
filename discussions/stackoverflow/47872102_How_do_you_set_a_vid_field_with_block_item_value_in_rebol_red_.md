# How do you set a vid field with block item value in rebol/red?

**Link:**
<https://stackoverflow.com/questions/47872102/how-do-you-set-a-vid-field-with-block-item-value-in-rebol-red>

**Asked:** 2017-12-18 16:01:47 UTC

------------------------------------------------------------------------

That works:

     test: "test"
     view [field test]

That doesn\'t:

     test: ["test1" "test2"]
     view [field test/1]

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by DocKimbel

In Red, paths are not directly accepted by VID, but they can be provided
after some keywords like `data`, which can be used in your case to
indicate the value of the `field` widget:

    view [field data test/1]

An alternative way is to build the VID block dynamically, the simplest
way here would be to use `compose`:

    view compose [field (test/1)]

------------------------------------------------------------------------

## Comments on question
