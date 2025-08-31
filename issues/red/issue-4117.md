
#4117: [DOC] Not all built-ins have their result type specified
================================================================================
Issue is open, was reported by meijeru and has 8 comment(s).
[type.documentation]
<https://github.com/red/red/issues/4117>

I quote from a recent conversation in `red/help`
`Every built-in function has a specification which tells you what the (type of) result is. Or, at least, it SHOULD have this. The docstring of print, e.g., does not tell you its result is unset. Admittedly that might be added.`
If `HELP <built-in>` would always show the type of result, problems such as with `print` could be avoided for new users.




Comments:
--------------------------------------------------------------------------------

On 2020-08-03T15:15:22Z, 9214, commented:
<https://github.com/red/red/issues/4117#issuecomment-668079131>

    That's one heck of built-ins to process:
    ```red
    write/lines %list.txt collect [
    	foreach word words-of system/words [
    		if all [
    			any-function? set/any 'value get/any word
    			not find spec-of :value quote return:
    		][
    			keep word
    		]
    	]
    ]
    ```
    Or:
    ```red
    stash: make map! 8
    
    foreach word words-of system/words [
    	if all [
    		any-function? set/any 'value get/any word
    		not find spec-of :value quote return:
    	][
    		key: type?/word :value
    		value: new-line/all reduce [word] on
    		either stash/:key [append stash/:key value][stash/:key: value]
    	]
    ]
    
    write/lines %list.txt stash
    ```

--------------------------------------------------------------------------------

On 2020-08-18T15:57:43Z, 9214, commented:
<https://github.com/red/red/issues/4117#issuecomment-675564954>

    Probably should be addressed after https://github.com/red/red/issues/1706#issuecomment-660306764 and `port!` actions are in place.

--------------------------------------------------------------------------------

On 2020-10-13T21:10:45Z, greggirwin, commented:
<https://github.com/red/red/issues/4117#issuecomment-708011175>

    It's a big task, and good info to have of course. Retrofitting is one part, but including it in all new funcs is another. It's also a balancing act and something to think about from a tooling perspective. The balance part is how much it helps versus how much effort it is to create and maintain, as with comments that can get out of sync with code (assuming type specs are maintained manually). For tooling, analysis can determine some result types easily, but not all, and not intent. Also to be balanced with what's in doc strings today, which has overlapping information in a different form.

--------------------------------------------------------------------------------

On 2020-10-13T21:40:40Z, 9214, commented:
<https://github.com/red/red/issues/4117#issuecomment-708024745>

    [Same issue with refinements](https://gitter.im/red/docs?at=5f84276bcdb04d1ea07995ca).

