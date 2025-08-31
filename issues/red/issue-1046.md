
#1046: Compiler error caused by combined print statement
================================================================================
Issue is closed, was reported by iArnold and has 4 comment(s).
<https://github.com/red/red/issues/1046>

Adding a combined print statement to my successfully compiling program 

print ["value1: " value1 "value2:" value2]

Causes a compile error
**\* Compilation Error: undefined symbol: ts610
**\* in file: %/C/ .. /test/xiangqi-moves-test.red
**\* in function: exec/f_modulo
**\* at line: 1
**\* near: [ts610 0 stack/arguments
    ~b: type-check ts610 1 ~a

Replacing with single print statements makes the program compile again.



Comments:
--------------------------------------------------------------------------------

On 2015-02-26T00:50:42Z, dockimbel, commented:
<https://github.com/red/red/issues/1046#issuecomment-76101256>

    Please stop opening new tickets for the same error. You can just add more examples to the same ticket.

--------------------------------------------------------------------------------

On 2015-02-26T07:30:58Z, iArnold, commented:
<https://github.com/red/red/issues/1046#issuecomment-76133956>

    Same TS610 as the XOR, but I did not see a similar issue mentioning PRINT.
    Your wish is my command.. because those were all my findings up to now.

