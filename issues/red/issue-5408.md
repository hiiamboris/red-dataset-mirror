
#5408: WHAT-DIR location lost if there is a backslash in a CHANGE-DIR
================================================================================
Issue is closed, was reported by dsunanda and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5408>



**Describe the bug**

Red on  Windows seem to lose track of WHAT-DIR location when there is an accidental backslash in a CHANGE-DIR:

**To reproduce**

     make-dir/deep %a/b write %a/b/file-ab.txt "file a / b"   ; create nested folder with a file
     make-dir/deep %c/d write %c/d/file-cd.txt "file c / d"   ; ditto
     change-dir %a/b
     print read %file-ab.txt            ; print the file in folder a/b. Works OK
     change-dir %../../c/d
     print read %file-cd.txt            ; print the file in folder c/d. Works OK
     change-dir %../../a/b              ; print the file in folder a/b again. Works OK
     print read %file-ab.txt

    change-dir %..\..\c\d              ; <-- typo - use wrong type of slash. Seems to work OK
    print read %file-cd.txt            ; print the file in folder c/d -- Works OK ... But:
    change-dir %../../a/b
    print read %file-ab.txt            ; THIS FAILS - we have not got back to a/b

    *** Access Error: cannot open: %file-ab.txt
    *** Where: read
    *** Near : print read %file-ab.txt


The current folder name is weird:

     what-dir
    >  %"[omitted]/a/b/..\..\c\d/"

**Expected behavior**

CHANGE-DIR should produce an error .... or silently convert \ to /


**Platform version**

    >> about/debug

    -----------RED & PLATFORM VERSION----------- 
    RED: [ branch: "master" tag: #v0.6.4 ahead: 4786 date: 12-Jul-2023/11:46:25 commit: #aea09888d049d0af49ddb957d073eb443acaee50 ]
    PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22621 ]
    --------------------------------------------


Comments:
--------------------------------------------------------------------------------

On 2023-10-19T21:54:20Z, dockimbel, commented:
<https://github.com/red/red/issues/5408#issuecomment-1771759239>

    Good catch!

