
#3893: Offside Blocks
================================================================================
Issue is closed, was reported by androo-L and has 22 comment(s).
<https://github.com/red/red/issues/3893>

This is a suggestion for a language feature - a new punctuation symbol that defines offside blocks.  No one who didn't want to use it would need to, but when used well it can make code cleaner and clearer.  It is best illustrated by example.

First a function from an online tutorial using conventional blocks:
```
inc: function [n /by x] [
    either (x) [
        return n + x
    ] [
        return n + 1
    ]
]
```
With '~' used as the offside block symbol:
```
inc: function [n /by x] ~
    either (x)
        ~ return n + x
        ~ return n + 1
```
The functionality of the symbol can be explained by imagining a text pre-processor implementing it.  When the pre-processor sees a '~', it replaces it by a '[' and the first code text after it (i.e. not a comment) sets the offside line for the block.  In subsequent processing, when a line is seen starting to the left of the offside line, the pre-processor inserts a ']' to end the block.  

In the example above, the left of "either" sets the offside line for the main function block, even though the tilde is on the line above.  For the blocks controlled by "either", the left of "return" sets the offside line for the blocks.  The first block is ended by the '~' on the following line because it is to the left of "return" on the line above.  The second block under "either" would be ended by the next function, variable, EOF, or whatever comes next to the left of the "return".  

After playing around, the following convention seems best to me.  When there is a single block relating to something on the line before it, place the tilde on the line and write the contents of the block on following lines.  This is shown in the main function block in the example above.  When there are multiple blocks of equal "status" relating to something, place them in line below, as in the "either" blocks in the example above.  This seems to show the structure of code well.  

Also after playing around, '~' seems the best symbol to use.  Other symbols, or combinations of symbols could be used e.g. ':-'.


Comments:
--------------------------------------------------------------------------------

On 2019-05-23T04:39:32Z, 9214, commented:
<https://github.com/red/red/issues/3893#issuecomment-495064479>

    Please don't use issue tracker for design suggestions, we have [community chat](https://gitter.im/red/red/welcome) for that.
    
    > No one who didn't want to use it would need to
    
    In other words, anyone who needs such a feature can implement it by himself in user space (e.g. with Parse, `system/lexer/pre-load` or macros) - Red is flexible enough for that. 
    
    Although, prior to doing any of the above, I'd suggest to learn [language fundamentals](https://github.com/red/red/wiki/%5BLINKS%5D-Learning-resources) first, and then to ponder over all cans of worms that your suggestion opens.

--------------------------------------------------------------------------------

On 2019-05-23T06:15:24Z, greggirwin, commented:
<https://github.com/red/red/issues/3893#issuecomment-495082204>

    More idiomatic Red would be:
    ```
    inc: function [n /by x] [
        either x [n + x][n + 1]
    ]
    ```
    And even _more_ idiomatic would be:
    ```
    inc: function [n /by x] [
        n + any [x 1]
    ]
    ```
    
    > when used well it can make code cleaner and clearer
    
    You need to back up a claim like this and, as @9214 suggests, start by learning Red and be sure to consider what core changes to the language would entail. For example, how does your suggestion work in light of Red not maintaining loaded code as lines? 

--------------------------------------------------------------------------------

On 2019-05-23T06:15:42Z, androo-L, commented:
<https://github.com/red/red/issues/3893#issuecomment-495082267>

    @9214 Thanks for the reply.  
    
    The community chat was the first place I looked to make the suggestion.  It didn't look like the message above would be practical in that context - it seemed too big and like it would interrupt other conversations.  Other people seemed to be leaving suggested improvements on github.  The label "type.wish" is used a reasonable amount, so it appeared to be the best place to put it given the alternatives.  Sorry if I've broken a rule or something.  
    
    The pre-processor part is probably the part of my description that most suggests people could do it themselves, and yes by using a pre-load function.  That description was just to give a more precise idea of what the suggestion is more than the example - I understand that it is more difficult than what I described there.  I did look through quite a bit of the language fundamentals before posting.  
    
    It seems like a thing that should be tried at first as module implementing a pre-load function, and maybe that's as far as it should go, unless it became popular, but I don't see much of a module system.  
    
    Thanks again for the response.  
    

--------------------------------------------------------------------------------

