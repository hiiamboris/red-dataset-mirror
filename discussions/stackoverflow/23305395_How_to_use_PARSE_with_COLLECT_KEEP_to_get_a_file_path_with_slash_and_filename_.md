# How to use PARSE with COLLECT/KEEP to get a file path (with slash) and filename?

**Link:**
<https://stackoverflow.com/questions/23305395/how-to-use-parse-with-collect-keep-to-get-a-file-path-with-slash-and-filename>

**Asked:** 2014-04-26 01:09:53 UTC

------------------------------------------------------------------------

I\'m trying to take a FILE! string type and turn it into two parts. One
that is all the part up to the final slash in the directories, and one
that is just the name of the file itself.

I tried this:

    >> parse %dir/other-dir/file.ext [collect [keep thru [any thru %/] keep to end]]

But that just gives me back the full name `[%dir/other-dir/file.ext]` I
would have liked to get the two element block
`[%dir/other-dir/ file.ext]`.

*(I\'d also like `[none file.ext]` if I had given an input like just
`%file.ext`)*

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by ingo

You\'ve got one \'thru too much.

    red>> parse %abc/file.ext [collect[keep [some [thru #"/"] | keep (none) ] keep to end]]
    == [%abc/ %file.ext]
    red>> parse %/abc/file.ext [collect[keep [some [thru #"/"] | keep (none) ] keep to end]]
    == [%/abc/ %file.ext]
    red>> parse %/abc/def/file.ext [collect[keep [some [thru #"/"] | keep (none) ] keep to end]]
    == [%/abc/def/ %file.ext]

I am using \'some, so that the rule fails, if there\'s no slash in the
input. Then using \"\| keep (none)\" keeps the \'none you want.

\"keep (something)\" keeps the return value of running \"something\"
through the \'do dialect.

    red>> parse %file.ext [collect[keep [some [thru #"/"] | keep (none) ] keep to end]]
    == [none %file.ext]

Without it, you would only get the file part.

    red>> parse %file.ext [collect[keep [any [thru #"/"]] keep to end]]
    == [%file.ext]

    red>> parse %/abc/def/file.ext [collect[keep [any [thru #"/"]] keep to end]]
    == [%/abc/def/ %file.ext]

------------------------------------------------------------------------

## Comments on question
