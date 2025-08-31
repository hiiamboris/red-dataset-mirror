# Access Error: invalid UTF-8 encoding \${FFD8FFE0}

**Link:**
<https://stackoverflow.com/questions/43379932/access-error-invalid-utf-8-encoding-ffd8ffe0>

**Asked:** 2017-04-12 21:27:42 UTC

------------------------------------------------------------------------

Right now there aren\'t really any books on red since it is so new. So I
am trying to follow along an old Rebol book and salvage what I can from
it.

I have found a few commands such `read` where I can\'t execute the code
because of the file encoding.

     save %/c/users/abagget/desktop/bay.jpg read http://rebol.com/view/bay.jpg
     Access Error: invalid UTF-8 encoding: #{FFD8FFE0}

In Rebol this\^ would have been read/binary and write/binary

     >> write %/c/alex.txt read http://google.com
     *** Access Error: invalid UTF-8 encoding: #{A050726F}

Is there a way to convert incoming content to UTF-8 so I can do the
read? Or are there other types of read that handle non-UTF-8?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 5) --- by DocKimbel

> In Rebol this\^ would have been read/binary and write/binary

In Red too, `save` is for converting a Red datatype to a serialized text
of binary format. So if you want to `save` to a JPEG file, you need to
provide an `image!` value. `read` fetches a text content (limited to
UTF-8 for now), so your usage is invalid. The proper line should be:

     write/binary %/c/users/abagget/desktop/bay.jpg read/binary http://rebol.com/view/bay.jpg

> Is there a way to convert incoming content to UTF-8 so I can do the
> read?

To obtain a string from a non-UTF-8 text resource, you need to fetch the
resource as binary, and then write a poor\'s man converter which should
work fine for the common Latin-1 encoding:

    bin-to-string: function [bin [binary!]][
        text: make string! length? bin
        foreach byte bin [append text to char! byte]
        text
    ]

Using it from the console:

    >> bin-to-string read/binary http://google.com
    == {<!doctype html><html itemscope="" itemtype="http://schema.org...

Red will provide proper converters for commonly used text encodings in
the future. In the meantime, you can use such function, or write a
proper decoder (using a conversion table) for the encodings you use most
often.

------------------------------------------------------------------------

## Comments on question

*Comment by Geeky I:* Which book? :D This error is caused by invalid
UTF-8 in google\'s page as you\'ve found out.. Rebol simply ignores(?)
it. I broke this google error down somewhere but I don\'t remember..

*Comment by Alexander Ryan Baggett:* Learn REBOL by Nick Antonaccio
