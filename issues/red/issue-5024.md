
#5024: SPLIT-PATH results inconsistency
================================================================================
Issue is open, was reported by Oldes and has 36 comment(s).
[type.review]
<https://github.com/red/red/issues/5024>

In all these 3 cases there should be `%""` instead of `none`:
```red
>> split-path %/
== [%/ none]
>> split-path %./
== [%./ none]
>> split-path %../
== [%../ none]
```
So it will be consistent with results like:
```red
>> split-path %""
== [%./ %""]
>> split-path %a
== [%./ %a]
>> split-path %/a
== [%/ %a]
>> split-path %/a/
== [%/ %a/]
```
In other words.. it should be possible to use `rejoin` to get back the original path.

Discussed here: https://gitter.im/red/bugs?at=61d5cd645ee4df335accd54d


Comments:
--------------------------------------------------------------------------------

On 2022-01-05T19:28:10Z, greggirwin, commented:
<https://github.com/red/red/issues/5024#issuecomment-1006014679>

    This version is not compatible with the current Red version. Red is currently compatible with Rebol.
    
    ```
    split-path: function [
    	"Returns a block containing a path and target."
    	path [any-string!]
    ][
    	target: any [find/last/tail path slash   path]
    	reduce [copy/part path target  to file! target]
    ]
    ;;; These tests match new REJOIN-transitive behavior.
    e.g.: :do
    e.g. [
    	split-path-tests: compose/deep [
    		%foo 			[%"" %foo]
    		%"" 			[%"" %""]
    		%/c/rebol/tools/test/test.r [%/c/rebol/tools/test/ %test.r]
    		%/c/rebol/tools/test/       [%/c/rebol/tools/test/ %""]
    		%/c/rebol/tools/test        [%/c/rebol/tools/ %test]
    		%/c/test/test2/file.x       [%/c/test/test2/ %file.x]
    		%/c/test/test2/ [%/c/test/test2/ %""]
    		%/c/test/test2  [%/c/test/ %test2]
    		%/c/test        [%/c/ %test]
    		%//test         [%// %test]
    		%/test          [%/ %test]
    		%/c/            [%/c/ %""]
    		%/              [%/ %""]
    		%//             [%// %""]
    		%.              [%"" %.]
    		%./             [%./ %""]
    		%./.            [%./ %.]
    		%..             [%"" %..]
    		%../            [%../ %""]
    		%../..          [%../ %..]
    		%../../test     [%../../ %test]
    		%foo/..         [%foo/ %..]
    		%foo/.          [%foo/ %.]
    		%foo/../.       [%foo/../ %.]
    		%foo/../bar     [%foo/../ %bar]
    		%foo/./bar      [%foo/./ %bar]
    		%/c/foo/../bar  [%/c/foo/../ %bar]
    		%/c/foo/./bar   [%/c/foo/./ %bar]
    		http://www.red-lang.org/index.html [http://www.red-lang.org/ %index.html]
    		http://www.red-lang.org/   [http://www.red-lang.org/ %""]
    		http://www.red-lang.org    [http:// %www.red-lang.org]
    		http://         [http:// %""]		; What should we do in this case?
    		http://..       [http:// %..]
    		http://.        [http:// %.]
    		http://../.     [http://../ %.]
    		http://../bar   [http://../ %bar]
    		http://./bar    [http://./ %bar]
    		(at %/vol/dir/file.r 6)  [%dir/ %file.r]
    	]
    	foreach [test result] split-path-tests [
    		if result <> actual: split-path test [
    			print [mold test 'expected mold result "but got" mold actual]
    		]
    	]
    	foreach [test result] split-path-tests [
    		if test <> rejoin res: split-path test [
    			print ["REJOIN quality failed:" mold test mold rejoin res]
    		]
    	]
    ]
    ```

--------------------------------------------------------------------------------

On 2022-01-05T19:38:14Z, greggirwin, commented:
<https://github.com/red/red/issues/5024#issuecomment-1006021193>

    As you can see, this does not work like @Oldes' examples, or like the current version in Red. It does not automatically change empty paths to `%.`. We could use the current version in Red, but change `none` results to empty files (`%""`). This version is based on what was originally Ladislav's idea that `rejoin split-path` should reproduce the original result. It's all tradeoffs. The `rejoin` attribute is very easy to reason about, as is always splitting at the last `/`, but is it the most useful?
    
    My main concern, or the biggest problem I see, with the current version is that part 2 may be `none`, `%""`, a filename, a directory name, or an "upgraded" special dir name if the path ends in `.` or `..`. For reference, here are the same tests with results for the current behavior.

--------------------------------------------------------------------------------

