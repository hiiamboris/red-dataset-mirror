
#4528: [Compiler] Wrong error on unbalanced brackets
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.compiler]
<https://github.com/red/red/issues/4528>

**Describe the bug**

Compile this:
```
Red []

	[ ]]
	--test-- "test-name"						;-- comment
		some
		code
		do [		
			this and that
		]

```
Compiler says:
```
*** Syntax Error: Invalid word! value                                              
*** in file: <...>\1.red
*** line: 3                                                                        
*** at: {]                                                                         
^---test-- "test-name"^-^-^-^-^-^-;-- comment}                                     
```

**Expected behavior**

A message about unbalanced brackets.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



Comments:
--------------------------------------------------------------------------------

On 2020-08-12T16:59:50Z, 9214, commented:
<https://github.com/red/red/issues/4528#issuecomment-672995091>

    Lexer does not seem to track balanced/unbalanced delimiters at all, so what it reports in the case about is a by-product of one of the failed rules, probably `word-rule`.

--------------------------------------------------------------------------------

On 2022-06-19T16:16:12Z, hiiamboris, commented:
<https://github.com/red/red/issues/4528#issuecomment-1159768683>

    I had to dissect 8k LOC script today, just to find this issue again :)

