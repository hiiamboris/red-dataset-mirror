# Most elegant way to extract block by skipping every 2 element

**Link:**
<https://stackoverflow.com/questions/47356631/most-elegant-way-to-extract-block-by-skipping-every-2-element>

**Asked:** 2017-11-17 17:56:30 UTC

------------------------------------------------------------------------

Let\'s say I have

    block: [a 1 b 2 c 3]

I want

    [1 2 3]

Something like this is clunky and it doesn\'t work because I use word
type (I\'d like to have it word with word not string):

      block: [a 1 b 2 c 3]
      block2: []

      counter: -1
      foreach 'element block [
        counter: negate counter
        if counter append block2 element
      ]

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 6) --- by rgchris

The EXTRACT function should fit the bill here:

    >> extract/index [a 1 b 2 c 3] 2 2
    == [1 2 3]

It\'s fairly versatile for this type of thing.

    >> help extract
    USAGE:
         EXTRACT series width

    DESCRIPTION: 
         Extracts a value from a series at regular intervals. 
         EXTRACT is a function! value.

    ARGUMENTS:
         series       [series!] 
         width        [integer!] "Size of each entry (the skip)".

    REFINEMENTS:
         /index       => Extract from an offset position.
            pos          [integer!] "The position".
         /into        => Provide an output series instead of creating a new one.
            output       [series!] "Output series".

------------------------------------------------------------------------

## Comments on question

*Comment by rgchris:* Aside from the EXTRACT function (see below), once
again your workaround solution would look more elegant with COLLECT:
`collect [foreach [key value] block [keep value]]`
