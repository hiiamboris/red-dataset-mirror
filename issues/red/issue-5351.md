
#5351: transcode/scan behaves different than transcode
================================================================================
Issue is closed, was reported by endo64 and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5351>

**Describe the bug**
`transcode/scan` returns `error!` for a loadable value, while `transcode` returns `block!`.

Reported by mikeyaunish on [gitter](https://matrix.to/#/!EorVRCzrVpjojJtctJ:gitter.im/$9SG1GkP5svCIg_Vp-QznToXkaNukhFUVxVTADqqRtoE?via=gitter.im&via=matrix.org&via=tchncs.de)

**To reproduce**
```red
>> transcode {[a: %"filename"] }
== [[a: %filename]]

>> transcode/scan {[a: %"filename"] }
== error!

>> transcode/scan/trace {[a: %"filename"] } :system/lexer/tracer
...
== block!
```

**Expected behavior**
`transcode/scan` should return `block!`.

**Platform version**

```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4645 date: 20-Feb-2023/14:53:57 commit: #bd5bc29648726bff632b6e0497026067a6098e01 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-07-25T11:31:16Z, dockimbel, commented:
<https://github.com/red/red/issues/5351#issuecomment-1649655836>

    ```
    >> transcode/scan {[a: %filename] }
    == block!
    ```
    
    So the issue seems to be related only to quoted file literals in blocks or parens.

