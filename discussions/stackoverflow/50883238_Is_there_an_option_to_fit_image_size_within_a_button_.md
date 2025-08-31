# Is there an option to fit image size within a button?

**Link:**
<https://stackoverflow.com/questions/50883238/is-there-an-option-to-fit-image-size-within-a-button>

**Asked:** 2018-06-15 22:07:10 UTC

------------------------------------------------------------------------

If %heads.jpg is big, in the case of button it won\'t resize:

        view [
            image 140x140 %heads.jpg
            button 140x140 %heads.jpg
        ]

Is there an option to fit image size within a button ?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by DocKimbel

There is one, though currently only supported on Windows:

    view [button 140x140 %head.png with [image: reduce [image size]]

So this changes the `/image` facet of the button face, to refer to a
block containing the image value and a new target size for the image.

------------------------------------------------------------------------

## Comments on question
