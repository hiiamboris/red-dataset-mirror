# \|Red Programming Language\| How to get Cookies from a Webpage?

**Link:**
<https://stackoverflow.com/questions/36100920/red-programming-language-how-to-get-cookies-from-a-webpage>

**Asked:** 2016-03-19 11:06:29 UTC

------------------------------------------------------------------------

I searched a lot on Google as well as Stackoverflow. I could not find
How to get Cookies (or in general, The HTTP Headers)from a Webpage and
then edit it and send it back?

\[I know how to make POST/GET requests using read/write but Cookies
idk\]

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 10) --- by DocKimbel

Even with the current temporary IO support, you can still extract HTTP
headers and cookies info:

    >> data: read/info http://microsoft.com
    == [200 #(
    Cache-Control: "no-cache, no-store"
    Connection: "keep-alive"
    Date: "Wed,...

    >> list: data/2/set-cookie
    == [{MS-CV=z/YnyU+5wE2gT8S1.1; domain=.microsoft.com; expires=Thu, 24-Mar-2016    10:59:39 GMT; pa...

    >> foreach str list [probe parse str [collect [keep to "=" skip keep to [";" | end]]]]
    ["MS-CV" "z/YnyU+5wE2gT8S1.1"]
    ["MS-CV" "z/YnyU+5wE2gT8S1.2"]

The HTTP headers are stored in a map!, so if several `Set-Cookie`
headers are sent, you will get a block of strings, else just a string
for the `Set-Cookie` key.

`read/info` will return a block with 3 elements:

-   HTTP return code (integer!)
-   HTTP headers (map!)
-   requested data (string! or binary!)

Notes:

-   HTTPS is supported by `read` and `write`.
-   the best place to get information about Red is to join the Red [chat
    room](https://gitter.im/red/red){rel="nofollow noreferrer"} on
    Gitter. ;-)

------------------------------------------------------------------------

### Answer (score: 2) --- by tomc

cookies are just a field in the response header

did you try [\"the library
people\"](http://www.rebol.org/search.r?find=cookie&form=yes){rel="nofollow"}

*Comment by Graham Chiu:* rebol.org doesn\'t have any scripts for
red-lang AFAIK

------------------------------------------------------------------------

## Comments on question

*Comment by rebolek:* Red now has just temporary IO support that
provides just basic functionality. For full IO support you should wait
for 0.7.0.

*Comment by Noobscripter:* Okay\... \@rebolek BTW CTRL+F searching
[github.com/red/red/blob/master/runtime/simple-io.reds](https://github.com/red/red/blob/master/runtime/simple-io.reds){rel="nofollow noreferrer"}
for `header` shows a lots of stuff. Are you sure it is not possible to
extract the header yet?

*Comment by rebolek:* This was just an assumption and \@docKimbel proved
me wrong, it's possible even now, which is a good thing. Anyway, my
point stands that full IO functionality is 0.7.0 thing.
