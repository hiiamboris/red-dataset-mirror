
#4745: Switch with words ?
================================================================================
Issue is closed, was reported by zwortex and has 16 comment(s).
<https://github.com/red/red/issues/4745>

When using switch with a word value, it does not match a literal value (1). That is somehow confusing with similar constructs (2, 3, 4), and could lead to possible defects.
```
a: 'toto 
switch/default a [ 'toto [ print "OK" ] ] [ print "NOK" ] ; (1) is "NOK"
switch/default a [ toto [ print "OK" ] ] [ print "NOK" ] ; (2) is "OK"
either a = 'toto [ print "OK" ] [ print "NOK" ] ; (3) is "OK"
case [ a = 'toto [ print "OK" ] a <> 'toto [ print "NOK" ] ] ; (4) is "OK"
```

Why not have switch match a word and the corresponding lit-word, like = operator does, so that (1) and (2) return OK like (3) and (4) do ?
```
switch/default (to-word "toto") [ 'toto [print "OK"] ] [ print "NOK" ] ; -(1) currently nok, should be ok
switch/default (to-lit-word "toto") [ toto [ print "OK" ] ] [ print "NOK" ] ; (2) currently nok, should be ok
either (to-word "toto") = (to-lit-word "toto") [ print "OK" ] [ print "NOK" ] ; (3) "OK"
either (to-lit-word "toto") = (to-word "toto") [ print "OK" ] [ print "NOK" ] ; (4) "OK"
```

The same should go for the other two flavours of words (get-word, set-word), for the sake of consistency, however this is less likely an issue.

Why not a refinement for these cases where identity is requested, rather than just equality ?

