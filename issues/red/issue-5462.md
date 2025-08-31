
#5462: [Compiler] *** Red Compiler Internal Error: Script Error : Out of range or past end
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [type.compiler]
<https://github.com/red/red/issues/5462>

**Before submitting**

Pops up when compiling this file: 
```
Red [] probe [##]
```
Result:
```
*** Red Compiler Internal Error: Script Error : Out of range or past end 
*** Where: percent-value? 
*** Near:  [forall blk [
if multi-line? [nl?: new-line? blk] 
item: blk/1 
either any-block? :item [
either with [
emit-block/sub/with :item main-ctx
] [
emit-block/sub :item
]
] [
emit?: case [
issue? :item [
case [
unicode-char? :item [
emit-char to integer! next item 
no
] 
tuple-value? :item [
emit-tuple item 
no
] 
percent-value? :item [
emit-percent item 
no
] 
float-special? :item [
emit-fp-special item 
no
] 
money-value? :item [
emit-money item 
no
] 
ref-value? :item [
emit-string next item 
no
] 
type-value? :item [
emit-datatype get-RS-type-ID/word to-word form skip item 2 
no
] 
'else [
emit-issue item 
no
]
]
] 
any-word? :item [
ctx: main-ctx 
value: :item 
either all [with local-word? to word! :item] [
idx: get-word-index/with to word! :item main-ctx
] [
if binding: find-binding :item [
set [ctx idx] binding
]
] 
yes
] 
'else [yes]
] 
if emit? [
switch type?/word get/any 'item [
word! 
set-word! 
lit-word! 
refinement! 
get-word! [emit-word :item ctx idx] 
file! 
url! 
tag! 
email! 
string! 
binary! [emit-string item] 
integer! [emit-integer item] 
decimal! [emit-float item] 
char! [emit-char to integer! item] 
pair! [emit-pair item] 
datatype! [emit-datatype get-RS-type-ID/word item] 
logic! [emit-logic item] 
time! [emit-time item] 
date! [emit-date item] 
none! [emit-none] 
unset! [emit-unset]
]
]
]
] 
nl?: no
] 

```

**Expected behavior**

Issue `##` is kept in Red code. It's useful as a poor man's `mold/all` syntax.

**Platform version**
```
Red 0.6.4 for Windows built 30-Dec-2023/17:13:04+03:00  commit #f8f2559
```


