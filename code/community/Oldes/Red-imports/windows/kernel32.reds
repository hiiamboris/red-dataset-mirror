Red/System [
	Title:	"Windows Kernel32.dll imports"
	File: 	%kernel32.reds
	Tabs: 	4
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

SMALL_RECT!: alias struct! [
	left-top     [integer!]
	bottom-right [integer!]
]

CONSOLE_SCREEN_BUFFER_INFO!: alias struct! [
  dwSize              [integer!] ;COORD
  dwCursorPosition    [integer!] ;COORD
  wAttributes         [integer!] ;WORD
  srWindow            [SMALL_RECT!]
  dwMaximumWindowSize [integer!]
]

#import [
	"kernel32.dll" stdcall [
		GlobalAlloc: "GlobalAlloc" [
			flags		[integer!]
			size		[integer!]
			return:		[handle!]
		]
		GlobalFree: "GlobalFree" [
			hMem		[handle!]
			return:		[integer!]
		]
		GlobalLock: "GlobalLock" [
			hMem		[handle!]
			return:		[byte-ptr!]
		]
		GlobalUnlock: "GlobalUnlock" [
			hMem		[handle!]
			return:		[integer!]
		]
		GetCurrentProcessId: "GetCurrentProcessId" [
			return:		[integer!]
		]
		GetModuleHandle: "GetModuleHandleW" [
			lpModuleName [integer!]
			return:		 [handle!]
		]
		GetLastError: "GetLastError" [
			return: [integer!]
		]
		GetSystemDirectory: "GetSystemDirectoryW" [
			lpBuffer	[c-string!]
			uSize		[integer!]
			return:		[integer!]
		]
		LocalLock: "LocalLock" [
			hMem		[handle!]
			return:		[byte-ptr!]
		]
		LocalUnlock: "LocalUnlock" [
			hMem		[handle!]
			return:		[byte-ptr!]
		]
		LoadLibraryA: "LoadLibraryA" [
		;Loads the specified module into the address space of the calling process. The specified module may cause other modules to be loaded.
			lpFileName	[c-string!] ;The name of the module. 
			return:		[handle!]   ;If the function succeeds, the return value is a handle to the module.
		]
		FreeLibrary: "FreeLibrary" [
			hModule		[handle!]
			return:		[logic!]
		]
		GetProcAddress: "GetProcAddress" [
		;Retrieves the address of an exported function or variable from the specified dynamic-link library (DLL).
			hModule		[handle!]   ;A handle to the DLL module that contains the function or variable.
			lpProcName	[c-string!] ;The function or variable name, or the function's ordinal value.
			return:		[integer!]  ;If the function succeeds, the return value is the address of the exported function or variable.
		]
		lstrlen: "lstrlenW" [
			str			[byte-ptr!]
			return:		[integer!]
		]
		GetConsoleScreenBufferInfo: "GetConsoleScreenBufferInfo" [
			hConsoleOutput [handle!]
			lpConsoleScreenBufferInfo [CONSOLE_SCREEN_BUFFER_INFO!]
		]
	]
]