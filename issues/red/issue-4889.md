
#4889: Error on Mac version red-05may21-3723789c6
================================================================================
Issue is closed, was reported by rsheehan and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4889>

**Before submitting**
Prior to opening this ticket, please share your finding in our [dedicated chat](https://gitter.im/red/bugs), so we can confirm it and help in reproducing it, including on other platforms.

**Describe the bug**
When red runs, programs work as normal, but on termination the following message appears.
*** Driver Internal Error: Script Error : status needs a value 
*** Where: run-console 
*** Near: [status: either all [Windows? gui?] [ gui-sys-call exe any [all [file form-args file] ""] ]]

**To reproduce**
Steps to reproduce the behavior:
1. Run the recent Mac version.

**Expected behavior**
No error should be reported after running.

**Screenshots**
If applicable, add screenshots to help explain your problem.

**Platform version**
I am running on Mac OS 10.13.6. The red version is red-05may21-3723789c6.
Still a problem in "Red 0.6.4 for macOS built 10-May-2021/14:11:11+12:00  commit #9bae458".



Comments:
--------------------------------------------------------------------------------

On 2021-05-14T14:31:29Z, loziniak, commented:
<https://github.com/red/red/issues/4889#issuecomment-841281280>

    probably caused by #4869 .

--------------------------------------------------------------------------------

On 2021-05-14T14:34:57Z, loziniak, commented:
<https://github.com/red/red/issues/4889#issuecomment-841283176>

    https://gitter.im/red/bugs?at=609393d375aeb43be72d64f0 :
    
    > looks like `sys-call` routine is defined without an integer return value
    > in a few places even

