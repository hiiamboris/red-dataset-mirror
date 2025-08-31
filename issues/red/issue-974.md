
#974: RANDOM action not defined
================================================================================
Issue is closed, was reported by kealist and has 62 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/974>

On Windows, in the latest development release, I cannot get `random` to work (with integers).  It works fine in the stable 0.4.3 version, but seems there is a regression.

```
C:\Users\kealist\Documents\GitHub\red\Kingdom>red-04nov14-3930d0c.exe
Pre-compiling Red console...

-=== Red Console alpha version ===-
Type HELP for starting information.

red>> random 3

*** Script error: action 30 not defined for type: 7
```



Comments:
--------------------------------------------------------------------------------

On 2014-11-05T02:15:11Z, qtxie, commented:
<https://github.com/red/red/issues/974#issuecomment-61749562>

    It is weird. Seems the build farm used an old master branch.

--------------------------------------------------------------------------------

On 2014-11-05T03:06:42Z, qtxie, commented:
<https://github.com/red/red/issues/974#issuecomment-61753335>

    It's caused by RANDOM action will COPY values before shuffling it, but no COPY action defined for INTEGER. It should copy SERIES value only.

--------------------------------------------------------------------------------

On 2014-11-05T06:22:50Z, qtxie, commented:
<https://github.com/red/red/issues/974#issuecomment-61764936>

    In R3, RANDOM on series works "in place", while in R2 it will shallow COPY the series before shuffling it.
    I don't know what behaviors should be used in Red, "in place", "copy" or "deep copy" ?
    
    I think R3's way is more flexible as the users could choice "copy" or "deep copy" as they need.

--------------------------------------------------------------------------------

On 2014-11-05T16:46:25Z, kealist, commented:
<https://github.com/red/red/issues/974#issuecomment-61839239>

    Also, not really sure what kind of tests should be implemented for random but at the very least asserting `1 = random 1` should catch things such as this.   

--------------------------------------------------------------------------------

On 2014-11-05T16:47:34Z, kealist, commented:
<https://github.com/red/red/issues/974#issuecomment-61839523>

    (I have too much trouble running Red tests in Windows or I would add pull requests for more tests)

--------------------------------------------------------------------------------

On 2014-11-06T01:32:26Z, dockimbel, commented:
<https://github.com/red/red/issues/974#issuecomment-61913880>

    @kealist What kind of issues with running tests do you have?
    
    @PeterWAWood ----^

--------------------------------------------------------------------------------

