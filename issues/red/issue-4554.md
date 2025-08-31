
#4554: [Regression, View] 2x slower face construction than before
================================================================================
Issue is closed, was reported by hiiamboris and has 12 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4554>

**Describe the bug**

Happened between May 21st and May 27th, 2020. Didn't bisect more precisely.

Here's the script:
```
Red [needs: view]
do https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/clock.red
recycle/off
clock [
	v: view/no-wait []
	probe stats
	print "creating faces"
	loop 500 [append v/pane make face! [type: 'text offset: 0x0 size: 10x10]]
	print "flushing events"
	loop 5000 [do-events/no-wait]
	probe stats
	print "closing the window"
	unview v
]
```

Results on build `red-21may20-398d73317`:
```
2388216                                                                       
creating faces                                                                
flushing events                                                               
11015572                                                                      
closing the window                                                            
8463 ms [v: view/no-wait [] probe stats print "creating faces" loop 500 [appen
```

Results on build `red-27may20-cfb6d303f` and all the later ones:
```
2265572                                                                               
creating faces                                                                        
flushing events                                                                       
13198928                                                                              
closing the window                                                                    
16222 ms        [v: view/no-wait [] probe stats print "creating faces" loop 500 [appen
```

200% slowdown, 32ms per single face!

---
Now the similar thing but with faces not really rendered (size: 0x0):
```
Red [needs: view]
do https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/clock.red
recycle/off
clock [
	v: view/no-wait []
	probe stats
	print "creating faces"
	loop 500 [append v/pane make face! [type: 'text offset: 0x0 size: 0x0]]
	print "flushing events"
	loop 5000 [do-events/no-wait]
	probe stats
	print "closing the window"
	unview v
]
```

Results on build `red-21may20-398d73317`:
```
2387116                                                                       
creating faces                                                                
flushing events                                                               
11014472                                                                      
closing the window                                                            
1338 ms [v: view/no-wait [] probe stats print "creating faces" loop 500 [appen
```

Results on build `red-27may20-cfb6d303f` and all the later ones:
```
2274928                                                                       
creating faces                                                                
flushing events                                                               
13208516                                                                      
closing the window                                                            
2143 ms [v: view/no-wait [] probe stats print "creating faces" loop 500 [appen
```
160% slowdown, 4.3ms per face.

**Expected behavior**

Let's get the old timings back.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 20-Jun-2020/20:24:25+03:00 commit #4d864b1
still just as slow, W7
```



Comments:
--------------------------------------------------------------------------------

On 2020-06-28T05:07:51Z, qtxie, commented:
<https://github.com/red/red/issues/4554#issuecomment-650697569>

    Happened just after fast-lexer branch merged into master.

--------------------------------------------------------------------------------

On 2020-06-28T07:54:54Z, qtxie, commented:
<https://github.com/red/red/issues/4554#issuecomment-650713619>

    Using a separate block fix it. So something wrong happened in `on-deep-change*` function or ownership system (lookup become slower?).
    ```
    do https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/clock.red
    recycle/off
    ;system/view/auto-sync?: no
    b: make block! 550
    clock [
    	v: view/no-wait []
    	probe stats
    	print "creating faces"
    	loop 500 [append b make face! [type: 'text offset: 0x0 size: 0x0]]
    	v/pane: b
    	print "flushing events"
    	loop 5000 [do-events/no-wait]
    	probe stats
    	print "closing the window"
    	unview v
    ]
    ```

--------------------------------------------------------------------------------

On 2020-06-28T11:10:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/4554#issuecomment-650735630>

    A separate block triggers a single on-change of pane, while adding one by one is 500 on-deep-change events.
    
    Regarding line 273, it was there for 4 years so I guess it's not the primary bug cause...

--------------------------------------------------------------------------------

On 2020-06-28T23:20:39Z, qtxie, commented:
<https://github.com/red/red/issues/4554#issuecomment-650836043>

    The cause is that after a series of changes those years, `update-z-order` get called unexpected each `append` happened.
    There is another way to fix it, but I don't see the need of line 273 anymore. If there is a good reason to keep this line, I'll change the fix.

--------------------------------------------------------------------------------

On 2020-06-29T07:36:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/4554#issuecomment-650987142>

    `745 ms  [v: view/no-wait [] probe stats print "creating faces" loop 500 [appen`
    Fantastic. You made it 20 times faster ;)

--------------------------------------------------------------------------------

On 2020-06-29T18:29:28Z, greggirwin, commented:
<https://github.com/red/red/issues/4554#issuecomment-651286756>

    Woohoo! I love this kind of fix. Here the closing time went from 23'848ms to 1687 ms.
    
    Thanks to both of you for finding and digging into this.

