
#1604: On capturing phase, 'Base stops passing events to its children if the color of the 'Base is none.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 8 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1604>

I make 'Base C a child of 'Base P, and 'Base C has the 'Drag-on option. If the color of 'Base P is none and there is nothing Drawn on 'Base P under the same area of 'Base C, 'Base C will not be able to drag. ... I guess the capturing phase has a flaw.



Comments:
--------------------------------------------------------------------------------

On 2016-02-07T23:53:53Z, qtxie, commented:
<https://github.com/red/red/issues/1604#issuecomment-181143930>

    Which version of Windows do you use?

--------------------------------------------------------------------------------

On 2016-02-08T00:59:02Z, WiseGenius, commented:
<https://github.com/red/red/issues/1604#issuecomment-181149781>

    @JenniferLee520 If you post a minimal code example, I will test it here too.

--------------------------------------------------------------------------------

On 2016-02-08T03:51:02Z, JenniferLee520, commented:
<https://github.com/red/red/issues/1604#issuecomment-181184606>

    My OS is Windows 10.

--------------------------------------------------------------------------------

On 2016-02-24T10:03:53Z, qtxie, commented:
<https://github.com/red/red/issues/1604#issuecomment-188172998>

    Should be fixed now.

