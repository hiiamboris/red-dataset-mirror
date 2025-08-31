
#3121: View 'area' face crash on setting `disable` option
================================================================================
Issue is closed, was reported by dsnezhkov and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3121>

Scenario 1: Option set:
```red
a: area disabled  focus 200x300
```
or 

Scenario 2: Setting via event

```red
button "enable" [if not a/enabled? [a/enabled?: complement a/enabled?] ]
button "disable" [if a/enabled? [a/enabled?: complement a/enabled?]  ]
```
### Expected behavior
no crash (if invalid option a usage error)

### Actual behavior
```2017-11-27 15:04:41.780 console-2017-8-3-49893[51481:18465388] -[RedScrollView setEnabled:]: unrecognized selector sent to instance 0x2129e20
2017-11-27 15:04:41.780 console-2017-8-3-49893[51481:18465388] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[RedScrollView setEnabled:]: unrecognized selector sent to instance 0x2129e20'
*** Call stack at first throw:
(
        0   CoreFoundation                      0x9437627b __raiseError + 187
        1   libobjc.A.dylib                     0xa0cc26f2 objc_exception_throw + 273
        2   CoreFoundation                      0x9437a0dc -[NSObject(NSObject) doesNotRecognizeSelector:] + 172
        3   CoreFoundation                      0x9425d555 ___forwarding___ + 1013
        4   CoreFoundation                      0x9425d13e _CF_forwarding_prep_0 + 14
        5   console-2017-8-3-49893              0x000ba750 console-2017-8-3-49893 + 759632
        6   console-2017-8-3-49893              0x000be30a console-2017-8-3-49893 + 774922
        7   console-2017-8-3-49893              0x000bf025 console-2017-8-3-49893 + 778277
)
```
### Steps to reproduce the problem
set disable option on area or modify it in the event (see above)
### Red version and build date, operating system with version.
Red version 0.6.3 MacOS Sierra 10.12.5



