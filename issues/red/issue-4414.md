
#4414: [R/S] round-trip pointer casting returns an incorrect result in some cases
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4414>

**Describe the bug**

Byte pointer casted to integer pointer and back points at an incorrect address.

**To reproduce**

The result is expected if pointer is held by a variable:
```red
Red []

foo: routine [value [binary!] /local head [byte-ptr!]][
	head: binary/rs-head value
	probe head
	probe as byte-ptr! head ; ignore compiler's warning
	probe as byte-ptr! as int-ptr! head
]

foo #{DEADBEEF}
```
```assembly
02F1B798
02F1B798
02F1B798
```

But if expressions are inlined instead:
```red
Red []

foo: routine [value [binary!]][
	probe binary/rs-head value
	probe as byte-ptr! binary/rs-head value
	probe as byte-ptr! as int-ptr! binary/rs-head value
]

foo #{DEADBEEF}
```
```assembly
02D4B870
02D4B870
004B920A ; ←
```

**Expected behavior**
Either all addresses should be identical, or such pointer casting should be blocked by the compiler.

**Platform version**

W10, `master` 1dcba29a6f9515c255b1679a13a1bcc23a7d61e4 and `fast-lexer` c69e1cabd40c5e7c764d7ba284416a9e8e693bce.



Comments:
--------------------------------------------------------------------------------

On 2020-04-27T13:40:36Z, hiiamboris, commented:
<https://github.com/red/red/issues/4414#issuecomment-619993329>

    https://github.com/red/red/issues/4103

