
#3383: return spec of DIFFERENCE omits time!
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/3383>

### Expected behavior

`spec-of :difference` should contain `return: [block! hash! string! bitset! typeset! time!]`
since the difference between two `date!` values is a `time!` value.

### Actual behavior

it contains `return: [block! hash! string! bitset! typeset!]`

Note that the operation of `difference` is correct, it is just the spec that is defective.
Note also that `difference` on dates means something else than `subtract` or `-`, since those two (an action and the corresponding op) yield an integer value, namely the number of days, ignoring any time components
### Steps to reproduce the problem

execute above code
### Red and platform version
```
any
```


