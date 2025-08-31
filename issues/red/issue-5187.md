
#5187: TO-WORD crashes on argument containing only high codepoint spaces
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5187>

**Describe the bug**
High codepoints recognized as spaces by the lexer can crash `to-word` if runtime has been compiled in debug mode.

**To reproduce**
```
to-word form #"^(202F)"
```
results in:
```
*** Runtime Error 98: assertion failed
*** in file: /c/dev/Red/runtime/hashtable.reds
*** at line: 269
***
***   stack: red/murmur3-x86-32 03079E78h 0
***   stack: red/_hashtable/put-symbol 051B3864h 04893E13h 0 false
***   stack: red/symbol/make-alt-utf8 04893E13h 0
***   stack: red/lexer/load-word 00EFFA4Ch 04893E13h 04893E13h 1073741824 true
***   stack: red/lexer/scan-tokens 00EFFA4Ch true false
***   stack: red/lexer/scan 04884444h 04893E10h 3 true true true true 00EFFB70h 00000000h 04884454h 00000000h
***   stack: red/lexer/scan-alt 04884444h 04884454h 3 true true true true 00EFFB70h 00000000h 00000000h
***   stack: red/load-single-value 04884454h 04884444h
***   stack: red/load-value 04884454h
***   stack: red/word/to 04884444h 04884454h 15
***   stack: red/actions/to 04884444h 04884454h
***   stack: red/actions/to*
***   stack: to-word
``` 

**Expected behavior**
An error, if the input is considered empty.

**Platform version**
All.




