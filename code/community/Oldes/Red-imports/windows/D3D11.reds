Red/System [
	Title:	"Windows D3D11.dll imports"
	File: 	%D3D11.reds
	Tabs: 	4
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#define D3D_DRIVER_TYPE! integer!
#define D3D11_SDK_VERSION 7

#define  D3D_FEATURE_LEVEL_9_1   9100h
#define  D3D_FEATURE_LEVEL_9_2   9200h
#define  D3D_FEATURE_LEVEL_9_3   9300h
#define  D3D_FEATURE_LEVEL_10_0  A000h
#define  D3D_FEATURE_LEVEL_10_1  A100h
#define  D3D_FEATURE_LEVEL_11_0  B000h
#define  D3D_FEATURE_LEVEL_11_1  B100h
#define  D3D_FEATURE_LEVEL_12_0  C000h
#define  D3D_FEATURE_LEVEL_12_1  C100h

#define D3D11_CREATE_DEVICE_SINGLETHREADED                                 01h
#define D3D11_CREATE_DEVICE_DEBUG                                          02h
#define D3D11_CREATE_DEVICE_SWITCH_TO_REF                                  04h
#define D3D11_CREATE_DEVICE_PREVENT_INTERNAL_THREADING_OPTIMIZATIONS       08h
#define D3D11_CREATE_DEVICE_BGRA_SUPPORT                                   20h
#define D3D11_CREATE_DEVICE_DEBUGGABLE                                     40h
#define D3D11_CREATE_DEVICE_PREVENT_ALTERING_LAYER_SETTINGS_FROM_REGISTRY  80h
#define D3D11_CREATE_DEVICE_DISABLE_GPU_TIMEOUT                            0100h
#define D3D11_CREATE_DEVICE_VIDEO_SUPPORT                                  0800h

#define D3D_DRIVER_TYPE_HARDWARE 1

#import [
	"D3D11.dll" stdcall [
		D3D11CreateDevice: "D3D11CreateDevice" [
			pAdapter       [int-ptr!]
			DriverType     [D3D_DRIVER_TYPE!]
			Software       [handle!]    ;HMODULE
			Flags          [integer!]
			pFeatureLevels [int-ptr!]   ;const D3D_FEATURE_LEVEL
			FeatureLevels  [integer!]
			SDKVersion     [integer!]   ;always use D3D11_SDK_VERSION
			ppDevice       [interface!] ;ID3D11Device
			pFeatureLevel  [int-ptr!]   ;D3D_FEATURE_LEVEL
			ppImmediateContext [interface!] ;ID3D11DeviceContext
			return: [integer!]
		]
	]
]