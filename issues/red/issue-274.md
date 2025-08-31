
#274: Inlined PRINT broken
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/274>

```
Red []

#system-global [
    print ["Symptom of the universe: " 42]
]
```

bash-4.0# ./test
Symptom of the universe: 625

When I inline the Fibonacci example, the resulting function value prints blank. This was working a few weeks ago, at Software Freedom Day.



Comments:
--------------------------------------------------------------------------------

On 2012-10-11T14:24:46Z, dockimbel, commented:
<https://github.com/red/red/issues/274#issuecomment-9341705>

    I wonder where that 625 came from? :-)

--------------------------------------------------------------------------------

On 2012-10-15T22:20:59Z, dockimbel, commented:
<https://github.com/red/red/issues/274#issuecomment-9464079>

    Untested on Syllable.

