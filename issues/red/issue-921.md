
#921: Misleading comments on shift operators
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.resolved] [type.review] [Red/System]
<https://github.com/red/red/issues/921>

“left” and “right” seem to be the wrong way around in the comments in `system/compiler.r`:

```
>>  [2  op  - [a [number!] b [number!] return: [number!]]]  ;-- shift left signed
<<  [2  op  - [a [number!] b [number!] return: [number!]]]  ;-- shift right signed
```

Should be:

```
>>  [2  op  - [a [number!] b [number!] return: [number!]]]  ;-- shift right signed
<<  [2  op  - [a [number!] b [number!] return: [number!]]]  ;-- shift left signed
```

Sorry if this is a duplicate, since I see iArnold has already pointed it out here:
https://groups.google.com/forum/#!msg/red-lang/-3miUP-OpeE/ANFL982j9pEJ



Comments:
--------------------------------------------------------------------------------

On 2014-09-10T13:39:20Z, dockimbel, commented:
<https://github.com/red/red/issues/921#issuecomment-55115879>

    Good catch, thanks for opening a ticket for that. The ML is great for exchanging, but not for tracking issues that require fixing.

