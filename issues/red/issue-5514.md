
#5514: [Regression] CLI console cannot be built for FreeBSD target
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5514>

**Describe the bug**

After View (TUI) got included into the `console.red`, compilation with `redc -r -t freebsd console.red` results in:
```
Compiling to native code...
*** Compilation Error: invalid path value: exec/gui/back-to-console
*** in file: %/D/devel/red/red-src/red/environment/console/CLI/utils.reds
*** in function: _print
*** at line: 1
*** near: [115x6 116x7 exec/gui/back-to-console
    until [
        switch list/type [1 [red/platform/prin* either as logic! list/value ["tr
loat* fp/value] 4 [fp32: as typed-float32! list unused32: red/platform/prin-floa
            default [red/platform/prin-hex* list/value]
        ]
        count: count - 1
        if all [spaced? count <> 0] [
            switch list/type [6 [
                    s: s + (length? s) - 1
                    c: s/1
                ] 3 [
                    c: as byte! list/value
                ]
                default [
                    c: #"^@"
                ]
            ]
            if all [
                c <> #" "
                c <> #"^/"
                c <> #"^M"
                c <> #"^-"
            ] [red/platform/prin* " "]
        ]
        list: list + 1 0 = count
    ]
    fflush 0 exec/gui/enter-tui
]
```
An error `*** Compilation Error: invalid #call function name: face?` was also reported but for me it seems to appear only when trying to compile a GUI View for FreeBSD.

**Expected behavior**

Compiles

**Platform version**
```
(I'm cross-compiling)
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 167 date: 19-Jun-2024/9:28:23 commit: #5195586f4fbba248092a11893476d76717e4491e ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2024-06-24T07:05:15Z, qtxie, commented:
<https://github.com/red/red/issues/5514#issuecomment-2185763835>

    No view support (both GUI and TUI) for FreeBSD yet. When compiling the `console.red` manually, `view` module need to be excluded from the header.

--------------------------------------------------------------------------------

On 2024-10-22T17:51:42Z, dockimbel, commented:
<https://github.com/red/red/issues/5514#issuecomment-2429900238>

    I've enabled the inclusion of View code on all platforms now (only if present in `Needs` header), so that eventual View dependencies will be met. I'll try to set up a FreeBSD image to test it.

--------------------------------------------------------------------------------

On 2024-10-22T19:42:10Z, dockimbel, commented:
<https://github.com/red/red/issues/5514#issuecomment-2430106032>

    <img width="334" alt="image" src="https://github.com/user-attachments/assets/7f714091-6398-4b90-ab9d-0ce2f46f7b01">
    
    
    Seems to be working fine now (FreeBSD 14.1). Though, it seems that `libcrypto.so.111` is now `libcrypto.so.30`, I couldn't find any way to install the older one we relied upon. So I'll update the name in our toolchain too.

