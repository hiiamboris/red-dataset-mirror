# Printing out text of all GUI elements in Red language

**Link:**
<https://stackoverflow.com/questions/46285290/printing-out-text-of-all-gui-elements-in-red-language>

**Asked:** 2017-09-18 17:42:15 UTC

------------------------------------------------------------------------

I am trying to print out text from all GUI elements in following code:

      sentlist: ["A" "B" "C"]

      main: function [slist] [
          view collect [
              repeat i length? slist [
                  keep compose [
                      text (slist/:i)
                      field "" 
                      return ]]
              keep [button "Printall" [
                  repeat i (2 * length? slist)[
                      print face/parent/pane/(i)/text  ]]]]]

     (main sentlist) 

It runs all right without any error and `text` elements\' text are
properly printed out, but for `fields`, only last field\'s entry is
printed out for each field. Where is the problem and how can it be
corrected? Thanks for your help.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by rgchris

In your spec `field ""` reuses the same string to each of the fields.
Changing one field changes the text for each (likely for efficiency
reasons, this is not reflected in the GUI). You could change the line to
`field (copy "")` to provide a unique string.

*Comment by rnso:* This is truly a unique problem in this language! Why
is it there?

*Comment by rgchris:* \@rnso The Rebol author wrote about it here: [Is
Rebol a Pure Functional
Language?](http://www.rebol.com/article/0206.html){rel="nofollow noreferrer"}
and is discussed here: [Is Rebol a Functional Programming
Language?](https://softwareengineering.stackexchange.com/questions/187800/is-rebol-a-functional-programming-language).

*Comment by rgchris:* The
[Ren-C](https://github.com/metaeducation/ren-c){rel="nofollow noreferrer"}
branch of Rebol 3 locks series that are created literally in source so
you would receive an error in the above case.

*Comment by HostileFork says dont trust SE:* \@rnso [Many people have
complained about
this](http://www.rebolforum.com/index.cgi?f=printtopic&topicnumber=31&archiveflag=archive){rel="nofollow noreferrer"}.
A lot of ideas have floated around but the nature of Rebol/Red design
makes it hard to excise. Bear in mind it\'s not just STRING!s with this
behavior, it\'s deeply nested source blocks. Strategies like
copy-on-write have been considered but bring a loss of control while
introducing their own problems. My own belief evolved to think that
sticking with explicit copying -but- locking source by default is the
most reasonable answer.

*Comment by rnso:* \@HostileFork : Agreed. I have removed my comment.

------------------------------------------------------------------------

## Comments on question