On 2014-11-06T01:43:06Z, kealist, commented:
<https://github.com/red/red/issues/974#issuecomment-61914751>

    The R2 process locks up and stops responding at some level during the tests.  It happens on both my windows machines (and others I've tried) at random points in the tests.   A while back, Peter and I had tried to find a workaround, but nothing seemed to resolve it.  I tried a couple versions of R2, with the same results and just gave up.   (out of the ~50 times I ran the whole testing suite, it completed successfully without locking up maybe 2 times) 

--------------------------------------------------------------------------------

On 2014-11-06T03:29:22Z, dockimbel, commented:
<https://github.com/red/red/issues/974#issuecomment-61922340>

    @kealist Have you tried with Rebol2 2.7.6? 
    
    Are your Windows CPU and HDD especially slow or fast?

--------------------------------------------------------------------------------

On 2014-11-08T17:39:58Z, kealist, commented:
<https://github.com/red/red/issues/974#issuecomment-62266336>

    @dockimbel 
    
    Here is a screenshot of what happens (This is 2.7.6--Just tried again): 
    ![freezing](https://cloud.githubusercontent.com/assets/5009062/4964954/e0312f22-673b-11e4-9f0a-6ff35e3cac13.PNG)
    It stops responding (I've let it run for a long long time to see if it would ever recover--even more than a day, but nope)

--------------------------------------------------------------------------------

On 2014-11-08T18:11:25Z, kealist, commented:
<https://github.com/red/red/issues/974#issuecomment-62269309>

    Didn't see the other questions:  
    
    CPU is AMD Phenom II x4 945 3.00Ghz Processor
    HDD is just some SATA drive, nothing too fast or slow I believe

--------------------------------------------------------------------------------

On 2014-11-09T03:15:54Z, dockimbel, commented:
<https://github.com/red/red/issues/974#issuecomment-62289186>

    @kealist Does it freeze always at the same test (lexer-test)? Which Windows version are you using?

--------------------------------------------------------------------------------

On 2014-11-09T04:48:21Z, kealist, commented:
<https://github.com/red/red/issues/974#issuecomment-62291320>

    @dockimbel It is not consistent which test it freezes on (and occasionally it does not happen)   I have experienced this both on Windows 7 (3 different machines) and Windows 8 (1 machine)

--------------------------------------------------------------------------------

On 2014-11-09T06:55:45Z, qtxie, commented:
<https://github.com/red/red/issues/974#issuecomment-62293818>

    @kealist I have previously run into this problem. But it works fine now. I use [this version](http://www.rebol.com/downloads/v276/rebcore.exe) of Rebol.

--------------------------------------------------------------------------------

On 2014-11-10T02:20:42Z, kealist, commented:
<https://github.com/red/red/issues/974#issuecomment-62332966>

    @qtxie I tried that version, but same result.  
    
    @dockimbel It wasn't this way a few months ago, but in the last couple days it has been freezing immediately on the lexer tests

--------------------------------------------------------------------------------

On 2014-11-10T02:28:52Z, dockimbel, commented:
<https://github.com/red/red/issues/974#issuecomment-62333401>

    @kealist Could you put a TRACE ON before starting the tests in the console session, so that we get a clue about what makes it freeze? (Will take a long time probably to run due to verbose logging). Please post here the captured output once the freezing is reached ("Not responding" message in the title bar).

--------------------------------------------------------------------------------

On 2014-11-10T02:39:46Z, kealist, commented:
<https://github.com/red/red/issues/974#issuecomment-62334010>

    @dockimbel 
    
    Here it is:
    
    ![trace on](https://cloud.githubusercontent.com/assets/5009062/4970519/1e1aaa0e-6884-11e4-9c2b-d2839c1ab9b0.PNG)

--------------------------------------------------------------------------------

On 2014-11-10T04:50:57Z, dockimbel, commented:
<https://github.com/red/red/issues/974#issuecomment-62341133>

    Thank you. As I suspected it's related to CALL. @PeterWAWood Do you have an idea what's going wrong here? Is the `output` buffer correctly initialized and big enough, so it doesn't get reallocated by Rebol?

--------------------------------------------------------------------------------

On 2014-11-10T05:09:51Z, PeterWAWood, commented:
<https://github.com/red/red/issues/974#issuecomment-62342092>

    In this case, I suspect the call is failing as Josh is running the tests under Rebol/Core. I suspect that running them under Rebol/View will result in the more random hangs that Josh suffered from before.

--------------------------------------------------------------------------------

On 2014-11-10T09:28:55Z, dockimbel, commented:
<https://github.com/red/red/issues/974#issuecomment-62359866>

    @kealist Please try the following change to see if it helps fix the issue: 
    
    At line 90 of file %quick-test/quick-test.r, change the following line:
    
    ```
     output: copy ""
    ```
    
    to
    
    ```
    output: make string! 100'000
    ```
    
    Then re-run the tests to see if it helps.
    
    If it doesn't help, try this other option: add a `/show` refinement to all the CALL instance you will find in the `%quick-test.r` script. A DOS window should open then on each compiled test file. See if you can find in these DOS windows an error message.

--------------------------------------------------------------------------------

On 2014-11-10T16:29:26Z, kealist, commented:
<https://github.com/red/red/issues/974#issuecomment-62410612>

    @dockimbel Changing line 90 resulted in the same freezing behavior.
    
    2.7.6 (View) Using the `/show` refinement seems to let the tests run for a while, but then froze up:
    
    ![276view-show](https://cloud.githubusercontent.com/assets/5009062/4978896/3091deae-68f3-11e4-9138-3a9e9d5c19b4.PNG)
    
    2.7.8 (View) Using the `/show` refinement seems to do the same thing:
    
    ![278view-show](https://cloud.githubusercontent.com/assets/5009062/4979387/ba44a75a-68f6-11e4-9e9b-3ebac4dc908a.PNG)

--------------------------------------------------------------------------------

On 2014-11-10T16:30:20Z, kealist, commented:
<https://github.com/red/red/issues/974#issuecomment-62410769>

    No error messages shown (DOS Windows pop open for a split second, not viewable)

--------------------------------------------------------------------------------

On 2014-11-10T17:55:23Z, earl, commented:
<https://github.com/red/red/issues/974#issuecomment-62424816>

    @qtxie Which version of Windows are you using? (Yes, that question is directed at @qtxie and not @kealist :)

--------------------------------------------------------------------------------

On 2014-11-10T19:45:11Z, kealist, commented:
<https://github.com/red/red/issues/974#issuecomment-62442354>

    I had switched to 2.7.6 View after Peter's comment (figured there wasn't that much difference), but testing core again (that @qtxie recommended), and the first time I ran the tests, it completed with two test errors and [many other word has not value errors in the log file](https://gist.github.com/kealist/a4783f717ad47d56d59d)
    
    ```
    REBOL/Core 2.7.6.3.1 (14-Mar-2008)
    Copyright 2008 REBOL Technologies
    REBOL is a Trademark of REBOL Technologies
    All rights reserved.
    
    Finger protocol loaded
    Whois protocol loaded
    Daytime protocol loaded
    SMTP protocol loaded
    ESMTP protocol loaded
    POP protocol loaded
    IMAP protocol loaded
    HTTP protocol loaded
    FTP protocol loaded
    NNTP protocol loaded
    Script: "User Preferences" (10-Nov-2014/9:50:27-6:00)
    >> do %run-all.r
    Script: "Builds and Runs All Red and Red/System Tests" (none)
    Quick-Test v0.12.0
    REBOL 2.7.6.3.1
    Complete Red Test Suite
    
    checking to see if interpreter test files need generating
    0 files were generated
    ok - lexer...........................................29 / 29
    ok - tools............................................7 / 7
    ok - unicode.........................................67 / 67
    ok - Red print........................................8 / 8
    ok - Old Regression tests...........................119 / 119
    ok - Red run time errors..............................2 / 2
    ok - Red compile errors...............................1 / 1
    ok - logic...........................................83 / 83
    ok - conditional.....................................11 / 11
    ok - series.........................................301 / 301
    ok - path............................................41 / 41
    ok - serialization..................................313 / 313
    ok - function........................................76 / 76
    ok - loop............................................15 / 15
    ok - type............................................38 / 38
    ok - find...........................................110 / 110
    ok - select..........................................46 / 46
    ok - binding.........................................22 / 22
    ok - evaluation......................................93 / 93
    ok - load............................................37 / 37
    ok - switch..........................................21 / 21
    ok - case............................................45 / 45
    ok - routine.........................................11 / 11
    ok - append..........................................28 / 28
    ok - insert..........................................73 / 73
    ok - make.............................................2 / 2
    ok - system...........................................4 / 4
    ok - parse..........................................862 / 862
    ok - bitset.........................................138 / 138
    ok - same............................................43 / 43
    ok - strict-equal....................................51 / 51
    ok - object..........................................30 / 30
    ok - integer.........................................53 / 53
    ok - char............................................20 / 20
    ** - float******************************************111 / 112 **
    ok - integer-auto..................................1809 / 1809
    ok - infix-equal-auto................................52 / 52
    ok - equal-auto......................................52 / 52
    ok - infix-not-equal-auto............................51 / 51
    ok - not-equal-auto..................................51 / 51
    ok - infix-lesser-auto...............................25 / 25
    ok - lesser-auto.....................................25 / 25
    ok - infix-lesser-equal-auto.........................25 / 25
    ok - lesser-equal-auto...............................25 / 25
    ok - infix-greater-auto..............................25 / 25
    ok - greater-auto....................................25 / 25
    ok - infix-greater-equal-auto........................25 / 25
    ok - greater-equal-auto..............................25 / 25
    ok - interp-binding..................................22 / 22
    ok - interp-case.....................................45 / 45
    ok - interp-conditional..............................11 / 11
    ok - interp-evaluation...............................93 / 93
    ok - interp-find....................................110 / 110
    ok - interp-function.................................74 / 74
    ok - interp-load.....................................37 / 37
    ok - interp-logic....................................83 / 83
    ok - interp-loop.....................................15 / 15
    ok - interp-select...................................46 / 46
    ok - interp-serialization...........................313 / 313
    ok - interp-series..................................301 / 301
    ok - interp-type.....................................38 / 38
    ok - interp-switch...................................21 / 21
    ok - interp-append...................................28 / 28
    ok - interp-insert...................................73 / 73
    ok - interp-system....................................4 / 4
    ok - interp-parse...................................862 / 862
    ok - interp-bitset..................................138 / 138
    ok - interp-integer..................................53 / 53
    ** - interp-float***********************************111 / 112 **
    ok - interp-char.....................................20 / 20
    ok - interp-equal-auto...............................52 / 52
    ok - interp-same.....................................43 / 43
    ok - interp-greater-auto.............................25 / 25
    ok - interp-inf-equal-auto...........................52 / 52
    ok - interp-strict-equal.............................51 / 51
    ok - interp-inf-greater-auto.........................25 / 25
    ok - interp-inf-lesser-auto..........................25 / 25
    ok - interp-inf-lesser-equal-auto....................25 / 25
    ok - interp-inf-not-equal-auto.......................51 / 51
    ok - interp-integer-auto...........................1809 / 1809
    ok - interp-float-auto.............................1617 / 1617
    ok - interp-lesser-auto..............................25 / 25
    ok - interp-lesser-equal-auto........................25 / 25
    ok - interp-not-equal-auto...........................51 / 51
    ok - alias-compile....................................3 / 3
    ok - cast-compile....................................29 / 29
    ok - comp-err.........................................2 / 2
    ok - exit-err.........................................3 / 3
    ok - int-literals-err.................................1 / 1
    ok - output...........................................3 / 3
    ok - return-err.......................................5 / 5
    ok - conditions-required-err.........................23 / 23
    ok - inference-err....................................1 / 1
    ok - callback-err.....................................2 / 2
    ok - infix-compile....................................3 / 3
    ok - not-compile......................................1 / 1
    ok - print............................................3 / 3
    ok - enumerations compile............................12 / 12
    ok - pointer-compile..................................2 / 2
    ok - namespace compiler tests........................10 / 10
    ok - compiles-ok......................................1 / 1
    ok - dylib compiler...................................2 / 2
    ok - logic..........................................105 / 105
    ok - byte............................................40 / 40
    ok - c-string........................................20 / 20
    ok - struct.........................................116 / 116
    ok - pointer.........................................69 / 69
    ok - cast............................................93 / 93
    ok - alias...........................................23 / 23
    ok - length..........................................11 / 11
    ok - null............................................11 / 11
    ok - enum............................................19 / 19
    ok - float...........................................60 / 60
    ok - float32.........................................55 / 55
    ok - lib.............................................15 / 15
    ok - get-pointer......................................5 / 5
    ok - float-pointer...................................61 / 61
    ok - namespace......................................110 / 110
    ok - not.............................................44 / 44
    ok - size............................................38 / 38
    ok - function.........................................6 / 6
    ok - case............................................64 / 64
    ok - switch..........................................85 / 85
    ok - exit.............................................9 / 9
    ok - return..........................................25 / 25
    ok - modulo..........................................38 / 38
    ok - math-mixed.....................................114 / 114
    ok - infix............................................2 / 2
    ok - conditional.....................................15 / 15
    ok - common..........................................16 / 16
    ok - byte-auto.....................................3636 / 3636
    ok - integer-auto..................................2778 / 2778
    ok - maths-auto....................................1661 / 1661
    ok - float-auto....................................1617 / 1617
    ok - float32-auto..................................1023 / 1023
    ok - dylib-auto.......................................7 / 7
    
    ** - Complete Red Test Suite**********************23603 / 23605 **
           in 1:16:29.886
    
    The test output was logged to /V/rebol/r/red-master/quick-test/quick-test.log
    hit enter to finish
    
    == 2
    ```

--------------------------------------------------------------------------------

On 2014-11-10T21:41:55Z, PeterWAWood, commented:
<https://github.com/red/red/issues/974#issuecomment-62460384>

    The two errors would be expected at the moment but not the word not defined messages in the log. I'll take a look at those and sort them out.
    .

--------------------------------------------------------------------------------

On 2014-11-10T22:10:44Z, kealist, commented:
<https://github.com/red/red/issues/974#issuecomment-62465077>

    There are also a couple `unset` that show up as well.

--------------------------------------------------------------------------------

On 2014-11-10T22:21:22Z, kealist, commented:
<https://github.com/red/red/issues/974#issuecomment-62466670>

    @PeterWAWood A couple questions that probably aren't too important:
    
    Are [these lines](https://gist.github.com/kealist/a4783f717ad47d56d59d#file-results-of-red-tests-L1603) supposed to show up?
    
    Why do [some tests have a single newline between them](https://gist.github.com/kealist/a4783f717ad47d56d59d#file-results-of-red-tests-L1560)
    
    ```
    ~~~started test~~~ not-compile
    ~~~finished test~~~ not-compile
    ```
    
    where others [have two newlines between them for output](https://gist.github.com/kealist/a4783f717ad47d56d59d#file-results-of-red-tests-L1611):
    
    ```
    ~~~started test~~~ logic
    
    ~~~finished test~~~ logic
    ```
    
    Just a formatting question, but wondering if something got changed at that point in the test that modified the rest of the tests

--------------------------------------------------------------------------------

On 2014-11-10T22:24:00Z, kealist, commented:
<https://github.com/red/red/issues/974#issuecomment-62467034>

    @PeterWAWood [This](https://gist.github.com/kealist/a4783f717ad47d56d59d#file-results-of-red-tests-L1737) also looks a bit odd.

--------------------------------------------------------------------------------

On 2014-11-10T23:32:32Z, PeterWAWood, commented:
<https://github.com/red/red/issues/974#issuecomment-62476242>

    @kealist I will also look into them though on the surface their appear to be superficial rather than the problem that is causing the tests to hang.

--------------------------------------------------------------------------------

On 2014-11-11T00:23:06Z, qtxie, commented:
<https://github.com/red/red/issues/974#issuecomment-62481570>

    @earl I'm using Windows 7 64bit. I think Windows 8 64bit would also work well as I used it several months last year and didn't experience any problems.

--------------------------------------------------------------------------------

On 2014-11-11T00:37:46Z, kealist, commented:
<https://github.com/red/red/issues/974#issuecomment-62482888>

    So with rebol 2.7.6 core and `/show` enabled I've been able to run the tests three times on two of my machines successfully.   

--------------------------------------------------------------------------------

On 2014-11-11T02:30:07Z, PeterWAWood, commented:
<https://github.com/red/red/issues/974#issuecomment-62492725>

    This is correct: 
    
    ```
    ~~~started test~~~ pointer! [float!]
    
    ```
    
    The title of the test file is "pointer! [float!]"

