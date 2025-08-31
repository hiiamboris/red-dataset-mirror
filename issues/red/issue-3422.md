
#3422: In Windows file system path length is limited to MAX_PATH
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.review]
<https://github.com/red/red/issues/3422>

For reference: https://msdn.microsoft.com/en-us/library/windows/desktop/aa365247%28v=vs.85%29.aspx#maxpath

TL;DR:
- legacy (ANSI) file functions supported only 255 chars in the whole path (many programs still do, even the `cmd`,  `powershell`, `explorer` and Net.Core on W7)
- since W2K or so, when they introduced Unicode file functions, the restriction was lifted, and now consists of: 255 chars per single path item (file/dir name), 32767 chars per whole path, up to 32 reparse points per path
- to use these long filenames one should prefix the paths with `\\?\` in WinAPI calls
- in W10 it's possible (but not guaranteed) that long filenames will work without `\\?\`

### Steps to reproduce the problem
Create a path longer than 256 chars, use it somehow. Relatively easy(?) way:
- download, unpack latest AlphaFS dll from https://github.com/alphaleonis/AlphaFS/releases
- start `powershell`
- type `Import-Module <path-to-AlphaFS.dll>`
- call AlphaFS funcs like this:
```
PS C:\> [Alphaleonis.Win32.Filesystem.Directory]::CreateDirectory("C:\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1")
```
(566 chars in the above)
(I didn't bother reading their docs, all classes and funcs are here: https://github.com/alphaleonis/AlphaFS/tree/develop/AlphaFS/Filesystem)

### Expected behavior
Although not an immediate task, but somewhere down the road Red should work seamlessly with long file names.

### Actual behavior
```
>> change-dir to-red-file %"C:\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9\"
*** Access Error: cannot open: %/C/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/0/1/2/3/4/5/6/7/8/9/
*** Where: do
*** Stack: change-dir cause-error  
```
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 721 date: 25-May-2018/14:25:05 commit: #3573929958ac93c732407b42f09eaf4488ff6da3 ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-06-15T20:45:32Z, hiiamboris, commented:
<https://github.com/red/red/issues/3422#issuecomment-397737267>

    It's another issue but it'll be solved with the one above, so I'm including it here.
    One can create files/directories **ending in a period** in Windows using the same `\\?\` prefix, while Red mostly fails to work with these.
    ```
    C:\>mkdir \\?\C:\testdir.
    C:\>dir /b test*
    testdir.
    
    C:\>echo test test >\\?\C:\testdir.\testfile.
    C:\>type \\?\C:\testdir.\testfile.
    test test
    
    C:\>rmdir /q /s \\?\C:\testdir.
    C:\>dir /b test*
    File not found
    ```
    Interestingly, `make-dir`, `make-dir/deep`, `delete`, `write` and `read` accept the `\\?\` prefix. It's both possible to create very-long paths and path ending in period, provided that the first backslash in `\\?\` remains backwards (works like `\/?/` even, but a call to-red-path rotates it and it won't work anymore). But it's sort of a hack right now ;) And won't work without the prefix:
    ```
    >> make-dir %test.
    == %test./                  ;-- note it returned not what it actually created!
    >> ls
    	test/              
    >> make-dir %"\\?\C:\1\test2."
    == %\\?\C:\1\test2./
    >> ls
    	test/              	test2./
    >> read %"\\?\C:\1\test2.\"
    >> write %"\/?/c:/1/test2./test3." "test test"
    >> read %"\/?/c:/1/test2./test3."
    == "test test"
    >> read %"\\?\c:\1\test2./"
    == [%test3.]
    >> delete %"\/?/c:/1/test2./test3."
    == true                     ;-- yes it actually deleted it, double check:
    
    >> read %"\/?/c:/1/test2./test3."
    *** Access Error: cannot open: %\/?/c:/1/test2./test3.
    >> read %"\\?\c:\1\test2./"
    == []
    ```
    I omit the very long file name test results here, but it works as well, with this hack.
    
    Every other func seems to fail, apparently because it prepends the CWD to it's argument and API calls won't work without the prefix:
    ```
    >> list-dir %"\/?/c:/1/test2./"
    *** Access Error: cannot open: %/c/1/\/?/c:/1/test2./
    *** Where: read
    *** Stack: list-dir
    
    >> list-dir %"/c/1/test2./"
    *** Access Error: cannot open: %/c/1/test2./
    *** Where: read
    *** Stack: list-dir  
    
    >> list-dir %"/c:/1/test2./"
    *** Access Error: cannot open: %/c:/1/test2./
    *** Where: read
    *** Stack: list-dir 
    
    >> change-dir %"\/?/c:/1/test2./"
    *** Access Error: cannot open: %/c/1/\/?/c:/1/test2./
    *** Where: do
    *** Stack: change-dir cause-error
    ```
    
    I would propose the following strategy:
    - make all file/path functions UNC-aware (https://en.wikipedia.org/wiki/Path_%28computing%29#Uniform_Naming_Convention)
    It will solve the issues and allow accessing unmounted SMB resources on Windows, but also will require some extension to the current path format. `/?/UNC/...` scheme should not cause any problems internally I believe.
    - allow the user to convert `\\?\C:\`, `\\?\UNC\` into `/?/c/`, `/?/unc/` with to-red-file and back with to-local-file in a lossless manner (the prefix must be preserved)
    - recognize the UNC `\\?\..` paths and pass them through unmodified
    - transform relative paths `./...` and short absolute paths `/c/...` into `\\?\C:\...` absolute paths before passing them to WinAPI calls
    - call to-local-file on paths before passing them to WinAPI, otherwise it's very unreliable

