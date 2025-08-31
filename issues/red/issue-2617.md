
#2617: [compiler] Syntax regression with '/
================================================================================
Issue is closed, was reported by maximvl and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2617>

Following code runs fine in interpreter, but compiler fails with it (it worked some time ago):
```
Red [ ]

x: '/
probe x
```

```
> wine red.exe -c compiler-bug.red
err:winediag:SQLDrivers No ODBC drivers could be found. Check the settings for your libodbc provider.

-=== Red Compiler 0.6.2 ===- 

Compiling Z:\home\max\red\compiler-bug.red ...
...using libRedRT built on 22-Apr-2017/15:20:40+1:00
*** Syntax Error: Invalid word! value
*** line: 3
*** at: {'/
probe x


}
```

```
> red62 -c compiler-bug.red

-=== Red Compiler 0.6.2 ===- 

Compiling /home/max/red/compiler-bug.red ...
Compiling libRedRT...
...compilation time : 831 ms

Compiling to native code...
...compilation time : 25004 ms
...linking time     : 352 ms
...output file size : 564828 bytes
...output file      : /home/max/red/libRedRT.so 


*** Syntax Error: Invalid word! value
*** line: 3
*** at: {'/
probe x
```


