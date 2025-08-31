
#389: switch/default broken
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/389>

```
Red []

switch/default 1 [
    2 [
        print 2
    ]
][
    print "default"
]
```

Nothing is printed.



Comments:
--------------------------------------------------------------------------------

On 2013-01-22T23:17:37Z, dockimbel, commented:
<https://github.com/red/red/issues/389#issuecomment-12572612>

    I get `default` printed here.

--------------------------------------------------------------------------------

On 2013-01-22T23:37:08Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/389#issuecomment-12573309>

    Odd. I had some more test cases behind it. When I remove those, it starts working. If any other code follows the switch, it breaks.

