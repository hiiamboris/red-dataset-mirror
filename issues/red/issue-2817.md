
#2817: BNF grammar of Red
================================================================================
Issue is closed, was reported by a-nick-fischer and has 12 comment(s).
<https://github.com/red/red/issues/2817>

(Sorry for my broken English)
I have a school project where we have to write a plugin for an IDE. I've choosen to make a Red plugin for InteliJ IDEA, but I'm having some troubles finding a BNF grammar of it. 

I'm currently using this grammar:
https://github.com/rgchris/Rebol-Notation/blob/master/rebol.ebnf
But it is a Rebol grammar and EBNF. It would be really great if someone could send me a grammar of Red. It doesn't matter if it is ABNF or EBNF, I'll use a tool to translate it.


Comments:
--------------------------------------------------------------------------------

On 2017-06-17T16:20:14Z, greggirwin, commented:
<https://github.com/red/red/issues/2817#issuecomment-309224688>

    There is also https://github.com/rebolsource/rebol-syntax/blob/master/syntax.r. It will be very close to Red, though there will be some differences. 

--------------------------------------------------------------------------------

On 2017-06-17T16:21:23Z, greggirwin, commented:
<https://github.com/red/red/issues/2817#issuecomment-309224768>

    Is EBNF not allowed, or do you just not want to translate it?

--------------------------------------------------------------------------------

On 2017-06-17T19:49:24Z, a-nick-fischer, commented:
<https://github.com/red/red/issues/2817#issuecomment-309236244>

    I need a BNF grammar in order to make the plugin. Translating a EBNF grammar to BNF won't be the problem, but I can't find a grammar for Rebol or Red except that I linked to. BTW: Thank you for the link, but this is the Rebol grammar in Parse, which is not exactly what i wanted.

--------------------------------------------------------------------------------

On 2017-06-17T20:56:30Z, greggirwin, commented:
<https://github.com/red/red/issues/2817#issuecomment-309239718>

    When I started work on Ren, I referred to Chris's work as well, as it was the most complete in BNF form.

--------------------------------------------------------------------------------

On 2017-06-17T21:15:21Z, a-nick-fischer, commented:
<https://github.com/red/red/issues/2817#issuecomment-309240619>

    Hm... alright. Then I'll use it. Thank you.

--------------------------------------------------------------------------------

On 2017-06-18T20:51:41Z, rebolek, commented:
<https://github.com/red/red/issues/2817#issuecomment-309302136>

    You should be fine with Rebol grammar, if you add hexadecimal integers `XXh` and literal maps `#(<content>)`.

