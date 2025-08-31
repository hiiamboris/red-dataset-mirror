
#2312: [macOS] After fixing issue 2307, OVER events will cause "Runtime Error 1: access violation" in some cases.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 6 comment(s).
<https://github.com/red/red/issues/2312>

Try the following code. After changing the pages a few times, moving mouse cursor in the color area will cause  "Runtime Error 1: access violation".

```Red
Red [
	Title: ""
	Needs: 'View
]

page-header-actors: object [
	on-down: func [ face [object!] event [event!] /local new-page page-container ] [
		if all [ event/offset/x < 300 event/offset/x > 60 ] [ exit ]
		if event/offset/x > 300 [
			new-page: face/parent/extra/next
			new-page/offset: 360x0
		]
		page-container: face/parent/parent
		append page-container/pane new-page
		page-container/rate: 50
	]
]

sliding-actors: object [
	on-time: func [ face [object!] event [event!] /local ofst ] [
		if face/rate [
			ofst: as-pair face/pane/1/offset/x - 20 0 
			if ofst/x < -360 [
				ofst/x: -360
			] 
			face/pane/1/offset: ofst
			face/pane/2/offset: ofst + 360x0
			if face/pane/1/offset/x <= -360 [
				remove face/pane
				face/rate: none
			] 
			'done
		]
	]
]

make-page: func [ title [string!] color* [tuple!] sz [pair!] /with tabs [block!] /local tab [string!] pages [block!] ] [
	make face! [
		type:	'panel
		offset:	0x0
		size:	sz
		color:	white
		pane:	reduce [
			make face! [
				type: 'base
				offset: 0x0
				size: 360x36
				text: title
				color: color*
				draw: [ line 340x8 350x18 340x28 ]
				actors: page-header-actors
			]
		]
	]
]

link-pages: func [ pages [block!] ] [
	forall pages [
		pages/1/extra: object [ 
			next: any [ pages/2 first head pages ] 
		]
	]
]

link-pages reduce [
	orange-page: make-page "click arrow to move to the next" orange 360x640
	red-page: make-page "click arrow to move to the next" red 360x640
]

win: make face! [
	type: 'window
	offset: 50x50
	size: 360x640 
	color: white
	pane: reduce [
		make face! [
			type: 'panel
			offset: 0x0
			size: 360x640
			actors: sliding-actors
			pane: reduce [
				orange-page
			]
		]
	]
]

view win
```



Comments:
--------------------------------------------------------------------------------

