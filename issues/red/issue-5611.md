
#5611: REDBIN file randomly reported as corrupt
================================================================================
Issue is closed, was reported by dsunanda and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5611>

**Describe the bug**
REDBIN file sometimes LOADs, sometimes reported as corrupt, sometimes crashes entire console session.

**To reproduce**
    repeat n 10 [print n load/as %app-cache.dmp 'redbin recycle]

**Expected behavior**
Consistent loading of file.



**Platform version**
Windows.
Older 0.6.5
Stable 0.6.6
Latest  0.6.6 - Red 0.6.6 for Windows built 10-Apr-2025/9:36:53+01:00  commit #86494e4


[app-cache.dmp](https://github.com/user-attachments/files/19931096/app-cache.dmp)


Comments:
--------------------------------------------------------------------------------

On 2025-04-28T06:10:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/5611#issuecomment-2834078154>

    ```
    *** Runtime Error 98: assertion failed
    *** in file: /d/devel/red/red-src/master/runtime/redbin.reds
    *** at line: 934
    ***
    ***   --Frame-- --Code--  --Call--
    ***   010DF420h 004A92C8h red/redbin/fill-context 086CC660h 086FD94Ch 08660044h 05580260h
    ***   010DF460h 004A9B73h red/redbin/decode-object 086CC5B0h 086FD94Ch 08660044h 0577A514h false
    ***   010DF4A0h 004A8CEAh red/redbin/decode-value 086CC5B0h 086FD94Ch 08660044h 0577A514h
    ***   010DF4DCh 004AB20Fh red/redbin/decode-block 086CC5B0h 086FD94Ch 08660044h 0577A4BCh false
    ***   010DF51Ch 004A885Bh red/redbin/decode-value 0869A4F0h 086FD94Ch 08660044h 0577A4BCh
    ***   010DF55Ch 004AB368h red/redbin/decode-map 0869A4F0h 086FD94Ch 08660044h 05308E74h false
    ***   010DF59Ch 004A8C18h red/redbin/decode-value 086600C8h 086FD94Ch 08660044h 05308E74h
    ***   010DF5F8h 004A7C94h red/redbin/decode 0866002Ch 05308E74h true
    ***   010DF624h 00516DE0h ctx||325~decode 05308E54h
    ***   010DF6B0h 00499169h red/interpreter/exec-routine 05308E44h
    ***   010DF6ECh 0049AB6Ah red/interpreter/eval-code 054BA32Ch 0562E454h 0562E454h 05308E34h false 0562E434h 0562E47Ch 05308D84h 0 false
    ***   010DF770h 0049976Bh red/interpreter/eval-path 0562E47Ch 0562E444h 0562E454h 05308E34h false false false false
    ***   010DF7ECh 0049B5D4h red/interpreter/eval-expression 0562E444h 0562E454h 05308E34h false false false
    ***   010DF83Ch 0049BB5Ch red/interpreter/eval 05308E34h true
    ***   010DF89Ch 00484325h red/natives/do* true -1 -1 -1 -1
    ***   010DF960h 004BABBFh load
    ***   010DF9A4h 004989BFh red/interpreter/call 05308CA4h 04A10038h 056FB5D4h 0
    ***   010DF9ECh 0049ACA9h red/interpreter/eval-code 053D042Ch 056FB604h 056FB614h 05308C94h true 056FB5D4h 056FB544h 053D042Ch 0 false
    ***   010DFA70h 00499386h red/interpreter/eval-path 056FB5D4h 056FB5E4h 056FB614h 05308C94h false false false false
    ***   010DFAECh 0049B5D4h red/interpreter/eval-expression 056FB5E4h 056FB614h 05308C94h false false false
    ***   010DFB3Ch 0049BB5Ch red/interpreter/eval 05308C94h true
    ***   010DFB74h 004833ECh red/natives/repeat* false
    ***   010DFC68h 0049A92Bh red/interpreter/eval-arguments 05308C64h 056FB66Ch 056FB66Ch 05308C44h 00000000h 00000000h 0 false
    ***   010DFCC0h 0049AACCh red/interpreter/eval-code 053D0BFCh 056FB63Ch 056FB66Ch 05308C44h false 00000000h 00000000h 053D0BFCh 0 false
    ***   010DFD44h 0049B555h red/interpreter/eval-expression 056FB63Ch 056FB66Ch 05308C44h false false false
    ***   010DFD94h 0049BB5Ch red/interpreter/eval 05308C44h true
    ***   010DFDD4h 00488548h red/natives/catch* true 1
    ***   010DFE1Ch 0051286Ah ctx||633~try-do 04A445B0h
    ***   010DFE78h 00512CFCh ctx||633~do-command 04A445B0h
    ***   010DFEA4h 00513AF2h ctx||633~eval-command 04A445B0h
    ***   010DFEE0h 0051415Eh ctx||633~run 04A445B0h
    ***   010DFF34h 00514A5Ch ctx||633~launch 04A445B0h
    ***   010DFF58h 005160EBh ctx||652~launch 04A44BBCh
    ***   010DFF70h 00421046h <external>
    ***   010DFF80h 771DFCC9h <external>
    ***   010DFFDCh 77C182AEh <external>
    ***   010DFFECh 77C1827Eh <external>
    ```

--------------------------------------------------------------------------------

On 2025-05-12T16:10:42Z, dockimbel, commented:
<https://github.com/red/red/issues/5611#issuecomment-2873170330>

    The `tail` pointer was setting its referenced value too early, so a GC pass could change that value and it needs to be set after all possible GC passes.