On 2019-05-23T06:22:01Z, androo-L, commented:
<https://github.com/red/red/issues/3893#issuecomment-495083706>

    @greggirwin 
    
    Thanks for the reply too.  Offside blocks would be converted to conventional blocks on loading.  As the ends of lines are removed, so too would the blocks need to be converted.  
    
    Also, the example function was just to illustrate what the idea is, and I didn't want to choose something larger.  Thanks for the style tips though.  Different blocks and situations will give different results.   Agree it needs many more examples to prove the case, many more than could reasonably fit here.  

--------------------------------------------------------------------------------

On 2019-05-23T06:43:36Z, greggirwin, commented:
<https://github.com/red/red/issues/3893#issuecomment-495088766>

    @androo-L understood, but what your suggestion does is to make Red sensitive to the location of newlines which it is not today, and which is a big change. More than that, if I understand your design, it makes Red _whitepsace_ sensitive, which is a _massive_ change. 
    
    My question is, _why_ you think it makes things cleaner and clearer? That's what I don't understand. My examples were to show that it's not needed if the goal is to reduce code.

--------------------------------------------------------------------------------

On 2019-05-23T06:47:14Z, greggirwin, commented:
<https://github.com/red/red/issues/3893#issuecomment-495089650>

    As a side note, modules are planned for 0.8.0.

--------------------------------------------------------------------------------

On 2019-05-24T00:03:37Z, androo-L, commented:
<https://github.com/red/red/issues/3893#issuecomment-495426305>

    White space sensitivity would only be added where it is explicitly marked, not everywhere.  From a language classification point of view it might be changing categories, and so seen as a major thing in that way, but when you look at the particular changes involved, it is not so big.  The meaning and usage of blocks is still the same - some of them would just be marked differently.  It's really just a visual layout thing.  
    
    It's probably a false dichotomy to think of languages as falling into white space sensitive and non white space sensitive.  There are mixtures.  And the difference is not that big anyway.  Even in Python, internally there are INDENT and OUTDENT tokens that mean the same thing as { and } in Java or C.  It's not fundamentally a big thing.  
    
    Brackets, braces etc. were originally designed to group things within sentences.  Consequently they are very good for grouping things on one line, and okay even across a line break.  When people want to group things bigger than that, they use dot points, indentation, and line spacing.  I'm talking here about all written language not just coding.  
    
    Brackets don't stop you using indentation and line spacing, but they do stop you using dot point layouts.  They also tend to add clutter at the end of indentations, and take away visually from what is trying to be achieved with the indentation and line spacing.  So an option to use a dot point style and cleaner indentation and line spacing is likely to be an option that people would want to use.  They do it in other written language, so they should find it useful in code too.  
    
    In programming there are three main ways various languages promote grouping of code blocks - bracket/braces, off-side rule, and key words.  Mostly because of Python, maybe a quarter or so of programmers use the off-side rule as their main code grouping method.  This shows that it is useful in programming too, not just wider language.  Key words are not as used as they were when Pascal was taught widely.  But anyway the blocks in Red are more general than the code blocks in Pascal, so you'd end up with "begins" and "ends" instead of brackets - so no improvement.  
    
    In the case of Red, it's not just code that could be grouped more cleanly.  There is less distinction between code and data, so offside blocks would also enable data to be grouped using dot point style and less clutter.  
    
    Because it's an option, people would only use it where they think it makes things clearer.  Code is made by all sorts of writers with all sorts of levels of skill, and the code that gets produced across the whole body of users is whatever occurred to the writers at the time as best.  Most of the time, what people choose is better than the other choices that occurred to them.  So to the extent that it gets used, it would be an improvement.  Just because in many cases someone with more expertise could have produced better code without using tildas than what any particular user did do with tildas, doesn't mean that the code across all users would not be better on average.  
    
    The goal is not to reduce code, although there would likely be some reduction in characters and lines as a consequence.  The goal is more about visually representing the code better by enabling use of wider language layout conventions that have stood the test of time.  
    
    Returning to the example function: 
    ```
    inc: function [n /by x] ~ either x [n + x][n + 1]
    ```
    The '~' here provides a visual distinction of the internal workings of the function from the external usage information without spreading across lines., and it's still a small line.  You can do a one liner with brackets too, but the distinction between key parts is less, and so you probably often wouldn't.  In this case, no big deal either way.  It just shows an option that can be useful, and in many cases would be.  

--------------------------------------------------------------------------------

