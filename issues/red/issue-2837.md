
#2837: macOS/view: Terminal app slow after closing a view vindow
================================================================================
Issue is closed, was reported by x8x and has 14 comment(s).
<https://github.com/red/red/issues/2837>

Open Terminal.app, open two tabs, run red in one tab and execute following code:
```
view [ button "ok"]
```
Close view window, now switching to the other tab will take some seconds while it should be instantaneous.
Go back to previous tab and execute again above code (without relaunching red):
```
  view [ button "ok"]

  view [ button "ok"]
2017-06-26 00:27:28.216 console-2017-6-25-85762[28020:1675095] IMKClient Stall detected, *please Report* your user scenario attaching a spindump (or sysdiagnose) that captures the problem - (imkxpc_presentFunctionRowItemTextInputViewWithEndpoint:reply:) block performed very slowly (28.40 secs).
2017-06-26 00:27:28.218 console-2017-6-25-85762[28020:1675095] IMKClient Stall detected, *please Report* your user scenario attaching a spindump (or sysdiagnose) that captures the problem - (imkxpc_presentFunctionRowItemTextInputViewWithEndpoint:reply:) block performed very slowly (24.94 secs).
2017-06-26 00:27:28.220 console-2017-6-25-85762[28020:1675095] IMKClient Stall detected, *please Report* your user scenario attaching a spindump (or sysdiagnose) that captures the problem - (imkxpc_presentFunctionRowItemTextInputViewWithEndpoint:reply:) block performed very slowly (20.41 secs).
2017-06-26 00:27:28.221 console-2017-6-25-85762[28020:1675095] IMKClient Stall detected, *please Report* your user scenario attaching a spindump (or sysdiagnose) that captures the problem - (imkxpc_presentFunctionRowItemTextInputViewWithEndpoint:reply:) block performed very slowly (16.95 secs).
2017-06-26 00:27:28.228 console-2017-6-25-85762[28020:1675095] *** Assertion failure in -[NSRemoteView informAuxServiceOfSelf], /Library/Caches/com.apple.xbs/Sources/ViewBridge/ViewBridge-283/NSRemoteView.m:3207
2017-06-26 00:27:28.255 console-2017-6-25-85762[28020:1675095] IMKInputSession presentFunctionRowItemTextInputViewWithEndpoint:completionHandler: : [self textInputContext]=0x0 *NO* NSRemoteViewController to client, NSError=Error Domain=com.apple.ViewBridge Code=8 "(null)" UserInfo={com.apple.ViewBridge.error.description=NSViewBridgeExceptionError, com.apple.ViewBridge.error.hint=__38-[NSRemoteView _advanceToConfigPhase:]_block_invoke.2499 caught NSInternalInconsistencyException '<NSRemoteView: 0x322330> failed to rendezvous via aux service' with backtrace (
	0   CoreFoundation                      0x9437627b __raiseError + 187
	1   libobjc.A.dylib                     0xa0cbd6f2 objc_exception_throw + 273
	2   CoreFoundation                      0x942f54c2 +[NSException raise:format:arguments:] + 130
	3   Foundation                          0x95ad3662 -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:] + 94
	4   ViewBridge                          0x9eff0009 -[NSRemoteView informAuxServiceOfSelf] + 305
	5   ViewBridge                          0x9eff09dd -[NSRemoteView _finishAdvanceToConfigPhaseWithContextID:andServiceViewSize:andOffset:] + 724
	6   ViewBridge                          0x9f004e49 __38-[NSRemoteView _advanceToConfigPhase:]_block_invoke.2499 + 292
	7   CoreFoundation                      0x9425eaed __invoking___ + 29
	8   CoreFoundation                      0x9425ea2d -[NSInvocation invoke] + 317
	9   ViewBridge                          0x9f02de13 __deferNSXPCInvocationOntoMainThread_block_invoke_3 + 32
	10  ViewBridge                          0x9f02dd5c withHintInProgress + 619
	11  ViewBridge                          0x9f02da21 __deferNSXPCInvocationOntoMainThread_block_invoke_2 + 217
	12  ViewBridge                          0x9efae383 +[NSViewServiceApplication withHostPID:invoke:] + 94
	13  ViewBridge                          0x9f02d8e5 __deferNSXPCInvocationOntoMainThread_block_invoke + 229
	14  ViewBridge                          0x9f02d4ab invokeBlock + 549
	15  ViewBridge                          0x9f02d058 __deferBlockOntoMainThread_block_invoke_2 + 170
	16  CoreFoundation                      0x94281690 __CFRUNLOOP_IS_CALLING_OUT_TO_A_BLOCK__ + 16
	17  CoreFoundation                      0x94261dec __CFRunLoopDoBlocks + 348
	18  CoreFoundation                      0x94261b3f __CFRunLoopRun + 2751
	19  CoreFoundation                      0x94260e1a CFRunLoopRunSpecific + 506
	20  CoreFoundation                      0x94260c0b CFRunLoopRunInMode + 123
	21  ViewBridge                          0x9f02bd78 __invokeRunLoopInModeUntil_block_invoke + 40
	22  ViewBridge                          0x9f02bcd8 invokeUntil + 247
	23  ViewBridge                          0x9f02bd49 invokeRunLoopInModeUntil + 83
	24  ViewBridge                          0x9f00b65a __29-[NSCFRunLoopSemaphore wait:]_block_invoke_2 + 122
	25  ViewBridge                          0x9f00b583 inhibitingCFRunLoopRunFinished + 361
	26  ViewBridge                          0x9f00b413 __29-[NSCFRunLoopSemaphore wait:]_block_invoke + 81
	27  ViewBridge                          0x9f00a18f +[NSCFRunLoopSemaphore _observe:whilePerforming:] + 991
	28  ViewBridge                          0x9f00b260 -[NSCFRunLoopSemaphore wait:] + 689
	29  ViewBridge                          0x9f00b907 -[NSCFRunLoopSemaphore wait] + 37
	30  ViewBridge                          0x9efe1e3e -[NSRemoteViewSemaphore wait] + 47
	31  ViewBridge                          0x9efeff9e -[NSRemoteView informAuxServiceOfSelf] + 198
	32  ViewBridge                          0x9eff09dd -[NSRemoteView _finishAdvanceToConfigPhaseWithContextID:andServiceViewSize:andOffset:] + 724
	33  ViewBridge                          0x9f004e49 __38-[NSRemoteView _advanceToConfigPhase:]_block_invoke.2499 + 292
	34  CoreFoundation                      0x9425eaed __invoking___ + 29
	35  CoreFoundation                      0x9425ea2d -[NSInvocation invoke] + 317
	36  ViewBridge                          0x9f02de13 __deferNSXPCInvocationOntoMainThread_block_invoke_3 + 32
	37  ViewBridge                          0x9f02dd5c withHintInProgress + 619
	38  ViewBridge                          0x9f02da21 __deferNSXPCInvocationOntoMainThread_block_invoke_2 + 217
	39  ViewBridge                          0x9efae383 +[NSViewServiceApplication withHostPID:invoke:] + 94
	40  ViewBridge                          0x9f02d8e5 __deferNSXPCInvocationOntoMainThread_block_invoke + 229
	41  ViewBridge                          0x9f02d4ab invokeBlock + 549
	42  ViewBridge                          0x9f02d058 __deferBlockOntoMainThread_block_invoke_2 + 170
	43  CoreFoundation                      0x94281690 __CFRUNLOOP_IS_CALLING_OUT_TO_A_BLOCK__ + 16
	44  CoreFoundation                      0x94261dec __CFRunLoopDoBlocks + 348
	45  CoreFoundation                      0x94261b3f __CFRunLoopRun + 2751
	46  CoreFoundation                      0x94260e1a CFRunLoopRunSpecific + 506
	47  CoreFoundation                      0x94260c0b CFRunLoopRunInMode + 123
	48  HIToolbox                           0x93954396 RunCurrentEventLoopInMode + 268
	49  HIToolbox                           0x93954057 ReceiveNextEventCommon + 195
	50  HIToolbox                           0x93953f7b _BlockUntilNextEventMatchingListInModeWithFilter + 83
	51  AppKit                              0x91f86015 _DPSNextEvent + 1227
	52  AppKit                              0x926ebbbb -[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1742
	53  AppKit                              0x926eb4e5 -[NSApplication(NSEvent) nextEventMatchingMask:untilDate:inMode:dequeue:] + 132
	54  console-2017-6-25-85762             0x000b286b console-2017-6-25-85762 + 727147
)}, com.apple.inputmethod.EmojiFunctionRowItem
2017-06-26 00:27:28.258 console-2017-6-25-85762[28020:1675095] *** Assertion failure in -[NSRemoteView informAuxServiceOfSelf], /Library/Caches/com.apple.xbs/Sources/ViewBridge/ViewBridge-283/NSRemoteView.m:3207
2017-06-26 00:27:28.259 console-2017-6-25-85762[28020:1675095] IMKInputSession presentFunctionRowItemTextInputViewWithEndpoint:completionHandler: : [self textInputContext]=0x0 *NO* NSRemoteViewController to client, NSError=Error Domain=com.apple.ViewBridge Code=8 "(null)" UserInfo={com.apple.ViewBridge.error.description=NSViewBridgeExceptionError, com.apple.ViewBridge.error.hint=__38-[NSRemoteView _advanceToConfigPhase:]_block_invoke.2499 caught NSInternalInconsistencyException '<NSRemoteView: 0x500ab0> failed to rendezvous via aux service' with backtrace (
	0   CoreFoundation                      0x9437627b __raiseError + 187
	1   libobjc.A.dylib                     0xa0cbd6f2 objc_exception_throw + 273
	2   CoreFoundation                      0x942f54c2 +[NSException raise:format:arguments:] + 130
	3   Foundation                          0x95ad3662 -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:] + 94
	4   ViewBridge                          0x9eff0009 -[NSRemoteView informAuxServiceOfSelf] + 305
	5   ViewBridge                          0x9eff09dd -[NSRemoteView _finishAdvanceToConfigPhaseWithContextID:andServiceViewSize:andOffset:] + 724
	6   ViewBridge                          0x9f004e49 __38-[NSRemoteView _advanceToConfigPhase:]_block_invoke.2499 + 292
	7   CoreFoundation                      0x9425eaed __invoking___ + 29
	8   CoreFoundation                      0x9425ea2d -[NSInvocation invoke] + 317
	9   ViewBridge                          0x9f02de13 __deferNSXPCInvocationOntoMainThread_block_invoke_3 + 32
	10  ViewBridge                          0x9f02dd5c withHintInProgress + 619
	11  ViewBridge                          0x9f02da21 __deferNSXPCInvocationOntoMainThread_block_invoke_2 + 217
	12  ViewBridge                          0x9efae383 +[NSViewServiceApplication withHostPID:invoke:] + 94
	13  ViewBridge                          0x9f02d8e5 __deferNSXPCInvocationOntoMainThread_block_invoke + 229
	14  ViewBridge                          0x9f02d4ab invokeBlock + 549
	15  ViewBridge                          0x9f02d058 __deferBlockOntoMainThread_block_invoke_2 + 170
	16  CoreFoundation                      0x94281690 __CFRUNLOOP_IS_CALLING_OUT_TO_A_BLOCK__ + 16
	17  CoreFoundation                      0x94261dec __CFRunLoopDoBlocks + 348
	18  CoreFoundation                      0x942614c2 __CFRunLoopRun + 1090
	19  CoreFoundation                      0x94260e1a CFRunLoopRunSpecific + 506
	20  CoreFoundation                      0x94260c0b CFRunLoopRunInMode + 123
	21  ViewBridge                          0x9f02bd78 __invokeRunLoopInModeUntil_block_invoke + 40
	22  ViewBridge                          0x9f02bcd8 invokeUntil + 247
	23  ViewBridge                          0x9f02bd49 invokeRunLoopInModeUntil + 83
	24  ViewBridge                          0x9f00b65a __29-[NSCFRunLoopSemaphore wait:]_block_invoke_2 + 122
	25  ViewBridge                          0x9f00b583 inhibitingCFRunLoopRunFinished + 361
	26  ViewBridge                          0x9f00b413 __29-[NSCFRunLoopSemaphore wait:]_block_invoke + 81
	27  ViewBridge                          0x9f00a18f +[NSCFRunLoopSemaphore _observe:whilePerforming:] + 991
	28  ViewBridge                          0x9f00b260 -[NSCFRunLoopSemaphore wait:] + 689
	29  ViewBridge                          0x9f00b907 -[NSCFRunLoopSemaphore wait] + 37
	30  ViewBridge                          0x9efe1e3e -[NSRemoteViewSemaphore wait] + 47
	31  ViewBridge                          0x9efeff9e -[NSRemoteView informAuxServiceOfSelf] + 198
	32  ViewBridge                          0x9eff09dd -[NSRemoteView _finishAdvanceToConfigPhaseWithContextID:andServiceViewSize:andOffset:] + 724
	33  ViewBridge                          0x9f004e49 __38-[NSRemoteView _advanceToConfigPhase:]_block_invoke.2499 + 292
	34  CoreFoundation                      0x9425eaed __invoking___ + 29
	35  CoreFoundation                      0x9425ea2d -[NSInvocation invoke] + 317
	36  ViewBridge                          0x9f02de13 __deferNSXPCInvocationOntoMainThread_block_invoke_3 + 32
	37  ViewBridge                          0x9f02dd5c withHintInProgress + 619
	38  ViewBridge                          0x9f02da21 __deferNSXPCInvocationOntoMainThread_block_invoke_2 + 217
	39  ViewBridge                          0x9efae383 +[NSViewServiceApplication withHostPID:invoke:] + 94
	40  ViewBridge                          0x9f02d8e5 __deferNSXPCInvocationOntoMainThread_block_invoke + 229
	41  ViewBridge                          0x9f02d4ab invokeBlock + 549
	42  ViewBridge                          0x9f02d058 __deferBlockOntoMainThread_block_invoke_2 + 170
	43  CoreFoundation                      0x94281690 __CFRUNLOOP_IS_CALLING_OUT_TO_A_BLOCK__ + 16
	44  CoreFoundation                      0x94261dec __CFRunLoopDoBlocks + 348
	45  CoreFoundation                      0x94261b3f __CFRunLoopRun + 2751
	46  CoreFoundation                      0x94260e1a CFRunLoopRunSpecific + 506
	47  CoreFoundation                      0x94260c0b CFRunLoopRunInMode + 123
	48  ViewBridge                          0x9f02bd78 __invokeRunLoopInModeUntil_block_invoke + 40
	49  ViewBridge                          0x9f02bcd8 invokeUntil + 247
	50  ViewBridge                          0x9f02bd49 invokeRunLoopInModeUntil + 83
	51  ViewBridge                          0x9f00b65a __29-[NSCFRunLoopSemaphore wait:]_block_invoke_2 + 122
	52  ViewBridge                          0x9f00b583 inhibitingCFRunLoopRunFinished + 361
	53  ViewBridge                          0x9f00b413 __29-[NSCFRunLoopSemaphore wait:]_block_invoke + 81
	54  ViewBridge                          0x9f00a18f +[NSCFRunLoopSemaphore _observe:whilePerforming:] + 991
	55  ViewBridge                          0x9f00b260 -[NSCFRunLoopSemaphore wait:] + 689
	56  ViewBridge                          0x9f00b907 -[NSCFRunLoopSemaphore wait] + 37
	57  ViewBridge                          0x9efe1e3e -[NSRemoteViewSemaphore wait] + 47
	58  ViewBridge                          0x9efeff9e -[NSRemoteView informAuxServiceOfSelf] + 198
	59  ViewBridge                          0x9eff09dd -[NSRemoteView _finishAdvanceToConfigPhaseWithContextID:andServiceViewSize:andOffset:] + 724
	60  ViewBridge                          0x9f004e49 __38-[NSRemoteView _advanceToConfigPhase:]_block_invoke.2499 + 292
	61  CoreFoundation                      0x9425eaed __invoking___ + 29
	62  CoreFoundation                      0x9425ea2d -[NSInvocation invoke] + 317
	63  ViewBridge                          0x9f02de13 __deferNSXPCInvocationOntoMainThread_block_invoke_3 + 32
	64  ViewBridge                          0x9f02dd5c withHintInProgress + 619
	65  ViewBridge                          0x9f02da21 __deferNSXPCInvocationOntoMainThread_block_invoke_2 + 217
	66  ViewBridge                          0x9efae383 +[NSViewServiceApplication withHostPID:invoke:] + 94
	67  ViewBridge                          0x9f02d8e5 __deferNSXPCInvocationOntoMainThread_block_invoke + 229
	68  ViewBridge                          0x9f02d4ab invokeBlock + 549
	69  ViewBridge                          0x9f02d058 __deferBlockOntoMainThread_block_invoke_2 + 170
	70  CoreFoundation                      0x94281690 __CFRUNLOOP_IS_CALLING_OUT_TO_A_BLOCK__ + 16
	71  CoreFoundation                      0x94261dec __CFRunLoopDoBlocks + 348
	72  CoreFoundation                      0x94261b3f __CFRunLoopRun + 2751
	73  CoreFoundation                      0x94260e1a CFRunLoopRunSpecific + 506
	74  CoreFoundation                      0x94260c0b CFRunLoopRunInMode + 123
	75  HIToolbox                           0x93954396 RunCurrentEventLoopInMode + 268
	76  HIToolbox                           0x93954057 ReceiveNextEventCommon + 195
	77  HIToolbox                           0x93953f7b _BlockUntilNextEventMatchingListInModeWithFilter + 83
	78  AppKit                              0x91f86015 _DPSNextEvent + 1227
	79  AppKit                              0x926ebbbb -[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1742
	80  AppKit                              0x926eb4e5 -[NSApplication(NSEvent) nextEventMatchingMask:untilDate:inMode:dequeue:] + 132
	81  console-2017-6-25-85762             0x000b286b console-2017-6-25-85762 + 727147
)}, com.apple.inputmethod.EmojiFunctionRowItem
2017-06-26 00:27:28.259 console-2017-6-25-85762[28020:1675095] *** Assertion failure in -[NSRemoteView informAuxServiceOfSelf], /Library/Caches/com.apple.xbs/Sources/ViewBridge/ViewBridge-283/NSRemoteView.m:3207
2017-06-26 00:27:28.260 console-2017-6-25-85762[28020:1675095] IMKInputSession presentFunctionRowItemTextInputViewWithEndpoint:completionHandler: : [self textInputContext]=0x0 *NO* NSRemoteViewController to client, NSError=Error Domain=com.apple.ViewBridge Code=8 "(null)" UserInfo={com.apple.ViewBridge.error.description=NSViewBridgeExceptionError, com.apple.ViewBridge.error.hint=__38-[NSRemoteView _advanceToConfigPhase:]_block_invoke.2499 caught NSInternalInconsistencyException '<NSRemoteView: 0x48bbd0> failed to rendezvous via aux service' with backtrace (
	0   CoreFoundation                      0x9437627b __raiseError + 187
	1   libobjc.A.dylib                     0xa0cbd6f2 objc_exception_throw + 273
	2   CoreFoundation                      0x942f54c2 +[NSException raise:format:arguments:] + 130
	3   Foundation                          0x95ad3662 -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:] + 94
	4   ViewBridge                          0x9eff0009 -[NSRemoteView informAuxServiceOfSelf] + 305
	5   ViewBridge                          0x9eff09dd -[NSRemoteView _finishAdvanceToConfigPhaseWithContextID:andServiceViewSize:andOffset:] + 724
	6   ViewBridge                          0x9f004e49 __38-[NSRemoteView _advanceToConfigPhase:]_block_invoke.2499 + 292
	7   CoreFoundation                      0x9425eaed __invoking___ + 29
	8   CoreFoundation                      0x9425ea2d -[NSInvocation invoke] + 317
	9   ViewBridge                          0x9f02de13 __deferNSXPCInvocationOntoMainThread_block_invoke_3 + 32
	10  ViewBridge                          0x9f02dd5c withHintInProgress + 619
	11  ViewBridge                          0x9f02da21 __deferNSXPCInvocationOntoMainThread_block_invoke_2 + 217
	12  ViewBridge                          0x9efae383 +[NSViewServiceApplication withHostPID:invoke:] + 94
	13  ViewBridge                          0x9f02d8e5 __deferNSXPCInvocationOntoMainThread_block_invoke + 229
	14  ViewBridge                          0x9f02d4ab invokeBlock + 549
	15  ViewBridge                          0x9f02d058 __deferBlockOntoMainThread_block_invoke_2 + 170
	16  CoreFoundation                      0x94281690 __CFRUNLOOP_IS_CALLING_OUT_TO_A_BLOCK__ + 16
	17  CoreFoundation                      0x94261dec __CFRunLoopDoBlocks + 348
	18  CoreFoundation                      0x94261b3f __CFRunLoopRun + 2751
	19  CoreFoundation                      0x94260e1a CFRunLoopRunSpecific + 506
	20  CoreFoundation                      0x94260c0b CFRunLoopRunInMode + 123
	21  ViewBridge                          0x9f02bd78 __invokeRunLoopInModeUntil_block_invoke + 40
	22  ViewBridge                          0x9f02bcd8 invokeUntil + 247
	23  ViewBridge                          0x9f02bd49 invokeRunLoopInModeUntil + 83
	24  ViewBridge                          0x9f00b65a __29-[NSCFRunLoopSemaphore wait:]_block_invoke_2 + 122
	25  ViewBridge                          0x9f00b583 inhibitingCFRunLoopRunFinished + 361
	26  ViewBridge                          0x9f00b413 __29-[NSCFRunLoopSemaphore wait:]_block_invoke + 81
	27  ViewBridge                          0x9f00a18f +[NSCFRunLoopSemaphore _observe:whilePerforming:] + 991
	28  ViewBridge                          0x9f00b260 -[NSCFRunLoopSemaphore wait:] + 689
	29  ViewBridge                          0x9f00b907 -[NSCFRunLoopSemaphore wait] + 37
	30  ViewBridge                          0x9efe1e3e -[NSRemoteViewSemaphore wait] + 47
	31  ViewBridge                          0x9efeff9e -[NSRemoteView informAuxServiceOfSelf] + 198
	32  ViewBridge                          0x9eff09dd -[NSRemoteView _finishAdvanceToConfigPhaseWithContextID:andServiceViewSize:andOffset:] + 724
	33  ViewBridge                          0x9f004e49 __38-[NSRemoteView _advanceToConfigPhase:]_block_invoke.2499 + 292
	34  CoreFoundation                      0x9425eaed __invoking___ + 29
	35  CoreFoundation                      0x9425ea2d -[NSInvocation invoke] + 317
	36  ViewBridge                          0x9f02de13 __deferNSXPCInvocationOntoMainThread_block_invoke_3 + 32
	37  ViewBridge                          0x9f02dd5c withHintInProgress + 619
	38  ViewBridge                          0x9f02da21 __deferNSXPCInvocationOntoMainThread_block_invoke_2 + 217
	39  ViewBridge                          0x9efae383 +[NSViewServiceApplication withHostPID:invoke:] + 94
	40  ViewBridge                          0x9f02d8e5 __deferNSXPCInvocationOntoMainThread_block_invoke + 229
	41  ViewBridge                          0x9f02d4ab invokeBlock + 549
	42  ViewBridge                          0x9f02d058 __deferBlockOntoMainThread_block_invoke_2 + 170
	43  CoreFoundation                      0x94281690 __CFRUNLOOP_IS_CALLING_OUT_TO_A_BLOCK__ + 16
	44  CoreFoundation                      0x94261dec __CFRunLoopDoBlocks + 348
	45  CoreFoundation                      0x94261b3f __CFRunLoopRun + 2751
	46  CoreFoundation                      0x94260e1a CFRunLoopRunSpecific + 506
	47  CoreFoundation                      0x94260c0b CFRunLoopRunInMode + 123
	48  HIToolbox                           0x93954396 RunCurrentEventLoopInMode + 268
	49  HIToolbox                           0x93954057 ReceiveNextEventCommon + 195
	50  HIToolbox                           0x93953f7b _BlockUntilNextEventMatchingListInModeWithFilter + 83
	51  AppKit                              0x91f86015 _DPSNextEvent + 1227
	52  AppKit                              0x926ebbbb -[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1742
	53  AppKit                              0x926eb4e5 -[NSApplication(NSEvent) nextEventMatchingMask:untilDate:inMode:dequeue:] + 132
	54  console-2017-6-25-85762             0x000b286b console-2017-6-25-85762 + 727147
)}, com.apple.inputmethod.EmojiFunctionRowItem
2017-06-26 00:27:28.261 console-2017-6-25-85762[28020:1675095] *** Assertion failure in -[NSRemoteView informAuxServiceOfSelf], /Library/Caches/com.apple.xbs/Sources/ViewBridge/ViewBridge-283/NSRemoteView.m:3207
2017-06-26 00:27:28.262 console-2017-6-25-85762[28020:1675095] IMKInputSession presentFunctionRowItemTextInputViewWithEndpoint:completionHandler: : [self textInputContext]=0x0 *NO* NSRemoteViewController to client, NSError=Error Domain=com.apple.ViewBridge Code=8 "(null)" UserInfo={com.apple.ViewBridge.error.description=NSViewBridgeExceptionError, com.apple.ViewBridge.error.hint=__38-[NSRemoteView _advanceToConfigPhase:]_block_invoke.2499 caught NSInternalInconsistencyException '<NSRemoteView: 0x47a350> failed to rendezvous via aux service' with backtrace (
	0   CoreFoundation                      0x9437627b __raiseError + 187
	1   libobjc.A.dylib                     0xa0cbd6f2 objc_exception_throw + 273
	2   CoreFoundation                      0x942f54c2 +[NSException raise:format:arguments:] + 130
	3   Foundation                          0x95ad3662 -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:] + 94
	4   ViewBridge                          0x9eff0009 -[NSRemoteView informAuxServiceOfSelf] + 305
	5   ViewBridge                          0x9eff09dd -[NSRemoteView _finishAdvanceToConfigPhaseWithContextID:andServiceViewSize:andOffset:] + 724
	6   ViewBridge                          0x9f004e49 __38-[NSRemoteView _advanceToConfigPhase:]_block_invoke.2499 + 292
	7   CoreFoundation                      0x9425eaed __invoking___ + 29
	8   CoreFoundation                      0x9425ea2d -[NSInvocation invoke] + 317
	9   ViewBridge                          0x9f02de13 __deferNSXPCInvocationOntoMainThread_block_invoke_3 + 32
	10  ViewBridge                          0x9f02dd5c withHintInProgress + 619
	11  ViewBridge                          0x9f02da21 __deferNSXPCInvocationOntoMainThread_block_invoke_2 + 217
	12  ViewBridge                          0x9efae383 +[NSViewServiceApplication withHostPID:invoke:] + 94
	13  ViewBridge                          0x9f02d8e5 __deferNSXPCInvocationOntoMainThread_block_invoke + 229
	14  ViewBridge                          0x9f02d4ab invokeBlock + 549
	15  ViewBridge                          0x9f02d058 __deferBlockOntoMainThread_block_invoke_2 + 170
	16  CoreFoundation                      0x94281690 __CFRUNLOOP_IS_CALLING_OUT_TO_A_BLOCK__ + 16
	17  CoreFoundation                      0x94261dec __CFRunLoopDoBlocks + 348
	18  CoreFoundation                      0x94261b3f __CFRunLoopRun + 2751
	19  CoreFoundation                      0x94260e1a CFRunLoopRunSpecific + 506
	20  CoreFoundation                      0x94260c0b CFRunLoopRunInMode + 123
	21  HIToolbox                           0x93954396 RunCurrentEventLoopInMode + 268
	22  HIToolbox                           0x93954057 ReceiveNextEventCommon + 195
	23  HIToolbox                           0x93953f7b _BlockUntilNextEventMatchingListInModeWithFilter + 83
	24  AppKit                              0x91f86015 _DPSNextEvent + 1227
	25  AppKit                              0x926ebbbb -[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1742
	26  AppKit                              0x926eb4e5 -[NSApplication(NSEvent) nextEventMatchingMask:untilDate:inMode:dequeue:] + 132
	27  console-2017-6-25-85762             0x000b286b console-2017-6-25-85762 + 727147
)}, com.apple.inputmethod.EmojiFunctionRowItem
```


