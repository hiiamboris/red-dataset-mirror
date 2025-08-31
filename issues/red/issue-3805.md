
#3805: [CRASH/ERROR] when reactor!/on-change* is overridden
================================================================================
Issue is closed, was reported by hiiamboris and has 10 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/3805>

**Describe the bug**

Here's a script that overrides reactor's on-change* func:
```
Red []

d: make reactor! [
	set-quiet 'on-change* func
		spec-of :reactor!/on-change*
		compose [
			print ["CHANGE:" word mold/flat/part :old 50 "->" mold/flat/part :new 50 lf]
			(bind copy/deep body-of :reactor!/on-change* self)
		]
	a: "123"
]

do probe [d/a: "456"]
do probe [append d/a "4"]
```
`[d/a: ...]` works okay, while a deep series change `[append d/a ...]` crashes it for some reason

Full output:
```
CHANGE: a unset -> "123"                                                                                
                                                                                                        
[d/a: "456"]                                                                                            
CHANGE: a "123" -> "456"                                                                                
                                                                                                        
[append d/a "4"]                                                                                        
                                                                                                        
*** Runtime Error 98: assertion failed                                                                  
*** in file: /D/devel/red/red-src/red/runtime/datatypes/object.reds                                     
*** at line: 445                                                                                        
***                                                                                                     
***   stack: red/object/fire-on-deep 00000062h 0044333Eh 02E01E28h 000000F1h 00000000h 48501692 50254903
***   stack: red/object/fire-on-deep 02E43704h 02E43714h 02D20394h 02D0D574h 02D203A4h 3 1              
***   stack: red/ownership/check 02D20394h 02D0D574h 02D203A4h 3 1                                      
***   stack: red/string/insert 02D20394h 02D203A4h 02D20384h false 02D20384h true                       
***   stack: red/actions/insert 02D20394h 02D203A4h 02D20384h false 02D20384h true                      
***   stack: red/actions/append* -1 -1 -1                                                               
***   stack: red/interpreter/eval-arguments 02E1FEE4h 02FED624h 02FED624h 00000000h 00000000h           
***   stack: red/interpreter/eval-code 02E1FEE4h 02FED604h 02FED624h false 00000000h 00000000h 02E1FEE4h
***   stack: red/interpreter/eval-expression 02FED604h 02FED624h false false false                      
***   stack: red/interpreter/eval 02D20374h true                                                        
***   stack: red/natives/do* false -1 -1 -1                                                             
***   stack: red/interpreter/eval-arguments 02E20414h 02FED560h 02FED560h 00000000h 00000000h           
***   stack: red/interpreter/eval-code 02E20414h 02FED540h 02FED560h false 00000000h 00000000h 02E20414h
***   stack: red/interpreter/eval-expression 02FED540h 02FED560h false false false                      
***   stack: red/interpreter/eval 02D20344h true                                                        
***   stack: red/natives/catch* true 1                                                                  
***   stack: ctx474~try-do 00A21C00h                                                                    
***   stack: ctx474~launch 00A21C00h                                                                    
```

**Expected behavior**

Should not crash or detect a deep change since it's not a deep reactor.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 5-Mar-2019/0:09:36+03:00 commit #53b5b37
```



Comments:
--------------------------------------------------------------------------------

On 2019-03-06T06:05:57Z, 9214, commented:
<https://github.com/red/red/issues/3805#issuecomment-469980873>

    https://github.com/red/red/issues/2919

--------------------------------------------------------------------------------

On 2019-08-18T20:55:10Z, hiiamboris, commented:
<https://github.com/red/red/issues/3805#issuecomment-522354642>

    It doesn't crash on the latest August 18 build. However it does not look to me like a complete fix:
    ```
    >> do probe [append d/a "4"]
    [append d/a "4"]
    *** Script Error: invalid object event handler: make object! [a: "4564"]
    *** Where: append
    *** Stack: 
    ```
    As it's not a deep reactor, it should not display any errors. Moreover, the error hints at some error in reactivity.

--------------------------------------------------------------------------------

On 2020-04-06T17:30:01Z, greggirwin, commented:
<https://github.com/red/red/issues/3805#issuecomment-609931764>

    @hiiamboris should your last note lead to a new ticket, and this one can be close for the original problem?

--------------------------------------------------------------------------------

On 2020-04-06T17:32:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/3805#issuecomment-609933208>

    Seems unnecessary work to me.

--------------------------------------------------------------------------------

On 2020-06-16T21:29:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/3805#issuecomment-645021821>

    By the way, same error here: https://github.com/red/red/issues/4500

