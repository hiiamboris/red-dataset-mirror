# Red or Rebol: how to convert &quot;test/a&quot; to \[test/a\]

**Link:**
<https://stackoverflow.com/questions/50456798/red-or-rebol-how-to-convert-test-a-to-test-a>

**Asked:** 2018-05-21 21:22:54 UTC

------------------------------------------------------------------------

I tried to do this:

     b: []
     append b  to-word "test/a"

but it generates error

> **\* Syntax Error: invalid character in: \"test/a\" \*** Where: to
> \*\*\* Stack: run to-word

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 5) --- by Jacob Good1

;for 30 characters

to block! \"test/a\"

------------------------------------------------------------------------

### Answer (score: 3) --- by Graham Chiu

    >> append b: copy [] to path! "test/a"
    == [test/a]

*Comment by user310291:* good answer also but I can only mark one so I
took the oldest one :)

------------------------------------------------------------------------

### Answer (score: 2) --- by Dave Andersen

You can use a `lit-path!`, but by default the path will be split:

    >> append [] 'test/a
    == [test a]

Unless you use the `/only` refinement:

    >> append/only [] 'test/a
    == [test/a]

This assumes Red. I\'m not sure if it\'s the same in Rebol.

------------------------------------------------------------------------

## Comments on question
