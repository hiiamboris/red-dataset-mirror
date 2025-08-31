
#1795: Break doesn't work with any of loop commands: loop, while, repeat, foreach, forall
================================================================================
Issue is closed, was reported by Zamlox and has 4 comment(s).
<https://github.com/red/red/issues/1795>

Trying to use break in a loop it will close the console with following message:
`--== Red 0.6.0 ==--
Type HELP for starting information.

**\* Throw error: no loop to break
**\* Where: break`

Example:
`
a: "hello world"
forall a [break]
`



Comments:
--------------------------------------------------------------------------------

On 2016-04-06T14:12:14Z, ghost, commented:
<https://github.com/red/red/issues/1795#issuecomment-206390521>

    @Zamlox https://github.com/red/red/issues/1741

--------------------------------------------------------------------------------

On 2016-04-06T15:07:27Z, Zamlox, commented:
<https://github.com/red/red/issues/1795#issuecomment-206418770>

    Already reported as nc-x mentioned above

