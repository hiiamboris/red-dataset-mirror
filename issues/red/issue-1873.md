
#1873: Return in the description block of a group-box adds additional empty faces
================================================================================
Issue is closed, was reported by PeterWAWood and has 6 comment(s).
[status.built] [status.tested] [type.review] [GUI]
<https://github.com/red/red/issues/1873>

If you use `return` inside the description block of a `group-box`, additional empty faces are added to the grid.

This code:

``` Red
Red [
    Needs: 'View
]

view [
    title "My Layout" 
    group-box 2 [
        text "No return" font-name "helevetica" font-size 12
        text ""
        text "Field 1"
        field 200 
        text "Much Longer Field Name"
        field 200
    ]
    group-box 2 [
        text "Return" font-name "helevetica" font-size 12
        return
        text "Field 1"
        field 200 
        text "Much Longer Field Name"
        field 200
    ]
]
```

demonstrates the issue:

<img width="678" alt="group box return v no return" src="https://cloud.githubusercontent.com/assets/697434/14945608/3c716b2a-1047-11e6-8092-4b3708857350.png">



Comments:
--------------------------------------------------------------------------------

On 2016-05-03T16:11:28Z, dockimbel, commented:
<https://github.com/red/red/issues/1873#issuecomment-216579910>

    @PeterWAWood Not related to the issue, but there's a typo in your font name, it should be `"helvetica"`.

--------------------------------------------------------------------------------

On 2016-05-03T22:31:51Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1873#issuecomment-216684339>

    Thanks.

--------------------------------------------------------------------------------

On 2016-05-05T06:06:48Z, dockimbel, commented:
<https://github.com/red/red/issues/1873#issuecomment-217082621>

    The `return` keyword is not compatible with grid layout mode, as rows/columns delimitations are determined by VID automatically. I will add a check and make VID report an error if `return` is used in such context.

