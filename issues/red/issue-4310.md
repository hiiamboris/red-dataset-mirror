
#4310: [R/S] Example from the docs cannot be compiled
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System] [test.written]
<https://github.com/red/red/issues/4310>

```
Red/System []
s2: declare struct! [
   a   [integer!]
   b   [c-string!]
   c   [struct! [d [integer!] e [float!]] value]
]
probe size? s2
```
Taken from https://static.red-lang.org/red-system-specs.html#section-4.7.2
Says:
```
Compiling to native code...
*** Red/System Compiler Internal Error: Script Error : last expected series argument of type: series port tuple
*** Where: foreach-member
*** Near:  [either 'value = last type:]
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-Feb-2020/6:07:00+03:00 commit #bf15211
```



Comments:
--------------------------------------------------------------------------------

On 2020-03-03T06:23:39Z, qtxie, commented:
<https://github.com/red/red/issues/4310#issuecomment-593788857>

    FYI. The following code works:
    ```
    s1: alias struct! [d [integer!] e [float!]]
    s2: declare struct! [
       a   [integer!]
       b   [c-string!]
       c   [s1 value]
    ]
    probe size? s2
    ```
    Remove `value` in the structure also make it work.
    ```
    s2: declare struct! [
       a   [integer!]
       b   [c-string!]
       c   [struct! [d [integer!] e [float!]]]
    ]
    ```

