
#1260: Documentation Error
================================================================================
Issue is closed, was reported by JacobGood1 and has 0 comment(s).
[status.resolved]
<https://github.com/red/red/issues/1260>

code found in this web page does not work: http://static.red-lang.org/red-system-specs.html

The offending code is...

```
#import [
   "kernel32.dll" stdcall [
       process-id?: "GetCurrentProcessId" [
           return: [integer!]
       ]
       get-env: "GetEnvironmentVariableA" [
           name    [c-string!]
           buffer  [c-string!]
           size    [integer!]
           return: [integer!]
       ]
   ]
   "msvcrt.dll" cdecl [
       malloc: "malloc" [
           size    [integer!]
           return: [c-string!]
       ]
       free: "free" [
           block   [c-string!]
       ]
   ]
]

pid: process-id?

max-size: 128
buf: malloc  max-size                  ;-- allocate space for 127 characters

get-env "windir" buf  max-size

print buf
free buf
```

free is already taken, possible fix is my-free



