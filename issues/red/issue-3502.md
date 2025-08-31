
#3502: CI:AppVeyor testing not completing due to reaching maximum 1 hour execution time
================================================================================
Issue is closed, was reported by x8x and has 22 comment(s).
<https://github.com/red/red/issues/3502>

We have an issue where AppVeyor CI randomly errors out with this message:
`Build execution time has reached the maximum allowed time for your plan (60 minutes).`
It doesn't seam to be an error within the testing framework and there is no common pattern of failure.
Something gets stuck while tests are running which prevent completion.
List of such events happening in the last year:

https://ci.appveyor.com/project/red/red/build/1.0.2205/messages
https://ci.appveyor.com/project/red/red/build/1.0.2199/messages
https://ci.appveyor.com/project/red/red/build/1.0.2183/messages
https://ci.appveyor.com/project/red/red/build/1.0.2177/messages
https://ci.appveyor.com/project/red/red/build/1.0.2152/messages
https://ci.appveyor.com/project/red/red/build/1.0.2135/messages
https://ci.appveyor.com/project/red/red/build/1.0.2130/messages
https://ci.appveyor.com/project/red/red/build/1.0.2063/messages
https://ci.appveyor.com/project/red/red/build/1.0.2056/messages
https://ci.appveyor.com/project/red/red/build/1.0.2035/messages
https://ci.appveyor.com/project/red/red/build/1.0.2016/messages
https://ci.appveyor.com/project/red/red/build/1.0.2015/messages
https://ci.appveyor.com/project/red/red/build/1.0.2011/messages
https://ci.appveyor.com/project/red/red/build/1.0.2000/messages
https://ci.appveyor.com/project/red/red/build/1.0.1994/messages
https://ci.appveyor.com/project/red/red/build/1.0.1986/messages
https://ci.appveyor.com/project/red/red/build/1.0.1968/messages
https://ci.appveyor.com/project/red/red/build/1.0.1966/messages
https://ci.appveyor.com/project/red/red/build/1.0.1963/messages
https://ci.appveyor.com/project/red/red/build/1.0.1950/messages
https://ci.appveyor.com/project/red/red/build/1.0.1947/messages
https://ci.appveyor.com/project/red/red/build/1.0.1944/messages
https://ci.appveyor.com/project/red/red/build/1.0.1925/messages
https://ci.appveyor.com/project/red/red/build/1.0.1923/messages
https://ci.appveyor.com/project/red/red/build/1.0.1907/messages
https://ci.appveyor.com/project/red/red/build/1.0.1902/messages
https://ci.appveyor.com/project/red/red/build/1.0.1890/messages
https://ci.appveyor.com/project/red/red/build/1.0.1884/messages
https://ci.appveyor.com/project/red/red/build/1.0.1872/messages
https://ci.appveyor.com/project/red/red/build/1.0.1864/messages
https://ci.appveyor.com/project/red/red/build/1.0.1862/messages
https://ci.appveyor.com/project/red/red/build/1.0.1839/messages
https://ci.appveyor.com/project/red/red/build/1.0.1836/messages
https://ci.appveyor.com/project/red/red/build/1.0.1829/messages
https://ci.appveyor.com/project/red/red/build/1.0.1821/messages
https://ci.appveyor.com/project/red/red/build/1.0.1797/messages
https://ci.appveyor.com/project/red/red/build/1.0.1746/messages
https://ci.appveyor.com/project/red/red/build/1.0.1718/messages
https://ci.appveyor.com/project/red/red/build/1.0.1674/messages
https://ci.appveyor.com/project/red/red/build/1.0.1669/messages
https://ci.appveyor.com/project/red/red/build/1.0.1664/messages
https://ci.appveyor.com/project/red/red/build/1.0.1639/messages

IIRC @PeterWAWood and @dockimbel  or @qtxie mentioned this in the past, the only cause that I can think of is a problem with `Rebol` and its `call` function which as we know has issues on Windows.
Also curious if running Windows tests on Wine on Travis in parallel could/would be a good idea, thought that wont workaround issues with `Rebol` if that's the problem.

Any ideas on causes and resolutions most welcome!


Comments:
--------------------------------------------------------------------------------

On 2018-08-13T02:32:42Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3502#issuecomment-412393846>

    This seems to be a Rebol issue on Windows 8 & Windows 10. I'm not sure if it is 'call related as it happens with Rebol 2.7.6 and Rebol 2.7.8. I spent a long time with Josh Shireman trying, unsuccessfully, to debug this issue.
    
    I suspect it would be better to rewrite run-all in Red than trying to find a workaround to the Rebol problem.

--------------------------------------------------------------------------------

On 2018-08-22T03:05:39Z, x8x, commented:
<https://github.com/red/red/issues/3502#issuecomment-414893623>

    @PeterWAWood Did you try adding `call/show ""` at the beginning of Rebol scripts?
    It's the trick to workaround `call` problems.

--------------------------------------------------------------------------------

On 2018-12-05T14:56:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/3502#issuecomment-444513677>

    @PeterWAWood there's an asynchronous call facility https://www.softinnov.org/rebol/acall.shtml written by no other than @dockimbel. It only supports Windows, but then the bug only happens on Windows (W7 also). With it we could invoke each test file as a detached process and then allow it some time (like 1-2 minutes) to finish and if it doesn't then kill it by it's PID (port/locals/proc-info/dwProcessID) and start again. What do you think?
    
    I'm working on the resurrection of this PR https://github.com/red/red/pull/2191/ and there's a part containing about a hundred Red scripts that should be compiled separately and either succeed or report an error. Trouble is, I ran it 4 times and it hanged up 4/4. Always at different tests.
    
    I just want to stress the importance of this issue: if we circumvent it we will be able to run *a lot* of tests that require compilation.