On 2019-05-24T01:31:39Z, greggirwin, commented:
<https://github.com/red/red/issues/3893#issuecomment-495440729>

    First, thanks so much for the cogent and detailed reply. 
    
    Second, how long have you used Red? And how long have you used Python? 
    
    Whitespace sensitivity can be broadly described as "sensitive to extra whitepsace, beyond what is needed to separate tokens." Red is sensitive to having at least one space between most markers (not all), because of how it uses special characters. But is not sensitive to extra whitespace. Here's where it's a big deal: messaging. When a human is going to process the data, visual layout and formatting matter enormously. We agree there, 100%. But Red was also meant to communicate between people and machines, and inter-machine. There, efficiency matters, and the ability to remove extraneous whitespace can make a big difference.
    
    The main difference in our view is that you say your suggestion will make for cleaner code, and I disagree. Your examples are confusing to me, of course, because I'm used to Red and its design. And while it would be _different_, it wouldn't necessarily be better. The fact that other languages use it is no proof. You could then just as easily say Python should allow curly braces as an option, or C should make semicolons optional. Language design requires a holistic view, and I'm a firm believer in conceptual integrity. 
    
    As an experiment, work up say a dozen examples of code you think would be improved by your suggestion. The community will surely, as I did, offer up idiomatic Red for comparison and give you feedback.

--------------------------------------------------------------------------------

On 2019-05-24T03:15:33Z, androo-L, commented:
<https://github.com/red/red/issues/3893#issuecomment-495457519>

    I've used Python since about 2003.  Forth was the first language I used a lot in the late 1980s and early 1990s.  And from using those two (among other languages), I can see significant benefits in Red.  I haven't done anything with Red other than play with it and read about it.  I'm a novice in that respect, but not a programming novice, and maybe that enables a fresh perspective.  I've seen how Red uses white space, you can't even write an expression without learning it.  
    
    Wherever you would trim white space, you would convert offside blocks to bracketed blocks - transmission, loading, or whatever.  Conceptually, it's a matter of replacing '~' with '[' and popping a ']' on the end.  The conversion is just part of trimming the white space.  Presumably whenever you trim, readability doesn't matter much any more, otherwise you'd want to preserve indentation and line returns.  Any additional white space is there because the author thought it added readability, and any time you remove the readability things you should replace offside blocks too.  
    
    Cleaner and clearer aren't always the same thing.  What I've suggested is almost by definition cleaner, because there's less characters at the end of indentations, but I understand that cleaner doesn't always come across as clearer.  You can loose something when reducing characters.  Clearer is what matters.  
    
    Python has already used curly braces for dictionaries, but who's to say that there aren't some sort of optional improvements that could be made to its appearance?  Same for C.  
    
    As far as I can see, offside blocks are in keeping with Red's concepts.  Blocks are sometimes treated as data, sometimes code, and often a mixture, and there's no interference with that.  If I was saying code blocks should be treated differently to data blocks, and it is common for languages to mark different types of blocks in different ways, then I probably would be mucking with the integrity.  
    
    In terms of conceptual integrity, you might think of my suggestion as more like suggesting that, for big or important blocks, brackets should be lined up vertically with the left edge of the code within them e.g.
    ```
    inc: function [n /by x] 
        [
        either x [n + x][n + 1]
        ]
    ```
    I don't think that''s a good suggestion, just the first example I thought of that affected layout but not concepts.  What I'm suggesting is more than that, but from a language structure point of view it's not hugely more.  It's layout punctuation.  
    
    Is this the place to put the dozen examples?  Anyone reading them would need to have read this discussion too, or else they wouldn't know what they were looking at.  So maybe it is.  I'd probably grab random code bits from the internet and mindlessly apply tildas, because I think it would be a better representation of what happens across a variety of programmers.  I think what matters more is any improvement in the examples, rather than different ways of arranging the blocks or code that the authors of the code didn't think of. 

--------------------------------------------------------------------------------

On 2019-05-24T05:53:49Z, greggirwin, commented:
<https://github.com/red/red/issues/3893#issuecomment-495481736>

    I'd put the examples in a gist, and point to that, and this ticket, from Gitter chat. I still think that's a good thing to do, but I'll also ask that you actually _use_ Red for some time first. Enough that you feel comfortable with it, which may take a bit, given your long history with Python. It would be like me going the other way.

--------------------------------------------------------------------------------

On 2019-05-24T06:25:48Z, androo-L, commented:
<https://github.com/red/red/issues/3893#issuecomment-495488299>

    Thanks.  I'll close this issue, and see how I go.  
    
    I think you'd be fine going the other way.  

