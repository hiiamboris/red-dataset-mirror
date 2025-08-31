
#1816: Adding space at the end of a VID block reduces the size of the window so part of the contents are hidden
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/1816>

If you have a VID block and then add a `space` command at the end of the block, part of the contents are hidden as the window is too small.

This can be seen by comparing `view [below text "hello" text "world]` 
<img width="117" alt="without space" src="https://cloud.githubusercontent.com/assets/697434/14580231/d6e63316-03f9-11e6-80d3-48e99921bfee.png">
with `view [below text "hello" text "world" space 1X1]`
<img width="121" alt="with space 1x1" src="https://cloud.githubusercontent.com/assets/697434/14580233/df002db8-03f9-11e6-97fa-0a5a19575950.png">



Comments:
--------------------------------------------------------------------------------

On 2016-04-17T00:49:49Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1816#issuecomment-210933089>

    This example also shows the issue:
    
    ``` Red
    Red []
    
    view [
            space 0x0
            panel 2 [title "" backdrop pink] []
            text "Hello"
            space 5x5
            panel 2 [title "" backdrop purple] []
            text "hello"
    ]
    
    ```

