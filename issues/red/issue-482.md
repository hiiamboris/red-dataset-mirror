
#482: Interpreter uses first compiled function, instead of last
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/482>

```
Red []

prin: does [
    print "My prin"
]
prin newline
do [prin newline]
f: does [
    print "f1"
]
f: does [
    print "f2"
]
f
do [f]
```

My prin

f2
f1



Comments:
--------------------------------------------------------------------------------

On 2013-06-05T16:56:12Z, dockimbel, commented:
<https://github.com/red/red/issues/482#issuecomment-18991507>

    In which branch have you tested that? It would be helpful if you could each time indicate the branch of your tests when there's more than one active branch in the Red repo.

--------------------------------------------------------------------------------

On 2013-06-05T22:31:28Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/482#issuecomment-19013641>

    I usually do that when it's important. My guess is that this applies to all current branches. I'm not sure I tested that at the time.