On 2022-01-05T19:38:23Z, greggirwin, commented:
<https://github.com/red/red/issues/5024#issuecomment-1006021294>

    ```
    ;;; These tests match current REBOL/Red behavior.
    e.g.: :do
    e.g. [
    	split-path-tests: compose/deep [
    		%foo 			[%./ %foo]
    		%"" 			[%./ %""]
    		%/c/rebol/tools/test/test.r [%/c/rebol/tools/test/ %test.r]
    		%/c/rebol/tools/test/       [%/c/rebol/tools/ %test/]
    		%/c/rebol/tools/test        [%/c/rebol/tools/ %test]
    		%/c/test/test2/file.x       [%/c/test/test2/ %file.x]
    		%/c/test/test2/ [%/c/test/ %test2/]
    		%/c/test/test2  [%/c/test/ %test2]
    		%/c/test        [%/c/ %test]
    		%//test         [%// %test]
    		%/test          [%/ %test]
    		%/c/            [%/ %c/]
    		%/              [%/ (none)]
    		%//             [%/ %/]
    		%.              [%./ (none)]
    		%./             [%./ (none)]
    		%./.            [%./ %./]
    		%..             [%../ (none)]
    		%../            [%../ (none)]
    		%../..          [%../ %../]
    		%../../test     [%../../ %test]
    		%foo/..         [%foo/ %../]
    		%foo/.          [%foo/ %./]
    		%foo/../.       [%foo/../ %./]
    		%foo/../bar     [%foo/../ %bar]
    		%foo/./bar      [%foo/./ %bar]
    		%/c/foo/../bar  [%/c/foo/../ %bar]
    		%/c/foo/./bar   [%/c/foo/./ %bar]
    		http://www.rebol.com/index.html [http://www.rebol.com/ %index.html]
    		http://www.rebol.com/   [http:// %www.rebol.com/]
    		http://www.rebol.com    [http:// %www.rebol.com]
    		http://         [http:/ %/]		; What should we do in this case?
    		http://..       [http:// %../]
    		http://.        [http:// %./]
    		http://../.     [http://../ %./]
    		http://../bar   [http://../ %bar]
    		http://./bar    [http://./ %bar]
    		(at %/vol/dir/file.r 6)  [%dir/ %file.r]
    	]
    	foreach [test result] split-path-tests [
    		if result <> actual: split-path test [
    			print [mold test 'expected mold result "but got" mold actual]
    		]
    	]
    	foreach [test result] split-path-tests [
    		if test <> rejoin res: split-path test [
    			print ["REJOIN quality failed:" mold test mold rejoin res]
    		]
    	]
    	foreach [test result] split-path-tests [
    		if (red-std: red-std-split-path test) <> (actual: split-path test) [
    			print [mold test 'red-std mold red-std  'new  mold actual]
    		]
    	]
    ]
    ```

--------------------------------------------------------------------------------

On 2022-01-05T19:55:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/5024#issuecomment-1006032330>

    In my experience, I've multiple times used split-path, but always to get the directory (current, of some script, etc). So for that use case I'd prefer second item to *never* be a dir.
    
    E.g. it may behave like this:
    ```
    >> split-path %/a/b/..
    == [%/a/b/../ %""]
    >> split-path %/a/b/../
    == [%/a/b/../ %""]
    >> split-path %/a/b/c/
    == [%/a/b/c/ %""]
    >> split-path %/a/b/c
    == [%/a/b/ %c]
    ```

--------------------------------------------------------------------------------

On 2022-01-05T19:59:28Z, greggirwin, commented:
<https://github.com/red/red/issues/5024#issuecomment-1006034852>

    That's probably 90% of my use cases as well. It is interesting to note, though, that the func (spec matching R2), calls the second part `target` and not `file`. Another attribute is that you can use repeated `split-path` calls on part one (the path) to successively get the last part and a shorter path. With the new model, you can't do that.

--------------------------------------------------------------------------------

On 2022-01-05T20:03:06Z, greggirwin, commented:
<https://github.com/red/red/issues/5024#issuecomment-1006037414>

    The magic dir name behavior leads us to the fork of "simple string splitting" versus "file system aware behavior". The arg today is limited to files or URLs. I changed mine to be `any-string!` as that's the model it uses. 

--------------------------------------------------------------------------------

On 2022-01-05T20:38:57Z, Oldes, commented:
<https://github.com/red/red/issues/5024#issuecomment-1006060417>

    I'm now using this:
    ```red
    split-path: func [
        {Splits a file or URL path. Returns a block containing path and target} 
        target [file! url!] 
        /local dir pos
    ][
        parse target [
            [#"/" | 1 2 #"." opt #"/"] end (pos: %"" dir: dirize target) |
            pos: any [thru #"/" [end | pos:]] (
                all [empty? dir: copy/part target at head target index? pos dir: %./] 
                all [find [%. %..] pos: to file! pos append pos #"/"]
            )
        ] 
        reduce [dir pos]
    ]
    ```

