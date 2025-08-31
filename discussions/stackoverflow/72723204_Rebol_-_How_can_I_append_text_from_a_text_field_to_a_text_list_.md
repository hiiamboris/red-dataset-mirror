# Rebol - How can I append text from a text field to a text list?

**Link:**
<https://stackoverflow.com/questions/72723204/rebol-how-can-i-append-text-from-a-text-field-to-a-text-list>

**Asked:** 2022-06-23 00:09:38 UTC

------------------------------------------------------------------------

I\'ve been exploring the amazing Rebol programming tool. I\'ve run into
a problem of trying to append text from a text field into the data of a
text-list. My code below adds text to the text-list but changes all
previous text to the current one multiplied by how many data entries
were already in the text list.

How can I correct this?

    REBOL [
        Title: "test4"
        Version: 1.3.3
        Author: "me"
        Purpose: {create a list of countries}
    ]

    populate: does[
        country: countryField/text
        append txtList/data country
        show lay
    ]

    lay: layout [
        across
        text "Enter name of country" black bold
        countryField: field
        return
        across
        txtList: text-list 
        panel [
            button "Add" [populate]
            button "Delete" [remove back tail txtList/data show lay]
            button "Clear" [clear txtList/data show lay]
        ]
    ]

    view lay

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by endo64

You just need to `copy` the text:

    country: copy countryField/text

For short, without copying a series (a string in this case) you just
append the same one multiple times, it is all the same string. When you
change it you just change one string but you see it as multiple changes.

Here you can read the detailed explanation:

[https://github.com/red/red/wiki/%5BDOC%5D-Why-you-have-to-copy-series-values](https://github.com/red/red/wiki/%5BDOC%5D-Why-you-have-to-copy-series-values){rel="nofollow noreferrer"}

*Comment by awyr_agored:* Thank you for taking the time to explain. Just
made the corrections and it works. Do you use Rebol to make stuff?
Thanks

*Comment by endo64:* Yes I\'m using Rebol2 and Red both for daily use,
mostly to filter, organize, search, convert data (lazy to open Excel), a
CLI console, I use them on production as well. Community is small but
welcoming: [rebol.info](http://rebol.info/){rel="nofollow noreferrer"}
[gitter.im/red/home](https://gitter.im/red/home){rel="nofollow noreferrer"}

------------------------------------------------------------------------

## Comments on question
