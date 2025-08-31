# Parse doesn&#39;t work for insertion after last line of some keyword

**Link:**
<https://stackoverflow.com/questions/47001391/parse-doesnt-work-for-insertion-after-last-line-of-some-keyword>

**Asked:** 2017-10-29 14:33:02 UTC

------------------------------------------------------------------------

I want to insert new sentence under last line where keyword is found,
but it doesn\'t work, seems simple at first:

        source: {
            bla bla bla bla
            bla bla bla bla
            bla bla keyword bla bla
            bla bla keyword bla bla
            bla bla keyword bla bla

            bla bla bla bla
            bla bla bla bla
            bla bla bla bla
        }

        rules: [
            some [
                thru "keyword" to newline skip
            ]
            mark: ([insert mark "stranger"]) 
            to end
        ]

        parse source rules

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

Your block evaluates to the same block. You have to use

    mark: (insert mark "stranger") 

without the block.

And don\'t use source as source is already defined as a mezzanine
function.

------------------------------------------------------------------------

## Comments on question
