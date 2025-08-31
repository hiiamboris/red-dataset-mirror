# How to parse and translate DSL using Red or Rebol

**Link:**
<https://stackoverflow.com/questions/48454538/how-to-parse-and-translate-dsl-using-red-or-rebol>

**Asked:** 2018-01-26 01:20:21 UTC

------------------------------------------------------------------------

I\'m trying to see if I can use Red (or Rebol) to implement a simple
DSL. I want to compile my DSL to source code for another language,
perhaps Red or C# or both - rather than directly interpreting and
executing it.

The DSL has only a couple of simple statements, plus an if/else
statement. Statements can be grouped into rules. A rule would get
translated into a function definition, with each statement the
equivalent statement in the target language.

The parse capability in Red/Rebol is great and lets me implement a
parser very easily - in effect it\'s basically just the definition of
the grammar itself.

However I haven\'t been able to find any examples of how to take the
next steps, specifically handling an if statement and translating it to
other source code. Translating an if statement seems a good example of
something minimal but still slightly tricky - because in Red having an
else means you need to change the if to an either, rather than just an
extra optional else.

Traditionally, during parsing I would build an abstract syntax tree, and
then have functions to operate on the AST and generate the new source
code. Should I be following this same approach or is there some other
more idiomatic way in Red ?

I\'ve experimented with using collect/keep in my parse rules to return a
block of nested blocks, which in effect forms the AST. Another approach
would be to save data into specific objects representing the different
statements etc.

I\'m still getting to grips with collect/keep, as to when a new block
will be created and what will be kept. I\'d also like to keep my parser
rules as \"clean\" as possible, with as little other code intertwined in
it. So I\'m still not sure how best to add in Red code in round brackets
in the parse rules. Adding code too early can cause the Red code to get
executed, even if the rule eventually fails. Adding code too late means
the code may not be executed in the order you expect, especially when
dealing with multi-level statements like if, which can contain other
statements.

So, specifically, any help on how to translate my example DSL to Red
source code would be appreciated. Also any links to implementing DSLs
like this in Red or Rebol would be great ! :)

Here are my parse rules :-

    Red [
        Purpose: example rules for parsing a simple language
    ]

    SimpleLanguageParser: make object! [
        Expr: [string! | integer! | block!]
        Data: ['Person.AGE | 'Person.INCOME]
        WriteMessageToLog: ['write 'message 'to 'log Expr]
        SetData: ['set 'data  Data '= Expr]
        IfStatement: ['if Expr [any Statement] opt ['else [any Statement]] 'endif]
        Statement: [WriteMessageToLog | SetData | IfStatement]

        Rule: [
            'rule word!
            [any Statement]
            'endrule
        ]

        AnySimpLeLanguage: [Rule | [any Statement]]
    ]

    SL: function [slInput] [
        parse slInput SimpleLanguageParser/AnySimpleLanguage
    ]

An example of some source in the DSL :-

    RULE TooYoung
    IF [Person.Age < 15]
       WRITE MESSAGE TO LOG "too young to earn an income"
       SET DATA Person.Income = 0
    ELSE 
       WRITE MESSAGE TO LOG "old enough"
    ENDIF
    ENDRULE 

Translated to Red source code :-

    TooYoung: function [] [
        either Person.Age < 15 [
            WriteMessageToLog "too young to earn an income"
            Person.Income: 0
        ] [
            WriteMessageToLog "old enough"
        ]
    ]

The data, ie Person.Age, Person.Income, and the function
WriteMessageToLog are all things which would have been previously
defined. Note, for simplicity I\'ve left Expr as block! etc, rather than
defining Expr in any more detail in the DSL itself. Also, setting
Person.Income in the function doesn\'t work as coded as it sets a
local - but that\'s ok for now :)

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by 9214

Always nice to see someone digging language-oriented programming, keep
it up and welcome to Red! ;)

------------------------------------------------------------------------

Specifying correct grammar rules is the trickiest part of the job, and
you\'ve already nailed that. What\'s left is to intersperse your PEG
(parsing expression grammar) with `set`, `copy`, `collect/keep` combo
and `paren!` expressions in the right places, and then either create an
AST from that or, in simplier cases, emit code directly.

## Example

