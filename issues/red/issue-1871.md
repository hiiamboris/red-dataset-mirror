
#1871: Content obscures title in group box
================================================================================
Issue is closed, was reported by PeterWAWood and has 10 comment(s).
[status.reviewed] [type.review] [GUI]
<https://github.com/red/red/issues/1871>

Titles in a `group-box` are obscured by the content.

This code:

``` Red
Red [
    Needs: 'View
]

view [
    title "My Layout"
    group-box 2 [
        title "Heading" 
        text "Field 1" right
        field 200 
        text "Much Longer Field Name" right
        field 200
    ]
]
```

Produces this output:
<img width="394" alt="group box with title" src="https://cloud.githubusercontent.com/assets/697434/14945226/19ea50a6-103f-11e6-821b-0d2e2cb69b2f.png">



Comments:
--------------------------------------------------------------------------------

On 2016-06-17T16:48:58Z, dockimbel, commented:
<https://github.com/red/red/issues/1871#issuecomment-226821293>

    We'll add support for proper internal padding with appropriate default values in a future release.
    
    Though, for that specific case with group-box, I don't think we can do much to improve it. The right solution for that will be once we have a custom group-box widget (the default Windows one has many issues).

--------------------------------------------------------------------------------

On 2018-12-30T17:30:45Z, hiiamboris, commented:
<https://github.com/red/red/issues/1871#issuecomment-450575187>

    Is this still not fixed? Can't reproduce on W7 and W8.

--------------------------------------------------------------------------------

On 2019-01-01T19:40:27Z, endo64, commented:
<https://github.com/red/red/issues/1871#issuecomment-450752312>

    `Heading` text looks ok but no padding, here is how it looks on W10 with latest build (`Red 0.6.4 for Windows built 1-Jan-2019/17:22:21+03:00 commit #8bf2cbe`)
    
    ![image](https://user-images.githubusercontent.com/840604/50575805-0526a980-0e16-11e9-99ff-4fdc23a523fe.png)

--------------------------------------------------------------------------------

On 2019-01-02T23:21:16Z, greggirwin, commented:
<https://github.com/red/red/issues/1871#issuecomment-451015948>

    Still has the issue for the second label.

--------------------------------------------------------------------------------

On 2020-07-17T16:08:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/1871#issuecomment-660193420>

    I propose we close this as "Heading" is not clipped anymore, and 2nd field has it's width set explicitly to `200`, so expected to be clipped.