On 2016-11-11T02:17:04Z, JenniferLee520, commented:
<https://github.com/red/red/issues/2312#issuecomment-259863977>

    Process:               console [17601]
    Path:                  /Users/USER/console
    Identifier:            console
    Version:               ???
    Code Type:             X86 (Native)
    Parent Process:        bash [17595]
    Responsible:           console [17601]
    User ID:               501
    
    Date/Time:             2016-11-10 22:19:16.145 +0800
    OS Version:            Mac OS X 10.12.1 (16B2555)
    Report Version:        12
    Anonymous UUID:        5A61B230-C09A-2D38-13CF-F099FA5AC81D
    
    Sleep/Wake UUID:       9594B773-51AA-42F6-BFEF-A49C1F9BFD7E
    
    Time Awake Since Boot: 400000 seconds
    Time Since Wake:       3100 seconds
    
    System Integrity Protection: enabled
    
    Crashed Thread:        0  Dispatch queue: com.apple.main-thread
    
    Exception Type:        EXC_BREAKPOINT (SIGTRAP)
    Exception Codes:       0x0000000000000002, 0x0000000000000000
    Exception Note:        EXC_CORPSE_NOTIFY
    
    Termination Signal:    Trace/BPT trap: 5
    Termination Reason:    Namespace SIGNAL, Code 0x5
    Terminating Process:   exc handler [0]
    
    Application Specific Information:
    **\* Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[__NSCFDictionary mouseExited:]: unrecognized selector sent to instance 0x319cd0'
    
    Application Specific Backtrace 1:
    0   CoreFoundation                      0x9468312b **raiseError + 187
    1   libobjc.A.dylib                     0x9ed3d6e6 objc_exception_throw + 273
    2   CoreFoundation                      0x94686fcc -[NSObject(NSObject) doesNotRecognizeSelector:] + 172
    3   CoreFoundation                      0x9456a745 ___forwarding_** + 1013
    4   CoreFoundation                      0x9456a32e _CF_forwarding_prep_0 + 14
    5   console                             0x000479b7 console + 289207
    
    Thread 0 Crashed:: Dispatch queue: com.apple.main-thread
    0   com.apple.CoreFoundation        0x94683487 **_TERMINATING_DUE_TO_UNCAUGHT_EXCEPTION_** + 7
    1   com.apple.CoreFoundation        0x9468341a **raiseError + 938
    2   libobjc.A.dylib                 0x9ed3d6e6 objc_exception_throw + 273
    3   com.apple.CoreFoundation        0x94686fcc -[NSObject(NSObject) doesNotRecognizeSelector:] + 172
    4   com.apple.CoreFoundation        0x9456a745 ___forwarding_** + 1013
    5   com.apple.CoreFoundation        0x9456a32e _CF_forwarding_prep_0 + 14
    6   console                         0x000479b7 0x1000 + 289207
    7   console                         0x00047a90 0x1000 + 289424
    8   console                         0x00047e76 0x1000 + 290422
    9   console                         0x000583d5 0x1000 + 357333
    10  console                         0x0002ecfc 0x1000 + 187644
    11  console                         0x000343a8 0x1000 + 209832
    12  libRedRT.dylib                  0x0014795f red/get-path/push + 1965
    13  libRedRT.dylib                  0x0016de07 red/interpreter/eval-path + 1343
    14  libRedRT.dylib                  0x0016e372 red/interpreter/eval-path + 2730
    15  libRedRT.dylib                  0x0016e664 red/interpreter/eval-path + 3484
    16  libRedRT.dylib                  0x0015f4b1 red/natives/do\* + 349
    17  libRedRT.dylib                  0x0017e4a8 exec/f_do-file + 691
    18  libRedRT.dylib                  0x0015f58d red/natives/do\* + 569
    19  libRedRT.dylib                  0x0016d8c1 red/stack/pop + 6191
    20  libRedRT.dylib                  0x0016dcf1 red/interpreter/eval-path + 1065
    21  libRedRT.dylib                  0x0016e372 red/interpreter/eval-path + 2730
    22  libRedRT.dylib                  0x0016e664 red/interpreter/eval-path + 3484
    23  libRedRT.dylib                  0x001628d0 red/natives/catch\* + 169
    24  console                         0x000419a6 0x1000 + 264614
    25  console                         0x0004277b 0x1000 + 268155
    26  console                         0x00043f8e 0x1000 + 274318
    27  console                         0x00044574 0x1000 + 275828
    28  console                         0x00045064 0x1000 + 278628
    29  console                         0x00011481 0x1000 + 66689
    
    Thread 1:
    0   libsystem_kernel.dylib          0x9f6becbe __workq_kernreturn + 10
    1   libsystem_pthread.dylib         0x9f79edea _pthread_wqthread + 1210
    2   libsystem_pthread.dylib         0x9f79e90a start_wqthread + 34
    
    Thread 2:
    0   libsystem_kernel.dylib          0x9f6becbe __workq_kernreturn + 10
    1   libsystem_pthread.dylib         0x9f79edea _pthread_wqthread + 1210
    2   libsystem_pthread.dylib         0x9f79e90a start_wqthread + 34
    
    Thread 3:
    0   libsystem_kernel.dylib          0x9f6becbe __workq_kernreturn + 10
    1   libsystem_pthread.dylib         0x9f79edea _pthread_wqthread + 1210
    2   libsystem_pthread.dylib         0x9f79e90a start_wqthread + 34
    
    Thread 4:: com.apple.NSEventThread
    0   libsystem_kernel.dylib          0x9f6b691e mach_msg_trap + 10
    1   libsystem_kernel.dylib          0x9f6b5e93 mach_msg + 51
    2   com.apple.CoreFoundation        0x9456f466 __CFRunLoopServiceMachPort + 214
    3   com.apple.CoreFoundation        0x9456e898 __CFRunLoopRun + 1576
    4   com.apple.CoreFoundation        0x9456e00a CFRunLoopRunSpecific + 506
    5   com.apple.CoreFoundation        0x9456ddfb CFRunLoopRunInMode + 123
    6   com.apple.AppKit                0x926b8fca _NSEventThread + 235
    7   libsystem_pthread.dylib         0x9f79f10b _pthread_body + 184
    8   libsystem_pthread.dylib         0x9f79f053 _pthread_start + 243
    9   libsystem_pthread.dylib         0x9f79e92e thread_start + 34
    
    Thread 5:
    0   libsystem_kernel.dylib          0x9f6becbe __workq_kernreturn + 10
    1   libsystem_pthread.dylib         0x9f79edea _pthread_wqthread + 1210
    2   libsystem_pthread.dylib         0x9f79e90a start_wqthread + 34
    
    Thread 6:
    0   libsystem_kernel.dylib          0x9f6becbe __workq_kernreturn + 10
    1   libsystem_pthread.dylib         0x9f79edea _pthread_wqthread + 1210
    2   libsystem_pthread.dylib         0x9f79e90a start_wqthread + 34
    
    Thread 7:
    0   libsystem_kernel.dylib          0x9f6becbe __workq_kernreturn + 10
    1   libsystem_pthread.dylib         0x9f79edea _pthread_wqthread + 1210
    2   libsystem_pthread.dylib         0x9f79e90a start_wqthread + 34
    
    Thread 8:
    0   libsystem_kernel.dylib          0x9f6becbe __workq_kernreturn + 10
    1   libsystem_pthread.dylib         0x9f79ec79 _pthread_wqthread + 841
    2   libsystem_pthread.dylib         0x9f79e90a start_wqthread + 34
    
    Thread 0 crashed with X86 Thread State (32-bit):
      eax: 0x0ef600d4  ebx: 0x0063b050  ecx: 0x00000000  edx: 0x00000000
      edi: 0x9468307e  esi: 0x02893000  ebp: 0xbfffed68  esp: 0xbfffed60
       ss: 0x00000023  efl: 0x00000286  eip: 0x94683487   cs: 0x0000001b
       ds: 0x00000023   es: 0x00000023   fs: 0x00000000   gs: 0x0000000f
      cr2: 0x11b6e000
    
    Logical CPU:     6
    Error Code:      0x00000000
    Trap Number:     3
    
    Binary Images:
        0x1000 -    0x5cbd5 +console (???) /Users/USER/console
       0xa4000 -    0xddcd7  dyld (421.2) <7643B4F6-41E5-38CD-A57E-40DF2EA39F91> /usr/lib/dyld
      0x11c000 -   0x188a5a +libRedRT.dylib (1) /Users/USER/libRedRT.dylib
      0x1a1000 -   0x1b0fff  libSimplifiedChineseConverter.dylib (69) <FA9045CE-B06D-3DB3-A199-C750EBA75BF1> /System/Library/CoreServices/Encodings/libSimplifiedChineseConverter.dylib
     0xf800000 -  0xfdb1fff  com.apple.driver.AppleIntelHD5000GraphicsGLDriver (10.20.23 - 10.2.0) <0C4AE159-BE88-3FDD-B0FB-6B0BEA08E0C6> /System/Library/Extensions/AppleIntelHD5000GraphicsGLDriver.bundle/Contents/MacOS/AppleIntelHD5000GraphicsGLDriver
     0xff92000 - 0x10059ff3  com.apple.AMDRadeonX4000GLDriver (1.46.22 - 1.4.6) <47BB9FBF-6205-3D01-BFBD-567229E96511> /System/Library/Extensions/AMDRadeonX4000GLDriver.bundle/Contents/MacOS/AMDRadeonX4000GLDriver
    0x1006f000 - 0x105a7fff  ATIRadeonX4000SCLib.dylib (1.46.22) <BF25475F-78B2-33F0-B3B9-04867AD9BD55> /System/Library/Extensions/AMDRadeonX4000GLDriver.bundle/Contents/MacOS/ATIRadeonX4000SCLib.dylib
    0x91508000 - 0x916acff3  com.apple.avfoundation (2.0 - 1183.4) <0C52DFC6-E9E9-3349-8610-AB6C3E723B85> /System/Library/Frameworks/AVFoundation.framework/Versions/A/AVFoundation
    0x916ad000 - 0x91755fff  com.apple.audio.AVFAudio (1.0 - ???) <63A076FE-7AD5-39B2-84F8-C9F64FFABC74> /System/Library/Frameworks/AVFoundation.framework/Versions/A/Frameworks/AVFAudio.framework/Versions/A/AVFAudio
    0x91756000 - 0x91756fff  com.apple.Accelerate (1.11 - Accelerate 1.11) <62C97903-C550-3903-B13D-62DA989C898F> /System/Library/Frameworks/Accelerate.framework/Versions/A/Accelerate
    0x91757000 - 0x9176eff3  libCGInterfaces.dylib (331.5) <2CD6039D-4A71-35C0-B699-DFB813FC4869> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vImage.framework/Versions/A/Libraries/libCGInterfaces.dylib
    0x9176f000 - 0x91dd5fe7  com.apple.vImage (8.1 - ???) <672B0F81-DA06-3183-99E6-D373F96D913E> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vImage.framework/Versions/A/vImage
    0x91dd6000 - 0x91f22ff7  libBLAS.dylib (1185) <5427A4D8-E7B6-318E-A4AA-6360A897E4F4> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib
    0x91f23000 - 0x91f35ffb  libBNNS.dylib (14) <074FE791-33E4-30FC-A9CA-2E635AA20222> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBNNS.dylib
    0x91f36000 - 0x922d1fff  libLAPACK.dylib (1185) <6BC652A3-0B24-327C-B535-AAC398EAB45E> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libLAPACK.dylib
    0x922d2000 - 0x922e8ff7  libLinearAlgebra.dylib (1185) <830ECD62-F6AF-3459-9477-C4FD7886A7D9> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libLinearAlgebra.dylib
    0x922e9000 - 0x92303ff7  libSparseBLAS.dylib (1185) <986FB661-8202-335F-A063-EA3211AF2846> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libSparseBLAS.dylib
    0x92304000 - 0x92451feb  libvDSP.dylib (600) <D45F19F0-7541-31F7-97E6-7021806C0416> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libvDSP.dylib
    0x92452000 - 0x92533fef  libvMisc.dylib (600) <31507532-8CC0-3ACD-B240-9A9BC77795A5> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libvMisc.dylib
    0x92534000 - 0x92534fff  com.apple.Accelerate.vecLib (3.11 - vecLib 3.11) <4A23E654-6435-3BDF-8AD9-914A9B828A80> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/vecLib
    0x92535000 - 0x931abff3  com.apple.AppKit (6.9 - 1504.60) <2CED619C-B931-30F0-9403-899E8FC93D76> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
    0x931ac000 - 0x931acfff  com.apple.ApplicationServices (48 - 48) <C863337B-2DC7-3E48-BD59-26A6A2A1B02A> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/ApplicationServices
    0x931ad000 - 0x9321bfff  com.apple.ApplicationServices.ATS (377 - 422.1) <F1F05044-3EE6-3189-A96D-1079CCA35610> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/ATS.framework/Versions/A/ATS
    0x932b4000 - 0x933e1fff  libFontParser.dylib (194.2) <CBCBCFFE-D442-3959-8FAF-52DF942D9B86> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/ATS.framework/Versions/A/Resources/libFontParser.dylib
    0x933e2000 - 0x9342dffb  libFontRegistry.dylib (196.2) <B6D3CA4D-0A6E-305E-89EF-FD0F2E537336> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/ATS.framework/Versions/A/Resources/libFontRegistry.dylib
    0x9342e000 - 0x93460ffb  libTrueTypeScaler.dylib (194.2) <D8C2A03C-4879-3994-B93A-69F21E6B98B2> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/ATS.framework/Versions/A/Resources/libTrueTypeScaler.dylib
    0x934cc000 - 0x9357cff7  com.apple.ColorSync (4.12.0 - 502) <4F99AAFA-ADFC-3342-9624-334AF30EEBFF> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/ColorSync.framework/Versions/A/ColorSync
    0x9357d000 - 0x935d3ff7  com.apple.HIServices (1.22 - 590) <18A7E0D6-B37E-3D84-8FAF-27E72EBB95A4> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/HIServices.framework/Versions/A/HIServices
    0x935d4000 - 0x935e3ff7  com.apple.LangAnalysis (1.7.0 - 1.7.0) <A2720D67-E73F-385F-951F-808B2094B7B2> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/LangAnalysis.framework/Versions/A/LangAnalysis
    0x935e4000 - 0x9363cffb  com.apple.print.framework.PrintCore (12 - 491) <3E1C2274-5845-30D7-A32E-19EB414C9347> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/PrintCore.framework/Versions/A/PrintCore
    0x9363d000 - 0x936d7ff3  com.apple.QD (3.12 - 310) <99379D99-FEE4-3955-94EC-9F2A6A4C9CAC> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/QD.framework/Versions/A/QD
    0x936d8000 - 0x936e4ff3  com.apple.speech.synthesis.framework (6.0.15 - 6.0.15) <C2D03A22-8519-3D95-9A1C-70827C9DC3A8> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/SpeechSynthesis.framework/Versions/A/SpeechSynthesis
    0x936e5000 - 0x938d3ffb  com.apple.audio.toolbox.AudioToolbox (1.14 - 1.14) <F8B0A821-16DB-3F9B-8843-C02B8BEE7D03> /System/Library/Frameworks/AudioToolbox.framework/Versions/A/AudioToolbox
    0x938d4000 - 0x938d4fff  com.apple.audio.units.AudioUnit (1.14 - 1.14) <7EE27DF5-9B6D-37DD-A148-98F035E331A6> /System/Library/Frameworks/AudioUnit.framework/Versions/A/AudioUnit
    0x938d5000 - 0x93c3bffb  com.apple.CFNetwork (807.1.3 - 807.1.3) <BAF5CFB0-8A80-31F9-B46C-AB58687AA066> /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
    0x93c3c000 - 0x93c3cfff  com.apple.Carbon (154 - 157) <020906DA-F74A-3AEB-AF7B-C6315880D39F> /System/Library/Frameworks/Carbon.framework/Versions/A/Carbon
    0x93c3d000 - 0x93c46ff3  com.apple.audio.SoundManager (4.2 - 4.2) <B4F5312B-596A-3AB5-8D03-7D7036FB88B1> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/CarbonSound.framework/Versions/A/CarbonSound
    0x93c47000 - 0x93c4bff3  com.apple.CommonPanels (1.2.6 - 98) <3CCCCE9C-1CB2-35F0-8292-7A7F1EDC3D4C> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/CommonPanels.framework/Versions/A/CommonPanels
    0x93c4c000 - 0x93fe5fff  com.apple.HIToolbox (2.1.1 - 856.6) <4BF24CEF-239F-3B51-A024-10ABF1205978> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox
    0x93fe6000 - 0x94039ff3  com.apple.htmlrendering (77 - 1.1.4) <DE4CE8A1-65EE-3B98-82A5-61D71029A88C> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HTMLRendering.framework/Versions/A/HTMLRendering
    0x9403a000 - 0x9403dfff  com.apple.help (1.3.5 - 49) <C505119F-562E-3CEF-BBF8-BBC59B91BE25> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/Help.framework/Versions/A/Help
    0x9403e000 - 0x94043ffb  com.apple.ImageCapture (9.0 - 9.0) <79C2CE5F-B888-36F2-A9CB-FC80AA9A7AE1> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/ImageCapture.framework/Versions/A/ImageCapture
    0x94044000 - 0x940e3fff  com.apple.ink.framework (10.9 - 219) <3F883447-0C91-3D72-A3F8-70A6A2E1EC72> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/Ink.framework/Versions/A/Ink
    0x940e4000 - 0x9411ffff  com.apple.NavigationServices (3.8 - 225) <13E5F701-204C-3DEF-8BE6-CEB612116181> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/NavigationServices.framework/Versions/A/NavigationServices
    0x94120000 - 0x9413cffb  com.apple.openscripting (1.7 - 172) <524EBB38-902E-30CA-B772-8A3F866CC397> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/OpenScripting.framework/Versions/A/OpenScripting
    0x9413d000 - 0x94142ff3  com.apple.print.framework.Print (12 - 267) <B1886801-014B-395A-A34A-67D3359EF1E6> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/Print.framework/Versions/A/Print
    0x94143000 - 0x94145fff  com.apple.securityhi (9.0 - 55006) <9A01B323-C262-37C7-A577-AEB7ED9A5EB1> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/SecurityHI.framework/Versions/A/SecurityHI
    0x94146000 - 0x9414cff3  com.apple.speech.recognition.framework (6.0.1 - 6.0.1) <7C4EE904-9CD5-3B10-B5AE-9734FBF9F1F6> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/SpeechRecognition.framework/Versions/A/SpeechRecognition
    0x9414d000 - 0x9414dfff  com.apple.Cocoa (6.11 - 22) <65D7E4E6-447F-3894-ABA0-EE95CAE4B035> /System/Library/Frameworks/Cocoa.framework/Versions/A/Cocoa
    0x9414e000 - 0x941e7ff7  com.apple.audio.CoreAudio (4.3.0 - 4.3.0) <B865D579-60B1-30D1-B727-2FF819445961> /System/Library/Frameworks/CoreAudio.framework/Versions/A/CoreAudio
    0x941e8000 - 0x941faff3  com.apple.CoreBluetooth (1.0 - 1) <BE14064D-95DD-32E3-BAAA-E3B8DF23CE10> /System/Library/Frameworks/CoreBluetooth.framework/Versions/A/CoreBluetooth
    0x941fb000 - 0x944e1fff  com.apple.CoreData (120 - 752.2) <A7FF596C-FB78-344D-A3F4-87D9CA966117> /System/Library/Frameworks/CoreData.framework/Versions/A/CoreData
    0x944e9000 - 0x94989fff  com.apple.CoreFoundation (6.9 - 1348.15) <4687B2E6-F656-3B74-9944-057D89373996> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
    0x9498a000 - 0x9502bff7  com.apple.CoreGraphics (2.0 - 1070.8) <83CBDA4B-63B4-3FF9-B1A0-A4FA587FA6C0> /System/Library/Frameworks/CoreGraphics.framework/Versions/A/CoreGraphics
    0x9502c000 - 0x9525fff3  com.apple.CoreImage (12.0.0 - 451) <DA749283-48F9-3E21-8EB0-F99CEAD697CA> /System/Library/Frameworks/CoreImage.framework/Versions/A/CoreImage
    0x952c4000 - 0x95370fff  com.apple.CoreMedia (1.0 - 1903.11) <CBA7DA09-C690-358E-9049-0856FE435EE9> /System/Library/Frameworks/CoreMedia.framework/Versions/A/CoreMedia
    0x95371000 - 0x953c0fff  com.apple.CoreMediaIO (803.0 - 4927) <4DB8837F-F372-3FF4-94B4-FFB5F4017C71> /System/Library/Frameworks/CoreMediaIO.framework/Versions/A/CoreMediaIO
    0x953c1000 - 0x953c1fff  com.apple.CoreServices (775.8.2 - 775.8.2) <90B8F61A-6F09-3B72-B867-F9AD281EAAD8> /System/Library/Frameworks/CoreServices.framework/Versions/A/CoreServices
    0x953c2000 - 0x95413fff  com.apple.AE (712 - 712) <E19832B7-FA17-36ED-9A0E-6DF14A5471E0> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/AE.framework/Versions/A/AE
    0x95414000 - 0x956f5ffb  com.apple.CoreServices.CarbonCore (1159 - 1159) <C0A3A650-4765-3244-828F-0DCC8C9D628A> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/CarbonCore.framework/Versions/A/CarbonCore
    0x956f6000 - 0x95729ffb  com.apple.DictionaryServices (1.2 - 274) <4393260A-D5BD-3A92-9CB5-3DFEFCA33EF5> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/DictionaryServices.framework/Versions/A/DictionaryServices
    0x9572a000 - 0x95731fff  com.apple.CoreServices.FSEvents (1230 - 1230) <DB224822-A5D1-3E68-8711-2583D0D13F1A> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/FSEvents.framework/Versions/A/FSEvents
    0x95732000 - 0x95854ffb  com.apple.LaunchServices (775.8.2 - 775.8.2) <118144CF-CDC3-3805-AC42-14BDDFE21BC7> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/LaunchServices
    0x95855000 - 0x95903fff  com.apple.Metadata (10.7.0 - 1075.17) <77D1A99E-85A2-35C8-A6CC-E184AE949C3B> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/Metadata.framework/Versions/A/Metadata
    0x95904000 - 0x95964ff3  com.apple.CoreServices.OSServices (775.8.2 - 775.8.2) <CE231560-09FB-34CC-A718-536B3901FA2E> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/OSServices.framework/Versions/A/OSServices
    0x95965000 - 0x959d6fff  com.apple.SearchKit (1.4.0 - 1.4.0) <FAB92950-3E86-3EA5-8085-AC17D31DDAC5> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/SearchKit.framework/Versions/A/SearchKit
    0x959d7000 - 0x95a1dffb  com.apple.coreservices.SharedFileList (38 - 38) <1E657B57-AF5A-346A-B576-BD66AAE8B447> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/SharedFileList.framework/Versions/A/SharedFileList
    0x95a1e000 - 0x95b60ff3  com.apple.CoreText (352.0 - 544.1) <0100C29D-DA21-3387-A10D-55A95BD4AEAC> /System/Library/Frameworks/CoreText.framework/Versions/A/CoreText
    0x95b61000 - 0x95b98ffb  com.apple.CoreVideo (1.8 - 234.0) <0BB575AD-DEF9-31EA-82E3-A02C8ECA3C23> /System/Library/Frameworks/CoreVideo.framework/Versions/A/CoreVideo
    0x95b99000 - 0x95c08ff3  com.apple.framework.CoreWLAN (11.0 - 1200.25.1) <4912CB84-69DF-372F-AED1-8D2D3D9DED96> /System/Library/Frameworks/CoreWLAN.framework/Versions/A/CoreWLAN
    0x95c09000 - 0x95c12ff7  com.apple.DiskArbitration (2.7 - 2.7) <C416B590-079B-3DBA-8631-9BDE1A073F31> /System/Library/Frameworks/DiskArbitration.framework/Versions/A/DiskArbitration
    0x95c16000 - 0x95f83ff3  com.apple.Foundation (6.9 - 1349) <81CF3276-8D44-3137-8B91-E0FE3E684F12> /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
    0x95f84000 - 0x95fb4ffb  com.apple.GSS (4.0 - 2.0) <05756263-F0D2-34C4-9BB4-E39D6E729D5B> /System/Library/Frameworks/GSS.framework/Versions/A/GSS
    0x95fb5000 - 0x96057fff  com.apple.Bluetooth (5.0.1 - 5.0.1f7) <9465AEE8-F9F6-38F8-9067-95023605301F> /System/Library/Frameworks/IOBluetooth.framework/Versions/A/IOBluetooth
    0x96058000 - 0x960f2ff7  com.apple.framework.IOKit (2.0.2 - 1324.21.1) <E26F52D9-5377-3745-88C9-B580B5BC1EE7> /System/Library/Frameworks/IOKit.framework/Versions/A/IOKit
    0x960f3000 - 0x960f9fff  com.apple.IOSurface (153.1 - 153.1) <99F868D9-38C5-3CB2-9A6E-D10CF4FCE5CA> /System/Library/Frameworks/IOSurface.framework/Versions/A/IOSurface
    0x9614e000 - 0x962a7ffb  com.apple.ImageIO.framework (3.3.0 - 1570.2) <2CA7967C-61CC-3D65-8198-AE471A397C40> /System/Library/Frameworks/ImageIO.framework/Versions/A/ImageIO
    0x962a8000 - 0x962abffb  libGIF.dylib (1570.2) <8CCF9FCF-CC19-3CDA-B593-454C350C6559> /System/Library/Frameworks/ImageIO.framework/Versions/A/Resources/libGIF.dylib
    0x962ac000 - 0x963a4ffb  libJP2.dylib (1570.2) <FB233CBF-E025-3EC2-8357-57C2D9212E3E> /System/Library/Frameworks/ImageIO.framework/Versions/A/Resources/libJP2.dylib
    0x963a5000 - 0x963c8ff7  libJPEG.dylib (1570.2) <8837EA4F-2F03-38AC-99C6-56D372D3EB0A> /System/Library/Frameworks/ImageIO.framework/Versions/A/Resources/libJPEG.dylib
    0x963c9000 - 0x963efff3  libPng.dylib (1570.2) <0D2E505C-BFF7-3700-987C-D3F8060833B5> /System/Library/Frameworks/ImageIO.framework/Versions/A/Resources/libPng.dylib
    0x963f0000 - 0x963f2ffb  libRadiance.dylib (1570.2) <9BF98633-1E38-3887-9A23-E17FECCB8D08> /System/Library/Frameworks/ImageIO.framework/Versions/A/Resources/libRadiance.dylib
    0x963f3000 - 0x96449ffb  libTIFF.dylib (1570.2) <60B8F2B8-87F7-36B9-B1CA-DC7F5153982C> /System/Library/Frameworks/ImageIO.framework/Versions/A/Resources/libTIFF.dylib
    0x96bdf000 - 0x96bf7fff  com.apple.Kerberos (3.0 - 1) <CE9145D9-9319-3182-B90A-D1BE626B4298> /System/Library/Frameworks/Kerberos.framework/Versions/A/Kerberos
    0x96bf8000 - 0x96bfffff  com.apple.MediaAccessibility (1.0 - 97.1.1) <BAA62930-ACB8-35D0-B9F4-A880897BA810> /System/Library/Frameworks/MediaAccessibility.framework/Versions/A/MediaAccessibility
    0x96c00000 - 0x9715efff  com.apple.MediaToolbox (1.0 - 1903.11) <660A7634-FB93-3FE6-82C5-A27B881DB02C> /System/Library/Frameworks/MediaToolbox.framework/Versions/A/MediaToolbox
    0x9715f000 - 0x971affff  com.apple.Metal (85.85 - 85.85) <2AD2B3DB-8566-3916-B9A6-7EA0099B2CCD> /System/Library/Frameworks/Metal.framework/Versions/A/Metal
    0x971b0000 - 0x971b8fff  com.apple.NetFS (6.0 - 4.0) <5C7E8AD8-8CE2-36AB-821F-CE31BD1C586F> /System/Library/Frameworks/NetFS.framework/Versions/A/NetFS
    0x971b9000 - 0x971c1ff7  libcldcpuengine.dylib (2.8.4) <37E0EF75-741F-300A-89E5-9925DDD9A29A> /System/Library/Frameworks/OpenCL.framework/Versions/A/Libraries/libcldcpuengine.dylib
    0x97395000 - 0x973e1fff  com.apple.opencl (2.8.6 - 2.8.6) <1A2562A0-0D22-3493-842D-0E4EC06E6F70> /System/Library/Frameworks/OpenCL.framework/Versions/A/OpenCL
    0x973e2000 - 0x973fbfff  com.apple.CFOpenDirectory (10.12 - 194) <80A91747-A1D4-359A-B33B-0E5A00078E91> /System/Library/Frameworks/OpenDirectory.framework/Versions/A/Frameworks/CFOpenDirectory.framework/Versions/A/CFOpenDirectory
    0x973fc000 - 0x97407fff  com.apple.OpenDirectory (10.12 - 194) <6A80FC88-1259-3BE1-ADF2-428F9DD61A06> /System/Library/Frameworks/OpenDirectory.framework/Versions/A/OpenDirectory
    0x97408000 - 0x9740afff  libCVMSPluginSupport.dylib (12.4.5) <42A45AD1-B271-3AEB-9B24-3D37E2D2E7B3> /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libCVMSPluginSupport.dylib
    0x9740b000 - 0x9740efff  libCoreFSCache.dylib (150) <A81916AE-9D4A-3CDA-95B5-DDCF56554073> /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libCoreFSCache.dylib
    0x9740f000 - 0x97412fff  libCoreVMClient.dylib (150) <6030CF01-7ADA-3BA8-BA60-6EE2046D5FF1> /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libCoreVMClient.dylib
    0x97413000 - 0x9741bff7  libGFXShared.dylib (12.4.5) <BAB149C0-601F-31BA-8591-6014EB43968E> /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGFXShared.dylib
    0x9741c000 - 0x97428fff  libGL.dylib (12.4.5) <C95DA2FB-F4A9-3E34-A763-1946C58A1E34> /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGL.dylib
    0x97429000 - 0x97466ffb  libGLImage.dylib (12.4.5) <1804BE1A-5F84-33A6-A50F-94CC10E5E388> /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGLImage.dylib
    0x97467000 - 0x975ebff7  libGLProgrammability.dylib (12.4.5) <F3A0B64F-E97E-3E1A-81E6-DAA4DB1227EF> /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGLProgrammability.dylib
    0x975ec000 - 0x9762ffff  libGLU.dylib (12.4.5) <F6E9BB96-4E94-3645-8D85-0B9E9A9338E9> /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGLU.dylib
    0x97ffe000 - 0x9800cfff  com.apple.opengl (12.4.5 - 12.4.5) <76DFFB45-834D-38B5-9F50-DEADC79A475D> /System/Library/Frameworks/OpenGL.framework/Versions/A/OpenGL
    0x9800d000 - 0x981a9ffb  GLEngine (12.4.5) <769F9328-F4D7-3832-87D3-DDFD13C35F81> /System/Library/Frameworks/OpenGL.framework/Versions/A/Resources/GLEngine.bundle/GLEngine
    0x981aa000 - 0x981d6ff7  GLRendererFloat (12.4.5) <928D6876-A2F2-3167-9F05-8D1673A5F1A0> /System/Library/Frameworks/OpenGL.framework/Versions/A/Resources/GLRendererFloat.bundle/GLRendererFloat
    0x98c6e000 - 0x98e6bfff  com.apple.QuartzCore (1.11 - 449.39.5) <0306934F-9F35-3C34-860F-B1AAFC94208F> /System/Library/Frameworks/QuartzCore.framework/Versions/A/QuartzCore
    0x99121000 - 0x99458ffb  com.apple.security (7.0 - 57740.20.22) <77CA0631-A95F-3080-B713-B36FFBA9B971> /System/Library/Frameworks/Security.framework/Versions/A/Security
    0x99459000 - 0x994ccff7  com.apple.securityfoundation (6.0 - 55132.20.1) <AC2BC02D-6997-3AF3-AA16-7DEBFFC00FB3> /System/Library/Frameworks/SecurityFoundation.framework/Versions/A/SecurityFoundation
    0x994cd000 - 0x994d0fff  com.apple.xpc.ServiceManagement (1.0 - 1) <73DED253-F72D-36ED-903A-C065C774D1E2> /System/Library/Frameworks/ServiceManagement.framework/Versions/A/ServiceManagement
    0x994d1000 - 0x99543fff  com.apple.SystemConfiguration (1.14 - 1.14) <91473D88-3778-318D-A22C-A58358B1906D> /System/Library/Frameworks/SystemConfiguration.framework/Versions/A/SystemConfiguration
    0x99544000 - 0x998d9ff7  com.apple.VideoToolbox (1.0 - 1903.11) <83E34947-7E4C-33F9-B345-A6AA82CF0600> /System/Library/Frameworks/VideoToolbox.framework/Versions/A/VideoToolbox
    0x9b27a000 - 0x9b295fff  com.apple.AppContainer (4.0 - 307.20.1) <0256A17E-D48C-3775-81E0-B2319BC27E85> /System/Library/PrivateFrameworks/AppContainer.framework/Versions/A/AppContainer
    0x9b296000 - 0x9b2a3fff  com.apple.AppSandbox (4.0 - 307.20.1) <05E653C5-EC03-3481-ADF6-7E0FF021DA01> /System/Library/PrivateFrameworks/AppSandbox.framework/Versions/A/AppSandbox
    0x9b2a4000 - 0x9b2c8ff3  com.apple.framework.Apple80211 (12.0 - 1200.37) <65AB7FAF-6E79-3DB6-8ACE-942CEEF4261B> /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Apple80211
    0x9b2c9000 - 0x9b2d3fff  com.apple.AppleFSCompression (88 - 1.0) <5674A751-C990-3B79-AA93-251A39B7F67F> /System/Library/PrivateFrameworks/AppleFSCompression.framework/Versions/A/AppleFSCompression
    0x9b39f000 - 0x9b3dcff7  com.apple.AppleJPEG (1.0 - 1) <8B5A8728-5D17-341D-843A-796625A817DD> /System/Library/PrivateFrameworks/AppleJPEG.framework/Versions/A/AppleJPEG
    0x9b405000 - 0x9b455fff  com.apple.AppleVAFramework (5.0.34 - 5.0.34) <5EAE560E-36E2-3161-ABC2-5EFFA449A13C> /System/Library/PrivateFrameworks/AppleVA.framework/Versions/A/AppleVA
    0x9b456000 - 0x9b4d9fff  com.apple.backup.framework (1.8.1 - 1.8.1) <9514B3C6-A1DA-3375-9F12-14C17BF1B2D8> /System/Library/PrivateFrameworks/Backup.framework/Versions/A/Backup
    0x9b519000 - 0x9b522ffb  com.apple.CommonAuth (4.0 - 2.0) <503FF067-D73F-3332-ABE5-C64CAE36921F> /System/Library/PrivateFrameworks/CommonAuth.framework/Versions/A/CommonAuth
    0x9b530000 - 0x9b847fef  com.apple.CoreAUC (224.0.0 - 224.0.0) <69040788-6C72-365A-875C-DE900487A932> /System/Library/PrivateFrameworks/CoreAUC.framework/Versions/A/CoreAUC
    0x9b848000 - 0x9b879ffb  com.apple.CoreAVCHD (5.9.0 - 5900.4.1) <F1CA3E84-F193-3ED1-A51B-F280879C51D3> /System/Library/PrivateFrameworks/CoreAVCHD.framework/Versions/A/CoreAVCHD
    0x9b883000 - 0x9b894ff7  com.apple.CoreEmoji (1.0 - 39.1) <84634A81-4DD3-3754-9A35-060B27FE5A36> /System/Library/PrivateFrameworks/CoreEmoji.framework/Versions/A/CoreEmoji
    0x9b932000 - 0x9b963ff7  com.apple.CoreServicesInternal (276 - 276) <6490077F-203A-3AAA-A907-51A1BF75C9A2> /System/Library/PrivateFrameworks/CoreServicesInternal.framework/Versions/A/CoreServicesInternal
    0x9b964000 - 0x9b9eeffb  com.apple.CoreSymbolication (61050) <B6FF68F3-5709-31F5-972C-CE892922F2A9> /System/Library/PrivateFrameworks/CoreSymbolication.framework/Versions/A/CoreSymbolication
    0x9b9ef000 - 0x9bb1dff3  com.apple.coreui (2.1 - 426.9.1) <F9080787-8F90-37FC-8B6E-E9A20A0EF03C> /System/Library/PrivateFrameworks/CoreUI.framework/Versions/A/CoreUI
    0x9bb1e000 - 0x9bbabfff  com.apple.CoreUtils (4.3 - 430.70) <761D62DC-7C5E-3F4C-A7D1-C0734451D811> /System/Library/PrivateFrameworks/CoreUtils.framework/Versions/A/CoreUtils
    0x9bbac000 - 0x9bc0cff3  com.apple.framework.CoreWiFi (12.0 - 1200.25.1) <B116D473-3455-3E98-8EFA-090445C6F854> /System/Library/PrivateFrameworks/CoreWiFi.framework/Versions/A/CoreWiFi
    0x9bc0d000 - 0x9bc1bfff  com.apple.CrashReporterSupport (10.12 - 816) <3E54C25E-8457-3FEF-9C8B-2ED7BF260D10> /System/Library/PrivateFrameworks/CrashReporterSupport.framework/Versions/A/CrashReporterSupport
    0x9bc1c000 - 0x9bc8eff3  com.apple.datadetectorscore (7.0 - 539) <CFB8F4D8-4D7C-3BA4-B107-DE2C4E61F2E5> /System/Library/PrivateFrameworks/DataDetectorsCore.framework/Versions/A/DataDetectorsCore
    0x9bc8f000 - 0x9bccfff3  com.apple.DebugSymbols (137 - 137) <8580D279-7FD5-34FF-90CA-2B7956909C03> /System/Library/PrivateFrameworks/DebugSymbols.framework/Versions/A/DebugSymbols
    0x9bcd0000 - 0x9bdefff3  com.apple.desktopservices (1.11.1 - 1.11.1) <AD63D305-3736-35F8-8483-7DD88F9B0D6B> /System/Library/PrivateFrameworks/DesktopServicesPriv.framework/Versions/A/DesktopServicesPriv
    0x9be50000 - 0x9c281ff3  com.apple.vision.FaceCore (3.3.2 - 3.3.2) <FD8240FE-CA8D-3962-B7F2-4C0DBB8C20FA> /System/Library/PrivateFrameworks/FaceCore.framework/Versions/A/FaceCore
    0x9c282000 - 0x9c282fff  libmetal_timestamp.dylib (600.0.48.26) <38099009-5B85-3366-B1D7-0291C7355958> /System/Library/PrivateFrameworks/GPUCompiler.framework/libmetal_timestamp.dylib
    0x9c28e000 - 0x9c298ffb  libGPUSupportMercury.dylib (12.4.5) <E5EE633D-C4E2-333B-BD81-88E726880A40> /System/Library/PrivateFrameworks/GPUSupport.framework/Versions/A/Libraries/libGPUSupportMercury.dylib
    0x9c299000 - 0x9c2b4ffb  com.apple.GenerationalStorage (2.0 - 259) <30538C02-C625-3999-8223-ADDE32A4E32D> /System/Library/PrivateFrameworks/GenerationalStorage.framework/Versions/A/GenerationalStorage
    0x9c924000 - 0x9c998ffb  com.apple.Heimdal (4.0 - 2.0) <170AD633-3EB3-3156-A592-3A3A1B054EF9> /System/Library/PrivateFrameworks/Heimdal.framework/Versions/A/Heimdal
    0x9cb2e000 - 0x9cb34fff  com.apple.IOAccelerator (288.15 - 288.15) <94CCE27D-D9EC-3302-B6AE-8AEDFA1CAA01> /System/Library/PrivateFrameworks/IOAccelerator.framework/Versions/A/IOAccelerator
    0x9cb35000 - 0x9cb5bff7  com.apple.IconServices (74.1 - 74.1) <B2624BC9-C02A-3E23-8B99-49974C95566D> /System/Library/PrivateFrameworks/IconServices.framework/Versions/A/IconServices
    0x9cb5c000 - 0x9cb6cfff  com.apple.IntlPreferences (2.0 - 216) <5959CE96-9BFB-3562-897A-638428155FB6> /System/Library/PrivateFrameworks/IntlPreferences.framework/Versions/A/IntlPreferences
    0x9cb6d000 - 0x9cd29fff  com.apple.LanguageModeling (1.0 - 123) <889386AE-EE29-3306-A82D-EF89C6CFB882> /System/Library/PrivateFrameworks/LanguageModeling.framework/Versions/A/LanguageModeling
    0x9cd2c000 - 0x9cd54ffb  com.apple.MultitouchSupport.framework (368.4 - 368.4) <FE141DCD-00C3-3BC1-A83A-BE2788F0866E> /System/Library/PrivateFrameworks/MultitouchSupport.framework/Versions/A/MultitouchSupport
    0x9cd55000 - 0x9cd5ffff  com.apple.NetAuth (6.0 - 6.0) <747FCFFD-3212-3110-892D-26E9AD6BAE2E> /System/Library/PrivateFrameworks/NetAuth.framework/Versions/A/NetAuth
    0x9cd60000 - 0x9cd9dff7  com.apple.PerformanceAnalysis (1.145 - 145) <47C65393-805E-3184-A968-576446352CEA> /System/Library/PrivateFrameworks/PerformanceAnalysis.framework/Versions/A/PerformanceAnalysis
    0x9cd9e000 - 0x9cdb7fff  com.apple.ProtocolBuffer (1 - 249) <48A2A59F-41A4-3A5D-9347-F824F2AB8732> /System/Library/PrivateFrameworks/ProtocolBuffer.framework/Versions/A/ProtocolBuffer
    0x9cdc8000 - 0x9cdebffb  com.apple.RemoteViewServices (2.0 - 124) <024B640F-8EDC-311B-AB6B-581B591BD32C> /System/Library/PrivateFrameworks/RemoteViewServices.framework/Versions/A/RemoteViewServices
    0x9cdec000 - 0x9cdeefff  com.apple.SecCodeWrapper (4.0 - 307.20.1) <61D8268C-CD5C-3DE1-A22A-338B10D1AC56> /System/Library/PrivateFrameworks/SecCodeWrapper.framework/Versions/A/SecCodeWrapper
    0x9cdef000 - 0x9ce1cff3  com.apple.Sharing (671.15 - 671.15) <36079906-ED99-37EA-A7DF-B02AE632AC3D> /System/Library/PrivateFrameworks/Sharing.framework/Versions/A/Sharing
    0x9ce3c000 - 0x9ceb7fff  com.apple.SkyLight (1.600.0 - 108.11) <291533DB-EEDF-3469-91FC-E6E017FC1ECC> /System/Library/PrivateFrameworks/SkyLight.framework/Versions/A/SkyLight
    0x9ceb8000 - 0x9cec5ff7  com.apple.SpeechRecognitionCore (3.0.15 - 3.0.15) <770178AA-A29C-3CC3-9A60-1F7D626F5A38> /System/Library/PrivateFrameworks/SpeechRecognitionCore.framework/Versions/A/SpeechRecognitionCore
    0x9cec6000 - 0x9cf2dff7  com.apple.Symbolication (61080.2) <15D43030-41F8-3F91-A29C-2A3D395529D8> /System/Library/PrivateFrameworks/Symbolication.framework/Versions/A/Symbolication
    0x9cf2e000 - 0x9cf34fff  com.apple.TCC (1.0 - 1) <B7B521FB-4636-3970-BF75-E6E48CC24E00> /System/Library/PrivateFrameworks/TCC.framework/Versions/A/TCC
    0x9cf35000 - 0x9d153ff7  com.apple.TextureIO (1.35 - 1.35) <DDB35454-B4CC-35EA-8C2D-0B92A03B56AD> /System/Library/PrivateFrameworks/TextureIO.framework/Versions/A/TextureIO
    0x9d154000 - 0x9d155fff  com.apple.TrustEvaluationAgent (2.0 - 28) <0F065514-91E7-37D6-B630-48F19ABA4027> /System/Library/PrivateFrameworks/TrustEvaluationAgent.framework/Versions/A/TrustEvaluationAgent
    0x9d156000 - 0x9d2c8fff  com.apple.UIFoundation (1.0 - 489) <E3419B48-68BE-3A7C-A309-8EA96F3C87BC> /System/Library/PrivateFrameworks/UIFoundation.framework/Versions/A/UIFoundation
    0x9d4ab000 - 0x9d555ff7  com.apple.ViewBridge (276 - 276) <226F7136-5FB8-3962-BDE0-D89BE8C85D43> /System/Library/PrivateFrameworks/ViewBridge.framework/Versions/A/ViewBridge
    0x9d556000 - 0x9d55cfff  com.apple.XPCService (2.0 - 1) <90E2DE01-699D-3FCB-927C-D3A9AB80AC22> /System/Library/PrivateFrameworks/XPCService.framework/Versions/A/XPCService
    0x9d55d000 - 0x9d55ffff  com.apple.loginsupport (1.0 - 1) <36F9FE15-A52F-3D85-8254-32A05F27CBD9> /System/Library/PrivateFrameworks/login.framework/Versions/A/Frameworks/loginsupport.framework/Versions/A/loginsupport
    0x9e05c000 - 0x9e077ffb  libCRFSuite.dylib (34) <66E63967-8344-36DA-A49B-F7E7B89C8E45> /usr/lib/libCRFSuite.dylib
    0x9e078000 - 0x9e081ff7  libChineseTokenizer.dylib (21) <61786B6B-424D-35CB-AC86-55F44E0C255B> /usr/lib/libChineseTokenizer.dylib
    0x9e082000 - 0x9e083fff  libDiagnosticMessagesClient.dylib (102) <6D00EEF3-EF16-3B1B-AB18-B8F797B468A2> /usr/lib/libDiagnosticMessagesClient.dylib
    0x9e084000 - 0x9e2b5ffb  libFosl_dynamic.dylib (16.37) <462E4320-2BD8-3E84-BEF4-E3D26E34D7A5> /usr/lib/libFosl_dynamic.dylib
    0x9e2b6000 - 0x9e2bdfff  libMatch.1.dylib (27) <8B756C3D-FFE3-3F31-8667-89957F22F172> /usr/lib/libMatch.1.dylib
    0x9e2be000 - 0x9e2befff  libOpenScriptingUtil.dylib (172) <D520D83C-70F1-3128-AB48-63D29E9B054C> /usr/lib/libOpenScriptingUtil.dylib
    0x9e2bf000 - 0x9e2c2ff3  libScreenReader.dylib (477.10.20) <638BF445-FFAF-34D9-8754-D6C5AFCEE291> /usr/lib/libScreenReader.dylib
    0x9e2c3000 - 0x9e2c4fff  libSystem.B.dylib (1238) <AEE7E545-BC32-31A0-9E53-4FF58D40F26A> /usr/lib/libSystem.B.dylib
    0x9e2c5000 - 0x9e2f1ff7  libarchive.2.dylib (41.20.1) <07BA6C6C-D2E7-37B0-A322-19C9AEAFE831> /usr/lib/libarchive.2.dylib
    0x9e2f2000 - 0x9e40cfc3  libate.dylib (1.12.12) <374893F6-3928-39A2-AD77-177C288A8EDF> /usr/lib/libate.dylib
    0x9e40d000 - 0x9e40dff3  libauto.dylib (187) <0DB50ACB-BFB1-3A23-BD39-4C3AFD597D29> /usr/lib/libauto.dylib
    0x9e40e000 - 0x9e41efff  libbsm.0.dylib (34) <6B938CF1-9249-3466-8A0C-477718FD2C7B> /usr/lib/libbsm.0.dylib
    0x9e41f000 - 0x9e42cff7  libbz2.1.0.dylib (38) <DEB36300-52BE-3AC3-AE86-ADD5C7A6D843> /usr/lib/libbz2.1.0.dylib
    0x9e42d000 - 0x9e483fff  libc++.1.dylib (307.4) <B451A2B1-E76C-3175-B6D1-5D2D58EE2099> /usr/lib/libc++.1.dylib
    0x9e484000 - 0x9e4a7ff3  libc++abi.dylib (307.2) <14434F90-C6BA-38DC-8193-EED9BC3A3292> /usr/lib/libc++abi.dylib
    0x9e4a8000 - 0x9e4b9ff7  libcmph.dylib (6) <04896475-3BC1-30FC-B34B-F091AF65E1CD> /usr/lib/libcmph.dylib
    0x9e4ba000 - 0x9e4cdff7  libcompression.dylib (34) <52D0A919-C275-34EC-9CED-8E1B27F357A3> /usr/lib/libcompression.dylib
    0x9e4ce000 - 0x9e4cefff  libcoretls.dylib (121.1.1) <7E85AE79-9EA7-3372-B43C-1AF0DC0AB34A> /usr/lib/libcoretls.dylib
    0x9e4cf000 - 0x9e4d0ff7  libcoretls_cfhelpers.dylib (121.1.1) <DAF89DD1-BB31-3E7A-96C0-5F0DD8681776> /usr/lib/libcoretls_cfhelpers.dylib
    0x9e573000 - 0x9e662fff  libcrypto.0.9.8.dylib (64) <4380BF59-E5A9-3576-A9D2-067B4215F5AB> /usr/lib/libcrypto.0.9.8.dylib
    0x9e663000 - 0x9e6b8fff  libcups.2.dylib (450) <69ACE50F-46C4-3B5F-AF7B-1BFFC48D6708> /usr/lib/libcups.2.dylib
    0x9e6b9000 - 0x9e6b9fff  libenergytrace.dylib (15) <0A18EAA7-EF49-312B-82A2-31A2A7C93860> /usr/lib/libenergytrace.dylib
    0x9e6bb000 - 0x9e6bffff  libheimdal-asn1.dylib (498.20.2) <A679B6B5-D408-33FC-858B-9E144ADAA394> /usr/lib/libheimdal-asn1.dylib
    0x9e6c0000 - 0x9e7b0ff3  libiconv.2.dylib (50) <34E6F33E-A727-3A53-8661-3F6380019B65> /usr/lib/libiconv.2.dylib
    0x9e7b1000 - 0x9e9cdff7  libicucore.A.dylib (57132.0.1) <B5D23463-155E-3012-80D3-49C9030CE9AF> /usr/lib/libicucore.A.dylib
    0x9e9ce000 - 0x9e9cffff  liblangid.dylib (126) <EA6013B6-733D-330C-9377-C9D11462CBA3> /usr/lib/liblangid.dylib
    0x9e9d0000 - 0x9e9e9ff7  liblzma.5.dylib (10) <F1C46DE7-44C7-34CD-A9CF-56B204A31965> /usr/lib/liblzma.5.dylib
    0x9e9ea000 - 0x9e9ffff3  libmarisa.dylib (5) <4CB11A15-6F11-3CF9-937B-7CA7DBE970FA> /usr/lib/libmarisa.dylib
    0x9ea00000 - 0x9ecb6ff7  libmecabra.dylib (744.2.2) <F4FDB306-6639-3384-8F60-66EF4EA38E95> /usr/lib/libmecabra.dylib
    0x9ecb7000 - 0x9ed2efff  libnetwork.dylib (856.20.4) <0ED25528-A342-362D-8022-E0D2B6F0143E> /usr/lib/libnetwork.dylib
    0x9ed2f000 - 0x9f0f2c93  libobjc.A.dylib (706) <36E48972-15DA-37A0-939B-159296C7CD58> /usr/lib/libobjc.A.dylib
    0x9f0f3000 - 0x9f0f6fff  libpam.2.dylib (21) <AE4FF146-5F2B-3591-B7BA-DCAB058E8922> /usr/lib/libpam.2.dylib
    0x9f0f7000 - 0x9f125ff7  libpcap.A.dylib (67) <37BAAB9C-8C32-3DD7-85D2-5E4DEA10B2DA> /usr/lib/libpcap.A.dylib
    0x9f126000 - 0x9f142ffb  libresolv.9.dylib (64) <FC3630FB-0289-3A80-AF06-7F29BD2B9E5C> /usr/lib/libresolv.9.dylib
    0x9f143000 - 0x9f17afff  libsandbox.1.dylib (592.21.2) <A72D07FB-3F47-3998-9F1A-EFE8CC2C0E23> /usr/lib/libsandbox.1.dylib
    0x9f17b000 - 0x9f2bdff7  libsqlite3.dylib (252) <851CC492-184C-35BC-BC06-FD2A3B3AFC70> /usr/lib/libsqlite3.dylib
    0x9f39c000 - 0x9f3aaff7  libxar.1.dylib (354) <F27AE07A-0285-3200-A0B7-2EDD2FEF5D43> /usr/lib/libxar.1.dylib
    0x9f3ab000 - 0x9f48fff7  libxml2.2.dylib (30.11) <0E7EC5F2-B06D-3D04-9C88-4C90142C21B7> /usr/lib/libxml2.2.dylib
    0x9f490000 - 0x9f4b8ff3  libxslt.1.dylib (15.8) <8B3591C4-5082-3DF4-85F4-A4C567871334> /usr/lib/libxslt.1.dylib
    0x9f4b9000 - 0x9f4c7ff7  libz.1.dylib (67) <6545D126-B808-3930-9225-547325D7158E> /usr/lib/libz.1.dylib
    0x9f4d6000 - 0x9f4dafff  libcache.dylib (79) <273514C9-84F4-3EA1-B7E9-10FD5ACBE6DA> /usr/lib/system/libcache.dylib
    0x9f4db000 - 0x9f4e5ff3  libcommonCrypto.dylib (60092.20.1) <DE9B6DA1-359E-3C60-943E-F7069D9BE920> /usr/lib/system/libcommonCrypto.dylib
    0x9f4e6000 - 0x9f4ebff3  libcompiler_rt.dylib (62) <4E3D63AE-7E55-3A11-8E9F-C3D6EAAF3FF6> /usr/lib/system/libcompiler_rt.dylib
    0x9f4ec000 - 0x9f4f4ff7  libcopyfile.dylib (138) <9D7C6151-FFF2-38CF-B6C2-C884833D0293> /usr/lib/system/libcopyfile.dylib
    0x9f4f5000 - 0x9f55affb  libcorecrypto.dylib (442.20.2) <B1DE8BBE-5183-3E43-AEB4-6E3195BF35C9> /usr/lib/system/libcorecrypto.dylib
    0x9f55b000 - 0x9f589ff3  libdispatch.dylib (703.20.1) <2B6FB100-CB58-324C-A67A-F56B4CD19608> /usr/lib/system/libdispatch.dylib
    0x9f58a000 - 0x9f58fff7  libdyld.dylib (421.2) <D46EDC19-9A11-33D8-ACFB-BD763A4468D6> /usr/lib/system/libdyld.dylib
    0x9f590000 - 0x9f590fff  libkeymgr.dylib (28) <9A7B3C22-0970-3A06-895D-C134CC211912> /usr/lib/system/libkeymgr.dylib
    0x9f591000 - 0x9f59dff7  libkxld.dylib (3789.21.3) <77991504-FB23-382B-AE71-DB35A6A44190> /usr/lib/system/libkxld.dylib
    0x9f59e000 - 0x9f59efff  liblaunch.dylib (972.20.3) <A2EDB833-B4FD-30B9-8666-881E01E53525> /usr/lib/system/liblaunch.dylib
    0x9f59f000 - 0x9f5a5ff7  libmacho.dylib (894) <5037228C-2287-39A5-901B-B814165BF8C7> /usr/lib/system/libmacho.dylib
    0x9f5a6000 - 0x9f5a8fff  libquarantine.dylib (85) <124D6136-6AE2-3B82-8C64-72E5C086AA98> /usr/lib/system/libquarantine.dylib
    0x9f5a9000 - 0x9f5aafff  libremovefile.dylib (45) <1EA2C22E-9758-38EA-B4D3-C6965A550A8B> /usr/lib/system/libremovefile.dylib
    0x9f5ab000 - 0x9f5c2ff7  libsystem_asl.dylib (349.1.1) <44C54853-3B9D-3981-9142-5FDF50704026> /usr/lib/system/libsystem_asl.dylib
    0x9f5c3000 - 0x9f5c3fff  libsystem_blocks.dylib (67) <B0565013-F778-3E93-86F6-665F50B27407> /usr/lib/system/libsystem_blocks.dylib
    0x9f5c4000 - 0x9f652ff3  libsystem_c.dylib (1158.20.4) <1E9803D2-2281-3E99-8B8B-70FB78E55704> /usr/lib/system/libsystem_c.dylib
    0x9f653000 - 0x9f656fff  libsystem_configuration.dylib (888.20.5) <F344A164-29BB-3C13-A94A-CF724F5C6C82> /usr/lib/system/libsystem_configuration.dylib
    0x9f657000 - 0x9f65afff  libsystem_coreservices.dylib (41.2) <B4FB3596-FA48-378C-A526-A4426187DC2F> /usr/lib/system/libsystem_coreservices.dylib
    0x9f65b000 - 0x9f673ffb  libsystem_coretls.dylib (121.1.1) <9E33DD82-31E6-3BE5-8138-86C707F94E4E> /usr/lib/system/libsystem_coretls.dylib
    0x9f674000 - 0x9f67affb  libsystem_dnssd.dylib (765.20.4) <E5FF466F-C81C-3FA0-B6AF-2E9102765ADE> /usr/lib/system/libsystem_dnssd.dylib
    0x9f67b000 - 0x9f6a2fff  libsystem_info.dylib (503) <8011723E-DFE9-3F09-A3D0-F91D9E863161> /usr/lib/system/libsystem_info.dylib
    0x9f6a3000 - 0x9f6c4ff3  libsystem_kernel.dylib (3789.21.3) <36B7D02D-B10F-355E-9D93-908A4B0B2D44> /usr/lib/system/libsystem_kernel.dylib
    0x9f6c5000 - 0x9f711ffb  libsystem_m.dylib (3121.4) <2BF6D0BC-AA93-3235-9977-5325D503EE2D> /usr/lib/system/libsystem_m.dylib
    0x9f712000 - 0x9f72cffb  libsystem_malloc.dylib (116) <DC16F04A-B69F-37CF-9A4A-67A0EA47F708> /usr/lib/system/libsystem_malloc.dylib
    0x9f72d000 - 0x9f780ff7  libsystem_network.dylib (856.20.4) <27026857-922E-3139-B185-3671DE59CB95> /usr/lib/system/libsystem_network.dylib
    0x9f781000 - 0x9f78afff  libsystem_networkextension.dylib (563.20.3) <0B00396F-A654-321C-9676-85054C87F5E7> /usr/lib/system/libsystem_networkextension.dylib
    0x9f78b000 - 0x9f793ffb  libsystem_notify.dylib (165.20.1) <2D404EBE-D76E-3FF9-821B-23B39FF3B6F5> /usr/lib/system/libsystem_notify.dylib
    0x9f794000 - 0x9f79affb  libsystem_platform.dylib (126.1.2) <234070ED-9028-313F-B699-AE2CA1987565> /usr/lib/system/libsystem_platform.dylib
    0x9f79b000 - 0x9f7a4ffb  libsystem_pthread.dylib (218.20.1) <37FC34E5-18AC-3511-AB10-0AB318F68657> /usr/lib/system/libsystem_pthread.dylib
    0x9f7a5000 - 0x9f7a8ffb  libsystem_sandbox.dylib (592.21.2) <BDA94D67-7979-36E4-9340-34F50FED05EA> /usr/lib/system/libsystem_sandbox.dylib
    0x9f7a9000 - 0x9f7aafff  libsystem_secinit.dylib (24) <51B19A10-92C5-3CEF-9284-B25DF4E524EF> /usr/lib/system/libsystem_secinit.dylib
    0x9f7ab000 - 0x9f7b2ff7  libsystem_symptoms.dylib (532.1.1) <E648E07F-F6BB-3E90-A7B7-902848BD69E0> /usr/lib/system/libsystem_symptoms.dylib
    0x9f7b3000 - 0x9f7d3fff  libsystem_trace.dylib (518.20.8) <AFEA006E-04E7-3B00-B46B-44EABD555F33> /usr/lib/system/libsystem_trace.dylib
    0x9f7d4000 - 0x9f7daffb  libunwind.dylib (35.3) <BE4AABDB-D7E1-3EAD-8CCD-5495CD5A0AA9> /usr/lib/system/libunwind.dylib
    0x9f7db000 - 0x9f801fff  libxpc.dylib (972.20.3) <A7E60F60-E740-369D-AAF1-60AA074CAE51> /usr/lib/system/libxpc.dylib
    
    External Modification Summary:
      Calls made by other processes targeting this process:
        task_for_pid: 0
        thread_create: 0
        thread_set_state: 0
      Calls made by this process:
        task_for_pid: 0
        thread_create: 0
        thread_set_state: 0
      Calls made by all processes on this machine:
        task_for_pid: 188823
        thread_create: 0
        thread_set_state: 0
    
    VM Region Summary:
    ReadOnly portion of Libraries: Total=206.3M resident=0K(0%) swapped_out_or_unallocated=206.3M(100%)
    Writable regions: Total=149.8M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=149.8M(100%)
    
    ```
                                VIRTUAL   REGION 
    ```
    
    REGION TYPE                        SIZE    COUNT (non-coalesced) 
    ===========                     =======  ======= 
    Accelerate framework               256K        3 
    Activity Tracing                   256K        2 
    CG backing stores                 4716K        4 
    CG image                            76K        7 
    CoreAnimation                      144K       13 
    CoreUI image data                 1672K       13 
    CoreUI image file                  156K        4 
    Kernel Alloc Once                    8K        2 
    MALLOC                           111.6M       44 
    MALLOC guard page                   48K       11 
    Memory Tag 242                      12K        2 
    OpenGL GLSL                        128K        3 
    Stack                             12.0M       10 
    Stack Guard                       56.0M       10 
    VM_ALLOCATE                       3412K       26 
    __DATA                            10.3M      225 
    __GLSLBUILTINS                    2588K        2 
    __IMAGE                            528K        2 
    __IMPORT                             8K        3 
    __LINKEDIT                        51.4M        9 
    __OBJC                            3020K       82 
    __TEXT                           154.9M      231 
    __UNICODE                          556K        2 
    mapped file                      247.5M       81 
    shared memory                     16.3M       10 
    ===========                     =======  ======= 
    TOTAL                            677.3M      776 
    
    Model: MacBookPro11,5, BootROM MBP114.0172.B09, 4 processors, Intel Core i7, 2.5 GHz, 16 GB, SMC 2.30f2
    Graphics: AMD Radeon R9 M370X, AMD Radeon R9 M370X, PCIe, 2048 MB
    Graphics: Intel Iris Pro, Intel Iris Pro, Built-In
    Memory Module: BANK 0/DIMM0, 8 GB, DDR3, 1600 MHz, 0x80AD, 0x484D54343147533642465238412D50422020
    Memory Module: BANK 1/DIMM0, 8 GB, DDR3, 1600 MHz, 0x80AD, 0x484D54343147533642465238412D50422020
    AirPort: spairport_wireless_card_type_airport_extreme (0x14E4, 0x152), Broadcom BCM43xx 1.0 (7.21.171.47.1a8)
    Bluetooth: Version 5.0.1f7, 3 services, 27 devices, 1 incoming serial ports
    Serial ATA Device: APPLE SSD SM0512G, 500.28 GB
    USB Device: USB 3.0 Bus
    USB Device: Apple Internal Keyboard / Trackpad
    USB Device: Bluetooth USB Host Controller
    Thunderbolt Bus: MacBook Pro, Apple Inc., 27.1

