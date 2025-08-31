# Changing function signature / body in RED

**Link:**
<https://stackoverflow.com/questions/27670596/changing-function-signature-body-in-red>

**Asked:** 2014-12-27 19:07:23 UTC

------------------------------------------------------------------------

In RED we can define function using variables

    Red [Title: "simple program"]

    params: [myvar [integer!]]
    body: [print [myvar]]
    myfunc: function params body

    myfunc 42 ; prints "42"

Question: how can I change function signature or body after?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by ingo

You can use spec-of and body-of to access the respective blocks

    M: Function[a "test"][Print a]
    Print mold Spec-of :m ; prints [a "test"]
    Append Body-of :m 5
    M 4 ; prints 4 returns 5

For more interesting changes you may have to wait for bind to be
implemented, to be able to access words in the blocks.

------------------------------------------------------------------------

## Comments on question
