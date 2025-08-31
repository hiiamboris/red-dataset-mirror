
#1170: Problems with redefined native 
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/1170>

See below
`red>> z: :print`
`== make native! [...]`
`red>> print: 3`
`red>> print`
`red>>` ; should be `3`
`red>> z print`
`3` ; correct

Reported under OSX and Windows



Comments:
--------------------------------------------------------------------------------

On 2015-05-28T04:56:42Z, dockimbel, commented:
<https://github.com/red/red/issues/1170#issuecomment-106171782>

    The console code is written in Red itself, partly compiled, partly interpreted. If you redefine `print`, do not expect the console to still be able to have a correct output anymore. :-)
    
    See the relevant code [here](https://github.com/red/red/blob/master/environment/console/console.red#L114).

--------------------------------------------------------------------------------

On 2015-05-29T07:44:01Z, meijeru, commented:
<https://github.com/red/red/issues/1170#issuecomment-106730078>

    Fair enough. Merits a warning, perhaps, in the documentation.

--------------------------------------------------------------------------------

On 2015-05-29T08:28:41Z, dockimbel, commented:
<https://github.com/red/red/issues/1170#issuecomment-106743859>

    There will be a big one, warning users from redefining core functions. Moreover, this is a case that the compiler reports as an error if someone attempts to redefine one of the core functions which are processed as [keywords](https://github.com/red/red/blob/master/compiler.r#L77) by the compiler.

