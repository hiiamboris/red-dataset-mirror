
#5465: SYMBOL! has no value error
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 10 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/5465>

**Describe the bug**
Trying to copy a function context from inside the function itself I have made a mistake while coding, using global word instead a local one. This has triggered the following error: 

```
*** Script Error: symbol! has no value
*** Where: reduce
*** Near : set f-self reduce words-of context? 'x
*** Stack: make-extra 
```


 

**To reproduce**

Run this code:

```
make-structure-split: func [
	"Makes a structure accepting KEYS and VALUES split"
	type [word! datatype!] "Any of TABLE! MAP! OBJECT!"
	keys [block!] "A list of keys as STRING! WORD! SET-WORD! or any accepted type by datatype"
	values [block!] "The values"
	/local
	out-data
] [
	case [
		type = object! [out-data: copy []]
		type = map! [out-data: copy #() ]
		type = 'table! [out-data: copy/deep [[][]]]
	]
	either (length? keys) = (length? values) [
		forall keys [
			case [
				type = map! [put out-data keys/1 :values/(index? keys)]
				type = object! [append out-data reduce [to-set-word keys/1 :values/(index? keys)]]
				type = 'table! [append out-data/1 keys/1 append/only out-data/2 :values/(index? keys)]
			]
		]	
	] [
		cause-error 'keys-data-length-differs
	]

	case [
		type = object! [out-data: make type out-data] 
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
	f-self: make-structure-split object! words-of context? 'data reduce words-of context? 'data 
	set f-self reduce words-of context? 'x ;<<<<<<--------- Not in function context
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

On 2024-01-15T20:50:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/5465#issuecomment-1892751122>

    You should clean up your code from the 99% of irrelevant crap before posting :)

--------------------------------------------------------------------------------

On 2024-01-15T21:20:57Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5465#issuecomment-1892776300>

    > You should clean up your code from the 99% of irrelevant crap before posting :)
    
    This is the minimum version I was able to create that triggers the error. 

--------------------------------------------------------------------------------

On 2024-01-15T23:17:10Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5465#issuecomment-1892862970>

    We are lucky, I am less tired than when I arrived at home and an idea to shorten the code has come. Here is the "short version". Keep the popcorn for the next time!
    ```
    make-extra: func [
    	data 
    	f-self
    ] [
    
    	f-self: make object! [data f-self: none ]
    	set f-self reduce words-of context? 'x
    	
    ] 
    make-extra 1 2
    ```

--------------------------------------------------------------------------------

On 2024-01-16T11:43:42Z, dockimbel, commented:
<https://github.com/red/red/issues/5465#issuecomment-1893579312>

    That is still not the "short version", as 90% of your code is still unrelated to the code that produces that error:
    
    ```
    >> reduce words-of context? 'x
    *** Script Error: symbol! has no value
    *** Where: reduce
    ```
    
    I do not understand what you were expecting there by reducing all the words from global context other than an error on the first word which has no value (unset word)....
    
    ```
    >> w: words-of system/words
    == [datatype! unset! none! logic! block! paren! string! file! url! char! integer! float! symbol! ...
    >> w/13
    == symbol!
    >> get w/13
    *** Script Error: symbol! has no value
    *** Where: get
    *** Near : get w/13
    *** Stack:
    >> w/14
    == context!
    >> get w/14
    *** Script Error: context! has no value
    *** Where: get
    *** Near : get w/14
    *** Stack:  
    ```

--------------------------------------------------------------------------------

On 2024-01-16T18:30:47Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5465#issuecomment-1894301327>

    Thank you, my mistake. `values-of` is the only way to safely get the values of a context and also `set/any` is what I forgot.
     

