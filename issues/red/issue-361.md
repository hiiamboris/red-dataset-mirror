
#361: Discovery: words can be defined as operators (unlike in Rebol)
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.reviewed]
<https://github.com/red/red/issues/361>

As a counterpart to the redefinition of existing operators (see previous issue) I discovered that words can be simply redefined to be operators and be analyzed correctly as infix.

```
**: make op! :power
2 ** 3 ; it works!
```

Since `power` has not been implemented in the datatype actions, "it works" means the correct Red/System code is generated.

Rebol 3 has apparently not seen fit to allow this ;-)

There is of course a downside: it is possible to redefine, e.g, equality

```
=: make op! :not-equal?
```

so one could forbid redefinition of existing operators



Comments:
--------------------------------------------------------------------------------

On 2013-01-02T14:44:40Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/361#issuecomment-11810112>

    Why would you want to forbid that in a REBOL like language? I think it's a feature.

--------------------------------------------------------------------------------

On 2013-01-02T15:41:47Z, meijeru, commented:
<https://github.com/red/red/issues/361#issuecomment-11812026>

    I don't want to forbid it myself, just think it needs a biggish warning. OTOH, intrinsics (sub-class of natives) may not be redefined in Red, although they may be in Rebol. So there is already a discrepancy, the other way around.

--------------------------------------------------------------------------------

On 2013-01-02T16:29:25Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/361#issuecomment-11813943>

    I think intrinsics are temporary, until the JIT compiler. They're already being made dynamic for the interpreter.

--------------------------------------------------------------------------------

On 2014-04-27T09:42:43Z, dockimbel, commented:
<https://github.com/red/red/issues/361#issuecomment-41492279>

    Allowing to overload or redefine any word is part of Rebol flexibility. Red is currently lagging behind for the compiler intrinsic words that need to be processed as keywords. The future JIT ability for the compiler should help us get that flexibility back (but not garanteed, as AOT-compiled code cannot be changed, so the conditions where such redefinition would be possible might be limited).

