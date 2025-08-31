
#5614: Raspberry Pi View (9-May-2025) crashes when left running
================================================================================
Issue is open, was reported by PeterWAWood and has 4 comment(s).
[type.bug] [GUI.GTK]
<https://github.com/red/red/issues/5614>

**Describe the bug**
If a simple layout is left running after 10 t0 15 minutes Red/View crashes

**To reproduce**
Steps to reproduce the behavior:
1. Run attached add-annual-data.red
2. Leave it running
3. Red crashes

I ran the script with a debug version of Red. The Red console log is attached.

[RedViewRPiCrashConsole.log](https://github.com/user-attachments/files/20201312/RedViewRPiCrashConsole.log)

**Expected behavior**
The Red script continues to run

**Platform version**
>> about/debug
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.6 ahead: 53 date: 9-May-2025/20:49:07 commit: #1f24c7686b622be8770cb4ee0ed4a9a183eba24a ]
PLATFORM: [ name: "Raspbian GNU/Linux 11 (bullseye)" OS: 'Linux arch: 'aarch64 version: 6.1.21 build: "#1642 SMP PREEMPT Mon Apr  3 17:24:16 BST 2023" ]

Note: Although the machine has a 64-bit processor the OS is the 32-bit version.

**Script**
Please remove the .txt file extension added to get the file to attach to the issue.
[add-annual-data.red.txt](https://github.com/user-attachments/files/20201321/add-annual-data.red.txt)


Comments:
--------------------------------------------------------------------------------

On 2025-05-19T10:14:45Z, PeterWAWood, commented:
<https://github.com/red/red/issues/5614#issuecomment-2890460058>

    I experienced  a similar crash when probiing the system object from the GUI debug-console. The actions I took were:
    1. Launch new GUI console
    2. help system
    3. help system/view
    4. help system/view/VID
    5. help system/view/VID/default-font
    6. probe system/view/VID/default-font
    
    The crash log 
    ```
    gui-console:4675): Gtk-CRITICAL **: 17:53:42.250: gtk_widget_queue_draw: assertion 'GTK_IS_WIDGET (widget)' failed
    root: 7405/10088, runs: 0, mem: 3266124 => 3036660, mark: 19.9ms, sweep: 13.6ms
    root: 7405/10088, runs: 1, mem: 5450908 => 3045364, mark: 8.2ms, sweep: 25.1ms
    root: 7405/10088, runs: 2, mem: 5449924 => 3046656, mark: 8.5ms, sweep: 25.0ms
    
    *** Runtime Error 1: access violation
    *** in file: /C/users/peter/red/red-master/runtime/hashtable.reds
    *** at line: 2546
    ***
    ***   --Frame-- --Code--  --Call--
    ***   FF96EB10h 000829D8h red/_hashtable/get-ctx-word F20C9A24h 5
    ***   FF96EB38h 000B0B08h red/word/from F4A178D4h 5
    ***   FF96EB58h 000B0A4Ch red/word/push-local F4A178D4h 5
    ***   FF96EBB8h 0024A764h ask
    ***   FF96EBF8h 00208490h ctx||618~run F4A1569Ch
    ***   FF96EC4Ch 00209414h ctx||618~launch F4A1569Ch
    ***   FF96EC88h 0024A494h ctx||653~launch F4A15FECh
    ***   FF96ECA0h 00059400h ***_start
    ```
    I can reproduce the crash intermittently by probing the content of various words in system/view/VID.

--------------------------------------------------------------------------------

On 2025-05-28T08:12:43Z, qtxie, commented:
<https://github.com/red/red/issues/5614#issuecomment-2915390940>

    No crashes when running [add-annual-data.red](https://github.com/user-attachments/files/20201321/add-annual-data.red.txt) with [red-view-28may25-8905efb02](https://static.red-lang.org/dl/auto/rpi/red-view-28may25-8905efb02) on Armbian. 

