
#5466: cannot set on-change* field to none! datatype
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 10 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/5466>

**Describe the bug**

SECOND ERROR

As before, I was trying to duplicate a function context. I used a different MAKE-SKELETON and also a different line in the main function. This caused another kind of error duplication on a context of a word not inside the function used as a mistake

```
** Script Error: cannot set on-change* field to none! datatype
*** Where: make
*** Near : f-self: make object! make-skeleton words-of 
*** Stack: make-extra 
```


**To reproduce**

Run this code:

```
make-skeleton: func [
	"Creates an empty object prototype providing its words"
	words  [block!]  "the words or set-words of the object"
	/local 
	s
	out-data 
	word 
	] [

	s: system/words
	out-data: s/copy []
	if not s/empty? words [
		forall words [
			word: s/first words
			either not any [word? word set-word? word] [
				make error! rejoin ["word: > " word " < is not of word type"]
			] [
				append out-data to-set-word word
			]
		]
		append out-data none
		
	]
	out-data
]


make-extra: func [
       "Creates the /extra field in faces"
	data 
	col
	gui-cfg
	data-cfg
	/libs
	validation-libraries
	/id
	field-id
	f-self
] [
	f-self: make object! make-skeleton words-of context? 'x ;<<<----------
	set f-self reduce words-of context? 'x
;...remaining code omitted
] 

make-extra a: 1 b: 2 c: 3 d: 4
```

**Platform version**
```
RED: [ branch: "master" tag: #v0.6.4 ahead: 5087 date: 14-Jan-2024/8:37:32 commit: #7e50e5d36ac35668c5e8d43f15af804318af6570 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22621 ]
```


Comments:
--------------------------------------------------------------------------------

On 2024-01-15T20:52:10Z, hiiamboris, commented:
<https://github.com/red/red/issues/5466#issuecomment-1892752569>

    Same [comment](https://github.com/red/red/issues/5465#issuecomment-1892751122) here

--------------------------------------------------------------------------------

On 2024-01-15T23:26:36Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5466#issuecomment-1892868513>

    Here is the short version.
    
    ```
    make-extra: func [
    
    	field-id
    	f-self
    ] [
    	f-self: copy context? 'x
    	set f-self reduce words-of context? 'x
    ] 
    
    make-extra 1 2
    ```

--------------------------------------------------------------------------------

On 2024-01-16T12:29:29Z, dockimbel, commented:
<https://github.com/red/red/issues/5466#issuecomment-1893647815>

    First, you cannot start a ticket with "SECOND ERROR  As before, [...]". That makes no sense. A ticket must be **_self-contained_** and **_self-explanatory_**. A ticket is not a chapter in a book. If it relates to another one, that can be added in the description, but **_cannot replace_** a proper description.
    
    Second, there is no issue in the "short version". You are just trying to set a word to an unset value without using `set/any`...
    
    ```
    >> w: words-of system/words
    == [datatype! unset! none! logic! block! paren! string! file! url! char! integer! float! symbol! ...
    >> set/any first find w 'on-change* ()
    >>
    ```
    
    Third the error and its location in the first example do not match with the second example! Attempting to set an event handler in an object at creation time, to a non-function value is currently not allowed:
    
    ```
    >> o: context [on-change*: none]
    *** Script Error: cannot set on-change* field to none! datatype
    *** Where: make
    ```

--------------------------------------------------------------------------------

On 2024-01-16T15:39:20Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5466#issuecomment-1893999340>

    Thank you for the answer. The `on-change*` error was for me suspicius and it is still so. It seems that it belongs to `COPY` code of the context inner fields that do not check for unset value. In fact, you can genate the error with just `COPY`
    
    ```
    copy-problem: func [
    	/local
    	ctx
    ] [
    	ctx: copy context? 'x
    ] 
    
    copy-problem
    ```

--------------------------------------------------------------------------------

On 2024-01-16T15:44:44Z, dockimbel, commented:
<https://github.com/red/red/issues/5466#issuecomment-1894009302>

    1. You do not need to wrap such code in a function to show the error:
    ```
    >> copy context? 'x
    *** Script Error: cannot set on-change* field to unset! datatype
    *** Where: copy
    *** Near : copy context? 'x
    *** Stack: 
    ```
    
    2. This is the expected behavior. `copy` on an object will copy the context, then fill it with the values from the prototype object. When it reaches the `on-change*` field, it will try to set it to `unset` and get rejected because of the above mentioned rule.

