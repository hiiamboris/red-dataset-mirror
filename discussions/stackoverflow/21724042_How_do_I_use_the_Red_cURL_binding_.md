# How do I use the Red cURL binding?

**Link:**
<https://stackoverflow.com/questions/21724042/how-do-i-use-the-red-curl-binding>

**Asked:** 2014-02-12 09:43:04 UTC

------------------------------------------------------------------------

I am just getting started with Red and I need help to get the cURL
binding working.

The cURL link from the main red-lang site takes you here

[http://red.esperconsultancy.nl/Red-cURL/dir?ci=tip](http://red.esperconsultancy.nl/Red-cURL/dir?ci=tip){rel="nofollow"}

But there is only a small example using Red/System hence I am not sure
how to load the binding in Red directly.

I need to get this working on Mac, Linux and maybe Windows so I would
appreciate any pointers to differences between these platforms.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 7) --- by kealist

A few things to address:

1.  Next, there are some dependencies between bindings. I am maintaining
    a [github
    clone](https://github.com/kealist/RS-fossil-mirror){rel="nofollow"}
    if you don\'t want to use the script `download.r` in the
    [Red-test](http://red.esperconsultancy.nl/Red-test/dir?ci=tip){rel="nofollow"}
    files with Fossil. The cURL library explicitly depends on the
    C-library binding. I didn\'t look, but like depends on the Common
    binding at a lower level.

2.  Because of the lack of `url!` type in Red at the moment, you pass
    the function `read-url` a `string!` or a `c-string!` more
    specifically.

3.  With Red/System bindings used in Red, the ideal situation is to have
    a wrapper that abstracts the lower level code. You can see this on
    TryRebol with running `read "http://www.google.com"`. Although this
    console build does not seem to use cURL binding for that
    implementation.

4.  In order to use a Red/System binding in Red, you need to use the
    `#system-global` directive. Here is a simple script that grabs the
    data from a website:

        Red[]

        #system-global [
            #include %../cURL.reds
            with curl [
                print read-url "http://www.red-lang.org"
            ]
        ]

*Comment by johnk:* This works well. I used the github repository from
step 1 above as ANSI.reds is required. I also need to install libcurl by
running `apt-get install libcurl4-gnutls-dev` on linux. The other trick
was to use `red -c` as I forgot that the interpreter will not run
Red/System code directly.

------------------------------------------------------------------------

## Comments on question

*Comment by Doc:* The cURL link is no longer valid. Archived versions in
Wayback Machine do not work either (no access to the sources is
possible). Note: Site appears to have been a Fossil repository.
