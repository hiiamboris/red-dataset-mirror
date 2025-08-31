
#218: Support /* */ comments
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[type.wish] [status.reviewed]
<https://github.com/red/red/issues/218>

Red/System currently has no "self-documenting" features. I'm sure adding them will take some time and effort that could be better spent elsewhere. If Red/System supported /\* */ comments, language independent self-documentors such as YUIDoc could be used to produce documentation.

Whilst not ideal, I think this would be a good compromise in the short term. If you are happy to include this in the language, I will look at the code changes needed.



Comments:
--------------------------------------------------------------------------------

On 2012-07-14T13:04:40Z, dockimbel, commented:
<https://github.com/red/red/issues/218#issuecomment-6982767>

    Why not use the same "self-documenting" conventions as in REBOL? (I was planning to add them to Red too)

--------------------------------------------------------------------------------

On 2012-07-14T13:27:35Z, PeterWAWood, commented:
<https://github.com/red/red/issues/218#issuecomment-6982911>

    That would be ideal, with a couple of additions (especially being able to give some information about the returned value). I could probably do something standalone but it may be a while before I have the time to do so.
    
    I was looking for a shortcut to get something finished. There is a simple workaround that I overlooked to use /\* */ comments within a multiline comment [comment {}].

