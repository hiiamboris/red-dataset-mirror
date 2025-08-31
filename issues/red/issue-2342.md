
#2342: do/next with wrong argument gives confusing error message
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2342>

The argument to the `/next` refinement (called `position`) should be a `word!` value. If one provides a non-word value, the error message refers to the *other* refinement.
```
red>> inp: [1 + 2 3 + 4]
== [1 + 2 3 + 4]
red>> do/next inp inp
*** Script Error: do does not allow block! for its /args argument
*** Where: do
red>> do/next inp 'inp ; this is correct
== 3
red>> inp
== [3 + 4]
```



