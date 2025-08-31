
#2102: lexer.r and lexer.red give different results with "2147483645:59:59"
================================================================================
Issue is open, was reported by PeterWAWood and has 2 comment(s).
[status.reviewed] [type.review] [type.compiler]
<https://github.com/red/red/issues/2102>

I compiled and ran this code and also "did" it from the console and got different results.
Code:

```
Red []

tb3-t: 2147483645:59:59
print [tb3-t/hour]
print [tb3-t/minute]
print [tb3-t/second]
```

Compiled:

```
Compiling /Users/peter/VMShare/Code/Red/test.red ...
...compilation time : 591 ms
...output file      : /Users/peter/VMShare/Red/red/test 

./test
-3
-1
-1.0
```

In the console:

```
$ ./test-console ~/VMShare/Code/Red/test.red
2147483645
59
59.0
```

Test "lexer-time-1" in red/tests/source/units/lexer.tests is failing.



Comments:
--------------------------------------------------------------------------------

On 2016-07-18T16:12:53Z, dockimbel, commented:
<https://github.com/red/red/issues/2102#issuecomment-233377243>

    The compiler relies internally on the Rebol2's time! datatype, which supports a much narrower range than Red's one.

