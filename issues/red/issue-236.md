
#236: Cannot return enum# type from #import in CONTEXT
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/236>

```
sqlite: context [
    #enum status! [
        status-ok
    ]

    #switch OS [
        Windows     [#define SQLite-library "sqlite3.dll"]
        MacOSX      [#define SQLite-library "/Library/Frameworks/SQLite.framework/Versions/A/SQLite"]  ; TODO: check this
        #default    [#define SQLite-library "libsqlite3.so.0"]
    ]
    #import [SQLite-library cdecl [
        status-of: "sqlite3_errcode" [
            return:             [status!]
        ]
    ]]
]
```

**\* Compilation Error: invalid definition for function sqlite/status-of: [status!] 
**\* in file: %/users/administrator/Red/Red-SQLite/examples/bug-do-sql.reds 
**\* at line: 13 
**\* near: [
    #import ["libsqlite3.so.0" cdecl [
            status-of: "sqlite3_errcode" [
                return: [status!]
            ]
        ]]
]

Outside the context, it works.



