
#4740: [GTK & Mac] Does not initialize some View metrics
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[GUI] [status.contribution] [GUI.GTK]
<https://github.com/red/red/issues/4740>

**Describe the bug**

Tested on Ubuntu/WSL2 and Debian 9 VM:
```
>> ? system/view/metrics
SYSTEM/VIEW/METRICS is an object! with the following words and values:
     screen-size    none!         none
     dpi            none!         none
     paddings       map!          [button toggle check radio text field grou...
     margins        map!          []
     def-heights    map!          [button toggle check radio text field drop...
     fixed-heights  map!          [progress]
     misc           map!          []
     colors         map!          []

>> about
Red 0.6.4 for Linux built 16-Oct-2020/12:35:47-06:00 commit #df54dcd
```

**Expected behavior**

- `dpi` is the most important metric, but it's not set on Linux
- `colors` ideally should be a map populated with `text`, `window` and `panel` colors from the OS color scheme
- `screen-size` is something new and probably not implemented (also `none` on Windows), so let's ignore it here



Comments:
--------------------------------------------------------------------------------

On 2021-05-15T14:04:49Z, hiiamboris, commented:
<https://github.com/red/red/issues/4740#issuecomment-841664094>

    According to @ldci `system/view/metrics/colors` is `none` on MacOS.

--------------------------------------------------------------------------------

On 2021-05-15T14:13:44Z, ldci, commented:
<https://github.com/red/red/issues/4740#issuecomment-841665338>

    A modification for styles.red
    
    ;--for macOS and Linux (system/view/metrics/colorsnot yet implemented in platform.red)
    if svmc/text = none [
    svmc: #(
    text: 0.0.0
    window: 255.255.255
    panel: 240.240.240
    tab-panel: 255.255.255
    )
    ]
    
    Regards
    
    ***@***.***D41D15.0B4818A0]
    
    
    
    
    ***@***.***D41D15.0B4818A0]
    
    François Jouen
    École Pratique des Hautes Études
    Doyen de la section des Sciences de la Vie et de la Terre
    Chaire Psychobiologie du Développement
    Laboratoire Cognitions Humaine et Artificielle (CHArt) EA 4004 FED 4246
    Patios Saint-Jacques
    4-14, rue Ferrus - 75014 Paris
    01 53 63 61 64 / 06 87 13 76 81
    ***@***.******@***.***>
    www.ephe.fr<http://www.ephe.fr>
    
    Le 15 mai 2021 à 16:05, hiiamboris ***@***.******@***.***>> a écrit :
    
    
    
    According to @ldci<https://github.com/ldci> system/view/metrics/colors is none on MacOS.
    
    —
    You are receiving this because you were mentioned.
    Reply to this email directly, view it on GitHub<https://github.com/red/red/issues/4740#issuecomment-841664094>, or unsubscribe<https://github.com/notifications/unsubscribe-auth/AAXI3INLXZWKZJMKLETFME3TNZ5Q7ANCNFSM4UJPH6IA>.
    