Here\'s a [quickly
baked](https://gist.github.com/9214/cd41fa91c83511e78e1ad31b04e5c02d){rel="nofollow noreferrer"}
(and definitely buggy!) example of how I\'d tackled your task.
Basically, it\'s slightly reworked code of yours, where matched patterns
are `set`ted, `copy`ed or `collect`ed, and then bounded to specific
words, which then just pasted into \"template\" (`compose` function
inside `emit-rule`) to produce a Red code.

It\'s not the only way, I believe. **\@rebolek** might come up with more
industrial-strength solution, as he has experience with sophisticated
parsers, which I\'m lacking :P

## Followup

As for `if/else` dilemma, I followed the approach proposed above \--
instead of using `opt` I wrapped rule for else-branch into block and
added an alternative match, which just sets `false-block` to `none`.

What to use for AST \-- anything that allow to express a hierarchical
structure, which is either a `block!` (though for performance gain you
might want to use `hash!` or `map!`) or an `object!`. The advantage of
`object!` is that it provides a context to be bound to, but here we\'re
approaching a realm of so-called Bindology (\"scoping\" rules of Red
language), which is another beast :)

Emitting C# code would be harder, but doable \-- you\'ll need to
assemble a string instead of Red code. I think, however, that, as a
newcomer, you should stick with parsing directly at block-level (the way
you done in your example), because it a lot easier and much expressive.

Another interesting (but much hairy) approach would be to re-define all
words used in your DSL-block to work as you want.

## Resources

