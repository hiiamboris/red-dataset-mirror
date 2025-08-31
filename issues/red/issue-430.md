
#430: FORM block! should suppress spacing on empty elements
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 16 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/430>

```
form ["" [] x]
```

"  x"

REBOL:

"x"



Comments:
--------------------------------------------------------------------------------

On 2013-03-13T22:09:41Z, dockimbel, commented:
<https://github.com/red/red/issues/430#issuecomment-14871851>

    Actually, the issue is a bit more complex to solve than it seems, as both R2 and R3 are inconsistent in the way they FORM empty series:
    
    ```
    >> form [[] [a] [] [a] []]
    == "a  a "
    ```
    
    _Notice the two spaces between the a_
    
    I'm not sure what we should do, my current un-published fix will produce `"a a "` (only one space between the a). It is a bit more consistent, but would break compatibility with R2/R3. What do you think?

--------------------------------------------------------------------------------

On 2013-03-13T22:36:27Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/430#issuecomment-14873138>

    Hm, it seems to me that it's most usable to suppress extra spacing consistently.

--------------------------------------------------------------------------------

On 2013-03-13T22:39:01Z, dockimbel, commented:
<https://github.com/red/red/issues/430#issuecomment-14873244>

    The last extra space might be useful though as FORM is supposed to make it nicely readable by separating values by a space, so the ending one allows to output or concatenate FORMed values without having to manually add an extra space between them each time. So, I would stick with "one space after" only rule.

--------------------------------------------------------------------------------

On 2013-03-13T22:43:23Z, dockimbel, commented:
<https://github.com/red/red/issues/430#issuecomment-14873425>

    I've pushed my pending fix ("one space after" only for empty series). I'll keep this ticket open a few days in case we've missed something.

--------------------------------------------------------------------------------

On 2013-03-14T00:28:55Z, BrianHawley, commented:
<https://github.com/red/red/issues/430#issuecomment-14877398>

    FORM is one of those weird, not-well-defined functions. It's meant for user display, so its results aren't really supposed to be very semantically consistent. Given that interpretation of FORM, and that `"" = form []` probably makes sense, I think that when FORM finds an empty block in another block it should just pretend it didn't see anything and move on, and the same should go for for other empty series like `""` that don't have any decoration added when they're formed. I guess we FORM empty tags as `"<>"`, so we shouldn't pretend empty tags don't exist when we see them in a block, but we should just ignore the series types that don't FORM on their own with decoration.
    
    I guess that means suppressing extra spaces that might arise if you treat it as if there were a value there. That goes for leading spaces if `""` or `[]` were at the beginning of the FORM block, and trailing spaces if they're at the end, skip those too. Just pretend that anything that directly forms as `""` just isn't there at all, even nested. Does that make sense? That would mean this: `"a a" = form [[""] [a] [] [a] [[[]]]]`
    
    This would go for R3 as well, of course, if it needs changing then we should change that too. R2 compatibility should be irrelevant for Red once it's properly bootstrapped, so it doesn't matter what it does.

--------------------------------------------------------------------------------

On 2013-03-14T00:36:23Z, dockimbel, commented:
<https://github.com/red/red/issues/430#issuecomment-14877646>

    Thanks Brian. I guess we all agree on this one.

--------------------------------------------------------------------------------

On 2013-03-14T14:45:16Z, dockimbel, commented:
<https://github.com/red/red/issues/430#issuecomment-14906061>

    After you comment and a few more thinking about it, I guess not emitting tail spaces would be more consistent and helpful to users than leaving one at tail. I will change FORM accordingly and close this ticket.

--------------------------------------------------------------------------------

On 2013-03-14T15:02:23Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/430#issuecomment-14907091>

    I agree, I hate invisible superfluous spaces at the ends of lines.

