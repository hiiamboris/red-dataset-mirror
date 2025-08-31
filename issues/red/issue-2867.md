
#2867: Compiler crash with custom function shortcuts
================================================================================
Issue is open, was reported by 9214 and has 0 comment(s).
[type.compiler]
<https://github.com/red/red/issues/2867>

Following code:
```Red
&: :and
|: :or
~: :complement

print ~ 100 & 200 | 300
```
Interpreted:
```Red
-365
```
Compiled:
```Red
*** Compilation Error: invalid path value: ops/&*
*** in file: %<snip>
*** at line: 332
*** near: [
    integer/push 200
    ops/&*
    stack/unwind
    integer/push 300
    ops/|*
    stack/unwind
]
```
Possible workaround:
- rebind block of code
```Red
&: :and
|: :or
~: :complement

do bind [print ~ 100 & 200 | 300] system/words
```
- use `set/get` syntax
```Red
set '& get 'and
set '| get 'or
set '~ get 'complement

print ~ 100 & 200 | 300
```


