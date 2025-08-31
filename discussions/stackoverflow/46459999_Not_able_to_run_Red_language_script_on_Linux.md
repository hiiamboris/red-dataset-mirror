# Not able to run Red language script on Linux

**Link:**
<https://stackoverflow.com/questions/46459999/not-able-to-run-red-language-script-on-linux>

**Asked:** 2017-09-28 02:24:04 UTC

------------------------------------------------------------------------

I am trying to run following simple script file:

    #! /usr/local/bin/red-063

    Red []

    print "testing"
    quit

But I am getting following error:

    ** Script Error: Invalid compressed data - problem: -3
    ** Near: script: decapsulate 
    if none? script

This error is mentioned on this page:
[https://github.com/red/red/blob/master/environment/system.red](https://github.com/red/red/blob/master/environment/system.red){rel="nofollow noreferrer"}
but details are not clear and also how it can be corrected.

Similar script for Rebol 2.7.8 works. Where is the problem?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 0) --- by Graham Chiu

The problem is with rebol not being able to unpack. See
[here](https://github.com/red/red/issues/543){rel="nofollow noreferrer"}.

Essentially create a batch file or shell script in the directory as the
red binary to invoke the red binary.

*Comment by rnso:* Will same work for Linux? There is another post:
[github.com/red/red/issues/1547](https://github.com/red/red/issues/1547){rel="nofollow noreferrer"}

*Comment by Graham Chiu:* Did you try it?

*Comment by rnso:* I am away from my computer. Will try and respond
ASAP.

------------------------------------------------------------------------

## Comments on question