A previous issue on switch ( #2394 ) was opened and closed, with a similar example, switch 'b ['b [5]]. However, this particular issue is more like a wish.


Comments:
--------------------------------------------------------------------------------

On 2020-12-08T15:58:49Z, hiiamboris, commented:
<https://github.com/red/red/issues/4745#issuecomment-740709162>

    Hi @zwortex
    
    `switch value block` is almost an equivalent of `do select/case block value`, with the exception that it allows you list multiple alternatives at once (e.g. `toto titi tutu [print "found"]]`). That is, by design `switch` *does not* evaluate it's block. If you want evaluation, you use `case`.
    
    So if I understood you correctly, you are proposing that `switch` uses non-strict equality comparison when looking for a match. I don't understand though, what purpose will it serve? What is the point of writing `switch 'x ['x [code]]` when you can just write `switch 'x [x [code]]`? In my opinion, this may even more confuse newcomers, leading them into thinking that switch evaluates it's block, which is not the case. Although I'm not saying that I'm against this change, I just would like to see a more solid argumentation ;)

--------------------------------------------------------------------------------

On 2020-12-09T16:25:45Z, zwortex, commented:
<https://github.com/red/red/issues/4745#issuecomment-741885206>

    Hi hiiamboris,
    
    Thanks for the reply and the explanation. I get it better now that the values of the switch block are not evaluated, hence the distinction between other branching statements.
    
    I am new to Red (and Rebol as well), and therefore things that look obvious to you, may look strange to me. In particular, the use of words as constant values is not particularly obvious for a novice. That is why, for my part, **switch 'x ['x [code]]** is clearer than **switch 'x [x [code]]**.
    
    Still when I fill an issue, it is not just by lack of understanding or discomfort, but because I have the strong impression that something is not right.
    
    In this particular case, as you rephrased it, I don't get it why the switch applies a strict equality, and not a regular equality. In fact, digging a bit further, it appears switch behaves like find/select, that is using strict equality with case insensitivity with string or word like datatypes.
    
    ```
    print [ "a and A equal :" (equal? 'a 'A) " but not strictly :" (strict-equal? 'a 'A) ]
    switch 'a [ A [ print "a and A match in switch" ] ]
    print ["a and A match in find : " (find [A a] 'a)]
    ```
    
    The issue (wish) involves therefore also find/select. It is as strange to me that 0.0 and 0 do not match with switch/find/select.
    ```
    print ( find [ 0 ] 0.0 )
    print ( find [ 0.0 ] 0 )
    ```
    
    I'd rather have :
    1- Switch (as well as find or select) use the default equality,  whatever that is - maybe the default equality should be the strict equality, or the strict equality with case insensitivity as in find, though I doubt it.
    2- The ability to refine in switch, find or select, what type of equality is used if different from default : at the moment, equal? cannot be used with switch/find/select.
    3- A case-sensitive refinement to strict-equal? as it appears to be the rule used by switch/find/select.
    4- More details in the help of the commands switch/find/select as to what is the equality that is used per default, and in the command equal?, as to when two values are equal - couldn't find anything on this subject : looks a char can be compared with an integer, or a float, and that word-like types match between themselves etc.
    
    Obviously, this is a wish list. There are probably good reasons for the actual behaviour. Feel free to pick and choose whatever you consider useful, or just workable.

--------------------------------------------------------------------------------

On 2020-12-09T16:44:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/4745#issuecomment-741896942>

    FYI find/select bug is [a known one](https://github.com/red/red/issues/4327)
    
    > strict equality with case insensitivity with string or word like datatypes
    
    That's weird for me too. Let's hope we hear what others think.
    
    1. I support this.
    2. `find` and `select` already have the respective refinements. For `switch` I'm not sure it's needed. But if there's a use-case, why not.
    3. I believe only `switch` behaves like this. So no need for such refinement, as `find` & `select` are already too overloaded.
    4. Help strings are supposed to be short, not exhaustive. Default equality should be `=` and should be implied IMO. More on equality you can find [in the Rudolf's spec](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#581-equality-comparisons)

--------------------------------------------------------------------------------

On 2020-12-09T18:32:55Z, greggirwin, commented:
<https://github.com/red/red/issues/4745#issuecomment-741966157>

    On literal words, that would be a massive and breaking change, so highly unlikely to happen. It runs deep, @zwortex, so changing `switch` won't help, unless you change it everywhere in the language (e.g. `find/select` and everywhere else, including user code, where blocks are not reduced by default), and that's not going to happen. It's a design choice, and you'll find that a lot of things in Red seem strange to new users. 
    
    On strict matching, Red currently matches Rebol's design. I haven't yet seen a strong argument to change that, and don't know one from my own history with the language. Each type has its own comparison rules, e.g.
    ```
    >> print ["a and A match in find : " (find [#"A" #"a"] #"a")]
    a and A match in find :  a
    >> print ["a and A match in find : " (find ["A" "a"] "a")]
    a and A match in find :  A a
    ```
    There is no universal case matching rule. For words, as they are normally case insensitive, and used that way in all but very rare cases, it doesn't make sense to make them case sensitive here. 
    
    For numbers, its the same as how string types match by type, and I think the current behavior makes sense. There is no best answer here, IMO, just choices. Changing it just pushes things around, so code looks different, but not better.

--------------------------------------------------------------------------------

On 2020-12-10T10:56:45Z, DideC, commented:
<https://github.com/red/red/issues/4745#issuecomment-742446590>

    As a general advice regarding your different wish tickets posted here, you said by yourself that you have some predetermined expectations for the language.
    Don't do this!
    Rebol/Red seems like others languages because they use english words and operators that looks common.
    But it behave very differently that most languages, so all your expectations will be doomed to disappointment if you stay in this state of mind.
    
    Rebol/Red is as similar as others language than french or deutsch or whatever is as english. There is some simililarities but many differences. Not only about words by itself, but in sentences construction and so on.
    
    So you have to make your way to not compare each thing with one you are usual with. Instead, thinks you are learning Chineese and that it has nothing to compare with english.
    
    In Gitter chat, there is already strong chineese speakers... sorry, Red programmers who could explain how and why is things like they are.
    The first thing to understand is that Rebol/Red is not a language, but a data format (like XML or JSON that is Rebol derivative)!
    This is not so simple to understand that one can think at first time, but the beginning of a long and interesting journey.
    Have a nice trip.
    
    (and as I'm a native french speaker, you will understand why the previous program... sorry, speech has probably some syntax errors in it that look weird to you, but not to me ;-)

--------------------------------------------------------------------------------

On 2020-12-11T16:51:44Z, zwortex, commented:
<https://github.com/red/red/issues/4745#issuecomment-743305595>

    @hiiamboris,  @greggirwin,   @DideC
    
    I understand perfectly that the value are not interpreted. This is not an issue as far as I am concerned. You have the case structure for that purpose.
    
    The point as it stands now is more of internal consistency. And as I understand it, given switch relies on find, and applies the same default rules, you should probably close this issue and just keep the one referred by @hiiamboris regarding matching rules for find.
    
    There are three equality operators : equal? strict-equal? same? None of them is the one used by switch/find/select, that use strict-equality with a seasoning of case insensitivity for string and word like types.
    
    Anyone would expect switch/find/select to use, as per default, the default equality. They do not. This is disconcerting. Therefore most probably a loophole for bugs. At a minimum, it should be mentioned in the documentation, and in particular through the inline help, that the equality that is used by switch/find/select is of a special kind.
    
    Furthermore, you can't even use the default equality at all with these statements. If you have a mixed bag of integer and floats, you can't find, for sure, a number that has the same value, if it happens to be of a different type. That is not what you would expect. That is not what anyone would expect.
    
    If you present a number against such a bag, you would be forced to present it two times in case of failure : one as integer, one as float. To do otherwise, you would have to make sure that all your numbers are either converted into one datatype or that they all abide to a common rule : either be an integer whenever possible and a float ortherwise. Then, you would have to take the same precautions with the number you're testing. If this is the strategy, it is simpler to have just one datatype for all numbers.
    
    I apply here a general rule in ergonomics : don't surprise the user unless you have to, have something that is predictable, that looks natural. Using the default equality everywhere is natural. Using a different one may be necessary, even more natural, but then it has to be documented.
    
    The same goes with the other issue regarding conditional and/or, that I mention here solely to answer further to @DideC advice. I haven't made a full survey on the subject, but I wouldn't be surprised that most programming languages do make the difference between bitwise operations and logical operations and therefore that people would expect it to be the "normal" behaviour. It is fine to do otherwise, but then even better to use different "words" for that, so as not to trick people.
    
    In your comparaison with languages, english and french share common words. Sometimes they have different meanings but hopefully it is not that often as it may have dear consequences when it happens. You risk the same whenever a user is tricked in believing that he knew something already when he was not. Between english and french, there is not much to be done, apart learning those pitfalls. But as Red is being built, you may still avert some of these situations. May be... I am merely pointing out the one I find are falling in that category, in my opinion.
     
    As for the data-orientation of Red, thanks for the advice. I'll see about that. I've came across a good number of programming languages of all sorts, in various professional environnements, and that includes functional, procedural, declarative, data oriented, constraints, scripting, template programming. If Red is that different, it will be another feather in my cap. Good to know.

--------------------------------------------------------------------------------

On 2020-12-11T20:48:14Z, greggirwin, commented:
<https://github.com/red/red/issues/4745#issuecomment-743419439>

    @zwortex I'm all for docs. Feel free to add notes here: https://github.com/red/red/wiki/%5BDOC%5D-REBOL-Core-Users-Guide-__-A-walkthrough-with-Red#82-switch
    
    We don't have a full User's Guide yet, so these are just notes inspired by Rebol's.

--------------------------------------------------------------------------------

On 2020-12-11T20:58:26Z, greggirwin, commented:
<https://github.com/red/red/issues/4745#issuecomment-743423880>

    When it comes to changes and design choices, it's not easy. We also have to prioritize. We want consistency, and if you stick around, you'll see it discussed a lot. You'll also get tired of hearing me ask for concrete examples and use cases. :^) We all hypothesize at times, necessarily so, about what's best. But we're very lucky to have a long history of Redbol language use to learn from as well. 
    
    > Anyone would expect ...
    
    I happily stand as an exception. :^) 
    
    While I'm here, I'll also note https://github.com/red/red/wiki/%5BDOC%5D-Red-Should...-(Feature-Wars) just for the introductory bit. 

