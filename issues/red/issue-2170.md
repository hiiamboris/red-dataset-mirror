
#2170: Artifact when Arc is drawn in latest build.
================================================================================
Issue is closed, was reported by DrunkenDino and has 2 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/2170>

Hi,
when I use the following code on the latest build ( red-11aug16-7b48f11.exe ) there appears an artifact.
It only appears when line-join is set to round and line-width is set greater than 2.
When it is executed on the latest stable build, then it's ok.

```
view [base white 400x150 draw [
    ;error
    line-width 2
    line-join round
    arc 30x100 20x20 20 140
    arc 70x100 20x20 0 140

    ;ok
    line-width 1
    line-join round
    arc 130x100 20x20 20 140
    arc 170x100 20x20 0 140

    ;also ok
    line-width 2
    line-join miter
    arc 230x100 20x20 20 140
    arc 270x100 20x20 0 140
    ] ]
```



Comments:
--------------------------------------------------------------------------------

On 2016-08-12T10:23:21Z, WiseGenius, commented:
<https://github.com/red/red/issues/2170#issuecomment-239412760>

    I'm getting it in Windows 7 but not in Windows XP:
    ![artifact](https://cloud.githubusercontent.com/assets/7657453/17619710/88260f66-60ca-11e6-991b-c16418353576.png)

