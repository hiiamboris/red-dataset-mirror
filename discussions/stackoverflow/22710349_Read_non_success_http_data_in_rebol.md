# Read non success http data in rebol

**Link:**
<https://stackoverflow.com/questions/22710349/read-non-success-http-data-in-rebol>

**Asked:** 2014-03-28 10:34:55 UTC

------------------------------------------------------------------------

Is there a way to read non success http data, for example for a `404`,
in Rebol? When `open` gets a non success http response code for an URL
it fails with an error, but I would like to read the response instead.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by sqlab

I know this is crude, but it works for Rebol 2. You can get the http
protocol scheme with

     h: get in system/schemes 'http

then you write it to a file

    write %ht mold h

and edit this file. There you replace this line

    result: select either tunnel [tunnel-actions] [response-actions] response-code 

with

    port/status: response-code 
    result: case [
        tunnel [
           select tunnel-actions  response-code 
        ]
        not find response-actions response-code [
           return response-code
        ] 
        true [
          select response-actions response-code 
       ]
    ]

Then you have to replace the original scheme. Add\
`Rebol [] system/schemes/http:`\
at the beginnung of your ht-file and do it with `do %ht`

*Comment by rnyberg:* Yes, this works (in a very hackish way :) ). I see
that the http scheme code doesn\'t quite do what I want without some
custimization. What I\'d really like is to get both data, response code
and header for a request. Fortunately that code isn\'t too hard to write
anyway.

*Comment by sqlab:* I added the unhandled response codes at a place you
can query.

------------------------------------------------------------------------

## Comments on question

*Comment by HostileFork says dont trust SE:* I don\'t know the specific
answer, but see [how to get the response content of an http 404
response](http://stackoverflow.com/questions/17829211/how-to-get-the-response-content-of-an-http-404-response).
I think there should be a better answer, it\'s open source now, see
[prot-http.r](https://github.com/rebol/rebol/blob/master/src/mezz/prot-http.r){rel="nofollow noreferrer"}!
:-)

*Comment by rnyberg:* Thanks \@HostileFork! I don\'t know how I missed
that question. Very enlightening. :) It\'s unfortunate that one needs to
customize the http scheme for this. I haven\'t looked at the Rebol 3
code yet though.
