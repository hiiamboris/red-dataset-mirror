
#5287: printf not working when call from Red Routine. Works in R/S. Apparently Windows only issue.
================================================================================
Issue is closed, was reported by TimeSlip and has 2 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/5287>

In a purely R/S context, printf works. However, when called from Red such as in a routine or a call to a R/S function that contains it, it simply prints an LF. 

```
Red/System [
    Title: "test-string.reds"
]

reds_test_string: func [][
    printf ["Testing a call from Red: %s" "Hello World."]
]
```
From Red:
```
Red [
    Title: "test-string.red"
]

#system [ #include %test-string.reds]

red_test_string_func: routine [][
    reds_test_string
]

red_test_string_func 
```

I am using:
red-toolchain 0.6.4 
downloaded 2/25/23
Windows 10 Pro 64 bit Intel



Comments:
--------------------------------------------------------------------------------

On 2023-02-27T03:27:12Z, qtxie, commented:
<https://github.com/red/red/issues/5287#issuecomment-1445637935>

    The libc's stdout has been set to unicode mode in Red runtime. https://github.com/red/red/blob/master/runtime/platform/win32.reds#L607
    
    The `unicode?` setting is forced to be true when compiling with Red runtime. Using `wprintf` to work with it.
    ```
    Red []
    
    #system [
    	#import [
    		LIBC-file cdecl [
    			wprintf: 	 "wprintf"	[[variadic]]
    		]
    	]
    	
    	reds_test_string: func [][
    		wprintf [#u16 "Testing a call from Red: %s" #u16 "Hello World."]
    	]
    ]
    
    red_test_string_func: routine [
    "Test the r/s function"
    ][
    	reds_test_string
    ]
    
    red_test_string_func 
    ```

