
#234: Can't compile returning #enum from #import
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [type.bug] [Red/System]
<https://github.com/red/red/issues/234>

```
#enum curl-status! [
    x
]

#switch OS [
    Windows     [#define cURL-library "libcurl.dll"]
    MacOSX      [#define cURL-library "libcurl.dylib"]  ; TODO: check this
    #default    [#define cURL-library "libcurl.so.4"]
]
#import [cURL-library cdecl [
    curl-set: "curl_easy_setopt" [
        session     [byte-ptr!]
        name        [integer!]
        value       [integer!]
        return:     [curl-status!]  ; FIXME
;       return:     [integer!]
    ]
]]

curl-session!: alias struct! [
    handle      [byte-ptr!]

    file        [byte-ptr!]

    data        [byte-ptr!]
    size        [integer!]
    index       [integer!]
]

curl-get: function [
    session     [curl-session!]
    buffer      [byte-ptr!]
    size        [integer!]
    /local status
][
    status: curl-set session/handle 10001  as integer! session
]
```

**\* Compiler Internal Error: Script Error : first expected series argument of type: series pair event money date object port time tuple any-function library struct event 
**\* Where: get-width 
**\* Near:  [value: first compiler/get-type operand 
either
]



Comments:
--------------------------------------------------------------------------------

On 2012-08-16T20:38:33Z, dockimbel, commented:
<https://github.com/red/red/issues/234#issuecomment-7798569>

    Seems to be fixed by commit [31e41088](https://github.com/dockimbel/Red/commit/31e41088f7f75872c3602965364bbd97fc3867b3) (from issue #233).

--------------------------------------------------------------------------------

On 2012-08-17T20:58:04Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/234#issuecomment-7834913>

    Yes, works now. There were several quite different error outputs, but in the same location.

