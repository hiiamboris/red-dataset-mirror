
#2696: WISH: source should give result for routines as well
================================================================================
Issue is closed, was reported by meijeru and has 14 comment(s).
<https://github.com/red/red/issues/2696>

There is no reason why routines should be treated like natives, actions and ops, which do indeed have no body that can be displayed. The spec of a routine is pure Red, and the body is in Red/System but it is composed of Red values, so it can be shown, if need be with a warning "you are now reading RedS".


Comments:
--------------------------------------------------------------------------------

On 2017-05-24T16:49:17Z, greggirwin, commented:
<https://github.com/red/red/issues/2696#issuecomment-303783914>

    Good idea.

--------------------------------------------------------------------------------

On 2017-05-24T16:53:32Z, greggirwin, commented:
<https://github.com/red/red/issues/2696#issuecomment-303785166>

    Should we show the interface for any-function! values, and a special body value for natives, actions, and ops?

--------------------------------------------------------------------------------

On 2017-05-24T18:54:32Z, meijeru, commented:
<https://github.com/red/red/issues/2696#issuecomment-303818371>

    OK for the interface, but the body for natives and actions is a number, which does not mean a lot. For ops, the body is either that of a native or action (see previous sentence) or a function or a routine, which can be shown.

--------------------------------------------------------------------------------

On 2017-05-24T19:38:58Z, greggirwin, commented:
<https://github.com/red/red/issues/2696#issuecomment-303829600>

    Correct. If we see that it's a native/action/op, we can show something like "&lt;body not available&gt;". That's what I meant.

--------------------------------------------------------------------------------

On 2017-05-26T23:14:52Z, greggirwin, commented:
<https://github.com/red/red/issues/2696#issuecomment-304406653>

    How does this look?
    ```
    	set 'source function [
    		"Print the source of a function"
    		'word [any-word!] "The name of the function"
    	][
    		val: get/any word
    		print case [
    			function? :val [append mold word #":" mold :val]
    			routine? :val [[
    				";" uppercase mold :word "is a routine! value; its body is Red/System code.^/"
    				append mold word #":" mold :val
    			]]
    			'else [[uppercase mold word "is" a-an/pre mold type? :val "so source is not available"]]
    		]
    	]
    source repend
    source ask
    source cr
    source append
    source +
    source call
    ```

--------------------------------------------------------------------------------

On 2017-05-31T07:03:28Z, meijeru, commented:
<https://github.com/red/red/issues/2696#issuecomment-305103267>

    Fine by me!

--------------------------------------------------------------------------------

On 2017-05-31T16:53:41Z, greggirwin, commented:
<https://github.com/red/red/issues/2696#issuecomment-305249356>

    Needs a couple tweaks, but I'll fix up and submit.

