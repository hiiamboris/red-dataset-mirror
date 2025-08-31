
#3164: VID: view [tab-panel] throws error
================================================================================
Issue is closed, was reported by gltewalt and has 4 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/3164>

### Expected behavior
Expected a default tab-panel, similar to `view [panel]`
### Actual behavior
```
>> view [tab-panel]
*** Script Error: foreach does not allow none! for its series argument
*** Where: foreach
*** Stack: view layout
```
### Steps to reproduce the problem
Type view [tab-panel]

### Red version and build date, operating system with version.
Red for Windows version 0.6.3 built 19-Dec-2017/15:48:19-07:00
Windows 7 Pro 64bit



Comments:
--------------------------------------------------------------------------------

On 2017-12-23T21:05:58Z, gltewalt, commented:
<https://github.com/red/red/issues/3164#issuecomment-353748144>

    Perhaps a suitable error message to reflect this?: "The spec block must contain a pair of name and content description for each tab."
    Or, an extended template?

--------------------------------------------------------------------------------

On 2018-03-15T06:34:47Z, dockimbel, commented:
<https://github.com/red/red/issues/3164#issuecomment-373275157>

    No error should be thrown in this case. 
    
    For error management in VID (or more generally in dialects), I think a general architecture should be defined to provide exhaustive error explanation to end users, though without overloading the runtime library with tons of texts. Instead, such solution should leverage online storage space, and query the extra information needed just-in-time.

