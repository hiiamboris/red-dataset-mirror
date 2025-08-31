# Red to-date doesn&#39;t work with AAAA.MM.JJ

**Link:**
<https://stackoverflow.com/questions/47056709/red-to-date-doesnt-work-with-aaaa-mm-jj>

**Asked:** 2017-11-01 14:03:51 UTC

------------------------------------------------------------------------

This code snippet works on Rebol:

    to-date "2017.08.29"

but it doesn\'t work on Red

Looking at the source seems the same. So why it doesn\'t behave the same
way ? What to do ?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

    >> load replace/all "2017.08.29" "." "-"
    == 29-Aug-2017

------------------------------------------------------------------------

## Comments on question

*Comment by DocKimbel:* Red could support that format too. Please open a
wish ticket for it on Red\'s github repo.

*Comment by user310291:* \@DocKimbel ok thanks will create it.
