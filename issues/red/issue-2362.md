
#2362: [macOS] Setting font to a 'Field face doesn't work.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 6 comment(s).
[status.built] [status.tested] [type.bug] [status.reviewed]
<https://github.com/red/red/issues/2362>

The font size and font color will not change after the setting.


Comments:
--------------------------------------------------------------------------------

On 2016-12-11T05:05:56Z, JenniferLee520, commented:
<https://github.com/red/red/issues/2362#issuecomment-266263710>

    Still not working. The text size in the field is still the default size.

--------------------------------------------------------------------------------

On 2016-12-12T01:48:44Z, qtxie, commented:
<https://github.com/red/red/issues/2362#issuecomment-266326261>

    Test code:
    ```
    font1: make font! [name: "Monaco" size: 20 color: red]
    view [field 150x32 font font1]
    ```

--------------------------------------------------------------------------------

On 2016-12-12T02:07:16Z, JenniferLee520, commented:
<https://github.com/red/red/issues/2362#issuecomment-266327970>

    OK, It's working now. Thanks.

