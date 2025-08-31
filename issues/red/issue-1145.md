
#1145: Issues with handling of brackets
================================================================================
Issue is closed, was reported by x8x and has 14 comment(s).
<https://github.com/red/red/issues/1145>

This code:

``` rebol
a: object [
    b: does [
        replace/all
        replace/all
        trim/lines form a
        "{" {}
        "}" {}
    ]
]
print find/tail head clear back tail form a/b "form a"
```

in Rebol returns:

```
"" "" "" ""
```

while in Red it returns:

```
 "" "" ^ ""
```

which seams buggy.



Comments:
--------------------------------------------------------------------------------

On 2015-05-03T01:31:07Z, x8x, commented:
<https://github.com/red/red/issues/1145#issuecomment-98424673>

    Simpler example:
    in Rebol:
    
    ```
    rebol>> replace/all replace/all mold a: [{^{} {} {^}} {}] a/1 a/2 a/3 a/4
    == {["" "" "" ""]}
    ```
    
    in Red:
    
    ```
    red>> replace/all replace/all mold a: [{^{} {} {^}} {}] a/1 a/2 a/3 a/4
    == {["" "" ^^ ""]}
    ```

--------------------------------------------------------------------------------

On 2015-05-03T02:43:14Z, qtxie, commented:
<https://github.com/red/red/issues/1145#issuecomment-98430169>

    ```
    red>> {^{}
    == "{"
    red>> {^}}
    == {^}}
    ```
    
    ```
    >> {^{}
    == "{"
    
    >> {^}}
    == "}"
    ```

--------------------------------------------------------------------------------

On 2015-05-03T06:02:17Z, dockimbel, commented:
<https://github.com/red/red/issues/1145#issuecomment-98440798>

    @x8x Please report only one issue per ticket.

--------------------------------------------------------------------------------

On 2015-05-03T07:47:25Z, x8x, commented:
<https://github.com/red/red/issues/1145#issuecomment-98449162>

    Sorry, had a doubt they may be related. Opened a new issue for the second case.

--------------------------------------------------------------------------------

On 2015-05-03T11:52:16Z, x8x, commented:
<https://github.com/red/red/issues/1145#issuecomment-98473820>

    Some more examples:
    
    ```
    red>> mold {^{}
    == {"^{"}
    red>> form {^{}
    == "{"
    ```
    
    ```
    red>> mold {^}}
    == {^{^^^}^}}
    red>> form {^}}
    == {^}}
    ```
    
    ```
    red>> mold "}"
    == {^{^^^}^}}
    ```

--------------------------------------------------------------------------------

On 2015-05-04T02:32:40Z, x8x, commented:
<https://github.com/red/red/issues/1145#issuecomment-98570081>

    After further checking, I'll close this issue as there is no bug!
    Just wondering why one is enclosed in quotes while the other one is enclosed in brackets
    
    ```
    red>> {^{}
    == "{"
    red>> {^}}
    == {^}}
    ```

--------------------------------------------------------------------------------

On 2015-05-04T04:52:51Z, dockimbel, commented:
<https://github.com/red/red/issues/1145#issuecomment-98588765>

    No bug, but yes, the MOLD string scanner could be made smarter to generate the simplest possible string serializaton form.

