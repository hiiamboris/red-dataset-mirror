
#842: "workaround issues on 64-bit editions" needed in call.r
================================================================================
Issue is closed, was reported by srpelissier and has 48 comment(s).
[status.deferred] [type.review]
<https://github.com/red/red/issues/842>

Hi. I changed lines 8 and 9 in `call.r` to the following then _kernel32.dll_ could be found. This is about Windows 7 64 bit and running red from the rebol/view console.

8:  `path: to-rebol-file get-env "SystemRoot"`
9:  `kernel32: load/library path/System32/kernel32.dll`

This did not seem worth a pull request. (Kindly) correct me if I am wrong.

Regards,

> sylvain



Comments:
--------------------------------------------------------------------------------

On 2014-06-02T14:16:34Z, srpelissier, commented:
<https://github.com/red/red/issues/842#issuecomment-44841996>

    The command executed from the rebol/view console: `>> do %run-all.r"`

--------------------------------------------------------------------------------

On 2014-06-02T14:25:45Z, PeterWAWood, commented:
<https://github.com/red/red/issues/842#issuecomment-44843102>

    Hi Sylvain
    
    call.r is a library program taken from the Cheyenne Server project ( http://cheyenne-server.org ). It is only used to by quick-test.r to compile and run the tests (or just run the tests).
    
    I regularly run the Red tests from the Rebol/View console  under Windows 7 64 bit and experience no problems.
    
    What was the problem that you encountered?
    
    Regards
    
    Peter
    
    On 2 Jun 2014, at 22:12, Sylvain wrote:
    
    > Hi. I changed lines 8 and 9 in call.r to the following then kernel32.dll could be found. This is about Windows 7 64 bit and running red form the rebol/view console.
    > 
    > 8: path: to-rebol-file get-env "SystemRoot"{noformat}
    > 9: kernel32: load/library path/System32/kernel32.dll
    > 
    > This did not seem worth a pull request. (Kindly) correct me if I am wrong.
    > 
    > Regards,
    > 
    > sylvain
    > 
    > —
    > Reply to this email directly or view it on GitHub.

--------------------------------------------------------------------------------

On 2014-06-02T14:34:35Z, PeterWAWood, commented:
<https://github.com/red/red/issues/842#issuecomment-44844350>

    This is a sample of the output from running the Red tests from the Rebol/View console under Windows 7/64:
    
    ```
    REBOL/View 2.7.8.3.1 1-Jan-2011
    Copyright 2000-2011 REBOL Technologies.  All rights reserved.
    REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM
    
    
    Type desktop to start the Viewtop.
    >> cd %/e/Languages/Red
    == %/e/Languages/Red/
    >> do %run-all.r
    Script: "Builds and Runs All Red and Red/System Tests" (none)
    Quick-Test v0.12.0
    REBOL 2.7.8.3.1
    Complete Red Test Suite
    
    Making /e/Languages/Red/quick-test/../tests/source/units/auto-tests/integer-auto-test.red  -
     it will take a while
    Number of assertions generated 1809
    .
    .
    .
    
    checking to see if interpreter test files need generating
    36 files were generated
    ok - lexer...........................................22 / 22
    ok - tools............................................7 / 7
    ok - unicode.........................................67 / 67
    ** - Red print****************************************6 / 8 **
    ok - Old Regression tests...........................119 / 119
    ok - Red run time errors..............................2 / 2
    ok - Red compile errors...............................1 / 1
    ok - logic-test.red..................................83 / 83
    ok - conditional-test.red............................11 / 11
    .
    .
    .
    ```
    
    It would help if you could let us know what problem you encountered.

--------------------------------------------------------------------------------

On 2014-06-02T15:17:33Z, srpelissier, commented:
<https://github.com/red/red/issues/842#issuecomment-44850175>

    Hello Peter. This is what I get here.
    
    Without modifying call.r:
    
    ```
    REBOL/View 2.7.8.3.1 1-Jan-2011
    Copyright 2000-2011 REBOL Technologies.  All rights reserved.
    REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM
    
    Type desktop to start the Viewtop.
    >> do %run-all.r
    Script: "Builds and Runs All Red and Red/System Tests" (none)
    ** Script Error: kernel32.dll has no value
    ** Where: context
    ** Near: kernel32: load/library kernel32.dll
    SECURITY_ATTRIBUTES: make
    >>
    ```
    
    Then after changing lines 8 ad 9 as per first comment I got the following quick-test log:
    
    ```
    ***Starting***Complete Red Test Suite
    ~~~started test~~~  lexer 
    ~~~finished test~~~  lexer 
      Number of Tests Performed:       20 
      Number of Assertions Performed:  22 
      Number of Assertions Passed:     22 
      Number of Assertions Failed:     0 
    
    ~~~started test~~~ runtime tools
    ~~~finished test~~~ runtime tools
      Number of Tests Performed:      7
      Number of Assertions Performed: 7
      Number of Assertions Passed:    7
      Number of Assertions Failed:    0
    
    ~~~started test~~~ unicode
    ~~~finished test~~~ unicode
      Number of Tests Performed:      12
      Number of Assertions Performed: 67
      Number of Assertions Passed:    67
      Number of Assertions Failed:    0
    
    ~~~started test~~~ Red print
    ---test--- Red print 1 FAILED**************
    ---test--- Red print 1 FAILED**************
    ~~~finished test~~~ Red print
    No of tests   1
    No of asserts 8
    Passed        6
    Failed        2
    ***TEST FAILURES***
    ```
    
    I killed  the process before it finished, the rebol console window was marked as "Not responding" and looking at the process from Task Manager I saw no activity for a few minutes. I am still looking into the reasons why some "Red print" cases they fail.
    
    Tweaking the call.r I needed to do, otherwise the tests would not start at all. But I see you succeed in running them all, should I wait longer then?

--------------------------------------------------------------------------------

On 2014-06-03T07:03:00Z, dockimbel, commented:
<https://github.com/red/red/issues/842#issuecomment-44926445>

    I am running it from Windows 7 64-bit also and have no issues with loading kernel32.dll. @srpelissier Does your Windows system setup have anything non-standard?

--------------------------------------------------------------------------------

On 2014-06-03T09:05:47Z, srpelissier, commented:
<https://github.com/red/red/issues/842#issuecomment-44940601>

    Maybe something is special. I'll give a try with another machine.

--------------------------------------------------------------------------------

On 2014-06-04T10:54:26Z, srpelissier, commented:
<https://github.com/red/red/issues/842#issuecomment-45076767>

    With a 32-bit virtual box, locating kernel32 is not a problem.
    Executing the tests though stops working during regression-tests.r:
    - REBOL/View window marked as (Not Responding)
    - rebol-view-278-3-1.exe process shown as using no CPU and 18272 K of memory but no activity.
    
    Last lines from quick-test\quick-test.log:
    
    ```
    ~~~started test~~~ Red print
    ---test--- Red print 1 FAILED**************
    ---test--- Red print 1 FAILED**************
    ~~~finished test~~~ Red print
    No of tests   1
    No of asserts 8
    Passed        6
    Failed        2
    ***TEST FAILURES***
    ```
    
    I plan to try another 64-bit machine soon, maybe this weekend.

--------------------------------------------------------------------------------

On 2014-06-05T06:37:25Z, qtxie, commented:
<https://github.com/red/red/issues/842#issuecomment-45185569>

    @srpelissier 
    1. REBOL/View is often no responding on my Windows 7 when running `run-all.r`. :(  I need to try many times to get all tests completed. I think it Rebol's problem. Btw, it works fine on Linux.
    2. Two tests failed. It is the first two cases in `print-test.r`. This is caused by a new fix for `print`. 
    
    ```
    >> print ["*test1* " 1]
    "*test1*  1"                    ;-- two spaces between *test1* and 1
    ```

--------------------------------------------------------------------------------

On 2014-06-05T07:00:00Z, dockimbel, commented:
<https://github.com/red/red/issues/842#issuecomment-45186846>

    @qtxie Can you please update these tests?

--------------------------------------------------------------------------------

On 2014-06-05T08:39:19Z, PeterWAWood, commented:
<https://github.com/red/red/issues/842#issuecomment-45194579>

    @qtxie @dockimbel  I've fixed the tests.

--------------------------------------------------------------------------------

On 2014-06-05T17:51:55Z, srpelissier, commented:
<https://github.com/red/red/issues/842#issuecomment-45251975>

    This is from a Windows 64 machine where I have full control, and there is nothing very special about it. I just installed rebol/view and rebased the files from github.
    
    ```
    >> do %run-all.r
    Script: "Builds and Runs All Red and Red/System Tests" (none)
    ** Access Error: Cannot open /c/Users/srp/Downloads/red-git/quick-test/kernel32.dll
    ** Where: context
    ** Near: kernel32: load/library %kernel32.dll
    SECURITY_ATTRIBUTES: make
    ```

--------------------------------------------------------------------------------

On 2014-06-06T07:23:51Z, dockimbel, commented:
<https://github.com/red/red/issues/842#issuecomment-45309759>

    The REBOL `load/library` [function](http://www.rebol.com/docs/library.html#loading) is automatically searching for the target library in all system paths. From the linked documentation:
    
    _If you only specify the file name in load/library (instead of the absolute file path), the operating system searches for the library in the current directory, then in the system library directories._
    
    So it seems that for some reason, the search stops at the current folder in your case.
    
    I do not remember experiencing such issues on my Windows 7 64bit boxes...

--------------------------------------------------------------------------------

On 2014-06-06T09:21:43Z, iArnold, commented:
<https://github.com/red/red/issues/842#issuecomment-45318192>

    "1. REBOL/View is often no responding on my Windows 7 when running run-all.r. :( I need to try many times to get all tests completed. I think it Rebol's problem. "
    'Glad' that I am not the only one experiencing this. Especially if not all memory is dedicated to Rebol/View or focus is not constantly on the compile console the test tends to hang up
    If this problem continues it can become a serious danger to the project. 

--------------------------------------------------------------------------------

On 2014-06-06T09:40:42Z, qtxie, commented:
<https://github.com/red/red/issues/842#issuecomment-45319607>

    @iArnold So now for quick test,  I use `run-all-comp.red` and `run-all-interp.red`. : )

--------------------------------------------------------------------------------

On 2014-06-09T10:49:55Z, Oldes, commented:
<https://github.com/red/red/issues/842#issuecomment-45479708>

    @qtxie and what script do you use to generate the `auto-tests`?

--------------------------------------------------------------------------------

On 2014-06-09T11:28:29Z, Oldes, commented:
<https://github.com/red/red/issues/842#issuecomment-45482129>

    @PeterWAWood I know,,I just want to make sure if @qtxie know, that above mentioned red scripts does not update the `auto-tests`. At least not now.

--------------------------------------------------------------------------------

On 2014-06-18T03:56:47Z, dockimbel, commented:
<https://github.com/red/red/issues/842#issuecomment-46393607>

    @srpelissier Could you please give it a new try using Rebol/View 2.7.6 from [here](http://www.rebol.com/downloads/rebview276.exe), the newer versions are quite buggy. I just want to check if that is the cause of your issue.

--------------------------------------------------------------------------------

On 2014-06-18T07:36:42Z, srpelissier, commented:
<https://github.com/red/red/issues/842#issuecomment-46404503>

    Hi Peter.
    Yes. In REBOL/View 2.76, the tests now run until the end. Two of them fail (function).
    (red has been updated from git)
    - in REBOL/View 2.7.8.3.1, the tests hang while "running regression-tests.r" (fifth group)
    - in REBOL/View 2.7.6.3.1, all tests pass except for:
    
    ```
    ~~~started test~~~ function
    ===group=== Scope of Varibles
    --test-- scope1 issue #825 FAILED**************
    --test-- scope2 issue #825 FAILED**************
    ~~~finished test~~~ function
      Number of Tests Performed:      55
      Number of Assertions Performed: 76
      Number of Assertions Passed:    74
      Number of Assertions Failed:    2
    ****************TEST FAILURES****************
    ```

--------------------------------------------------------------------------------

On 2014-06-18T08:30:06Z, PeterWAWood, commented:
<https://github.com/red/red/issues/842#issuecomment-46408866>

    HI Sylvain
    
    Thanks for running the tests under Rebol/View 2.7.6. (By the way, it was Nenad who sent you the request   . If anybody can fix the problem, he can.). 
    
    I added the two failing tests today and need to check the tests are correct before anything else is done.

--------------------------------------------------------------------------------

On 2014-06-18T09:19:54Z, srpelissier, commented:
<https://github.com/red/red/issues/842#issuecomment-46413153>

    Cool.

--------------------------------------------------------------------------------

On 2017-02-16T08:58:29Z, dockimbel, commented:
<https://github.com/red/red/issues/842#issuecomment-280272236>

    I am closing this ticket, as it does not describe an issue we can reproduce nowadays. If that issue can still be reproduced, please provide here all the detailed information to reproduce it, and we'll re-open this ticket.

--------------------------------------------------------------------------------

On 2017-02-16T09:27:57Z, Oldes, commented:
<https://github.com/red/red/issues/842#issuecomment-280278869>

    Actually it is still almost impossible to run `run-all.r` script on Windows, which would not stop responding. At least in regular Windows (not in VM). Just tested it now without success on Win10 with `REBOL/View 2.7.8.3.1 1-Jan-2011`. I guess we cannot do much with it as it will be Rebol's issue. Maybe port the test scripts to Red asap.

--------------------------------------------------------------------------------

On 2017-02-16T13:35:25Z, dockimbel, commented:
<https://github.com/red/red/issues/842#issuecomment-280331559>

    I don't trust 2.7.7 and 2.7.8 on Windows, I always use 2.7.6 and have no issue running the tests. @PeterWAWood will be working on porting the testing framework to Red as soon as we integrate CALL properly into the Red runtime library.

--------------------------------------------------------------------------------

On 2017-02-20T19:41:43Z, Oldes, commented:
<https://github.com/red/red/issues/842#issuecomment-281165927>

    @dockimbel I don't have 2.7.6 anymore... do you know a link where it's available?

