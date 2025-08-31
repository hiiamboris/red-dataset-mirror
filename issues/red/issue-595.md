
#595: Directly setting chars in local c-string! affects initialisation in further calls.
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[status.dismissed] [Red/System]
<https://github.com/red/red/issues/595>

Altering a local c-string! within a function by directly setting bytes affects the initialisation of the c-string on the next call of the function. This does not happen when a value is assigned to the c-string.

Code

```
Red/System []

f: func [/local s [c-string!]] [
    s: "1234"
    print ["s: " s lf]
    print ["length? s: " length? s lf]
    print ["size? s: " size? s lf]
    s/1: #"1"
    s/2: #"2"
    s/3: null-byte
]

g: func [/local s [c-string!]] [
    s: "1234"
    print ["s: " s lf]
    print ["length? s: " length? s lf]
    print ["size? s: " size? s lf]
    s: "12"
]

print ["function f" lf]
f
f
print ["function g" lf]
g
g
```

Output

```
-=== Red Compiler 0.4.1 ===- 

Compiling /Users/peter/VMShare/Code/Red-System/test.reds ...

Compiling to native code...
...compilation time : 118 ms
...linking time     : 6 ms
...output file size : 20480 bytes
...output file      : /Users/peter/VMShare/Code/Red-System/test

function f
s: 1234
length? s: 4
size? s: 5
s: 12
length? s: 2
size? s: 3
function g
s: 1234
length? s: 4
size? s: 5
s: 1234
length? s: 4
size? s: 5
```



Comments:
--------------------------------------------------------------------------------

On 2013-12-06T10:11:12Z, dockimbel, commented:
<https://github.com/red/red/issues/595#issuecomment-29977260>

    Literal c-string! values are statically allocated. Values have no context, variables do. In the case of the `f` function, the `s` c-string! variable always point to the same statically allocated c-string! value. There is no such thing as "c-string! initialization" internally, it is similar to what Red does at higher lever, the variable `s` is just set to point to the statically allocated c-string! value on each call. 
    
    If you need a "fresh" c-string! on each call, you need to allocate it dynamically and copy the content of the statically allocated c-string! to the dynamically allocated one.
    
    Remember that c-string! variables are just pointers wrapped in a convenient syntax.

--------------------------------------------------------------------------------

On 2013-12-06T12:15:16Z, PeterWAWood, commented:
<https://github.com/red/red/issues/595#issuecomment-29985779>

    Thanks for the explanation.

