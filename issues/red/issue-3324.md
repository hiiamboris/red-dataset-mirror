
#3324: Windows GUI console has problem with some unicode string input from clipboard.
================================================================================
Issue is closed, was reported by Oldes and has 12 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3324>

When you select&copy this text: ```to-binary "🦄"``` and paste it to console, there will be redundant null char:
```
>> to-binary "🦄"
*** Syntax Error: invalid value at "^@"
*** Where: do
*** Stack: load 
```
The edit of the line in the console is also broken because of it.

Linux version was reported to be working correctly.

EDIT:
better test case:
```
>> to-string #{F09FA684}
== "🦄"
>> write-clipboard to-string #{F09FA684} read-clipboard
== "🦄^@"
>> write-clipboard to-string #{F09FA684F09FA684} read-clipboard
== "🦄🦄^@^@"
```



Comments:
--------------------------------------------------------------------------------

On 2018-04-11T11:20:42Z, Oldes, commented:
<https://github.com/red/red/issues/3324#issuecomment-380417274>

    Two unicorns = two null chars:)
    ```
    >> to-binary "🦄🦄"
    *** Syntax Error: invalid value at "^@^@"
    *** Where: do
    *** Stack: load 
    ```

--------------------------------------------------------------------------------

On 2018-04-11T11:50:47Z, meijeru, commented:
<https://github.com/red/red/issues/3324#issuecomment-380424557>

    It is the unicorn face at U+1F984. But evaluating "^(01F984)" in the console gives, correctly, 🦄! Moreover, `to-binary` has nothing to do with it, because copying the face character and pasting it into the console on its own also gives the error.

--------------------------------------------------------------------------------

On 2018-04-11T12:02:18Z, Oldes, commented:
<https://github.com/red/red/issues/3324#issuecomment-380427344>

    @meijeru I don't know... I just copy pasted "unicorn" from a web page to see if it works or not with Red console... and found the issue.

--------------------------------------------------------------------------------

On 2018-04-11T12:03:06Z, 9214, commented:
<https://github.com/red/red/issues/3324#issuecomment-380427540>

    @rebolek first :bear:, now :unicorn: .

--------------------------------------------------------------------------------

On 2018-04-11T12:26:28Z, toomasv, commented:
<https://github.com/red/red/issues/3324#issuecomment-380433430>

    to-binary "🙈"
    *** Syntax Error: invalid value at "^@"

--------------------------------------------------------------------------------

On 2018-04-12T08:12:02Z, qtxie, commented:
<https://github.com/red/red/issues/3324#issuecomment-380717036>

    This issue has been fix. I'll close it.
    The caret still not working properly, though it's another issue (maybe hard to fix :upside_down_face: ).