We have a [wiki
entry](https://github.com/red/red/wiki/Red---Rebol-Dialects:--Selected-Articles-and-Links){rel="nofollow noreferrer"}
about Red/Rebol dialects on github, which you might find if not useful,
but interesting to read.

Also, two articles
([this](http://www.red-lang.org/2013/11/041-introducing-parse.html){rel="nofollow noreferrer"}
and
[this](http://www.red-lang.org/2016/12/entering-world-of-macros.html){rel="nofollow noreferrer"})
in Red blog, I think you skimmed over first one already (if not, you
should!).

Last, but not least, an exhaustive
[review](https://en.wikibooks.org/wiki/Rebol_Programming/Language_Features/Parse/Parse_expressions){rel="nofollow noreferrer"}
of Parse principles and keywords (which has a couple of wrong parts in
it though, so, caveat emptor). It\'s written for Rebol, but you should
adapt examples to Red rather easily.

As a relative newcomer to the language, I do agree that there\'s a lack
of examples and tutorials about DSL development, but we\'re working on
that (at least in our heads) :)

*Comment by guraaku:* Thanks so much, that\'s a great starting point !
Yes, I\'m a fan of language oriented programming - previously I
implemented a DSL by building a recursive descent compiler by hand, but
now am looking for other options. I\'ve played around with your code a
bit, some good ideas there, I\'ll try to progress things during the
week. Thanks again !

*Comment by 9214:* \@guraaku you\'re welcome. Feel free to drop by our
[Gitter chat](https://gitter.im/red/red){rel="nofollow noreferrer"} and
ask any specific questions there.

*Comment by 9214:* \@guraaku unfortunately I don\'t have enough
reputation to comment on your message below. It\'s an interesting
approach you\'ve used, emitting p-code instead of direct Red code and
using multiple layers of languages. To make things nice, you can wrap
everything into dedicated `object!` as to avoid leakage of words into
global context, because it possibly can cause some trouble in the
future. And a personal remark on coding style - try to stick with
[official
guide](https://doc.red-lang.org/en/style-guide.html){rel="nofollow noreferrer"}
:)

------------------------------------------------------------------------

### Answer (score: 0) --- by guraaku

Taking 9214\'s answer as a starting point, I\'ve coded one possible
solution. My approach has been :-

-   try to keep the parse rules as \"clean\" as possible
-   use **collect** and **keep** to return a block as the result, rather
    than trying to build a more complex AST
-   do some minimal translation in the **keeps**
-   the resulting block should be valid Red code
-   which uses predefined functions, where any more complex processing
    needs to happen

Most simple statements are easily translated to functions eg WRITE
MESSAGE TO LOG becomes SL_WriteMessageToLog which can then do whatever
it needs to do.

More complicated statements with structure, eg If/Else become functions
which take block parameters which can then process the blocks as
required.

For the If/Else complication, I\'ve made this into two separate
functions, SL_If and SL_Else. SL_If stores the result of the condition
in a sequence, and SL_Else checks the latest result and removes it. This
allows for nested If/Elses.

The presence of the final **endrule** can be checked for to ensure the
input was correctly parsed. Once this is removed, we should have a valid
function definition.

Here\'s the code :-

    Red [
        Purpose: example rules for parsing and translating a simple language
    ]

    ; some data
    Person.AGE: 0
    Person.INCOME: 0

    ; functions to implement some simple SL statements
    SL_WriteMessageToLog: function [value] [
        print value
    ]

    SL_SetData: function [parmblock] [
        field: parmblock/1
        value: parmblock/2

        if type? value = word! [
            value: do value
        ]

        print ["old value" field "=" do field]
        set field value
        print ["new value" field "=" do field]
    ]

    ; hold the If condition results, to be used to determine whether or not to do Else
    IfConditionResults: []

    SL_If: function [cond stats] [
        cond_result: do cond
        head insert IfConditionResults cond_result
        if cond_result stats
    ]

    SL_Else: function [stats] [
        cond_result: first IfConditionResults
        remove IfConditionResults
        if not cond_result stats
    ]

    ; parsing rules
    SimpleLanguageParser: make object! [
        Expr: [logic! | string! | integer! | block!]
        Data: ['Person.AGE | 'Person.INCOME]
        WriteMessageToLog: ['write 'message 'to 'log set x Expr keep ('SL_WriteMessageToLog) keep (x)]
        SetData: ['set 'data set d Data '= set x Expr keep ('SL_SetData) keep (reduce [d x])]
        IfStatement: ['if keep ('SL_If) keep Expr collect [any Statement] opt ['else keep ('SL_Else) collect [any Statement]] 'endif]
        Statement: [WriteMessageToLog | SetData | IfStatement]

        Rule: [collect [
            'rule set fname word! keep (to set-word! fname) keep ('does)
            collect [any Statement]
            keep 'endrule
            ]
        ]

        AnySimpLeLanguage: [Rule | [any Statement]]
    ]

    SL: function [slInput] [
        parse slInput SimpleLanguageParser/Rule
    ]

For the example in the original post, the output is :-

    TooYoung: does [
        SL_If [Person.Age < 15] [
            SL_WriteMessageToLog "too young to earn an income" 
            SL_SetData [Person.Income 0]
        ] 
        SL_Else [
            SL_WriteMessageToLog "old enough"
        ]
    ]
    ENDRULE

Thanks for your help to get this far. Feedback on this approach and
solution would be appreciated :)

*Comment by Anderson Green:* You can also generate a parse tree using
[load_parse_tree.r](http://www.rebol.org/documentation.r?script=load-parse-tree.r){rel="nofollow noreferrer"}.

------------------------------------------------------------------------

## Comments on question

*Comment by iArnold:* You are an ambitious newcomer to the language.
Your influences from other languages (Java I presume) are very present.
You have a lot reading up to do, from the introduction of Rebol
[rebol.com/docs.html](http://www.rebol.com/docs.html){rel="nofollow noreferrer"}
to the blogs by the Red team on red-lang.org You will find that in an
interpreted language not knowing if an IF has an ELSE block will have a
negative effect on performance and much much more. Welcome ;-)

*Comment by rebolek:* Without writing full answer (which I\'ll try to
write but don\'t have time right now), I would suggest that you can
solve `if`/`either` problem with always resolving to `either` with one
branch empty in case of `if` without `else`.

*Comment by guraaku:* Thanks iArnold :) Yes, I am very much a newcomer,
and am reading up everything I can find on it, in particular parsing and
dialects. I am investigating Red because of its reputation for
Dialects/DSLs. I hope that translating an IF statement is not something
too ambitious in this language ! :) Thanks rebolek, I agree that\'s a
possible solution.

*Comment by iArnold:* Interesting link that gives an idea of how to
handle a dialect
[rebol2.blogspot.nl/2012/01/...](https://rebol2.blogspot.nl/2012/01/tui-dialect-dialect-to-print-ascii.html){rel="nofollow noreferrer"}