Comments:
--------------------------------------------------------------------------------

On 2017-06-26T23:33:00Z, qtxie, commented:
<https://github.com/red/red/issues/2837#issuecomment-311210510>

    Does it happens all the time? I cannot reproduce it on macOS 10.12.

--------------------------------------------------------------------------------

On 2017-06-27T02:07:42Z, x8x, commented:
<https://github.com/red/red/issues/2837#issuecomment-311232154>

    Yes, actually the whole machine lags in responsiveness, not only Terminal, thought CPU usage doesn't spike. I'll have to try this on a fresh install and let you know.
    Here https://encrypted.google.com/search?hl=en&q=IMKClient%20Stall%20detected there are mentions of the same problem running R and Java, thought I didn't find any answer.

--------------------------------------------------------------------------------

On 2017-06-27T06:54:57Z, rebolek, commented:
<https://github.com/red/red/issues/2837#issuecomment-311269777>

    I cannot reproduce this issue. Switching to another tab is instant and there's no debug output. The only issue is idle circle in the Red tab (for cca 5 secs), but that has no influence on functionality.

--------------------------------------------------------------------------------

On 2017-06-27T07:39:46Z, geekyi, commented:
<https://github.com/red/red/issues/2837#issuecomment-311278815>

    From https://discuss.atom.io/t/imkinputsession-error/36273
    > same here, I am using macOS Sierra ( 10.12.3 )
    
    Also, https://stackoverflow.com/a/41285184/5798459 mentions it may be a keybinding issue.
    Maybe a phantom process still listening to keys?
    (These are all just hunches tho)
    
    I searched for `com.apple.inputmethod.EmojiFunctionRowItem`

