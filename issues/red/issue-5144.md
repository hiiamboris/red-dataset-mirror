
#5144: CRASH when resetting any face
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/5144>

**Describe the bug**
Run this:
```
f: make face! []
set f none
print mold/all f
```
Output:
```
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/datatypes/common.reds
*** at line: 100
***
***   stack: red/copy-cell 00000000h 049BC6BCh
***   stack: red/stack/push 00000000h
***   stack: red/object/fire-on-set 049BC66Ch 05660EE0h 049BC68Ch 00000000h
***   stack: red/object/set-many 049BC66Ch 049BC67Ch false false false
***   stack: red/natives/set* false -1 -1 -1 -1
***   stack: red/interpreter/eval-arguments 049BC65Ch 0565A848h 0565A878h 049BC63Ch 00000000h 00000000h 04ABFF08h
***   stack: red/interpreter/eval-code 04ABFF08h 0565A828h 0565A878h 049BC63Ch false 00000000h 00000000h 04ABFF08h
***   stack: red/interpreter/eval-expression 0565A828h 0565A878h 049BC63Ch false false false
***   stack: red/interpreter/eval 049BC63Ch true
***   stack: red/natives/catch* true 1
***   stack: ctx||559~try-do 04C81A60h
***   stack: ctx||559~launch 04C81A60h
***   stack: ctx||578~launch 04C81474h
```

**Expected behavior**

Manual setting works:
```
f: make face! []
foreach w words-of f [set-quiet w none]
print mold/all f
```
Output:
```
make object! [
    type: #[none]
    offset: #[none]
    size: #[none]
    text: #[none]
    image: #[none]
    color: #[none]
    menu: #[none]
    data: #[none]
    enabled?: #[none]
    visible?: #[none]
    selected: #[none]
    flags: #[none]
    options: #[none]
    parent: #[none]
    pane: #[none]
    state: #[none]
    rate: #[none]
    edge: #[none]
    para: #[none]
    font: #[none]
    actors: #[none]
    extra: #[none]
    draw: #[none]
    on-change*: #[none]
    on-deep-change*: #[none]
]
```

**Platform version**
```
Red 0.6.4 for Windows built 15-May-2022/2:37:39+03:00  commit #2b72c44
```



