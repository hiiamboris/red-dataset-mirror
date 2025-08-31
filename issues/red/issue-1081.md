
#1081: ' is treated differently by the compiler and the interpreter when used as a word
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/1081>

The compiler accepts the use of ' as a word, the interpreter does not:

```
Compiling to native code...
...compilation time : 14843 ms
...linking time     : 192 ms
...output file size : 430080 bytes
...output file      : /Users/peter/VMShare/Languages/Red/test

mbp:Red peter$ cat ../../Code/Red/test.red
Red[]
‘: 1
print ‘
mbp:Red peter$ ./test
1
mbp:Red peter$ ./test-console
--== Red 0.5.1 ==-- 
Type HELP for starting information. 

red>> ': 1
*** Syntax Error: invalid Red value at: ': 1
```



Comments:
--------------------------------------------------------------------------------

On 2015-04-21T15:38:26Z, dockimbel, commented:
<https://github.com/red/red/issues/1081#issuecomment-94841970>

    Actually the compiler does not allow it:
    
    ```
    *** Syntax Error: Invalid word! value
    *** line: 7
    *** at: {': 1^M
    print '^M
    ```
    
    Your code example uses the character `‘` (U+2018) instead of `'` (U+0027), so I guess you just made a typo. ;-)