--------------------------------------------------------------------------------

On 2017-06-27T11:24:28Z, x8x, commented:
<https://github.com/red/red/issues/2837#issuecomment-311329901>

    Fresh last Sierra on a VM doesn't have this issue. I'll have to investigate further, either something is wrong here or that is specific to MBP with TouchBar.

--------------------------------------------------------------------------------

On 2017-10-22T00:14:55Z, x8x, commented:
<https://github.com/red/red/issues/2837#issuecomment-338441407>

    Lag is gone, either fixed in Red or macOS 10.13.1, thought, running this:
    ```red
    view [ button "ok"]
    ```
    then switching to another Terminal.app tab, and back, and clicking on the `ok` button, I get this:
    ```
    console-2017-8-4-24620[38129:1543502] IMKInputSession [0x1997ac0 presentFunctionRowItemTextInputViewWithEndpoint:completionHandler:] : [self textInputContext]=0x0 *NO* NSRemoteViewController to client, NSError=Error Domain=NSCocoaErrorDomain Code=4097 "connection from pid 0" UserInfo={NSDebugDescription=connection from pid 0}, com.apple.inputmethod.EmojiFunctionRowItem
    ```

--------------------------------------------------------------------------------

On 2018-07-26T12:56:37Z, x8x, commented:
<https://github.com/red/red/issues/2837#issuecomment-408087977>

    Closing this as issue can't be reproduced on macOS 10.13.6

