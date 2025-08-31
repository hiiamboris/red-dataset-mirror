
#625: Compiler lexer doesn't support lowercase hex characters
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/625>

```
Red []

probe #"^(1F)"
probe "^(1f)"
```
# ""

"^^(1f)"

```
Red []

probe #"^(1f)"
```

-=== Red Compiler 0.4.1 ===- 

**\* Syntax Error: Invalid char! value
**\* line: 3
**\* at: {#"^^(1f)"}

REBOL:

> > # "^(1F)"
> > 
> > `== #"^_"`
> > # "^(1f)"
> > 
> > `== #"^_"`



Comments:
--------------------------------------------------------------------------------

On 2013-12-23T14:30:00Z, dockimbel, commented:
<https://github.com/red/red/issues/625#issuecomment-31121634>

    Should be an easy fix, I'm leaving it to others to send a PR to fix it. ;-)

