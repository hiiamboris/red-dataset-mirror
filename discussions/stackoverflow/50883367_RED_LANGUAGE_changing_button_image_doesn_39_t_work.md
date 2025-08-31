# RED LANGUAGE : changing button image doesn&#39;t work

**Link:**
<https://stackoverflow.com/questions/50883367/red-language-changing-button-image-doesnt-work>

**Asked:** 2018-06-15 22:25:55 UTC

------------------------------------------------------------------------

I tried to do this, but after clicking nothing happens:

    view [
        button %head.jpg [
            face/image: %tail.jpg
        ]
    ]

Update: RED IS A LANGUAGE I PRECISE SINCE ASKED :)

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

## Comments on question

*Comment by user310291:* It\'s in TITLE and tag didn\'t you see ? RED
language [red-lang.org](http://red-lang.org){rel="nofollow noreferrer"}

*Comment by user310291:* \@lurker is it you who flagged for close ?!

*Comment by lurker:* \"Red\" is a pretty generic term and I didn\'t
recognize it as a language. Thanks for updating to be specific.

*Comment by Darek Nędza:* Works with `base` (and probably more) instead
of `button`.

*Comment by Gregg Irwin:* Image support in the `button` style is
preliminary (they are native widgets and require extra support for
this). Please submit a ticket at
[github.com/red/red/issues](https://github.com/red/red/issues){rel="nofollow noreferrer"}
for this, and work around it using the `base` style for now.

*Comment by nickkoro:* Ahem, I already filled the ticket for you after
asking on Reds gitter. Here it is:
[github.com/red/red/issues/3776](https://github.com/red/red/issues/3776){rel="nofollow noreferrer"}.
If you have further useful information, feel free to comment.
