
#4678: [Parse] lexer-related crash during matching by datatype in binary mode
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4678>

**Describe the bug**
After the new lexer was introduced, `parse` acquired the power to match `binary!` content by datatype, thus recognizing literal forms of values and simplifying the parsing tasks in general cases:
```red
>> parse to binary! "call 911 in case of emergency" [word! integer! 4 any-word!]
== true
```

However, attempts to match by any datatype unclosed opening delimiters of `block!`, `paren!` and `map!` result in a crash.

**To reproduce**
Any of the lines below:
```red
parse to binary! "["  [none!]
parse to binary! "("  [none!]
parse to binary! "#(" [none!]
```
Results in:
```red
*** Runtime Error 1: access violation
*** in file: .../red/runtime/lexer.reds
*** at line: 2318
***
***   stack: red/lexer/scan 00000000h 031BA928h 2 true true false false 0019FAECh 00000000h 00000000h 00000000h
***   stack: red/parser/match-datatype? 02E48AC0h 02DEFAF8h 1
***   stack: red/parser/process 02E48AC0h 02C8A3F4h 0 0 02C8A3D4h
***   stack: red/natives/parse* false -1 0 -1
```

Note that it's not the character alone that causes the crash, but rather it "hinting" at the presence of value with specific datatype, and then failing to match its literal form in full. E.g. in case of a `paren!`:
```red
parse to binary! "(,)" [none!]
````

**Expected behavior**
`parse` returns `false` in the examples above; no crash.

**Platform version**
052377f, W10.



