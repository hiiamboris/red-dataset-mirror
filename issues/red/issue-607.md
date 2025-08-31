
#607: SET-WORD other than RETURN: does not raise error in function specs
================================================================================
Issue is closed, was reported by hostilefork and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/607>

Accidentally had copied some code containing set-words into a parameter list, was confused by the behavior until I noticed why:

```
foo: function [x: [integer!] y [string!] z: [block!]] [
    print mold x
    print mold y
    print mold z
]

foo 10 "Hello" [a b c]
```

The call executes instead of giving an error at the time `foo` is declared:

```
*** Error: word has no value!
unset
10
*** Error: word has no value!
unset
== [a b c]
```

By contrast, Rebol gives:

```
** Script error: invalid function definition: x:
** Where: make function
** Near: make function! reduce [spec body]
```

Seen in "0.4.1, 13-Dec-2013/23:19:35-5:00"



