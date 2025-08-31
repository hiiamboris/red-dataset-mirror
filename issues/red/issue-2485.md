
#2485: Compiler: wierdness with function in a function
================================================================================
Issue is open, was reported by x8x and has 8 comment(s).
[type.compiler]
<https://github.com/red/red/issues/2485>

```red
Red []

f1: func [/local block f2][
	f2: func [block value][insert block value]
	block: [b]
	f2 block 'a
	probe block
]

f1
```
Code above, interpreted returns `[a b]` while compiled returns `[b]`
Externalizing `f2` like this:
```red
f2: func [block value][insert block value]

f1: func [/local block][
	block: [b]
	f2 block 'a
	probe block
]

f1
```
Properly returns `[a b]` interpreted or compiled.


Comments:
--------------------------------------------------------------------------------

On 2017-03-18T07:02:45Z, x8x, commented:
<https://github.com/red/red/issues/2485#issuecomment-287521672>

    Wondering if it's related to https://github.com/red/red/issues/1144

--------------------------------------------------------------------------------

On 2017-04-04T17:46:03Z, greggirwin, commented:
<https://github.com/red/red/issues/2485#issuecomment-291578075>

    I'm going to put a big code example here, rather than opening a new ticket. This is just for future reference, as I'm seeing something similar. I haven't been able to narrow it down further, yet, and can't spend more time on it now.
    ```
    Red []
    
    func-spec-ctx: context [
    	func-spec: context [
    		desc: none				; string!							desc
    		attr: none				; block!							[attr ...]
    		params: copy []			; [word! opt block! opt string!]	[name type desc]
    		refinements: copy []	; [word! opt string! [params]]		[name desc [[name type desc] ...]]
    		locals: copy []			; [some word!]						[name ...]
    		returns: copy []		; [opt [word! string!]]				[type desc]
    	]
    
    	param-frame-proto: reduce ['name none 'type none 'desc none]
    	refinement-frame-proto: reduce ['name none 'desc none 'params copy []]
    	
    	set 'parse-func-spec function [
    		"Parses a function spec and returns an object model of it."
    		spec [block! any-function!]
    		/local =val		; set with parse, so function won't collect it
    	][
    		stack: copy []
    		push: func [val][append/only stack val]
    		pop:  does [also  take back tail stack  cur-frame: last stack]
    		push-param-frame: does [
    			;print 'push-param-frame
    			push cur-frame: copy param-frame-proto					; fails when compiled
    			;append/only stack cur-frame: copy param-frame-proto	; works fine
    			;probe reduce [cur-frame stack]
    		]
    		push-refinement-frame: does [
    			push cur-frame: copy/deep refinement-frame-proto				; fails when compiled
    			;append/only stack cur-frame: copy/deep refinement-frame-proto	; works fine
    		]
    		emit: function [key val][
    	        pos: find/only/skip cur-frame key 2
    	        head change/only next pos val
    		]
    		
    		; The = sigils are just to make parse-related vars more obvious
    		func-desc=:  [set =val string! (res/desc: =val)]
    		attr-val=:   ['catch | 'throw]
    		func-attr=:  [into [copy =val some attr-val= (res/attr: =val)]]
    		
    		param-name=: [
    			set =val [word! | get-word! | lit-word!]
    			(push-param-frame  emit 'name =val)
    		]
    		;!! This isn't complete. Under R2 we could parse for datatype! in 
    		;	the param type spec, but they are just words in Red func specs.
    		param-type=: [
    			set =val block! (emit 'type =val) (
    				if not parse reduce =val [some [datatype! | typeset!]][
    					print ["Looks like we have a bad type spec:" mold =val]
    				]
    			)
    		]
    		param-desc=: [set =val string! (emit 'desc =val)]
    		param-attr=: [opt param-type= opt param-desc=]
    		param=:      [param-name= param-attr= (
    			;probe stack 
    			append/only res/params new-line/all pop off
    		)]
    		
    		ref-name=:   [set =val refinement! (push-refinement-frame  emit 'name =val)]
    		ref-desc=:   :param-desc=
    		ref-param=:  [param-name= param-attr= (tmp: pop  append/only cur-frame/params tmp)]
    		refinement=: [ref-name= opt ref-desc= any ref-param= (append/only res/refinements pop)]
    		locals=:     [/local copy =val any word! (res/locals: =val)]
    		returns=: [
    			quote return: (push-param-frame  emit 'name 'return)
    			param-type= opt param-desc=
    			;(probe stack)
    			(res/returns: pop)
    		]
    		spec=: [
    			opt func-desc=
    			opt func-attr=
    			any param=
    			any [locals= to end | refinement= | returns=]
    		]
    
    		if any-function? :spec [spec: spec-of :spec]
    		res: make func-spec []
    		either parse spec spec= [res] [none]
    	]
    
    ]
    
    probe parse-func-spec :append
    ;probe parse-func-spec :repend
    ;probe parse-func-spec :find
    
    halt
    ```

--------------------------------------------------------------------------------

On 2017-04-18T15:44:36Z, x8x, commented:
<https://github.com/red/red/issues/2485#issuecomment-294886825>

    FYI: The dynamic stack branch needs to be completed for this code to work compiled:
    ```
    f: func [fun /local var][
        var: 123
        fun var
    ]
    fun: func[var][print var]
    f :fun
    ```
    In the meantime, the proper workaround is to wrap the call to the inner function with `do []` like this:
    ```
    f: func [fun /local var][
        var: 123
        do [fun var]
    ]
    fun: func[var][print var]
    f :fun
    ```

--------------------------------------------------------------------------------

On 2019-10-16T09:01:23Z, loziniak, commented:
<https://github.com/red/red/issues/2485#issuecomment-542602234>

    It would probably be good to at least generate some warning from compiler instead of silently give inconsistent results.