--------------------------------------------------------------------------------

On 2018-12-10T02:40:34Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3502#issuecomment-445637604>

    @hiiamboris I think a better way to solve this issue is to stop using the Rebol test runner. `quick-test` testing running features badly need a complete overhaul. I don't think it is sensible to do that before Red has proper I/O features and without some proper design work.
    
    As a temporary fix, the current Rebol test runners could be ported to Red. The main issue that I see of moving the test runners over to Red is how to identify where the Rebol executable is located as people could put it anywhere, it may not be in their execution PATH. A pre-requisite to run Red tests could be that Rebol must be in their execution PATH. I would be happy to accept that limitation, I'm not sure about @dockimbel and @greggirwin.
    
    As the main concern is the reliability of the AppVeyor tests, I would suggest that the best first step would be to rewrite `red/tests/run-all.r` in Red. It would need to be extended to use `call` to compile and run the tests. In order to save time, the current Rebol scripts which assemble the tests could be run from Red using `call`. 
    
    By the way, I run the tests on Windows 7 and have never experienced this issue on Windows 7. I don't run the tests on Windows 10 very often but rarely hit the problem on my machine (i7 2.5GHz). Though I did face the issue on about 9 runs out of 10 when I ran them on an iWork8 tablet.

--------------------------------------------------------------------------------

On 2018-12-10T02:53:03Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3502#issuecomment-445642194>

    Re: PR #2191 The bootstrap compiler is not really conducive to testing the compiler catches errors. Running individual tests is slow, it must be the start-up time either of launching Rebol via call or the compiler itself. Whichever, it isn't going to change with the bootstrap compiler.
    
    We have continually been struggling to keep the time of the test runs reasonable. Effectively, we have had to limit the test suite to test compiled code and run-time exceptions. All I can suggest is to create a separate test suite of scripts that need to be compiled individually and for them to be run manually when appropriate.
    
    I suspect it would be easier to test most of these compiler errors with unit tests of the compiler but there aren't any. I'm not sure anybody is going to write them now though.

--------------------------------------------------------------------------------

On 2018-12-10T15:18:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/3502#issuecomment-445852175>

    @PeterWAWood 
    A few numbers regarding #2191 for my W7 on i5-3450.
    R/S compiler tests (~100 of them) take 40 sec (0.4 sec/test)
    Red compiler tests (~150 of them) take 4 mins (1.5 sec/test)
    All tests (without these mentioned) take 5 mins. So I guess including R/S into that won't make a big difference.
    
    If I may propose some /option to %run-all.r that will allow omit the compiler tests? This way we will have:
    - a full run in Travis/Appveyor to be able to detect regressions right when they happen
    - contributors won't have to wait too long if they don't want to test the compiler
    
    If there are arguments against that, then I can make a separate test script for compiler tests. Not sure anybody will bother to run these tests however.
    
    Now to the funnier things I just discovered!
    
    Test suite freezes on my W7 80% of the time. I'm using 2.7.8.3.1, as 2.7.6 isn't working with the tests anymore. But it was enough for me to comment this line https://github.com/red/red/blob/master/quick-test/quick-test.r#L81 to stop all the freezes!
    It seems the thing that's supposed to fix the bug, causes it instead. So my guess now is that to resolve this AppVeyor issue it will be enough to comment this line and use Rebol's native call.
    
    I'm not aware of the history of this bug however. How it came to be that the bug is caused by the fix?

--------------------------------------------------------------------------------

On 2018-12-10T15:48:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/3502#issuecomment-445863343>

    Turns out the bug was very obvious after all.
    https://github.com/red/red/blob/master/utils/call.r#L266 this is wrong. When a write occurs between PeekPipe and ReadFile the remain goes negative and it deadlocks.

--------------------------------------------------------------------------------

On 2018-12-11T08:45:54Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3502#issuecomment-446118985>

    @hiiamboris Thank you very much for solving this longstanding issue.

--------------------------------------------------------------------------------

On 2018-12-11T09:02:04Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3502#issuecomment-446123891>

    @hiiamboris Re: "If I may propose some /option to %run-all.r that will allow omit the compiler tests? This way we will have:
    * a full run in Travis/Appveyor to be able to detect regressions right when they happen
    * contributors won't have to wait too long if they don't want to test the compiler"
    
    I suspect it would be best to have four test sub-suites:
    1. Red/System Tests - .reds files
    2. Red Tests - .red files
    3. Red/System Compiler Tests - .r files (including tests of print)
    4. Red  Compiler Tests -.r files (including tests of Rebol lexer, etc.)
    
    There could then be a hierarchy of run scripts:
    - run-all
      - tests
         - run-all
           - run-all-function
           - run-all-compiler
      - system/tests
        - run-all
          - run-all-function
          - run-all-compiler
    
    (The naming scheme could probably be improved).

--------------------------------------------------------------------------------

On 2018-12-11T09:50:27Z, dockimbel, commented:
<https://github.com/red/red/issues/3502#issuecomment-446139175>

    @hiiamboris Great job at investigating the issue and finding the bug! 👍 💯 

--------------------------------------------------------------------------------

On 2019-02-14T17:16:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/3502#issuecomment-463711934>

    This issue can be closed.

