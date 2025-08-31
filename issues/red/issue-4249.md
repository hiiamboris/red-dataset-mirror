
#4249: Regression: Red compiler tries to access local source files
================================================================================
Issue is open, was reported by hiiamboris and has 10 comment(s).
[type.compiler]
<https://github.com/red/red/issues/4249>

**Describe the bug**

`red -r` tries to access View module's sources and fails:
```
*** Compilation Error: undefined symbol: _resize-ns
*** in file: %/D/devel/red/red-src/tests/modules/view/backends/windows/gui.reds
*** in function: exec/gui/parse-common-opts
*** at line: 1246
*** near: [_resize-ns [32645]
    any [
        sym = _resize-ew
        sym = _resize-we
    ] [32644]
    true [32512]
]
```
As a result I'm unable to compile scripts located within the Red sources path.

Note the path above: it's a path to local `modules/.../gui.reds` located beside the script I'm compiling.

**To reproduce**

1. Download Red source tree at commit [#544a6e12](https://github.com/red/red/archive/544a6e12b265765d343bd71a483cd79de383dbc6.zip) (some other snapshots do not trigger the bug!) and unpack it
2. Use January, 2020 builds from red-lang.org. Builds of Jan 8 and Jan 13 trigger the bug for me, Dec 20 build and older - do not.
3. Create a `2.red` dummy script: `Red [needs: view]` in the directory where you unpacked the source tree into (it should contain `modules` directory and `2.red`, rest doesn't matter)
4. Try to compile it, e.g. using the Jan 13 build: `red-13jan20-938744fc.exe -r 2.red`.
5. Observe the error output mentioned above

**Expected behavior**

Should not access files not #included into the script.

**Platform version (please complete the following information)**
`Red 0.6.4 for Windows built 8-Jan-2020/23:51:56+03:00 commit #e26452d`
`Red 0.6.4 for Windows built 13-Jan-2020/17:41:02+03:00 commit #938744f`



Comments:
--------------------------------------------------------------------------------

On 2020-01-19T14:46:35Z, dockimbel, commented:
<https://github.com/red/red/issues/4249#issuecomment-576011856>

    > Should not access files not #included into the script.
    
    If you are compiling a source that `needs: View`, then it should access and compile such file. So your expectation does not seem to make sense...

--------------------------------------------------------------------------------

On 2020-01-19T15:17:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/4249#issuecomment-576014682>

    @dockimbel I mean, I expect it to use View module embedded into distributed Red executable, rather than grabbing the first available junk from the adjacent "modules" directory, which in the best case may not be compatible with other libRedRT parts, or be irrelevant to Red, and in the worst case - opens a door for exploits.

--------------------------------------------------------------------------------

On 2020-01-19T16:02:16Z, 9214, commented:
<https://github.com/red/red/issues/4249#issuecomment-576019276>

    @hiiamboris that makes it impossible to develop View, as toolchain simply ignores the files. Or do you expect `do/args %red.r "-r ..."` to work with sources, but not `red -r ...`?
    
    I think only development mode should include modules that way.

--------------------------------------------------------------------------------

On 2020-01-19T16:52:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/4249#issuecomment-576023763>

    @9214 Yes, that's what I expected :) `red.r` to use sources and `red.exe` to be standalone
    Here's a full list of files it slyly tries to use:
    ![](https://i.gyazo.com/b967c4bebf6410989c202208f2cb65a2.png)

--------------------------------------------------------------------------------

On 2020-01-19T17:21:49Z, dockimbel, commented:
<https://github.com/red/red/issues/4249#issuecomment-576026333>

    > I expected :) red.r to use sources and red.exe to be standalone.
    
    That is how it is supposed to work. In the current [encap code](https://github.com/red/red/blob/master/system/utils/encap-fs.r#L32), reading from the local filesystem is used as a fallback only if the file can't be read from the memory cache (loaded from the encapped payload).  I suspect a file path issue there, that is forcing the fallback case.

