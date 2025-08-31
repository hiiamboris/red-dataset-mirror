
#5447: `clean-path/only` doesn't do what it claims to do
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.bug]
<https://github.com/red/red/issues/5447>

https://github.com/red/red/issues/4258#issuecomment-578373733

**Describe the bug**

`Cleans-up '.' and '..' in path; returns the cleaned path.`
`/only        => Do not prepend current directory.`
```
>> clean-path/only %./12/../12
== %./12/../12
```

**Expected behavior**
```
>> clean-path/only %./12/../13
== %13
```

**Platform version**
```
Red 0.6.4 for Windows built 22-Nov-2023/17:24:25+03:00  commit #34f26df
```


Comments:
--------------------------------------------------------------------------------

On 2023-12-20T18:54:46Z, hiiamboris, commented:
<https://github.com/red/red/issues/5447#issuecomment-1864982285>

    After trying to fix it myself I eventually came to agree with @x8x that string version, while (~4x) faster, is way too messy and requires so many special cases to be considered that it's almost impossible to get it right. 
    
    On the contrary, split+join version is simple and straighforward (I removed `/dir` from it to isolate concerns as we have `dirize` for that).
    
    Correctness IMO is the priority here. For daily running clean-path on whole filesystems one may rather write a routine.
    
    Clean version I'm proposing:
    ```
    clean-path: function [
        [no-trace] 
        "Cleans up '.' and '..' in path; returns the cleaned path"
        path [file! url! string!] 
        /only "Do not prepend current directory" 
    ][
    	abs?: any [#"/" = first path url? path]				;-- treat all urls as absolute
    	unless any [only abs?] [abs?: path: as path append what-dir path]
    	out:  clear copy parts: reverse split as string! path #"/"
    	root: if abs? [take/last parts]						;-- if absolute, preserve the part until the first slash
    	parse parts [(up: 0) collect after out any [
    		".." (up: up + 1)
    	|	"."
    	|	skip if (up > 0) (up: up - 1)
    	|	keep skip
    	]]
    	either abs? [
    		append out root									;-- if absolute, restore the prefix
    		if single? out [insert out ""]					;-- ensure it always has a slash
    	][
    		append/dup out ".." up							;-- if relative, keep extra up-levels
    	]
    	as path join reverse out #"/"
    ]
    ```
    With tests:
    ```
    #assert [
    	backed-up: :what-dir
    	set 'what-dir does [copy %/level1/level2/]					;-- use predictable path for testing
    	
    	%/level1/level2          == clean-path      %.
    	%/level1/level2/         == clean-path      %./
    	%/level1/level2/         == clean-path      %""				;-- treat empty path as current directory, not root
    	%""                      == clean-path/only %""
    	%/level1/level2/a        == clean-path      %a
    	%/level1/level2/a        == clean-path      %a/.
    	%/level1/level2/a/       == clean-path      %a/./
    	%/level1/level2          == clean-path      %a/..
    	%/level1/level2/x        == clean-path      %a/../x
    	%/level1/level2/x/       == clean-path      %a/../x/
    	%/a                      == clean-path      %/a/.
    	%/a/                     == clean-path      %/a/./
    	%/                       == clean-path      %/a/..			;-- should this return /a/ on Windows and clean-path be platform-specific?
    	%/x                      == clean-path      %/a/../x
    	%/x/                     == clean-path      %/a/../x/
    	%/a/b/file               == clean-path      %/a/b/./file
    	%/a/file                 == clean-path      %/a/b/../file
    	%/file                   == clean-path      %/a/b/../../file
    	%/file                   == clean-path      %/a/b/../../../file
    	%/file/                  == clean-path      %/a/b/../../../file/
    	%/level1/level2/a/b/file == clean-path      %a/b/./file
    	%/level1/level2/a/file   == clean-path      %a/b/../file
    	%/level1/level2/file     == clean-path      %a/b/../../file
    	%/level1/file            == clean-path      %a/b/../../../file
    	%/file                   == clean-path      %a/b/../../../../file
    	%/file                   == clean-path      %a/b/../../../../../file
    	%/file                   == clean-path      %a/b/../../../../../../file
    	%/file/                  == clean-path      %a/b/../../../../../../file/
    	%/                       == clean-path      %a/b/../../../../../../..		;-- root path always ends with a slash
    	%/                       == clean-path      %a/b/../../../../../../../
    	%a/b/file                == clean-path/only %a/b/./file
    	%a/file                  == clean-path/only %a/b/../file
    	%file                    == clean-path/only %a/b/../../file
    	%../file                 == clean-path/only %a/b/../../../file
    	%../../file              == clean-path/only %a/b/../../../../file
    	%../../../file           == clean-path/only %a/b/../../../../../file
    	%../../../file/          == clean-path/only %a/b/../../../../../file/
    	
    	;; technically, // is an empty path segment, which is allowed in URLs
    	;; so preserving scheme:// is not something we can or should do generally
    	;; see e.g. https://en.wikipedia.org/wiki/File_URI_scheme#Number_of_slash_characters
    	ftp:/                    == clean-path      ftp://..
    	ftp:/                    == clean-path      ftp://../
    	ftp:/                    == clean-path      ftp://../..		;-- should not consume the root slash
    	ftp:/                    == clean-path      ftp://../../
    	ftp://site/file          == clean-path      ftp://site/./file
    	ftp://file               == clean-path      ftp://site/../file
    	ftp:/file                == clean-path      ftp://site/../../file
    	ftp:/file                == clean-path      ftp://site/../../../file
    	ftp:/file                == clean-path      ftp://site/../../../../file
    	ftp:/file/               == clean-path      ftp://site/../../../../file/
    	
    	%/file                   == clean-path append append/dup copy %/a/b/c/d/ %../ 16000 %file	;-- stress test (recursive algos fail it)
    	
    	set 'what-dir :backed-up
    ]
    ```

--------------------------------------------------------------------------------

On 2024-03-26T13:25:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/5447#issuecomment-2020425631>

    #5496 somewhat related

