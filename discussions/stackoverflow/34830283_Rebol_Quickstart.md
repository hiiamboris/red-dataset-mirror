# Rebol Quickstart

**Link:**
<https://stackoverflow.com/questions/34830283/rebol-quickstart>

**Asked:** 2016-01-16 18:02:12 UTC

------------------------------------------------------------------------

I\'ve been meaning to try out rebol (or red). I think it might be the
perfect fit for my next project. I\'ve downloaded and tested out red
0.5.4, and REBOL/View
2.7([http://www.rebol.com/download-view.html](http://www.rebol.com/download-view.html){rel="nofollow"})

However, there are a couple of roadblocks for a complete beginner to
rebol:

1.  Red seems to be still in alpha so it is out of the question
2.  There seems to be 3+(?) branches: [REBOL3 - what is the difference
    between the different
    branches?](https://stackoverflow.com/questions/31510930/rebol3-what-is-the-difference-between-the-different-branches/31517518?s=1%7C0.1923#31517518)
    I\'m not sure what to start on
3.  Most of the documentation on the internet is for rebol 2 and
    documentation explaining the differences between rebol 2 and 3 is..
    non existent? (case in point: parse is different)

So, my question is, if I were to develop a (Windows) gui application
with http access (including http authentication) where should I start?

Should I use rebol 2, rebol 3(ren c), or red?

p.s. first question ever!

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by Graham Chiu

Red is in alpha so you\'ve already excluded it. Rebol 3 with view is not
supported by anyone as far as I know. So this leaves you with Rebol 2. I
think you can still purchase a license for the SDK. And there are many
people who can answer support questions.

*Comment by Geeky I:* After reading the forums and websites. This is the
way I\'ve decided to move forward. Use rebol2/view and port to red or
rebol 3 in future if needed. I\'m not sure about the differences between
SDK and VIEW. Or if I would need it

*Comment by Geeky I:* Sorry, can\'t upvote your answer yet

*Comment by Graham Chiu:* View is free to use. If you want to distribute
a binary with hidden sources, or need built in db connections, you\'ll
need the SDK.

*Comment by tomc:* got it for you geeky

------------------------------------------------------------------------

## Comments on question

*Comment by Geeky I:* p.s. is it just me, or does stackoverflow switch
between http and https?

*Comment by HostileFork says dont trust SE:* Welcome, and StackOverflow
is a good resource\...but this question is a better fit for a [forum (?)
or similar](http://rebolforum.com){rel="nofollow noreferrer"}. See
[\"What topics can I ask about
here?\"](http://stackoverflow.com/help/on-topic)\--and notice
specifically *Questions asking us to recommend or find a book, tool,
software library, tutorial or other off-site resource are off-topic for
Stack Overflow as they tend to attract opinionated answers and spam.* If
you collect just a few points with
`actual [code questions (or answers)]`, you can join the chat here. :-)

*Comment by HostileFork says dont trust SE:* [I\'ve posted an answer on
that Rebol
Forum](http://rebolforum.com/index.cgi?f=printtopic&topicnumber=47){rel="nofollow noreferrer"},
which is more liberal about allowing conversation and opinions\... there
will likely be some feedback there. Red also has a Google Group and an
IM.

*Comment by rgchris:* \@Brett has compiled a collection of [differences
between Rebol 2 and Rebol
3](http://www.codeconscious.com/rebol/r2-to-r3.html){rel="nofollow noreferrer"}.
