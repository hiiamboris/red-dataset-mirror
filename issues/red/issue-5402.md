
#5402: [GTK] `size-text` is broken on canvas widths >= 2^24
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI.GTK]
<https://github.com/red/red/issues/5402>

**Describe the bug**

At x=2^24 it starts treating it as zero:
```
>> r: rtd-layout ["lorem ipsum dolor sit amet"]
>> r/size: as-pair 2 ** 24 - 1 0  size-text r
== (217, 19)
>> r/size: as-pair 2 ** 24 0  size-text r
== (5, 494)
>> r/size: (1.#inf, 0)  size-text r
== (5, 494)
```
`size: none` simply carries previous state around instead of working as infinity:
```
>> r/size: as-pair 2 ** 24 - 1 0  size-text r  r/size: none  size-text r
== (217, 19)
>> r/size: as-pair 2 ** 24 0  size-text r  r/size: none  size-text r
== (5, 494)
>> r/size: as-pair 50 0  size-text r  r/size: none  size-text r
== (47, 95)
```

**To reproduce**

Put this into console:
```
r: rtd-layout ["lorem ipsum dolor sit amet"]
r/size: as-pair 2 ** 24 - 1 0  size-text r
r/size: as-pair 2 ** 24 0  size-text r
r/size: (1.#inf, 0)  size-text r
r/size: as-pair 2 ** 24 - 1 0  size-text r  r/size: none  size-text r
r/size: as-pair 2 ** 24 0  size-text r  r/size: none  size-text r
r/size: as-pair 50 0  size-text r  r/size: none  size-text r
```

**Expected behavior**

1. `1.#inf` and `none` never wrap
2. No hidden state carried by `none`

**Platform version**
```
>> about/debug
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.4 ahead: 5021 date: 10-Oct-2023/16:32:02 commit: #2a2ce39323f1832a00f599b54724e4e182e64cf5 ]
PLATFORM: [ name: "Ubuntu 20.04.1 LTS" OS: 'Linux arch: 'x86_64 version: 5.15.90 build: "#1 SMP Fri Jan 27 02:56:13 UTC 2023" ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-10-11T12:39:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/5402#issuecomment-1757597822>

    Related https://github.com/red/red/issues/5245

--------------------------------------------------------------------------------

On 2023-10-11T14:22:46Z, hiiamboris, commented:
<https://github.com/red/red/issues/5402#issuecomment-1757805963>

    This issue also seems to be the cause of the following message when closing the program:
    ```
    *** Runtime Error 27: non-existent physical address
    *** at: 0808EFB1h
    ```
    But it's erratic.

