
#4103: [R/S] weird double conversions
================================================================================
Issue is closed, was reported by hiiamboris and has 10 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/4103>

**Describe the bug**

Double type conversions produce unexplainable results:
```
Red []
#system [
	p: as cell! 00100000h
	print-line ["p="p " p+1="p + 1]
	print-line ["(as byte-ptr! (as-integer p))=" (as byte-ptr! (as-integer p))]
	print-line ["(as byte-ptr! (as-integer (p + 1)))=" (as byte-ptr! (as-integer (p + 1)))]
	p: p + 1
	print-line ["p + 1 = " p]
	i: as-integer p
	print-line ["as-integer p + 1 = " i]
	b: as byte-ptr! i
	print-line ["as byte-ptr! as-integer p + 1 = " b]
]
```
Output:
```
p=00100000 p+1=00100010                     
(as byte-ptr! (as-integer p))=00100000      
(as byte-ptr! (as-integer (p + 1)))=0040E40A              ;) should be 00100010
p + 1 = 00100010                            
as-integer p + 1 = 1048592                  
as byte-ptr! as-integer p + 1 = 00100010    
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 18-Oct-2019/15:33:41+03:00 commit #ed913ef
```



Comments:
--------------------------------------------------------------------------------

On 2019-10-23T15:35:53Z, qtxie, commented:
<https://github.com/red/red/issues/4103#issuecomment-545503717>

    I think the compiler doesn't support it.

--------------------------------------------------------------------------------

On 2019-10-24T08:20:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/4103#issuecomment-545803988>

    Pity. It would've been helpful in macros, to silence compiler warnings that conversion from byte-ptr to byte-ptr is not necessary.
    A workaround for now is: `as byte-ptr! 0 + as-integer p + 1`

--------------------------------------------------------------------------------

On 2019-11-01T14:44:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/4103#issuecomment-548814081>

    Looks like it's been there for 7 years https://github.com/red/Red/issues/142
    Not sure if it was bugged like now or just not allowed

--------------------------------------------------------------------------------

On 2020-04-29T23:18:07Z, dockimbel, commented:
<https://github.com/red/red/issues/4103#issuecomment-621518812>

    After the fix for #4414, I get:
    ```
    p=00100000 p+1=00100010
    (as byte-ptr! (as-integer p))=00100000
    (as byte-ptr! (as-integer (p + 1)))=00100010
    p + 1 = 00100010
    as-integer p + 1 = 1048592
    as byte-ptr! as-integer p + 1 = 00100010
    ```
    
    So we can consider this wish granted, at least for pointer type castings.

--------------------------------------------------------------------------------

On 2020-07-09T18:31:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/4103#issuecomment-656284104>

    Original snippet and `pointer-test.reds` are both working for me in recent builds.

