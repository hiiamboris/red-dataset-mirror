
#737: Change PRINT to REPRINT to more clearly show that it reduces input
================================================================================
Issue is closed, was reported by hostilefork and has 8 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/737>

It's confusing that PRINT reduces its input without the RE prefix in its name.

Currently:

```
>> print [1 + 2]
3
```

Expected:

```
>> print [1 + 2]
1 + 2
```

REPRINT is a _clear_ and _obvious_ name that any native English speaker would read code and not possibly think it was written by crackpots.  So that's what should be used instead:

```
>> reprint [1 + 2]
3
```

This would canonize REPRINT into the pantheon of other clearly-named functions like REFORM, REMOLD, and REJOIN.

_(Note: If one were to be purely technical about matters, a better name might be REFORMPRINT.  But maybe that would just be silly.)_



Comments:
--------------------------------------------------------------------------------

On 2014-03-27T11:22:38Z, hostilefork, commented:
<https://github.com/red/red/issues/737#issuecomment-38791564>

    Hm... _on second thought_... maybe this is kind of a lousy idea.  **Maybe** it's actually the other functions that have bad names and bad design?  Could Red--a _new language_ with its own identity and no obligation to repeat the mistakes of the past--do better?
    
    ```
    >> join [1 + 2]
    == "3"
    
    >> join/only [1 + 2]
    == "1+2"
    
    >>> adjoin 1 2
    == "12"
    ```
    
    > I know my opinion doesn't mean much, but "because language x that we make no claim to be compatible with doesn't do this we won't either" is never a valid reason. It's not so much that he is against making func safe or having multiline comments that bothers me. It would be perfectly fine if there was a valid reason for it, but when you are defining a new language, that is the time to think about these design choices logically and decide what the best choice really is.
    > I'm not saying the goal should be to please everyone, but the goal should be to have it be the best it possibly can. If you don't plan things out before hand you get something like batch scripting that evolved with use, and is utterly complicated
    > --[New User @kennycoc](http://chat.stackoverflow.com/transcript/291?m=15457704#15457704)
    
    ...
    
    > The automatically protecting function constructor is a rather interesting idea. I would really encourage you, to experiment with that for a while (PFUNCTION/PFUNC?), and see how it turns out.
    > --[Old User @earl](http://chat.stackoverflow.com/transcript/291?m=15450807#15450807)

--------------------------------------------------------------------------------

On 2014-03-28T16:22:34Z, dockimbel, commented:
<https://github.com/red/red/issues/737#issuecomment-38938286>

    PRINT => REPRINT: no, never, over my dead body. I guess it is clear enough like that or should I create a new `type.troll` tag specially for this post and totally unrelated out-of-context quotes? 
    :-)

--------------------------------------------------------------------------------

On 2014-03-28T16:29:46Z, hostilefork, commented:
<https://github.com/red/red/issues/737#issuecomment-38939135>

    I was just kidding (of course), but I wasn't kidding about feeling we have to have an out of the box answer to something better than REJOIN.
    
    The new suggestion is to leave REJOIN alone and create a new, none-ignoring COMBINE.
    
    ```
    >> combine ["abc" if false ["def"] "ghi"]
    == "abcghi"
    ```
    
    It would also free rejoin to keep working as it does under its bizarre logic and keep its bizarre name for those who want it:
    
    ```
    >> rejoin [<foo>"bar"</foo>]
    == <foobar</foo>>
    
    >> combine [<foo>"bar"</foo>]
    == "<foo>bar</foo>"
    ```
    
    This decay of tag to string seems sensible, as for instance:
    
    ```
    >> parse "<foo>bar</foo>" [<foo> "bar" </foo>]
    == true
    ```
    
    Basically, I think it has turned out we can have our cake and eat it too here.  That tag example for REJOIN _might_ have been what you wanted--who's to say?  If it was then use it.  And @BrianH says from experience that ignoring NONE in generalized code for blocks is often not what _he_ wants (though I want it a lot).  It seems best that we give people the option.  What I like is that COMBINE can be taught early and make sense in a teaching progression, and then REJOIN reserved for "expert use".
    
    I'm sorry for trolling you but I think it's critical to think about these things; many programmers (we hope/assume it'd be many) will be affected  by small oversights.  As you say, it's not what you should be worrying about... it should be the rest of us worrying about it... but I hope once we have thought about it, that the leadership coming from the top is firm on _best ideas win_ and not to insist all existing warts be kept for the sake of tradition...!

--------------------------------------------------------------------------------

On 2014-03-28T16:46:30Z, dockimbel, commented:
<https://github.com/red/red/issues/737#issuecomment-38941068>

    _As you say, it's not what you should be worrying about... it should be the rest of us worrying about it..._ 
    
    Stop trolling, really, this starts to be really boring. I never said that. I said that I don't have time to process minor points like that right now, and that, instead of throwing at me random propositions resuting from a few minutes of thinking, if people were doing their homework by studying deeply each issue and coming with the whole picture and all available options, that would be much more helpful to me.

