
#5138: GC-related CRASH in hashtable somewhere
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug] [type.GC]
<https://github.com/red/red/issues/5138>

**Describe the bug**
```
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/datatypes/string.reds
*** at line: 887
***
***   stack: red/string/equal? 05655930h 056558C0h 0 false
***   stack: red/string/compare 05655930h 056558C0h 0
***   stack: red/actions/compare 05655930h 056558C0h 0
***   stack: red/_hashtable/put 07A9FDDCh 056558C0h
***   stack: red/block/insert 0498C73Ch 0498C74Ch 0498C72Ch false 0498C72Ch true
***   stack: red/actions/insert 0498C73Ch 0498C74Ch 0498C72Ch false 0498C72Ch true
***   stack: red/actions/append* -1 -1 -1
***   stack: red/interpreter/eval-arguments 0498C72Ch 05654788h 05654788h 0498C71Ch 00000000h 00000000h 04AB0048h
***   stack: red/interpreter/eval-code 04AB0048h 05654748h 05654788h 0498C71Ch false 00000000h 00000000h 04AB0048h
***   stack: red/interpreter/eval-expression 05654748h 05654788h 0498C71Ch false false false
***   stack: red/interpreter/eval 0498C71Ch true
***   stack: red/natives/do* false -1 -1 -1 -1
***   stack: red/interpreter/eval-arguments 0498C70Ch 05654A78h 05654A78h 0498C6FCh 00000000h 00000000h 04AB0CA8h
***   stack: red/interpreter/eval-code 04AB0CA8h 05654A58h 05654A78h 0498C6FCh false 00000000h 00000000h 04AB0CA8h
***   stack: red/interpreter/eval-expression 05654A58h 05654A78h 0498C6FCh false false false
***   stack: red/interpreter/eval 0498C6FCh true
***   stack: red/natives/loop* false
***   stack: red/interpreter/eval-arguments 0498C6DCh 05654B00h 05654B00h 0498C6BCh 00000000h 00000000h 04AB0BA8h
***   stack: red/interpreter/eval-code 04AB0BA8h 05654AE0h 05654B00h 0498C6BCh false 00000000h 00000000h 04AB0BA8h
***   stack: red/interpreter/eval-expression 05654AE0h 05654B00h 0498C6BCh false false false
***   stack: red/interpreter/eval 0498C6BCh false
***   stack: red/object/make 0498C6ACh 0498C6BCh 32
***   stack: red/actions/make 0498C6ACh 0498C6BCh
***   stack: red/actions/make*
***   stack: context
***   stack: red/_function/call 0498C68Ch 04A83884h 05654B18h 0
***   stack: red/interpreter/eval-code 04AB0EA8h 05654B38h 05654B38h 0498C67Ch false 00000000h 00000000h 04AB0EA8h
***   stack: red/interpreter/eval-expression 05654B28h 05654B38h 0498C67Ch false false false
***   stack: red/interpreter/eval 0498C67Ch true
***   stack: red/natives/loop* false
***   stack: red/interpreter/eval-arguments 0498C65Ch 05654BA0h 05654BA0h 0498C63Ch 00000000h 00000000h 04AB0BA8h
***   stack: red/interpreter/eval-code 04AB0BA8h 05654B80h 05654BA0h 0498C63Ch false 00000000h 00000000h 04AB0BA8h
***   stack: red/interpreter/eval-expression 05654B80h 05654BA0h 0498C63Ch false false false
***   stack: red/interpreter/eval 0498C63Ch true
***   stack: red/natives/catch* true 1
***   stack: ctx||559~try-do 04C71A60h
***   stack: ctx||559~launch 04C71A60h
***   stack: ctx||578~launch 04C71474h
```
IDK, stack trace is likely incidental, because I was chasing this bug for half a day and have seen two other traces in much more complex code, though they do not happen with the provided snippet:
```
(this usually happens when I close the window after hash table starts randomly fetching values from the wrong slots, likely bucket corruption)
*** Runtime Error 95: no CATCH for THROW
*** in file: common.reds
*** at line: 282
***
***   stack: ***-uncaught-exception
***   stack: ***-uncaught-exception
***   stack: ***-uncaught-exception
```
```
(usually happens before, or at the time, errors in the hash table lookup start to surface)
*** Runtime Error 98: assertion failed
*** in file: /D/devel/red/red-src/red/runtime/hashtable.reds
*** at line: 1488
***
***   stack: red/_hashtable/clear 077FABA0h 5 10
***   stack: red/_series/change 04A2DC1Ch 04A2DC2Ch 04A2DC0Ch false 04A2DC3Ch
***   stack: red/actions/change 04A2DC1Ch 04A2DC2Ch 04A2DC0Ch false 04A2DC3Ch
***   stack: red/actions/change* -1 -1 2
***   stack: red/interpreter/eval-arguments 04A2DC0Ch 07921D60h 07921D60h 04A2DBFCh 07921D00h 07921D78h 0533FFF8h
***   stack: red/interpreter/eval-code 0533FFF8h 07921D10h 07921D60h 04A2DBFCh true 07921D00h 07921D78h 0533FFF8h
***   stack: red/interpreter/eval-path 07921D00h 07921D10h 07921D60h 04A2DBFCh false false false false
***   stack: red/interpreter/eval-expression 07921D10h 07921D60h 04A2DBFCh false false false
***   stack: red/interpreter/eval 04A2DBFCh true
***   stack: red/natives/while* false
***   stack: red/interpreter/eval-arguments 04A2DBDCh 07921C08h 07921C48h 04A2DBACh 00000000h 00000000h 0533FE38h
***   stack: red/interpreter/eval-code 0533FE38h 07921BE8h 07921C48h 04A2DBACh false 00000000h 00000000h 0533FE38h
***   stack: red/interpreter/eval-expression 07921BE8h 07921C48h 04A2DBACh false false false
***   stack: red/interpreter/eval 04A2DBACh false
***   stack: red/natives/foreach* false
***   stack: red/interpreter/eval-arguments 04A2DB7Ch 07921B20h 07921B50h 04A2DB6Ch 00000000h 00000000h 05340BE8h
***   stack: red/interpreter/eval-code 05340BE8h 07921AF0h 07921B50h 04A2DB6Ch false 00000000h 00000000h 05340BE8h
***   stack: red/interpreter/eval-expression 07921AF0h 07921B50h 04A2DB6Ch false false false
***   stack: red/interpreter/eval 04A2DB6Ch true
***   stack: red/natives/if* false
***   stack: red/interpreter/eval-arguments 04A2DB4Ch 07921A60h 07921A60h 04A2DB3Ch 00000000h 00000000h 0533FEE8h
***   stack: red/interpreter/eval-code 0533FEE8h 07921A10h 07921A60h 04A2DB3Ch false 00000000h 00000000h 0533FEE8h
***   stack: red/interpreter/eval-expression 07921A10h 07921A60h 04A2DB3Ch false false false
***   stack: red/interpreter/eval 04A2DB3Ch true
***   stack: red/natives/unless* false
***   stack: red/interpreter/eval-arguments 04A2DB1Ch 079219B0h 079219B0h 04A2DB0Ch 00000000h 00000000h 05340B38h
***   stack: red/interpreter/eval-code 05340B38h 07921970h 079219B0h 04A2DB0Ch false 00000000h 00000000h 05340B38h
***   stack: red/interpreter/eval-expression 07921970h 079219B0h 04A2DB0Ch false false false
***   stack: red/interpreter/eval 04A2DB0Ch true
***   stack: red/natives/either* false
***   stack: red/interpreter/eval-arguments 04A2DADCh 07921820h 07921840h 07921748h 00000000h 00000000h 05340B48h
***   stack: red/interpreter/eval-code 05340B48h 079217E0h 07921840h 07921748h false 00000000h 00000000h 05340B48h
***   stack: red/interpreter/eval-expression 079217E0h 07921840h 07921748h false false false
***   stack: red/interpreter/eval 07921748h true
***   stack: red/interpreter/eval-function 04A2DA6Ch 07921748h 07942828h
***   stack: red/_function/call 04A2DA6Ch 07A4B90Ch 07942828h 0
***   stack: red/interpreter/eval-code 078F96B8h 07942848h 07942848h 04A2DA5Ch false 00000000h 00000000h 078F96B8h
***   stack: red/interpreter/eval-expression 07942838h 07942848h 04A2DA5Ch false false false
***   stack: red/interpreter/eval 04A2DA5Ch true
***   stack: red/natives/if* false
```
This bug greatly reduces stability of the code using hash tables, including Spaces project.

