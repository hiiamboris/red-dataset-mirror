
#2346: Runtime crash on doing block!, paren! that include func's /local assigning
================================================================================
Issue is closed, was reported by ifgem and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2346>

```
do compile
```
```
compile: func [/local _list_] [
	to block! [
		_list_: 10
	]
]
```
```
compile: func [/local _list_] [
	to paren! [
		_list_: 10
	]
]
```


Comments:
--------------------------------------------------------------------------------

On 2016-11-22T09:36:44Z, meijeru, commented:
<https://github.com/red/red/issues/2346#issuecomment-262191764>

    Have you tried changing the name of the function?

--------------------------------------------------------------------------------

On 2016-11-22T09:59:21Z, dockimbel, commented:
<https://github.com/red/red/issues/2346#issuecomment-262197008>

    Functions in Red by default are not closures, so you need to rather use a `context` for that (until we implement the `closure!` type).
    
    The above code should return an error instead of silently crashing.

--------------------------------------------------------------------------------

On 2017-02-20T16:02:23Z, dockimbel, commented:
<https://github.com/red/red/issues/2346#issuecomment-281116872>

    Now you will get a proper `"word is not bound to a context"` error, because you are trying to evaluate a word bound to a function which has returned (no indefinite extent support yet).

