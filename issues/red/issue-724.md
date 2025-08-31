
#724: COMMENT in PARSE
================================================================================
Issue is closed, was reported by hostilefork and has 38 comment(s).
[type.wish] [status.reviewed]
<https://github.com/red/red/issues/724>

```
>> parse "bbb" [comment [some "a"] some "b"]
== false
```

Expect true.

COMMENT isn't implemented in Rebol's parse but it probably should be.  As with COMMENT in DO, the tradeoff it represents in cost should be explained to users when making multi-line text comments using a string.  But the real value is in commenting out blocks of code, for which it is useful.

Behavior of comment should be a no-op. It should not move the parse position, and be skipped as if it and the subsequent item weren't there.

```
>> parse "aaabbb" [copy x thru comment [some "a"] [some "b"] (print x)]
aaabbb
== true
```



Comments:
--------------------------------------------------------------------------------

On 2014-03-09T21:43:08Z, dockimbel, commented:
<https://github.com/red/red/issues/724#issuecomment-37140723>

    It might look like a useful feature from an abstract perspective, but I really doubt that the practical need for it is worth the overhead in Parse engine and (future) documentation. In 14 years of Parse usage, I have never had the need for such feature, nor can I remember ever hearing someone asking for it.
    
    When I debug parsing rules, I sometimes use `;` to comment a line or part of a line and add a `]` to close the rule. If there are too many rules on the same line, I either duplicate the line for debugging and comment the original one, or I spread the rules on several lines.
    
    IMO, improving the Parse debugging should go through a dedicated debugger, ideally in a IDE, and not by cluttering the Parse dialect.

--------------------------------------------------------------------------------

On 2014-03-09T22:12:53Z, earl, commented:
<https://github.com/red/red/issues/724#issuecomment-37141622>

    Also see [CureCode issue 1966](http://issue.cc/r3/1966).

--------------------------------------------------------------------------------

On 2014-03-09T22:54:52Z, greggirwin, commented:
<https://github.com/red/red/issues/724#issuecomment-37142782>

    Doc +1

--------------------------------------------------------------------------------

On 2014-03-09T22:56:05Z, hostilefork, commented:
<https://github.com/red/red/issues/724#issuecomment-37142820>

    > When I debug parsing rules, I sometimes use ; to comment a line or part of a line and add a ] to close the rule. If there are too many rules on the same line, I either duplicate the line for debugging and comment the original one, or I spread the rules on several lines.
    
    In my C++ code, I reserve /\* and */ style commenting solely for temporary tests of taking code out.  It's thus a warning if I ever see that to not check it in.
    
    Rebol has no multi-line lexical comment.  So what I like about **comment**, is its searchability for the same reasons.  Easy to find if you threw it in somewhere and went off forgetting you did.  Using your technique is limited and I can't easily search for patterns like your disruption.
    
    > IMO, improving the Parse debugging should go through a dedicated debugger, ideally in a IDE, and not by cluttering the Parse dialect.
    
    It's not clutter for me.  As more of my Rebol code is showing up in parse, the ability to comment out long sections is more important.  See:
    
    https://github.com/hostilefork/draem/blob/master/htmlify.reb
    
    Not all of us are good enough to use the [supercoder 2000](http://media.techeblog.com/images/_funnykeyboards_1.jpg) :-) and write it all perfect from the start.  So I sometimes want to get rid of a section temporarily and see the effect.  It's easier, clearer, and comment is already syntax highlighted.
    
    Much cleaner than your way, IMO...generalized, and an obvious warning-word not to check it in like that.  If I use a line-comment to take out code I have to put some weird text there like BUGBUG or otherwise to call attention.  **comment** calls attention to itself with no extra word and is compatible with what people expect to be available in the main language.

--------------------------------------------------------------------------------

On 2014-03-09T23:11:27Z, greggirwin, commented:
<https://github.com/red/red/issues/724#issuecomment-37143307>

    The hard part, as with most of language design, is that things are subjective. Nobody can argue that your conventions don't work for you, Brian. I can only say I've never missed it being there.

--------------------------------------------------------------------------------

On 2014-03-10T00:38:51Z, hostilefork, commented:
<https://github.com/red/red/issues/724#issuecomment-37145620>

    Pretend I am a user from a potential future.  And I try comment.  It doesn't work (let's assume I got an error).  So I show the code and ask how to mark out lines 52 to 92 in my parse program above.
    
    Someone might say to me on StackOverflow: _"There is no multi-line comment in parse.  But you could wrap all that code in a block and begin it with FAIL.  It would then fall over to the next option."_
    
    Then I get it my head: _"Okay, if I wrap stuff in a block and FAIL it from the beginning, that removes its effect and it will just move on, `comment [...] = [fail ...]`"_
    
    But I come back later and ask another question, where I have something like:
    
    ```
        [long
        rule
        one] (
            long
            paren
            code
            one
        )
    |
        [long
        rule
        two] (
            long
            paren
            code
            two
       )
    ```
    
    I want to comment out "long paren code one" and "long rule two" so that "long paren code two" runs with "long rule one".  I try it and find that the block/fail solution didn't work.  So people look at it and tell me in that case I have to put it all in a block starting with ACCEPT.
    
    Then both those cases are covered by putting it in parens like with **(comment [...])**.  Hadn't thought of that, yet.  But some cases aren't...what should this do?
    
    ```
    >> parse "aaabbb" [copy x thru (comment [some "aaa"]) [some "bbb"] (print x)]
    *** Parse Error: invalid literal value to match on string
    == false
    ```
    
    Rebol and Red are good at being able to take a question for which someone often has a bad preconceived answer...and come back with a good one based on a better design.  That comes from thinking through scenarios.  So I'd really like these kinds of discussions to go from starting with "I've never wanted it" or "I wouldn't want to document it", to something more primary like _what is your motivation - is it good, is it reasonable, is it useful - is there a better alternative_.

