
#4220: [R/S] Crash involving a struct declared by value
================================================================================
Issue is closed, was reported by hiiamboris and has 18 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/4220>

**Describe the bug**

I can't figure out why it crashes on seemingly valid code

**To reproduce**

Test script `bug2.red`:
```
Red [needs: 'view]

#system [
	#define PixelFormat32bppARGB		2498570   ;-- [10 or (32 << 8) or PixelFormatAlpha or PixelFormatGDI or PixelFormatCanonical]
	#import [
		"gdiplus.dll" stdcall [
			GdipCreateBitmapFromScan0: "GdipCreateBitmapFromScan0" [
				width		[integer!]
				height		[integer!]
				stride		[integer!]
				format		[integer!]
				scan0		[byte-ptr!]
				bitmap		[int-ptr!]
				return:		[integer!]
			]
		]
	]
]

makeimg1: routine [
	return: [image!]
	/local img [red-image!] gpimg [integer!]
][
	gpimg: 0
	GdipCreateBitmapFromScan0 100 100 0 PixelFormat32bppARGB null :gpimg
	img: as red-image! stack/push*
	img: image/init-image img as handle! gpimg
	as red-image! stack/set-last as cell! img
]

makeimg2: routine [
	return: [image!]
	/local img [red-image! value] gpimg [integer!]
][
	gpimg: 0
	GdipCreateBitmapFromScan0 100 100 0 PixelFormat32bppARGB null :gpimg
	img: as red-image! stack/push*
	img: image/init-image img as handle! gpimg
	as red-image! stack/set-last as cell! img
]

makeimg3: routine [
	return: [image!]
	/local img [red-image! value] gpimg [integer!]
][
	gpimg: 0
	GdipCreateBitmapFromScan0 100 100 0 PixelFormat32bppARGB null :gpimg
	img: as red-image! stack/push*
	img/head: 0
	img/size: (OS-image/height? as handle! gpimg) << 16 or OS-image/width? as handle! gpimg
	img/node: as handle! gpimg
	img/header: TYPE_IMAGE
	as red-image! stack/set-last as cell! img
]

; probe makeimg1
probe makeimg2
; probe makeimg3
```

**Last 3 lines** call different versions of the same function. **Uncomment them one by one and compile with `red -r -d`**
- makeimg1 and makeimg3 work fine - output the image data
- makeimg2 crashes:
```
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-view-test/datatypes/string.reds
*** at line: 1063
***
***   stack: red/string/concatenate-literal-part 02A7FF34h 00000000h 1
***   stack: red/datatype/mold 02D479B0h 02A7FF34h false false true 00000000h 0 0
***   stack: red/actions/mold 02D479B0h 02A7FF34h false false true 00000000h 0 0
***   stack: red/error/reduce 02A7FF14h 02A7FEF4h
***   stack: red/error/form 02A7FEF4h 02A7FF04h 02A7FEE4h -18
***   stack: red/actions/form 02A7FEF4h 02A7FF04h 02A7FEE4h 0
***   stack: red/actions/form* -1
***   stack: red/natives/do-print false true
***   stack: red/natives/print* false
***   stack: red/stack/throw-error 02A7FF24h
***   stack: red/fire 1 0018FF10h
***   stack: red/type-check 02A6DF84h 0 02A7FEF4h
***   stack: probe
```

The only difference between `makeimg1` and `makeimg2` is in `red-image!` and `red-image! value` (the initial value allocated in the stack segment is unused anyway)

The difference between `makeimg2` and `makeimg3` is that latter inlines `image/init-image`, while former calls it. See the source:
https://github.com/red/red/blob/d37b63f83e978e9151315f4895ef1c16ebf7a000/runtime/datatypes/image.reds#L95-L101

**Expected behavior**

Shouldn't crash.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 20-Dec-2019/19:03:46+03:00 commit #544a6e1
```



Comments:
--------------------------------------------------------------------------------

On 2020-01-08T11:39:52Z, qtxie, commented:
<https://github.com/red/red/issues/4220#issuecomment-572012029>

    ```
    img: image/init-image img as handle! gpimg
    ```
    Assigns a pointer to a struct is invalid. I think the compiler should prompt an error. 

--------------------------------------------------------------------------------

On 2020-01-08T14:52:46Z, hiiamboris, commented:
<https://github.com/red/red/issues/4220#issuecomment-572104592>

    I sort of expect it to stop pointing to stack and start pointing to the new location, just as an ordinary pointer.
    
    You're right, without assignment it's working:
    ```
    makeimg2: routine [                                                            
        return: [image!]                                                           
        /local img [red-image! value] gpimg [integer!]                             
    ][                                                                             
        gpimg: 0                                                                   
        GdipCreateBitmapFromScan0 100 100 0 PixelFormat32bppARGB null :gpimg       
        as red-image! stack/set-last as cell! image/init-image img as handle! gpimg
    ]                                                                              
    ```

--------------------------------------------------------------------------------

On 2022-09-05T11:33:05Z, dockimbel, commented:
<https://github.com/red/red/issues/4220#issuecomment-1236880304>

    Added an error checking for this case.

--------------------------------------------------------------------------------

On 2022-09-05T14:55:45Z, dockimbel, commented:
<https://github.com/red/red/issues/4220#issuecomment-1237165769>

    > I sort of expect it to stop pointing to stack and start pointing to the new location, just as an ordinary pointer.
    
    A  `[struct! [...] value]` is not a pointer, it's a struct value. The semantics are partly different from a struct pointer. Assignment means that the argument value replaces the original value, but the memory location remains the same. So, my fix is wrong there.

--------------------------------------------------------------------------------

On 2022-09-05T15:02:44Z, hiiamboris, commented:
<https://github.com/red/red/issues/4220#issuecomment-1237175194>

    Now that I think of it, there's no place reserved in the stack for the pointer, so it must be a constant value defined at compile time. Will assignment copy the whole structure then?

--------------------------------------------------------------------------------

On 2022-09-05T15:08:21Z, dockimbel, commented:
<https://github.com/red/red/issues/4220#issuecomment-1237182693>

    Yes, it should copy the whole structure and pass it also by value on stack when used as an argument.

--------------------------------------------------------------------------------

On 2022-09-05T15:13:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/4220#issuecomment-1237189257>

    Don't forget to document it ;) An important detail.

--------------------------------------------------------------------------------

On 2022-09-05T15:21:54Z, dockimbel, commented:
<https://github.com/red/red/issues/4220#issuecomment-1237200568>

    Explanations about passing struct by value are present in the R/S documentation, but spread over different sections. It might need some extra descriptions though.

--------------------------------------------------------------------------------

On 2022-09-05T15:31:30Z, hiiamboris, commented:
<https://github.com/red/red/issues/4220#issuecomment-1237213220>

    I mean explicitly stating that:
    - struct addressed by value is a constant compile time pointer
    - assignment of a pointer to a struct addressed by value involves copying data from the pointed location to the location of the struct
    
    Otherwise it's left to reader's guessing.

