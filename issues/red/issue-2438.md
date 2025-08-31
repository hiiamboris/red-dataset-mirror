
#2438: `load "a<=>"` freezes the session
================================================================================
Issue is closed, was reported by dockimbel and has 12 comment(s).
[status.impending] [type.bug]
<https://github.com/red/red/issues/2438>

```
red>> load "a<=>"
(freeze)
```


Comments:
--------------------------------------------------------------------------------

On 2017-03-27T22:17:57Z, gltewalt, commented:
<https://github.com/red/red/issues/2438#issuecomment-289602989>

    Tag rule appears to be involved in the bug.
    lexer.red   --  Line 598
    Removed #"="
    
    ```
    	tag-rule: [
    			;#"<" not [#"=" | #">" | #"<" | ws] (type: tag!)
    			#"<" not [#">" | #"<" | ws] (type: tag!)
    			 s: some [#"^"" thru #"^"" | #"'" thru #"'" | e: #">" break | skip]
    			(if e/1 <> #">" [throw-error [tag! back s]])
    		]
    ```
    
    ```
    >> load "a<=>"
    == [a <=>]
    ```

--------------------------------------------------------------------------------

On 2017-03-28T05:25:15Z, gltewalt, commented:
<https://github.com/red/red/issues/2438#issuecomment-289666607>

    Also, I watched frozen Red Console today in task manager before making any changes, and the memory used kept growing and growing.

--------------------------------------------------------------------------------

On 2017-03-28T07:34:10Z, dockimbel, commented:
<https://github.com/red/red/issues/2438#issuecomment-289687809>

    @gltewalt Thanks for the help, though, that fix causes regressions, as `<=` cannot be loaded as a `word!` value anymore.

--------------------------------------------------------------------------------

On 2017-03-28T14:31:09Z, gltewalt, commented:
<https://github.com/red/red/issues/2438#issuecomment-289788878>

    What about this? (I haven't learned Parse yet as I wanted to fully understand Red semantics first before learning Parse.)
    Borrowed from lexer.r
    
    ```
    	
    		;-- new data
    		ws-ASCII:  charset " ^-^M"
    		not-tag-1st:	complement union ws-ASCII charset "=><"
    		not-tag-char:	complement charset ">"
    		tag-char:	charset "<>"
    
    		tag-rule: [
    			#"<" s: not-tag-1st (type: tag!)
    		 	any [#"^"" thru #"^"" | #"'" thru #"'" | not-tag-char] e: #">"
    		]
    		;-- end new data
    
    		;tag-rule: [
    		;	 #"<" not ["=><" | ws] (type: tag!)
    		;	 s: some [#"^"" thru #"^"" | #"'" thru #"'" | e: #">" break | skip]
    		;	(if e/1 <> #">" [throw-error [tag! back s]])
    		;]
    ```

--------------------------------------------------------------------------------

On 2017-03-28T14:49:53Z, gltewalt, commented:
<https://github.com/red/red/issues/2438#issuecomment-289794889>

    That freezes also....
    I guess I can't help  :-(

--------------------------------------------------------------------------------

On 2019-05-22T20:51:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/2438#issuecomment-494967891>

    I should note that however I may have avoided the freeze problem, the lexers (.r and .red) still diverge on this: `<=>` is invalid in lexer.red but a word in lexer.r. Though, lexer.r being a temporary thing, this problem might never surface in practice.

