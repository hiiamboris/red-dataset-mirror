# Why POST in red language change the first character of parameters to upper-case automaticlly?

**Link:**
<https://stackoverflow.com/questions/56371208/why-post-in-red-language-change-the-first-character-of-parameters-to-upper-case>

**Asked:** 2019-05-30 03:21:44 UTC

------------------------------------------------------------------------

For the following simple code,

    Red []

    #include %tools.red

    url: to url! rejoin ["http://somesite.com:7466/japi"]

    response: write url [
            post [
            Content-Type: "application/json"
            req: "requestinfo"  
            list: "This is a pie."
        ]
        {}    
    ]

    print response

The result is something like:

> {\"Status\":\"fail\",\"Value\":\"unknown request: \\u0026{POST /japi
> HTTP/1.1 1 1 map\[Accept:\[*/*\] Content-Type:\[application/json\]
> Req:\[requestinfo\] List:\[This is a pie.\] Content-Length:\[0\]\] {}
> \\u003cnil\\u003e 0 \[\] false somesite.com:7466 map\[\] map\[\]
> \\u003cnil\\u003e map\[\] 176.116.100.233:31144 /japi
> \\u003cnil\\u003e \\u003cnil\\u003e \\u003cnil\\u003e 0xc0002a2640}\"}

My question is, why the parameters (such as req, list) are automatically
capitalized?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by DocKimbel

The HTTP/1.1 RFC says in [section
4.2](https://www.rfc-editor.org/rfc/rfc2616#section-4.2){rel="nofollow noreferrer"}:

> Each header field consists of a name followed by a colon (\":\") and
> the field value. Field names are case-insensitive.

Therefore, capitalization of first character of header names has no
side-effect on a compliant HTTP server.

Though, from the \"parameters\" term you are using, and the
`req: "requestinfo"` part in your source code, I wonder if you are not
trying to pass those information as POST data rather, by mistakenly
putting them in the headers list. If that is the case, then the right
way to pass them is:

    Red []

    #include %tools.red

    url: http://somesite.com:7466/japi

    response: write url [
        POST [Content-Type: "application/json"]
        "req=requestinfo&list=This%20is%20a%20pie."  
    ]

    print response  

*Comment by Topget:* This answer is perfect. Except change
\"Content-Type\" to \"application/x-www-form-urlencoded\". Thanks a lot.

------------------------------------------------------------------------

## Comments on question

*Comment by endo64:* Is this happening for all requests that return a
JSON? And not when you make request using cURL or Postman?

*Comment by Topget:* not only JSON response, others are same

*Comment by endo64:* I\'ve changed the URL to `https://ident.me/.json`
that returns a JSON, and no capitalized occurs:
`{"address": "xx.xx.xx.xx"}`. Could it be related to your `tools.red`
file? What does it do?

*Comment by Topget:* return value is not capitalized, I mean the
parameters in the request. And there is almost no code in tools.red .

*Comment by Topget:* The server response is generated according to the
request.

*Comment by Oldes:* Header field names are supposed to be
case-insensitive\... its the japi server side which should handle it.
The reason why Red is modifying it may be because of estetic reasons but
also because some servers may have problems when there is not the
notation like Content-Length.

*Comment by endo64:* It might change when the full IO work completed, on
next major release `v0.7.0`.

*Comment by Topget:* Ok, I am looking forward it(the new release), since
the server side is written by myself.
