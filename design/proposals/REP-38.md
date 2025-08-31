
#38: WISH: Control over compiler warnings and more consistency
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
<https://github.com/red/REP/issues/38>

There are two opposite strategies of initializing a value.

1) Fill it with zeroes, as `declare` function does. However when a structure or any other value is allocated on the stack, it's not being initialized, and the programmer *may* forget about it. Compiler should be able to detect this scenario and complain instead of outputting junk:
```
s!: alias struct! [a [integer!] b [integer!]]
f: func [/local x [s! value]] [ print-wide [x/a x/b] ]
f
```
output:
```
1638252 1
```

2) Let some other facility (internal or external, like memset() or an OS call) fill the structure. In this case it's best if compiler did not complain, otherwise to suppress it an unnecessary `declare!` invocation is required.
```
s!: alias struct! [a [integer!] b [integer!]]
g: func [x [s!]] [x: declare s!]
f: func [/local x [s!]] [g x]
f
```
output:
```
*** Compilation Error: local variable x used before being initialized!
*** in file: %/D/devel/red/red-src/red/2.reds
*** in function: f
*** at line: 4
*** near: [x]
```

Both scenarios are valid. I wish:
- compiler could always warn on the usage of non-declared memory area
- but allowed to flag specific words as an exclusion, like this: `f: func [/local x [type! undeclared]] []` or `f: func [/local x [struct! [...] value undeclared]] []` - this way would ensure that the programmer knows what he's doing

Discussion: :point_up: [December 19, 2018 8:03 AM](https://gitter.im/red/bugs?at=5c19d10c9c82bd0240383ca4)

See also https://github.com/red/red/issues/3047


