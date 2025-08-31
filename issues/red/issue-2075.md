
#2075: WHILE with word referring to block condition doesn't compile
================================================================================
Issue is closed, was reported by greggirwin and has 6 comment(s).
[status.deferred]
<https://github.com/red/red/issues/2075>

```
i: 0
test: [i < 10]
while test [i: i + 1]
print i
```

-=== Red Compiler 0.6.0 ===- 

Compiling D:\temp\red\while-word-compile.red ...
**\* Compilation Error: expected a block for WHILE-CONDITION instead of word! value 
**\* in file: %/D/temp/red/while-word-compile.red
**\* near: [test [i: i + 1] 
    print i
]



Comments:
--------------------------------------------------------------------------------

On 2016-06-26T20:20:24Z, SteeveGit, commented:
<https://github.com/red/red/issues/2075#issuecomment-228620491>

    Quote From Doc:
    
    > _Note:_ the compiler will not accept it as is, because it expects a literal condition block for `while`. Replacing `cond` by `[do cond]` would make it pass compilation. The compiler should be able to handle such cases in the  close future.

--------------------------------------------------------------------------------

On 2016-06-27T03:25:22Z, dockimbel, commented:
<https://github.com/red/red/issues/2075#issuecomment-228646769>

    @SteeveGit Thanks! ;-)

--------------------------------------------------------------------------------

On 2016-06-29T09:48:07Z, dockimbel, commented:
<https://github.com/red/red/issues/2075#issuecomment-229309940>

    I'm closing this ticket as this is a feature the compiler does not support yet.

