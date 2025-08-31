
#1138: Compiler returns an error when a global space function is redefined inside an object
================================================================================
Issue is closed, was reported by x8x and has 6 comment(s).
[type.review] [status.wontfix]
<https://github.com/red/red/issues/1138>

See following example:

File %test.red :

``` rebol
Red []

*clear: :clear
o: object [
  clear: does[*clear [1]]
]
o/clear
```

Compiled as:
`red -c test.red`

Compiler error:

```
-=== Red Compiler 0.5.3 ===- 

Compiling /Users/alpha/.red/test.red ...
...compilation time : 604 ms

Compiling to native code...
*** Compilation Error: undefined symbol: red/actions/*clear* 
*** in file: %/Users/user/.red/test.red 
*** in function: exec/f_ctx129~clear
*** at line: 1 
*** near: [
    actions/*clear* 
    stack/unwind 
    stack/unwind-last 
    ctx/values: as pointer! [integer!] pop
]
```



Comments:
--------------------------------------------------------------------------------

On 2015-04-30T08:55:08Z, dockimbel, commented:
<https://github.com/red/red/issues/1138#issuecomment-97711499>

    Support for redefining any kind of functions (an action! in this case) in the compiler is very limited. Such kind of issue won't be fixed before a later version of Red, maybe 0.8 or 0.9. It is not even sure that such feature can be supported fully by the compiler in the general case, so the fix is not certain.

--------------------------------------------------------------------------------

On 2016-02-02T14:42:42Z, dockimbel, commented:
<https://github.com/red/red/issues/1138#issuecomment-178604624>

    You have an alternative way to write such code, relying on `system/words` accessor for words in global space:
    
    ```
    o: object [
      clear: does[system/words/clear [1]]
    ]
    o/clear
    ```
    
    I will close this ticket as there is not much we can do for now about making the compiler support such code pattern, and you have an alternative way to achieve the same.

--------------------------------------------------------------------------------

On 2016-02-03T13:26:35Z, x8x, commented:
<https://github.com/red/red/issues/1138#issuecomment-179228525>

    Just curious, does this work because the block executed by does will run interpreted?
    thanks for the alternative btw! 8-)

