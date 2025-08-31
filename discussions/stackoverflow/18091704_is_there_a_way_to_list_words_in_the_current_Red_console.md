# is there a way to list words in the current Red console

**Link:**
<https://stackoverflow.com/questions/18091704/is-there-a-way-to-list-words-in-the-current-red-console>

**Asked:** 2013-08-06 22:36:49 UTC

------------------------------------------------------------------------

Is there an object like rebol/words available in the REPL build with
console.red ?

I am using the red-master currently on github ( it says alpha and
Latin-1 only but no other version id and I didn\'t see anything at top
of console.red)

I was trying some functions but didn\'t have a listing of those
available ( it may be right under my nose \... )

thanks

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by DocKimbel

Use **words-of system/words** to get a list of all words defined in
global context.

Use **system/version** to get the version and **system/build/date** for
the build date.

------------------------------------------------------------------------

## Comments on question
