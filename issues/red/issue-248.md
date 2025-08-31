
#248: Rename property? accessors to *-of convention
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
[status.built] [type.wish]
<https://github.com/red/red/issues/248>

During the design of REBOL 3 there was a big discussion about the naming of the property accessing functions. In R2 there weren't that many: length?, size?, type? and such. In R3 there are a lot more, and it becomes annoying to sprinkle code with question marks, because that's not how they're used in human language.

It was finally decided to name new property functions words-of, body-of and such. This clearly signals an action on an entity. The ? sigil is now reserved for functions that return a logic! value (or variables that hold a logic! value), which signals a decision question.

Since Red is not completely REBOL compatible anyway, we have a unique opportunity now to make this consistent in Red. I propose renaming length? and size? to length-of and size-of in Red/System. In Red, length? and index? are currently planned in boot.red, which would become length-of and index-of.



Comments:
--------------------------------------------------------------------------------

On 2012-09-15T16:50:36Z, earl, commented:
<https://github.com/red/red/issues/248#issuecomment-8586399>

    +1

--------------------------------------------------------------------------------

On 2012-09-16T16:53:43Z, dockimbel, commented:
<https://github.com/red/red/issues/248#issuecomment-8596494>

    After reading all the related tickets on Curecode, I think I agree, even if my fingers are telling me to do otherwise (12 years of typing `length?` and `type?` habit is no easy to change), and I will apply the proposed changes.

--------------------------------------------------------------------------------

On 2012-09-16T23:34:13Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/248#issuecomment-8601650>

    Thanks, but it's not changed in Red/System yet.

