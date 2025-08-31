
#386: FIND causes runtime error when called with /reverse refinement and block! search argument
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/386>

When calling 'FIND with the /reverse refinement and the search argument is a block there is a runtime error.

``` REBOL
Red[]
find/reverse tail [1 2 3 3 2 1] [3 3]
```

```
-= Red Compiler =- 
Compiling /Users/peter/VMShare/Code/Red/test.red ...

...compilation time:     83 ms

Compiling to native code... 

...compilation time:     4058 ms
...linking time:         51 ms
...output file size:     114688 bytes
Schulz:Red peter$ ./test

*** Script error: action 9 not defined for type: 16
```



