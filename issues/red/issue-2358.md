
#2358: Change selected item in text-list will insert it to first column
================================================================================
Issue is closed, was reported by qtxie and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2358>

```
view [
    list: text-list data ["John" "Bob" "Alice"]
    button "Add" [append list/data "Sue"]
    button "Change" [lowercase list/data/(list/selected)]
]
```


Comments:
--------------------------------------------------------------------------------

On 2016-12-08T22:55:34Z, maximvl, commented:
<https://github.com/red/red/issues/2358#issuecomment-265880629>

    Initial state:
    
    ![bug1](https://cloud.githubusercontent.com/assets/949890/21031015/a0553470-bda1-11e6-9c98-67d517c2837f.PNG)
    
    After selecting "Alice" and pressing "Change": 
    
    ![bug2](https://cloud.githubusercontent.com/assets/949890/21031028/b7931b2a-bda1-11e6-9ce8-595617381636.PNG)

