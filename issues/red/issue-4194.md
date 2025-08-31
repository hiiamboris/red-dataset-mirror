
#4194: [Parse] matching VECTOR! with INTO
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4194>

**Describe the bug**

`parse` accepts any `series!` value as its first argument, except for `vector!` and `image!`. However, it is possible (to some extent) to match content of `vector!` value with `into` rule.

**To reproduce**

```red
>> parse reduce [make vector! [1 2 3]][into [mark: (probe mark) 2 skip mark: (probe mark) to end]]
make vector! [1 2 3]
make vector! [3]
== true
```

It's not possible to match by datatype, because `vector!` does not contain Red value slots, hence its elements don't have datatype in a strict sense.

```red
>> parse reduce [make vector! [1 2 3]][into [3 integer!]]
== false
```

Attempt to match by literal value results in segfault.

```red
v: make vector! [1.0]
parse reduce [v][into [1.0]]
```
```
*** Runtime Error 1: access violation
*** in file: .../red/runtime/datatypes/string.reds
*** at line: 1067
***
***   stack: red/string/concatenate-literal-part 027E2C84h 00ACF000h 11211137
***   stack: red/datatype/mold 030842B0h 027E2C84h false false true 00000000h 0 0
***   stack: red/actions/mold 030842B0h 027E2C84h false false true 00000000h 0 0
***   stack: red/error/reduce 027E2C64h 02C817F0h
***   stack: red/error/form 02C817F0h 027E2C54h 027E2C34h -18
***   stack: red/actions/form 02C817F0h 027E2C54h 027E2C34h 0
***   stack: red/block/form 027E2C44h 027E2C54h 027E2C34h 0
***   stack: red/actions/form 027E2C44h 027E2C54h 027E2C34h 0
***   stack: red/actions/form* -1
***   stack: red/natives/do-print true true
***   stack: red/natives/print* true
***   stack: ctx||504~do-command 027A0508h
***   stack: ctx||504~eval-command 027A0508h
***   stack: ctx||504~run 027A0508h
***   stack: ctx||504~launch 027A0508h
***   stack: ctx||536~launch 0279F7C4h
```

Attempt to extract a match either gives `unset!` (this is how a bunch of `null` bytes seems to be boxed) or results in the same segfault at `probe`ing:

```red
>> parse reduce [make vector! [1]][into [set x skip (probe x)]]
unset!
>> v: make vector! [integer! 8 1]
== make vector! [0]
>> parse reduce [v][into [set x skip (probe x)]]
<kaboom>
```

**Expected behavior**

I don't have any specific expectations, and honestly cannot come up with use-cases for that. The question is if it is intended behavior in the first place - access violations tell me that it's not.

**Platform version**

The latest build, all platforms.


