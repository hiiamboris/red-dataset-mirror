
#434: Double unset! warning
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 8 comment(s).
[status.reviewed]
<https://github.com/red/red/issues/434>

red>> x
**\* Error: word has no value!
**\* Error: word has no value!



Comments:
--------------------------------------------------------------------------------

On 2013-03-18T22:58:00Z, dockimbel, commented:
<https://github.com/red/red/issues/434#issuecomment-15087555>

    This is normal as errors are not halting the execution of the console. Either we keep it like that or we make it HALT on first error occurence?

--------------------------------------------------------------------------------

On 2013-03-18T23:00:28Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/434#issuecomment-15087645>

    Fair enough. It's just that it didn't do this before.

--------------------------------------------------------------------------------

On 2013-03-20T03:55:29Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/434#issuecomment-15157212>

    The extra warning is caused by the result assignment in the console code. It can be avoided by using set/any.

--------------------------------------------------------------------------------

On 2013-03-20T13:14:34Z, dockimbel, commented:
<https://github.com/red/red/issues/434#issuecomment-15174820>

    Thanks, will change that in console.red code.

