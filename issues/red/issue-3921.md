
#3921: Two scripts in subdirectory included inside context result in a compilator error.
================================================================================
Issue is open, was reported by loziniak and has 12 comment(s).
[status.deferred] [type.bug]
<https://github.com/red/red/issues/3921>

I have 3 files:
```
Red [File: %test.red]
print "test"
context [
  #include %sub/a.red
  #include %sub/b.red
]
```
```
Red [File: %sub/a.red]
print "a"
```
```
Red [File: %sub/b.red]
print "b"
```
When I try to compile it with `red -r test.red`, **I get an error**:
```
*** Compilation Error: include file not found: sub/b.red 
*** in file: include_test/test.red
*** near: [
    context [
        print "a" #pop-path 
        #include %sub/b.red
    ]
]
```
When running without compilation with `red test.red`, output is as expected:
```
test
a
b
```

**Platform version**
```
Linux: Red 0.6.4 for Linux built 8-Jun-2019/10:04:27+02:00 commit #1b68168
Windows (wine): red-20jun19-33a1fb7a.exe
```



Comments:
--------------------------------------------------------------------------------

On 2019-06-21T22:45:17Z, endo64, commented:
<https://github.com/red/red/issues/3921#issuecomment-504595811>

    Confirmed on Win10 x64.
    Additionally if the files are in the same folder `*** Syntax Error: Missing #"]" character` error happens.

--------------------------------------------------------------------------------

On 2019-10-11T22:26:07Z, loziniak, commented:
<https://github.com/red/red/issues/3921#issuecomment-541244238>

    I found a workaround. You have to use paths relative to the file included before. Following code works:
    
     ```
     Red [File: %test.red]
     print "test"
     context [
       #include %sub/a.red
       #include %b.red ;-- NOTE CHANGE IN PATH
     ]
     ```
     
     ```
     Red [File: %sub/a.red]
     print "a"
     ```
     
     ```
     Red [File: %sub/b.red]
     print "b"
     ```

--------------------------------------------------------------------------------

On 2019-10-13T18:21:46Z, greggirwin, commented:
<https://github.com/red/red/issues/3921#issuecomment-541443488>

    Thanks for the further analysis @loziniak. Probably not to hard to fix with that info. %compiler.r `process-include-paths` is where the path processing probably goes awry.

--------------------------------------------------------------------------------

On 2019-10-14T13:22:43Z, loziniak, commented:
<https://github.com/red/red/issues/3921#issuecomment-541675049>

    Could be perhaps also `| #include (comp-include/only pos) :pos` line in `comp-context` function of `%compiler.r`? `process-include-paths` seems to be used only in parsing `#system` and `#system-global` directives.

--------------------------------------------------------------------------------

On 2019-11-07T12:53:31Z, loziniak, commented:
<https://github.com/red/red/issues/3921#issuecomment-551066949>

    For the record. The error message is:
    ```
    *** Compilation Error: include file not found: sub/b.red
    ```

--------------------------------------------------------------------------------

On 2019-11-18T19:17:21Z, toomasv, commented:
<https://github.com/red/red/issues/3921#issuecomment-555166690>

    Somewhat connected to different interpretation of file-paths when interpreted and compiling, is another difference -- if interpreted, #include is replaced by `do` and following file is loaded and "done" but is not bound to context from within which it was included. But when compiled, source text is included in context and later bound to context. 

