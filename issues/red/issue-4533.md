
#4533: [Compiler] MAKE doesn't copy function body inner series at all
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[type.compiler]
<https://github.com/red/red/issues/4533>

Related to  https://github.com/red/red/issues/4523

**Describe the bug**

Compiler does not copy any inner series, even paths - unlike interpreter which currently copies blocks, parens and all paths. Without paths copied, bind errors are very likely. Without blocks and strings - cache-related errors.

Compile & run this:
```
Red []

foreach value compose/only [
	(make block! [])
	(make hash!  [])
	(make paren! [])
	""
	%""
	@
	(make tag! "")
	'a/b
	a/b
	:a/b
	a/b:
	#{}
	(make vector! [])
	(make image! 0x0)
][
	o: make object! [f: func [] compose/only [(value)]]
	p: make o [] ()
	print [either same? first body-of :o/f first body-of :p/f ["SAME"]["copied"] tab mold value]
]
```
Output is:
```
SAME    []                   
SAME    make hash! []        
SAME    ()                   
SAME    ""                   
SAME    %""                  
SAME    @                    
SAME    <>                   
SAME    'a/b                 
SAME    a/b                  
SAME    :a/b                 
SAME    a/b:                 
SAME    #{}                  
SAME    make vector! []      
SAME    make image! [0x0 #{}]
```
Interpreted output:
```
copied  []                    
SAME    make hash! []         
copied  ()                    
SAME    ""                    
SAME    %""                   
SAME    @                     
SAME    <>                    
copied  'a/b                  
copied  a/b                   
copied  :a/b                  
copied  a/b:                  
SAME    #{}                   
SAME    make vector! []       
SAME    make image! [0x0 #{}] 
```

Actually the whole body is not copied :(
```
Red []
o: make object! [f: func [] []]
p: make o []
probe same? body-of :o/f body-of :p/f
```
Compiled: `true`
Interpreted: `false`

**Expected behavior**

As interpreted - whatever will be decided on #4523 

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



Comments:
--------------------------------------------------------------------------------

On 2020-06-19T17:58:01Z, greggirwin, commented:
<https://github.com/red/red/issues/4533#issuecomment-646793638>

    This behavior has to be the same for both, or we'll all go mad. 

--------------------------------------------------------------------------------

On 2021-02-02T16:37:24Z, dockimbel, commented:
<https://github.com/red/red/issues/4533#issuecomment-771770525>

    There is a problem with your test code, you are wrapping the series to test for into a function's body (`f: func [] compose/only [(value)]`). Why not simply reference them from the object as it's what we want to test for? Object function's inheritance processing is different between the compiler and the interpreter, so in your test code, the results are just showing that difference, which should be less impacting for end users as long as you don't store literal data structures inside your object's function bodies (_though still need to be addressed at some point_).
    
    By setting the nested series to object's words directly, the compiler and interpreter behave the same way:
    ```
    foreach value compose/only [
    	(make block! [])
    	(make hash!  [])
    	(make paren! [])
    	""
    	%""
    	@
    	(make tag! "")
    	'a/b
    	a/b
    	:a/b
    	a/b:
    	#{}
    	(make vector! [])
    	(make image! 0x0)
    ][
    	o: make object! [f: compose/only [(value)]]
    	p: make o [] ()
    	print [either same? first :o/f first :p/f ["SAME"]["copied"] tab mold value]
    ]
    ```
    Compiled code output:
    ```
    copied  []
    copied  make hash! []
    copied  ()
    copied  ""
    copied  %""
    copied  @
    copied  <>
    copied  'a/b
    copied  a/b
    copied  :a/b
    copied  a/b:
    copied  #{}
    copied  make vector! []
    SAME    make image! [0x0 #{}]
    ```
    Interpreted output:
    ```
    copied 	[]
    copied 	make hash! []
    copied 	()
    copied 	""
    copied 	%""
    copied 	@
    copied 	<>
    copied 	'a/b
    copied 	a/b
    copied 	:a/b
    copied 	a/b:
    copied 	#{}
    copied 	make vector! []
    SAME 	make image! [0x0 #{}]
    ```
    
    The functions inheritance different behavior is hard to solve, as the compiler has much stricter constraints in that case than the interpreter. I'll give it a new try now.

--------------------------------------------------------------------------------

On 2021-02-02T16:59:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/4533#issuecomment-771789829>

    OK I misnamed it then ;)
    No problem with test code itself!
    IIRC the issue arose when I tried using a static `hash!` in object's function as local cache.
    That or some `bind` craziness...

