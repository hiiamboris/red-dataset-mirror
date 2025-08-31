
#5602: [Regression] Vertical progress bar interprets /data value wrongly
================================================================================
Issue is closed, was reported by dockimbel and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5602>

```
view [progress 16x120 75%]
```
displays:

<img width="93" alt="Image" src="https://github.com/user-attachments/assets/3c6ebc3e-8241-465a-940e-4d6b17e724b6" />

It should instead display a green bar that covers 75% of the container.


Comments:
--------------------------------------------------------------------------------

On 2025-03-17T18:11:44Z, greggirwin, commented:
<https://github.com/red/red/issues/5602#issuecomment-2730441166>

    Confirmed. Broken since at least Jun-2023. Worked in 2022.

--------------------------------------------------------------------------------

On 2025-03-17T18:12:09Z, greggirwin, commented:
<https://github.com/red/red/issues/5602#issuecomment-2730442102>

    Ah, already fixed. :+1:

