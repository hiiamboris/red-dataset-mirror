
#1770: Compiler compiles `*.red` file with `Red/System` header as a R/S file (and vice versa) instead of erroring out
================================================================================
Issue is closed, was reported by ghost and has 6 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/1770>

Compiler compiles `*.red` file with `Red/System` header as a R/S file (and vice versa) instead of erroring out -
`a.red`

```
Red/System []

print 1.0
```

```
C:\Users\ABC\Desktop
λ red -c a.red

-=== Red Compiler 0.6.0 ===-

Compiling /C/Users/ABC/Desktop/a.red ...

Compiling to native code...
...compilation time : 297 ms
...linking time     : 15 ms
...output file size : 24064 bytes
...output file      : C:\Users\ABC\Desktop\a.exe


C:\Users\ABC\Desktop
λ a
1.0
```

Similarly -
`xt.reds`

```
Red []

print 1.0
```

```
C:\Users\ABC\Desktop
λ red -c xt.reds

-=== Red Compiler 0.6.0 ===-

Compiling /C/Users/ABC/Desktop/xt.reds ...
...compilation time : 968 ms

Compiling to native code...
...compilation time : 32834 ms
...linking time     : 250 ms
...output file size : 428032 bytes
...output file      : C:\Users\ABC\Desktop\xt.exe


C:\Users\ABC\Desktop
λ xt
1.0
```

Compiler should instead report an error if a `*.red` file contains an R/S header and vice-versa.



Comments:
--------------------------------------------------------------------------------

On 2016-04-01T10:35:55Z, dockimbel, commented:
<https://github.com/red/red/issues/1770#issuecomment-204343387>

    The file extensions are not significant for Red toolchain (or users), only the header matters and determines the type of the content. So you can embed Red or Red/System snippet in any kind of file (text, html, email,...), and the Red compiler or interpreter should be able to process it correctly anyway.

--------------------------------------------------------------------------------

On 2016-04-01T10:38:51Z, ghost, commented:
<https://github.com/red/red/issues/1770#issuecomment-204344206>

    Well I come from other languages where the file extension does matter. :wink:

--------------------------------------------------------------------------------

On 2016-04-01T11:21:26Z, dockimbel, commented:
<https://github.com/red/red/issues/1770#issuecomment-204353418>

    As additional explanation, Red (like Rebol) is also a data format (data which eventually gets evaluated), so it has a proper "head marker" to identify it, as do many other data formats (especially binary formats).