**To reproduce**

Run this, it prints the first stack trace in 100% cases:
```
Red []

; recycle/off
; hash!: block!
loop 500 [
	object [
		x: make hash! []
		loop 10000 [do random/only [
			[append x copy random "^A^B^C"]
			[find at x random 50 random "^A^B^C"]
			[change/dup at x random length? x 'word random 5]
			[clear skip tail x (random 50) - 50]
		]]
	]
]
```
Note that both commented out lines disable the bug if uncommented.

**Expected behavior**

A bunch of recycles over ~10 seconds, no errors.

**Platform version**
```
Red 0.6.4 for Windows built 13-May-2022/5:14:13+03:00  commit #46f1ea3
```



Comments:
--------------------------------------------------------------------------------

On 2022-06-01T12:39:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/5138#issuecomment-1143557845>

    Now I modify the test a little bit and:
    ```
    Red []
    
    ; recycle/off
    ; hash!: block!
    loop 5000 [
    	object [
    		x: make hash! []
    		loop 10000 [do random/only [
    			[append x copy random "^A^B^C"]
    			[find at x random 50 random "^A^B^C"]
    			[
    				p: insert/dup at x random length? x 'word n: random 5
    				remove/part p n
    			]
    			[clear skip tail x (random 50) - 50]
    		]]
    	]
    ]
    ```
    ```
    *** Runtime Error 1: access violation
    *** Cannot determine source file/line info.
    ***
    ```
    P.S. this actually crashes even with `recycle/off` :/

--------------------------------------------------------------------------------

On 2022-09-13T03:23:29Z, qtxie, commented:
<https://github.com/red/red/issues/5138#issuecomment-1244848516>

    > Now I modify the test a little bit and:
    > 
    > ```
    > Red []
    > 
    > ; recycle/off
    > ; hash!: block!
    > loop 5000 [
    > 	object [
    > 		x: make hash! []
    > 		loop 10000 [do random/only [
    > 			[append x copy random "^A^B^C"]
    > 			[find at x random 50 random "^A^B^C"]
    > 			[
    > 				p: insert/dup at x random length? x 'word n: random 5
    > 				remove/part p n
    > 			]
    > 			[clear skip tail x (random 50) - 50]
    > 		]]
    > 	]
    > ]
    > ```
    > 
    > ```
    > *** Runtime Error 1: access violation
    > *** Cannot determine source file/line info.
    > ***
    > ```
    > 
    > P.S. this actually crashes even with `recycle/off` :/
    
    No crashes anymore with GC on.

--------------------------------------------------------------------------------

On 2022-09-13T08:20:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/5138#issuecomment-1245064573>

    Yes, should be fixed by https://github.com/red/red/commit/671dae6581601abf2e54f695a36e44c120887fe0

