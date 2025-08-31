
#4376: Long String Crashes Console
================================================================================
Issue is closed, was reported by dsunanda and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4376>

**Describe the bug**
Console completely vanishes - Red gone.

**To reproduce**

   data: copy " " forever [append data: "x" data]

-- Thanks to hiiamboris for that one liner version demo of the problem.

**Expected behavior**
If there is a max string length, I'd hope it is a capturable error, not an uncontrolled crash,

This was discovered when a GUI app started going weird when reading large files (over 500MB .ZIP files) - the app would ping out of existence at random points unrelated to the READ statements.
 The READs worked, but must have broken something in the background.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 18-Mar-2020/12:57:39+01:00 commit #101a64f
```
hiiamboris reports replicating problem on Win7.


EDIT -- corrected typo. "Over 500GB" corrected to "Over 500MB"


Comments:
--------------------------------------------------------------------------------

On 2020-03-31T22:13:51Z, 9214, commented:
<https://github.com/red/red/issues/4376#issuecomment-606905067>

    ```red
    forever body: [append "" body]
    ````
    ```red
    root: 4430/5466, runs: 0, mem: 3014072 => 2731276, mark: 6.0ms, sweep: 1.0ms
    root: 4430/5466, runs: 1, mem: 2993516 => 2862348, mark: 2.0ms, sweep: 0.0ms
    root: 4430/5466, runs: 2, mem: -2145144436 => 1076342028, mark: 3.0ms, sweep: 95.7ms
    
    *** Runtime Error 1: access violation
    *** Cannot determine source file/line info.
    ***
    ```

