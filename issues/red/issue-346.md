
#346: #import doc strings still don't work
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/346>

The compiler lets them pass, but borks the function spec, leading to odd errors later on:

```
Red/System []

#import [LIBC-file cdecl [
    to-float: "atof" ["Parse string to floating point."
        string      [c-string!]
        return:     [float!]
    ]
]]
print (to-float "1")
```

**\* Compilation Error: more than one expression found in parentheses 
**\* in file: %/home/kaj/Desktop/Red/C-library/examples/test.reds 
**\* at line: 9 
**\* near: ("1")



