
#1578: VID: size keyword doesn't work
================================================================================
Issue is closed, was reported by JenniferLee520 and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1578>

view [ size 200x200 base 1000x1000 ]

The windws size is 1000x1000, instead of 200x200 



Comments:
--------------------------------------------------------------------------------

On 2016-02-03T03:28:11Z, WiseGenius, commented:
<https://github.com/red/red/issues/1578#issuecomment-178980620>

    In the meantime, this way works:
    
    ```
    view/options [base 1000x1000][size: 200x200]
    ```

--------------------------------------------------------------------------------

On 2016-02-03T04:28:57Z, JenniferLee520, commented:
<https://github.com/red/red/issues/1578#issuecomment-178999937>

    Thanks. Using /options does work.
    However, SIZE Keyword in VID used to work until one day ago. 

--------------------------------------------------------------------------------

On 2016-02-03T05:11:01Z, dockimbel, commented:
<https://github.com/red/red/issues/1578#issuecomment-179015852>

    Indeed, seems like a recent regression. Thanks for reporting it!

