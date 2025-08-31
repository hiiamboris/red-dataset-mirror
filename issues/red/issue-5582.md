
#5582: Error displaying series, while torturing GC
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 8 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/5582>

**Describe the bug**

While trying to torture the new Garbage Collector I have encountered this error.

**To reproduce**
```
Run this code:

Print (stats / 1024)
x: copy []
y: copy []
append/only x y
append/only y x
probe z: reduce [x y] 
probe dt [
	loop 100000 [
		append z/1/1/1 copy "hello"
		append z/2/1/1 copy "world"
		append z copy/deep z
		
	]
		
] 
Print (stats / 1024)
```

error:

```
2986.640625
[[[[...]]] [[[...]]]]
*** Internal Error: block or paren series is too deep to display
*** Where: copy
*** Near : append z copy/deep z
*** Stack: probe dt
```


**Platform version**
-----------RED & PLATFORM VERSION----------- 
;RED: [ branch: "master" tag: #v0.6.5 ahead: 374 date: 10-Jan-2025/11:17:29 commit: #68f6dd532a4cd9c53fa68656805bc59390a6ab42 ]
;PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]


Comments:
--------------------------------------------------------------------------------

On 2025-01-12T18:23:20Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5582#issuecomment-2585859154>

    Sorry, I forgot to write on gitter.im/red/bug before submitting.
    
    

--------------------------------------------------------------------------------

On 2025-01-12T18:37:41Z, dockimbel, commented:
<https://github.com/red/red/issues/5582#issuecomment-2585863863>

    Consequence of fixing #3318. The cycle detection is applied to `copy/deep` and the depth tracking buffer has limited size (1000), that's why you get a legit error when using extreme depths or cycles.

--------------------------------------------------------------------------------

On 2025-01-13T00:13:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/5582#issuecomment-2585980175>

    Depth of his block seems infinite to me at a glance :)
    The only error here that I see is the message. If it said "too deep to copy", not "too deep to display", I would agree :)

--------------------------------------------------------------------------------

On 2025-02-10T21:48:05Z, dockimbel, commented:
<https://github.com/red/red/issues/5582#issuecomment-2649317044>

    The message has been changed to a more generic: `"block or paren series is too deep to process"`.

