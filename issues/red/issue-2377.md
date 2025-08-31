
#2377: Field can show hint text when it's blank.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 4 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/2377>

In old-style GUI design, a field is always next to a label used to tell user what the filed is about. In new-style GUI design, a field can have a prompt string shown such as "Search", "Your name here" when it's blank. I would like Red to support this feature in GUI engine and VID. Thanks.


Comments:
--------------------------------------------------------------------------------

On 2016-12-24T02:27:06Z, qtxie, commented:
<https://github.com/red/red/issues/2377#issuecomment-269064789>

    Implementation Note: 
    Windows: https://msdn.microsoft.com/en-us/library/bb761639(VS.85).aspx
    macOS: https://developer.apple.com/reference/appkit/nstextfield/1399391-placeholderstring?language=objc

--------------------------------------------------------------------------------

On 2017-02-18T03:21:00Z, qtxie, commented:
<https://github.com/red/red/issues/2377#issuecomment-280817864>

    Now you can set hint text in field's options:
    
    ```
    view [f: field do [f/options: [hint: "search text"]]]
    ````

