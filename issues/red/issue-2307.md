
#2307: [macOS] OVER events are send to not only the top face but also the face under the top face.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[type.bug] [status.reviewed] [GUI]
<https://github.com/red/red/issues/2307>

Try the following code.
```Red
view [ at 10x10 base 100x100 red all-over on-over [ face/color: random white] at 60x60 base 50x50 all-over on-over [ face/color: random white 'done] ]
```
When the mouse cursor is in the small square, the big square still got the OVER events.