--------------------------------------------------------------------------------

On 2014-03-10T08:49:59Z, dockimbel, commented:
<https://github.com/red/red/issues/724#issuecomment-37162360>

    I think that missing support for multi-line comments is a false issue, with any decent code editor, you get:
    - syntax highlighting for single-line comments (so you can _never_ miss them when going through your code)
    - a feature for commenting multiple lines at once, by selecting them (the editor will insert a `;` at the beginning of each line for you), and the reverse operation.
    - multiple undo/redo support, so you can safely delete the lines 52-92 for testing and get them back after.
    
    Debugging PARSE is often complex, adding multi-line commenting will not change that, a PARSE debugger (text-based or visual) would.
    
    Also, each new keyword added to (interpreted) PARSE has a performance impact, even if not used in the rules.
    
    Another point is that such COMMENT support would need to make it to _all_ dialects (why limit it to PARSE only?), so any new dialect should support it (and cope with the additional overhead), including the function specification dialect: what if I need to comment out multiple local variables in my [very long](https://github.com/red/red/blob/master/runtime/parse.reds#L573) Red/System function spec? I do not think this is the right solution. 
    
    If some users can't live without it, I would rather prefer a _syntactic_ support for multi-line comments then, something like:
    
    ```
    ;{
        ... 
    ;}
    ```

--------------------------------------------------------------------------------

On 2014-03-10T17:49:59Z, greggirwin, commented:
<https://github.com/red/red/issues/724#issuecomment-37212262>

    Brian, thanks for your thoughtful post. I agree about how discussions should work, and I'm sorry that my earlier post didn't do that. 
    
    The problem is that you want to comment out arbitrary sections of parse input, correct? And you want to do this because long parse rules and code are harder to manage. I get that, especially after looking at your htmlify example (very nice BTW). So let me ask this: Why not break large rules down into sub-rules, that make the intent clearer and add structure? You have SL comments with "rule names", and the dialogue rule has a nice doc-string. Would a more modular approach to rules be a problem for you?
    
    I have a lot of parse code myself, and it's a mix of large and unruly, maybe-too-granular, and a lot in between. I have my own conventions, but don't always follow a set pattern when writing parse code. I would _like_ tools to help with that, as Doc alluded to, and I think they will come. Most of the time I can debug without too much trouble, because I try to keep things small. The bigger they are, the more help we need. e.g., when I wrote an iCal parser, it quickly became clear that it needed rule tracing built in to facilitate testing.

--------------------------------------------------------------------------------

On 2014-03-11T00:39:14Z, hostilefork, commented:
<https://github.com/red/red/issues/724#issuecomment-37251952>

    Yes, the "does every dialect need to do it" crossed my mind as well.  Though Rebol's answer in the main language was to add **comment** instead of solving it more generally in the syntax.
    
    The more we're discussing it, that may set a bad precedent, if for no other reason than that it doesn't actually "work":
    
    ```
    if comment [1 > 2] 1 < 2 [print "running..."]
    ```
    
    Though given that the evaluator knows nothing about it in particular, it has no "cost" by its existence _(other than the cost of raising the expectation that it will work elsewhere)_.  It could work much better in PARSE, but at the cost you mention.
    
    As for solving it generally with a multi-line comment, please listen to the following suggestion with an open mind.  Let's start by noticing that although both `<<` and `*` are words, both cannot parse equally as--let's say--refinements:
    
    ```
    foo: function [/*] [if * [print "tolerated lexically because this is VERY important!"]] 
    foo: function [/<<] [if << [print "not tolerated, because um... it's not important"]]
    ```
    
    Having had to code in JavaScript lately I really don't care for the language.  But the commenting is useful, and standard.
    
    So imagine taking away ONE single lexical thing you have working today: the refinement named `/*`.  Then:
    
    ```
    if /* 1 > 2 */ 1 < 2 [print "running..."]
    ```
    
    Require the spacing for it to lex, barf on this:
    
    ```
    if /*1 > 2*/ 1 < 2 [print "running..."]
    ```
    
    It looks bad anyway.  Think about it: you lose _one_ little refinement and get a world of love in return.  _(and it isn't even "lost", just as the URL! you mold out when you do `reverse http://hostilefork.com` doesn't have to be "lost")_ If people try to make a comment without the space I'll be the first to say:
    
    > Well, that would take up too much lexical space.  Think about it... asterisks are legal in URLs.  Would you want to lose the ability to write `http://example.com/path/*` just for the sake of not having to put a space in your multi-line comment strings?  Imagine all the other things you'd lose... being able to have a word ending in asterisk that you use in a path like `foo*/bar`.  Here we lost just one single thing, the refinement named `/*`.  And if you really need it, you can use construction syntax to get it in the loader `#[refinement! *]`, or `to-refinement "*"` at runtime.  So even `foo/*` would be legal to call as a path if you wanted it, you'd just have to use something a little unusual looking in the function spec.
    
    This is consistent with the philosophy.  The only "inconsistent" bit is the potential "surprise" of:
    
    ```
    length? [a /* b */ c]
    ```
    
    Coming back as 2 and not 5.  Yet while you may balk at that thing which would seem totally normal to people in other languages, consider: 
    
    ```
    length? [
         a ; b c
         d e ; f
    ]
    ```
    
    Someone just learning Rebol might think that was 8.  It's experience (and syntax highlighting) that informs us that it's 3.  All a Rebol syntax highlighter would need to do would be to require the spaces and it wouldn't muck up other embedded appearances of `/*` and `*/`
    
    Doing this and removing comment from the main system and not adding it to parse strikes me as a wiser decision that pays big dividends at low cost.
    
    One question would be if this construct would require what's being commented out was to be _otherwise parseable code_.  That might be an advantage...and would allow you to say that this is not to be used for freeform text.
    
    ```
    moot: {Christopher Poole} ;-- Founder of 4Chan
    moot: {Christopher Poole} /* Founder of 4Chan */    
    ```
    
    The second could be declared not legal.  That would pretty much rule out using it as a freeform commenting mechanism.  You could do it, but only with `/* {` and `} */` as your delimiters, which is pretty crazy, but still there if you _really_ found you needed it at some point.
    
    This would limit the scope of its usage to what **comment** was actually intended for _(and the reason why I actually want it)_.  That would keep freeform text commenting relatively "pure" in the historical eyes of Rebolers...and avoid a hodgepodge of different conventions used by programmers for their text comments in libraries.  I'd be unconcerned about the added overhead of "verifying the code between the delimiters" for syntax, because this is not really stuff you're supposed to be checking in anyway.

--------------------------------------------------------------------------------

On 2014-03-11T03:47:12Z, greggirwin, commented:
<https://github.com/red/red/issues/724#issuecomment-37260805>

    I'm with Brian on being constructive Bolek. 
    
    Brian, so what you want is a multiline lexical comment, or something easily searchable, but only for PARSE, not for every dialect, correct? 
    
    The next question for me is: Why _doesn't_ REBOL have a lexical multiline comment? I doubt it was an oversight. :-)

--------------------------------------------------------------------------------

On 2014-03-11T10:56:37Z, rebolek, commented:
<https://github.com/red/red/issues/724#issuecomment-37283523>

    So here is something constructive ;)
    [bootrapy](https://github.com/rebolek/bootrapy) dialect supports `comment`. It's simple one line rule:
    
    ```
    comment-rule ['comment [string! | block!]]
    ```
    
    I guess something similar can be added to other dialect, if it's required. But I do not miss it in `PARSE` directly, as @dockimbel said, adding it to PARSE doesn't really help.

--------------------------------------------------------------------------------

On 2014-03-11T15:05:26Z, kealist, commented:
<https://github.com/red/red/issues/724#issuecomment-37305764>

    I would think Doc's idea is the most fitting with Rebol's nature without side effects with other types
    
    ```
    ;{
        ... 
    ;}
    ```
    
    But I don't really think it's necessary.   Only potential trouble I see with it is commenting out strings:
    
    ```
    ;{teststring}
    ```
    
    I think Rebol's spirit includes avoiding too many complicated keystrokes and `/* */` ain't that much fun.  I don't have the deep C++/C background though.

--------------------------------------------------------------------------------

On 2014-04-20T11:37:49Z, dockimbel, commented:
<https://github.com/red/red/issues/724#issuecomment-40893102>

    `/<<` should be parsed as a refinement, I see no good reason to forbid it, so we should relax the rules for that. However `/<...` prefix can be problematic if followed by characters that overlap with tag! syntax, so we need to be careful there.
    
    In the following case:
    
    ```
    length? [
         a ; b c
         d e ; f
    ]
    ```
    
    _Someone just learning Rebol might think that was 8. It's experience (and syntax highlighting) that informs us that it's 3._
    
    I disagree, it is reading the [documentation](http://www.rebol.com/docs/core23/rebolcore-5.html#section-4.3) that informs a Rebol newcomer that everything after `;` is discarded, so that the block contains 3 elements only. I guess that reading the documentation is not asking too much from a newcomer willing to learn the language? :-)
    
    As explained in that documentation, Rebol already has a way to literally comment out a block of code, simply using multi-line string syntax `{...}` (so does Red). Though, this doesn't work everywhere, even with the help of `comment` prefix. My syntactic proposition `;{...;}` (_the symetric version could also be considered_) was simply building on that basic Rebol idea by providing a more robust solution combining existing syntax constructions (I am not very pleased by adding this option, but if we have to at some point, I find it much more consistent with the rest of the syntactic rules than patching the C syntax there)
    
    There are two points that strike me about your `/*...*/` crusade:
    1. We don't have to stick to the C++/Java way, we are not bound to copy any syntax used by other languages, even mainstream ones. Rebol and Red are not part of the C-based class of languages, that's clear from the beginning for every newcomer. The `/*...*/` syntax is a bad fit for Rebol-like languages, as it introduces an exception in the usage of words. Moreover, special syntax in Rebol-like language rely on special characters that can't be used in words, this syntax would break that rule too. (Red currently also has such exception caused by hexadecimal literal syntax, but we will fix that before 1.0).
    2. You advocate multi-line commenting support in order to use it as a debugging technique. I think this is not a modern way for debugging. Red, through its future IDE, aims at more efficient ways to skip or disable part of code for debugging purpose.

--------------------------------------------------------------------------------

On 2014-04-28T01:32:55Z, hostilefork, commented:
<https://github.com/red/red/issues/724#issuecomment-41516585>

    So I put this out as a semi-scientific survey test as a Programmers SE question, just to test the waters and see what a sampling of the population thought:
    
    http://programmers.stackexchange.com/questions/236566/
    
    It turns out that Python takes a similar tactic in deferring multi-line comments to strings.  So far it is 4:1 in votes for not thinking multi-line comments are necessary.  I am surprised.  Though less surprised now that I see this is something Python people have a stake in defending it; there is a "movement" of people who really want to say that commenting is bad, and multi-line commenting is bad.
    
    Though really, it focuses the point that I'm not asking for "commenting".  The primitive I want is for "structure-based deletion".  A term for this doesn't really exist yet, I don't think.
    
    While I do not agree with end-of-line comments and strings (that are not "invisible") being good enough, I suppose the good news--as with any metrics-based decision--is you can point to that post and say "well, there's justification".  So it appears no one will be coming after you with burning torches if you do not include the feature.
    
    > My syntactic proposition ;{...;} (the symetric version could also be considered) was simply building on that basic Rebol idea by providing a more robust solution combining existing syntax constructions (I am not very pleased by adding this option, but if we have to at some point, I find it much more consistent with the rest of the syntactic rules than patching the C syntax there)
    
    Seems you don't really like it... and I absolutely don't like it.  Given that neither of us like it, and it was proposed in response to me wanting something...and a few programming voters have chimed "yeah, who needs multi-line comments anyway"...it would be best to not implement a random compromise that doesn't make anyone happy.
    
    > We don't have to stick to the C++/Java way, we are not bound to copy any syntax used by other languages, even mainstream ones. 
    
    Well... yes... but consider:
    
    There is a Rebol-culture feeling of HTML and XML as being "lame", yet `<foo>` is still tag!.  It introduces no shortage of tough calls in the parser.  I don't know that such a thing would have been invented if not bowing in some sense to interoperability and expectations.
    
    Same with URL! format or anything else that is borne out by convenience of convention.  If we could reinvent the perfect universe from scratch, what would it look like?  _([Alicia Silverstone](http://alexchiu.com/youthringscom/backgrnd.htm), apparently.)_
    
    It may be true that if something is winding up in an exchange format then you are stuck to it more than if it is another language's source code.  But either way, you are faced here and there with some compromises.  If the compromises are already being made, one seems a bit strange to say _"This is the right and Rebol-ish/Red-ish way"_ while anyone can point and go _"but if you could have built it from scratch, would you have really made it like that?"_
    
    I'd rather you left out the weird format and left it open for a future where an idea more like mine came in.  Maybe you don't like `/*` and `*/` but maybe there are some other space-compliant "words" to designate for marking "structural deletion" that wouldn't get the kneejerk "I hate C" reaction to the concept.  I'd rather wait for picking those out than deal with the format you've suggested.

--------------------------------------------------------------------------------

On 2014-04-28T20:25:23Z, pchg, commented:
<https://github.com/red/red/issues/724#issuecomment-41608703>

    Hello,
    
    As I read through these "comments", an idea comes to my mind: I like the way python has special meanings for triple things: """ for example, for multiline strings.
    I also note that vim's standard fold delimiters are triple curly braces: {{{}}}.
    
    So, for Rebol and Red, why not use triple ; for multiline comments?
    
    Example:
    
    ; commented out line
    print "Running code"
    ;;; commented out experimental bunch of code
    print "useless, discarded code"
    ; which may include some comments inside
    print/only "youuuu"
    ;;;
    print "back to decent code."
    
    I find it quite readable, and familiar at the same time.
    I'm now trying to figure out inconvenients...
    
    Any opinions?
    
    À+
    Pierre
    
    Brian Dickens notifications@github.com a écrit :
    
    > So I put this out as a semi-scientific survey test as a Programmers SE
    > question, just to test the waters and see what a sampling of the
    > population thought:
    > 
    > http://programmers.stackexchange.com/questions/236566/
    > 
    > It turns out that Python takes a similar tactic in deferring multi-line
    > comments to strings.  So far it is 4:1 in votes for not thinking
    > multi-line comments are necessary.  I am surprised.  Though less
    > surprised now that I see this is something Python people have a stake
    > in defending it; there is a "movement" of people who really want to say
    > that commenting is bad, and multi-line commenting is bad.
    > 
    > Though really, it centralizes that I'm not asking for "commenting". 
    > The primitive I want is for "structure-based deletion".  A word for
    > this doesn't really exist yet, I don't think.
    > 
    > While I do not agree with end-of-line comments and strings that are not
    > invisible being good enough, I suppose the good news (as with any
    > metrics-based decision) is you can point to that post and say "well,
    > there's justification".  So no one will be coming after you with
    > burning torches if you do not include the feature.
    > 
    > > My syntactic proposition ;{...;} (the symetric version could also be
    > > considered) was simply building on that basic Rebol idea by providing a
    > > more robust solution combining existing syntax constructions (I am not
    > > very pleased by adding this option, but if we have to at some point, I
    > > find it much more consistent with the rest of the syntactic rules than
    > > patching the C syntax there)
    > 
    > Seems you don't really like it... and I absolutely don't like it. 
    > Given that neither of us like it, and it was proposed in response to me
    > wanting something...and a few programming voters have chimed "yeah, who
    > needs multi-line comments anyway"...it would be best to not implement a
    > random compromise that doesn't make anyone happy.
    > 
    > > We don't have to stick to the C++/Java way, we are not bound to copy
    > > any syntax used by other languages, even mainstream ones. 
    > 
    > Well... yes... but consider:
    > 
    > There is a Rebol-culture feeling of HTML and XML as being "lame", yet
    > <foo> is still tag!.  It introduces no shortage of tough calls in the
    > parser.  I don't know that such a thing would have been invented if not
    > bowing in some sense to interoperability and expectations.
    > 
    > Same with URL! format or anything else that is borne out by convenience
    > of convention.  If we could reinvent the perfect universe from scratch,
    > what would it look like?  _([Alicia
    > Silverstone](http://alexchiu.com/youthringscom/backgrnd.htm),
    > apparently.)_
    > 
    > It may be true that if something is winding up in an exchange format
    > then you are stuck to it more than if it is another language's source
    > code.  But either way, you are faced here and there with some
    > compromises.  If the compromises are already being made, one seems a
    > bit strange to say _"This is the right and Rebol-ish/Red-ish way"_
    > while anyone can point and go _"but if you could have built it from
    > scratch, would you have really made it like that?"_
    > 
    > I'd rather you left out the weird format and left it open for a future
    > where an idea more like mine came in.  Maybe you don't like `/*` and
    > `*/` but maybe there are some other space-compliant "words" to
    > designate for marking "structural deletion" that wouldn't get the
    > kneejerk "I hate C" reaction to the concept.  I'd rather wait for
    > picking those out than deal with the format you've suggested.
    > 
    > ---
    > 
    > Reply to this email directly or view it on GitHub:
    > https://github.com/red/red/issues/724#issuecomment-41516585
    
     -- 
    Envoyé de mon GéolPDA Android avec K-9 Mail. Excusez la brièveté.
    Sent from my GeolPDA Android device with K-9 Mail. Please excuse my brevity.

--------------------------------------------------------------------------------

On 2014-04-28T20:36:28Z, greggirwin, commented:
<https://github.com/red/red/issues/724#issuecomment-41610025>

    Pierre, my first thought is that if you add multiple leading semicolons, e.g. for visibility, your comment behavior may change based on how many there are. Also, the more repeated characters you have, the harder it is to tell them apart (2 from 3) at a glance.

--------------------------------------------------------------------------------

On 2014-04-29T06:37:03Z, pchg, commented:
<https://github.com/red/red/issues/724#issuecomment-41645620>

    Gregg Irwin notifications@github.com a écrit :
    
    > Pierre, my first thought is that if you add multiple leading
    > semicolons, e.g. for visibility, your comment behavior may change based
    > on how many there are. 
    
    Hm, true.  I sometimes comment out lines several times (don't ask why): if I do it thrice, my triple " won't work as expected...
    
    > Also, the more repeated characters you have, the
    > harder it is to tell them apart (2 from 3) at a glance.
    
    For visibility, I would rely on editor's syntax highlighting.
    
    I am doing a lot of SQL at the moment, and the ability to 
    -- comment out a line
    and also to
    /*
    comment out large chunks of scripts
    is so convenient
    */
    when you write long scripts, you COMMIT some parts for instance.
    
    IMHO, we may just use the very common /\* */, even if it is not vert rebolish. Who cares, after all?
    
    À+
    Pierre
    
    > ---
    > 
    > Reply to this email directly or view it on GitHub:
    > https://github.com/red/red/issues/724#issuecomment-41610025
    
     -- 
    Envoyé de mon GéolPDA Android avec K-9 Mail. Excusez la brièveté.
    Sent from my GeolPDA Android device with K-9 Mail. Please excuse my brevity.

--------------------------------------------------------------------------------

On 2014-04-29T07:51:31Z, Oldes, commented:
<https://github.com/red/red/issues/724#issuecomment-41649814>

    Fine... so here is my opinion:
    1. I'm against initial HF's request... reasons were told above and if one really want something like that, can use Bolek's solution easily.
    2. I'm against Pierre's triple ; reason is, that I quite often comment already commented line so it would make me troubles.
    3. I don't miss multiline comments in REBOL or Red. If I just want to skip some code because of debugging, I can easily close it in {} or [] and it has same effect like adding 'comment word in front of it. Also although REBOL languages are permissive to write everything on one line, I try to avoid it because of readability, so I'm usually satisfied with single line comments.
    
    Code like:
    
    ```
    if /*1 > 2*/ 1 < 2 [print "running..."]
    ```
    
    looks bad for me and I never use it, when I work in languages, which has /\* */ notation.

--------------------------------------------------------------------------------

On 2014-05-01T12:58:18Z, dockimbel, commented:
<https://github.com/red/red/issues/724#issuecomment-41907584>

    It is not a matter of liking or not liking a given syntax, it's a matter of logical consistency with the rest of syntactic rules. My proposition is just the best fit you can find for a multiline commenting syntax for a Rebol-like language, while the C way is a bad fit (introduces exception in words at lexical level). The "ugliness" of that syntax is totally subjective.
    
    Anyway, the current COMMENT way is good enough for most use-cases, and I am not motivated to add a specific literal syntax for it, as I consider it an archaic feature that will disappear in the future as code editors and IDE improve.

