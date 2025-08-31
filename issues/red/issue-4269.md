
#4269: [Crash, View] `to-image` on some faces crashes the console
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4269>

**Describe the bug**

Run this code:
```
view/no-wait [f: rich-text "text" blue]
to-image f
```
Or this:
```
view/no-wait [f: scroller "text" blue]
to-image f
```
Console terminates with a message:
```
== make object! [
    type: 'window
    offset: 682x346
    size: 169x169
    text: "Red...
*** Internal Error: block or paren series is too deep to display
*** Where: print
*** Stack:
```

**Expected behavior**

A face snapshot

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 29-Jan-2020/15:29:32+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-06-29T21:04:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/4269#issuecomment-651365210>

    New error message here:
    ```
    *** Internal Error: stack overflow
    *** Where: print
    *** Stack: context 
    ```

--------------------------------------------------------------------------------

On 2021-09-27T16:43:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/4269#issuecomment-928060669>

    Worth noting, these are the only face types that contain extra facets.

--------------------------------------------------------------------------------

On 2022-09-30T04:10:29Z, qtxie, commented:
<https://github.com/red/red/issues/4269#issuecomment-1263078747>

    Before doing the conversion, `to-image` checks if it's a face by using `face?` function. `face?` function checks the `class-of` the object. While face types that contain extra facets has different class id than `face!`.

--------------------------------------------------------------------------------

On 2022-09-30T07:14:11Z, qtxie, commented:
<https://github.com/red/red/issues/4269#issuecomment-1263196382>

    Related issue https://github.com/red/red/issues/4396

