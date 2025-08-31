
#2908: macOS: setting no-title and no-border flags in windows will crash the program
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2908>

The following code on macOS:
```Red
>> view/flags [ text "Hello" 300x200 ] [ no-border no-title ]
```
will get this:
```Red
2017-07-22 13:15:12.863 console-2017-7-17-55627[7957:300085] *** Assertion failure in -[RedWindow _changeJustMain], /Library/Caches/com.apple.xbs/Sources/AppKit/AppKit-1504.83.101/AppKit.subproj/NSWindow.m:14861
2017-07-22 13:15:12.863 console-2017-7-17-55627[7957:300085] *** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Invalid parameter not satisfying: [self canBecomeMainWindow]'
*** Call stack at first throw:
(
	0   CoreFoundation                      0x9437627b __raiseError + 187
	1   libobjc.A.dylib                     0xa0cb86f2 objc_exception_throw + 273
	2   CoreFoundation                      0x942f54c2 +[NSException raise:format:arguments:] + 130
	3   Foundation                          0x95ad36f2 -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:] + 94
	4   AppKit                              0x92227813 -[NSWindow _changeJustMain] + 233
	5   AppKit                              0x92227721 -[NSWindow makeMainWindow] + 62
	6   console-2017-7-17-55627             0x000bb7f6 console-2017-7-17-55627 + 763894
)
```


