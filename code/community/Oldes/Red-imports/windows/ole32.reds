Red/System [
	Title:	"Windows Ole32.dll imports"
	File: 	%ole32.reds
	Tabs: 	4
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#import [
	"ole32.dll" stdcall [
		CoInitializeEx: "CoInitializeEx" [
			reserved	[integer!]
			dwCoInit	[integer!]
			return:		[integer!]
		]
		CoUninitialize: "CoUninitialize" []
		CoCreateInstance: "CoCreateInstance" [
			rclsid		 [int-ptr!]
			pUnkOuter	 [integer!]
			dwClsContext [integer!]
			riid		 [int-ptr!]
			ppv			 [interface!]
			return:		 [integer!]
		]
		CoGetClassObject: "CoGetClassObject" [
			rclsid		 [int-ptr!]
			dwClsContext [integer!]
			pServerInfo  [int-ptr!]
			riid		 [int-ptr!]
			ppv			 [interface!]
			return:		 [integer!]
		]
		OleInitialize: "OleInitialize" [
			pvReserved [int-ptr!]
			return:  [integer!]
		]
		OleUninitialize: "OleUninitialize" [
			return: [integer!]
		]
		OleSetContainedObject: "OleSetContainedObject" [
			pUnknown   [this!]
			fContained [logic!]
			return:    [integer!]
		]
	]
]