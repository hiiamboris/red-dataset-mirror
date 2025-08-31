
#2929: Remove button margin (Only tested on Windows)
================================================================================
Issue is open, was reported by ghost and has 2 comment(s).
[status.reviewed] [type.review] [GUI]
<https://github.com/red/red/issues/2929>

I noticed that there is a 2 pixel offset between a text face and a button face when I would expect perfect alignment as per code below.  The buttons on Windows have a 1+1 pixels margin on left and right, VID tries to rectify that but it should not.
```
Red []
view [
   style txt: text 100 right
   style btn: button 100
   style fld: field 100
   group-box  [
       txt "Text 1"    fld     return         
       txt "Text 2"    fld     return
      btn "Text 3"    fld
   ]   
]
```


Comments:
--------------------------------------------------------------------------------

On 2017-07-31T12:30:31Z, geekyi, commented:
<https://github.com/red/red/issues/2929#issuecomment-319053467>

    For reference:
    ![image](https://user-images.githubusercontent.com/16749930/28777755-de6565a0-7615-11e7-881e-3736da143003.png)

