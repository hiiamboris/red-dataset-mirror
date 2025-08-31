
#1980: View doesn't get value of word!
================================================================================
Issue is closed, was reported by endo64 and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1980>

Below code produces the issue:

```
red>> x: [print "ok"]
red>> view [button "test" x]
*** Script error: copy does not allow word! for its value argument
```



Comments:
--------------------------------------------------------------------------------

On 2016-06-29T06:02:28Z, endo64, commented:
<https://github.com/red/red/issues/1980#issuecomment-229264417>

    By the way `draw` already works,
    
    ```
    red>> b: [circle 50x50 30]
    red>> view [base 300x300 draw b]
    ```
    
    ![image](https://cloud.githubusercontent.com/assets/840604/16442076/2c81444c-3dd8-11e6-9352-33f2e12759c6.png)