--------------------------------------------------------------------------------

On 2022-01-05T20:43:13Z, Oldes, commented:
<https://github.com/red/red/issues/5024#issuecomment-1006062937>

    And I don't think that this function should be used with anything else than `file!`.
    URL may be much complicated than the test examples above and `split-path` can easily fail if the url has a _query_ as well. 

--------------------------------------------------------------------------------

On 2022-01-05T20:58:34Z, greggirwin, commented:
<https://github.com/red/red/issues/5024#issuecomment-1006071983>

    What about `file:///` access? And while we may suggest `decode-url`, might there also be uses where you want to keep just the target and change the path, or in a service you may want to log just that part? URLs work fine if we treat them just as strings.
    ```
    >> split-path http://www.red-lang.org/a/b/c.txt#xyz?n=1
    == [http://www.red-lang.org/a/b/ %c.txt#xyz?n=1]
    ```
    
    From your code, I can't tell how it differs from what's there now @Oldes.

--------------------------------------------------------------------------------

On 2022-01-05T21:37:22Z, greggirwin, commented:
<https://github.com/red/red/issues/5024#issuecomment-1006097377>

    Another way we can ask about the goal is to look at the name. `split-path` says nothing about enriching the result with semantic information (e.g. `./  ../`). Should that matter? If it's just string splitting, it will soon be `split X [after last slash]` or `split/after/last X slash`. Now it's really simple to inline, but the name still adds important meaning. It is also currently specific to Red's path notation. Not local files, or any other separator (e.g. dot for nested object calls in external data). But Red's `path!` is another beast entirely, so this function has a more general name than is appropriate for file/url use. Of course, it's quite common, and nobody has complained in the past that I know of. It's a matter of "If we're going to change it, what should we consider that wasn't considered before." 
    
    In my decade old func counter (which we should write new tools for), `split-path` fell between `until` and `call` in the list. I'd call it a tertiary level func.

--------------------------------------------------------------------------------

On 2022-01-05T21:41:28Z, greggirwin, commented:
<https://github.com/red/red/issues/5024#issuecomment-1006100726>

    `Split` on `path!` values, to got a bit OT, suffers the problem of no construction syntax, so path values can look like words.
    ```
    >> type? last probe res: split 'a/b/c/d [last 1]
    [a/b/c d]
    == path!
    ```

--------------------------------------------------------------------------------

On 2022-01-05T21:43:15Z, Oldes, commented:
<https://github.com/red/red/issues/5024#issuecomment-1006101807>

    @greggirwin in my code, the only change is added `pos: %""`

--------------------------------------------------------------------------------

On 2022-01-05T22:54:16Z, greggirwin, commented:
<https://github.com/red/red/issues/5024#issuecomment-1006141032>

    Thanks, And so it changes all `none` parts to `%""` in results?

--------------------------------------------------------------------------------

On 2022-01-06T05:52:20Z, Oldes, commented:
<https://github.com/red/red/issues/5024#issuecomment-1006303987>

    Yes.

--------------------------------------------------------------------------------

On 2022-01-06T09:41:52Z, toomasv, commented:
<https://github.com/red/red/issues/5024#issuecomment-1006417757>

    Just to return `trim reduce [dir pos]` from current `split-path` would be non-breaking, logically sound, and would round-trip with `rejoin`.

--------------------------------------------------------------------------------

On 2022-01-06T10:56:34Z, Oldes, commented:
<https://github.com/red/red/issues/5024#issuecomment-1006475587>

    It would be breaking pretty hard my code as I usually have `set [dir file] split-path file-path`. I don't care about round-trip so much as I never used it. But I prefer to have `file` to be always `file!` so I don't have to write `file: any [file %""]` all the time, just because there are 3 edge cases.

--------------------------------------------------------------------------------

On 2022-01-06T11:00:57Z, toomasv, commented:
<https://github.com/red/red/issues/5024#issuecomment-1006478820>

    Of course I didn't mean your private code, but current standard code. Although I don't know what you do with `%""`. Probably you'll check if `file` is empty?

--------------------------------------------------------------------------------

On 2022-01-06T11:02:57Z, Oldes, commented:
<https://github.com/red/red/issues/5024#issuecomment-1006480487>

    It is funny. Because it is actually [your code](https://gist.github.com/toomasv/f2bcf320800ca340379457c1c4036338), which has a problem with it... just try `dir-tree %/` :) 

