
#2819: Setting on-change* to a non-function value crashes the interpreter and the compiler
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2819>

Setting the word ```on-change*``` to a non-function value crashes both the interpreter(access violation) and the compiler(internal script error).

Code:
```text
Red[]
o: make object! [
	a: 1
	on-change*: 2
]
```

Console output:
```text
mbp:red peter$ ./test-console ../../Code/Red/test.red

*** Runtime Error 1: access violation
*** at: 0003169Ah
```

Compiler output
```text
Compiling /Users/peter/VMShare/Code/Red/test.red ...
...using libRedRT built on 18-Jun-2017/16:02:21+8:00
*** Red Compiler Internal Error: Script Error : Cannot use path on none! value 
*** Where: comp-context 
*** Near:  [unless zero? loc-s: second check-spec] 
```


