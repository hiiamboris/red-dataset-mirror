
#144: Problem with absolute paths to library under Windows
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/144>

I have started work on writing tests for the library interface. I have committed the files to run a simple test across three platforms (Windows, Linux & Mac OS X). The files are:

tests/source/units/lib-test-source.reds ;; the test file is generated from this
tests/source/units/make-lib-auto-test.r ;; generates the test file
test/source/units/libs/testlib1.pas ;; the free pascal source of testlib1
test/source/units/libs/libtestlib1.dylib ;; Mac OS X
test/source/units/libs/libtestlib1.so ;; Linux
test/source/uinits/libs/testlib1.dll ;; Windows

The test runs successfully under Linux but fails when executing the Red/System program under Windows as the dll could not be found.

The screenshot that I had hoped to attach to this issue shows the error message, the rebol session and a directory listing of the libs directory. I will email it directly to Nenad.



Comments:
--------------------------------------------------------------------------------

On 2011-08-09T10:38:55Z, dockimbel, commented:
<https://github.com/red/red/issues/144#issuecomment-1762341>

    Your test script produces library paths in REBOL format while they have to be specified in OS-specific format. For Windows, changing manually the `"...testlib1.dll"` path in the `%lib-auto-test.reds` file fixes the issue and the tests are then passing.

--------------------------------------------------------------------------------

On 2011-08-09T10:44:56Z, dockimbel, commented:
<https://github.com/red/red/issues/144#issuecomment-1762372>

    The Red/System specification document does not give information about the path format for imported libraries. I have documented that in the specification upcoming revision.

