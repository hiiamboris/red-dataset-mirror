
#5603: Window's title appears inside the window when mixed with Draw
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5603>

The following code opens a window and draws a small line on its background. No other face is defined.
```
view [
    size 200x200
    backdrop white
    title "should not appear"
    on-created [face/draw: [line 1x1 10x10]]
]
```
results in:

<img width="149" alt="Image" src="https://github.com/user-attachments/assets/7020d865-5426-48d6-9cfb-c6a7826b98ad" />


Expected behavior: 

No text displayed inside the window. If a Draw block is not used, it works as expected.

Platform: Windows


