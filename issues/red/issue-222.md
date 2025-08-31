
#222: 11: float stack check when expression follows value setting from struct!
================================================================================
Issue is closed, was reported by rebolek and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/222>

Certain conditions must be met to trigger this bug. Value must in struct!, must be set to pointer! at least twice and must be followed by an expression. See the example code:

```
s: declare struct! [value [float!]]
s/value: 1.0
a: as pointer! [float!] allocate 100 * size? float!
a/1: s/value    ; value must be in struct!
a/1: s/value    ; must be done twice
1 + 1           ; must be followed by an expression
```



Comments:
--------------------------------------------------------------------------------

On 2012-07-24T12:35:26Z, dockimbel, commented:
<https://github.com/red/red/issues/222#issuecomment-7205641>

    Thanks for taking the time to find out and report the complex use case!

--------------------------------------------------------------------------------

On 2012-07-24T13:18:22Z, rebolek, commented:
<https://github.com/red/red/issues/222#issuecomment-7206615>

    No problem. I have certain goal and I'm just describing problems I met implementing that goal :)

--------------------------------------------------------------------------------

On 2012-07-24T14:08:08Z, rebolek, commented:
<https://github.com/red/red/issues/222#issuecomment-7207939>

    Above code seems to work with latest update, so try replacing [1 + 1] with [1.0 + 1.0] or with [ if true [a/1: s/value] ].

