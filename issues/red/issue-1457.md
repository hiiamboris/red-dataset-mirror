
#1457: drop-list uses wrong text for size
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1457>

```
view [drop-list "This text is not displayed. Yet it is allowed. It is even used to determine the size of the face, rather than using what's in the data." data ["This text isn't THAT long!." "Neither is this!"]]
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-02T14:26:56Z, dockimbel, commented:
<https://github.com/red/red/issues/1457#issuecomment-178597974>

    Issue fixed. All facet can be specified in VID for any face type, it's up to the face to properly interpret the provided data.

