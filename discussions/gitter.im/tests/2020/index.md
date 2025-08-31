# Archived messages from: [gitter.im/red/tests](/gitter.im/red/tests/) from year: 2020

## Monday 24th February, 2020

loziniak

[11:09](#msg5e53aeffe40da4526f0fb72d)Hi! How can I run `regression-test-red.red`? When I execute command `./rebol -s quick-test/run-test.r tests/source/units/regression-test-red.red` I get:

```
-=== Red Compiler 0.6.4 ===- 

Compiling /mnt/red-github/tests/source/units/regression-test-red.red ...
...using libRedRT built on 10-Dec-2019/13:23:41+1:00
...compilation time : 142 ms

Target: Linux 

Compiling to native code...
*** Compilation Error: undefined symbol: red/word/duplicate 
*** in file: %/mnt/red-github/tests/source/units/regression-test-red.red 
*** at line: 339 
*** near: [word/duplicate ~script 
    ~args|408: word/duplicate ~args 
    ~qt-run-tests: word/load "qt-run-tests"
]
```

[11:13](#msg5e53afce476ff13c43aed19d)I want to test my test ;-)

hiiamboris

[12:07](#msg5e53bc6a476ff13c43aefe04)you can just compile the file or compile the console and run it

[12:09](#msg5e53bced9c3b2f07f7137c60)or use run-all.r that will compile it and run along with all the test suite

loziniak

[12:53](#msg5e53c73b9c3b2f07f7139f99)So this one looks like a bug in `run-test.r`?

[12:53](#msg5e53c746101adb4160c2bf18)Should I report it?

hiiamboris

[13:23](#msg5e53ce4f9c3b2f07f713b228)if you wish ;)

endo64

[15:07](#msg5e53e69a9aeef65232162f3f)@PeterWAWood ^^
