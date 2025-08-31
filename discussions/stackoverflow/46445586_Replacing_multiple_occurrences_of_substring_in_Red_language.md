# Replacing multiple occurrences of substring in Red language

**Link:**
<https://stackoverflow.com/questions/46445586/replacing-multiple-occurrences-of-substring-in-red-language>

**Asked:** 2017-09-27 10:30:15 UTC

------------------------------------------------------------------------

I am trying to have a function that replaces multiple occurrences of
`oripart` to `newpart` in the sent string:

    strReplace: func [str [string!] oripart [string!] newpart [string!]][
            if find str oripart [   
                change find str oripart newpart
                strReplace str oripart newpart ]  ; recursion to change more occurrences; 
            str ]

    print strReplace "this is a short line" "short" "small"
    print strReplace "this is a short line" "this" "THIS"
    print strReplace "this is a short line" "line" "LINE"
    print strReplace "this is a long line" "short" "small"
    print strReplace "this is a short short line" "short" "small"

I am using recursion to remove multiple occurrences. It works all right
for a single test line. However, it is producing stack overflow if I am
testing above code. Where is the problem?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by sqlab

Why you do not use just **replace** or **replace/all**

`replace/all oristr oripart newpart`

Your trial blows up because you change e.g. **\"this\"** to **\"THIS\"**
and Red same as Rebol is mostly case insensitive, if you do not demand
explicitly strict or case. So it recurses and recurses.

    >> "this" = "THIS"
    == true
    >>  "this" == "THIS" 
    == false
    >> find "this"  "THIS"
    == "this"

If you really want to use your own **strReplace** you should use
**find/case**

    >> find/case "this"  "THIS"
    == none

There is one more solution to your problem; recurse at a position after
the change as in

        strReplace: func [
            str [string!] oripart [string!] newpart [string!]
        ][
            if find str oripart [   
                str: change find str oripart newpart
                strReplace str oripart newpart   ; recursion to change more occurrences; 
            ]
            head str 
        ]

*Comment by rnso:* Yes, find/case was the real issue.

*Comment by sqlab:* Use **replace/all** instead, as it replaces all
occurences

------------------------------------------------------------------------

## Comments on question
