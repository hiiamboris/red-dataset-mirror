Red/System [
	Title:	"Windows User32.dll imports"
	File: 	%user32.reds
	Tabs: 	4
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#import [
"User32.dll" stdcall [
		SystemParametersInfo: "SystemParametersInfoW" [
			action		[integer!]
			iParam		[integer!]
			vParam		[int-ptr!]
			winini		[integer!]
			return:		[logic!]
		]
		GetForegroundWindow: "GetForegroundWindow" [
			return:		[handle!]
		]
		IsWindowVisible: "IsWindowVisible" [
			hWnd		[handle!]
			return:		[logic!]
		]
		SetTimer: "SetTimer" [
			hWnd		[handle!]
			nIDEvent	[integer!]
			uElapse		[integer!]
			lpTimerFunc [timer-cb!]
			return:		[int-ptr!]
		]
		KillTimer: "KillTimer" [
			hWnd		[handle!]
			uIDEvent	[int-ptr!]
			return:		[logic!]
		]
		OpenClipboard: "OpenClipboard" [
			hWnd		[handle!]
			return:		[logic!]
		]
		SetClipboardData: "SetClipboardData" [
			uFormat		[integer!]
			hMem		[handle!]
			return:		[handle!]
		]
		GetClipboardData: "GetClipboardData" [
			uFormat		[integer!]
			return:		[handle!]
		]
		EmptyClipboard: "EmptyClipboard" [
			return:		[integer!]
		]
		CloseClipboard: "CloseClipboard" [
			return:		[integer!]
		]
		IsClipboardFormatAvailable: "IsClipboardFormatAvailable" [
			format		[integer!]
			return:		[logic!]
		]
		GetKeyState: "GetKeyState" [
			nVirtKey	[integer!]
			return:		[integer!]
		]
		SetActiveWindow: "SetActiveWindow" [
			hWnd		[handle!]
			return:		[handle!]
		]
		SetForegroundWindow: "SetForegroundWindow" [
			hWnd		[handle!]
			return:		[logic!]
		]
		SetWindowRgn: "SetWindowRgn" [
			hWnd		[handle!]
			hRgn		[handle!]
			redraw		[logic!]
			return:		[integer!]
		]
		SetFocus: "SetFocus" [
			hWnd		[handle!]
			return:		[handle!]
		]
		SetCapture: "SetCapture" [
			hWnd		[handle!]
			return:		[handle!]
		]
		ReleaseCapture: "ReleaseCapture" [
			return:		[logic!]
		]
		SetLayeredWindowAttributes: "SetLayeredWindowAttributes" [
			hWnd		[handle!]
			crKey		[integer!]
			bAlpha		[integer!]
			dwFlags		[integer!]
			return:		[integer!]
		]
		UpdateLayeredWindow: "UpdateLayeredWindow" [
			hwnd		[handle!]
			hdcDst		[handle!]
			pptDst		[tagPOINT]
			psize		[tagSIZE]
			hdcSrc		[handle!]
			pptSrc		[tagPOINT]
			crKey		[integer!]
			pblend		[integer!]
			dwFlags		[integer!]
			return:		[logic!]
		]
		GetWindowThreadProcessId: "GetWindowThreadProcessId" [
			hWnd		[handle!]
			process-id	[int-ptr!]
			return:		[integer!]
		]
		DrawText: "DrawTextW" [
			hDC			[handle!]
			lpchText	[c-string!]
			nCount		[integer!]
			lpRect		[RECT_STRUCT]
			uFormat		[integer!]
			return:		[integer!]
		]
		GetDC: "GetDC" [
			hWnd		[handle!]
			return:		[handle!]
		]
		ReleaseDC: "ReleaseDC" [
			hWnd		[handle!]
			hDC			[handle!]
			return:		[integer!]
		]
		BeginPaint: "BeginPaint" [
			hWnd		[handle!]
			ps			[tagPAINTSTRUCT]
			return:		[handle!]
		]
		EndPaint: "EndPaint" [
			hWnd		[handle!]
			ps			[tagPAINTSTRUCT]
			return:		[integer!]
		]
		MapWindowPoints: "MapWindowPoints" [
			hWndFrom	[handle!]
			hWndTo		[handle!]
			lpPoints	[tagPOINT]
			cPoint		[integer!]
			return:		[integer!]
		]
		MapVirtualKey: "MapVirtualKeyW" [
			uCode		[integer!]
			uMapType	[integer!]
			return:		[integer!]
		]
		ToUnicode: "ToUnicode" [
			wVirtKey	[integer!]
			wScanCode	[integer!]
			lpKeyState	[byte-ptr!]
			pwszBuff	[c-string!]
			cchBuff		[integer!]
			wFlags		[integer!]
			return:		[integer!]
		]
		GetKeyboardState: "GetKeyboardState" [
			lpKeyState	[byte-ptr!]
			return:		[logic!]
		]
		GetSysColorBrush: "GetSysColorBrush" [
			index		[integer!]
			return:		[handle!]
		]
		EnumDisplayDevices: "EnumDisplayDevicesW" [
			lpDevice 	[c-string!]
			iDevNum		[integer!]
			lpDispDev	[DISPLAY_DEVICE]
			dwFlags		[integer!]
			return:		[integer!]
		]
		RegisterClassEx: "RegisterClassExW" [
			lpwcx		[WNDCLASSEX]
			return: 	[integer!]
		]
		UnregisterClass: "UnregisterClassW" [
			lpClassName	[c-string!]
			hInstance	[handle!]
			return:		[integer!]
		]
		LoadCursor: "LoadCursorW" [
			hInstance	 [handle!]
			lpCursorName [integer!]
			return: 	 [handle!]
		]
		CreateWindowEx: "CreateWindowExW" [
			dwExStyle	 [integer!]
			lpClassName	 [c-string!]
			lpWindowName [c-string!]
			dwStyle		 [integer!]
			x			 [integer!]
			y			 [integer!]
			nWidth		 [integer!]
			nHeight		 [integer!]
			hWndParent	 [handle!]
			hMenu	 	 [handle!]
			hInstance	 [handle!]
			lpParam		 [int-ptr!]
			return:		 [handle!]
		]
		SetScrollInfo:	"SetScrollInfo" [
			hWnd		 [handle!]
			fnBar		 [integer!]
			lpsi		 [SCROLLINFO]
			fRedraw		 [logic!]
			return: 	 [integer!]
		]
		GetScrollInfo: "GetScrollInfo" [
			hWnd		[handle!]
			nBar		[integer!]
			lpsi		[tagSCROLLINFO]
			return:		[integer!]
		]
		ShowScrollBar: "ShowScrollBar" [
			hWnd		[handle!]
			wBar		[integer!]
			bShow		[logic!]
			return:		[logic!]
		]
		ShowWindow: "ShowWindow" [
			hWnd		[handle!]
			nCmdShow	[integer!]
			return:		[logic!]
		]
		UpdateWindow: "UpdateWindow" [
			hWnd		[handle!]
			return:		[logic!]
		]
		EnableWindow: "EnableWindow" [
			hWnd		[handle!]
			bEnable		[logic!]
			return:		[logic!]
		]
		InvalidateRect: "InvalidateRect" [
			hWnd		[handle!]
			lpRect		[RECT_STRUCT]
			bErase		[integer!]
			return:		[integer!]
		]
		ValidateRect: "ValidateRect" [
			hWnd		[handle!]
			lpRect		[RECT_STRUCT]
			return:		[logic!]
		]
		GetParent: "GetParent" [
			hWnd 		[handle!]
			return:		[handle!]
		]
		GetAncestor: "GetAncestor" [
			hWnd 		[handle!]
			gaFlags		[integer!]
			return:		[handle!]
		]
		GetWindow: "GetWindow" [
			hWnd 		[handle!]
			uCmd		[integer!]
			return:		[handle!]
		]
		WindowFromPoint: "WindowFromPoint" [
			x			[integer!]
			y			[integer!]
			return:		[handle!]
		]
		RealChildWindowFromPoint: "RealChildWindowFromPoint" [
			hwndParent	[handle!]
			x			[integer!]
			y			[integer!]
			return:		[handle!]
		]
		ChildWindowFromPointEx: "ChildWindowFromPointEx" [
			hwndParent	[handle!]
			x			[integer!]
			y			[integer!]
			flags		[integer!]
			return:		[handle!]
		]
		DefWindowProc: "DefWindowProcW" [
			hWnd		[handle!]
			msg			[integer!]
			wParam		[integer!]
			lParam		[integer!]
			return: 	[integer!]
		]
		CallWindowProc: "CallWindowProcW" [
			lpfnWndProc	[wndproc-cb!]
			hWnd		[handle!]
			msg			[integer!]
			wParam		[integer!]
			lParam		[integer!]
			return: 	[integer!]
		]
		GetMessage: "GetMessageW" [
			msg			[tagMSG]
			hWnd		[handle!]
			wParam		[integer!]
			lParam		[integer!]
			return: 	[integer!]
		]
		PeekMessage: "PeekMessageW" [
			msg			[tagMSG]
			hWnd		[handle!]
			msgMin		[integer!]
			msgMax		[integer!]
			removeMsg	[integer!]
			return: 	[integer!]
		]
		TranslateMessage: "TranslateMessage" [
			msg			[tagMSG]
			return: 	[logic!]
		]
		DispatchMessage: "DispatchMessageW" [
			msg			[tagMSG]
			return: 	[integer!]
		]
		PostQuitMessage: "PostQuitMessage" [
			nExitCode	[integer!]
		]
		SendMessage: "SendMessageW" [
			hWnd		[handle!]
			msg			[integer!]
			wParam		[integer!]
			lParam		[integer!]
			return: 	[handle!]
		]
		PostMessage: "PostMessageW" [
			hWnd		[handle!]
			msg			[integer!]
			wParam		[integer!]
			lParam		[integer!]
			return: 	[handle!]
		]
		GetMessagePos: "GetMessagePos" [
			return:		[integer!]
		]
		SetWindowLong: "SetWindowLongW" [
			hWnd		[handle!]
			nIndex		[integer!]
			dwNewLong	[integer!]
			return: 	[integer!]
		]
		GetWindowLong: "GetWindowLongW" [
			hWnd		[handle!]
			nIndex		[integer!]
			return: 	[integer!]
		]
		GetClassInfoEx: "GetClassInfoExW" [
			hInst		[handle!]
			lpszClass	[c-string!]
			lpwcx		[WNDCLASSEX]					;-- pass a WNDCLASSEX pointer's pointer
			return: 	[integer!]
		]
		GetWindowRect: "GetWindowRect" [
			hWnd		[handle!]
			lpRect		[RECT_STRUCT]
			return:		[integer!]
		]
		GetClientRect: "GetClientRect" [
			hWnd		[handle!]
			lpRect		[RECT_STRUCT]
			return:		[integer!]
		]
		FillRect: "FillRect" [
			hDC			[handle!]
			lprc		[RECT_STRUCT]
			hbr			[handle!]
			return:		[integer!]
		]
		AdjustWindowRectEx: "AdjustWindowRectEx" [
			lpRect		[RECT_STRUCT]
			dwStyle		[integer!]
			bMenu		[logic!]
			dwExStyle	[integer!]
			return:		[logic!]
		]
		BringWindowToTop: "BringWindowToTop" [
			hWnd		[handle!]
			return:		[logic!]
		]
		BeginDeferWindowPos: "BeginDeferWindowPos" [
			nNumWindows [integer!]
			return:		[handle!]
		]
		EndDeferWindowPos: "EndDeferWindowPos" [
			hWinPosInfo [handle!]
			return:		[logic!]
		]
		DeferWindowPos: "DeferWindowPos" [
			hWinPosInfo [handle!]
			hWnd		[handle!]
			hWndAfter	[handle!]
			x			[integer!]
			y			[integer!]
			cx			[integer!]
			cy			[integer!]
			uFlags		[integer!]
			return:		[handle!]
		]
		SetWindowPos: "SetWindowPos" [
			hWnd		[handle!]
			hWndAfter	[handle!]
			x			[integer!]
			y			[integer!]
			cx			[integer!]
			cy			[integer!]
			uFlags		[integer!]
			return:		[integer!]
		]
		SetWindowText: "SetWindowTextW" [
			hWnd		[handle!]
			lpString	[c-string!]
		]
		GetWindowText: "GetWindowTextW" [
			hWnd		[handle!]
			lpString	[c-string!]
			nMaxCount	[integer!]
			return:		[integer!]
		]
		GetWindowTextLength: "GetWindowTextLengthW" [
			hWnd		[handle!]
			return:		[integer!]
		]
		CreateMenu: "CreateMenu" [
			return:		[handle!]
		]
		CreatePopupMenu: "CreatePopupMenu" [
			return:		[handle!]
		]
		AppendMenu: "AppendMenuW" [
			hMenu		[handle!]
			uFlags		[integer!]
			uIDNewItem	[integer!]
			lpNewItem	[c-string!]
			return:		[logic!]
		]
		InsertMenuItem: "InsertMenuItemW" [
			hMenu		[handle!]
			uItem		[integer!]
			byPosition	[logic!]
			lpmii		[MENUITEMINFO]
			return:		[logic!]
		]
		GetMenuItemInfo: "GetMenuItemInfoW" [
			hMenu		[handle!]
			uItem		[integer!]
			byPosition	[logic!]
			lpmii		[MENUITEMINFO]
			return:		[logic!]
		]
		TrackPopupMenuEx: "TrackPopupMenuEx" [
			hMenu		[handle!]
			fuFlags		[integer!]
			x			[integer!]
			y			[integer!]
			hWnd		[handle!]
			lptpm		[byte-ptr!]						;-- null (LPTPMPARAMS)
			return:		[integer!]
		]
		ClientToScreen: "ClientToScreen" [
			hWnd		[handle!]
			lpPoint		[tagPOINT]
			return:		[logic!]
		]
		ScreenToClient: "ScreenToClient" [
			hWnd		[handle!]
			lpPoint		[tagPOINT]
			return:		[logic!]
		]
		SetParent: "SetParent" [
			hChild		[handle!]
			hNewParent	[handle!]
			return:		[handle!]						;-- old parent
		]
		DestroyMenu: "DestroyMenu" [
			hMenu		[handle!]
			return:		[logic!]
		]
		SetMenu: "SetMenu" [
			hWnd		[handle!]
			hMenu		[handle!]
			return:		[logic!]
		]
		GetMenu: "GetMenu" [
			hWnd		[handle!]
			return:		[handle!]
		]
		DestroyWindow: "DestroyWindow" [
			hWnd		[handle!]
			return:		[logic!]
		]
		LoadIcon: "LoadIconW" [
			hInstance	[handle!]
			lpIconName	[c-string!]
			return:		[handle!]
		]
		GetAsyncKeyState: "GetAsyncKeyState" [
			nVirtKey	[integer!]
			return:		[integer!]						;-- returns a 16-bit value
		]
		GetCapture: "GetCapture" [
			return:		[handle!]
		]
		GetTabbedTextExtent: "GetTabbedTextExtentW" [
			hdc			[handle!]
			lpString	[c-string!]
			len			[integer!]
			nTabPos		[integer!]
			lpnTabStop	[int-ptr!]
			return:		[integer!]
		]
		CreateCaret: "CreateCaret" [
			hWnd		[handle!]
			bitmap		[handle!]
			width		[integer!]
			height		[integer!]
			return:		[integer!]
		]
		DestroyCaret: "DestroyCaret" [
			return:		[integer!]
		]
		HideCaret: "HideCaret" [
			hWnd		[handle!]
			return:		[integer!]
		]
		ShowCaret: "ShowCaret" [
			hWnd		[handle!]
			return:		[integer!]
		]
		SetCaretPos: "SetCaretPos" [
			x			[integer!]
			y			[integer!]
			return:		[integer!]
		]
	]
]