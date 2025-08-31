# Read doesn&#39;t work with Wordpress.com pages

**Link:**
<https://stackoverflow.com/questions/47236132/read-doesnt-work-with-wordpress-com-pages>

**Asked:** 2017-11-11 08:57:03 UTC

------------------------------------------------------------------------

This is not the same question as [Read https://google.com doesn\'t work
anymore in
Red?](https://stackoverflow.com/questions/47108274/read-https-google-com-doesnt-work-anymore-in-red)

Even with the fix above, it doesn\'t work:

    convert-invalid: function [page] [
        collect/into [foreach c page [keep to-char c]]  clear ""
    ]

    convert-invalid read/binary https://en.blog.wordpress.com/2015/02/26/wordpress-for-ios-new-visual-editor-and-more/

      02/26/wordpress-for-ios-new-visual-editor-and-more/
      *** Access Error: cannot connect: https://en.blog.wordpress.com/2015/02/26/wordpress-for-ios-new-visual-editor-and-more/ reason: timeout
      *** Where: read
      *** Stack: print convert-invalid  

I check with Rebol, it works:

        >> read https://en.blog.wordpress.com/2015/02/26/wordpress-for-ios-new-vi
        sual-editor-and-more/
        connecting to: en.blog.wordpress.com
        == {<!DOCTYPE html>
        <html xmlns="http://www.w3.org/1999/xhtml" lang="en" data-placeholder-foc
        us="false"><head profile="http://gmpg....
        >>

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by Edoc

It\'s likely due to more widespread adoption of TLS 1.2, which none of
the redbols currently support natively.

I just got slammed by this last week too. I have about 20 encapped local
apps which allows users to easily query a dense Web API. In order to get
these working again, I\'d need to install cURL on all local machines.
Yuck! :(

I have been successful in getting cURL to work with my code, although it
is a little slower than I expected. See the other question here which
covers the basics:

[Call curl from rebol or
red](https://stackoverflow.com/questions/47041154/call-curl-from-rebol-or-red-doesnt-work?noredirect=1&lq=1)

(I\'ve had the most difficulty getting Rebol3 Alpha to work with cURL,
but I may just need more tinkering.)

*Comment by DocKimbel:* Red does support TLS 1.2, as long as your
operating system supports it.

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

This is a different issue. Check your error message.

`Access Error: cannot connect: https:...`

Remedy: either wait for native **i/o** or [use
**curl**](https://stackoverflow.com/questions/47041154/call-curl-from-rebol-or-red-doesnt-work)

*Comment by user310291:* I don\'t understand
[google.com](https://google.com){rel="nofollow noreferrer"} is HTTPS and
it works ? so why do you say Red doesn\'t support https.

*Comment by sqlab:* Sorry, too fast and wrong explanation. There are a
few roadblocks in **Red** especially regarding **I/O**

------------------------------------------------------------------------

### Answer (score: 1) --- by DocKimbel

That URL can be read from Red without any trouble:

    --== Red 0.6.3 ==--
    Type HELP for starting information.

    >> read https://en.blog.wordpress.com/2015/02/26/wordpress-for-ios-new-visual-editor-and-more/
    == {<!DOCTYPE html>^/<html xmlns="http://www.w3.org/1999/xhtml" lang="en" data-placeho

Red relies on the operating system networking layer for HTTPS, so it
does not have the obsolescence issues of Rebol2.

My guess about your issue is that you are using a proxy to access the
Internet, and Red does not support proxies yet (while Rebol does), so
that would explain the timeout you get on connecting.

------------------------------------------------------------------------

## Comments on question

*Comment by user310291:* \@HostileFork previous question did work for
[google.com](https://google.com){rel="nofollow noreferrer"} this is
another problem.
