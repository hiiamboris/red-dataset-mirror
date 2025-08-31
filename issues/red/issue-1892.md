
#1892: Compiler: binding problem when including external file
================================================================================
Issue is closed, was reported by x8x and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1892>

This works as epected:
file %test.red :

```
Red []

a: 1
#include %test1.red
```

file %test1.red :

```
Red []

c: context [a: 2 d: function [/extern a][a]]
print c/d
```

```
red -c test.red
-=== Red Compiler 0.6.0 ===- 

Compiling /test.red ...
...compilation time : 962 ms

Compiling to native code...
...compilation time : 30152 ms
...linking time     : 217 ms
...output file size : 421888 bytes
...output file      : /test 

% ./test
2
```

While this returns an error while compiling:
file %test.red :

```
Red []

a: func[z][z]
#include %test1.red
```

file %test1.red :

```
Red []

c: context [a: 2 d: function [/extern a][a]]
print c/d
```

```
red -c test.red                                                                                                                 [20:52:55] !20016

-=== Red Compiler 0.6.0 ===- 

Compiling /test.red ...
*** Compilation Error: missing argument 
*** in file: %/test.red
*** near: [a]
```

( for real world example look at comment#1 of commit https://github.com/red/red/commit/de627587e9d5e28c66e52839480a403dd0e061f3 )



Comments:
--------------------------------------------------------------------------------

On 2016-05-11T04:04:35Z, dockimbel, commented:
<https://github.com/red/red/issues/1892#issuecomment-218356463>

    It doesn't need to be split into two files, the following single file reproduces the issue:
    
    ```
    Red []
    
    a: func [z][z]
    c: context [a: 2 d: function [/extern a][a]]
    print c/d
    ```

