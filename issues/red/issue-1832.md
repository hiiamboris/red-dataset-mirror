
#1832: WISH: Mouse-Away, Mouse-Enter, and Mouse-Over
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[status.resolved] [GUI]
<https://github.com/red/red/issues/1832>

Most of the time, I don't care about Mouse-Over, so I don't want to set ALL-OVER flag to get all the overwhelming OVER events. I just want to get informed that mouse is entering and mouse is leaving, so I can change the face color or something like that for better user experience.

I suggest that we make Mouse-Away, Mouse-Enter, and Mouse-Over 3 different events.



Comments:
--------------------------------------------------------------------------------

On 2016-04-20T11:47:15Z, dockimbel, commented:
<https://github.com/red/red/issues/1832#issuecomment-212393337>

    The `on-over` event already provides that feature: by default, it is triggered only on face entering and exiting. `event/away?` flag is set for exiting event.
    
    A single event, instead of three, allows to factorize code better. For example:
    
    ```
    view [base on-over [face/color: get pick [red blue] event/away?]]
    ```

