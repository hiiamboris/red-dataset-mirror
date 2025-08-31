
#2415: Preprocessor doesn't recognize the correct generated macro definition
================================================================================
Issue is closed, was reported by ifgem and has 2 comment(s).
<https://github.com/red/red/issues/2415>

Code: https://gist.github.com/ifgem/6e29dcac1a0abd04488712edf77938f5
The example is at the bottom of the gist.


Comments:
--------------------------------------------------------------------------------

On 2017-01-13T18:15:44Z, ifgem, commented:
<https://github.com/red/red/issues/2415#issuecomment-272507810>

    Note: Red prints "preprocessor works", even if I change the position to the end!
    ```
    #macro [
    	'defmacro 
    	set macro-name opt word! 
    	set macro-spec block! 
    	set macro-body block!
    ] func [[manual] start end /local quote] [
    	quote: macro/quote
    	bind macro-body 'quote
    
    	en: change/part start
    		compose/deep [
    			print "preprocessor works, but doesn't register macro"
    			#macro [
    				(if macro-name [to lit-word! macro-name]) 
    				(macro/to-spec-rule macro-spec)
    			] func [
    				[manual] start end 
    				(macro/local macro-body)
    			] [
    				macro/replacement: copy []
    					
    				(macro-body)
    
    				change/part start macro/replacement end
    
    				start
    			]
    		]
    	end
    	
    	en ; !!!
    ]
    ```