--------------------------------------------------------------------------------

On 2016-11-11T02:41:51Z, JenniferLee520, commented:
<https://github.com/red/red/issues/2312#issuecomment-259867032>

    red>> do %snow.red
    2016-11-11 10:37:37.602 console[19267:1678076] -[_CUIThemeFacetCacheKey mouseExited:]: unrecognized selector sent to instance 0x418ba0
    2016-11-11 10:37:37.603 console[19267:1678076] **\* Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[_CUIThemeFacetCacheKey mouseExited:]: unrecognized selector sent to instance 0x418ba0'
    **\* Call stack at first throw:
    (
        0   CoreFoundation                      0x9468312b __raiseError + 187
        1   libobjc.A.dylib                     0x9ed3d6e6 objc_exception_throw + 273
        2   CoreFoundation                      0x94686fcc -[NSObject(NSObject) doesNotRecognizeSelector:] + 172
        3   CoreFoundation                      0x9456a745 ___forwarding___ + 1013
        4   CoreFoundation                      0x9456a32e _CF_forwarding_prep_0 + 14
        5   console                             0x000479b7 console + 289207
    )
    Trace/BPT trap: 5
    logout
    Saving session...
    ...copying shared history...
    ...saving history...truncating history files...
    ...completed.

--------------------------------------------------------------------------------

On 2016-11-11T13:00:03Z, JenniferLee520, commented:
<https://github.com/red/red/issues/2312#issuecomment-259952300>

    Confirmed fixed in the latest commit. This issue can be closed now.

