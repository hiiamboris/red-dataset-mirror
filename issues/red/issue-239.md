
#239: "unknown type: none" using namespace
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/239>

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
    status:         status-ok

    file: system/args-list + 1

    status: open-database file/item db-reference
]
```

**\* Compilation Error: unknown type: none 
**\* in file: %/users/administrator/Red/Red-SQLite/examples/bug-do-sql.reds 
**\* at line: 32 
**\* near: []



