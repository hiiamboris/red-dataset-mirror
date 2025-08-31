
#3107: Compile #macro with error
================================================================================
Issue is closed, was reported by Eric-Su and has 2 comment(s).
<https://github.com/red/red/issues/3107>

### Expected behavior
Compiled success.

### Actual behavior
./red-063 -r testMacro.red
-=== Red Compiler 0.6.3 ===- 

Compiling testMacro.red ...
*** Red Compiler Internal Error: Script Error : << has no value 
*** Where: double 
*** Near:  [<< 1] 

### Steps to reproduce the problem
Save and compile
Red []
#macro double: func [x] [x << 1]
print double 3

### Red version and build date, operating system with version.
red-063 on centos 7 and win xp


Comments:
--------------------------------------------------------------------------------

On 2017-11-13T09:01:41Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3107#issuecomment-343854278>

    With the current bootstrap compiler, compile time macros must be written in Rebol not Red. Rebol does not have an << operation. However, `shift` should work in both Rebol and Red.
    
    Further explanation - https://doc.red-lang.org/en/preprocessor.html#_implementation_note 

