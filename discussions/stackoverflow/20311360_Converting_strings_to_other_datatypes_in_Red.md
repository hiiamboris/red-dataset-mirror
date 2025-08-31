# Converting strings to other datatypes in Red

**Link:**
<https://stackoverflow.com/questions/20311360/converting-strings-to-other-datatypes-in-red>

**Asked:** 2013-12-01 10:56:19 UTC

------------------------------------------------------------------------

What is the recommended way to convert a string to an integer in Red?

One way I found is:

    load "123"
    == 123

Is `load` the best way of getting an integer from a string in Red?

Is there any danger in using `load` in this way specifically if the
string is from an unvalidated source?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by DocKimbel

Currently, that is the only way, as `to` action has not been implemented
yet. It is safe using `load`, as it does not do any kind of evaluation
and the construction syntax support is very basic (covering just none
and logic values).

EDIT: `to` action is now available from v0.6.2 on, so `to-integer "123"`
can be used too.

*Comment by JohannesDienst:* As of Red version 0.4.3 the to action works
for this conversion: `to integer! "123"` `== 123`

------------------------------------------------------------------------

## Comments on question
