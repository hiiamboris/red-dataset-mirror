
#2352: Red compiler is not respecting -o / --output option
================================================================================
Issue is closed, was reported by dander and has 4 comment(s).
<https://github.com/red/red/issues/2352>

The output filename appears to use the source filename, instead of the one given in the command-line option. Same behavior with --output <filename>.
This is occurring on Windows with automated red.exe build from 28-Nov-2016/13:22:09-8:00

test.red:
```
Red []
print "foo"
```

console output:
```
λ red -c .\test.red -o foo.exe

-=== Red Compiler 0.6.1 ===-

Compiling C:\temp\red\test.red ...
...using libRedRT built on 28-Nov-2016/13:22:09-8:00
...compilation time : 17 ms

Target: MSDOS

Compiling to native code...
...compilation time : 934 ms
...linking time     : 48 ms
...output file size : 61952 bytes
...output file      : C:\temp\red\test.exe
```


Comments:
--------------------------------------------------------------------------------

On 2016-11-29T12:29:06Z, ghost, commented:
<https://github.com/red/red/issues/2352#issuecomment-263557794>

    @dander This works -
    `red -c -o foo.exe test.red`
    This is because the compiler does not parse out of order arguments.
    See https://github.com/red/red/issues/1771

--------------------------------------------------------------------------------

On 2016-11-29T21:57:27Z, dander, commented:
<https://github.com/red/red/issues/2352#issuecomment-263712578>

    Apologies. I didn't find that issue. I will close this as a duplicate.

