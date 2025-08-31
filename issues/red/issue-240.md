
#240: Compiler crash (on type inference?) using namespace
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.resolved] [Red/System]
<https://github.com/red/red/issues/240>

```
sqlite: context [
    #enum status! [
        status-ok
    ]

    sqlite!:                        alias struct! [dummy [integer!]]
    sqlite-reference!:              alias struct! [value [sqlite!]]

    #switch OS [
        Windows     [#define SQLite-library "sqlite3.dll"]
        MacOSX      [#define SQLite-library "libsqlite3.dylib"]
        #default    [#define SQLite-library "libsqlite3.so.0"]
    ]
    #import [SQLite-library cdecl [
        open-database: "sqlite3_open" [
            file                [c-string!]
            db-reference        [sqlite-reference!]
            return:             [status!]
        ]
    ]]
]

with sqlite [
    db-reference:   declare sqlite-reference!

    file: system/args-list + 1

    status: open-database file/item db-reference
]
```

**\* Compiler Internal Error: Script Error : first expected series argument of type: series pair event money date object port time tuple any-function library struct event 
**\* Where: get-width 
**\* Near:  [value: first compiler/get-type operand 
either
]



Comments:
--------------------------------------------------------------------------------

On 2012-08-23T21:35:28Z, dockimbel, commented:
<https://github.com/red/red/issues/240#issuecomment-7984978>

    Can't reproduce the error anymore after fix for issue #239. I guess the fix works for both...the source code is exactly the same as in issue #239, is it normal?

--------------------------------------------------------------------------------

On 2012-08-23T21:54:10Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/240#issuecomment-7985525>

    No, #239 has an extra
    
      status:         status-ok
    
    The error when removing that was quite different, so although it might be related, I reported it separately.

